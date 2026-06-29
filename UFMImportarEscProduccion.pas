unit UFMImportarEscProduccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, UFPEditSinNavegador, ULFLabel,
  ULFComboBox, ULFEdit, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMImportarEscProduccion = class(TFPEditSinNavegador)
     PNLFichero: TLFPanel;
     EdArchivoImp: TLFEdit;
     CBHojaAImportar: TLFComboBox;
     ButtSelArchivo: TButton;
     BInformacionHoja: TButton;
     LInformacionHoja: TLFLabel;
     PBProgresoImportacion: TProgressBar;
     LFCBPrimeraFilaTitulos: TLFCheckBox;
     LSeparadorDecimal: TLFLabel;
     ESeparadorDecimal: TLFEdit;
     SGDatosImp: TStringGrid;
     BLeerExcel: TButton;
     LLog: TLabel;
     Arbol: TTreeView;
     spl1: TSplitter;
     PNLDatos: TLFPanel;
     PNLFiltros: TLFPanel;
     LArticulo: TLFLabel;
     EArticulo: TLFEdit;
     BBusquedaAnterior: TButton;
     BBusquedaSiguiente: TButton;
     BRecrearMaterialesEscandallo: TButton;
     procedure EdArchivoImpChange(Sender: TObject);
     procedure CBHojaAImportarChange(Sender: TObject);
     procedure ButtSelArchivoClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BLeerExcelClick(Sender: TObject);
     procedure SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure SGDatosImpSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
     procedure SGDatosImpDblClick(Sender: TObject);
     procedure ArbolClick(Sender: TObject);
     procedure EArticuloChange(Sender: TObject);
     procedure SGDatosImpClick(Sender: TObject);
     procedure BBusquedaSiguienteClick(Sender: TObject);
     procedure BBusquedaAnteriorClick(Sender: TObject);
     procedure BRecrearMaterialesEscandalloClick(Sender: TObject);
  private
     SelectedCol, SelectedRow: integer;
     ArticuloBusqueda: string;
     LineaBusqueda: integer;
     procedure RefrescaInformacionArchivo;
     function CheckArchivoImp: boolean;
     function LeerDatos(Archivo, Hoja: string): boolean;
     procedure RefrescarArbol;
     procedure ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
     procedure PosicionaArticulo(Articulo: string; Linea: integer = 0; Direccion: string = 'N');
  end;

var
  FMImportarEscProduccion : TFMImportarEscProduccion;

implementation

uses UDMMain, UFMain, UEntorno, UUtiles, UDMImportarEscProduccion, UHojaCalc, HYFIBQuery, idGlobalProtocols, UDameDato;

{$R *.DFM}

{published}

procedure TFMImportarEscProduccion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImportarEscProduccion, DMImportarEscProduccion);
  ArticuloBusqueda := '';

  EdArchivoImp.Text := LeeDatoIni('ImportacionEscProduccion', 'UltimoArchivo', '');
  CBHojaAImportar.Text := LeeDatoIni('ImportacionEscProduccion', 'UltimaHoja', '');
  PBProgresoImportacion.Visible := False;

  // Refresco los datos a importar
  RefrescaInformacionArchivo;
end;

procedure TFMImportarEscProduccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImportarEscProduccion);
end;

procedure TFMImportarEscProduccion.EdArchivoImpChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFMImportarEscProduccion.CBHojaAImportarChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFMImportarEscProduccion.ButtSelArchivoClick(Sender: TObject);
var
  HojaActiva : string;
  Sheets : TStrings;
  Archivo : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);
  if MyOpenDialog(Archivo, 'XLS,ODS,CSV', '', 'FMImportarEscProduccion-SelArchivo') then
  begin
     EdArchivoImp.Text := Archivo;
     Sheets := TStringList.Create;
     try
        HojaActiva := CBHojaAImportar.Text;
        RefrescaInformacionArchivo;
     finally
        Sheets.Free;
     end;
  end;
end;

procedure TFMImportarEscProduccion.RefrescaInformacionArchivo;
var
  Filas, Columnas, i, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
begin
  Sheets := TStringList.Create;
  try
     if FileExists(EdArchivoImp.Text) then
     begin
        HojaActiva := CBHojaAImportar.Text;
        LFCBPrimeraFilaTitulos.Checked := LeeDatoIni(ExtractFileName(EdArchivoImp.Text), 'PrimeraFilaTitulos', LFCBPrimeraFilaTitulos.Checked);
        ESeparadorDecimal.Text := LeeDatoIni(ExtractFileName(EdArchivoImp.Text), 'SeparadorDecimal', ESeparadorDecimal.Text);

        ActualizaDatosImportacion(EdArchivoImp.Text, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);
     end;
     CBHojaAImportar.Items.Clear;
     CBHojaAImportar.Items.AddStrings(Sheets);

     CBHojaAImportar.Text := HojaActiva;
     i := CBHojaAImportar.Items.IndexOf(HojaActiva);
     if (i >= 0) then
        CBHojaAImportar.ItemIndex := CBHojaAImportar.Items.IndexOf(HojaActiva);
     LInformacionHoja.Caption := format(_('Hoja: %s - Filas: %d - Columnas %d'), [HojaActiva, Filas, Columnas]);
  finally
     Sheets.Free;
  end;
end;

function TFMImportarEscProduccion.CheckArchivoImp: boolean;
var
  r, n : integer;
  ConjuntoSoldado : string;
begin
  Result := False;

  if (EdArchivoImp.Text = '') then
  begin
     Application.MessageBox(PChar(string(_('Debe de seleccionar el archivo a importar.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
     Exit;
  end;

  if (not FileExists(EdArchivoImp.Text)) then
  begin
     Application.MessageBox(PChar(string(_('El archivo seleccionado no existe.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
     Exit;
  end;

  Result := LeerDatos(EdArchivoImp.Text, CBHojaAImportar.Text);

  if (Result) then
  begin
     with SGDatosImp do
     begin
        Cells[0, 0] := _('Linea');
        Cells[1, 0] := _('Nivel');
        Cells[2, 0] := _('A');
        Cells[3, 0] := _('CS');
        ColWidths[0] := 35;
        ColWidths[1] := 35;
        ColWidths[2] := 15;
        ColWidths[3] := 20;
        ColWidths[4] := 70;
        ColWidths[5] := 180;
        ColWidths[6] := 60;
        ColWidths[7] := 400;
        ColWidths[8] := 70;
        ColWidths[9] := 180;
        ColWidths[10] := 70;
        ColWidths[11] := 70;
        ColWidths[12] := 60;
        ColWidths[13] := 60;

        ConjuntoSoldado := '';
        n := 0;
        for r := 1 to RowCount - 1 do
        begin
           // Primera columna fija tiene nros de linea
           Cells[0, r] := IntToStr(r);

           if (ConjuntoSoldado = '') then
           begin
              // Propiedades de articulo (Es ConjuntoSoldado)
              if (Cells[FixedCols, r] = 'ASSEMBLY') and (Pos('-CS-', Cells[FixedCols + 1, r]) > 0) and (ConjuntoSoldado = '') then
              begin
                 Cells[3, r] := 'C';
                 ConjuntoSoldado := Cells[FixedCols + 1, r];
              end
              else
              begin
                 // Propiedades de articulo (EXISTE)
                 if (Copy(Cells[FixedCols + 1, r], 1, 10) <> 'FINDEGRUPO') and (DameIDArticulo(Cells[FixedCols + 1, r]) = 0) then
                    Cells[2, r] := 'X';

                 // Segunda columna fija tiene "nivel" del escandallo
                 if (Cells[FixedCols, r] = 'ASSEMBLY') then
                    Inc(n)
                 else
                 if Copy(Cells[FixedCols + 1, r], 1, 10) = 'FINDEGRUPO' then
                 begin
                    Dec(n);
                    ConjuntoSoldado := '';
                 end;
              end;
           end
           else
           begin
              Cells[3, r] := 'C';

              if Cells[FixedCols + 1, r] = 'FINDEGRUPO-' + ConjuntoSoldado then
                 ConjuntoSoldado := '';
           end;

           Cells[1, r] := IntToStr(n);
        end;
     end;

     EscribeDatoIni('ImportacionEscProduccion', 'UltimoArchivo', Trim(EdArchivoImp.Text));
     EscribeDatoIni('ImportacionEscProduccion', 'UltimaHoja', Trim(CBHojaAImportar.Text));

     EscribeDatoIni(ExtractFileName(EdArchivoImp.Text), 'FechaImportacion', Now);
     EscribeDatoIni(ExtractFileName(EdArchivoImp.Text), 'PrimeraFilaTitulos', LFCBPrimeraFilaTitulos.Checked);
     EscribeDatoIni(ExtractFileName(EdArchivoImp.Text), 'SeparadorDecimal', ESeparadorDecimal.Text);
  end;

  RefrescarArbol;
end;

function TFMImportarEscProduccion.LeerDatos(Archivo, Hoja: string): boolean;
var
  HCalc : THojaCalc;
  f, c, x, y, i : integer;
  LineaTitulos : integer;
  Temporal : string;
begin
  /// Inserta los datos del archivo en filas y columnas.
  /// La primera fila la dejará vacia para rellenarlo con el campo donde insertar el dato.

  // Copia .XLSX a temporal a .XLS para poder leerlo con THojaCalc
  if (UpperCase(ExtractFileExt(Archivo)) = '.XLSX') then
  begin
     Temporal := GetTempFile('.XLS');
     if CopyFileTo(Archivo, Temporal) then
        Archivo := Temporal;
  end;

  Result := True;
  try
     LineaTitulos := 0;
     if LFCBPrimeraFilaTitulos.Checked then
        LineaTitulos := 1;

     for i := 0 to SGDatosImp.ColCount - 1 do
        SGDatosImp.Cols[i].Clear;

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

        PBProgresoImportacion.Min := 0;
        PBProgresoImportacion.Max := y;
        PBProgresoImportacion.Visible := True;
        SGDatosImp.RowCount := x + SGDatosImp.FixedRows;
        SGDatosImp.ColCount := y + SGDatosImp.FixedCols;

        for c := 1 to y do
        begin
           PBProgresoImportacion.Position := c;
           SGDatosImp.Cols[c + SGDatosImp.FixedCols - 1].BeginUpdate;
           try
              for f := 1 to x do
              begin
                 try
                    SGDatosImp.Cols[c + SGDatosImp.FixedCols - 1][f - 1 + LineaTitulos] := LimpiaCeldaExcel(HCalc.CellText[f, c]);
                 except
                    SGDatosImp.Cols[c + SGDatosImp.FixedCols - 1][f - 1 + LineaTitulos] := _('ERROR');
                 end;
              end;
           finally
              SGDatosImp.Cols[c - 1].EndUpdate;
           end;
        end;

        DMMain.Log('Fin importacion');
     finally
        Sleep(1000);
        DMMain.Log('I Liberar Excel');
        HCalc.Free;
        PBProgresoImportacion.Position := 0;
        PBProgresoImportacion.Visible := False;
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

procedure TFMImportarEscProduccion.RefrescarArbol;
var
  Nodo, NodoHijo : TTreeNode;
  r : integer;
  Tipo, Articulo, Titulo, Cantidad : string;
  ConjuntoSoldado : boolean;
begin
  r := 1;
  Arbol.Items.BeginUpdate;
  try
     Arbol.Items.Clear;
     if (SGDatosImp.Cells[SGDatosImp.FixedCols, r] = 'ASSEMBLY') then
     begin
        Tipo := SGDatosImp.Cells[SGDatosImp.FixedCols, r];
        Articulo := SGDatosImp.Cells[SGDatosImp.FixedCols + 1, r];
        Titulo := SGDatosImp.Cells[SGDatosImp.FixedCols + 3, r];
        Cantidad := SGDatosImp.Cells[SGDatosImp.FixedCols + 2, r];

        Nodo := Arbol.Items.Add(nil, Format(_('ASSEMBLY %s %s %s'), [Articulo, Titulo, Cantidad]));
        Nodo.SelectedIndex := 0;
        Nodo.Data := Pointer(r);
        Arbol.Items[0].Expand(True);

        while SGDatosImp.RowCount > r do
        begin
           Inc(r);

           ConjuntoSoldado := (SGDatosImp.Cells[3, r] = 'C');
           Tipo := SGDatosImp.Cells[SGDatosImp.FixedCols, r];
           Articulo := SGDatosImp.Cells[SGDatosImp.FixedCols + 1, r];
           Titulo := SGDatosImp.Cells[SGDatosImp.FixedCols + 3, r];
           Cantidad := SGDatosImp.Cells[SGDatosImp.FixedCols + 2, r];

           if (not ConjuntoSoldado) then
           begin
              if Assigned(Nodo) then
              begin
                 if (Tipo = 'ASSEMBLY') then
                 begin
                    Nodo := Arbol.Items.AddChild(Nodo, Format(_('ASSEMBLY %-15.15s %5.5s x %s'), [Articulo, Cantidad, Titulo]));
                    Nodo.Data := Pointer(r);
                 end
                 else
                 if Copy(Articulo, 1, 10) = 'FINDEGRUPO' then
                 begin
                    Nodo := Nodo.Parent;
                 end
                 else
                 if (Tipo = 'PART') then
                 begin
                    NodoHijo := Arbol.Items.AddChild(Nodo, Format(_('PART %-15.15s %5.5s x %s'), [Articulo, Cantidad, Titulo]));
                    NodoHijo.Data := Pointer(r);
                 end;
              end;
           end
           else
           begin
              // Un Conjunto Soldado lo agrego como un material
              if (Pos('-CS-', Articulo) > 0) and (Copy(Articulo, 1, 10) <> 'FINDEGRUPO') and Assigned(Nodo) then
              begin
                 NodoHijo := Arbol.Items.AddChild(Nodo, Format(_('PART %-15.15s %5.5s x %s'), [Articulo, Cantidad, Titulo]));
                 NodoHijo.Data := Pointer(r);
              end;
           end;
        end;
     end;
  finally
     Arbol.Items.EndUpdate;
  end;
end;

procedure TFMImportarEscProduccion.ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
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

procedure TFMImportarEscProduccion.BLeerExcelClick(Sender: TObject);
begin
  inherited;
  CheckArchivoImp;
end;

procedure TFMImportarEscProduccion.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
     if (ACol < FixedCols) or (ARow < FixedRows) then
     begin
        Canvas.Brush.Color := FixedColor;
        Canvas.Font.Color := Font.Color;
     end
     else
     if gdFocused in State then
        ColorFocused(Canvas)
     else
     if gdSelected in State then
        ColorFocused(Canvas)
     else
     begin
        // Columna "EXISTE ARTICULO"
        if (ACol = 2) then
        begin
           if Cells[ACol, ARow] = 'X' then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end
        else
        // Columna "CONJUNTO SOLDADO"
        if (ACol = 3) then
        begin
           if Cells[ACol, ARow] = 'C' then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end
        else
        // Columna TIPO
        if (ACol = FixedCols + 0) then
        begin
           if Cells[ACol, ARow] = 'PART' then
              ColorEdicion(Canvas)
           else
           if Cells[ACol, ARow] = 'ASSEMBLY' then
              ColorResaltado6(Canvas)
           else
              ColorError(Canvas);
        end
        else
        // Columna ARTICULO
        if (ACol = FixedCols + 1) then
        begin
           if (ArticuloBusqueda > '') and (Pos(ArticuloBusqueda, Cells[ACol, ARow]) > 0) then
              ColorResaltado2(Canvas)
           else
           if Cells[3, ARow] = 'C' then
              ColorInactivo(Canvas)
           else
           if Copy(Cells[ACol, ARow], 1, 10) = 'FINDEGRUPO' then
              ColorResaltado5(Canvas)
           else
           if Cells[2, ARow] = 'X' then
              ColorBloqueado(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        // Columna DESCRIPCION, COD_PROV
        if (ACol = FixedCols + 3) or (ACol = FixedCols + 5) then
        begin
           if (ArticuloBusqueda > '') and (Pos(ArticuloBusqueda, Cells[ACol, ARow]) > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
           ColorInfo(Canvas);
     end;

     Canvas.FillRect(Rect);

     if (ACol < FixedCols) or (ARow < FixedRows) then
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[ACol, ARow])
     else
     // Justificar a la izquierda
     if (ACol - FixedCols + 1 in [1, 2, 4, 6, 7, 8, 9, 10]) then
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[ACol, ARow])
     else
     // Justificar a la derecha
     if (ACol - FixedCols + 1 in [0, 3, 5]) then
        Canvas.TextRect(Rect, Rect.Right - 2 - Canvas.TextWidth(Cells[ACol, ARow]), Rect.Top + 2, Cells[ACol, ARow])
     else
        // Justificar al centro
        Canvas.TextRect(Rect, (Rect.Left + Rect.Right - Canvas.TextWidth(Cells[ACol, ARow])) div 2, Rect.Top + 2, Cells[ACol, ARow]);
  end;

  inherited;
end;

procedure TFMImportarEscProduccion.SGDatosImpSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  inherited;
  SelectedCol := ACol;
  SelectedRow := ARow;

  LLog.Caption := format('Col %d - Row %d -> %s', [SelectedCol, SelectedRow, SGDatosImp.Cells[SelectedCol, SelectedRow]]);
end;

procedure TFMImportarEscProduccion.SGDatosImpDblClick(Sender: TObject);
begin
  inherited;
  with SGDatosImp do
  begin
     LLog.Caption := format('DblClick - Col %d - Row %d -> %s', [SelectedCol, SelectedRow, Cells[SelectedCol, SelectedRow]]);

     // Articulos
     if (SelectedCol = FixedCols + 1) then
     begin
        if (Cells[2, SelectedRow] = 'X') and (Cells[3, SelectedRow] <> 'C') {and (Cells[FixedCols + 0, SelectedRow] = 'PART')} then
        begin
           if (MessageDlg(Format(_('El artículo %s - %s no existe.' + #13#10 + '¿Desea crear el artículo?'), [Cells[FixedCols + 1, SelectedRow], Cells[FixedCols + 3, SelectedRow]]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' EXECUTE PROCEDURE INSERTA_ARTICULO_A_IMPORTAR(?EMPRESA, ?EJERCICIO, ?CANAL, ?ARTICULO, ?TITULO, ?ENTRADA, ?FAMILIA, ?SUBFAMILIA, ?PROVEEDOR, ?CODIGO_PROVEEDOR) ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['ARTICULO'].AsString := Trim(Cells[FixedCols + 1, SelectedRow]);
                    Params.ByName['TITULO'].AsString := Trim(Cells[FixedCols + 3, SelectedRow]);
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['FAMILIA'].AsString := Trim(Cells[FixedCols + 6, SelectedRow]);
                    Params.ByName['SUBFAMILIA'].AsString := Trim(Cells[FixedCols + 7, SelectedRow]);
                    Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(Cells[FixedCols + 4, SelectedRow], 0);
                    Params.ByName['CODIGO_PROVEEDOR'].AsString := Trim(Cells[FixedCols + 5, SelectedRow]);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Cells[2, SelectedRow] := '';
              FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + Cells[SelectedCol, SelectedRow] + '''');
           end;
        end
        else
           FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + Cells[SelectedCol, SelectedRow] + '''');
     end;
  end;
end;

procedure TFMImportarEscProduccion.ArbolClick(Sender: TObject);
var
  r : integer;
  t : TTreeNode;
begin
  inherited;
  r := -1;
  t := TTreeView(Sender).Selected;
  if Assigned(T) then
  begin
     r := integer(T.Data);
  end;

  if (r >= 0) then
     SGDatosImp.Row := r;
end;

procedure TFMImportarEscProduccion.SGDatosImpClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := 0;
  while Arbol.Items.Count > i do
  begin
     if (integer(Arbol.Items[i].Data) = SGDatosImp.Row) then
     begin
        Arbol.Items[i].Selected := True;
        i := Arbol.Items.Count;
     end;

     Inc(i);
  end;
  Arbol.Repaint;
end;

procedure TFMImportarEscProduccion.EArticuloChange(Sender: TObject);
begin
  inherited;
  PosicionaArticulo(Trim(EArticulo.Text));
end;

procedure TFMImportarEscProduccion.PosicionaArticulo(Articulo: string; Linea: integer = 0; Direccion: string = 'N');
var
  i : integer;
begin
  LLog.Caption := '';

  ArticuloBusqueda := Articulo;
  LineaBusqueda := Linea;

  i := LineaBusqueda;
  if (Direccion = 'N') then
  begin
     if (LineaBusqueda < SGDatosImp.RowCount) then
        i := LineaBusqueda + 1;
     while (SGDatosImp.RowCount > i) do
     begin
        LLog.Caption := format('Buscando en línea %d', [i]);
        if ((Pos(Articulo, SGDatosImp.Cells[SGDatosImp.FixedCols + 1, i]) > 0) or
           (Pos(Articulo, SGDatosImp.Cells[SGDatosImp.FixedCols + 3, i]) > 0) or
           (Pos(Articulo, SGDatosImp.Cells[SGDatosImp.FixedCols + 5, i]) > 0)) then
        begin
           LLog.Caption := format('Encontrador en línea %d', [i]);
           SGDatosImp.Row := i;
           LineaBusqueda := i;
           i := SGDatosImp.RowCount;
        end;

        Inc(i);
     end;
  end
  else
  begin
     if (LineaBusqueda > 0) then
        i := LineaBusqueda - 1;
     while (i > 0) do
     begin
        LLog.Caption := format('Buscando en línea %d', [i]);
        if ((Pos(Articulo, SGDatosImp.Cells[SGDatosImp.FixedCols + 1, i]) > 0) or
           (Pos(Articulo, SGDatosImp.Cells[SGDatosImp.FixedCols + 3, i]) > 0) or
           (Pos(Articulo, SGDatosImp.Cells[SGDatosImp.FixedCols + 5, i]) > 0)) then
        begin
           LLog.Caption := format('Encontrador en línea %d', [i]);
           SGDatosImp.Row := i;
           LineaBusqueda := i;
           i := 0;
        end;

        Dec(i);
     end;
  end;
  SGDatosImp.Repaint;

  {
  i := 0;
  while Arbol.Items.Count > i do
  begin
     if (Pos(Articulo, Arbol.Items[i].Text) > 0) then
     begin
        Arbol.Items[i].Selected := True;
        i := Arbol.Items.Count;
     end;

     Inc(i);
  end;
  }
  Arbol.Repaint;
end;

procedure TFMImportarEscProduccion.BBusquedaSiguienteClick(Sender: TObject);
begin
  inherited;
  PosicionaArticulo(Trim(EArticulo.Text), LineaBusqueda, 'N');
end;

procedure TFMImportarEscProduccion.BBusquedaAnteriorClick(Sender: TObject);
begin
  inherited;
  PosicionaArticulo(Trim(EArticulo.Text), LineaBusqueda, 'P');
end;

procedure TFMImportarEscProduccion.BRecrearMaterialesEscandalloClick(Sender: TObject);
var
  Compuesto : string;
  r, ri, rf : integer;
  s : string;
  p : integer;
begin
  inherited;
  with SGDatosImp do
  begin
     // Busco el inicio de compuesto
     ri := Row;
     while (Cells[4, ri] <> 'ASSEMBLY') or (Cells[3, ri] = 'C') and (ri > 1) do
        ri := ri - 1;
     LLog.Caption := format('Seleccion %d, ???', [ri]);
     Application.ProcessMessages;

     if (Cells[4, ri] <> 'ASSEMBLY') and (Cells[3, ri] <> 'C') then
        ShowMessage(_('No se encontro Compuesto'))
     else
        Compuesto := Cells[5, ri];
     LLog.Caption := format('Seleccion %d, ??? - Compuesto: %s', [ri, Compuesto]);
     Application.ProcessMessages;

     // Buysco el final de compuesto
     rf := Row;
     while (Cells[5, rf] <> 'FINDEGRUPO-' + Compuesto) and (rf < RowCount) do
        rf := rf + 1;
     LLog.Caption := format('Seleccion %d, %d - Compuesto: %s', [ri, rf, Compuesto]);
     Application.ProcessMessages;

     p := 0;
     s := '';
     r := ri;
     while (r < rf) do
     begin
        if (Cells[4, r] = 'ASSEMBLY') and (Cells[3, r] <> 'C') then
        begin
           s := s + Copy('----------', 1, p * 3) + Cells[5, r] + #13#10;
           Inc(p);
        end
        else
        if (Pos('FINDEGRUPO-', Cells[5, r]) > 0) and (Cells[3, r] <> 'C') then
        begin
           Dec(p);
        end;

        Inc(r);
     end;
     if (Length(s) > 400) then
        s := Copy(s, 1, 400) + '...';

     ShowMessage(s);

     LLog.Caption := format('Seleccion %d, %d - Compuesto: %s - Abre compuesto', [ri, rf, Compuesto]);
     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'COMPUESTO = ''' + Compuesto + '''');
  end;
end;

end.
