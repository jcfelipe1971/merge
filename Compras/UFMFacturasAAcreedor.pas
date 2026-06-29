unit UFMFacturasAAcreedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada,
  DbComboBoxValue, URecursos, UFormGest, ActnList, DB, rxPlacemnt, NsDBGrid,
  rxToolEdit, RXDBCtrl, ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, HYFIBQuery,
  ULFEdit, ULFDBDateEdit, ULFMemo, UFPEditDetalle, UG2kTBLoc;

type
  TFMFacturasAAcr = class(TFPEditDetalle)
     TSNotas: TTabSheet;
     PNLCabNotas: TLFPanel;
     LBLFactura: TLFLabel;
     DBERIG: TLFDbedit;
     LBLEstado: TLFLabel;
     LBLFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LBLAcreedor: TLFLabel;
     PNLEdNotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     PNLTitNotas: TLFPanel;
     DBENotasFechaCab: TLFDbedit;
     LBLFechaNotas: TLFLabel;
     DBENotasProveedorTituloCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     DBETituloAcreedor: TLFDbedit;
     DBEFAcreedor: TLFDBEditFind2000;
     LBLNFactura: TLFLabel;
     DBENumFactura: TLFDbedit;
     LBLFormaPago: TLFLabel;
     DBEFFormaPago: TLFDBEditFind2000;
     ETituloFormaPago: TLFEdit;
     DBCBDevolucion: TLFDBCheckBox;
     LBLNAsiento: TLFLabel;
     DBERic: TLFDbedit;
     LBLDtoCial: TLFLabel;
     DBEDtoCial: TLFDbedit;
     LblRegistro: TLFLabel;
     DBERegistro: TLFDbedit;
     LBLFecha_Con: TLFLabel;
     DBDTPFecha_Con: TLFDBDateEdit;
     LBLDtoPP: TLFLabel;
     DBEDtoPP: TLFDbedit;
     PCPie: TLFPageControl;
     TSPieGen: TTabSheet;
     PNLPieGenerico: TLFPanel;
     LBLBImponible: TLFLabel;
     LBLIVARec: TLFLabel;
     LBLLiquido: TLFLabel;
     LBLIRPF: TLFLabel;
     LBLTotal: TLFLabel;
     DBES_Bases: TLFDbedit;
     DBECuotaIVA: TLFDbedit;
     DBECuotaRec: TLFDbedit;
     DBELiquido: TLFDbedit;
     DBEIrpf: TLFDbedit;
     DBETotal: TLFDbedit;
     TSPieCarDtos: TTabSheet;
     PNLPieComisiones: TLFPanel;
     LBLBaseDtoLinea: TLFLabel;
     LBLImporte: TLFLabel;
     LBLImpBase: TLFLabel;
     LImporteFinanciacion: TLFLabel;
     DBEBaseDtoEnLinea: TLFDbedit;
     DBEImpDtoEnLinea: TLFDbedit;
     DBESumaBases: TLFDbedit;
     DBEImpFinanciacion: TLFDbedit;
     TButtSep7: TToolButton;
     TButtSep2: TToolButton;
     TButtImprimeListado: TToolButton;
     LBLSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtAbreCierra: TToolButton;
     ALFacturasAcr: TLFActionList;
     TButtNotas: TToolButton;
     ANotasDetalle: TAction;
     PNLTitSerie: TLFPanel;
     ETitSerie: TLFEdit;
     DBCBRec_Invisibles: TLFDBCheckBox;
     CBArrendamiento: TLFDBCheckBox;
     DBETituloEstado: TLFDbedit;
     SBVerRegistro: TSpeedButton;
     ARegistroIVA: TAction;
     SBVerAsiento: TSpeedButton;
     AAsientoFactura: TAction;
     N1: TMenuItem;
     CEMainVerAsientoGenerado: TMenuItem;
     CEMainVerRegistrodeIVA: TMenuItem;
     AImprimeAutomatico: TAction;
     ANIFFactura: TAction;
     DBCBForzarVen: TLFDBCheckBox;
     ANewAcreedor: TAction;
     ANewArticulo: TAction;
     AAAcreedor: TAction;
     SBAAcreedor: TSpeedButton;
     AImprime: TAction;
     MIVerDatosAcreedor: TMenuItem;
     CEMainMIDatosProveedor: TMenuItem;
     AArticulo: TAction;
     DBEFTipo_asiento: TLFDBEditFind2000;
     LBLTipo_asiento: TLFLabel;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     DBDTPHora_Con: TDBDateTimePicker;
     DBCBLeasing: TLFDBCheckBox;
     ACentroCoste: TAction;
     LBLNumFacturaNotas: TLFLabel;
     DBENotasNumFacturaCab: TLFDbedit;
     AInfFacAcreedores: TAction;
     AVisualizaFacturasFiltradas: TAction;
     AImprimeFacturasFiltradas: TAction;
     ASep: TAction;
     AResumenFacturas: TAction;
     AResumenFacturasFiltradas: TAction;
     AImpresionResumenFacturasFiltradas: TAction;
     ASep2: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfInformeFacturas: TAction;
     AConfListadosFacturasAcreedor: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AAbrirCerrar: TAction;
     ASep3: TAction;
     ADuplicar: TAction;
     ADevolucion: TAction;
     ACambiaFinanciacion: TAction;
     ALeasing: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ATipoIVA: TAction;
     ARecibos: TAction;
     LFCategoryAction4: TLFCategoryAction;
     LFechaEntrega: TLFLabel;
     DBDTPEntrega: TLFDBDateEdit;
     AEnviarFacturaAcrMailPDF: TAction;
     AOrdenaLineas: TAction;
     AAnalitica: TAction;
     LBReferencia: TLFLabel;
     DBEReferencia: TLFDbedit;
     ABuscarArticulo: TAction;
     ToolButton1: TToolButton;
     TButtRecibosKri: TToolButton;
     TButtBuscarArticulo: TToolButton;
     DBCHKObligaAuto: TLFDBCheckBox;
     LFCategoryAction5: TLFCategoryAction;
     AAdjuntosFactura: TAction;
     AAdjuntosAcreedor: TAction;
     AAdjuntosTercero: TAction;
     AEnviarFacturaAcrMailPDF2: TAction;
     DBDTPHora_Fac: TDBDateTimePicker;
     LNCF: TLFLabel;
     LTipo: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     LTelefono: TLFLabel;
     DBCBVTipoNCF: TDBLookupComboBox;
     DBEFPrefijoNCF: TLFDbedit;
     DBEContadorNCF: TLFDbedit;
     DBCHKListado: TLFDBCheckBox;
     ToolButton2: TToolButton;
     TButtCentroCoste: TToolButton;
     ToolButton3: TToolButton;
     TButtDetallesDUA: TToolButton;
     ADetallesDUA: TAction;
     ADuplicarLinea: TAction;
     TButtDuplicarLinea: TToolButton;
     LFechaSII: TLFLabel;
     DBDTPFechaSII: TLFDBDateEdit;
     AFacturaMultiCanal: TAction;
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
     NAVOtros: THYMNavigator;
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
     LPorcentajeFinanciacion: TLFLabel;
     DBEFinanciacion: TLFDbedit;
     LBLProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     ETitMoneda: TLFEdit;
     DBCHKCambio: TLFDBCheckBox;
     LValorCambio: TLFLabel;
     DBEValorCambio: TLFDbedit;
     LTipoIRPF: TLFLabel;
     DBEFTipoIRPF: TLFDBEditFind2000;
     DBETitTIPOIRPF: TLFDbedit;
     DBCBRECC: TLFDBCheckBox;
     CBForzarModoIva: TLFDBCheckBox;
     EFModoIva: TLFDBEditFind2000;
     EModoIva: TLFEdit;
     LBLIRPFFicha: TLFLabel;
     DBEPirpf: TLFDbedit;
     DBEAplicarIRPF: TLFDbedit;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     LBLCartera: TLFLabel;
     DBERegistroCartera: TLFDbedit;
     SBVerCartera: TSpeedButton;
     ARegistroCartera: TAction;
     LMonedaFicha: TLFLabel;
     DBEFMonedaFicha: TLFDBEditFind2000;
     DBTValorCambioFijo: TDBText;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     LAdjuntos: TLFLabel;
     RelojAdjuntos: TTimer;
     LEmail: TLFLabel;
     RelojEmail: TTimer;
     DBTRectificacion: TDBText;
     CategoryFiltros: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFiltroAbierto: TAction;
     AFiltroCerrado: TAction;
     AFiltroLeasing: TAction;
     AFiltroArrendamiento: TAction;
     LDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     DBETituloDireccion: TLFDbedit;
     DBCBReciboPagado: TLFDBCheckBox;
     LUsuarioCreacion: TLFLabel;
     DBEFUsuarioCreacion: TLFDBEditFind2000;
     EUsuarioCreacion: TLFEdit;
     ABorradoMasivoLineas: TAction;
     LIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     EIdioma: TLFEdit;
     ADividirLineaIVA: TAction;
     TBSep3: TToolButton;
     TBDividirLineaIVA: TToolButton;
     LObservaciones: TLFLabel;
     DBEObservaciones: TLFDbedit;
     ADividirLineaProyecto: TAction;
     TBDividirProyectoLinea: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSerieChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure TSTablaShow(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure ARegistroIVAExecute(Sender: TObject);
     procedure SBVerRegistroDblClick(Sender: TObject);
     procedure AAsientoFacturaExecute(Sender: TObject);
     procedure SBVerAsientoDblClick(Sender: TObject);
     procedure AImprimeAutomaticoExecute(Sender: TObject);
     procedure ANIFFacturaExecute(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ANewAcreedorExecute(Sender: TObject);
     procedure ANewArticuloExecute(Sender: TObject);
     procedure AAAcreedorExecute(Sender: TObject);
     procedure SBAAcreedorDblClick(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure DBETituloAcreedorEnter(Sender: TObject);
     procedure ACentroCosteExecute(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AArticuloExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure RelojNotasTimer(Sender: TObject);
     procedure AInfFacAcreedoresExecute(Sender: TObject);
     procedure AVisualizaFacturasFiltradasExecute(Sender: TObject);
     procedure AImprimeFacturasFiltradasExecute(Sender: TObject);
     procedure AResumenFacturasExecute(Sender: TObject);
     procedure AResumenFacturasFiltradasExecute(Sender: TObject);
     procedure AImpresionResumenFacturasFiltradasExecute(Sender: TObject);
     procedure AConfInformeFacturasExecute(Sender: TObject);
     procedure AConfListadosFacturasAcreedorExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure ADuplicarExecute(Sender: TObject);
     procedure ADevolucionExecute(Sender: TObject);
     procedure ACambiaFinanciacionExecute(Sender: TObject);
     procedure ALeasingExecute(Sender: TObject);
     procedure ATipoIVAExecute(Sender: TObject);
     procedure ARecibosExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AEnviarFacturaAcrMailPDFExecute(Sender: TObject);
     procedure DBDTPFechaExit(Sender: TObject);
     procedure AOrdenaLineasExecute(Sender: TObject);
     procedure DBCHKCambioChange(Sender: TObject);
     procedure AAnaliticaExecute(Sender: TObject);
     procedure DBDTPEntregaExit(Sender: TObject);
     procedure DBDTPFecha_ConExit(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure ABuscarArticuloExecute(Sender: TObject);
     procedure EFProyectoBusqueda(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AAdjuntosFacturaExecute(Sender: TObject);
     procedure AAdjuntosAcreedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure AEnviarFacturaAcrMailPDF2Execute(Sender: TObject);
     procedure CBForzarModoIvaChange(Sender: TObject);
     procedure EFModoIvaChange(Sender: TObject);
     procedure DBEFAcreedorChange(Sender: TObject);
     procedure DBEFAcreedorExiste(Sender: TObject);
     procedure DBCBVTipoNCFClick(Sender: TObject);
     procedure DBCBVTipoNCFEnter(Sender: TObject);
     procedure LTelefonoClick(Sender: TObject);
     procedure DBCHKListadoClick(Sender: TObject);
     procedure EFProyectoChange(Sender: TObject);
     procedure ADetallesDUAExecute(Sender: TObject);
     procedure ADuplicarLineaExecute(Sender: TObject);
     procedure LBNotasClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure AFacturaMultiCanalExecute(Sender: TObject);
     procedure EFBuscaNIFKRIChange(Sender: TObject);
     procedure ABuscaNIFKRIExecute(Sender: TObject);
     procedure ARegistroCarteraExecute(Sender: TObject);
     procedure SBVerCarteraDblClick(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure RelojAdjuntosTimer(Sender: TObject);
     procedure RelojEmailTimer(Sender: TObject);
     procedure DBEFFormaPagoChange(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroAbiertoExecute(Sender: TObject);
     procedure AFiltroCerradoExecute(Sender: TObject);
     procedure AFiltroLeasingExecute(Sender: TObject);
     procedure AFiltroArrendamientoExecute(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBEFUsuarioCreacionChange(Sender: TObject);
     procedure ABorradoMasivoLineasExecute(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEFIdiomaChange(Sender: TObject);
     procedure ADividirLineaIVAExecute(Sender: TObject);
     procedure ADividirLineaProyectoExecute(Sender: TObject);
  private
     { Private declarations }
     param_FCRINSE001: boolean;
     Editando: boolean;
     BuscarArticulos: boolean;
     MTelefonos, MNotas: TLFMemo;
     BotonesNavMain: string;
     BotonesNavDetalle: string;
     procedure HabilitaEnlaces;
     procedure MuestraFiltrado(tipo: byte);
     procedure MuestraInformesFiltrados(tipo: byte);
     procedure HabilitaBotones;
     procedure AbreOCierra;
     procedure HabilitaBotonesDetalle;
     procedure HabilitarNCF;
     procedure RefrescaAvisos;
  public
     { Public declarations }
     FiltroListadoFiltrado: integer;
     procedure HabilitaCambioIVA;
     procedure FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraFact(FiltroAccion: string);
  end;

var
  FMFacturasAAcr : TFMFacturasAAcr;

implementation

uses UDMMain, UEntorno, UDMFacturasAAcreedor, UUtiles, UFMCambiaFacProv, UFMain,
  UDMLstInfFacAcreedor, UFMListConfig, UFMNotasCampo, UFMTraspasoMultiCanal,
  UFMAcreedores, UDMLstFacturaAcr,
  UFMLstEntreFechas, UFSendCorreo, UFMSeleccion,
  UDMListados, UFPregNIFFACTURA, UFMImputacionCostes, UFMAdjunto, UFMDetalleDUA, UParam,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMProcesosMasivosLineas, UFMRepartirLineaProyecto, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMFacturasAAcr.FormCreate(Sender: TObject);
var
  i : integer;
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

  AbreData(TDMFacturasAAcr, DMFacturasAAcr);
  NavMAin.DataSource := DMFacturasAAcr.DSQMCabecera;
  DBGMain.DataSource := DMFacturasAAcr.DSQMCabecera;
  NavDetalle.DataSource := DMFacturasAAcr.DSQMDetalle;
  DBGFDetalle.DataSource := DMFActurasAAcr.DSQMDetalle;
  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMFActurasAAcr.DSQMCabecera;
     Entorno := DMFActurasAAcr.EntornoDoc;
     Filtros := [obEmpresa, obCanal];
  end;

  PCPie.ActivePage := TSPieGen;
  PCMain.ActivePage := TSFicha;

  CEMainPMEdit.Teclas := DMMain.Teclas;
  CENotasPMEdit.Teclas := DMMain.Teclas;

  FiltroListadoFiltrado := 0;

  // Utilizar cambio inversio en cambio fijo de documentos.
  // Se establece el cambio (factor) de la moneda de la empresa al del documento. (S/N)
  if (LeeParametro('MONCAMB001') = 'S') then
  begin
     DBTValorCambioFijo.DataField := 'VALOR_CAMB_FIJO_INV';
     DBEValorCambio.DataField := 'VALOR_CAMB_FIJO_INV';
  end;

  HabilitaEnlaces;
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  REntorno.Asiento_FCR := 'ACR';
  RefrescaAvisos;
  Editando := False;
  if (DMMain.EstadoKri(152) <> 1) then
     AEnviarFacturaAcrMailPDF.Visible := False;
  AAnalitica.Visible := DMMain.PuedeHacerImputaciones;

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

  if (DMMain.EstadoKri(258) = 1) then
     ANIFFactura.Enabled := False;

  if (DMMain.EstadoKri(264) <> 1) then {Habilita el envío de email con pdf a traves del cliente windows}
     for i := ALMain.ActionCount - 1 downto 0 do
        if (ALMain.Actions[i] = AEnviarFacturaAcrMailPDF2) then
           ALMain.Actions[i].Free;

  if (DMMain.EstadoKri(272) <> 1) then {MODO IVA Modificable en Factura}
  begin
     CBForzarModoIva.Visible := False;
     EFModoIva.Visible := False;
     EModoIva.Visible := False;
  end;

  {Republica Dominicana}
  if (REntorno.Pais <> 'DOM') then
  begin
     LNCF.Visible := False;
     DBEFPrefijoNCF.Visible := False;
     DBEContadorNCF.Visible := False;
     LTipo.Visible := False;
     DBEFTipo.Visible := False;
     DBCBVTipoNCF.Visible := False;
  end;

  EFBuscaNIFKRI.Width := 1;
  EFBuscaNIFKRI.Visible := False;

  DBDTPFechaSII.Visible := (LeeParametro('SIIFEC0001', '') = 'S');
  LFechaSII.Visible := (LeeParametro('SIIFEC0001', '') = 'S');

  // Color campo ID
  ColorCampoID(DBERIG);
  ColorCampoID(EFSERIE);

  // Muestra tabla por defecto
  if (LeeParametro('DOCCONF001') = 'S') then
     PCMain.ActivePage := TSTabla;

  with DBGMain do
  begin
     i := CamposAMarcar.IndexOf('MODIFICA_DOC');
     if (i >= 0) and (CamposChecked.Count >= i - 1) then
        CamposChecked[i] := '16';
  end;

  AbreOCierra;
end;

procedure TFMFacturasAAcr.FormDestroy(Sender: TObject);
begin
  inherited;
  MTelefonos.Free;
  MNotas.Free;
  CierraData(DMFacturasAAcr);
end;

procedure TFMFacturasAAcr.DBGFDetalleBusqueda(Sender: TObject);
begin
  with DBGFDetalle do
  begin
     if Trim(TablaABuscar) = 'VER_ARTICULOS_EF_ACREEDOR' then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA=''' + REntorno.FamSistema + '''';
        { Facturas a acreedor no debe crear articulos. Solo utiliza los de la familia SYS, creados al crear tipos de IVA.
        if (FMain.AArticulos.Enabled = True) then
           Accion := ANewArticulo;
        }
     end
     else if Trim(TablaABuscar) = 'EMP_PROYECTOS' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
           '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
     end
     else if Trim(TablaABuscar) = 'CON_CUENTAS' then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr +
           ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND TIPO = 5';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
     end
     else if Trim(TablaABuscar) = 'ART_ALMACENES' then
     begin
        CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ACTIVO = 1';
     end
     else
        CondicionBusqueda := 'TIPO=5';
  end;
end;

procedure TFMFacturasAAcr.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMFacturasAAcr.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMFacturasAAcr.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  Resultado := DMFacturasAAcr.BusquedaCompleja;

  if (Resultado in [mrOk]) then
     FiltroListadoFiltrado := 1
  else if (Resultado in [mrAll]) then
     FiltroListadoFiltrado := 0;

  Continua := False;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if EFSerie.Text <> '' then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMFacturasAAcr.CambiaSerie(EFSerie.Text);
  end;

  ETitSerie.Text := DameTituloSerie(EFSerie.Text);

  param_FCRINSE001 := (LeeParametro('FCRINSE001', EFSerie.Text) = 'S');
  DBERIG.Enabled := param_FCRINSE001;
  DBERIG.ReadOnly := not param_FCRINSE001;

  HabilitaBotones;
end;

procedure TFMFacturasAAcr.HabilitaCambioIVA;
begin
  ATipoIVA.Enabled := DMFacturasAAcr.Habilitar_but_cambia_iva;
end;

procedure TFMFacturasAAcr.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  d_rig : integer;
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
  // bit 5 = 0 --> Facturas a Acr. restringidas
  if (((REntorno.RestriccionDocumento and 16) = 0) and
     ((DMFacturasAAcr.xInfoActualizadaMODIFICA_DOC.AsInteger and 16) = 16)) then
  begin
     NavMain.VisibleButtons := NavMain.VisibleButtons - [nbDelete, nbEdit, nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbPost];
  end;

  if Button in [nbPost, nbDelete, nbCancel] then
  begin
     HabilitaBotones;
     HabilitaCambioIVA;
  end;

  RefrescaAvisos;

  // Facturas de Rectificacion
  if (Button = nbInsert) then
     if es_serie_rectificacion(EFSerie.Text) then
        if (DMFacturasAAcr.CreaFacturaRectificacion(EFSerie.Text, d_rig)) then
           FiltraFactura(REntorno.Ejercicio, EFSerie.Text, d_rig);
end;

procedure TFMFacturasAAcr.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if not (Button in [nbPost, nbDelete, nbCancel]) then
     HabilitaCambioIVA;

  HabilitaBotonesDetalle;

  if Button in [nbRefresh] then
     DMFacturasAAcr.RellenaDatosOldLinea;
end;

procedure TFMFacturasAAcr.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;

  with DBGFDetalle do
  begin
     if (SelectedField.FieldName = 'CUENTA_GASTOS') then
     begin
        FMain.AddComponentePunto(DBGFDetalle);
        SalirSiNoExiste := True;
     end
     else
     begin
        FMain.DelComponentePunto(DBGFDetalle);
        SalirSiNoExiste := False;
     end;

     BuscarNums := not (ColumnaActual = 'PROYECTO');
  end;
end;

procedure TFMFacturasAAcr.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  with DBGFDetalle.SelectedField do
  begin
     if FieldName = 'CUENTA_GASTOS' then
        AsString := ExpandirCadena(Trim(AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMFacturasAAcr.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
  if not (Editando) then
     DMFacturasAAcr.RefrescaTabla;
end;

procedure TFMFacturasAAcr.ANotasDetalleExecute(Sender: TObject);
begin
  DMFacturasAAcr.PreparaNotasDetalle;
  EditarCampoNotas(Self, DMFacturasAAcr.DSQMDetalle, DMFacturasAAcr.QMDetalleNOTAS);
  HabilitaBotonesDetalle;
end;

procedure TFMFacturasAAcr.ARegistroIVAExecute(Sender: TObject);
begin
  if DMFacturasAAcr.QMCabeceraESTADO.AsInteger = 5 then
     FMain.MuestraIVA('EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + DMFacturasAAcr.DameEjercicio + ' AND CANAL=' + REntorno.CanalStr + ' AND REGISTRO=' + DMFacturasAAcr.ObtieneRegistroIVA, 'S');
end;

procedure TFMFacturasAAcr.SBVerRegistroDblClick(Sender: TObject);
begin
  ARegistroIVA.Execute;
end;

procedure TFMFacturasAAcr.AAsientoFacturaExecute(Sender: TObject);
begin
  if (DMFacturasAAcr.QMCabeceraESTADO.AsInteger = 5) then
     FMain.MuestraMovConta(' RIC= ' + DMFacturasAAcr.ObtieneAsiento + ' AND EJERCICIO=' + DMFacturasAAcr.DameEjercicio);
end;

procedure TFMFacturasAAcr.SBVerAsientoDblClick(Sender: TObject);
begin
  AAsientoFactura.Execute;
end;

procedure TFMFacturasAAcr.FiltraFactura(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMFacturasAAcr.FiltraCabecera(Ejercicio, Serie, Rig);
  EFSerie.Text := Serie;
  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.AImprimeAutomaticoExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
  DMLstInfFacAcreedor.MostrarInforme(EFSerie.Text,
     DMFacturasAAcr.QMCabeceraRIG.AsInteger,
     DMFacturasAAcr.QMCabeceraID_E.AsInteger, 1, DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstInfFacAcreedor);
end;

procedure TFMFacturasAAcr.ANIFFacturaExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFACTURA;
begin
  DMFacturasAAcr.AbreQMNif;
  if DMFacturasAAcr.DameDatosAcreedor then
  begin
     FPregDatos := TFPregNIFFACTURA.Create(Self);
     FPregDatos.Inicializa(DMFacturasAAcr.DSQMNIF, _('Datos del Acreedor'), DMFacturasAAcr.EstadoDocumento);
     DMFacturasAAcr.GrabaDatosAcreedor(FPregDatos.ShowModal);
     FreeAndNil(FPregDatos);
  end;
  DMFacturasAAcr.CierraQMNif;
  DMFacturasAAcr.RefrescaCabecera(1);
end;

procedure TFMFacturasAAcr.DBEFMonedaChange(Sender: TObject);

  procedure HazVisibleCambioFijo(Visible: boolean);
  begin
     DBCHKCambio.Visible := Visible;
     LValorCambio.Visible := Visible;
     DBEValorCambio.Visible := Visible;
     DBTValorCambioFijo.Visible := Visible;
  end;

begin
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
  DMFacturasAAcr.MascarasMoneda;
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

procedure TFMFacturasAAcr.ANewAcreedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EjecutaAccion(FMain.AAcreedores);
     FMAcreedores.Tercero_a_Acreedor(DMMain.MinTercero);
  end;
end;

procedure TFMFacturasAAcr.ANewArticuloExecute(Sender: TObject);
begin
  { Facturas a acreedor no debe crear articulos. Solo utiliza los de la familia SYS, creados al crear tipos de IVA.
  if EstructuraCreada then
  begin
     FMain.SourceCall := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AArticulos);
     if FMain.EnlaceDatos <> Null then
     begin
        DMFacturasAAcr.QMDetalleARTICULO.AsString := FMain.EnlaceDatos;
     end;
     DBGFDetalle.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
  }
end;

procedure TFMFacturasAAcr.AAAcreedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFAcreedor.Text <> '' then
           FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR = ' + DBEFAcreedor.Text);
     end
     else
        FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR = ' + IntToStr(DMFacturasAAcr.QMCabeceraACREEDOR.AsInteger));
end;

procedure TFMFacturasAAcr.SBAAcreedorDblClick(Sender: TObject);
begin
  AAAcreedor.Execute;
end;

procedure TFMFacturasAAcr.HabilitaEnlaces;
begin
  SolapaControles(SBVerRegistro, DBERegistro);
  SolapaControles(SBVerAsiento, DBERIC);
  SolapaControles(SBVerCartera, DBERegistroCartera);
  DBERic.Color := REntorno.ColorEnlaceActivo;
  DBERegistro.Color := REntorno.ColorEnlaceActivo;
  DBERegistroCartera.Color := REntorno.ColorEnlaceActivo;

  if (FMain.AAcreedores.Enabled = False) then
  begin
     DBEFAcreedor.Accion := nil;
     SBAAcreedor.Width := 0;
     MIVerDatosAcreedor.Visible := False;
  end
  else
  begin
     SolapaControles(SBAAcreedor, DBETituloAcreedor);
     DBETituloAcreedor.Color := REntorno.ColorEnlaceActivo;
  end;

  ETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, ETitProyecto);
end;

procedure TFMFacturasAAcr.ACentroCosteExecute(Sender: TObject);
begin
  DMFacturasAAcr.PedirCentroCoste;
end;

procedure TFMFacturasAAcr.DBGFDetalleRowChange(Sender: TObject);
begin
  // dji lrk kri Acá tengo que ver si la cuenta tiene Centro de Costos.
  // ACentroCosteExecute(Sender);
end;

procedure TFMFacturasAAcr.MuestraFiltrado(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMFacturasAAcr.QMCabecera.SelectSQL);
     AbreData(TDMLstFacturaAcr, DMLstFacturaAcr);
     with DMLstFacturaAcr do
     begin
        TempSql.AddStrings(QMCabecera.SelectSQL);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(SqlFiltro);
        QMCabecera.Params.ByName['SERIE'].AsString := EFSerie.Text;
        MostrarListadoFiltrado(tipo, FiltroListadoFiltrado, EFSerie.Text);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMLstFacturaAcr);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMFacturasAAcr.MuestraInformesFiltrados(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMFacturasAAcr.QMCabecera.SelectSQL);
     AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
     with DMLstInfFacAcreedor do
     begin
        TempSql.AddStrings(QMCabecera.SelectSQL);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(SqlFiltro);
        QMCabecera.Params.ByName['serie'].AsString := EFSerie.Text;
        MostrarInformesFiltrados(tipo, FiltroListadoFiltrado, EFSerie.Text);
        QMCabecera.Close;
        QMCabecera.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMLstInfFacAcreedor);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMFacturasAAcr.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
  DMLstInfFacAcreedor.MostrarInforme(EFSerie.Text,
     DMFacturasAAcr.QMCabeceraRIG.AsInteger,
     DMFacturasAAcr.QMCabeceraID_E.AsInteger, 1, DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger);
  CierraData(DMLstInfFacAcreedor);
end;

procedure TFMFacturasAAcr.DBETituloAcreedorEnter(Sender: TObject);
begin
  DBEFAcreedor.SetFocus;
end;

procedure TFMFacturasAAcr.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (DMFacturasAAcr.QMDetalle.State = dsInsert) then
  begin
     HabilitaBotonesDetalle;
     HabilitaCambioIVA;
  end
  else if (DMFacturasAAcr.QMDetalle.State = dsBrowse) then
     HabilitaCambioIVA;
end;

procedure TFMFacturasAAcr.HabilitaBotones;
var
  Habil : boolean;
begin
  Habil := DMFacturasAAcr.HayDocumentos;

  AAbrirCerrar.Enabled := Habil;
  ADuplicar.Enabled := Habil;
  ADevolucion.Enabled := Habil;
  ACambiaFinanciacion.Enabled := Habil;
  ARecibos.Enabled := Habil;
end;

procedure TFMFacturasAAcr.AbreOCierra;
begin
  if (DMFacturasAAcr.EstadoDocumento = 5) then
  begin
     TButtAbreCierra.Hint := _('Desbloquea la Factura actual');
     TButtAbreCierra.ImageIndex := 67;
     TButtAbreCierra.Tag := 1;
     AAbrirCerrar.Hint := _('Desbloquea la Factura actual');
     AAbrirCerrar.ImageIndex := 67;
     AAbrirCerrar.Tag := 1;
     AAbrirCerrar.Caption := _('Abrir Factura');
  end
  else
  begin
     TButtAbreCierra.Hint := _('Bloquea la Factura actual');
     TButtAbreCierra.ImageIndex := 68;
     TButtAbreCierra.Tag := 0;
     AAbrirCerrar.Hint := _('Bloquea la Factura actual');
     AAbrirCerrar.ImageIndex := 68;
     AAbrirCerrar.Tag := 0;
     AAbrirCerrar.Caption := _('Cerrar Factura');
  end;

  HabilitaBotonesDetalle;

  ColorSegunEstado(DBEtituloEstado, DMFacturasAAcr.QMCabeceraESTADO.AsInteger);
end;

procedure TFMFacturasAAcr.HabilitaBotonesDetalle;
var
  Habil, HabilEd : boolean;
begin
  // Todos los botones INACTIVOS (No hay Detalle)
  Habil := ((DMFacturasAAcr.HayDetalle) or (DMFacturasAAcr.QMDetalle.State = dsInsert));
  HabilEd := Habil;

  // Ciertos botones INACTIVOS (Modo inserción/edición)
  if Habil then
     HabilEd := not (DMFacturasAAcr.QMDetalle.State in [dsInsert, dsEdit]);

  ANotasDetalle.Enabled := HabilEd;
  AOrdenaLineas.Enabled := HabilEd;
  ACentroCoste.Enabled := HabilEd;
  ADetallesDUA.Enabled := HabilEd;
  ADuplicarLinea.Enabled := HabilEd;
  ABuscarArticulo.Enabled := HabilEd;

  TButtNotas.Enabled := HabilEd;
  TButtBuscarArticulo.Enabled := HabilEd;
  TButtCentroCoste.Enabled := HabilEd;
  TButtDetallesDUA.Enabled := HabilEd;
  TButtDuplicarLinea.Enabled := HabilEd;

  if (DMFacturasAAcr.QMDetalle.State in [dsInsert, dsBrowse]) then
     HabilitaCambioIVA;

  HabilitaColumna(DBGFDetalle, 'TIPO_IVA', False);
end;

procedure TFMFacturasAAcr.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada and PDetalle.Enabled then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMFacturasAAcr.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMFacturasAAcr.DBGFDetalleDblClick(Sender: TObject);
begin
  {  if DMFacturasAAcr.haydetalle then
    AArticulo.Execute;}
end;

procedure TFMFacturasAAcr.RelojNotasTimer(Sender: TObject);
begin
  if (LBNotas.Color = clYellow) then
     LBNotas.Color := TBMain.Color
  else
     LBNotas.Color := clYellow;
end;

procedure TFMFacturasAAcr.AInfFacAcreedoresExecute(Sender: TObject);
begin
  AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
  AInfFacAcreedores.Enabled := False;
  try
     DMLstInfFacAcreedor.MostrarInforme(EFSerie.Text,
        DMFacturasAAcr.QMCabeceraRIG.AsInteger,
        DMFacturasAAcr.QMCabeceraID_E.AsInteger, 0, DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger);
  finally
     AInfFacAcreedores.Enabled := True;
     CierraData(DMLstInfFacAcreedor);
  end;

  DMFacturasAAcr.InfoActualiza;
end;

procedure TFMFacturasAAcr.AVisualizaFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraInformesFiltrados(0);
end;

procedure TFMFacturasAAcr.AImprimeFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraInformesFiltrados(1);
end;

procedure TFMFacturasAAcr.AResumenFacturasExecute(Sender: TObject);
begin
  AbreData(TDMLstFacturaAcr, DMLstFacturaAcr);
  TFMLstEntreFechas.Create(Self).Muestra('FCR', EFSerie.Text);
  CierraData(DMLstFacturaAcr);
end;

procedure TFMFacturasAAcr.AResumenFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMFacturasAAcr.AImpresionResumenFacturasFiltradasExecute(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMFacturasAAcr.AConfInformeFacturasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
  TFMListConfig.Create(Self).Muestra(74, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstInfFacAcreedor.frFactura, DMLstInfFacAcreedor.HYReport);
  CierraData(DMLstInfFacAcreedor);
end;

procedure TFMFacturasAAcr.AConfListadosFacturasAcreedorExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFacturaAcr, DMLstFacturaAcr);
  TFMListConfig.Create(Self).Muestra(101, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstFacturaAcr.frFactura);
  CierraData(DMLstFacturaAcr);
end;

procedure TFMFacturasAAcr.AAbrirCerrarExecute(Sender: TObject);
begin
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        if (TButtAbreCierra.Tag = 0) then
           DMFacturasAAcr.BloqueaFactura
        else if ConfirmaGrave then
           DMFacturasAAcr.DesbloqueaFactura;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMFacturasAAcr.ADuplicarExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMFacturasaAcr.Duplica;
  finally
     Screen.Cursor := crDefault;
     HabilitaBotones;
  end;
end;

procedure TFMFacturasAAcr.ADevolucionExecute(Sender: TObject);
var
  SerieDestino : string;
begin
  SerieDestino := DMFacturasAAcr.QMCabeceraSERIE.AsString;
  if PideDato('SER', SerieDestino) then
  begin
     try
        Screen.Cursor := crHourGlass;
        DMFacturasAAcr.Devuelve(SerieDestino);
     finally
        Screen.Cursor := crDefault;
     end;

     if (SerieDestino <> DMFacturasAAcr.QMCabeceraSERIE.AsString) then
     begin
        EFSerie.Text := SerieDestino;
        DMFacturasAAcr.QMCabecera.Last;
     end;
  end;
end;

procedure TFMFacturasAAcr.ACambiaFinanciacionExecute(Sender: TObject);
begin
  DMFacturasAAcr.CambiaFinanciacion;
end;

procedure TFMFacturasAAcr.ALeasingExecute(Sender: TObject);
begin
  DMFacturasAAcr.DatosLeasing;
end;

procedure TFMFacturasAAcr.ATipoIVAExecute(Sender: TObject);
begin
  TFMCambiaFacProv.Create(Self).muestra(DMFacturasAAcr.QMCabeceraID_E.AsInteger);
  DMFacturasAAcr.QMCabecera.Refresh;
end;

procedure TFMFacturasAAcr.ARecibosExecute(Sender: TObject);
begin
  if (DMFacturasAAcr.DameEstado = 5) then
     FMain.MuestraRecibos('FCR', EFSerie.Text,
        DBERIG.Text, DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger);
end;

procedure TFMFacturasAAcr.FormShow(Sender: TObject);
begin
  // KRICONF_207 - 1: Toma la Ultima serie utilizada de Factura de Acreedor al abrir el formulario
  if (DMMain.EstadoKri(207) <> 1) then
     EFSerie.Text := REntorno.Serie;

  HabilitaBotones;

  // Forzamos un primer refresco para que el navegador cambie si el usuario tiene documentos restringidos.
  NavMainClickAfterAdjust(Sender, nbRefresh);

  // Habilita;
end;

procedure TFMFacturasAAcr.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMFacturasAAcr.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
     DMFacturasAAcr.ControlaRestriccion;
  if Button in [nbEdit] then
     Editando := True
  else
     Editando := False;
end;

procedure TFMFacturasAAcr.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
     DMFacturasAAcr.ControlaRestriccion;
end;

procedure TFMFacturasAAcr.AEnviarFacturaAcrMailPDFExecute(Sender: TObject);
var
  Asunto : string;
  DMLstInfFacAcreedorCargado, DMListadosCargado : boolean;
  CuerpoMail : TStrings;
begin
  // Esto es porque el assigned no va

  DMLstInfFacAcreedorCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la factura por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
           DMLstInfFacAcreedorCargado := True;

           DMLstInfFacAcreedor.MostrarListadoMail(DMFacturasAAcr.QMCabeceraID_E.AsInteger,
              DMFacturasAAcr.QMCabeceraSERIE.AsString, 2, DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger);

           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;

           FSendCorreo.Texto(_('Enviando Mensaje  ...'));

           InicializaVariableEmail(DMFacturasAAcr.QMCabeceraTIPO.AsString);
           with VariableEmail do
           begin
              Ejercicio := DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger;
              Serie := DMFacturasAAcr.QMCabeceraSERIE.AsString;
              NumeroDocumento := DMFacturasAAcr.QMCabeceraRIG.AsInteger;
              Fecha := DMFacturasAAcr.QMCabeceraFECHA.AsDateTime;
              SuReferencia := DMFacturasAAcr.QMCabeceraSU_REFERENCIA.AsString;
              SuPedido := '';
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := DMLstInfFacAcreedor.nombreFich;
              Matricula := '';

              if (DMFacturasAAcr.QMCabeceraACREEDOR.AsInteger > 0) then
              begin
                 NombreComercial := DMFacturasAAcr.QMCabeceraNOMBRE_COMERCIAL.AsString;
                 RazonSocial := DMFacturasAAcr.QMCabeceraTITULO.AsString;
              end
              else
              begin
                 // El campo TITULO se rellena con el nombre asignado al Tercero Vario
                 NombreComercial := DMFacturasAAcr.QMCabeceraTITULO.AsString;
                 RazonSocial := DMFacturasAAcr.QMCabeceraTITULO.AsString;
              end;
              OrdenTrabajo := 0;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturasAAcr.QMCabeceraENTRADA.AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);
           try
              DMListados.SendMailTerceroPDF(DMFacturasAAcr.QMCabeceraTERCERO.AsInteger, CuerpoMail,
                 DMLstInfFacAcreedor.rutaFich, DMLstInfFacAcreedor.nombreFich, Asunto, DMFacturasAAcr.QMCabeceraTIPO.AsString, DMFacturasAAcr.QMCabeceraID_E.AsInteger);
           finally
              CuerpoMail.Free;
           end;
           CierraData(DMLstInfFacAcreedor);
           DMLstInfFacAcreedorCargado := False;
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
           if DMLstInfFacAcreedorCargado then
              CierraData(DMLstInfFacAcreedor);
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
  DMFacturasAAcr.InfoActualiza;
end;

procedure TFMFacturasAAcr.DBDTPFechaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha.Date);
end;

procedure TFMFacturasAAcr.AAnaliticaExecute(Sender: TObject);
begin
  DMFacturasAAcr.ApunteAnalitico(False);
end;

procedure TFMFacturasAAcr.AOrdenaLineasExecute(Sender: TObject);
begin
  DMFacturasAAcr.OrdenarLineas;
end;

procedure TFMFacturasAAcr.DBCHKCambioChange(Sender: TObject);
begin
  DBEValorCambio.Enabled := DBCHKCambio.Checked;
  DBEValorCambio.ReadOnly := not DBCHKCambio.Checked;
  if (DBCHKCambio.Checked) then
     ColorEdicion(DBEValorCambio)
  else
  begin
     ColorInfo(DBEValorCambio);
     DBEValorCambio.Text := FormatFloat(DMMain.MascaraMoneda(DMFacturasAAcr.QMCabeceraMONEDA.AsString, 1), 0);
  end;
end;

procedure TFMFacturasAAcr.FiltraFact(FiltroAccion: string);
begin
  DMFacturasAAcr.QMCabecera.Close;
  FMFacturasAAcr.TSTabla.Show;
  DMFacturasAAcr.FiltraFact(FiltroAccion);
end;

procedure TFMFacturasAAcr.DBDTPEntregaExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPEntrega.Date := DMMain.ValidaVersionDemoKri(DBDTPEntrega.Date);
end;

procedure TFMFacturasAAcr.DBDTPFecha_ConExit(Sender: TObject);
begin
  {dji lrk kri - Version demo}
  DBDTPFecha_Con.Date := DMMain.ValidaVersionDemoKri(DBDTPFecha_Con.Date);
end;

procedure TFMFacturasAAcr.DBGMainCellClick(Column: TColumn);
begin
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.NavDetalleChangeState(Sender: TObject);
begin
  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');
end;

procedure TFMFacturasAAcr.ABuscarArticuloExecute(Sender: TObject);
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
     if not PideDato('ART', Articulo, 'Articulo', 'FAMILIA = ''' + REntorno.FamSistema + '''') then
        // Si ha cancelado, borro contenido de variable
        Articulo := '';
  end;

  DMFacturasAAcr.BuscaArticulo(Articulo);

  BuscarArticulos := (Articulo <> '');
  TButtBuscarArticulo.Down := BuscarArticulos;

  HabilitaBotones;
end;

procedure TFMFacturasAAcr.EFProyectoBusqueda(Sender: TObject);
begin
  EFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' OR CANAL_NULL IS NULL)';
end;

procedure TFMFacturasAAcr.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  with DMFacturasAAcr.QMDetalle do
  begin
     if ((Key = VK_F3) and (not (State in [dsEdit, dsInsert]))) then
     begin
        if RecordCount = 0 then
           Insert
        else
           Edit;
     end;
  end;

  HabilitaBotonesDetalle;
end;

procedure TFMFacturasAAcr.AAdjuntosFacturaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('FCR', DMFacturasAAcr.QMCabeceraID_E.AsInteger);
end;

procedure TFMFacturasAAcr.AAdjuntosAcreedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ACR', DameIDAcreedor(DMFacturasAAcr.QMCabeceraACREEDOR.AsInteger));
end;

procedure TFMFacturasAAcr.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMFacturasAAcr.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMFacturasAAcr.AEnviarFacturaAcrMailPDF2Execute(Sender: TObject);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMLstInfFacAcreedor, DMLstInfFacAcreedor);
  try

     Memo := TStringList.Create;
     try
        DMLstInfFacAcreedor.MostrarListadoMail(DMFacturasAAcr.QMCabeceraID_E.AsInteger,
           DMFacturasAAcr.QMCabeceraSERIE.AsString, 2, DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger);

        InicializaVariableEmail(DMFacturasAAcr.QMCabeceraTIPO.AsString);
        with VariableEmail do
        begin
           Ejercicio := DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger;
           Serie := DMFacturasAAcr.QMCabeceraSERIE.AsString;
           NumeroDocumento := DMFacturasAAcr.QMCabeceraRIG.AsInteger;
           Fecha := DMFacturasAAcr.QMCabeceraFECHA.AsDateTime;
           SuReferencia := DMFacturasAAcr.QMCabeceraSU_REFERENCIA.AsString;
           SuPedido := '';
           Folio := '';
           TituloDocTributario := '';
           NombreFichero := DMLstInfFacAcreedor.nombreFich;
           Matricula := '';
           if (DMFacturasAAcr.QMCabeceraACREEDOR.AsInteger > 0) then
           begin
              NombreComercial := DMFacturasAAcr.QMCabeceraNOMBRE_COMERCIAL.AsString;
              RazonSocial := DMFacturasAAcr.QMCabeceraTITULO.AsString;
           end
           else
           begin
              // El campo TITULO se rellena con el nombre asignado al Tercero Vario
              NombreComercial := DMFacturasAAcr.QMCabeceraTITULO.AsString;
              RazonSocial := DMFacturasAAcr.QMCabeceraTITULO.AsString;
           end;
           OrdenTrabajo := 0;
           UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(DMFacturasAAcr.QMCabeceraENTRADA.AsInteger));
        end;
        DamePartesEmail(Asunto, CuerpoMail);
        try
           DMListados.SendMailTerceroPDF2(DMFacturasAAcr.QMCabeceraTERCERO.AsInteger, CuerpoMail,
              DMLstInfFacAcreedor.rutaFich, DMLstInfFacAcreedor.nombreFich, Asunto, DMFacturasAAcr.QMCabeceraTIPO.AsString, DMFacturasAAcr.QMCabeceraID_E.AsInteger, True);
        finally
           CuerpoMail.Free;
        end;
     finally
        Memo.Free;
     end;

     // Marco el documento como listado
     DMLstInfFacAcreedor.UpdateaDocumentos;
  finally
     CierraData(DMLstInfFacAcreedor);
  end;

  DMFacturasAAcr.InfoActualiza;
end;
// sfg_XGM-end- especial abrir cliente de correo predeterminado

procedure TFMFacturasAAcr.CBForzarModoIvaChange(Sender: TObject);
begin
  if (TLFDBCheckBox(Sender).Checked) then
  begin
     EFModoIva.Visible := True;
     EModoIva.Visible := True;
  end
  else
  begin
     EFModoIva.Visible := False;
     EModoIva.Visible := False;
  end;
end;

procedure TFMFacturasAAcr.EFModoIvaChange(Sender: TObject);
begin
  EModoIva.Text := DameTituloModoIVA(StrToIntDef(EFModoIva.Text, -1));
end;

procedure TFMFacturasAAcr.DBEFAcreedorChange(Sender: TObject);
begin
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMFacturasAAcr.QMCabeceraTERCERO.AsInteger);
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.DBEFAcreedorExiste(Sender: TObject);
begin
  if (not DMMain.AcreedorValido(StrToIntDef(DBEFAcreedor.Text, 0))) then
     DBEFAcreedor.Text := '';
  LTelefono.Caption := DMMain.DameTelefonoTercero(DMFacturasAAcr.QMCabeceraTERCERO.AsInteger);
end;

procedure TFMFacturasAAcr.HabilitarNCF;
begin
  if ((DMFacturasAAcr.QMCabeceraZ_TIPO_NCF.AsInteger >= 11) and (DMFacturasAAcr.QMCabeceraZ_TIPO_NCF.AsInteger <= 13)) then
  begin
     DBEFPrefijoNCF.Enabled := False;
     DBEContadorNCF.Enabled := False;
     ColorInfo(DBEFPrefijoNCF);
     ColorInfo(DBEContadorNCF);
  end
  else
  begin
     DBEFPrefijoNCF.Enabled := True;
     DBEContadorNCF.Enabled := True;
     ColorEdicion(DBEFPrefijoNCF);
     ColorEdicion(DBEContadorNCF);
  end;
end;

procedure TFMFacturasAAcr.DBCBVTipoNCFClick(Sender: TObject);
begin
  HabilitarNCF;
end;

procedure TFMFacturasAAcr.DBCBVTipoNCFEnter(Sender: TObject);
begin
  HabilitarNCF;
end;

procedure TFMFacturasAAcr.LTelefonoClick(Sender: TObject);
begin
  with MTelefonos do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        RellenaTelefonosTercero(DMFacturasAAcr.QMCabeceraTERCERO.AsInteger, Lines);
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

procedure TFMFacturasAAcr.DBCHKListadoClick(Sender: TObject);
begin
  DBCHKListado.Checked := (DMFacturasAAcr.xInfoActualizadaMODIFICA_DOC.AsInteger <> 0);
end;

procedure TFMFacturasAAcr.EFProyectoChange(Sender: TObject);
begin
  ETitProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFMFacturasAAcr.ADetallesDUAExecute(Sender: TObject);
var
  Regimen : integer;
begin
  /// Detalles De Linea para DUA, si el IVA es de Importacion (REGIMEN=1)

  if (DMFacturasAAcr.DameEstado <> 0) then
     raise Exception.Create(_('La factura esta cerrada y no se puede modificar'))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT REGIMEN FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = :TIPO';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['TIPO'].AsInteger := DMFacturasAAcr.QMDetalleTIPO_IVA.AsInteger;
           ExecQuery;
           Regimen := FieldByName['REGIMEN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Regimen = 1) then
        TFMDetalleDUA.Create(Self).Muestra(DMFacturasAAcr.QMDetalleID_DETALLES_E.AsInteger);
  end;
end;

procedure TFMFacturasAAcr.ADuplicarLineaExecute(Sender: TObject);
begin
  DMFacturasAAcr.DuplicarLinea;
end;

procedure TFMFacturasAAcr.LBNotasClick(Sender: TObject);
begin
  inherited;
  with MNotas do
  begin
     // Si no está visible, lo relleno. Luego se hará visible
     if (not Visible) then
     begin
        Lines.Clear;
        if (Trim(DMFacturasAAcr.xAcreedor.FieldByName('NOTAS').AsString) > '') then
           Lines.Add(DMFacturasAAcr.xAcreedor.FieldByName('NOTAS').AsString);
        {
        if (Trim(DMFacturasAAcr.xAcreedor.FieldByName('NOTAS_FACTURACION_KRI').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMFacturasAAcr.xAcreedor.FieldByName('NOTAS_FACTURACION_KRI').AsString);
        end;
        }
        if (Trim(DMFacturasAAcr.xAvisos.FieldByName('MENSAJE').AsString) > '') then
        begin
           Lines.Add('----------');
           Lines.Add(DMFacturasAAcr.xAvisos.FieldByName('MENSAJE').AsString);
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

procedure TFMFacturasAAcr.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMFacturasAAcr.FiltraDocumento(Trim(EFSerie.Text), '');

  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND (EJERCICIO = ' + REntorno.EjercicioStr + ' OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO = 0 OR ESTADO = 3))) ';

  G2KTableLoc.Click;

  HabilitaBotones;
  RefrescaAvisos;
end;

procedure TFMFacturasAAcr.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMFacturasAAcr.AFacturaMultiCanalExecute(Sender: TObject);
var
  Accion : integer;
begin
  inherited;
  FMTraspasoMultiCanal := TFMTraspasoMultiCanal.Create(nil);
  Accion := FMTraspasoMultiCanal.Carga(DMFacturasAAcr.QMCabeceraID_E.AsInteger, DMFacturasAAcr.QMCabeceraRIG.AsInteger,
     DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger, DMFacturasAAcr.QMCabeceraCANAL.AsInteger, 0,
     DMFacturasAAcr.QMCabeceraTIPO.AsString, DMFacturasAAcr.QMCabeceraSERIE.AsString);
  FreeAndNil(FMTraspasoMultiCanal);

  DMFacturasAAcr.RefrescaCabecera(Accion);
end;

procedure TFMFacturasAAcr.EFBuscaNIFKRIChange(Sender: TObject);
begin
  if (StrToIntDef(EFBuscaNIFKRI.Text, 0) <> 0) then
     with DMFacturasAAcr.QMCabecera do
     begin
        DisableControls;
        First;
        while ((DMFacturasAAcr.QMCabeceraID_E.AsInteger <> StrToIntDef(EFBuscaNIFKRI.Text, 0)) and (not DMFacturasAAcr.QMCabecera.EOF)) do
           Next;
        EnableControls;
     end;
end;

procedure TFMFacturasAAcr.ABuscaNIFKRIExecute(Sender: TObject);
begin
  EFBuscaNIFKRI.Text := '';
  EFBuscaNIFKRI.CondicionBusqueda := 'TIPO=''FCR'' AND SERIE=''' + EFSerie.Text + '''';
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

procedure TFMFacturasAAcr.ARegistroCarteraExecute(Sender: TObject);
begin
  inherited;
  if (DMFacturasAAcr.QMCabeceraREGISTRO_CARTERA.AsInteger <> 0) then
  begin
     FMain.MuestraCartera(DMFacturasAAcr.QMCabeceraEJERCICIO.AsInteger, REntorno.Canal, 'P', DMFacturasAAcr.QMCabeceraREGISTRO_CARTERA.AsInteger);
  end;
end;

procedure TFMFacturasAAcr.SBVerCarteraDblClick(Sender: TObject);
begin
  inherited;
  ARegistroCartera.Execute;
end;

procedure TFMFacturasAAcr.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMFacturasAAcr.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMFacturasAAcr.RelojAdjuntosTimer(Sender: TObject);
begin
  inherited;
  if (LAdjuntos.Color = clYellow) then
     LAdjuntos.Color := TBMain.Color
  else
     LAdjuntos.Color := clYellow;
end;

procedure TFMFacturasAAcr.RelojEmailTimer(Sender: TObject);
begin
  inherited;
  if (LEmail.Color = clYellow) then
     LEmail.Color := TBMain.Color
  else
     LEmail.Color := clYellow;
end;

procedure TFMFacturasAAcr.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

procedure TFMFacturasAAcr.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if ((Button = nbDelete) and (DMFacturasAAcr.QMCabeceraESTADO.AsInteger <> 0)) then
  begin
     ShowMessage(_('Documento Bloqueado'));
     Continua := False;
  end;
end;

procedure TFMFacturasAAcr.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAAcr.FiltraDocumento(EFSerie.Text, '');
end;

procedure TFMFacturasAAcr.AFiltroAbiertoExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAAcr.FiltraDocumento(EFSerie.Text, 'ESTADO = 0');
end;

procedure TFMFacturasAAcr.AFiltroCerradoExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAAcr.FiltraDocumento(EFSerie.Text, 'ESTADO = 5');
end;

procedure TFMFacturasAAcr.AFiltroLeasingExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAAcr.FiltraDocumento(EFSerie.Text, 'LEASING = 1');
end;

procedure TFMFacturasAAcr.AFiltroArrendamientoExecute(Sender: TObject);
begin
  inherited;
  DMFacturasAAcr.FiltraDocumento(EFSerie.Text, 'ARRENDAMIENTO = 1');
end;

procedure TFMFacturasAAcr.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + DMFacturasAAcr.QMCabeceraTERCERO.AsString;
end;

procedure TFMFacturasAAcr.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('FCR', DMFacturasAAcr.QMCabeceraID_E.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosFactura.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMFacturasAAcr.DBEFUsuarioCreacionChange(Sender: TObject);
begin
  inherited;
  EUsuarioCreacion.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioCreacion.Text, 0));
end;

procedure TFMFacturasAAcr.ABorradoMasivoLineasExecute(Sender: TObject);
begin
  with TFMProcesosMasivosLineas.Create(Self) do
  begin
     try
        Inicializar(DMFacturasAAcr.QMDetalleTIPO.AsString, DMFacturasAAcr.QMDetalleID_E.AsInteger);

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
                 Params.ByName['ID_E'].AsInteger := DMFacturasAAcr.QMDetalleID_E.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Refresco datos
           DMFacturasAAcr.RefrescaCabecera(1);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMFacturasAAcr.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturasAAcr.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  EIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

procedure TFMFacturasAAcr.RefrescaAvisos;
begin
  if (((DMFacturasAAcr.xAcreedor.Active) and (Trim(DMFacturasAAcr.xAcreedor.FieldByName('NOTAS').AsString) > '')) or
     ((DMFacturasAAcr.xAvisos.Active) and (Trim(DMFacturasAAcr.xAvisos.FieldByName('MENSAJE').AsString) > ''))) then
     RelojNotas.Enabled := True
  else
     RelojNotas.Enabled := False;

  LBNotas.Visible := RelojNotas.Enabled;

  if (DMMain.ExisteAdjunto(DMFacturasAAcr.QMCabeceraTIPO.AsString, DMFacturasAAcr.QMCabeceraID_E.AsInteger)) then
     RelojAdjuntos.Enabled := True
  else
     RelojAdjuntos.Enabled := False;

  LAdjuntos.Visible := RelojAdjuntos.Enabled;

  if (DMMain.EnviarFacturasProvAcrePorEmail(DMFacturasAAcr.QMCabeceraTERCERO.AsInteger)) then
     RelojEmail.Enabled := True
  else
     RelojEmail.Enabled := False;

  LEmail.Visible := RelojEmail.Enabled;
end;

procedure TFMFacturasAAcr.ADividirLineaIVAExecute(Sender: TObject);
var
  Porcentaje : double;
begin
  inherited;
  Porcentaje := 50;
  if PideDato('DBL', Porcentaje, _('Porcentaje'), '') then
  begin
     if (Porcentaje > 0) and (Porcentaje < 100) then
        DMFacturasAAcr.DividirLineaIVA(Porcentaje);
  end;
end;

procedure TFMFacturasAAcr.ADividirLineaProyectoExecute(Sender: TObject);
var
  FMRepartirLineaProyecto : TFMRepartirLineaProyecto;
begin
  FMRepartirLineaProyecto := TFMRepartirLineaProyecto.Create(Self);
  FMRepartirLineaProyecto.Inicializar(DMFacturasAAcr.QMDetalleTIPO.AsString, DMFacturasAAcr.QMDetalleID_DETALLES_E.AsInteger, DMFacturasAAcr.QMDetalleUNIDADES.AsFloat, DMFacturasAAcr.QMDetalleB_IMPONIBLE.AsFloat / DMFacturasAAcr.QMDetalleUNIDADES.AsFloat);
  FMRepartirLineaProyecto.ShowModal;
  FreeAndNil(FMRepartirLineaProyecto);
end;

end.
