unit UDMCompensacionRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, HYFIBQuery;

type
  TDMCompensacionRecibos = class(TDataModule)
     TLocal: THYTransaction;
     TUptade: THYTransaction;
     xRecibosProveedor: TFIBTableSet;
     xRecibosCliente: TFIBTableSet;
     DSxRecibosProveedor: TDataSource;
     DSxRecibosCliente: TDataSource;
     xRecibosProveedorEMPRESA: TIntegerField;
     xRecibosProveedorEJERCICIO: TIntegerField;
     xRecibosProveedorCANAL: TIntegerField;
     xRecibosProveedorSIGNO: TFIBStringField;
     xRecibosProveedorREGISTRO: TIntegerField;
     xRecibosProveedorLINEA: TIntegerField;
     xRecibosProveedorCOD_CLI_PRO: TIntegerField;
     xRecibosProveedorVENCIMIENTO: TDateTimeField;
     xRecibosProveedorCTA_PAGO: TFIBStringField;
     xRecibosProveedorLIQUIDO: TFloatField;
     xRecibosProveedorDOC_NUMERO: TIntegerField;
     xRecibosProveedorDOC_SERIE: TFIBStringField;
     xRecibosProveedorDOC_FECHA: TDateTimeField;
     xRecibosProveedorDOC_TIPO: TFIBStringField;
     xRecibosProveedorRECIBIDO: TIntegerField;
     xRecibosProveedorENTRADA: TIntegerField;
     xRecibosProveedorEJERCICIO_AGRUPACION: TIntegerField;
     xRecibosProveedorLIQUIDO_CANAL: TFloatField;
     xRecibosProveedorMONEDA: TFIBStringField;
     xRecibosProveedorCAMBIO: TFloatField;
     xRecibosProveedorID_CARTERA: TIntegerField;
     xRecibosProveedorID_CARTERA_DETALLE: TIntegerField;
     xRecibosClienteEMPRESA: TIntegerField;
     xRecibosClienteEJERCICIO: TIntegerField;
     xRecibosClienteCANAL: TIntegerField;
     xRecibosClienteSIGNO: TFIBStringField;
     xRecibosClienteREGISTRO: TIntegerField;
     xRecibosClienteLINEA: TIntegerField;
     xRecibosClienteCOD_CLI_PRO: TIntegerField;
     xRecibosClienteVENCIMIENTO: TDateTimeField;
     xRecibosClienteCTA_PAGO: TFIBStringField;
     xRecibosClienteLIQUIDO: TFloatField;
     xRecibosClienteDOC_NUMERO: TIntegerField;
     xRecibosClienteDOC_SERIE: TFIBStringField;
     xRecibosClienteDOC_FECHA: TDateTimeField;
     xRecibosClienteDOC_TIPO: TFIBStringField;
     xRecibosClienteRECIBIDO: TIntegerField;
     xRecibosClienteENTRADA: TIntegerField;
     xRecibosClienteEJERCICIO_AGRUPACION: TIntegerField;
     xRecibosClienteLIQUIDO_CANAL: TFloatField;
     xRecibosClienteMONEDA: TFIBStringField;
     xRecibosClienteCAMBIO: TFloatField;
     xRecibosClienteID_CARTERA: TIntegerField;
     xRecibosClienteID_DOC: TIntegerField;
     xRecibosClienteID_CARTERA_DETALLE: TIntegerField;
     xRecibosProveedorID_DOC: TIntegerField;
     xTotales: TFIBDataSetRO;
     xTotalesCOBROS: TFloatField;
     xTotalesPAGOS: TFloatField;
     DSxTotales: TDataSource;
     xTotalesSALDO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xRecibosBeforePost(DataSet: TDataSet);
     procedure xRecibosBeforeInsert(DataSet: TDataSet);
     procedure xRecibosAfterPost(DataSet: TDataSet);
     procedure xRecibosENTRADAChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xTotalesCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     CuentaCaja: string;
     TerceroAnterior: integer;
     procedure RefrescaTotales;
     procedure LimpiaEntradas;
  public
     { Public declarations }
     procedure RefrescarDatos(Tercero: integer; Fecha: TDateTime);
     procedure Agrupa(TipoFac: string; CodCliPro: integer; Fecha: TDateTime; Serie: string);
  end;

var
  DMCompensacionRecibos : TDMCompensacionRecibos;

implementation

uses UDMMain, UEntorno, UFMain, UUtiles;

{$R *.dfm}

{ TDMCompensacionRecibos }

procedure TDMCompensacionRecibos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xRecibosProveedor, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRecibosCliente, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTotales, MascaraN, MascaraI, ShortDateFormat);

  // Busco la minima cuenta de caja del maximo nivel
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 CUENTA FROM CON_CUENTAS WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND CUENTA STARTING WITH ''5700'' AND PGC=?PGC ORDER BY NIVEL DESC, CUENTA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PGC'].AsInteger := REntorno.PGC;
        ExecQuery;
        CuentaCaja := FieldByName['CUENTA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Por las dudas quede algo marcado
  TerceroAnterior := 0;
  LimpiaEntradas;
end;

procedure TDMCompensacionRecibos.DataModuleDestroy(Sender: TObject);
begin
  LimpiaEntradas;
end;

procedure TDMCompensacionRecibos.RefrescarDatos(Tercero: integer; Fecha: TDateTime);
begin
  // Si cambia el tercero, borro lo que se haya marcado
  if (Tercero <> TerceroAnterior) then
  begin
     LimpiaEntradas;
     TerceroAnterior := Tercero;
  end;

  with xRecibosProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['VENCIMIENTO'].AsDateTime := Fecha;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
  with xRecibosCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['VENCIMIENTO'].AsDateTime := Fecha;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
  RefrescaTotales;
end;

procedure TDMCompensacionRecibos.xRecibosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsEdit) then
  begin
     if (DataSet.FieldByName('ENTRADA').AsInteger = REntorno.Entrada) then
        DataSet.FieldByName('EJERCICIO_AGRUPACION').Value := REntorno.Ejercicio
     else
        DataSet.FieldByName('EJERCICIO_AGRUPACION').Value := 0;
  end
  else
     DataSet.Cancel;
end;

procedure TDMCompensacionRecibos.xRecibosBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCompensacionRecibos.RefrescaTotales;
begin
  with xTotales do
  begin
     Close;
     // Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     // Params.ByName['EJERCICIO_AGRUPACION'].AsInteger := REntorno.Ejercicio;
     Open;
  end;
end;

procedure TDMCompensacionRecibos.xRecibosAfterPost(DataSet: TDataSet);
begin
  RefrescaTotales;
end;

procedure TDMCompensacionRecibos.xRecibosENTRADAChange(Sender: TField);
var
  Q : THYFIBQuery;
  DS : TDataSet;
begin
  DS := Sender.DataSet;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_INS_REC_MARC(?COD_CLI_PRO, ?SIGNO, ?TIPO,?CUENTA, ?CANTIDAD, ?IMPORTE, ?ENTRADA, ?RECIBOS)';
        Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
        Params.ByName['SIGNO'].AsString := DS.FieldByName('SIGNO').AsString;
        if ((DS.FieldByName('DOC_TIPO').AsString = 'FCR') or (DS.FieldByName('DOC_TIPO').AsString = 'AGR') or
           (DS.FieldByName('DOC_TIPO').AsString = 'NRA') or (DS.FieldByName('DOC_TIPO').AsString = 'AFA')) then
           Params.ByName['TIPO'].AsString := 'ACR'
        else
        if ((DS.FieldByName('DOC_TIPO').AsString = 'FAP') or (DS.FieldByName('DOC_TIPO').AsString = 'AGP') or
           (DS.FieldByName('DOC_TIPO').AsString = 'NRP') or (DS.FieldByName('DOC_TIPO').AsString = 'AFP')) then
           Params.ByName['TIPO'].AsString := 'PRO'
        else
           Params.ByName['TIPO'].AsString := 'CLI';
        Params.ByName['CUENTA'].AsString := CuentaCaja;
        Params.ByName['CANTIDAD'].AsFloat := 0;
        Params.ByName['IMPORTE'].AsFloat := DS.FieldByName('LIQUIDO').AsFloat;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        if (Sender.AsInteger = REntorno.Entrada) then
           Params.ByName['RECIBOS'].AsInteger := 1
        else
           Params.ByName['RECIBOS'].AsInteger := -1;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMCompensacionRecibos.LimpiaEntradas;
begin
  // Desmarco cualquier recibo marcado
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA = 0, ');
        SQL.Add(' EJERCICIO_AGRUPACION = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO_AGRUPACION = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ENTRADA = ?ENTRADA AND ');
        SQL.Add(' PAGADO = 0 AND ');
        SQL.Add(' AGRUPACION = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Vacio la tabla temporal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_CARTERA_CP_REC_MARC ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCompensacionRecibos.Agrupa(TipoFac: string; CodCliPro: integer; Fecha: TDateTime; Serie: string);
var
  Registro : integer;
  Signo : char;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT REGISTRO FROM E_CARTERA_AGRUPA_RECIBOS ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?COD_CLI_PRO, ?TIPO_DOC, ?FORMA_PAGO, ?FECHA, ?MODO, ?ENTRADA, ?TIPO_ASIENTO, ?SERIE, ?OBSERVACIONES, ?IMPORTE_GASTOS, ?CUENTA_GASTOS) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
        Params.ByName['TIPO_DOC'].AsString := TipoFac;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['FORMA_PAGO'].AsString := 'CON';
        Params.ByName['MODO'].AsInteger := -1; //Solo agrupa
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        if (TipoFac = 'FAC') then
           Params.ByName['TIPO_ASIENTO'].AsString := REntorno.Asiento_CAR_C
        else
           Params.ByName['TIPO_ASIENTO'].AsString := REntorno.Asiento_CAR_P;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['OBSERVACIONES'].AsString := '';
        Params.ByName['IMPORTE_GASTOS'].AsFloat := 0;
        Params.ByName['CUENTA_GASTOS'].AsString := '';
        ExecQuery;
        Registro := FieldByName['REGISTRO'].AsInteger;
        FreeHandle;
        if (Registro <> 0) then
        begin
           if (TipoFac = 'FAC') then
              Signo := 'C'
           else
              Signo := 'P';

           FMain.MuestraCartera(REntorno.Ejercicio, REntorno.Canal, Signo, Registro);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMCompensacionRecibos.xTotalesCalcFields(DataSet: TDataSet);
begin
  xTotalesSALDO.AsFloat := xTotalesPAGOS.AsFloat - xTotalesCOBROS.AsFloat;
end;

end.
