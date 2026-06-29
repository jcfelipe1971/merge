unit UFMAsistenteImpStockMinMax;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox;

type
  TFMAsistenteImpStockMinMax = class(TG2KForm)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TSSeleccionArchivo: TTabSheet;
     LBLSeleccionarArticulo: TLFLabel;
     TVMain: TTreeView;
     TSAsociarColumnas: TTabSheet;
     LBLAsociarColumnas: TLFLabel;
     TSSeleccionarAlmacen: TTabSheet;
     TSImportar: TTabSheet;
     LBLSeleccionarAlmacen: TLFLabel;
     LBLImportarStocks: TLFLabel;
     TSSeleccionarDatos: TTabSheet;
     LBLSeleccionarDatos: TLFLabel;
     GBArchivo: TGroupBox;
     GBAsociarColumnas: TGroupBox;
     SGDatosImp: TStringGrid;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     LBLArticulos: TLFLabel;
     CBArticulo: TLFComboBox;
     GBSeleccionAlmacen: TGroupBox;
     GBSeleccionarStocksImp: TGroupBox;
     DBGStocksImp: TDBGridFind2000;
     TBSeleccionarDatos: TLFToolBar;
     TButtQuitarSel: TToolButton;
     TButtSelTodas: TToolButton;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     LBTituloArt: TLFLabel;
     CBMinimo: TLFComboBox;
     LFPanelComponente: TLFPanel;
     LFPanelLona: TLFPanel;
     PNLBotones: TLFPanel;
     PNLAsosciarColumnas: TLFPanel;
     CBMaximo: TLFComboBox;
     LTituloCorto: TLFLabel;
     PNLArticulo: TLFPanel;
     PNLImportar: TLFPanel;
     PNLToldosYCortinas: TLFPanel;
     PNLTitulos: TLFPanel;
     LSeparadorDecimal: TLFLabel;
     LFCBPrimeraFilaTitulos: TLFCheckBox;
     ESeparadorDecimal: TLFEdit;
     CBHojaAImportar: TLFComboBox;
     LInformacionHoja: TLFLabel;
     BInformacionHoja: TButton;
     LAlmacen: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     EAlmacen: TLFEdit;
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
     procedure TButtSelTodasClick(Sender: TObject);
     procedure TButtQuitarSelClick(Sender: TObject);
     procedure ButtCrearClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure EdArchivoImpChange(Sender: TObject);
     procedure CBHojaAImportarChange(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure LFCBPrimeraFilaTitulosChange(Sender: TObject);
     procedure ESeparadorDecimalChange(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     cambiar: boolean;
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
     function CheckAsociarCol: boolean;
     function CheckSelAlmacen: boolean;
     function CheckSelDatos: boolean;
     procedure LlenarGrid;
     procedure LlenarCombos;
     procedure LimpiarLog;
     procedure Log(Texto: string);
     procedure ActualizarStocks;
     procedure RefrescaInformacionArchivo;
  public
     { Public declarations }
  end;

var
  FMAsistenteImpStockMinMax : TFMAsistenteImpStockMinMax;

implementation

uses UDMMain, UEntorno, Contnrs, UUtiles, UDMAsistenteImpStockMinMax, UDameDato;

{$R *.dfm}

procedure TFMAsistenteImpStockMinMax.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteImpStockMinMax, DMAsistenteImpStockMinMax);
  InicializaVariables;

  EdArchivoImp.Text := LeeDatoIni('AsistenteImpStockMinMax', 'UltimoArchivo', '');
  CBHojaAImportar.Text := LeeDatoIni('AsistenteImpStockMinMax', 'UltimaHoja', '');

  // Refresco los datos a importar
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpStockMinMax.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteImpStockMinMax);
  Action := caFree;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteImpStockMinMax.InicializaVariables;
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

procedure TFMAsistenteImpStockMinMax.ActivarTS(Index: integer);
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

procedure TFMAsistenteImpStockMinMax.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteImpStockMinMax.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteImpStockMinMax.MueveTab(Valor: integer);
begin
  cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Condiciones

  // if (TabIndice = 1) and (RGEjercicio.ItemIndex = 0) then
  //    if Valor < 0 then TabIndice := 0
  //    else
  //       TabIndice := 2;

  // Control Maxima Pestaña
  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     cambiar := True;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     cambiar := False;
  end;
  ControlaBotones(TabIndice);
end;

procedure TFMAsistenteImpStockMinMax.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteImpStockMinMax.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteImpStockMinMax.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteImpStockMinMax.ControlaBotones(Index: integer);
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

procedure TFMAsistenteImpStockMinMax.MueveTabTree(Index: integer);
begin
  if not (cambiar) then
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

function TFMAsistenteImpStockMinMax.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     1: Result := CheckAsociarCol;
     2: Result := CheckSelAlmacen;
     3: Result := CheckSelDatos;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteImpStockMinMax.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpStockMinMax.ButtSelArchivoClick(Sender: TObject);
var
  Archivo, Carpeta : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);
  Carpeta := ExtractFileDir(EdArchivoImp.Text);
  if (not DirectoryExists(Carpeta)) then
     Carpeta := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,CSV,TXT', Carpeta) then
     EdArchivoImp.Text := Archivo;
end;

procedure TFMAsistenteImpStockMinMax.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TFMAsistenteImpStockMinMax.CheckArchivoImp: boolean;
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

  Result := DMAsistenteImpStockMinMax.LeerDatos(EdArchivoImp.Text, CBHojaAImportar.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarCombos;

     EscribeDatoIni('AsistenteImpStockMinMax', 'UltimoArchivo', Trim(EdArchivoImp.Text));
     EscribeDatoIni('AsistenteImpStockMinMax', 'UltimaHoja', Trim(CBHojaAImportar.Text));
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'FechaImportacion', Now);

     LFCBPrimeraFilaTitulos.Checked := LeeDatoIni('AsistenteImpStockMinMax', 'PrimeraFilaTitulos', False);
     ESeparadorDecimal.Text := LeeDatoIni('AsistenteImpStockMinMax', 'SeparadorDecimal', '');
  end;
end;

procedure TFMAsistenteImpStockMinMax.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := DMAsistenteImpStockMinMax.DameFilas;
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
end;

procedure TFMAsistenteImpStockMinMax.LlenarCombos;
var
  Columnas : TStrings;

  procedure AgregaColumnas(Combo: TComboBox; PrimerDato: string; Columnas: TStrings);
  begin
     with Combo do
     begin
        Clear;
        Items.Add(PrimerDato);
        Items.AddStrings(Columnas);
        ItemIndex := 0;
     end;
  end;

begin
  Columnas := DMAsistenteImpStockMinMax.DameColumnas;

  AgregaColumnas(CBArticulo, _('Ninguna'), Columnas);
  AgregaColumnas(CBMinimo, _('Ninguna'), Columnas);
  AgregaColumnas(CBMaximo, _('Ninguna'), Columnas);
end;

procedure TFMAsistenteImpStockMinMax.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  with SGDatosImp.Canvas do
  begin
     if not (gdFixed in State) then
     begin
        Brush.Color := clInfoBk;
        Font.Color := clGrayText;
        FillRect(Rect);
     end;

     TextRect(Rect, Rect.Left + 2, Rect.Top + 2, SGDatosImp.Cells[ACol, ARow]);
  end;
end;

function TFMAsistenteImpStockMinMax.CheckAsociarCol: boolean;
begin
  Result := False;

  if (CBArticulo.ItemIndex = 0) then
     Application.MessageBox(PChar(string(_('Debe de asociar el campo Artículo'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else if ((CBArticulo.ItemIndex = CBMinimo.ItemIndex) or
     (CBArticulo.ItemIndex = CBMaximo.ItemIndex) or
     (CBMinimo.ItemIndex = CBMaximo.ItemIndex)) then
     Application.MessageBox(PChar(string(_('Ha asociado la misma columna a campos distintos.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     Result := DMAsistenteImpStockMinMax.LlenarTablaTemporal(CBArticulo.ItemIndex,
        CBMinimo.ItemIndex, CBMaximo.ItemIndex, ESeparadorDecimal.Text, LFCBPrimeraFilaTitulos.Checked);
  end;
end;

function TFMAsistenteImpStockMinMax.CheckSelAlmacen: boolean;
begin
  Result := (EAlmacen.Text <> '');
end;

procedure TFMAsistenteImpStockMinMax.TButtSelTodasClick(Sender: TObject);
begin
  DMAsistenteImpStockMinMax.SeleccionarTodas(1);
end;

procedure TFMAsistenteImpStockMinMax.TButtQuitarSelClick(Sender: TObject);
begin
  DMAsistenteImpStockMinMax.SeleccionarTodas(0);
end;

procedure TFMAsistenteImpStockMinMax.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteImpStockMinMax.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

procedure TFMAsistenteImpStockMinMax.ActualizarStocks;
var
  Error : string;
  Errores : integer;
begin
  Errores := 0;
  LimpiarLog;
  Log(_('Inicializando...'));

  with DMAsistenteImpStockMinMax do
  begin
     SetAlmacen(EFAlmacen.Text);
     InicializaProceso;
     while (not Final) do
     begin
        Application.ProcessMessages;
        Log(Actual);
        if (not ActualizaStock(Error)) then
        begin
           Log(_('Error:'));
           Log(Error);
           Errores := Errores + 1;
        end;
        Siguiente;
     end;

     if (Errores = 0) then
     begin
        Log(_('El proceso concluyó con éxito.'));
        ButtCancel.Visible := False;
        ButtAnt.Visible := False;
        ButtNext.Visible := False;
        ButtCerrar.Visible := True;
     end
     else
        Log(_('El proceso concluyó con errores.'));
  end;
end;

procedure TFMAsistenteImpStockMinMax.ButtCrearClick(Sender: TObject);
begin
  ActualizarStocks;
end;

function TFMAsistenteImpStockMinMax.CheckSelDatos: boolean;
begin
  Result := DMAsistenteImpStockMinMax.Seleccionados;
  if (not Result) then
     Application.MessageBox(PChar(string(_('No ha seleccionado ningún Stock.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
end;

procedure TFMAsistenteImpStockMinMax.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpStockMinMax.RefrescaInformacionArchivo;
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
begin
  Sheets := TStringList.Create;
  try
     HojaActiva := CBHojaAImportar.Text;
     DMAsistenteImpStockMinMax.ActualizaDatosImportacion(EdArchivoImp.Text, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

     CBHojaAImportar.Items.Clear;
     CBHojaAImportar.Items.AddStrings(Sheets);

     CBHojaAImportar.Text := HojaActiva;
     CBHojaAImportar.ItemIndex := CBHojaAImportar.Items.IndexOf(HojaActiva);
     LInformacionHoja.Caption := format(_('Hoja: %s - Filas: %d - Columnas %d'), [HojaActiva, Filas, Columnas]);
  finally
     Sheets.Free;
  end;
end;

procedure TFMAsistenteImpStockMinMax.EdArchivoImpChange(Sender: TObject);
begin
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpStockMinMax.CBHojaAImportarChange(Sender: TObject);
begin
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpStockMinMax.EFAlmacenChange(Sender: TObject);
begin
  inherited;
  EAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMAsistenteImpStockMinMax.LFCBPrimeraFilaTitulosChange(Sender: TObject);
begin
  if LFCBPrimeraFilaTitulos.Checked then
     SGDatosImp.FixedRows := 2
  else
     SGDatosImp.FixedRows := 1;

  EscribeDatoIni('AsistenteImpStockMinMax', 'PrimeraFilaTitulos', LFCBPrimeraFilaTitulos.Checked);
end;

procedure TFMAsistenteImpStockMinMax.ESeparadorDecimalChange(Sender: TObject);
begin
  EscribeDatoIni('AsistenteImpStockMinMax', 'SeparadorDecimal', ESeparadorDecimal.Text);
end;

end.
