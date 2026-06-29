unit UFMAsistenteImpTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox;

type
  TFMAsistenteImpTarifas = class(TG2KForm)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TSSeleccionArchivo: TTabSheet;
     LBLSeleccionarArticulo: TLFLabel;
     TVMain: TTreeView;
     TSAsociarColumnas: TTabSheet;
     LBLAsociarColumnas: TLFLabel;
     TSSeleccionarTarifa: TTabSheet;
     TSImportar: TTabSheet;
     LBLSeleccionarTarifa: TLFLabel;
     LBLImportarTarifas: TLFLabel;
     TSSeleccionarDatos: TTabSheet;
     LBLSeleccionarDatos: TLFLabel;
     GBArchivo: TGroupBox;
     GBAsociarColumnas: TGroupBox;
     SGDatosImp: TStringGrid;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     LBLArticulos: TLFLabel;
     CBArticulo: TLFComboBox;
     CBMargen: TLFComboBox;
     LBLMargenes: TLFLabel;
     LBLPrecio: TLFLabel;
     CBPrecio: TLFComboBox;
     GBSeleccionTarifa: TGroupBox;
     RBTarifaExistente: TRadioButton;
     RBTarifaNueva: TRadioButton;
     PTarifaExistente: TLFPanel;
     LBLTarifaEx: TLFLabel;
     EFTarifaEx: TLFEditFind2000;
     DBETituloTarifaEx: TLFEdit;
     DBETituloTipoCalculo: TLFEdit;
     EFTipoCalculoEx: TLFEditFind2000;
     LBLTipoCalculoEx: TLFLabel;
     CHKPrecioBloqueadoEx: TLFCheckBox;
     PTarifaNueva: TLFPanel;
     LBLNombreNu: TLFLabel;
     EFMonedaNu: TLFEditFind2000;
     DBETituloMonedaNu: TLFEdit;
     DBETituloTipoCalculoNu: TLFEdit;
     EFTipoCalculoNu: TLFEditFind2000;
     LBLTipoCalculoNu: TLFLabel;
     LBLMonedaNu: TLFLabel;
     CHKIVAIncluidoNu: TLFCheckBox;
     LBLTarifaNu: TLFLabel;
     EdNombreNu: TLFEdit;
     EdTarifaNu: TLFEdit;
     GBSeleccionarTarifasImp: TGroupBox;
     DBGTarifasImp: TDBGridFind2000;
     TBSeleccionarDatos: TLFToolBar;
     TButtQuitarSel: TToolButton;
     TButtSelTodas: TToolButton;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     LFLFamilia: TLFLabel;
     CBFamilia: TLFComboBox;
     LBTituloArt: TLFLabel;
     CBTitArticulo: TLFComboBox;
     LBTitFamilia: TLFLabel;
     CBTitFamilia: TLFComboBox;
     LBTipoIva: TLFLabel;
     CBTipoIva: TLFComboBox;
     CBPrecioCoste: TLFComboBox;
     LPrecioCoste: TLFLabel;
     LTipoArticulo: TLFLabel;
     LFCBTArticulo: TLFComboBox;
     LBLlacado: TLFLabel;
     CBLacado: TLFComboBox;
     LBLTipoLacado: TLFLabel;
     CBTipoLacado: TLFComboBox;
     LBLCorte: TLFLabel;
     CBCorte: TLFComboBox;
     LBLTipoLona: TLFLabel;
     CBTipoLona: TLFComboBox;
     LBLForma: TLFLabel;
     CBForma: TLFComboBox;
     LBLModelo: TLFLabel;
     CBModelo: TLFComboBox;
     LBLConfeccionLona: TLFLabel;
     CBConfeccionLona: TLFComboBox;
     LFPanelComponente: TLFPanel;
     LFPanelLona: TLFPanel;
     PNLBotones: TLFPanel;
     PNLAsosciarColumnas: TLFPanel;
     CBTitCorto: TLFComboBox;
     LTituloCorto: TLFLabel;
     CBNotas: TLFComboBox;
     LNotas: TLFLabel;
     LPrecioCompra: TLFLabel;
     CBPrecioCompra: TLFComboBox;
     LDtoCompra: TLFLabel;
     CBDtoCompra: TLFComboBox;
     LUnidadesMinimas: TLFLabel;
     CBUnidadesMinimas: TLFComboBox;
     LLUnidadesMaximas: TLFLabel;
     CBUnidadesMaximas: TLFComboBox;
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
     procedure RBTarifaExistenteClick(Sender: TObject);
     procedure RBTarifaNuevaClick(Sender: TObject);
     procedure EFTarifaExChange(Sender: TObject);
     procedure EFTipoCalculoExChange(Sender: TObject);
     procedure EFMonedaNuChange(Sender: TObject);
     procedure EFTipoCalculoNuChange(Sender: TObject);
     procedure TButtSelTodasClick(Sender: TObject);
     procedure TButtQuitarSelClick(Sender: TObject);
     procedure ButtCrearClick(Sender: TObject);
     procedure EFTipoCalculoExBusqueda(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure CBFamiliaChange(Sender: TObject);
     procedure LFCBTArticuloChange(Sender: TObject);
     procedure TSAsociarColumnasShow(Sender: TObject);
     procedure EdArchivoImpChange(Sender: TObject);
     procedure CBHojaAImportarChange(Sender: TObject);
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
     function CheckSelTarifa: boolean;
     function CheckSelDatos: boolean;
     procedure LlenarGrid;
     procedure LlenarCombos;
     procedure HabilitaPanelesTar;
     procedure LimpiarLog;
     procedure Log(Texto: string);
     procedure ActualizarTarifas;
     procedure RefrescaInformacionArchivo;
  public
     { Public declarations }
  end;

var
  FMAsistenteImpTarifas : TFMAsistenteImpTarifas;

implementation

uses UDMMain, UEntorno, UDMAsistenteImpTarifas, Contnrs, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMAsistenteImpTarifas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteImpTarifas, DMAsistenteImpTarifas);
  InicializaVariables;

  EdArchivoImp.Text := LeeDatoIni('ImportacionTarifas', 'UltimoArchivo', '');
  CBHojaAImportar.Text := LeeDatoIni('ImportacionTarifas', 'UltimaHoja', '');

  // Refresco los datos a importar
  RefrescaInformacionArchivo;

  DMAsistenteImpTarifas.RellenaTipoArticulo(LFCBTArticulo.Items);
  LFCBTArticulo.ItemIndex := 0;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteImpTarifas.InicializaVariables;
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
  EFMonedaNu.Text := REntorno.Moneda;
  HabilitaPanelesTar;
end;

procedure TFMAsistenteImpTarifas.ActivarTS(Index: integer);
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

procedure TFMAsistenteImpTarifas.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteImpTarifas.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteImpTarifas.MueveTab(Valor: integer);
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

procedure TFMAsistenteImpTarifas.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteImpTarifas.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteImpTarifas.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteImpTarifas.ControlaBotones(Index: integer);
begin
  if (TabIndice = 0) then
     ButtAnt.Enabled := False
  else
     ButtAnt.Enabled := True;

  if (TabIndice = PCMain.PageCount - 1) then
  begin
     ButtNext.Visible := False;
     ButtNext.Enabled := False;
     ButtCerrar.Visible := True;
  end
  else
  begin
     ButtNext.Visible := True;
     ButtNext.Enabled := True;
     ButtCerrar.Visible := False;
  end;
end;

procedure TFMAsistenteImpTarifas.MueveTabTree(Index: integer);
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

function TFMAsistenteImpTarifas.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     1: Result := CheckAsociarCol;
     2: Result := CheckSelTarifa;
     3: Result := CheckSelDatos;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteImpTarifas.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteImpTarifas);
  Action := caFree;
end;

procedure TFMAsistenteImpTarifas.ButtSelArchivoClick(Sender: TObject);
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

procedure TFMAsistenteImpTarifas.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TFMAsistenteImpTarifas.CheckArchivoImp: boolean;
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

  Result := DMAsistenteImpTarifas.LeerDatos(EdArchivoImp.Text, CBHojaAImportar.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarCombos;

     EscribeDatoIni('ImportacionTarifas', 'UltimoArchivo', Trim(EdArchivoImp.Text));
     EscribeDatoIni('ImportacionTarifas', 'UltimaHoja', Trim(CBHojaAImportar.Text));
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'FechaImportacion', Now);

     LFCBPrimeraFilaTitulos.Checked := LeeDatoIni('ImportacionTarifas', 'PrimeraFilaTitulos', False);
     ESeparadorDecimal.Text := LeeDatoIni('ImportacionTarifas', 'SeparadorDecimal', '');
  end;
end;

procedure TFMAsistenteImpTarifas.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := DMAsistenteImpTarifas.DameFilas;
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

procedure TFMAsistenteImpTarifas.LlenarCombos;
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
  Columnas := DMAsistenteImpTarifas.DameColumnas;

  AgregaColumnas(CBArticulo, _('Ninguna'), Columnas);
  AgregaColumnas(CBMargen, _('Ninguna'), Columnas);
  AgregaColumnas(CBPrecio, _('Ninguna'), Columnas);
  AgregaColumnas(CBFamilia, _('Defecto'), Columnas);
  AgregaColumnas(CBTipoIVA, _('Ninguna'), Columnas);
  AgregaColumnas(CBTitArticulo, _('Ninguna'), Columnas);
  AgregaColumnas(CBTitCorto, _('Ninguna'), Columnas);
  AgregaColumnas(CBTitFamilia, _('Ninguna'), Columnas);
  AgregaColumnas(CBPrecioCoste, _('Ninguna'), Columnas);
  AgregaColumnas(CBNotas, _('Ninguna'), Columnas);
  AgregaColumnas(CBPrecioCompra, _('Ninguna'), Columnas);
  AgregaColumnas(CBDtoCompra, _('Ninguna'), Columnas);
  AgregaColumnas(CBUnidadesMinimas, _('Ninguna'), Columnas);
  AgregaColumnas(CBUnidadesMaximas, _('Ninguna'), Columnas);
  AgregaColumnas(CBLacado, _('Ninguna'), Columnas);
  AgregaColumnas(CBTipoLacado, _('Ninguna'), Columnas);
  AgregaColumnas(CBCorte, _('Ninguna'), Columnas);
  AgregaColumnas(CBTipoLona, _('Ninguna'), Columnas);
  AgregaColumnas(CBForma, _('Ninguna'), Columnas);
  AgregaColumnas(CBModelo, _('Ninguna'), Columnas);
  AgregaColumnas(CBConfeccionLona, _('Ninguna'), Columnas);
end;

procedure TFMAsistenteImpTarifas.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
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

function TFMAsistenteImpTarifas.CheckAsociarCol: boolean;
var
  TipoArticulo : string;
  Columna : integer;
begin
  Result := False;

  if ((CBArticulo.ItemIndex = 0) or
     ((CBMargen.ItemIndex = 0) and
     (CBPrecio.ItemIndex = 0))) then
     Application.MessageBox(PChar(string(_('Debe de asociar el campo Artículo y el campo Margen o el campo Precio.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else if ((CBArticulo.ItemIndex = CBMargen.ItemIndex) or
     (CBArticulo.ItemIndex = CBPrecio.ItemIndex) or
     (CBMargen.ItemIndex = CBPrecio.ItemIndex) or
     (CBFamilia.ItemIndex = CBPrecio.ItemIndex) or
     (CBTitArticulo.ItemIndex = CBPrecio.ItemIndex) or
     (CBTitFamilia.ItemIndex = CBPrecio.ItemIndex) or
     (CBTipoIVA.ItemIndex = CBPrecio.ItemIndex)) then
     Application.MessageBox(PChar(string(_('Ha asociado la misma columna a campos distintos.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     TipoArticulo := LFCBTArticulo.Items[LFCBTArticulo.ItemIndex];
     TipoArticulo := Copy(TipoArticulo, 1, Pos(' ', TipoArticulo) - 1);

     Result := DMAsistenteImpTarifas.LlenarTablaTemporal(CBArticulo.ItemIndex,
        CBMargen.ItemIndex, CBPrecio.ItemIndex, CBFamilia.ItemIndex, CBTitArticulo.ItemIndex,
        CBTitCorto.ItemIndex, CBTitFamilia.ItemIndex, CBTipoIVA.ItemIndex, CBPrecioCoste.ItemIndex,
        CBNotas.ItemIndex, CBPrecioCompra.ItemIndex, CBDtoCompra.ItemIndex, CBUnidadesMinimas.ItemIndex, CBUnidadesMaximas.ItemIndex,
        CBLacado.ItemIndex, CBCorte.ItemIndex, CBTipoLacado.ItemIndex, CBTipoLona.ItemIndex,
        CBForma.ItemIndex, CBModelo.ItemIndex, CBConfeccionLona.ItemIndex, TipoArticulo, ESeparadorDecimal.Text, LFCBPrimeraFilaTitulos.Checked);

     if (Result) then
        with DBGTarifasImp do
        begin
           Columna := EncuentraField(DBGTarifasImp, 'MARGEN');
           if (Columna >= 0) then
              Columns[Columna].Visible := (CBMargen.ItemIndex > 0);
           Columna := EncuentraField(DBGTarifasImp, 'PRECIO');
           if (Columna >= 0) then
              Columns[3].Visible := (CBPrecio.ItemIndex > 0);
        end;
  end;
end;

procedure TFMAsistenteImpTarifas.HabilitaPanelesTar;
begin
  PTarifaExistente.Enabled := RBTarifaExistente.Checked;
  PTarifaNueva.Enabled := RBTarifaNueva.Checked;
end;

procedure TFMAsistenteImpTarifas.RBTarifaExistenteClick(Sender: TObject);
begin
  HabilitaPanelesTar;
  EFTarifaEx.SetFocus;
end;

procedure TFMAsistenteImpTarifas.RBTarifaNuevaClick(Sender: TObject);
begin
  HabilitaPanelesTar;
  EDTarifaNu.SetFocus;
end;

procedure TFMAsistenteImpTarifas.EFTarifaExChange(Sender: TObject);
begin
  DBETituloTarifaEx.Text := DameTituloTarifa(EFTarifaEx.Text);
end;

procedure TFMAsistenteImpTarifas.EFTipoCalculoExChange(Sender: TObject);
begin
  DBETituloTipoCalculo.Text := DameTituloCalculo(StrToIntDef(EFTipoCalculoEx.Text, -1));
end;

procedure TFMAsistenteImpTarifas.EFMonedaNuChange(Sender: TObject);
begin
  DBETituloMonedaNu.Text := DameTituloMoneda(EFMonedaNu.Text);
end;

procedure TFMAsistenteImpTarifas.EFTipoCalculoNuChange(Sender: TObject);
begin
  DBETituloTipoCalculoNu.Text := DameTituloCalculo(StrToIntDef(EFTipoCalculoNu.Text, -1));
end;

function TFMAsistenteImpTarifas.CheckSelTarifa: boolean;
begin
  Result := True;

  if (RBTarifaExistente.Checked) then
  begin
     if ((EFTarifaEx.Text = '')) then
     begin
        Application.MessageBox(PChar(string(_('Debe de seleccionar una tarifa existente.'))),
           PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
        Result := False;
     end;
  end
  else if (RBTarifaNueva.Checked) then
     if ((EdTarifaNu.Text = '') or (EdNombreNu.Text = '') or
        (EFMonedaNu.Text = '') or (EFTipoCalculoNu.Text = '')) then
     begin
        Application.MessageBox(PChar(string(_('Debe completar los datos para la creación de la nueva tarifa.'))),
           PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
        Result := False;
     end;
end;

procedure TFMAsistenteImpTarifas.TButtSelTodasClick(Sender: TObject);
begin
  DMAsistenteImpTarifas.SeleccionarTodas(1);
end;

procedure TFMAsistenteImpTarifas.TButtQuitarSelClick(Sender: TObject);
begin
  DMAsistenteImpTarifas.SeleccionarTodas(0);
end;

procedure TFMAsistenteImpTarifas.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteImpTarifas.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

procedure TFMAsistenteImpTarifas.ActualizarTarifas;
var
  Error : string;
  Errores : integer;
begin
  Errores := 0;
  LimpiarLog;
  Log(_('Inicializando...'));

  with DMAsistenteImpTarifas do
  begin
     if (HayFamiliasNuevas) then
     begin
        Log(_('Se darán de alta las familias inexistentes en el sistema'));
        Application.ProcessMessages;
        MEMInfoProc.Lines.AddStrings(CreaFamiliaNueva(Errores));
     end;
     if (HayArticulosNuevos) then
     begin
        Log(_('Se darán de alta los artículos inexistentes en el sistema'));
        Application.ProcessMessages;
        MEMInfoProc.Lines.AddStrings(CreaArticuloNuevo(Errores));
     end;
     if (RBTarifaNueva.Checked) then
     begin
        Log(_('Creado tarifa') + ' ' + EdTarifaNu.Text + ' ' + EdNombreNu.Text + '...');
        Application.ProcessMessages;
        if (not CrearTarifa(EdTarifaNu.Text, EdNombreNu.Text, EFMonedaNu.Text,
           StrToInt(EFTipoCalculoNu.Text), BoolToInt(CHKIVAIncluidoNu.Checked), Error)) then
        begin
           Log(_('Error'));
           Log(Error);
           Errores := Errores + 1;
           Exit;
        end;
        Log(_('Propagando tarifa...'));
        Application.ProcessMessages;
        PropagaTarifa;
     end
     else
        SetTarifa(EFTarifaEx.Text, StrToIntDef(EFTipoCalculoEx.Text, -1), CHKPrecioBloqueadoEx.Checked);

     InicializaProceso;
     while (not Final) do
     begin
        Application.ProcessMessages;
        Log(Actual);
        if (not ActualizaPrecio(Error)) then
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
        ButtAnt.Visible := True;
        ButtNext.Visible := False;
        ButtCerrar.Visible := True;
     end
     else
        Log(_('El proceso concluyó con errores.'));
  end;
end;

procedure TFMAsistenteImpTarifas.ButtCrearClick(Sender: TObject);
begin
  ActualizarTarifas;
end;

function TFMAsistenteImpTarifas.CheckSelDatos: boolean;
begin
  Result := DMAsistenteImpTarifas.Seleccionados;
  if (not Result) then
     Application.MessageBox(PChar(string(_('No ha seleccionado ningún precio.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
end;

procedure TFMAsistenteImpTarifas.EFTipoCalculoExBusqueda(Sender: TObject);
begin
  EFTipoCalculoEx.CondicionBusqueda :=
     'CALCULO IN (SELECT DISTINCT CALCULO FROM ART_TARIFAS_D WHERE EMPRESA=' +
     REntorno.EmpresaStr + ' AND TARIFA=''' + EFTarifaEx.Text + ''')';
end;

procedure TFMAsistenteImpTarifas.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpTarifas.CBFamiliaChange(Sender: TObject);
begin
  if (CBFamilia.ItemIndex = 0) then
  begin
     CBTitFamilia.ItemIndex := 0;
     CBTipoIVA.ItemIndex := 0;
     CBTitFamilia.Enabled := False;
     CBTipoIVA.Enabled := False;
  end
  else
  begin
     CBTitFamilia.Enabled := True;
     CBTipoIVA.Enabled := True;
  end;
end;

procedure TFMAsistenteImpTarifas.LFCBTArticuloChange(Sender: TObject);
var
  TipoArticulo : string;
begin
  TipoArticulo := LFCBTArticulo.Items[LFCBTArticulo.ItemIndex];
  TipoArticulo := Copy(TipoArticulo, 1, Pos(' ', TipoArticulo) - 1);

  LFPanelComponente.Visible := (TipoArticulo = 'C');
  LFPanelLona.Visible := (TipoArticulo = 'L');
end;

procedure TFMAsistenteImpTarifas.TSAsociarColumnasShow(Sender: TObject);
begin
  LFCBTArticuloChange(nil);
end;

procedure TFMAsistenteImpTarifas.RefrescaInformacionArchivo;
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
begin
  Sheets := TStringList.Create;
  try
     HojaActiva := CBHojaAImportar.Text;
     DMAsistenteImpTarifas.ActualizaDatosImportacion(EdArchivoImp.Text, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

     CBHojaAImportar.Items.Clear;
     CBHojaAImportar.Items.AddStrings(Sheets);

     CBHojaAImportar.Text := HojaActiva;
     CBHojaAImportar.ItemIndex := CBHojaAImportar.Items.IndexOf(HojaActiva);
     LInformacionHoja.Caption := format(_('Hoja: %s - Filas: %d - Columnas %d'), [HojaActiva, Filas, Columnas]);
  finally
     Sheets.Free;
  end;
end;

procedure TFMAsistenteImpTarifas.EdArchivoImpChange(Sender: TObject);
begin
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpTarifas.CBHojaAImportarChange(Sender: TObject);
begin
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpTarifas.LFCBPrimeraFilaTitulosChange(Sender: TObject);
begin
  if LFCBPrimeraFilaTitulos.Checked then
     SGDatosImp.FixedRows := 2
  else
     SGDatosImp.FixedRows := 1;

  EscribeDatoIni('ImportacionTarifas', 'PrimeraFilaTitulos', LFCBPrimeraFilaTitulos.Checked);
end;

procedure TFMAsistenteImpTarifas.ESeparadorDecimalChange(Sender: TObject);
begin
  EscribeDatoIni('ImportacionTarifas', 'SeparadorDecimal', ESeparadorDecimal.Text);
end;

end.
