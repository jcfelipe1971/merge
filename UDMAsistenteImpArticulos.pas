unit UDMAsistenteImpArticulos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TDMAsistenteImpArticulos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QImportaArticulo: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Filas: TObjectList;
     Param_ARTCODI001: string;
  public
     { Public declarations }
     SeparadorDecimal: char;
     function LeerDatos(Archivo, Hoja: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     procedure RellenaCampos(Campos: TStrings);
     procedure InicializaImportacion(aSeparadorDecimal: char);
     procedure NuevoArticulo;
     procedure AsignaParametro(Parametro, Valor: string);
     procedure CrearArticulo;
     procedure ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
  end;

var
  DMAsistenteImpArticulos : TDMAsistenteImpArticulos;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils, UHojaCalc, UFMAsistenteImpArticulos, FIBDataSetRW, UParam, UDameDato;

{$R *.dfm}

procedure TDMAsistenteImpArticulos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  Filas := TObjectList.Create;

  SeparadorDecimal := DecimalSeparator;
  Param_ARTCODI001 := LeeParametro('ARTCODI001');
end;

procedure TDMAsistenteImpArticulos.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
end;

function TDMAsistenteImpArticulos.LeerDatos(Archivo, Hoja: string): boolean;
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

           DMMain.Log('HCalc.ActivateSheetByName(' + Hoja + ')');
           HCalc.ActivateSheetByName(Hoja, False);

           DMMain.Log('HCalc.Last Row/Col');
           x := HCalc.LastRow + 1;
           y := HCalc.LastCol + 1;
           DMMain.Log(format('LastRow:%d - LastCol:%d', [x, y]));

           FMAsistenteImpArticulos.ProgresoImportacion.Min := 0;
           FMAsistenteImpArticulos.ProgresoImportacion.Max := y;

           Columnas.Capacity := y;
           for c := 1 to y do
           begin
              StrList := TStringList.Create;
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
              FMAsistenteImpArticulos.ProgresoImportacion.Position := c;
           end;
           FMAsistenteImpArticulos.ProgresoImportacion.Position := y;

           // Se elimanan las filas vacías.
           DMMain.Log('Eliminando filas vacias');
           Filas.Clear;
           Filas.Capacity := x + 1;

           // Primera fila vacia para seleccionar campo a importar
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add('');
           Filas.Add(StrList);

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

function TDMAsistenteImpArticulos.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TDMAsistenteImpArticulos.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

procedure TDMAsistenteImpArticulos.RellenaCampos(Campos: TStrings);
var
  xTabla : TFIBDataSetRW;
  DSxTabla : TDataSource;
  i : integer;
begin
  xTabla := TFIBDataSetRW.Create(nil);
  DSxTabla := TDataSource.Create(nil);
  try
     DSXTabla.DataSet := xTabla;
     with xTabla do
     begin
        Unidirectional := True;
        xTabla.DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(xTabla);
        Transaction.DefaultDatabase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        if (Active) then
           Close;
        // Solo necesito los nombres de los campos. Los datos me dan igual
        SelectSQL.Text := 'SELECT * FROM VER_ARTICULOS_IMPORTACION WHERE EMPRESA = 0';
        Open;

        for i := 0 to FieldCount - 1 do
        begin
           if (Fields[i].Visible) then
           begin
              Campos.Add(Fields[i].FieldName);
           end;
        end;

        Close;
        if (Transaction.InTransaction) then
           Transaction.Commit;
     end; {with xTabla}
  finally
     DSxTabla.Free;
     xTabla.Free;
  end;
end;

procedure TDMAsistenteImpArticulos.InicializaImportacion(aSeparadorDecimal: char);
var
  ListaCampos : TStrings;
  Campos, Valores : string;
  Separador : string;
  i : integer;
begin
  SeparadorDecimal := aSeparadorDecimal;

  // Crea SQL para insertar
  DMMain.Log('InicializaImportacion');
  ListaCampos := TStringList.Create;
  try
     DMAsistenteImpArticulos.RellenaCampos(ListaCampos);

     Separador := '';
     Campos := '';
     Valores := '';
     for i := 0 to ListaCampos.Count - 1 do
     begin
        Campos := Campos + Separador + ListaCampos[i];
        Valores := Valores + Separador + ':' + ListaCampos[i];
        Separador := ', ';
     end;
  finally
     ListaCampos.Free;
  end;

  with QImportaArticulo do
  begin
     SQL.Clear;
     SQL.Add(' INSERT INTO VER_ARTICULOS_IMPORTACION');
     SQL.Add(' (' + Campos + ')');
     SQL.Add(' VALUES ');
     SQL.Add(' (' + Valores + ')');
  end;

  DMMain.Log(QImportaArticulo.SQL.Text);
end;

procedure TDMAsistenteImpArticulos.NuevoArticulo;
var
  i : integer;
begin
  DMMain.Log('NuevoArticulo');
  with QImportaArticulo do
  begin
     for i := 0 to Params.Count - 1 do
        Params[i].IsNull := True;
  end;
end;

procedure TDMAsistenteImpArticulos.AsignaParametro(Parametro, Valor: string);
var
  i, j : integer;
  s : string;
begin
  // Asigna parametro, convirtiendolo segun corresponda
  DMMain.Log('AsignaParametro ' + Parametro + ' = ' + Valor);
  with QImportaArticulo do
  begin
     for i := 0 to Params.Count - 1 do
        if UpperCase(Params[i].Name) = UpperCase(Parametro) then
        begin
           if Params[i].DataType in [ftSmallint, ftInteger, ftWord] then
           begin
              // Limpio valor y dejo solo numeros, signo y separador decimal.
              s := '';
              for j := 1 to Length(Valor) do
                 if (Valor[j] in ['0'..'9', '-']) then
                    s := s + Valor[j];
              s := Trim(s);

              if (s = '') then
                 Params[i].AsInteger := 0
              else
                 Params[i].AsInteger := StrToInt(s);
           end
           else
           if Params[i].DataType in [ftFloat, ftCurrency] then
           begin
              // Limpio valor y dejo solo numeros, signo y separador decimal.
              s := '';
              for j := 1 to Length(Valor) do
                 if (Valor[j] in ['0'..'9', '-', SeparadorDecimal]) then
                    s := s + Valor[j];
              s := Trim(s);

              if (s = '') then
                 Params[i].AsFloat := 0
              else
                 Params[i].AsFloat := StrToFloatDec(s, SeparadorDecimal);
           end
           else
           if Params[i].DataType in [ftDateTime, ftDate, ftTime] then
           begin
              if (Trim(Valor) > '') then
                 Params[i].AsDateTime := StrToDate(Valor);
           end
           else
           if Params[i].DataType in [ftString, ftWideString] then
           begin
              // Si empieza por apostrofe lo quito
              if (Length(Valor) >= 1) and (Valor[1] = '''') then
                 Valor := Copy(Valor, 2, Length(Valor));

              // Quito espacios
              Valor := Trim(Valor);

              if (Length(Valor) > Params[i].Size) then
              begin
                 FMAsistenteImpArticulos.Log(Format(_('Se reduce el tamaño del campo %s. (Max. = %d). Se importa: %s'), [Params[i].Name, Params[i].Size, Copy(Valor, 1, Params[i].Size)]));
                 FMAsistenteImpArticulos.Log('');
              end;
              Params[i].AsString := Copy(Valor, 1, Params[i].Size);
           end
           else
              Params[i].Value := Valor;
        end;
  end;
end;

procedure TDMAsistenteImpArticulos.CrearArticulo;
var
  i : integer;
begin
  // Crea el Articulo, rellenando algunos parametros si fuera necesario.
  DMMain.Log('CrearArticulo');
  with QImportaArticulo do
  begin
     for i := 0 to Params.Count - 1 do
     begin
        if UpperCase(Params[i].Name) = 'EMPRESA' then
        begin
           if Params[i].IsNull then
           begin
              Params[i].Value := REntorno.Empresa;
              DMMain.Log('EMPRESA ' + REntorno.EmpresaStr);
           end;
        end;
        if UpperCase(Params[i].Name) = 'EJERCICIO' then
        begin
           if Params[i].IsNull then
           begin
              Params[i].Value := REntorno.Ejercicio;
              DMMain.Log('EJERCICIO ' + REntorno.EjercicioStr);
           end;
        end;
        if UpperCase(Params[i].Name) = 'CANAL' then
        begin
           if Params[i].IsNull then
           begin
              Params[i].Value := REntorno.Canal;
              DMMain.Log('CANAL ' + REntorno.CanalStr);
           end;
        end;
     end;

     // Formo el codigo de articulo si no esta rellenado
     if Params.ByName['ARTICULO'].IsNull or (Trim(Params.ByName['ARTICULO'].AsString) = '') then
     begin
        if (Param_ARTCODI001 <> '') then
        begin
           Params.ByName['ARTICULO'].AsString := DMMain.DameCodigoArticulo(Param_ARTCODI001, Params.ByName['FAMILIA'].AsString, Params.ByName['SUBFAMILIA'].AsString);
        end
        else
        begin
           Params.ByName['ARTICULO'].AsString := format('%.5d', [DMMain.Contador_E('ART')]);
        end;

        DMMain.Log('ARTICULO ' + Params.ByName['ARTICULO'].AsString);
     end;

     if (Param_ARTCODI001 <> '') then
     begin
        if Params.ByName['TITULO'].IsNull or (Trim(Params.ByName['TITULO'].AsString) = '') then
           Params.ByName['TITULO'].AsString := Trim(format('%s %s', [DameTituloFamilia(Params.ByName['FAMILIA'].AsString), DameTituloSubFamilia(Params.ByName['SUBFAMILIA'].AsString, Params.ByName['FAMILIA'].AsString)]));
     end;

     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteImpArticulos.ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
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
