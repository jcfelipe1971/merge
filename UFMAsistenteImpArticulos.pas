unit UFMAsistenteImpArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox, Menus,
  ValEdit, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, UTeclas, UControlEdit, UEditPanel;

type
  TFMAsistenteImpArticulos = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TSSeleccionArchivo: TTabSheet;
     LBLSeleccionarArticulo: TLFLabel;
     TVMain: TTreeView;
     TSAsociarColumnas: TTabSheet;
     LBLAsociarColumnas: TLFLabel;
     TSImportar: TTabSheet;
     LImportarArticulos: TLFLabel;
     GBArchivo: TGroupBox;
     GBAsociarColumnas: TGroupBox;
     SGDatosImp: TStringGrid;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     PNLBotones: TLFPanel;
     PNLAsosciarColumnas: TLFPanel;
     PNLArticulo: TLFPanel;
     PNLImportar: TLFPanel;
     ProgresoImportacion: TProgressBar;
     Splitter: TSplitter;
     PMCamposDisponibles: TPopupMenu;
     MINoImportar: TMenuItem;
     LFCBPrimeraFilaTitulos: TLFCheckBox;
     LInformacionHoja: TLFLabel;
     BInformacionHoja: TButton;
     CBHojaAImportar: TLFComboBox;
     VLEValoresConstantes: TValueListEditor;
     PNLTitulos: TLFPanel;
     LUltimaFilaImportada: TLFLabel;
     EUltimaFilaImportada: TLFEdit;
     PProgresoImportacion: TProgressBar;
     BContinuar: TButton;
     LSeparadorDecimal: TLFLabel;
     ESeparadorDecimal: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure ButtAntClick(Sender: TObject);
     procedure ButtNextClick(Sender: TObject);
     procedure TVMainCollapsed(Sender: TObject; Node: TTreeNode);
     procedure TVMainChange(Sender: TObject; Node: TTreeNode);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtCancelClick(Sender: TObject);
     procedure TSSeleccionArchivoShow(Sender: TObject);
     procedure ButtSelArchivoClick(Sender: TObject);
     procedure SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure ButtCrearClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure PMCamposDisponiblesClick(Sender: TObject);
     procedure LFCBPrimeraFilaTitulosChange(Sender: TObject);
     procedure VLEValoresConstantesExit(Sender: TObject);
     procedure EdArchivoImpChange(Sender: TObject);
     procedure CBHojaAImportarChange(Sender: TObject);
     procedure TSImportarShow(Sender: TObject);
     procedure BContinuarClick(Sender: TObject);
     procedure ESeparadorDecimalChange(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     Cambiar: boolean;
     MueveTreeAbierto: boolean;
     FilasAMostrar: smallint;
     procedure InicializaVariables;
     procedure ActivarTS(Index: integer);
     procedure MueveTab(Valor: integer);
     procedure MueveTabTree(Index: integer);
     procedure ActivarTree(Index: integer);
     procedure ControlaBotones(Index: integer);
     function CheckTab(Index: integer): boolean;
     function CheckArchivoImp: boolean;
     procedure RefrescaInformacionArchivo;
     procedure LlenarGrid;
     procedure LlenarConstantes;
     procedure LimpiarLog;
     procedure ImportarArticulos(BorraLog: boolean = True);
  public
     { Public declarations }
     procedure Log(Texto: string; NuevaLinea: boolean = True);
  end;

var
  FMAsistenteImpArticulos : TFMAsistenteImpArticulos;

implementation

uses UDMMain, UEntorno, UDMAsistenteImpArticulos, Contnrs, UUtiles;

{$R *.dfm}

procedure TFMAsistenteImpArticulos.FormCreate(Sender: TObject);
var
  i : integer;
  Campos : TStrings;
  MI : TMenuItem;
begin
  inherited;

  AbreData(TDMAsistenteImpArticulos, DMAsistenteImpArticulos);
  InicializaVariables;

  EdArchivoImp.Text := LeeDatoIni('ImportacionArticulos', 'UltimoArchivo', '');
  CBHojaAImportar.Text := LeeDatoIni('ImportacionArticulos', 'UltimaHoja', '');

  // Refresco los datos a importar
  RefrescaInformacionArchivo;

  Campos := TStringList.Create;
  try
     DMAsistenteImpArticulos.RellenaCampos(Campos);
     for i := 0 to Campos.Count - 1 do
     begin
        MI := TMenuItem.Create(PMCamposDisponibles);
        MI.Caption := Campos[i];
        MI.Tag := 1;
        MI.OnClick := PMCamposDisponiblesClick;
        MI.OnDrawItem := CE_OwnerDrawMenuItem;
        MI.OnMeasureItem := CE_MeasureMenuItem;
        PMCamposDisponibles.Items.Add(MI);
     end;
  finally
     Campos.Free;
  end;
end;

procedure TFMAsistenteImpArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteImpArticulos);
  Action := caFree;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteImpArticulos.InicializaVariables;
begin
  // Expandir nodo
  TVMain.Items[0].Expanded := True;
  TabIndice := 0;
  OldTabIndice := 0;
  ActivarTS(0);
  ActivarTree(0);
  MueveTreeAbierto := False; // -> No dejo que se mueva de mas de uno en uno

  ControlaBotones(0);

  // Especificas al asistente
  SGDatosImp.ColWidths[0] := 11;
  FilasAMostrar := 11;
end;

procedure TFMAsistenteImpArticulos.ActivarTS(Index: integer);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
     if Self.Components[i] is TTabSheet then
        if TTabSheet(Self.Components[i]).PageIndex = Index then
        begin
           PCMain.ActivePageIndex := Index;
           TTabSheet(Self.Components[i]).Visible := True;
        end
        else
           TTabSheet(Self.Components[i]).Visible := False;
end;

procedure TFMAsistenteImpArticulos.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteImpArticulos.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteImpArticulos.MueveTab(Valor: integer);
begin
  Cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Control Maxima Pestaña
  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     Cambiar := True;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     Cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TFMAsistenteImpArticulos.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteImpArticulos.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteImpArticulos.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteImpArticulos.ControlaBotones(Index: integer);
begin
  if (TabIndice = 0) then
     ButtAnt.Enabled := False
  else
     ButtAnt.Enabled := True;

  if (TabIndice = PCMain.PageCount - 1) then
     ButtNext.Enabled := False
  else
     ButtNext.Enabled := True;
end;

procedure TFMAsistenteImpArticulos.MueveTabTree(Index: integer);
begin
  if not (Cambiar) then
  begin
     if MueveTreeAbierto then
        MueveTab(Index - TabIndice)
     else
     begin
        if (Index > TabIndice) then
           MueveTab(1);
        if (Index < TabIndice) then
           MueveTab(-1);
     end;
  end;
end;

function TFMAsistenteImpArticulos.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteImpArticulos.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpArticulos.ButtSelArchivoClick(Sender: TObject);
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
  Archivo, Carpeta : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);
  Carpeta := ExtractFileDir(EdArchivoImp.Text);
  if (not DirectoryExists(Carpeta)) then
     Carpeta := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,CSV', Carpeta) then
  begin
     EdArchivoImp.Text := Archivo;
     Sheets := TStringList.Create;
     try
        HojaActiva := CBHojaAImportar.Text;
        DMAsistenteImpArticulos.ActualizaDatosImportacion(Archivo, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

        CBHojaAImportar.Items.Clear;
        CBHojaAImportar.Items.AddStrings(Sheets);

        CBHojaAImportar.Text := HojaActiva;
        LInformacionHoja.Caption := format(_('Filas: %d - Columnas %d'), [Filas, Columnas]);
     finally
        Sheets.Free;
     end;
  end;
end;

procedure TFMAsistenteImpArticulos.RefrescaInformacionArchivo;
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
begin
  Sheets := TStringList.Create;
  try
     HojaActiva := CBHojaAImportar.Text;
     DMAsistenteImpArticulos.ActualizaDatosImportacion(EdArchivoImp.Text, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

     CBHojaAImportar.Items.Clear;
     CBHojaAImportar.Items.AddStrings(Sheets);

     CBHojaAImportar.Text := HojaActiva;
     CBHojaAImportar.ItemIndex := CBHojaAImportar.Items.IndexOf(HojaActiva);
     LInformacionHoja.Caption := format(_('Hoja: %s - Filas: %d - Columnas %d'), [HojaActiva, Filas, Columnas]);
  finally
     Sheets.Free;
  end;
end;

procedure TFMAsistenteImpArticulos.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TFMAsistenteImpArticulos.CheckArchivoImp: boolean;
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

  Result := DMAsistenteImpArticulos.LeerDatos(EdArchivoImp.Text, CBHojaAImportar.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarConstantes;

     EscribeDatoIni('ImportacionArticulos', 'UltimoArchivo', Trim(EdArchivoImp.Text));
     EscribeDatoIni('ImportacionArticulos', 'UltimaHoja', Trim(CBHojaAImportar.Text));
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'FechaImportacion', Now);

     LFCBPrimeraFilaTitulos.Checked := LeeDatoIni('ImportacionArticulos', 'PrimeraFilaTitulos', False);
     ESeparadorDecimal.Text := LeeDatoIni('ImportacionArticulos', 'SeparadorDecimal', '');
  end;
end;

procedure TFMAsistenteImpArticulos.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := DMAsistenteImpArticulos.DameFilas;
  ColCount := (Filas.Items[0] as TStrings).Count;

  SGDatosImp.RowCount := Filas.Count;
  SGDatosImp.ColCount := ColCount + 1;

  // Ponemos en el grid una muestra de los datos
  {
  if Filas.Count > FilasAMostrar then
     x := FilasAMostrar
  else
  }
  x := Filas.Count;
  for f := 0 to x - 1 do
     for c := 0 to ColCount - 1 do
        SGDatosImp.Cells[c + 1, f] := (Filas.Items[f] as TStrings)[c];

  for c := 1 to ColCount do
     SGDatosImp.Cells[c, 0] := LeeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'columna_' + IntToStr(c), '');
end;

procedure TFMAsistenteImpArticulos.LlenarConstantes;
var
  i : integer;
  Campos : TStrings;
begin
  Campos := TStringList.Create;
  try
     DMAsistenteImpArticulos.RellenaCampos(Campos);

     // Borro lineas y las vuelvo a insertar
     while VLEValoresConstantes.RowCount > 2 do
        VLEValoresConstantes.DeleteRow(VLEValoresConstantes.RowCount - 1);

     for i := 0 to Campos.Count - 1 do
        VLEValoresConstantes.InsertRow(Campos[i], LeeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), Campos[i], ''), False);
  finally
     Campos.Free;
  end;
end;

procedure TFMAsistenteImpArticulos.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  with SGDatosImp.Canvas do
  begin
     if not (gdFixed in State) then
     begin
        if (SGDatosImp.Cells[ACol, 0] = '') then
           Brush.Color := clInfoBk
        else
           Brush.Color := clYellow;
        Font.Color := clGrayText;

        FillRect(Rect);
     end;

     TextRect(Rect, Rect.Left + 2, Rect.Top + 2, SGDatosImp.Cells[ACol, ARow]);
  end;
end;

procedure TFMAsistenteImpArticulos.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteImpArticulos.Log(Texto: string; NuevaLinea: boolean = True);
begin
  if NuevaLinea then
     MEMInfoProc.Lines.Add(Texto)
  else
     MEMInfoProc.Lines[MEMInfoProc.Lines.Count - 1] := Texto;
end;

procedure TFMAsistenteImpArticulos.ImportarArticulos(BorraLog: boolean = True);
var
  f, Fila, PrimeraFila : integer;
  c : integer;
  Seguir : boolean;
begin
  if BorraLog then
     LimpiarLog;

  Log(_('Inicializando...'));

  PrimeraFila := 1;
  if LFCBPrimeraFilaTitulos.Checked then
     PrimeraFila := 2;

  Fila := StrToInt(EUltimaFilaImportada.Text);
  Log(Format(_('Comenzando en fila %d'), [Fila]));

  PrimeraFila := PrimeraFila + Fila;

  PProgresoImportacion.Min := 0;
  PProgresoImportacion.Max := SGDatosImp.RowCount;
  PProgresoImportacion.Position := Fila;

  if (ESeparadorDecimal.Text = '') then
     ESeparadorDecimal.Text := DecimalSeparator;

  DMAsistenteImpArticulos.InicializaImportacion(ESeparadorDecimal.Text[1]);
  Seguir := True;
  f := PrimeraFila;

  Log(Format(_('Linea: %d'), [Fila]));
  while Seguir and (f < SGDatosImp.RowCount) do
  begin
     DMAsistenteImpArticulos.NuevoArticulo;
     Log(Format(_('Linea: %d'), [Fila]), False);

     // Parametros segun los datos importados
     try
        for c := 0 to SGDatosImp.ColCount - 1 do
        begin
           if (SGDatosImp.Cells[c, 0] <> '') then
           begin
              DMAsistenteImpArticulos.AsignaParametro(SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]);
              // Log(format(_('Importando: "%s" -> "%s"'), [SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]]));
           end;
        end;
     except
        Seguir := False;
        Log(format(_('Error rellenando parametro : "%s" -> "%s"'), [SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]]));
     end;

     // Parametros fijos
     try
        // Primera linea contiene los titulos ("Key" - "Value")
        for c := 1 to VLEValoresConstantes.RowCount - 1 do
        begin
           if (VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]] <> '') then
           begin
              DMAsistenteImpArticulos.AsignaParametro(VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]);
              // Log(format(_('Constantes: "%s" -> "%s"'), [VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]]));
           end;
        end;
     except
        Seguir := False;
        Log(format(_('Error rellenando constantes : "%s" -> "%s"'), [VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]]));
     end;

     // Parametros que no se rellenaron y que deben tener valores "especiales" para evitar ser importados. (Ej. P_COSTE = -1 no se importa)
     try
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['P_COSTE'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('P_COSTE', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['CONTROL_STOCK'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('CONTROL_STOCK', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['WEB'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('WEB', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['VIRTUAL'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('VIRTUAL', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['EXPORTAR'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('EXPORTAR', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['DESCUENTO_1'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('DESCUENTO_1', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['DESCUENTO_2'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('DESCUENTO_2', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['DESCUENTO_3'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('DESCUENTO_3', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['BAJA'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('BAJA', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['BLOQUEO_COMPRAS'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('BLOQUEO_COMPRAS', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['BLOQUEO_VENTAS'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('BLOQUEO_VENTAS', '-1');
        if (DMAsistenteImpArticulos.QImportaArticulo.Params.ByName['ESTRATEGIA_COMPRA'].IsNull) then
           DMAsistenteImpArticulos.AsignaParametro('ESTRATEGIA_COMPRA', '-1');
     except
        on E: Exception do
        begin
           Seguir := False;
           Log(_('Error rellenando constantes especiales vacias') + #13#10 + e.Message);
        end;
     end;

     try
        DMAsistenteImpArticulos.CrearArticulo;
     except
        on e: Exception do
        begin
           Seguir := False;
           Log(_('Error al importar Articulo'));
           Log('----------');
           Log(E.Message);
           Log('----------');
           for c := 0 to SGDatosImp.ColCount - 1 do
           begin
              if (SGDatosImp.Cells[c, 0] <> '') then
                 Log(format(_('Parametro : "%s" -> "%s"'), [SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]]));
           end;

           // Primera linea contiene los titulos ("Key" - "Value")
           for c := 1 to VLEValoresConstantes.RowCount - 1 do
           begin
              if (VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]] <> '') then
                 Log(format(_('Constantes: "%s" -> "%s"'), [VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]]));
           end;
        end
     end;

     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'UltimaFilaImportada', Fila);
     EUltimaFilaImportada.Text := IntToStr(Fila);
     Inc(f);
     Inc(Fila);
     PProgresoImportacion.Position := Fila;
  end;

  // Seguir = True es que no encontro errores
  if Seguir then
  begin
     Log(_('Importacion Finalizada'));
     PProgresoImportacion.Position := PProgresoImportacion.Max;
  end;
end;

procedure TFMAsistenteImpArticulos.ButtCrearClick(Sender: TObject);
begin
  ImportarArticulos;
end;

procedure TFMAsistenteImpArticulos.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpArticulos.PMCamposDisponiblesClick(Sender: TObject);
begin
  // Asigna el campo seleccionado a la fila 2 del stringgrid.
  if (TMenuItem(Sender).Tag > 0) then
  begin
     SGDatosImp.Cells[SGDatosImp.Col, 0] := TMenuItem(Sender).Caption;
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'columna_' + IntToStr(SGDatosImp.Col), TMenuItem(Sender).Caption);
  end
  else
  begin
     SGDatosImp.Cells[SGDatosImp.Col, 0] := '';
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'columna_' + IntToStr(SGDatosImp.Col), '');
  end;

  SGDatosImp.Refresh;
end;

procedure TFMAsistenteImpArticulos.LFCBPrimeraFilaTitulosChange(Sender: TObject);
begin
  if LFCBPrimeraFilaTitulos.Checked then
     SGDatosImp.FixedRows := 2
  else
     SGDatosImp.FixedRows := 1;

  EscribeDatoIni('ImportacionArticulos', 'PrimeraFilaTitulos', LFCBPrimeraFilaTitulos.Checked);
end;

procedure TFMAsistenteImpArticulos.VLEValoresConstantesExit(Sender: TObject);
var
  i : integer;
begin
  // Primera linea contiene los titulos ("Key" - "Value")
  for i := 1 to VLEValoresConstantes.RowCount - 1 do
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), VLEValoresConstantes.Keys[i], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[i]]);
end;

procedure TFMAsistenteImpArticulos.EdArchivoImpChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpArticulos.CBHojaAImportarChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpArticulos.TSImportarShow(Sender: TObject);
begin
  inherited;
  EUltimaFilaImportada.Text := IntToStr(LeeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'UltimaFilaImportada', 0));
end;

procedure TFMAsistenteImpArticulos.BContinuarClick(Sender: TObject);
begin
  inherited;
  // Incremento la linea y lanzo la importación, sin borrar log.
  EUltimaFilaImportada.Text := IntToStr(StrToInt(EUltimaFilaImportada.Text) + 1);
  ImportarArticulos(False);
end;

procedure TFMAsistenteImpArticulos.ESeparadorDecimalChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('ImportacionArticulos', 'SeparadorDecimal', ESeparadorDecimal.Text);
end;

end.
