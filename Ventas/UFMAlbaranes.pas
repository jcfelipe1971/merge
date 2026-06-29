unit UFMAlbaranes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada,
  FIBEditFind, ActnList, UFormGest, Variants, DB, rxPlacemnt, NsDBGrid,
  rxToolEdit, RXDBCtrl, ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFEdit,
  ULFFIBDBEditFind, URecursos, HYFIBQuery, idGlobalProtocols, ULFDBDateEdit,
  ULFMemo, ULFComboBox, UFPEditDetalle, UG2kTBLoc, DbComboBoxValue,
  ULFDBComboBoxValue;

type
  TFMAlbaranes = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PNLCabNotas: TLFPanel;
     PNLEdCabecera: TLFPanel;
     LBLAlbaran: TLFLabel;
     DBERIG: TLFDbedit;
     LBLEstado: TLFLabel;
     LBLCliente: TLFLabel;
     EFCliente: TLFDBEditFind2000;
     DBETituloCliente: TLFDbedit;
     EFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     EFAgente: TLFDBEditFind2000;
     ETituloAgente: TLFEdit;
     LBLDir: TLFLabel;
     LBLAgente: TLFLabel;
     EFTransportista: TLFDBEditFind2000;
     ETituloTransportista: TLFEdit;
     LBLTransportista: TLFLabel;
     PNLEdNotas: TLFPanel;
     DBEDtoPP: TLFDbedit;
     LBLDtoPP: TLFLabel;
     PNLTitNotas: TLFPanel;
     DBENotasFechaCab: TLFDbedit;
     LBLFechaNotas: TLFLabel;
     DBENotasSuReferenciaCab: TLFDbedit;
     LBLRefNotas: TLFLabel;
     DBENotasClienteTituloCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     DBEDtoCial: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LBLDtoCial: TLFLabel;
     EFAlmacen: TLFDBEditFind2000;
     ETituloAlmacen: TLFEdit;
     LBLAlmacen: TLFLabel;
     EFFormaPago: TLFDBEditFind2000;
     DBETituloFormaPago: TLFDbedit;
     LBLFormaPago: TLFLabel;
     ALAlbaranes: TLFActionList;
     ANotasDetalle: TAction;
     AInfoStocks: TAction;
     AProcedencia: TAction;
     AUnidadesExt: TAction;
     APreciosTarifa: TAction;
     AInfoHistorico: TAction;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PNLPieGenerico: TLFPanel;
     LBultosPie: TLFLabel;
     LBLBImp: TLFLabel;
     LBLIVARec: TLFLabel;
     LBLLiquido: TLFLabel;
     LBLTotal: TLFLabel;
     DBEBultosPie: TLFDbedit;
     DBES_Bases: TLFDbedit;
     DBELiquido: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBETotal: TLFDbedit;
     TSPieRetCom: TTabSheet;
     PNLPieRetenciones: TLFPanel;
     LBLBaseRet: TLFLabel;
     LBLImporte: TLFLabel;
     LBLBaseComRet: TLFLabel;
     LBLImporteRet: TLFLabel;
     DBEBaseRetencionFac: TLFDbedit;
     DBEI_RetencionFac: TLFDbedit;
     DBEBaseComision: TLFDbedit;
     DBEImp_Comision: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PNLPieComisiones: TLFPanel;
     LBLBaseDtoCargos: TLFLabel;
     LBLImporteCargos: TLFLabel;
     LBLImpFinan: TLFLabel;
     LBLImpBaseCargos: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     DBESumaBases: TLFDbedit;
     TButtSep7: TToolButton;
     TButtEditaLineas: TToolButton;
     TButtInfStocks: TToolButton;
     TButtProcedenciaLinea: TToolButton;
     TButtUnidadesExt: TToolButton;
     TButtPrecios: TToolButton;
     TButtInfoHistorico: TToolButton;
     TSepBuscaFolio: TToolButton;
     TButtImprimeListado: TToolButton;
     TButtSep6: TToolButton;
     TbuttCambiarNombre: TToolButton;
     LBLSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     TButtSerializacion: TToolButton;
     ASerializacion: TAction;
     ToolButton1: TToolButton;
     TButtBuscarNumSerie: TToolButton;
     APVP: TAction;
     DBETituloEstado: TLFDbedit;
     ANewCliente: TAction;
     ANewAgente: TAction;
     ANewArticulo: TAction;
     AACliente: TAction;
     AAAgente: TAction;
     SBACliente: TSpeedButton;
     SBAAgente: TSpeedButton;
     AImprime: TAction;
     LTarifa: TLFLabel;
     DBEFTarifa: TLFDBEditFind2000;
     ETituloTarifa: TLFEdit;
     AInfoLotes: TAction;
     ToolButton2: TToolButton;
     TBInfoLotes: TToolButton;
     AArticulo: TAction;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     DBCKGarantiaKRI: TLFDBCheckBox;
     TBNroSerieKri: TToolButton;
     ANroSerieKri: TAction;
     LAgrupacionKri: TLFLabel;
     DBEAgrupacionKri: TLFDBEdit;
     TSEDI: TTabSheet;
     PNLEDI: TLFPanel;
     LCompradorEDI: TLFLabel;
     LDestinoEDI: TLFLabel;
     LDtoEDI: TLFLabel;
     LOrigenEDI: TLFLabel;
     LReceptorEDI: TLFLabel;
     LRecogidaEDI: TLFLabel;
     LExpedidorEDI: TLFLabel;
     DBECompradorEDI: TLFDbedit;
     DBEDestinoEDI: TLFDbedit;
     DBEDtoEDI: TLFDbedit;
     DBEOrigenEDI: TLFDbedit;
     DBEReceptorEDI: TLFDbedit;
     DEBRecogidaEDI: TLFDbedit;
     DBEExpedidorEDI: TLFDbedit;
     ECompradorEDI: TLFEdit;
     EDestinoEDI: TLFEdit;
     EOrigenEDI: TLFEdit;
     EReceptorEDI: TLFEdit;
     ERecogidaEDI: TLFEdit;
     EExpedidorEDI: TLFEdit;
     LSumUnidades: TLFLabel;
     DBESumUnidades: TLFDBEdit;
     AInformeAlbaran: TAction;
     AInformeAlbaran2: TLFNoSaveAction;
     AInformeAlbaran3: TLFNoSaveAction;
     AInformeAlbaran4: TLFNoSaveAction;
     AVisualizarAlbaranesFiltrados: TAction;
     AImprimirAlbaranesFiltrados: TAction;
     ASep: TAction;
     AResumenAlbaranes: TAction;
     AResumenAlbaranesFiltrados: TAction;
     AImprimirResumenAlbaranesFiltrados: TAction;
     ASep2: TAction;
     AEtiquetas: TAction;
     ASep3: TAction;
     AConfListadosAlbaranes: TAction;
     AConfAlbFechasClientes: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfEtiquetas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ACambiarNombre: TAction;
     ASep4: TAction;
     AFactura: TAction;
     ASep5: TAction;
     ADuplicar: TAction;
     ACondicionesClientes: TAction;
     ARefrescaDetalle: TAction;
     AAnulaDocumento: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ABuscarNumSerie: TAction;
     AHerencia: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AHistoricoSerializacion: TAction;
     TSCartaPorte: TTabSheet;
     AInformeCartaPortes1: TAction;
     AInformeCartaPortes2: TAction;
     TBCartaPorte: TLFToolBar;
     NavCartaPortes: THYMNavigator;
     CECartaPortes: TControlEdit;
     CEMCartaPortesPMEdit: TPopUpTeclas;
     CEMatricula: TControlEdit;
     CENaturaleza: TControlEdit;
     CEMatriculaPMEdit: TPopUpTeclas;
     CENaturalezaPMEdit: TPopUpTeclas;
     PNLCartaPorte: TLFPanel;
     PNLIzqCarta: TLFPanel;
     LBLCargadora: TLFLabel;
     LBLExpedidora: TLFLabel;
     LBLDirExpedidora: TLFLabel;
     LBLDirIntermediaria: TLFLabel;
     LBLIntermediaria: TLFLabel;
     LBDirCargadora: TLFLabel;
     LBLDirTransportista: TLFLabel;
     LBLTransportista2: TLFLabel;
     LBLDirDestinatario: TLFLabel;
     LBLDestinatario: TLFLabel;
     LBLPeso: TLFLabel;
     LCartaPortesDestino: TLFLabel;
     LBLBultos2: TLFLabel;
     LBLFecha: TLFLabel;
     LBLNotas: TLFLabel;
     LCartaPortesAlmacen: TLFLabel;
     DBEFCargadora: TLFDBEditFind2000;
     ETitCargadora: TLFEdit;
     ETitExpedidora: TLFEdit;
     ETitDirExpedidora: TLFEdit;
     DBEFDirIntermediaria: TLFDBEditFind2000;
     ETitDirIntermediaria: TLFEdit;
     DBEFIntermediaria: TLFDBEditFind2000;
     ETitIntermediaria: TLFEdit;
     DBEFDirCargadora: TLFDBEditFind2000;
     ETitDirCargadora: TLFEdit;
     DBEFDirTransportista: TLFDBEditFind2000;
     ETitDirTransportista: TLFEdit;
     DBEFTransportistaCartaPorte: TLFDBEditFind2000;
     ETitTransportista: TLFEdit;
     DBEFDirDestinatario: TLFDBEditFind2000;
     ETitDirDestinatario: TLFEdit;
     DBEFDestinatario: TLFDBEditFind2000;
     ETitDestinatario: TLFEdit;
     DBEPeso: TLFDbedit;
     DBETiDirAlmacen: TLFDbedit;
     DBEFDestino: TLFDBEditFind2000;
     ETitDestino: TLFEdit;
     DBEBultos2: TLFDbedit;
     DBDEFechaPorte: TLFDBDateEdit;
     DBMNotasCarta: TLFDBMemo;
     DBEFDirExpedidora: TLFDBEditFind2000;
     DBEFExpedidora: TLFDBEditFind2000;
     DBEFAlmacen: TLFDBEditFind2000;
     ETitAlmacen: TLFEdit;
     PNLMatNat: TLFPanel;
     TBMat: TLFToolBar;
     NavMat: THYMNavigator;
     PNLMatricula: TLFPanel;
     DBGMatricula: TDBGridFind2000;
     PNLNaturaleza: TLFPanel;
     DBGNaturaleza: TDBGridFind2000;
     TBNat: TLFToolBar;
     NavNat: THYMNavigator;
     AConfListadoAlbPorte1: TAction;
     AConfListadoAlbPorte2: TAction;
     AMantenimientoDeposito: TAction;
     ADevolucion: TAction;
     TButtCambiaDescripcion: TToolButton;
     ACambiaTitulo: TAction;
     TButtMuestraUbiacion: TToolButton;
     AMuestraUbiacion: TAction;
     AEnviarAlbaranMailPDF: TAction;
     ASep6: TAction;
     ALstUbicaciones: TAction;
     AConfLstUbicaciones: TAction;
     AExportaAlbaranEDI: TAction;
     ANIFAlbaran: TAction;
     AOrdenaLineas: TAction;
     AAlbaranMulti: TAction;
     AGenerarPackingList: TAction;
     DBEFPortes: TLFDBEditFind2000;
     LBPortes: TLFLabel;
     ETituloPortes: TLFEdit;
     DBEPorPortes: TLFDbedit;
     DBEIPortes: TLFDbedit;
     LBRango: TLFLabel;
     DBEFRango: TLFDBEditFind2000;
     DBERango: TLFDbedit;
     LBIndice: TLFLabel;
     DBEFIndice: TLFDBEditFind2000;
     DBEIndice: TLFDbedit;
     LBLFechaFicha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LFDBChkDevolucion: TLFDBCheckBox;
     LBLReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     AAgrupaAlbaranesFiltradosKri: TAction;
     TBuscaReferencia: TToolButton;
     EFReferencia: TLFEditFind2000;
     ABuscaReferencia: TAction;
     LContacto: TLFLabel;
     DBEFContacto: TLFDBEditFind2000;
     DBEContacto: TLFDBEdit;
     ABuscaNIFKRI: TAction;
     EFBuscaNIFKRI: TLFEditFind2000;
     TButtBuscaNIFKRI: TToolButton;
     ToolButton3: TToolButton;
     TBDescargaLector: TToolButton;
     ADescargaLector: TAction;
     TButtHerencia: TToolButton;
     TButtBuscarArticulo: TToolButton;
     ABuscarArticulo: TAction;
     AAsignaGarantiasLector: TAction;
     TBAsignaGarantiasLector: TToolButton;
     TButtArtCli: TToolButton;
     DBRENotas: TDBRichEdit;
     DBRENotasInternasKri: TDBRichEdit;
     TBRichNotas: TLFToolBar;
     TButtNotasNegrita: TToolButton;
     TButtNotasItalica: TToolButton;
     TButtNotasSubrayado: TToolButton;
     ToolButton13: TToolButton;
     TButtNotasAlinIzq: TToolButton;
     TButtNotasAlinCent: TToolButton;
     TButtNotasAlinDer: TToolButton;
     ToolButton17: TToolButton;
     TButtNotasBullets: TToolButton;
     ToolButton19: TToolButton;
     CBFontName: TLFComboBox;
     ToolButton6: TToolButton;
     PNLTamano: TLFPanel;
     EFontSizeNotas: TLFEdit;
     UpDown1: TUpDown;
     LFCategoryAction5: TLFCategoryAction;
     AAdjuntosAlbaran: TAction;
     AAdjuntosCliente: TAction;
     AAdjuntosTercero: TAction;
     AAdjuntosAgente: TAction;
     AAdjuntosTransportista: TAction;
     AEnviarAlbaranMailPDF2: TAction;
     LBLPalets: TLFLabel;
     DBEPalets: TLFDbedit;
     LFUdLogistica: TLFLabel;
     LFPesoBruto: TLFLabel;
     LFDBPesBrut: TLFDbedit;
     LFDBULogistica: TLFDbedit;
     ACambiaFecha: TAction;
     LTelefono: TLFLabel;
     DBCHKListado: TLFDBCheckBox;
     TButtCondicionesVenta: TToolButton;
     ACondicionesDeVenta: TAction;
     AListadoArticulos: TAction;
     AOrdenarLineasPorDireccionEntrega: TAction;
     ADistribuyeLineasPorDirecionEntrega: TAction;
     DBCBValorar: TLFDBCheckBox;
     DBEVolumen: TLFDbedit;
     LBLVolumen: TLFLabel;
     AListarEtiquetas: TAction;
     ACambioPCosteLinea: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     AExportarVGG: TAction;
     ADetalleDeCabecera: TAction;
     ASep1: TAction;
     AEliminarPackingList: TAction;
     AEtiquetaAlbaran: TAction;
     AConfLstEtiquetaAlbaran: TAction;
     AOrdenarLineasPorDireccionEntrega_Filtradas: TAction;
     ACrearRuta: TAction;
     LBLFechaServido: TLFLabel;
     DBDTPFechaServido: TLFDBDateEdit;
     DBDTPHoraServido: TDBDateTimePicker;
     DBDTPHoraDocumento: TDBDateTimePicker;
     DBDTPFechaPorte: TDBDateTimePicker;
     LPedidoCli: TLFLabel;
     DBEPedidoCli: TLFDbedit;
     ABuscarLoteSimple: TAction;
     TButtBuscarLoteSimple: TToolButton;
     AAsignaEmpleado: TAction;
     ACreaAnticipo: TAction;
     TButtRecibos: TToolButton;
     ARecibos: TAction;
     TBCondicionesClientes: TToolButton;
     TBCreaAnticipo: TToolButton;
     DBCBDocumentoMuestras: TLFDBCheckBox;
     TButtTraspaso: TToolButton;
     PMTraspaso: TPopupMenu;
     MITraspasoaFactura: TMenuItem;
     MIDuplicarAlbaran: TMenuItem;
     MIGeneraDevolucion: TMenuItem;
     LFLTotalAnticipado: TLFLabel;
     DBETotal_Anticipado: TLFDbedit;
     ATraspasoMovimientoStock: TAction;
     DBCBFacturable: TLFDBCheckBox;
     LMargen: TLFLabel;
     DBEMargen: TLFDbedit;
     CEOtros: TControlEdit;
     LBLProyecto: TLFLabel;
     LBIdioma: TLFLabel;
     LMoneda: TLFLabel;
     LValorCambio: TLFLabel;
     LBLCampanya: TLFLabel;
     LTipoLineaKri: TLFLabel;
     LTipoIRPF: TLFLabel;
     LBLRetencion: TLFLabel;
     LBLBultosKri: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     DBETitProyecto: TLFDbedit;
     DBEFIdioma: TLFDBEditFind2000;
     ETituloIdioma: TLFEdit;
     DBEFMoneda: TLFDBEditFind2000;
     ETituloMoneda: TLFEdit;
     DBCHKCambio: TLFDBCheckBox;
     DBEValorCambio: TLFDbedit;
     EFCampanya: TLFDBEditFind2000;
     ETituloCampanya: TLFEdit;
     DBEFTipoLineaKri: TLFDBEditFind2000;
     ETipoLineaKri: TLFEdit;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBERetencion: TLFDbedit;
     DBETitTIPOIRPF: TLFDbedit;
     DBEApliIRPF: TLFDbedit;
     DBChkDeposito: TLFDBCheckBox;
     DBEAlmacenDeposito: TLFDbedit;
     ETituloAlmacenDeposito: TLFEdit;
     DBEBultosKri: TLFDbedit;
     LPorcFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     ARegistroFitosanitario: TAction;
     AProyecto: TAction;
     SBAProyecto: TSpeedButton;
     AImportarDetalle: TAction;
     TButtImportarDetalle: TToolButton;
     TButtSep1: TToolButton;
     TButtInformeCartaPortes: TToolButton;
     TSOtros: TTabSheet;
     PNLCabOtros: TLFPanel;
     PNLTitOtros: TLFPanel;
     DBEOtrosFechaCab: TLFDbedit;
     DBEOtrosSuReferenciaCab: TLFDbedit;
     DBEOtrosClienteTituloCab: TLFDbedit;
     DBEOtrosRIGCab: TLFDbedit;
     NavOtros: THYMNavigator;
     PNLEdOtros: TLFPanel;
     PNLFirma: TLFPanel;
     ImgFirma: TImage;
     DBTFirmaNombre: TDBText;
     DBTNIFFirma: TDBText;
     LFirma: TLFLabel;
     APedirFirma: TAction;
     ABorrarFirma: TAction;
     AAbrirCerrar: TAction;
     ACambioCosteAdicionalLinea: TAction;
     LBancoDireccion: TLFLabel;
     DBEFBancoDireccion: TLFDBEditFind2000;
     EBancoDireccion: TLFEdit;
     ATraspasarLinea: TAction;
     LNombreComercial: TLFLabel;
     DBENombreComercial: TLFDbedit;
     SBATercero: TSpeedButton;
     ATercero: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     RelojEmail: TTimer;
     LEmail: TLFLabel;
     ACrearHerenciaManual: TAction;
     AVerificacionDrasa: TAction;
     AMuestraDocumentosVenta: TAction;
     LFechaReparto: TLFLabel;
     DEFechaReparto: TLFDBDateEdit;
     DBDTPHoraReparto: TDBDateTimePicker;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     TSDirManual: TTabSheet;
     PNLDirManual: TLFPanel;
     PNLDirManual2: TLFPanel;
     LDirEntregaFecha: TLFLabel;
     LDirEntregaReferencia: TLFLabel;
     DBEDirEntregaFecha: TLFDbedit;
     DBEDirEntregaNombre: TLFDbedit;
     DBEDirEntregaRIG: TLFDbedit;
     DBEDirEntregaReferencia: TLFDbedit;
     NavDirEntrega: THYMNavigator;
     PNLEdDirEntrega: TLFPanel;
     DBMDirEntrega: TLFDBMemo;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     TBEnvioDTE: TToolButton;
     AEnviaDTECL: TAction;
     TSOtrosChile: TTabSheet;
     CEOtrosChile: TControlEdit;
     CEOtrosChilePMEdit: TPopUpTeclas;
     PEdOtrosChile: TLFPanel;
     LSumaPeso: TLFLabel;
     DBESumaPeso: TLFDbedit;
     CBSIIFormaPago: TLFDBComboBoxValue;
     lSIITituloFormaPago: TLFEdit;
     LSIITituloTipoVenta: TLFEdit;
     LSIITituloCodigoGiroEmpresa: TLFEdit;
     SIITituloDespachoDBESIITDespacho: TLFEdit;
     LSIITituloTDocTrib: TLFEdit;
     LSIIFormaPago: TLFLabel;
     LSIITipoVenta: TLFLabel;
     LSIICodigoGiroEmpresa: TLFLabel;
     LSIITDespacho: TLFLabel;
     LSIITDocTrib: TLFLabel;
     LSIIFolio: TLFLabel;
     DBESIITipoVenta: TLFDBEditFind2000;
     DBESIICodigoGiroCliente: TLFDBEditFind2000;
     DBESIICodigoGiroEmpresa: TLFDBEditFind2000;
     DBESIITDespacho: TLFDBEditFind2000;
     DBESIITDocTrib: TLFDBEditFind2000;
     LSIICodigoGiroCliente: TLFLabel;
     DBESIIFolio: TLFDbedit;
     LOtrosTipoDocIdentificacion: TLFLabel;
     LOtrosFmaPagoSII: TLFLabel;
     LOtrosTipoVenta: TLFLabel;
     LOtrosCodigoGiroCliente: TLFLabel;
     LOtrosCodigoGiroEmpresa: TLFLabel;
     LOtrosTipoDespacho: TLFLabel;
     LOtrosTipoDocumentoTributario: TLFLabel;
     LOtrosSiiTrackID: TLFLabel;
     LOtrosFolio: TLFLabel;
     DBEOtrosTipoDocIdentificacion: TLFDbedit;
     DBEOtrosNIF: TLFDbedit;
     DBEFOtrosTipoVenta: TLFDBEditFind2000;
     DBEFOtrosCodigoGiroCliente: TLFDBEditFind2000;
     DBEFOtrosCodigoGiroEmpresa: TLFDBEditFind2000;
     DBEOtrosTipoDespacho: TLFDBEditFind2000;
     DBEFOtrosTipoDocumentoTributario: TLFDBEditFind2000;
     DBCBOtrosFmaPagoSII: TLFDBComboBoxValue;
     DBEOtrosSiiTrackID: TLFDbedit;
     DBEOtrosFolio: TLFDbedit;
     EOtrosTipoVenta: TLFEdit;
     EOtrosCodigoGiroCliente: TLFEdit;
     EOtrosCodigoGiroEmpresa: TLFEdit;
     EOtrosTipoDespachoTitulo: TLFEdit;
     EOtrosTipoDocumentoTributario: TLFEdit;
     GBReferencia: TGroupBox;
     LTpoDocRef: TLFLabel;
     LIdDocRef: TLFLabel;
     LRUTOtr: TLFLabel;
     LCodRef: TLFLabel;
     LRazonRef: TLFLabel;
     LFolioRef: TLFLabel;
     LFchRef: TLFLabel;
     DBETpoDocRef: TLFDBEditFind2000;
     ETipoDocTribTitulo: TLFEdit;
     DBEIdDocRef: TLFDbedit;
     DBERUTOtr: TLFDbedit;
     DBERazonRef: TLFDbedit;
     DBEFolioRef: TLFDbedit;
     CBCodRef: TLFDBComboBoxValue;
     DBDFchRef: TLFDBDateEdit;
     DBGFReferenciasDte: TDBGridFind2000;
     PNLReferenciasDteCab: TLFPanel;
     NavReferenciasDte: THYMNavigator;
     PNLDteCab: TLFPanel;
     NavOtrosChile: THYMNavigator;
     CBSIIIndTraslado: TLFDBComboBoxValue;
     LSIITipoImpresion: TLFLabel;
     LSIIIndTraslado: TLFLabel;
     CBSIITipoImpresion: TLFDBComboBoxValue;
     PNLChile: TLFPanel;
     LFCategoryAction6: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFiltroAnulado: TAction;
     AFiltroAbierto: TAction;
     AFiltroAbiertoFacturable: TAction;
     AFiltroAbiertoMuestras: TAction;
     LRiesgoAct: TDBText;
     LRiesgo: TLabel;
     PNLRiesgo: TLFPanel;
     PNLDirEntrega: TLFPanel;
     PNLDirRecogida: TLFPanel;
     PNLDirManualDatos: TLFPanel;
     LDirRecogida: TLFLabel;
     LEquipoRecogida: TLFLabel;
     DBEEquipoRecogida: TLFDbedit;
     LMatriculaRecogida: TLFLabel;
     DBEMatriculaRecogida: TLFDbedit;
     LFechaRecogida: TLFLabel;
     DBDEFechaRecogidaManual: TLFDBDateEdit;
     DBDTPFechaRecogidaManual: TDBDateTimePicker;
     LFLabel3: TLFLabel;
     LEquipoEntrega: TLFLabel;
     DBEEquipoEntrega: TLFDbedit;
     LMatriculaEntrega: TLFLabel;
     DBEMatriculaEntrega: TLFDbedit;
     LFechaEntregaManual: TLFLabel;
     DBDEFechaEntregaManual: TLFDBDateEdit;
     DBDTPFechaEntregaManual: TDBDateTimePicker;
     DBCBEmpaquetadoEmp: TLFDBCheckBox;
     ADetallesDeLinea: TAction;
     TButtDetalles: TToolButton;
     ABorradoMasivoLineas: TAction;
     APickingList: TAction;
     AConfPickingList: TAction;
     pmCartaPorte: TPopupMenu;
     MIInformeCartadePortes1: TMenuItem;
     MIInformeCartadePortes2: TMenuItem;
     ALocalizaFolio: TAction;
     TBLocalizaFolio: TToolButton;
     TBSep1: TToolButton;
     LMotivoAbono: TLFLabel;
     DBEFMotivoAbono: TLFDBEditFind2000;
     EMotivoAbono: TLFEdit;
     TSProveedores: TTabSheet;
     PNLProveedores: TLFPanel;
     PNLProveedoresCab: TLFPanel;
     LProveedoresFecha: TLFLabel;
     LProveedoresSuReferencia: TLFLabel;
     DBEProveedoresFecha: TLFDbedit;
     DBEProveedoresTitulo: TLFDbedit;
     DBEProveedoresRIG: TLFDbedit;
     DBEProveedoresSuReferencia: TLFDbedit;
     NavProveedores: THYMNavigator;
     DBGProveedores: TDBGridFind2000;
     LModoIVA: TLFLabel;
     EFModoIva: TLFDBEditFind2000;
     EModoIva: TLFEdit;
     ATraspasaMovimientoStock: TAction;
     ATraspasaFiltradosMovimientoStock: TAction;
     PNLNotas: TLFPanel;
     splitter: TSplitter;
     PNLOrtografia: TLFPanel;
     TBOrtografia: TLFToolBar;
     TBComprobar: TToolButton;
     ToolButton5: TToolButton;
     TBAgregarPalabra: TToolButton;
     LBPalabras: TListBox;
     ACliArt: TAction;
     TBCliArt: TToolButton;
     LCantLineas: TLFLabel;
     DBECOUNT_LINEAS: TLFDbedit;
     AExportarExcel: TAction;
     LCodigoExpedicion: TLFLabel;
     DBECodigoExpedicion: TLFDbedit;
     DBMAviso: TLFDBMemo;
     DBMNotaCliente: TLFDBMemo;
     PNLAvisos: TLFPanel;
     LAvisos: TLFLabel;
     LNotasCliente: TLFLabel;
     AFiltraClientesALFA: TAction;
     TBSep2: TToolButton;
     TBAsignarEnvio: TToolButton;
     AAsignarEnvio: TAction;
     DBESIITituloCodigoGiroCliente: TLFDbedit;
     GBDTEEnvio: TGroupBox;
     LTrackID: TLFLabel;
     DBETrackID: TLFDbedit;
     DBEBultosCab: TLFDbedit;
     LBultosCab: TLFLabel;
     AIncrementarPrecio: TAction;
     TBSep3: TToolButton;
     TBPeticionRecogidaGLS: TToolButton;
     APeticionRecogidaGLS: TAction;
     PNLTitCartaPortes: TLFPanel;
     LFechaCartaPortes: TLFLabel;
     LSuReferenciaCartaPortes: TLFLabel;
     DBEFechaCartaPortes: TLFDbedit;
     DBESuReferenciaCartaPortes: TLFDbedit;
     DBETituloCartaPortes: TLFDbedit;
     DBERIGCartaPortes: TLFDbedit;
     TBSep4: TToolButton;
     TBSep5: TToolButton;
     TBGeneraPeticionDHL: TToolButton;
     APeticionRecogidaDHL: TAction;
     TBSep6: TToolButton;
     TBDHLRates: TToolButton;
     ADHLRates: TAction;
     PNLPieUnidades: TLFPanel;
     DBESumUdsLog: TLFDbedit;
     DBESumUdsSec: TLFDbedit;
     PNLPieInfo: TLFPanel;
     PNLInfoImportes: TLFPanel;
     AFiltroCerrado: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSerieChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure AProcedenciaExecute(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure AUnidadesExtExecute(Sender: TObject);
     procedure APreciosTarifaExecute(Sender: TObject);
     procedure AInfoHistoricoExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; Valor: string);
     procedure DBGFDetalleExiste(Sender: TObject);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure APVPExecute(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewClienteExecute(Sender: TObject);
     procedure ANewAgenteExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAClienteExecute(Sender: TObject);
     procedure AAAgenteExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure DBETituloClienteEnter(Sender: TObject);
     procedure ETituloAgenteEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AInfoLotesExecute(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AArtCliExecute(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure EFClienteExiste(Sender: TObject);
     procedure ANroSerieKriExecute(Sender: TObject);
     procedure DBECompradorEDIChange(Sender: TObject);
     procedure DBEDestinoEDIChange(Sender: TObject);
     procedure DBEOrigenEDIChange(Sender: TObject);
     procedure DBEReceptorEDIChange(Sender: TObject);
     procedure DEBRecogidaEDIChange(Sender: TObject);
     procedure DBEExpedidorEDIChange(Sender: TObject);
     procedure TSEDIShow(Sender: TObject);
     procedure AInformeAlbaranExecute(Sender: TObject);
     procedure AInformeAlbaran2Execute(Sender: TObject);
     procedure AInformeAlbaran3Execute(Sender: TObject);
     procedure AInformeAlbaran4Execute(Sender: TObject);
     procedure AVisualizarAlbaranesFiltradosExecute(Sender: TObject);
     procedure AImprimirAlbaranesFiltradosExecute(Sender: TObject);
     procedure AResumenAlbaranesExecute(Sender: TObject);
     procedure AResumenAlbaranesFiltradosExecute(Sender: TObject);
     procedure AImprimirResumenAlbaranesFiltradosExecute(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure AConfListadosAlbaranesExecute(Sender: TObject);
     procedure AConfAlbFechasClientesExecute(Sender: TObject);
     procedure AConfEtiquetasExecute(Sender: TObject);
     procedure ACambiarNombreExecute(Sender: TObject);
     procedure AFacturaExecute(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ACondicionesClientesExecute(Sender: TObject);
     procedure ARefrescaDetalleExecute(Sender: TObject);
     procedure AAnulaDocumentoExecute(Sender: TObject);
     procedure ABuscarNumSerieExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure AHistoricoSerializacionExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBEFDirCargadoraBusqueda(Sender: TObject);
     procedure DBEFDirExpedidoraBusqueda(Sender: TObject);
     procedure DBEFDirIntermediariaBusqueda(Sender: TObject);
     procedure DBEFDirTransportistaBusqueda(Sender: TObject);
     procedure DBEFDirDestinatarioBusqueda(Sender: TObject);
     procedure DBGMatriculaBusqueda(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBGMatriculaColEnter(Sender: TObject);
     procedure DBGNaturalezaColEnter(Sender: TObject);
     procedure DBMNotasCartaExit(Sender: TObject);
     procedure TSCartaPorteShow(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure AInformeCartaPortes1Execute(Sender: TObject);
     procedure AInformeCartaPortes2Execute(Sender: TObject);
     procedure DBGNaturalezaBusqueda(Sender: TObject);
     procedure AConfListadoAlbPorte1Execute(Sender: TObject);
     procedure AConfListadoAlbPorte2Execute(Sender: TObject);
     procedure NavCartaPortesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavCartaPortesBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AMantenimientoDepositoExecute(Sender: TObject);
     procedure ADevolucionExecute(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure ACambiaTituloExecute(Sender: TObject);
     procedure AMuestraUbiacionExecute(Sender: TObject);
     procedure AEnviarAlbaranMailPDFExecute(Sender: TObject);
     procedure ALstUbicacionesExecute(Sender: TObject);
     procedure AConfLstUbicacionesExecute(Sender: TObject);
     procedure AExportaAlbaranEDIExecute(Sender: TObject);
     procedure ANIFAlbaranExecute(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure DBEFRangoChange(Sender: TObject);
     procedure DBEFRangoBusqueda(Sender: TObject);
     procedure DBEFIndiceBusqueda(Sender: TObject);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure AAlbaranMultiExecute(Sender: TObject);
     procedure AGenerarPackingListExecute(Sender: TObject);
     procedure AAgrupaAlbaranesFiltradosKriExecute(Sender: TObject);
     procedure ABuscaReferenciaExecute(Sender: TObject);
     procedure TButtImprimeListadoClick(Sender: TObject);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure ADescargaLectorExecute(Sender: TObject);
     procedure DBDTPFechaExit(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure AAsignaGarantiasLectorExecute(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure DBEFTipoLineaKriChange(Sender: TObject);
     procedure DBEFContactoBusqueda(Sender: TObject);
     procedure DBRENotasEnter(Sender: TObject);
     procedure DBRENotasSelectionChange(Sender: TObject);
     procedure CBFontNameChange(Sender: TObject);
     procedure EFontSizeNotasChange(Sender: TObject);
     procedure AAdjuntosAlbaranExecute(Sender: TObject);
     procedure AAdjuntosClienteExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AAdjuntosAgenteExecute(Sender: TObject);
     procedure AAdjuntosTransportistaExecute(Sender: TObject);
     procedure AEnviarAlbaranMailPDF2Execute(Sender: TObject);  //sfg_rsl
     procedure ACambiaFechaExecute(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure ACondicionesDeVentaExecute(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure DBEAlmacenDepositoChange(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure EFTransportistaChange(Sender: TObject);
     procedure DBEFTarifaChange(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure EFCampanyaChange(Sender: TObject);
     procedure AListadoArticulosExecute(Sender: TObject);
     procedure AOrdenarLineasPorDireccionEntregaExecute(Sender: TObject);
     procedure ADistribuyeLineasPorDirecionEntregaExecute(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure DBEFCargadoraChange(Sender: TObject);
     procedure DBEFDestinatarioChange(Sender: TObject);
     procedure DBEFExpedidoraChange(Sender: TObject);
     procedure DBEFIntermediariaChange(Sender: TObject);
     procedure DBEFDestinoChange(Sender: TObject);
     procedure DBEFDirIntermediariaChange(Sender: TObject);
     procedure DBEFDirExpedidoraChange(Sender: TObject);
     procedure DBEFDirCargadoraChange(Sender: TObject);
     procedure DBEFDirDestinatarioChange(Sender: TObject);
     procedure DBEFDirTransportistaChange(Sender: TObject);
     procedure DBEFTransportistaCartaPorteChange(Sender: TObject);
     procedure ACambioPCosteLineaExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure AExportarVGGExecute(Sender: TObject);
     procedure ADetalleDeCabeceraExecute(Sender: TObject);
     procedure AEliminarPackingListExecute(Sender: TObject);
     procedure AEtiquetaAlbaranExecute(Sender: TObject);
     procedure AConfLstEtiquetaAlbaranExecute(Sender: TObject);
     procedure AOrdenarLineasPorDireccionEntrega_FiltradasExecute(Sender: TObject);
     procedure ACrearRutaExecute(Sender: TObject);
     procedure ABuscarLoteSimpleExecute(Sender: TObject);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure LBNotasClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAsignaEmpleadoExecute(Sender: TObject);
     procedure ACreaAnticipoExecute(Sender: TObject);
     procedure ARecibosExecute(Sender: TObject);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure ATraspasoMovimientoStockExecute(Sender: TObject);
     procedure DBERIGChange(Sender: TObject);
     procedure TSOtrosShow(Sender: TObject);
     procedure ARegistroFitosanitarioExecute(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure APedirFirmaExecute(Sender: TObject);
     procedure ABorrarFirmaExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure ACambioCosteAdicionalLineaExecute(Sender: TObject);
     procedure DBEFBancoDireccionBusqueda(Sender: TObject);
     procedure DBEFBancoDireccionChange(Sender: TObject);
     procedure ATraspasarLineaExecute(Sender: TObject);
     procedure ATerceroExecute(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearHerenciaManualExecute(Sender: TObject);
     procedure AVerificacionDrasaExecute(Sender: TObject);
     procedure AMuestraDocumentosVentaExecute(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure AEnviaDTECLExecute(Sender: TObject);
     procedure DBEFOtrosTipoVentaChange(Sender: TObject);
     procedure DBEFOtrosCodigoGiroClienteChange(Sender: TObject);
     procedure DBEFOtrosCodigoGiroEmpresaChange(Sender: TObject);
     procedure DBEOtrosTipoDespachoChange(Sender: TObject);
     procedure DBEFOtrosTipoDocumentoTributarioChange(Sender: TObject);
     procedure DBETpoDocRefChange(Sender: TObject);
     procedure DBESIITipoVentaChange(Sender: TObject);
     procedure DBESIICodigoGiroClienteChange(Sender: TObject);
     procedure DBESIICodigoGiroEmpresaChange(Sender: TObject);
     procedure DBESIITDespachoChange(Sender: TObject);
     procedure DBESIITDocTribChange(Sender: TObject);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroAnuladoExecute(Sender: TObject);
     procedure AFiltroAbiertoFacturableExecute(Sender: TObject);
     procedure AFiltroAbiertoMuestrasExecute(Sender: TObject);
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure TSDirManualResize(Sender: TObject);
     procedure ADetallesDeLineaExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure APickingListExecute(Sender: TObject);
     procedure AConfPickingListExecute(Sender: TObject);
     procedure ALocalizaFolioExecute(Sender: TObject);
     procedure DBEMargenChange(Sender: TObject);
     procedure DBEFMotivoAbonoChange(Sender: TObject);
     procedure TSProveedoresShow(Sender: TObject);
     procedure EFModoIvaChange(Sender: TObject);
     procedure ATraspasaMovimientoStockExecute(Sender: TObject);
     procedure ATraspasaFiltradosMovimientoStockExecute(Sender: TObject);
     procedure TBComprobarClick(Sender: TObject);
     procedure TBAgregarPalabraClick(Sender: TObject);
     procedure ACliArtExecute(Sender: TObject);
     procedure AExportarExcelExecute(Sender: TObject);
     procedure AFiltraClientesALFAExecute(Sender: TObject);
     procedure AAsignarEnvioExecute(Sender: TObject);
     procedure AIncrementarPrecioExecute(Sender: TObject);
     procedure APeticionRecogidaGLSExecute(Sender: TObject);
     procedure APeticionRecogidaDHLExecute(Sender: TObject);
     procedure ADHLRatesExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
  private
     { Private declarations }
     param_ALBINSE001: boolean;
     param_ALBPREC001: boolean;
     param_ALBESTA001: boolean;
     Param_VENTIVA001: boolean;
     Param_DOCPREC001: boolean;
     Param_ARTBUSQ003: boolean;
     Param_ARTBUSQ004: boolean;
     Param_SYSCONF005: integer;
     Param_DOCPCOS001: string;
     param_ALBMARG001: boolean;
     param_DOCMARG003: boolean;
     param_VENUSEC001: boolean;
     param_VENUEXT001: boolean;
     param_VENREST002: boolean;
     NumSerie: string;
     ColActual: TColumn;
     Editando: boolean;
     KriConf211: boolean;
     FUpdating: boolean; {dji lrk kri - RichEdit}
     RichEditConFoco: TDBRichEdit; {dji lrk kri - RichEdit}
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     BuscarLoteSimple: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     MargenMinimo: double;
     DBGDetalleArticulo: string;
     procedure HabilitaEnlaces;
     procedure HabilitaBotones;
     {procedure HabilitaBotonesDetalle; dji lrk kri - TyC}
     {function EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint; Se define en UUtiles}
     procedure GetFontNames;
     procedure EstableceVisibilidadCamposDetalle;
     procedure EstableceVisibilidadStockAlmacen;
     procedure ActualizaFirma;
     procedure AbreOCierra;
     procedure RefrescaDescuentoKri;
     procedure LimitaSegunPais;
     procedure RefrescaAvisos;
  public
     { Public declarations }
     FiltroListadoFiltrado: integer;
     procedure HabilitaBotonesDetalle; {TyC}
     procedure MuestraFiltrado(Modo: byte);
     procedure MuestraResumenFiltrado(Modo: byte);
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
     procedure FiltraDocumento(FiltroAccion: string);
     procedure MuestraStock(StockNegativo: smallint);
     procedure AgrupacionPedidos(Serie: string; Contador: integer);
  end;

var
  FMAlbaranes : TFMAlbaranes;

procedure TraspasoAAlbaran(serie: string; id_s: integer);
procedure zAbreImpresion(Serie: string; Contador: integer; peso, bultos: double; imprimir_albaran, imprimir_portes, imprimir_etiquetas: boolean; num_eti: integer); //sfg_rsl

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UDMAlbaranes, UDMLstAlbaranes,
  UDMLstAlbaranesCli, UFMLSTEntrefechascli, UFMNotasCampo,
  UFCHerencia, UFMListConfig, UDMLstAlbaranesEti, UFMDocInfoStocks,
  UFMArtSerializacion, UFMHistoricoSerializacion, UFMBusquedaNumSerie,
  UFMAgrupacionPedidosVentas, UFMain, UFMClientes, UFMAgentes,
  UFVerTercerosPorArticulo, UDMExportaAlbaranEDI,
  UFMAlbDeposito, UFSendCorreo, UDMListados, UDMLstUbicacionesV,
  UFPregNIFFACTURA, UFMTraspasoMultiCanal, UFMPackingList,
  FIBQuery, UFMAdjunto, UFMIntroduceSeries,
  UFMCondicionesVenta, UFMLstEntrefechasAlbArt, UDMLstAlbaranArt, UFMImprimirCodBarras,
  UFMSeleccion, UFMDetalleDeCabecera, Math, UParam, UFMSeleccionGrid,
  UFMRegistroFitosanitario, UFMInsercionArticuloDesdeTexto, UFMHerenciaManual,
  UFMEnviaXmlFacturasChl, UFMSeleccionArticulo, UFMDetalleDeLinea,
  ShellApi, URecibeFicheros, UDMAdjunto, UDMEnviaXmlFacturasChl, UFMProcesosMasivosLineas,
  UFMVentasCli, DateUtils, UDMDTEChl, IniFiles, UDMIDRIL, UDMDHL, FIBDataSet, URellenaLista, UImagenes;

{$R *.DFM}

procedure TFMAlbaranes.FormCreate(Sender: TObject);
var
  i : integer;
  col : TColumn;
  s : string;
  param_ARTBUSQ005 : string;
  j, k, CantCampos : integer;
begin
  // DMMain.Log('TFMAlbaranes.FormCreate');
  DragAcceptFiles(Self.Handle, True);
  BuscarArticulos := False;
  BuscarLoteSimple := False;

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
  {inherited; dji lrk kri - para que funcione el Help con TyC - ver.446}

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

  AbreData(TDMAlbaranes, DMAlbaranes);

  NavMAin.DataSource := DMAlbaranes.DSQMCabecera;
  DBGMain.DataSource := DMAlbaranes.DSQMCabecera;
  NavDetalle.DataSource := DMAlbaranes.DSQMDetalle;
  DBGFDetalle.DataSource := DMAlbaranes.DSQMDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMAlbaranes.DSQMCabecera;
     Entorno := DMAlbaranes.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
     s := Trim(LeeParametro('ALBBUSQ001'));
     if (s <> '') then
        CamposADesplegar.Add(s);
  end;

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;

  CEMainPMEdit.Teclas := DMMain.Teclas;
  CENotasPMEdit.Teclas := DMMain.Teclas;
  FiltroListadoFiltrado := 0;

  {dji lrk kri}
  if REntorno.SerieRestringida <> '' then
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

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

  // Campos a desplegar alrealizar busqueda de articulo en documentos de compra/venta.
  param_ARTBUSQ005 := LeeParametro('ARTBUSQ005');
  if (param_ARTBUSQ005 <> '') then
  begin
     {
      Para cada tabla a buscar (DBGrid.Tablas) se guardan líneas en DBGrid.CamposAMostrar indicando campo a buscar, cantidad de campos-a-mostrar y campos a mostrar
      Ejemplo DBGDetalle de documentos de venta:
        Tablas:
        VER_ARTICULOS_CON_BARRAS
        VER_ARTICULOS_EF
        SYS_TIPO_IVA
        ...

        CamposAMostrar: (Marcados con * lo que se desea modificar)
        ARTICULO   <-- Para tabla VER_ARTICULOS_CON_BARRAS
        0          <-- No desplegar ningun campo adicional
        ARTICULO   <-- Para tabla VER_ARTICULOS_EF
       *3          <-- Desplectar 3 campos adicionales
       *ALFA_1     <-- Campo adicional 1
       *ALFA_2     <-- Campo adicional 2
       *FABRICANTE <-- Campo adicional 1
        TIPO_IVA   <-- Para tabla SYS_TIPO_IVA
        1          <-- Desplectar 1 campo adicional
        P_IVA      <-- Campo adicional 1
        ...
     }
     j := 0;
     for i := 0 to DBGFDetalle.Tablas.Count - 1 do
     begin
        Inc(j);

        CantCampos := 0;
        if (DBGFDetalle.CamposAMostrar.Count > j) then
           CantCampos := StrToIntDef(DBGFDetalle.CamposAMostrar[j], 0);

        if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle.CamposDesplegar[i] = '1') then
        begin
           // Borro los campos originales
           for k := 1 to CantCampos do
              DBGFDetalle.CamposAMostrar.Delete(j + 1);

           CantCampos := 0;
           while (Pos(',', param_ARTBUSQ005) > 0) do
           begin
              DBGFDetalle.CamposAMostrar.Insert(j + 1, Trim(Copy(param_ARTBUSQ005, 1, Pos(',', param_ARTBUSQ005) - 1)));
              param_ARTBUSQ005 := Copy(param_ARTBUSQ005, Pos(',', param_ARTBUSQ005) + 1, Length(param_ARTBUSQ005));
              Inc(CantCampos);
           end;
           if (Trim(param_ARTBUSQ005) > '') then
           begin
              DBGFDetalle.CamposAMostrar.Insert(j + 1, Trim(param_ARTBUSQ005));
              Inc(CantCampos);
           end;

           DBGFDetalle.CamposAMostrar[j] := IntToStr(CantCampos);
        end;

        j := j + CantCampos + 1;
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
           DBGFDetalle.Tablas[i] := 'VER_ARTICULOS_EF_VENTAS';
     end;
  end;

  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     EFCliente.CondicionBusqueda := 'AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));
     with EFAgente do
     begin
        CondicionBusqueda := 'AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));
        Enabled := False;
        Color := clInfoBK;
     end;
  end;

  {dji lrk kri - Muestro los titulos del listado por defecto para el grupo}
  if (REntorno.Albaranes = 4) then
  begin
     AInformeAlbaran4.Visible := True;
     AInformeAlbaran4.Caption := DameTituloListadoDefectoGrupo(115);
  end;
  if (REntorno.Albaranes >= 3) then
  begin
     AInformeAlbaran3.Visible := True;
     AInformeAlbaran3.Caption := DameTituloListadoDefectoGrupo(114);
  end;
  if (REntorno.Albaranes >= 2) then
  begin
     AInformeAlbaran2.Visible := True;
     AInformeAlbaran2.Caption := DameTituloListadoDefectoGrupo(113);
  end;
  AInformeAlbaran.Caption := DameTituloListadoDefectoGrupo(34);
  AInformeCartaPortes1.Caption := DameTituloListadoDefectoGrupo(162);
  AInformeCartaPortes2.Caption := DameTituloListadoDefectoGrupo(652);
  AConfListadoAlbPorte1.Caption := DameTituloListadoDefectoGrupo(162);
  AConfListadoAlbPorte2.Caption := DameTituloListadoDefectoGrupo(652);
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  RefrescaAvisos;
  Editando := False;
  if (DMMain.EstadoKri(140) <> 1) then
  begin
     ADescargaLector.Visible := False;
  end;

  if (DMMain.EstadoKri(152) <> 1) then
     AEnviarAlbaranMailPDF.Visible := False;

  EFBuscaNIFKRI.Width := 1;
  EFBuscaNIFKRI.Visible := False;

  FUpdating := False;
  RichEditConFoco := DBRENotas;
  GetFontNames;

  if (DMMain.EstadoKri(196) = 1) then {Rich Edit en Notas}
  begin
     TBRichNotas.Visible := True;
     DBRENotas.PlainText := False;
     DBRENotasInternasKri.PlainText := False;
  end;

  if (DMMain.EstadoKri(169) = 1) then {Habilita Notas Internas en Documentos de Ventas}
  begin
     //DBMNotas.Align := AlTop;
     DBRENotas.Height := (DBRENotas.Height + DBRENotasInternasKri.Height) div 2;
     DBRENotasInternasKri.Visible := True;
  end
  else
  begin
     //DBMNotas.Align := AlClient;
     DBRENotasInternasKri.Visible := False;
  end;
  AFactura.Visible := True;
  if (DMMain.EstadoKri(185) = 1) then {Invisibiliza el traspaso directo a factura}
     AFactura.Visible := False;

  if (DMMain.EstadoKri(190) <> 1) then
  begin
     LTipoLineaKri.Visible := False;
     DBEFTipoLineaKri.Visible := False;
     ETipoLineaKri.Visible := False;
     DBGFDetalle.FindColumn('TIPO_LINEA_KRI').Visible := False;
  end;
  ColActual := DBGFDetalle.Columns[0];

  KriConf211 := DMMain.EstadoKri(211) = 1;

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
     ANIFAlbaran.Enabled := False;

  TSEDI.TabVisible := (LeeParametro('MODREST026') = 'S');

  if (DMMain.EstadoKri(264) <> 1) then {Habilita el envío de email con pdf a traves del cliente windows}
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarAlbaranMailPDF2) then
           ALMain.Actions[i].Free;

  PDetalleAlturaMinima := 200;
  DBEFPortesChange(Sender); {Ejecuto para reestablecer la visibilidad de rango e indice de portes}

  { dji lrk kri - Part 2 - Para que se pueda alagar la pantalla y quepan mas lineas - TB }
  {
  Width := w;
  Height := h;
  Constraints.MaxWidth := Width;
  Constraints.MinWidth := Width;
  Constraints.MinHeight := Height;
  }

  with DBGFDetalle do
  begin
     i := Tablas.IndexOf('VER_ARTICULOS_COD_CLI');
     if (i >= 0) then
     begin
        if (DMMain.EstadoKri(44) = 1) then
           CamposDesplegar[i] := '1'
        else
           CamposDesplegar[i] := '0';
     end;
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

  AExportarVGG.Visible := (DMMain.EstadoKri(58) = 1);
  DBCBFacturable.Enabled := (LeeParametro('ALBFACT002') = 'S');

  HabilitaEnlaces;

  // Color campo ID
  ColorCampoID(DBERIG);
  ColorCampoID(EFSERIE);

  // Restringimos edicion de fecha segun parametros
  HabilitaEdit(DBDTPFecha, (LeeParametro('ALBFECH001') <> 'S'));
  HabilitaEdit(DBDTPHoraDocumento, (LeeParametro('ALBFECH001') <> 'S'));
  HabilitaEdit(DBDTPFechaServido, (LeeParametro('ALBFECH002') <> 'S'));
  HabilitaEdit(DBDTPHoraServido, (LeeParametro('ALBFECH002') <> 'S'));


  TSDirManual.TabVisible := (LeeParametro('VENDIRM001') = 'S');

  // Muestra tabla por defecto
  if (LeeParametro('DOCCONF001') = 'S') then
     PCMain.ActivePage := TSTabla;

  with DBGMain do
  begin
     i := CamposAMarcar.IndexOf('MODIFICA_DOC');
     if (i >= 0) and (CamposChecked.Count >= i - 1) then
        CamposChecked[i] := '2';
  end;

  AbreOCierra;
end;

procedure TFMAlbaranes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // DMMain.Log('TFMAlbaranes.FormClose');
  inherited;
  CierraData(DMAlbaranes);
  MTelefonos.Free;
  MNotas.Free;
end;

procedure TFMAlbaranes.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleBusqueda');
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_VENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';

        if (Param_ARTBUSQ003) then
        begin
           CondicionBusqueda := CondicionBusqueda + ' AND ( (ARTICULO = ''' + REntorno.ArtTextoLibre + ''') ';
           CondicionBusqueda := CondicionBusqueda + '    OR (ARTICULO IN (SELECT ARTICULO FROM ART_ARTICULOS_CODCLI WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND CLIENTE = ' + DMAlbaranes.QMCabeceraCLIENTE.AsString + '))';
           CondicionBusqueda := CondicionBusqueda + '     )';
        end;
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
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_COD_CLI') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND CLIENTE=' + EFCliente.Text;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO_CLIENTE';
     end
     else
     if ((Trim(TablaABuscar) = 'SYS_TIPO_IVA') or (Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL')) then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_VENTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IVA') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMAlbaranes.QMDetalleTIPO_IVA.AsInteger);
           if (Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMAlbaranes.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
        end;

        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if (Trim(TablaABuscar) = 'SYS_TERCEROS_DIRECCIONES') then
     begin
        CondicionBusqueda := 'TERCERO = ' + DMAlbaranes.QMCabeceraTERCERO.AsString + ' AND ACTIVO = 1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DIRECCION';
     end
     else
     if Trim(TablaABuscar) = 'EMP_PROYECTOS' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(CLIENTE_NULL=' + EFCliente.Text +
           ' or CLIENTE_NULL=-1 or CLIENTE_NULL is null) and ' +
           '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROYECTO';
     end
     else if Trim(TablaABuscar) = 'SYS_EMBALAJES' then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CAJA';
     end
     else if Trim(TablaABuscar) = 'SYS_TIPO_LINEA_VENTA_KRI' then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ID';
     end
     else if Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(ARTICULO=''' + DMAlbaranes.QMDetalleARTICULO.AsString + ''')';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO DESC,TIPO';
     end
     else if Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(ALMACEN=''' + DMAlbaranes.QMDetalleALMACEN.AsString + ''')';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'COMPOSICION';
     end
     else if Trim(TablaABuscar) = 'ART_ALMACENES' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ACTIVO = 1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ALMACEN';
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
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMAlbaranes.TSFichaShow(Sender: TObject);
begin
  inherited;
  // DMMain.Log('TFMAlbaranes.TSFichaShow');
  ControlEdit := CEMain;
end;

procedure TFMAlbaranes.TSNotasShow(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.TSNotasShow');
  ControlEdit := CENotas;
end;

procedure TFMAlbaranes.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  // DMMain.Log('TFMAlbaranes.EPMainClickRango');
  // Se quita el filtro por Numero de Serie
  // BusquedaComleja() ya recra el SelectSQL - DMAlbaranes.BuscaNumSerie(NumSerie, False);
  TButtBuscarNumSerie.Down := False;

  Resultado := DMAlbaranes.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;

  Continua := False;

  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
end;

procedure TFMAlbaranes.MuestraFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
  PlanTmp : string;
begin
  // DMMain.Log('TFMAlbaranes.MuestraFiltrado');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try
     with DMLstAlbaranes do
     begin
        TempSql := TStringList.Create;
        SqlFiltro := TStringList.Create;
        try
           SqlFiltro.AddStrings(DMAlbaranes.QMCabecera.SelectSQL);
           TempSql.AddStrings(QMCabecera.SelectSQL);
           // Utilizo la vista para listado
           QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_ALBARAN', 'VER_CABECERAS_ALBARAN_LST', [rfReplaceAll]);
           PlanTmp := QMCabecera.Plan.Text;
           QMCabecera.Plan.Text := '';
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(SqlFiltro);
           QMCabecera.Params.ByName['SERIE'].AsString := EFSERIE.Text;
           MostrarListadoFiltrado(Modo, FiltroListadoFiltrado, EFSerie.Text);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(TempSQL);
           QMCabecera.Plan.Text := PlanTmp;
        finally
           SqlFiltro.Free;
           TempSql.Free;
        end;
     end;
  finally
     CierraData(DMLstAlbaranes);
  end;
  RefrescaAvisos;
end;

procedure TFMAlbaranes.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  // DMMain.Log('TFMAlbaranes.EFSerieChange');
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMAlbaranes.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  MargenMinimo := StrToFloatDef(LeeParametro('DOCMARG001', EFSerie.Text), -1);
  param_DOCMARG003 := (LeeParametro('DOCMARG003', EFSerie.Text) = 'S');
  param_ALBPREC001 := (LeeParametro('ALBPREC001', EFSerie.Text) = 'S');
  param_ALBESTA001 := (LeeParametro('ALBESTA001', EFSerie.Text) = 'S');
  // Edicion de IVA habilitada en documentos de venta
  Param_VENTIVA001 := (LeeParametro('VENTIVA001', EFSerie.Text) = 'S');
  // Parametro DOCPREC001 - Precio en documentos de venta modificable
  Param_DOCPREC001 := (LeeParametro('DOCPREC001', EFSerie.Text) = 'N');
  Param_ARTBUSQ003 := (LeeParametro('ARTBUSQ003', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005', EFSerie.Text), 0);
  Param_DOCPCOS001 := LeeParametro('ALBPCOS001', EFSerie.Text);
  PNLRiesgo.Visible := (LeeParametro('VENRIES001') = 'S');
  param_ALBMARG001 := (LeeParametro('ALBMARG001', EFSerie.Text) = 'S');
  param_VENUSEC001 := (LeeParametro('VENUSEC001', EFSerie.Text) = 'S');
  param_VENUEXT001 := (LeeParametro('VENUEXT001', EFSerie.Text) = 'S');
  param_VENREST002 := (LeeParametro('VENREST002', EFSerie.Text) = 'S');

  param_ALBINSE001 := (LeeParametro('ALBINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_ALBINSE001;
  DBERIG.ReadOnly := not param_ALBINSE001;

  if (LeeParametro('VENREST001', EFSerie.Text) = 'S') then
  begin
     DBEDtoCial.ReadOnly := True;
     DBEDtoCial.Enabled := False;
     DBEDtoCial.Color := clInfoBk;
  end
  else
  begin
     DBEDtoCial.ReadOnly := False;
     DBEDtoCial.Enabled := True;
     DBEDtoCial.Color := clWindow;
  end;

  if param_DOCMARG003 then
     DBEMargen.DataField := 'MARGEN'
  else
     DBEMargen.DataField := 'MARGEN_SIN_PORTES';

  EstableceVisibilidadCamposDetalle;
  EstableceVisibilidadStockAlmacen;
  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
end;

procedure TFMAlbaranes.EstableceVisibilidadCamposDetalle;
var
  i : integer;
  s : string;
begin
  // DMMain.Log('TFMAlbaranes.EstableceVisibilidadPrecioCoste');
  // Busco columna Precio de Coste
  i := EncuentraField(DBGFDetalle, 'P_COSTE');
  if (i >= 0) then
  begin
     with DBGFDetalle.Columns.Items[i] do
     begin
        ReadOnly := False;
        Color := clWindow;

        // Deshabilitado o invisible
        if ((Param_DOCPCOS001 = 'D') or (Param_DOCPCOS001 = 'I')) then
        begin
           ReadOnly := True;
           Color := clInfoBk;
        end;

        // Invisible
        if (Param_DOCPCOS001 = 'I') then
           Visible := False;
     end;
  end;

  param_VENREST002 := (LeeParametro('VENREST002', EFSerie.Text) = 'S');
  i := EncuentraField(DBGFDetalle, 'DESCUENTO');
  if (i >= 0) then
  begin
     if param_VENREST002 then
     begin
        DBGFDetalle.Columns.Items[i].ReadOnly := True;
        DBGFDetalle.Columns.Items[i].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle.Columns.Items[i].ReadOnly := False;
        DBGFDetalle.Columns.Items[i].Color := clWindow;
     end;
  end;

  i := EncuentraField(DBGFDetalle, 'DESCUENTO_2');
  if (i >= 0) then
  begin
     if param_VENREST002 then
     begin
        DBGFDetalle.Columns.Items[i].ReadOnly := True;
        DBGFDetalle.Columns.Items[i].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle.Columns.Items[i].ReadOnly := False;
        DBGFDetalle.Columns.Items[i].Color := clWindow;
     end;
  end;

  i := EncuentraField(DBGFDetalle, 'DESCUENTO_3');
  if (i >= 0) then
  begin
     if param_VENREST002 then
     begin
        DBGFDetalle.Columns.Items[i].ReadOnly := True;
        DBGFDetalle.Columns.Items[i].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle.Columns.Items[i].ReadOnly := False;
        DBGFDetalle.Columns.Items[i].Color := clWindow;
     end;
  end;

  i := EncuentraField(DBGFDetalle, 'TIPO_UNIDAD_LOGISTICA');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (Param_SYSCONF005 <> 0);

  i := EncuentraField(DBGFDetalle, 'UNIDADES_LOGISTICAS');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (Param_SYSCONF005 <> 0);

  i := EncuentraField(DBGFDetalle, 'TITULO_UNIDAD_LOGISTICA');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (Param_SYSCONF005 <> 0);

  i := EncuentraField(DBGFDetalle, 'MARGEN');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := param_ALBMARG001
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'MARGEN';
        Title.Caption := _('Margen');
        Visible := param_ALBMARG001;
     end;
  end;

  i := EncuentraField(DBGFDetalle, 'TITULO');
  if (i >= 0) then
  begin
     DBGFDetalle.Columns.Items[i].Color := clWindow;
     DBGFDetalle.Columns.Items[i].Title.Caption := _('Desc. Artículo');
     ACambiaTitulo.Hint := _('Mostrar títulos en el idioma');
     TButtCambiaDescripcion.Tag := 0;
  end
  else
  begin
     i := EncuentraField(DBGFDetalle, 'TITULO_IDIOMA');
     if (i >= 0) then
     begin
        DBGFDetalle.Columns.Items[i].Color := $00D6D6D6;
        DBGFDetalle.Columns.Items[i].Title.Caption := _('Desc. Artículo');
        TButtCambiaDescripcion.Tag := 1;
        ACambiaTitulo.Hint := _('Mostrar títulos predeterminado');
     end
     else
     begin
        with DBGFDetalle.Columns.Add do
        begin
           FieldName := 'TITULO';
           Color := clWindow;
           Title.Caption := _('Desc. Artículo');
           Visible := True;
           ACambiaTitulo.Hint := _('Mostrar títulos en el idioma');
           TButtCambiaDescripcion.Tag := 0;
        end;
     end;
  end;

  { No obligo a que este visible este campo
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
  }
  i := EncuentraField(DBGFDetalle, 'UNIDADES');
  s := LeeParametro('VENUNID001', EFSerie.Text);
  if (i >= 0) and (s <> '') then
     DBGFDetalle.FindColumn('UNIDADES').Title.Caption := s;

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
  s := LeeParametro('VENUSEC002', EFSerie.Text);
  if (i >= 0) and (s <> '') then
     DBGFDetalle.FindColumn('UNIDADES_SEC').Title.Caption := s;
  DBGFDetalle.Columns.Items[i].Visible := REntorno.PVP_Ud_Sec or param_VENUSEC001;

  i := EncuentraField(DBGFDetalle, 'APLICA_UNIDADES_SECUNDARIAS');
  if (i < 0) then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'APLICA_UNIDADES_SECUNDARIAS';
        Title.Caption := _('Apl. U.Sec.');
     end;
  end;
  i := EncuentraField(DBGFDetalle, 'APLICA_UNIDADES_SECUNDARIAS');
  DBGFDetalle.Columns.Items[i].Visible := REntorno.PVP_Ud_Sec or param_VENUSEC001;
  DBGFDetalle.Columns.Items[i].Width := 40;

  i := EncuentraField(DBGFDetalle, 'UE_MEDIDA1');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA1';
        Title.Caption := _('Medida 1');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Title.Caption := _('Medida 1');

  i := EncuentraField(DBGFDetalle, 'UE_MEDIDA2');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA2';
        Title.Caption := _('Medida 2');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Title.Caption := _('Medida 2');

  i := EncuentraField(DBGFDetalle, 'UE_MEDIDA3');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA3';
        Title.Caption := _('Medida 3');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Title.Caption := _('Medida 3');

  i := EncuentraField(DBGFDetalle, 'UE_MEDIDA4');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA4';
        Title.Caption := _('Medida 4');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Title.Caption := _('Medida 4');

  // Asigno nombre a campos ALFA
  with DBGFDetalle do
  begin
     for i := 1 to 8 do
     begin
        if (EncuentraField(DBGFDetalle, Format('ALFA_%d', [i])) >= 0) then
        begin
           FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
           if (FindColumn(Format('ALFA_%d', [i])).Title.Caption = '') then
              FindColumn(Format('ALFA_%d', [i])).Title.Caption := Format(_('Campo %d'), [i]);
        end;
     end;

     for i := 1 to 4 do
     begin
        if (EncuentraField(DBGFDetalle, Format('UE_MEDIDA%d', [i])) >= 0) then
        begin
           FindColumn(Format('UE_MEDIDA%d', [i])).Title.Caption := LeeParametro(format('UDEDESC%3.3d', [i]));
           if (FindColumn(Format('UE_MEDIDA%d', [i])).Title.Caption = '') then
              FindColumn(Format('UE_MEDIDA%d', [i])).Title.Caption := Format(_('Medida %d'), [i]);
        end;
     end;

     i := EncuentraField(DBGFDetalle, 'PRO_NUM_PLANO');
     s := LeeParametro('LABPNPL001', EFSerie.Text);
     if (i >= 0) and (s <> '') then
        DBGFDetalle.FindColumn('PRO_NUM_PLANO').Title.Caption := s;

     i := EncuentraField(DBGFDetalle, 'NO_FABRICACION_KRI');
     s := LeeParametro('LABFABK001', EFSerie.Text);
     if (i >= 0) and (s <> '') then
        DBGFDetalle.FindColumn('NO_FABRICACION_KRI').Title.Caption := s;
  end;

  if (DMMain.EstadoKri(439) = 0) then
  begin
     i := EncuentraField(DBGFDetalle, 'BULTOS');
     if (i >= 0) then
     begin
        with DBGFDetalle.Columns.Items[i] do
        begin
           ReadOnly := False;
           Color := clWindow;
           Font.Color := clWindowText;
        end;
     end;
  end;
end;

procedure TFMAlbaranes.FormActivate(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.FormActivate');
  inherited;

  EstableceVisibilidadCamposDetalle;
  EstableceVisibilidadStockAlmacen;
end;

procedure TFMAlbaranes.ANotasDetalleExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ANotasDetalleExecute');
  DMAlbaranes.PreparaNotasDetalle;
  // DMAlbaranes.NotasLote := True;
  EditarCampoNotas(Self, DMAlbaranes.DSQMDetalle, DMAlbaranes.QMDetalleNOTAS, DMAlbaranes.QMDetalleNOTAS2, (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranes.AInfoStocksExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInfoStocksExecute');
  MuestraStock(0);
end;

procedure TFMAlbaranes.AProcedenciaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AProcedenciaExecute');
  DMAlbaranes.Procedencia;
end;

procedure TFMAlbaranes.TSTablaShow(Sender: TObject);
begin
  inherited;

  // DMMain.Log('TFMAlbaranes.TSTablaShow');
  ControlEdit := CEMain;
  if not (Editando) then
     DMAlbaranes.RefrescaTabla;
end;

procedure TFMAlbaranes.AUnidadesExtExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AUnidadesExtExecute');
  if DBGFDetalle.SelectedField.FieldName = 'UNIDADES' then
     DBGFDetalle.SelectedIndex := DBGFDetalle.SelectedIndex + 1;

  DMAlbaranes.CambiaUnidadesExt(DMAlbaranes.QMDetalleArticulo, True, True);
end;

procedure TFMAlbaranes.APreciosTarifaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.APreciosTarifaExecute');
  DMAlbaranes.CambiaPreciosTarifa;
end;

procedure TFMAlbaranes.AInfoHistoricoExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInfoHistoricoExecute');
  DMAlbaranes.Historico;
end;

procedure TFMAlbaranes.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavDetalleBeforeAction');
  if Button = nbCancel then
     DMAlbaranes.BorraLineaUnidadesExt;

  if Button = nbDelete then
     DMAlbaranes.ControlaRestriccion;

  if Button in [nbRefresh, nbDelete, nbPost] then
     DMAlbaranes.ReiniciaStock(DMAlbaranes.QMDetalleARTICULO.AsString);

  HabilitaBotones;
end;

procedure TFMAlbaranes.DBGFDetalleColEnter(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleColEnter');
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

procedure TFMAlbaranes.ASerializacionExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ASerializacionExecute');
  if (DMMain.EstadoKri(372) <> 1) then
  begin
     DMAlbaranes.PreparaSerializacion;

     if not DMAlbaranes.Serializado then
        ShowMessage('El artículo no está serializado')
     else
     begin
        FMIntroduceSeries := TFMIntroduceSeries.Create(Self);
        FMIntroduceSeries.Inicializar(DMAlbaranes.QMDetalleID_DETALLES_S.AsInteger, 'ALB');
        FMIntroduceSeries.ShowModal;
     end;
  end
  else
     DMAlbaranes.EditarNroDeSerieKri;
end;

procedure TFMAlbaranes.DBGFDetalleCampoDevuelve(Sender: TObject; Valor: string);
begin
  {
  // DMMain.Log('TFMAlbaranes.DBGFDetalleCampoDevuelve');
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMAlbaranes.BusquedaArticulo(Valor);
  DMAlbaranes.Continua;
  }
end;

procedure TFMAlbaranes.DBGFDetalleExiste(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleExiste');
  // if (DBGFDetalle.ColumnaActual = 'ARTICULO') then
  //    DMAlbaranes.VaciaNumSerie;
end;

procedure TFMAlbaranes.NavDetalleChangeState(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.NavDetalleChangeState');
  HabilitaBotonesDetalle;
  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

procedure TFMAlbaranes.APVPExecute(Sender: TObject);
var
  PVP : double;
begin
  // DMMain.Log('TFMAlbaranes.APVPExecute');
  with DMAlbaranes do
  begin
     if (DameEstado = 0) then
     begin
        // PVP := TFPregPVP.Create(Self).mostrar;
        PVP := 0;
        PideDato('DBL', PVP, 'P.V.P.');
        if (PVP > 0) then
        begin
           Calcula_Unidades := False;
           CalculaUnidades(PVP);
           Calcula_Unidades := True;
        end;
     end;
  end;
end;

procedure TFMAlbaranes.AgrupacionPedidos(Serie: string; Contador: integer);
begin
  // DMMain.Log('TFMAlbaranes.AgrupacionPedidos');
  // Abrimos las facturas destino de la recepción de pedidos
  DMAlbaranes.AgrupacionPedidos(Serie, Contador);
  EFSerie.Text := Serie;
  if (PCMain.ActivePage = TSCartaPorte) then
     DMAlbaranes.AbrirCartaPortes;
  RefrescaAvisos;
end;

//sfg-rsl -begin - proceso para imprimir desde agrupación de pedidos por pistola
procedure zAbreImpresion(Serie: string; Contador: integer; peso, bultos: double; imprimir_albaran, imprimir_portes, imprimir_etiquetas: boolean; num_eti: integer);
begin
  DMMain.Log('zAbreImpresion (TFMAlbaranes)');
  { TODO -cTyC : Esto deberían ser varios metodos del objeto TFMAlbaranes }
  // Abrimos el albarán
  FMain.EjecutaAccion(FMain.AAlbaranes);
  DMAlbaranes.AgrupacionPedidos(Serie, Contador);
  //Carta Portes
  FMAlbaranes.Visible := False;

  if (imprimir_albaran) then
  begin
     // dos copias
     AbreData(TDMLstAlbaranes, DMLstAlbaranes);
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, Serie,
        0, 1, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
     CierraData(DMLstAlbaranes);

     AbreData(TDMLstAlbaranes, DMLstAlbaranes);
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, Serie,
        0, 1, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
     CierraData(DMLstAlbaranes);
  end;

  if (imprimir_portes) then
  begin
     // dos copias
     DMAlbaranes.AbrirCartaPortes;
     DMAlbaranes.QMCartaPortes.Edit;
     DMAlbaranes.QMCartaPortesPESO.AsFloat := peso;
     DMAlbaranes.QMCartaPortesBULTOS.AsFloat := bultos;
     DMAlbaranes.QMCartaPortes.Post;

     AbreData(TDMLstAlbaranes, DMLstAlbaranes);
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, Serie,
        0, 5, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
     CierraData(DMLstAlbaranes);
  end;

  if (imprimir_etiquetas) then
  begin
     AbreData(TDMLstAlbaranesEti, DMLstAlbaranesEti);
     DMLstAlbaranesEti.MostrarListado(DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, DMAlbaranes.QMCabeceraRIG.AsInteger, 0, num_eti,
        DMAlbaranes.QMCabeceraFECHA.AsDateTime, 0, serie);
     CierraData(DMLstAlbaranesEti);
  end;

  FMAlbaranes.Close;
end;

procedure TFMAlbaranes.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  ETituloMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);

  DMAlbaranes.MascarasMoneda;
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

procedure TFMAlbaranes.ANewClienteExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ANewClienteExecute');
  if EstructuraCreada then
  begin
     try
        FMain.SourceCall := True;
        FMain.EnlaceModal := True;
        FMain.EnlaceInstancias := True;
        FMain.EnlaceCrea := True;
        FMain.EjecutaAccion(FMain.AClientes);

        if FMain.EnlaceDatos <> Null then
        begin
           EFCliente.SetBufferText(FMain.EnlaceDatos);
        end;
        EFDireccion.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMAlbaranes.ANewAgenteExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ANewAgenteExecute');
  if EstructuraCreada then
  begin
     try
        FMain.SourceCall := True;
        FMain.EnlaceModal := True;
        FMain.EnlaceInstancias := True;
        FMain.EnlaceCrea := True;
        FMain.EjecutaAccion(FMain.AAgentes);

        if FMain.EnlaceDatos <> Null then
        begin
           EFAgente.SetBufferText(FMain.EnlaceDatos);
        end;
        EFFormaPago.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMAlbaranes.ANewArticuloExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ANewArticuloExecute');
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AArticulos);
     if FMain.EnlaceDatos <> Null then
     begin
        DMAlbaranes.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMAlbaranes.AAClienteExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAClienteExecute');
  if EstructuraCreada then
     if PNLEdCabecera.Enabled then
     begin
        if EFCliente.Text <> '' then
           FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + EFCliente.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMAlbaranes.QMCabeceraCLIENTE.AsInteger));
end;

procedure TFMAlbaranes.AAAgenteExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAAgenteExecute');
  if EstructuraCreada then
     if PNLEdCabecera.Enabled then
     begin
        if EFAgente.Text <> '' then
           FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + EFAgente.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + IntToStr(DMAlbaranes.QMCabeceraAGENTE.AsInteger));
end;

procedure TFMAlbaranes.SBAClienteDblClick(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.SBAClienteDblClick');
  AACliente.Execute;
end;

procedure TFMAlbaranes.SBAAgenteDblClick(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.SBAAgenteDblClick');
  AAAgente.Execute;
end;

procedure TFMAlbaranes.HabilitaEnlaces;
begin
  // DMMain.Log('TFMAlbaranes.HabilitaEnlaces');
  if (FMain.AClientes.Enabled = False) then
  begin
     EFCliente.Accion := nil;
     SBACliente.Width := 0;
     // MIVerDatosCliente.Visible := False;
  end
  else
  begin
     SolapaControles(SBACliente, DBETituloCliente);
     DBETituloCliente.Color := REntorno.ColorEnlaceActivo;
  end;

  if (FMain.AAgentes.Enabled = False) then
  begin
     EFAgente.Accion := nil;
     SBAAgente.Width := 0;
     // MIVerDatosAgente.Visible := False;
  end
  else
  begin
     SolapaControles(SBAAgente, ETituloAgente);
     ETituloAgente.Color := REntorno.ColorEnlaceActivo;
  end;

  if (FMain.ATerceros.Enabled = False) then
  begin
     SBATercero.Width := 0;
  end
  else
  begin
     SolapaControles(SBATercero, DBENombreComercial);
     DBENombreComercial.Color := REntorno.ColorEnlaceActivo;
  end;

  DBETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, DBETitProyecto);
end;

procedure TFMAlbaranes.AImprimeExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AImprimeExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        1, 1, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));
  finally
     CierraData(DMLstAlbaranes);
  end;
end;

procedure TFMAlbaranes.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  // DMMain.Log('TFMAlbaranes.FiltraFactura');
  EFSerie.Text := Serie;
  DMAlbaranes.FiltraCabecera(Ejercicio, Serie, Rig);
  if (PCMain.ActivePage = TSCartaPorte) then
     DMAlbaranes.AbrirCartaPortes;
  RefrescaAvisos;
end;

procedure TFMAlbaranes.DBETituloClienteEnter(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBETituloClienteEnter');
  EFCliente.SetFocus;
end;

procedure TFMAlbaranes.ETituloAgenteEnter(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ETituloAgenteEnter');
  if (EFAgente.Enabled) then
     EFAgente.SetFocus;
end;

procedure TFMAlbaranes.HabilitaBotones;
var
  Habilitado : boolean;
begin
  // DMMain.Log('TFMAlbaranes.HabilitaBotones');
  Habilitado := DMAlbaranes.HayDocumentos;

  AFactura.Enabled := Habilitado;
  AAlbaranMulti.Enabled := Habilitado;
  ADuplicar.Enabled := Habilitado;
  ACondicionesClientes.Enabled := Habilitado;
  ARefrescaDetalle.Enabled := Habilitado;
  AAbrirCerrar.Enabled := Habilitado and param_ALBESTA001;
  AAnulaDocumento.Enabled := Habilitado;
  AHerencia.Enabled := Habilitado;
  AHistoricoSerializacion.Enabled := Habilitado;

  EFSerie.Enabled := REntorno.SerieRestringida = '';
  EFAlmacen.Enabled := REntorno.AlmacenRestringido = '';

  HabilitaBotonesDetalle;

  with DMAlbaranes do
  begin
     DBEAlmacenDeposito.Visible := QMCabeceraDEPOSITO.AsInteger = 1;
     ETituloAlmacenDeposito.Visible := QMCabeceraDEPOSITO.AsInteger = 1;
  end;

  // Parametro DOCPREC001 - Precio en documentos de venta modificable
  if Param_DOCPREC001 then
     HabilitaColumna(DBGFDetalle, 'PRECIO', False);

  RefrescaAvisos;
end;

procedure TFMAlbaranes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavMainClickAfterAdjust');
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
  // bit 2 = 0 --> Albaranes restringidos
  if (((REntorno.RestriccionDocumento and 2) = 0) and
     ((DMAlbaranes.xInfoActualizadaMODIFICA_DOC.AsInteger and 2) = 2)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if Button in [nbPost, nbDelete, nbCancel] then
     HabilitaBotones
  else if Button in [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbRefresh] then
  begin
     HabilitaBotonesDetalle;
     DMAlbaranes.GrabaCarta := True;
  end;
  {dji lrk kri}
  if ((Button in [nbInsert]) and (REntorno.AlmacenRestringido <> '')) then
     EFAlmacen.Text := REntorno.AlmacenRestringido;

  PNLOrtografia.Visible := (Button in [nbEdit]);
  RefrescaAvisos;
end;

procedure TFMAlbaranes.HabilitaBotonesDetalle;
var
  Habil, HabilEd, Habilitado : boolean;
begin
  // DMMain.Log('TFMAlbaranes.HabilitaBotonesDetalle');
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMAlbaranes.HayDetalle) or (DMAlbaranes.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMAlbaranes.QMDetalle.State in [dsInsert, dsEdit]);

  TButtEditaLineas.Enabled := HabilEd;
  TButtInfStocks.Enabled := Habil;
  TButtHerencia.Enabled := HabilEd;
  TButtProcedenciaLinea.Enabled := HabilEd;
  TButtUnidadesExt.Enabled := HabilEd;
  TButtPrecios.Enabled := Habil;
  TButtInfoHistorico.Enabled := Habil;
  TButtSerializacion.Enabled := HabilEd;
  TBInfolotes.Enabled := HabilEd;
  AOrdenaLineas.Enabled := Habil;
  TButtArtCli.Enabled := Habil;
  ACambiaTitulo.Enabled := HabilEd;
  TButtMuestraUbiacion.Enabled := Habil;
  TButtBuscarArticulo.Enabled := True;   // Siempre habilitado
  TButtImportarDetalle.Enabled := True;  // Siempre Activo

  with DMAlbaranes do
  begin
     DBEAlmacenDeposito.Visible := QMCabeceraDEPOSITO.AsInteger = 1;
     ETituloAlmacenDeposito.Visible := QMCabeceraDEPOSITO.AsInteger = 1;
  end;
  {dji lrk kri - Nava - Descuento segun total de albaran, refresca solo dto.}
  RefrescaDescuentoKri;

  // Controlamos que se pueda modificar el precio de venta + descuentos + tipo IVA
  Habilitado := (DMAlbaranes.QMDetalleARTICULO.AsString = REntorno.ArtTextoLibre) or (DMAlbaranes.xArticulos.Active and (DMAlbaranes.xArticulos.FieldByName('TIPO_ARTICULO').AsString = 'DTO')) or param_ALBPREC001;
  HabilitaColumna(DBGFDetalle, 'PRECIO', Habilitado);
  HabilitaColumna(DBGFDetalle, 'DESCUENTO', Habilitado and (not param_VENREST002));
  HabilitaColumna(DBGFDetalle, 'DESCUENTO_2', Habilitado and (not param_VENREST002));
  HabilitaColumna(DBGFDetalle, 'DESCUENTO_3', Habilitado and (not param_VENREST002));
  // En el caso del Tipo de IVA también tenemos que ver el parámetro VENTIVA001
  HabilitaColumna(DBGFDetalle, 'TIPO_IVA', Habilitado and Param_VENTIVA001);
end;

procedure TFMAlbaranes.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavDetalleClickAfterAdjust');
  //if button in [nbPost, nbDelete, nbCancel] then HabilitaBotonesDetalle;
  HabilitaBotonesDetalle;

  if Button in [nbPost, nbDelete, nbCancel] then
     HabilitaBotones;

  if Button in [nbRefresh] then
     DMAlbaranes.RellenaDatosOldLinea;
end;

procedure TFMAlbaranes.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleKeyDown');
  //if ((DMAlbaranes.QMDetalle.State = dsinsert)) then HabilitaBotonesDetalle;
  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranes.MuestraResumenFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  // DMMain.Log('TFMAlbaranes.MuestraResumenFiltrado');
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMAlbaranes.QMCabecera.SelectSQL);
     AbreData(TDMLstAlbaranesCli, DMLstAlbaranesCli);
     with DMLstAlbaranesCli do
     begin
        TempSql.AddStrings(QMCabecera.SelectSQL);
        // Utilizo la vista para listado
        QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_ALBARAN', 'VER_CABECERAS_ALBARAN_LST', [rfReplaceAll]);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(SqlFiltro);
        QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
        MostrarListadoFiltrado(Modo, FiltroListadoFiltrado, EFSerie.Text);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMLstAlbaranesCli);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMAlbaranes.AInfoLotesExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInfoLotesExecute');
  DMAlbaranes.InfoLotes;
  {DMAlbaranes.EditarLoteKri;}
end;

procedure TFMAlbaranes.AArticuloExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AArticuloExecute');
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMAlbaranes.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMAlbaranes.DBGFDetalleDblClick(Sender: TObject);
var
  CodigoCliente : string;
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleDblClick');
  if DMAlbaranes.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;

     if ((UpperCase(ColActual.FieldName) = 'ID_LOTE') or (UpperCase(ColActual.FieldName) = 'LOTE')) then
        FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(DMAlbaranes.QMDetalleID_LOTE.AsInteger));

     if (UpperCase(ColActual.FieldName) = 'CODIGO_CLIENTE') then
     begin
        CodigoCliente := DMAlbaranes.QMDetalleCODIGO_CLIENTE.AsString;
        if (PideDato('STR', CodigoCliente, _('Nuevo codigo de cliente'))) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_CODCLI ( ');
                 SQL.Add(' EMPRESA, ARTICULO, CLIENTE, CODIGO_CLIENTE) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :EMPRESA, :ARTICULO, :CLIENTE, :CODIGO_CLIENTE) ');
                 SQL.Add(' MATCHING (EMPRESA, ARTICULO, CLIENTE) ');
                 Params.ByName['EMPRESA'].AsInteger := DMAlbaranes.QMDetalleEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := DMAlbaranes.QMDetalleARTICULO.AsString;
                 Params.ByName['CLIENTE'].AsInteger := DMAlbaranes.QMCabeceraCLIENTE.AsInteger;
                 Params.ByName['CODIGO_CLIENTE'].AsString := CodigoCliente;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           DMAlbaranes.QMDetalle.Refresh;
        end;
     end;

     // Si el albarán está cerrada, preguntamos el valor de Precio de Coste y Coste Adicional.
     if (DMAlbaranes.QMCabeceraESTADO.AsInteger = 5) then
     begin
        if ((Param_DOCPCOS001 = 'V') and (UpperCase(ColActual.FieldName) = 'P_COSTE')) then
           ACambioPCosteLinea.Execute;

        if (UpperCase(ColActual.FieldName) = 'COSTE_ADICIONAL') then
           ACambioCosteAdicionalLinea.Execute;
     end;
  end;
end;

procedure TFMAlbaranes.AArtCliExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AArtCliExecute');
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMAlbaranes.QMDetalleARTICULO.AsString, 1);
end;

procedure TFMAlbaranes.ACliArtExecute(Sender: TObject);
begin
  inherited;
  TFMVentasCli.Create(Self).MuestraCliente(DMAlbaranes.QMCabeceraCLIENTE.AsInteger, 2);
end;

procedure TFMAlbaranes.RelojNotasTimer(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.RelojNotasTimer');
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMAlbaranes.AInformeAlbaranExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInformeAlbaranExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  AInformeAlbaran.Enabled := False;
  try
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        0, 1, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));
  finally
     AInformeAlbaran.Enabled := True;
     CierraData(DMLstAlbaranes);
  end;

  // Refresco valor de check del estado listado
  DMAlbaranes.InfoActualiza;
end;

procedure TFMAlbaranes.AInformeAlbaran2Execute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInformeAlbaran2Execute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        0, 2, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));
  finally
     CierraData(DMLstAlbaranes);
  end;
  // Refresco valor de check del estado listado
  DMAlbaranes.InfoActualiza;
end;

procedure TFMAlbaranes.AInformeAlbaran3Execute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInformeAlbaran3Execute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        0, 3, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));
  finally
     CierraData(DMLstAlbaranes);
  end;
  // Refresco valor de check del estado listado
  DMAlbaranes.InfoActualiza;
end;

procedure TFMAlbaranes.AInformeAlbaran4Execute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInformeAlbaran4Execute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        0, 4, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));
  finally
     CierraData(DMLstAlbaranes);
  end;
  // Refresco valor de check del estado listado
  DMAlbaranes.InfoActualiza;
end;

procedure TFMAlbaranes.AVisualizarAlbaranesFiltradosExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AVisualizarAlbaranesFiltradosExecute');
  MuestraFiltrado(0);
end;

procedure TFMAlbaranes.AImprimirAlbaranesFiltradosExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AImprimirAlbaranesFiltradosExecute');
  MuestraFiltrado(1);
  // Refresco valor de check del estado listado
  DMAlbaranes.InfoActualiza;
end;

procedure TFMAlbaranes.AResumenAlbaranesExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AResumenAlbaranesExecute');
  AbreData(TDMLstAlbaranesCli, DMLstAlbaranesCli);
  try
     TFMLstEntreFechasCli.Create(Self).muestra('ALB', EFSerie.Text);
  finally
     CierraData(DMLstAlbaranesCli);
  end;
end;

procedure TFMAlbaranes.AResumenAlbaranesFiltradosExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AResumenAlbaranesFiltradosExecute');
  MuestraResumenFiltrado(0);
end;

procedure TFMAlbaranes.AImprimirResumenAlbaranesFiltradosExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AImprimirResumenAlbaranesFiltradosExecute');
  MuestraResumenFiltrado(1);
end;

procedure TFMAlbaranes.AEtiquetasExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AEtiquetasExecute');
  // Etiquetas de envio
  DMAlbaranes.Etiquetas(EFSerie.Text);
end;

procedure TFMAlbaranes.AConfListadosAlbaranesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfListadosAlbaranesExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  TFMListConfig.Create(Self).Muestra(34, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranes.frAlbaranes, DMLstAlbaranes.HYReport);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.AConfAlbFechasClientesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfAlbFechasClientesExecute');
  AbreData(TDMLstAlbaranesCli, DMLstAlbaranesCli);
  TFMListConfig.Create(Self).Muestra(44, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranesCli.frAlbaran);
  CierraData(DMLstAlbaranesCli);
end;

procedure TFMAlbaranes.AConfEtiquetasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfEtiquetasExecute');
  AbreData(TDMLstAlbaranesEti, DMLstAlbaranesEti);
  TFMListConfig.Create(Self).Muestra(58, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranesEti.frAlbaranes, DMLstAlbaranesEti.HYReport);
  CierraData(DMLstAlbaranesEti);
end;

procedure TFMAlbaranes.ACambiarNombreExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ACambiarNombreExecute');
  if EFCliente.CampoStr = 'TITULO' then
  begin
     EFCliente.CampoStr := 'NOMBRE_COMERCIAL';
     TButtCambiarNombre.Hint := _('Cambiar a Nombre');
     ACambiarNombre.Caption := _('Cambiar a Nombre');
     ACambiarNombre.Hint := _('Cambiar a Nombre');
     DBETituloCliente.DataField := 'NOMBRE_COMERCIAL';
  end
  else
  begin
     EFCliente.CampoStr := 'TITULO';
     TButtCambiarNombre.Hint := _('Cambiar a Nombre Comercial');
     ACambiarNombre.Caption := _('Cambiar a Nombre Comercial');
     ACambiarNombre.Hint := _('Cambiar a Nombre Comercial');
     DBETituloCliente.DataField := 'TITULO';
  end;
end;

procedure TFMAlbaranes.AFacturaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AFacturaExecute');

  if (DMAlbaranes.QMCabeceraFACTURABLE.AsInteger = 0) then
     ShowMessage(_('El albaran no esta marcado como "Facurable".'))
  else
  begin
     if (DMAlbaranes.xCliente.Active) then
        DMMain.MuestraAviso('CLI', DMAlbaranes.xCliente.FieldByName('ID_CLIENTE').AsInteger, 'FAC');

     try
        Screen.Cursor := crHourGlass;
        DMAlbaranes.TraspasarAlbaranActual('FAC');
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMAlbaranes.ADuplicarExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ADuplicarExecute');
  if (DMAlbaranes.xCliente.Active) then
     DMMain.MuestraAviso('CLI', DMAlbaranes.xCliente.FieldByName('ID_CLIENTE').AsInteger, 'ALB');

  try
     Screen.Cursor := crHourGlass;
     DMAlbaranes.Duplica(0); {dji lrk kri}
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAlbaranes.ACondicionesClientesExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  // DMMain.Log('TFMAlbaranes.ACondicionesClientesExecute');
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Cliente-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMAlbaranes.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMAlbaranes.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMAlbaranes.ActualizaCondicionesCli(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMAlbaranes.ARefrescaDetalleExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ARefrescaDetalleExecute');
  if Confirma then
     DMAlbaranes.RefrescaDetalle;
end;

procedure TFMAlbaranes.AAnulaDocumentoExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAnulaDocumentoExecute');
  DMAlbaranes.AnulaDocumento;
end;

procedure TFMAlbaranes.ABuscarNumSerieExecute(Sender: TObject);
var
  FMBusquedaNumSerie : TFMBusquedaNumSerie;
begin
  // DMMain.Log('TFMAlbaranes.ABuscarNumSerieExecute');
  if (TButtBuscarNumSerie.Down) then
     DMAlbaranes.BuscaNumSerie(NumSerie, False)
  else
  begin
     FMBusquedaNumSerie := TFMBusquedaNumSerie.Create(Self);
     try
        if (FMBusquedaNumSerie.ShowModal = mrOk) then
        begin
           NumSerie := FMBusquedaNumSerie.EFNumSerie.Text;
           if (NumSerie <> '') then
           begin
              DMAlbaranes.Filtrado := False;
              DMAlbaranes.BuscaNumSerie(NumSerie, True);
           end;
        end;
     finally
        FMBusquedaNumSerie.Free;
     end;
  end;

  try
     TButtBuscarNumSerie.Down := False;
  finally
  end;

  HabilitaBotones;
end;

procedure TFMAlbaranes.AHerenciaExecute(Sender: TObject);
var
  rig, ejercicio : integer;
  tipo, su_referencia, titulo, serie : string;
begin
  // DMMain.Log('TFMAlbaranes.AHerenciaExecute');
  DMAlbaranes.DatosHerencia(rig, Ejercicio, tipo, su_referencia, titulo, serie);
  MuestraHerencia(rig, Ejercicio, tipo, su_referencia, titulo, serie, Self);
end;

procedure TFMAlbaranes.AHistoricoSerializacionExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AHistoricoSerializacionExecute');
  HistoricoSerie(Self);
end;

procedure TFMAlbaranes.EFClienteExiste(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFClienteExiste');
  if (not DMMain.ClienteValido(StrToIntDef(EFCliente.Text, 0))) then
     EFCliente.Text := ''
  else
  begin
     DBEFContacto.CondicionBusqueda := 'TERCERO=' + DMAlbaranes.xCliente.FieldByName('TERCERO').AsString;
     DBEFContacto.OrdenadoPor.Text := 'CONTACTO';
     LTelefono.Caption := DMMain.DameTelefonoTercero(DMAlbaranes.QMCabeceraTERCERO.AsInteger);
  end;
end;

procedure TFMAlbaranes.FormShow(Sender: TObject);
var
  NewItem : TMenuItem;
begin
  inherited;

  // DMMain.Log('TFMAlbaranes.FormShow');
  LimitaSegunPais;
  HabilitaBotones;

  // Forzamos un primer refresco para que el navegador cambie si el usuario tiene documentos restringidos.
  NavMainClickAfterAdjust(Sender, nbRefresh);
  PNLDirRecogida.Width := TSDirManual.Width div 2;

  EstableceVisibilidadCamposDetalle;

  if (REntorno.Canal = 2) then
  begin
     NewItem := TMenuItem.Create(PMTraspaso.Items);
     try
        NewItem.Action := ATraspasaMovimientoStock;
        NewItem.OnDrawItem := FMain.OwnerDrawMenuItem;
        NewItem.OnMeasureItem := FMain.MeasureMenuItem;
        PMTraspaso.Items.Insert(PMTraspaso.Items.Count, NewItem);
     except
        NewItem.Free;
        raise;
     end;
     NewItem := TMenuItem.Create(PMTraspaso.Items);
     try
        NewItem.Action := ATraspasaFiltradosMovimientoStock;
        NewItem.OnDrawItem := FMain.OwnerDrawMenuItem;
        NewItem.OnMeasureItem := FMain.MeasureMenuItem;
        PMTraspaso.Items.Insert(PMTraspaso.Items.Count, NewItem);
     except
        NewItem.Free;
        raise;
     end;
  end;
end;

procedure TFMAlbaranes.DBEFDirCargadoraBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirCargadoraBusqueda');
  DBEFDirCargadora.CondicionBusqueda := ' TERCERO = ' + DBEFCargadora.Text;
end;

procedure TFMAlbaranes.DBEFDirExpedidoraBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirExpedidoraBusqueda');
  DBEFDirExpedidora.CondicionBusqueda := ' TERCERO = ' + DBEFExpedidora.Text;
end;

procedure TFMAlbaranes.DBEFDirIntermediariaBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirIntermediariaBusqueda');
  DBEFDirIntermediaria.CondicionBusqueda := ' TERCERO = ' + DBEFIntermediaria.Text;
end;

procedure TFMAlbaranes.DBEFDirTransportistaBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirTransportistaBusqueda');
  DBEFDirTransportista.CondicionBusqueda := ' TERCERO = ' +
     IntToStr(DMAlbaranes.xTransportistaCartaTERCERO.AsInteger);
end;

procedure TFMAlbaranes.DBEFDirDestinatarioBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirDestinatarioBusqueda');
  DBEFDirDestinatario.CondicionBusqueda := ' TERCERO = ' + DBEFDestinatario.Text;
  DBEFDestino.CondicionBusqueda := ' TERCERO = ' + DBEFDestinatario.Text;
end;

procedure TFMAlbaranes.DBGMatriculaBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGMatriculaBusqueda');
  if (DBEFTransportistaCartaPorte.Text <> '') then
  begin
     with DBGMatricula do
     begin
        CondicionBusqueda := 'EMPRESA =' + DMAlbaranes.QMCartaPortesEMPRESA.AsString;
        CondicionBusqueda := CondicionBusqueda + ' AND ((TRANSPORTISTA = 0) OR (TRANSPORTISTA = ' + DMAlbaranes.QMCartaPortesTRANSPORTISTA.AsString + ')) ';
        CondicionBusqueda := CondicionBusqueda + ' AND (MATRICULA NOT IN (SELECT MATRICULA FROM GES_CABECERAS_S_MAT WHERE ID_S = ' + DMAlbaranes.QMCabeceraID_S.AsString + '))';
     end;
  end;
end;

procedure TFMAlbaranes.ANroSerieKriExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ANroSerieKriExecute');
  DMAlbaranes.EditarNroDeSerieKri;
end;

procedure TFMAlbaranes.DBECompradorEDIChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBECompradorEDIChange');
  if (PCMain.ActivePage = TSEDI) then
     ECompradorEDI.Text := DameDireccionEDI(DBECompradorEDI.Text);
end;

procedure TFMAlbaranes.DBEDestinoEDIChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEDestinoEDIChange');
  if (PCMain.ActivePage = TSEDI) then
     EDestinoEDI.Text := DameDireccionEDI(DBEDestinoEDI.Text);
end;

procedure TFMAlbaranes.DBEOrigenEDIChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEOrigenEDIChange');
  if (PCMain.ActivePage = TSEDI) then
     EOrigenEDI.Text := DameDireccionEDI(DBEOrigenEDI.Text);
end;

procedure TFMAlbaranes.DBEReceptorEDIChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEReceptorEDIChange');
  if (PCMain.ActivePage = TSEDI) then
     EReceptorEDI.Text := DameDireccionEDI(DBEReceptorEDI.Text);
end;

procedure TFMAlbaranes.DEBRecogidaEDIChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DEBRecogidaEDIChange');
  if (PCMain.ActivePage = TSEDI) then
     ERecogidaEDI.Text := DameDireccionEDI(DEBRecogidaEDI.Text);
end;

procedure TFMAlbaranes.DBEExpedidorEDIChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEExpedidorEDIChange');
  if (PCMain.ActivePage = TSEDI) then
     EExpedidorEDI.Text := DameDireccionEDI(DBEExpedidorEDI.Text);
end;

procedure TFMAlbaranes.TSEDIShow(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.TSEDIShow');
  DMAlbaranes.QMCabeceraEDI.Close;
  DMAlbaranes.QMCabeceraEDI.Open;
  ECompradorEDI.Text := DameDireccionEDI(DBECompradorEDI.Text);
  EDestinoEDI.Text := DameDireccionEDI(DBEDestinoEDI.Text);
  EOrigenEDI.Text := DameDireccionEDI(DBEOrigenEDI.Text);
  EReceptorEDI.Text := DameDireccionEDI(DBEReceptorEDI.Text);
  ERecogidaEDI.Text := DameDireccionEDI(DEBRecogidaEDI.Text);
  EExpedidorEDI.Text := DameDireccionEDI(DBEExpedidorEDI.Text);
end;

procedure TFMAlbaranes.PCMainChange(Sender: TObject);
begin
  PMainMaximizado := (PCMain.ActivePage = TSCartaPorte) or (PCMain.ActivePage = TSNotas);

  inherited;

  if (PCMain.ActivePage = TSNotas) then
     DBRENotasInternasKri.Height := (DBRENotas.Height + DBRENotasInternasKri.Height) div 2
  else
     DBRENotasInternasKri.Height := (DBRENotas.Height + DBRENotasInternasKri.Height) div 2;

  if (PCMain.ActivePage = TSCartaPorte) then
  begin
     with DMAlbaranes.xOrigen do
     begin
        Close;
        Params.ByName['ALMACEN'].AsString := DMAlbaranes.QMCabeceraALMACEN.AsString;
        Open;
     end;
  end;
end;

procedure TFMAlbaranes.DBGMatriculaColEnter(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGMatriculaColEnter');
  ControlEdit := CEMatricula;
end;

procedure TFMAlbaranes.DBGNaturalezaColEnter(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGNaturalezaColEnter');
  ControlEdit := CENaturaleza;
end;

procedure TFMAlbaranes.DBMNotasCartaExit(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBMNotasCartaExit');
  // DMAlbaranes.QMCartaPortes.Post;
  ControlEdit := CEMatricula;
end;

procedure TFMAlbaranes.TSCartaPorteShow(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.TSCartaPorteShow');
  DMAlbaranes.AbrirCartaPortes;
  ControlEdit := CECartaPortes;
  NavCartaPortes.SetFocus;
end;

procedure TFMAlbaranes.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  AgrupaColorKri : boolean;
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleDrawColumnCell');
  if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if DMAlbaranes.HayDetalle then
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'UNIDADES') then
           begin
              if (DMAlbaranes.QMDetalleTIPO_UNIDAD_LOGISTICA.AsString <> 'GRNL') and
                 (DMAlbaranes.QMDetalleRELACIONAR_U_LOGISTICA.AsInteger = 1) and
                 (DMAlbaranes.QMDetalleUNIDADES_LOGISTICAS.AsFloat * DMAlbaranes.QMDetalleU_POR_U_LOGISTICA.AsFloat <> DMAlbaranes.QMDetalleUNIDADES.AsFloat) then
                 ColorResaltado3(Canvas)
              else
                 ColorEdicion(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'MARGEN') then
           begin
              if (MargenMinimo >= 0) then
                 if (MargenMinimo > DMAlbaranes.QMDetalleMARGEN.AsFloat) then
                    ColorError(Canvas)
                 else
                    ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'TIPO_IVA') or (UpperCase(Column.FieldName) = 'P_IVA') then
           begin
              if (DMAlbaranes.QMDetalleTIPO_IVA.AsInteger <> DMAlbaranes.QMDetalleTIPO_IVA_ART.AsInteger) then
                 ColorResaltado3(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCK_ALM.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM2') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCK_ALM2.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM3') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCK_ALM3.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKV_ALM') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKV_ALM.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKV_ALM2') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKV_ALM2.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKV_ALM3') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKV_ALM3.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKR_ALM') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKR_ALM.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKR_ALM2') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKR_ALM2.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKR_ALM3') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKR_ALM3.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKM_ALM') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKM_ALM.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKM_ALM2') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKM_ALM2.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCKM_ALM3') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCKM_ALM3.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCK.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_VIRTUAL') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
                 ColorResaltado5(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_REAL') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
                 ColorResaltado5(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_MONTURAS') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCK_MONTURAS.AsFloat >= 0) then
                 ColorInfo(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_REF_BASE') then
           begin
              if (DMAlbaranes.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranes.QMDetalleSTOCK_REF_BASE.AsFloat >= 0) then
                 ColorInfo(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'LOTE_SIMPLE') then
           begin
              if (DMAlbaranes.QMDetalleREQUIERE_LOTE_SIMPLE.AsInteger = 1) and (Trim(DMAlbaranes.QMDetalleLOTE_SIMPLE.AsString) = '') then
                 ColorError(Canvas)
              else
                 ColorEdicion(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ARTICULO') then
           begin
              if (KriConf211) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT EMPRESA FROM EMP_AGRUPACIONES_ART WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ARTICULO=''' + DMAlbaranes.QMDetalleARTICULO.AsString + ''' AND AGRUPACION=''COL''';
                       ExecQuery;
                       AgrupaColorKri := FieldByName['EMPRESA'].AsInteger <> 0;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (AgrupaColorKri) then
                    ColorResaltado5(Canvas)
                 else
                    ColorEdicion(Canvas);
              end; {KriConf211}
           end
           else
           if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE')) then
           begin
              if (DMAlbaranes.QMDetalleLOTEABLE.AsInteger = 1) then
              begin
                 if (Abs(RoundTo(DMAlbaranes.QMDetalleUNIDADES.AsFloat - DMAlbaranes.QMDetalleCANT_LOTE.AsFloat, -2)) > 0.00) then
                    ColorError(Canvas)
                 else
                    ColorEdicion(Canvas);
              end
              else
                 ColorInactivo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ID_UBICACION') then
           begin
              if (ArticuloUbicable(DMAlbaranes.QMDetalleARTICULO.AsString)) then
                 ColorEdicion(Canvas)
              else
                 ColorInactivo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA1') then
           begin
              if (DMAlbaranes.QMDetalleUE_UNIDADES.AsInteger < 1) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA2') then
           begin
              if (DMAlbaranes.QMDetalleUE_UNIDADES.AsInteger < 2) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA3') then
           begin
              if (DMAlbaranes.QMDetalleUE_UNIDADES.AsInteger < 3) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA4') then
           begin
              if (DMAlbaranes.QMDetalleUE_UNIDADES.AsInteger < 4) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end;
        end;
     end; {HayDetalle}

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAlbaranes.DBGFDetalleCellClick(Column: TColumn);
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleCellClick');
  ColActual := Column;
end;

procedure TFMAlbaranes.AInformeCartaPortes1Execute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInformeCartaPortes1Execute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
     DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
     0, 5, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.AInformeCartaPortes2Execute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AInformeCartaPortes2Execute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
     DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
     0, 6, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.DBGNaturalezaBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGNaturalezaBusqueda');
  if Pos('SYS_NATURALEZA_CARGA', Trim(DBGNaturaleza.TablaABuscar)) > 0 then
     DBGNaturaleza.CondicionBusqueda :=
        'NATURALEZA NOT IN (SELECT NATURALEZA FROM GES_CABECERAS_S_NAT NAT WHERE NAT.ID_S = ' +
        DMAlbaranes.QMCabeceraID_S.AsString + ')';
end;

procedure TFMAlbaranes.AConfListadoAlbPorte1Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfListadoAlbPorteExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  TFMListConfig.Create(Self).Muestra(162, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranes.frAlbaranes, DMLstAlbaranes.HYReport);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.AConfListadoAlbPorte2Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfListadoAlbPorteExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  TFMListConfig.Create(Self).Muestra(652, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranes.frAlbaranes, DMLstAlbaranes.HYReport);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.NavCartaPortesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavCartaPortesClickAfterAdjust');
  if Button in [nbEdit] then
  begin
     if not DMAlbaranes.HayCartaPortes then
        DMAlbaranes.GrabaCabCartaPortes;
  end;
end;

procedure TFMAlbaranes.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavNotasBeforeAction');
  if ((Button = nbCancel) and (NavNotas.CanFocus)) then
     NavNotas.SetFocus;

  {dji lrk kri - para que se pueda poner simbolo Euros en las notas}
  if Button = nbEdit then
     AUnidadesExt.ShortCut := 0;
  if Button = nbPost then
     AUnidadesExt.ShortCut := TextToShortCut('Ctrl+Alt+E');
end;

procedure TFMAlbaranes.NavCartaPortesBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavCartaPortesBeforeAction');
  if (Button = nbCancel) and NavCartaPortes.CanFocus then
     NavCartaPortes.SetFocus;
end;

procedure TFMAlbaranes.AMantenimientoDepositoExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AMantenimientoDepositoExecute');
  with TFMAlbDeposito.Create(Self) do
  begin
     try
        MuestraDeposito;
     finally
        Free;
     end;
  end;

  DMAlbaranes.QMCabecera.Refresh;
  HabilitaBotones;
end;

procedure TFMAlbaranes.ADevolucionExecute(Sender: TObject);
var
  SerieDestino : string;
begin
  // DMMain.Log('TFMAlbaranes.ADevolucionExecute');
  if (DMAlbaranes.xCliente.Active) then
     DMMain.MuestraAviso('CLI', DMAlbaranes.xCliente.FieldByName('ID_CLIENTE').AsInteger, 'ALB');

  SerieDestino := DMAlbaranes.QMCabeceraSERIE.AsString;
  if PideDato('SER', SerieDestino) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMAlbaranes.Devuelve(SerieDestino);
     finally
        Screen.Cursor := crDefault;
     end;

     if (SerieDestino <> DMAlbaranes.QMCabeceraSERIE.AsString) then
     begin
        EFSerie.Text := SerieDestino;
        DMAlbaranes.QMCabecera.Last;
     end;
  end;
end;

procedure TFMAlbaranes.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  // DMMain.Log('TFMAlbaranes.NavMainBeforeAction');
  if (Button = nbDelete) then
     DMAlbaranes.ControlaRestriccion;

  if (Button in [nbRefresh, nbDelete]) then
     DMAlbaranes.ReiniciaStock;

  Editando := (Button in [nbEdit]);
end;

procedure TFMAlbaranes.ACambiaTituloExecute(Sender: TObject);
var
  index : smallint;
begin
  // DMMain.Log('TFMAlbaranes.ACambiaTituloExecute');
  if (TButtCambiaDescripcion.Tag = 0) then
  begin
     index := EncuentraField(DBGFDetalle, 'TITULO');
     try
        if (index >= 0) then
        begin
           DBGFDetalle.Columns.Items[index].FieldName := 'TITULO_IDIOMA';
           DBGFDetalle.Columns.Items[index].Color := $00D6D6D6;
           DBGFDetalle.Columns.Items[index].Title.Caption := _('Desc. Artículo');
           // Ponemos el boton para mostrar titulos predeterminado
           ACambiaTitulo.Hint := _('Mostrar títulos predeterminado');
           TButtCambiaDescripcion.Tag := 1;
        end;
     except
        ShowMessage(_('El campo Desc. Artículo/Título ha de ser visible'));
     end;
  end
  else
  begin
     index := EncuentraField(DBGFDetalle, 'TITULO_IDIOMA');
     try
        if (index >= 0) then
        begin
           DBGFDetalle.Columns.Items[index].FieldName := 'TITULO';
           DBGFDetalle.Columns.Items[index].Color := clWindow;
           DBGFDetalle.Columns.Items[index].Title.Caption := _('Desc. Artículo');
           ACambiaTitulo.Hint := _('Mostrar títulos en el idioma');
           TButtCambiaDescripcion.Tag := 0;
        end;
     except
        ShowMessage(_('El campo Desc. Artículo ha de ser visible'));
     end;
  end;
  DMAlbaranes.QMDetalle.Refresh;
end;

procedure TFMAlbaranes.AMuestraUbiacionExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AMuestraUbiacionExecute');
  DMAlbaranes.MuestraUbicacion;
end;

procedure TFMAlbaranes.AEnviarAlbaranMailPDFExecute(Sender: TObject);
var
  {Memo: TStrings; No se utiliza}
  Asunto : string;
  DMLstAlbaranesCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // DMMain.Log('TFMAlbaranes.AEnviarAlbaranMailPDFExecute');
  // esto es porque el assigned no va

  DMLstAlbaranesCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el albarán por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstAlbaranes, DMLstAlbaranes);
           DMLstAlbaranesCargado := True;

           DMLstAlbaranes.MostrarListadoMail(DMAlbaranes.QMCabeceraID_S.AsInteger, EFSerie.Text, 2,
              DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));

           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;

           FSendCorreo.Texto(_('Enviando Mensaje  ...'));

           InicializaVariableEmail(DMAlbaranes.QMCabeceraTIPO.AsString);
           with VariableEmail do
           begin
              Ejercicio := DMAlbaranes.QMCabeceraEJERCICIO.AsInteger;
              Serie := DMAlbaranes.QMCabeceraSERIE.AsString;
              NumeroDocumento := DMAlbaranes.QMCabeceraRIG.AsInteger;
              Fecha := DMAlbaranes.QMCabeceraFECHA.AsDateTime;
              SuReferencia := DMAlbaranes.QMCabeceraSU_REFERENCIA.AsString;
              SuPedido := DMAlbaranes.QMCabeceraPEDIDO_CLIENTE.AsString;
              Folio := IntToStr(DMAlbaranes.QMCabeceraFOLIO.AsInteger);
              TituloDocTributario := DameTituloTipoDocTributario(DMAlbaranes.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString);
              NombreFichero := DMLstAlbaranes.nombreFich;
              Matricula := DMMain.DameMatriculaFichaTecnica(DMAlbaranes.QMCabeceraID_FICHA_TECNICA.AsInteger);
              if (DMAlbaranes.QMCabeceraCLIENTE.AsInteger > 0) then
              begin
                 NombreComercial := DMAlbaranes.QMCabeceraNOMBRE_COMERCIAL.AsString;
                 RazonSocial := DMAlbaranes.QMCabeceraTITULO.AsString;
              end
              else
              begin
                 // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                 NombreComercial := DMAlbaranes.QMCabeceraTITULO.AsString;
                 RazonSocial := DMAlbaranes.QMCabeceraTITULO.AsString;
              end;
              OrdenTrabajo := 0;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMAlbaranes.QMCabeceraENTRADA.AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);
           try
              DMListados.SendMailClientePDF(DMAlbaranes.QMCabeceraCLIENTE.AsInteger, CuerpoMail,
                 DMLstAlbaranes.rutaFich, DMLstAlbaranes.nombreFich, Asunto, DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraID_S.AsInteger, True, DMMain.DameCorreoCopiaAgente(DMAlbaranes.QMCabeceraAGENTE.AsInteger, 'ALB'));
           finally
              CuerpoMail.Free;
           end;

           // Marco el documento como listado
           DMLstAlbaranes.UpdateaDocumentos;

           CierraData(DMLstAlbaranes);
           DMLstAlbaranesCargado := False;
           CierraData(DMListados);
           DMListadosCargado := False;
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
           if DMLstAlbaranesCargado then
              CierraData(DMLstAlbaranes);
           if DMListadosCargado then
              CierraData(DMListados);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.sepuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
  Application.ProcessMessages;
end;

procedure TFMAlbaranes.ALstUbicacionesExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ALstUbicacionesExecute');
  AbreData(TDMLstUbicacionesV, DMLstUbicacionesV);
  DMLstUbicacionesV.MostrarListadoUbicaciones(DMAlbaranes.QMCabeceraID_S.AsInteger, 0);
  CierraData(DMLstUbicacionesV);
end;

procedure TFMAlbaranes.AConfLstUbicacionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfLstUbicacionesExecute');
  AbreData(TDMLstUbicacionesV, DMLstUbicacionesV);
  TFMListConfig.Create(Self).Muestra(193, Formato, Cabecera, Copias, Pijama, EFSerie.Text,
     DMLstUbicacionesV.frUbicaciones);
  CierraData(DMLstUbicacionesV);
end;

procedure TraspasoAAlbaran(Serie: string; id_s: integer);
begin
  DMMain.Log('TraspasoAAlbaran (TFMAlbaranes)');
  FMain.EjecutaAccion(FMain.AAlbaranes);
  FMAlbaranes.EFSerie.Text := Serie;
  FMain.TraspasodeDocumentosSalida(id_s);
end;

procedure TFMAlbaranes.AExportaAlbaranEDIExecute(Sender: TObject);
var
  empresa : integer;
  ejercicio : integer;
  canal : integer;
  serie : string;
  tipo : string;
  rig : integer;
begin
  // DMMain.Log('TFMAlbaranes.AExportaAlbaranEDIExecute');
  AbreData(TDMExportaAlbaranEDI, DMExportaAlbaranEDI);
  with DMAlbaranes do
  begin
     empresa := QMCabeceraEMPRESA.AsInteger;
     ejercicio := QMCabeceraEJERCICIO.AsInteger;
     canal := QMCabeceraCANAL.AsInteger;
     serie := QMCabeceraSERIE.AsString;
     tipo := QMCabeceraTIPO.AsString;
     rig := QMCabeceraRIG.AsInteger;
  end;
  DMExportaAlbaranEDI.Exporta(empresa, ejercicio, canal, serie, tipo, rig);
  CierraData(DMExportaAlbaranEDI);
end;

procedure TFMAlbaranes.ANIFAlbaranExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFACTURA;
begin
  // DMMain.Log('TFMAlbaranes.ANIFAlbaranExecute');
  DMAlbaranes.AbreQMNif;
  if DMAlbaranes.DameDatosClientes then
  begin
     FPregDatos := TFPregNIFFACTURA.Create(Self);
     FPregDatos.Inicializa(DMAlbaranes.DSQMNIF, _('Datos del Cliente'),
        DMAlbaranes.EstadoDocumento);
     DMAlbaranes.GrabaDatosCliente(FPregDatos.ShowModal);
     FreeAndNil(FPregDatos);
  end;
  DMAlbaranes.CierraQMNif;
  DMAlbaranes.RefrescaCabecera(1);
end;

procedure TFMAlbaranes.AAgrupaAlbaranesFiltradosKriExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAgrupaAlbaranesFiltradosKriExecute');
  DMAlbaranes.AgrupaAlbaranesFiltradosKri;
end;

procedure TFMAlbaranes.ABuscaReferenciaExecute(Sender: TObject);
var
  id_s : integer;
  Q : THYFIBQuery;
begin
  // DMMain.Log('TFMAlbaranes.ABuscaReferenciaExecute');
  with EFReferencia do
  begin
     Text := '';
     Tabla_a_Buscar := 'ART_GARANTIAS_REPARACION';
     CampoADevolver := 'ID_S_CAB';
     CampoNum := 'REFERENCIA';
     CampoStr := 'DETALLE';
     Campos_Desplegar.Text := '';
     Filtros := [obEmpresa];
     OrdenadoPor.Text := 'REFERENCIA';
     Visible := True;
     SetFocus;
     Visible := False;
  end;
  NavMain.SetFocus;
  {
  busco id_s de oferta
  busco albaran de oferta
  busco id_s de albaran
  }
  id_s := 0;
  if (StrToIntDef(EFReferencia.Text, 0) > 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ALB.ID_S FROM GES_CABECERAS_S OFC ' +
           'JOIN GES_CABECERAS_RELACIONES REL1 ON ' +
           'REL1.O_EMPRESA=OFC.EMPRESA AND ' +
           'REL1.O_EJERCICIO=OFC.EJERCICIO AND ' +
           'REL1.O_CANAL=OFC.CANAL AND ' +
           'REL1.O_SERIE=OFC.SERIE AND ' +
           'REL1.O_TIPO=OFC.TIPO AND ' +
           'REL1.O_RIG=OFC.RIG ' +
           'JOIN GES_CABECERAS_RELACIONES REL2 ON ' +
           'REL1.D_EMPRESA=REL2.O_EMPRESA AND ' +
           'REL1.D_EJERCICIO=REL2.O_EJERCICIO AND ' +
           'REL1.D_CANAL=REL2.O_CANAL AND ' +
           'REL1.D_SERIE=REL2.O_SERIE AND ' +
           'REL1.D_TIPO=REL2.O_TIPO AND ' +
           'REL1.D_RIG=REL2.O_RIG ' +
           'JOIN GES_CABECERAS_S ALB ON ' +
           'REL2.D_EMPRESA=ALB.EMPRESA AND ' +
           'REL2.D_EJERCICIO=ALB.EJERCICIO AND ' +
           'REL2.D_CANAL=ALB.CANAL AND ' +
           'REL2.D_SERIE=ALB.SERIE AND ' +
           'REL2.D_TIPO=ALB.TIPO AND ' +
           'REL2.D_RIG=ALB.RIG ' +
           'WHERE ' +
           'OFC.ID_S = ' + EFReferencia.Text;
        ExecQuery;
        id_s := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);

     if (id_s = 0) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ALB.ID_S FROM GES_CABECERAS_S OFC ' +
              'JOIN GES_CABECERAS_RELACIONES REL1 ON ' +
              'REL1.O_EMPRESA=OFC.EMPRESA AND ' +
              'REL1.O_EJERCICIO=OFC.EJERCICIO AND ' +
              'REL1.O_CANAL=OFC.CANAL AND ' +
              'REL1.O_SERIE=OFC.SERIE AND ' +
              'REL1.O_TIPO=OFC.TIPO AND ' +
              'REL1.O_RIG=OFC.RIG ' +
              'JOIN GES_CABECERAS_S ALB ON ' +
              'REL1.D_EMPRESA=ALB.EMPRESA AND ' +
              'REL1.D_EJERCICIO=ALB.EJERCICIO AND ' +
              'REL1.D_CANAL=ALB.CANAL AND ' +
              'REL1.D_SERIE=ALB.SERIE AND ' +
              'REL1.D_TIPO=ALB.TIPO AND ' +
              'REL1.D_RIG=ALB.RIG ' +
              'WHERE ' +
              'OFC.ID_S = ' + EFReferencia.Text;
           ExecQuery;
           id_s := FieldByName['ID_S'].AsInteger;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;

  if (id_s <> 0) then
     DMAlbaranes.PosicionarID(id_s);
end;

procedure TFMAlbaranes.TButtImprimeListadoClick(Sender: TObject);
var
  estado : integer;
begin
  // DMMain.Log('TFMAlbaranes.TButtImprimeListadoClick');
  {dji lrk kri - Picar directamente sobre el boton, segun el parametro 107,
               previsualiza o imprime una cantidad de copias.}
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  estado := DMMain.EstadoKri(107);
  if (estado = 0) then {si 0, previsualiza, sino imprime esa cantidad de copias}
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        0, 1, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger)
  else
     {for i := 1 to estado do}
     DMLstAlbaranes.MostrarListado(DMAlbaranes.QMCabeceraID_S.AsInteger,
        DMAlbaranes.QMCabeceraRIG.AsInteger, EFSERIE.Text,
        1, 1, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.DBEFPortesChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFPortesChange');
  ETituloPortes.Text := DameTituloPorte(StrToIntDef(DBEFPortes.Text, -1));

  // Hacemos visibles los campos oportunos
  LBRango.Visible := not (StrToIntDef(DBEFPortes.Text, 0) < 5);
  DBEFRango.Visible := not (StrToIntDef(DBEFPortes.Text, 0) < 5);
  DBERango.Visible := not (StrToIntDef(DBEFPortes.Text, 0) < 5);
  LBIndice.Visible := not (StrToIntDef(DBEFPortes.Text, 0) < 5);
  DBEFIndice.Visible := not (StrToIntDef(DBEFPortes.Text, 0) < 5);
  DBEIndice.Visible := not (StrToIntDef(DBEFPortes.Text, 0) < 5);

  if (Trim(DBEFPortes.Text) <> '') then
  begin
     DBEIPortes.DataSource := DMAlbaranes.DSQMCabecera;
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
           DBEIPortes.DataSource := DMAlbaranes.DSxInfoActualizada;
        end
        else
        if (StrToInt(DBEFPortes.Text) = 3) then
        begin
           DBEPorPortes.Color := clWindow;
           DBEPorPortes.Enabled := True;
           DBEPorPortes.ReadOnly := False;
           DBEPorPortes.TabStop := True;
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
              DBEIPortes.DataSource := DMAlbaranes.DSQMCabecera;
           end;
        end;

        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
        DBEPorPortes.TabStop := DBEPorPortes.Enabled;
        DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
        DBEIPortes.TabStop := DBEIPortes.Enabled;
     end;
  end;
end;

procedure TFMAlbaranes.DBEFRangoChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFRangoChange');
  if ((Assigned(DBEFRango.Field)) and (DBEFRango.Text <> '')) then
     DBEFIndice.Enabled := (DMAlbaranes.ExisteRango(StrToInt(DBEFRango.Text)));
end;

procedure TFMAlbaranes.DBEFRangoBusqueda(Sender: TObject);
var
  Str : string;
begin
  // DMMain.Log('TFMAlbaranes.DBEFRangoBusqueda');
  inherited;
  if (StrToInt(DBEFPortes.Text) in [5, 6, 7]) then
  begin
     if (StrToInt(DBEFPortes.Text) = 5) then //rateo por pesos
        Str := ' TIPO=1';
     if (StrToInt(DBEFPortes.Text) = 6) then //rateo por importes
        Str := ' TIPO=2';
     if (StrToInt(DBEFPortes.Text) = 7) then //rateo por bultos
        Str := ' TIPO=3';
     DBEFRango.CondicionBusqueda := Str;
  end;
end;

procedure TFMAlbaranes.DBEFIndiceBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFIndiceBusqueda');
  DBEFIndice.CondicionBusqueda := ' RANGO=' + DBEFRango.Text;
end;

procedure TFMAlbaranes.AOrdenaLineasExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AOrdenaLineasExecute');
  DMAlbaranes.OrdenarLineas;
end;

procedure TFMAlbaranes.AAlbaranMultiExecute(Sender: TObject);
var
  Accion : integer;
begin
  // DMMain.Log('TFMAlbaranes.AAlbaranMultiExecute');
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(Self);
  Accion := FMTraspasoMultiCanal.Carga(DMAlbaranes.QMCabeceraID_S.AsInteger, DMAlbaranes.QMCabeceraRIG.AsInteger,
     DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, DMAlbaranes.QMCabeceraCANAL.AsInteger, DMAlbaranes.QMCabeceraTRANSPORTISTA.AsInteger,
     DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);
  DMAlbaranes.RefrescaCabecera(Accion);
end;

procedure TFMAlbaranes.DBCHKCambioChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBCHKCambioChange');
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMAlbaranes.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMAlbaranes.AGenerarPackingListExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AGenerarPackingListExecute');
  DMAlbaranes.GenerarPackingList;

  FMPackingList := TFMPackingList.Create(Self);
  with FMPackingList do
     try
        AbrirDatos(DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraID_S.AsInteger);
        ShowModal;
     finally
        Free;
     end;
end;

procedure TFMAlbaranes.FiltraDocumento(FiltroAccion: string);
begin
  // DMMain.Log('TFMAlbaranes.FiltraDocumento');
  FMAlbaranes.TSTabla.Show;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, FiltroAccion);
  if (PCMain.ActivePage = TSCartaPorte) then
     DMAlbaranes.AbrirCartaPortes;
  RefrescaAvisos;
end;

procedure TFMAlbaranes.ABuscaNIFKRIExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ABuscaNIFKRIExecute');
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'TIPO=''ALB'' AND SERIE=''' + EFSerie.Text + '''';
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

procedure TFMAlbaranes.EFBuscaNIFKRIChange(Sender: TObject);
var
  IdDoc : integer;
begin
  // DMMain.Log('TFMAlbaranes.EFBuscaNIFKRIChange');
  IdDoc := StrToIntDef(EFBuscaNIFKRI.Text, 0);

  if (IdDoc <> 0) then
     DMAlbaranes.PosicionarID(IdDoc);
end;

procedure TFMAlbaranes.RefrescaDescuentoKri;
begin
  // DMMain.Log('TFMAlbaranes.RefrescaDescuentoKri');
  if ((DMAlbaranes.QMCabeceraID_S.AsString > '') and (DMAlbaranes.QMCabecera.State = dsBrowse)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DTO_CIAL FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(DMAlbaranes.QMCabeceraID_S.AsInteger);
           ExecQuery;
           DBEDtoCial.Text := FormatFloat('#,##0.00%', FieldByName['DTO_CIAL'].AsFloat);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMAlbaranes.DBGFDetalleRowChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleRowChange');
  DBGDetalleArticulo := '';
  {dji lrk kri - Nava - Descuento segun total de albaran, refresca solo dto.}
  RefrescaDescuentoKri;
end;

procedure TFMAlbaranes.ADescargaLectorExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  // DMMain.Log('TFMAlbaranes.ADescargaLectorExecute');
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'Albaran' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Albaran de Cliente ' + EFSerie.Text + '/' + DBERig.Text);
     WriteLn(ArchivoLog, 'Estado ' + DBETituloEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMAlbaranes.QMDetalle.RecordCount));
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           //fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1));
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);
           WriteLn(ArchivoLog, 'Articulo: ' + ArticuloLeido + '.');
           WriteLn(ArchivoLog, 'Cantidad: ' + Copy(s, j + i + k + 1, Length(s)) + '.');

           {Primero veo si el articulo leido es un codigo de barras}
           Articulo := DameArticuloBarras(ArticuloLeido);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           {Si encuentro el articulo}
           if (Articulo > ' ') then
           begin
              WriteLn(ArchivoLog, 'Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
              try
                 DMAlbaranes.QMDetalle.Insert;
                 DBGFDetalle.FindColumn('ARTICULO').Field.AsString := Articulo;
                 DBGFDetalle.FindColumn('UNIDADES').Field.AsInteger := Cantidad;
                 DMAlbaranes.QMDetalle.Post;
              except
                 on e: Exception do
                 begin
                    DMAlbaranes.QMDetalle.Cancel;
                    ShowMessage(Format(_('Error insertando articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                    WriteLn(ArchivoLog, Format(_('Error insertando articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                 end;
              end;
           end
           else
           begin
              WriteLn(ArchivoLog, Format(_('No Existe el articulo %s x %s  unidades. Articulo Leido: '), [Articulo, IntToStr(Cantidad), ArticuloLeido]));
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %s' + #13#10 + 'Deberá agregarlo luego.'), [ArticuloLeido, IntToStr(Cantidad)]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'Albaran' + '_' + FechaLog + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMAlbaranes.DBDTPFechaExit(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBDTPFechaExit');
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMAlbaranes.MuestraStock(StockNegativo: smallint);
var
  Articulo, Almacen : string;
begin
  // DMMain.Log('TFMAlbaranes.MuestraStock');
  DMAlbaranes.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self, StockNegativo);
end;

procedure TFMAlbaranes.DBGMainCellClick(Column: TColumn);
begin
  // DMMain.Log('TFMAlbaranes.DBGMainCellClick');
  RefrescaAvisos;
end;

procedure TFMAlbaranes.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // DMMain.Log('TFMAlbaranes.DBGMainKeyDown');
  RefrescaAvisos;
end;

procedure TFMAlbaranes.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // DMMain.Log('TFMAlbaranes.DBGMainKeyUp');
  RefrescaAvisos;
end;

{Se define en UUtiles
function TFMAlbaranes.EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint;
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
procedure TFMAlbaranes.EFProyectoBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFProyectoBusqueda');
  EFProyecto.CondicionBusqueda :=
     '(CLIENTE_NULL=' + EFCliente.Text + ' or CLIENTE_NULL=-1 or CLIENTE_NULL is null) and ' +
     '(AGENTE_NULL = ' + EFAgente.Text + ' or AGENTE_NULL is null) and ' +
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMAlbaranes.ABuscarArticuloExecute(Sender: TObject);
var
  Articulo : string;
begin
  // DMMain.Log('TFMAlbaranes.ABuscarArticuloExecute');
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

  DMAlbaranes.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMAlbaranes.ABuscarLoteSimpleExecute(Sender: TObject);
var
  LoteSimple : string;
begin
  // DMMain.Log('TFMAlbaranes.ABuscarLoteSimpleExecute');
  inherited;
  LoteSimple := '';
  if (not BuscarLoteSimple) then
     PideDato('LOS', LoteSimple, 'Lote Simple', 'TIPO=''' + DMAlbaranes.QMCabeceraTIPO.AsString + '''');

  DMAlbaranes.BuscaLoteSimple(LoteSimple);

  BuscarLoteSimple := (LoteSimple <> '');
  TButtBuscarLoteSimple.Down := BuscarLoteSimple;

  HabilitaBotones;
end;

procedure TFMAlbaranes.FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
begin
  // DMMain.Log('TFMAlbaranes.FiltraClienteKri');
  EFSerie.Text := Serie;
  DMAlbaranes.FiltraClienteKri(Ejercicio, Serie, Cliente, Estado);
  HabilitaBotones;
  if (PCMain.ActivePage = TSCartaPorte) then
     DMAlbaranes.AbrirCartaPortes;
  RefrescaAvisos;
end;

procedure TFMAlbaranes.AAsignaGarantiasLectorExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri : string;
  s : string;
  articulo : string;
  garantia : integer;
  i, j, k : integer;
  BM : TBookmark;
begin
  // DMMain.Log('TFMAlbaranes.AAsignaGarantiasLectorExecute');
  DirOri := REntorno.DirectorioLector;

  DMAlbaranes.QMDetalle.DisableControls;
  BM := DMAlbaranes.QMDetalle.GetBookmark;
  try
     {Verificamos que esten todos los articulos leidos en el albaran}
     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           //fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1));

           articulo := Copy(s, j + i + 1, k - 1);
           //garantia := StrToIntDef(Copy(s, j + i + k + 1, length(s)), 0);

           DMAlbaranes.QMDetalle.First;
           while ((not DMAlbaranes.QMDetalle.EOF) and (DMAlbaranes.QMDetalleARTICULO.AsString <> articulo)) do
              DMAlbaranes.QMDetalle.Next;

           //if (DMAlbaranes.QMDetalle.EOF) then
           //   MessageDlg('El articulo '+articulo+'No existe',mtError,[mbOK],0 );
        end;
     finally
        CloseFile(Archivo);
     end;

     {Asignamos el Albaran a la Garantia}
     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           //fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1));

           articulo := Copy(s, j + i + 1, k - 1);
           garantia := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           DMAlbaranes.QMDetalle.First;
           while ((not DMAlbaranes.QMDetalle.EOF) and (DMAlbaranes.QMDetalleARTICULO.AsString <> articulo)) do
              DMAlbaranes.QMDetalle.Next;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE ART_ARTICULOS_GARANTIAS SET ID_DETALLES_S_ALB=?ID_DETALLES_S WHERE ID=?ID';
                 Params.ByName['ID_DETALLES_S'].AsInteger := DMAlbaranes.QMDetalleID_DETALLES_S.AsInteger;
                 Params.ByName['ID'].AsInteger := garantia;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     finally
        CloseFile(Archivo);
     end;

     try
        Rewrite(Archivo);
     finally
        CloseFile(Archivo);
     end;

     DMAlbaranes.QMDetalle.GotoBookmark(BM);
  finally
     DMAlbaranes.QMDetalle.EnableControls;
     DMAlbaranes.QMDetalle.FreeBookmark(BM);
  end;
end;

procedure TFMAlbaranes.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // DMMain.Log('TFMAlbaranes.DBGFDetalleKeyUp');
  if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
  begin
     if (Key = VK_F3) then
     begin
        DMAlbaranes.InfoLotes;
        Key := 0;
     end;
  end
  else
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(DBGDetalleArticulo, True, False) then
        begin
           DMAlbaranes.QMDetalle.Edit;
           DMAlbaranes.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end
  else
  begin
     with DMAlbaranes.QMDetalle do
     begin
        if ((Key = VK_F3) and (not (State in [dsEdit, dsInsert]))) then
        begin
           if RecordCount = 0 then
              Insert
           else
              Edit;
        end;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  // DMMain.Log('TFMAlbaranes.PCMainChanging');
  if (Sender as TPageControl).ActivePage.PageIndex = TSCartaPorte.PageIndex then
     DMAlbaranes.CerrarCartaPortes;
  if (Sender as TPageControl).ActivePage.PageIndex = TSEDI.PageIndex then
     DMAlbaranes.QMCabeceraEDI.Close;
end;

procedure TFMAlbaranes.DBEFTipoLineaKriChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFTipoLineaKriChange');
  ETipoLineaKri.Text := DameTituloTipoLinea(StrToIntDef(DBEFTipoLineaKri.Text, -1));
end;

procedure TFMAlbaranes.DBEFContactoBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFContactoBusqueda');
  DBEFContacto.CondicionBusqueda := Format('TERCERO = %d AND ((DIRECCION = 0) OR (DIRECCION = %d))', [DMAlbaranes.xCliente.FieldByName('TERCERO').AsInteger, DMAlbaranes.QMCabeceraDIRECCION.AsInteger]);
end;

procedure TFMAlbaranes.DBRENotasEnter(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBRENotasEnter');
  RichEditConFoco := TDBRichEdit(Sender);
end;

procedure TFMAlbaranes.DBRENotasSelectionChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBRENotasSelectionChange');
  try
     FUpdating := True;
     with TDBRichEdit(Sender) do
     begin
        EFontSizeNotas.Text := IntToStr(SelAttributes.Size);
        CBFontName.Text := SelAttributes.Name;
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMAlbaranes.GetFontNames;
var
  DC : HDC;
begin
  // DMMain.Log('TFMAlbaranes.GetFontNames');
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(CBFontName.Items));
  ReleaseDC(0, DC);
  CBFontName.Sorted := True;
end;

procedure TFMAlbaranes.EFontSizeNotasChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFontSizeNotasChange');
  if FUpdating then
     Exit;
  with RichEditConFoco do
  begin
     if SelLength > 0 then
        SelAttributes.Size := StrToInt(EFontSizeNotas.Text)
     else
        DefAttributes.Size := StrToInt(EFontSizeNotas.Text);
  end;
end;

procedure TFMAlbaranes.CBFontNameChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.CBFontNameChange');
  if FUpdating then
     Exit;
  with RichEditConFoco do
  begin
     if SelLength > 0 then
        SelAttributes.Name := CBFontName.Items[CBFontName.ItemIndex]
     else
        DefAttributes.Name := CBFontName.Items[CBFontName.ItemIndex];
  end;
end;

procedure TFMAlbaranes.AAdjuntosAlbaranExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAdjuntosAlbaranExecute');
  inherited;
  FMain.MuestraAdunto('ALB', DMAlbaranes.QMCabeceraID_S.AsInteger);
end;

procedure TFMAlbaranes.AAdjuntosClienteExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAdjuntosClienteExecute');
  inherited;
  FMain.MuestraAdunto('CLI', DameIDCliente(DMAlbaranes.QMCabeceraCLIENTE.AsInteger));
end;

procedure TFMAlbaranes.AAdjuntosTerceroExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAdjuntosTerceroExecute');
  inherited;
  FMain.MuestraAdunto('TER', DMAlbaranes.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMAlbaranes.AAdjuntosAgenteExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAdjuntosAgenteExecute');
  inherited;
  FMain.MuestraAdunto('AGE', DameIDAgente(DMAlbaranes.QMCabeceraAGENTE.AsInteger));
end;

procedure TFMAlbaranes.AAdjuntosTransportistaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAdjuntosTransportistaExecute');
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DMAlbaranes.QMCabeceraTRANSPORTISTA.AsInteger));
end;

procedure TFMAlbaranes.AEnviarAlbaranMailPDF2Execute(Sender: TObject);
var
  Asunto : string;
  CuerpoMail : TStrings;
begin
  // DMMain.Log('TFMAlbaranes.AEnviarAlbaranMailPDF2Execute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try

     DMLstAlbaranes.MostrarListadoMail(DMAlbaranes.QMCabeceraID_S.AsInteger, EFSerie.Text, 2,
        DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, (LeeParametro('ALBLSTM001') = 'S'));

     InicializaVariableEmail(DMAlbaranes.QMCabeceraTIPO.AsString);
     with VariableEmail do
     begin
        Ejercicio := DMAlbaranes.QMCabeceraEJERCICIO.AsInteger;
        Serie := DMAlbaranes.QMCabeceraSERIE.AsString;
        NumeroDocumento := DMAlbaranes.QMCabeceraRIG.AsInteger;
        Fecha := DMAlbaranes.QMCabeceraFECHA.AsDateTime;
        SuReferencia := DMAlbaranes.QMCabeceraSU_REFERENCIA.AsString;
        SuPedido := DMAlbaranes.QMCabeceraPEDIDO_CLIENTE.AsString;
        Folio := IntToStr(DMAlbaranes.QMCabeceraFOLIO.AsInteger);
        TituloDocTributario := DameTituloTipoDocTributario(DMAlbaranes.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString);
        NombreFichero := DMLstAlbaranes.nombreFich;
        Matricula := DMMain.DameMatriculaFichaTecnica(DMAlbaranes.QMCabeceraID_FICHA_TECNICA.AsInteger);
        if (DMAlbaranes.QMCabeceraCLIENTE.AsInteger > 0) then
        begin
           NombreComercial := DMAlbaranes.QMCabeceraNOMBRE_COMERCIAL.AsString;
           RazonSocial := DMAlbaranes.QMCabeceraTITULO.AsString;
        end
        else
        begin
           // El campo TITULO se rellena con el nombre asignado al Tercero Vario
           NombreComercial := DMAlbaranes.QMCabeceraTITULO.AsString;
           RazonSocial := DMAlbaranes.QMCabeceraTITULO.AsString;
        end;
        OrdenTrabajo := 0;
        UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMAlbaranes.QMCabeceraENTRADA.AsInteger));
     end;
     DamePartesEmail(Asunto, CuerpoMail);
     try
        DMListados.SendMailClientePDF2(DMAlbaranes.QMCabeceraCLIENTE.AsInteger, CuerpoMail,
           DMLstAlbaranes.rutaFich, DMLstAlbaranes.nombreFich, Asunto, DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraID_S.AsInteger, True, DMMain.DameCorreoCopiaAgente(DMAlbaranes.QMCabeceraAGENTE.AsInteger, 'ALB'));
     finally
        CuerpoMail.Free;
     end;

     // Marco el documento como listado
     DMLstAlbaranes.UpdateaDocumentos;
  finally
     CierraData(DMLstAlbaranes);
  end;
end;

procedure TFMAlbaranes.ACambiaFechaExecute(Sender: TObject);
var
  NuevaFecha : TDateTime;
begin
  // DMMain.Log('TFMAlbaranes.ACambiaFechaExecute');
  NuevaFecha := REntorno.FechaTrab;
  if (PideDato('DTM', NuevaFecha, _('Introduzca nueva fecha'))) then
     DMAlbaranes.CambiaFechaAlbaranes(NuevaFecha);
end;

procedure TFMAlbaranes.EFClienteChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFClienteChange');
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMAlbaranes.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMAlbaranes.LTelefonoClick(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.LTelefonoClick');
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMAlbaranes.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMAlbaranes.DBCHKListadoClick(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBCHKListadoClick');
  DBCHKListado.Checked := (DMAlbaranes.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMAlbaranes.ACondicionesDeVentaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ACondicionesDeVentaExecute');
  AbreForm(TFMCondicionesVenta, FMCondicionesVenta);
  FMCondicionesVenta.EFCliente.Text := EFCliente.Text;
end;

procedure TFMAlbaranes.EFAlmacenChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFAlmacenChange');
  ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMAlbaranes.DBEAlmacenDepositoChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEAlmacenDepositoChange');
  ETituloAlmacenDeposito.Text := DameTituloAlmacen(DBEAlmacenDeposito.Text);
end;

procedure TFMAlbaranes.EFAgenteChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFAgenteChange');
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMAlbaranes.EFTransportistaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFTransportistaChange');
  ETituloTransportista.Text := DameTituloAcreedor(StrToIntDef(EFTransportista.Text, 0));

  // Accion de crear ruta habilitada segun si el transportista crea ruta o no
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TRANSPORTISTA_CREA_RUTA FROM EMP_ACREEDORES WHERE EMPRESA = ?EMPRESA AND ACREEDOR = ?ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ACREEDOR'].AsInteger := DMAlbaranes.QMCabeceraTRANSPORTISTA.AsInteger;
        ExecQuery;
        ACrearRuta.Enabled := (FieldByName['TRANSPORTISTA_CREA_RUTA'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMAlbaranes.DBEFTarifaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFTarifaChange');
  ETituloTarifa.Text := DameTituloTarifa(DBEFTarifa.Text);
end;

procedure TFMAlbaranes.DBEFIdiomaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFIdiomaChange');
  ETituloIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMAlbaranes.EFCampanyaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.EFCampanyaChange');
  ETituloCampanya.Text := DameTituloCampanya(StrToIntDef(EFCampanya.Text, -1));
end;

procedure TFMAlbaranes.AListadoArticulosExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AListadoArticulosExecute');
  AbreData(TDMLstAlbaranArt, DMLstAlbaranArt);
  TFMLstEntreFechasAlbArt.Create(Self).Muestra('ALB', EFSerie.Text, EFAlmacen.Text);
  CierraData(DMLstAlbaranArt);
end;

procedure TFMAlbaranes.AOrdenarLineasPorDireccionEntregaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AOrdenarLineasPorDireccionEntregaExecute');
  /// Ordena las lineas por direccion de entrega, articulo, linea
  DMAlbaranes.OrdenarLineasPorDireccionEntrega;
end;

procedure TFMAlbaranes.ADistribuyeLineasPorDirecionEntregaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ADistribuyeLineasPorDirecionEntregaExecute');
  /// Distribuye lineas en cajas dependiendo de la direccion de entrega
  DMAlbaranes.DistribuyeLineasPorDirecionEntrega;
end;

procedure TFMAlbaranes.AListarEtiquetasExecute(Sender: TObject);
var
  SQL : TStrings;
begin
  // DMMain.Log('TFMAlbaranes.AListarEtiquetasExecute');
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  // Pasamos SQL a mano para enviar lotes
  // FMImprimirCodBarras.ImportarDatos(DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraID_S.AsInteger);
  SQL := TStringList.Create;
  try
     DMAlbaranes.DameSqlImpresionEtiquetas(SQL);
     FMImprimirCodBarras.ImportarDatosSql(DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraID_S.AsInteger, SQL);
  finally
     SQL.Free;
  end;
end;

procedure TFMAlbaranes.DBEFCargadoraChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFCargadoraChange');
  ETitCargadora.Text := DameTituloTercero(StrToIntDef(DBEFCargadora.Text, 0));
  ETitDirCargadora.Text := DameTituloDireccionTercero(StrToIntDef(DBEFCargadora.Text, 0), StrToIntDef(DBEFDirCargadora.Text, 0));
end;

procedure TFMAlbaranes.DBEFDestinatarioChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDestinatarioChange');
  ETitDestinatario.Text := DameTituloTercero(StrToIntDef(DBEFDestinatario.Text, 0));
  ETitDirDestinatario.Text := DameTituloDireccionTercero(StrToIntDef(DBEFDestinatario.Text, 0), StrToIntDef(DBEFDirDestinatario.Text, 0));
end;

procedure TFMAlbaranes.DBEFExpedidoraChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFExpedidoraChange');
  ETitExpedidora.Text := DameTituloTercero(StrToIntDef(DBEFExpedidora.Text, 0));
  ETitDirExpedidora.Text := DameTituloDireccionTercero(StrToIntDef(DBEFExpedidora.Text, 0), StrToIntDef(DBEFDirExpedidora.Text, 0));
end;

procedure TFMAlbaranes.DBEFIntermediariaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFIntermediariaChange');
  ETitIntermediaria.Text := DameTituloTercero(StrToIntDef(DBEFIntermediaria.Text, 0));
  ETitDirIntermediaria.Text := DameTituloDireccionTercero(StrToIntDef(DBEFIntermediaria.Text, 0), StrToIntDef(DBEFDirIntermediaria.Text, 0));
end;

procedure TFMAlbaranes.DBEFDestinoChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDestinoChange');
  ETitDestino.Text := DameTituloDireccionTercero(DMAlbaranes.QMCabeceraTERCERO.AsInteger, DMAlbaranes.QMCartaPortesDESTINO.AsInteger);
end;

procedure TFMAlbaranes.DBEFDirIntermediariaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirIntermediariaChange');
  ETitDirIntermediaria.Text := DameTituloDireccionTercero(StrToIntDef(DBEFIntermediaria.Text, 0), StrToIntDef(DBEFDirIntermediaria.Text, 0));
end;

procedure TFMAlbaranes.DBEFDirExpedidoraChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirExpedidoraChange');
  ETitDirExpedidora.Text := DameTituloDireccionTercero(StrToIntDef(DBEFExpedidora.Text, 0), StrToIntDef(DBEFDirExpedidora.Text, 0));
end;

procedure TFMAlbaranes.DBEFDirCargadoraChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirCargadoraChange');
  ETitDirCargadora.Text := DameTituloDireccionTercero(StrToIntDef(DBEFCargadora.Text, 0), StrToIntDef(DBEFDirCargadora.Text, 0));
end;

procedure TFMAlbaranes.DBEFDirDestinatarioChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirDestinatarioChange');
  ETitDirDestinatario.Text := DameTituloDireccionTercero(StrToIntDef(DBEFDestinatario.Text, 0), StrToIntDef(DBEFDirDestinatario.Text, 0));
end;

procedure TFMAlbaranes.DBEFDirTransportistaChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFDirTransportistaChange');
  ETitDirTransportista.Text := DameTituloDireccionTercero(DMAlbaranes.xTransportistaCartaTERCERO.AsInteger, StrToIntDef(DBEFDirTransportista.Text, 0));
end;

procedure TFMAlbaranes.DBEFTransportistaCartaPorteChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFTransportistaCartaPorteChange');
  ETitTransportista.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportistaCartaPorte.Text, 0));
  ETitDirTransportista.Text := DameTituloDireccionTercero(DMAlbaranes.xTransportistaCartaTERCERO.AsInteger, StrToIntDef(DBEFDirTransportista.Text, 0));
end;

procedure TFMAlbaranes.ACambioPCosteLineaExecute(Sender: TObject);
var
  PCoste : double;
begin
  // DMMain.Log('TFMAlbaranes.ACambioPCosteLineaExecute');
  PCoste := DMAlbaranes.QMDetalleP_COSTE.AsFloat;
  if (PideDato('DBL', PCoste)) then
  begin
     if (DMAlbaranes.QMDetalleP_COSTE.AsFloat <> PCoste) then
        DMAlbaranes.CambiaPCosteLinea(PCoste);
  end;
end;

procedure TFMAlbaranes.ACambioCosteAdicionalLineaExecute(Sender: TObject);
var
  CosteAdicional : double;
begin
  // DMMain.Log('TFMAlbaranes.ACambioCosteAdicionalLineaExecute');
  inherited;
  CosteAdicional := DMAlbaranes.QMDetalleCOSTE_ADICIONAL.AsFloat;
  if PideDato('DBL', CosteAdicional, _('Coste Adicional')) then
  begin
     if (DMAlbaranes.QMDetalleCOSTE_ADICIONAL.AsFloat <> CosteAdicional) then
        DMAlbaranes.CambiaCosteAdicionalLinea(CosteAdicional);
  end;
end;

procedure TFMAlbaranes.ADuplicarLineaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ADuplicarLineaExecute');
  DMAlbaranes.DuplicarLinea;
end;

procedure TFMAlbaranes.AExportarVGGExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AExportarVGGExecute');
  DMAlbaranes.ExportarVGG;
end;

procedure TFMAlbaranes.ADetalleDeCabeceraExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ADetalleDeCabeceraExecute');
  // Detalles De Cabecera (para SPI)
  TFMDetalleDeCabecera.Create(Self).Muestra(DMAlbaranes.QMCabeceraID_S.AsInteger);

  // No es necesario refrescar porque no se modifican datos de cabecera
  // DMAlbaranes.QMCabecera.Refresh;
end;

procedure TFMAlbaranes.AEliminarPackingListExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AEliminarPackingListExecute');
  if ConfirmaMensaje(_('Este proceso eliminara el packing list generado.' + #13#10 + '¿Desea continuar?')) then
     DMAlbaranes.EliminarPackingList;
end;

procedure TFMAlbaranes.AEtiquetaAlbaranExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AEtiquetaAlbaranExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  try
     DMLstAlbaranes.MostrarListadoEtiqueta(DMAlbaranes.QMCabeceraID_S.AsInteger, DMAlbaranes.QMCabeceraRIG.AsInteger, 636, EFSERIE.Text, 0, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
  finally
     CierraData(DMLstAlbaranes);
  end;
  // Refresco valor de check del estado listado
  DMAlbaranes.InfoActualiza;
end;

procedure TFMAlbaranes.AConfLstEtiquetaAlbaranExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  // DMMain.Log('TFMAlbaranes.AConfLstEtiquetaAlbaranExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  TFMListConfig.Create(Self).Muestra(636, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranes.frAlbaranes, DMLstAlbaranes.HYReport);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.AOrdenarLineasPorDireccionEntrega_FiltradasExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AOrdenarLineasPorDireccionEntrega_FiltradasExecute');
  DMAlbaranes.OrdenarLineasPorDireccionEntrega_Filtradas;
end;

procedure TFMAlbaranes.ACrearRutaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ACrearRutaExecute');
  DMAlbaranes.CreaRuta;
end;

procedure TFMAlbaranes.DBEFAlmacenChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFAlmacenChange');
  inherited;
  ETitAlmacen.Text := DameTituloAlmacen(DBEFAlmacen.Text);
end;

procedure TFMAlbaranes.LBNotasClick(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.LBNotasClick');
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMAlbaranes.xCliente.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMAlbaranes.xCliente.FieldByName('NOTAS').AsString);
        if (Trim(DMAlbaranes.xCliente.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMAlbaranes.xCliente.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        if (Trim(DMAlbaranes.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMAlbaranes.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMAlbaranes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  // DMMain.Log('TFMAlbaranes.EPMainClickBuscar');
  inherited;

  DMAlbaranes.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
     G2KTableLoc.CondicionBusqueda := G2KTableLoc.CondicionBusqueda + ' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));

  DMAlbaranes.Posicionando := True;
  try
     G2KTableLoc.Click;
  finally
     DMAlbaranes.Posicionando := False;
  end;

  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
  HabilitaEnlaces;
end;

procedure TFMAlbaranes.AAsignaEmpleadoExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAsignaEmpleadoExecute');
  inherited;
  DMAlbaranes.AsignaEmpleados;
end;

procedure TFMAlbaranes.ACreaAnticipoExecute(Sender: TObject);
var
  param_RECANT002 : string;
begin
  // DMMain.Log('TFMAlbaranes.ACreaAnticipoExecute');
  inherited;
  DMAlbaranes.CreaReciboAnticipo;

  param_RECANT002 := LeeParametro('RECANTC002', EFSerie.Text);
  if (param_RECANT002 = 'P') then
     AInformeAlbaran.Execute
  else
  if (param_RECANT002 = 'I') then
     AImprime.Execute;
end;

procedure TFMAlbaranes.ARecibosExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ARecibosExecute');
  inherited;
  FMain.MuestraRecibos('ALB', EFSerie.Text, DBERIG.Text, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
end;

procedure TFMAlbaranes.DBETituloEstadoChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBETituloEstadoChange');
  inherited;
  AbreOCierra;
end;

procedure TFMAlbaranes.ATraspasoMovimientoStockExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ATraspasoMovimientoStockExecute');
  inherited;
  DMAlbaranes.TraspasoMovimientoStock;
end;

procedure TFMAlbaranes.DBERIGChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBERIGChange');
  inherited;
  RefrescaAvisos;

  if (PCMain.ActivePage = TSOtros) then
     ActualizaFirma;

  // Si el pais es Chile pintamos de rojo el numero de folio, si tienen algun error o no se ha recibido respuesta del SII
  if ((REntorno.Pais = 'CHL') and (DMAlbaranes.QMCabeceraESTADO.AsInteger = 5)) then
  begin
     if ((DMAlbaranes.xSiiDteID_S.AsInteger = 0) or (DMAlbaranes.xSiiDteXML_RESPUESTA.AsString = '') or (DMAlbaranes.xSiiDteCANTIDAD_ERRORES.AsInteger > 0)) then
     begin
        ColorResaltado3(DBESIIFolio);
        DBESIIFolio.Hint := DMAlbaranes.xSiiDteMENSAJE_ERROR.AsString;
        DBESIIFolio.ShowHint := True;
     end
     else
     begin
        ColorCampoID(DBESIIFolio);
        DBESIIFolio.Hint := '';
        DBESIIFolio.ShowHint := False;
     end;
  end;

end;

procedure TFMAlbaranes.TSOtrosShow(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.TSOtrosShow');
  inherited;
  ControlEdit := CEOtros;
  ActualizaFirma;
end;

procedure TFMAlbaranes.ARegistroFitosanitarioExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ARegistroFitosanitarioExecute');
  inherited;
  FMain.EjecutaAccion(FMain.ARegistroFitosanitario);
  with FMRegistroFitosanitario do
  begin
     AsignaDocumento('ALB', DMAlbaranes.QMDetalle.FieldByName('ID_DETALLES_S').AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMAlbaranes.AProyectoExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AProyectoExecute');
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMAlbaranes.SBAProyectoDblClick(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.SBAProyectoDblClick');
  inherited;
  AProyecto.Execute;
end;

procedure TFMAlbaranes.AImportarDetalleExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AImportarDetalleExecute');
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMAlbaranes;
     ShowModal;
     Free;
  end;
end;

procedure TFMAlbaranes.ActualizaFirma;
begin
  // DMMain.Log('TFMAlbaranes.ActualizaFirma');
  if (DMAlbaranes.QMFirmas.Active) then
     RefrescarImagenFirma(ImgFirma, DMAlbaranes.QMFirmas.FieldByName('ID_FIRMA').AsInteger);
end;

procedure TFMAlbaranes.APedirFirmaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.APedirFirmaExecute');
  inherited;
  DMMain.PedirFirma('ALB', DMAlbaranes.QMCabeceraID_S.AsInteger);
end;

procedure TFMAlbaranes.ABorrarFirmaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ABorrarFirmaExecute');
  inherited;
  DMMain.BorrarFirma('ALB', DMAlbaranes.QMCabeceraID_S.AsInteger);
end;

procedure TFMAlbaranes.AAbrirCerrarExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AAbrirCerrarExecute');
  inherited;
  try
     Screen.Cursor := crHourGlass;
     if (AAbrirCerrar.Tag = 0) then
        DMAlbaranes.CierraAlbaran
     else
        DMAlbaranes.AbreAlbaran
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAlbaranes.AbreOCierra;
begin
  // DMMain.Log('TFMAlbaranes.AbreOCierra');
  if (DMAlbaranes.EstadoDocumento = 0) then
  begin
     with AAbrirCerrar do
     begin
        Hint := _('Cierra el documento actual');
        ImageIndex := 68;
        Tag := 0;
        Caption := _('Cerrar documento');
     end;
  end
  else
  begin
     with AAbrirCerrar do
     begin
        Hint := _('Abre el documento actual');
        ImageIndex := 67;
        Tag := 1;
        Caption := _('Abrir documento');
     end;
  end;

  // DMMain.Log('TFMAlbaranes.AbreOCierra (2)');
  ColorSegunEstado(DBETituloEstado, DMAlbaranes.EstadoDocumento);
  // DMMain.Log('TFMAlbaranes.AbreOCierra (3)');
end;

procedure TFMAlbaranes.DBEFBancoDireccionBusqueda(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFBancoDireccionBusqueda');
  inherited;
  DBEFBancoDireccion.CondicionBusqueda := 'TERCERO = ' + IntToStr(DMAlbaranes.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMAlbaranes.DBEFBancoDireccionChange(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.DBEFBancoDireccionChange');
  inherited;
  EBancoDireccion.Text := DameTituloBancoTercero(DMAlbaranes.QMCabeceraTERCERO.AsInteger, DMAlbaranes.QMCabeceraBANCO.AsInteger);
end;

procedure TFMAlbaranes.ATraspasarLineaExecute(Sender: TObject);
var
  Tipo : string;
  id_s : integer;
begin
  // DMMain.Log('TFMAlbaranes.ATraspasarLineaExecute');
  inherited;

  with TFMSeleccionGrid.Create(Self) do
  begin
     try
        AsignaSQL('SELECT ID_S, TIPO, SERIE, RIG, CLIENTE, TITULO FROM VER_CABECERAS_FACTURA WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND CANAL = ' + REntorno.CanalStr + ' AND TIPO = ''FAC'' AND ESTADO = 0 AND CLIENTE = ' + IntToStr(DMAlbaranes.QMCabeceraCLIENTE.AsInteger));
        MostrarColumna('SERIE', _('Serie'), 50);
        MostrarColumna('RIG', _('Nro. Fact.'), 50);
        MostrarColumna('CLIENTE', _('Cliente'), 50);
        MostrarColumna('TITULO', _('Nombre'), 200);
        if (ShowModal = mrOk) then
        begin
           id_s := FDS.FieldByName('ID_S').AsInteger;
           Tipo := FDS.FieldByName('TIPO').AsString;

           DMAlbaranes.TraspasaLinea(Tipo, id_s);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMAlbaranes.ATerceroExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ATerceroExecute');
  inherited;
  if PEdit.Enabled then
  begin
     if DBENombreComercial.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'TERCERO = ' + DMAlbaranes.QMCabeceraTERCERO.AsString);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'TERCERO = ' + DMAlbaranes.QMCabeceraTERCERO.AsString);
end;

procedure TFMAlbaranes.RelojAdjuntosTimer(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.RelojAdjuntosTimer');
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMAlbaranes.RelojEmailTimer(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.RelojEmailTimer');
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMAlbaranes.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  // DMMain.Log('TFMAlbaranes.DBGMainDrawColumnCell');
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
        end;

        if ((Column.FieldName = 'TRANSPORTISTA') or (Column.FieldName = 'CARTA_PORTE_TRANSPORTISTA')) then
        begin
           if (DataSource.DataSet.FieldByName('CARTA_PORTE_TRANSPORTISTA').AsInteger <> 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAlbaranes.ACrearHerenciaManualExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.ACrearHerenciaManualExecute');
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMAlbaranes.QMDetalleTIPO.AsString, DMAlbaranes.QMDetalleID_DETALLES_S.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMAlbaranes.EstableceVisibilidadStockAlmacen;

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

     if ((Parametro <> 'ALBSTKV009') and (Parametro <> 'ALBSTKR009') and (Parametro <> 'ALBSTKM001') and (Parametro <> 'ALBSTKB001') and (Parametro <> 'ALBSTKA000')) then
        Descripcion := Descripcion + ' ' + AlmacenStock;

     i := EncuentraField(DBGFDetalle, Campo);
     if (i >= 0) then
     begin
        with DBGFDetalle.Columns[i] do
        begin
           if ((Parametro = 'ALBSTKV009') or (Parametro = 'ALBSTKR009') or (Parametro = 'ALBSTKM001') or (Parametro = 'ALBSTKB001') or (Parametro = 'ALBSTKA000')) then
              Visible := (AlmacenStock = 'S')
           else
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
           if ((Parametro = 'ALBSTKV009') or (Parametro = 'ALBSTKR009') or (Parametro = 'ALBSTKM001') or (Parametro = 'ALBSTKB001') or (Parametro = 'ALBSTKA000')) then
              Visible := (AlmacenStock = 'S')
           else
              Visible := (AlmacenStock <> 'NOCALC');
        end;
     end;
  end;

begin
  EstableceVisibilidad('STOCK_ALM', 'ALBSTKA001', _('Stock'));
  EstableceVisibilidad('STOCK_ALM2', 'ALBSTKA002', _('Stock'));
  EstableceVisibilidad('STOCK_ALM3', 'ALBSTKA003', _('Stock'));

  EstableceVisibilidad('STOCKV_ALM', 'ALBSTKV001', _('S. Virt.'));
  EstableceVisibilidad('STOCKV_ALM2', 'ALBSTKV002', _('S. Virt.'));
  EstableceVisibilidad('STOCKV_ALM3', 'ALBSTKV003', _('S. Virt.'));

  EstableceVisibilidad('STOCKR_ALM', 'ALBSTKR001', _('S. Real'));
  EstableceVisibilidad('STOCKR_ALM2', 'ALBSTKR002', _('S. Real'));
  EstableceVisibilidad('STOCKR_ALM3', 'ALBSTKR003', _('S. Real'));

  EstableceVisibilidad('STOCKM_ALM', 'ALBSTKM002', _('S. Mont.'));
  EstableceVisibilidad('STOCKM_ALM2', 'ALBSTKM003', _('S. Mont.'));
  EstableceVisibilidad('STOCKM_ALM3', 'ALBSTKM004', _('S. Mont.'));

  EstableceVisibilidad('STOCK', 'ALBSTKA000', _('Sock'));
  EstableceVisibilidad('STOCK_VIRTUAL', 'ALBSTKV009', _('S. Virt.'));
  EstableceVisibilidad('STOCK_REAL', 'ALBSTKR009', _('S. Real.'));
  EstableceVisibilidad('STOCK_MONTURAS', 'ALBSTKM001', _('S. Mont.'));
  EstableceVisibilidad('STOCK_REF_BASE', 'ALBSTKB001', _('S. Ref. Base'));
end;

procedure TFMAlbaranes.AVerificacionDrasaExecute(Sender: TObject);
var
  i : integer;
begin
  // DMMain.Log('TFMAlbaranes.AVerificacionDrasaExecute');
  inherited;

  // Verificaciones para DRASA
  /// Si SERIE='A' y ALMACEN = '003' y STOCK_ALM > 0 debo verificar la linea.
  /// Si SERIE<>'A' y ALMACEN = '000' debo verificar la linea.
  /// Hago 100 registros para evitar recorrer todos los documentos del ejercicio

  with DMAlbaranes do
  begin
     i := 0;
     // Verificaciones para la serie 'A'
     if (QMCabeceraSERIE.AsString = 'A') then
     begin
        // Recorro cabeceras desde la que estoy hacia atras
        while not (QMCabecera.BOF) and (i < 100) do
        begin
           // Recorro detalles desde donde estoy
           // Hasta encontrar: ALMACEN = '003' y STOCK_ALM > 0
           while (not QMDetalle.EOF) and (QMDetalleALMACEN.AsString = '003') and (QMDetalleSTOCK_ALM.AsFloat <= 0) do
              QMDetalle.Next;

           Inc(i);
           QMCabecera.Prior;
        end;
     end;

     // Verificaciones para resto de series
     if (QMCabeceraSERIE.AsString <> 'A') then
     begin
        // Recorro cabeceras desde la que estoy hacia atras
        while not (QMCabecera.BOF) and (i < 100) do
        begin
           // Recorro detalles desde donde estoy
           // Hasta encontrar: ALMACEN = '003' y STOCK_ALM > 0
           while (not QMDetalle.EOF) and (QMDetalleALMACEN.AsString <> '003') do
              QMDetalle.Next;

           Inc(i);
           QMCabecera.Prior;
        end;
     end;
  end;
end;

procedure TFMAlbaranes.AMuestraDocumentosVentaExecute(Sender: TObject);
begin
  // DMMain.Log('TFMAlbaranes.AMuestraDocumentosVentaExecute');
  inherited;
  AACliente.Execute;
  FMClientes.MuestraDocumentosVenta('ALB');
end;

procedure TFMAlbaranes.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if ((Button = nbDelete) and (DMAlbaranes.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMAlbaranes.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMAlbaranes.AEnviaDTECLExecute(Sender: TObject);
begin
  inherited;
  if (DMAlbaranes.DocumentoDteValido) then
  begin
     // Verificamos si el documento se envia con la API  Factronica
     if (LeeParametro('DTEENVI004') = 'S') then
     begin
        AbreData(TDMDTEChl, DMDTEChl);
        try
           DMDTEChl.EnviaDTE(DMAlbaranes.QMCabeceraID_S.AsInteger);
        finally
           CierraData(DMDTEChl);
        end;
     end
     else
     begin
        AbreData(TDMEnviaXMLFacturasChl, DMEnviaXMLFacturasChl);
        try
           DMEnviaXMLFacturasChl.EnviaDTE(DMAlbaranes.QMCabeceraID_S.AsInteger, False);
        finally
           CierraData(DMEnviaXMLFacturasChl);
        end;
        DMAlbaranes.QMCabecera.Refresh;
     end;
  end;
end;

procedure TFMAlbaranes.DBEFOtrosTipoVentaChange(Sender: TObject);
begin
  inherited;
  EOtrosTipoVenta.Text := DameTituloTipoVenta(StrToIntDef(DBEFOtrosTipoVenta.Text, 0));
end;

procedure TFMAlbaranes.DBEFOtrosCodigoGiroClienteChange(Sender: TObject);
begin
  inherited;
  EOtrosCodigoGiroCliente.Text := DameTituloCodigoGiro(StrToIntDef(DBEFOtrosCodigoGiroCliente.Text, 0));
end;

procedure TFMAlbaranes.DBEFOtrosCodigoGiroEmpresaChange(Sender: TObject);
begin
  inherited;
  EOtrosCodigoGiroEmpresa.Text := DameTituloCodigoGiro(StrToIntDef(DBEFOtrosCodigoGiroEmpresa.Text, 0));
end;

procedure TFMAlbaranes.DBEOtrosTipoDespachoChange(Sender: TObject);
begin
  inherited;
  if (DMAlbaranes.QMCabeceraID_TIPO_DESPACHO.AsInteger > 0) then
     EOtrosTipoDespachoTitulo.Text := DameTituloParametrosFE(StrToIntDef(DBEOtrosTipoDespacho.Text, 0), 'TIPO_DESPACHO');
end;

procedure TFMAlbaranes.DBEFOtrosTipoDocumentoTributarioChange(Sender: TObject);
begin
  inherited;
  EOtrosTipoDocumentoTributario.Text := DameTituloTipoDocTributario(DBEFOtrosTipoDocumentoTributario.Text);
end;

procedure TFMAlbaranes.DBETpoDocRefChange(Sender: TObject);
begin
  inherited;
  ETipoDocTribTitulo.Text := DameTituloTipoDocTributario(DBETpoDocRef.Text);

  // Si el Tipo de Doc Trib es diferente de 33, 56 ó 61 se asigna folio manualmente.
  if ((DBETpoDocRef.Text = '52') or (DBETpoDocRef.Text = '33')) then
  begin
     DBEFolioRef.ReadOnly := True;
     DBEFolioRef.Color := clInfoBk;
     DBEIdDocRef.ReadOnly := False;
     DBEIdDocRef.Color := clWindow;
     DBEIdDocRef.Font.Color := clWindowText;
  end
  else
  begin
     DBEFolioRef.ReadOnly := False;
     DBEFolioRef.Color := clWindow;
     DBEIdDocRef.ReadOnly := True;
     DBEIdDocRef.Color := clInfoBk;
     DBEIdDocRef.Font.Color := clGrayText;
  end;
end;

procedure TFMAlbaranes.LimitaSegunPais;
begin
  if (REntorno.Pais <> 'CHL') then
  begin
     PNLChile.Visible := False;
     AEnviaDTECL.Enabled := False;
     TBEnvioDTE.Visible := False;
     // TSFEChile.TabVisible := False;
     TSOtrosChile.TabVisible := False;
     TSepBuscaFolio.Visible := False;
     TBLocalizaFolio.Visible := False;

     (*
     {$IFDEF Debug}
     PNLChile.Visible := True;
     AEnviaDTECL.Enabled := True;
     TBEnvioDTE.Visible := True;
     // TSFEChile.TabVisible := True;
     TSOtrosChile.TabVisible := True;
     {$ENDIF}
     *)
  end;

  if (REntorno.Pais = 'CHL') then
  begin
     AgregaColumna(DBGMain, 'FOLIO', _('Folio'));
     AgregaColumna(DBGMain, 'TIPO_DOC_TRIBUTARIO', _('Tipo Doc. Tributario'));

     AgregaColumna(DBGMain, 'SII_FMA_PAGO', _('F. Pago SII'));
     AgregaColumna(DBGMain, 'TIPO_VENTA', _('Tipo Venta SII'));
     AgregaColumna(DBGMain, 'INDTRASLADO', _('Ind. Traslado'));
     AgregaColumna(DBGMain, 'TPOIMPRESION', _('Tipo Impresion'));

     AgregaColumna(DBGMain, 'OC_NROLINREF', _('O.C. Nro. Lin. Ref.'));
     AgregaColumna(DBGMain, 'OC_TPODOCREF', _('O.C. T. Doc. Ref.'));
     AgregaColumna(DBGMain, 'OC_FOLIOREF', _('O.C. Folio Ref.'));
     AgregaColumna(DBGMain, 'OC_RUTOTR', _('O.C. RUT'));
     AgregaColumna(DBGMain, 'OC_FCHREF', _('O.C. Fec. Ref.'));
     AgregaColumna(DBGMain, 'OC_CODREF', _('O.C. Cod. Ref.'));
     AgregaColumna(DBGMain, 'OC_RAZONREF', _('O.C. Razon Ref.'));
  end;

  if (PNLChile.Visible) then
     PNLAvisos.Left := (PNLChile.Left + PNLChile.Width) + 5
  else
     PNLAvisos.Left := PNLChile.Left;

  PNLAvisos.Width := PNLEdCabecera.Width - PNLAvisos.Left - 1;
end;

procedure TFMAlbaranes.DBESIITipoVentaChange(Sender: TObject);
begin
  inherited;
  LSIITituloTipoVenta.Text := DameTituloTipoVenta(StrToIntDef(DBESIITipoVenta.Text, 0));
end;

procedure TFMAlbaranes.DBESIICodigoGiroClienteChange(Sender: TObject);
begin
  inherited;
  if (DMAlbaranes.QMCabecera.State in [dsInsert, dsEdit]) then
  begin
     if (DBESIICodigoGiroCliente.Text = '0') then
     begin
        DBESIITituloCodigoGiroCliente.Color := clWindow;
        DBESIITituloCodigoGiroCliente.Text := '';
        DBESIICodigoGiroCliente.Color := clInfoBk;
        DBESIICodigoGiroCliente.ReadOnly := True;
        DBESIICodigoGiroCliente.Enabled := False;
     end
     else
     begin
        DBESIITituloCodigoGiroCliente.Color := clInfoBk;
        DBESIITituloCodigoGiroCliente.Text := DameTituloCodigoGiro(StrToIntDef(DBESIICodigoGiroCliente.Text, 0));
        DBESIICodigoGiroCliente.Color := clWindow;
        DBESIICodigoGiroCliente.ReadOnly := False;
        DBESIICodigoGiroCliente.Enabled := True;
     end;
  end;
end;

procedure TFMAlbaranes.DBESIICodigoGiroEmpresaChange(Sender: TObject);
begin
  inherited;
  LSIITituloCodigoGiroEmpresa.Text := DameTituloCodigoGiro(StrToIntDef(DBESIICodigoGiroEmpresa.Text, 0));
end;

procedure TFMAlbaranes.DBESIITDespachoChange(Sender: TObject);
begin
  inherited;
  if (DMAlbaranes.QMCabeceraID_TIPO_DESPACHO.AsInteger > 0) then
     SIITituloDespachoDBESIITDespacho.Text := DameTituloParametrosFE(StrToIntDef(DBESIITDespacho.Text, 0), 'TIPO_DESPACHO');
end;

procedure TFMAlbaranes.DBESIITDocTribChange(Sender: TObject);
begin
  inherited;
  LSIITituloTDocTrib.Text := DameTituloTipoDocTributario(DBESIITDocTrib.Text);
end;

procedure TFMAlbaranes.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMAlbaranes.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, '(ESTADO = 0)');
end;

procedure TFMAlbaranes.AFiltroAnuladoExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, '(ESTADO = 2)');
end;

procedure TFMAlbaranes.AFiltroAbiertoFacturableExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, '(ESTADO = 0 AND FACTURABLE = 1)');
end;

procedure TFMAlbaranes.AFiltroAbiertoMuestrasExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, '(ESTADO = 0 AND DOCUMENTO_MUESTRAS = 1)');
end;

procedure TFMAlbaranes.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.FiltraDocumento(EFSerie.Text, '(ESTADO = 5)');
end;

procedure TFMAlbaranes.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
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

procedure TFMAlbaranes.TSDirManualResize(Sender: TObject);
begin
  inherited;
  PNLDirRecogida.Width := TSDirManual.Width div 2;
end;

procedure TFMAlbaranes.ADetallesDeLineaExecute(Sender: TObject);
begin
  inherited;
  TFMDetalleDeLinea.Create(Self).Muestra(DMAlbaranes.QMDetalleID_DETALLES_S.AsInteger);
  DMAlbaranes.QMDetalle.Refresh;
end;

procedure TFMAlbaranes.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('ALB', DMAlbaranes.QMCabeceraID_S.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosAlbaran.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMAlbaranes.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMAlbaranes.QMDetalleTIPO.AsString, DMAlbaranes.QMDetalleID_S.AsInteger);

        if (ShowModal = mrOk) then
        begin
           // Borrar las líneas que estén seleccionadas en TMP_DOC_LINEAS_A_PROC
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' DELETE FROM GES_DETALLES_S ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' ID_DETALLES_S IN (SELECT ID_DETALLES_DOC ');
                 SQL.Add('                   FROM TMP_DOC_LINEAS_A_PROC ');
                 SQL.Add('                   WHERE ');
                 SQL.Add('                   ENTRADA = :ENTRADA AND ');
                 SQL.Add('                   SELECCIONADO = 1) ');
                 Params.ByName['ID_S'].AsInteger := DMAlbaranes.QMDetalleID_S.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMAlbaranes.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMAlbaranes.APickingListExecute(Sender: TObject);
begin
  inherited;
  // DMMain.Log('TFMAlbaranes.APickingListExecute');
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  APickingList.Enabled := False;
  try
     DMLstAlbaranes.MostrarListadoPicking(DMAlbaranes.QMCabeceraID_S.AsInteger, DMAlbaranes.QMCabeceraRIG.AsInteger, EFSerie.Text, 0, 0, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger);
  finally
     APickingList.Enabled := True;
     CierraData(DMLstAlbaranes);
  end;
end;

procedure TFMAlbaranes.AConfPickingListExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  TFMListConfig.Create(Self).Muestra(651, Formato, Cabecera, Copias,
     Pijama, EFSerie.Text, DMLstAlbaranes.frAlbaranes, DMLstAlbaranes.HYReport);
  CierraData(DMLstAlbaranes);
end;

procedure TFMAlbaranes.ALocalizaFolioExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranes.LoaclizaFolio;

  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
  HabilitaEnlaces;
end;

procedure TFMAlbaranes.DBEMargenChange(Sender: TObject);
begin
  inherited;
  if (MargenMinimo >= 0) then
     if (MargenMinimo > DMAlbaranes.xInfoActualizadaMARGEN.AsFloat) then
        ColorError(DBEMargen)
     else
        ColorInfo(DBEMargen);
end;

procedure TFMAlbaranes.RefrescaAvisos;
begin
  // DMMain.Log('TFMAlbaranes.Adjuntos');
  if (DMMain.ExisteAdjunto(DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraID_S.AsInteger)) then
     RelojAdjuntos.Enabled := True
  else
     RelojAdjuntos.Enabled := False;

  LAdjuntos.Visible := RelojAdjuntos.Enabled;

  // DMMain.Log('TFMAlbaranes.Email');
  if (DMMain.EnviarFacturasClientePorEmail(DMAlbaranes.QMCabeceraCLIENTE.AsInteger)) then
     RelojEmail.Enabled := True
  else
     RelojEmail.Enabled := False;

  LEmail.Visible := RelojEmail.Enabled;

  // DMMain.Log('TFMAlbaranes.Notas');
  if (((DMAlbaranes.xCliente.Active) and (Trim(DMAlbaranes.xCliente.FieldByName('NOTAS').AsString) > '')) or
     ((DMAlbaranes.xAvisos.Active) and (Trim(DMAlbaranes.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
     RelojNotas.Enabled := True
  else
     RelojNotas.Enabled := False;

  LBNotas.Visible := RelojNotas.Enabled;

  LRiesgoAct.Hint := format(_('Riesgo Actual: %.2f' + #13#10 + 'Riesgo Pedido: %.2f' + #13#10 + 'Riesgo Autorizado: %.2f'), [DMAlbaranes.xInfoActualizadaRIESGO_ACT.AsFloat, DMAlbaranes.xInfoActualizadaRIESGO_PED.AsFloat, DMAlbaranes.xInfoActualizadaRIESGO_AUT.AsFloat]);
  LRiesgo.Hint := LRiesgoAct.Hint;
  if (DMAlbaranes.xInfoActualizadaRIESGO_DISPONIBLE.AsFloat < 0) then
     ColorError(PNLRiesgo)
  else
     ColorResaltado(PNLRiesgo);

  if ((DMAlbaranes.xCliente.Active) and (DMAlbaranes.QMCabeceraTIPO_PORTES.AsInteger <> DMAlbaranes.xCliente.FieldByName('TIPO_PORTES').AsInteger)) then
  begin
     ColorResaltado3(DBEFPortes);
     ColorResaltado3(ETituloPortes);
     DBEFPortes.Hint := format(_('El porte del cliente es habitualmente %d'), [DMAlbaranes.QMCabeceraTIPO_PORTES.AsInteger]);
     DBEFPortes.ShowHint := True;
  end
  else
  begin
     ColorEdicion(DBEFPortes);
     ColorInfo(ETituloPortes);
     DBEFPortes.Hint := '';
     DBEFPortes.ShowHint := False;
  end;

  ETituloPortes.Hint := DBEFPortes.Hint;
  ETituloPortes.ShowHint := DBEFPortes.ShowHint;

  if ((DMAlbaranes.xCliente.Active) and (DMAlbaranes.xCliente.FieldByName('TERCERO').AsInteger > 0) and (Trim(DMAlbaranes.xCliente.FieldByName('NIF').AsString) = '')) then
  begin
     ColorResaltado3(DBETituloCliente);
     ColorResaltado3(DBETituloCliente);
     DBETituloCliente.Font.Color := clWhite;
     DBETituloCliente.Hint := _('El cliente no tienen NIF asignado');
     DBETituloCliente.ShowHint := True;
     SBACliente.Hint := _('El cliente no tienen NIF asignado');
     SBACliente.ShowHint := True;
  end
  else
  begin
     DBETituloCliente.Color := REntorno.ColorEnlaceActivo;
     DBETituloCliente.Font.Color := clWindowText;
     DBETituloCliente.Hint := '';
     DBETituloCliente.ShowHint := False;
     SBACliente.Hint := ('Doble click o Ctrl+Alt+C para ver los datos del Cliente');
     SBACliente.ShowHint := False;
  end;
end;

procedure TFMAlbaranes.DBEFMotivoAbonoChange(Sender: TObject);
begin
  inherited;
  EMotivoAbono.Text := DMMain.DameMotivoAbono(StrToIntDef(DBEFMotivoAbono.Text, 0));
end;

procedure TFMAlbaranes.TSProveedoresShow(Sender: TObject);
begin
  inherited;
  DMAlbaranes.ConectaProveedores;
end;

procedure TFMAlbaranes.EFModoIvaChange(Sender: TObject);
begin
  inherited;
  EModoIva.Text := DameTituloModoIVA(StrToIntDef(EFModoIva.Text, -1));
end;

procedure TFMAlbaranes.ATraspasaMovimientoStockExecute(Sender: TObject);
var
  Comentario : string;
begin
  inherited;
  Comentario := _('Depreciacion');
  if (PideDato('STR', Comentario, _('Comentario Mov. Stock'))) then
     DMAlbaranes.TraspasaMovimientoStock(Comentario);
end;

procedure TFMAlbaranes.ATraspasaFiltradosMovimientoStockExecute(Sender: TObject);
var
  Comentario : string;
begin
  inherited;
  if ConfirmaMensaje(_('Traspasar a movimientos TODOS los documentos fitlrados?')) then
  begin
     Comentario := _('Depreciacion');
     if (PideDato('STR', Comentario, _('Comentario Mov. Stock'))) then
        DMAlbaranes.TraspasaMovimientoStock(Comentario, True);
  end;
end;

procedure TFMAlbaranes.TBComprobarClick(Sender: TObject);
var
  s, w : string;
  i, Index : integer;
begin
  inherited;
  s := DBRENotas.Lines.Text;
  Index := LBPalabras.ItemIndex;
  if (Index < 0) then
     Index := 0;

  // Recorro texto y agrego palabras a lista de palabras
  LBPalabras.Items.Clear;
  w := '';
  for i := 1 to Length(s) do
  begin
     if (s[i] in ['A'..'Z', 'a'..'z', 'ñ', 'Ñ', 'ç', 'Ç', 'á', 'Á', 'é', 'É', 'í', 'Í', 'ó', 'Ó', 'ú', 'Ú', 'ü', 'Ü', 'à', 'À', 'è', 'È', 'ì', 'Ì', 'ò', 'Ò', 'ù', 'Ù']) then
        w := w + s[i]
     else
     begin
        if (Trim(w) > '') then
           LBPalabras.Items.Add(w);

        w := '';
     end;
  end;
  if (w <> ' ') then
     LBPalabras.Items.Add(w);

  // Borro palabras conocidas.
  for i := LBPalabras.Items.Count - 1 downto 0 do
  begin
     if DMMain.ExistePalabra(LBPalabras.Items[i]) then
        LBPalabras.Items.Delete(i);
  end;

  if (LBPalabras.Items.Count = 0) then
     LBPalabras.ItemIndex := -1
  else
  if (Index > LBPalabras.Items.Count - 1) then
     LBPalabras.ItemIndex := LBPalabras.Items.Count - 1
  else
     LBPalabras.ItemIndex := Index;
end;

procedure TFMAlbaranes.TBAgregarPalabraClick(Sender: TObject);
var
  Origen : string;
begin
  inherited;
  Origen := format('%s-%d-%s/%d', [DMAlbaranes.QMCabeceraTIPO.AsString, DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, DMAlbaranes.QMCabeceraSERIE.AsString, DMAlbaranes.QMCabeceraRIG.AsInteger]);
  DMMain.AgregarPalabra(LBPalabras.Items[LBPalabras.ItemIndex], Origen);
  TBComprobar.Click;
end;

procedure TFMAlbaranes.AExportarExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := Format(_('Albaran_%d-%s-%.5d_%s.xls'), [DMAlbaranes.QMCabeceraEJERCICIO.AsInteger, DMAlbaranes.QMCabeceraSERIE.AsString, DMAlbaranes.QMCabeceraRIG.AsInteger, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMAlbaranes') then
  begin
     Screen.Cursor := crHourGlass;
     try
        AbreData(TDMLstAlbaranes, DMLstAlbaranes);
        DMLstAlbaranes.ExportarExcel(DMAlbaranes.QMCabeceraID_S.AsInteger, Archivo);
     finally
        Screen.Cursor := crDefault;
        CierraData(DMLstAlbaranes);
     end;
  end;
end;

procedure TFMAlbaranes.AFiltraClientesALFAExecute(Sender: TObject);
var
  Fecha : TDateTime;
begin
  inherited;
  Fecha := Today;
  if (PideDato('DAT', Fecha)) then
     DMAlbaranes.FiltraCabeceraALFACliente(1, 'X', Fecha);
end;

procedure TFMAlbaranes.AAsignarEnvioExecute(Sender: TObject);
var
  Bultos : integer;
begin
  inherited;
  try
     Bultos := Trunc(DMAlbaranes.QMCartaPortesBULTOS.AsFloat);
     if (Bultos <= 0) then
        Bultos := 1;

     DMMain.GrabaExpedicion(DMAlbaranes.QMCabeceraID_S.AsInteger, Bultos, DMAlbaranes.QMCartaPortesPESO.AsFloat, Trim(DMAlbaranes.QMCartaPortesCODIGO_EXPEDICION.AsString), '', Today, StrToIntDef(DBEFTransportistaCartaPorte.Text, 0));
  except
     on E: Exception do
        ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
  end;
end;

procedure TFMAlbaranes.AIncrementarPrecioExecute(Sender: TObject);
var
  Factor : double;
begin
  inherited;

  Factor := 1;
  if (PideDato('DBL', Factor, _('Factor'))) then
  begin
     DMAlbaranes.MultiplicaPrecios(Factor);
  end;
end;

procedure TFMAlbaranes.APeticionRecogidaGLSExecute(Sender: TObject);
var
  {No se utilizan
  ImprimirDocDestino : boolean;
  IdPEC  : integer
  }
  IdALB, Bultos : integer;
  SuReferencia : string;
  Peso : double;
  Expedicion : string;
  FicheroPeticion, FicheroRespuesta, FicheroEtiqueta, RespuestaError, FicheroRespuestaSOAPRequest, FicheroRespuestaSOAPResponse : string;
  HoraEnvioFichero : TDateTime;
  Servicio, Horario : string;
  Resultado : word;
  TerceroAlb, DireccionAlb : integer;
  RazonSocial, Nombre, Direccion, Poblacion, Provincia, CodTelefonico, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones : string;
  i : integer;
  sl : TStrings;
  ResultadoEnvio : string;
  Comando, Argumentos : string;
  TransportistaIDRIL : integer;

  procedure DameDireccionTercero(Tercero, DirNumnero: integer; var RazonSocial, Nombre, Direccion, Poblacion, Provincia, CodTelefonico, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones: string);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT T.TERCERO, D.DIRECCION, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_COMPLETA, D.DIR_NOMBRE_2, D.DIR_NOMBRE_3, LO.TITULO LOCALIDAD, ');
           SQL.Add('        PR.TITULO PROVINCIA, PA.CODIGO_TEL, LO.CODIGO_POSTAL, D.DIR_TELEFONO01, D.DIR_TELEFONO02, T.EMAIL, ');
           SQL.Add('        CAST('''' AS VARCHAR(50)) DEPARTAMENTO, CAST('''' AS VARCHAR(80)) OBSERVACIONES, PA.PAIS_C2 ');
           SQL.Add(' FROM SYS_TERCEROS T ');
           SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
           SQL.Add(' JOIN SYS_LOCALIDADES LO ON D.ID_LOCAL = LO.ID_LOCAL ');
           SQL.Add(' JOIN SYS_PROVINCIAS PR ON LO.PROVINCIA = PR.PROVINCIA AND LO.PAIS = PR.PAIS ');
           SQL.Add(' JOIN SYS_PAISES PA ON LO.PAIS = PA.PAIS ');
           SQL.Add(' WHERE ');
           SQL.Add(' T.TERCERO = :TERCERO AND ');
           if (DirNumnero <> 0) then
              SQL.Add(' D.DIRECCION = :DIRECCION ')
           else
              SQL.Add(' D.DIR_DEFECTO = 1 ');

           Params.ByName['TERCERO'].AsInteger := Tercero;
           if (DirNumnero <> 0) then
              Params.ByName['DIRECCION'].AsInteger := DirNumnero;
           ExecQuery;
           RazonSocial := FieldByName['NOMBRE_R_SOCIAL'].AsString;
           Nombre := FieldByName['NOMBRE_COMERCIAL'].AsString;
           Direccion := Trim(FieldByName['DIR_COMPLETA'].AsString);
           Poblacion := FieldByName['LOCALIDAD'].AsString;
           Provincia := FieldByName['PROVINCIA'].AsString;
           CodTelefonico := FieldByName['CODIGO_TEL'].AsString;
           Pais_C2 := FieldByName['PAIS_C2'].AsString;
           CP := FieldByName['CODIGO_POSTAL'].AsString;
           Telefono := FieldByName['DIR_TELEFONO01'].AsString;
           Movil := FieldByName['DIR_TELEFONO02'].AsString;
           Email := FieldByName['EMAIL'].AsString;
           Departamento := FieldByName['DEPARTAMENTO'].AsString;
           Observaciones := FieldByName['OBSERVACIONES'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  inherited;

  // IDRIL (GLS)
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACREEDOR FROM IDRIL_CONFIGURACION WHERE EMPRESA = :EMPRESA ORDER BY ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        TransportistaIDRIL := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMAlbaranes.GrabaCabCartaPortes;
  DMAlbaranes.AbrirCartaPortes;

  if (DMAlbaranes.QMCartaPortesTRANSPORTISTA.AsInteger <> TransportistaIDRIL) then
     ShowMessage(_('El transportista no es IDRIL(GLS)'))
  else
  begin
     IdALB := DMAlbaranes.QMCabeceraID_S.AsInteger;
     SuReferencia := DMAlbaranes.QMCabeceraSU_REFERENCIA.AsString;
     TerceroAlb := DMAlbaranes.QMCabeceraTERCERO.AsInteger;
     DireccionAlb := DMAlbaranes.QMCabeceraDIRECCION.AsInteger;
     Bultos := DMAlbaranes.QMCartaPortesBULTOS.AsInteger;
     Peso := DMAlbaranes.QMCartaPortesPESO.AsFloat;

     if (not DMAlbaranes.LotesSimplesAsignados) then
        ShowMessage(_('Falta asignar Nro. Serie / Lote'))
     else
     if (Bultos <= 0) then
        ShowMessage(_('La cantidad de bultos no esta definida'))
     else
     if (Peso <= 0) then
        ShowMessage(_('El peso no esta definido'))
     else
     begin
        AbreData(TDMIDRIL, DMIDRIL);
        try
           if (not FileExists(DMIDRIL.RutaGLS + 'GLS.exe')) then
              ShowMessage(_('No se encuentra ' + DMIDRIL.RutaGLS + 'GLS.exe'))
           else
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT PAIS FROM VER_TERCEROS_DIRECCION_TODAS ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' TERCERO = :TERCERO AND ');
                    SQL.Add(' DIRECCION = :DIRECCION ');
                    Params.ByName['TERCERO'].AsInteger := TerceroAlb;
                    Params.ByName['DIRECCION'].AsInteger := DireccionAlb;
                    ExecQuery;
                    Pais := FieldByName['PAIS'].AsString;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              { TODO : Agregar como campos de GES_CABECERAS_S_CGA }
              // Servicio := Trim(Copy(CBServicio.Text, 1, Pos('-', CBServicio.Text) - 1));
              // Horario := Trim(Copy(CBHorario.Text, 1, Pos('-', CBHorario.Text) - 1));

              if (Pais = 'ESP') then
              begin
                 // Economy - 72 Horas
                 Servicio := '96';  // 96 - BusinessParcel
                 Horario := '18'; // 18 - Economy
              end
              else
              if ((Pais = 'AND') or (Pais = 'PRT')) then
              begin
                 Servicio := '301'; // 301 - Andorra y Portugal
                 Horario := '3'; // 3 - 24 Horas (ASM24)
              end
              else
              begin
                 Servicio := '3074'; // 3074 - Internacional
                 Horario := '98'; // Economy
              end;

              // Crear Peticion GLS e imprimir la etiqueta
              FicheroPeticion := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '.ini';
              FicheroRespuesta := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta.ini';
              FicheroRespuestaSOAPRequest := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta_SOAPRequest.xml';
              FicheroRespuestaSOAPResponse := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta_SOAPResponse.xml';

              DeleteFile(FicheroPeticion);
              DeleteFile(FicheroRespuesta);
              DeleteFile(FicheroRespuestaSOAPRequest);
              DeleteFile(FicheroRespuestaSOAPResponse);

              with TIniFile.Create(FicheroPeticion) do
              begin
                 try
                    WriteString('Peticion', 'Nombre', 'GrabaServicio');

                    WriteString('Servicio', 'Servicio', Servicio);
                    WriteString('Servicio', 'Horario', Horario);
                    WriteInteger('Servicio', 'Bultos', Bultos);
                    WriteFloat('Servicio', 'Peso', Peso);

                    // DameDireccionTercero(REntorno.Tercero, 0, RazonSocial, Nombre, Direccion, Poblacion, Provincia, CodTelefonico, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones);
                    Nombre := DMIDRIL.xIDRILTransportistaREMITENTE_NOMBRE.AsString;
                    Direccion := DMIDRIL.xIDRILTransportistaREMITENTE_DIRECCION.AsString;
                    Poblacion := DMIDRIL.xIDRILTransportistaREMITENTE_POBLACION.AsString;
                    Pais := DMIDRIL.xIDRILTransportistaREMITENTE_PAIS.AsString;
                    CP := DMIDRIL.xIDRILTransportistaREMITENTE_CP.AsString;
                    Telefono := DMIDRIL.xIDRILTransportistaREMITENTE_TELEFONO.AsString;
                    Movil := DMIDRIL.xIDRILTransportistaREMITENTE_MOVIL.AsString;
                    Email := DMIDRIL.xIDRILTransportistaREMITENTE_EMAIL.AsString;
                    Departamento := DMIDRIL.xIDRILTransportistaREMITENTE_DEPARTAMENTO.AsString;
                    Observaciones := DMIDRIL.xIDRILTransportistaREMITENTE_OBSERVACIONES.AsString;

                    WriteString('Remite', 'Nombre', Nombre);
                    WriteString('Remite', 'Direccion', Direccion);
                    WriteString('Remite', 'Poblacion', Poblacion);
                    WriteString('Remite', 'Pais', Pais);
                    WriteString('Remite', 'CP', CP);
                    WriteString('Remite', 'Telefono', Telefono);
                    WriteString('Remite', 'Movil', Movil);
                    WriteString('Remite', 'Email', Email);
                    WriteString('Remite', 'Departamento', Departamento);
                    WriteString('Remite', 'Observaciones', Observaciones);

                    DameDireccionTercero(TerceroAlb, DireccionAlb, RazonSocial, Nombre, Direccion, Poblacion, Provincia, CodTelefonico, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones);

               {
               // Para GLS, si el país es Andorra, se debe poner como España + CP=87111
               // Correo de Daniel Martin (KombatPadel) 27/01/2025 17:50
               if (CodTelefonico = '376') then
               begin
                  CodTelefonico := '34';
                  CP := '87111';
               end;
               }

                    WriteString('Destinatario', 'Nombre', Nombre);
                    WriteString('Destinatario', 'Direccion', Direccion);
                    WriteString('Destinatario', 'Poblacion', Poblacion);
                    WriteString('Destinatario', 'Pais', Pais_C2);
                    WriteString('Destinatario', 'CP', CP);
                    WriteString('Destinatario', 'Telefono', Telefono);
                    WriteString('Destinatario', 'Movil', Movil);
                    WriteString('Destinatario', 'Email', Email);
                    WriteString('Destinatario', 'Departamento', Departamento);
                    WriteString('Destinatario', 'Observaciones', Observaciones);
                    WriteString('Destinatario', 'ATT', '');

                    WriteString('Referencia', 'Tipo0', '');
                    WriteInteger('Referencia', 'TipoC', IdALB);
                    WriteString('Referencia', 'TipoG', '');
                    WriteString('Referencia', 'TipoN', '');

                  {
                  WriteString('Seguro', 'Tipo', '');
                  WriteString('Seguro', 'Descripcion', '');
                  WriteString('Seguro', 'Importe', 0);
                  }

                    WriteString('DevuelveAdicionales', 'TipoEtiqueta', 'PDF');

                  {
                  for i := 1 to bultos do
                     WriteString(format('DetalleBultos%d', [i]), 'Kilos', 0);
                     ...
                  }

                    with DMAlbaranes.QMDetalle do
                    begin
                       First;
                       i := 0;
                       while not EOF do
                       begin
                          if (FieldByName('CONTROL_STOCK').AsInteger = 1) then
                          begin
                             Inc(i);

                             WriteString(format('DescMercancia%d', [i]), 'Id', FieldByName('ID_A').AsString);
                             WriteString(format('DescMercancia%d', [i]), 'Referencia', FieldByName('ARTICULO').AsString);
                             WriteString(format('DescMercancia%d', [i]), 'Nombre', DameEAN13Articulo(FieldByName('ARTICULO').AsString));
                             WriteString(format('DescMercancia%d', [i]), 'CodigoArencelario', DameCodigoArancelario(FieldByName('ARTICULO').AsString));
                             WriteString(format('DescMercancia%d', [i]), 'DescripcionCorta', FieldByName('TITULO').AsString);
                             WriteString(format('DescMercancia%d', [i]), 'DescripcionLarga', FieldByName('TITULO').AsString);
                             WriteString(format('DescMercancia%d', [i]), 'Unidades', FieldByName('UNIDADES').AsString);
                             WriteString(format('DescMercancia%d', [i]), 'Precio', FloatToStrDec(DMMain.DamePrecioTarifaBasiImponible(DMAlbaranes.QMCabeceraTARIFA.AsString, FieldByName('ARTICULO').AsString), '.'));
                             WriteString(format('DescMercancia%d', [i]), 'Impuestos', FloatToStrDec(FieldByName('P_IVA').AsFloat, '.'));
                             WriteString(format('DescMercancia%d', [i]), 'Peso', FloatToStrDec(FieldByName('PESO_REAL').AsFloat, '.'));
                             WriteString(format('DescMercancia%d', [i]), 'Volumen', FloatToStrDec(0, '.'));
                             WriteString(format('DescMercancia%d', [i]), 'PaisFabricacion', 'ES');
                             WriteString(format('DescMercancia%d', [i]), 'Unidad', 'PCS');
                             WriteString(format('DescMercancia%d', [i]), 'Descuento', FloatToStrDec(FieldByName('DESCUENTO').AsFloat, '.'));
                          end;
                          Next;
                       end;
                    end;
                 finally
                    Free;
                 end;
              end;
              Sleep(500);

              HoraEnvioFichero := Now;
              if FileExists(FicheroPeticion) then
              begin
                 AbreData(TDMAdjunto, DMAdjunto);
                 DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroPeticion, Format(_('Fichero Pedicion GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                 CierraData(DMAdjunto);
              end;

              // Se utiliza cadena vacía en vez de 'open' porque algunas aplicaciones no tienen esta accion.
              Resultado := ShellExecute(Application.Handle, '' {'open'}, PChar(DMIDRIL.RutaGLS + 'GLS.exe'), PChar(FicheroPeticion), nil, SW_SHOW);
              // Resultado <= 32 es un error
              case Resultado of
                 0:
                    ShowMessage(_('El sistema operativo no tiene memoria o recursos suficiente.')); // The operating system is out of memory or resources
                 ERROR_BAD_FORMAT {11}:
                    ShowMessage(_('El archivo EXE es inválido.')); // The .EXE file is invalid (non-Win32 .EXE or error in .EXE image)
                 SE_ERR_ACCESSDENIED{5}:
                    ShowMessage(_('El sistema operativo denego el acceso al archivo especificado.')); // The operating system denied access to the specified file
                 SE_ERR_ASSOCINCOMPLETE{27}:
                    ShowMessage(_('El archivo asociado es incompatible o inválido.')); //The filename association is incomplete or invalid
                 SE_ERR_DDEBUSY{30}:
                    ShowMessage(_('La transacción DDE no pudo completarse porque otra transaccion DDE estaba siendo procesada.')); // The DDE transaction could not be completed because other DDE transactions were being processed
                 SE_ERR_DDEFAIL{29}:
                    ShowMessage(_('La transacción DDE falló.')); // The DDE transaction failed
                 SE_ERR_DDETIMEOUT{28}:
                    ShowMessage(_('La transacción DDE no pudo completarse porque ha expirado.')); // The DDE transaction could not be completed because the request timed out
                 SE_ERR_DLLNOTFOUND{32}:
                    ShowMessage(_('La librería dinamica especificada no se ha encontrado.')); // The specified dynamic-link library was not found
                 SE_ERR_FNF{2}:
                    ShowMessage(_('El archivo no ha sido encontrado.')); //The specified file was not found
                 SE_ERR_NOASSOC{31}:
                    ShowMessage(_('No hay ninguna aplicación asociada con la extensión del archivo dado.')); // There is no application associated with the given filename extension
                 SE_ERR_OOM{8}:
                    ShowMessage(_('No ha habido memoria suficiente para completar la operación.')); // There was not enough memory to complete the operation
                 SE_ERR_PNF{3}:
                    ShowMessage(_('No se ha encontrado la carpeta especificada.')); // The specified path was not found
                 SE_ERR_SHARE{26}:
                    ShowMessage(_('Error de permisos.')); // A sharing violation occurred
              end;

              // Espero al fichero de respuesta
              HoraEnvioFichero := Now;
              while ((Resultado > 32) and (not FileExists(FicheroRespuesta)) and (SecondsBetween(Now, HoraEnvioFichero) < 30)) do
              begin
                 Sleep(500);
              end;
              Sleep(500);

              if FileExists(FicheroRespuesta) then
              begin
                 AbreData(TDMAdjunto, DMAdjunto);
                 DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuesta, Format(_('Fichero Respuesta GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                 CierraData(DMAdjunto);
              end;

              if FileExists(FicheroRespuestaSOAPRequest) then
              begin
                 AbreData(TDMAdjunto, DMAdjunto);
                 DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuestaSOAPRequest, Format(_('Fichero SOAP Request GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                 CierraData(DMAdjunto);
              end;

              if FileExists(FicheroRespuestaSOAPResponse) then
              begin
                 AbreData(TDMAdjunto, DMAdjunto);
                 DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuestaSOAPResponse, Format(_('Fichero SOAP Response GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                 CierraData(DMAdjunto);
              end;

              Expedicion := '';
              if FileExists(FicheroRespuesta) then
              begin
                 with TIniFile.Create(FicheroRespuesta) do
                 begin
                    try
                 {
                 [Envio]
                 CodBarras=51160860102019
                 codexp=7081933296
                 Resultado=0
                 [Referencias]
                 0=
                 C=3964
                 [Etiquetas]
                 Fichero1=C:\Users\Usuario\AppData\Local\Temp\Merge\Etiqueta1.PDF
                 [Observaciones]
                 Observaciones=
                 }
                       Expedicion := ReadString('Envio', 'codexp', '');
                       FicheroEtiqueta := ReadString('Etiquetas', 'Fichero1', '');
                       ResultadoEnvio := ReadString('Envio', 'Resultado', '');

                       sl := TStringList.Create;
                       try
                          ReadSection('RespuestaError', sl);
                          if (sl.Count > 0) then
                          begin
                             RespuestaError := '';
                             for i := 0 to sl.Count - 1 do
                                RespuestaError := RespuestaError + ReadString('RespuestaError', sl[i], '') + #13#10;

                             ShowMessage(_('Error al hacer la peticion GLS.') + #13#10 + #13#10 + RespuestaError);
                          end
                          else
                          if (ResultadoEnvio <> '0') then
                          begin
                             ShowMessage(_('Error al hacer la peticion GLS.') + #13#10 + #13#10 + ResultadoEnvio);
                          end
                          else
                          begin
                             if FileExists(FicheroEtiqueta) then
                             begin
                                // Guardo el etiqueta como adjunto.
                                AbreData(TDMAdjunto, DMAdjunto);
                                DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroEtiqueta, Format(_('Etiqueta Expedicion GLS %s'), [Expedicion]));
                                CierraData(DMAdjunto);

                                try
                                   // C:\Delfos\SumatraPDF.exe -print-to "Microsoft Print to PDF" "C:\Temp\Etiq-Int-001.pdf"
                                   Comando := format('%sSumatraPDF.exe', [REntorno.DirectorioSumatraPDF]);
                                   Argumentos := format('-print-to "%s" "%s"', [REntorno.NombreEtiquetasCompleto, FicheroEtiqueta]);
                                   RunAndWait(FMain.Handle, Comando, Argumentos, PChar(DameTempPath), SW_SHOWNORMAL, False);
                                except
                                   on e: Exception do
                                      ShowMessage(E.Message);
                                end;

                                if (DMIDRIL.RutaCopiaEtiqueta > '') then
                                begin
                                   try
                                      CopyFileTo(FicheroEtiqueta, DMIDRIL.RutaCopiaEtiqueta + ExtractFileName(FicheroEtiqueta));
                                   except
                                      on E: Exception do
                                         ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                            _('Orig: ') + FicheroEtiqueta + #13#10 +
                                            _('Dest: ') + DMIDRIL.RutaCopiaEtiqueta + ExtractFileName(FicheroEtiqueta) + #13#10 +
                                            E.Message);
                                   end;

                                   try
                                      CopyFileTo(FicheroEtiqueta, DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [Expedicion]));
                                   except
                                      on E: Exception do
                                         ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                            _('Orig: ') + FicheroEtiqueta + #13#10 +
                                            _('Dest: ') + DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [Expedicion]) + #13#10 +
                                            E.Message);
                                   end;

                                   try
                                      CopyFileTo(FicheroEtiqueta, DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [SuReferencia]));
                                   except
                                      on E: Exception do
                                         ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                            _('Orig: ') + FicheroEtiqueta + #13#10 +
                                            _('Dest: ') + DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [SuReferencia]) + #13#10 +
                                            E.Message);
                                   end;
                                end;

                                try
                                   CopyFileTo(FicheroEtiqueta, ChangeFileExt(FicheroEtiqueta, format('-%s.pdf', [Expedicion])));
                                   DeleteFile(FicheroEtiqueta);
                                except
                                   on E: Exception do
                                      ShowMessage(_('Error renombrando etiquetar') + #13#10 +
                                         _('Orig: ') + FicheroEtiqueta + #13#10 +
                                         _('Dest: ') + ChangeFileExt(FicheroEtiqueta, format('-%s.pdf', [Expedicion])) + #13#10 +
                                         E.Message);
                                end;
                             end;
                          end;
                       finally
                          sl.Free;
                       end;
                    finally
                       Free;
                    end;
                 end;
              end;
           end;
        finally
           CierraData(DMIDRIL);
        end;

        try
           DMMain.GrabaExpedicion(IdALB, Bultos, Peso, Expedicion, 'GLS', Today, StrToIntDef(DBEFTransportistaCartaPorte.Text, 0));
        except
           on E: Exception do
              ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
        end;
     end;
  end;
end;

procedure TFMAlbaranes.APeticionRecogidaDHLExecute(Sender: TObject);
var
  DHL_ProductCode : string;
  DHL_LocalProductCode : string;
  Pais : string;
  i, TerceroAlb, DireccionAlb : integer;
  IdALB, Bultos : integer;
  SuReferencia : string;
  Peso : double;
  Expedicion : string;
  TransportistaDHL : integer;
  Length, Height, Width, weight : integer;
  destinationCountryCode : string;
  destinationPostalCode : string;
  destinationCityName : string;
  PerteneceCEE : boolean;
  RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF : string;
  isCustomsDeclarable : boolean;
  registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode : string;
  Cliente : integer;
  incoterm : string;
  manufacturerCountry : string;
  InvoiceNumber : string;
  InvoiceDate : TDateTime;
  Ficheros : TStrings;
  Comando, Argumentos : string;
  Resultado : word;
  shipmentCode : string;
  RutaCopiaEtiqueta : string;
  Precio : double;
  CodigoIntra : string;
  NetValue : double;
  GrossValue : double;
  declaredValue : double;

  procedure DameDireccionTercero(Tercero, DirNumnero: integer; var RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF: string);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT T.TERCERO, D.DIRECCION, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_COMPLETA, D.DIR_NOMBRE_2, D.DIR_NOMBRE_3, LO.TITULO LOCALIDAD, ');
           SQL.Add('        PR.TITULO PROVINCIA, PA.CODIGO_TEL, LO.CODIGO_POSTAL, D.DIR_TELEFONO01, D.DIR_TELEFONO02, T.EMAIL, ');
           SQL.Add('        CAST('''' AS VARCHAR(50)) DEPARTAMENTO, CAST('''' AS VARCHAR(80)) OBSERVACIONES, PA.PAIS_C2, PT.PAIS_C2 PAIS_C2_TERCERO, T.NIF ');
           SQL.Add(' FROM SYS_TERCEROS T ');
           SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
           SQL.Add(' JOIN SYS_LOCALIDADES LO ON D.ID_LOCAL = LO.ID_LOCAL ');
           SQL.Add(' JOIN SYS_PROVINCIAS PR ON LO.PROVINCIA = PR.PROVINCIA AND LO.PAIS = PR.PAIS ');
           SQL.Add(' JOIN SYS_PAISES PA ON LO.PAIS = PA.PAIS ');
           SQL.Add(' JOIN SYS_PAISES PT ON T.PAIS_TERCERO = PT.PAIS ');
           SQL.Add(' WHERE ');
           SQL.Add(' T.TERCERO = :TERCERO AND ');
           if (DirNumnero <> 0) then
              SQL.Add(' D.DIRECCION = :DIRECCION ')
           else
              SQL.Add(' D.DIR_DEFECTO = 1 ');

           Params.ByName['TERCERO'].AsInteger := Tercero;
           if (DirNumnero <> 0) then
              Params.ByName['DIRECCION'].AsInteger := DirNumnero;
           ExecQuery;
           RazonSocial := FieldByName['NOMBRE_R_SOCIAL'].AsString;
           Nombre := FieldByName['NOMBRE_COMERCIAL'].AsString;
           Direccion := Trim(FieldByName['DIR_COMPLETA'].AsString);
           Poblacion := FieldByName['LOCALIDAD'].AsString;
           Provincia := FieldByName['PROVINCIA'].AsString;
           Pais := FieldByName['CODIGO_TEL'].AsString;
           Pais_C2 := FieldByName['PAIS_C2'].AsString;
           CP := FieldByName['CODIGO_POSTAL'].AsString;
           Telefono := FieldByName['DIR_TELEFONO01'].AsString;
           Movil := FieldByName['DIR_TELEFONO02'].AsString;
           Email := FieldByName['EMAIL'].AsString;
           Departamento := FieldByName['DEPARTAMENTO'].AsString;
           Observaciones := FieldByName['OBSERVACIONES'].AsString;
           PaisC2Tercero := FieldByName['PAIS_C2_TERCERO'].AsString;
           NIF := FieldByName['NIF'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  inherited;
  // DHL
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACREEDOR FROM DHL_CONFIGURACION WHERE EMPRESA = :EMPRESA ORDER BY ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        TransportistaDHL := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RutaCopiaEtiqueta := IncludeTrailingPathDelimiter(LeeDatoIni('DHL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));

  IdALB := DMAlbaranes.QMCabeceraID_S.AsInteger;
  SuReferencia := DMAlbaranes.QMCabeceraSU_REFERENCIA.AsString;
  TerceroAlb := DMAlbaranes.QMCabeceraTERCERO.AsInteger;
  DireccionAlb := DMAlbaranes.QMCabeceraDIRECCION.AsInteger;
  Bultos := DMAlbaranes.QMCartaPortesBULTOS.AsInteger;
  Peso := DMAlbaranes.QMCartaPortesPESO.AsFloat;

  weight := Trunc(DMAlbaranes.QMCartaPortesPESO.AsFloat);
  if (weight <= 0) then
     weight := 1;
  Length := 1;
  Height := 1;
  Width := 1;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P.PAIS, P.PAIS_C2, P.PERTENECE_CEE, L.CODIGO_POSTAL, L.TITULO ');
        SQL.Add(' FROM SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add(' JOIN SYS_PAISES P ON P.PAIS = D.PAIS_DIRECCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' TERCERO = :TERCERO AND ');
        SQL.Add(' DIRECCION = :DIRECCION ');
        Params.ByName['TERCERO'].AsInteger := TerceroAlb;
        Params.ByName['DIRECCION'].AsInteger := DireccionAlb;
        ExecQuery;
        destinationCountryCode := FieldByName['PAIS_C2'].AsString;
        PerteneceCEE := (FieldByName['PERTENECE_CEE'].AsInteger = 1);
        if (destinationCountryCode = 'ES') then
           PerteneceCEE := False;
        destinationPostalCode := FieldByName['CODIGO_POSTAL'].AsString;
        destinationCityName := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  isCustomsDeclarable := ((not PerteneceCEE) and (destinationCountryCode <> 'ES'));

  // DHL - Productos normales.
  // KOMBATPADEL solo tiene algunos (U, P y N)
  {
  Nombre comercial      | Ámbito                                    | Trafico   | Campo "isCustomsDeclarable" | productCode | Nombre abreviado
  DHL EXPRESS WORLDWIDE | Fuera del país de origen, dentro de la UE | Aéreo     | FALSE                       | U           | ECX
  ECONOMY SELECT        | Fuera del país de origen, dentro de la UE | Carretera | FALSE                       | W           | ESU
  DHL EXPRESS WORLDWIDE | Fuera del país de origen, fuera de la UE  | Aéreo     | TRUE                        | P           | WPX
  ECONOMY SELECT        | Fuera del país de origen, fuera de la UE  | Carretera | TRUE                        | H           | ESI
  DOMESTIC EXPRESS      | Dentro del mismo pais                     | N/A       | FALSE                       | N           | DOM
  }
  AbreData(TDMDHL, DMDHL);
  try
     DMDHL.WS_Inicializa(TransportistaDHL, False);

     DMDHL.rates(DHL_ProductCode, DHL_LocalProductCode,
        destinationCountryCode,
        destinationPostalCode,
        destinationCityName,
        weight,
        Length,
        Height,
        Width,
        Now,
        isCustomsDeclarable);
  finally
     CierraData(DMDHL);
  end;

  DameDireccionTercero(TerceroAlb, DireccionAlb, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF);

  AbreData(TDMDHL, DMDHL);
  try
     DMDHL.WS_Inicializa(TransportistaDHL, False);

     DMDHL.NuevoEnvio(DHL_ProductCode, DHL_LocalProductCode, False, IntToStr(IdALB));
     DMDHL.NuevoOutputImages('label', '', False);

     if isCustomsDeclarable then
        DMDHL.NuevoOutputImages('invoice', '', True);

     // DHL nos dirá que poner aquí.
     // DMDHL.NuevoValueAddedServices('II', 10, 'USD');

      {
      DMDHL.customerDetails_shipperDetails('526238', 'Zhaoqing', 'CN', '', '4FENQU, 2HAOKU, WEIPINHUI WULIU YUAN, DAWANG', 'GAOXIN QU, BEIJIANG DADAO, SIHUI,', 'ZHAOQING, GUANDONG', 'SIHUI', '', 'CHINA, PEOPLES REPUBLIC',
         'shipper_create_shipmentapi@dhltestmail.com', '18211309039', '18211309039', 'Cider BookStore', 'LiuWeiMing',
         'SDT', 'CN123456789', 'CN',
         'Bank of China', 'RMB', 'USD', 'business');
      }
     // Rellena los datos de Shipper automaticamente con los del formulario de configuracion
     DMDHL.customerDetails_shipperDetails_auto;

      {
      DMDHL.customerDetails_receiverDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode: string);
      DMDHL.customerDetails_receiverDetails('76449', 'Graford', 'US', '', '116 Marine Dr', '', '', '', '', 'UNITED STATES OF AMERICA',
         'recipient_create_shipmentapi@dhltestmail.com', '9402825665', '9402825666', 'Baylee Marshall', 'Baylee Marshall',
         'SSN', 'US123456789', 'US',
         'Bank of America', 'USD', 'USD', 'business');
      }
     registrationNumber_typeCode := 'VAT';
     registrationNumber_number := NIF;
     registrationNumber_issuerCountryCode := PaisC2Tercero;
     DMDHL.customerDetails_receiverDetails(CP, Poblacion, Pais_C2, '', Direccion, '', '', '', Provincia, DameTituloPais(DamePais(Pais_C2)), Email, Telefono, Movil, RazonSocial, RazonSocial, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, '', '', '', 'private');

      {
      DMDHL.Contenido(isCustomsDeclarable: boolean; declaredValue: double; declaredValueCurrency, description, USFilingTypeValue, incoterm, unitOfMeasurement: string);
      DMDHL.Contenido(True, 120, 'USD', 'Shipment', '12345', 'DAP', 'metric');
      }
     DMAlbaranes.DameDatosCliente(DMAlbaranes.QMCabeceraCLIENTE.AsInteger, incoterm);
     declaredValue := DMAlbaranes.QMCabeceraBRUTO.AsFloat;
     if (declaredValue = 0) then
        declaredValue := 0.01;
     DMDHL.Contenido(isCustomsDeclarable, declaredValue, DMAlbaranes.QMCabeceraMONEDA.AsString, 'Shipment', '', incoterm, '');

      {
      DMDHL.NuevoPaquete(typeCode: string; weight, Length, Width, Height: double; customerReference_value, customerReference_typeCode, description, labelDescription: string);
      DMDHL.NuevoPaquete('2BP', 0.5, 1, 1, 1, '3654673', 'CU', 'Piece content description', 'bespoke label description');
      }
     for i := 1 to Bultos do
        DMDHL.NuevoPaquete('', Peso, 1, 1, 1, format('Bulto_%d_%d', [IdALB, i]), '', format('Bulto %d_%d', [IdALB, i]), '');

     if isCustomsDeclarable then
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT * FROM VER_DETALLE_ALBARAN_LST ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' ID_S = :ID_S ');
                 SelectSQL.Add(' ORDER BY ORDEN ');
                 Params.ByName['ID_S'].AsInteger := IdALB;
                 Open;

                 First;
                 i := 0;
                 while not EOF do
                 begin
                    if (FieldByName('CONTROL_STOCK').AsInteger = 1) then
                    begin
                       Inc(i);

                        {
                        DMDHL.NuevoexportDeclarationlineItems(number: integer; description: string; price, quantity_value: double; quantity_unitOfMeasurement, commodity_typeCode1, commodity_value1, commodity_typeCode2, commodity_value2, exportReasonType, manufacturerCountry, exportControlClassificationNumber: string; netValue, grossValue: double; isTaxesPaid: boolean; line_additionalInformation, customerReference_typeCode1, customerReference_value1, customerReference_typeCode2, customerReference_value2, customsDocument_typeCode1, customsDocument_value1: string);
                        DMDHL.NuevoexportDeclarationlineItems(1, 'Harry Steward biography first edition', 15, 4, 'GM',
                           'outbound', '84713000', 'inbound', '5109101110', 'permanent', 'US', 'US123456789',
                           0.1, 0.7, True, '450pages',
                           'AFE', '1299210', '', '', 'COO', 'MyDHLAPI - LN#1-CUSDOC-001');
                        }
                       {TODO: PARAMETRIZAR u Obtener de fabricante - Esto es para KombatPadel}
                       manufacturerCountry := 'CN';
                       if (FieldByName('FAMILIA').AsString = '3') then
                          manufacturerCountry := 'ES';

                       CodigoIntra := FieldByName('CODIGO_INTRA').AsString;
                       if (Trim(CodigoIntra) = '') then
                          CodigoIntra := '00000000';
                       Precio := FieldByName('PRECIO').AsFloat;
                       if (Precio = 0) then
                          Precio := 0.01;
                       NetValue := FieldByName('PESO_REAL').AsFloat;
                       if (NetValue = 0) then
                          NetValue := 0.01;
                       GrossValue := FieldByName('PESO_REAL').AsFloat;
                       if (GrossValue = 0) then
                          GrossValue := 0.01;

                       DMDHL.NuevoexportDeclarationlineItems(i, FieldByName('TITULO').AsString, Precio, FieldByName('UNIDADES').AsFloat, 'PCS', 'outbound', CodigoIntra, '', '', '',
                          manufacturerCountry, '', NetValue, GrossValue, (FieldByName('P_IVA').AsFloat <> 0),
                          '', '', '', '', '',
                          '', '');
                    end;
                    Next;
                 end;

                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;

          {
          DMDHL.exportDeclarationInvoice(number: string; InvoiceDate: TDateTime; invoice_instruction: string; totalNetWeight, totalGrossWeight: double; termsOfPayment: string; importCustomsDutyValue, importTaxesValue: double; customerReference_typeCode1: string = ''; customerReference_value1: string = ''; customerReference_typeCode2: string = ''; customerReference_value2: string = ''; customerReference_typeCode3: string = ''; customerReference_value3: string = '');
          }
        {TODO : Ver de donde sacamos esto porque en este punto todavia no hay factura}
        InvoiceNumber := IntToStr(IdALB);
        InvoiceDate := Today;
        DMDHL.exportDeclarationInvoice(InvoiceNumber, InvoiceDate, '', 0, 0, '', 0, 0,
           '', '',
           '', '',
           '', '');
     end;

      {
      DMDHL.NuevoexportDeclarationRemarks(Value: string);
      DMDHL.NuevoexportDeclarationRemarks('Right side up only');
      }

      {
      DMDHL.NuevoexportDeclarationAdditionalCharges(Value: double; Caption, typeCode: string);
      DMDHL.NuevoexportDeclarationAdditionalCharges(10, 'fee', 'freight');
      }

      {
      DMDHL.exportDeclarationline(destinationPortName, placeOfIncoterm, payerVATNumber, recipientReference, exporter_id, exporter_code, packageMarks, declarationNote_value, exportReference, exportReason, exportReasonType, license_typeCode, license_value, shipmentType, customsDocument_typeCode, customsDocument_value: string);
      DMDHL.exportDeclarationline('New York Port', 'ShenZhen Port', '12345ED', '01291344', '121233', 'S', 'Fragile glass bottle',
         'up to three declaration notes', 'export reference', 'export reason', 'permanent', 'export', '123127233', 'personal', 'INV', 'MyDHLAPI - CUSDOC-001');
      }

      {
      DMDHL.NuevoshipmentNotification(typeCode, receiverId, languageCode, languageCountryCode, bespokeMessage: string);
      DMDHL.NuevoshipmentNotification('email', 'shipmentnotification@mydhlapisample.com', 'eng', 'UK', 'message to be included in the notification');
      }

      {
      DMDHL.getTransliteratedResponse(Value: boolean);
      DMDHL.getTransliteratedResponse(False);
      }

      {
      DMDHL.estimatedDeliveryDate(isRequested: boolean; typeCode: string);
      DMDHL.estimatedDeliveryDate(True, 'QDDC');
      }

      {
      DMDHL.NuevogetAdditionalInformation(isRequested: boolean; typeCode: string);
      DMDHL.NuevogetAdditionalInformation(True, 'pickupDetails');
      }

     Ficheros := TStringList.Create;
     try
        try
           Resultado := DMDHL.Enviar(shipmentCode, Ficheros);
           if (Resultado in [200, 201]) and (shipmentCode > '') then
           begin
              DMMain.Log('shipmentTrackingNumber: ' + shipmentCode);

              AbreData(TDMAdjunto, DMAdjunto);
              DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Body_%s.log', [IntToStr(IdALB)]), 'DHL - ' + _('Peticion envio'));
              DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Respuesta_%d_%s.log', [Resultado, IntToStr(IdALB)]), 'DHL - ' + _('Respuesta Peticion envio') + ' = ' + IntToStr(Resultado));
              CierraData(DMAdjunto);

              for i := 0 to Ficheros.Count - 1 do
              begin
                 DMMain.Log('Etiqueta: ' + Ficheros[i]);

                 // Guardo la etiqueta como adjunto.
                 AbreData(TDMAdjunto, DMAdjunto);
                 if Pos('label', Ficheros[i]) = 0 then
                    DMAdjunto.CreaAdjunto('ALB', IdALB, Ficheros[i], Format(_('Etiqueta Expedicion DHL %s / %d'), [shipmentCode, i]))
                 else
                    DMAdjunto.CreaAdjunto('ALB', IdALB, Ficheros[i], Format(_('Fichero Expedicion DHL %s / %d'), [shipmentCode, i]));
                 CierraData(DMAdjunto);

                 // Solo imprimimos los tipo "label"
                 if Pos('label', Ficheros[i]) = 0 then
                 begin

                    if (RutaCopiaEtiqueta > '') then
                    begin
                       try
                          CopyFileTo(Ficheros[i], RutaCopiaEtiqueta + ExtractFileName(Ficheros[i]));
                       except
                          on E: Exception do
                             ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                _('Orig: ') + Ficheros[i] + #13#10 +
                                _('Dest: ') + RutaCopiaEtiqueta + ExtractFileName(Ficheros[i]) + #13#10 +
                                E.Message);
                       end;
                    end;
                 end;
              end;

              // Imprimir las estiquetas mediante SumatraPDF
              for i := 0 to Ficheros.Count - 1 do
              begin
                 // C:\Delfos\SumatraPDF.exe -print-to "Microsoft Print to PDF" "C:\Temp\Etiq-Int-001.pdf"
                 Comando := format('%sSumatraPDF.exe', [REntorno.DirectorioSumatraPDF]);
                 Argumentos := format('-print-to "%s" "%s"', [REntorno.NombreEtiquetasCompleto, Ficheros[i]]);
                 RunAndWait(FMain.Handle, Comando, Argumentos, PChar(DameTempPath), SW_SHOWNORMAL, False);
              end;

              try
                 DMMain.GrabaExpedicion(IdALB, Bultos, Peso, shipmentCode, 'DHL', Today, TransportistaDHL);
              except
                 on E: Exception do
                    ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
              end;
           end
           else
           begin
              AbreData(TDMAdjunto, DMAdjunto);
              DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Body_%s.log', [IntToStr(IdALB)]), 'DHL - ' + _('Peticion envio'));
              DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Respuesta_%d_%s.log', [Resultado, IntToStr(IdALB)]), 'DHL - ' + _('Respuesta Peticion envio') + ' = ' + IntToStr(Resultado));
              CierraData(DMAdjunto);

              ShowMessage(_('No se ha podido enviar peticion a DHL') + #13#10 + shipmentCode);
           end;
        finally
           Ficheros.Free;
        end;
     except
        on e: Exception do
        begin
           DMMain.Log(_('No se ha podido enviar peticion a DHL') + #13#10 + e.message);
           ShowMessage(_('No se ha podido enviar peticion a DHL') + #13#10 + e.message);
        end;
     end;
  finally
     CierraData(DMDHL);
  end;
end;

procedure TFMAlbaranes.ADHLRatesExecute(Sender: TObject);
var
  productCode : string;
  localProductCode : string;
  TransportistaDHL : integer;
  TerceroAlb, DireccionAlb : integer;
  Length, Height, Width, weight : integer;
  destinationCountryCode : string;
  destinationPostalCode : string;
  destinationCityName : string;
  isCustomsDeclarable : boolean;
  PerteneceCEE : boolean;
begin
  inherited;
  // DHL
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACREEDOR FROM DHL_CONFIGURACION WHERE EMPRESA = :EMPRESA ORDER BY ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        TransportistaDHL := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  TerceroAlb := DMAlbaranes.QMCabeceraTERCERO.AsInteger;
  DireccionAlb := DMAlbaranes.QMCabeceraDIRECCION.AsInteger;
  weight := Trunc(DMAlbaranes.QMCartaPortesPESO.AsFloat);
  if (weight <= 0) then
     weight := 1;
  Length := 1;
  Height := 1;
  Width := 1;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P.PAIS, P.PAIS_C2, P.PERTENECE_CEE, L.CODIGO_POSTAL, L.TITULO ');
        SQL.Add(' FROM SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add(' JOIN SYS_PAISES P ON P.PAIS = D.PAIS_DIRECCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' TERCERO = :TERCERO AND ');
        SQL.Add(' DIRECCION = :DIRECCION ');
        Params.ByName['TERCERO'].AsInteger := TerceroAlb;
        Params.ByName['DIRECCION'].AsInteger := DireccionAlb;
        ExecQuery;
        destinationCountryCode := FieldByName['PAIS_C2'].AsString;
        PerteneceCEE := (FieldByName['PERTENECE_CEE'].AsInteger = 1);
        if (destinationCountryCode = 'ES') then
           PerteneceCEE := False;
        destinationPostalCode := FieldByName['CODIGO_POSTAL'].AsString;
        destinationCityName := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  isCustomsDeclarable := ((not PerteneceCEE) and (destinationCountryCode <> 'ES'));

  AbreData(TDMDHL, DMDHL);
  try
     DMDHL.WS_Inicializa(TransportistaDHL, False);

     DMDHL.rates(productCode, localProductCode,
        destinationCountryCode,
        destinationPostalCode,
        destinationCityName,
        weight,
        Length,
        Height,
        Width,
        Now,
        isCustomsDeclarable);
  finally
     CierraData(DMDHL);
  end;

  ShowMessage(format('Product Code: %s - Local Product Code: %s', [productCode, localProductCode]));
end;

end.
