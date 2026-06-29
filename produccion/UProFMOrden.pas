unit UProFMOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, UDBDateTimePicker, ExtDlgs, DB, NsDBGrid, rxPlacemnt, rxToolEdit,
  RXDBCtrl, ImgList, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBCheckBox, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox, Buttons,
  TeEngine, Series, TeeProcs, Chart, DbChart, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, ULFLabel, ULFEdit,
  ULFComboBox, ULFEditFind2000, FIBQuery, HYFIBQuery, URecursos, ULFDBDateEdit,
  TFlatButtonUnit;

type
  TProFMOrden = class(TFPEdit)
     LblOrden: TLFLabel;
     LblSuborden: TLFLabel;
     LblCliente: TLFLabel;
     LblAlmSalida: TLFLabel;
     DBESubOrden: TLFDbedit;
     DBEOrden: TLFDbedit;
     LblFecha: TLFLabel;
     LPedido: TLFLabel;
     LLineaPedido: TLFLabel;
     LFechaPedido: TLFLabel;
     DBCBActivo: TLFDBCheckBox;
     LblMerma: TLFLabel;
     LblPrioridad: TLFLabel;
     LblFechaFin: TLFLabel;
     LblFechaIni: TLFLabel;
     LblFechaEnt: TLFLabel;
     LblUdsPed: TLFLabel;
     LblUndsMan: TLFLabel;
     LblUdsTot: TLFLabel;
     LblUdsProd: TLFLabel;
     LblUdsPend: TLFLabel;
     DBEUdsPend: TLFDbedit;
     DBEUdsProd: TLFDbedit;
     DBEUdsTotal: TLFDbedit;
     DBEUniManual: TLFDbedit;
     DBEMerma: TLFDbedit;
     DBEPrioridad: TLFDbedit;
     DBEUdsPedido: TLFDbedit;
     LblAlmLanz: TLFLabel;
     LblAlmEntrada: TLFLabel;
     LEscandallo: TLFLabel;
     DBCBVistoBueno1: TLFDBCheckBox;
     DBCBVistoBueno2: TLFDBCheckBox;
     DBCBVistoBueno3: TLFDBCheckBox;
     TSNotas: TTabSheet;
     TSDesarrollo: TTabSheet;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     PNFases: TLFPanel;
     PCFases: TLFPageControl;
     TSFases: TTabSheet;
     DBGFFases: TDBGridFind2000;
     TSNotasFases: TTabSheet;
     TBNotasDesarrollo: TLFToolBar;
     DBENotasFaseRig: TLFDbedit;
     DBENotasFaseCompuesto: TLFDbedit;
     NavNotasFases: THYMNavigator;
     TSDibujoFases: TTabSheet;
     TBDibujo: TLFToolBar;
     DBEDibFaseRig: TLFDbedit;
     DBEDibFaseCompuesto: TLFDbedit;
     PNMatTarea: TLFPanel;
     PCMatTarea: TLFPageControl;
     TSMateriales: TTabSheet;
     TBMateriales: TLFToolBar;
     TBNotasEstilo: TLFToolBar;
     NavMateriales: THYMNavigator;
     DBGFMateriales: TDBGridFind2000;
     TSTareas: TTabSheet;
     TBTareas: TLFToolBar;
     NavTarea: THYMNavigator;
     DBGFTareas: TDBGridFind2000;
     DBEFAlmSal: TLFDBEditFind2000;
     DBEFAlmLan: TLFDBEditFind2000;
     DBEFAlmEnt: TLFDBEditFind2000;
     DBEFEscandallo: TLFDBEditFind2000;
     DBDTPFecha: TLFDBDateEdit;
     DBEFechaPedido: TLFDbedit;
     TBFases: TLFToolBar;
     NavFases: THYMNavigator;
     DBEFCliente: TLFDBEditFind2000;
     DBEFCompuesto: TLFDBEditFind2000;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     CEFases: TControlEdit;
     CEFasesPMEdit: TPopUpTeclas;
     CENotasFases: TControlEdit;
     CENotasFasesPMEdit: TPopUpTeclas;
     CEMateriales: TControlEdit;
     CEMaterialesPMEdit: TPopUpTeclas;
     CETareas: TControlEdit;
     CETareasPMEdit: TPopUpTeclas;
     Imagen: TImage;
     TSNav: TTabSheet;
     LRelacionMateriales: TLFLabel;
     LRelacionTareas: TLFLabel;
     LRelacionFases: TLFLabel;
     LRelacionOrdenes: TLFLabel;
     LRelacionSubordenes: TLFLabel;
     Orden: TLFLabel;
     DBDFechaIni: TLFDBDateEdit;
     DBDFechaFin: TLFDBDateEdit;
     DBDFechaEnt: TLFDBDateEdit;
     ALOrden: TActionList;
     LFCategoryAction1: TLFCategoryAction;
     AVisualizarCostes: TAction;
     ASituacionSiguiente: TAction;
     ALanzarMasReservar: TAction;
     ASituacionAnterior: TAction;
     TSepMat1: TToolButton;
     TBInfoLotes: TToolButton;
     ASerializarComp: TAction;
     AHistNSeries: TAction;
     ALotesCompuesto: TAction;
     AProLstOrden: TAction;
     AProLstHojaMontaje: TAction;
     AProLstNecesidades: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AACompuesto: TAction;
     SBACompuesto: TSpeedButton;
     ANewArticulo: TAction;
     SBACliente: TSpeedButton;
     AACliente: TAction;
     ANewCliente: TAction;
     TBSerializacion: TToolButton;
     ASerializacion: TAction;
     TSGrafico: TTabSheet;
     TBGrafico: TLFToolBar;
     PNLGrafico: TLFPanel;
     DBChartRecursos: TDBChart;
     ButtZoomMas: TFlatButton;
     ButtZoomMenos: TFlatButton;
     ButtCopiarPortapapeles: TFlatButton;
     TButtSepTareas: TToolButton;
     TButtGraficoTareas: TToolButton;
     TSepMat2: TToolButton;
     TButtGraficoMateriales: TToolButton;
     ToolButton7: TToolButton;
     TButtGraficoCostesFases: TToolButton;
     ANotasMateriales: TAction;
     ANotasTareas: TAction;
     TButtNotasMat: TToolButton;
     TButtNotasTarea: TToolButton;
     SBAEscandallo: TSpeedButton;
     AAEscandallo: TAction;
     TButtInforme: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     AIsoAprobado: TAction;
     AIsoVerificado: TAction;
     AIsoValidado: TAction;
     TSepTrabExt: TToolButton;
     TButtTrabExt: TToolButton;
     GBFirmas: TGroupBox;
     ChkBAprobado: TLFCheckBox;
     ChkBVerificado: TLFCheckBox;
     ChkBValidado: TLFCheckBox;
     NavDibujoFases: THYMNavigator;
     DBEFImagen: TLFFibDBEditFind;
     ETituloImagen: TLFEdit;
     LblImagen: TLFLabel;
     CEImagenesFases: TControlEdit;
     CEImagenesFasesPMEdit: TPopUpTeclas;
     DBEDescCompuesto: TLFDbedit;
     EDescAlmacenSal: TLFEdit;
     EDescAlmacenLan: TLFEdit;
     EDescAlmacenEnt: TLFEdit;
     DBEDescCliente: TLFDbedit;
     AProLstHojaTrabajo: TAction;
     DBEPedido: TLFDbedit;
     DBELineaPed: TLFDbedit;
     DBMNotas: TDBRichEdit;
     TButtUndo: TToolButton;
     TButtCut: TToolButton;
     TButtCopy: TToolButton;
     TButtPaste: TToolButton;
     ToolButton6: TToolButton;
     FontName: TLFComboBox;
     FontSize: TLFEdit;
     UpDown1: TUpDown;
     ToolButton3: TToolButton;
     TButtNegrita: TToolButton;
     TButtCursiva: TToolButton;
     TButtSubrayado: TToolButton;
     ToolButton1: TToolButton;
     TButtLeftAlign: TToolButton;
     TButtCenterAlign: TToolButton;
     TButtRightAlign: TToolButton;
     DBMNotasFases: TDBRichEdit;
     TBNotasDesarrolloEstilo: TLFToolBar;
     TButtUndoFase: TToolButton;
     TButtCutFase: TToolButton;
     TButtCopyFase: TToolButton;
     TButtPasteFase: TToolButton;
     ToolButton9: TToolButton;
     FontNameFase: TLFComboBox;
     FontSizeFase: TLFEdit;
     UpDown2: TUpDown;
     ToolButton10: TToolButton;
     TButtNegritaFase: TToolButton;
     TButtCursivaFase: TToolButton;
     TButtSubrayadoFase: TToolButton;
     ToolButton14: TToolButton;
     TButtLeftAlignFase: TToolButton;
     TButtCenterAlignFase: TToolButton;
     TButtRightAlignFase: TToolButton;
     TButtColor: TToolButton;
     TButtColorFase: TToolButton;
     TBUbicacion: TToolButton;
     DBDTPFechaIniTime: TDBDateTimePicker;
     DBDTPFechaFinTime: TDBDateTimePicker;
     TButtInfStocksMaterial: TToolButton;
     TSepMat3: TToolButton;
     TSepMat4: TToolButton;
     TButtEquivalenciaLinea: TToolButton;
     AInfoStocks: TAction;
     AEquivalenciaLinea: TAction;
     AUbicacion: TAction;
     AUbicacionComp: TAction;
     TSMatCompra: TTabSheet;
     TBMatCompras: TLFToolBar;
     DBGFMatCompras: TDBGridFind2000;
     NavMatCompras: THYMNavigator;
     TSepCompras: TToolButton;
     CBFiltroCompras: TLFComboBox;
     TSepComprasBut: TToolButton;
     TButtOrigenCompra: TToolButton;
     AOrigenCompra: TAction;
     PNNotasFases: TLFPanel;
     PNNotas: TLFPanel;
     LPadreOF: TLFLabel;
     LFDBPadreOF: TLFDbedit;
     LNumeroSub: TLFLabel;
     LFDBExecSuborden: TLFDbedit;
     LblSerie: TLFLabel;
     ToolButton5: TToolButton;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     LReferencia: TLFLabel;
     DBERef: TLFDbedit;
     PnlSerie: TLFPanel;
     ALstOrdenCodBar: TAction;
     LIDOrden: TLFLabel;
     LFDBIdOrden: TLFDbedit;
     LEstado: TLFLabel;
     LFDBEstado: TLFDbedit;
     ALstEtiOrden: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AMovStocks: TAction;
     TSCostes: TTabSheet;
     LFTBCostes: TLFToolBar;
     NavCostes: THYMNavigator;
     PCostes: TLFPanel;
     LblCosteFijoPre: TLFLabel;
     DBECosteFijoPre: TLFDbedit;
     DBECosteFijoReal: TLFDbedit;
     LblCosteUds: TLFLabel;
     DBECosteUdsPre: TLFDbedit;
     DBEPrecioVUniReal: TLFDbedit;
     LblPrecioVenta: TLFLabel;
     DBECosteVariosReal: TLFDbedit;
     DBECosteVarioPre: TLFDbedit;
     LblCosteVarPre: TLFLabel;
     LblCosteMatPre: TLFLabel;
     DBECosteMatPre: TLFDbedit;
     DBECosteMOPre: TLFDbedit;
     LblCosteMOPre: TLFLabel;
     LblCosteMaqPre: TLFLabel;
     DBECosteMaqPre: TLFDbedit;
     DBECosteTExtPre: TLFDbedit;
     LblCosteTextPre: TLFLabel;
     LCosteTotPre: TLFLabel;
     DBECosteTotalPre: TLFDbedit;
     DBECosteTotalReal: TLFDbedit;
     DBECosteTExtReal: TLFDbedit;
     DBECosteMaqReal: TLFDbedit;
     DBECosteMOReal: TLFDbedit;
     DBECosteCompras: TLFDbedit;
     DBECosteMatReal: TLFDbedit;
     LblMargen: TLFLabel;
     DBEMargenPre: TLFDbedit;
     DBEMargenUdsPre: TLFDbedit;
     LblMargenUnd: TLFLabel;
     LblMargenTotal: TLFLabel;
     DBEMargenTotalPre: TLFDbedit;
     DBEHorasOperarioReal: TLFDbedit;
     LblHorasTotales: TLFLabel;
     LCostesHorasMaquina: TLFLabel;
     DBEHorasMaquinaReal: TLFDbedit;
     RGImportar: TRadioGroup;
     RGCaso: TRadioGroup;
     LFCerrarSubOP: TLFDBCheckBox;
     LFCheckPrevaleceAlm: TLFDBCheckBox;
     LFReservaStock: TLFDBCheckBox;
     CECostes: TControlEdit;
     CECostesPMEdit: TPopUpTeclas;
     ToolButton13: TToolButton;
     BSituacionSiguiente: TToolButton;
     BSituacionAnterior: TToolButton;
     LblMedida1: TLFLabel;
     DBEMedida1: TLFDbedit;
     LblMedida2: TLFLabel;
     DBEMedida2: TLFDbedit;
     LblMedida3: TLFLabel;
     DBEMedida3: TLFDbedit;
     LblMedida4: TLFLabel;
     DBEMedida4: TLFDbedit;
     TBDocumentos: TToolButton;
     ADocumentos: TAction;
     BtIntroduceMedidas: TToolButton;
     LResponsable: TLFLabel;
     LFResponsable: TLFDBEditFind2000;
     EDescResponsable: TLFEdit;
     TBCarpetas: TToolButton;
     DBDifCosteFijo: TLFDbedit;
     DBDifCosteMat: TLFDbedit;
     DBDifCosteMO: TLFDbedit;
     DBDifCosteMaq: TLFDbedit;
     DBDifCosteText: TLFDbedit;
     DBDifCosteVar: TLFDbedit;
     DBDifCosteCompras: TLFDbedit;
     DBDifCosteTot: TLFDbedit;
     LFCategoryAction5: TLFCategoryAction;
     ARecalculoTodos: TAction;
     AProRecalculoID: TAction;
     DBChartCostes: TDBChart;
     LCostesCosteCompra: TLFLabel;
     DBECosteComprasPre: TLFDbedit;
     LFCompVirtuales: TLFDBCheckBox;
     ARecuperarPrecioV: TAction;
     SBAPedido: TSpeedButton;
     APedido: TAction;
     LCostesPrevistos: TLFLabel;
     LCostesReales: TLFLabel;
     LCostesDiferencia: TLFLabel;
     DBEMargenTReal: TLFDbedit;
     DBEDifMargenTot: TLFDbedit;
     DBEPrecioVentaReal: TLFDbedit;
     DBDifPrecioVenta: TLFDbedit;
     DBEMargenCentReal: TLFDbedit;
     DBDifMargenCent: TLFDbedit;
     LCostesUnidades: TLFLabel;
     DBEUniPre: TLFDbedit;
     DBEUniReal: TLFDbedit;
     DBEDifUni: TLFDbedit;
     LCostesPrecioVentaUnidades: TLFLabel;
     DBEPrecioVUniPre: TLFDbedit;
     DBEPrecioVentaPre: TLFDbedit;
     DBDifPrecioVUni: TLFDbedit;
     DBECosteUdsReal: TLFDbedit;
     DBEMargenUdsReal: TLFDbedit;
     DBEHorasMaquinaPre: TLFDbedit;
     DBEHorasOperarioPre: TLFDbedit;
     DBDifCosteUds: TLFDbedit;
     DBDifMargenUds: TLFDbedit;
     DBDifHorasMaquina: TLFDbedit;
     DBDifHorasOperario: TLFDbedit;
     LFCategoryAction6: TLFCategoryAction;
     ARecalculoCostes: TAction;
     TSIncMaterial: TTabSheet;
     NavIncMaterial: THYMNavigator;
     DBGIncMaterial: TDBGridFind2000;
     ARecuperarMarcajes: TAction;
     BtIncidencia: TToolButton;
     ALstOrdenDet: TAction;
     ToolButton12: TToolButton;
     AIncMatDet: TAction;
     LFUniFabricadas: TLFLabel;
     LFDBUndsFabri: TLFDbedit;
     PNLRelacionLeft: TLFPanel;
     DBGRelacionOrdenes: THYTDBGrid;
     DBGRelacionSubordenes: THYTDBGrid;
     PNLRelacionRight: TLFPanel;
     DBGRelacionFases: THYTDBGrid;
     DBGRelacionMateriales: THYTDBGrid;
     DBGRelacionTareas: THYTDBGrid;
     LLote: TLFLabel;
     LUbicacion: TLFLabel;
     DBELote: TLFDbedit;
     DBETituloLote: TLFDbedit;
     LFDTituloUbi: TLFDbedit;
     LFDUbicacion: TLFDBEditFind2000;
     AFichaTecnica: TAction;
     ALote: TAction;
     SBALote: TSpeedButton;
     LblUnidad: TLFLabel;
     DBEFUnidad: TLFDBEditFind2000;
     EDescTipoUnidad: TLFEdit;
     AInfoCierre: TAction;
     AInfoCierresParciales: TAction;
     DBEDifCosteMerma: TLFDbedit;
     DBECosteMermaReal: TLFDbedit;
     DBECosteMermaPre: TLFDbedit;
     LCosteMerma: TLFLabel;
     LCopiasPMP: TLFLabel;
     LFDBCopiasPMP: TLFDbedit;
     GBVistoBueno: TGroupBox;
     LBLVersion: TLFLabel;
     DBEVersion: TLFDbedit;
     BCargarImagen: TButton;
     TBIncMaterial: TLFToolBar;
     TButtIncMaterial: TToolButton;
     TButtInfoStocksCompuesto: TToolButton;
     TButtInfStocksIncMaterial: TToolButton;
     TButtInfStocksCompras: TToolButton;
     PNLDibujo: TLFPanel;
     PNLDatosCoste: TLFPanel;
     ACierreParcialOrden: TAction;
     APropagaAlmacenLanzamientoAMateriales: TAction;
     PNLInfoGeneral: TLFPanel;
     LIDOrdenCabecera: TLFLabel;
     DBEIdOrdenCabecera: TLFDbedit;
     LOrdenCabecera: TLFLabel;
     DBEOrdenCabecera: TLFDbedit;
     LEstadoCabecera: TLFLabel;
     DBEEstadoCabecera: TLFDbedit;
     DBEComponenteCabecera: TLFDBEditFind2000;
     DBEDescripcionComponenteCabecera: TLFDbedit;
     TButtFiltraOrdenesYSubordenes: TToolButton;
     AFiltraOrdenesYSubordenes: TAction;
     LFCategoryAction7: TLFCategoryAction;
     AFiltrarSituacionNoLanzada: TAction;
     AFiltrarSituacionLanzada: TAction;
     AFiltrarSituacionReservada: TAction;
     AFiltrarSituacionCerradaParcialmente: TAction;
     AFiltrarSituacionCerradaTotalmente: TAction;
     AFiltrarSituacionTodo: TAction;
     LFCategoryAction8: TLFCategoryAction;
     LFCategoryAction9: TLFCategoryAction;
     AReservarNuevamente: TAction;
     AEnviarATrabajoExterno: TAction;
     ARecibirTrabajoExterno: TAction;
     AFiltrarSituacionSoloActivas: TAction;
     AProLstNecesidadesEsc: TAction;
     AInfoReserva: TAction;
     LUnidadesReservadas: TLFLabel;
     DBEUnidadesReservadas: TLFDbedit;
     TButtReservarNuevamente: TToolButton;
     ADesvinculaSubordenes: TAction;
     ACierraSubordenes: TAction;
     ButtSep: TToolButton;
     AGeneraPropuestaPedido: TAction;
     AHojaDeTrabajo: TAction;
     LFCategoryAction10: TLFCategoryAction;
     LFCategoryAction11: TLFCategoryAction;
     AAdjuntosOrden: TAction;
     AInfoMarcajes: TAction;
     TButtCierreParcialOrden: TToolButton;
     BClipboard: TButton;
     Series1: TBarSeries;
     Series2: TBarSeries;
     Series3: TBarSeries;
     Series9: TBarSeries;
     Series4: TBarSeries;
     Series10: TBarSeries;
     Series5: TBarSeries;
     Series11: TBarSeries;
     Series6: TBarSeries;
     Series12: TBarSeries;
     Series7: TBarSeries;
     Series13: TBarSeries;
     Series8: TBarSeries;
     Series14: TBarSeries;
     Series15: TBarSeries;
     Series16: TBarSeries;
     SBAProyecto: TSpeedButton;
     LProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     AProyecto: TAction;
     LLoteReserva: TLFLabel;
     DBELoteReserva: TLFDbedit;
     DBETituloLoteReserva: TLFDbedit;
     SBALoteReserva: TSpeedButton;
     AListarEtiquetas: TAction;
     TBRefrescaStockMateriales: TToolButton;
     ALanzarMasSubordenes: TAction;
     PMInformeOrden: TPopupMenu;
     MIInformePrevisto: TMenuItem;
     MIInformeReal: TMenuItem;
     MIInformeMontaje: TMenuItem;
     LEscandallo2: TLFLabel;
     DBEFEscandallo2: TLFDBEditFind2000;
     DBEDescCompuesto2: TLFDbedit;
     AAEscandallo2: TAction;
     SBAEscandallo2: TSpeedButton;
     ACreaMovimientoComponente: TAction;
     TBMovimientos: TToolButton;
     TBSep3: TToolButton;
     TBEscandalloMaterial: TToolButton;
     AEscandalloMaterial: TAction;
     GBTyC: TGroupBox;
     DBCBRetenido: TLFDBCheckBox;
     DBCBUrgente: TLFDBCheckBox;
     DBCBSinHerraje: TLFDBCheckBox;
     DBCBSinLona: TLFDBCheckBox;
     DBCBSinRotulacion: TLFDBCheckBox;
     DBCBSinMotor: TLFDBCheckBox;
     TBSep1: TToolButton;
     TBCopiarAPortapapeles: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure TSMaterialesShow(Sender: TObject);
     procedure TSFasesShow(Sender: TObject);
     procedure TSNotasFasesShow(Sender: TObject);
     procedure TSTareasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFMaterialesBusqueda(Sender: TObject);
     procedure DBEFEscandalloBusqueda(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AVisualizarCostesExecute(Sender: TObject);
     procedure ASituacionSiguienteExecute(Sender: TObject);
     procedure ALanzarMasReservarExecute(Sender: TObject);
     procedure ASituacionAnteriorExecute(Sender: TObject);
     procedure DBEFClienteExit(Sender: TObject);
     procedure TBInfoLotesClick(Sender: TObject);
     procedure ASerializarCompExecute(Sender: TObject);
     procedure AHistNSeriesExecute(Sender: TObject);
     procedure ALotesCompuestoExecute(Sender: TObject);
     procedure AProLstOrdenExecute(Sender: TObject);
     procedure AProLstHojaMontajeExecute(Sender: TObject);
     procedure AProLstNecesidadesExecute(Sender: TObject);
     procedure DBGFMaterialesCellClick(Column: TColumn);
     procedure DBGFMaterialesDblClick(Sender: TObject);
     procedure AACompuestoExecute(Sender: TObject);
     procedure SBACompuestoDblClick(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAClienteExecute(Sender: TObject);
     procedure ANewClienteExecute(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure ButtZoomMasClick(Sender: TObject);
     procedure ButtZoomMenosClick(Sender: TObject);
     procedure ButtCopiarPortapapelesClick(Sender: TObject);
     procedure TButtGraficoTareasClick(Sender: TObject);
     procedure TButtGraficoMaterialesClick(Sender: TObject);
     procedure TButtGraficoCostesFasesClick(Sender: TObject);
     procedure ANotasMaterialesExecute(Sender: TObject);
     procedure ANotasTareasExecute(Sender: TObject);
     procedure AAEscandalloExecute(Sender: TObject);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure TButtInformeClick(Sender: TObject);
     procedure AIsoAprobadoExecute(Sender: TObject);
     procedure AIsoVerificadoExecute(Sender: TObject);
     procedure AIsoValidadoExecute(Sender: TObject);
     procedure TButtTrabExtClick(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure TSDibujoFasesShow(Sender: TObject);
     procedure DBEDescCompuestoEnter(Sender: TObject);
     procedure DBEFAlmSalChange(Sender: TObject);
     procedure DBEFAlmLanChange(Sender: TObject);
     procedure DBEFAlmEntChange(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure AProLstHojaTrabajoExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure GetTime(Sender: TObject);
     procedure DBGFTareasBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure DBGFTareasBusqueda(Sender: TObject);
     procedure DBGFMaterialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure SelectionChange(Sender: TObject);
     procedure SelectionChangeFase(Sender: TObject);
     procedure TButtUndoClick(Sender: TObject);
     procedure TButtCutClick(Sender: TObject);
     procedure TButtCopyClick(Sender: TObject);
     procedure TButtPasteClick(Sender: TObject);
     procedure FontNameChange(Sender: TObject);
     procedure FontSizeChange(Sender: TObject);
     procedure TButtNegritaClick(Sender: TObject);
     procedure TButtCursivaClick(Sender: TObject);
     procedure TButtSubrayadoClick(Sender: TObject);
     procedure TButtLeftAlignClick(Sender: TObject);
     procedure TButtCenterAlignClick(Sender: TObject);
     procedure TButtRightAlignClick(Sender: TObject);
     procedure TButtUndoFaseClick(Sender: TObject);
     procedure TButtCutFaseClick(Sender: TObject);
     procedure TButtCopyFaseClick(Sender: TObject);
     procedure TButtPasteFaseClick(Sender: TObject);
     procedure FontNameFaseChange(Sender: TObject);
     procedure FontSizeFaseChange(Sender: TObject);
     procedure TButtNegritaFaseClick(Sender: TObject);
     procedure TButtCursivaFaseClick(Sender: TObject);
     procedure TButtSubrayadoFaseClick(Sender: TObject);
     procedure TButtLeftAlignFaseClick(Sender: TObject);
     procedure TButtCenterAlignFaseClick(Sender: TObject);
     procedure TButtRightAlignFaseClick(Sender: TObject);
     procedure TButtColorClick(Sender: TObject);
     procedure TButtColorFaseClick(Sender: TObject);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure AEquivalenciaLineaExecute(Sender: TObject);
     procedure AUbicacionExecute(Sender: TObject);
     procedure AUbicacionCompExecute(Sender: TObject);
     procedure CambiaEstadoCompras(Sender: TObject);
     procedure AOrigenCompraExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure ALstOrdenCodBarExecute(Sender: TObject);
     procedure ALstEtiOrdenExecute(Sender: TObject);
     procedure AMovStocksExecute(Sender: TObject);
     procedure RGImportarClick(Sender: TObject);
     procedure RGCasoClick(Sender: TObject);
     procedure ADocumentosExecute(Sender: TObject);
     procedure BtIntroduceMedidasClick(Sender: TObject);
     procedure LFResponsableChange(Sender: TObject);
     procedure TBCarpetasClick(Sender: TObject);
     procedure AProRecalculoIDExecute(Sender: TObject);
     procedure ARecalculoTodosExecute(Sender: TObject);
     procedure DBGFMatComprasDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
     procedure DBGFMatComprasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ARecuperarPrecioVExecute(Sender: TObject);
     procedure APedidoExecute(Sender: TObject);
     procedure SBAPedidoDblClick(Sender: TObject);
     procedure PCMatTareaChange(Sender: TObject);
     procedure ARecalculoCostesExecute(Sender: TObject);
     procedure ARecuperarMarcajesExecute(Sender: TObject);
     procedure TSCostesShow(Sender: TObject);
     procedure BtIncidenciaClick(Sender: TObject);
     procedure ALstOrdenDetExecute(Sender: TObject);
     procedure AIncMatDetExecute(Sender: TObject);
     procedure DBGIncMaterialDblClick(Sender: TObject);
     procedure TSGraficoShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure DBGRelacionOrdenesCellClick(Column: TColumn);
     procedure DBGRelacionSubordenesCellClick(Column: TColumn);
     procedure DBGFMaterialesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure LFDUbicacionBusqueda(Sender: TObject);
     procedure DBELoteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AFichaTecnicaExecute(Sender: TObject);
     procedure LFDTituloLoteDblClick(Sender: TObject);
     procedure SBALoteDblClick(Sender: TObject);
     procedure DBEFUnidadChange(Sender: TObject);
     procedure AInfoCierreExecute(Sender: TObject);
     procedure AInfoCierresParcialesExecute(Sender: TObject);
     procedure TSNavShow(Sender: TObject);
     procedure TSDesarrolloShow(Sender: TObject);
     procedure PCMatTareaChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSMatCompraShow(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavDibujoFasesClick(Sender: TObject; Button: TNavigateBtn);
     procedure ACierreParcialOrdenExecute(Sender: TObject);
     procedure APropagaAlmacenLanzamientoAMaterialesExecute(Sender: TObject);
     procedure AFiltraOrdenesYSubordenesExecute(Sender: TObject);
     procedure AFiltrarSituacionExecute(Sender: TObject);
     procedure AFiltrarAlmacenLanzamientoExecute(Sender: TObject);
     procedure AReservarNuevamenteExecute(Sender: TObject);
     procedure AEnviarATrabajoExternoExecute(Sender: TObject);
     procedure ARecibirTrabajoExternoExecute(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AProLstNecesidadesEscExecute(Sender: TObject);
     procedure AInfoReservaExecute(Sender: TObject);
     procedure DBEFCompuestoChange(Sender: TObject);
     procedure ADesvinculaSubordenesExecute(Sender: TObject);
     procedure ACierraSubordenesExecute(Sender: TObject);
     procedure AGeneraPropuestaPedidoExecute(Sender: TObject);
     procedure AHojaDeTrabajoExecute(Sender: TObject);
     procedure DBEEstadoCabeceraChange(Sender: TObject);
     procedure AAdjuntosOrdenExecute(Sender: TObject);
     procedure AInfoMarcajesExecute(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBGFTareasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFProyectoChange(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBALoteReservaDblClick(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure LFDBIdOrdenChange(Sender: TObject);
     procedure TBRefrescaStockMaterialesClick(Sender: TObject);
     procedure ALanzarMasSubordenesExecute(Sender: TObject);
     procedure NavMaterialesChangeState(Sender: TObject);
     procedure DBGFMaterialesColEnter(Sender: TObject);
     procedure AAEscandallo2Execute(Sender: TObject);
     procedure DBEFEscandallo2Change(Sender: TObject);
     procedure DBEFEscandallo2Busqueda(Sender: TObject);
     procedure SBAEscandallo2DblClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFFasesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACreaMovimientoComponenteExecute(Sender: TObject);
     procedure TBMovimientosClick(Sender: TObject);
     procedure AEscandalloMaterialExecute(Sender: TObject);
     procedure TBCopiarAPortapapelesClick(Sender: TObject);
     procedure AExportarDatosOrdenesExecute(Sender: TObject);
     procedure DBGFTareasDblClick(Sender: TObject);
     procedure DBGFTareasCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
     FUpdating: boolean;
     SituacionAnterior: integer;
     function CurrText(Notas: TDBRichEdit): TTextAttributes;
     procedure GetFontNames;
     procedure CargaCaso(Caso: integer);
     procedure RefrescaCantidadEscandalos;
  public
     { Public declarations }
     BotonDesasignar: boolean; //True-> Componentes, False-> Compuesto
     procedencia: integer; //Per saber si prové de les OF o material, per les serialitzacions
     procedure AjustaBotones;
     procedure ChecksFirmas(Aprobado, Verificado, Validado: integer);
     procedure FiltraOrden(id_orden: integer);
     procedure CargaDatos;
  end;

var
  ProFMOrden : TProFMOrden;

implementation

uses UFormGest, UDMMain, UProDMOrden, UEntorno, UProFMCostesTOrden,
  UUtiles, UDameDato, UProFMSelecImpEsc,
  UProFMArtSerializacion, UProFMHistoricoSerializacion, UProFMLstOrden,
  UProFMLstNecesidades, UProFMLstNecesidadesEsc, UFMain, UFMClientes,
  UProDMArtSerializacion, UProFMGrafTareas, UProFMGrafMateriales,
  UProFMGrafCostesFases, UFMNotasCampo, UIsoFMFirmas,
  UProFMTrabExt, UProFMLstHojaTrabajo, UFPregTiempo,
  UFMDocInfoStocks, UProFMLstCodBarras, UProFmMovStockOP,
  UProFMFicherosCliente, UProFMCarpetas,
  UProFMMatInc, UProFMLstOrdenDet,
  UDMMovManStock, UProFMIntroduceDatosCierre,
  ZUFMLstOrdenes, UProFMInfoCierreParciales, UFMSelecAlmacenCantidad,
  UFMCierreParcialOrden, UFMSeleccionGrid, UProFMInfoReservas,
  {$IFNDEF TPV}UFMHojaDeTrabajo, UProFMInfoMarcajes, {$ENDIF}
  UParam, UFMAdjunto, UFMImprimirCodBarras, ShellApi, URecibeFicheros,
  UDMAdjunto, UFMSelecComponenteAlmacenCantidad,
  UHojaCalc, UFMSeleccion, FIBDataSet, UFIBModificados, URellenaLista,
  UImagenes;

{$R *.dfm}

procedure TProFMOrden.FormCreate(Sender: TObject);
var
  s : string;
  Lista : TStrings;
  i : integer;
  NuevaAccion : TAction;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  DMMain.LogIni('ProFMOrden.FormCreate');
  AbreData(TProDMOrden, ProDMOrden);

  EFSerie.Text := REntorno.Serie;

  //Formatació texte
  GetFontNames;
  SelectionChange(Self);
  SelectionChangeFase(Self);

  CurrText(DBMNotas).Name := DefFontData.Name;
  CurrText(DBMNotasFases).Name := DefFontData.Name;

  CurrText(DBMNotas).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
  CurrText(DBMNotasFases).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  // Navegadores
  NavMain.DataSource := ProDMOrden.DSQMProOrd;
  NavNotas.DataSource := ProDMOrden.DSQMProOrd;
  NavFases.DataSource := ProDMOrden.DSQMProOrdFases;
  NavMateriales.DataSource := ProDMOrden.DSQMProOrdMat;
  NavTarea.DataSource := ProDMOrden.DSQMProOrdTarea;
  NavNotasFases.DataSource := ProDMOrden.DSQMProOrdFases;
  DBGMain.DataSource := ProDMOrden.DSQMProOrd;

  DBGRelacionOrdenes.DataSource := ProDMOrden.DSQMProOrd;
  DBGRelacionSubordenes.DataSource := ProDMOrden.DSQSubOrdenes;
  DBGRelacionFases.DataSource := ProDMOrden.DSQMProOrdFases;
  DBGRelacionMateriales.DataSource := ProDMOrden.DSxInfoMat; //ProDMOrden.DSQMProOrdMat;
  DBGRelacionTareas.DataSource := ProDMOrden.DSxInfoTar; //ProDMOrden.DSQMProOrdTarea;

  SituacionAnterior := -1;

  // Page Control
  PCMatTarea.ActivePage := TSMateriales;
  PCFases.ActivePage := TSFases;
  AjustaBotones;

  HelpFile := REntorno.FicheroAyuda;
  HelpType := htKeyword;
  HelpKeyword := 'FACCESOS';

  DBEDescCompuesto.Color := REntorno.ColorEnlaceActivo;
  DBEDescCliente.Color := REntorno.ColorEnlaceActivo;
  DBEFEscandallo.Color := REntorno.ColorEnlaceActivo;
  DBEFEscandallo2.Color := REntorno.ColorEnlaceActivo;
  DBEPedido.Color := REntorno.ColorEnlaceActivo;
  DBETituloLote.Color := REntorno.ColorEnlaceActivo;
  DBETituloLoteReserva.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACompuesto, DBEDescCompuesto);
  SolapaControles(SBACliente, DBEDescCliente);
  SolapaControles(SBAEscandallo, DBEFEscandallo);
  SolapaControles(SBAEscandallo2, DBEFEscandallo2);
  SolapaControles(SBAPedido, DBEPedido);
  SolapaControles(SBALote, DBETituloLote);
  SolapaControles(SBALoteReserva, DBETituloLoteReserva);

  G2KTableLoc.DataSource := ProDMOrden.DSQMProOrd;
  if (DMMain.EstadoKri(42) = 1) then
  begin
     G2kTableLoc.OrdenadoPor.Text := 'TITULO';
     DBEFCompuesto.OrdenadoPor.Text := 'TITULO';
  end;

  // El significado de cada Visto Bueno (1..3)
  DBCBVistoBueno1.Caption := _('Operario');
  DBCBVistoBueno2.Caption := _('Encargado');
  DBCBVistoBueno3.Caption := _('Jefe');
  if (DMMain.EstadoKri(36) = 1) then
  begin
     s := DMMain.DescripcionEstadoKri(36);
     if (Trim(s) > '') then
        DBCBVistoBueno1.Caption := s;
  end;
  if (DMMain.EstadoKri(37) = 1) then
  begin
     s := DMMain.DescripcionEstadoKri(37);
     if (Trim(s) > '') then
        DBCBVistoBueno2.Caption := s;
  end;
  if (DMMain.EstadoKri(38) = 1) then
  begin
     s := DMMain.DescripcionEstadoKri(38);
     if (Trim(s) > '') then
        DBCBVistoBueno3.Caption := s;
  end;

  // Genero acciones para filtrar por los diferentes almacenes de lanzamiento.
  Lista := TStringList.Create;
  try
     RellenaAlmacenes(Lista);

     for i := 0 to Lista.Count - 1 do
     begin
        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('AFiltrarAlmacenLanzamiento%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 40;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 0;
        NuevaAccion.Category := 'Filtros;AlmacenLanzamiento';
        NuevaAccion.OnExecute := AFiltrarAlmacenLanzamientoExecute;
     end;
  finally
     Lista.Free;
  end;

  // Escondemos la columna TIME si TIEMPO no es visible
  i := EncuentraField(DBGFTareas, 'TIEMPO');
  if (i >= 0) then
  begin
     if not (DBGFTareas.Columns[i].Visible) then
     begin
        i := EncuentraField(DBGFTareas, 'TIME');
        if (i >= 0) then
           DBGFTareas.Columns[i].Visible := False;
     end;
  end;

  // Escondemos la columna TIME_UTIL si TIEMPO_UTIL no es visible
  i := EncuentraField(DBGFTareas, 'TIEMPO_UTIL');
  if (i >= 0) then
  begin
     if not (DBGFTareas.Columns[i].Visible) then
     begin
        i := EncuentraField(DBGFTareas, 'TIME_UTIL');
        if (i >= 0) then
           DBGFTareas.Columns[i].Visible := False;
     end;
  end;

  ETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, ETitProyecto);

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  s := LeeParametro('ARTBUSQ001');
  if ((s <> 'ARTICULO') and (s <> '')) then
  begin
     with DBGFMateriales do
     begin
        for i := 0 to Tablas.Count - 1 do
        begin
           if (Trim(UpperCase(Tablas[i])) = 'VER_ARTICULOS_EF') and
              (CamposDesplegar[i] = '1') then
           begin
              Numericos[i] := s;
              CamposADevolver[i] := 'ARTICULO';
              OrdenadosPor[i] := s;
           end;
        end;
     end;
  end;

  // Color campo ID
  ColorCampoID(DBEIdOrdenCabecera);
  ColorCampoID(DBEOrdenCabecera);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(ButtZoomMas, 1, DMMain.ILMain_Ac, 23);
  GetBitmapFromImageList(ButtZoomMenos, 1, DMMain.ILMain_Ac, 22);
  GetBitmapFromImageList(ButtCopiarPortapapeles, 1, DMMain.ILMain_Ac, 37);
  DMMain.LogFin('ProFMOrden.FormCreate');
end;

procedure TProFMOrden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMOrden);
end;

procedure TProFMOrden.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;

  ChecksFirmas(
     ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdESTADO_FIRMA_ISO_APROBADO.AsInteger),
     ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdESTADO_FIRMA_ISO_VERIFICADO.AsInteger),
     ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdESTADO_FIRMA_ISO_VALIDADO.AsInteger));
end;

procedure TProFMOrden.TSNotasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotas;
end;

procedure TProFMOrden.TSMaterialesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMateriales;
end;

procedure TProFMOrden.TSFasesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFases;
end;

procedure TProFMOrden.TSNotasFasesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotasFases;
end;

procedure TProFMOrden.TSTareasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CETareas;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPORECURSO FROM PRO_RECURSOS WHERE EMPRESA = ?EMPRESA AND RECURSO = ?RECURSO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RECURSO'].AsString := ProDMOrden.QMProOrdTareaRECURSO.AsString;
        ExecQuery;
        TButtTrabExt.Enabled := (FieldByName['TIPORECURSO'].AsString = 'TE');
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProFMOrden.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMOrden.BusquedaCompleja;
  PCMainChange(nil);
end;

procedure TProFMOrden.DBGFMaterialesBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';
     Filtros := [];
     Accion := nil;

     if Trim(TablaABuscar) = 'VER_ARTICULOS_EF' then
     begin
        CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
        Filtros := [obEmpresa, obEjercicio, obCanal];

        {
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'ARTICULO';
           if (DMMain.EstadoKri(42) = 1) then
              OrdenadosPor[i] := 'TITULO';
        end;
        }

        //Fa que es vegi el botó d'Origen a la búsqueda
        if (FMain.AProEscandalloSF.Enabled = True) then
           Accion := ANewArticulo;
     end
     else if Trim(TablaABuscar) = 'PRO_ESCANDALLO' then
     begin
        CondicionBusqueda := 'TIPO=''EPR'' AND COMPUESTO =''' + ProDMOrden.QMProOrdMatCOMPONENTE.AsString + '''';
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'COMPUESTO';
     end
     else if Trim(TablaABuscar) = 'ART_ARTICULOS' then
     begin
        CondicionBusqueda := 'ARTICULO=''' + ProDMOrden.QMProOrdMatCOMPONENTE.AsString + '''';
        Filtros := [obEmpresa];
     end
     else if Trim(TablaABuscar) = 'ART_ALMACENES' then
     begin
        CondicionBusqueda := '';
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ALMACEN';
     end
     else if Trim(TablaABuscar) = 'SYS_UNIDADES_ARTICULOS' then
        CondicionBusqueda := ''
     else if Trim(TablaABuscar) = 'PRO_SYS_CAB_EQUIVAL' then
     begin
        CondicionBusqueda := 'ARTICULO=''' + ProDMOrden.QMProOrdMatCOMPONENTE.AsString + '''';
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end
     else if Trim(TablaABuscar) = 'VER_PROVEEDORES' then
     begin
        CondicionBusqueda := '';
        Filtros := [obEmpresa, obEjercicio, obCanal];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROVEEDOR';
     end
     else if Trim(DBGFMateriales.TablaABuscar) = 'PRO_ORD_TAREA' then //vquimicas_jla
     begin
        CondicionBusqueda := 'ID_ORDEN=' + IntToStr(ProDMOrden.QMProOrdMatID_ORDEN.AsInteger) + //vquimicas_jla
           ' AND LINEA_FASE=' + IntToStr(ProDMOrden.QMProOrdMatLINEA_FASE.AsInteger); //vquimicas_jla
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end
     else if (TablaABuscar = 'ART_ALMACENES_UBICACIONES') then //sfg.albert
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + ProDMOrden.QMProOrdALMACEN_ENT.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TProFMOrden.DBEFEscandalloBusqueda(Sender: TObject);
begin
  inherited;
  DBEFEscandallo.CondicionBusqueda := '(COMPUESTO =''' +
     ProDMOrden.QMProOrdCOMPUESTO.AsString + '''' + ' AND ESTADO=1 AND TIPO=''EPR'') or ESCANDALLO=0';
end;

procedure TProFMOrden.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSDesarrollo) then
  begin
     if (not ProDMOrden.QMProOrdFases.Active) then
        ProDMOrden.QMProOrdFases.Open;
     PCMatTarea.ActivePage := TSMateriales;
  end;
end;

procedure TProFMOrden.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  CargaDatos;

  if (SituacionAnterior <> ProDMOrden.QMProOrdSITUACION.AsInteger) then
  begin
     // Habilito todos los campos editables.
     DBDTPFecha.Enabled := False;
     DBEFCompuesto.Enabled := True;
     DBEFEscandallo.Enabled := True;
     DBEFEscandallo2.Enabled := True;
     DBEFCliente.Enabled := True;
     DBERef.Enabled := True;
     DBEFAlmSal.Enabled := True;
     DBEFAlmLan.Enabled := True;
     DBEFAlmEnt.Enabled := True;
     DBEMedida1.Enabled := True;
     DBEMedida2.Enabled := True;
     DBEMedida3.Enabled := True;
     DBEMedida4.Enabled := True;
     DBEUniManual.Enabled := True;
     DBDFechaEnt.Enabled := True;
     DBDFechaIni.Enabled := True;
     DBDTPFechaIniTime.Enabled := True;
     DBDFechaFin.Enabled := True;
     DBDTPFechaFinTime.Enabled := True;
     DBEPrioridad.Enabled := True;
     DBEMerma.Enabled := True;
     LFDBCopiasPMP.Enabled := True;
     DBELote.Enabled := True;
     LFDUbicacion.Enabled := True;
     LFDBCopiasPMP.Enabled := True;
     RGImportar.Enabled := True;
     RGCaso.Enabled := True;
     GBFirmas.Enabled := True;
     GBVistoBueno.Enabled := True;
     DBCBVistoBueno1.Enabled := True;
     DBCBVistoBueno2.Enabled := True;
     DBCBVistoBueno3.Enabled := True;

     // Deshabilito Edits según la situacion de la orden
     if (ProDMOrden.QMProOrdSITUACION.AsInteger >= 1) then
     begin
        DBDTPFecha.Enabled := False;
        DBEFCompuesto.Enabled := False;
        DBEFEscandallo.Enabled := False;
        DBEFEscandallo2.Enabled := False;
        DBEFCliente.Enabled := False;
        DBEUniManual.Enabled := False;
        DBDFechaFin.Enabled := False;
        DBDTPFechaFinTime.Enabled := False;
        DBEPrioridad.Enabled := False;
        DBEMerma.Enabled := False;
        LFDBCopiasPMP.Enabled := False;
        DBELote.Enabled := False;
        LFDUbicacion.Enabled := False;
        LFDBCopiasPMP.Enabled := False;
        RGImportar.Enabled := False;
        RGCaso.Enabled := False;
        GBFirmas.Enabled := False;
     end;
     if (ProDMOrden.QMProOrdSITUACION.AsInteger >= 2) then
     begin
        DBEFAlmSal.Enabled := False;
        DBEFAlmLan.Enabled := False;
        DBEFAlmEnt.Enabled := False;
     end;
     if (ProDMOrden.QMProOrdSITUACION.AsInteger >= 3) then
     begin
        DBEMedida1.Enabled := False;
        DBEMedida2.Enabled := False;
        DBEMedida3.Enabled := False;
        DBEMedida4.Enabled := False;
        DBDFechaIni.Enabled := False;
        DBDTPFechaIniTime.Enabled := False;
     end;

     if (ProDMOrden.QMProOrdSITUACION.AsInteger >= 4) then
     begin
        GBVistoBueno.Enabled := False;
        DBCBVistoBueno1.Enabled := False;
        DBCBVistoBueno2.Enabled := False;
        DBCBVistoBueno3.Enabled := False;
     end;
  end;
  SituacionAnterior := ProDMOrden.QMProOrdSITUACION.AsInteger;

  if (Button in [nbEdit, nbInsert]) then
  begin
     // Pone el foco en el edit que sea apropiado y esté activo.
     if (ProDMOrden.QMProOrdSITUACION.AsInteger = 0) then
        DBEFCompuesto.SetFocus
     else
        DBERef.SetFocus;
  end;

  if (Button in [nbRefresh]) then
     ProDMOrden.FuerzaRefrescoRealizable(ProDMOrden.QMProOrdID_ORDEN.AsInteger);

  if (Button in [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]) then
     AjustaBotones;
end;

procedure TProFMOrden.AjustaBotones;
var
  Situacion : integer;
begin
  Situacion := ProDMOrden.QMProOrdSITUACION.AsInteger;

  if (Frac(ProDMOrden.QMProOrdFECHA_INI.AsFloat) = 0) then
     DBDTPFechaIniTime.Time := 0;
  if (Frac(ProDMOrden.QMProOrdFECHA_FIN.AsFloat) = 0) then
     DBDTPFechaFinTime.Time := 0;

  // Si la situación es Deslanzada evito que la solapa desarrollo esté en foco
  if ((Situacion = 0) and (PCMain.ActivePage = TSDesarrollo)) then
     PCMain.ActivePage := TSFicha;

  PNFases.Enabled := (Situacion > 0);
  PNMatTarea.Enabled := (Situacion > 0);
  ProFMOrden.PCostes.Enabled := (Situacion = 0);
  ASituacionAnterior.Enabled := (Situacion > 0);
  AReservarNuevamente.Enabled := ({(Situacion = 1) or} (Situacion = 2) or (Situacion = 3));
  ASerializacion.Enabled := (Situacion < 3);
  TBInfoLotes.Enabled := (Situacion < 3);
  ASituacionSiguiente.Enabled := (Situacion < 4);
  ALanzarMasReservar.Visible := (Situacion < 2);

  ASerializarComp.Enabled := (ProDMOrden.Serializado(0)) and ((Situacion = 3) or (Situacion = 4));
  ALotesCompuesto.Enabled := (ProDMOrden.CompuestoLoteable) and ((Situacion = 3) or (Situacion = 4));

  // Incidencia de materiales solo si la Op está lanzada o lanzada+reservada
  BtIncidencia.Visible := ((Situacion = 1) or (Situacion = 2));

  // Es controla si s'ha recuperar o no
  if ((Situacion = 0) or (ProDMOrden.QMProOrdRECUPERADO_MARCAJE.AsInteger = 1) or (not ProDMOrden.HayMarcajesARecuperar(ProDMOrden.QMProOrdID_ORDEN.AsInteger))) then
     ARecuperarMarcajes.Enabled := False
  else
     ARecuperarMarcajes.Enabled := True;

  case Situacion of
     0:
     begin
        ASituacionSiguiente.Caption := 'Lanzar';
        ASituacionAnterior.Caption := 'N/A';
     end;
     1:
     begin
        ASituacionSiguiente.Caption := 'Reservar';
        ASituacionAnterior.Caption := 'DesLanzar';
     end;
     2:
     begin
        ASituacionSiguiente.Caption := 'Cerrar';
        ASituacionAnterior.Caption := 'Deshacer reserva';
     end;
     3:
     begin
        ASituacionSiguiente.Caption := 'Cerrar';
        ASituacionAnterior.Caption := 'Deshacer Cierre Parcial';
     end;
     4:
     begin
        ASituacionSiguiente.Caption := 'N/A';
        ASituacionAnterior.Caption := 'Abrir';
     end;
  end;

  ASituacionSiguiente.Hint := ASituacionSiguiente.Caption;
  ASituacionAnterior.Hint := ASituacionAnterior.Caption;

  PCMainChange(nil);
end;

procedure TProFMOrden.AVisualizarCostesExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TProFMCostesTOrden, ProFMCostesTOrden);
  ProFMCostesTOrden.ShowModal;
  ProFMCostesTOrden.Free;
end;

procedure TProFMOrden.ALanzarMasReservarExecute(Sender: TObject);
begin
  inherited;
  // Si lanzo la OF automáticamente, le pongo el estado a 2 para: lanzada+reserva
  if (ProDMOrden.QMProOrdSITUACION.AsInteger = 0) then
     ProDMOrden.SituacionSiguiente;
  if (ProDMOrden.QMProOrdSITUACION.AsInteger = 1) then
     ProDMOrden.SituacionSiguiente;

  ProDMOrden.PosicionaIdOrden(ProDMOrden.QMProOrdID_ORDEN.AsInteger);

  AjustaBotones;
end;

procedure TProFMOrden.DBEFClienteExit(Sender: TObject);
begin
  inherited;
  // Obligo a que si no ha posat el compost, ja que se l'ha saltat, treure un
  // missatge i portar el focus al compost
  if ((ProDMOrden.QMProOrdESCANDALLO.AsInteger = 0) and (ProDMorden.QMProOrdCOMPUESTO.AsString = '')) then
  begin
     ShowMessage(_('Debe informar primero del compuesto'));
     DBEFCompuesto.SetFocus;
  end;
end;

procedure TProFMOrden.TBInfoLotesClick(Sender: TObject);
begin
  inherited;
  BotonDesasignar := True;
  ProDMOrden.InfoLotes(True); // Llamo a la funcion de los lotes
end;

procedure TProFMOrden.ASerializarCompExecute(Sender: TObject);
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado : integer;
  Fecha : TDateTime;
  Unidades : double;
begin
  inherited;
  procedencia := 0;
  if not ProDMOrden.Serializado(0) then
     ShowMessage(_('El artículo no está serializado'))
  else
  begin
     ProDMOrden.DatosSerializacion
     (Serie, Tipo, Almacen, Articulo, Rig, Linea, Fecha, Unidades, Estado, 0);
     MuestraSerializacion
     (Serie, Tipo, Almacen, Articulo, Rig, Linea, Fecha, Unidades, Estado, Self);
  end;
end;

procedure TProFMOrden.AHistNSeriesExecute(Sender: TObject);
begin
  inherited;
  HistoricoSerie(Self);
end;

procedure TProFMOrden.ALotesCompuestoExecute(Sender: TObject);
begin
  inherited;
  if not ProDMOrden.CompuestoLoteable then
     ShowMessage(_('El artículo no permite control de lotes'))
  else
  begin
     BotonDesasignar := False;
     ProDMOrden.InfoLotes(False); // Llamo a la funcion de los lotes
  end;
end;

procedure TProFMOrden.AProLstOrdenExecute(Sender: TObject);
var
  Tipo : integer;
begin
  inherited;
  Tipo := 0;
  if (Sender is TMenuItem) then
     Tipo := TMenuItem(Sender).Tag;

  AbreForm(TProFMLstOrden, ProFMLstOrden, Sender);
  ProFMLstOrden.Configurar(0, Tipo, ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.AProLstHojaMontajeExecute(Sender: TObject);
var
  Tipo : integer;
begin
  inherited;
  Tipo := 0;
  if (Sender is TMenuItem) then
     Tipo := TMenuItem(Sender).Tag;

  AbreForm(TProFMLstOrden, ProFMLstOrden, Sender);
  ProFMLstOrden.Configurar(1, Tipo, ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.TButtInformeClick(Sender: TObject);
var
  Tipo : integer;
begin
  inherited;
  Tipo := 0;
  if (Sender is TMenuItem) then
     Tipo := TMenuItem(Sender).Tag;

  if (Tipo = 3) then
     AProLstHojaMontajeExecute(Sender)
  else
     AProLstOrdenExecute(Sender);

  ProFMLstOrden.Previsualizar;
  ProFMLstOrden.Close;
end;

procedure TProFMOrden.AProLstNecesidadesExecute(Sender: TObject);
begin
  inherited;
  if (ProDMOrden.QMProOrdSITUACION.AsInteger > 2) then
     ShowMessage(_('No se puede listar las necesidades debido a que la orden esta cerrada'))
  else
  begin
     AbreForm(TProFMLstNecesidades, ProFMLstNecesidades, Sender);
     ProFMLstNecesidades.Inicializar(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
  end;
end;

procedure TProFMOrden.AProLstNecesidadesEscExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstNecesidadesEsc, ProFMLstNecesidadesEsc, Sender);
  ProFMLstNecesidadesEsc.Inicializar(ProDMOrden.QMProOrdESCANDALLO.AsInteger, ProDMOrden.QMProOrdUNI_TOTAL.AsFloat);
end;

procedure TProFMOrden.DBGFMaterialesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TProFMOrden.DBGFMaterialesDblClick(Sender: TObject);
begin
  inherited;
  if ProDMOrden.HayMateriales then
  begin
     if (UpperCase(ColActual.FieldName) = 'COMPONENTE') then
        FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
           ProDMOrden.QMProOrdMatCOMPONENTE.AsString + '''' +
           ' AND EJERCICIO=' + REntorno.EjercicioStr);

     if (UpperCase(ColActual.FieldName) = 'ID_EQUIVAL') then
        if (ProDMOrden.QMProOrdMatID_EQUIVAL.AsInteger > 0) then
           FMain.EjecutaAccion(FMain.AProEquivalArt, IntToStr(ProDMOrden.QMProOrdMatID_EQUIVAL.AsInteger));

     // Filtro Ordenes+Subordenes y me posiciono en la suborden que fabrica este componente
     if (UpperCase(ColActual.FieldName) = 'MATESC') then
        ProDMOrden.PosicionaSubordenEscandallo(ProDMOrden.QMProOrdMatMATESC.AsInteger);
  end;
end;

procedure TProFMOrden.AACompuestoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
     ProDMOrden.QMProOrdCOMPUESTO.AsString + '''' +
     ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TProFMOrden.SBACompuestoDblClick(Sender: TObject);
begin
  inherited;
  AACompuesto.Execute;
end;

procedure TProFMOrden.ANewArticuloExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AArticulos);
     if FMain.EnlaceDatos <> Null then
     begin
        ProDMOrden.QMProOrdMatCOMPONENTE.AsString := FMain.EnlaceDatos;
     end;
     DBGFMateriales.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TProFMOrden.AAClienteExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(ProDMorden.QMProOrdCLIENTE.AsInteger));
end;

procedure TProFMOrden.ANewClienteExecute(Sender: TObject);
begin
  inherited;
  FMain.EnlaceModal := True;
  FMain.EnlaceInstancias := True;
  FMain.EnlaceCrea := True;
  FMain.EjecutaAccion(FMain.AClientes);
end;

procedure TProFMOrden.ASerializacionExecute(Sender: TObject);
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado : integer;
  Fecha : TDateTime;
  Unidades : double;
begin
  inherited;
  procedencia := 1;
  if not ProDMOrden.Serializado(1) then
     ShowMessage(_('El artículo no está serializado'))
  else
  begin
     ProDMOrden.DatosSerializacion
     (Serie, Tipo, Almacen, Articulo, Rig, Linea, Fecha, Unidades, Estado, 1);
     MuestraSerializacion
     (Serie, Tipo, Almacen, Articulo, Rig, Linea, Fecha, Unidades, Estado, Self);
  end;
end;

procedure TProFMOrden.ButtZoomMasClick(Sender: TObject);
begin
  inherited;
  DBChartRecursos.ZoomPercent(110);
end;

procedure TProFMOrden.ButtZoomMenosClick(Sender: TObject);
begin
  inherited;
  DBChartRecursos.ZoomPercent(90);
end;

procedure TProFMOrden.ButtCopiarPortapapelesClick(Sender: TObject);
begin
  inherited;
  DBChartRecursos.CopyToClipboardMetafile(True);
end;

procedure TProFMOrden.TButtGraficoTareasClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMGrafTareas, ProFMGrafTareas);
  ProFMGrafTareas.VerGrafico(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.TButtGraficoMaterialesClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMGrafMateriales, ProFMGrafMateriales);
  ProFMGrafMateriales.VerGrafico(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.TButtGraficoCostesFasesClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMGrafCostesFases, ProFMGrafCostesFases);
  ProFMGrafCostesFases.VerGrafico(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.ANotasMaterialesExecute(Sender: TObject);
begin
  inherited;
  // Botó per control·lar les notes dels materials
  // ProDMOrden.PreparaNotasDetalle(ProDMOrden.QMProOrdMat);
  if (ProDMOrden.QMProOrdMat.State in [dsEdit, dsInsert]) then
     ProDMOrden.QMProOrdMat.Post;

  ProDMOrden.xProOrdMatNotas.Open;
  if (ProDMOrden.QMProOrdSITUACION.AsInteger < 2) then
     ProDMOrden.xProOrdMatNotas.Edit;
  EditarCampoNotas(Self, ProDMOrden.DSxProOrdMatNotas, ProDMOrden.xProOrdMatNotas.FieldByName('NOTAS_MAT'));
  ProDMOrden.xProOrdMatNotas.Close;
end;

procedure TProFMOrden.ANotasTareasExecute(Sender: TObject);
begin
  inherited;
  // Botó per control·lar les notes de les tareas
  // ProDMOrden.PreparaNotasDetalle(ProDMOrden.QMProOrdTarea);

  if (ProDMOrden.QMProOrdTarea.State in [dsEdit, dsInsert]) then
     ProDMOrden.QMProOrdTarea.Post;

  if (ProDMOrden.QMProOrdSITUACION.AsInteger < 2) then
     ProDMOrden.xProOrdTareaNotas.Edit;
  EditarCampoNotas(Self, ProDMOrden.DSxProOrdTareaNotas, ProDMOrden.xProOrdTareaNotas.FieldByName('COMENTARIO'));
end;

procedure TProFMOrden.AAEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ESCANDALLO = ''' +
     ProDMOrden.QMProOrdESCANDALLO.AsString + '''');
end;

procedure TProFMOrden.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AAEscandallo.Execute;
end;

procedure TProFMOrden.AIsoAprobadoExecute(Sender: TObject);
var
  id_firma, estado : integer;
begin
  inherited;
  if ProDMOrden.QMProOrdISO_APROBADO.AsInteger = 0 then
  begin
     id_firma := DMMain.Contador_E('IFI');
     TIsoFMFirmas.Create(Self).NuevaFirma(id_firma);
     ProDMOrden.CompruebaFirma(0, id_firma);
  end
  else
     TIsoFMFirmas.Create(Self).AbreFirma(ProDMOrden.QMProOrdEMPRESA.AsInteger,
        ProDMOrden.QMProOrdISO_APROBADO.AsInteger);

  estado := ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdISO_APROBADO.AsInteger);
  ChecksFirmas(estado, -1, -1);
end;

procedure TProFMOrden.AIsoVerificadoExecute(Sender: TObject);
var
  id_firma, estado : integer;
begin
  inherited;
  if ProDMOrden.QMProOrdISO_VERIFICADO.AsInteger = 0 then
  begin
     id_firma := DMMain.Contador_E('IFI');
     TIsoFMFirmas.Create(Self).NuevaFirma(id_firma);
     ProDMOrden.CompruebaFirma(1, id_firma);
  end
  else
     TIsoFMFirmas.Create(Self).AbreFirma(ProDMOrden.QMProOrdEMPRESA.AsInteger,
        ProDMOrden.QMProOrdISO_VERIFICADO.AsInteger);

  estado := ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdISO_VERIFICADO.AsInteger);
  ChecksFirmas(-1, estado, -1);
end;

procedure TProFMOrden.AIsoValidadoExecute(Sender: TObject);
var
  id_firma, estado : integer;
begin
  inherited;
  if ProDMOrden.QMProOrdISO_VALIDADO.AsInteger = 0 then
  begin
     id_firma := DMMain.Contador_E('IFI');
     TIsoFMFirmas.Create(Self).NuevaFirma(id_firma);
     ProDMOrden.CompruebaFirma(2, id_firma);
  end
  else
     TIsoFMFirmas.Create(Self).AbreFirma(ProDMOrden.QMProOrdEMPRESA.AsInteger,
        ProDMOrden.QMProOrdISO_VALIDADO.AsInteger);

  estado := ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdISO_VALIDADO.AsInteger);
  ChecksFirmas(-1, -1, estado);
end;

procedure TProFMOrden.ChecksFirmas(Aprobado, Verificado, Validado: integer);
begin
  if (Aprobado <> -1) then
  begin
     case Aprobado of
        0: ChkBAprobado.State := cbUnchecked;
        1: ChkBAprobado.State := cbChecked;
        else
           ChkBAprobado.State := cbGrayed;
     end;
  end;

  if (Verificado <> -1) then
  begin
     case Verificado of
        0: ChkBVerificado.State := cbUnchecked;
        1: ChkBVerificado.State := cbChecked;
        else
           ChkBVerificado.State := cbGrayed;
     end;
  end;

  if (Validado <> -1) then
  begin
     case Validado of
        0: ChkBValidado.State := cbUnchecked;
        1: ChkBValidado.State := cbChecked;
        else
           ChkBValidado.State := cbGrayed;
     end;
  end;
end;

procedure TProFMOrden.TButtTrabExtClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMTrabExt, ProFMTrabExt, Sender);
  ProFMTrabExt.AbreTrabajoExt(ProDMOrden.QMProOrdTareaID_ORDEN.AsInteger,
     ProDMOrden.QMProOrdTareaLINEA_FASE.AsInteger,
     ProDMOrden.QMProOrdTareaLINEA_TAREA.AsInteger);
end;

procedure TProFMOrden.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TProFMOrden.TSDibujoFasesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEImagenesFases;
  RefrescarImagen(Imagen, ProDMOrden.QMProOrdFasesID_IMAGEN.AsInteger);
end;

procedure TProFMOrden.DBEDescCompuestoEnter(Sender: TObject);
begin
  inherited;
  DBEFCompuesto.SetFocus;
end;

procedure TProFMOrden.DBEFAlmSalChange(Sender: TObject);
begin
  inherited;
  EDescAlmacenSal.Text := DameTituloAlmacen(DBEFAlmSal.Text);
end;

procedure TProFMOrden.DBEFAlmLanChange(Sender: TObject);
begin
  inherited;
  EDescAlmacenLan.Text := DameTituloAlmacen(DBEFAlmLan.Text);
end;

procedure TProFMOrden.DBEFAlmEntChange(Sender: TObject);
begin
  inherited;
  EDescAlmacenEnt.Text := DameTituloAlmacen(DBEFAlmEnt.Text);
end;

procedure TProFMOrden.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  AACliente.Execute;
end;

procedure TProFMOrden.AProLstHojaTrabajoExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstHojaTrabajo, ProFMLstHojaTrabajo, Sender);
end;

procedure TProFMOrden.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMOrden.OptimizaBusqueda(True);
  try
     G2KTableLoc.Click;
  finally
     ProDMOrden.OptimizaBusqueda(False);
  end;
  AjustaBotones;
end;

procedure TProFMOrden.GetTime(Sender: TObject);
var
  Valor : double;
begin
  inherited;
  if (DBGFTareas.SelectedField.FieldName = 'TIME') and (ProDMOrden.QMProOrdTarea.State in [dsInsert, dsEdit]) then
  begin
     if not Assigned(FPregTiempo) then
        FPregTiempo := TFPregTiempo.Create(Self);
     if Length(ProDMOrden.QMProOrdTareaTIME.AsString) = 8 then
     begin
        FPregTiempo.LFEHoras.Text := Copy(ProDMOrden.QMProOrdTareaTIME.AsString, 0, 2);
        FPregTiempo.LFEMinutos.Text := Copy(ProDMOrden.QMProOrdTareaTIME.AsString, 4, 2);
        FPregTiempo.LFESegundos.Text := Copy(ProDMOrden.QMProOrdTareaTIME.AsString, 7, 2);
     end;
     if FPregTiempo.ShowModal() = mrOk then
     begin
        Valor := StrToFloat(FPregTiempo.LFESegundos.Text) + StrToIntDef(FPregTiempo.LFEMinutos.Text, 0) * 60 + StrToIntDef(FPregTiempo.LFEHoras.Text, 0) * 3600;
        ProDMOrden.ModificaTiempoTarea(0, Valor);
     end;
  end;

  if (DBGFTareas.SelectedField.FieldName = 'TIME_UTIL') and (ProDMOrden.QMProOrdTarea.State in [dsInsert, dsEdit]) then
  begin
     if not Assigned(FPregTiempo) then
        FPregTiempo := TFPregTiempo.Create(Self);
     if Length(ProDMOrden.QMProOrdTareaTIME_UTIL.AsString) = 8 then
     begin
        FPregTiempo.LFEHoras.Text := Copy(ProDMOrden.QMProOrdTareaTIME_UTIL.AsString, 0, 2);
        FPregTiempo.LFEMinutos.Text := Copy(ProDMOrden.QMProOrdTareaTIME_UTIL.AsString, 4, 2);
        FPregTiempo.LFESegundos.Text := Copy(ProDMOrden.QMProOrdTareaTIME_UTIL.AsString, 7, 2);
     end;
     if FPregTiempo.ShowModal() = mrOk then
     begin
        Valor := StrToFloat(FPregTiempo.LFESegundos.Text) + StrToIntDef(FPregTiempo.LFEMinutos.Text, 0) * 60 + StrToIntDef(FPregTiempo.LFEHoras.Text, 0) * 3600;
        ProDMOrden.ModificaTiempoTarea(1, Valor);
     end;
  end;
end;

procedure TProFMOrden.DBGFTareasBeforeColExit(Sender: TObject; var Continuar: boolean);
var
  col : integer;
begin
  inherited;

  if ((DBGFTareas.SelectedField.FieldName = 'RECURSO') and (ProDMOrden.QMProOrdTareaTIEMPO.AsFloat = 0)) then
  begin
     col := EncuentraField(DBGFTareas, 'TIEMPO');
     if (col >= 0) then
     begin
        col := EncuentraField(DBGFTareas, 'TIME');
        if (col >= 0) then
        begin
           with DBGFTareas.Columns[col] do
           begin
              if Visible = True then
                 DBGFTareas.SelectedIndex := Index;
           end;
        end;
     end;
  end;
end;

procedure TProFMOrden.DBGFTareasBusqueda(Sender: TObject);
begin
  inherited;
  with DBGFTareas do
     if (SelectedField.FieldName = 'RECURSO') or
        (SelectedField.FieldName = 'ID_UTILLAJE') or
        (SelectedField.FieldName = 'SECCION') or
        (SelectedField.FieldName = 'MAQUINA') then
        Filtros := [obEmpresa]
     else
        Filtros := [];
end;

procedure TProFMOrden.DBGFMaterialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ProDMOrden.HayMateriales then
  begin
     if ((UpperCase(Column.FieldName) = 'COMPONENTE') or (UpperCase(Column.FieldName) = 'ID_EQUIVAL') or (UpperCase(Column.FieldName) = 'MATESC')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     with TDBGridFind2000(Sender) do
     begin
        if (gdFocused in State) then
        begin
           ColorFocused(Canvas);
        end
        else
        begin
           if ((Column.FieldName = 'NUM_PIEZAS') or
              (Column.FieldName = 'COMPRAR') or
              (Column.FieldName = 'UDS_COMPRA') or
              (Column.FieldName = 'PROVEEDOR_COMPRA')) then
           begin
              if (ProDMOrden.QMProOrdMatCOMPRAR.AsInteger = 0) then
                 ColorInfo(DBGFMateriales.Canvas)
              else
                 ColorEdicion(DBGFMateriales.Canvas);
           end
           else
           if (Column.FieldName = 'RESERVA_STOCK') then
           begin
              if (ProDMOrden.QMProOrdMatCOMPRAR.AsInteger = 0) then
                 ColorEdicion(DBGFMateriales.Canvas)
              else
                 ColorInfo(DBGFMateriales.Canvas);
           end
           else
           if (Column.FieldName = 'STOCK') then
           begin
              if (ProDMOrden.QMProOrdMatCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(DBGFMateriales.Canvas)
              else
              begin
                 if (ProDMOrden.QMProOrdMatSTOCK.AsFloat < ProDMOrden.QMProOrdMatUNIDADES_STOCK.AsFloat) then
                    ColorError(DBGFMateriales.Canvas)
                 else
                    ColorInfo(DBGFMateriales.Canvas);
              end;
           end
           else
           if (Column.FieldName = 'STOCK_ALM_LAN') then
           begin
              if (ProDMOrden.QMProOrdMatCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(DBGFMateriales.Canvas)
              else
              begin
                 if (ProDMOrden.QMProOrdMatSTOCK.AsFloat < ProDMOrden.QMProOrdMatUNIDADES_STOCK.AsFloat) then
                    ColorError(DBGFMateriales.Canvas)
                 else
                    ColorInfo(DBGFMateriales.Canvas);
              end;
           end
           else
           if ((Column.FieldName = 'ID_LOTE') or (Column.FieldName = 'LOTE')) then
           begin
              if (ProDMOrden.QMProOrdMatLOTES.AsInteger = 0) then
                 ColorInactivo(DBGFMateriales.Canvas)
              else
              begin
                 if (ProDMOrden.QMProOrdMatLOTES.AsInteger = 0) then
                    ColorError(DBGFMateriales.Canvas)
                 else
                    ColorInfo(DBGFMateriales.Canvas);
              end;
           end
           else
           if ((Column.FieldName = 'ID_UBICACION') or (Column.FieldName = 'TITULO_UBICACION')) then
           begin
              if (ProDMOrden.QMProOrdMatUBICABLE.AsInteger = 0) then
                 ColorInactivo(DBGFMateriales.Canvas)
              else
              begin
                 if (ProDMOrden.QMProOrdMatID_UBICACION.AsInteger = 0) then
                    ColorError(DBGFMateriales.Canvas)
                 else
                    ColorInfo(DBGFMateriales.Canvas);
              end;
           end;
        end;

        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TProFMOrden.FiltraOrden(id_orden: integer);
begin
  ProDMOrden.FiltraOrden(id_orden);
  AjustaBotones;
end;

function TProFMOrden.CurrText(Notas: TDBRichEdit): TTextAttributes;
begin
  if Notas.SelLength > 0 then
     Result := Notas.SelAttributes
  else
     Result := Notas.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TProFMOrden.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontNameFase.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
  FontNameFase.Sorted := True;
end;

procedure TProFMOrden.SelectionChange(Sender: TObject);
begin
  with DBMNotas.Paragraph do
     try
        FUpdating := True;
        TButtNegrita.Down := fsBold in DBMNotas.SelAttributes.Style;
        TButtCursiva.Down := fsItalic in DBMNotas.SelAttributes.Style;
        TButtSubrayado.Down := fsUnderline in DBMNotas.SelAttributes.Style;

        FontSize.Text := IntToStr(DBMNotas.SelAttributes.Size);
        FontName.Text := DBMNotas.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlign.Down := True;
           1: TButtRightAlign.Down := True;
           2: TButtCenterAlign.Down := True;
        end;
     finally
        FUpdating := False;
     end;
end;

procedure TProFMOrden.SelectionChangeFase(Sender: TObject);
begin
  with DBMNotasFases.Paragraph do
     try
        FUpdating := True;
        TButtNegritaFase.Down := fsBold in DBMNotasFases.SelAttributes.Style;
        TButtCursivaFase.Down := fsItalic in DBMNotasFases.SelAttributes.Style;
        TButtSubrayadoFase.Down := fsUnderline in DBMNotasFases.SelAttributes.Style;

        FontSizeFase.Text := IntToStr(DBMNotasFases.SelAttributes.Size);
        FontNameFase.Text := DBMNotasFases.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlignFase.Down := True;
           1: TButtRightAlignFase.Down := True;
           2: TButtCenterAlignFase.Down := True;
        end;
     finally
        FUpdating := False;
     end;
end;

procedure TProFMOrden.TButtUndoClick(Sender: TObject);
begin
  inherited;
  with DBMNotas do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TProFMOrden.TButtCutClick(Sender: TObject);
begin
  inherited;
  DBMNotas.CutToClipboard;
end;

procedure TProFMOrden.TButtCopyClick(Sender: TObject);
begin
  inherited;
  DBMNotas.CopyToClipboard;
end;

procedure TProFMOrden.TButtPasteClick(Sender: TObject);
begin
  inherited;
  DBMNotas.PasteFromClipboard;
end;

procedure TProFMOrden.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotas).Name := FontName.Items[FontName.ItemIndex];
end;

procedure TProFMOrden.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotas).Size := StrToInt(FontSize.Text);
end;

procedure TProFMOrden.TButtNegritaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegrita.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsBold]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsBold];
end;

procedure TProFMOrden.TButtCursivaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursiva.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsItalic]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsItalic];
end;

procedure TProFMOrden.TButtSubrayadoClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayado.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsUnderline]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsUnderline];
end;

procedure TProFMOrden.TButtLeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMOrden.TButtCenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMOrden.TButtRightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMOrden.TButtUndoFaseClick(Sender: TObject);
begin
  inherited;
  with DBMNotasFases do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TProFMOrden.TButtCutFaseClick(Sender: TObject);
begin
  inherited;
  DBMNotasFases.CutToClipboard;
end;

procedure TProFMOrden.TButtCopyFaseClick(Sender: TObject);
begin
  inherited;
  DBMNotasFases.CopyToClipboard;
end;

procedure TProFMOrden.TButtPasteFaseClick(Sender: TObject);
begin
  inherited;
  DBMNotasFases.PasteFromClipboard;
end;

procedure TProFMOrden.FontNameFaseChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotasFases).Name := FontNameFase.Items[FontNameFase.ItemIndex];
end;

procedure TProFMOrden.FontSizeFaseChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotasFases).Size := StrToInt(FontSizeFase.Text);
end;

procedure TProFMOrden.TButtNegritaFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegritaFase.Down then
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style + [fsBold]
  else
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style - [fsBold];
end;

procedure TProFMOrden.TButtCursivaFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursivaFase.Down then
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style + [fsItalic]
  else
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style - [fsItalic];
end;

procedure TProFMOrden.TButtSubrayadoFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayadoFase.Down then
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style + [fsUnderline]
  else
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style - [fsUnderline];
end;

procedure TProFMOrden.TButtLeftAlignFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasFases.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMOrden.TButtCenterAlignFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasFases.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMOrden.TButtRightAlignFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasFases.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMOrden.TButtColorClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBMNotas.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText(DBMNotas).Color := ColorSeleccionado
  else
     CurrText(DBMNotas).Color := ColorDefecto;
end;

procedure TProFMOrden.TButtColorFaseClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBMNotasFases.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText(DBMNotasFases).Color := ColorSeleccionado
  else
     CurrText(DBMNotasFases).Color := ColorDefecto;
end;

procedure TProFMOrden.AInfoStocksExecute(Sender: TObject);
var
  Articulo : string;
  Almacen : string;
begin
  inherited;
  Articulo := '';
  Almacen := '';
  if (Sender is TToolButton) then
  begin
     if (Sender = TButtInfoStocksCompuesto) then
     begin
        Articulo := ProDMOrden.QMProOrdCOMPUESTO.AsString;
        Almacen := ProDMOrden.QMProOrdALMACEN_ENT.AsString;
     end
     else
     if (Sender = TButtInfStocksMaterial) then
     begin
        Articulo := ProDMOrden.QMProOrdMatCOMPONENTE.AsString;
        Almacen := ProDMOrden.QMProOrdMatALMACEN_SAL.AsString;
     end
     else
     if (Sender = TButtInfStocksIncMaterial) then
     begin
        Articulo := ProDMOrden.xInfoIncMaterialCOMPONENTE.AsString;
        Almacen := ProDMOrden.QMProOrdALMACEN_SAL.AsString;
     end
     else
     if (Sender = TButtInfStocksCompras) then
     begin
        Articulo := ProDMOrden.QMProOrdMatCompraARTICULO.AsString;
        Almacen := ProDMOrden.QMProOrdMatCompraALMACEN.AsString;
     end;
  end;

  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TProFMOrden.AEquivalenciaLineaExecute(Sender: TObject);
var
  s : TStrings;
  Seleccion : TFMSeleccionGrid;
  Articulo, Almacen, Almacen_Lanzamiento : string;
begin
  inherited;

  Articulo := ProDMOrden.QMProOrdMatCOMPONENTE.AsString;
  Almacen := ProDMOrden.QMProOrdMatALMACEN_SAL.AsString;
  Almacen_Lanzamiento := ProDMOrden.QMProOrdMatALMACEN.AsString;

  Seleccion := TFMSeleccionGrid.Create(Self);
  with Seleccion do
  begin
     try
        s := TStringList.Create;
        try
           with s do
           begin
              Add(' /* Las equivalencias de una cabecera */ ');
              Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, D.ARTICULO_EQUIVAL, 1)) STOCK_TOTAL, ');
              Add(' (SELECT EXISTENCIAS FROM A_ART_DAME_STOCK_ART_ED (' + REntorno.EmpresaStr + ', ' + REntorno.CanalStr + ', D.ARTICULO_EQUIVAL, ''' + Almacen + ''', 1, 0, 0, 0, 0, 0, 0, NULL) WHERE CANAL = ' + REntorno.CanalStr + ') AS STOCK_ALMANCEN ');
              Add(' (SELECT EXISTENCIAS FROM A_ART_DAME_STOCK_ART_ED (' + REntorno.EmpresaStr + ', ' + REntorno.CanalStr + ', D.ARTICULO_EQUIVAL, ''' + Almacen_Lanzamiento + ''', 1, 0, 0, 0, 0, 0, 0, NULL) WHERE CANAL = ' + REntorno.CanalStr + ') AS STOCK_ALMANCEN_LANZAMIENTO ');
              Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
              Add(' JOIN PRO_SYS_DET_EQUIVAL D ON C.EMPRESA = D.EMPRESA AND C.ID_EQUIVAL = D.ID_EQUIVAL ');
              Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
              Add(' WHERE ');
              Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' C.ARTICULO = ''' + Articulo + ''' ');
              Add(' UNION ');
              Add(' /* Los padres de equivalencias de un detalle */ ');
              Add(' SELECT C.ARTICULO AS ARTICULO, A.TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, C.ARTICULO, 1)) STOCK_TOTAL, ');
              Add(' (SELECT EXISTENCIAS FROM A_ART_DAME_STOCK_ART_ED (' + REntorno.EmpresaStr + ', ' + REntorno.CanalStr + ', C.ARTICULO, ''' + Almacen + ''', 1, 0, 0, 0, 0, 0, 0, NULL) WHERE CANAL = ' + REntorno.CanalStr + ') AS STOCK_ALMANCEN ');
              Add(' (SELECT EXISTENCIAS FROM A_ART_DAME_STOCK_ART_ED (' + REntorno.EmpresaStr + ', ' + REntorno.CanalStr + ', C.ARTICULO, ''' + Almacen_Lanzamiento + ''', 1, 0, 0, 0, 0, 0, 0, NULL) WHERE CANAL = ' + REntorno.CanalStr + ') AS STOCK_ALMANCEN_LANZAMIENTO ');
              Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
              Add(' JOIN ART_ARTICULOS A ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO ');
              Add(' WHERE ');
              Add(' C.ID_EQUIVAL IN ( ');
              Add(' SELECT ID_EQUIVAL ');
              Add(' FROM PRO_SYS_DET_EQUIVAL ');
              Add(' WHERE ');
              Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' ARTICULO_EQUIVAL = ''' + Articulo + ''') ');
              Add(' UNION ');
              Add(' /* Los hermanos de equivalencias de un detalle */ ');
              Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, D.ARTICULO_EQUIVAL, 1)) STOCK_TOTAL,');
              Add(' (SELECT EXISTENCIAS FROM A_ART_DAME_STOCK_ART_ED (' + REntorno.EmpresaStr + ', ' + REntorno.CanalStr + ', D.ARTICULO_EQUIVAL, ''' + Almacen + ''', 1, 0, 0, 0, 0, 0, 0, NULL) WHERE CANAL = ' + REntorno.CanalStr + ') AS STOCK_ALMANCEN ');
              Add(' (SELECT EXISTENCIAS FROM A_ART_DAME_STOCK_ART_ED (' + REntorno.EmpresaStr + ', ' + REntorno.CanalStr + ', D.ARTICULO_EQUIVAL, ''' + Almacen_Lanzamiento + ''', 1, 0, 0, 0, 0, 0, 0, NULL) WHERE CANAL = ' + REntorno.CanalStr + ') AS STOCK_ALMANCEN_LANZAMIENTO ');
              Add(' FROM PRO_SYS_DET_EQUIVAL D ');
              Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
              Add(' WHERE ');
              Add(' D.ARTICULO_EQUIVAL <> ''' + Articulo + ''' AND ');
              Add(' D.ID_EQUIVAL IN ( ');
              Add(' SELECT ID_EQUIVAL ');
              Add(' FROM PRO_SYS_DET_EQUIVAL ');
              Add(' WHERE ');
              Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' ARTICULO_EQUIVAL = ''' + Articulo + ''') ');
           end;
           Caption := _('Selección de artículo');
           AsignaSQL(s.Text);
        finally
           s.Free
        end;

        MostrarColumna('ARTICULO', _('Artículo'), 90);
        MostrarColumna('TITULO', _('Nombre'), 200);
        MostrarColumna('STOCK_ALMANCEN', _('Stock Alm.'), 90);
        MostrarColumna('STOCK_ALMANCEN_LANZAMIENTO', _('Stock A.Lanza.'), 90);
        MostrarColumna('STOCK_TOTAL', _('Stock Total'), 90);

        Articulo := '';
        if (ShowModal = mrOk) then
        begin
           Articulo := FDS.FieldByName('ARTICULO').AsString;

           if (Trim(Articulo) <> '') then
              ProDMOrden.CambiaComponente(Articulo);
        end;
     finally
        FreeAndNil(Seleccion);
     end;
  end;

  (*
  if (ProDMOrden.EquivalenciaLinea) then
     ShowMessage(_('Componente modificado por otro equivalente.'))
  else
     ShowMessage(_('No hay stock de ningún artículo equivalente al componente actual.'));
  *)
end;

procedure TProFMOrden.AUbicacionExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.MuestraUbicacion('ZOM');
end;

procedure TProFMOrden.AUbicacionCompExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.MuestraUbicacion('ZOR');
end;

procedure TProFMOrden.CambiaEstadoCompras(Sender: TObject);
begin
  inherited;
  ProDMOrden.CambiaEstadoCompras(CBFiltroCompras.ItemIndex);
end;

procedure TProFMOrden.AOrigenCompraExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.VerOrigenCompra;
end;

procedure TProFMOrden.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     // Antes de filtrar la serie, debo regenerar el SQL
     if (DMMain.EstadoKri(472) = 1) then
        AFiltrarSituacionSoloActivas.Execute
     else
        AFiltrarSituacionTodo.Execute;

     ProDMOrden.CambiaSerie(EFSerie.Text);
  end;
  ESerie.Text := DameTituloSerie(EFSerie.Text);

  // Captions campos medida
  LblMedida1.Caption := LeeParametro('MEDITIT001', EFSerie.Text);
  LblMedida2.Caption := LeeParametro('MEDITIT002', EFSerie.Text);
  LblMedida3.Caption := LeeParametro('MEDITIT003', EFSerie.Text);
  LblMedida4.Caption := LeeParametro('MEDITIT004', EFSerie.Text);

  GBTyC.Visible := (LeeParametro('MODREST015') = 'S');
end;

procedure TProFMOrden.ALstOrdenCodBarExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstCodBarras, ProFMLstCodBarras, Sender);
  ProFMLstCodBarras.PCMain.ActivePage := ProFMLstCodBarras.TSProduccion;
end;

procedure TProFMOrden.ALstEtiOrdenExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.EtiquetasOrdenes;
end;

procedure TProFMOrden.AMovStocksExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMMovStockOP, ProFMMovStockOP, Sender);
  ProFMMovStockOP.AbreIdOrden(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.CargaCaso(Caso: integer);
begin
  LFCerrarSubOP.Enabled := (Caso = 0);
  LFCompVirtuales.Enabled := (Caso = 2);
end;

procedure TProFMOrden.RGImportarClick(Sender: TObject);
begin
  inherited;
  ProDMOrden.QMProOrdIMPORTAR_OP.AsInteger := RGImportar.ItemIndex;

  case RGImportar.ItemIndex of
     0: RGCaso.ItemIndex := 0;
     1: RGCaso.ItemIndex := 2;
     2: RGCaso.ItemIndex := 2;
     3: RGCaso.ItemIndex := 2;
     4: RGCaso.ItemIndex := 2;
  end;

  CargaCaso(RGCaso.ItemIndex);
end;

procedure TProFMOrden.RGCasoClick(Sender: TObject);
begin
  inherited;
  ProDMOrden.QMProOrdCASO_OP.AsInteger := RGCaso.ItemIndex;
  CargaCaso(ProDMOrden.QMProOrdCASO_OP.AsInteger);

  case RGCaso.ItemIndex of
     0: RGImportar.ItemIndex := 0;
     1: RGImportar.ItemIndex := 0;
     2: RGImportar.ItemIndex := 0;
  end;
end;

procedure TProFMOrden.CargaDatos;
begin
  RGCaso.ItemIndex := ProDMOrden.QMProOrdCASO_OP.AsInteger;
  RGImportar.ItemIndex := ProDMOrden.QMProOrdIMPORTAR_OP.AsInteger;

  CargaCaso(ProDMOrden.QMProOrdCASO_OP.AsInteger);
end;

procedure TProFMOrden.ADocumentosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(ProDMOrden.QMProOrdID_ORDEN.AsString, 'PRO_ORD(ID_ORDEN)', 'DELFOS', _('Ficheros de Orden Producción'));
end;

procedure TProFMOrden.BtIntroduceMedidasClick(Sender: TObject);
begin
  inherited;
  ProDMOrden.IntroduceMedidas;
end;

procedure TProFMOrden.LFResponsableChange(Sender: TObject);
begin
  inherited;
  EDescResponsable.Text := DameTituloEmpleado(StrToIntDef(LFResponsable.Text, 0));
end;

procedure TProFMOrden.TBCarpetasClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMCarpetas, ProFMCarpetas, Sender);
  ProFMCarpetas.Posicionar(ProDMOrden.QMProOrdID_ORDEN.AsInteger, 'OPR');
end;

// sfg_albert - begin - recàlcul de marcatges  per ID
procedure TProFMOrden.AProRecalculoIDExecute(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox(PChar(string(_('Atención : Este Proceso es costoso y puede tardar algunos minutos.'))),
     PChar(string(_('Confirmación'))),
     mb_iconstop + mb_yesno) = id_yes) then
  begin
     ProDMOrden.RecalculaMarcajes(prodmorden.QMProOrdID_ORDEN.AsInteger);
     ProDMOrden.QMProOrd.Refresh;
  end;
end;

// sfg_albert - recàlcul de tots els marcatges

procedure TProFMOrden.ARecalculoTodosExecute(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox(PChar(string('Atención : Este Proceso va a recalcular TODOS los marcajes de TODAS las OF.')),
     PChar(string('Confirmación')),
     mb_iconstop + mb_yesno) = id_yes) then
  begin
     ProDMOrden.RecalculaMarcajes(0);
     ProDMOrden.QMProOrd.Refresh;
  end;
end;

procedure TProFMOrden.DBGFMatComprasDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if (Field.FieldName = 'UdsPendientes') then
     if (Field.AsInteger < 0) then
     begin
        //      (Sender as TDBGridFind2000).Canvas.Brush.color:=clRed
        (Sender as TDBGridFind2000).Canvas.Font.Color := clRed; { En rojo / in red }
        (Sender as TDBGridFind2000).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Field.AsString);
     end
     else
     begin
        //(Sender as TDBGridFind2000).Canvas.Brush.color:=clGreen;
        (Sender as TDBGridFind2000).Canvas.Font.Color := clGreen; { En rojo / in red }
        (Sender as TDBGridFind2000).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Field.AsString);
     end;

  { NOMBRE es el nombre del campo a pintar de otro color }
  { NOMBRE this the field name to paint in a diferent color }
  //if Field.FieldName = 'NOMBRE' then
  //(Sender as TDBGrid).Canvas.Font.Color := clRed; { En rojo / in red }
  //(Sender as TDBGrid).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,Field.AsString);
end;

procedure TProFMOrden.DBGFMatComprasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  { if (ProDMOrden.QMProOrdMatCompraUdsPendientes.AsFloat >0) then
   begin
     DBGFMatCompras.Canvas.Font.Style := DBGFMatCompras.Canvas.Font.Style + [fsBold];
     DBGFMatCompras.Canvas.Brush.Color := clRed;{Al cumplirse la condicion cambias el
     color a rojo}
  {     DBGFMatCompras.Canvas.FillRect(Rect);
     State := [gdSelected, gdFocused];
     DBGFMatCompras.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    {Con esto solo afectara a la linea activa}
  {  end;

  { with DBGFMatCompras do
  begin
    if (datacol = 15) then
    begin
      if (ProDMOrden.QMProOrdMatCompraUdsPendientes.AsFloat<0) then
        begin
          canvas.Font.color := clRed;
          if (gdSelected in State) and Focused then canvas.Brush.color := clWhite
        end;
    end;
    DefaultDrawColumnCell(rect, datacol, column, state);
  end;

{  if ((Column.FieldName) = 'UdsPendientes') then
    if (column.Field.AsInteger<>0) then
           (Sender as TDBGridFind2000).Canvas.Brush.color:=clRed
    else
      (Sender as TDBGridFind2000).Canvas.Brush.color:=clGreen;
}
end;

procedure TProFMOrden.ARecuperarPrecioVExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.RecuperarPrecioVenta;
end;

procedure TProFMOrden.APedidoExecute(Sender: TObject);
var
  Ejercicio : integer;
begin
  inherited;
  Ejercicio := DameEjercicio(REntorno.Empresa, ProDMOrden.QMProOrdFECHA_PED.AsDateTime);

  { TODO : ¿No debería utilizarse la serie de la orden? }
  if (Ejercicio = REntorno.Ejercicio) then
     FMain.MuestraDocumento(REntorno.Ejercicio, 'PEC', REntorno.Serie, ProDMOrden.QMProOrdPEDIDO.AsInteger)
  else
     FMain.MuestraDocumento(Ejercicio, 'PEC', REntorno.Serie, ProDMOrden.QMProOrdPEDIDO.AsInteger);
end;

procedure TProFMOrden.SBAPedidoDblClick(Sender: TObject);
begin
  inherited;
  if ((ProDMOrden.QMProOrdPEDIDO.AsInteger <> 0) and (ProDMOrden.QMProOrdPEDIDO.AsInteger <> -1)) then
     APedido.Execute;
end;

procedure TProFMOrden.PCMatTareaChange(Sender: TObject);
var
  c : integer;
begin
  inherited;
  if (PCMatTarea.ActivePage = TSMatCompra) then
  begin
     // c era 9, que corresponde con B_DTO_LINEAS.
     // parece que tiene mas sentido que sea UDS_UTILIZADAS.
     c := EncuentraField(DBGFMatCompras, 'UDS_UTILIZADAS');

     if (ProDMOrden.PermitirModificarCompras) then
     begin
        if (c >= 0) then
        begin
           DBGFMatCompras.Columns[c].ReadOnly := False;
           DBGFMatCompras.Columns[c].Color := clWindow;
        end;
     end
     else
     begin
        if (c >= 0) then
        begin
           DBGFMatCompras.Columns[c].ReadOnly := True;
           DBGFMatCompras.Columns[c].Color := clInfoBk;
        end;
     end;

     with NavMatCompras do
     begin
        if (ProDMOrden.PermitirModificarCompras) then
           VisibleButtons := VisibleButtons + [nbEdit]
        else
           VisibleButtons := VisibleButtons - [nbEdit];

        if (ProDMOrden.PermitirBorrarCompras) then
           VisibleButtons := VisibleButtons + [nbDelete]
        else
           VisibleButtons := VisibleButtons - [nbDelete];

        // Si se permite editar o borrar, debo dar la posibilidad de grabar o cancelar.
        if (ProDMOrden.PermitirModificarCompras or ProDMOrden.PermitirBorrarCompras) then
           VisibleButtons := VisibleButtons + [nbCancel, nbPost]
        else
           VisibleButtons := VisibleButtons - [nbCancel, nbPost];
     end;
  end;
end;

procedure TProFMOrden.ARecalculoCostesExecute(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ProDMOrden.RecalcularCostesMasivo;
  Screen.Cursor := crDefault;

  ShowMessage(_('El recálculo de costes se ha ejecutado con éxito'));
end;

procedure TProFMOrden.ARecuperarMarcajesExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.RecuperarMarcaje;
  ProDMOrden.MarcaRecuperado(True);
  AjustaBotones;
end;

procedure TProFMOrden.TSCostesShow(Sender: TObject);
begin
  inherited;
  // PCostes.SetFocus;
end;

procedure TProFMOrden.BtIncidenciaClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMMatInc, ProFMMatInc, Sender);
  ProFMMatInc.InsertaCabecera(ProdMOrden.QMProOrdID_ORDEN.AsInteger,
     ProdMOrden.QMProOrdFasesTIPOFASE.AsString,
     ProdMOrden.QMProOrdFasesLINEA_FASE.AsInteger,
     ProdMOrden.QMProOrdALMACEN_SAL.AsString,
     ProdMOrden.QMProOrdALMACEN_LAN.AsString);
  ProFMMatInc.origen := 'produccion';
  ProFMMatInc.moduldades := ProDMOrden;
end;

procedure TProFMOrden.ALstOrdenDetExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstOrdenDet, ProFMLstOrdenDet, Sender);
end;

procedure TProFMOrden.AIncMatDetExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMMatInc, ProFMMatInc, Sender);
  ProFMMatInc.FiltraCabecera(ProDMOrden.xInfoIncMaterialID_INC_C.AsInteger);
  ProFMMatInc.origen := 'produccion';
  ProFMMatInc.moduldades := ProDMOrden;
end;

procedure TProFMOrden.DBGIncMaterialDblClick(Sender: TObject);
begin
  inherited;
  AIncMatDet.Execute;
end;

procedure TProFMOrden.TSGraficoShow(Sender: TObject);
begin
  inherited;
  ProDMOrden.xGrafRecursosFases.Open;
end;

procedure TProFMOrden.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSGrafico) then
     ProDMOrden.xGrafRecursosFases.Close;
  if (PCMain.ActivePage = TSNav) then
  begin
     ProDMOrden.QMProOrdG.Close;
     ProDMOrden.xInfoFase.Close;
  end;
  if (PCMain.ActivePage = TSDesarrollo) then
  begin
     if (PCMatTarea.ActivePage = TSMatCompra) then
        ProDMOrden.QMProOrdMatCompra.Close;
     ProDMOrden.QMProOrdFases.Close;
  end;
end;

procedure TProFMOrden.DBGRelacionOrdenesCellClick(Column: TColumn);
begin
  inherited;
  with ProDMOrden do
  begin
     QMProOrdFasesG.DataSource := DSQMProOrdG;
     QMProOrdMatG.DataSource := DSQMProOrdFasesG;
     QMProOrdTarG.DataSource := DSQMProOrdFasesG;
     QMProOrdFasesG.Open;
  end;
  Orden.Caption := Format(_('Desarrollo de la Orden nº %d'), [ProDMOrden.QMProOrdGRig_Of.AsInteger]);
end;

procedure TProFMOrden.DBGRelacionSubordenesCellClick(Column: TColumn);
begin
  inherited;
  with ProDMOrden do
  begin
     QMProOrdFasesG.DataSource := DSQSubOrdenes;
     QMProOrdMatG.DataSource := DSQMProOrdFasesG;
     QMProOrdTarG.DataSource := DSQMProOrdFasesG;
     QMProOrdFasesG.Open;
  end;

  Orden.Caption := Format(_('Desarrollo de la Orden nº %d'), [ProDMOrden.QSubOrdenesRig_Of.AsInteger]);
end;

procedure TProFMOrden.DBGFMaterialesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        ProDMOrden.InfoLotes(True);
  end;
end;

procedure TProFMOrden.LFDUbicacionBusqueda(Sender: TObject);
begin
  inherited;
  LFDUbicacion.CondicionBusqueda :=
     'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + ProDMOrden.QMProOrdALMACEN_ENT.AsString + '''';
end;

procedure TProFMOrden.DBELoteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = 114) then //F3
  begin
     ProDMOrden.Infolotes(False);
  end;
end;

procedure TProFMOrden.AFichaTecnicaExecute(Sender: TObject);
begin
  ProDMOrden.CrearFichaTecnica;
end;

procedure TProFMOrden.LFDTituloLoteDblClick(Sender: TObject);
begin
  inherited;
  ALote.Execute;
end;

procedure TProFMOrden.SBALoteDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(ProDMOrden.QMProOrdID_LOTE.AsInteger));
end;

procedure TProFMOrden.DBEFUnidadChange(Sender: TObject);
begin
  inherited;
  EDescTipoUnidad.Text := DameTituloTipoUnidad(DBEFUnidad.Text);
end;

procedure TProFMOrden.AInfoCierreExecute(Sender: TObject);
var
  IntroduceDatos : TProFMIntroduceDatosCierre;
begin
  inherited;
  IntroduceDatos := TProFMIntroduceDatosCierre.Create(Self);
  with IntroduceDatos do
  begin
     FiltraSituacion(ProDMOrden.QMProOrdSITUACION.AsInteger);
     BSeguir.Caption := _('&Cerrar');
     BCancelar.Visible := False;
     ShowModal;
  end;
end;

procedure TProFMOrden.AInfoCierresParcialesExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMInfoCierresParciales, ProFMInfoCierresParciales, Sender);
  ProFMInfoCierresParciales.AbrirCierres(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.ASituacionSiguienteExecute(Sender: TObject);
begin
  inherited;
  DMMain.LogIni('ASituacionSiguienteExecute');

  // Situaciones: Deslanzar, Lanzar, Reservado, Cierre Total
  ProDMOrden.SituacionSiguiente(False);

  AjustaBotones;

  DMMain.LogFin('ASituacionSiguienteExecute');
end;

procedure TProFMOrden.ASituacionAnteriorExecute(Sender: TObject);
begin
  inherited;
  // estados: Deslanzar, Lanzar, Reservado, Cierre Total
  AjustaBotones;
  ProDMOrden.SituacionAnterior;
  AjustaBotones;
end;

procedure TProFMOrden.TSNavShow(Sender: TObject);
begin
  inherited;
  ProDMOrden.QMProOrdG.Open;
  ProDMOrden.xInfoFase.Open;
end;

procedure TProFMOrden.TSDesarrolloShow(Sender: TObject);
begin
  inherited;
  if (not ProDMOrden.QMProOrdFases.Active) then
     ProDMOrden.QMProOrdFases.Open;
  if (PCFases.ActivePage = TSDibujoFases) then
     TSDibujoFasesShow(Sender);
  if (PCMatTarea.ActivePage = TSMatCompra) then
     TSMatCompraShow(Sender);
end;

procedure TProFMOrden.PCMatTareaChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMatTarea.ActivePage = TSMatCompra) then
     ProDMOrden.QMProOrdMatCompra.Close;
end;

procedure TProFMOrden.TSMatCompraShow(Sender: TObject);
begin
  inherited;
  CambiaEstadoCompras(Sender);
end;

procedure TProFMOrden.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ProDMOrden.QMProOrdFasesID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TProFMOrden.NavDibujoFasesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TProFMOrden.ACierreParcialOrdenExecute(Sender: TObject);
begin
  inherited;
  // Cierra parcialmente una orde solo si está reservada y no cerrada totalmente
  if ((ProDMOrden.QMProOrdSITUACION.AsInteger > 1) and (ProDMOrden.QMProOrdSITUACION.AsInteger < 4)) then
  begin
     FMain.EjecutaAccion(FMain.ACierreParcialOrden);
     FMCierreParcialOrden.CrearCierre(ProDMOrden.QMProOrdID_ORDEN.AsInteger);

     // Para refrescar los datos y botones.
     ProDMOrden.PosicionaIdOrden(ProDMOrden.QMProOrdID_ORDEN.AsInteger);

     ProDMOrden.RefrescaStock;

     // PCMainChange(Sender);
  end;
  AjustaBotones;
end;

procedure TProFMOrden.APropagaAlmacenLanzamientoAMaterialesExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.PropagaAlmacenLanzamientoAMateriales;
  AjustaBotones;
end;

procedure TProFMOrden.AFiltraOrdenesYSubordenesExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.FiltraOrdenesYSubordenes;

  // PCMainChange(Sender);

  AjustaBotones;
end;

procedure TProFMOrden.AFiltrarSituacionExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.FiltraOrdenesSituacion(TAction(Sender).Tag);

  // PCMainChange(Sender);

  AjustaBotones;
end;

procedure TProFMOrden.AFiltrarAlmacenLanzamientoExecute(Sender: TObject);
var
  Almacen : string;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Almacen := TAction(Sender).Caption;
  if (Almacen = _('Todos los Almacenes')) then
     Almacen := ''
  else
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);

  ProDMOrden.FiltraOrdenesAlmacenLanzamiento(Almacen);

  // PCMainChange(Sender);

  AjustaBotones;
end;

procedure TProFMOrden.AReservarNuevamenteExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.SituacionSiguiente(True);
  AjustaBotones;
  // PCMainChange(nil);
end;

procedure TProFMOrden.AEnviarATrabajoExternoExecute(Sender: TObject);
var
  AlmacenOri, AlmacenDst : string;
  Cantidad : double;
begin
  inherited;
  /// Pregunta almacén y unidades y genera un movimiento de traspaso entre almacenes con el compuesto y el almacén de lanzamiento como almacén origen
  AlmacenOri := ProDMOrden.QMProOrdALMACEN_LAN.AsString;
  AlmacenDst := '';
  Cantidad := ProDMOrden.QMProOrdUNI_MANUAL.AsFloat;
  if DameAlmacenCantidad(AlmacenOri, AlmacenDst, Cantidad) then
  begin
     ProDMOrden.EnvioTrabajoExterno('PEN', AlmacenOri, AlmacenDst, Cantidad);
  end;
end;

procedure TProFMOrden.ARecibirTrabajoExternoExecute(Sender: TObject);
var
  AlmacenOri, AlmacenDst : string;
  Cantidad : double;
begin
  inherited;
  /// Pregunta almacén y unidades y genera un movimiento de traspaso entre almacenes con el compuesto y el almacén de lanzamiento como almacén destino
  AlmacenOri := '';
  AlmacenDst := ProDMOrden.QMProOrdALMACEN_LAN.AsString;
  Cantidad := ProDMOrden.QMProOrdUNI_MANUAL.AsFloat;
  if DameAlmacenCantidad(AlmacenOri, AlmacenDst, Cantidad) then
  begin
     ProDMOrden.EnvioTrabajoExterno('PRC', AlmacenOri, AlmacenDst, Cantidad);
  end;
end;

procedure TProFMOrden.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end
     else
     begin
        if (UpperCase(Column.FieldName) = 'ESTADO_RESERVA') then
        begin
           case ProDMOrden.QMProOrdESTADO_RESERVA.AsInteger of
              -1: ColorInactivo(Canvas);
              0: ColorInfo(Canvas);
              5: ColorResaltado2(Canvas);
              else
                 ColorError(Canvas);
           end;
        end
        else
        if ((UpperCase(Column.FieldName) = 'FECHA_ORD') or (UpperCase(Column.FieldName) = 'FECHA_INI')) then
        begin
           if (ProDMOrden.QMProOrdREALIZABLE.AsInteger = 1) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGridFind2000}
end;

procedure TProFMOrden.AInfoReservaExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMInfoReservas, ProFMInfoReservas);
  ProFMInfoReservas.Reservas(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.DBEFCompuestoChange(Sender: TObject);
begin
  inherited;
  if (DBEFCompuesto.DataSource.DataSet.State in [dsInsert, dsEdit]) then
  begin
     DBEDescCompuesto.Text := DameTituloArticulo(DBEFCompuesto.Text);
  end;

  RefrescaCantidadEscandalos;
end;

procedure TProFMOrden.RefrescaCantidadEscandalos;
begin
  // Cantidad de escandallos activos para el compuesto
  if (ProDMOrden.QMProOrdCANT_ESCANDALLO.AsInteger <= 1) then
  begin
     LEscandallo.Caption := _('Escandallo');
     LEscandallo.ParentColor := True;
     LEscandallo.ParentFont := True;
     LEscandallo.ParentShowHint := True;
  end
  else
  begin
     LEscandallo.Caption := Format(' ' + _('Esc. +%d') + ' ', [ProDMOrden.QMProOrdCANT_ESCANDALLO.AsInteger]);
     LEscandallo.Color := clYellow;
     LEscandallo.Font.Style := [fsBold];
     LEscandallo.ParentShowHint := False;
     LEscandallo.Hint := _('El compuesto tiene mas de un escandallo de fabricacion.');
  end;
end;

procedure TProFMOrden.ADesvinculaSubordenesExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.DesvincularOrdensuborden(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.ACierraSubordenesExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.CierraSubordenes(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.AGeneraPropuestaPedidoExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.GeneraPropuestaPedido(ProDMOrden.QMProOrdID_ORDEN.AsInteger, EFSerie.Text);
end;

procedure TProFMOrden.AHojaDeTrabajoExecute(Sender: TObject);
begin
  inherited;
  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.AHojaDeTrabajo);
  FMHojaDeTrabajo.Filtrar('PRO', ProDMOrden.QMProOrdID_ORDEN.AsInteger);
  {$ENDIF}
end;

procedure TProFMOrden.DBEEstadoCabeceraChange(Sender: TObject);
begin
  inherited;
  ColorSegunSituacion(Sender, ProDMOrden.QMProOrdSITUACION.AsInteger);
end;

procedure TProFMOrden.AAdjuntosOrdenExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('OPR', ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.AInfoMarcajesExecute(Sender: TObject);
begin
  inherited;
  {$IFNDEF TPV}
  AbreForm(TProFMInfoMarcajes, ProFMInfoMarcajes);
  ProFMInfoMarcajes.Marcajes(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
  {$ENDIF}
end;

procedure TProFMOrden.BClipboardClick(Sender: TObject);
begin
  inherited;
  ProDMOrden.QMProOrdFasesID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TProFMOrden.DBGFTareasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIME') or (UpperCase(Column.FieldName) = 'TIME_UTIL') or
     (UpperCase(Column.FieldName) = 'ID_UTILLAJE') or (UpperCase(Column.FieldName) = 'DESC_UTILLAJE')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end;{
     else
     begin

     end;
     }

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TProFMOrden.EFProyectoChange(Sender: TObject);
begin
  inherited;
  ETitProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TProFMOrden.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TProFMOrden.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TProFMOrden.SBALoteReservaDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(ProDMOrden.QMProOrdID_LOTE_RESERVA.AsInteger));
end;

procedure TProFMOrden.AListarEtiquetasExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos('PRO', ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.LFDBIdOrdenChange(Sender: TObject);
begin
  inherited;

  if (LFDBIdOrden.Text > '') then
  begin
     if (PCMain.ActivePage = TSFicha) then
     begin
        // Marcamos los checks de firmas ISO segun si tienen firma o no
        ChecksFirmas(
           ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdESTADO_FIRMA_ISO_APROBADO.AsInteger),
           ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdESTADO_FIRMA_ISO_VERIFICADO.AsInteger),
           ProDMOrden.EstadoFirma(ProDMOrden.QMProOrdESTADO_FIRMA_ISO_VALIDADO.AsInteger));
     end;

     Orden.Caption := Format(_('Desarrollo de la Orden nº %s'), [DBEOrden.Text]);

     CargaDatos;

     AjustaBotones;
  end;
end;

procedure TProFMOrden.TBRefrescaStockMaterialesClick(Sender: TObject);
begin
  inherited;
  ProDMOrden.RefrescaStock;
  Refrescar(ProDMOrden.QMProOrdMat, 'ID_ORDEN_MAT', ProDMOrden.QMProOrdMatID_ORDEN_MAT.AsInteger);
end;

procedure TProFMOrden.ALanzarMasSubordenesExecute(Sender: TObject);
begin
  inherited;
  ProDMOrden.LanzaOrdenMasSubordenes;

  AjustaBotones;
end;

procedure TProFMOrden.NavMaterialesChangeState(Sender: TObject);
var
  c : integer;
begin
  inherited;
  c := EncuentraField(DBGFMateriales, 'COMPONENTE');
  if (c >= 0) then
     DBGFMateriales.ColumnaInicial := c;
end;

procedure TProFMOrden.DBGFMaterialesColEnter(Sender: TObject);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     SalirSiNoExiste := False;
     SalirSiVacio := True;
     if (SelectedField.FieldName = 'COMPONENTE') then
     begin
        SalirSiNoExiste := True;
     end
     else
     if SelectedField.FieldName = 'LINEA_TAREA' then
     begin
        SalirSiNoExiste := True;
     end;
  end;
end;

procedure TProFMOrden.AAEscandallo2Execute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ESCANDALLO = ''' +
     ProDMOrden.QMProOrdESCANDALLO_2.AsString + '''');
end;

procedure TProFMOrden.DBEFEscandallo2Change(Sender: TObject);
begin
  inherited;
  DBEDescCompuesto2.Text := DameTituloEscandalloProduccion(ProDMOrden.QMProOrdESCANDALLO_2.AsInteger);
end;

procedure TProFMOrden.DBEFEscandallo2Busqueda(Sender: TObject);
begin
  inherited;
  DBEFEscandallo.CondicionBusqueda := '(ESTADO=1 AND TIPO=''EPR'') or ESCANDALLO=0';
end;

procedure TProFMOrden.SBAEscandallo2DblClick(Sender: TObject);
begin
  inherited;
  AAEscandallo2.Execute;
end;

procedure TProFMOrden.FormShow(Sender: TObject);
var
  c : integer;
begin
  inherited;
  c := EncuentraField(DBGFMateriales, 'TITULO_LARGO');
  if (c < 0) then
  begin
     with DBGFMateriales.Columns.Add do
     begin
        FieldName := 'TITULO_LARGO';
        ReadOnly := True;
        Color := clInfoBk;

        // Trato de ubicar esta columna despues de la de componente.
        c := EncuentraField(DBGFMateriales, 'COMPONENTE');
        if (c >= 0) then
        begin
           c := DBGFMateriales.Columns[c].Index;
           Index := c + 1;
        end;
     end;
  end
  else
     DBGFMateriales.Columns[c].Visible := True;

  AjustaBotones;
end;

procedure TProFMOrden.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('OPR', ProDMOrden.QMProOrdID_ORDEN.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosOrden.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TProFMOrden.DBGFFasesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (Column.FieldName = 'DIFERENCIA_TIEMPO') then
     begin
        if (ProDMOrden.QMProOrdFasesDIFERENCIA_TIEMPO.AsFloat = 0) then
           ColorInfo(DBGFFases.Canvas)
        else
        if (ProDMOrden.QMProOrdFasesDIFERENCIA_TIEMPO.AsFloat < 0) then
           ColorError(DBGFFases.Canvas)
        else
           ColorResaltado4(DBGFFases.Canvas);

        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TProFMOrden.ACreaMovimientoComponenteExecute(Sender: TObject);
var
  IdOrden : integer;
  Componente, AlmacenOri, AlmacenDst, Tipo, Comentario : string;
  Cantidad : double;
begin
  inherited;
  // Pregunta tipo, componente, almacén, unidades y comentario y genera un movimiento
  IdOrden := ProDMOrden.QMProOrdID_ORDEN.AsInteger;
  Componente := '';
  AlmacenOri := ProDMOrden.QMProOrdALMACEN_SAL.AsString;
  AlmacenDst := ProDMOrden.QMProOrdALMACEN_LAN.AsString;
  Tipo := '';
  Comentario := '';
  Cantidad := 0;

  if DameComponenteAlmacenTipoCantidad(IdOrden, Componente, AlmacenOri, AlmacenDst, Tipo, Comentario, Cantidad) then
  begin
     ProDMOrden.CreaMovimientoComponente(Tipo, Componente, AlmacenOri, AlmacenDst, Comentario, Cantidad);
  end;
end;

procedure TProFMOrden.TBMovimientosClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMMovStockOP, ProFMMovStockOP, Sender);
  ProFMMovStockOP.AbreIdOrden(ProDMOrden.QMProOrdID_ORDEN.AsInteger);
end;

procedure TProFMOrden.AEscandalloMaterialExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ESCANDALLO = ''' + ProDMOrden.QMProOrdMatMATESC.AsString + '''');
end;

procedure TProFMOrden.TBCopiarAPortapapelesClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  s := FloatToStrDec(ProDMOrden.xInfoActualizadaPRECIO_VENTA_TOT_REAL.AsFloat, '.');
  s := s + #13#10 + FloatToStrDec(ProDMOrden.xInfoActualizadaCOSTE_MAT_REAL.AsFloat, '.');
  s := s + #13#10 + FloatToStrDec(ProDMOrden.xInfoActualizadaCOSTE_MO_REAL.AsFloat, '.');
  s := s + #13#10 + FloatToStrDec(ProDMOrden.xInfoActualizadaCOSTE_MAQ_REAL.AsFloat, '.');
  s := s + #13#10 + FloatToStrDec(ProDMOrden.xInfoActualizadaCOSTE_COMPRAS.AsFloat, '.');
  s := s + #13#10 + FloatToStrDec(ProDMOrden.xInfoActualizadaHORAS_MAQUINA.AsFloat, '.');
  s := s + #13#10 + FloatToStrDec(ProDMOrden.xInfoActualizadaHORAS_OPERARIO.AsFloat, '.');

  DMMain.CargarClipboardTexto(s);
end;

procedure TProFMOrden.AExportarDatosOrdenesExecute(Sender: TObject);
var
  Fecha : TDateTime;
  Archivo : string;
  HCalc : THojaCalc;
  Col, c : integer;
  Cabecera : string;
begin
  /// Exportación realizada para DICOMOL.
  /// Ciertos datos de coste de ordenes cuyo compuesto empieza por "M"

  Fecha := EncodeDate(REntorno.Ejercicio, 1, 1);
  if not PideDato('DAT', Fecha, _('Exportar ordenes')) then
     Exit;

  Archivo := 'OrdenesCostes_' + FormatDateTime('yyyymmdd', Fecha) + '.ods';
  if not MySaveDialog(Archivo, 'XLS,ODS', '', 'ProFMOrden_ExportOrdenes') then
     Exit;

  if Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0 then
     HCalc := THojaCalc.Create(thcExcel, False)
  else
     HCalc := THojaCalc.Create(thcOpenOffice, False);

  try
     HCalc.FileName := Archivo;
     HCalc.ActivateSheetByIndex(1);

     // Etiquetas de filas en la columna 1
     HCalc.CellText[1, 1] := _('Orden');
     HCalc.Bold(1, 1);
     HCalc.BackgroundColor(1, 1, clSilver);
     HCalc.CellText[2, 1] := 'Compuesto';
     HCalc.CellText[3, 1] := 'Coste Material';
     HCalc.CellText[4, 1] := 'Coste Mano Obra';
     HCalc.CellText[5, 1] := 'Coste Maquina';
     HCalc.CellText[6, 1] := 'Coste Compras';
     HCalc.CellText[7, 1] := 'Horas Maquina';
     HCalc.CellText[8, 1] := 'Horas Operario';

     Col := 2;

     with TFIBDataSet.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if not Transaction.InTransaction then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT RIG_OF, SUBORDEN, COMPUESTO, COSTE_MAT_REAL, ');
              SelectSQL.Add('        COSTE_MO_REAL, COSTE_MAQ_REAL, COSTE_COMPRAS, ');
              SelectSQL.Add('        HORAS_MAQUINA, HORAS_OPERARIO ');
              SelectSQL.Add(' FROM VER_PRO_ORD ');
              SelectSQL.Add(' WHERE EMPRESA = :EMPRESA ');
              // SelectSQL.Add('   AND EJERCICIO = :EJERCICIO ');
              SelectSQL.Add('   AND CANAL = :CANAL ');
              SelectSQL.Add('   AND FECHA_ORD >= :FECHA ');
              SelectSQL.Add('   AND COMPUESTO LIKE ''M%'' ');
              SelectSQL.Add(' ORDER BY RIG_OF, SUBORDEN ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Open;
              while not EOF do
              begin
                 // Encabezado de columna: numero de orden (y suborden si aplica)
                 Cabecera := 'OF-' + FieldByName('RIG_OF').AsString;
                 if FieldByName('SUBORDEN').AsInteger > 0 then
                    Cabecera := Cabecera + '/' + FieldByName('SUBORDEN').AsString;

                 HCalc.CellText[1, Col] := Cabecera;
                 HCalc.Bold(1, Col);
                 HCalc.BackgroundColor(1, Col, clSilver);

                 HCalc.CellText[2, Col] := FieldByName('COMPUESTO').AsString;
                 HCalc.SendNumber(3, Col, FieldByName('COSTE_MAT_REAL').AsFloat);
                 HCalc.SendNumber(4, Col, FieldByName('COSTE_MO_REAL').AsFloat);
                 HCalc.SendNumber(5, Col, FieldByName('COSTE_MAQ_REAL').AsFloat);
                 HCalc.SendNumber(6, Col, FieldByName('COSTE_COMPRAS').AsFloat);
                 HCalc.SendNumber(7, Col, FieldByName('HORAS_MAQUINA').AsFloat);
                 HCalc.SendNumber(8, Col, FieldByName('HORAS_OPERARIO').AsFloat);

                 Inc(Col);
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

     // Formato num'e'rico para columnas de datos (filas 3..8)
     for c := 2 to Col - 1 do
        HCalc.ColNumberFormat(c, '#' + ThousandSeparator + '##0' + DecimalSeparator + '000');

     HCalc.AutoFit(1);

     HCalc.SaveDocAs(Archivo, Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0);
     Sleep(1000);
  finally
     HCalc.Free;
  end;
end;

procedure TProFMOrden.DBGFTareasDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'ID_UTILLAJE') or (UpperCase(ColActual.FieldName) = 'DESC_UTILLAJE')) then
     FMain.EjecutaAccion(FMain.AProUtillajes, ProDMOrden.QMProOrdTareaID_UTILLAJE.AsString);

  if ((UpperCase(ColActual.FieldName) = 'TIME') or (UpperCase(ColActual.FieldName) = 'TIME_UTIL')) then
     GetTime(Sender);
end;

procedure TProFMOrden.DBGFTareasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
