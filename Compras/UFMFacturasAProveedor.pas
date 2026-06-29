unit UFMFacturasAProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada,
  DbComboBoxValue, URecursos, ActnList, UFormGest, Variants, DB, rxPlacemnt,
  NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ULFActionList, ULFToolBar,
  ULFDBMemo, ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFPageControl,
  ULFPanel, ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, HYFIBQuery,
  ULFEdit, ULFDBDateEdit, ULFMemo, UFPEditDetalle, UG2kTBLoc, XMLIntf, XMLDoc,
  ULFDBComboBoxValue;

type
  TFMFacturasAProveedor = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PNLCabNotas: TLFPanel;
     LBLFactura: TLFLabel;
     DBERIG: TLFDbedit;
     LBLEstado: TLFLabel;
     LBLFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LBLProveedor: TLFLabel;
     PNLEdNotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     DBEDtoPP: TLFDbedit;
     LBLDtoPP: TLFLabel;
     PNLTitNotas: TLFPanel;
     DBENotasFechaCab: TLFDbedit;
     LBLFechaNotas: TLFLabel;
     DBENotasProveedorTituloCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     DBEDtoCial: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LBLDtoCial: TLFLabel;
     DBEFAlmacen: TLFDBEditFind2000;
     ETituloAlmacen: TLFEdit;
     LBLAlmacen: TLFLabel;
     DBETituloProveedor: TLFDbedit;
     DBEFProveedor: TLFDBEditFind2000;
     LBLNFactura: TLFLabel;
     DBENumFactura: TLFDbedit;
     LBLFormaPago: TLFLabel;
     DBEFFormaPago: TLFDBEditFind2000;
     ETituloFormaPago: TLFEdit;
     DBCBDevolucion: TLFDBCheckBox;
     DBCHKAbono: TLFDBCheckBox;
     ALFacturasProv: TLFActionList;
     ANotasDetalle: TAction;
     DBDTPFecha_Con: TLFDBDateEdit;
     LBLFecha_Con: TLFLabel;
     AUnidades_Ext: TAction;
     APreciosTarifa: TAction;
     AInfoStocks: TAction;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PNLPieGenerico: TLFPanel;
     LBLBImponible: TLFLabel;
     LBLIVARec: TLFLabel;
     LLiquido: TLFLabel;
     LTotal: TLFLabel;
     DBES_Bases: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBELiquido: TLFDbedit;
     DBETotal: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PNLPieComisiones: TLFPanel;
     LBLBaseDtoLinea: TLFLabel;
     LBLImporte: TLFLabel;
     LBLImpBase: TLFLabel;
     LImpFinanciacion: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBESumaBases: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     TButtSep8: TToolButton;
     TButtNotas: TToolButton;
     TButtUnidadesExt: TToolButton;
     TButtInfoStocks: TToolButton;
     TButtSep2: TToolButton;
     TButtImprimeListado: TToolButton;
     LBLSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtAbreCierra: TToolButton;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     TButtSerializacion: TToolButton;
     ASerializacion: TAction;
     ToolButton1: TToolButton;
     TButtBuscarNumSerie: TToolButton;
     ABuscarNumSerie: TAction;
     DBETituloEstado: TLFDbedit;
     SBVerRegistro: TSpeedButton;
     ARegistroIVA: TAction;
     SBVerAsiento: TSpeedButton;
     AAsientoFactura: TAction;
     DBERic: TLFDbedit;
     DBERegistro: TLFDbedit;
     LNumAsiento: TLFLabel;
     LblRegistro: TLFLabel;
     CEMainMIVerAsientoGenerado: TMenuItem;
     N1: TMenuItem;
     CEMainMIVerRegistrodeIVA: TMenuItem;
     ANIFFactura: TAction;
     CEMainMIDatosProveedor: TMenuItem;
     AImpresionAuto: TAction;
     DBCBForzarVencimientos: TLFDBCheckBox;
     AInfoHistorico: TAction;
     TButtInfoHistorico: TToolButton;
     TButtProcedencia: TToolButton;
     AProcedencia: TAction;
     TButtPrecios: TToolButton;
     ANewProveedor: TAction;
     ANewArticulo: TAction;
     AAProveedor: TAction;
     SBAProveedor: TSpeedButton;
     AImprime: TAction;
     MIVerDatosProveedor: TMenuItem;
     ACentroCoste: TAction;
     AInfoLotes: TAction;
     ToolButton2: TToolButton;
     TBInfoLotes: TToolButton;
     AArticulo: TAction;
     AArticuloProv: TAction;
     ToolButton3: TToolButton;
     TBArtProv: TToolButton;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     DBDTPHora_Con: TDBDateTimePicker;
     LBLNumFacturaNotas: TLFLabel;
     DBENotasNumFacturaCab: TLFDbedit;
     AInformeFacProv: TAction;
     AFacturasDiarias: TAction;
     AVisualizaFacturasFiltradas: TAction;
     AImprimeFacturasFiltradas: TAction;
     ASep: TAction;
     AResumenFacturas: TAction;
     AResumenFacturasFiltradas: TAction;
     AImpresionResumenFacturasFiltradas: TAction;
     ASep2: TAction;
     AListadoporArticulos: TAction;
     AListadoCodigosBarras: TAction;
     ASep3: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfInfFactura: TAction;
     AConfFacturasProv: TAction;
     AConfListadoCodigosBarras: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AAbrirCerrar: TAction;
     ASep4: TAction;
     ADuplicar: TAction;
     ARegeneraCond: TAction;
     ADevolucion: TAction;
     ACambiaFinanciacion: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ATipoIVA: TAction;
     AHerencia: TAction;
     AHistoricoSerializacion: TAction;
     ARecibos: TAction;
     LFCategoryAction4: TLFCategoryAction;
     LFechaEntrega: TLFLabel;
     DBDTPEntrega: TLFDBDateEdit;
     TButtUbicaciones: TToolButton;
     AUbicaciones: TAction;
     AEnvioFacturaMailPDF: TAction;
     ASep5: TAction;
     ALstUbicaciones: TAction;
     AConfigLstUbicaciones: TAction;
     AAnalitica: TAction;
     ETituloPortes: TLFEdit;
     DBEFPortes: TLFDBEditFind2000;
     LBTipo: TLFLabel;
     LBPorPortes: TLFLabel;
     LBIPOrtes: TLFLabel;
     DBEIPortes: TLFDbedit;
     DBEPorPortes: TLFDbedit;
     AOrdenaLineas: TAction;
     ASep6: TAction;
     AFacturaMulti: TAction;
     ABuscarArticulo: TAction;
     ToolButton4: TToolButton;
     TButtRecibosKri: TToolButton;
     TButtHerencia: TToolButton;
     TButtBuscarArticulo: TToolButton;
     DBCHKObligaAuto: TLFDBCheckBox;
     DBCBRec_Invisibles: TLFDBCheckBox;
     LBReferencia: TLFLabel;
     DBEReferencia: TLFDbedit;
     LFCategoryAction5: TLFCategoryAction;
     AAdjuntosFactura: TAction;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     AEnviarFacturaMailPDF2: TAction;
     DBDTPHora_Fac: TDBDateTimePicker;
     LNCF: TLFLabel;
     DBEIrpf: TLFDbedit;
     LBLIRPF: TLFLabel;
     LBLUnidades: TLFLabel;
     DBESumUnidades: TLFDbedit;
     LTelefono: TLFLabel;
     DBCBVTipoNCF: TDBLookupComboBox;
     DBEFPrefijoNCF: TLFDbedit;
     DBEContadorNCF: TLFDbedit;
     DBCHKListado: TLFDBCheckBox;
     AListarEtiquetas: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     LFechaSII: TLFLabel;
     DBDTPFechaSII: TLFDBDateEdit;
     ACondicionesCompra: TAction;
     TButtCondicionesCompra: TToolButton;
     EFBuscaNIFKRI: TLFEditFind2000;
     TButtBuscaNIFKRI: TToolButton;
     ABuscaNIFKRI: TAction;
     TSOtros: TTabSheet;
     PNLCabOtros: TLFPanel;
     PNLTitOtros: TLFPanel;
     LBLFechaOtros: TLFLabel;
     LBLRefOtros: TLFLabel;
     DBEOtrosFechaCab: TLFDbedit;
     DBEOtrosClienteTituloCab: TLFDbedit;
     DBEOtrosRIGCab: TLFDbedit;
     DBEOtrosSuReferenciaCab: TLFDbedit;
     NAVOtros: THYMNavigator;
     PNLEdOtros: TLFPanel;
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
     LPorFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     LBLProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     ETitMoneda: TLFEdit;
     DBCHKCambio: TLFDBCheckBox;
     LValorCambio: TLFLabel;
     DBEValorCambio: TLFDbedit;
     LTipoIRPF: TLFLabel;
     LBLIRPFFicha: TLFLabel;
     DBEPirpf: TLFDbedit;
     DBEAplicarIRPF: TLFDbedit;
     DBETitTIPOIRPF: TLFDbedit;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBCBRECC: TLFDBCheckBox;
     CBForzarModoIva: TLFDBCheckBox;
     EFModoIva: TLFDBEditFind2000;
     EModoIva: TLFEdit;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LblCartera: TLFLabel;
     DBERegistroCartera: TLFDbedit;
     SBVerCartera: TSpeedButton;
     ARegistroCartera: TAction;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     DBEAutorizacion: TLFDbedit;
     DBECodigoControl: TLFDbedit;
     LAutorizacion: TLFLabel;
     LCodigoControl: TLFLabel;
     DBEICE: TLFDbedit;
     LICE: TLFLabel;
     LCodigoRespuestaRapida: TLFLabel;
     DBECodigoRespuestaRapida: TLFDbedit;
     BCodigoRespuestaRapida: TButton;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     TButtImportarDetalle: TToolButton;
     AImportarDetalle: TAction;
     AConfFacturasProvporProv: TAction;
     AAsignacionCodigoBarra: TAction;
     AAnula: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     LEmail: TLFLabel;
     RelojEmail: TTimer;
     DBEImporteMinimoPorte: TLFDbedit;
     LImporteMinimoPorte: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     LTipo: TLFLabel;
     DBTRectificacion: TDBText;
     ACrearHerenciaManual: TAction;
     DBECuotaImpuestoAdic: TLFDbedit;
     DBEFolio: TLFDbedit;
     LFolio: TLFLabel;
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
     CategoryFiltros: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFiltroAbierto: TAction;
     AFiltroCerrado: TAction;
     LDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     AAsignaFolio: TAction;
     AImportaFacturaXml: TAction;
     LTipoDocumentoTributario: TLFLabel;
     DBEFTipoDocumentoTributario: TLFDBEditFind2000;
     ETipoDocumentoTributario: TLFEdit;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     EIdioma: TLFEdit;
     DBCBReciboPagado: TLFDBCheckBox;
     TSOtrosChile: TTabSheet;
     PEdOtrosChile: TLFPanel;
     GBReferenciasDte: TGroupBox;
     PNLReferenciasDteCab: TPanel;
     DBGReferenciasDte: TDBGridFind2000;
     LTpoDocRef: TLFLabel;
     LIdDocRef: TLFLabel;
     LRUTOtr: TLFLabel;
     LCodRef: TLFLabel;
     LRazonRef: TLFLabel;
     DBETpoDocRef: TLFDBEditFind2000;
     LFolioRef: TLFLabel;
     LFchRef: TLFLabel;
     DBEIdDocRef: TLFDbedit;
     DBERUTOtr: TLFDbedit;
     DBERazonRef: TLFDbedit;
     DBEFolioRef: TLFDbedit;
     DBDFchRef: TLFDBDateEdit;
     CBCodRef: TLFDBComboBoxValue;
     ETipoDocTribTitulo: TLFEdit;
     CEOtrosChilePMEdit: TPopUpTeclas;
     CEOtrosChile: TControlEdit;
     NavReferenciasDte: THYMNavigator;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     ABorradoMasivoLineas: TAction;
     DBDTPHora_Entrega: TDBDateTimePicker;
     LMotivoAbono: TLFLabel;
     DBEFMotivoAbono: TLFDBEditFind2000;
     EMotivoAbono: TLFEdit;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     LProyectoFicha: TLFLabel;
     DBEFProyectoFicha: TLFDBEditFind2000;
     EProyectoFicha: TLFEdit;
     TBEnviaECF: TToolButton;
     AEnviaECF: TAction;
     TSEnvioECF: TTabSheet;
     GBDatosEnvioECF: TGroupBox;
     GBDatosConsultaECF: TGroupBox;
     LIDEnvio: TLabel;
     LStatus: TLabel;
     LMensajeErrorEnvio: TLabel;
     LSecurityCode: TLabel;
     LENCF: TLabel;
     LStatusConsulta: TLabel;
     LTrackID: TLabel;
     LMensajeErrorConsulta: TLabel;
     LLegalStatus: TLabel;
     DBEIDEnvio: TLFDbedit;
     DBEStatus: TLFDbedit;
     DBEMensajeErrorEnvio: TLFDbedit;
     DBESecurityCode: TLFDbedit;
     DBEENCF: TLFDbedit;
     DBEStatusConsulta: TLFDbedit;
     DBETrackID: TLFDbedit;
     DBEMensajeErrorConsulta: TLFDbedit;
     CBSeqConsummed: TLFDBCheckBox;
     BtnConsultaEstadoECF: TSpeedButton;
     DBELegalStatus: TLFDbedit;
     LCodigoErrorEnvio: TLFLabel;
     DBECodErrorEnvio: TLFDbedit;
     LTipoRetencion: TLFLabel;
     DBEIdTipoRetencion: TLFDBEditFind2000;
     ETipoRetencionTitulo: TLFEdit;
     LPorcRetITBIS: TLFLabel;
     DBEPorcRetITBIS: TLFDbedit;
     LPorRecISR: TLFLabel;
     DBEPorRecISR: TLFDbedit;
     PNLPieInfo: TLFPanel;
     LCantLineas: TLFLabel;
     DBECantLineas: TLFDbedit;
     PNLPieInfoUnidades: TLFPanel;
     DBESumUdsLog: TLFDbedit;
     DBESumUdsSec: TLFDbedit;
     DBESumaPeso: TLFDbedit;
     LSumaPeso: TLFLabel;
     PNLInfoImportes: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EFDireccionBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EFSerieChange(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure FacProvFechasClick(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSTablaShow(Sender: TObject);
     procedure AUnidades_ExtExecute(Sender: TObject);
     procedure APreciosTarifaExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure DBGFDetalleExiste(Sender: TObject);
     procedure ABuscarNumSerieExecute(Sender: TObject);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure ARegistroIVAExecute(Sender: TObject);
     procedure SBVerRegistroDblClick(Sender: TObject);
     procedure AAsientoFacturaExecute(Sender: TObject);
     procedure SBVerAsientoDblClick(Sender: TObject);
     procedure ANIFFacturaExecute(Sender: TObject);
     procedure AImpresionAutoExecute(Sender: TObject);
     procedure AInfoHistoricoExecute(Sender: TObject);
     procedure AProcedenciaExecute(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewProveedorExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAProveedorExecute(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure DBETituloProveedorEnter(Sender: TObject);
     procedure ACentroCosteExecute(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AInfoLotesExecute(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AArticuloProvExecute(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure AInformeFacProvExecute(Sender: TObject);
     procedure AFacturasDiariasExecute(Sender: TObject);
     procedure AVisualizaFacturasFiltradasExecute(Sender: TObject);
     procedure AImprimeFacturasFiltradasExecute(Sender: TObject);
     procedure AResumenFacturasExecute(Sender: TObject);
     procedure AResumenFacturasFiltradasExecute(Sender: TObject);
     procedure AImpresionResumenFacturasFiltradasExecute(Sender: TObject);
     procedure AListadoporArticulosExecute(Sender: TObject);
     procedure AListadoCodigosBarrasExecute(Sender: TObject);
     procedure AConfInfFacturaExecute(Sender: TObject);
     procedure AConfFacturasProvExecute(Sender: TObject);
     procedure AConfListadoCodigosBarrasExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ARegeneraCondExecute(Sender: TObject);
     procedure ADevolucionExecute(Sender: TObject);
     procedure ACambiaFinanciacionExecute(Sender: TObject);
     procedure ATipoIVAExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure AHistoricoSerializacionExecute(Sender: TObject);
     procedure ARecibosExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AUbicacionesExecute(Sender: TObject);
     procedure AEnvioFacturaMailPDFExecute(Sender: TObject);
     procedure ALstUbicacionesExecute(Sender: TObject);
     procedure AConfigLstUbicacionesExecute(Sender: TObject);
     procedure DBDTPFechaExit(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure AFacturaMultiExecute(Sender: TObject);
     procedure DBDTPFechaChange(Sender: TObject);
     procedure DBDTPEntregaExit(Sender: TObject);
     procedure DBDTPFecha_ConExit(Sender: TObject);
     procedure AAnaliticaExecute(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AAdjuntosFacturaExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AEnviarFacturaMailPDF2Execute(Sender: TObject);
     procedure CBForzarModoIvaChange(Sender: TObject);
     procedure EFModoIvaChange(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBEFProveedorExiste(Sender: TObject);
     procedure DBCBVTipoNCFClick(Sender: TObject);
     procedure DBCBVTipoNCFEnter(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure EFProyectoChange(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure LBNotasClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure ACondicionesCompraExecute(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure ARegistroCarteraExecute(Sender: TObject);
     procedure SBVerCarteraDblClick(Sender: TObject);
     procedure DBERIGChange(Sender: TObject);
     procedure BCodigoRespuestaRapidaClick(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure AConfFacturasProvporProvExecute(Sender: TObject);
     procedure AAsignacionCodigoBarraExecute(Sender: TObject);
     procedure AAnulaExecute(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearHerenciaManualExecute(Sender: TObject);
     procedure DBEFFormaPagoChange(Sender: TObject);
     procedure DBGFDetalleColExit(Sender: TObject);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure AAsignaFolioExecute(Sender: TObject);
     procedure AImportaFacturaXmlExecute(Sender: TObject);
     procedure DBEFTipoDocumentoTributarioChange(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBEFPrefijoNCFChange(Sender: TObject);
     procedure DBEContadorNCFChange(Sender: TObject);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure DBEFMotivoAbonoChange(Sender: TObject);
     procedure AEnviaECFExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure TSEnvioECFShow(Sender: TObject);
     procedure TSOtrosChileShow(Sender: TObject);
     procedure BtnConsultaEstadoECFClick(Sender: TObject);
     procedure DBEIdTipoRetencionChange(Sender: TObject);
  private
     { Private declarations }
     param_FAPINSE001: boolean;
     Param_COMTIVA001: boolean;
     Param_ARTBUSQ004: boolean;
     NumSerie: string;
     ColActual: TColumn;
     editando: boolean;
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     DBGDetalleArticulo: string;
     procedure MuestraFiltrado(Tipo: byte);
     procedure MuestraInformesFiltrados(Tipo: byte);
     procedure HabilitaEnlaces;
     procedure HabilitaBotones;
     procedure AbreOCierra;
     procedure HabilitarNCF;
     {procedure HabilitaBotonesDetalle; dji lrk kri - TyC}
     {function EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint;Se define en UUtiles}
     procedure HabilitaCambioIVA;
     procedure CambiaColorImporteMinimoPorte;
     procedure LimitaComponentes;
     procedure LimitaSegunPais;
     procedure CambiaSerie(Serie: string);
     procedure BuscaTiposNCFSerie;
     function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
     procedure ValidaNCF;
     procedure RefrescaAvisos;
  public
     { Public declarations }
     FiltroListadoFiltrado: integer;
     procedure HabilitaBotonesDetalle;
     procedure HabilitaCambioFecha; {dji lrk kri}
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraFact(FiltroAccion: string);
     procedure FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
     procedure FiltraFacturacion(Serie: string; Contador: integer);
  end;

var
  FMFacturasAProveedor : TFMFacturasAProveedor;

procedure TraspasoFacturaProv(Serie: string; id_e: integer);

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UDMFacturasAProveedor,
  UDMLstFactura_Prov, UDMLstFacturaArt,
  UDMLstFacturaprovArt, UFMLSTEntrefechasart, UFMLSTEntrefechas,
  UFMNotasCampo, UFMCambiaFacProv, UFMListConfig, UDMLstInfFacProveedor,
  UFMDocInfoStocks, UFCHerenciaProv, UFMArtSerializacion, UFMHistoricoSerializacion,
  UFMBusquedaNumSerie, UFMain, UDMLstCBDocs,
  UFMProveedores, UFVerTercerosPorArticulo,
  UFSendCorreo, UDMListados, UDMLstUbicacionesC, UFPregEtiAlbaran,
  UFPregEtiVacias, UFPregNIFFACTURA, UFMTraspasoMultiCanal, UFMImputacionCostes,
  UFMAdjunto, UFMImprimirCodBarras, UParam, UFMCondicionesCompra, UFMSeleccion,
  UFMInsercionArticuloDesdeTexto, {$IFNDEF TPV}UFMAsignacionCodigoBarra,
  ZUFMAnulacionFacturas {$ENDIF}, UFMHerenciaManual, UFacturaElectronicaCL,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMSeleccionArticulo, UFMProcesosMasivosLineas,
  UDMENCFDOM, URellenaLista;

{$R *.DFM}

procedure TFMFacturasAProveedor.FormCreate(Sender: TObject);
var
  i : integer;
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
  AbreData(TDMFacturasAProveedor, DMFacturasAProveedor);

  NavMain.DataSource := DMFacturasAProveedor.DSQMCabecera;
  DBGMain.DataSource := DMFacturasAProveedor.DSQMCabecera;
  NavDetalle.DataSource := DMFacturasAProveedor.DSQMDetalle;
  DBGFDetalle.DataSource := DMFActurasAProveedor.DSQMDetalle;

  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMFActurasAProveedor.DSQMCabecera;
     Entorno := DMFActurasAProveedor.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
  end;

  {dji lrk kri}
  if REntorno.SerieRestringida <> '' then
     CambiaSerie(REntorno.SerieRestringida)
  else
     CambiaSerie(REntorno.Serie);

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;

  CEMainPMEdit.Teclas := DMMain.Teclas;
  CENotasPMEdit.Teclas := DMMain.Teclas;
  FiltroListadoFiltrado := 0;

  HabilitaEnlaces;
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  RefrescaAvisos;
  editando := False;

  // Limitamos componentes del formulario segun pais, por parametro y configuraciones
  LimitaComponentes;
  LimitaSegunPais;

  EFBuscaNIFKRI.Width := 1;
  EFBuscaNIFKRI.Visible := False;

  // Color campo ID
  ColorCampoID(DBERIG);
  ColorCampoID(EFSERIE);

  // Muestra tabla por defecto
  if (LeeParametro('DOCCONF001') = 'S') then
     PCMain.ActivePage := TSTabla;

  with DBGMain do
  begin
     i := CamposAMarcar.IndexOf('MODIFICA_DOC');
     if (i >= 0) and (CamposChecked.Count >= i - 1) then
        CamposChecked[i] := '32';
  end;

  AbreOCierra;
end;

procedure TFMFacturasAProveedor.LimitaComponentes;
var
  col : TColumn;
  i : integer;
begin
  if (DMMain.EstadoKri(152) <> 1) then
     AEnvioFacturaMailPDF.Visible := False;

  AAnalitica.Visible := DMMain.PuedeHacerImputaciones;
  ColActual := DBGFDetalle.Columns[0];

  // Elimino las acciones para ver adjuntos
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
     ANIFFactura.Enabled := False;

  // Habilita el envío de email con pdf a traves del cliente windows
  if (DMMain.EstadoKri(264) <> 1) then
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarFacturaMailPDF2) then
           ALMain.Actions[i].Free;

  // MODO IVA Modificable en Factura
  if (DMMain.EstadoKri(272) <> 1) then
  begin
     CBForzarModoIva.Visible := False;
     EFModoIva.Visible := False;
     EModoIva.Visible := False;
  end;

  if (DMMain.EstadoKri(401) = 0) then
  begin
     col := DBGFDetalle.FindColumn('CUENTA');
     if Assigned(col) then
        col.Visible := False;
     col := DBGFDetalle.FindColumn('TITULO_CUENTA');
     if Assigned(col) then
        col.Visible := False;
  end;

  // Limitaciones por configuracion
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

  TSDirEntrega.TabVisible := (LeeParametro('COMDIRM001') = 'S');

  DBDTPFechaSII.Visible := (LeeParametro('SIIFEC0001', '') = 'S');
  LFechaSII.Visible := (LeeParametro('SIIFEC0001', '') = 'S');

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
end;

procedure TFMFacturasAProveedor.LimitaSegunPais;
var
  i : integer;
begin
  // Latino
  if (DMMain.EstadoKri(410) <> 1) then
  begin
     // Elimino las acciones para Anular Factura
     for i := Self.ComponentCount - 1 downto 0 do
     begin
        if (Self.Components[i] is TAction) then
        begin
           if TAction(Self.Components[i]).Name = 'AAnula' then
              TAction(Self.Components[i]).Free;
        end;
     end;
  end;

  // Empresas Republica Dominicana
  if (REntorno.Pais <> 'DOM') then
  begin
     LNCF.Visible := False;
     DBEFPrefijoNCF.Visible := False;
     DBEContadorNCF.Visible := False;
     LTipo.Visible := False;
     DBEFTipo.Visible := False;
     DBCBVTipoNCF.Visible := False;
     GBDatosEnvioECF.Visible := False;
     TSEnvioECF.TabVisible := False;
     TBEnviaECF.Visible := False;
     AEnviaECF.Visible := False;
     LTipoRetencion.Visible := False;
     DBEIdTipoRetencion.Visible := False;
     ETipoRetencionTitulo.Visible := False;
     LPorcRetITBIS.Visible := False;
     DBEPorcRetITBIS.Visible := False;
     LPorRecISR.Visible := False;
     DBEPorRecISR.Visible := False;
  end;

  // Empresas Bolivianas
  if (REntorno.Pais <> 'BOL') then
  begin
     LAutorizacion.Visible := False;
     LCodigoControl.Visible := False;
     LCodigoRespuestaRapida.Visible := False;
     DBEAutorizacion.Visible := False;
     DBECodigoControl.Visible := False;
     DBECodigoRespuestaRapida.Visible := False;
     BCodigoRespuestaRapida.Visible := False;

     LICE.Visible := False;
     DBEICE.Visible := False;
     // Muevo campos a la izquierda
     LLiquido.Left := LICE.Left;
     DBELiquido.Left := LLiquido.Left + LLiquido.Width + 1;
     LTotal.Left := DBELiquido.Left + DBELiquido.Width + 1;
     DBETotal.Left := LTotal.Left + LTotal.Width + 1;
  end;

  // Empresas Chilenas
  if (REntorno.Pais <> 'CHL') then
  begin
     LFolio.Visible := False;
     DBEFolio.Visible := False;
     AAsignaFolio.Visible := False;
     AImportaFacturaXml.Visible := False;
     LTipoDocumentoTributario.Visible := False;
     DBEFTipoDocumentoTributario.Visible := False;
     ETipoDocumentoTributario.Visible := False;
     TSOtrosChile.TabVisible := False;
  end;
end;

procedure TFMFacturasAProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  MTelefonos.Free;
  MNotas.Free;
  CierraData(DMFacturasAProveedor);
  Action := caFree;
end;

procedure TFMFacturasAProveedor.DBGFDetalleBusqueda(Sender: TObject);
var
  Condicion : string;
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_COMPRAS') then
     begin
        if DBCHKAbono.Checked then
           Condicion := '='
        else
           Condicion := '<>';
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA' + Condicion + '''' + REntorno.FamSistema + '''';
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
     else if Trim(TablaABuscar) = 'ART_ARTICULOS_CODPROV' then
     begin
        if not DBCHKAbono.Checked then
           CondicionBusqueda :=
              'PROVEEDOR =' + IntToStr(DMFacturasAProveedor.QMCabeceraPROVEEDOR.AsInteger) +
              ' AND EMPRESA = ' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end
     else if Trim(TablaABuscar) = 'SYS_TIPO_IVA' then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IVA') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMFacturasAProveedor.QMDetalleTIPO_IVA.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else if Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL' then
     begin
        CondicionBusqueda := 'ACTIVO = 1 AND PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMFacturasAProveedor.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else if Trim(TablaABuscar) = 'EMP_PROYECTOS' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROYECTO';
     end
     else if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end
     else if Trim(TablaABuscar) = 'ART_ALMACENES' then
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
           '(ARTICULO=''' + DMFacturasAProveedor.QMDetalleARTICULO.AsString + ''')';
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
        if not DBCHKAbono.Checked then
           CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMFacturasAProveedor.EFDireccionBusqueda(Sender: TObject);
begin
  // EFDireccion.CondicionBusqueda:='TERCERO='+DMDocsFacturaAProv.QMCabeceraTERCERO.AsString;
end;

procedure TFMFacturasAProveedor.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMFacturasAProveedor.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMFacturasAProveedor.HabilitaCambioIVA;
begin
  ATipoIVA.Enabled := DMFacturasaProveedor.Habilitar_but_cambia_iva;
end;

procedure TFMFacturasAProveedor.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  // Se quita el filtro por Numero de Serie
  DMFacturasAProveedor.BuscaNumSerie(NumSerie, False);
  TButtBuscarNumSerie.Down := False;

  Resultado := DMFacturasAProveedor.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;

  Continua := False;

  HabilitaBotones;
  RefrescaAvisos;
  PCMainChange(Sender);
end;

procedure TFMFacturasAProveedor.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  d_rig : integer;
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
  // bit 6 = 0 --> Facturas a Prov. restringidas
  if (((REntorno.RestriccionDocumento and 32) = 0) and
     ((DMFacturasAProveedor.xInfoActualizadaMODIFICA_DOC.AsInteger and 32) = 32)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if Button = nbEdit then
  begin
     if not DMFacturasAProveedor.HayDetalle then
        DBCHKAbono.Enabled := False
     else
        DBCHKAbono.Enabled := True;
  end;

  HabilitaCambioFecha; {dji lrk kri}

  if Button in [nbPost, nbDelete, nbCancel] then
  begin
     HabilitaBotones;
     HabilitaCambioIVA;
  end;

  {dji lrk kri}
  if ((Button in [nbInsert]) and (REntorno.AlmacenRestringido <> '')) then
     DBEFAlmacen.Text := REntorno.AlmacenRestringido;

  RefrescaAvisos;
  // Facturas de Rectificacion
  if (Button = nbInsert) then
     if es_serie_rectificacion(EFSerie.Text) then
        if (DMFacturasAProveedor.CreaFacturaRectificacion(EFSerie.Text, d_rig)) then
           FiltraFactura(REntorno.Ejercicio, EFSerie.Text, d_rig);
end;

procedure TFMFacturasAProveedor.MuestraFiltrado(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMFacturasAProveedor.QMCabecera.SelectSQL);
     AbreData(TDMLstFactura_Prov, DMLstFactura_Prov);
     with DMLstFactura_Prov do
     begin
        TempSql.AddStrings(QMCabecera.SelectSQL);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(SqlFiltro);

        // Utilizo la vista para listado
        QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_FACTURA_PROV', 'VER_CABECERAS_FACTURA_PROV_LST', [rfReplaceAll]);

        QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
        MostrarListadoFiltrado(Tipo, FiltroListadoFiltrado, EFSerie.Text);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMLstFactura_Prov);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
  RefrescaAvisos;
end;

procedure TFMFacturasAProveedor.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMFacturasAProveedor.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  // Edicion de IVA habilitada en documentos de venta
  Param_COMTIVA001 := (LeeParametro('COMTIVA001', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');

  param_FAPINSE001 := (LeeParametro('FAPINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_FAPINSE001;
  DBERIG.ReadOnly := not param_FAPINSE001;

  HabilitaBotones;
  HabilitaCambioFecha; {dji lrk kri}

  if (REntorno.Pais = 'DOM') then
     BuscaTiposNCFSerie;
end;

procedure TFMFacturasAProveedor.ANotasDetalleExecute(Sender: TObject);
begin
  DMFacturasAProveedor.PreparaNotasDetalle;
  // DMFacturasAProveedor.NotasLote := True;
  EditarCampoNotas(Self, DMFacturasAProveedor.DSQMDetalle,
     DMFacturasAProveedor.QMDetalle.FieldByName('NOTAS'), DMFacturasAProveedor.QMDetalle.FieldByName('NOTAS2'), (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMFacturasAProveedor.FacProvFechasClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFacturaProvArt, DMLstFactura_Prov);
  TFMListConfig.Create(Self).Muestra(41, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstFactura_Prov.frFactura);
  CierraData(DMLstFactura_Prov);
end;

procedure TFMFacturasAProveedor.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if not (Button in [nbPost, nbDelete, nbCancel]) then
     HabilitaCambioIVA;

  HabilitaBotonesDetalle;

  if Button in [nbRefresh] then
     DMFacturasAProveedor.RellenaDatosOldLinea;
end;

procedure TFMFacturasAProveedor.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (editando) then
     DMFacturasAProveedor.RefrescaTabla;
end;

procedure TFMFacturasAProveedor.AUnidades_ExtExecute(Sender: TObject);
begin
  if DBGFDetalle.SelectedField.DisplayName = 'UNIDADES' then
     DBGFDetalle.SelectedIndex := DBGFDetalle.SelectedIndex + 1;

  DMFacturasaProveedor.CambiaUnidadesExt(DMFacturasaProveedor.QMDetalle.FieldByName('ARTICULO'), True);
end;

procedure TFMFacturasAProveedor.APreciosTarifaExecute(Sender: TObject);
begin
  DMFacturasAProveedor.CambiaPreciosTarifa;
end;

procedure TFMFacturasAProveedor.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     DMFacturasAProveedor.BorraLineaExt;
  if Button = nbDelete then
     DMFacturasAProveedor.ControlaRestriccion;
end;

procedure TFMFacturasAProveedor.AInfoStocksExecute(Sender: TObject);
var
  Almacen, Articulo : string;
begin
  DMFacturasAProveedor.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMFacturasAProveedor.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;

  with DBGFDetalle do
  begin
     if ((SelectedField.FieldName = 'ARTICULO') or (SelectedField.FieldName = 'CUENTA')) then
     begin
        DBGDetalleArticulo := '';
        FMain.AddComponentePunto(DBGFDetalle);
     end
     else
        FMain.DelComponentePunto(DBGFDetalle);

     SalirSiNoExiste := (SelectedField.FieldName = 'CUENTA');
     BuscarNums := not ((ColumnaActual = 'TIPO_IVA') or (ColumnaActual = 'PROYECTO'));
  end;
end;

procedure TFMFacturasAProveedor.ASerializacionExecute(Sender: TObject);
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado, Devolucion : integer;
  Ejercicio : smallint;
  Fecha : TDateTime;
  Unidades : double;
begin
  DMFacturasAProveedor.PreparaSerializacion;
  if not DMFacturasAProveedor.Serializado then
     ShowMessage(_('El artículo no está serializado'))
  else
  begin
     DMFacturasAProveedor.DatosSerializacion(Ejercicio, Serie, Tipo, Almacen,
        Articulo, Rig, Linea, Devolucion, Fecha, Unidades, Estado);
     MuestraSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig, Linea,
        Devolucion, Fecha, Unidades, Estado, Self);
  end;
end;

procedure TFMFacturasAProveedor.DBGFDetalleCampoDevuelve(Sender: TObject; Valor: string);
begin
  {
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMFacturasAProveedor.BusquedaArticulo(Valor);
  DMFacturasAProveedor.Continua;
  }
end;

procedure TFMFacturasAProveedor.DBGFDetalleExiste(Sender: TObject);
begin
  if DBGFDetalle.ColumnaActual = 'ARTICULO' then
     DMFacturasaProveedor.VaciaNumSerie;
end;

procedure TFMFacturasAProveedor.ABuscarNumSerieExecute(Sender: TObject);
var
  FMBusquedaNumSerie : TFMBusquedaNumSerie;
begin
  if (TButtBuscarNumSerie.Down) then
  begin
     FMBusquedaNumSerie := TFMBusquedaNumSerie.Create(Self);
     if (FMBusquedaNumSerie.ShowModal = mrOk) then
     begin
        NumSerie := FMBusquedaNumSerie.EFNumSerie.Text;
        if (NumSerie <> '') then
        begin
           DMFacturasAProveedor.Filtrado := False;
           DMFacturasAProveedor.BuscaNumSerie(NumSerie, True);
        end;
     end;
  end
  else
     DMFacturasAProveedor.BuscaNumSerie(NumSerie, False);
  try
     TButtBuscarNumSerie.Down := False;
  finally
  end;

  HabilitaBotones;
end;

procedure TFMFacturasAProveedor.NavDetalleChangeState(Sender: TObject);
begin
  {if DMFacturasAproveedor.Inhabilitar then
    begin
    TButtNotas.Enabled          := False;
    TButtInfoStocks.Enabled     := True;
    TButtProcedencia.Enabled    := False;
    TButtUnidadesExt.Enabled    := False;
    TButtPrecios.Enabled        := True;
    TButtInfoHistorico.Enabled  := True;
    TButtSerializacion.Enabled := False;
    TBInfolotes.Enabled        := False;
    TBArtProv.Enabled           := True;
    TButtUbicaciones.Enabled    := True;
    TButtBuscarArticulo.Enabled := False;
    AOrdenaLineas.Enabled       := True;
  end;}

  HabilitaBotonesDetalle;

  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

procedure TFMFacturasAProveedor.FiltraFacturacion(Serie: string; Contador: integer);
begin
  // Abrimos las facturas destino de la facturación de albaranes o recepcion de pedidos
  CambiaSerie(Serie);
  DMFacturasAProveedor.FiltraFacturacion(Serie, Contador);
  RefrescaAvisos;
  PCMainChange(nil);
end;

procedure TraspasoFacturaProv(Serie: string; id_e: integer);
begin
  FMain.EjecutaAccion(FMain.AFacturasProv);
  FMain.TraspasodeDocumentosEntrada(id_e);
end;

procedure TFMFacturasAProveedor.ARegistroIVAExecute(Sender: TObject);
begin
  if DMFacturasAProveedor.QMCabeceraESTADO.AsInteger = 5 then
     FMain.MuestraIVA('EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + DMFacturasAProveedor.DameEjercicio + ' AND CANAL=' + REntorno.CanalStr + ' AND REGISTRO=' + DMFacturasAProveedor.ObtieneRegistroIVA, 'S');
end;

procedure TFMFacturasAProveedor.SBVerRegistroDblClick(Sender: TObject);
begin
  ARegistroIVA.Execute;
end;

procedure TFMFacturasAProveedor.AAsientoFacturaExecute(Sender: TObject);
begin
  if (DMFacturasAProveedor.QMCabeceraESTADO.AsInteger = 5) then
     FMain.MuestraMovConta(' RIC= ' +
        DMFacturasAProveedor.ObtieneAsiento + ' and ejercicio=' +
        DMFacturasAProveedor.Dameejercicio);
end;

procedure TFMFacturasAProveedor.SBVerAsientoDblClick(Sender: TObject);
begin
  AAsientoFactura.Execute;
end;

procedure TFMFacturasAProveedor.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  CambiaSerie(Serie);
  DMFacturasAProveedor.FiltraCabecera(Ejercicio, Serie, Rig);
  HabilitaBotones;
  RefrescaAvisos;
  PCMainChange(nil);
end;

procedure TFMFacturasAProveedor.ANIFFacturaExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFACTURA;
begin
  DMFacturasAProveedor.AbreQMNif;
  if DMFacturasAProveedor.DameDatosProveedor then
  begin
     FPregDatos := TFPregNIFFACTURA.Create(Self);
     FPregDatos.Inicializa(DMFacturasAProveedor.DSQMNIF, _('Datos del Proveedor'), DMFacturasAProveedor.EstadoDocumento);
     DMFacturasAProveedor.GrabaDatosProveedor(FPregDatos.ShowModal);
     FreeAndNil(FPregDatos);
  end;
  DMFacturasAProveedor.CierraQMNif;
  DMFacturasAProveedor.RefrescaCabecera(1);
end;

procedure TFMFacturasAProveedor.AImpresionAutoExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
  DMLstInfFacProveedor.MostrarInforme(EFSerie.Text,
     DMFacturasAProveedor.QMCabeceraRIG.AsInteger,
     DMFacturasAProveedor.QMCabeceraID_E.AsInteger,
     1, DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstInfFacProveedor);
end;

procedure TFMFacturasAProveedor.AInfoHistoricoExecute(Sender: TObject);
begin
  DMFacturasAProveedor.Historico;
end;

procedure TFMFacturasAProveedor.AProcedenciaExecute(Sender: TObject);
begin
  DMFacturasAProveedor.Procedencia;
end;

procedure TFMFacturasAProveedor.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);

  DMFacturasAProveedor.MascarasMoneda;
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

procedure TFMFacturasAProveedor.MuestraInformesFiltrados(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMFacturasAProveedor.QMCabecera.SelectSQL);
     AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
     with DMLstInfFacProveedor do
     begin
        TempSql.AddStrings(QMCabecera.SelectSQL);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(SqlFiltro);

        // Utilizo la vista para listado
        StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_FACTURA_PROV', 'VER_CABECERAS_FACTURA_PROV_LST', [rfReplaceAll]);

        QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;

        MostrarInformesFiltrados(Tipo, FiltroListadoFiltrado, EFSerie.Text);

        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMLstInfFacProveedor);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMFacturasAProveedor.ANewProveedorExecute(Sender: TObject);
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
     DBEFAlmacen.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMFacturasAProveedor.ANewArticuloExecute(Sender: TObject);
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
        DMFacturasAProveedor.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMFacturasAProveedor.AAProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFProveedor.Text <> '' then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DBEFProveedor.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMFacturasAProveedor.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMFacturasAProveedor.SBAProveedorDblClick(Sender: TObject);
begin
  AAProveedor.Execute;
end;

procedure TFMFacturasAProveedor.HabilitaEnlaces;
begin
  SolapaControles(SBVerRegistro, DBERegistro);
  SolapaControles(SBVerAsiento, DBERIC);
  SolapaControles(SBVerCartera, DBERegistroCartera);
  DBERic.Color := REntorno.ColorEnlaceActivo;
  DBERegistro.Color := REntorno.ColorEnlaceActivo;
  DBERegistroCartera.Color := REntorno.ColorEnlaceActivo;

  if (FMain.AProveedores.Enabled = False) then
  begin
     DBEFProveedor.Accion := nil;
     SBAProveedor.Width := 0;
     MIVerDatosProveedor.Visible := False;
  end
  else
  begin
     SolapaControles(SBAProveedor, DBETituloProveedor);
     DBETituloProveedor.Color := REntorno.ColorEnlaceActivo;
  end;

  ETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, ETitProyecto);
end;

procedure TFMFacturasAProveedor.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
  DMLstInfFacProveedor.MostrarInforme(EFSerie.Text,
     DMFacturasAProveedor.QMCabeceraRIG.AsInteger,
     DMFacturasAProveedor.QMCabeceraID_E.AsInteger,
     1, DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstInfFacProveedor);
end;

procedure TFMFacturasAProveedor.DBETituloProveedorEnter(Sender: TObject);
begin
  DBEFProveedor.SetFocus;
end;

procedure TFMFacturasAProveedor.ACentroCosteExecute(Sender: TObject);
begin
  DMFacturasAProveedor.PedirCentroCoste;
end;

procedure TFMFacturasAProveedor.DBGFDetalleRowChange(Sender: TObject);
begin
  DBGDetalleArticulo := '';
  CambiaColorImporteMinimoPorte;
  // dji lrk kri Acá tengo que ver si la cuenta tiene Centro de Costos.
  // ACentroCosteExecute(Sender);
end;

procedure TFMFacturasAProveedor.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbInsert) then
     DBCHKAbono.Enabled := True;

  if ((Button = nbDelete) and (DMFacturasAProveedor.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMFacturasAProveedor.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (DMFacturasAProveedor.QMDetalle.State = dsInsert) then
  begin
     HabilitaBotonesDetalle;
     HabilitaCambioIVA;
  end
  else if (DMFacturasAProveedor.QMDetalle.State = dsBrowse) then
     HabilitaCambioIVA;
end;

procedure TFMFacturasAProveedor.HabilitaBotones;
var
  Habil : boolean;
begin
  Habil := DMFacturasAProveedor.HayDocumentos;

  AAbrirCerrar.Enabled := Habil;
  ADuplicar.Enabled := Habil;
  ARegeneraCond.Enabled := Habil;
  ADevolucion.Enabled := Habil;
  ACambiaFinanciacion.Enabled := Habil;
  AHerencia.Enabled := Habil;
  AHistoricoSerializacion.Enabled := Habil;
  ARecibos.Enabled := Habil;
  {dji lrk kri}
  if REntorno.SerieRestringida <> '' then
     EFSerie.Enabled := False;
  if REntorno.AlmacenRestringido <> '' then
     DBEFAlmacen.Enabled := False;
end;

procedure TFMFacturasAProveedor.AbreOCierra;
begin
  if (DMFacturasAProveedor.EstadoDocumento = 5) then
  begin
     TButtAbreCierra.Hint := _('Desbloquea la Factura actual');
     TButtAbreCierra.ImageIndex := 67;
     TButtAbreCierra.Tag := 1;
     AAbrirCerrar.Hint := _('Desbloquea la Factura actual');
     AAbrirCerrar.ImageIndex := 67;
     AAbrirCerrar.Tag := 1;
     AAbrirCerrar.Caption := _('Abrir Factura');
  end
  else
  begin
     TButtAbreCierra.Hint := _('Bloquea la Factura actual');
     TButtAbreCierra.ImageIndex := 68;
     TButtAbreCierra.Tag := 0;
     AAbrirCerrar.Hint := _('Bloquea la Factura actual');
     AAbrirCerrar.ImageIndex := 68;
     AAbrirCerrar.Tag := 0;
     AAbrirCerrar.Caption := _('Cerrar Factura');
  end;

  HabilitaBotonesDetalle;

  ColorSegunEstado(DBETituloEstado, DMFacturasAProveedor.QMCabeceraESTADO.AsInteger);
end;

procedure TFMFacturasAProveedor.HabilitaBotonesDetalle;
var
  Habil, HabilEd : boolean;

begin
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMFacturasAProveedor.HayDetalle) or (DMFacturasAProveedor.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMFacturasAProveedor.QMDetalle.State in [dsInsert, dsEdit]);

  TButtNotas.Enabled := HabilEd;
  TButtHerencia.Enabled := Habil;
  TButtInfoStocks.Enabled := Habil;
  TButtProcedencia.Enabled := HabilEd;
  TButtUnidadesExt.Enabled := HabilEd;
  TButtPrecios.Enabled := Habil;
  TButtInfoHistorico.Enabled := Habil;
  TButtSerializacion.Enabled := HabilEd;
  TBInfolotes.Enabled := HabilEd;
  AOrdenaLineas.Enabled := Habil;
  TButtUbicaciones.Enabled := Habil;
  TBArtProv.Enabled := Habil;
  TButtBuscarArticulo.Enabled := True;  // Siempre Activo
  TButtImportarDetalle.Enabled := True;  // Siempre Activo

  if (DMFacturasAProveedor.QMDetalle.State in [dsInsert, dsBrowse]) then
     HabilitaCambioIVA;

  // En el caso del Tipo de IVA tenemos que ver el parámetro COMTIVA001
  HabilitaColumna(DBGFDetalle, 'TIPO_IVA', Param_COMTIVA001);
end;

procedure TFMFacturasAProveedor.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMFacturasAProveedor.AInfoLotesExecute(Sender: TObject);
begin
  DMFacturasAproveedor.InfoLotes;
end;

procedure TFMFacturasAProveedor.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMFacturasAProveedor.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMFacturasAProveedor.DBGFDetalleDblClick(Sender: TObject);
begin
  if DMFacturasAProveedor.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;
  end;
end;

procedure TFMFacturasAProveedor.AArticuloProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMFacturasAProveedor.QMDetalleARTICULO.AsString, 0);
end;

procedure TFMFacturasAProveedor.HabilitaCambioFecha;
begin
  {dji lrk kri - Para que no se pueda cambiar la fecha de una factura con moneda
               diferente de la de la empresa. Tema cambio}
  {Sacado a Pedido del contable 10/04/2002
   if REntorno.MonedaEmpresa = DMFacturasAProveedor.QMCabeceraMONEDA.AsString then
   begin
      DBDTPFecha.Enabled := True;
      DBDTPFecha_Con.Enabled := True;
      DBDTPHora_Con.Enabled := True;
   end else
   begin
      DBDTPFecha.Enabled := False;
      DBDTPFecha_Con.Enabled := False;
      DBDTPHora_Con.Enabled := False;
   end;}
end;

procedure TFMFacturasAProveedor.RelojNotasTimer(Sender: TObject);
begin
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMFacturasAProveedor.AInformeFacProvExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
  AInformeFacProv.Enabled := False;
  try
     DMLstInfFacProveedor.MostrarInforme(EFSerie.Text,
        DMFacturasAProveedor.QMCabeceraRIG.AsInteger,
        DMFacturasAProveedor.QMCabeceraID_E.AsInteger,
        0, DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger);
  finally
     AInformeFacProv.Enabled := True;
     CierraData(DMLstInfFacProveedor);
  end;

  // Refresco valor de check del estado listado
  DMFacturasAProveedor.InfoActualiza;
end;

procedure TFMFacturasAProveedor.AFacturasDiariasExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
  DMLstInfFacProveedor.MostrarListadoDiario(EFSerie.Text);
  CierraData(DMLstInfFacProveedor);
end;

procedure TFMFacturasAProveedor.AVisualizaFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraInformesFiltrados(0);
end;

procedure TFMFacturasAProveedor.AImprimeFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraInformesFiltrados(1);
end;

procedure TFMFacturasAProveedor.AResumenFacturasExecute(Sender: TObject);
begin
  AbreData(TDMLstFactura_Prov, DMLstFactura_Prov);
  TFMLSTEntrefechas.Create(Self).muestra('FAP', EFSerie.Text);
  CierraData(DMLstFactura_Prov);
end;

procedure TFMFacturasAProveedor.AResumenFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMFacturasAProveedor.AImpresionResumenFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMFacturasAProveedor.AListadoporArticulosExecute(Sender: TObject);
begin
  AbreData(TDMLstFacturaProvArt, DMLstFacturaProvArt);
  TFMLstEntrefechasart.Create(Self).Muestra('FAP', EFSerie.Text, DBEFAlmacen.Text);
  CierraData(DMLstFacturaProvArt);
end;

procedure TFMFacturasAProveedor.AListadoCodigosBarrasExecute(Sender: TObject);
begin
  AbreData(TDMLstCBDocs, DMLstCBDocs);

  DMLstCBDocs.Eti_Vacias := TFPregEtiVacias.Create(Self).Muestra;

  DMLstCBDocs.MostrarListadoCB(DMFacturasAProveedor.QMCabeceraEMPRESA.AsInteger,
     DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger,
     DMFacturasAProveedor.QMCabeceraCANAL.AsInteger,
     DMFacturasAProveedor.QMCabeceraRIG.AsInteger,
     DMFacturasAProveedor.QMCabeceraSERIE.AsString,
     DMFacturasAProveedor.QMCabeceraTIPO.AsString, 0);

  CierraData(DMLstCBDocs);
end;

procedure TFMFacturasAProveedor.AConfInfFacturaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
  TFMListConfig.Create(Self).Muestra(73, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstInfFacProveedor.frFactura, DMLstInfFacProveedor.HYReport);
  CierraData(DMLstInfFacProveedor);
end;

procedure TFMFacturasAProveedor.AConfFacturasProvExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFactura_Prov, DMLstFactura_Prov);
  TFMListConfig.Create(Self).Muestra(41, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstFactura_Prov.frFactura);
  CierraData(DMLstFactura_Prov);
end;

procedure TFMFacturasAProveedor.AConfListadoCodigosBarrasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstCBDocs, DMLstCBDocs);
  TFMListConfig.Create(Self).Muestra(96, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstCBDocs.frCodBarras);
  CierraData(DMLstCBDocs);
end;

procedure TFMFacturasAProveedor.AAbrirCerrarExecute(Sender: TObject);
begin
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        if (TButtAbreCierra.Tag = 0) then
           DMFacturasAProveedor.BloqueaFactura
        else if ConfirmaGrave then
           DMFacturasAProveedor.DesbloqueaFactura;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMFacturasAProveedor.ADuplicarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMFacturasaProveedor.Duplica;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMFacturasAProveedor.ARegeneraCondExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Proveedor-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMFacturasAProveedor.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMFacturasAProveedor.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMFacturasAProveedor.ActualizaCondicionesProv(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMFacturasAProveedor.ADevolucionExecute(Sender: TObject);
var
  SerieDestino : string;
begin
  SerieDestino := DMFacturasAProveedor.QMCabeceraSERIE.AsString;
  if PideDato('SER', SerieDestino) then
  begin
     try
        Screen.Cursor := crHourGlass;
        DMFacturasAProveedor.Devuelve(SerieDestino);
     finally
        Screen.Cursor := crDefault;
     end;

     if (SerieDestino <> DMFacturasAProveedor.QMCabeceraSERIE.AsString) then
     begin
        EFSerie.Text := SerieDestino;
        DMFacturasAProveedor.QMCabecera.Last;
     end;
  end;
end;

procedure TFMFacturasAProveedor.ACambiaFinanciacionExecute(Sender: TObject);
begin
  DMFacturasAProveedor.CambiaFinanciacion;
end;

procedure TFMFacturasAProveedor.ATipoIVAExecute(Sender: TObject);
begin
  TFMCambiaFacProv.Create(Self).muestra(DMFacturasAProveedor.QMCabeceraID_E.AsInteger);
  DMFacturasaProveedor.QMCabecera.Refresh;
end;

procedure TFMFacturasAProveedor.AHerenciaExecute(Sender: TObject);
var
  rig, ejercicio : integer;
  Tipo, num_factura, titulo, serie : string;
begin
  DMFacturasAProveedor.DatosHerencia(rig, ejercicio, Tipo, num_factura, titulo, serie);
  MuestraHerencia(rig, ejercicio, Tipo, num_factura, titulo, serie, Self);
end;

procedure TFMFacturasAProveedor.AHistoricoSerializacionExecute(Sender: TObject);
begin
  HistoricoSerie(Self);
end;

procedure TFMFacturasAProveedor.ARecibosExecute(Sender: TObject);
begin
  if (DMFacturasAProveedor.DameEstado = 5) then
     FMain.MuestraRecibos('FAP', EFSerie.Text, DBERIG.Text,
        DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger);
end;

procedure TFMFacturasAProveedor.FormShow(Sender: TObject);
var
  i : smallint;
begin
  HabilitaBotones;

  // Forzamos un primer refresco para que el navegador cambie si el usuario tiene documentos restringidos.
  NavMainClickAfterAdjust(Sender, nbRefresh);

  //  Habilita;

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
  //i := EncuentraField(DBGFDetalle, 'UNIDADES');
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
  //i := EncuentraField(DBGFDetalle, 'UNIDADES_SEC');
  // DBGFDetalle.Columns.Items[i].Visible := REntorno.PVP_Ud_Sec;
  if (LeeParametro('COMUSEC002', EFSerie.Text) <> '') then
     DBGFDetalle.FindColumn('UNIDADES_SEC').Title.Caption := LeeParametro('COMUSEC002', EFSerie.Text);

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
  begin
     if (EncuentraField(DBGFDetalle, Format('ALFA_%d', [i])) >= 0) then
        DBGFDetalle.FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  // Importe ICE solo visible en Bolivia
  i := EncuentraField(DBGFDetalle, 'IMPORTE_ICE');
  if (i >= 0) then
     DBGFDetalle.Columns[i].Visible := (REntorno.Pais = 'BOL');
end;

procedure TFMFacturasAProveedor.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMFacturasAProveedor.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);
  end;
end;

procedure TFMFacturasAProveedor.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMFacturasAProveedor.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavNotas.SetFocus;
  {dji lrk kri - para que se pueda poner simbolo Euros en las notas}
  if Button = nbEdit then
     AUnidades_Ext.ShortCut := 0;
  if Button = nbPost then
     AUnidades_Ext.ShortCut := TextToShortCut('Ctrl+Alt+E');
end;

procedure TFMFacturasAProveedor.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if button = nbDelete then
     DMFacturasAProveedor.ControlaRestriccion;
  if button in [nbEdit] then
     editando := True
  else
     editando := False;
end;

procedure TFMFacturasAProveedor.AUbicacionesExecute(Sender: TObject);
begin
  DMFacturasAProveedor.MuestraUbicacion;
end;

procedure TFMFacturasAProveedor.AEnvioFacturaMailPDFExecute(Sender: TObject);
var
  Asunto : string;
  DMLstInfFacProveedorCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // esto es porque el assigned no va

  DMLstInfFacProveedorCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la factura por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
           DMLstInfFacProveedorCargado := True;

           DMLstInfFacProveedor.MostrarListadoMail(DMFacturasAProveedor.QMCabeceraID_E.AsInteger,
              DMFacturasAProveedor.QMCabeceraSERIE.AsString, 2, DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger);

           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;

           FSendCorreo.Texto(_('Enviando Mensaje  ...'));

           InicializaVariableEmail(DMFacturasAProveedor.QMCabeceraTIPO.AsString);
           with VariableEmail do
           begin
              Ejercicio := DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger;
              Serie := DMFacturasAProveedor.QMCabeceraSERIE.AsString;
              NumeroDocumento := DMFacturasAProveedor.QMCabeceraRIG.AsInteger;
              Fecha := DMFacturasAProveedor.QMCabeceraFECHA.AsDateTime;
              SuReferencia := DMFacturasAProveedor.QMCabeceraSU_REFERENCIA.AsString;
              SuPedido := '';
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := DMLstInfFacProveedor.nombreFich;
              Matricula := '';
              if (DMFacturasAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
              begin
                 NombreComercial := DMFacturasAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
                 RazonSocial := DMFacturasAProveedor.QMCabeceraTITULO.AsString;
              end
              else
              begin
                 // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                 NombreComercial := DMFacturasAProveedor.QMCabeceraTITULO.AsString;
                 RazonSocial := DMFacturasAProveedor.QMCabeceraTITULO.AsString;
              end;
              OrdenTrabajo := 0;
              IdOrdenTrabajo := 0;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturasAProveedor.QMCabeceraENTRADA.AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);
           try
              DMListados.SendMailTerceroPDF(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger, CuerpoMail,
                 DMLstInfFacProveedor.rutaFich, DMLstInfFacProveedor.nombreFich, Asunto, DMFacturasAProveedor.QMCabecera.FieldByName('TIPO').AsString, DMFacturasAProveedor.QMCabecera.FieldByName('ID_E').AsInteger);
           finally
              CuerpoMail.Free;
           end;
           CierraData(DMLstInfFacProveedor);
           DMLstInfFacProveedorCargado := False;
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
           if DMLstInfFacProveedorCargado then
              CierraData(DMLstInfFacProveedor);
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
  // Refresco valor de check del estado listado
  DMFacturasAProveedor.InfoActualiza;
end;

procedure TFMFacturasAProveedor.ALstUbicacionesExecute(Sender: TObject);
begin
  AbreData(TDMLstUbicacionesC, DMLstUbicacionesC);
  DMLstUbicacionesC.MostrarListadoUbicaciones(DMFacturasAProveedor.QMCabecera.FieldByName('ID_E').AsInteger,
     DMFacturasAProveedor.QMCabecera.FieldByName('TIPO').AsString, 0);
  CierraData(DMLstUbicacionesC);
end;

procedure TFMFacturasAProveedor.AConfigLstUbicacionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstUbicacionesC, DMLstUbicacionesC);
  DMLstUbicacionesC.ConfiguraListado(DMFacturasaProveedor.QMCabeceraTIPO.AsString);
  TFMListConfig.Create(Self).Muestra(192, Formato, Cabecera, Copias, Pijama, EFSerie.Text,
     DMLstUbicacionesC.frUbicaciones);
  CierraData(DMLstUbicacionesC);
end;

procedure TFMFacturasAProveedor.DBDTPFechaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMFacturasAProveedor.DBDTPFechaChange(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMFacturasAProveedor.DBDTPEntregaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPEntrega.Date := DMMain.ValidaVersionDemoKri(DBDTPEntrega.Date);
end;

procedure TFMFacturasAProveedor.DBDTPFecha_ConExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha_Con.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha_Con.Date);
end;

procedure TFMFacturasAProveedor.DBEFPortesChange(Sender: TObject);
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
           DBEIPortes.DataSource := DMFacturasAProveedor.DSQMCabecera;
        end;
     end;

     DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
     DBEPorPortes.TabStop := DBEPorPortes.Enabled;
     DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
     DBEIPortes.TabStop := DBEIPortes.Enabled;
  end;
end;

procedure TFMFacturasAProveedor.AOrdenaLineasExecute(Sender: TObject);
begin
  DMFacturasAProveedor.OrdenarLineas;
end;

procedure TFMFacturasAProveedor.AFacturaMultiExecute(Sender: TObject);
var
  Accion : integer;
begin
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(nil);
  Accion := FMTraspasoMultiCanal.Carga(DMFacturasAProveedor.QMCabeceraID_E.AsInteger, DMFacturasAProveedor.QMCabeceraRIG.AsInteger,
     DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger, DMFacturasAProveedor.QMCabeceraCANAL.AsInteger, 0,
     DMFacturasAProveedor.QMCabeceraTIPO.AsString, DMFacturasAProveedor.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);
  DMFacturasAProveedor.RefrescaCabecera(Accion);
end;

procedure TFMFacturasAProveedor.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMFacturasAProveedor.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMFacturasAProveedor.FiltraFact(FiltroAccion: string);
begin
  DMFacturasAProveedor.QMCabecera.Close;
  FMFacturasAProveedor.TSTabla.Show;
  DMFacturasAProveedor.FiltraFact(FiltroAccion);
  RefrescaAvisos;
end;

procedure TFMFacturasAProveedor.AAnaliticaExecute(Sender: TObject);
begin
  DMFacturasAProveedor.ApunteAnalitico(False);
end;

procedure TFMFacturasAProveedor.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMFacturasAProveedor.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

{Se define en UUtiles
function TFMFacturasAProveedor.EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint;
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
procedure TFMFacturasAProveedor.ABuscarArticuloExecute(Sender: TObject);
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

  DMFacturasAProveedor.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMFacturasAProveedor.EFProyectoBusqueda(Sender: TObject);
begin
  EFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMFacturasAProveedor.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(DBGDetalleArticulo, False, True) then
        begin
           DMFacturasAProveedor.QMDetalle.Edit;
           DMFacturasAProveedor.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMFacturasAProveedor.FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
begin
  CambiaSerie(Serie);
  DMFacturasAProveedor.FiltraProveedorKri(Ejercicio, Serie, Proveedor, Estado);
  RefrescaAvisos;
  PCMainChange(nil);
end;

procedure TFMFacturasAProveedor.AAdjuntosFacturaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('FAP', DMFacturasAProveedor.QMCabeceraID_E.AsInteger);
end;

procedure TFMFacturasAProveedor.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', DameIDProveedor(DMFacturasAProveedor.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMFacturasAProveedor.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMFacturasAProveedor.AEnviarFacturaMailPDF2Execute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
  try
     Memo := TStringList.Create;
     try
        DMLstInfFacProveedor.MostrarListadoMail(DMFacturasAProveedor.QMCabeceraID_E.AsInteger,
           DMFacturasAProveedor.QMCabeceraSERIE.AsString, 2, DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger);

        InicializaVariableEmail(DMFacturasAProveedor.QMCabeceraTIPO.AsString);
        with VariableEmail do
        begin
           Ejercicio := DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger;
           Serie := DMFacturasAProveedor.QMCabeceraSERIE.AsString;
           NumeroDocumento := DMFacturasAProveedor.QMCabeceraRIG.AsInteger;
           Fecha := DMFacturasAProveedor.QMCabeceraFECHA.AsDateTime;
           SuReferencia := DMFacturasAProveedor.QMCabeceraSU_REFERENCIA.AsString;
           SuPedido := '';
           Folio := '';
           TituloDocTributario := '';
           NombreFichero := DMLstInfFacProveedor.nombreFich;
           Matricula := '';
           if (DMFacturasAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
           begin
              NombreComercial := DMFacturasAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
              RazonSocial := DMFacturasAProveedor.QMCabeceraTITULO.AsString;
           end
           else
           begin
              // El campo TITULO se rellena con el nombre asignado al Tercero Vario
              NombreComercial := DMFacturasAProveedor.QMCabeceraTITULO.AsString;
              RazonSocial := DMFacturasAProveedor.QMCabeceraTITULO.AsString;
           end;
           OrdenTrabajo := 0;
           UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturasAProveedor.QMCabeceraENTRADA.AsInteger));
        end;
        DamePartesEmail(Asunto, CuerpoMail);
        try
           DMListados.SendMailTerceroPDF(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger, CuerpoMail,
              DMLstInfFacProveedor.rutaFich, DMLstInfFacProveedor.nombreFich, Asunto, DMFacturasAProveedor.QMCabecera.FieldByName('TIPO').AsString, DMFacturasAProveedor.QMCabecera.FieldByName('ID_E').AsInteger);
        finally
           CuerpoMail.Free;
        end;
        try
           DMListados.SendMailTerceroPDF2(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger, CuerpoMail,
              DMLstInfFacProveedor.rutaFich, DMLstInfFacProveedor.nombreFich, Asunto, DMFacturasAProveedor.QMCabeceraTIPO.AsString, DMFacturasAProveedor.QMCabeceraID_E.AsInteger, True);
        finally
           CuerpoMail.Free;
        end;
     finally
        Memo.Free;
     end;

     // Marco el documento como listado
     DMLstInfFacProveedor.UpdateaDocumentos;
  finally
     CierraData(DMLstInfFacProveedor);
  end;

  // Refresco valor de check del estado listado
  DMFacturasAProveedor.InfoActualiza;
end;
// sfg_XGM-end- especial abrir cliente de correo predeterminado

procedure TFMFacturasAProveedor.CBForzarModoIvaChange(Sender: TObject);
begin
  if (TLFDBCheckBox(Sender).Checked) then
  begin
     EFModoIva.Visible := True;
     EModoIva.Visible := True;
  end
  else
  begin
     EFModoIva.Visible := False;
     EModoIva.Visible := False;
  end;
end;

procedure TFMFacturasAProveedor.EFModoIvaChange(Sender: TObject);
begin
  EModoIva.Text := DameTituloModoIVA(StrToIntDef(EFModoIva.Text, -1));
end;

procedure TFMFacturasAProveedor.DBEFProveedorChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMFacturasAProveedor.DBEFProveedorExiste(Sender: TObject);
begin
  if (not DMMain.ProveedorValido(StrToIntDef(DBEFProveedor.Text, 0))) then
     DBEFProveedor.Text := '';
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMFacturasAProveedor.HabilitarNCF;
begin
  if (((DMFacturasAProveedor.QMCabeceraZ_TIPO_NCF.AsInteger >= 11) and (DMFacturasAProveedor.QMCabeceraZ_TIPO_NCF.AsInteger <= 13)) or (DMFacturasAProveedor.QMCabeceraZ_TIPO_NCF.AsInteger = 17)) then
  begin
     DBEFPrefijoNCF.Enabled := False;
     DBEContadorNCF.Enabled := False;
     ColorInfo(DBEFPrefijoNCF);
     ColorInfo(DBEContadorNCF);
  end
  else
  begin
     DBEFPrefijoNCF.Enabled := True;
     DBEContadorNCF.Enabled := True;
     {
     ColorEdicion(DBEFPrefijoNCF);
     ColorEdicion(DBEContadorNCF);
     }
     ValidaNCF;
  end;
end;

procedure TFMFacturasAProveedor.DBCBVTipoNCFClick(Sender: TObject);
begin
  HabilitarNCF;
end;

procedure TFMFacturasAProveedor.DBCBVTipoNCFEnter(Sender: TObject);
begin
  HabilitarNCF;
end;

procedure TFMFacturasAProveedor.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMFacturasAProveedor.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMFacturasAProveedor.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMFacturasAProveedor.DBEFAlmacenChange(Sender: TObject);
begin
  ETituloAlmacen.Text := DameTituloAlmacen(DBEFAlmacen.Text);
end;

procedure TFMFacturasAProveedor.EFProyectoChange(Sender: TObject);
begin
  if (Sender = DBEFProyectoFicha) then
     EProyectoFicha.Text := DameTituloProyecto(StrToIntDef(DBEFProyectoFicha.Text, 0))
  else
     ETitProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFMFacturasAProveedor.AListarEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos(DMFacturasAProveedor.QMCabeceraTIPO.AsString, DMFacturasAProveedor.QMCabeceraID_E.AsInteger);
end;

procedure TFMFacturasAProveedor.ADuplicarLineaExecute(Sender: TObject);
begin
  DMFacturasAProveedor.DuplicarLinea;
end;

procedure TFMFacturasAProveedor.LBNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMFacturasAProveedor.xProveedor.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMFacturasAProveedor.xProveedor.FieldByName('NOTAS').AsString);
        {
        if (Trim(DMFacturasAProveedor.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMFacturasAProveedor.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        }
        if (Trim(DMFacturasAProveedor.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMFacturasAProveedor.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMFacturasAProveedor.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMFacturasAProveedor.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';

  G2KTableLoc.Click;

  HabilitaBotones;
  RefrescaAvisos;
  PCMainChange(Sender);
end;

procedure TFMFacturasAProveedor.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMFacturasAProveedor.ACondicionesCompraExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMCondicionesCompra, FMCondicionesCompra);
  with FMCondicionesCompra do
  begin
     EFProveedor.Text := DBEFProveedor.Text;
     EFFiltroArticulo.Text := DMFacturasAProveedor.QMDetalleARTICULO.AsString;
     EFFiltroFamilia.Text := DMFacturasAProveedor.xArticulos.FieldByName('FAMILIA').AsString;
     EFFiltroArticuloPorPrecio.Text := DMFacturasAProveedor.QMDetalleARTICULO.AsString;
     EFFiltraFamiliaPorPrecio.Text := DMFacturasAProveedor.xArticulos.FieldByName('FAMILIA').AsString;
  end;
end;

procedure TFMFacturasAProveedor.EFBuscaNIFKRIChange(Sender: TObject);
begin
  if (StrToIntDef(EFBuscaNIFKRI.Text, 0) <> 0) then
     with DMFacturasAProveedor.QMCabecera do
     begin
        DisableControls;
        First;
        while ((DMFacturasAProveedor.QMCabeceraID_E.AsInteger <> StrToIntDef(EFBuscaNIFKRI.Text, 0)) and (not DMFacturasAProveedor.QMCabecera.EOF)) do
           Next;
        EnableControls;
     end;
end;

procedure TFMFacturasAProveedor.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'tipo=''FAP'' and serie=''' + EFSerie.Text + '''';
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

procedure TFMFacturasAProveedor.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  inherited;
  with DBGFDetalle.SelectedField do
  begin
     if FieldName = 'CUENTA' then
        AsString := ExpandirCadena(Trim(AsString), REntorno.DigitosSub);
  end;

  Continuar := True;
end;

procedure TFMFacturasAProveedor.ARegistroCarteraExecute(Sender: TObject);
begin
  inherited;
  if (DMFacturasAProveedor.QMCabeceraREGISTRO_CARTERA.AsInteger <> 0) then
  begin
     FMain.MuestraCartera(DMFacturasAProveedor.QMCabeceraEJERCICIO.AsInteger, REntorno.Canal, 'P', DMFacturasAProveedor.QMCabeceraREGISTRO_CARTERA.AsInteger);
  end;
end;

procedure TFMFacturasAProveedor.SBVerCarteraDblClick(Sender: TObject);
begin
  inherited;
  ARegistroCartera.Execute;
end;

procedure TFMFacturasAProveedor.DBERIGChange(Sender: TObject);
begin
  inherited;
  CambiaColorImporteMinimoPorte;
end;

procedure TFMFacturasAProveedor.BCodigoRespuestaRapidaClick(Sender: TObject);
var
  s : string;
  Dato : string;
  p : integer;
  i : integer;
  aux : integer;
begin
  inherited;
  s := DMFacturasAProveedor.QMCabeceraSFV_CODIGO_CONTROL.AsString;

  // Numero de campo de la cadena
  i := 0;
  // Busco posicion de divisor
  p := Pos('|', s);
  while (p <> 0) do
  begin
     // Trato datos del campo
     Inc(i);
     Dato := Copy(s, 1, p);
     case i of
        1: // NIT
        begin
           aux := DMMain.DameTerceroNIF(Dato);
           if (aux = 0) then
              ShowMessage(Format('No hay tercero con NIF %s', [Dato]))
           else
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT PROVEEDOR FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND TERCERO = ?TERCERO';
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['TERCERO'].AsInteger := aux;
                    ExecQuery;
                    aux := FieldByName['PROVEEDOR'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
                 if (aux = 0) then
                    ShowMessage(Format('El tercero con NIF %s no es proveedor', [Dato]))
                 else
                    DMFacturasAProveedor.QMCabeceraPROVEEDOR.AsInteger := aux;
              end;
           end;
        end;
        2: // Numero de Factura
        begin
           // Quizas deba ser Copy(Dato, 1, *40*)
           DMFacturasAProveedor.QMCabeceraNUM_FACTURA.AsString := Copy(Dato, 1, 15);
        end;
        3: // Numero de Autorizacion
        begin
           DMFacturasAProveedor.QMCabeceraSFV_AUTORIZACION.AsString := Copy(Dato, 1, 20);
        end;
        4: // Fecha de Emision
        begin
           DMFacturasAProveedor.QMCabeceraFECHA.AsDateTime := EncodeDate(StrToIntDef(Copy(Dato, 7, 4), 0), StrToIntDef(Copy(Dato, 4, 2), 0), StrToIntDef(Copy(Dato, 1, 2), 0));
        end;
        5: // Total
        begin
           // Comparamos si el importe de la factura es distinto de 0 
           if (DMFacturasAProveedor.QMCabeceraLIQUIDO.AsFloat <> 0) then
              if (Abs(DMFacturasAProveedor.QMCabeceraLIQUIDO.AsFloat - StrToFloat(Dato)) > 0.01) then
                 ShowMessage(Format('El total de la factura y el del codigo QR no coinciden (%s)', [Dato]));
        end;
        6: // Importe base para el credito fiscal
        begin

        end;
        7: // Codigo de Control
        begin
           DMFacturasAProveedor.QMCabeceraSFV_CODIGO_CONTROL.AsString := Copy(Dato, 1, 20);
        end;
        8: // NIT / CI / CEX Comprador
        begin
           if (Dato <> REntorno.CifEmpresa) then
              ShowMessage(Format('El NIT / CI / CEX informado no es el de la empresa (%s)', [Dato]));
        end;
        9: // Importe ICE / IEHD / TASAS
        begin

        end;
        10: // Importe por ventas no Gravadas o Graadas a Tasa Cerp
        begin

        end;
        11: // Importe no Sujeto a Credito Fiscal
        begin

        end;
        12: // Descuentos, Bonificaciones y Rebajas
        begin

        end;
     end;
     // Me quedo con el resto de la cadena
     s := Copy(s, 1, p + 1);
     // Busco posicion de divisor
     p := Pos('|', s);
  end;
end;

procedure TFMFacturasAProveedor.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMFacturasAProveedor.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMFacturasAProveedor.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMFacturasAProveedor;
     ShowModal;
     Free;
  end;
end;

procedure TFMFacturasAProveedor.AConfFacturasProvporProvExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFactura_Prov, DMLstFactura_Prov);
  TFMListConfig.Create(Self).Muestra(541, formato, cabecera, copias, pijama, EFSerie.Text, DMLstFactura_Prov.frFactura);
  CierraData(DMLstFactura_Prov);
end;

procedure TFMFacturasAProveedor.AAsignacionCodigoBarraExecute(Sender: TObject);
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
  with DMFacturasAProveedor.QMDetalle do
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

           Posicionar(DMFacturasAProveedor.QMDetalle, 'ID_DETALLES_E', IdDetallesE);
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

procedure TFMFacturasAProveedor.AAnulaExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMAnulacionFacturas, ZFMAnulacionFacturas, Sender);
  ZFMAnulacionFacturas.Muestra(DMFacturasAProveedor.QMCabeceraID_E.AsInteger, DMFacturasAProveedor.QMCabeceraTIPO.AsString);
  DMFacturasAProveedor.RefrescaCabecera(2);
end;

procedure TFMFacturasAProveedor.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMFacturasAProveedor.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMFacturasAProveedor.CambiaColorImporteMinimoPorte;
var
  ImporteMinimoPortes : double;
  Resaltado : boolean;
begin
  // Si el tipo de porte es 2, ponemos en colorin el importe minimo de porte
  Resaltado := False;
  if (DMFacturasAProveedor.xProveedor.Active) then
  begin
     ImporteMinimoPortes := DMFacturasAProveedor.xProveedor.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat;
     if ((ImporteMinimoPortes > 0) and (DMFacturasAProveedor.xInfoActualizadaS_BASES.AsFloat >= ImporteMinimoPortes)) then
        Resaltado := True;
  end;

  if Resaltado then
     ColorResaltado2(DBEImporteMinimoPorte)
  else
     ColorInfo(DBEImporteMinimoPorte);
end;

procedure TFMFacturasAProveedor.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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

procedure TFMFacturasAProveedor.ACrearHerenciaManualExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMFacturasAProveedor.QMDetalleTIPO.AsString, DMFacturasAProveedor.QMDetalleID_DETALLES_E.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMFacturasAProveedor.BuscaTiposNCFSerie;
var
  TipoNcf : integer;
begin
  TipoNcf := DMFacturasAProveedor.DameTipoNCFSerie(EFSerie.Text);

  with DMFacturasAProveedor.xTipoNCF do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM Z_SYS_TIPO_NCF ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO_DOCUMENTO IN (0, 1) ');
     if (TipoNcf > 0) then
        SelectSQL.Add(' AND TIPO_NCF = ' + IntToStr(TipoNcf));
     SelectSQL.Add(' ORDER BY TIPO_NCF ');
     Open;
  end;
end;

procedure TFMFacturasAProveedor.CambiaSerie(Serie: string);
begin
  EFSerie.Text := Serie;
  EFSerieChange(nil);
end;

procedure TFMFacturasAProveedor.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

procedure TFMFacturasAProveedor.DBGFDetalleColExit(Sender: TObject);
begin
  inherited;
  with DBGFDetalle.SelectedField do
  begin
     if FieldName = 'CUENTA' then
        AsString := ExpandirCadena(Trim(AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMFacturasAProveedor.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAProveedor.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMFacturasAProveedor.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 0');
end;

procedure TFMFacturasAProveedor.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 5');
end;

procedure TFMFacturasAProveedor.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + DMFacturasAProveedor.QMCabeceraTERCERO.AsString;
end;

procedure TFMFacturasAProveedor.AAsignaFolioExecute(Sender: TObject);
var
  Archivo, Folio : string;
  RutEmisor, RutReceptor{, TipoDTE} : string;
  NumeroLineas : integer;
  MntNeto, MntTotal {, TotalImporteIVA, TotalImporteDescuentoLineas, TotalFactura} : double;
  Documento : TXMLDocument;
  i : integer;
  Nodo, NodoPadre : IXMLNode;
  Seguir, Editando : boolean;
begin
  Archivo := '';
  Seguir := True;
  Folio := '';

  if (DMFacturasAProveedor.QMCabeceraESTADO.AsInteger <> 0) then
     ShowMessage(_('No se puede asignar numero de folio a un documento que no esta abierto'))
  else
  if (DMFacturasAProveedor.QMCabeceraFOLIO.AsString <> '') then
     ShowMessage(_('El documento ya tiene un folio asignado'))
  else
  begin
     if MyOpenDialog(Archivo, 'XML', '', 'FMFacturasAProveedor-AAsignaFolio') then
     begin
        Documento := TXMLDocument.Create(Self);
        with Documento do
        begin
           XML.LoadFromFile(Archivo);

           DMMain.Log('Documento.Active := True');
           // Se activa para poder utilizar el componente
           Active := True;

           DMMain.Log('Documento.Encoding = utf-8');
           // Codigifacion UTF-8
           Encoding := 'utf-8';

           DMMain.Log('Documento.NodeIndentStr = #8');
           // Caracter para indentar el fichero XML
           NodeIndentStr := #8;

           DMMain.Log('Obtener nodos');
           // Verificamos RUT del emisor
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'Caratula', 'RutEmisor']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RutEmisor')) then
              RutEmisor := NodoPadre.Text
           else
           begin
              Seguir := False;
              ShowMessage(_('No se encontro el RUT del Emisor en el XML'));
           end;

           if Seguir and (RutEmisor <> DMFacturasAProveedor.xProveedor.FieldByName('NIF').AsString) then
              Seguir := ConfirmaMensaje(format(_('El RUT del Emisor es distinto al del proveedor' + #13#10 + 'RUT Emisor: %s' + #13#10 + 'RUT Proveedo: %s'), [RutEmisor, DMFacturasAProveedor.xProveedor.FieldByName('NIF').AsString]));

           if (Seguir) then
           begin
              // Verificamos RUT del Receptor
              NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'Caratula', 'RutReceptor']);
              if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RutReceptor')) then
                 RutReceptor := NodoPadre.Text
              else
              begin
                 Seguir := False;
                 ShowMessage(_('No se encontro el RUT del Receptor en el XML'));
              end;

              if Seguir and (RutReceptor <> REntorno.CifEmpresa) then
                 Seguir := ConfirmaMensaje(format(_('El RUT del Receptor es diferente al de la empresa' + #13#10 + 'RUT Receptor: %s'), [RutReceptor]));
           end;

           {
           if (Seguir) then
           begin
              // Verificamos el tipo de DTE
              NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'TipoDTE']);
              if (Assigned(NodoPadre) AND (NodoPadre.NodeName = 'TipoDTE')) then
                 TipoDTE := NodoPadre.Text
              else
              begin
                 Seguir := False;
                 ShowMessage(_('No se encontro el Tipo DTE en el XML'));
              end;

              if Seguir and (TipoDTE <>... ) then
                 Seguir := ConfirmaMensaje(format(_('El Tipo DTE es incorrecto'+#13#10+'Tipo DTE: %s'), [TipoDTE]));
           end;
           }

           if (Seguir) then
           begin
              NumeroLineas := 0;
              // Verificamos numero de lineas de detalle
              NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento']);
              if Assigned(NodoPadre) then
              begin
                 for i := 0 to NodoPadre.ChildNodes.Count - 1 do
                 begin
                    Nodo := NodoPadre.ChildNodes[i];
                    if Assigned(Nodo) then
                    begin
                       if (Nodo.NodeName = 'Detalle') then
                          NumeroLineas := NumeroLineas + 1;
                    end;
                 end;
              end;

              if Seguir and (NumeroLineas <> DMFacturasAProveedor.QMDetalle.RecordCount) then
                 Seguir := ConfirmaMensaje(format(_('El numero de lineas del detalle no coinciden con en el XML' + #13#10 + 'Lineas XML: %d' + #13#10 + 'Lineas Documento: %d'), [NumeroLineas, DMFacturasAProveedor.QMDetalle.RecordCount]));
           end;

           if (Seguir) then
           begin
              // Verificamos que el monto neto
              MntNeto := 0;
              NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntNeto']);
              if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntNeto')) then
                 MntNeto := StrToFloat(NodoPadre.Text)
              else
              begin
                 Seguir := False;
                 ShowMessage(_('No se encontro el Monto neto en el XML'));
              end;

              if Seguir and (Abs(MntNeto - DMFacturasAProveedor.xInfoActualizadaS_BASES.AsFloat) > 1) then
                 Seguir := ConfirmaMensaje(format(_('El Monto neto no coincide con el documento' + #13#10 + 'Monto Neto: %s'), [FormatFloat(DMMain.MascaraMoneda(DMFacturasAProveedor.QMCabeceraMONEDA.AsString, 1), MntNeto)]));
           end;

           if (Seguir) then
           begin
              // Verificamos el monto total
              MntTotal := 0;
              NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntTotal']);
              if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntTotal')) then
                 MntTotal := StrToFloat(NodoPadre.Text)
              else
              begin
                 Seguir := False;
                 ShowMessage(_('No se encontro el Monto total en el XML'));
              end;

              if Seguir and (Abs(MntTotal - DMFacturasAProveedor.xInfoActualizadaTOTAL_FACTURA.AsFloat) > 1) then
                 Seguir := ConfirmaMensaje(format(_('El Monto total no coincide con el documento' + #13#10 + 'Monto Neto: %s'), [FormatFloat(DMMain.MascaraMoneda(DMFacturasAProveedor.QMCabeceraMONEDA.AsString, 1), MntTotal)]));
           end;

           if (Seguir) then
           begin
              // Verificamos el folio
              NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'Folio']);
              if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'Folio')) then
                 Folio := NodoPadre.Text
              else
              begin
                 Seguir := False;
                 ShowMessage(_('No se encontro el Folio en el XML'));
              end;

              if Seguir and (Folio = '') then
              begin
                 Seguir := False;
                 ShowMessage(format(_('El numero de Folio es incorrecto' + #13#10 + 'Foliio: "%s"'), [NodoPadre.Text]));
              end;
           end;

           if (Seguir) then
           begin
              // Asignamos folio
              Editando := (DMFacturasAProveedor.QMCabecera.State in [dsInsert, dsEdit]);
              if not Editando then
                 DMFacturasAProveedor.QMCabecera.Edit;

              DMFacturasAProveedor.QMCabeceraFOLIO.AsString := Folio;

              if not Editando then
                 DMFacturasAProveedor.QMCabecera.Post;
           end;
        end;
     end;
  end;
end;

function TFMFacturasAProveedor.DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
var
  i : integer;
begin
  Result := nil;
  i := 0;
  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  Result := Nodo;
end;

procedure TFMFacturasAProveedor.AImportaFacturaXmlExecute(Sender: TObject);
var
  Log : TStrings;
  // RutaFicheroLog : string;
  Archivo : string;
begin
  if MyOpenDialog(Archivo, 'XML', '', 'FMFacturasAProveedor-ImportaFacturaXml') then
  begin
     Log := TStringList.Create;
     try
        DMFacturasAProveedor.ImportaXML(Archivo, Log);
        ShowMessage(Log.Text);
        {
        // Mostramos resumen  de la importacion en fichero temporal
        RutaFicheroLog := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'Importacion_DTE_Compras_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log';
        Log.SaveToFile(RutaFicheroLog);
        DMMain.AbrirArchivo(RutaFicheroLog);
        }
     finally
        Log.Free;
     end;
  end;
end;

procedure TFMFacturasAProveedor.DBEFTipoDocumentoTributarioChange(Sender: TObject);
begin
  inherited;
  ETipoDocumentoTributario.Text := DameTituloTipoDocTributario(DBEFTipoDocumentoTributario.Text);
end;

procedure TFMFacturasAProveedor.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  EIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMFacturasAProveedor.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('FAP', DMFacturasAProveedor.QMCabeceraID_E.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosFactura.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMFacturasAProveedor.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
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

procedure TFMFacturasAProveedor.DBEFPrefijoNCFChange(Sender: TObject);
begin
  inherited;
  ValidaNCF;
end;

procedure TFMFacturasAProveedor.DBEContadorNCFChange(Sender: TObject);
begin
  inherited;
  ValidaNCF;
end;

procedure TFMFacturasAProveedor.ValidaNCF;
var
  NCF : string;
begin
  inherited;
  NCF := Trim(DBEFPrefijoNCF.Text) + Trim(DBEContadorNCF.Text);

  if ((Trim(DBEFPrefijoNCF.Text) = 'B01') and (Length(NCF) <> 11)) then
  begin
     ColorError(DBEFPrefijoNCF);
     ColorError(DBEContadorNCF);
  end
  else
  if ((Trim(DBEFPrefijoNCF.Text) = 'E01') and (Length(NCF) <> 13)) then
  begin
     ColorError(DBEFPrefijoNCF);
     ColorError(DBEContadorNCF);
  end
  else
  begin
     ColorEdicion(DBEFPrefijoNCF);
     ColorEdicion(DBEContadorNCF);
  end;
end;

procedure TFMFacturasAProveedor.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMFacturasAProveedor.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMFacturasAProveedor.QMDetalleTIPO.AsString, DMFacturasAProveedor.QMDetalleID_E.AsInteger);

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
                 Params.ByName['ID_E'].AsInteger := DMFacturasAProveedor.QMDetalleID_E.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMFacturasAProveedor.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMFacturasAProveedor.RefrescaAvisos;
begin
  if (((DMFacturasAProveedor.xProveedor.Active) and (Trim(DMFacturasAProveedor.xProveedor.FieldByName('NOTAS').AsString) > '')) or
     ((DMFacturasAProveedor.xAvisos.Active) and (Trim(DMFacturasAProveedor.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
     RelojNotas.Enabled := True
  else
     RelojNotas.Enabled := False;
  LBNotas.Visible := RelojNotas.Enabled;

  if (DMMain.ExisteAdjunto(DMFacturasAProveedor.QMCabeceraTIPO.AsString, DMFacturasAProveedor.QMCabeceraID_E.AsInteger)) then
     RelojAdjuntos.Enabled := True
  else
     RelojAdjuntos.Enabled := False;

  LAdjuntos.Visible := RelojAdjuntos.Enabled;

  if (DMMain.EnviarFacturasProvAcrePorEmail(DMFacturasAProveedor.QMCabeceraTERCERO.AsInteger)) then
     RelojEmail.Enabled := True
  else
     RelojEmail.Enabled := False;

  LEmail.Visible := RelojEmail.Enabled;
end;

procedure TFMFacturasAProveedor.DBEFMotivoAbonoChange(Sender: TObject);
begin
  inherited;
  EMotivoAbono.Text := DMMain.DameMotivoAbono(StrToIntDef(DBEFMotivoAbono.Text, 0));
end;

procedure TFMFacturasAProveedor.AEnviaECFExecute(Sender: TObject);
begin
  inherited;
  if (REntorno.Pais = 'DOM') then
  begin
     if (DMFacturasAProveedor.DocumentoEcfValido) then
     begin
        AbreData(TDMENCFDOM, DMENCFDOM);
        try
           DMENCFDOM.EnviaEcf(DMFacturasAProveedor.QMCabeceraID_E.AsInteger, False);
        finally
           CierraData(DMENCFDOM);
        end;
        DMFacturasAProveedor.QMCabecera.Refresh;
     end;
  end;
end;

procedure TFMFacturasAProveedor.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSEnvioECF) then
  begin
     DMFacturasAProveedor.AbreDatosEnviosECF;
  end;

  if (PCMain.ActivePage <> TSEnvioECF) then
  begin
     DMFacturasAProveedor.CierraDatosEnviosECF;
  end;

  if (PCMain.ActivePage = TSOtrosChile) then
  begin
     DMFacturasAProveedor.AbreDatosDTE;
  end;

  if (PCMain.ActivePage <> TSOtrosChile) then
  begin
     DMFacturasAProveedor.CierraDatosDTE;
  end;
end;

procedure TFMFacturasAProveedor.TSEnvioECFShow(Sender: TObject);
begin
  inherited;
  DMFacturasAProveedor.AbreDatosEnviosECF;
end;

procedure TFMFacturasAProveedor.TSOtrosChileShow(Sender: TObject);
begin
  inherited;
  DMFacturasAProveedor.AbreDatosDTE;
end;

procedure TFMFacturasAProveedor.BtnConsultaEstadoECFClick(Sender: TObject);
begin
  inherited;
  if ((DMFacturasAProveedor.xFacturaCompraDGIIID_ENVIO.AsString > '') and (DMFacturasAProveedor.xFacturaCompraDGIITRACK_ID.AsString = '')) then
  begin
     AbreData(TDMENCFDOM, DMENCFDOM);
     try
        DMENCFDOM.ConsultaEcf(DMFacturasAProveedor.xFacturaCompraDGIIID_E.AsInteger, False);
     finally
        CierraData(DMENCFDOM);
     end;

     DMFacturasAProveedor.QMCabecera.Refresh;
  end;
end;

procedure TFMFacturasAProveedor.DBEIdTipoRetencionChange(Sender: TObject);
begin
  inherited;
  ETipoRetencionTitulo.Text := DameTituloRetencionDOM(StrToIntDef(DBEIdTipoRetencion.Text, 0));
end;

end.
