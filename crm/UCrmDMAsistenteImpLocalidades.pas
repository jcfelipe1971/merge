unit UCrmDMAsistenteImpLocalidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TCrmDMAsistenteImpLocalidades = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     QLlenarTemporal: THYFIBQuery;
     QMLocalidadesImp: TFIBTableSet;
     DSQMLocalidadesImp: TDataSource;
     QInsertarLocalidad: THYFIBQuery;
     QMLocalidadesImpTITULO: TFIBStringField;
     QMLocalidadesImpPAIS: TFIBStringField;
     QMLocalidadesImpPROVINCIA: TFIBStringField;
     QMLocalidadesImpCODIGO_POSTAL: TFIBStringField;
     QMLocalidadesImpENTRADA: TIntegerField;
     QMLocalidadesImpLINEA: TIntegerField;
     QMLocalidadesImpIMPORTAR: TIntegerField;
     QMLocalidadesImpCOLONIA: TFIBStringField;
     QMLocalidadesImpTIPO_COLONIA: TFIBStringField;
     QMLocalidadesImpCIUDAD: TFIBStringField;
     QMLocalidadesImpCODIGO_PROVINCIA: TFIBStringField;
     QInsertarProvincia: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMLocalidadesImpAfterPost(DataSet: TDataSet);
     procedure QMLocalidadesImpNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Filas: TObjectList;
     ColTitulo, ColCP, ColProvincia, ColCodigo_Provincia, ColCiudad, ColColonia, ColTipo_Colonia: smallint;
     {ActBloq,} FilaSiguiente: boolean;
  public
     { Public declarations }
     function LeerDatos(Archivo: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     function LlenarTablaTemporal(cTitulo, cCP, cProvincia, cCodigo_Provincia, cCiudad, cColonia, cTipo_Colonia: smallint; cPais: string): boolean;
     procedure BorrarTablaTemporal;
     procedure AbrirLocalidadesImp;
     procedure SeleccionarTodas(Modo: smallint);
     procedure InsertarLocalidades;
     procedure InsertarProvincias;
     function BuscarLocalidad(Pais, CodigoPostal: string): string; //sfg.albert
     function VerificarProvincia(Provincia, Pais: string): boolean;
  end;

var
  CrmDMAsistenteImpLocalidades : TCrmDMAsistenteImpLocalidades;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, Variants, Dialogs, StrUtils,
  UCrmFMAsistenteImpLocalidades;

{$R *.dfm}

procedure TCrmDMAsistenteImpLocalidades.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  Filas := TObjectList.Create;
end;

procedure TCrmDMAsistenteImpLocalidades.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
  XLApp.Quit;
  BorrarTablaTemporal;
end;

function TCrmDMAsistenteImpLocalidades.LeerDatos(Archivo: string): boolean;
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

        // XLApp.Quit;
        // XLApp.Disconnect;

        // se eliminan las columnas vacías
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

        // Matrix := Unassigned;

        // se elimanan las filas vacías.
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

        // asegurarse que las columnas tenga el título correcto
        i := 0;
        j := 0;
        while (i < Columnas.Count) and
           ((IsValidIdent(Trim((Filas.Items[0] as TStrings)[i]))) or
              (Trim((Filas.Items[0] as TStrings)[i]) = '')) do
           i := i + 1;
        if ((i < Columnas.Count) and
           (Pos('ARTICULO', UpperCase((Filas.Items[0] as TStrings)[i])) = 0)) then
        begin
           StrList := TStringList.Create;
           for j := 0 to Columnas.Count - 1 do
              StrList.Add(Format(_('Columna %d'), [j + 1]));
           Filas.Insert(0, StrList);
           FilaSiguiente := True;
        end
        else
        if (Trim((Filas.Items[0] as TStrings)[j]) = '') then
        begin
           (Filas.Items[0] as TStrings)[j] := Format(_('Columna %d'), [j + 1]);
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

function TCrmDMAsistenteImpLocalidades.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TCrmDMAsistenteImpLocalidades.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

function TCrmDMAsistenteImpLocalidades.LlenarTablaTemporal(cTitulo, cCP, cProvincia, cCodigo_Provincia, cCiudad, cColonia, cTipo_Colonia: smallint; cPais: string): boolean;
var
  {NumFila,} colIni, I : integer;
  Titulo, Codigo_Postal, Provincia, Codigo_Provincia, Ciudad, Colonia, Tipo_Colonia, Pais : string;
begin
  Result := True;

  ColTitulo := cTitulo;
  ColCP := cCP;
  ColProvincia := cProvincia;
  ColCodigo_Provincia := cCodigo_Provincia;
  ColCiudad := cCiudad;
  ColColonia := cColonia;
  ColTipo_Colonia := cTipo_Colonia;
  Pais := cPais;

  colIni := 1;  // evitamos que copie la primera linea que es la de los titulos
  i := 0;
  BorrarTablaTemporal;
  try
     for i := colIni to Filas.Count - 1 do
     begin
        if not (FilaSiguiente) then
        begin
           with QLlenarTemporal do
           begin
              // NumFila := I;
              // sfg.albert - Es comprova si hi ha nom. si no hi és, s'obvia la fila
              if (((Filas.Items[I] as TStrings)[ColTitulo - 1]) <> '') then
              begin
                 if (ColTitulo > 0) then
                    Titulo := Copy(((Filas.Items[I] as TStrings)[ColTitulo - 1]), 1, 40)
                 else
                    Titulo := '';

                 if (ColCP > 0) then
                 begin
                    if (((Filas.Items[I] as TStrings)[ColCP - 1]) <> '') then
                       Codigo_Postal := Copy(((Filas.Items[I] as TStrings)[ColCP - 1]), 1, 10)
                    else
                       Codigo_Postal := '99999999';
                 end
                 else
                    Codigo_Postal := '0';

                 if (ColProvincia > 0) then
                    Provincia := Copy(((Filas.Items[I] as TStrings)[ColProvincia - 1]), 1, 20)
                 else
                    Provincia := '';

                 if (ColCodigo_Provincia > 0) then
                    Codigo_Provincia := Copy(((Filas.Items[I] as TStrings)[ColCodigo_Provincia - 1]), 1, 2)
                 else
                    Codigo_Provincia := '99';

                 if (ColCiudad > 0) then
                    Ciudad := Copy(((Filas.Items[I] as TStrings)[ColCiudad - 1]), 1, 40)
                 else
                    Ciudad := '';

                 if (ColColonia > 0) then
                    Colonia := Copy(((Filas.Items[I] as TStrings)[ColColonia - 1]), 1, 40)
                 else
                    Colonia := '';

                 if (ColTipo_Colonia > 0) then
                    Tipo_Colonia := Copy(((Filas.Items[I] as TStrings)[ColTipo_Colonia - 1]), 1, 40)
                 else
                    Tipo_Colonia := '';

                 // Es comprova que no hi hagi valors nuls

                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['LINEA'].AsInteger := I;
                 Params.ByName['TITULO'].AsString := Titulo;
                 Params.ByName['CODIGO_POSTAL'].AsString := Codigo_Postal;
                 Params.ByName['PROVINCIA'].AsString := Provincia;
                 Params.ByName['PAIS'].AsString := Pais;
                 Params.ByName['CODIGO_PROVINCIA'].AsString := Codigo_Provincia;
                 Params.ByName['CIUDAD'].AsString := Ciudad;
                 Params.ByName['COLONIA'].AsString := Colonia;
                 Params.ByName['TIPO_COLONIA'].AsString := Tipo_Colonia;

                 ExecQuery;
                 FreeHandle;
              end // fi pregunta si existeix el Titulo
              else
              begin
                 CrmFMAsistenteImpLocalidades.Log(Format(_('No será traspasada la fila %d por falta de Título'), [i]));
              end;
           end; // fi with
        end;  // fi for
        FilaSiguiente := False;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(Format(_('Ha ocurrido un error en la fila numero %d)'), [i + colIni]) + #13#10 + E.Message);
        FilaSiguiente := True;
        Result := False;
     end;
  end;

  if (Result) then
     AbrirLocalidadesImp;
end;

procedure TCrmDMAsistenteImpLocalidades.BorrarTablaTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM CRM_TMP_IMPORTAR_LOCALIDADES WHERE ENTRADA=?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMAsistenteImpLocalidades.SeleccionarTodas(Modo: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE CRM_TMP_IMPORTAR_LOCALIDADES SET IMPORTAR=?MODO WHERE ENTRADA=?ENTRADA';
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirLocalidadesImp;
end;

procedure TCrmDMAsistenteImpLocalidades.QMLocalidadesImpAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TCrmDMAsistenteImpLocalidades.QMLocalidadesImpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TCrmDMAsistenteImpLocalidades.AbrirLocalidadesImp;
begin
  with QMLocalidadesImp do
  begin
     DisableControls;
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     EnableControls;
  end;
end;

procedure TCrmDMAsistenteImpLocalidades.InsertarLocalidades;
var
  i : integer;
  // idLocalidad : integer;
  Localidad : string;
  Pais, PaisC2 : string;
begin
  QMLocalidadesImp.First;

  Pais := QMLocalidadesImpPAIS.AsString;
  // Obtengo PAIS_C2 para generar el codigo de localidad
  PaisC2 := DamePaisC2(Pais);
  {$IFDEF Debug}
  CrmFMAsistenteImpLocalidades.Log(_(Format('Utilizo prefijo %s', [PaisC2])));
  {$ENDIF}

  // Obtengo la última localidad importada para ese pais
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LOCALIDAD) FROM SYS_LOCALIDADES WHERE PAIS=?PAIS AND LOCALIDAD STARTING WITH ?PAIS_C2';
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['PAIS_C2'].AsString := PaisC2;
        ExecQuery;
        Localidad := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  {$IFDEF Debug}
  CrmFMAsistenteImpLocalidades.Log(_(Format('Max Localidad: %s', [Localidad])));
  {$ENDIF}

  // Empezare a contar desde el ultimo importado +1
  i := StrToIntDef(Copy(Localidad, 3, 6), 0) + 1;
  {$IFDEF Debug}
  CrmFMAsistenteImpLocalidades.Log(_(Format('Nro. siguiente contador localidad: %.6d', [i])));
  {$ENDIF}

  // Recorro las localidades importadas al temporal y las importo en SYS_LOCALIDADES
  while (not QMLocalidadesImp.EOF) do
  begin
     if (QMLocalidadesImpIMPORTAR.AsInteger = 1) then
     begin
        // idLocalidad := DMMain.ContadorGen('ID_LOCALIDADES');
        Localidad := Format('%s%.6d', [PaisC2, i]);
        {$IFDEF Debug}
        CrmFMAsistenteImpLocalidades.Log(_(Format('(%.6d) Traspasando %s', [i, Localidad])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         TITULO %s', [QMLocalidadesImpTITULO.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         CODIGO_POSTAL %s', [QMLocalidadesImpCODIGO_POSTAL.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         PAIS %s', [QMLocalidadesImpPAIS.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         PROVINCIA %s', [QMLocalidadesImpCODIGO_PROVINCIA.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         CIUDAD %s', [QMLocalidadesImpCIUDAD.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         COLONIA %s', [QMLocalidadesImpCOLONIA.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('         TIPO_COLONIA %s', [QMLocalidadesImpTIPO_COLONIA.AsString])));
        {$ENDIF}

        with QInsertarLocalidad do
        begin
           Close;
           Params.ByName['LOCALIDAD'].AsString := Localidad;
           Params.ByName['TITULO'].AsString := QMLocalidadesImpTITULO.AsString;
           Params.ByName['CODIGO_POSTAL'].AsString := QMLocalidadesImpCODIGO_POSTAL.AsString;
           Params.ByName['PAIS'].AsString := QMLocalidadesImpPAIS.AsString;
           Params.ByName['PROVINCIA'].AsString := QMLocalidadesImpCODIGO_PROVINCIA.AsString;
           Params.ByName['CIUDAD'].AsString := QMLocalidadesImpCIUDAD.AsString;
           Params.ByName['COLONIA'].AsString := QMLocalidadesImpCOLONIA.AsString;
           Params.ByName['TIPO_COLONIA'].AsString := QMLocalidadesImpTIPO_COLONIA.AsString;

           Prepare;
           ExecQuery;
           FreeHandle;
        end;
        CrmFMAsistenteImpLocalidades.Log(_(Format('(%d) Se traspaso con éxito : %s %s', [i, Localidad, QMLocalidadesImpTITULO.AsString])));
     end;
     QMLocalidadesImp.Next;
     Inc(i);
  end;

  ShowMessage(_('Importación realizada'));
end;

procedure TCrmDMAsistenteImpLocalidades.InsertarProvincias;
var
  ultim : string;
begin
  QMLocalidadesImp.First;

  while (not QMLocalidadesImp.EOF) do
  begin
     if ((QMLocalidadesImpIMPORTAR.AsInteger = 1) and
        (ultim <> QMLocalidadesImpCODIGO_PROVINCIA.AsString) and
        (Trim(QMLocalidadesImpCODIGO_PROVINCIA.AsString) > '')) then
     begin
        {$IFDEF Debug}
        CrmFMAsistenteImpLocalidades.Log(_('Importando Provincia'));
        CrmFMAsistenteImpLocalidades.Log(_(Format('       PAIS %s', [QMLocalidadesImpPAIS.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('       CODIGO_PROVINCIA %s', [QMLocalidadesImpCODIGO_PROVINCIA.AsString])));
        CrmFMAsistenteImpLocalidades.Log(_(Format('       TITULO %s', [QMLocalidadesImpPROVINCIA.AsString])));
        {$ENDIF}
        ultim := QMLocalidadesImpCODIGO_PROVINCIA.AsString;
        if not (VerificarProvincia(QMLocalidadesImpCODIGO_PROVINCIA.AsString, QMLocalidadesImpPAIS.AsString)) then
        begin
           with QInsertarProvincia do
           begin
              Params.ByName['PAIS'].AsString := QMLocalidadesImpPAIS.AsString;
              Params.ByName['CODIGO_PROVINCIA'].AsString := QMLocalidadesImpCODIGO_PROVINCIA.AsString;
              Params.ByName['TITULO'].AsString := QMLocalidadesImpPROVINCIA.AsString;

              Prepare;
              ExecQuery;
              FreeHandle;
           end;
        end;
        CrmFMAsistenteImpLocalidades.Log(_(Format('(Provincia) Se traspaso con éxito: %s', [QMLocalidadesImpCODIGO_PROVINCIA.AsString])));
     end;
     QMLocalidadesImp.Next;
  end;
  if not (VerificarProvincia('99', QMLocalidadesImpPAIS.AsString)) then
  begin
     with QInsertarProvincia do
     begin
        Params.ByName['PAIS'].AsString := QMLocalidadesImpPAIS.AsString;
        Params.ByName['CODIGO_PROVINCIA'].AsString := '99';
        Params.ByName['TITULO'].AsString := '.';

        Prepare;
        ExecQuery;
        FreeHandle;
     end;
  end;
end;

function TCrmDMAsistenteImpLocalidades.VerificarProvincia(Provincia, Pais: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) PROVINCIA FROM SYS_PROVINCIAS WHERE PAIS=?PAIS AND PROVINCIA=?PROVINCIA';
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['PROVINCIA'].AsString := Provincia;
        ExecQuery;
        Result := (Trim(FieldByName['PROVINCIA'].AsString) > '');
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TCrmDMAsistenteImpLocalidades.BuscarLocalidad(Pais, CodigoPostal: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) LOCALIDAD FROM SYS_LOCALIDADES WHERE PAIS=?PAIS AND CODIGO_POSTAL=?CODIGO_POSTAL';
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['CODIGO_POSTAL'].AsString := CodigoPostal;
        ExecQuery;
        Result := FieldByName['LOCALIDAD'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
