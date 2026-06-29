{ TODO : Reemplazar FMFicherosCliente por FMAdjunto (PRO_FICHEROS_PEDIDOS por EMP_ADJUNTOS) }

unit UFMain;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Menus, ToolWin, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Buttons,
  IOFFind, FIBEditFind, UFIBDBEditFind, UFormGest, UControlEdit, ComObj,
  FR_Ctrls, FR_Dock, FR_DBOp, FR_Combo, FR_View, rxPlacemnt, ULFFormStorage,
  ULFActionList, ULFPageControl, ULFPanel, ULFToolBar, HYFIBQuery, FIBDataSetRO, DB,
  ExtActns, StdActns, FIBDatabase, FIBDataSet, Printers, frxPrinter, Registry;

type
  TBrowserEmulationAdjuster = class
  private
     class function GetExeName(): string;
  public
     class procedure SetBrowserEmulationDWORD(const Value: DWORD);
  end platform;

  TFMain = class(THYForm)
     ALMain: TLFActionList;
     StatBarMain: TStatusBar;
     ASalir: TAction;
     AAcerca: TAction;
     AUsuarios: TAction;
     AProvincias: TAction;
     ALocalidades: TAction;
     AContaEstructura: TAction;
     AContaCuentas: TAction;
     ACambiaUser: TAction;
     ACFGPrint: TAction;
     AUbicaciones: TAction;
     AEmpresas: TAction;
     AMonedas: TAction;
     AConfig: TAction;
     AContaMovimientos: TAction;
     AContaConceptos: TAction;
     ATerceros: TAction;
     APaises: TAction;
     ACanales: TAction;
     AContaExtracto: TAction;
     AFamilias: TAction;
     AAlmacenes: TAction;
     ATarifas: TAction;
     AArticulos: TAction;
     AContaBorrador: TAction;
     AContaDefBalances: TAction;
     AContaCuentasAnuales: TAction;
     ATipoIva: TAction;
     AModoIva: TAction;
     AMvStMan: TAction;
     MainMenu: TMainMenu;
     MIUsuarios: TMenuItem;
     MIUbicaciones: TMenuItem;
     MGVentas: TMenuItem;
     MGAlmacenes: TMenuItem;
     MSGListadosAlmacen: TMenuItem;
     MIDiarioStock: TMenuItem;
     MIInventario: TMenuItem;
     MGContabilidad: TMenuItem;
     MIContaBorrador: TMenuItem;
     MIContaExtracto: TMenuItem;
     MGAuxiliares: TMenuItem;
     MSGLocalidades: TMenuItem;
     MIPaises: TMenuItem;
     MIProvincias: TMenuItem;
     MILocalidades: TMenuItem;
     MICanales: TMenuItem;
     MIConceptos: TMenuItem;
     MIMonedas: TMenuItem;
     MGUtilidades: TMenuItem;
     MIConfig: TMenuItem;
     MICambiaUser: TMenuItem;
     MGVentanas: TMenuItem;
     MGAyuda: TMenuItem;
     MIAcerca: TMenuItem;
     MIContaMovimientos: TMenuItem;
     MIContaSumYSaldos: TMenuItem;
     MISeparador24: TMenuItem;
     MIRegIVA: TMenuItem;
     MIMvStMan: TMenuItem;
     MIFacturas: TMenuItem;
     APedidos: TAction;
     AAlbaranes: TAction;
     AFacturas: TAction;
     AContaDiario: TAction;
     AContaSumYSaldos: TAction;
     ARegIVA: TAction;
     AContaCierreYApertura: TAction;
     AContadores: TAction;
     MIContadores: TMenuItem;
     AContaPlantillas: TAction;
     ACambioMonedas: TAction;
     MICambioMonedas: TMenuItem;
     AClientes: TAction;
     AProveedores: TAction;
     MIClientes: TMenuItem;
     MIProveedores: TMenuItem;
     AFondo: TAction;
     MSGResultados: TMenuItem;
     MISeparador22: TMenuItem;
     AContaPGC: TAction;
     MIPGC: TMenuItem;
     MSGMonedas: TMenuItem;
     MSGSistema: TMenuItem;
     AAgentes: TAction;
     MIAgentes: TMenuItem;
     AAcreedores: TAction;
     MIAcreedores: TMenuItem;
     MGTesoreria: TMenuItem;
     ACartera: TAction;
     MICartera: TMenuItem;
     AFormaPago: TAction;
     MIFormaPago: TMenuItem;
     AContaCuentasIVA: TAction;
     AGenCanales: TAction;
     AGenSeries: TAction;
     AGenEjercicios: TAction;
     MIContaDefBalances: TMenuItem;
     MIContaDiario: TMenuItem;
     APropaga: TAction;
     MSGGestion: TMenuItem;
     AOfertas: TAction;
     MIOfertas: TMenuItem;
     MIPedidos: TMenuItem;
     MIAlbaranes: TMenuItem;
     APropPedidos: TAction;
     APedidosProv: TAction;
     MGCompras: TMenuItem;
     MIPedidosProv: TMenuItem;
     ARecepcionPedidos: TAction;
     MIRecepcionPedidos: TMenuItem;
     MISeparador12: TMenuItem;
     MIPropPedidos: TMenuItem;
     ABackup: TAction;
     ASeries: TAction;
     MISeries: TMenuItem;
     ACampanyas: TAction;
     MISeparador17: TMenuItem;
     AFacAlbaranes: TAction;
     MIFacAlbaranes: TMenuItem;
     AFacHistProcesos: TAction;
     MGEmpresas: TMenuItem;
     MIEmpresas: TMenuItem;
     MIGenEjercicios: TMenuItem;
     MIGenCanales: TMenuItem;
     MIGenSeries: TMenuItem;
     MIGenCampanyas: TMenuItem;
     MISeparador63: TMenuItem;
     MIFacHistProcesos: TMenuItem;
     MGAlmacenesAlmacenes: TMenuItem;
     MIFamilias: TMenuItem;
     MIArticulos: TMenuItem;
     MITarifas: TMenuItem;
     MIContaPlantillas: TMenuItem;
     MSGContables: TMenuItem;
     MGTerceros: TMenuItem;
     MITerceros: TMenuItem;
     PNLSistema: TLFPanel;
     PNLBotonesRapidos: TLFPanel;
     PNLPestanyas: TLFPanel;
     PCMain: TLFPageControl;
     TSTerceros: TTabSheet;
     TSEmpresa: TTabSheet;
     TSVentas: TTabSheet;
     TSCompras: TTabSheet;
     TSAlmacenes: TTabSheet;
     TSContabilidad: TTabSheet;
     TSImpuestos: TTabSheet;
     TSTesoreria: TTabSheet;
     MGImpuestos: TMenuItem;
     MISeparador78: TMenuItem;
     IOFBusqueda: TIOFFind;
     ABusqueda: TAction;
     APeriodosSistema: TAction;
     MIPeriodosSistema: TMenuItem;
     AGenPeriodos: TAction;
     MIGenPeriodos: TMenuItem;
     AAmortizaciones: TAction;
     AImprimeFacturas: TAction;
     MIImprimeFacturas: TMenuItem;
     ASysCuentas: TAction;
     MISysCuentas: TMenuItem;
     TBTerceros: TLFToolBar;
     TButtTerceros: TToolButton;
     TButtClientes: TToolButton;
     TButtProveedores: TToolButton;
     TButtAcreedores: TToolButton;
     TButtAgentes: TToolButton;
     TBEmpresas: TLFToolBar;
     TButtEmpresas: TToolButton;
     TButtEjercicios: TToolButton;
     TButtCanales: TToolButton;
     TButtSeries: TToolButton;
     TButtCampanyas: TToolButton;
     TButtPeriodos: TToolButton;
     TBVentas: TLFToolBar;
     TButtOfertas: TToolButton;
     TButtPedidos: TToolButton;
     TButtAlbaranes: TToolButton;
     TButtFacturas: TToolButton;
     TButtFacturar: TToolButton;
     TButtHistorico: TToolButton;
     TButtListarFacturas: TToolButton;
     TBCompras: TLFToolBar;
     TButtPedProv: TToolButton;
     Tx3: TToolButton;
     TButtPropPedidos: TToolButton;
     TButtRecepcion: TToolButton;
     TBAlmacenes: TLFToolBar;
     TButtAlmacenes: TToolButton;
     TButtFamilias: TToolButton;
     TButtArticulos: TToolButton;
     TButtTarifas: TToolButton;
     Tx4: TToolButton;
     TButtMovManStock: TToolButton;
     TButtPropaga: TToolButton;
     TBContabilidad: TLFToolBar;
     TButtBorrador: TToolButton;
     TButtMayor: TToolButton;
     TButtMovimientos: TToolButton;
     TButtDiaria: TToolButton;
     TButtPlantillas: TToolButton;
     Tx5: TToolButton;
     TButtCuAnuales: TToolButton;
     TButtCierreYApertura: TToolButton;
     TButtCuentas: TToolButton;
     TButtEstruct: TToolButton;
     TBImpuestos: TLFToolBar;
     TButtRegistrosIVA: TToolButton;
     TBTesoreria: TLFToolBar;
     TButtCartera: TToolButton;
     APerfiles: TAction;
     MIPerfiles: TMenuItem;
     AAjustes: TAction;
     MIAjustes: TMenuItem;
     TSInmovilizado: TTabSheet;
     TBInmovilizado: TLFToolBar;
     TButtAmortizaciones: TToolButton;
     ACentrosInventario: TAction;
     MGInmovilizados: TMenuItem;
     MICentrosInventario: TMenuItem;
     MIAmortizaciones: TMenuItem;
     TButtCentroInventario: TToolButton;
     ANewTarifas: TAction;
     TButtArticuloPorTarifa: TToolButton;
     TButtFacProv: TToolButton;
     TButtAlbProv: TToolButton;
     AFacturasProv: TAction;
     AAlbaranesProv: TAction;
     MIAlbaranesProv: TMenuItem;
     MIFacturasProv: TMenuItem;
     ALSTIVAListado: TAction;
     MISeparador27: TMenuItem;
     MILSTIVAListado: TMenuItem;
     TButtLstIvaListado: TToolButton;
     APerfilesUsuario: TAction;
     MIPerfilesUsuario: TMenuItem;
     TBUtilidades: TLFToolBar;
     TButtFondo: TToolButton;
     TButtSalir: TToolButton;
     TButtRemesas: TToolButton;
     ARemesas: TAction;
     MIRemesas: TMenuItem;
     APregMayorCantidad: TAction;
     MIPregMayorCantidad: TMenuItem;
     ALSTStockMinimo: TAction;
     MIStockMinimo: TMenuItem;
     ALSTDiarioStock: TAction;
     TButtFacturarAlbProv: TToolButton;
     AFacAlbaranesProv: TAction;
     MIFacAlbaranesProv: TMenuItem;
     AContaCuentasIRPF: TAction;
     ATipoIrpf: TAction;
     MIFacDirecta: TMenuItem;
     TButtEscandallo: TToolButton;
     AEscandallo: TAction;
     ABancos: TAction;
     TButtBancos: TToolButton;
     MITarifasPorArticulo: TMenuItem;
     MIPropaga: TMenuItem;
     MIEscandallo: TMenuItem;
     MIFacturaDirectaPro: TMenuItem;
     MIFacturasAcr: TMenuItem;
     Tx1: TToolButton;
     MIBancos: TMenuItem;
     MIStockResumido: TMenuItem;
     ALSTStockResumido: TAction;
     ALSTStockAlmacen: TAction;
     MIListadodeStocksPorAlmacen: TMenuItem;
     TButtRecibosPendientes: TToolButton;
     AListarCartera: TAction;
     ADiarioIVA: TAction;
     MIDiarioIVA: TMenuItem;
     MIListarCartera: TMenuItem;
     Tx2: TToolButton;
     MIContaCierreYApertura: TMenuItem;
     MIContaEstructura: TMenuItem;
     MIContaCuentasAnuales: TMenuItem;
     MISeparador23: TMenuItem;
     MIContaCuentas: TMenuItem;
     ALSTInventario: TAction;
     AAgrupacionPedidos: TAction;
     TButtAgrupacionPedidos: TToolButton;
     MIAgrupacionPedidos: TMenuItem;
     AUnidades: TAction;
     MIUnidades: TMenuItem;
     MIRenumera: TMenuItem;
     ARenumeraContabilidad: TAction;
     AGenBancos: TAction;
     MIGenBancos: TMenuItem;
     TButtCierraFacturas: TToolButton;
     ARazones: TAction;
     MIRazones: TMenuItem;
     TButtFacAcr: TToolButton;
     AFacturasAcr: TAction;
     ACierraFacturas: TAction;
     MICierraFacturas: TMenuItem;
     ABalance: TAction;
     ACuentasAnuales: TAction;
     AAGrupaciones: TAction;
     MIAgrupaciones: TMenuItem;
     ATiposDir: TAction;
     MITiposDir: TMenuItem;
     ATiposAcreedor: TAction;
     MISeparador80: TMenuItem;
     MIListador: TMenuItem;
     AListador: TAction;
     AProyectos: TAction;
     MIProyectos: TMenuItem;
     ACodigosBarras: TAction;
     MICodigosBarras: TMenuItem;
     TButtCondiciones: TToolButton;
     MITiposEfectos: TMenuItem;
     ATiposEfectos: TAction;
     APunteoAsientos: TAction;
     MIPunteoAsientos: TMenuItem;
     ATipoImpuestos: TAction;
     ATarifasProveedor: TAction;
     APropagaEmpresa: TAction;
     TButtPropagacion: TToolButton;
     MIPropagacionEmpresa: TMenuItem;
     MITarifasProveedor: TMenuItem;
     PopupTarifas: TPopupMenu;
     PMITarifas: TMenuItem;
     PMITarifasProveedor: TMenuItem;
     MITiposAcreedor: TMenuItem;
     TButtSaldos: TToolButton;
     ASaldos: TAction;
     MISaldos: TMenuItem;
     TButtFormasPago: TToolButton;
     AFormasPago: TAction;
     MISeparador10: TMenuItem;
     MIEmpFormasPago: TMenuItem;
     ACondAgentes: TAction;
     ACondAgeAgrup: TAction;
     ACondAgeCli: TAction;
     TButtCondAgentes: TToolButton;
     MICondAgentes: TMenuItem;
     TButtABCVentas: TToolButton;
     AABCVentas: TAction;
     MISalir: TMenuItem;
     TButtTercerosCuentas: TToolButton;
     ATercerosCuentas: TAction;
     AABCCompras: TAction;
     TButtABCCompras: TToolButton;
     MIABCVentas: TMenuItem;
     MIABCCompras: TMenuItem;
     TButtPagaRecAgrupados: TToolButton;
     APCRecAgrupados: TAction;
     MIPCRecAgrupados: TMenuItem;
     AAyudaenLinea: TAction;
     MIAyudaenLinea: TMenuItem;
     MITercerosCuentas: TMenuItem;
     APlazosGarantia: TAction;
     MIPlazosGarantia: TMenuItem;
     TSProduccion: TTabSheet;
     TBProduccion: TLFToolBar;
     TButtEscandalloProd: TToolButton;
     AEscandalloProd: TAction;
     TButtOrdenProduccion: TToolButton;
     AOrdenProduccion: TAction;
     ANuevoRecibo: TAction;
     TButtNuevoRecibo: TToolButton;
     MINuevoRecibo: TMenuItem;
     TButtFecha: TToolButton;
     ACambiaFecha: TAction;
     AFacAlbaranesProvDet: TAction;
     TButtFacAlbaranesProvDet: TToolButton;
     MIFacAlbaranesProvDet: TMenuItem;
     TButtListadoNecesidades: TToolButton;
     AListNecesidades: TAction;
     AMRP: TAction;
     MIFondo: TMenuItem;
     AConfirming: TAction;
     AAnticipos: TAction;
     MIConfirming: TMenuItem;
     MIAnticipos: TMenuItem;
     TButtAnticipos: TToolButton;
     TButtConfirming: TToolButton;
     AModelo300: TAction;
     AModelo303: TAction;
     AModelo115: TAction;
     AModelo110: TAction;
     ARetEmpleados: TAction;
     TButtHacienda: TToolButton;
     PopupHacienda: TPopupMenu;
     PMIModelo110: TMenuItem;
     PMIModelo115: TMenuItem;
     PMIModelo300: TMenuItem;
     PMIModelo303: TMenuItem;
     Tx6: TToolButton;
     MSGImpuestos: TMenuItem;
     MITiposIVA: TMenuItem;
     MIModosIVA: TMenuItem;
     MITipoIrpf: TMenuItem;
     MIContaCuentasIVA: TMenuItem;
     MIContaCuentasIRPF: TMenuItem;
     AModelo330: TAction;
     PMIModelo330: TMenuItem;
     ATalones: TAction;
     TButtTalones: TToolButton;
     MISeparador28: TMenuItem;
     MSGHacienda: TMenuItem;
     MIModelo110: TMenuItem;
     MIModelo115: TMenuItem;
     MIModelo300: TMenuItem;
     MIModelo303: TMenuItem;
     MIModelo330: TMenuItem;
     TButtDiarioIva: TToolButton;
     MITalones: TMenuItem;
     MISeparador29: TMenuItem;
     MIRetEmpleados: TMenuItem;
     Tx7: TToolButton;
     TButtRetEmpleados: TToolButton;
     PopupTalones: TPopupMenu;
     ATalonesCta: TAction;
     PMITalones: TMenuItem;
     PMITalonesCta: TMenuItem;
     ALSTDepositosActivos: TAction;
     MIFichamargendeproductos: TMenuItem;
     ALSTFichaMargendeProductos: TAction;
     MIListadoDeDepositosActivos: TMenuItem;
     AContaDefBalancesCAB: TAction;
     MIBalancesCab: TMenuItem;
     TButtCierraFac: TToolButton;
     ACierraFac: TAction;
     AMuestraRecibos: TAction;
     TButtRecibosFacturas: TToolButton;
     MIMuestraRecibos: TMenuItem;
     MICierraFactura: TMenuItem;
     TButtTrsEjer: TToolButton;
     ATraspaso: TAction;
     ALSTUnidadesPendientes: TAction;
     MIListadoUnidadesPendientes: TMenuItem;
     TButtProyectos: TToolButton;
     AModelo190: TAction;
     AExporta190: TAction;
     PMIListadoModelo190: TMenuItem;
     PMIExportacionModelo190: TMenuItem;
     ListadoModelo190: TMenuItem;
     ExportacionModelo190: TMenuItem;
     MICierraTodas: TMenuItem;
     ACierraTodas: TAction;
     AHistoricoPMP: TAction;
     MIHistPrecios: TMenuItem;
     APonderarDocs: TAction;
     TButtMonedas: TToolButton;
     AMonedasCuenta: TAction;
     AAgrupacionFac: TAction;
     MIAgrupacionFac: TMenuItem;
     MIMonedasEmpresa: TMenuItem;
     ACorreoEmpresa: TAction;
     MICorreoEmpresa: TMenuItem;
     TButtCorreoElectronico: TToolButton;
     AEmpCanales: TAction;
     MIEmpCanales: TMenuItem;
     MITalonesCta: TMenuItem;
     AClasesDirecciones: TAction;
     MIClasesdeDirecciones: TMenuItem;
     ADuplicaEscandallo: TAction;
     APagares: TAction;
     PMIPagares: TMenuItem;
     MIPagares: TMenuItem;
     AConfINI: TAction;
     MIINI: TMenuItem;
     MIContRecuperacion: TMenuItem;
     AContRecuperacion: TAction;
     MITiposCalculo: TMenuItem;
     ATiposCalculo: TAction;
     ACondicionesEspeciales: TAction;
     MSGCondicionesEspeciales: TMenuItem;
     MISeparador5: TMenuItem;
     AMonedasMaestros: TAction;
     MIMonedasMaestros: TMenuItem;
     MICondDeAgentesCli: TMenuItem;
     MICondAgentesAgrup: TMenuItem;
     PopupCondiciones: TPopupMenu;
     PMICondicionesEsp: TMenuItem;
     PMICondAgeAgrup: TMenuItem;
     PMICondAgeCli: TMenuItem;
     ACondicionesProv: TAction;
     PMICondicionesProv: TMenuItem;
     AImprimeAlbaranes: TAction;
     TButtListarAlbaranes: TToolButton;
     MIListarAlb: TMenuItem;
     PMITiposCalculo: TMenuItem;
     ACamMonCartera: TAction;
     MICamMonCartera: TMenuItem;
     MSGLotes: TMenuItem;
     MIListadoLotes: TMenuItem;
     MIListadoLotesCompras: TMenuItem;
     MIListadoLotesVentas: TMenuItem;
     ALSTLotes: TAction;
     ALSTLotesCompras: TAction;
     ALSTLotesVentas: TAction;
     MIListadoLotesMovimientos: TMenuItem;
     ALSTLotesMovimientos: TAction;
     PMIListadoModelo347: TMenuItem;
     AModelo347: TAction;
     MIListadoModelo347: TMenuItem;
     MGListConfigHacienda: TMenuItem;
     AConfModelo347: TAction;
     MIConfModelo347: TMenuItem;
     AConfModelo110: TAction;
     AConfModelo115: TAction;
     AConfModelo300: TAction;
     AConfModelo303: TAction;
     AConfModelo330: TAction;
     AConfModelo190: TAction;
     MIListadoModelo110111: TMenuItem;
     MIListadoModelo115: TMenuItem;
     MIListadoModelo110: TMenuItem;
     MIListadoModelo300: TMenuItem;
     MIListadoModelo303: TMenuItem;
     MIListadoModelo330: TMenuItem;
     MGModelo190: TMenuItem;
     ALSTUnidPendRecibir: TAction;
     MIListadoUnidPendRecibir: TMenuItem;
     AColoresTallas: TAction;
     MIColoresTallas: TMenuItem;
     TSTallas: TTabSheet;
     TBTallas: TLFToolBar;
     TButtArtColores: TToolButton;
     TButtGruposTallas: TToolButton;
     AGruposTallas: TAction;
     MIGruposTallas: TMenuItem;
     TButtModelosTallas: TToolButton;
     AModelosTallas: TAction;
     TButtProcesosProd: TToolButton;
     AProcesosProd: TAction;
     ATiposRedondeo: TAction;
     MITiposRedondeo: TMenuItem;
     frOpenDBDialog1: TfrOpenDBDialog;
     MIAvisos: TMenuItem;
     AAvisos: TAction;
     APedidosVentaPendientes: TAction;
     APedidosCompraPendientes: TAction;
     MIPedidosVentaPendientes: TMenuItem;
     MIClientesporArticulo: TMenuItem;
     MIPedidosCompraPendientes: TMenuItem;
     MISeparador33: TMenuItem;
     MIRiesgosBancos: TMenuItem;
     MIRiesgosClientes: TMenuItem;
     ARepUsuarioAlm: TAction;
     TButtRepUsuAlm: TToolButton;
     ArepUsuarioCompras: TAction;
     TButtRepUsuComp: TToolButton;
     ARepUsuarioConta: TAction;
     ARepUsuariosVentas: TAction;
     TButtRepUsuVen: TToolButton;
     ARepUsuariosTerceros: TAction;
     TButtRepUsuTer: TToolButton;
     ATipoAsiento: TAction;
     TButtTipoAsiento: TToolButton;
     PopupFamilias: TPopupMenu;
     PMIFamilias: TMenuItem;
     AIncrementoPorcentual: TAction;
     PMIIncrementoPorcentual: TMenuItem;
     TButtRepUsuTesor: TToolButton;
     ARepUsuarioTesoreria: TAction;
     TButtRepUsuProd: TToolButton;
     ARepUsuarioProduccion: TAction;
     TButtNroSerieKri: TToolButton;
     AConsultaNroSerieKri: TAction;
     AMantenimientoNroSerie: TAction;
     PopupNroSerieKri: TPopupMenu;
     PMINroSerie: TMenuItem;
     PMIMantenimientodeNroSerie: TMenuItem;
     TButtEtiquetasKri: TToolButton;
     AImprimirEtiquetasKri: TAction;
     TButtProrrateoCostes: TToolButton;
     AProrrateoCostes: TAction;
     ALSTGeneraTmpInventarioKri: TAction;
     MIGeneraTemporalInventario: TMenuItem;
     MIImagenes: TMenuItem;
     AImagenes: TAction;
     ARiesgoBancos: TAction;
     ARiesgoClientes: TAction;
     AFacAlbaranesCliDet: TAction;
     TButtAAsignaBancoRemesa: TToolButton;
     AAsignaBancoRemesa: TAction;
     TButtTransmisionesPatrimoniales: TToolButton;
     ATransmisionesPatrimoniales: TAction;
     ASumasYSaldosKri: TAction;
     MISumasySaldosConsolidados: TMenuItem;
     MIListadodeStockResumidoporTallas: TMenuItem;
     ALSTStockTallas: TAction;
     TButtOrdenProduccionTallas: TToolButton;
     AOrdenProduccionTallasKri: TAction;
     AEDI: TAction;
     TButtEDI: TToolButton;
     MIEDI: TMenuItem;
     AAgrupacionDeAlbaranesKri: TAction;
     ACentroDeCostos: TAction;
     MICentroDeCostes: TMenuItem;
     AIntrastat: TAction;
     MGIntrastat: TMenuItem;
     AIntrastatCompras: TAction;
     AIntrastatVentas: TAction;
     MIIntrastatCompras: TMenuItem;
     MIIntrastatVentas: TMenuItem;
     ACierreStocks: TAction;
     MICierreyAperturadeStocks: TMenuItem;
     ARegStocks: TAction;
     MIRegularizacindeStocks: TMenuItem;
     AConfIntrastatCV: TAction;
     MIListadoIntrastatComprasVentas: TMenuItem;
     PMIIntrastatCompras: TMenuItem;
     PMIIntrastatVentas: TMenuItem;
     AExporta349: TAction;
     PMIExportacionModelo349: TMenuItem;
     MGModelo349: TMenuItem;
     ALSTEstadisticasArt: TAction;
     MIPedFueraPlazo: TMenuItem;
     APedFueraPlazo: TAction;
     MISeparador14: TMenuItem;
     MSGListadosVentas: TMenuItem;
     MISeparador19: TMenuItem;
     ACondicionesVenta: TAction;
     MICondicionesEspecialesVenta: TMenuItem;
     AAsistenteEmpresa: TAction;
     AAsistenteEjercicio: TAction;
     MIAsistenteEmpresa: TMenuItem;
     MIAsistenteEjercicio: TMenuItem;
     MISeparador66: TMenuItem;
     MISeparador67: TMenuItem;
     MSGEstadisticas: TMenuItem;
     MIEmpresasABCVentas: TMenuItem;
     MIEmpresasABCCompras: TMenuItem;
     MIEmpresasEstadisticasArt: TMenuItem;
     MISeparador30: TMenuItem;
     MICondicionesEspecialesCompra: TMenuItem;
     ACondicionesCompra: TAction;
     MITraspasoCondiciones: TMenuItem;
     MICondProveedores: TMenuItem;
     AMatriculas: TAction;
     ANaturalezaMat: TAction;
     MINaturalezas: TMenuItem;
     MIMatriculas: TMenuItem;
     MIPedFueraPlazoCmp: TMenuItem;
     APedFueraPlazoVentas: TAction;
     AParamApuntes: TAction;
     MIConfiguracionTextos: TMenuItem;
     AConfigTextos: TAction;
     AFacCuotas: TAction;
     MIFacturacionCuotas: TMenuItem;
     MIAlmacenesUbicaciones: TMenuItem;
     AAlmacenesCalles: TAction;
     AAlmacenesEstanterias: TAction;
     AAlmacenesRepisas: TAction;
     AAlmacenesPosicion: TAction;
     MICalles: TMenuItem;
     MIEstanterias: TMenuItem;
     MIRepisas: TMenuItem;
     MIPosiciones: TMenuItem;
     MIEnvioReparto: TMenuItem;
     AEnvioReparto: TAction;
     AConfigAlmcen: TAction;
     MIConfiguraAlmacen: TMenuItem;
     MIMovEntreUbicaciones: TMenuItem;
     AMovEntreUbicaciones: TAction;
     MIStockPorUbicacion: TMenuItem;
     ALstStockPorUbicacion: TAction;
     MIListadoMovEntreUbicaciones: TMenuItem;
     ALstMovEntreUbicaciones: TAction;
     MIParamApuntes: TMenuItem;
     AFacturasDirectas: TAction;
     TButtLstCentroCoste: TToolButton;
     ALstCentroCoste: TAction;
     MIAgrupaciondeAlbaranes: TMenuItem;
     MICaravanas: TMenuItem;
     ACaravanas: TAction;
     MIFacAlbaranesCliDet: TMenuItem;
     TButtFacAlbaranesCliDet: TToolButton;
     MITiposDePortes: TMenuItem;
     ATipoPortes: TAction;
     MIRangosPortes: TMenuItem;
     ARangosPortes: TAction;
     APromocionesVenta: TAction;
     MIPromocionesVentas: TMenuItem;
     APromocionesIndirectas: TAction;
     MIPromocionesIndirectas: TMenuItem;
     MIOrdenPromociones: TMenuItem;
     AOrdenPromocion: TAction;
     MITrazabilidadLotes: TMenuItem;
     ATrazabilidadLotes: TAction;
     MIAsistenteTarifa: TMenuItem;
     AAsistenteTarifa: TAction;
     APropuestas: TAction;
     MIPropuestas: TMenuItem;
     APropuestasConfirm: TAction;
     MIPropuestasConfirmadas: TMenuItem;
     AVentas: TAction;
     ATicketsEdicion: TAction;
     AVentasArticulos: TAction;
     AFacturarTickets: TAction;
     ACobros: TAction;
     ACobrosEdicion: TAction;
     AGastos: TAction;
     ATicketsEdicionGastos: TAction;
     AFacturarTicketsGasto: TAction;
     ASesion: TAction;
     ACajas: TAction;
     ATurnos: TAction;
     ATercerosTPV: TAction;
     AClientesTPV: TAction;
     ACajasEmpresa: TAction;
     ACajasSistema: TAction;
     AUsuariosTPV: TAction;
     AEmpEjerCan: TAction;
     AFondoTPV: TAction;
     AConfiguracion: TAction;
     ATiposGasto: TAction;
     AFormaPagoTpv: TAction;
     APerfilesUsuarioTPV: TAction;
     AArtBultos: TAction;
     MIArtBultos: TMenuItem;
     MIArtUdsBultos: TMenuItem;
     APedidosPendientes: TAction;
     AAlbaranesPendientes: TAction;
     AFiltroFacturas: TAction;
     APedidosPendientesProv: TAction;
     AAlbaranesPendientesProv: TAction;
     AFiltroFacturasProv: TAction;
     AFiltroFacturasAcr: TAction;
     MIDivisiones: TMenuItem;
     ADivisionesMaestros: TAction;
     MIRepUsuarioTerceros: TMenuItem;
     MIRepUsuarioAlmacenes: TMenuItem;
     MIRepUsuarioCompras: TMenuItem;
     MIRepUsuarioVentas: TMenuItem;
     MIRepUsuarioContabilidad: TMenuItem;
     MIRepUsuarioTesoreria: TMenuItem;
     MIUsuariosWeb: TMenuItem;
     AUsuariosWeb: TAction;
     AHistoricoProcesosProv: TAction;
     MIHistoricoProcesosProv: TMenuItem;
     MGContabilidadAnaltica: TMenuItem;
     AAnaPlanesContables: TAction;
     MIPlanesContables: TMenuItem;
     AAnaCentrosCoste: TAction;
     MICentrosCoste: TMenuItem;
     AAnaPlantillasImputacion: TAction;
     MIPlantillasImputacion: TMenuItem;
     AAnaImputacionesCostes: TAction;
     MIImputaciones: TMenuItem;
     AAnaExtracto: TAction;
     MISeparador83: TMenuItem;
     MIAnaExtractos: TMenuItem;
     MISeparador84: TMenuItem;
     MSGListados: TMenuItem;
     MIAnaSumaYSaldos: TMenuItem;
     AAnaSumaYSaldos: TAction;
     AAnaAnalisisPresupuesto: TAction;
     MIAnaPresupuesto: TMenuItem;
     AAnaPropagaEstructuras: TAction;
     MIPropagaEstructuras: TMenuItem;
     AAnaLstPlanContableAnalitico: TAction;
     MIPlanContableAnaltico: TMenuItem;
     AUsuarioCambiaClave: TAction;
     MICambiodeclavedeusuario: TMenuItem;
     MSGImportarExportar: TMenuItem;
     MIImportarASI: TMenuItem;
     MIExportarASI: TMenuItem;
     AImportarAsientos: TAction;
     AExportarAsientos: TAction;
     MIExportarSaldos: TMenuItem;
     AExportarSaldos: TAction;
     AParamModelosHacienda: TAction;
     MIParametrosModelosdeHacienda: TMenuItem;
     PMIParametrosModelosdeHacienda: TMenuItem;
     PopupConfirmingOrdPago: TPopupMenu;
     AOrdenesDePago: TAction;
     PMIOrdenesdePago: TMenuItem;
     ANorma43SLucia: TAction;
     MIImportacionNorma43SLucia: TMenuItem;
     TButtCRM: TToolButton;
     ACRM: TAction;
     MICRM: TMenuItem;
     ASincronizarBasesKri: TAction;
     MISincronizaKri: TMenuItem;
     ANorma43Kri: TAction;
     MIImportacionNorma43: TMenuItem;
     AContaRectAsientos: TAction;
     MIRectAsientos: TMenuItem;
     AConfAlmacenes: TAction;
     MIAlmacenes: TMenuItem;
     MSConfAlm: TMenuItem;
     TButtConfAlmacenes: TToolButton;
     TButtPreciosCosteKri: TToolButton;
     AClientesPotencialesKri: TAction;
     PopupClientesKri: TPopupMenu;
     PMIClientes: TMenuItem;
     PMIClientesPotenciales: TMenuItem;
     MIClientesPotenciales: TMenuItem;
     APreciosCosteKri: TAction;
     MIPreciosCoste: TMenuItem;
     AEquivalencias: TAction;
     MIEquivalencias: TMenuItem;
     MIModificaPGC: TMenuItem;
     AModificaPGC: TAction;
     AGestions: TAction;
     MIGestiones: TMenuItem;
     ATipoLineaVenta: TAction;
     MITiposdeLneadeVenta1: TMenuItem;
     APedidoEntreAlmacenes: TAction;
     MIPedidoEntreAlmacenes: TMenuItem;
     ATraspasoPedCliAPedProv: TAction;
     MITraspasoPedCliAPedProv: TMenuItem;
     TButtTraspasoPedCliAPedProv: TToolButton;
     ACambioEmpresaEjerCanal: TAction;
     MICambiorpidodeEjercicio: TMenuItem;
     TButtMultiCambio: TToolButton;
     PopUpMultiCambioEjercicio: TPopupMenu;
     MICambiarUsuario: TMenuItem;
     ARecepcionWeb: TAction;
     MIRecepcionWeb: TMenuItem;
     ATipoIncidenciaKri: TAction;
     MITiposdeIncidencia1: TMenuItem;
     MIAsignaBcoRemesa: TMenuItem;
     AAlarmasIberfluidKri: TAction;
     MIAlarmasIberfluid: TMenuItem;
     AProcesosKri: TAction;
     MIProcesos: TMenuItem;
     AIdiomasKri: TAction;
     MIIdiomas: TMenuItem;
     ALEditorRichText: TActionList;
     RichEditBold1: TRichEditBold;
     RichEditItalic1: TRichEditItalic;
     RichEditUnderline1: TRichEditUnderline;
     RichEditBullets1: TRichEditBullets;
     RichEditAlignLeft1: TRichEditAlignLeft;
     RichEditAlignRight1: TRichEditAlignRight;
     RichEditAlignCenter1: TRichEditAlignCenter;
     AModelo340: TAction;
     PMIExportacionModelo340: TMenuItem;
     MIExportacionModelo340: TMenuItem;
     AImportarDocumentos: TAction;
     MIImportarDocumentos: TMenuItem;
     AZonas: TAction;
     MIZonas: TMenuItem;
     APersonalUlises: TAction;
     MIPersonalUlises: TMenuItem;
     TButtPersonalUlises: TToolButton;
     TAvisoMensaje: TTimer;
     TButtAviso: TToolButton;
     TAviso: TTimer;
     ATransportistasSEUR: TAction;
     MITransportistasSEUR: TMenuItem;
     ATransportistasDHL: TAction;
     MITransportistasDHL: TMenuItem;
     AABCVentasKri: TAction;
     AABCComprasKri: TAction;
     MIEmpresasABCVentasAlb: TMenuItem;
     MIEmpresasABCComprasAlb: TMenuItem;
     PopupABCCompras: TPopupMenu;
     PMIABCsdeCompras: TMenuItem;
     PMIABCsdeComprasxAlb: TMenuItem;
     PopupABCVentas: TPopupMenu;
     PMIABCdeVentas: TMenuItem;
     PMIABCdeVentasxAlb: TMenuItem;
     TVerificaEntrada: TTimer;
     TTerminarAplicacion: TTimer;
     ACrmAmbitos: TAction;
     ACrmEMails: TAction;
     ACrmTipoAcciones: TAction;
     ACrmContactos: TAction;
     ACrmConsultaAcciones: TAction;
     ACrmConfiguracion: TAction;
     ACrmOrigenRel: TAction;
     ACrmImportarContactos: TAction;
     TSCRM: TTabSheet;
     TBCRM: TLFToolBar;
     TButtCRMContactos: TToolButton;
     TButtCRMSeguimientos: TToolButton;
     TButtCRMAmbitos: TToolButton;
     TButtCRMEmails: TToolButton;
     TButtCRMTipoAcciones: TToolButton;
     MGCRM: TMenuItem;
     MICRMContactos: TMenuItem;
     MICRMConsultaAcciones: TMenuItem;
     MICRMAmbitos: TMenuItem;
     MICRMEmails: TMenuItem;
     MICRMTipoAcciones: TMenuItem;
     MICRMConfiguracion: TMenuItem;
     MICRMOrigenRel: TMenuItem;
     MICRMImportarContactos: TMenuItem;
     AEstadisticas: TAction;
     MIMantenimientodeEstadsticas1: TMenuItem;
     TSIso: TTabSheet;
     TBProduccionISO: TLFToolBar;
     TButtInformeNoConformidad: TToolButton;
     TButtAcciones: TToolButton;
     TButtDevolucionMaterial: TToolButton;
     TButtPlanDeCapacitacion: TToolButton;
     TButtControlEquipos: TToolButton;
     TButtClasificacionProveedores: TToolButton;
     TButtPuntesodeINC: TToolButton;
     TButtFirmasISO: TToolButton;
     TButtTipoAcciones: TToolButton;
     TButtIsoCursos: TToolButton;
     TButtIsoPlanning: TToolButton;
     AIsoAccPreventiva: TAction;
     AIsoMantTAcc: TAction;
     AIsoPlanCapac: TAction;
     AIsoClassProv: TAction;
     AIsoDevMat: TAction;
     AIsoMantInformes: TAction;
     AIsoControlEquip: TAction;
     AIsoPunteos: TAction;
     AIsoFirmas: TAction;
     AIsoCursos: TAction;
     AIsoPlanning: TAction;
     MGISO: TMenuItem;
     MIMantenimientodeinformesNoconformidad: TMenuItem;
     MIAccionespreventivas: TMenuItem;
     MIDevoluciondematerial: TMenuItem;
     MIPlandecapacitacinypolivalencia: TMenuItem;
     MIControlDeLosEquiposDeMedicion: TMenuItem;
     MIClasificaciondeproveedores: TMenuItem;
     MIPunteosycierresdeinformesdeNoconformidad: TMenuItem;
     MIMantenimientodeFirmas: TMenuItem;
     MIMantenimientotipoacciones: TMenuItem;
     MICursos: TMenuItem;
     MIPlanning: TMenuItem;
     TSProduccionDelfos: TTabSheet;
     TButtMarcajes: TToolButton;
     AProEscandalloSF: TAction;
     AProMarcajesOpe: TAction;
     AProDiario: TAction;
     AProOrden: TAction;
     AProGestionOrd: TAction;
     AProMarcajesMaq: TAction;
     AProMarcajesTe: TAction;
     AProMarcajesVa: TAction;
     AProGenerarOrd: TAction;
     AProRecursosEmp: TAction;
     AOpeCategoria: TAction;
     AOpeCTrabajo: TAction;
     AOpeDepartamento: TAction;
     AOpeSecciones: TAction;
     AOpeTContrato: TAction;
     AOpeEmpleados: TAction;
     AProMaquinas: TAction;
     AOpeImputaciones: TAction;
     AOpeTImputacion: TAction;
     AOpeCalendario: TAction;
     AOpeCalendarioEmp: TAction;
     AProLstOrden: TAction;
     AProLstEscandallo: TAction;
     AProMatInc: TAction;
     AProTMaquina: TAction;
     AProRecMarcajes: TAction;
     AProFases: TAction;
     AProTareas: TAction;
     AProRecursos: TAction;
     AProLstMarcajes: TAction;
     AProConfigMarcajes: TAction;
     AOpeHorario: TAction;
     AProLstMontaje: TAction;
     AProLstNecesidades: TAction;
     AProUtillajes: TAction;
     AProLstHojaTrabajo: TAction;
     AProRelacionUds: TAction;
     AProOfertasE: TAction;
     AProLstofertasE: TAction;
     AProMarcajesOpeEsp: TAction;
     AProMarcajesMaqEsp: TAction;
     AProPlanificar: TAction;
     AProDeslanza: TAction;
     AProCabPlanificacion: TAction;
     AProTipTareasMan: TAction;
     AProTareasMan: TAction;
     AProEquivalArt: TAction;
     APauta_TipoControl: TAction;
     APauta: TAction;
     AObrObras: TAction;
     AObrPartidas: TAction;
     AObrPartidasPlantilla: TAction;
     AProDiagramaGantt: TAction;
     AProTipoMarcajes: TAction;
     AProMarcajesBD: TAction;
     AProDesTipoPieza: TAction;
     AProDesTipoMat: TAction;
     AProDesDespiece: TAction;
     ARecalcular: TAction;
     ADocumentos: TAction;
     AProLstMatEsc: TAction;
     ALstNecEsc: TAction;
     AImagenesArticulos: TAction;
     AArticulosAlmacenes: TAction;
     AProPantMarcajes: TAction;
     AAgrupaRecEsc: TAction;
     AProUtiles: TAction;
     AProFormulas: TAction;
     ALstMatPeligrosas: TAction;
     APresencia: TLFCategoryAction;
     APresenciaIncidencia: TAction;
     APresenciaDiario: TAction;
     ALstPresencia: TAction;
     AProTMaquinaRevision: TAction;
     AProTipoRevMaq: TAction;
     MGProduccion: TMenuItem;
     MIProLstMatEsc: TMenuItem;
     MIProEscandallos: TMenuItem;
     MIProLstEscandallo: TMenuItem;
     MILstNecesidades: TMenuItem;
     MIProLstHojadeTrabajo: TMenuItem;
     MISeparador85: TMenuItem;
     MIProLstOfertasEscandallo: TMenuItem;
     MISeparador36: TMenuItem;
     MGControlPresencia: TMenuItem;
     MIPresencia: TMenuItem;
     MIPresenciaIncidencias: TMenuItem;
     MISeparador48: TMenuItem;
     MIPresenciaDiario: TMenuItem;
     MIListadoPresencia: TMenuItem;
     MGObras: TMenuItem;
     MIObras: TMenuItem;
     MIPartidas: TMenuItem;
     MIPlantillasdePartidas: TMenuItem;
     PMProListados: TPopupMenu;
     PMILstEscandallo: TMenuItem;
     PMILstOrdenes: TMenuItem;
     PMIstNecesidades: TMenuItem;
     PMILstHojadeMontaje: TMenuItem;
     PMILstMarcajes: TMenuItem;
     PMProMarcajes: TPopupMenu;
     PMIOperario: TMenuItem;
     PMIMaquinas: TMenuItem;
     PMIExterno: TMenuItem;
     PMIVarios: TMenuItem;
     ACambioIdioma: TAction;
     MICambioIdioma: TMenuItem;
     MIProMntEscandallo: TMenuItem;
     MSGProduccion: TMenuItem;
     MIProMntOrdenes: TMenuItem;
     MIProGenerarOrdenes: TMenuItem;
     MIProLanzarCerrarOrdenes: TMenuItem;
     MIReclculos: TMenuItem;
     MIDocumentos: TMenuItem;
     MIProLstOrdenes: TMenuItem;
     MIProLstHojadeMontaje: TMenuItem;
     MIProLstNecesidades: TMenuItem;
     MSGProMarcajes: TMenuItem;
     MIProMntOfertasEscandallos: TMenuItem;
     MIProOperario: TMenuItem;
     MIProMarcajesOperarioEspecial: TMenuItem;
     MIProMaquinas: TMenuItem;
     MIProMaquinaEspecial: TMenuItem;
     MIProTrabajoExterior: TMenuItem;
     MIProVarios: TMenuItem;
     MIProRecogidadeMarcajes: TMenuItem;
     MIMarcajesDirectosaBD: TMenuItem;
     MIProIncMateriales: TMenuItem;
     MIProDiariodeMarcajes: TMenuItem;
     MIProListadodemarcajes: TMenuItem;
     MIPantMarcajes: TMenuItem;
     MIMquinas: TMenuItem;
     MIEmpleados: TMenuItem;
     MGCalendario: TMenuItem;
     MIPauta: TMenuItem;
     MSGPlanificacin: TMenuItem;
     MIPlanificaciones: TMenuItem;
     MIPlanificacin: TMenuItem;
     MIDeslanzar: TMenuItem;
     MITiposTareasManuales: TMenuItem;
     MITareasManuales: TMenuItem;
     MIDiagramaGantt: TMenuItem;
     MIArtculosAlmacenes: TMenuItem;
     MIImgenesArtculos: TMenuItem;
     MIProDesDespiece: TMenuItem;
     MGAuxiliaresProduccion: TMenuItem;
     MSGEmpleados: TMenuItem;
     MICategoriasEmpleado: TMenuItem;
     MICentrosdeTrabajo: TMenuItem;
     MIDepartamentos1: TMenuItem;
     MISecciones: TMenuItem;
     MITiposDeContrato: TMenuItem;
     MIImputaciones1: TMenuItem;
     MITiposDeImputacion: TMenuItem;
     MICalendarioEmpleado: TMenuItem;
     MITipoMquina: TMenuItem;
     MITipoRevisionesMquina: TMenuItem;
     MIMaquinasRevisin: TMenuItem;
     MIHorario: TMenuItem;
     MITipoDeMarcajes: TMenuItem;
     MIProConfiguracinRecogida: TMenuItem;
     MIFases: TMenuItem;
     MITareas: TMenuItem;
     MIAgrupacindeRecursoPorEscandallo: TMenuItem;
     MIRecursos: TMenuItem;
     MIUtillajes: TMenuItem;
     MITipoControl: TMenuItem;
     MIRelacinDeUds: TMenuItem;
     MIEquivalnciaArticulos: TMenuItem;
     MIFrmulas: TMenuItem;
     MITipoDePieza: TMenuItem;
     MITipoMaterial: TMenuItem;
     MIUtiles: TMenuItem;
     MIModelosTallas: TMenuItem;
     TBProduccionAvanzada: TLFToolBar;
     TButtMantenimientoEscandallo: TToolButton;
     TButtMantenimientoOrdenesProduccion: TToolButton;
     TButtGenerarOrdenesProduccion: TToolButton;
     TButtLanzarOrdenesProduccion: TToolButton;
     TButtMantenimientoEmpleados: TToolButton;
     TButtMaquinas: TToolButton;
     TButtListadosProduccion: TToolButton;
     TButtRepUsuConta: TToolButton;
     TButtIncidencias: TToolButton;
     ATipoUnidadLogistica: TAction;
     MI0TipoUnidadLogistica1: TMenuItem;
     MGHojasDePreparacion: TMenuItem;
     AHojaDePreparacion: TAction;
     MIAltaHojaPreparacion: TMenuItem;
     MIHojaDePreparacion: TMenuItem;
     AAltaHojaDePreparacion: TAction;
     AProtocolosDeVenta: TAction;
     MIProtocolos1: TMenuItem;
     AProtocoloDeVentas: TAction;
     MIProtocoloDeVentas: TMenuItem;
     ACierreParcialOrden: TAction;
     MICierreParcialdeOrdendeProduccion: TMenuItem;
     ADepartamento: TAction;
     MIMantinimientodeDepartamentos1: TMenuItem;
     MICRMTipoSeguimiento: TMenuItem;
     ACrmTipoSeguimiento: TAction;
     MIExportaClientes: TMenuItem;
     ATipoUbicacion: TAction;
     ASectorAlmacen: TAction;
     MIMantenimientodeTipodeUbicacion: TMenuItem;
     MIMantenimientodeSectoresdeAlmacen: TMenuItem;
     ALstUbicaciones: TAction;
     MIListadodeUbicaciones: TMenuItem;
     AAlbaranesVentaPendientes: TAction;
     MIAlbaranesdeVentaPendientes: TMenuItem;
     ZASysNCF: TAction;
     ZATalones: TAction;
     ZADiarioVentas: TAction;
     MIDiariodeVentas: TMenuItem;
     ZAVentasFamilia: TAction;
     MIRecibos: TMenuItem;
     ZAIntereses: TAction;
     AListadoITBIS: TAction;
     MIListadoITBIS: TMenuItem;
     ALSTTalones: TAction;
     ZARecibos: TAction;
     MIResponsableHojaDePreparacion: TMenuItem;
     AResponsableHojaDePreparacion: TAction;
     MIGruposIncoterm: TMenuItem;
     MICodigosIncoterm: TMenuItem;
     AGruposIncoterm: TAction;
     ACodigosIncoterm: TAction;
     MIIdiomasArticulos: TMenuItem;
     AAsistenteImpIdiomaArticulos: TAction;
     MGAsistentes: TMenuItem;
     AProMarcajesMaqEspTurno: TAction;
     MIMaquinaEspecialTurno: TMenuItem;
     AProTurnos: TAction;
     MITurnos: TMenuItem;
     AProCausas: TAction;
     MICausas: TMenuItem;
     AProDefecto: TAction;
     AProTiposDefecto: TAction;
     MITiposDefecto: TMenuItem;
     MIDefectoMaterial: TMenuItem;
     AIsoFichaTecnica: TAction;
     AIsoCertificadoAnalisis: TAction;
     MIFichaTecnica: TMenuItem;
     MICertificadoAnalisis: TMenuItem;
     AIsoNormativas: TAction;
     MINormativas: TMenuItem;
     AIsoTipoEnsayo: TAction;
     AIsoEnsayos: TAction;
     MITiposEnsayo: TMenuItem;
     MIEnsayos: TMenuItem;
     AImportarPedidos: TAction;
     MIImportarPedidos: TMenuItem;
     MGListadosPers: TMenuItem;
     ATipoRetencion: TAction;
     MITiposRetencion: TMenuItem;
     MIPlanMaestroProduccion: TMenuItem;
     APlanMaestroProduccion: TAction;
     ADiarioCostes: TAction;
     MIDiariodeCostes: TMenuItem;
     AGestionDeCobros: TAction;
     MIGestiondeCobros: TMenuItem;
     ALotes: TAction;
     MISincronizaIncidencias: TMenuItem;
     ASincronizaIncidencias: TAction;
     MGImpresoras: TMenuItem;
     MGLaser: TMenuItem;
     MGMatricial: TMenuItem;
     MGEtiquetas: TMenuItem;
     AMaestros: TAction;
     MGMaestros: TMenuItem;
     AOrdenes: TAction;
     MIOrdenes: TMenuItem;
     AEtiquetas: TAction;
     APresupuestos: TAction;
     ALstPresupuestos: TAction;
     MIEtiquetas: TMenuItem;
     MGPresupuestos: TMenuItem;
     MILstPresupuestos: TMenuItem;
     AMaquinas: TAction;
     ADetalleMaq: TAction;
     MIDatosMaestros: TMenuItem;
     MIMaquinas: TMenuItem;
     ATroqueles: TAction;
     MITroqueles: TMenuItem;
     MIPresupuestos: TMenuItem;
     AEtiConstantes: TAction;
     MGGestionEtiquetas: TMenuItem;
     MIConfiguracion: TMenuItem;
     MGReparaciones: TMenuItem;
     AReparaciones: TAction;
     MIReparaciones: TMenuItem;
     AMantConsumo: TAction;
     AZLstOfertas: TAction;
     MIListadoOfertas: TMenuItem;
     ATiposArticulo: TAction;
     MITiposArticulo: TMenuItem;
     AMateriales: TAction;
     AColadas: TAction;
     MGColadas: TMenuItem;
     MIColadas: TMenuItem;
     MIMateriales: TMenuItem;
     ACompensacionRecibos: TAction;
     MICompensaciondeRecibos: TMenuItem;
     AGas: TAction;
     ATiposMoneda: TAction;
     MITiposMoneda: TMenuItem;
     MIGas: TMenuItem;
     MGGas: TMenuItem;
     AGasTanque: TAction;
     AGasDispensador: TAction;
     AGasColaCamion: TAction;
     MITanque: TMenuItem;
     MIDispensador: TMenuItem;
     MIColaCamion: TMenuItem;
     MISeparador40: TMenuItem;
     MISubstituirComponentes: TMenuItem;
     AProSubsComponentes: TAction;
     MISeparador51: TMenuItem;
     MIGasUtiles: TMenuItem;
     AGasUtiles: TAction;
     ASerializacion: TAction;
     MISerializacion: TMenuItem;
     ADescargasGas: TAction;
     MIDescargasGas: TMenuItem;
     MIContadoresNCF2: TMenuItem;
     ASincronizaTienda: TAction;
     MISincronizaTienda: TMenuItem;
     AVerificacionesImpuestos: TAction;
     MIVerificacionesImpuestos: TMenuItem;
     ASeriesCliente: TAction;
     MISeriesCliente: TMenuItem;
     ACrmArticulos: TAction;
     MICrmArticulos: TMenuItem;
     ACrmMarcajes: TAction;
     MIMarcajes: TMenuItem;
     ACrmVentas: TAction;
     MIMarcajesVentas: TMenuItem;
     ACrmAcciones: TAction;
     MIAcciones: TMenuItem;
     TButtCRMAcciones: TToolButton;
     AImportarArticulosExcel: TAction;
     MIImportarArtculosDesdeExcel: TMenuItem;
     APrevisionTesoreria: TAction;
     MIPrevisionTesoreria: TMenuItem;
     MICrmImportarLocalidades: TMenuItem;
     ACrmImportarLocalidades: TAction;
     TButtTipoColorTallas: TToolButton;
     ATipoColorTallas: TAction;
     MITipoColorTallas: TMenuItem;
     AParametrizacionTallas: TAction;
     MIParametrizaciondeTallas: TMenuItem;
     MIProordtareaMat: TMenuItem;
     AProOrdTareaMat: TAction;
     MiListarPed: TMenuItem;
     AImprimePedidos: TAction;
     ATipoNCF: TAction;
     MITiposNCF: TMenuItem;
     AADRNaturalezaPeligro: TAction;
     AADRMedidasProteccion: TAction;
     AListadoCuota: TAction;
     MIListadoCuota: TMenuItem;
     AControlPlazas: TAction;
     MIControlPlazas: TMenuItem;
     MIConsultadeItbis: TMenuItem;
     AConsultaITBIS: TAction;
     MIConfiguarImpresora: TMenuItem;
     MIConciliacionBancaria: TMenuItem;
     AConciliacionBancaria: TAction;
     ANomina: TAction;
     MINomina: TMenuItem;
     AAbreINI: TAction;
     MIAbreINI: TMenuItem;
     MITraspasoMulticanales: TMenuItem;
     ATraspasoMulticanales: TAction;
     ZAModelos: TAction;
     ZALonas: TAction;
     ZALonasForma: TAction;
     ZARibetes: TAction;
     ZABambalinas: TAction;
     ZAModelosDet: TAction;
     ZAColores: TAction;
     ZAModelosFechas: TAction;
     ZATarifasModelos: TAction;
     ZAPedidosEsp: TAction;
     ZAPedidosEspTodos: TAction;
     ZADatosAuxiliares: TAction;
     ZATiposConfig: TAction;
     ZAVerEstadoPedCli: TAction;
     ZAVerEstadoOrdenesCli: TAction;
     ZAMarcajeManual: TAction;
     ZAPuestos: TAction;
     ZAMarcajes: TAction;
     ZAImprimePedEspPdte: TAction;
     ZALstPedEntrega: TAction;
     ZAArticulos: TAction;
     ZAPedidosAAlbaran: TAction;
     ZAPedidosMalCerrados: TAction;
     ZALstPedVenLin: TAction;
     ZATiposArticulos: TAction;
     ZALstTiempoMarc: TAction;
     ZAMarcManDirecto: TAction;
     ZALstFechaPrevProv: TAction;
     ZAConfiguracion: TAction;
     ZAConsultarTarifasModelos: TAction;
     MIListadoDeStockMnimoTyC: TMenuItem;
     MIListadoDeUnidadesPendientesDeServirTyC: TMenuItem;
     MIPedidosVentasPendientesTyC: TMenuItem;
     MGTyC: TMenuItem;
     MIVisualizarArticulos: TMenuItem;
     MIMantenimientoDeModelos: TMenuItem;
     MIDatosDeModelos: TMenuItem;
     MIFechasAServirDeModelos: TMenuItem;
     MITarifasModelos: TMenuItem;
     MIConsultaTarifasModelos: TMenuItem;
     MISeparador53: TMenuItem;
     MIPedidosAAlbaran: TMenuItem;
     MIPedidosEspeciales: TMenuItem;
     MIVerPedidosEspeciales: TMenuItem;
     MIVerEstadodePedidosPorCliente: TMenuItem;
     MIVerEstadoDeOrdenesPorCliente: TMenuItem;
     MIPedidosMalCerrados: TMenuItem;
     MISeparador56: TMenuItem;
     MIMarcajesTyC: TMenuItem;
     MIMarcajesManuales: TMenuItem;
     MIMarcajeManualDirecto: TMenuItem;
     MISeparador57: TMenuItem;
     MGAuxiliaresTyC: TMenuItem;
     MIDatosAuxiliares: TMenuItem;
     MIMantenimientoDeLonas: TMenuItem;
     MIFormasDeLona: TMenuItem;
     MIMantenimientoDeBambalinas: TMenuItem;
     MIMantenimientoDeRibetes: TMenuItem;
     MIColoresTyC: TMenuItem;
     MITiposDeConfiguracion: TMenuItem;
     MISeparador62: TMenuItem;
     MIPuestos: TMenuItem;
     MGListadosTyC: TMenuItem;
     ImprimirPedidosEspecialesPendientes1: TMenuItem;
     ListadodePedidosporEntrega1: TMenuItem;
     VentasdePedidosporLineal1: TMenuItem;
     ZALstFechaPrevProv1: TMenuItem;
     MIConfiguracionTyC: TMenuItem;
     MITiposDeArticulo: TMenuItem;
     MIListadoDeTiemposDeMarcajeManual: TMenuItem;
     APedidosVentaPendientesTyC: TAction;
     AListadoDeUnidadesPendientesDeServirTyC: TAction;
     AListadoDeStockMnimoTyC: TAction;
     MIDespiece: TMenuItem;
     MISeparador54: TMenuItem;
     AEquivalenciaColores: TAction;
     MIEquivalenciaColoresTyC: TMenuItem;
     ADespiece: TAction;
     TButtListarRecibos: TToolButton;
     AImprimeRecibos: TAction;
     MIListarRecibos: TMenuItem;
     AOfertasANDALplast: TAction;
     MGANDALplast: TMenuItem;
     MIOfertasANDALplast: TMenuItem;
     AMoldes: TAction;
     MIMoldes: TMenuItem;
     APostizos: TAction;
     MIPostizos: TMenuItem;
     ALstCosteVentasMP: TAction;
     MILstCostedeMercancaVendida: TMenuItem;
     ALstArticulosCliente: TAction;
     MIListadoArticulosCliente: TMenuItem;
     AGestionDocumentosPago: TAction;
     MIGestionDocumentosPago: TMenuItem;
     AEnviarDatosPonys: TAction;
     MIEnviarDatosaWebPonys: TMenuItem;
     AGaleriaImagen: TAction;
     MIGaleriadeImagenes: TMenuItem;
     TButtMarca: TToolButton;
     AMarca: TAction;
     MIMarca: TMenuItem;
     MIListadoDeMateriasPeligrosas: TMenuItem;
     AGestionTareasProduccion: TAction;
     MIGestionTareasProduccion: TMenuItem;
     MIExportacionEuroPastry: TMenuItem;
     AExportacionEuroPastry: TAction;
     MiPrueba: TMenuItem;
     ADividirFacturas: TAction;
     MIDividirFacturas: TMenuItem;
     TVerificarServidor: TTimer;
     AMemoriaContable: TAction;
     MIMemoriaContable: TMenuItem;
     ASincronizaTiendaMasYMasBarato: TAction;
     MISincronizaTiendaMasYMasBarato: TMenuItem;
     AHojaDeTrabajo: TAction;
     MIHojasdeTrabajo: TMenuItem;
     AFichaTecnica: TAction;
     MIFichaTecnicaVehicular: TMenuItem;
     MIMarcas: TMenuItem;
     AMarcas: TAction;
     MIExtraccionDatos: TMenuItem;
     AExtraccionDatos: TAction;
     MINecesidadesMateriaPrima: TMenuItem;
     ANecesidadMateraPrima: TAction;
     MIPartedeMovimientos: TMenuItem;
     AParteMovimiento: TAction;
     MIPedidospendientesdeproveedor: TMenuItem;
     APedidosPendientesProv2: TAction;
     MIRecibosdeIngresosDesglosados: TMenuItem;
     ARecibosdeIngresosDesglosados: TAction;
     MITipoModelo: TMenuItem;
     ATipoModelo: TAction;
     ARepartirHorasProyecto: TAction;
     ButtRepartirHorasProyecto: TToolButton;
     MIOrdenesdePago: TMenuItem;
     PMIConfirming: TMenuItem;
     MICalendario: TMenuItem;
     MICalendarioZona: TMenuItem;
     ACalendarioZona: TAction;
     AKitTallas: TAction;
     MIKitTallas: TMenuItem;
     TButtKitsTallas: TToolButton;
     ASII: TAction;
     MISII: TMenuItem;
     ATipoIncidenciaMaq: TAction;
     MITipoIncidenciaMaq: TMenuItem;
     ALSTIngresos: TAction;
     AImprimeCartaPortes: TAction;
     MIImprimeCartadePortes: TMenuItem;
     MIImportesProrrateadors: TMenuItem;
     MIABCComprasKri: TMenuItem;
     MIABCVentasKri: TMenuItem;
     AMuestraMenu: TAction;
     AAlquileres: TAction;
     MIAlquileres: TMenuItem;
     MGEcommerce: TMenuItem;
     MISeparador6: TMenuItem;
     MISeparador3: TMenuItem;
     MISeparador11: TMenuItem;
     MISeparador9: TMenuItem;
     MISeparador13: TMenuItem;
     MISeparador15: TMenuItem;
     MISeparador18: TMenuItem;
     MISeparador82: TMenuItem;
     MISeparador21: TMenuItem;
     MISeparador31: TMenuItem;
     MISeparador32: TMenuItem;
     MGEmpleados: TMenuItem;
     MISeparador35: TMenuItem;
     MISeparador42: TMenuItem;
     MISeparador65: TMenuItem;
     MISeparador68: TMenuItem;
     MISeparador71: TMenuItem;
     MISeparador2: TMenuItem;
     MISeparador60: TMenuItem;
     MISeparador79: TMenuItem;
     MGAuxiliaresAlmacen: TMenuItem;
     MISeparador69: TMenuItem;
     MISeparador70: TMenuItem;
     MISeparador7: TMenuItem;
     MISeparador8: TMenuItem;
     MISeparador4: TMenuItem;
     MISeparador1: TMenuItem;
     MIOtros: TMenuItem;
     MIVentasOtrasOpciones: TMenuItem;
     MISeparador20: TMenuItem;
     MGContabilidadOtrasOpciones: TMenuItem;
     MISeparador25: TMenuItem;
     MISeparador34: TMenuItem;
     MGTesoreriaOtrasOpciones: TMenuItem;
     MGProduccionOtrasOpciones: TMenuItem;
     MISeparador39: TMenuItem;
     MIMGAuxiliaresCRM: TMenuItem;
     MGCRMOtrasOpciones: TMenuItem;
     MISeparador49: TMenuItem;
     MISeparador50: TMenuItem;
     MIOtrasOpciones1: TMenuItem;
     MISeparador61: TMenuItem;
     MISeparador58: TMenuItem;
     MISeparador52: TMenuItem;
     MISeparador55: TMenuItem;
     MGEmpresasOtrasOpciones: TMenuItem;
     MISeparador64: TMenuItem;
     MISeparador81: TMenuItem;
     MISeparador37: TMenuItem;
     MISeparador38: TMenuItem;
     MISeparador43: TMenuItem;
     MISeparador44: TMenuItem;
     MISeparador45: TMenuItem;
     MISeparador46: TMenuItem;
     MISeparador47: TMenuItem;
     MISeparador72: TMenuItem;
     MISeparador73: TMenuItem;
     MISeparador74: TMenuItem;
     MISeparador75: TMenuItem;
     MISeparador76: TMenuItem;
     MISeparador77: TMenuItem;
     APeriodoFacturacion: TAction;
     MIPeriodoFacturacion: TMenuItem;
     ASincronizacionTiendaPureWorks: TAction;
     MISincronizacionTiendaPureWorks: TMenuItem;
     MIEstructuraContableEmpresa: TMenuItem;
     MITipoAsiento: TMenuItem;
     MILstCentroCoste: TMenuItem;
     MIListadoCaja: TMenuItem;
     AContaGrupoCuentas: TAction;
     MIContaGrupoCuentas: TMenuItem;
     MIRepartirHorasProyecto: TMenuItem;
     AImportesMaximoPeriodo: TAction;
     MIImportesMaximoPeriodo: TMenuItem;
     ATipoIncidenciaRep: TAction;
     MITipoIncidenciaRep: TMenuItem;
     MIRutasAgente: TMenuItem;
     ARutasAgente: TAction;
     MGTPV: TMenuItem;
     MISesionCajaTurno: TMenuItem;
     ASesionCajaTurno: TAction;
     MIVentasTPV: TMenuItem;
     MICajasEmpresa: TMenuItem;
     MICajasSistema: TMenuItem;
     MIFormasPagoTPV: TMenuItem;
     ADisenarTicket: TAction;
     ADisenarVale: TAction;
     MGDisenarInformeTPV: TMenuItem;
     MIDisearTicket: TMenuItem;
     MIDisearVale: TMenuItem;
     MIFacturarTicketsTPV: TMenuItem;
     MIConfiguracionTPV: TMenuItem;
     AConfiguracionTPV: TAction;
     ARegistroFitosanitario: TAction;
     MIRegistroFitosanitario: TMenuItem;
     APorcentajeFacturacion: TAction;
     MIPorcentajeFacturacion: TMenuItem;
     MITiposEstadoMarcajePedidos: TMenuItem;
     AOpeEstadoMarcajePedido: TAction;
     MINumerosDeAutorizacion: TMenuItem;
     ANumerosDeAutorizacion: TAction;
     MGADR: TMenuItem;
     MIADRUNNumbers: TMenuItem;
     AADRUNNumbers: TAction;
     AADRClases: TAction;
     AADRPackingGroups: TAction;
     AADRTunelCodes: TAction;
     MIADRClases: TMenuItem;
     MIADRGruposDeEmbalaje: TMenuItem;
     MIADRCodigosDeTunel: TMenuItem;
     AADRTipos: TAction;
     MIADRTipos: TMenuItem;
     ATPVSincronizacion: TAction;
     MITPVSincronizacion: TMenuItem;
     ATPVConfigSincronizacion: TAction;
     MITPVConfigSincronizacion: TMenuItem;
     MIRelacionPedidosVenta: TMenuItem;
     APedidosPendientesCli: TAction;
     AListarEtiquetas: TAction;
     MIListarEtiquetas: TMenuItem;
     TButtListarEtiquetas: TToolButton;
     MIComprasOtrasOpciones: TMenuItem;
     MSGListadosCompras: TMenuItem;
     MISeparador86: TMenuItem;
     MICuotasClientes: TMenuItem;
     ACuotasClientes: TAction;
     AExportacionHelios: TAction;
     AImportacionVending: TAction;
     MIExportacionHelios: TMenuItem;
     MIImportacionVending: TMenuItem;
     AMaquinasVending: TAction;
     MIMaquinasVending: TMenuItem;
     AUbicacionesSimple: TAction;
     MiUbicacionesSimple: TMenuItem;
     AImportacionFichajesDePresencia: TAction;
     MIImportacionFichajesDePresencia: TMenuItem;
     AModelo390: TAction;
     MIModelo390: TMenuItem;
     ALstCalendarioLaboral: TAction;
     MIListadoCalendarioLaboral: TMenuItem;
     AAuditoria: TAction;
     MIAuditora: TMenuItem;
     ATerceros2: TAction;
     MITercerosVer2: TMenuItem;
     ACambiarCanal: TAction;
     ACategoriaCliente: TAction;
     MICategoriasdeCliente: TMenuItem;
     MiSep87: TMenuItem;
     MITipoColor_EnTyC: TMenuItem;
     MIColores_EnTyC: TMenuItem;
     AAsistenteImpClientes: TAction;
     MIAsistenteImportacionClientes: TMenuItem;
     MIDespieceEnProduccion: TMenuItem;
     AAsistenteImpProveedores: TAction;
     MIAsistenteImportacionProveedores: TMenuItem;
     MIAsisteteImportacionAcreedores: TMenuItem;
     AAsistenteImpAcreedores: TAction;
     AAsistenteImpArticulos: TAction;
     MIsistenteImportaciondeArticulos: TMenuItem;
     MGItbis: TMenuItem;
     TVerificarImpresora: TTimer;
     ARefrescarImpresoras: TAction;
     MIRefrescarLista1: TMenuItem;
     MIRefrescarLista2: TMenuItem;
     MIRefrescarLista3: TMenuItem;
     MIADRNaturalezasPeligro: TMenuItem;
     MIADRMedidasProteccion: TMenuItem;
     APruebas: TAction;
     AExportacionTyrsa: TAction;
     ExportacionTablasTyrsa1: TMenuItem;
     AImportaListados: TAction;
     MIImportaListados: TMenuItem;
     ANuevoGrupoListados: TAction;
     MINuevoGrupoListados: TMenuItem;
     ARecalculaContabilidad: TAction;
     MIRecalculaContabilidad: TMenuItem;
     AFiltroAlbaranesCompra: TAction;
     MIFiltroAlbaranesCompra: TMenuItem;
     MGAuxiliaresTallas: TMenuItem;
     ARegiones: TAction;
     MIRegiones: TMenuItem;
     APoblaciones: TAction;
     MIPoblaciones: TMenuItem;
     MIListarTalones: TMenuItem;
     AImportacionDlivery: TAction;
     MIImportacionDlivery: TMenuItem;
     AImportacionMulty: TAction;
     MIImportacionMulty: TMenuItem;
     ACrmAsuntos: TAction;
     MICRMAsuntos: TMenuItem;
     AAtributos: TAction;
     MIMantenimientodeAtributos: TMenuItem;
     ASincronizacionEginer: TAction;
     MISincronizacionEginer: TMenuItem;
     ATipoImpuestoAdicional: TAction;
     MITipoImpuestoAdicional: TMenuItem;
     ASIICertificadoDigital: TAction;
     MGSII: TMenuItem;
     MISIICertificadoDigital: TMenuItem;
     ASIIFolios: TAction;
     MISIIFolios: TMenuItem;
     ASIIUrlEndpoint: TAction;
     MISIIUrlEndpoint: TMenuItem;
     AArtModGenero: TAction;
     MIArticuloModeloGenero: TMenuItem;
     AArtModTemporada: TAction;
     MIArtModTemporada: TMenuItem;
     AAsistenteImpModelos: TAction;
     MIAsistenteImpModelos: TMenuItem;
     AListarCuadreCaja: TAction;
     MIListarCuadreCaja: TMenuItem;
     ATiposBulto: TAction;
     MITiposBulto: TMenuItem;
     AReestablecerConexionesWEB: TAction;
     MIReestablecerConexionesWEB: TMenuItem;
     ATipoReparacion: TAction;
     ATipoActuacion: TAction;
     MITipoReparacion: TMenuItem;
     MITipoActuacion: TMenuItem;
     AServirPedidosVenta: TAction;
     MIServirPedidosVenta: TMenuItem;
     AEnvioDTE: TAction;
     MIEnvioDTE: TMenuItem;
     APrevisionDeCuentas: TAction;
     MIPrevisiondecuentas: TMenuItem;
     ASincronizaTiendaWoocommerce: TAction;
     MISincronizaTiendaWoocommerce: TMenuItem;
     ADatosTecnicos: TAction;
     MIDatosTecnicos: TMenuItem;
     ASIILROE: TAction;
     MISIILROE: TMenuItem;
     MIProrrateoCostes: TMenuItem;
     MGBandejaLaser: TMenuItem;
     ARefrescarBandejas: TAction;
     MERefrescarBandejas: TMenuItem;
     MIIntrastat: TMenuItem;
     ACilindros: TAction;
     MICilindros: TMenuItem;
     AEstadisticaTubosParis: TAction;
     MIEstadisticaTubosParis: TMenuItem;
     MGNominas: TMenuItem;
     MINominas: TMenuItem;
     ANominas: TAction;
     MINominasConceptos: TMenuItem;
     ANominasConceptos: TAction;
     ARHPersona: TAction;
     MIRHPersonas: TMenuItem;
     AEstadisitcasComparadas: TAction;
     MIEstadisicasComparadas: TMenuItem;
     AEtiColor: TAction;
     AEtiAnilox: TAction;
     MIEtiAnilox: TMenuItem;
     MIEtiColor: TMenuItem;
     MGProduccionSimple: TMenuItem;
     MIEscandalloProd: TMenuItem;
     MIOrdenProduccion: TMenuItem;
     MIListNecesidades: TMenuItem;
     MIProcesosProd: TMenuItem;
     MIOrdenProduccionTallasKri: TMenuItem;
     MGImpuestosChile: TMenuItem;
     MISeparador88: TMenuItem;
     MISeparador89: TMenuItem;
     AAgrupacionOfertas: TAction;
     MIServirOfertasporLneas: TMenuItem;
     RCVCompra: TMenuItem;
     ARCVCompra: TAction;
     ALoteSimple: TAction;
     MILoteSimple: TMenuItem;
     AAsistenteImpStockMinMax: TAction;
     MIAsistenteImportacionStockMinMax: TMenuItem;
     AEmpresasChile: TAction;
     MIEmpresasChile: TMenuItem;
     AIncidenciasMarcajes: TAction;
     MIIncidenciasMarcajes: TMenuItem;
     MISIIConfCorreos: TMenuItem;
     ASIIConfCorreos: TAction;
     MITareasExternas: TMenuItem;
     AProTareasExternas: TAction;
     AGenerarFacturasElectronicasES: TAction;
     MIGenerarFacturasElectrnicasES: TMenuItem;
     ASIITipoDTE: TAction;
     MISIITipoDTE: TMenuItem;
     AEscandalloGarantias: TAction;
     AAsignacionGarantias: TAction;
     MGGarantias: TMenuItem;
     MIEscandalloGarantias: TMenuItem;
     MIAsignacionGarantias: TMenuItem;
     ANominasConstantes: TAction;
     MINominasConstantes: TMenuItem;
     MINominasConceptosCHL: TMenuItem;
     ANominasConceptosCHL: TAction;
     ANominasPlantilla: TAction;
     MINominasPlantilla: TMenuItem;
     AJornada: TAction;
     JornadasHorariosCCostos1: TMenuItem;
     ARecepcionFichaTecnica: TAction;
     MIRecepcionFichaTecnica: TMenuItem;
     MISeparador90: TMenuItem;
     MISeparador91: TMenuItem;
     MISeparador92: TMenuItem;
     MISeparador93: TMenuItem;
     MIMotivosAbono: TMenuItem;
     AMotivosAbono: TAction;
     ADisenarTicketRecogida: TAction;
     MIDisearTicketRecogida: TMenuItem;
     AModelo592: TAction;
     MIModelo592: TMenuItem;
     APrecioReposicion: TAction;
     MIPrecioReposicion: TMenuItem;
     AGamasPrecioReposicion: TAction;
     MIGamasPrecioReposicion: TMenuItem;
     TBMuestraMenu: TToolButton;
     ADashboard: TAction;
     MIDashboard: TMenuItem;
     ABrevo: TAction;
     MIBrevo: TMenuItem;
     AAdjuntos: TAction;
     AImportarEscProduccion: TAction;
     MIImportarEscProduccion: TMenuItem;
     AComoNosConocieron: TAction;
     MIComoNosConocieron: TMenuItem;
     AImportacionTarifasTyC: TAction;
     MIImportacionTarifasTyC: TMenuItem;
     ASincronizacionSkrit: TAction;
     MISincronizacionSkrit: TMenuItem;
     ASincronizacionColon: TAction;
     MISincronizacionColon: TMenuItem;
     AVerifactu: TAction;
     MIVerifactu: TMenuItem;
     ECFVentas: TMenuItem;
     AECFVentas: TAction;
     ADGIIConfiguracionEnvio: TAction;
     MIConfiguracionEnvio: TMenuItem;
     MIDGII: TMenuItem;
     AEstadisticasSimples: TAction;
     MIEstadisticasSimples: TMenuItem;
     ADiarioReparaciones: TAction;
     MIDiariodeReparaciones: TMenuItem;
     ASincronizacionTyC: TAction;
     MISincronizacionTyC: TMenuItem;
     AECFCompras: TAction;
     MIECFCompras: TMenuItem;
     TmrVerificaVerifactu: TTimer;
     ASMSPubli: TAction;
     MISMSPubli: TMenuItem;
     MGTransportistas: TMenuItem;
     MISeparador94: TMenuItem;
     ATransportistasIDRIL: TAction;
     MITransportistasIDRIL: TMenuItem;
     ADivilo: TAction;
     MIDivilo: TMenuItem;
     APresenciaDispositivo: TAction;
     MIPresenciaDispositivo: TMenuItem;
     MISeparador95: TMenuItem;
     APresenciaTipoMarcaje: TAction;
     MIPresenciaTipoPresencia: TMenuItem;
     APresenciaFichar: TAction;
     MIPresenciaFichar: TMenuItem;
     AConfigServidoresCorreo: TAction;
     MIConfigServidoresCorreo: TMenuItem;
     ASincronizacionHubSpot: TAction;
     MISincronizacionHubSpot: TMenuItem;
     ACaracteristicasArticulo: TAction;
     MICaracteristicasArticulo: TMenuItem;
     AAgenda: TAction;
     TBAgenda: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure ASalirExecute(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure DTPFechaTrabajoCloseUp(Sender: TObject);
     procedure AAcercaExecute(Sender: TObject);
     procedure AUsuariosExecute(Sender: TObject);
     procedure AProvinciasExecute(Sender: TObject);
     procedure ALocalidadesExecute(Sender: TObject);
     procedure AContaEstructuraExecute(Sender: TObject);
     procedure ACambiaUserExecute(Sender: TObject);
     procedure ACFGPrintExecute(Sender: TObject);
     procedure AUbicacionesExecute(Sender: TObject);
     procedure AEmpresasExecute(Sender: TObject);
     procedure AMonedasExecute(Sender: TObject);
     procedure AConfigExecute(Sender: TObject);
     procedure AContaMovimientosExecute(Sender: TObject);
     procedure AContaConceptosExecute(Sender: TObject);
     procedure ATercerosExecute(Sender: TObject);
     procedure APaisesExecute(Sender: TObject);
     procedure ACanalesExecute(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure AAlmacenesExecute(Sender: TObject);
     procedure AFamiliasExecute(Sender: TObject);
     procedure ATarifasExecute(Sender: TObject);
     procedure AArticulosExecute(Sender: TObject);
     procedure AContaBorradorExecute(Sender: TObject);
     procedure AContaDefBalancesExecute(Sender: TObject);
     procedure AContaCuentasAnualesExecute(Sender: TObject);
     procedure ATipoIvaExecute(Sender: TObject);
     procedure AModoIvaExecute(Sender: TObject);
     procedure AMvStManExecute(Sender: TObject);
     procedure APedidosExecute(Sender: TObject);
     procedure AFacturasExecute(Sender: TObject);
     procedure AContaDiarioExecute(Sender: TObject);
     procedure AContaSumYSaldosExecute(Sender: TObject);
     procedure ARegIVAExecute(Sender: TObject);
     procedure AContadoresExecute(Sender: TObject);
     procedure AContaPlantillasExecute(Sender: TObject);
     procedure ACambioMonedasExecute(Sender: TObject);
     procedure AClientesExecute(Sender: TObject);
     procedure AProveedoresExecute(Sender: TObject);
     procedure AFondoExecute(Sender: TObject);
     procedure AContaPGCExecute(Sender: TObject);
     procedure AAgentesExecute(Sender: TObject);
     procedure AAcreedoresExecute(Sender: TObject);
     procedure ACarteraExecute(Sender: TObject);
     procedure AFormaPagoExecute(Sender: TObject);
     procedure AContaCuentasIVAExecute(Sender: TObject);
     procedure AGenCanalesExecute(Sender: TObject);
     procedure AGenSeriesExecute(Sender: TObject);
     procedure AGenEjerciciosExecute(Sender: TObject);
     procedure AContaCuentasExecute(Sender: TObject);
     procedure AMenuRapidoExecute(Sender: TObject);
     procedure APropagaExecute(Sender: TObject);
     procedure AAlbaranesExecute(Sender: TObject);
     procedure AOfertasExecute(Sender: TObject);
     procedure APropPedidosExecute(Sender: TObject);
     procedure APedidosProvExecute(Sender: TObject);
     procedure ARecepcionPedidosExecute(Sender: TObject);
     procedure AContaCierreYAperturaExecute(Sender: TObject);
     procedure ASeriesExecute(Sender: TObject);
     procedure ACampanyasExecute(Sender: TObject);
     procedure AFacAlbaranesExecute(Sender: TObject);
     procedure AFacHistProcesosExecute(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure ABusquedaExecute(Sender: TObject);
     procedure APeriodosSistemaExecute(Sender: TObject);
     procedure AGenPeriodosExecute(Sender: TObject);
     procedure AAmortizacionesExecute(Sender: TObject);
     procedure AImprimeFacturasExecute(Sender: TObject);
     procedure ASysCuentasExecute(Sender: TObject);
     procedure APerfilesExecute(Sender: TObject);
     procedure AAjustesExecute(Sender: TObject);
     procedure ACentrosInventarioExecute(Sender: TObject);
     procedure ANewTarifasExecute(Sender: TObject);
     procedure AAlbaranesProvExecute(Sender: TObject);
     procedure AFacturasProvExecute(Sender: TObject);
     procedure ALSTIVAListadoExecute(Sender: TObject);
     procedure APerfilesUsuarioExecute(Sender: TObject);
     procedure ARemesasExecute(Sender: TObject);
     procedure APregMayorCantidadExecute(Sender: TObject);
     procedure ALSTStockMinimoExecute(Sender: TObject);
     procedure ALSTDiarioStockExecute(Sender: TObject);
     procedure AFacAlbaranesProvExecute(Sender: TObject);
     procedure AContaCuentasIRPFExecute(Sender: TObject);
     procedure ATipoIrpfExecute(Sender: TObject);
     procedure AEscandalloExecute(Sender: TObject);
     procedure ABancosExecute(Sender: TObject);
     procedure ALSTStockResumidoExecute(Sender: TObject);
     procedure ALSTStockAlmacenExecute(Sender: TObject);
     procedure AListarCarteraExecute(Sender: TObject);
     procedure ADiarioIVAExecute(Sender: TObject);
     procedure ALSTInventarioExecute(Sender: TObject);
     procedure AAgrupacionPedidosExecute(Sender: TObject);
     procedure AUnidadesExecute(Sender: TObject);
     procedure ARenumeraContabilidadExecute(Sender: TObject);
     procedure AGenBancosExecute(Sender: TObject);
     procedure ARazonesExecute(Sender: TObject);
     procedure AFacturasAcrExecute(Sender: TObject);
     procedure ACierraFacturasExecute(Sender: TObject);
     procedure ACuentasAnualesExecute(Sender: TObject);
     procedure ABalanceExecute(Sender: TObject);
     procedure AAGrupacionesExecute(Sender: TObject);
     procedure ATiposDirExecute(Sender: TObject);
     procedure ATiposAcreedorExecute(Sender: TObject);
     procedure AListadorExecute(Sender: TObject);
     procedure AProyectosExecute(Sender: TObject);
     procedure ACodigosBarrasExecute(Sender: TObject);
     procedure ATiposEfectosExecute(Sender: TObject);
     procedure APunteoAsientosExecute(Sender: TObject);
     procedure ATipoImpuestosExecute(Sender: TObject);
     procedure ATarifasProveedorExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure APropagaEmpresaExecute(Sender: TObject);
     procedure TButtTarifasClick(Sender: TObject);
     procedure ASaldosExecute(Sender: TObject);
     procedure AFormasPagoExecute(Sender: TObject);
     procedure ACondAgentesExecute(Sender: TObject);
     procedure ACondAgeAgrupExecute(Sender: TObject);
     procedure ACondAgeCliExecute(Sender: TObject);
     procedure AABCVentasExecute(Sender: TObject);
     procedure ATercerosCuentasExecute(Sender: TObject);
     procedure AABCComprasExecute(Sender: TObject);
     procedure APCRecAgrupadosExecute(Sender: TObject);
     procedure AAyudaenLineaExecute(Sender: TObject);
     procedure APlazosGarantiaExecute(Sender: TObject);
     procedure AEscandalloProdExecute(Sender: TObject);
     procedure AOrdenProduccionExecute(Sender: TObject);
     procedure ANuevoReciboExecute(Sender: TObject);
     procedure ACambiaFechaExecute(Sender: TObject);
     procedure AFacAlbaranesProvDetExecute(Sender: TObject);
     procedure AListNecesidadesExecute(Sender: TObject);
     procedure AWordExecute(Sender: TObject);
     procedure AConfirmingExecute(Sender: TObject);
     procedure AAnticiposExecute(Sender: TObject);
     procedure AModelo300Execute(Sender: TObject);
     procedure AModelo303Execute(Sender: TObject);
     procedure AModelo115Execute(Sender: TObject);
     procedure AModelo110Execute(Sender: TObject);
     procedure ARetEmpleadosExecute(Sender: TObject);
     procedure AModelo330Execute(Sender: TObject);
     procedure ATalonesExecute(Sender: TObject);
     procedure ATalonesCtaExecute(Sender: TObject);
     procedure ALSTDepositosActivosExecute(Sender: TObject);
     procedure ALSTFichaMargendeProductosExecute(Sender: TObject);
     procedure TButtHaciendaClick(Sender: TObject);
     procedure TButtTalonesClick(Sender: TObject);
     procedure AContaDefBalancesCABExecute(Sender: TObject);
     procedure ACierraFacExecute(Sender: TObject);
     procedure AMuestraRecibosExecute(Sender: TObject);
     procedure ATraspasoExecute(Sender: TObject);
     procedure ALSTUnidadesPendientesExecute(Sender: TObject);
     procedure AModelo190Execute(Sender: TObject);
     procedure AExporta190Execute(Sender: TObject);
     procedure ACierraTodasExecute(Sender: TObject);
     procedure AHistoricoPMPExecute(Sender: TObject);
     procedure APonderarDocsExecute(Sender: TObject);
     procedure AMonedasCuentaExecute(Sender: TObject);
     procedure AAgrupacionFacExecute(Sender: TObject);
     procedure ACorreoEmpresaExecute(Sender: TObject);
     procedure AEmpCanalesExecute(Sender: TObject);
     procedure AClasesDireccionesExecute(Sender: TObject);
     procedure ADuplicaEscandalloExecute(Sender: TObject);
     procedure APagaresExecute(Sender: TObject);
     procedure AConfINIExecute(Sender: TObject);
     procedure AContRecuperacionExecute(Sender: TObject);
     procedure ATiposCalculoExecute(Sender: TObject);
     procedure ACondicionesEspecialesExecute(Sender: TObject);
     procedure AMonedasMaestrosExecute(Sender: TObject);
     procedure ACondicionesProvExecute(Sender: TObject);
     procedure AImprimeAlbaranesExecute(Sender: TObject);
     procedure ACamMonCarteraExecute(Sender: TObject);
     procedure ALSTLotesExecute(Sender: TObject);
     procedure ALSTLotesComprasExecute(Sender: TObject);
     procedure ALSTLotesVentasExecute(Sender: TObject);
     procedure ALSTLotesMovimientosExecute(Sender: TObject);
     procedure AModelo347Execute(Sender: TObject);
     procedure AConfModelo347Execute(Sender: TObject);
     procedure AConfModelo190Execute(Sender: TObject);
     procedure AConfModelo110Execute(Sender: TObject);
     procedure AConfModelo115Execute(Sender: TObject);
     procedure AConfModelo300Execute(Sender: TObject);
     procedure AConfModelo303Execute(Sender: TObject);
     procedure AConfModelo330Execute(Sender: TObject);
     procedure APropagaStocksExecute(Sender: TObject);
     procedure AArtProvExecute(Sender: TObject);
     procedure AArtCliExecute(Sender: TObject);
     procedure ALSTUnidPendRecibirExecute(Sender: TObject);
     procedure AColoresTallasExecute(Sender: TObject);
     procedure AGruposTallasExecute(Sender: TObject);
     procedure AModelosTallasExecute(Sender: TObject);
     procedure AProcesosProdExecute(Sender: TObject);
     procedure ATiposRedondeoExecute(Sender: TObject);
     procedure APedidosVentaPendientesExecute(Sender: TObject);
     procedure APedidosCompraPendientesExecute(Sender: TObject);
     procedure AAvisosExecute(Sender: TObject);
     procedure ARepUsuarioAlmExecute(Sender: TObject);
     procedure ArepUsuarioComprasExecute(Sender: TObject);
     procedure ARepUsuarioContaExecute(Sender: TObject);
     procedure ARepUsuariosVentasExecute(Sender: TObject);
     procedure ARepUsuariosTercerosExecute(Sender: TObject);
     procedure ATipoAsientoExecute(Sender: TObject);
     procedure AIncrementoPorcentualExecute(Sender: TObject);
     procedure ARepUsuarioTesoreriaExecute(Sender: TObject);
     procedure ARepUsuarioProduccionExecute(Sender: TObject);
     procedure AConsultaNroSerieKriExecute(Sender: TObject);
     procedure AMantenimientoNroSerieExecute(Sender: TObject);
     procedure AImprimirEtiquetasKriExecute(Sender: TObject);
     procedure AProrrateoCostesExecute(Sender: TObject);
     procedure ALSTGeneraTmpInventarioKriExecute(Sender: TObject);
     procedure AImagenesExecute(Sender: TObject);
     procedure ARiesgoBancosExecute(Sender: TObject);
     procedure ARiesgoClientesExecute(Sender: TObject);
     procedure AAsignaBancoRemesaExecute(Sender: TObject);
     procedure ATransmisionesPatrimonialesExecute(Sender: TObject);
     procedure ASumasYSaldosKriExecute(Sender: TObject);
     procedure ALSTStockTallasExecute(Sender: TObject);
     procedure AOrdenProduccionTallasKriExecute(Sender: TObject);
     procedure AFacAlbaranesCliDetExecute(Sender: TObject);
     procedure AEDIExecute(Sender: TObject);
     procedure AAgrupacionDeAlbaranesKriExecute(Sender: TObject);
     procedure ACentroDeCostosExecute(Sender: TObject);
     procedure AIntrastatExecute(Sender: TObject);
     procedure AIntrastatComprasExecute(Sender: TObject);
     procedure AIntrastatVentasExecute(Sender: TObject);
     procedure ACierreStocksExecute(Sender: TObject);
     procedure ARegStocksExecute(Sender: TObject);
     procedure AConfIntrastatCVExecute(Sender: TObject);
     procedure AExporta349Execute(Sender: TObject);
     procedure ALotesExecute(Sender: TObject);
     procedure ALSTEstadisticasArtExecute(Sender: TObject);
     procedure APedFueraPlazoExecute(Sender: TObject);
     procedure ACondicionesVentaExecute(Sender: TObject);
     procedure AAsistenteEmpresaExecute(Sender: TObject);
     procedure AAsistenteEjercicioExecute(Sender: TObject);
     procedure ACondicionesCompraExecute(Sender: TObject);
     procedure AMatriculasExecute(Sender: TObject);
     procedure ANaturalezaMatExecute(Sender: TObject);
     procedure APedFueraPlazoVentasExecute(Sender: TObject);
     procedure AParamApuntesExecute(Sender: TObject);
     procedure AConfigTextosExecute(Sender: TObject);
     procedure AFacCuotasExecute(Sender: TObject);
     procedure AAlmacenesCallesExecute(Sender: TObject);
     procedure AAlmacenesEstanteriasExecute(Sender: TObject);
     procedure AAlmacenesRepisasExecute(Sender: TObject);
     procedure AAlmacenesPosicionExecute(Sender: TObject);
     procedure AEnvioRepartoExecute(Sender: TObject);
     procedure AConfigAlmcenExecute(Sender: TObject);
     procedure AIncidenciasExecute(Sender: TObject);
     procedure AMovEntreUbicacionesExecute(Sender: TObject);
     procedure ALstStockPorUbicacionExecute(Sender: TObject);
     procedure ALstMovEntreUbicacionesExecute(Sender: TObject);
     procedure AFacturasDirectasExecute(Sender: TObject);
     procedure ALstCentroCosteExecute(Sender: TObject);
     procedure ACaravanasExecute(Sender: TObject);
     procedure AMRPExecute(Sender: TObject);
     procedure ATipoPortesExecute(Sender: TObject);
     procedure ARangosPortesExecute(Sender: TObject);
     procedure APromocionesVentaExecute(Sender: TObject);
     procedure APromocionesIndirectasExecute(Sender: TObject);
     procedure AOrdenPromocionExecute(Sender: TObject);
     procedure ATrazabilidadLotesExecute(Sender: TObject);
     procedure AAsistenteTarifaExecute(Sender: TObject);
     procedure APropuestasExecute(Sender: TObject);
     procedure APropuestasConfirmExecute(Sender: TObject);
     procedure AArtBultosExecute(Sender: TObject);
     procedure APedidosPendientesExecute(Sender: TObject);
     procedure AAlbaranesPendientesExecute(Sender: TObject);
     procedure AFiltroFacturasExecute(Sender: TObject);
     procedure APedidosPendientesProvExecute(Sender: TObject);
     procedure AAlbaranesPendientesProvExecute(Sender: TObject);
     procedure AFiltroFacturasProvExecute(Sender: TObject);
     procedure AFiltroFacturasAcrExecute(Sender: TObject);
     procedure AUsuariosWebExecute(Sender: TObject);
     procedure AHistoricoProcesosProvExecute(Sender: TObject);
     procedure AAnaPlanesContablesExecute(Sender: TObject);
     procedure AAnaCentrosCosteExecute(Sender: TObject);
     procedure AAnaPlantillasImputacionExecute(Sender: TObject);
     procedure AAnaImputacionesCostesExecute(Sender: TObject);
     procedure AAnaExtractoExecute(Sender: TObject);
     procedure AAnaSumaYSaldosExecute(Sender: TObject);
     procedure AAnaAnalisisPresupuestoExecute(Sender: TObject);
     procedure AAnaPropagaEstructurasExecute(Sender: TObject);
     procedure AAnaLstPlanContableAnaliticoExecute(Sender: TObject);
     procedure AUsuarioCambiaClaveExecute(Sender: TObject);
     procedure AExportarAsientosExecute(Sender: TObject);
     procedure AImportarAsientosExecute(Sender: TObject);
     procedure AExportarSaldosExecute(Sender: TObject);
     procedure ADivisionesMaestrosExecute(Sender: TObject);
     procedure AParamModelosHaciendaExecute(Sender: TObject);
     procedure APresentacionesHaciendaExecute(Sender: TObject);
     procedure AOrdenesDePagoExecute(Sender: TObject);
     procedure ANorma43SLuciaExecute(Sender: TObject);
     procedure ACRMExecute(Sender: TObject);
     procedure ASincronizarBasesKriExecute(Sender: TObject);
     procedure ANorma43KriExecute(Sender: TObject);
     procedure AContaRectAsientosExecute(Sender: TObject);
     procedure AConfAlmacenesExecute(Sender: TObject);
     procedure AClientesPotencialesKriExecute(Sender: TObject);
     procedure APreciosCosteKriExecute(Sender: TObject);
     procedure AEquivalenciasExecute(Sender: TObject);
     procedure AModificaPGCExecute(Sender: TObject);
     procedure AGestionsExecute(Sender: TObject);
     procedure ATipoLineaVentaExecute(Sender: TObject);
     procedure APedidoEntreAlmacenesExecute(Sender: TObject);
     procedure ACambioEmpresaEjerCanalExecute(Sender: TObject);
     procedure ATraspasoPedCliAPedProvExecute(Sender: TObject);
     procedure ARecepcionWebExecute(Sender: TObject);
     procedure ATipoIncidenciaKriExecute(Sender: TObject);
     procedure AAlarmasIberfluidKriExecute(Sender: TObject);
     procedure AProcesosKriExecute(Sender: TObject);
     procedure AIdiomasKriExecute(Sender: TObject);
     procedure AModelo340Execute(Sender: TObject);
     procedure AImportarDocumentosExecute(Sender: TObject);
     procedure AZonasExecute(Sender: TObject);
     procedure APersonalUlisesExecute(Sender: TObject);
     procedure TAvisoTimer(Sender: TObject);
     procedure TAvisoMensajeTimer(Sender: TObject);
     procedure ATransportistasSEURExecute(Sender: TObject);
     procedure ATransportistasDHLExecute(Sender: TObject);
     procedure ATransportistasIDRILExecute(Sender: TObject);
     procedure AABCVentasKriExecute(Sender: TObject);
     procedure AABCComprasKriExecute(Sender: TObject);
     procedure TVerificaEntradaTimer(Sender: TObject);
     procedure TTerminarAplicacionTimer(Sender: TObject);
     procedure ACrmAmbitosExecute(Sender: TObject);
     procedure ACrmEMailsExecute(Sender: TObject);
     procedure ACrmTipoAccionesExecute(Sender: TObject);
     procedure ACrmContactosExecute(Sender: TObject);
     procedure ACrmConsultaAccionesExecute(Sender: TObject);
     procedure ACrmConfiguracionExecute(Sender: TObject);
     procedure ACrmOrigenRelExecute(Sender: TObject);
     procedure ACrmImportarContactosExecute(Sender: TObject);
     procedure AEstadisticasExecute(Sender: TObject);
     procedure AIsoAccPreventivaExecute(Sender: TObject);
     procedure AIsoMantTAccExecute(Sender: TObject);
     procedure AIsoPlanCapacExecute(Sender: TObject);
     procedure AIsoClassProvExecute(Sender: TObject);
     procedure AIsoDevMatExecute(Sender: TObject);
     procedure AIsoMantInformesExecute(Sender: TObject);
     procedure AIsoControlEquipExecute(Sender: TObject);
     procedure AIsoPunteosExecute(Sender: TObject);
     procedure AIsoFirmasExecute(Sender: TObject);
     procedure AIsoCursosExecute(Sender: TObject);
     procedure AIsoPlanningExecute(Sender: TObject);
     procedure AProEscandalloSFExecute(Sender: TObject);
     procedure AProDiarioExecute(Sender: TObject);
     procedure AProOrdenExecute(Sender: TObject);
     procedure AProGestionOrdExecute(Sender: TObject);
     procedure AProMarcajesTeExecute(Sender: TObject);
     procedure AProMarcajesVaExecute(Sender: TObject);
     procedure AProGenerarOrdExecute(Sender: TObject);
     procedure AProRecursosEmpExecute(Sender: TObject);
     procedure AOpeCategoriaExecute(Sender: TObject);
     procedure AOpeCTrabajoExecute(Sender: TObject);
     procedure AOpeDepartamentoExecute(Sender: TObject);
     procedure AOpeSeccionesExecute(Sender: TObject);
     procedure AOpeTContratoExecute(Sender: TObject);
     procedure AOpeEmpleadosExecute(Sender: TObject);
     procedure AProMaquinasExecute(Sender: TObject);
     procedure AOpeImputacionesExecute(Sender: TObject);
     procedure AOpeTImputacionExecute(Sender: TObject);
     procedure AOpeCalendarioExecute(Sender: TObject);
     procedure AOpeCalendarioEmpExecute(Sender: TObject);
     procedure AProLstOrdenExecute(Sender: TObject);
     procedure AProLstEscandalloExecute(Sender: TObject);
     procedure AProMatIncExecute(Sender: TObject);
     procedure AProTMaquinaExecute(Sender: TObject);
     procedure AProRecMarcajesExecute(Sender: TObject);
     procedure AProFasesExecute(Sender: TObject);
     procedure AProTareasExecute(Sender: TObject);
     procedure AProRecursosExecute(Sender: TObject);
     procedure AProLstMarcajesExecute(Sender: TObject);
     procedure AProConfigMarcajesExecute(Sender: TObject);
     procedure AOpeHorarioExecute(Sender: TObject);
     procedure AProLstMontajeExecute(Sender: TObject);
     procedure AProLstNecesidadesExecute(Sender: TObject);
     procedure AProUtillajesExecute(Sender: TObject);
     procedure AProLstHojaTrabajoExecute(Sender: TObject);
     procedure AProRelacionUdsExecute(Sender: TObject);
     procedure AProOfertasEExecute(Sender: TObject);
     procedure AProLstofertasEExecute(Sender: TObject);
     procedure AProMarcajesOpeExecute(Sender: TObject);
     procedure AProMarcajesMaqExecute(Sender: TObject);
     procedure AProMarcajesOpeEspExecute(Sender: TObject);
     procedure AProMarcajesMaqEspExecute(Sender: TObject);
     procedure AProPlanificarExecute(Sender: TObject);
     procedure AProDeslanzaExecute(Sender: TObject);
     procedure AProCabPlanificacionExecute(Sender: TObject);
     procedure AProTipTareasManExecute(Sender: TObject);
     procedure AProTareasManExecute(Sender: TObject);
     procedure AProEquivalArtExecute(Sender: TObject);
     procedure APautaExecute(Sender: TObject);
     procedure APauta_TipoControlExecute(Sender: TObject);
     procedure AObrObrasExecute(Sender: TObject);
     procedure AObrPartidasExecute(Sender: TObject);
     procedure AObrPartidasPlantillaExecute(Sender: TObject);
     procedure AProDiagramaGanttExecute(Sender: TObject);
     procedure AProTipoMarcajesExecute(Sender: TObject);
     procedure AProMarcajesBDExecute(Sender: TObject);
     procedure AProDesTipoPiezaExecute(Sender: TObject);
     procedure AProDesTipoMatExecute(Sender: TObject);
     procedure AProDesDespieceExecute(Sender: TObject);
     procedure ARecalcularExecute(Sender: TObject);
     procedure ADocumentosExecute(Sender: TObject);
     procedure AProLstMatEscExecute(Sender: TObject);
     procedure ALstNecEscExecute(Sender: TObject);
     procedure AImagenesArticulosExecute(Sender: TObject);
     procedure AArticulosAlmacenesExecute(Sender: TObject);
     procedure AProPantMarcajesExecute(Sender: TObject);
     procedure AAgrupaRecEscExecute(Sender: TObject);
     procedure AProUtilesExecute(Sender: TObject);
     procedure AProFormulasExecute(Sender: TObject);
     procedure ALstMatPeligrosasExecute(Sender: TObject);
     procedure APresenciaExecute(Sender: TObject);
     procedure APresenciaIncidenciaExecute(Sender: TObject);
     procedure APresenciaDiarioExecute(Sender: TObject);
     procedure ALstPresenciaExecute(Sender: TObject);
     procedure AProTMaquinaRevisionExecute(Sender: TObject);
     procedure AProTipoRevMaqExecute(Sender: TObject);
     procedure ACambioIdiomaExecute(Sender: TObject);
     procedure ATipoUnidadLogisticaExecute(Sender: TObject);
     procedure AAltaHojaDePreparacionExecute(Sender: TObject);
     procedure AHojaDePreparacionExecute(Sender: TObject);
     procedure AProtocolosDeVentaExecute(Sender: TObject);
     procedure AProtocoloDeVentasExecute(Sender: TObject);
     procedure ACierreParcialOrdenExecute(Sender: TObject);
     procedure ADepartamentoExecute(Sender: TObject);
     procedure ACrmTipoSeguimientoExecute(Sender: TObject);
     procedure ATipoUbicacionExecute(Sender: TObject);
     procedure ASectorAlmacenExecute(Sender: TObject);
     procedure ALstUbicacionesExecute(Sender: TObject);
     procedure AAlbaranesVentaPendientesExecute(Sender: TObject);
     procedure ZASysNCFExecute(Sender: TObject);
     procedure ZATalonesExecute(Sender: TObject);
     procedure ZADiarioVentasExecute(Sender: TObject);
     procedure ZAVentasFamiliaExecute(Sender: TObject);
     procedure ZAInteresesExecute(Sender: TObject);
     procedure AListadoITBISExecute(Sender: TObject);
     procedure ALSTTalonesExecute(Sender: TObject);
     procedure ZArecibosExecuteExecute(Sender: TObject);
     procedure AResponsableHojaDePreparacionExecute(Sender: TObject);
     procedure AGruposIncotermExecute(Sender: TObject);
     procedure ACodigosIncotermExecute(Sender: TObject);
     procedure AAsistenteImpIdiomaArticulosExecute(Sender: TObject);
     procedure AProMarcajesMaqEspTurnoExecute(Sender: TObject);
     procedure AProTurnosExecute(Sender: TObject);
     procedure AProCausasExecute(Sender: TObject);
     procedure AProDefectoExecute(Sender: TObject);
     procedure AProTiposDefectoExecute(Sender: TObject);
     procedure AIsoFichaTecnicaExecute(Sender: TObject);
     procedure AIsoCertificadoAnalisisExecute(Sender: TObject);
     procedure AIsoNormativasExecute(Sender: TObject);
     procedure AIsoTipoEnsayoExecute(Sender: TObject);
     procedure AIsoEnsayosExecute(Sender: TObject);
     procedure AImportarPedidosExecute(Sender: TObject);
     procedure MIListadosPersClick(Sender: TObject);
     procedure ATipoRetencionExecute(Sender: TObject);
     procedure APlanMaestroProduccionExecute(Sender: TObject);
     procedure ADiarioCostesExecute(Sender: TObject);
     procedure AGestionDeCobrosExecute(Sender: TObject);
     procedure ASincronizaIncidenciasExecute(Sender: TObject);
     procedure AMaestrosExecute(Sender: TObject);
     procedure AOrdenesExecute(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure APresupuestosExecute(Sender: TObject);
     procedure ALstPresupuestosExecute(Sender: TObject);
     procedure AMaquinasExecute(Sender: TObject);
     procedure ADetalleMaqExecute(Sender: TObject);
     procedure ATroquelesExecute(Sender: TObject);
     procedure AEtiConstantesExecute(Sender: TObject);
     procedure ATiposArticuloExecute(Sender: TObject);
     procedure AMaterialesExecute(Sender: TObject);
     procedure AColadasExecute(Sender: TObject);
     procedure AReparacionesExecute(Sender: TObject);
     procedure AMantConsumoExecute(Sender: TObject);
     procedure AZLstOfertasExecute(Sender: TObject);
     procedure ACompensacionRecibosExecute(Sender: TObject);
     procedure AGasExecute(Sender: TObject);
     procedure ATiposMonedaExecute(Sender: TObject);
     procedure AGasTanqueExecute(Sender: TObject);
     procedure AGasDispensadorExecute(Sender: TObject);
     procedure AGasColaCamionExecute(Sender: TObject);
     procedure AProSubsComponentesExecute(Sender: TObject);
     procedure AGasUtilesExecute(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure ADescargasGasExecute(Sender: TObject);
     procedure ASincronizaTiendaExecute(Sender: TObject);
     procedure AVerificacionesImpuestosExecute(Sender: TObject);
     procedure ASeriesClienteExecute(Sender: TObject);
     procedure ACrmArticulosExecute(Sender: TObject);
     procedure ACrmMarcajesExecute(Sender: TObject);
     procedure ACrmVentasExecute(Sender: TObject);
     procedure ACrmAccionesExecute(Sender: TObject);
     procedure AImportarArticulosExcelExecute(Sender: TObject);
     procedure APrevisionTesoreriaExecute(Sender: TObject);
     procedure ACrmImportarLocalidadesExecute(Sender: TObject);
     procedure ATipoColorTallasExecute(Sender: TObject);
     procedure AParametrizacionTallasExecute(Sender: TObject);
     procedure AProOrdTareaMatExecute(Sender: TObject);
     procedure AImprimePedidosExecute(Sender: TObject);
     procedure ATipoNCFExecute(Sender: TObject);
     procedure AADRNaturalezaPeligroExecute(Sender: TObject);
     procedure AADRMedidasProteccionExecute(Sender: TObject);
     procedure AListadoCuotaExecute(Sender: TObject);
     procedure AControlPlazasExecute(Sender: TObject);
     procedure AConsultaITBISExecute(Sender: TObject);
     procedure AConciliacionBancariaExecute(Sender: TObject);
     procedure ANominaExecute(Sender: TObject);
     procedure AAbreINIExecute(Sender: TObject);
     procedure ATraspasoMulticanalesExecute(Sender: TObject);
     procedure ZALonasExecute(Sender: TObject);
     procedure ZAModelosExecute(Sender: TObject);
     procedure ZALonasFormaExecute(Sender: TObject);
     procedure ZARibetesExecute(Sender: TObject);
     procedure ZABambalinasExecute(Sender: TObject);
     procedure ZAModelosDetExecute(Sender: TObject);
     procedure ZAColoresExecute(Sender: TObject);
     procedure ZAModelosFechasExecute(Sender: TObject);
     procedure ZATarifasModelosExecute(Sender: TObject);
     procedure ZAPedidosEspExecute(Sender: TObject);
     procedure ZAPedidosEspTodosExecute(Sender: TObject);
     procedure ZADatosAuxiliaresExecute(Sender: TObject);
     procedure ZATiposConfigExecute(Sender: TObject);
     procedure ZAVerEstadoPedCliExecute(Sender: TObject);
     procedure ZAVerEstadoOrdenesCliExecute(Sender: TObject);
     procedure ZAMarcajeManualExecute(Sender: TObject);
     procedure ZAPuestosExecute(Sender: TObject);
     procedure ZAMarcajesExecute(Sender: TObject);
     procedure ZAImprimePedEspPdteExecute(Sender: TObject);
     procedure ZALstPedEntregaExecute(Sender: TObject);
     procedure ZAArticulosExecute(Sender: TObject);
     procedure ZAPedidosAAlbaranExecute(Sender: TObject);
     procedure ZAPedidosMalCerradosExecute(Sender: TObject);
     procedure ZALstPedVenLinExecute(Sender: TObject);
     procedure ZATiposArticulosExecute(Sender: TObject);
     procedure ZALstTiempoMarcExecute(Sender: TObject);
     procedure ZAMarcManDirectoExecute(Sender: TObject);
     procedure ZALstFechaPrevProvExecute(Sender: TObject);
     procedure ZAConfiguracionExecute(Sender: TObject);
     procedure ZAConsultarTarifasModelosExecute(Sender: TObject);
     procedure APedidosVentaPendientesTyCExecute(Sender: TObject);
     procedure AListadoDeUnidadesPendientesDeServirTyCExecute(Sender: TObject);
     procedure AListadoDeStockMnimoTyCExecute(Sender: TObject);
     procedure AEquivalenciaColoresExecute(Sender: TObject);
     procedure ADespieceExecute(Sender: TObject);
     procedure AImprimeRecibosExecute(Sender: TObject);
     procedure AOfertasANDALplastExecute(Sender: TObject);
     procedure AMoldesExecute(Sender: TObject);
     procedure APostizosExecute(Sender: TObject);
     procedure ALstCosteVentasMPExecute(Sender: TObject);
     procedure ALstArticulosClienteExecute(Sender: TObject);
     procedure AGestionDocumentosPagoExecute(Sender: TObject);
     procedure AEnviarDatosPonysExecute(Sender: TObject);
     procedure AGaleriaImagenExecute(Sender: TObject);
     procedure AMarcaExecute(Sender: TObject);
     procedure AGestionTareasProduccionExecute(Sender: TObject);
     procedure AExportacionEuroPastryExecute(Sender: TObject);
     procedure ADividirFacturasExecute(Sender: TObject);
     procedure TVerificarServidorTimer(Sender: TObject);
     procedure AMemoriaContableExecute(Sender: TObject);
     procedure ASincronizaTiendaMasYMasBaratoExecute(Sender: TObject);
     procedure AHojaDeTrabajoExecute(Sender: TObject);
     procedure AFichaTecnicaExecute(Sender: TObject);
     procedure AMarcasExecute(Sender: TObject);
     procedure AExtraccionDatosExecute(Sender: TObject);
     procedure ANecesidadMateraPrimaExecute(Sender: TObject);
     procedure AParteMovimientoExecute(Sender: TObject);
     procedure APedidosPendientesProv2Execute(Sender: TObject);
     procedure ARecibosdeIngresosDesglosadosExecute(Sender: TObject);
     procedure ATipoModeloExecute(Sender: TObject);
     procedure ARepartirHorasProyectoExecute(Sender: TObject);
     procedure ACalendarioZonaExecute(Sender: TObject);
     procedure MGCalendarioClick(Sender: TObject);
     procedure AKitTallasExecute(Sender: TObject);
     procedure ASIIExecute(Sender: TObject);
     procedure ATipoIncidenciaMaqExecute(Sender: TObject);
     procedure ALSTIngresosExecute(Sender: TObject);
     procedure AImprimeCartaPortesExecute(Sender: TObject);
     procedure AMuestraMenuExecute(Sender: TObject);
     procedure AAlquileresExecute(Sender: TObject);
     procedure APeriodoFacturacionExecute(Sender: TObject);
     procedure ASincronizacionTiendaPureWorksExecute(Sender: TObject);
     procedure AContaGrupoCuentasExecute(Sender: TObject);
     procedure AImportesMaximoPeriodoExecute(Sender: TObject);
     procedure ATipoIncidenciaRepExecute(Sender: TObject);
     procedure ARutasAgenteExecute(Sender: TObject);
     procedure ASesionCajaTurnoExecute(Sender: TObject);
     procedure AVentasExecute(Sender: TObject);
     procedure ACajasEmpresaExecute(Sender: TObject);
     procedure ACajasSistemaExecute(Sender: TObject);
     procedure AFormaPagoTpvExecute(Sender: TObject);
     procedure ADisenarTicketExecute(Sender: TObject);
     procedure ADisenarValeExecute(Sender: TObject);
     procedure AFacturarTicketsExecute(Sender: TObject);
     procedure AConfiguracionTPVExecute(Sender: TObject);
     procedure ARegistroFitosanitarioExecute(Sender: TObject);
     procedure APorcentajeFacturacionExecute(Sender: TObject);
     procedure AOpeEstadoMarcajePedidoExecute(Sender: TObject);
     procedure ANumerosDeAutorizacionExecute(Sender: TObject);
     procedure AADRUNNumbersExecute(Sender: TObject);
     procedure AADRClasesExecute(Sender: TObject);
     procedure AADRPackingGroupsExecute(Sender: TObject);
     procedure AADRTunelCodesExecute(Sender: TObject);
     procedure AADRTiposExecute(Sender: TObject);
     procedure ATPVSincronizacionExecute(Sender: TObject);
     procedure ATPVConfigSincronizacionExecute(Sender: TObject);
     procedure APedidosPendientesCliExecute(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure ACuotasClientesExecute(Sender: TObject);
     procedure AExportacionHeliosExecute(Sender: TObject);
     procedure AImportacionVendingExecute(Sender: TObject);
     procedure AMaquinasVendingExecute(Sender: TObject);
     procedure AUbicacionesSimpleExecute(Sender: TObject);
     procedure AImportacionFichajesDePresenciaExecute(Sender: TObject);
     procedure AModelo390Execute(Sender: TObject);
     procedure ALstCalendarioLaboralExecute(Sender: TObject);
     procedure AAuditoriaExecute(Sender: TObject);
     procedure ATerceros2Execute(Sender: TObject);
     procedure ACambiarCanalExecute(Sender: TObject);
     procedure ACategoriaClienteExecute(Sender: TObject);
     procedure AAsistenteImpClientesExecute(Sender: TObject);
     procedure AAsistenteImpProveedoresExecute(Sender: TObject);
     procedure AAsistenteImpAcreedoresExecute(Sender: TObject);
     procedure AAsistenteImpArticulosExecute(Sender: TObject);
     procedure TVerificarImpresoraTimer(Sender: TObject);
     procedure ARefrescarImpresorasExecute(Sender: TObject);
     procedure APruebasExecute(Sender: TObject);
     procedure AExportacionTyrsaExecute(Sender: TObject);
     procedure AImportaListadosExecute(Sender: TObject);
     procedure ANuevoGrupoListadosExecute(Sender: TObject);
     procedure ARecalculaContabilidadExecute(Sender: TObject);
     procedure AFiltroAlbaranesCompraExecute(Sender: TObject);
     procedure ARegionesExecute(Sender: TObject);
     procedure APoblacionesExecute(Sender: TObject);
     procedure AImportacionDliveryExecute(Sender: TObject);
     procedure AImportacionMultyExecute(Sender: TObject);
     procedure ACrmAsuntosExecute(Sender: TObject);
     procedure AAtributosExecute(Sender: TObject);
     procedure ASincronizacionEginerExecute(Sender: TObject);
     procedure ATipoImpuestoAdicionalExecute(Sender: TObject);
     procedure ASIICertificadoDigitalExecute(Sender: TObject);
     procedure ASIIFoliosExecute(Sender: TObject);
     procedure ASIIUrlEndpointExecute(Sender: TObject);
     procedure AArtModGeneroExecute(Sender: TObject);
     procedure AArtModTemporadaExecute(Sender: TObject);
     procedure AAsistenteImpModelosExecute(Sender: TObject);
     procedure AListarCuadreCajaExecute(Sender: TObject);
     procedure ATiposBultoExecute(Sender: TObject);
     procedure AReestablecerConexionesWEBExecute(Sender: TObject);
     procedure ATipoReparacionExecute(Sender: TObject);
     procedure ATipoActuacionExecute(Sender: TObject);
     procedure AServirPedidosVentaExecute(Sender: TObject);
     procedure AEnvioDTEExecute(Sender: TObject);
     procedure APrevisionDeCuentasExecute(Sender: TObject);
     procedure ASincronizaTiendaWoocommerceExecute(Sender: TObject);
     procedure ADatosTecnicosExecute(Sender: TObject);
     procedure ASIILROEExecute(Sender: TObject);
     procedure ARefrescarBandejasExecute(Sender: TObject);
     procedure ACilindrosExecute(Sender: TObject);
     procedure AEstadisticaTubosParisExecute(Sender: TObject);
     procedure ANominasExecute(Sender: TObject);
     procedure ANominasConceptosExecute(Sender: TObject);
     procedure ARHPersonaExecute(Sender: TObject);
     procedure AEstadisitcasComparadasExecute(Sender: TObject);
     procedure AEtiColorExecute(Sender: TObject);
     procedure AEtiAniloxExecute(Sender: TObject);
     procedure AAgrupacionOfertasExecute(Sender: TObject);
     procedure ARCVCompraExecute(Sender: TObject);
     procedure ALoteSimpleExecute(Sender: TObject);
     procedure AAsistenteImpStockMinMaxExecute(Sender: TObject);
     procedure AEmpresasChileExecute(Sender: TObject);
     procedure AIncidenciasMarcajesExecute(Sender: TObject);
     procedure ASIIConfCorreosExecute(Sender: TObject);
     procedure AProTareasExternasExecute(Sender: TObject);
     procedure AGenerarFacturasElectronicasESExecute(Sender: TObject);
     procedure ASIITipoDTEExecute(Sender: TObject);
     procedure AEscandalloGarantiasExecute(Sender: TObject);
     procedure AAsignacionGarantiasExecute(Sender: TObject);
     procedure ANominasConstantesExecute(Sender: TObject);
     procedure ANominasConceptosCHLExecute(Sender: TObject);
     procedure ANominasPlantillaExecute(Sender: TObject);
     procedure AJornadaExecute(Sender: TObject);
     procedure ARecepcionFichaTecnicaExecute(Sender: TObject);
     procedure AMotivosAbonoExecute(Sender: TObject);
     procedure ADisenarTicketRecogidaExecute(Sender: TObject);
     procedure AModelo592Execute(Sender: TObject);
     procedure APrecioReposicionExecute(Sender: TObject);
     procedure AGamasPrecioReposicionExecute(Sender: TObject);
     procedure ADashboardExecute(Sender: TObject);
     procedure ABrevoExecute(Sender: TObject);
     procedure AAdjuntosExecute(Sender: TObject);
     procedure AImportarEscProduccionExecute(Sender: TObject);
     procedure AComoNosConocieronExecute(Sender: TObject);
     procedure AImportacionTarifasTyCExecute(Sender: TObject);
     procedure ASincronizacionSkritExecute(Sender: TObject);
     procedure ASincronizacionColonExecute(Sender: TObject);
     procedure AVerifactuExecute(Sender: TObject);
     procedure AECFVentasExecute(Sender: TObject);
     procedure ADGIIConfiguracionEnvioExecute(Sender: TObject);
     procedure AEstadisticasSimplesExecute(Sender: TObject);
     procedure ADiarioReparacionesExecute(Sender: TObject);
     procedure ASincronizacionTyCExecute(Sender: TObject);
     procedure AECFComprasExecute(Sender: TObject);
     procedure StatBarMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
     procedure TmrVerificaVerifactuTimer(Sender: TObject);
     procedure ASMSPubliExecute(Sender: TObject);
     procedure ADiviloExecute(Sender: TObject);
     procedure APresenciaDispositivoExecute(Sender: TObject);
     procedure APresenciaTipoMarcajeExecute(Sender: TObject);
     procedure APresenciaFicharExecute(Sender: TObject);
     procedure AConfigServidoresCorreoExecute(Sender: TObject);
     procedure ASincronizacionHubSpotExecute(Sender: TObject);
     procedure AAgendaExecute(Sender: TObject);
     procedure ACaracteristicasArticuloExecute(Sender: TObject);
  private
     { Private declarations }
     ComponentesPunto: TList;
     ComponentesReturn: TList;
     Dentro: boolean;
     AltoAyuda: integer;
     EstadoEnter: boolean;
     FBMPMenuOff: TBitmap;
     FBMPMenuOn: TBitmap;
     CuentaRegresiva: integer; {dji lrk kri - Para evitar que entren dos personas con el mismo usuario}
     FormularioAyudaEnLinea: string;
     FiltroAccion: string;
     VersionBaseDeDatos, Empresa, Copyright, NombreProducto: string;
     Param_MODREST017: boolean;
     Param_MODREST019: boolean;
     Param_SYSTERM001: string;
     Param_SYSCONF007: boolean;
     {$IFDEF Debug}
     UltimosPing : string;
     {$ENDIF}
     procedure CalcBitmapsMenu(auxWidth, auxHeight: integer);
     procedure CapturaErrores(Sender: TObject; e: Exception);
     procedure MuestraHint(Sender: TObject);
     procedure ValidaSesion(Sender: TObject);
     procedure SeleccionaEmpEjerCanal;
     // Metodos para el control de acceso a las opciones de menu/barras de herramientas
     procedure EliminaPageMenu;
     procedure RestauraPageMenu;
     procedure EliminaMenu(const Menu: TMenuItem; var Valor: integer; antes: integer);
     procedure LimitaMenu;
     procedure LimitaSegunConfiguracion;
     procedure LimitaSegunPais;
     procedure RestauraMenu(const Menu: TMenuItem);
     procedure MuestraVentana(Sender: TObject);
     procedure CierraVentana(Sender: TObject);
     procedure ControlaBotonesDesplegables;
     // Controla los botones desplegables
     procedure HabilitaBotonAccion(Boton: TToolButton); //Controla un boton desplegables
     procedure CreaAyudaenLinea;
     procedure MuestraAvisos;
     procedure CambioRapidoEjercicio(Sender: TObject);
     procedure MenuListados(Opcion: TMenuItem);
     procedure MenuListadosGrupo(Opcion: TMenuItem; Grupo: integer);
     procedure MIImpresoraLaserClick(Sender: TObject);
     procedure MIBandejaLaserClick(Sender: TObject);
     procedure MIImpresoraMatricialClick(Sender: TObject);
     procedure MIImpresoraEtiquetasClick(Sender: TObject);
     procedure BorraGrupoAcciones(Grupo: string);
     procedure BorraAccion(Accion: string);
     procedure CambiaColorFondo;
  public
     { Public declarations }
     SincronizacionPureWorks: boolean;
     SincronizacionPrestashop: boolean;
     SincronizacionWoocommerce: boolean;
     SincronizacionSpeedLock: boolean;
     SincronizacionSellforege: boolean;
     PonderaArticulos: boolean;
     ActualizaPMPArticulos: boolean;
     ReporteInformeCaja: boolean;
     ReporteDiarioFacturacion: boolean;
     ReporteTrazabilidadCompras: boolean;
     KeyState: TShiftState;
     // Estas variable son para la creación automática desde terceros
     autcliente: boolean;
     autproveedor: boolean;
     autacreedor: boolean;
     autagente: boolean;
     autempleado: boolean;
     autcrm: boolean;
     AyudaEnLinea: boolean;
     sourcecall: boolean;
     sourcecallTer: boolean;
     sourcecallAge: boolean;
     // Estas variables son para las llamadas de hyperenlace

     EnlaceDatos: variant;      // Datos que devuelve la ventana enlace
     EnlaceModal: boolean;      // Si queremos mostrar modal la ventana
     EnlaceInstancias: boolean; // Si queremos instancias de la misma
     EnlaceCrea: boolean;       // Si queremos insercion automática

     procedure WMMove(var Msg: TWMMove); message WM_MOVE; // Detectar movimiento de esta ventana
     procedure ProcesaMensajes(var Msg: TMsg; var Handled: boolean);
     procedure MuestraFecha;
     procedure ReEntra;
     procedure EjecutaAccion(Accion: TAction; Filtro: string = '');
     procedure AddComponentePunto(Componente: TComponent);
     procedure DelComponentePunto(Componente: TComponent);
     procedure AddComponenteReturn(Componente: TComponent);
     procedure DelComponenteReturn(Componente: TComponent);
     procedure MuestraInfo(Formulario: string);
     procedure RestauraVentanas;
     procedure PonColorPCMain;
     procedure MuestraIVA(Filtro, Signo: string);
     procedure MuestraRecibos(Tipo, Serie: string; Factura: string; Ejercicio: integer);
     procedure MuestraCartera(Ejercicio, Canal: smallint; Signo: char; Registro: integer); overload;
     procedure MuestraCartera(IdCartera: integer); overload;
     procedure MuestraMovConta(Filtro: string; Canal: string = '');
     procedure ImagenFondo;
     procedure CambiaEjercicioYCanal(Ejercicio, Canal: integer);
     procedure TraspasoDeDocumentosSalida(id_s: integer);
     procedure TraspasoDeDocumentosEntrada(id_e: integer);
     procedure TraspasoDeDocumentosMovimiento(id_st: integer);
     procedure MuestraIncidencia(Codigo, Incidencia: integer; Tipo: smallint);
     procedure PoneTituloAplicacion;
     procedure MostrarFondo;
     procedure OcultarFondo;
     procedure MuestraAdunto(Tipo: string; Id: integer);
  published
     procedure OwnerDrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: boolean);
     procedure MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: integer);
     procedure MuestraDocumento(Ejercicio: integer; Tipo, Serie: string; Rig: integer);
     procedure MuestraMovimiento(Empresa, Ejercicio, Rig: integer; Serie: string);
     procedure ConstruyeBotonMultiEjercicio;
     procedure CambiaTextoInferior(Sender: TObject);
     function EsBisiesto(ADay, AYear, AMonth: integer): integer;
     function DameTexto(Campo: TBlobField): string; {dji lrk kri}
     procedure MuestraInfoTercero(Tercero: integer);
     function FormularioEmpleadoHabilitado: boolean;
  end;

var
  FMain : TFMain;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UHYReportEditor, UFAcerca, UFMUsuarios, UFMProvincias,
  UFMLocalidades, UFMEstructura, UFAccesos,
  UFMUbicaciones, UFMMonedas, UFMConfig, UFMMovConta,
  UFMConceptos, UFMTerceros, UFMPaises, UFMCanales, UFCMayor,
  UFMAlmacenes, UFMFamilias, UFMTarifas, UFMArticulos,
  UFMBorradorContabilidad, UFMBalances, UFMCuAnuales, UFMEmpEjerCanal,
  UFMTipoIva, UFMModoIva, UFMContadores, UFMPlantillas,
  UFMClientes, UFMCambioDivisas, UFMProveedores,
  UFMAgentes, UFMAcreedores, UFPregSumasYSaldos,
  UFMRegistroIVA, UFMAlbaranes, UFMCartera,
  UFMFormasPago, UFMCuentasIVA, UFMSysEmpresas, UFMGenCanales, UFMGenSeries,
  {UFMEjercicios,} UFMGenEjercicios, UFPregPlanCuentas,
  UFPregDiarioStock, UFMMovManStock, UFMCuentas,
  {UFOpMain,} UFMTarFamPropagacion, UFMFacturas, UFMPedidos,
  UFMOfertas, UFMPropPedidos, UFMPedidosAProveedor, UFMRecepcionPedidos,
  UFPregDiarioIVA, UFPregInventarioStocks,
  UFPregMayoresCantidad, UFPregStockMinimo, UFMCierreApertura,
  UFMSeries, UFMCampanyas, UFMFacturaAlbaranes, UFCGestProcesos,
  UFMPeriodosSistema, UFMPeriodosEmpresa,
  UFMImprimeFacturas, UFMAmortizaciones, UFMSysCuentas, UFMPerfiles,
  UFMAjustes, UFMCentInventario, UFMAlbaranesAProveedor,
  UFMFacturasAProveedor, UDMLSTIva, UFMLSTIva,
  UFMRestricciones, UFMCuentasIRPF,
  UFMTipoIRPF, UFMRemesas, UfMFacturaAlbaranesProv,
  UFMARTESCANDALLO, UFMEmpBancos,
  UDMLstOfertascli, UDMLstPedidosCli, UDMLstAlbaranesCli, UFMLSTEntrefechascli,
  UDMLstFacturacli, UDMLstFactura, UDMLstFacturaArt, UFMLSTEntrefechasart,
  UDMLstFactura_prov, UDMLstFacturaProvArt, UFPregInStoResumido,
  {UDMLstPedidosaprov,} UDMLstAlbaranesProv, UFMLSTEntrefechas,
  UFPregStockAlmacen, UFMAgrupacionPedidosVentas, UFMAgrupacionOfertasVentas,
  UFMUnidades, UFMBancos, UFMCierraDocumento, UFMRazones,
  UFMFacturasAAcreedor, UFCCuentas, UFVerBalances, UFMAgrupaciones, {db, - dji lrk kri - la delcaro arriba}
  UFCalculadora, DBGrids, UFMTiposDir, UFMTipoAcreedor, UFMDisenador,
  UFMProyectos, UFMCodigosBarra,
  UFMTiposEfectos, UFMCondicionesProv, UFMPunteoAsientos, UFMTipoImpuestos,
  UFMArtProveedor, UFMPropaga, UFMArticulosTarifa, UFMTarifaPArticulo,
  UFMSaldosCon, UFMGenFormasPago, UFMCondicionesAgeCli,
  UFMCondicionesAgeAgrupArt, UFMCondicionesAgeCliArt, UFPregABCVentas,
  UFMTercerosCuentas, UFmRecibosPendientes, UFPregABCCompras,
  UFMPagaRecibosAgr, UFAyudaenLinea, UFInfoHistorico, UFMPlazosGarantia,
  UFMEscandalloProd, UFMOrdenProduccion, UFMReciboNuevo,
  UFMFacturacionAlbDet, UFPregNecesidades,
  UFFondo, UFMConfirming, UFMAnticipos, UFPregModelo300, UFPregModelo115,
  UFPregModelo110, UFMEmpleados, UFPregModelo330, UFMTalones, UFMTalonesCta,
  UFMRecibosFactura, UFPregDepositosActivos, UFMBalancesCab,
  UFMTraspasoPeriodos, UFMCierraDocCompras, UFNavegador, UFPregMargenProductos,
  UFPregUnidadesPendientes, {UDMAyudaenLinea,} UDMRModelosHacienda,
  UFMHistoricoPrecios, UFMPonderarDocs, UFMMonedaCuenta, UFMAgrupacionFac,
  UFMCorreo, UFMEmpCanales, UFMClaseDir, UFMDupArtescandallo, UFMPagares,
  UFMConfINI, UFMContRec, UFMTiposCalculo, UFMCondicionesEspeciales,
  UFMMonedasMaestros, UFMImprimeAlbaranes, UFMPonderaEmpresa,
  UFMCambiaMonCartera, UFPregListadoLotes, UDMRMayoresCantidad,
  UFMListConfig, UFPregCarta347, UFMPropagaStock,
  UFVerTercerosPorArticulo, UFPregUnidPendRecibir, UFMProdProduccion,
  UFMTiposRedondeo, UFPregLibroDiarioConta, UFPregPedPdte,
  UFPregPedPdteProv, UFPregRiesgoClientes, UFPregRiesgoBancos, UFMUsuariosMensajes,
  UFMFacturacionAlbCliDet,
  UFMAlbaranesAProveedorTallas, UFMPedidosAProveedorTallas,
  UFMFacturasAProveedorTallas, UFMPedidosTallas, UFMAlbaranesTallas,
  UFMFacturasTallas, UFMOfertasTallas, UFMColoresTallas, UFMGruposTallas, UFMModelosTallas,
  UFPregStockResTallas,
  {UFMReportesUsuario, }UFMEscandalloProd_kri, UFMTipoAsiento,
  {UFMIncPorcDeTarifas, }
  UFMConsultaNroSerieKri, UFMMantenimentoNroSerie, UDMNumeroDeSerieDev,
  UDMLstAlbaranesEti, UFPregEtiAlbaran, UFMProrrateoCostes,
  UFMGeneraInventario, UFPregABCVentasKri, UFPregABCComprasKri,
  UFMAsignaBancoRemesa, {UFMTransmisionesPatrimoniales, dji lrk kri - borrarlo}
  UFMSumasYSaldosKri, UFMOrdenProduccionTallas, UFMEDI,
  UFMAgrupacionDeAlbaranesKri, UFMCentroCoste
  {UFPregABCComprasClibber, UFPregABCVentasClibber},
  UFMImagenes, UFMCierreStocks, UFMIntrastat, UFPregIntrastatCV,
  UFMRegInventario, UDMLstIntrastatCV, UFPregModelo349, UFMControl_Lotes,
  UFPregLstEstadisticasVentas, UFPregLstPendFueraPlazo, UFMCondicionesVenta,
  UFMAsistenteEmpresa, UFMAsistenteEjercicio, UFMCondicionesCompra,
  UFMMatriculas, UFMNaturalezaMat, UFPregLstPendFueraPlazoVentas,
  UFMParamApuntes, UFMGruposTextos, UFMEstanterias, UFMFacturacionCuotasCli,
  UFMRepisas, UFMCalles,
  UFMPosiciones, UFPregModelo347, UFMEnvio, UFMConfiguraAlmacen, UFMIncidencias,
  UFMMovEntreUbicacion, UFPregStockUbicacion, UFPregMovEntreUbicaciones,
  UFPregCentrosCoste, UFMCaravanas,
  UFMPortes, UFMRangosPortes, UFMPromocionesVenta, UFMPromoIndirectas,
  UFMOrdenesPromociones, UFPregTrazabilidadLotes, UFMAsistenteImpTarifas,
  UFMTraspasoMultiCanal, UFMPropuestas, UFMPropuestasConfirm,
  UDMAlbaranesAProveedor, UFMArtBultos, UFMUsuariosWeb,
  UFCGestProcesosProv, UFMPlanesContables,
  UFMCentrosCoste, UFMPlantillasImputacion, UFMImputacionCostes, UFCAnaMayor,
  UFPregAnaSumasYSaldos, UFPregAnaPresupuesto, UFMPropagaEstructura,
  UFPregAnaPlan, UFMUsuarioCuenta, UFMAsistenteExpAsientos,
  UFMAsistenteImpAsientos, UFMAsistenteExpSaldos, UFMDivisionesMaestro, UFMParamModelosHacienda, UFMPresentacionesHacienda, UFMOrdenesDePago,
  UFMImportacionNorma43SLucia, UFMCRM, UDMSincronizacionKri,
  UFMImportacionNorma43Kri, UFMRectificacionAsientos, UFMEmpresasStock, UFMClientesPotencialesKri, UFMPreciosCosteKri, UFMPGCEquivalencias,
  UFMModificaPGC, UFMSysGestiones, UFMTipoLineaVentaKri, UFMPedidosEntreAlmacenes, UFMTraspasoPedCliAPedPro, FIBQuery, UFMRecepcionAlbaranes,
  UFMTipoIncidenciaKri, UFMAlarmasIberfluidKri, UFMProcesosKri,
  UFMIdiomasKri, UFPregModelo340, UFMImportarDocumentos, UDMZonas, UFMZonas,
  UFMPersonalUlises, UFMSEUR, UFMDHL, UFMIDRIL, UCrmFMContactos, UCrmFMConsultaAcciones,
  UCrmFMAmbitos, UCrmFMCorreos, UCrmFMConfiguracion, UCrmFMOrigenRel,
  UCrmFMAsistenteImpContactos, UCrmFMAcciones, UCrmFMAsistenteImpLocalidades, ZUFMEstadisticas,
  UIsoFMAcciones, UIsoFMAccionesTipo, UIsoFMCapacitacion, UIsoFMClaPro,
  UIsoFMDevolucion, UIsoFMInc, UIsoFMMedicion, UIsoFMPunteo, UIsoFMFirmas,
  UIsoFMCursos, UIsoFMPlanning, UProFMEscandallo, UProFMOrden,
  UProFMGestOrden, UProFMPedidosOrd, UProFMLstOrden, UProFMLstEscandallo,
  UProFMMatInc, UProFMLstNecesidades, UProFMLstHojaTrabajo,
  {UProFMOfertaEscandallo, a borrar}
  UProFPregDeslanza, UProFMMarcajesOpe,
  UProFMDiario, UProFMFases, UProFMMarcajesMaq, UProFMMarcajesTE,
  UProFMMarcajesVa, UProFMRecursoEmp, UOpeFMSecciones, UOpeFMTiposContratos,
  UOpeFMEmpleados, UProFMMaquinas, UOpeFMImputacion, UOpeFMTiposImputacion,
  UProFMReloj, UProFMLstMarcajes, UProFMConfigRecMarcajes, UOpeFMHorario,
  UProFMTipoMaquinas, UProFMRelacionUds, UProFPregPlanif, UProFMCabPlanif,
  UProFMTipTareasManu, UProFMTareasManu, UProFMEquivalenciaArticulo, UProFMPauta,
  UProFMTControlPauta, UObrFMObras, UObrFMPartidas, UObrFMPartidasPlantilla,
  UProFMGantt, UProFMTipoMarcajes, UProFMMarcajesBD, UProFMFicherosCliente,
  UProFMLstMatEsc, UProFMLstNecesidadesEsc, UProFMConfiguracion,
  UProFMMaquinasRevisiones, UOpeFMCategoria, UOpeFMCentTrab, UOpeFMDepart,
  UOpeFMCalendario, UOpeFMCalenEmpl, UProFMTareas, UProFMUtillajes,
  UProFMMarcajesOpeEsp, UProFMMarcajesMaqEsp, UProFMDesTipoPieza,
  UProFMDesTipoMat, UProFMDesDespiece, UProFMRecalculoStock,
  UProFMArticulosImg, UProFMArticulosAlmacenes, UProFMPantMarcajes,
  UProFMAgrupaEscRec, UProFmFormulas, UFMPresencia, UFMPresenciaIncidencia, UFMPresenciaDispositivo,
  UFMPresenciaDiario, UProFMLstPresencia, UProFMTipoRevisionesMaq, UFMCambiaIdioma,
  UFMReportesReportSmith, UFMUnidadesLogisitcas, UFMHojaDePreparacion, UFMAltaHojasDePreparacion,
  UFMProtocolosDeVenta, UFMProtocoloDeVenta, UFMCierreParcialOrden,
  UFMDepartamentos, UFPregModelo303, UFPregModelo390, UCRMFMSeguimientos,
  UFMExportarClientes, UFMTipoUbicacion, UFMSectorUbicacion,
  UFPregControlUbicaciones, UFPregAlbPdte, UFMIntroduccionOperario,
  UFMGrupoIncoterm, UFMCodigoIncoterm, UFMAsistenteImpArtIdiomas,
  UProFMMarcajesMaqEspTurno, UProFMTurnos, UProFMCausas,
  UProFMDefecto, UProFMTiposDefecto, UIsoFMFichaTecnica, UIsoFMCertificadoAnalisis, UIsoFMNormativas,
  UIsoFMTipoEnsayo, UIsoFMEnsayo, UFMInterPedido, UDMLstListados,
  UFMLstListados, ZUFMSysNCF, ZUFMTalones,
  ZUFMLSTDiarioVentas, ZUFMLstVentasFamilia, ZUFMInteresesAnticipos,
  UFPregDiarioITBIS, UFPregTalonesBancos, ZUFMRecibos, UFMTipoRetencion,
  UFMPlanMaestroProduccion, UFMGestionCobros, UFMDiarioCostes, ZUFMMaestros,
  ZUFMOrdenesProd, ZUFMFichaTecArt, ZUFMPresupuesto, ZUFMLstPresupuestos,
  ZUFMMaquinas, ZUFMMaquinasDet, ZUFMTroqueles, ZUFMEtiConstantes,
  UFMTiposArticulo, UFMColadas, UFMMateriales,
  UFMReparaciones, UFMLstOfertasEstado, UFMTiposMoneda, UFMGasTanque,
  UFMGasDispensador, UFMGasColaCamion, UFMVentasGas, uProFMSubstituirEsc,
  UDMSincronizacionIncidencias, UFMCompensacionRecibos, UFMGasConstantes,
  UFMArtSerializacion, UFMDescargasGas, UFMSincronizacionTienda, UFMVerificacionesImpuestos,
  ZUFMSeriesCliente, UCrmFMArticulos, UCrmFMMarcajesVentas, UCrmFMVentas,
  UCrmFMAccionesCab, UFMInfoTercero, UFMImportacionArticulosExcel, UFMPrevisionTesoreria,
  UFMTipoColoresTallas, UFMParamArticulos, UFMSeleccion, UProFMOrdTareaMat,
  UFMImprimePedidos, UFMTipoNCF, UFMCatTransporte,
  UFMNaturPeligro, UFMMedidasProtec, UFPregCuotasCliente, UFMControlPlazas, UFMLstItbis,
  ZUFMPunteoAsientos, UFMNominas, ZUFMTraspasoMultiCanalMasivo,
  {$IFDEF Debug}
  UFMPruebas,
  {$ENDIF}
  // Toldos y Cortinas
  ZUFPregStockMinimo, ZUFPregUnidadesPendientes, ZUFPregPedPdte, ZUFMModelos, ZUFMLonas,
  ZUFMLonasForma, ZUFMRibetes, ZUFMBambalinas, ZUFMModelosDet, ZUFMColores, ZUFMModelosFechas,
  ZUFMTarifasModelos, ZUFMPedidosEsp, ZUFMPedidosEspTodos, ZUFMAuxiliares, ZUFMTiposConfig,
  ZUFMVerEstadoPedCli, ZUFMVerEstadoOFCli, ZUFMMarcajeManual, ZUFMPuestos, ZUFMMarcajes,
  ZUFMImprimePedidosEsp, ZUFPregPedEntrega, ZUFMArticulos, ZUFMPedidosAAlbaran,
  ZUFMPedidosMalCerrados, ZUFMVentasPedidosLineal, ZUFMTiposArticulo, ZUFmLstTiempoMarc,
  ZUFMMarcManDirecto, ZUFMLstFechaPrevProv, ZUTyCFMConfiguracion,
  ZUFMConsultaTarifas, {ZUFMAgrupacionPedidosVentas,} UFMDespiece, UFMEquivalenciaColores,
  UFMImprimeRecibos, UFMOfertaProd, UFMMoldes, UFMPostizos,
  UFPregCosteVentasMP, UFMLstArticulosCliente, UFMGestionDocumentosPago,
  UDMExportarDatosPonys, UFMGaleriaImagen, UFMMarca, UFMLstMatPeligrosas, UFMGestionTareasProduccion,
  UFMExportacionEuroPastry,
  UFMDivideFacturas, FIB, UFMMemoriaContable,
  UFMSincronizacionTiendaMasYMasBarato, UFMPedidosAlquiler,
  UFMHojaDeTrabajo, UFMFichaTecnica, UFMMarcas, UFMExtraccionDatos, UFMNecesidadMateraPrima,
  UFMParteMovimiento, UFMPedidosPendientesProv, UFMRecibosDesglose,
  UFMAlbaranesAlquiler, UFMTipoModelo, UFMRepartirHorasProyecto, DateUtils, UFMCalendarioZona,
  UFMKitTallas, UFMSII, UFMTipoIncidenciaMaq, UFMLstDetalleIngresos, UFMImprimeCartaPortes, UFMAlquiler, UFMMenu,
  UFMPeriodoFacturacion, UFMSincronizacionTiendaPureWorks, UParam,
  UFMGrupoCuentas, StoHtmlHelp, UFMImportesMaximoPeriodo, UFMTipoIncidenciaRep,
  UCrmFMRutas, UFMTPVSesionCajaTurno, UFMTicketVenta, UFMEmpCajas,
  UFMSysCajas, UFMFormaDePagoTpv, UDMLstTickets, UFMFacturarTickets,
  UFMConfiguracionTPV, UFMRegistroFitosanitario, UFMFacturacionCanal,
  UOpeFMEstadoMarcajePedido, UFMNumerosDeAutorizacion, UFMADRTipos,
  UFMADRUNNumbers, UFMADRClases, UFMADRPackingGroups, UFMADRTunelCodes,
  UFMTPVSincronizacion, UFMTPVConfSincronizacion, UFMRelacionPedidosVenta,
  UFMImprimirCodBarras, UFMPedidosPendientesCli, UFMClienteCuotas,
  UFMExportacionHelios, UFMImportacionVending, UFMMaquinasVending,
  UFMUbicacionesSimple, UFMPresenciaProcesaMarcajes,
  UProFMLstCalendarioLaboral, UFMAuditoria, UFMTerceros2, UFMCategoriaCliente, UFMAsistenteImpClientes,
  UFMAsistenteImpProveedores, UFMAsistenteImpAcreedores, UFMAsistenteImpArticulos, UFMExportacionTyrsa,
  UFMRecalculaConta, UFMFiltroAlbaranesCompra, UFMRegiones, UFMPoblaciones, UFMImportacionDlivery,
  UFMImportacionMulty, UCrmFMAsuntos, UFMAtributos, UFMSincronizacionEginer,
  UFMTipoImpuestoAdicional, UFMSIICertificados, UFMSIIFolios,
  UFMSIIUrlEndpoint, UFMGeneroTallas, UFMTemporadaTallas, UFMAsistenteImpModelos,
  UFPregCuadreCaja, UFMTiposBulto, UFMTiposReparacion, UFMTiposActuacion, UFMServirPedidosVenta,
  UFMEnviaXmlFacturasChl, UFMPrevisionCuentas,
  UFMSincronizacionTiendaWoocommerce, UFMDatosTecnicos, UFMSIILROE, UFMCilindros,
  UFMEstadisticaTubosParis, UFMNominasCabecera, UFMNomConceptos, UFMRHPersona, UFMEstadisticasComparadas,
  UFMEtiColor, UFMEtiAnilox, UFMRCVCompra, UFMLoteSimple,
  UFPregPrevisionPago, UFMAsistenteImpStockMinMax, UFMEmpresasChile,
  UFMDteRecepcionCorreos, UFMIncidenciasMarcajes, UFMSiiConfiguracionCorreo,
  UFMTareasExternas, UFMGenFacturaElec, UFMSIITipoDTE,
  UDMLmpTablasTmp, UFMEscandalloGarantias, UFMAsignacionDeGarantias, UFMNomConstantes,
  UFMAFPIndicadores, UFMNomConceptosCHL, UFMNominasPlantillas, UFMJornada, UFMRecepcionFichaTecnica, UFMMotivosAbono,
  UDMAuditoria, UFMIEPNR, UFMPrecioReposicion, UFMGamaPrecioReposicion, UFMDashboard, UFMBrevo,
  UFMAdjunto, UFMImportarEscProduccion, UFMComoNosConocieron, UFMImpTarifasTyC, UFMSincronizacionSkrit,
  UFMVerifactu, UFMECFVentas, UFMECFCompras, UFMSincronizacionColon, UFMDGIIConfEnvio, UFMEstadisticasSimples,
  UFMDiarioReparaciones, UFMSincronizacionTyC, UFMSMSPubli, UFMDivilo,
  UFMPresenciaTipoMarcaje, UFMPresenciaFichar, UFMConfiguracionServidorCorreo, UFMSincronizacionHubSpot, UFMCaracteristicasArticulo,
  UFMAgenda;

{$R *.DFM}

class function TBrowserEmulationAdjuster.GetExeName(): string;
begin
  Result := extractFileName(ParamStr(0));
end;

class procedure TBrowserEmulationAdjuster.SetBrowserEmulationDWORD(const Value: DWORD);
const
  RegistryPath = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
var
  Registry : TRegistry;
  ExeName : string;
begin
  ExeName := GetExeName();

  Registry := TRegistry.Create(KEY_SET_VALUE);
  try
     Registry.RootKey := HKEY_CURRENT_USER;
     Win32Check(Registry.OpenKey(RegistryPath, True));
     Registry.WriteInteger(ExeName, Value)
  finally
     Registry.Destroy();
  end;
end;

procedure TFMain.FormCreate(Sender: TObject);

  procedure DesabilitarGhostingDoWindows;
  var
     User32 : HMODULE;
     DisableProcessWindowsGhosting : TProcedure;
  begin
     User32 := GetModuleHandle('USER32');
     if User32 <> 0 then
     begin
        DisableProcessWindowsGhosting := GetProcAddress(User32, 'DisableProcessWindowsGhosting');
        if Assigned(DisableProcessWindowsGhosting) then
           DisableProcessWindowsGhosting;
     end;
  end;

begin
  TranslateComponent(Self); //IDIOMA_CODE

  DMMain.LogIni('TFMain.FormCreate');

  DesabilitarGhostingDoWindows;

  // Cambiar version navegador a IE11_Quirks
  // IE11_default   = 11000;
  // IE11_Quirks    = 11001;
  // IE10_force     = 10001;
  // IE10_default   = 10000;
  // IE9_Quirks     = 9999;
  // IE9_default    = 9000;
  TBrowserEmulationAdjuster.SetBrowserEmulationDWORD(11001);

  Dentro := False;
  SincronizacionPureWorks := False;
  SincronizacionPrestashop := False;
  SincronizacionWoocommerce := False;
  SincronizacionSpeedLock := False;
  SincronizacionSellforege := False;
  PonderaArticulos := False;
  ActualizaPMPArticulos := False;
  ReporteInformeCaja := False;
  ReporteDiarioFacturacion := False;
  ReporteTrazabilidadCompras := False;
  EstadoEnter := False;

  Application.OnHint := MuestraHint;
  Application.OnException := CapturaErrores;

  CambiaTextoInferior(nil);
  PoneTituloAplicacion;
  Application.OnMessage := ProcesaMensajes;

  SetMenuVentanas(MGVentanas);

  // Se asigna el comportamiento Especial para el Enter en la ventana de busqueda
  OnMuestraVentana := MuestraVentana;
  OnCierraVentana := CierraVentana;

  // Creamos los objetos de uso interno
  ComponentesPunto := TList.Create;
  ComponentesReturn := TList.Create;
  FBMPMenuOff := TBitmap.Create;
  FBMPMenuOn := TBitmap.Create;

  // Asignamos las opciones de dibujo de los pop-ups
  CE_OwnerDrawMenuItem := OwnerDrawMenuItem;
  CE_MeasureMenuItem := MeasureMenuItem;

  AyudaEnLinea := False;
  AltoAyuda := Self.Height;

  CreaAyudaenLinea;

  // Asignamos fichero de Ayuda
  HelpFile := REntorno.FicheroAyuda;
  HelpType := htKeyword;
  HelpKeyword := 'FMAIN';

  // Ponemos la ventana estilo Delphi
  Self.Align := AlTop;
  ClientHeight := PNLSistema.Height + StatBarMain.Height;
  StatBarMain.Align := alTop;
  TButtFondo.ImageIndex := 22;

  // Creamos la ventana del fondo
  FFondo := TFFondo.Create(nil);
  DMMain.ImagenFondo;

  // Para que no muestre el fondo. Problemas con TServer
  if (LeeParametro('SYSCONF001') = '1') then
     OcultarFondo
  else
     MostrarFondo;

  // Inicializamos variables
  autcliente := False;
  autproveedor := False;
  autacreedor := False;
  autagente := False;
  autcrm := False;
  sourcecall := False;
  sourcecallTer := False;
  sourcecallAge := False;
  EnlaceModal := False;
  EnlaceInstancias := False;
  EnlaceCrea := False;

  // Pestaña por defecto y colores
  PonColorPCMain;
  PCMain.ActivePage := TSEmpresa;

  TAviso.Enabled := False;
  TAvisoMensaje.Enabled := True;

  CuentaRegresiva := 60; {dji lrk kri - Para evitar que entren dos personas con el mismo usuario}
  // LimitaSegunConfiguracion;

  {$IFNDEF Debug}
  MiPrueba.Free;
  {$ENDIF}

  Param_SYSCONF007 := (LeeParametro('SYSCONF007') = 'S');

  {$IFDEF Debug}
  UltimosPing := '----------';
  TVerificarServidor.Enabled := True;
  {$ENDIF}

  DMMain.LogFin('TFMain.FormCreate');
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Param_AUDBORR001 : integer;
begin
  TVerificarServidor.Enabled := False;
  TAvisoMensaje.Enabled := False;
  TAviso.Enabled := False;
  TVerificaEntrada.Enabled := False;
  TTerminarAplicacion.Enabled := False;
  TVerificarImpresora.Enabled := False;

  if AyudaEnLinea = True then
  begin
     FAyudaenLinea.Close;
     FAyudaenLinea.Free;
  end;

  // Cierro todos los formularios antes de cerrar la ventana principal
  DMMain.LogIni('FMain.FormClose -> CierraForms');
  CierraForms;
  DMMain.LogFin('');

  DMMain.LogIni('FMain.FormClose -> LimpiaTablasTemporales');
  // Hago esto en este punto y no en DMMain.Destroy, porque el entorno ya se ha eliminado en ese punto y se necesita Entrada/Usuario/etc.
  try
     AbreData(TDMLmpTablasTmp, DMLmpTablasTmp);
     try
        DMLmpTablasTmp.MarcarTodos(True);
        DMLmpTablasTmp.LimpiaTablasTemporales(True);
     finally
        CierraData(DMLmpTablasTmp);
     end
  except
  end;
  DMMain.LogFin('');

  DMMain.LogIni('FMain.FormClose -> BorrarAuditoria');
  // Borrar registros de auditoria anteriores a una fecha
  Param_AUDBORR001 := StrToIntDef(LeeParametro('AUDBORR001'), 99999);
  try
     AbreData(TDMAuditoria, DMAuditoria);
     try
        DMAuditoria.BorrarAuditoria(Param_AUDBORR001);
     finally
        CierraData(DMAuditoria);
     end
  except
  end;
  DMMain.LogFin('');

  DMMain.LogIni('FMain.FormClose -> RegistraSalida');
  DMMain.RegistraSalida;
  DMMain.LogFin('');
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  {dji lrk kri - Para evitar que entren dos personas con el mismo usuario}
  {Si la cuenta regresiva llego a 0 que cierre sin preguntar}
  if (CuentaRegresiva > 1) then
     CanClose := ConfirmaMensajeCaption(_('¿Salir de la Aplicación?'), _('Salir'));
end;

procedure TFMain.BorraGrupoAcciones(Grupo: string);
var
  i : integer;
begin
  // Borro los Botones que dependen de acciones de la categoria
  for i := Self.ComponentCount - 1 downto 0 do
     if (Self.Components[i] is TToolButton) then
        if (TToolButton(Self.Components[i]).Action is TAction) then
           if TAction(TToolButton(Self.Components[i]).Action).Category = Grupo then
              TToolButton(Self.Components[i]).Free;

  // Borro los menues que dependen de acciones de la categoria
  for i := Self.ComponentCount - 1 downto 0 do
     if (Self.Components[i] is TMenuItem) then
        if (TMenuItem(Self.Components[i]).Action is TAction) then
           if TAction(TMenuItem(Self.Components[i]).Action).Category = Grupo then
              TMenuItem(Self.Components[i]).Free;

  // Borro las acciones de la categoria
  for i := Self.ComponentCount - 1 downto 0 do
     if (Self.Components[i] is TAction) then
        if TAction(Self.Components[i]).Category = Grupo then
           TAction(Self.Components[i]).Free;

  // Borro El grupo de acciones de la categoria
  for i := Self.ComponentCount - 1 downto 0 do
     if (Components[i] is TLFCategoryAction) then
        if TLFCategoryAction(Self.Components[i]).Category = Grupo then
           TLFCategoryAction(Self.Components[i]).Free;
end;

procedure TFMain.BorraAccion(Accion: string);
var
  i : integer;
begin
  // Borro los Botones que dependen de la accion
  for i := Self.ComponentCount - 1 downto 0 do
     if (Self.Components[i] is TToolButton) then
        if (TToolButton(Self.Components[i]).Action is TAction) then
           if TAction(TToolButton(Self.Components[i]).Action).Name = Accion then
              TToolButton(Self.Components[i]).Free;

  // Borro los menues que dependen de la accion
  for i := Self.ComponentCount - 1 downto 0 do
     if (Self.Components[i] is TMenuItem) then
        if (TMenuItem(Self.Components[i]).Action is TAction) then
           if TAction(TMenuItem(Self.Components[i]).Action).Name = Accion then
              TMenuItem(Self.Components[i]).Free;

  // Borro las accion
  for i := Self.ComponentCount - 1 downto 0 do
     if (Self.Components[i] is TAction) then
        if TAction(Self.Components[i]).Name = Accion then
           TAction(Self.Components[i]).Free;

  // Borro El grupo de acciones si es la accion
  for i := Self.ComponentCount - 1 downto 0 do
     if (Components[i] is TLFCategoryAction) then
        if TLFCategoryAction(Self.Components[i]).Name = Accion then
           TLFCategoryAction(Self.Components[i]).Free;
end;

procedure TFMain.MenuListados(Opcion: TMenuItem);
var
  NewItem : TMenuItem;
  Grupo : integer;
  DS : TFIBDataSet;
  i : integer;
begin
  {Este procedimiento crea los grupos y los listados de esos grupos en el arbol de menu}
  {Si desarrollo=True, crea tambien dos opciones para crear grupos y para importar listados}

  // Limpio grupo de menu
  // Deben quedar las opciones de importar y crear grupo.
  // Opcion.Clear;
  for i := Opcion.Count - 1 downto 0 do
     if ((Opcion.Items[i] <> MIImportaListados) and (Opcion.Items[i] <> MINuevoGrupoListados)) then
        Opcion.Items[i].Free;

  MINuevoGrupoListados.Visible := (LeeParametro('MODREST024') = 'S');
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT GRUPO, TITULO FROM LST_GRUPOS WHERE EMPRESA = ?EMPRESA ORDER BY ORDEN';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           while not EOF do
           begin
              Grupo := FieldByName('GRUPO').AsInteger;
              NewItem := TMenuItem.Create(Opcion);
              try
                 NewItem.Caption := FieldByName('TITULO').AsString;
                 NewItem.Tag := Grupo;
                 NewItem.OnDrawItem := OwnerDrawMenuItem;
                 NewItem.OnMeasureItem := MeasureMenuItem;
                 NewItem.ImageIndex := 14;
                 Opcion.Insert(0, NewItem);
                 MenuListadosGrupo(NewItem, Grupo);
              except
                 NewItem.Free;
                 raise;
              end;
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TFMain.AImportaListadosExecute(Sender: TObject);
begin
  ImportaListados;
end;

procedure TFMain.ANuevoGrupoListadosExecute(Sender: TObject);
var
  Nombre : string;
begin
  Nombre := InputBox(_('Grupo'), _('Nombre del nuevo grupo'), '');
  if (Nombre <> EMptyStr) then
  begin
     AbreData(TDMLstListados, DMLstListados);
     try
        DMLstListados.NuevoGrupo(Nombre);
        MenuListados(MGListadosPers);
     finally
        CierraData(DMLstListados);
     end;
  end;
end;

procedure TFMain.MenuListadosGrupo(Opcion: TMenuItem; Grupo: integer);
var
  Listado : integer;
  Titulo : string;
  NewItem : TMenuItem;
  Desarrollo : boolean;
  DS : TFIBDataSet;
begin
  // Este procedimiento crea los listados dentro del grupo

  Desarrollo := (LeeParametro('MODREST024') = 'S');
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT LISTADO, TITULO FROM LST_LISTADOS WHERE EMPRESA = ?EMPRESA AND GRUPO = ?GRUPO ORDER BY ORDEN';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Open;
           while not EOF do
           begin
              Listado := FieldByName('LISTADO').AsInteger;
              Titulo := FieldByName('TITULO').AsString;
              NewItem := TMenuItem.Create(Opcion);
              NewItem.Caption := Titulo;
              NewItem.Tag := Listado;
              NewItem.OnDrawItem := OwnerDrawMenuItem;
              NewItem.OnMeasureItem := MeasureMenuItem;
              NewItem.OnClick := MIListadosPersClick;
              NewItem.ImageIndex := 14;
              try
                 Opcion.Insert(0, NewItem);
              except
                 NewItem.Free;
                 raise;
              end;
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  if Desarrollo then
  begin
     NewItem := TMenuItem.Create(Opcion);
     NewItem.Caption := _('Crear nuevo listado');
     NewItem.Tag := -1;
     NewItem.OnDrawItem := OwnerDrawMenuItem;
     NewItem.OnMeasureItem := MeasureMenuItem;
     NewItem.OnClick := MIListadosPersClick;
     NewItem.ImageIndex := 57;
     Opcion.Insert(0, NewItem);
  end;
end;

procedure TFMain.MIListadosPersClick(Sender: TObject);
var
  Listado, Grupo : integer;
  Nombre : string;
begin
  with TMenuItem(Sender) do
  begin
     Listado := Tag;
     Grupo := Parent.Tag;
  end;

  if (Listado > 0) then
  begin
     AbreForm(TFMLstListados, FMLstListados);
     FMLstListados.Mostrar(Grupo, Listado);
  end
  else
  begin
     Nombre := InputBox(_('Listado'), _('Nombre del nuevo listado'), '');
     if (Nombre <> EMptyStr) then
     begin
        AbreData(TDMLstListados, DMLstListados);
        try
           DMLstListados.NuevoListado(Grupo, Nombre);
           MenuListados(MGListadosPers);
        finally
           CierraData(DMLstListados);
        end;
     end;
  end;
end;

procedure TFMain.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMain.MuestraHint(Sender: TObject);
begin
  StatBarMain.Panels[6].Text := GetLongHint(Application.Hint);
end;

procedure TFMain.MuestraVentana(Sender: TObject);
begin
  EstadoEnter := True;
end;

procedure TFMain.ProcesaMensajes(var Msg: TMsg; var Handled: boolean);
var
  Cuanto : short;
begin
  if (msg.message > WM_MOUSEFIRST) and (msg.message < WM_MOUSELAST) then
  begin
     KeyState := [];
     if (msg.wParam and MK_SHIFT) > 0 then
        KeyState := KeyState + [ssShift];
     if (msg.wParam and MK_CONTROL) > 0 then
        KeyState := KeyState + [ssCtrl];
  end;

  if (REntorno.ModoEnter = 1) and (Msg.message = WM_KEYDOWN) then
  begin
     if Msg.wParam = VK_RETURN then
     begin
        if not (Screen.ActiveControl is TButton) and not (Screen.ActiveControl is TCustomMemo) and not (Screen.ActiveControl is TTreeView) and not (TControl(Screen.ActiveControl) is TSpeedButton) and not (EstadoEnter) then
        begin
           if ComponentesReturn.Indexof(Screen.ActiveControl) = -1 then
           begin
              Msg.wParam := VK_TAB;
              Handled := False;
           end;
        end;
     end;
  end;

  if (msg.message = WM_KEYDOWN) then
  begin
     Handled := False;
     // Aqui entrara si se presiona la tecla [.] del pack numérico
     if (msg.wParam = VK_DECIMAL) then
     begin
        // Solo actuo si el separador decimal *NO* es el '.'
        if (DecimalSeparator = ',') then
        begin
           // Solo actuo si no se ha desactivado el comportamiento para el componente desde el que se ha presionado la tecla
           if (ComponentesPunto.IndexOf(Screen.ActiveControl) = -1) then
           begin
              if (Screen.ActiveControl is TCustomEdit) then
              begin
                 // Si es un DBEdit miramos si apunta a un campo numerico
                 if ((Screen.ActiveControl is TDBEdit) and (TDBEdit(Screen.ActiveControl).Field.DataType = ftFloat)) then
                    msg.wParam := 188
                 else
                 if (Screen.ActiveControl is TEdit) then
                    msg.wParam := 188;
              end
              else
              begin
                 // Si no es un Edit, seguramente es un DBGrid
                 msg.wParam := 188;
              end;
           end;
        end;
     end;

     // Para evitar la salida con ESC de los navegadores ocultos y en modo de edit
     if (msg.wParam = VK_ESCAPE) then
     begin
        if DMMain.FindComponenteEsc(Screen.ActiveControl) = -1 then
           msg.wParam := VK_ESCAPE
        else
           Handled := True;
     end;

     // Muestro Menu
     if (msg.wParam = VK_F11) then
        if REntorno.Clave <> '' then
        begin
           // AbreForm(TFNavegador, FNavegador);
           if (FMMenu.Visible) then
              FMMenu.SetFocus
           else
              AMuestraMenu.Execute;
        end;

     if (msg.wParam = VK_F12) then
     begin
        if not Assigned(FCalculadora) then
        begin
           if (Screen.ActiveControl is TDBEdit) then
           begin
              if (Screen.ActiveControl as TDBEdit).Field.DataType in [ftInteger,
                 ftFloat] then
              begin
                 FCalculadora := TFCalculadora.Create(Self);
                 FCalculadora.Muestra((Screen.ActiveControl as TDBEdit).Field);
                 FCalculadora := nil;
              end
              else
              begin
                 FCalculadora := TFCalculadora.Create(Self);
                 FCalculadora.ShowModal;
                 FCalculadora := nil;
              end;
           end
           else if (Screen.ActiveControl is TCustomDBGrid) then
           begin
              if (Screen.ActiveControl as TCustomDBGrid).SelectedField.DataType in
                 [ftInteger, ftFloat] then
              begin
                 FCalculadora := TFCalculadora.Create(Self);
                 FCalculadora.Muestra((Screen.ActiveControl as
                    tCustomDBGrid).SelectedField);
                 FCalculadora := nil;
              end
              else
              begin
                 FCalculadora := TFCalculadora.Create(Self);
                 FCalculadora.ShowModal;
                 FCalculadora := nil;
              end;
           end
           else
           begin
              FCalculadora := TFCalculadora.Create(Self);
              FCalculadora.ShowModal;
              FCalculadora := nil;
           end;
        end;
     end;
  end;

  // Rueda de raton para grids
  if (msg.message = WM_MOUSEWHEEL) then
     if (Screen.ActiveControl is TDBGrid) then
     begin
        Cuanto := HIWORD(msg.WParam);
        Cuanto := Cuanto div 120;
        Handled := True;
        TDBGrid(Screen.ActiveControl).DataSource.DataSet.MoveBy(-Cuanto);
     end;
end;

procedure TFMain.CalcBitmapsMenu(auxWidth, auxHeight: integer);
begin
  with FBmpMenuOff do
  begin
     Width := auxWidth;
     Height := auxHeight;
     FillGradient(FBmpMenuOff, CE_Menu_1_Off, CE_Menu_2_Off);
  end;

  with FBmpMenuOn do
  begin
     Width := auxWidth;
     Height := auxHeight;
     FillGradient(FBmpMenuOn, CE_Menu_1_On, CE_Menu_2_On);
  end;
end;

procedure TFMain.CapturaErrores(Sender: TObject; e: Exception);
begin
  if (e is EFIBError) then
     if EFIBError(e).SQLCode = -902 then
        if MessageDlg(_('Se ha perdido la conexión a la base de datos. ¿Desea reconectar?' + #13#10 + e.Message), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           DMMain.Conecta;
  MensajesDeError(e);
end;

procedure TFMain.CierraVentana(Sender: TObject);
begin
  EstadoEnter := False;
end;

procedure TFMain.MuestraFecha;
begin
  StatBarMain.Panels[0].Text :=
     FormatDateTime(_('"Hoy es" dddd d "de" mmmm "de" yyyy'), REntorno.FechaTrab);
end;

procedure TFMain.FormActivate(Sender: TObject);
begin
  // DMMain.LogIni('TFMain.FormActivate');
  if (DMMain.DataBase.Connected) then
  begin
     // Error de versión
     if REntorno.Entrada = -1 then
     begin
        ShowMessage(_('Hay un desfase de versiones entre el programa y la base de datos'));
        Application.Terminate;
     end;

     // Se comprueba que accede un usuario valido
     ValidaSesion(Sender);
     DMMain.LeerTeclas;

     // Seleccionamos los datos correspondientes a empresa, ejercicio y canal
     MuestraFecha;
     StatBarMain.Panels[2].Text := REntorno.Nombre;
     StatBarMain.Panels[4].Text := IntToStr(REntorno.Nivel);
     // CambiaTextoInferior(Sender);

     // Fuerza al menu a estar debajo de FMain
     try
        if (Assigned(FMMenu)) then
           FMMenu.Posicionar;
        if (Assigned(FFondo)) then
           FFondo.Posicionar;
     except
     end;

     Self.BringToFront;

     // SetWindowPos (handle,HWND_BOTTOM,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
     // DMMain.LogFin('TFMain.FormActivate');
  end;
end;

procedure TFMain.SeleccionaEmpEjerCanal;
begin
  {$IFDEF Debug}
  FFondo.CreaAD(2, 0, 0, 300, 'Test 1', 'Aviso 1 - Amortizaciones', 'AAmortizaciones',clMoneyGreen, clWindowText,True);
  FFondo.CreaAD(2, 0, 0, 300, 'Test 2', 'Aviso 2 - Articulos', 'AArticulos',clMoneyGreen, clWindowText,True);
  FFondo.CreaAD(2, 0, 0, 300, 'Test 3', 'Aviso 3 - Sin Accion', '',clMoneyGreen, clWindowText,True);
  FFondo.CreaAD(2, 0, 0, 300, 'Test 4', 'Aviso 4 - Sin Accion', '',clMoneyGreen, clWindowText,True);
  {$ENDIF}

  DMMain.LogIni('SeleccionaEmpEjerCanal');
  // A veces la ventana FMEmpEjerCanal queda detras del fondo.
  // Esto es una posible solucion
  Application.ProcessMessages;

  // Esta linea es solo para cargar REntorno.SerieRestringia
  DMMain.CompruebaRestriccionUsuario;

  if (TFMEmpEjerCanal.Create(Self).ShowModal = mrOk) then
  begin
     PoneTituloAplicacion;

     DMMain.ActualizaUsuario;
  end
  else
  begin
     // No se ha seleccionado ninguna empresa
     Application.Terminate;
  end;
  DMMain.LogFin('SeleccionaEmpEjerCanal');
end;

procedure TFMain.ValidaSesion(Sender: TObject);
var
  Intentos, i : smallint;
  AccionInicio : string;
  s, Lista : string;
  Mayor, Minor, Release, Build : word;
  DiasCaducanLotes : integer;
begin
  // DMMain.LogIni('ValidaSesion');
  AccionInicio := '';

  if (not SincronizacionPureWorks) and (not SincronizacionPrestashop) and (not SincronizacionWoocommerce) and
     (not SincronizacionSpeedLock) and (not SincronizacionSellforege) and (not PonderaArticulos) and
     (not ActualizaPMPArticulos) and (not ReporteInformeCaja) and (not ReporteDiarioFacturacion) and
     (not ReporteTrazabilidadCompras) then
  begin
     Intentos := 0;
     PCMain.Visible := False;
     // TBUtilidades.Visible := False;

     if (not Dentro) then
     begin
        REntorno.Clave := '';

        while (Intentos < 3) and (not Dentro) do
        begin
           WindowState := wsMaximized;
           Self.Align := alNone;
           Self.Top := 0;
           Self.Left := 0;
           Self.Width := Screen.Width;
           DMMain.Log(Format('TFAccesos.Create(Self).Muestra(%d)', [Intentos]));

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT CLAVE, ACCION_INICIO FROM SYS_USUARIOS WHERE NOMBRE = :NOMBRE';
                 Params.ByName['NOMBRE'].AsString := REntorno.Nombre;
                 ExecQuery;
                 {$IFDEF Debug}
                 REntorno.Clave := FieldByName['CLAVE'].AsString;
                 {$ENDIF}
                 AccionInicio := FieldByName['ACCION_INICIO'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (not Dentro) then
           begin
              if (TFAccesos.Create(Self).Muestra(Intentos) = mrOk) then
                 Dentro := DMMain.ValidaEntrada
              else
                 Intentos := 3;
           end;

           if Dentro then
           begin
              DMMain.Log('ValidaSesion (Dentro = True)');

              StoHtmlHelp.URLAyuda := 'http://www.delfos-online.com/delhelp/html/articuloAyuda.php?licencia=' + DameLicencia + '&formulario=';

              SeleccionaEmpEjerCanal;

              // Quita acciones, MenuItem y botones que no deben aparecer segun pais.
              LimitaMenu;

              // Comprueba si tiene habilitado entrar a este EECS
              if not DMMain.CompruebaRestriccionUsuario then
                 Dentro := False
              else
              begin
                 EscribeINI;
                 ConstruyeBotonMultiEjercicio;
                 TVerificaEntrada.Enabled := True;
                 ForzarAsterisco := (LeeParametro('BUSASTR001') = 'S');
                 ReemplazarEspacioPorPorciento := (LeeParametro('BUSASTR002') = 'S');

                 if ((AConfirming.Enabled) and (AConfirming.Visible)) then
                 begin
                    // Ajustamos el riesgo de confirming
                    DMMain.AjustaRiesgoConfirming;
                 end;

                 if ((AAmortizaciones.Enabled) and (AAmortizaciones.Visible)) then
                 begin
                    if DMMain.ChequeaInmovilizado(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, REntorno.FechaTrab) then
                    begin
                       s := _('Tiene amortizaciones pendientes de contabilizar.');

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'AAmortizaciones', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(_('Atencion: ') + s);
                    end;
                 end;

                 if (ARemesas.Enabled) and (ARemesas.Visible) then
                 begin
                    // Lista de recibos dentro de remesas al descuento con fecha valor anterior a la fecha pedida
                    Lista := '';
                    i := DMMain.ChequeaVencimientos(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, REntorno.FechaTrabSH, Lista);
                    if (i > 0) then
                    begin
                       s := Format(_('Tiene %d vencimiento(s) de remesas por contabilizar.') + #13#10 + Lista, [i]);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'ARemesas', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(_('Atencion: ') + s);
                    end;
                 end;

                 if (APagares.Enabled) and (APagares.Visible) then
                 begin
                    Lista := '';
                    i := DMMain.ChequeaConPagares(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, REntorno.FechaTrab, Lista);
                    if (i > 0) then
                    begin
                       s := Format(_('Tiene %d pagare(s) por contabilizar.'), [i]) + #13#10 + Lista;

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'APagares', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(_('Atencion: ') + s);
                    end;
                 end;

                 if (APagares.Enabled) and (APagares.Visible) then
                 begin
                    Lista := '';
                    i := DMMain.ChequeaPagPagares(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, REntorno.FechaTrab, Lista);
                    if (i > 0) then
                    begin
                       s := Format(_('Tiene %d pagare(s) por pagar.'), [i]) + #13#10 + Lista;

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'APagares', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(_('Atencion: ') + s);
                    end;
                 end;

                 if (ACartera.Enabled) and (LeeParametro('INFINIC004') = 'S') then
                 begin
                    Lista := DMMain.DamePagosTransferenciaPendientes;
                    if (Lista > '') then
                    begin
                       s := _('Tiene los siguientes pagos por transferencias proximamente.' + #13#10 + Lista);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'ACartera', clMoneyGreen, clWhite, True)
                       else
                       begin
                          if MessageDlg(s + #13#10 + _('¿Desea ver la prevision de pagos?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          begin
                             AbreForm(TFPregPrevisionPago, FPregPrevisionPago, Self);
                             FPregPrevisionPago.Previsualizar('TRN', EncodeDate(2000, 01, 01), Today + 7);
                          end;
                       end;
                    end;
                 end;

                 if (AFacCuotas.Enabled) and (AFacCuotas.Visible) then
                 begin
                    i := DMMain.ChequeaCuotasPendientes;
                    if (i > 0) then
                    begin
                       s := Format(_('Tiene %d cuota(s) por cobrar. ¿Desea ver cuotas pendientes?'), [i]);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'AFacCuotas', clMoneyGreen, clWhite, True)
                       else
                       if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          AFacCuotas.Execute;
                    end;
                 end;

                 if Assigned(ACrmConsultaAcciones) and (ACrmConsultaAcciones.Enabled) then
                 begin
                    i := DMMain.ChequeaAccionesPendientes;
                    if (i > 0) then
                    begin
                       s := Format(_('Tiene %d acciones pendientes. ¿Desea ver lista de acciones?'), [i]);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'ACrmConsultaAcciones', clMoneyGreen, clWhite, True)
                       else
                       if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          ACrmConsultaAcciones.Execute;
                    end;
                 end;

                 if (AAlquileres.Enabled) then
                 begin
                    Lista := DMMain.DameRevisionesAlquiler;
                    if (Lista > '') then
                    begin
                       s := _('Tiene revisiones de alquiler proximamente.' + #13#10 + Lista);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'AAlquileres', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 if (LeeParametro('INFINIC001') = 'S') then
                 begin
                    Lista := '';
                    i := DMMain.ArticulosBajoStockMinimoMarcados(Lista);
                    if (i > 0) then
                    begin
                       s := format(_('Existen %d Articulos por debajo del stock minimo'), [i]) + #13#10 + Lista;

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'ALSTStockAlmacen', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 DiasCaducanLotes := StrToIntDef(LeeParametro('INFINIC002'), -1);
                 if (DiasCaducanLotes > 0) then
                 begin
                    Lista := '';
                    i := DMMain.LotesCaducidadDias(Lista, DiasCaducanLotes);
                    if (i > 0) then
                    begin
                       s := Format(_('Articulos que caducan en los proximos %d dias'), [DiasCaducanLotes]) + #13#10 + Lista;

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'ALSTStockAlmacen', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 if (LeeParametro('INFINIC003') = 'S') then
                 begin
                    Lista := '';
                    i := DMMain.VencimientosMas75Dias(Lista);
                    if (i > 0) then
                    begin
                       s := _('Recibos que vencieron hace mas de 75 dias') + #13#10 + Lista;

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'ACartera', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 if (AFacturas.Enabled) then
                 begin
                    Lista := '';
                    Lista := DMMain.DameFacturasAbiertas(StrToIntDef(LeeParametro('INFINIC005'), -1));
                    if (Lista > '') then
                    begin
                       s := _('Tiene facturas sin contabilizar.' + #13#10 + Lista);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'AFacturas', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 if (AAlbaranes.Enabled) then
                 begin
                    Lista := '';
                    Lista := DMMain.DameAlbaranesAbiertos(StrToIntDef(LeeParametro('INFINIC006'), -1));
                    if (Lista > '') then
                    begin
                       s := _('Tiene albaranes sin facturar.' + #13#10 + Lista);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'AAlbaranes', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 if (APedidos.Enabled) then
                 begin
                    Lista := '';
                    Lista := DMMain.DamePedidosAbiertos(StrToIntDef(LeeParametro('INFINIC007'), -1));
                    if (Lista > '') then
                    begin
                       s := _('Tiene pedidos sin servir.' + #13#10 + Lista);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'APedidos', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 if (AOfertas.Enabled) then
                 begin
                    Lista := '';
                    Lista := DMMain.DameOferasAbiertas(StrToIntDef(LeeParametro('INFINIC008'), -1));
                    if (Lista > '') then
                    begin
                       s := _('Tiene ofertas sin tratar.' + #13#10 + Lista);

                       if (DMMain.EstadoKri(900) = 1) then
                          FFondo.CreaAD(2, 0, 0, 300, '', s, 'AOfertas', clMoneyGreen, clWhite, True)
                       else
                          ShowMessage(s);
                    end;
                 end;

                 // Mostramos si la version del programa no coincide con el EXE
                 // Version - Mayor: año; Minor: version
                 DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto, True);
                 GetBuildInfo(REntorno.RutaEXE + REntorno.FicheroExe, Mayor, Minor, Release, Build);
                 if (IntToStr(Minor) <> VersionBaseDeDatos) then
                    MessageDlg(format(_('¡Atención! Las versiones de base de datos y ejecutable no coinciden.' + #13#10 + 'Version Base de Datos: %s' + #13#10 + 'Version Ejecutable: %d'), [VersionBaseDeDatos, Minor]),
                       mtWarning, [mbOK], 0);

                 CambiaColorFondo;

                 DMMain.EstableceIdiomaCanal;

                 CambiaTextoInferior(nil);

                 MuestraAvisos;

                 // Si entro correctamente, lanzo accion inicial
                 for i := 0 to (FMain.ALMain.ActionCount - 1) do
                 begin
                    if (TAction(FMain.ALMain.Actions[i]).Name = AccionInicio) then
                       FMain.EjecutaAccion(TAction(FMain.ALMain.Actions[i]));
                 end;

                 // Si esta habilitado Control de Presencia y el parametro PREFICH001=S           
                 if (LeeParametro('MODREST005') = 'S') and (LeeParametro('PREFICH001') = 'S') then
                    FMain.EjecutaAccion(APresenciaFichar);
              end;
           end;
           Inc(Intentos);
        end;
     end;

     if (Dentro) then
     begin
        PCMain.Visible := True;
        // TBUtilidades.Visible := True;
        PonColorPCMain;

        // Si ya se ha verificado varias veces no se vuelve a habilitar. Se incrementa el intervalo cada verificacion.
        TVerificarImpresora.Enabled := (TVerificarImpresora.Interval < 13000);
     end
     else
     begin
        DMMain.Log('ValidaSesion (Dentro = False)');

        AccionInicio := '';
        Application.Terminate;
     end;
  end
  else
  begin
     REntorno.Empresa := 1;
     REntorno.Ejercicio := DameEjercicio(REntorno.Empresa, Now);
     REntorno.Canal := 1;
     DMMain.ActualizaUsuario;
  end;
  // DMMain.LogFin('ValidaSesion');
end;

procedure TFMain.DTPFechaTrabajoCloseUp(Sender: TObject);
begin
  // REntorno.FechaTrab := DTPFechaTrabajo.Date;
  MuestraFecha;
end;

procedure TFMain.AAcercaExecute(Sender: TObject);
begin
  TFAcerca.Create(Self).ShowModal;
end;

procedure TFMain.AUsuariosExecute(Sender: TObject);
begin
  AbreForm(TFMUsuarios, FMUsuarios, Sender);
end;

procedure TFMain.AProvinciasExecute(Sender: TObject);
begin
  AbreForm(TFMProvincias, FMProvincias, Sender);
end;

procedure TFMain.ALocalidadesExecute(Sender: TObject);
begin
  AbreForm(TFMLocalidades, FMLocalidades, Sender);
end;

procedure TFMain.AContaEstructuraExecute(Sender: TObject);
begin
  AbreForm(TFMEstructura, FMEstructura, Sender);
end;

procedure TFMain.ACambiaUserExecute(Sender: TObject);
begin
  ReEntra;

  // TyC - Es fa que quan entri amb l'usuari sofinter pugui veure el menú de configuració de les TyC
  if (LeeParametro('MODREST015') = 'S') then
     ZAConfiguracion.Visible := (REntorno.Nombre = 'sofinter');
end;

procedure TFMain.ACFGPrintExecute(Sender: TObject);
begin
  DMMain.ConfiguraImpresora;
end;

procedure TFMain.AUbicacionesExecute(Sender: TObject);
begin
  AbreForm(TFMUbicaciones, FMUbicaciones, Sender);
end;

procedure TFMain.AEmpresasExecute(Sender: TObject);
begin
  AbreForm(TFMSysEmpresas, FMSysEmpresas, Sender);
end;

procedure TFMain.AMonedasExecute(Sender: TObject);
begin
  AbreForm(TFMMonedas, FMMonedas, Sender);
end;

procedure TFMain.AConfigExecute(Sender: TObject);
begin
  AbreForm(TFMConfig, FMConfig, Sender);
end;

procedure TFMain.AContaMovimientosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMMovConta, FMMovConta, Sender);
end;

procedure TFMain.AContaConceptosExecute(Sender: TObject);
begin
  AbreForm(TFMConceptos, FMConceptos, Sender);
end;

procedure TFMain.ATercerosExecute(Sender: TObject);
begin
  /// Comportamiento contrario a ATercero2Execute

  // Parametro TERFICH001 - Espedifica que version de la ficha de tercero se ejecuta por defecto
  // N Nueva version
  // O Version original
  if (LeeParametro('TERFICH001') = 'N') then
  begin
     AbreForm(TFMTerceros, FMTerceros, Sender);
     if ((not EnlaceModal) and (Assigned(FMTerceros))) then
        FMTerceros.FiltraTercero(FiltroAccion);
  end
  else
  begin
     AbreForm(TFMTerceros2, FMTerceros2, Sender);
     if ((not EnlaceModal) and (Assigned(FMTerceros2))) then
        FMTerceros2.FiltraTercero(FiltroAccion);
  end;

  FiltroAccion := '';
end;

procedure TFMain.ATerceros2Execute(Sender: TObject);
begin
  /// Comportamiento contrario a ATerceroExecute

  // Parametro TERFICH001 - Espedifica que version de la ficha de tercero se ejecuta por defecto
  // N Nueva version
  // O Version original
  if (LeeParametro('TERFICH001') <> 'N') then
  begin
     AbreForm(TFMTerceros, FMTerceros, Sender);
     if ((not EnlaceModal) and (Assigned(FMTerceros))) then
        FMTerceros.FiltraTercero(FiltroAccion);
  end
  else
  begin
     AbreForm(TFMTerceros2, FMTerceros2, Sender);
     if ((not EnlaceModal) and (Assigned(FMTerceros2))) then
        FMTerceros2.FiltraTercero(FiltroAccion);
  end;

  FiltroAccion := '';
end;

procedure TFMain.APaisesExecute(Sender: TObject);
begin
  AbreForm(TFMPaises, FMPaises, Sender);
end;

procedure TFMain.ACanalesExecute(Sender: TObject);
begin
  AbreForm(TFMCanales, FMCanales, Sender);
end;

procedure TFMain.AContaExtractoExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFCMayor, FCMayor, Sender);

  if (Assigned(FCMayor)) then
     FCMayor.Filtra(FiltroAccion);

  FiltroAccion := '';
end;

procedure TFMain.AAlmacenesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMAlmacenes, FMAlmacenes, Sender);

  if (FiltroAccion = '/actualiza-pmp') then
     FMAlmacenes.ActualizarPMP;

  if (FiltroAccion = '/pondera') then
     FMAlmacenes.Ponderar;

  FiltroAccion := '';
end;

procedure TFMain.AFamiliasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMFamilias, FMFamilias, Sender);
end;

procedure TFMain.ATarifasExecute(Sender: TObject);
begin
  AbreForm(TFMTarifas, FMTarifas, Sender);
end;

procedure TFMain.AArticulosExecute(Sender: TObject);
var
  FM : TFMArticulos;
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMArticulos, FM, Sender);
     if ((not EnlaceModal) and (Assigned(FM))) then
     begin
        FM.FiltraArticulos(FiltroAccion);
        FMArticulos := FM;
     end;
     FiltroAccion := '';
  end;
end;

procedure TFMain.AContaBorradorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMBorradorContabilidad, FMBorradorContabilidad, Sender);
end;

procedure TFMain.AContaDefBalancesExecute(Sender: TObject);
begin
  AbreForm(TFMBalances, FMBalances, Sender);
end;

procedure TFMain.AContaCuentasAnualesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCuAnuales, FMCuAnuales, Sender);
end;

procedure TFMain.ATipoIvaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTipoIva, FMTipoIva, Sender);
end;

procedure TFMain.AModoIvaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMModoIva, FMModoIva, Sender);
end;

procedure TFMain.AMvStManExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMMovManStock, FMMovManStock, Sender);
end;

procedure TFMain.APedidosExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST019) then
     begin
        AbreForm(TFMPedidosAlquiler, FMPedidosAlquiler, Sender);
        FMPedidos := FMPedidosAlquiler;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMPedidosAlquiler.HelpFile := REntorno.FicheroAyuda;
        FMPedidosAlquiler.HelpType := htKeyword;
        FMPedidosAlquiler.HelpKeyword := 'FMPEDIDOS';
     end
     else
     if (Param_MODREST017) then
     begin
        AbreForm(TFMPedidosTallas, FMPedidosTallas, Sender);
        FMPedidos := FMPedidosTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMPedidosTallas.HelpFile := REntorno.FicheroAyuda;
        FMPedidosTallas.HelpType := htKeyword;
        FMPedidosTallas.HelpKeyword := 'FMPEDIDOS';
     end
     else
        AbreForm(TFMPedidos, FMPedidos, Sender);
  end;
end;

procedure TFMain.AContaDiarioExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregLibroDiarioConta, FPregLibroDiarioConta, Sender);
end;

procedure TFMain.AContaSumYSaldosExecute(Sender: TObject);
begin
  AbreForm(TFPregSumasYSaldos, FPregSumasYSaldos, Sender);
end;

procedure TFMain.ARegIVAExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMRegistroIVA, FMRegistroIVA, Sender);
end;

procedure TFMain.AContadoresExecute(Sender: TObject);
begin
  AbreForm(TFMContadores, FMContadores, Sender);
end;

procedure TFMain.AContaPlantillasExecute(Sender: TObject);
begin
  AbreForm(TFMPlantillas, FMPlantillas, Sender);
end;

procedure TFMain.ACambioMonedasExecute(Sender: TObject);
begin
  AbreForm(TFMCambioDivisas, FMCambioDivisas, Sender);
end;

procedure TFMain.AClientesExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (EnlaceModal) then
        CierraForm(FMClientes);

     AbreForm(TFMClientes, FMClientes, Sender);

     if ((not EnlaceModal) and (Assigned(FMClientes))) then
        FMClientes.FiltraCliente(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProveedoresExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMProveedores, FMProveedores, Sender);
     if ((not EnlaceModal) and (Assigned(FMProveedores))) then
        FMProveedores.FiltraProveedores(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AFondoExecute(Sender: TObject);
begin
  with AFondo do
  begin
     if (not FFondo.Visible) then
     begin
        Caption := _('Ocultar Fondo');
        Hint := _('Ocultar Fondo');
        ImageIndex := 22;
        FFondo.Visible := True;

        RestauraVentanas;
     end
     else
     begin
        Caption := _('Muestra Fondo');
        Hint := _('Muestra Fondo');
        ImageIndex := 23;
        FFondo.Visible := False;
     end;
  end;
end;

procedure TFMain.AContaPGCExecute(Sender: TObject);
begin
  AbreForm(TFPregPlanCuentas, FPregPlanCuentas, Sender);
end;

procedure TFMain.AAgentesExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMAgentes, FMAgentes, Sender);
     FMAgentes.FiltraAgentes(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AAcreedoresExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMAcreedores, FMAcreedores, Sender);
     if ((not EnlaceModal) and (Assigned(FMAcreedores))) then
        FMAcreedores.FiltraAcreedores(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.ACarteraExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCartera, FMCartera, Sender);
end;

procedure TFMain.AFormaPagoExecute(Sender: TObject);
begin
  AbreForm(TFMFormasPago, FMFormasPago, Sender);
end;

procedure TFMain.AContaCuentasIVAExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCuentasIVA, FMCuentasIVA, Sender);
end;

procedure TFMain.AGenCanalesExecute(Sender: TObject);
begin
  AbreForm(TFMGenCanales, FMGenCanales, Sender);
end;

procedure TFMain.AGenSeriesExecute(Sender: TObject);
begin
  AbreForm(TFMGenSeries, FMGenSeries, Sender);
end;

procedure TFMain.AGenEjerciciosExecute(Sender: TObject);
begin
  AbreForm(TFMGenEjercicios, FMGenEjercicios, Sender);
end;

procedure TFMain.AContaCuentasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCuentas, FMCuentas, Sender);
end;

procedure TFMain.AMenuRapidoExecute(Sender: TObject);
begin
  // AbreForm(TFOpMain, FOpMain, Sender);
end;

procedure TFMain.APropagaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTarFamPropagacion, FMTarFamPropagacion, Sender);
end;

procedure TFMain.AAlbaranesExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST017) then
     begin
        AbreForm(TFMAlbaranesTallas, FMAlbaranesTallas, Sender);
        FMAlbaranes := FMAlbaranesTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMAlbaranesTallas.HelpFile := REntorno.FicheroAyuda;
        FMAlbaranesTallas.HelpType := htKeyword;
        FMAlbaranesTallas.HelpKeyword := 'FMALBARANES';
     end
     else
     if (Param_MODREST019) then
     begin
        AbreForm(TFMAlbaranesAlquiler, FMAlbaranesAlquiler, Sender);
     end
     else
        AbreForm(TFMAlbaranes, FMAlbaranes, Sender);
  end;
end;

procedure TFMain.AFacturasExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST017) then
     begin
        AbreForm(TFMFacturasTallas, FMFacturasTallas, Sender);
        FMFacturas := FMFacturasTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMFacturasTallas.HelpFile := REntorno.FicheroAyuda;
        FMFacturasTallas.HelpType := htKeyword;
        FMFacturasTallas.HelpKeyword := 'FMFACTURAS';
     end
     else
        AbreForm(TFMFacturas, FMFacturas, Sender);
  end;
end;

procedure TFMain.AOfertasExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST017) then
     begin
        AbreForm(TFMOFertasTallas, FMOfertasTallas, Sender);
        FMOfertas := FMOfertasTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMOfertasTallas.HelpFile := REntorno.FicheroAyuda;
        FMOfertasTallas.HelpType := htKeyword;
        FMOfertasTallas.HelpKeyword := 'FMOFERTAS';
     end
     else
        AbreForm(TFMOFertas, FMOfertas, Sender);
  end;
end;

procedure TFMain.APropPedidosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMPropPedidos, FMPropPedidos, Sender);
end;

procedure TFMain.APropuestasExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMPropuestas, FMPropuestas, Sender);
  end;
end;

procedure TFMain.APropuestasConfirmExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMPropuestasConfirm, FMPropuestasConfirm, Sender);
  end;
end;

procedure TFMain.APedidosProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST017) then
     begin
        AbreForm(TFMPedidosAProveedorTallas, FMPedidosAProveedorTallas, Sender);
        FMPedidosAProveedor := FMPedidosAProveedorTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMPedidosAProveedorTallas.HelpFile := REntorno.FicheroAyuda;
        FMPedidosAProveedorTallas.HelpType := htKeyword;
        FMPedidosAProveedorTallas.HelpKeyword := 'FMPEDIDOSAPROVEEDOR';
     end
     else
        AbreForm(TFMPedidosAProveedor, FMPedidosAProveedor, Sender);
  end;
end;

procedure TFMain.ARecepcionPedidosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMRecepcionPedidos, FMRecepcionPedidos, Sender);
end;

procedure TFMain.AContaCierreYAperturaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCierreApertura, FMCierreApertura, Sender);
end;

procedure TFMain.ASeriesExecute(Sender: TObject);
begin
  AbreForm(TFMSeries, FMseries, Sender);
end;

procedure TFMain.ACampanyasExecute(Sender: TObject);
begin
  AbreForm(TFMCampanyas, FMCampanyas, Sender);
end;

procedure TFMain.AFacAlbaranesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMFacturaAlbaranes, FMFacturaAlbaranes, Sender);
end;

procedure TFMain.AFacHistProcesosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFCGestProcesos, FCGestProcesos, Sender);
end;

procedure TFMain.FormResize(Sender: TObject);
begin
  PNLPestanyas.Width := PNLSistema.Width - PNLBotonesRapidos.Width - 10;
  if Param_SYSCONF007 then
     ClientHeight := PNLSistema.Height + StatBarMain.Height
  else
     ClientHeight := PNLSistema.Height;

  // Fuerza al menu a estar debajo de FMain
  try
     if (Assigned(FMMenu)) then
        FMMenu.Posicionar;
     if (Assigned(FFondo)) then
        FFondo.Posicionar;
  except
  end;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
  // Si no esta el parametro de mostrar Menú de pestanas lo oculto
  if not Param_SYSCONF007 then
  begin
     // Nueva altura de paneles
     PNLPestanyas.Visible := False;
     PNLBotonesRapidos.Width := 260;
     PNLBotonesRapidos.Height := 32;
     PNLSistema.Height := 32;

     TBUtilidades.Wrapable := False;

     // Fuerzo a que los paneles respeten el color del padre.
     PNLSistema.ParentColor := True;
     PNLBotonesRapidos.ParentColor := True;
     TBUtilidades.ParentColor := True;

     // Orden de los botones. Cambio de Ejercicio/Canal/Usuario al final
     TBMuestraMenu.Top := 0;
     TButtFondo.Top := 0;
     TButtFecha.Top := 0;
     TButtAviso.Top := 0;
     TButtSalir.Top := 0;
     TBAgenda.Top := 0;
     TButtMultiCambio.Top := 0;
     TBAgenda.Left := 0;
     TBMuestraMenu.Left := 0;
     TButtFondo.Left := 0;
     TButtFecha.Left := 0;
     TButtAviso.Left := 0;
     TButtSalir.Left := 0;
     TButtMultiCambio.Left := 0;

     // StatusBar al panel de pestañas
     StatBarMain.Parent := PNLSistema;
     StatBarMain.Align := alClient;
  end;

  FormResize(Sender);
  if (not Assigned(FMMenu)) then
  begin
     AbreForm(TFMMenu, FMMenu, Self);
     FMMenu.Posicionar;
  end;

  if (Assigned(FMMenu)) then
     FMMenu.CrearMenu(MainMenu);

  if FMMenu.Visible and (LeeDatoIni('Datos', 'MenuVisible', 0) = 0) then
     AMuestraMenuExecute(Sender);

  {$IFDEF Debug}
  MiPrueba.Click;
  {$ENDIF}

  if ((SincronizacionPureWorks) or (SincronizacionPrestashop) or (SincronizacionWoocommerce) or
     (SincronizacionSpeedLock) or (SincronizacionSellforege) or (PonderaArticulos) or
     (ActualizaPMPArticulos) or (ReporteInformeCaja) or (ReporteDiarioFacturacion) or
     (ReporteTrazabilidadCompras)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT * FROM LOG_ENTRADAS_VALIDA_SA (?NOMBRE, ?ENTRADA)';
              Params.ByName['NOMBRE'].AsString := REntorno.Nombre;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              ExecQuery;

              if (FieldByName['USUARIO'].AsInteger > 0) then
              begin
                 REntorno.Usuario := FieldByName['USUARIO'].AsInteger;
              end;

              FreeHandle;
           finally
              Free;
           end;
        except
           on e: Exception do
              DMMain.LogProduccion('LOG_ENTRADAS_VALIDA_SA(' + REntorno.Nombre + ', ' + REntorno.EntradaStr + ')' + #13#10 + e.message);
        end;
     end;

     REntorno.Empresa := 1;
     REntorno.Ejercicio := DameEjercicio(REntorno.Empresa, Today);
     REntorno.Canal := 1;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT E.MONEDA MONEDA_EMPRESA, C.PAIS, C.MONEDA, C.PGC, G.PERFIL ');
           SQL.Add(' FROM SYS_EMPRESAS E ');
           SQL.Add(' JOIN EMP_CANALES C ON E.EMPRESA = C.EMPRESA ');
           SQL.Add(' JOIN GEN_CANALES G ON C.EMPRESA = G.EMPRESA AND C.CANAL = G.CANAL ');
           SQL.Add(' WHERE ');
           SQL.Add(' E.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' C.EJERCICIO = :EJERCICIO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;

           REntorno.MonedaEmpresa := FieldByName['MONEDA_EMPRESA'].AsString;
           REntorno.Moneda := FieldByName['MONEDA'].AsString;
           REntorno.Pais := FieldByName['PAIS'].AsString;
           REntorno.PGC := FieldByName['PGC'].AsInteger;
           REntorno.Perfil := FieldByName['PERFIL'].AsString;

           FreeHandle;
        finally
           Free;
        end;
     end;

     DMMain.AjustaNivelesContables;

     if ((SincronizacionPureWorks) and (LeeParametro('MODSINC010') = 'S')) then
     begin
        DMMain.LogProduccion('ASincronizacionTiendaPureWorks');
        EjecutaAccion(ASincronizacionTiendaPureWorks, 'sinc');
     end;

     if ((SincronizacionPrestashop) and (LeeParametro('MODSINC003') = 'S')) then
     begin
        try
           DMMain.LogProduccion('SincronizacionPrestashop');
           EjecutaAccion(ASincronizaTienda, 'sinc');
        except
           on e: Exception do
              DMMain.LogProduccion('Error SincronizacionPrestashop' + #13#10 + e.Message);
        end;
     end;

     if ((SincronizacionWoocommerce) and (LeeParametro('MODSINC019') = 'S')) then
     begin
        EjecutaAccion(ASincronizaTiendaWoocommerce, 'sinc');
     end;

     if ((SincronizacionSpeedLock) and (LeeParametro('MODSINC016') = 'S')) then
     begin
        // Solo actualiza stock
        EjecutaAccion(ASincronizacionEginer, 'sinc');
     end;

     if (SincronizacionSellforege) then
     begin
        try
           DMMain.LogProduccion('SincronizacionSellforege');
           if ((LeeParametro('MODSINC008') = 'S') or (LeeParametro('MODSINC009') = 'S') or (LeeParametro('MODSINC020') = 'S') or (LeeParametro('MODSINC021') = 'S') or (LeeParametro('MODSINC022') = 'S') or (LeeParametro('MODSINC027') = 'S')) then
              EjecutaAccion(AImportarDocumentos, 'sinc');
        except
           on e: Exception do
              DMMain.LogProduccion('Error SincronizacionSellforege' + #13#10 + e.Message);
        end;
     end;

     if (ActualizaPMPArticulos) then
     begin
        try
           DMMain.LogProduccion('ActualizaPMPArticulos');
           REntorno.Empresa := 1;
           REntorno.Ejercicio := DameEjercicio(REntorno.Empresa, Today);
           REntorno.Canal := 1;
           DMMain.EnviaMensajeUsuario(REntorno.Usuario, 'EjecutaAccion(AAlmacenes, ''/actualiza-pmp'');');
           EjecutaAccion(AAlmacenes, '/actualiza-pmp');
           DMMain.EnviaMensajeUsuario(REntorno.Usuario, 'FIN EjecutaAccion(AAlmacenes, ''/actualiza-pmp'');');
        except
           on e: Exception do
              DMMain.LogProduccion('Error ActualizaPMPArticulos' + #13#10 + e.Message);
        end;
     end;

     if (PonderaArticulos) then
     begin
        try
           DMMain.LogProduccion('PonderaArticulos');
           REntorno.Empresa := 1;
           REntorno.Ejercicio := DameEjercicio(REntorno.Empresa, Today);
           REntorno.Canal := 1;
           DMMain.EnviaMensajeUsuario(REntorno.Usuario, 'EjecutaAccion(AAlmacenes, ''/pondera'');');
           EjecutaAccion(AAlmacenes, '/pondera');
           DMMain.EnviaMensajeUsuario(REntorno.Usuario, 'FIN EjecutaAccion(AAlmacenes, ''/pondera'');');
        except
           on e: Exception do
              DMMain.LogProduccion('Error PonderaArticulos' + #13#10 + e.Message);
        end;
     end;

     if (ReporteInformeCaja) then
     begin
        DMMain.LogProduccion('ReporteInformeCaja');
        EjecutaAccion(ADiarioReparaciones, 'ReporteInformeCaja');
     end;

     if (ReporteDiarioFacturacion) then
     begin
        DMMain.LogProduccion('ReporteDiarioFacturacion');
        EjecutaAccion(ADiarioReparaciones, 'ReporteDiarioFacturacion');
     end;

     if (ReporteTrazabilidadCompras) then
     begin
        DMMain.LogProduccion('ReporteTrazabilidadCompras');
        EjecutaAccion(ADiarioReparaciones, 'ReporteTrazabilidadCompras');
     end;

     // Para que no pregunte si estoy seguro de que quiero salir.
     CuentaRegresiva := 0;

     Close;
  end;
end;

procedure TFMain.ABusquedaExecute(Sender: TObject);
begin
  IOFBusqueda.ExecFindForm;
end;

procedure TFMain.APeriodosSistemaExecute(Sender: TObject);
begin
  AbreForm(TFMPeriodosSistema, FMPeriodosSistema, Sender);
end;

procedure TFMain.AGenPeriodosExecute(Sender: TObject);
begin
  AbreForm(TFMPeriodosEmpresa, FMPeriodosEmpresa, Sender);
end;

procedure TFMain.AAmortizacionesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMAmortizaciones, FMAmortizaciones, Sender);
end;

procedure TFMain.AImprimeFacturasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMImprimeFacturas, FMImprimeFacturas, Sender);
end;

procedure TFMain.ASysCuentasExecute(Sender: TObject);
begin
  AbreForm(TFMSysCuentas, FMSysCuentas, Sender);
end;

procedure TFMain.APerfilesExecute(Sender: TObject);
begin
  AbreForm(TFMPerfiles, FMPerfiles, Sender);
end;

procedure TFMain.AAjustesExecute(Sender: TObject);
begin
  AbreForm(TFMAjustes, FMAjustes, Sender);
end;

procedure TFMain.ACentrosInventarioExecute(Sender: TObject);
begin
  AbreForm(TFMCentInventario, FMCentInventario, Sender);
end;

procedure TFMain.ANewTarifasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTarifaPArticulo, FMTarifaPArticulo, Sender);
end;

procedure TFMain.AAlbaranesProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST017) then
     begin
        AbreForm(TFMAlbaranesAProveedorTallas, FMAlbaranesAProveedorTallas, Sender);
        FMAlbaranesAProveedor := FMAlbaranesAProveedorTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMAlbaranesAProveedorTallas.HelpFile := REntorno.FicheroAyuda;
        FMAlbaranesAProveedorTallas.HelpType := htKeyword;
        FMAlbaranesAProveedorTallas.HelpKeyword := 'FMALBARANESAPROVEEDOR';
     end
     else
        AbreForm(TFMAlbaranesAProveedor, FMAlbaranesAProveedor, Sender);
  end;
end;

procedure TFMain.AFacturasProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if (Param_MODREST017) then
     begin
        AbreForm(TFMFacturasAProveedorTallas, FMFacturasAProveedorTallas, Sender);
        FMFacturasAProveedor := FMFacturasAProveedorTallas;
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMFacturasAProveedor.HelpFile := REntorno.FicheroAyuda;
        FMFacturasAProveedor.HelpType := htKeyword;
        FMFacturasAProveedor.HelpKeyword := 'FMFACTURASAPROVEEDOR';
     end
     else
        AbreForm(TFMFacturasAProveedor, FMFacturasAProveedor, Sender);
  end;
end;

procedure TFMain.ALSTIVAListadoExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMLSTIva, FMLSTIva, Sender);
end;

// Restaura menu pone a visible los separadores y opc de menu.
// se utiliza para cuando haces un cambio de usuario desde el programa,
// para que el proximo usuario se le cree el arbol correctamente.
procedure TFMain.RestauraMenu(const Menu: TMenuItem);
var
  i : integer;
  Tope : integer;
begin
  Tope := Menu.Count - 1;
  for i := 0 to Tope do
  begin
     RestauraMenu(Menu.Items[i]);

     with Menu.Items[i] do
     begin
        if (Caption = '-') or (Count <> 0) then
           Visible := True;
        if Assigned(Action) then
           TAction(Action).Visible := True;
     end;
  end;
end;

// Restaura paginas del menu
procedure TFMain.RestauraPageMenu;
var
  i, j : integer;
begin
  for i := 0 to PCMain.PageCount - 1 do
     PCMain.Pages[i].TabVisible := True;

  for i := 0 to ComponentCount - 1 do
     if Components[i].ClassType = TLFToolBar then
     begin
        with TLFToolBar(Components[i]) do
        begin
           for j := 0 to ButtonCount - 1 do
           begin
              if (Buttons[j].Style = tbsSeparator) then
              begin
                 Buttons[j].Style := tbsButton;
                 Buttons[j].Visible := True;
                 Buttons[j].Style := tbsSeparator; // Restauramos
              end
              else
              begin
                 if Assigned(Buttons[j].Action) then
                    TAction(Buttons[j].Action).Visible := True;
              end;
           end;
        end;
     end;
end;

// Pone no visible los separadores, y paginas a las que estan restringidas.
procedure TFMain.EliminaPageMenu;
var
  i : integer;
  j : integer;
  Existe : Bool;
  ExisteAntes : Bool;
  Separador : integer;
begin
  Separador := 0;
  for i := 0 to ComponentCount - 1 do
  begin
     if Components[i].ClassType = TLFToolBar then
     begin
        with (TLFToolBar(Components[i])) do
        begin
           Existe := False;
           ExisteAntes := False;
           for j := 0 to ButtonCount - 1 do
           begin
              if (Buttons[j].Style = tbsSeparator) then
              begin
                 ExisteAntes := False;
                 Separador := j;
                 if (not Existe) then
                 begin
                    // Si dejamos en estilo separador no actua el Visible := False
                    Buttons[j].Style := tbsButton;
                    Buttons[j].Visible := False;
                    Buttons[j].Style := tbsSeparator;
                 end;
              end
              else if (Buttons[j].Visible) then
              begin
                 Existe := True;
                 ExisteAntes := True;
              end;
           end;

           if (not ExisteAntes) and (Existe) then
           begin
              // Si dejamos en estilo separador no actua el Visible := False
              Buttons[Separador].Style := tbsButton;
              Buttons[Separador].Visible := False;
              Buttons[Separador].Style := tbsSeparator; // Restauramos
           end;
        end;

        if not Existe then
           TTabSheet(TLFToolBar(Components[i]).Parent).TabVisible := False;
     end;

     if Components[i].ClassType = TToolBar then
     begin
        with (TToolBar(Components[i])) do
        begin
           Existe := False;
           ExisteAntes := False;
           for j := 0 to ButtonCount - 1 do
           begin
              if (Buttons[j].Style = tbsSeparator) then
              begin
                 ExisteAntes := False;
                 Separador := j;
                 if (not Existe) then
                 begin
                    // Si dejamos en estilo separador no actua el Visible := False
                    Buttons[j].Style := tbsButton;
                    Buttons[j].Visible := False;
                    Buttons[j].Style := tbsSeparator;
                 end;
              end
              else if (Buttons[j].Visible) then
              begin
                 Existe := True;
                 ExisteAntes := True;
              end;
           end;

           if (not ExisteAntes) and (Existe) then
           begin
              // Si dejamos en estilo separador no actua el Visible := False
              Buttons[Separador].Style := tbsButton;
              Buttons[Separador].Visible := False;
              Buttons[Separador].Style := tbsSeparator; // Restauramos
           end;
        end;

        if not Existe then
           TTabSheet(TToolBar(Components[i]).Parent).TabVisible := False;
     end;
  end;
end;

// Pone no visible los separadores, y opciones de menu a las que estan restringidas.
procedure TFMain.EliminaMenu(const Menu: TMenuItem; var Valor: integer; Antes: integer);
var
  i : integer;
  HayOpc : boolean;
  Separador : integer;
begin
  Separador := -1;
  HayOpc := False;
  for i := 0 to Menu.Count - 1 do
  begin
     if (Menu.Items[i].Count <> 0) then // Tiene submenu
     begin
        EliminaMenu(Menu.Items[i], Valor, Antes);
        if (Antes = Valor) then
           Menu.Items[i].Visible := False // No Visible
        else
           HayOpc := True;
        Antes := Valor;
     end
     else // No tiene submenu
     begin
        if (Menu.Items[i].Caption <> '-') and (not Assigned(Menu.Items[i].Action)) then // NO es un separador y NO tiene una accion asignada
        begin
           // Es un MenuGroup vacio.
           if (Menu.Items[i].Visible) then
           begin
              {
              // Evito eliminar los grupos que se rellenaran con las impresoras del sistema
              if ((Menu.Items[i] <> MGLaser) and
                 (Menu.Items[i] <> MGMatricial) and
                 (Menu.Items[i] <> MGEtiquetas)) then
              }
              Menu.Items[i].Visible := False;
           end;
        end
        else // Es un separador
        if (Menu.Items[i].Caption <> '-') then // NO es un separador y tiene una accion asociada
        begin
           if (Menu.Items[i].Visible) then
           begin
              Inc(Valor);
              HayOpc := True;
           end;
        end
        else // Es un separador
        begin
           // Elimina Separador;
           if (not HayOpc) then
              Menu.Items[i].Visible := False
           else
           begin
              HayOpc := False;
              Separador := i;
           end;
        end;
     end;
  end;

  // Elimina ultimo Separador
  if (Separador <> -1) and (not HayOpc) then
     Menu.Items[Separador].Visible := False;
end;

// Pone no visible o enabled las actions a las que estan restringidas.
procedure TFMain.LimitaMenu;
var
  CadenaRestriccion : string;
  i, PosicionRestriccion : integer;
  AccionABuscar : string;
begin
  RestauraMenu(MainMenu.Items);
  RestauraPageMenu;
  CadenaRestriccion := DMMain.DameRestriccionUSuario;

  {TODO : MODREST017, MODREST019, SYSTERM001 deberia cargarse después de elegir empresa+ejercicio+canal}
  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');
  Param_MODREST019 := (LeeParametro('MODREST019') = 'S');
  Param_SYSTERM001 := LeeParametro('SYSTERM001');

  LimitaSegunConfiguracion;
  LimitaSegunPais;

  for i := 0 to (ALMain.ActionCount - 1) do
  begin
     with TAction(ALMain.Actions[i]) do
     begin
        Visible := True;
        Enabled := True;

        if (Tag <> 0) then // Tag = 0 seran visible apra todo usuarios
        begin
           AccionABuscar := (';' + IntToStr(Tag) + ',');
           PosicionRestriccion := Pos(AccionABuscar, CadenaRestriccion);
           if PosicionRestriccion > 0 then
           begin
              case StrToInt(Copy(CadenaRestriccion, PosicionRestriccion + Length(AccionABuscar), 1)) of
                 0:
                 begin // No visible e inactivo
                    Visible := False;
                    Enabled := False;
                 end;
                 2:
                 begin // Visible y activo
                    Visible := True;
                    Enabled := True;
                 end;
                 else // Visible y inactivo
                 begin
                    Enabled := False;
                    Visible := True;
                 end;
              end;
           end;
        end;
     end;
  end;

  if (LeeParametro('MODREST028') = 'S') then
  begin
     // Restringo modelos de hacienda según ejercicio
     if (REntorno.Ejercicio > 2009) then
        AModelo300.Visible := False;
     if (REntorno.Ejercicio > 2009) then
        AModelo330.Visible := False;
  end;

  if (REntorno.Pais = 'ESP') then
  begin
     // Sistema Inmediato de Informacion
     if ASII.Visible then
        ASII.Visible := DMMain.UtilizaSII;

     // Verifico si esta habilitado segun restricciones
     if AVerifactu.Visible then
        AVerifactu.Visible := DMMain.UtilizaVerifactu;

     // Si no esta restringido y se utiliza Verifactu muestro estado del servicio de presentacion en el panel
     if AVerifactu.Visible then
     begin
        StatBarMain.Panels[5].Width := 220;
        TmrVerificaVerifactu.Enabled := True;
     end
     else
     begin
        StatBarMain.Panels[5].Width := 0;
        TmrVerificaVerifactu.Enabled := False;
     end;

     // TicketBAI
     if ASIILROE.Visible then
        ASIILROE.Visible := DMMain.UtilizaTicketBAI;
  end;

  i := 0; // Para poderselo pasar por parametros directamente no me deja
  EliminaMenu(MainMenu.Items, i, 0);

  // Carga listados personalizados
  if (LeeParametro('MODREST023') = 'S') then
     MenuListados(MGListadosPers);

  // HabilitaBotonAccion(TButtCondiciones);
  ControlaBotonesDesplegables;
  EliminaPageMenu;
end;

procedure TFMain.LimitaSegunConfiguracion;
var
  Valor : integer;
begin
  /// Opciones no visibles si no está habilitado mediante Configuracion

  {$IFNDEF Debug}
  BorraAccion('APruebas');
  {$ENDIF}

  if (LeeParametro('MODREST001') <> 'S') then
  begin
     BorraGrupoAcciones('Obras');

     if Assigned(MGObras) then
        MGObras.Clear;
     FreeAndNil(MGObras);
  end;

  if (LeeParametro('MODREST003') <> 'S') then
  begin
     BorraGrupoAcciones('Reparaciones');
     if Assigned(MGReparaciones) then
        MGReparaciones.Clear;
     FreeAndNil(MGReparaciones);
  end;

  if (LeeParametro('MODREST004') <> 'S') then
  begin
     BorraGrupoAcciones('Produccion ISO');
     if Assigned(MGIso) then
        MGIso.Clear;
     FreeAndNil(MGIso);
  end;

  if (LeeParametro('MODREST005') <> 'S') then
  begin
     BorraGrupoAcciones('Operarios');
     BorraGrupoAcciones('Control Presencia');
     if Assigned(MGEmpleados) then
        MGEmpleados.Clear;
     FreeAndNil(MGEmpleados);
  end;

  if (DMMain.EstadoKri(125) = 1) then {ABC grupo TB}
  begin
     TButtABCCompras.Style := tbsButton;
     TButtABCCompras.Action := AABCComprasKri;
     TButtABCVentas.Style := tbsButton;
     TButtABCVentas.Action := AABCVentasKri;
  end;
  if (DMMain.EstadoKRI(141) <> 1) then
     ACaravanas.Visible := False;
  if (DMMain.EstadoKRI(155) <> 1) then
     ADivisionesMaestros.Visible := False;
  if (LeeParametro('MODNORMA43') <> 'S') then
     ANorma43Kri.Visible := False;

  //  if (DMMain.EstadoKri(187) <> 1) then
  if (LeeParametro('MODREST016') <> 'S') then
  begin
     BorraAccion('AClientesPotencialesKri');
  end
  else
  begin
     TButtClientes.Style := tbsDropDown;
     TButtClientes.DropDownMenu := PopupClientesKri;
  end;

  if (LeeParametro('ALMPCOS001') <> 'S') then
     BorraAccion('APreciosCosteKri');

  if (DMMain.EstadoKRI(190) <> 1) then
     ATipoLineaVenta.Visible := False;

  if (LeeParametro('MODREST021') <> 'S') then
     BorraAccion('APedidoEntreAlmacenes');

  if (DMMain.EstadoKRI(193) <> 1) then
     ATraspasoPedCliAPedProv.Visible := False;

  if (DMMain.EstadoKRI(210) <> 1) then
     AAlarmasIberfluidKri.Visible := False;

  if (LeeParametro('MODREST020') <> 'S') then
     BorraAccion('APersonalUlises');

  if (LeeParametro('MODREST002') <> 'S') then
     BorraGrupoAcciones('CRM');

  // Es un modulo con un CRM basico. No se utiliza
  BorraAccion('ACRM');

  // Se hizo para Wenigas. No se utiliza
  BorraAccion('ACrmArticulos');

  if (LeeParametro('MODREST022') <> 'S') then
     BorraGrupoAcciones('Estadisticas');

  if (LeeParametro('MODREST028') = 'N') then
     BorraGrupoAcciones('Impuestos');

  if (LeeParametro('MODREST006') = 'N') then
  begin
     BorraGrupoAcciones('Produccion Despiece');
     BorraGrupoAcciones('Produccion Pauta');
     BorraGrupoAcciones('Produccion Plan');
     BorraGrupoAcciones('Produccion Avanzada');
  end;

  if (LeeParametro('MODREST007') = 'N') then
     BorraGrupoAcciones('Produccion');

  if (LeeParametro('SYSCONF004') <> 'S') then
     BorraAccion('ACambioIdioma');

  if (StrToIntDef(LeeParametro('SYSCONF005'), 0) = 0) then
     BorraAccion('ATipoUnidadLogistica');

  // Hojas de preparacion de pedidos
  if (LeeParametro('HOJAPRE001') = '0') then
  begin
     AAltaHojaDePreparacion.Visible := False;
     AHojaDePreparacion.Visible := False;
     MIHojaDePreparacion.Visible := False;
     AResponsableHojaDePreparacion.Visible := False;
     MGHojasDePreparacion.Visible := False;
  end;

  if (not Param_MODREST017) then
  begin
     BorraGrupoAcciones('Tallas');
     BorraAccion('AOrdenProduccionTallasKri');
  end;

  if (LeeParametro('MODREST018') <> 'S') then
  begin
     BorraGrupoAcciones('Contabilidad Analitica');
     if Assigned(MGContabilidadAnaltica) then
        MGContabilidadAnaltica.Clear;
     FreeAndNil(MGContabilidadAnaltica);
  end;

  if (LeeParametro('MODREST026') <> 'S') then
  begin
     BorraAccion('AEDI');
  end;

  if (DMMain.EstadoKri(261) <> 1) then
  begin
     AProtocoloDeVentas.Visible := False;
     AProtocolosDeVenta.Visible := False;
     MIProtocoloDeVentas.Visible := False;
  end;

  // Pegasus Listados personalizados
  if (LeeParametro('MODREST023') <> 'S') then
     BorraGrupoAcciones('Listados Presonalizado');

  if (LeeParametro('MODREST008') <> 'S') then
     BorraGrupoAcciones('Etiquetas');

  // Modulos ECommerce
  if (LeeParametro('MODSINC001') <> 'S') then
     BorraAccion('AExportacionEuroPastry');

  if (LeeParametro('MODSINC002') <> 'S') then
     BorraAccion('AEnviarDatosPonys');

  if (LeeParametro('MODSINC003') <> 'S') then
     BorraAccion('ASincronizaTienda');

  if (LeeParametro('MODSINC006') <> 'S') then
     BorraAccion('ASincronizaTiendaMasYMasBarato');

  if (LeeParametro('MODSINC019') <> 'S') then
     BorraAccion('ASincronizaTiendaWoocommerce');

  if (LeeParametro('MODSINC004') <> 'S') then
     BorraAccion('ASincronizarBasesKri');

  if (LeeParametro('MODSINC005') <> 'S') then
     BorraAccion('ASincronizaIncidencias');

  if (LeeParametro('MODSINC007') <> 'S') then
     BorraAccion('AImportarPedidos');

  if ((LeeParametro('MODSINC008') <> 'S') and (LeeParametro('MODSINC009') <> 'S') and (LeeParametro('MODSINC020') <> 'S') and (LeeParametro('MODSINC021') <> 'S') and (LeeParametro('MODSINC022') <> 'S') and (LeeParametro('MODSINC027') <> 'S')) then
     BorraAccion('AImportarDocumentos');

  if (LeeParametro('MODSINC010') <> 'S') then
     BorraAccion('ASincronizacionTiendaPureWorks');

  if (LeeParametro('MODSINC011') <> 'S') then
     BorraAccion('ARecepcionWeb');

  if (LeeParametro('MODSINC012') <> 'S') then
     BorraAccion('AExportacionHelios');

  if (LeeParametro('MODSINC013') <> 'S') then
  begin
     BorraAccion('AImportacionVending');
     BorraAccion('AMaquinasVending');
  end;

  if (LeeParametro('MODSINC014') <> 'S') then
     BorraAccion('AExportacionTyrsa');

  if (LeeParametro('MODSINC016') <> 'S') then
  begin
     BorraAccion('AAtributos');
     BorraAccion('ASincronizacionEginer');
  end;

  if (LeeParametro('MODSINC023') <> 'S') then
     BorraAccion('ASincronizacionSkrit');

  if (LeeParametro('MODSINC024') <> 'S') then
     BorraAccion('ABrevo');

  if (LeeParametro('MODSINC025') <> 'S') then
     BorraAccion('ASincronizacionColon');

  if (LeeParametro('MODSINC026') <> 'S') then
     BorraAccion('ASincronizacionTyC');

  if (LeeParametro('MODSINC028') <> 'S') then
     BorraAccion('ASincronizacionHubSpot');

  // ANDALPLAST
  if (LeeParametro('MODREST010') <> 'S') then
     BorraGrupoAcciones('ANDALplast');

  // TPV Aplicacion Separada
  if (LeeParametro('MODREST011') <> 'S') then
     BorraGrupoAcciones('TPV App');

  if (LeeParametro('MODREST012') <> 'S') then
     BorraGrupoAcciones('TPV');

  if (LeeParametro('MODREST013') <> 'S') then
  begin
     BorraGrupoAcciones('Coladas');
     MGColadas.Visible := False;
     // Auxiliares
     if Assigned(MIMateriales) then
        EliminaMenu(MIMateriales, Valor, 0);
     MIMateriales := nil;
     BorraAccion('AMateriales');
  end;

  if (LeeParametro('MODREST014') <> 'S') then
  begin
     BorraGrupoAcciones('Gas');
     MGGas.Visible := False;
  end;

  AImportarArticulosExcel.Visible := (LeeParametro('MODIMPARTEXCEL') = 'S');

  AControlPlazas.Visible := (LeeParametro('MODCONTROLPLAZAS') = 'S');

  if (LeeParametro('MODREST015') <> 'S') then
  begin
     BorraGrupoAcciones('T y C');
     BorraGrupoAcciones('T y C Auxiliares');
     BorraGrupoAcciones('T y C Listados');
     if Assigned(MGTyC) then
     begin
        MGTyC.Clear;
        MGTyC.Free;
     end;
  end;

  // ADividirFacturas.Visible := (LeeParametro('PRYFACT001') = 'S');
  if (LeeParametro('PRYFACT001') <> 'S') then
     BorraAccion('ADividirFacturas');

  // Seleccion de recibos a incluir en la remesa
  AAsignaBancoRemesa.Visible := (DMMain.EstadoKri(2) = 1);

  ARepartirHorasProyecto.Visible := False;
  if (DMMain.EstadoKri(495) = 1) then
  begin
     ARepartirHorasProyecto.Visible := True;
     TButtProyectos.Parent := TBVentas;
     TButtProyectos.Left := ButtRepartirHorasProyecto.Left;
  end;

  if (LeeParametro('MODREST025') <> 'S') then
     BorraGrupoAcciones('Ubicacion');

  if (LeeParametro('MODSINC017') <> 'S') then
     BorraAccion('AImportacionDlivery');

  if (LeeParametro('MODSINC018') <> 'S') then
     BorraAccion('AImportacionMulty');
end;

procedure TFMain.LimitaSegunPais;
begin
  // Limitamos items del menu por pais

  { TODO -oMarcelo :
  Var en que pais hay que restringir estas acciones

  ZATalones
  ZAVentasFamilia
  ZAIntereses
  ALSTITBISListado
  AConsultadeItbis
  }

  if (REntorno.Pais <> 'DOM') then
  begin
     BorraAccion('AECFVentas');
     BorraAccion('AECFCompras');
     BorraAccion('ADGIIConfiguracionEnvio');
     BorraAccion('ATipoNCF');
     BorraAccion('ZASysNCF');
     BorraAccion('ZARecibos');
     BorraAccion('ARecibosdeIngresosDesglosados');
     BorraAccion('ATraspasoMulticanales');
     BorraAccion('ZADiarioVentas');
     BorraAccion('ATipoRetencion');
     BorraAccion('AListadoITBIS');
     BorraAccion('AConsultaITBIS');
     BorraAccion('ALSTTalones');
  end;

  if (REntorno.Pais <> 'BOL') then
  begin
     BorraAccion('ANumerosDeAutorizacion');
  end;

  if (REntorno.Pais <> 'CHL') then
  begin
     BorraGrupoAcciones('ImpuestosChile');
     BorraAccion('AEmpresasChile');
     BorraAccion('ANominasConstantes');
     BorraAccion('ANominasConceptosCHL');
     BorraAccion('AAFPIndicadores');
  end;

  if (REntorno.Pais <> 'ESP') then
  begin
     BorraAccion('ASII');
     BorraAccion('AVerifactu');
     BorraAccion('ASIILROE');
     BorraAccion('ANominasConceptos');
  end;
end;

procedure TFMain.APerfilesUsuarioExecute(Sender: TObject);
begin
  AbreForm(TFMRestriccion, FMRestriccion, Sender);
end;

procedure TFMain.ARemesasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMRemesas, FMRemesas, Sender);
end;

procedure TFMain.ADisenarTicketExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstTickets, DMLstTickets);
  TFMListConfig.Create(Self).Muestra(86, formato, cabecera, copias,
     pijama, REntorno.Serie, DMLstTickets.frTicket);
  CierraData(DMLstTickets);
end;

procedure TFMain.ADisenarValeExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstTickets, DMLstTickets);
  TFMListConfig.Create(Self).Muestra(623, formato, cabecera, copias,
     pijama, REntorno.Serie, DMLstTickets.frTicket);
  CierraData(DMLstTickets);
end;

procedure TFMain.ADisenarTicketRecogidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstTickets, DMLstTickets);
  TFMListConfig.Create(Self).Muestra(654, formato, cabecera, copias,
     pijama, REntorno.Serie, DMLstTickets.frTicket);
  CierraData(DMLstTickets);
end;

procedure TFMain.APregMayorCantidadExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregMayoresCantidad, FPregMayoresCantidad, Sender);
end;

procedure TFMain.ALSTStockMinimoExecute(Sender: TObject);
begin
  AbreForm(TFPregStockMinimo, FPregStockMinimo, Sender);
end;

procedure TFMain.ALSTDiarioStockExecute(Sender: TObject);
begin
  AbreForm(TFPregDiarioStock, FPregDiarioStock, Sender);
end;

procedure TFMain.AFacAlbaranesProvExecute(Sender: TObject);
begin
  AbreForm(TFMFacturaAlbaranesProv, FMFacturaAlbaranesProv, Sender);
end;

procedure TFMain.AContaCuentasIRPFExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCuentasIRPF, FMCuentasIRPF, Sender);
end;

procedure TFMain.ATipoIrpfExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTipoIrpf, FMTipoIrpf, Sender);
end;

procedure TFMain.AEscandalloExecute(Sender: TObject);
begin
  AbreForm(TFMArtEscandallo, FMArtEscandallo, Sender);
  FMArtEscandallo.FiltraArticulo(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ABancosExecute(Sender: TObject);
begin
  AbreForm(TFMEmpBancos, FMEmpBancos, Sender);
  FMEmpBancos.FiltraBanco(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ALSTStockResumidoExecute(Sender: TObject);
begin
  AbreForm(TFPregInStoResumido, FPregInStoResumido, Sender);
end;

procedure TFMain.ALSTStockAlmacenExecute(Sender: TObject);
begin
  AbreForm(TFPregStockAlmacen, FPregStockAlmacen, Sender);
end;

procedure TFMain.AListarCarteraExecute(Sender: TObject);
begin
  AbreForm(TFMRecibosPendientes, FMRecibosPendientes, Sender);
end;

procedure TFMain.ADiarioIVAExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregDiarioIVA, FPregDiarioIVA, Sender);
end;

procedure TFMain.ALSTInventarioExecute(Sender: TObject);
begin
  AbreForm(TFPregInventarioStocks, FPregInventarioStocks, Sender);
end;

procedure TFMain.AAgrupacionPedidosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMAgrupacionPedidosVentas, FMAgrupacionPedidosVentas, Sender);

  // **********************
  // **********************
  // **********************
  // Tyc Quizas dji lrk kri

  // Nuevo mantenimiento para agrupar pedidos completos (por cabecera, no por linia)
  // AbreForm(TZFMAgrupacionPedidosVentas, ZFMAgrupacionPedidosVentas, Sender); //SFG_JLA

  // **********************
  // **********************
  // **********************
end;

procedure TFMain.AUnidadesExecute(Sender: TObject);
begin
  AbreForm(TFMUnidades, FMUnidades, Sender);
end;

procedure TFMain.ARenumeraContabilidadExecute(Sender: TObject);
begin
  if Confirma and ConfirmaGrave then
  begin
     try
        Screen.Cursor := crHourGlass;
        DMMain.RenumeraAsientos;
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMain.AGenBancosExecute(Sender: TObject);
begin
  AbreForm(TFMBancos, FMBancos, Sender);
end;

procedure TFMain.ReEntra;
begin
  TVerificaEntrada.Enabled := False;
  CierraForms;
  REntorno.Clave := '';
  // Para que el siguiente no pueda entrar con la clave del anterior
  if AyudaEnLinea then
  begin
     FAyudaEnLinea.Close;
     FAyudaEnLinea.Free;
  end;
  // FreeAndNil(DMAyudaEnLinea);

  Dentro := False;
  DMMain.RegistraSalida;
  DMMain.RegistraEntrada;
  CreaAyudaEnLinea;
  Activate;
end;

procedure TFMain.MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: integer);
begin
  if TMenuItem(Sender).GetParentMenu.Images <> nil then
     Width := Width + 18
  else
     Width := Width + 18;
end;

procedure TFMain.OwnerDrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: boolean);
var
  auxChar : PChar;
  auxRect : TRect;
  auxBitmap : TBitmap;
  auxShortCut : string;
begin
  if FBmpMenuOff.Width <> (ARect.Right - ARect.Left) then
  begin
     CalcBitmapsMenu(ARect.Right - ARect.Left - 18, ARect.Bottom - ARect.Top);
  end;

  with ACanvas do
  begin
     Pen.Style := psSolid;
     Pen.Color := clBtnShadow;
     MoveTo(18, ARect.Top - 1);
     LineTo(18, ARect.Bottom + 1);

     Pen.Color := clBtnHighlight;
     MoveTo(19, ARect.Top - 1);
     LineTo(19, ARect.Bottom + 1);

     if Selected then
     begin
        Draw(ARect.Left + 20, ARect.Top, FBmpMenuOn);

        if TMenuItem(Sender).Enabled then
           Font.Color := clWhite
        else
           Font.Color := clSilver;
     end
     else
     begin
        Draw(ARect.Left + 20, ARect.Top, FBmpMenuOff);
        if TMenuItem(Sender).Enabled then
           Font.Color := clBlack
        else
           Font.Color := clSilver;
     end;

     if TMenuItem(Sender).Caption <> '-' then
     begin
        GetMem(auxChar, Length(TMenuItem(Sender).Caption) + 1);
        StrPCopy(auxChar, TMenuItem(Sender).Caption);

        auxRect := ARect;
        InflateRect(auxRect, -2, -2);
        if TMenuItem(Sender).GetParentMenu.Images <> nil then
           auxRect.Left := auxRect.Left + 20
        else
           auxRect.Left := auxRect.Left + 20;

        Brush.Style := bsClear;

        DrawTextEx(Handle, auxChar, Length(TMenuItem(Sender).Caption),
           auxRect, DT_END_ELLIPSIS, nil);

        FreeMem(auxChar);

        auxShortCut := ShortCutToText(TMenuItem(Sender).ShortCut);
        if auxShortCut <> '' then
        begin
           GetMem(auxChar, Length(auxShortCut) + 1);
           StrPCopy(auxChar, auxShortCut);

           auxRect.Right := auxRect.Right - 10;
           Font.Color := clRed;
           DrawTextEx(Handle, auxChar, Length(auxShortCut), auxRect, DT_RIGHT, nil);

           FreeMem(auxChar);
        end;
     end
     else
     begin
        Pen.Style := psSolid;
        Pen.Color := clBtnHighlight;
        MoveTo(ARect.Left + 20, (ARect.Bottom + ARect.Top) div 2);
        LineTo(ARect.Right, (ARect.Bottom + ARect.Top) div 2);

        Pen.Color := clBtnShadow;
        MoveTo(ARect.Left + 20, -1 + (ARect.Bottom + ARect.Top) div 2);
        LineTo(ARect.Right, -1 + (ARect.Bottom + ARect.Top) div 2);
     end;

     if TMenuItem(Sender).ImageIndex <> -1 then
     begin
        auxBitmap := TBitmap.Create;
        auxBitmap.Transparent := True;
        auxBitmap.TransparentMode := tmAuto;
        auxBitmap.Canvas.CopyMode := cmMergeCopy;
        TMenuItem(Sender).GetParentMenu.Images.GetBitmap(TMenuItem(Sender).ImageIndex,
           auxBitmap);

        Draw(ARect.Left, ARect.Top, auxBitmap);

        auxBitmap.Free;
     end;

     if TMenuItem(Sender).Checked then
     begin
        auxBitmap := TBitmap.Create;
        auxBitmap.Transparent := True;
        auxBitmap.TransparentMode := tmAuto;
        auxBitmap.Canvas.CopyMode := cmMergeCopy;
        auxBitmap.Handle := LoadBitmap(0, PChar(OBM_CHECK));
        Draw(ARect.Left, ARect.Top, auxBitmap);

        auxBitmap.Free;
     end;
  end;
end;

procedure TFMain.ARazonesExecute(Sender: TObject);
begin
  AbreForm(TFMRazones, FMRazones, Sender);
end;

procedure TFMain.AFacturasAcrExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMFacturasAAcr, FMFacturasAAcr, Sender);
end;

procedure TFMain.ACierraFacturasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCierraDocumento, FMCierraDocumento, Sender);
end;

procedure TFMain.ACuentasAnualesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCuAnuales, FMCuAnuales, Sender);
end;

procedure TFMain.ABalanceExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFVerBalances, FVerBalances, Sender);
end;

procedure TFMain.AAGrupacionesExecute(Sender: TObject);
begin
  AbreForm(TFMAgrupaciones, FMAgrupaciones, Sender);
end;

procedure TFMain.ATiposDirExecute(Sender: TObject);
begin
  AbreForm(TFMTiposDir, FMTiposDir, Sender);
end;

procedure TFMain.ATiposAcreedorExecute(Sender: TObject);
begin
  AbreForm(TFMTipoAcreedor, FMTipoAcreedor, Sender);
end;

procedure TFMain.AListadorExecute(Sender: TObject);
begin
  AbreForm(TFMDisenador, FMDisenador, Sender);
end;

procedure TFMain.AProyectosExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMProyectos, FMProyectos, Sender);
     if (FiltroAccion <> '') then
     begin
        FMProyectos.Filtra(StrToIntDef(FiltroAccion, -1));
        FiltroAccion := '';
     end;
  end;
end;

procedure TFMain.ACodigosBarrasExecute(Sender: TObject);
begin
  AbreForm(TFMCodigosBarra, FMCodigosBarra, Sender);
end;

procedure TFMain.ATiposEfectosExecute(Sender: TObject);
begin
  AbreForm(TFMTiposEfectos, FMTiposEfectos, Sender);
end;

procedure TFMain.ACondicionesProvExecute(Sender: TObject);
begin
  AbreForm(TFMCondicionesProv, FMCondicionesProv, Sender);
end;

procedure TFMain.APunteoAsientosExecute(Sender: TObject);
begin
  AbreForm(TFMPunteoAsientos, FMPunteoAsientos, Sender);
end;

procedure TFMain.ATipoImpuestosExecute(Sender: TObject);
begin
  AbreForm(TFMTipoImpuestos, FMTipoImpuestos, Sender);
end;

procedure TFMain.ATarifasProveedorExecute(Sender: TObject);
begin
  AbreForm(TFMArtProveedor, FMArtProveedor, Sender);
end;

procedure TFMain.AddComponentePunto(Componente: TComponent);
begin
  if ComponentesPunto.IndexOf(Componente) = -1 then
     ComponentesPunto.Add(Componente);
end;

procedure TFMain.DelComponentePunto(Componente: TComponent);
begin
  ComponentesPunto.Remove(Componente);
end;

procedure TFMain.AddComponenteReturn(Componente: TComponent);
begin
  if ComponentesReturn.IndexOf(Componente) = -1 then
     ComponentesReturn.Add(Componente);
end;

procedure TFMain.DelComponenteReturn(Componente: TComponent);
begin
  ComponentesReturn.Remove(Componente);
end;

{ Establece un filtro y después ejecuta la acción correspondiente }
procedure TFMain.EjecutaAccion(Accion: TAction; Filtro: string = '');
begin
  FiltroAccion := Filtro;
  Accion.Execute;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
  //Se liberan los objetos de uso interno
  FreeAndNil(FFondo);

  ComponentesPunto.Free;
  ComponentesReturn.Free;
  FBMPMenuOff.Free;
  FBMPMenuOn.Free;

  {$IFDEF Debug}
  DefaultInstance.DebugLogToFile(ChangeFileExt(ParamStr(0), '_GNUGetText.Log'), False);
  {$ENDIF}
end;

procedure TFMain.APropagaEmpresaExecute(Sender: TObject);
begin
  AbreForm(TFMPropaga, FMPropaga, Sender);
end;

{ Click sobre el botón con submenú TARIFAS }
procedure TFMain.TButtTarifasClick(Sender: TObject);
begin
  // Si está habilitado Tarifas
  ATarifas.Execute;
end;

procedure TFMain.ASaldosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMSaldosCon, FMSaldosCon, Sender);
end;

procedure TFMain.AFormasPagoExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMGenFormasPago, FMGenFormasPago, Sender);
end;

procedure TFMain.ACondAgentesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCondicionesAgeCli, FMCondicionesAgeCli, Sender);
end;

procedure TFMain.ACondAgeAgrupExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCondicionesAgeAgrupArt, FMCondicionesAgeAgrupArt, Sender);
end;

procedure TFMain.ACondAgeCliExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCondicionesAgeCliArt, FMCondicionesAgeCliArt, Sender);
end;

procedure TFMain.AABCVentasExecute(Sender: TObject);
begin
  //if (DMMain.EstadoKRI(125) = 0) then
  if EstructuraCreada then
     AbreForm(TFPregABCVentas, FPregABCVentas, Sender);
end;

procedure TFMain.AABCVentasKriExecute(Sender: TObject);
begin
  //if (DMMain.EstadoKRI(125) = 1) then
  if EstructuraCreada then
     AbreForm(TFPRegABCVentasKri, FPRegABCVentasKri, Sender);
end;

procedure TFMain.ATercerosCuentasExecute(Sender: TObject);
begin
  AbreForm(TFMTercerosCuentas, FMTercerosCuentas, Sender);
end;

procedure TFMain.AABCComprasExecute(Sender: TObject);
begin
  //if (DMMain.EstadoKRI(125) = 0) then
  if EstructuraCreada then
     AbreForm(TFPregABCCompras, FPregABCCompras, Sender);
end;

procedure TFMain.AABCComprasKriExecute(Sender: TObject);
begin
  //if (DMMain.EstadoKRI(125) = 1) then
  if EstructuraCreada then
     AbreForm(TFPregABCComprasKri, FPregABCComprasKri, Sender);
end;

procedure TFMain.APCRecAgrupadosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMPagaRecibosAgr, FMPagaRecibosAgr, Sender);
end;

procedure TFMain.MuestraInfo(Formulario: string);
begin
  FormularioAyudaEnLinea := Formulario;
  if (AyudaEnLinea) then
     FAyudaenLinea.InfoFormulario(FormularioAyudaEnLinea);
end;

procedure TFMain.AAyudaenLineaExecute(Sender: TObject);
begin
  if (not AyudaEnLinea) then
  begin
     CreaAyudaEnLinea;
     FAyudaenLinea.InfoFormulario(FormularioAyudaEnLinea);
  end;
  FAyudaenLinea.Visible := not (FAyudaenLinea.Visible);
end;

procedure TFMain.APlazosGarantiaExecute(Sender: TObject);
begin
  AbreForm(TFMPlazosGarantia, FMPlazosGarantia, Sender);
end;

procedure TFMain.AEscandalloProdExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     if DMMain.EstadoKri(102) = 1 then
     begin
        AbreForm(TFMEscandalloProd_KRI, FMEscandalloProd_KRI, Sender);
        {dji lrk kri - Ayuda}
        if REntorno <> nil then
           FMEscandalloProd_KRI.HelpFile := REntorno.FicheroAyuda;
        FMEscandalloProd_KRI.HelpType := htKeyword;
        FMEscandalloProd_KRI.HelpKeyword := 'FMESCANDALLOPROD';
        FMEscandalloProd_KRI.FiltraEscandallo(FiltroAccion);
     end
     else
     begin
        AbreForm(TFMEscandalloProd, FMEscandalloProd, Sender);
        FMEscandalloProd.FiltraEscandallo(FiltroAccion);
     end;
  end;
  FiltroAccion := '';
end;

procedure TFMain.AOrdenProduccionExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMOrdenProduccion, FMOrdenProduccion, Sender);
end;

procedure TFMain.ANuevoReciboExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMReciboNuevo, FMReciboNuevo, Sender);
end;

procedure TFMain.ACambiaFechaExecute(Sender: TObject);
var
  NuevaFecha : TDateTime;
begin
  NuevaFecha := REntorno.FechaTrab;
  if (PideDato('DAT', NuevaFecha, _('Nueva fecha de trabajo'))) then
     REntorno.FechaTrab := NuevaFecha;
  MuestraFecha;
end;

procedure TFMain.AFacAlbaranesProvDetExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMFacturacionAlbDet, FMFacturacionAlbDet, Sender);
end;

procedure TFMain.AListNecesidadesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregNecesidades, FPregNecesidades, Sender);
end;

procedure TFMain.RestauraVentanas;
var
  i : integer;
begin
  BringToFront;

  Application.ProcessMessages;
  for i := 0 to Application.ComponentCount - 1 do
  begin
     if (Application.Components[i] is TForm) then
        if ((Application.Components[i] as TForm).ClassType <> TFMain) and
           ((Application.Components[i] as TForm) <> nil) and
           ((Application.Components[i] as TForm).ClassType <> TFAyudaenLinea) and
           ((Application.Components[i] as TForm).ClassType <> TFFondo) and
           ((Application.Components[i] as TForm).Visible) then
           (Application.Components[i] as TForm).SetFocus;
  end;
end;

procedure TFMain.PonColorPCMain;
begin
  PCMain.TabActiveColor := CE_Color_Activo;
  PCMain.TabInActiveColor := clBtnFace;
end;

procedure TFMain.AWordExecute(Sender: TObject);
var
  Password : string;
  WordApp : variant;
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MySaveDialog(Archivo, 'DOC', '', 'WordExecute') then
  begin
     PassWord := 'g2k2plus';
     WordApp := CreateOleObject('Word.Application');
     WordApp.Visible := True;
     WordApp.Documents.Open(Archivo, , , , Password);
  end;
end;

procedure TFMain.AConfirmingExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMConfirming, FMConfirming, Sender);
end;

procedure TFMain.AAnticiposExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMAnticipos, FMAnticipos, Sender);
end;

procedure TFMain.AModelo300Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFpregModelo300, FpregModelo300, Sender);
end;

procedure TFMain.AModelo303Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo303, FPregModelo303, Sender);
end;

procedure TFMain.AModelo115Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo115, FPregModelo115, Sender);
end;

procedure TFMain.AModelo110Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo110, FPregModelo110, Sender);
end;

procedure TFMain.ARetEmpleadosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMEmpleados, FMEmpleados, Sender);
end;

procedure TFMain.AModelo330Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo330, FPregModelo330, Sender);
end;

procedure TFMain.ATalonesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTalones, FMTalones, Sender);
end;

procedure TFMain.ATalonesCtaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTalonesCta, FMTalonesCta, Sender);
end;

procedure TFMain.MuestraIVA(Filtro, Signo: string);
begin
  if (ARegIVA.Enabled) then
  begin
     ARegIVA.Execute;
     FMRegistroIVA.FiltraRegistro(Filtro, Signo);
  end;
end;

procedure TFMain.MuestraRecibos(Tipo, Serie: string; Factura: string; Ejercicio: integer);
begin
  AMuestraRecibos.Execute;
  FMRecibosFactura.Situar(Tipo, Serie, Factura, Ejercicio);
end;

procedure TFMain.MuestraCartera(Ejercicio, Canal: smallint; Signo: char; Registro: integer);
begin
  ACartera.Execute;
  FMCartera.FiltraRegistro(Ejercicio, Canal, Signo, Registro);
end;

procedure TFMain.MuestraCartera(IdCartera: integer);
var
  Signo : string;
begin
  if (IdCartera <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EJERCICIO, CANAL, SIGNO, REGISTRO FROM EMP_CARTERA WHERE ID_CARTERA = ?ID_CARTERA';
           Params.ByName['ID_CARTERA'].AsInteger := IdCartera;
           ExecQuery;
           Signo := FieldByName['SIGNO'].AsString;
           FMain.MuestraCartera(FieldByName['EJERCICIO'].AsInteger, FieldByName['CANAL'].AsInteger, Signo[1], FieldByName['REGISTRO'].AsInteger);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMain.MuestraIncidencia(Codigo, Incidencia: integer; Tipo: smallint);
begin
  AbreForm(TFMIncidencias, FMIncidencias);
  FMIncidencias.Muestra(Codigo, 0{Tercero}, Tipo, Incidencia, 0{Modo}, 0{Direccion});
end;

procedure TFMain.ALSTDepositosActivosExecute(Sender: TObject);
begin
  AbreForm(TFPregDepositosActivos, FPregDepositosActivos, Sender);
end;

procedure TFMain.ControlaBotonesDesplegables;
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
     if Components[i] is TToolButton then
        if Assigned((Components[i] as TToolButton).DropDownMenu) then
           HabilitaBotonAccion(Components[i] as TToolButton);
  end;
end;

procedure TFMain.HabilitaBotonAccion(Boton: TToolButton);
var
  Habilitar, Visible : boolean;
  i : integer;
  PopUp : TPopUpMenu;
begin
  PopUp := Boton.DropDownMenu;

  // Miramos si todas las acciones del desplegable del botón están habilitadas o no

  // Botón de condiciones
  Habilitar := False;
  Visible := False;
  for i := 0 to PopUp.Items.Count - 1 do
  begin
     if Assigned(PopUp.Items[i].Action) then
     begin
        if ((PopUp.Items[i].Action as TCustomAction).Enabled) then
           Habilitar := True;

        if ((PopUp.Items[i].Action as TCustomAction).Visible) then
           Visible := True;
     end;
  end;

  if (Habilitar = False) then
     Boton.Enabled := False
  else
     Boton.Enabled := True;

  if (Visible = False) then
     Boton.Visible := False
  else
     Boton.Visible := True;
end;

procedure TFMain.ALSTFichaMargendeProductosExecute(Sender: TObject);
begin
  AbreForm(TFPregMargenProductos, FPregMargenProductos, Sender);
end;

procedure TFMain.MuestraMovConta(Filtro: string; Canal: string = '');
begin
  if (AContaMovimientos.Enabled) then
  begin
     AContaMovimientos.Execute;
     FMMovConta.FiltraMovimientos(Filtro, Canal);
  end;
end;

procedure TFMain.TButtHaciendaClick(Sender: TObject);
begin
  AModelo110.Execute;
end;

procedure TFMain.TButtTalonesClick(Sender: TObject);
begin
  ATalones.Execute;
end;

procedure TFMain.AContaDefBalancesCABExecute(Sender: TObject);
begin
  AbreForm(TFMBalancesCab, FMBalancesCAB, Sender);
end;

procedure TFMain.ACierraFacExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCierraDocCompras, FMCierraDocCompras, Sender);
end;

procedure TFMain.AMuestraRecibosExecute(Sender: TObject);
begin
  AbreForm(TFMRecibosFactura, FMRecibosFactura, Sender);
end;

procedure TFMain.ATraspasoExecute(Sender: TObject);
begin
  AbreForm(TFMTraspasoPeriodos, FMTraspasoPeriodos, Sender);
end;

procedure TFMain.ALSTUnidadesPendientesExecute(Sender: TObject);
begin
  AbreForm(TFPregUnidadesPendientes, FPregUnidadesPendientes, Sender);
end;

procedure TFMain.CreaAyudaenLinea;
begin
  // Creamos la ventana de ayuda en linea

  FAyudaenLinea := TFAyudaenLinea.Create(Self);
  with FAyudaenLinea do
  begin
     Left := 0;
     Top := 48 + PCMain.Height;
     Width := 200;
     Height := AltoAyuda - Top - 10;
  end;

  AyudaEnLinea := True;
end;

procedure TFMain.AModelo190Execute(Sender: TObject);
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  DMRModeloshacienda.Previsualizar190(REntorno.Ejercicio, 0);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.AExporta190Execute(Sender: TObject);
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  DMRModeloshacienda.FormatoModelo190;
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.ACierraTodasExecute(Sender: TObject);
begin
  CierraForms;
end;

procedure TFMain.AHistoricoPMPExecute(Sender: TObject);
begin
  AbreForm(TFMHistoricoPrecios, FMHistoricoPrecios, Sender);
end;

procedure TFMain.APonderarDocsExecute(Sender: TObject);
begin
  AbreForm(TFMPonderarDocs, FMPonderarDocs, Sender);
end;

procedure TFMain.AMonedasCuentaExecute(Sender: TObject);
begin
  AbreForm(TFMMonedaCuenta, FMMonedaCuenta, Sender);
end;

procedure TFMain.AAgrupacionFacExecute(Sender: TObject);
begin
  AbreForm(TFMAgrupacionFac, FMAgrupacionFac, Sender);
end;

procedure TFMain.ACorreoEmpresaExecute(Sender: TObject);
begin
  AbreForm(TFMCorreo, FMCorreo, Sender);
end;

procedure TFMain.AEmpCanalesExecute(Sender: TObject);
begin
  AbreForm(TFMEmpCanales, FMEmpCanales, Sender);
end;

procedure TFMain.AClasesDireccionesExecute(Sender: TObject);
begin
  AbreForm(TFMClaseDir, FMClaseDir, Sender);
end;

procedure TFMain.ADuplicaEscandalloExecute(Sender: TObject);
begin
  // AbreForm (TFMDupArtEscandallo, FMDupArtEscandallo, Sender);
end;

procedure TFMain.APagaresExecute(Sender: TObject);
begin
  AbreForm(TFMPagares, FMPagares, Sender);
end;

procedure TFMain.MuestraDocumento(Ejercicio: integer; Tipo, Serie: string; Rig: integer);
begin
  // Demasiados ifs pero ...
  if Tipo = 'FAC' then
  begin
     EjecutaAccion(AFacturas);
     FMFacturas.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'FAP' then
  begin
     EjecutaAccion(AFacturasProv);
     FMFacturasAProveedor.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'FCR' then
  begin
     EjecutaAccion(AFacturasAcr);
     FMFacturasAAcr.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'OFC' then
  begin
     EjecutaAccion(AOfertas);
     FMOfertas.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'PEC' then
  begin
     EjecutaAccion(APedidos);
     FMPedidos.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'ALB' then
  begin
     EjecutaAccion(AAlbaranes);
     FMAlbaranes.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'PEP' then
  begin
     EjecutaAccion(APedidosProv);
     FMPedidosAProveedor.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'ALP' then
  begin
     EjecutaAccion(AAlbaranesProv);
     FMAlbaranesAProveedor.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if ((Tipo = 'MVE') or (Tipo = 'MVS') or (Tipo = 'MVT')) then
  begin
     EjecutaAccion(AMvStMan);
     FMMovManStock.FiltraMovimiento(REntorno.Empresa, Ejercicio, Rig, Serie);
  end
  else
  if ((Tipo = 'RGE') or (Tipo = 'RGS')) then
  begin
     EjecutaAccion(ARegStocks);
     FMRegInventario.FiltraInventario(REntorno.Empresa, Ejercicio, Rig, Serie);
  end
  else
  if Tipo = 'OFP' then
  begin
     EjecutaAccion(APropuestas);
     FMPropuestas.FiltraFactura(Ejercicio, Serie, Rig);
  end
  else
  if Tipo = 'OCP' then
  begin
     EjecutaAccion(APropuestasConfirm);
     FMPropuestasConfirm.FiltraFactura(Ejercicio, Serie, Rig);
  end;
end;

procedure TFMain.AConfINIExecute(Sender: TObject);
begin
  AbreForm(TFMConfINI, FMConfINI, Sender);
end;

procedure TFMain.ARepUsuarioAlmExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Almacenes');
end;

procedure TFMain.ArepUsuarioComprasExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Compras');
end;

procedure TFMain.ARepUsuarioContaExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Contabilidad');
end;

procedure TFMain.ARepUsuariosVentasExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Ventas');
end;

procedure TFMain.ARepUsuariosTercerosExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Terceros');
end;

procedure TFMain.ATipoAsientoExecute(Sender: TObject);
begin
  AbreForm(TFMTipoAsiento, FMTipoAsiento, Sender);
end;

procedure TFMain.AContRecuperacionExecute(Sender: TObject);
begin
  AbreForm(TFMContRec, FMContRec, Sender);
end;

procedure TFMain.ATiposCalculoExecute(Sender: TObject);
begin
  AbreForm(TFMTiposCalculo, FMTiposCalculo, Sender);
end;

procedure TFMain.ACondicionesEspecialesExecute(Sender: TObject);
begin
  AbreForm(TFMCondicionesEspeciales, FMCondicionesEspeciales, Sender);
end;

procedure TFMain.AIncrementoPorcentualExecute(Sender: TObject);
begin
  // AbreForm(TFMIncPorcDeTarifas, FMIncPorcDeTarifas);
end;

procedure TFMain.AMonedasMaestrosExecute(Sender: TObject);
begin
  AbreForm(TFMMonedasMaestros, FMMonedasMaestros, Sender);
end;

procedure TFMain.ARepUsuarioTesoreriaExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Tesoreria');
end;

procedure TFMain.ARepUsuarioProduccionExecute(Sender: TObject);
begin
  AbreForm(TFMReportesReportSmith, FMReportesReportSmith, Sender);
  FMReportesReportSmith.EstablecerTipo('Produccion');
end;

procedure TFMain.AImprimeAlbaranesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMImprimeAlbaranes, FMImprimeAlbaranes, Sender);
end;

procedure TFMain.ACamMonCarteraExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMCambiaMonCartera, FMCambiaMonCartera, Sender);
end;

procedure TFMain.ALSTLotesExecute(Sender: TObject);
begin
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.Filtratipo('I'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMain.ALSTLotesComprasExecute(Sender: TObject);
begin
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.Filtratipo('C'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMain.ALSTLotesVentasExecute(Sender: TObject);
begin
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.Filtratipo('V'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMain.ALSTLotesMovimientosExecute(Sender: TObject);
begin
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.FiltraTipo('M'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMain.AModelo347Execute(Sender: TObject);
begin
  AbreForm(TFPregModelo347, FPregModelo347, Sender);
end;

procedure TFMain.AConfModelo347Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRMayoresCantidad, DMRMayoresCantidad);
  TFMListConfig.Create(Self).Muestra(100, Formato, Cabecera, Copias,
     Pijama, '', DMRMayoresCantidad.frMayoresCantidad);
  CierraData(DMRMayoresCantidad);
end;

procedure TFMain.AConfModelo190Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  TFMListConfig.Create(Self).Muestra(131, Formato, Cabecera, Copias,
     Pijama, '', DMRModelosHacienda.frModelo190);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.AConfModelo110Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  TFMListConfig.Create(Self).Muestra(129, Formato, Cabecera, Copias,
     Pijama, '', DMRModelosHacienda.frModelo110);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.AConfModelo115Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  TFMListConfig.Create(Self).Muestra(130, Formato, Cabecera, Copias,
     Pijama, '', DMRModelosHacienda.frModelo115);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.AConfModelo300Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  TFMListConfig.Create(Self).Muestra(132, Formato, Cabecera, Copias,
     Pijama, '', DMRModelosHacienda.frModelo300);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.AConfModelo303Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  TFMListConfig.Create(Self).Muestra(5107, Formato, Cabecera, Copias,
     Pijama, '', DMRModelosHacienda.frModelo303);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.AConfModelo330Execute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  TFMListConfig.Create(Self).Muestra(133, Formato, Cabecera, Copias,
     Pijama, '', DMRModelosHacienda.frModelo330);
  CierraData(DMRModelosHacienda);
end;

procedure TFMain.APropagaStocksExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMPropagaStock, FMPropagaStock, Sender);
end;

procedure TFMain.AArtProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
     TFVerTercerosPorArticulo.Create(Self).AsignaArticulo('', 0);
end;

procedure TFMain.AArtCliExecute(Sender: TObject);
begin
  if EstructuraCreada then
     TFVerTercerosPorArticulo.Create(Self).AsignaArticulo('', 1);
end;

procedure TFMain.ALSTUnidPendRecibirExecute(Sender: TObject);
begin
  AbreForm(TFPregUnidPendRecibir, FPregUnidPendRecibir, Sender);
end;

procedure TFMain.AProcesosProdExecute(Sender: TObject);
begin
  AbreForm(TFMProdProduccion, FMProdProduccion, Sender);
end;

procedure TFMain.ATiposRedondeoExecute(Sender: TObject);
begin
  AbreForm(TFMTiposRedondeo, FMTiposRedondeo, Sender);
end;

procedure TFMain.APedidosVentaPendientesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregPedPdte, FPregPedPdte, Sender);
end;

procedure TFMain.APedidosCompraPendientesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregPedPdteProv, FPregPedPdteProv, Sender);
end;

procedure TFMain.MuestraAvisos;
begin
  if (DMMain.MostrarAvisos) then
     AbreForm(TFMUsuariosMensajes, FMUsuariosMensajes);
end;

procedure TFMain.AAvisosExecute(Sender: TObject);
begin
  AbreForm(TFMUsuariosMensajes, FMUsuariosMensajes, Sender);
end;

procedure TFMain.AImagenesExecute(Sender: TObject);
begin
  AbreForm(TFMImagenes, FMImagenes, Sender);
  if (FiltroAccion <> '') then
     FMImagenes.FiltraImagen(StrToInt(FiltroAccion));
  FiltroAccion := '';
end;

procedure TFMain.ARiesgoBancosExecute(Sender: TObject);
begin
  AbreForm(TFPregRiesgoBancos, FPregRiesgoBancos, Sender);
end;

procedure TFMain.ARiesgoClientesExecute(Sender: TObject);
begin
  AbreForm(TFPregRiesgoClientes, FPregRiesgoClientes, Sender);
end;

procedure TFMain.ImagenFondo;
var
  FondoVisible : boolean;
begin
  FondoVisible := FFondo.Visible;
  if FondoVisible then
     FFondo.Hide;
  DMMain.ImagenFondo;
  if FondoVisible then
     FFondo.Show;
  Self.RestauraVentanas;
end;

procedure TFMain.AIntrastatExecute(Sender: TObject);
begin
  AbreForm(TFMIntrastat, FMIntrastat, Sender);
end;

procedure TFMain.AIntrastatComprasExecute(Sender: TObject);
begin
  AbreForm(TFPregIntrastatCV, FPregIntrastatCV, Sender);
  FPregIntrastatCV.TipoCV(0); //Compras
end;

procedure TFMain.AIntrastatVentasExecute(Sender: TObject);
begin
  AbreForm(TFPregIntrastatCV, FPregIntrastatCV, Sender);
  FPregIntrastatCV.TipoCV(1); //Ventas
end;

procedure TFMain.ACierreStocksExecute(Sender: TObject);
begin
  AbreForm(TFMCierreStocks, FMCierreStocks, Sender);
end;

procedure TFMain.ARegStocksExecute(Sender: TObject);
begin
  AbreForm(TFMRegInventario, FMRegInventario, Sender);
end;

procedure TFMain.AConfIntrastatCVExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstIntrastatCV, DMLstIntrastatCV);
  TFMListConfig.Create(Self).Muestra(204, formato, cabecera, copias,
     pijama, '', DMLstIntrastatCV.frIntrastatCV);
  CierraData(DMLstIntrastatCV);
end;

procedure TFMain.AExporta349Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo349, FPregModelo349, Sender);
end;

procedure TFMain.MuestraMovimiento(Empresa, Ejercicio, Rig: integer; Serie: string);
begin
  EjecutaAccion(AMvSTMan);
  FMMovManStock.FiltraMovimiento(Empresa, Ejercicio, Rig, Serie);
end;

procedure TFMain.ALotesExecute(Sender: TObject);
begin
  AbreForm(TFMControl_Lotes, FMControl_Lotes, Sender);
  FMControl_Lotes.FiltraLote(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.APedFueraPlazoExecute(Sender: TObject);
begin
  AbreForm(TFPregLstPendFueraPlazo, FPregLstPendFueraPlazo, Sender);
end;

procedure TFMain.AConsultaNroSerieKriExecute(Sender: TObject);
begin
  AbreForm(TFMConsultaNroSerieKri, FMConsultaNroSerieKri, Sender);
end;

procedure TFMain.AMantenimientoNroSerieExecute(Sender: TObject);
begin
  AbreForm(TFMMantenimientoNroSerie, FMMantenimientoNroSerie, Sender);
end;

procedure TFMain.AImprimirEtiquetasKriExecute(Sender: TObject);
begin
  TFPregEtiAlbaran.Create(Self).Muestra(0, Now, 'ALM', REntorno.Ejercicio, 0, '');
end;

procedure TFMain.AProrrateoCostesExecute(Sender: TObject);
begin
  AbreForm(TFMProrrateoCostes, FMProrrateoCostes, Sender);
end;

{
procedure TFMain.MIRiesgosBancosClick(Sender: TObject);
begin
  TFPregRiesgoBancos.Create(Self).ShowModal;
end;

procedure TFMain.MIRiesgosClientesClick(Sender: TObject);
begin
  TFPregRiesgoClientes.Create(Self).ShowModal;
end;
}
procedure TFMain.AColoresTallasExecute(Sender: TObject);
begin
  AbreForm(TFMColoresTallas, FMColoresTallas, Sender);
end;

procedure TFMain.AGruposTallasExecute(Sender: TObject);
begin
  AbreForm(TFMGruposTallas, FMGruposTallas, Sender);
end;

procedure TFMain.AModelosTallasExecute(Sender: TObject);
begin
  AbreForm(TFMModelosTallas, FMModelosTallas, Sender);
  FMModelosTallas.FiltraModelo(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ALSTStockTallasExecute(Sender: TObject);
begin
  AbreForm(TFPregStockResTallas, FPregStockResTallas, Sender);
end;

procedure TFMain.AFacAlbaranesCliDetExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMFacturacionAlbCliDet, FMFacturacionAlbCliDet, Sender);
end;

procedure TFMain.ALSTGeneraTmpInventarioKriExecute(Sender: TObject);
begin
  AbreForm(TFMGeneraInventario, FMGeneraInventario, Sender);
end;

procedure TFMain.AAsignaBancoRemesaExecute(Sender: TObject);
begin
  AbreForm(TFMAsignaBancoRemesa, FMAsignaBancoRemesa, Sender);
end;

procedure TFMain.ATransmisionesPatrimonialesExecute(Sender: TObject);
begin
  // AbreForm(TFMTransmisionesPatrimoniales, FMTransmisionesPatrimoniales);
end;

procedure TFMain.ASumasYSaldosKriExecute(Sender: TObject);
begin
  AbreForm(TFMSumasYSaldosKri, FMSumasYSaldosKri, Sender);
end;

procedure TFMain.AOrdenProduccionTallasKriExecute(Sender: TObject);
begin
  AbreForm(TFMOrdenProduccionTallas, FMOrdenProduccionTallas, Sender);
end;

procedure TFMain.AEDIExecute(Sender: TObject);
begin
  AbreForm(TFMEDI, FMEDI, Sender);
end;

procedure TFMain.AAgrupacionDeAlbaranesKriExecute(Sender: TObject);
begin
  // Agrupacion de albaranes Mirko Bender
  AbreForm(TFMAgrupacionDeAlbaranesKri, FMAgrupacionDeAlbaranesKri, Sender);
end;

procedure TFMain.ACentroDeCostosExecute(Sender: TObject);
begin
  AbreForm(TFMCentroCoste, FMCentroCoste, Sender);
end;

procedure TFMain.ALSTEstadisticasArtExecute(Sender: TObject);
begin
  AbreForm(TFPregLstEstadisticasVentas, FPregLstEstadisticasVentas, Sender);
end;

procedure TFMain.ACondicionesVentaExecute(Sender: TObject);
begin
  AbreForm(TFMCondicionesVenta, FMCondicionesVenta, Sender);
end;

procedure TFMain.AAsistenteEmpresaExecute(Sender: TObject);
begin
  FMAsistenteEmpresa := TFMAsistenteEmpresa.Create(Self);
  FMAsistenteEmpresa.ShowModal;
  FMAsistenteEmpresa.Free;
  FMAsistenteEmpresa := nil;
end;

procedure TFMain.AAsistenteEjercicioExecute(Sender: TObject);
begin
  FMAsistenteEjercicio := TFMAsistenteEjercicio.Create(Self);
  FMAsistenteEjercicio.ShowModal;
  FMAsistenteEjercicio.Free;
  FMAsistenteEjercicio := nil;
end;

procedure TFMain.ACondicionesCompraExecute(Sender: TObject);
begin
  AbreForm(TFMCondicionesCompra, FMCondicionesCompra, Sender);
end;

procedure TFMain.AMatriculasExecute(Sender: TObject);
begin
  AbreForm(TFMMatriculas, FMMatriculas, Sender);
end;

procedure TFMain.ANaturalezaMatExecute(Sender: TObject);
begin
  AbreForm(TFMNaturalezaMat, FMNaturalezaMat, Sender);
end;

procedure TFMain.APedFueraPlazoVentasExecute(Sender: TObject);
begin
  AbreForm(TFPregLstPendFueraPlazoVentas, FPregLstPendFueraPlazoVentas, Sender);
end;

procedure TFMain.AParamApuntesExecute(Sender: TObject);
begin
  AbreForm(TFMParamApuntes, FMParamApuntes, Sender);
end;

procedure TFMain.AConfigTextosExecute(Sender: TObject);
begin
  AbreForm(TFMGruposTextos, FMGruposTextos, Sender);
end;

procedure TFMain.AFacCuotasExecute(Sender: TObject);
begin
  AbreForm(TFMFacturacionCuotasCli, FMFacturacionCuotasCli, Sender);
end;

procedure TFMain.AAlmacenesCallesExecute(Sender: TObject);
begin
  AbreForm(TFMCalles, FMCalles, Sender);
end;

procedure TFMain.AAlmacenesEstanteriasExecute(Sender: TObject);
begin
  AbreForm(TFMEstanterias, FMEstanterias, Sender);
end;

procedure TFMain.AAlmacenesRepisasExecute(Sender: TObject);
begin
  AbreForm(TFMRepisas, FMRepisas, Sender);
end;

procedure TFMain.AAlmacenesPosicionExecute(Sender: TObject);
begin
  AbreForm(TFMPosiciones, FMPosiciones, Sender);
end;

procedure TFMain.AEnvioRepartoExecute(Sender: TObject);
begin
  AbreForm(TFMEnvio, FMEnvio, Sender);
end;

procedure TFMain.AConfigAlmcenExecute(Sender: TObject);
begin
  AbreForm(TFMConfiguraAlmacen, FMConfiguraAlmacen, Sender);
  FMConfiguraAlmacen.AbreConfigAlmacenes;
end;

procedure TFMain.AIncidenciasExecute(Sender: TObject);
begin
  AbreForm(TFMIncidencias, FMIncidencias, Sender);
  FMIncidencias.Muestra(0, 0, 0, 0, 0);
end;

procedure TFMain.AMovEntreUbicacionesExecute(Sender: TObject);
begin
  AbreForm(TFMMovEntreUbicaciones, FMMovEntreUbicaciones, Sender);
end;

procedure TFMain.ALstStockPorUbicacionExecute(Sender: TObject);
begin
  AbreForm(TFPregStockUbicacion, FPregStockUbicacion, Sender);
end;

procedure TFMain.ALstMovEntreUbicacionesExecute(Sender: TObject);
begin
  AbreForm(TFPregMovEntreUbicaciones, FPregMovEntreUbicaciones, Sender);
end;

procedure TFMain.AFacturasDirectasExecute(Sender: TObject);
begin
  // if EstructuraCreada then
  //    AbreForm(TFMFacturasIva, FMFacturasIva, Sender);
end;

procedure TFMain.ALstCentroCosteExecute(Sender: TObject);
begin
  AbreForm(TFPregCentrosCoste, FPregCentrosCoste, Sender);
end;

procedure TFMain.ACaravanasExecute(Sender: TObject);
begin
  AbreForm(TFMCaravanas, FMCaravanas, Sender);
end;

procedure TFMain.AMRPExecute(Sender: TObject);
begin
  {No hacer nada}
end;

procedure TFMain.ATipoPortesExecute(Sender: TObject);
begin
  AbreForm(TFMPortes, FMPortes, Sender);
end;

procedure TFMain.ARangosPortesExecute(Sender: TObject);
begin
  AbreForm(TFMRangosPortes, FMRangosPortes, Sender);
end;

procedure TFMain.APromocionesVentaExecute(Sender: TObject);
begin
  AbreForm(TFMPromocionesVenta, FMPromocionesVenta, Sender);
end;

procedure TFMain.APromocionesIndirectasExecute(Sender: TObject);
begin
  AbreForm(TFMPromoIndirectas, FMPromoIndirectas, Sender);
end;

procedure TFMain.AOrdenPromocionExecute(Sender: TObject);
begin
  AbreForm(TFMOrdenesPromociones, FMordenesPromociones, Sender);
end;

procedure TFMain.ATrazabilidadLotesExecute(Sender: TObject);
begin
  TFPregTrazabilidadLotes.Create(Self).ShowModal;
end;

procedure TFMain.AAsistenteTarifaExecute(Sender: TObject);
begin
  FMAsistenteImpTarifas := TFMAsistenteImpTarifas.Create(Self);
  try
     FMAsistenteImpTarifas.ShowModal;
  finally
     FMAsistenteImpTarifas.Free;
     FMAsistenteImpTarifas := nil;
  end;
end;

procedure TFMain.AArtBultosExecute(Sender: TObject);
begin
  AbreForm(TFMArtBultos, FMArtBultos, Sender);
end;

procedure TFMain.APedidosPendientesExecute(Sender: TObject);
begin
  APedidosExecute(Sender);
  // AbreForm(TFMPedidos, FMPedidos, Sender);
  FMPedidos.FiltraDocumento(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AAlbaranesPendientesExecute(Sender: TObject);
begin
  // AbreForm(TFMAlbaranes, FMAlbaranes, Sender);
  AAlbaranesExecute(Sender);
  FMAlbaranes.FiltraDocumento(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AFiltroFacturasExecute(Sender: TObject);
begin
  // AbreForm(TFMFacturas, FMFacturas, Sender);
  AFacturasExecute(Sender);
  FMFacturas.FiltraDocumento(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.APedidosPendientesProvExecute(Sender: TObject);
begin
  // AbreForm(TFMPedidosAProveedor, FMPedidosAProveedor, Sender);
  APedidosProvExecute(Sender);
  FMPedidosAProveedor.FiltraPendiente(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AAlbaranesPendientesProvExecute(Sender: TObject);
begin
  // AbreForm(TFMAlbaranesAProveedor, FMAlbaranesAProveedor, Sender);
  AAlbaranesProvExecute(Sender);
  FMAlbaranesAProveedor.FiltraPendiente(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AFiltroFacturasProvExecute(Sender: TObject);
begin
  // AbreForm(TFMFacturasAProveedor, FMFacturasAProveedor, Sender);
  AFacturasProvExecute(Sender);
  FMFacturasAProveedor.FiltraFact(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AFiltroFacturasAcrExecute(Sender: TObject);
begin
  // AbreForm(TFMFacturasAAcr, FMFacturasAAcr, Sender);
  AFacturasAcrExecute(Sender);
  FMFacturasAAcr.FiltraFact(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AUsuariosWebExecute(Sender: TObject);
begin
  AbreForm(TFMUsuariosWeb, FMUsuariosWeb, Sender);
  FMUsuariosWeb.PosicionaUsuario(StrToIntDef(FiltroAccion, 0));
  FiltroAccion := '';
end;

procedure TFMain.AHistoricoProcesosProvExecute(Sender: TObject);
begin
  AbreForm(TFCGestProcesosProv, FCGestProcesosProv, Sender);
end;

procedure TFMain.AAnaPlanesContablesExecute(Sender: TObject);
begin
  AbreForm(TFMPlanesContables, FMPlanesContables, Sender);
end;

procedure TFMain.AAnaCentrosCosteExecute(Sender: TObject);
begin
  AbreForm(TFMCentrosCoste, FMCentrosCoste, Sender);
end;

procedure TFMain.AAnaPlantillasImputacionExecute(Sender: TObject);
begin
  AbreForm(TFMPlantillasImputacion, FMPlantillasImputacion, Sender);
end;

procedure TFMain.AAnaImputacionesCostesExecute(Sender: TObject);
begin
  AbreForm(TFMImputacionCostes, FMImputacionCostes, Sender);
end;

procedure TFMain.AAnaExtractoExecute(Sender: TObject);
begin
  AbreForm(TFCAnaMayor, FCAnaMayor, Sender);
end;

procedure TFMain.AAnaSumaYSaldosExecute(Sender: TObject);
begin
  AbreForm(TFPregAnaSumasYSaldos, FPregAnaSumasYSaldos, Sender);
end;

procedure TFMain.AAnaAnalisisPresupuestoExecute(Sender: TObject);
begin
  AbreForm(TFPregAnaPresupuesto, FPregAnaPresupuesto, Sender);
end;

procedure TFMain.AAnaPropagaEstructurasExecute(Sender: TObject);
begin
  AbreForm(TFMPropagaEstructura, FMPropagaEstructura, Sender);
end;

procedure TFMain.AAnaLstPlanContableAnaliticoExecute(Sender: TObject);
begin
  AbreForm(TFPregAnaPlan, FPregAnaPlan, Sender);
end;

procedure TFMain.AUsuarioCambiaClaveExecute(Sender: TObject);
begin
  TFMUsuarioCuenta.Create(Self).MuestraUsuario(REntorno.Usuario, 0);
end;

procedure TFMain.AExportarAsientosExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteExpAsientos, FMAsistenteExpAsientos, Sender);
end;

procedure TFMain.AImportarAsientosExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteImpAsientos, FMAsistenteImpAsientos, Sender);
end;

procedure TFMain.AExportarSaldosExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteExpSaldos, FMAsistenteExpSaldos, Sender);
end;

procedure TFMain.ADivisionesMaestrosExecute(Sender: TObject);
begin
  AbreForm(TFMDivisionesMaestro, FMDivisionesMaestro, Sender);
end;

procedure TFMain.AParamModelosHaciendaExecute(Sender: TObject);
begin
  AbreForm(TFMParamModelosHacienda, FMParamModelosHacienda, Sender);
end;

procedure TFMain.APresentacionesHaciendaExecute(Sender: TObject);
begin
  AbreForm(TFMPresentacionesHacienda, FMPresentacionesHacienda, Sender);
end;

procedure TFMain.AOrdenesDePagoExecute(Sender: TObject);
begin
  AbreForm(TFMOrdenesDePago, FMOrdenesDePago, Sender);
end;

procedure TFMain.ANorma43SLuciaExecute(Sender: TObject);
begin
  AbreForm(TFMImportacionNorma43SLucia, FMImportacionNorma43SLucia, Sender);
end;

procedure TFMain.ACRMExecute(Sender: TObject);
begin
  AbreForm(TFMCRM, FMCRM, Sender);
end;

procedure TFMain.ASincronizarBasesKriExecute(Sender: TObject);
begin
  AbreData(TDMSincronizacionKri, DMSincronizacionKri);
  DMSincronizacionKri.SincronizaBases;
  CierraData(DMSincronizacionKri);
end;

procedure TFMain.ANorma43KriExecute(Sender: TObject);
begin
  AbreForm(TFMImportacionNorma43Kri, FMImportacionNorma43Kri, Sender);
end;

procedure TFMain.AContaRectAsientosExecute(Sender: TObject);
begin
  AbreForm(TFMRectificacionAsientos, FMRectificacionAsientos, Sender);
end;

procedure TFMain.AConfAlmacenesExecute(Sender: TObject);
begin
  AbreForm(TFMEmpresasStock, FMEmpresasStock, Sender);
end;

procedure TFMain.AClientesPotencialesKriExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     AbreForm(TFMClientesPotencialesKri, FMClientesPotencialesKri, Sender);
     FMClientesPotencialesKri.FiltraCliente(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.APreciosCosteKriExecute(Sender: TObject);
begin
  AbreForm(TFMPreciosCosteKri, FMPreciosCosteKri, Sender);
end;

procedure TFMain.AEquivalenciasExecute(Sender: TObject);
begin
  AbreForm(TFMPGCEquivalencias, FMPGCEquivalencias, Sender);
end;

procedure TFMain.AModificaPGCExecute(Sender: TObject);
begin
  AbreForm(TFMModificaPGC, FMModificaPGC, Sender);
end;

procedure TFMain.AGestionsExecute(Sender: TObject);
begin
  AbreForm(TFMSysGestiones, FMSysGestiones, Sender);
end;

procedure TFMain.ATipoLineaVentaExecute(Sender: TObject);
begin
  AbreForm(TFMTipoLineaVentaKri, FMTipoLineaVentaKri, Sender);
end;

procedure TFMain.APedidoEntreAlmacenesExecute(Sender: TObject);
begin
  AbreForm(TFMPedidosEntreAlmacenes, FMPedidosEntreAlmacenes, Sender); {dji lrk kri}
end;

procedure TFMain.TraspasoDeDocumentosSalida(id_s: integer);
var
  Ejercicio, Canal, Rig : integer;
  Tipo, Serie : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT EJERCICIO, CANAL, TIPO, SERIE, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Tipo := FieldByName['TIPO'].AsString;
        Serie := FieldByName['SERIE'].AsString;
        Rig := FieldByName['RIG'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Canal = REntorno.Canal) then
     MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
end;

procedure TFMain.TraspasoDeDocumentosEntrada(id_e: integer);
var
  Ejercicio, Canal, Rig : integer;
  Tipo, Serie : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT EJERCICIO, CANAL, TIPO, SERIE, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_E';
        Params.ByName['ID_E'].AsInteger := id_e;
        ExecQuery;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Tipo := FieldByName['TIPO'].AsString;
        Serie := FieldByName['SERIE'].AsString;
        Rig := FieldByName['RIG'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Canal = REntorno.Canal) then
     MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
end;

procedure TFMain.TraspasoDeDocumentosMovimiento(id_st: integer);
var
  Ejercicio, Rig : integer;
  Tipo, Serie : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_OPERACION, EJERCICIO, SERIE, RIG FROM GES_CABECERAS_ST WHERE ID_ST = :ID_ST';
        Params.ByName['ID_ST'].AsInteger := id_st;
        ExecQuery;
        Tipo := 'MV' + FieldByName['TIPO_OPERACION'].AsString;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        Rig := FieldByName['RIG'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
end;

procedure TFMain.PoneTituloAplicacion;
var
  Titulo : string;
  Mayor, Minor, Release, Build : word;
begin
  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto);
  // Version - Mayor: año; Minor: version
  GetBuildInfo(REntorno.RutaEXE + REntorno.FicheroExe, Mayor, Minor, Release, Build);

  Titulo := '';
  if (DMMain.Version_Demo) then
     Titulo := _('VERSION DEMO');
  if (NombreProducto <> 'UNK') then
     Titulo := Titulo + NombreProducto;
  if (REntorno.Empresa <> 0) then
     Titulo := Titulo + ': ' + REntorno.EmpresaStr + ' - ' + REntorno.NombreEmpresa;
  Titulo := Titulo + '(';
  if (REntorno.Ejercicio <> 0) then
     Titulo := Titulo + REntorno.EjercicioStr;
  if (REntorno.Canal <> 0) then
     Titulo := Titulo + '-' + REntorno.CanalStr;
  Titulo := Titulo + ')';
  Titulo := Titulo + ' - [' + ExtractFileName(DMMain.DataBase.DBName) + ' - ' + VersionBaseDeDatos + ']';
  Titulo := Titulo + format(' - (Ver. %d.%d.%d.%d)', [Mayor, Minor, Release, Build]);
  Caption := Titulo;
end;

procedure TFMain.CambiaEjercicioYCanal(Ejercicio, Canal: integer);
var
  EjercicioAnt, canalAnt : smallint;
begin
  EjercicioAnt := REntorno.Ejercicio;
  REntorno.Ejercicio := Ejercicio;
  canalAnt := REntorno.Canal;
  REntorno.Canal := Canal;

  if not DMMain.CompruebaRestriccionUsuario then
  begin
     REntorno.Canal := canalAnt;
     REntorno.Ejercicio := EjercicioAnt;
     ShowMessage(_('No tiene permisos de entrada en el ejercicio o canal'));
     Exit;
  end;

  ConstruyeBotonMultiEjercicio;
  CambiaColorFondo;
  PoneTituloAplicacion;

  DMMain.ActualizaUsuario;
  DMMain.EstableceIdiomaCanal;
end;

procedure TFMain.ACambioEmpresaEjerCanalExecute(Sender: TObject);
var
  Dentro : boolean;
begin
  Dentro := False;
  CierraForms;
  while (not Dentro) do
  begin
     SeleccionaEmpEjerCanal;
     Dentro := DMMain.CompruebaRestriccionUsuario;
  end;

  LimitaMenu;
  MuestraFecha;
  CambiaTextoInferior(Sender);
  CambiaColorFondo;
end;

procedure TFMain.ConstruyeBotonMultiEjercicio;
var
  Item : TMenuItem;
  Ejercicio : integer;
begin
  PopUpMultiCambioEjercicio.Items.Clear;

  Item := TMenuItem.Create(PopUpMultiCambioEjercicio{nil});
  Item.Action := ACambiaUser;
  Item.Caption := _('&Cambiar Usuario');
  Item.ImageIndex := 12;
  Item.Name := 'CambiarUsuario1';
  Item.Hint := _('Cambiar de Usuario');

  PopUpMultiCambioEjercicio.Items.Add(Item);
  Item := TMenuItem.Create(PopUpMultiCambioEjercicio{nil});
  Item.Action := ACambioEmpresaEjerCanal;
  Item.ImageIndex := 17;
  Item.Caption := _('&Cambia Emp/Ejer/Can');
  Item.Hint := _('Cambiar de Empresa-Ejercicio-Canal');
  PopUpMultiCambioEjercicio.Items.Add(Item);

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT EJERCICIO FROM EMP_CANALES WHERE EMPRESA = ?EMPRESA AND CANAL = ?CANAL ORDER BY EJERCICIO DESC';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Open;
           First;
           while not EOF do
           begin
              Ejercicio := FieldByName('EJERCICIO').AsInteger;
              Item := TMenuItem.Create(PopUpMultiCambioEjercicio{nil});
              Item.OnClick := CambioRapidoEjercicio;
              Item.Caption := Format(_('Ejercicio %d'), [Ejercicio]);
              Item.ImageIndex := 9;
              Item.Tag := Ejercicio;
              Item.Hint := Format(_('Ir al Ejercicio %d'), [Ejercicio]);
              PopUpMultiCambioEjercicio.Items.Add(Item);
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
  TButtMultiCambio.Style := tbsDropDown;
end;

procedure TFMain.CambioRapidoEjercicio(Sender: TObject);
var
  EjercicioAnt : integer;
  Apertura, Cierre : TDateTime;
begin
  EjercicioAnt := REntorno.Ejercicio;
  REntorno.Ejercicio := TMenuItem(Sender).Tag;
  CierraForms;
  if not DMMain.CompruebaRestriccionUsuario then
  begin
     REntorno.Ejercicio := EjercicioAnt;
     ShowMessage(_('No tiene permisos de entrada en el ejercicio'));
     Exit;
  end;

  // Cambio de fecha de trabajo.
  // Obtengo fecha de Apertura y Cierre del ejercicio al que cambio
  DameMinMax('EJE', Apertura, Cierre);

  // Si la fecha actual no esta entre APERTURA y CIERRE, tomo la fecha CIERRE.
  if ((Apertura <= Today) and (Cierre >= Today)) then
     REntorno.FechaTrab := Now
  else
  if (Cierre >= Today) then
     REntorno.FechaTrab := Apertura
  else
     REntorno.FechaTrab := Cierre;

  DMMain.ActualizaUsuario;
  REntorno.PGC := DamePGC(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal);

  DMMain.AsignaEntornoBusqueda;
  MuestraFecha;

  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto, True);
  PoneTituloAplicacion;
  CambiaTextoInferior(Sender);
  CambiaColorFondo;
end;

procedure TFMain.ACambiarCanalExecute(Sender: TObject);
var
  CanalAnt : integer;
begin
  CanalAnt := REntorno.Canal;
  if (REntorno.Canal = 1) then
     REntorno.Canal := 2
  else
     REntorno.Canal := 1;

  CierraForms;
  if not DMMain.CompruebaRestriccionUsuario then
  begin
     REntorno.Canal := CanalAnt;
     ShowMessage(_('No tiene permisos de entrada en el canal'));
     Exit;
  end;

  DMMain.ActualizaUsuario;
  REntorno.PGC := DamePGC(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal);

  DMMain.AsignaEntornoBusqueda;
  MuestraFecha;

  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto, True);
  PoneTituloAplicacion;
  CambiaTextoInferior(Sender);
  CambiaColorFondo;
end;

procedure TFMain.ATraspasoPedCliAPedProvExecute(Sender: TObject);
begin
  AbreForm(TFMTraspasoPedCliAPedPro, FMTraspasoPedCliAPedPro, Sender); {dji lrk kri}
end;

procedure TFMain.CambiaTextoInferior(Sender: TObject);
var
  Titulo : string;
begin
  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto);

  Titulo := '';
  if (DMMain.Version_Demo) then
     Titulo := _('VERSION DEMO');
  if (NombreProducto <> 'UNK') then
     Titulo := Titulo + NombreProducto;
  if (REntorno.Empresa <> 0) then
     Titulo := Titulo + REntorno.EmpresaStr;
  if (REntorno.Ejercicio <> 0) then
     Titulo := Titulo + '/' + REntorno.EjercicioStr;
  if (REntorno.Canal <> 0) then
     Titulo := Titulo + '/' + REntorno.CanalStr;

  Application.Title := Titulo;
end;

function TFMain.EsBisiesto(ADay, AYear, AMonth: integer): integer;
begin
  if ((AMonth = 2) and (ADay = 29)) then
     if not ((AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0))) then
        ADay := 28;
  Result := ADay;
end;

procedure TFMain.ARecepcionWebExecute(Sender: TObject);
begin
  AbreForm(TFMRecepcionAlbaranes, FMRecepcionAlbaranes, Sender);
end;

function TFMain.DameTexto(Campo: TBlobField): string; {dji lrk kri}
var
  MS : TMemoryStream;
  RichEdit : TRichEdit;
begin
  RichEdit := TRichEdit.Create(Self);
  MS := TMemoryStream.Create;
  try
     RichEdit.Parent := Self;
     RichEdit.Visible := False;
     Campo.SaveToStream(MS);
     MS.Position := 0;
     RichEdit.Lines.LoadFromStream(MS);
     Result := RichEdit.Lines.Text;
  finally
     MS.Free;
     RichEdit.Free;
  end;
end;

procedure TFMain.ATipoIncidenciaKriExecute(Sender: TObject);
begin
  AbreForm(TFMTipoIncidenciaKri, FMTipoIncidenciaKri, Sender);
end;

procedure TFMain.AAlarmasIberfluidKriExecute(Sender: TObject);
begin
  AbreForm(TFMAlarmasIberfluidKri, FMAlarmasIberfluidKri, Sender);
end;

procedure TFMain.AProcesosKriExecute(Sender: TObject);
begin
  AbreForm(TFMProcesosKri, FMProcesosKri, Sender);
end;

procedure TFMain.AIdiomasKriExecute(Sender: TObject);
begin
  AbreForm(TFMIdiomasKri, FMIdiomasKri, Sender);
end;

procedure TFMain.AModelo340Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo340, FPregModelo340, Sender);
end;

procedure TFMain.AImportarDocumentosExecute(Sender: TObject);
begin
  AbreForm(TFMImportarDocumentos, FMImportarDocumentos, Sender);
  if (FiltroAccion = 'sinc') then
     FMImportarDocumentos.SincronizarcionAutomatica('Sellforge');
  FiltroAccion := '';
end;

procedure TFMain.AZonasExecute(Sender: TObject);
begin
  AbreForm(TFMZonas, FMZonas, Sender);
end;

procedure TFMain.APersonalUlisesExecute(Sender: TObject);
begin
  AbreForm(TFMPersonalUlises, FMPersonalUlises, Sender);
end;

procedure TFMain.TAvisoMensajeTimer(Sender: TObject);
begin
  TAvisoMensaje.Enabled := False;

  if DMMain.MostrarAvisos then
  begin
     TAviso.Enabled := True;
  end
  else
  begin
     TAviso.Enabled := False;
     TButtAviso.ImageIndex := 8;
  end;

  TAvisoMensaje.Enabled := True;
end;

procedure TFMain.TAvisoTimer(Sender: TObject);
begin
  TAviso.Enabled := False;
  if TButtAviso.ImageIndex = 6 then
     TButtAviso.ImageIndex := 7
  else
     TButtAviso.ImageIndex := 6;
  TAviso.Enabled := True;
end;

procedure TFMain.ATransportistasSEURExecute(Sender: TObject);
begin
  AbreForm(TFMSEUR, FMSEUR, Sender);
end;

procedure TFMain.ATransportistasDHLExecute(Sender: TObject);
begin
  AbreForm(TFMDHL, FMDHL, Sender);
end;

procedure TFMain.ATransportistasIDRILExecute(Sender: TObject);
begin
  AbreForm(TFMIDRIL, FMIDRIL, Sender);
end;

procedure TFMain.TVerificaEntradaTimer(Sender: TObject);
{$IFNDEF Debug}
var
  Maquina, Login : string;
{$ENDIF}
begin
  /// Evita que entren dos personas con el mismo usuario desde diferentes ubicaciones
  /// Cierra la aplicacion a la hora determinada por el parámetro SYSTERM001
  {$IFNDEF Debug}
  TVerificaEntrada.Enabled := False;
  if DMMain.DataBase.TestConnected then
  begin
     // Si la ahora actual coincide con la hora del parámetro, cierro la sesion.
     if (Param_SYSTERM001 = FormatDateTime('hh:nn', Now)) then
        TTerminarAplicacion.Enabled := True
     else
     begin
        // Si la ENTRADA no esta activa, otra persona debe haber entrado con el mismo usuario desde otra ubicacion
        if (not EntradaAbierta) then
        begin
           TTerminarAplicacion.Enabled := True;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT U.MAQUINA, U.LOGIN FROM SYS_ENTRADAS E ');
                 SQL.Add(' JOIN SYS_UBICACIONES U ');
                 SQL.Add(' ON E.UBICACION = U.UBICACION ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' E.FEC_SALIDA IS NULL AND ');
                 SQL.Add(' E.ENTRADA <> ' + REntorno.EntradaStr);
                 SQL.Add(' AND E.USUARIO = ' + REntorno.UsuarioStr);
                 ExecQuery;
                 Maquina := FieldByName['MAQUINA'].AsString;
                 Login := FieldByName['LOGIN'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Restringir acceso a dos personas con el mismo usuario (S/N) desde ubicaciones diferentes.
           if (LeeParametro('SYSCONF002') = 'S') then
           begin
              ShowMessage(_('Hay otra entrada con su usuario desde otra ubicación') + #13#10 + #13#10 +
                 _('Ordenador:') + ' ' + Maquina + #13#10 +
                 _('Login:') + ' ' + Login + #13#10 + #13#10 +
                 _('La aplicación se cerrará en un minuto.') + #13#10 +
                 _('Grabe los documentos.'));
           end
           else
           begin
              ShowMessage(_('La aplicación se cerrará en un minuto.') + #13#10 +
                 _('Grabe los documentos.'));
           end;
        end
        else
           TVerificaEntrada.Enabled := True;
     end;
  end
  else
     TVerificaEntrada.Enabled := True;
  {$ENDIF}
end;

procedure TFMain.TTerminarAplicacionTimer(Sender: TObject);
begin
  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto);

  Dec(CuentaRegresiva);
  if (CuentaRegresiva < 1) then
     Close
  else
     Caption := Format(_('%s - Tiempo para cerrar la aplicación: %d segundos'), [NombreProducto, CuentaRegresiva]);
end;

procedure TFMain.ACrmAmbitosExecute(Sender: TObject);
begin
  AbreForm(TCrmFMAmbitos, CrmFMAmbitos, Sender);
end;

procedure TFMain.ACrmEMailsExecute(Sender: TObject);
begin
  AbreForm(TCrmFMCorreos, CrmFMCorreos, Sender);
end;

procedure TFMain.ACrmTipoAccionesExecute(Sender: TObject);
begin
  AbreForm(TCrmFMAcciones, CrmFMAcciones, Sender);
end;

procedure TFMain.ACrmContactosExecute(Sender: TObject);
begin
  AbreForm(TCrmFMContactos, CrmFMContactos, Sender);
  CrmFMContactos.FiltroContactos(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ACrmConsultaAccionesExecute(Sender: TObject);
begin
  AbreForm(TCrmFMConsultaAcciones, CrmFMConsultaAcciones, Sender);
end;

procedure TFMain.ACrmConfiguracionExecute(Sender: TObject);
begin
  AbreForm(TCRMFMConfiguracion, CRMFMConfiguracion, Sender);
end;

procedure TFMain.ACrmOrigenRelExecute(Sender: TObject);
begin
  AbreForm(TCrmFMOrigenRel, CrmFMOrigenRel, Sender);
end;

procedure TFMain.ACrmImportarContactosExecute(Sender: TObject);
begin
  CrmFMAsistenteImpContactos := TCrmFMAsistenteImpContactos.Create(Self);
  CrmFMAsistenteImpContactos.ShowModal;
  CrmFMAsistenteImpContactos.Free;
  CrmFMAsistenteImpContactos := nil;
end;

procedure TFMain.AEstadisticasExecute(Sender: TObject);
begin
  AbreForm(TZFMEstadisticas, ZFMEstadisticas, Sender);
end;

// SFG: Nuevos mantenimientos de produccion
procedure TFMain.AProEscandalloSFExecute(Sender: TObject);
begin
  AbreForm(TProFMEscandallo, ProFMEscandallo, Sender);
  ProFMEscandallo.FiltraEscandallo('EPR', FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AProMarcajesOpeExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesOpe, ProFMMarcajesOpe, Sender);
  if (FiltroAccion <> '') then
  begin
     ProFMMarcajesOpe.FiltraOperario(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProDiarioExecute(Sender: TObject);
begin
  AbreForm(TProFMDiario, ProFMDiario, Sender);
end;

procedure TFMain.AProOrdenExecute(Sender: TObject);
begin
  AbreForm(TProFMOrden, ProFMOrden, Sender);
  if (FiltroAccion <> '') then
  begin
     ProFMOrden.FiltraOrden(StrToIntDef(FiltroAccion, 0));
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProGestionOrdExecute(Sender: TObject);
begin
  AbreForm(TProFMGestOrden, ProFMGestOrden, Sender);
end;

procedure TFMain.AProMarcajesMaqExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesMaq, ProFMMarcajesMaq, Sender);
  if (FiltroAccion <> '') then
  begin
     ProFMMarcajesMaq.FiltraMaquina(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProMarcajesTeExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesTe, ProFMMarcajesTe, Sender);
  if (FiltroAccion <> '') then
  begin
     ProFMMarcajesTe.FiltraTE(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProMarcajesVaExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesVa, ProFMMarcajesVa, Sender);
  if (FiltroAccion <> '') then
  begin
     ProFMMarcajesVa.FiltraVA(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProGenerarOrdExecute(Sender: TObject);
begin
  AbreForm(TProFMPedidosOrd, ProFMPedidosOrd, Sender);
end;

procedure TFMain.AProRecursosEmpExecute(Sender: TObject);
begin
  AbreForm(TProFMRecursoEmp, ProFMRecursoEmp, Sender);
end;

procedure TFMain.AOpeCategoriaExecute(Sender: TObject);
begin
  AbreForm(TOpeFMCategoria, OpeFMCategoria, Sender);
end;

procedure TFMain.AOpeCTrabajoExecute(Sender: TObject);
begin
  AbreForm(TOpeFMCentTrab, OpeFMCentTrab, Sender);
end;

procedure TFMain.AOpeDepartamentoExecute(Sender: TObject);
begin
  AbreForm(TOpeFMDepart, OpeFMDepart, Sender);
end;

procedure TFMain.AOpeSeccionesExecute(Sender: TObject);
begin
  AbreForm(TOpeFMSecciones, OpeFMSecciones, Sender);
  if (FiltroAccion <> '') then
  begin
     OpeFMSecciones.FiltraSeccion(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AOpeTContratoExecute(Sender: TObject);
begin
  AbreForm(TOpeFMTiposContratos, OpeFMTiposContratos, Sender);
end;

procedure TFMain.AOpeEmpleadosExecute(Sender: TObject);
begin
  AbreForm(TOpeFMEmpleados, OpeFMEmpleados, Sender);
  if (FiltroAccion <> '') then
  begin
     OpeFMEmpleados.FiltraEmpleado(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProMaquinasExecute(Sender: TObject);
begin
  AbreForm(TProFMMaquinas, ProFMMaquinas, Sender);
end;

procedure TFMain.AOpeImputacionesExecute(Sender: TObject);
begin
  AbreForm(TOpeFMImputacion, OpeFMImputacion, Sender);
end;

procedure TFMain.AOpeTImputacionExecute(Sender: TObject);
begin
  AbreForm(TOpeFMTiposImputacion, OpeFMTiposImputacion, Sender);
end;

procedure TFMain.AOpeCalendarioExecute(Sender: TObject);
begin
  AbreForm(TOpeFMCalendario, OpeFMCalendario, Sender);
  if (FiltroAccion <> '') then
  begin
     OpeFMCalendario.FiltraCalendario(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AOpeCalendarioEmpExecute(Sender: TObject);
begin
  AbreForm(TOpeFMCalenEmpl, OpeFMCalenEmpl, Sender);
  if (FiltroAccion <> '') then
  begin
     OpeFMCalenEmpl.FiltraCalendario(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.ACalendarioZonaExecute(Sender: TObject);
begin
  AbreForm(TFMCalendarioZona, FMCalendarioZona, Sender);
  if (FiltroAccion <> '') then
  begin
     FMCalendarioZona.FiltraCalendario(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProLstOrdenExecute(Sender: TObject);
begin
  AbreForm(TProFMLstOrden, ProFMLstOrden, Sender);
  ProFMLstOrden.Configurar(0, 0);
end;

procedure TFMain.AProLstEscandalloExecute(Sender: TObject);
begin
  AbreForm(TProFMLstEscandallo, ProFMLstEscandallo, Sender);
  ProFMLstEscandallo.RBEscandallo.Checked := True;
end;

procedure TFMain.AProMatIncExecute(Sender: TObject);
begin
  AbreForm(TProFMMatInc, ProFMMatInc, Sender);
end;

procedure TFMain.AProTMaquinaExecute(Sender: TObject);
begin
  AbreForm(TProFMTipoMaquinas, ProFMTipoMaquinas, Sender);
end;

procedure TFMain.AProRecMarcajesExecute(Sender: TObject);
begin
  AbreForm(TProFMReloj, ProFMReloj, Sender);
end;

procedure TFMain.AProFasesExecute(Sender: TObject);
begin
  AbreForm(TProFMFases, ProFMFases, Sender);
end;

procedure TFMain.AProTareasExecute(Sender: TObject);
begin
  AbreForm(TProFMTareas, ProFMTareas, Sender);
end;

procedure TFMain.AProRecursosExecute(Sender: TObject);
begin
  AbreForm(TProFMRecursoEmp, ProFMRecursoEmp, Sender);
end;

procedure TFMain.AProLstMarcajesExecute(Sender: TObject);
begin
  AbreForm(TProFMLstMarcajes, ProFMLstMarcajes, Sender);
end;

procedure TFMain.AProConfigMarcajesExecute(Sender: TObject);
begin
  AbreForm(TProFMConfigRecMarcajes, ProFMConfigRecMarcajes, Sender);
end;

procedure TFMain.AOpeHorarioExecute(Sender: TObject);
begin
  AbreForm(TOpeFMHorario, OpeFMHorario, Sender);
  if (FiltroAccion <> '') then
  begin
     OpeFMHorario.FiltraHorario(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AProLstMontajeExecute(Sender: TObject);
begin
  AbreForm(TProFMLstOrden, ProFMLstOrden, Sender);
  ProFMLstOrden.Configurar(1, 0);
end;

procedure TFMain.AProLstNecesidadesExecute(Sender: TObject);
begin
  AbreForm(TProFMLstNecesidades, ProFMLstNecesidades, Sender);
end;

procedure TFMain.AIsoAccPreventivaExecute(Sender: TObject);
begin
  AbreForm(TIsoFMAcciones, IsoFMAcciones, Sender);
  if (FiltroAccion <> '') then
  begin
     IsoFMAcciones.FiltraAcciones(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AIsoMantTAccExecute(Sender: TObject);
begin
  AbreForm(TIsoFMAccionesTipo, IsoFMAccionesTipo, Sender);
end;

procedure TFMain.AIsoPlanCapacExecute(Sender: TObject);
begin
  AbreForm(TIsoFMCapacitacion, IsoFMCapacitacion, Sender);
end;

procedure TFMain.AIsoClassProvExecute(Sender: TObject);
begin
  AbreForm(TIsoFMClaPro, IsoFMClaPro, Sender);
end;

procedure TFMain.AIsoDevMatExecute(Sender: TObject);
begin
  AbreForm(TIsoFMDevolucion, IsoFMDevolucion, Sender);
  if (FiltroAccion <> '') then
  begin
     IsoFMDevolucion.FiltraDevolucion(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AIsoMantInformesExecute(Sender: TObject);
begin
  AbreForm(TIsoFMInc, IsoFMInc, Sender);
  if (FiltroAccion <> '') then
  begin
     IsoFMInc.Filtrar(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AIsoControlEquipExecute(Sender: TObject);
begin
  AbreForm(TIsoFMMedicion, IsoFMMedicion, Sender);
end;

procedure TFMain.AIsoPunteosExecute(Sender: TObject);
begin
  AbreForm(TIsoFMPunteo, IsoFMPunteo, Sender);
end;

procedure TFMain.AProUtillajesExecute(Sender: TObject);
begin
  AbreForm(TProFMUtillajes, ProFMutillajes, Sender);
  ProFMutillajes.FiltraUtillaje(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AIsoFirmasExecute(Sender: TObject);
begin
  AbreForm(TIsoFMFirmas, IsoFMFirmas, Sender);
end;

procedure TFMain.AProLstHojaTrabajoExecute(Sender: TObject);
begin
  AbreForm(TProFMLstHojaTrabajo, ProFMLstHojaTrabajo, Sender);
end;

procedure TFMain.AProRelacionUdsExecute(Sender: TObject);
begin
  AbreForm(TProFMRelacionUds, ProFMRelacionUds, Sender);
end;

procedure TFMain.AProOfertasEExecute(Sender: TObject);
begin
  AbreForm(TProFMEscandallo, ProFMEscandallo, Sender);
  ProFMEscandallo.FiltraEscandallo('OFE', FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AProLstofertasEExecute(Sender: TObject);
begin
  AbreForm(TProFMLstEscandallo, ProFMLstEscandallo, Sender);
  ProFMLstEscandallo.RBOfertasE.Checked := True;
end;

procedure TFMain.AProMarcajesOpeEspExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesOpeEsp, ProFMMarcajesOpeEsp, Sender);
end;

procedure TFMain.AProMarcajesMaqEspExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesMaqEsp, ProFMMarcajesMaqEsp, Sender);
end;

procedure TFMain.AProPlanificarExecute(Sender: TObject);
begin
  AbreForm(TProFPregPlanif, ProFPregPlanif, Sender);
end;

procedure TFMain.AProDeslanzaExecute(Sender: TObject);
begin
  AbreForm(TProFPregDeslanza, ProFPregDeslanza, Sender);
end;

procedure TFMain.AProCabPlanificacionExecute(Sender: TObject);
begin
  AbreForm(TProFMCabPlanif, ProFMCabPlanif, Sender);
end;

procedure TFMain.AProTipTareasManExecute(Sender: TObject);
begin
  AbreForm(TProFMTipTareasManu, ProFMTipTareasManu, Sender);
end;

procedure TFMain.AProTareasManExecute(Sender: TObject);
begin
  AbreForm(TProFMTareasManu, ProFMTareasManu, Sender);
end;

procedure TFMain.AProEquivalArtExecute(Sender: TObject);
begin
  AbreForm(TProFMEquivalenciaArticulo, ProFMEquivalenciaArticulo, Sender);
  ProFMEquivalenciaArticulo.PosicionaEquivalencia(StrToIntDef(FiltroAccion, 0));
  FiltroAccion := '';
end;

procedure TFMain.APautaExecute(Sender: TObject);
begin
  AbreForm(TProFMPauta, ProFMPauta, Sender);
end;

procedure TFMain.APauta_TipoControlExecute(Sender: TObject);
begin
  AbreForm(TProFMTControlPauta, ProFMTControlPauta, Sender);
end;

procedure TFMain.AObrObrasExecute(Sender: TObject);
begin
  AbreForm(TObrFMObras, ObrFMObras, Sender);
end;

procedure TFMain.AObrPartidasExecute(Sender: TObject);
begin
  AbreForm(TObrFMPartidas, ObrFMPartidas, Sender);
end;

procedure TFMain.AObrPartidasPlantillaExecute(Sender: TObject);
begin
  AbreForm(TObrFMPartidasPlantilla, ObrFMPartidasPlantilla, Sender);
end;

procedure TFMain.AIsoCursosExecute(Sender: TObject);
begin
  AbreForm(TIsoFMCursos, IsoFMCursos, Sender);
end;

procedure TFMain.AProDiagramaGanttExecute(Sender: TObject);
begin
  AbreForm(TProFMGantt, ProFMGantt, Sender);
end;

procedure TFMain.AProTipoMarcajesExecute(Sender: TObject);
begin
  AbreForm(TProFMTipoMarcajes, ProFMTipoMarcajes, Sender);
end;

procedure TFMain.AIsoPlanningExecute(Sender: TObject);
begin
  AbreForm(TIsoFMPlanning, IsoFMPlanning, Sender);
end;

procedure TFMain.AProMarcajesBDExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesBD, ProFMMarcajesBD, Sender);
end;

procedure TFMain.AProDesTipoPiezaExecute(Sender: TObject);
begin
  AbreForm(TProFMDesTipoPieza, ProFMDesTipoPieza, Sender);
end;

procedure TFMain.AProDesTipoMatExecute(Sender: TObject);
begin
  AbreForm(TProFMDesTipoMat, ProFMDesTipoMat, Sender);
end;

procedure TFMain.AProDesDespieceExecute(Sender: TObject);
begin
  AbreForm(TProFMDesDespiece, ProFMDesDespiece, Sender);
end;

procedure TFMain.ARecalcularExecute(Sender: TObject);
begin
  AbreForm(TProFmRecalculoStock, ProFmRecalculoStock, Sender);
end;

procedure TFMain.ADocumentosExecute(Sender: TObject);
begin
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
end;

procedure TFMain.AProLstMatEscExecute(Sender: TObject);
begin
  AbreForm(TProFMLstMatEsc, ProFMLstMatEsc, Sender);
end;

procedure TFMain.ALstNecEscExecute(Sender: TObject);
begin
  AbreForm(TProFMLstNecesidadesEsc, ProFMLstNecesidadesEsc, Sender);
end;

procedure TFMain.AImagenesArticulosExecute(Sender: TObject);
begin
  AbreForm(TProFMArticulosImg, ProFMArticulosImg, Sender);
end;

procedure TFMain.AArticulosAlmacenesExecute(Sender: TObject);
begin
  AbreForm(TProFMArticulosAlmacenes, ProFMArticulosAlmacenes, Sender);
end;

procedure TFMain.AProPantMarcajesExecute(Sender: TObject);
begin
  AbreForm(TProFMPantMarcajes, ProFMPantMarcajes, Sender);
end;

procedure TFMain.AAgrupaRecEscExecute(Sender: TObject);
begin
  AbreForm(TProFMAgrupaEscRec, ProFMAgrupaEscRec, Sender);
end;

procedure TFMain.AProUtilesExecute(Sender: TObject);
begin
  AbreForm(TProFMConfiguracion, ProFMConfiguracion, Sender);
end;

procedure TFMain.AProFormulasExecute(Sender: TObject);
begin
  AbreForm(TProFMFormulas, ProFMFormulas, Sender);
  ProFMFormulas.Filtra(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.APresenciaExecute(Sender: TObject);
begin
  AbreForm(TFMPresencia, FMPresencia, Sender);
  FMPresencia.Filtra(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.APresenciaIncidenciaExecute(Sender: TObject);
begin
  AbreForm(TFMPresenciaIncidencia, FMPresenciaIncidencia, Sender);
end;

procedure TFMain.APresenciaDispositivoExecute(Sender: TObject);
begin
  AbreForm(TFMPresenciaDispositivo, FMPresenciaDispositivo, Sender);
end;

procedure TFMain.APresenciaTipoMarcajeExecute(Sender: TObject);
begin
  AbreForm(TFMPresenciaTipoMarcaje, FMPresenciaTipoMarcaje, Sender);
end;

procedure TFMain.AImportacionFichajesDePresenciaExecute(Sender: TObject);
begin
  AbreForm(TFMPresenciaProcesaMarcajes, FMPresenciaProcesaMarcajes, Sender);
end;

procedure TFMain.APresenciaDiarioExecute(Sender: TObject);
begin
  AbreForm(TFMPresenciaDiario, FMPresenciaDiario, Sender);
end;

procedure TFMain.ALstPresenciaExecute(Sender: TObject);
begin
  AbreForm(TProFMLstPresencia, ProFMLstPresencia, Sender);
end;

procedure TFMain.AProTMaquinaRevisionExecute(Sender: TObject);
begin
  AbreForm(TProFMMaquinasRevisiones, ProFMMaquinasRevisiones, Sender);
end;

procedure TFMain.AProTipoRevMaqExecute(Sender: TObject);
begin
  AbreForm(TProFMTipoRevisionesMaq, ProFMTipoRevisionesMaq, Sender);
end;

procedure TFMain.ACambioIdiomaExecute(Sender: TObject);
begin
  AbreForm(TFMCambiaIdioma, FMCambiaIdioma, Sender);
end;

procedure TFMain.ATipoUnidadLogisticaExecute(Sender: TObject);
begin
  AbreForm(TFMUnidadesLogisitcas, FMUnidadesLogisitcas, Sender);
end;

procedure TFMain.AAltaHojaDePreparacionExecute(Sender: TObject);
begin
  AbreForm(TFMAltaHojasDePreparacion, FMAltaHojasDePreparacion, Sender);
end;

procedure TFMain.AHojaDePreparacionExecute(Sender: TObject);
begin
  AbreForm(TFMHojaDePreparacion, FMHojaDePreparacion, Sender);
  FMHojaDePreparacion.FiltraHojas(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AProtocolosDeVentaExecute(Sender: TObject);
begin
  AbreForm(TFMProtocolosDeVenta, FMProtocolosDeVenta, Sender);
end;

procedure TFMain.AProtocoloDeVentasExecute(Sender: TObject);
begin
  AbreForm(TFMProtocoloDeVenta, FMProtocoloDeVenta, Sender);
end;

procedure TFMain.ACierreParcialOrdenExecute(Sender: TObject);
begin
  AbreForm(TFMCierreParcialOrden, FMCierreParcialOrden, Sender);
  FMCierreParcialOrden.Filtra(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ADepartamentoExecute(Sender: TObject);
begin
  AbreForm(TFMDepartamentos, FMDepartamentos, Sender);
end;

procedure TFMain.ACrmTipoSeguimientoExecute(Sender: TObject);
begin
  AbreForm(TCRMFMSeguimientos, CRMFMSeguimientos, Sender);
end;

procedure TFMain.ATipoUbicacionExecute(Sender: TObject);
begin
  AbreForm(TFMTipoUbicacion, FMTipoUbicacion, Sender);
end;

procedure TFMain.ASectorAlmacenExecute(Sender: TObject);
begin
  AbreForm(TFMSectorUbicacion, FMSectorUbicacion, Sender);
end;

procedure TFMain.ALstUbicacionesExecute(Sender: TObject);
begin
  AbreForm(TFPregControlUbicaciones, FPregControlUbicaciones, Sender);
end;

procedure TFMain.AAlbaranesVentaPendientesExecute(Sender: TObject);
begin
  AbreForm(TFPregAlbPdte, FPregAlbPdte, Sender);
end;

procedure TFMain.ZASysNCFExecute(Sender: TObject);
begin
  AbreForm(TZFMSysNCF, ZFMSysNCF, Sender);
end;

procedure TFMain.ZATalonesExecute(Sender: TObject);
begin
{ Latino - Se elimina del menu Latino, es un formulario para la creacion de talones por tercero
  AbreForm(TZFMTalones, ZFMTalones, Sender);
}
end;

procedure TFMain.ZADiarioVentasExecute(Sender: TObject);
begin
  AbreForm(TZFMLstDiarioVentas, ZFMLstDiarioVentas, Sender);
end;

procedure TFMain.ZAVentasFamiliaExecute(Sender: TObject);
begin
  { Latino - Se elimina del menu Latino, genera listado de ventas por rango de fechas y serie
  AbreForm(TZFMLstVentasFamilia, ZFMLstVentasFamilia, Sender);
  }
end;

procedure TFMain.ZAInteresesExecute(Sender: TObject);
begin
{ Latino - Se elimina del menu Latino, es un formulario que maneja los intereses de los anticipos
  AbreForm(TZFMInteresesAnticipos, ZFMInteresesAnticipos, Sender);
}
end;

procedure TFMain.AListadoITBISExecute(Sender: TObject);
begin
  AbreForm(TFPregDiarioITBIS, FPregDiarioITBIS, Sender);
end;

procedure TFMain.ALSTTalonesExecute(Sender: TObject);
begin
  AbreForm(TFPregTalonesBancos, FPregTalonesBancos, Sender);
end;

procedure TFMain.ZArecibosExecuteExecute(Sender: TObject);
begin
  AbreForm(TZFMRecibos, ZFMRecibos, Sender);
end;

procedure TFMain.AResponsableHojaDePreparacionExecute(Sender: TObject);
begin
  AbreForm(TFMIntroduccionOperario, FMIntroduccionOperario, Sender);
end;

procedure TFMain.AGruposIncotermExecute(Sender: TObject);
begin
  AbreForm(TFMGrupoIncoterm, FMGrupoIncoterm, Sender);
end;

procedure TFMain.ACodigosIncotermExecute(Sender: TObject);
begin
  AbreForm(TFMCodigoIncoterm, FMCodigoIncoterm, Sender);
end;

procedure TFMain.AAsistenteImpIdiomaArticulosExecute(Sender: TObject);
begin
  FMAsistenteImpArtIdiomas := TFMAsistenteImpArtIdiomas.Create(Self);
  FMAsistenteImpArtIdiomas.ShowModal;
  FMAsistenteImpArtIdiomas.Free;
  FMAsistenteImpArtIdiomas := nil;
end;

procedure TFMain.AProMarcajesMaqEspTurnoExecute(Sender: TObject);
begin
  AbreForm(TProFMMarcajesMaqEspTurno, ProFMMarcajesMaqEspTurno, Sender);
end;

procedure TFMain.AProTurnosExecute(Sender: TObject);
begin
  AbreForm(TProFMTurnos, ProFMTurnos, Sender);
end;

procedure TFMain.AProCausasExecute(Sender: TObject);
begin
  AbreForm(TProFMCausas, ProFMCausas, Sender);
end;

procedure TFMain.AProDefectoExecute(Sender: TObject);
begin
  AbreForm(TProFMDefecto, ProFMDefecto, Sender);
end;

procedure TFMain.AProTiposDefectoExecute(Sender: TObject);
begin
  AbreForm(TProFMTiposDefecto, ProFMTiposDefecto, Sender);
end;

procedure TFMain.AIsoFichaTecnicaExecute(Sender: TObject);
begin
  AbreForm(TIsoFMFichaTecnica, IsoFMFichaTecnica, Sender);
  IsoFMFichaTecnica.Filtra(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AIsoCertificadoAnalisisExecute(Sender: TObject);
begin
  AbreForm(TIsoFMCertificadoAnalisis, IsoFMCertificadoAnalisis, Sender);
  IsoFMCertificadoAnalisis.Filtra(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AIsoNormativasExecute(Sender: TObject);
begin
  AbreForm(TIsoFMNormativas, IsoFMNormativas, Sender);
end;

procedure TFMain.AIsoTipoEnsayoExecute(Sender: TObject);
begin
  AbreForm(TIsoFMTipoEnsayo, IsoFMTipoEnsayo, Sender);
end;

procedure TFMain.AIsoEnsayosExecute(Sender: TObject);
begin
  AbreForm(TIsoFMEnsayo, IsoFMEnsayo, Sender);
end;

procedure TFMain.AImportarPedidosExecute(Sender: TObject);
begin
  AbreForm(TFMInterPedido, FMInterPedido, Sender);
end;

procedure TFMain.ATipoRetencionExecute(Sender: TObject);
begin
  AbreForm(TFMTipoRetencion, FMTipoRetencion, Sender);
end;

procedure TFMain.APlanMaestroProduccionExecute(Sender: TObject);
begin
  AbreForm(TFMPlanMaestroProduccion, FMPlanMaestroProduccion, Sender);
end;

procedure TFMain.ADiarioCostesExecute(Sender: TObject);
begin
  AbreForm(TFMDiarioCostes, FMDiarioCostes, Sender);
end;

procedure TFMain.AGestionDeCobrosExecute(Sender: TObject);
begin
  AbreForm(TFMGestionCobros, FMGestionCobros, Sender);
end;

procedure TFMain.ASincronizaIncidenciasExecute(Sender: TObject);
begin
  AbreData(TDMSincronizacionIncidencias, DMSincronizacionIncidencias);
  DMSincronizacionIncidencias.SincronizaBases;
  CierraData(DMSincronizacionIncidencias);
end;

procedure TFMain.ASincronizaTiendaExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionTienda, FMSincronizacionTienda, Sender);
  if (FiltroAccion = 'sinc') then
     FMSincronizacionTienda.SincronizarcionAutomatica;
  FiltroAccion := '';
end;

procedure TFMain.ASincronizaTiendaWoocommerceExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionTiendaWoocommerce, FMSincronizacionTiendaWoocommerce, Sender);
  if (FiltroAccion = 'sinc') then
     FMSincronizacionTiendaWoocommerce.SincronizarcionAutomatica;
  FiltroAccion := '';
end;

procedure TFMain.ASincronizacionTiendaPureWorksExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionTiendaPureWorks, FMSincronizacionTiendaPureWorks, Sender);
  if (FiltroAccion = 'sinc') then
     FMSincronizacionTiendaPureWorks.SincronizarcionAutomatica;
  FiltroAccion := '';
end;

procedure TFMain.ASincronizaTiendaMasYMasBaratoExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionTiendaMasYMasBarato, FMSincronizacionTiendaMasYMasBarato, Sender);
end;

procedure TFMain.MIImpresoraLaserClick(Sender: TObject);
var
  OldPrinter : integer;
  i : integer;
begin
  OldPrinter := REntorno.Laser;

  REntorno.Laser := TMenuItem(Sender).Tag;
  // Guardo el nombre de la impresora hasta el "(" o el "#" incluido, por si es una impresora de escritorio remoto
  // Ej. Terminal Services - EPSON LX 810 (redirect 123)
  // Ej. TSPrint           - EPSON LX 810 #123
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) = 0) and (Pos('#', Printer.Printers[TMenuItem(Sender).Tag]) = 0) then
     REntorno.NombreLaser := Trim(Printer.Printers[TMenuItem(Sender).Tag])
  else
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) > 0) then
     REntorno.NombreLaser := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('(', Printer.Printers[TMenuItem(Sender).Tag])))
  else
  if (Pos('#', Printer.Printers[TMenuItem(Sender).Tag]) > 0) then
     REntorno.NombreLaser := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('#', Printer.Printers[TMenuItem(Sender).Tag])));

  for i := 0 to MGLaser.Count - 1 do
     MGLaser.Items[i].Checked := MGLaser.Items[i].Tag = TMenuItem(Sender).Tag;

  ARefrescarBandejasExecute(Sender);

  // Recargo la impresora
  try
     DMMain.frHYReport1.ChangePrinter(OldPrinter, REntorno.Laser);
  except
     DMMain.frHYReport1.ChangePrinter(-1, 0);
     REntorno.Laser := 0;
     REntorno.NombreLaser := '';
  end;
end;

procedure TFMain.MIBandejaLaserClick(Sender: TObject);
var
  i : integer;
begin
  REntorno.BandejaLaser := TMenuItem(Sender).Tag;
  for i := 0 to MGBandejaLaser.Count - 1 do
     MGBandejaLaser.Items[i].Checked := MGBandejaLaser.Items[i].Tag = TMenuItem(Sender).Tag;
end;

procedure TFMain.MIImpresoraEtiquetasClick(Sender: TObject);
var
  OldPrinter : integer;
  i : integer;
begin
  OldPrinter := REntorno.Etiquetas;

  REntorno.Etiquetas := TMenuItem(Sender).Tag;
  {
  // Guardo el nombre de la impresora hasta el ( incluido, por si es una impresora de escritorio remoto (Ej. EPSON LX 810 (redirect 123))
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) = 0) then
     REntorno.NombreEtiquetas := Trim(Printer.Printers[TMenuItem(Sender).Tag])
  else
     REntorno.NombreEtiquetas := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('(', Printer.Printers[TMenuItem(Sender).Tag])));
  }
  // Guardo el nombre de la impresora hasta el "(" o el "#" incluido, por si es una impresora de escritorio remoto
  // Ej. Terminal Services - EPSON LX 810 (redirect 123)
  // Ej. TSPrint           - EPSON LX 810 #123
  REntorno.NombreEtiquetasCompleto := Trim(Printer.Printers[TMenuItem(Sender).Tag]);
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) = 0) and (Pos('#', Printer.Printers[TMenuItem(Sender).Tag]) = 0) then
     REntorno.NombreEtiquetas := Trim(Printer.Printers[TMenuItem(Sender).Tag])
  else
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) > 0) then
     REntorno.NombreEtiquetas := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('(', Printer.Printers[TMenuItem(Sender).Tag])))
  else
  if (Pos('#', Printer.Printers[TMenuItem(Sender).Tag]) > 0) then
     REntorno.NombreEtiquetas := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('#', Printer.Printers[TMenuItem(Sender).Tag])));

  for i := 0 to MGEtiquetas.Count - 1 do
  begin
     MGEtiquetas.Items[i].Checked := MGEtiquetas.Items[i].Tag = TMenuItem(Sender).Tag;
  end;

  // Recargo la impresora
  try
     DMMain.frHYReport1.ChangePrinter(OldPrinter, REntorno.Etiquetas);
  except
     DMMain.frHYReport1.ChangePrinter(-1, 0);
     REntorno.Etiquetas := 0;
     REntorno.NombreEtiquetas := '';
  end;
end;

procedure TFMain.MIImpresoraMatricialClick(Sender: TObject);
var
  i : integer;
begin
  REntorno.Matricial := TMenuItem(Sender).Tag;
  {
  // Guardo el nombre de la impresora hasta el ( incluido, por si es una impresora de escritorio remoto (Ej. EPSON LX 810 (redirect 123))
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) = 0) then
     REntorno.NombreMatricial := Trim(Printer.Printers[TMenuItem(Sender).Tag])
  else
     REntorno.NombreMatricial := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('(', Printer.Printers[TMenuItem(Sender).Tag])));
  }
  // Guardo el nombre de la impresora hasta el "(" o el "#" incluido, por si es una impresora de escritorio remoto
  // Ej. Terminal Services - EPSON LX 810 (redirect 123)
  // Ej. TSPrint           - EPSON LX 810 #123
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) = 0) and (Pos('#', Printer.Printers[TMenuItem(Sender).Tag]) = 0) then
     REntorno.NombreMatricial := Trim(Printer.Printers[TMenuItem(Sender).Tag])
  else
  if (Pos('(', Printer.Printers[TMenuItem(Sender).Tag]) > 0) then
     REntorno.NombreMatricial := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('(', Printer.Printers[TMenuItem(Sender).Tag])))
  else
  if (Pos('#', Printer.Printers[TMenuItem(Sender).Tag]) > 0) then
     REntorno.NombreMatricial := Trim(Copy(Printer.Printers[TMenuItem(Sender).Tag], 1, Pos('#', Printer.Printers[TMenuItem(Sender).Tag])));

  for i := 0 to MGMatricial.Count - 1 do
  begin
     MGMatricial.Items[i].Checked := MGMatricial.Items[i].Tag = TMenuItem(Sender).Tag;
  end;
end;

procedure TFMain.AMaestrosExecute(Sender: TObject);
begin
  AbreForm(TZFMMaestros, ZFMMaestros, Sender);
end;

procedure TFMain.AOrdenesExecute(Sender: TObject);
begin
  AbreForm(TZFMOrdenesProd, ZFMOrdenesProd, Sender);
end;

procedure TFMain.AEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TZFMFichaTecArt, ZFMFichaTecArt, Sender);
  ZFMFichaTecArt.FiltraArticulos(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.APresupuestosExecute(Sender: TObject);
begin
  AbreForm(TZFMPresupuesto, ZFMPresupuesto, Sender);
end;

procedure TFMain.ALstPresupuestosExecute(Sender: TObject);
begin
  AbreForm(TZFMLstPresupuestos, ZFMLstPresupuestos, Sender);
end;

procedure TFMain.AMaquinasExecute(Sender: TObject);
begin
  AbreForm(TZFMMaquinas, ZFMMaquinas, Sender);
end;

procedure TFMain.ADetalleMaqExecute(Sender: TObject);
begin
  AbreForm(TZFMMaquinasDet, ZFMMaquinasDet, Sender);
end;

procedure TFMain.ATroquelesExecute(Sender: TObject);
begin
  AbreForm(TZFMTroqueles, ZFMTroqueles, Sender);
end;

procedure TFMain.AEtiConstantesExecute(Sender: TObject);
begin
  AbreForm(TZFMEtiConstantes, ZFMEtiConstantes, Sender);
end;

procedure TFMain.ATiposArticuloExecute(Sender: TObject);
begin
  AbreForm(TFMTiposArticulo, FMTiposArticulo, Sender);
end;

procedure TFMain.AMaterialesExecute(Sender: TObject);
begin
  AbreForm(TFMMateriales, FMMateriales, Sender);
end;

procedure TFMain.AColadasExecute(Sender: TObject);
begin
  AbreForm(TFMColadas, FMColadas, Sender);
end;

procedure TFMain.AReparacionesExecute(Sender: TObject);
begin
  AbreForm(TFMReparaciones, FMReparaciones, Sender);
  FMReparaciones.FiltraReparaciones(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AMantConsumoExecute(Sender: TObject);
begin
  // AbreForm(TFMReparaciones, FMRepararFMReparaciones, Sender);
end;

procedure TFMain.AZLstOfertasExecute(Sender: TObject);
begin
  AbreForm(TFMLstOfertasEstado, FMLstOfertasEstado, Sender);
end;

procedure TFMain.AGasExecute(Sender: TObject);
begin
  AbreForm(TFMVentasGas, FMVentasGas, Sender);
end;

procedure TFMain.ATiposMonedaExecute(Sender: TObject);
begin
  AbreForm(TFMTiposMoneda, FMTiposMoneda, Sender);
end;

procedure TFMain.AGasTanqueExecute(Sender: TObject);
begin
  AbreForm(TFMGasTanque, FMGasTanque, Sender);
end;

procedure TFMain.AGasDispensadorExecute(Sender: TObject);
begin
  AbreForm(TFMGasDispensador, FMGasDispensador, Sender);
end;

procedure TFMain.AGasColaCamionExecute(Sender: TObject);
begin
  AbreForm(TFMGasColaCamion, FMGasColaCamion, Sender);
end;

procedure TFMain.AProSubsComponentesExecute(Sender: TObject);
begin
  AbreForm(TProFMSubstituirEsc, ProFMSubstituirEsc, Sender);
end;

procedure TFMain.ACompensacionRecibosExecute(Sender: TObject);
begin
  AbreForm(TFMCompensacionRecibos, FMCompensacionRecibos, Sender);
end;

procedure TFMain.AGasUtilesExecute(Sender: TObject);
begin
  AbreForm(TFMGasConstantes, FMGasConstantes, Sender);
end;

procedure TFMain.ASerializacionExecute(Sender: TObject);
begin
  AbreForm(TFMArtSerializacion, FMArtSerializacion, Sender);
  FMArtSerializacion.FiltraSerie(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ADescargasGasExecute(Sender: TObject);
begin
  AbreForm(TFMDescargasGas, FMDescargasGas, Sender);
end;

procedure TFMain.AVerificacionesImpuestosExecute(Sender: TObject);
begin
  AbreForm(TFMVerificacionesImpuestos, FMVerificacionesImpuestos, Sender);
end;

procedure TFMain.ASeriesClienteExecute(Sender: TObject);
begin
  AbreForm(TZFMSeriesCli, ZFMSeriesCli, Sender);
end;

procedure TFMain.ACrmArticulosExecute(Sender: TObject);
begin
  AbreForm(TCrmFMArticulos, CrmFMArticulos, Sender);
end;

procedure TFMain.ACrmMarcajesExecute(Sender: TObject);
begin
  AbreForm(TCrmFMMarcajesVentas, CrmFMMarcajesVentas, Sender);
end;

procedure TFMain.ACrmVentasExecute(Sender: TObject);
begin
  AbreForm(TCrmFMVentas, CrmFMVentas, Sender);
end;

procedure TFMain.ACrmAccionesExecute(Sender: TObject);
begin
  AbreForm(TCrmFMAccionesCab, CrmFMAccionesCab, Sender);
end;

procedure TFMain.MuestraInfoTercero(Tercero: integer);
begin
  AbreForm(TFMInfoTercero, FMInfoTercero);
  FMInfoTercero.MuestraTercero(Tercero);
end;

procedure TFMain.AImportarArticulosExcelExecute(Sender: TObject);
begin
  AbreForm(TFMImportacionArticulosExcel, FMImportacionArticulosExcel, Sender);
end;

procedure TFMain.APrevisionTesoreriaExecute(Sender: TObject);
begin
  AbreForm(TFMPrevisionTesoreria, FMPrevisionTesoreria, Sender);
end;

procedure TFMain.ACrmImportarLocalidadesExecute(Sender: TObject);
begin
  CrmFMAsistenteImpLocalidades := TCrmFMAsistenteImpLocalidades.Create(Self);
  CrmFMAsistenteImpLocalidades.ShowModal;
  CrmFMAsistenteImpLocalidades.Free;
  CrmFMAsistenteImpLocalidades := nil;
end;

procedure TFMain.ATipoColorTallasExecute(Sender: TObject);
begin
  AbreForm(TFMTipoColoresTallas, FMTipoColoresTallas, Sender);
end;

procedure TFMain.AParametrizacionTallasExecute(Sender: TObject);
begin
  AbreForm(TFMParamArticulos, FMParamArticulos, Sender);
end;

procedure TFMain.AProOrdTareaMatExecute(Sender: TObject);
begin
  AbreForm(TProFMOrdTareaMat, ProFMOrdTareaMat, Sender);
end;

procedure TFMain.AImprimePedidosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMImprimePedidos, FMImprimePedidos, Sender);
end;

procedure TFMain.ATipoNCFExecute(Sender: TObject);
begin
  AbreForm(TFMTipoNCF, FMTipoNCF, Sender);
end;

procedure TFMain.AADRNaturalezaPeligroExecute(Sender: TObject);
begin
  AbreForm(TFMNaturPeligro, FMNaturPeligro, Sender);
end;

procedure TFMain.AADRMedidasProteccionExecute(Sender: TObject);
begin
  AbreForm(TFMMedidasProtec, FMMedidasProtec, Sender);
end;

procedure TFMain.AListadoCuotaExecute(Sender: TObject);
begin
  TFPregCuotasCliente.Create(Self).Muestra(0);
end;

procedure TFMain.AControlPlazasExecute(Sender: TObject);
begin
  AbreForm(TFMControlPlazas, FMControlPlazas, Sender);
end;

procedure TFMain.AConsultaITBISExecute(Sender: TObject);
begin
  AbreForm(TFMLstITBIS, FMLstITBIS, Sender);
end;

procedure TFMain.AConciliacionBancariaExecute(Sender: TObject);
begin
  AbreForm(TZFMPunteoAsientos, ZFMPunteoAsientos, Sender);
end;

procedure TFMain.ANominaExecute(Sender: TObject);
begin
  AbreForm(TFMNominas, FMNominas, Sender);
end;

procedure TFMain.CambiaColorFondo;
begin
  // Inicializo color defecto
  Self.Color := clBtnFace;

  // Busco el color para el canal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COLOR FROM GEN_CANALES WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Self.Color := Trunc(FieldByName['COLOR'].AsFloat);
        if (Self.Color = 0) then
           Self.Color := clBtnFace;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no ha cambiado el corlor verifico color segun ejercicio
  if (Self.Color = clBtnFace) then
  begin
     // Busco el color para el ejercicio
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COLOR FROM GEN_EJERCICIOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           ExecQuery;
           Self.Color := Trunc(FieldByName['COLOR'].AsFloat);
           if (Self.Color = 0) then
              Self.Color := clBtnFace;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Self.Color := Self.Color;
  Repaint;
end;

procedure TFMain.AAbreINIExecute(Sender: TObject);
begin
  DMMain.AbrirArchivo(REntorno.FicheroINI);
end;

procedure TFMain.ATraspasoMulticanalesExecute(Sender: TObject);
begin
  AbreForm(TZFMTraspasoMultiCanalMasivo, ZFMTraspasoMultiCanalMasivo, Sender);
end;

procedure TFMain.ZAModelosExecute(Sender: TObject);
begin
  AbreForm(TZFMModelos, ZFMModelos, Sender);
end;

procedure TFMain.ZALonasExecute(Sender: TObject);
begin
  AbreForm(TZFMLonas, ZFMLonas, Sender);
end;

procedure TFMain.ZALonasFormaExecute(Sender: TObject);
begin
  AbreForm(TZFMLonasForma, ZFMLonasForma, Sender);
end;

procedure TFMain.ZARibetesExecute(Sender: TObject);
begin
  AbreForm(TZFMRibetes, ZFMRibetes, Sender);
end;

procedure TFMain.ZABambalinasExecute(Sender: TObject);
begin
  AbreForm(TZFMBambalinas, ZFMBambalinas, Sender);
end;

procedure TFMain.ZAModelosDetExecute(Sender: TObject);
begin
  AbreForm(TZFMModelosDet, ZFMModelosDet, Sender);
  ZFMModelosDet.FiltrarModelo(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.ZAColoresExecute(Sender: TObject);
begin
  AbreForm(TZFMColores, ZFMColores, Sender);
end;

procedure TFMain.ZAModelosFechasExecute(Sender: TObject);
begin
  AbreForm(TZFMModelosFechas, ZFMModelosFechas, Sender);
end;

procedure TFMain.ZATarifasModelosExecute(Sender: TObject);
begin
  AbreForm(TZFMTarifasModelos, ZFMTarifasModelos, Sender);
end;

procedure TFMain.ZAPedidosEspExecute(Sender: TObject);
begin
  AbreForm(TZFMPedidosEsp, ZFMPedidosEsp, Sender);
end;

procedure TFMain.ZAPedidosEspTodosExecute(Sender: TObject);
begin
  AbreForm(TZFMPedidosEspTodos, ZFMPedidosEspTodos, Sender);
end;

procedure TFMain.ZADatosAuxiliaresExecute(Sender: TObject);
begin
  AbreForm(TZFMAuxiliares, ZFMAuxiliares, Sender);
end;

procedure TFMain.ZATiposConfigExecute(Sender: TObject);
begin
  AbreForm(TZFMTiposConfig, ZFMTiposConfig, Sender);
end;

procedure TFMain.ZAVerEstadoPedCliExecute(Sender: TObject);
begin
  AbreForm(TZFMVerEstadoPedCli, ZFMVerEstadoPedCli, Sender);
end;

procedure TFMain.ZAVerEstadoOrdenesCliExecute(Sender: TObject);
begin
  AbreForm(TZFMVerEstadoOFCli, ZFMVerEstadoOFCli, Sender);
end;

procedure TFMain.ZAMarcajeManualExecute(Sender: TObject);
begin
  AbreForm(TZFMMarcajeManual, ZFMMarcajeManual, Sender);
end;

procedure TFMain.ZAPuestosExecute(Sender: TObject);
begin
  AbreForm(TZFMPuestos, ZFMPuestos, Sender);
end;

procedure TFMain.ZAMarcajesExecute(Sender: TObject);
begin
  AbreForm(TZFMMarcajes, ZFMMarcajes, Sender);
end;

procedure TFMain.ZAImprimePedEspPdteExecute(Sender: TObject);
begin
  AbreForm(TZFMImprimePedidosEsp, ZFMImprimePedidosEsp, Sender);
end;

procedure TFMain.ZALstPedEntregaExecute(Sender: TObject);
begin
  AbreForm(TZFPregPedEntrega, ZFPregPedEntrega, Sender);
end;

procedure TFMain.ZAArticulosExecute(Sender: TObject);
begin
  AbreForm(TZFMArticulos, ZFMArticulos, Sender);
end;

procedure TFMain.ZAPedidosAAlbaranExecute(Sender: TObject);
begin
  AbreForm(TZFMPedidosAAlbaran, ZFMPedidosAAlbaran, Sender);
end;

procedure TFMain.ZAPedidosMalCerradosExecute(Sender: TObject);
begin
  AbreForm(TZFmPedidosMalCerrados, ZFmPedidosMalCerrados, Sender);
end;

procedure TFMain.ZALstPedVenLinExecute(Sender: TObject);
begin
  AbreForm(TZFMVentasPedidosLineal, ZFMVentasPedidosLineal, Sender);
end;

procedure TFMain.ZATiposArticulosExecute(Sender: TObject);
begin
  AbreForm(TZFMTiposArticulo, ZFMTiposArticulo, Sender);
end;

procedure TFMain.ZALstTiempoMarcExecute(Sender: TObject);
begin
  AbreForm(TZFMLstTiempoMarc, ZFMLstTiempoMarc, Sender);
end;

procedure TFMain.ZAMarcManDirectoExecute(Sender: TObject);
begin
  AbreForm(TZFMMarcManDirecto, ZFMMarcManDirecto, Sender);
end;

procedure TFMain.ZALstFechaPrevProvExecute(Sender: TObject);
begin
  AbreForm(TZFMLstFechaPrevProv, ZFMLstFechaPrevProv, Sender);
end;

procedure TFMain.ZAConfiguracionExecute(Sender: TObject);
begin
  AbreForm(TZTyCFMConfiguracion, ZTyCFMConfiguracion, Sender);
end;

procedure TFMain.ZAConsultarTarifasModelosExecute(Sender: TObject);
begin
  AbreForm(TZFMConsultaTarifas, ZFMConsultaTarifas, Sender);
end;

procedure TFMain.APedidosVentaPendientesTyCExecute(Sender: TObject);
begin
  AbreForm(TZFPregPedPdte, ZFPregPedPdte, Sender);
end;

procedure TFMain.AListadoDeUnidadesPendientesDeServirTyCExecute(Sender: TObject);
begin
  AbreForm(TZFPregUnidadesPendientes, ZFPregUnidadesPendientes, Sender);
end;

procedure TFMain.AListadoDeStockMnimoTyCExecute(Sender: TObject);
begin
  AbreForm(TZFPregStockMinimo, ZFPregStockMinimo, Sender);
end;

procedure TFMain.ADespieceExecute(Sender: TObject);
begin
  AbreForm(TFMDespiece, FMDespiece, Sender);
end;

procedure TFMain.AEquivalenciaColoresExecute(Sender: TObject);
begin
  AbreForm(TFMEquivalenciaColores, FMEquivalenciaColores, Sender);
end;

procedure TFMain.AImprimeRecibosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMImprimeRecibos, FMImprimeRecibos, Sender);
end;

procedure TFMain.AOfertasANDALplastExecute(Sender: TObject);
begin
  AbreForm(TFMOfertaProd, FMOfertaProd, Sender);
  FMOfertaProd.FiltraOferta(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AMoldesExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMMoldes, FMMoldes, Sender);
end;

procedure TFMain.APostizosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMPostizos, FMPostizos, Sender);
end;

procedure TFMain.ALstCosteVentasMPExecute(Sender: TObject);
begin
  AbreForm(TFPregCosteVentasMP, FPregCosteVentasMP, Sender);
end;

procedure TFMain.ALstArticulosClienteExecute(Sender: TObject);
begin
  AbreForm(TFMLstArticulosCliente, FMLstArticulosCliente, Sender);
end;

procedure TFMain.AGestionDocumentosPagoExecute(Sender: TObject);
begin
  AbreForm(TFMGestionDocumentosPago, FMGestionDocumentosPago, Sender);
end;

procedure TFMain.AEnviarDatosPonysExecute(Sender: TObject);
begin
  // Habilitado mediante KRICONF_32
  AbreData(TDMExportarDatosPonys, DMExportarDatosPonys);
  // DMExportarDatosPonys.Exportar;
  DMExportarDatosPonys.ExportarPrestaShop;
  CierraData(DMExportarDatosPonys);
end;

procedure TFMain.AGaleriaImagenExecute(Sender: TObject);
begin
  AbreForm(TFMGaleriaImagen, FMGaleriaImagen, Sender);
  FMGaleriaImagen.FiltraGaleria(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AMarcaExecute(Sender: TObject);
begin
  AbreForm(TFMMarca, FMMarca, Sender);
end;

procedure TFMain.ALstMatPeligrosasExecute(Sender: TObject);
begin
  AbreForm(TFMLstMatPeligrosas, FMLstMatPeligrosas, Sender);
end;

procedure TFMain.AGestionTareasProduccionExecute(Sender: TObject);
begin
  AbreForm(TFMGestionTareasProduccion, FMGestionTareasProduccion, Sender);
end;

procedure TFMain.AExportacionEuroPastryExecute(Sender: TObject);
begin
  AbreForm(TFMExportacionEuroPastry, FMExportacionEuroPastry, Sender);
end;

procedure TFMain.MostrarFondo;
begin
  if not FFondo.Visible then
     AFondo.Execute;
end;

procedure TFMain.OcultarFondo;
begin
  if FFondo.Visible then
     AFondo.Execute;
end;

procedure TFMain.ADividirFacturasExecute(Sender: TObject);
begin
  AbreForm(TFMDivideFacturas, FMDivideFacturas, Sender);
end;

procedure TFMain.TVerificarServidorTimer(Sender: TObject);
{$IFDEF Debug}
var
  s : string;
  Signo : char;
{$ENDIF}
begin
  {$IFDEF Debug}
  s := '_/|_';
  TVerificarServidor.Tag := TVerificarServidor.Tag + 1;
  if (TVerificarServidor.Tag < 1) or (TVerificarServidor.Tag > Length(s)) then
     TVerificarServidor.Tag := 1;
  Signo := s[TVerificarServidor.Tag];

  if (DMMain.ServidorActivo) then
     UltimosPing := UltimosPing + Signo
  else
     UltimosPing := UltimosPing + 'X';

  if (Length(UltimosPing) > 10) then
     UltimosPing := copy(UltimosPing, 2, 10);

  PoneTituloAplicacion;
  Caption := Caption + '[' + UltimosPing + ']';

  try
  Caption := Caption + Format(' - Menu (%d,%d)x(%d,%d)', [FMMenu.Top, FMMenu.Left, FMMenu.Height, FMMenu.Width]);
  except
  end;
  {$ENDIF}
end;

procedure TFMain.AMemoriaContableExecute(Sender: TObject);
begin
  AbreForm(TFMMemoriaContable, FMMemoriaContable, Sender);
end;

procedure TFMain.AHojaDeTrabajoExecute(Sender: TObject);
begin
  AbreForm(TFMHojaDeTrabajo, FMHojaDeTrabajo, Sender);
end;

procedure TFMain.AFichaTecnicaExecute(Sender: TObject);
begin
  if (EnlaceModal) then
     CierraForm(FMFichaTecnica);

  AbreForm(TFMFichaTecnica, FMFichaTecnica, Sender);
  if ((not EnlaceModal) and (Assigned(FMFichaTecnica))) then
     FMFichaTecnica.FiltraFicha(FiltroAccion);

  FiltroAccion := '';
end;

procedure TFMain.AMarcasExecute(Sender: TObject);
begin
  AbreForm(TFMMarcas, FMMarcas, Sender);
end;

procedure TFMain.AExtraccionDatosExecute(Sender: TObject);
begin
  AbreForm(TFMExtraccionDatos, FMExtraccionDatos, Sender);
end;

procedure TFMain.ANecesidadMateraPrimaExecute(Sender: TObject);
begin
  AbreForm(TFMNecesidadMateraPrima, FMNecesidadMateraPrima, Sender);
end;

procedure TFMain.AParteMovimientoExecute(Sender: TObject);
begin
  AbreForm(TFMParteMovimiento, FMParteMovimiento, Sender);
end;

procedure TFMain.APedidosPendientesProv2Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMPedidosPendientesProv, FMPedidosPendientesProv, Sender);
end;

procedure TFMain.ARecibosdeIngresosDesglosadosExecute(Sender: TObject);
begin
  AbreForm(TFMRecibosDesglose, FMRecibosDesglose, Sender);
end;

procedure TFMain.ATipoModeloExecute(Sender: TObject);
begin
  AbreForm(TFMTipoModelo, FMTipoModelo, Sender);
end;

procedure TFMain.ARepartirHorasProyectoExecute(Sender: TObject);
begin
  AbreForm(TFMRepartirHorasProyecto, FMRepartirHorasProyecto);
end;

procedure TFMain.MGCalendarioClick(Sender: TObject);
begin
  {$IFDEF Debug}
  FMain.EjecutaAccion(AOpeCalendario);
  FMain.EjecutaAccion(AOpeCalendarioEmp);
  FMain.EjecutaAccion(ACalendarioZona);
  {$ENDIF}
end;

procedure TFMain.AKitTallasExecute(Sender: TObject);
begin
  AbreForm(TFMKitTallas, FMKitTallas, Sender);
end;

procedure TFMain.ASIIExecute(Sender: TObject);
begin
  AbreForm(TFMSII, FMSII, Sender);
end;

procedure TFMain.ATipoIncidenciaMaqExecute(Sender: TObject);
begin
  AbreForm(TFMTipoIncidenciaMaq, FMTipoIncidenciaMaq, Sender);
end;

procedure TFMain.ALSTIngresosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMLstDetalleIngresos, FMLstDetalleIngresos, Sender);
end;

procedure TFMain.AImprimeCartaPortesExecute(Sender: TObject);
begin
  AbreForm(TFMImprimeCartaPortes, FMImprimeCartaPortes, Sender);
end;

procedure TFMain.AAlquileresExecute(Sender: TObject);
begin
  AbreForm(TFMAlquiler, FMAlquiler, Sender);
  FMAlquiler.FiltraAlquiler(FiltroAccion);
  FiltroAccion := '';
end;

procedure TFMain.AMuestraMenuExecute(Sender: TObject);
begin
  with FMMenu do
  begin
     if Visible then
     begin
        Hide;
        AMuestraMenu.Caption := _('Muestra &Menu');
        AMuestraMenu.ImageIndex := 97;
        EscribeDatoIni('Datos', 'MenuVisible', 0);
     end
     else
     begin
        Show;
        SetFocus;
        AMuestraMenu.Caption := _('Oculta &Menu');
        AMuestraMenu.ImageIndex := 97;
        EscribeDatoIni('Datos', 'MenuVisible', 1);
     end;
  end;
end;

procedure TFMain.APeriodoFacturacionExecute(Sender: TObject);
begin
  AbreForm(TFMPeriodoFacturacion, FMPeriodoFacturacion, Sender);
end;

procedure TFMain.WMMove(var Msg: TWMMove);
begin
  // Fuerza al menu a estar debajo de FMain
  try
     if (Assigned(FMMenu)) then
        FMMenu.Posicionar;
     {
     if (Assigned(FFondo)) then
        FFondo.Posicionar;
     }
  except
  end;
end;

procedure TFMain.AContaGrupoCuentasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMGrupoCuentas, FMGrupoCuentas, Sender);
end;

procedure TFMain.AImportesMaximoPeriodoExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMImportesMaximoPeriodo, FMImportesMaximoPeriodo, Sender);
end;

procedure TFMain.ATipoIncidenciaRepExecute(Sender: TObject);
begin
  AbreForm(TFMTipoIncidenciaRep, FMTipoIncidenciaRep, Sender);
end;

procedure TFMain.ARutasAgenteExecute(Sender: TObject);
begin
  AbreForm(TCrmFMRutas, CrmFMRutas, Sender);
end;

procedure TFMain.ASesionCajaTurnoExecute(Sender: TObject);
begin
  AbreForm(TFMTPVSesionCajaTurno, FMTPVSesionCajaTurno, Sender);
end;

procedure TFMain.AVentasExecute(Sender: TObject);
begin
  AbreFormVarias(TFMTicketVenta, FMTicketVenta, Sender, False, TFMTicketVenta);
end;

procedure TFMain.ACajasEmpresaExecute(Sender: TObject);
begin
  AbreForm(TFMEmpCajas, FMEmpCajas, Sender);
end;

procedure TFMain.ACajasSistemaExecute(Sender: TObject);
begin
  AbreForm(TFMSysCajas, FMSysCajas, Sender);
end;

procedure TFMain.AFormaPagoTpvExecute(Sender: TObject);
begin
  AbreForm(TFMFormasPagoTpv, FMFormasPagoTpv, Sender);
end;

procedure TFMain.AFacturarTicketsExecute(Sender: TObject);
begin
  AbreForm(TFMFacturarTickets, FMFacturarTickets, Sender);
end;

procedure TFMain.AConfiguracionTPVExecute(Sender: TObject);
begin
  AbreForm(TFMConfiguracionTPV, FMConfiguracionTPV, Sender);
end;

procedure TFMain.ARegistroFitosanitarioExecute(Sender: TObject);
begin
  AbreForm(TFMRegistroFitosanitario, FMRegistroFitosanitario, Sender);
end;

procedure TFMain.APorcentajeFacturacionExecute(Sender: TObject);
begin
  AbreForm(TFMFacturacionCanal, FMFacturacionCanal, Sender);
end;

procedure TFMain.AOpeEstadoMarcajePedidoExecute(Sender: TObject);
begin
  AbreForm(TOpeFMEstadoMarcajePedido, OpeFMEstadoMarcajePedido, Sender);
end;

procedure TFMain.ANumerosDeAutorizacionExecute(Sender: TObject);
begin
  AbreForm(TFMNumerosDeAutorizacion, FMNumerosDeAutorizacion, Sender);
end;

procedure TFMain.AADRUNNumbersExecute(Sender: TObject);
begin
  AbreForm(TFMADRUNNumbers, FMADRUNNumbers, Sender);
end;

procedure TFMain.AADRClasesExecute(Sender: TObject);
begin
  AbreForm(TFMADRClases, FMADRClases, Sender);
end;

procedure TFMain.AADRPackingGroupsExecute(Sender: TObject);
begin
  AbreForm(TFMADRPackingGroups, FMADRPackingGroups, Sender);
end;

procedure TFMain.AADRTunelCodesExecute(Sender: TObject);
begin
  AbreForm(TFMADRTunelCodes, FMADRTunelCodes, Sender);
end;

procedure TFMain.AADRTiposExecute(Sender: TObject);
begin
  AbreForm(TFMADRTipos, FMADRTipos, Sender);
end;

procedure TFMain.ATPVSincronizacionExecute(Sender: TObject);
begin
  AbreForm(TFMTPVSincronizacion, FMTPVSincronizacion, Sender);
end;

procedure TFMain.ATPVConfigSincronizacionExecute(Sender: TObject);
begin
  AbreForm(TFMTPVConfSincronizacion, FMTPVConfSincronizacion, Sender);
end;

procedure TFMain.APedidosPendientesCliExecute(Sender: TObject);
begin
  AbreForm(TFMPedidosPendientesCli, FMRelacionPedidosVenta, Sender);
end;

procedure TFMain.AListarEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Sender);
end;

procedure TFMain.ACuotasClientesExecute(Sender: TObject);
begin
  AbreForm(TFMClienteCuotas, FMClienteCuotas, Sender);
end;

procedure TFMain.AExportacionHeliosExecute(Sender: TObject);
begin
  AbreForm(TFMExportacionHelios, FMExportacionHelios, Sender);
end;

procedure TFMain.AImportacionVendingExecute(Sender: TObject);
begin
  AbreForm(TFMImportacionVending, FMImportacionVending, Sender);
end;

procedure TFMain.AMaquinasVendingExecute(Sender: TObject);
begin
  AbreForm(TFMMaquinasVending, FMMaquinasVending, Sender);
end;

procedure TFMain.AUbicacionesSimpleExecute(Sender: TObject);
begin
  AbreForm(TFMUbicacionesSimple, FMUbicacionesSimple, Sender);
end;

procedure TFMain.AModelo390Execute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFPregModelo390, FPregModelo390, Sender);
end;

procedure TFMain.ALstCalendarioLaboralExecute(Sender: TObject);
begin
  AbreForm(TProFMLstCalendarioLaboral, ProFMLstCalendarioLaboral, Sender);
end;

procedure TFMain.AAuditoriaExecute(Sender: TObject);
begin
  AbreForm(TFMAuditoria, FMAuditoria, Sender);
end;

procedure TFMain.ACategoriaClienteExecute(Sender: TObject);
begin
  AbreForm(TFMCategoriaCliente, FMCategoriaCliente, Sender);
end;

procedure TFMain.AAsistenteImpClientesExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteImpClientes, FMAsistenteImpClientes, Sender);
end;

procedure TFMain.AAsistenteImpProveedoresExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteImpProveedores, FMAsistenteImpProveedores, Sender);
end;

procedure TFMain.AAsistenteImpAcreedoresExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteImpAcreedores, FMAsistenteImpAcreedores, Sender);
end;

procedure TFMain.AAsistenteImpArticulosExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteImpArticulos, FMAsistenteImpArticulos, Sender);
end;

procedure TFMain.TVerificarImpresoraTimer(Sender: TObject);
begin
  /// Refresco los datos de impresoras del sistema.
  /// Se hace desupues de cierto tiempo de ejecutcion para esperar a que el sistema detecte las impresoras.
  /// Es necesario en Escritorio remoto, donde el cliente tarda en conectar todas sus impresoras al servidor.

  with TVerificarImpresora do
  begin
     Enabled := False;
     try
        ARefrescarImpresoras.Execute;

        // Incremento un segundo de espera
        Interval := Interval + 1000;
     finally
        // Esto es para que deje de verificar después de 3 veces. (30 segundos aprox.)
        Enabled := (Interval < 13000);
     end;
  end;
end;

procedure TFMain.ARefrescarImpresorasExecute(Sender: TObject);
var
  i : integer;
  NewItem : TMenuItem;
  ImpresoraDefecto : string;
  LaserSeleccionada, EtiquetaSeleccionada, MatricialSeleccionada : boolean;
begin
  ImpresoraDefecto := _('Sin impresora por defecto');
  if (Printer.Printers.Count > 0) then
     ImpresoraDefecto := Printer.Printers[Printer.PrinterIndex];
  {
  DMMain.Log(format('Impresora Defecto: %s', [ImpresoraDefecto]));
  DMMain.Log(format('Laser: %s', [REntorno.NombreLaser]));
  DMMain.Log(format('Etiquetas: %s', [REntorno.NombreEtiquetas]));
  DMMain.Log(format('Matricial: %s', [REntorno.NombreMatricial]));
  }
  LaserSeleccionada := False;
  EtiquetaSeleccionada := False;
  MatricialSeleccionada := False;

  MGLaser.Clear;
  MGEtiquetas.Clear;
  MGMatricial.Clear;

  // Inserto nuevamente el Menu "Refrescar Lista".
  NewItem := TMenuItem.Create(MGLaser);
  NewItem.Action := ARefrescarImpresoras;
  NewItem.OnDrawItem := OwnerDrawMenuItem;
  NewItem.OnMeasureItem := MeasureMenuItem;
  MGLaser.Add(NewItem);

  NewItem := TMenuItem.Create(MGEtiquetas);
  NewItem.Action := ARefrescarImpresoras;
  NewItem.OnDrawItem := OwnerDrawMenuItem;
  NewItem.OnMeasureItem := MeasureMenuItem;
  MGEtiquetas.Add(NewItem);

  NewItem := TMenuItem.Create(MGMatricial);
  NewItem.Action := ARefrescarImpresoras;
  NewItem.OnDrawItem := OwnerDrawMenuItem;
  NewItem.OnMeasureItem := MeasureMenuItem;
  MGMatricial.Add(NewItem);

  // Cargamos el Menu de impresoras
  for i := 0 to Printer.Printers.Count - 1 do
  begin
     // DMMain.Log(format('MenuItem Impresora %d: %s', [i, Printer.Printers[i]]));
     NewItem := TMenuItem.Create(MGLaser);
     try
        NewItem.Caption := '&' + IntToStr(i) + ' ' + Printer.Printers[i];
        // Debido a que en Escritorio remoto las impresoras aparece como "EPSON LX810 (redirected 123)" debemos comparar solo hasta el (.
        // Marcar como seleccionada si Contiene ( y el nombre de impresora coincide parcialmente o si la impresora no contiene ( en el nombre.

        if (Pos('(', Printer.Printers[i]) = 0) and (Pos('#', Printer.Printers[i]) = 0) then
           NewItem.Checked := (Pos(REntorno.NombreLaser, Printer.Printers[i]) > 0)
        else
        if (Pos('(', Printer.Printers[i]) > 0) then
           NewItem.Checked := ((Pos(REntorno.NombreLaser, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreLaser) > 0)) or ((Pos(REntorno.NombreLaser, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreLaser) = 0) and (Pos('(', Printer.Printers[i]) = 0))
        else
        if (Pos('#', Printer.Printers[i]) > 0) then
           NewItem.Checked := ((Pos(REntorno.NombreLaser, Printer.Printers[i]) > 0) and (Pos('#', REntorno.NombreLaser) > 0)) or ((Pos(REntorno.NombreLaser, Printer.Printers[i]) > 0) and (Pos('#', REntorno.NombreLaser) = 0) and (Pos('#', Printer.Printers[i]) = 0));

        if NewItem.Checked then
        begin
           // DMMain.Log('[x] Laser seleccinada');
           REntorno.Laser := i;
        end;
        LaserSeleccionada := (LaserSeleccionada or NewItem.Checked);
        NewItem.Tag := i;
        NewItem.OnDrawItem := OwnerDrawMenuItem;
        NewItem.OnMeasureItem := MeasureMenuItem;
        NewItem.OnClick := MIImpresoraLaserClick;
        NewItem.Hint := Caption;
        MGLaser.Add(NewItem);
     except
        NewItem.Free;
        raise;
     end;

     NewItem := TMenuItem.Create(MGEtiquetas);
     try
        NewItem.Caption := '&' + IntToStr(i) + ' ' + Printer.Printers[i];
        // Debido a que en Escritorio remoto las impresoras aparece como "EPSON LX810 (redirected 123)" debemos comparar solo hasta el (.
        // Marcar como seleccionada si Contiene ( y el nombre de impresora coincide parcialmente o si la impresora no contiene ( en el nombre.
        NewItem.Checked := ((Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreEtiquetas) > 0)) or ((Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreEtiquetas) = 0) and (Pos('(', Printer.Printers[i]) = 0));

        if (Pos('(', Printer.Printers[i]) = 0) and (Pos('#', Printer.Printers[i]) = 0) then
           NewItem.Checked := (Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0)
        else
        if (Pos('(', Printer.Printers[i]) > 0) then
           NewItem.Checked := ((Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreEtiquetas) > 0)) or ((Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreEtiquetas) = 0) and (Pos('(', Printer.Printers[i]) = 0))
        else
        if (Pos('#', Printer.Printers[i]) > 0) then
           NewItem.Checked := ((Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0) and (Pos('#', REntorno.NombreEtiquetas) > 0)) or ((Pos(REntorno.NombreEtiquetas, Printer.Printers[i]) > 0) and (Pos('#', REntorno.NombreEtiquetas) = 0) and (Pos('#', Printer.Printers[i]) = 0));

        if NewItem.Checked then
        begin
           // DMMain.Log('[x] Etiquetas seleccinada');
           REntorno.Etiquetas := i;
           REntorno.NombreEtiquetasCompleto := Printer.Printers[i];
        end;
        EtiquetaSeleccionada := (EtiquetaSeleccionada or NewItem.Checked);
        NewItem.Tag := i;
        NewItem.OnDrawItem := OwnerDrawMenuItem;
        NewItem.OnMeasureItem := MeasureMenuItem;
        NewItem.OnClick := MIImpresoraEtiquetasClick;
        NewItem.Hint := Caption;
        MGEtiquetas.Add(NewItem);
     except
        NewItem.Free;
        raise;
     end;

     NewItem := TMenuItem.Create(MGMatricial);
     try
        NewItem.Caption := '&' + IntToStr(i) + ' ' + Printer.Printers[i];
        // Debido a que en Escritorio remoto las impresoras aparece como "EPSON LX810 (redirected 123)" debemos comparar solo hasta el (.
        // Marcar como seleccionada si Contiene ( y el nombre de impresora coincide parcialmente o si la impresora no contiene ( en el nombre.
        if (Pos('(', Printer.Printers[i]) = 0) and (Pos('#', Printer.Printers[i]) = 0) then
           NewItem.Checked := (Pos(REntorno.NombreMatricial, Printer.Printers[i]) > 0)
        else
        if (Pos('(', Printer.Printers[i]) > 0) then
           NewItem.Checked := ((Pos(REntorno.NombreMatricial, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreMatricial) > 0)) or ((Pos(REntorno.NombreMatricial, Printer.Printers[i]) > 0) and (Pos('(', REntorno.NombreMatricial) = 0) and (Pos('(', Printer.Printers[i]) = 0))
        else
        if (Pos('#', Printer.Printers[i]) > 0) then
           NewItem.Checked := ((Pos(REntorno.NombreMatricial, Printer.Printers[i]) > 0) and (Pos('#', REntorno.NombreMatricial) > 0)) or ((Pos(REntorno.NombreMatricial, Printer.Printers[i]) > 0) and (Pos('#', REntorno.NombreMatricial) = 0) and (Pos('#', Printer.Printers[i]) = 0));

        if NewItem.Checked then
        begin
           // DMMain.Log('[x] Matricial seleccinada');
           REntorno.Matricial := i;
        end;
        MatricialSeleccionada := (MatricialSeleccionada or NewItem.Checked);
        NewItem.Tag := i;
        NewItem.OnDrawItem := OwnerDrawMenuItem;
        NewItem.OnMeasureItem := MeasureMenuItem;
        NewItem.OnClick := MIImpresoraMatricialClick;
        NewItem.Hint := Caption;
        MGMatricial.Add(NewItem);
     except
        NewItem.Free;
        raise;
     end;
  end;

  ARefrescarBandejasExecute(Sender);
end;

procedure TFMain.ARefrescarBandejasExecute(Sender: TObject);
var
  NewItem : TMenuItem;
  i : integer;
begin
  MGBandejaLaser.Clear;

  try
     if (REntorno.Laser >= 0) then
     begin
        for i := 0 to frxPrinters.Items[REntorno.Laser].Bins.Count - 1 do
        begin
           NewItem := TMenuItem.Create(MGBandejaLaser);
           try
              NewItem.Caption := '&' + IntToStr(i) + ' ' + frxPrinters.Items[REntorno.Laser].Bins[i];
              NewItem.Tag := i;
              NewItem.Checked := (NewItem.Tag = REntorno.BandejaLaser);
              NewItem.OnDrawItem := OwnerDrawMenuItem;
              NewItem.OnMeasureItem := MeasureMenuItem;
              NewItem.OnClick := MIBandejaLaserClick;
              NewItem.Hint := frxPrinters.Items[REntorno.Laser].Bins[i];
              MGBandejaLaser.Add(NewItem);
           except
              NewItem.Free;
              raise;
           end;
        end;
     end;
  except
  end;
end;

procedure TFMain.APruebasExecute(Sender: TObject);
begin
  {$IFDEF Debug}
  if Dentro then
     AbreForm(TFMPruebas, FMPruebas, Sender);
  {$ENDIF}
end;

procedure TFMain.AExportacionTyrsaExecute(Sender: TObject);
begin
  AbreForm(TFMExportacionTyrsa, FMExportacionTyrsa, Sender);
end;

procedure TFMain.ARecalculaContabilidadExecute(Sender: TObject);
begin
  CierraForms;
  with TFMRecalculaConta.Create(Self) do
  begin
     ShowModal;
     Free;
  end;
end;

procedure TFMain.AFiltroAlbaranesCompraExecute(Sender: TObject);
begin
  AbreForm(TFMFiltroAlbaranesCompra, FMFiltroAlbaranesCompra, Sender);
end;

procedure TFMain.ARegionesExecute(Sender: TObject);
begin
  AbreForm(TFMRegiones, FMRegiones, Sender);
end;

procedure TFMain.APoblacionesExecute(Sender: TObject);
begin
  AbreForm(TFMPoblaciones, FMPoblaciones, Sender);
end;

procedure TFMain.AImportacionDliveryExecute(Sender: TObject);
begin
  AbreForm(TFMImportacionDlivery, FMImportacionDlivery, Sender);
end;

procedure TFMain.AImportacionMultyExecute(Sender: TObject);
begin
  AbreForm(TFMImportacionMulty, FMImportacionMulty, Sender);
end;

procedure TFMain.ACrmAsuntosExecute(Sender: TObject);
begin
  AbreForm(TCrmFMAsuntos, CrmFMAsuntos, Sender);
end;

procedure TFMain.AAtributosExecute(Sender: TObject);
begin
  AbreForm(TFMAtributos, FMAtributos, Sender);
end;

procedure TFMain.ASincronizacionEginerExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionEginer, FMSincronizacionEginer, Sender);

  // Solo actualiza stock
  if (FiltroAccion = 'sinc') then
     FMSincronizacionEginer.SincronizarcionAutomatica;

  FiltroAccion := '';
end;

procedure TFMain.ATipoImpuestoAdicionalExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTipoImpuestoAdicional, FMTipoImpuestoAdicional, Sender);
end;

procedure TFMain.ASIICertificadoDigitalExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMSIICertificados, FMSIICertificados, Sender);
end;

procedure TFMain.ASIIFoliosExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMSIIFolios, FMSIIFolios, Sender);
end;

procedure TFMain.ASIIUrlEndpointExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMSIIUrlEndpoint, FMSIIUrlEndpoint, Sender);
end;

procedure TFMain.AArtModGeneroExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMGeneroTallas, FMGeneroTallas, Sender);
end;

procedure TFMain.AArtModTemporadaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMTemporadaTallas, FMTemporadaTallas, Sender);
end;

procedure TFMain.AAsistenteImpModelosExecute(Sender: TObject);
begin
  AbreForm(TFMAsistenteImpModelos, FMAsistenteImpModelos, Sender);
end;

procedure TFMain.AListarCuadreCajaExecute(Sender: TObject);
begin
  AbreForm(TFPregCuadreCaja, FPregCuadreCaja, Sender);
end;

procedure TFMain.ATiposBultoExecute(Sender: TObject);
begin
  AbreForm(TFMTiposBulto, FMTiposBulto, Sender);
end;

procedure TFMain.AReestablecerConexionesWEBExecute(Sender: TObject);
begin
  DMMain.ReestablecerConexiones('ROL_WEB');
end;

procedure TFMain.ATipoReparacionExecute(Sender: TObject);
begin
  AbreForm(TFMTiposReparacion, FMTiposReparacion, Sender);
end;

procedure TFMain.ATipoActuacionExecute(Sender: TObject);
begin
  AbreForm(TFMTiposActuacion, FMTiposActuacion, Sender);
end;

procedure TFMain.AServirPedidosVentaExecute(Sender: TObject);
begin
  AbreForm(TFMServirPedidosVenta, FMServirPedidosVenta, Sender);
end;

procedure TFMain.AEnvioDTEExecute(Sender: TObject);
begin
  AbreForm(TFMEnviaXmlFacturasChl, FMEnviaXmlFacturasChl, Sender);

  if (FiltroAccion <> '') then
     FMEnviaXmlFacturasChl.PosicionaDocumento(StrToIntDef(FiltroAccion, 0));
  FiltroAccion := '';
end;

procedure TFMain.APrevisionDeCuentasExecute(Sender: TObject);
begin
  AbreForm(TFMPrevisionCuentas, FMPrevisionCuentas, Sender);
end;

function TFMain.FormularioEmpleadoHabilitado: boolean;
begin
  /// Devuelve True si el usuario puede ir a Empleados -> Empleados.

  Result := (Assigned(AOpeEmpleados) and AOpeEmpleados.Enabled and AOpeEmpleados.Visible);
end;

procedure TFMain.ADatosTecnicosExecute(Sender: TObject);
begin
  AbreForm(TFMDatosTecnicos, FMDatosTecnicos, Sender);
end;

procedure TFMain.ASIILROEExecute(Sender: TObject);
begin
  AbreForm(TFMSIILROE, FMSIILROE, Sender);
end;

procedure TFMain.ACilindrosExecute(Sender: TObject);
begin
  AbreForm(TFMCilindros, FMCilindros, Sender);
end;

procedure TFMain.AEstadisticaTubosParisExecute(Sender: TObject);
begin
  AbreForm(TFMEstadisticaTubosParis, FMEstadisticaTubosParis, Sender);
end;

procedure TFMain.ANominasExecute(Sender: TObject);
begin
  AbreForm(TFMNominasCabecera, FMNominasCabecera, Sender);
  if (FiltroAccion <> '') then
  begin
     FMNominasCabecera.Filtrar(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.ANominasConceptosExecute(Sender: TObject);
begin
  AbreForm(TFMNomConceptos, FMNomConceptos, Sender);
  if (FiltroAccion <> '') then
  begin
     FMNomConceptos.Filtrar(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.ARHPersonaExecute(Sender: TObject);
begin
  AbreForm(TFMRHPersona, FMRHPersona, Sender);
  if (FiltroAccion <> '') then
  begin
     FMRHPersona.Filtrar(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AEstadisitcasComparadasExecute(Sender: TObject);
begin
  AbreForm(TFMEstadisticasComparadas, FMEstadisticasComparadas, Sender);
end;

procedure TFMain.AEtiColorExecute(Sender: TObject);
begin
  AbreForm(TFMEtiColor, FMEtiColor, Sender);
end;

procedure TFMain.AEtiAniloxExecute(Sender: TObject);
begin
  AbreForm(TFMEtiAnilox, FMEtiAnilox, Sender);
end;

// Servir Ofertas por Líneas
procedure TFMain.AAgrupacionOfertasExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMAgrupacionOfertasVentas, FMAgrupacionOfertasVentas, Sender);
end;

procedure TFMain.ARCVCompraExecute(Sender: TObject);
begin
  AbreForm(TFMRCVCompra, FMRCVCompra, Sender);
end;

procedure TFMain.ALoteSimpleExecute(Sender: TObject);
begin
  AbreForm(TFMLotesimple, FMLotesimple, Sender);
end;

procedure TFMain.AAsistenteImpStockMinMaxExecute(Sender: TObject);
begin
  FMAsistenteImpStockMinMax := TFMAsistenteImpStockMinMax.Create(Self);
  try
     FMAsistenteImpStockMinMax.ShowModal;
  finally
     FMAsistenteImpStockMinMax.Free;
     FMAsistenteImpStockMinMax := nil;
  end;
end;

procedure TFMain.AEmpresasChileExecute(Sender: TObject);
begin
  AbreForm(TFMEmpresasChile, FMEmpresasChile, Sender);
end;

procedure TFMain.AIncidenciasMarcajesExecute(Sender: TObject);
begin
  AbreForm(TFMIncidenciasMarcajes, FMIncidenciasMarcajes, Sender);
end;

procedure TFMain.ASIIConfCorreosExecute(Sender: TObject);
begin
  AbreForm(TFMSiiConfiguracionCorreo, FMSiiConfiguracionCorreo, Sender);
end;

procedure TFMain.AProTareasExternasExecute(Sender: TObject);
begin
  AbreForm(TFMTareasExternas, FMTareasExternas, Sender);
end;

procedure TFMain.AGenerarFacturasElectronicasESExecute(Sender: TObject);
begin
  AbreForm(TFMGenFacturaElec, FMGenFacturaElec, Sender);
end;

procedure TFMain.ASIITipoDTEExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMSIITipoDTE, FMSIITipoDTE, Sender);
end;

procedure TFMain.AEscandalloGarantiasExecute(Sender: TObject);
begin
  AbreForm(TFMEscandalloGarantias, FMEscandalloGarantias, Sender);
end;

procedure TFMain.AAsignacionGarantiasExecute(Sender: TObject);
begin
  AbreForm(TFMAsignacionDeGarantias, FMAsignacionDeGarantias, Sender);
end;

procedure TFMain.ANominasConstantesExecute(Sender: TObject);
begin
  AbreForm(TFMNomConstantes, FMNomConstantes, Sender);

  if (FiltroAccion <> '') then
  begin
     FMNomConstantes.Filtrar(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.ANominasConceptosCHLExecute(Sender: TObject);
begin
  AbreForm(TFMNomConceptosCHL, FMNomConceptosCHL, Sender);
end;

procedure TFMain.ANominasPlantillaExecute(Sender: TObject);
begin
  AbreForm(TFMNominasPlantillas, FMNominasPlantillas, Sender);
end;

procedure TFMain.AJornadaExecute(Sender: TObject);
begin
  AbreForm(TFMJornada, FMJornada, Sender);
end;

procedure TFMain.ARecepcionFichaTecnicaExecute(Sender: TObject);
begin
  AbreForm(TFMRecepcionFichaTecnica, FMRecepcionFichaTecnica, Sender);
  if (FiltroAccion <> '') then
  begin
     FMRecepcionFichaTecnica.FiltraFicha(FiltroAccion);
     FiltroAccion := '';
  end;
end;

procedure TFMain.AMotivosAbonoExecute(Sender: TObject);
begin
  AbreForm(TFMMotivosAbono, FMMotivosAbono, Sender);
end;

procedure TFMain.AModelo592Execute(Sender: TObject);
begin
  AbreForm(TFMIEPNR, FMIEPNR, Sender);
end;

procedure TFMain.APrecioReposicionExecute(Sender: TObject);
begin
  AbreForm(TFMPrecioReposicion, FMPrecioReposicion, Sender);
end;

procedure TFMain.AGamasPrecioReposicionExecute(Sender: TObject);
begin
  AbreForm(TFMGamaPrecioReposicion, FMGamaPrecioReposicion, Sender);
end;

procedure TFMain.ADashboardExecute(Sender: TObject);
begin
  AbreForm(TFMDashboard, FMDashboard, Sender);
end;

procedure TFMain.ABrevoExecute(Sender: TObject);
begin
  AbreForm(TFMBrevo, FMBrevo, Sender);
end;

procedure TFMain.AAdjuntosExecute(Sender: TObject);
begin
  AbreForm(TFMAdjunto, FMAdjunto, Sender);
end;

procedure TFMain.MuestraAdunto(Tipo: string; Id: integer);
begin
  AAdjuntos.Execute;
  FMAdjunto.Muestra(Tipo, Id);
end;

procedure TFMain.AImportarEscProduccionExecute(Sender: TObject);
begin
  AbreForm(TFMImportarEscProduccion, FMImportarEscProduccion, Sender);
end;

procedure TFMain.AComoNosConocieronExecute(Sender: TObject);
begin
  AbreForm(TFMComoNosConocieron, FMComoNosConocieron, Sender);
end;

procedure TFMain.AImportacionTarifasTyCExecute(Sender: TObject);
begin
  AbreForm(TFMImpTarifasTyC, FMImpTarifasTyC, Sender);
end;

procedure TFMain.ASincronizacionSkritExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionSkrit, FMSincronizacionSkrit, Sender);
end;

procedure TFMain.ASincronizacionColonExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionColon, FMSincronizacionColon, Sender);
end;

procedure TFMain.AVerifactuExecute(Sender: TObject);
begin
  AbreForm(TFMVerifactu, FMVerifactu, Sender);
end;

procedure TFMain.AECFVentasExecute(Sender: TObject);
begin
  AbreForm(TFMECFVentas, FMECFVentas, Sender);
end;

procedure TFMain.AECFComprasExecute(Sender: TObject);
begin
  AbreForm(TFMECFCompras, FMECFCompras, Sender);
end;

procedure TFMain.ADGIIConfiguracionEnvioExecute(Sender: TObject);
begin
  AbreForm(TFMDGIIConfEnvio, FMDGIIConfEnvio, Sender);
end;

procedure TFMain.AEstadisticasSimplesExecute(Sender: TObject);
begin
  AbreForm(TFMEstadisticasSimples, FMEstadisticasSimples, Sender);
end;

procedure TFMain.ADiarioReparacionesExecute(Sender: TObject);
begin
  AbreForm(TFMDiarioReparaciones, FMDiarioReparaciones, Sender);

  if (FiltroAccion = 'ReporteInformeCaja') then
     FMDiarioReparaciones.ReporteInformeCaja;
  if (FiltroAccion = 'ReporteDiarioFacturacion') then
     FMDiarioReparaciones.ReporteDiarioFacturacion;
  if (FiltroAccion = 'ReporteTrazabilidadCompras') then
     FMDiarioReparaciones.ReporteTrazabilidadCompras;

  FiltroAccion := '';
end;

procedure TFMain.ASincronizacionTyCExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionTyC, FMSincronizacionTyC, Sender);
end;

procedure TFMain.StatBarMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  Minutos : integer;
  Fecha : TDateTime;
begin
  // Colorea panel Verifactu
  if (Panel.Index = 5) then
  begin
     if (REntorno.Pais = 'ESP') and AVerifactu.Visible then
     begin
        Fecha := DMMain.FechaServicioPresentacionVerifactu;
        Minutos := MinutesBetween(Now, Fecha);
        if Minutos > 1 then
        begin
           with StatusBar.Canvas do
           begin
              Brush.Color := clRed;
              FillRect(Rect);
              Font.Color := clWhite;
              Font.Style := [fsBold];
              TextOut(Rect.Left, Rect.Top, _('Servicio Verifactu') + ' - ' + _('Inctivo') + ' ' + FormatDateTime('hh:nn:ss', Fecha));
           end;
        end
        else
        begin
           with StatusBar.Canvas do
           begin
              Brush.Color := clLime;
              FillRect(Rect);
              Font.Color := clBlack;
              Font.Style := [];
              TextOut(Rect.Left, Rect.Top, _('Servicio Verifactu') + ' - ' + _('Activo'));
           end;
        end;
     end;
  end;
end;

procedure TFMain.TmrVerificaVerifactuTimer(Sender: TObject);
begin
  TmrVerificaVerifactu.Enabled := False;
  try
     StatBarMain.RePaint;
  finally
     TmrVerificaVerifactu.Enabled := True;
  end;
end;

procedure TFMain.ASMSPubliExecute(Sender: TObject);
begin
  AbreForm(TFMSMSPubli, FMSMSPubli, Sender);
end;

procedure TFMain.ADiviloExecute(Sender: TObject);
begin
  AbreForm(TFMDivilo, FMDivilo, Sender);
end;

procedure TFMain.APresenciaFicharExecute(Sender: TObject);
begin
  AbreForm(TFMPresenciaFichar, FMPresenciaFichar, Sender);
end;

procedure TFMain.AConfigServidoresCorreoExecute(Sender: TObject);
begin
  AbreForm(TFMConfiguracionServidorCorreo, FMConfiguracionServidorCorreo, Sender);
end;

procedure TFMain.ASincronizacionHubSpotExecute(Sender: TObject);
begin
  AbreForm(TFMSincronizacionHubSpot, FMSincronizacionHubSpot, Sender);
end;

procedure TFMain.AAgendaExecute(Sender: TObject);
begin
  if EstructuraCreada then
     AbreForm(TFMAgenda, FMAgenda, Sender);
end;

procedure TFMain.ACaracteristicasArticuloExecute(Sender: TObject);
begin
  AbreForm(TFMCaracteristicasArticulo, FMCaracteristicasArticulo, Sender);
end;

end.
