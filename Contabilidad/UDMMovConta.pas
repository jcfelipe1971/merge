unit UDMMovConta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDataSet, FIBDatabase, FIBQuery, FIBTableDataSet,
  UFIBModificados, HYFIBQuery, FIBDataSetRO, StdCtrls, Mask, DBCtrls,
  FIBDataSetRW;

type
  TDMMovConta = class(TDataModule)
     DSxCuentas: TDataSource;
     DSQMApuntes: TDataSource;
     QMApuntes: TFIBTableSet;
     DSQMAsientos: TDataSource;
     xTipos: TFIBDataSetRO;
     DSxTipos: TDataSource;
     QMAsientos: TFIBTableSet;
     QMAsientosEMPRESA: TIntegerField;
     QMAsientosEJERCICIO: TIntegerField;
     QMAsientosCANAL: TIntegerField;
     QMAsientosRIC: TIntegerField;
     QMAsientosTIPO: TFIBStringField;
     QMAsientosFECHA: TDateTimeField;
     QMAsientosDEBE: TFloatField;
     QMAsientosHABER: TFloatField;
     QMAsientosTITULO: TFIBStringField;
     QMAsientosFIRME: TIntegerField;
     QMAsientosSALDO: TFloatField;
     QMApuntesEMPRESA: TIntegerField;
     QMApuntesEJERCICIO: TIntegerField;
     QMApuntesCANAL: TIntegerField;
     QMApuntesRIC: TIntegerField;
     QMApuntesLINEA: TIntegerField;
     QMApuntesCUENTA: TFIBStringField;
     QMApuntesIMPORTE: TFloatField;
     QMApuntesDOC_NUMERO: TIntegerField;
     QMApuntesDOC_SERIE: TFIBStringField;
     QMApuntesDOC_FECHA: TDateTimeField;
     xCuentas: TFIBDataSetRO;
     QMApuntesCargo: TStringField;
     QMApuntesAbono: TStringField;
     TLocal: THYTransaction;
     QMAsientosASIENTO: TIntegerField;
     QMApuntesTEXTO: TFIBStringField;
     QMApuntesSIGNO: TFIBStringField;
     xDatosExtendido: TFIBDataSetRO;
     DSxDatosExtendido: TDataSource;
     xDatosExtendidoTIPO: TFIBStringField;
     xDatosExtendidoTERCERO: TIntegerField;
     xDatosExtendidoNOMBRE_R_SOCIAL: TFIBStringField;
     xDatosExtendidoTIPO_MAESTRO: TFIBStringField;
     xDatosExtendidoMAESTRO: TIntegerField;
     xDatosExtendidoMODO_IVA: TIntegerField;
     xDatosExtendidoTIT_MODO_IVA: TFIBStringField;
     xDatosExtendidoSIGNO_IVA: TFIBStringField;
     xDatosExtendidoCUENTA: TFIBStringField;
     xDatosExtendidoTIT_CUENTA: TFIBStringField;
     xDatosExtendidoREGISTRO: TIntegerField;
     xDatosExtendidoFORMA_PAGO: TFIBStringField;
     xDatosExtendidoTIT_FORMA_PAGO: TFIBStringField;
     xDatosExtendidoBASE_IMPONIBLE: TFloatField;
     xDatosExtendidoDOC_NUMERO: TIntegerField;
     xDatosExtendidoDOC_SERIE: TFIBStringField;
     xDatosExtendidoTIT_DOC_SERIE: TFIBStringField;
     xDatosExtendidoNIF: TFIBStringField;
     xDatosExtendidoC_IVA: TFloatField;
     xDatosExtendidoC_REC: TFloatField;
     xDatosExtendidoC_RET: TFloatField;
     xDatosExtendidoLIQUIDO: TFloatField;
     xDatosExtendidoTOTAL: TFloatField;
     xDatosExtendidoRGC: TIntegerField;
     xDatosExtendidoREG: TIntegerField;
     xRecibos: TFIBDataSetRW;
     DSxRecibos: TDataSource;
     xRecibosTIPO_MAESTRO: TFIBStringField;
     xRecibosCUENTA_CP: TFIBStringField;
     xRecibosTIT_CUENTA: TFIBStringField;
     xRecibosMAESTRO: TIntegerField;
     xRecibosNOMBRE_R_SOCIAL: TFIBStringField;
     xRecibosSIGNO: TFIBStringField;
     xRecibosREGISTRO: TIntegerField;
     xRecibosLINEA: TIntegerField;
     xRecibosVENCIMIENTO: TDateTimeField;
     xRecibosLIQUIDO: TFloatField;
     xRecibosPAGADO: TIntegerField;
     xRecibosIMPAGADO: TIntegerField;
     xRecibosMONEDA: TFIBStringField;
     xRecibosLIQUIDO_CANAL: TFloatField;
     xRecibosMONEDA_CAN: TFIBStringField;
     xRecibosRECIBIDO: TIntegerField;
     QMAsientosTIPO_ASIENTO_KRI: TFIBStringField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMApuntesPROYECTO: TIntegerField;
     QMApuntesTITULO_PROYECTO: TStringField;
     TUpdate: THYTransaction;
     QMApuntesCUENTA_PGC: TIntegerField;
     QMAsientosID_ASIENTO: TIntegerField;
     QMApuntesPUNTEO: TIntegerField;
     QMApuntesFECHA_PUNTEO: TDateTimeField;
     procedure DMMovContaCreate(Sender: TObject);
     procedure QMApuntesCargoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMApuntesAbonoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMApuntesAfterOpen(DataSet: TDataSet);
     procedure DMMovContaDestroy(Sender: TObject);
     procedure QMAsientosAfterScroll(DataSet: TDataSet);
     procedure QMApuntesTITULO_PROYECTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAsientosAfterOpen(DataSet: TDataSet);
     procedure xCuentasBeforeOpen(DataSet: TDataSet);
     procedure QMAsientosBeforeClose(DataSet: TDataSet);
     procedure QMApuntesBeforeClose(DataSet: TDataSet);
     procedure QMAsientosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     Posicionando: boolean;
  public
     { Public declarations }
     SQLBase: TStrings;
     LocalMascaraN: string;
     procedure Refresca;
     function ABorrador: integer;
     procedure EliminaRic;
     // procedure posiciona(RIC: integer);
     procedure BusquedaCompleja;
     procedure OrdenarSigno;
     procedure OrdenarLinea;
     procedure CambiaCanal(Canal: string);
     procedure FiltraDatosExtendido;
     procedure MostrarRecibos(var Cerrar: boolean);
     procedure DatosCartera(var Registro: integer; var ok: boolean; var Ejercicio: integer; var Signo: string);
     procedure DatosRecibo(var Empresa, Ejercicio, Canal, Registro: integer; var Signo: string; var Agrupado: boolean);
     function DameCuenta: string;
     function DameCuentaPGC: integer;
     procedure RefrescaApunte;
     function CuentaCierre(Cuenta: string): boolean;
  end;

var
  DMMovConta : TDMMovConta;

implementation

uses UEntorno, UFormGest, UUtiles, UDMMain, UFBusca;

{$R *.DFM}

procedure TDMMovConta.DMMovContaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM CON_CUENTAS_ASIENTOS ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = :EMPRESA AND ');
  SQLBase.Add(' EJERCICIO = :EJERCICIO AND ');
  SQLBase.Add(' CANAL = :CANAL ');
  SQLBase.Add(' ORDER BY ASIENTO ');

  QMAsientos.SelectSQL.Assign(SQLBase);

  QMAsientosDEBE.DisplayFormat := MascaraN;
  QMAsientosHABER.DisplayFormat := MascaraN;
  QMApuntesIMPORTE.DisplayFormat := MascaraN;
  xDatosExtendidoBASE_IMPONIBLE.DisplayFormat := MascaraN;
  xDatosExtendidoC_IVA.DisplayFormat := MascaraN;
  xDatosExtendidoC_REC.DisplayFormat := MascaraN;
  xDatosExtendidoC_RET.DisplayFormat := MascaraN;
  xDatosExtendidoLIQUIDO.DisplayFormat := MascaraN;
  xDatosExtendidoTOTAL.DisplayFormat := MascaraN;
  xRecibosLIQUIDO_CANAL.DisplayFormat := MascaraN;
  xRecibosVENCIMIENTO.DisplayFormat := ShortDateFormat;

  Posicionando := False;

  DMMain.FiltraTabla(QMAsientos, '11100', True);
end;

procedure TDMMovConta.DMMovContaDestroy(Sender: TObject);
begin
  SQLBase.Destroy;
end;

procedure TDMMovConta.Refresca;
var
  Empresa, Ejercicio, Canal, RIC : integer;
begin
  Empresa := QMAsientosEMPRESA.AsInteger;
  Ejercicio := QMAsientosEJERCICIO.AsInteger;
  Canal := QMAsientosCANAL.AsInteger;
  RIC := QMAsientosRIC.AsInteger;

  Posicionando := True;
  try
     with QMAsientos do
     begin
        DisableControls;
        try
           Close;
           Open;
           while ((not EOF) and not ((QMAsientosEMPRESA.AsInteger = Empresa) and
                 (QMAsientosEJERCICIO.AsInteger = Ejercicio) and
                 (QMAsientosCANAL.AsInteger = Canal) and
                 (QMAsientosRIC.AsInteger = RIC))) do
              Next;
        finally
           EnableControls;
        end;
     end;
  finally
     QMAsientosAfterScroll(QMAsientos);
     Posicionando := False;
  end;
end;

function TDMMovConta.ABorrador: integer;
begin
  Result := QMAsientosRIC.AsInteger;
  if not ConfirmaMensaje(Format(_('Está seguro de querer traspasar a Borrador el RIC Nº: %d'), [Result])) then
     Result := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_DE_ASIENTO (:EMPRESA, :EJERCICIO, :CANAL, :RIC, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEmpresa.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEjercicio.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCanal.AsInteger;
        Params.ByName['RIC'].AsInteger := Result;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['RIB'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Result = 0) then
     Result := -2;
  if ((Result <> -1) or (Result <> -2)) then
     Refresca;
end;

procedure TDMMovConta.EliminaRic;
begin
  if ((QMAsientosRIC.AsInteger <> 0) and ConfirmaMensaje(Format(_('Está seguro de querer eliminar el R.I.C. Nº: %d'), [QMAsientosRIC.AsInteger]))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_BORRA_RIC (?EMPRESA, ?EJERCICIO, ?CANAL, ?RIC, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMAsientosCanal.AsInteger;
           Params.ByName['RIC'].AsInteger := QMAsientosRIC.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refresca;
  end;
end;

procedure TDMMovConta.QMApuntesCargoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMApuntesSIGNO.AsString = 'D') then
     Text := QMApuntesCUENTA.AsString;
end;

procedure TDMMovConta.QMApuntesAbonoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMApuntesSIGNO.AsString = 'H') then
     Text := QMApuntesCUENTA.AsString;
end;

{
procedure TDMMovConta.Posiciona(RIC: integer);
begin
  //Refresca;
  QMAsientos.locate('RIC', RIC, []);
end;
}

procedure TDMMovConta.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAsientos, '11100', True);
end;

procedure TDMMovConta.QMApuntesAfterOpen(DataSet: TDataSet);
begin
  xCuentas.Open;
  xProyectos.Open;
end;

procedure TDMMovConta.OrdenarSigno;
begin
  //Cambiamos el orden de los apuntes, para que estén agrupados los apuntes del
  // debe y del haber
  with QMApuntes do
  begin
     Close;
     Ordenar('SIGNO, LINEA');
     Open;
  end;
end;

procedure TDMMovConta.OrdenarLinea;
begin
  //Cambiamos el orden de los apuntes, para que estén ordenados por línea
  with QMApuntes do
  begin
     Close;
     Ordenar('LINEA');
     Open;
  end;
end;

procedure TDMMovConta.Cambiacanal(Canal: string);
var
  CanalInt : integer;
begin
  if (Canal <> '') then
     CanalInt := StrToInt(Canal)
  else
     CanalInt := REntorno.Canal;

  QMAsientos.Close;
  QMAsientos.Params.ByName['CANAL'].AsInteger := CanalInt;
  QMAsientos.Open;
end;

procedure TDMMovConta.FiltraDatosExtendido;
begin
  // Solo usamos cuando se ven los datos

  with xDatosExtendido do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
     Params.ByName['RIC'].AsInteger := QMAsientosRIC.AsInteger;
     Open;
  end;
end;

procedure TDMMovConta.MostrarRecibos(var Cerrar: boolean);
var
  Moneda : string;
begin
  with xRecibos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
     Params.ByName['RIC'].AsInteger := QMAsientosRIC.AsInteger;
     Params.ByName['TIPO'].AsString := QMAsientosTIPO.AsString;
     Open;
  end;

  Moneda := xRecibosMONEDA.AsString;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  xRecibosLIQUIDO.DisplayFormat := LocalMascaraN;

  if (xRecibos.RecordCount > 0) then
     Cerrar := False
  else
     Cerrar := True;
end;

procedure TDMMovConta.DatosCartera(var Registro: integer; var Ok: boolean; var Ejercicio: integer; var Signo: string);
begin
  Ejercicio := QMAsientosEJERCICIO.AsInteger;
  Signo := xrecibosSIGNO.AsString;
  Registro := xrecibosREGISTRO.AsInteger;

  if (xRecibos.RecordCount > 0) then
     Ok := True
  else
     Ok := False;
end;

procedure TDMMovConta.DatosRecibo(var Empresa, Ejercicio, Canal, Registro: integer; var Signo: string; var Agrupado: boolean);
var
  Tipo : string;
begin
  Empresa := QMAsientosEMPRESA.AsInteger;
  Ejercicio := QMAsientosEJERCICIO.AsInteger;
  Canal := QMAsientosCANAL.AsInteger;
  Registro := xRecibosREGISTRO.AsInteger;
  Signo := xRecibosSIGNO.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DOC_TIPO FROM EMP_CARTERA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SIGNO = :SIGNO AND REGISTRO = :REGISTRO';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := xRecibosSIGNO.AsString;
        Params.ByName['REGISTRO'].AsInteger := xRecibosREGISTRO.AsInteger;
        ExecQuery;
        Tipo := FieldByName['DOC_TIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Agrupado := ((Tipo = 'AGC') or (Tipo = 'AGP') or (Tipo = 'AGA'));
end;

procedure TDMMovConta.QMAsientosAfterScroll(DataSet: TDataSet);
begin
  if (not Posicionando) then
  begin
     if ((REntorno.ContabilidadRestringida) and (Trim(QMAsientosTIPO.AsString) > '')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT RESTRICCION FROM SYS_TIPO_ASIENTO WHERE TIPO = ''' + QMAsientosTIPO.AsString + '''';
              ExecQuery;
              if (FieldByName['RESTRICCION'].AsInteger = 1) then
                 QMApuntes.Close
              else
                 QMApuntes.Open;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMMovConta.QMApuntesTITULO_PROYECTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xProyectos.Close;
  xProyectos.Open;
  Text := xProyectos.FieldByName('TITULO').AsString;
end;

procedure TDMMovConta.QMAsientosAfterOpen(DataSet: TDataSet);
begin
  QMApuntes.Open;
  xTipos.Open;
end;

function TDMMovConta.DameCuenta: string;
begin
  Result := '';
  if ((QMApuntes.Active) and (QMApuntes.RecordCount > 0)) then
     Result := QMApuntesCUENTA.AsString;
end;

procedure TDMMovConta.RefrescaApunte;
begin
  QMApuntes.Refresh;
end;

procedure TDMMovConta.xCuentasBeforeOpen(DataSet: TDataSet);
begin
  xCuentas.Params.ByName['PGC'].AsInteger := REntorno.Pgc;
end;

function TDMMovConta.DameCuentaPGC: integer;
begin
  Result := 0;
  if ((QMApuntes.Active) and (QMApuntes.RecordCount > 0)) then
     Result := QMApuntesCUENTA_PGC.AsInteger;
end;

procedure TDMMovConta.QMAsientosBeforeClose(DataSet: TDataSet);
begin
  QMApuntes.Close;
  xTipos.Close;
end;

procedure TDMMovConta.QMApuntesBeforeClose(DataSet: TDataSet);
begin
  xCuentas.Close;
  xProyectos.Close;
end;

function TDMMovConta.CuentaCierre(Cuenta: string): boolean;
begin
  // Confirmamos que la cuenta sea de Cierre y no es de amortizaciones
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.Database;
        SQL.Add(' SELECT EMPRESA FROM CON_CUENTAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' CUENTA = :CUENTA AND ');
        SQL.Add(' PGC = :PGC AND ');
        SQL.Add(' REG_CIERRE = 0 AND');
        SQL.Add(' GESTION NOT IN (''106'', ''107'') AND ');
        SQL.Add(' TIPO = 5 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['PGC'].AsInteger := REntorno.PGC;
        ExecQuery;
        Result := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovConta.QMAsientosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_ASIENTOS', 'ID_ASIENTO');
end;

end.
