unit UDMAsistenteExpSaldos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TDMAsistenteExpSaldos = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     DSxMultiSeleccion: TDataSource;
     xMultiSeleccion: TFIBTableSet;
     xMultiSeleccionENTRADA: TIntegerField;
     xMultiSeleccionEMPRESA: TIntegerField;
     xMultiSeleccionEJERCICIO: TIntegerField;
     xMultiSeleccionCANAL: TIntegerField;
     xMultiSeleccionTITULO_CANAL: TFIBStringField;
     xMultiSeleccionALMACEN: TFIBStringField;
     xMultiSeleccionTITULO_ALMACEN: TFIBStringField;
     xMultiSeleccionMARCADO: TIntegerField;
     DSQMSaldosExp: TDataSource;
     QMSaldosExp: TFIBTableSet;
     QMSaldosExpENTRADA: TIntegerField;
     QMSaldosExpCUENTA: TFIBStringField;
     QMSaldosExpTITULO: TFIBStringField;
     QMSaldosExpDEBE: TFloatField;
     QMSaldosExpHABER: TFloatField;
     QMSaldosExpSALDO: TFloatField;
     QMSaldosExpMARCADO: TIntegerField;
     DSQMColumnas: TDataSource;
     QMColumnas: TFIBTableSet;
     xColExportar: TFIBDataSetRO;
     DSxColExportar: TDataSource;
     xColExportarNOMBRE_CAMPO: TFIBStringField;
     xColExportarNOMBRE_ENCAB: TFIBStringField;
     QMColumnasENTRADA: TIntegerField;
     QMColumnasNOMBRE_CAMPO: TFIBStringField;
     QMColumnasNOMBRE_ENCAB: TFIBStringField;
     QMColumnasMARCADO: TIntegerField;
     SPRangos: THYFIBQuery;
     xCta_Desde: TFIBDataSetRO;
     DSxCta_Desde: TDataSource;
     xCta_Hasta: TFIBDataSetRO;
     DSxCta_Hasta: TDataSource;
     xRecorre: TFIBDataSetRO;
     DSxRecorre: TDataSource;
     xRecorreENTRADA: TIntegerField;
     xRecorreCUENTA: TFIBStringField;
     xRecorreTITULO: TFIBStringField;
     xRecorreDEBE: TFloatField;
     xRecorreHABER: TFloatField;
     xRecorreSALDO: TFloatField;
     xRecorreMARCADO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure Actualiza_Cuenta(Tabla: TFIBDataSetRO; cuenta: string);
     procedure xMultiSeleccionMARCADOChange(Sender: TField);
     procedure QMSaldosExpNewRecord(DataSet: TDataSet);
     procedure QMColumnasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     WorkBook: _WorkBook;
     WorkSheet: _WorkSheet;
     LCID: integer;
     Fila, Columna: integer;
     function AlmacenDefecto: string;
     procedure NormalizarFechas(var desde, hasta: TDateTime);
     procedure NormalizarCadenas(var desde, hasta: string);
     function Multiseleccion: boolean;
     procedure AbrirSaldosExp;
     function EscribirEnExcel(aFila, aColumna: integer; Valor: variant): boolean;
     procedure AbrirColExportar;
     procedure BorrarTemporales;
     procedure AbrirSaldosSel;
  public
     { Public declarations }
     Cuent_Desde: string;
     Cuent_Hasta: string;
     Fecha_Desde: TDateTime;
     Fecha_Hasta: TDateTime;
     Nivel_Desde: smallint;
     Nivel_Hasta: smallint;
     Nivel_Filtro: smallint;
     SeccionDesde, SeccionHasta: string;
     Error: string;
     procedure Rangos;
     procedure RellenaMultiseleccion;
     procedure AbrirMultiSeleccion;
     procedure MarcarCanalActual;
     procedure MarcarCanales(Valor: smallint);
     procedure MarcarColumnas(Valor: smallint);
     procedure ProcesarFiltros(Apertura, Regularizacion, Cierre: boolean);
     procedure MarcarSaldosExp(Valor: smallint);
     function SaldosSeleccionados: boolean;
     function InicializarExcel: boolean;
     function CerrarExcel: boolean;
     function SalvarDatosEnExcel(Archivo: string): boolean;
     {function ExportarSaldos(ExpEncab: boolean): boolean; No se utiliza}
     procedure InsertarColumnas;
     procedure AbrirColumnas;
     function ColumnasSeleccionadas: boolean;
     procedure GrabarDatosColumnas;
     procedure InicializaProceso;
     function ExportarEncabezado: boolean;
     function Final: boolean;
     function Actual: string;
     procedure Siguiente;
     function ExportarSaldo: boolean;
  end;

var
  DMAsistenteExpSaldos : TDMAsistenteExpSaldos;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils, Windows;

{$R *.dfm}

procedure TDMAsistenteExpSaldos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMAsistenteExpSaldos.DataModuleDestroy(Sender: TObject);
begin
  BorrarTemporales;
end;

procedure TDMAsistenteExpSaldos.Actualiza_Cuenta(Tabla: TFIBDataSetRO; cuenta: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := cuenta;
     Open;
  end;
end;

procedure TDMAsistenteExpSaldos.Rangos;
begin
  with SPRangos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Fecha_Desde := FieldByName['F_DESDE'].AsDateTime;
     Fecha_Hasta := FieldByName['F_HASTA'].AsDateTime;
     Cuent_Desde := FieldByName['C_DESDE'].AsString;
     Cuent_Hasta := FieldByName['C_HASTA'].AsString;
     Close;
     FreeHandle;
  end;

  if (Fecha_Desde = 0) then
     Fecha_Desde := REntorno.FechaTrab;
  if (Fecha_Hasta = 0) then
     Fecha_Hasta := REntorno.FechaTrab;
  // Secciones
  SeccionDesde := '';
  SeccionHasta := '';
end;

procedure TDMAsistenteExpSaldos.RellenaMultiseleccion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_MULTISELECCION(?ENTRADA, ?EMPRESA, ?EJERCICIO, 0)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.AbrirMultiSeleccion;
begin
  with xMultiSeleccion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAsistenteExpSaldos.MarcarCanalActual;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_MULTISELECCION ');
        SQL.Add(' SET ');
        SQL.Add(' MARCADO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        SQL.Add(' AND EMPRESA = ?EMPRESA ');
        SQL.Add(' AND EJERCICIO = ?EJERCICIO ');
        SQL.Add(' AND CANAL = ?CANAL ');
        SQL.Add(' AND ALMACEN = ?ALMACEN ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := AlmacenDefecto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteExpSaldos.AlmacenDefecto: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN FROM ART_ALMACENES WHERE EMPRESA = ?EMPRESA AND DEFECTO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.xMultiSeleccionMARCADOChange(Sender: TField);
begin
  if (xMultiSeleccionCANAL.AsInteger = REntorno.Canal) and
     (xMultiSeleccionMARCADO.AsInteger = 0) then
     xMultiSeleccionMARCADO.AsInteger := 1;
end;

procedure TDMAsistenteExpSaldos.MarcarCanales(Valor: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_MULTISELECCION ');
        SQL.Add(' SET ');
        SQL.Add(' MARCADO = ?MARCADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        SQL.Add(' AND EMPRESA = ?EMPRESA ');
        SQL.Add(' AND EJERCICIO = ?EJERCICIO ');
        SQL.Add(' AND CANAL <> ?CANAL ');
        SQL.Add(' AND ALMACEN = ?ALMACEN ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := AlmacenDefecto;
        Params.ByName['MARCADO'].AsInteger := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xMultiSeleccion.Close;
  xMultiSeleccion.Open;
end;

procedure TDMAsistenteExpSaldos.NormalizarCadenas(var desde, hasta: string);
var
  aux : string;
begin
  if (desde > hasta) then
  begin
     aux := desde;
     desde := hasta;
     hasta := aux;
  end;
end;

procedure TDMAsistenteExpSaldos.NormalizarFechas(var desde, hasta: TDateTime);
var
  aux : TDateTime;
begin
  if (desde > hasta) then
  begin
     aux := desde;
     desde := hasta;
     hasta := aux;
  end;
end;

procedure TDMAsistenteExpSaldos.ProcesarFiltros(Apertura, Regularizacion, Cierre: boolean);
var
  Canal : smallint;
begin
  Canal := REntorno.Canal;
  if Multiseleccion then
     Canal := 0;

  NormalizarFechas(Fecha_Desde, Fecha_Hasta);
  NormalizarCadenas(SeccionDesde, SeccionHasta);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE C_CUENTAS_BALANCE_DETALLE( ');
        SQL.Add(' ?EMPRESA, ?EJERCICIO, ?CANAL, ?USUARIO, ?FECHA_INI, ?FECHA_FIN, ');
        SQL.Add(' ?CUENTA_INI, ?CUENTA_FIN, ?MONEDA, ?APERTURA, ?ENTRADA, ');
        SQL.Add(' ?NO_REGUL, ?NO_CIERRE, ?SECCION_INI, ?SECCION_FIN, ?NIVEL_FILTRO, ');
        SQL.Add(' ?D1, ?D2, ?D3, ?D4, ?D5) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['FECHA_INI'].AsDateTime := Fecha_Desde;
        Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Hasta;
        Params.ByName['CUENTA_INI'].AsString := Cuent_Desde;
        Params.ByName['CUENTA_FIN'].AsString := Cuent_Hasta;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['APERTURA'].AsInteger := integer(Apertura);
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['NO_REGUL'].AsInteger := integer(not Regularizacion);
        Params.ByName['NO_CIERRE'].AsInteger := integer(not Cierre);
        Params.ByName['SECCION_INI'].AsString := SeccionDesde;
        Params.ByName['SECCION_FIN'].AsString := SeccionHasta;
        Params.ByName['NIVEL_FILTRO'].AsInteger := Nivel_Filtro;
        Params.ByName['D1'].AsString := ' ';
        Params.ByName['D2'].AsString := ' ';
        Params.ByName['D3'].AsString := ' ';
        Params.ByName['D4'].AsString := ' ';
        Params.ByName['D5'].AsString := ' ';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_BALANCE_NIVELES(?EMPRESA, ?EJERCICIO, ?CANAL, ?USUARIO, ?NIVEL_INI, ?NIVEL_FIN, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['NIVEL_INI'].AsInteger := Nivel_Desde;
        Params.ByName['NIVEL_FIN'].AsInteger := Nivel_Hasta;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_SALDOS_EXP(?EMPRESA, ?EJERCICIO, ?USUARIO, ?NIVEL_INI, ?NIVEL_FIN, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['NIVEL_INI'].AsInteger := Nivel_Desde;
        Params.ByName['NIVEL_FIN'].AsInteger := Nivel_Hasta;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirSaldosExp;
end;

function TDMAsistenteExpSaldos.Multiseleccion: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS CANTIDAD FROM TMP_MULTISELECCION WHERE ENTRADA = ?ENTRADA AND MARCADO = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.AbrirSaldosExp;
begin
  with QMSaldosExp do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAsistenteExpSaldos.MarcarSaldosExp(Valor: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_SALDOS_EXPORTAR SET MARCADO = ?MARCADO WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MARCADO'].AsInteger := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirSaldosExp;
end;

function TDMAsistenteExpSaldos.SaldosSeleccionados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS CANTIDAD FROM TMP_SALDOS_EXPORTAR WHERE ENTRADA = ?ENTRADA AND MARCADO = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteExpSaldos.InicializarExcel: boolean;
begin
  Result := True;
  LCID := GetUserDefaultLCID;
  XLApp.DisplayAlerts[LCID] := False;
  XLApp.Connect;
  WorkBook := XLApp.Workbooks.Add(EmptyParam, LCID);
  WorkSheet := WorkBook.WorkSheets.Get_Item(1) as _WorkSheet;
  WorkSheet.Activate(LCID);
end;

function TDMAsistenteExpSaldos.CerrarExcel: boolean;
begin
  Result := True;
  XLApp.Disconnect;
end;

function TDMAsistenteExpSaldos.EscribirEnExcel(aFila, aColumna: integer; Valor: variant): boolean;
begin
  Result := True;
  WorkSheet.Cells.Item[aFila, aColumna].NumberFormat := '@';
  WorkSheet.Cells.Item[aFila, aColumna].Value := Valor;
end;

{No se utiliza
function TDMAsistenteExpSaldos.ExportarSaldos(ExpEncab: boolean): boolean;
var
  f, c : integer;
begin
  f := 0;
  Result := True;
  AbrirColExportar;

  if (ExpEncab) then
  begin
     Inc(f);
     c := 0;
     while not xColExportar.EOF do
     begin
        Inc(c);
        EscribirEnExcel(f, c, xColExportarNOMBRE_ENCAB.AsString);
        xColExportar.Next;
     end;
  end;

  QMSaldosExp.First;
  while not QMSaldosExp.EOF do
  begin
     Inc(f);
     c := 0;
     xColExportar.First;
     while not xColExportar.EOF do
     begin
        Inc(c);
        EscribirEnExcel(f, c,
           QMSaldosExp.FieldValues[xColExportarNOMBRE_CAMPO.AsString]);
        xColExportar.Next;
     end;
     QMSaldosExp.Next;
  end;
end;
}

procedure TDMAsistenteExpSaldos.InsertarColumnas;
var
  i : smallint;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_COLUMNAS_EXPORTAR WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'INSERT INTO TMP_COLUMNAS_EXPORTAR(ENTRADA,NOMBRE_CAMPO, NOMBRE_ENCAB) VALUES (?ENTRADA, ?NOMBRE_CAMPO, ?NOMBRE_ENCAB)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        for i := 0 to QMSaldosExp.Fields.Count - 1 do
           if ((QMSaldosExp.Fields[i].FieldName <> 'ENTRADA') and
              (QMSaldosExp.Fields[i].FieldName <> 'MARCADO')) then
           begin
              Params.ByName['NOMBRE_CAMPO'].AsString := QMSaldosExp.Fields[i].FieldName;
              Params.ByName['NOMBRE_ENCAB'].AsString := QMSaldosExp.Fields[i].FieldName;
              ExecQuery;
           end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.AbrirColumnas;
begin
  with QMColumnas do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

function TDMAsistenteExpSaldos.ColumnasSeleccionadas: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS CANTIDAD FROM TMP_COLUMNAS_EXPORTAR WHERE ENTRADA = ?ENTRADA AND MARCADO = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.MarcarColumnas(Valor: smallint);
begin
  GrabarDatosColumnas;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_COLUMNAS_EXPORTAR SET MARCADO = ?MARCADO WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MARCADO'].AsInteger := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMColumnas.Close;
  QMColumnas.Open;
end;

function TDMAsistenteExpSaldos.SalvarDatosEnExcel(Archivo: string): boolean;
var
  FileFormat : olevariant;
begin
  Result := True;
  try
     FileFormat := xlWorkbookNormal;
     if (LowerCase(ExtractFileExt(Archivo)) = '.csv') then
        FileFormat := xlCSV;
     WorkBook.SaveAs(Archivo, FileFormat, '', '', False, False, xlNoChange,
        xlLocalSessionChanges, True, 0, 0, LCID);
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.AbrirColExportar;
begin
  with xColExportar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAsistenteExpSaldos.GrabarDatosColumnas;
begin
  if (QMColumnas.State = dsEdit) then
     QMColumnas.Post;
end;

procedure TDMAsistenteExpSaldos.BorrarTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_SALDOS_EXPORTAR WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_COLUMNAS_EXPORTAR WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.QMSaldosExpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAsistenteExpSaldos.QMColumnasNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAsistenteExpSaldos.InicializaProceso;
begin
  Fila := 0;
  Columna := 0;
  Error := '';
  AbrirSaldosSel;
  AbrirColExportar;
  InicializarExcel;
end;

function TDMAsistenteExpSaldos.ExportarEncabezado: boolean;
begin
  Result := True;
  try
     Inc(Fila);
     Columna := 0;
     while not xColExportar.EOF do
     begin
        Inc(Columna);
        EscribirEnExcel(Fila, Columna, xColExportarNOMBRE_ENCAB.AsString);
        xColExportar.Next;
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

function TDMAsistenteExpSaldos.Final: boolean;
begin
  Result := xRecorre.EOF;
end;

function TDMAsistenteExpSaldos.Actual: string;
begin
  Result := Format(_('Cuenta: %s'), [xRecorreCUENTA.AsString]);
  if (xRecorreDEBE.AsFloat <> 0) then
     Result := Result + ', ' + _('Debe') + ': ' + xRecorreDEBE.AsString;
  if (xRecorreHABER.AsFloat <> 0) then
     Result := Result + ', ' + _('Haber') + ': ' + xRecorreHABER.AsString;
end;

procedure TDMAsistenteExpSaldos.Siguiente;
begin
  xRecorre.Next;
end;

function TDMAsistenteExpSaldos.ExportarSaldo: boolean;
begin
  Result := True;
  try
     Inc(Fila);
     Columna := 0;
     xColExportar.First;
     while not xColExportar.EOF do
     begin
        Inc(Columna);
        EscribirEnExcel(Fila, Columna,
           xRecorre.FieldValues[xColExportarNOMBRE_CAMPO.AsString]);
        xColExportar.Next;
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

procedure TDMAsistenteExpSaldos.AbrirSaldosSel;
begin
  with xRecorre do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

end.
