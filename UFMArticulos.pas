unit UFMArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, UFIBDBEditfind, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UComponentesBusquedaFiltrada, dbcgrids, URecursos,
  UFPEdit, ActnList, Buttons, UHYEdits, DbComboBoxValue, Barras,
  UHYDescription, NsDBGrid, rxPlacemnt, ULFCheckBox, ULFDBMemo,
  ULFPageControl, ULFDBCtrlGrid, ULFEdit, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar, ULFPanel,
  ULFHYDBDescription, DBActns, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  UG2kTBLoc, DB, URightMaskEdit, ExtActns, StdActns, HYFIBQuery, ULFComboBox, FIBDataSetRO,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBComboBoxValue, UDMArticulos;

type
  TFMArticulos = class(TFPEdit)
     LBLArticuloFicha: TLFLabel;
     DBEArticulo: TLFDbedit;
     LBLNombreFicha: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLFamilia: TLFLabel;
     ETitFamilia: TLFEdit;
     DBCBAbierto: TLFDBCheckBox;
     LBLPcoste: TLFLabel;
     DBEPCoste: TLFDbedit;
     TSHistCost: TTabSheet;
     HYTDBGHistCoste: THYTDBGrid;
     TSStocks: TTabSheet;
     DBCBControlStock: TLFDBCheckBox;
     DBEFFamilia: TLFDBEditFind2000;
     TSPrecios: TTabSheet;
     TBPrecios: TLFToolBar;
     PNLEPrecios: TLFPanel;
     PNLCabPrecios: TLFPanel;
     PNLTitHist: TLFPanel;
     DBExCod: TLFDbedit;
     DBExTitulo: TLFDbedit;
     DBExCodTar: TLFDbedit;
     DBExTitTar: TLFDbedit;
     CEPrecios: TControlEdit;
     CEPreciosPMEdit: TPopUpTeclas;
     LBLCtaCompra: TLFLabel;
     DBEFCompras: TLFDBEditFind2000;
     ETitCompras: TLFEdit;
     LBLCtaVenta: TLFLabel;
     DBEFVentas: TLFDBEditFind2000;
     ETitVentas: TLFEdit;
     DBEFIva: TLFDBEditFind2000;
     DBETipIva: TLFDbedit;
     DBERecIva: TLFDbedit;
     DBETitIva: TLFDbedit;
     LBLIVA: TLFLabel;
     TBStocks: TLFToolBar;
     PNLCabStocks: TLFPanel;
     DBExTitStk: TLFDbedit;
     CEStocks: TControlEdit;
     CEStocksPMEdit: TPopUpTeclas;
     PNLEStocks: TLFPanel;
     NavStocks: THYMNavigator;
     TButtSep2: TToolButton;
     TSProveedores: TTabSheet;
     DBExCodStk: TLFDbedit;
     TSep1: TMenuItem;
     MIEscandallo: TMenuItem;
     LBLUnidades: TLFLabel;
     DBEFUnidades: TLFDBEditFind2000;
     DBETitUnidades: TLFDbedit;
     DBCBVirtual: TLFDBCheckBox;
     TSFabricacion: TTabSheet;
     DBCtrlFabricacion: TLFDBCtrlGrid;
     DBEFabAlmacen: TLFDbedit;
     DBEFabAlmDesc: TLFDbedit;
     DBEExistencias: TLFDbedit;
     PNLFabricar2: TLFPanel;
     LFabricacionAlmacen: TLFLabel;
     LFabricacionTitulo: TLFLabel;
     LBLExistencias: TLFLabel;
     LBLFabricables: TLFLabel;
     TBFabricacion1: TLFToolBar;
     HYMNavFabricar: THYMNavigator;
     DBEFabricables: TLFDbedit;
     PNLFabricar1: TLFPanel;
     LBLAFabricar: TLFLabel;
     EDFabricar: TLFEdit;
     TSep3: TToolButton;
     PNLFabricar3: TLFPanel;
     SBFabricacion: TSpeedButton;
     PNLFabricar4: TLFPanel;
     DBEArticuloFab: TLFDbedit;
     DBETituloArtFab: TLFDbedit;
     PNLFabricar5: TLFPanel;
     SBDesFabricacion: TSpeedButton;
     TSNotas: TTabSheet;
     PNLNotas: TLFPanel;
     LblTituloCorto: TLFLabel;
     DBTituloCorto: THYDBEdit;
     DBMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LNotasNotas: TLFLabel;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     TSCodBarra: TTabSheet;
     PNLCodBarras1: TLFPanel;
     NavCodBarras: THYMNavigator;
     PNLCodBarras2: TLFPanel;
     ICodBarras: TImage;
     CodBarras: TCodeBar;
     CEBarras: TControlEdit;
     CEBarrasPMEdit: TPopUpTeclas;
     LCodigoBarras: TLFLabel;
     TBCodBarras1: TLFToolBar;
     DBGFCodBarra: TDBGridFind2000;
     DBECodBarras: THYDBEdit;
     BVCodBarras: TBevel;
     LBLDisponibilidad: TLFLabel;
     DBEFDisponibilidad: TLFDBEditFind2000;
     DBEDisponibilidad: TLFDbedit;
     DBCHKActVenta: TLFDBCheckBox;
     LBLPtoVerde: TLFLabel;
     DBEPtoVerde: TLFDbedit;
     CEFabricacion: TControlEdit;
     CEFabricacionPMEdit: TPopUpTeclas;
     TButtRecalcularStock: TToolButton;
     LblControlaUnidades: TLFLabel;
     DBEControlaUnidades: TLFDbedit;
     PCProveedores: TLFPageControl;
     TSPedidosProv: TTabSheet;
     PNLProveedores: TLFPanel;
     TBProv: TLFToolBar;
     PNLCabProveedores: TLFPanel;
     DBExTitProv: TLFDbedit;
     DBExCodProv: TLFDbedit;
     NavProv: THYMNavigator;
     PNLTitProveedores: TLFPanel;
     LBLProv: TLFLabel;
     LBLTituloProv: TLFLabel;
     LBLPrioridad: TLFLabel;
     LBLPedMinimo: TLFLabel;
     LBLPedOptimo: TLFLabel;
     LBLActivo: TLFLabel;
     PNLEProveedores: TLFPanel;
     DBCGProveedores: TLFDBCtrlGrid;
     DBE_Prov_Codigo: TLFDBEditFind2000;
     DBE_Prov_Titulo: TLFDbedit;
     DBE_Prov_PedMin: TLFDbedit;
     DBE_Prov_PedOpt: TLFDbedit;
     DBCB_Prov_Activo: TLFDBCheckBox;
     DBE_Prov_Prioridad: TLFDbedit;
     TSCodigoProv: TTabSheet;
     PNLCodigoProv: TLFPanel;
     TBCodigoProveedor: TLFToolBar;
     PNLTBCodProv: TLFPanel;
     DBExCodProvCod: TLFDbedit;
     DBExCodProvTit: TLFDbedit;
     DBGFProvArt: TDBGridFind2000;
     PNLProv: TLFPanel;
     NavProvArt: THYMNavigator;
     EDTUnidadesExt: TLFEdit;
     DBEExistFabr: TLFDbedit;
     LBLFabrNiveles: TLFLabel;
     PNLCabNotas: TLFPanel;
     PNLTitNotas: TLFPanel;
     DBCBSerizalizado: TLFDBCheckBox;
     LBLGarantia: TLFLabel;
     DBEFGarantia: TLFDBEditFind2000;
     DBETitGarantia: TLFDbedit;
     CEProveedores: TControlEdit;
     CEProveedoresPMEdit: TPopUpTeclas;
     PNLArtCodBarras: TLFPanel;
     DBArtCodBarras: TLFDbedit;
     DBTitCodBarras: TLFDbedit;
     DBArtNotas: TLFDbedit;
     DBTituloNotas: TLFDbedit;
     DBCHKProduccion: TLFDBCheckBox;
     LBLDescuento: TLFLabel;
     DBEDto: TLFDbedit;
     DBEDto2: TLFDbedit;
     DBEDto3: TLFDbedit;
     DBE_Prov_Incr: TLFDbedit;
     LBLIncrPedido: TLFLabel;
     LBLDiasEntrega: TLFLabel;
     TSCuentas: TTabSheet;
     CESeries: TControlEdit;
     CESeriesPMEdit: TPopUpTeclas;
     DBCHBAplicaIVAEscandallo: TLFDBCheckBox;
     TButtRefrescarTabla: TToolButton;
     TButtHistPrecios: TToolButton;
     CBConfigCBarras: TLFCheckBox;
     TSAgrupacion: TTabSheet;
     TBAgrupacion: TLFToolBar;
     PNLAgrupacion: TLFPanel;
     DBEArtAgrupacion: TLFDbedit;
     DBETitAgrupacion: TLFDbedit;
     PPertenece: TLFPanel;
     DBCGDisponibles: TLFDBCtrlGrid;
     DBEAgDentro: TLFDbedit;
     DBEAgTitDentro: TLFDbedit;
     PDisponibles: TLFPanel;
     DBCGPertenece: TLFDBCtrlGrid;
     DBEAgrupacionSon: TLFDbedit;
     DBEAgrupacionSonTitulo: TLFDbedit;
     EDMonedaEmpresa: TLFEdit;
     EDMonedaCanal: TLFEdit;
     DBEPCosteCanal: TLFDbedit;
     LPCosteCanal: TLFLabel;
     DBCHKBUd_Secundaria: TLFDBCheckBox;
     PNLPrecios: TLFPanel;
     LBLTipoPrecioBase: TLFLabel;
     DBCBActTarAutom: TLFDBCheckBox;
     LBLMargen: TLFLabel;
     DBEMargen: TLFDbedit;
     LBLPrecioEntrada: TLFLabel;
     DBEPrecioEntrada: TLFDbedit;
     LBLPrecioUltEntrada: TLFLabel;
     DBEPrecioUltEntrada: TLFDbedit;
     LBLPrecioUltVenta: TLFLabel;
     DBEPrecioUltVenta: TLFDbedit;
     DBEPrecioPMP: TLFDbedit;
     LBLPrecioPMP: TLFLabel;
     LBLPrecioLIFO: TLFLabel;
     DBEPrecioLIFO: TLFDbedit;
     LBLPrecioFIFO: TLFLabel;
     DBEPrecioFIFO: TLFDbedit;
     LBLPrecioMercado: TLFLabel;
     DBEPrecioMercado: TLFDbedit;
     LBLPrecioManual: TLFLabel;
     DBEPrecioManual: TLFDbedit;
     LBLPuntos: TLFLabel;
     DBEPuntos: TLFDbedit;
     DBEFTipoPrecioBase: TLFDBEditFind2000;
     TButtSep7: TToolButton;
     NavPreciosBase: THYMNavigator;
     TButtSep8: TToolButton;
     CEPreciosBase: TControlEdit;
     CEPreciosBasePMEdit: TPopUpTeclas;
     DBEFCanalCalculo: TLFDBEditFind2000;
     DBEFAlmCalculo: TLFDBEditFind2000;
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
     LCanalCalculo: TLFLabel;
     LAlmacenCalculo: TLFLabel;
     TSep11: TToolButton;
     TSep12: TToolButton;
     TButtSep9: TToolButton;
     TButtSep10: TToolButton;
     TButtRecalcula: TToolButton;
     DBCBLoteable: TLFDBCheckBox;
     DBGTarifasPrecios: TDBGridFind2000;
     TBPreciosDetalle: TLFToolBar;
     NavPrecios: THYMNavigator;
     LTipoRedondeo: TLFLabel;
     DBEFTipoRedondeo: TLFDBEditFind2000;
     DBETitTipoRedondeo: TLFDbedit;
     TButtMargen: TToolButton;
     DBEMultiplo1: TLFDbedit;
     DBEMultiplo2: TLFDbedit;
     DBEMultiplo3: TLFDbedit;
     DBEMultiplo4: TLFDbedit;
     LFactorEscala: TLFLabel;
     DBEFactorEscala: TLFDbedit;
     LBLCompraMinima: TLFLabel;
     DBEMinimaCompra: TLFDbedit;
     DBEMinimaVenta: TLFDbedit;
     LBLVentaMinima: TLFLabel;
     TSImagenes: TTabSheet;
     PEditImagenes: TLFPanel;
     TBImagenes: TLFToolBar;
     PInfoImagenes: TLFPanel;
     DBEArtImagen: TLFDbedit;
     DBETitImagenes: TLFDbedit;
     TButtSep16: TToolButton;
     NavImagenes: THYMNavigator;
     CEImagenes: TControlEdit;
     CEImagenesPMEdit: TPopUpTeclas;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     LblPeso: TLFLabel;
     DBEPeso: TLFDbedit;
     LblCodigoIntra: TLFLabel;
     DBECodigoIntra: TLFDbedit;
     AAjustaConFamilia: TAction;
     AAjustarCuentas: TAction;
     AAjustarFamiliasArt: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AEscandallo: TAction;
     AVentasArt: TAction;
     ACodigosBarras: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AControlLotes: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AClientesArticulo: TAction;
     AProveedoresArticulo: TAction;
     ALstArticulos: TAction;
     ALstMovArt: TAction;
     ALstMovsResumido: TAction;
     AConfListArt: TAction;
     AConfListMovArt: TAction;
     AConfLstMovResumido: TAction;
     AConfCodBarras: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AInfoStocks: TAction;
     AHistPrecios: TAction;
     TBCalculaStockMinMaxKri: TToolButton;
     ACalculaStockMinMax: TAction;
     TBStockTyC: TToolButton;
     AStockTyC: TAction;
     LFCategoryAction5: TLFCategoryAction;
     AMargen: TLFDatasetAction;
     AGenerarCodBarras: TLFDatasetAction;
     AHerencia: TLFDatasetAction;
     ALstAgrupacionArt: TAction;
     ASep: TAction;
     LBCtaAbonoC: TLFLabel;
     CtaAbnV: TLFLabel;
     DBEFDevVentas: TLFDBEditFind2000;
     DBEFDevCompras: TLFDBEditFind2000;
     ETitDevCompras: TLFEdit;
     ETitDevVentas: TLFEdit;
     LBCtaDevC: TLFLabel;
     LBCtaDevV: TLFLabel;
     DBEFAbonoCompras: TLFDBEditFind2000;
     DBEFAbonoVentas: TLFDBEditFind2000;
     ETitAbonoVentas: TLFEdit;
     ETitAbonoCompras: TLFEdit;
     AVerArtSistema: TAction;
     TSIdioma: TTabSheet;
     PNIdiomas: TLFPanel;
     DBGFIdiomas: TDBGridFind2000;
     CEIdiomas: TControlEdit;
     CEIdiomasPMEdit: TPopUpTeclas;
     TBIdiomas: TLFToolBar;
     NavIdiomas: THYMNavigator;
     DBCBUbicable: TLFDBCheckBox;
     AUbicacionArticulo: TLFDatasetAction;
     LBVolumen: TLFLabel;
     DBEVolumenUnit: TLFDbedit;
     DBEDiametroUnit: TLFDbedit;
     LBDiametro: TLFLabel;
     LBDefUdSec: TLFLabel;
     DBEDefUdSec: TLFDbedit;
     PNIdiomas1: TLFPanel;
     DBETitArticulo: TLFDbedit;
     DBETitArtic: TLFDbedit;
     PCCuentas: TLFPageControl;
     TSFichaSeries: TTabSheet;
     TSSerieTabla: TTabSheet;
     PNSeries: TLFPanel;
     LCuentasSerieCuentaCompras: TLFLabel;
     LCuentasSerieCuentaVentas: TLFLabel;
     LBCtaDevlC: TLFLabel;
     LbCtaDvnV: TLFLabel;
     LBCtaAbnC: TLFLabel;
     LbCtaAbnV: TLFLabel;
     LCuentasSerie: TLFLabel;
     TBArtSeries: TLFToolBar;
     PInfoSeries: TLFPanel;
     DBEArtSeries: TLFDbedit;
     DBEArtDescSeries: TLFDbedit;
     TSep13: TToolButton;
     TButtHerencia: TToolButton;
     DBEFCtaCompras: TLFDBEditFind2000;
     ETitCtaCompras: TLFEdit;
     ETitCtaVentas: TLFEdit;
     ETitCtaDevCompras: TLFEdit;
     ETitCtaDevVentas: TLFEdit;
     ETitCtaAbonoCompras: TLFEdit;
     ETitCtaAbonoVentas: TLFEdit;
     DBEFCtaAbonoVentas: TLFDBEditFind2000;
     DBEFCtaAbonoCompras: TLFDBEditFind2000;
     DBEFCtaDevVentas: TLFDBEditFind2000;
     DBEFCtaDevCompras: TLFDBEditFind2000;
     DBEFCtaVentas: TLFDBEditFind2000;
     ETitSerie: TLFEdit;
     DBEFSerie: TLFDBEditFind2000;
     TBSeries: TLFToolBar;
     NavSeries: THYMNavigator;
     DBGSeries: THYTDBGrid;
     LProrrateoKri: TLFLabel;
     DBEProrrateoKri: TLFDbedit;
     LPMP_Prorrateo: TLFLabel;
     AListadodeEtiquetasdeArticulos: TAction;
     TButtBuscaPorCodProv: TToolButton;
     ABuscaPorCodProv: TAction;
     EFArticulo: TLFEditFind2000;
     TSPedidos: TTabSheet;
     PNLPedidosDeClientes: TLFPanel;
     PNLPedidosAProveedor: TLFPanel;
     LPedidosDeClientes: TLFLabel;
     LPedidosAProveedor: TLFLabel;
     HYDBGPedidosDeCliente: THYTDBGrid;
     HYDBGPedidosAProveedor: THYTDBGrid;
     HYDBGPropuestas: THYTDBGrid;
     HYDBGPropuestasConfir: THYTDBGrid;
     PNLPedidos: TLFPanel;
     LFDBArticuloPedidoKri: TLFDbedit;
     LFDBTituloPedidoKri: TLFDbedit;
     PNLNotasKri: TLFPanel;
     PNLNotasKriL: TLFPanel;
     LNotasCompras: TLFLabel;
     LNotasVentas: TLFLabel;
     DBCHKAnticipo: TLFDBCheckBox;
     DBCHKAnticipoContado: TLFDBCheckBox;
     DBCHKAnticipoPregDatos: TLFDBCheckBox;
     ACambiarCodigo: TAction;
     AListCodBarras1: TAction;
     LFDBChkWeb: TLFDBCheckBox;
     LBLFabricante: TLFLabel;
     DBEFabricante: TLFDBEditFind2000;
     DBETitFabricante: TLFDbedit;
     EFBarras: TLFEditFind2000;
     LblTipoArticulo: TLFLabel;
     Z_DescTipoArt: TLFHYDBDescription;
     Z_DBEFTipoArt: TLFDBEditFind2000;
     TButtSep1: TToolButton;
     Z_TButtDatosEsp: TToolButton;
     ZADatosToldo: TAction;
     DBCBPreparable: TLFDBCheckBox;
     LbMerma: TLFLabel;
     DBEMerma: TLFDbedit;
     TSProyectos: TTabSheet;
     PNProyectos: TLFPanel;
     LFLCtaCompras: TLFLabel;
     LFLCtaVentas: TLFLabel;
     LFLCtaDevComp: TLFLabel;
     LFLCtaDevVent: TLFLabel;
     LFLCtaAbonoComp: TLFLabel;
     LFLCtaAbonoVentas: TLFLabel;
     LFLProyecto: TLFLabel;
     TBArtProy: TLFToolBar;
     PInfoProy: TLFPanel;
     DBEArtProy: TLFDbedit;
     DBEArtDescProy: TLFDbedit;
     TSep14: TToolButton;
     TButtProyectosHerencia: TToolButton;
     DBEFCtaCompProy: TLFDBEditFind2000;
     ETitCtaCompProy: TLFEdit;
     ETitCtaVentProy: TLFEdit;
     ETitCtaDevCompProy: TLFEdit;
     ETitCtaDevVentProy: TLFEdit;
     ETitCtaAbCompProy: TLFEdit;
     ETitCtaAbVentProy: TLFEdit;
     DBEFCtaDevVentProy: TLFDBEditFind2000;
     DBEFCtaDevCompProy: TLFDBEditFind2000;
     DBEFCtaAbVentProy: TLFDBEditFind2000;
     DBEFCtaAbCompProy: TLFDBEditFind2000;
     DBEFCtaVentProy: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     DBEFProyecto: TLFDBEditFind2000;
     TBProyectos: TLFToolBar;
     NavProy: THYMNavigator;
     TSProyTabla: TTabSheet;
     DBGProyectos: THYTDBGrid;
     TSProySeries: TTabSheet;
     PNProySeries: TLFPanel;
     LFLCtaCompProySer: TLFLabel;
     LFLCtaVentProySer: TLFLabel;
     LFLCtaDevCompPROYSER: TLFLabel;
     LFLCtaDevVentPROYSER: TLFLabel;
     LFLCtaAbCompProySer: TLFLabel;
     LFLCtaAbVentProySer: TLFLabel;
     LFLProySeries: TLFLabel;
     TBArtProySerie: TLFToolBar;
     PInfoProySerie: TLFPanel;
     DBEArtProySer: TLFDbedit;
     DBEArtDescProySer: TLFDbedit;
     TSep5: TToolButton;
     TButtProyectosSerieHerencia: TToolButton;
     DBEFCtaCompProySer: TLFDBEditFind2000;
     ETitCtaCompProySer: TLFEdit;
     ETitCtaVentProySer: TLFEdit;
     ETitCtaDevCompProySer: TLFEdit;
     ETitCtaDevVentProySer: TLFEdit;
     ETitCtaAbCompProySer: TLFEdit;
     ETitCtaAbVentProySer: TLFEdit;
     DBEFCtaDevVentProySer: TLFDBEditFind2000;
     DBEFCtaDevCompProySer: TLFDBEditFind2000;
     DBEFCtaAbVentProySer: TLFDBEditFind2000;
     DBEFCtaAbCompProySer: TLFDBEditFind2000;
     DBEFCtaVentProySer: TLFDBEditFind2000;
     ETitProyectoSeries: TLFEdit;
     DBEFProyectoSeries: TLFDBEditFind2000;
     TBProySeries: TLFToolBar;
     NavProySeries: THYMNavigator;
     LFLSerieProySer: TLFLabel;
     DBEFSerieProySer: TLFDBEditFind2000;
     ETitSerieProySer: TLFEdit;
     TSProySerTabla: TTabSheet;
     DBGProySeries: THYTDBGrid;
     CEProyectos: TControlEdit;
     CEProyectosPMEdit: TPopUpTeclas;
     CEProyectosSeries: TControlEdit;
     CEProyectosSeriesPMEdit: TPopUpTeclas;
     DBETitTipoPrecioBase: TLFDbedit;
     AHistoricoSerializacion: TAction;
     CBSoloPendientes: TLFCheckBox;
     CBSoloPropPendientes: TLFCheckBox;
     Splitter1Kri: TSplitter;
     DBCBNoCalculaStockMinMax: TLFDBCheckBox;
     PNLDescripcionExtendida: TLFPanel;
     DBREIdioma: TDBRichEdit;
     TBIdioma: TLFToolBar;
     TButtIdiomaNegrita: TToolButton;
     TButtIdiomaCursiva: TToolButton;
     TButtIdiomaSubrayado: TToolButton;
     TButtSep4: TToolButton;
     TButtIdiomaAlinIzq: TToolButton;
     TButtIdiomaAlinCentr: TToolButton;
     TButtIdiomaAlinDer: TToolButton;
     TButtSep5: TToolButton;
     TButtIdiomaBullet: TToolButton;
     PNLTamanoIdioma: TLFPanel;
     EFontSize: TLFEdit;
     UpDownFontSize: TUpDown;
     TButtIdiomaSep3: TToolButton;
     DBRENotasCompras: TDBRichEdit;
     TBRichNotas: TLFToolBar;
     TButtNotasNegrita: TToolButton;
     TButtNotasItalica: TToolButton;
     TButtNotasSubrayado: TToolButton;
     TButtSep12: TToolButton;
     TButtNotasAlinIzq: TToolButton;
     TButtNotasAlinCent: TToolButton;
     TButtNotasAlinDer: TToolButton;
     TButtSep13: TToolButton;
     TButtNotasBullets: TToolButton;
     TButtSep14: TToolButton;
     PNLTamanoNotas: TLFPanel;
     EFontSizeNotas: TLFEdit;
     UpDown1: TUpDown;
     ADuplicaArticuloKri: TAction;
     DBRENotasVentas: TDBRichEdit;
     TButtSep6: TToolButton;
     CBFontName: TLFComboBox;
     TButtSep15: TToolButton;
     CBFontNameNotas: TLFComboBox;
     CBAlmacenPedidosPendientesKri: TLFComboBox;
     CBAlmacenPropuestasKri: TLFComboBox;
     LAlmacenPedidosPendientesKri: TLFLabel;
     DBGStockUbicacion: THYTDBGrid;
     PCStocks: TLFPageControl;
     TSStocksStock: TTabSheet;
     TSStocksUbicaciones: TTabSheet;
     PNLStockUbicaciones: TLFPanel;
     TSStocksLote: TTabSheet;
     DBStockLote: THYTDBGrid;
     TSStockNroSerieKRI: TTabSheet;
     DBStockSerieKRI: THYTDBGrid;
     PNLStockLote: TLFPanel;
     LFCategoryAction6: TLFCategoryAction;
     AAdjuntosArticulo: TAction;
     TSUnidadesLogisitcas: TTabSheet;
     TBUnidadesLogisitcas: TLFToolBar;
     PNLUnidadesLogisitcas: TLFPanel;
     DBETituloArtUdsLogisitcas: TLFDbedit;
     DBEArticuloUdsLogisitcas: TLFDbedit;
     NavUnidadesLogisitcas: THYMNavigator;
     DBGUnidadesLogisitcas: TDBGridFind2000;
     CEUnidadesLogisitcas: TControlEdit;
     PMUnidadesLogisitcas: TPopUpTeclas;
     TBStockUbicaciones: TLFToolBar;
     NavStockUbicacion: THYMNavigator;
     PNLStocksAlmacen: TLFPanel;
     TBStockLote: TLFToolBar;
     NavStockLote: THYMNavigator;
     TBStockSerieKRI: TLFToolBar;
     NavStockSerieKRI: THYMNavigator;
     PNLTitStocksalmacenBotom: TLFPanel;
     RMEPMP_Prorrateo: TLFDbedit;
     cbSoloUbicacionConStock: TLFCheckBox;
     TSep7: TToolButton;
     cbSoloLoteConStock: TLFCheckBox;
     TSep9: TToolButton;
     TButtRecalculaUbicaciones: TToolButton;
     ARecalculaStockUbicaciones: TAction;
     TButtIniciaRecalculo: TToolButton;
     TButtParaRecalculo: TToolButton;
     TSep10: TToolButton;
     AIniciaRecalculo: TAction;
     AParaRecalculo: TAction;
     TBFichaTec: TToolButton;
     AFichaTec: TAction;
     PNLStockTiendaVirtual: TLFPanel;
     LStockTiendaVirtual: TLFLabel;
     LEStockTiendaVirtual: TLFLabel;
     DBCHKBaja: TLFDBCheckBox;
     DBDTPFechaBaja: TLFDBDateEdit;
     DBEMotivoBaja: TLFDbedit;
     PNLImagen: TLFPanel;
     TSPropuestas: TTabSheet;
     DBCHKCantidadLimitada: TLFDBCheckBox;
     DBEFClaveADR: TLFDBEditFind2000;
     LClaveADR: TLFLabel;
     DBE_Dias_Entrega: TLFDbedit;
     TSCondicionesProv: TTabSheet;
     DBGCondicionesProv: THYTDBGrid;
     TButtSep11: TToolButton;
     TButtImprimirNotas: TToolButton;
     AImprimirNotas: TAction;
     ALstArticuloProv: TAction;
     AConfLstArticulosProv: TAction;
     DBCHKCompoMotor: TLFDBCheckBox;
     LFechaAltaModif: TLFLabel;
     PCToldosYCortinas: TLFPageControl;
     TSTipoKit: TTabSheet;
     TSTipoComponente: TTabSheet;
     Z_LblKitColor: TLFLabel;
     Z_LblKitTipo: TLFLabel;
     Z_LblFamilia: TLFLabel;
     Z_DBEFKitColor: TLFDBEditFind2000;
     Z_DBCBVKitTipo: TDBComboBoxValue;
     Z_DBEFFamilia: TLFDBEditFind2000;
     Z_ETitFamilia: TLFEdit;
     DBCBQuitarSiMotor: TLFDBCheckBox;
     DBEFSusituto: TLFDBEditFind2000;
     Z_LblTipoLacado: TLFLabel;
     ZLbTipoLacado: TLFLabel;
     Z_DBChkBLacado: TLFDBCheckBox;
     Z_DBChkBCorte: TLFDBCheckBox;
     Z_DBEFTipoLacado: TLFDBEditFind2000;
     Z_DBChkBQuitarSiMotor: TLFDBCheckBox;
     Z_DBESustituto: TLFDBEditFind2000;
     ZLbEfTipoLacado: TLFDBEditFind2000;
     ZCbForzarLacado: TLFDBCheckBox;
     TSTipoLona: TTabSheet;
     LblLonaTipo: TLFLabel;
     LblFormaLona: TLFLabel;
     LblModeloLona: TLFLabel;
     LblConfeccionLona: TLFLabel;
     Z_DBEFTipoLona: TLFDBEditFind2000;
     Z_DBEFFormaLona: TLFDBEditFind2000;
     Z_DescTipoLona: TLFHYDBDescription;
     Z_DescFormaLona: TLFHYDBDescription;
     Z_DBEModeloLona: TLFDbedit;
     Z_DBEFConfeccionLona: TLFDBEditFind2000;
     TSTipoArmazon: TTabSheet;
     Z_LblModelo: TLFLabel;
     Z_LblSalida: TLFLabel;
     Z_LblLinea: TLFLabel;
     Z_DBEFModelo: TLFDBEditFind2000;
     Z_DBEFSalida: TLFDBEditFind2000;
     Z_DBEFLinea: TLFDBEditFind2000;
     TSTipoToldo: TTabSheet;
     Z_LblArmazon: TLFLabel;
     Z_LblLona: TLFLabel;
     Z_DBEFArmazon: TLFDBEditFind2000;
     Z_DBEFLona: TLFDBEditFind2000;
     DBEUltimaModificacion: TLFDbedit;
     TSLama: TTabSheet;
     LAnchoTyC: TLFLabel;
     LLargoLama: TLFLabel;
     LColor: TLFLabel;
     Z_DBAncho: TLFDbedit;
     DBELargoLama: TLFDbedit;
     Z_DBColor: TLFDBEditFind2000;
     Z_DescColor: TLFHYDBDescription;
     DBEFSubfamilia: TLFDBEditFind2000;
     ETitSubfamilia: TLFEdit;
     LSubfamilia: TLFLabel;
     LblSubTipoArticulo: TLFLabel;
     Z_DescSubTipoArt: TLFHYDBDescription;
     Z_DBEFSubTipoArt: TLFDBEditFind2000;
     BCargarImagen: TButton;
     ETituloGaleria: TLFEdit;
     DBEFGaleria: TLFDBEditFind2000;
     LGaleria: TLFLabel;
     SBAGaleria: TSpeedButton;
     AGaleria: TAction;
     TSSimilares: TTabSheet;
     TBSimilares: TLFToolBar;
     PNLSimilares: TLFPanel;
     DBETitulosSimilares: TLFDbedit;
     DBEArticulosSimilares: TLFDbedit;
     NavSimilares: THYMNavigator;
     DBGArticulosSimilares: TDBGridFind2000;
     CESimilares: TControlEdit;
     CESimilaresPMEdit: TPopUpTeclas;
     MenuItem21: TMenuItem;
     MenuItem22: TMenuItem;
     MenuItem23: TMenuItem;
     MenuItem24: TMenuItem;
     MenuItem25: TMenuItem;
     MenuItem26: TMenuItem;
     MenuItem27: TMenuItem;
     MenuItem28: TMenuItem;
     MenuItem29: TMenuItem;
     MenuItem30: TMenuItem;
     TButtDocumentos: TToolButton;
     ADocumentos: TAction;
     TSClientes: TTabSheet;
     PNLCodCli: TLFPanel;
     TBCodCli: TLFToolBar;
     PNLTBCodCli: TLFPanel;
     DBEArticuloCodCli: TLFDbedit;
     DBETituloArticuloCodCli: TLFDbedit;
     DBGCodCli: TDBGridFind2000;
     PNLNavCodCli: TLFPanel;
     NavCodCli: THYMNavigator;
     CEClientes: TControlEdit;
     CEClientesPMEdit: TPopUpTeclas;
     CECombincaciones: TControlEdit;
     CECombincacionesPMEdit: TPopUpTeclas;
     CBExportar: TLFDBCheckBox;
     LLargoTipoComponente: TLFLabel;
     DBELargoTipoComponente: TLFDbedit;
     TButtBuscaPorCodCli: TToolButton;
     ABuscaPorCodCli: TAction;
     TButtFiltraEscandallosProd: TToolButton;
     AFiltraEscandallosProd: TAction;
     LPCostePrecios: TLFLabel;
     DBEPCostePrecios: TLFDbedit;
     LCosteAdicionalPrecio: TLFLabel;
     DBECosteAdicionalPrecio: TLFDbedit;
     LCosteMasCAdicional: TLFLabel;
     DBEPCosteMasAdicional: TLFDbedit;
     LCosteAdicional: TLFLabel;
     DBECosteAdicional: TLFDbedit;
     TSStockNroSerie: TTabSheet;
     TBStockSerie: TLFToolBar;
     NavStockSerie: THYMNavigator;
     DBStockSerie: THYTDBGrid;
     TSMovimientosStock: TTabSheet;
     DBGStockMovimientos: THYTDBGrid;
     TBStockMovimientos: TLFToolBar;
     NavStockMovimientos: THYMNavigator;
     TSStockFuturo: TTabSheet;
     TBStockFuturo: TLFToolBar;
     NavStockFuturo: THYMNavigator;
     DBGStockFuturo: THYTDBGrid;
     CBSepararAlmacenes: TLFCheckBox;
     TSep6: TToolButton;
     TSEquivalencias: TTabSheet;
     TBEquivalencias: TLFToolBar;
     PNLEquivalencias: TLFPanel;
     DBETituloArticuloEquivalencias: TLFDbedit;
     DBEArticuloEquivalencias: TLFDbedit;
     NavEquivalencias: THYMNavigator;
     DBGFEquivalenciasCab: TDBGridFind2000;
     DBGFEquivalenciasDet: TDBGridFind2000;
     LFCategoryAction7: TLFCategoryAction;
     LFCategoryAction8: TLFCategoryAction;
     ANoCalcularStock: TAction;
     LColorLanzada: TLFLabel;
     LColorCerradaParcialmente: TLFLabel;
     LColorReservada: TLFLabel;
     LFCategoryAction9: TLFCategoryAction;
     LFCategoryAction10: TLFCategoryAction;
     ANoCalcularTarifa: TAction;
     LFCategoryAction11: TLFCategoryAction;
     DBGStocksAlmacen: TDBGridFind2000;
     DBGStocks: TDBGridFind2000;
     Z_DBChkBQuitarSiManual: TLFDBCheckBox;
     LblColorHilo: TLFLabel;
     DBEFColorHilo: TLFDBEditFind2000;
     TButtSep3: TToolButton;
     TButtInfoStock: TToolButton;
     TSCondiciones: TTabSheet;
     TBCondiciones: TLFToolBar;
     PNLCondiciones: TLFPanel;
     DBETituloCondiciones: TLFDbedit;
     DBEArticuloCondiciones: TLFDbedit;
     NavCondiciones: THYMNavigator;
     DBGCondiciones: THYTDBGrid;
     AModelo: TAction;
     B1: TToolButton;
     TButtRecalculaStockNroSerie: TToolButton;
     BCrearCodigoBarra: TSpeedButton;
     PNLFiltroArticulo: TLFPanel;
     LFiltroArticulo: TLFLabel;
     LFiltroCodigoBarra: TLFLabel;
     DBEADRBulto: TLFDbedit;
     LADRBulto: TLFLabel;
     LTipoMaterial: TLFLabel;
     DBEFTipoArticulo: TLFDBEditFind2000;
     ETitTipoArticulo: TLFEdit;
     DBEMotivoBloqueoCompras: TLFDbedit;
     LBloqueoCompras: TLFLabel;
     DBCBBloqueoCompras: TLFDBComboBoxValue;
     LBloqueoVentas: TLFLabel;
     DBEMotivoBloqueoVentas: TLFDbedit;
     DBCBBloqueoVentas: TLFDBComboBoxValue;
     LMotivoBloqueoCompra: TLFLabel;
     LMotivoBloqueoVenta: TLFLabel;
     LMotivoBaja: TLFLabel;
     PNLStockMovimientosPMP: TLFPanel;
     CBCalcularPMPMovimientos: TLFCheckBox;
     AFiltraEscandalloProdComponente: TAction;
     TButtFiltraEscandallosProdComponente: TToolButton;
     LTipoRegistroFitosanitario: TLFLabel;
     DBCBTipoRegistroFitosanitario: TLFDBComboBoxValue;
     DBCPreparable: TLFDBCheckBox;
     LLitrosPorUnidad: TLFLabel;
     DBEListrosPorUnidad: TLFDbedit;
     LTipoIBAE: TLFLabel;
     DBEFTipoIBAE: TLFDBEditFind2000;
     ETipoIBAE: TLFEdit;
     BClipboard: TButton;
     LRibeteDefecto: TLFLabel;
     DBEFRibeteDefecto: TLFDBEditFind2000;
     LFHYDBDRibeteDefecto: TLFHYDBDescription;
     LColorLona: TLFLabel;
     DBEFLonaColor1: TLFDBEditFind2000;
     DBEFLonaColor2: TLFDBEditFind2000;
     DBEFLonaColor3: TLFDBEditFind2000;
     LMarca: TLFLabel;
     EMarca: TLFEdit;
     DBEFIdMarca: TLFDBEditFind2000;
     LFormulaDefecto: TLFLabel;
     DBEFFormulaDefecto: TLFDBEditFind2000;
     EFormulaDefecto: TLFEdit;
     LTipoImpuestoAdicional: TLFLabel;
     DBEFTipoImpuestoAdicional: TLFDBEditFind2000;
     ETipoImpuestoAdicional: TLFEdit;
     TSCombinaciones: TTabSheet;
     TBCombinaciones: TLFToolBar;
     PNLCombinaciones: TLFPanel;
     DBECombinacionesTitulo: TLFDbedit;
     DBECombinacionesArticulo: TLFDbedit;
     NavCombinaciones: THYMNavigator;
     PNLCombinacionesDetalle: TLFPanel;
     PNLCombinacionesCreacion: TLFPanel;
     DBGCombinaciones: TDBGridFind2000;
     CBMarca: TLFComboBox;
     CBModelo: TLFComboBox;
     CBEspecificacion: TLFComboBox;
     CBBombin: TLFComboBox;
     CBLlave: TLFComboBox;
     BCrearCombinacion: TButton;
     SBAImagen: TSpeedButton;
     DBCBGenerarPedidoSiempre: TLFDBCheckBox;
     CBTipoVehiculo: TLFComboBox;
     TSECommerce: TTabSheet;
     PNLECImagenPrestashop: TLFPanel;
     PNLDatosArticuloPrestashop: TLFPanel;
     PNLSincronizacionPrestashop: TLFPanel;
     ImagenECPrestashop: TImage;
     DBImagenECPrestashop: TLFDBEditFind2000;
     ETituloImagenECPrestashop: TLFEdit;
     BECCargarImagenPrestashop: TButton;
     BECClipboardPrestashop: TButton;
     TBArticuloTiendaEC: TLFToolBar;
     DBArticuloTituloEC: TLFDbedit;
     DBArticuloEC: TLFDbedit;
     TBSep2: TToolButton;
     NavArticuloTiendaEC: THYMNavigator;
     LTituloECPrestashop: TLFLabel;
     LReferenciaECPrestashop: TLFLabel;
     LDescripcionCortaPrestashop: TLFLabel;
     LDescripcionLargaPrestashop: TLFLabel;
     LPrecioECPrestashop: TLFLabel;
     LStockECPrestashop: TLFLabel;
     DBETituloECPrestashop: TLFDbedit;
     DBEReferenciaECPrestashop: TLFDbedit;
     DBEPrecioECPrestashop: TLFDbedit;
     DBEStockECPrestashop: TLFDbedit;
     DBMDescripcionLargaPrestashop: TLFDBMemo;
     DBMDescripcionCortaPrestashop: TLFDBMemo;
     DBEIDProductoPrestashop: TLFDbedit;
     DBEIDAtributoPrestashop: TLFDbedit;
     LIDProductoPrestashop: TLFLabel;
     LIDCombinacionPrestashop: TLFLabel;
     LIDAtributoPrestashop: TLFLabel;
     LUltSincronizacionPrestashop: TLFLabel;
     DBDUltSincronizacionPrestashop: TLFDBDateEdit;
     CEECommercePMEdit: TPopUpTeclas;
     CECommerce: TControlEdit;
     BtnSubirPrestashop: TButton;
     BtnBajarPrestashop: TButton;
     TBSep3: TToolButton;
     PNLECommerceArticulo: TLFPanel;
     PNLTiendaPrestashop: TLFPanel;
     DBETiendaPrestashop: TLFDbedit;
     DBETituloTiendaPrestashop: TLFDbedit;
     TBSep4: TToolButton;
     PNLFijarTiendaPrestashop: TLFPanel;
     LFijarTiendaPrestashop: TLFLabel;
     EFFijarTiendaPrestashop: TLFEditFind2000;
     TBArticuloEC: TLFToolBar;
     NavArticuloEC: THYMNavigator;
     CEArticuloPrestashopCE: TControlEdit;
     CEArticuloCEPMEdit: TPopUpTeclas;
     TBArticuloWoocommerce: TLFToolBar;
     PNLECImagenWoocommerce: TLFPanel;
     PNLDatosArticuloWoocommerce: TLFPanel;
     PnlSincronizacionWoocommerce: TLFPanel;
     DBArticuloWC: TLFDbedit;
     TSep4: TToolButton;
     NavTiendaWC: THYMNavigator;
     TSep2: TToolButton;
     DBArticuloTituloWC: TLFDbedit;
     DBTiendaWC: TLFDbedit;
     DBTiendaTituloWC: TLFDbedit;
     DBImagenWC: TLFDBEditFind2000;
     ETituloImagenWC: TLFEdit;
     BCargarImagenWC: TButton;
     BClipboardWC: TButton;
     ImagenECWoocommerce: TImage;
     TBArticuloWC: TLFToolBar;
     DBETituloWC: TLFDbedit;
     DBEReferenciaWC: TLFDbedit;
     DBEPrecioWC: TLFDbedit;
     DBEStockWC: TLFDbedit;
     DBMDescripcionCortaWC: TLFDBMemo;
     DBMDescripcionLargaWC: TLFDBMemo;
     LTituloWC: TLFLabel;
     LReferenciaWC: TLFLabel;
     LDescripcionCortaWC: TLFLabel;
     LDescripcionLargaWC: TLFLabel;
     LPrecioWC: TLFLabel;
     LStockWC: TLFLabel;
     DBEIDCombinacionPrestashop: TLFDbedit;
     LIDProductoWC: TLFLabel;
     LUltSincronizacionWC: TLFLabel;
     DBEIDProductoWC: TLFDbedit;
     LFDBDateEdit1: TLFDBDateEdit;
     BtnSubirWC: TButton;
     BtnBajarWC: TButton;
     NavArticuloWC: THYMNavigator;
     CEArticuloWC: TControlEdit;
     CEArticuloWCPMEdit: TPopUpTeclas;
     CEWoocommerce: TControlEdit;
     CEWoocommercePMEdit: TPopUpTeclas;
     PCECommerce: TLFPageControl;
     TSECPrestashop: TTabSheet;
     TSECWoocommerce: TTabSheet;
     PNLWoocommerceArticulo: TLFPanel;
     PNLTiendaWoocommerce: TLFPanel;
     PNLImagenPrestashop: TLFPanel;
     PNLImagenWoocommerce: TLFPanel;
     BCrearCodigoBarraEAN13: TSpeedButton;
     DBEFSeccion: TLFDBEditFind2000;
     LSeccion: TLFLabel;
     LFactorUnidad: TLFLabel;
     DBEFactorUnidad: TLFDbedit;
     ETituloSeccion: TLFEdit;
     LPesoFactor: TDBText;
     LDiametroFactor: TDBText;
     LVolumenFactor: TDBText;
     DBCBNoAplicaDescLineaCliente: TLFDBCheckBox;
     TSAvisos: TTabSheet;
     TBAvisos: TLFToolBar;
     PNLArticuloAvisos: TLFPanel;
     DBEAvisosArticulo: TLFDbedit;
     DBEAvisosTitulo: TLFDbedit;
     NavAvisos: THYMNavigator;
     CEAvisos: TControlEdit;
     CEAvisosPMEdit: TPopUpTeclas;
     CEBultos: TControlEdit;
     CEBultosPMEdit: TPopUpTeclas;
     PNLAvisos: TLFPanel;
     DBCBAvisoActivoOFC: TLFDBCheckBox;
     DBMAvisoOFC: TLFDBMemo;
     DBCBAvisoActivoPEC: TLFDBCheckBox;
     DBMAvisoPEC: TLFDBMemo;
     DBCBAvisoActivoALB: TLFDBCheckBox;
     DBMAvisoALB: TLFDBMemo;
     DBCBAvisoActivoFAC: TLFDBCheckBox;
     DBMAvisoFAC: TLFDBMemo;
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
     DBEIdVariation: TLFDbedit;
     LFLabel1: TLFLabel;
     TBCodicionesProv: TLFToolBar;
     PNLCondicionesProv: TLFPanel;
     DBEArticuloCondicionesProv: TLFDbedit;
     DBETituloCondicionesProv: TLFDbedit;
     LAncho: TLFLabel;
     DBEAncho: TLFDbedit;
     LAlto: TLFLabel;
     DBEAlto: TLFDbedit;
     LFondo: TLFLabel;
     DBEFondo: TLFDbedit;
     TBCopiaAModelo: TToolButton;
     EFCliente: TLFEditFind2000;
     LFiltroCliente: TLFLabel;
     AFiltraAgrupacion: TAction;
     EFProveedor: TLFEditFind2000;
     LFiltroProveedor: TLFLabel;
     LFiltraRefCliente: TLabel;
     LFiltraRefProveedor: TLabel;
     ERefProveedor: TLFEdit;
     ERefCliente: TLFEdit;
     SBArticulo: TSpeedButton;
     EFFiltroFamilia: TLFEditFind2000;
     LFamilia: TLFLabel;
     EFiltroTitulo: TLFEdit;
     DBEFechaAlta: TLFDbedit;
     LFCategoryAction12: TLFCategoryAction;
     LFCategoryAction13: TLFCategoryAction;
     ANoCalcularLanzads: TAction;
     TMRFiltro: TTimer;
     EFiltroAgrupacion: TLFEdit;
     LTasaDestruccion: TLFLabel;
     DBETasaDestruccion: TLFDbedit;
     LImporteIEPNR: TLFLabel;
     DBEImporteIEPNR: TLFDbedit;
     LKgPlasticoVirgen: TLFLabel;
     DBEKgPlasticoVirgen: TLFDbedit;
     LPastadaCantEtiquetas: TLFLabel;
     LPastadas: TLFLabel;
     DBEPastadas: TLFDbedit;
     DBEPastadaCantEtiquetas: TLFDbedit;
     TSBultos: TTabSheet;
     TBBultos: TLFToolBar;
     PNLArticuloBultos: TLFPanel;
     DBETituloArticuloBultos: TLFDbedit;
     DBEArticuloBultos: TLFDbedit;
     NavBultos: THYMNavigator;
     DBGBultos: TDBGridFind2000;
     LEcotasa: TLFLabel;
     DBEEcotasa: TLFDbedit;
     DBCBInfluyeMargen: TLFDBCheckBox;
     LFechaUltimaFacturaVenta: TLFLabel;
     DBEFechaUltimaFacturaVenta: TLFDbedit;
     LFechaUltimoAlbaranVenta: TLFLabel;
     DBEFechaUltimoAlbaranVenta: TLFDbedit;
     LFechaUltimaFacturaCompra: TLFLabel;
     DBEFechaUltimaFacturaCompra: TLFDbedit;
     LFechaUltimoAlbaranCompra: TLFLabel;
     DBEFechaUltimoAlbaranCompra: TLFDbedit;
     tmrStockFuturo: TTimer;
     LPareto: TLFLabel;
     LEstrategiaCompra: TLFLabel;
     DBEFEstrategiaCompra: TLFDBEditFind2000;
     EEstrategiaCompra: TLFEdit;
     DBEPareto: TLFDbedit;
     LIEPNRClaveProducto: TLFLabel;
     DBEFIEPNRClaveProducto: TLFDBEditFind2000;
     EIEPNRClaveProducto: TLFEdit;
     LIENPRKilogramos: TLFLabel;
     DBEIENPRKilogramos: TLFDbedit;
     LIENPRKilogramosNoReciclados: TLFLabel;
     DBEIENPRKilogramosNoReciclados: TLFDbedit;
     DBCBRequiereLoteSimple: TLFDBCheckBox;
     LPrecioReposicion: TLFLabel;
     DBEPrecioReposicion: TLFDbedit;
     LGama: TLFLabel;
     DBEFGama: TLFDBEditFind2000;
     LPrecioBaseReposicion: TLFLabel;
     DBEPrecioBaseReposicion: TLFDbedit;
     PNLWooCommerceTop: TLFPanel;
     PNLWooCommerceBottom: TLFPanel;
     PNLWooCommerceMiddle: TLFPanel;
     PNLWooCommerceDescCorta: TLFPanel;
     PNLWooComerceDescLarga: TLFPanel;
     PNLPrestashopTop: TLFPanel;
     PNLPrestashopBottom: TLFPanel;
     PNLPrestashopMiddle: TLFPanel;
     PNLPrestashopDescCorta: TLFPanel;
     PNLPrestashopDescLarga: TLFPanel;
     TSTarfiasProveedor: TTabSheet;
     PNLTarifasProveedor: TLFPanel;
     TBTarfiasProveedor: TLFToolBar;
     PNLTarifasProveedorArt: TLFPanel;
     DBETarifasProveedorArticulo: TLFDbedit;
     DBETarifasProveedorTituloArt: TLFDbedit;
     DBGTarifasProveedor: TDBGridFind2000;
     PNLImagenes: TLFPanel;
     PNLPictogramas: TLFPanel;
     Splitter1: TSplitter;
     TBPictogramas: TLFToolBar;
     NavPictogramas: THYMNavigator;
     PNLEdicitPictogramas: TLFPanel;
     PNLImagenesPictogramas: TLFPanel;
     ImgPictograma: TImage;
     DBGPictograma: TDBGridFind2000;
     LBlister: TLFLabel;
     DBEFBlister: TLFDBEditFind2000;
     EBlister: TLFEdit;
     AFiltraEscandalloProdSimpComponente: TAction;
     LProyecto: TLFLabel;
     DBEFProyectoArt: TLFDBEditFind2000;
     EProyecto: TLFEdit;
     PNLBlister: TLFPanel;
     LBlisterPrecio: TLFLabel;
     EBlisterPrecio: TLFEdit;
     ETituloBlisterPrecio: TLFEdit;
     EPrecioBlisterPrecio: TLFEdit;
     TSLogistica: TTabSheet;
     TBLogistica: TLFToolBar;
     PNLLogisticaArticulo: TLFPanel;
     DBELogisticatitulo: TLFDbedit;
     DBELogisticaArticulo: TLFDbedit;
     NavLogistica: THYMNavigator;
     PNLLogistica: TLFPanel;
     LEnvase: TLFLabel;
     LCaja: TLFLabel;
     LPalet: TLFLabel;
     LEnvaseEAN13: TLFLabel;
     DBEEnvaseEAN13: TLFDbedit;
     DBEEnvasePesoGr: TLFDbedit;
     LEnvasePesoGr: TLFLabel;
     LEnvaseFondoCM: TLFLabel;
     DBEEnvaseFondoCm: TLFDbedit;
     LEnvaseAnchoCM: TLFLabel;
     DBEEnvaseAnchoCm: TLFDbedit;
     LEnvaseAltoCM: TLFLabel;
     DBEEnvaseAltoCm: TLFDbedit;
     LFLabel2: TLFLabel;
     DBECajaDUN14: TLFDbedit;
     DBECajaPesoGr: TLFDbedit;
     LCajaPesoGr: TLFLabel;
     LCajaFondoCm: TLFLabel;
     DBECajaFondoCm: TLFDbedit;
     LCajaAnchoCm: TLFLabel;
     DBECajaAnchoCm: TLFDbedit;
     LCajaAltoCm: TLFLabel;
     DBECajaAltoCm: TLFDbedit;
     LCajaUnidades: TLFLabel;
     DBECajaUnidades: TLFDbedit;
     LPaletPesoKg: TLFLabel;
     DBEPaletPesoKg: TLFDbedit;
     LPaletCajas: TLFLabel;
     DBEPaletCajas: TLFDbedit;
     LPaletCapas: TLFLabel;
     DBEPaletCapas: TLFDbedit;
     LPaletAltoM: TLFLabel;
     DBEPaletAltoM: TLFDbedit;
     BLogisticaAsignarEAN13: TButton;
     BLogisticaAsignarDUN14: TButton;
     BLogisticaAsignarMedidas: TButton;
     TBSepEginer: TToolButton;
     PNLEginer: TLFPanel;
     BCopiarEnlace: TButton;
     BCopiarImagen: TButton;
     TBSep5: TToolButton;
     TBCopiarImagenPortapapeles: TToolButton;
     TSCaracteristicas: TTabSheet;
     TBCaracteristicas: TLFToolBar;
     PNLArticuloCaracteristicas: TLFPanel;
     DBETituloArticuloCaracteristica: TLFDbedit;
     DBEArticuloCaracteristica: TLFDbedit;
     NavCaracteristicas: THYMNavigator;
     DBGCaracteristicas: TDBGridFind2000;
     CECaracteristicas: TControlEdit;
     CECaracteristicasPMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSHistCostShow(Sender: TObject);
     procedure TSStocksShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSPreciosShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSProveedoresShow(Sender: TObject);
     procedure NavProvClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBCB_Prov_ActivoExit(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TBFabricarClick(Sender: TObject);
     procedure TSFabricacionShow(Sender: TObject);
     procedure DBEFFamiliaBusqueda(Sender: TObject);
     procedure SBDesfabricacionClick(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure TSCodBarraShow(Sender: TObject);
     procedure DBECodBarrasChange(Sender: TObject);
     procedure MILstMovArtClick(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure TSTablaShow(Sender: TObject);
     procedure TSPedidosProvShow(Sender: TObject);
     procedure TSCodigoProvShow(Sender: TObject);
     procedure EDFabricarChange(Sender: TObject);
     procedure DBCGProveedoresEnter(Sender: TObject);
     procedure DBCGPreciosEnter(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure TSCuentasShow(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TButtRefrescarTablaClick(Sender: TObject);
     procedure CBConfigCBarrasClick(Sender: TObject);
     procedure TSAgrupacionShow(Sender: TObject);
     procedure DBCGDisponiblesDblClick(Sender: TObject);
     procedure DBCGPerteneceDblClick(Sender: TObject);
     procedure NavPreciosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBGTarifasPreciosColEnter(Sender: TObject);
     procedure DBGTarifasPreciosCellClick(Column: TColumn);
     procedure DBGTarifasPreciosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEControlaUnidadesChange(Sender: TObject);
     procedure DBGFCodBarraColEnter(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure TSImagenesShow(Sender: TObject);
     procedure AAjustaConFamiliaExecute(Sender: TObject);
     procedure AAjustarCuentasExecute(Sender: TObject);
     procedure AEscandalloExecute(Sender: TObject);
     procedure AVentasArtExecute(Sender: TObject);
     procedure ACodigosBarrasExecute(Sender: TObject);
     procedure AControlLotesExecute(Sender: TObject);
     procedure AClientesArticuloExecute(Sender: TObject);
     procedure AProveedoresArticuloExecute(Sender: TObject);
     procedure ALstArticulosExecute(Sender: TObject);
     procedure ALstMovArtExecute(Sender: TObject);
     procedure ALstMovsResumidoExecute(Sender: TObject);
     procedure AConfListArtExecute(Sender: TObject);
     procedure AConfListMovArtExecute(Sender: TObject);
     procedure AConfLstMovResumidoExecute(Sender: TObject);
     procedure AConfCodBarrasExecute(Sender: TObject);
     procedure AListCodBarrasExecute(Sender: TObject);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure AHistPreciosExecute(Sender: TObject);
     procedure ACalculaStockMinMaxExecute(Sender: TObject);
     procedure ARecalculaExecute(Sender: TObject);
     procedure AMargenExecute(Sender: TObject);
     procedure AGenerarCodBarrasExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure ALstAgrupacionArtExecute(Sender: TObject);
     procedure DBEFFamiliaChange(Sender: TObject);
     procedure AStockTyCExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AVerArtSistemaExecute(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ARecalcularStocksExecute(Sender: TObject);
     procedure ARecalcularStocksTotalesExecute(Sender: TObject);
     procedure NavSeriesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFIdiomasBusqueda(Sender: TObject);
     procedure TSIdiomaShow(Sender: TObject);
     procedure AUbicacionArticuloExecute(Sender: TObject);
     procedure DBCHKBUd_SecundariaChange(Sender: TObject);
     procedure DBGFIdiomasColEnter(Sender: TObject);
     procedure DBCHKAnticipoContadoChange(Sender: TObject);
     procedure DBCHKAnticipoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AListadodeEtiquetasdeArticulosExecute(Sender: TObject);
     procedure ABuscaPorCodCliExecute(Sender: TObject);
     procedure ABuscaPorCodProvExecute(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure HYDBGPedidosDeClienteDblClick(Sender: TObject);
     procedure HYDBGPedidosAProveedorDblClick(Sender: TObject);
     procedure HYDBGPropuestasDblClick(Sender: TObject);
     procedure HYDBGPropuestasConfirDblClick(Sender: TObject);
     procedure ACambiarCodigoExecute(Sender: TObject);
     procedure TSPedidosShow(Sender: TObject);
     procedure TSPropuestasShow(Sender: TObject);
     procedure EFBarrasChange(Sender: TObject);
     procedure Z_DBEFTipoArtChange(Sender: TObject);
     procedure Z_DBEFSalidaBusqueda(Sender: TObject);
     procedure Z_DBEFLineaBusqueda(Sender: TObject);
     procedure Z_DBEFFormaLonaChange(Sender: TObject);
     procedure Z_DBEFTipoLonaChange(Sender: TObject);
     procedure ZADatosToldoExecute(Sender: TObject);
     procedure PCCuentasChange(Sender: TObject);
     procedure DBEFProyectoBusqueda(Sender: TObject);
     procedure DBEFProyectoSeriesBusqueda(Sender: TObject);
     procedure AHistoricoSerializacionExecute(Sender: TObject);
     procedure EFontSizeNotasChange(Sender: TObject);
     procedure DBRENotasComprasEnter(Sender: TObject);
     procedure ADuplicaArticuloKriExecute(Sender: TObject);
     procedure DBRENotasVentasSelectionChange(Sender: TObject);
     procedure CBFontNameChange(Sender: TObject);
     procedure DBREIdiomaSelectionChange(Sender: TObject);
     procedure TSStocksUbicacionesShow(Sender: TObject);
     procedure TSStocksLoteShow(Sender: TObject);
     procedure TSStockNroSerieKRIShow(Sender: TObject);
     procedure EditFind20001Change(Sender: TObject);
     procedure AAdjuntosArticuloExecute(Sender: TObject);
     procedure TSUnidadesLogisitcasShow(Sender: TObject);
     procedure PCStocksChanging(Sender: TObject; var AllowChange: boolean);
     procedure cbSoloUbicacionConStockChange(Sender: TObject);
     procedure ARecalculaStockUbicacionesExecute(Sender: TObject);
     procedure AIniciaRecalculoExecute(Sender: TObject);
     procedure AParaRecalculoExecute(Sender: TObject);
     procedure AFichaTecExecute(Sender: TObject);
     procedure DBExCodStkChange(Sender: TObject);
     procedure DBCHKBajaChange(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure ALstArticuloProvExecute(Sender: TObject);
     procedure AConfLstArticulosProvExecute(Sender: TObject);
     procedure Z_DBColorChange(Sender: TObject);
     procedure DBEFSubfamiliaBusqueda(Sender: TObject);
     procedure DBEFComprasChange(Sender: TObject);
     procedure DBEFVentasChange(Sender: TObject);
     procedure DBEFCtaComprasChange(Sender: TObject);
     procedure DBEFCtaVentasChange(Sender: TObject);
     procedure DBEFCtaCompProyChange(Sender: TObject);
     procedure DBEFCtaVentProyChange(Sender: TObject);
     procedure DBEFCtaCompProySerChange(Sender: TObject);
     procedure DBEFCtaVentProySerChange(Sender: TObject);
     procedure DBEFDevComprasChange(Sender: TObject);
     procedure DBEFDevVentasChange(Sender: TObject);
     procedure DBEFAbonoComprasChange(Sender: TObject);
     procedure DBEFAbonoVentasChange(Sender: TObject);
     procedure DBEFCtaDevComprasChange(Sender: TObject);
     procedure DBEFCtaDevVentasChange(Sender: TObject);
     procedure DBEFCtaAbonoComprasChange(Sender: TObject);
     procedure DBEFCtaAbonoVentasChange(Sender: TObject);
     procedure DBEFCtaAbCompProyChange(Sender: TObject);
     procedure DBEFCtaAbVentProyChange(Sender: TObject);
     procedure DBEFCtaDevCompProyChange(Sender: TObject);
     procedure DBEFCtaDevVentProyChange(Sender: TObject);
     procedure DBEFCtaDevCompProySerChange(Sender: TObject);
     procedure DBEFCtaDevVentProySerChange(Sender: TObject);
     procedure DBEFCtaAbCompProySerChange(Sender: TObject);
     procedure DBEFCtaAbVentProySerChange(Sender: TObject);
     procedure ETitFamiliaChange(Sender: TObject);
     procedure DBEFabricanteChange(Sender: TObject);
     procedure DBEFSubfamiliaChange(Sender: TObject);
     procedure Z_DBEFSubTipoArtBusqueda(Sender: TObject);
     procedure Z_DBEFSubTipoArtChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavImagenesClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFGaleriaChange(Sender: TObject);
     procedure SBAGaleriaDblClick(Sender: TObject);
     procedure AGaleriaExecute(Sender: TObject);
     procedure ETituloGaleriaDblClick(Sender: TObject);
     procedure TSSimilaresShow(Sender: TObject);
     procedure DBGArticulosSimilaresBusqueda(Sender: TObject);
     procedure ADocumentosExecute(Sender: TObject);
     procedure TSClientesShow(Sender: TObject);
     procedure AFiltraEscandallosProdExecute(Sender: TObject);
     procedure TSStockNroSerieShow(Sender: TObject);
     procedure TSMovimientosStockShow(Sender: TObject);
     procedure DBGStockMovimientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGStockMovimientosDblClick(Sender: TObject);
     procedure DBGStockMovimientosCellClick(Column: TColumn);
     procedure DBStockLoteCellClick(Column: TColumn);
     procedure DBStockLoteDblClick(Sender: TObject);
     procedure DBEFSerieProySerChange(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure DBEFProyectoSeriesChange(Sender: TObject);
     procedure DBEFProyectoChange(Sender: TObject);
     procedure TSStockFuturoShow(Sender: TObject);
     procedure DBGStockFuturoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGStockFuturoCellClick(Column: TColumn);
     procedure DBGStockFuturoDblClick(Sender: TObject);
     procedure CBSepararAlmacenesClick(Sender: TObject);
     procedure TSEquivalenciasShow(Sender: TObject);
     procedure DBGFEquivalenciasCabDblClick(Sender: TObject);
     procedure AStockAlmacenExecute(Sender: TObject);
     procedure ALanzadaAlmacenExecute(Sender: TObject);
     procedure APrecioTarifaExecute(Sender: TObject);
     procedure DBGStocksDblClick(Sender: TObject);
     procedure DBGStocksDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBETituloEnter(Sender: TObject);
     procedure CalcularPedidos(Sender: TObject);
     procedure CalcularPropuesta(Sender: TObject);
     procedure DBGCondicionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TSCondicionesShow(Sender: TObject);
     procedure AModeloExecute(Sender: TObject);
     procedure TButtRecalculaStockNroSerieClick(Sender: TObject);
     procedure BCrearCodigoBarraClick(Sender: TObject);
     procedure DBStockSerieDblClick(Sender: TObject);
     procedure DBStockSerieDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEFTipoArticuloChange(Sender: TObject);
     procedure CBCalcularPMPMovimientosChange(Sender: TObject);
     procedure AFiltraEscandalloProdComponenteExecute(Sender: TObject);
     procedure NavStocksBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavStocksClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBCBControlStockChange(Sender: TObject);
     procedure DBEFTipoIBAEBusqueda(Sender: TObject);
     procedure DBEFTipoIBAEChange(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBEFRibeteDefectoChange(Sender: TObject);
     procedure DBEFIdMarcaChange(Sender: TObject);
     procedure DBEFFormulaDefectoChange(Sender: TObject);
     procedure DBEFTipoImpuestoAdicionalChange(Sender: TObject);
     procedure TSCombinacionesShow(Sender: TObject);
     procedure BCrearCombinacionClick(Sender: TObject);
     procedure DBGCombinacionesDblClick(Sender: TObject);
     procedure CBMarcaChange(Sender: TObject);
     procedure CBModeloChange(Sender: TObject);
     procedure SBAImagenDblClick(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure TButtRecalcularStockClick(Sender: TObject);
     procedure BECCargarImagenPrestashopClick(Sender: TObject);
     procedure BECClipboardPrestashopClick(Sender: TObject);
     procedure DBImagenECPrestashopChange(Sender: TObject);
     procedure TSECommerceShow(Sender: TObject);
     procedure EFFijarTiendaPrestashopChange(Sender: TObject);
     procedure BtnSubirPrestashopClick(Sender: TObject);
     procedure DBGStockUbicacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure BtnSubirWCClick(Sender: TObject);
     procedure DBImagenWCChange(Sender: TObject);
     procedure BCrearCodigoBarraEAN13Click(Sender: TObject);
     procedure DBEFSeccionChange(Sender: TObject);
     procedure PNLAvisosResize(Sender: TObject);
     procedure TSAvisosShow(Sender: TObject);
     procedure DBGCondicionesDblClick(Sender: TObject);
     procedure TBCopiaAModeloClick(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure AFiltraAgrupacionExecute(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure ERefProveedorKeyPress(Sender: TObject; var Key: char);
     procedure ERefClienteKeyPress(Sender: TObject; var Key: char);
     procedure SBArticuloDblClick(Sender: TObject);
     procedure EFFiltroFamiliaChange(Sender: TObject);
     procedure EFiltroTituloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure HYDBGPedidosDeClienteTitleClick(Column: TColumn);
     procedure HYDBGPedidosAProveedorTitleClick(Column: TColumn);
     procedure HYDBGPropuestasTitleClick(Column: TColumn);
     procedure HYDBGPropuestasConfirTitleClick(Column: TColumn);
     procedure TMRFiltroTimer(Sender: TObject);
     procedure EFiltroAgrupacionChange(Sender: TObject);
     procedure TSBultosShow(Sender: TObject);
     procedure HYDBGPedidosDeClienteDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure HYDBGPedidosAProveedorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGCondicionesProvDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure tmrStockFuturoTimer(Sender: TObject);
     procedure DBEFEstrategiaCompraChange(Sender: TObject);
     procedure DBEFIEPNRClaveProductoChange(Sender: TObject);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EFArticuloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure TSAgrupacionResize(Sender: TObject);
     procedure TSProveedoresResize(Sender: TObject);
     procedure TSFabricacionResize(Sender: TObject);
     procedure PNLWooCommerceMiddleResize(Sender: TObject);
     procedure PNLPrestashopMiddleResize(Sender: TObject);
     procedure DBGTarifasProveedorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGPictogramaRowChange(Sender: TObject);
     procedure DBEArtImagenChange(Sender: TObject);
     procedure NavPictogramasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFBlisterBusqueda(Sender: TObject);
     procedure DBEFBlisterChange(Sender: TObject);
     procedure AFiltraEscandalloProdSimpComponenteExecute(Sender: TObject);
     procedure DBEFProyectoArtChange(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBEEnvaseEAN13Change(Sender: TObject);
     procedure DBECajaDUN14Change(Sender: TObject);
     procedure DBGFCodBarraDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TSLogisticaShow(Sender: TObject);
     procedure BLogisticaAsignarEAN13Click(Sender: TObject);
     procedure BLogisticaAsignarDUN14Click(Sender: TObject);
     procedure BLogisticaAsignarMedidasClick(Sender: TObject);
     procedure BCopiarEnlaceClick(Sender: TObject);
     procedure TBCopiarImagenPortapapelesClick(Sender: TObject);
     procedure TSCaracteristicasShow(Sender: TObject);
  private
     Primera: boolean;
     Sistema: boolean;
     FUpdating: boolean;
     FUpdatingStock: boolean;
     RichEditConFoco: TDBRichEdit;
     Param_MODSINC003: boolean;
     Param_MODSINC019: boolean;
     Param_MODSINC015: boolean;
     Param_MODSINC016: boolean;
     Param_MODREST006: boolean;
     Param_ARTBUSQ002: boolean;
     Param_ARTBUSQ004: boolean;
     Param_ARTINSE001: boolean;
     Param_MODREST015: boolean;
     UltimoArticuloTiendaVirtual: string;
     ColumnaMovimientos, ColumnaStockLote, ColumnaStockFuturo: TColumn;
     MoviendoArticulo: boolean;
     IdMovStock: integer;
     TabSheet: TTabSheet;
     OrdenPedidosCliente, OrdenPedidosProveedor: integer;
     OrdenPropuestas, OrdenPropuestasConfirmadas: integer;
     procedure Habilitar;
     procedure PintaCodigoBarras;
     procedure Reconectar_Tablas;
     procedure ActualizarConfigCBarras;
     procedure CambiaFamiliaSistema(Sistema: boolean);
     procedure DameCuentasVisibles(activo: boolean; color1, color2, color3, color4: TColor);
     procedure SetVisibleDefUdSec(Value: boolean);
     procedure GetFontNames;
     procedure ActualizaStockTiendaVirtual;
     procedure MuestraFiltrado(Modo: byte);
  public
     DM: TDMArticulos;
     SWFil, SWEnlace: integer;
     procedure InsertarArticulo(Proveedor: integer = 0; CodProv: string = ''; Descripcion: string = '');
     procedure FiltraArticulos(aFiltro: string);
     procedure RefrescaPestanyaActiva;
     procedure Z_SeleccionaPanelTipo; //SFG_JLA
     procedure RestauraTabSeet;
  end;

var
  FMArticulos : TFMArticulos;

implementation

uses UFormGest, UDMMain, UUtiles, UDameDato,
  UFPregFichasArticulos, UEntorno, UFMain,
  UDMRFichasArticulos, UFMListConfig,
  UFMImprimirCodBarras, UFPregArtCompleto, UDMLstArticulos,
  UFMHistoricoPrecios, UFMGenerarCBs, UFMControl_lotes, UFMVentasArt,
  UFVerTercerosPorArticulo, UFPregAgrupacionArt, UFMRecalculoStocks,
  UFMCodigoProveedor, UFMCodigoCliente, UFMCalculaStockMinMax, UFMStockTallas, UFPregEtiArticulosKri,
  UFMRecalculoStocksTotales, UFMUbicaArticulo, UFPregCodArticulo,
  UDMLstEtiquetas, UFMDocInfoStocks, UFMHistoricoSerializacion, UFMAdjunto, UDMPrestashop,
  ZUFMArtToldos, ZUFMArtLonas, ZUFMArtArmazones, UDMLstArticulosProv, UProFMFicherosCliente,
  UFMSeleccion, UParam, Clipbrd, UFMostrarImagen, UDMSincronizacionTienda, UDMSincronizacionTiendaWoocommerce,
  UFMCondicionesVenta, UFFiltra_Articulos_Agr, DateUtils,
  ShellApi, URecibeFicheros, UDMAdjunto, Math, UFMSeleccionArticulo, URellenaLista, UImagenes;

{$R *.DFM}

procedure TFMArticulos.FormCreate(Sender: TObject);
var
  Lista : TStrings;
  i : integer;
  NuevaAccion : TAction;
  Param_ARTPCOS001 : string;
  Param_ARTSTKD001 : string;
begin
  DragAcceptFiles(Self.Handle, True);
  DMMain.LogIni('FMArticulos.FormCreate');

  inherited;
  DMMain.Log('FMArticulos.FormCreate Fin inherited');

  DMMain.LogIni('FMArticulos.FormCreate AbreData(DMArticulos)');
  AbreData(TDMArticulos, DM);
  AssignDataSource(TDataModule(DM), Self);
  DM.FM := Self;
  TabSheet := nil;
  OrdenPedidosCliente := 0;
  OrdenPedidosProveedor := 0;
  OrdenPropuestas := 0;
  OrdenPropuestasConfirmadas := 0;

  DMMain.LogFin('');
  // Guardo este dato porque se utiliza mucho
  Param_MODSINC015 := (LeeParametro('MODSINC004') = 'S');
  if Param_MODSINC015 then
     AbreData(TDMPrestashop, DMPrestashop);
  Param_MODSINC016 := (LeeParametro('MODSINC016') = 'S');

  // Sincronizacion Prestashop
  Param_MODSINC003 := (LeeParametro('MODSINC003') = 'S');
  Param_MODSINC019 := (LeeParametro('MODSINC019') = 'S');

  // EFArticulo busca cuando se empieza a escribir
  Param_ARTBUSQ002 := (LeeParametro('ARTBUSQ002') = 'S');
  // Busqyeda especial de articulos
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004') = 'S');

  // Habilita rellenar codigo de articulo.
  Param_ARTINSE001 := (LeeParametro('ARTINSE001') = 'S');

  DBEArticulo.Enabled := Param_ARTINSE001;
  DBEArticulo.ReadOnly := not Param_ARTINSE001;

  NavMain.DataSource := DM.DSQMArticulos;
  EPMain.DataSource := DM.DSQMArticulos;
  DBGMain.DataSource := DM.DSQMArticulos;
  G2KTableLoc.DataSource := DM.DSQMArticulos;

  DBEFCompras.MaxLength := REntorno.DigitosSub;
  DBEFVentas.MaxLength := REntorno.DigitosSub;
  CEProveedoresPMEdit.Teclas := DMMain.Teclas;
  CEPreciosPMEdit.Teclas := DMMain.Teclas;
  CEStocksPMedit.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  Habilitar;
  DM.SWFil := 0;
  ActualizarConfigCBarras;  // Actualizar Flag de CBs
  EDMonedaEmpresa.Text := REntorno.MonedaEmpresa;
  EDMonedaCanal.Text := REntorno.Moneda;

  // Visibilidad de Preacio de Coste
  DBEPCoste.Visible := True;
  DBEPCoste.Enabled := True;
  ColorEdicion(DBEPCoste);

  Param_ARTPCOS001 := LeeParametro('ARTPCOS001');
  if (Param_ARTPCOS001 = 'I') then
     DBEPCoste.Visible := False
  else
  if (Param_ARTPCOS001 = 'D') then
  begin
     DBEPCoste.Enabled := False;
     ColorInfo(DBEPCoste);
  end;
  DBEPCoste.ReadOnly := not DBEPCoste.Enabled;

  LBLPCoste.Visible := DBEPCoste.Visible;
  EDMonedaEmpresa.Visible := DBEPCoste.Visible;
  LPCosteCanal.Visible := DBEPCoste.Visible;
  DBEPCosteCanal.Visible := DBEPCoste.Visible;
  EDMonedaCanal.Visible := DBEPCoste.Visible;

  DBCBControlStock.Enabled := (LeeParametro('ARTCSTO001') = 'S');
  DBCBSerizalizado.Enabled := (LeeParametro('ARTSERI001') = 'S');
  DBCBLoteable.Enabled := (LeeParametro('ARTLOTE001') = 'S');
  DBCBVirtual.Enabled := (LeeParametro('ARTVIRT001') = 'S');
  DBCBUbicable.Enabled := (LeeParametro('ARTUBIC001') = 'S');

  DBCBControlStock.ReadOnly := not DBCBControlStock.Enabled;
  DBCBSerizalizado.ReadOnly := not DBCBSerizalizado.Enabled;
  DBCBLoteable.ReadOnly := not DBCBLoteable.Enabled;
  DBCBVirtual.ReadOnly := not DBCBVirtual.Enabled;
  DBCBUbicable.ReadOnly := not DBCBUbicable.Enabled;

  if (REntorno.Delegacion = 'S') then
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavNotas.VisibleButtons := [nbRefresh];
     NavStocks.VisibleButtons := [nbPrior, nbNext, nbRefresh];
     NavPreciosBase.VisibleButtons := [nbRefresh];
     NavPrecios.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavProv.VisibleButtons := [nbPrior, nbNext, nbRefresh];
     NavProvArt.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavSeries.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     HYTDBGHistCoste.Visible := False;
     DBEPCoste.Visible := False;
     EDMonedaEmpresa.Visible := False;
     DBEPCosteCanal.Visible := False;
     EDMonedaCanal.Visible := False;
  end;

  LCampo1.Caption := LeeParametro(format('ARTDESC%3.3d', [1]));
  LCampo2.Caption := LeeParametro(format('ARTDESC%3.3d', [2]));
  LCampo3.Caption := LeeParametro(format('ARTDESC%3.3d', [3]));
  LCampo4.Caption := LeeParametro(format('ARTDESC%3.3d', [4]));
  LCampo5.Caption := LeeParametro(format('ARTDESC%3.3d', [5]));
  LCampo6.Caption := LeeParametro(format('ARTDESC%3.3d', [6]));
  LCampo7.Caption := LeeParametro(format('ARTDESC%3.3d', [7]));
  LCampo8.Caption := LeeParametro(format('ARTDESC%3.3d', [8]));
  if (LCampo1.Caption = '') then
     LCampo1.Caption := _('Campo 1');
  if (LCampo2.Caption = '') then
     LCampo2.Caption := _('Campo 2');
  if (LCampo3.Caption = '') then
     LCampo3.Caption := _('Campo 3');
  if (LCampo4.Caption = '') then
     LCampo4.Caption := _('Campo 4');
  if (LCampo5.Caption = '') then
     LCampo5.Caption := _('Campo 5');
  if (LCampo6.Caption = '') then
     LCampo6.Caption := _('Campo 6');
  if (LCampo7.Caption = '') then
     LCampo7.Caption := _('Campo 7');
  if (LCampo8.Caption = '') then
     LCampo8.Caption := _('Campo 8');

  PCCuentas.ActivePage := TSFichaSeries;
  PCProveedores.ActivePage := TSPedidosProv;

  DMMain.Log('FMArticulos.FormCreate AddComponentePunto');
  FMain.AddComponentePunto(EFBarras);
  FMain.AddComponentePunto(EFArticulo);
  FMain.AddComponentePunto(DBEArticulo);
  FMain.AddComponentePunto(DBEFCompras);
  FMain.AddComponentePunto(DBEFVentas);
  FMain.AddComponentePunto(DBEFDevCompras);
  FMain.AddComponentePunto(DBEFDevVentas);
  FMain.AddComponentePunto(DBEFAbonoCompras);
  FMain.AddComponentePunto(DBEFAbonoVentas);

  FMain.AddComponentePunto(DBEFCtaCompras);
  FMain.AddComponentePunto(DBEFCtaVentas);
  FMain.AddComponentePunto(DBEFCtaDevCompras);
  FMain.AddComponentePunto(DBEFCtaDevVentas);
  FMain.AddComponentePunto(DBEFCtaAbonoCompras);
  FMain.AddComponentePunto(DBEFCtaAbonoVentas);

  {dji lrk kri - Para que tengan la misma altura}
  PNLPedidosDeClientes.Height := (PNLPedidosDeClientes.Height + PNLPedidosAProveedor.Height) div 2;

  DMMain.Log('FMArticulos.FormCreate EstadoKri(196)');
  {Descripcion Extendida de Idiomas con Rich Text (IberFluid)}
  if (DMMain.EstadoKri(196) = 1) then
  begin
     TBIdioma.Visible := True;
     DBREIdioma.Visible := True;
     DBREIdioma.Align := alClient;
     DBREIdioma.PlainText := False;
     for i := 0 to TBIdioma.ButtonCount - 1 do
        if (TBIdioma.Buttons[i].Style = tbsSeparator) then
           TBIdioma.Buttons[i].Visible := True;

     TBRichNotas.Visible := True;
     DBRENotasCompras.PlainText := False;
  end;
  {dji lrk kri - RichEdit}
  FUpdating := False;
  GetFontNames;

  DMMain.Log('FMArticulos.FormCreate AlmacenRestringido');
  if (REntorno.AlmacenRestringido > '') then
  begin
     CBAlmacenPedidosPendientesKri.Items.Add(REntorno.AlmacenRestringido);
     CBAlmacenPropuestasKri.Items.Add(REntorno.AlmacenRestringido);
  end
  else
  begin
     RellenaAlmacenes(CBAlmacenPedidosPendientesKri.Items);
     RellenaAlmacenes(CBAlmacenPropuestasKri.Items);
     CBAlmacenPedidosPendientesKri.ItemIndex := 0;
     CBAlmacenPropuestasKri.ItemIndex := 0;
  end;

  DMMain.Log('FMArticulos.FormCreate EstadoKri(242)');
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

  // Si el modulo de etiquetas esta inactivo eliminamos sus acciones
  if (LeeParametro('MODREST008') <> 'S') then
  begin
     DMMain.Log('FMArticulos.FormCreate LeeParametro("MODREST008") <> "S"');
     for i := Self.ComponentCount - 1 downto 0 do
     begin
        if (Self.Components[i] is TAction) then
        begin
           if TAction(Self.Components[i]) = AFichaTec then
              TAction(Self.Components[i]).Free;
        end;
     end;
  end;

  TSUnidadesLogisitcas.TabVisible := (StrToIntDef(LeeParametro('SYSCONF005'), 0) <> 0);

  AStockTyC.Enabled := (LeeParametro('MODREST017') = 'S');

  {Flag para no recalcular stock}
  FUpdatingStock := False;

  DMMain.Log('FMArticulos.FormCreate EstadoKri(372)');
  // Si 1, fa servir serialització KRI. Sino, la estandard
  if (DMMain.EstadoKri(372) = 1) then
  begin
     DBCBSerizalizado.DataField := 'SERIALIZADO_KRI';
     TSStockNroSerie.TabVisible := False;
     TSStockNroSerieKRI.TabVisible := True;
  end
  else
  begin
     DBCBSerizalizado.DataField := 'SERIALIZADO';
     TSStockNroSerie.TabVisible := True;
     TSStockNroSerieKRI.TabVisible := False;
  end;

  // Toldos y Cortinas
  Param_MODREST015 := (LeeParametro('MODREST015') = 'S');
  LblTipoArticulo.Visible := Param_MODREST015;
  Z_DBEFTipoArt.Visible := Param_MODREST015;
  Z_DescTipoArt.Visible := Param_MODREST015;
  PCToldosYCortinas.Visible := Param_MODREST015;
  DBCBPreparable.Visible := Param_MODREST015;
  DBCHKCompoMotor.Visible := Param_MODREST015;
  LbMerma.Visible := Param_MODREST015;
  DBEMerma.Visible := Param_MODREST015;
  Self.Height := Self.Height - (PEdit.Height - Z_DBEFTipoArt.Top);
  Z_DescSubTipoArt.Visible := Param_MODREST015;
  Z_DBEFSubTipoArt.Visible := Param_MODREST015;
  LblSubTipoArticulo.Visible := Param_MODREST015;

  if (DMMain.EstadoKri(445) <> 1) then
  begin
     DBEFSubfamilia.Visible := False;
     ETitSubfamilia.Visible := False;
     ETitFamilia.Width := DBETitFabricante.Width;
  end;

  PNLStockTiendaVirtual.Visible := Param_MODSINC015;
  UltimoArticuloTiendaVirtual := '';

  DMMain.LogIni('FMArticulos.FormCreate DBCHKBajaChange(Sender)');
  DBCHKBajaChange(Sender);
  DMMain.LogFin('');

  SolapaControles(SBAGaleria, ETituloGaleria);
  ETituloGaleria.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAImagen, ETituloImagen);
  ETituloImagen.Color := REntorno.ColorEnlaceActivo;

  // Para poder copiar mediante doble click el codigo del articulo
  SolapaControles(SBArticulo, DBEArticulo);

  // Elimino esta acción por su peligrosidad
  ACambiarCodigo.Free;

  if (DMMain.EstadoKri(195) <> 1) then
  begin
     if (EncuentraField(HYDBGPedidosDeCliente, 'FECHA_CLIENTE') >= 0) then
        HYDBGPedidosDeCliente.FindColumn('FECHA_CLIENTE').Visible := False;
  end;

  // Oculto estos campos y pongo el Coste Adicional en su lugar
  LPCosteCanal.Visible := False;
  DBEPCosteCanal.Visible := False;
  EDMonedaCanal.Visible := False;

  ColumnaMovimientos := DBGStockMovimientos.Columns[0];
  ColumnaStockLote := DBStockLote.Columns[0];

  DMMain.Log('FMArticulos.FormCreate Stock Alm Lan');
  // Genero acciones para filtrar por los diferentes almacenes de lanzamiento.
  Lista := TStringList.Create;
  try
     RellenaAlmacenes(Lista);

     for i := 0 to Lista.Count - 1 do
     begin
        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('AStockAlmacen%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 128;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 0;
        NuevaAccion.Category := 'Calculos;Stock;Almacen';
        NuevaAccion.OnExecute := AStockAlmacenExecute;

        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('ALanzadaAlmacen%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 128;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 0;
        NuevaAccion.Category := 'Calculos;Lanzadas;Almacen';
        NuevaAccion.OnExecute := ALanzadaAlmacenExecute;
     end;
  finally
     Lista.Free;
  end;

  DMMain.Log('FMArticulos.FormCreate Calculo Tarifa');
  // Genero acciones para filtrar por los diferentes almacenes de lanzamiento.
  Lista := TStringList.Create;
  try
     RellenaTarifas(Lista);

     for i := 1 {Salto opcion 'Todas las Tarifas'} to Lista.Count - 1 do
     begin
        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('ACalcularTarifa%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 33;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 0;
        NuevaAccion.Category := 'Calculos;Precio;Tarifa';
        NuevaAccion.OnExecute := APrecioTarifaExecute;
     end;
  finally
     Lista.Free;
  end;

  DMMain.Log('FMArticulos.FormCreate Param_ARTSTKD001');
  Param_ARTSTKD001 := LeeParametro('ARTSTKD001');
  if ((Param_ARTSTKD001 = 'DEFECTO')) then
     DM.StockAlmacen(REntorno.AlmacenDefecto)
  else
     DM.StockAlmacen(Param_ARTSTKD001);

  DMMain.Log('FMArticulos.FormCreate EstadoKri(488)');
  if ((DMMain.EstadoKri(488) = 1)) then
     DM.PrecioTarifa(REntorno.TarifaDefecto)
  else
     DM.PrecioTarifa('NOCALC');

  // Muestra la Produccion Avanzada
  Param_MODREST006 := (LeeParametro('MODREST006') = 'S');
  if Param_MODREST006 then
  begin
     TBFichaTec.Visible := True;
     TSEquivalencias.TabVisible := True;
     AFiltraEscandallosProd.Enabled := Assigned(FMain.TButtMantenimientoEscandallo);
     AFiltraEscandallosProd.Visible := Assigned(FMain.TButtMantenimientoEscandallo);
     AFiltraEscandalloProdComponente.Enabled := Assigned(FMain.TButtMantenimientoEscandallo);
     AFiltraEscandalloProdComponente.Visible := Assigned(FMain.TButtMantenimientoEscandallo);
  end
  else
  begin
     TBFichaTec.Visible := False;
     TSEquivalencias.TabVisible := False;
     AFiltraEscandallosProd.Enabled := False;
     AFiltraEscandallosProd.Visible := False;
     AFiltraEscandalloProdComponente.Enabled := False;
     AFiltraEscandalloProdComponente.Visible := False;
     TButtFiltraEscandallosProd.Visible := False;
     TButtFiltraEscandallosProdComponente.Visible := False;
  end;

  AFiltraEscandalloProdSimpComponente.Enabled := Assigned(FMain.TButtEscandalloProd);
  AFiltraEscandalloProdSimpComponente.Visible := Assigned(FMain.TButtEscandalloProd);

  TSHistCost.TabVisible := (DMMain.EstadoKri(476) = 1);

  if (DMMain.EstadoKri(42) = 1) then
  begin
     EFBarras.OrdenadoPor.Text := 'TITULO';
     G2kTableLoc.OrdenadoPor.Text := 'TITULO';
  end;

  if ((LeeParametro('ARTBUSQ001') <> 'ARTICULO') and (LeeParametro('ARTBUSQ001') <> '')) then
  begin
     G2kTableLoc.CamposADesplegar.Text := LeeParametro('ARTBUSQ001');
  end;

  MoviendoArticulo := False;

  if (LeeParametro('MODREST025') <> 'S') then
  begin
     DBCBUbicable.Visible := False;
     FreeAndNil(TSStocksUbicaciones);

     i := EncuentraField(DBStockLote, 'ID_UBICACION');
     if (i >= 0) then
        DBStockLote.Columns[i].Visible := False;
     i := EncuentraField(DBStockLote, 'CALLE');
     if (i >= 0) then
        DBStockLote.Columns[i].Visible := False;
     i := EncuentraField(DBStockLote, 'ESTANTERIA');
     if (i >= 0) then
        DBStockLote.Columns[i].Visible := False;
     i := EncuentraField(DBStockLote, 'REPISA');
     if (i >= 0) then
        DBStockLote.Columns[i].Visible := False;
     i := EncuentraField(DBStockLote, 'POSICION');
     if (i >= 0) then
        DBStockLote.Columns[i].Visible := False;
     i := EncuentraField(DBStockLote, 'COMPOSICION');
     if (i >= 0) then
        DBStockLote.Columns[i].Visible := False;

     AUbicacionArticulo.Free;
     ARecalculaStockUbicaciones.Free;
     AIniciaRecalculo.Free;
     AParaRecalculo.Free;
  end;

  PNLEginer.Visible := (LeeParametro('PEREGIN001') = 'S');
  TBSepEginer.Visible := PNLEginer.Visible;

  // Inicializo la pestaña a mostrar
  PCStocks.ActivePage := TSStocksStock;

  DMMain.Log('FMArticulos.FormCreate PNLAvisosResize');
  PNLAvisosResize(Sender);

  // Color campo ID
  ColorCampoID(DBEArticulo);

  DMMain.Log('FMArticulos.FormCreate GetBitmapFromImageList');
  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(SBFabricacion, 1, DMMain.ILMain_Ac, 116);
  GetBitmapFromImageList(SBFabricacion, 2, DMMain.ILMain_In, 116);
  GetBitmapFromImageList(SBDesfabricacion, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(SBDesfabricacion, 2, DMMain.ILMain_In, 39);
  GetBitmapFromImageList(BCrearCodigoBarra, 1, DMMain.ILMain_Ac, 38);
  GetBitmapFromImageList(BCrearCodigoBarraEAN13, 1, DMMain.ILMain_Ac, 38);

  Campo := DM.QMArticulosARTICULO;
  DMMain.LogFin('');
end;

procedure TFMArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMMain.LogIni('FMArticulos.FormClose');
  inherited;
  DMMain.Log('FMArticulos.FormClose Fin Inherited');
  FMain.DelComponentePunto(EFBarras);
  FMain.DelComponentePunto(EFArticulo);
  FMain.DelComponentePunto(DBEArticulo);
  FMain.DelComponentePunto(DBEFCompras);
  FMain.DelComponentePunto(DBEFVentas);
  FMain.DelComponentePunto(DBEFDevCompras);
  FMain.DelComponentePunto(DBEFDevVentas);
  FMain.DelComponentePunto(DBEFAbonoCompras);
  FMain.DelComponentePunto(DBEFAbonoVentas);

  FMain.DelComponentePunto(DBEFCtaCompras);
  FMain.DelComponentePunto(DBEFCtaVentas);
  FMain.DelComponentePunto(DBEFCtaDevCompras);
  FMain.DelComponentePunto(DBEFCtaDevVentas);
  FMain.DelComponentePunto(DBEFCtaAbonoCompras);
  FMain.DelComponentePunto(DBEFCtaAbonoVentas);

  DMMain.Log('FMArticulos.FormClose CierraData(DMArticulos)');
  CierraData(DM);
  DMMain.Log('FMArticulos.FormClose CierraData(DMPrestashop)');
  if Param_MODSINC015 then
     CierraData(DMPrestashop);
  DMMain.LogFin('');
end;

procedure TFMArticulos.TSHistCostShow(Sender: TObject);
begin
  DM.AbrirHistorico;
  if REntorno.Delegacion = 'S' then {dji lrk kri}
  begin
     DMMain.Log('TSHistCostShow.HYTDBGHistCoste.SetFocus');
     if HYTDBGHistCoste.CanFocus then
        HYTDBGHistCoste.SetFocus;
  end;
  ControlEdit := CEMain;
end;

procedure TFMArticulos.TSStocksShow(Sender: TObject);
begin
  DM.AbrirStock;

  if (Param_MODSINC015 and (UltimoArticuloTiendaVirtual <> DBExCodStk.Text)) then
     ActualizaStockTiendaVirtual;

  if (EncuentraField(DBGStocks, 'LANZADAS') >= 0) then
     DBGStocks.FindColumn('LANZADAS').Visible := Param_MODREST006;

  ControlEdit := CEStocks;
  if (not MoviendoArticulo) then
     if Assigned(PCStocks.ActivePage.OnShow) then
        PCStocks.ActivePage.OnShow(Self);
end;

procedure TFMArticulos.TSFichaShow(Sender: TObject);
begin
  DM.AbrirFicha;
  ControlEdit := CEMain;
end;

procedure TFMArticulos.TSPreciosShow(Sender: TObject);
var
  Columna : integer;
begin
  DM.AbrirPrecios;
  ControlEdit := CEPreciosBase;

  DBEFBlisterChange(Sender);

  with DBGTarifasPrecios do
  begin
     Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_VENTA_MONEDA');
     if (Columna >= 0) then
        Columns[Columna].Visible := True;
     Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_VENTA');
     if (Columna >= 0) then
        Columns[Columna].Visible := False;
  end;

  // DOCPCTA001 - Utiliza precios de coste en ART_ARTICULOS_TARIFAS
  if (LeeParametro('DOCPCTA001') <> 'S') then
  begin
     with DBGTarifasPrecios do
     begin
        Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_COSTE');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_COMPRA');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGTarifasPrecios, 'DESCUENTO_COMPRA');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGTarifasPrecios, 'DESCUENTO_COMPRA_2');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGTarifasPrecios, 'DESCUENTO_COMPRA_3');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
     end;
  end;
end;

procedure TFMArticulos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DM.SWFil := 1;
  DM.BusquedaCompleja;
  Continua := False;
  Reconectar_Tablas;
end;

procedure TFMArticulos.TSProveedoresShow(Sender: TObject);
begin
  DM.AbrirProveedores;
  ControlEdit := CEProveedores;
  DBCGProveedores.RowCount := DBCGProveedores.Height div 26;
end;

procedure TFMArticulos.NavProvClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbEdit) then
     Continua := (DM.QMProveedores.RecordCount > 0);

  DBE_Prov_Codigo.Enabled := (Button = nbInsert);
  DBE_Prov_Codigo.ReadOnly := not DBE_Prov_Codigo.Enabled;
end;

procedure TFMArticulos.DBCB_Prov_ActivoExit(Sender: TObject);
begin
  DBCGProveedores.DoKey(gkEditMode);
end;

procedure TFMArticulos.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  Habilitar;

  if FMain.sourcecall = True then
  begin
     FMain.sourcecall := False;
     Close;
  end;

  if Button in [nbNext, nbLast, nbPrior, nbFirst] then
  begin
     MoviendoArticulo := False;
     RefrescaPestanyaActiva;
  end;
  if Button in [nbRefresh] then
     DM.RellenaDatosOldArticulo;
end;

procedure TFMArticulos.TBFabricarClick(Sender: TObject);
var
  can_fabricar, unidades_ext : double;
begin
  try
     can_fabricar := StrToFloat(EDFabricar.Text);
     unidades_ext := StrToFloat(EDTUnidadesExt.Text);
  except
     ShowMessage(_('Cantidad a fabricar incorrecta'));
     can_fabricar := 0;
     unidades_Ext := 0;
     EDFabricar.Text := '0';
     SBFabricacion.Down := False;
  end;

  if (can_fabricar > 0) then
     DM.Fabricar_Articulo(can_Fabricar, unidades_ext);
  EDFabricar.Text := '0';
  EDTUnidadesExt.Text := '0';
  SBFabricacion.Down := False;
end;

procedure TFMArticulos.TSFabricacionShow(Sender: TObject);
begin
  DM.AbrirStock;   // También se abre la tabla de Stock
  Habilitar;
  ControlEdit := CEFabricacion;
  DBCtrlFabricacion.RowCount := DBCtrlFabricacion.Height div 26;
end;

procedure TFMArticulos.Habilitar;
var
  opcion : smallint;
begin
  opcion := 0;
  DM.HabilitaFabricacion(opcion);
  if opcion = 0 then
  begin
     EDFabricar.Enabled := False;
     EDFabricar.ReadOnly := not EDFabricar.Enabled;
     EDFabricar.Color := clInfoBk;
     LBLAFabricar.Caption := _('Artículo no Fabricable');
     SBFabricacion.Enabled := False;
     SBDesfabricacion.Enabled := False;
  end
  else
  begin
     EDFabricar.Enabled := True;
     EDFabricar.ReadOnly := not EDFabricar.Enabled;
     EDFabricar.Color := clWindow;
     LBLAFabricar.Caption := _('Número de Artículos a Fabricar');
     SBFabricacion.Enabled := True;
     SBDesfabricacion.Enabled := True;
  end;
end;

procedure TFMArticulos.DBEFFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMArticulos.SBDesfabricacionClick(Sender: TObject);
var
  can_desfabricar, unidades_ext : double;
begin
  try
     can_desfabricar := StrToFloat(EDFabricar.Text);
     Unidades_ext := StrToFloat(EDTUnidadesExt.Text);
  except
     ShowMessage(_('Cantidad a fabricar incorrecta'));
     can_desfabricar := 0;
     Unidades_Ext := 0;
     EDFabricar.Text := '0';
     SBDesFabricacion.Down := False;
  end;
  if (can_desfabricar > 0) then
     DM.DesFabricar_Articulo(can_desFabricar, unidades_ext);
  EDFabricar.Text := '0';
  EDTUnidadesExt.Text := '0';
  SBDesFabricacion.Down := False;
end;

procedure TFMArticulos.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
  // ??? PNLCabNotas.Enabled := False;
end;

procedure TFMArticulos.TSCodBarraShow(Sender: TObject);
begin
  DM.AbrirCodBarras;
  ControlEdit := CEBarras;
  PintaCodigoBarras;
end;

procedure TFMArticulos.DBECodBarrasChange(Sender: TObject);
begin
  if (PCMain.ActivePage = TSCodBarra) then
     PintaCodigoBarras;
end;

procedure TFMArticulos.PintaCodigoBarras;
begin
  ICodBarras.Picture := nil;

  if (Trim(DM.QMCodigoBarraBARRAS.AsString) <> '') then
  begin
     with CodBarras do
     begin
        codigo := DM.QMCodigoBarraBARRAS.AsString;
        VerTexto := cboCodigo;
        Texto := CodBarras.codigo;
        Alto := 60;
        Porcentaje := 10;
        Modulo := 1;
        ChequearDigito := True;
        case DM.QMCodigoBarraTIPO.Value of
           3: // Ean13
           begin
              Tipo := cbEAN13;
              OrigenX := 15;
              OrigenY := 15;
              Ratio := 2;
              Fuente.Size := 8;
           end;
           2: // Ean 8
           begin
              Tipo := cbEAN8;
              OrigenX := 20;
              OrigenY := 15;
              Ratio := 2.6;
              Fuente.Size := 11;
           end;
           1: // Code 128
           begin
              Tipo := cb128;
              OrigenX := 3;
              OrigenY := 15;
              Ratio := 2;
              Fuente.Size := 8;
           end;
        end;
     end;
     try
        CodBarras.DibujaCodeBar(ICodBarras.Canvas);
     except
        ICodBarras.Picture := nil;
     end;
  end;

  ICodBarras.Refresh;
end;

procedure TFMArticulos.MILstMovArtClick(Sender: TObject);
begin
end;

{ Vuelve a conectar las tablas pertinentes después de la Búsqueda }
procedure TFMArticulos.Reconectar_Tablas;
begin
  if (PCMain.ActivePage = TSFicha) then
     DM.AbrirFicha;           // Ficha
  if (PCMain.ActivePage = TSIdioma) then
     DM.AbrirIdiomas;         // Idiomas
  if (PCMain.ActivePage = TSHistCost) then
     DM.AbrirHistorico;       // Histórico
  if (PCMain.ActivePage = TSStocks) then
  begin
     DM.AbrirStock;           // Stock
     TSStocksShow(nil);
  end;
  if (PCMain.ActivePage = TSFabricacion) then
     DM.AbrirStock;           // Fabricación (también cerramos stock)
  if (PCMain.ActivePage = TSPrecios) then
     DM.AbrirPrecios;         // Precios
  if (PCMain.ActivePage = TSCondiciones) then
     DM.AbrirCondiciones;
  if (PCMain.ActivePage = TSProveedores) then
     DM.AbrirProveedores;     // Proveedores
  if (PCMain.ActivePage = TSClientes) then
     TSClientesShow(nil);
  if (PCMain.ActivePage = TSCodBarra) then
     DM.AbrirCodBarras;       // Cód.Barras
  if (PCMain.ActivePage = TSCuentas) then // Cuentas
  begin
     if PCCuentas.ActivePage = TSFichaSeries then
     begin
        ControlEdit := CESeries;
        DM.AbrirSeries;
     end
     else
     if PCCuentas.ActivePage = TSProyectos then
     begin
        ControlEdit := CEProyectos;
        DM.AbrirProyectos;
     end
     else
     if PCCuentas.ActivePage = TSProySeries then
     begin
        ControlEdit := CEProyectosSeries;
        DM.AbrirProyectosSeries;
     end;
  end;
  if (PCMain.ActivePage = TSAgrupacion) then
     DM.AbrirAgrupacion;      // Agrupación
  if (PCMain.ActivePage = TSImagenes) then
     RefrescarImagen(Imagen, DM.QMArticulosIMAGEN.AsInteger);
  if (PCMain.ActivePage = TSSimilares) then
     DM.AbrirSimilares;
  if (PCMain.ActivePage = TSPropuestas) then
     CalcularPropuesta(nil); // DM.AbrirPropuestas(CBSoloPropPendientes.Checked, CBAlmacenPropuestasKri.Text);
  if (PCMain.ActivePage = TSPedidos) then
     CalcularPedidos(nil); // DM.AbrirPedidos(CBSoloPendientes.Checked, CBAlmacenPedidosPendientesKri.Text);
  if (PCMain.ActivePage = TSUnidadesLogisitcas) then
     DM.AbrirUnidadesLogisitcas;
  if (PCMain.ActivePage = TSEquivalencias) then
     DM.AbrirEquivalencias;
  if (PCMain.ActivePage = TSCombinaciones) then
     TSCombinacionesShow(nil);
  if (PCMain.ActivePage = TSECommerce) then
     TSECommerceShow(nil);
  if (PCMain.ActivePage = TSAvisos) then
     DM.AbrirAvisos;
  if (PCMain.ActivePage = TSBultos) then
     DM.AbrirBultos;
  if (PCMain.ActivePage = TSLogistica) then
     DM.AbrirLogistica;
end;

procedure TFMArticulos.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  if ((Sender as TPageControl).ActivePage = TSFicha) then
     DM.CerrarFicha;          // Ficha
  if ((Sender as TPageControl).ActivePage = TSIdioma) then
     DM.CerrarIdiomas;         // Idiomas
  if ((Sender as TPageControl).ActivePage = TSHistCost) then
     DM.CerrarHistorico;       // Histórico
  if ((Sender as TPageControl).ActivePage = TSStocks) then
  begin
     DM.CerrarStock;           // Stock
     DM.CerrarDataSetsStock;
     tmrStockFuturo.Enabled := False;
  end;
  if ((Sender as TPageControl).ActivePage = TSFabricacion) then
     DM.CerrarStock;           // Fabricación (también cerramos stock)
  if ((Sender as TPageControl).ActivePage = TSPrecios) then
     DM.CerrarPrecios;         // Precios
  if ((Sender as TPageControl).ActivePage = TSProveedores) then
     DM.CerrarProveedores;     // Proveedores
  if ((Sender as TPageControl).ActivePage = TSClientes) then
     DM.CerrarClientes;        // Clientes
  if ((Sender as TPageControl).ActivePage = TSCodBarra) then
     DM.CerrarCodBarras;       // Cód.Barras
  if ((Sender as TPageControl).ActivePage = TSCuentas) then
     DM.CerrarCuentas;          // Series
  if ((Sender as TPageControl).ActivePage = TSAgrupacion) then
     DM.CerrarAgrupacion;     // Agrupación
  {
  if ((Sender as TPageControl).ActivePage = TSImagenes) then
     DM.CerrarImagenes;       // Imágenes
  }
  if ((Sender as TPageControl).ActivePage = TSPedidos) then
     DM.CerrarPedidos;
  if ((Sender as TPageControl).ActivePage = TSUnidadesLogisitcas) then
     DM.CerrarUnidadesLogisitcas;
  if ((Sender as TPageControl).ActivePage = TSSimilares) then
     DM.CerrarSimilares;
  if ((Sender as TPageControl).ActivePage = TSEquivalencias) then
     DM.CerrarEquivalencias;
  if ((Sender as TPageControl).ActivePage = TSCondiciones) then
     DM.CerrarCondiciones;
  if ((Sender as TPageControl).ActivePage = TSCombinaciones) then
     DM.CerrarCombinaciones;
  if ((Sender as TPageControl).ActivePage = TSECommerce) then
     DM.CerrarECommerce;
  if ((Sender as TPageControl).ActivePage = TSAvisos) then
     DM.CerrarAvisos;
  if ((Sender as TPageControl).ActivePage = TSBultos) then
     DM.CerrarBultos;
  if ((Sender as TPageControl).ActivePage = TSLogistica) then
     DM.CerrarLogistica;
  if ((Sender as TPageControl).ActivePage = TSCaracteristicas) then
     DM.CerrarCaracteristicas;
end;

procedure TFMArticulos.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBEArticulo.Enabled := False;
     DBEArticulo.ReadOnly := not DBEArticulo.Enabled;
  end
  else
  begin
     DBEArticulo.Enabled := Param_ARTINSE001;
     DBEArticulo.ReadOnly := not Param_ARTINSE001;
     Z_DBEFTipoArt.Enabled := True;
     Z_DBEFTipoArt.ReadOnly := not Z_DBEFTipoArt.Enabled;
     Z_DBEFTipoArt.Color := clWindow;
     Z_DBEFTipoLacado.Enabled := True;
     Z_DBEFTipoLacado.ReadOnly := not Z_DBEFTipoLacado.Enabled;

     // (INDELEC) - Si el articulo es vacio codificamos como FFF-SS-NNN (Familia+Subfamilia+MaxContador), por lo tanto entro directamente a la familia.
     if ((Button = nbInsert) and (LeeParametro('ARTCODI001') <> '')) then
     begin
        DMMain.Log('NavMainClick.DBEFFamilia.SetFocus');
        if DBEFFamilia.CanFocus then
           DBEFFamilia.SetFocus;
     end;
  end;
end;

procedure TFMArticulos.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMArticulos.TSPedidosProvShow(Sender: TObject);
begin
  NavProv.ControlEdit := CEProveedores;
  CEProveedores.FichaEdicion := TSPedidosProv;
end;

procedure TFMArticulos.TSCodigoProvShow(Sender: TObject);
begin
  NavProvArt.ControlEdit := CEProveedores;
  CEProveedores.FichaEdicion := TSCodigoProv;
end;

procedure TFMArticulos.EDFabricarChange(Sender: TObject);
begin
  inherited;
  EDTUnidadesExt.Text := FloatToStr(DM.Calcula_UnidadesExt);
end;

procedure TFMArticulos.DBCGPreciosEnter(Sender: TObject);
begin
  ControlEdit := CEPrecios;
end;

procedure TFMArticulos.DBCGProveedoresEnter(Sender: TObject);
begin
  ControlEdit := CEProveedores;
end;

procedure TFMArticulos.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if (Button in [nbInsert, nbEdit]) and
     ((PCMain.ActivePage = TSStocks) or (PCMain.ActivePage = TSProveedores) or
     (PCMain.ActivePage = TSPrecios)) then
     PCMain.ActivePage := TSFicha;

  if ((Button in [nbNext, nbLast, nbPrior, nbFirst]) and (PCMain.ActivePage = TSStocks)) then
  begin
     MoviendoArticulo := True;
     DM.CerrarStock;
  end;
end;

procedure TFMArticulos.TSCuentasShow(Sender: TObject);
begin
  DM.AbrirSeries;
  ControlEdit := CESeries;
  PCCuentas.ActivePage := TSFichaSeries;
end;

procedure TFMArticulos.FormActivate(Sender: TObject);
begin
  DMMain.LogIni('FMArticulos.FormActivate');
  inherited;

  DMMain.Log('FormActivate Fin inherited');
  if not Primera then
     if not REntorno.DatosAbiertos then
        DM.BusquedaCompleja;
  Primera := True;

  if FMain.EnlaceCrea then
     InsertarArticulo;

  TSCombinaciones.TabVisible := Param_MODSINC016;

  TSECommerce.TabVisible := (Param_MODSINC003 or Param_MODSINC019);

  if (LeeParametro('ARTREST001') = 'S') then
  begin
     ACalculaStockMinMax.Enabled := False;

     if (EncuentraField(DBGStocks, 'STOCK_MINIMO') >= 0) then
     begin
        DBGStocks.FindColumn('STOCK_MINIMO').ReadOnly := True;
        DBGStocks.FindColumn('STOCK_MINIMO').Color := clInfoBk;
     end;
     if (EncuentraField(DBGStocks, 'STOCK_MAXIMO') >= 0) then
     begin
        DBGStocks.FindColumn('STOCK_MAXIMO').ReadOnly := True;
        DBGStocks.FindColumn('STOCK_MAXIMO').Color := clInfoBk;
     end;
  end;

  // Deshabilito para que funcione el doble click sobre estos campos para asignar agrupacion
  DBEAgrupacionSon.Enabled := False;
  DBEAgrupacionSonTitulo.Enabled := False;
  DBEAgDentro.Enabled := False;
  DBEAgTitDentro.Enabled := False;

  DMMain.LogFin('FMArticulos.FormActivate');
end;

procedure TFMArticulos.TButtRefrescarTablaClick(Sender: TObject);
begin
  DM.RefrescarDMArticulos;
  Reconectar_Tablas;
end;

procedure TFMArticulos.ActualizarConfigCBarras;
begin
  CBConfigCBarras.Checked := DM.ConfigCBarras;
end;

procedure TFMArticulos.CBConfigCBarrasClick(Sender: TObject);
begin
  DM.EscribirConfigCBarras(CBConfigCBarras.Checked);
end;

procedure TFMArticulos.TSAgrupacionShow(Sender: TObject);
begin
  inherited;
  DM.AbrirAgrupacion;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMArticulos.DBCGDisponiblesDblClick(Sender: TObject);
begin
  inherited;
  if (REntorno.Delegacion <> 'S') then {dji lrk kri}
     DM.MueveAgrupacion(True);
end;

procedure TFMArticulos.DBCGPerteneceDblClick(Sender: TObject);
begin
  inherited;
  if (REntorno.Delegacion <> 'S') then {dji lrk kri}
     DM.MueveAgrupacion(False);
end;

procedure TFMArticulos.InsertarArticulo(Proveedor: integer = 0; CodProv: string = ''; Descripcion: string = '');
begin
  DM.InsertarArticulo(Proveedor, CodProv);
  DMMain.Log('InsertarArticulo.DBEArticulo.SetFocus');

  if (LeeParametro('ARTCODI001') <> '') then
  begin
     DMMain.Log('NavMainClick.DBEFFamilia.SetFocus');
     if DBEFFamilia.CanFocus then
        DBEFFamilia.SetFocus;
  end
  else
  begin
     if not DBEArticulo.ReadOnly and DBEArticulo.CanFocus then
        DBEArticulo.SetFocus;
  end;

  if (Proveedor <> 0) then
  begin
     Hide;
     DM.QMArticulosTITULO.AsString := Descripcion;
     DBETitulo.Text := Descripcion;
     ShowModal;
  end;
end;

procedure TFMArticulos.NavPreciosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
var
  Columna : integer;
begin
  inherited;
  with DBGTarifasPrecios do
  begin
     if Button = nbEdit then
     begin
        Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_VENTA_MONEDA');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_VENTA');
        if (Columna >= 0) then
           Columns[Columna].Visible := True;
     end;
     if ((Button = nbCancel) or (Button = nbPost)) then
     begin
        Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_VENTA_MONEDA');
        if (Columna >= 0) then
           Columns[Columna].Visible := True;
        Columna := EncuentraField(DBGTarifasPrecios, 'PRECIO_VENTA');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
     end;
  end;
end;

procedure TFMArticulos.FiltraArticulos(aFiltro: string);
var
  Parametro : TParametroFiltrado;
begin
  Parametro := TParametroFiltrado.Create;
  try
     with Parametro do
     begin
        Filtro := aFiltro;
        SQLBase := TStringList.Create;
        // Mismo SQL pero sin FAMILIA <> FAMILIA_SISTEMA
        // SQLBase := DM.SQLBase;
        SQLBase.Clear;
        SQLBase.Add(' SELECT * FROM VER_ARTICULOS_CUENTAS ');
        SQLBase.Add(' WHERE ');
        SQLBase.Add(' EMPRESA = :EMPRESA AND ');
        SQLBase.Add(' EJERCICIO = :EJERCICIO AND ');
        SQLBase.Add(' CANAL = :CANAL ');
        SQLBase.Add(' ORDER BY ARTICULO ');
        Tabla := DM.QMArticulos;
     end;

     DMMain.FiltraSQL(Parametro);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;

  if (aFiltro <> '') then
  begin
     SWEnlace := 1;
     SWFil := 0;
  end;
end;

procedure TFMArticulos.DBGTarifasPreciosColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEPrecios;
end;

procedure TFMArticulos.DBGTarifasPreciosCellClick(Column: TColumn);
begin
  inherited;
  // DM.SetEditaPrecios;
end;

procedure TFMArticulos.DBGTarifasPreciosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  // DM.SetEditaPrecios;
end;

procedure TFMArticulos.DBEControlaUnidadesChange(Sender: TObject);
begin
  case (StrToIntDef(DBEControlaUnidades.Text, 0)) of
     0:
     begin
        DBEMultiplo1.Visible := False;
        DBEMultiplo2.Visible := False;
        DBEMultiplo3.Visible := False;
        DBEMultiplo4.Visible := False;
        DBEFactorEscala.Visible := False;
        LFactorEscala.Visible := False;
        LBLCompraMinima.Visible := False;
        LBLVentaMinima.Visible := False;
        DBEMinimaCompra.Visible := False;
        DBEMinimaVenta.Visible := False;
     end;
     1:
     begin
        DBEMultiplo1.Visible := True;
        DBEMultiplo2.Visible := False;
        DBEMultiplo3.Visible := False;
        DBEMultiplo4.Visible := False;
        DBEFactorEscala.Visible := True;
        LFactorEscala.Visible := True;
        LBLCompraMinima.Visible := True;
        LBLVentaMinima.Visible := True;
        DBEMinimaCompra.Visible := True;
        DBEMinimaVenta.Visible := True;
     end;
     2:
     begin
        DBEMultiplo1.Visible := True;
        DBEMultiplo2.Visible := True;
        DBEMultiplo3.Visible := False;
        DBEMultiplo4.Visible := False;
        DBEFactorEscala.Visible := True;
        LFactorEscala.Visible := True;
        LBLCompraMinima.Visible := True;
        LBLVentaMinima.Visible := True;
        DBEMinimaCompra.Visible := True;
        DBEMinimaVenta.Visible := True;
     end;
     3:
     begin
        DBEMultiplo1.Visible := True;
        DBEMultiplo2.Visible := True;
        DBEMultiplo3.Visible := True;
        DBEMultiplo4.Visible := False;
        DBEFactorEscala.Visible := True;
        LFactorEscala.Visible := True;
        LBLCompraMinima.Visible := True;
        LBLVentaMinima.Visible := True;
        DBEMinimaCompra.Visible := True;
        DBEMinimaVenta.Visible := True;
     end;
     4:
     begin
        DBEMultiplo1.Visible := True;
        DBEMultiplo2.Visible := True;
        DBEMultiplo3.Visible := True;
        DBEMultiplo4.Visible := True;
        DBEFactorEscala.Visible := True;
        LFactorEscala.Visible := True;
        LBLCompraMinima.Visible := True;
        LBLVentaMinima.Visible := True;
        DBEMinimaCompra.Visible := True;
        DBEMinimaVenta.Visible := True;
     end;
  end;
end;

procedure TFMArticulos.DBGFCodBarraColEnter(Sender: TObject);
begin
  ControlEdit := CEBarras;
end;

procedure TFMArticulos.DBEFImagenChange(Sender: TObject);
begin
  if (PCMain.ActivePage = TSImagenes) then
  begin
     RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
     ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
  end;
end;

procedure TFMArticulos.TSImagenesShow(Sender: TObject);
var
  c : integer;
begin
  RefrescarImagen(Imagen, DM.QMArticulosIMAGEN.AsInteger);
  ETituloImagen.Text := DameTituloImagen(DM.QMArticulosIMAGEN.AsInteger);

  RefrescarImagen(ImgPictograma, DM.QMPictogramaIMAGEN.AsInteger);
  c := EncuentraField(DBGPictograma, 'IMAGEN');
  if (c >= 0) then
     DBGPictograma.ColumnaInicial := c;

  ControlEdit := CEImagenes;
end;

procedure TFMArticulos.AAjustaConFamiliaExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DM.AutoCuentaFam;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMArticulos.AAjustarCuentasExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
  begin
     try
        Screen.Cursor := crHourGlass;
        DM.AutoCuentaTodos(TComponent(Sender).Tag);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMArticulos.AEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AEscandallo, DM.QMArticulosARTICULO.AsString);
end;

procedure TFMArticulos.AVentasArtExecute(Sender: TObject);
begin
  inherited;
  TFMVentasArt.Create(Self).MuestraArticulo(DM.QMArticulosARTICULO.AsString, 2, DM.QMArticulosID_A.AsInteger);
end;

procedure TFMArticulos.ACodigosBarrasExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Sender);
end;

procedure TFMArticulos.AControlLotesExecute(Sender: TObject);
begin
  inherited;
  TFMControl_lotes.Create(Self).AsignaArticulo(DM.QMArticulosARTICULO.AsString,
     DM.QMArticulosID_A.AsInteger);
end;

procedure TFMArticulos.AClientesArticuloExecute(Sender: TObject);
begin
  inherited;
  TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DBEArticulo.Text, 1);
end;

procedure TFMArticulos.AProveedoresArticuloExecute(Sender: TObject);
begin
  inherited;
  TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DBEArticulo.Text, 0);
end;

procedure TFMArticulos.ACalculaStockMinMaxExecute(Sender: TObject);
var
  CalculaStockMinMax : TFMCalculaStockMinMax;
begin
  inherited;
  CalculaStockMinMax := TFMCalculaStockMinMax.Create(Self);
  CalculaStockMinMax.ShowModal;
  CalculaStockMinMax.Release;
  DM.CerrarStock;
  DM.AbrirStock;
end;

procedure TFMArticulos.ALstArticulosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregArtCompleto, FPregArtCompleto);
end;

procedure TFMArticulos.ALstMovArtExecute(Sender: TObject);
begin
  inherited;
  TFPregFichasArticulos.Create(Self).Muestra(DBEArticulo.Text, 0);
end;

procedure TFMArticulos.ALstMovsResumidoExecute(Sender: TObject);
begin
  inherited;
  TFPregFichasArticulos.Create(Self).Muestra(DBEArticulo.Text, 1);
end;

procedure TFMArticulos.AConfListArtExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstArticulos, DMLstArticulos);
  TFMListConfig.Create(Self).Muestra(89, Formato, Cabecera, Copias,
     Pijama, '', DMLstArticulos.frArticulos);
  CierraData(DMLstArticulos);
end;

procedure TFMArticulos.AConfListMovArtExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRFichasArticulos, DMRFichasArticulos);
  TFMListConfig.Create(Self).Muestra(49, Formato, Cabecera, Copias,
     Pijama, '', DMRFichasArticulos.frArticulos);
  CierraData(DMRFichasArticulos);
end;

procedure TFMArticulos.AConfLstMovResumidoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRFichasArticulos, DMRFichasArticulos);
  TFMListConfig.Create(Self).Muestra(95, Formato, Cabecera, Copias,
     Pijama, '', DMRFichasArticulos.frArticulos);
  CierraData(DMRFichasArticulos);
end;

procedure TFMArticulos.AConfCodBarrasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  {  AbreData(TDMRFichasArticulos, DMRFichasArticulos);
  TFMListConfig.Create(Self).Muestra(63,Formato, Cabecera, Copias,
    Pijama, '', DMRFichasArticulos.frArticulos);
  Cierradata(DMRFichasArticulos);
}
  AbreData(TDMLstEtiquetas, DMLstEtiquetas);
  TFMListConfig.Create(Self).Muestra(63, Formato, Cabecera, Copias,
     Pijama, '', DMLstEtiquetas.frArticulos);
  CierraData(DMLstEtiquetas);
end;

procedure TFMArticulos.AListCodBarrasExecute(Sender: TObject);
begin
  inherited;
  //  if (PCMain.ActivePage = TSCodBarra) then
  //if (not ICodBarras.Picture.Bitmap.Empty) then
  DM.ListarCodBarras(ICodBarras);
end;

procedure TFMArticulos.AInfoStocksExecute(Sender: TObject);
var
  alm : string;
begin
  inherited;
  if (DM.QMArtStocks.Active) then
     alm := DM.QMArtStocksALMACEN.AsString
  else
     alm := REntorno.AlmacenDefecto;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DM.QMArticulosARTICULO.AsString, alm, Self);
end;

procedure TFMArticulos.AHistPreciosExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AHistoricoPMP);
  FMHistoricoPrecios.RefrescarArticulo(DM.QMArtStocksALMACEN.AsString,
     DM.QMArticulosARTICULO.AsString);
end;

procedure TFMArticulos.ARecalculaExecute(Sender: TObject);
begin
  inherited;
  DM.RecalculaPB;
  DM.QMArticulosPrecios.Refresh;
end;

procedure TFMArticulos.AMargenExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     if ConfirmaGrave then
        DM.PropagaMargen;
end;

procedure TFMArticulos.AStockTyCExecute(Sender: TObject);
(*
var
  id_a_m : integer;
*)
begin
  inherited;
  // Stock Tallas y Colores
  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT AMC.ID_A_M FROM ART_ARTICULOS ART ');
        SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS ATA ');
        SQL.Add(' ON ART.ID_A_M_C_T = ATA.ID_A_M_C_T ');
        SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ');
        SQL.Add(' ON ATA.ID_A_M_C = AMC.ID_A_M_C ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
        SQL.Add(' AND ARTICULO  = ''' + DM.QMArticulosARTICULO.AsString + '''');
        ExecQuery;
        id_a_m := FieldByName['ID_A_M'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
  TFMStockTallas.Create(Self).MuestraAM(DM.QMArticulosID_A_M.AsInteger);
end;

procedure TFMArticulos.AGenerarCodBarrasExecute(Sender: TObject);
begin
  inherited;
  TFMGenerarCBs.Create(Self).ShowModal;

  // Refresco información.
  DM.CerrarCodBarras;
  DM.AbrirCodBarras;
end;

procedure TFMArticulos.AHerenciaExecute(Sender: TObject);
begin
  inherited;
  DM.Heredar;
end;

procedure TFMArticulos.ALstAgrupacionArtExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMlstArticulos, DMlstArticulos);
  TFPregAgrupacionArt.Create(Self);
  CierraData(DMLstArticulos);
end;

procedure TFMArticulos.DBEFFamiliaChange(Sender: TObject);
var
  Color1, Color2, Color3, Color4 : TColor;
  Activo : boolean;
begin
  inherited;

  Color1 := clInfoBk;
  Color2 := clGrayText;
  Color3 := clWindow;
  Color4 := clWindowText;

  Activo := 1 = 0;

  if DBEFFamilia.Text = 'SYS' then
  begin
     Color1 := clWindow;
     Color2 := clWindowText;
     Color3 := clInfoBk;
     Color4 := clGrayText;

     Activo := True;
  end;

  DameCuentasVisibles(Activo, Color1, Color2, Color3, Color4);

  ETitFamilia.Text := DameTituloFamilia(DBEFFamilia.Text);
  ETitSubfamilia.Text := DameTituloSubfamilia(DBEFSubfamilia.Text, DBEFFamilia.Text);
end;

procedure TFMArticulos.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  DMMain.LogIni('FMArticulos.FormShow');
  inherited;

  DMMain.Log('FMArticulos.FormShow Fin inherited');

  Sistema := False;
  EFArticulo.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  G2KTableLoc.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';

  ControlEdit := CEMain;
  SetVisibleDefUdSec(DBCHKBUd_Secundaria.Checked);

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGMain, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGMain.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  IdColumna := EncuentraField(DBGStockMovimientos, 'ALFA_2');
  if (IdColumna >= 0) then
     DBGStockMovimientos.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [2]));

  EFArticulo.BuscarChars := Param_ARTBUSQ002;
  EFArticulo.BuscarNums := Param_ARTBUSQ002;
  if Param_ARTBUSQ004 then
  begin
     EFArticulo.BuscarChars := False;
     EFArticulo.BuscarNums := False;
  end;

  FormResize(Sender);

  DMMain.LogFin('FMArticulos.FormShow');
end;

procedure TFMArticulos.CambiaFamiliaSistema(Sistema: boolean);
begin
  DM.CambiaFamiliaSistema(Sistema);
  if Sistema then
  begin
     AVerArtSistema.Caption := _('Ver Artículos Normales');
     AVerArtSistema.Hint := _('Ver Artículos Normales');
     EFArticulo.CondicionBusqueda := 'FAMILIA = ''' + REntorno.FamSistema + '''';
     G2KTableLoc.CondicionBusqueda := 'FAMILIA = ''' + REntorno.FamSistema + '''';
  end
  else
  begin
     AVerArtSistema.Caption := _('Ver Artículos del Sistema');
     AVerArtSistema.Hint := _('Ver Artículos del Sistema');
     EFArticulo.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
     G2KTableLoc.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  end;
end;

procedure TFMArticulos.AVerArtSistemaExecute(Sender: TObject);
begin
  inherited;
  Sistema := not (Sistema);
  CambiaFamiliaSistema(Sistema);
end;

procedure TFMArticulos.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMArticulos.TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaCta(Sender);
end;

procedure TFMArticulos.ARecalcularStocksExecute(Sender: TObject);
begin
  inherited;
  FMRecalculoStocks := TFMRecalculoStocks.Create(Self);
  FMRecalculoStocks.SetDM(DM);
  FMRecalculoStocks.ShowModal;
  FMRecalculoStocks.Free;
end;

procedure TFMArticulos.ARecalcularStocksTotalesExecute(Sender: TObject);
begin
  inherited;
  FMRecalculoStocksTotales := TFMRecalculoStocksTotales.Create(Self);
  FMRecalculoStocksTotales.SetDM(DM);
  FMRecalculoStocksTotales.ShowModal;
  FMRecalculoStocksTotales.Free;
end;

procedure TFMArticulos.DameCuentasVisibles(Activo: boolean; Color1, Color2, Color3, Color4: TColor);
begin
  // Pestaña Ficha
  DBEFIVA.Color := Color3;
  DBEFIVA.Font.Color := Color4;
  DBEFIVA.Enabled := not (Activo);
  DBEFIVA.ReadOnly := not DBEFIVA.Enabled;
  DBEFIVA.ReadOnly := Activo;

  DBEFCompras.Enabled := not (Activo);
  DBEFCompras.ReadOnly := not DBEFCompras.Enabled;
  DBEFCompras.Font.Color := Color4;
  DBEFCompras.Color := Color3;

  DBEFVentas.Enabled := not (Activo);
  DBEFVentas.ReadOnly := not DBEFVentas.Enabled;
  DBEFVentas.Font.Color := Color4;
  DBEFVentas.Color := Color3;

  DBEFAbonoCompras.Visible := Activo;
  DBEFAbonoCompras.Enabled := Activo;
  DBEFAbonoCompras.ReadOnly := not DBEFAbonoCompras.Enabled;
  ETitAbonoCompras.Visible := Activo;
  LBCtaAbonoC.Visible := Activo;

  DBEFDevCompras.Visible := not (Activo);
  DBEFDevCompras.Enabled := not (Activo);
  DBEFDevCompras.ReadOnly := not DBEFDevCompras.Enabled;
  ETitDevCompras.Visible := not (Activo);
  LBCtaDevC.Visible := not (Activo);

  DBEFDevVentas.Visible := not (Activo);
  DBEFDevVentas.Enabled := not (Activo);
  DBEFDevVentas.ReadOnly := not DBEFDevVentas.Enabled;
  ETitDevVentas.Visible := not (Activo);
  LBCtaDevV.Visible := not (Activo);

  DBEFAbonoVentas.Visible := Activo;
  DBEFAbonoVentas.Enabled := Activo;
  DBEFAbonoVentas.ReadOnly := not DBEFAbonoVentas.Enabled;
  ETitAbonoVentas.Visible := Activo;
  CtaAbnV.Visible := Activo;

  // Pestaña Cuentas-Series
  DBEFCtaCompras.Enabled := not (Activo);
  DBEFCtaCompras.ReadOnly := not DBEFCtaCompras.Enabled;
  DBEFCtaCompras.Color := Color3;
  DBEFCtaCompras.Font.Color := Color4;

  DBEFCtaVentas.Enabled := not (Activo);
  DBEFCtaVentas.ReadOnly := not DBEFCtaVentas.Enabled;
  DBEFCtaVentas.Color := Color3;
  DBEFCtaVentas.Font.Color := Color4;

  DBEFCtaAbonoCompras.Visible := Activo;
  DBEFCtaAbonoCompras.Enabled := Activo;
  DBEFCtaAbonoCompras.ReadOnly := not DBEFCtaAbonoCompras.Enabled;
  ETitCtaAbonoCompras.Visible := Activo;
  LBCtaAbnC.Visible := Activo;

  DBEFCtaAbonoVentas.Visible := Activo;
  DBEFCtaAbonoVentas.Enabled := Activo;
  DBEFCtaAbonoVentas.ReadOnly := not DBEFCtaAbonoVentas.Enabled;
  ETitCtaAbonoVentas.Visible := Activo;
  LbCtaAbnV.Visible := Activo;

  LBCtaDevlC.Visible := not (Activo);
  DBEFCtaDevCompras.Visible := not (Activo);
  DBEFCtaDevCompras.Enabled := not (Activo);
  DBEFCtaDevCompras.ReadOnly := not DBEFCtaDevCompras.Enabled;
  ETitCtaDevCompras.Visible := not (Activo);

  LbCtaDvnV.Visible := not (Activo);
  DBEFCtaDevVentas.Visible := not (Activo);
  DBEFCtaDevVentas.Enabled := not (Activo);
  DBEFCtaDevVentas.ReadOnly := not DBEFCtaDevVentas.Enabled;
  ETitCtaDevVentas.Visible := not (Activo);

  // Pestaña Cuentas-Proyectos
  DBEFCtaCompProy.Enabled := not (Activo);
  DBEFCtaCompProy.ReadOnly := not DBEFCtaCompProy.Enabled;
  DBEFCtaCompProy.Color := Color3;
  DBEFCtaCompProy.Font.Color := Color4;

  DBEFCtaVentProy.Enabled := not (Activo);
  DBEFCtaVentProy.ReadOnly := not DBEFCtaVentProy.Enabled;
  DBEFCtaVentProy.Color := Color3;
  DBEFCtaVentProy.Font.Color := Color4;

  DBEFCtaAbCompProy.Visible := Activo;
  DBEFCtaAbCompProy.Enabled := Activo;
  DBEFCtaAbCompProy.ReadOnly := not DBEFCtaAbCompProy.Enabled;
  ETitCtaAbCompProy.Visible := Activo;
  LFLCtaAbonoComp.Visible := Activo;

  DBEFCtaAbVentProy.Visible := Activo;
  DBEFCtaAbVentProy.Enabled := Activo;
  DBEFCtaAbVentProy.ReadOnly := not DBEFCtaAbVentProy.Enabled;
  ETitCtaAbVentProy.Visible := Activo;
  LFLCtaAbonoVentas.Visible := Activo;

  LFLCtaDevComp.Visible := not (Activo);
  DBEFCtaDevCompProy.Visible := not (Activo);
  DBEFCtaDevCompProy.Enabled := not (Activo);
  DBEFCtaDevCompProy.ReadOnly := not DBEFCtaDevCompProy.Enabled;
  ETitCtaDevCompProy.Visible := not (Activo);

  LFLCtaDevVent.Visible := not (Activo);
  DBEFCtaDevVentProy.Visible := not (Activo);
  DBEFCtaDevVentProy.Enabled := not (Activo);
  DBEFCtaDevVentProy.ReadOnly := not DBEFCtaDevVentProy.Enabled;
  ETitCtaDevVentProy.Visible := not (Activo);

  // Pestaña Cuentas-Proyectos/Series
  DBEFCtaCompProySer.Enabled := not (Activo);
  DBEFCtaCompProySer.ReadOnly := not DBEFCtaCompProySer.Enabled;
  DBEFCtaCompProySer.Color := Color3;
  DBEFCtaCompProySer.Font.Color := Color4;

  DBEFCtaVentProySer.Enabled := not (Activo);
  DBEFCtaVentProySer.ReadOnly := not DBEFCtaVentProySer.Enabled;
  DBEFCtaVentProySer.Color := Color3;
  DBEFCtaVentProySer.Font.Color := Color4;

  DBEFCtaAbCompProySer.Visible := Activo;
  DBEFCtaAbCompProySer.Enabled := Activo;
  DBEFCtaAbCompProySer.ReadOnly := not DBEFCtaAbCompProySer.Enabled;
  ETitCtaAbCompProySer.Visible := Activo;
  LFLCtaAbCompProySer.Visible := Activo;

  DBEFCtaAbVentProySer.Visible := Activo;
  DBEFCtaAbVentProySer.Enabled := Activo;
  DBEFCtaAbVentProySer.ReadOnly := not DBEFCtaAbVentProySer.Enabled;
  ETitCtaAbVentProySer.Visible := Activo;
  LFLCtaAbVentProySer.Visible := Activo;

  LFLCtaDevCompPROYSER.Visible := not (Activo);
  DBEFCtaDevCompProySer.Visible := not (Activo);
  DBEFCtaDevCompProySer.Enabled := not (Activo);
  DBEFCtaDevCompProySer.ReadOnly := not DBEFCtaDevCompProySer.Enabled;
  ETitCtaDevCompProySer.Visible := not (Activo);

  LFLCtaDevVentPROYSER.Visible := not (Activo);
  DBEFCtaDevVentProySer.Visible := not (Activo);
  DBEFCtaDevVentProySer.Enabled := not (Activo);
  DBEFCtaDevVentProySer.ReadOnly := not DBEFCtaDevVentProySer.Enabled;
  ETitCtaDevVentProySer.Visible := not (Activo);
end;

procedure TFMArticulos.NavSeriesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbEdit then
     if (Trim(DM.QMArticulosFAMILIA.AsString) = 'SYS') then
        NAVSeries.EditaControl := DBEFCtaAbonoCompras
     else
        NAVSeries.EditaControl := DBEFCtaCompras;
end;

procedure TFMArticulos.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
  begin
     DMMain.Log('NavNotasBeforeAction.NavNotas.SetFocus');
     if NavNotas.CanFocus then
        NavNotas.SetFocus;
  end;
end;

procedure TFMArticulos.DBGFIdiomasBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if Pos('SYS_IDIOMAS', Trim(TablaABuscar)) > 0 then
     begin
        {DBGFIdiomas.CondicionBusqueda := 'DEFECTO <> 1'; dji lrk kri - Iberfluid - Que salgan todos los idiomas}
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO desc, IDIOMA';
     end;
  end;
end;

procedure TFMArticulos.TSIdiomaShow(Sender: TObject);
begin
  inherited;
  DM.AbrirIdiomas;
  ControlEdit := CEIdiomas;
end;

procedure TFMArticulos.AUbicacionArticuloExecute(Sender: TObject);
var
  FMUbicaArticulo : TFMUbicaArticulo;
begin
  inherited;
  if (DM.QMArticulosUBICABLE.AsInteger = 1) then
  begin
     FMUbicaArticulo := TFMUbicaArticulo.Create(Self);
     FMUbicaArticulo.InicializaArticulo(DM.QMArticulosARTICULO.AsString);
     FMUbicaArticulo.ShowModal;
  end;
end;

procedure TFMArticulos.DBCHKBUd_SecundariaChange(Sender: TObject);
begin
  inherited;
  SetVisibleDefUdSec((Sender as TLFDBCheckBox).Checked);
end;

procedure TFMArticulos.SetVisibleDefUdSec(Value: boolean);
begin
  {
  LBDefUdSec.Enabled := Value;
  LBDefUdSec.Visible := Value;

  DBEDefUdSec.Visible := Value;
  DBEDefUdSec.Enabled := Value;
  }
end;

procedure TFMArticulos.DBGFIdiomasColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEIdiomas;
end;

procedure TFMArticulos.RefrescaPestanyaActiva;
begin
  {dji lrk kri - agregue el if ...}
  if Assigned(PCMain) then
     if (PCMain.ActivePage <> TSImagenes) then
        if Assigned(PCMain.ActivePage.OnShow) then
           PCMain.ActivePage.OnShow(Self);
end;

procedure TFMArticulos.AListadodeEtiquetasdeArticulosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregEtiArticulosKri, FPregEtiArticulosKri);
end;

procedure TFMArticulos.ABuscaPorCodCliExecute(Sender: TObject);
var
  CodCli : TFMCodigoCliente;
begin
  inherited;
  CodCli := TFMCodigoCliente.Create(Self);
  try
     EFArticulo.Text := CodCli.BuscaArticulo;
  finally
     CodCli.Release;
  end;
end;

procedure TFMArticulos.ABuscaPorCodProvExecute(Sender: TObject);
var
  CodProv : TFMCodigoProveedor;
begin
  inherited;
  CodProv := TFMCodigoProveedor.Create(Self);
  try
     EFArticulo.Text := CodProv.BuscaArticulo;
  finally
     CodProv.Release;
  end;
end;

procedure TFMArticulos.HYDBGPedidosDeClienteDblClick(Sender: TObject);
begin
  inherited;
  if (DM.xPedidosDeClientesTIPO.AsString = 'ORD') then
     FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DM.xPedidosDeClientesID_S.AsInteger))
  else
     FMain.MuestraDocumento(DM.xPedidosDeClientesEJERCICIO.AsInteger,
        DM.xPedidosDeClientesTIPO.AsString,
        DM.xPedidosDeClientesSERIE.AsString,
        DM.xPedidosDeClientesRIG.AsInteger);
end;

procedure TFMArticulos.HYDBGPedidosAProveedorDblClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(DM.xPedidosAProveedorEJERCICIO.AsInteger,
     DM.xPedidosAProveedorTIPO.AsString,
     DM.xPedidosAProveedorSERIE.AsString,
     DM.xPedidosAProveedorRIG.AsInteger);
end;

procedure TFMArticulos.HYDBGPropuestasDblClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(DM.xPropuestasEJERCICIO.AsInteger,
     DM.xPropuestasTIPO.AsString,
     DM.xPropuestasSERIE.AsString,
     DM.xPropuestasRIG.AsInteger);
end;

procedure TFMArticulos.HYDBGPropuestasConfirDblClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(DM.xPropuestasConfirEJERCICIO.AsInteger,
     DM.xPropuestasConfirTIPO.AsString,
     DM.xPropuestasConfirSERIE.AsString,
     DM.xPropuestasConfirRIG.AsInteger);
end;

procedure TFMArticulos.DBCHKAnticipoContadoChange(Sender: TObject);
begin
  inherited;
  DBCHKAnticipo.Enabled := not (DBCHKAnticipoContado.Checked);
  if ((DBCHKAnticipoContado.Checked) and (DM.QMArticulos.State in [dsEdit, dsInsert])) then
     DM.QMArticulosANTICIPO.AsInteger := 1;
end;

procedure TFMArticulos.DBCHKAnticipoChange(Sender: TObject);
begin
  inherited;
  DBCHKAnticipoPregDatos.Enabled := DBCHKAnticipo.Checked;
  if ((not (DBCHKAnticipo.Checked)) and (DM.QMArticulos.State in [dsEdit, dsInsert])) then
     DM.QMArticulosANTICIPO_PREG_DATOS.AsInteger := 0;
end;

procedure TFMArticulos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
var
  AllowChange : boolean;
  Articulo : string;
begin
  inherited;
  DM.QuitaFiltros;

  AllowChange := True;
  PCMainChanging(PCMain, AllowChange);

  DM.OptimizaBusqueda(True);
  try
     if Param_ARTBUSQ004 then
     begin
        Articulo := '';
        if PideArticulo(Articulo) then
           Posicionar(DM.QMArticulos, 'ARTICULO', Articulo);
        Continua := False;
     end
     else
     begin
        G2kTableLoc.DataSource := DM.DSQMArticulos;
        G2kTableLoc.Click;
     end;
  finally
     DM.OptimizaBusqueda(False);
  end;

  RefrescaPestanyaActiva;
end;

procedure TFMArticulos.EFArticuloBusqueda(Sender: TObject);
var
  Articulo : string;
begin
  if Param_ARTBUSQ004 then
  begin
     Articulo := EFArticulo.Text;
     if PideArticulo(Articulo) then
        EFArticulo.Text := Articulo;
  end
  else
     inherited;
end;

procedure TFMArticulos.EFArticuloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Articulo : string;
begin
  if Param_ARTBUSQ004 and (Key in [Ord('0')..Ord('9'), Ord('A')..Ord('Z'), VK_F3]) then
  begin
     Articulo := EFArticulo.Text;
     if PideArticulo(Articulo) then
        EFArticulo.Text := Articulo;
     Key := 0;
  end
  else
     inherited;
end;

procedure TFMArticulos.ACambiarCodigoExecute(Sender: TObject);
var
  {dji lrk kri - no se utiliza   Continua,}
  ReemplazaEscandallo : boolean;
begin
  inherited;
  FPregCodArticulo := TFPregCodArticulo.Create(Self);
  with FPregCodArticulo do
  begin
     try
        EFArticulo.Text := DBEArticulo.Text;
        if ((ShowModal = mrOk) and
           (EFArticulo.Text <> '')) then
           if (Application.MessageBox(PChar(string(_('Atención : Este Proceso es costoso y puede tardar algunos minutos.'))),
              PChar(string(_('Confirmación'))),
              mb_iconstop + mb_yesno) = id_yes) then
           begin
              ReemplazaEscandallo := False;
              if (DM.TieneEscandallo(EFArticulo.Text)) then
              begin
                 ReemplazaEscandallo := (Application.MessageBox(PChar(string(_('Atención : El artículo destino es escandallado, desea reemplazarlo por el escandallo del artículo origen.'))),
                    PChar(string(_('Confirmación'))),
                    mb_iconstop + mb_yesno) = id_yes);
              end;
              Screen.Cursor := crHourGlass;
              DM.CambiarCodigo(EFArticulo.Text, CBBorraOrigen.State = cbChecked, ReemplazaEscandallo);
           end;
     finally
        Screen.Cursor := crDefault;
        Free;
     end;
  end;
end;

procedure TFMArticulos.Z_DBEFTipoArtChange(Sender: TObject);
begin
  inherited;
  Z_DescTipoArt.ActualizaDatos('TIPO_ARTICULO_TYC', Z_DBEFTipoArt.Text);
  Z_SeleccionaPanelTipo;
end;

procedure TFMArticulos.Z_DBEFSalidaBusqueda(Sender: TObject);
begin
  inherited;
  Z_DBEFSalida.CondicionBusqueda := 'CODIGO=''' + Z_DBEFModelo.Text + ''' AND' +
     ' LINEA=' + Z_DBEFLinea.Text;
end;

procedure TFMArticulos.Z_DBEFLineaBusqueda(Sender: TObject);
begin
  inherited;
  Z_DBEFLinea.CondicionBusqueda := 'CODIGO=''' + Z_DBEFModelo.Text + '''';
end;

procedure TFMArticulos.Z_DBEFFormaLonaChange(Sender: TObject);
begin
  inherited;
  Z_DescFormaLona.ActualizaDatos('Z_LONA_FORMA', Z_DBEFFormaLona.Text);
end;

procedure TFMArticulos.Z_DBEFTipoLonaChange(Sender: TObject);
begin
  inherited;
  Z_DescTipoLona.ActualizaDatos('Z_LONA_TIPO', Z_DBEFTipoLona.Text);
end;

procedure TFMArticulos.Z_SeleccionaPanelTipo;
begin
  if Param_MODREST015 then
  begin
     with PCToldosYCortinas do
     begin
        // Tipo V no debe mostrar opciones.
        Visible := (Z_DBEFTipoArt.Text <> 'V');

        if (Z_DBEFTipoArt.Text = 'A') then
           ActivePage := TSTipoArmazon;
        if (Z_DBEFTipoArt.Text = 'T') then
           ActivePage := TSTipoToldo;
        if (Z_DBEFTipoArt.Text = 'L') then
           ActivePage := TSTipoLona;
        if (Z_DBEFTipoArt.Text = 'C') then
           ActivePage := TSTipoComponente;
        if (Z_DBEFTipoArt.Text = 'K') then
           ActivePage := TSTipoKit;
        if (Z_DBEFTipoArt.Text = 'S') then
           ActivePage := TSLama;
     end;

     Z_TButtDatosEsp.Enabled := (
        (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'T') or
        (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'A') or
        (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'L'));
     DBCHKCompoMotor.Enabled := (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'C');
  end;
end;

procedure TFMArticulos.ZADatosToldoExecute(Sender: TObject);
begin
  inherited;
  if (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'T') then
     TZFMArtToldos.Create(Self).AbreDatos(DM, DM.QMArticulosARTICULO.AsString,
        DM.QMArticulosTITULO.AsString)
  else if (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'A') then
     TZFMArtArmazones.Create(Self).AbreDatos(DM, DM.QMArticulosARTICULO.AsString,
        DM.QMArticulosTITULO.AsString)
  else if (DM.QMArticulosTIPO_ARTICULO_TYC.AsString = 'L') then
     TZFMArtLonas.Create(Self).AbreDatos(DM, DM.QMArticulosARTICULO.AsString,
        DM.QMArticulosTITULO.AsString);
end;

procedure TFMArticulos.CalcularPedidos(Sender: TObject);
var
  Almacen : string;
begin
  inherited;
  Almacen := 'Todos';
  if (CBAlmacenPedidosPendientesKri.ItemIndex > 0) then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenPedidosPendientesKri.Items[CBAlmacenPedidosPendientesKri.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  DM.CerrarPedidos;
  DM.AbrirPedidos(CBSoloPendientes.Checked, Almacen, OrdenPedidosCliente, OrdenPedidosProveedor);
end;

procedure TFMArticulos.TSPedidosShow(Sender: TObject);
begin
  CalcularPedidos(Sender);
end;

procedure TFMArticulos.CalcularPropuesta(Sender: TObject);
var
  Almacen : string;
begin
  Almacen := 'Todos';
  if (CBAlmacenPropuestasKri.ItemIndex > 0) then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenPropuestasKri.Items[CBAlmacenPropuestasKri.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  DM.CerrarPropuestas;
  DM.AbrirPropuestas(CBSoloPropPendientes.Checked, Almacen, OrdenPropuestas, OrdenPropuestasConfirmadas);
end;

procedure TFMArticulos.TSPropuestasShow(Sender: TObject);
begin
  inherited;
  CalcularPropuesta(Sender);
end;

procedure TFMArticulos.PCCuentasChange(Sender: TObject);
begin
  Reconectar_Tablas;
end;

procedure TFMArticulos.DBEFProyectoBusqueda(Sender: TObject);
begin
  DBEFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMArticulos.DBEFProyectoSeriesBusqueda(Sender: TObject);
begin
  DBEFProyectoSeries.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMArticulos.AHistoricoSerializacionExecute(Sender: TObject);
begin
  HistoricoSerie(Self);
end;

procedure TFMArticulos.ALstArticuloProvExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMArticulos.MuestraFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DM.QMArticulos.SelectSQL);
     AbreData(TDMLstArticulosProv, DMLstArticulosProv);
     try
        TempSql.AddStrings(DMLstArticulosProv.QMArticulosProv.SelectSQL);
        DMLstArticulosProv.QMArticulosProv.Close;
        DMLstArticulosProv.QMArticulosProv.SelectSQL.Assign(SqlFiltro);
        DMLstArticulosProv.MostrarListadoFiltrado(Modo, SWFil);
        DMLstArticulosProv.QMArticulosProv.Close;
        DMLstArticulosProv.QMArticulosProv.SelectSQL.Assign(TempSQL);
     finally
        CierraData(DMLstArticulosProv);
     end;
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMArticulos.AConfLstArticulosProvExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstArticulosProv, DMLstArticulosProv);
  TFMListConfig.Create(Self).Muestra(9013, Formato, Cabecera, Copias,
     Pijama, '', DMLstArticulosProv.frArticulosProv);
  CierraData(DMLstArticulosProv);
end;

procedure TFMArticulos.EFontSizeNotasChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if (RichEditConFoco <> nil) then
     with RichEditConFoco do
     begin
        if SelLength > 0 then
           SelAttributes.Size := StrToInt(TEdit(Sender).Text)
        else
           DefAttributes.Size := StrToInt(TEdit(Sender).Text);
     end;
end;

procedure TFMArticulos.DBRENotasComprasEnter(Sender: TObject);
begin
  inherited;
  RichEditConFoco := TDBRichEdit(Sender);
end;

procedure TFMArticulos.ADuplicaArticuloKriExecute(Sender: TObject);
begin
  inherited;
  TabSheet := PCMain.ActivePage;

  // Paso a la ficha para poder asignar nuevo código de artículo
  PCMain.ActivePage := TSFicha;
  DM.DuplicaArticuloKri;
  DMMain.Log('ADuplicaArticuloKriExecute DBEArticulo.SetFocus');
  if DBEArticulo.CanFocus then
     DBEArticulo.SetFocus;
end;

procedure TFMArticulos.DBRENotasVentasSelectionChange(Sender: TObject);
begin
  inherited;
  try
     FUpdating := True;
     with TDBRichEdit(Sender) do
     begin
        EFontSizeNotas.Text := IntToStr(SelAttributes.Size);
        CBFontNameNotas.Text := SelAttributes.Name;
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMArticulos.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(CBFontName.Items));
  ReleaseDC(0, DC);
  CBFontName.Sorted := True;

  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(CBFontNameNotas.Items));
  ReleaseDC(0, DC);
  CBFontNameNotas.Sorted := True;
end;

procedure TFMArticulos.CBFontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  with RichEditConFoco do
  begin
     if SelLength > 0 then
        SelAttributes.Name := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex]
     else
        DefAttributes.Name := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex];
  end;
end;

procedure TFMArticulos.DBREIdiomaSelectionChange(Sender: TObject);
begin
  inherited;
  try
     FUpdating := True;
     with TDBRichEdit(Sender) do
     begin
        EFontSize.Text := IntToStr(SelAttributes.Size);
        CBFontName.Text := SelAttributes.Name;
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMArticulos.TSStocksUbicacionesShow(Sender: TObject);
begin
  inherited;
  DM.AbrirStockUbicaciones;
end;

procedure TFMArticulos.TSStocksLoteShow(Sender: TObject);
begin
  inherited;
  DM.AbrirStockLote;
end;

procedure TFMArticulos.TSStockNroSerieShow(Sender: TObject);
begin
  inherited;
  DM.AbrirStockNroSerie;
end;

procedure TFMArticulos.TSStockNroSerieKRIShow(Sender: TObject);
begin
  inherited;
  DM.AbrirStockNroSerieKRI;
end;

procedure TFMArticulos.EditFind20001Change(Sender: TObject);
begin
  inherited;
  //DM.Filtra
end;

procedure TFMArticulos.AAdjuntosArticuloExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ART', DM.QMArticulosID_A.AsInteger);
end;

procedure TFMArticulos.TSUnidadesLogisitcasShow(Sender: TObject);
begin
  inherited;
  DM.AbrirUnidadesLogisitcas;
end;

procedure TFMArticulos.PCStocksChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  DM.CerrarDataSetsStock;
  tmrStockFuturo.Enabled := False;
end;

procedure TFMArticulos.cbSoloUbicacionConStockChange(Sender: TObject);
begin
  inherited;
  // Primero veo si el flag para no recalcular stock está habilitado
  if (not FUpdatingStock) then
  begin
     // Establezco el Flag para no volver a calcular
     FUpdatingStock := True;

     DM.SoloUbicacionConStock := TLFCheckBox(Sender).Checked;

     // Hago que todos los checks tengan el mismo estado
     cbSoloLoteConStock.Checked := TLFCheckBox(Sender).Checked;
     if Assigned(TSStocksUbicaciones) then
        cbSoloUbicacionConStock.Checked := TLFCheckBox(Sender).Checked;

     // Quito el Flag
     FUpdatingStock := False;
  end;
end;

procedure TFMArticulos.ARecalculaStockUbicacionesExecute(Sender: TObject);
begin
  inherited;
  DM.RecalculaStockUbicaciones;
end;

procedure TFMArticulos.AIniciaRecalculoExecute(Sender: TObject);
begin
  inherited;
  DM.IniciaRecalculo;
end;

procedure TFMArticulos.AParaRecalculoExecute(Sender: TObject);
begin
  inherited;
  DM.ParaRecalculo;
end;

procedure TFMArticulos.AFichaTecExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AEtiquetas, 'ARTICULO = ''' +
     DBEArticulo.Text + ''' AND EMPRESA = ' + REntorno.EmpresaStr);
end;

procedure TFMArticulos.DBExCodStkChange(Sender: TObject);
begin
  inherited;
  if Param_MODSINC015 then
     if ((DBExCodStk.Text <> UltimoArticuloTiendaVirtual) and (DBExCodStk.Text <> '') and (PCMain.ActivePage = TSStocks)) then
        ActualizaStockTiendaVirtual;
end;

procedure TFMArticulos.ActualizaStockTiendaVirtual;
var
  Stock : double;
begin
  Stock := 0;

  if (DM.QMArticulosCONTROL_STOCK.AsInteger = 1) then
  begin
     Stock := DMPrestashop.DameStockTienda(DM.QMArticulosID_A.AsInteger);
     UltimoArticuloTiendaVirtual := DBExCodStk.Text;
  end;

  with LEStockTiendaVirtual do
  begin
     Caption := FormatFloat(',0.00', Stock);
     Caption := Caption + ' '; // Agrego un espacio para que quede mejor
  end;
end;

procedure TFMArticulos.DBCHKBajaChange(Sender: TObject);
begin
  inherited;
  DBDTPFechaBaja.Visible := DBCHKBaja.Checked;
  DBEMotivoBaja.Visible := DBCHKBaja.Checked;
end;

procedure TFMArticulos.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del articulo %s - %s'), [DM.QMArticulosARTICULO.AsString, DM.QMArticulosTITULO.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.Add(_('Notas'));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMNotas.Lines);

     s.Add('');
     s.Add(_('Notas de Compra'));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBRENotasCompras.Lines);
     s.Add('----------------------------------------------------------------------');

     s.Add('');
     s.Add(_('Notas de Venta'));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBRENotasVentas.Lines);
     s.Add('----------------------------------------------------------------------');

     DM.AbrirIdiomas;
     with DM.QMIdiomas do
     begin
        First;
        while not EOF do
        begin
           s.Add('');
           s.Add(Format(_('Notas de Idioma %s - %s'), [DM.QMIdiomasIDIOMA.AsString, DM.QMIdiomasTITULO.AsString]));
           s.Add('----------------------------------------------------------------------');
           s.AddStrings(DBREIdioma.Lines);
           s.Add('----------------------------------------------------------------------');
           Next;
        end;
     end;
     DM.CerrarIdiomas;

     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMArticulos.Z_DBColorChange(Sender: TObject);
begin
  inherited;
  Z_DescColor.ActualizaDatos('Z_LAM_COLOR', Z_DBColor.Text);
end;

procedure TFMArticulos.DBEFSubfamiliaBusqueda(Sender: TObject);
begin
  DBEFSubfamilia.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(DBEFFamilia.Text));
end;

procedure TFMArticulos.DBEFComprasChange(Sender: TObject);
begin
  inherited;
  ETitCompras.Text := DameTituloCuenta(DBEFCompras.Text);
end;

procedure TFMArticulos.DBEFVentasChange(Sender: TObject);
begin
  inherited;
  ETitVentas.Text := DameTituloCuenta(DBEFVentas.Text);
end;

procedure TFMArticulos.DBEFCtaComprasChange(Sender: TObject);
begin
  inherited;
  ETitCtaCompras.Text := DameTituloCuenta(DBEFCtaCompras.Text);
end;

procedure TFMArticulos.DBEFCtaVentasChange(Sender: TObject);
begin
  inherited;
  ETitCtaVentas.Text := DameTituloCuenta(DBEFCtaVentas.Text);
end;

procedure TFMArticulos.DBEFCtaCompProyChange(Sender: TObject);
begin
  inherited;
  ETitCtaCompProy.Text := DameTituloCuenta(DBEFCtaCompProy.Text);
end;

procedure TFMArticulos.DBEFCtaVentProyChange(Sender: TObject);
begin
  inherited;
  ETitCtaVentProy.Text := DameTituloCuenta(DBEFCtaVentProy.Text);
end;

procedure TFMArticulos.DBEFCtaCompProySerChange(Sender: TObject);
begin
  inherited;
  ETitCtaCompProySer.Text := DameTituloCuenta(DBEFCtaCompProySer.Text);
end;

procedure TFMArticulos.DBEFCtaVentProySerChange(Sender: TObject);
begin
  inherited;
  ETitCtaVentProySer.Text := DameTituloCuenta(DBEFCtaVentProySer.Text);
end;

procedure TFMArticulos.DBEFDevComprasChange(Sender: TObject);
begin
  inherited;
  ETitDevCompras.Text := DameTituloCuenta(DBEFDevCompras.Text);
end;

procedure TFMArticulos.DBEFDevVentasChange(Sender: TObject);
begin
  inherited;
  ETitDevVentas.Text := DameTituloCuenta(DBEFDevVentas.Text);
end;

procedure TFMArticulos.DBEFAbonoComprasChange(Sender: TObject);
begin
  inherited;
  ETitAbonoCompras.Text := DameTituloCuenta(DBEFAbonoCompras.Text);
end;

procedure TFMArticulos.DBEFAbonoVentasChange(Sender: TObject);
begin
  inherited;
  ETitAbonoVentas.Text := DameTituloCuenta(DBEFAbonoVentas.Text);
end;

procedure TFMArticulos.DBEFCtaDevComprasChange(Sender: TObject);
begin
  inherited;
  ETitCtaAbonoCompras.Text := DameTituloCuenta(DBEFCtaDevCompras.Text);
end;

procedure TFMArticulos.DBEFCtaDevVentasChange(Sender: TObject);
begin
  inherited;
  ETitCtaAbonoVentas.Text := DameTituloCuenta(DBEFCtaDevVentas.Text);
end;

procedure TFMArticulos.DBEFCtaAbonoComprasChange(Sender: TObject);
begin
  inherited;
  ETitCtaDevCompras.Text := DameTituloCuenta(DBEFCtaAbonoCompras.Text);
end;

procedure TFMArticulos.DBEFCtaAbonoVentasChange(Sender: TObject);
begin
  inherited;
  ETitCtaDevVentas.Text := DameTituloCuenta(DBEFCtaAbonoVentas.Text);
end;

procedure TFMArticulos.DBEFCtaAbCompProyChange(Sender: TObject);
begin
  inherited;
  ETitCtaAbCompProy.Text := DameTituloCuenta(DBEFCtaAbCompProy.Text);
end;

procedure TFMArticulos.DBEFCtaAbVentProyChange(Sender: TObject);
begin
  inherited;
  ETitCtaAbVentProy.Text := DameTituloCuenta(DBEFCtaAbVentProy.Text);
end;

procedure TFMArticulos.DBEFCtaDevCompProyChange(Sender: TObject);
begin
  inherited;
  ETitCtaDevCompProy.Text := DameTituloCuenta(DBEFCtaDevCompProy.Text);
end;

procedure TFMArticulos.DBEFCtaDevVentProyChange(Sender: TObject);
begin
  inherited;
  ETitCtaDevVentProy.Text := DameTituloCuenta(DBEFCtaDevVentProy.Text);
end;

procedure TFMArticulos.DBEFCtaDevCompProySerChange(Sender: TObject);
begin
  inherited;
  ETitCtaDevCompProySer.Text := DameTituloCuenta(DBEFCtaDevCompProySer.Text);
end;

procedure TFMArticulos.DBEFCtaDevVentProySerChange(Sender: TObject);
begin
  inherited;
  ETitCtaDevVentProySer.Text := DameTituloCuenta(DBEFCtaDevVentProySer.Text);
end;

procedure TFMArticulos.DBEFCtaAbCompProySerChange(Sender: TObject);
begin
  inherited;
  ETitCtaAbCompProySer.Text := DameTituloCuenta(DBEFCtaAbCompProySer.Text);
end;

procedure TFMArticulos.DBEFCtaAbVentProySerChange(Sender: TObject);
begin
  inherited;
  ETitCtaAbVentProySer.Text := DameTituloCuenta(DBEFCtaAbVentProySer.Text);
end;

procedure TFMArticulos.ETitFamiliaChange(Sender: TObject);
begin
  inherited;
  Z_ETitFamilia.Text := ETitFamilia.Text;
end;

procedure TFMArticulos.DBEFabricanteChange(Sender: TObject);
begin
  inherited;
  // DBETitFabricante.Text := DameTituloTercero(StrToIntDef(DBEFabricante.Text, 0));
end;

procedure TFMArticulos.DBEFSubfamiliaChange(Sender: TObject);
begin
  inherited;
  ETitSubfamilia.Text := DameTituloSubfamilia(DBEFSubfamilia.Text, DBEFFamilia.Text);
end;

procedure TFMArticulos.Z_DBEFSubTipoArtBusqueda(Sender: TObject);
begin
  inherited;
  Z_DBEFSubTipoArt.CondicionBusqueda := 'TIPO_ARTICULO_TYC=''' + Z_DBEFTipoArt.Text + '''';
end;

procedure TFMArticulos.Z_DBEFSubTipoArtChange(Sender: TObject);
begin
  inherited;
  Z_DescSubTipoArt.ActualizaDatos('SUBTIPO_ARTICULO_TYC', Z_DBEFSubTipoArt.Text);
  // Z_SeleccionaPanelTipo;
end;

procedure TFMArticulos.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DM.QMArticulosIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMArticulos.NavImagenesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMArticulos.DBEFGaleriaChange(Sender: TObject);
begin
  inherited;
  ETituloGaleria.Text := DameTituloGaleria(StrToIntDef(DBEFGaleria.Text, 0));
end;

procedure TFMArticulos.SBAGaleriaDblClick(Sender: TObject);
begin
  inherited;
  AGaleriaExecute(Sender);
end;

procedure TFMArticulos.AGaleriaExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFGaleria.Text, -1) > 0) then
     FMain.EjecutaAccion(FMain.AGaleriaImagen, 'ID=' + DBEFGaleria.Text);
end;

procedure TFMArticulos.ETituloGaleriaDblClick(Sender: TObject);
begin
  inherited;
  AGaleriaExecute(Sender);
end;

procedure TFMArticulos.TSSimilaresShow(Sender: TObject);
begin
  inherited;
  DM.AbrirSimilares;
end;

procedure TFMArticulos.DBGArticulosSimilaresBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if Pos('VER_ARTICULOS_EF', Trim(TablaABuscar)) > 0 then
     begin
        CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND ARTICULO <> ''' + DataSource.DataSet.FieldByName('ARTICULO').AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;
  end;
end;

procedure TFMArticulos.ADocumentosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(DM.QMArticulosID_A.AsString, 'ART_ARTICULOS(ID_A)', 'DELFOS', _('Ficheros de Articulo'));
  ProFMFicherosCliente.Hide;
  ProFMFicherosCliente.ShowModal;
end;

procedure TFMArticulos.TSClientesShow(Sender: TObject);
begin
  inherited;
  DM.AbrirClientes;
  ControlEdit := CEClientes;
end;

procedure TFMArticulos.AFiltraEscandallosProdExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'COMPUESTO = ''' + DBEArticulo.Text + '''');
end;

procedure TFMArticulos.AFiltraEscandalloProdComponenteExecute(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  // El parametro empresa se rellena cuando se filtra el escandallo
  Filtro := '(ID_ESC IN (SELECT ID_ESC FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND COMPONENTE = ''' + DBEArticulo.Text + '''))';
  FMain.EjecutaAccion(FMain.AProEscandalloSF, Filtro);
end;

procedure TFMArticulos.TSMovimientosStockShow(Sender: TObject);
begin
  inherited;
  DM.CalcularPMPMovimientos := CBCalcularPMPMovimientos.Checked;
  DM.AbrirStockMovimientos;
end;

procedure TFMArticulos.DBGStockMovimientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     // Muestro las entradas resaltadas
     if ((DM.QMMovimientosStockTIPO_OPER.AsString = 'E') or (DM.QMMovimientosStockTIPO_OPER.AsString = 'D')) then
     begin
        if (DM.QMMovimientosStockDOC_TIPO.AsString = 'MAN') then
           ColorResaltado5(Canvas)
        else
           ColorResaltado2(Canvas);
     end
     else
        ColorInfo(Canvas);

     if ((UpperCase(Column.FieldName) = 'DOC_TIPO') or
        (UpperCase(Column.FieldName) = 'DOC_SERIE') or
        (UpperCase(Column.FieldName) = 'DOC_NUMERO')) then
     begin
        CeldaEnlace(THYTDBGrid(Sender), Rect);

        if (DataSource.DataSet.FieldByName('ID_DOC').AsInteger >= 0) then
           ColorInfo(Canvas)
        else
           ColorError(Canvas);
     end
     else
     if (Column.FieldName = 'ID_LOTE') then
     begin
        if (DM.QMArticulosLOTES.AsInteger = 1) then
        begin
           CeldaEnlace(THYTDBGrid(Sender), Rect);

           if (DataSource.DataSet.FieldByName(Column.FieldName).AsInteger > 0) then
              ColorInfo(Canvas)
           else
              ColorError(Canvas);
        end
        else
           ColorInactivo(Canvas);
     end
     else
     if (Column.FieldName = 'STOCK') then
     begin
        if (DataSource.DataSet.FieldByName(Column.FieldName).AsFloat >= 0) then
           ColorInfo(Canvas)
        else
           ColorError(Canvas);
     end
     else
     if (Column.FieldName = 'CANAL') then
     begin
        if (DataSource.DataSet.FieldByName(Column.FieldName).AsInteger = REntorno.Canal) then
           ColorInfo(Canvas)
        else
           ColorInactivo(Canvas);
     end
     else
     if (Column.FieldName = 'PMP') then
     begin
        if (CBCalcularPMPMovimientos.Checked) then
           ColorInfo(Canvas)
        else
           ColorInactivo(Canvas);
     end
     else
     if (Column.FieldName = 'PRECIO') then
     begin
        CeldaEnlace(THYTDBGrid(Sender), Rect);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.DBGStockMovimientosDblClick(Sender: TObject);
var
  Valor : double;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(ColumnaMovimientos.FieldName) = 'DOC_TIPO') or
        (UpperCase(ColumnaMovimientos.FieldName) = 'DOC_SERIE') or
        (UpperCase(ColumnaMovimientos.FieldName) = 'DOC_NUMERO')) then
     begin
        if (DM.QMMovimientosStockDOC_TIPO.AsString = 'MAN') then
           FMain.TraspasoDeDocumentosMovimiento(DM.QMMovimientosStockID_DOC.AsInteger)
        else
        if (DM.QMMovimientosStockTIPO_OPER.AsString = 'E') then
           FMain.TraspasoDeDocumentosEntrada(DM.QMMovimientosStockID_DOC.AsInteger)
        else
           FMain.TraspasoDeDocumentosSalida(DM.QMMovimientosStockID_DOC.AsInteger);
     end;

     if (ColumnaMovimientos.FieldName = 'ID_LOTE') then
        FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(DM.QMMovimientosStockID_LOTE.AsInteger));

     if (ColumnaMovimientos.FieldName = 'PRECIO') then
     begin
        Valor := DM.QMMovimientosStockPRECIO.AsFloat;
        if (PideDato('DBL', Valor, _('Nuevo precio'))) then
           DM.CambiaPrecioMovStock(Valor);
     end;
  end;
end;

procedure TFMArticulos.DBGStockMovimientosCellClick(Column: TColumn);
begin
  inherited;
  ColumnaMovimientos := Column;
end;

procedure TFMArticulos.DBStockLoteCellClick(Column: TColumn);
begin
  inherited;
  ColumnaStockLote := Column;
end;

procedure TFMArticulos.DBStockLoteDblClick(Sender: TObject);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (ColumnaStockLote.FieldName = 'ID_LOTE') then
        FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(DM.QMNrosLoteID_LOTE.AsInteger));
  end;
end;

procedure TFMArticulos.DBEFSerieProySerChange(Sender: TObject);
begin
  inherited;
  ETitSerieProySer.Text := DameTituloSerie(DBEFSerieProySer.Text);
end;

procedure TFMArticulos.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ETitSerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMArticulos.DBEFProyectoSeriesChange(Sender: TObject);
begin
  inherited;
  ETitProyectoSeries.Text := DameTituloProyecto(StrToIntDef(DBEFProyectoSeries.Text, 0));
end;

procedure TFMArticulos.DBEFProyectoChange(Sender: TObject);
begin
  inherited;
  ETitProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyecto.Text, 0));
end;

procedure TFMArticulos.TSStockFuturoShow(Sender: TObject);
begin
  inherited;
  DM.AbrirStockFuturo(CBSepararAlmacenes.Checked);
  tmrStockFuturo.Enabled := False;
  tmrStockFuturo.Enabled := True;
end;

procedure TFMArticulos.DBGStockFuturoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Situacion : integer;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'DOCUMENTO') then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'DOCUMENTO') then
        begin
           if ((DM.QMStockFuturoTIPO.AsString = 'MAT') or (DM.QMStockFuturoTIPO.AsString = 'PRO')) then
           begin
              Situacion := DMMain.DameSituacionOrden(DM.QMStockFuturoID_DOC.AsInteger);

              case Situacion of
                 1: // Lanzada
                    ColorResaltado2(Canvas); //clLime
                 2: // Reservada
                    ColorResaltado6(Canvas); //clSkyBlue
                 3: // Cerrada Parcialmente
                    ColorResaltado3(Canvas); //clFuchsia
              end;
           end;
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK') then
        begin
           if (DataSource.DataSet.FieldByName(Column.FieldName).AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
           if (DataSource.DataSet.FieldByName(Column.FieldName).AsFloat = 0) then
              ColorResaltado(Canvas) //clYellow
           else
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGridFind2000}
end;

procedure TFMArticulos.DBGStockFuturoCellClick(Column: TColumn);
begin
  inherited;
  ColumnaStockFuturo := Column;
end;

procedure TFMArticulos.DBGStockFuturoDblClick(Sender: TObject);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(ColumnaStockFuturo.FieldName) = 'DOCUMENTO') then
     begin
        if ((DM.QMStockFuturoTIPO.AsString = 'OFC') or (DM.QMStockFuturoTIPO.AsString = 'PEC')) then
           FMain.TraspasoDeDocumentosSalida(DM.QMStockFuturoID_DOC.AsInteger)
        else
        if ((DM.QMStockFuturoTIPO.AsString = 'OFP') or (DM.QMStockFuturoTIPO.AsString = 'OCP') or (DM.QMStockFuturoTIPO.AsString = 'PEP')) then
           FMain.TraspasoDeDocumentosEntrada(DM.QMStockFuturoID_DOC.AsInteger)
        else
        if ((DM.QMStockFuturoTIPO.AsString = 'MAT') or (DM.QMStockFuturoTIPO.AsString = 'PRO')) then
           FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DM.QMStockFuturoID_DOC.AsInteger));
     end;
  end;
end;

procedure TFMArticulos.CBSepararAlmacenesClick(Sender: TObject);
var
  c : integer;
begin
  inherited;
  DM.AbrirStockFuturo(CBSepararAlmacenes.Checked);
  tmrStockFuturo.Enabled := False;
  tmrStockFuturo.Enabled := True;
  c := EncuentraField(DBGStockFuturo, 'ALMACEN');
  if (c >= 0) then
     DBGStockFuturo.Columns[c].Visible := not CBSepararAlmacenes.Checked;
end;

procedure TFMArticulos.TSEquivalenciasShow(Sender: TObject);
begin
  inherited;
  DM.AbrirEquivalencias;
end;

procedure TFMArticulos.DBGFEquivalenciasCabDblClick(Sender: TObject);
begin
  inherited;
  if (DM.QMEquivalenciasCabID_EQUIVAL.AsInteger > 0) then
     FMain.EjecutaAccion(FMain.AProEquivalArt, IntToStr(DM.QMEquivalenciasCabID_EQUIVAL.AsInteger));
end;

procedure TFMArticulos.AStockAlmacenExecute(Sender: TObject);
var
  Almacen : string;
  IdColumna : integer;
  Col : TColumn;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Almacen := TAction(Sender).Caption;
  if (Almacen = _('No calcular stock')) then
     Almacen := 'NOCALC'
  else
  if (Almacen = _('Todos los Almacenes')) then
     Almacen := ''
  else
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);

  DM.StockAlmacen(Almacen);

  IdColumna := EncuentraField(DBGMain, 'STOCK_ALM');
  if (IdColumna >= 0) then
     DBGMain.Columns[IdColumna].Visible := True
  else
  begin
     Col := DBGMain.Columns.Add;
     Col.FieldName := 'STOCK_ALM';
     Col.Width := 80;
  end;
end;

procedure TFMArticulos.ALanzadaAlmacenExecute(Sender: TObject);
var
  Almacen : string;
  IdColumna : integer;
  Col : TColumn;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Almacen := TAction(Sender).Caption;
  if (Almacen = _('No calcular Lanzdas')) then
     Almacen := 'NOCALC'
  else
  if (Almacen = _('Todos los Almacenes')) then
     Almacen := ''
  else
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);

  DM.LanzadaAlmacen(Almacen);

  IdColumna := EncuentraField(DBGMain, 'LANZADA_ALM');
  if (IdColumna >= 0) then
     DBGMain.Columns[IdColumna].Visible := True
  else
  begin
     Col := DBGMain.Columns.Add;
     Col.FieldName := 'LANZADA_ALM';
     Col.Width := 80;
  end;
end;

procedure TFMArticulos.APrecioTarifaExecute(Sender: TObject);
var
  Tarifa : string;
  IdColumna : integer;
  Col : TColumn;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Tarifa := TAction(Sender).Caption;
  if (Tarifa = _('No calcular Tarifa')) then
     Tarifa := 'NOCALC'
  else
  if (Tarifa = _('Todas las Tarifas')) then
     Tarifa := ''
  else
     Tarifa := Copy(Tarifa, 1, Pos(' ', Tarifa) - 1);

  DM.PrecioTarifa(Tarifa);

  IdColumna := EncuentraField(DBGMain, 'PRECIO_TARIFA');
  if (IdColumna >= 0) then
     DBGMain.Columns[IdColumna].Visible := True
  else
  begin
     Col := DBGMain.Columns.Add;
     Col.FieldName := 'PRECIO_TARIFA';
     Col.Width := 80;
  end;
end;

procedure TFMArticulos.DBGStocksDblClick(Sender: TObject);
begin
  inherited;
  DM.CerrarPedidos;
  CBAlmacenPedidosPendientesKri.ItemIndex := CBAlmacenPedidosPendientesKri.Items.IndexOf(DM.QMArtStocksALMACEN.AsString);
  TSPedidos.Show;
end;

procedure TFMArticulos.DBGStocksDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with THYTDBGrid(Sender) do
  begin
     if (Column.FieldName = 'EXISTENCIAS') or (Column.FieldName = 'STOCK_VIRTUAL') or (Column.FieldName = 'STOCK_REAL') then
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        if (Column.Field.AsFloat < 0) then
           ColorError(Canvas)
        else
        if (Column.Field.AsFloat < DM.QMArtStocksSTOCK_MINIMO.AsFloat) then
           ColorResaltado3(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.DBETituloEnter(Sender: TObject);
begin
  inherited;
  // (INDELEC) - Si el articulo es vacio codificamos como FFF-SS-NNN (Familia+Subfamilia+MaxContador). El titulo es el de la familia + subfamilia.
  if ((DBETitulo.Text = '') and (LeeParametro('ARTCODI001') <> '')) then
     DBETitulo.Text := Trim(ETitFamilia.Text + ' ' + ETitSubfamilia.Text);
end;

procedure TFMArticulos.DBGCondicionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (DM.xCondicionesTIPO.AsString = 'CCA') then
           Colorear := ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'TITULO_CLIENTE') or (UpperCase(Column.FieldName) = 'ARTICULO'))
        else
        if (DM.xCondicionesTIPO.AsString = 'CCF') then
           Colorear := ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'TITULO_CLIENTE') or (UpperCase(Column.FieldName) = 'FAMILIA'))
        else
        if (DM.xCondicionesTIPO.AsString = 'CAA') then
           Colorear := ((UpperCase(Column.FieldName) = 'AGRUPACION') or (UpperCase(Column.FieldName) = 'ARTICULO'))
        else
        if (DM.xCondicionesTIPO.AsString = 'CAF') then
           Colorear := ((UpperCase(Column.FieldName) = 'AGRUPACION') or (UpperCase(Column.FieldName) = 'FAMILIA'))
        else
        if (DM.xCondicionesTIPO.AsString = 'CPA') then
           Colorear := ((UpperCase(Column.FieldName) = 'PERFIL') or (UpperCase(Column.FieldName) = 'ARTICULO'))
        else
        if (DM.xCondicionesTIPO.AsString = 'CPF') then
           Colorear := ((UpperCase(Column.FieldName) = 'PERFIL') or (UpperCase(Column.FieldName) = 'FAMILIA'))
        else
        if (DM.xCondicionesTIPO.AsString = 'CAR') then
           Colorear := (UpperCase(Column.FieldName) = 'ARTICULO')
        else
        if (DM.xCondicionesTIPO.AsString = 'CFA') then
           Colorear := (UpperCase(Column.FieldName) = 'FAMILIA')
        else
        if (DM.xCondicionesTIPO.AsString = 'CAG') then
           Colorear := (UpperCase(Column.FieldName) = 'AGRUPACION')
        else
        if (DM.xCondicionesTIPO.AsString = 'CPE') then
           Colorear := (UpperCase(Column.FieldName) = 'PERFIL');

        if (Colorear) then
           ColorResaltado(Canvas)
        else
        begin
           if ((UpperCase(Column.FieldName) = 'ALTA') or (UpperCase(Column.FieldName) = 'BAJA')) then
           begin
              if (DM.xCondicionesACTIVO.AsInteger = 0) then
                 ColorBloqueado(Canvas)
              else
              if ((DM.xCondicionesALTA.AsDateTime < Now) and (DM.xCondicionesBAJA.AsDateTime >= Today)) then
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

procedure TFMArticulos.TSCondicionesShow(Sender: TObject);
begin
  inherited;
  DM.AbrirCondiciones;
end;

procedure TFMArticulos.AModeloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AModelosTallas,
     'ID_A_M = ' + IntToStr(DM.QMArticulosID_A_M.AsInteger));
end;

procedure TFMArticulos.TButtRecalculaStockNroSerieClick(Sender: TObject);
begin
  inherited;
  DM.RecalculaStock(16, True);
end;

procedure TFMArticulos.BCrearCodigoBarraClick(Sender: TObject);
begin
  inherited;
  DM.CrearCodigoBarra;
end;

procedure TFMArticulos.BCrearCodigoBarraEAN13Click(Sender: TObject);
begin
  inherited;
  DM.CrearCodigoBarraEAN13;
end;

procedure TFMArticulos.DBStockSerieDblClick(Sender: TObject);
begin
  inherited;
  // Ir a numero de serie
  FMain.EjecutaAccion(FMain.ASerializacion, 'EMPRESA=' + REntorno.EmpresaStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ALMACEN = ''' + DM.QMNroSerieALMACEN.AsString + ''' AND ARTICULO = ''' + DM.QMNroSerieARTICULO.AsString + ''' AND NSERIE= ''' + DM.QMNroSerieNSERIE.AsString + '''');
end;

procedure TFMArticulos.DBStockSerieDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'NSERIE') then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.DBEFTipoArticuloChange(Sender: TObject);
begin
  inherited;
  ETitTipoArticulo.Text := DameTituloTipoArticulo(DBEFTipoArticulo.Text);
end;

procedure TFMArticulos.CBCalcularPMPMovimientosChange(Sender: TObject);
begin
  inherited;
  DM.CalcularPMPMovimientos := CBCalcularPMPMovimientos.Checked;
  DM.AbrirStockMovimientos;
end;

procedure TFMArticulos.NavStocksBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  IdMovStock := DM.QMMovimientosStockID_MOV_STOCK.AsInteger;
end;

procedure TFMArticulos.NavStocksClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  Posicionar(DM.QMMovimientosStock, 'ID_MOV_STOCK', IdMovStock);
end;

procedure TFMArticulos.DBCBControlStockChange(Sender: TObject);
begin
  inherited;
  // DBCPreparable.Enabled := DBCBControlStock.Checked;
end;

procedure TFMArticulos.DBEFTipoIBAEBusqueda(Sender: TObject);
begin
  inherited;
  DBEFTipoIBAE.CondicionBusqueda := 'ACTIVO=1 AND PAIS = ''' + REntorno.Pais + '''';
end;

procedure TFMArticulos.DBEFTipoIBAEChange(Sender: TObject);
begin
  inherited;
  ETipoIBAE.Text := DameTituloIBAE(StrToIntDef(DBEFTipoIBAE.Text, 0));
end;

procedure TFMArticulos.BClipboardClick(Sender: TObject);
begin
  inherited;
  DM.QMArticulosIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMArticulos.DBEFRibeteDefectoChange(Sender: TObject);
begin
  inherited;
  LFHYDBDRibeteDefecto.ActualizaDatos('Z_RIBETE_DEFECTO', DBEFRibeteDefecto.Text);
end;

procedure TFMArticulos.DBEFIdMarcaChange(Sender: TObject);
begin
  inherited;
  EMarca.Text := DameTituloMarcaModelo(StrToIntDef(DBEFIdMarca.Text, 0));
end;

procedure TFMArticulos.DBEFFormulaDefectoChange(Sender: TObject);
begin
  inherited;
  EFormulaDefecto.Text := DameTituloFormula(StrToIntDef(DBEFFormulaDefecto.Text, 0));
end;

procedure TFMArticulos.DBEFTipoImpuestoAdicionalChange(Sender: TObject);
begin
  inherited;
  ETipoImpuestoAdicional.Text := DameTituloImpuestoAdicional(StrToIntDef(DBEFTipoImpuestoAdicional.Text, 0));
end;

procedure TFMArticulos.TSCombinacionesShow(Sender: TObject);
begin
  inherited;
  DM.AbrirCombinaciones;

  DM.RellenaAtributos('MAR', CBMarca.Items);
  // Rellenara los modelos segun la marca seleccionada
  CBMarcaChange(Sender);
  // Rellenara las Especificaciones segun el modelo seleccionado
  CBModeloChange(Sender);

  DM.RellenaAtributos('BOM', CBBombin.Items);
  DM.RellenaAtributos('LLA', CBLlave.Items);

  with CBTipoVehiculo.Items do
  begin
     Clear;
     AddObject(_('Sin vehiculo'), Pointer(0));
     AddObject(_('Auto'), Pointer(1));
     AddObject(_('Furgoneta'), Pointer(2));
     AddObject(_('Furgon'), Pointer(3));
     AddObject(_('Otro'), Pointer(4));
  end;
end;

procedure TFMArticulos.BCrearCombinacionClick(Sender: TObject);
var
  IdMarca : integer;
  IdModelo : integer;
  IdEspecificacion : integer;
  IdBombin : integer;
  IdLlave : integer;
  IdTipoVehiculo : integer;
begin
  inherited;

  IdMarca := 0;
  IdModelo := 0;
  IdEspecificacion := 0;
  IdBombin := 0;
  IdLlave := 0;
  IdTipoVehiculo := 0;

  if (CBMarca.ItemIndex >= 0) then
     IdMarca := integer(CBMarca.Items.Objects[CBMarca.ItemIndex]);
  if (CBModelo.ItemIndex >= 0) then
     IdModelo := integer(CBModelo.Items.Objects[CBModelo.ItemIndex]);
  if (CBEspecificacion.ItemIndex >= 0) then
     IdEspecificacion := integer(CBEspecificacion.Items.Objects[CBEspecificacion.ItemIndex]);
  if (CBBombin.ItemIndex >= 0) then
     IdBombin := integer(CBBombin.Items.Objects[CBBombin.ItemIndex]);
  if (CBLlave.ItemIndex >= 0) then
     IdLlave := integer(CBLlave.Items.Objects[CBLlave.ItemIndex]);
  if (CBTipoVehiculo.ItemIndex >= 0) then
     IdTipoVehiculo := integer(CBTipoVehiculo.Items.Objects[CBTipoVehiculo.ItemIndex]);

  DM.CrearCombinacion(IdMarca, IdModelo, IdEspecificacion, IdBombin, IdLlave, IdTipoVehiculo);
end;

procedure TFMArticulos.DBGCombinacionesDblClick(Sender: TObject);
begin
  // inherited;

  // Doble click copia los datos a los combos para facilitar la creacion de combinaciones similares.

  CBMarca.ItemIndex := CBMarca.Items.IndexOfObject(Pointer(DM.xCombinacionesID_MARCA.AsInteger));
  // CBMarca.ItemIndex := CBMarca.Items.IndexOf(DM.xCombinacionesMARCA.AsString);

  // Rellenara los modelos segun la marca seleccionada
  CBMarcaChange(Sender);
  CBModelo.ItemIndex := CBModelo.Items.IndexOfObject(Pointer(DM.xCombinacionesID_MODELO.AsInteger));
  // CBModelo.ItemIndex := CBModelo.Items.IndexOf(DM.xCombinacionesMODELO.AsString);

  // Rellenara las Especificaciones segun el modelo seleccionado
  CBModeloChange(Sender);
  CBEspecificacion.ItemIndex := CBEspecificacion.Items.IndexOfObject(Pointer(DM.xCombinacionesID_ESPECIFICACION.AsInteger));
  // CBEspecificacion.ItemIndex := CBEspecificacion.Items.IndexOf(DM.xCombinacionesESPECIFICACION.AsString);

  CBBombin.ItemIndex := CBBombin.Items.IndexOfObject(Pointer(DM.xCombinacionesID_BOMBIN.AsInteger));
  // CBBombin.ItemIndex := CBBombin.Items.IndexOf(DM.xCombinacionesBOMBIN.AsString);
  CBLlave.ItemIndex := CBLlave.Items.IndexOfObject(Pointer(DM.xCombinacionesID_LLAVE.AsInteger));
  // CBLlave.ItemIndex := CBLlave.Items.IndexOf(DM.xCombinacionesLLAVE.AsString);

  CBTipoVehiculo.ItemIndex := CBTipoVehiculo.Items.IndexOfObject(Pointer(DM.xCombinacionesID_TIPO_VEHICULO.AsInteger));
  // CBTipoVehiculo.ItemIndex := CBTipoVehiculo.Items.IndexOf(DM.xCombinacionesTIPO_VEHICULO.AsString);
end;

procedure TFMArticulos.CBMarcaChange(Sender: TObject);
var
  IdMarca : integer;
begin
  inherited;
  IdMarca := 0;

  if (CBMarca.ItemIndex >= 0) then
     IdMarca := integer(CBMarca.Items.Objects[CBMarca.ItemIndex]);

  DM.RellenaAtributos('MOD', CBModelo.Items, 'MAR', IdMarca);
end;

procedure TFMArticulos.CBModeloChange(Sender: TObject);
{
var
  IdModelo : integer;
}
begin
  inherited;
{
  IdModelo := 0;

  if (CBModelo.ItemIndex >= 0) then
     IdModelo := integer(CBModelo.Items.Objects[CBModelo.ItemIndex]);
}
  // Las especificaciones pueden ser compartidas por varios marcas/modelos
  DM.RellenaAtributos('ESP', CBEspecificacion.Items{, 'MOD', IdModelo});
end;

procedure TFMArticulos.SBAImagenDblClick(Sender: TObject);
begin
  inherited;
  MuestraImagen(DM.QMArticulosIMAGEN.AsInteger);
end;

procedure TFMArticulos.FormResize(Sender: TObject);
begin
  inherited;
  DBCtrlFabricacion.RowCount := DBCtrlFabricacion.Height div 26;
end;

procedure TFMArticulos.TButtRecalcularStockClick(Sender: TObject);
begin
  inherited;
  DM.RecalculaStockArt(DBEArticulo.Text);

  // Refresco solapa de stocks
  if (PCMain.ActivePage = TSStocks) then
  begin
     DM.CerrarStock;
     TSStocksShow(Sender);

     DM.CerrarDataSetsStock;
     tmrStockFuturo.Enabled := False;

     if (PCStocks.ActivePage = TSStocksUbicaciones) then
        DM.AbrirStockUbicaciones;
     if (PCStocks.ActivePage = TSStocksLote) then
        DM.AbrirStockLote;
     if (PCStocks.ActivePage = TSStockNroSerie) then
        DM.AbrirStockNroSerie;
     if (PCStocks.ActivePage = TSStockNroSerieKRI) then
        DM.AbrirStockNroSerieKRI;
     if (PCStocks.ActivePage = TSStockFuturo) then
     begin
        DM.AbrirStockFuturo(CBSepararAlmacenes.Checked);
        tmrStockFuturo.Enabled := False;
        tmrStockFuturo.Enabled := True;
     end;
     if (PCStocks.ActivePage = TSMovimientosStock) then
     begin
        DM.CalcularPMPMovimientos := CBCalcularPMPMovimientos.Checked;
        DM.AbrirStockMovimientos;
     end;
  end;
end;

procedure TFMArticulos.BECCargarImagenPrestashopClick(Sender: TObject);
begin
  inherited;
  { TODO : Ver que hay que hacer aqui.}
  // DM.QMArticulosIMAGEN.AsInteger := DMMain.ImportarImagen('');
end;

procedure TFMArticulos.BECClipboardPrestashopClick(Sender: TObject);
begin
  inherited;
  { TODO : Ver que hay que hacer aqui.}
  // DM.QMArticulosIMAGEN.AsInteger := DMMain.ImportarImagenDesdeClipboard;
end;

procedure TFMArticulos.DBImagenECPrestashopChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSECommerce) then
  begin
     RefrescarImagen(ImagenECPrestashop, StrToIntDef(DBImagenECPrestashop.Text, 0));
     ETituloImagenECPrestashop.Text := DameTituloImagen(StrToIntDef(DBImagenECPrestashop.Text, 0));
  end;
end;

procedure TFMArticulos.TSECommerceShow(Sender: TObject);
begin
  inherited;
  DM.AbrirECommerce;
  TSECPrestashop.TabVisible := Param_MODSINC003;
  TSECWoocommerce.TabVisible := Param_MODSINC019;
  if (PCECommerce.ActivePage = TSECPrestashop) then
  begin
     RefrescarImagen(ImagenECPrestashop, StrToIntDef(DBImagenECPrestashop.Text, 0));
     ETituloImagenECPrestashop.Text := DameTituloImagen(StrToIntDef(DBImagenECPrestashop.Text, 0));
  end
  else
  if (PCECommerce.ActivePage = TSECWoocommerce) then
  begin
     RefrescarImagen(ImagenECWoocommerce, StrToIntDef(DBImagenWC.Text, 0));
     ETituloImagenWC.Text := DameTituloImagen(StrToIntDef(DBImagenWC.Text, 0));
  end;
end;

procedure TFMArticulos.EFFijarTiendaPrestashopChange(Sender: TObject);
begin
  inherited;
  DM.FiltrarECommercePrestashop(StrToIntDef(EFFijarTiendaPrestashop.Text, 0));
end;

procedure TFMArticulos.BtnSubirPrestashopClick(Sender: TObject);
begin
  inherited;
  if (DM.QMArticuloECPrestashop.State in [dsInsert, dsEdit]) then
     DM.QMArticuloECPrestashop.Post;

  if (DM.QMArticuloECPrestashopID_A.AsInteger = 0) then
     ShowMessage(_('Debe crear un registro para subirlo'))
  else
  if (DM.QMArticuloECPrestashopID_PRODUCT.AsInteger <> 0) then
     ShowMessage(_('Ya existe un producto para este articulo'))
  else
  begin
     AbreData(TDMSincronizacionTienda, DMSincronizacionTienda);
     try
        DMSincronizacionTienda.FiltraTienda(DM.QMConfECPrestashopID.AsInteger);
        if (DMSincronizacionTienda.InicializaWebService) then
        begin
           DMSincronizacionTienda.CrearUnArticulo(DM.QMArticulosID_A.AsInteger);
           DMSincronizacionTienda.SaveLog('Sincronizacion' + FormatDateTime('_yyyymmdd_hhnnss', Now) + '.Log');
        end
        else
           ShowMessage(_('No se pudo inicializar el servicio web'));
     finally
        CierraData(DMSincronizacionTienda);
     end;

     // Defresco datos
     DM.QMArticuloECPrestashop.Close;
     DM.QMArticuloECPrestashop.Open;
  end;
end;

procedure TFMArticulos.BtnSubirWCClick(Sender: TObject);
var
  IdProducto : integer;
  TarifaIVAIncluido : boolean;
  Precio : double;
  CodigoRespuesta : integer;
begin
  inherited;

  IdProducto := 0;
  if (DM.QMArticuloECWoocommerce.State in [dsInsert, dsEdit]) then
     DM.QMArticuloECWoocommerce.Post;

  if (DM.QMArticuloECWoocommerceID_A.AsInteger = 0) then
     ShowMessage(_('Debe crear un registro para subirlo'))
  else
  begin
     AbreData(TDMSincronizacionTiendaWoocommerce, DMSincronizacionTiendaWoocommerce);
     try
        DMSincronizacionTiendaWoocommerce.FiltraTienda(DM.QMConfECWoocommerceID.AsInteger);
        if (DMSincronizacionTiendaWoocommerce.InicializaWebService) then
        begin
           if (DM.QMArticulosWEB.AsInteger = 1) then
           begin
              //Verificamos que el articulo exista para crearlo o modificar el precio
              if (DM.QMArticuloECWoocommerceID_PRODUCT.AsInteger > 0) then
              begin
                 TarifaIVAIncluido := TarifaEsIvaIncluido(DMSincronizacionTiendaWoocommerce.QMConfWoocommerceTARIFA.AsString);
                 Precio := DM.QMArticuloECWoocommercePRECIO.AsFloat;
                 if TarifaIVAIncluido then
                 begin
                    // Quitamos la cuota del IVA dejando 6 dígitos decimales.
                    Precio := SimpleRoundTo(Precio / (1 + DM.xTipoIvaP_IVA.AsFloat / 100), -6);
                 end;
                 CodigoRespuesta := DMSincronizacionTiendaWoocommerce.SincronizaPrecioUnArticulo(Precio, DM.QMArticuloECWoocommerceID_PRODUCT.AsInteger, DM.QMArticuloECWoocommerceID_VARIATION.AsInteger, DM.QMArticulosARTICULO.AsString, DM.QMArticuloECWoocommerceTITULO.AsString);
                 if (CodigoRespuesta <> 200) then
                    ShowMessage(_('No se ha podido actualizar el producto en Woocommerce'))
                 else
                    ShowMessage(_('Se ha modificado con exito el producto: ' + DM.QMArticulosARTICULO.AsString + ' - ID Producto:' + IntToStr(IdProducto)));
              end
              else
              begin
                 IdProducto := DMSincronizacionTiendaWoocommerce.CrearUnArticulo(DM.QMArticulosID_A.AsInteger);
                 if (IdProducto > 0) then
                    ShowMessage(_('Se ha creado con exito el producto: ' + DM.QMArticulosARTICULO.AsString + ' - ID Producto:' + IntToStr(IdProducto)))
                 else
                    ShowMessage(_('No se ha podido crear el producto' + DM.QMArticulosARTICULO.AsString));
              end;
           end
           else
              ShowMessage(_('El producto no esta autorizado para la Web'));
        end
        else
           ShowMessage(_('No se pudo inicializar el servicio web'));
     finally
        CierraData(DMSincronizacionTiendaWoocommerce);
     end;

     // Defresco datos
     DM.QMArticuloECWoocommerce.Close;
     DM.QMArticuloECWoocommerce.Open;
  end;
(*
  AbreData(TDMSincronizacionTiendaWoocommerce, DMSincronizacionTiendaWoocommerce);
  try
     DMSincronizacionTiendaWoocommerce.FiltraTienda(DM.QMConfECWoocommerceID.AsInteger);
     if (DMSincronizacionTiendaWoocommerce.InicializaWebService) then
     begin
        DMSincronizacionTiendaWoocommerce.CrearUnArticulo(DM.QMArticulosID_A.AsInteger);
        DMSincronizacionTiendaWoocommerce.SaveLog('Sincronizacion' + FormatDateTime('_yyyymmdd_hhnnss', Now) + '.Log');
     end
     else
        ShowMessage(_('No se pudo inicializar el servicio web'));
  finally
     CierraData(DMSincronizacionTiendaWoocommerce);
  end;

  // Defresco datos
  DM.QMArticuloECWoocommerce.Close;
  DM.QMArticuloECWoocommerce.Open;
*)
end;

procedure TFMArticulos.DBGStockUbicacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.DBImagenWCChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSECommerce) then
  begin
     RefrescarImagen(ImagenECWoocommerce, StrToIntDef(DBImagenWC.Text, 0));
     ETituloImagenWC.Text := DameTituloImagen(StrToIntDef(DBImagenWC.Text, 0));
  end;
end;

procedure TFMArticulos.DBEFSeccionChange(Sender: TObject);
begin
  inherited;
  ETituloSeccion.Text := DameTituloSeccion(DBEFSeccion.Text);
end;

procedure TFMArticulos.PNLAvisosResize(Sender: TObject);
var
  Altura, Anchura : integer;
begin
  inherited;
  Altura := PNLAvisos.Height div 5;
  Anchura := PNLAvisos.Width div 2;

  DBCBAvisoActivoOFC.Top := (Altura * 0) + 5;
  DBCBAvisoActivoOFC.Left := 10;
  DBCBAvisoActivoPEC.Top := (Altura * 1) + 5;
  DBCBAvisoActivoPEC.Left := 10;
  DBCBAvisoActivoALB.Top := (Altura * 2) + 5;
  DBCBAvisoActivoALB.Left := 10;
  DBCBAvisoActivoFAC.Top := (Altura * 3) + 5;
  DBCBAvisoActivoFAC.Left := 10;

  DBMAvisoOFC.Top := DBCBAvisoActivoOFC.Top + DBCBAvisoActivoOFC.Height;
  DBMAvisoOFC.Left := 10;
  DBMAvisoOFC.Width := Anchura - 20;
  DBMAvisoOFC.Height := Altura - DBCBAvisoActivoOFC.Height - 10;

  DBMAvisoPEC.Top := DBCBAvisoActivoPEC.Top + DBCBAvisoActivoPEC.Height;
  DBMAvisoPEC.Left := 10;
  DBMAvisoPEC.Width := Anchura - 20;
  DBMAvisoPEC.Height := Altura - DBCBAvisoActivoPEC.Height - 10;

  DBMAvisoALB.Top := DBCBAvisoActivoALB.Top + DBCBAvisoActivoALB.Height;
  DBMAvisoALB.Left := 10;
  DBMAvisoALB.Width := Anchura - 20;
  DBMAvisoALB.Height := Altura - DBCBAvisoActivoALB.Height - 10;

  DBMAvisoFAC.Top := DBCBAvisoActivoFAC.Top + DBCBAvisoActivoFAC.Height;
  DBMAvisoFAC.Left := 10;
  DBMAvisoFAC.Width := Anchura - 20;
  DBMAvisoFAC.Height := Altura - DBCBAvisoActivoFAC.Height - 10;

  DBCBAvisoActivoOFP.Top := (Altura * 0) + 5;
  DBCBAvisoActivoOFP.Left := Anchura + 10;
  DBCBAvisoActivoOFP.Width := Anchura - 20;
  DBCBAvisoActivoOCP.Top := (Altura * 1) + 5;
  DBCBAvisoActivoOCP.Left := Anchura + 10;
  DBCBAvisoActivoOCP.Width := Anchura - 20;
  DBCBAvisoActivoPEP.Top := (Altura * 2) + 5;
  DBCBAvisoActivoPEP.Left := Anchura + 10;
  DBCBAvisoActivoPEP.Width := Anchura - 20;
  DBCBAvisoActivoALP.Top := (Altura * 3) + 5;
  DBCBAvisoActivoALP.Left := Anchura + 10;
  DBCBAvisoActivoALP.Width := Anchura - 20;
  DBCBAvisoActivoFAP.Top := (Altura * 4) + 5;
  DBCBAvisoActivoFAP.Left := Anchura + 10;
  DBCBAvisoActivoFAP.Width := Anchura - 20;

  DBMAvisoOFP.Top := DBCBAvisoActivoOFP.Top + DBCBAvisoActivoOFP.Height;
  DBMAvisoOFP.Left := Anchura + 10;
  DBMAvisoOFP.Height := Altura - DBCBAvisoActivoOFP.Height - 10;
  DBMAvisoOFP.Width := Anchura - 20;

  DBMAvisoOCP.Top := DBCBAvisoActivoOCP.Top + DBCBAvisoActivoOCP.Height;
  DBMAvisoOCP.Left := Anchura + 10;
  DBMAvisoOCP.Height := Altura - DBCBAvisoActivoOCP.Height - 10;
  DBMAvisoOCP.Width := Anchura - 20;

  DBMAvisoPEP.Top := DBCBAvisoActivoPEP.Top + DBCBAvisoActivoPEP.Height;
  DBMAvisoPEP.Left := Anchura + 10;
  DBMAvisoPEP.Height := Altura - DBCBAvisoActivoPEP.Height - 10;
  DBMAvisoPEP.Width := Anchura - 20;

  DBMAvisoALP.Top := DBCBAvisoActivoALP.Top + DBCBAvisoActivoALP.Height;
  DBMAvisoALP.Left := Anchura + 10;
  DBMAvisoALP.Height := Altura - DBCBAvisoActivoALP.Height - 10;
  DBMAvisoALP.Width := Anchura - 20;

  DBMAvisoFAP.Top := DBCBAvisoActivoFAP.Top + DBCBAvisoActivoFAP.Height;
  DBMAvisoFAP.Left := Anchura + 10;
  DBMAvisoFAP.Height := Altura - DBCBAvisoActivoFAP.Height - 10;
  DBMAvisoFAP.Width := Anchura - 20;
end;

procedure TFMArticulos.TSAvisosShow(Sender: TObject);
begin
  inherited;
  DM.AbrirAvisos;
end;

procedure TFMArticulos.DBGCondicionesDblClick(Sender: TObject);
begin
  AbreForm(TFMCondicionesVenta, FMCondicionesVenta);
  FMCondicionesVenta.Posicionar(DM.xCondicionesTIPO.AsString, DM.xCondicionesRIG.AsInteger, DM.xCondicionesLINEA.AsInteger);
  // inherited;
end;

procedure TFMArticulos.TBCopiaAModeloClick(Sender: TObject);
begin
  inherited;
  DM.CopiaCodProveedorAModelo;
end;

procedure TFMArticulos.AFiltraAgrupacionExecute(Sender: TObject);
begin
  inherited;
  FFiltra_Articulos_Agr := TFFiltra_Articulos_Agr.Create(Self);
  if (FFiltra_Articulos_Agr.ShowModal = mrOk) then
     DM.FiltraSeleccion;
end;

procedure TFMArticulos.RestauraTabSeet;
begin
  if Assigned(TabSheet) then
  begin
     PCMain.ActivePage := TabSheet;
     if Assigned(PCMain.ActivePage.OnShow) then
        PCMain.ActivePage.OnShow(Self);
  end;
  TabSheet := nil;
end;

procedure TFMArticulos.SBArticuloDblClick(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := DBEArticulo.Text;
end;

procedure TFMArticulos.EFArticuloChange(Sender: TObject);
var
  AllowChange : boolean;
begin
  inherited;
  DM.FiltrarPorArticulo(EFArticulo.Text);

  AllowChange := True;
  PCMainChanging(PCMain, AllowChange);
  Reconectar_Tablas;

  if (EFArticulo.CanFocus) then
     EFArticulo.SetFocus;
end;

procedure TFMArticulos.EFBarrasChange(Sender: TObject);
var
  aux : string;
begin
  inherited;
  if (Trim(EFBarras.Text) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT ARTICULO, TITULO AS TITULO FROM VER_ARTICULOS_EF ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
           SQL.Add(' AND EJERCICIO = ' + REntorno.EjercicioStr);
           SQL.Add(' AND CANAL = ' + REntorno.CanalStr);
           SQL.Add(' AND ARTICULO = ''' + Trim(EFBarras.Text) + '''');
           SQL.Add(' UNION ');
           SQL.Add(' SELECT ARTICULO, CAST(BARRAS AS VARCHAR(60)) AS TITULO FROM ART_ARTICULOS_BARRAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
           SQL.Add(' AND BARRAS = ''' + Trim(EFBarras.Text) + ''' ');
           ExecQuery;
           aux := FieldByName['ARTICULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (EFArticulo.Text <> aux) then
        EFArticulo.Text := aux;
  end
  else
     EFArticulo.Text := '';
end;

procedure TFMArticulos.EFFiltroFamiliaChange(Sender: TObject);
begin
  inherited;
  DM.FiltrarPorFamilia(EFFiltroFamilia.Text);
end;

procedure TFMArticulos.EFClienteChange(Sender: TObject);
begin
  inherited;
  DM.FiltrarPorCliente(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMArticulos.EFProveedorChange(Sender: TObject);
begin
  inherited;
  DM.FiltrarPorProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMArticulos.ERefProveedorKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if (Key = #13) then
  begin
     TabSheet := PCMain.ActivePage;
     DM.FiltrarPorRefProveedor(ERefProveedor.Text);
     RestauraTabSeet;
     if (ERefProveedor.CanFocus) then
        ERefProveedor.SetFocus;
  end;
end;

procedure TFMArticulos.ERefClienteKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if (Key = #13) then
  begin
     TabSheet := PCMain.ActivePage;
     DM.FiltrarPorRefCliente(ERefCliente.Text);
     RestauraTabSeet;
     if (ERefCliente.CanFocus) then
        ERefCliente.SetFocus;
  end;
end;

procedure TFMArticulos.EFiltroTituloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;

  TMRFiltro.Enabled := False;
  TMRFiltro.Enabled := True;
end;

procedure TFMArticulos.HYDBGPedidosDeClienteTitleClick(Column: TColumn);
var
  IdCampo : integer;
begin
  inherited;
  IdCampo := HYDBGPedidosDeCliente.DataSource.DataSet.FieldByName(Column.FieldName).FieldNo;
  if (IdCampo = abs(OrdenPedidosCliente)) then
     OrdenPedidosCliente := OrdenPedidosCliente * (-1)
  else
     OrdenPedidosCliente := IdCampo;

  CalcularPedidos(nil);
end;

procedure TFMArticulos.HYDBGPedidosAProveedorTitleClick(Column: TColumn);
var
  IdCampo : integer;
begin
  inherited;
  IdCampo := HYDBGPedidosAProveedor.DataSource.DataSet.FieldByName(Column.FieldName).FieldNo;
  if (IdCampo = abs(OrdenPedidosProveedor)) then
     OrdenPedidosProveedor := OrdenPedidosProveedor * (-1)
  else
     OrdenPedidosProveedor := IdCampo;

  CalcularPedidos(nil);
end;

procedure TFMArticulos.HYDBGPropuestasTitleClick(Column: TColumn);
var
  IdCampo : integer;
begin
  inherited;
  IdCampo := HYDBGPropuestas.DataSource.DataSet.FieldByName(Column.FieldName).FieldNo;
  if (IdCampo = abs(OrdenPropuestas)) then
     OrdenPropuestas := OrdenPropuestas * (-1)
  else
     OrdenPropuestas := IdCampo;

  CalcularPropuesta(nil);
end;

procedure TFMArticulos.HYDBGPropuestasConfirTitleClick(Column: TColumn);
var
  IdCampo : integer;
begin
  inherited;
  IdCampo := HYDBGPropuestasConfir.DataSource.DataSet.FieldByName(Column.FieldName).FieldNo;
  if (IdCampo = abs(OrdenPropuestasConfirmadas)) then
     OrdenPropuestasConfirmadas := OrdenPropuestasConfirmadas * (-1)
  else
     OrdenPropuestasConfirmadas := IdCampo;

  CalcularPropuesta(nil);
end;

procedure TFMArticulos.TMRFiltroTimer(Sender: TObject);
begin
  inherited;
  TMRFiltro.Enabled := False;

  // Evito que TSTabla.OnShow cambie el foco
  TSTabla.OnShow := nil;
  try
     DM.FiltrarPorTituloArticulo(EFiltroTitulo.Text);
     RestauraTabSeet;
  finally
     // Restauro metodo
     TSTabla.OnShow := TSTablaShow;
  end;
end;

procedure TFMArticulos.EFiltroAgrupacionChange(Sender: TObject);
begin
  inherited;
  DM.FiltraAgrupacionDisponible(EFiltroAgrupacion.Text);
end;

procedure TFMArticulos.TSBultosShow(Sender: TObject);
begin
  inherited;
  DM.AbrirBultos;
end;

procedure TFMArticulos.HYDBGPedidosDeClienteDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     // Muestro las entradas resaltadas
     if (Column.FieldName = 'SERVIDO') then
     begin
        if (DM.xPedidosDeClientesSERVIDO.AsInteger = 1) then
           ColorResaltado3(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.HYDBGPedidosAProveedorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     // Muestro las entradas resaltadas
     if (Column.FieldName = 'LINEA_SERVIDA') then
     begin
        if (DM.xPedidosAProveedorLINEA_SERVIDA.AsInteger = 1) then
           ColorResaltado3(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('ART', DM.QMArticulosID_A.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosArticulo.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMArticulos.DBGCondicionesProvDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (DM.QMCondicionesTIPO.AsString = 'PRA') then
           Colorear := (UpperCase(Column.FieldName) = 'ARTICULO');
        if (DM.QMCondicionesTIPO.AsString = 'PRF') then
           Colorear := (UpperCase(Column.FieldName) = 'FAMILIA');
        if (DM.QMCondicionesTIPO.AsString = 'PRG') then
           Colorear := (UpperCase(Column.FieldName) = 'AGRUPACION');

        if (Colorear) then
           ColorResaltado(Canvas)
        else
        begin
           if ((UpperCase(Column.FieldName) = 'ALTA') or (UpperCase(Column.FieldName) = 'BAJA')) then
           begin
              if (DM.QMCondicionesACTIVO.AsInteger = 0) then
                 ColorBloqueado(Canvas)
              else
              if ((DM.QMCondicionesALTA.AsDateTime < Now) and (DM.QMCondicionesBAJA.AsDateTime >= Today)) then
                 ColorResaltado2(Canvas)
              else
                 ColorBloqueado(Canvas);
           end
           else
           if (((DM.QMCondicionesTIPO.AsString = 'PRF') or (DM.QMCondicionesTIPO.AsString = 'PRG')) and
              ((UpperCase(Column.FieldName) = 'PRIORIDAD') or (UpperCase(Column.FieldName) = 'PEDIDO_MINIMO') or (UpperCase(Column.FieldName) = 'PEDIDO_MINIMO') or (UpperCase(Column.FieldName) = 'PEDIDO_OPTIMO') or (UpperCase(Column.FieldName) = 'DIAS_ENTREGA'))) then
              ColorInactivo(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.tmrStockFuturoTimer(Sender: TObject);
begin
  inherited;
  // Trato de refrescar la transaccion RW de Stock Futuro para evitar congestionar la base de datos
  tmrStockFuturo.Enabled := False;
  try
     DM.FiltraStockFuturoTransaccion;
  finally
     tmrStockFuturo.Enabled := True;
  end;
end;

procedure TFMArticulos.DBEFEstrategiaCompraChange(Sender: TObject);
begin
  inherited;
  EEstrategiaCompra.Text := DameTituloEstrategiaCompra(StrToIntDef(DBEFEstrategiaCompra.Text, 0));
end;

procedure TFMArticulos.DBEFIEPNRClaveProductoChange(Sender: TObject);
begin
  inherited;
  EIEPNRClaveProducto.Text := DameTituloIEPNRClaveProducto(DBEFIEPNRClaveProducto.Text);
  EIEPNRClaveProducto.Hint := EIEPNRClaveProducto.Text;
end;

procedure TFMArticulos.TSAgrupacionResize(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMArticulos.TSProveedoresResize(Sender: TObject);
begin
  inherited;
  DBCGProveedores.RowCount := DBCGProveedores.Height div 26;
end;

procedure TFMArticulos.TSFabricacionResize(Sender: TObject);
begin
  inherited;
  DBCtrlFabricacion.RowCount := DBCtrlFabricacion.Height div 26;
end;

procedure TFMArticulos.PNLWooCommerceMiddleResize(Sender: TObject);
begin
  inherited;
  PNLWooCommerceDescCorta.Height := PNLWooCommerceMiddle.Height div 2;
end;

procedure TFMArticulos.PNLPrestashopMiddleResize(Sender: TObject);
begin
  inherited;
  PNLPrestashopDescCorta.Height := PNLPrestashopMiddle.Height div 2;
end;

procedure TFMArticulos.DBGTarifasProveedorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     // Muestro las entradas resaltadas
     if ((DM.QMMovimientosStockTIPO_OPER.AsString = 'E') or (DM.QMMovimientosStockTIPO_OPER.AsString = 'D')) then
        ColorResaltado2(Canvas)
     else
        ColorInfo(Canvas);

     if (UpperCase(Column.FieldName) = 'FECHA_INICIO') or (UpperCase(Column.FieldName) = 'FECHA_FINAL') then
     begin
        if (DataSource.DataSet.FieldByName('FECHA_INICIO').AsDateTime <= Today) and (DataSource.DataSet.FieldByName('FECHA_FINAL').AsDateTime > Today) then
           ColorInfo(Canvas)
        else
           ColorError(Canvas);
     end
     else
     if (Column.FieldName = 'MONEDA') then
     begin
        if (DataSource.DataSet.FieldByName(Column.FieldName).AsString = REntorno.Moneda) then
           ColorInfo(Canvas)
        else
           ColorResaltado3(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.DBGPictogramaRowChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSImagenes) then
     RefrescarImagen(ImgPictograma, DM.QMPictogramaIMAGEN.AsInteger);
end;

procedure TFMArticulos.DBEArtImagenChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSImagenes) then
     RefrescarImagen(ImgPictograma, DM.QMPictogramaIMAGEN.AsInteger);
end;

procedure TFMArticulos.NavPictogramasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbPost, nbRefresh] then
     RefrescarImagen(ImgPictograma, DM.QMPictogramaIMAGEN.AsInteger);
end;

procedure TFMArticulos.DBEFBlisterBusqueda(Sender: TObject);
begin
  inherited;
  DBEFBlister.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMArticulos.DBEFBlisterChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFBlister.Text) <> '') then
  begin
     EBlister.Text := DameTituloArticulo(DBEFBlister.Text);

     // Solapa TSPrecios
     EBlisterPrecio.Text := DBEFBlister.Text;
     ETituloBlisterPrecio.Text := EBlister.Text;
     PNLBlister.Visible := True;
     if (PCMain.ActivePage = TSPrecios) then
        EPrecioBlisterPrecio.Text := FormatFloat(',0.00', DMMain.DamePrecioCosteArticulo(DBEFBlister.Text));
  end
  else
  begin
     EBlister.Text := '';

     // Solapa TSPrecios
     EBlisterPrecio.Text := '';
     ETituloBlisterPrecio.Text := '';
     PNLBlister.Visible := False;
  end;
end;

procedure TFMArticulos.AFiltraEscandalloProdSimpComponenteExecute(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  // El parametro empresa se rellena cuando se filtra el escandallo
  Filtro := '(EXISTS(SELECT ARTICULO FROM ART_ARTICULOS_ESC_PROD_DETALLE WHERE EMPRESA = C.EMPRESA AND ARTICULO = C.ARTICULO AND NUMERO = C.NUMERO AND DETALLE = ''' + DBEArticulo.Text + '''))';
  FMain.EjecutaAccion(FMain.AEscandalloProd, Filtro);
end;

procedure TFMArticulos.DBEFProyectoArtChange(Sender: TObject);
begin
  inherited;
  EProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyectoArt.Text, 0));
end;

procedure TFMArticulos.PCMainChange(Sender: TObject);
begin
  inherited;
  // Para refrescar el precio del blister al activar la pestaña TSPrecios
  DBEFBlisterChange(Sender);
end;

procedure TFMArticulos.DBEEnvaseEAN13Change(Sender: TObject);
begin
  inherited;

  try
     if (Length(DBEEnvaseEAN13.Text) <> 13) or (not CodigoEANValido(DBEEnvaseEAN13.Text)) then
        ColorError(DBEEnvaseEAN13)
     else
        ColorEdicion(DBEEnvaseEAN13);
  except
     ColorError(DBEEnvaseEAN13);
  end;
end;

procedure TFMArticulos.DBECajaDUN14Change(Sender: TObject);
begin
  inherited;

  try
     if (Length(DBECajaDUN14.Text) <> 14) or (not CodigoEANValido(DBECajaDUN14.Text)) then
        ColorError(DBECajaDUN14)
     else
        ColorEdicion(DBECajaDUN14);
  except
     ColorError(DBECajaDUN14);
  end;
end;

procedure TFMArticulos.DBGFCodBarraDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'BARRAS') and (DataSource.DataSet.FieldByName('TIPO').AsInteger in [2, 3, 6])) then
        begin
           try
              if CodigoEANValido(DataSource.DataSet.FieldByName('BARRAS').AsString) then
                 ColorEdicion(Canvas)
              else
                 ColorError(Canvas);
           except
              ColorError(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMArticulos.TSLogisticaShow(Sender: TObject);
begin
  inherited;
  DM.AbrirLogistica;
  // Pinta fondo (validacion) para codigos de barra
  DBEEnvaseEAN13Change(Sender);
  DBECajaDUN14Change(Sender);
end;

procedure TFMArticulos.BLogisticaAsignarEAN13Click(Sender: TObject);
begin
  inherited;
  DM.AsignarEAN13(DBEEnvaseEAN13.Text);
end;

procedure TFMArticulos.BLogisticaAsignarDUN14Click(Sender: TObject);
begin
  inherited;
  DM.AsignarDUN14(DBECajaDUN14.Text);
end;

procedure TFMArticulos.BLogisticaAsignarMedidasClick(Sender: TObject);
var
  Peso, Alto, Ancho, Fondo : double;
begin
  inherited;
  Peso := StrToFloatDef(DBEEnvasePesoGr.Text, 0);
  Alto := StrToFloatDef(DBEEnvaseAltoCm.Text, 0);
  Ancho := StrToFloatDef(DBEEnvaseAnchoCm.Text, 0);
  Fondo := StrToFloatDef(DBEEnvaseFondoCm.Text, 0);

  DM.AsignarMedidas(Peso, Alto, Ancho, Fondo);
end;

procedure TFMArticulos.BCopiarEnlaceClick(Sender: TObject);
begin
  inherited;
  DMMain.CargarClipboardTexto('https://eginer.es/ficha-producto/' + Trim(DBEArticulo.Text));
end;

procedure TFMArticulos.TBCopiarImagenPortapapelesClick(Sender: TObject);
begin
  inherited;
  DMMain.CargarClipboardImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMArticulos.TSCaracteristicasShow(Sender: TObject);
begin
  inherited;
  DM.AbrirCaracteristicas;
end;

end.
