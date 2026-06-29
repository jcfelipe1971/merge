unit UFMAgentes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DBCtrls, UFIBDBEditfind, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UComponentesBusquedaFiltrada, URecursos, dbcgrids,
  ActnList, Buttons, rxPlacemnt, NsDBGrid, ULFDBEdit,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFPanel, ULFDBCtrlGrid,
  ULFDBMemo, ULFDBEditFind2000, ULFPageControl, ULFLabel, UG2kTBLoc,
  ULFEditFind2000, DB, idGlobalProtocols, rxToolEdit, ULFDateEdit, DateUtils,
  RXDBCtrl, ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ULFEdit;

type
  TFMAgentes = class(TFPEdit)
     LBLAgente: TLFLabel;
     DBEAgente: TLFDbedit;
     LBLTercero: TLFLabel;
     DBEFTercero: TLFDBEditFind2000;
     LBLComision: TLFLabel;
     DBEComision: TLFDbedit;
     DBECuenta: TLFDbedit;
     LBLCuenta: TLFLabel;
     DBENombreRSocial: TLFDbedit;
     DBMMNotas: TLFDBMemo;
     LBLNotas: TLFLabel;
     TSAgrupaciones: TTabSheet;
     DBCGDisponibles: TLFDBCtrlGrid;
     DBEAgCodDisp: TLFDbedit;
     DBEAgTitDisp: TLFDbedit;
     PDisponibles: TLFPanel;
     TBProv: TLFToolBar;
     PNLCabProveedores: TLFPanel;
     DBAGeTit: TLFDbedit;
     DBEAGe: TLFDbedit;
     PPertenece: TLFPanel;
     DBCGPertenece: TLFDBCtrlGrid;
     DBEAgDentro: TLFDbedit;
     DBEAgTitDentro: TLFDbedit;
     NavAgrupSon: THYMNavigator;
     CEAgrupaciones: TControlEdit;
     CEAgrupacionesPMEdit: TPopUpTeclas;
     ALAgentes: TLFActionList;
     ANewTercero: TAction;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     SBAContaExtracto: TSpeedButton;
     MISepEnlaces: TMenuItem;
     MIVerDatosTercero: TMenuItem;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     AVisualizarListadoAgentes: TAction;
     AImprimirListadoAgentes: TAction;
     AConfAgentes: TAction;
     AConfComisionesAgentes: TAction;
     AListadoAlbaranesAgente: TAction;
     AListadoComisionesAgente: TAction;
     AConfAlbaranesAgentes: TAction;
     ToolButton1: TToolButton;
     ASep: TAction;
     TSComisiones: TTabSheet;
     TBAgeCom: TLFToolBar;
     PNLCabCom: TLFPanel;
     DBAgeTitCom: TLFDbedit;
     DBEAgeCom: TLFDbedit;
     ToolButton2: TToolButton;
     PNLPerteneceCom: TLFPanel;
     DBCGPerteneceCom: TLFDBCtrlGrid;
     DBEAgDentroCom: TLFDbedit;
     DBEAgTitDentroCom: TLFDbedit;
     DBAgComision: TLFDbedit;
     PNLDisponiblesCom: TLFPanel;
     DBCGDisponiblesCom: TLFDBCtrlGrid;
     DBEAgCodDispCom: TLFDbedit;
     DBEAgTitDispCom: TLFDbedit;
     NavComisiones: THYMNavigator;
     ToolButton3: TToolButton;
     NavAgrupSonDisp: THYMNavigator;
     CEAgrupacionesDisp: TControlEdit;
     CEAgrupacionesDispPMEdit: TPopUpTeclas;
     CEAgrupacionesCom: TControlEdit;
     CEAgrupacionesDispCom: TControlEdit;
     NavComisionesDisp: THYMNavigator;
     ToolButton4: TToolButton;
     CEAgrupacionesComPMEdit: TPopUpTeclas;
     CEAgrupacionesDispComPMEdit: TPopUpTeclas;
     TSIncidencias: TTabSheet;
     DBGIncidencias: THYTDBGrid;
     TBIncidencias: TLFToolBar;
     PNLCabIncidencias: TLFPanel;
     DBTitAgeIn: TLFDbedit;
     DBAgeIn: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     AIncidencias: TAction;
     TSMargenes: TTabSheet;
     PMargenes: TLFPanel;
     DBGDetalle: THYTDBGrid;
     TBMargenes: TLFToolBar;
     PNLMargenes: TLFPanel;
     NavMargenes: THYMNavigator;
     CEMargenes: TControlEdit;
     CEMargenPMEdit: TPopUpTeclas;
     ALstComisionesDetalladas: TAction;
     ALstPrevisionComisiones: TAction;
     PPrevision: TLFPanel;
     TBPrevision: TLFToolBar;
     NavPrevision: THYMNavigator;
     DBGPrevision: THYTDBGrid;
     CEPrevision: TControlEdit;
     CEPrevisionPMEdit: TPopUpTeclas;
     LFPPrevision: TLFPanel;
     LFLMargenAplicar: TLFLabel;
     LFLPrevisionMargen: TLFLabel;
     LFTAcciones: TLFToolBar;
     TBTraspasarPrevMarg: TToolButton;
     ATraspasoMargenes: TAction;
     TBSepMarg: TToolButton;
     LFPSeparador: TLFPanel;
     TSComunicaciones: TTabSheet;
     CEComunicaciones: TControlEdit;
     DBGComunicaciones: TDBGridFind2000;
     TBComunicaciones: TLFToolBar;
     PNLCabComunicaciones: TLFPanel;
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
     TSZonas: TTabSheet;
     TBZonas: TLFToolBar;
     PNLCabZonas: TLFPanel;
     DBEZonasTitulo: TLFDbedit;
     DBEZonasCod: TLFDbedit;
     ToolButton6: TToolButton;
     NavZonas: THYMNavigator;
     DBGFZonas: TDBGridFind2000;
     CEZonas: TControlEdit;
     CEZonasPMEdit: TPopUpTeclas;
     TSCalculoComisiones: TTabSheet;
     TBCalculoComisiones: TLFToolBar;
     PNLCabCalculoComisiones: TLFPanel;
     DBECalculoComisionesTituloAgente: TLFDbedit;
     DBECalculoComisionesAgente: TLFDbedit;
     PNLCalculoComisionFiltroFecha: TLFPanel;
     LFCategoryAction4: TLFCategoryAction;
     ARecalcularComisiones: TAction;
     NavCalculoComisiones: THYMNavigator;
     LDFechaCalculoComisiones: TLFLabel;
     LHFechaCalculoComisiones: TLFLabel;
     DEDFechaCalculoComisiones: TLFDateEdit;
     DEHFechaCalculoComisiones: TLFDateEdit;
     ToolButton5: TToolButton;
     TButtRefrescarCalculoComisiones: TToolButton;
     DBGCalculoComisiones: TDBGridFind2000;
     TBSep1: TToolButton;
     TButtRecalculoCalculoComisiones: TToolButton;
     TSAgentesSub: TTabSheet;
     TBAgentesSubordinados: TLFToolBar;
     PNLCabAgentesSubordinados: TLFPanel;
     DBEAgentesSubTitulo: TLFDbedit;
     DBEAgentesSubCod: TLFDbedit;
     ToolButton8: TToolButton;
     NavAgentesSub: THYMNavigator;
     DBGAgenteSub: TDBGridFind2000;
     LFCategoryAction5: TLFCategoryAction;
     AAdjuntosAgente: TAction;
     AAdjuntosTercero: TAction;
     TSComisionesArt: TTabSheet;
     DBCGDisponiblesComArt: TLFDBCtrlGrid;
     DBEAgCodDispComArt: TLFDbedit;
     DBEAgTitDispComArt: TLFDbedit;
     PNLDisponiblesComArt: TLFPanel;
     DBCGPerteneceComArt: TLFDBCtrlGrid;
     DBEAgDentroComArt: TLFDbedit;
     DBEAgTitDentroComArt: TLFDbedit;
     DBAgComisionArt: TLFDbedit;
     PNLPerteneceComArt: TLFPanel;
     TBAgeComArt: TLFToolBar;
     PNLCabComArt: TLFPanel;
     DBAgeTitComAArt: TLFDbedit;
     DBEAgeComArt: TLFDbedit;
     ToolButton11: TToolButton;
     NavComisionesArt: THYMNavigator;
     ToolButton12: TToolButton;
     NavComisionesDispArt: THYMNavigator;
     CEAgrupacionsComArt: TControlEdit;
     CEAgrupacionsComArtPMEdit: TPopUpTeclas;
     CEAgrupacionesDispComArt: TControlEdit;
     CEAgrupacionesDispComArtPMEdit: TPopUpTeclas;
     DBEMotivoBaja: TLFDbedit;
     DBCHKBaja: TLFDBCheckBox;
     DBDTPFechaBaja: TLFDBDateEdit;
     ToolButton13: TToolButton;
     TButtImprimirNotas: TToolButton;
     AImprimirNotas: TAction;
     chLinea: TRadioButton;
     chFactura: TRadioButton;
     DBGCalculoComisionesAgrupado: TDBGridFind2000;
     ALstComisionesResumen: TAction;
     ARefrescarComisiones: TAction;
     DBCBCopiaDeCorreoOfertaCliente: TLFDBCheckBox;
     DBCBCopiaDeCorreoPedidoCliente: TLFDBCheckBox;
     DBCBCopiaDeCorreoAlbaranCliente: TLFDBCheckBox;
     DBCBCopiaDeCorreoFacturaCliente: TLFDBCheckBox;
     Splitter1: TSplitter;
     DBMMDatosIncidencia: TLFDBMemo;
     LFechaAlta: TLFLabel;
     DBEFechaAlta: TLFDbedit;
     TBBloqueaComisiones: TToolButton;
     TBDesbloqueaComisiones: TToolButton;
     ABloqueaComisiones: TAction;
     ADesbloqueaComisiones: TAction;
     BDecrementeMes: TButton;
     BIncrementaMes: TButton;
     ToolButton7: TToolButton;
     TBPagarComisiones: TToolButton;
     TBDesPagarComisiones: TToolButton;
     AContaExtracto: TAction;
     DBEFCuentaPago: TLFDBEditFind2000;
     ETitCuentaPago: TLFEdit;
     LBLCuentaPago: TLFLabel;
     CECalculoComisiones: TControlEdit;
     CECalculoComisionesPMEdit: TPopUpTeclas;
     PMCalculoComisiones: TPopupMenu;
     MIPPRecalcularComisiones: TMenuItem;
     ARecalcularComisionesTodos: TAction;
     MIPPRecalcularComisionesTodos: TMenuItem;
     DBECodigoNTV: TLFDbedit;
     LCodigoNTV: TLFLabel;
     EFiltroAgrupacion: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttCompClick(Sender: TObject);
     procedure MuestraFiltrado(Tipo: byte);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBCGDisponiblesDblClick(Sender: TObject);
     procedure DBCGPerteneceDblClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ANewTerceroExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AATerceroExecute(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure DBENombreRSocialEnter(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure AVisualizarListadoAgentesExecute(Sender: TObject);
     procedure AImprimirListadoAgentesExecute(Sender: TObject);
     procedure AConfAgentesExecute(Sender: TObject);
     procedure AConfComisionesAgentesExecute(Sender: TObject);
     procedure AListadoAlbaranesAgenteExecute(Sender: TObject);
     procedure AListadoComisionesAgenteExecute(Sender: TObject);
     procedure AConfAlbaranesAgentesExecute(Sender: TObject);
     procedure DBCGDisponiblesComDblClick(Sender: TObject);
     procedure DBCGPerteneceComDblClick(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGIncidenciasDblClick(Sender: TObject);
     procedure AIncidenciasExecute(Sender: TObject);
     procedure DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure NavMargenesClick(Sender: TObject; Button: TNavigateBtn);
     procedure ALstComisionesDetalladasExecute(Sender: TObject);
     procedure ALstPrevisionComisionesExecute(Sender: TObject);
     procedure TSMargenesShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure NavPrevisionClick(Sender: TObject; Button: TNavigateBtn);
     procedure ATraspasoMargenesExecute(Sender: TObject);
     procedure TSComunicacionesShow(Sender: TObject);
     procedure TSComunicacionesHide(Sender: TObject);
     procedure EFComunicacionesBusquedaBusqueda(Sender: TObject);
     procedure EFComunicacionesBusquedaChange(Sender: TObject);
     procedure DBGComunicacionesCellClick(Column: TColumn);
     procedure DBGComunicacionesDblClick(Sender: TObject);
     procedure DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavComunicacionesChangeState(Sender: TObject);
     procedure AEnviarComunicacionXMailExecute(Sender: TObject);
     procedure AImportarArchivoComunicacionExecute(Sender: TObject);
     procedure PMPlantillasComunicacionesItemOnClick(Sender: TObject);
     procedure TSZonasShow(Sender: TObject);
     procedure TSZonasHide(Sender: TObject);
     procedure TSCalculoComisionesHide(Sender: TObject);
     procedure TSCalculoComisionesShow(Sender: TObject);
     procedure ARefrescarComisionesExecute(Sender: TObject);
     procedure DEDFechaCalculoComisionesChange(Sender: TObject);
     procedure DEHFechaCalculoComisionesChange(Sender: TObject);
     procedure ARecalcularComisionesExecute(Sender: TObject);
     procedure AAdjuntosAgenteExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure DBCGDisponiblesComArtDblClick(Sender: TObject);
     procedure DBCGPerteneceComArtDblClick(Sender: TObject);
     procedure DBCHKBajaChange(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure chLineaClick(Sender: TObject);
     procedure chFacturaClick(Sender: TObject);
     procedure ALstComisionesResumenExecute(Sender: TObject);
     procedure DBGCalculoComisionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGCalculoComisionesAgrupadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGCalculoComisionesDblClick(Sender: TObject);
     procedure DBGCalculoComisionesAgrupadoDblClick(Sender: TObject);
     procedure TSAgrupacionesShow(Sender: TObject);
     procedure TSComisionesShow(Sender: TObject);
     procedure TSComisionesArtShow(Sender: TObject);
     procedure ABloqueaComisionesExecute(Sender: TObject);
     procedure ADesbloqueaComisionesExecute(Sender: TObject);
     procedure BDecrementeMesClick(Sender: TObject);
     procedure BIncrementaMesClick(Sender: TObject);
     procedure DBGCalculoComisionesCellClick(Column: TColumn);
     procedure DBGCalculoComisionesAgrupadoCellClick(Column: TColumn);
     procedure TBPagarComisionesClick(Sender: TObject);
     procedure TBDesPagarComisionesClick(Sender: TObject);
     procedure SBAContaExtractoDblClick(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure DBEFCuentaPagoChange(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure ARecalcularComisionesTodosExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFiltroAgrupacionChange(Sender: TObject);
     procedure TSAgrupacionesResize(Sender: TObject);
     procedure TSComisionesResize(Sender: TObject);
     procedure TSComisionesArtResize(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
     procedure HabilitaEnlaces;
  public
     { Public declarations }
     SWFil, SWEnlace: integer;
     procedure Tercero_a_Agente(Tercero: integer);
     procedure FiltraAgentes(Filtro: string);
  end;

var
  FMAgentes : TFMAgentes;

implementation

uses UDMAgentes, UFormGest, UDMMain, UEntorno,
  UFPregComisiones, UFPregLstAgentes, UDMLstComisiones, UFMListConfig,
  UFMain, UFMTerceros, UUtiles, UDMLstAgente, UFMIncidencias, UFpregVentasAgente,
  UFSendCorreo, UDMListados, UFMAdjunto, Variants, UFMSeleccion,
  ShellApi, URecibeFicheros, UDMAdjunto, UDameDato;

{$R *.DFM}

procedure TFMAgentes.FormCreate(Sender: TObject);
var
  DirectorioBaseComunicaciones : string;
  sr : TSearchRec;
  Item : TMenuItem;
  SL : TStringList;
  i : integer;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreDataVarias(TDMAgentes, DMAgentes, Self);
  Campo := DMAgentes.QMAgentesAGENTE;
  HabilitarPunto;
  NavMain.DataSource := DMAgentes.DSQMAgentes;
  EPMain.DataSource := DMAgentes.DSQMAgentes;
  DBGMain.DataSource := DMAgentes.DSQMAgentes;
  DBECuenta.MaxLength := REntorno.DigitosSub;
  CEMainPMEdit.Teclas := DMMain.teclas;
  G2KTableLoc.DataSource := DMAgentes.DSQMAgentes;
  SWFil := 0;
  SWEnlace := 0;
  HabilitaEnlaces;
  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];

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
  DirectorioBaseComunicaciones := DirectorioBaseComunicaciones + '\AGE';
  if (not DirectoryExists(DirectorioBaseComunicaciones)) then
     CreateDir(DirectorioBaseComunicaciones); {Creo directorios si no existen}

  DMAgentes.PlantillaComunicaciones := '';
  with PMPlantillasComunicaciones do
  begin
     SL := TStringList.Create;
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
     SL.Free;
  end;

  // Inicializa Desde y Hasta fecha de calculo de comisiones - 1 a 31 del mes actual
  DEDFechaCalculoComisiones.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  DEHFechaCalculoComisiones.Date := EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(DEDFechaCalculoComisiones.Date));

  ARecalcularComisiones.Enabled := False;
  ARefrescarComisiones.Enabled := False;
  ABloqueaComisiones.Enabled := False;
  ADesbloqueaComisiones.Enabled := False;

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

  DBCHKBajaChange(Sender);

  // Así se ven ambos grids, no se solapan cuando los vemos en diseño
  DBGCalculoComisiones.Align := alClient;
  DBGCalculoComisionesAgrupado.Align := alClient;
end;

procedure TFMAgentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DeshabilitarPunto;
end;

procedure TFMAgentes.TbuttCompClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMAgentes.MuestraFiltrado(Tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMAgentes.QMAgentes.SelectSQL);
     AbreData(TDMlstComisiones, DMLstComisiones);
     with DMLstComisiones do
     begin
        TempSql.AddStrings(QMAgentesCuentas.SelectSQL);
        QMAgentesCuentas.Close;
        QMAgentesCuentas.SelectSQL.Assign(SqlFiltro);
        MuestraFiltrado(Tipo);
        QMAgentesCuentas.Close;
        QMAgentesCuentas.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMLstComisiones);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFMAgentes.FiltraAgentes(Filtro: string);
var { Filtra por Agentes }
  Parametro : TParametroFiltrado;
begin
  PCMain.ActivePage := TSFicha;
  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     // Mismo SQL pero sin filtrar EJERCICIO
     // Parametro.SQLBase.Text := DMAgentes.SQLBase.Text;
     Parametro.SQLBase.Add(' SELECT * FROM VER_AGENTES_CUENTAS ');
     Parametro.SQLBase.Add(' WHERE ');
     Parametro.SQLBase.Add(' EMPRESA = ?EMPRESA AND ');
     Parametro.SQLBase.Add(' CANAL = ?CANAL ');
     Parametro.SQLBase.Add(' ORDER BY AGENTE ');
     Parametro.Tabla := DMAgentes.QMAgentes;
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
end;

procedure TFMAgentes.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbEdit) then
  begin
     NavMain.EditaControl := DBEComision;
     DBEFTercero.Enabled := False;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorInfo(DBEFTercero);
  end
  else
  begin
     NavMain.EditaControl := DBEFTercero;
     DBEFTercero.Enabled := True;
     DBEFTercero.ReadOnly := not DBEFTercero.Enabled;
     ColorEdicion(DBEFTercero);
  end;

  if (Button = nbInsert) then
  begin
     DBEAgente.Enabled := True;
     DBEAgente.ReadOnly := not DBEAgente.Enabled;
     ColorEdicion(DBEAgente);
  end
  else
  begin
     DBEAgente.Enabled := False;
     DBEAgente.ReadOnly := not DBEAgente.Enabled;
     ColorCampoID(DBEAgente);
  end;
end;

procedure TFMAgentes.Tercero_a_Agente(Tercero: integer);
begin
  DMAgentes.CambiarTercero(Tercero);
end;

procedure TFMAgentes.DBCGDisponiblesDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then
     DMAgentes.AgrupacionRellena;
end;

procedure TFMAgentes.DBCGPerteneceDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then
     DMAgentes.AgrupacionVacia;
end;

procedure TFMAgentes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  i : integer;
  esta : boolean;
begin
  inherited;

  if FMain.sourcecallAge = True then
  begin
     FMain.sourcecallAge := False;
     Close;
  end
  else
  if FMain.autagente then
  begin
     esta := False;
     with Application do
        for i := 0 to (ComponentCount - 1) do
           if (('T' + Components[i].Name) = TFMTerceros.ClassName) then
              esta := True;

     if esta then
        FMTerceros.CierraAgente
     else
     begin
        FMain.autagente := False;
        Close;
     end;
  end;
end;

procedure TFMAgentes.DBECuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBECuenta);
end;

procedure TFMAgentes.HabilitarPunto;
begin
  FMain.AddComponentePunto(DBECuenta);
end;

procedure TFMAgentes.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(DBECuenta);
end;

procedure TFMAgentes.ANewTerceroExecute(Sender: TObject);
var
  // aSourceCallTer : boolean;
  aEnlaceModal : boolean;
  aEnlaceInstancias : boolean;
  aEnlaceCrea : boolean;
begin
  if EstructuraCreada then
  begin
     // aSourceCallTer := FMain.SourceCallTer;
     aEnlaceModal := FMain.EnlaceModal;
     aEnlaceInstancias := FMain.EnlaceInstancias;
     aEnlaceCrea := FMain.EnlaceCrea;

     FMain.SourceCallTer := True;
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.ATerceros);

     if FMain.EnlaceDatos <> Null then
        DBEFTercero.SetBufferText(FMain.EnlaceDatos);

     DBEComision.SetFocus;

     FMain.EnlaceModal := aEnlaceModal;
     FMain.EnlaceInstancias := aEnlaceInstancias;
     FMain.EnlaceCrea := aEnlaceCrea;
  end;
end;

procedure TFMAgentes.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  inherited;
  Resultado := DMAgentes.BusquedaCompleja;
  if (Resultado in [mrOk, mrAll]) then
  begin
     SWFil := 1;
     SWEnlace := 0;
  end;
  // Continua := False;
end;

procedure TFMAgentes.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if DBEFTercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBEFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DMAgentes.QMAgentesTERCERO.AsInteger));
end;

procedure TFMAgentes.SBATerceroDblClick(Sender: TObject);
begin
  AATercero.Execute;
end;

procedure TFMAgentes.HabilitaEnlaces;
begin
  if (FMain.ATerceros.Enabled = False) then
  begin
     DBEFTercero.Accion := nil;
     SBATercero.Width := 0;
     MIVerDatosTercero.Visible := False;
     MISepEnlaces.Visible := False;
     DBENombreRSocial.Color := clInfoBk;
     TbuttComp.Visible := False;
     TSepTerc.Visible := False;
  end
  else
  begin
     SolapaControles(SBATercero, DBENombreRSocial);
     DBENombreRSocial.Color := REntorno.ColorEnlaceActivo;
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
end;

procedure TFMAgentes.DBENombreRSocialEnter(Sender: TObject);
begin
  if DBEFTercero.Enabled then
     DBEFTercero.SetFocus
  else
     DBEComision.SetFocus;
end;

procedure TFMAgentes.FormActivate(Sender: TObject);
begin
  inherited;
  if FMain.EnlaceCrea then
     Tercero_a_Agente(DMMain.MinTercero);

  // Deshabilito para que funcione el doble click sobre estos campos para asignar agrupacion
  DBEAgDentro.Enabled := False;
  DBEAgTitDentro.Enabled := False;
  DBEAgCodDisp.Enabled := False;
  DBEAgTitDisp.Enabled := False;
end;

procedure TFMAgentes.AVisualizarListadoAgentesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMAgentes.AImprimirListadoAgentesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMAgentes.AConfAgentesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstComisiones, DMLstComisiones);
  TFMListConfig.Create(Self).Muestra(13, formato, cabecera, copias,
     pijama, '', DMLstComisiones.frLstComisiones);
  CierraData(DMLstComisiones);
end;

procedure TFMAgentes.AConfComisionesAgentesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstComisiones, DMLstComisiones);
  TFMListConfig.Create(Self).Muestra(15, formato, cabecera, copias,
     pijama, '', DMLstComisiones.frLstComisiones);
  CierraData(DMLstComisiones);
end;

procedure TFMAgentes.AListadoAlbaranesAgenteExecute(Sender: TObject);
begin
  inherited;
  TFPregLstAgentes.Create(Self).ShowModal;
end;

procedure TFMAgentes.AListadoComisionesAgenteExecute(Sender: TObject);
begin
  inherited;
  TFPregComisiones.Create(Self).ShowModal;
end;

procedure TFMAgentes.AConfAlbaranesAgentesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLSTAgente, DMLSTAgente);
  TFMListConfig.Create(Self).Muestra(120, Formato, Cabecera, Copias,
     Pijama, '', DMLSTAgente.frAgente);
  CierraData(DMLSTAgente);
end;

procedure TFMAgentes.DBCGDisponiblesComDblClick(Sender: TObject);
begin
  inherited;
  DMAgentes.AgrupacionRellenaCom('C');
end;

procedure TFMAgentes.DBCGPerteneceComDblClick(Sender: TObject);
begin
  inherited;
  DMAgentes.AgrupacionVaciaCom('C');
end;

procedure TFMAgentes.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbCancel) then
     NavMain.SetFocus;
end;

procedure TFMAgentes.DBGIncidenciasDblClick(Sender: TObject);
begin
  with DMAgentes do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMAgentesAGENTE.AsInteger,
        QMAgentesTERCERO.AsInteger, 3, xIncidenciasINCIDENCIA.AsInteger, 1);
  end;
end;

procedure TFMAgentes.AIncidenciasExecute(Sender: TObject);
begin
  with DMAgentes do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMAgentesAGENTE.AsInteger,
        QMAgentesTERCERO.AsInteger, 3, 0, 1);
  end;
end;

procedure TFMAgentes.DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMAgentes.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
        CeldaEnlace(DBGIncidencias, Rect);
  end;
end;

procedure TFMAgentes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMAgentes.QuitaFiltros;
  G2KTableLoc.Click;
  if (PCMain.ActivePage = TSCalculoComisiones) then
     TSCalculoComisionesShow(Sender);
end;

procedure TFMAgentes.ALstComisionesDetalladasExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasAgente.Create(Self).SeleccionarModo(0);
end;

procedure TFMAgentes.ALstPrevisionComisionesExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasAgente.Create(Self).SeleccionarModo(1);
end;

procedure TFMAgentes.ALstComisionesResumenExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasAgente.Create(Self).SeleccionarModo(2);
end;

procedure TFMAgentes.TSMargenesShow(Sender: TObject);
begin
  DMAgentes.AbrirMargenes;
  ControlEdit := CEMargenes;
end;

procedure TFMAgentes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  if ((Sender as TPageControl).ActivePage = TSMargenes) then
     DMAgentes.CerrarMargenes;
  if ((Sender as TPageControl).ActivePage = TSCalculoComisiones) then
  begin
     ARecalcularComisiones.Enabled := False;
     ARefrescarComisiones.Enabled := False;
     DMAgentes.CerrarCalculoComisiones;
  end;
end;

procedure TFMAgentes.NavPrevisionClick(Sender: TObject; Button: TNavigateBtn);
var
  index : smallint;
begin
  index := EncuentraField(DBGDetalle, 'MARGEN');
  if (index > 0) then
  begin
     if (Button = nbInsert) then
     begin
        DBGPrevision.Columns[index].ReadOnly := False;
        DBGPrevision.Columns[index].Font.Color := clWindowText;
        DBGPrevision.Columns[index].Color := clWindow;
     end
     else
     begin
        DBGPrevision.Columns[index].ReadOnly := True;
        DBGPrevision.Columns[index].Color := clInfoBk;
        DBGPrevision.Columns[index].Font.Color := clGrayText;
     end;
  end;
end;

procedure TFMAgentes.NavMargenesClick(Sender: TObject; Button: TNavigateBtn);
var
  index : smallint;
begin
  index := EncuentraField(DBGPrevision, 'MARGEN');
  if (index > 0) then
  begin
     if (Button = nbInsert) then
     begin
        DBGDetalle.Columns[index].ReadOnly := False;
        DBGDetalle.Columns[index].Font.Color := clWindowText;
        DBGDetalle.Columns[index].Color := clWindow;
     end
     else
     begin
        DBGDetalle.Columns[index].ReadOnly := True;
        DBGDetalle.Columns[index].Color := clInfoBk;
        DBGDetalle.Columns[index].Font.Color := clGrayText;
     end;
  end;
end;

procedure TFMAgentes.ATraspasoMargenesExecute(Sender: TObject);
begin
  DMAgentes.TraspasarPrevMargenes;
end;

procedure TFMAgentes.TSComunicacionesShow(Sender: TObject);
begin
  inherited;
  DMAgentes.xComunicaciones.Open;
end;

procedure TFMAgentes.TSComunicacionesHide(Sender: TObject);
begin
  inherited;
  DMAgentes.xComunicaciones.Close;
end;

procedure TFMAgentes.EFComunicacionesBusquedaBusqueda(Sender: TObject);
begin
  inherited;
  EFComunicacionesBusqueda.CondicionBusqueda := 'TIPO=''AGE'' AND COD_CLI_PRO=' + DMAgentes.QMAgentesAGENTE.AsString;
end;

procedure TFMAgentes.EFComunicacionesBusquedaChange(Sender: TObject);
begin
  inherited;
  Posicionar(DMAgentes.xComunicaciones, 'ID', StrToIntDef(EFComunicacionesBusqueda.Text, 0));
end;

procedure TFMAgentes.DBGComunicacionesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMAgentes.DBGComunicacionesDblClick(Sender: TObject);
begin
  inherited;
  with DMAgentes.xComunicaciones do
  begin
     if ((RecordCount > 0) and (State = dsBrowse)) then
     begin
        Edit;
        DMAgentes.xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
        Post;
        if (UpperCase(ColActual.FieldName) = 'ARCHIVO') then
           AbreWord(DMMain.DameDirectorioCodCliPro('AGE', DMAgentes.xComunicacionesCOD_CLI_PRO.AsInteger) + DMAgentes.xComunicacionesARCHIVO.AsString);
     end;
  end;
end;

procedure TFMAgentes.DBGComunicacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (DMAgentes.xComunicaciones.RecordCount > 0) then
     if (UpperCase(Column.FieldName) = 'ARCHIVO') then
        CeldaEnlace(DBGComunicaciones, Rect);
end;

procedure TFMAgentes.NavComunicacionesChangeState(Sender: TObject);
begin
  inherited;
  with DBGComunicaciones do
  begin
     ColumnaInicial := 0;
     while ((ColumnaInicial <= Columns.Count - 1) and (Columns[ColumnaInicial].FieldName = 'DESCRIPCION')) do
        ColumnaInicial := ColumnaInicial + 1;
  end;
end;

procedure TFMAgentes.AEnviarComunicacionXMailExecute(Sender: TObject);
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

           Subject := DMAgentes.xComunicacionesDESCRIPCION.AsString;

           CuerpoMail := TStringList.Create;
           CuerpoMail.Add(_('Este correo ha sido enviado desde :'));
           CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
           CuerpoMail.Add('');
           CuerpoMail.Add(Format(_('y contiene el fichero adjunto %s'), [UpperCase(DMAgentes.xComunicacionesARCHIVO.AsString)]));
           CuerpoMail.Add('------------------------------------------------------------');
           CuerpoMail.Add('This is an automatic message send from :');
           CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
           CuerpoMail.Add('');
           CuerpoMail.Add('We attached the file ' + UpperCase(DMAgentes.xComunicacionesARCHIVO.AsString));

           FSendCorreo.Texto(_('Enviando Mensaje  ...'));

           DMListados.SendMailClientePDF(DMAgentes.xComunicacionesCOD_CLI_PRO.AsInteger, CuerpoMail,
              DMMain.DameDirectorioCodCliPro('AGE', DMAgentes.xComunicacionesCOD_CLI_PRO.AsInteger) + DMAgentes.xComunicacionesARCHIVO.AsString, DMAgentes.xComunicacionesARCHIVO.AsString, Subject, 'AGE', DameIDAgente(DMAgentes.QMAgentesAGENTE.AsInteger));

           CuerpoMail.Free;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

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
end;

procedure TFMAgentes.AImportarArchivoComunicacionExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'PDF,DOC,XLS,ODT,ODS,TXT', '', 'FMAgentes-ImportarArchivoComunicacion') then
  begin
     if CopyFileTo(Archivo, DMMain.DameDirectorioCodCliPro('AGE', DMAgentes.QMAgentesAGENTE.AsInteger) + ExtractFileName(Archivo)) then
     begin
        with DMAgentes.xComunicaciones do
        begin
           if (State = dsBrowse) then
           begin
              Insert;
              DMAgentes.xComunicacionesARCHIVO.AsString := ExtractFileName(Archivo);
              DBGComunicaciones.SetFocus;
              // Post;
           end;
        end;
     end;
  end;
end;

procedure TFMAgentes.PMPlantillasComunicacionesItemOnClick(Sender: TObject);
begin
  DMAgentes.PlantillaComunicaciones := TMenuItem(Sender).Caption;
  with DMAgentes.xComunicaciones do
  begin
     if (State = dsBrowse) then
     begin
        Insert;
        DBGComunicaciones.SetFocus;
     end;
  end;
end;

procedure TFMAgentes.TSZonasShow(Sender: TObject);
begin
  inherited;
  DMAgentes.QMZonas.Open;
end;

procedure TFMAgentes.TSZonasHide(Sender: TObject);
begin
  inherited;
  DMAgentes.QMZonas.Close;
end;

procedure TFMAgentes.TSCalculoComisionesHide(Sender: TObject);
begin
  inherited;
  DMAgentes.CerrarCalculoComisiones;
end;

procedure TFMAgentes.TSCalculoComisionesShow(Sender: TObject);
begin
  inherited;
  ARecalcularComisiones.Enabled := True;
  ARefrescarComisiones.Enabled := True;
  ABloqueaComisiones.Enabled := (chLinea.Checked = True);
  ADesbloqueaComisiones.Enabled := (chLinea.Checked = True);

  ARefrescarComisiones.Execute;
end;

procedure TFMAgentes.ARefrescarComisionesExecute(Sender: TObject);
begin
  inherited;
  DMAgentes.AbrirCalculoComisiones(DEDFechaCalculoComisiones.Date, DEHFechaCalculoComisiones.Date);
end;

procedure TFMAgentes.DEDFechaCalculoComisionesChange(Sender: TObject);
begin
  inherited;
  ARefrescarComisiones.Execute;
end;

procedure TFMAgentes.DEHFechaCalculoComisionesChange(Sender: TObject);
begin
  inherited;
  ARefrescarComisiones.Execute;
end;

procedure TFMAgentes.ARecalcularComisionesExecute(Sender: TObject);
begin
  inherited;
  DMAgentes.CerrarCalculoComisiones;
  DMAgentes.RecalcularComisiones(DMAgentes.QMAgentesAGENTE.AsInteger);
  DMAgentes.AbrirCalculoComisiones(DEDFechaCalculoComisiones.Date, DEHFechaCalculoComisiones.Date);
end;

procedure TFMAgentes.ARecalcularComisionesTodosExecute(Sender: TObject);
begin
  inherited;
  DMAgentes.CerrarCalculoComisiones;
  DMAgentes.RecalcularComisiones(0);
  DMAgentes.AbrirCalculoComisiones(DEDFechaCalculoComisiones.Date, DEHFechaCalculoComisiones.Date);
end;

procedure TFMAgentes.AAdjuntosAgenteExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('AGE', DameIDAgente(DMAgentes.QMAgentesAGENTE.AsInteger));
end;

procedure TFMAgentes.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMAgentes.QMAgentesTERCERO.AsInteger);
end;

procedure TFMAgentes.DBCGDisponiblesComArtDblClick(Sender: TObject);
begin
  inherited;
  DMAgentes.AgrupacionRellenaCom('T'); //sfg.albert
end;

procedure TFMAgentes.DBCGPerteneceComArtDblClick(Sender: TObject);
begin
  inherited;
  DMAgentes.AgrupacionVaciaCom('T'); //sfg.albert
end;

procedure TFMAgentes.DBCHKBajaChange(Sender: TObject);
begin
  inherited;
  DBDTPFechaBaja.Visible := DBCHKBaja.Checked;
  DBEMotivoBaja.Visible := DBCHKBaja.Checked;
end;

procedure TFMAgentes.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del agente %d - %s'), [DMAgentes.QMAgentesAGENTE.AsInteger, DMAgentes.QMAgentesTITULO.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMMNotas.Lines);
     s.Add('----------------------------------------------------------------------');
     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMAgentes.chLineaClick(Sender: TObject);
begin
  inherited;
  DBGCalculoComisiones.Visible := True;
  NavCalculoComisiones.DataSource := DMAgentes.DSCalculoComisiones;
  DBGCalculoComisionesAgrupado.Visible := False;
  ABloqueaComisiones.Enabled := True;
  ADesbloqueaComisiones.Enabled := True;
end;

procedure TFMAgentes.chFacturaClick(Sender: TObject);
begin
  inherited;
  DBGCalculoComisiones.Visible := False;
  DBGCalculoComisionesAgrupado.Visible := True;
  NavCalculoComisiones.DataSource := DMAgentes.DSCalculoComisionesAgrupado;
  ABloqueaComisiones.Enabled := False;
  ADesbloqueaComisiones.Enabled := False;
end;

procedure TFMAgentes.DBGCalculoComisionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'EJERCICIO_FAC') or (UpperCase(Column.FieldName) = 'SERIE_FAC') or (UpperCase(Column.FieldName) = 'RIG_FAC') or (UpperCase(Column.FieldName) = 'LINEA_FAC') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMAgentes.DBGCalculoComisionesAgrupadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'EJERCICIO_FAC') or (UpperCase(Column.FieldName) = 'SERIE_FAC') or (UpperCase(Column.FieldName) = 'RIG_FAC')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

procedure TFMAgentes.DBGCalculoComisionesDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO_FAC') or
     (UpperCase(ColActual.FieldName) = 'SERIE_FAC') or
     (UpperCase(ColActual.FieldName) = 'RIG_FAC') or
     (UpperCase(ColActual.FieldName) = 'LINEA_FAC')) then
     FMain.TraspasoDeDocumentosSalida(DMAgentes.QMCalculoComisionesID_S.AsInteger);

  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     if EstructuraCreada then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMAgentes.QMCalculoComisionesARTICULO.AsString + '''');
end;

procedure TFMAgentes.DBGCalculoComisionesAgrupadoDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO_FAC') or
     (UpperCase(ColActual.FieldName) = 'SERIE_FAC') or
     (UpperCase(ColActual.FieldName) = 'RIG_FAC') or
     (UpperCase(ColActual.FieldName) = 'LINEA_FAC')) then
     FMain.TraspasoDeDocumentosSalida(DMAgentes.QMCalculoComisionesAgrupadoID_S.AsInteger);
end;

procedure TFMAgentes.TSAgrupacionesShow(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMAgentes.TSComisionesShow(Sender: TObject);
begin
  inherited;
  DBCGPerteneceCom.PanelHeight := 26;
  DBCGDisponiblesCom.RowCount := DBCGDisponiblesCom.Height div 26;
end;

procedure TFMAgentes.TSComisionesArtShow(Sender: TObject);
begin
  inherited;
  DBCGPerteneceComArt.PanelHeight := 26;
  DBCGDisponiblesComArt.RowCount := DBCGDisponiblesComArt.Height div 26;
end;

procedure TFMAgentes.ABloqueaComisionesExecute(Sender: TObject);
begin
  inherited;
  if (ConfirmaMensaje(_('Esta seguro de que desea bloquear todas las lineas de comision?'))) then
     DMAgentes.EstableceBloqueoComisiones(True);
end;

procedure TFMAgentes.ADesbloqueaComisionesExecute(Sender: TObject);
begin
  inherited;
  if (ConfirmaMensaje(_('Esta seguro de que desea desbloquear todas las lineas de comision?'))) then
     DMAgentes.EstableceBloqueoComisiones(False);
end;

procedure TFMAgentes.BDecrementeMesClick(Sender: TObject);
var
  Mes : integer;
begin
  inherited;
  Mes := MonthOf(DEDFechaCalculoComisiones.Date);
  if (Mes > 1) then
     Mes := Mes - 1;

  DEDFechaCalculoComisiones.Date := EncodeDate(YearOf(Now), Mes, 1);
  DEHFechaCalculoComisiones.Date := EncodeDate(YearOf(Now), Mes, DaysInMonth(DEDFechaCalculoComisiones.Date));
end;

procedure TFMAgentes.BIncrementaMesClick(Sender: TObject);
var
  Mes : integer;
begin
  inherited;
  Mes := MonthOf(DEDFechaCalculoComisiones.Date);
  if (Mes < 12) then
     Mes := Mes + 1;

  DEDFechaCalculoComisiones.Date := EncodeDate(YearOf(Now), Mes, 1);
  DEHFechaCalculoComisiones.Date := EncodeDate(YearOf(Now), Mes, DaysInMonth(DEDFechaCalculoComisiones.Date));
end;

procedure TFMAgentes.DBGCalculoComisionesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMAgentes.DBGCalculoComisionesAgrupadoCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

// Marcar lineas como pagada comision segun la fecha seleccionada
procedure TFMAgentes.TBPagarComisionesClick(Sender: TObject);
var
  Fecha : TDateTime;
begin
  Fecha := Today;
  if (UFMSeleccion.PideDato('DAT', Fecha, 'Fecha de Pago')) then
  begin
     DMAgentes.MarcaComisionesPagado(Fecha, True);
  end;
end;

// Quitar Marca y Fecha de Pagado a las lineas 
procedure TFMAgentes.TBDesPagarComisionesClick(Sender: TObject);
begin
  if (ConfirmaMensaje(_('Esta seguro de que desea quitar la marca Pagado a las lineas de comision?'))) then
  begin
     DMAgentes.MarcaComisionesPagado(Today, False);
  end;
end;

procedure TFMAgentes.SBAContaExtractoDblClick(Sender: TObject);
begin
  inherited;
  AContaExtracto.Execute;
end;

procedure TFMAgentes.AContaExtractoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AContaExtracto, DBECuenta.Text);
end;

procedure TFMAgentes.DBEFCuentaPagoChange(Sender: TObject);
begin
  inherited;
  ETitCuentaPago.Text := DameTituloCuenta(DBEFCuentaPago.Text);
end;

procedure TFMAgentes.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('AGE', DameIDAgente(DMAgentes.QMAgentesAGENTE.AsInteger), Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosAgente.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMAgentes.FormShow(Sender: TObject);
begin
  inherited;
  ColorCampoID(DBEAgente);
end;

procedure TFMAgentes.EFiltroAgrupacionChange(Sender: TObject);
begin
  inherited;
  DMAgentes.FiltraAgrupacionDisponible(EFiltroAgrupacion.Text);
end;

procedure TFMAgentes.TSAgrupacionesResize(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TFMAgentes.TSComisionesResize(Sender: TObject);
begin
  inherited;
  DBCGPerteneceCom.PanelHeight := 26;
  DBCGDisponiblesCom.RowCount := DBCGDisponiblesCom.Height div 26;
end;

procedure TFMAgentes.TSComisionesArtResize(Sender: TObject);
begin
  inherited;
  DBCGPerteneceComArt.PanelHeight := 26;
  DBCGDisponiblesComArt.RowCount := DBCGDisponiblesComArt.Height div 26;
end;

end.
