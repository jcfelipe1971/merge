unit UDMAsistenteImpStockMinMax;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TDMAsistenteImpStockMinMax = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     QMStocksImp: TFIBTableSet;
     DSQMStocksImp: TDataSource;
     xRecorre: TFIBDataSetRO;
     TUpdate: THYTransaction;
     QMStocksImpEMPRESA: TIntegerField;
     QMStocksImpCANAL: TIntegerField;
     QMStocksImpARTICULO: TFIBStringField;
     QMStocksImpSTOCK_MINIMO: TFloatField;
     QMStocksImpSTOCK_MAXIMO: TFloatField;
     QActualizaStocks: THYFIBQuery;
     QMStocksImpIMPORTAR: TIntegerField;
     xRecorreEMPRESA: TIntegerField;
     xRecorreCANAL: TIntegerField;
     xRecorreARTICULO: TFIBStringField;
     xRecorreSTOCK_MINIMO: TFloatField;
     xRecorreSTOCK_MAXIMO: TFloatField;
     QMStocksImpENTRADA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMStocksImpNewRecord(DataSet: TDataSet);
     procedure QMStocksImpAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Filas: TObjectList;
     ColArt, ColMinimo, ColMaximo: smallint;
     FilaSiguiente: boolean;
     Almacen: string;
     ExcelConectado: boolean;
  public
     { Public declarations }
     function LeerDatos(Archivo, Hoja: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     function LlenarTablaTemporal(CArt, CMinimo, CMaximo: smallint; SeparadorDecimal: string; PrimeraFilaTitulos: boolean): boolean;
     procedure BorrarTablaTemporal;
     procedure AbrirStocksImp;
     procedure SeleccionarTodas(Modo: smallint);
     procedure InicializaProceso;
     function Actual: string;
     function Final: boolean;
     procedure Siguiente;
     function ActualizaStock(var Error: string): boolean;
     function Seleccionados: boolean;
     procedure ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
     procedure SetAlmacen(aAlmacen: string);
  end;

var
  DMAsistenteImpStockMinMax : TDMAsistenteImpStockMinMax;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils, UHojaCalc;

{$R *.dfm}

procedure TDMAsistenteImpStockMinMax.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  ExcelConectado := False;
  Filas := TObjectList.Create;
  ColArt := 0;
  ColMinimo := 0;
  ColMaximo := 0;
end;

procedure TDMAsistenteImpStockMinMax.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
  if (ExcelConectado) then
     XLApp.Quit;
  BorrarTablaTemporal;
end;

function TDMAsistenteImpStockMinMax.LeerDatos(Archivo, Hoja: string): boolean;
var
  HCalc : THojaCalc;
  f, c, x, y : integer;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  /// Inserta los datos del archivo en filas y columnas.
  /// La primera fila la dejará vacia para rellenarlo con el campo donde insertar el dato.

  Result := True;
  try
     Columnas := TObjectList.Create;
     try
        DMMain.Log('F create Excel');
        HCalc := THojaCalc.Create(Archivo, False); // OpenOffice doc if possible, please
        try
           DMMain.Log('HCalc.FileName = ' + Archivo);
           HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

           if (Trim(Hoja) > '') then
           begin
              DMMain.Log('HCalc.ActivateSheetByName(' + Hoja + ')');
              HCalc.ActivateSheetByName(Hoja, False);
           end;

           DMMain.Log('HCalc.Last Row/Col');
           x := HCalc.LastRow + 1;
           y := HCalc.LastCol + 2;
           DMMain.Log(format('LastRow:%d - LastCol:%d', [x, y]));

           Columnas.Capacity := y;
           for c := 1 to y do
           begin
              StrList := TStringList.Create;
              StrList.Add(Format(_('Columna %d'), [c]));

              for f := 1 to x do
              begin
                 try
                    StrList.Add(LimpiaCeldaExcel(HCalc.CellText[f, c]));
                 except
                    StrList.Add(_('ERROR'));
                 end;
              end;

              // Se eliminan las columnas vacías
              if Trim(StrList.Text) <> '' then
                 Columnas.Add(StrList)
              else
              begin
                 DMMain.Log(format('Eliminando Columna Vacia: %d', [c]));
                 StrList.Free;
              end;
              // FMAsistenteImpArticulos.ProgresoImportacion.Position := c;
           end;

           // Se elimanan las filas vacías.
           DMMain.Log('Eliminando filas vacias');
           Filas.Clear;
           Filas.Capacity := x + 1;

           {
           // Primera fila vacia para seleccionar campo a importar
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add('');
           Filas.Add(StrList);
           }

           for f := 0 to x - 1 do
           begin
              StrList := TStringList.Create;
              for c := 0 to Columnas.Count - 1 do
                 StrList.Add((Columnas.Items[c] as TStrings)[f]);

              if Trim(StrList.Text) <> '' then
                 Filas.Add(StrList)
              else
              begin
                 DMMain.Log(format('Eliminando Fila Vacia: %d', [f]));
                 StrList.Free;
              end;
           end;

           DMMain.Log('Fin importacion');
        finally
           Sleep(1000);
           DMMain.Log('I Liberar Excel');
           HCalc.Free;
        end;
     finally
        Columnas.Free;
     end;
  except
     on E: Exception do
     begin
        DMMain.Log('Error importacion' + #13#10 + E.Message);
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;

function TDMAsistenteImpStockMinMax.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TDMAsistenteImpStockMinMax.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

function TDMAsistenteImpStockMinMax.LlenarTablaTemporal(CArt, CMinimo, CMaximo: smallint; SeparadorDecimal: string; PrimeraFilaTitulos: boolean): boolean;
var
  i, FilaIni : integer;
  StockMinimo, StockMaximo : double;
  Articulo : string;
  Q : THYFIBQuery;
begin
  Result := True;

  if (Trim(SeparadorDecimal) = '') then
     SeparadorDecimal := DecimalSeparator;

  ColArt := CArt;
  ColMinimo := CMinimo;
  ColMaximo := CMaximo;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO TMP_IMPORTAR_STOCKS_MINMAX  (');
        SQL.Add(' ENTRADA, EMPRESA, CANAL, ARTICULO, STOCK_MINIMO, STOCK_MAXIMO ) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :ENTRADA, :EMPRESA, :CANAL, :ARTICULO, :STOCK_MINIMO, :STOCK_MAXIMO ) ');
     end;

     i := 0;
     FilaIni := 1;  // Evitamos que copie la primera linea que es la de los titulos
     if PrimeraFilaTitulos then
        Inc(FilaIni);

     BorrarTablaTemporal;

     try
        for i := FilaIni to Filas.Count - 1 do
        begin
           if not (FilaSiguiente) then
           begin
              Articulo := Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColArt - 1]), 1, 15);
              StockMinimo := 0;
              if (ColMinimo > 0) then
                 StockMinimo := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColMinimo - 1]), SeparadorDecimal[1]);

              StockMaximo := 0;
              if (ColMaximo > 0) then
                 StockMaximo := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColMaximo - 1]), SeparadorDecimal[1]);

              with Q do
              begin
                 Close;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['ARTICULO'].AsString := Articulo;
                 Params.ByName['STOCK_MINIMO'].AsFloat := StockMinimo;
                 Params.ByName['STOCK_MAXIMO'].AsFloat := StockMaximo;
                 ExecQuery;
                 FreeHandle;
              end;
           end;
           FilaSiguiente := False;
        end;
     except
        on E: Exception do
        begin
           ShowMessage(Format(_('Ha ocurrido un error en la fila numero %d'), [i + FilaIni]) + #13#10 + E.Message);
           FilaSiguiente := True;
           Result := False;
        end;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (Result) then
     AbrirStocksImp;
end;

procedure TDMAsistenteImpStockMinMax.BorrarTablaTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_IMPORTAR_STOCKS_MINMAX WHERE ENTRADA = :ENTRADA AND EMPRESA = :EMPRESA AND CANAL = :CANAL';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpStockMinMax.QMStocksImpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAsistenteImpStockMinMax.AbrirStocksImp;
begin
  with QMStocksImp do
  begin
     DisableControls;
     try
        Close;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAsistenteImpStockMinMax.SeleccionarTodas(Modo: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_IMPORTAR_STOCKS_MINMAX ');
        SQL.Add(' SET ');
        SQL.Add(' IMPORTAR = :MODO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        SQL.Add(' AND EMPRESA = :EMPRESA ');
        SQL.Add(' AND CANAL = :CANAL ');
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirStocksImp;
end;

procedure TDMAsistenteImpStockMinMax.InicializaProceso;
begin
  with xRecorre do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  with QActualizaStocks do
  begin
     SQL.Clear;
     SQL.Add(' UPDATE ART_ARTICULOS_ALMACENES_ART ');
     SQL.Add(' SET ');
     if (ColMinimo > 0) then
        SQL.Add('STOCK_MINIMO = :STOCK_MINIMO ');
     if (ColMaximo > 0) then
        SQL.Add(', STOCK_MAXIMO = :STOCK_MAXIMO ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = :EMPRESA AND ');
     SQL.Add(' CANAL = :CANAL AND ');
     SQL.Add(' ALMACEN = :ALMACEN AND ');
     SQL.Add(' ARTICULO = :ARTICULO ');
  end;
end;

function TDMAsistenteImpStockMinMax.Final: boolean;
begin
  Result := xRecorre.EOF;
end;

procedure TDMAsistenteImpStockMinMax.Siguiente;
begin
  xRecorre.Next;
end;

function TDMAsistenteImpStockMinMax.Actual: string;
begin
  Result := Format(_('Actualizando Articulo') + ' %s ', [xRecorreARTICULO.AsString]);

  if (ColMinimo > 0) then
     Result := Result + ' ' + _('Minimo') + ': ' + FormatFloat(MascaraN, xRecorreSTOCK_MINIMO.AsFloat);

  if (ColMaximo > 0) then
     Result := Result + ' ' + _('Maximo') + ': ' + FormatFloat(MascaraN, xRecorreSTOCK_MAXIMO.AsFloat);
end;

function TDMAsistenteImpStockMinMax.ActualizaStock(var Error: string): boolean;
begin
  Result := True;
  Error := '';
  try
     with QActualizaStocks do
     begin
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ARTICULO'].AsString := xRecorreARTICULO.AsString;
        if (ColMinimo > 0) then
           Params.ByName['STOCK_MINIMO'].AsFloat := xRecorreSTOCK_MINIMO.AsFloat;
        if (ColMaximo > 0) then
           Params.ByName['STOCK_MAXIMO'].AsFloat := xRecorreSTOCK_MAXIMO.AsFloat;
        ExecQuery;
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

function TDMAsistenteImpStockMinMax.Seleccionados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 EMPRESA FROM TMP_IMPORTAR_STOCKS_MINMAX ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        SQL.Add(' AND EMPRESA = :EMPRESA ');
        SQL.Add(' AND CANAL = :CANAL ');
        SQL.Add(' AND IMPORTAR = 1 ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := (FieldByName['EMPRESA'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpStockMinMax.QMStocksImpAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAsistenteImpStockMinMax.SetAlmacen(aAlmacen: string);
begin
  Almacen := aAlmacen;
end;


procedure TDMAsistenteImpStockMinMax.ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
var
  i : integer;
begin
  aLastRow := 0;
  aLastCol := 0;
  aCountSheet := 0;
  Sheets.Clear;

  if FileExists(aFileName) then
  begin
     DMMain.Log('F create Excel');
     with THojaCalc.Create(aFileName, False) do
     begin
        try
           DMMain.Log('HCalc.FileName = ' + aFileName);
           FileName := aFileName;

           // Obtengo lista de hojas
           for i := 1 to CountSheets do
           begin
              ActivateSheetByIndex(i);
              Sheets.Add(ActiveSheetName);
           end;

           // Si el parametro contiene una hoja, la utilizo para obtener la informacion
           if (aActiveSheetName = '') then
              aActiveSheetName := ActiveSheetName
           else
           begin
              try
                 ActivateSheetByName(aActiveSheetName, False);
              except
                 ActivateSheetByIndex(1);
                 aActiveSheetName := ActiveSheetName;
              end;
           end;

           ActivateSheetByName(aActiveSheetName, False);

           aLastRow := LastRow;
           aLastCol := LastCol;
           aCountSheet := CountSheets;
        finally
           Sleep(100);
           Free;
        end;
     end;
  end;
end;

end.
