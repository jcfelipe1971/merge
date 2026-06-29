unit UFMFacturas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada, DB, Urecursos,
  ActnList, UFormGest, Variants, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, ULFEdit, HYFIBQuery,
  DbComboBoxValue, idGlobalProtocols, ULFDBDateEdit, ULFMemo, ULFComboBox,
  UFPEditDetalle, ULFDBComboBoxValue, ULFFIBDBEditFind;

type
  TFMFacturas = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PCabNotas: TLFPanel;
     PEdCabecera: TLFPanel;
     LFactura: TLFLabel;
     DBERIG: TLFDbedit;
     LEstado: TLFLabel;
     LFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     LCliente: TLFLabel;
     EFCliente: TLFDBEditFind2000;
     DBETituloCliente: TLFDbedit;
     EFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     EFAgente: TLFDBEditFind2000;
     ETituloAgente: TLFEdit;
     LDireccion: TLFLabel;
     LAgente: TLFLabel;
     EFTransportista: TLFDBEditFind2000;
     ETituloTransportistaFac: TLFEdit;
     LTransportista: TLFLabel;
     PEdNotas: TLFPanel;
     DBEDtoPP: TLFDbedit;
     LDtoPP: TLFLabel;
     PNLCabNotas: TLFPanel;
     DBENotasFechaCab: TLFDbedit;
     LNotasFecha: TLFLabel;
     DBENotasSuReferenciaCab: TLFDbedit;
     LNotasReferencia: TLFLabel;
     DBENotasClienteTituloCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     DBEDtoCial: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LDescuentoComercial: TLFLabel;
     DBEFAlmacen: TLFDBEditFind2000;
     ETituloAlmacen: TLFEdit;
     LAlmacen: TLFLabel;
     DBCBForzarVencimientos: TLFDBCheckBox;
     DBEFFormaPago: TLFDBEditFind2000;
     ETituloFormaPago: TLFEdit;
     LFormaPago: TLFLabel;
     DBCBDevolucion: TLFDBCheckBox;
     DBERic: TLFDbedit;
     LNumeroAsiento: TLFLabel;
     DBCHKAbono: TLFDBCheckBox;
     ALFacturas: TLFActionList;
     ANotasDetalle: TAction;
     AInfoStocks: TAction;
     AProcedencia: TAction;
     LblRegistroIVA: TLFLabel;
     DBERegistroIVA: TLFDbedit;
     AImprime: TAction;
     AUnidadesExt: TAction;
     APreciosTarifa: TAction;
     AInfoHistorico: TAction;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PPieGenerico: TLFPanel;
     LPieBultos: TLFLabel;
     LPieBaseImponible: TLFLabel;
     LPieIVARec: TLFLabel;
     LPieLiquido: TLFLabel;
     LPieTotal: TLFLabel;
     DBEBultos: TLFDbedit;
     DBES_BaseImponible: TLFDbedit;
     DBELiquido: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBETotalaCobrar: TLFDbedit;
     TSPieRetCom: TTabSheet;
     PPieRetenciones: TLFPanel;
     LPieBaseRetencion: TLFLabel;
     LPieImporteRetencion: TLFLabel;
     LpieBaseComision: TLFLabel;
     LPieImporteComision: TLFLabel;
     DBEBaseRetencionFac: TLFDbedit;
     DBEI_RetencionFac: TLFDbedit;
     DBEBaseComision: TLFDbedit;
     DBEImp_Comision: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PPieComisiones: TLFPanel;
     LPieBaseDescuentoLinea: TLFLabel;
     LPieImporte: TLFLabel;
     LPieImporteFinanciacion: TLFLabel;
     LPieImporteBase: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     DBESumaBases: TLFDbedit;
     ToolButton1: TToolButton;
     TButtNotas: TToolButton;
     TButtInfStocks: TToolButton;
     TButtProcedencia: TToolButton;
     TButtUnidadesExt: TToolButton;
     TButtPrecios: TToolButton;
     TButtInfoHistorico: TToolButton;
     TSepBuscaFolio: TToolButton;
     TButtImprimeFactura: TToolButton;
     ToolButton3: TToolButton;
     TBCambiarNombre: TToolButton;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtAbreCierra: TToolButton;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     TButtSerializacion: TToolButton;
     ASerializacion: TAction;
     ToolButton8: TToolButton;
     TButtBuscarNumSerie: TToolButton;
     ABuscarNumSerie: TAction;
     APVP: TAction;
     ANIFFactura: TAction;
     DBETituloEstado: TLFDbedit;
     ARegistroIVA: TAction;
     SBVerRegistro: TSpeedButton;
     SBVerAsientos: TSpeedButton;
     AAsientoFactura: TAction;
     ANewCliente: TAction;
     ANewAgente: TAction;
     ANewArticulo: TAction;
     AACliente: TAction;
     AAAgente: TAction;
     SBACliente: TSpeedButton;
     SBAAgente: TSpeedButton;
     DBEFTarifa: TLFDBEditFind2000;
     LTarifa: TLFLabel;
     ETitTarifa: TLFEdit;
     AInfoLotes: TAction;
     ToolButton10: TToolButton;
     TBInfoLotes: TToolButton;
     AArticulo: TAction;
     AArtCli: TAction;
     ToolButton11: TToolButton;
     TBArtCli: TToolButton;
     LNotas: TLFLabel;
     RelojNotas: TTimer;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     ACentroCoste: TAction;
     LSumUnidades: TLFLabel;
     DBESumUnidades: TLFDBEdit;
     AInformeFactura: TAction;
     AInformeFactura2: TLFNoSaveAction;
     AInformeFactura3: TLFNoSaveAction;
     AInformeFactura4: TLFNoSaveAction;
     AFacturasDiarias: TAction;
     AVisualizarFacturasFiltradas: TAction;
     AImprimirFacturasFiltradas: TAction;
     AVisualizarMail: TAction;
     AEnviarFacturaMail: TAction;
     ASep: TAction;
     AResumenFacturas: TAction;
     AResumenFacturasFiltradas: TAction;
     AImprimirResumenFacturasFiltradas: TAction;
     ASep2: TAction;
     AListadoArticulos: TAction;
     ARecibosDeLaFactura: TAction;
     ARecibosFacturas: TAction;
     AEtiquetas: TAction;
     ASep3: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfFacturas: TAction;
     AConfFacturasFechaCliente: TAction;
     AConfFacturasArticulo: TAction;
     AConfRecibosFacturas: TAction;
     AConfEtiquetas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ACambiarNombre: TAction;
     ASep4: TAction;
     AAbrirCerrar: TAction;
     ASep5: TAction;
     ADuplicar: TAction;
     ACondicionesClientes: TAction;
     ADevolucion: TAction;
     ARefrescaDetalle: TAction;
     ACambiaFinanciacion: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ACierraMasivo: TAction;
     LFCategoryAction4: TLFCategoryAction;
     ATipoIVA: TAction;
     AHerencia: TAction;
     AVentas: TAction;
     AHistoricoSerializacion: TAction;
     ARecibos: TAction;
     LFechaEntrega: TLFLabel;
     DBDTPEntrega: TLFDBDateEdit;
     TButtCambiaDescripcion: TToolButton;
     ACambiaTitulo: TAction;
     LFCategoryAction5: TLFCategoryAction;
     AEnviarFacturaMailPdf: TAction;
     TButtMuestraUbicacion: TToolButton;
     AMuestraUbicacion: TAction;
     ASep6: TAction;
     AListadoUbicaciones: TAction;
     AConfLstUbicaciones: TAction;
     DBCBRectificacion: TLFDBCheckBox;
     LBPortes: TLFLabel;
     DBEFPortes: TLFDBEditFind2000;
     ETituloPortes: TLFEdit;
     DBEIPortes: TLFDbedit;
     DBEPorPortes: TLFDbedit;
     LBRango: TLFLabel;
     DBEFRango: TLFDBEditFind2000;
     DBERango: TLFDbedit;
     DBEIndice: TLFDbedit;
     LBIndice: TLFLabel;
     DBEFIndice: TLFDBEditFind2000;
     AOrdenaLineas: TAction;
     AFacturaMulti: TAction;
     ASep7: TAction;
     LContacto: TLFLabel;
     DBEFContacto: TLFDBEditFind2000;
     DBEContacto: TLFDbedit;
     TButtRecibos: TToolButton;
     AAnalitica: TAction;
     AVisRecibosFacturasFiltradas: TAction;
     AImpRecibosFacturasFiltradas: TAction;
     TButtBuscaNIFKRI: TToolButton;
     ABuscaNIFKRI: TAction;
     EFBuscaNIFKRI: TLFEditFind2000;
     TBDescargaLector: TToolButton;
     ADescargaLector: TAction;
     TButtHerencia: TToolButton;
     PCDetalle: TLFPageControl;
     TSArticulos: TTabSheet;
     TSArticulosCertificados: TTabSheet;
     DBGFDetalleCertificado: TDBGridFind2000;
     ABuscarArticulo: TAction;
     ToolButton6: TToolButton;
     TButtBuscarArticulo: TToolButton;
     LBLCertificado: TLFLabel;
     DBECertificadoAnt: TLFDBEdit;
     AArticuloCert: TAction;
     DBTPHora: TDBDateTimePicker;
     DBEFTipoLineaKri: TLFDBEditFind2000;
     ETipoLineaKri: TLFEdit;
     AEnviarFacturaMailPdf2: TAction;
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
     ToolButton12: TToolButton;
     PNLTamano: TLFPanel;
     EFontSizeNotas: TLFEdit;
     UpDown1: TUpDown;
     LFCategoryAction6: TLFCategoryAction;
     AAdjuntosFactura: TAction;
     AAdjuntosCliente: TAction;
     AAdjuntosTercero: TAction;
     AAdjuntosAgente: TAction;
     AAdjuntosTransportista: TAction;
     DBEContadorNCF: TLFDbedit;
     DBEFPrefijoNCF: TLFDbedit;
     LNCF: TLFLabel;
     AGenerarPackingList: TAction;
     EModoIva: TLFEdit;
     EFModoIva: TLFDBEditFind2000;
     AEnviarFacturaElectronicaMX: TAction;
     AFacturaElectronicaMX: TAction;
     LTelefono: TLFLabel;
     DBCBVTipoNCF: TDBLookupComboBox;
     DBCHKListado: TLFDBCheckBox;
     AEliminarPackingList: TAction;
     AOrdenarLineasPorDireccionEntrega: TAction;
     AListarEtiquetas: TAction;
     AImportarDocumentoDesdeOtraBD: TAction;
     AFacturaElectronicaES: TAction;
     ACambioPCosteLinea: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     ASep1: TAction;
     DBGFDetalle1: TDBGridFind2000;
     AAsignaEmpleado: TAction;
     LMargen: TLFLabel;
     DBEMargen: TLFDbedit;
     TBCondicionesClientes: TToolButton;
     TButtTraspaso: TToolButton;
     PMTraspaso: TPopupMenu;
     MITraspasodeFacturasMultiCanal: TMenuItem;
     MIDuplicarFactura: TMenuItem;
     MIGeneradevolucion: TMenuItem;
     TSOtros: TTabSheet;
     PCabOtros: TLFPanel;
     PNLCabOtros: TLFPanel;
     LOtrosFecha: TLFLabel;
     LOtrosReferencia: TLFLabel;
     DBEOtrosFecha: TLFDbedit;
     DBEOtrosSuRefernciaCab: TLFDbedit;
     DBEOtrosClienteTituloCab: TLFDbedit;
     DBEOtrosRIG: TLFDbedit;
     NavOtros: THYMNavigator;
     PNLEdOtros: TLFPanel;
     CEOtrosPMEdit: TPopUpTeclas;
     CEOtrosMiFirst: TMenuItem;
     CEOtrosMiPrior: TMenuItem;
     CEOtrosMiNext: TMenuItem;
     CEOtrosMiLast: TMenuItem;
     CEOtrosMiDelete: TMenuItem;
     CEOtrosMiEdit: TMenuItem;
     CEOtrosMiPost: TMenuItem;
     CEOtrosMiCancel: TMenuItem;
     CEOtrosMiRefresh: TMenuItem;
     CEOtros: TControlEdit;
     CEOtrosMiinsert: TMenuItem;
     LBIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     ETitIdioma: TLFEdit;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     ETitMoneda: TLFEdit;
     DBCBRECC: TLFDBCheckBox;
     LTipoIRPF: TLFLabel;
     LPorcentajeIRPF: TLFLabel;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBERetencion: TLFDbedit;
     DBETitTIPOIRPF: TLFDbedit;
     DBEAplicarIRPF: TLFDbedit;
     LCampanya: TLFLabel;
     EFCampanya: TLFDBEditFind2000;
     DBETituloCampanya: TLFDbedit;
     LPorcentajeFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     LValorCambio: TLFLabel;
     DBEValorCambio: TLFDbedit;
     DBCHKCambio: TLFDBCheckBox;
     LTipoLineaKri: TLFLabel;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LblCartera: TLFLabel;
     DBERegistroCartera: TLFDbedit;
     SBVerCartera: TSpeedButton;
     ARegistroCartera: TAction;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     DBEPorcPropina: TLFDbedit;
     LPorcPropina: TLFLabel;
     LAutorizacion: TLabel;
     LCodigoControl: TLabel;
     DBEFAutorizacion: TLFDBEditFind2000;
     DBECodigoControl: TLFDbedit;
     ARegistroFitosanitario: TAction;
     AProyecto: TAction;
     SBAProyecto: TSpeedButton;
     TButtImportarDetalle: TToolButton;
     AImportarDetalle: TAction;
     DBEFPorRetencionGarantia: TLFDbedit;
     LPorRetencionGarantia: TLFLabel;
     DBEFImporteRetencionGarantia: TLFDbedit;
     LImporteRetencionGarantia: TLFLabel;
     LFechaRetencionGarantia: TLFLabel;
     DBDTPFechaRetencionGarantia: TLFDBDateEdit;
     PNLFirma: TLFPanel;
     ImgFirma: TImage;
     DBTFirmaNombre: TDBText;
     DBTNIFFirma: TDBText;
     LFirma: TLFLabel;
     APedirFirma: TAction;
     ACambioCosteAdicionalLinea: TAction;
     ABorrarFirma: TAction;
     LBancoDireccion: TLFLabel;
     DBEFBancoDireccion: TLFDBEditFind2000;
     EBancoDireccion: TLFEdit;
     LTipoVenta: TLFLabel;
     DBEFTipoVenta: TLFDBEditFind2000;
     ETipoVenta: TLFEdit;
     LCodigoGiroCliente: TLFLabel;
     DBEFCodigoGiroCliente: TLFDBEditFind2000;
     LCodigoGiroEmpresa: TLFLabel;
     DBEFCodigoGiroEmpresa: TLFDBEditFind2000;
     ECodigoGiroEmpresa: TLFEdit;
     PNLOtrosBolivia: TLFPanel;
     LTipoDespacho: TLFLabel;
     DBETipoDespacho: TLFDBEditFind2000;
     ETipoDespachoTitulo: TLFEdit;
     TSFEChile: TTabSheet;
     TBFEChile: TLFToolBar;
     NavFEChile: THYMNavigator;
     LNombreComercial: TLFLabel;
     DBENombreComercial: TLFDbedit;
     SBATercero: TSpeedButton;
     ATercero: TAction;
     LEmail: TLFLabel;
     RelojEmail: TTimer;
     LFmaPagoSII: TLFLabel;
     DBCBFmaPagoSII: TLFDBComboBoxValue;
     DBTRectificacion: TDBText;
     PNLChile: TLFPanel;
     DBESiiTrackID: TLFDbedit;
     LFSiiTrackID: TLFLabel;
     ACrearHerenciaManual: TAction;
     DBENIF: TLFDbedit;
     LDocumento: TLFLabel;
     DBETipoDocIdentificacion: TLFDbedit;
     DBCBRec_Invisibles: TLFDBCheckBox;
     LFechaCon: TLFLabel;
     DBDFContable: TLFDBDateEdit;
     TSOtrosChile: TTabSheet;
     PCabOtrosChile: TLFPanel;
     PEdOtrosChile: TLFPanel;
     LOtrosTipoVenta: TLFLabel;
     LOtrosCodigoGiroCliente: TLFLabel;
     LOtrosCodigoGiroEmpresa: TLFLabel;
     LOtrosTipoDocumentoTributario: TLFLabel;
     LOtrosTipoDespacho: TLFLabel;
     LOtrosTipoDocIdentificacion: TLFLabel;
     DBEFOtrosTipoVenta: TLFDBEditFind2000;
     EOtrosTipoVenta: TLFEdit;
     DBEFOtrosCodigoGiroCliente: TLFDBEditFind2000;
     EOtrosCodigoGiroCliente: TLFEdit;
     EOtrosCodigoGiroEmpresa: TLFEdit;
     DBEFOtrosCodigoGiroEmpresa: TLFDBEditFind2000;
     DBEFOtrosTipoDocumentoTributario: TLFDBEditFind2000;
     EOtrosTipoDocumentoTributario: TLFEdit;
     EOtrosTipoDespachoTitulo: TLFEdit;
     DBEOtrosTipoDespacho: TLFDBEditFind2000;
     DBEOtrosNIF: TLFDbedit;
     DBEOtrosTipoDocIdentificacion: TLFDbedit;
     PFEChile: TLFPanel;
     grpEmisor: TGroupBox;
     LRUTEmisor: TLFLabel;
     LRznSoc: TLFLabel;
     LGiroEmisor: TLFLabel;
     LTelefonoEmis: TLFLabel;
     LCorreoEmisor: TLFLabel;
     LActeco: TLFLabel;
     LSucursal: TLFLabel;
     LCdgSIISucur: TLFLabel;
     LFLabel1: TLFLabel;
     LCmnaOrigen: TLFLabel;
     LCiudadOrigen: TLFLabel;
     LCdgVendedor: TLFLabel;
     DBERUTEmisor: TLFDbedit;
     DBERznSoc: TLFDbedit;
     DBEGiroEmis: TLFDbedit;
     DBETelefono: TLFDbedit;
     DBECorreoEmisor: TLFDbedit;
     DBEActeco: TLFDbedit;
     DBESucursal: TLFDbedit;
     DBECdgSIISucur: TLFDbedit;
     DBEDirOrigen: TLFDbedit;
     DBECmnaOrigen: TLFDbedit;
     DBECiudadOrigen: TLFDbedit;
     DBECdgVendedor: TLFDbedit;
     grpReceptor: TGroupBox;
     LRUTRecep: TLFLabel;
     LCdgIntRecep: TLFLabel;
     LRznSocRecep: TLFLabel;
     LGiroRecep: TLFLabel;
     LContactoRecep: TLFLabel;
     LCorreoRecep: TLFLabel;
     LDirRecep: TLFLabel;
     LCmnaRecep: TLFLabel;
     LCiudadRecep: TLFLabel;
     LDirPostal: TLFLabel;
     LCmnaPostal: TLFLabel;
     LCiudadPostal: TLFLabel;
     DBERUTRecep: TLFDbedit;
     DBECdgIntRecep: TLFDbedit;
     DBERznSocRecep: TLFDbedit;
     DBEGiroRecep: TLFDbedit;
     DBEContactoRecep: TLFDbedit;
     DBECorreoRecep: TLFDbedit;
     DBEDirRecep: TLFDbedit;
     DBECmnaRecep: TLFDbedit;
     LCiudadRecep2: TLFFibDBEditFind;
     DBEDirPostal: TLFDbedit;
     DBECmnaPostal: TLFDbedit;
     DBECiudadPostal: TLFDbedit;
     grpExtranjero: TGroupBox;
     LNacionalidad: TLFLabel;
     LTipoDocID: TLFLabel;
     LNumId: TLFLabel;
     DBETipoDocID: TLFDbedit;
     DBENumId: TLFDbedit;
     DBENacionalidad: TLFDbedit;
     grpTransporte: TGroupBox;
     LPatente: TLFLabel;
     LRUTTrans: TLFLabel;
     LRUTChofer: TLFLabel;
     LNombreChofer: TLFLabel;
     LDirDest: TLFLabel;
     LCmnaDest: TLFLabel;
     LCiudadDest: TLFLabel;
     DBEPatente: TLFDbedit;
     DBERUTTrans: TLFDbedit;
     DBERUTChofer: TLFDbedit;
     DBENombreChofer: TLFDbedit;
     DBEDirDest: TLFDbedit;
     DBECmnaDest: TLFDbedit;
     DBECiudadDest: TLFDbedit;
     grpIdDoc: TGroupBox;
     LIndServicio: TLFLabel;
     LMntBruto: TLFLabel;
     LTpoTranCompra: TLFLabel;
     LTpoTranVenta: TLFLabel;
     LFmaPago: TLFLabel;
     LFchCancel: TLFLabel;
     LMntCancel: TLFLabel;
     LSaldoInsol: TLFLabel;
     LMedioPago: TLFLabel;
     LTipoCtaPago: TLFLabel;
     LNumCtaPago: TLFLabel;
     LBcoPago: TLFLabel;
     LTermPagoCdg: TLFLabel;
     LTermPagoGlosa: TLFLabel;
     LTermPagoDias: TLFLabel;
     LFchVenc: TLFLabel;
     LTipoFactEsp: TLFLabel;
     CBIndServicio: TLFDBComboBoxValue;
     DBEMntBruto: TLFDbedit;
     CBTpoTranCompra: TLFDBComboBoxValue;
     DBCBTipoTranVenta: TLFDBComboBoxValue;
     CBFmaPago: TLFDBComboBoxValue;
     DBDFchCancel: TLFDBDateEdit;
     LFDbedit1: TLFDbedit;
     DESaldoInsol: TLFDbedit;
     CBMedioPago: TLFDBComboBoxValue;
     CBTipoCtaPago: TLFDBComboBoxValue;
     DBENumCtaPago: TLFDbedit;
     DBEBcoPago: TLFDbedit;
     DBETermPagoCdg: TLFDbedit;
     DBETermPagoGlosa: TLFDbedit;
     LFDbedit2: TLFDbedit;
     DBDFchVenc: TLFDBDateEdit;
     CBTipoFactEsp: TLFDBComboBoxValue;
     pnlEncabezado: TPanel;
     LRUTMandante: TLFLabel;
     LRUTSolicita: TLFLabel;
     DBERUTMandante: TLFDbedit;
     DBERUTSolicita: TLFDbedit;
     grpTotales: TGroupBox;
     LMntNeto: TLFLabel;
     MntExe: TLFLabel;
     LMntBase: TLFLabel;
     LMntMargCom: TLFLabel;
     LTasaIVA: TLFLabel;
     LIVA: TLFLabel;
     LIVAProp: TLFLabel;
     LIVATerc: TLFLabel;
     LCredEC: TLFLabel;
     LGrntDep: TLFLabel;
     LMntTotal: TLFLabel;
     LMontoNF: TLFLabel;
     LMontoPeriodo: TLFLabel;
     LSaldoAnterior: TLFLabel;
     LVlrPagar: TLFLabel;
     DBEMntNeto: TLFDbedit;
     DBEMntExe: TLFDbedit;
     DBEMntBase: TLFDbedit;
     DBEMntMargenCom: TLFDbedit;
     DBETasaIVA: TLFDbedit;
     DBEIVA: TLFDbedit;
     DBEIVAProp: TLFDbedit;
     DBEIVATerc: TLFDbedit;
     DBECredEC: TLFDbedit;
     DBEGrntDep: TLFDbedit;
     DBEMntTotal: TLFDbedit;
     DBEMontoNF: TLFDbedit;
     DBEMontoPeriodo: TLFDbedit;
     DBESaldoAnterior: TLFDbedit;
     DBEVlrPagar: TLFDbedit;
     grpOtraMoneda: TGroupBox;
     LTpoMoneda: TLFLabel;
     LTpoCambio: TLFLabel;
     LMntNetoOtrMnda: TLFLabel;
     LMntExeOtrMnda: TLFLabel;
     LMntFaeCarneOtrMnda: TLFLabel;
     LMntMargComOtrMnda: TLFLabel;
     LIVAOtrMnda: TLFLabel;
     LIVANoRetOtrMnda: TLFLabel;
     LMntTotOtrMnda: TLFLabel;
     CBTpoMoneda: TLFDBComboBoxValue;
     DBETpoCambio: TLFDbedit;
     DBEMntNetoOtrMnda: TLFDbedit;
     DBEMntExeOtrMnda: TLFDbedit;
     DBEMntFaeCarneOtrMnda: TLFDbedit;
     LFDbedit6: TLFDbedit;
     DBEIVAOtrMnda: TLFDbedit;
     DBEIVANoRetOtrMnda: TLFDbedit;
     LFDbedit9: TLFDbedit;
     NavOtrosChile: THYMNavigator;
     CEOtrosChilePMEdit: TPopUpTeclas;
     CEOtrosChile: TControlEdit;
     DBEFTipoDocumentoTributario: TLFDBEditFind2000;
     ETipoDocumentoTributario: TLFEdit;
     LTipoDocumentoTributario: TLFLabel;
     DBEFolio: TLFDbedit;
     LFolioSII: TLFLabel;
     LOtrosFolio: TLFLabel;
     DBEOtrosFolio: TLFDbedit;
     DBEOtrosSiiTrackID: TLFDbedit;
     LOtrosSiiTrackID: TLFLabel;
     DBCBOtrosFmaPagoSII: TLFDBComboBoxValue;
     LOtrosFmaPagoSII: TLFLabel;
     AMuestraDocumentosVenta: TAction;
     DEFechaReparto: TLFDBDateEdit;
     LFechaReparto: TLFLabel;
     DBDTPHoraReparto: TDBDateTimePicker;
     AEnviaDTECL: TAction;
     TBEnvioDTE: TToolButton;
     LTicketBAI: TLFLabel;
     DBETicketBAI: TLFDbedit;
     LPedidoCli: TLFLabel;
     DBEPedidoCli: TLFDbedit;
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
     GBReferenciasDte: TGroupBox;
     PNLReferenciasDte: TLFPanel;
     LTpoDocRef: TLFLabel;
     LFolioRef: TLFLabel;
     LRUTOtr: TLFLabel;
     LFchRef: TLFLabel;
     LCodRef: TLFLabel;
     LRazonRef: TLFLabel;
     LIdDocRef: TLFLabel;
     DBGFReferenciasDte: TDBGridFind2000;
     DBERUTOtr: TLFDbedit;
     DBERazonRef: TLFDbedit;
     ETipoDocTribTitulo: TLFEdit;
     CBCodRef: TLFDBComboBoxValue;
     DBDFchRef: TLFDBDateEdit;
     DBETpoDocRef: TLFDBEditFind2000;
     DBEIdDocRef: TLFDbedit;
     NavReferenciasDte: THYMNavigator;
     DBEFolioRef: TLFDbedit;
     PNLReferenciasDteCab: TPanel;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     LSumaPeso: TLFLabel;
     DBESumaPeso: TLFDbedit;
     TBEnvioTBAI: TToolButton;
     AEnvioTBAI: TAction;
     AAnularTBAI: TAction;
     LFCategoryAction7: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFiltroAbierto: TAction;
     AFiltroCerrado: TAction;
     AGeneraNotaDeCredito: TAction;
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
     DBCBEmpaquetadoEmpresa: TLFDBCheckBox;
     LValorUF: TLFLabel;
     ADetallesDeLinea: TAction;
     TButtDetalles: TToolButton;
     LPeriodoFacturacionIni: TLFLabel;
     DBDEPeriodoFacturacionIni: TLFDBDateEdit;
     DBDEPeriodoFacturacionFin: TLFDBDateEdit;
     LPeriodoFacturacionFin: TLFLabel;
     LServicio: TLFLabel;
     DBEValorUF: TLFDbedit;
     DBCBIndServicio: TLFDBComboBoxValue;
     DBCBReciboPagado: TLFDBCheckBox;
     AEnviaDTE: TAction;
     AExportarExcel: TAction;
     ABorradoMasivoLineas: TAction;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     TBLocalizaFolio: TToolButton;
     TBSep1: TToolButton;
     ALocalizaFolio: TAction;
     DBMLegalLiterals: TLFDBMemo;
     LLegalLiterals: TLFLabel;
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
     DBCBEmitidaPorTerceros: TLFDBCheckBox;
     PNLNotas: TLFPanel;
     splitter: TSplitter;
     PNLOrtografia: TLFPanel;
     TBOrtografia: TLFToolBar;
     TBComprobar: TToolButton;
     ToolButton2: TToolButton;
     TBAgregarPalabra: TToolButton;
     LBPalabras: TListBox;
     AImportaFacturas: TAction;
     ACliArt: TAction;
     TBCliArt: TToolButton;
     LCantLineas: TLFLabel;
     DBECOUNT_LINEAS: TLFDbedit;
     DBEFProyectoChile: TLFDBEditFind2000;
     LProyectoChile: TLFLabel;
     EProyectoChile: TLFEdit;
     LProyecto: TLFLabel;
     DBEFProyecto: TLFDBEditFind2000;
     EProyecto: TLFEdit;
     PNLAvisos: TLFPanel;
     LAvisos: TLFLabel;
     LNotasCliente: TLFLabel;
     DBMAviso: TLFDBMemo;
     DBMNotaCliente: TLFDBMemo;
     AEnviaFactoingCHL: TAction;
     TSVerifactu: TTabSheet;
     PNLVerifactu: TLFPanel;
     PNLCabVerifactu: TLFPanel;
     LVerifactuFecha: TLFLabel;
     LVerifactuReferencia: TLFLabel;
     DBEVerifactuFecha: TLFDbedit;
     DBEVerifactuSuReferencia: TLFDbedit;
     DBEVerifactuClienteTituloCab: TLFDbedit;
     DBEVerifactuRIG: TLFDbedit;
     DBEQRVerifactu: TLFDbedit;
     ImgQRVerifactu: TImage;
     LVerifactuQR: TLFLabel;
     PNLQRVerifactu: TLFPanel;
     PNLDatosVerifactu: TLFPanel;
     LVerifactuEncadenamiento: TLFLabel;
     LVerifactuHuella: TLFLabel;
     DBEHuella: TLFDbedit;
     LVerifactuEncIdEmisorFactura: TLFLabel;
     DBEEncIdEmisorFactura: TLFDbedit;
     LVerifactuEncNumSerieFactura: TLFLabel;
     DBEEncNumSerieFactura: TLFDbedit;
     LVerifactuEncFechaExpedicionFactura: TLFLabel;
     DBEEncFechaExpedicionFactura: TLFDbedit;
     LVerifactuEncHuella: TLFLabel;
     DBEEncHuella: TLFDbedit;
     LVerifactuRegistro: TLFLabel;
     DBESIITituloCodigoGiroCliente: TLFDbedit;
     GBFactoring: TGroupBox;
     LFactoringStatus: TLFLabel;
     LFactoringTrackID: TLFLabel;
     DBEFactoringStatus: TLFDbedit;
     DBEFactoringTrackID: TLFDbedit;
     ETituloStatus: TLFEdit;
     GBDTEEnvio: TGroupBox;
     DBEDTETrackID: TLFDbedit;
     LDTETrackID: TLFLabel;
     TSEnvioECF: TTabSheet;
     PNLEnvioECF: TLFPanel;
     GBDatosConsultaECF: TGroupBox;
     LENCF: TLFLabel;
     LStatusConsulta: TLFLabel;
     LLegalStatusConsulta: TLFLabel;
     LTrackID: TLFLabel;
     DBEENCF: TLFDbedit;
     DBEStatusConsulta: TLFDbedit;
     DBELegalStatusConsulta: TLFDbedit;
     DBETrackID: TLFDbedit;
     CBSeqConsumed: TLFDBCheckBox;
     GBDatosEnvioECF: TGroupBox;
     LStatusEnvio: TLFLabel;
     LSecurityCode: TLFLabel;
     LMMensajeErrorECF: TLFLabel;
     LIDEnvio: TLFLabel;
     DBEStatusEnvio: TLFDbedit;
     DBESecurityCode: TLFDbedit;
     DBEMMensajeErrorECF: TLFDbedit;
     DBEIDEnvio: TLFDbedit;
     PNLQRECF: TPanel;
     ImgQRECF: TImage;
     SBConsultaEstadoECF: TSpeedButton;
     PNLCabEnvioECF: TLFPanel;
     LEnvioECFReferencua: TLFLabel;
     LEnvioECFFecha: TLFLabel;
     DBEEnvioECFTitulo: TLFDbedit;
     DBEEnvioECFReferencia: TLFDbedit;
     DBEEnvioECFRIG: TLFDbedit;
     DBEEnvioECFFecha: TLFDbedit;
     DBEMensajeErrCon: TFIBDBEditfind;
     LMensajeErrCon: TLFLabel;
     AIncrementarPrecio: TAction;
     AImportaFacturas2: TAction;
     PNLEnlaceQR: TPanel;
     LQRECF: TLFLabel;
     DBEQRECF: TLFDbedit;
     PNLReferencia: TPanel;
     GBReferencia: TGroupBox;
     PnlReferenciaDGII: TLFPanel;
     NavDGIIReferencias: THYMNavigator;
     LTipoCF: TLFLabel;
     ETipoCFTitulo: TLFEdit;
     DBEFTipoCF: TLFDBEditFind2000;
     DBEID_S: TLFDbedit;
     EENCFRef: TLFDbedit;
     LID_S_REF: TLFLabel;
     CBTipoRef: TLFDBComboBoxValue;
     LTipoRef: TLFLabel;
     DBCBTipoIngresos: TDBComboBoxValue;
     LTipoIngresos: TLFLabel;
     AAnulaDocumento: TAction;
     AResumeFactura: TAction;
     LVerifactuEstado: TLFLabel;
     LEstadoAltaVerifactu: TLFLabel;
     DBEEstadoAltaVerifactu: TLFDbedit;
     LEstadoAnulacionVerifactu: TLFLabel;
     DBEEstadoAnulacionVerifactu: TLFDbedit;
     DBECodigoAltaVerifactu: TLFDbedit;
     DBECodigoAnulacionVerifactu: TLFDbedit;
     DBEDescAltaVerifactu: TLFDbedit;
     DBEDescAnulacionVerifactu: TLFDbedit;
     DBECodErrorEnvio: TLFDbedit;
     LCodigoErrorEnvio: TLFLabel;
     PNLPieUnidades: TLFPanel;
     DBESumUdsLog: TLFDbedit;
     DBESumUdsSec: TLFDbedit;
     PNLPieInfo: TLFPanel;
     PNLInfoImportes: TLFPanel;
     AGeneraNotaDeDebito: TAction;
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalle1Busqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure BTNInfoTerc_CliClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EFSerieChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure AProcedenciaExecute(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure AUnidadesExtExecute(Sender: TObject);
     procedure APreciosTarifaExecute(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AInfoHistoricoExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalle1ColEnter(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure DBGFDetalle1CampoDevuelve(Sender: TObject; valor: string);
     procedure DBGFDetalle1Existe(Sender: TObject);
     procedure ABuscarNumSerieExecute(Sender: TObject);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure APVPExecute(Sender: TObject);
     procedure ANIFFacturaExecute(Sender: TObject);
     procedure ARegistroIVAExecute(Sender: TObject);
     procedure SBVerRegistroDblClick(Sender: TObject);
     procedure AAsientoFacturaExecute(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewClienteExecute(Sender: TObject);
     procedure ANewAgenteExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAClienteExecute(Sender: TObject);
     procedure AAAgenteExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure DBETituloClienteEnter(Sender: TObject);
     procedure ETituloAgenteEnter(Sender: TObject);
     procedure ACentroCosteExecute(Sender: TObject);
     procedure DBGFDetalle1RowChange(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBGFDetalle1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AInfoLotesExecute(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure DBGFDetalle1DblClick(Sender: TObject);
     procedure AArtCliExecute(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure AInformeFacturaExecute(Sender: TObject);
     procedure AInformeFactura2Execute(Sender: TObject);
     procedure AInformeFactura3Execute(Sender: TObject);
     procedure AInformeFactura4Execute(Sender: TObject);
     procedure EFClienteExiste(Sender: TObject);
     procedure ExportarficheroEDI1Click(Sender: TObject);
     procedure AFacturasDiariasExecute(Sender: TObject);
     procedure AVisualizarFacturasFiltradasExecute(Sender: TObject);
     procedure AImprimirFacturasFiltradasExecute(Sender: TObject);
     procedure AVisualizarMailExecute(Sender: TObject);
     procedure AEnviarFacturaMailExecute(Sender: TObject);
     procedure AResumenFacturasExecute(Sender: TObject);
     procedure AResumenFacturasFiltradasExecute(Sender: TObject);
     procedure AImprimirResumenFacturasFiltradasExecute(Sender: TObject);
     procedure AListadoArticulosExecute(Sender: TObject);
     procedure ARecibosDeLaFacturaExecute(Sender: TObject);
     procedure ARecibosFacturasExecute(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure AConfFacturasExecute(Sender: TObject);
     procedure AConfFacturasFechaClienteExecute(Sender: TObject);
     procedure AConfFacturasArticuloExecute(Sender: TObject);
     procedure AConfRecibosFacturasExecute(Sender: TObject);
     procedure AConfEtiquetasExecute(Sender: TObject);
     procedure ACambiarNombreExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ACondicionesClientesExecute(Sender: TObject);
     procedure ADevolucionExecute(Sender: TObject);
     procedure ARefrescaDetalleExecute(Sender: TObject);
     procedure ACambiaFinanciacionExecute(Sender: TObject);
     procedure ACierraMasivoExecute(Sender: TObject);
     procedure ATipoIVAExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure AVentasExecute(Sender: TObject);
     procedure AHistoricoSerializacionExecute(Sender: TObject);
     procedure ARecibosExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalle1CellClick(Column: TColumn);
     procedure DBGFDetalle1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure ACambiaTituloExecute(Sender: TObject);
     procedure AEnviarFacturaMailPdfExecute(Sender: TObject);
     procedure AMuestraUbicacionExecute(Sender: TObject);
     procedure AListadoUbicacionesExecute(Sender: TObject);
     procedure AConfLstUbicacionesExecute(Sender: TObject);
     procedure DBDTPFechaExit(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure AAnaliticaExecute(Sender: TObject);
     procedure DBEFRangoChange(Sender: TObject);
     procedure DBEFRangoBusqueda(Sender: TObject);
     procedure DBEFIndiceBusqueda(Sender: TObject);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure AFacturaMultiExecute(Sender: TObject);
     procedure AVisRecibosFacturasFiltradasExecute(Sender: TObject);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure ADescargaLectorExecute(Sender: TObject);
     procedure DBDTPEntregaExit(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFProyectoBusqueda(Sender: TObject);
     procedure PCDetalleChange(Sender: TObject);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure DBGFDetalleCertificadoCellClick(Column: TColumn);
     procedure DBGFDetalleCertificadoDblClick(Sender: TObject);
     procedure AArticuloCertExecute(Sender: TObject);
     procedure DBGFDetalleCertificadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalle1KeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFTipoLineaKriChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AEnviarFacturaMailPdf2Execute(Sender: TObject); //sfg_rsl       
     procedure PCMainChange(Sender: TObject);
     procedure DBEFContactoBusqueda(Sender: TObject);
     procedure DBRENotasEnter(Sender: TObject);
     procedure DBRENotasSelectionChange(Sender: TObject);
     procedure EFontSizeNotasChange(Sender: TObject);
     procedure CBFontNameChange(Sender: TObject);
     procedure AAdjuntosFacturaExecute(Sender: TObject);
     procedure AAdjuntosClienteExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AAdjuntosAgenteExecute(Sender: TObject);
     procedure AAdjuntosTransportistaExecute(Sender: TObject);
     procedure AGenerarPackingListExecute(Sender: TObject);
     procedure EFModoIvaChange(Sender: TObject);
     procedure AEnviarFacturaElectronicaMXExecute(Sender: TObject);
     // procedure AFacturaElectronicaMxExecute(Sender: TObject);
     procedure AFacturaElectronicaMXExecute(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure AEliminarPackingListExecute(Sender: TObject);
     procedure AOrdenarLineasPorDireccionEntregaExecute(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure DBEFProyectoChange(Sender: TObject);
     procedure DBEFTarifaChange(Sender: TObject);
     procedure EFTransportistaChange(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure AImportarDocumentoDesdeOtraBDExecute(Sender: TObject);
     procedure AFacturaElectronicaESExecute(Sender: TObject);
     procedure ACambioPCosteLineaExecute(Sender: TObject);
     procedure ACambioCosteAdicionalLineaExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure LNotasClick(Sender: TObject);
     procedure AAsignaEmpleadoExecute(Sender: TObject);
     procedure DBEMargenChange(Sender: TObject);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure TSOtrosShow(Sender: TObject);
     procedure ARegistroCarteraExecute(Sender: TObject);
     procedure SBVerCarteraDblClick(Sender: TObject);
     procedure DBERIGChange(Sender: TObject);
     procedure DBEFAutorizacionBusqueda(Sender: TObject);
     procedure ARegistroFitosanitarioExecute(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure DBCBDevolucionChange(Sender: TObject);
     procedure APedirFirmaExecute(Sender: TObject);
     procedure ABorrarFirmaExecute(Sender: TObject);
     procedure DBEFBancoDireccionBusqueda(Sender: TObject);
     procedure DBEFBancoDireccionChange(Sender: TObject);
     procedure DBEFTipoVentaChange(Sender: TObject);
     procedure DBEFCodigoGiroClienteChange(Sender: TObject);
     procedure DBEFCodigoGiroEmpresaChange(Sender: TObject);
     procedure DBEFTipoDocumentoTributarioChange(Sender: TObject);
     procedure DBEFOtrosTipoDocumentoTributarioChange(Sender: TObject);
     procedure DBETipoDespachoChange(Sender: TObject);
     procedure DBEFOtrosCodigoGiroEmpresaChange(Sender: TObject);
     procedure DBEFOtrosCodigoGiroClienteChange(Sender: TObject);
     procedure DBEFOtrosTipoVentaChange(Sender: TObject);
     procedure DBEOtrosTipoDespachoChange(Sender: TObject);
     procedure DBETipoDespachoBusqueda(Sender: TObject);
     procedure DBEOtrosTipoDespachoBusqueda(Sender: TObject);
     procedure ATerceroExecute(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearHerenciaManualExecute(Sender: TObject);
     procedure DBEFFormaPagoChange(Sender: TObject);
     procedure DBETpoDocRefChange(Sender: TObject);
     procedure AMuestraDocumentosVentaExecute(Sender: TObject);
     procedure AEnviaDTECLExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure AEnvioTBAIExecute(Sender: TObject);
     procedure AAnularTBAIExecute(Sender: TObject);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
     procedure DBGFDetalle1KeyPress(Sender: TObject; var Key: char);
     procedure CBCodRefChange(Sender: TObject);
     procedure TSDirManualResize(Sender: TObject);
     procedure ADetallesDeLineaExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AExportarExcelExecute(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure ALocalizaFolioExecute(Sender: TObject);
     procedure PNLEdOtrosResize(Sender: TObject);
     procedure DBEFMotivoAbonoChange(Sender: TObject);
     procedure TSProveedoresShow(Sender: TObject);
     procedure TBComprobarClick(Sender: TObject);
     procedure TBAgregarPalabraClick(Sender: TObject);
     procedure AImportaFacturasExecute(Sender: TObject);
     procedure ACliArtExecute(Sender: TObject);
     procedure AEnviaFactoingCHLExecute(Sender: TObject);
     procedure TSVerifactuShow(Sender: TObject);
     procedure DBEFactoringStatusChange(Sender: TObject);
     procedure TSEnvioECFShow(Sender: TObject);
     procedure SBConsultaEstadoECFClick(Sender: TObject);
     procedure AIncrementarPrecioExecute(Sender: TObject);
     procedure AImportaFacturas2Execute(Sender: TObject);
     procedure DBEFTipoCFChange(Sender: TObject);
     procedure CBTipoRefChange(Sender: TObject);
     procedure AAnulaDocumentoExecute(Sender: TObject);
     procedure AResumeFacturaExecute(Sender: TObject);
     procedure DBEEstadoAltaVerifactuChange(Sender: TObject);
     procedure DBEEstadoAnulacionVerifactuChange(Sender: TObject);
     procedure AGeneraNotaDeCreditoExecute(Sender: TObject);
     procedure AGeneraNotaDeDebitoExecute(Sender: TObject);
  private
     { Private declarations }
     param_FACINSE001: boolean;
     param_FACPREC001: boolean;
     Param_VENTIVA001: boolean;
     Param_ARTBUSQ003: boolean;
     Param_ARTBUSQ004: boolean;
     Param_SYSCONF005: integer;
     Param_DOCPCOS001: string;
     param_FACMARG001: boolean;
     param_DOCMARG003: boolean;
     param_VENUSEC001: boolean;
     param_VENUEXT001: boolean;
     param_VENREST002: boolean;
     param_FACVNIF001: boolean;
     param_FACVNIF002: boolean;
     TicketBAI: boolean;
     NumSerie: string;
     ColActual: TColumn;
     ColActualCert: TColumn;
     Editando: boolean;
     KriConf126, KriConf211: boolean;
     FUpdating: boolean; {dji lrk kri - RichEdit}
     RichEditConFoco: TDBRichEdit; {dji lrk kri - RichEdit}
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     MargenMinimo: double;
     DBGDetalleArticulo: string;
     procedure HabilitaEnlaces;
     procedure HabilitaBotones;
     procedure AbreOCierra;
     {procedure HabilitaBotonesDetalle; dji lrk kri - TyC}
     {procedure HabilitaCertificacion; dji lrk kri - TyC}
     procedure GetFontNames;
     procedure EstableceVisibilidadCamposDetalle;
     procedure ActualizaFirma;
     procedure ActualizaVerifactu;
     procedure ActualizaTicketBAI;
     procedure LimitaSegunPais;
     // procedure EstableceVisibilidadPrecio;
     procedure RefrescaAvisos;
     procedure ActualizaECF;
     function DameTituloReferencia(Codigo: integer): string;
     procedure DuplicarDTE(TipoDocTributario: string);
  public
     { Public declarations }
     FiltroListadoFiltrado: integer;
     procedure HabilitaBotonesDetalle; {TyC}
     procedure HabilitaCertificacion; {TyC}
     procedure MuestraFiltrado(Modo: byte);
     procedure MuestraResumenFiltrado(Modo: byte);
     procedure HabilitaCambioIVA;
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraDocumento(FiltroAccion: string);
     procedure MuestraStock(stockNegativo: smallint);
     procedure FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
     procedure AgrupacionPedidosFac(Serie: string; Contador: integer);
  end;

var
  FMFacturas : TFMFacturas;

procedure TraspasoAFactura(Serie: string; id_s: integer);

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UDMFacturas,
  UFCalculadora, UDMLstFactura, UFMLSTEntrefechasArt, UDMLstFacturacli,
  UFMLSTEntrefechascli, UDMLstFacturaArt, UFMCierraDocumento, UFMNotasCampo,
  UFCHerencia, UFMListConfig, UDMLstFacturasEti, UFMCambiaFacCli,
  UFMain, UFMDocInfoStocks, UFMArtSerializacion, UFMHistoricoSerializacion,
  UFMBusquedaNumSerie, UFPregNIFFACTURA, UFMAgrupacionPedidosVentas,
  UDMListados, UFMRecibosFactura, UDMLstCarteraRecibos, UFPregRecibosFacturas,
  UFMClientes, UFSendCorreo, UFMAgentes,
  UFVerTercerosPorArticulo, UDMExportaFacturaEDI, UDMLstUbicacionesV,
  UFMTraspasoMultiCanal, UFMImputacionCostes, UFMAdjunto, ZUFMAnulacionFacturas,
  UFMPackingList, UDMFacturaElectronicaMx, UFMImprimirCodBarras,
  UFMImportarDocumentoDesdeOtraBD, UFMSeleccion, UParam,
  UFMRegistroFitosanitario, UFMInsercionArticuloDesdeTexto, UFMHerenciaManual,
  Math, UFMEnviaXmlFacturasChl, UFMSeleccionArticulo, UFMDetalleDeLinea, ShellApi,
  URecibeFicheros, UDMAdjunto, UDMEnviaXmlFacturasChl, UFMProcesosMasivosLineas, UFMVentasCli,
  UDMDTEChl, UDMENCFDOM, URellenaLista, UImagenes;

{$R *.DFM}

procedure TraspasoAFactura(Serie: string; id_s: integer);
begin
  FMain.EjecutaAccion(FMain.AFacturas);
  FMain.TraspasodeDocumentosSalida(id_s);
end;

procedure TFMFacturas.FormCreate(Sender: TObject);
var
  i, a, aux : integer;
  s : string;
  param_ARTBUSQ005 : string;
  j, k, CantCampos : integer;
begin
  DragAcceptFiles(Self.Handle, True);
  BuscarArticulos := False;

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

  AbreData(TDMFacturas, DMFacturas);

  NavMAin.DataSource := DMFacturas.DSQMCabecera;
  DBGMain.DataSource := DMFacturas.DSQMCabecera;
  NavDetalle.DataSource := DMFacturas.DSQMDetalle;
  DBGFDetalle1.DataSource := DMFacturas.DSQMDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMFacturas.DSQMCabecera;
     Entorno := DMFacturas.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
     s := Trim(LeeParametro('FACBUSQ001'));
     if (s <> '') then
        CamposADesplegar.Add(s);
  end;

  PCPie.ActivePage := TSPieGen;

  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  FiltroListadoFiltrado := 0;
  REntorno.Formato := 0;
  REntorno.Cabecera := 0;
  REntorno.Copias := 0;
  REntorno.Pijama := 0;

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  s := LeeParametro('ARTBUSQ001');
  if ((s <> 'ARTICULO') and (s <> '')) then
  begin
     for i := 0 to DBGFDetalle1.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle1.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle1.CamposDesplegar[i] = '1') then
        begin
           DBGFDetalle1.Numericos[i] := s;
           DBGFDetalle1.CamposADevolver[i] := 'ARTICULO';
           DBGFDetalle1.OrdenadosPor[i] := s;
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
     for i := 0 to DBGFDetalle1.Tablas.Count - 1 do
     begin
        Inc(j);

        CantCampos := 0;
        if (DBGFDetalle1.CamposAMostrar.Count > j) then
           CantCampos := StrToIntDef(DBGFDetalle1.CamposAMostrar[j], 0);

        if (Trim(UpperCase(DBGFDetalle1.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle1.CamposDesplegar[i] = '1') then
        begin
           // Borro los campos originales
           for k := 1 to CantCampos do
              DBGFDetalle1.CamposAMostrar.Delete(j + 1);

           CantCampos := 0;
           while (Pos(',', param_ARTBUSQ005) > 0) do
           begin
              DBGFDetalle1.CamposAMostrar.Insert(j + 1, Trim(Copy(param_ARTBUSQ005, 1, Pos(',', param_ARTBUSQ005) - 1)));
              param_ARTBUSQ005 := Copy(param_ARTBUSQ005, Pos(',', param_ARTBUSQ005) + 1, Length(param_ARTBUSQ005));
              Inc(CantCampos);
           end;
           if (Trim(param_ARTBUSQ005) > '') then
           begin
              DBGFDetalle1.CamposAMostrar.Insert(j + 1, Trim(param_ARTBUSQ005));
              Inc(CantCampos);
           end;

           DBGFDetalle1.CamposAMostrar[j] := IntToStr(CantCampos);
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
     for i := 0 to DBGFDetalle1.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle1.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle1.CamposDesplegar[i] = '1') then
           DBGFDetalle1.Tablas[i] := 'VER_ARTICULOS_EF_VENTAS';
     end;
  end;

  HabilitaEnlaces;

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
  if (REntorno.Facturas = 4) then
  begin
     AInformeFactura4.Visible := True;
     AInformeFactura4.Caption := DameTituloListadoDefectoGrupo(118);
  end;
  if (REntorno.Facturas >= 3) then
  begin
     AInformeFactura3.Visible := True;
     AInformeFactura3.Caption := DameTituloListadoDefectoGrupo(117);
  end;
  if (REntorno.Facturas >= 2) then
  begin
     AInformeFactura2.Visible := True;
     AInformeFactura2.Caption := DameTituloListadoDefectoGrupo(116);
  end;
  AInformeFactura.Caption := DameTituloListadoDefectoGrupo(36);
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  RefrescaAvisos;
  Editando := False;
  if (DMMain.EstadoKri(140) <> 1) then
     ADescargaLector.Visible := False;

  if (DMMain.EstadoKri(152) <> 1) then
     AEnviarFacturaMailPdf.Visible := False;

  AAnalitica.Visible := DMMain.PuedeHacerImputaciones;
  EFBuscaNIFKRI.Width := 1;
  EFBuscaNIFKRI.Visible := False;
  PCDetalle.ActivePage := TSArticulos;

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

  if (DMMain.EstadoKri(190) <> 1) then
  begin
     LTipoLineaKri.Visible := False;
     DBEFTipoLineaKri.Visible := False;
     ETipoLineaKri.Visible := False;
     DBGFDetalle1.FindColumn('TIPO_LINEA_KRI').Visible := False;
  end;
  ColActual := DBGFDetalle1.Columns[0];

  KriConf126 := (DMMain.EstadoKri(126) = 1);
  KriConf211 := (DMMain.EstadoKri(211) = 1);

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
     ANIFFactura.Enabled := False;

  if (DMMain.EstadoKri(264) <> 1) then {Habilita el envío de email con pdf a traves del cliente windows}
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarFacturaMailPDF2) then
           ALMain.Actions[i].Free;

  if (DMMain.EstadoKri(420) = 0) then
     DBGFDetalle1.FindColumn('CUENTA').Visible := False;

  // Factura electrónica de México
  if (DMMain.EstadoKri(412) <> 1) then
  begin
     AFacturaElectronicaMX.Visible := False;
     AEnviarFacturaElectronicaMX.Visible := False;
  end;

  AFacturaElectronicaES.Visible := (LeeParametro('FACELEC001', EFSerie.Text) = 'S');

  // Pongo este campo en visible para que no lo oculte el reescalado del panel
  DBEFIndice.Visible := True;
  a := 0;
  aux := 0;
  // for i := 0 to PEdCabecera.ComponentCount -1 do
  for i := Self.ComponentCount - 1 downto 0 do
  begin
     if (Self.Components[i].GetParentComponent = PEdCabecera) then
     begin
        if (Self.Components[i] is TLFDBEditFind2000) then
           if (TLFDBEditFind2000(Self.Components[i]).Visible) then
              aux := TLFDBEditFind2000(Self.Components[i]).Top + TLFDBEditFind2000(Self.Components[i]).Height;
        if (Self.Components[i] is TLFDBEdit) then
           if (TLFDBEdit(Self.Components[i]).Visible) then
              aux := TLFDBEdit(Self.Components[i]).Top + TLFDBEdit(Self.Components[i]).Height;
        if (Self.Components[i] is TLFDBCheckBox) then
           if (TLFDBCheckBox(Self.Components[i]).Visible) then
              aux := TLFDBCheckBox(Self.Components[i]).Top + TLFDBCheckBox(Self.Components[i]).Height;
        if (aux > a) then
           a := aux;
     end;
  end;
  //a := a + (PCMain.Height - PEdCabecera.Height);
  PDetalleAlturaMinima := 200;
  DBEFPortesChange(Sender); {Ejecuto para reestablecer la visibilidad de rango e indice de portes}

  with DBGFDetalle1 do
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

  // Color campo ID
  ColorCampoID(DBERIG);
  ColorCampoID(EFSERIE);
  ColorCampoID(DBEFolio);
  ColorCampoID(DBEFolioRef);

  // Restringimos edicion de fecha segun parametros
  HabilitaEdit(DBDTPFecha, (LeeParametro('FACFECH001') <> 'S'));
  HabilitaEdit(DBTPHora, (LeeParametro('FACFECH001') <> 'S'));
  HabilitaEdit(DBDTPEntrega, (LeeParametro('FACFECH002') <> 'S'));
  HabilitaEdit(DBDFContable, (LeeParametro('FACFECH003') <> 'S'));

  TSDirManual.TabVisible := (LeeParametro('VENDIRM001') = 'S');

  // Muestra tabla por defecto
  if (LeeParametro('DOCCONF001') = 'S') then
     PCMain.ActivePage := TSTabla;

  with DBGMain do
  begin
     i := CamposAMarcar.IndexOf('MODIFICA_DOC');
     if (i >= 0) and (CamposChecked.Count >= i - 1) then
        CamposChecked[i] := '1';
  end;

  AbreOCierra;
end;

procedure TFMFacturas.FormDestroy(Sender: TObject);
begin
  inherited;
  MTelefonos.Free;
  MNotas.Free;
  CierraData(DMFacturas);
end;

procedure TFMFacturas.DBGFDetalle1Busqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_VENTAS') then
     begin
        if DBCHKAbono.Checked = True then
           CondicionBusqueda :=
              'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
              REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
              'FAMILIA=''' + REntorno.FamSistema + ''''
        else
        begin
           CondicionBusqueda :=
              'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
              REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
              'FAMILIA<>''' + REntorno.FamSistema + '''';

           if (Param_ARTBUSQ003) then
           begin
              CondicionBusqueda := CondicionBusqueda + ' AND ( (ARTICULO = ''' + REntorno.ArtTextoLibre + ''') ';
              CondicionBusqueda := CondicionBusqueda + '    OR (ARTICULO IN (SELECT ARTICULO FROM ART_ARTICULOS_CODCLI WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND CLIENTE = ' + DMFacturas.QMCabeceraCLIENTE.AsString + '))';
              CondicionBusqueda := CondicionBusqueda + '     )';
           end;
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
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMFacturas.QMDetalleTIPO_IVA.AsInteger);
           if (Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMFacturas.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
        end;

        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if (Trim(TablaABuscar) = 'SYS_TERCEROS_DIRECCIONES') then
     begin
        CondicionBusqueda := 'TERCERO = ' + DMFacturas.QMCabeceraTERCERO.AsString + ' AND ACTIVO = 1';
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
     else if Trim(TablaABuscar) = 'SYS_TIPO_LINEA_VENTA_KRI' then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ID';
     end
     else if Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(ARTICULO=''' + DMFacturas.QMDetalleARTICULO.AsString + ''')';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO,TIPO';
     end
     else if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
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
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMFacturas.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
  SolapaControles(SBAProyecto, EProyectoChile);
end;

procedure TFMFacturas.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMFacturas.BTNInfoTerc_CliClick(Sender: TObject);
begin
  Beep;
end;

procedure TFMFacturas.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  // Se quita el filtro por Numero de Serie
  // BusquedaComleja() ya recra el SelectSQL - DMAlbaranes.BuscaNumSerie(NumSerie, False);
  TButtBuscarNumSerie.Down := False;

  Resultado := DMFacturas.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else
  if (Resultado in [mrAll]) then
  begin
     DMFacturas.Filtrado := False;
     FiltroListadoFiltrado := 0;
  end;

  Continua := False;

  ActualizaTicketBAI;
  PCMainChange(Sender);

  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
end;

procedure TFMFacturas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
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
  // bit 1 = 0 --> Facturas restringidas
  if (((REntorno.RestriccionDocumento and 1) = 0) and
     ((DMFacturas.xInfoActualizadaMODIFICA_DOC.AsInteger and 1) = 1)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if (Button = nbEdit) then
  begin
     DBCHKAbono.Enabled := DMFacturas.CompruebaAbono;
  end;

  {dji lrk kri}
  if ((Button in [nbInsert]) and (REntorno.AlmacenRestringido <> '')) then
     DBEFAlmacen.Text := REntorno.AlmacenRestringido;

  if (Button in [nbPost, nbDelete, nbCancel]) then
  begin
     HabilitaBotones;
     HabilitaCambioIVA;
  end;

  PNLOrtografia.Visible := (Button in [nbEdit]);
  RefrescaAvisos;

  if (Button = nbInsert) then
     if es_serie_rectificacion(EFSerie.Text) then
        if (DMFacturas.CreaFacturaRectificacion(EFSerie.Text, d_rig)) then
           FiltraFactura(REntorno.Ejercicio, EFSerie.Text, d_rig);
end;

procedure TFMFacturas.MuestraFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
  PlanTmp : string;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMFacturas.QMCabecera.SelectSQL);
     AbreData(TDMLstFactura, DMLstFactura);

     try
        with DMLstFactura do
        begin
           TempSql.AddStrings(QMCabecera.SelectSQL);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(SqlFiltro);

           // Utilizo la vista para listado
           QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_FACTURA', 'VER_CABECERAS_FACTURA_LST', [rfReplaceAll]);

           QMCabecera.Plan.Text := '';
           QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
           MostrarListadoFiltrado(Modo);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(TempSQL);
           QMCabecera.Plan.Text := PlanTmp;
        end;
     finally
        CierraData(DMLstFactura);
     end;
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;

  RefrescaAvisos;
end;

procedure TFMFacturas.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMFacturas.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  MargenMinimo := StrToFloatDef(LeeParametro('DOCMARG001', EFSerie.Text), -1);
  param_DOCMARG003 := (LeeParametro('DOCMARG003', EFSerie.Text) = 'S');
  param_FACPREC001 := (LeeParametro('FACPREC001', EFSerie.Text) = 'S');
  // Edicion de IVA habilitada en documentos de venta
  Param_VENTIVA001 := (LeeParametro('VENTIVA001', EFSerie.Text) = 'S');
  Param_ARTBUSQ003 := (LeeParametro('ARTBUSQ003', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005', EFSerie.Text), 0);
  Param_DOCPCOS001 := LeeParametro('FACPCOS001', EFSerie.Text);
  PNLRiesgo.Visible := (LeeParametro('VENRIES001') = 'S');
  param_FACMARG001 := (LeeParametro('FACMARG001', EFSerie.Text) = 'S');
  param_VENUSEC001 := (LeeParametro('VENUSEC001', EFSerie.Text) = 'S');
  param_VENUEXT001 := (LeeParametro('VENUEXT001', EFSerie.Text) = 'S');
  param_VENREST002 := (LeeParametro('VENREST002', EFSerie.Text) = 'S');

  param_FACVNIF001 := (LeeParametro('FACVNIF001', EFSerie.Text) = 'S');
  param_FACVNIF002 := (LeeParametro('FACVNIF002', EFSerie.Text) = 'S');

  param_FACINSE001 := (LeeParametro('FACINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_FACINSE001;
  DBERIG.ReadOnly := not param_FACINSE001;

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

  TicketBAI := (LeeParametro('MODREST027', EFSerie.Text) = 'S');
  LTicketBAI.Visible := TicketBAI;
  DBETicketBAI.Visible := TicketBAI;
  AEnvioTBAI.Visible := TicketBAI;
  AAnularTBAI.Visible := TicketBAI;

  EstableceVisibilidadCamposDetalle;
  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
end;

procedure TFMFacturas.EstableceVisibilidadCamposDetalle;
var
  i : integer;
  s : string;
begin
  // Busco columna Precio de Coste
  i := EncuentraField(DBGFDetalle1, 'P_COSTE');
  if (i >= 0) then
  begin
     with DBGFDetalle1.Columns.Items[i] do
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
  i := EncuentraField(DBGFDetalle1, 'DESCUENTO');
  if (i >= 0) then
  begin
     if param_VENREST002 then
     begin
        DBGFDetalle1.Columns.Items[i].ReadOnly := True;
        DBGFDetalle1.Columns.Items[i].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle1.Columns.Items[i].ReadOnly := False;
        DBGFDetalle1.Columns.Items[i].Color := clWindow;
     end;
  end;

  i := EncuentraField(DBGFDetalle1, 'DESCUENTO_2');
  if (i >= 0) then
  begin
     if param_VENREST002 then
     begin
        DBGFDetalle1.Columns.Items[i].ReadOnly := True;
        DBGFDetalle1.Columns.Items[i].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle1.Columns.Items[i].ReadOnly := False;
        DBGFDetalle1.Columns.Items[i].Color := clWindow;
     end;
  end;

  i := EncuentraField(DBGFDetalle1, 'DESCUENTO_3');
  if (i >= 0) then
  begin
     if param_VENREST002 then
     begin
        DBGFDetalle1.Columns.Items[i].ReadOnly := True;
        DBGFDetalle1.Columns.Items[i].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle1.Columns.Items[i].ReadOnly := False;
        DBGFDetalle1.Columns.Items[i].Color := clWindow;
     end;
  end;

  i := EncuentraField(DBGFDetalle1, 'TIPO_UNIDAD_LOGISTICA');
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Visible := (Param_SYSCONF005 <> 0);

  i := EncuentraField(DBGFDetalle1, 'UNIDADES_LOGISTICAS');
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Visible := (Param_SYSCONF005 <> 0);

  i := EncuentraField(DBGFDetalle1, 'TITULO_UNIDAD_LOGISTICA');
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Visible := (Param_SYSCONF005 <> 0);

  i := EncuentraField(DBGFDetalle1, 'MARGEN');
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Visible := param_FACMARG001
  else
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'MARGEN';
        Title.Caption := _('Margen');
        Visible := param_FACMARG001;
     end;
  end;

  i := EncuentraField(DBGFDetalle1, 'TITULO');
  if (i >= 0) then
  begin
     DBGFDetalle1.Columns.Items[i].Color := clWindow;
     DBGFDetalle1.Columns.Items[i].Title.Caption := _('Desc. Artículo');
     ACambiaTitulo.Hint := _('Mostrar títulos en el idioma');
     TButtCambiaDescripcion.Tag := 0;
  end
  else
  begin
     i := EncuentraField(DBGFDetalle1, 'TITULO_IDIOMA');
     if (i >= 0) then
     begin
        DBGFDetalle1.Columns.Items[i].Color := $00D6D6D6;
        DBGFDetalle1.Columns.Items[i].Title.Caption := _('Desc. Artículo');
        TButtCambiaDescripcion.Tag := 1;
        ACambiaTitulo.Hint := _('Mostrar títulos predeterminado');
     end
     else
     begin
        with DBGFDetalle1.Columns.Add do
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
  i := EncuentraField(DBGFDetalle1, 'UNIDADES');
  if (i < 0) then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'UNIDADES';
        Title.Caption := _('Unidades');
        Width := 60;
     end;
  end;
  }
  i := EncuentraField(DBGFDetalle1, 'UNIDADES');
  s := LeeParametro('VENUNID001', EFSerie.Text);
  if (i >= 0) and (s <> '') then
     DBGFDetalle1.FindColumn('UNIDADES').Title.Caption := s;

  i := EncuentraField(DBGFDetalle1, 'UNIDADES_SEC');
  if (i < 0) then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'UNIDADES_SEC';
        Title.Caption := _('Uds. Sec.');
        Width := 50;
     end;
  end;
  i := EncuentraField(DBGFDetalle1, 'UNIDADES_SEC');
  s := LeeParametro('VENUSEC002', EFSerie.Text);
  if (i >= 0) and (s <> '') then
     DBGFDetalle1.FindColumn('UNIDADES_SEC').Title.Caption := s;
  DBGFDetalle1.Columns.Items[i].Visible := REntorno.PVP_Ud_Sec or param_VENUSEC001;

  i := EncuentraField(DBGFDetalle1, 'APLICA_UNIDADES_SECUNDARIAS');
  if (i < 0) then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'APLICA_UNIDADES_SECUNDARIAS';
        Title.Caption := _('Apl. U.Sec.');
     end;
  end;
  i := EncuentraField(DBGFDetalle1, 'APLICA_UNIDADES_SECUNDARIAS');
  DBGFDetalle1.Columns.Items[i].Visible := REntorno.PVP_Ud_Sec or param_VENUSEC001;
  DBGFDetalle1.Columns.Items[i].Width := 40;

  i := EncuentraField(DBGFDetalle1, 'UE_MEDIDA1');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA1';
        Title.Caption := _('Medida 1');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Title.Caption := _('Medida 1');

  i := EncuentraField(DBGFDetalle1, 'UE_MEDIDA2');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA2';
        Title.Caption := _('Medida 2');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Title.Caption := _('Medida 2');

  i := EncuentraField(DBGFDetalle1, 'UE_MEDIDA3');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA3';
        Title.Caption := _('Medida 3');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Title.Caption := _('Medida 3');

  i := EncuentraField(DBGFDetalle1, 'UE_MEDIDA4');
  if (i < 0) and param_VENUEXT001 then
  begin
     with DBGFDetalle1.Columns.Add do
     begin
        FieldName := 'UE_MEDIDA4';
        Title.Caption := _('Medida 4');
        Width := 50;
     end;
  end;
  if (i >= 0) then
     DBGFDetalle1.Columns.Items[i].Title.Caption := _('Medida 4');

  // Asigno nombre a campos ALFA
  with DBGFDetalle1 do
  begin
     for i := 1 to 8 do
     begin
        if (EncuentraField(DBGFDetalle1, Format('ALFA_%d', [i])) >= 0) then
        begin
           FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
           if (FindColumn(Format('ALFA_%d', [i])).Title.Caption = '') then
              FindColumn(Format('ALFA_%d', [i])).Title.Caption := Format(_('Campo %d'), [i]);
        end;
     end;

     for i := 1 to 4 do
     begin
        if (EncuentraField(DBGFDetalle1, Format('UE_MEDIDA%d', [i])) >= 0) then
        begin
           FindColumn(Format('UE_MEDIDA%d', [i])).Title.Caption := LeeParametro(format('UDEDESC%3.3d', [i]));
           if (FindColumn(Format('UE_MEDIDA%d', [i])).Title.Caption = '') then
              FindColumn(Format('UE_MEDIDA%d', [i])).Title.Caption := Format(_('Medida %d'), [i]);
        end;
     end;

     i := EncuentraField(DBGFDetalle1, 'PRO_NUM_PLANO');
     s := LeeParametro('LABPNPL001', EFSerie.Text);
     if (i >= 0) and (s <> '') then
        DBGFDetalle1.FindColumn('PRO_NUM_PLANO').Title.Caption := s;

     i := EncuentraField(DBGFDetalle1, 'NO_FABRICACION_KRI');
     s := LeeParametro('LABFABK001', EFSerie.Text);
     if (i >= 0) and (s <> '') then
        DBGFDetalle1.FindColumn('NO_FABRICACION_KRI').Title.Caption := s;

     if (EncuentraField(DBGFDetalle1, 'STOCK_REAL') >= 0) then
     begin
        FindColumn('STOCK_REAL').Title.Caption := _('S. Real');
        FindColumn('STOCK_REAL').Visible := (LeeParametro('FACSTKR009', EFSerie.Text) = 'S');
     end
     else
     begin
        with DBGFDetalle1.Columns.Add do
        begin
           FieldName := 'STOCK_REAL';
           Title.Caption := _('S. Real');
           Visible := (LeeParametro('FACSTKR009', EFSerie.Text) = 'S');
        end;
     end;
  end;
end;

procedure TFMFacturas.FormActivate(Sender: TObject);
begin
  inherited;

  EstableceVisibilidadCamposDetalle;

  LBLCertificado.Visible := (PCDetalle.ActivePage = TSArticulosCertificados);
  DBECertificadoAnt.Visible := (PCDetalle.ActivePage = TSArticulosCertificados);
end;

procedure TFMFacturas.ANotasDetalleExecute(Sender: TObject);
begin
  DMFacturas.PreparaNotasDetalle;
  // DMFacturas.NotasLote := True;
  EditarCampoNotas(Self, DMFacturas.DSQMDetalle, DMFacturas.QMDetalleNOTAS, DMFacturas.QMDetalleNOTAS2, (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMFacturas.AInfoStocksExecute(Sender: TObject);
begin
  MuestraStock(0);
end;

procedure TFMFacturas.AProcedenciaExecute(Sender: TObject);
begin
  DMFacturas.Procedencia;
end;

procedure TFMFacturas.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (Editando) then
     DMFacturas.RefrescaTabla;
end;

procedure TFMFacturas.AUnidadesExtExecute(Sender: TObject);
begin
  if DBGFDetalle1.SelectedField.FieldName = 'UNIDADES' then
     DBGFDetalle1.SelectedIndex := DBGFDetalle1.SelectedIndex + 1;

  DMFacturas.CambiaUnidadesExt(DMFacturas.QMDetalleARTICULO, True, True);
end;

procedure TFMFacturas.APreciosTarifaExecute(Sender: TObject);
begin
  DMFacturas.CambiaPreciosTarifa;
end;

procedure TFMFacturas.HabilitaCambioIVA;
begin
  ATipoIVA.Enabled := DMFacturas.Habilitar_but_cambia_iva;
end;

procedure TFMFacturas.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if not (Button in [nbPost, nbDelete, nbCancel]) then
     HabilitaCambioIVA;

  HabilitaBotonesDetalle;

  if Button in [nbRefresh] then
     DMFacturas.RellenaDatosOldLinea;
end;

procedure TFMFacturas.AInfoHistoricoExecute(Sender: TObject);
begin
  DMFacturas.Historico;
end;

procedure TFMFacturas.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     DMFacturas.BorraLineaUnidadesExt;
  if Button = nbDelete then
     DMFacturas.ControlaRestriccion;
end;

procedure TFMFacturas.DBGFDetalle1ColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;

  if (DBGFDetalle1.SelectedField.FieldName = 'ARTICULO') then
  begin
     DBGDetalleArticulo := '';
     FMain.AddComponentePunto(DBGFDetalle1);
  end
  else
     FMain.DelComponentePunto(DBGFDetalle1);

  if ((DBGFDetalle1.ColumnaActual = 'TIPO_IVA') or
     (DBGFDetalle1.ColumnaActual = 'PROYECTO')) then
     DBGFDetalle1.BuscarNums := False
  else
     DBGFDetalle1.BuscarNums := True;
end;

procedure TFMFacturas.ASerializacionExecute(Sender: TObject);
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado, Devolucion : integer;
  Ejercicio : smallint;
  Fecha : TDateTime;
  Unidades : double;
begin
  DMFacturas.PreparaSerializacion;
  if not DMFacturas.Serializado then
     ShowMessage(_('El artículo no está serializado'))
  else
  begin
     DMFacturas.DatosSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo,
        Rig, Linea, Devolucion, Fecha, Unidades, Estado);

     MuestraSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig, Linea,
        Devolucion, Fecha, Unidades, Estado, Self);
  end;
end;

procedure TFMFacturas.DBGFDetalle1CampoDevuelve(Sender: TObject; valor: string);
begin
  {
  if (DBGFDetalle1.SelectedField.FieldName = 'ARTICULO') then
     DMFacturas.BusquedaArticulo(valor);
  DMFacturas.Continua;
  }
end;

procedure TFMFacturas.DBGFDetalle1Existe(Sender: TObject);
begin
  //if DBGFDetalle1.ColumnaActual = 'ARTICULO' then
  //DMFacturas.VaciaNumSerie;
end;

procedure TFMFacturas.ABuscarNumSerieExecute(Sender: TObject);
var
  FMBusquedaNumSerie : TFMBusquedaNumSerie;
begin
  if (TButtBuscarNumSerie.Down) then
  begin
     FMBusquedaNumSerie := TFMBusquedaNumSerie.Create(Self);
     if (FMBusquedaNumSerie.ShowModal = mrOk) then
     begin
        NumSerie := FMBusquedaNumSerie.EFNumSerie.Text;
        if (NUmSerie <> '') then
        begin
           DMFacturas.Filtrado := False;
           DMFacturas.BuscaNumSerie(NumSerie, True);
        end;
     end;
  end
  else
     DMFacturas.BuscaNumSerie(NumSerie, False);
  try
     TButtBuscarNumSerie.Down := False;
  finally
  end;

  HabilitaBotones;
end;

procedure TFMFacturas.NavDetalleChangeState(Sender: TObject);
begin
  HabilitaBotonesDetalle;

  DBGFDetalle1.ColumnaInicial := EncuentraField(DBGFDetalle1, 'ARTICULO');
end;

procedure TFMFacturas.APVPExecute(Sender: TObject);
var
  PVP : double;
begin
  with DMFacturas do
  begin
     if (DameEstado = 0) then
     begin
        // PVP := TFPregPVP.Create(Self).mostrar;
        PVP := 0;
        PideDato('DBL', PVP, _('P.V.P.'));
        if (PVP > 0) then
        begin
           Calcula_Unidades := False;
           CalculaUnidades(PVP);
           Calcula_Unidades := True;
        end;
     end;
  end;
end;

procedure TFMFacturas.ANIFFacturaExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFactura;
begin
  DMFacturas.AbreQMNif;
  if DMFacturas.DameDatosClientes then
  begin
     FPregDatos := TFPregNIFFACTURA.Create(Self);
     FPregDatos.Inicializa(DMFacturas.DSQMNIF, _('Datos del Cliente'),
        DMFacturas.EstadoDocumento);
     DMFacturas.GrabaDatosCliente(FPregDatos.ShowModal);
     FreeAndNil(FPregDatos);
  end;
  DMFacturas.CierraQMNif;
  DMFacturas.RefrescaCabecera(1);
end;

procedure TFMFacturas.AgrupacionPedidosFac(Serie: string; Contador: integer);
begin
  // Abrimos las facturas destino de la agrupación de pedidos
  DMFacturas.AgrupacionPedidosFac(Serie, Contador);
  EFSerie.Text := Serie;

  // Para refrescar el navegador, si el usuario es restringido
  NavMainClickAfterAdjust(Self, nbRefresh);
  RefrescaAvisos;
end;

procedure TFMFacturas.ARegistroIVAExecute(Sender: TObject);
begin
  if ((DMFacturas.QMCabeceraESTADO.AsInteger = 5) or
     (DMFacturas.QMCabeceraESTADO.AsInteger = 6)) then
     FMain.MuestraIVA('EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + DMFacturas.DameEjercicio + ' AND CANAL=' + REntorno.CanalStr + ' AND REGISTRO=' + DMFacturas.ObtieneRegistroIVA, 'R');
end;

procedure TFMFacturas.SBVerRegistroDblClick(Sender: TObject);
begin
  ARegistroIVA.Execute;
end;

procedure TFMFacturas.AAsientoFacturaExecute(Sender: TObject);
begin
  if (DMFacturas.QMCabeceraESTADO.AsInteger = 5) then
     FMain.MuestraMovConta(' RIC= ' + DMFacturas.QMCabeceraRIC.AsString +
        ' and ejercicio=' + DMFacturas.DameEjercicio);
end;

procedure TFMFacturas.SBVerAsientosDblClick(Sender: TObject);
begin
  AAsientoFactura.Execute;
end;

procedure TFMFacturas.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  EFSerie.Text := Serie;
  DMFacturas.FiltraCabecera(Ejercicio, Serie, Rig);
  HabilitaBotones;
  RefrescaAvisos;
  PCMainChange(nil);
end;

procedure TFMFacturas.ACentroCosteExecute(Sender: TObject);
begin
  DMFacturas.PedirCentroCoste;
end;

procedure TFMFacturas.DBGFDetalle1RowChange(Sender: TObject);
begin
  DBGDetalleArticulo := '';
  // dji lrk kri Acá tengo que ver si la cuenta tiene Centro de Costos.
  // ACentroCosteExecute(Sender);
end;

procedure TFMFacturas.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);

  DMFacturas.MascarasMoneda;
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

procedure TFMFacturas.ANewClienteExecute(Sender: TObject);
begin
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

procedure TFMFacturas.ANewAgenteExecute(Sender: TObject);
begin
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

        DBEFFormaPago.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMFacturas.ANewArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     try
        FMain.EjecutaAccion(FMain.AArticulos);
        if FMain.EnlaceDatos <> Null then
        begin
           DMFacturas.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
        end;
        DBGFDetalle1.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMFacturas.AAClienteExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdCabecera.Enabled then
     begin
        if EFCliente.Text <> '' then
           FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + EFCliente.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMFacturas.QMCabeceraCLIENTE.AsInteger));
end;

procedure TFMFacturas.AAAgenteExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdCabecera.Enabled then
     begin
        if EFAgente.Text <> '' then
           FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + EFAgente.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + IntToStr(DMFacturas.QMCabeceraAGENTE.AsInteger));
end;

procedure TFMFacturas.SBAClienteDblClick(Sender: TObject);
begin
  AACliente.Execute;
end;

procedure TFMFacturas.SBAAgenteDblClick(Sender: TObject);
begin
  AAAgente.Execute;
end;

procedure TFMFacturas.HabilitaEnlaces;
begin
  SolapaControles(SBVerRegistro, DBERegistroIVA);
  SolapaControles(SBVerAsientos, DBERIC);
  SolapaControles(SBVerCartera, DBERegistroCartera);
  DBERegistroIVA.Color := REntorno.ColorEnlaceActivo;
  DBERIC.Color := REntorno.ColorEnlaceActivo;
  DBERegistroCartera.Color := REntorno.ColorEnlaceActivo;

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

  EProyecto.Color := REntorno.ColorEnlaceActivo;
  EProyectoChile.Color := REntorno.ColorEnlaceActivo;
  if (PCMain.ActivePage = TSFicha) then
     SolapaControles(SBAProyecto, EProyectoChile)
  else
     SolapaControles(SBAProyecto, EProyecto);
end;

procedure TFMFacturas.DBETituloClienteEnter(Sender: TObject);
begin
  EFCliente.SetFocus;
end;

procedure TFMFacturas.ETituloAgenteEnter(Sender: TObject);
begin
  if (EFAgente.Enabled) then
     EFAgente.SetFocus;
end;

procedure TFMFacturas.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbInsert) then
     DBCHKAbono.Enabled := True;

  if ((Button = nbDelete) and (DMFacturas.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMFacturas.DBGFDetalle1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  HabilitaBotonesDetalle;
end;

procedure TFMFacturas.HabilitaBotones;
var
  Habilitado : boolean;
begin
  Habilitado := DMFacturas.HayDocumentos;

  AFacturaMulti.Enabled := Habilitado;
  ADuplicar.Enabled := Habilitado;
  ACondicionesClientes.Enabled := Habilitado;
  ADevolucion.Enabled := Habilitado;
  ACierraMasivo.Enabled := Habilitado;
  ARefrescaDetalle.Enabled := Habilitado;
  ACambiaFinanciacion.Enabled := Habilitado;
  AHerencia.Enabled := Habilitado;
  ARecibos.Enabled := Habilitado;
  {dji lrk kri}
  EFSerie.Enabled := REntorno.SerieRestringida = '';
  DBEFAlmacen.Enabled := REntorno.AlmacenRestringido = '';

  // Parametro DOCPREC001 - Precio en documentos de venta modificable
  if (LeeParametro('DOCPREC001', DMFacturas.QMDetalleSERIE.AsString) = 'N') then
     HabilitaColumna(DBGFDetalle1, 'PRECIO', False);
  RefrescaAvisos;
end;

procedure TFMFacturas.AbreOCierra;
begin
  with AAbrirCerrar do
  begin
     if (DMFacturas.EstadoDocumento = 5) then
     begin
        Hint := _('Abre y desbloquea el documento (Ctrl+Alt+F)');
        ImageIndex := 67;
        Tag := 1;
        Caption := _('Abrir Factura');
     end
     else
     begin
        Hint := _('Cierra y bloquea el documento (Ctrl+Alt+F)');
        ImageIndex := 68;
        Tag := 0;
        Caption := _('Cerrar Factura');
     end;

     if (DMFacturas.EstadoDocumento = 6) then
        Enabled := False
     else
        Enabled := DMFacturas.HayDocumentos;
  end;

  HabilitaBotonesDetalle;
  HabilitaCertificacion;

  ColorSegunEstado(DBETituloEstado, DMFacturas.EstadoDocumento);
end;

procedure TFMFacturas.HabilitaBotonesDetalle;
var
  Habil, HabilEd, Habilitado : boolean;

begin
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMFacturas.HayDetalle) or (DMFacturas.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMFacturas.QMDetalle.State in [dsInsert, dsEdit]);

  TButtNotas.Enabled := HabilEd;
  TButtInfStocks.Enabled := Habil;
  TButtProcedencia.Enabled := HabilEd;
  TButtUnidadesExt.Enabled := HabilEd;
  TButtPrecios.Enabled := Habil;
  TButtInfoHistorico.Enabled := Habil;
  TButtSerializacion.Enabled := HabilEd;
  TBInfolotes.Enabled := HabilEd;
  AOrdenaLineas.Enabled := Habil;
  TBArtCli.Enabled := Habil;
  ACambiaTitulo.Enabled := HabilEd;
  TButtMuestraUbicacion.Enabled := Habil;
  TButtBuscarArticulo.Enabled := True;   // Siempre habilitado
  TButtImportarDetalle.Enabled := True;  // Siempre Activo

  if (DMFacturas.QMDetalle.State in [dsInsert, dsBrowse]) then
     HabilitaCambioIVA;

  // Controlamos que se pueda modificar el precio de venta + descuentos + tipo IVA
  Habilitado := (DMFacturas.QMDetalleARTICULO.AsString = REntorno.ArtTextoLibre) or (DMFacturas.xArticulos.Active and (DMFacturas.xArticulos.FieldByName('TIPO_ARTICULO').AsString = 'DTO')) or param_FACPREC001;
  HabilitaColumna(DBGFDetalle1, 'PRECIO', Habilitado);
  HabilitaColumna(DBGFDetalle1, 'DESCUENTO', Habilitado and (not param_VENREST002));
  HabilitaColumna(DBGFDetalle1, 'DESCUENTO_2', Habilitado and (not param_VENREST002));
  HabilitaColumna(DBGFDetalle1, 'DESCUENTO_3', Habilitado and (not param_VENREST002));
  // En el caso del Tipo de IVA también tenemos que ver el parámetro VENTIVA001
  HabilitaColumna(DBGFDetalle1, 'TIPO_IVA', Habilitado and Param_VENTIVA001);
end;

procedure TFMFacturas.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMFacturas.MuestraResumenFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMFacturas.QMCabecera.SelectSQL);
     AbreData(TDMLstFacturaCli, DMLstFacturaCli);
     try
        with DMLstFacturaCli do
        begin
           TempSql.AddStrings(QMCabecera.SelectSQL);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(SqlFiltro);

           // Utilizo la vista para listado
           QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_FACTURA', 'VER_CABECERAS_FACTURA_LST', [rfReplaceAll]);

           if ExisteParametro(QMCabecera, 'SERIE') then
              QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
           MostrarListadoFiltrado(Modo, FiltroListadoFiltrado, EFSerie.Text);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(TempSQL);
        end;
     finally
        CierraData(DMLstFacturaCli);
     end;
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMFacturas.AInfoLotesExecute(Sender: TObject);
begin
  DMFacturas.InfoLotes;
end;

procedure TFMFacturas.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMFacturas.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMFacturas.DBGFDetalle1DblClick(Sender: TObject);
var
  CodigoCliente : string;
begin
  if DMFacturas.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;

     if ((UpperCase(ColActual.FieldName) = 'ID_LOTE') or (UpperCase(ColActual.FieldName) = 'LOTE')) then
        FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(DMFacturas.QMDetalleID_LOTE.AsInteger));

     if (UpperCase(ColActual.FieldName) = 'CODIGO_CLIENTE') then
     begin
        CodigoCliente := DMFacturas.QMDetalleCODIGO_CLIENTE.AsString;
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
                 Params.ByName['EMPRESA'].AsInteger := DMFacturas.QMDetalleEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := DMFacturas.QMDetalleARTICULO.AsString;
                 Params.ByName['CLIENTE'].AsInteger := DMFacturas.QMCabeceraCLIENTE.AsInteger;
                 Params.ByName['CODIGO_CLIENTE'].AsString := CodigoCliente;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           DMFacturas.QMDetalle.Refresh;
        end;
     end;

     // Si la factura está cerrada, preguntamos el valor de Precio de Coste y Coste Adicional.
     if (DMFacturas.QMCabeceraESTADO.AsInteger = 5) then
     begin
        if ((Param_DOCPCOS001 = 'V') and (UpperCase(ColActual.FieldName) = 'P_COSTE')) then
           ACambioPCosteLinea.Execute;

        if (UpperCase(ColActual.FieldName) = 'COSTE_ADICIONAL') then
           ACambioCosteAdicionalLinea.Execute;
     end;
  end;
end;

procedure TFMFacturas.AArtCliExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMFacturas.QMDetalleARTICULO.AsString, 1);
end;

procedure TFMFacturas.ACliArtExecute(Sender: TObject);
begin
  inherited;
  TFMVentasCli.Create(Self).MuestraCliente(DMFacturas.QMCabeceraCLIENTE.AsInteger, 2);
end;

procedure TFMFacturas.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMFacturas.RelojNotasTimer(Sender: TObject);
begin
  if (LNotas.Color = clYellow) then
     LNotas.Color := TBMain.Color
  else
     LNotas.Color := clYellow;
end;

procedure TFMFacturas.AInformeFacturaExecute(Sender: TObject);
begin
  AInformeFactura.Enabled := False;
  try
     DMFacturas.ImprimirDocumento(0);
  finally
     AInformeFactura.Enabled := True;
  end;
end;

procedure TFMFacturas.AInformeFactura2Execute(Sender: TObject);
begin
  DMFacturas.ImprimirDocumento(0, 2);
end;

procedure TFMFacturas.AInformeFactura3Execute(Sender: TObject);
begin
  DMFacturas.ImprimirDocumento(0, 3);
end;

procedure TFMFacturas.AInformeFactura4Execute(Sender: TObject);
begin
  DMFacturas.ImprimirDocumento(0, 4);
end;

procedure TFMFacturas.EFClienteExiste(Sender: TObject);
var
  Seguir : boolean;
  NIF, ResultadoValidacion, ResultadoValidacionNombre : string;
  ResultadoFechaComprobacion : TDateTime;
begin
  Seguir := True;
  if (not DMMain.ClienteValido(StrToIntDef(EFCliente.Text, 0))) then
     Seguir := False
  else
  begin
     if param_FACVNIF002 and (REntorno.Pais = 'ESP') and (DMMain.UtilizaVerifactu or DMMain.UtilizaSII) then
     begin
        DMMain.ValidacionTercero(DMFacturas.QMCabeceraTERCERO.AsInteger, NIF, ResultadoValidacion, ResultadoValidacionNombre, ResultadoFechaComprobacion);

        if ((Trim(NIF) > '') and (ResultadoValidacion <> 'VALIDO') and (ResultadoValidacion <> 'IDENTIFICADO')) then
           Seguir := ConfirmaMensaje(_('El documento identificativo no esta marcado como Valido. ¿Desea Seguir?') + #13#10 + #13#10 +
              format(_('Resultado: %s'), [ResultadoValidacion]) + #13#10 +
              format(_('Razón social: %s'), [ResultadoValidacionNombre]) + #13#10 +
              format(_('Fecha comprobacion: %s'), [FormatDateTime(ShortDateFormat, ResultadoFechaComprobacion)]));
     end;
  end;

  if Seguir then
  begin
     DBEFContacto.CondicionBusqueda := 'TERCERO=' + DMFacturas.xCliente.FieldByName('TERCERO').AsString;
     DBEFContacto.OrdenadoPor.Text := 'CONTACTO';
     LTelefono.Caption := DMMain.DameTelefonoTercero(DMFacturas.QMCabeceraTERCERO.AsInteger);
  end
  else
     EFCliente.Text := '';
end;

procedure TFMFacturas.ExportarficheroEDI1Click(Sender: TObject);
var
  empresa : integer;
  ejercicio : integer;
  canal : integer;
  serie : string;
  tipo : string;
  rig : integer;
begin
  AbreData(TDMExportaFacturaEDI, DMExportaFacturaEDI);
  with DMFacturas do
  begin
     empresa := QMCabeceraEMPRESA.AsInteger;
     ejercicio := QMCabeceraEJERCICIO.AsInteger;
     canal := QMCabeceraCANAL.AsInteger;
     serie := QMCabeceraSERIE.AsString;
     tipo := QMCabeceraTIPO.AsString;
     rig := QMCabeceraRIG.AsInteger;
  end;
  DMExportaFacturaEDI.Exporta(empresa, ejercicio, canal, serie, tipo, rig);
  CierraData(DMExportaFacturaEDI);
end;

procedure TFMFacturas.AFacturasDiariasExecute(Sender: TObject);
begin
  AbreData(TDMLstFactura, DMLstFactura);
  try
     DMLstFactura.MostrarListadoDiario(EFSerie.Text, DMFacturas.QMCabeceraEJERCICIO.AsInteger);
  finally
     CierraData(DMLstFactura);
  end;
end;

procedure TFMFacturas.AVisualizarFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMFacturas.AImprimirFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
  // Refresco valor de check del estado listado
  DMFacturas.InfoActualiza;
end;

procedure TFMFacturas.AVisualizarMailExecute(Sender: TObject);
var
  Memo : TStrings;
begin
  AbreData(TDMLstFactura, DMLstFactura);
  try
     Memo := TStringList.Create;
     DMLstFactura.MostrarListadoMail(DMFacturas.QMCabeceraID_S.AsInteger, EFSerie.Text,
        0, DMFacturas.QMCabeceraEJERCICIO.AsInteger, Memo, False);

     // Marco el documento como listado
     DMLstFactura.UpdateaDocumentos;
  finally
     Memo.Free;
     CierraData(DMLstFactura);
  end;

  // Refresco valor de check del estado listado
  DMFacturas.InfoActualiza;
end;

procedure TFMFacturas.AEnviarFacturaMailExecute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
  DMListadosCargado, DMLstFacturaCargado : boolean;
begin
  // esto es porque el assigned no va

  DMLstFacturaCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la factura por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstFactura, DMLstFactura);
           DMLstFacturaCargado := True;

           Memo := TStringList.Create;
           try
              DMLstFactura.MostrarListadoMail(DMFacturas.QMCabeceraID_S.AsInteger, EFSerie.Text, 1,
                 DMFacturas.QMCabeceraEJERCICIO.AsInteger, Memo, (LeeParametro('FACLSTM001') = 'S'));
              CierraData(DMLstFactura);
              DMLstFacturaCargado := False;

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMFacturas.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMFacturas.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMFacturas.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMFacturas.QMCabeceraRIG.AsInteger;
                 Fecha := DMFacturas.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMFacturas.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := DMFacturas.QMCabeceraPEDIDO_CLIENTE.AsString;
                 Folio := IntToStr(DMFacturas.QMCabeceraFOLIO.AsInteger);
                 TituloDocTributario := DameTituloTipoDocTributario(DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString);
                 NombreFichero := DMLstFactura.nombreFich;
                 Matricula := DMMain.DameMatriculaFichaTecnica(DMFacturas.QMCabeceraID_FICHA_TECNICA.AsInteger);
                 if (DMFacturas.QMCabeceraCLIENTE.AsInteger > 0) then
                 begin
                    NombreComercial := DMFacturas.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMFacturas.QMCabeceraTITULO.AsString;
                    RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturas.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 DMListados.SendMailCliente(DMFacturas.QMCabeceraCLIENTE.AsInteger, Memo, Asunto, DMMain.DameCorreoCopiaAgente(DMFacturas.QMCabeceraAGENTE.AsInteger, 'FAC'));
              finally
                 CuerpoMail.Free;
              end;
              // Marco el documento como listado
              DMLstFactura.UpdateaDocumentos;
           finally
              Memo.Free;
           end;
           CierraData(DMListados);
           DMLstFacturaCargado := False;
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
           if DMListadosCargado then
              CierraData(DMLstFactura);
           if DMLstFacturaCargado then
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
  DMFacturas.InfoActualiza;
end;

procedure TFMFacturas.AResumenFacturasExecute(Sender: TObject);
begin
  AbreData(TDMLstFacturaCli, DMLstFacturaCli);
  TFMLSTEntreFechasCli.Create(Self).Muestra('FAC', EFSerie.Text);
  CierraData(DMLstFacturaCli);
end;

procedure TFMFacturas.AResumenFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraResumenFiltrado(0);
end;

procedure TFMFacturas.AImprimirResumenFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraResumenFiltrado(1);
end;

procedure TFMFacturas.AListadoArticulosExecute(Sender: TObject);
begin
  AbreData(TDMLstFacturaArt, DMLstFacturaArt);
  try
     TFMLstEntreFechasArt.Create(Self).Muestra('FAC', EFSerie.Text, DBEFAlmacen.Text);
  finally
     CierraData(DMLstFacturaArt);
  end;
end;

procedure TFMFacturas.ARecibosDeLaFacturaExecute(Sender: TObject);
begin
  DMFacturas.ListadoRecibos(EFSerie.Text, 1); // Prev. (0) / Imprimir (1) Recibo
end;

procedure TFMFacturas.ARecibosFacturasExecute(Sender: TObject);
begin
  TFPregRecibosFacturas.Create(Self).Mostrar;
end;

procedure TFMFacturas.AEtiquetasExecute(Sender: TObject);
begin
  DMFacturas.Etiquetas(EFSerie.Text);
end;

procedure TFMFacturas.AConfFacturasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFactura, DMLstFactura);
  try
     TFMListConfig.Create(Self).Muestra(36, formato, cabecera, copias,
        pijama, EFSerie.Text, DMLstFactura.frFactura, DMLstFactura.HYReport,
        DMLstFactura.HYReportMail);
  finally
     CierraData(DMLstFactura);
  end;
end;

procedure TFMFacturas.AConfFacturasFechaClienteExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFacturacli, DMLstFacturacli);
  try
     TFMListConfig.Create(Self).Muestra(47, formato, cabecera, copias,
        pijama, EFSerie.Text, DMLstFacturacli.frFactura);
  finally
     CierraData(DMLstFacturacli);
  end;
end;

procedure TFMFacturas.AConfFacturasArticuloExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFacturaArt, DMLstFacturaArt);
  try
     TFMListConfig.Create(Self).Muestra(48, formato, cabecera, copias,
        pijama, EFSerie.Text, DMLstFacturaArt.frFactura);
  finally
     CierraData(DMLstFacturaArt);
  end;
end;

procedure TFMFacturas.AConfRecibosFacturasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
  try
     TFMListConfig.Create(Self).Muestra(1, Formato, Cabecera, Copias, Pijama,
        EFSerie.Text, DMLstCarteraRecibos.frRecibos, DMLstCarteraRecibos.HYRRecibos);
  finally
     CierraData(DMLstCarteraRecibos);
  end;
end;

procedure TFMFacturas.AConfEtiquetasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFacturasEti, DMLstFacturasEti);
  try
     TFMListConfig.Create(Self).Muestra(60, formato, cabecera, copias,
        pijama, EFSerie.Text, DMLstFacturasEti.frFacturas);
  finally
     CierraData(DMLstFacturasEti);
  end;
end;

procedure TFMFacturas.ACambiarNombreExecute(Sender: TObject);
begin
  if EFCliente.CampoStr = 'TITULO' then
  begin
     EFCliente.CampoStr := 'NOMBRE_COMERCIAL';
     TBCambiarNombre.Hint := _('Cambiar a Nombre');
     ACambiarNombre.Caption := _('Cambiar a Nombre');
     ACambiarNombre.Hint := _('Cambiar a Nombre');
     DBETituloCliente.DataField := 'NOMBRE_COMERCIAL';
  end
  else
  begin
     EFCliente.CampoStr := 'TITULO';
     TBCambiarNombre.Hint := _('Cambiar a Nombre Comercial');
     ACambiarNombre.Caption := _('Cambiar a Nombre Comercial');
     ACambiarNombre.Hint := _('Cambiar a Nombre Comercial');
     DBETituloCliente.DataField := 'TITULO';
  end;
end;

procedure TFMFacturas.AAbrirCerrarExecute(Sender: TObject);
var
  Seguir : boolean;
  NIF, ResultadoValidacion, ResultadoValidacionNombre : string;
  ResultadoFechaComprobacion : TDateTime;
begin
  if Confirma then
  begin
     if (AAbrirCerrar.Tag = 0) then
     begin
        Seguir := True;

        { TODO : Pasar esta verificacion a FAP / FCR si utilizan SII }

        if param_FACVNIF002 and (REntorno.Pais = 'ESP') and (DMMain.UtilizaVerifactu or DMMain.UtilizaSII) then
        begin
           if (DMFacturas.QMCabeceraTERCERO.AsInteger > 0) then
              DMMain.ValidacionTercero(DMFacturas.QMCabeceraTERCERO.AsInteger, NIF, ResultadoValidacion, ResultadoValidacionNombre, ResultadoFechaComprobacion)
           else
              DMMain.ValidacionTerceroVarios(DMFacturas.QMCabeceraID_S.AsInteger, NIF, ResultadoValidacion, ResultadoValidacionNombre, ResultadoFechaComprobacion);

           if ((Trim(NIF) > '') and (ResultadoValidacion <> 'VALIDO') and (ResultadoValidacion <> 'IDENTIFICADO')) then
              Seguir := ConfirmaMensaje(_('El documento identificativo no esta marcado como Valido. ¿Desea Seguir?') + #13#10 + #13#10 +
                 format(_('Resultado: %s'), [ResultadoValidacion]) + #13#10 +
                 format(_('Razón social: %s'), [ResultadoValidacionNombre]) + #13#10 +
                 format(_('Fecha comprobacion: %s'), [FormatDateTime(ShortDateFormat, ResultadoFechaComprobacion)]));
        end;

        if Seguir then
        begin
           // Generamos la factura electrónica de Mexico
           if (DMMain.EstadoKri(412) = 1) then
           begin
              AbreData(TDMFacturaElectronicaMx, DMFacturaElectronicaMx);
              DMFacturaElectronicaMx.AbrirActual(DMFacturas.QMCabeceraID_S.AsInteger, 1);
              CierraData(DMFacturaElectronicaMx);
           end;

           // Cerramos la factura
           Screen.Cursor := crHourGlass;
           try
              DMFacturas.CierraFactura;
           finally
              ActualizaTicketBAI;
              if (PCMain.ActivePage = TSVerifactu) then
              begin
                 DMFacturas.xVerifactu.Close;
                 DMFacturas.xVerifactu.Open;
                 ActualizaVerifactu;
              end;
              Screen.Cursor := crDefault;
           end;
        end;
     end
     else
     if ConfirmaGrave then
     begin
        // Verificamos que no tenga asignado un numero de folio en el caso que sea una factura Chilena
        if ((REntorno.Pais = 'CHL') and (DMFacturas.QMCabeceraFOLIO.AsInteger > 0)) then
           raise Exception.Create(_('El documento no puede abrirse porque ya tiene asignado un número de folio'));

        if (REntorno.Pais = 'DOM') then
        begin
           if DMFacturas.xFacturaDGII.Active then
              Seguir := (DMFacturas.xFacturaDGII.RecordCount = 0)
           else
           begin
              DMFacturas.xFacturaDGII.Open;
              Seguir := (DMFacturas.xFacturaDGII.RecordCount = 0);
              DMFacturas.xFacturaDGII.Close;
           end;

           if not Seguir then
              raise Exception.Create(_('El documento no puede abrirse porque ya tiene un registro de envio'));
        end;

        Screen.Cursor := crHourGlass;
        try
           DMFacturas.AbreFactura;
        finally
           ActualizaTicketBAI;
           if (PCMain.ActivePage = TSVerifactu) then
           begin
              DMFacturas.xVerifactu.Close;
              DMFacturas.xVerifactu.Open;
              ActualizaVerifactu;
           end;
           Screen.Cursor := crDefault;
        end;
     end;
  end;
end;

procedure TFMFacturas.ADuplicarExecute(Sender: TObject);
begin
  if (DMFacturas.xCliente.Active) then
     DMMain.MuestraAviso('CLI', DMFacturas.xCliente.FieldByName('ID_CLIENTE').AsInteger, 'FAC');

  Screen.Cursor := crHourGlass;
  try
     DMFacturas.Duplica(0, '', REntorno.FechaTrab);
  finally
     Screen.Cursor := crDefault;
  end;

  HabilitaBotones;
end;

procedure TFMFacturas.ACondicionesClientesExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Cliente-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMFacturas.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMFacturas.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMFacturas.ActualizaCondicionesCli(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMFacturas.ADevolucionExecute(Sender: TObject);
var
  SerieDestino : string;
begin
  if (DMFacturas.xCliente.Active) then
     DMMain.MuestraAviso('CLI', DMFacturas.xCliente.FieldByName('ID_CLIENTE').AsInteger, 'FAC');

  SerieDestino := DMFacturas.QMCabeceraSERIE.AsString;
  if PideDato('SER', SerieDestino) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMFacturas.Devuelve(SerieDestino);
     finally
        Screen.Cursor := crDefault;
     end;

     if (SerieDestino <> DMFacturas.QMCabeceraSERIE.AsString) then
     begin
        EFSerie.Text := SerieDestino;
        DMFacturas.QMCabecera.Last;
     end;
  end;
end;

procedure TFMFacturas.ARefrescaDetalleExecute(Sender: TObject);
begin
  if Confirma then
     DMFacturas.RefrescaDetalle;
end;

procedure TFMFacturas.ACambiaFinanciacionExecute(Sender: TObject);
begin
  DMFacturas.CambiaFinanciacion;
end;

procedure TFMFacturas.ACierraMasivoExecute(Sender: TObject);
begin
  AbreForm(TFMCierraDocumento, FMCierraDocumento, Sender);
end;

procedure TFMFacturas.ATipoIVAExecute(Sender: TObject);
begin
  TFMCambiaFacCli.Create(Self).muestra(DMFacturas.QMCabeceraID_S.AsInteger);
  DMFacturas.QMCabecera.Refresh;
end;

procedure TFMFacturas.AHerenciaExecute(Sender: TObject);
var
  rig, Ejercicio : integer;
  tipo, su_referencia, titulo, serie : string;
begin
  DMFacturas.DatosHerencia(rig, Ejercicio, tipo, su_referencia, titulo, serie);
  MuestraHerencia(rig, Ejercicio, tipo, su_referencia, titulo, serie, Self);
end;

procedure TFMFacturas.AVentasExecute(Sender: TObject);
begin
  DMFacturas.VentasCliente;
end;

procedure TFMFacturas.AHistoricoSerializacionExecute(Sender: TObject);
begin
  HistoricoSerie(Self);
end;

procedure TFMFacturas.ARecibosExecute(Sender: TObject);
begin
  if (DMFacturas.QMCabeceraESTADO.AsInteger = 5) then
     FMain.MuestraRecibos('FAC', EFSerie.Text, DBERIG.Text,
        DMFacturas.QMCabeceraEJERCICIO.AsInteger);
end;

procedure TFMFacturas.FormShow(Sender: TObject);
begin
  inherited;

  LimitaSegunPais;
  HabilitaBotones;

  // Forzamos un primer refresco para que el navegador cambie si el usuario tiene documentos restringidos.
  NavMainClickAfterAdjust(Sender, nbRefresh);
  PNLDirRecogida.Width := TSDirManual.Width div 2;

  EstableceVisibilidadCamposDetalle;
  // Habilita;
end;

procedure TFMFacturas.DBGFDetalle1CellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMFacturas.DBGFDetalle1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  AgrupaColorKri : boolean;
begin
  if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if DMFacturas.HayDetalle then
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'UNIDADES') then
           begin
              if (DMFacturas.QMDetalleTIPO_UNIDAD_LOGISTICA.AsString <> 'GRNL') and
                 (DMFacturas.QMDetalleRELACIONAR_U_LOGISTICA.AsInteger = 1) and
                 (DMFacturas.QMDetalleUNIDADES_LOGISTICAS.AsFloat * DMFacturas.QMDetalleU_POR_U_LOGISTICA.AsFloat <> DMFacturas.QMDetalleUNIDADES.AsFloat) then
                 ColorResaltado3(Canvas)
              else
                 ColorEdicion(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'MARGEN') then
           begin
              if (MargenMinimo >= 0) then
                 if (MargenMinimo > DMFacturas.QMDetalleMARGEN.AsFloat) then
                    ColorError(Canvas)
                 else
                    ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'TIPO_IVA') or (UpperCase(Column.FieldName) = 'P_IVA') then
           begin
              if (DMFacturas.QMDetalleTIPO_IVA.AsInteger <> DMFacturas.QMDetalleTIPO_IVA_ART.AsInteger) then
                 ColorResaltado3(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_REAL') then
           begin
              if (DMFacturas.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
                 ColorResaltado5(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'LOTE_SIMPLE') then
           begin
              if (DMFacturas.QMDetalleREQUIERE_LOTE_SIMPLE.AsInteger = 1) and (Trim(DMFacturas.QMDetalleLOTE_SIMPLE.AsString) = '') then
                 ColorError(Canvas)
              else
                 ColorEdicion(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ARTICULO') then
           begin
              CeldaEnlace(TDBGridFind2000(Sender), Rect);

              if (KriConf211) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT EMPRESA FROM EMP_AGRUPACIONES_ART WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ARTICULO=''' + DMFacturas.QMDetalleARTICULO.AsString + ''' AND AGRUPACION=''COL''';
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
              if (DMFacturas.QMDetalleLOTEABLE.AsInteger = 1) then
              begin
                 if (Abs(RoundTo(DMFacturas.QMDetalleUNIDADES.AsFloat - DMFacturas.QMDetalleCANT_LOTE.AsFloat, -2)) > 0.00) then
                    ColorError(Canvas)
                 else
                    ColorEdicion(Canvas);
              end
              else
                 ColorInactivo(Canvas);
           end
           else
           {
           if ((UpperCase(Column.FieldName) = 'PRECIO') and (DMFacturas.QMCabeceraVALOR_UNIDAD_FOMENTO.AsFloat > 0) and (DMFacturas.QMDetalleUNIDAD_FOMENTO.AsFloat > 0)) then
           begin
              EstableceVisibilidadPrecio;
           end
           else
           }
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA1') then
           begin
              if (DMFacturas.QMDetalleUE_UNIDADES.AsInteger < 1) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA2') then
           begin
              if (DMFacturas.QMDetalleUE_UNIDADES.AsInteger < 2) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA3') then
           begin
              if (DMFacturas.QMDetalleUE_UNIDADES.AsInteger < 3) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'UE_MEDIDA4') then
           begin
              if (DMFacturas.QMDetalleUE_UNIDADES.AsInteger < 4) then
                 ColorInactivoInvisible(Canvas)
              else
                 ColorInfo(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturas.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if ((Button = nbCancel) and (NavNotas.CanFocus)) then
     NavNotas.SetFocus;

  {dji lrk kri - para que se pueda poner simbolo Euros en las notas}
  if Button = nbEdit then
     AUnidadesExt.ShortCut := 0;
  if Button = nbPost then
     AUnidadesExt.ShortCut := TextToShortCut('Ctrl+Alt+E');
end;

procedure TFMFacturas.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button = nbDelete) then
     DMFacturas.ControlaRestriccion;

  Editando := (Button in [nbEdit]);
end;

procedure TFMFacturas.ACambiaTituloExecute(Sender: TObject);
var
  index : smallint;
begin
  if (TButtCambiaDescripcion.Tag = 0) then
  begin
     index := EncuentraField(DBGFDetalle1, 'TITULO');
     try
        if (index >= 0) then
        begin
           DBGFDetalle1.Columns.Items[index].FieldName := 'TITULO_IDIOMA';
           DBGFDetalle1.Columns.Items[index].Color := $00D6D6D6;
           DBGFDetalle1.Columns.Items[index].Title.Caption := _('Desc. Artículo');
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
     index := EncuentraField(DBGFDetalle1, 'TITULO_IDIOMA');
     try
        if (index >= 0) then
        begin
           DBGFDetalle1.Columns.Items[index].FieldName := 'TITULO';
           DBGFDetalle1.Columns.Items[index].Color := clWindow;
           DBGFDetalle1.Columns.Items[index].Title.Caption := _('Desc. Artículo');
           ACambiaTitulo.Hint := _('Mostrar títulos en el idioma');
           TButtCambiaDescripcion.Tag := 0;
        end;
     except
        ShowMessage(_('El campo Desc. Artículo ha de ser visible'));
     end;
  end;

  DMFacturas.QMDetalle.Refresh;
end;

procedure TFMFacturas.AEnviarFacturaMailPdfExecute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  DMLstFacturaCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // esto es porque el assigned no va

  DMLstFacturaCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la factura por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstFactura, DMLstFactura);
           DMLstFacturaCargado := True;
           Memo := TStringList.Create;
           try
              DMLstFactura.MostrarListadoMail(DMFacturas.QMCabeceraID_S.AsInteger, EFSerie.Text, 2,
                 DMFacturas.QMCabeceraEJERCICIO.AsInteger, Memo, (LeeParametro('FACLSTM001') = 'S'));
              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMFacturas.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMFacturas.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMFacturas.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMFacturas.QMCabeceraRIG.AsInteger;
                 Fecha := DMFacturas.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMFacturas.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := DMFacturas.QMCabeceraPEDIDO_CLIENTE.AsString;
                 Folio := IntToStr(DMFacturas.QMCabeceraFOLIO.AsInteger);
                 TituloDocTributario := DameTituloTipoDocTributario(DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString);
                 NombreFichero := DMLstFactura.nombreFich;
                 Matricula := DMMain.DameMatriculaFichaTecnica(DMFacturas.QMCabeceraID_FICHA_TECNICA.AsInteger);
                 if (DMFacturas.QMCabeceraCLIENTE.AsInteger > 0) then
                 begin
                    NombreComercial := DMFacturas.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMFacturas.QMCabeceraTITULO.AsString;
                    RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturas.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);

              if (Trim(LeeParametro('FACASUN001')) > '') then
                 Asunto := Trim(LeeParametro('FACASUN001'));

              try
                 DMListados.SendMailClientePDF(DMFacturas.QMCabeceraCLIENTE.AsInteger, CuerpoMail,
                    DMLstFactura.rutaFich, DMLstFactura.nombreFich, Asunto, DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraID_S.AsInteger, True, DMMain.DameCorreoCopiaAgente(DMFacturas.QMCabeceraAGENTE.AsInteger, 'FAC'));
              finally
                 CuerpoMail.Free;
              end;
           finally
              Memo.Free;
           end;

           // Marco el documento como listado
           DMLstFactura.UpdateaDocumentos;

           CierraData(DMLstFactura);
           DMLstFacturaCargado := False;
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
           if DMLstFacturaCargado then
              CierraData(DMLstFactura);
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
  DMFacturas.InfoActualiza;
end;

procedure TFMFacturas.AMuestraUbicacionExecute(Sender: TObject);
begin
  DMFacturas.MuestraUbicacion;
end;

procedure TFMFacturas.AListadoUbicacionesExecute(Sender: TObject);
begin
  AbreData(TDMLstUbicacionesV, DMLstUbicacionesV);
  DMLstUbicacionesV.MostrarListadoUbicaciones(DMFacturas.QMCabeceraID_S.AsInteger, 0);
  CierraData(DMLstUbicacionesV);
end;

procedure TFMFacturas.AConfLstUbicacionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstUbicacionesV, DMLstUbicacionesV);
  TFMListConfig.Create(Self).Muestra(193, Formato, Cabecera, Copias, Pijama, EFSerie.Text,
     DMLstUbicacionesV.frUbicaciones);
  CierraData(DMLstUbicacionesV);
end;

procedure TFMFacturas.DBDTPFechaExit(Sender: TObject);
begin
  DBDTPEntrega.Date := DBDTPFecha.Date;
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMFacturas.DBEFPortesChange(Sender: TObject);
begin
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
     DBEIPortes.DataSource := DMFacturas.DSQMCabecera;
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
           DBEIPortes.DataSource := DMFacturas.DSxInfoActualizada;
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
              DBEIPortes.DataSource := DMFacturas.DSQMCabecera;
           end;
        end;

        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
        DBEPorPortes.TabStop := DBEPorPortes.Enabled;
        DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
        DBEIPortes.TabStop := DBEIPortes.Enabled;
     end;
  end;
end;

procedure TFMFacturas.DBEFRangoChange(Sender: TObject);
begin
  if ((Assigned(DBEFRango.Field)) and (DBEFRango.Text <> '')) then
     DBEFIndice.Enabled := (DMFacturas.ExisteRango(StrToInt(DBEFRango.Text)));
end;

procedure TFMFacturas.DBEFRangoBusqueda(Sender: TObject);
var
  Str : string;
begin
  inherited;
  if (StrToInt(DBEFPortes.Text) in [5, 6, 7]) then
  begin
     if (StrToInt(DBEFPortes.Text) = 5) then //rateo por pesos
        Str := ' TIPO=1';
     if (StrToInt(DBEFPortes.Text) = 6) then //rateo por importes
        Str := ' TIPO=2';
     if (StrToInt(DBEFPortes.Text) = 7) then //rateo por importes
        Str := ' TIPO=3';
     DBEFRango.CondicionBusqueda := Str;
  end;
end;

procedure TFMFacturas.DBEFIndiceBusqueda(Sender: TObject);
begin
  DBEFIndice.CondicionBusqueda := ' RANGO=' + DBEFRango.Text;
end;

procedure TFMFacturas.AOrdenaLineasExecute(Sender: TObject);
begin
  DMFacturas.OrdenarLineas;
end;

procedure TFMFacturas.AFacturaMultiExecute(Sender: TObject);
var
  Accion : integer;
begin
  if (DMFacturas.QMCabeceraESTADO.AsInteger = 6) then
     ShowMessage(_('No se puede traspasar una autofactura'))
  else
  begin
     FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(nil);
     Accion := FMTraspasoMultiCanal.Carga(DMFacturas.QMCabeceraID_S.AsInteger, DMFacturas.QMCabeceraRIG.AsInteger,
        DMFacturas.QMCabeceraEJERCICIO.AsInteger, DMFacturas.QMCabeceraCANAL.AsInteger, DMFacturas.QMCabeceraTRANSPORTISTA.AsInteger,
        DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraSERIE.AsString);
     FreeAndNil(FMTraspasoMultiCanal);
     DMFacturas.RefrescaCabecera(Accion);
  end;
end;

procedure TFMFacturas.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMFacturas.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMFacturas.FiltraDocumento(FiltroAccion: string);
begin
  FMFacturas.TSTabla.Show;
  DMFacturas.FiltraDocumento(FiltroAccion);
  RefrescaAvisos;
end;

procedure TFMFacturas.AAnaliticaExecute(Sender: TObject);
begin
  if (DMFActuras.QMCabeceraESTADO.AsInteger = 5) then
     AbrirImputacionCostes(DMFActuras.QMCabeceraRIC.AsInteger, False);
end;

procedure TFMFacturas.AVisRecibosFacturasFiltradasExecute(Sender: TObject);
var
  filtro : string;
  poss : integer;
begin
  filtro := UpperCase(DMFacturas.QMCabecera.SelectSQL.Text);
  poss := Pos('FROM', filtro) + 4;
  filtro := Copy(filtro, poss, Length(filtro) - poss + 1);
  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
  DMLstCarteraRecibos.ImprimirRecibosDeFacturasFiltradas('C',
     DMFacturas.QMCabeceraSERIE.AsString, 'FAC', Filtro, TAction(Sender).Tag);
  CierraData(DMLstCarteraRecibos);
end;

procedure TFMFacturas.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'TIPO=''FAC'' AND SERIE=''' + EFSerie.Text + '''';
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

procedure TFMFacturas.EFBuscaNIFKRIChange(Sender: TObject);
var
  IdDoc : integer;
begin
  IdDoc := StrToIntDef(EFBuscaNIFKRI.Text, 0);

  if (IdDoc <> 0) then
     DMFacturas.PosicionarID(IdDoc);
end;

procedure TFMFacturas.ADescargaLectorExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  {Fecha : TDateTime;No se utiliza}
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'Factura' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Factura de Cliente ' + EFSerie.Text + '/' + DBERig.Text);
     WriteLn(ArchivoLog, 'Estado ' + DBETituloEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMFacturas.QMDetalle.RecordCount));
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

           {Fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1)); No se utiliza}
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

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
                 DMFacturas.QMDetalle.Insert;
                 DBGFDetalle1.FindColumn('ARTICULO').Field.AsString := Articulo;
                 DBGFDetalle1.FindColumn('UNIDADES').Field.AsInteger := Cantidad;
                 DMFacturas.QMDetalle.Post;
              except
                 on e: Exception do
                 begin
                    DMFacturas.QMDetalle.Cancel;
                    ShowMessage(Format(_('Error insertando articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                    WriteLn(ArchivoLog, 'Error insertando articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                 end;
              end;
           end
           else
           begin
              WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades. Articulo Leido: ' + ArticuloLeido);
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %s' + #13#10 + 'Deberá agregarlo luego.'), [ArticuloLeido, IntToStr(Cantidad)]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'Factura' + '_' + FechaLog + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMFacturas.DBDTPEntregaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPEntrega.Date := DMMain.ValidaVersionDemoKri(DBDTPEntrega.Date);
end;

procedure TFMFacturas.MuestraStock;
var
  Articulo, Almacen : string;
begin
  DMFacturas.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self, stockNegativo);
end;

procedure TFMFacturas.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMFacturas.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

{Se define en UUtiles
function TFMFacturas.EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint;
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
procedure TFMFacturas.DBEFProyectoBusqueda(Sender: TObject);
begin
  TLFDBEditFind2000(Sender).CondicionBusqueda :=
     '(CLIENTE_NULL=' + EFCliente.Text + ' or CLIENTE_NULL=-1 or CLIENTE_NULL is null) and ' +
     '(AGENTE_NULL = ' + EFAgente.Text + ' or AGENTE_NULL is null) and ' +
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMFacturas.PCDetalleChange(Sender: TObject);
var
  valor : boolean;
begin
  valor := (PCDetalle.ActivePage = TSArticulosCertificados);

  LBLCertificado.Visible := valor;
  DBECertificadoAnt.Visible := valor;
  if (valor) then                // TSArticulosCertificados
     NavDetalle.DataSource := DMFacturas.DSQMDetalleCertificado
  else                           // TSArticulos
     NavDetalle.DataSource := DMFacturas.DSQMDetalle;
end;

procedure TFMFacturas.ABuscarArticuloExecute(Sender: TObject);
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
     if not PideDato('ART', Articulo, _('Articulo'), 'FAMILIA <> ''' + REntorno.FamSistema + '''') then
        // Si ha cancelado, borro contenido de variable
        Articulo := '';
  end;

  DMFacturas.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMFacturas.FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
begin
  EFSerie.Text := Serie;
  DMFacturas.FiltraClienteKri(Ejercicio, Serie, Cliente, Estado);
  RefrescaAvisos;
  PCMainChange(nil);
end;

procedure TFMFacturas.HabilitaCertificacion;
begin
  if (DMFacturas.HayCertificacion) then
     DBGFDetalle1.Parent := PCDetalle.Pages[0]        // - Tiene Certificación
  else
     DBGFDetalle1.Parent := PDetalle;               // - No tiene Certificación

  PCDetalle.ActivePage := TSArticulos;
  PCDetalleChange(Self); // Oculta el Label y el Edit de 'Certificado Anterior'
end;

procedure TFMFacturas.DBGFDetalleCertificadoCellClick(Column: TColumn);
begin
  ColActualCert := Column;
end;

procedure TFMFacturas.DBGFDetalleCertificadoDblClick(Sender: TObject);
begin
  if DMFacturas.HayCertificacion then
  begin
     if (UpperCase(ColActualCert.FieldName) = 'ARTICULO') then
        AArticuloCert.Execute;
  end;
end;

procedure TFMFacturas.AArticuloCertExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
           DMFacturas.QMDetalleCertificadoARTICULO.AsString + '''' +
           ' AND EJERCICIO=' + DMFacturas.QMDetalleCertificadoEJERCICIO.AsString);
end;

procedure TFMFacturas.DBGFDetalleCertificadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMFacturas.HayCertificacion then
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(DBGFDetalleCertificado, Rect);
end;

procedure TFMFacturas.DBGFDetalle1KeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
  begin
     if (Key = VK_F3) then
     begin
        DMFacturas.InfoLotes;
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
           DMFacturas.QMDetalle.Edit;
           DMFacturas.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end
  else
  begin
     with DMFacturas.QMDetalle do
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

procedure TFMFacturas.DBEFTipoLineaKriChange(Sender: TObject);
begin
  ETipoLineaKri.Text := DameTituloTipoLinea(StrToIntDef(DBEFTipoLineaKri.Text, -1));
end;

procedure TFMFacturas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  DMFacturas.FiltraDocumento('');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
     G2KTableLoc.CondicionBusqueda := G2KTableLoc.CondicionBusqueda + ' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));

  G2KTableLoc.Click;
  PCMainChange(Sender);
  HabilitaBotones; // Ya ejecuta RefrescaAvisos;
end;

procedure TFMFacturas.PCMainChange(Sender: TObject);
begin
  PMainMaximizado := (PCMain.ActivePage = TSNotas);

  inherited;

  if (PCMain.ActivePage = TSNotas) then
     DBRENotasInternasKri.Height := (DBRENotas.Height + DBRENotasInternasKri.Height) div 2
  else
     DBRENotasInternasKri.Height := (DBRENotas.Height + DBRENotasInternasKri.Height) div 2;

  if (PCMain.ActivePage = TSFEChile) then
  begin
     DMFacturas.QMCabeceraFEChile.Open;
  end;

  if (PCMain.ActivePage <> TSFEChile) then
  begin
     DMFacturas.QMCabeceraFEChile.Close;
  end;

  if (PCMain.ActivePage = TSVerifactu) then
  begin
     DMFacturas.xVerifactu.Close;
     DMFacturas.xVerifactu.Open;
     ActualizaVerifactu;
  end;

  if (PCMain.ActivePage <> TSVerifactu) then
  begin
     DMFacturas.xVerifactu.Close;
  end;

  if (PCMain.ActivePage = TSEnvioECF) then
  begin
     DMFacturas.xFacturaDGII.Close;
     DMFacturas.xFacturaDGII.Open;
  end;

  if (PCMain.ActivePage <> TSEnvioECF) then
  begin
     DMFacturas.xFacturaDGII.Close;
  end;
end;

procedure TFMFacturas.DBEFContactoBusqueda(Sender: TObject);
begin
  DBEFContacto.CondicionBusqueda := Format('TERCERO = %d AND ((DIRECCION = 0) OR (DIRECCION = %d))', [DMFacturas.xCliente.FieldByName('TERCERO').AsInteger, DMFacturas.QMCabeceraDIRECCION.AsInteger]);
end;

procedure TFMFacturas.DBRENotasEnter(Sender: TObject);
begin
  RichEditConFoco := TDBRichEdit(Sender);
end;

procedure TFMFacturas.DBRENotasSelectionChange(Sender: TObject);
begin
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

procedure TFMFacturas.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(CBFontName.Items));
  ReleaseDC(0, DC);
  CBFontName.Sorted := True;
end;

procedure TFMFacturas.EFontSizeNotasChange(Sender: TObject);
begin
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

procedure TFMFacturas.CBFontNameChange(Sender: TObject);
begin
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

procedure TFMFacturas.AAdjuntosFacturaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('FAC', DMFacturas.QMCabeceraID_S.AsInteger);
end;

procedure TFMFacturas.AAdjuntosClienteExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('CLI', DameIDCliente(DMFacturas.QMCabeceraCLIENTE.AsInteger));
end;

procedure TFMFacturas.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMFacturas.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMFacturas.AAdjuntosAgenteExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('AGE', DameIDAgente(DMFacturas.QMCabeceraAGENTE.AsInteger));
end;

procedure TFMFacturas.AAdjuntosTransportistaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DMFacturas.QMCabeceraTRANSPORTISTA.AsInteger));
end;

// sfg_rsl-begin- especial abrir cliente de correo predeterminado (El DMlistados tienes que ser a medida)
procedure TFMFacturas.AEnviarFacturaMailPdf2Execute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstFactura, DMLstFactura);
  try

     DMLstFactura.MostrarListadoMail(DMFacturas.QMCabeceraID_S.AsInteger, EFSerie.Text, 2,
        DMFacturas.QMCabeceraEJERCICIO.AsInteger, Memo, (LeeParametro('FACLSTM001') = 'S'));

     InicializaVariableEmail(DMFacturas.QMCabeceraTIPO.AsString);
     with VariableEmail do
     begin
        Ejercicio := DMFacturas.QMCabeceraEJERCICIO.AsInteger;
        Serie := DMFacturas.QMCabeceraSERIE.AsString;
        NumeroDocumento := DMFacturas.QMCabeceraRIG.AsInteger;
        Fecha := DMFacturas.QMCabeceraFECHA.AsDateTime;
        SuReferencia := DMFacturas.QMCabeceraSU_REFERENCIA.AsString;
        SuPedido := DMFacturas.QMCabeceraPEDIDO_CLIENTE.AsString;
        Folio := IntToStr(DMFacturas.QMCabeceraFOLIO.AsInteger);
        TituloDocTributario := DameTituloTipoDocTributario(DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString);
        NombreFichero := DMLstFactura.nombreFich;
        Matricula := DMMain.DameMatriculaFichaTecnica(DMFacturas.QMCabeceraID_FICHA_TECNICA.AsInteger);
        if (DMFacturas.QMCabeceraCLIENTE.AsInteger > 0) then
        begin
           NombreComercial := DMFacturas.QMCabeceraNOMBRE_COMERCIAL.AsString;
           RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
        end
        else
        begin
           // El campo TITULO se rellena con el nombre asignado al Tercero Vario
           NombreComercial := DMFacturas.QMCabeceraTITULO.AsString;
           RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
        end;
        OrdenTrabajo := 0;
        UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturas.QMCabeceraENTRADA.AsInteger));
     end;
     DamePartesEmail(Asunto, CuerpoMail);

     if (Trim(LeeParametro('FACASUN001')) > '') then
        Asunto := Trim(LeeParametro('FACASUN001'));

     try
        DMListados.SendMailClientePDF2(DMFacturas.QMCabeceraCLIENTE.AsInteger, CuerpoMail,
           DMLstFactura.rutaFich, DMLstFactura.nombreFich, Asunto, DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraID_S.AsInteger, True, DMMain.DameCorreoCopiaAgente(DMFacturas.QMCabeceraAGENTE.AsInteger, 'FAC'));
     finally
        CuerpoMail.Free;
     end;

     // Marco el documento como listado
     DMLstFactura.UpdateaDocumentos;
  finally
     CierraData(DMLstFactura);
  end;

  // Refresco valor de check del estado listado
  DMFacturas.InfoActualiza;
end;
// sfg_rsl-end- especial abrir cliente de correo predeterminado

procedure TFMFacturas.AGenerarPackingListExecute(Sender: TObject);
begin
  DMFacturas.GenerarPackingList;

  FMPackingList := TFMPackingList.Create(Self);
  with FMPackingList do
     try
        AbrirDatos(DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraID_S.AsInteger);
        ShowModal;
     finally
        Free;
     end;
end;

procedure TFMFacturas.EFModoIvaChange(Sender: TObject);
begin
  EModoIva.Text := DameTituloModoIVA(StrToIntDef(EFModoIva.Text, -1));
end;

procedure TFMFacturas.AEnviarFacturaElectronicaMXExecute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  DMLstFacturaCargado : boolean;
  CuerpoMail, FicherosAdj : TStrings;
  NomFic : string; // Nombre del Fichero y xml
  NFic : TextFile; // Fichero
begin
  DMLstFacturaCargado := False;
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la factura electrónica por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstFactura, DMLstFactura);
           DMLstFacturaCargado := True;
           Memo := TStringList.Create;

           DMLstFactura.MostrarListadoMail(DMFacturas.QMCabeceraID_S.AsInteger, EFSerie.Text, 2,
              DMFacturas.QMCabeceraEJERCICIO.AsInteger, Memo, (LeeParametro('FACLSTM001') = 'S'));

           FSendCorreo.Texto(_('Enviando Factura electrónica  ...'));

           InicializaVariableEmail(DMFacturas.QMCabeceraTIPO.AsString);
           with VariableEmail do
           begin
              Ejercicio := DMFacturas.QMCabeceraEJERCICIO.AsInteger;
              Serie := DMFacturas.QMCabeceraSERIE.AsString;
              NumeroDocumento := DMFacturas.QMCabeceraRIG.AsInteger;
              Fecha := DMFacturas.QMCabeceraFECHA.AsDateTime;
              SuReferencia := DMFacturas.QMCabeceraSU_REFERENCIA.AsString;
              SuPedido := DMFacturas.QMCabeceraPEDIDO_CLIENTE.AsString;
              Folio := IntToStr(DMFacturas.QMCabeceraFOLIO.AsInteger);
              TituloDocTributario := DameTituloTipoDocTributario(DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString);
              NombreFichero := DMLstFactura.nombreFich;
              Matricula := DMMain.DameMatriculaFichaTecnica(DMFacturas.QMCabeceraID_FICHA_TECNICA.AsInteger);
              if (DMFacturas.QMCabeceraCLIENTE.AsInteger > 0) then
              begin
                 NombreComercial := DMFacturas.QMCabeceraNOMBRE_COMERCIAL.AsString;
                 RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
              end
              else
              begin
                 // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                 NombreComercial := DMFacturas.QMCabeceraTITULO.AsString;
                 RazonSocial := DMFacturas.QMCabeceraTITULO.AsString;
              end;
              OrdenTrabajo := 0;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturas.QMCabeceraENTRADA.AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);

           if (Trim(LeeParametro('FACASUN001')) > '') then
              Asunto := Trim(LeeParametro('FACASUN001'));

           // Creamos fichero XML
           AbreData(TDMFacturaElectronicaMx, DMFacturaElectronicaMx);
           DMFacturaElectronicaMx.AbrirActual(DMFacturas.QMCabeceraID_S.AsInteger, 0);
           NomFic := ChangeFileExt(DMLstFactura.rutaFich, '.xml');
           AssignFile(NFic, NomFic);
           try
              Rewrite(NFic);
              WriteLn(NFic, DMFacturaElectronicaMx.QMCabeceraFICHERO.AsString);
           except
              on E: Exception do
                 ShowMessage(_('Error en la creación del fichero xml') + #13#10 + E.Message);
           end;
           CloseFile(NFic);
           CierraData(DMFacturaElectronicaMx);

           // Ficheros adjuntos (factura en pdf y fichero xml)
           FicherosAdj := TStringList.Create;
           FicherosAdj.Add(DMLstFactura.rutaFich);
           FicherosAdj.Add(NomFic);

           DMListados.SendMailClientePDF(DMFacturas.QMCabeceraCLIENTE.AsInteger, CuerpoMail,
              FicherosAdj, DMLstFactura.nombreFich, Asunto, DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraID_S.AsInteger, True, '', '');

           Memo.Free;
           CuerpoMail.Free;
           FicherosAdj.Free;

           CierraData(DMLstFactura);
           DMLstFacturaCargado := False;

           FSendCorreo.Texto(_('Factura electrónica enviada con éxito ...'));
        end;
     except
        on E: Exception do
        begin
           Application.ProcessMessages;
           {dji lrk kri}
           { TODO -oDuilio -cemail : Que muestre el mensaje de excepciones de envio de correo electronico en FAP, ALB, ALP, PEC, PEP, OFC }
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
           if DMLstFacturaCargado then
              CierraData(DMLstFactura);
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

procedure TFMFacturas.AFacturaElectronicaMXExecute(Sender: TObject);
begin
  // Creamos fichero XML
  AbreData(TDMFacturaElectronicaMx, DMFacturaElectronicaMx);
  DMFacturaElectronicaMx.AbrirActual(DMFacturas.QMCabeceraID_S.AsInteger, 0);
  DMFacturaElectronicaMx.GenerarFicheroXML;
  CierraData(DMFacturaElectronicaMx);
end;

procedure TFMFacturas.EFClienteChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMFacturas.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMFacturas.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMFacturas.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMFacturas.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMFacturas.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMFacturas.AEliminarPackingListExecute(Sender: TObject);
begin
  if ConfirmaMensaje(_('Este proceso eliminara el packing list generado.' + #13#10 + '¿Desea continuar?')) then
     DMFacturas.EliminarPackingList;
end;

procedure TFMFacturas.AOrdenarLineasPorDireccionEntregaExecute(Sender: TObject);
begin
  /// Ordena las lineas por direccion de entrega, articulo, linea
  DMFacturas.OrdenarLineasPorDireccionEntrega;
end;

procedure TFMFacturas.EFAgenteChange(Sender: TObject);
begin
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMFacturas.DBEFIdiomaChange(Sender: TObject);
begin
  ETitIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMFacturas.DBEFAlmacenChange(Sender: TObject);
begin
  ETituloAlmacen.Text := DameTituloAlmacen(DBEFAlmacen.Text);
end;

procedure TFMFacturas.DBEFProyectoChange(Sender: TObject);
begin
  EProyecto.Text := DameTituloProyecto(StrToIntDef(TLFDBEditFind2000(Sender).Text, 0));
  EProyectoChile.Text := EProyecto.Text;
end;

procedure TFMFacturas.DBEFTarifaChange(Sender: TObject);
begin
  ETitTarifa.Text := DameTituloTarifa(DBEFTarifa.Text);
end;

procedure TFMFacturas.EFTransportistaChange(Sender: TObject);
begin
  ETituloTransportistaFac.Text := DameTituloAcreedor(StrToIntDef(EFTransportista.Text, 0));
end;

procedure TFMFacturas.AListarEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos(DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraID_S.AsInteger);
end;

procedure TFMFacturas.AImportarDocumentoDesdeOtraBDExecute(Sender: TObject);
begin
  AbreForm(TFMImportarDocumentoDesdeOtraBD, FMImportarDocumentoDesdeOtraBD, Self);
  FMImportarDocumentoDesdeOtraBD.EstableceSerieDestino(EFSerie.Text);
end;

procedure TFMFacturas.AFacturaElectronicaESExecute(Sender: TObject);
var
  Certificado, Fichero : string;
begin
  // Firma factura electronica española
  Certificado := '';
  if (LeeParametro('FACELEC002', DMFacturas.QMDetalleSERIE.AsString) = 'S') then
     Certificado := DMMain.DameCertificado(DMFacturas.QMDetalleSERIE.AsString);
  Fichero := DMFacturas.GeneraFacturaElectronicaES(Certificado);
  ShowMessage(Format(_('Se ha creado el fichero' + #13#10 + '%s'), [Fichero]));
end;

procedure TFMFacturas.ACambioPCosteLineaExecute(Sender: TObject);
var
  PCoste : double;
begin
  PCoste := DMFacturas.QMDetalleP_COSTE.AsFloat;
  if (PideDato('DBL', PCoste, _('Precio de Coste'))) then
  begin
     if (DMFacturas.QMDetalleP_COSTE.AsFloat <> PCoste) then
        DMFacturas.CambiaPCosteLinea(PCoste);
  end;
end;

procedure TFMFacturas.ACambioCosteAdicionalLineaExecute(Sender: TObject);
var
  CosteAdicional : double;
begin
  inherited;
  CosteAdicional := DMFacturas.QMDetalleCOSTE_ADICIONAL.AsFloat;
  if PideDato('DBL', CosteAdicional, _('Coste Adicional')) then
  begin
     if (DMFacturas.QMDetalleCOSTE_ADICIONAL.AsFloat <> CosteAdicional) then
        DMFacturas.CambiaCosteAdicionalLinea(CosteAdicional);
  end;
end;

procedure TFMFacturas.ADuplicarLineaExecute(Sender: TObject);
begin
  DMFacturas.DuplicarLinea;
end;

procedure TFMFacturas.AImprimeExecute(Sender: TObject);
begin
  DMFacturas.ImprimirDocumento(1);
end;

procedure TFMFacturas.LNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMFacturas.xCliente.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMFacturas.xCliente.FieldByName('NOTAS').AsString);
        if (Trim(DMFacturas.xCliente.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMFacturas.xCliente.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        if (Trim(DMFacturas.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMFacturas.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMFacturas.AAsignaEmpleadoExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.AsignaEmpleados;
end;

procedure TFMFacturas.DBEMargenChange(Sender: TObject);
begin
  inherited;
  if (MargenMinimo >= 0) then
     if (MargenMinimo > DMFacturas.xInfoActualizadaMARGEN.AsFloat) then
        ColorError(DBEMargen)
     else
        ColorInfo(DBEMargen);
end;

procedure TFMFacturas.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMFacturas.TSOtrosShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEOtros;
  SolapaControles(SBAProyecto, EProyecto);

  ActualizaFirma;
end;

procedure TFMFacturas.ARegistroCarteraExecute(Sender: TObject);
begin
  inherited;
  if (DMFacturas.QMCabeceraREGISTRO_CARTERA.AsInteger <> 0) then
  begin
     FMain.MuestraCartera(DMFacturas.QMCabeceraEJERCICIO.AsInteger, REntorno.Canal, 'C', DMFacturas.QMCabeceraREGISTRO_CARTERA.AsInteger);
  end;
end;

procedure TFMFacturas.SBVerCarteraDblClick(Sender: TObject);
begin
  inherited;
  ARegistroCartera.Execute;
end;

procedure TFMFacturas.DBERIGChange(Sender: TObject);
begin
  inherited;
  RefrescaAvisos;
  if (PCMain.ActivePage = TSOtros) then
     ActualizaFirma;
  if (PCMain.ActivePage = TSVerifactu) then
     ActualizaVerifactu;
  ActualizaTicketBAI;

  // Si el pais es Chile pintamos de rojo el numero de folio, si tienen algun error o no se ha recibido respuesta del SII
  if ((REntorno.Pais = 'CHL') and (DMFacturas.QMCabeceraESTADO.AsInteger = 5)) then
  begin
     if ((DMFacturas.QMCabeceraFEChileID_S.AsInteger = 0) or (DMFacturas.QMCabeceraFEChileXML_RESPUESTA.AsString = '') or (DMFacturas.QMCabeceraFEChileCANTIDAD_ERRORES.AsInteger > 0)) then
     begin
        ColorResaltado3(DBEFolio);
        DBEFolio.Hint := DMFacturas.QMCabeceraFEChileMENSAJE_ERROR.AsString;
        DBEFolio.ShowHint := True;
     end
     else
     begin
        ColorCampoID(DBEFolio);
        DBEFolio.Hint := '';
        DBEFolio.ShowHint := False;
     end;
  end;
end;

procedure TFMFacturas.DBEFAutorizacionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFAutorizacion.CondicionBusqueda := 'TIPO = ''E'' AND ''' + FormatDateTime('yyyy.mm.dd', DMFacturas.QMCabeceraFECHA.AsDateTime) + ''' BETWEEN FECHA_DESDE AND FECHA_HASTA';
end;

procedure TFMFacturas.ARegistroFitosanitarioExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ARegistroFitosanitario);
  with FMRegistroFitosanitario do
  begin
     AsignaDocumento('FAC', DMFacturas.QMDetalle.FieldByName('ID_DETALLES_S').AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMFacturas.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, DBEFProyecto.Text);
end;

procedure TFMFacturas.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMFacturas.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMFacturas;
     ShowModal;
     Free;
  end;
end;

procedure TFMFacturas.DBCBDevolucionChange(Sender: TObject);
begin
  inherited;

  // En República Dominicana se debe informar la factura que se está abonando.
  if (REntorno.Pais = 'DOM') then
  begin
     if (DMFacturas.QMCabecera.State in [dsInsert, dsEdit]) then
     begin
        if (DBCBDevolucion.Checked) then
           DMFacturas.DameFacturaDevolucion
        else
           DMFacturas.QMCabeceraID_DEV.AsInteger := 0;
     end;
  end;
end;

procedure TFMFacturas.ActualizaFirma;
begin
  if (DMFacturas.QMFirmas.Active) then
     RefrescarImagenFirma(ImgFirma, DMFacturas.QMFirmas.FieldByName('ID_FIRMA').AsInteger);
end;

procedure TFMFacturas.ActualizaTicketBAI;
begin
  if TicketBAI then
  begin
     // Para evitar que al cerrar el formulario refresque después de liberar el DataModule
     if (DBERIG.Text > '') then
     begin
        with DMFacturas.xTicketBAI do
        begin
           Close;
           if (DMFacturas.QMCabeceraESTADO.AsInteger = 5) then
              Open;
        end;
     end;
  end;
end;

procedure TFMFacturas.APedirFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.PedirFirma('FAC', DMFacturas.QMCabeceraID_S.AsInteger);
end;

procedure TFMFacturas.ABorrarFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.BorrarFirma('FAC', DMFacturas.QMCabeceraID_S.AsInteger);
end;

procedure TFMFacturas.DBEFBancoDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFBancoDireccion.CondicionBusqueda := 'TERCERO = ' + IntToStr(DMFacturas.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMFacturas.DBEFBancoDireccionChange(Sender: TObject);
begin
  inherited;
  EBancoDireccion.Text := DameTituloBancoTercero(DMFacturas.QMCabeceraTERCERO.AsInteger, DMFacturas.QMCabeceraBANCO.AsInteger);
end;

procedure TFMFacturas.DBEFTipoVentaChange(Sender: TObject);
begin
  inherited;
  ETipoVenta.Text := DameTituloTipoVenta(StrToIntDef(DBEFTipoVenta.Text, 0));
end;

procedure TFMFacturas.DBEFOtrosTipoVentaChange(Sender: TObject);
begin
  inherited;
  EOtrosTipoVenta.Text := DameTituloTipoVenta(StrToIntDef(DBEFOtrosTipoVenta.Text, 0));
end;

procedure TFMFacturas.DBEFCodigoGiroClienteChange(Sender: TObject);
begin
  inherited;
  if (DMFacturas.QMCabecera.State in [dsInsert, dsEdit]) then
  begin
     if (DBEFCodigoGiroCliente.Text = '0') then
     begin
        DBESIITituloCodigoGiroCliente.Color := clWindow;
        DBESIITituloCodigoGiroCliente.ReadOnly := False;
        DBESIITituloCodigoGiroCliente.Text := DMFacturas.xCliente.FieldByName('GIRO_CLIENTE').AsString;
        DBEFCodigoGiroCliente.Color := clInfoBk;
        DBEFCodigoGiroCliente.ReadOnly := True;
        DBEFCodigoGiroCliente.Enabled := False;
     end
     else
     begin
        DBESIITituloCodigoGiroCliente.Color := clInfoBk;
        DBESIITituloCodigoGiroCliente.ReadOnly := True;
        DBESIITituloCodigoGiroCliente.Text := DameTituloCodigoGiro(StrToIntDef(DBEFCodigoGiroCliente.Text, 0));
        DBEFCodigoGiroCliente.Color := clWindow;
        DBEFCodigoGiroCliente.ReadOnly := False;
        DBEFCodigoGiroCliente.Enabled := True;
     end;
  end;
end;

procedure TFMFacturas.DBEFOtrosCodigoGiroClienteChange(Sender: TObject);
begin
  inherited;
  EOtrosCodigoGiroCliente.Text := DameTituloCodigoGiro(StrToIntDef(DBEFOtrosCodigoGiroCliente.Text, 0));
end;

procedure TFMFacturas.DBEFCodigoGiroEmpresaChange(Sender: TObject);
begin
  inherited;
  ECodigoGiroEmpresa.Text := DameTituloCodigoGiro(StrToIntDef(DBEFCodigoGiroEmpresa.Text, 0));
end;

procedure TFMFacturas.DBEFOtrosCodigoGiroEmpresaChange(Sender: TObject);
begin
  inherited;
  EOtrosCodigoGiroEmpresa.Text := DameTituloCodigoGiro(StrToIntDef(DBEFOtrosCodigoGiroEmpresa.Text, 0));
end;

procedure TFMFacturas.DBEFTipoDocumentoTributarioChange(Sender: TObject);
begin
  inherited;
  ETipoDocumentoTributario.Text := DameTituloTipoDocTributario(DBEFTipoDocumentoTributario.Text);
end;

procedure TFMFacturas.DBEFOtrosTipoDocumentoTributarioChange(Sender: TObject);
begin
  inherited;
  EOtrosTipoDocumentoTributario.Text := DameTituloTipoDocTributario(DBEFOtrosTipoDocumentoTributario.Text);
end;

procedure TFMFacturas.DBETipoDespachoChange(Sender: TObject);
begin
  inherited;
  if (DMFacturas.QMCabeceraID_TIPO_DESPACHO.AsInteger > 0) then
     ETipoDespachoTitulo.Text := DameTituloParametrosFE(StrToIntDef(DBETipoDespacho.Text, 0), 'TIPO_DESPACHO');
end;

procedure TFMFacturas.DBEOtrosTipoDespachoChange(Sender: TObject);
begin
  inherited;
  if (DMFacturas.QMCabeceraID_TIPO_DESPACHO.AsInteger > 0) then
     EOtrosTipoDespachoTitulo.Text := DameTituloParametrosFE(StrToIntDef(DBEOtrosTipoDespacho.Text, 0), 'TIPO_DESPACHO');
end;

procedure TFMFacturas.DBETipoDespachoBusqueda(Sender: TObject);
begin
  inherited;
  DBETipoDespacho.CondicionBusqueda := 'PARAMETRO=''TIPO_DESPACHO''';
end;

procedure TFMFacturas.DBEOtrosTipoDespachoBusqueda(Sender: TObject);
begin
  inherited;
  DBEOtrosTipoDespacho.CondicionBusqueda := 'PARAMETRO=''TIPO_DESPACHO''';
end;

procedure TFMFacturas.ATerceroExecute(Sender: TObject);
begin
  inherited;
  if PEdit.Enabled then
  begin
     if DBENombreComercial.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'TERCERO = ' + DMFacturas.QMCabeceraTERCERO.AsString);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'TERCERO = ' + DMFacturas.QMCabeceraTERCERO.AsString);
end;

procedure TFMFacturas.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMFacturas.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (Column.FieldName = 'VF_ESTADO_REGISTRO') then
        begin
           if (DataSource.DataSet.FieldByName('ESTADO').AsInteger = 5) then
           begin
              if (DataSource.DataSet.FieldByName('VF_CODIGO_ERROR_ALTA').AsString = '0') then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (DataSource.DataSet.FieldByName('ESTADO').AsInteger = 2) then
           begin
              if (DataSource.DataSet.FieldByName('VF_CODIGO_ERROR_ANULACION').AsString = '0') then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturas.LimitaSegunPais;
begin
  if (REntorno.Pais <> 'ESP') then
  begin
     AFacturaElectronicaES.Visible := False;
     AEnvioTBAI.Visible := False;
     AAnularTBAI.Visible := False;
     LTicketBAI.Visible := False;
     DBETicketBAI.Visible := False;
     TSVerifactu.TabVisible := False;
     AAnulaDocumento.Caption := _('Anula factura BORRANDO todas las lineas');
  end;

  if (REntorno.Pais = 'ESP') then
  begin
     TSVerifactu.TabVisible := DMMain.UtilizaVerifactu;
     AAnulaDocumento.Caption := _('Marca el documento como anulado / pendiente');
  end;

  if (REntorno.Pais <> 'BOL') then
  begin
     LAutorizacion.Visible := False;
     DBEFAutorizacion.Visible := False;
     LCodigoControl.Visible := False;
     DBECodigoControl.Visible := False;

     PNLOtrosBolivia.Visible := False;
  end;

  if (REntorno.Pais <> 'DOM') then
  begin
     LNCF.Visible := False;
     DBEFPrefijoNCF.Visible := False;
     DBEContadorNCF.Visible := False;
     DBCBVTipoNCF.Visible := False;
     TSEnvioECF.TabVisible := False;
     LTipoIngresos.Visible := False;
     DBCBTipoIngresos.Visible := False;
  end;

  if (REntorno.Pais = 'DOM') then
  begin
     TBEnvioDTE.Caption := _('Envia ECF al DGII');
     TBEnvioDTE.Hint := _('Envia ECF al DGII');

     AgregaColumna(DBGMain, 'TIPO_INGRESOS', _('Tipo Ingresos'));
     AgregaColumna(DBGMain, 'SFV_AUTORIZACION', _('Autorización'));
     AgregaColumna(DBGMain, 'SFV_CODIGO_CONTROL', _('Código control'));
     AgregaColumna(DBGMain, 'SFV_NUM_DOSIFICACION', _('Nro. Dosificacion'));
     AgregaColumna(DBGMain, 'TITULO_GIRO_CLIENTE', _('Titulo Giro Cliente'));
  end;

  if (REntorno.Pais <> 'MEX') then
  begin
     AFacturaElectronicaMX.Visible := False;
     AEnviarFacturaElectronicaMX.Visible := False;
  end;

  if ((REntorno.Pais <> 'CHL') and (REntorno.Pais <> 'DOM')) then
  begin
     AEnviaDTECL.Enabled := False;
     TBEnvioDTE.Visible := False;
  end;

  if (REntorno.Pais <> 'CHL') then
  begin
     PNLChile.Visible := False;
     TSFEChile.TabVisible := False;
     TSOtrosChile.TabVisible := False;
     AGeneraNotaDeCredito.Visible := False;
     AGeneraNotaDeDebito.Visible := False;
     TSepBuscaFolio.Visible := False;
     TBLocalizaFolio.Visible := False;
  end;

  if (REntorno.Pais = 'CHL') then
  begin
     TBEnvioDTE.Caption := _('Envia DTE Chile');
     TBEnvioDTE.Hint := _('Envia DTE Chile');

     AgregaColumna(DBGMain, 'FOLIO', _('Folio'));
     AgregaColumna(DBGMain, 'TIPO_DOC_TRIBUTARIO', _('Tipo Doc. Tributario'));

     {
     // AgregaColumna(DBGMain, 'FOLIOREF', _('Folio Ref.'));
     // AgregaColumna(DBGMain, 'TPODOCREF', _('Tipo Doc. Ref.'));
     // AgregaColumna(DBGMain, 'NROLINREF', _('Nro Lin. Ref.'));
     // AgregaColumna(DBGMain, 'RUTOTR', _('RUT Otr.'));
     // AgregaColumna(DBGMain, 'FCHREF', _('Fecha Ref.'));
     // AgregaColumna(DBGMain, 'CODREF', _('Cod Ref.'));
     // AgregaColumna(DBGMain, 'RAZONREF', _('Razon Ref.'));
     }
     AgregaColumna(DBGMain, 'VALOR_UNIDAD_FOMENTO', _('Valor Ud. Fomento'));

     AgregaColumna(DBGMain, 'SII_FMA_PAGO', _('F. Pago SII'));
     AgregaColumna(DBGMain, 'TIPO_VENTA', _('Tipo Venta SII'));
     AgregaColumna(DBGMain, 'CODIGO_GIRO_EMPRESA', _('Cod. Giro Empresa'));
     AgregaColumna(DBGMain, 'CODIGO_GIRO_CLIENTE', _('Cod. Giro Cliente'));
     AgregaColumna(DBGMain, 'INDSERVICIO', _('Ind. Servicios'));

     AgregaColumna(DBGMain, 'OC_NROLINREF', _('O.C. Nro. Lin. Ref.'));
     AgregaColumna(DBGMain, 'OC_TPODOCREF', _('O.C. T. Doc. Ref.'));
     AgregaColumna(DBGMain, 'OC_FOLIOREF', _('O.C. Folio Ref.'));
     AgregaColumna(DBGMain, 'OC_RUTOTR', _('O.C. RUT'));
     AgregaColumna(DBGMain, 'OC_FCHREF', _('O.C. Fec. Ref.'));
     AgregaColumna(DBGMain, 'OC_CODREF', _('O.C. Cod. Ref.'));
     AgregaColumna(DBGMain, 'OC_RAZONREF', _('O.C. Razon Ref.'));

     AgregaColumna(DBGMain, 'GD_NROLINREF', _('G.D. Nro. Lin. Ref.'));
     AgregaColumna(DBGMain, 'GD_TPODOCREF', _('G.D. T. Doc. Ref.'));
     AgregaColumna(DBGMain, 'GD_FOLIOREF', _('G.D. Folio Ref.'));
     AgregaColumna(DBGMain, 'GD_RUTOTR', _('G.D. RUT'));
     AgregaColumna(DBGMain, 'GD_FCHREF', _('G.D. Fec. Ref.'));
     AgregaColumna(DBGMain, 'GD_CODREF', _('G.D. Cod. Ref.'));
     AgregaColumna(DBGMain, 'GD_RAZONREF', _('G.D. Razon Ref.'));
  end;

  AEnviaFactoingCHL.Visible := (REntorno.Pais = 'CHL');
  // AEnviaFactoingCHL.Enabled := (REntorno.Pais = 'CHL');

  if (PNLChile.Visible) then
     PNLAvisos.Left := (PNLChile.Left + PNLChile.Width) + 5
  else
  if (DBEFAutorizacion.Visible) then
     PNLAvisos.Left := (DBEFAutorizacion.Left + DBEFAutorizacion.Width) + 5
  else
  if (DBCBVTipoNCF.Visible) then
     PNLAvisos.Left := (DBCBVTipoNCF.Left + DBCBVTipoNCF.Width) + 5
  else
     PNLAvisos.Left := PNLChile.Left;

  PNLAvisos.Width := PEdCabecera.Width - PNLAvisos.Left - 1;
end;

procedure TFMFacturas.ACrearHerenciaManualExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMFacturas.QMDetalleTIPO.AsString, DMFacturas.QMDetalleID_DETALLES_S.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMFacturas.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

procedure TFMFacturas.DBETpoDocRefChange(Sender: TObject);
begin
  inherited;
  ETipoDocTribTitulo.Text := DameTituloTipoDocTributario(DBETpoDocRef.Text);

  // Si el Tipo de Doc Trib es diferente de 33, 56 ó 61 se asigna folio manualmente.
  if ((DBETpoDocRef.Text = '33') or (DBETpoDocRef.Text = '56') or (DBETpoDocRef.Text = '61')) then
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

procedure TFMFacturas.AMuestraDocumentosVentaExecute(Sender: TObject);
begin
  inherited;
  AACliente.Execute;
  FMClientes.MuestraDocumentosVenta('FAC');
end;

procedure TFMFacturas.AEnviaDTECLExecute(Sender: TObject);
begin
  inherited;
  if (REntorno.Pais = 'CHL') then
  begin
     if (DMFacturas.DocumentoDteValido) then
     begin // Verificamos si se envia el documento con la API Factronica
        if ((LeeParametro('DTEENVI004') = 'S') or ((DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '39') or (DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '41'))) then
        begin
           AbreData(TDMDTEChl, DMDTEChl);
           try
              DMDTEChl.EnviaDTE(DMFacturas.QMCabeceraID_S.AsInteger);
           finally
              CierraData(DMDTEChl);
           end;
        end
        else
        begin
           AbreData(TDMEnviaXMLFacturasChl, DMEnviaXMLFacturasChl);
           try
              DMEnviaXMLFacturasChl.EnviaDTE(DMFacturas.QMCabeceraID_S.AsInteger, False);
           finally
              CierraData(DMEnviaXMLFacturasChl);
           end;
        end;
        DMFacturas.QMCabecera.Refresh;
     end;
  end
  else
  if (REntorno.Pais = 'DOM') then
  begin
     if (DMFacturas.DocumentoEcfValido) then
     begin
        AbreData(TDMENCFDOM, DMENCFDOM);
        try
           DMENCFDOM.EnviaEcf(DMFacturas.QMCabeceraID_S.AsInteger);
        finally
           CierraData(DMENCFDOM);
        end;
     end;
  end;
end;

procedure TFMFacturas.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMFacturas.AEnvioTBAIExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.EnvioTBAI('Alta');
  ActualizaTicketBAI;
end;

procedure TFMFacturas.AAnularTBAIExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.AnularTBAI;
  DMFacturas.EnvioTBAI('Baja');
  ActualizaTicketBAI;
end;

procedure TFMFacturas.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.FiltraDocumento('');
end;

procedure TFMFacturas.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.FiltraDocumento('(ESTADO = 0)');
end;

procedure TFMFacturas.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.FiltraDocumento('(ESTADO = 5)');
end;

procedure TFMFacturas.DuplicarDTE(TipoDocTributario: string);
var
  Fecha : TDateTime;
begin
  if ((DMFacturas.QMCabeceraFOLIO.AsInteger > 0) and (DMFacturas.QMCabeceraESTADO.AsInteger = 5)) then
  begin
     Fecha := REntorno.FechaTrab;
     if (UFMSeleccion.PideDato('DAT', Fecha, 'Fecha de documento')) then
     begin
        Screen.Cursor := crHourGlass;
        try
           DMFacturas.Duplica(1, TipoDocTributario, Fecha) // Generamos un DTE desde el documento
        finally
           Screen.Cursor := crDefault;
        end;
     end;
  end
  else
     ShowMessage(_('El documento debe estar cerrado y tener un folio asignado'));

  HabilitaBotones;
end;

procedure TFMFacturas.DBGFDetalle1KeyPress(Sender: TObject; var Key: char);
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

procedure TFMFacturas.CBCodRefChange(Sender: TObject);
begin
  inherited;

  { TODO -oMarcelo : DEBE PASAR A TRIGGER }

  (*
  if (REntorno.Pais = 'CHL') then
  begin
     if ((DMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') and (DMFacturas.QMSIIDteReferenciaFOLIOREF.AsString <> '')) then
     begin
        if (CBCodRef.Value = '1') then
        begin

           { TODO -oMarcelo : Aqui debe borrar y luego insertar multiplicando por (-1) }

           // Si la Razon de referencia es igual a 1 : Anula Documento de Referencia, pasamos a negativo todas las unidades
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE VER_DETALLE_FACTURA SET UNIDADES = UNIDADES * (-1) ');
                 SQL.Add(' WHERE ID_S = :ID_S ');
                 Params.ByName['ID_S'].AsInteger := DMFacturas.QMCabeceraID_S.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           DMFacturas.QMCabecera.Refresh;
        end
        else
        if ((CBCodRef.Value = '2') or (CBCodRef.Value = '3') or (CBCodRef.Value = '4')) then
        begin
           // Si la Razon de referencia es: 2 Corrige Texto Documento de Referencia
           // Si la Razon de referencia es: 3 Corrige cantidad
           // Si la Razon de referencia es: 4 Corrige solo monto
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' DELETE FROM VER_DETALLE_FACTURA ');
                 SQL.Add(' WHERE ID_S = :ID_S ');
                 Params.ByName['ID_S'].AsInteger := DMFacturas.QMCabeceraID_S.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           DMFacturas.QMCabecera.Refresh;
        end;
     end;
  end;
  *)
end;

procedure TFMFacturas.TSDirManualResize(Sender: TObject);
begin
  inherited;
  PNLDirRecogida.Width := TSDirManual.Width div 2;
end;

{
procedure TFMFacturas.EstableceVisibilidadPrecio;
var
  i : integer;
begin
  // Busco columna Precio de Coste
  i := EncuentraField(DBGFDetalle1, 'PRECIO');
  if (i >= 0) then
  begin
     with DBGFDetalle1.Columns.Items[i] do
     begin
        // ReadOnly := False;
        // Color := clWindow;

        ReadOnly := True;
        Color := clInfoBk;
     end;
  end;
end;
}

procedure TFMFacturas.ADetallesDeLineaExecute(Sender: TObject);
begin
  inherited;
  TFMDetalleDeLinea.Create(Self).Muestra(DMFacturas.QMDetalleID_DETALLES_S.AsInteger);
  DMFacturas.QMDetalle.Refresh;
end;

procedure TFMFacturas.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('FAC', DMFacturas.QMCabeceraID_S.AsInteger, Ficheros[i]);
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

procedure TFMFacturas.AExportarExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := LimpiaNombreFichero(Format(_('Factura_%d-%s-%.5d_%s.xls'), [DMFacturas.QMCabeceraEJERCICIO.AsInteger, DMFacturas.QMCabeceraSERIE.AsString, DMFacturas.QMCabeceraRIG.AsInteger, FormatDateTime('yyyymmdd-hhnnss', Now)]));
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMFacturas') then
  begin
     Screen.Cursor := crHourGlass;
     try
        AbreData(TDMLstFactura, DMLstFactura);
        DMLstFactura.ExportarExcel(DMFacturas.QMCabeceraID_S.AsInteger, Archivo);
     finally
        Screen.Cursor := crDefault;
        CierraData(DMLstFactura);
     end;
  end;
end;

procedure TFMFacturas.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMFacturas.QMDetalleTIPO.AsString, DMFacturas.QMDetalleID_S.AsInteger);

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
                 Params.ByName['ID_S'].AsInteger := DMFacturas.QMDetalleID_S.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMFacturas.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMFacturas.ALocalizaFolioExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.LoaclizaFolio;

  HabilitaBotones; // Ya ejecuta  RefrescaAvisos;
end;

procedure TFMFacturas.RefrescaAvisos;
begin
  if (((DMFacturas.xCliente.Active) and (Trim(DMFacturas.xCliente.FieldByName('NOTAS').AsString) > '')) or
     ((DMFacturas.xAvisos.Active) and (Trim(DMFacturas.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
     RelojNotas.Enabled := True
  else
     RelojNotas.Enabled := False;

  LNotas.Visible := RelojNotas.Enabled;

  if (DMMain.ExisteAdjunto(DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraID_S.AsInteger)) then
     RelojAdjuntos.Enabled := True
  else
     RelojAdjuntos.Enabled := False;

  LAdjuntos.Visible := RelojAdjuntos.Enabled;

  if (DMMain.EnviarFacturasClientePorEmail(DMFacturas.QMCabeceraCLIENTE.AsInteger)) then
     RelojEmail.Enabled := True
  else
     RelojEmail.Enabled := False;

  LEmail.Visible := RelojEmail.Enabled;

  LRiesgoAct.Hint := format(_('Riesgo Actual: %.2f' + #13#10 + 'Riesgo Pedido: %.2f' + #13#10 + 'Riesgo Autorizado: %.2f'), [DMFacturas.xInfoActualizadaRIESGO_ACT.AsFloat, DMFacturas.xInfoActualizadaRIESGO_PED.AsFloat, DMFacturas.xInfoActualizadaRIESGO_AUT.AsFloat]);
  LRiesgo.Hint := LRiesgoAct.Hint;
  if (DMFacturas.xInfoActualizadaRIESGO_DISPONIBLE.AsFloat < 0) then
     ColorError(PNLRiesgo)
  else
     ColorResaltado(PNLRiesgo);

  if ((DMFacturas.xCliente.Active) and (DMFacturas.QMCabeceraTIPO_PORTES.AsInteger <> DMFacturas.xCliente.FieldByName('TIPO_PORTES').AsInteger)) then
  begin
     ColorResaltado3(DBEFPortes);
     ColorResaltado3(ETituloPortes);
     ETituloPortes.Font.Color := clWhite;
     DBEFPortes.Hint := format(_('El porte del cliente es habitualmente %d'), [DMFacturas.QMCabeceraTIPO_PORTES.AsInteger]);
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

  if ((DMFacturas.xCliente.Active) and (DMFacturas.xCliente.FieldByName('TERCERO').AsInteger > 0) and (Trim(DMFacturas.xCliente.FieldByName('NIF').AsString) = '')) then
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

procedure TFMFacturas.PNLEdOtrosResize(Sender: TObject);
begin
  inherited;
  DBMLegalLiterals.Width := PNLEdOtros.Width - DBMLegalLiterals.Left;
end;

procedure TFMFacturas.DBEFMotivoAbonoChange(Sender: TObject);
begin
  inherited;
  EMotivoAbono.Text := DMMain.DameMotivoAbono(StrToIntDef(DBEFMotivoAbono.Text, 0));
end;

procedure TFMFacturas.TSProveedoresShow(Sender: TObject);
begin
  inherited;
  DMFacturas.ConectaProveedores;
end;

procedure TFMFacturas.TBComprobarClick(Sender: TObject);
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

procedure TFMFacturas.TBAgregarPalabraClick(Sender: TObject);
var
  Origen : string;
begin
  inherited;
  Origen := format('%s-%d-%s/%d', [DMFacturas.QMCabeceraTIPO.AsString, DMFacturas.QMCabeceraEJERCICIO.AsInteger, DMFacturas.QMCabeceraSERIE.AsString, DMFacturas.QMCabeceraRIG.AsInteger]);
  DMMain.AgregarPalabra(LBPalabras.Items[LBPalabras.ItemIndex], Origen);
  TBComprobar.Click;
end;

procedure TFMFacturas.AImportaFacturasExecute(Sender: TObject);
begin
  inherited;
  DMFacturas.ImportacionFacturas(EFSerie.Text);
end;

procedure TFMFacturas.AImportaFacturas2Execute(Sender: TObject);
begin
  inherited;
  DMFacturas.ImportacionFacturas2(EFSerie.Text);
end;

procedure TFMFacturas.AEnviaFactoingCHLExecute(Sender: TObject);
var
  Proveedor : integer;
begin
  inherited;
  if (DMFacturas.DocumentoAECValido) then
  begin
     Proveedor := 0;
     if (PideDato('PRO', Proveedor, '', 'FACTORING = 1')) then
        DMFacturas.EnviaDocumentoFactoring(Proveedor);
  end;
end;

procedure TFMFacturas.ActualizaVerifactu;
begin
  // Colorea segun estado de presentación Verifactu
  DBEEstadoAltaVerifactuChange(nil);
  DBEEstadoAnulacionVerifactuChange(nil);

  if (DMFacturas.xVerifactu.Active) then
     CrearCodigoQR(ImgQRVerifactu.Picture.Bitmap, DBEQRVerifactu.Text, 3);
end;

procedure TFMFacturas.TSVerifactuShow(Sender: TObject);
begin
  inherited;
  ActualizaVerifactu;
end;

procedure TFMFacturas.DBEFactoringStatusChange(Sender: TObject);
begin
  inherited;
  if (DBEFactoringStatus.Text = '0') then
     ETituloStatus.Text := _('Envío recibido OK')
  else if (DBEFactoringStatus.Text = '1') then
     ETituloStatus.Text := _('Rut usuario autenticado no tiene permiso para enviar en empresa Cedente')
  else if (DBEFactoringStatus.Text = '2') then
     ETituloStatus.Text := _('Error en tamaño del archivo enviado')
  else if (DBEFactoringStatus.Text = '4') then
     ETituloStatus.Text := _('Faltan parámetros de entrada')
  else if (DBEFactoringStatus.Text = '5') then
     ETituloStatus.Text := _('Error de autenticación, TOKEN inválido, no existe o está expirado')
  else if (DBEFactoringStatus.Text = '6') then
     ETituloStatus.Text := _('Empresa no es DTE')
  else if (DBEFactoringStatus.Text = '9') then
     ETituloStatus.Text := _('Error Interno')
  else if (DBEFactoringStatus.Text = '10') then
     ETituloStatus.Text := _('Error Interno')
  else
     ETituloStatus.Text := _('Sin estado');
end;

procedure TFMFacturas.TSEnvioECFShow(Sender: TObject);
begin
  inherited;
  DMFacturas.xFacturaDGII.Open;
  ActualizaECF;
end;

procedure TFMFacturas.ActualizaECF;
begin
  if (DMFacturas.xFacturaDGII.Active) then
     CrearCodigoQR(ImgQRECF.Picture.Bitmap, DBEQRECF.Text, 3);
end;

procedure TFMFacturas.SBConsultaEstadoECFClick(Sender: TObject);
begin
  inherited;
  if ((DMFacturas.xFacturaDGIIID_ENVIO.AsString > '') and (DMFacturas.xFacturaDGIITRACK_ID.AsString = '')) then
  begin
     AbreData(TDMENCFDOM, DMENCFDOM);
     try
        DMENCFDOM.ConsultaEcf(DMFacturas.QMCabeceraID_S.AsInteger);
     finally
        CierraData(DMENCFDOM);
     end;

     DMFacturas.QMCabecera.Refresh;
  end;
end;

procedure TFMFacturas.AIncrementarPrecioExecute(Sender: TObject);
var
  Factor : double;
begin
  inherited;

  Factor := 1;
  if (PideDato('DBL', Factor, _('Factor'))) then
  begin
     DMFacturas.MultiplicaPrecios(Factor);
  end;
end;

procedure TFMFacturas.DBEFTipoCFChange(Sender: TObject);
begin
  inherited;
  ETipoCFTitulo.Text := DameTituloTipoDocTributario(DBEFTipoCF.Text);
end;

procedure TFMFacturas.CBTipoRefChange(Sender: TObject);
begin
  inherited;
  // ETipoRefTitulo.Text := DameTituloReferencia(StrToIntDef(CBTipoRef.Text,0));
end;

function TFMFacturas.DameTituloReferencia(Codigo: integer): string;
begin
  case Codigo of
     0: Result := _('Desconocido');
     1: Result := _('Anulación total');
     2: Result := _('Corrige texto del comprobante fiscal modificado');
     3: Result := _('Corrige montos del NCF modificado');
     4: Result := _('Reemplazo NCF emitido en contingencia');
     else
        Result := _('Codigo desconocido')
  end;
end;

procedure TFMFacturas.AAnulaDocumentoExecute(Sender: TObject);
begin
  inherited;
  // DMMain.Log('TFMFacturas.AAnulaDocumentoExecute');

  // Latino
  if (DMMain.EstadoKri(410) = 1) then
  begin
     AbreForm(TZFMAnulacionFacturas, ZFMAnulacionFacturas, Sender);
     ZFMAnulacionFacturas.Muestra(DMFacturas.QMCabeceraID_S.AsInteger, DMFacturas.QMCabeceraTIPO.AsString);
     DMFacturas.RefrescaCabecera(2);
  end;

  if (REntorno.Pais = 'ESP') and DMMain.UtilizaVerifactu then
  begin
     if ConfirmaMensaje(_('Esta seguro de que desea anular factura')) and ConfirmaGrave then
        DMFacturas.AnulaDocumento;
  end;
end;

procedure TFMFacturas.AResumeFacturaExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Esta seguro de que desea agrupar lineas de factura')) and ConfirmaGrave then
     DMFacturas.ResumeDocumento;
end;

procedure TFMFacturas.DBEEstadoAltaVerifactuChange(Sender: TObject);
begin
  inherited;
  if (DMFacturas.QMCabeceraVF_ESTADO_REGISTRO_ALTA.AsString > '') then
  begin
     if (DMFacturas.QMCabeceraVF_CODIGO_ERROR_ALTA.AsString = '0') then
        ColorResaltado2(DBEEstadoAltaVerifactu)
     else
        ColorError(DBEEstadoAltaVerifactu);
  end
  else
     ColorInactivoInvisible(DBEEstadoAltaVerifactu);
end;

procedure TFMFacturas.DBEEstadoAnulacionVerifactuChange(Sender: TObject);
begin
  inherited;
  if (DMFacturas.QMCabeceraVF_ESTADO_REGISTRO_ANULACION.AsString > '') then
  begin
     if (DMFacturas.QMCabeceraVF_CODIGO_ERROR_ANULACION.AsString = '0') then
        ColorResaltado2(DBEEstadoAnulacionVerifactu)
     else
        ColorError(DBEEstadoAnulacionVerifactu);
  end
  else
     ColorInactivoInvisible(DBEEstadoAnulacionVerifactu);
end;

procedure TFMFacturas.AGeneraNotaDeCreditoExecute(Sender: TObject);
begin
  if (DMFacturas.ExiteDocumentoReferido('61')) then
  begin
     if ConfirmaMensaje(_('El documento ya tiene referenciada una Nota de credito' + #13#10 + '¿Desea continuar?')) then
     begin
        DuplicarDTE('61');
     end;
  end
  else
     DuplicarDTE('61');
end;

procedure TFMFacturas.AGeneraNotaDeDebitoExecute(Sender: TObject);
begin
  inherited;
  if (DMFacturas.ExiteDocumentoReferido('56')) then
  begin
     if ConfirmaMensaje(_('El documento ya tiene referenciada una Nota de debito' + #13#10 + '¿Desea continuar?')) then
     begin
        DuplicarDTE('56');
     end;
  end
  else
     DuplicarDTE('56');
end;

end.
