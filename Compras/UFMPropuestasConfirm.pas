unit UFMPropuestasConfirm;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada, ActnList,
  UFormGest, Variants, DB, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBDateEdit, ULFMemo, URecursos,
  UFPEditDetalle, UG2kTBLoc, ULFEdit;

type
  TFMPropuestasConfirm = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PCabNotas: TLFPanel;
     LPropuesta: TLFLabel;
     DBERIG: TLFDbedit;
     LEstado: TLFLabel;
     LFechaCabecera: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LProveedor: TLFLabel;
     PEdNotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     DBEDtoPP: TLFDbedit;
     LDtoPP: TLFLabel;
     PTitNotas: TLFPanel;
     DBENotasFechaCab: TLFDbedit;
     LFecha: TLFLabel;
     DBENotasProveedorTituloCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     DBEDtoCial: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LDtoCial: TLFLabel;
     EFAlmacen: TLFDBEditFind2000;
     DBETituloAlmacen: TLFDbedit;
     LAlmacen: TLFLabel;
     DBETituloProveedor: TLFDbedit;
     DBEFProveedor: TLFDBEditFind2000;
     ALPropConfirm: TLFActionList;
     AUnidades_Ext: TAction;
     APreciosTarifa: TAction;
     LBLFormaPago: TLFLabel;
     DBEFFormaPago: TLFDBEditFind2000;
     DBEFormaPago: TLFDbedit;
     AInfoStocks: TAction;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PPieGenerico: TLFPanel;
     LBaseImponible: TLFLabel;
     LCuotaIVAyRec: TLFLabel;
     LLiquido: TLFLabel;
     DBES_Bases: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBELiquido: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PPieComisiones: TLFPanel;
     LBaseDtoLinea: TLFLabel;
     LImporte: TLFLabel;
     LImporteBases: TLFLabel;
     LImporteFinanciacion: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBESumaBases: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     TSep8: TToolButton;
     TButtArtTarifa: TToolButton;
     TButtUnidades_Ext: TToolButton;
     TButtInfoStocks: TToolButton;
     TSep2: TToolButton;
     TButtImprimeListado: TToolButton;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtNotas: TToolButton;
     ANotasDetalle: TAction;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     DBETituloEstado: TLFDbedit;
     TButtInfoHistorico: TToolButton;
     AInfoHistorico: TAction;
     TButtPrecios: TToolButton;
     ANewProveedor: TAction;
     ANewArticulo: TAction;
     AAProveedor: TAction;
     AArticulo: TAction;
     SBAProveedor: TSpeedButton;
     AImprime: TAction;
     MISepEnlaces: TMenuItem;
     MIVerDatosProveedor: TMenuItem;
     TBArtProv: TToolButton;
     ToolButton2: TToolButton;
     AArticuloProv: TAction;
     LBLReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     DBENotasSuReferenciaCab: TLFDbedit;
     LBLReferenciaNotas: TLFLabel;
     ADuplicar: TAction;
     ARegenerar: TAction;
     AAnulaDocumento: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AHerencia: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AOrdenaLineas: TAction;
     ASep1: TAction;
     ATraspasoAPedido: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AInformePropConf: TAction;
     AVisualizarPropConfFiltradas: TAction;
     AImprimirPropConfFiltradas: TAction;
     AVisualizaPropConfMail: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListadoPropConf: TAction;
     LFCategoryAction5: TLFCategoryAction;
     AEnviarPropConfEmail: TAction;
     AEnviarPropConfMailPdf: TAction;
     ASep: TAction;
     AResumenPropConf: TAction;
     AResumenPropConfFiltradas: TAction;
     AImprimirResumenPropConfFiltradas: TAction;
     ASep2: TAction;
     AConfListadoResumenPropConf: TAction;
     AMultiCanal: TAction;
     ABuscarArticulo: TAction;
     ToolButton1: TToolButton;
     TButtBuscarArticulo: TToolButton;
     AEnviarPropMailPdf2: TAction;
     LBLUnidades: TLFLabel;
     DBESumUnidades: TLFDbedit;
     LTelefono: TLFLabel;
     DBDTPFechaPrevista: TLFDBDateEdit;
     LFechaPrevista: TLFLabel;
     DBCHKListado: TLFDBCheckBox;
     LFCategoryActionAdjuntos: TLFCategoryAction;
     AAdjuntoPropuestaConfirmada: TAction;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     AListarEtiquetas: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     ACondicionesCompra: TAction;
     TButtCondicionesCompra: TToolButton;
     EFBuscaNIFKRI: TLFEditFind2000;
     TButtBuscaNIFKRI: TToolButton;
     ABuscaNIFKRI: TAction;
     CEOtros: TControlEdit;
     CEOtrosPMEdit: TPopUpTeclas;
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
     PEdOtros: TLFPanel;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     DBETitMoneda: TLFDbedit;
     DBETitProyecto: TLFDbedit;
     EFProyecto: TLFDBEditFind2000;
     LBLProyecto: TLFLabel;
     LPorcentajeFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     DBCHKCambio: TLFDBCheckBox;
     LValorCambio: TLFLabel;
     DBEValorCambio: TLFDbedit;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     TButtImportarDetalle: TToolButton;
     AImportarDetalle: TAction;
     AAsignacionCodigoBarra: TAction;
     AAbrirCerrar: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     RelojEmail: TTimer;
     LEmail: TLFLabel;
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
     DBCBAceptaEntregaParcial: TLFDBCheckBox;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     ABorradoMasivoLineas: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     EIdioma: TLFEdit;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     DBEProyectoFicha: TLFDbedit;
     DBEFProyectoFicha: TLFDBEditFind2000;
     LProyectoFicha: TLFLabel;
     PNLPieUnidades: TLFPanel;
     DBESumUdsSec: TLFDbedit;
     DBESumUdsLog: TLFDbedit;
     PNLPieInfo: TLFPanel;
     LCantLineas: TLFLabel;
     LSumaPeso: TLFLabel;
     DBECantLineas: TLFDbedit;
     DBESumaPeso: TLFDbedit;
     PNLInfoImportes: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EFDireccionBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSerieChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TButtArtTarifaClick(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure AUnidades_ExtExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure AInfoHistoricoExecute(Sender: TObject);
     procedure APreciosTarifaExecute(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewProveedorExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAProveedorExecute(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure DBETituloProveedorEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure AArticuloProvExecute(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ARegenerarExecute(Sender: TObject);
     procedure AAnulaDocumentoExecute(Sender: TObject);
     procedure AHerenciaExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure ATraspasoAPedidoExecute(Sender: TObject);
     procedure AInformePropConfExecute(Sender: TObject);
     procedure AVisualizarPropConfFiltradasExecute(Sender: TObject);
     procedure AImprimirPropConfFiltradasExecute(Sender: TObject);
     procedure AVisualizaPropConfMailExecute(Sender: TObject);
     procedure AConfListadoPropConfExecute(Sender: TObject);
     procedure AEnviarPropConfEmailExecute(Sender: TObject);
     procedure AEnviarPropConfMailPdfExecute(Sender: TObject);
     procedure AResumenPropConfExecute(Sender: TObject);
     procedure AResumenPropConfFiltradasExecute(Sender: TObject);
     procedure AImprimirResumenPropConfFiltradasExecute(Sender: TObject);
     procedure AConfListadoResumenPropConfExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure AMultiCanalExecute(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure AEnviarPropMailPdf2Execute(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBEFProveedorExiste(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure AAdjuntoPropuestaConfirmadaExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure LBNotasClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure ACondicionesCompraExecute(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure AAsignacionCodigoBarraExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearHerenciaManualExecute(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroAnuladoExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
  private
     { Private declarations }
     param_OCPINSE001: boolean;
     Param_COMTIVA001: boolean;
     Param_ARTBUSQ004: boolean;
     ColActual: TColumn;
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     DBGDetalleArticulo: string;
     procedure MuestraFiltrado(Tipo: byte);
     procedure HabilitaEnlaces;
     procedure HabilitaBotones;
     procedure HabilitaBotonesDetalle;
     procedure AbreOCierra;
     procedure RefrescaAvisos;
  public
     { Public declarations }
     SWCerrar, FiltroListadoFiltrado: integer;
     Editando: boolean;
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
  end;

var
  FMPropuestasConfirm : TFMPropuestasConfirm;

procedure TraspasoPropConfProv(id_e: integer);

implementation

uses UDMMain, UEntorno, UDMPropuestasConfirm, UFMLSTEntreFechas,
  UFMListConfig, UFMArticulosTarifa, UUtiles, UFMDocInfoStocks, UFCHerenciaProv,
  UFMNotasCampo, UFMain, UFVerTercerosPorArticulo,
  UFSendCorreo, UDMListados, UDMLstPropConf_Prov, UDMLstPropConfirmProv,
  UFMTraspasoMultiCanal, UFMAdjunto, UFMImprimirCodBarras, HYFIBQuery, UParam,
  UFMCondicionesCompra, UFMSeleccion, UFMInsercionArticuloDesdeTexto,
  {$IFNDEF TPV}UFMAsignacionCodigoBarra {$ENDIF}, UFMHerenciaManual,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMSeleccionArticulo, UFMProcesosMasivosLineas, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMPropuestasConfirm.FormCreate(Sender: TObject);
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

  AbreData(TDMPropuestasConfirm, DMPropuestasConfirm);

  {dji lrk kri}
  if REntorno.SerieRestringida <> '' then
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;
  NavMAin.DataSource := DMPropuestasConfirm.DSCabecera;
  DBGMain.DataSource := DMPropuestasConfirm.DSCabecera;
  NavDetalle.DataSource := DMPropuestasConfirm.DSDetalle;
  DBGFDetalle.DataSource := DMPropuestasConfirm.DSDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMPropuestasConfirm.DSCabecera;
     Entorno := DMPropuestasConfirm.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
  end;
  FiltroListadoFiltrado := 0;
  SWCerrar := 0;

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
  ColActual := DBGFDetalle.Columns[0];

  if (DMMain.EstadoKri(264) <> 1) then {Habilita el envío de email con pdf a traves del cliente windows}
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarPropMailPdf2) then
           ALMain.Actions[i].Free;

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
        CamposChecked[i] := '512';
  end;

  AbreOCierra;
end;

procedure TFMPropuestasConfirm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  MTelefonos.Free;
  MNotas.Free;
  if SWCerrar = 1 then
     FMArticulosTarifa.Close;
  CierraData(DMPropuestasConfirm);
end;

procedure TFMPropuestasConfirm.DBGFDetalleBusqueda(Sender: TObject);
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
        if (FMain.AArticulos.Enabled = True) then
           Accion := ANewArticulo;
     end
     else
     if Trim(TablaABuscar) = 'SYS_TIPO_IVA' then
     begin
        CondicionBusqueda := 'PAIS =''' + REntorno.Pais + '''';

        if not Param_COMTIVA001 then
        begin
           if (Trim(TablaABuscar) = 'SYS_TIPO_IVA') then
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMPropuestasConfirm.QMDetalleTIPO_IVA.AsInteger);
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
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMPropuestasConfirm.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
        end;

        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if Trim(TablaABuscar) = 'ART_ARTICULOS_CODPROV' then
     begin
        CondicionBusqueda :=
           'PROVEEDOR =' + IntToStr(DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger) +
           ' AND EMPRESA = ' + REntorno.EmpresaStr + '';
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
     if Trim(TablaABuscar) = 'ART_ALMACENES' then
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
           '(ARTICULO=''' + DMPropuestasConfirm.QMDetalleARTICULO.AsString + ''')';
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

procedure TFMPropuestasConfirm.EFDireccionBusqueda(Sender: TObject);
begin
  // EFDireccion.CondicionBusqueda:='TERCERO='+DMDocsPedidoAProv.QMCabeceraTERCERO.AsString;
end;

procedure TFMPropuestasConfirm.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPropuestasConfirm.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMPropuestasConfirm.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  Resultado := DMPropuestasConfirm.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;
  Continua := False;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMPropuestasConfirm.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  // Edicion de IVA habilitada en documentos de venta
  Param_COMTIVA001 := (LeeParametro('COMTIVA001', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');

  param_OCPINSE001 := (LeeParametro('OCPINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_OCPINSE001;
  DBERIG.ReadOnly := not param_OCPINSE001;

  HabilitaBotones;
end;

procedure TFMPropuestasConfirm.FormActivate(Sender: TObject);
begin
  inherited;
  // TSFicha.SetFocus;
end;

procedure TFMPropuestasConfirm.TButtArtTarifaClick(Sender: TObject);
begin
  SWCerrar := 1;
  AbreForm(TFMArticulosTarifa, FMArticulosTarifa, Sender);
end;

procedure TFMPropuestasConfirm.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (Editando) then
     DMPropuestasConfirm.RefrescaTabla;
end;

procedure TFMPropuestasConfirm.AUnidades_ExtExecute(Sender: TObject);
begin
  if DBGFDetalle.SelectedField.FieldName = 'UNIDADES' then // No utilizo DisplayName porque cambia con el idioma
     DBGFDetalle.SelectedIndex := DBGFDetalle.SelectedIndex + 1;

  DMPropuestasConfirm.CambiaUnidadesExt(DMPropuestasConfirm.QMDetalleARTICULO, True);
end;

procedure TFMPropuestasConfirm.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     DMPropuestasConfirm.BorraLineaExt;
  if Button = nbDelete then
     DMPropuestasConfirm.ControlaRestriccion;
end;

procedure TFMPropuestasConfirm.AInfoStocksExecute(Sender: TObject);
var
  Almacen, Articulo : string;
begin
  DMPropuestasConfirm.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMPropuestasConfirm.DBGFDetalleColEnter(Sender: TObject);
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

procedure TFMPropuestasConfirm.ANotasDetalleExecute(Sender: TObject);
begin
  DMPropuestasConfirm.PreparaNotasDetalle;
  EditarCampoNotas(Self, DMPropuestasConfirm.DSDetalle, DMPropuestasConfirm.QMDetalleNOTAS, DMPropuestasConfirm.QMDetalleNOTAS2, (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMPropuestasConfirm.AInfoHistoricoExecute(Sender: TObject);
begin
  DMPropuestasConfirm.Historico;
end;

procedure TFMPropuestasConfirm.APreciosTarifaExecute(Sender: TObject);
begin
  DMPropuestasConfirm.CambiaPreciosTarifa;
end;

procedure TFMPropuestasConfirm.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  DMPropuestasConfirm.MascarasMoneda;
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

procedure TFMPropuestasConfirm.ANewProveedorExecute(Sender: TObject);
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
     EFAlmacen.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMPropuestasConfirm.ANewArticuloExecute(Sender: TObject);
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
        DMPropuestasConfirm.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMPropuestasConfirm.AAProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFProveedor.Text <> '' then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DBEFProveedor.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMPropuestasConfirm.SBAProveedorDblClick(Sender: TObject);
begin
  AAProveedor.Execute;
end;

procedure TFMPropuestasConfirm.HabilitaEnlaces;
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

  DBETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, DBETitProyecto);
end;

procedure TFMPropuestasConfirm.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMPropuestasConfirm.FiltraCabecera(ejercicio, serie, rig);
  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.DBETituloProveedorEnter(Sender: TObject);
begin
  DBEFProveedor.SetFocus;
end;

procedure TFMPropuestasConfirm.HabilitaBotones;
var
  Habil : boolean;
begin
  Habil := DMPropuestasConfirm.HayDocumentos;

  ADuplicar.Enabled := Habil;
  ARegenerar.Enabled := Habil;
  AAnulaDocumento.Enabled := Habil;
  AHerencia.Enabled := Habil;

  EFAlmacen.Enabled := REntorno.AlmacenRestringido = '';

  HabilitaBotonesDetalle;
end;

procedure TFMPropuestasConfirm.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
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
  // bit 9 = 0 --> Propuestas confirmadas. restringidas
  if (((REntorno.RestriccionDocumento and 512) = 0) and
     ((DMPropuestasConfirm.xInfoActualizadaMODIFICA_DOC.AsInteger and 512) = 512)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if Button in [nbPost, nbDelete, nbCancel] then
     HabilitaBotones
  else if Button in [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbRefresh] then
     HabilitaBotonesDetalle;

  {dji lrk kri}
  if ((Button in [nbInsert]) and (REntorno.AlmacenRestringido <> '')) then
     EFAlmacen.Text := REntorno.AlmacenRestringido;

  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.HabilitaBotonesDetalle;
var
  Habil, HabilEd : boolean;
begin
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMPropuestasConfirm.HayDetalle) or (DMPropuestasConfirm.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMPropuestasConfirm.QMDetalle.State in [dsInsert, dsEdit]);

  TButtNotas.Enabled := HabilEd;
  TButtInfoStocks.Enabled := Habil;
  TButtUnidades_Ext.Enabled := HabilEd;
  TButtPrecios.Enabled := Habil;
  TButtInfoHistorico.Enabled := Habil;
  TButtArtTarifa.Enabled := Habil;
  AOrdenaLineas.Enabled := Habil;
  TBArtProv.Enabled := Habil;
  TButtBuscarArticulo.Enabled := True;   // Siempre habilitadoend;
  TButtImportarDetalle.Enabled := True;  // Siempre Activo

  // En el caso del Tipo de IVA tenemos que ver el parámetro COMTIVA001
  HabilitaColumna(DBGFDetalle, 'TIPO_IVA', Param_COMTIVA001);
end;

procedure TFMPropuestasConfirm.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // if (DMPropuestasConfirm.QMDetalle.State = dsinsert) then
  HabilitaBotonesDetalle;
end;

procedure TFMPropuestasConfirm.DBGFDetalleDblClick(Sender: TObject);
begin
  if DMPropuestasConfirm.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;
  end;
end;

procedure TFMPropuestasConfirm.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos,
        'ARTICULO = ''' + DMPropuestasConfirm.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMPropuestasConfirm.AArticuloProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMPropuestasConfirm.QMDetalleARTICULO.AsString, 0);
end;

procedure TFMPropuestasConfirm.RelojNotasTimer(Sender: TObject);
begin
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMPropuestasConfirm.ADuplicarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPropuestasConfirm.Duplica;
  finally
     Screen.Cursor := crDefault;
     HabilitaBotones;
  end;
end;

procedure TFMPropuestasConfirm.ARegenerarExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Proveedor-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMPropuestasConfirm.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMPropuestasConfirm.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMPropuestasConfirm.ActualizaCondicionesProv(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMPropuestasConfirm.AAnulaDocumentoExecute(Sender: TObject);
begin
  DMPropuestasConfirm.AnulaDocumento;
end;

procedure TFMPropuestasConfirm.AHerenciaExecute(Sender: TObject);
var
  rig, ejercicio : integer;
  Tipo, num_factura, titulo, serie : string;
begin
  DMPropuestasConfirm.DatosHerencia(rig, ejercicio, Tipo, num_factura, titulo, serie);
  MuestraHerencia(rig, ejercicio, Tipo, num_factura, titulo, serie, Self);
end;

procedure TFMPropuestasConfirm.FormShow(Sender: TObject);
var
  i : smallint;
begin
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
        DBGFDetalle.FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
        if (DBGFDetalle.FindColumn(Format('ALFA_%d', [i])).Title.Caption = '') then
           DBGFDetalle.FindColumn(Format('ALFA_%d', [i])).Title.Caption := Format(_('Campo %d'), [i]);
     end;
  end;
end;

procedure TFMPropuestasConfirm.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMPropuestasConfirm.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(DBGFDetalle, Rect);
  end;
end;

procedure TFMPropuestasConfirm.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMPropuestasConfirm.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMPropuestasConfirm.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if button = nbDelete then
     DMPropuestasConfirm.ControlaRestriccion;
  if button in [nbEdit] then
     Editando := True
  else
     Editando := False;
end;

procedure TFMPropuestasConfirm.AOrdenaLineasExecute(Sender: TObject);
begin
  DMPropuestasConfirm.OrdenarLineas;
end;

procedure TFMPropuestasConfirm.ATraspasoAPedidoExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPropuestasConfirm.TraspasarA('PEP');
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TraspasoPropConfProv(id_e: integer);
begin
  FMain.EjecutaAccion(FMain.APropuestasConfirm);
  FMain.TraspasodeDocumentosEntrada(id_e);
end;

procedure TFMPropuestasConfirm.AInformePropConfExecute(Sender: TObject);
begin
  AbreData(TDMLstPropConf_Prov, DMLstPropConf_Prov);
  AInformePropConf.Enabled := False;
  try
     DMLstPropConf_Prov.MostrarListado(0, EFSerie.Text);
  finally
     AInformePropConf.Enabled := True;
     CierraData(DMLstPropConf_Prov);
  end;

  DMPropuestasConfirm.InfoActualiza;
end;

procedure TFMPropuestasConfirm.AVisualizarPropConfFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(2);
end;

procedure TFMPropuestasConfirm.AImprimirPropConfFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(3);
end;

procedure TFMPropuestasConfirm.AVisualizaPropConfMailExecute(Sender: TObject);
var
  Memo : TStrings;
begin
  AbreData(TDMLstPropConf_prov, DMLstPropConf_prov);
  Memo := TStringList.Create;
  DMLstPropConf_prov.MostrarListadoMail(DMPropuestasConfirm.QMCabeceraID_E.AsInteger, EFSerie.Text,
     0, DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger, Memo);
  Memo.Free;
  CierraData(DMLstPropConf_prov);
end;

procedure TFMPropuestasConfirm.AConfListadoPropConfExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPropConf_Prov, DMLstPropConf_Prov);
  TFMListConfig.Create(Self).Muestra(519, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstPropConf_Prov.frPropConfirm, DMLstPropConf_Prov.HYReport);
  CierraData(DMLstPropConf_Prov);
end;

procedure TFMPropuestasConfirm.AEnviarPropConfEmailExecute(Sender: TObject);
var
  Memo, CuerpoMail : TStrings;
  Asunto : string;
  DMLstPropConf_ProvCargado, DMListadosCargado : boolean;
begin
  // esto es porque el assigned no va

  DMLstPropConf_ProvCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPropConf_prov, DMLstPropConf_prov);
           DMLstPropConf_ProvCargado := True;
           Memo := TStringList.Create;
           try
              DMLstPropConf_prov.MostrarListadoMail(DMPropuestasConfirm.QMCabeceraID_E.AsInteger, EFSerie.Text,
                 1, DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger, Memo);

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMPropuestasConfirm.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMPropuestasConfirm.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMPropuestasConfirm.QMCabeceraRIG.AsInteger;
                 Fecha := DMPropuestasConfirm.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMPropuestasConfirm.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := DMLstPropConf_prov.nombreFich;
                 Matricula := '';
                 if (DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger > 0) then
                 begin
                    NombreComercial := DMPropuestasConfirm.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
                    RazonSocial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPropuestasConfirm.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 DMListados.SendMailTercero(DMPropuestasConfirm.QMCabeceraTercero.AsInteger, Memo, Asunto);
              finally
                 CuerpoMail.Free;
              end;
           finally
              Memo.Free;
           end;
           CierraData(DMLstPropConf_prov);
           DMLstPropConf_ProvCargado := False;
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

           if DMLstPropConf_ProvCargado then
              CierraData(DMLstPropConf_prov);
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

procedure TFMPropuestasConfirm.AEnviarPropConfMailPdfExecute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  DMLstPropConf_provCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // esto es porque el assigned no va

  DMLstPropConf_provCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPropConf_prov, DMLstPropConf_prov);
           DMLstPropConf_provCargado := True;

           Memo := TStringList.Create;
           try
              DMLstPropConf_prov.MostrarListadoMail(DMPropuestasConfirm.QMCabeceraID_E.AsInteger, EFSerie.Text,
                 2, DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger, Memo);

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMPropuestasConfirm.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMPropuestasConfirm.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMPropuestasConfirm.QMCabeceraRIG.AsInteger;
                 Fecha := DMPropuestasConfirm.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMPropuestasConfirm.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := DMLstPropConf_prov.nombreFich;
                 Matricula := '';
                 if (DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger > 0) then
                 begin
                    NombreComercial := DMPropuestasConfirm.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
                    RazonSocial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPropuestasConfirm.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 DMListados.SendMailTerceroPDF(DMPropuestasConfirm.QMCabeceraTercero.AsInteger, CuerpoMail,
                    DMLstPropConf_prov.rutaFich, DMLstPropConf_prov.nombreFich, Asunto, DMPropuestasConfirm.QMCabeceraTIPO.AsString, DMPropuestasConfirm.QMCabeceraID_E.AsInteger);
              finally
                 CuerpoMail.Free;
              end;
           finally
              Memo.Free;
           end;
           CierraData(DMLstPropConf_prov);
           DMLstPropConf_provCargado := False;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           Application.ProcessMessages;
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

           // Liberamos objetos creados
           if DMLstPropConf_provCargado then
              CierraData(DMLstPropConf_prov);
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
  DMPropuestasConfirm.InfoActualiza;
end;

procedure TFMPropuestasConfirm.MuestraFiltrado(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMPropuestasConfirm.QMCabecera.SelectSQL);

     AbreData(TDMLstPropConf_prov, DMLstPropConf_prov);
     try
        with DMLstPropConf_prov do
        begin
           TempSql.AddStrings(QMCabecera.SelectSQL);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(SqlFiltro);
           // Utilizo la vista para listado
           QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_OCP', 'VER_CABECERAS_OCP_LST', [rfReplaceAll]);
           QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
           QMCabecera.Open;
           QMCabecera.First;
           MostrarListadoFiltrado(Tipo, FiltroListadoFiltrado, EFSerie.Text);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(TempSQL);
        end;
     finally
        CierraData(DMLstPropConf_prov);
     end;
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;

  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.AResumenPropConfExecute(Sender: TObject);
begin
  AbreData(TDMLstPropConfirmProv, DMLstPropConfirmProv);
  TFMLstEntreFechas.Create(Self).muestra('OCP', EFSerie.Text);
  CierraData(DMLstPropConfirmProv);
end;

procedure TFMPropuestasConfirm.AResumenPropConfFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMPropuestasConfirm.AImprimirResumenPropConfFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMPropuestasConfirm.AConfListadoResumenPropConfExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPropConfirmProv, DMLstPropConfirmProv);
  TFMListConfig.Create(Self).Muestra(521, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstPropConfirmProv.frPropConfirm);
  CierraData(DMLstPropConfirmProv);
end;

procedure TFMPropuestasConfirm.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMPropuestasConfirm.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMPropuestasConfirm.AMultiCanalExecute(Sender: TObject);
var
  Accion : integer;
begin
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(Self);
  Accion := FMTraspasoMultiCanal.Carga(DMPropuestasConfirm.QMCabeceraID_E.AsInteger, DMPropuestasConfirm.QMCabeceraRIG.AsInteger,
     DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger, DMPropuestasConfirm.QMCabeceraCANAL.AsInteger, 0,
     DMPropuestasConfirm.QMCabeceraTIPO.AsString, DMPropuestasConfirm.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);
  DMPropuestasConfirm.RefrescaCabecera(Accion);
end;

procedure TFMPropuestasConfirm.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.ABuscarArticuloExecute(Sender: TObject);
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

  DMPropuestasConfirm.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMPropuestasConfirm.EFProyectoBusqueda(Sender: TObject);
begin
  EFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMPropuestasConfirm.NavDetalleChangeState(Sender: TObject);
begin
  if DMPropuestasConfirm.Inhabilitar then  // Si estamos insertando o updateando, se deshabilitan
  begin
     TButtNotas.Enabled := False;
     TButtInfoStocks.Enabled := True;
     TButtUnidades_Ext.Enabled := False;
     TButtPrecios.Enabled := True;
     TButtInfoHistorico.Enabled := True;
     TBArtProv.Enabled := True;
     TButtBuscarArticulo.Enabled := False;
     AOrdenaLineas.Enabled := True;
  end;

  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

procedure TFMPropuestasConfirm.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  // if button in [nbPost, nbDelete, nbCancel] then
  HabilitaBotonesDetalle;

  if Button in [nbRefresh] then
     DMPropuestasConfirm.RellenaDatosOldLinea;
end;

procedure TFMPropuestasConfirm.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(DBGDetalleArticulo, False, True) then
        begin
           DMPropuestasConfirm.QMDetalle.Edit;
           DMPropuestasConfirm.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMPropuestasConfirm.DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
begin
  {
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMPropuestasConfirm.BusquedaArticulo(valor);
  DMPropuestasConfirm.Continua;
  }
end;

// sfg_XGM-begin- especial abrir cliente de correo predeterminado (El DMlistados tienes que ser a medida)
procedure TFMPropuestasConfirm.AEnviarPropMailPdf2Execute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstPropConf_Prov, DMLstPropConf_Prov);
  try
     Memo := TStringList.Create;
     try
        DMLstPropConf_Prov.MostrarListadoMail(DMPropuestasConfirm.QMCabeceraID_E.AsInteger, EFSerie.Text,
           2, DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger, Memo);

        InicializaVariableEmail(DMPropuestasConfirm.QMCabeceraTIPO.AsString);
        with VariableEmail do
        begin
           Ejercicio := DMPropuestasConfirm.QMCabeceraEJERCICIO.AsInteger;
           Serie := DMPropuestasConfirm.QMCabeceraSERIE.AsString;
           NumeroDocumento := DMPropuestasConfirm.QMCabeceraRIG.AsInteger;
           Fecha := DMPropuestasConfirm.QMCabeceraFECHA.AsDateTime;
           SuReferencia := DMPropuestasConfirm.QMCabeceraSU_REFERENCIA.AsString;
           SuPedido := '';
           Folio := '';
           TituloDocTributario := '';
           NombreFichero := DMLstPropConf_prov.nombreFich;
           Matricula := '';
           if (DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger > 0) then
           begin
              NombreComercial := DMPropuestasConfirm.QMCabeceraNOMBRE_COMERCIAL.AsString;
              RazonSocial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
           end
           else
           begin
              // El campo TITULO se rellena con el nombre asignado al Tercero Vario
              NombreComercial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
              RazonSocial := DMPropuestasConfirm.QMCabeceraTITULO.AsString;
           end;
           OrdenTrabajo := 0;
           UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPropuestasConfirm.QMCabeceraENTRADA.AsInteger));
        end;
        DamePartesEmail(Asunto, CuerpoMail);
        try
           DMListados.SendMailTerceroPDF2(DMPropuestasConfirm.QMCabeceraTercero.AsInteger, CuerpoMail,
              DMLstPropConf_Prov.rutaFich, DMLstPropConf_Prov.nombreFich, Asunto, DMPropuestasConfirm.QMCabeceraTIPO.AsString, DMPropuestasConfirm.QMCabeceraID_E.AsInteger);
        finally
           CuerpoMail.Free;
        end;
     finally
        Memo.Free;
     end;

     // Marco el documento como listado
     DMLstPropConf_Prov.UpdateaDocumentos;
  finally
     CierraData(DMLstPropConf_Prov);
  end;
  DMPropuestasConfirm.InfoActualiza;
end;
// sfg_XGM-end- especial abrir cliente de correo predeterminado

procedure TFMPropuestasConfirm.DBEFProveedorChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMPropuestasConfirm.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.DBEFProveedorExiste(Sender: TObject);
begin
  if (not DMMain.ProveedorValido(StrToIntDef(DBEFProveedor.Text, 0))) then
     DBEFProveedor.Text := '';
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMPropuestasConfirm.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMPropuestasConfirm.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMPropuestasConfirm.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMPropuestasConfirm.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMPropuestasConfirm.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMPropuestasConfirm.AAdjuntoPropuestaConfirmadaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('OCP', DMPropuestasConfirm.QMCabeceraID_E.AsInteger);
end;

procedure TFMPropuestasConfirm.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMPropuestasConfirm.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMPropuestasConfirm.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', DameIDProveedor(DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMPropuestasConfirm.AListarEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos(DMPropuestasConfirm.QMCabeceraTIPO.AsString, DMPropuestasConfirm.QMCabeceraID_E.AsInteger);
end;

procedure TFMPropuestasConfirm.ADuplicarLineaExecute(Sender: TObject);
begin
  DMPropuestasConfirm.DuplicarLinea;
end;

procedure TFMPropuestasConfirm.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstPropConf_Prov, DMLstPropConf_Prov);
  try
     DMLstPropConf_Prov.MostrarListado(1, EFSerie.Text);
  finally
     CierraData(DMLstPropConf_Prov);
  end;
  DMPropuestasConfirm.InfoActualiza;
end;

procedure TFMPropuestasConfirm.LBNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMPropuestasConfirm.xProveedor.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMPropuestasConfirm.xProveedor.FieldByName('NOTAS').AsString);
        {
        if (Trim(DMPropuestasConfirm.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMPropuestasConfirm.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        }
        if (Trim(DMPropuestasConfirm.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMPropuestasConfirm.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMPropuestasConfirm.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPropuestasConfirm.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';

  G2KTableLoc.Click;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPropuestasConfirm.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMPropuestasConfirm.ACondicionesCompraExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMCondicionesCompra, FMCondicionesCompra);
  with FMCondicionesCompra do
  begin
     EFProveedor.Text := DBEFProveedor.Text;
     EFFiltroArticulo.Text := DMPropuestasConfirm.QMDetalleARTICULO.AsString;
     EFFiltroFamilia.Text := DMPropuestasConfirm.xArticulos.FieldByName('FAMILIA').AsString;
     EFFiltroArticuloPorPrecio.Text := DMPropuestasConfirm.QMDetalleARTICULO.AsString;
     EFFiltraFamiliaPorPrecio.Text := DMPropuestasConfirm.xArticulos.FieldByName('FAMILIA').AsString;
  end;
end;

procedure TFMPropuestasConfirm.EFBuscaNIFKRIChange(Sender: TObject);
begin
  if (StrToIntDef(EFBuscaNIFKRI.Text, 0) <> 0) then
     with DMPropuestasConfirm.QMCabecera do
     begin
        DisableControls;
        First;
        while ((DMPropuestasConfirm.QMCabeceraID_E.AsInteger <> StrToIntDef(EFBuscaNIFKRI.Text, 0)) and (not DMPropuestasConfirm.QMCabecera.EOF)) do
           Next;
        EnableControls;
     end;
end;

procedure TFMPropuestasConfirm.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'tipo=''OCP'' and serie=''' + EFSerie.Text + '''';
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

procedure TFMPropuestasConfirm.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMPropuestasConfirm.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMPropuestasConfirm.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMPropuestasConfirm;
     ShowModal;
     Free;
  end;
end;

procedure TFMPropuestasConfirm.AAsignacionCodigoBarraExecute(Sender: TObject);
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
  with DMPropuestasConfirm.QMDetalle do
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

           Posicionar(DMPropuestasConfirm.QMDetalle, 'ID_DETALLES_E', IdDetallesE);
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

procedure TFMPropuestasConfirm.AAbrirCerrarExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     if (AAbrirCerrar.Tag = 0) then
        DMPropuestasConfirm.CierraDocumento
     else
        DMPropuestasConfirm.AbreDocumento
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPropuestasConfirm.AbreOCierra;
begin
  if (DMPropuestasConfirm.EstadoDocumento = 0) then
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

  ColorSegunEstado(DBETituloEstado, DMPropuestasConfirm.QMCabeceraESTADO.AsInteger);
end;

procedure TFMPropuestasConfirm.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMPropuestasConfirm.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMPropuestasConfirm.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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

procedure TFMPropuestasConfirm.ACrearHerenciaManualExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMPropuestasConfirm.QMDetalleTIPO.AsString, DMPropuestasConfirm.QMDetalleID_DETALLES_E.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMPropuestasConfirm.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if ((Button = nbDelete) and (DMPropuestasConfirm.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMPropuestasConfirm.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMPropuestasConfirm.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMPropuestasConfirm.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMPropuestasConfirm.FiltraDocumento(EFSerie.Text, 'ESTADO = 0');
end;

procedure TFMPropuestasConfirm.AFiltroAnuladoExecute(Sender: TObject);
begin
  inherited;
  DMPropuestasConfirm.FiltraDocumento(EFSerie.Text, 'ESTADO = 2');
end;

procedure TFMPropuestasConfirm.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMPropuestasConfirm.FiltraDocumento(EFSerie.Text, 'ESTADO = 5');
end;

procedure TFMPropuestasConfirm.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + DMPropuestasConfirm.QMCabeceraTERCERO.AsString;
end;

procedure TFMPropuestasConfirm.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('OCP', DMPropuestasConfirm.QMCabeceraID_E.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoPropuestaConfirmada.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMPropuestasConfirm.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGDetalleArticulo := '';
end;

procedure TFMPropuestasConfirm.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
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

procedure TFMPropuestasConfirm.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMPropuestasConfirm.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMPropuestasConfirm.QMDetalleTIPO.AsString, DMPropuestasConfirm.QMDetalleID_E.AsInteger);

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
                 Params.ByName['ID_E'].AsInteger := DMPropuestasConfirm.QMDetalleID_E.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMPropuestasConfirm.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMPropuestasConfirm.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  EIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMPropuestasConfirm.RefrescaAvisos;
begin
  if (((DMPropuestasConfirm.xProveedor.Active) and (Trim(DMPropuestasConfirm.xProveedor.FieldByName('NOTAS').AsString) > '')) or
     ((DMPropuestasConfirm.xAvisos.Active) and (Trim(DMPropuestasConfirm.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
     RelojNotas.Enabled := True
  else
     RelojNotas.Enabled := False;

  LBNotas.Visible := RelojNotas.Enabled;

  if (DMMain.ExisteAdjunto(DMPropuestasConfirm.QMCabeceraTIPO.AsString, DMPropuestasConfirm.QMCabeceraID_E.AsInteger)) then
     RelojAdjuntos.Enabled := True
  else
     RelojAdjuntos.Enabled := False;

  LAdjuntos.Visible := RelojAdjuntos.Enabled;

  if (DMMain.EnviarFacturasProvAcrePorEmail(DMPropuestasConfirm.QMCabeceraPROVEEDOR.AsInteger)) then
     RelojEmail.Enabled := True
  else
     RelojEmail.Enabled := False;

  LEmail.Visible := RelojEmail.Enabled;
end;

end.
