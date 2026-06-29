unit UFMFamilias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, ExtCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, URecursos, ULFEdit, UG2kTBLoc, DbComboBoxValue,
  ULFDBComboBoxValue, ULFEditFind2000, Buttons;

type
  TFMFamilias = class(TFPEdit)
     LBLFamilia: TLFLabel;
     DBEFamilia: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLCtaCompra: TLFLabel;
     DBETitCompras: TLFEdit;
     LBLCtaVenta: TLFLabel;
     DBETitVentas: TLFEdit;
     LBLIVA: TLFLabel;
     DBETipIva: TLFDbedit;
     DBERecIva: TLFDbedit;
     DBETitIva: TLFDbedit;
     DBEFCompras: TLFDBEditFind2000;
     DBEFVentas: TLFDBEditFind2000;
     DBEFIva: TLFDBEditFind2000;
     DBCHKVenta: TLFDBCheckBox;
     LblPtoVerde: TLFLabel;
     DBEPtoVerde: TLFDbedit;
     TSCuentas: TTabSheet;
     TBArtSeries: TLFToolBar;
     PNLCuentasTitulos: TLFPanel;
     DBEFamSeries: TLFDbedit;
     DBEFamDescSeries: TLFDbedit;
     TBSeries: TLFToolBar;
     NAVSeries: THYMNavigator;
     PNSeries: TLFPanel;
     LBLPrecioBase: TLFLabel;
     DBChBActTarAutom: TLFDBCheckBox;
     DBEMargen: TLFDbedit;
     DBEFTipoRedondeo: TLFDBEditFind2000;
     LTipoRedondeo: TLFLabel;
     DBETitTipoRedondeo: TLFDbedit;
     AVisualizarFamilias: TAction;
     AImprimirFamilias: TAction;
     AVisualizarArtFamilias: TAction;
     AImprimirArtFamiliaFiltrados: TAction;
     AMovArtFamilia: TAction;
     AConfListadosFamilias: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfListadoArticulosPorFamilias: TAction;
     AConfListadosMovArticulosPorFamilias: TAction;
     LFCategoryAction2: TLFCategoryAction;
     APropagaCuentasSeries: TAction;
     APropagaMargenTarifas: TAction;
     APropagaMargenArticulos: TAction;
     APropagaRedondeo: TAction;
     LDiasMin: TLFLabel;
     LDiasMax: TLFLabel;
     EDiasMin: TLFEdit;
     EDiasMax: TLFEdit;
     LFCategoryAction3: TLFCategoryAction;
     ASep: TAction;
     DBEFDevolucionCompras: TLFDBEditFind2000;
     DBEFDevolucionVentas: TLFDBEditFind2000;
     DBEFAbonoCompras: TLFDBEditFind2000;
     DBEFAbonoVentas: TLFDBEditFind2000;
     DBETitDevCompras: TLFEdit;
     DBETitDevVentas: TLFEdit;
     DBETitAbonoCompras: TLFEdit;
     DBETitAbonoVentas: TLFEdit;
     LBCtaDevC: TLFLabel;
     LBCtaDevV: TLFLabel;
     LBCtaAbonoC: TLFLabel;
     CtaAbnV: TLFLabel;
     DBEFCtaCompras: TLFDBEditFind2000;
     LSeriesCuentaCompras: TLFLabel;
     DBETitCtaCompras: TLFEdit;
     DBETitCtaVentas: TLFEdit;
     DBEFCtaVentas: TLFDBEditFind2000;
     LSeriesCuentaVenta: TLFLabel;
     LBCtaDevlC: TLFLabel;
     DBEFCtaDevCompras: TLFDBEditFind2000;
     DBETitCtaDevCompras: TLFEdit;
     DBETitCtaDevVentas: TLFEdit;
     DBEFCtaDevVentas: TLFDBEditFind2000;
     LbCtaDvnV: TLFLabel;
     LBCtaAbnC: TLFLabel;
     DBEFCtaAbonoCompras: TLFDBEditFind2000;
     DBETitCtaAbonoCompras: TLFEdit;
     DBETitCtaAbonoVentas: TLFEdit;
     DBEFCtaAbonoVentas: TLFDBEditFind2000;
     LbCtaAbnV: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     DBETitSerie: TLFDbedit;
     LSeriesSerie: TLFLabel;
     AVerFamiliaSistema: TAction;
     LBKTituloWeb: TLFLabel;
     LBLTituloWeb: TLFDbedit;
     DBCHKWeb: TLFDBCheckBox;
     PCCuentas: TLFPageControl;
     TSSeries: TTabSheet;
     TSSeriesTabla: TTabSheet;
     TSProyectos: TTabSheet;
     TSProyTabla: TTabSheet;
     TSProySeries: TTabSheet;
     TSProySerTabla: TTabSheet;
     PNProyectos: TLFPanel;
     TBProyectos: TLFToolBar;
     NavProyectos: THYMNavigator;
     TBArtProy: TLFToolBar;
     PInfoProy: TLFPanel;
     DBEArtProy: TLFDbedit;
     DBEArtDescProy: TLFDbedit;
     DBEFCtaCompProy: TLFDBEditFind2000;
     DBEFCtaDevCompProy: TLFDBEditFind2000;
     DBEFCtaDevVentProy: TLFDBEditFind2000;
     DBEFCtaVentProy: TLFDBEditFind2000;
     DBEFProyecto: TLFDBEditFind2000;
     DBETitCtaCompProy: TLFEdit;
     DBETitCtaDevCompProy: TLFEdit;
     DBETitCtaDevVentProy: TLFEdit;
     DBETitCtaVentProy: TLFEdit;
     DBETitProyecto: TLFDbedit;
     LFLCtaCompras: TLFLabel;
     LFLCtaDevComp: TLFLabel;
     LFLCtaDevVent: TLFLabel;
     LFLCtaVentas: TLFLabel;
     LFLProyecto: TLFLabel;
     DBEFCtaAbCompProy: TLFDBEditFind2000;
     DBEFCtaAbVentProy: TLFDBEditFind2000;
     DBETitCtaAbCompProy: TLFEdit;
     DBETitCtaAbVentProy: TLFEdit;
     LFLCtaAbonoVentas: TLFLabel;
     LFLCtaAbonoComp: TLFLabel;
     TBCuentasProyectosSeries: TLFToolBar;
     NavProySeries: THYMNavigator;
     TBArtProySer: TLFToolBar;
     PInfoProySer: TLFPanel;
     DBEArtProySer: TLFDbedit;
     DBEArtDescProySer: TLFDbedit;
     PNProySeries: TLFPanel;
     LFLCtaCompProySer: TLFLabel;
     LFLCtaVentProySer: TLFLabel;
     LFLCtaDevCompPROYSER: TLFLabel;
     LFLCtaDevVentPROYSER: TLFLabel;
     LFLCtaAbCompProySer: TLFLabel;
     LFLCtaAbVentProySer: TLFLabel;
     LFLProySeries: TLFLabel;
     LFLSerieProySer: TLFLabel;
     DBEFCtaCompProySer: TLFDBEditFind2000;
     DBETitCtaCompProySer: TLFEdit;
     DBETitCtaVentProySer: TLFEdit;
     DBETitCtaDevCompProySer: TLFEdit;
     DBETitCtaDevVentProySer: TLFEdit;
     DBETitCtaAbVentProySer: TLFEdit;
     DBEFCtaDevVentProySer: TLFDBEditFind2000;
     DBEFCtaDevCompProySer: TLFDBEditFind2000;
     DBEFCtaAbVentProySer: TLFDBEditFind2000;
     DBEFCtaAbCompProySer: TLFDBEditFind2000;
     DBEFCtaVentProySer: TLFDBEditFind2000;
     DBETitProySeries: TLFDbedit;
     DBEFProySeries: TLFDBEditFind2000;
     DBEFSerieProySer: TLFDBEditFind2000;
     DBETitSerieProySer: TLFDbedit;
     DBGProyectos: THYTDBGrid;
     DBGProySeries: THYTDBGrid;
     DBGSeries: THYTDBGrid;
     CESeries: TControlEdit;
     CESeriesPMEdit: TPopUpTeclas;
     CEProyectos: TControlEdit;
     CEProyectosPMEdit: TPopUpTeclas;
     CEProySeries: TControlEdit;
     CEProySeriesPMEdit: TPopUpTeclas;
     DBETitCtaAbCompProySer: TLFEdit;
     DBGFSubfamilias: TDBGridFind2000;
     TSSubfamilias: TTabSheet;
     CESubfamilias: TControlEdit;
     NavSubfamilias: THYMNavigator;
     TBSubfamilia: TLFToolBar;
     LOrden: TLFLabel;
     DBEOrden: TLFDbedit;
     LTipoPrecioBase: TLFLabel;
     DBEFTipoPrecioBase: TLFDBEditFind2000;
     ETitTipoPrecioBase: TLFEdit;
     LTipoRegistroFitosanitario: TLFLabel;
     DBCBTipoRegistroFitosanitario: TLFDBComboBoxValue;
     LBLDisponibilidad: TLFLabel;
     DBEFDisponibilidad: TLFDBEditFind2000;
     DBEDisponibilidad: TLFDbedit;
     TBSubFamiliaFamilia: TLFToolBar;
     PNLSubFamiliaFamilia: TLFPanel;
     DBESubFamiliaFamilia: TLFDbedit;
     DBESubFamiliaTituloFamilia: TLFDbedit;
     TSECommerce: TTabSheet;
     TBArticuloTiendaEC: TLFToolBar;
     TBSep2: TToolButton;
     PNLECommerceFamilia: TLFPanel;
     DBEECommerceFamilia: TLFDbedit;
     DBEECommerceTituloFamilia: TLFDbedit;
     TBSep3: TToolButton;
     NavFamiliaTiendaEC: THYMNavigator;
     PNLTiendaPrestashop: TLFPanel;
     DBETiendaPrestashop: TLFDbedit;
     DBETituloTiendaPrestashop: TLFDbedit;
     TBSep4: TToolButton;
     PNLFijarTiendaPrestashop: TLFPanel;
     LFijarTiendaPrestashop: TLFLabel;
     EFFijarTiendaPrestashop: TLFEditFind2000;
     DBGFamiliaECPrestashop: TDBGridFind2000;
     PNLSincronizacionPrestashop: TPanel;
     BSubirFamiliasPrestashop: TButton;
     LSubirFamiliasPrestashop: TLFLabel;
     ESeccion: TLFEdit;
     DBEFSeccion: TLFDBEditFind2000;
     LSeccion: TLFLabel;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     BClipboard: TButton;
     Imagen: TImage;
     SBAImagen: TSpeedButton;
     AFiltraArticulos: TAction;
     TBFiltraArticulos: TToolButton;
     LArticulos: TLFLabel;
     DBECantidadArticulos: TLFDbedit;
     SBAFiltraArticulos: TSpeedButton;
     DBCBActualizaVenta: TLFDBCheckBox;
     DBCBPCosteCeroEnVentas: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EDiasMaxChange(Sender: TObject);
     procedure EDiasMinChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure AVisualizarFamiliasExecute(Sender: TObject);
     procedure AImprimirFamiliasExecute(Sender: TObject);
     procedure AVisualizarArtFamiliasExecute(Sender: TObject);
     procedure AImprimirArtFamiliaFiltradosExecute(Sender: TObject);
     procedure AMovArtFamiliaExecute(Sender: TObject);
     procedure AConfListadosFamiliasExecute(Sender: TObject);
     procedure AConfListadoArticulosPorFamiliasExecute(Sender: TObject);
     procedure AConfListadosMovArticulosPorFamiliasExecute(Sender: TObject);
     procedure APropagaCuentasSeriesExecute(Sender: TObject);
     procedure APropagaMargenTarifasExecute(Sender: TObject);
     procedure APropagaMargenArticulosExecute(Sender: TObject);
     procedure APropagaRedondeoExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBEFamiliaChange(Sender: TObject);
     procedure AVerFamiliaSistemaExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NAVSeriesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFProyectoBusqueda(Sender: TObject);
     procedure DBEFProySeriesBusqueda(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure DBEFAbonoComprasChange(Sender: TObject);
     procedure DBEFAbonoVentasChange(Sender: TObject);
     procedure DBEFCtaCompProySerChange(Sender: TObject);
     procedure DBEFCtaVentProySerChange(Sender: TObject);
     procedure DBEFCtaAbCompProySerChange(Sender: TObject);
     procedure DBEFCtaAbVentProySerChange(Sender: TObject);
     procedure DBEFCtaCompProyChange(Sender: TObject);
     procedure DBEFCtaVentProyChange(Sender: TObject);
     procedure DBEFCtaAbCompProyChange(Sender: TObject);
     procedure DBEFCtaAbVentProyChange(Sender: TObject);
     procedure DBEFCtaComprasChange(Sender: TObject);
     procedure DBEFCtaVentasChange(Sender: TObject);
     procedure DBEFCtaAbonoComprasChange(Sender: TObject);
     procedure DBEFCtaAbonoVentasChange(Sender: TObject);
     procedure DBEFCtaDevComprasChange(Sender: TObject);
     procedure DBEFCtaDevVentasChange(Sender: TObject);
     procedure DBEFCtaDevCompProyChange(Sender: TObject);
     procedure DBEFCtaDevVentProyChange(Sender: TObject);
     procedure DBEFCtaDevCompProySerChange(Sender: TObject);
     procedure DBEFCtaDevVentProySerChange(Sender: TObject);
     procedure DBEFComprasChange(Sender: TObject);
     procedure DBEFVentasChange(Sender: TObject);
     procedure DBEFDevolucionComprasChange(Sender: TObject);
     procedure DBEFDevolucionVentasChange(Sender: TObject);
     procedure DBEFTipoPrecioBaseChange(Sender: TObject);
     procedure TSECommerceShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure FormActivate(Sender: TObject);
     procedure EFFijarTiendaPrestashopChange(Sender: TObject);
     procedure BSubirFamiliasPrestashopClick(Sender: TObject);
     procedure DBGFamiliaECPrestashopDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEFSeccionChange(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure SBAImagenDblClick(Sender: TObject);
     procedure AFiltraArticulosExecute(Sender: TObject);
     procedure DBECantidadArticulosDblClick(Sender: TObject);
     procedure SBAFiltraArticulosDblClick(Sender: TObject);
  private
     { Private declarations }
     SWFil: integer;
     Sistema: boolean;
     Param_MODSINC003: boolean;
     procedure MuestraFiltrado(Tipo: byte);
     procedure MuestraFamiliasFiltradas(Tipo: byte);
     procedure CambiaFamiliaSistema(Sistema: boolean);
     procedure DameCuentasVisibles(Activo: boolean; Color1, Color2, Color3, Color4: TColor);
  public
     { Public declarations }
  end;

var
  FMFamilias : TFMFamilias;

implementation

uses UDMFamilias, UFormGest, UDMMain, UEntorno, UFPregArtFamilias,
  UDMLstFamilias, UFMListConfig, UUtiles, UFMain, UParam, UDMSincronizacionTienda, UFSendCorreo, UFMostrarImagen, UDameDato, UImagenes;

{$R *.DFM}

procedure TFMFamilias.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMFamilias, DMFamilias);
  NavMain.DataSource := DMFamilias.DSQMFamilias;
  DBGMain.DataSource := DMFamilias.DSQMFamilias;
  EPMain.DataSource := DMFamilias.DSQMFamilias;
  G2kTableLoc.DataSource := DMFamilias.DSQMFamilias;
  DBEFCompras.MaxLength := REntorno.DigitosSub;
  DBEFVentas.MaxLength := REntorno.DigitosSub;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  SWFil := 0;
  ControlEdit := CEMain;
  PCMain.ActivePage := TSFicha;
  PCCuentas.ActivePage := TSSeries;
  EDiasMin.Text := IntToStr(DMFamilias.DiasMin);
  EDiasMax.Text := IntToStr(DMFamilias.DiasMax);
  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then // dji lrk kri
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavSeries.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     APropagaCuentasSeries.Enabled := False;
  end;

  FMain.AddComponentePunto(DBEFCompras);
  FMain.AddComponentePunto(DBEFVentas);
  FMain.AddComponentePunto(DBEFDevolucionCompras);
  FMain.AddComponentePunto(DBEFDevolucionVentas);
  FMain.AddComponentePunto(DBEFAbonoCompras);
  FMain.AddComponentePunto(DBEFAbonoVentas);

  FMain.AddComponentePunto(DBEFCtaCompras);
  FMain.AddComponentePunto(DBEFCtaVentas);
  FMain.AddComponentePunto(DBEFCtaDevCompras);
  FMain.AddComponentePunto(DBEFCtaDevVentas);
  FMain.AddComponentePunto(DBEFCtaAbonoCompras);
  FMain.AddComponentePunto(DBEFCtaAbonoVentas);

  // Sincronizacion Prestashop
  Param_MODSINC003 := (LeeParametro('MODSINC003') = 'S');

  SolapaControles(SBAImagen, ETituloImagen);
  ETituloImagen.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAFiltraArticulos, DBECantidadArticulos);
  DBECantidadArticulos.Color := REntorno.ColorEnlaceActivo;

  // Color campo ID
  ColorCampoID(DBEFamilia);
end;

procedure TFMFamilias.FormActivate(Sender: TObject);
begin
  inherited;
  TSECommerce.TabVisible := Param_MODSINC003;
  TSSubfamilias.TabVisible := (DMMain.EstadoKri(445) = 1);
end;

procedure TFMFamilias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(DBEFCompras);
  FMain.DelComponentePunto(DBEFVentas);
  FMain.DelComponentePunto(DBEFDevolucionCompras);
  FMain.DelComponentePunto(DBEFDevolucionVentas);
  FMain.DelComponentePunto(DBEFAbonoCompras);
  FMain.DelComponentePunto(DBEFAbonoVentas);

  FMain.DelComponentePunto(DBEFCtaCompras);
  FMain.DelComponentePunto(DBEFCtaVentas);
  FMain.DelComponentePunto(DBEFCtaDevCompras);
  FMain.DelComponentePunto(DBEFCtaDevVentas);
  FMain.DelComponentePunto(DBEFCtaAbonoCompras);
  FMain.DelComponentePunto(DBEFCtaAbonoVentas);

  CierraData(DMFamilias);
  FMFamilias := nil;
end;

procedure TFMFamilias.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  SWFil := 1;
  DMFamilias.Busquedacompleja;
  Continua := False;
end;

procedure TFMFamilias.MuestraFiltrado(Tipo: byte);
begin
  AbreData(TDMLstFamilias, DMLstFamilias);
  DMLstFamilias.MostrarListadoFiltrado(Tipo, SWFil, DMFamilias.QMFamilias.SelectSQL);
  CierraData(DMLstFamilias);
end;

procedure TFMFamilias.MuestraFamiliasFiltradas(Tipo: byte);
begin
  AbreData(TDMLstFamilias, DMLstFamilias);
  DMLstFamilias.MostrarFamiliasFiltradas(Tipo, SWFil, DMFamilias.QMFamilias.SelectSQL);
  CierraData(DMLstFamilias);
end;

procedure TFMFamilias.AVisualizarFamiliasExecute(Sender: TObject);
begin
  inherited;
  MuestraFamiliasFiltradas(0);
end;

procedure TFMFamilias.AImprimirFamiliasExecute(Sender: TObject);
begin
  inherited;
  MuestraFamiliasFiltradas(1);
end;

procedure TFMFamilias.AVisualizarArtFamiliasExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMFamilias.AImprimirArtFamiliaFiltradosExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMFamilias.AMovArtFamiliaExecute(Sender: TObject);
begin
  inherited;
  TFPregArtFamilias.Create(Self).Show_Win(DMFamilias.QMFamiliasFAMILIA.AsString);
end;

procedure TFMFamilias.AConfListadosFamiliasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstFamilias, DMLstFamilias);
  TFMListConfig.Create(Self).Muestra(127, formato, cabecera, copias,
     pijama, '', DMLstFamilias.frFamilias);
  CierraData(DMLstFamilias);
end;

procedure TFMFamilias.AConfListadoArticulosPorFamiliasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstFamilias, DMLstFamilias);
  TFMListConfig.Create(Self).Muestra(51, formato, cabecera, copias,
     pijama, '', DMLstFamilias.frFamilias);
  CierraData(DMLstFamilias);
end;

procedure TFMFamilias.AConfListadosMovArticulosPorFamiliasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstFamilias, DMLstFamilias);
  TFMListConfig.Create(Self).Muestra(50, formato, cabecera, copias,
     pijama, '', DMLstFamilias.frFamilias);
  CierraData(DMLstFamilias);
end;

procedure TFMFamilias.APropagaCuentasSeriesExecute(Sender: TObject);
begin
  inherited;
  DMFamilias.Propagar;
end;

procedure TFMFamilias.APropagaMargenTarifasExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     if ConfirmaGrave then
        DMFamilias.PropagaMargen;
end;

procedure TFMFamilias.APropagaMargenArticulosExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     if ConfirmaGrave then
        DMFamilias.PropagaMargenArticulo;
end;

procedure TFMFamilias.APropagaRedondeoExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     if ConfirmaGrave then
        DMFamilias.PropagaRed;
end;

procedure TFMFamilias.PCMainChange(Sender: TObject);
begin
  inherited;
  if PCMain.ActivePage = TSFicha then
  begin
     DMFamilias.Refresca(0);
     ControlEdit := CEMain;
  end
  else
  begin
     if PCCuentas.ActivePage = TSSeries then
     begin
        DMFamilias.Refresca(1);
        ControlEdit := CESeries;
     end;
     if PCCuentas.ActivePage = TSProyectos then
     begin
        DMFamilias.Refresca(2);
        ControlEdit := CEProyectos;
     end;
     if PCCuentas.ActivePage = TSProySeries then
     begin
        DMFamilias.Refresca(3);
        ControlEdit := CEProySeries;
     end;
  end;
end;

procedure TFMFamilias.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if PCMain.ActivePage = TSFicha then
  begin
     DMFamilias.CerrarEcommerce;
     ControlEdit := CEMain;
  end;
end;

procedure TFMFamilias.DBEFamiliaChange(Sender: TObject);
var
  Color1, Color2, Color3, Color4 : TColor;
  Activo : boolean;
begin
  inherited;

  Color1 := clInfoBk;
  Color2 := clGrayText;
  Color3 := clWindow;
  Color4 := clWindowText;

  Activo := 1 = 0;

  if (Sender as TLFDBEdit).Text = 'SYS' then
  begin
     Color1 := clWindow;
     Color2 := clWindowText;
     Color3 := clInfoBk;
     Color4 := clGrayText;
     Activo := True;
  end;

  DameCuentasVisibles(Activo, Color1, Color2, Color3, Color4);
end;

procedure TFMFamilias.CambiaFamiliaSistema(Sistema: boolean);
begin
  DMFamilias.CambiaFamiliaSistema(Sistema);
  if Sistema then
  begin
     AVerFamiliaSistema.Caption := _('Ver Familias Normales');
     AVerFamiliaSistema.Hint := _('Ver Familias Normales');
     G2KTableLoc.CondicionBusqueda := 'FAMILIA=''' + REntorno.FamSistema + '''';
  end
  else
  begin
     AVerFamiliaSistema.Caption := _('Ver Familia Sistema');
     AVerFamiliaSistema.Hint := _('Ver Familia Sistema');
     G2KTableLoc.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  end;
  CESeries.PanelEdicion := PNSeries;
  NAVSeries.ControlEdit := CESeries;
end;

procedure TFMFamilias.AVerFamiliaSistemaExecute(Sender: TObject);
begin
  inherited;
  Sistema := not (Sistema);
  CambiaFamiliaSistema(Sistema);
end;

procedure TFMFamilias.FormShow(Sender: TObject);
begin
  inherited;
  Sistema := False;
  CambiaFamiliaSistema(Sistema);
end;

procedure TFMFamilias.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMFamilias.TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaCta(Sender);
end;

procedure TFMFamilias.DameCuentasVisibles(Activo: boolean; Color1, Color2, Color3, Color4: TColor);
begin
  // Pestaña Ficha
  DBEFIVA.Color := Color3;
  DBEFIVA.Font.Color := Color4;
  DBEFIVA.Enabled := not (Activo);
  DBEFIVA.ReadOnly := Activo;

  DBEFCompras.Enabled := not (Activo);
  DBEFCompras.Font.Color := Color4;
  DBEFCompras.Color := Color3;

  DBEFVentas.Enabled := not (Activo);
  DBEFVentas.Font.Color := Color4;
  DBEFVentas.Color := Color3;

  DBEFAbonoCompras.Visible := Activo;
  DBEFAbonoCompras.Enabled := Activo;
  DBETitAbonoCompras.Visible := Activo;
  LBCtaAbonoC.Visible := Activo;

  DBEFDevolucionCompras.Visible := not (Activo);
  DBEFDevolucionCompras.Enabled := not (Activo);
  DBETitDevCompras.Visible := not (Activo);
  LBCtaDevC.Visible := not (Activo);

  DBEFDevolucionVentas.Visible := not (Activo);
  DBEFDevolucionVentas.Enabled := not (Activo);
  DBETitDevVentas.Visible := not (Activo);
  LBCtaDevV.Visible := not (Activo);

  DBEFAbonoVentas.Visible := Activo;
  DBEFAbonoVentas.Enabled := Activo;
  DBETitAbonoVentas.Visible := Activo;
  CtaAbnV.Visible := Activo;

  // Pestaña Series
  DBEFCtaCompras.Enabled := not (Activo);
  DBEFCtaCompras.Color := Color3;
  DBEFCtaCompras.Font.Color := Color4;

  DBEFCtaVentas.Enabled := not (Activo);
  DBEFCtaVentas.Color := Color3;
  DBEFCtaVentas.Font.Color := Color4;

  DBEFCtaAbonoCompras.Visible := Activo;
  DBEFCtaAbonoCompras.Enabled := Activo;
  DBETitCtaAbonoCompras.Visible := Activo;
  LBCtaAbnC.Visible := Activo;

  DBEFCtaAbonoVentas.Visible := Activo;
  DBEFCtaAbonoVentas.Enabled := Activo;
  DBETitCtaAbonoVentas.Visible := Activo;
  LbCtaAbnV.Visible := Activo;

  LBCtaDevlC.Visible := not (Activo);
  DBEFCtaDevCompras.Visible := not (Activo);
  DBEFCtaDevCompras.Enabled := not (Activo);
  DBETitCtaDevCompras.Visible := not (Activo);

  LbCtaDvnV.Visible := not (Activo);
  DBEFCtaDevVentas.Visible := not (Activo);
  DBEFCtaDevVentas.Enabled := not (Activo);
  DBETitCtaDevVentas.Visible := not (Activo);

  // Pestaña Cuentas-Proyectos
  DBEFCtaCompProy.Enabled := not (Activo);
  DBEFCtaCompProy.Color := Color3;
  DBEFCtaCompProy.Font.Color := Color4;

  DBEFCtaVentProy.Enabled := not (Activo);
  DBEFCtaVentProy.Color := Color3;
  DBEFCtaVentProy.Font.Color := Color4;

  DBEFCtaAbCompProy.Visible := Activo;
  DBEFCtaAbCompProy.Enabled := Activo;
  DBETitCtaAbCompProy.Visible := Activo;
  LFLCtaAbonoComp.Visible := Activo;

  DBEFCtaAbVentProy.Visible := Activo;
  DBEFCtaAbVentProy.Enabled := Activo;
  DBETitCtaAbVentProy.Visible := Activo;
  LFLCtaAbonoVentas.Visible := Activo;

  LFLCtaDevComp.Visible := not (Activo);
  DBEFCtaDevCompProy.Visible := not (Activo);
  DBEFCtaDevCompProy.Enabled := not (Activo);
  DBETitCtaDevCompProy.Visible := not (Activo);

  LFLCtaDevVent.Visible := not (Activo);
  DBEFCtaDevVentProy.Visible := not (Activo);
  DBEFCtaDevVentProy.Enabled := not (Activo);
  DBETitCtaDevVentProy.Visible := not (Activo);

  // Pestaña Cuentas-Proyectos/Series
  DBEFCtaCompProySer.Enabled := not (Activo);
  DBEFCtaCompProySer.Color := Color3;
  DBEFCtaCompProySer.Font.Color := Color4;

  DBEFCtaVentProySer.Enabled := not (Activo);
  DBEFCtaVentProySer.Color := Color3;
  DBEFCtaVentProySer.Font.Color := Color4;

  DBEFCtaAbCompProySer.Visible := Activo;
  DBEFCtaAbCompProySer.Enabled := Activo;
  DBETitCtaAbCompProySer.Visible := Activo;
  LFLCtaAbCompProySer.Visible := Activo;

  DBEFCtaAbVentProySer.Visible := Activo;
  DBEFCtaAbVentProySer.Enabled := Activo;
  DBETitCtaAbVentProySer.Visible := Activo;
  LFLCtaAbVentProySer.Visible := Activo;

  LFLCtaDevCompPROYSER.Visible := not (Activo);
  DBEFCtaDevCompProySer.Visible := not (Activo);
  DBEFCtaDevCompProySer.Enabled := not (Activo);
  DBETitCtaDevCompProySer.Visible := not (Activo);

  LFLCtaDevVentPROYSER.Visible := not (Activo);
  DBEFCtaDevVentProySer.Visible := not (Activo);
  DBEFCtaDevVentProySer.Enabled := not (Activo);
  DBETitCtaDevVentProySer.Visible := not (Activo);
end;

procedure TFMFamilias.EDiasMaxChange(Sender: TObject);
begin
  inherited;
  DMFamilias.DiasMax := StrToIntDef(EDiasMax.Text, 0);
end;

procedure TFMFamilias.EDiasMinChange(Sender: TObject);
begin
  inherited;
  DMFamilias.DiasMin := StrToIntDef(EDiasMin.Text, 0);
end;

procedure TFMFamilias.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  EDiasMin.Text := IntToStr(DMFamilias.DiasMin);
  EDiasMax.Text := IntToStr(DMFamilias.DiasMax);

  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMFamilias.NAVSeriesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbEdit then
     if (Trim(DMFamilias.QMFamiliasFAMILIA.AsString) = 'SYS') then
        NAVSeries.EditaControl := DBEFCtaAbonoCompras
     else
        NAVSeries.EditaControl := DBEFCtaCompras;
end;

procedure TFMFamilias.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMFamilias.DBEFProyectoBusqueda(Sender: TObject);
begin
  DBEFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + REntorno.CanalStr + ' or CANAL_NULL is null)';
end;

procedure TFMFamilias.DBEFProySeriesBusqueda(Sender: TObject);
begin
  DBEFProySeries.CondicionBusqueda :=
     '(CANAL_NULL = ' + REntorno.CanalStr + ' or CANAL_NULL is null)';
end;

procedure TFMFamilias.NavMainChangeState(Sender: TObject);
begin
  inherited;
  TSSubfamilias.TabVisible := (DMMain.EstadoKri(445) = 1);
end;

procedure TFMFamilias.DBEFAbonoComprasChange(Sender: TObject);
begin
  inherited;
  DBETitAbonoCompras.Text := DameTituloCuenta(DBEFAbonoCompras.Text);
end;

procedure TFMFamilias.DBEFAbonoVentasChange(Sender: TObject);
begin
  inherited;
  DBETitAbonoVentas.Text := DameTituloCuenta(DBEFAbonoVentas.Text);
end;

procedure TFMFamilias.DBEFCtaCompProySerChange(Sender: TObject);
begin
  inherited;
  DBETitCtaCompProySer.Text := DameTituloCuenta(DBEFCtaCompProySer.Text);
end;

procedure TFMFamilias.DBEFCtaVentProySerChange(Sender: TObject);
begin
  inherited;
  DBETitCtaVentProySer.Text := DameTituloCuenta(DBEFCtaVentProySer.Text);
end;

procedure TFMFamilias.DBEFCtaAbCompProySerChange(Sender: TObject);
begin
  inherited;
  DBETitCtaAbCompProySer.Text := DameTituloCuenta(DBEFCtaAbCompProySer.Text);
end;

procedure TFMFamilias.DBEFCtaAbVentProySerChange(Sender: TObject);
begin
  inherited;
  DBETitCtaAbVentProySer.Text := DameTituloCuenta(DBEFCtaAbVentProySer.Text);
end;

procedure TFMFamilias.DBEFCtaCompProyChange(Sender: TObject);
begin
  inherited;
  DBETitCtaCompProy.Text := DameTituloCuenta(DBEFCtaCompProy.Text);
end;

procedure TFMFamilias.DBEFCtaVentProyChange(Sender: TObject);
begin
  inherited;
  DBETitCtaVentProy.Text := DameTituloCuenta(DBEFCtaVentProy.Text);
end;

procedure TFMFamilias.DBEFCtaAbCompProyChange(Sender: TObject);
begin
  inherited;
  DBETitCtaAbCompProy.Text := DameTituloCuenta(DBEFCtaAbCompProy.Text);
end;

procedure TFMFamilias.DBEFCtaAbVentProyChange(Sender: TObject);
begin
  inherited;
  DBETitCtaAbVentProy.Text := DameTituloCuenta(DBEFCtaAbVentProy.Text);
end;

procedure TFMFamilias.DBEFCtaComprasChange(Sender: TObject);
begin
  inherited;
  DBETitCtaCompras.Text := DameTituloCuenta(DBEFCtaCompras.Text);
end;

procedure TFMFamilias.DBEFCtaVentasChange(Sender: TObject);
begin
  inherited;
  DBETitCtaVentas.Text := DameTituloCuenta(DBEFCtaVentas.Text);
end;

procedure TFMFamilias.DBEFCtaAbonoComprasChange(Sender: TObject);
begin
  inherited;
  DBETitCtaAbonoCompras.Text := DameTituloCuenta(DBEFCtaAbonoCompras.Text);
end;

procedure TFMFamilias.DBEFCtaAbonoVentasChange(Sender: TObject);
begin
  inherited;
  DBETitCtaAbonoVentas.Text := DameTituloCuenta(DBEFCtaAbonoVentas.Text);
end;

procedure TFMFamilias.DBEFCtaDevComprasChange(Sender: TObject);
begin
  inherited;
  DBETitCtaDevCompras.Text := DameTituloCuenta(DBEFCtaDevCompras.Text);
end;

procedure TFMFamilias.DBEFCtaDevVentasChange(Sender: TObject);
begin
  inherited;
  DBETitCtaDevVentas.Text := DameTituloCuenta(DBEFCtaDevVentas.Text);
end;

procedure TFMFamilias.DBEFCtaDevCompProyChange(Sender: TObject);
begin
  inherited;
  DBETitCtaDevCompProy.Text := DameTituloCuenta(DBEFCtaDevCompProy.Text);
end;

procedure TFMFamilias.DBEFCtaDevVentProyChange(Sender: TObject);
begin
  inherited;
  DBETitCtaDevVentProy.Text := DameTituloCuenta(DBEFCtaDevVentProy.Text);
end;

procedure TFMFamilias.DBEFCtaDevCompProySerChange(Sender: TObject);
begin
  inherited;
  DBETitCtaDevCompProySer.Text := DameTituloCuenta(DBEFCtaDevCompProySer.Text);
end;

procedure TFMFamilias.DBEFCtaDevVentProySerChange(Sender: TObject);
begin
  inherited;
  DBETitCtaDevVentProySer.Text := DameTituloCuenta(DBEFCtaDevVentProySer.Text);
end;

procedure TFMFamilias.DBEFComprasChange(Sender: TObject);
begin
  inherited;
  DBETitCompras.Text := DameTituloCuenta(DBEFCompras.Text);
end;

procedure TFMFamilias.DBEFVentasChange(Sender: TObject);
begin
  inherited;
  DBETitVentas.Text := DameTituloCuenta(DBEFVentas.Text);
end;

procedure TFMFamilias.DBEFDevolucionComprasChange(Sender: TObject);
begin
  inherited;
  DBETitDevCompras.Text := DameTituloCuenta(DBEFDevolucionCompras.Text);
end;

procedure TFMFamilias.DBEFDevolucionVentasChange(Sender: TObject);
begin
  inherited;
  DBETitDevVentas.Text := DameTituloCuenta(DBEFDevolucionVentas.Text);
end;

procedure TFMFamilias.DBEFTipoPrecioBaseChange(Sender: TObject);
begin
  inherited;
  ETitTipoPrecioBase.Text := DMFamilias.DameTituloTipoPrecioBase(StrToIntDef(DBEFTipoPrecioBase.Text, 0));
end;

procedure TFMFamilias.TSECommerceShow(Sender: TObject);
begin
  inherited;
  DMFamilias.AbrirEcommerce;
end;

procedure TFMFamilias.EFFijarTiendaPrestashopChange(Sender: TObject);
begin
  inherited;
  DMFamilias.FiltrarEcommercePrestashop(StrToIntDef(EFFijarTiendaPrestashop.Text, 0));
end;

procedure TFMFamilias.BSubirFamiliasPrestashopClick(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionTienda, DMSincronizacionTienda);
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     // FSendCorreo.CambiarSizeFont(10);
     // FSendCorreo.AlineamientoFont(taLeftJustify);
     FSendCorreo.Show;
     FSendCorreo.Titulo(_('Sincronizando Familia'));
     FSendCorreo.Texto(_('Inicializando'));

     DMSincronizacionTienda.FiltraTienda(DMFamilias.QMConfECPrestashopID.AsInteger);
     if (DMSincronizacionTienda.InicializaWebService) then
     begin
        FSendCorreo.Texto(_('Familia') + ' ' + DMFamilias.QMFamiliasFAMILIA.AsString + #13#10 + DMFamilias.QMFamiliasTITULO.AsString);
        DMSincronizacionTienda.CrearUnaFamilia(DMFamilias.QMFamiliasID_FAMILIA.AsInteger);

        // Recorro subfamilias
        FSendCorreo.Titulo(_('Sincronizando SubFamilias'));
        with DMFamilias.QMSubfamilias do
        begin
           if Active then
           begin
              First;
              while not EOF do
              begin
                 if (FieldByName('WEB').AsInteger = 1) then
                 begin
                    FSendCorreo.Texto(_('SubFamilia') + ' ' + FieldByName('SUBFAMILIA').AsString + #13#10 + FieldByName('TITULO').AsString);
                    DMSincronizacionTienda.CrearUnaSubFamilia(FieldByName('ID_FAMILIA').AsInteger, FieldByName('ID_SUBFAMILIA').AsInteger);
                 end;
                 Next;
              end;
           end;
        end;

        DMSincronizacionTienda.SaveLog('Sincronizacion' + FormatDateTime('_yyyymmdd_hhnnss', Now) + '.Log');
     end
     else
        ShowMessage(_('No se pudo inicializar el servicio web'));
  finally
     CierraData(DMSincronizacionTienda);
     FreeAndNil(FSendCorreo);
  end;

  // Defresco datos
  DMFamilias.QMFamiliaECPrestashop.Close;
  DMFamilias.QMFamiliaECPrestashop.Open;
end;

procedure TFMFamilias.DBGFamiliaECPrestashopDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'SUBFAMILIA') or (UpperCase(Column.FieldName) = 'TITULO_SUBFAMILIA')) then
        begin
           if (DataSource.DataSet.FieldByName('ID_SUBFAMILIA').AsInteger = 0) then
              ColorInactivo(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFamilias.DBEFSeccionChange(Sender: TObject);
begin
  inherited;
  ESeccion.Text := DameTituloSeccion(DBEFSeccion.Text);
end;

procedure TFMFamilias.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMFamilias.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMFamilias.QMFamiliasID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMFamilias.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMFamilias.QMFamiliasID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMFamilias.SBAImagenDblClick(Sender: TObject);
begin
  inherited;
  MuestraImagen(DMFamilias.QMFamiliasID_IMAGEN.AsInteger);
end;

procedure TFMFamilias.AFiltraArticulosExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, format('FAMILIA = ''%s''', [DMFamilias.QMFamiliasFAMILIA.AsString]));
end;

procedure TFMFamilias.DBECantidadArticulosDblClick(Sender: TObject);
begin
  inherited;
  AFiltraArticulos.Execute;
end;

procedure TFMFamilias.SBAFiltraArticulosDblClick(Sender: TObject);
begin
  inherited;
  AFiltraArticulos.Execute;
end;

end.
