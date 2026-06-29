unit UFMAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, UFIBDBEditfind, DBCtrls, StdCtrls, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, UG2kTBLoc, Buttons, ULFEditFind2000,
  ULFComboBox, ULFDateEdit, DateUtils, rxToolEdit, ULFEdit;

type
  TFMAlmacenes = class(TFPEdit)
     LBLAlmacen: TLFLabel;
     DBEAlmacen: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLtipo: TLFLabel;
     DBETitTipoAlmacen: TLFDbedit;
     LBLTercero: TLFLabel;
     DBEFTercero: TLFDBEditFind2000;
     DBETitTercero: TLFDbedit;
     LBLDir: TLFLabel;
     DBETitDireccion: TLFDbedit;
     DBEFDireccion: TLFDBEditFind2000;
     DBCBAutoContiene: TLFDBCheckBox;
     DBEFTipoAlmacen: TLFDBEditFind2000;
     AInfoTercero: TAction;
     DBCBAlmacenDeposito: TLFDBCheckBox;
     CBCtrolUbicacion: TLFDBCheckBox;
     AConfigAlmacen: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     ALAlmacenes: TLFActionList;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     DBCBAlmacenPorDefecto: TLFDBCheckBox;
     TSArticulos: TTabSheet;
     PNLArticulos: TLFPanel;
     PnlManejo: TLFPanel;
     LAlmacen: TLFLabel;
     DBEAlmacenArticulo: TLFDbedit;
     NavArticulos: THYMNavigator;
     EFFamHasta: TLFEditFind2000;
     EFFamDesde: TLFEditFind2000;
     LFamilia: TLFLabel;
     LFHasta: TLFLabel;
     LDesde: TLFLabel;
     LArticulo: TLFLabel;
     EFArtHasta: TLFEditFind2000;
     EFArtDesde: TLFEditFind2000;
     DBGArticulos: THYTDBGrid;
     LAgrupacion: TLFLabel;
     EFAgrupHasta: TLFEditFind2000;
     EFAgrupDesde: TLFEditFind2000;
     TSMovimientos: TTabSheet;
     DBGMovimientos: THYTDBGrid;
     PnlCabeceraFiltro: TLFPanel;
     PnlGridFiltro: TLFPanel;
     NavMovimientos: THYMNavigator;
     DBEAlmacenMovimientos: TLFDbedit;
     LAlmacenMovimientos: TLFLabel;
     EFArtDesdeMovimiento: TLFEditFind2000;
     EFArtHastaMovimiento: TLFEditFind2000;
     ArtDesde: TLFLabel;
     ArtHasta: TLFLabel;
     LTipoMov: TLFLabel;
     LbEjercicio: TLFLabel;
     LCanal: TLFLabel;
     CBTipoMov: TLFComboBox;
     EFEjerDesdeMovimiento: TLFEditFind2000;
     EFCanal: TLFEditFind2000;
     EFEjerHastaMovimiento: TLFEditFind2000;
     LHastaEjercicio: TLFLabel;
     LFFechaDesde: TLFLabel;
     LFFechaHasta: TLFLabel;
     DEFechaDesdeMovimientos: TLFDateEdit;
     DEFechaHastaMovimientos: TLFDateEdit;
     LOrigen: TLFLabel;
     CBOrigenMovimientos: TLFComboBox;
     TSAlmacenInteligenteMECALUX: TTabSheet;
     TBArticulos: TLFToolBar;
     ToolButton1: TToolButton;
     DBETituloAlmacenArticulo: TLFDbedit;
     TBMovimientos: TLFToolBar;
     ToolButton2: TToolButton;
     DBETituloAlmacenMovimientos: TLFDbedit;
     TBAlmacenInteligente: TLFToolBar;
     LAlmacenAlmInteligente: TLFLabel;
     DBEAlmacenAlmInteligente: TLFDbedit;
     DBETituloAlmacenAlmInteligente: TLFDbedit;
     ToolButton3: TToolButton;
     BInsertarFamilia: TBitBtn;
     BEliminarFamilia: TBitBtn;
     BInsertarArticulo: TBitBtn;
     BEliminarArticulo: TBitBtn;
     BInsertarAgrupacion: TBitBtn;
     BEliminarAgrupacion: TBitBtn;
     BMaestroDeProductos: TBitBtn;
     LCarpetaImportacion: TLFLabel;
     BLeerMovimientos: TBitBtn;
     LMaestroProcesado: TLFLabel;
     DBTMaestroProcesado: TDBText;
     BBorrarMarcasMaestroProductos: TBitBtn;
     DBECarpetaImportacion: TLFDbedit;
     DBCBAlmacenInteligente: TLFDBCheckBox;
     NavAlmacenInteligente: THYMNavigator;
     PNLAlmacenInteligenteMECALUX: TLFPanel;
     CEAlmacenInteligenteMECALUX: TControlEdit;
     PopUpAlmacenInteligenteMECALUX: TPopUpTeclas;
     CEArticulos: TControlEdit;
     PopUpArticulos: TPopUpTeclas;
     CEMovimientos: TControlEdit;
     PopUpMovimientos: TPopUpTeclas;
     LCarpetaExportacion: TLFLabel;
     DBECarpetaExportacion: TLFDbedit;
     LAlmacenOrigen: TLFLabel;
     DBEAlmacenOrigen: TLFDBEditFind2000;
     EAlmacenOrigen: TLFEdit;
     LAlmacenDestino: TLFLabel;
     DBEAlmacenDestino: TLFDBEditFind2000;
     EAlmacenDestino: TLFEdit;
     LSerieMovimiento: TLFLabel;
     EFSerieMovimiento: TLFDBEditFind2000;
     ESerieMovimiento: TLFEdit;
     TSUbicaciones: TTabSheet;
     PNLUbicaciones: TLFPanel;
     DBGUbicaciones: THYTDBGrid;
     LAlmacenUbicacion: TLFLabel;
     DBEAlmacenUbicaion: TLFDbedit;
     DBETituloAlmacen: TLFDbedit;
     PNLLote: TLFPanel;
     PNLArticulo: TLFPanel;
     DBGArticulo: THYTDBGrid;
     DBGLotes: THYTDBGrid;
     NavUbicaciones: THYMNavigator;
     TBUbicacionesArticulos: TLFToolBar;
     NavUbicacionesArticulo: THYMNavigator;
     LUbicacion: TLFLabel;
     EFUbicacion: TLFEditFind2000;
     AListado: TAction;
     TBUbicaciones: TLFToolBar;
     ToolButton4: TToolButton;
     ToolButton5: TToolButton;
     PNLDetalleUbicacion: TLFPanel;
     Splitter1: TSplitter;
     Splitter2: TSplitter;
     LArticuloUbicaciones: TLFLabel;
     EFArticuloUbicaciones: TLFEditFind2000;
     ToolButton6: TToolButton;
     ToolButton7: TToolButton;
     cbSoloElementosConStock: TLFCheckBox;
     TSStocks: TTabSheet;
     TBStocks: TLFToolBar;
     LAlmacenStock: TLFLabel;
     DBEAlmacenStocks: TLFDbedit;
     DBETituloAlmacenStocks: TLFDbedit;
     ToolButton8: TToolButton;
     NavStocks: THYMNavigator;
     PDetalleStock: TLFPanel;
     DBGStock: THYTDBGrid;
     PnlCabeceraStocks: TLFPanel;
     LFLArticuloD: TLFLabel;
     LFLArticuloH: TLFLabel;
     LFLFamiliaD: TLFLabel;
     LFLCanal: TLFLabel;
     LFLFamiliaH: TLFLabel;
     DBEArticuloDStocks: TLFEditFind2000;
     DBEArticuloHStocks: TLFEditFind2000;
     DBEFamiliaDStocks: TLFEditFind2000;
     DBECanalStocks: TLFEditFind2000;
     DBEFamiliaHStocks: TLFEditFind2000;
     CEStocks: TControlEdit;
     PopUpStocks: TPopUpTeclas;
     MenuItem64: TMenuItem;
     MenuItem65: TMenuItem;
     MenuItem66: TMenuItem;
     MenuItem67: TMenuItem;
     MenuItem68: TMenuItem;
     MenuItem69: TMenuItem;
     MenuItem70: TMenuItem;
     MenuItem71: TMenuItem;
     MenuItem72: TMenuItem;
     MenuItem73: TMenuItem;
     MenuItem74: TMenuItem;
     MenuItem75: TMenuItem;
     MenuItem76: TMenuItem;
     MenuItem77: TMenuItem;
     MenuItem78: TMenuItem;
     MenuItem79: TMenuItem;
     MenuItem80: TMenuItem;
     MenuItem81: TMenuItem;
     MenuItem82: TMenuItem;
     MenuItem83: TMenuItem;
     MenuItem84: TMenuItem;
     AAcumulaStocks: TAction;
     TBAcumula: TToolButton;
     ToolButton9: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     LFCategoryAction4: TLFCategoryAction;
     AListadoDeStock: TAction;
     AConfListadoDeStock: TAction;
     DBCBAlmacenActivo: TLFDBCheckBox;
     LCtaInventario: TLFLabel;
     LCtaIngresos: TLFLabel;
     DBEFCtaIngresos: TLFDBEditFind2000;
     DBEFCtaInventario: TLFDBEditFind2000;
     ECtaInventario: TLFEdit;
     ECtaIngresos: TLFEdit;
     LCtaGastos: TLFLabel;
     DBEFCtaGastos: TLFDBEditFind2000;
     ECtaGastos: TLFEdit;
     GBInventarioPermanente: TGroupBox;
     ARecalcularPrecios: TAction;
     APonderaArticulos: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AInfoTerceroExecute(Sender: TObject);
     procedure AConfigAlmacenExecute(Sender: TObject);
     procedure AATerceroExecute(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure ParametrosChange(Sender: TObject);
     procedure TSMovimientosShow(Sender: TObject);
     procedure BInsertarFamiliaClick(Sender: TObject);
     procedure BEliminarFamiliaClick(Sender: TObject);
     procedure BInsertarArticuloClick(Sender: TObject);
     procedure BEliminarArticuloClick(Sender: TObject);
     procedure BInsertarAgrupacionClick(Sender: TObject);
     procedure BEliminarAgrupacionClick(Sender: TObject);
     procedure BMaestroDeProductosClick(Sender: TObject);
     procedure BBorrarMarcasMaestroProductosClick(Sender: TObject);
     procedure TSAlmacenInteligenteMECALUXShow(Sender: TObject);
     procedure DBEAlmacenChange(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure TSArticulosShow(Sender: TObject);
     procedure BLeerMovimientosClick(Sender: TObject);
     procedure DBEAlmacenOrigenChange(Sender: TObject);
     procedure DBEAlmacenDestinoChange(Sender: TObject);
     procedure EFSerieMovimientoChange(Sender: TObject);
     procedure EFUbicacionBusqueda(Sender: TObject);
     procedure EFUbicacionChange(Sender: TObject);
     procedure AListadoExecute(Sender: TObject);
     procedure TSUbicacionesShow(Sender: TObject);
     procedure EFArticuloUbicacionesChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure cbSoloElementosConStockChange(Sender: TObject);
     procedure AAcumulaStocksExecute(Sender: TObject);
     procedure TSStocksShow(Sender: TObject);
     procedure AListadoDeStockExecute(Sender: TObject);
     procedure AConfListadoDeStockExecute(Sender: TObject);
     procedure AListadoDeStockFiltradoExecute(Sender: TObject);
     procedure DBEFCtaInventarioChange(Sender: TObject);
     procedure DBEFCtaIngresosChange(Sender: TObject);
     procedure DBEFCtaGastosChange(Sender: TObject);
     procedure TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure ARecalcularPreciosExecute(Sender: TObject);
     procedure APonderaArticulosExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGStockDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Ponderar;
     procedure ActualizarPMP;
  end;

var
  FMAlmacenes : TFMAlmacenes;

implementation

uses UDMAlmacenes, UFormGest, UDMMain, UFMConfiguraAlmacen,
  UFMain, UEntorno, UDMRStockAlmacen, UDMListados, UUtiles, UFMListConfig, UParam, UDameDato;

{$R *.DFM}

procedure TFMAlmacenes.FormCreate(Sender: TObject);
var
  Min, Max : string;
begin
  inherited;
  AbreData(TDMAlmacenes, DMAlmacenes);
  NavMain.DataSource := DMAlmacenes.DSQMAlmacenes;
  DBGMain.DataSource := DMAlmacenes.DSQMAlmacenes;
  G2KTableLoc.DataSource := DMAlmacenes.DSQMAlmacenes;
  CEMainPMEdit.Teclas := DMMain.teclas;
  AConfigAlmacen.Enabled := (DMAlmacenes.QMAlmacenesCTROL_UBICACION.AsInteger = 1);
  NavStocks.DataSource := DMAlmacenes.DSxStocks;

  {EFEjerDesdeMovimiento.Text:=REntorno.EjercicioStr;
  EFEjerHastaMovimiento.Text:=REntorno.EjercicioStr;}
  EFCanal.Text := REntorno.CanalStr;
  DEFechaHastaMovimientos.Date := EncodeDate(YearOf(Now), 12, 31);

  DBTMaestroProcesado.Visible := False;
  LMaestroProcesado.Visible := False;

  DBECanalStocks.Text := REntorno.CanalStr;

  DameMinMax('ART', Min, Max);
  DBEArticuloDStocks.Text := Min;
  DBEArticuloHStocks.Text := Max;

  DameMinMax('FAM', Min, Max);
  DBEFamiliaDStocks.Text := Min;
  DBEFamiliaHStocks.Text := Max;

  EFArticuloUbicaciones.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';

  DBEFCtaInventario.MaxLength := REntorno.DigitosSub;
  DBEFCtaIngresos.MaxLength := REntorno.DigitosSub;
  DBEFCtaGastos.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(DBEFCtaInventario);
  FMain.AddComponentePunto(DBEFCtaIngresos);
  FMain.AddComponentePunto(DBEFCtaGastos);

  if (LeeParametro('MODREST025') <> 'S') then
  begin
     CBCtrolUbicacion.Visible := False;
     FreeAndNil(TSUbicaciones);
     FreeAndNil(AConfigAlmacen);
     // Después de eliminar un TabSheet hay que establecer cual es la solapa activa.
     PCMain.ActivePage := TSFicha;
  end;

  // Color campo ID
  ColorCampoID(DBEAlmacen);

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BMaestroDeProductos, 1, DMMain.ILMain_Ac, 94);
  GetBitmapFromImageList(BBorrarMarcasMaestroProductos, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(BLeerMovimientos, 1, DMMain.ILMain_Ac, 49);
  GetBitmapFromImageList(BInsertarFamilia, 1, DMMain.ILMain_Ac, 146);
  GetBitmapFromImageList(BInsertarArticulo, 1, DMMain.ILMain_Ac, 146);
  GetBitmapFromImageList(BInsertarAgrupacion, 1, DMMain.ILMain_Ac, 146);
  GetBitmapFromImageList(BEliminarFamilia, 1, DMMain.ILMain_Ac, 147);
  GetBitmapFromImageList(BEliminarArticulo, 1, DMMain.ILMain_Ac, 147);
  GetBitmapFromImageList(BEliminarAgrupacion, 1, DMMain.ILMain_Ac, 147);
end;

procedure TFMAlmacenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(DBEFCtaInventario);
  FMain.DelComponentePunto(DBEFCtaIngresos);
  FMain.DelComponentePunto(DBEFCtaGastos);

  CierraData(DMAlmacenes);
  FMAlmacenes := nil;
end;

procedure TFMAlmacenes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMAlmacenes.BusquedaCompleja;
  Continua := False;
end;

procedure TFMAlmacenes.AInfoTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMAlmacenes.AConfigAlmacenExecute(Sender: TObject);
begin
  inherited;
  if (DMAlmacenes.QMAlmacenesCTROL_UBICACION.AsInteger = 1) then
  begin
     AbreForm(TFMConfiguraAlmacen, FMConfiguraAlmacen, Sender);
     FMConfiguraAlmacen.InicializaAlmacen(DBEAlmacen.Text);
  end;
end;

procedure TFMAlmacenes.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if DBEFTercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBEFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DMAlmacenes.QMAlmacenesTERCERO.AsInteger));
end;

procedure TFMAlmacenes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Assigned(AConfigAlmacen) then
     AConfigAlmacen.Enabled := (DMAlmacenes.QMAlmacenesCTROL_UBICACION.AsInteger = 1);
end;

procedure TFMAlmacenes.ParametrosChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSMovimientos) then
     DMAlmacenes.FiltraAlmacenes(EFArtDesdeMovimiento.Text, EFArtHastaMovimiento.Text, StrToIntDef(EFEjerDesdeMovimiento.Text, 0),
        StrToIntDef(EFEjerHastaMovimiento.Text, 0), StrToIntDef(EFCanal.Text, 0), CBTipoMov.ItemIndex,
        DEFechaDesdeMovimientos.Date, DEFechaHastaMovimientos.Date, CBOrigenMovimientos.ItemIndex);
end;

procedure TFMAlmacenes.BInsertarFamiliaClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AgregarQuitarFamilia('I', EFFamDesde.Text, EFFamHasta.Text);
end;

procedure TFMAlmacenes.BEliminarFamiliaClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AgregarQuitarFamilia('D', EFFamDesde.Text, EFFamHasta.Text);
end;

procedure TFMAlmacenes.BInsertarArticuloClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AgregarQuitarArticulo('I', EFArtDesde.Text, EFArtHasta.Text);
end;

procedure TFMAlmacenes.BEliminarArticuloClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AgregarQuitarArticulo('D', EFArtDesde.Text, EFArtHasta.Text);
end;

procedure TFMAlmacenes.BInsertarAgrupacionClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AgregarQuitarAgrupacion('I', EFAgrupDesde.Text, EFAgrupHasta.Text);
end;

procedure TFMAlmacenes.BEliminarAgrupacionClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AgregarQuitarAgrupacion('D', EFAgrupDesde.Text, EFAgrupHasta.Text);
end;

procedure TFMAlmacenes.BMaestroDeProductosClick(Sender: TObject);
begin
  inherited;
  DBTMaestroProcesado.Visible := True;
  LMaestroProcesado.Visible := True;
  //sfg.albert
  DMAlmacenes.GenerarMaestroProductos(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal,
     DMAlmacenes.QMAlmacenesALMACEN.AsString);
  DBTMaestroProcesado.Visible := False;
  LMaestroProcesado.Visible := False;
end;

procedure TFMAlmacenes.BBorrarMarcasMaestroProductosClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.BorrarMarcasMaestroProductos(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal,
     DMAlmacenes.QMAlmacenesALMACEN.AsString);
end;

procedure TFMAlmacenes.TSAlmacenInteligenteMECALUXShow(Sender: TObject);
begin
  inherited;
  TSAlmacenInteligenteMECALUX.Enabled := (DMAlmacenes.QMAlmacenesALMACEN_INTELIGENTE.AsInteger = 1);
end;

procedure TFMAlmacenes.DBEAlmacenChange(Sender: TObject);
begin
  inherited;
  TSAlmacenInteligenteMECALUX.Enabled := (DMAlmacenes.QMAlmacenesALMACEN_INTELIGENTE.AsInteger = 1);
end;

procedure TFMAlmacenes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if ((Sender as TPageControl).ActivePage = TSFicha) then
     DMAlmacenes.CerrarFicha;
  if ((Sender as TPageControl).ActivePage = TSArticulos) then
     DMAlmacenes.CerrarArticulos;
  if ((Sender as TPageControl).ActivePage = TSMovimientos) then
     DMAlmacenes.CerrarMovimientos;
  if Assigned(TSUbicaciones) and ((Sender as TPageControl).ActivePage = TSUbicaciones) then
     DMAlmacenes.CerrarUbicaciones;
  if ((Sender as TPageControl).ActivePage = TSStocks) then
     DMAlmacenes.CerrarStock;
end;

procedure TFMAlmacenes.TSFichaShow(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AbreFicha;
end;

procedure TFMAlmacenes.TSArticulosShow(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AbreArticulos;
end;

procedure TFMAlmacenes.TSMovimientosShow(Sender: TObject);
begin
  inherited;
  DMAlmacenes.FiltraAlmacenes(EFArtDesdeMovimiento.Text, EFArtHastaMovimiento.Text, StrToIntDef(EFEjerDesdeMovimiento.Text, 0),
     StrToIntDef(EFEjerHastaMovimiento.Text, 0), StrToIntDef(EFCanal.Text, 0), CBTipoMov.ItemIndex,
     DEFechaDesdeMovimientos.Date, DEFechaHastaMovimientos.Date, CBOrigenMovimientos.ItemIndex);
end;

procedure TFMAlmacenes.BLeerMovimientosClick(Sender: TObject);
begin
  inherited;
  DMAlmacenes.LeeEntradas(REntorno.Empresa, DMAlmacenes.QMAlmacenesALMACEN.AsString);
  DMAlmacenes.LeeSalidas(REntorno.Empresa, DMAlmacenes.QMAlmacenesALMACEN.AsString);
end;

procedure TFMAlmacenes.DBEAlmacenOrigenChange(Sender: TObject);
begin
  inherited;
  EAlmacenOrigen.Text := DameTituloAlmacen(DBEAlmacenOrigen.Text);
end;

procedure TFMAlmacenes.DBEAlmacenDestinoChange(Sender: TObject);
begin
  inherited;
  EAlmacenDestino.Text := DameTituloAlmacen(DBEAlmacenDestino.Text);
end;

procedure TFMAlmacenes.EFSerieMovimientoChange(Sender: TObject);
begin
  inherited;
  ESerieMovimiento.Text := DameTituloSerie(EFSerieMovimiento.Text);
end;

procedure TFMAlmacenes.EFUbicacionBusqueda(Sender: TObject);
begin
  inherited;
  if (Trim(EFUbicacion.Tabla_A_Buscar) = 'ART_ALMACENES_UBICACIONES') then
  begin
     EFUbicacion.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN = ''' +
        DBEAlmacenUbicaion.Text + '''';
  end;
end;

procedure TFMAlmacenes.EFUbicacionChange(Sender: TObject);
begin
  inherited;
  DMAlmacenes.PosicionaUbicacion(StrToIntDef(EFUbicacion.Text, 0));
  EFArticuloUbicaciones.Text := '';
end;

procedure TFMAlmacenes.AListadoExecute(Sender: TObject);
begin
  inherited;
  // AbreForm(TFPEControlUbicaciones, FPEControlUbicaciones);
end;

procedure TFMAlmacenes.TSUbicacionesShow(Sender: TObject);
begin
  inherited;
  DMAlmacenes.AbreUbicaciones;
end;

procedure TFMAlmacenes.EFArticuloUbicacionesChange(Sender: TObject);
begin
  inherited;
  DMAlmacenes.PosicionaArticuloUbicacion(EFArticuloUbicaciones.Text);
end;

procedure TFMAlmacenes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMAlmacenes.cbSoloElementosConStockChange(Sender: TObject);
begin
  inherited;
  DMAlmacenes.SoloElementosConStock := cbSoloElementosConStock.Checked;
end;

procedure TFMAlmacenes.AAcumulaStocksExecute(Sender: TObject);
begin
  DMAlmacenes.AcumulaStocks(DBEArticuloDStocks.Text, DBEArticuloHStocks.Text,
     DBEFamiliaDStocks.Text, DBEFamiliaHStocks.Text, StrToIntDef(DBECanalStocks.Text, 0));
end;

procedure TFMAlmacenes.TSStocksShow(Sender: TObject);
begin
  DMAlmacenes.AbreStocks;
end;

procedure TFMAlmacenes.AListadoDeStockExecute(Sender: TObject);
{var
  ListaCanales, ListaAlm : TStringList;}
begin
  inherited;
  DMAlmacenes.MostrarListado(0);

  (*
 AbreData(TDMRStockAlmacen, DMRStockAlmacen);

  with DMRStockAlmacen do
  begin
     ArtD := DBEArticuloDStocks.Text;
     ArtH := DBEArticuloHStocks.Text;
     FamD := DBEFamiliaDStocks.Text;
     FamH := DBEFamiliaHStocks.Text;
     Fecha := HourIntoDate(Date, '23:59:59');
     Tarifa := REntorno.TarifaDefecto;
     Almacen := DMAlmacenes.QMAlmacenesALMACEN.AsString;
     SinStock := True; // Mostrar los que no tienen stock
     SoloSinStock := False;
     TipoValor := 0; // PMP
     CambiaMoneda(REntorno.MonedaEmpresa); //Necesario para que abra la tabla xMonedas
  end;
  DMListados.DatosInforme(Date, '');

  ListaCanales := TStringList.Create;
  ListaAlm := TStringList.Create;
  try
     ListaCanales.Add(DBECanalStocks.Text);
     ListaAlm.Add(DMAlmacenes.QMAlmacenesALMACEN.AsString);
     DMRStockAlmacen.MostrarListado(ListaCanales, ListaAlm, StrToIntDef(DBECanalStocks.Text, 0), 0 {Modo}, 0 {Orden});
  finally
     ListaCanales.Free;
     ListaAlm.Free;
  end;
  CierraData(DMRStockAlmacen);
  *)
end;

procedure TFMAlmacenes.AConfListadoDeStockExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  {AbreData(TDMRStockAlmacen, DMRStockAlmacen);
  TFMListConfig.Create(Self).Muestra(25, Formato, Cabecera, Copias, Pijama, '',
     DMAlmacenes.frAlmStocks);
  CierraData(DMRStockAlmacen);}
  TFMListConfig.Create(Self).Muestra(5126, Formato, Cabecera, Copias, Pijama, '',
     DMAlmacenes.frAlmStocks);
end;

procedure TFMAlmacenes.AListadoDeStockFiltradoExecute(Sender: TObject);
begin
  DMAlmacenes.MostrarListado(0);
end;

procedure TFMAlmacenes.DBEFCtaInventarioChange(Sender: TObject);
begin
  inherited;
  ECtaInventario.Text := DameTituloCuenta(DBEFCtaInventario.Text);
end;

procedure TFMAlmacenes.DBEFCtaIngresosChange(Sender: TObject);
begin
  inherited;
  ECtaIngresos.Text := DameTituloCuenta(DBEFCtaIngresos.Text);
end;

procedure TFMAlmacenes.DBEFCtaGastosChange(Sender: TObject);
begin
  inherited;
  ECtaGastos.Text := DameTituloCuenta(DBEFCtaGastos.Text);
end;

procedure TFMAlmacenes.TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ExpandirCadenaCta(Sender);
end;

procedure TFMAlmacenes.ExpandirCadenaCta(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMAlmacenes.ARecalcularPreciosExecute(Sender: TObject);
begin
  inherited;
  DMAlmacenes.RecalcularPrecios;
end;

procedure TFMAlmacenes.APonderaArticulosExecute(Sender: TObject);
begin
  inherited;
  DMAlmacenes.PonderaArticulos;
end;

procedure TFMAlmacenes.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGStock, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGStock.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMAlmacenes.DBGStockDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (Column.FieldName = 'EXISTENCIAS') then
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        if (Column.Field.AsFloat < 0) then
           ColorError(Canvas)
        else
        if (Column.Field.AsFloat < DMAlmacenes.xStocksSTOCK_MINIMO.AsFloat) then
           ColorResaltado3(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAlmacenes.Ponderar;
begin
  DMAlmacenes.PonderaArticulos(True);
end;

procedure TFMAlmacenes.ActualizarPMP;
begin
  DMAlmacenes.ActualizarPMP(True);
end;

end.
