unit UProFMEscandallo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, DBCtrls, ComCtrls, UDBDateTimePicker, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UFormGest,
  ExtDlgs, DB, Buttons, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, UFPregTiempo, ULFLabel,
  ULFEdit, ImgList, Math, DbComboBoxValue, ULFEditFind2000, ULFComboBox;

type
  TProFMEscandallo = class(TFPEdit)
     TSDetalle: TTabSheet;
     TSDibujoEsc: TTabSheet;
     LblEscandallo: TLFLabel;
     DBEEscandallo: TLFDBEdit;
     LblCompuesto: TLFLabel;
     DBEFCompuesto: TLFDBEditFind2000;
     LblFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LblUnidades: TLFLabel;
     LblMedida1: TLFLabel;
     LBLVersion: TLFLabel;
     DBEUnidades: TLFDBEdit;
     LblUnidad: TLFLabel;
     DBEFUnidad: TLFDBEditFind2000;
     LblMedida2: TLFLabel;
     DBEMedida2: TLFDBEdit;
     DBEVersion: TLFDbedit;
     DBEMedida1: TLFDBEdit;
     LblMedida3: TLFLabel;
     DBEMedida3: TLFDBEdit;
     PnlDetEscandallo: TLFPanel;
     PnlFases: TLFPanel;
     PCFases: TLFPageControl;
     TSFases: TTabSheet;
     TSNotasFases: TTabSheet;
     TSDibujoFases: TTabSheet;
     PCMatTar: TLFPageControl;
     TSMateriales: TTabSheet;
     TSTareas: TTabSheet;
     TBMateriales: TLFToolBar;
     TBTareas: TLFToolBar;
     TBFases: TLFToolBar;
     TBDibujoFase: TLFToolBar;
     TBFaseNotas: TLFToolBar;
     NavNotasFases: THYMNavigator;
     NavMateriales: THYMNavigator;
     NavTareas: THYMNavigator;
     DBGFMateriales: TDBGridFind2000;
     DBGFTareas: TDBGridFind2000;
     DBGFDibujoEsc: TDBGridFind2000;
     EscImagen: TImage;
     TBDibujoEsc: TLFToolBar;
     TSNotasEsc: TTabSheet;
     TBNotas: TLFToolBar;
     NavNotasEsc: THYMNavigator;
     CENotasEsc: TControlEdit;
     CENotasEscPMEdit: TPopUpTeclas;
     CEDibujoEsc: TControlEdit;
     CEDibujoEscPMEdit: TPopUpTeclas;
     CENotasFases: TControlEdit;
     CENotasFasesPMEdit: TPopUpTeclas;
     CEMateriales: TControlEdit;
     CEMaterialesPMEdit: TPopUpTeclas;
     CETareas: TControlEdit;
     CETareasPMEdit: TPopUpTeclas;
     DBEEscNotas: TLFDbedit;
     ETituloNotas: TLFEdit;
     DBEEscDib: TLFDbedit;
     ETituloDib: TLFEdit;
     DBECompuestoFase: TLFDbedit;
     ETituloCompuestoFase: TLFEdit;
     DBETipoFaseNotas: TLFDbedit;
     DBEDescFaseNotas: TLFDbedit;
     DBEFaseDib: TLFDbedit;
     DBEDescFaseDib: TLFDbedit;
     DialogoDib: TPopupMenu;
     BuscarImagen1: TMenuItem;
     NavDibEsc: THYMNavigator;
     DBEEscandalloFase: TLFDbedit;
     DBECompNotas: TLFDbedit;
     DBECompDib: TLFDbedit;
     LblArbol: TLFLabel;
     TSepNavFaseNotas: TToolButton;
     Arbol: TTreeView;
     NavFases: THYMNavigator;
     DBGFFases: TDBGridFind2000;
     CEFases: TControlEdit;
     CEFasesPMEdit: TPopUpTeclas;
     TSepNavFaseDib: TToolButton;
     Imagen: TImage;
     DBEFAlmacenEnt: TLFDBEditFind2000;
     DBEFAlmacenLan: TLFDBEditFind2000;
     LblAlmLanz: TLFLabel;
     LblAlmEntrada: TLFLabel;
     DBCBMateriales: TLFDBCheckBox;
     DBCBRecursos: TLFDBCheckBox;
     DBCBDefecto: TLFDBCheckBox;
     DBCBGeneraOF: TLFDBCheckBox;
     ADuplicaEscandallo: TAction;
     ARefrescarArbol: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AVisualizarCostes: TAction;
     TBArbol: TToolButton;
     AProLstEscandallo: TAction;
     AProLstEscandallos: TLFCategoryAction;
     ALEscandallo: TActionList;
     AACompuesto: TAction;
     SBACompuesto: TSpeedButton;
     ANewArticulo: TAction;
     TSepTareas: TToolButton;
     TButtNotasTarea: TToolButton;
     TSepMat: TToolButton;
     TButtNotasMat: TToolButton;
     ANotasMaterial: TAction;
     ANotasTareas: TAction;
     TButtInforme: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     AIsoAprobado: TAction;
     AIsoVerificado: TAction;
     AIsoValidado: TAction;
     ETituloImagen: TLFEdit;
     DBEFImagen: TLFFibDBEditFind;
     LblImagen: TLFLabel;
     NavDibujoFases: THYMNavigator;
     CEImagenesFases: TControlEdit;
     CEImagenesFasesPMEdit: TPopUpTeclas;
     GBFirmas: TGroupBox;
     ChkBAprobado: TLFCheckBox;
     ChkBVerificado: TLFCheckBox;
     ChkBValidado: TLFCheckBox;
     DescAlmacenEnt: TLFEdit;
     LblAlmSalida: TLFLabel;
     DBEFAlmacenSal: TLFDBEditFind2000;
     DescAlmacenLan: TLFEdit;
     DescAlmacenSal: TLFEdit;
     EDescCompuesto: TLFEdit;
     EDescTipoUnidad: TLFEdit;
     TSepNavFase: TToolButton;
     TSepNotasNav: TToolButton;
     ToolButton1: TToolButton;
     LblTotCosteTot: TLFLabel;
     DBETotCosteTotal: TLFDbedit;
     LblTotCosteUnitario: TLFLabel;
     DBETotCosteUnitario: TLFDbedit;
     PnlTotales: TLFPanel;
     PCTotales: TLFPageControl;
     TSTotales: TTabSheet;
     PnlTot: TLFPanel;
     LblTotUds: TLFLabel;
     DBETotUnids: TLFDbedit;
     LblTotMedida1: TLFLabel;
     DBETotMedida1: TLFDbedit;
     TBButtNotas: TLFToolBar;
     TButtUndo: TToolButton;
     TButtCut: TToolButton;
     TButtCopy: TToolButton;
     TButtPaste: TToolButton;
     TSepButtNotas1: TToolButton;
     FontName: TLFComboBox;
     FontSize: TLFEdit;
     UpDown1: TUpDown;
     TButtNegrita: TToolButton;
     TSepButtNotas2: TToolButton;
     TButtCursiva: TToolButton;
     TButtSubrayado: TToolButton;
     TSepButtNotas3: TToolButton;
     TButtLeftAlign: TToolButton;
     TButtCenterAlign: TToolButton;
     TButtRightAlign: TToolButton;
     DBMNotasEsc: TDBRichEdit;
     DBMNotasFases: TDBRichEdit;
     TBButtNotasFase: TLFToolBar;
     TButtUndoFase: TToolButton;
     TButtCutFase: TToolButton;
     TButtCopyFase: TToolButton;
     TButtPasteFase: TToolButton;
     TSepButtNotasFase1: TToolButton;
     FontSizeFase: TLFEdit;
     FontNameFase: TLFComboBox;
     UpDown2: TUpDown;
     TSepButtNotasFase2: TToolButton;
     TButtNegritaFase: TToolButton;
     TButtCursivaFase: TToolButton;
     TButtSubrayadoFase: TToolButton;
     TSepButtNotasFase3: TToolButton;
     TButtLeftAlignFase: TToolButton;
     TButtCenterAlignFase: TToolButton;
     TButtRightAlignFase: TToolButton;
     TSepButtNotas4: TToolButton;
     TButtColor: TToolButton;
     TSepButtNotasFase4: TToolButton;
     TButtColorFase: TToolButton;
     PNNotas: TLFPanel;
     PNNotasFases: TLFPanel;
     LblMedida4: TLFLabel;
     DBEMedida4: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     ALstProEscImg: TAction;
     TSPrecios: TTabSheet;
     TBCostes: TLFToolBar;
     DBEEscPrecios: TLFDbedit;
     DBECompPrecios: TLFDbedit;
     DBETituloPrecios: TLFDbedit;
     HYMNavigator1: THYMNavigator;
     PNLPPrecios: TLFPanel;
     GBCostes: TGroupBox;
     LUnidadesCostes: TLFLabel;
     LCosteTotal: TLFLabel;
     LCosteUnitario: TLFLabel;
     LPrecioMaterial: TLFLabel;
     LCosteFijo: TLFLabel;
     LCosteMaterial: TLFLabel;
     LCosteMaquina: TLFLabel;
     LCosteOperario: TLFLabel;
     LCosteVario: TLFLabel;
     LCosteTrabExt: TLFLabel;
     LFDUnidades: TLFDbedit;
     DBCBModif_Coste: TLFDBCheckBox;
     DBCBauto_calc: TLFDBCheckBox;
     GBVentas: TGroupBox;
     LBLCliente: TLFLabel;
     LPrecioUnitario: TLFLabel;
     LTarifa: TLFLabel;
     LPrecioTotal: TLFLabel;
     LBeneficio: TLFLabel;
     LPrecioOptimoUnitario: TLFLabel;
     LBeneficios: TLFLabel;
     LBeneficioOptimoTotal: TLFLabel;
     Z_LblMargenMater: TLFLabel;
     Z_LblMargenMaqui: TLFLabel;
     LMargenOperario: TLFLabel;
     LMargenVarios: TLFLabel;
     LMargenTrabExt: TLFLabel;
     LBeneficioOptimo: TLFLabel;
     LPrecioOptimoTotal: TLFLabel;
     EdTarifa: TLFEdit;
     EFCliente: TLFDBEditFind2000;
     EdDescCliente: TLFEdit;
     EdLineaTarifa: TLFEdit;
     DBEMargenMater: TLFDbedit;
     DBEMargenMaqui: TLFDbedit;
     DBEMargenOpe: TLFDbedit;
     DBEMargenVarios: TLFDbedit;
     DBEMargenTrab: TLFDbedit;
     CBPrecioOptimoEnOfertas: TLFDBCheckBox;
     DBECosteFijo: TLFDbedit;
     DBECosteMat: TLFDbedit;
     DBECosteOpe: TLFDbedit;
     DBECosteVarios: TLFDbedit;
     DBLKTipo_Precio: TDBLookupComboBox;
     DBECosteMaq: TLFDbedit;
     DBECosteTExt: TLFDbedit;
     DBECosteTotal: TLFDbedit;
     DBECosteUnitario: TLFDbedit;
     CEPrecios: TControlEdit;
     CEMainPMPrecios: TPopUpTeclas;
     CEPreciosPMEdit: TPopUpTeclas;
     TBDocumentos: TToolButton;
     ALstNecEsc: TAction;
     Z_LblEstado: TLFLabel;
     Z_LblTipoControl: TLFLabel;
     Z_DBCBVTipoControl: TDBComboBoxValue;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     LFDBEstado: TLFDbedit;
     ToolButton4: TToolButton;
     TBActivo: TToolButton;
     PMEstado: TPopupMenu;
     MINoActivo: TMenuItem;
     MIActivo: TMenuItem;
     MIObsoleto: TMenuItem;
     EDPrecioUni: TLFDbedit;
     EdPrecioTotal: TLFDbedit;
     LFBenUni: TLFDbedit;
     LFBenTot: TLFDbedit;
     LFBenOptUni: TLFDbedit;
     LFBenTotOpt: TLFDbedit;
     LFBenUniPor: TLFDbedit;
     LFBenOptUniPor: TLFDbedit;
     LFPOPtUni: TLFDbedit;
     LFPOptTotal: TLFDbedit;
     BTCalcForm: TToolButton;
     ALstMatEsc: TAction;
     BtCalculaFormDet: TToolButton;
     LResponsable: TLFLabel;
     LFResponsable: TLFDBEditFind2000;
     TBCarpetas: TToolButton;
     LDiasPlazoFabricacion: TLFLabel;
     LFDPlazo_Fab: TLFDbedit;
     LHorasMaquina: TLFLabel;
     LHorasOperario: TLFLabel;
     DBEHMaquina: TLFDbedit;
     DBEHOperario: TLFDbedit;
     LLoteOptimo: TLFLabel;
     LFDBLoteOptimo: TLFDbedit;
     LMerma: TLFLabel;
     LFDBMerma: TLFDbedit;
     LUnidadesXCaja: TLFLabel;
     DBEUnidadesXCaja: TLFDbedit;
     LComponent: TLFLabel;
     DBEComponentes: TLFDbedit;
     LUnidadesComponentes: TLFLabel;
     DBEUnidadesComponentes: TLFDbedit;
     LBLPeso: TLFLabel;
     DBEPeso: TLFDbedit;
     TButtOrdenLineasMat: TToolButton;
     TButtOrdenLineasTar: TToolButton;
     TBPrecios: TToolButton;
     ACalcFormulaFiltro: TAction;
     AActPrecios: TAction;
     AActPreciosFiltro: TAction;
     ToolButton5: TToolButton;
     TBCalcFiltro: TToolButton;
     ETituloResponsable: TLFEdit;
     ACalculoFormulas: TAction;
     ALstEscDesglosado: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AAdjuntosDeEscandallo: TAction;
     AAdjuntosDeArticulo: TAction;
     DBEHExternos: TLFDbedit;
     DBEHVarios: TLFDbedit;
     LHorasExternos: TLFLabel;
     LHorasVarios: TLFLabel;
     BCargarImagen: TButton;
     APropagaAlmacenLanzamientoAMateriales: TAction;
     PNLDibujoFase: TLFPanel;
     PNLDibujoFaseImagen: TLFPanel;
     TButtFiltraSubescandallos: TToolButton;
     AActivaEscandallo: TAction;
     ADesActivaEscandallo: TAction;
     AMarcaEscandalloComoObsoleto: TAction;
     TButtFiltraComponente: TToolButton;
     AFiltraComponente: TAction;
     AFiltraSubescandallos: TAction;
     LTiempoEstimado: TLFLabel;
     DBETEstimado: TLFDbedit;
     AActuPCosteArt: TAction;
     G2kTableLocDetalle: TG2KTBLoc;
     LblSubtipo: TLFLabel;
     DBESubtipo: TLFDBEditFind2000;
     AImportarMateriales: TAction;
     TButtImportarMateriales: TToolButton;
     BClipboard: TButton;
     ALstEscDesglosadoIng: TAction;
     AAdjuntosMaterial: TAction;
     TBSep1: TToolButton;
     TBCopiaNotasAModelo: TToolButton;
     TButtDuplicarTarea: TToolButton;
     TButtDuplicarMaterial: TToolButton;
     PNLCostesEscandallo: TLFPanel;
     GBCostesEscandallo: TGroupBox;
     DBGFCostesEscandallo: TDBGridFind2000;
     TBCostesEscandallo: TLFToolBar;
     NavCostesEscandallo: THYMNavigator;
     LFCategoryAction4: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFFiltroNoActivo: TAction;
     AFFiltroActivos: TAction;
     AFFiltroObseleto: TAction;
     TBSep2: TToolButton;
     TBRecalcularCostesPorUnidades: TToolButton;
     AActivaTodos: TAction;
     ADesactivaTodos: TAction;
     GBCalculoEtiquetas: TGroupBox;
     LLargo: TLFLabel;
     DBELargo: TLFDbedit;
     LColores: TLFLabel;
     DBEColores: TLFDbedit;
     LAncho: TLFLabel;
     DBEAncho: TLFDbedit;
     LTroquel: TLFLabel;
     DBEAnchoArticulo: TLFDbedit;
     LSHAnchoTroquel: TLFLabel;
     DBEVelocidadMaquina: TLFDbedit;
     LFigurasAnchoTroquel: TLFLabel;
     LSVAvanceTroquel: TLFLabel;
     LFigurasAvanceTroquel: TLFLabel;
     LFormula1: TLFLabel;
     LResultadoFormula1: TLFLabel;
     LFormula2: TLFLabel;
     LResultadoFormula2: TLFLabel;
     LFormula3: TLFLabel;
     LResultadoFormula3: TLFLabel;
     LAnchoArticulo: TLFLabel;
     DBEAnchoTroquel: TLFDbedit;
     LVelocidad: TLFLabel;
     LArticulo: TLFLabel;
     LMaquina: TLFLabel;
     DBECalculo1: TLFDbedit;
     DBECalculo2: TLFDbedit;
     DBECalculo3: TLFDbedit;
     EDescripcionArticulo: TLFEdit;
     EDescripcionMaquina: TLFEdit;
     DBEFigurasAnchoTroquel: TLFDbedit;
     DBESVAvanceTroquel: TLFDbedit;
     DBEFigurasAvanceTroquel: TLFDbedit;
     DBEFMaquina: TLFDBEditFind2000;
     DBEFArticulo: TLFDBEditFind2000;
     DBEFTroqueles: TLFDBEditFind2000;
     TBSep3: TToolButton;
     TBCrearDesarrollo: TToolButton;
     TBCalculoEtiquetas: TLFToolBar;
     NavCalculoEtiquetas: THYMNavigator;
     LIdEscandallo: TLFLabel;
     DBEIdEscandallo: TLFDbedit;
     EDescripcionCilindro: TLFEdit;
     DBEFCilindro: TLFDBEditFind2000;
     LCilindro: TLFLabel;
     PNLCalculoEtiquetas: TPanel;
     PNLIzquierdo: TPanel;
     ATraspasoEscandalloEPR: TAction;
     ATraspasoEscandalloOFE: TAction;
     AInfoStock: TAction;
     ToolButton6: TToolButton;
     TButtInfoStocksCompuesto: TToolButton;
     ToolButton7: TToolButton;
     TButtInfStocksMaterial: TToolButton;
     LCajasXBulto: TLFLabel;
     DBECajasXBulto: TLFDbedit;
     TBSep4: TToolButton;
     TBAsociarAdjuntos: TToolButton;
     AAsociarAdjuntos: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BuscarImagen1Click(Sender: TObject);
     procedure DBGFDibujoEscRowChange(Sender: TObject);
     procedure TBArbolClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSFasesShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSMaterialesShow(Sender: TObject);
     procedure TSNotasEscShow(Sender: TObject);
     procedure TSNotasFasesShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSTareasShow(Sender: TObject);
     procedure TSDibujoEscShow(Sender: TObject);
     procedure DBEFCompuestoExit(Sender: TObject);
     procedure DBGFMaterialesBusqueda(Sender: TObject);
     procedure PCFasesEnter(Sender: TObject);
     procedure DBGFTareasBusqueda(Sender: TObject);
     procedure DBGFMaterialesDblClick(Sender: TObject);
     procedure ARefrescarArbolExecute(Sender: TObject);
     procedure ADuplicaEscandalloExecute(Sender: TObject);
     procedure ATraspasoEscandalloEPRExecute(Sender: TObject);
     procedure AVisualizarCostesExecute(Sender: TObject);
     procedure AProLstEscandalloExecute(Sender: TObject);
     procedure DBGFMaterialesCellClick(Column: TColumn);
     procedure AACompuestoExecute(Sender: TObject);
     procedure SBACompuestoDblClick(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure ANotasMaterialExecute(Sender: TObject);
     procedure ANotasTareasExecute(Sender: TObject);
     procedure TButtInformeClick(Sender: TObject);
     procedure AIsoAprobadoExecute(Sender: TObject);
     procedure AIsoVerificadoExecute(Sender: TObject);
     procedure AIsoValidadoExecute(Sender: TObject);
     procedure TSDibujoFasesShow(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure DBEFAlmacenLanChange(Sender: TObject);
     procedure DBEFAlmacenEntChange(Sender: TObject);
     procedure DBEFAlmacenSalChange(Sender: TObject);
     procedure EDescCompuestoEnter(Sender: TObject);
     procedure DBEFCompuestoChange(Sender: TObject);
     procedure EDescTipoUnidadEnter(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFTareasEditButtonClick(Sender: TObject);
     procedure GetTime(Sender: TObject);
     procedure DBGFTareasBeforeColExit(Sender: TObject; var Continuar: boolean);
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
     procedure ALstProEscImgExecute(Sender: TObject);
     procedure TBDocumentosClick(Sender: TObject);
     procedure ALstNecEscExecute(Sender: TObject);
     procedure ToolButton2Click(Sender: TObject);
     procedure ALstMatEscExecute(Sender: TObject);
     procedure BtCalculaFormDetClick(Sender: TObject);
     procedure BTCalcFormClick(Sender: TObject);
     procedure LFResponsableChange(Sender: TObject);
     procedure TBCarpetasClick(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure DBGFTareasDblClick(Sender: TObject);
     procedure DBGFTareasCellClick(Column: TColumn);
     procedure TButtOrdenLineasMatClick(Sender: TObject);
     procedure TButtOrdenLineasTarClick(Sender: TObject);
     procedure ACalcFormulaFiltroExecute(Sender: TObject);
     procedure AActPreciosExecute(Sender: TObject);
     procedure AActPreciosFiltroExecute(Sender: TObject);
     procedure TBPreciosFiltroClick(Sender: TObject);
     procedure TBCalcFiltroClick(Sender: TObject);
     procedure ACalculoFormulasExecute(Sender: TObject);
     procedure ALstEscDesglosadoExecute(Sender: TObject);
     procedure TSDetalleShow(Sender: TObject);
     procedure AAdjuntosDeEscandalloExecute(Sender: TObject);
     procedure AAdjuntosDeArticuloExecute(Sender: TObject);
     procedure DBEFUnidadChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavDibujoFasesClick(Sender: TObject; Button: TNavigateBtn);
     procedure APropagaAlmacenLanzamientoAMaterialesExecute(Sender: TObject);
     procedure AActivaEscandalloExecute(Sender: TObject);
     procedure ADesActivaEscandalloExecute(Sender: TObject);
     procedure AMarcaEscandalloComoObsoletoExecute(Sender: TObject);
     procedure LFDBEstadoChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AFiltraComponenteExecute(Sender: TObject);
     procedure AFiltraSubescandallosExecute(Sender: TObject);
     procedure AActuPCosteArtExecute(Sender: TObject);
     procedure G2kTableLocDetalleClick(Sender: TObject);
     procedure AImportarMaterialesExecute(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure AAdjuntosMaterialExecute(Sender: TObject);
     procedure PCMatTarChanging(Sender: TObject; var AllowChange: boolean);
     procedure NavMaterialesChangeState(Sender: TObject);
     procedure TBCopiaNotasAModeloClick(Sender: TObject);
     procedure DBGFMaterialesColEnter(Sender: TObject);
     procedure TButtDuplicarTareaClick(Sender: TObject);
     procedure TButtDuplicarMaterialClick(Sender: TObject);
     procedure TSPreciosShow(Sender: TObject);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFFiltroNoActivoExecute(Sender: TObject);
     procedure AFFiltroActivosExecute(Sender: TObject);
     procedure AFFiltroObseletoExecute(Sender: TObject);
     procedure TBRecalcularCostesPorUnidadesClick(Sender: TObject);
     procedure NavCostesEscandalloClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AActivaTodosExecute(Sender: TObject);
     procedure ADesactivaTodosExecute(Sender: TObject);
     procedure DBEMaquinaChange(Sender: TObject);
     procedure DBEArticuloChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEFMaquinaChange(Sender: TObject);
     procedure SBAFiltraArticuloDblClick(Sender: TObject);
     procedure DBEFTroquelesChange(Sender: TObject);
     procedure TBCrearDesarrolloClick(Sender: TObject);
     procedure DBEFCilindroChange(Sender: TObject);
     procedure ATraspasoEscandalloOFEExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AInfoStockExecute(Sender: TObject);
     procedure AAsociarAdjuntosExecute(Sender: TObject);
  private
     { Private declarations }
     FPregTiempo: TFPregTiempo;
     ColActual: TColumn;
     FUpdating: boolean;
     FTipo: string;
     RefrescarArbol: boolean;
     function CurrText(Notas: TDBRichEdit): TTextAttributes;
     procedure GetFontNames;
     procedure CambiarEstado(Estado: integer);
     procedure EstableceCaption;
  public
     { Public declarations }
     // DM: TProDMEscandallo;
     procedure ArbolEsc;
     procedure FiltraEscandallo(Tipo, Filtro: string);
     procedure ChecksFirmas(apr, ver, val: integer);
     procedure ArbolSubescandallo(nodo: TTreeNode);
     procedure ActivoONo;
     procedure ComprobarValorDefecto;
     procedure CalculaFormulas;
  end;

var
  ProFMEscandallo : TProFMEscandallo;

implementation

uses UDMMain, UEntorno, Uutiles, UDameDato, UFMain, UProFMDuplicarEsc, UFMDocInfoStocks, UProFMCostesTEsc,
  UProFMLstEscandallo, UFMNotasCampo, UDMArticulos, UProDMLSTEscandallo,
  UIsoFMFirmas, UProFMLstEscandalloImg, UProFMFicherosCliente, UProFMLstNecesidadesEsc,
  UProFMLstMatEsc, UProFMCarpetas, UProDMEscandallo, UProFMEscCalculoFiltrado,
  UProFMLstEscandalloDesg, FIBDataSet, FIBDatabase, UFMAdjunto, UFMSeleccion,
  UParam, UFMInsercionArticuloDesdeTexto, ShellApi, URecibeFicheros, UDMAdjunto, UImagenes;

{$R *.dfm}

procedure TProFMEscandallo.FormCreate(Sender: TObject);
var
  col : integer;
  i : integer;
  s : string;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  RefrescarArbol := True;

  // AbreDataVarias(TProDMEscandallo, DM, Self);
  AbreData(TProDMEscandallo, ProDMEscandallo);

  // Formatació texte
  GetFontNames;
  SelectionChange(Self);
  SelectionChangeFase(Self);

  CurrText(DBMNotasEsc).Name := DefFontData.Name;
  CurrText(DBMNotasFases).Name := DefFontData.Name;

  CurrText(DBMNotasEsc).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
  CurrText(DBMNotasFases).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  // Navegadores
  NavMain.DataSource := ProDMEscandallo.DSQMProEscandallo;
  NavNotasEsc.DataSource := ProDMEscandallo.DSQMProEscandallo;
  NavFases.DataSource := ProDMEscandallo.DSQMProFasesEsc;
  NavMateriales.DataSource := ProDMEscandallo.DSQMProMatEsc;
  NavTareas.DataSource := ProDMEscandallo.DSQMProTareaEsc;
  NavNotasFases.DataSource := ProDMEscandallo.DSQMProFasesEsc;
  NavDibEsc.DataSource := ProDMEscandallo.DSQMProDibEsc;
  DBGMain.DataSource := ProDMEscandallo.DSQMProEscandallo;
  // Page Control
  PCMatTar.ActivePage := TSMateriales;
  PCFases.ActivePage := TSFases;

  SolapaControles(SBACompuesto, EDescCompuesto);
  EDescCompuesto.Color := REntorno.ColorEnlaceActivo;

  //SolapaControles(SBAFiltraArticulo, EDescripcionArticulo);
  //EDescripcionArticulo.Color := REntorno.ColorEnlaceActivo;

  G2KTableLoc.DataSource := ProDMEscandallo.DSQMProEscandallo;

  col := EncuentraField(DBGFMateriales, 'FORMULA');
  if (col >= 0) then
     DBGFMateriales.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGFTareas, 'FORMULA');
  if (col >= 0) then
     DBGFTareas.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGFTareas, 'ID_UTILLAJES');
  if (col >= 0) then
     DBGFTareas.Columns[col].Color := REntorno.ColorEnlaceActivo;

  // Valores por defecto
  ComprobarValorDefecto;

  DBEFCompuesto.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';

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

  if (DMMain.EstadoKri(42) = 1) then
     DBEFCompuesto.OrdenadoPor.Text := 'TITULO';

  if (DMMain.EstadoKri(242) = 1) then
     AAdjuntosMaterial.Enabled := False;

  // Captions campos medida
  LblMedida1.Caption := LeeParametro('MEDITIT001');
  LblMedida2.Caption := LeeParametro('MEDITIT002');
  LblMedida3.Caption := LeeParametro('MEDITIT003');
  LblMedida4.Caption := LeeParametro('MEDITIT004');

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  s := LeeParametro('ARTBUSQ001');
  if ((s <> 'ARTICULO') and (s <> '')) then
  begin
     for i := 0 to DBGFMateriales.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFMateriales.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFMateriales.CamposDesplegar[i] = '1') then
        begin
           DBGFMateriales.Numericos[i] := s;
           DBGFMateriales.CamposADevolver[i] := 'ARTICULO';
           DBGFMateriales.OrdenadosPor[i] := s;
        end;
     end;
  end;

  // Modulo de etiquetas
  PNLCalculoEtiquetas.Visible := (LeeParametro('MODREST008') = 'S');

  // Color campo ID
  ColorCampoID(DBEEscandallo);
  ColorCampoID(DBEIdEscandallo);
end;

procedure TProFMEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMEscandallo);
end;

procedure TProFMEscandallo.ArbolEsc;
var
  Nodo : TTreeNode;
  S, A : integer;
  Materiales : TTreeNode;
  Tareas : TTreeNode;
  DSFase, DSTarea, DSMaterial : TFIBDataSet;
  Trans : TFIBTransaction;
begin
  if (RefrescarArbol) then
  begin
     // Arbol.Visible := False;
     Arbol.Items.BeginUpdate;
     Arbol.Items.Clear;
     if (ProDMEscandallo.QMProEscandalloID_ESC.AsInteger <> 0) then
     begin
        Nodo := Arbol.Items.Add(nil, Format(_('Escandallo %s %s %s'), [ProDMEscandallo.QMProEscandalloEscandallo.AsString, ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString, EDescCompuesto.Text]));
        Nodo.SelectedIndex := 0;
        Arbol.Items[0].Expand(True);
        S := 1;
        Nodo := Arbol.Items.AddChild(Arbol.Items[0], _('Fases'));

        DSFase := TFIBDataSet.Create(nil);
        DSMaterial := TFIBDataSet.Create(nil);
        DSTarea := TFIBDataSet.Create(nil);
        Trans := DameTransactionRO(DMMain.DataBase);
        try
           if (not Trans.InTransaction) then
              Trans.StartTransaction;

           with DSFase do
           begin
              Unidirectional := True;
              Transaction := Trans;
              Close;
              DataBase := DMMain.DataBase;
              SelectSQL.Add(' SELECT * FROM PRO_FASES_ESC ');
              SelectSQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO ');
              SelectSQL.Add(' ORDER BY ORDEN, LINEA_FASE ');
              Params.ByName['EMPRESA'].AsInteger := ProDMEscandallo.QMProEscandalloEMPRESA.AsInteger;
              Params.ByName['ESCANDALLO'].AsString := ProDMEscandallo.QMProEscandalloESCANDALLO.AsString;
              Params.ByName['TIPO'].AsString := ProDMEscandallo.QMProEscandalloTIPO.AsString;
              Open;
           end;

           with DSMaterial do
           begin
              Unidirectional := True;
              Transaction := Trans;
              Close;
              DataBase := DMMain.DataBase;
              SelectSQL.Add(' SELECT * FROM PRO_MAT_ESC ');
              SelectSQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND LINEA_FASE = ?LINEA_FASE AND TIPO = ?TIPO ');
              SelectSQL.Add(' ORDER BY LINEA_FASE, ORDEN ');
           end;

           with DSTarea do
           begin
              Unidirectional := True;
              Transaction := Trans;
              Close;
              DataBase := DMMain.DataBase;
              SelectSQL.Add(' SELECT * FROM PRO_TAREA_ESC ');
              SelectSQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO=?ESCANDALLO AND LINEA_FASE = ?LINEA_FASE AND TIPO = ?TIPO ');
              SelectSQL.Add(' ORDER BY ORDEN, LINEA_TAREA ');
           end;

           // Fases
           while not DSFase.EOF do
           begin
              Arbol.Items.AddChild(Arbol.Items[1], DSFase.FieldByName('TIPOFASE').AsString + '  ' + DSFase.FieldByName('FASE').AsString);
              S := S + 1;
              Materiales := Arbol.Items.AddChild(Arbol.Items[S], _('Materiales'));
              S := S + 1;
              A := 0;

              // Materiales (mirar de posar les subordres - ALBERT -)
              with DSMaterial do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := DSFase.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['ESCANDALLO'].AsString := DSFase.FieldByName('ESCANDALLO').AsString;
                 Params.ByName['LINEA_FASE'].AsInteger := DSFase.FieldByName('LINEA_FASE').AsInteger;
                 Params.ByName['TIPO'].AsString := DSFase.FieldByName('TIPO').AsString;
                 Open;
                 while not EOF do
                 begin
                    if (FieldByName('MATESC').AsInteger > 0) then
                    begin
                       Arbol.Items.Addchild(Materiales,
                          Format(_('%s %s (SubEsc. %s)'), [FieldByName('COMPONENTE').AsString, DameTituloArticulo(FieldByName('COMPONENTE').AsString), FieldByName('MATESC').AsString]));

                       ArbolSubEscandallo(Arbol.Items[S]);  // ALBERT - Subescandalls
                    end
                    else
                       Arbol.Items.Addchild(Materiales,
                          FieldByName('COMPONENTE').AsString + '     ' +
                          DameTituloArticulo(FieldByName('COMPONENTE').AsString));

                    Next;
                    A := A + 1;
                 end;
              end;

              S := S - 1;
              Tareas := Arbol.Items.AddChild(Arbol.Items[S], _('Tareas'));
              S := S + 2;
              S := S + A;
              A := 0;

              // Tareas
              with DSTarea do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := DSFase.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['ESCANDALLO'].AsString := DSFase.FieldByName('ESCANDALLO').AsString;
                 Params.ByName['LINEA_FASE'].AsInteger := DSFase.FieldByName('LINEA_FASE').AsInteger;
                 Params.ByName['TIPO'].AsString := DSFase.FieldByName('TIPO').AsString;
                 Open;
                 while not EOF do
                 begin
                    Nodo := Arbol.Items.Addchild(Tareas, FieldByName('TIPOTAREA').AsString + '  ' + FieldByName('TAREA').AsString);
                    Next;
                    A := A + 1;
                 end;
                 S := S + A;
              end;

              DSFase.Next;
           end;

           Arbol.Items[0].Expand(True);
           Nodo.SelectedIndex := 0;

           DSMaterial.Close;
           DSTarea.Close;
           DSFase.Close;
           Trans.Commit;
        finally
           FreeAndNil(DSTarea);
           FreeAndNil(DSMaterial);
           FreeAndNil(DSFase);
           FreeAndNil(Trans);
        end;
     end;
     Arbol.Items.EndUpdate;
  end;
end;

procedure TProFMEscandallo.BuscarImagen1Click(Sender: TObject);
begin
  inherited;
  if ProDMEscandallo.QMProDibEsc.State in [dsEdit, dsInsert] then
     ProDMEscandallo.QMProDibEscID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TProFMEscandallo.DBGFDibujoEscRowChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(EscImagen, ProDMEscandallo.QMProDibEscID_IMAGEN.AsInteger);
end;

procedure TProFMEscandallo.TBArbolClick(Sender: TObject);
begin
  inherited;
  ArbolEsc;
end;

procedure TProFMEscandallo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMEscandallo.BusquedaCompleja;
  if (PCMain.ActivePage = TSDetalle) then
     TSDetalleShow(Sender);

  EstableceCaption;
end;

procedure TProFMEscandallo.TSFasesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFases;
end;

procedure TProFMEscandallo.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TProFMEscandallo.TSMaterialesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMateriales;
  if (DMMain.EstadoKri(242) = 1) then
     AAdjuntosMaterial.Enabled := True;
end;

procedure TProFMEscandallo.TSNotasEscShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotasEsc;
end;

procedure TProFMEscandallo.TSNotasFasesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotasFases;
end;

procedure TProFMEscandallo.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TProFMEscandallo.TSTareasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CETareas;
end;

procedure TProFMEscandallo.TSDibujoEscShow(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.QMProDibEsc.Open;
  ControlEdit := CEDibujoEsc;
end;

procedure TProFMEscandallo.DBEFCompuestoExit(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.VerificarCompuestoEscandallo(DBEFCompuesto.Text);
end;

procedure TProFMEscandallo.DBGFMaterialesBusqueda(Sender: TObject);
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

        // Fa que es vegi el botó d'Origen a la búsqueda
        if (FMain.AProEscandalloSF.Enabled = True) then
           Accion := ANewArticulo;
     end
     else if UpperCase(Trim(TablaABuscar)) = 'PRO_VER_ESCANDALLO' then
     begin
        CondicionBusqueda := 'TIPO=''EPR'' AND COMPUESTO =''' + ProDMEscandallo.QMProMatEscCOMPONENTE.AsString + '''';
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'COMPUESTO';
     end
     else if UpperCase(Trim(TablaABuscar)) = 'ART_ARTICULOS' then
     begin
        CondicionBusqueda := 'ARTICULO=''' + ProDMEscandallo.QMProMatEscCOMPONENTE.AsString + '''';
        Filtros := [obEmpresa];
        {
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'ARTICULO';
           if (DMMain.EstadoKri(42) = 1) then
              OrdenadosPor[i] := 'TITULO';
        end;
        }
     end
     else if Trim(TablaABuscar) = 'SYS_UNIDADES_ARTICULOS' then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else if Trim(TablaABuscar) = 'PRO_SYS_CAB_EQUIVAL' then
     begin
        CondicionBusqueda := 'ARTICULO=''' + ProDMEscandallo.QMProMatEscCOMPONENTE.AsString + '''';
        Filtros := [obEmpresa];
     end
     else if Trim(TablaABuscar) = 'PRO_ESCANDALLO' then
     begin
        CondicionBusqueda := 'COMPUESTO=''' + ProDMEscandallo.QMProMatEscCOMPONENTE.AsString + ''' AND ' +
           'TIPO = ''EPR''';
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO DESC, COMPUESTO';
     end
     else if Trim(TablaABuscar) = 'PRO_TAREA_ESC' then
     begin
        CondicionBusqueda := 'ID_ESC=' + ProDMEscandallo.QMProMatEscID_ESC.AsString + ' AND LINEA_FASE=' + ProDMEscandallo.QMProMatEscLINEA_FASE.AsString;
     end
     else if Trim(TablaABuscar) = 'ART_ALMACENES' then
     begin
        CondicionBusqueda := 'ACTIVO=1';
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ALMACEN';
     end
     else
     if Trim(TablaABuscar) = 'PRO_FORMULAS' then
     begin
        CondicionBusqueda := 'ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ID_FORMULA';
     end
     else
     if Trim(TablaABuscar) = 'PRO_DES_CAB_MATERIAL' then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if Trim(TablaABuscar) = 'PRO_DES_TIPO_PIEZA' then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO';
     end
     else
        Filtros := [obEmpresa];
  end;
end;

procedure TProFMEscandallo.PCFasesEnter(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSDetalle;
end;

procedure TProFMEscandallo.DBGFTareasBusqueda(Sender: TObject);
begin
  inherited;
  with DBGFTareas do
  begin
     if Assigned(SelectedField) then
     begin
        if ((SelectedField.FieldName = 'RECURSO') or
           (SelectedField.FieldName = 'ID_UTILLAJES') or
           (SelectedField.FieldName = 'SECCION') or
           (SelectedField.FieldName = 'MAQUINA')) then
           Filtros := [obEmpresa]
        else
           Filtros := [];

        if ((SelectedField.FieldName = 'TIPOTAREA') or
           (SelectedField.FieldName = 'RECURSO')) then
        begin
           SalirSiNoExiste := False;
           SalirSiVacio := False;
        end
        else
        begin
           SalirSiNoExiste := True;
           SalirSiVacio := True;
        end;
     end;
  end;
end;

procedure TProFMEscandallo.DBGFMaterialesDblClick(Sender: TObject);
begin
  inherited;
  if ProDMEscandallo.HayMateriales then
  begin
     if (UpperCase(ColActual.FieldName) = 'COMPONENTE') then
        FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
           ProDMEscandallo.QMProMatEscCOMPONENTE.AsString + '''' +
           ' AND EJERCICIO=' + REntorno.EjercicioStr);

     if (UpperCase(ColActual.FieldName) = 'FORMULA') then
        FMain.EjecutaAccion(FMain.AProFormulas, 'ID_FORMULA = ' +
           IntToStr(ProDMEscandallo.QMProMatEscFORMULA.AsInteger));

     if (UpperCase(ColActual.FieldName) = 'ID_EQUIVAL') then
        if (ProDMEscandallo.QMProMatEscID_EQUIVAL.AsInteger > 0) then
           FMain.EjecutaAccion(FMain.AProEquivalArt, IntToStr(ProDMEscandallo.QMProMatEscID_EQUIVAL.AsInteger));

     if (UpperCase(ColActual.FieldName) = 'TIENE_ADJUNTO') then
        if (DMMain.EstadoKri(242) = 1) then
           AAdjuntosMaterial.Execute;

     if (UpperCase(ColActual.FieldName) = 'MATESC') then
        FiltraEscandallo('EPR', 'ESCANDALLO = ' + IntToStr(ProDMEscandallo.QMProMatEscMATESC.AsInteger));
  end;
end;

procedure TProFMEscandallo.ARefrescarArbolExecute(Sender: TObject);
begin
  inherited;
  ArbolEsc;
end;

procedure TProFMEscandallo.ADuplicaEscandalloExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMDuplicarEsc, ProFMDuplicarEsc, Sender);
  ProFMDuplicarEsc.Mostrar(ProDMEscandallo.QMProEscandalloTIPO.AsString, ProDMEscandallo.QMProEscandalloTIPO.AsString, ProDMEscandallo.QMProEscandalloESCANDALLO.AsInteger, ProDMEscandallo.QMProEscandalloID_DETALLES_OFERTAS_V.AsInteger, ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString,
     StrToIntDef(DBEEscandallo.Text, 0), DBEFCompuesto.Text);
end;

procedure TProFMEscandallo.ATraspasoEscandalloEPRExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMDuplicarEsc, ProFMDuplicarEsc, Sender);
  ProFMDuplicarEsc.Mostrar(ProDMEscandallo.QMProEscandalloTIPO.AsString, 'EPR', ProDMEscandallo.QMProEscandalloESCANDALLO.AsInteger, ProDMEscandallo.QMProEscandalloID_DETALLES_OFERTAS_V.AsInteger, ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString,
     StrToIntDef(DBEEscandallo.Text, 0), DBEFCompuesto.Text);
end;

procedure TProFMEscandallo.ATraspasoEscandalloOFEExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMDuplicarEsc, ProFMDuplicarEsc, Sender);
  ProFMDuplicarEsc.Mostrar(ProDMEscandallo.QMProEscandalloTIPO.AsString, 'OFE', ProDMEscandallo.QMProEscandalloESCANDALLO.AsInteger, ProDMEscandallo.QMProEscandalloID_DETALLES_OFERTAS_V.AsInteger, ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString,
     StrToIntDef(DBEEscandallo.Text, 0), DBEFCompuesto.Text);
end;

procedure TProFMEscandallo.AVisualizarCostesExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TProFMCostesTEsc, ProFMCostesTEsc);
  ProFMCostesTEsc.AbreDatos('EPR');
  ProFMCostesTEsc.ShowModal;
  ProFMCostesTEsc.Free;
end;

procedure TProFMEscandallo.AProLstEscandalloExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstEscandallo, ProFMLstEscandallo, Sender);
  ProFMLstEscandallo.RBEscandallo.Checked := True;
  ProFMLstEscandallo.EFCompuesto.Text := DBEFCompuesto.Text;
  ProFMLstEscandallo.EFEsc.Text := DBEEscandallo.Text;
  ProFMLstEscandallo.EUnidades.Text := DBEUnidades.Text;
end;

procedure TProFMEscandallo.DBGFMaterialesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
  DBGFMateriales.BuscarChars := (Column.FieldName <> 'COMPONENTE');
end;

procedure TProFMEscandallo.AACompuestoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
     ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString + '''' +
     ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TProFMEscandallo.SBACompuestoDblClick(Sender: TObject);
begin
  inherited;
  AACompuesto.Execute;
end;

procedure TProFMEscandallo.ANewArticuloExecute(Sender: TObject);
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
        ProDMEscandallo.QMProMatEscCOMPONENTE.AsString := FMain.EnlaceDatos;
     end;
     DBGFMateriales.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TProFMEscandallo.ANotasMaterialExecute(Sender: TObject);
begin
  inherited;
  //Botó per control·lar les notes dels materials

  // *** Creo un Dataset especial solo para las notas, hasta corregir error BLOB ID
  // *** ProDMEscandallo.PreparaNotasDetalle(ProDMEscandallo.QMProMatEsc);
  if (ProDMEscandallo.QMProMatEsc.State in [dsEdit, dsInsert]) then
     ProDMEscandallo.QMProMatEsc.Post;

  if (ProDMEscandallo.xMaterialesEscNotas.State in [dsEdit, dsInsert]) then
     ProDMEscandallo.xMaterialesEscNotas.Post;
  ProDMEscandallo.xMaterialesEscNotas.Edit;

  if (ProDMEscandallo.QMProEscandalloESTADO.AsInteger < 1) then
     EditarCampoNotas(Self, ProDMEscandallo.DSxMaterialesEscNotas, ProDMEscandallo.xMaterialesEscNotasNOTAS);
end;

procedure TProFMEscandallo.ANotasTareasExecute(Sender: TObject);
begin
  inherited;
  // Botó per control·lar les notes de les tareas

  // *** Creo un Dataset especial solo para las notas, hasta corregir error BLOB ID
  // *** ProDMEscandallo.PreparaNotasDetalle(ProDMEscandallo.QMProTareaEsc);
  if (ProDMEscandallo.QMProTareaEsc.State in [dsEdit, dsInsert]) then
     ProDMEscandallo.QMProTareaEsc.Post;

  if (ProDMEscandallo.xTareaEscNotas.State in [dsEdit, dsInsert]) then
     ProDMEscandallo.xTareaEscNotas.Post;
  ProDMEscandallo.xTareaEscNotas.Edit;

  if (ProDMEscandallo.QMProEscandalloESTADO.AsInteger < 1) then
     EditarCampoNotas(Self, ProDMEscandallo.DSxTareaEscNotas, ProDMEscandallo.xTareaEscNotasCOMENTARIO);
end;

procedure TProFMEscandallo.FiltraEscandallo(Tipo, Filtro: string);
var
  AllowChange : boolean;
begin
  // Es filtre els escandalls, per quan es fa un doble click a les OF i altres forms
  FTipo := Tipo;
  ProDMEscandallo.FiltraEscandallo(Tipo, Filtro);

  EstableceCaption;

  ATraspasoEscandalloEPR.Visible := (FTipo = 'OFE');
  ATraspasoEscandalloOFE.Visible := (FTipo = 'EPR');

  G2KTableLoc.CondicionBusqueda := 'TIPO = ''' + FTipo + '''';

  PCMainChanging(Self, AllowChange);
  if (Assigned(PCMain.ActivePage)) then
     PCMain.ActivePage.OnShow(Self);
end;

procedure TProFMEscandallo.EstableceCaption;
begin
  if (FTipo = 'EPR') then
  begin
     Caption := _('Escandallo - Producción');
  end
  else if (FTipo = 'OFE') then
  begin
     Caption := _('Escandallo - Oferta');
  end;
end;

procedure TProFMEscandallo.TButtInformeClick(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstEscandallo, ProDMLstEscandallo);
  ProDMLstEscandallo.MostrarListado(0, StrToInt(DBEEscandallo.Text), '0', '0', 0, '', REntorno.FechaTrab, StrToFloat(DBEUnidades.Text), 'Escandallo: ' + DBEEscandallo.Text, 'EPR');
  CierraData(ProDMLstEscandallo);
end;

procedure TProFMEscandallo.AIsoAprobadoExecute(Sender: TObject);
var
  id_firma, estado : integer;
begin
  inherited;
  if ProDMEscandallo.QMProEscandalloISO_APROBADO.AsInteger = 0 then
  begin
     id_firma := DMMain.Contador_E('IFI');
     TIsoFMFirmas.Create(Self).NuevaFirma(id_firma);
     ProDMEscandallo.CompruebaFirma(0, id_firma);
  end
  else
     TIsoFMFirmas.Create(Self).AbreFirma(ProDMEscandallo.QMProEscandalloEMPRESA.AsInteger,
        ProDMEscandallo.QMProEscandalloISO_APROBADO.AsInteger);

  estado := ProDMEscandallo.EstadoFirma(ProDMEscandallo.QMProEscandalloISO_APROBADO.AsInteger);
  ChecksFirmas(estado, -1, -1);
end;

procedure TProFMEscandallo.AIsoVerificadoExecute(Sender: TObject);
var
  id_firma, estado : integer;
begin
  inherited;
  if ProDMEscandallo.QMProEscandalloISO_VERIFICADO.AsInteger = 0 then
  begin
     id_firma := DMMain.Contador_E('IFI');
     TIsoFMFirmas.Create(Self).NuevaFirma(id_firma);
     ProDMEscandallo.CompruebaFirma(1, id_firma);
  end
  else
     TIsoFMFirmas.Create(Self).AbreFirma(ProDMEscandallo.QMProEscandalloEMPRESA.AsInteger,
        ProDMEscandallo.QMProEscandalloISO_VERIFICADO.AsInteger);

  estado := ProDMEscandallo.EstadoFirma(ProDMEscandallo.QMProEscandalloISO_VERIFICADO.AsInteger);
  ChecksFirmas(-1, estado, -1);
end;

procedure TProFMEscandallo.AIsoValidadoExecute(Sender: TObject);
var
  id_firma, estado : integer;
begin
  inherited;
  if ProDMEscandallo.QMProEscandalloISO_VALIDADO.AsInteger = 0 then
  begin
     id_firma := DMMain.Contador_E('IFI');
     TIsoFMFirmas.Create(Self).NuevaFirma(id_firma);
     ProDMEscandallo.CompruebaFirma(2, id_firma);
  end
  else
     TIsoFMFirmas.Create(Self).AbreFirma(ProDMEscandallo.QMProEscandalloEMPRESA.AsInteger,
        ProDMEscandallo.QMProEscandalloISO_VALIDADO.AsInteger);

  estado := ProDMEscandallo.EstadoFirma(ProDMEscandallo.QMProEscandalloISO_VALIDADO.AsInteger);
  ChecksFirmas(-1, -1, estado);
end;

procedure TProFMEscandallo.ChecksFirmas(apr, ver, val: integer);
begin
  if (apr <> -1) then
  begin
     if (apr = 0) then
        ChkBAprobado.State := cbUnchecked
     else if (apr = 1) then
        ChkBAprobado.State := cbGrayed
     else
        ChkBAprobado.State := cbChecked;
  end;

  if (ver <> -1) then
  begin
     if (ver = 0) then
        ChkBVerificado.State := cbUnchecked
     else if (ver = 1) then
        ChkBVerificado.State := cbGrayed
     else
        ChkBVerificado.State := cbChecked;
  end;

  if (val <> -1) then
  begin
     if (val = 0) then
        ChkBValidado.State := cbUnchecked
     else if (val = 1) then
        ChkBValidado.State := cbGrayed
     else
        ChkBValidado.State := cbChecked;
  end;
end;

procedure TProFMEscandallo.TSDibujoFasesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEImagenesFases;
  RefrescarImagen(Imagen, ProDMEscandallo.QMProFasesEscID_IMAGEN.AsInteger);
end;

procedure TProFMEscandallo.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TProFMEscandallo.DBEFAlmacenLanChange(Sender: TObject);
begin
  inherited;
  DescAlmacenLan.Text := DameTituloAlmacen(DBEFAlmacenLan.Text);
end;

procedure TProFMEscandallo.DBEFAlmacenEntChange(Sender: TObject);
begin
  inherited;
  DescAlmacenEnt.Text := DameTituloAlmacen(DBEFAlmacenEnt.Text);
end;

procedure TProFMEscandallo.DBEFAlmacenSalChange(Sender: TObject);
begin
  inherited;
  DescAlmacenSal.Text := DameTituloAlmacen(DBEFAlmacenSal.Text);
end;

procedure TProFMEscandallo.EDescCompuestoEnter(Sender: TObject);
begin
  inherited;
  DBEFCompuesto.SetFocus;
end;

procedure TProFMEscandallo.DBEFCompuestoChange(Sender: TObject);
begin
  inherited;
  EDescCompuesto.Text := DameTituloArticulo(DBEFCompuesto.Text);
  ETituloCompuestoFase.Text := EDescCompuesto.Text;
  ETituloNotas.Text := EDescCompuesto.Text;
  ETituloDib.Text := EDescCompuesto.Text;
end;

procedure TProFMEscandallo.EDescTipoUnidadEnter(Sender: TObject);
begin
  inherited;
  DBEFUnidad.SetFocus;
end;

procedure TProFMEscandallo.DBGFMaterialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'COMPONENTE') then
     CeldaEnlace(DBGFMateriales, Rect)
  else
  if (UpperCase(Column.FieldName) = 'FORMULA') then
     CeldaEnlace(DBGFMateriales, Rect)
  else
  if (UpperCase(Column.FieldName) = 'ID_EQUIVALENCIA') then
     CeldaEnlace(DBGFMateriales, Rect)
  else
  if (UpperCase(Column.FieldName) = 'MATESC') then
     CeldaEnlace(DBGFMateriales, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end
     else
     begin
        if (Column.FieldName = 'STOCK') then
        begin
           if (ProDMEscandallo.QMProMatEscCONTROL_STOCK.AsInteger = 0) then
              ColorInactivo(DBGFMateriales.Canvas)
           else
           begin
              if (ProDMEscandallo.QMProMatEscSTOCK.AsFloat < ProDMEscandallo.QMProMatEscUNIDADES.AsFloat) then
                 ColorError(DBGFMateriales.Canvas)
              else
                 ColorInfo(DBGFMateriales.Canvas);
           end;
        end
        else
        if (Column.FieldName = 'STOCK_ALM_LAN') then
        begin
           if (ProDMEscandallo.QMProMatEscCONTROL_STOCK.AsInteger = 0) then
              ColorInactivo(DBGFMateriales.Canvas)
           else
           begin
              if (ProDMEscandallo.QMProMatEscSTOCK.AsFloat < ProDMEscandallo.QMProMatEscUNIDADES.AsFloat) then
                 ColorError(DBGFMateriales.Canvas)
              else
                 ColorInfo(DBGFMateriales.Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TProFMEscandallo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMEscandallo.OptimizaBusqueda(True);
  try
     G2KTableLoc.Click;
  finally
     ProDMEscandallo.OptimizaBusqueda(False);
  end;

  EstableceCaption;
end;

procedure TProFMEscandallo.DBGFTareasEditButtonClick(Sender: TObject);
begin
  inherited;
  FPregTiempo := TFPregTiempo.Create(Self);
  FPregTiempo.ShowModal;
end;

procedure TProFMEscandallo.GetTime(Sender: TObject);
begin
  inherited;
  if (Assigned(DBGFTareas.SelectedField) and (DBGFTareas.SelectedField.Name = 'QMProTareaEscTIME') and (ProDMEscandallo.QMProTareaEsc.State in [dsInsert, dsEdit])) then
  begin
     if not Assigned(FPregTiempo) then
        FPregTiempo := TFPregTiempo.Create(Self);
     if Length(ProDMEscandallo.QMProTareaEscTIME.AsString) = 8 then {sfg.albert 13}
     begin
        //sfg.albert
        //FPregTiempo.LFEHoras.Text    := Copy(ProDMEscandallo.QMProTareaEscTIME.AsString, 0, 3);
        //FPregTiempo.LFEMinutos.Text  := Copy(ProDMEscandallo.QMProTareaEscTIME.AsString, 5, 2);
        //FPregTiempo.LFESegundos.Text := Copy(ProDMEscandallo.QMProTareaEscTIME.AsString, 8, 6);

        FPregTiempo.LFEHoras.Text := Copy(ProDMEscandallo.QMProTareaEscTIME.AsString, 0, 2);
        FPregTiempo.LFEMinutos.Text := Copy(ProDMEscandallo.QMProTareaEscTIME.AsString, 4, 2);
        FPregTiempo.LFESegundos.Text := Copy(ProDMEscandallo.QMProTareaEscTIME.AsString, 7, 2);
     end;
     if FPregTiempo.ShowModal() = mrOk then
     begin
        ProDMEscandallo.QMProTareaEscTIME.AsString := FPregTiempo.LFEHoras.Text +
           ':' + FPregTiempo.LFEMinutos.Text + ':' + FPregTiempo.LFESegundos.Text;

        ProDMEscandallo.QMProTareaEscTIEMPO.AsFloat := StrToFloat(FPregTiempo.LFESegundos.Text) +
           StrToInt(FPregTiempo.LFEMinutos.Text) * 60 + StrToInt(FPregTiempo.LFEHoras.Text) * 3600;
     end;
  end;
end;

procedure TProFMEscandallo.DBGFTareasBeforeColExit(Sender: TObject; var Continuar: boolean);
var
  col : integer;
begin
  inherited;
  if (Assigned(DBGFTareas.SelectedField) and (DBGFTareas.SelectedField.Name = 'QMProTareaEscRECURSO') and (ProDMEscandallo.QMProTareaEscTIME.AsString = '00:00:00')) then
  begin
     col := EncuentraField(DBGFTareas, 'TIME');
     if (col >= 0) then
     begin
        with DBGFTareas.Columns[col] do // es posiciona dins el camp TIME
        begin
           if Visible then
              DBGFTareas.SelectedIndex := Index;
        end;
     end;
  end;
end;

function TProFMEscandallo.CurrText(Notas: TDBRichEdit): TTextAttributes;
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

procedure TProFMEscandallo.GetFontNames;
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

procedure TProFMEscandallo.SelectionChange(Sender: TObject);
begin
  with DBMNotasEsc.Paragraph do
     try
        FUpdating := True;
        TButtNegrita.Down := fsBold in DBMNotasEsc.SelAttributes.Style;
        TButtCursiva.Down := fsItalic in DBMNotasEsc.SelAttributes.Style;
        TButtSubrayado.Down := fsUnderline in DBMNotasEsc.SelAttributes.Style;

        FontSize.Text := IntToStr(DBMNotasEsc.SelAttributes.Size);
        FontName.Text := DBMNotasEsc.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlign.Down := True;
           1: TButtRightAlign.Down := True;
           2: TButtCenterAlign.Down := True;
        end;
     finally
        FUpdating := False;
     end;
end;

procedure TProFMEscandallo.SelectionChangeFase(Sender: TObject);
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

procedure TProFMEscandallo.TButtUndoClick(Sender: TObject);
begin
  inherited;
  with DBMNotasEsc do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TProFMEscandallo.TButtCutClick(Sender: TObject);
begin
  inherited;
  DBMNotasEsc.CutToClipboard;
end;

procedure TProFMEscandallo.TButtCopyClick(Sender: TObject);
begin
  inherited;
  DBMNotasEsc.CopyToClipboard;
end;

procedure TProFMEscandallo.TButtPasteClick(Sender: TObject);
begin
  inherited;
  DBMNotasEsc.PasteFromClipboard;
end;

procedure TProFMEscandallo.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotasEsc).Name := FontName.Items[FontName.ItemIndex];
end;

procedure TProFMEscandallo.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotasEsc).Size := StrToInt(FontSize.Text);
end;

procedure TProFMEscandallo.TButtNegritaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegrita.Down then
     CurrText(DBMNotasEsc).Style := CurrText(DBMNotasEsc).Style + [fsBold]
  else
     CurrText(DBMNotasEsc).Style := CurrText(DBMNotasEsc).Style - [fsBold];
end;

procedure TProFMEscandallo.TButtCursivaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursiva.Down then
     CurrText(DBMNotasEsc).Style := CurrText(DBMNotasEsc).Style + [fsItalic]
  else
     CurrText(DBMNotasEsc).Style := CurrText(DBMNotasEsc).Style - [fsItalic];
end;

procedure TProFMEscandallo.TButtSubrayadoClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayado.Down then
     CurrText(DBMNotasEsc).Style := CurrText(DBMNotasEsc).Style + [fsUnderline]
  else
     CurrText(DBMNotasEsc).Style := CurrText(DBMNotasEsc).Style - [fsUnderline];
end;

procedure TProFMEscandallo.TButtLeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasEsc.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMEscandallo.TButtCenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasEsc.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMEscandallo.TButtRightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasEsc.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMEscandallo.TButtUndoFaseClick(Sender: TObject);
begin
  inherited;
  with DBMNotasFases do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TProFMEscandallo.TButtCutFaseClick(Sender: TObject);
begin
  inherited;
  DBMNotasFases.CutToClipboard;
end;

procedure TProFMEscandallo.TButtCopyFaseClick(Sender: TObject);
begin
  inherited;
  DBMNotasFases.CopyToClipboard;
end;

procedure TProFMEscandallo.TButtPasteFaseClick(Sender: TObject);
begin
  inherited;
  DBMNotasFases.PasteFromClipboard;
end;

procedure TProFMEscandallo.FontNameFaseChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotasFases).Name := FontNameFase.Items[FontNameFase.ItemIndex];
end;

procedure TProFMEscandallo.FontSizeFaseChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotasFases).Size := StrToInt(FontSizeFase.Text);
end;

procedure TProFMEscandallo.TButtNegritaFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegritaFase.Down then
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style + [fsBold]
  else
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style - [fsBold];
end;

procedure TProFMEscandallo.TButtCursivaFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursivaFase.Down then
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style + [fsItalic]
  else
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style - [fsItalic];
end;

procedure TProFMEscandallo.TButtSubrayadoFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayadoFase.Down then
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style + [fsUnderline]
  else
     CurrText(DBMNotasFases).Style := CurrText(DBMNotasFases).Style - [fsUnderline];
end;

procedure TProFMEscandallo.TButtLeftAlignFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasFases.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMEscandallo.TButtCenterAlignFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasFases.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMEscandallo.TButtRightAlignFaseClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotasFases.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TProFMEscandallo.TButtColorClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBMNotasEsc.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText(DBMNotasEsc).Color := ColorSeleccionado
  else
     CurrText(DBMNotasEsc).Color := ColorDefecto;
end;

procedure TProFMEscandallo.TButtColorFaseClick(Sender: TObject);
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

procedure TProFMEscandallo.ArbolSubescandallo(nodo: TTreeNode);
begin
  // beep;
end;

procedure TProFMEscandallo.ALstProEscImgExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstEscandalloImg, ProFMLstEscandalloImg, Sender);
end;

procedure TProFMEscandallo.TBDocumentosClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(ProDMEscandallo.QMProEscandalloID_ESC.AsString, 'PRO_ESCANDALLO(ID_ESC)', 'DELFOS', _('Ficheros de Escandallo'));
end;

procedure TProFMEscandallo.ALstNecEscExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstNecesidadesEsc, ProFMLstNecesidadesEsc, Sender);
  ProFMLstNecesidadesEsc.Inicializar(StrToIntDef(DBEEscandallo.Text, 0), 1);
end;

procedure TProFMEscandallo.ToolButton2Click(Sender: TObject);
begin
  inherited;
  // AbreForm(TZFMProCopiaEscAEsc, ZFMProCopiaEscAEsc);
end;

procedure TProFMEscandallo.ActivoONo;
begin
  case ProDMEscandallo.QMProEscandalloESTADO.AsInteger of
     0:
        TBActivo.Action := AActivaEscandallo;
     1:
        TBActivo.Action := ADesactivaEscandallo;
     2:
        TBActivo.Action := AActivaEscandallo;
  end;
end;

procedure TProFMEscandallo.ComprobarValorDefecto;
var
  Visibilidad : boolean;
begin
  // Tipo de Control
  Visibilidad := (DMMain.DameConstanteProduccion('QUIM_TIPOCONTROL') = 1);
  Z_LblTipoControl.Visible := Visibilidad;
  Z_DBCBVTipoControl.Visible := Visibilidad;

  //Densidad
  { dji lrk kri - parece que es de otra version}
  {
  Visibilidad := (DMMain.DameConstanteProduccion('QUIM_DENSIDAD') = 1);
  DBGFMateriales.Columns[9].Visible := Visibilidad;
  DBGFMateriales.Columns[10].Visible := Visibilidad;
  }

  //Checks per defecte
  DBCBGeneraOF.Checked := (DMMain.DameConstanteProduccion('ESC_GENERA_OF') = 1);
  DBCBModif_Coste.Checked := (DMMain.DameConstanteProduccion('ESC_MODIFICAR_COSTE') = 1);
  DBCBMateriales.Checked := (DMMain.DameConstanteProduccion('ESC_MATERIALES') = 1);
  DBCBauto_calc.Checked := (DMMain.DameConstanteProduccion('ESC_AUTO_CALCULAR') = 1);
  DBCBRecursos.Checked := (DMMain.DameConstanteProduccion('ESC_RECURSOS') = 1);
end;

procedure TProFMEscandallo.ALstMatEscExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstMatEsc, ProFMLstMatEsc, Sender);
end;

procedure TProFMEscandallo.BtCalculaFormDetClick(Sender: TObject);
begin
  inherited;
  // ProDmEscandallo.CalculaFormulaDet;
end;

procedure TProFMEscandallo.BTCalcFormClick(Sender: TObject);
begin
  inherited;
  CalculaFormulas;
  ShowMessage(_('Proceso de cálculo finalizado.'));
end;

procedure TProFMEscandallo.LFResponsableChange(Sender: TObject);
begin
  inherited;
  ETituloResponsable.Text := DameTituloEmpleado(StrToIntDef(LFResponsable.Text, 0));
end;

procedure TProFMEscandallo.TBCarpetasClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMCarpetas, ProFMCarpetas, Sender);
  ProFMCarpetas.Posicionar(ProDMEscandallo.QMProEscandalloID_ESC.AsInteger, ProDMEscandallo.QMProEscandalloTIPO.AsString);
end;

procedure TProFMEscandallo.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSDibujoEsc) then
     ProDMEscandallo.QMProDibEsc.Close;

  if (PCMain.ActivePage = TSDetalle) then
  begin
     ProDMEscandallo.QMProFasesEsc.Close;
     if (DMMain.EstadoKri(242) = 1) then
        AAdjuntosMaterial.Enabled := False;
  end;

  if (PCMain.ActivePage = TSPrecios) then
  begin
     ProDMEscandallo.QMTmpCostesEscandallos.Close;
     ProDMEscandallo.QMCalculoMetros.Close;
  end;
end;

procedure TProFMEscandallo.DBGFTareasDblClick(Sender: TObject);
begin
  inherited;
  GetTime(Sender);

  if (UpperCase(ColActual.FieldName) = 'FORMULA') then
     FMain.EjecutaAccion(FMain.AProFormulas, 'ID_FORMULA = ' +
        IntToStr(ProDMEscandallo.QMProTareaEscFORMULA.AsInteger));

  if (UpperCase(ColActual.FieldName) = 'ID_UTILLAJES') then
     FMain.EjecutaAccion(FMain.AProUtillajes, ProDMEscandallo.QMProTareaEscID_UTILLAJES.AsString);
end;

procedure TProFMEscandallo.DBGFTareasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TProFMEscandallo.TButtOrdenLineasMatClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.OrdenarLineas('MESC');
end;

procedure TProFMEscandallo.TButtOrdenLineasTarClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.OrdenarLineas('TESC');
end;

procedure TProFMEscandallo.ACalcFormulaFiltroExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('ATENCIÓN: Se van a recalcular todas las fórmulas de los escandallos' + #13#10 +
     'filtrados. ¿Desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     CambiarEstado(0);
     ProDMEscandallo.CalculaFormulasFiltro;
     ShowMessage(_('Proceso de cálculo finalizado.'));
     CambiarEstado(1);
  end;
end;

procedure TProFMEscandallo.AActPreciosExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('ATENCIÓN: Se van a recalcular los precios del escandallo actual.' + #13#10 +
     '¿Desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     ProDMEscandallo.ActualizarPrecios(0);
     ProDMEscandallo.QMProEscandallo.Refresh;
     ShowMessage(_('Proceso de cálculo finalizado.'));
  end;
end;

procedure TProFMEscandallo.AActPreciosFiltroExecute(Sender: TObject);
begin
  inherited;
  //sfg.albert
  if MessageDlg(_('ATENCIÓN: Se van a recalcular los precios de los escandallos filtrados.' + #13#10 +
     '¿Desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     ProDMEscandallo.ActualizarPreciosFiltro;
     ShowMessage(_('Proceso de cálculo finalizado.'));
  end;
end;

procedure TProFMEscandallo.TBPreciosFiltroClick(Sender: TObject);
begin
  inherited;
  //sfg.albert
  if MessageDlg(_('ATENCIÓN: Se van a recalcular los precios de los escandallos filtrados.' + #13#10 +
     '¿Desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     ProDMEscandallo.ActualizarPreciosFiltro;
     ShowMessage(_('Proceso de cálculo finalizado.'));
  end;
end;

procedure TProFMEscandallo.TBCalcFiltroClick(Sender: TObject);
var
  Escandallo : integer;
begin
  inherited;
  Escandallo := ProDMEscandallo.QMProEscandalloESCANDALLO.AsInteger;

  with TProFMEscCalculoFiltrado.Create(Self) do
  begin
     try
        ShowModal;
     finally
        Free;
     end;
  end;

  ProDMEscandallo.PosicionaEscandallo(Escandallo);

  if (PCMain.ActivePage = TSDetalle) then
     TSDetalleShow(Sender);
end;

procedure TProFMEscandallo.CalculaFormulas;
begin
  ProDMEscandallo.CalculaFormulas(ProDMEscandallo.QMProEscandalloTIPO.AsString, ProDMEscandallo.QMProEscandalloESCANDALLO.AsInteger);
end;

procedure TProFMEscandallo.ACalculoFormulasExecute(Sender: TObject);
begin
  inherited;
  CalculaFormulas;
end;

procedure TProFMEscandallo.ALstEscDesglosadoExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstEscandalloDesg, ProFMLstEscandalloDesg, Sender);
  ProFMLstEscandalloDesg.Inicializa(TAction(Sender).Tag);
  ProFMLstEscandalloDesg.EFEscandallo.Text := DBEEscandallo.Text;
end;

procedure TProFMEscandallo.TSDetalleShow(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.QMProFasesEsc.Open;
  if (DMMain.EstadoKri(242) = 1) then
     AAdjuntosMaterial.Enabled := (PCMatTar.ActivePage = TSMateriales);
end;

procedure TProFMEscandallo.AAdjuntosDeEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ESP', ProDMEscandallo.QMProEscandalloID_ESC.AsInteger);
end;

procedure TProFMEscandallo.AAdjuntosDeArticuloExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ART', DameIDArticulo(ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString));
end;

procedure TProFMEscandallo.AAdjuntosMaterialExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ART', DameIDArticulo(ProDMEscandallo.QMProMatEscCOMPONENTE.AsString));
end;

procedure TProFMEscandallo.DBEFUnidadChange(Sender: TObject);
begin
  inherited;
  EDescTipoUnidad.Text := DameTituloTipoUnidad(DBEFUnidad.Text);
end;

procedure TProFMEscandallo.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.QMProFasesEscID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TProFMEscandallo.NavDibujoFasesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TProFMEscandallo.APropagaAlmacenLanzamientoAMaterialesExecute(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.PropagaAlmacenLanzamientoAMateriales;
end;

procedure TProFMEscandallo.CambiarEstado(Estado: integer);
begin
  ProDMEscandallo.CambiarEstado(Estado);
end;

procedure TProFMEscandallo.AActivaEscandalloExecute(Sender: TObject);
begin
  inherited;
  CambiarEstado(1);
end;

procedure TProFMEscandallo.ADesActivaEscandalloExecute(Sender: TObject);
begin
  inherited;
  CambiarEstado(0);
end;

procedure TProFMEscandallo.AMarcaEscandalloComoObsoletoExecute(Sender: TObject);
begin
  inherited;
  CambiarEstado(2);
end;

procedure TProFMEscandallo.LFDBEstadoChange(Sender: TObject);
begin
  inherited;
  ActivoONo;
  case ProDMEscandallo.QMProEscandalloESTADO.AsInteger of
     0: ColorResaltado2(TLFDbedit(Sender));
     1: ColorBloqueado(TLFDbedit(Sender));
     2: ColorResaltado(TLFDbedit(Sender));
  end;
end;

procedure TProFMEscandallo.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  ProDMEscandallo.ActualizaDefecto;
  EstableceCaption;
end;

procedure TProFMEscandallo.AFiltraComponenteExecute(Sender: TObject);
var
  Componente : string;
  Filtro : string;
begin
  inherited;
  /// Filtra los escandallos que contienen este componente dentro de su lista de materiales.
  Componente := '';
  if (PideDato('ART', Componente, _('Seleccione Componente'))) then
  begin
     Filtro := '(ID_ESC IN (SELECT ID_ESC FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND COMPONENTE = ''' + Componente + '''))';
     FiltraEscandallo(FTipo, Filtro);
     if (PCMain.ActivePage = TSDetalle) then
        TSDetalleShow(Sender);
  end;
end;

procedure TProFMEscandallo.AFiltraSubescandallosExecute(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  // Filtro el escandallo + los componentes del escandallo
  Filtro := '(ID_ESC IN (SELECT DISTINCT ID_ESC_DET FROM DAME_DESGLOSE_ESCANDALLO_MAT(' + IntToStr(ProDMEscandallo.QMProEscandalloID_ESC.AsInteger) + ', 1)))';
  Filtro := '(' + Filtro + ' OR (ID_ESC = ' + IntToStr(ProDMEscandallo.QMProEscandalloID_ESC.AsInteger) + '))';
  FiltraEscandallo(FTipo, Filtro);
  if (PCMain.ActivePage = TSDetalle) then
     TSDetalleShow(Sender);
end;

procedure TProFMEscandallo.AActuPCosteArtExecute(Sender: TObject);
begin
  inherited;

  if ConfirmaMensaje(_('ATENCIÓN: Se van a actualizar los precios de coste de los artículos de los compuestos filtrados.' + #13#10 +
     '¿Desea continuar?')) then
  begin
     ProDMEscandallo.ActualizarPCosteArticulosFiltro;
     ShowMessage(_('Proceso de actualización finalizado.'));
  end;
end;

procedure TProFMEscandallo.G2kTableLocDetalleClick(Sender: TObject);
begin
  inherited;
  G2kTableLocDetalle.CondicionBusqueda := 'ID_ESC = ' + IntToStr(ProDMEscandallo.QMProEscandalloID_ESC.AsInteger);
  // Fuerzo la tabla a buscar, porque al crearse el componente toma la tabla del DataSource
  G2kTableLocDetalle.Tabla_a_buscar := 'VER_PRO_MAT_ESC_EF';
end;

procedure TProFMEscandallo.AImportarMaterialesExecute(Sender: TObject);
begin
  inherited;

  if (ProDMEscandallo.QMProEscandalloESTADO.AsInteger <> 0) then
     ShowMessage(_('El escandallo esta activo'))
  else
  begin
     with TFMInsercionArticuloDesdeTexto.Create(Self) do
     begin
        DM := ProDMEscandallo;
        ShowModal;
        Free;
     end;
  end;
end;

procedure TProFMEscandallo.BClipboardClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.QMProFasesEscID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TProFMEscandallo.PCMatTarChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMatTar.ActivePage = TSMateriales) then
     if (DMMain.EstadoKri(242) = 1) then
        AAdjuntosMaterial.Enabled := False;
end;

procedure TProFMEscandallo.NavMaterialesChangeState(Sender: TObject);
var
  c : integer;
begin
  inherited;
  c := EncuentraField(DBGFMateriales, 'COMPONENTE');
  if (c >= 0) then
     DBGFMateriales.ColumnaInicial := c;
end;

procedure TProFMEscandallo.TBCopiaNotasAModeloClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.CopiaNotasAModelo;
end;

procedure TProFMEscandallo.DBGFMaterialesColEnter(Sender: TObject);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     SalirSiNoExiste := False;
     SalirSiVacio := True;

     if Assigned(SelectedField) then
     begin
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
end;

procedure TProFMEscandallo.TButtDuplicarTareaClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.DuplicarTarea(ProDMEscandallo.QMProTareaEscEMPRESA.AsInteger, ProDMEscandallo.QMProTareaEscESCANDALLO.AsInteger,
     ProDMEscandallo.QMProTareaEscLINEA_FASE.AsInteger, ProDMEscandallo.QMProTareaEscLINEA_TAREA.AsInteger, ProDMEscandallo.QMProTareaEscTIPO.AsString);
end;

procedure TProFMEscandallo.TButtDuplicarMaterialClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.DuplicarMaterial(ProDMEscandallo.QMProMatEscEMPRESA.AsInteger, ProDMEscandallo.QMProMatEscESCANDALLO.AsInteger,
     ProDMEscandallo.QMProMatEscLINEA_COMP.AsInteger, ProDMEscandallo.QMProMatEscTIPO.AsString);
end;

procedure TProFMEscandallo.TSPreciosShow(Sender: TObject);
var
  col : integer;
begin
  inherited;
  ProDMEscandallo.QMTmpCostesEscandallos.Open;
  col := EncuentraField(DBGFCostesEscandallo, 'UNIDADES');
  if (col >= 0) then
     DBGFCostesEscandallo.ColumnaInicial := col;

  ProDMEscandallo.QMCalculoMetros.Open;
end;

procedure TProFMEscandallo.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  FiltraEscandallo(FTipo, '');
end;

procedure TProFMEscandallo.AFFiltroNoActivoExecute(Sender: TObject);
begin
  inherited;
  FiltraEscandallo(FTipo, ' ESTADO=0 ');
end;

procedure TProFMEscandallo.AFFiltroActivosExecute(Sender: TObject);
begin
  inherited;
  FiltraEscandallo(FTipo, ' ESTADO=1 ');
end;

procedure TProFMEscandallo.AFFiltroObseletoExecute(Sender: TObject);
begin
  inherited;
  FiltraEscandallo(FTipo, ' ESTADO=2 ');
end;

procedure TProFMEscandallo.TBRecalcularCostesPorUnidadesClick(Sender: TObject);
begin
  inherited;
  ProDMEscandallo.RecalcularCostesPorUnidades;
end;

procedure TProFMEscandallo.NavCostesEscandalloClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
var
  col : integer;
begin
  inherited;
  if (Button = nbEdit) then
  begin
     col := EncuentraField(DBGFCostesEscandallo, 'MARGEN');
     if (col >= 0) then
        DBGFCostesEscandallo.ColumnaInicial := col;
     DBGFCostesEscandallo.FindColumn('UNIDADES').ReadOnly := True;
     DBGFCostesEscandallo.FindColumn('UNIDADES').Color := clInfoBk;
     DBGFCostesEscandallo.CamposNoAccesibles.Text := 'UNIDADES';

  end
  else
  begin
     col := EncuentraField(DBGFCostesEscandallo, 'UNIDADES');
     if (col >= 0) then
        DBGFCostesEscandallo.ColumnaInicial := col;
     DBGFCostesEscandallo.FindColumn('UNIDADES').ReadOnly := False;
     DBGFCostesEscandallo.FindColumn('UNIDADES').Color := clWindow;
     DBGFCostesEscandallo.CamposNoAccesibles.Clear;
  end;
end;

procedure TProFMEscandallo.AActivaTodosExecute(Sender: TObject);
begin
  inherited;
  RefrescarArbol := False;
  try
     ProDMEscandallo.CambiarEstadoFiltrados(1);
  finally
     RefrescarArbol := True;
  end;
  ArbolEsc;
end;

procedure TProFMEscandallo.ADesactivaTodosExecute(Sender: TObject);
begin
  inherited;
  RefrescarArbol := False;
  try
     ProDMEscandallo.CambiarEstadoFiltrados(0);
  finally
     RefrescarArbol := True;
  end;
  ArbolEsc;
end;

procedure TProFMEscandallo.DBEMaquinaChange(Sender: TObject);
begin
  inherited;
  EDescripcionMaquina.Text := DameTituloMaquina(StrToIntDef(DBEFMaquina.Text, 0));
end;

procedure TProFMEscandallo.DBEArticuloChange(Sender: TObject);
begin
  inherited;
  EDescripcionArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TProFMEscandallo.DBEFArticuloChange(Sender: TObject);
begin
  inherited;
  EDescripcionArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TProFMEscandallo.DBEFMaquinaChange(Sender: TObject);
begin
  inherited;
  EDescripcionMaquina.Text := DameTituloMaquina(StrToIntDef(DBEFMaquina.Text, 0));
end;

procedure TProFMEscandallo.SBAFiltraArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, format('ARTICULO = ''%s''', [ProDMEscandallo.QMCalculoMetrosARTICULO.AsString]));
end;

procedure TProFMEscandallo.DBEFCilindroChange(Sender: TObject);
begin
  inherited;
  EDescripcionCilindro.Text := DameTituloCilindro(StrToIntDef(DBEFCilindro.Text, 0));
end;

procedure TProFMEscandallo.DBEFTroquelesChange(Sender: TObject);
begin
  inherited;

  if (StrToIntDef(DBEFTroqueles.Text, 0) <> 0) then
  begin
     DBEAnchoTroquel.Enabled := False;
     DBEFigurasAnchoTroquel.Enabled := False;
     DBESVAvanceTroquel.Enabled := False;
     DBEFigurasAvanceTroquel.Enabled := False;

     ColorInfo(DBEAnchoTroquel);
     ColorInfo(DBEFigurasAnchoTroquel);
     ColorInfo(DBESVAvanceTroquel);
     ColorInfo(DBEFigurasAvanceTroquel);
  end
  else
  begin
     DBEAnchoTroquel.Enabled := True;
     DBEFigurasAnchoTroquel.Enabled := True;
     DBESVAvanceTroquel.Enabled := True;
     DBEFigurasAvanceTroquel.Enabled := True;

     ColorEdicion(DBEAnchoTroquel);
     ColorEdicion(DBEFigurasAnchoTroquel);
     ColorEdicion(DBESVAvanceTroquel);
     ColorEdicion(DBEFigurasAvanceTroquel);
  end;
end;

procedure TProFMEscandallo.TBCrearDesarrolloClick(Sender: TObject);
begin
  inherited;
  // Todo controlamos que calculos > 0 y estado edicion 0

  if ((StrToFloatDef(DBECalculo1.Text, 0) = 0) or (StrToFloatDef(DBECalculo2.Text, 0) = 0) or (StrToFloatDef(DBECalculo3.Text, 0) = 0)) then
  begin
     ShowMessage(_('Los cálculos no pueden tener valor 0.'));
  end
  else
  begin
     if ConfirmaMensaje(_('Se van a crear fases, materiales y tareas en el desarrollo del escandallo.' + #13#10 +
        '¿Desea continuar?')) then
     begin
        ProDMEscandallo.CrearDesarrolloEscandallo;
        ShowMessage(_('Proceso de creación de desarrollo finalizado.'));
     end;
  end;
end;

procedure TProFMEscandallo.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('ESP', ProDMEscandallo.QMProEscandalloID_ESC.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosDeEscandallo.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TProFMEscandallo.AInfoStockExecute(Sender: TObject);
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
        Articulo := ProDMEscandallo.QMProEscandalloCOMPUESTO.AsString;
        Almacen := ProDMEscandallo.QMProEscandalloALMACEN_ENT.AsString;
     end
     else
     if (Sender = TButtInfStocksMaterial) then
     begin
        Articulo := ProDMEscandallo.QMProMatEscCOMPONENTE.AsString;
        Almacen := ProDMEscandallo.QMProMatEscALMACEN.AsString;
     end;
  end;

  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TProFMEscandallo.AAsociarAdjuntosExecute(Sender: TObject);
var
  Directorio : string;
  Ficheros : TStrings;
  i, IdAdjunto : integer;

  procedure BuscaFicheros(SL: TStrings; Directorio, Nombre, Extension: string);
  var
     sr : TSearchRec;
  begin
     DMMain.Log(format('   ' + 'Leyendo ficheros %s\%s.%s', [Directorio, Nombre, Extension]));
     if FindFirst(Directorio + '\*.*', SysUtils.faAnyFile, sr) = 0 then
     begin
        repeat
           if (sr.Attr and faDirectory = faDirectory) then
           begin
              if ((sr.Name <> '.') and (sr.Name <> '..')) then
                 BuscaFicheros(SL, Directorio + '\' + sr.Name, Nombre, Extension);
           end
           else
           begin
              if (UpperCase(Copy(sr.Name, 1, Pos('.', sr.Name) - 1)) = UpperCase(Nombre)) then
              begin
                 SL.Add(Directorio + '\' + sr.Name);
                 DMMain.Log(format('   ' + 'Encontrado: %s', [sr.Name]));
              end;
           end;
        until FindNext(sr) <> 0;

        FindClose(sr);
     end;
  end;

begin
  inherited;
  Ficheros := TStringList.Create;
  try
     if MySelectDirectory(Directorio, 'ProFMEscandallo-ImportacionAdjuntos') then
     begin
        DMMain.Log(format('Asociar Adjuntos - Carpeta %s', [Directorio]));
        ProDMEscandallo.QMProMatEsc.First;
        while not ProDMEscandallo.QMProMatEsc.EOF do
        begin
           Ficheros.Clear;
           BuscaFicheros(Ficheros, Directorio, ProDMEscandallo.QMProMatEscCOMPONENTE.AsString, '*');

           AbreData(TDMAdjunto, DMAdjunto);
           try
              for i := 0 to Ficheros.Count - 1 do
              begin
                 IdAdjunto := DMMain.DameIdFicheroAdjunto('ART', DameIDArticulo(ProDMEscandallo.QMProMatEscCOMPONENTE.AsString), ExtractFileName(Ficheros[i]));
                 if ((IdAdjunto > 0) and (ConfirmaMensaje(format(_('El fichero %s ya existe. Desea reemplazarlo?'), [ExtractFileName(Ficheros[i])])))) then
                 begin
                    DMAdjunto.BorraAdjunto('ART', DameIDArticulo(ProDMEscandallo.QMProMatEscCOMPONENTE.AsString), IdAdjunto);
                    IdAdjunto := 0;
                 end;

                 if (IdAdjunto = 0) then
                    DMAdjunto.CreaAdjunto('ART', DameIDArticulo(ProDMEscandallo.QMProMatEscCOMPONENTE.AsString), Ficheros[i], ExtractFileName(Ficheros[i]));
              end;
           finally
              CierraData(DMAdjunto);
           end;

           ProDMEscandallo.QMProMatEsc.Refresh;
           ProDMEscandallo.QMProMatEsc.Next;
        end;
     end;
  finally
     Ficheros.Free;
  end;
end;

end.
