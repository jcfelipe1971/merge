unit UFMProveedores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UTeclas, UControlEdit, StdCtrls, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls,
  DBCtrls, UFIBDBEditfind, Mask, UComponentesBusquedaFiltrada, UFPEdit,
  Buttons, ActnList, UDMProveedores, UDBDateTimePicker, dbcgrids, rxPlacemnt,
  NsDBGrid, rxToolEdit, RXDBCtrl, URecursos, ULFDBCtrlGrid, ULFDBMemo, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, DBActns, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, UG2kTBLoc, DB, ULFEdit, TFlatPanelUnit, TeEngine,
  Series, TeeProcs, Chart, DbChart, ULFEditFind2000, idGlobalProtocols,
  DbComboBoxValue, ULFDBDateEdit, ULFComboBox, ULFDateEdit;

type
  TFMProveedores = class(TFPEdit)
     TSNotas: TTabSheet;
     LProveedor: TLFLabel;
     LTercero: TLFLabel;
     LFormaPago: TLFLabel;
     LDiasPago: TLFLabel;
     LDescuentoPP: TLFLabel;
     LDtoComercial: TLFLabel;
     LCuenta: TLFLabel;
     DBEProveedor: TLFDbedit;
     ETituloTercero: TLFEdit;
     DBEFTercero: TLFDBEditFind2000;
     DBETituloFormaPago: TLFDbedit;
     DBEDiaPago2: TLFDbedit;
     DBEDiaPago1: TLFDbedit;
     DBEDtoPP: TLFDbedit;
     DBEDto: TLFDbedit;
     PEditNotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     TBNotas: TLFToolBar;
     ToolButton4: TToolButton;
     PInfoNotas: TLFPanel;
     DBEProveedorNotas: TLFDbedit;
     ETituloTerceroNotas: TLFEdit;
     CENotasPMEdit: TPopUpTeclas;
     NavNotas: THYMNavigator;
     DBETituloModoIva: TLFDbedit;
     LModoIVA: TLFLabel;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBEPIRPF: TLFDbedit;
     DBETituloIRPF: TLFDbedit;
     LTipoProveedor: TLFLabel;
     DBETipoTercero: TLFDbedit;
     LRetencion: TLFLabel;
     RelojNotas: TTimer;
     LBNotas: TLFLabel;
     DBCKPortes: TLFDBCheckBox;
     TSRappel: TTabSheet;
     PRappel: TLFPanel;
     TBRappel: TLFToolBar;
     NAVRappel: THYMNavigator;
     ToolButton2: TToolButton;
     DBGDetalle: THYTDBGrid;
     PNLRappel: TLFPanel;
     ERappelAnual: THYGRightEdit;
     CERappel: TControlEdit;
     CERappelPMEdit: TPopUpTeclas;
     DBCBAnticipos: TLFDBCheckBox;
     DBEFFormaPago: TLFDBEditFind2000;
     DBEFModoIva: TLFDBEditFind2000;
     DBEFTipoTercero: TLFDBEditFind2000;
     DBCBEvalFebSi: TLFDBCheckBox;
     DBCBEvalFeb: TLFDBCheckBox;
     DBEFMoneda: TLFDBEditFind2000;
     DBEMoneda: TLFDbedit;
     LBMoneda: TLFLabel;
     ALProveedores: TLFActionList;
     ANewTercero: TAction;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     SBAContaExtracto: TSpeedButton;
     MISepEnlaces: TMenuItem;
     MIVerDatosTercero: TMenuItem;
     DBCBISO9000: TLFDBCheckBox;
     DBDTPFecha: TLFDBDateEdit;
     LBLFecha9000: TLFLabel;
     DBCBFinanciacion: TLFDBCheckBox;
     DBEPor_Financiacion: TLFDbedit;
     LPorcFinanciacion: TLFLabel;
     TSAgrupaciones: TTabSheet;
     TBProv: TLFToolBar;
     PNLAgrupacionesProv: TLFPanel;
     DBEProveedorAgrupaciones: TLFDbedit;
     ETituloTerceroAgrupaciones: TLFEdit;
     NavAgrupaciones: THYMNavigator;
     CEAgrupaciones: TControlEdit;
     PPertenece: TLFPanel;
     DBCGPertenece: TLFDBCtrlGrid;
     DBEAgDentro: TLFDbedit;
     DBEAgTitDentro: TLFDbedit;
     PDisponibles: TLFPanel;
     DBCGDisponibles: TLFDBCtrlGrid;
     DBEAgCodDisp: TLFDbedit;
     DBEAgTitDisp: TLFDbedit;
     CEAgrupacionesPMEdit: TPopUpTeclas;
     HYMNavDisp: THYMNavigator;
     CEAgrupacionesDisp: TControlEdit;
     CEAgrupacionesDispPMEdit: TPopUpTeclas;
     DBFacSerie: TLFDBCheckBox;
     DBEFSeries: TLFDBEditFind2000;
     DBFacAlmacen: TLFDBCheckBox;
     LblPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     DBEPais: TLFDbedit;
     DBChkBIntra: TLFDBCheckBox;
     LblTipoTrans: TLFLabel;
     DBEFTipoTrans: TLFDBEditFind2000;
     DBETipoTrans: TLFDbedit;
     ToolButton3: TToolButton;
     ToolButton5: TToolButton;
     AEtiquetasProveedor: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AVisualizarListadoProveedores: TAction;
     AImprimirListadoProveedores: TAction;
     AVisualizarDatosFiscales: TAction;
     AImprimirDatosFiscales: TAction;
     AVisualizarListDir: TAction;
     AImprimirListDir: TAction;
     AListadoDirporCPostal: TAction;
     AEtiquetas: TAction;
     AConfProveedores: TAction;
     AConfListadosDatosFiscalesProveedores: TAction;
     AConfListadosDir: TAction;
     AConfListadoDirCPostal: TAction;
     AConfEtiquetas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AComprasArticulosProv: TAction;
     LFCategoryAction3: TLFCategoryAction;
     LBLRappelAnual: TLFLabel;
     ACalculoRappelAnual: TLFDatasetAction;
     LFCategoryAction4: TLFCategoryAction;
     LblDiasEntrega: TLFLabel;
     DBEDiasEntrega: TLFDbedit;
     AComprasDetalladas: TAction;
     AConfComprasDetalladas: TAction;
     ASep: TAction;
     ASep2: TAction;
     DBEFCuentaDtoPP: TLFDBEditFind2000;
     LCtaDtoPP: TLFLabel;
     DBETitCtaDtoPP: TLFDbedit;
     AIncidencias: TAction;
     TSIncidencias: TTabSheet;
     DBGIncidencias: THYTDBGrid;
     TBIncidencias: TLFToolBar;
     PNLIncidenciasProv: TLFPanel;
     DBEProveedorIncidencias: TLFDbedit;
     ETituloTerceroIncidencias: TLFEdit;
     EFProveedor: TLFEditFind2000;
     LBTipoPortes: TLFLabel;
     DBEFPortes: TLFDBEditFind2000;
     DBEFTitPortes: TLFDbedit;
     LBPorPortes: TLFLabel;
     DBEPorPortes: TLFDbedit;
     LBIPortes: TLFLabel;
     DBEIPortes: TLFDbedit;
     LFDBCheckBox1: TLFDBCheckBox;
     TSEstadisticas: TTabSheet;
     LFTEstadisticas: TLFToolBar;
     DBEProveedorEstadisitcas: TLFDbedit;
     ETituloTerceroEstadisticas: TLFEdit;
     LFPCEstadisticas: TLFPageControl;
     TSDocumentos: TTabSheet;
     TSGrafico: TTabSheet;
     FPDocumentos: TFlatPanel;
     LPedidosPendientes: TLFLabel;
     LFLAlbPend: TLFLabel;
     LFLFactPend: TLFLabel;
     LNum: TLFLabel;
     LBaseImponible: TLFLabel;
     LLiquido: TLFLabel;
     LFEPedPend: TLFEdit;
     LFEAlbPend: TLFEdit;
     LFEFactPend: TLFEdit;
     LFDEFactPendLIQUIDO: TLFDbedit;
     LFDEAlbPendLIQUIDO: TLFDbedit;
     LFDEPedPendLIQUIDO: TLFDbedit;
     LFDEPedPendBASE: TLFDbedit;
     LFDEAlbPendBASE: TLFDbedit;
     LFDEFactPendBASE: TLFDbedit;
     LFDEFactPendNUMERO: TLFDbedit;
     LFDEAlbPendNUMERO: TLFDbedit;
     LFDEPedPendNUMERO: TLFDbedit;
     FPImpagados: TFlatPanel;
     LRecPend: TLFLabel;
     LRecPendRetraso: TLFLabel;
     LRecPendPlazo: TLFLabel;
     LRecNoCob: TLFLabel;
     LRecImp: TLFLabel;
     LFFactCobr: TLFLabel;
     LFEEstadoRecPend: TLFEdit;
     LFDERecImpagadosIMPORTE: TLFDbedit;
     LFEEstadoRecImp: TLFEdit;
     LFEEstadoRecNoCob: TLFEdit;
     LFDERecImpagadosNUMERO: TLFDbedit;
     LFDERecNoCobradosIMPORTE: TLFDbedit;
     LFDERecNoCobradosNUMERO: TLFDbedit;
     LFDERecPendNUMERO: TLFDbedit;
     LFDERecPendRetraso: TLFDbedit;
     LFDEREcPendPLazo: TLFDbedit;
     LFDERecPendIMPORTE: TLFDbedit;
     LFDFactCobrNUMERO: TLFDbedit;
     LFDFactCobrLIQUIDO: TLFDbedit;
     LFEFactCobr: TLFEdit;
     FlatPanel1: TFlatPanel;
     LPPRecibir: TLFLabel;
     LFDEPPRecibirNUMERO: TLFDbedit;
     LFDEPPRecibirIMPORTE: TLFDbedit;
     LPPCobrar: TLFLabel;
     LFDEPPCobrarNUMERO: TLFDbedit;
     LFDEPPCobrarIMPORTE: TLFDbedit;
     LAnticipo: TLFLabel;
     LFDEAnticipo: TLFDbedit;
     LFEAnticipo: TLFEdit;
     LAntCuenta: TLFLabel;
     LFDEAntCuenta: TLFDbedit;
     LFEPPRecibir: TLFEdit;
     LFEPPCobrar: TLFEdit;
     LFestadisticas: TLFPanel;
     LEstadisticasEnero: TLFLabel;
     LEstadisticasFebrero: TLFLabel;
     LEstadisticasMarzo: TLFLabel;
     LEstadisticasAbril: TLFLabel;
     LEstadisticasMayo: TLFLabel;
     LEstadisticasJunio: TLFLabel;
     LEstadisticasJulio: TLFLabel;
     LEstadisticasAgosto: TLFLabel;
     LEstadisticasSeptiembre: TLFLabel;
     LEstadisticasOctubre: TLFLabel;
     LEstadisticasNoviembre: TLFLabel;
     LEstadisticasDiciembre: TLFLabel;
     LFComparar: TLFLabel;
     LFActual: TLFLabel;
     LFPrevision: TLFLabel;
     LEstadisticasTotal: TLFLabel;
     LEstadisticaBaseEjercicio: TLFLabel;
     LEstadisticaBaseEjercicioSig: TLFLabel;
     LEstadisticaBasePrevision: TLFLabel;
     LPorcentajeEstimacion: TLFLabel;
     LFLEjercicioActual: TLFLabel;
     LFLEjercicioComparar: TLFLabel;
     LTipoDoc: TLFLabel;
     LEstadisticasMoneda: TLFLabel;
     DBEFBaseEneroAC: TLFDbedit;
     DBEFBaseFebreroAC: TLFDbedit;
     DBEFBaseMarzoAC: TLFDbedit;
     DBEFBaseAbrilAC: TLFDbedit;
     DBEFBaseMayoAC: TLFDbedit;
     DBEFBaseJunioAC: TLFDbedit;
     DBEFBaseJulioAC: TLFDbedit;
     DBEFBaseAgostoAC: TLFDbedit;
     DBEFBaseSeptiembreAC: TLFDbedit;
     DBEFBaseOctubreAC: TLFDbedit;
     DBEFBaseNoviembreAC: TLFDbedit;
     DBEFBaseDiciembreAC: TLFDbedit;
     DBEFBaseEneroCOMP: TLFDbedit;
     DBEFBaseFebreroCOMP: TLFDbedit;
     DBEFBaseMarzoCOMP: TLFDbedit;
     DBEFBaseAbrilCOMP: TLFDbedit;
     DBEFBaseMayoCOMP: TLFDbedit;
     DBEFBaseJunioCOMP: TLFDbedit;
     DBEFBaseJulioCOMP: TLFDbedit;
     DBEFBaseAgostoCOMP: TLFDbedit;
     DBEFBaseSeptiembreCOMP: TLFDbedit;
     DBEFBaseOctubreCOMP: TLFDbedit;
     DBEFBaseNoviembreCOMP: TLFDbedit;
     DBEFBaseDiciembreCOMP: TLFDbedit;
     DBEFBaseEneroPREV: TLFDbedit;
     DBEFBaseFebreroPREV: TLFDbedit;
     DBEFBaseMarzoPREV: TLFDbedit;
     DBEFBaseAbrilPREV: TLFDbedit;
     DBEFBaseMayoPREV: TLFDbedit;
     DBEFBaseJunioPREV: TLFDbedit;
     DBEFBaseJulioPREV: TLFDbedit;
     DBEFBaseAgostoPREV: TLFDbedit;
     DBEFBaseSeptiembrePREV: TLFDbedit;
     DBEFBaseOctubrePREV: TLFDbedit;
     DBEFBaseNoviembrePREV: TLFDbedit;
     DBEFBaseDiciembrePREV: TLFDbedit;
     DBEFTotalBaseAC: TLFDbedit;
     DBEFTotalBaseCOMP: TLFDbedit;
     DBEFTotalBasePREV: TLFDbedit;
     DBEFLiquidoEneroAC: TLFDbedit;
     DBEFLiquidoFebreroAC: TLFDbedit;
     DBEFLiquidoMarzoAC: TLFDbedit;
     DBEFLiquidoAbrilAC: TLFDbedit;
     DBEFLiquidoMayoAC: TLFDbedit;
     DBEFLiquidoJunioAC: TLFDbedit;
     DBEFLiquidoJulioAC: TLFDbedit;
     DBEFLiquidoAgostoAC: TLFDbedit;
     DBEFLiquidoSeptiembreAC: TLFDbedit;
     DBEFLiquidoOctubreAC: TLFDbedit;
     DBEFLiquidoNoviembreAC: TLFDbedit;
     DBEFLiquidoDiciembreAC: TLFDbedit;
     DBEFTotalLiquidoAC: TLFDbedit;
     DBEFLiquidoEneroCOMP: TLFDbedit;
     DBEFLiquidoFebreroCOMP: TLFDbedit;
     DBEFLiquidoMarzoCOMP: TLFDbedit;
     DBEFLiquidoAbrilCOMP: TLFDbedit;
     DBEFLiquidoMayoCOMP: TLFDbedit;
     DBEFLiquidoJunioCOMP: TLFDbedit;
     DBEFLiquidoJulioCOMP: TLFDbedit;
     DBEFLiquidoAgostoCOMP: TLFDbedit;
     DBEFLiquidoSeptiembreCOMP: TLFDbedit;
     DBEFLiquidoOctubreCOMP: TLFDbedit;
     DBEFLiquidoNoviembreCOMP: TLFDbedit;
     DBEFLiquidoDiciembreCOMP: TLFDbedit;
     DBEFTotalLiquidoCOMP: TLFDbedit;
     DBEFLiquidoEneroPREV: TLFDbedit;
     DBEFLiquidoFebreroPREV: TLFDbedit;
     DBEFLiquidoMarzoPREV: TLFDbedit;
     DBEFLiquidoAbrilPREV: TLFDbedit;
     DBEFLiquidoMayoPREV: TLFDbedit;
     DBEFLiquidoJunioPREV: TLFDbedit;
     DBEFLiquidoJulioPREV: TLFDbedit;
     DBEFLiquidoAgostoPREV: TLFDbedit;
     DBEFLiquidoSeptiembrePREV: TLFDbedit;
     DBEFLiquidoOctubrePREV: TLFDbedit;
     DBEFLiquidoNoviembrePREV: TLFDbedit;
     DBEFLiquidoDiciembrePREV: TLFDbedit;
     DBEFTotalLiquidoPREV: TLFDbedit;
     EPorcentajeEstimacion: TLFEdit;
     BBEjercicioComparar: TBitBtn;
     EEjercicio2: TLFEdit;
     EEjercicio: TLFEdit;
     CBTipoDoc: TLFComboBox;
     BBMultiSelect: TBitBtn;
     CBMonedas: TLFComboBox;
     LFGrafica: TLFPanel;
     DBCAnual: TDBChart;
     Series7: TBarSeries;
     Series6: TBarSeries;
     Series5: TBarSeries;
     Series2: TBarSeries;
     Series1: TBarSeries;
     DBCMensual: TDBChart;
     BarSeries4: TBarSeries;
     BarSeries3: TBarSeries;
     DBCPrevision: TDBChart;
     BarSeries2: TBarSeries;
     BarSeries1: TBarSeries;
     ACalculaEstadisticas: TAction;
     APedPendDet: TAction;
     AAlbaranesDet: TAction;
     AFactPendDet: TAction;
     AFactCobDet: TAction;
     ARecibosImpagados: TAction;
     ARecibosPenRec: TAction;
     SBVerPedPend: TSpeedButton;
     SBVerAlbPend: TSpeedButton;
     SBVerFacPend: TSpeedButton;
     SBVerFacPag: TSpeedButton;
     SBVerImpagados: TSpeedButton;
     SBVerRecPendPag: TSpeedButton;
     SBVerRecPendRec: TSpeedButton;
     ARecibosPenPag: TAction;
     AProveedoresPorAgrupacion: TAction;
     LTransportistaKri: TLFLabel;
     DBEFTransportistaKri: TLFDBEditFind2000;
     LTransportistaRapiddoKri: TLFLabel;
     ETransportistaKri: TLFEdit;
     ETransportistaRapidoKri: TLFEdit;
     LDiasTransportistaKri: TLFLabel;
     DBEDiasTransportistaKri: TLFDbedit;
     LDiasTransportistaRapidoKri: TLFLabel;
     DBEDiasTransportistaRapidoKri: TLFDbedit;
     DBEDiasConfirmacionFechaKri: TLFDbedit;
     LDiasConfirmacionFechaKri: TLFLabel;
     DBEFTransportistaRapidoKri: TLFDBEditFind2000;
     TSComunicaciones: TTabSheet;
     CEComunicaciones: TControlEdit;
     DBGComunicaciones: TDBGridFind2000;
     TBComunicaciones: TLFToolBar;
     PNLComunicacionesProv: TLFPanel;
     DBEProveedorComunicaciones: TLFDbedit;
     ETituloTerceroComunicaciones: TLFEdit;
     ToolButton9: TToolButton;
     NavComunicaciones: THYMNavigator;
     ToolButton10: TToolButton;
     LComunicacionesBusqueda: TLFLabel;
     EFComunicacionesBusqueda: TLFEditFind2000;
     TButtEnviarComunicacionXMail: TToolButton;
     AEnviarComunicacionXMail: TAction;
     TButtImportarArchivoComunicacion: TToolButton;
     AImportarArchivoComunicacion: TAction;
     TButtPlantillaComunicacion: TToolButton;
     PMPlantillasComunicaciones: TPopupMenu;
     TSDescuentos: TTabSheet;
     TBDescuentos: TLFToolBar;
     PNLDescuentosProv: TLFPanel;
     DBEProveedorDescuentos: TLFDbedit;
     ETituloTerceroDescuentos: TLFEdit;
     ToolButton1: TToolButton;
     NavDescuentos: THYMNavigator;
     PNLDescuentos: TLFPanel;
     CEDescuentos: TControlEdit;
     CEDescuentosPMEdit: TPopUpTeclas;
     DBGDescuentos: TDBGridFind2000;
     LFCategoryAction5: TLFCategoryAction;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     AAdjuntoTransportista: TAction;
     AAdjuntoTransportistaRapido: TAction;
     LBloqueo: TLFLabel;
     DBCBBloqueo: TDBComboBoxValue;
     DBEMotivoBloqueo: TLFDbedit;
     LMotivoBloqueo: TLFLabel;
     TSIso: TTabSheet;
     DBGIso: TDBGridFind2000;
     LCodigoIncoterm: TLFLabel;
     DBEFCodigooIncoterm: TLFDBEditFind2000;
     ECodigoIncoterm: TLFEdit;
     LEstadisticaLiquidoEjercicio: TLFLabel;
     LEstadisticaLiquidoEjercicioSig: TLFLabel;
     LEstadisticaLiquidoEjercicioPrevision: TLFLabel;
     DBECuenta: TLFDBEditFind2000;
     DBEMotivoBaja: TLFDbedit;
     DBDTPFechaBaja: TLFDBDateEdit;
     DBCHKBaja: TLFDBCheckBox;
     LTipoNCF: TLFLabel;
     DBLCBTipoNCF: TDBLookupComboBox;
     ToolButton6: TToolButton;
     TButtImprimirNotas: TToolButton;
     AImprimirNotas: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     ETituloIdioma: TLFEdit;
     DBChkBRECC: TLFDBCheckBox;
     LBancoParaPagos: TLFLabel;
     DBEFBancoParaPagos: TLFDBEditFind2000;
     ETituloBancoParaPagos: TLFEdit;
     LProveedorPrestashop: TLFLabel;
     DBEProveedorPrestashop: TLFDbedit;
     LUltSincronizacion: TLFLabel;
     DEUltSincronizacion: TLFDBDateEdit;
     DBChkBValorarPed: TLFDBCheckBox;
     DBChkBValorarAlb: TLFDBCheckBox;
     LMotivoBaja: TLFLabel;
     LGrupoCuentas: TLFLabel;
     DBEFGrupoCuentas: TLFDBEditFind2000;
     ETitGrupoCuentas: TLFEdit;
     TSCompras: TTabSheet;
     PNLFltroVentas: TLFPanel;
     LTipoDocumento: TLFLabel;
     LSerieCompras: TLFLabel;
     LFechaCompras: TLFLabel;
     LArticuloCompras: TLFLabel;
     LDescripcion: TLFLabel;
     CBTipoDocumento: TLFComboBox;
     CBSerieCompra: TLFComboBox;
     DEFechaComprasDesde: TLFDateEdit;
     DEFechaComprasHasta: TLFDateEdit;
     EFArticuloCompras: TLFEditFind2000;
     CBPedidosPendientes: TLFCheckBox;
     EDescripcion: TLFEdit;
     TBVentas: TLFToolBar;
     PNLVentasCliente: TLFPanel;
     DBEComprasProveedor: TLFDbedit;
     DBEComprasTitulo: TLFDbedit;
     TB: TToolButton;
     NavCompras: THYMNavigator;
     PCCompras: TLFPageControl;
     TSComrasDocumentos: TTabSheet;
     DBGComprasDocumento: THYTDBGrid;
     TSComprasDetalle: TTabSheet;
     DBGComprasDetalle: THYTDBGrid;
     LFCategoryAction7: TLFCategoryAction;
     AFacturasProveedorTodas: TAction;
     AFacturasProveedorAbiertas: TAction;
     AFacturasProveedorCerradas: TAction;
     LFCategoryAction8: TLFCategoryAction;
     AAlbaranesProveedorTodas: TAction;
     AAlbaranesProveedorAbiertas: TAction;
     AAlbaranesProveedorCerradas: TAction;
     LFCategoryAction10: TLFCategoryAction;
     APedidosProveedorTodas: TAction;
     APedidosProveedorAbiertas: TAction;
     APedidosProveedorCerradas: TAction;
     LFCategoryAction6: TLFCategoryAction;
     LCuentaIRPF: TLFLabel;
     DBEFCuentaIRPF: TLFDBEditFind2000;
     ETituloCuentaIRPF: TLFEdit;
     DBENIF: TLFDbedit;
     LNIF: TLFLabel;
     TSFacturaElectronica: TTabSheet;
     TBTipoGiro: TLFToolBar;
     NavTipoGiro: THYMNavigator;
     DBGFTipoGiro: TDBGridFind2000;
     DBEImporteMinimoPorte: TLFDbedit;
     LImporteMinimoPorte: TLFLabel;
     Splitter1: TSplitter;
     DBMMDatosIncidencia: TLFDBMemo;
     TSAvisos: TTabSheet;
     TBAvisos: TLFToolBar;
     PNLAvisosProveedor: TLFPanel;
     DBEProveedorAvisos: TLFDbedit;
     ETituloTerceroAvisos: TLFEdit;
     TSep1: TToolButton;
     NavAvisos: THYMNavigator;
     CEAvisos: TControlEdit;
     CEAvisosPMEdit: TPopUpTeclas;
     PNLAvisos: TLFPanel;
     DBCBAvisoActivoOCP: TLFDBCheckBox;
     DBMAvisoOCP: TLFDBMemo;
     DBCBAvisoActivoPEP: TLFDBCheckBox;
     DBMAvisoPEP: TLFDBMemo;
     DBCBAvisoActivoALP: TLFDBCheckBox;
     DBMAvisoALP: TLFDBMemo;
     DBCBAvisoActivoFAP: TLFDBCheckBox;
     DBMAvisoFAP: TLFDBMemo;
     DBCBAvisoActivoOFP: TLFDBCheckBox;
     DBMAvisoOFP: TLFDBMemo;
     DBEDiaPago3: TLFDbedit;
     LFechaAlta: TLFLabel;
     DBEFechaAlta: TLFDbedit;
     LCuentaGastos: TLFLabel;
     DBEFCuentaGastos: TLFDBEditFind2000;
     ETituloCuentaGastos: TLFEdit;
     TSArticulos: TTabSheet;
     TBCodPro: TLFToolBar;
     DBEProveedorArticulos: TLFDbedit;
     ETituloTerceroArticulos: TLFEdit;
     NavArticulo: THYMNavigator;
     ToolButton7: TToolButton;
     DBGProArt: TDBGridFind2000;
     CEArticulos: TControlEdit;
     CEArticulosPMEdit: TPopUpTeclas;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     MenuItem8: TMenuItem;
     MenuItem9: TMenuItem;
     MenuItem10: TMenuItem;
     MenuItem11: TMenuItem;
     MenuItem12: TMenuItem;
     MenuItem13: TMenuItem;
     MenuItem14: TMenuItem;
     MenuItem15: TMenuItem;
     MenuItem16: TMenuItem;
     MenuItem17: TMenuItem;
     MenuItem18: TMenuItem;
     MenuItem19: TMenuItem;
     MenuItem20: TMenuItem;
     MenuItem21: TMenuItem;
     MenuItem22: TMenuItem;
     MenuItem23: TMenuItem;
     MenuItem24: TMenuItem;
     PNLArticulosProveedor: TLFPanel;
     AContaExtracto: TAction;
     AConfigCircularizacion: TAction;
     LFCategoryAction9: TLFCategoryAction;
     AVisualizarCartaCircularizacion: TAction;
     AImprimirCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion2: TAction;
     AAccesoDirecto: TAction;
     LCampo1: TLFLabel;
     DBECampo1: TLFDbedit;
     DBECampo2: TLFDbedit;
     LCampo2: TLFLabel;
     LCampo3: TLFLabel;
     DBECampo3: TLFDbedit;
     DBECampo4: TLFDbedit;
     LCampo4: TLFLabel;
     LCampo5: TLFLabel;
     DBECampo5: TLFDbedit;
     DBECampo6: TLFDbedit;
     LCampo6: TLFLabel;
     LCampo7: TLFLabel;
     DBECampo7: TLFDbedit;
     DBECampo8: TLFDbedit;
     LCampo8: TLFLabel;
     EFiltroAgrupacion: TLFEdit;
     LProyecto: TLFLabel;
     DBEFProyecto: TDBEditFind2000;
     EProyecto: TLFEdit;
     DBCBFactoring: TLFDBCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBECuentaExit(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure MuestraFiltrado(tipo: byte);
     procedure MuestraFiltradoFiscal(tipo: byte);
     procedure RelojNotasTimer(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TButtRappelClick(Sender: TObject);
     procedure NAVRappelClick(Sender: TObject; Button: TNavigateBtn);
     procedure NAVRappelClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSFichaShow(Sender: TObject);
     procedure TSRappelShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavNotasClick(Sender: TObject; Button: TNavigateBtn);
     procedure FormActivate(Sender: TObject);
     procedure DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ANewTerceroExecute(Sender: TObject);
     procedure AATerceroExecute(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure ETituloTerceroEnter(Sender: TObject);
     procedure DBCBISO9000Click(Sender: TObject);
     procedure DBCGPerteneceDblClick(Sender: TObject);
     procedure DBCGDisponiblesDblClick(Sender: TObject);
     procedure AEtiquetasProveedorExecute(Sender: TObject);
     procedure AVisualizarListadoProveedoresExecute(Sender: TObject);
     procedure AImprimirListadoProveedoresExecute(Sender: TObject);
     procedure AVisualizarDatosFiscalesExecute(Sender: TObject);
     procedure AImprimirDatosFiscalesExecute(Sender: TObject);
     procedure AVisualizarListDirExecute(Sender: TObject);
     procedure AImprimirListDirExecute(Sender: TObject);
     procedure AListadoDirporCPostalExecute(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure AConfProveedoresExecute(Sender: TObject);
     procedure AConfListadosDatosFiscalesProveedoresExecute(Sender: TObject);
     procedure AConfListadosDirExecute(Sender: TObject);
     procedure AConfListadoDirCPostalExecute(Sender: TObject);
     procedure AConfEtiquetasExecute(Sender: TObject);
     procedure AComprasArticulosProvExecute(Sender: TObject);
     procedure ACalculoRappelAnualExecute(Sender: TObject);
     procedure AComprasDetalladasExecute(Sender: TObject);
     procedure AConfComprasDetalladasExecute(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AIncidenciasExecute(Sender: TObject);
     procedure DBGIncidenciasDblClick(Sender: TObject);
     procedure DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EFProveedorChange(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure ACalculaEstadisticasExecute(Sender: TObject);
     procedure APedPendDetExecute(Sender: TObject);
     procedure AAlbaranesDetExecute(Sender: TObject);
     procedure AFactPendDetExecute(Sender: TObject);
     procedure AFactCobDetExecute(Sender: TObject);
     procedure ARecibosImpagadosExecute(Sender: TObject);
     procedure ARecibosPenRecExecute(Sender: TObject);
     procedure TSEstadisticasShow(Sender: TObject);
     procedure TSEstadisticasHide(Sender: TObject);
     procedure DBCAnualDblClick(Sender: TObject);
     procedure DBCMensualDblClick(Sender: TObject);
     procedure DBCPrevisionDblClick(Sender: TObject);
     procedure ARecibosPenPagExecute(Sender: TObject);
     procedure BBMultiSelectClick(Sender: TObject);
     procedure AProveedoresPorAgrupacionExecute(Sender: TObject);
     procedure APedidosProveedorKriExecute(Sender: TObject);
     procedure AAlbaranesProveedorKriExecute(Sender: TObject);
     procedure AFacturasProveedorKriExecute(Sender: TObject);
     procedure DBEFTransportistaKriChange(Sender: TObject);
     procedure DBEFTransportistaRapidoKriChange(Sender: TObject);
     procedure TSComunicacionesShow(Sender: TObject);
     procedure TSComunicacionesHide(Sender: TObject);
     procedure EFComunicacionesBusquedaBusqueda(Sender: TObject);
     procedure EFComunicacionesBusquedaChange(Sender: TObject);
     procedure DBGComunicacionesCellClick(Column: TColumn);
     procedure DBGComunicacionesDblClick(Sender: TObject);
     procedure DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavComunicacionesChangeState(Sender: TObject);
     procedure AEnviarComunicacionXMailExecute(Sender: TObject);
     procedure AImportarArchivoComunicacionExecute(Sender: TObject);
     procedure PMPlantillasComunicacionesItemOnClick(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AAdjuntoTransportistaExecute(Sender: TObject);
     procedure AAdjuntoTransportistaRapidoExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure DBCBBloqueoChange(Sender: TObject);
     procedure DBGIsoDblClick(Sender: TObject);
     procedure DBEFCodigooIncotermChange(Sender: TObject);
     procedure DBCHKBajaChange(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure DBEFBancoParaPagosChange(Sender: TObject);
     procedure DBEFTerceroChange(Sender: TObject);
     procedure TSGraficoShow(Sender: TObject);
     procedure DBEFGrupoCuentasChange(Sender: TObject);
     procedure TSComprasShow(Sender: TObject);
     procedure TSComprasHide(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBGComprasDocumentoCellClick(Column: TColumn);
     procedure FiltroComprasChange(Sender: TObject);
     procedure TSComprasDetalleShow(Sender: TObject);
     procedure TSComrasDocumentosShow(Sender: TObject);
     procedure DBGComprasDocumentoDblClick(Sender: TObject);
     procedure DBGComprasDocumentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGComprasDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGComprasDetalleDblClick(Sender: TObject);
     procedure APedidosProveedorTodasExecute(Sender: TObject);
     procedure AAlbaranesProveedorTodasExecute(Sender: TObject);
     procedure AFacturasProveedorTodasExecute(Sender: TObject);
     procedure AAlbaranesProveedorAbiertasExecute(Sender: TObject);
     procedure AAlbaranesProveedorCerradasExecute(Sender: TObject);
     procedure AFacturasProveedorAbiertasExecute(Sender: TObject);
     procedure AFacturasProveedorCerradasExecute(Sender: TObject);
     procedure APedidosProveedorAbiertasExecute(Sender: TObject);
     procedure APedidosProveedorCerradasExecute(Sender: TObject);
     procedure DBEFCuentaIRPFChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure PNLAvisosResize(Sender: TObject);
     procedure DBEFCuentaGastosChange(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSArticulosShow(Sender: TObject);
     procedure DBGProArtBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TSAgrupacionesShow(Sender: TObject);
     procedure SBAContaExtractoDblClick(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure AConfigCircularizacionExecute(Sender: TObject);
     procedure AVisualizarCartaCircularizacionExecute(Sender: TObject);
     procedure AImprimirCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAccesoDirectoExecute(Sender: TObject);
     procedure EFiltroAgrupacionChange(Sender: TObject);
     procedure TSAgrupacionesResize(Sender: TObject);
     procedure DBEFProyectoChange(Sender: TObject);
  private
     { Private declarations }
     Primera: boolean;
     ColActual: TColumn;
     procedure Notas;
     procedure HabilitaEnlaces;
     procedure MuestraGrafico(Tipo: integer);
     procedure LimitaSegunPais;
  public
     { Public declarations }
     Formulario, TipoGrafica: integer;
     DataModule: TDMProveedores;
     SWFil, SWEnlace: integer;
     procedure FiltraProveedores(Filtro: string);
     procedure Tercero_a_Proveedor(Tercero: integer);
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
     procedure HabilitadoMotivoBloqueo;
     procedure RefrescaPestanyaActiva;
  end;

var
  FMProveedores : TFMProveedores;
  Canal : integer;
  ListaCanales : TStringList;

implementation

{$R *.DFM}

uses UFormGest, UDMMain, UEntorno, UUtiles,
  UDMLstProveedor, UFMListConfig, UFMEtiqProv, UFPregEtiCliente, UFPregCPostal,
  UFMain, UFMTerceros, UFMComprasProv, UFPregComprasProveedores,
  UDMLstComprasPro, UFMIncidencias, UFmRecibosPendientes,
  UFGrafico, UFMultiSeleccion, UFPRegAgrupacionProv,
  UFMPedidosAProveedor, UFMAlbaranesAProveedor, UFMFacturasAProveedor,
  UFSendCorreo, UDMListados, UFMAdjunto, UIsoFMInc, Variants, UParam,
  UDMLstCircularizacion, ShellApi, URecibeFicheros, UDMAdjunto, UAccesosDirectos, UDameDato, URellenaLista;

procedure TFMProveedores.FormCreate(Sender: TObject);
var
  DirectorioBaseComunicaciones : string;
  sr : TSearchRec;
  Item : TMenuItem;
  SL : TStringList;
  i : integer;
  Apertura, Cierre : TDateTime;
  TipoDocumento : string;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  ControlEdit := CEMain;
  HabilitarPunto;
  AbreDataVarias(TDMProveedores, DataModule, Self);
  Campo := DataModule.QMProveedoresPROVEEDOR;
  NavMain.DataSource := DataModule.DSProveedores;
  EPMain.DataSource := DataModule.DSProveedores;
  DBGMain.DataSource := DataModule.DSProveedores;
  NavRappel.DataSource := DataModule.DSQMRappel;
  DBGDetalle.DataSource := DataModule.DSQMRappel;
  NavDescuentos.DataSource := DataModule.DSQMDescuentosKri;
  DBGDescuentos.DataSource := DataModule.DSQMDescuentosKri;
  DBECuenta.MaxLength := REntorno.DigitosSub;
  DBEFCuentaDtoPP.MaxLength := REntorno.DigitosSub;
  DBEFCuentaIRPF.MaxLength := REntorno.DigitosSub;
  G2KTableLoc.DataSource := DataModule.DSProveedores;
  SWFil := 0;
  SWEnlace := 0;

  Notas;
  HabilitaEnlaces;

  LBLFecha9000.Visible := DBCBISO9000.Checked;
  DBDTPFecha.Visible := DBCBISO9000.Checked;

  {dki lrk kri}
  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavNotas.VisibleButtons := [nbRefresh];
     NavRappel.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     ACalculoRappelAnual.Visible := False;
  end;

  if (REntorno.Proveedor_aut) then
  begin
     NavMain.InsertaControl := DBEFTipoTercero;
     ColorCampoID(DBEProveedor);
     DBEProveedor.Enabled := False;
     DBEProveedor.ReadOnly := not DBEProveedor.Enabled;
  end
  else
  begin
     NavMain.InsertaControl := DBEProveedor;
     ColorEdicion(DBEProveedor);
     DBEProveedor.Enabled := True;
     DBEProveedor.ReadOnly := not DBEProveedor.Enabled;
  end;

  // ESTADISTICAS
  DBCAnual.Series[0].Title := IntToStr(REntorno.Ejercicio - 4);
  DBCAnual.Series[1].Title := IntToStr(REntorno.Ejercicio - 3);
  DBCAnual.Series[2].Title := IntToStr(REntorno.Ejercicio - 2);
  DBCAnual.Series[3].Title := IntToStr(REntorno.Ejercicio - 1);
  DBCAnual.Series[4].Title := REntorno.EjercicioStr;
  DBCMensual.Series[0].Title := IntToStr(REntorno.Ejercicio - 1);
  DBCMensual.Series[1].Title := REntorno.EjercicioStr;
  DBCPrevision.Series[1].Title := REntorno.EjercicioStr;
  LFActual.Caption := REntorno.EjercicioStr;
  LFComparar.Caption := IntToStr(REntorno.Ejercicio - 1);
  LFPrevision.Caption := _('PREVISIÓN') + ' ' + REntorno.EjercicioStr;
  EEjercicio.Text := REntorno.EjercicioStr;
  EEjercicio2.Text := IntToStr(REntorno.Ejercicio - 1);
  i := RellenaMonedas(CBMonedas.Items);
  CBMonedas.ItemIndex := 0;
  if (i >= 0) then
     CBMonedas.ItemIndex := i;
  EPorcentajeEstimacion.Text := FloatToStr(0);
  TipoGrafica := -1;
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  DBCPrevision.Title.Text.SetText(PChar(string(Format(_('PREVISIÓN MENSUAL %s'), [REntorno.EjercicioStr]))));
  RellenaSeries(CBSerieCompra.Items);
  CBSerieCompra.ItemIndex := 0;
  DameMinMax('EJE', Apertura, Cierre);
  if (DEFechaComprasDesde.Date < EncodeDate(1900, 1, 1)) then
     DEFechaComprasDesde.Date := Apertura;
  if (DEFechaComprasHasta.Date < EncodeDate(1900, 1, 1)) then
     DEFechaComprasHasta.Date := Cierre;

  TSComunicaciones.TabVisible := DMMain.EstadoKri(246) = 1;

  {Relleno las plantillas con los diferentes Opciones}
  {Directorio base}
  DirectorioBaseComunicaciones := REntorno.DirectorioComunicaciones;
  {Quito el ultimo \ }
  DirectorioBaseComunicaciones := ExcludeTrailingPathDelimiter(DirectorioBaseComunicaciones);
  if (not DirectoryExists(DirectorioBaseComunicaciones)) then
     CreateDir(DirectorioBaseComunicaciones); {Creo directorios si no existen}
  {Empresa en 3 digitos}
  DirectorioBaseComunicaciones := DirectorioBaseComunicaciones + '\' + Ajusta(REntorno.EmpresaStr, 'I', 3, '0');
  if (not DirectoryExists(DirectorioBaseComunicaciones)) then
     CreateDir(DirectorioBaseComunicaciones); {Creo directorios si no existen}
  {Tipo - CLI, PRO, etc.}
  DirectorioBaseComunicaciones := DirectorioBaseComunicaciones + '\PRO';
  if (not DirectoryExists(DirectorioBaseComunicaciones)) then
     CreateDir(DirectorioBaseComunicaciones); {Creo directorios si no existen}

  DataModule.PlantillaComunicaciones := '';
  with PMPlantillasComunicaciones do
  begin
     SL := TStringList.Create;
     if FindFirst(DirectorioBaseComunicaciones + '\*.*', SysUtils.faReadOnly + SysUtils.faArchive, sr) = 0 then
     begin
        repeat
           SL.Add(sr.Name);
        until FindNext(sr) <> 0;
        FindClose(sr);
        SL.Sort;

        for i := 0 to SL.Count - 1 do
        begin
           Item := TMenuItem.Create(nil);
           Item.AutoHotkeys := maManual;
           Item.Caption := SL[i];
           Item.OnClick := PMPlantillasComunicacionesItemOnClick;
           Items.Add(Item);
        end;
     end;
     SL.Free;
  end;

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

  {Latino}
  if (DMMain.EstadoKri(410) <> 1) then
  begin
     LTipoNCF.Visible := False;
     DBLCBTipoNCF.Visible := False;
  end;

  if (LeeParametro('MODSINC003') = 'S') then
  begin
     LProveedorPrestashop.Visible := False;
     DBEProveedorPrestashop.Visible := False;
     LUltSincronizacion.Visible := False;
     DEUltSincronizacion.Visible := False;
  end;

  TipoDocumento := LeeParametro('PROCOMT001');
  CBTipoDocumento.ItemIndex := 0;
  while ((CBTipoDocumento.ItemIndex < CBTipoDocumento.Items.Count - 1) and (CBTipoDocumento.Text <> TipoDocumento)) do
     CBTipoDocumento.ItemIndex := CBTipoDocumento.ItemIndex + 1;

  if (CBTipoDocumento.Text <> TipoDocumento) then
     CBTipoDocumento.ItemIndex := 0;

  PNLAvisosResize(Sender);

  DBCHKBajaChange(Sender);
end;

procedure TFMProveedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DataModule);
  DeshabilitarPunto;
end;

procedure TFMProveedores.DBECuentaExit(Sender: TObject);
var
  cuenta_aux : string;
begin
  cuenta_aux := DBECuenta.Text;
  if (cuenta_aux <> '') and
     (Length(cuenta_aux) <= REntorno.DigitosSub - 3) and
     (Copy(cuenta_aux, 0, 3) <> '400') then
     DBECuenta.Text := ExpandirCadena('400.' + cuenta_aux, REntorno.DigitosSub);
end;

procedure TFMProveedores.TbuttCompClick(Sender: TObject);
begin
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMProveedores.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMProveedores.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  inherited;
  Resultado := DataModule.BusquedaCompleja;
  if (Resultado in [mrOk, mrAll]) then
  begin
     SWFil := 1;
     SWEnlace := 0;
  end;
  Continua := False;
  Notas;
end;

procedure TFMProveedores.MuestraFiltrado(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DataModule.QMproveedores.SelectSQL);
  AbreData(TDMlstProveedor, DMlstProveedor);
  TempSql.AddStrings(DMLstProveedor.QMProveedor.SelectSQL);
  DMlstProveedor.QMProveedor.Close;
  DMLstProveedor.QMProveedor.SelectSQL.Assign(SqlFiltro);
  DMLstProveedor.MostrarFiltrado(tipo);
  DMlstProveedor.QMProveedor.Close;
  DMLstProveedor.QMProveedor.SelectSQL.Assign(TempSQL);
  CierraData(DMlstProveedor);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMProveedores.MuestraFiltradoFiscal(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DataModule.QMproveedores.SelectSQL);
  AbreData(TDMlstProveedor, DMlstProveedor);
  TempSql.AddStrings(DMLstProveedor.QMProveedor.SelectSQL);
  DMlstProveedor.QMProveedor.Close;
  DMLstProveedor.QMProveedor.SelectSQL.Assign(SqlFiltro);
  DMLstProveedor.MostrarFiltradoFiscal(tipo);
  DMlstProveedor.QMProveedor.Close;
  DMLstProveedor.QMProveedor.SelectSQL.Assign(TempSQL);
  CierraData(DMlstProveedor);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMProveedores.RelojNotasTimer(Sender: TObject);
begin
  inherited;
  if LBNotas.Visible = True then
     LBNotas.Visible := False
  else
     LBNotas.Visible := True;
end;

procedure TFMProveedores.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  i : integer;
  esta : boolean;
begin
  inherited;

  Notas;

  ERappelAnual.Text := '';

  LBLFecha9000.Visible := DBCBISO9000.Checked;
  DBDTPFecha.Visible := DBCBISO9000.Checked;

  if FMain.sourcecall = True then
  begin
     FMain.sourcecall := False;
     Close;
  end
  else
  if FMain.autproveedor then
  begin
     esta := False;
     with Application do
        for i := 0 to (ComponentCount - 1) do
           if (('T' + Components[i].Name) = TFMTerceros.ClassName) then
              esta := True;

     if esta then
        FMTerceros.CierraProveedor
     else
     begin
        FMain.autproveedor := False;
        Close;
     end;
  end;
end;

procedure TFMProveedores.TButtRappelClick(Sender: TObject);
begin
end;

{ Filtra por Proveedores }
procedure TFMProveedores.FiltraProveedores(Filtro: string);
var
  Parametro : TParametroFiltrado;
begin
  PCMain.ActivePage := TSFicha;

  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     Parametro.SQLBase.Text := DataModule.SQLBase.Text;
     Parametro.Tabla := DataModule.QMProveedores;
     DMMain.FiltraSQL(Parametro);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;

  if (Filtro <> '') then
  begin
     SWEnlace := 1;
     SWFil := 0;
  end;

  Notas;
end;

procedure TFMProveedores.NAVRappelClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
     DBGDetalle.Columns[0].ReadOnly := False;
     DBGDetalle.Columns[0].Font.Color := clWindowText;
     DBGDetalle.Columns[0].Color := clWindow;
  end
  else
  begin
     DBGDetalle.Columns[0].ReadOnly := True;
     DBGDetalle.Columns[0].Color := clInfoBk;
     DBGDetalle.Columns[0].Font.Color := clGrayText;
  end;
end;

procedure TFMProveedores.NAVRappelClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  {if Button=nbPost then
  begin
      DBGDetalle.Columns[0].ReadOnly   := true;
      DBGDetalle.Columns[0].Color      := clInfoBk;
      DBGDetalle.Columns[0].Font.color := clGrayText;
  end;}
end;

procedure TFMProveedores.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMProveedores.TSRappelShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CERappel;
end;

procedure TFMProveedores.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMProveedores.NavNotasClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  Notas;
end;

procedure TFMProveedores.FormActivate(Sender: TObject);
begin
  inherited;
  if not Primera then
     if not REntorno.DatosAbiertos then
        if (DataModule.BusquedaCompleja in [mrOk, mrAll]) then
           SWFil := 1;
  Primera := True;
  if FMain.EnlaceCrea then
     Tercero_a_Proveedor(DMMain.MinTercero);

  // Deshabilito para que funcione el doble click sobre estos campos para asignar agrupacion
  DBEAgDentro.Enabled := False;
  DBEAgTitDentro.Enabled := False;
  DBEAgCodDisp.Enabled := False;
  DBEAgTitDisp.Enabled := False;
end;

procedure TFMProveedores.Tercero_a_Proveedor(Tercero: integer);
begin
  DataModule.CambiarTercero(Tercero);

  if (REntorno.Cliente_aut) then
     DBEFTipoTercero.SetFocus
  else
     DBEProveedor.SetFocus;
end;

procedure TFMProveedores.DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBECuenta);
end;

procedure TFMProveedores.HabilitarPunto;
begin
  FMain.AddComponentePunto(DBECuenta);
  FMain.AddComponentePunto(DBEFCuentaDtoPP);
  FMain.AddComponentePunto(DBEFCuentaIRPF);
end;

procedure TFMProveedores.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(DBEFCuentaIRPF);
  FMain.DelComponentePunto(DBEFCuentaDtoPP);
  FMain.DelComponentePunto(DBECuenta);
end;

procedure TFMProveedores.ANewTerceroExecute(Sender: TObject);
var
  // aSourceCallTer : boolean;
  aEnlaceModal : boolean;
  aEnlaceInstancias : boolean;
  aEnlaceCrea : boolean;
begin
  if EstructuraCreada then
  begin
     // aSourceCallTer := FMain.SourceCallTer;
     aEnlaceModal := FMain.EnlaceModal;
     aEnlaceInstancias := FMain.EnlaceInstancias;
     aEnlaceCrea := FMain.EnlaceCrea;

     FMain.SourceCallTer := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.ATerceros);

     if FMain.EnlaceDatos <> Null then
        DBEFTercero.SetBufferText(FMain.EnlaceDatos);

     DBEFFormaPago.SetFocus;

     FMain.EnlaceModal := aEnlaceModal;
     FMain.EnlaceInstancias := aEnlaceInstancias;
     FMain.EnlaceCrea := aEnlaceCrea;
  end;
end;

procedure TFMProveedores.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if (DBEFTercero.Text <> '') then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBEFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DataModule.QMProveedoresTERCERO.AsInteger));
end;

procedure TFMProveedores.SBATerceroDblClick(Sender: TObject);
begin
  AATercero.Execute;
end;

procedure TFMProveedores.HabilitaEnlaces;
begin
  if (FMain.ATerceros.Enabled = False) then
  begin
     DBEFTercero.Accion := nil;
     SBATercero.Width := 0;
     MIVerDatosTercero.Visible := False;
     MISepEnlaces.Visible := False;
     ETituloTercero.Color := clInfoBk;
     TbuttComp.Visible := False;
     TSepTerc.Visible := False;
  end
  else
  begin
     SolapaControles(SBATercero, ETituloTercero);
     ETituloTercero.Color := REntorno.ColorEnlaceActivo;
     TbuttComp.Visible := True;
     TSepTerc.Visible := True;
  end;

  if (FMain.AContaExtracto.Enabled = False) then
  begin
     DBECuenta.Color := clInfoBk;
  end
  else
  begin
     SolapaControles(SBAContaExtracto, DBECuenta);
     DBECuenta.Color := REntorno.ColorEnlaceActivo;
  end;

  SolapaControles(SBVerPedPend, LFDEPedPendLIQUIDO);
  LFDEPedPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerAlbPend, LFDEAlbPendLIQUIDO);
  LFDEAlbPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerFacPend, LFDEFactPendLIQUIDO);
  LFDEFactPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerFacPag, LFDFactCobrLIQUIDO);
  LFDFactCobrLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerImpagados, LFDERecImpagadosIMPORTE);
  LFDERecImpagadosIMPORTE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerRecPendPag, LFDERecNoCobradosIMPORTE);
  LFDERecNoCobradosIMPORTE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerRecPendRec, LFDERecPendIMPORTE);
  LFDERecPendIMPORTE.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMProveedores.ETituloTerceroEnter(Sender: TObject);
begin
  if DBEFTercero.Enabled then
     DBEFTercero.SetFocus
  else
     DBEFFormaPago.SetFocus;
end;

procedure TFMProveedores.DBCBISO9000Click(Sender: TObject);
begin
  if DBCBISO9000.Checked then
  begin
     LBLFecha9000.Visible := True;
     DBDTPFecha.Visible := True;
  end
  else
  begin
     LBLFecha9000.Visible := False;
     DBDTPFecha.Visible := False;
  end;
end;

procedure TFMProveedores.DBCGPerteneceDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then
     DataModule.AgrupacionVacia;
end;

procedure TFMProveedores.DBCGDisponiblesDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then
     DataModule.AgrupacionRellena;
end;

procedure TFMProveedores.AEtiquetasProveedorExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMEtiqProv, FMEtiqProv, Sender);
end;

procedure TFMProveedores.AVisualizarListadoProveedoresExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMProveedores.AImprimirListadoProveedoresExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMProveedores.AVisualizarDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(0);
end;

procedure TFMProveedores.AImprimirDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(1);
end;

procedure TFMProveedores.AVisualizarListDirExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(2);   // Visualizar Listado de Dir. de Prov.
end;

procedure TFMProveedores.AImprimirListDirExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(3);   // Imprimir Listado de Dir. de Prov.
end;

procedure TFMProveedores.AListadoDirporCPostalExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFPregCPostal.Create(Self).Muestra('PROV');
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AEtiquetasExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFPregEtiCliente.Create(Self).Muestra(DataModule.Tercero, 'PROV');
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AConfProveedoresExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFMListConfig.Create(Self).Muestra(9, formato, cabecera, copias, pijama, '',
     DMLstProveedor.frProveedor);
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AConfListadosDatosFiscalesProveedoresExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFMListConfig.Create(Self).Muestra(10, formato, cabecera, copias,
     pijama, '', DMLstProveedor.frProveedor);
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AConfListadosDirExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFMListConfig.Create(Self).Muestra(62, formato, cabecera, copias,
     pijama, '', DMLstProveedor.frProveedor);
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AConfListadoDirCPostalExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFMListConfig.Create(Self).Muestra(82, formato, cabecera, copias,
     pijama, '', DMLstProveedor.frProveedor);
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AConfEtiquetasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProveedor, DMLstProveedor);
  TFMListConfig.Create(Self).Muestra(61, formato, cabecera, copias,
     pijama, '', DMLstProveedor.frProveedor);
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.AComprasArticulosProvExecute(Sender: TObject);
begin
  inherited;
  FMComprasProv := TFMComprasProv.Create(Self);
  FMComprasProv.MuestraProveedor(DataModule.QMProveedoresPROVEEDOR.AsInteger, 2);
  FMComprasProv.Free;
end;

procedure TFMProveedores.ACalculoRappelAnualExecute(Sender: TObject);
var
  Rappel : double;
begin
  inherited;
  DataModule.DameRappel(Rappel);
  ERappelAnual.Text := FormatFloat(MascaraN, Rappel);
end;

procedure TFMProveedores.AComprasDetalladasExecute(Sender: TObject);
begin
  inherited;
  TFPregComprasProveedores.Create(Self).Muestra(DBEProveedor.Text);
end;

procedure TFMProveedores.AConfComprasDetalladasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstComprasPro, DMLstComprasPro);
  TFMListConfig.Create(Self).Muestra(158, formato, cabecera, copias,
     pijama, '', DMLstComprasPro.frHYComprasProveedores);
  CierraData(DMLstComprasPro);
end;

procedure TFMProveedores.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMProveedores.ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = VK_RETURN then
     ExpandirCadenaCta(Sender);
end;

procedure TFMProveedores.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMProveedores.AIncidenciasExecute(Sender: TObject);
begin
  with DataModule do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMProveedoresPROVEEDOR.AsInteger,
        QMProveedoresTERCERO.AsInteger, 1, 0, 1);
  end;
end;

procedure TFMProveedores.DBGIncidenciasDblClick(Sender: TObject);
begin
  with DataModule do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMProveedoresPROVEEDOR.AsInteger,
        QMProveedoresTERCERO.AsInteger, 1, xIncidenciasINCIDENCIA.AsInteger, 1);
  end;
end;

procedure TFMProveedores.DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DataModule.HayDetalle(1) then
  begin
     if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
        CeldaEnlace(DBGIncidencias, Rect);
  end;
end;

procedure TFMProveedores.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DataModule.QuitaFiltros;
  G2KTableLoc.Click;

  RefrescaPestanyaActiva;
end;

procedure TFMProveedores.EFProveedorChange(Sender: TObject);
begin
  inherited;

  DataModule.FiltraProveedor(StrToIntDef(EFProveedor.Text, 0));
  RefrescaPestanyaActiva;
end;

procedure TFMProveedores.DBEFPortesChange(Sender: TObject);
begin
  inherited;
  if ((Assigned(DBEFPortes.Field)) and (DBEFPortes.Text <> '')) then
  begin
     if (StrToInt(DBEFPortes.Text) <= 2) then
     begin
        if Assigned(DBEPorPortes.Field) then
           DBEPorPortes.Field.Value := 0;
        DBEPorPortes.Color := clInfoBk;
        DBEPorPortes.Enabled := False;
        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;

        if Assigned(DBEIPortes.Field) then
           DBEIPortes.Field.Value := 0;
        DBEIPortes.Color := clInfoBk;
        DBEIPortes.Enabled := False;
        DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
     end
     else
     if (StrToInt(DBEFPortes.Text) = 3) then
     begin
        DBEPorPortes.Color := clWindow;
        DBEPorPortes.Enabled := True;
        DBEIPortes.Color := clInfoBk;
        DBEIPortes.Enabled := False;
        DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
        if Assigned(NavMain.DataSource) then
           if (not (NavMain.DataSource.State in [dsBrowse])) then
           begin
              if Assigned(DBEIPortes.Field) then
                 DBEIPortes.Field.Value := 0;
              if Assigned(DBEPorPortes.Field) then
                 DBEPorPortes.Field.Value := 0;
           end;
     end
     else
     if (StrToInt(DBEFPortes.Text) = 4) then
     begin
        DBEPorPortes.Color := clInfoBk;
        DBEPorPortes.Enabled := False;
        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
        DBEIPortes.Color := clWindow;
        DBEIPortes.Enabled := True;
        DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
        if Assigned(NavMain.DataSource) then
           if (not (NavMain.DataSource.State in [dsBrowse])) then
           begin
              if Assigned(DBEIPortes.Field) then
                 DBEIPortes.Field.Value := 0;
              if Assigned(DBEPorPortes.Field) then
                 DBEPorPortes.Field.Value := 0;
           end;
     end;
  end;
end;

procedure TFMProveedores.ACalculaEstadisticasExecute(Sender: TObject);
begin
  inherited;
  DBCAnual.Series[0].Title := IntToStr(StrToInt(EEjercicio2.Text) - 3);
  DBCAnual.Series[1].Title := IntToStr(StrToInt(EEjercicio2.Text) - 2);
  DBCAnual.Series[2].Title := IntToStr(StrToInt(EEjercicio2.Text) - 1);
  DBCAnual.Series[3].Title := EEjercicio2.Text;
  DBCAnual.Series[4].Title := EEjercicio.Text;
  DBCMensual.Series[0].Title := EEjercicio2.Text;
  DBCMensual.Series[1].Title := EEjercicio.Text;
  DBCPrevision.Series[1].Title := EEjercicio.Text;
  LFActual.Caption := EEjercicio.Text;
  LFComparar.Caption := EEjercicio2.Text;
  LFPrevision.Caption := _('PREVISIÓN') + ' ' + EEjercicio.Text;

  Datamodule.CargaEstadisticas(StrToInt(EEjercicio.Text),
     StrToInt(EEjercicio2.Text), Copy(CBMonedas.Text, 1, Pos(' ', CBMonedas.Text) - 1), StrToFloat(EPorcentajeEstimacion.Text), CBTipoDoc.Text);
end;

procedure TFMProveedores.APedPendDetExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'Empresa=' + IntToStr(REntorno.Empresa) +
     ' AND Canal=' + IntToStr(REntorno.Canal) +
     ' AND Proveedor=' + IntToStr(DataModule.DameProveedor) +
     ' AND Estado=0 OR Estado=3 AND tipo=''PEP''';
  FMain.EjecutaAccion(FMain.APedidosPendientesProv, Filtro);
end;

procedure TFMProveedores.AAlbaranesDetExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'Empresa=' + IntToStr(REntorno.Empresa) +
     ' AND Canal=' + IntToStr(REntorno.Canal) +
     ' AND Proveedor=' + IntToStr(DataModule.DameProveedor) +
     ' AND Estado=0 OR Estado=3 AND tipo=''ALB''';
  FMain.EjecutaAccion(FMain.AAlbaranesPendientesProv, Filtro);
end;

procedure TFMProveedores.AFactPendDetExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'Empresa=' + IntToStr(REntorno.Empresa) +
     ' AND Canal=' + IntToStr(REntorno.Canal) +
     ' AND Proveedor=' + IntToStr(DataModule.DameProveedor) +
     ' AND tipo=''FAP'' and estado=0';
  FMain.EjecutaAccion(FMain.AFiltroFacturasProv, Filtro);
end;

procedure TFMProveedores.AFactCobDetExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'Empresa=' + IntToStr(REntorno.Empresa) +
     ' AND Canal=' + IntToStr(REntorno.Canal) +
     ' AND Proveedor=' + IntToStr(DataModule.DameProveedor) +
     ' AND tipo=''FAP'' and estado=5';
  FMain.EjecutaAccion(FMain.AFiltroFacturasProv, Filtro);
end;

procedure TFMProveedores.ARecibosImpagadosExecute(Sender: TObject);
begin
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.EFCliDesde.Text := datamodule.QMProveedoresCUENTA.AsString;
  FMain.EjecutaAccion(FMRecibosPendientes.AMostrarImpagados, );
end;

procedure TFMProveedores.ARecibosPenRecExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.FiltraClientes(REntorno.Empresa, REntorno.Canal,
     3, DataModule.DameCuenta);
end;

procedure TFMProveedores.TSEstadisticasShow(Sender: TObject);
begin
  inherited;
  LFPCEstadisticas.ActivePage := TSDocumentos;

  DataModule.MuestraDocumentos;

  //Moneda

  LFEEstadoRecPend.Text := REntorno.MonedaEmpresa;
  LFEEstadoRecNoCob.Text := REntorno.MonedaEmpresa;
  LFEEstadoRecImp.Text := REntorno.MonedaEmpresa;
  LFEAnticipo.Text := REntorno.MonedaEmpresa;
  LFEPPRecibir.Text := REntorno.MonedaEmpresa;
  LFEPPCobrar.Text := REntorno.MonedaEmpresa;

  LFEPedPend.Text := REntorno.MonedaEmpresa;
  LFEAlbPend.Text := REntorno.MonedaEmpresa;
  LFEFactPend.Text := REntorno.MonedaEmpresa;
  LFEFactCobr.Text := REntorno.MonedaEmpresa;
end;

procedure TFMProveedores.TSEstadisticasHide(Sender: TObject);
begin
  inherited;
  DataModule.CierraDocumentos;
  Datamodule.CierraEstadisticas;
end;

procedure TFMProveedores.MuestraGrafico(Tipo: integer);
begin
  TipoGrafica := Tipo;
  FGrafico := TFGrafico.Create(Self);

  FGrafico.Left := Self.Left;
  FGrafico.Top := Self.Top;

  FGrafico.Formulario := 3;
  FGrafico.Tipo := tipo;
  FGrafico.Tercero := StrToInt(DBEProveedorEstadisitcas.Text);
  FGrafico.Ejercicio := StrToInt(EEjercicio.Text);
  FGrafico.Ejercicio2 := StrToInt(EEjercicio2.Text);
  FGrafico.Porcent := StrToFloat(EPorcentajeEstimacion.Text);
  FGrafico.moneda := Copy(CBMonedas.Text, 1, Pos(' ', CBMonedas.Text) - 1);

  FGrafico.ShowModal;
  FGrafico.Free;
end;

procedure TFMProveedores.DBCAnualDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(0);
end;

procedure TFMProveedores.DBCMensualDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(1);
end;

procedure TFMProveedores.DBCPrevisionDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(2);
end;

procedure TFMProveedores.ARecibosPenPagExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.FiltraClientes(REntorno.Empresa, REntorno.Canal,
     2, DataModule.DameCuenta);
end;

procedure TFMProveedores.BBMultiSelectClick(Sender: TObject);
begin
  inherited;
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFMProveedores.AProveedoresPorAgrupacionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMlstProveedor, DMlstProveedor);
  TFPRegAgrupacionProv.Create(Self);
  CierraData(DMLstProveedor);
end;

procedure TFMProveedores.APedidosProveedorKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.APedidosProv.Execute;
  FMPedidosAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AAlbaranesProveedorKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AAlbaranesProv.Execute;
  FMAlbaranesAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AFacturasProveedorKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AFacturasProv.Execute;
  FMFacturasAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.DBEFTransportistaKriChange(Sender: TObject);
begin
  inherited;
  ETransportistaKri.Text := DameTituloAcreedor(DataModule.QMProveedoresTRANSPORTISTA.AsInteger);
end;

procedure TFMProveedores.DBEFTransportistaRapidoKriChange(Sender: TObject);
begin
  inherited;
  ETransportistaRapidoKri.Text := DameTituloAcreedor(DataModule.QMProveedoresTRANSPORTISTA_RAPIDO.AsInteger);
end;

procedure TFMProveedores.TSComunicacionesShow(Sender: TObject);
begin
  inherited;
  DataModule.xComunicaciones.Open;
end;

procedure TFMProveedores.TSComunicacionesHide(Sender: TObject);
begin
  inherited;
  DataModule.xComunicaciones.Close;
end;

procedure TFMProveedores.EFComunicacionesBusquedaBusqueda(Sender: TObject);
begin
  inherited;
  EFComunicacionesBusqueda.CondicionBusqueda := 'TIPO=''PRO'' AND COD_CLI_PRO=' + DataModule.QMProveedoresPROVEEDOR.AsString;
end;

procedure TFMProveedores.EFComunicacionesBusquedaChange(Sender: TObject);
begin
  inherited;
  Refrescar(DataModule.xComunicaciones, 'ID', StrToIntDef(EFComunicacionesBusqueda.Text, 0));
end;

procedure TFMProveedores.DBGComunicacionesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMProveedores.DBGComunicacionesDblClick(Sender: TObject);
begin
  inherited;
  with DataModule.xComunicaciones do
  begin
     if ((RecordCount > 0) and (State = dsBrowse)) then
     begin
        Edit;
        DataModule.xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
        Post;
        if (UpperCase(ColActual.FieldName) = 'ARCHIVO') then
           AbreWord(DMMain.DameDirectorioCodCliPro('PRO', DataModule.xComunicacionesCOD_CLI_PRO.AsInteger) + DataModule.xComunicacionesARCHIVO.AsString);
     end;
  end;
end;

procedure TFMProveedores.DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (DataModule.xComunicaciones.RecordCount > 0) then
     if (UpperCase(Column.FieldName) = 'ARCHIVO') then
        CeldaEnlace(DBGComunicaciones, Rect);
end;

procedure TFMProveedores.NavComunicacionesChangeState(Sender: TObject);
begin
  inherited;
  with DBGComunicaciones do
  begin
     ColumnaInicial := 0;
     while ((ColumnaInicial <= Columns.Count - 1) and (Columns[ColumnaInicial].FieldName = 'DESCRIPCION')) do
        ColumnaInicial := ColumnaInicial + 1;
  end;
end;

procedure TFMProveedores.AEnviarComunicacionXMailExecute(Sender: TObject);
var
  Subject : string;
  DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  inherited;
  DMListadosCargado := False;
  FSendCorreo := TFSendCorreo.Create(Self);
  try

     FSendCorreo.Titulo(_('Enviando la carta por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando carta ...'));

     try
        begin
           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;

           Subject := DataModule.xComunicacionesDESCRIPCION.AsString;

           CuerpoMail := TStringList.Create;
           CuerpoMail.Add(_('Este correo ha sido enviado desde :'));
           CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
           CuerpoMail.Add('');
           CuerpoMail.Add(_('y contiene el fichero adjunto') + ' ' + UpperCase(DataModule.xComunicacionesARCHIVO.AsString));
           CuerpoMail.Add('------------------------------------------------------------');
           CuerpoMail.Add('This is an automatic message send from :');
           CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
           CuerpoMail.Add('');
           CuerpoMail.Add('We attached the file ' + UpperCase(DataModule.xComunicacionesARCHIVO.AsString));

           FSendCorreo.Texto(_('Enviando Mensaje  ...'));

           DMListados.SendMailTerceroPDF(DataModule.QMProveedoresTERCERO.AsInteger, CuerpoMail,
              DMMain.DameDirectorioCodCliPro('PRO', DataModule.xComunicacionesCOD_CLI_PRO.AsInteger) + DataModule.xComunicacionesARCHIVO.AsString, DataModule.xComunicacionesARCHIVO.AsString, Subject, 'PRO', DataModule.xComunicacionesCOD_CLI_PRO.AsInteger);

           CuerpoMail.Free;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

           // Liberamos objetos creados
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

procedure TFMProveedores.AImportarArchivoComunicacionExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'PDF,DOC,XLS,ODT,ODS,TXT', '', 'FMProveedores') then
  begin
     if CopyFileTo(Archivo, DMMain.DameDirectorioCodCliPro('PRO', DataModule.QMProveedoresPROVEEDOR.AsInteger) + ExtractFileName(Archivo)) then
     begin
        with DataModule.xComunicaciones do
        begin
           if (State = dsBrowse) then
           begin
              Insert;
              DataModule.xComunicacionesARCHIVO.AsString := ExtractFileName(Archivo);
              DBGComunicaciones.SetFocus;
              //Post;
           end;
        end;
     end;
  end;
end;

procedure TFMProveedores.PMPlantillasComunicacionesItemOnClick(Sender: TObject);
begin
  DataModule.PlantillaComunicaciones := TMenuItem(Sender).Caption;
  with DataModule.xComunicaciones do
  begin
     if (State = dsBrowse) then
     begin
        Insert;
        DBGComunicaciones.SetFocus;
     end;
  end;
end;

procedure TFMProveedores.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', DameIDProveedor(DataModule.QMProveedoresPROVEEDOR.AsInteger));
end;

procedure TFMProveedores.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DataModule.QMProveedoresTERCERO.AsInteger);
end;

procedure TFMProveedores.AAdjuntoTransportistaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DataModule.QMProveedoresTRANSPORTISTA.AsInteger));
end;

procedure TFMProveedores.AAdjuntoTransportistaRapidoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DataModule.QMProveedoresTRANSPORTISTA_RAPIDO.AsInteger));
end;

procedure TFMProveedores.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
end;

procedure TFMProveedores.HabilitadoMotivoBloqueo;
begin
  if DataModule.QMProveedoresBLOQUEO.AsInteger = 0 then
  begin
     DBEMotivoBloqueo.Enabled := False;
     DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;
     DBEMotivoBloqueo.Color := clInfoBk;
  end
  else
  begin
     DBEMotivoBloqueo.Enabled := True;
     DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;
     DBEMotivoBloqueo.Color := clWindow;
  end;
end;

procedure TFMProveedores.DBCBBloqueoChange(Sender: TObject);
begin
  inherited;
  if DBCBBloqueo.Value = '0' then
  begin
     DBEMotivoBloqueo.Enabled := False;
     DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;
     DBEMotivoBloqueo.Color := clInfoBk;
  end
  else
  begin
     DBEMotivoBloqueo.Enabled := True;
     DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;
     DBEMotivoBloqueo.Color := clWindow;
  end;
end;

procedure TFMProveedores.DBGIsoDblClick(Sender: TObject);
begin
  inherited;
  with DataModule do
  begin
     if HayDetalle(2) then
     begin
        AbreForm(TIsoFMINC, IsoFMINC);
        IsoFMINC.Filtrar('clipro=' + IntToStr(QMProveedoresPROVEEDOR.AsInteger));
     end;
  end;
end;

procedure TFMProveedores.DBEFCodigooIncotermChange(Sender: TObject);
begin
  inherited;
  ECodigoIncoterm.Text := DameTituloCodigoIncoterm(DataModule.QMProveedoresCODIGO_INCOTERM.AsString);
end;

procedure TFMProveedores.DBCHKBajaChange(Sender: TObject);
begin
  inherited;
  DBDTPFechaBaja.Visible := DBCHKBaja.Checked;
  DBEMotivoBaja.Visible := DBCHKBaja.Checked;
  LMotivoBaja.Visible := DBCHKBaja.Checked;
end;

procedure TFMProveedores.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del proveedor %d - %s'), [DataModule.QMProveedoresPROVEEDOR.AsInteger, DataModule.QMProveedoresTITULO.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMNotas.Lines);
     s.Add('----------------------------------------------------------------------');
     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMProveedores.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  ETituloIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMProveedores.DBEFBancoParaPagosChange(Sender: TObject);
var
  Banco : integer;
begin
  inherited;
  Banco := StrToIntDef(DBEFBancoParaPagos.Text, 0);
  if (Banco <> 0) then
     ETituloBancoParaPagos.Text := DameTituloBanco(Banco)
  else
     ETituloBancoParaPagos.Text := _('Segun forma de pago');
end;

procedure TFMProveedores.DBEFTerceroChange(Sender: TObject);
begin
  inherited;
  if (DataModule.QMProveedores.State in [dsInsert, dsEdit]) then
     ETituloTercero.Text := DameTituloTercero(StrToIntDef(DBEFTercero.Text, 0))
  else
     ETituloTercero.Text := DataModule.QMProveedoresNOMBRE_R_SOCIAL.AsString;

  ETituloTerceroNotas.Text := ETituloTercero.Text;
  ETituloTerceroAgrupaciones.Text := ETituloTercero.Text;
  ETituloTerceroDescuentos.Text := ETituloTercero.Text;
  ETituloTerceroEstadisticas.Text := ETituloTercero.Text;
  ETituloTerceroComunicaciones.Text := ETituloTercero.Text;
  ETituloTerceroIncidencias.Text := ETituloTercero.Text;
  ETituloTerceroAvisos.Text := ETituloTercero.Text;
  ETituloTerceroArticulos.Text := ETituloTercero.Text;
end;

procedure TFMProveedores.TSGraficoShow(Sender: TObject);
begin
  inherited;
  if (CBTipoDoc.Text = '') then
     CBTipoDoc.ItemIndex := 0;
end;

procedure TFMProveedores.DBEFGrupoCuentasChange(Sender: TObject);
begin
  inherited;
  ETitGrupoCuentas.Text := DameTituloGrupoCuentas(StrToIntDef(DBEFGrupoCuentas.Text, 0));
end;

procedure TFMProveedores.TSComprasShow(Sender: TObject);
begin
  inherited;
  DBGComprasDocumento.DataSource := DataModule.DSxCompras;
  DBGComprasDetalle.DataSource := DataModule.DSxComprasDetalle;
  NavCompras.DataSource := DataModule.DSxCompras;
end;

procedure TFMProveedores.TSComprasHide(Sender: TObject);
begin
  inherited;
  DataModule.xCompras.Close;
  DataModule.xComprasDetalle.Close;
end;

procedure TFMProveedores.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSCompras) then
     FiltroComprasChange(Sender);
end;

procedure TFMProveedores.DBGComprasDocumentoCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMProveedores.FiltroComprasChange(Sender: TObject);
var
  TipoDocumento, Serie : string;
begin
  inherited;
  if (PCMain.ActivePage = TSCompras) then
  begin
     CBPedidosPendientes.Visible := (CBTipoDocumento.Text = 'PEP');

     if (CBSerieCompra.Text = _('Todas las Series')) then
        Serie := ' '
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSerieCompra.Items[CBSerieCompra.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;

     TipoDocumento := CBTipoDocumento.Text;
     if (CBTipoDocumento.ItemIndex <= 0) then
        TipoDocumento := 'ALL';
     DataModule.FiltraCompras(TipoDocumento, Serie, DEFechaComprasDesde.Date, DEFechaComprasHasta.Date, EFArticuloCompras.Text, Trim(EDescripcion.Text), CBPedidosPendientes.Checked);
  end;
end;

procedure TFMProveedores.TSComprasDetalleShow(Sender: TObject);
begin
  inherited;
  NavCompras.DataSource := DataModule.DSxCompras;
end;

procedure TFMProveedores.TSComrasDocumentosShow(Sender: TObject);
begin
  inherited;
  NavCompras.DataSource := DataModule.DSxComprasDetalle;
end;

procedure TFMProveedores.DBGComprasDocumentoDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
  begin
     if (DataModule.xComprasCANAL.AsInteger = REntorno.Canal) then
        FMain.TraspasoDeDocumentosEntrada(DataModule.xComprasID_E.AsInteger)
     else
        ShowMessage(_('El documento se encuentra en otro canal'));
  end;
end;

procedure TFMProveedores.DBGComprasDocumentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMProveedores.DBGComprasDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMProveedores.DBGComprasDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
  begin
     if (DataModule.xComprasDetalleCANAL.AsInteger = REntorno.Canal) then
        FMain.TraspasoDeDocumentosEntrada(DataModule.xComprasDetalleID_E.AsInteger)
     else
        ShowMessage(_('El documento se encuentra en otro canal'));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DataModule.xComprasDetalleARTICULO.AsString + '''');
end;

procedure TFMProveedores.APedidosProveedorTodasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.APedidosProv.Execute;
  FMPedidosAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AAlbaranesProveedorTodasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AAlbaranesProv.Execute;
  FMAlbaranesAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AFacturasProveedorTodasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AFacturasProv.Execute;
  FMFacturasAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AAlbaranesProveedorAbiertasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AAlbaranesProv.Execute;
  FMAlbaranesAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AAlbaranesProveedorCerradasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AAlbaranesProv.Execute;
  FMAlbaranesAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AFacturasProveedorAbiertasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AFacturasProv.Execute;
  FMFacturasAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.AFacturasProveedorCerradasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.AFacturasProv.Execute;
  FMFacturasAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.APedidosProveedorAbiertasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.APedidosProv.Execute;
  FMPedidosAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.APedidosProveedorCerradasExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.APedidosProv.Execute;
  FMPedidosAProveedor.FiltraProveedorKri(REntorno.Ejercicio, Serie, DataModule.QMProveedoresPROVEEDOR.AsInteger, TAction(Sender).Tag);
end;

procedure TFMProveedores.DBEFCuentaIRPFChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFCuentaIRPF.Text) = '') then
     ETituloCuentaIRPF.Text := _('Segun configuracion')
  else
     ETituloCuentaIRPF.Text := DameTituloCuenta(DBEFCuentaIRPF.Text);
end;

procedure TFMProveedores.FormResize(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMProveedores.PNLAvisosResize(Sender: TObject);
var
  Altura : integer;
begin
  inherited;
  Altura := PNLAvisos.Height div 5;

  DBCBAvisoActivoOFP.Top := (Altura * 0) + 5;
  DBCBAvisoActivoOCP.Top := (Altura * 1) + 5;
  DBCBAvisoActivoPEP.Top := (Altura * 2) + 5;
  DBCBAvisoActivoALP.Top := (Altura * 3) + 5;
  DBCBAvisoActivoFAP.Top := (Altura * 4) + 5;

  DBMAvisoOFP.Top := DBCBAvisoActivoOFP.Top + DBCBAvisoActivoOFP.Height;
  DBMAvisoOCP.Top := DBCBAvisoActivoOCP.Top + DBCBAvisoActivoOCP.Height;
  DBMAvisoPEP.Top := DBCBAvisoActivoPEP.Top + DBCBAvisoActivoPEP.Height;
  DBMAvisoALP.Top := DBCBAvisoActivoALP.Top + DBCBAvisoActivoALP.Height;
  DBMAvisoFAP.Top := DBCBAvisoActivoFAP.Top + DBCBAvisoActivoFAP.Height;

  DBMAvisoOFP.Height := Altura - DBCBAvisoActivoOFP.Height - 10;
  DBMAvisoOCP.Height := Altura - DBCBAvisoActivoOCP.Height - 10;
  DBMAvisoPEP.Height := Altura - DBCBAvisoActivoPEP.Height - 10;
  DBMAvisoALP.Height := Altura - DBCBAvisoActivoALP.Height - 10;
  DBMAvisoFAP.Height := Altura - DBCBAvisoActivoFAP.Height - 10;
end;

procedure TFMProveedores.DBEFCuentaGastosChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFCuentaGastos.Text) = '') then
     ETituloCuentaGastos.Text := _('Segun configuracion')
  else
     ETituloCuentaGastos.Text := DameTituloCuenta(DBEFCuentaGastos.Text);
end;

//Articulos Proveedor
procedure TFMProveedores.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  if (PCMain.ActivePage = TSArticulos) then
     DataModule.CerrarArticulos;
end;

procedure TFMProveedores.TSArticulosShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirArticulos;
  ControlEdit := CEArticulos;
end;

procedure TFMProveedores.RefrescaPestanyaActiva;
begin
  if Assigned(PCMain) then
     if Assigned(PCMain.ActivePage.OnShow) then
        PCMain.ActivePage.OnShow(Self);
end;

procedure TFMProveedores.DBGProArtBusqueda(Sender: TObject);
begin
  inherited;
  DBGProArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMProveedores.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGMain, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGMain.Columns[IdColumna].Title.Caption := LeeParametro(format('PRODESC%3.3d', [i]));
  end;

  LCampo1.Caption := LeeParametro(format('PRODESC%3.3d', [1]));
  LCampo2.Caption := LeeParametro(format('PRODESC%3.3d', [2]));
  LCampo3.Caption := LeeParametro(format('PRODESC%3.3d', [3]));
  LCampo4.Caption := LeeParametro(format('PRODESC%3.3d', [4]));
  LCampo5.Caption := LeeParametro(format('PRODESC%3.3d', [5]));
  LCampo6.Caption := LeeParametro(format('PRODESC%3.3d', [6]));
  LCampo7.Caption := LeeParametro(format('PRODESC%3.3d', [7]));
  LCampo8.Caption := LeeParametro(format('PRODESC%3.3d', [8]));

  LimitaSegunPais;

  ColorCampoID(DBEProveedor);

  FormResize(Sender);
end;

procedure TFMProveedores.TSAgrupacionesShow(Sender: TObject);
begin
  inherited;
  FormResize(Sender);
end;

procedure TFMProveedores.SBAContaExtractoDblClick(Sender: TObject);
begin
  inherited;
  AContaExtracto.Execute;
end;

procedure TFMProveedores.AContaExtractoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AContaExtracto, DBECuenta.Text);
end;

procedure TFMProveedores.AConfigCircularizacionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  TFMListConfig.Create(Self).Muestra(645, Formato, Cabecera, Copias, Pijama, '', DMLstCircularizacion.frCircularizacion);
  CierraData(DMLstCircularizacion);
end;

procedure TFMProveedores.AVisualizarCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(0, False);
end;

procedure TFMProveedores.AImprimirCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(1, False);
end;

procedure TFMProveedores.AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(2, False, True);
end;

procedure TFMProveedores.AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(2, True);
end;

procedure TFMProveedores.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('PRO', DameIDProveedor(DataModule.QMProveedoresPROVEEDOR.AsInteger), Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosProveedor.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMProveedores.AAccesoDirectoExecute(Sender: TObject);
begin
  GuardaAccesoDirecto('AProveedores');
end;

procedure TFMProveedores.Notas;
begin
  LBNotas.Visible := False;
  RelojNotas.Enabled := ((DataModule.QMProveedores.Active) and (Trim(DataModule.QMProveedoresNOTAS.AsString) <> ''));
end;

procedure TFMProveedores.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbEdit) then
  begin
     DBEProveedor.ReadOnly := True;
     DBEProveedor.Enabled := False;
     DBEProveedor.ReadOnly := not DBEProveedor.Enabled;
     DBEFTercero.Enabled := False;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorInfo(DBEFTercero);
  end
  else
  if (Button = nbInsert) then
  begin
     if (REntorno.Proveedor_aut) then
     begin
        ColorCampoID(DBEProveedor);
        DBEProveedor.Enabled := False;
        DBEProveedor.ReadOnly := not DBEProveedor.Enabled;
     end
     else
     begin
        ColorEdicion(DBEProveedor);
        DBEProveedor.Enabled := True;
        DBEProveedor.ReadOnly := not DBEProveedor.Enabled;
     end;

     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorEdicion(DBEFTercero);
  end
  else
  begin
     DBEProveedor.Enabled := True;
     DBEProveedor.ReadOnly := not DBEProveedor.Enabled;
     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorCampoID(DBEProveedor);
     ColorEdicion(DBEFTercero);
  end;
end;

procedure TFMProveedores.EFiltroAgrupacionChange(Sender: TObject);
begin
  inherited;
  DataModule.FiltraAgrupacionDisponible(EFiltroAgrupacion.Text);
end;

procedure TFMProveedores.TSAgrupacionesResize(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMProveedores.DBEFProyectoChange(Sender: TObject);
begin
  inherited;
  EProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyecto.Text, 0));
end;

procedure TFMProveedores.LimitaSegunPais;
begin
  DBCBFactoring.Visible := (REntorno.Pais = 'CHL');
end;

end.
