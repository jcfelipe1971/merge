unit UFMAcreedores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, ComCtrls, UEditPanel, UNavigator, ToolWin, UFIBDBEditfind,
  StdCtrls, Mask, DBCtrls, UComponentesBusquedaFiltrada, UFPEdit, ActnList,
  Buttons, rxPlacemnt, NsDBGrid, URecursos, ULFDBCheckBox, ULFDBEdit, ULFFormStorage,
  ULFActionList, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFPageControl, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc,
  ULFEdit, TFlatPanelUnit, TeEngine, Series, TeeProcs, Chart, DbChart,
  ULFEditFind2000, DB, IdGlobalProtocols, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  ULFComboBox, DbComboBoxValue, ULFDateEdit;

type
  TFMAcreedores = class(TFPEdit)
     LBLAcreedor: TLFLabel;
     DBEAcreedor: TLFDbedit;
     DBEFTercero: TLFDBEditFind2000;
     DBETituloTercero: TLFDbedit;
     LBLTercero: TLFLabel;
     DBEDiaPago1: TLFDbedit;
     DBEDtoPP: TLFDbedit;
     LBLDiaPago: TLFLabel;
     DBEFormaPagoTit: TLFDbedit;
     LBLFormaPago: TLFLabel;
     DBECuenta: TLFDbedit;
     LBLCuenta: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     DBETituloTipo: TLFDbedit;
     LBLTipo: TLFLabel;
     TSNotas: TTabSheet;
     PNLENotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     TBNotas: TLFToolBar;
     PNLDatosNotas: TLFPanel;
     DBECodNotas: TLFDbedit;
     DBEDesNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LBLDtoProntoPago: TLFLabel;
     LBLModoIVa: TLFLabel;
     DBETituloModoIva: TLFDbedit;
     LBLRetencion: TLFLabel;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBEPIRPF: TLFDbedit;
     DBETituloIRPF: TLFDbedit;
     DBCBAnticipos: TLFDBCheckBox;
     DBEFFormaPago: TLFDBEditFind2000;
     DBEFModoIva: TLFDBEditFind2000;
     DBCBEvalFebSi: TLFDBCheckBox;
     DBCBEvalFeb: TLFDBCheckBox;
     DBEFMoneda: TLFDBEditFind2000;
     DBETituloMoneda: TLFDbedit;
     LBMoneda: TLFLabel;
     ALAcreedores: TLFActionList;
     ANewTercero: TAction;
     LCuentaGastos: TLFLabel;
     DBETitCuenta: TLFDbedit;
     DBEFCtaGastos: TLFDBEditFind2000;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     SBAContaExtracto: TSpeedButton;
     MISepEnlaces: TMenuItem;
     MIVerDatosTercero: TMenuItem;
     DBEDiaPago2: TLFDBEdit;
     DBCBFinanciacion: TLFDBCheckBox;
     LPorCinanciacion: TLFLabel;
     DBEPor_Financiacion: TLFDbedit;
     ToolButton1: TToolButton;
     AVisualizarListadoAcreedores: TAction;
     AImprimirListadoAcreedores: TAction;
     AVisualizarDatosFiscales: TAction;
     AImprimirDatosFiscales: TAction;
     AListadoDirecciones: TAction;
     AImprimirLstDirecciones: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfAcreedores: TAction;
     AConfAcreedoresFiscal: TAction;
     AConfListDirecciones: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstCargaTransportista: TAction;
     ASep: TAction;
     ASep2: TAction;
     DBETitCtaDtoPP: TLFDbedit;
     DBEFCuentaDtoPP: TLFDBEditFind2000;
     LCtaDtoPP: TLFLabel;
     LFCategoryAction3: TLFCategoryAction;
     AIncidencias: TAction;
     TSIncidencias: TTabSheet;
     DBGIncidencias: THYTDBGrid;
     TBIncidencias: TLFToolBar;
     PNLDatosIncidencias: TLFPanel;
     DBAcrIn: TLFDbedit;
     DBTitAcrIn: TLFDbedit;
     DBCHTransportistaRapidoKri: TLFDBCheckBox;
     TSEstadisticas: TTabSheet;
     TBEstado: TLFToolBar;
     PNLDatosEstadisticas: TLFPanel;
     LFEstadAcr: TLFDbedit;
     LFEstadAcrTitulo: TLFDbedit;
     LFPCEstadisticas: TLFPageControl;
     TSDocumentos: TTabSheet;
     TSGraficos: TTabSheet;
     ACalculaEstadisticas: TAction;
     ARecibosPendientesNoCob: TAction;
     AFactPendDet: TAction;
     AFactCobDet: TAction;
     FPDocumentos: TFlatPanel;
     LFLFactPend: TLFLabel;
     LNum: TLFLabel;
     LBaseImponible: TLFLabel;
     LLiquido: TLFLabel;
     LFEFactPend: TLFEdit;
     LFDEFactPendLIQUIDO: TLFDbedit;
     LFDEFactPendBASE: TLFDbedit;
     LFDEFactPendNUMERO: TLFDbedit;
     FPImpagados: TFlatPanel;
     LRecPend: TLFLabel;
     LRecPendRetraso: TLFLabel;
     LRecPendPlazo: TLFLabel;
     LRecNoCob: TLFLabel;
     LRecImp: TLFLabel;
     LFEEstadoRecPend: TLFEdit;
     LFDERecImpagadosIMPORTE: TLFDbedit;
     LFEEstadoRecImp: TLFEdit;
     LFEEstadoRecNoCob: TLFEdit;
     LFDERecImpagadosNUMERO: TLFDbedit;
     LFDERecNoCobradosIMPORTE: TLFDbedit;
     LFDERecPendIMPORTE: TLFDbedit;
     LFDERecNoCobradosNUMERO: TLFDbedit;
     LFDERecPendNUMERO: TLFDbedit;
     LFDERecPendRetraso: TLFDbedit;
     LFDEREcPendPLazo: TLFDbedit;
     FlatPanel1: TFlatPanel;
     LPPRecibir: TLFLabel;
     LFDEPPRecibirNUMERO: TLFDbedit;
     LFDEPPRecibirIMPORTE: TLFDbedit;
     LFEPPRecibir: TLFEdit;
     LFEPPCobrar: TLFEdit;
     LFDEAntCuenta: TLFDbedit;
     LAntCuenta: TLFLabel;
     LFEAnticipo: TLFEdit;
     LFDEPPCobrarIMPORTE: TLFDbedit;
     LFDEPPCobrarNUMERO: TLFDbedit;
     LFDEAnticipo: TLFDbedit;
     LPPCobrar: TLFLabel;
     LAnticipo: TLFLabel;
     LFestadisticas: TLFPanel;
     LEnero: TLFLabel;
     LFebrero: TLFLabel;
     LMarzo: TLFLabel;
     LAbril: TLFLabel;
     LMayo: TLFLabel;
     LJunio: TLFLabel;
     LJulio: TLFLabel;
     LAgosto: TLFLabel;
     LSeptiembre: TLFLabel;
     LOctubre: TLFLabel;
     LNoviembre: TLFLabel;
     LDiciembre: TLFLabel;
     LFComparar: TLFLabel;
     LFActual: TLFLabel;
     LFPrevision: TLFLabel;
     LTotal: TLFLabel;
     LEstadisticasBaseEjercicio: TLFLabel;
     LEstadisticasBaseEjercicioSig: TLFLabel;
     LEstadisticasBasePrevision: TLFLabel;
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
     LFGraficos: TLFPanel;
     DBCAnual: TDBChart;
     Series7: TBarSeries;
     Series6: TBarSeries;
     Series5: TBarSeries;
     Series2: TBarSeries;
     Series1: TBarSeries;
     DBCPrevision: TDBChart;
     BarSeries2: TBarSeries;
     BarSeries1: TBarSeries;
     DBCMensual: TDBChart;
     BarSeries4: TBarSeries;
     BarSeries3: TBarSeries;
     ARecibosImpagados: TAction;
     SBVerFacPend: TSpeedButton;
     SBVerImpagados: TSpeedButton;
     SBVerNoCob: TSpeedButton;
     SBVerPendientes: TSpeedButton;
     ARecibosPendientesPend: TAction;
     SBVerFacCob: TSpeedButton;
     LFFactCobr: TLFLabel;
     LFDFactCobrNUMERO: TLFDbedit;
     LFDFactCobrBASE: TLFDbedit;
     LFEFactCobr: TLFEdit;
     TSComunicaciones: TTabSheet;
     CEComunicaciones: TControlEdit;
     CEComunicacionesPMEdit: TPopUpTeclas;
     DBGComunicaciones: TDBGridFind2000;
     TBComunicaciones: TLFToolBar;
     PNLDatosComunicaciones: TLFPanel;
     DBEComunicacionesCod: TLFDbedit;
     DBEComunicacionesTitulo: TLFDbedit;
     ToolButton9: TToolButton;
     NavComunicaciones: THYMNavigator;
     ToolButton10: TToolButton;
     TButtEnviarComunicacionXMail: TToolButton;
     LComunicacionesBusqueda: TLFLabel;
     EFComunicacionesBusqueda: TLFEditFind2000;
     AEnviarComunicacionXMail: TAction;
     TButtImportarArchivoComunicacion: TToolButton;
     AImportarArchivoComunicacion: TAction;
     TButtPlantillaComunicacion: TToolButton;
     PMPlantillasComunicaciones: TPopupMenu;
     LFCategoryAction4: TLFCategoryAction;
     AAdjuntosAcreedor: TAction;
     AAdjuntosTercero: TAction;
     DBCBGeneraTalones: TLFDBCheckBox;
     LEstadisticasLiquidoEjercicio: TLFLabel;
     LEstadisticasLiquidoEjercicioSig: TLFLabel;
     LEstadisticasLiquidoPrevision: TLFLabel;
     DBCHKBaja: TLFDBCheckBox;
     DBEMotivoBaja: TLFDbedit;
     DBDTPFechaBaja: TLFDBDateEdit;
     LTipoNCF: TLFLabel;
     DBLCBTipoNCF: TDBLookupComboBox;
     ToolButton2: TToolButton;
     TButtImprimirNotas: TToolButton;
     AImprimirNotas: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     ETituloIdioma: TLFEdit;
     DBChkBRECC: TLFDBCheckBox;
     LBancoParaPagos: TLFLabel;
     DBEFBancoParaPagos: TLFDBEditFind2000;
     ETituloBancoParaPagos: TLFEdit;
     LblTipoTrans: TLFLabel;
     DBEFTipoTrans: TLFDBEditFind2000;
     DBETipoTrans: TLFDbedit;
     DBChkBIntra: TLFDBCheckBox;
     LblPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     DBEPais: TLFDbedit;
     DBCHTransportistaCreaRuta: TLFDBCheckBox;
     TSTarifaPortes: TTabSheet;
     TBTarifaPortes: TLFToolBar;
     PNLDatosTarifaPortes: TLFPanel;
     DBETarifaPortesCod: TLFDbedit;
     DBETarifaPortesTitulo: TLFDbedit;
     ToolButton3: TToolButton;
     NavTarifaPortes: THYMNavigator;
     DBGTarifaPortes: TDBGridFind2000;
     CETarifaPortes: TControlEdit;
     CETarifaPortesPMEdit: TPopUpTeclas;
     LBloqueo: TLFLabel;
     DBCBBloqueo: TDBComboBoxValue;
     LMotivoBloqueo: TLFLabel;
     DBEMotivoBloqueo: TLFDbedit;
     DBCHTransportistaGeneraEnvio: TLFDBCheckBox;
     TSCompras: TTabSheet;
     PCCompras: TLFPageControl;
     TSComrasDocumentos: TTabSheet;
     DBGComprasDocumento: THYTDBGrid;
     TSComprasDetalle: TTabSheet;
     DBGComprasDetalle: THYTDBGrid;
     TBCompras: TLFToolBar;
     PNLComprasAcreedor: TLFPanel;
     DBEComprasAcreedor: TLFDbedit;
     DBEComprasTitulo: TLFDbedit;
     TB: TToolButton;
     NavCompras: THYMNavigator;
     PNLFltroCompras: TLFPanel;
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
     CBSoloFacturasAbiertas: TLFCheckBox;
     EDescripcion: TLFEdit;
     LCuentaIRPF: TLFLabel;
     DBEFCuentaIRPF: TLFDBEditFind2000;
     ETituloCuentaIRPF: TLFEdit;
     LNIF: TLFLabel;
     DBENIF: TLFDbedit;
     TSFacturaElectronica: TTabSheet;
     TBTipoGiro: TLFToolBar;
     NavTipoGiro: THYMNavigator;
     DBGFTipoGiro: TDBGridFind2000;
     Splitter1: TSplitter;
     DBMMDatosIncidencia: TLFDBMemo;
     TSAvisos: TTabSheet;
     TBAvisos: TLFToolBar;
     PNLAvisosAcreedor: TLFPanel;
     DBEAvisosProveedor: TLFDbedit;
     DBEAvisosNombre: TLFDbedit;
     TBSep1: TToolButton;
     NavAvisos: THYMNavigator;
     PNLAvisos: TLFPanel;
     DBCBAvisoActivoFCR: TLFDBCheckBox;
     DBMAvisoFCR: TLFDBMemo;
     CEAvisos: TControlEdit;
     CEAvisosPMEdit: TPopUpTeclas;
     DBEDiaPago3: TLFDbedit;
     LFechaAlta: TLFLabel;
     DBEFechaAlta: TLFDbedit;
     AContaExtracto: TAction;
     AConfigCircularizacion: TAction;
     LFCategoryAction5: TLFCategoryAction;
     AVisualizarCartaCircularizacion: TAction;
     AImprimirCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion2: TAction;
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
     LProyecto: TLFLabel;
     EProyecto: TLFEdit;
     DBEFProyecto: TDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttCompClick(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TbuttImprimirClick(Sender: TObject);
     procedure MIConfAcreedoresFiscalClick(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ANewTerceroExecute(Sender: TObject);
     procedure DBEFCtaGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCtaGastosExit(Sender: TObject);
     procedure AATerceroExecute(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure DBETituloTerceroEnter(Sender: TObject);
     procedure AVisualizarListadoAcreedoresExecute(Sender: TObject);
     procedure AImprimirListadoAcreedoresExecute(Sender: TObject);
     procedure AVisualizarDatosFiscalesExecute(Sender: TObject);
     procedure AImprimirDatosFiscalesExecute(Sender: TObject);
     procedure AListadoDireccionesExecute(Sender: TObject);
     procedure AImprimirLstDireccionesExecute(Sender: TObject);
     procedure AConfAcreedoresExecute(Sender: TObject);
     procedure AConfAcreedoresFiscalExecute(Sender: TObject);
     procedure AConfListDireccionesExecute(Sender: TObject);
     procedure ALstCargaTransportistaExecute(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AIncidenciasExecute(Sender: TObject);
     procedure DBGIncidenciasDblClick(Sender: TObject);
     procedure DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFTipoChange(Sender: TObject);
     procedure TSEstadisticasShow(Sender: TObject);
     procedure ACalculaEstadisticasExecute(Sender: TObject);
     procedure ARecibosPendientesNoCobExecute(Sender: TObject);
     procedure AFactPendDetExecute(Sender: TObject);
     procedure AFactCobDetExecute(Sender: TObject);
     procedure TSEstadisticasHide(Sender: TObject);
     procedure ARecibosImpagadosExecute(Sender: TObject);
     procedure DBCAnualDblClick(Sender: TObject);
     procedure DBCMensualDblClick(Sender: TObject);
     procedure DBCPrevisionDblClick(Sender: TObject);
     procedure ARecibosPendientesPendExecute(Sender: TObject);
     procedure BBMultiSelectClick(Sender: TObject);
     procedure TSComunicacionesHide(Sender: TObject);
     procedure EFComunicacionesBusquedaBusqueda(Sender: TObject);
     procedure EFComunicacionesBusquedaChange(Sender: TObject);
     procedure DBGComunicacionesCellClick(Column: TColumn);
     procedure DBGComunicacionesDblClick(Sender: TObject);
     procedure DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavComunicacionesChangeState(Sender: TObject);
     procedure AEnviarComunicacionXMailExecute(Sender: TObject);
     procedure AImportarArchivoComunicacionExecute(Sender: TObject);
     procedure TSComunicacionesShow(Sender: TObject);
     procedure PMPlantillasComunicacionesItemOnClick(Sender: TObject);
     procedure AAdjuntosAcreedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure DBCHKBajaChange(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure DBEFBancoParaPagosChange(Sender: TObject);
     procedure TSGraficosShow(Sender: TObject);
     procedure TSComprasShow(Sender: TObject);
     procedure TSComprasHide(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBGComprasDocumentoCellClick(Column: TColumn);
     procedure TSComprasDetalleShow(Sender: TObject);
     procedure TSComrasDocumentosShow(Sender: TObject);
     procedure DBGComprasDocumentoDblClick(Sender: TObject);
     procedure DBGComprasDocumentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGComprasDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGComprasDetalleDblClick(Sender: TObject);
     procedure FiltroComprasChange(Sender: TObject);
     procedure DBEFCuentaIRPFChange(Sender: TObject);
     procedure DBGTarifaPortesBusqueda(Sender: TObject);
     procedure SBAContaExtractoDblClick(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure AConfigCircularizacionExecute(Sender: TObject);
     procedure AVisualizarCartaCircularizacionExecute(Sender: TObject);
     procedure AImprimirCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure FormShow(Sender: TObject);
     procedure DBEFProyectoChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure Notas;
     procedure HabilitaEnlaces;
     procedure MuestraGrafico(Tipo: integer);
  public
     { Public declarations }
     Formulario, TipoGrafica: integer;
     SWFil, SWEnlace: integer;
     procedure MuestraFiltrado(Modo: byte);
     procedure MuestraFiltradoFiscal(Modo: byte);
     procedure FiltraAcreedores(Filtro: string);
     procedure Tercero_a_Acreedor(Tercero: integer);
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
  end;

var
  FMAcreedores : TFMAcreedores;
  Canal : integer;
  ListaCanales : TStringList;

implementation

uses UDMMain, UDMAcreedores, UFormGest, UUtiles, UEntorno,
  UDMLSTAcreedor, UFMListConfig, UFMain, UFMTerceros,
  UFPregTransportistaCarga, UFMIncidencias, UFmRecibosPendientes,
  UFGrafico, UFMultiSeleccion, UFSendCorreo,
  UDMListados, UFMAdjunto, UDMLstCircularizacion, ShellApi,
  URecibeFicheros, UDMAdjunto, UParam, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMAcreedores.FormCreate(Sender: TObject);
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
  AbreData(TDMAcreedores, DMAcreedores);
  HabilitarPunto;  // Habilitar el Punto en la Cuenta
  NavMain.DataSource := DMAcreedores.DSQMAcreedores;
  EPMain.DataSource := DMAcreedores.DSQMAcreedores;
  DBGMain.DataSource := DMAcreedores.DSQMAcreedores;
  DBECuenta.MaxLength := REntorno.DigitosSub;
  DBEFCuentaDtoPP.MaxLength := REntorno.DigitosSub;
  DBEFCuentaIRPF.MaxLength := REntorno.DigitosSub;
  CENotasPMEdit.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  G2KTableLoc.DataSource := DMAcreedores.DSQMAcreedores;
  DBGIncidencias.DataSource := DMAcreedores.DSxIncidencias;
  SWFil := 0;
  SWEnlace := 0;

  Notas;
  HabilitaEnlaces;

  if (REntorno.Acreedor_aut) then
  begin
     NavMain.InsertaControl := DBEFTercero;
     ColorCampoID(DBEAcreedor);
     DBEAcreedor.Enabled := False;
     DBEAcreedor.ReadOnly := not DBEAcreedor.Enabled;
  end
  else
  begin
     NavMain.InsertaControl := DBEAcreedor;
     ColorEdicion(DBEAcreedor);
     DBEAcreedor.Enabled := True;
     DBEAcreedor.ReadOnly := not DBEAcreedor.Enabled;
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

  {dji lrk kri - Restricciones}
  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavNotas.VisibleButtons := [nbRefresh];
  end;

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
  DirectorioBaseComunicaciones := DirectorioBaseComunicaciones + '\ACR';
  if (not DirectoryExists(DirectorioBaseComunicaciones)) then
     CreateDir(DirectorioBaseComunicaciones); {Creo directorios si no existen}

  DMAcreedores.PlantillaComunicaciones := '';
  with PMPlantillasComunicaciones do
  begin
     SL := TStringList.Create;
     try
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
     finally
        SL.Free;
     end;
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

  DBCBGeneraTalones.Visible := DMMain.EstadoKri(255) = 1;

  {Latino}
  if (DMMain.EstadoKri(410) <> 1) then
  begin
     LTipoNCF.Visible := False;
     DBLCBTipoNCF.Visible := False;
  end;

  TipoDocumento := LeeParametro('ACRCOMT001');
  CBTipoDocumento.ItemIndex := 0;
  while ((CBTipoDocumento.ItemIndex < CBTipoDocumento.Items.Count - 1) and (CBTipoDocumento.Text <> TipoDocumento)) do
     CBTipoDocumento.ItemIndex := CBTipoDocumento.ItemIndex + 1;

  if (CBTipoDocumento.Text <> TipoDocumento) then
     CBTipoDocumento.ItemIndex := 0;

  DBCHKBajaChange(Sender);
  DBEFTipoChange(Sender);
end;

procedure TFMAcreedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DeshabilitarPunto;
  CierraData(DMAcreedores);
end;

procedure TFMAcreedores.FormShow(Sender: TObject);
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
        DBGMain.Columns[IdColumna].Title.Caption := LeeParametro(format('ACRDESC%3.3d', [i]));
  end;

  LCampo1.Caption := LeeParametro(format('ACRDESC%3.3d', [1]));
  LCampo2.Caption := LeeParametro(format('ACRDESC%3.3d', [2]));
  LCampo3.Caption := LeeParametro(format('ACRDESC%3.3d', [3]));
  LCampo4.Caption := LeeParametro(format('ACRDESC%3.3d', [4]));
  LCampo5.Caption := LeeParametro(format('ACRDESC%3.3d', [5]));
  LCampo6.Caption := LeeParametro(format('ACRDESC%3.3d', [6]));
  LCampo7.Caption := LeeParametro(format('ACRDESC%3.3d', [7]));
  LCampo8.Caption := LeeParametro(format('ACRDESC%3.3d', [8]));

  ColorCampoID(DBEAcreedor);
end;

procedure TFMAcreedores.TbuttCompClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMAcreedores.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMAcreedores.TSNotasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotas;
end;

procedure TFMAcreedores.TSTablaShow(Sender: TObject);
begin
  inherited;
  DBGMain.SetFocus;
  ControlEdit := CEMain;
end;

procedure TFMAcreedores.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  inherited;
  Resultado := DMAcreedores.BusquedaCompleja;
  if (Resultado in [mrOk, mrAll]) then
  begin
     SWFil := 1;
     SWEnlace := 0;
  end;
  Continua := False;
  Notas;
end;

procedure TFMAcreedores.MuestraFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMAcreedores.QMAcreedores.SelectSQL);
  AbreData(TDMlstAcreedor, DMlstAcreedor);
  TempSql.AddStrings(DMLstAcreedor.QMAcreedor.SelectSQL);
  DMlstAcreedor.QMAcreedor.Close;
  DMLstAcreedor.QMAcreedor.SelectSQL.Assign(SqlFiltro);
  DMLstAcreedor.MostrarFiltrado(Modo);
  DMlstAcreedor.QMAcreedor.Close;
  DMLstAcreedor.QMAcreedor.SelectSQL.Assign(TempSQL);
  CierraData(DMlstAcreedor);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMAcreedores.MuestraFiltradoFiscal(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMAcreedores.QMAcreedores.SelectSQL);
  AbreData(TDMlstAcreedor, DMlstAcreedor);
  TempSql.AddStrings(DMLstAcreedor.QMAcreedor.SelectSQL);
  DMlstAcreedor.QMAcreedor.Close;
  DMLstAcreedor.QMAcreedor.SelectSQL.Assign(SqlFiltro);
  DMLstAcreedor.MostrarFiltradoFiscal(Modo);
  DMlstAcreedor.QMAcreedor.Close;
  DMLstAcreedor.QMAcreedor.SelectSQL.Assign(TempSQL);
  CierraData(DMlstAcreedor);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMAcreedores.TbuttImprimirClick(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMAcreedores.MIConfAcreedoresFiscalClick(Sender: TObject);
begin
end;

{ Filtra por Acreedores }
procedure TFMAcreedores.FiltraAcreedores(Filtro: string);
var
  Parametro : TParametroFiltrado;
begin
  PCMain.ActivePage := TSFicha;

  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     Parametro.SQLBase.Text := DMAcreedores.SQLBase.Text;
     Parametro.Tabla := DMAcreedores.QMAcreedores;
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

procedure TFMAcreedores.Tercero_a_Acreedor(Tercero: integer);
begin
  DMAcreedores.CambiarTercero(Tercero);

  if (REntorno.Acreedor_aut) then
     DBEFTipo.SetFocus
  else
     DBEAcreedor.SetFocus;
end;

procedure TFMAcreedores.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  i : integer;
  esta : boolean;
begin
  inherited;

  Notas;

  if FMain.sourcecall = True then
  begin
     FMain.sourcecall := False;
     Close;
  end
  else
  if FMain.autacreedor then
  begin
     esta := False;
     with Application do
        for i := 0 to (ComponentCount - 1) do
           if (('T' + Components[i].Name) = TFMTerceros.ClassName) then
              esta := True;

     if esta then
        FMTerceros.CierraAcreedor
     else
     begin
        FMain.autacreedor := False;
        Close;
     end;
  end;
end;

procedure TFMAcreedores.DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBECuenta);
end;

procedure TFMAcreedores.HabilitarPunto;
begin
  FMain.AddComponentePunto(DBECuenta);
  FMain.AddComponentePunto(DBEFCuentaDtoPP);
  FMain.AddComponentePunto(DBEFCuentaIRPF);
  FMain.AddComponentePunto(DBEFCtaGastos);
end;

procedure TFMAcreedores.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(DBECuenta);
  FMain.DelComponentePunto(DBEFCuentaDtoPP);
  FMain.DelComponentePunto(DBEFCuentaIRPF);
  FMain.DelComponentePunto(DBEFCtaGastos);
end;

procedure TFMAcreedores.ANewTerceroExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.SourceCallTer := True;
     FMain.EjecutaAccion(FMain.ATerceros);
     FMTerceros.InsertarTercero;
  end;
end;

procedure TFMAcreedores.DBEFCtaGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     ExpandirCadenaEdit(DBEFCtaGastos);
end;

procedure TFMAcreedores.DBEFCtaGastosExit(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(DBEFCtaGastos);
end;

procedure TFMAcreedores.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if DBEFTercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBEFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DMAcreedores.QMAcreedoresTERCERO.AsInteger));
end;

procedure TFMAcreedores.SBATerceroDblClick(Sender: TObject);
begin
  AATercero.Execute;
end;

procedure TFMAcreedores.HabilitaEnlaces;
begin
  if (FMain.ATerceros.Enabled = False) then
  begin
     DBEFTercero.Accion := nil;
     SBATercero.Width := 0;
     MIVerDatosTercero.Visible := False;
     MISepEnlaces.Visible := False;
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

  if (FMain.AContaExtracto.Enabled = False) then
  begin
     DBECuenta.Color := clInfoBk;
  end
  else
  begin
     SolapaControles(SBAContaExtracto, DBECuenta);
     DBECuenta.Color := REntorno.ColorEnlaceActivo;
  end;

  SolapaControles(SBVerFacPend, LFDEFactPendLIQUIDO);
  LFDEFactPendLIQUIDO.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerFacCob, LFDFactCobrBASE);
  LFDFactCobrBASE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerImpagados, LFDERecImpagadosIMPORTE);
  LFDERecImpagadosIMPORTE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerNoCob, LFDERecNoCobradosIMPORTE);
  LFDERecNoCobradosIMPORTE.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerPendientes, LFDERecPendIMPORTE);
  LFDERecPendIMPORTE.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMAcreedores.DBETituloTerceroEnter(Sender: TObject);
begin
  if DBEFTercero.Enabled then
     DBEFTercero.SetFocus
  else
     DBEFTipo.SetFocus;
end;

procedure TFMAcreedores.AVisualizarListadoAcreedoresExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMAcreedores.AImprimirListadoAcreedoresExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMAcreedores.AVisualizarDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(0);
end;

procedure TFMAcreedores.AImprimirDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(1);
end;

procedure TFMAcreedores.AListadoDireccionesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(2);  // Previsualizar List. Dir. Acreedores
end;

procedure TFMAcreedores.AImprimirLstDireccionesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(3);  // Imprimir List. Dir. Acreedores
end;

procedure TFMAcreedores.AConfAcreedoresExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAcreedor, DMLstAcreedor);
  TFMListConfig.Create(Self).Muestra(11, formato, cabecera, copias,
     pijama, '', DMLstAcreedor.frAcreedor);
  CierraData(DMLstAcreedor);
end;

procedure TFMAcreedores.AConfAcreedoresFiscalExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAcreedor, DMLstAcreedor);
  TFMListConfig.Create(Self).Muestra(12, formato, cabecera, copias,
     pijama, '', DMLstAcreedor.frAcreedor);
  CierraData(DMLstAcreedor);
end;

procedure TFMAcreedores.AConfListDireccionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAcreedor, DMLstAcreedor);
  TFMListConfig.Create(Self).Muestra(80, formato, cabecera, copias,
     pijama, '', DMLstAcreedor.frAcreedor);
  CierraData(DMLstAcreedor);
end;

procedure TFMAcreedores.ALstCargaTransportistaExecute(Sender: TObject);
begin
  inherited;
  TFpregTransportistaCarga.Create(Self).ShowModal;
end;

procedure TFMAcreedores.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMAcreedores.ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = VK_RETURN then
     ExpandirCadenaCta(Sender);
end;

procedure TFMAcreedores.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMAcreedores.AIncidenciasExecute(Sender: TObject);
begin
  with DMAcreedores do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMAcreedoresACREEDOR.AsInteger,
        QMAcreedoresTERCERO.AsInteger, 2, 0, 1);
  end;
end;

procedure TFMAcreedores.DBGIncidenciasDblClick(Sender: TObject);
begin
  with DMAcreedores do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMAcreedoresACREEDOR.AsInteger,
        QMAcreedoresTERCERO.AsInteger, 2, xIncidenciasINCIDENCIA.AsInteger, 1);
  end;
end;

procedure TFMAcreedores.DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMAcreedores.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
        CeldaEnlace(DBGIncidencias, Rect);
  end;
end;

procedure TFMAcreedores.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMAcreedores.QuitaFiltros;
  G2KTableLoc.Click;
end;

procedure TFMAcreedores.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  DBCHTransportistaRapidoKri.Visible := DMAcreedores.QMAcreedoresTIPO.AsInteger = 7;
  DBCHTransportistaCreaRuta.Visible := DMAcreedores.QMAcreedoresTIPO.AsInteger = 7;
  DBCHTransportistaGeneraEnvio.Visible := DMAcreedores.QMAcreedoresTIPO.AsInteger = 7;
  TSTarifaPortes.TabVisible := DMAcreedores.QMAcreedoresTIPO.AsInteger = 7;
end;

procedure TFMAcreedores.TSEstadisticasShow(Sender: TObject);
begin
  inherited;
  LFPCEstadisticas.ActivePage := TSDocumentos;

  DMAcreedores.MuestraDocumentos;
  //Moneda

  LFEEstadoRecPend.Text := REntorno.MonedaEmpresa;
  LFEEstadoRecNoCob.Text := REntorno.MonedaEmpresa;
  LFEEstadoRecImp.Text := REntorno.MonedaEmpresa;
  LFEAnticipo.Text := REntorno.MonedaEmpresa;
  LFEPPRecibir.Text := REntorno.MonedaEmpresa;
  LFEPPCobrar.Text := REntorno.MonedaEmpresa;
  LFEFactPend.Text := REntorno.MonedaEmpresa;
  LFEFactCobr.Text := REntorno.MonedaEmpresa;
end;

procedure TFMAcreedores.ACalculaEstadisticasExecute(Sender: TObject);
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

  DMAcreedores.CargaEstadisticas(StrToInt(EEjercicio.Text),
     StrToInt(EEjercicio2.Text), Copy(CBMonedas.Text, 1, Pos(' ', CBMonedas.Text) - 1), StrToFloat(EPorcentajeEstimacion.Text), CBTipoDoc.Text);
end;

procedure TFMAcreedores.ARecibosPendientesNoCobExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.FiltraClientes(REntorno.Empresa, REntorno.Canal,
     4, DMAcreedores.DameCuenta);
end;

procedure TFMAcreedores.AFactPendDetExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'Empresa=' + IntToStr(REntorno.Empresa) +
     ' AND Canal=' + IntToStr(REntorno.Canal) +
     ' AND Acreedor=' + IntToStr(DMAcreedores.DameAcreedor) +
     ' AND tipo=''FCR'' and estado=0';
  FMain.EjecutaAccion(FMain.AFiltroFacturasAcr, Filtro);
end;

procedure TFMAcreedores.AFactCobDetExecute(Sender: TObject);
var
  Filtro : string;
begin
  Filtro := 'Empresa=' + IntToStr(REntorno.Empresa) +
     ' AND Canal=' + IntToStr(REntorno.Canal) +
     ' AND Acreedor=' + IntToStr(DMAcreedores.DameAcreedor) +
     ' AND tipo=''FCR'' and estado=5';
  FMain.EjecutaAccion(FMain.AFiltroFacturasAcr, Filtro);
end;

procedure TFMAcreedores.TSEstadisticasHide(Sender: TObject);
begin
  inherited;
  DMAcreedores.CierraDocumentos;
  DMAcreedores.CierraEstadisticas;
end;

procedure TFMAcreedores.ARecibosImpagadosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.EFCliDesde.Text := DMAcreedores.DameCuenta;
  FMain.EjecutaAccion(FMRecibosPendientes.AMostrarImpagados, );
end;

procedure TFMAcreedores.MuestraGrafico(Tipo: integer);
begin
  TipoGrafica := Tipo;
  FGrafico := TFGrafico.Create(Self);

  //posicion de la ventana
  FGrafico.Left := Left;
  FGrafico.Top := Top;

  FGrafico.Formulario := 2;
  FGrafico.Tipo := Tipo;
  FGrafico.Tercero := StrToInt(LFEstadAcr.Text);
  FGrafico.Ejercicio := StrToInt(EEjercicio.Text);
  FGrafico.Ejercicio2 := StrToInt(EEjercicio2.Text);
  FGrafico.Porcent := StrToFloat(EPorcentajeEstimacion.Text);
  FGrafico.Moneda := Copy(CBMonedas.Text, 1, Pos(' ', CBMonedas.Text) - 1);

  FGrafico.ShowModal;
  FGrafico.Free;
end;

procedure TFMAcreedores.DBCAnualDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(0);
end;

procedure TFMAcreedores.DBCMensualDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(1);
end;

procedure TFMAcreedores.DBCPrevisionDblClick(Sender: TObject);
begin
  inherited;
  MuestraGrafico(2);
end;

procedure TFMAcreedores.ARecibosPendientesPendExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
  FMRecibosPendientes.FiltraClientes(REntorno.Empresa, REntorno.Canal,
     5, DMAcreedores.DameCuenta);
end;

procedure TFMAcreedores.BBMultiSelectClick(Sender: TObject);
begin
  inherited;
  { TODO : Reemplazar por DMMain.RellenaCanales, si funcionan igual}
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFMAcreedores.TSComunicacionesShow(Sender: TObject);
begin
  inherited;
  DMAcreedores.xComunicaciones.Open;
end;

procedure TFMAcreedores.TSComunicacionesHide(Sender: TObject);
begin
  inherited;
  DMAcreedores.xComunicaciones.Close;
end;

procedure TFMAcreedores.EFComunicacionesBusquedaBusqueda(Sender: TObject);
begin
  inherited;
  EFComunicacionesBusqueda.CondicionBusqueda := 'TIPO=''ACR'' AND COD_CLI_PRO=' + DMAcreedores.QMAcreedoresACREEDOR.AsString;
end;

procedure TFMAcreedores.EFComunicacionesBusquedaChange(Sender: TObject);
begin
  inherited;
  Refrescar(DMAcreedores.xComunicaciones, 'ID', StrToIntDef(EFComunicacionesBusqueda.Text, 0));
end;

procedure TFMAcreedores.DBGComunicacionesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMAcreedores.DBGComunicacionesDblClick(Sender: TObject);
begin
  inherited;
  with DMAcreedores.xComunicaciones do
  begin
     if ((RecordCount > 0) and (State = dsBrowse)) then
     begin
        Edit;
        DMAcreedores.xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
        Post;
        if (UpperCase(ColActual.FieldName) = 'ARCHIVO') then
           AbreWord(DMMain.DameDirectorioCodCliPro('ACR', DMAcreedores.xComunicacionesCOD_CLI_PRO.AsInteger) + DMAcreedores.xComunicacionesARCHIVO.AsString);
     end;
  end;
end;

procedure TFMAcreedores.DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (DMAcreedores.xComunicaciones.RecordCount > 0) then
     if (UpperCase(Column.FieldName) = 'ARCHIVO') then
        CeldaEnlace(DBGComunicaciones, Rect);
end;

procedure TFMAcreedores.NavComunicacionesChangeState(Sender: TObject);
begin
  inherited;
  with DBGComunicaciones do
  begin
     ColumnaInicial := 0;
     while ((ColumnaInicial <= Columns.Count - 1) and (Columns[ColumnaInicial].FieldName = 'DESCRIPCION')) do
        ColumnaInicial := ColumnaInicial + 1;
  end;
end;

procedure TFMAcreedores.AEnviarComunicacionXMailExecute(Sender: TObject);
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

           Subject := DMAcreedores.xComunicacionesDESCRIPCION.AsString;

           CuerpoMail := TStringList.Create;
           CuerpoMail.Add(_('Este correo ha sido enviado desde :'));
           CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
           CuerpoMail.Add('');
           CuerpoMail.Add(_('y contiene el fichero adjunto ') + UpperCase(DMAcreedores.xComunicacionesARCHIVO.AsString));
           CuerpoMail.Add('------------------------------------------------------------');
           CuerpoMail.Add(_('This is an automatic message send from :'));
           CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
           CuerpoMail.Add('');
           CuerpoMail.Add(_('We attached the file ') + UpperCase(DMAcreedores.xComunicacionesARCHIVO.AsString));

           FSendCorreo.Texto(_('Enviando Mensaje  ...'));
           Application.ProcessMessages;

           DMListados.SendMailTerceroPDF(DMAcreedores.QMAcreedoresTERCERO.AsInteger, CuerpoMail,
              DMMain.DameDirectorioCodCliPro('ACR', DMAcreedores.xComunicacionesCOD_CLI_PRO.AsInteger) + DMAcreedores.xComunicacionesARCHIVO.AsString, DMAcreedores.xComunicacionesARCHIVO.AsString, Subject, 'ACR', DMAcreedores.xComunicacionesCOD_CLI_PRO.AsInteger);

           CuerpoMail.Free;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
           Application.ProcessMessages;
        end;
     except
        begin
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));
           Application.ProcessMessages;

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

procedure TFMAcreedores.AImportarArchivoComunicacionExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'PDF,DOC,XLS,ODT,ODS,TXT', '', 'FMAcreedores') then
  begin
     if CopyFileTo(Archivo, DMMain.DameDirectorioCodCliPro('ACR', DMAcreedores.QMAcreedoresACREEDOR.AsInteger) + ExtractFileName(Archivo)) then
     begin
        with DMAcreedores.xComunicaciones do
        begin
           if (State = dsBrowse) then
           begin
              Insert;
              DMAcreedores.xComunicacionesARCHIVO.AsString := ExtractFileName(Archivo);
              DBGComunicaciones.SetFocus;
              //Post;
           end;
        end;
     end;
  end;
end;

procedure TFMAcreedores.PMPlantillasComunicacionesItemOnClick(Sender: TObject);
begin
  DMAcreedores.PlantillaComunicaciones := TMenuItem(Sender).Caption;
  with DMAcreedores.xComunicaciones do
  begin
     if (State = dsBrowse) then
     begin
        Insert;
        DBGComunicaciones.SetFocus;
     end;
  end;
end;

procedure TFMAcreedores.AAdjuntosAcreedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DMAcreedores.QMAcreedoresACREEDOR.AsInteger));
end;

procedure TFMAcreedores.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMAcreedores.QMAcreedoresTERCERO.AsInteger);
end;

procedure TFMAcreedores.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
end;

procedure TFMAcreedores.DBCHKBajaChange(Sender: TObject);
begin
  inherited;
  DBDTPFechaBaja.Visible := DBCHKBaja.Checked;
  DBEMotivoBaja.Visible := DBCHKBaja.Checked;
end;

procedure TFMAcreedores.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del acreedor %d - %s'), [DMAcreedores.QMAcreedoresACREEDOR.AsInteger, DMAcreedores.QMAcreedoresTITULO.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMMNotas.Lines);
     s.Add('----------------------------------------------------------------------');
     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMAcreedores.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  ETituloIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMAcreedores.DBEFBancoParaPagosChange(Sender: TObject);
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

procedure TFMAcreedores.TSGraficosShow(Sender: TObject);
begin
  inherited;
  if (CBTipoDoc.Text = '') then
     CBTipoDoc.ItemIndex := 0;
end;

procedure TFMAcreedores.TSComprasShow(Sender: TObject);
begin
  inherited;
  DBGComprasDocumento.DataSource := DMAcreedores.DSxCompras;
  DBGComprasDetalle.DataSource := DMAcreedores.DSxComprasDetalle;
  NavCompras.DataSource := DMAcreedores.DSxCompras;
end;

procedure TFMAcreedores.TSComprasHide(Sender: TObject);
begin
  inherited;
  DMAcreedores.xCompras.Close;
  DMAcreedores.xComprasDetalle.Close;
end;

procedure TFMAcreedores.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSCompras) then
     FiltroComprasChange(Sender);
end;

procedure TFMAcreedores.DBGComprasDocumentoCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMAcreedores.FiltroComprasChange(Sender: TObject);
var
  TipoDocumento, Serie : string;
begin
  inherited;
  if (PCMain.ActivePage = TSCompras) then
  begin
     if (CBSerieCompra.Items[CBSerieCompra.ItemIndex] = _('Todas las Series')) then
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
     DMAcreedores.FiltraCompras(TipoDocumento, Serie, DEFechaComprasDesde.Date, DEFechaComprasHasta.Date, EFArticuloCompras.Text, Trim(EDescripcion.Text), CBSoloFacturasAbiertas.Checked);
  end;
end;

procedure TFMAcreedores.TSComprasDetalleShow(Sender: TObject);
begin
  inherited;
  NavCompras.DataSource := DMAcreedores.DSxCompras;
end;

procedure TFMAcreedores.TSComrasDocumentosShow(Sender: TObject);
begin
  inherited;
  NavCompras.DataSource := DMAcreedores.DSxComprasDetalle;
end;

procedure TFMAcreedores.DBGComprasDocumentoDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
     if (DMAcreedores.xComprasCANAL.AsInteger = REntorno.Canal) then
        FMain.TraspasoDeDocumentosEntrada(DMAcreedores.xComprasID_E.AsInteger)
     else
        ShowMessage(_('El documento se encuentra en otro canal'));
end;

procedure TFMAcreedores.DBGComprasDocumentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMAcreedores.DBGComprasDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMAcreedores.DBGComprasDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
     if (DMAcreedores.xComprasDetalleCANAL.AsInteger = REntorno.Canal) then
        FMain.TraspasoDeDocumentosEntrada(DMAcreedores.xComprasDetalleID_E.AsInteger)
     else
        ShowMessage(_('El documento se encuentra en otro canal'));
end;

procedure TFMAcreedores.DBEFCuentaIRPFChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFCuentaIRPF.Text) = '') then
     ETituloCuentaIRPF.Text := _('Segun configuracion')
  else
     ETituloCuentaIRPF.Text := DameTituloCuenta(DBEFCuentaIRPF.Text);
end;

procedure TFMAcreedores.DBGTarifaPortesBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'SYS_ZONAS') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ZONA';
     end
     else
     if (Trim(TablaABuscar) = 'SYS_PAISES') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PAIS';
     end
     else
     if (Trim(TablaABuscar) = 'SYS_LOCALIDADES') then
     begin
        CondicionBusqueda := 'PAIS =''' + DMAcreedores.xTarifaPortesPAIS.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO_POSTAL';
     end
     else
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMAcreedores.SBAContaExtractoDblClick(Sender: TObject);
begin
  inherited;
  AContaExtracto.Execute;
end;

procedure TFMAcreedores.AContaExtractoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AContaExtracto, DBECuenta.Text);
end;

procedure TFMAcreedores.AConfigCircularizacionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  TFMListConfig.Create(Self).Muestra(646, Formato, Cabecera, Copias, Pijama, '', DMLstCircularizacion.frCircularizacion);
  CierraData(DMLstCircularizacion);
end;

procedure TFMAcreedores.AVisualizarCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DMAcreedores.ImprimirCircularizacion(0, False);
end;

procedure TFMAcreedores.AImprimirCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DMAcreedores.ImprimirCircularizacion(1, False);
end;

procedure TFMAcreedores.AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DMAcreedores.ImprimirCircularizacion(2, False, True);
end;

procedure TFMAcreedores.AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
begin
  inherited;
  DMAcreedores.ImprimirCircularizacion(2, True);
end;

procedure TFMAcreedores.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('ACR', DMAcreedores.QMAcreedoresID_ACREEDOR.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosAcreedor.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMAcreedores.Notas;
begin
  { No implementado
  LBNotas.Visible := False;
  RelojNotas.Enabled := ((DMAcreedores.QMAcreedores.Active) and (Trim(DMAcreedores.QMAcreedoresNOTAS.AsString) <> ''));
  }
end;

procedure TFMAcreedores.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbEdit) then
  begin
     DBEAcreedor.ReadOnly := True;
     DBEAcreedor.Enabled := False;
     DBEAcreedor.ReadOnly := not DBEAcreedor.Enabled;
     DBEFTercero.Enabled := False;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorInfo(DBEFTercero);
  end
  else
  if (Button = nbInsert) then
  begin
     if (REntorno.Acreedor_aut) then
     begin
        ColorCampoID(DBEAcreedor);
        DBEAcreedor.Enabled := False;
        DBEAcreedor.ReadOnly := not DBEAcreedor.Enabled;
     end
     else
     begin
        ColorEdicion(DBEAcreedor);
        DBEAcreedor.Enabled := True;
        DBEAcreedor.ReadOnly := not DBEAcreedor.Enabled;
     end;

     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorEdicion(DBEFTercero);
  end
  else
  begin
     DBEAcreedor.Enabled := True;
     DBEAcreedor.ReadOnly := not DBEAcreedor.Enabled;
     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorCampoID(DBEAcreedor);
     ColorEdicion(DBEFTercero);
  end;
end;

procedure TFMAcreedores.DBEFProyectoChange(Sender: TObject);
begin
  inherited;
  EProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyecto.Text, 0));
end;

end.
