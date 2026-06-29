unit UFMProyectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls,
  UDBDateTimePicker, Mask, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBMemo,
  ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFLabel, UG2kTBLoc, ULFDBDateEdit, ULFEditFind2000, ULFMemo, ULFEdit,
  ULFDateEdit, Buttons, URecursos, ULFComboBox;

type
  TFMProyectos = class(TFPEdit)
     LProyecto: TLFLabel;
     DBEProyecto: TLFDbedit;
     LCanal: TLFLabel;
     LCliente: TLFLabel;
     ECanal: TLFEdit;
     ECliente: TLFEdit;
     DBDTPInicio: TLFDBDateEdit;
     DBDTPFinal: TLFDBDateEdit;
     DBETitulo: TLFDbedit;
     DBCBCerrado: TLFDBCheckBox;
     DBMNotas: TLFDBMemo;
     LCierre: TLFLabel;
     LApertura: TLFLabel;
     DBECompras: TLFDbedit;
     LCompras: TLFLabel;
     LOtros: TLFLabel;
     DBEOtros: TLFDbedit;
     LVentas: TLFLabel;
     DBEVentas: TLFDbedit;
     LBeneficios: TLFLabel;
     DBEBeneficios: TLFDbedit;
     DBEFCanal: TLFDBEditFind2000;
     DBEFCliente: TLFDBEditFind2000;
     TSCompras: TTabSheet;
     TSOtros: TTabSheet;
     TSVentas: TTabSheet;
     TBCompras: TLFToolBar;
     NavCompras: THYMNavigator;
     PCCompras: TLFPageControl;
     TScFicha: TTabSheet;
     TScTabla: TTabSheet;
     PaOtros: TLFPanel;
     LProyectoConta: TLFLabel;
     DBEProyectoConta: TLFDbedit;
     DBETituloConta: TLFDbedit;
     TBOtros: TLFToolBar;
     NavOtros: THYMNavigator;
     TBVentas: TLFToolBar;
     NavVentas: THYMNavigator;
     PCOtros: TLFPageControl;
     TSoFicha: TTabSheet;
     TSoTabla: TTabSheet;
     PCVentas: TLFPageControl;
     TSvFicha: TTabSheet;
     TSvTabla: TTabSheet;
     DBGCompras: THYTDBGrid;
     DBGOtros: THYTDBGrid;
     DBGVentas: THYTDBGrid;
     PNLEdVentas: TLFPanel;
     LEjercicioVentas: TLFLabel;
     LCanalVentas: TLFLabel;
     LSerieVientas: TLFLabel;
     LTipoVentas: TLFLabel;
     LRIGVentas: TLFLabel;
     LLineaVentas: TLFLabel;
     LUnidadesMaxVentas: TLFLabel;
     DBEvEjercicio: TLFDbedit;
     DBEvCanal: TLFDbedit;
     DBEvSerie: TLFDbedit;
     DBEvTipo: TLFDbedit;
     DBEvRig: TLFDbedit;
     DBEvLinea: TLFDbedit;
     DBEvTitulo: TLFDbedit;
     DBEvMax: TLFDbedit;
     DBEvArticulo: TLFDbedit;
     CEVentas: TControlEdit;
     DBEvImporte: TLFDbedit;
     LPrecioUnitarioVentas: TLFLabel;
     LUnidadesVentas: TLFLabel;
     DBEvUnidades: TLFDbedit;
     DBCBvAfecTotal: TLFDBCheckBox;
     LTotalLineaVentas: TLFLabel;
     DBEvTotal: TLFDbedit;
     CECompras: TControlEdit;
     CEComprasPMEdit: TPopUpTeclas;
     CEVentasPMEdit: TPopUpTeclas;
     PNLEdOtros: TLFPanel;
     DBEMoneda: TLFDbedit;
     LMoneda: TLFLabel;
     DBDateTimeFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     DBETituloOtro: TLFDbedit;
     LTitulo: TLFLabel;
     DBNotasOtros: TLFDBMemo;
     LNotasOtros: TLFLabel;
     DBEUnidades: TLFDbedit;
     LUnidades: TLFLabel;
     DBImporte: TLFDbedit;
     LImporte: TLFLabel;
     DBETotal: TLFDbedit;
     LTotal: TLFLabel;
     CEOtros: TControlEdit;
     CEOtrosPMEdit: TPopUpTeclas;
     DBCBContabilidadAnalitica: TLFDBCheckBox;
     LBLSufContable: TLFLabel;
     DBESufijoCont: TLFDbedit;
     LBLIndiceSuf: TLFLabel;
     DBEIndiceSufijo: TLFDbedit;
     GBPlanContOrigen: TGroupBox;
     DBEFPlanContOrigen: TLFDbedit;
     LBLPlanContOri: TLFLabel;
     LBLSufContOri: TLFLabel;
     DBESufijoContOrigen: TLFDbedit;
     DBEPlanContOrigen: TLFDbedit;
     LBLIndiceSufOri: TLFLabel;
     DBEIndiceSufOrigen: TLFDbedit;
     DBCBActEstAnalitica: TLFDBCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     ACreaPlanCont: TAction;
     ADestruyePlanCont: TAction;
     AListarProyectos: TAction;
     AConfListadoProyectos: TAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     TSOfertas: TTabSheet;
     TBOfertas: TLFToolBar;
     NavOfertas: THYMNavigator;
     PNLEdCompras: TLFPanel;
     LEjercicioCompras: TLFLabel;
     LCanalCompras: TLFLabel;
     LSerieCompras: TLFLabel;
     LTipoCompras: TLFLabel;
     LRIGCompras: TLFLabel;
     LLineaCompras: TLFLabel;
     LUnidadesMaxCompras: TLFLabel;
     LPrecioUnitarioCompras: TLFLabel;
     DBEcEjercicio: TLFDbedit;
     DBEcCanal: TLFDbedit;
     DBEcSerie: TLFDbedit;
     DBEcTipo: TLFDbedit;
     DBEcRig: TLFDbedit;
     DBEcLinea: TLFDbedit;
     DBEcTitulo: TLFDbedit;
     DBEcUniMax: TLFDbedit;
     DBEcArticulo: TLFDbedit;
     DBEcPrecio: TLFDbedit;
     LUnidadesCompras: TLFLabel;
     LTotalLineaCompras: TLFLabel;
     DBEcUnidades: TLFDbedit;
     DBCBcAfecTotal: TLFDBCheckBox;
     DBEcTotal: TLFDbedit;
     PNLEdOferas: TLFPanel;
     LEjercicioOfertas: TLFLabel;
     LCanalOfertas: TLFLabel;
     LSerieOfertas: TLFLabel;
     LTipoOfertas: TLFLabel;
     LRIGOfertas: TLFLabel;
     LLineaOfertas: TLFLabel;
     LUdsMaxOfertas: TLFLabel;
     LPrecioUnitarioOfertas: TLFLabel;
     DBEEjercicioOfertas: TLFDbedit;
     DBECanalOfertas: TLFDbedit;
     DBESerieOfertas: TLFDbedit;
     DBETipoOfertas: TLFDbedit;
     DBERIGOfertas: TLFDbedit;
     DBELineaOfertas: TLFDbedit;
     DBEUdsMaxOfertas: TLFDbedit;
     DBEArticuloOfertas: TLFDbedit;
     DBEImporteOfertas: TLFDbedit;
     LUnidadesOfertas: TLFLabel;
     LTotalOfertas: TLFLabel;
     DBEUnidadesOfertas: TLFDbedit;
     DBCBAfecTotalOfertas: TLFDBCheckBox;
     DBETotalOfertas: TLFDbedit;
     PCOfertas: TLFPageControl;
     TSFichaOfertas: TTabSheet;
     TSTablaOfertas: TTabSheet;
     DBGOfertas: THYTDBGrid;
     LSemana: TLFLabel;
     LLinea: TLFLabel;
     DBELinea: TLFDbedit;
     LUsuario: TLFLabel;
     DBEFUsuario: TLFDBEditFind2000;
     EUsuario: TLFEdit;
     LFCategoryAction4: TLFCategoryAction;
     AAdjuntosProyecto: TAction;
     PDetalle: TLFPanel;
     PCDetalle: TLFPageControl;
     TSContaAnalitica: TTabSheet;
     LNotas: TLFLabel;
     LSuReferenciaOfertas: TLFLabel;
     LTituloCompras: TLFLabel;
     LArticuloCompras: TLFLabel;
     LTituloVentas: TLFLabel;
     LArticuloVentas: TLFLabel;
     LCodigoInterno: TLFLabel;
     DBECodigoInterno: TLFDbedit;
     LTercero: TLFLabel;
     DBEFTercero: TLFDBEditFind2000;
     ETercero: TLFEdit;
     LFLabel1: TLFLabel;
     DBEFDireccionTercero: TLFDBEditFind2000;
     DBEKilometrosDestino: TLFDbedit;
     LKilometrosDestino: TLFLabel;
     LSerie: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     ESerie: TLFEdit;
     SBACliente: TSpeedButton;
     SBATercero: TSpeedButton;
     DBETituloDireccion: TLFDbedit;
     LLocalidad: TLFLabel;
     DBETitulo_Localidad: TLFDbedit;
     LCodPostal: TLFLabel;
     DBECodigoPostal: TLFDbedit;
     LProvincia: TLFLabel;
     DBEProvincia: TLFDbedit;
     LPais: TLFLabel;
     DBEPais: TLFDbedit;
     AAsignaHistorico: TAction;
     LTipoDocumentoVentas: TLFLabel;
     CBTipoDocumentoVentas: TLFComboBox;
     PNLVentas: TLFPanel;
     PNLCompras: TLFPanel;
     LTipoDocumentoCompra: TLFLabel;
     CBTipoDocumentoCompras: TLFComboBox;
     LHorario: TLFLabel;
     DTPHorario1Desde: TDBDateTimePicker;
     DTPHorario1Hasta: TDBDateTimePicker;
     DTPHorario2Desde: TDBDateTimePicker;
     DTPHorario2Hasta: TDBDateTimePicker;
     LHorarioSep1: TLFLabel;
     LHorarioSep2: TLFLabel;
     TSReparaciones: TTabSheet;
     TBReparaciones: TLFToolBar;
     NavReparaciones: THYMNavigator;
     CEReparaciones: TControlEdit;
     CEReparacionesPMEdit: TPopUpTeclas;
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
     MenuItem25: TMenuItem;
     MenuItem26: TMenuItem;
     MenuItem27: TMenuItem;
     MenuItem28: TMenuItem;
     MenuItem29: TMenuItem;
     MenuItem30: TMenuItem;
     MenuItem31: TMenuItem;
     PNLReparaciones: TLFPanel;
     DBGReparaciones: THYTDBGrid;
     CEOfertas: TControlEdit;
     CEOfertasPMEdit: TPopUpTeclas;
     TSOrdenes: TTabSheet;
     PNLOrdenes: TLFPanel;
     DBGOrdenes: THYTDBGrid;
     TBOrdenes: TLFToolBar;
     NavOrdenes: THYMNavigator;
     CEOrdenes: TControlEdit;
     CEOrdenesPMEdit: TPopUpTeclas;
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
     MenuItem32: TMenuItem;
     MenuItem33: TMenuItem;
     MenuItem34: TMenuItem;
     MenuItem35: TMenuItem;
     MenuItem36: TMenuItem;
     MenuItem37: TMenuItem;
     MenuItem38: TMenuItem;
     MenuItem39: TMenuItem;
     MenuItem40: TMenuItem;
     MenuItem41: TMenuItem;
     MenuItem42: TMenuItem;
     LAgente: TLFLabel;
     DBEFAgente: TLFDBEditFind2000;
     EAgente: TLFEdit;
     SBAAgente: TSpeedButton;
     LDirManual: TLFLabel;
     DBMDirManual: TLFDBMemo;
     TSEmpleados: TTabSheet;
     TBEmpleados: TLFToolBar;
     NavEmpleados: THYMNavigator;
     PNLEdEmpleados: TLFPanel;
     LFLabel3: TLFLabel;
     LFLabel5: TLFLabel;
     LFLabel6: TLFLabel;
     LFLabel7: TLFLabel;
     LFLabel8: TLFLabel;
     LSemanaEmpleado: TLFLabel;
     LFLabel10: TLFLabel;
     LEmpleado: TLFLabel;
     DBDEEmpleadoFecha: TLFDBDateEdit;
     DBEEmpleadoTitulo: TLFDbedit;
     DBMEmpleadoNotas: TLFDBMemo;
     DBEEmpleadosUnidades: TLFDbedit;
     DBEEmpleadoImporte: TLFDbedit;
     DBEEmpleadoTotal: TLFDbedit;
     DBEEmpleadoLinea: TLFDbedit;
     DBEFEmpleado: TLFDBEditFind2000;
     PCEmpleados: TLFPageControl;
     TSFichaEmpleado: TTabSheet;
     TSTablaEmpleado: TTabSheet;
     DBGEmpleados: THYTDBGrid;
     CEEmpleados: TControlEdit;
     CEEmpleadosPMEdit: TPopUpTeclas;
     LEmpleados: TLFLabel;
     DBEEmpleados: TLFDbedit;
     AAccionComercial: TAction;
     procedure FormCreate(Sender: TObject);
     procedure TSVentasShow(Sender: TObject);
     procedure TSvTablaShow(Sender: TObject);
     procedure TSComprasShow(Sender: TObject);
     procedure TScTablaShow(Sender: TObject);
     procedure NavVentasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavComprasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure TSOtrosShow(Sender: TObject);
     procedure TSoTablaShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavOtrosBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure ACreaPlanContExecute(Sender: TObject);
     procedure ADestruyePlanContExecute(Sender: TObject);
     procedure AListarProyectosExecute(Sender: TObject);
     procedure AConfListadoProyectosExecute(Sender: TObject);
     procedure TSOfertasShow(Sender: TObject);
     procedure DBDateTimeFechaChange(Sender: TObject);
     procedure DBEFUsuarioChange(Sender: TObject);
     procedure NavOfertasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AAdjuntosProyectoExecute(Sender: TObject);
     procedure PCDetalleChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFCanalChange(Sender: TObject);
     procedure DBEFDireccionTerceroBusqueda(Sender: TObject);
     procedure DBEFTerceroChange(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure DBEFSerieBusqueda(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAsignaHistoricoExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure CBTipoDocumentoVentasChange(Sender: TObject);
     procedure DBGVentasCellClick(Column: TColumn);
     procedure DBGVentasDblClick(Sender: TObject);
     procedure DBGVentasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure CBTipoDocumentoComprasChange(Sender: TObject);
     procedure DBGComprasCellClick(Column: TColumn);
     procedure DBGComprasDblClick(Sender: TObject);
     procedure DBGComprasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TSReparacionesShow(Sender: TObject);
     procedure DBGReparacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGReparacionesCellClick(Column: TColumn);
     procedure DBGReparacionesDblClick(Sender: TObject);
     procedure DBGOfertasCellClick(Column: TColumn);
     procedure DBGOfertasDblClick(Sender: TObject);
     procedure DBGOfertasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure DBGOrdenesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGOrdenesCellClick(Column: TColumn);
     procedure DBGOrdenesDblClick(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBEFAgenteChange(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure NavEmpleadosBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBDEEmpleadoFechaChange(Sender: TObject);
     procedure TSEmpleadosShow(Sender: TObject);
     procedure AAccionComercialExecute(Sender: TObject);
  private
     { Private declarations }
     ColActualOfertas, ColActualVentas, ColActualCompras, ColActualReparaciones, ColActualOrdenes: TColumn;
  public
     { Public declarations }
     procedure Filtra(Proyecto: integer);
  end;

var
  FMProyectos : TFMProyectos;

implementation

uses UDMProyectos, UFormGest, UDMMain, UFCreaPlanContProy, UDMListados, UFMAdjunto,
  UFPregProyectos, UDMLstProyectos, {UDMListConfig,} UFMListConfig, UUtiles, UEntorno, HYFIBQuery, DateUtils, UFMSeleccionGrid,
  UFMain, ShellApi, URecibeFicheros, UDMAdjunto, UParam, UCrmFMAccionesCab, UDameDato;

{$R *.DFM}

procedure TFMProyectos.FormCreate(Sender: TObject);
var
  contAnalitica : boolean;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMProyectos, DMProyectos);

  NavMain.DataSource := DMProyectos.DSQMProyectos;
  EPMain.DataSource := DMProyectos.DSQMProyectos;
  DBGMain.DataSource := DMProyectos.DSQMProyectos;
  G2kTableLoc.DataSource := DMProyectos.DSQMProyectos;

  NavOtros.DataSource := DMProyectos.DSQMOtros;
  DBGOtros.DataSource := DMProyectos.DSQMOtros;
  NavVentas.DataSource := DMProyectos.DSQMVentas;
  DBGVentas.DataSource := DMProyectos.DSQMVentas;
  NavCompras.DataSource := DMProyectos.DSQMCompras;
  DBGCompras.DataSource := DMProyectos.DSQMCompras;
  NavOfertas.DataSource := DMProyectos.DSQMOfertas;
  DBGOfertas.DataSource := DMProyectos.DSQMOfertas;
  NavReparaciones.DataSource := DMProyectos.DSQMReparaciones;
  DBGReparaciones.DataSource := DMProyectos.DSQMReparaciones;
  NavOrdenes.DataSource := DMProyectos.DSQMOrdenes;
  DBGOrdenes.DataSource := DMProyectos.DSQMOrdenes;

  // Desactivamos la contabilidad Analitica si el usuario no puede acceder a ella
  contAnalitica := DMMain.PuedeHacerImputaciones;
  TSContaAnalitica.TabVisible := contAnalitica;

  if (not contAnalitica) then
  begin
     ADestruyePlanCont.Destroy;
     ACreaPlanCont.Destroy;
  end;

  PCMain.ActivePage := TSFicha;

  SolapaControles(SBACliente, ECliente);
  ECliente.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAAgente, EAgente);
  EAgente.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBATercero, ETercero);
  ETercero.Color := REntorno.ColorEnlaceActivo;

  CBTipoDocumentoVentas.ItemIndex := 0;
  ColActualVentas := DBGVentas.Columns[0];

  CBTipoDocumentoCompras.ItemIndex := 0;
  ColActualCompras := DBGCompras.Columns[0];
  ColActualOfertas := DBGOfertas.Columns[0];

  ColActualReparaciones := DBGReparaciones.Columns[0];
  ColActualOrdenes := DBGOrdenes.Columns[0];

  // Color campo ID
  ColorCampoID(DBEProyecto);
end;

procedure TFMProyectos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMProyectos);
end;

procedure TFMProyectos.TSVentasShow(Sender: TObject);
begin
  PCVentas.SetFocus;
  PCVentas.ActivePage := TSvTabla;
  ControlEdit := CEVentas;
end;

procedure TFMProyectos.TSvTablaShow(Sender: TObject);
begin
  DBGVentas.SetFocus;
end;

procedure TFMProyectos.TSComprasShow(Sender: TObject);
begin
  PCCompras.SetFocus;
  PCCompras.ActivePage := TScTabla;
  ControlEdit := CECompras;
end;

procedure TFMProyectos.TScTablaShow(Sender: TObject);
begin
  DBGCompras.SetFocus;
end;

procedure TFMProyectos.NavVentasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  Continua := True;
  if (Button = nbInsert) then
  begin
     DMProyectos.InsDocVentas;
     Continua := False;
  end;
end;

procedure TFMProyectos.NavComprasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  Continua := True;
  if (Button = nbInsert) then
  begin
     DMProyectos.InsDocCompras;
     Continua := False;
  end;
end;

procedure TFMProyectos.TSOtrosShow(Sender: TObject);
begin
  inherited;
  PCOtros.SetFocus;
  PCOtros.ActivePage := TSoTabla;
  ControlEdit := CEOtros;
end;

procedure TFMProyectos.TSoTablaShow(Sender: TObject);
begin
  inherited;
  DBGOtros.SetFocus;
end;

procedure TFMProyectos.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMProyectos.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMProyectos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMProyectos.BusquedaCompleja;

  // Refresco los datos de la pestaña activa
  PCDetalleChange(PCDetalle);

  Continua := False;
end;

procedure TFMProyectos.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavMain.SetFocus;
end;

procedure TFMProyectos.NavOtrosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavOtros.SetFocus;
end;

procedure TFMProyectos.ACreaPlanContExecute(Sender: TObject);
var
  FCreaPlanContProy : TFCreaPlanContProy;
begin
  FCreaPlanContProy := TFCreaPlanContProy.Create(Self);
  if (FCreaPlanContProy.mostrar(DMProyectos.QMProyectosPROYECTO.AsInteger,
     DMProyectos.QMProyectosACTUALIZA_ESTRUCTURA_ANALITICA.AsInteger)) then
     DMProyectos.RefrescaTabla;
end;

procedure TFMProyectos.ADestruyePlanContExecute(Sender: TObject);
begin
  if (ConfirmaMensaje(_('Atención: Se perderán todos los datos del Plan Contable Analítico asociado al proyecto.'))) then
  begin
     DMProyectos.DestruyePlanContable;
     DMProyectos.RefrescaTabla;
  end;
end;

procedure TFMProyectos.AListarProyectosExecute(Sender: TObject);
begin
  AbreForm(TFPregProyectos, FPregProyectos, Sender);
  FPregProyectos.FiltrarProyecto(DMProyectos.QMProyectosPROYECTO.AsInteger);
end;

procedure TFMProyectos.AConfListadoProyectosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProyectos, DMLstProyectos);
  TFMListConfig.Create(Self).Muestra(5125, Formato, Cabecera, Copias, Pijama, '', DMLstProyectos.frProyectos);
end;

procedure TFMProyectos.TSOfertasShow(Sender: TObject);
begin
  inherited;
  PCOfertas.SetFocus;
  PCOfertas.ActivePage := TSTablaOfertas;
  // ControlEdit := CEOfertas;
end;

procedure TFMProyectos.DBDateTimeFechaChange(Sender: TObject);
begin
  inherited;
  LSemana.Caption := Format(_('Semana %d'), [WeekOfTheYear(DBDateTimeFecha.Date)]);
end;

procedure TFMProyectos.DBEFUsuarioChange(Sender: TObject);
begin
  inherited;
  EUsuario.Text := DameTituloUsuario(StrToIntDef(DBEFUsuario.Text, 0));
end;

procedure TFMProyectos.NavOfertasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
var
  Seleccion : TFMSeleccionGrid;
  IdS : integer;
begin
  Continua := True;
  IdS := 0;
  if (Button = nbInsert) then
  begin
     Seleccion := TFMSeleccionGrid.Create(Self);
     try
        with Seleccion do
        begin
           Caption := _('Selección de oferta');
           AsignaSQL('SELECT EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S FROM VER_CABECERAS_OFERTA_C WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND CANAL = ' + REntorno.CanalStr + ' AND PROYECTO = 0 ORDER BY EJERCICIO DESC, SERIE, RIG DESC');
           MostrarColumna('EJERCICIO', _('Ejercicio'), 50);
           MostrarColumna('SERIE', _('Serie'), 50);
           MostrarColumna('RIG', _('Nro. Oferta'), 200);
           if (ShowModal = mrOk) then
           begin
              IdS := FDS.FieldByName('ID_S').AsInteger;
           end;
        end;
     finally
        FreeAndNil(Seleccion);
     end;

     if (IdS <> 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE GES_CABECERAS_S SET PROYECTO = :PROYECTO WHERE ID_S = :ID_S';
              Params.ByName['PROYECTO'].AsInteger := DMProyectos.QMProyectosPROYECTO.AsInteger;
              Params.ByName['ID_S'].AsInteger := IdS;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        DMProyectos.QMOfertas.Close;
        DMProyectos.QMOfertas.Open;
     end;

     Continua := False;
  end;
end;

procedure TFMProyectos.AAdjuntosProyectoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRY', DMProyectos.QMProyectosID_P.AsInteger);
end;

procedure TFMProyectos.PCDetalleChange(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := 1;
  if ((Sender as TLFPageControl).ActivePage = TSOfertas) then
     i := 1;
  if ((Sender as TLFPageControl).ActivePage = TSCompras) then
     i := 2;
  if ((Sender as TLFPageControl).ActivePage = TSVentas) then
     i := 3;
  if ((Sender as TLFPageControl).ActivePage = TSOtros) then
     i := 4;
  if ((Sender as TLFPageControl).ActivePage = TSReparaciones) then
     i := 5;
  if ((Sender as TLFPageControl).ActivePage = TSOrdenes) then
     i := 6;
  if ((Sender as TLFPageControl).ActivePage = TSEmpleados) then
     i := 7;

  DMProyectos.AbrirPestanya(i);
end;

procedure TFMProyectos.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
end;

procedure TFMProyectos.DBEFCanalChange(Sender: TObject);
begin
  inherited;
  ECanal.Text := DameTituloCanal(StrToIntDef(DBEFCanal.Text, 0));
end;

procedure TFMProyectos.DBEFDireccionTerceroBusqueda(Sender: TObject);
begin
  inherited;
  if (DMProyectos.QMProyectosTERCERO_NULL.AsInteger > 0) then
  begin
     DBEFDireccionTercero.CondicionBusqueda := 'TERCERO=' + DMProyectos.QMProyectosTERCERO_NULL.AsString;
  end;
end;

procedure TFMProyectos.DBEFTerceroChange(Sender: TObject);
begin
  inherited;
  ETercero.Text := DameTituloTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMProyectos.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMProyectos.DBEFSerieBusqueda(Sender: TObject);
begin
  inherited;
  if (DMProyectos.QMProyectosCANAL_NULL.AsString > '') then
     DBEFSerie.CondicionBusqueda := 'CANAL=' + DMProyectos.QMProyectosCANAL_NULL.AsString;
end;

procedure TFMProyectos.Filtra(Proyecto: integer);
begin
  DMProyectos.Filtra(Proyecto);
end;

procedure TFMProyectos.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  if (DMProyectos.QMProyectosCLIENTE_NULL.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMProyectos.QMProyectosCLIENTE_NULL.AsInteger));
end;

procedure TFMProyectos.SBAAgenteDblClick(Sender: TObject);
begin
  inherited;
  if (DMProyectos.QMProyectosAGENTE_NULL.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + IntToStr(DMProyectos.QMProyectosAGENTE_NULL.AsInteger));
end;

procedure TFMProyectos.SBATerceroDblClick(Sender: TObject);
begin
  inherited;
  if (DMProyectos.QMProyectosTERCERO_NULL.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + IntToStr(DMProyectos.QMProyectosTERCERO_NULL.AsInteger));
end;

procedure TFMProyectos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMProyectos.AAsignaHistoricoExecute(Sender: TObject);
begin
  inherited;
  DMProyectos.AsignaHistorico;
end;

procedure TFMProyectos.FormShow(Sender: TObject);
begin
  inherited;
  if (LeeParametro('PRYMODO002') <> 'N') then
  begin
     TSOfertas.TabVisible := True;
     PCDetalle.ActivePage := TSOfertas;
     NavCompras.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
     NavCompras.Width := 220;
     NavVentas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
     NavVentas.Width := 220;
  end
  else
  begin
     TSOfertas.TabVisible := False;
     PCDetalle.ActivePage := TSCompras;
     NavCompras.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh];
     NavCompras.Width := 176;
     NavVentas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh];
     NavVentas.Width := 176;
  end;

  PCDetalleChange(PCDetalle);
end;

procedure TFMProyectos.CBTipoDocumentoVentasChange(Sender: TObject);
var
  TipoDocumento : string;
begin
  inherited;
  if (PCDetalle.ActivePage = TSVentas) then
  begin
     TipoDocumento := CBTipoDocumentoVentas.Text;
     if (CBTipoDocumentoVentas.ItemIndex <= 0) then
        TipoDocumento := 'ALL';
     DMProyectos.FiltraVentas(TipoDocumento);
  end;
end;

procedure TFMProyectos.DBGVentasCellClick(Column: TColumn);
begin
  inherited;
  ColActualVentas := Column;
end;

procedure TFMProyectos.DBGVentasDblClick(Sender: TObject);
begin
  if (UpperCase(ColActualVentas.FieldName) = 'RIG') then
  begin
     if (DMProyectos.QMVentas.FieldByName('ID_S').AsInteger <> 0) then
     begin
        FMain.TraspasoDeDocumentosSalida(DMProyectos.QMVentas.FieldByName('ID_S').AsInteger);
     end;
  end
  else
     inherited;
end;

procedure TFMProyectos.DBGVentasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMProyectos.CBTipoDocumentoComprasChange(Sender: TObject);
var
  TipoDocumento : string;
begin
  inherited;
  if (PCDetalle.ActivePage = TSCompras) then
  begin
     TipoDocumento := CBTipoDocumentoCompras.Text;
     if (CBTipoDocumentoCompras.ItemIndex <= 0) then
        TipoDocumento := 'ALL';
     DMProyectos.FiltraCompras(TipoDocumento);
  end;
end;

procedure TFMProyectos.DBGComprasCellClick(Column: TColumn);
begin
  inherited;
  ColActualCompras := Column;
end;

procedure TFMProyectos.DBGComprasDblClick(Sender: TObject);
begin
  if (UpperCase(ColActualCompras.FieldName) = 'RIG') then
  begin
     if (DMProyectos.QMCompras.FieldByName('ID_E').AsInteger <> 0) then
     begin
        FMain.TraspasoDeDocumentosEntrada(DMProyectos.QMCompras.FieldByName('ID_E').AsInteger);
     end;
  end
  else
     inherited;
end;

procedure TFMProyectos.DBGComprasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMProyectos.TSReparacionesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEReparaciones;
end;

procedure TFMProyectos.DBGReparacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'REPARACION')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMProyectos.DBGReparacionesCellClick(Column: TColumn);
begin
  inherited;
  ColActualReparaciones := Column;
end;

procedure TFMProyectos.DBGReparacionesDblClick(Sender: TObject);
begin
  if (UpperCase(ColActualReparaciones.FieldName) = 'REPARACION') then
  begin
     if (DMProyectos.QMReparaciones.FieldByName('IDCABREPARAR').AsInteger <> 0) then
     begin
        FMain.EjecutaAccion(FMain.AReparaciones, 'IDCABREPARAR = ' + DMProyectos.QMReparaciones.FieldByName('IDCABREPARAR').AsString);
     end;
  end
  else
     inherited;
end;

procedure TFMProyectos.DBGOfertasCellClick(Column: TColumn);
begin
  inherited;
  ColActualOfertas := Column;
end;

procedure TFMProyectos.DBGOfertasDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActualOfertas.FieldName) = 'RIG') then
  begin
     if (DMProyectos.QMOfertas.FieldByName('ID_S').AsInteger <> 0) then
     begin
        FMain.TraspasoDeDocumentosSalida(DMProyectos.QMOfertas.FieldByName('ID_S').AsInteger);
     end;
  end
  else
     inherited;
end;

procedure TFMProyectos.DBGOfertasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMProyectos.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AbreData(TDMLstProyectos, DMLstProyectos);
  DMLstProyectos.MostrarListado(DBEProyecto.Text, 0, 5125, DMProyectos.QMProyectosPROYECTO.AsInteger, DMProyectos.QMProyectosPROYECTO.AsInteger, 0, 32767, 0, 999999999, EncodeDate(1900, 1, 1), EncodeDate(3000, 12, 31));
  CierraData(DMLSTProyectos);
end;

procedure TFMProyectos.DBGOrdenesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'ID_ORDEN')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMProyectos.DBGOrdenesCellClick(Column: TColumn);
begin
  inherited;
  ColActualOrdenes := Column;
end;

procedure TFMProyectos.DBGOrdenesDblClick(Sender: TObject);
begin
  if (UpperCase(ColActualOrdenes.FieldName) = 'ID_ORDEN') then
  begin
     if (DMProyectos.QMOrdenes.FieldByName('ID_ORDEN').AsInteger <> 0) then
     begin
        FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DMProyectos.QMOrdenes.FieldByName('ID_ORDEN').AsInteger));
     end;
  end
  else
     inherited;
end;

procedure TFMProyectos.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('PRY', DMProyectos.QMProyectosID_P.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosProyecto.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMProyectos.DBEFAgenteChange(Sender: TObject);
begin
  inherited;
  EAgente.Text := DameTituloAgente(StrToIntDef(DBEFAgente.Text, 0));
end;

procedure TFMProyectos.NavEmpleadosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavEmpleados.SetFocus;
end;

procedure TFMProyectos.DBDEEmpleadoFechaChange(Sender: TObject);
begin
  inherited;
  LSemanaEmpleado.Caption := Format(_('Semana %d'), [WeekOfTheYear(DBDEEmpleadoFecha.Date)]);
end;

procedure TFMProyectos.TSEmpleadosShow(Sender: TObject);
begin
  inherited;
  PCEmpleados.SetFocus;
  PCEmpleados.ActivePage := TSTablaEmpleado;
  ControlEdit := CEEmpleados;
end;

procedure TFMProyectos.AAccionComercialExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ACrmAcciones);
  CrmFMAccionesCab.NuevaAccion(DMProyectos.QMProyectosPROYECTO.AsInteger, DMProyectos.QMProyectosTITULO.AsString);
end;

end.
