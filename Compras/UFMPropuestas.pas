unit UFMPropuestas;

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
  TFMPropuestas = class(TFPEditDetalle)
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
     ALPedidos: TLFActionList;
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
     LCuotasIVAyRec: TLFLabel;
     LLiquido: TLFLabel;
     DBES_Bases: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBELiquido: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PPieComisiones: TLFPanel;
     LBaseDtoLinea: TLFLabel;
     LImporte: TLFLabel;
     LImporteBase: TLFLabel;
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
     ATraspasoAPropConf: TAction;
     ASep1: TAction;
     ATraspasoAPedido: TAction;
     AInformePropuestas: TAction;
     AVisualizarPropFiltradas: TAction;
     AImprimirPropFiltradas: TAction;
     AVisualizaPropMail: TAction;
     AConfListadoPropuestas: TAction;
     AEnviarPropEmail: TAction;
     AEnviarPropMailPdf: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction5: TLFCategoryAction;
     ASep: TAction;
     AResumenPropuestas: TAction;
     AResumenPropuestasFiltradas: TAction;
     AImprimirResumenPropuestasFiltradas: TAction;
     ASep2: TAction;
     AConfListadoResumenPropuestas: TAction;
     ATraspasoMultiCanal: TAction;
     ABuscarArticulo: TAction;
     ToolButton1: TToolButton;
     TButtBuscarArticulo: TToolButton;
     AEnviarPropMailPdf2: TAction;
     LBLUnidades: TLFLabel;
     DBESumUnidades: TLFDbedit;
     LTelefono: TLFLabel;
     DBDTPFechaEntrega: TLFDBDateEdit;
     LBLFechaPrevista: TLFLabel;
     LFDBPlazoE: TLFDbedit;
     LBLPlazoEntrega: TLFLabel;
     DBCHKListado: TLFDBCheckBox;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     LFCategoryAction11: TLFCategoryAction;
     AAdjuntoPropuesta: TAction;
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
     DBEFMonedaFicha: TLFDBEditFind2000;
     LMonedaFicha: TLFLabel;
     DBTValorCambioFijo: TDBText;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     TSOtros: TTabSheet;
     LBLProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     DBETitProyecto: TLFDbedit;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     DBETitMoneda: TLFDbedit;
     DBCHKCambio: TLFDBCheckBox;
     LValorCambio: TLFLabel;
     DBEValorCambio: TLFDbedit;
     LPorcentajeFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     PEdOtros: TLFPanel;
     PNLCabOtros: TLFPanel;
     PNLTitOtros: TLFPanel;
     LBLFechaOtros: TLFLabel;
     LBLRefOtros: TLFLabel;
     DBEOtrosFechaCab: TLFDbedit;
     DBEOtrosClienteTituloCab: TLFDbedit;
     DBEOtrosRIGCab: TLFDbedit;
     DBEOtrosSuReferenciaCab: TLFDbedit;
     NavOtros: THYMNavigator;
     TButtImportarDetalle: TToolButton;
     AImportarDetalle: TAction;
     AAsignacionCodigoBarra: TAction;
     AAbrirCerrar: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     LEmail: TLFLabel;
     RelojEmail: TTimer;
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
     AFiltroTodos: TAction;
     AFiltroAbierto: TAction;
     AFiltroAnulado: TAction;
     AFiltroCerrado: TAction;
     CategoryFiltros: TLFCategoryAction;
     LDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     DBCBAceptaEntregaParcial: TLFDBCheckBox;
     ARecalcularPrecios: TAction;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     LUsuarioCreacion: TLFLabel;
     ABorradoMasivoLineas: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     EIdioma: TLFEdit;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     LProyectoFicha: TLFLabel;
     DBEFProyectoFicha: TLFDBEditFind2000;
     DBEProyectoFicha: TLFDbedit;
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
     procedure ATraspasoAPropConfExecute(Sender: TObject);
     procedure ATraspasoAPedidoExecute(Sender: TObject);
     procedure AInformePropuestasExecute(Sender: TObject);
     procedure AVisualizarPropFiltradasExecute(Sender: TObject);
     procedure AImprimirPropFiltradasExecute(Sender: TObject);
     procedure AVisualizaPropMailExecute(Sender: TObject);
     procedure AConfListadoPropuestasExecute(Sender: TObject);
     procedure AEnviarPropEmailExecute(Sender: TObject);
     procedure AEnviarPropMailPdfExecute(Sender: TObject);
     procedure AResumenPropuestasExecute(Sender: TObject);
     procedure AResumenPropuestasFiltradasExecute(Sender: TObject);
     procedure AImprimirResumenPropuestasFiltradasExecute(Sender: TObject);
     procedure AConfListadoResumenPropuestasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure ATraspasoMultiCanalExecute(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure AEnviarPropMailPdf2Execute(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBEFProveedorExiste(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure AAdjuntoPropuestaExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
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
     procedure ARecalcularPreciosExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure DBEFIdiomaChange(Sender: TObject);
  private
     { Private declarations }
     param_OFPINSE001: boolean;
     Param_COMTIVA001: boolean;
     Param_ARTBUSQ004: boolean;
     ColActual: TColumn;
     MTelefonos, MNotas: TLFMemo;
     BuscarArticulos: boolean;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     RefrescoBotonesDetalle: boolean;
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
     editando: boolean;
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraProcesoAutomatico(Serie: string; Contador: integer);
  end;

var
  FMPropuestas : TFMPropuestas;

implementation

uses UDMMain, UEntorno, UDMPropuestas, UFMLSTEntrefechas,
  UFMListConfig, UFMArticulosTarifa, UUtiles, UFMDocInfoStocks, UFCHerenciaProv,
  UFMNotasCampo, UFMain, UFVerTercerosPorArticulo,
  UFSendCorreo, UDMListados, UDMLstPropuestas_Prov, UDMLstPropuestasDeProv,
  UFMTraspasoMultiCanal, UFMAdjunto, UFMImprimirCodBarras, HYFIBQuery, UParam,
  UFMCondicionesCompra, UFMSeleccion, UFMInsercionArticuloDesdeTexto,
  {$IFNDEF TPV}UFMAsignacionCodigoBarra {$ENDIF}, UFMHerenciaManual,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMSeleccionArticulo, UFMProcesosMasivosLineas, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMPropuestas.FormCreate(Sender: TObject);
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
  RefrescoBotonesDetalle := True;
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

  AbreData(TDMPropuestas, DMPropuestas);

  {dji lrk kri}
  if REntorno.SerieRestringida <> '' then
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;
  NavMAin.DataSource := DMPropuestas.DSCabecera;
  DBGMain.DataSource := DMPropuestas.DSCabecera;
  NavDetalle.DataSource := DMPropuestas.DSDetalle;
  DBGFDetalle.DataSource := DMPropuestas.DSDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMPropuestas.DSCabecera;
     Entorno := DMPropuestas.EntornoDoc;
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
  editando := False;
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
        CamposChecked[i] := '256';
  end;

  AbreOCierra;
end;

procedure TFMPropuestas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  MTelefonos.Free;
  MNotas.Free;
  if SWCerrar = 1 then
     FMArticulosTarifa.Close;
  CierraData(DMPropuestas);
end;

procedure TFMPropuestas.DBGFDetalleBusqueda(Sender: TObject);
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
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMPropuestas.QMDetalleTIPO_IVA.AsInteger);
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
              CondicionBusqueda := CondicionBusqueda + ' AND TIPO=' + IntToStr(DMPropuestas.QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger);
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
           'PROVEEDOR =' + IntToStr(DMPropuestas.QMCabeceraPROVEEDOR.AsInteger) +
           ' AND EMPRESA = ''' + REntorno.EmpresaStr + '''';
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
           '(ARTICULO=''' + DMPropuestas.QMDetalleARTICULO.AsString + ''')';
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

procedure TFMPropuestas.EFDireccionBusqueda(Sender: TObject);
begin
  // EFDireccion.CondicionBusqueda:='TERCERO='+DMDocsPedidoAProv.QMCabeceraTERCERO.AsString;
end;

procedure TFMPropuestas.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPropuestas.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMPropuestas.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  Resultado := DMPropuestas.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;
  Continua := False;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPropuestas.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMPropuestas.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  // Edicion de IVA habilitada en documentos de venta
  Param_COMTIVA001 := (LeeParametro('COMTIVA001', EFSerie.Text) = 'S');
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');

  param_OFPINSE001 := (LeeParametro('OFPINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_OFPINSE001;
  DBERIG.ReadOnly := not param_OFPINSE001;

  HabilitaBotones;
end;

procedure TFMPropuestas.FormActivate(Sender: TObject);
begin
  inherited;
  // TSFicha.SetFocus;
end;

procedure TFMPropuestas.TButtArtTarifaClick(Sender: TObject);
begin
  SWCerrar := 1;
  AbreForm(TFMArticulosTarifa, FMArticulosTarifa, Sender);
end;

procedure TFMPropuestas.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (editando) then
     DMPropuestas.RefrescaTabla;
end;

procedure TFMPropuestas.AUnidades_ExtExecute(Sender: TObject);
begin
  if DBGFDetalle.SelectedField.FieldName = 'UNIDADES' then // DisplayName puede cambiar segun el idioma, por eso no lo utilizo
     DBGFDetalle.SelectedIndex := DBGFDetalle.SelectedIndex + 1;

  DMPropuestas.CambiaUnidadesExt(DMPropuestas.QMDetalleARTICULO, True);
end;

procedure TFMPropuestas.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     DMPropuestas.BorraLineaExt;
  if Button = nbDelete then
     DMPropuestas.ControlaRestriccion;
end;

procedure TFMPropuestas.AInfoStocksExecute(Sender: TObject);
var
  Almacen, Articulo : string;
begin
  DMPropuestas.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMPropuestas.DBGFDetalleColEnter(Sender: TObject);
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

procedure TFMPropuestas.ANotasDetalleExecute(Sender: TObject);
begin
  DMPropuestas.PreparaNotasDetalle;
  EditarCampoNotas(Self, DMPropuestas.DSDetalle, DMPropuestas.QMDetalleNOTAS, DMPropuestas.QMDetalleNOTAS2, (DMMain.EstadoKri(196) = 1));
  HabilitaBotonesDetalle;
end;

procedure TFMPropuestas.AInfoHistoricoExecute(Sender: TObject);
begin
  DMPropuestas.Historico;
end;

procedure TFMPropuestas.APreciosTarifaExecute(Sender: TObject);
begin
  DMPropuestas.CambiaPreciosTarifa;
end;

procedure TFMPropuestas.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  DMPropuestas.MascarasMoneda;
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

procedure TFMPropuestas.ANewProveedorExecute(Sender: TObject);
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

procedure TFMPropuestas.ANewArticuloExecute(Sender: TObject);
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
        DMPropuestas.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMPropuestas.AAProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFProveedor.Text <> '' then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DBEFProveedor.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMPropuestas.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMPropuestas.SBAProveedorDblClick(Sender: TObject);
begin
  AAProveedor.Execute;
end;

procedure TFMPropuestas.HabilitaEnlaces;
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

procedure TFMPropuestas.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMPropuestas.FiltraCabecera(ejercicio, serie, rig);
  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPropuestas.DBETituloProveedorEnter(Sender: TObject);
begin
  DBEFProveedor.SetFocus;
end;

procedure TFMPropuestas.HabilitaBotones;
var
  Habil : boolean;
begin
  Habil := DMPropuestas.HayDocumentos;

  ADuplicar.Enabled := Habil;
  ARegenerar.Enabled := Habil;
  AAnulaDocumento.Enabled := Habil;
  AHerencia.Enabled := Habil;

  EFAlmacen.Enabled := REntorno.AlmacenRestringido = '';

  HabilitaBotonesDetalle;
end;

procedure TFMPropuestas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
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
  // bit 8 = 0 --> Propuestas. restringidas
  if (((REntorno.RestriccionDocumento and 256) = 0) and
     ((DMPropuestas.xInfoActualizadaMODIFICA_DOC.AsInteger and 256) = 256)) then
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

procedure TFMPropuestas.HabilitaBotonesDetalle;
var
  Habil, HabilEd : boolean;
begin
  if (RefrescoBotonesDetalle) then
  begin
     // Todos los botones INACTIVOS (No hay Detalle)
     Habil := ((DMPropuestas.HayDetalle) or (DMPropuestas.QMDetalle.State = dsInsert));
     HabilEd := Habil;

     // Ciertos botones INACTIVOS (Modo inserción/edición)
     if Habil then
        HabilEd := not (DMPropuestas.QMDetalle.State in [dsInsert, dsEdit]);

     TButtNotas.Enabled := HabilEd;
     TButtInfoStocks.Enabled := Habil;
     TButtUnidades_Ext.Enabled := HabilEd;
     TButtPrecios.Enabled := Habil;
     TButtInfoHistorico.Enabled := Habil;
     TButtArtTarifa.Enabled := Habil;
     AOrdenaLineas.Enabled := Habil;
     TBArtProv.Enabled := Habil;
     TButtBuscarArticulo.Enabled := True;   // Siempre habilitado
     TButtImportarDetalle.Enabled := True;  // Siempre Activo

     // En el caso del Tipo de IVA tenemos que ver el parámetro COMTIVA001
     HabilitaColumna(DBGFDetalle, 'TIPO_IVA', Param_COMTIVA001);
  end;
end;

procedure TFMPropuestas.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // if (DMPropuestas.QMDetalle.State = dsinsert) then HabilitaBotonesDetalle;
  HabilitaBotonesDetalle;
end;

procedure TFMPropuestas.DBGFDetalleDblClick(Sender: TObject);
begin
  if DMPropuestas.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        AArticulo.Execute;
  end;
end;

procedure TFMPropuestas.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMPropuestas.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMPropuestas.AArticuloProvExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PDetalle.Enabled then
        TFVerTercerosPorArticulo.Create(Self).AsignaArticulo(DMPropuestas.QMDetalleARTICULO.AsString, 0);
end;

procedure TFMPropuestas.RelojNotasTimer(Sender: TObject);
begin
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMPropuestas.ADuplicarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPropuestas.Duplica;
  finally
     Screen.Cursor := crDefault;
     HabilitaBotones;
  end;

end;

procedure TFMPropuestas.ARegenerarExecute(Sender: TObject);
var
  IdModelo : integer;
  CrearCondicionModelo : boolean;
begin
  if ConfirmaMensaje(_('Este proceso actualizara las condiciones Proveedor-Articulo de todos los articulos del documento.' + #13#10 + '¿Desea continuar?')) then
  begin
     // Verificamos si algun articulo pertenece a un modelo
     CrearCondicionModelo := False;
     IdModelo := 0;
     with DMPropuestas.QMDetalle do
     begin
        First;
        while ((not EOF) and (not CrearCondicionModelo) and (IdModelo = 0)) do
        begin
           IdModelo := DMMain.DameIdModeloArticulo(DMPropuestas.QMDetalleID_A.AsInteger);
           if (IdModelo <= 0) then
              IdModelo := 0;
           CrearCondicionModelo := ((IdModelo > 0) and (ConfirmaMensaje(_('Desea tambien generar condiciones para todos los articulos que pertenecen a modelos de estos articulos?'))));
           Next;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        DMPropuestas.ActualizaCondicionesProv(CrearCondicionModelo);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMPropuestas.AAnulaDocumentoExecute(Sender: TObject);
begin
  DMPropuestas.AnulaDocumento;
end;

procedure TFMPropuestas.AHerenciaExecute(Sender: TObject);
var
  rig, ejercicio : integer;
  Tipo, num_factura, titulo, serie : string;
begin
  DMPropuestas.DatosHerencia(rig, ejercicio, Tipo, num_factura, titulo, serie);
  MuestraHerencia(rig, ejercicio, Tipo, num_factura, titulo, serie, Self);
end;

procedure TFMPropuestas.FormShow(Sender: TObject);
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
     end;
  end;
end;

procedure TFMPropuestas.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMPropuestas.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(DBGFDetalle, Rect);
  end;
end;

procedure TFMPropuestas.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMPropuestas.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMPropuestas.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
     DMPropuestas.ControlaRestriccion;
  if Button in [nbEdit] then
     editando := True
  else
     editando := False;
end;

procedure TFMPropuestas.AOrdenaLineasExecute(Sender: TObject);
begin
  DMPropuestas.OrdenarLineas;
end;

procedure TFMPropuestas.ATraspasoAPropConfExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPropuestas.TraspasarA('OCP');
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPropuestas.ATraspasoAPedidoExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMPropuestas.TraspasarA('PEP');
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPropuestas.AInformePropuestasExecute(Sender: TObject);
begin
  AbreData(TDMLstPropuestas_Prov, DMLstPropuestas_Prov);
  AInformePropuestas.Enabled := False;
  try
     DMLstPropuestas_Prov.MostrarListado(0, EFSerie.Text);
  finally
     AInformePropuestas.Enabled := True;
     CierraData(DMLstPropuestas_Prov);
  end;

  DMPropuestas.InfoActualiza;
end;

procedure TFMPropuestas.AVisualizarPropFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(2);
end;

procedure TFMPropuestas.AImprimirPropFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(3);
end;

procedure TFMPropuestas.AVisualizaPropMailExecute(Sender: TObject);
var
  Memo : TStrings;
begin
  AbreData(TDMLstPropuestas_prov, DMLstPropuestas_prov);
  Memo := TStringList.Create;
  DMLstPropuestas_prov.MostrarListadoMail(DMPropuestas.QMCabeceraID_E.AsInteger, EFSerie.Text,
     0, DMPropuestas.QMCabeceraEJERCICIO.AsInteger, Memo);
  Memo.Free;
  CierraData(DMLstPropuestas_prov);
end;

procedure TFMPropuestas.AConfListadoPropuestasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPropuestas_Prov, DMLstPropuestas_Prov);
  TFMListConfig.Create(Self).Muestra(518, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstPropuestas_Prov.frPropuestas, DMLstPropuestas_Prov.HYReport);
  CierraData(DMLstPropuestas_Prov);
end;

procedure TFMPropuestas.AEnviarPropEmailExecute(Sender: TObject);
var
  Memo, CuerpoMail : TStrings;
  Asunto : string;
  DMLstPropuestas_provCargado, DMListadosCargado : boolean;
begin
  // esto es porque el assigned no va

  DMLstPropuestas_provCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPropuestas_prov, DMLstPropuestas_prov);
           DMLstPropuestas_provCargado := True;

           Memo := TStringList.Create;
           try
              DMLstPropuestas_prov.MostrarListadoMail(DMPropuestas.QMCabeceraID_E.AsInteger, EFSerie.Text,
                 1, DMPropuestas.QMCabeceraEJERCICIO.AsInteger, Memo);

              AbreData(TDMListados, DMListados);
              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMPropuestas.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMPropuestas.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMPropuestas.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMPropuestas.QMCabeceraRIG.AsInteger;
                 Fecha := DMPropuestas.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMPropuestas.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := DMLstPropuestas_prov.nombreFich;
                 Matricula := '';

                 if (DMPropuestas.QMCabeceraPROVEEDOR.AsInteger > 0) then
                 begin
                    NombreComercial := DMPropuestas.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMPropuestas.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMPropuestas.QMCabeceraTITULO.AsString;
                    RazonSocial := DMPropuestas.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPropuestas.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 DMListados.SendMailTercero(DMPropuestas.QMCabeceraTercero.AsInteger, Memo, Asunto);
              finally
                 CuerpoMail.Free;
              end;
           finally
              Memo.Free;
           end;

           CierraData(DMLstPropuestas_prov);
           DMLstPropuestas_provCargado := False;
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
           if DMLstPropuestas_provCargado then
              CierraData(DMLstPropuestas_prov);
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

procedure TFMPropuestas.AEnviarPropMailPdfExecute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  DMLstPropuestas_provCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // esto es porque el assigned no va
  DMLstPropuestas_provCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPropuestas_prov, DMLstPropuestas_prov);
           DMLstPropuestas_provCargado := True;

           Memo := TStringList.Create;
           try
              DMLstPropuestas_prov.MostrarListadoMail(DMPropuestas.QMCabeceraID_E.AsInteger, EFSerie.Text,
                 2, DMPropuestas.QMCabeceraEJERCICIO.AsInteger, Memo);

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail(DMPropuestas.QMCabeceraTIPO.AsString);
              with VariableEmail do
              begin
                 Ejercicio := DMPropuestas.QMCabeceraEJERCICIO.AsInteger;
                 Serie := DMPropuestas.QMCabeceraSERIE.AsString;
                 NumeroDocumento := DMPropuestas.QMCabeceraRIG.AsInteger;
                 Fecha := DMPropuestas.QMCabeceraFECHA.AsDateTime;
                 SuReferencia := DMPropuestas.QMCabeceraSU_REFERENCIA.AsString;
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := DMLstPropuestas_prov.nombreFich;
                 Matricula := '';
                 if (DMPropuestas.QMCabeceraPROVEEDOR.AsInteger > 0) then
                 begin
                    NombreComercial := DMPropuestas.QMCabeceraNOMBRE_COMERCIAL.AsString;
                    RazonSocial := DMPropuestas.QMCabeceraTITULO.AsString;
                 end
                 else
                 begin
                    // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                    NombreComercial := DMPropuestas.QMCabeceraTITULO.AsString;
                    RazonSocial := DMPropuestas.QMCabeceraTITULO.AsString;
                 end;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPropuestas.QMCabeceraENTRADA.AsInteger));
              end;
              DamePartesEmail(Asunto, CuerpoMail);
              try
                 DMListados.SendMailTerceroPDF(DMPropuestas.QMCabeceraTercero.AsInteger, CuerpoMail,
                    DMLstPropuestas_prov.rutaFich, DMLstPropuestas_prov.nombreFich, Asunto, DMPropuestas.QMCabeceraTIPO.AsString, DMPropuestas.QMCabeceraID_E.AsInteger);
              finally
                 CuerpoMail.Free;
              end;
           finally
              Memo.Free;
           end;
           CierraData(DMLstPropuestas_prov);
           DMLstPropuestas_provCargado := False;
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
           if DMLstPropuestas_provCargado then
              CierraData(DMLstPropuestas_prov);
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
  DMPropuestas.InfoActualiza;
end;

procedure TFMPropuestas.MuestraFiltrado(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMPropuestas.QMCabecera.SelectSQL);

     AbreData(TDMLstPropuestas_prov, DMLstPropuestas_prov);
     try
        with DMLstPropuestas_prov do
        begin
           TempSql.AddStrings(QMCabecera.SelectSQL);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(SqlFiltro);
           // Utilizo la vista para listado
           QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_OFP', 'VER_CABECERAS_OFP_LST', [rfReplaceAll]);
           QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
           QMCabecera.Open;
           QMCabecera.First;
           MostrarListadoFiltrado(Tipo, FiltroListadoFiltrado, EFSerie.Text);
           QMCabecera.Close;
           QMCabecera.SelectSQL.Assign(TempSQL);
        end;
     finally
        CierraData(DMLstPropuestas_prov);
     end;
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
  RefrescaAvisos;
end;

procedure TFMPropuestas.AResumenPropuestasExecute(Sender: TObject);
begin
  AbreData(TDMLstPropuestasDeProv, DMLstPropuestasDeProv);
  TFMLstEntreFechas.Create(Self).muestra('OFP', EFSerie.Text);
  CierraData(DMLstPropuestasDeProv);
end;

procedure TFMPropuestas.AResumenPropuestasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMPropuestas.AImprimirResumenPropuestasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMPropuestas.AConfListadoResumenPropuestasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPropuestasDeProv, DMLstPropuestasDeProv);
  TFMListConfig.Create(Self).Muestra(520, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstPropuestasDeProv.frPropuesta);
  CierraData(DMLstPropuestasDeProv);
end;

procedure TFMPropuestas.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMPropuestas.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMPropuestas.ATraspasoMultiCanalExecute(Sender: TObject);
var
  Accion : integer;
begin
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(Self);
  Accion := FMTraspasoMultiCanal.Carga(DMPropuestas.QMCabeceraID_E.AsInteger, DMPropuestas.QMCabeceraRIG.AsInteger,
     DMPropuestas.QMCabeceraEJERCICIO.AsInteger, DMPropuestas.QMCabeceraCANAL.AsInteger, 0,
     DMPropuestas.QMCabeceraTIPO.AsString, DMPropuestas.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);
  DMPropuestas.RefrescaCabecera(Accion);
end;

procedure TFMPropuestas.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMPropuestas.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMPropuestas.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMPropuestas.NavDetalleChangeState(Sender: TObject);
begin
  {if DMPropuestas.Inhabilitar then  //Si estamos insertando o updateando, se deshabilitan
  begin
    TButtNotas.Enabled          := False;
    TButtInfoStocks.Enabled     := True;
    TButtUnidades_Ext.Enabled   := False;
    TButtPrecios.Enabled        := True;
    TButtInfoHistorico.Enabled  := True;
    TBArtProv.Enabled           := True;
    TButtBuscarArticulo.Enabled := False;
    AOrdenaLineas.Enabled       := True;
  end;}

  HabilitaBotonesDetalle;

  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

procedure TFMPropuestas.ABuscarArticuloExecute(Sender: TObject);
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

  DMPropuestas.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMPropuestas.EFProyectoBusqueda(Sender: TObject);
begin
  EFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMPropuestas.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  // if button in [nbPost, nbDelete, nbCancel] then HabilitaBotonesDetalle;
  HabilitaBotonesDetalle;

  if Button in [nbRefresh] then
     DMPropuestas.RellenaDatosOldLinea;
end;

procedure TFMPropuestas.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(DBGDetalleArticulo, False, True) then
        begin
           DMPropuestas.QMDetalle.Edit;
           DMPropuestas.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMPropuestas.DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
begin
  {
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMPropuestas.BusquedaArticulo(valor);
  DMPropuestas.Continua;
  }
end;

// sfg_XGM-begin- especial abrir cliente de correo predeterminado (El DMlistados tienes que ser a medida)
procedure TFMPropuestas.AEnviarPropMailPdf2Execute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstPropuestas_prov, DMLstPropuestas_prov);
  try
     Memo := TStringList.Create;
     try
        DMLstPropuestas_prov.MostrarListadoMail(DMPropuestas.QMCabeceraID_E.AsInteger, EFSerie.Text,
           2, DMPropuestas.QMCabeceraEJERCICIO.AsInteger, Memo);

        InicializaVariableEmail(DMPropuestas.QMCabeceraTIPO.AsString);
        with VariableEmail do
        begin
           Ejercicio := DMPropuestas.QMCabeceraEJERCICIO.AsInteger;
           Serie := DMPropuestas.QMCabeceraSERIE.AsString;
           NumeroDocumento := DMPropuestas.QMCabeceraRIG.AsInteger;
           Fecha := DMPropuestas.QMCabeceraFECHA.AsDateTime;
           SuReferencia := DMPropuestas.QMCabeceraSU_REFERENCIA.AsString;
           SuPedido := '';
           Folio := '';
           TituloDocTributario := '';
           NombreFichero := DMLstPropuestas_prov.nombreFich;
           Matricula := '';
           if (DMPropuestas.QMCabeceraPROVEEDOR.AsInteger > 0) then
           begin
              NombreComercial := DMPropuestas.QMCabeceraNOMBRE_COMERCIAL.AsString;
              RazonSocial := DMPropuestas.QMCabeceraTITULO.AsString;
           end
           else
           begin
              // El campo TITULO se rellena con el nombre asignado al Tercero Vario
              NombreComercial := DMPropuestas.QMCabeceraTITULO.AsString;
              RazonSocial := DMPropuestas.QMCabeceraTITULO.AsString;
           end;
           OrdenTrabajo := 0;
           UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMPropuestas.QMCabeceraENTRADA.AsInteger));
        end;
        DamePartesEmail(Asunto, CuerpoMail);
        try
           DMListados.SendMailTerceroPDF2(DMPropuestas.QMCabeceraTercero.AsInteger, CuerpoMail,
              DMLstPropuestas_prov.rutaFich, DMLstPropuestas_prov.nombreFich, Asunto, DMPropuestas.QMCabeceraTIPO.AsString, DMPropuestas.QMCabeceraID_E.AsInteger);
        finally
           CuerpoMail.Free;
        end;
     finally
        Memo.Free;
     end;

     // Marco el documento como listado
     DMLstPropuestas_prov.UpdateaDocumentos;
  finally
     CierraData(DMLstPropuestas_prov);
  end;

  DMPropuestas.InfoActualiza;
end;
// sfg_XGM-end- especial abrir cliente de correo predeterminado

procedure TFMPropuestas.DBEFProveedorChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMPropuestas.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMPropuestas.DBEFProveedorExiste(Sender: TObject);
begin
  if (not DMMain.ProveedorValido(StrToIntDef(DBEFProveedor.Text, 0))) then
     DBEFProveedor.Text := '';
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMPropuestas.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMPropuestas.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMPropuestas.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMPropuestas.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMPropuestas.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMPropuestas.AAdjuntoPropuestaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('OFP', DMPropuestas.QMCabeceraID_E.AsInteger);
end;

procedure TFMPropuestas.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', DameIDProveedor(DMPropuestas.QMCabeceraPROVEEDOR.AsInteger));
end;

procedure TFMPropuestas.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMPropuestas.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMPropuestas.AListarEtiquetasExecute(Sender: TObject);
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos(DMPropuestas.QMCabeceraTIPO.AsString, DMPropuestas.QMCabeceraID_E.AsInteger);
end;

procedure TFMPropuestas.ADuplicarLineaExecute(Sender: TObject);
begin
  DMPropuestas.DuplicarLinea;
end;

procedure TFMPropuestas.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstPropuestas_Prov, DMLstPropuestas_Prov);
  try
     DMLstPropuestas_Prov.MostrarListado(1, EFSerie.Text);
  finally
     CierraData(DMLstPropuestas_Prov);
  end;
  DMPropuestas.InfoActualiza;
end;

procedure TFMPropuestas.LBNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMPropuestas.xProveedor.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMPropuestas.xProveedor.FieldByName('NOTAS').AsString);
        {
        if (Trim(DMPropuestas.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMPropuestas.xProveedor.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        }
        if (Trim(DMPropuestas.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMPropuestas.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMPropuestas.FiltraProcesoAutomatico(Serie: string; Contador: integer);
begin
  // Filtramos las propuestas
  DMPropuestas.FiltraProcesoAutomatico(Serie, Contador);
  EFSerie.Text := Serie;
  EFSerieChange(nil);

  // Para refrescar el navegador, si el usuario es restringido
  NavMainClickAfterAdjust(Self, nbRefresh);
  RefrescaAvisos;
end;

procedure TFMPropuestas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPropuestas.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';

  G2KTableLoc.Click;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMPropuestas.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMPropuestas.ACondicionesCompraExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMCondicionesCompra, FMCondicionesCompra);
  with FMCondicionesCompra do
  begin
     EFProveedor.Text := DBEFProveedor.Text;
     EFFiltroArticulo.Text := DMPropuestas.QMDetalleARTICULO.AsString;
     EFFiltroFamilia.Text := DMPropuestas.xArticulos.FieldByName('FAMILIA').AsString;
     EFFiltroArticuloPorPrecio.Text := DMPropuestas.QMDetalleARTICULO.AsString;
     EFFiltraFamiliaPorPrecio.Text := DMPropuestas.xArticulos.FieldByName('FAMILIA').AsString;
  end;
end;

procedure TFMPropuestas.EFBuscaNIFKRIChange(Sender: TObject);
begin
  if (StrToIntDef(EFBuscaNIFKRI.Text, 0) <> 0) then
     with DMPropuestas.QMCabecera do
     begin
        DisableControls;
        First;
        while ((DMPropuestas.QMCabeceraID_E.AsInteger <> StrToIntDef(EFBuscaNIFKRI.Text, 0)) and (not DMPropuestas.QMCabecera.EOF)) do
           Next;
        EnableControls;
     end;
end;

procedure TFMPropuestas.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'tipo=''OFP'' and serie=''' + EFSerie.Text + '''';
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

procedure TFMPropuestas.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMPropuestas.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMPropuestas.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;

  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMPropuestas;
     ShowModal;
     Free;
  end;
end;

procedure TFMPropuestas.AAsignacionCodigoBarraExecute(Sender: TObject);
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
  with DMPropuestas.QMDetalle do
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

           Posicionar(DMPropuestas.QMDetalle, 'ID_DETALLES_E', IdDetallesE);
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

procedure TFMPropuestas.AAbrirCerrarExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     if (AAbrirCerrar.Tag = 0) then
        DMPropuestas.CierraDocumento
     else
        DMPropuestas.AbreDocumento
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPropuestas.AbreOCierra;
begin
  if (DMPropuestas.EstadoDocumento = 0) then
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

  ColorSegunEstado(DBETituloEstado, DMPropuestas.QMCabeceraESTADO.AsInteger);
end;

procedure TFMPropuestas.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMPropuestas.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMPropuestas.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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

procedure TFMPropuestas.ACrearHerenciaManualExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMHerenciaManual, FMHerenciaManual, FMain);
  with FMHerenciaManual do
  begin
     Inicializa(DMPropuestas.QMDetalleTIPO.AsString, DMPropuestas.QMDetalleID_DETALLES_E.AsInteger);
     Hide;
     ShowModal;
  end;
end;

procedure TFMPropuestas.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if ((Button = nbDelete) and (DMPropuestas.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMPropuestas.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMPropuestas.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMPropuestas.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMPropuestas.FiltraDocumento(EFSerie.Text, 'ESTADO = 0');
end;

procedure TFMPropuestas.AFiltroAnuladoExecute(Sender: TObject);
begin
  inherited;
  DMPropuestas.FiltraDocumento(EFSerie.Text, 'ESTADO = 2');
end;

procedure TFMPropuestas.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMPropuestas.FiltraDocumento(EFSerie.Text, 'ESTADO = 5');
end;

procedure TFMPropuestas.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + DMPropuestas.QMCabeceraTERCERO.AsString;
end;

procedure TFMPropuestas.ARecalcularPreciosExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Desea cambiar el precio y las condiciones de todas las lineas?')) then
  begin
     try
        RefrescoBotonesDetalle := False;
        DMPropuestas.RecalcularPrecios;
     finally
        RefrescoBotonesDetalle := True;
        HabilitaBotonesDetalle;
     end;
  end;
end;

procedure TFMPropuestas.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('OFP', DMPropuestas.QMCabeceraID_E.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoPropuesta.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMPropuestas.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGDetalleArticulo := '';
end;

procedure TFMPropuestas.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
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

procedure TFMPropuestas.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMPropuestas.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMPropuestas.QMDetalleTIPO.AsString, DMPropuestas.QMDetalleID_E.AsInteger);

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
                 Params.ByName['ID_E'].AsInteger := DMPropuestas.QMDetalleID_E.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMPropuestas.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMPropuestas.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  EIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMPropuestas.RefrescaAvisos;
begin
  if (((DMPropuestas.xProveedor.Active) and (Trim(DMPropuestas.xProveedor.FieldByName('NOTAS').AsString) > '')) or
     ((DMPropuestas.xAvisos.Active) and (Trim(DMPropuestas.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
     RelojNotas.Enabled := True
  else
     RelojNotas.Enabled := False;

  LBNotas.Visible := RelojNotas.Enabled;

  if (DMMain.ExisteAdjunto(DMPropuestas.QMCabeceraTIPO.AsString, DMPropuestas.QMCabeceraID_E.AsInteger)) then
     RelojAdjuntos.Enabled := True
  else
     RelojAdjuntos.Enabled := False;

  LAdjuntos.Visible := RelojAdjuntos.Enabled;

  if (DMMain.EnviarFacturasProvAcrePorEmail(DMPropuestas.QMCabeceraTERCERO.AsInteger)) then
     RelojEmail.Enabled := True
  else
     RelojEmail.Enabled := False;

  LEmail.Visible := RelojEmail.Enabled;
end;

end.
