unit UDMFacturacionCuotasCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, SysUtils, FIBDataSetRO, HYFIBQuery,
  UFMControlErroresFactura;

type
  TDMFacturacionCuotasCli = class(TDataModule)
     QMCuotas: TFIBTableSet;
     DSQMCuotas: TDataSource;
     TLocal: THYTransaction;
     QMCuotasEMPRESA: TIntegerField;
     QMCuotasCLIENTE: TIntegerField;
     QMCuotasTERCERO: TIntegerField;
     QMCuotasTITULO: TFIBStringField;
     QMCuotasCUOTA: TIntegerField;
     QMCuotasLINEA: TIntegerField;
     QMCuotasARTICULO: TFIBStringField;
     QMCuotasSUPLIDO: TIntegerField;
     QMCuotasFECHA: TDateTimeField;
     QMCuotasTIPO_DOC: TFIBStringField;
     QMCuotasAGRUPADA: TIntegerField;
     QMCuotasPROCESADA: TIntegerField;
     QMCuotasID_A: TIntegerField;
     QMCuotasID_S: TIntegerField;
     QMCuotasDESCRIPCION: TFIBStringField;
     QMCuotasIMPORTE: TFloatField;
     QMCuotasDESCUENTO: TFloatField;
     QMCuotasUNIDADES: TFloatField;
     TUpdate: THYTransaction;
     QMCuotasCANAL: TIntegerField;
     QMCuotasPUEDE_FACTURAR: TIntegerField;
     QMCuotasID_S_D: TIntegerField;
     QMCuotasPROYECTO: TIntegerField;
     QMCuotasTITULO_PROYECTO: TFIBStringField;
     QMCuotasCODIGO_INTERNO_PROYECTO: TFIBStringField;
     QMCuotasLINEA_DET: TIntegerField;
     QMCuotasUNIDAD_FOMENTO: TFloatField;
     procedure Graba(DataSet: TDataSet);
     procedure DMFacturaCuotasCreate(Sender: TObject);
     procedure QMCuotasNewRecord(DataSet: TDataSet);
     procedure QMCuotasIMPORTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCuotasDESCUENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCuotasAfterOpen(DataSet: TDataSet);
     procedure QMCuotasCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     Contador: integer;
     procedure AbreDocumentos(Contador: integer; Serie: string);
     procedure RefrescaDatos;
  public
     { Public declarations }
     procedure MarcarTodo;
     procedure DesMarcarTodo;
     procedure Traspasar(FechaFactura: TDateTime; Serie: string; ValorUF: double);
     function DameFacturados(Serie, tipo: string; contador: integer): boolean;
     procedure MuestraErrores;
     function HayErrores: boolean;
     procedure CalculaCuotas;
     procedure DameMinMaxFechaCliente(var min_fecha, max_fecha: TDateTime; var min_cliente, max_cliente: integer);
     procedure MarcarPorFecha(fecha_ini, fecha_fin: TDateTime; modo: integer);
     procedure MarcarPorCliente(cliente_ini, cliente_fin: integer; modo: integer);
  end;

var
  DMFacturacionCuotasCli : TDMFacturacionCuotasCli;

implementation

uses UDMMain, UEntorno, UUtiles, UFMFacturas, UFMAlbaranes, UFParada,
  UFMain, Controls;

{$R *.DFM}

procedure TDMFacturacionCuotasCli.DMFacturaCuotasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCuotasIMPORTE.DisplayFormat := MascaraE;
  QMCuotasDESCUENTO.DisplayFormat := MascaraP;
  QMCuotasUNIDADES.DisplayFormat := MascaraI;

  with QMCuotas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  end;
end;

procedure TDMFacturacionCuotasCli.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMFacturacionCuotasCli.QMCuotasNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFacturacionCuotasCli.MarcarTodo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_CLIENTES_CUOTAS_DETALLE_DOC SET PROCESADA = 1 WHERE EMPRESA = ?EMPRESA AND CANAL = ?CANAL AND ID_S = 0 AND PROCESADA = 0';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturacionCuotasCli.DesMarcarTodo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_CLIENTES_CUOTAS_DETALLE_DOC SET PROCESADA = 0 WHERE EMPRESA = ?EMPRESA AND CANAL = ?CANAL AND ID_S = 0 AND PROCESADA = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturacionCuotasCli.Traspasar(FechaFactura: TDateTime; Serie: string; ValorUF: double);
var
  Serie_a_facturar : string;
  Q : THYFIBQuery;
begin
  try
     Screen.Cursor := crHourGlass;

     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_CUOTAS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?FECHA, ?ENTRADA, ?VALORUF)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['FECHA'].AsDateTime := FechaFactura + Frac(REntorno.FechaTrab);
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['VALORUF'].AsFloat := ValorUF;
           // ExecQuery;
           TFParada.Create(Self).ExecQuery(Q);
           Contador := FieldByName['PROC_AUTO'].AsInteger;
           Serie_a_facturar := FieldByName['SERIE_A_FACTURAR'].AsString;

           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     AbreDocumentos(Contador, Serie_a_facturar);
     if (Serie <> Serie_a_facturar) then
        AbreDocumentos(Contador, Serie);

     RefrescaDatos;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TDMFacturacionCuotasCli.AbreDocumentos(Contador: integer; Serie: string);
begin
  // Comprobamos si existen documentos facturados

  if (DameFacturados(Serie, 'FAC', contador)) then
  begin
     FMain.EjecutaAccion(FMain.AFacturas);
     FMFacturas.AgrupacionPedidosFac(Serie, Contador);
  end;

  if (DameFacturados(Serie, 'ALB', contador)) then
  begin
     FMain.EjecutaAccion(FMain.AAlbaranes);
     FMAlbaranes.AgrupacionPedidos(Serie, Contador);
  end;
end;

function TDMFacturacionCuotasCli.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMFacturacionCuotasCli.DameFacturados(Serie, tipo: string; Contador: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'FAC') then
           SQL.Add(' SELECT VER.* FROM VER_CABECERAS_FACTURA VER ');
        if (Tipo = 'ALB') then
           SQL.Add(' SELECT VER.* FROM VER_CABECERAS_ALBARAN VER ');
        SQL.Add(' JOIN TMP_PROCESOS_AUTO TMP ');
        SQL.Add(' ON ');
        SQL.Add(' VER.EMPRESA = TMP.EMPRESA AND ');
        SQL.Add(' VER.EJERCICIO = TMP.EJERCICIO AND ');
        SQL.Add(' VER.CANAL = TMP.CANAL AND ');
        SQL.Add(' VER.SERIE = TMP.SERIE AND ');
        SQL.Add(' VER.TIPO = TMP.TIPO AND ');
        SQL.Add(' VER.RIG = TMP.RIG ');
        SQL.Add(' WHERE ');
        SQL.Add(' VER.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' VER.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' VER.CANAL = ?CANAL AND ');
        SQL.Add(' VER.SERIE = ?SERIE AND ');
        SQL.Add(' VER.TIPO = ?TIPO AND ');
        SQL.Add(' TMP.CONTADOR = ?CONTADOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CONTADOR'].AsInteger := Contador;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturacionCuotasCli.MuestraErrores;
begin
  // FMControlErroresFactura := TFMControlErroresFactura.Create (Self);
  // FMControlErroresFactura.ShowModal;
  // FMControlErroresFactura.Free;
end;

procedure TDMFacturacionCuotasCli.CalculaCuotas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CALCULA_CUOTAS_CLIENTE(?EMPRESA, ?CANAL, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DesMarcarTodo;
end;

procedure TDMFacturacionCuotasCli.QMCuotasIMPORTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraE, QMCuotasIMPORTE.AsFloat);
end;

procedure TDMFacturacionCuotasCli.QMCuotasDESCUENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraP, QMCuotasDESCUENTO.AsFloat);
end;

procedure TDMFacturacionCuotasCli.DameMinMaxFechaCliente(var min_fecha, max_fecha: TDateTime; var min_cliente, max_cliente: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_MIN_MAX_FECHA_CLI_CUOTA(?EMPRESA, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        min_fecha := FieldByName['MINIMO_FECHA'].AsDateTime;
        max_fecha := FieldByName['MAXIMO_FECHA'].AsDateTime;
        min_cliente := FieldByName['MINIMO_CLIENTE'].AsInteger;
        max_cliente := FieldByName['MAXIMO_CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturacionCuotasCli.MarcarPorFecha(fecha_ini, fecha_fin: TDateTime; modo: integer);
begin
  Fecha_Ini := HourIntoDate(Fecha_Ini, '00:00:00');
  Fecha_Fin := HourIntoDate(Fecha_Fin, '23:59:59');

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_MARCAR_CUOTAS_POR_FECHA(?EMPRESA, ?CANAL, ?FECHA_INI, ?FECHA_FIN, ?MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_INI'].AsDateTime := fecha_ini;
        Params.ByName['FECHA_FIN'].AsDateTime := fecha_fin;
        Params.ByName['MODO'].AsInteger := modo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturacionCuotasCli.MarcarPorCliente(cliente_ini, cliente_fin: integer; modo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_MARCAR_CUOTAS_POR_CLIENTE(?EMPRESA, ?CANAL, ?CLIENTE_INI, ?CLIENTE_FIN, ?MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE_INI'].AsInteger := cliente_ini;
        Params.ByName['CLIENTE_FIN'].AsInteger := cliente_fin;
        Params.ByName['MODO'].AsInteger := modo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturacionCuotasCli.QMCuotasAfterOpen(DataSet: TDataSet);
begin
  QMCuotasPROCESADA.ReadOnly := DataSet.RecordCount = 0;
end;

procedure TDMFacturacionCuotasCli.RefrescaDatos;
begin
  Refrescar(QMCuotas, 'CUOTA', QMCuotasCUOTA.AsInteger, True, True);
end;

procedure TDMFacturacionCuotasCli.QMCuotasCalcFields(DataSet: TDataSet);
begin
  /// Unidades serializadas que tiene el cliente
  /// PEDIDO.UNIDADES - (DEPOSITADAS - DEVUELTAS_REVISION)

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ');
        SQL.Add(' (SELECT PD.UNIDADES ');
        SQL.Add('     FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC D ');
        SQL.Add('     JOIN EMP_CLIENTES_CUOTAS C ON D.EMPRESA = C.EMPRESA AND D.CANAL = C.CANAL AND D.CLIENTE = C.CLIENTE AND D.CUOTA = C.CUOTA ');
        SQL.Add('     JOIN GES_CABECERAS_S PC ON C.ID_ORIGEN = PC.ID_S ');
        SQL.Add('     JOIN GES_DETALLES_S PD ON PC.ID_S = PD.ID_S ');
        SQL.Add('     WHERE ');
        SQL.Add('     D.EMPRESA = :EMPRESA AND ');
        SQL.Add('     D.CANAL = :CANAL AND ');
        SQL.Add('     D.CLIENTE = :CLIENTE AND ');
        SQL.Add('     D.CUOTA = :CUOTA AND ');
        SQL.Add('     D.LINEA = :LINEA) ');
        SQL.Add('     - ');
        SQL.Add('     ((SELECT COUNT(*) ');
        SQL.Add('     FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC D ');
        SQL.Add('     JOIN EMP_CLIENTES_CUOTAS C ON D.EMPRESA = C.EMPRESA AND D.CANAL = C.CANAL AND D.CLIENTE = C.CLIENTE AND D.CUOTA = C.CUOTA ');
        SQL.Add('     JOIN GES_CABECERAS_S PC ON C.ID_ORIGEN = PC.ID_S ');
        SQL.Add('     JOIN GES_DETALLES_S PD ON PC.ID_S = PD.ID_S ');
        SQL.Add('     JOIN EMP_ALQUILER A ON PC.ID_S = A.ID_S_PEC ');
        SQL.Add('     JOIN EMP_ALQUILER_REV R ON A.ID_ALQ = R.ID_ALQ ');
        SQL.Add('     JOIN GES_CABECERAS_S AC ON R.ID_S_ALB = AC.ID_S ');
        SQL.Add('     JOIN GES_CABECERAS_S_ALB ACA ON AC.ID_S = ACA.ID_S ');
        SQL.Add('     JOIN GES_CABECERAS_ST CM ON ACA.EMPRESA = CM.EMPRESA AND ACA.EJERCICIO = CM.EJERCICIO AND ACA.SERIE = CM.SERIE AND ACA.NUM_MOV_DEPOSITO = CM.RIG ');
        SQL.Add('     JOIN GES_DETALLES_ST DM ON CM.ID_ST = DM.ID_ST ');
        SQL.Add('     JOIN GES_DETALLES_SERIALIZACION S ON DM.EMPRESA = S.EMPRESA AND DM.EJERCICIO = S.EJERCICIO AND DM.SERIE = S.SERIE AND S.TIPO = ''MVE'' AND DM.RIG = S.RIG AND DM.LINEA = S.LINEA ');
        SQL.Add('     WHERE ');
        SQL.Add('     D.EMPRESA = :EMPRESA AND ');
        SQL.Add('     D.CANAL = :CANAL AND ');
        SQL.Add('     D.CLIENTE = :CLIENTE AND ');
        SQL.Add('     D.CUOTA = :CUOTA AND ');
        SQL.Add('     D.LINEA = :LINEA) ');
        SQL.Add('     - ');
        SQL.Add('     (SELECT COUNT(*) ');
        SQL.Add('     FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC D ');
        SQL.Add('     JOIN EMP_CLIENTES_CUOTAS C ON D.EMPRESA = C.EMPRESA AND D.CANAL = C.CANAL AND D.CLIENTE = C.CLIENTE AND D.CUOTA = C.CUOTA ');
        SQL.Add('     JOIN GES_CABECERAS_S PC ON C.ID_ORIGEN = PC.ID_S ');
        SQL.Add('     JOIN GES_DETALLES_S PD ON PC.ID_S = PD.ID_S ');
        SQL.Add('     JOIN EMP_ALQUILER A ON PC.ID_S = A.ID_S_PEC ');
        SQL.Add('     JOIN EMP_ALQUILER_REV R ON A.ID_ALQ = R.ID_ALQ ');
        SQL.Add('     JOIN GES_CABECERAS_S AC ON R.ID_S_ALB = AC.ID_S ');
        SQL.Add('     JOIN GES_CABECERAS_S_ALB ACA ON AC.ID_S = ACA.ID_S ');
        SQL.Add('     JOIN GES_CABECERAS_ST CM ON ACA.EMPRESA = CM.EMPRESA AND ACA.EJERCICIO = CM.EJERCICIO AND ACA.SERIE = CM.SERIE AND ACA.NUM_MOV_DEPOSITO = CM.RIG ');
        SQL.Add('     JOIN GES_DETALLES_ST DM ON CM.ID_ST = DM.ID_ST ');
        SQL.Add('     JOIN GES_DETALLES_SERIALIZACION S ON DM.EMPRESA = S.EMPRESA AND DM.EJERCICIO = S.EJERCICIO AND DM.SERIE = S.SERIE AND S.TIPO = ''MVS'' AND DM.RIG = S.RIG AND DM.LINEA = S.LINEA ');
        SQL.Add('     WHERE ');
        SQL.Add('     D.EMPRESA = :EMPRESA AND ');
        SQL.Add('     D.CANAL = :CANAL AND ');
        SQL.Add('     D.CLIENTE = :CLIENTE AND ');
        SQL.Add('     D.CUOTA = :CUOTA AND ');
        SQL.Add('     D.LINEA = :LINEA)) AS UNIDADES_EN_DEPOSITO');
        SQL.Add(' FROM RDB$DATABASE ');
        Params.ByName['EMPRESA'].AsInteger := QMCuotasEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCuotasCANAL.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCuotasCLIENTE.AsInteger;
        Params.ByName['CUOTA'].AsInteger := QMCuotasCUOTA.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMCuotasLINEA.AsInteger;
        ExecQuery;
        QMCuotasPUEDE_FACTURAR.AsInteger := BoolToInt(FieldByName['UNIDADES_EN_DEPOSITO'].AsFloat = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
