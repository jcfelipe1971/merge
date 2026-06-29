unit UFMClientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UTeclas, UControlEdit, StdCtrls, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, UFPEdit,
  dbcgrids, ActnList, Buttons, UDMClientes, Variants, NsDBGrid, rxPlacemnt,
  ULFHYDBDescription, URecursos, URightMaskEdit, ULFEdit, ULFDBCheckBox, ULFDBEdit, ULFFormStorage,
  ULFActionList, ULFToolBar, ULFPanel, ULFDBCtrlGrid, ULFDBMemo,
  ULFDBEditFind2000, ULFPageControl, DBActns, UHYDescription,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, ULFDBComboBoxValue, DB,
  TFlatPanelUnit, TeEngine, Series, TeeProcs, Chart, DbChart, ULFEditFind2000, HYFIBQuery, idGlobalProtocols, ShellAPI,
  RXDBCtrl, ULFDBDateEdit, rxToolEdit, ULFComboBox, ULFDateEdit, RxDBComb,
  DbComboBoxValue, ULFFIBDBEditFind;

type
  TFMClientes = class(TFPEdit)
     LBLClienteFicha: TLFLabel;
     LBLTercero: TLFLabel;
     LBLAgente: TLFLabel;
     LBLTarifa: TLFLabel;
     LBLFormaPago: TLFLabel;
     LBLModoIVA: TLFLabel;
     LBLDtoPP: TLFLabel;
     LBLCuenta: TLFLabel;
     LBLRetencion: TLFLabel;
     DBECliente: TLFDbedit;
     DBETituloTercero: TLFDbedit;
     ETituloAgente: TLFEdit;
     DBEDtoPP: TLFDbedit;
     DBEFTercero: TLFDBEditFind2000;
     DBEFAgente: TLFDBEditFind2000;
     ETituloTarifa: TLFEdit;
     ETituloFormaPago: TLFEdit;
     ETituloModoIva: TLFEdit;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     PNLInfoNotas: TLFPanel;
     DBEInfoNotasCliente: TLFDbedit;
     DBEInfoNotasTitulo: TLFDbedit;
     TBSep2: TToolButton;
     NavNotas: THYMNavigator;
     PNLEditNotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     DBEFTarifa: TLFDBEditFind2000;
     DBEFPerfil: TLFDBEditFind2000;
     ETituloPerfil: TLFEdit;
     LBLPerfil: TLFLabel;
     DBETituloIRPF: TLFDbedit;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBEPIRPF: TLFDbedit;
     ETituloTipoTercero: TLFEdit;
     LBLTipoCliente: TLFLabel;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     TSAgrupaciones: TTabSheet;
     TBProv: TLFToolBar;
     PNLInfoAgrupaciones: TLFPanel;
     DBEInfoAgrupacionesTitulo: TLFDbedit;
     DBEInfoAgrupacionesCliente: TLFDbedit;
     NavAgrupaciones: THYMNavigator;
     DBCGDisponibles: TLFDBCtrlGrid;
     PDisponibles: TLFPanel;
     PPertenece: TLFPanel;
     DBCGPertenece: TLFDBCtrlGrid;
     DBEAgDentro: TLFDbedit;
     DBEAgTitDentro: TLFDbedit;
     DBEAgCodDisp: TLFDbedit;
     DBEAgTitDisp: TLFDbedit;
     CEAgrupaciones: TControlEdit;
     CEAgrupacionesPMEdit: TPopUpTeclas;
     TSVacaciones: TTabSheet;
     TBVacaciones: TLFToolBar;
     PNLInfoVacaciones: TLFPanel;
     DBEInfoVacacionesCliente: TLFDbedit;
     DBEInfoVacacionesTitulo: TLFDbedit;
     TBSep6: TToolButton;
     PNVacaciones: TLFPanel;
     DBGFVacaciones: TDBGridFind2000;
     CEVacaciones: TControlEdit;
     CEVacacionesPMEdit: TPopUpTeclas;
     NavVacaciones: THYMNavigator;
     DBEDtoCial: TLFDbedit;
     LBLDtoCial: TLFLabel;
     DBCBAnticipos: TLFDBCheckBox;
     DBEFTipoCliente: TLFDBEditFind2000;
     DBEFFormaPago: TLFDBEditFind2000;
     DBEFModoIva: TLFDBEditFind2000;
     LBLSuProveedor: TLFLabel;
     DBESuProveedor: TLFDbedit;
     DBCBEvalFebSi: TLFDBCheckBox;
     DBCBEvalFeb: TLFDBCheckBox;
     LBMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     ETituloMoneda: TLFEdit;
     ALClientes: TLFActionList;
     ANewTercero: TAction;
     ANewAgente: TAction;
     NavAgrupacionesDisp: THYMNavigator;
     CEAgrupacionesDisp: TControlEdit;
     CEAgrupacionesDispPMEdit: TPopUpTeclas;
     ATercero: TAction;
     SBATercero: TSpeedButton;
     SBAContaExtracto: TSpeedButton;
     AAAgente: TAction;
     SBAAgente: TSpeedButton;
     MISepEnlaces: TMenuItem;
     MIVerDatosTercero: TMenuItem;
     MIVerDatosAgente: TMenuItem;
     DBCBFinanciacion: TLFDBCheckBox;
     TSFiltros: TTabSheet;
     PFiltro_Fac: TLFPanel;
     CEFiltros: TControlEdit;
     CEFiltrosPMEdit: TPopUpTeclas;
     TBFiltros: TLFToolBar;
     TBSep3: TToolButton;
     NavDatosFacturacion: THYMNavigator;
     DBCHKAdmin: TLFDBCheckBox;
     DBCHKEnvio: TLFDBCheckBox;
     DBEPor_Financion: TLFDbedit;
     LPorFinanciacion: TLFLabel;
     DBCBNo_alb_fac: TLFDBCheckBox;
     DBCheckBox2: TLFDBCheckBox;
     DBFacSerie: TLFDBCheckBox;
     DBEFSeries: TLFDBEditFind2000;
     TBSep7: TToolButton;
     PNLInfoDatosFacturacion: TLFPanel;
     DBEInfoDatosFacturacionCliente: TLFDbedit;
     DBEInfoDatosFacturacionTitulo: TLFDbedit;
     LBLTransportista: TLFLabel;
     DBEFTransportista: TLFDBEditFind2000;
     ETituloTransportista: TLFEdit;
     TSRiesgos: TTabSheet;
     LBLDiasPagos: TLFLabel;
     DBEDiaPago1: TLFDbedit;
     DBEDiaPago2: TLFDbedit;
     TBRiesgos: TLFToolBar;
     TBSep8: TToolButton;
     CERiesgos: TControlEdit;
     CERiesgosPMEdit: TPopUpTeclas;
     PNLRiesgos: TLFPanel;
     LRiesgoAut: TLFLabel;
     DBERiesgoAut: TLFDbedit;
     EDTRiesgoAutEmp: TLFEdit;
     EDTRiesgoActEmp: TLFEdit;
     DBERiesgoAct: TLFDbedit;
     LRiesgoActual: TLFLabel;
     LBLRiesgoVencido: TLFLabel;
     DBERiesgoVencido: TLFDbedit;
     EDTRiesgoVenCan: TLFEdit;
     DBERiesgoActCan: TLFDbedit;
     EDTRiesgoActCanal: TLFEdit;
     EDTRiesgoAutCanal: TLFEdit;
     DBERiesgoAutCan: TLFDbedit;
     LBLRiesgoAutCan: TLFLabel;
     LBLRiesgoActualCan: TLFLabel;
     NavRiesgos: THYMNavigator;
     PNLInfoRiegos: TLFPanel;
     DBEInfoRiesgosTitulo: TLFDbedit;
     DBEInfoRiesgosCliente: TLFDbedit;
     TSVentas: TTabSheet;
     DBGVentasDocumento: THYTDBGrid;
     TSPrecios: TTabSheet;
     DBGPrecios: THYTDBGrid;
     LBLSuReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     DBCBFacturarAlmacen: TLFDBCheckBox;
     LBLRiesgoFacturas: TLFLabel;
     DBERiesgoFacturas: TLFDbedit;
     EDTRiesgoFacEmp: TLFEdit;
     LBLRiesgoAlbaranes: TLFLabel;
     DBERiesgoAlbaranes: TLFDbedit;
     EDTRiesgoAlbEmp: TLFEdit;
     LBLRiesgoCartera: TLFLabel;
     DBERiesgoCartera: TLFDbedit;
     EDTRiesgoCarEmp: TLFEdit;
     LBLRiesgoRemesas: TLFLabel;
     DBERiesgoRemesas: TLFDbedit;
     EDTRiesgoRemEmp: TLFEdit;
     LBLRiesgoDescuento: TLFLabel;
     DBERiesgoDescuento: TLFDbedit;
     EDTRiesgoDescuentoCan: TLFEdit;
     LBLRiesgoPendiente: TLFLabel;
     DBERiesgoPendiente: TLFDbedit;
     EDTRiesgoPenEmp: TLFEdit;
     ButUltimoCte: TBitBtn;
     TButtInfoComercialKri: TToolButton;
     DBCBFacturarTarifa: TLFDBCheckBox;
     DBChkBIntra: TLFDBCheckBox;
     LblPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     ETituloPais: TLFEdit;
     LblTipoTrans: TLFLabel;
     DBEFTipoTrans: TLFDBEditFind2000;
     ETituloTipoTrans: TLFEdit;
     DBCBCreditoYCaucion: TLFDBCheckBox;
     CBMoroso: TLFDBCheckBox;
     TSInfoComercial: TTabSheet;
     PNLInfoInfoComercial: TLFPanel;
     DBEInfoInfoComercialCliente: TLFDbedit;
     DBEInfoInfoComercialTitulo: TLFDbedit;
     NavInfoComercial: THYMNavigator;
     CEInfoComrecial: TControlEdit;
     CEInfoComrecialPMEdit: TPopUpTeclas;
     PNLInfoComercial: TLFPanel;
     LNroEmpleados: TLFLabel;
     LFacturacionTotal: TLFLabel;
     LConsumoMateriales: TLFLabel;
     LProveedoresHabituales: TLFLabel;
     LTipoCliente: TLFLabel;
     DBENroDeEmpleados: TLFDBEdit;
     DBEFacturacionTotal: TLFDBEdit;
     DBEConsumoMaterial: TLFDBEdit;
     DBEProveedoresHabituales: TLFDBEdit;
     DBETipoCliente: TLFDBEdit;
     DBChkClientePotecial: TLFDBCheckBox;
     DBCBTipoCliente: TLFDBComboBoxValue;
     LRiesgoKri: TLFLabel;
     DBERiesgoAutorizadoKri: TLFDBEdit;
     LUltimaCompra: TLFLabel;
     DBChkNoCalcularDescuentosKri: TLFDBCheckBox;
     DBChkNO_AGRUPAR_PED: TLFDBCheckBox;
     LBLPotencialDeCompra: TLFLabel;
     DBEPotencialDeCompraKri: TLFDBEdit;
     PNLEditNotasFac: TLFPanel;
     DBMNotasFacturacion: TLFDBMemo;
     LNotasFacturacionKri: TLFLabel;
     LRiesgoFactor: TLFLabel;
     DBEFactorRiesgoKri: TLFDBEdit;
     LRiesgoPedidos: TLFLabel;
     DBERiesgoPedidos: TLFDbedit;
     EDTRiesgoPedEmp: TLFEdit;
     LRiesgoTotalKri: TLFLabel;
     LRiesgoPendienteTotalKri: TLFLabel;
     LImpagados: TLFLabel;
     AActualizarRiesgos: TAction;
     AEtiquetasCliente: TAction;
     AVisualizarDatosClientes: TAction;
     AImprimirDatosClientes: TAction;
     AVisualizarDatosFiscales: TAction;
     AImprimirDatosFiscales: TAction;
     AClientesporAgrupacion: TAction;
     AVisualizarListadoDirecciones: TAction;
     AListadoDireccionesCP: TAction;
     AImprimirListadoDirecciones: TAction;
     AEtiquetas: TAction;
     AVentasDetalladas: TAction;
     AFiltradoAgrup: TAction;
     AVentaArticulosCli: TAction;
     AActualizaVacaciones: TAction;
     AActualizaRiesgoCliente: TAction;
     AConfClientes: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     AConfClientesFiscal: TAction;
     AConfAgrupClientes: TAction;
     AConfDireccionesCli: TAction;
     AConfDireccionesCliCP: TAction;
     AConfEtiquetas: TAction;
     AConfVentasDetalladas: TAction;
     LFCategoryAction4: TLFCategoryAction;
     ToolButton2: TToolButton;
     LFCategoryAction5: TLFCategoryAction;
     LDescuentoPag: TLFLabel;
     DBERiesgoDescuentoPagares: TLFDbedit;
     EDRiesgoDescuentoPagares: TLFEdit;
     AVentasAgenteClienteMes: TAction;
     ASep: TAction;
     AConfVentasAgenteClienteMes: TAction;
     ASep2: TAction;
     DBEFCuentaDtoPP: TLFDBEditFind2000;
     LCuentaDtoPP: TLFLabel;
     LBLDiasEntrega: TLFLabel;
     DBEDiasEntrega: TLFDbedit;
     DBEFIdioma: TLFDBEditFind2000;
     ETituloIdioma: TLFEdit;
     LIdioma: TLFLabel;
     AClienteCuota: TAction;
     AIncidencias: TAction;
     TSIncidencias: TTabSheet;
     DBGIncidencias: THYTDBGrid;
     TBIncidencias: TLFToolBar;
     PNLInfoIncidencias: TLFPanel;
     DBEInfoIncidenciasTitulo: TLFDbedit;
     DBEInfoIncidenciasCliente: TLFDbedit;
     DBCKPtoVerde: TLFDBCheckBox;
     DBCBDireccion: TLFDBComboBoxValue;
     DBCBAgente: TLFDBComboBoxValue;
     DBCBTransportista: TLFDBComboBoxValue;
     DBCBReferencia: TLFDBComboBoxValue;
     DBECodCreditoYCaucion: TLFDbedit;
     CBEnviarFactrurasEmail: TLFDBCheckBox;
     AEtiquetasFiltrados: TAction;
     AConfEtiquetasFiltrados: TAction;
     EFCliente: TLFEditFind2000;
     TSDescuentos: TTabSheet;
     TBDescuentosKri: TLFToolBar;
     PNLInfoDescuentos: TLFPanel;
     DBEInfoDescuentosCliente: TLFDbedit;
     DBEInfoDescuentosTitulo: TLFDbedit;
     TBSep13: TToolButton;
     NavDescuentosKri: THYMNavigator;
     DBGFDescuentosKRI: TDBGridFind2000;
     LBTipoPortes: TLFLabel;
     DBEFPortes: TLFDBEditFind2000;
     ETituloPortes: TLFEdit;
     LBPorPortes: TLFLabel;
     DBEPorPortes: TLFDbedit;
     LBIPortes: TLFLabel;
     DBEIPortes: TLFDbedit;
     LBRangos: TLFLabel;
     DBEFRango: TLFDBEditFind2000;
     DBETituloRango: TLFDbedit;
     LBIndice: TLFLabel;
     DBEFIndice: TLFDBEditFind2000;
     DBETituloIndice: TLFDbedit;
     DBEAnticipado: TLFDbedit;
     EDAnticipadoEmpresa: TLFEdit;
     LBAnticipadoCanal: TLFLabel;
     LAnticipado: TLFLabel;
     DBEAnticipadoCanal: TLFDbedit;
     EDAnticipadoCanal: TLFEdit;
     TSEstadisticas: TTabSheet;
     TBEstadisticas: TLFToolBar;
     PNLInfoEstadistica: TLFPanel;
     DBEInfoEstadisticasTitulo: TLFDbedit;
     DBEInfoEstadisticasCliente: TLFDbedit;
     LFPCEstadisticas: TLFPageControl;
     TSDocumentos: TTabSheet;
     TSGraficos: TTabSheet;
     FPDocumentos: TFlatPanel;
     LFLPesupPend: TLFLabel;
     LFLPresupAceptados: TLFLabel;
     LPresupuestosDenegados: TLFLabel;
     LPedidosPendientes: TLFLabel;
     LFLAlbPend: TLFLabel;
     LFLFactPend: TLFLabel;
     LNum: TLFLabel;
     LBaseImponible: TLFLabel;
     LLiquido: TLFLabel;
     LFEPresupPend: TLFEdit;
     LFEPresupAcept: TLFEdit;
     LFEPresupDeni: TLFEdit;
     LFEPedPend: TLFEdit;
     LFEAlbPend: TLFEdit;
     LFEFactPend: TLFEdit;
     LFDEFactPendLIQUIDO: TLFDbedit;
     LFDEAlbPendLIQUIDO: TLFDbedit;
     LFDEPedPendLIQUIDO: TLFDbedit;
     LFDEPresupDeniLIQUIDO: TLFDbedit;
     LFDEPresupAceptLIQUIDO: TLFDbedit;
     LFDEPresupAceptBASE: TLFDbedit;
     LFDEPresupDeniBASE: TLFDbedit;
     LFDEPedPendBASE: TLFDbedit;
     LFDEAlbPendBASE: TLFDbedit;
     LFDEFactPendBASE: TLFDbedit;
     LFDEFactPendNUMERO: TLFDbedit;
     LFDEAlbPendNUMERO: TLFDbedit;
     LFDEPedPendNUMERO: TLFDbedit;
     LFDEPresupDenNUMERO: TLFDbedit;
     LFDEPresupAceptNUMERO: TLFDbedit;
     LFDEPresupPendLIQUIDO: TLFDbedit;
     LFDEPresupPendBASE: TLFDbedit;
     LFDEPresupPendNUMERO: TLFDbedit;
     FPImpagados: TFlatPanel;
     LRecPend: TLFLabel;
     LRecPendRetraso: TLFLabel;
     LRecPendPlazo: TLFLabel;
     LRecNoCob: TLFLabel;
     LRecImp: TLFLabel;
     LFLFactCob: TLFLabel;
     LFERiesgosRecPend: TLFEdit;
     LFDERecImpagadosIMPORTE: TLFDbedit;
     LFERiesgosRecImp: TLFEdit;
     LFERiesgosRecNoCob: TLFEdit;
     LFDERecImpagadosNUMERO: TLFDbedit;
     LFDERecNoCobradosIMPORTE: TLFDbedit;
     LFDERecPendIMPORTE: TLFDbedit;
     LFDERecNoCobradosNUMERO: TLFDbedit;
     LFDERecPendNUMERO: TLFDbedit;
     LFDERecPendRetraso: TLFDbedit;
     LFDEREcPendPLazo: TLFDbedit;
     LFDEFactCobNUMERO: TLFDbedit;
     LFDEFactCobLIQUIDO: TLFDbedit;
     LFEFactCob: TLFEdit;
     FPCartera: TFlatPanel;
     LPPRecibir: TLFLabel;
     LFDEPPRecibirNUMERO: TLFDbedit;
     LFDEPPRecibirIMPORTE: TLFDbedit;
     LFEPPRecibir: TLFEdit;
     LFEPPCobrar: TLFEdit;
     LFDEPPCobrarIMPORTE: TLFDbedit;
     LFDEPPCobrarNUMERO: TLFDbedit;
     LPPCobrar: TLFLabel;
     LAnticipo: TLFLabel;
     LFDEAnticipo: TLFDbedit;
     LFEAnticipo: TLFEdit;
     LAntCuenta: TLFLabel;
     LFDEAntCuenta: TLFDbedit;
     PNLEstadisticas: TLFPanel;
     LEstadisticasEnero: TLFLabel;
     LEstadisticasFebrero: TLFLabel;
     LEstadisticasMarzo: TLFLabel;
     LEstadisticasAbril: TLFLabel;
     LEstadisticasMayo: TLFLabel;
     LEstadisticasJunio: TLFLabel;
     LEstadisticasJulio: TLFLabel;
     LEstadisticasAgosto: TLFLabel;
     LEstadisticasSeptiempre: TLFLabel;
     LEstadisticasOctubre: TLFLabel;
     LEstadisticasNoviembre: TLFLabel;
     LEstadisticasDiciembre: TLFLabel;
     LFComparar: TLFLabel;
     LFActual: TLFLabel;
     LFPrevision: TLFLabel;
     LEstadisticasTotal: TLFLabel;
     LPorcentajeEstimacion: TLFLabel;
     LFLEjercicioActual: TLFLabel;
     LFLEjercicioComparar: TLFLabel;
     LBaseComp: TLFLabel;
     LBaseAct: TLFLabel;
     LBasePrev: TLFLabel;
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
     PNLGraficos: TLFPanel;
     AMuestraImpagados: TAction;
     ARecibosPendCob: TAction;
     APedPend: TAction;
     AAlbPend: TAction;
     AFacPend: TAction;
     AFacCob: TAction;
     ACalculaEstadisticas: TAction;
     AMultiSeleccion: TAction;
     SBPedPend: TSpeedButton;
     SBAlbPend: TSpeedButton;
     SBFacPend: TSpeedButton;
     SBVerRecPenRec: TSpeedButton;
     SBVerRecPenCob: TSpeedButton;
     SBVerRecImp: TSpeedButton;
     SBFacCob: TSpeedButton;
     ARecibosPendRec: TAction;
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
     APedidosClienteTodas: TAction;
     AOfertasClienteTodas: TAction;
     AAlbaranesClienteTodas: TAction;
     AFacturasClienteTodas: TAction;
     DBEFrecuencia: TLFDbedit;
     LFrecuencia: TLFLabel;
     LNombCom_Social: TLFLabel;
     ToolButton7: TToolButton;
     DBEUltimaCompraKri: TLFDbedit;
     ToolButton8: TToolButton;
     DBEImpagadosKri: TLFDbedit;
     DBERiesgoPendienteTotalKri: TLFDbedit;
     DBERiesgoTotalKri: TLFDbedit;
     EDRiesgoTotalKri: TLFEdit;
     EDRiesgoPendienteTotalKri: TLFEdit;
     EDImpagadosKri: TLFEdit;
     TSComunicaciones: TTabSheet;
     TBComunicaciones: TLFToolBar;
     PNLInfoComunicaciones: TLFPanel;
     DBEInfoComunicacionesCliente: TLFDbedit;
     DBEInfoComunicacionesTitulo: TLFDbedit;
     TBSep14: TToolButton;
     NavComunicaciones: THYMNavigator;
     CEComunicaciones: TControlEdit;
     CEComunicacionesPMEdit: TPopUpTeclas;
     EFComunicacionesBusqueda: TLFEditFind2000;
     ToolButton10: TToolButton;
     LComunicacionesBusqueda: TLFLabel;
     DBGComunicaciones: TDBGridFind2000;
     TButtEnviarComunicacionXMail: TToolButton;
     AEnviarComunicacionXMail: TAction;
     TButtImportarArchivoComunicacion: TToolButton;
     AImportarArchivoComunicacion: TAction;
     TButtPlantillaComunicacion: TToolButton;
     PMPlantillasComunicaciones: TPopupMenu;
     LDireccionIncidencia: TLFLabel;
     EFDireccionIncidencia: TLFEditFind2000;
     EDireccionIncidencia: TLFEdit;
     LZona: TLFLabel;
     DBEFZona: TLFDBEditFind2000;
     ETituloZona: TLFEdit;
     TButtLinea: TToolButton;
     DBMMDatosIncidencia: TLFDBMemo;
     Splitter1: TSplitter;
     LFCategoryAction6: TLFCategoryAction;
     AAdjuntosTercero: TAction;
     AAdjuntosCliente: TAction;
     AAdjuntosAgente: TAction;
     AAdjuntosTransportista: TAction;
     DBECodCreditoYCaucionRiesgos: TLFDbedit;
     DBCBCreditoYCaucionRiesgos: TLFDBCheckBox;
     TBPrecios: TLFToolBar;
     NavPrecios: THYMNavigator;
     DBEInfoPreciosCliente: TLFDbedit;
     DBEInfoPreciosTitulo: TLFDbedit;
     TBSep12: TToolButton;
     ToolButton12: TToolButton;
     NavPreciosProtocolo: THYMNavigator;
     EProtocolo: TLFEdit;
     DBEFProtocolo: TLFDBEditFind2000;
     CEPreciosProtocolo: TControlEdit;
     CEPreciosProtocoloPMEdit: TPopUpTeclas;
     PNLPreciosProtocolo: TLFPanel;
     LProtocolo: TLFLabel;
     PNLPrecios: TLFPanel;
     LBloqueo: TLFLabel;
     LMotivoBloqueo: TLFLabel;
     DBEMotivoBloqueo: TLFDbedit;
     DBCBBloqueo: TLFDBComboBoxValue;
     PNLInfoPrecios: TLFPanel;
     LCodigoIncoterm: TLFLabel;
     DBEFCodigoIncoterm: TLFDBEditFind2000;
     ECodigoIncoterm: TLFEdit;
     CBDirDefectoVentas: TLFDBCheckBox;
     CBCalcFechaEntrega: TLFDBCheckBox;
     DBEDireccionDefecto: TLFDBEditFind2000;
     DBCKSinDto: TLFDBCheckBox;
     LLiquidoComp: TLFLabel;
     LLiquidoAct: TLFLabel;
     LLiquidoPrev: TLFLabel;
     TBInfoComercial: TLFToolBar;
     TBSep11: TToolButton;
     TSConsumo: TTabSheet;
     PNLConsumo: TLFPanel;
     TBConsumo: TLFToolBar;
     ALstConsumo: TAction;
     AContLstConsum: TAction;
     DBGConsumo: TDBGridFind2000;
     NavConsumo: THYMNavigator;
     DBECuenta: TLFDBEditFind2000;
     CBUtilizaFormaPagoAlternativa: TLFDBCheckBox;
     DBCHKBaja: TLFDBCheckBox;
     DBDTPFechaBaja: TLFDBDateEdit;
     DBEMotivoBaja: TLFDbedit;
     LCtaDtoCial: TLFLabel;
     EFCtaDtoCial: TLFDBEditFind2000;
     DBLCBTipoNCF: TDBLookupComboBox;
     LTipoNCF: TLFLabel;
     AListadoCuotas: TAction;
     AConfListadoCuotas: TAction;
     PNLDireccionClienteIncidencia: TLFPanel;
     DBEFCuentaVenta: TLFDBEditFind2000;
     DBEFCuentaCompra: TLFDBEditFind2000;
     LCuentaVenta: TLFLabel;
     LCuentaCompra: TLFLabel;
     ETitCtaDtoPP: TLFEdit;
     ECtaDtoCial: TLFEdit;
     ETitCtaVenta: TLFEdit;
     ETitCtaCompra: TLFEdit;
     ToolButton14: TToolButton;
     TButtImprimirNotas: TToolButton;
     AImprimirNotas: TAction;
     ToolButton15: TToolButton;
     DBChkBValorarAlb: TLFDBCheckBox;
     DBEDtoCialLinea: TLFDbedit;
     TSIso: TTabSheet;
     PNLISO: TLFPanel;
     DBGIso: TDBGridFind2000;
     TBInfoISO: TLFToolBar;
     PNLInfoISO: TLFPanel;
     DBEInfoISOCliente: TLFDbedit;
     DBEInfoISOTitulo: TLFDbedit;
     TBSep10: TToolButton;
     NavISO: THYMNavigator;
     LDtoCialLinea: TLFLabel;
     AClientesFac: TAction;
     DBDTPFecPropuestaCredCauc: TLFDBDateEdit;
     LFecPropuesta: TLFLabel;
     DBChkBRECC: TLFDBCheckBox;
     ExportarClientesFiltrados: TAction;
     TButtDocumentos: TToolButton;
     ADocumentos: TAction;
     AExportarDirCliFiltrados: TAction;
     CBExportar: TLFDBCheckBox;
     CECentrosAdministrativos: TControlEdit;
     CECentrosAdministrativosPMEdit: TPopUpTeclas;
     TSFacturaElectronica: TTabSheet;
     PNLCentroAdmFacElectronicaES: TLFPanel;
     TBCentrosAdministrativosFaclElectronicaES: TLFToolBar;
     NavCentrosAdministrativosFaclElectronicaES: THYMNavigator;
     DBGCentrosAdministrativosFaclElectronicaES: TDBGridFind2000;
     LNotasFactruraElectronica: TLFLabel;
     LClientePrestashop: TLFLabel;
     DBEClientePrestashop: TLFDbedit;
     LUltSincronizacion: TLFLabel;
     DEUltSincronizacion: TLFDBDateEdit;
     DBEFBancoParaPagos: TLFDBEditFind2000;
     LBancoParaPagos: TLFLabel;
     ETituloBancoParaPagos: TLFEdit;
     DBChkBValorarPed: TLFDBCheckBox;
     LPeriodoFacturacion: TLFLabel;
     DBEFPeriodoFacturacion: TLFDBEditFind2000;
     DBEFClientePadre: TLFDBEditFind2000;
     ETituloClientePadre: TLFEdit;
     LMotivoBaja: TLFLabel;
     PCVentas: TLFPageControl;
     TSVentasDocumentos: TTabSheet;
     TSVentasDetalle: TTabSheet;
     TBVentas: TLFToolBar;
     PNLInfoVentas: TLFPanel;
     DBEInfoVentasCliente: TLFDbedit;
     DBEInfoVentasTitulo: TLFDbedit;
     TBSep9: TToolButton;
     NavVentas: THYMNavigator;
     DBGVentasDetalle: THYTDBGrid;
     PNLFltroVentas: TLFPanel;
     LTipoDocumento: TLFLabel;
     CBTipoDocumento: TLFComboBox;
     LSerieVenta: TLFLabel;
     CBSerieVenta: TLFComboBox;
     LFechaVentas: TLFLabel;
     DEFechaVentasDesde: TLFDateEdit;
     DEFechaVentasHasta: TLFDateEdit;
     LArticuloVentas: TLFLabel;
     EFArticuloVentas: TLFEditFind2000;
     CBPendientes: TLFCheckBox;
     LGrupoCuentas: TLFLabel;
     DBEFGrupoCuentas: TLFDBEditFind2000;
     ETitGrupoCuentas: TLFEdit;
     EDescripcion: TLFEdit;
     LDescripcion: TLFLabel;
     LFCategoryAction7: TLFCategoryAction;
     AOfertasClienteCerradas: TAction;
     LFCategoryAction8: TLFCategoryAction;
     APedidosClienteCerradas: TAction;
     LFCategoryAction9: TLFCategoryAction;
     AAlbaranessClienteCerradas: TAction;
     LFCategoryAction10: TLFCategoryAction;
     AFacturasClienteCerradas: TAction;
     AOfertasClienteActivas: TAction;
     APedidosClienteAbiertas: TAction;
     AAlbaranessClienteAbiertas: TAction;
     AFacturasClienteAbiertas: TAction;
     ACopiaConfEnNuevoCliente: TAction;
     LFCategoryAction11: TLFCategoryAction;
     LCuentaIRPF: TLFLabel;
     DBEFCuentaIRPF: TLFDBEditFind2000;
     ETituloCuentaIRPF: TLFEdit;
     LNIF: TLFLabel;
     DBENif: TLFDbedit;
     DBEDtoCialLinea2: TLFDbedit;
     DBEDtoCialLinea3: TLFDbedit;
     DBCBSepararApunteDescuento: TLFDBCheckBox;
     APedirFirma: TAction;
     ABorrarFirma: TAction;
     LFCategoryAction12: TLFCategoryAction;
     AVisualizarCartaLOPD: TAction;
     AImprimirCartaLOPD: TAction;
     AEnviarEmailCartaLOPD: TAction;
     AEnviarEmailCartaLOPD2: TAction;
     AListConfigCartaLOPD: TAction;
     PCPaisFacturaElectronica: TLFPageControl;
     TSEspana: TTabSheet;
     TSChile: TTabSheet;
     TBTipoGiro: TLFToolBar;
     NavTipoGiro: THYMNavigator;
     DBGFTipoGiro: TDBGridFind2000;
     CETipoGiros: TControlEdit;
     CETipoGirosPMEdit: TPopUpTeclas;
     DBCBDiaSemanaPago: TLFDBComboBoxValue;
     LCategoria: TLFLabel;
     DBEFCategoria: TLFDBEditFind2000;
     ECategoria: TLFEdit;
     LDestinoTraspasoPedido: TLFLabel;
     LSerieDstPedido: TLFLabel;
     LCanalDstPedido: TLFLabel;
     LTipoDstPedido: TLFLabel;
     DBEFCanalDstPedido: TLFDBEditFind2000;
     DBEFSerieDstPedido: TLFDBEditFind2000;
     DBEFTipoDstPedido: TLFDBEditFind2000;
     LImporteMinimoPorte: TLFLabel;
     DBEImporteMinimoPorte: TLFDbedit;
     DBCBAlbaranarSerie: TLFDBCheckBox;
     DBEFSerieAAlbaranar: TLFDBEditFind2000;
     LRiesgoAutEmpresa: TLFLabel;
     DBERiesgoAutEmpresa: TLFDbedit;
     ERiesgoAutEmpresaMoneda: TLFEdit;
     LRiesgoAutCyC: TLFLabel;
     DBERiesgoAutoCyC: TLFDbedit;
     ERiesgoAutoCyCMoneda: TLFEdit;
     DBCBNoVentaRiesgo: TLFDBCheckBox;
     TSAvisos: TTabSheet;
     TBAvisos: TLFToolBar;
     PNLInfoAvisos: TLFPanel;
     DBEInfoAvisosCliente: TLFDbedit;
     DBEInfoAvisosTitulo: TLFDbedit;
     TBSep1: TToolButton;
     NavAvisos: THYMNavigator;
     PNLAvisos: TLFPanel;
     CEAvisos: TControlEdit;
     CEAvisosPMEdit: TPopUpTeclas;
     DBCBAvisoActivoOFC: TLFDBCheckBox;
     DBMAvisoOFC: TLFDBMemo;
     DBCBAvisoActivoPEC: TLFDBCheckBox;
     DBMAvisoPEC: TLFDBMemo;
     DBCBAvisoActivoALB: TLFDBCheckBox;
     DBMAvisoALB: TLFDBMemo;
     DBCBAvisoActivoFAC: TLFDBCheckBox;
     DBMAvisoFAC: TLFDBMemo;
     DBEDiaPago3: TLFDbedit;
     TSVentasMargenes: TTabSheet;
     DBGVentasMargenes: THYTDBGrid;
     TBSep4: TToolButton;
     CBCalculaMargenVenta: TLFCheckBox;
     LFechaAlta: TLFLabel;
     DBEFechaAlta: TLFDbedit;
     LRuta: TLFLabel;
     DBERuta: TLFDbedit;
     LRutaOrden: TLFLabel;
     DBERutaOrden: TLFDbedit;
     TSArticulos: TTabSheet;
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
     PNLArticulos: TPanel;
     TBCodCli: TLFToolBar;
     PNLTBCodCli: TLFPanel;
     DBEInfoArticuloCliente: TLFDbedit;
     DBEInfoArticuloTitulo: TLFDbedit;
     DBGCodCli: TDBGridFind2000;
     NavArticulo: THYMNavigator;
     PNLInfoConsumo: TLFPanel;
     DBEInfoConsumoCliente: TLFDbedit;
     DBEInfoConsumoTitulo: TLFDbedit;
     TBFactElectronica: TLFToolBar;
     PNLInfoFactElectronica: TLFPanel;
     DBEIntoFactElectronicaTitulo: TLFDbedit;
     DBEInfoFactElectronicaCliente: TLFDbedit;
     TBSep5: TToolButton;
     TBSep15: TToolButton;
     DBCBNoAgruparAlbaranes: TLFDBCheckBox;
     AContaExtracto: TAction;
     LFCategoryAction13: TLFCategoryAction;
     AVisualizarCartaCircularizacion: TAction;
     AImprimirCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion2: TAction;
     AConfigCircularizacion: TAction;
     CEConsumo: TControlEdit;
     CEConsumoPMEdit: TPopUpTeclas;
     AAccesoDirecto: TAction;
     LCampo1: TLFLabel;
     LCampo2: TLFLabel;
     LCampo3: TLFLabel;
     LCampo4: TLFLabel;
     LCampo5: TLFLabel;
     LCampo6: TLFLabel;
     LCampo7: TLFLabel;
     LCampo8: TLFLabel;
     DBECampo1: TLFDbedit;
     DBECampo2: TLFDbedit;
     DBECampo3: TLFDbedit;
     DBECampo4: TLFDbedit;
     DBECampo5: TLFDbedit;
     DBECampo6: TLFDbedit;
     DBECampo7: TLFDbedit;
     DBECampo8: TLFDbedit;
     EFiltroAgrupacion: TLFEdit;
     LProyecto: TLFLabel;
     DBEFProyecto: TDBEditFind2000;
     EProyecto: TLFEdit;
     DBENombreComercial: TLFDbedit;
     LNombreComercial: TLFLabel;
     ACreaContactoCRM: TAction;
     DBCBEnviarConfirmacionPedido: TLFDBCheckBox;
     LAgente2: TLFLabel;
     DBEFAgente2: TLFDBEditFind2000;
     ETituloAgente2: TLFEdit;
     TSRedesSociales: TTabSheet;
     TBRedesSociales: TLFToolBar;
     NavRedesSociales: THYMNavigator;
     DBGRedesSociales: TDBGridFind2000;
     CERedesSocialesPMEdit: TPopUpTeclas;
     CERedesSociales: TControlEdit;
     PNLRedesSociales: TLFPanel;
     PNLInfoRedesSociales: TLFPanel;
     DBEclienteRedesSociales: TLFDbedit;
     DBETituloRedesSociales: TLFDbedit;
     TBSep16: TToolButton;
     EDTRiesgoPedLinEmp: TLFEdit;
     DBERiesgoPedidoLineaPendiente: TLFDbedit;
     LRiesgoPedidoLineaPendiente: TLFLabel;
     TBSep17: TToolButton;
     TBActualizaRiesgoCliente: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttCompClick(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure MuestraFiltrado(Tipo: byte);
     procedure MuestraFiltradoFiscal(Tipo: byte);
     procedure TbuttImprimeFiltradoClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure RelojNotasTimer(Sender: TObject);
     procedure DBCGDisponiblesDblClick(Sender: TObject);
     procedure DBCGPerteneceDblClick(Sender: TObject);
     procedure MIConfClientesClick(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSAgrupacionesShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure MIEtiquetasClick(Sender: TObject);
     procedure TSVacacionesShow(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ANewTerceroExecute(Sender: TObject);
     procedure ANewAgenteExecute(Sender: TObject);
     procedure ATerceroExecute(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure AAAgenteExecute(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure ETituloAgenteEnter(Sender: TObject);
     procedure DBETituloTerceroEnter(Sender: TObject);
     procedure TSFiltrosShow(Sender: TObject);
     procedure DBEFTransportistaChange(Sender: TObject);
     procedure TSRiesgosShow(Sender: TObject);
     procedure AActualizarRiesgosExecute(Sender: TObject);
     procedure AEtiquetasClienteExecute(Sender: TObject);
     procedure AVisualizarDatosClientesExecute(Sender: TObject);
     procedure AImprimirDatosClientesExecute(Sender: TObject);
     procedure TSVentasShow(Sender: TObject);
     procedure TSVentasHide(Sender: TObject);
     procedure TSPreciosShow(Sender: TObject);
     procedure ButUltimoCteClick(Sender: TObject);
     procedure TButtInfoComercialKriClick(Sender: TObject);
     procedure AVisualizarDatosFiscalesExecute(Sender: TObject);
     procedure AClientesporAgrupacionExecute(Sender: TObject);
     procedure AVisualizarListadoDireccionesExecute(Sender: TObject);
     procedure AListadoDireccionesCPExecute(Sender: TObject);
     procedure AImprimirListadoDireccionesExecute(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure AVentasDetalladasExecute(Sender: TObject);
     procedure AFiltradoAgrupExecute(Sender: TObject);
     procedure AVentaArticulosCliExecute(Sender: TObject);
     procedure AActualizaVacacionesExecute(Sender: TObject);
     procedure AActualizaRiesgoClienteExecute(Sender: TObject);
     procedure AImprimirDatosFiscalesExecute(Sender: TObject);
     procedure AConfClientesFiscalExecute(Sender: TObject);
     procedure AConfAgrupClientesExecute(Sender: TObject);
     procedure AConfDireccionesCliExecute(Sender: TObject);
     procedure AConfDireccionesCliCPExecute(Sender: TObject);
     procedure AConfEtiquetasExecute(Sender: TObject);
     procedure AConfVentasDetalladasExecute(Sender: TObject);
     procedure AAgenteExecute(Sender: TObject);
     procedure AVentasAgenteClienteMesExecute(Sender: TObject);
     procedure AConfVentasAgenteClienteMesExecute(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AClienteCuotaExecute(Sender: TObject);
     procedure AIncidenciasExecute(Sender: TObject);
     procedure DBGIncidenciasDblClick(Sender: TObject);
     procedure DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AEtiquetasFiltradosExecute(Sender: TObject);
     procedure AConfEtiquetasFiltradosExecute(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure DBEFRangoChange(Sender: TObject);
     procedure DBEFIndiceBusqueda(Sender: TObject);
     procedure DBEFRangoBusqueda(Sender: TObject);
     procedure TSEstadisticasShow(Sender: TObject);
     procedure AMuestraImpagadosExecute(Sender: TObject);
     procedure ARecibosPendCobExecute(Sender: TObject);
     procedure APedPendExecute(Sender: TObject);
     procedure AAlbPendExecute(Sender: TObject);
     procedure AFacPendExecute(Sender: TObject);
     procedure AFacCobExecute(Sender: TObject);
     procedure ACalculaEstadisticasExecute(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure TSEstadisticasHide(Sender: TObject);
     procedure DBCAnualDblClick(Sender: TObject);
     procedure DBCMensualDblClick(Sender: TObject);
     procedure DBCPrevisionDblClick(Sender: TObject);
     procedure ARecibosPendRecExecute(Sender: TObject);
     procedure BBMultiSelectClick(Sender: TObject);
     procedure AFacturasClienteExecute(Sender: TObject);
     procedure AAlbaranesClienteExecute(Sender: TObject);
     procedure APedidosClienteExecute(Sender: TObject);
     procedure AOfertasClienteExecute(Sender: TObject);
     procedure LNombCom_SocialClick(Sender: TObject);
     procedure NavRiesgosClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGPreciosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TSComunicacionesShow(Sender: TObject);
     procedure EFComunicacionesBusquedaBusqueda(Sender: TObject);
     procedure EFComunicacionesBusquedaChange(Sender: TObject);
     procedure TSComunicacionesHide(Sender: TObject);
     procedure DBGComunicacionesDblClick(Sender: TObject);
     procedure DBGCellClick(Column: TColumn);
     procedure DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavComunicacionesChangeState(Sender: TObject);
     procedure AEnviarComunicacionXMailExecute(Sender: TObject);
     procedure AImportarArchivoComunicacionExecute(Sender: TObject);
     procedure PMPlantillasComunicacionesItemOnClick(Sender: TObject);
     procedure EFDireccionIncidenciaBusqueda(Sender: TObject);
     procedure EFDireccionIncidenciaChange(Sender: TObject);
     procedure DBEFZonaChange(Sender: TObject);
     procedure TSIncidenciasShow(Sender: TObject);
     procedure TSIncidenciasHide(Sender: TObject);
     procedure TSDescuentosShow(Sender: TObject);
     procedure TButtLineaClick(Sender: TObject);
     procedure AAdjuntosClienteExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AAdjuntosAgenteExecute(Sender: TObject);
     procedure AAdjuntosTransportistaExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure DBEFProtocoloChange(Sender: TObject);
     procedure NavPreciosProtocoloClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavPreciosProtocoloClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBCBBloqueoChange(Sender: TObject);
     procedure DBEFCodigoIncotermChange(Sender: TObject);
     procedure DBEDireccionDefectoBusqueda(Sender: TObject);
     procedure DBERiesgoPendienteChange(Sender: TObject);
     procedure ALstConsumoExecute(Sender: TObject);
     procedure AContLstConsumExecute(Sender: TObject);
     procedure DBCHKBajaChange(Sender: TObject);
     procedure AListadoCuotasExecute(Sender: TObject);
     procedure AConfListadoCuotasExecute(Sender: TObject);
     procedure DBEFCuentaDtoPPChange(Sender: TObject);
     procedure EFCtaDtoCialChange(Sender: TObject);
     procedure DBEFCuentaVentaChange(Sender: TObject);
     procedure DBEFCuentaCompraChange(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure DBGIsoDblClick(Sender: TObject);
     procedure TSIsoShow(Sender: TObject);
     procedure AClientesFacExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure ExportarClientesFiltradosExecute(Sender: TObject);
     procedure AExportarDirCliFiltradosExecute(Sender: TObject);
     procedure ADocumentosExecute(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSFacturaElectronicaShow(Sender: TObject);
     procedure DBGCentrosAdministrativosFaclElectronicaESBusqueda(Sender: TObject);
     procedure DBEFBancoParaPagosChange(Sender: TObject);
     procedure TSGraficosShow(Sender: TObject);
     procedure DBEFClientePadreChange(Sender: TObject);
     procedure TSVentasDocumentosShow(Sender: TObject);
     procedure TSVentasDetalleShow(Sender: TObject);
     procedure DBGVentasDocumentoDblClick(Sender: TObject);
     procedure DBGVentasDetalleDblClick(Sender: TObject);
     procedure DBGVentasDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGVentasDocumentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FiltroVentasChange(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBEFGrupoCuentasChange(Sender: TObject);
     procedure DBGVentasDetalleTitleClick(Column: TColumn);
     procedure ACopiaConfEnNuevoClienteExecute(Sender: TObject);
     procedure DBEFCuentaIRPFChange(Sender: TObject);
     procedure APedirFirmaExecute(Sender: TObject);
     procedure ABorrarFirmaExecute(Sender: TObject);
     procedure AVisualizarCartaLOPDExecute(Sender: TObject);
     procedure AImprimirCartaLOPDExecute(Sender: TObject);
     procedure AEnviarEmailCartaLOPDExecute(Sender: TObject);
     procedure AEnviarEmailCartaLOPD2Execute(Sender: TObject);
     procedure AListConfigCartaLOPDExecute(Sender: TObject);
     procedure DBEFCategoriaChange(Sender: TObject);
     procedure DBEFTarifaChange(Sender: TObject);
     procedure DBEFAgenteChange(Sender: TObject);
     procedure DBEFFormaPagoChange(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure DBEFModoIvaChange(Sender: TObject);
     procedure TSConsumoShow(Sender: TObject);
     procedure DBEFPerfilChange(Sender: TObject);
     procedure DBEFTipoClienteChange(Sender: TObject);
     procedure DBEFPaisChange(Sender: TObject);
     procedure DBEFTipoTransChange(Sender: TObject);
     procedure DBERiesgoPendienteTotalKriChange(Sender: TObject);
     procedure PNLAvisosResize(Sender: TObject);
     procedure TSAvisosShow(Sender: TObject);
     procedure DBGPreciosDblClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TSVentasMargenesShow(Sender: TObject);
     procedure DBGVentasMargenesTitleClick(Column: TColumn);
     procedure TSArticulosShow(Sender: TObject);
     procedure DBGCodCliBusqueda(Sender: TObject);
     procedure SBAContaExtractoDblClick(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure AVisualizarCartaCircularizacionExecute(Sender: TObject);
     procedure AImprimirCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
     procedure AConfigCircularizacionExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAccesoDirectoExecute(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EFiltroAgrupacionChange(Sender: TObject);
     procedure TSAgrupacionesResize(Sender: TObject);
     procedure DBEFProyectoChange(Sender: TObject);
     procedure ACreaContactoCRMExecute(Sender: TObject);
     procedure DBEInfoVentasClienteChange(Sender: TObject);
     procedure DBGCodCliDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGCodCliCellClick(Column: TColumn);
     procedure DBGCodCliDblClick(Sender: TObject);
     procedure DBEFAgente2Change(Sender: TObject);
     procedure TSRedesSocialesShow(Sender: TObject);
     procedure DBGRedesSocialesDblClick(Sender: TObject);
     procedure DBGRedesSocialesCellClick(Column: TColumn);
     procedure DBGRedesSocialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     Primera: boolean;
     ColActual: TColumn;
     old_Protocolo: string;
     CampoOrdenDetalleVentas, CampoOrdenMargenesVentas: string;
     procedure Notas;
     procedure HabilitaEnlaces;
     procedure MuestraGrafico(Tipo: integer);
     procedure FiltraVentas(CalcularMargenes: boolean);
  public
     SWFil, SWEnlace: integer;
     Formulario, TipoGrafica: integer;
     DataModule: TDMClientes;
     procedure FiltraCliente(AFiltro: string);
     procedure Tercero_a_Cliente(Tercero: integer);
     procedure Potencial_a_Cliente(ClientePotencial, Tercero: integer);
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
     procedure AsignaTarifa(Tarifa: string);
     procedure MuestraDocumentosVenta(TipoDoc: string);
     procedure RefrescaPestanyaActiva;
  end;

var
  FMClientes : TFMClientes;
  Canal : integer;
  ListaCanales : TStringList;

implementation

uses UFormGest, UDMMain, UEntorno, UUtiles,
  UDMLSTClientes, {UDMListConfig,} UFMListConfig,
  UFPregAgrupacionCli, UFMEtiqCli, UFPregEtiCliente, UFPregCPostal,
  UFMain, UFMTerceros, UFMAgentes, UFFiltra_Clientes_Agr,
  UFPregVentasCliente, UDMLstVentasCliente, UFMInformacionComercial, UFPregVentasClienteAge,
  UDMLstVentasCliAge, UFMClienteCuotas, UFMIncidencias,
  UFmRecibosPendientes, UFGrafico, UFMultiSeleccion,
  UFMFacturas, UFMAlbaranes, UFMPedidos, UFMOfertas, UFSendCorreo,
  UDMListados, StrUtils, UFMLstConsumo, UFPregCuotasCliente, UDMLstCuotasCliente,
  UFMVentasCliFec, UProFMFicherosCliente, UFMSeleccion, UParam, DateUtils,
  UFMCondicionesVenta, UDMLstCircularizacion,
  URecibeFicheros, UDMAdjunto, UAccesosDirectos, UCrmFMContactos, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMClientes.FormCreate(Sender: TObject);
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
  AbreDataVarias(TDMClientes, DataModule, Self);
  Campo := DataModule.QMClientesCLIENTE;
  CampoOrdenDetalleVentas := '';
  CampoOrdenMargenesVentas := '';
  HabilitarPunto;
  NavMain.DataSource := DataModule.DSQMClientes;
  EPMain.DataSource := DataModule.DSQMClientes;
  DBGMain.DataSource := DataModule.DSQMClientes;
  DBECuenta.MaxLength := REntorno.DigitosSub;
  DBEFCuentaDtoPP.MaxLength := REntorno.DigitosSub;
  EFCtaDtoCial.MaxLength := REntorno.DigitosSub;
  DBEFCuentaIRPF.MaxLength := REntorno.DigitosSub;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  CENotasPMEdit.Teclas := DMMain.Teclas;
  G2KTableLoc.DataSource := DataModule.DSQMClientes;

  // Monedas
  ERiesgoAutEmpresaMoneda.Text := REntorno.MonedaEmpresa;
  ERiesgoAutoCyCMoneda.Text := REntorno.MonedaEmpresa;
  EDTRiesgoActEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoAutEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoFacEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoAlbEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoCarEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoRemEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoPenEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoPedEmp.Text := REntorno.MonedaEmpresa;
  EDTRiesgoPedLinEmp.Text := REntorno.MonedaEmpresa;
  EDRiesgoTotalKri.Text := REntorno.MonedaEmpresa;
  EDRiesgoPendienteTotalKri.Text := REntorno.MonedaEmpresa;
  EDImpagadosKri.Text := REntorno.MonedaEmpresa;

  EDTRiesgoAutCanal.Text := REntorno.Moneda;
  EDTRiesgoActCanal.Text := REntorno.Moneda;

  EDTRiesgoVenCan.Text := REntorno.Moneda;
  EDTRiesgoDescuentoCan.Text := REntorno.Moneda;
  EDRiesgoDescuentoPagares.Text := REntorno.Moneda;

  //Monedas Anticipos
  EDAnticipadoEmpresa.Text := REntorno.MonedaEmpresa;
  EDAnticipadoCanal.Text := REntorno.Moneda;

  SWFil := 0;
  SWEnlace := 0;

  Notas;
  HabilitaEnlaces;

  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     G2KTableLoc.CondicionBusqueda := 'AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));
     EFCliente.CondicionBusqueda := 'AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));
     with DBEFAgente do
     begin
        CondicionBusqueda := 'AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario));
        Enabled := False;
        Color := clInfoBK;
     end;
  end;

  if (REntorno.Delegacion = 'S') then // dji lrk kri
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavNotas.VisibleButtons := [nbRefresh];
     NavAgrupaciones.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavVacaciones.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavDatosFacturacion.VisibleButtons := [nbRefresh];
     NavRiesgos.VisibleButtons := [nbRefresh];
     NavInfoComercial.VisibleButtons := [nbRefresh];
  end;

  if (REntorno.Cliente_aut) then
  begin
     NavMain.InsertaControl := DBEFTipoCliente;
     ColorCampoID(DBECliente);
     DBECliente.Enabled := False;
     DBECliente.ReadOnly := not DBECliente.Enabled;
  end
  else
  begin
     NavMain.InsertaControl := DBECliente;
     ColorEdicion(DBECliente);
     DBECliente.Enabled := True;
     DBECliente.ReadOnly := not DBECliente.Enabled;
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
  EPorcentajeEstimacion.Text := '0';//floattostr(0);
  TipoGrafica := -1;
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  DBCPrevision.Title.Text.SetText(PChar(Format(_('PREVISIÓN MENSUAL %s'), [REntorno.EjercicioStr])));
  RellenaSeries(CBSerieVenta.Items);
  CBSerieVenta.ItemIndex := 0;
  DameMinMax('EJE', Apertura, Cierre);
  if (DEFechaVentasDesde.Date < EncodeDate(1900, 1, 1)) then
     DEFechaVentasDesde.Date := Apertura;
  if (DEFechaVentasHasta.Date < EncodeDate(1900, 1, 1)) then
     DEFechaVentasHasta.Date := Cierre;

  if (DMMain.EstadoKri(252) = 0) then
     LNombCom_Social.Visible := False;

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
  DirectorioBaseComunicaciones := DirectorioBaseComunicaciones + '\CLI';
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
           Item := TMenuItem.Create(PMPlantillasComunicaciones);
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

  if (DMMain.EstadoKri(261) <> 1) then
  begin
     PNLPreciosProtocolo.Visible := False;
     NavPreciosProtocolo.Visible := False;
  end;

  {Latino}
  if (DMMain.EstadoKri(410) <> 1) then
  begin
     LTipoNCF.Visible := False;
     DBLCBTipoNCF.Visible := False;
  end;

  // Muestra cta compras/ventas en clientes
  // Esta cuenta se utilizará para crear artículos desde modelos de Tallas y Colores
  if (DMMain.EstadoKri(438) <> 1) then
  begin
     LCuentaVenta.Visible := False;
     DBEFCuentaVenta.Visible := False;
     ETitCtaVenta.Visible := False;
     LCuentaCompra.Visible := False;
     DBEFCuentaCompra.Visible := False;
     ETitCtaCompra.Visible := False;

     // Si no se ve, reduzco el formulario
     Self.Height := Self.Height - (DBEFCuentaCompra.Top + DBEFCuentaCompra.Height - DBEFCuentaVenta.Top);
  end;

  { Esto mostraba el campo Z_SERIE que creo que no se utiliza por nadie
  if (LeeParametro('MODREST015') <> 'S') then
  begin
     LSerie.Visible := False;
     DBEFSerie.Visible := False;
  end;
  }

  DBCHKBajaChange(Sender);

  TSFacturaElectronica.TabVisible := (LeeParametro('FACELEC001') = 'S');

  if (LeeParametro('MODSINC003') = 'S') then
  begin
     LClientePrestashop.Visible := False;
     DBEClientePrestashop.Visible := False;
     LUltSincronizacion.Visible := False;
     DEUltSincronizacion.Visible := False;
  end;

  TipoDocumento := LeeParametro('CLIVENT001');
  CBTipoDocumento.ItemIndex := 0;
  while ((CBTipoDocumento.ItemIndex < CBTipoDocumento.Items.Count - 1) and (CBTipoDocumento.Text <> TipoDocumento)) do
     CBTipoDocumento.ItemIndex := CBTipoDocumento.ItemIndex + 1;

  if (CBTipoDocumento.Text <> TipoDocumento) then
     CBTipoDocumento.ItemIndex := 0;

  PNLAvisosResize(Sender);

  PCVentas.ActivePage := TSVentasDocumentos;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(ButUltimoCte, 1, DMMain.ILMain_Ac, 104);
  GetBitmapFromImageList(ButUltimoCte, 2, DMMain.ILMain_In, 104);
end;

procedure TFMClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DataModule);
  DeshabilitarPunto;
end;

procedure TFMClientes.TbuttCompClick(Sender: TObject);
begin
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMClientes.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMClientes.EPMainClickRango(Sender: TObject; var Continua: boolean);
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

  // Riesgos
  if PCMain.ActivePage = TSRiesgos then
     DataModule.MuestraRiesgos;

  if (PCMain.ActivePage = TSFacturaElectronica) then
     DataModule.AbreFacturaElectronica;
end;

procedure TFMClientes.MuestraFiltrado(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DataModule.QMClientes.SelectSQL);
  AbreData(TDMlstClientes, DMLstClientes);
  TempSql.AddStrings(DMLstClientes.QMClientes.SelectSQL);
  DMLstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(SqlFiltro);
  DMLstClientes.MostrarListadoFiltrado(Tipo);
  DMLstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(TempSQL);
  CierraData(DMLstClientes);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMClientes.TbuttImprimeFiltradoClick(Sender: TObject);
begin
  MuestraFiltrado(0);  // Previsualizar
end;

procedure TFMClientes.MuestraFiltradoFiscal(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DataModule.QMClientes.SelectSQL);
  AbreData(TDMlstClientes, DMLstClientes);
  TempSql.AddStrings(DMLstClientes.QMClientes.SelectSQL);
  DMLstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(SqlFiltro);
  DMLstClientes.MostrarFiltradoFiscal(Tipo);
  DMLstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(TempSQL);
  CierraData(DMLstClientes);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMClientes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  i : integer;
  esta : boolean;
begin
  inherited;
  Notas;

  // Riesgos
  if (PCMain.ActivePage = TSRiesgos) then
  begin
     TSRiesgosShow(Sender);
  end;

  if FMain.sourcecall = True then
  begin
     FMain.sourcecall := False;
     Close;
  end
  else
  if FMain.autcliente then
  begin
     esta := False;
     with Application do
        for i := 0 to (ComponentCount - 1) do
           if (('T' + Components[i].Name) = TFMTerceros.ClassName) then
              esta := True;

     if esta then
        FMTerceros.CierraCliente
     else
     begin
        FMain.autcliente := False;
        Close;
     end;
  end;
end;

procedure TFMClientes.RelojNotasTimer(Sender: TObject);
begin
  inherited;
  if LBNotas.Visible = True then
     LBNotas.Visible := False
  else
     LBNotas.Visible := True;
end;

procedure TFMClientes.DBCGDisponiblesDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then // dji lrk kri
     DataModule.AgrupacionRellena;
end;

procedure TFMClientes.DBCGPerteneceDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then // dji lrk kri
     DataModule.AgrupacionVacia;
end;

procedure TFMClientes.MIConfClientesClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(7, formato, cabecera, copias, pijama, '',
     DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

{ Filtra por Cliente }
procedure TFMClientes.FiltraCliente(AFiltro: string);
var
  Parametro : TParametroFiltrado;
begin
  PCMain.ActivePage := TSFicha;

  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := AFiltro;
     Parametro.SQLBase := TStringList.Create;
     Parametro.SQLBase.Text := DataModule.SQLBase.Text;
     Parametro.Tabla := DataModule.QMClientes;
     DMMain.FiltraSQL(Parametro);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;

  if (AFiltro <> '') then
  begin
     SWEnlace := 1;
     SWFil := 0;
  end;

  Notas;
end;

procedure TFMClientes.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMClientes.TSAgrupacionesShow(Sender: TObject);
begin
  DataModule.AbrirAgrupaciones;
  ControlEdit := CEAgrupaciones;

  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMClientes.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMClientes.MIEtiquetasClick(Sender: TObject);
begin
  TFPregEtiCliente.Create(Self).Muestra(DataModule.Cliente, 'CLI');
end;

// Mantenimiento de Etiquetas de Clientes
procedure TFMClientes.TSVacacionesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEVacaciones;
end;

procedure TFMClientes.FormActivate(Sender: TObject);
begin
  inherited;
  if not Primera then
     if not REntorno.DatosAbiertos then
        if (DataModule.BusquedaCompleja in [mrOk, mrAll]) then
           SWFil := 1;

  Primera := True;
  if FMain.EnlaceCrea then
     Tercero_a_Cliente(DMMain.MinTercero);

  if (LeeParametro('CLIRIES002') = 'S') then
     NavRiesgos.VisibleButtons := [nbRefresh];

  // Visibilizamos pestañas FacturaElectronica por pais
  // Primero establecemos cual está activa para que al invisibilizar el resto no falle.
  if (REntorno.Pais = 'ESP') then
     PCPaisFacturaElectronica.ActivePage := TSEspana
  else
  if (REntorno.Pais = 'CHL') then
     PCPaisFacturaElectronica.ActivePage := TSChile;

  TSEspana.TabVisible := (REntorno.Pais = 'ESP');
  TSChile.TabVisible := (REntorno.Pais = 'CHL');

  // Deshabilito para que funcione el doble click sobre estos campos para asignar agrupacion
  DBEAgDentro.Enabled := False;
  DBEAgTitDentro.Enabled := False;
  DBEAgCodDisp.Enabled := False;
  DBEAgTitDisp.Enabled := False;
end;

procedure TFMClientes.Tercero_a_Cliente(Tercero: integer);
begin
  {dji lrk kri - Nro ultimo cliente NCO}
  if (DMMain.EstadoKri(19) = 1) then
  begin
     ButUltimoCte.Visible := True;
     ButUltimoCte.Enabled := True;
  end
  else
  begin
     ButUltimoCte.Visible := False;
     ButUltimoCte.Enabled := False;
  end;

  DataModule.CambiarTercero(Tercero);

  if (REntorno.Cliente_aut) then
     DBEFTipoCliente.SetFocus
  else
     DBECliente.SetFocus;
end;

procedure TFMClientes.Potencial_a_Cliente(ClientePotencial, Tercero: integer);
begin
  {dji lrk kri - Nro ultimo cliente NCO}
  if (DMMain.EstadoKri(19) = 1) then
  begin
     ButUltimoCte.Visible := True;
     ButUltimoCte.Enabled := True;
  end
  else
  begin
     ButUltimoCte.Visible := False;
     ButUltimoCte.Enabled := False;
  end;
  DataModule.ImportaClientePotencial(ClientePotencial, Tercero);
end;

procedure TFMClientes.DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBECuenta);
end;

procedure TFMClientes.HabilitarPunto;
begin
  FMain.AddComponentePunto(DBECuenta);
  FMain.AddComponentePunto(DBEFCuentaDtoPP);
  FMain.AddComponentePunto(EFCtaDtoCial);
  FMain.AddComponentePunto(DBEFCuentaIRPF);
  FMain.AddComponentePunto(DBEFCuentaCompra);
  FMain.AddComponentePunto(DBEFCuentaVenta);
end;

procedure TFMClientes.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(EFCtaDtoCial);
  FMain.DelComponentePunto(DBEFCuentaDtoPP);
  FMain.DelComponentePunto(DBEFCuentaIRPF);
  FMain.DelComponentePunto(DBECuenta);
  FMain.DelComponentePunto(DBEFCuentaCompra);
  FMain.DelComponentePunto(DBEFCuentaVenta);
end;

procedure TFMClientes.ANewTerceroExecute(Sender: TObject);
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

     DBEFTarifa.SetFocus;

     FMain.EnlaceModal := aEnlaceModal;
     FMain.EnlaceInstancias := aEnlaceInstancias;
     FMain.EnlaceCrea := aEnlaceCrea;
  end;
end;

procedure TFMClientes.ANewAgenteExecute(Sender: TObject);
var
  aEnlaceModal : boolean;
  aEnlaceInstancias : boolean;
  aEnlaceCrea : boolean;
begin
  if EstructuraCreada then
  begin
     aEnlaceModal := FMain.EnlaceModal;
     aEnlaceInstancias := FMain.EnlaceInstancias;
     aEnlaceCrea := FMain.EnlaceCrea;

     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AAgentes);

     if FMain.EnlaceDatos <> Null then
        DBEFAgente.SetBufferText(FMain.EnlaceDatos);

     DBEFTarifa.SetFocus;

     FMain.EnlaceModal := aEnlaceModal;
     FMain.EnlaceInstancias := aEnlaceInstancias;
     FMain.EnlaceCrea := aEnlaceCrea;
  end;
end;

procedure TFMClientes.ATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if DBEFTercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBEFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DataModule.QMClientesTERCERO.AsInteger));
end;

procedure TFMClientes.SBATerceroDblClick(Sender: TObject);
begin
  ATercero.Execute;
end;

procedure TFMClientes.HabilitaEnlaces;
begin
  if (FMain.ATerceros.Enabled = False) then
  begin
     DBEFTercero.Accion := nil;
     SBATercero.Width := 0;
     MIVerDatosTercero.Visible := False;
     DBETituloTercero.Color := clInfoBk;
     TbuttComp.Visible := False;
     TSepTerc.Visible := False;
  end
  else
  begin
     SolapaControles(SBATercero, DBETituloTercero);
     DBETituloTercero.Color := REntorno.ColorEnlaceActivo;
     TbuttComp.Visible := True;
     TSepTerc.Visible := True;
  end;

  if (FMain.AAgentes.Enabled = False) then
  begin
     DBEFAgente.Accion := nil;
     SBAAgente.Width := 0;
     MIVerDatosAgente.Visible := False;
     ETituloAgente.Color := clInfoBk;
  end
  else
  begin
     SolapaControles(SBAAgente, ETituloAgente);
     ETituloAgente.Color := REntorno.ColorEnlaceActivo;
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

  if ((FMain.ATerceros.Enabled = False) and (FMain.AAgentes.Enabled = False)) then
     MISepEnlaces.Visible := False;

  SolapaControles(SBPedPend, LFDEPedPendLIQUIDO);
  LFDEPedPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAlbPend, LFDEAlbPendLIQUIDO);
  LFDEAlbPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBFacPend, LFDEFactPendLIQUIDO);
  LFDEFactPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBFacCob, LFDEFactCobLIQUIDO);
  LFDEFactCobLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerRecImp, LFDERecImpagadosIMPORTE);
  LFDERecImpagadosIMPORTE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerRecPenCob, LFDERecNoCobradosIMPORTE);
  LFDERecNoCobradosIMPORTE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerRecPenRec, LFDERecPendIMPORTE);
  LFDERecPendIMPORTE.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMClientes.AAAgenteExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFAgente.Text <> '' then
           FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + DBEFAgente.Text +
              ' AND EJERCICIO = ' + IntToStr(DataModule.QMClientesEJERCICIO.AsInteger));
     end
     else
        FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' +
           IntToStr(DataModule.QMClientesAGENTE.AsInteger) + ' AND EJERCICIO = ' +
           IntToStr(DataModule.QMClientesEJERCICIO.AsInteger));
end;

procedure TFMClientes.SBAAgenteDblClick(Sender: TObject);
begin
  AAAgente.Execute;
end;

procedure TFMClientes.ETituloAgenteEnter(Sender: TObject);
begin
  if (DBEFAgente.Enabled) then
     DBEFAgente.SetFocus;
end;

procedure TFMClientes.DBETituloTerceroEnter(Sender: TObject);
begin
  if DBEFTercero.Enabled then
     DBEFTercero.SetFocus
  else
     DBEFAgente.SetFocus;
end;

procedure TFMClientes.TSFiltrosShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFiltros;
  DataModule.AbrirDatosFacturacion;
end;

procedure TFMClientes.DBEFTransportistaChange(Sender: TObject);
begin
  ETituloTransportista.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportista.Text, 0));
end;

procedure TFMClientes.TSRiesgosShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CERiesgos;
  DataModule.MuestraRiesgos;
end;

procedure TFMClientes.AActualizarRiesgosExecute(Sender: TObject);
begin
  inherited;
  DataModule.ActRiesgoEmpresa;
end;

procedure TFMClientes.AEtiquetasClienteExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMEtiqCli, FMEtiqCli, Sender);
end;

procedure TFMClientes.AVisualizarDatosClientesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMClientes.AImprimirDatosClientesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMClientes.AVisualizarDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(0);
end;

procedure TFMClientes.AClientesporAgrupacionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMlstClientes, DMLstClientes);
  TFPregAgrupacionCli.Create(Self);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AVisualizarListadoDireccionesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(2);
end;

procedure TFMClientes.AListadoDireccionesCPExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFPregCPostal.Create(Self).Muestra('CLI');
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AImprimirListadoDireccionesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(3);
end;

procedure TFMClientes.TSVentasShow(Sender: TObject);
begin
  inherited;
  DBGVentasDocumento.DataSource := DataModule.DSxVentas;
  DBGVentasDetalle.DataSource := DataModule.DSxVentasDetalle;
  DBGVentasMargenes.DataSource := DataModule.DSxVentasMargenes;
  NavVentas.DataSource := DataModule.DSxVentas;
end;

procedure TFMClientes.TSVentasHide(Sender: TObject);
begin
  inherited;
  DataModule.xVentas.Close;
  DataModule.xVentasDetalle.Close;
  DataModule.xVentasMargenes.Close;
end;

procedure TFMClientes.TSPreciosShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirPrecios;
end;

procedure TFMClientes.AEtiquetasExecute(Sender: TObject);
begin
  inherited;
  TFPregEtiCliente.Create(Self).Muestra(DataModule.Cliente, 'CLI');
end;

procedure TFMClientes.AVentasDetalladasExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasCliente.Create(Self).Muestra(DBECliente.Text);
end;

procedure TFMClientes.AFiltradoAgrupExecute(Sender: TObject);
begin
  inherited;
  FFiltra_clientes_agr := TFFiltra_clientes_agr.Create(Self);
  if (FFiltra_clientes_agr.ShowModal = mrOk) then
     DataModule.FiltraSeleccion;
end;

procedure TFMClientes.AVentaArticulosCliExecute(Sender: TObject);
begin
  inherited;
  DataModule.VentasCliente;
end;

procedure TFMClientes.AActualizaVacacionesExecute(Sender: TObject);
begin
  inherited;
  DataModule.ActualizaVacaciones;
end;

procedure TFMClientes.AActualizaRiesgoClienteExecute(Sender: TObject);
begin
  inherited;
  DataModule.ActRiesgoCliente(DataModule.QMClientesCLIENTE.AsInteger);
  DataModule.QMClientes.Refresh;
end;

procedure TFMClientes.AImprimirDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(1);
end;

procedure TFMClientes.AConfClientesFiscalExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(8, formato, cabecera, copias, pijama, '',
     DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AConfAgrupClientesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(16, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AConfDireccionesCliExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(17, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AConfDireccionesCliCPExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(81, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AConfEtiquetasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(59, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.AConfVentasDetalladasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstVentasCliente, DMLstVentasCliente);
  TFMListConfig.Create(Self).Muestra(140, formato, cabecera, copias,
     pijama, '', DMLstVentasCliente.frHYVentasClientes);
  CierraData(DMLstVentasCliente);
end;

procedure TFMClientes.ButUltimoCteClick(Sender: TObject);
var
  Cliente : integer;
begin
  inherited;
  Cliente := (StrToInt(DBECliente.Text) + 1) * 10000;
  with DataModule.xBuscoMaxCte do
  begin
     if not Transaction.InTransaction then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     ExecQuery;
     if (FieldByName['MAX'].AsInteger / 10000) < (Cliente / 10000 - 1) then
        DataModule.QMClientesCLIENTE.Value := (StrToInt(DBECliente.Text)) * 10000
     else
        DataModule.QMClientesCLIENTE.Value := (FieldByName['MAX'].AsInteger) + 1;
     Transaction.CommitRetaining;
     //FreeHandle;
  end;
end;

procedure TFMClientes.TButtInfoComercialKriClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMInformacionComercial, FMInformacionComercial);
  FMInformacionComercial.Muestra(DataModule.QMClientesCLIENTE.AsInteger);
end;

procedure TFMClientes.AAgenteExecute(Sender: TObject);
begin
  inherited;
  AAAgente.Execute;
end;

procedure TFMClientes.AVentasAgenteClienteMesExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasClienteAge.Create(Self).Muestra(DBECliente.Text);
end;

procedure TFMClientes.AConfVentasAgenteClienteMesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstVentasCliAge, DMLstVentasCliAge);
  TFMListConfig.Create(Self).Muestra(159, Formato, Cabecera, Copias,
     Pijama, '', DMLstVentasCliAge.frHYVentasClientesAgentes);
  CierraData(DMLstVentasCliAge);
end;

procedure TFMClientes.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMClientes.ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = VK_RETURN then
     ExpandirCadenaCta(Sender);
end;

procedure TFMClientes.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMClientes.AClienteCuotaExecute(Sender: TObject);
begin
  TFMClienteCuotas.Create(Self).Muestra(DataModule.QMClientesCLIENTE.AsInteger);
end;

procedure TFMClientes.AIncidenciasExecute(Sender: TObject);
begin
  with DataModule do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMClientesCLIENTE.AsInteger,
        QMClientesTERCERO.AsInteger, 0, 0, 1);
  end;
end;

procedure TFMClientes.DBGIncidenciasDblClick(Sender: TObject);
begin
  with DataModule do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMClientesCLIENTE.AsInteger,
        QMClientesTERCERO.AsInteger, 0, xIncidenciasINCIDENCIA.AsInteger, 1);
  end;
end;

procedure TFMClientes.DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DataModule.HayDetalle(1) then
  begin
     if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
        CeldaEnlace(DBGIncidencias, Rect);
  end;
end;

procedure TFMClientes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;

  DataModule.QuitaFiltros;
  G2KTableLoc.Click;
  if (PCMain.ActivePage = TSFacturaElectronica) then
     DataModule.AbreFacturaElectronica;

  RefrescaPestanyaActiva;
end;

procedure TFMClientes.AEtiquetasFiltradosExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(4);
end;

procedure TFMClientes.AConfEtiquetasFiltradosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(2059, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.EFClienteChange(Sender: TObject);
begin
  inherited;

  DataModule.FiltraCliente(StrToIntDef(EFCliente.Text, 0));
  NavMainClickAfterAdjust(Sender, nbRefresh);
  if (PCMain.ActivePage = TSFacturaElectronica) then
     DataModule.AbreFacturaElectronica;

  RefrescaPestanyaActiva;
end;

procedure TFMClientes.DBEFPortesChange(Sender: TObject);
var
  Portes : integer;
begin
  inherited;
  Portes := StrToIntDef(DBEFPortes.Text, -1);
  ETituloPortes.Text := DameTituloPorte(Portes);

  // Hacemos visibles los campos adecuados
  DBEPorPortes.Visible := (Portes < 5);
  LBPorPortes.Visible := (Portes < 5);
  DBEIPortes.Visible := (Portes < 5);
  LBIPortes.Visible := (Portes < 5);
  LBRangos.Visible := not (Portes < 5);
  DBEFRango.Visible := not (Portes < 5);
  DBETituloRango.Visible := not (Portes < 5);
  LBIndice.Visible := not (Portes < 5);
  DBEFIndice.Visible := not (Portes < 5);
  DBETituloIndice.Visible := not (Portes < 5);

  if ((Assigned(DBEFPortes.Field)) and (DBEFPortes.Text <> '')) then
  begin
     if (Portes <= 2) then
     begin
        if Assigned(DBEPorPortes.Field) then
           DBEPorPortes.Field.Value := 0;
        ColorInfo(DBEPorPortes);
        DBEPorPortes.Enabled := False;
        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;

        if Assigned(DBEIPortes.Field) then
           DBEIPortes.Field.Value := 0;
        ColorInfo(DBEIPortes);
        DBEIPortes.Color := clInfoBk;
        DBEIPortes.Enabled := False;
        DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
     end
     else
     if (Portes = 3) then
     begin
        DBEPorPortes.Color := clWindow;
        ColorEdicion(DBEPorPortes);
        DBEPorPortes.Enabled := True;
        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
        ColorInfo(DBEIPortes);
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
     if (Portes = 4) then
     begin
        ColorInfo(DBEPorPortes);
        DBEPorPortes.Enabled := False;
        DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
        ColorEdicion(DBEIPortes);
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
     end
     else
     if ((Portes = 5) or (Portes = 6)) then
     begin
        if Assigned(DBEPorPortes.Field) then
           DBEPorPortes.Field.Value := 0;
        if Assigned(DBEIPortes.Field) then
           DBEIPortes.Field.Value := 0;
     end;
  end;
end;

procedure TFMClientes.DBEFRangoChange(Sender: TObject);
begin
  inherited;
  if ((Assigned(DBEFRango.Field)) and (DBEFRango.Text <> '')) then
  begin
     DBEFIndice.Enabled := (DataModule.ExisteRango(StrToInt(DBEFRango.Text)));
     DBEFIndice.ReadOnly := not DBEFIndice.Enabled;
  end;
end;

procedure TFMClientes.DBEFIndiceBusqueda(Sender: TObject);
begin
  inherited;
  DBEFIndice.CondicionBusqueda := ' RANGO=' + IntToStr(StrToIntDef(DBEFRango.Text, 0));
end;

procedure TFMClientes.DBEFRangoBusqueda(Sender: TObject);
var
  Str : string;
var
  Portes : integer;
begin
  inherited;
  Portes := StrToIntDef(DBEFPortes.Text, -1);
  if (Portes in [5, 6, 7]) then
  begin
     if (Portes = 5) then // rateo por pesos
        Str := ' TIPO=1';
     if (Portes = 6) then // rateo por importes
        Str := ' TIPO=2';
     if (Portes = 7) then // rateo por bultos
        Str := ' TIPO=3';
     DBEFRango.CondicionBusqueda := Str;
  end;
end;

procedure TFMClientes.TSEstadisticasShow(Sender: TObject);
begin
  inherited;
  LFPCEstadisticas.ActivePage := TSDocumentos;

  DataModule.MuestraDocumentos;

  // Moneda
  LFERiesgosRecPend.Text := REntorno.MonedaEmpresa;
  LFERiesgosRecNoCob.Text := REntorno.MonedaEmpresa;
  LFERiesgosRecImp.Text := REntorno.MonedaEmpresa;
  LFEAnticipo.Text := REntorno.MonedaEmpresa;
  LFEPPRecibir.Text := REntorno.MonedaEmpresa;
  LFEPPCobrar.Text := REntorno.MonedaEmpresa;
  LFEPresupPend.Text := REntorno.MonedaEmpresa;
  LFEPresupAcept.Text := REntorno.MonedaEmpresa;
  LFEPresupDeni.Text := REntorno.MonedaEmpresa;
  LFEPedPend.Text := REntorno.MonedaEmpresa;
  LFEAlbPend.Text := REntorno.MonedaEmpresa;
  LFEFactPend.Text := REntorno.MonedaEmpresa;
  LFEFactCob.Text := REntorno.MonedaEmpresa;
end;

procedure TFMClientes.AMuestraImpagadosExecute(Sender: TObject);
begin
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.EFCliDesde.Text := DataModule.DameCuentaPendiente;
  FMain.EjecutaAccion(FMRecibosPendientes.AMostrarImpagados);
end;

procedure TFMClientes.ARecibosPendCobExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.FiltraClientes(REntorno.Empresa, REntorno.Canal,
     0, DataModule.DameCuentaPendiente);
end;

procedure TFMClientes.APedPendExecute(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  Filtro := 'EMPRESA=' + IntToStr(REntorno.Empresa) +
     ' AND CANAL=' + IntToStr(REntorno.Canal) +
     ' AND CLIENTE=' + IntToStr(DataModule.DameCliente) +
     ' AND ESTADO=0 AND TIPO=''PEC''';
  FMain.EjecutaAccion(FMain.APedidosPendientes, Filtro);
end;

procedure TFMClientes.AAlbPendExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'EMPRESA=' + IntToStr(REntorno.Empresa) +
     ' AND CANAL=' + IntToStr(REntorno.Canal) +
     ' AND CLIENTE=' + IntToStr(DataModule.DameCliente) +
     ' AND ESTADO=0 AND TIPO=''ALB''';
  FMain.EjecutaAccion(FMain.AAlbaranesPendientes, Filtro);
end;

procedure TFMClientes.AFacPendExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'EMPRESA=' + IntToStr(REntorno.Empresa) +
     ' AND CANAL=' + IntToStr(REntorno.Canal) +
     ' AND CLIENTE=' + IntToStr(DataModule.DameCliente) +
     ' AND ESTADO=0 AND TIPO=''FAC''';
  FMain.EjecutaAccion(FMain.AFiltroFacturas, Filtro);
end;

procedure TFMClientes.AFacCobExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'EMPRESA=' + IntToStr(REntorno.Empresa) +
     ' AND CANAL=' + IntToStr(REntorno.Canal) +
     ' AND CLIENTE=' + IntToStr(DataModule.DameCliente) +
     ' AND ESTADO=5 AND TIPO=''FAC'' AND SERIE=''' + REntorno.Serie + '''' +
     ' AND EJERCICIO=' + IntToStr(REntorno.Ejercicio);
  FMain.EjecutaAccion(FMain.AFiltroFacturas, Filtro);
end;

procedure TFMClientes.ACalculaEstadisticasExecute(Sender: TObject);
begin
  inherited;
  // Ajustando valores iniciales
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

  DataModule.CargaEstadisticas(StrToInt(EEjercicio.Text),
     StrToInt(EEjercicio2.Text), Copy(CBMonedas.Text, 1, Pos(' ', CBMonedas.Text) - 1), StrToFloat(EPorcentajeEstimacion.Text), CBTipoDoc.Text);
end;

procedure TFMClientes.AMultiSeleccionExecute(Sender: TObject);
begin
  inherited;
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFMClientes.TSEstadisticasHide(Sender: TObject);
begin
  inherited;
  DataModule.CierraDocumentos;
  DataModule.CierraEstadisticas;
end;

procedure TFMClientes.DBCAnualDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(0);
end;

procedure TFMClientes.DBCMensualDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(1);
end;

procedure TFMClientes.DBCPrevisionDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(2);
end;

procedure TFMClientes.MuestraGrafico(Tipo: integer);
begin
  TipoGrafica := Tipo;
  FGrafico := TFGrafico.Create(Self);
  try
     // Posicion de la ventana
     FGrafico.Left := Self.Left;
     FGrafico.Top := Self.Top;

     FGrafico.Formulario := 1;
     FGrafico.Tipo := Tipo;
     FGrafico.Tercero := StrToInt(DBECliente.Text);
     FGrafico.Ejercicio := StrToInt(EEjercicio.Text);
     FGrafico.Ejercicio2 := StrToInt(EEjercicio2.Text);
     FGrafico.Porcent := StrToFloat(EPorcentajeEstimacion.Text);
     FGrafico.Moneda := Copy(CBMonedas.Text, 1, Pos(' ', CBMonedas.Text) - 1);

     FGrafico.ShowModal;
  finally
     FGrafico.Free;
  end;
end;

procedure TFMClientes.ARecibosPendRecExecute(Sender: TObject);
begin
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.FiltraClientes(REntorno.Empresa, REntorno.Canal,
     1, DataModule.DameCuentaPendiente);
end;

procedure TFMClientes.BBMultiSelectClick(Sender: TObject);
begin
  inherited;
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFMClientes.AFacturasClienteExecute(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;
  FMain.EjecutaAccion(FMain.AFacturas);
  FMFacturas.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, TAction(Sender).Tag);
end;

procedure TFMClientes.AAlbaranesClienteExecute(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;
  FMain.EjecutaAccion(FMain.AAlbaranes);
  FMAlbaranes.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, TAction(Sender).Tag);
end;

procedure TFMClientes.APedidosClienteExecute(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;

  FMain.EjecutaAccion(FMain.APedidos);
  FMPedidos.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, TAction(Sender).Tag);
end;

procedure TFMClientes.AOfertasClienteExecute(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;

  FMain.EjecutaAccion(FMain.AOfertas);
  FMOfertas.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, TAction(Sender).Tag);
end;

procedure TFMClientes.LNombCom_SocialClick(Sender: TObject);
begin
  inherited;
  if (LNombCom_Social.Caption <> _('Nombre Comercial') + ' ') then
  begin
     LNombCom_Social.Caption := _('Nombre Comercial') + ' ';
     EFCliente.CampoStr := 'NOMBRE_COMERCIAL';
  end
  else
  begin
     LNombCom_Social.Caption := _('Razón Social') + ' ';
     EFCliente.CampoStr := 'TITULO';
  end;
end;

procedure TFMClientes.NavRiesgosClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbRefresh then
     DataModule.MuestraRiesgos;
end;

procedure TFMClientes.DBGPreciosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Colorear : boolean;
begin
  inherited;

  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        Colorear := False;
        {(UpperCase(Column.FieldName) = 'ARTICULO') ) then}
        if (DataModule.QMPreciosTIPO.AsString = 'CCA') then
           Colorear := ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'ARTICULO'));
        if (DataModule.QMPreciosTIPO.AsString = 'CCF') then
           Colorear := ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'FAMILIA'));
        if (DataModule.QMPreciosTIPO.AsString = 'CAA') then
           Colorear := ((UpperCase(Column.FieldName) = 'AGRUPACION') or (UpperCase(Column.FieldName) = 'ARTICULO'));
        if (DataModule.QMPreciosTIPO.AsString = 'CAF') then
           Colorear := ((UpperCase(Column.FieldName) = 'AGRUPACION') or (UpperCase(Column.FieldName) = 'FAMILIA'));
        if (DataModule.QMPreciosTIPO.AsString = 'CPA') then
           Colorear := ((UpperCase(Column.FieldName) = 'PERFIL') or (UpperCase(Column.FieldName) = 'ARTICULO'));
        if (DataModule.QMPreciosTIPO.AsString = 'CPF') then
           Colorear := ((UpperCase(Column.FieldName) = 'PERFIL') or (UpperCase(Column.FieldName) = 'FAMILIA'));
        if (DataModule.QMPreciosTIPO.AsString = 'CAR') then
           Colorear := (UpperCase(Column.FieldName) = 'ARTICULO');
        if (DataModule.QMPreciosTIPO.AsString = 'CFA') then
           Colorear := (UpperCase(Column.FieldName) = 'FAMILIA');
        if (DataModule.QMPreciosTIPO.AsString = 'CAG') then
           Colorear := (UpperCase(Column.FieldName) = 'AGRUPACION');
        if (DataModule.QMPreciosTIPO.AsString = 'CPE') then
           Colorear := (UpperCase(Column.FieldName) = 'PERFIL');

        if (Colorear) then
           ColorInactivo(Canvas)
        else
        begin
           if ((UpperCase(Column.FieldName) = 'ALTA') or (UpperCase(Column.FieldName) = 'BAJA')) then
           begin
              if (DataModule.QMPreciosACTIVO.AsInteger = 0) then
                 ColorBloqueado(Canvas)
              else
              if ((DataModule.QMPreciosALTA.AsDateTime < Now) and (DataModule.QMPreciosBAJA.AsDateTime >= Today)) then
                 ColorResaltado2(Canvas)
              else
                 ColorBloqueado(Canvas);
           end
           else
              ColorInfo(Canvas);
        end;
     end;
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMClientes.TSComunicacionesShow(Sender: TObject);
begin
  inherited;
  DataModule.xComunicaciones.Open;
end;

procedure TFMClientes.TSComunicacionesHide(Sender: TObject);
begin
  inherited;
  DataModule.xComunicaciones.Close;
end;

procedure TFMClientes.EFComunicacionesBusquedaBusqueda(Sender: TObject);
begin
  inherited;
  EFComunicacionesBusqueda.CondicionBusqueda := 'TIPO=''CLI'' AND COD_CLI_PRO=' + DataModule.QMClientesCLIENTE.AsString;
end;

procedure TFMClientes.EFComunicacionesBusquedaChange(Sender: TObject);
begin
  inherited;
  Refrescar(DataModule.xComunicaciones, 'ID', StrToIntDef(EFComunicacionesBusqueda.Text, 0));
end;

procedure TFMClientes.DBGCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMClientes.DBGComunicacionesDblClick(Sender: TObject);
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
           DMMain.AbrirArchivo(DMMain.DameDirectorioCodCliPro('CLI', DataModule.xComunicacionesCOD_CLI_PRO.AsInteger) + DataModule.xComunicacionesARCHIVO.AsString);
     end;
  end;
end;

procedure TFMClientes.DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (DataModule.xComunicaciones.RecordCount > 0) then
     if (UpperCase(Column.FieldName) = 'ARCHIVO') then
        CeldaEnlace(DBGComunicaciones, Rect);
end;

procedure TFMClientes.NavComunicacionesChangeState(Sender: TObject);
begin
  inherited;
  with DBGComunicaciones do
  begin
     ColumnaInicial := 0;
     while ((ColumnaInicial <= Columns.Count - 1) and (Columns[ColumnaInicial].FieldName = 'DESCRIPCION')) do
        ColumnaInicial := ColumnaInicial + 1;
  end;
end;

procedure TFMClientes.AEnviarComunicacionXMailExecute(Sender: TObject);
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
           try
              CuerpoMail.Add('Este correo ha sido enviado desde :');
              CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
              CuerpoMail.Add('');
              CuerpoMail.Add('y contiene el fichero adjunto ' + UpperCase(DataModule.xComunicacionesARCHIVO.AsString));
              CuerpoMail.Add('------------------------------------------------------------');
              CuerpoMail.Add('This is an automatic message send from :');
              CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
              CuerpoMail.Add('');
              CuerpoMail.Add('We attached the file ' + UpperCase(DataModule.xComunicacionesARCHIVO.AsString));

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              DMListados.SendMailClientePDF(DataModule.xComunicacionesCOD_CLI_PRO.AsInteger, CuerpoMail,
                 DMMain.DameDirectorioCodCliPro('CLI', DataModule.xComunicacionesCOD_CLI_PRO.AsInteger) + DataModule.xComunicacionesARCHIVO.AsString, DataModule.xComunicacionesARCHIVO.AsString, Subject, 'CLI', DameIDCliente(DataModule.xComunicacionesCOD_CLI_PRO.AsInteger));
           finally
              CuerpoMail.Free;
           end;

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
  Application.ProcessMessages;
end;

procedure TFMClientes.AImportarArchivoComunicacionExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'PDF,DOC,XLS,ODT,ODS,TXT', '', 'FMClientes') then
  begin
     if CopyFileTo(Archivo, DMMain.DameDirectorioCodCliPro('CLI', DataModule.QMClientesCLIENTE.AsInteger) + ExtractFileName(Archivo)) then
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

procedure TFMClientes.PMPlantillasComunicacionesItemOnClick(Sender: TObject);
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

procedure TFMClientes.EFDireccionIncidenciaBusqueda(Sender: TObject);
begin
  inherited;
  EFDireccionIncidencia.CondicionBusqueda := 'TERCERO=' + IntToStr(DataModule.QMClientesTERCERO.AsInteger);
end;

procedure TFMClientes.EFDireccionIncidenciaChange(Sender: TObject);
begin
  inherited;
  with (DataModule.xIncidencias) do
  begin
     DisableControls;
     try
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_INCIDENCIAS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' COD_CLI_PRO = ?CLIENTE AND ');
        SelectSQL.Add(' TIPO_TERCERO = ''CLI'' ');
        if (StrToIntDef(EFDireccionIncidencia.Text, 0) <> 0) then
           SelectSQL.Add(' AND DIRECCION = ' + EFDireccionIncidencia.Text);
        SelectSQL.Add(' ORDER BY INCIDENCIA ');
        Open;
     finally
        EnableControls;
     end;
  end;
  EDireccionIncidencia.Text := DameDireccionTercero(DataModule.QMClientesTERCERO.AsInteger, StrToIntDef(EFDireccionIncidencia.Text, 0));
end;

procedure TFMClientes.DBEFZonaChange(Sender: TObject);
begin
  inherited;
  ETituloZona.Text := DameTituloZona(DBEFZona.Text);
end;

procedure TFMClientes.TSIncidenciasShow(Sender: TObject);
begin
  inherited;
  DBGIncidencias.DataSource := DataModule.DSxIncidencias;
  DataModule.xIncidencias.Open;
end;

procedure TFMClientes.TSIncidenciasHide(Sender: TObject);
begin
  inherited;
  DataModule.xIncidencias.Close;
end;

procedure TFMClientes.TSDescuentosShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirDescuentos;
end;

procedure TFMClientes.TButtLineaClick(Sender: TObject);
begin
  inherited;
  with DataModule.QMClientes do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           FMClientes.Caption := Format(_('Clientes - Modificando Notas del cliente: %d'), [DataModule.QMClientesCLIENTE.AsInteger]);
           Application.ProcessMessages;
           Edit;
           DBMMNotas.Field.AsString := AnsiReplaceStr(DBMMNotas.Field.AsString, '%13%', #13);
           {for i := 0 to DBMMNotas.Lines.Count -1 do
            DBMMNotas.Lines[i] := Trim(DBMMNotas.Lines[i]);}
           Post;
           Next;
        end;
     finally
        EnableControls;
     end;
  end;
  FMClientes.Caption := _('Clientes');
end;

procedure TFMClientes.AAdjuntosClienteExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('CLI', DameIDCliente(DataModule.QMClientesCLIENTE.AsInteger));
end;

procedure TFMClientes.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DataModule.QMClientesTERCERO.AsInteger);
end;

procedure TFMClientes.AAdjuntosAgenteExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('AGE', DameIDAgente(DataModule.QMClientesAGENTE.AsInteger));
end;

procedure TFMClientes.AAdjuntosTransportistaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DataModule.QMClientesTRANSPORTISTA.AsInteger));
end;

procedure TFMClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
end;

procedure TFMClientes.DBEFProtocoloChange(Sender: TObject);
begin
  inherited;
  EProtocolo.Text := DameTituloProtocolo(DBEFProtocolo.Text);
end;

procedure TFMClientes.NavPreciosProtocoloClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if (Button = nbEdit) then
  begin
     old_Protocolo := DataModule.QMClientesPROTOCOLO.AsString;
     PNLPreciosProtocolo.Enabled := True;
  end;
end;

procedure TFMClientes.NavPreciosProtocoloClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbPost) then
  begin
     if (old_Protocolo <> DataModule.QMClientesPROTOCOLO.AsString) then
     begin
        if (Application.MessageBox(PChar(string(_('Regenerar las condiciones de venta con este protocolo?'))),
           PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
           DataModule.RegenerarCondicionesSegunProtocolo;
     end;
     PNLPreciosProtocolo.Enabled := False;
  end;
end;

procedure TFMClientes.DBCBBloqueoChange(Sender: TObject);
begin
  inherited;
  if DBCBBloqueo.Value = '0' then
  begin
     DBEMotivoBloqueo.Enabled := False;
     DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;
     ColorInfo(DBEMotivoBloqueo);
  end
  else
  begin
     DBEMotivoBloqueo.Enabled := True;
     DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;
     ColorEdicion(DBEMotivoBloqueo);
  end;
end;

procedure TFMClientes.DBEFCodigoIncotermChange(Sender: TObject);
begin
  inherited;
  ECodigoIncoterm.Text := DameTituloCodigoIncoterm(DataModule.QMClientesCODIGO_INCOTERM.AsString);
end;

procedure TFMClientes.DBEDireccionDefectoBusqueda(Sender: TObject);
begin
  inherited;
  DBEDireccionDefecto.CondicionBusqueda := ' TERCERO = ' + IntToStr(DataModule.QMClientesTERCERO.AsInteger);
end;

procedure TFMClientes.DBERiesgoPendienteChange(Sender: TObject);
begin
  inherited;
  {Si el riesgo se supera, lo pongo en rojo}
  if (DBERiesgoPendiente.DataSource.DataSet.FindField(DBERiesgoPendiente.DataField).AsFloat < 0) then
  begin
     ColorError(DBERiesgoPendiente);
     ColorError(EDTRiesgoPenEmp);
  end
  else
  begin
     ColorInfo(DBERiesgoPendiente);
     ColorInfo(EDTRiesgoPenEmp);
  end;
end;

procedure TFMClientes.ALstConsumoExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMLstConsumo, FMLstConsumo);
end;

procedure TFMClientes.AContLstConsumExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(10002, Formato, Cabecera, Copias,
     Pijama, '', DMLstClientes.frLstConsumo);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.DBCHKBajaChange(Sender: TObject);
begin
  inherited;
  DBDTPFechaBaja.Visible := DBCHKBaja.Checked;
  DBEMotivoBaja.Visible := DBCHKBaja.Checked;
  LMotivoBaja.Visible := DBCHKBaja.Checked;
end;

procedure TFMClientes.AListadoCuotasExecute(Sender: TObject);
begin
  inherited;
  TFPregCuotasCliente.Create(Self).Muestra(DataModule.QMClientesCLIENTE.AsInteger);
end;

procedure TFMClientes.AConfListadoCuotasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCuotasCliente, DMLstCuotasCliente);
  TFMListConfig.Create(Self).Muestra(191, Formato, Cabecera, Copias,
     Pijama, '', DMLstCuotasCliente.frCuotas);
  CierraData(DMLstCuotasCliente);
end;

procedure TFMClientes.DBEFCuentaDtoPPChange(Sender: TObject);
begin
  inherited;
  ETitCtaDtoPP.Text := DameTituloCuenta(DBEFCuentaDtoPP.Text);
end;

procedure TFMClientes.EFCtaDtoCialChange(Sender: TObject);
begin
  inherited;
  ECtaDtoCial.Text := DameTituloCuenta(EFCtaDtoCial.Text);
end;

procedure TFMClientes.DBEFCuentaVentaChange(Sender: TObject);
begin
  inherited;
  ETitCtaVenta.Text := DameTituloCuenta(DBEFCuentaVenta.Text);
end;

procedure TFMClientes.DBEFCuentaCompraChange(Sender: TObject);
begin
  inherited;
  ETitCtaCompra.Text := DameTituloCuenta(DBEFCuentaCompra.Text);
end;

procedure TFMClientes.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del cliente %d - %s'), [DataModule.QMClientesCLIENTE.AsInteger, DataModule.QMClientesTITULO.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.Add(_('Notas'));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMMNotas.Lines);
     s.Add('');
     s.Add(_('Notas de Facturación'));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMNotasFacturacion.Lines);
     s.Add('----------------------------------------------------------------------');
     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMClientes.DBGIsoDblClick(Sender: TObject);
begin
  inherited;
  if DataModule.HayDetalle(2) then
     FMain.EjecutaAccion(FMain.AIsoMantInformes, 'CLIPRO=' + IntToStr(DataModule.QMClientesCLIENTE.AsInteger));
end;

procedure TFMClientes.TSIsoShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirIso;
end;

procedure TFMClientes.AClientesFacExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMVentasCliFec, FMVentasCliFec);
end;

procedure TFMClientes.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  ETituloIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMClientes.ExportarClientesFiltradosExecute(Sender: TObject);
begin
  inherited;
  DataModule.ExportarClientesFiltrados;
end;

procedure TFMClientes.AExportarDirCliFiltradosExecute(Sender: TObject);
begin
  inherited;
  DataModule.ExportarDirCliFiltrados;
end;

procedure TFMClientes.ADocumentosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(IntToStr(DameIDCliente(DataModule.QMClientesCLIENTE.AsInteger)), 'EMP_CLIENTES(ID_CLIENTE)', 'DELFOS', _('Ficheros de Cliente'));
end;

procedure TFMClientes.AsignaTarifa(Tarifa: string);
begin
  if (Assigned(DataModule)) then
  begin
     if (MessageDlg(Format(_('Va a modificar la tarifa de los clientes filtrados por la tarifa "%s". ¿Desea continuar?'), [Tarifa]),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        DataModule.AsignaTarifa(Tarifa);
  end;
end;

procedure TFMClientes.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSVentas) then
     FiltroVentasChange(Sender);
end;

procedure TFMClientes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSFacturaElectronica) then
     DataModule.CierraFacturaElectronica;
  if (PCMain.ActivePage = TSFiltros) then
     DataModule.CerrarDatosFacturacion;
  if (PCMain.ActivePage = TSConsumo) then
     DataModule.CerrarConsumos;
  if (PCMain.ActivePage = TSDescuentos) then
     DataModule.CerrarDescuentos;
  if (PCMain.ActivePage = TSPrecios) then
     DataModule.CerrarPrecios;
  if (PCMain.ActivePage = TSIso) then
     DataModule.CerrarIso;
  if (PCMain.ActivePage = TSAgrupaciones) then
     DataModule.CerrarAgrupaciones;
  if (PCMain.ActivePage = TSAvisos) then
     DataModule.CerrarAvisos;
  if (PCMain.ActivePage = TSArticulos) then
     DataModule.CerrarArticulos;
  if (PCMain.ActivePage = TSVentas) then
     DataModule.CerrarVentas;
  if (PCMain.ActivePage = TSRedesSociales) then
     DataModule.CerrarRedesSociales;
end;

procedure TFMClientes.TSFacturaElectronicaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CECentrosAdministrativos;
  DataModule.AbreFacturaElectronica;
end;

procedure TFMClientes.DBGCentrosAdministrativosFaclElectronicaESBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'SYS_ROLES_CENTRO_ADM') then
     begin
        CondicionBusqueda := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ROL';
     end
     else
     if (Trim(TablaABuscar) = 'VER_DIRECCIONES') then
     begin
        CondicionBusqueda := 'TERCERO = ' + DataModule.QMClientesTERCERO.AsString;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DIRECCION';
     end;
  end;
end;

procedure TFMClientes.DBEFBancoParaPagosChange(Sender: TObject);
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

procedure TFMClientes.TSGraficosShow(Sender: TObject);
begin
  inherited;
  if (CBTipoDoc.Text = '') then
     CBTipoDoc.ItemIndex := 0;
end;

procedure TFMClientes.DBEFClientePadreChange(Sender: TObject);
begin
  inherited;
  ETituloClientePadre.Text := DameTituloCliente(StrToIntDef(DBEFClientePadre.Text, 0));
end;

procedure TFMClientes.TSVentasDocumentosShow(Sender: TObject);
begin
  inherited;
  NavVentas.DataSource := DataModule.DSxVentas;
end;

procedure TFMClientes.TSVentasDetalleShow(Sender: TObject);
begin
  inherited;
  NavVentas.DataSource := DataModule.DSxVentasDetalle;
end;

procedure TFMClientes.DBGVentasDocumentoDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
  begin
     if (DataModule.xVentasCANAL.AsInteger = REntorno.Canal) then
        FMain.TraspasoDeDocumentosSalida(DataModule.xVentasID_S.AsInteger)
     else
        ShowMessage(_('El documento se encuentra en otro canal'));
  end;
end;

procedure TFMClientes.DBGVentasDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
  begin
     if (DataModule.xVentasDetalleCANAL.AsInteger = REntorno.Canal) then
        FMain.TraspasoDeDocumentosSalida(DataModule.xVentasDetalleID_S.AsInteger)
     else
        ShowMessage(_('El documento se encuentra en otro canal'));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DataModule.xVentasDetalleARTICULO.AsString + '''');
end;

procedure TFMClientes.DBGVentasDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMClientes.DBGVentasDocumentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMClientes.FiltroVentasChange(Sender: TObject);
begin
  inherited;
  FiltraVentas(CBCalculaMargenVenta.Checked);
end;

procedure TFMClientes.FiltraVentas(CalcularMargenes: boolean);
var
  TipoDocumento, Serie : string;
begin
  inherited;
  if (PCMain.ActivePage = TSVentas) then
  begin
     CBPendientes.Visible := ((CBTipoDocumento.Text = 'OFC') or (CBTipoDocumento.Text = 'PEC') or (CBTipoDocumento.Text = 'ALB'));

     if (CBSerieVenta.Text = _('Todas las Series')) then
        Serie := ' '
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSerieVenta.Items[CBSerieVenta.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;

     TipoDocumento := CBTipoDocumento.Text;
     if (CBTipoDocumento.ItemIndex <= 0) then
        TipoDocumento := 'ALL';
     DataModule.FiltraVentas(TipoDocumento, Serie, DEFechaVentasDesde.Date, DEFechaVentasHasta.Date, EFArticuloVentas.Text, Trim(EDescripcion.Text), CBPendientes.Checked, CampoOrdenDetalleVentas, CampoOrdenMargenesVentas, CalcularMargenes);
  end;
end;

procedure TFMClientes.DBEFGrupoCuentasChange(Sender: TObject);
begin
  inherited;
  ETitGrupoCuentas.Text := DameTituloGrupoCuentas(StrToIntDef(DBEFGrupoCuentas.Text, 0));
end;

procedure TFMClientes.DBGVentasDetalleTitleClick(Column: TColumn);
begin
  // inherited;

  // Si el campo de orden es el mismo, lo invierto (orden descendente)
  if (CampoOrdenDetalleVentas <> IntToStr(Column.Field.Index + 1)) then
     CampoOrdenDetalleVentas := IntToStr(Column.Field.Index + 1)
  else
     CampoOrdenDetalleVentas := IntToStr((Column.Field.Index + 1) * (-1));

  FiltroVentasChange(nil);
end;

procedure TFMClientes.ACopiaConfEnNuevoClienteExecute(Sender: TObject);
var
  ClienteOrigen : integer;
begin
  inherited;
  // Copiamos los valores de configuracion de otro cliente
  ClienteOrigen := 0;
  if (PideDato('CLI', ClienteOrigen)) then
     DataModule.ActualizaConfiguracionCliente(ClienteOrigen);
end;

procedure TFMClientes.DBEFCuentaIRPFChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFCuentaIRPF.Text) = '') then
     ETituloCuentaIRPF.Text := _('Segun configuracion')
  else
     ETituloCuentaIRPF.Text := DameTituloCuenta(DBEFCuentaIRPF.Text);
end;

procedure TFMClientes.APedirFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.PedirFirma('LOC', DameIDCliente(DataModule.QMClientesCLIENTE.AsInteger));
end;

procedure TFMClientes.ABorrarFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.BorrarFirma('LOC', DameIDCliente(DataModule.QMClientesCLIENTE.AsInteger));
end;

procedure TFMClientes.AVisualizarCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCartaLOPD(0, False);
end;

procedure TFMClientes.AImprimirCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCartaLOPD(1, False);
end;

procedure TFMClientes.AEnviarEmailCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCartaLOPD(2, False, True);
end;

procedure TFMClientes.AEnviarEmailCartaLOPD2Execute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCartaLOPD(2, True);
end;

procedure TFMClientes.AListConfigCartaLOPDExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(2016, Formato, Cabecera, Copias, Pijama, '',
     DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientes.DBEFCategoriaChange(Sender: TObject);
begin
  inherited;
  ECategoria.Text := DameTituloCategoria(DBEFCategoria.Text);
end;

procedure TFMClientes.DBEFTarifaChange(Sender: TObject);
begin
  inherited;
  ETituloTarifa.Text := DameTituloTarifa(DBEFTarifa.Text);
end;

procedure TFMClientes.DBEFAgenteChange(Sender: TObject);
begin
  inherited;
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(DBEFAgente.Text, 0));
end;

procedure TFMClientes.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

procedure TFMClientes.DBEFMonedaChange(Sender: TObject);
begin
  inherited;
  ETituloMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
end;

procedure TFMClientes.DBEFModoIvaChange(Sender: TObject);
begin
  inherited;
  ETituloModoIva.Text := DameTituloModoIVA(StrToIntDef(DBEFModoIVA.Text, 0));
end;

procedure TFMClientes.TSConsumoShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirConsumos;
end;

procedure TFMClientes.DBEFPerfilChange(Sender: TObject);
begin
  inherited;
  ETituloPerfil.Text := DameTituloPerfilCliente(DBEFPerfil.Text);
end;

procedure TFMClientes.DBEFTipoClienteChange(Sender: TObject);
begin
  inherited;
  ETituloTipoTercero.Text := DataModule.DameTituloTipoTercero(StrToIntDef(DBEFTipoCliente.Text, 0));
end;

procedure TFMClientes.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DataModule.DameTituloPaisC2(DBEFPais.Text);
end;

procedure TFMClientes.DBEFTipoTransChange(Sender: TObject);
begin
  inherited;
  ETituloTipoTrans.Text := DataModule.DameTituloTipoTransporte(StrToIntDef(DBEFTipoTrans.Text, 0));
end;

procedure TFMClientes.MuestraDocumentosVenta(TipoDoc: string);
begin
  PCMain.ActivePage := TSVentas;

  // Establezco fechas. Por lo menos este ejercicio, si no están establecidos con otras fechas
  if (DEFechaVentasDesde.Date > EncodeDate(YearOf(Now), 1, 1)) then
     DEFechaVentasDesde.Date := EncodeDate(YearOf(Now), 1, 1);
  if (DEFechaVentasHasta.Date < EncodeDate(YearOf(Now), 12, 31)) then
     DEFechaVentasHasta.Date := EncodeDate(YearOf(Now), 12, 31);

  CBTipoDocumento.Text := TipoDoc;

  // Para que refresque datos de pestaña
  FiltroVentasChange(Self);

  PCVentas.ActivePage := TSVentasDetalle;
end;

procedure TFMClientes.DBERiesgoPendienteTotalKriChange(Sender: TObject);
begin
  inherited;
  {Si el riesgo se supera, lo pongo en rojo}
  if (DBERiesgoPendienteTotalKri.DataSource.DataSet.FindField(DBERiesgoPendienteTotalKri.DataField).AsFloat < 0) then
  begin
     ColorError(DBERiesgoPendienteTotalKri);
     ColorError(DBERiesgoPendienteTotalKri);
  end
  else
  begin
     ColorInfo(DBERiesgoPendienteTotalKri);
     ColorInfo(DBERiesgoPendienteTotalKri);
  end;
end;

procedure TFMClientes.PNLAvisosResize(Sender: TObject);
var
  Altura : integer;
begin
  inherited;
  Altura := PNLAvisos.Height div 4;

  DBCBAvisoActivoOFC.Top := (Altura * 0) + 5;
  DBCBAvisoActivoPEC.Top := (Altura * 1) + 5;
  DBCBAvisoActivoALB.Top := (Altura * 2) + 5;
  DBCBAvisoActivoFAC.Top := (Altura * 3) + 5;

  DBMAvisoOFC.Top := DBCBAvisoActivoOFC.Top + DBCBAvisoActivoOFC.Height;
  DBMAvisoPEC.Top := DBCBAvisoActivoPEC.Top + DBCBAvisoActivoPEC.Height;
  DBMAvisoALB.Top := DBCBAvisoActivoALB.Top + DBCBAvisoActivoALB.Height;
  DBMAvisoFAC.Top := DBCBAvisoActivoFAC.Top + DBCBAvisoActivoFAC.Height;

  DBMAvisoOFC.Height := Altura - DBCBAvisoActivoOFC.Height - 10;
  DBMAvisoPEC.Height := Altura - DBCBAvisoActivoPEC.Height - 10;
  DBMAvisoALB.Height := Altura - DBCBAvisoActivoALB.Height - 10;
  DBMAvisoFAC.Height := Altura - DBCBAvisoActivoFAC.Height - 10;
end;

procedure TFMClientes.TSAvisosShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirAvisos;
end;

procedure TFMClientes.DBGPreciosDblClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMCondicionesVenta, FMCondicionesVenta);
  FMCondicionesVenta.Posicionar(DataModule.QMPreciosTIPO.AsString, DataModule.QMPreciosRIG.AsInteger, DataModule.QMPreciosLINEA.AsInteger);
end;

procedure TFMClientes.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
  RiesgoIncluyePedidos : boolean;
begin
  inherited;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGPrecios, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGPrecios.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));

     IdColumna := EncuentraField(DBGVentasMargenes, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGVentasMargenes.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));

     IdColumna := EncuentraField(DBGMain, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGMain.Columns[IdColumna].Title.Caption := LeeParametro(format('CLIDESC%3.3d', [i]));
  end;

  LCampo1.Caption := LeeParametro(format('CLIDESC%3.3d', [1]));
  LCampo2.Caption := LeeParametro(format('CLIDESC%3.3d', [2]));
  LCampo3.Caption := LeeParametro(format('CLIDESC%3.3d', [3]));
  LCampo4.Caption := LeeParametro(format('CLIDESC%3.3d', [4]));
  LCampo5.Caption := LeeParametro(format('CLIDESC%3.3d', [5]));
  LCampo6.Caption := LeeParametro(format('CLIDESC%3.3d', [6]));
  LCampo7.Caption := LeeParametro(format('CLIDESC%3.3d', [7]));
  LCampo8.Caption := LeeParametro(format('CLIDESC%3.3d', [8]));

  // CLIREST001 - Restringe edicion de bloqueo
  DBCBBloqueo.Enabled := (LeeParametro('CLIREST001') <> 'S');
  DBCBBloqueo.ReadOnly := not DBCBBloqueo.Enabled;
  DBEMotivoBloqueo.Enabled := (LeeParametro('CLIREST001') <> 'S');
  DBEMotivoBloqueo.ReadOnly := not DBEMotivoBloqueo.Enabled;

  RiesgoIncluyePedidos := (LeeParametro('CLIRIES003') = 'S');

  LRiesgoTotalKri.Visible := not RiesgoIncluyePedidos;
  DBERiesgoTotalKri.Visible := not RiesgoIncluyePedidos;
  EDRiesgoTotalKri.Visible := not RiesgoIncluyePedidos;
  LRiesgoPendienteTotalKri.Visible := not RiesgoIncluyePedidos;
  DBERiesgoPendienteTotalKri.Visible := not RiesgoIncluyePedidos;
  EDRiesgoPendienteTotalKri.Visible := not RiesgoIncluyePedidos;

  LRiesgoPedidoLineaPendiente.Visible := not RiesgoIncluyePedidos;
  DBERiesgoPedidoLineaPendiente.Visible := not RiesgoIncluyePedidos;
  EDTRiesgoPedLinEmp.Visible := not RiesgoIncluyePedidos;

  ColorCampoID(DBECliente);
end;

procedure TFMClientes.TSVentasMargenesShow(Sender: TObject);
begin
  inherited;
  NavVentas.DataSource := DataModule.DSxVentasMargenes;
end;

procedure TFMClientes.DBGVentasMargenesTitleClick(Column: TColumn);
begin
  // inherited;

  // Si el campo de orden es el mismo, lo invierto (orden descendente)
  if (CampoOrdenMargenesVentas <> IntToStr(Column.Field.Index + 1)) then
     CampoOrdenMargenesVentas := IntToStr(Column.Field.Index + 1)
  else
     CampoOrdenMargenesVentas := IntToStr((Column.Field.Index + 1) * (-1));

  FiltroVentasChange(nil);
end;

procedure TFMClientes.TSArticulosShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirArticulos;
  ControlEdit := CEArticulos;
end;

procedure TFMClientes.RefrescaPestanyaActiva;
begin
  if Assigned(PCMain) then
  begin
     if Assigned(PCMain.ActivePage.OnShow) then
        PCMain.ActivePage.OnShow(Self);

     if (PCMain.ActivePage = TSVentas) then
        FiltroVentasChange(Self);
  end;
end;

procedure TFMClientes.DBGCodCliBusqueda(Sender: TObject);
begin
  inherited;
  DBGCodCli.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMClientes.SBAContaExtractoDblClick(Sender: TObject);
begin
  inherited;
  AContaExtracto.Execute;
end;

procedure TFMClientes.AContaExtractoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AContaExtracto, DBECuenta.Text);
end;

procedure TFMClientes.AConfigCircularizacionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  TFMListConfig.Create(Self).Muestra(644, Formato, Cabecera, Copias, Pijama, '', DMLstCircularizacion.frCircularizacion);
  CierraData(DMLstCircularizacion);
end;

procedure TFMClientes.AVisualizarCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(0, False);
end;

procedure TFMClientes.AImprimirCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(1, False);
end;

procedure TFMClientes.AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(2, False, True);
end;

procedure TFMClientes.AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
begin
  inherited;
  DataModule.ImprimirCircularizacion(2, True);
end;

procedure TFMClientes.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('CLI', DameIDCliente(DataModule.QMClientesCLIENTE.AsInteger), Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosCliente.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMClientes.AAccesoDirectoExecute(Sender: TObject);
begin
  GuardaAccesoDirecto('AClientes');
end;

procedure TFMClientes.Notas;
begin
  LBNotas.Visible := False;
  RelojNotas.Enabled := ((DataModule.QMClientes.Active) and (Trim(DataModule.QMClientesNOTAS.AsString) <> ''));
end;

procedure TFMClientes.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;

  if ((Button = nbInsert) and (DMMain.EstadoKri(19) = 1)) then
  begin
     ButUltimoCte.Visible := True;
     ButUltimoCte.Enabled := True;
  end
  else
  begin
     ButUltimoCte.Visible := False;
     ButUltimoCte.Enabled := False;
  end;

  if (Button = nbEdit) then
  begin
     DBECliente.Enabled := False;
     DBECliente.ReadOnly := not DBECliente.Enabled;
     DBEFTercero.Enabled := False;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorInfo(DBEFTercero);
  end
  else
  if (Button = nbInsert) then
  begin
     if (REntorno.Cliente_aut) then
     begin
        ColorCampoID(DBECliente);
        DBECliente.Enabled := False;
        DBECliente.ReadOnly := not DBECliente.Enabled;
     end
     else
     begin
        ColorEdicion(DBECliente);
        DBECliente.Enabled := True;
        DBECliente.ReadOnly := not DBECliente.Enabled;
     end;

     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorEdicion(DBEFTercero);
  end
  else
  begin
     DBECliente.Enabled := True;
     DBECliente.ReadOnly := not DBECliente.Enabled;
     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorCampoID(DBECliente);
     ColorEdicion(DBEFTercero);
  end;
end;

procedure TFMClientes.EFiltroAgrupacionChange(Sender: TObject);
begin
  inherited;
  DataModule.FiltraAgrupacionDisponible(EFiltroAgrupacion.Text);
end;

procedure TFMClientes.TSAgrupacionesResize(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMClientes.DBEFProyectoChange(Sender: TObject);
begin
  inherited;
  EProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyecto.Text, 0));
end;

procedure TFMClientes.ACreaContactoCRMExecute(Sender: TObject);
begin
  inherited;
  FMain.autcrm := True;
  FMain.EjecutaAccion(FMain.ACrmContactos);
  CrmFMContactos.Tercero_a_Crm(StrToInt(DBEFTercero.Text), StrToInt(DBECLiente.Text));
end;

procedure TFMClientes.DBEInfoVentasClienteChange(Sender: TObject);
var
  i : integer;
begin
  inherited;

  for i := 0 to DBGVentasDocumento.Columns.Count - 1 do
  begin
     if ((DBGVentasDocumento.Columns[i].FieldName = 'NOMBRE') or
        (DBGVentasDocumento.Columns[i].FieldName = 'NIF') or
        (DBGVentasDocumento.Columns[i].FieldName = 'DIR_NOMBRE') or
        (DBGVentasDocumento.Columns[i].FieldName = 'C_POSTAL') or
        (DBGVentasDocumento.Columns[i].FieldName = 'LOCALIDAD') or
        (DBGVentasDocumento.Columns[i].FieldName = 'POBLACION') or
        (DBGVentasDocumento.Columns[i].FieldName = 'PROVINCIA') or
        (DBGVentasDocumento.Columns[i].FieldName = 'PAIS') or
        (DBGVentasDocumento.Columns[i].FieldName = 'TELEFONO01') or
        (DBGVentasDocumento.Columns[i].FieldName = 'TELEFONO02') or
        (DBGVentasDocumento.Columns[i].FieldName = 'TELEFAX') or
        (DBGVentasDocumento.Columns[i].FieldName = 'EMAIL') or
        (DBGVentasDocumento.Columns[i].FieldName = 'NOMBRE_CONTACTO') or
        (DBGVentasDocumento.Columns[i].FieldName = 'COMO_NOS_CONOCIERON')) then
     begin
        DBGVentasDocumento.Columns[i].Visible := (StrToIntDef(DBEInfoVentasCliente.Text, 0) < 0);
     end;
  end;
end;

procedure TFMClientes.DBGCodCliDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ARTICULO') then
     CeldaEnlace(DBGCodCli, Rect);
end;

procedure TFMClientes.DBGCodCliCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMClientes.DBGCodCliDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') and (Trim(DataModule.QMCliArtARTICULO.AsString) > '') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DataModule.QMCliArtARTICULO.AsString + '''');
  end;
end;

procedure TFMClientes.DBEFAgente2Change(Sender: TObject);
begin
  inherited;
  ETituloAgente2.Text := DameTituloAgente(StrToIntDef(DBEFAgente2.Text, 0));
end;

procedure TFMClientes.TSRedesSocialesShow(Sender: TObject);
begin
  inherited;
  DataModule.AbrirRedesSociales;
end;

procedure TFMClientes.DBGRedesSocialesDblClick(Sender: TObject);
var
  Url : string;
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'URL') then
  begin
     Url := DataModule.QMRedesSocialesURL.AsString;
     if (Url > '') then
     begin
        if (IsURL404(Url)) then
           ShowMessage(_('URL Invalida'))
        else
           ShellExecute(Application.Handle, nil, PChar(Url), nil, nil, SW_SHOWNA);
     end;
  end;
end;

procedure TFMClientes.DBGRedesSocialesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMClientes.DBGRedesSocialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'URL') then
     CeldaEnlace(DBGRedesSociales, Rect);
end;

end.
