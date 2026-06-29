unit UFMPedidosAProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada, ActnList,
  UFormGest, Variants, DB, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000, ULFLabel, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, URecursos, HYFIBQuery,
  ULFDBDateEdit, ULFMemo, UFPEditDetalle, UG2kTBLoc;

type
  TFMPedidosAProveedor = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PCabNotas: TLFPanel;
     LPedido: TLFLabel;
     DBERIG: TLFDbedit;
     LEstado: TLFLabel;
     LFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LProveedor: TLFLabel;
     PEdNotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     DBEDtoPP: TLFDbedit;
     LDtoPP: TLFLabel;
     PTitNotas: TLFPanel;
     DBENotasFechaCab: TLFDbedit;
     LFechaNotas: TLFLabel;
     DBENotasProveedorTituloCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     DBEDtoCial: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LDtoCial: TLFLabel;
     EFAlmacen: TLFDBEditFind2000;
     ETituloAlmacen: TLFEdit;
     LAlmacen: TLFLabel;
     DBETituloProveedor: TLFDbedit;
     DBEFProveedor: TLFDBEditFind2000;
     ALPedidos: TLFActionList;
     AUnidades_Ext: TAction;
     APreciosTarifa: TAction;
     LBLFormaPago: TLFLabel;
     DBEFFormaPago: TLFDBEditFind2000;
     DBEFormaPago: TLFDbedit;
     AInfoStocks: TAction;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PPieGenerico: TLFPanel;
     LBaseImponible: TLFLabel;
     LCuotaIVAyRec: TLFLabel;
     LLiquido: TLFLabel;
     DBES_Bases: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBELiquido: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PPieComisiones: TLFPanel;
     LBaseDtoLineas: TLFLabel;
     LImportePie: TLFLabel;
     LImporteBase: TLFLabel;
     LImporteFinanciacion: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBESumaBases: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     TSep8: TToolButton;
     TButtArtTarifa: TToolButton;
     TButtUnidades_Ext: TToolButton;
     TButtInfoStocks: TToolButton;
     TSep2: TToolButton;
     TButtImprimeListado: TToolButton;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtAbreCierra: TToolButton;
     TButtNotas: TToolButton;
     ANotasDetalle: TAction;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     DBETituloEstado: TLFDbedit;
     TButtInfoHistorico: TToolButton;
     AInfoHistorico: TAction;
     TButtPrecios: TToolButton;
     ANewProveedor: TAction;
     ANewArticulo: TAction;
     AAProveedor: TAction;
     AArticulo: TAction;
     SBAProveedor: TSpeedButton;
     AImprime: TAction;
     MISepEnlaces: TMenuItem;
     MIVerDatosProveedor: TMenuItem;
     LFechaEntregaKri: TLFLabel;
     TBArtProv: TToolButton;
     ToolButton2: TToolButton;
     AArticuloProv: TAction;
     LBLReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     TBVerPedidosAProveedorKri: TToolButton;
     TBVerPedidosDeArticuloKri: TToolButton;
     TBVerArticulosPorTarifaKri: TToolButton;
     TBVerHistoricoDeCostesKri: TToolButton;
     TBVerCodigoProveedor: TToolButton;
     AVerPedidosAProveedor: TAction;
     AVerPedidosDeArticulo: TAction;
     AVerArticulosPorTarifa: TAction;
     AVerHistoricoDeCostesKri: TAction;
     AVerCodigoProveedorKri: TAction;
     DBENotasSuReferenciaCab: TLFDbedit;
     LBLReferenciaNotas: TLFLabel;
     AInformePedido: TAction;
     AVisualizarPedidosFiltrados: TAction;
     AImprimirPedidosFiltrados: TAction;
     ASep: TAction;
     AResumenPedidos: TAction;
     AResumenPedidosFiltrados: TAction;
     AImprimirResumenPedidosFiltrados: TAction;
     AVisualizaPedMail: TAction;
     AEnviarPedidoEMail: TAction;
     ASep2: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfListadoPedidos: TAction;
     AConfListadoResumen: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AAbrirCerrar: TAction;
     ASep3: TAction;
     AListaPedido: TLFNoSaveAction;
     ADuplicar: TAction;
     ARegenerar: TAction;
     AAnulaDocumento: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AHerencia: TAction;
     LFCategoryAction4: TLFCategoryAction;
     LFCategoryAction5: TLFCategoryAction;
     AEnviarPedidoMailPdf: TAction;
     ANIFPedidos: TAction;
     AInformePedido2: TAction;
     ALstCodigoBarras: TAction;
     TBDesServir: TToolButton;
     ADesServir: TAction;
     AOrdenaLineas: TAction;
     APedidosMulti: TAction;
     ASep1: TAction;
     TButtHerencia: TToolButton;
     DBDEFechaConfirmadaKri: TLFDBDateEdit;
     LFechaConfirmadaKri: TLFLabel;
     DBDEPlazoInicialKri: TLFDBDateEdit;
     LPlazoInicialKri: TLFLabel;
     DBDEPlazoConfirmadoKri: TLFDBDateEdit;
     LPlazoConfirmadoKri: TLFLabel;
     LTransportistaKri: TLFLabel;
     DBEFTransportistaKri: TLFDBEditFind2000;
     ETransportistaKri: TLFEdit;
     BTransportistaNormalKri: TButton;
     BTransportistaRapidoKri: TButton;
     ABuscarArticulo: TAction;
     ToolButton1: TToolButton;
     TButtBuscarArticulo: TToolButton;
     AEnviarPedidoMailPDF2: TAction;
     ABuscaNIFKRI: TAction;
     TButtBuscarNIFKRI: TToolButton;
     EFBuscaNIFKRI: TLFEditFind2000;
     DBCBNoTraspasarLineasKri: TLFDBCheckBox;
     AAAlbaran: TAction;
     AAFactura: TAction;
     DBCBNoSuperarMaxImportePEPKri: TLFDBCheckBox;
     AInformePedido3: TAction;
     LFCategoryAction6: TLFCategoryAction;
     AAdjuntosPedido: TAction;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     AAdjuntosTransportista: TAction;
     LIdOrden: TLFLabel;
     DBEFIdOrden: TLFDBEditFind2000;
     LFase: TLFLabel;
     DBEFFase: TLFDBEditFind2000;
     DBETituloFase: TLFDbedit;
     SBAOrden: TSpeedButton;
     AOrden: TAction;
     LFechaPrevista: TLFLabel;
     LFechaRecepcion: TLFLabel;
     AConfListadoCodigoBarras: TAction;
     ACrearNuevoPedidoPendientes: TAction;
     LCreaPedidoPendientes: TLFLabel;
     DBESumUnidades: TLFDbedit;
     LBLUnidades: TLFLabel;
     LTelefono: TLFLabel;
     TButtCondicionesCompra: TToolButton;
     ACondicionesCompra: TAction;
     DBCHKListado: TLFDBCheckBox;
     DBDTPFecha_Pre: TLFDBDateEdit;
     DBDTPFecha_Rec: TLFDBDateEdit;
     AListarEtiquetas: TAction;
     AConfListadoMaterialesProduccion: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     AImportaVentasDeposito: TAction;
     AAFacturaSoloIVA: TAction;
     DBCBValorado: TLFDBCheckBox;
     ATarifasProveedor: TAction;
     TSOtros: TTabSheet;
     PNLCabOtros: TLFPanel;
     PNLTitOtros: TLFPanel;
     LBLFechaOtros: TLFLabel;
     LBLRefOtros: TLFLabel;
     DBEOtrosFechaCab: TLFDbedit;
     DBEOtrosClienteTituloCab: TLFDbedit;
     DBEOtrosRIGCab: TLFDbedit;
     DBEOtrosSuReferenciaCab: TLFDbedit;
     NavOtros: THYMNavigator;
     PNLEdOtros: TLFPanel;
     DBETitProyecto: TLFDbedit;
     EFProyecto: TLFDBEditFind2000;
     DBEValorCambio: TLFDbedit;
     DBCHKCambio: TLFDBCheckBox;
     LBLProyecto: TLFLabel;
     LValorCambio: TLFLabel;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     ETitMoneda: TLFEdit;
     LPorFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     CEOtros: TControlEdit;
     CEOtrosPMEdit: TPopUpTeclas;
     CEOtrosMifirst: TMenuItem;
     CEOtrosMiprior: TMenuItem;
     CEOtrosMiNext: TMenuItem;
     CEOtrosMiLast: TMenuItem;
     CEOtrosMiInsert: TMenuItem;
     CEOtrosMiDelete: TMenuItem;
     CEOtrosMiEdit: TMenuItem;
     CEOtrosMipost: TMenuItem;
     CEOtrosMiCancel: TMenuItem;
     CEOtrosMiRefresh: TMenuItem;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     TButtImportarDetalle: TToolButton;
     AImportarDetalle: TAction;
     AAsignacionCodigoBarra: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     LEmail: TLFLabel;
     RelojEmail: TTimer;
     DBEFPortes: TLFDBEditFind2000;
     ETituloPortes: TLFEdit;
     LTipoPorte: TLFLabel;
     DBEImporteMinimoPorte: TLFDbedit;
     DBEPorPortes: TLFDbedit;
     DBEIPORTES: TLFDbedit;
     LPorPortes: TLFLabel;
     LIPortes: TLFLabel;
     LImporteMinimoPorte: TLFLabel;
     ACrearHerenciaManual: TAction;
     DBECuotaImpuestoAdic: TLFDbedit;
     AListarEtiquetasProcedencia: TAction;
     AConfEtiquetaProcedencia: TAction;
     TSDirEntrega: TTabSheet;
     PNLDirEntrega: TLFPanel;
     PNLDirEntrega2: TLFPanel;
     LDirEntregaFecha: TLFLabel;
     LDirEntregaReferencia: TLFLabel;
     DBEDirEntregaFecha: TLFDbedit;
     DBEDirEntregaNombre: TLFDbedit;
     DBEDirEntregaRIG: TLFDbedit;
     DBEDirEntregaReferencia: TLFDbedit;
     NavDirEntrega: THYMNavigator;
     PNLEdDirEntrega: TLFPanel;
     DBMDirEntrega: TLFDBMemo;
     ACategoryFiltros: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFiltroAbierto: TAction;
     AFiltroAnulado: TAction;
     AFiltroCerrado: TAction;
     LDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     DBCBAceptaEntregaParcial: TLFDBCheckBox;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     ABorradoMasivoLineas: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     EIdioma: TLFEdit;
     AExportacionEuropastry: TAction;
     AInformePedido4: TAction;
     DBCBPedidoRecibido: TLFDBCheckBox;
     DBEObservaciones: TLFDbedit;
     LObservaciones: TLFLabel;
     LProyectoFicha: TLFLabel;
     DBEFProyectoFicha: TLFDBEditFind2000;
     DBEProyectoFicha: TLFDbedit;
     PNLPieUnidades: TLFPanel;
     DBESumUdsLog: TLFDbedit;
     DBESumUdsSec: TLFDbedit;
     PNLPieInfo: TLFPanel;
     PNLInfoImportes: TLFPanel;
     LCantLineas: TLFLabel;
     DBECantLineas: TLFDbedit;
     LSumaPeso: TLFLabel;
     DBESumaPeso: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EFDireccionBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure TButtAbrePedidoClick(Sender: TObject);
     procedure TButtCierraPedidoClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSerieChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure AUnidades_ExtExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure AInfoHistoricoExecute(Sender: TObject);
     procedure APreciosTarifaExecute(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewProveedorExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAProveedorExecute(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure DBETituloProveedorEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure AArticuloProvExecute(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure AVerPedidosAProveedorExecute(Sender: TObject);
     procedure AVerPedidosDeArticuloExecute(Sender: TObject);
     procedure AVerArticulosPorTarifaExecute(Sender: TObject);
     procedure AVerHistoricoDeCostesKriExecute(Sender: TObject);
     procedure AVerCodigoProveedorKriExecute(Sender: TObject);
     procedure AInformePedidoExecute(Sender: TObject);
     procedure AVisualizarPedidosFiltradosExecute(Sender: TObject);
     procedure AImprimirPedidosFiltradosExecute(Sender: TObject);
     procedure AResumenPedidosExecute(Sender: TObject);
     procedure AResumenPedidosFiltradosExecute(Sender: TObject);
     procedure AImprimirResumenPedidosFiltradosExecute(Sender: TObject);
     procedure AVisualizaPedMailExecute(Sender: TObject);
     procedure AEnviarPedidoEMailExecute(Sender: TObject);
     procedure AConfListadoPedidosExecute(Sender: TObject);
     procedure AConfListadoResumenExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure AListaPedidoExecute(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ARegenerarExecute(Sender: TObject);
     procedure AAnulaDocumentoExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AEnviarPedidoMailPdfExecute(Sender: TObject);
     procedure ANIFPedidosExecute(Sender: TObject);
     procedure ALstCodigoBarrasExecute(Sender: TObject);
     procedure ADesServirExecute(Sender: TObject);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure APedidosMultiExecute(Sender: TObject);
     procedure DBDTPFechaExit(Sender: TObject);
     procedure DBEFTransportistaKriChange(Sender: TObject);
     procedure BTransportistaNormalKriClick(Sender: TObject);
     procedure BTransportistaRapidoKriClick(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure AAFacturaExecute(Sender: TObject);
     procedure AAAlbaranExecute(Sender: TObject);
     procedure AAdjuntosPedidoExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AAdjuntosTransportistaExecute(Sender: TObject);
     procedure AEnviarPedidoMailPDF2Execute(Sender: TObject);
     procedure DBEFIdOrdenExit(Sender: TObject);
     procedure DBEFFaseBusqueda(Sender: TObject);
     procedure AOrdenExecute(Sender: TObject);
     procedure AConfListadoCodigoBarrasExecute(Sender: TObject);
     procedure ACrearNuevoPedidoPendientesExecute(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBEFProveedorExiste(Sender: TObject);
     procedure ACondicionesCompraExecute(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure AConfListadoMaterialesProduccionExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure AImportaVentasDepositoExecute(Sender: TObject);
     procedure AAFacturaSoloIVAExecute(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure ATarifasProveedorExecute(Sender: TObject);
     procedure LBNotasClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure DBERIGChange(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure AAsignacionCodigoBarraExecute(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearHerenciaManualExecute(Sender: TObject);
     procedure AListarEtiquetasProcedenciaExecute(Sender: TObject);
     procedure AConfEtiquetaProcedenciaExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroAnuladoExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure AExportacionEuropastryExecute(Sender: TObject);
  private
     { Private declarations }
     param_PEPINSE001: boolean;
     Param_COMTIVA001: boolean;
     Param_ARTBUSQ004: boolean;
     Param_PEPUPEP001: boolean;
     ColActual: TColumn;
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     Buscando: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     DBGDetalleArticulo: string;
     procedure MuestraFiltrado(Tipo: byte);
     procedure HabilitaEnlaces;
     procedure HabilitaBotones;
     procedure AbreOCierra;
     {procedure HabilitaBotonesDetalle; dji lrk kri - TyC}
     {function EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint; Se define en UUtiles}
     procedure EstableceVisibilidadStockAlmacen;
     procedure RefrescaAvisos;
  public
     { Public declarations }
     SWCerrar, FiltroListadoFiltrado: integer;
     Editando: boolean;
     procedure HabilitaBotonesDetalle; {TyC}
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraPendiente(FiltroAccion: string);
     procedure FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
  end;

var
  FMPedidosAProveedor : TFMPedidosAProveedor;

procedure TraspasoPedidoProv(id_e: integer);

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UDMPedidosAProveedor, UDMLstPedidos_Prov,
  UDMLstEntrefechas, UDMLstPedidosaprov, UFMLSTEntrefechas, UFMListConfig,
  UFMArticulosTarifa, UFMDocInfoStocks, UFCHerenciaProv,
  UFMVerPedidosAProveedorKri, UFMVerPedidosDeArticuloKri, UFMVerArticulosPorTarifaKri,
  UFMVerHistoricoDeCosteKri, UFMVerCodigoProveedorKri, UDMLstCBDocs, UFPregEtiVacias,
  UFMNotasCampo, UFMain, UFMProveedores, UFVerTercerosPorArticulo,
  UFSendCorreo, UDMListados, UFPregNIFFACTURA, UFMTraspasoMultiCanal, UFMAdjunto,
  UFMCondicionesCompra, UFMImprimirCodBarras, UFMImportaVentasDeposito, UParam,
  UFMSeleccion, UFMInsercionArticuloDesdeTexto,
  {$IFNDEF TPV}UFMAsignacionCodigoBarra {$ENDIF}, UFMHerenciaManual,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMSeleccionArticulo, UFMProcesosMasivosLineas, URellenaLista;

{$R *.DFM}

procedure TFMPedidosAProveedor.FormCreate(Sender: TObject);
var
  i : integer;
  col : TColumn;
begin
  DragAcceptFiles(Self.Handle, True);
  MTelefonos := TLFMemo.Create(Self);
  with MTelefonos do
  begin
     Visible := False;
     Parent := Self;
     BorderStyle := bsNone;
     Color := clInfoBk;
     ReadOnly := True;
     WordWrap := False;
  end;

  MNotas := TLFMemo.Create(Self);
  with MNotas do
  begin
     Visible := False;
     Parent := Self;
     BorderStyle := bsNone;
     Color := clInfoBk;
     ReadOnly := True;
     WordWrap := False;
  end;

  inherited;
  BuscarArticulos := False;
  Buscando := False;
  PDetalleAlturaMinima := 200;

  // Obtengo configuracion de navegadores inicial. Luego se modificaran segun restriccion de documento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT BOTONES FROM DIC_NAVEGADORES WHERE FORMULARIO = ?FORMULARIO AND NAVEGADOR = ?NAVEGADOR AND PERFIL = ?PERFIL';
        try
           Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
           Params.ByName['NAVEGADOR'].AsString := UpperCase(NavMain.Name);
           Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
           ExecQuery;
           BotonesNavMain := FieldByName['BOTONES'].AsString;
        except
           BotonesNavMain := '';
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT BOTONES FROM DIC_NAVEGADORES WHERE FORMULARIO = ?FORMULARIO AND NAVEGADOR = ?NAVEGADOR AND PERFIL = ?PERFIL';
        try
           Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
           Params.ByName['NAVEGADOR'].AsString := UpperCase(NavDetalle.Name);
           Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
           ExecQuery;
           BotonesNavDetalle := FieldByName['BOTONES'].AsString;
        except
           BotonesNavDetalle := '';
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Trim(BotonesNavMain) <> '') then
  begin
     // Si existe, modifico los botones visibles
     with NavMain do
     begin
        VisibleButtons := [];
        if (BotonesNavMain[1] = 'F') then
           VisibleButtons := VisibleButtons + [nbFirst];
        if (BotonesNavMain[2] = 'P') then
           VisibleButtons := VisibleButtons + [nbPrior];
        if (BotonesNavMain[3] = 'N') then
           VisibleButtons := VisibleButtons + [nbNext];
        if (BotonesNavMain[4] = 'L') then
           VisibleButtons := VisibleButtons + [nbLast];
        if (BotonesNavMain[5] = 'I') then
           VisibleButtons := VisibleButtons + [nbInsert];
        if (BotonesNavMain[6] = 'D') then
           VisibleButtons := VisibleButtons + [nbDelete];
        if (BotonesNavMain[7] = 'E') then
           VisibleButtons := VisibleButtons + [nbEdit];
        if (BotonesNavMain[8] = 'P') then
           VisibleButtons := VisibleButtons + [nbPost];
        if (BotonesNavMain[9] = 'C') then
           VisibleButtons := VisibleButtons + [nbCancel];
        if (BotonesNavMain[10] = 'R') then
           VisibleButtons := VisibleButtons + [nbRefresh];
     end;
  end;

  if (Trim(BotonesNavDetalle) <> '') then
  begin
     // Si existe, modifico los botones visibles
     with NavDetalle do
     begin
        VisibleButtons := [];
        if (BotonesNavDetalle[1] = 'F') then
           VisibleButtons := VisibleButtons + [nbFirst];
        if (BotonesNavDetalle[2] = 'P') then
           VisibleButtons := VisibleButtons + [nbPrior];
        if (BotonesNavDetalle[3] = 'N') then
           VisibleButtons := VisibleButtons + [nbNext];
        if (BotonesNavDetalle[4] = 'L') then
           VisibleButtons := VisibleButtons + [nbLast];
        if (BotonesNavDetalle[5] = 'I') then
           VisibleButtons := VisibleButtons + [nbInsert];
        if (BotonesNavDetalle[6] = 'D') then
           VisibleButtons := VisibleButtons + [nbDelete];
        if (BotonesNavDetalle[7] = 'E') then
           VisibleButtons := VisibleButtons + [nbEdit];
        if (BotonesNavDetalle[8] = 'P') then
           VisibleButtons := VisibleButtons + [nbPost];
        if (BotonesNavDetalle[9] = 'C') then
           VisibleButtons := VisibleButtons + [nbCancel];
        if (BotonesNavDetalle[10] = 'R') then
           VisibleButtons := VisibleButtons + [nbRefresh];
     end;
  end;

  {inherited; dji lrk kri - para que funcione el Help con TyC - ver.446}
  AbreData(TDMPedidosAProveedor, DMPedidosAProveedor);

  NavMAin.DataSource := DMPedidosAProveedor.DSCabecera;
  DBGMain.DataSource := DMPedidosAProveedor.DSCabecera;
  NavDetalle.DataSource := DMPedidosAProveedor.DSDetalle;
  DBGFDetalle.DataSource := DMPedidosAProveedor.DSDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMPedidosAProveedor.DSCabecera;
     Entorno := DMPedidosAProveedor.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
  end;

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;

  if REntorno.SerieRestringida <> '' then
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  FiltroListadoFiltrado := 0;
  SWCerrar := 0;

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  if ((LeeParametro('ARTBUSQ001') <> 'ARTICULO') and (LeeParametro('ARTBUSQ001') <> '')) then
  begin
     for i := 0 to DBGFDetalle.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle.CamposDesplegar[i] = '1') then
        begin
           DBGFDetalle.Numericos[i] := LeeParametro('ARTBUSQ001');
           DBGFDetalle.CamposADevolver[i] := 'ARTICULO';
           DBGFDetalle.OrdenadosPor[i] := LeeParametro('ARTBUSQ001');
        end;
     end;
  end;

  // Utilizar cambio inversio en cambio fijo de documentos.
  // Se establece el cambio (factor) de la moneda de la empresa al del documento. (S/N)
  if (LeeParametro('MONCAMB001') = 'S') then
  begin
     DBTValorCambioFijo.DataField := 'VALOR_CAMB_FIJO_INV';
     DBEValorCambio.DataField := 'VALOR_CAMB_FIJO_INV';
  end;

  if REntorno.VerSoloArticulosDisponibles then
  begin
     for i := 0 to DBGFDetalle.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle.CamposDesplegar[i] = '1') then
           DBGFDetalle.Tablas[i] := 'VER_ARTICULOS_EF_COMPRAS';
     end;
  end;

  HabilitaEnlaces;
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  RefrescaAvisos;
  Editando := False;

  if (DMMain.EstadoKri(152) <> 1) then
     AEnviarPedidoMailPdf.Visible := False;

  // Pone los nombres de los listados
  AInformePedido.Caption := DameTituloListadoDefectoGrupo(40);
  AInformePedido2.Caption := DameTituloListadoDefectoGrupo(2001);
  AInformePedido3.Caption := DameTituloListadoDefectoGrupo(2004);
  AInformePedido4.Caption := DameTituloListadoDefectoGrupo(660);

  ColActual := DBGFDetalle.Columns[0];

  // Iberfluid - Restringir sup. importe maximo
  if (DMMain.EstadoKri(208) = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT RESTRINGIR_IMPORTE_MAX_PEP FROM SYS_USUARIOS WHERE USUARIO=' + IntToStr(REntorno.Usuario);
           ExecQuery;
           DBCBNoSuperarMaxImportePEPKri.Enabled := FieldByName['RESTRINGIR_IMPORTE_MAX_PEP'].AsInteger = 0;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     DBCBNoSuperarMaxImportePEPKri.Visible := False;

  {dji lrk kri - Elimino las acciones para ver adjuntos}
  if (DMMain.EstadoKri(242) <> 1) then
  begin
     for i := Self.ComponentCount - 1 downto 0 do
     begin
        if (Self.Components[i] is TAction) then
        begin
           if TAction(Self.Components[i]).Category = 'Adjuntos' then
              TAction(Self.Components[i]).Free;
        end
        else
        begin
           if (Components[i] is TLFCategoryAction) then
              if TLFCategoryAction(Self.Components[i]).Category = 'Adjuntos' then
                 TLFCategoryAction(Self.Components[i]).Free;
        end;
     end;
  end;

  if (DMMain.EstadoKri(258) = 1) then
     ANIFPedidos.Enabled := False;

  if (DMMain.EstadoKri(264) <> 1) then {Habilita el envío de email con pdf a traves del cliente windows}
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarPedidoMailPDF2) then
           ALMain.Actions[i].Free;

  AImportaVentasDeposito.Visible := (DMMain.EstadoKri(61) = 1);
  AAFacturaSoloIVA.Visible := (DMMain.EstadoKri(62) = 1);

  LFase.Visible := False;
  DBEFFase.Visible := False;
  DBETituloFase.Visible := False;

  with DBGFDetalle do
  begin
     i := Tablas.IndexOf('ART_ARTICULOS_CODPROV');
     if (i >= 0) then
     begin
        if (DMMain.EstadoKri(46) = 1) then
           CamposDesplegar[i] := '1'
        else
           CamposDesplegar[i] := '0';
     end;
  end;

  if (StrToIntDef(LeeParametro('SYSCONF005'), 0) = 0) then
  begin
     col := DBGFDetalle.FindColumn('TIPO_UNIDAD_LOGISTICA');
     if Assigned(col) then
        col.Visible := False;
     col := DBGFDetalle.FindColumn('UNIDADES_LOGISTICAS');
     if Assigned(col) then
        col.Visible := False;
     col := DBGFDetalle.FindColumn('TITULO_UNIDAD_LOGISTICA');
     if Assigned(col) then
        col.Visible := False;
  end;

  if (DMMain.EstadoKri(47) = 1) then
  begin
     col := DBGFDetalle.FindColumn('UNIDADES_LOGISTICAS');
     if Assigned(col) then
        col.Title.Caption := _('Bultos');
     col := DBGFDetalle.FindColumn('UNIDADES');
     if Assigned(col) then
        col.Title.Caption := _('Kilos');
  end;

  // Color campo ID
  ColorCampoID(DBERIG);
  ColorCampoID(EFSERIE);

  // Muestra tabla por defecto
  if (LeeParametro('DOCCONF001') = 'S') then
     PCMain.ActivePage := TSTabla;

  TSDirEntrega.TabVisible := (LeeParametro('COMDIRM001') = 'S');

  with DBGMain do
  begin
     i := CamposAMarcar.IndexOf('MODIFICA_DOC');
     if (i >= 0) and (CamposChecked.Count >= i - 1) then
        CamposChecked[i] := '128';
  end;

  AbreOCierra;
end;

procedure TFMPedidosAProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if SWCerrar = 1 then
     FMArticulosTarifa.Close;
end;

procedure TFMPedidosAProveedor.FormDestroy(Sender: TObject);
begin
  inherited;
  MTelefonos.Free;
  MNotas.Free;
  CierraData(DMPedidosAProveedor);
end;

procedure TFMPedidosAProveedor.FormShow(Sender: TObject);
var
  i : smallint;
begin
  HabilitaBotones;

  // Forzamos un primer refresco para que el navegador cambie si el usuario tiene documentos restringidos.
  NavMainClickAfterAdjust(Sender, nbRefresh);

  // sfg.albert
  // Es mira si està marcat el check de 'Utilizar OF en Pedidos a Proveedores'
  // Si està desmarcat, és posen a NO visible els component de OF i fase
  if (not (DMMain.DameConstanteProduccion('GEST_OF_PED_PROV') = 1)) then
  begin
     LIdOrden.Visible := False;
     DBEFIdOrden.Visible := False;
     LFase.Visible := False;
     DBEFFase.Visible := False;
     DBETituloFase.Visible := False;
  end
  else
  begin
     LIdOrden.Visible := True;
     DBEFIdOrden.Visible := True;
     LFase.Visible := True;
     DBEFFase.Visible := True;
     DBETituloFase.Visible := True;
  end;

  //Cambia titulos de label de fecha - Iberfluid
  if (DMMain.EstadoKri(203) = 1) then
  begin
     LFecha.Caption := _('Fecha Pedido');
     LFechaPrevista.Caption := _('Fecha Requerida');
     LFechaConfirmadaKri.Caption := _('Fecha Confirmada');
     if (EncuentraField(DBGFDetalle, 'FECHA_PRE_DET') >= 0) then
        DBGFDetalle.FindColumn('FECHA_PRE_DET').Title.Caption := _('Fec. Requerida');
     if (EncuentraField(DBGFDetalle, 'FECHA_CONF_KRI') >= 0) then
        DBGFDetalle.FindColumn('FECHA_CONF_KRI').Title.Caption := _('Fec. Confirmada');
     if (EncuentraField(DBGFDetalle, 'PLAZO_CONFIRM_KRI') >= 0) then
        DBGFDetalle.FindColumn('PLAZO_CONFIRM_KRI').Title.Caption := _('Plazo Conf.');

     // Hago algunos campos accesibles
     DBDTPFecha_Rec.Enabled := True;
     DBDTPFecha_Rec.Color := clWindow;
     DBDTPFecha_Rec.Font.Color := clWindowText;
     DBDTPFecha_Rec.ReadOnly := False;
  end;

  i := EncuentraField(DBGFDetalle, 'UNIDADES');
  if (i < 0) then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'UNIDADES';
        Title.Caption := _('Unidades');
        Width := 60;
     end;
  end;
  i := EncuentraField(DBGFDetalle, 'UNIDADES');
  if (LeeParametro('COMUNID001', EFSerie.Text) <> '') then
     DBGFDetalle.FindColumn('UNIDADES').Title.Caption := LeeParametro('COMUNID001', EFSerie.Text);

  i := EncuentraField(DBGFDetalle, 'UNIDADES_SEC');
  if (i < 0) then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'UNIDADES_SEC';
        Title.Caption := _('Uds. Sec.');
        Width := 50;
     end;
  end;
  i := EncuentraField(DBGFDetalle, 'UNIDADES_SEC');
  // DBGFDetalle.Columns.Items[i].Visible := REntorno.PVP_Ud_Sec;
  if (LeeParametro('COMUSEC002', EFSerie.Text) <> '') then
     DBGFDetalle.FindColumn('UNIDADES_SEC').Title.Caption := LeeParametro('COMUSEC002', EFSerie.Text);

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
  begin
     if (EncuentraField(DBGFDetalle, Format('ALFA_%d', [i])) >= 0) then
        DBGFDetalle.FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMPedidosAProveedor.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_COMPRAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
        {
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'ARTICULO';
           if (DMMain.EstadoKri(42) = 1) then
              OrdenadosPor[i] := 'TITULO';
        end;
        }
        if (FMain.AArticulos.Enabled = True) then
           Accion := ANewArticulo;
     end
     else
     if Trim(TablaABuscar) = 'SYS_TIPO_IVA' then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IVA') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMPedidosAProveedor.QMDetalleTIPO_IVA.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL' then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMPedidosAProveedor.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if Trim(TablaABuscar) = 'ART_ARTICULOS_CODPROV' then
     begin
        CondicionBusqueda :=
           'PROVEEDOR =' + IntToStr(DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger) +
           ' AND EMPRESA = ' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end
     else
     if Trim(TablaABuscar) = 'EMP_PROYECTOS' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROYECTO';
     end
     else
     if Trim(TablaABuscar) = 'ART_ALMACENES' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ACTIVO = 1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ALMACEN';
     end
     else
     if Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(ARTICULO=''' + DMPedidosAProveedor.QMDetalleARTICULO.AsString + ''')';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO,TIPO';
     end
     else
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_CON_BARRAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'BAJA=0';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'BARRAS';
     end
     else
     begin
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMPedidosAProveedor.EFDireccionBusqueda(Sender: TObject);
begin
  //  EFDireccion.CondicionBusqueda:='TERCERO='+DMDocsPedidoAProv.QMCabeceraTERCERO.AsString;
end;

procedure TFMPedidosAProveedor.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPedidosAProveedor.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMPedidosAProveedor.TButtAbrePedidoClick(Sender: TObject);
begin
  DMPedidosAProveedor.DesbloqueaPedido;
end;

procedure TFMPedidosAProveedor.TButtCierraPedidoClick(Sender: TObject);
begin
  DMPedidosAProveedor.BloqueaPedido;
end;

procedure TFMPedidosAProveedor.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  Resultado := DMPedidosAProveedor.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;
  Continua := False;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.MuestraFiltrado(Tipo: byte);
begin
  if (Tipo = 0) or (Tipo = 1) then
  begin
     AbreData(TDMLstPedidosaprov, DMLstPedidosaprov);
     DMLstPedidosaprov.MostrarListadoFiltrado(Tipo, FiltroListadoFiltrado, EFSerie.Text, DMPedidosAProveedor.QMCabecera.SelectSQL);
     CierraData(DMLstPedidosaprov);
  end;
  if (Tipo = 2) or (Tipo = 3) then
  begin
     AbreData(TDMLstPedidos_prov, DMLstPedidos_prov);
     DMLstPedidos_prov.MostrarListadoFiltrado(Tipo - 2, FiltroListadoFiltrado, EFSerie.Text, DMPedidosAProveedor.QMCabecera.SelectSQL);
     CierraData(DMLstPedidos_prov);
  end;
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
  i : integer;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMPedidosAProveedor.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  // Edicion de IVA habilitada en documentos de venta
  Param_COMTIVA001 := (LeeParametro('COMTIVA001', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');

  param_PEPINSE001 := (LeeParametro('PEPINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_PEPINSE001;
  DBERIG.ReadOnly := not param_PEPINSE001;

  Param_PEPUPEP001 := (LeeParametro('PEPUPEP001', EFSerie.Text) = 'S');
  i := EncuentraField(DBGFDetalle, 'PEDIDOS_A_PROV');
  if (i >= 0) then
  begin
     with DBGFDetalle.Columns[i] do
     begin
        Visible := Param_PEPUPEP001;
        Title.Caption := _('Ped. Prov.');
        ReadOnly := True;
        Color := clInfoBk;
     end;
  end
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'PEDIDOS_A_PROV';
        Title.Caption := _('Ped. Prov.');
        Visible := Param_PEPUPEP001;
        ReadOnly := True;
        Color := clInfoBk;
     end;
  end;

  EstableceVisibilidadStockAlmacen;
  HabilitaBotones;
end;

procedure TFMPedidosAProveedor.FormActivate(Sender: TObject);
begin
  inherited;
  EstableceVisibilidadStockAlmacen;
end;

procedure TFMPedidosAProveedor.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (Editando) then
     DMPedidosAProveedor.RefrescaTabla;
end;

procedure TFMPedidosAProveedor.AUnidades_ExtExecute(Sender: TObject);
begin
  if DBGFDetalle.SelectedField.DisplayName = 'UNIDADES' then
     DBGFDetalle.SelectedIndex := DBGFDetalle.SelectedIndex + 1;

  DMPedidosAProveedor.CambiaUnidadesExt(DMPedidosAProveedor.QMDetalleARTICULO, True);
end;

procedure TFMPedidosAProveedor.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     DMPedidosAProveedor.BorraLineaExt;

  if Button = nbDelete then
     DMPedidosAProveedor.ControlaRestriccion;

  if Button in [nbRefresh, nbDelete, nbPost] then
     DMPedidosAProveedor.ReiniciaStock(DMPedidosAProveedor.QMDetalleARTICULO.AsString);
end;

procedure TFMPedidosAProveedor.AInfoStocksExecute(Sender: TObject);
var
  Almacen, Articulo : string;
begin
  DMPedidosAProveedor.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMPedidosAProveedor.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;

  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
  begin
     DBGDetalleArticulo := '';
     FMain.AddComponentePunto(DBGFDetalle);
  end
  else
     FMain.DelComponentePunto(DBGFDetalle);

  if ((DBGFDetalle.ColumnaActual = 'TIPO_IVA') or
     (DBGFDetalle.ColumnaActual = 'PROYECTO')) then
     DBGFDetalle.BuscarNums := False
  else
     DBGFDetalle.BuscarNums := True;
end;

procedure TFMPedidosAProveedor.ANotasDetalleExecute(Sender: TObject);
begin
  DMPedidosAProveedor.PreparaNotasDetalle;
  EditarCampoNotas(Self, DMPedidosAProveedor.DSDetalle, DMPedidosAProveedor.QMDetalleNOTAS, DMPedidosAProveedor.QMDetalleNOTAS2, (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMPedidosAProveedor.AInfoHistoricoExecute(Sender: TObject);
begin
  DMPedidosAProveedor.Historico;
end;

procedure TFMPedidosAProveedor.APreciosTarifaExecute(Sender: TObject);
begin
  DMPedidosAProveedor.CambiaPreciosTarifa;
end;

procedure TFMPedidosAProveedor.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
  DMPedidosAProveedor.MascarasMoneda;
  if ((Assigned(DBEFMoneda.Field)) and (DBEFMoneda.Text <> '')) then
  begin
     if (DBEFMoneda.Text <> REntorno.Moneda) then
     begin
        ColorResaltado3(DBEFMoneda);
        ColorResaltado3(DBEFMonedaFicha);
        HazVisibleCambioFijo((DBEFMoneda.Text <> REntorno.Moneda));
     end
     else
     begin
        ColorEdicion(DBEFMoneda);
        ColorEdicion(DBEFMonedaFicha);
        HazVisibleCambioFijo(False);
     end;
  end;
end;

procedure TFMPedidosAProveedor.ANewProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AProveedores);

     if FMain.EnlaceDatos <> Null then
     begin
        DBEFProveedor.SetBufferText(FMain.EnlaceDatos);
     end;
     EFAlmacen.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMPedidosAProveedor.ANewArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AArticulos);
     if FMain.EnlaceDatos <> Null then
     begin
        DMPedidosAProveedor.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMPedidosAProveedor.AAProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFProveedor.Text <> '' then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DBEFProveedor.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMPedidosAProveedor.SBAProveedorDblClick(Sender: TObject);
begin
  AAProveedor.Execute;
end;

procedure TFMPedidosAProveedor.HabilitaEnlaces;
begin
  if (FMain.AProveedores.Enabled = False) then
  begin
     DBEFProveedor.Accion := nil;
     SBAProveedor.Width := 0;
     MIVerDatosProveedor.Visible := False;
     MISepEnlaces.Visible := False;
  end
  else
  begin
     SolapaControles(SBAProveedor, DBETituloProveedor);
     DBETituloProveedor.Color := REntorno.ColorEnlaceActivo;
  end;

  DBEFIdOrden.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOrden, DBEFIdOrden);
  DBETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, DBETitProyecto);
end;

procedure TFMPedidosAProveedor.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstPedidos_Prov, DMLstPedidos_Prov);
  DMLstPedidos_Prov.MostrarListado(1, 0, DMPedidosaProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text);
  CierraData(DMLstPedidos_Prov);
end;

procedure TFMPedidosAProveedor.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMPedidosAProveedor.FiltraCabecera(ejercicio, serie, rig);
  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBETituloProveedorEnter(Sender: TObject);
begin
  DBEFProveedor.SetFocus;
end;

procedure TFMPedidosAProveedor.HabilitaBotones;
var
  Habil : boolean;
begin
  Habil := DMPedidosAProveedor.HayDocumentos;

  AAbrirCerrar.Enabled := Habil;
  ADuplicar.Enabled := Habil;
  ARegenerar.Enabled := Habil;
  AAnulaDocumento.Enabled := Habil;
  AHerencia.Enabled := Habil;

  {dji lrk kri}
  if REntorno.SerieRestringida <> '' then
     EFSerie.Enabled := False;
  if REntorno.AlmacenRestringido <> '' then
     EFAlmacen.Enabled := False;

  APedidosMulti.Enabled := Habil;

  AListaPedido.Visible := (REntorno.ListaPedCompra = 1);
  AListaPedido.Enabled := Habil;
end;

procedure TFMPedidosAProveedor.AbreOCierra;
begin
  if (DMPedidosAProveedor.EstadoDocumento = 5) then
  begin
     TButtAbreCierra.Hint := _('Abrir Pedido');
     TButtAbreCierra.ImageIndex := 67;
     TButtAbreCierra.Tag := 1;
     AAbrirCerrar.Hint := _('Abrir Pedido');
     AAbrirCerrar.ImageIndex := 67;
     AAbrirCerrar.Tag := 1;
     AAbrirCerrar.Caption := _('Abrir Pedido');
  end
  else
  begin
     TButtAbreCierra.Hint := _('Cerrar Pedido');
     TButtAbreCierra.ImageIndex := 68;
     TButtAbreCierra.Tag := 0;
     AAbrirCerrar.Hint := _('Cerrar Pedido');
     AAbrirCerrar.ImageIndex := 68;
     AAbrirCerrar.Tag := 0;
     AAbrirCerrar.Caption := _('Cerrar Pedido');
  end;

  if (DMPedidosAProveedor.EstadoDocumento = 1) then
  begin
     AListaPedido.ImageIndex := 147;
     AListaPedido.Hint := _('Pasar a ''No listado''');
     AListaPedido.Caption := _('Pasar a ''No listado''');
  end
  else
  begin
     AListaPedido.ImageIndex := 146;
     AListaPedido.Hint := _('Cambia estado a ''Listado''');
     AListaPedido.Caption := _('Cambia estado a ''Listado''');
  end;

  HabilitaBotonesDetalle;

  ColorSegunEstado(DBETituloEstado, DMPedidosAProveedor.QMCabeceraESTADO.AsInteger);
end;

procedure TFMPedidosAProveedor.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  i : integer;
begin
  MTelefonos.Visible := False;
  MNotas.Visible := False;

  if (Trim(BotonesNavMain) <> '') then
  begin
     // Si existe, modifico los botones visibles
     with NavMain do
     begin
        VisibleButtons := [];
        if (BotonesNavMain[1] = 'F') then
           VisibleButtons := VisibleButtons + [nbFirst];
        if (BotonesNavMain[2] = 'P') then
           VisibleButtons := VisibleButtons + [nbPrior];
        if (BotonesNavMain[3] = 'N') then
           VisibleButtons := VisibleButtons + [nbNext];
        if (BotonesNavMain[4] = 'L') then
           VisibleButtons := VisibleButtons + [nbLast];
        if (BotonesNavMain[5] = 'I') then
           VisibleButtons := VisibleButtons + [nbInsert];
        if (BotonesNavMain[6] = 'D') then
           VisibleButtons := VisibleButtons + [nbDelete];
        if (BotonesNavMain[7] = 'E') then
           VisibleButtons := VisibleButtons + [nbEdit];
        if (BotonesNavMain[8] = 'P') then
           VisibleButtons := VisibleButtons + [nbPost];
        if (BotonesNavMain[9] = 'C') then
           VisibleButtons := VisibleButtons + [nbCancel];
        if (BotonesNavMain[10] = 'R') then
           VisibleButtons := VisibleButtons + [nbRefresh];
     end;
  end;

  if (Trim(BotonesNavDetalle) <> '') then
  begin
     // Si existe, modifico los botones visibles
     with NavDetalle do
     begin
        VisibleButtons := [];
        if (BotonesNavDetalle[1] = 'F') then
           VisibleButtons := VisibleButtons + [nbFirst];
        if (BotonesNavDetalle[2] = 'P') then
           VisibleButtons := VisibleButtons + [nbPrior];
        if (BotonesNavDetalle[3] = 'N') then
           VisibleButtons := VisibleButtons + [nbNext];
        if (BotonesNavDetalle[4] = 'L') then
           VisibleButtons := VisibleButtons + [nbLast];
        if (BotonesNavDetalle[5] = 'I') then
           VisibleButtons := VisibleButtons + [nbInsert];
        if (BotonesNavDetalle[6] = 'D') then
           VisibleButtons := VisibleButtons + [nbDelete];
        if (BotonesNavDetalle[7] = 'E') then
           VisibleButtons := VisibleButtons + [nbEdit];
        if (BotonesNavDetalle[8] = 'P') then
           VisibleButtons := VisibleButtons + [nbPost];
        if (BotonesNavDetalle[9] = 'C') then
           VisibleButtons := VisibleButtons + [nbCancel];
        if (BotonesNavDetalle[10] = 'R') then
           VisibleButtons := VisibleButtons + [nbRefresh];
     end;
  end;

  // REntorno.RestriccionDocumento: Si el usuario tiene restringido modificar documentos impresos
  // MODIFICA_DOC contiene la marca de si ha sido impreso (codificado binario en un entero)
  // bit 8 = 0 --> Pedidos a Prov. restringidos
  if (((REntorno.RestriccionDocumento and 128) = 0) and
     ((DMPedidosAProveedor.xInfoActualizadaMODIFICA_DOC.AsInteger and 128) = 128)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if Button in [nbPost, nbDelete, nbCancel] then
     HabilitaBotones;

  {dji lrk kri}
  if ((Button in [nbInsert]) and (REntorno.AlmacenRestringido <> '')) then
     EFAlmacen.Text := REntorno.AlmacenRestringido;

  for i := 0 to PDetalle.ComponentCount - 1 do
  begin
     if (PDetalle.Components[i] is TToolButton) then
        TToolButton(PDetalle.Components[i]).Enabled := True;
  end;

  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.HabilitaBotonesDetalle;
var
  Habil, HabilEd : boolean;
begin
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMPedidosAProveedor.HayDetalle) or (DMPedidosAProveedor.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMPedidosAProveedor.QMDetalle.State in [dsInsert, dsEdit]);

  ANotasDetalle.Enabled := HabilEd;
  AHerencia.Enabled := HabilEd;
  AInfoStocks.Enabled := Habil;
  AUnidades_Ext.Enabled := HabilEd;
  APreciosTarifa.Enabled := Habil;
  AInfoHistorico.Enabled := Habil;
  ATarifasProveedor.Enabled := Habil;
  ADesServir.Enabled := HabilEd;
  AArticuloProv.Enabled := Habil;
  AVerPedidosAProveedor.Enabled := Habil;
  AVerPedidosDeArticulo.Enabled := Habil;
  AVerArticulosPorTarifa.Enabled := HabilEd;
  AVerHistoricoDeCostesKri.Enabled := HabilEd;
  AVerCodigoProveedorKri.Enabled := HabilEd;
  ABuscarArticulo.Enabled := True;  // Siempre Activo
  ACondicionesCompra.Enabled := HabilEd;
  ADuplicarLinea.Enabled := HabilEd;

  AOrdenaLineas.Enabled := HabilEd;
  AOrdenaLineas.Enabled := Habil;
  TButtImportarDetalle.Enabled := True;  // Siempre Activo

  // En el caso del Tipo de IVA tenemos que ver el parámetro COMTIVA001
  HabilitaColumna(DBGFDetalle, 'TIPO_IVA', Param_COMTIVA001);
end;

procedure TFMPedidosAProveedor.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if Button in [nbRefresh] then
     DMPedidosAProveedor.RellenaDatosOldLinea;
end;

procedure TFMPedidosAProveedor.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  //if ((DMPedidosAProveedor.QMDetalle.State = dsinsert)) then
  HabilitaBotonesDetalle;
end;

procedure TFMPedidosAProveedor.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBGFDetalleDblClick(Sender: TObject);
begin
  if DMPedidosAProveedor.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;
  end;
end;

procedure TFMPedidosAProveedor.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMPedidosAProveedor.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMPedidosAProveedor.AArticuloProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMPedidosAProveedor.QMDetalleARTICULO.AsString, 0);
end;

procedure TFMPedidosAProveedor.RelojNotasTimer(Sender: TObject);
begin
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMPedidosAProveedor.AInformePedidoExecute(Sender: TObject);
begin
  // En el Tag de la TAction especifica el numero de listado
  AbreData(TDMLstPedidos_Prov, DMLstPedidos_Prov);
  AInformePedido.Enabled := False;
  try
     DMLstPedidos_Prov.MostrarListado(0, TAction(Sender).Tag, DMPedidosaProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text);
  finally
     AInformePedido.Enabled := True;
     CierraData(DMLstPedidos_Prov);
  end;

  DMPedidosAProveedor.InfoActualiza;
end;

procedure TFMPedidosAProveedor.AVisualizarPedidosFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(2);
end;

procedure TFMPedidosAProveedor.AImprimirPedidosFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(3);
end;

procedure TFMPedidosAProveedor.AResumenPedidosExecute(Sender: TObject);
begin
  AbreData(TDMLstPedidosaProv, DMLstPedidosaProv);
  TFMLstEntreFechas.Create(Self).muestra('PEP', EFSerie.Text);
  CierraData(DMLstPedidosaProv);
end;

procedure TFMPedidosAProveedor.AResumenPedidosFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMPedidosAProveedor.AImprimirResumenPedidosFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMPedidosAProveedor.AVisualizaPedMailExecute(Sender: TObject);
var
  Memo : TStrings;
begin
  AbreData(TDMLstPedidos_prov, DMLstPedidos_prov);
  Memo := TStringList.Create;
  DMLstPedidos_prov.MostrarListadoMail(DMPedidosAProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text,
     0, DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger, Memo);
  Memo.Free;
  CierraData(DMLstPedidos_prov);
end;

procedure TFMPedidosAProveedor.AEnviarPedidoEMailExecute(Sender: TObject);
var
  Memo, CuerpoMail : TStrings;
  Asunto : string;
  DMLstPedidos_provCargado, DMListadosCargado : boolean;
begin
  // esto es porque el assigned no va

  DMLstPedidos_provCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPedidos_prov, DMLstPedidos_prov);
           DMLstPedidos_provCargado := True;
           Memo := TStringList.Create;
           try
              DMLstPedidos_prov.MostrarListadoMail(DMPedidosAProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text,
                 1, DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger, Memo);
              CierraData(DMLstPedidos_prov);
              DMLstPedidos_provCargado := False;

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              InicializaVariableEmail(DMPedidosAProveedor.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMPedidosAProveedor.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMPedidosAProveedor.QMCabeceraRIG.AsInteger;
                 Fecha := DMPedidosAProveedor.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMPedidosAProveedor.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := DMLstPedidos_prov.nombreFich;
                 Matricula := '';
                 if (DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
                 begin
                    NombreComercial := DMPedidosAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
                    RazonSocial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := DameOrdenDeTrabajo(DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger);
                 IdOrdenTrabajo := DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPedidosAProveedor.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 FSendCorreo.Texto(_('Enviando Mensaje  ...'));
                 DMListados.SendMailTercero(DMPedidosAProveedor.QMCabeceraTercero.AsInteger, Memo, Asunto);
              finally
                 CuerpoMail.Free;
              end;
           finally
              Memo.Free;
           end;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           Application.ProcessMessages;
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

           // Liberamos objetos creados

           if DMLstPedidos_provCargado then
              CierraData(DMLstPedidos_prov);
           if DMListadosCargado then
              CierraData(DMListados);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TFMPedidosAProveedor.AConfListadoPedidosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidos_Prov, DMLstPedidos_Prov);
  TFMListConfig.Create(Self).Muestra(40, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstPedidos_Prov.frPedidos, DMLstPedidos_Prov.HYReport);
  CierraData(DMLstPedidos_Prov);
end;

procedure TFMPedidosAProveedor.AConfListadoResumenExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidosAProv, DMLstPedidosAProv);
  TFMListConfig.Create(Self).Muestra(43, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstPedidosAProv.frPedido);
  CierraData(DMLstPedidosAProv);
end;

procedure TFMPedidosAProveedor.AAbrirCerrarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     if (TButtAbreCierra.Tag = 0) then
     begin
        if (DMPedidosAProveedor.EstadoDocumento = 1) then
        begin
           DMPedidosAProveedor.DesBloqueaPedido;
           DMPedidosAProveedor.BloqueaPedido;
        end
        else
           DMPedidosAProveedor.BloqueaPedido;
     end
     else
     if (TButtAbreCierra.Tag = 1) then
        DMPedidosAProveedor.DesBloqueaPedido;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPedidosAProveedor.AListaPedidoExecute(Sender: TObject);
begin
  if (DMPedidosAProveedor.EstadoDocumento = 0) then
  begin
     AListaPedido.ImageIndex := 147;
     DMPedidosAProveedor.CambiaEstadoAListado;
     AListaPedido.Hint := _('Pasar a ''No listado''');
     AListaPedido.Caption := _('Pasar a ''No listado''');
  end
  else if (DMPedidosAProveedor.EstadoDocumento = 1) then
  begin
     DMPedidosAProveedor.DesBloqueaPedido;  //Aprovechamos este procedimiento
     AListaPedido.ImageIndex := 146;
     //para devolver el pedido a un estado Normal
     AListaPedido.Hint := _('Cambia estado a ''Listado''');
     AListaPedido.Caption := _('Cambia estado a ''Listado''');
  end;
end;

procedure TFMPedidosAProveedor.ADuplicarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPedidosAProveedor.Duplica(0);
  finally
     Screen.Cursor := crDefault;
     HabilitaBotones;
  end;
end;

procedure TFMPedidosAProveedor.ARegenerarExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Proveedor-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMPedidosAProveedor.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMPedidosAProveedor.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMPedidosAProveedor.ActualizaCondicionesProv(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMPedidosAProveedor.AAnulaDocumentoExecute(Sender: TObject);
begin
  DMPedidosAProveedor.AnulaDocumento;
end;

procedure TFMPedidosAProveedor.AHerenciaExecute(Sender: TObject);
var
  rig, ejercicio : integer;
  tipo, num_factura, titulo, serie : string;
begin
  DMPedidosAProveedor.DatosHerencia(rig, ejercicio, tipo, num_factura, titulo, serie);
  MuestraHerencia(rig, ejercicio, tipo, num_factura, titulo, serie, Self);
end;

procedure TFMPedidosAProveedor.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMPedidosAProveedor.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(DBGFDetalle, Rect);

     with TDBGridFind2000(Sender) do
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
           begin
              if (DMPedidosAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMPedidosAProveedor.QMDetalleSTOCK_ALM.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM2') then
           begin
              if (DMPedidosAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMPedidosAProveedor.QMDetalleSTOCK_ALM2.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM3') then
           begin
              if (DMPedidosAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMPedidosAProveedor.QMDetalleSTOCK_ALM3.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'PEDIDOS_A_PROV') then
           begin
              if (DMPedidosAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
                 ColorInfo(Canvas);
           end;
        end;

        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TFMPedidosAProveedor.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMPedidosAProveedor.AVerPedidosAProveedorExecute(Sender: TObject);
begin
  TFMVerPedidosAProveedorKri.Create(Self).Muestra(
     DMPedidosAProveedor.QMCabeceraALMACEN.AsString,
     DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger, False);
end;

procedure TFMPedidosAProveedor.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavNotas.SetFocus;
  {dji lrk kri - para que se pueda poner simbolo Euros en las notas}
  if Button = nbEdit then
     AUnidades_Ext.ShortCut := 0;
  if Button = nbPost then
     AUnidades_Ext.ShortCut := TextToShortCut('Ctrl+Alt+E');
end;

procedure TFMPedidosAProveedor.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
     DMPedidosAProveedor.ControlaRestriccion;

  if Button in [nbEdit] then
     Editando := True
  else
     Editando := False;

  if (Button in [nbRefresh, nbDelete]) then
     DMPedidosAProveedor.ReiniciaStock;
end;

procedure TFMPedidosAProveedor.AVerPedidosDeArticuloExecute(Sender: TObject);
begin
  TFMVerPedidosDeArticuloKri.Create(Self).Muestra(
     DMPedidosAProveedor.QMCabeceraALMACEN.AsString,
     DMPedidosAProveedor.QMDetalleARTICULO.AsString, False);
end;

procedure TFMPedidosAProveedor.AVerArticulosPorTarifaExecute(Sender: TObject);
begin
  TFMVerArticulosPorTarifaKri.Create(Self).Muestra(
     DMPedidosAProveedor.QMDetalleARTICULO.AsString);
end;

procedure TFMPedidosAProveedor.AVerHistoricoDeCostesKriExecute(Sender: TObject);
begin
  TFMVerHistoricoDeCosteKri.Create(Self).Muestra(
     DMPedidosAProveedor.QMDetalleARTICULO.AsString);
end;

procedure TFMPedidosAProveedor.AVerCodigoProveedorKriExecute(Sender: TObject);
begin
  TFMVerCodigoProveedorKri.Create(Self).Muestra(
     DMPedidosAProveedor.QMDetalleARTICULO.AsString);
end;

procedure TFMPedidosAProveedor.AEnviarPedidoMailPdfExecute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  DMLstPedidos_provCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // esto es porque el assigned no va

  DMLstPedidos_provCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPedidos_prov, DMLstPedidos_prov);
           DMLstPedidos_provCargado := True;
           Memo := TStringList.Create;
           try
              DMLstPedidos_prov.MostrarListadoMail(DMPedidosAProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text,
                 2, DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger, Memo);

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMPedidosAProveedor.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMPedidosAProveedor.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMPedidosAProveedor.QMCabeceraRIG.AsInteger;
                 Fecha := DMPedidosAProveedor.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMPedidosAProveedor.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 if (DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
                 begin
                    NombreComercial := DMPedidosAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
                    RazonSocial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := DameOrdenDeTrabajo(DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger);
                 IdOrdenTrabajo := DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPedidosAProveedor.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 DMListados.SendMailTerceroPDF(DMPedidosAProveedor.QMCabeceraTercero.AsInteger, CuerpoMail,
                    DMLstPedidos_prov.rutaFich, DMLstPedidos_prov.nombreFich, Asunto, DMPedidosAProveedor.QMCabeceraTIPO.AsString, DMPedidosAProveedor.QMCabeceraID_E.AsInteger);
              finally
                 CuerpoMail.Free;
              end
           finally
              Memo.Free;
           end;
           CierraData(DMLstPedidos_prov);
           DMLstPedidos_provCargado := False;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        on E: Exception do
        begin
           Application.ProcessMessages;
           with FSendCorreo do
           begin
              LTexto.AutoSize := True;
              LTexto.Font.Size := 10;
              Texto(_('ERROR!! Error en el envío.') + #13#10 + E.Message);
              BitBtnOk.Top := ClientHeight - BitBtnOk.Height - 4;
              if (LTexto.Width > ClientWidth) then
              begin
                 Width := LTexto.Width + 30;
                 BitBtnOk.Left := (ClientWidth div 2) + (BitBtnOk.Width div 2);
              end;
           end;

           // Liberamos objetos creados
           if DMLstPedidos_provCargado then
              CierraData(DMLstPedidos_prov);
           if DMListadosCargado then
              CierraData(DMListados);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TFMPedidosAProveedor.ANIFPedidosExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFACTURA;
begin
  DMPedidosAProveedor.AbreQMNif;
  if DMPedidosAProveedor.DameDatosProveedor then
  begin
     FPregDatos := TFPregNIFFACTURA.Create(Self);
     FPregDatos.Inicializa(DMPedidosAProveedor.DSQMNIF, _('Datos del Proveedor'), DMPedidosAProveedor.EstadoDocumento);
     DMPedidosAProveedor.GrabaDatosProveedor(FPregDatos.ShowModal);
     FreeAndNil(FPregDatos);
  end;
  DMPedidosAProveedor.CierraQMNif;
  DMPedidosAProveedor.RefrescaCabecera(1);
end;

procedure TFMPedidosAProveedor.ALstCodigoBarrasExecute(Sender: TObject);
begin
  AbreData(TDMLstCBDocs, DMLstCBDocs);
  DMLstCBDocs.Eti_Vacias := TFPregEtiVacias.Create(Self).Muestra;
  if (DMLstCBDocs.Eti_Vacias >= 0) then
     DMLstCBDocs.MostrarListadoCB(DMPedidosAProveedor.QMCabeceraEMPRESA.AsInteger,
        DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger,
        DMPedidosAProveedor.QMCabeceraCANAL.AsInteger,
        DMPedidosAProveedor.QMCabeceraRIG.AsInteger,
        DMPedidosAProveedor.QMCabeceraSERIE.AsString,
        DMPedidosAProveedor.QMCabeceraTIPO.AsString, 0);
  CierraData(DMLstCBDocs);
end;

procedure TFMPedidosAProveedor.ADesServirExecute(Sender: TObject);
begin
  DMPedidosAProveedor.DesServir;
end;

procedure TFMPedidosAProveedor.AOrdenaLineasExecute(Sender: TObject);
begin
  DMPedidosAProveedor.OrdenarLineas;
end;

procedure TFMPedidosAProveedor.APedidosMultiExecute(Sender: TObject);
var
  Accion : integer;
begin
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(Self);
  Accion := FMTraspasoMultiCanal.Carga(DMPedidosAProveedor.QMCabeceraID_E.AsInteger, DMPedidosAProveedor.QMCabeceraRIG.AsInteger,
     DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger, DMPedidosAProveedor.QMCabeceraCANAL.AsInteger, 0,
     DMPedidosAProveedor.QMCabeceraTIPO.AsString, DMPedidosAProveedor.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);
  DMPedidosAProveedor.RefrescaCabecera(Accion);
end;

procedure TraspasoPedidoProv(id_e: integer);
begin
  FMain.EjecutaAccion(FMain.APedidosProv);
  FMain.TraspasodeDocumentosEntrada(id_e);
end;

procedure TFMPedidosAProveedor.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMPedidosAProveedor.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMPedidosAProveedor.FiltraPendiente(FiltroAccion: string);
begin
  FMPedidosAProveedor.TSTabla.Show;
  DMPedidosAProveedor.FiltraPendiente(FiltroAccion);
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBDTPFechaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMPedidosAProveedor.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.NavDetalleChangeState(Sender: TObject);
begin
  {if DMPedidosAProveedor.Inhabilitar then  //Si estamos insertando o updateando, se deshabilitan
  begin
    TButtNotas.Enabled          := False;
    TButtInfoStocks.Enabled     := True;
    TButtUnidades_Ext.Enabled   := False;
    TButtPrecios.Enabled        := True;
    TButtInfoHistorico.Enabled  := True;
    TButtArtTarifa.Enabled      := True;
    TBDesServir.Enabled         := False;
    TBArtProv.Enabled           := True;
    TButtBuscarArticulo.Enabled := False;
    AOrdenaLineas.Enabled       := True;
  end;}

  HabilitaBotonesDetalle;

  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

{Se define en UUtiles
function TFMPedidosAProveedor.EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint;
var
  i: Integer;
  encontrado: Boolean;
begin
  i          := 0;
  encontrado := False;
  with Grid do
  begin
    while ((i <= Columns.Count - 1) and (not encontrado)) do
    begin
      if (Columns[i].FieldName = Titulo) then
      begin
        Result     := i;
        encontrado := True;
      end
      else
        inc(i);
    end;
  end;
end;
}
procedure TFMPedidosAProveedor.ABuscarArticuloExecute(Sender: TObject);
var
  Articulo : string;
begin
  Articulo := '';
  // Si esta filtrado, quito el filtro
  if (BuscarArticulos) then
     Articulo := ''
  else
  begin
     // Si NO esta filtrado, pido el articulo
     if not PideDato('ART', Articulo, 'Articulo', 'FAMILIA <> ''' + REntorno.FamSistema + '''') then
        // Si ha cancelado, borro contenido de variable
        Articulo := '';
  end;

  DMPedidosAProveedor.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMPedidosAProveedor.EFProyectoBusqueda(Sender: TObject);
begin
  EFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMPedidosAProveedor.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(DBGDetalleArticulo, False, True) then
        begin
           DMPedidosAProveedor.QMDetalle.Edit;
           DMPedidosAProveedor.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMPedidosAProveedor.FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
begin
  EFSerie.Text := Serie;
  DMPedidosAProveedor.FiltraProveedorKri(Ejercicio, Serie, Proveedor, Estado);
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBEFTransportistaKriChange(Sender: TObject);
begin
  ETransportistaKri.Text := DameTituloAcreedor(DMPedidosAProveedor.QMCabeceraTRANSPORTISTA.AsInteger);
  DBDTPFecha_Pre.Hint := DMPedidosAProveedor.DameHintFechaEntregaPrevista;
end;

procedure TFMPedidosAProveedor.BTransportistaNormalKriClick(Sender: TObject);
begin
  DMPedidosAProveedor.AsignaTransportistaRapido(False);
end;

procedure TFMPedidosAProveedor.BTransportistaRapidoKriClick(Sender: TObject);
begin
  DMPedidosAProveedor.AsignaTransportistaRapido(True);
end;

procedure TFMPedidosAProveedor.NavMainChangeState(Sender: TObject);
begin
  BTransportistaNormalKri.Visible := ((DMPedidosAProveedor.QMCabecera.State = dsInsert) or (DMPedidosAProveedor.QMCabecera.State = dsEdit));
  BTransportistaRapidoKri.Visible := ((DMPedidosAProveedor.QMCabecera.State = dsInsert) or (DMPedidosAProveedor.QMCabecera.State = dsEdit));
end;

procedure TFMPedidosAProveedor.DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
begin
  {
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMPedidosAProveedor.BusquedaArticulo(valor);
  DMPedidosAProveedor.Continua;
  }
end;

procedure TFMPedidosAProveedor.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'tipo=''PEP'' and serie=''' + EFSerie.Text + '''';
  EFBuscaNIFKRI.OrdenadoPor.Text := 'NOMBRE';
  EFBuscaNIFKRI.SalirSiVacio := False;
  EFBuscaNIFKRI.SalirSiNoExiste := False;
  EFBuscaNIFKRI.Visible := True;
  EFBuscaNIFKRI.SetFocus;
  NavMain.SetFocus;
  EFBuscaNIFKRI.SalirSiVacio := True;
  EFBuscaNIFKRI.SalirSiNoExiste := True;
  EFBuscaNIFKRI.Visible := False;
end;

procedure TFMPedidosAProveedor.EFBuscaNIFKRIChange(Sender: TObject);
begin
  if (StrToIntDef(EFBuscaNIFKRI.Text, 0) <> 0) then
     with DMPedidosAProveedor.QMCabecera do
     begin
        DisableControls;
        First;
        while ((DMPedidosAProveedor.QMCabeceraID_E.AsInteger <> StrToIntDef(EFBuscaNIFKRI.Text, 0)) and (not DMPedidosAProveedor.QMCabecera.EOF)) do
           Next;
        EnableControls;
     end;
end;

procedure TFMPedidosAProveedor.AAFacturaExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPedidosAProveedor.TraspasarPedidoActual('FAP');
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPedidosAProveedor.AAAlbaranExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPedidosAProveedor.TraspasarPedidoActual('ALP');
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPedidosAProveedor.AAdjuntosPedidoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PEP', DMPedidosAProveedor.QMCabeceraID_E.AsInteger);
end;

procedure TFMPedidosAProveedor.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', DameIDProveedor(DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMPedidosAProveedor.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMPedidosAProveedor.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMPedidosAProveedor.AAdjuntosTransportistaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DMPedidosAProveedor.QMCabeceraTRANSPORTISTA.AsInteger));
end;

// sfg_XGM-begin- especial abrir cliente de correo predeterminado (El DMlistados tienes que ser a medida)
procedure TFMPedidosAProveedor.AEnviarPedidoMailPDF2Execute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstPedidos_prov, DMLstPedidos_prov);
  try
     Memo := TStringList.Create;
     try
        DMLstPedidos_prov.MostrarListadoMail(DMPedidosAProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text,
           2, DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger, Memo);

        InicializaVariableEmail(DMPedidosAProveedor.QMCabeceraTIPO.AsString);
        with VariableEmail do
        begin
           Ejercicio := DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger;
           Serie := DMPedidosAProveedor.QMCabeceraSERIE.AsString;
           NumeroDocumento := DMPedidosAProveedor.QMCabeceraRIG.AsInteger;
           Fecha := DMPedidosAProveedor.QMCabeceraFECHA.AsDateTime;
           SuReferencia := DMPedidosAProveedor.QMCabeceraSU_REFERENCIA.AsString;
           SuPedido := '';
           Folio := '';
           TituloDocTributario := '';
           NombreFichero := DMLstPedidos_prov.nombreFich;
           Matricula := '';
           if (DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
           begin
              NombreComercial := DMPedidosAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
              RazonSocial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
           end
           else
           begin
              // El campo TITULO se rellena con el nombre asignado al Tercero Vario
              NombreComercial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
              RazonSocial := DMPedidosAProveedor.QMCabeceraTITULO.AsString;
           end;
           OrdenTrabajo := DameOrdenDeTrabajo(DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger);
           IdOrdenTrabajo := DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger;
           UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPedidosAProveedor.QMCabeceraENTRADA.AsInteger));
        end;
        DamePartesEmail(Asunto, CuerpoMail);
        try
           DMListados.SendMailTerceroPDF2(DMPedidosAProveedor.QMCabeceraTERCERO.AsInteger, CuerpoMail, DMLstPedidos_prov.rutaFich,
              DMLstPedidos_prov.nombreFich, Asunto, DMPedidosAProveedor.QMCabeceraTIPO.AsString, DMPedidosAProveedor.QMCabeceraID_E.AsInteger, True);
        finally
           CuerpoMail.Free;
        end;
     finally
        Memo.Free;
     end;

     // Marco el documento como listado
     DMLstPedidos_prov.UpdateaDocumentos;
  finally
     CierraData(DMLstPedidos_prov);
  end;
end;
// sfg_XGM-end- especial abrir cliente de correo predeterminado

procedure TFMPedidosAProveedor.DBEFIdOrdenExit(Sender: TObject);
begin
  if (DBEFIdOrden.Text <> '') then
  begin
     LFase.Visible := True;
     DBEFFase.Visible := True;
     DBETituloFase.Visible := True;
     if (DBEFFase.CanFocus) then
        DBEFFase.SetFocus;
  end
  else
  begin
     LFase.Visible := False;
     DBEFFase.Visible := False;
     DBETituloFase.Visible := False;
  end;
end;

procedure TFMPedidosAProveedor.DBEFFaseBusqueda(Sender: TObject);
begin
  DBEFFase.CondicionBusqueda := 'id_orden=' + DBEFIdOrden.Text;
end;

procedure TFMPedidosAProveedor.AOrdenExecute(Sender: TObject);
begin
  if (DMPedidosAProveedor.QMCabeceraID_ORDEN.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AProOrden, DMPedidosAProveedor.QMCabeceraID_ORDEN.AsString);
end;

procedure TFMPedidosAProveedor.AConfListadoCodigoBarrasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstCBDocs, DMLstCBDocs);
  TFMListConfig.Create(Self).Muestra(96, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstCBDocs.frCodBarras);
  CierraData(DMLstCBDocs);
end;

procedure TFMPedidosAProveedor.ACrearNuevoPedidoPendientesExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPedidosAProveedor.Duplica(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPedidosAProveedor.DBEFProveedorChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMPedidosAProveedor.QMCabeceraTERCERO.AsInteger);
  DBDTPFecha_Pre.Hint := DMPedidosAProveedor.DameHintFechaEntregaPrevista;
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBEFProveedorExiste(Sender: TObject);
begin
  if (not DMMain.ProveedorValido(StrToIntDef(DBEFProveedor.Text, 0))) then
     DBEFProveedor.Text := '';
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMPedidosAProveedor.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMPedidosAProveedor.ACondicionesCompraExecute(Sender: TObject);
begin
  AbreForm(TFMCondicionesCompra, FMCondicionesCompra);
  with FMCondicionesCompra do
  begin
     EFProveedor.Text := DBEFProveedor.Text;
     EFFiltroArticulo.Text := DMPedidosAProveedor.QMDetalleARTICULO.AsString;
     EFFiltroFamilia.Text := DMPedidosAProveedor.xArticulos.FieldByName('FAMILIA').AsString;
     EFFiltroArticuloPorPrecio.Text := DMPedidosAProveedor.QMDetalleARTICULO.AsString;
     EFFiltraFamiliaPorPrecio.Text := DMPedidosAProveedor.xArticulos.FieldByName('FAMILIA').AsString;
  end;
end;

procedure TFMPedidosAProveedor.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMPedidosAProveedor.QMCabeceraTERCERO.AsInteger, Lines);
        Width := 400;
        ScrollBars := ssNone;

        // Ajusto a derecha, debajo de telefono
        Left := TBMain.Width - Width;
        Top := TBMain.Top + TBMain.Height;

        // Calculo altura
        if (Font.Height < 0) then
           Height := (Lines.Count + 1) * (Abs(Font.Height) + 2)
        else
           Height := (Lines.Count + 1) * Abs(Font.Height);

        // Si es mas grande que el formulario agrego scrollbar
        if (Height > Self.ClientHeight) then
        begin
           Height := Self.ClientHeight - TBMain.Height - TBActions.Height - Top;
           ScrollBars := ssVertical;
        end;
     end;
     Visible := not Visible;
  end;
end;

procedure TFMPedidosAProveedor.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMPedidosAProveedor.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMPedidosAProveedor.AListarEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos(DMPedidosAProveedor.QMCabeceraTIPO.AsString, DMPedidosAProveedor.QMCabeceraID_E.AsInteger);
end;

procedure TFMPedidosAProveedor.AConfListadoMaterialesProduccionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidos_Prov, DMLstPedidos_Prov);
  TFMListConfig.Create(Self).Muestra(2001, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstPedidos_Prov.frPedidos, DMLstPedidos_Prov.HYReport);
  CierraData(DMLstPedidos_Prov);
end;

procedure TFMPedidosAProveedor.ADuplicarLineaExecute(Sender: TObject);
begin
  DMPedidosAProveedor.DuplicarLinea;
end;

procedure TFMPedidosAProveedor.AImportaVentasDepositoExecute(Sender: TObject);
begin
  AbreForm(TFMImportaVentasDeposito, FMImportaVentasDeposito, Sender);
  FMImportaVentasDeposito.Mostrar(DMPedidosAProveedor.QMCabeceraID_E.AsInteger);
  DMPedidosAProveedor.RefrescaCabecera(1);
end;

procedure TFMPedidosAProveedor.AAFacturaSoloIVAExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPedidosAProveedor.TraspasarPedidoAFacIVA;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPedidosAProveedor.EFAlmacenChange(Sender: TObject);
begin
  ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMPedidosAProveedor.ATarifasProveedorExecute(Sender: TObject);
begin
  SWCerrar := 1;
  AbreForm(TFMArticulosTarifa, FMArticulosTarifa, Sender);
end;

procedure TFMPedidosAProveedor.LBNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMPedidosAProveedor.xProveedor.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMPedidosAProveedor.xProveedor.FieldByName('NOTAS').AsString);
        {
        if (Trim(DMPedidosAProveedor.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMPedidosAProveedor.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        }
        if (Trim(DMPedidosAProveedor.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMPedidosAProveedor.xAvisos.FieldByName('MENSAJE').AsString);
        end;

        Width := 400;
        ScrollBars := ssNone;

        // Ajusto a derecha, debajo de telefono
        Left := TBMain.Width - Width;
        Top := TBMain.Top + TBMain.Height;

        // Calculo altura
        if (Font.Height < 0) then
           Height := (Lines.Count + 1) * (Abs(Font.Height) + 2)
        else
           Height := (Lines.Count + 1) * Abs(Font.Height);

        // Si es mas grande que el formulario agrego scrollbar
        if (Height > Self.ClientHeight) then
        begin
           Height := Self.ClientHeight - TBMain.Height - TBActions.Height - Top;
           ScrollBars := ssVertical;
        end;
     end;
     Visible := not Visible;
  end;
end;

procedure TFMPedidosAProveedor.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPedidosAProveedor.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';

  try
     Buscando := True;
     G2KTableLoc.Click;
  finally
     Buscando := False;
  end;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMPedidosAProveedor.DBERIGChange(Sender: TObject);
begin
  inherited;
  RefrescaAvisos;
end;

procedure TFMPedidosAProveedor.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMPedidosAProveedor.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMPedidosAProveedor.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMPedidosAProveedor;
     ShowModal;
     Free;
  end;
end;

procedure TFMPedidosAProveedor.AAsignacionCodigoBarraExecute(Sender: TObject);
{$IFNDEF TPV}
var
  IdDetallesE : integer;
  ListaIdArticulo : string;
{$ENDIF}
begin
  inherited;
{$IFNDEF TPV}
  ListaIdArticulo := '';

  // Genero listad de ID_A
  with DMPedidosAProveedor.QMDetalle do
  begin
     if Active then
     begin
        IdDetallesE := FieldByName('ID_DETALLES_E').AsInteger;
        DisableControls;
        try
           First;
           if not EOF then
           begin
              ListaIdArticulo := FieldByName('ID_A').AsString;
              Next;
           end;
           while not EOF do
           begin
              ListaIdArticulo := ListaIdArticulo + ', ' + FieldByName('ID_A').AsString;
              Next;
           end;

           Posicionar(DMPedidosAProveedor.QMDetalle, 'ID_DETALLES_E', IdDetallesE);
        finally
           EnableControls;
        end;
     end;
  end;

  if (ListaIdArticulo > '') then
  begin
     AbreForm(TFMAsignacionCodigoBarra, FMAsignacionCodigoBarra);
     FMAsignacionCodigoBarra.Filtrar('ID_A IN (' + ListaIdArticulo + ')');
  end;
{$ENDIF}
end;

procedure TFMPedidosAProveedor.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMPedidosAProveedor.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMPedidosAProveedor.DBEFPortesChange(Sender: TObject);
begin
  ETituloPortes.Text := DameTituloPorte(StrToIntDef(DBEFPortes.Text, -1));

  if ((Assigned(DBEFPortes.Field)) and (DBEFPortes.Text <> '')) then
  begin
     if ((StrToInt(DBEFPortes.Text) <= 2) or ((StrToInt(DBEFPortes.Text) > 4))) then
     begin
        if Assigned(DBEPorPortes.Field) then
           DBEPorPortes.Field.Value := 0;
        DBEPorPortes.Color := clInfoBk;
        DBEPorPortes.Enabled := False;

        if Assigned(DBEIPortes.Field) then
           DBEIPortes.Field.Value := 0;
        DBEIPortes.Color := clInfoBk;
        DBEIPortes.Enabled := False;
     end
     else
     if (StrToInt(DBEFPortes.Text) = 3) then
     begin
        DBEPorPortes.Color := clWindow;
        DBEPorPortes.Enabled := True;
        DBEIPortes.Color := clInfoBk;
        DBEIPortes.Enabled := False;
        if (not (NavMain.DataSource.State in [dsBrowse])) then
        begin
           if Assigned(DBEIPortes.Field) then
              DBEIPortes.Field.Value := 0;
           if Assigned(DBEPorPortes.Field) then
              DBEPorPortes.Field.Value := 0;
        end;
     end
     else
     begin
        DBEPorPortes.Color := clInfoBk;
        DBEPorPortes.Enabled := False;
        DBEIPortes.Color := clWindow;
        DBEIPortes.Enabled := True;
        if (not (NavMain.DataSource.State in [dsBrowse])) then
        begin
           if Assigned(DBEIPortes.Field) then
              DBEIPortes.Field.Value := 0;
           if Assigned(DBEPorPortes.Field) then
              DBEPorPortes.Field.Value := 0;
           DBEIPortes.DataSource := DMPedidosAProveedor.DSCabecera;
        end;
     end;

     DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
     DBEPorPortes.TabStop := DBEPorPortes.Enabled;
     DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
     DBEIPortes.TabStop := DBEIPortes.Enabled;
  end;
end;

procedure TFMPedidosAProveedor.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  ImporteMinimoPortes : double;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((Column.FieldName = 'ESTADO') or (Column.FieldName = 'TITULO_ESTADO')) then
        begin
           ColorSegunEstado(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end
        else
        if (Column.FieldName = 'IMPORTE_MINIMO_PORTE') then
        begin
           ImporteMinimoPortes := DataSource.DataSet.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat;
           if ((ImporteMinimoPortes > 0) and (DataSource.DataSet.FieldByName('S_BASES').AsFloat >= ImporteMinimoPortes)) then
              ColorResaltado2(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPedidosAProveedor.ACrearHerenciaManualExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMPedidosAProveedor.QMDetalleTIPO.AsString, DMPedidosAProveedor.QMDetalleID_DETALLES_E.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMPedidosAProveedor.AListarEtiquetasProcedenciaExecute(Sender: TObject);
begin
  inherited;
  // Lonper: Lista una etiqueta por cada pedido de cliente de la procedencia

  AbreData(TDMLstCBDocs, DMLstCBDocs);
  // DMLstCBDocs.Eti_Vacias := TFPregEtiVacias.Create(Self).Muestra;
  // if (DMLstCBDocs.Eti_Vacias >= 0) then

  DMLstCBDocs.MostrarListadoProcedencia(DMPedidosAProveedor.QMCabeceraID_E.AsInteger);
  CierraData(DMLstCBDocs);
end;

procedure TFMPedidosAProveedor.AConfEtiquetaProcedenciaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  // Lonper

  AbreData(TDMLstCBDocs, DMLstCBDocs);
  TFMListConfig.Create(Self).Muestra(209, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstCBDocs.frCodBarras);
  CierraData(DMLstCBDocs);
end;

procedure TFMPedidosAProveedor.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if ((Button = nbDelete) and (DMPedidosAProveedor.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMPedidosAProveedor.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosAProveedor.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMPedidosAProveedor.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 0');
end;

procedure TFMPedidosAProveedor.AFiltroAnuladoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 2');
end;

procedure TFMPedidosAProveedor.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 5');
end;

procedure TFMPedidosAProveedor.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + DMPedidosAProveedor.QMCabeceraTERCERO.AsString;
end;

procedure TFMPedidosAProveedor.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('PEP', DMPedidosAProveedor.QMCabeceraID_E.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosPedido.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMPedidosAProveedor.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if TDBGridFind2000(Sender).DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
     if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
     begin
        if Key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', '*', '%', ' ', '_'] then
           DBGDetalleArticulo := DBGDetalleArticulo + Key
        else
        if Key in [#8] then
           DBGDetalleArticulo := Copy(DBGDetalleArticulo, 1, Length(DBGDetalleArticulo) - 1);
     end;
  end
  else
     DBGDetalleArticulo := '';
end;

procedure TFMPedidosAProveedor.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGDetalleArticulo := '';
end;

procedure TFMPedidosAProveedor.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMPedidosAProveedor.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMPedidosAProveedor.QMDetalleTIPO.AsString, DMPedidosAProveedor.QMDetalleID_E.AsInteger);

        if (ShowModal = mrOk) then
        begin
           // Borrar las líneas que estén seleccionadas en TMP_DOC_LINEAS_A_PROC
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' DELETE FROM GES_DETALLES_E ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E AND ');
                 SQL.Add(' ID_DETALLES_E IN (SELECT ID_DETALLES_DOC ');
                 SQL.Add('                   FROM TMP_DOC_LINEAS_A_PROC ');
                 SQL.Add('                   WHERE ');
                 SQL.Add('                   ENTRADA = :ENTRADA AND ');
                 SQL.Add('                   SELECCIONADO = 1) ');
                 Params.ByName['ID_E'].AsInteger := DMPedidosAProveedor.QMDetalleID_E.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMPedidosAProveedor.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMPedidosAProveedor.EstableceVisibilidadStockAlmacen;

  procedure EstableceVisibilidad(Campo, Parametro, Descripcion: string);
  var
     i : smallint;
     AlmacenStock : string;
  begin
     AlmacenStock := LeeParametro(Parametro, EFSerie.Text);
     if (AlmacenStock = '') then
        AlmacenStock := 'NOCALC';
     if (AlmacenStock <> 'NOCALC') then
        AlmacenStock := Copy(AlmacenStock, 1, 3);

     Descripcion := Descripcion + ' ' + AlmacenStock;

     i := EncuentraField(DBGFDetalle, Campo);
     if (i >= 0) then
     begin
        with DBGFDetalle.Columns[i] do
        begin
           Visible := (AlmacenStock <> 'NOCALC');
           Title.Caption := Descripcion;
        end;
     end
     else
     begin
        with DBGFDetalle.Columns.Add do
        begin
           FieldName := Campo;
           Title.Caption := Descripcion;
           Visible := (AlmacenStock <> 'NOCALC');
        end;
     end;
  end;

begin
  EstableceVisibilidad('STOCK_ALM', 'PEPSTKA001', _('Stock'));
  EstableceVisibilidad('STOCK_ALM2', 'PEPSTKA002', _('Stock'));
  EstableceVisibilidad('STOCK_ALM3', 'PEPSTKA003', _('Stock'));
end;

procedure TFMPedidosAProveedor.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  EIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMPedidosAProveedor.RefrescaAvisos;
var
  ImporteMinimoPortes : double;
  Resaltado : boolean;
begin
  if (not Buscando) then
  begin
     if (((DMPedidosAProveedor.xProveedor.Active) and (Trim(DMPedidosAProveedor.xProveedor.FieldByName('NOTAS').AsString) > '')) or
        ((DMPedidosAProveedor.xAvisos.Active) and (Trim(DMPedidosAProveedor.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
        LBNotas.Visible := True
     else
        RelojNotas.Enabled := False;
     LBNotas.Visible := RelojNotas.Enabled;

     if (DMMain.ExisteAdjunto(DMPedidosAProveedor.QMCabeceraTIPO.AsString, DMPedidosAProveedor.QMCabeceraID_E.AsInteger)) then
        RelojAdjuntos.Enabled := True
     else
        RelojAdjuntos.Enabled := False;

     LAdjuntos.Visible := RelojAdjuntos.Enabled;

     if (DMMain.EnviarFacturasProvAcrePorEmail(DMPedidosAProveedor.QMCabeceraTERCERO.AsInteger)) then
        RelojEmail.Enabled := True
     else
        RelojEmail.Enabled := False;

     LEmail.Visible := RelojEmail.Enabled;

     // Nuevo pedido con las unidades pendientes del origen
     LCreaPedidoPendientes.Visible := False;
     LCreaPedidoPendientes.Caption := '';
     if (StrToIntDef(DBERIG.Text, 0) > 0) then
     begin
        // Calculo el origen - Traigo el primer pedido del que viene.
        // Tambien puede venir de Propuestas de pedido, pero no las tengo en cuenta para esto.
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT RTIPO || '' '' || REJERCICIO || ''-'' || RSERIE || ''/'' || RRIG ');
              SQL.Add(' FROM G_RELACIONES_ORIGENES_E(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
              SQL.Add(' WHERE ');
              SQL.Add(' RTIPO = ''PEP'' ');
              SQL.Add(' ORDER BY REJERCICIO, RRIG ');
              Params.ByName['EMPRESA'].AsInteger := DMPedidosAProveedor.QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := DMPedidosAProveedor.QMCabeceraCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := DMPedidosAProveedor.QMCabeceraSERIE.AsString;
              Params.ByName['TIPO'].AsString := DMPedidosAProveedor.QMCabeceraTIPO.AsString;
              Params.ByName['RIG'].AsInteger := DMPedidosAProveedor.QMCabeceraRIG.AsInteger;
              ExecQuery;
              LCreaPedidoPendientes.Caption := Fields[0].AsString + '->' + _('Esta');
              if (Fields[0].AsString < ' ') then
                 LCreaPedidoPendientes.Caption := _('Esta');
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Calculo el destino
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT RTIPO || '' '' || REJERCICIO || ''-'' || RSERIE || ''/'' || RRIG ');
              SQL.Add(' FROM G_RELACIONES_DESTINOS_E(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
              SQL.Add(' WHERE ');
              SQL.Add(' RTIPO = ''PEP'' ');
              SQL.Add(' ORDER BY REJERCICIO, RRIG ');
              Params.ByName['EMPRESA'].AsInteger := DMPedidosAProveedor.QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := DMPedidosAProveedor.QMCabeceraCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := DMPedidosAProveedor.QMCabeceraSERIE.AsString;
              Params.ByName['TIPO'].AsString := DMPedidosAProveedor.QMCabeceraTIPO.AsString;
              Params.ByName['RIG'].AsInteger := DMPedidosAProveedor.QMCabeceraRIG.AsInteger;
              ExecQuery;
              if (Fields[0].AsString > ' ') then
                 LCreaPedidoPendientes.Caption := LCreaPedidoPendientes.Caption + '->' + Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;

        LCreaPedidoPendientes.Visible := (LCreaPedidoPendientes.Caption > ' ') and (LCreaPedidoPendientes.Caption <> _('Esta'));
     end;

     // Si el tipo de porte es 2, ponemos en colorin el importe minimo de porte
     Resaltado := False;
     if (DMPedidosAProveedor.xProveedor.Active) then
     begin
        ImporteMinimoPortes := DMPedidosAProveedor.xProveedor.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat;
        if ((ImporteMinimoPortes > 0) and (DMPedidosAProveedor.xInfoActualizadaS_BASES.AsFloat >= ImporteMinimoPortes)) then
           Resaltado := True;
     end;

     if Resaltado then
        ColorResaltado2(DBEImporteMinimoPorte)
     else
        ColorInfo(DBEImporteMinimoPorte);
  end;
end;

procedure TFMPedidosAProveedor.AExportacionEuropastryExecute(Sender: TObject);
var
  Ubicacion, Archivo : string;
  sl : TStrings;
begin
  inherited;
  {
  Exportacion de lineas a CSV para Europastry
  Primera línea tiene codigo de Proveedor Europastry (ALFA_1) y fecha del pedido
  Resto de lineas tienen Codigo Euroastry del artículo (ALFA_3) y unidades.
    454056;14/01/2025;;
    00100;4;0;0
    00105;8;0;0
  }

  Ubicacion := LeeDatoIni('FMPedidosAProveedor', 'UltimaRutaGuardarExportacionEuropastry', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  Archivo := Format(_('%s-%d-%s-%d_%s.csv'), [_('Pedido'), DMPedidosAProveedor.QMCabeceraEJERCICIO.AsInteger, DMPedidosAProveedor.QMCabeceraSERIE.AsString, DMPedidosAProveedor.QMCabeceraRIG.AsInteger, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'CSV', '', 'FMPedidosAProveedor') then
  begin
     EscribeDatoIni('FMPedidosAProveedor', 'UltimaRutaGuardarExportacionEuropastry', ExtractFilePath(Archivo));

     sl := TStringList.Create;
     try
        sl.Add(format('%s;%s;;', [DMMain.DameAlfaProveedor(DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger, 1), formatDateTime('dd/mm/yyyy', DMPedidosAProveedor.QMCabeceraFECHA.AsDateTime)]));

        DMPedidosAProveedor.QMDetalle.First;
        while not DMPedidosAProveedor.QMDetalle.EOF do
        begin
           sl.Add(format('%s;%d;%d;%d', [DMMain.DameAlfaArticulo(DMPedidosAProveedor.QMDetalleARTICULO.AsString, 3), Trunc(DMPedidosAProveedor.QMDetalleUNIDADES.AsFloat), 0, 0]));

           DMPedidosAProveedor.QMDetalle.Next;
        end;
        sl.SaveToFile(Archivo);
     finally
        sl.Free;
     end;
  end;
end;

end.
(*
Sincronizacion Nexmart
----------------------

*** Para Digital Domain (Evenlan).
*** En fase de pruebas.

Mediante CSV se extraen los datos de pedido a proveedor y se suben a FTP.
- Se deberá crear opción de configuración ara guardar datos de conexión FTP.
- Se deberá crear opción "Otros" -> "Exportación Nexmart"

SQL sin optimizar para extrar CSV:

SELECT C.EJERCICIO || '-' || C.SERIE || '/' || C.RIG NRO_PEDIDO,
       --
       (SELECT CODIGO_EDI
        FROM SYS_TERCEROS
        WHERE
        TERCERO = C.TERCERO) COD_PROVEEDOR,
       --
       COALESCE((SELECT CODIGO_PROVEEDOR
                 FROM ART_ARTICULOS_CODPROV
                 WHERE
                 EMPRESA = D.EMPRESA AND
                 ARTICULO = D.ARTICULO AND
                 PROVEEDOR = C.PROVEEDOR), '') REF_PROVEEDOR,
       --
       D.UNIDADES CANTIDAD,
       (SELECT BARRAS
        FROM ART_ARTICULOS_BARRAS
        WHERE
        EMPRESA = D.EMPRESA AND
        ARTICULO = D.ARTICULO AND
        TIPO = 3) EAN13,
       --
       CAST('-' AS VARCHAR(1)) UNIDAD, 
       D.TITULO DESCRIPCION, 
       D.PRECIO,
       CAST(SUBSTRING(NOTAS FROM 1 FOR 100) AS VARCHAR(100)) COMENTARIO_LINEA, 
       D.FECHA_PRE_DET,
       CAST(SUBSTRING(NOTAS FROM 1 FOR 100) AS VARCHAR(100)) DIRECCION, 
       CAST('' AS VARCHAR(5)) CODIGO_POSTAL,
       CAST('' AS VARCHAR(60)) MUNICIPIO, 
       CAST('' AS VARCHAR(60)) NOMBRE_CLIENTE,
       CAST('' AS VARCHAR(100)) EMAIL_CONFIRMACION
FROM VER_CABECERAS_PEDIDO_PROV C
JOIN VER_DETALLE_PEDIDO_PROV D ON C.ID_E = D.ID_E
WHERE
-- C.ID_E = 11525
-- C.PROVEEDOR = 7
C.EMPRESA = :EMPRESA AND
C.EJERCICIO = :EJERCICIO AND
C.CANAL = :CANAL AND
C.SERIE = :SERIE AND
C.TIPO = 'PEP' AND
C.RIG = :RIG
ORDER BY D.LINEA
*)