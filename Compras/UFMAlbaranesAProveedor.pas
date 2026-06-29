unit UFMAlbaranesAProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada,
  DbComboBoxValue, ActnList, UFormGest, Variants, DB, rxPlacemnt, NsDBGrid,
  rxToolEdit, RXDBCtrl, ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo,
  ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000,
  ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, URecursos,
  HYFIBQuery, ULFDBDateEdit, ULFMemo, ULFEdit, UFPEditDetalle, UG2kTBLoc;

type
  TFMAlbaranesAProveedor = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PNLCabNotas: TLFPanel;
     LBLAlbaran: TLFLabel;
     DBERIG: TLFDbedit;
     LBLEstado: TLFLabel;
     LBLFechaFicha: TLFLabel;
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
     DBETituloAlmacen: TLFDbedit;
     LBLAlmacen: TLFLabel;
     DBETituloProveedor: TLFDbedit;
     DBEFProveedor: TLFDBEditFind2000;
     DBENumAlbaran: TLFDbedit;
     LBLNAlbaran: TLFLabel;
     ALAlbaranProv: TLFActionList;
     AUnidades_Ext: TAction;
     APreciosTarifa: TAction;
     LBLFormaPago: TLFLabel;
     DBEFFormasPago: TLFDBEditFind2000;
     DBEFormasPago: TLFDbedit;
     AInfoStocks: TAction;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PNLPieGenerico: TLFPanel;
     LBLBaseImp: TLFLabel;
     LBLCuotas: TLFLabel;
     LBLLiquido: TLFLabel;
     DBES_Bases: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBELiquido: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PNLPieComisiones: TLFPanel;
     LBLBaseDtoCargos: TLFLabel;
     LBLImporteCargos: TLFLabel;
     LBLImpBase: TLFLabel;
     LImpFinanciacion: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBESumaBases: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     ToolButton2: TToolButton;
     TButtUnidades_Ext: TToolButton;
     TButtInfoStocks: TToolButton;
     TButtSep2: TToolButton;
     TButtImprimeListado: TToolButton;
     LBLSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtSerializacion: TToolButton;
     ASerializacion: TAction;
     TButtNotas: TToolButton;
     ANotaDetalle: TAction;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     TButtSep7: TToolButton;
     TButtBuscarNumSerie: TToolButton;
     ABuscarNumSerie: TAction;
     DBETituloEstado: TLFDbedit;
     AInfoHistorico: TAction;
     TButtInfoHistorico: TToolButton;
     TButtPrecios: TToolButton;
     ANewProveedor: TAction;
     ANewArticulo: TAction;
     AAProveedor: TAction;
     SBAProveedor: TSpeedButton;
     AImprime: TAction;
     MISepEnlaces: TMenuItem;
     MIVerDatosProveedor: TMenuItem;
     AInfoLotes: TAction;
     ToolButton1: TToolButton;
     TBInfolotes: TToolButton;
     AArticulo: TAction;
     ToolButton4: TToolButton;
     AArticuloProv: TAction;
     TBArtProv: TToolButton;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     LBLNumAlbaranNotas: TLFLabel;
     DBENotasNumAlbaranCab: TLFDbedit;
     AInformeAlbaran: TAction;
     AVisualizarAlbaranesFiltrados: TAction;
     AImprimirAlbaranesFiltrados: TAction;
     ASep: TAction;
     AResumenAlbaranes: TAction;
     AResumenAlbaranesFiltrados: TAction;
     AImpresionResumenAlbaranesFiltrados: TAction;
     ASep2: TAction;
     AListadoCodigosBarras: TAction;
     ASep3: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfInfAlbaranes: TAction;
     AConfListadoResumenAlbaranes: TAction;
     AConfListadoCBarras: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AFactura: TAction;
     ASep4: TAction;
     ADuplicar: TAction;
     ARegenerarCond: TAction;
     AAnulaDocumento: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AHerencia: TAction;
     AHistoricoSerializacion: TAction;
     LFCategoryAction4: TLFCategoryAction;
     LBLTotal: TLFLabel;
     DBETotal: TLFDbedit;
     TButtUbicaciones: TToolButton;
     AUbicaciones: TAction;
     AEnviarAlbaranMailPDF: TAction;
     ALstUbicaciones: TAction;
     AConfListadoUbicaciones: TAction;
     ASep5: TAction;
     ANIFAlbaran: TAction;
     TButtProcedenciaLinea: TToolButton;
     AProcedencia: TAction;
     LBTPortes: TLFLabel;
     ETituloPortes: TLFEdit;
     DBEFPortes: TLFDBEditFind2000;
     DBEPorPortes: TLFDbedit;
     DBEIPortes: TLFDbedit;
     LBPorPortes: TLFLabel;
     LBIPOrtes: TLFLabel;
     AOrdenaLineas: TAction;
     AAlbaranMulti: TAction;
     LBReferencia: TLFLabel;
     DBEReferencia: TLFDbedit;
     TButtHerencia: TToolButton;
     ABuscarArticulos: TAction;
     ToolButton6: TToolButton;
     TButtBuscarArticulo: TToolButton;
     LFCategoryAction5: TLFCategoryAction;
     AAdjuntosAlbaran: TAction;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     AEnviarAlbaranMailPDF2: TAction;
     LOrden: TLFLabel;
     LFDBOrden: TLFDbedit;
     SBAIdOrden: TSpeedButton;
     AIDOrden: TAction;
     DBEIrpf: TLFDbedit;
     LBLIRPF: TLFLabel;
     DBESumUnidades: TLFDbedit;
     LBLUnidades: TLFLabel;
     LTelefono: TLFLabel;
     TButtCondicionesCompra: TToolButton;
     ACondicionesCompra: TAction;
     DBCHKListado: TLFDBCheckBox;
     AAsientoDeInventarioPermanente: TAction;
     AListarEtiquetas: TAction;
     ToolButton7: TToolButton;
     TButtImpProduccion: TToolButton;
     AImpProduccion: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     DBCBValorado: TLFDBCheckBox;
     LFDBChkDevolucion: TLFDBCheckBox;
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
     NavOtros: THYMNavigator;
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
     LFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     LBLProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     LBMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     ETitMoneda: TLFEdit;
     DBCHKCambio: TLFDBCheckBox;
     LValorCambio: TLFLabel;
     DBEValorCambio: TLFDbedit;
     LTipoIRPF: TLFLabel;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBETitTIPOIRPF: TLFDbedit;
     DBEAplicarIRPF: TLFDbedit;
     DBEPirpf: TLFDbedit;
     LBLIRPFFicha: TLFLabel;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     ATipoIVA: TAction;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     TButtImportarDetalle: TToolButton;
     AImportarDetalle: TAction;
     AAsignacionCodigoBarra: TAction;
     AAbrirCerrar: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     LEmail: TLFLabel;
     RelojEmail: TTimer;
     DBEImporteMinimoPorte: TLFDbedit;
     LImporteMinimoPorte: TLFLabel;
     ACrearHerenciaManual: TAction;
     DBECuotaImpuestoAdic: TLFDbedit;
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
     AFiltroAnulado: TAction;
     AFiltroCerrado: TAction;
     LDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     DBDTPHoraDocumento: TDBDateTimePicker;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     ABorradoMasivoLineas: TAction;
     AListadoArticulos: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     EIdioma: TLFEdit;
     DBCBEntregaDirecta: TLFDBCheckBox;
     LMotivoAbono: TLFLabel;
     DBEFMotivoAbono: TLFDBEditFind2000;
     EMotivoAbono: TLFEdit;
     ARelacionaConReparacion: TAction;
     LFechaAlbaran: TLFLabel;
     DBDEFechaAlbaran: TLFDBDateEdit;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     LProyectoFicha: TLFLabel;
     DBEFProyectoFicha: TLFDBEditFind2000;
     EProyectoFicha: TLFEdit;
     PNLPieUnidades: TLFPanel;
     DBESumUdsLog: TLFDbedit;
     DBESumUdsSec: TLFDbedit;
     PNLPieInfo: TLFPanel;
     PNLInfoImportes: TLFPanel;
     DBESumaPeso: TLFDbedit;
     LSumaPeso: TLFLabel;
     DBECantLineas: TLFDbedit;
     LCantLineas: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSerieChange(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure AUnidades_ExtExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure ANotaDetalleExecute(Sender: TObject);
     procedure ABuscarNumSerieExecute(Sender: TObject);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure AInfoHistoricoExecute(Sender: TObject);
     procedure APreciosTarifaExecute(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewProveedorExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAProveedorExecute(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure DBETituloProveedorEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AInfoLotesExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure AArticuloProvExecute(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure AInformeAlbaranExecute(Sender: TObject);
     procedure AVisualizarAlbaranesFiltradosExecute(Sender: TObject);
     procedure AImprimirAlbaranesFiltradosExecute(Sender: TObject);
     procedure AResumenAlbaranesExecute(Sender: TObject);
     procedure AResumenAlbaranesFiltradosExecute(Sender: TObject);
     procedure AImpresionResumenAlbaranesFiltradosExecute(Sender: TObject);
     procedure AListadoCodigosBarrasExecute(Sender: TObject);
     procedure AConfInfAlbaranesExecute(Sender: TObject);
     procedure AConfListadoResumenAlbaranesExecute(Sender: TObject);
     procedure AConfListadoCBarrasExecute(Sender: TObject);
     procedure AFacturaExecute(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ARegenerarCondExecute(Sender: TObject);
     procedure AAnulaDocumentoExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure AHistoricoSerializacionExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure AUbicacionesExecute(Sender: TObject);
     procedure AEnviarAlbaranMailPDFExecute(Sender: TObject);
     procedure ALstUbicacionesExecute(Sender: TObject);
     procedure AConfListadoUbicacionesExecute(Sender: TObject);
     procedure ANIFAlbaranExecute(Sender: TObject);
     procedure AProcedenciaExecute(Sender: TObject);
     procedure DBDTPFechaExit(Sender: TObject);
     procedure DBEFPortesChange(Sender: TObject);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure AAlbaranMultiExecute(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ABuscarArticulosExecute(Sender: TObject);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AAdjuntosAlbaranExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AEnviarAlbaranMailPDF2Execute(Sender: TObject);
     procedure LFDBOrdenChange(Sender: TObject);
     procedure SBAIdOrdenDblClick(Sender: TObject);
     procedure AIDOrdenExecute(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBEFProveedorExiste(Sender: TObject);
     procedure ACondicionesCompraExecute(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure AAsientoDeInventarioPermanenteExecute(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure AImpProduccionExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure LBNotasClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure DBERIGChange(Sender: TObject);
     procedure EFProyectoChange(Sender: TObject);
     procedure ATipoIVAExecute(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure AAsignacionCodigoBarraExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearHerenciaManualExecute(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroAnuladoExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure AListadoArticulosExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure DBEFMotivoAbonoChange(Sender: TObject);
     procedure ARelacionaConReparacionExecute(Sender: TObject);
     procedure FormActivate(Sender: TObject);
  private
     { Private declarations }
     param_ALPINSE001: boolean;
     Param_COMTIVA001: boolean;
     Param_ARTBUSQ004: boolean;
     NumSerie: string;
     ColActual: TColumn;
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     Buscando: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     DBGDetalleArticulo: string;
     procedure MuestraFiltrado(Modo: byte);
     procedure MuestraInformesFiltrados(Tipo: byte);
     procedure HabilitaEnlaces;
     procedure HabilitaBotones;
     {procedure HabilitaBotonesDetalle; dji lrk kri - TyC}
     {
     procedure Habilita;
     }
     procedure AbreOCierra;
     procedure RefrescaAvisos;
     procedure EstableceVisibilidadStockAlmacen;
  public
     { Public declarations }
     FiltroListadoFiltrado: integer;
     Editando: boolean;
     procedure HabilitaBotonesDetalle; {TyC]}
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraPendiente(FiltroAccion: string);
     procedure FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
     procedure RecepcionPedidos(Serie: string; Contador: integer);
  end;

var
  FMAlbaranesAProveedor : TFMAlbaranesAProveedor;

procedure TraspasoAlbaranProv(Serie: string; id_e: integer);

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UDMAlbaranesAProveedor, UDMLstAlbaranesProv,
  UFMLSTEntrefechas, UFMListConfig, UDMLstAlbProveedor,
  UFMDocInfoStocks, UFCHerenciaProv, UFMNotasCampo, UFMArtSerializacion,
  UFMHistoricoSerializacion, UFMBusquedaNumSerie, UFMain, UDMLstCBDocs,
  UFMProveedores, UFVerTercerosPorArticulo, UFSendCorreo,
  UDMListados, UDMLstUbicacionesC, UFPregEtiVacias, UFPregNIFFACTURA,
  UFMTraspasoMultiCanal, UDMLstEtiquetas, UFMAdjunto, UFMSeleccion,
  UFMIntroduceSeries, UFMCondicionesCompra, UFMImprimirCodBarras,
  UProFMImputaciones, Math, UParam, UFMCambiaFacProv,
  UFMInsercionArticuloDesdeTexto,
  {$IFNDEF TPV}UFMAsignacionCodigoBarra {$ENDIF}, UFMHerenciaManual,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMSeleccionArticulo, UFMProcesosMasivosLineas,
  UDMLstAlbaranProvArt, UFMLstEntrefechasAlbArt, URellenaLista;

{$R *.DFM}

procedure TraspasoAlbaranProv(Serie: string; id_e: integer);
begin
  FMain.EjecutaAccion(FMain.AAlbaranesProv);
  FMAlbaranesAProveedor.EFSerie.Text := Serie;
  FMain.TraspasodeDocumentosEntrada(id_e);
end;

procedure TFMAlbaranesAProveedor.FormCreate(Sender: TObject);
var
  i : integer;
  col : TColumn;
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
  Buscando := False;
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
  AbreData(TDMAlbaranesAProveedor, DMAlbaranesAProveedor);

  if REntorno.SerieRestringida <> '' then
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;
  NavMAin.DataSource := DMAlbaranesAProveedor.DSQMCabecera;
  DBGMain.DataSource := DMAlbaranesAProveedor.DSQMCabecera;
  NavDetalle.DataSource := DMAlbaranesAProveedor.DSQMDetalle;
  DBGFDetalle.DataSource := DMAlbaranesAProveedor.DSQMDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMAlbaranesAProveedor.DSQMCabecera;
     Entorno := DMAlbaranesAProveedor.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
  end;
  CENotasPMEdit.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  FiltroListadoFiltrado := 0;

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

  HabilitaEnlaces;
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  RefrescaAvisos;
  Editando := False;

  if (DMMain.EstadoKri(152) <> 1) then
     AEnviarAlbaranMailPDF.Visible := False;
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
     ANIFAlbaran.Enabled := False;

  if (DMMain.EstadoKri(264) <> 1) then  // Habilita el envío de email con pdf a traves del cliente windows
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarAlbaranMailPDF2) then
           ALMain.Actions[i].Free;

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

  EFBuscaNIFKRI.Width := 1;
  EFBuscaNIFKRI.Visible := False;

  // Color campo ID
  ColorCampoID(DBERIG);
  ColorCampoID(EFSERIE);

  // Muestra tabla por defecto
  if (LeeParametro('DOCCONF001') = 'S') then
     PCMain.ActivePage := TSTabla;

  TSDirEntrega.TabVisible := (LeeParametro('COMDIRM001') = 'S');

  with DBGMain do
  begin
     i := CamposAMarcar.IndexOf('MODIFICA_DOC');
     if (i >= 0) and (CamposChecked.Count >= i - 1) then
        CamposChecked[i] := '64';
  end;

  AbreOCierra;
end;

procedure TFMAlbaranesAProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  MTelefonos.Free;
  MNotas.Free;
  CierraData(DMAlbaranesAProveedor);
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_COMPRAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
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
     if Trim(TablaABuscar) = 'ART_ARTICULOS_CODPROV' then
     begin
        CondicionBusqueda :=
           'PROVEEDOR =' + IntToStr(DMAlbaranesAProveedor.QMCabeceraPROVEEDOR.AsInteger) +
           ' AND EMPRESA = ' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end
     else
     if Trim(TablaABuscar) = 'EMP_PROYECTOS' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROYECTO';
     end
     else
     if Trim(TablaABuscar) = 'SYS_TIPO_IVA' then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IVA') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMAlbaranesAProveedor.QMDetalleTIPO_IVA.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL' then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IMPUESTO_ADICIONAL') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMAlbaranesAProveedor.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(ALMACEN=''' + DMAlbaranesAProveedor.QMDetalleALMACEN.AsString + ''')';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
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
     if Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(ARTICULO=''' + DMAlbaranesAProveedor.QMDetalleARTICULO.AsString + ''')';
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
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMAlbaranesAProveedor.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMAlbaranesAProveedor.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMAlbaranesAProveedor.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  // Se quita el filtro por Numero de Serie
  DMAlbaranesAProveedor.BuscaNumSerie(NumSerie, False);
  TButtBuscarNumSerie.Down := False;

  Resultado := DMAlbaranesAProveedor.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;

  Continua := False;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.MuestraFiltrado(Modo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMAlbaranesAProveedor.QMCabecera.SelectSQL);
     AbreData(TDMLstAlbaranesProv, DMLstAlbaranesProv);
     try
        TempSql.AddStrings(DMLstAlbaranesProv.QMCabecera.SelectSQL);
        DMLstAlbaranesProv.QMCabecera.Close;
        DMLstAlbaranesProv.QMCabecera.SelectSQL.Assign(SqlFiltro);
        DMLstAlbaranesProv.QMCabecera.Params.ByName['serie'].AsString := EFSerie.Text;
        DMLstAlbaranesProv.MostrarListadoFiltrado(Modo, FiltroListadoFiltrado, EFSerie.Text);
        DMLstAlbaranesProv.QMCabecera.Close;
        DMLstAlbaranesProv.QMCabecera.SelectSQL.Assign(TempSQL);
     finally
        CierraData(DMLstAlbaranesProv);
     end;
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;

  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMAlbaranesAProveedor.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  // Edicion de IVA habilitada en documentos de venta
  Param_COMTIVA001 := (LeeParametro('COMTIVA001', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');

  param_ALPINSE001 := (LeeParametro('ALPINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_ALPINSE001;
  DBERIG.ReadOnly := not param_ALPINSE001;

  EstableceVisibilidadStockAlmacen;
  HabilitaBotones;
end;

procedure TFMAlbaranesAProveedor.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (Editando) then
     DMAlbaranesAProveedor.RefrescaTabla;
end;

procedure TFMAlbaranesAProveedor.AUnidades_ExtExecute(Sender: TObject);
begin
  if DBGFDetalle.SelectedField.DisplayName = 'UNIDADES' then
     DBGFDetalle.SelectedIndex := DBGFDetalle.SelectedIndex + 1;

  DMAlbaranesAProveedor.CambiaUnidadesExt(DMAlbaranesAProveedor.QMDetalleARTICULO, True);
end;

procedure TFMAlbaranesAProveedor.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     DMAlbaranesAProveedor.BorraLineaExt;
  if Button = nbDelete then
     DMAlbaranesAProveedor.ControlaRestriccion;
  if Button in [nbRefresh, nbDelete, nbPost] then
     DMAlbaranesAProveedor.ReiniciaStock(DMAlbaranesAProveedor.QMDetalleARTICULO.AsString);
end;

procedure TFMAlbaranesAProveedor.AInfoStocksExecute(Sender: TObject);
var
  Articulo, Almacen : string;
begin
  DMAlbaranesAProveedor.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleColEnter(Sender: TObject);
begin
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

procedure TFMAlbaranesAProveedor.ASerializacionExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.PreparaSerializacion;

  if not DMAlbaranesAProveedor.Serializado then
     ShowMessage('El artículo no está serializado')
  else
  begin
     FMIntroduceSeries := TFMIntroduceSeries.Create(Self);
     FMIntroduceSeries.Inicializar(DMAlbaranesAProveedor.QMDetalleID_DETALLES_E.AsInteger, 'ALP');
     FMIntroduceSeries.ShowModal;
  end;
end;

procedure TFMAlbaranesAProveedor.ANotaDetalleExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.PreparaNotasDetalle;
  DMAlbaranesAProveedor.NotasLote := True;
  EditarCampoNotas(Self, DMAlbaranesAProveedor.DSQMDetalle,
     DMAlbaranesAProveedor.QMDetalleNOTAS, DMAlbaranesAProveedor.QMDetalleNOTAS2, (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranesAProveedor.ABuscarNumSerieExecute(Sender: TObject);
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
           DMAlbaranesAProveedor.Filtrado := False;
           DMAlbaranesAProveedor.BuscaNumSerie(NumSerie, True);
        end;
     end;
  end
  else
     DMAlbaranesAProveedor.BuscaNumSerie(NumSerie, False);
  try
     TButtBuscarNumSerie.Down := False;
  finally
  end;

  HabilitaBotones;
end;

procedure TFMAlbaranesAProveedor.NavDetalleChangeState(Sender: TObject);
begin
  HabilitaBotonesDetalle;

  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

procedure TFMAlbaranesAProveedor.RecepcionPedidos(Serie: string; Contador: integer);
begin
  DMAlbaranesAProveedor.RecepcionPedidos(Serie, Contador);
  EFSerie.Text := Serie;
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.AInfoHistoricoExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.Historico;
end;

procedure TFMAlbaranesAProveedor.APreciosTarifaExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.CambiaPreciosTarifa;
end;

procedure TFMAlbaranesAProveedor.MuestraInformesFiltrados(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMAlbaranesAProveedor.QMCabecera.SelectSQL);
  AbreData(TDMLstAlbProveedor, DMLstAlbProveedor);
  with DMLstAlbProveedor do
  begin
     TempSql.AddStrings(QMCabecera.SelectSQL);
     QMCabecera.Close;
     QMCabecera.SelectSQL.Assign(SqlFiltro);

     // Utilizo la vista para listado
     QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_ALBARAN_PROV', 'VER_CABECERAS_ALBARAN_PROV_LST', [rfReplaceAll]);

     QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
     MostrarInformesFiltrados(Tipo, FiltroListadoFiltrado, EFSerie.Text);
     QMCabecera.Close;
     QMCabecera.SelectSQL.Assign(TempSQL);
  end;
  CierraData(DMLstAlbProveedor);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMAlbaranesAProveedor.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
  DMAlbaranesAProveedor.MascarasMoneda;
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

procedure TFMAlbaranesAProveedor.ANewProveedorExecute(Sender: TObject);
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
     DBEFFormasPago.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMAlbaranesAProveedor.ANewArticuloExecute(Sender: TObject);
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
        DMAlbaranesAProveedor.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMAlbaranesAProveedor.AAProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFProveedor.Text <> '' then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DBEFProveedor.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMAlbaranesAProveedor.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMAlbaranesAProveedor.SBAProveedorDblClick(Sender: TObject);
begin
  AAProveedor.Execute;
end;

procedure TFMAlbaranesAProveedor.HabilitaEnlaces;
begin
  if (FMain.AProveedores.Enabled = False) then
  begin
     DBEFProveedor.Accion := nil;
     SBAProveedor.Width := 0;
     MIVerDatosProveedor.Visible := False;
     MISepEnlaces.Visible := False;
  end
  else
  begin
     SolapaControles(SBAProveedor, DBETituloProveedor);
     DBETituloProveedor.Color := REntorno.ColorEnlaceActivo;
  end;

  LFDBOrden.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAIdOrden, LFDBOrden);
  ETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, ETitProyecto);
end;

procedure TFMAlbaranesAProveedor.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstAlbProveedor, DMLstAlbProveedor);
  DMLstAlbProveedor.MostrarInforme(1, EFSerie.Text);
  CierraData(DMLstAlbProveedor);
end;

procedure TFMAlbaranesAProveedor.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMAlbaranesAProveedor.FiltraCabecera(Ejercicio, Serie, Rig);
  EFSerie.Text := Serie;
  EFSerieChange(Self);
  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBETituloProveedorEnter(Sender: TObject);
begin
  DBEFProveedor.SetFocus;
end;

procedure TFMAlbaranesAProveedor.HabilitaBotones;
var
  Habil : boolean;
begin
  Habil := DMAlbaranesAProveedor.HayDocumentos;

  AFactura.Enabled := Habil;
  ADuplicar.Enabled := Habil;
  ARegenerarCond.Enabled := Habil;
  AAnulaDocumento.Enabled := Habil;
  AHerencia.Enabled := Habil;
  AHistoricoSerializacion.Enabled := Habil;
  AAbrirCerrar.Enabled := Habil;

  if REntorno.SerieRestringida <> '' then
     EFSerie.Enabled := False;
  if REntorno.AlmacenRestringido <> '' then
     DBEFAlmacen.Enabled := False;

  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranesAProveedor.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
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
  // bit 7 = 0 --> Albaranes a Prov. restringidas
  if (((REntorno.RestriccionDocumento and 64) = 0) and
     ((DMAlbaranesAProveedor.xInfoActualizadaMODIFICA_DOC.AsInteger and 64) = 64)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if Button in [nbPost, nbDelete, nbCancel] then
     HabilitaBotones
  else if Button in [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbRefresh] then
     HabilitaBotonesDetalle;

  if ((Button in [nbInsert]) and (REntorno.AlmacenRestringido <> '')) then
     DBEFAlmacen.Text := REntorno.AlmacenRestringido;

  // Por alguna razon estos botones se deshabilitan cuando se da a insert en NavMain
  TButtImpProduccion.Enabled := True;//TButtImpProduccion.Action.Enabled;
  TButtCondicionesCompra.Enabled := True;//TButtCondicionesCompra.Action.Enabled;

  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.HabilitaBotonesDetalle;
var
  Habil, HabilEd : boolean;
begin
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMAlbaranesAProveedor.HayDetalle) or (DMAlbaranesAProveedor.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMAlbaranesAProveedor.QMDetalle.State in [dsInsert, dsEdit]);

  TButtNotas.Enabled := HabilEd;
  TButtHerencia.Enabled := HabilEd;
  TButtInfoStocks.Enabled := Habil;
  TButtProcedenciaLinea.Enabled := HabilEd;
  TButtUnidades_Ext.Enabled := HabilEd;
  TButtPrecios.Enabled := Habil;
  TButtInfoHistorico.Enabled := Habil;
  TButtSerializacion.Enabled := HabilEd;
  TBInfoLotes.Enabled := HabilEd;
  AOrdenaLineas.Enabled := Habil;
  TButtUbicaciones.Enabled := Habil;
  TBArtProv.Enabled := Habil;
  TButtBuscarArticulo.Enabled := True;  // Siempre Activo
  TButtImportarDetalle.Enabled := True;  // Siempre Activo

  // En el caso del Tipo de IVA tenemos que ver el parámetro COMTIVA001
  HabilitaColumna(DBGFDetalle, 'TIPO_IVA', Param_COMTIVA001);
end;

procedure TFMAlbaranesAProveedor.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  // if button in [nbPost, nbDelete, nbCancel] then
  HabilitaBotonesDetalle;

  if Button in [nbRefresh] then
     DMAlbaranesAproveedor.RellenaDatosOldLinea;
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // if ((DMAlbaranesAProveedor.QMDetalle.State = dsinsert)) then
  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranesAProveedor.AInfoLotesExecute(Sender: TObject);
begin
  DMAlbaranesAproveedor.InfoLotes;
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleDblClick(Sender: TObject);
begin
  if DMAlbaranesAProveedor.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;

     if ((UpperCase(ColActual.FieldName) = 'ID_LOTE') or (UpperCase(ColActual.FieldName) = 'LOTE')) then
        FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(DMAlbaranesAProveedor.QMDetalleID_LOTE.AsInteger));
  end;
end;

procedure TFMAlbaranesAProveedor.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMAlbaranesAProveedor.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMAlbaranesAProveedor.AArticuloProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMAlbaranesAProveedor.QMDetalleARTICULO.AsString, 0);
end;

procedure TFMAlbaranesAProveedor.RelojNotasTimer(Sender: TObject);
begin
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMAlbaranesAProveedor.AInformeAlbaranExecute(Sender: TObject);
begin
  AbreData(TDMLstAlbProveedor, DMLstAlbProveedor);
  AInformeAlbaran.Enabled := False;
  try
     DMLstAlbProveedor.MostrarInforme(0, EFSerie.Text);
  finally
     AInformeAlbaran.Enabled := True;
     CierraData(DMLstAlbProveedor);
  end;

  // Refresco valor de check del estado listado
  DMAlbaranesAProveedor.InfoActualiza;
end;

procedure TFMAlbaranesAProveedor.AVisualizarAlbaranesFiltradosExecute(Sender: TObject);
begin
  MuestraInformesFiltrados(0);
end;

procedure TFMAlbaranesAProveedor.AImprimirAlbaranesFiltradosExecute(Sender: TObject);
begin
  MuestraInformesFiltrados(1);
end;

procedure TFMAlbaranesAProveedor.AResumenAlbaranesExecute(Sender: TObject);
begin
  AbreData(TDMLstAlbaranesProv, DMLstAlbaranesProv);
  TFMLSTEntrefechas.Create(Self).Muestra('ALP', EFSerie.Text);
  CierraData(DMLstAlbaranesProv);
end;

procedure TFMAlbaranesAProveedor.AResumenAlbaranesFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMAlbaranesAProveedor.AImpresionResumenAlbaranesFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMAlbaranesAProveedor.AListadoCodigosBarrasExecute(Sender: TObject);
{var
 Vacias: Integer;
 Modo: Integer; dji lrk kri}
begin
  {  AbreData(TDMLstCBDocs, DMLstCBDocs);
  Modo:=0;
  if (DMMain.EstadoKri(173)=1) then  dji lrk kri
    Modo:=1;
  DMLstCBDocs.Eti_Vacias := TFPregEtiVacias.Create(Self).Muestra;
  DMLstCBDocs.MostrarListadoCB(DMAlbaranesAProveedor.QMCabeceraEMPRESA.AsInteger,
    DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger,
    DMAlbaranesAProveedor.QMCabeceraCANAL.AsInteger,
    DMAlbaranesAProveedor.QMCabeceraRIG.AsInteger,
    DMAlbaranesAProveedor.QMCabeceraSERIE.AsString,
    DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, Modo dji lrk kri );
  CierraData(DMLstCBDocs);
}
  DMAlbaranesAProveedor.ListarCodBarras;
end;

procedure TFMAlbaranesAProveedor.AConfInfAlbaranesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstAlbProveedor, DMLstAlbProveedor);
  TFMListConfig.Create(Self).Muestra(72, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstAlbProveedor.frAlbaranes, DMLstAlbProveedor.HYReport);
  CierraData(DMLstAlbProveedor);
end;

procedure TFMAlbaranesAProveedor.AConfListadoResumenAlbaranesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstAlbaranesProv, DMLstAlbaranesProv);
  TFMListConfig.Create(Self).Muestra(42, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstAlbaranesProv.frAlbaran);
  CierraData(DMLstAlbaranesProv);
end;

procedure TFMAlbaranesAProveedor.AConfListadoCBarrasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  { AbreData(TDMLstCBDocs, DMLstCBDocs);
  TFMListConfig.Create(Self).Muestra(96,Formato, Cabecera, Copias,
    Pijama, EFSerie.Text, DMLstCBDocs.frCodBarras);
 CierraData(DMLstCBDocs);
}
  AbreData(TDMLstEtiquetas, DMLstEtiquetas);
  TFMListConfig.Create(Self).Muestra(63, Formato, Cabecera, Copias,
     Pijama, '', DMLstEtiquetas.frArticulos);
  CierraData(DMLstEtiquetas);
end;

procedure TFMAlbaranesAProveedor.AFacturaExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMAlbaranesAProveedor.TraspasarAFactura;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAlbaranesAProveedor.ADuplicarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMAlbaranesAProveedor.Duplica;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAlbaranesAProveedor.ARegenerarCondExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Proveedor-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMAlbaranesAProveedor.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMAlbaranesAProveedor.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMAlbaranesAProveedor.ActualizaCondicionesProv(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMAlbaranesAProveedor.AAnulaDocumentoExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.AnulaDocumento;
end;

procedure TFMAlbaranesAProveedor.AHerenciaExecute(Sender: TObject);
var
  rig, ejercicio : integer;
  tipo, num_factura, titulo, serie : string;
begin
  DMAlbaranesAProveedor.DatosHerencia(rig, ejercicio, tipo, num_factura, titulo, serie);
  MuestraHerencia(rig, ejercicio, tipo, num_factura, titulo, serie, Self);
end;

procedure TFMAlbaranesAProveedor.AHistoricoSerializacionExecute(Sender: TObject);
begin
  HistoricoSerie(Self);
end;

procedure TFMAlbaranesAProveedor.FormShow(Sender: TObject);
var
  i : smallint;
begin
  inherited;

  HabilitaBotones;

  // Forzamos un primer refresco para que el navegador cambie si el usuario tiene documentos restringidos.
  NavMainClickAfterAdjust(Sender, nbRefresh);

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
     begin
        with DBGFDetalle.FindColumn(Format('ALFA_%d', [i])) do
        begin
           Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
        end;
     end;
  end;
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMAlbaranesAProveedor.HayDetalle then
  begin
     if ((UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     with TDBGridFind2000(Sender) do
     begin
        if (gdFocused in State) then
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
           begin
              if (DMAlbaranesAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranesAProveedor.QMDetalleSTOCK_ALM.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM2') then
           begin
              if (DMAlbaranesAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranesAProveedor.QMDetalleSTOCK_ALM2.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'STOCK_ALM3') then
           begin
              if (DMAlbaranesAProveedor.QMDetalleCONTROL_STOCK.AsInteger = 0) then
                 ColorInactivo(Canvas)
              else
              if (DMAlbaranesAProveedor.QMDetalleSTOCK_ALM3.AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE')) then
           begin
              if (DMAlbaranesAProveedor.QMDetalleLOTEABLE.AsInteger = 1) then
              begin
                 if (Abs(RoundTo(DMAlbaranesAProveedor.QMDetalleUNIDADES.AsFloat - DMAlbaranesAProveedor.QMDetalleCANT_LOTE.AsFloat, -2)) > 0.00) then
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
              if (ArticuloUbicable(DMAlbaranesAProveedor.QMDetalleARTICULO.AsString)) then
                 ColorEdicion(Canvas)
              else
                 ColorInactivo(Canvas);
           end;
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMAlbaranesAProveedor.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavNotas.SetFocus;
  {dji lrk kri - para que se pueda poner simbolo Euros en las notas}
  if Button = nbEdit then
     AUnidades_Ext.ShortCut := 0;
  if Button = nbPost then
     AUnidades_Ext.ShortCut := TextToShortCut('Ctrl+Alt+E');
end;

procedure TFMAlbaranesAProveedor.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
     DMAlbaranesAProveedor.ControlaRestriccion;
  if Button in [nbEdit] then
     Editando := True
  else
     Editando := False;

  if (Button in [nbRefresh, nbDelete]) then
     DMAlbaranesAProveedor.ReiniciaStock;
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
begin
  {
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMAlbaranesAProveedor.BusquedaArticulo(valor);
  DMAlbaranesAProveedor.Continua;
  }
end;

procedure TFMAlbaranesAProveedor.AUbicacionesExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.MuestraUbicacion;
end;

procedure TFMAlbaranesAProveedor.AEnviarAlbaranMailPDFExecute(Sender: TObject);
var
  Asunto : string;
  DMLstAlbProveedorCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // esto es porque el assigned no va

  DMLstAlbProveedorCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el albarán por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstAlbProveedor, DMLstAlbProveedor);
           DMLstAlbProveedorCargado := True;

           DMLstAlbProveedor.MostrarListadoMail(DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text,
              2, DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger);

           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;
           FSendCorreo.Texto(_('Enviando Mensaje  ...'));

           InicializaVariableEmail(DMAlbaranesAProveedor.QMCabeceraTIPO.AsString);
           with VariableEmail do
           begin
              Ejercicio := DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger;
              Serie := DMAlbaranesAProveedor.QMCabeceraSERIE.AsString;
              NumeroDocumento := DMAlbaranesAProveedor.QMCabeceraRIG.AsInteger;
              Fecha := DMAlbaranesAProveedor.QMCabeceraFECHA.AsDateTime;
              SuReferencia := DMAlbaranesAProveedor.QMCabeceraSU_REFERENCIA.AsString;
              SuPedido := '';
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := DMLstAlbProveedor.nombreFich;
              Matricula := '';
              if (DMAlbaranesAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
              begin
                 NombreComercial := DMAlbaranesAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
                 RazonSocial := DMAlbaranesAProveedor.QMCabeceraTITULO.AsString;
              end
              else
              begin
                 // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                 NombreComercial := DMAlbaranesAProveedor.QMCabeceraTITULO.AsString;
                 RazonSocial := DMAlbaranesAProveedor.QMCabeceraTITULO.AsString;
              end;
              OrdenTrabajo := DameOrdenDeTrabajo(DMAlbaranesAProveedor.QMCabeceraID_ORDEN.AsInteger);
              IdOrdenTrabajo := DMAlbaranesAProveedor.QMCabeceraID_ORDEN.AsInteger;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMAlbaranesAProveedor.QMCabeceraENTRADA.AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);
           try
              DMListados.SendMailTerceroPDF(DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger, CuerpoMail,
                 DMLstAlbProveedor.rutaFich, DMLstAlbProveedor.nombreFich, Asunto, DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger);
           finally
              CuerpoMail.Free;
           end;
           CierraData(DMLstAlbProveedor);
           DMLstAlbProveedorCargado := False;
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
           if DMLstAlbProveedorCargado then
              CierraData(DMLstAlbProveedor);
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
  DMAlbaranesAProveedor.InfoActualiza;
end;

procedure TFMAlbaranesAProveedor.ALstUbicacionesExecute(Sender: TObject);
begin
  AbreData(TDMLstUbicacionesC, DMLstUbicacionesC);
  DMLstUbicacionesC.MostrarListadoUbicaciones(DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger,
     DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, 0);
  CierraData(DMLstUbicacionesC);
end;

procedure TFMAlbaranesAProveedor.AConfListadoUbicacionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstUbicacionesC, DMLstUbicacionesC);
  DMLstUbicacionesC.ConfiguraListado(DMAlbaranesAProveedor.QMCabeceraTIPO.AsString);
  TFMListConfig.Create(Self).Muestra(192, Formato, Cabecera, Copias, Pijama, EFSerie.Text,
     DMLstUbicacionesC.frUbicaciones);
  CierraData(DMLstUbicacionesC);
end;

procedure TFMAlbaranesAProveedor.ANIFAlbaranExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFACTURA;
begin
  DMAlbaranesAProveedor.AbreQMNif;
  if DMAlbaranesAProveedor.DameDatosProveedor then
  begin
     FPregDatos := TFPregNIFFACTURA.Create(Self);
     FPregDatos.Inicializa(DMAlbaranesAProveedor.DSQMNIF, _('Datos del Proveedor'), DMAlbaranesAProveedor.EstadoDocumento);
     DMAlbaranesAProveedor.GrabaDatosProveedor(FPregDatos.ShowModal);
     FreeAndNil(FPregDatos);
  end;
  DMAlbaranesAProveedor.CierraQMNif;
  DMAlbaranesAProveedor.RefrescaCabecera(1);
end;

procedure TFMAlbaranesAProveedor.AProcedenciaExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.Procedencia;
end;

procedure TFMAlbaranesAProveedor.DBDTPFechaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMAlbaranesAProveedor.DBEFPortesChange(Sender: TObject);
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
           DBEIPortes.DataSource := DMAlbaranesAProveedor.DSQMCabecera;
        end;
     end;

     DBEPorPortes.ReadOnly := not DBEPorPortes.Enabled;
     DBEPorPortes.TabStop := DBEPorPortes.Enabled;
     DBEIPortes.ReadOnly := not DBEIPortes.Enabled;
     DBEIPortes.TabStop := DBEIPortes.Enabled;
  end;
end;

procedure TFMAlbaranesAProveedor.AOrdenaLineasExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.OrdenarLineas;
end;

procedure TFMAlbaranesAProveedor.AAlbaranMultiExecute(Sender: TObject);
var
  Accion : integer;
begin
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(nil);
  Accion := FMTraspasoMultiCanal.Carga(DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger, DMAlbaranesAProveedor.QMCabeceraRIG.AsInteger,
     DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger, DMAlbaranesAProveedor.QMCabeceraCANAL.AsInteger, 0,
     DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, DMAlbaranesAProveedor.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);
  DMAlbaranesAProveedor.RefrescaCabecera(Accion);
end;

procedure TFMAlbaranesAProveedor.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMAlbaranesAProveedor.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMAlbaranesAProveedor.FiltraPendiente(FiltroAccion: string);
begin
  DMAlbaranesAProveedor.QMCabecera.Close;
  FMAlbaranesAProveedor.TSTabla.Show;
  DMAlbaranesAProveedor.FiltraPendiente(FiltroAccion);
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

{Se define en UUtiles
function TFMAlbaranesAProveedor.EncuentraField(Grid: TDBGridFind2000; Titulo: String): Smallint;
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
procedure TFMAlbaranesAProveedor.ABuscarArticulosExecute(Sender: TObject);
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

  DMAlbaranesAProveedor.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMAlbaranesAProveedor.EFProyectoBusqueda(Sender: TObject);
begin
  EFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if ((Key = VK_F3) and (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE')) then
     DMAlbaranesAProveedor.InfoLotes
  else
  begin
     if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
     begin
        if (Key = VK_F3) then
        begin
           if PideArticulo(DBGDetalleArticulo, False, True) then
           begin
              DMAlbaranesAProveedor.QMDetalle.Edit;
              DMAlbaranesAProveedor.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
           end;
           Key := 0;
        end;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMAlbaranesAProveedor.FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
begin
  EFSerie.Text := Serie;
  DMAlbaranesAProveedor.FiltraProveedorKri(Ejercicio, Serie, Proveedor, Estado);
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.AAdjuntosAlbaranExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ALP', DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger);
end;

procedure TFMAlbaranesAProveedor.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', DameIDProveedor(DMAlbaranesAProveedor.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMAlbaranesAProveedor.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger);
end;

// sfg_rsl-begin- especial abrir cliente de correo predeterminado (El DMlistados tienes que ser a medida)
procedure TFMAlbaranesAProveedor.AEnviarAlbaranMailPDF2Execute(Sender: TObject);
var
  {  Memo: TStrings; No se utiliza}
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstAlbProveedor, DMLstAlbProveedor);
  try
     DMLstAlbProveedor.MostrarListadoMail(DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger, EFSerie.Text,
        2, DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger);

     InicializaVariableEmail(DMAlbaranesAProveedor.QMCabeceraTIPO.AsString);
     with VariableEmail do
     begin
        Ejercicio := DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger;
        Serie := DMAlbaranesAProveedor.QMCabeceraSERIE.AsString;
        NumeroDocumento := DMAlbaranesAProveedor.QMCabeceraRIG.AsInteger;
        Fecha := DMAlbaranesAProveedor.QMCabeceraFECHA.AsDateTime;
        SuReferencia := DMAlbaranesAProveedor.QMCabeceraSU_REFERENCIA.AsString;
        SuPedido := '';
        Folio := '';
        TituloDocTributario := '';
        NombreFichero := DMLstAlbProveedor.nombreFich;
        Matricula := '';
        if (DMAlbaranesAProveedor.QMCabeceraPROVEEDOR.AsInteger > 0) then
        begin
           NombreComercial := DMAlbaranesAProveedor.QMCabeceraNOMBRE_COMERCIAL.AsString;
           RazonSocial := DMAlbaranesAProveedor.QMCabeceraTITULO.AsString;
        end
        else
        begin
           // El campo TITULO se rellena con el nombre asignado al Tercero Vario
           NombreComercial := DMAlbaranesAProveedor.QMCabeceraTITULO.AsString;
           RazonSocial := DMAlbaranesAProveedor.QMCabeceraTITULO.AsString;
        end;
        OrdenTrabajo := DameOrdenDeTrabajo(DMAlbaranesAProveedor.QMCabeceraID_ORDEN.AsInteger);
        IdOrdenTrabajo := DMAlbaranesAProveedor.QMCabeceraID_ORDEN.AsInteger;
        UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMAlbaranesAProveedor.QMCabeceraENTRADA.AsInteger));
     end;
     DamePartesEmail(Asunto, CuerpoMail);
     try
        DMListados.SendMailTerceroPDF2(DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger, CuerpoMail,
           DMLstAlbProveedor.rutaFich, DMLstAlbProveedor.nombreFich, Asunto, DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger, True);
     finally
        CuerpoMail.Free;
     end;

     // Marco el documento como listado
     DMLstAlbProveedor.UpdateaDocumentos;
  finally
     CierraData(DMLstAlbProveedor);
  end;

  // Refresco valor de check del estado listado
  DMAlbaranesAProveedor.InfoActualiza;
end;
// sfg_rsl-end- especial abrir cliente de correo predeterminado

//sfg.albert - Es fa que si l'albarà té un ID de Of, no es permeti la seva imputació en una OF
//ja que vol dir que ja s'ha imputat en una comanda

//????? S'ha de posar ???? Salvador
procedure TFMAlbaranesAProveedor.LFDBOrdenChange(Sender: TObject);
begin
  {if ((LFDBOrden.Text='0') or (LFDBOrden.Text='')) then
    FMAlbaranesAProveedor.Z_TButtImpProduccion.Enabled:=True
  else
    FMAlbaranesAProveedor.Z_TButtImpProduccion.Enabled:=False;
    }
end;

procedure TFMAlbaranesAProveedor.SBAIdOrdenDblClick(Sender: TObject);
begin
  if (LFDBOrden.Text <> '0') then
     AIDOrden.Execute;
end;

procedure TFMAlbaranesAProveedor.AIDOrdenExecute(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AProOrden, LFDBOrden.Text);
end;

procedure TFMAlbaranesAProveedor.DBEFProveedorChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBEFProveedorExiste(Sender: TObject);
begin
  if (not DMMain.ProveedorValido(StrToIntDef(DBEFProveedor.Text, 0))) then
     DBEFProveedor.Text := '';
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMAlbaranesAProveedor.ACondicionesCompraExecute(Sender: TObject);
begin
  AbreForm(TFMCondicionesCompra, FMCondicionesCompra);
  with FMCondicionesCompra do
  begin
     EFProveedor.Text := DBEFProveedor.Text;
     EFFiltroArticulo.Text := DMAlbaranesAProveedor.QMDetalleARTICULO.AsString;
     EFFiltroFamilia.Text := DMAlbaranesAProveedor.xArticulos.FieldByName('FAMILIA').AsString;
     EFFiltroArticuloPorPrecio.Text := DMAlbaranesAProveedor.QMDetalleARTICULO.AsString;
     EFFiltraFamiliaPorPrecio.Text := DMAlbaranesAProveedor.xArticulos.FieldByName('FAMILIA').AsString;
  end;
end;

procedure TFMAlbaranesAProveedor.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMAlbaranesAProveedor.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMAlbaranesAProveedor.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMAlbaranesAProveedor.AAsientoDeInventarioPermanenteExecute(Sender: TObject);
begin
  if (DMAlbaranesAProveedor.HayDetalle) then
     FMain.MuestraMovConta(' RIC= ' +
        IntToStr(DMAlbaranesAProveedor.ObtieneRIC) + ' and ejercicio=' + IntToStr(DMAlbaranesAProveedor.QMCabeceraEJERCICIO.AsInteger));
end;

procedure TFMAlbaranesAProveedor.AListarEtiquetasExecute(Sender: TObject);
var
  SQL : TStrings;
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  if (DMMain.EstadoKri(490) = 1) then  //Verificamos si las etiquetas se harán por lotes
  begin
     SQL := TStringList.Create;
     try
        DMAlbaranesAProveedor.DameSqlImpresionEtiquetas(SQL);
        FMImprimirCodBarras.ImportarDatosSql(DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger, SQL);
     finally
        SQL.Free;
     end;
  end
  else
     FMImprimirCodBarras.ImportarDatos(DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger);
end;

procedure TFMAlbaranesAProveedor.AImpProduccionExecute(Sender: TObject);
begin
  TProFMImputaciones.Create(Self).FiltraDoc(DMAlbaranesAProveedor.QMDetalleID_E.AsInteger);
end;

procedure TFMAlbaranesAProveedor.ADuplicarLineaExecute(Sender: TObject);
begin
  DMAlbaranesAProveedor.DuplicarLinea;
end;

procedure TFMAlbaranesAProveedor.LBNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMAlbaranesAProveedor.xProveedor.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMAlbaranesAProveedor.xProveedor.FieldByName('NOTAS').AsString);
        {
        if (Trim(DMAlbaranesAProveedor.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMAlbaranesAProveedor.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        }
        if (Trim(DMAlbaranesAProveedor.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMAlbaranesAProveedor.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMAlbaranesAProveedor.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMAlbaranesAProveedor.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';

  try
     Buscando := True;
     G2KTableLoc.Click;
  finally
     Buscando := False;
  end;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMAlbaranesAProveedor.EFBuscaNIFKRIChange(Sender: TObject);
begin
  if (StrToIntDef(EFBuscaNIFKRI.Text, 0) <> 0) then
     with DMAlbaranesAProveedor.QMCabecera do
     begin
        DisableControls;
        First;
        while ((DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger <> StrToIntDef(EFBuscaNIFKRI.Text, 0)) and (not DMAlbaranesAProveedor.QMCabecera.EOF)) do
           Next;
        EnableControls;
     end;
end;

procedure TFMAlbaranesAProveedor.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'tipo=''ALP'' and serie=''' + EFSerie.Text + '''';
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

procedure TFMAlbaranesAProveedor.DBERIGChange(Sender: TObject);
begin
  inherited;
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.EFProyectoChange(Sender: TObject);
begin
  inherited;
  if (Sender = DBEFProyectoFicha) then
     EProyectoFicha.Text := DameTituloProyecto(StrToIntDef(DBEFProyectoFicha.Text, 0))
  else
     ETitProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFMAlbaranesAProveedor.ATipoIVAExecute(Sender: TObject);
begin
  inherited;
  TFMCambiaFacProv.Create(Self).muestra(DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger);
  DMAlbaranesAProveedor.QMCabecera.Refresh;
end;

{
procedure TFMAlbaranesAProveedor.Habilita;
begin
  ATipoIVA.Enabled := DMAlbaranesAProveedor.Habilitar_but_cambia_iva;
end;
}
procedure TFMAlbaranesAProveedor.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMAlbaranesAProveedor.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMAlbaranesAProveedor.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMAlbaranesAProveedor;
     ShowModal;
     Free;
  end;
end;

procedure TFMAlbaranesAProveedor.AAsignacionCodigoBarraExecute(Sender: TObject);
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
  with DMAlbaranesAProveedor.QMDetalle do
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

           Posicionar(DMAlbaranesAProveedor.QMDetalle, 'ID_DETALLES_E', IdDetallesE);
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

procedure TFMAlbaranesAProveedor.AAbrirCerrarExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     if (AAbrirCerrar.Tag = 0) then
        DMAlbaranesAProveedor.CierraDocumento
     else
        DMAlbaranesAProveedor.AbreDocumento
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAlbaranesAProveedor.AbreOCierra;
begin
  if (DMAlbaranesAProveedor.EstadoDocumento = 0) then
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

  ColorSegunEstado(DBETituloEstado, DMAlbaranesAProveedor.QMCabeceraESTADO.AsInteger);
end;

procedure TFMAlbaranesAProveedor.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMAlbaranesAProveedor.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMAlbaranesAProveedor.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGDetalleArticulo := '';
  RefrescaAvisos;
end;

procedure TFMAlbaranesAProveedor.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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

procedure TFMAlbaranesAProveedor.ACrearHerenciaManualExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMAlbaranesAProveedor.QMDetalleTIPO.AsString, DMAlbaranesAProveedor.QMDetalleID_DETALLES_E.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMAlbaranesAProveedor.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if ((Button = nbDelete) and (DMAlbaranesAProveedor.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMAlbaranesAProveedor.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranesAProveedor.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMAlbaranesAProveedor.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranesAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 0');
end;

procedure TFMAlbaranesAProveedor.AFiltroAnuladoExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranesAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 2');
end;

procedure TFMAlbaranesAProveedor.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMAlbaranesAProveedor.FiltraDocumento(EFSerie.Text, 'ESTADO = 5');
end;

procedure TFMAlbaranesAProveedor.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + DMAlbaranesAProveedor.QMCabeceraTERCERO.AsString;
end;

procedure TFMAlbaranesAProveedor.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('ALP', DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger, Ficheros[i]);
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

procedure TFMAlbaranesAProveedor.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
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

procedure TFMAlbaranesAProveedor.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMAlbaranesAProveedor.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMAlbaranesAProveedor.QMDetalleTIPO.AsString, DMAlbaranesAProveedor.QMDetalleID_E.AsInteger);

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
                 Params.ByName['ID_E'].AsInteger := DMAlbaranesAProveedor.QMDetalleID_E.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMAlbaranesAProveedor.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMAlbaranesAProveedor.AListadoArticulosExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstAlbaranProvArt, DMLstAlbaranProvArt);
  TFMLstEntreFechasAlbArt.Create(Self).Muestra('ALP', EFSerie.Text, DBEFAlmacen.Text);
  CierraData(DMLstAlbaranProvArt);
end;

procedure TFMAlbaranesAProveedor.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  EIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMAlbaranesAProveedor.RefrescaAvisos;
var
  ImporteMinimoPortes : double;
  Resaltado : boolean;
begin
  if (not Buscando) then
  begin
     if (((DMAlbaranesAProveedor.xProveedor.Active) and (Trim(DMAlbaranesAProveedor.xProveedor.FieldByName('NOTAS').AsString) > '')) or
        ((DMAlbaranesAProveedor.xAvisos.Active) and (Trim(DMAlbaranesAProveedor.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
        RelojNotas.Enabled := True
     else
        RelojNotas.Enabled := False;

     LBNotas.Visible := RelojNotas.Enabled;

     if (DMMain.ExisteAdjunto(DMAlbaranesAProveedor.QMCabeceraTIPO.AsString, DMAlbaranesAProveedor.QMCabeceraID_E.AsInteger)) then
        RelojAdjuntos.Enabled := True
     else
        RelojAdjuntos.Enabled := False;

     LAdjuntos.Visible := RelojAdjuntos.Enabled;

     if (DMMain.EnviarFacturasProvAcrePorEmail(DMAlbaranesAProveedor.QMCabeceraTERCERO.AsInteger)) then
        RelojEmail.Enabled := True
     else
        RelojEmail.Enabled := False;

     LEmail.Visible := RelojEmail.Enabled;

     // Si el tipo de porte es 2, ponemos en colorin el importe minimo de porte
     Resaltado := False;
     if (DMAlbaranesAProveedor.xProveedor.Active) then
     begin
        ImporteMinimoPortes := DMAlbaranesAProveedor.xProveedor.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat;
        if ((ImporteMinimoPortes > 0) and (DMAlbaranesAProveedor.xInfoActualizadaS_BASES.AsFloat >= ImporteMinimoPortes)) then
           Resaltado := True;
     end;

     if Resaltado then
        ColorResaltado2(DBEImporteMinimoPorte)
     else
        ColorInfo(DBEImporteMinimoPorte);
  end;
end;

procedure TFMAlbaranesAProveedor.DBEFMotivoAbonoChange(Sender: TObject);
begin
  inherited;
  EMotivoAbono.Text := DMMain.DameMotivoAbono(StrToIntDef(DBEFMotivoAbono.Text, 0));
end;

procedure TFMAlbaranesAProveedor.ARelacionaConReparacionExecute(Sender: TObject);
var
  IdReparacion : integer;
begin
  inherited;
  IdReparacion := 0;
  if (UFMSeleccion.PideDato('REP', IdReparacion, _('Reparacion'), 'SITUACION <> 5')) then
  begin
     DMAlbaranesAProveedor.InsertaDetalleAReparacion(IdReparacion);

     FMain.EjecutaAccion(FMain.AReparaciones, 'IDCABREPARAR = ' + IntToStr(IdReparacion));
  end;
end;

procedure TFMAlbaranesAProveedor.FormActivate(Sender: TObject);
begin
  inherited;
  EstableceVisibilidadStockAlmacen;
end;

procedure TFMAlbaranesAProveedor.EstableceVisibilidadStockAlmacen;

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

     Descripcion := Descripcion + ' ' + AlmacenStock;

     i := EncuentraField(DBGFDetalle, Campo);
     if (i >= 0) then
     begin
        with DBGFDetalle.Columns[i] do
        begin
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
           Visible := (AlmacenStock <> 'NOCALC');
        end;
     end;
  end;

begin
  EstableceVisibilidad('STOCK_ALM', 'ALPSTKA001', _('Stock'));
  EstableceVisibilidad('STOCK_ALM2', 'ALPSTKA002', _('Stock'));
  EstableceVisibilidad('STOCK_ALM3', 'ALPSTKA003', _('Stock'));
end;

end.
