unit UDMAsistenteImpArtIdiomas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TDMAsistenteImpArtIdiomas = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     QMImpArtidiomas: TFIBTableSet;
     DSQMImpArtIdiomas: TDataSource;
     xArtIdiomas: TFIBDataSetRO;
     DSxArtIdiomas: TDataSource;
     xArtIdiomasIDIOMA: TFIBStringField;
     QMImpArtidiomasENTRADA: TIntegerField;
     QMImpArtidiomasLINEA: TIntegerField;
     QMImpArtidiomasEMPRESA: TIntegerField;
     QMImpArtidiomasARTICULO: TFIBStringField;
     QMImpArtidiomasIDIOMA: TFIBStringField;
     QMImpArtidiomasTITULO: TFIBStringField;
     QMImpArtidiomasIMPORTAR: TIntegerField;
     QMImpArtidiomasUNICODE: TMemoField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMImpArtidiomasAfterPost(DataSet: TDataSet);
     procedure QMImpArtidiomasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Filas: TObjectList;
     ColArticulo, ColIdioma, ColTitulo, ColUnicode: smallint;
     FilaSiguiente: boolean;
     MemoLog: TStrings;
  public
     { Public declarations }
     function LeerDatos(Archivo: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     function LlenarTablaTemporal(CArticulo, CIdioma, CTitulo, CUnicode: smallint): boolean;
     procedure BorrarTablaTemporal;
     procedure AbrirImp;
     procedure SeleccionarTodas(Modo: smallint);
     procedure Insertar(FuerzaIdioma: boolean; Idioma: string);
     function BuscarIdioma(Idioma: string): string; //sfg.ruth
     procedure AsignaLog(Memo: TStrings);
     procedure Log(Texto: string);
  end;

var
  DMAsistenteImpArtIdiomas : TDMAsistenteImpArtIdiomas;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils;

{$R *.dfm}

procedure TDMAsistenteImpArtIdiomas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  Filas := TObjectList.Create;
  MemoLog := nil;
end;

procedure TDMAsistenteImpArtIdiomas.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
  XLApp.Quit;
  BorrarTablaTemporal;
end;

function TDMAsistenteImpArtIdiomas.LeerDatos(Archivo: string): boolean;
var
  WorkBk : _WorkBook;
  WorkSheet : _WorkSheet;
  f, c, x, y, i, j : integer;
  IIndex : olevariant;
  Matrix : variant;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  IIndex := 1;
  Result := True;
  FilaSiguiente := False;
  try
     Columnas := TObjectList.Create;
     XLApp.Connect;
     try
        XLApp.WorkBooks.Open(Archivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, 0);

        WorkBk := XLApp.WorkBooks.Item[IIndex];
        WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;

        WorkSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

        with XLApp.Range['A1', XLApp.ActiveCell] do
        begin
           x := Rows.Count;
           y := Columns.Count;
           Matrix := Value;
        end;

        //XLApp.Quit;
        //XLApp.Disconnect;

        // Se eliminan las columnas vacías
        Columnas.Capacity := y;
        for c := 1 to y do
        begin
           StrList := TStringList.Create;
           for f := 1 to x do
              StrList.Add(LimpiaCeldaExcel(Matrix[f, c]));
           if Trim(StrList.Text) <> '' then
              Columnas.Add(StrList)
           else
              StrList.Free;
        end;

        //Matrix := Unassigned;

        // Se elimanan las filas vacías.
        Filas.Clear;
        Filas.Capacity := x;
        for f := 0 to x - 1 do
        begin
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add((Columnas.Items[c] as TStrings)[f]);
           if Trim(StrList.Text) <> '' then
              Filas.Add(StrList)
           else
              StrList.Free;
        end;

        // Asegurarse que las columnas tenga el título correcto
        i := 0;
        while (i < Columnas.Count) and
           ((IsValidIdent(Trim((Filas.Items[0] as TStrings)[i]))) or
              (Trim((Filas.Items[0] as TStrings)[i]) = '')) do
           i := i + 1;
        if ((i < Columnas.Count) and
           (Pos('ARTICULO', UpperCase((Filas.Items[0] as TStrings)[i])) = 0)) then
        begin
           StrList := TStringList.Create;
           for j := 0 to Columnas.Count - 1 do
              StrList.Add(_('Columna') + ' ' + IntToStr(j + 1));
           Filas.Insert(0, StrList);
           FilaSiguiente := True;
        end
        else
        { TODO : Verificar la variable J. No se inicializa y puede producir errores (2)}
        if (Trim((Filas.Items[0] as TStrings)[j]) = '') then
        begin
           (Filas.Items[0] as TStrings)[j] := _('Columna') + ' ' + IntToStr(j + 1);
           FilaSiguiente := True;
        end;

     finally
        Matrix := Unassigned;
        XLApp.Disconnect;
        XLApp.Quit;
        Columnas.Free;
     end;
  except
     on E: Exception do
     begin
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;

function TDMAsistenteImpArtIdiomas.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TDMAsistenteImpArtIdiomas.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

function TDMAsistenteImpArtIdiomas.LlenarTablaTemporal(CArticulo, CIdioma, CTitulo, CUnicode: smallint): boolean;
var
  colIni, i : integer;
  articulo, Idioma, titulo, unicode : string;
begin
  Result := True;

  ColArticulo := carticulo;
  ColIdioma := cidioma;
  ColTitulo := ctitulo;
  ColUnicode := cunicode;

  colIni := 1;  // Evitamos que copie la primera linea que es la de los titulos

  BorrarTablaTemporal;
  try
     for i := colIni to Filas.Count - 1 do
     begin
        if not (FilaSiguiente) then
        begin
           // sfg.ruth - Es comprova si hi ha art. si no hi és, s'obvia la fila
           if (((Filas.Items[i] as TStrings)[ColArticulo - 1]) <> '') then
           begin
              if (ColArticulo > 0) then
                 Articulo := Copy(((Filas.Items[i] as TStrings)[ColArticulo - 1]), 1, 15)
              else
                 Articulo := '';

              if (ColIdioma > 0) then
              begin
                 if (((Filas.Items[i] as TStrings)[ColIdioma - 1]) <> '') then
                    Idioma := BuscarIdioma(((Filas.Items[i] as TStrings)[ColIdioma - 1]));
              end
              else
                 Idioma := 'XXX';

              if (ColTitulo > 0) then
                 Titulo := Copy(((Filas.Items[i] as TStrings)[ColTitulo - 1]), 1, 256)
              else
                 Titulo := '';

              if (ColUnicode > 0) then
                 Unicode := Copy(((Filas.Items[i] as TStrings)[ColUnicode - 1]), 1, 3000)
              else
                 Unicode := '[/*NO_IMPORTAR*/]';

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO TMP_IMPORTAR_ART_IDIOMAS ( ');
                    SQL.Add(' ENTRADA, LINEA, EMPRESA, ARTICULO, IDIOMA, TITULO, UNICODE) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :ENTRADA, :LINEA, :EMPRESA, :ARTICULO, :IDIOMA, :TITULO, :UNICODE) ');

                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['LINEA'].AsInteger := i;
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['ARTICULO'].AsString := Articulo;
                    Params.ByName['IDIOMA'].AsString := Idioma;
                    Params.ByName['TITULO'].AsString := Titulo;
                    Params.ByName['UNICODE'].AsString := Unicode;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end // fi pregunta si existeix el NOM_COMERCIAL
           else
           begin
              Log(Format(_('No será traspasada la fila %d por falta de artículo'), [i]));
           end;
        end;  // fi for
        FilaSiguiente := False;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(Format(_('Ha ocurrido un error en la fila numero %d'), [i + colIni]) + #13#10 + E.Message);
        FilaSiguiente := True;
        Result := False;
     end;
  end;

  if (Result) then
     AbrirImp;
end;

procedure TDMAsistenteImpArtIdiomas.BorrarTablaTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM CRM_TMP_IMPORTAR_CONTACTOS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpArtIdiomas.SeleccionarTodas(Modo: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_IMPORTAR_ART_IDIOMAS SET IMPORTAR = :MODO WHERE ENTRADA = :ENTRADA';
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirImp;
end;

procedure TDMAsistenteImpArtIdiomas.QMImpArtIdiomasAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAsistenteImpArtIdiomas.QMImpArtIdiomasNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAsistenteImpArtIdiomas.AbrirImp;
begin
  with QMImpArtIdiomas do
  begin
     DisableControls;
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     EnableControls;
  end;
end;

procedure TDMAsistenteImpArtIdiomas.Insertar(FuerzaIdioma: boolean; Idioma: string);
begin
  QMImpArtIdiomas.First;

  while (not QMImpArtIdiomas.EOF) do
  begin
     if (QMImpArtIdiomasIMPORTAR.AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_IDIOMAS ( ');
              SQL.Add(' ARTICULO, IDIOMA, TITULO, EMPRESA ');
              if (QMImpArtIdiomasUNICODE.AsString <> '[/*NO_IMPORTAR*/]') then
                 SQL.Add(' , DESCRIPCION_EXTENDIDA ');
              SQL.Add(' ) VALUES ( ');
              SQL.Add(' :ARTICULO, :IDIOMA, :TITULO, :EMPRESA,  ');
              if (QMImpArtIdiomasUNICODE.AsString <> '[/*NO_IMPORTAR*/]') then
                 SQL.Add(' , :DESCRIPCION_EXTENDIDA ');
              SQL.Add(' ) MATCHING (EMPRESA, ARTICULO, IDIOMA) ');

              Params.ByName['ARTICULO'].AsString := QMImpArtIdiomasARTICULO.AsString;
              if (FuerzaIdioma) then
                 Params.ByName['IDIOMA'].AsString := Idioma
              else
                 Params.ByName['IDIOMA'].AsString := QMImpArtIdiomasIDIOMA.AsString;
              Params.ByName['TITULO'].AsString := QMImpArtIdiomasTITULO.AsString;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              if (QMImpArtIdiomasUNICODE.AsString <> '[/*NO_IMPORTAR*/]') then
                 Params.ByName['DESCRIPCION_EXTENDIDA'].AsString := QMImpArtIdiomasUNICODE.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Log(Format(_('Se ha traspaso con éxito: %s'), [QMImpArtIdiomasARTICULO.AsString]));
     end;
     QMImpArtIdiomas.Next;
  end;

  ShowMessage(_('Importación realizada'));
end;

function TDMAsistenteImpArtIdiomas.BuscarIdioma(Idioma: string): string;
begin
  xArtIdiomas.Close;
  xArtIdiomas.Params.ByName['IDIOMA'].AsString := Idioma;
  xArtIdiomas.Open;

  Result := xArtIdiomasIDIOMA.AsString;
end;

procedure TDMAsistenteImpArtIdiomas.AsignaLog(Memo: TStrings);
begin
  MemoLog := Memo;
end;

procedure TDMAsistenteImpArtIdiomas.Log(Texto: string);
begin
  if Assigned(MemoLog) then
     MemoLog.Add(Texto);
end;

end.
