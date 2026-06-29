unit UDMAsistenteExpAsientos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBTableDataSetRO;

type
  TDMAsistenteExpAsientos = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     DSQMAsientosExp: TDataSource;
     QMAsientosExp: TFIBTableSet;
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
     QMAsientosExpENTRADA: TIntegerField;
     QMAsientosExpASIENTO: TIntegerField;
     QMAsientosExpLINEA: TIntegerField;
     QMAsientosExpCUENTA: TFIBStringField;
     QMAsientosExpTITULO: TFIBStringField;
     QMAsientosExpTIPO: TFIBStringField;
     QMAsientosExpIMPORTE: TFloatField;
     QMAsientosExpMARCADO: TIntegerField;
     QMAsientosExpTEXTO: TFIBStringField;
     xDatosTercero: TFIBDataSetRO;
     DSxDatosTercero: TDataSource;
     xDatosTerceroTERCERO: TIntegerField;
     xDatosTerceroNOMBRE: TFIBStringField;
     xDatosTerceroNIF: TFIBStringField;
     xDatosTerceroDIRECCION: TFIBStringField;
     xDatosTerceroLOCALIDAD: TFIBStringField;
     xDatosTerceroCODIGO_POSTAL: TFIBStringField;
     xDatosTerceroPROVINCIA: TFIBStringField;
     xAsiento: TFIBDataSetRO;
     xAsientoTITULO: TFIBStringField;
     xSelAsientos: TFIBDataSetRO;
     xSelAsientosENTRADA: TIntegerField;
     xSelAsientosASIENTO: TIntegerField;
     xSelAsientosLINEA: TIntegerField;
     xSelAsientosCUENTA: TFIBStringField;
     xSelAsientosTITULO: TFIBStringField;
     xSelAsientosTEXTO: TFIBStringField;
     xSelAsientosTIPO: TFIBStringField;
     xSelAsientosIMPORTE: TFloatField;
     xSelAsientosMARCADO: TIntegerField;
     DSxSelAsientos: TDataSource;
     QMAsientosExpDEBE: TFloatField;
     QMAsientosExpHABER: TFloatField;
     xSelAsientosDEBE: TFloatField;
     xSelAsientosHABER: TFloatField;
     QMAsientosExpFECHA: TDateTimeField;
     xSelAsientosFECHA: TDateTimeField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure Actualiza_Cuenta(Tabla: TFIBDataSetRO; cuenta: string);
     procedure QMAsientosExpNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     WorkBook: _WorkBook;
     WorkSheet: _WorkSheet;
     LCID: integer;
     UltAsiento: integer;
     procedure NormalizarFechas(var desde, hasta: TDateTime);
     procedure AbrirAsientosExp;
     function EscribirEnExcel(Fila, Columna: integer; Valor: variant): boolean;
     procedure AbrirColExportar;
     procedure BorrarTemporales;
     function CuentaTerceros: boolean;
     procedure AbrirAsiento;
     procedure AbrirSelAsientos;
  public
     { Public declarations }
     Fecha_Desde: TDateTime;
     Fecha_Hasta: TDateTime;
     Asiento_Desde: integer;
     Asiento_Hasta: integer;
     TipoAsiento: string;
     fila, col: integer;
     Error: string;
     function RellenaTiposAsientos: TStringList;
     procedure Rangos;
     procedure ProcesarFiltros;
     procedure MarcarColumnas(Valor: smallint);
     procedure MarcarAsientosExp(Valor: smallint);
     function AsientosSeleccionados: boolean;
     function InicializarExcel: boolean;
     function CerrarExcel: boolean;
     function SalvarDatosEnExcel(Archivo: string): boolean;
     procedure InsertarColumnas;
     procedure AbrirColumnas;
     function ColumnasSeleccionadas: boolean;
     procedure GrabarDatosColumnas;
     function Final: boolean;
     procedure Siguiente;
     function Actual: string;
     function ExportarEncabezado: boolean;
     procedure InicializaProceso;
     function ExportarAsiento: boolean;
  end;

var
  DMAsistenteExpAsientos : TDMAsistenteExpAsientos;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils, Windows;

{$R *.dfm}

procedure TDMAsistenteExpAsientos.Actualiza_Cuenta(Tabla: TFIBDataSetRO; cuenta: string);
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

procedure TDMAsistenteExpAsientos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMAsistenteExpAsientos.DataModuleDestroy(Sender: TObject);
begin
  BorrarTemporales;
end;

procedure TDMAsistenteExpAsientos.Rangos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;

        // Fecha mínima...
        SQL.Text := 'select min(fecha) as minimo from con_cuentas_asientos ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Fecha_Desde := FieldByName['MINIMO'].AsDateTime;
        if (Fecha_Desde = 0) then
           Fecha_Desde := Date;

        // Fecha máxima...
        SQL.Text := 'select max(fecha) as maximo from con_cuentas_asientos ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Fecha_Hasta := FieldByName['MAXIMO'].AsDateTime;
        if (Fecha_Hasta = 0) then
           Fecha_Hasta := Date;

        // Asiento máximo...
        SQL.Text := 'select max(asiento) as maximo from con_cuentas_asientos ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Asiento_Hasta := FieldByName['MAXIMO'].AsInteger;
        if (Asiento_Hasta = 0) then
           Asiento_Hasta := 1;
     finally
        Free;
     end;
end;

procedure TDMAsistenteExpAsientos.NormalizarFechas(var desde, hasta: TDateTime);
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

procedure TDMAsistenteExpAsientos.ProcesarFiltros;
var
  Q : THYFIBQuery;
begin
  NormalizarFechas(Fecha_Desde, Fecha_Hasta);

  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'execute procedure c_cuentas_asientos_exp(?empresa,?ejercicio,' +
           '?canal,?fecha_desde,?fecha_hasta,?asiento_desde,?asiento_hasta,' +
           '?moneda,?tipo,?entrada)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_DESDE'].AsDateTime := Fecha_Desde;
        Params.ByName['FECHA_HASTA'].AsDateTime := Fecha_Hasta;
        Params.ByName['ASIENTO_DESDE'].AsInteger := Asiento_Desde;
        Params.ByName['ASIENTO_HASTA'].AsInteger := Asiento_Hasta;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['TIPO'].AsString := TipoAsiento;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
     finally
        Free;
     end;

  AbrirAsientosExp;
end;

procedure TDMAsistenteExpAsientos.AbrirAsientosExp;
begin
  with QMAsientosExp do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAsistenteExpAsientos.MarcarAsientosExp(Valor: smallint);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'update tmp_exportar_asientos set marcado=?marcado where entrada=?entrada';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MARCADO'].AsInteger := Valor;
        ExecQuery;
     finally
        Free;
     end;

  AbrirAsientosExp;
end;

function TDMAsistenteExpAsientos.AsientosSeleccionados: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'select count(*) as cantidad from tmp_exportar_asientos' +
           ' where entrada=?entrada and marcado=1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsInteger > 0;
     finally
        Free;
     end;
end;

function TDMAsistenteExpAsientos.InicializarExcel: boolean;
begin
  Result := True;
  LCID := GetUserDefaultLCID;
  XLApp.DisplayAlerts[LCID] := False;
  XLApp.Connect;
  WorkBook := XLApp.Workbooks.Add(EmptyParam, LCID);
  WorkSheet := WorkBook.WorkSheets.Get_Item(1) as _WorkSheet;
  WorkSheet.Activate(LCID);
end;

function TDMAsistenteExpAsientos.CerrarExcel: boolean;
begin
  Result := True;
  XLApp.Quit;
  XLApp.Disconnect;
end;

function TDMAsistenteExpAsientos.EscribirEnExcel(Fila, Columna: integer; Valor: variant): boolean;
begin
  Result := True;
  WorkSheet.Cells.Item[Fila, Columna].NumberFormat := '@';
  WorkSheet.Cells.Item[Fila, Columna].Value := Valor;
end;

procedure TDMAsistenteExpAsientos.InsertarColumnas;
var
  Q : THYFIBQuery;
  i : smallint;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'delete from tmp_columnas_exportar where entrada=?entrada';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;

        SQL.Text := 'insert into tmp_columnas_exportar(entrada,nombre_campo,' +
           'nombre_encab) values(?entrada,?nombre_campo,?nombre_encab)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        for i := 0 to QMAsientosExp.Fields.Count - 1 do
           if ((QMAsientosExp.Fields[i].FieldName <> 'ENTRADA') and
              (QMAsientosExp.Fields[i].FieldName <> 'MARCADO')) then
           begin
              Params.ByName['NOMBRE_CAMPO'].AsString := QMAsientosExp.Fields[i].FieldName;
              Params.ByName['NOMBRE_ENCAB'].AsString := QMAsientosExp.Fields[i].FieldName;
              ExecQuery;
           end;
     finally
        Free;
     end;
end;

procedure TDMAsistenteExpAsientos.AbrirColumnas;
begin
  with QMColumnas do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

function TDMAsistenteExpAsientos.ColumnasSeleccionadas: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'select count(*) as cantidad from tmp_columnas_exportar' +
           ' where entrada=?entrada and marcado=1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsInteger > 0;
     finally
        Free;
     end;
end;

procedure TDMAsistenteExpAsientos.MarcarColumnas(Valor: smallint);
var
  Q : THYFIBQuery;
begin
  GrabarDatosColumnas;

  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'update tmp_columnas_exportar set marcado=?marcado where entrada=?entrada';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MARCADO'].AsInteger := Valor;
        ExecQuery;
     finally
        Free;
     end;

  QMColumnas.Close;
  QMColumnas.Open;
end;

function TDMAsistenteExpAsientos.SalvarDatosEnExcel(Archivo: string): boolean;
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

procedure TDMAsistenteExpAsientos.AbrirColExportar;
begin
  with xColExportar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAsistenteExpAsientos.GrabarDatosColumnas;
begin
  if (QMColumnas.State = dsEdit) then
     QMColumnas.Post;
end;

procedure TDMAsistenteExpAsientos.BorrarTemporales;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'delete from tmp_exportar_asientos where entrada=?entrada';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;

        SQL.Text := 'delete from tmp_columnas_exportar where entrada=?entrada';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
     finally
        Free;
     end;
end;

function TDMAsistenteExpAsientos.RellenaTiposAsientos: TStringList;
var
  DS : TFIBDataSetRO;
  Tipo : string;
begin
  Result := TStringList.Create;
  Result.AddObject(_('Todos los tipos'), Pointer(0));
  DS := TFIBDataSetRO.Create(nil);
  with DS do
     try
        Database := DMMain.DataBase;
        Transaction := TLocal;
        SelectSQL.Text := 'select tipo,titulo from sys_tipo_asiento where tipo<>''ANA''' +
           ' order by tipo';
        Open;
        while not EOF do
        begin
           Tipo := FieldByName('TIPO').AsString + ' ' + FieldByName('TITULO').AsString;
           Result.AddObject(Tipo, Pointer(Tipo));
           Next;
        end;
     finally
        Free;
     end;
end;

procedure TDMAsistenteExpAsientos.QMAsientosExpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

function TDMAsistenteExpAsientos.CuentaTerceros: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'select count(*) as cantidad from tmp_exportar_asientos ea' +
           ' join con_cuentas_terceros ct on (ct.cuenta=ea.cuenta) ' +
           ' where ea.entrada=?entrada and ct.empresa=?empresa and ' +
           ' ct.ejercicio=?ejercicio and ct.canal=?canal';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsInteger > 0;
     finally
        Free;
     end;
end;

function TDMAsistenteExpAsientos.Actual: string;
begin
  Result := '';
  if (UltAsiento <> xSelAsientosASIENTO.AsInteger) then
  begin
     UltAsiento := xSelAsientosASIENTO.AsInteger;
     Result := Format(_('Exportando Asiento: %s, %s'), [xSelAsientosASIENTO.AsString, xAsientoTITULO.AsString]) + #13#10;
  end;

  Result := Result + '   ' + Format(_('Apunte: %s, %s'), [xSelAsientosLINEA.AsString, xSelAsientosTITULO.AsString]) + ', ';

  if (xSelAsientosTIPO.AsString = 'D') then
     Result := Result + _('Debe') + ': '
  else
     Result := Result + _('Haber') + ': ';
  Result := Result + xSelAsientosIMPORTE.AsString;
end;

function TDMAsistenteExpAsientos.Final: boolean;
begin
  Result := xSelAsientos.EOF;
end;

procedure TDMAsistenteExpAsientos.Siguiente;
begin
  xSelAsientos.Next;
end;

function TDMAsistenteExpAsientos.ExportarEncabezado: boolean;
var
  i : integer;
begin
  Result := True;
  try
     Inc(fila);
     col := 0;
     while not xColExportar.EOF do
     begin
        Inc(col);
        EscribirEnExcel(fila, col, xColExportarNOMBRE_ENCAB.AsString);
        xColExportar.Next;
     end;
     if (CuentaTerceros) then
     begin
        Inc(col);
        for i := 0 to xDatosTercero.Fields.Count - 1 do
           EscribirEnExcel(fila, col + i, xDatosTercero.Fields[i].FieldName);
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

procedure TDMAsistenteExpAsientos.InicializaProceso;
begin
  fila := 0;
  col := 0;
  Error := '';
  UltAsiento := 0;
  AbrirSelAsientos;
  AbrirAsiento;
  AbrirColExportar;
  InicializarExcel;
end;

function TDMAsistenteExpAsientos.ExportarAsiento: boolean;
var
  i : integer;
begin
  Result := True;
  try
     Inc(fila);
     col := 0;
     xColExportar.First;
     while not xColExportar.EOF do
     begin
        Inc(col);
        EscribirEnExcel(fila, col,
           {xSelAsientos.FieldValues[xColExportarNOMBRE_CAMPO.AsString]}
           xSelAsientos.FieldByName(xColExportarNOMBRE_CAMPO.AsString).AsString);
        xColExportar.Next;
     end;
     if (xDatosTercero.RecordCount > 0) then
     begin
        Inc(col);
        for i := 0 to xDatosTercero.Fields.Count - 1 do
           EscribirEnExcel(fila, col + i,
              xDatosTercero.FieldValues[xDatosTercero.Fields[i].FieldName]);
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

procedure TDMAsistenteExpAsientos.AbrirAsiento;
begin
  with xAsiento do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMAsistenteExpAsientos.AbrirSelAsientos;
begin
  with xSelAsientos do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xDatosTercero do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

end.
