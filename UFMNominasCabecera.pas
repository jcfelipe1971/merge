unit UFMNominasCabecera;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  ULFDBEdit, DBCtrls, ULFDBEditFind2000, StdCtrls, ULFLabel, Mask,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, UHYDescription, ULFHYDBDescription, Buttons, UFPEdit,
  ULFEditFind2000, ULFEdit;

type
  TFMNominasCabecera = class(TFPEdit)
     LFechaAlta: TLFLabel;
     LEmpleado: TLFLabel;
     DBEFEmpleado: TLFDBEditFind2000;
     LFCategoryAction1: TLFCategoryAction;
     DBDEDesde: TLFDBDateEdit;
     DBDEFecha: TLFDBDateEdit;
     DBDEFechaCobro: TLFDBDateEdit;
     DBDEHasta: TLFDBDateEdit;
     LDesdeFecha: TLFLabel;
     LFechaCobro: TLFLabel;
     LDias: TLFLabel;
     LNIF: TLFLabel;
     LNroSeguridadSocial: TLFLabel;
     LCategoria: TLFLabel;
     LSeccion: TLFLabel;
     DBDEechaAntiguedad: TLFDBDateEdit;
     LFechaAntiguedad: TLFLabel;
     DBENIF: TLFDbedit;
     DBENroSeguridadSocial: TLFDbedit;
     DBECategoria: TLFDbedit;
     DBESeccion: TLFDbedit;
     LHastaFecha: TLFLabel;
     TSOtros: TTabSheet;
     TSNotas: TTabSheet;
     PCabNotas: TLFPanel;
     NavNotas: THYMNavigator;
     DBRENotas: TDBRichEdit;
     DBRENotasInternasKri: TDBRichEdit;
     AAdjuntoNomina: TAction;
     DBCHKListado: TLFDBCheckBox;
     DBETituloEstado: TLFDbedit;
     LEstado: TLFLabel;
     DBENombreEmpleado: TLFDbedit;
     DBEFechaAlta: TLFDbedit;
     LFecha: TLFLabel;
     LNomina: TLFLabel;
     DBID: TLFDbedit;
     AAdjuntoEmpleado: TAction;
     SBAEmpleado: TSpeedButton;
     LFCategoryAction2: TLFCategoryAction;
     ALstNominas: TAction;
     AConfLstNominas: TAction;
     PDetalle: TLFPanel;
     PCDetalle: TLFPageControl;
     TSDetalle: TTabSheet;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     PNLPie: TLFPanel;
     LTotalDevengo: TLFLabel;
     LTotalDeduccion: TLFLabel;
     LTotalAPercibir: TLFLabel;
     DBETotalPercibir: TLFDbedit;
     DBETotalDevego: TLFDbedit;
     DBETotalDeduccion: TLFDbedit;
     TBHaberes: TLFToolBar;
     NavHaberes: THYMNavigator;
     TBDetalleDescuentos: TLFToolBar;
     NavDescuentos: THYMNavigator;
     DBGFHaberes: TDBGridFind2000;
     DBGFDescuentos: TDBGridFind2000;
     PNLHaberes: TLFPanel;
     PNLDescuentos: TLFPanel;
     TSDetalleChile: TTabSheet;
     SplitterRight: TSplitter;
     PNLDetalleChile: TLFPanel;
     TBSep1: TToolButton;
     TBRecalcularNomina: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     ARecalcularNomina: TAction;
     AExportarExcel: TAction;
     TBSep3: TToolButton;
     TBSep4: TToolButton;
     TBHaberesTodos: TToolButton;
     TBHaberesNoCalculados: TToolButton;
     TBDescuentosTodos: TToolButton;
     TBDescuentosNoCalculados: TToolButton;
     PPieGenerico: TLFPanel;
     LPieTHaberes: TLFLabel;
     LPieLiquido: TLFLabel;
     DBETHaberes: TLFDbedit;
     DBELiquido: TLFDbedit;
     LPieTDescuentos: TLFLabel;
     DBETDescuentos: TLFDbedit;
     AExportarExcel2: TAction;
     ALibroRemuneraciones: TAction;
     PNLFirma: TLFPanel;
     ImgFirma: TImage;
     DBTFirmaNombre: TDBText;
     DBTNIFFirma: TDBText;
     LFirma: TLFLabel;
     PNLOtros: TLFPanel;
     TBOtros: TLFToolBar;
     TBBorrarFirma: TToolButton;
     PNLInfoOtros: TLFPanel;
     DBEOtrosNombre: TLFDbedit;
     DBEOrosIdNomina: TLFDbedit;
     DBDEOtrosFechaCab: TLFDBDateEdit;
     LFPanel1: TLFPanel;
     DBENotasNombre: TLFDbedit;
     DBENotasIdNomina: TLFDbedit;
     DBDENotasFecha: TLFDBDateEdit;
     LOtrosIdNomina: TLFLabel;
     LOtrosNombre: TLFLabel;
     LOtrosFecha: TLFLabel;
     LNotasIdNomina: TLFLabel;
     LNotasNombre: TLFLabel;
     LNotasFecha: TLFLabel;
     TBSep6: TToolButton;
     TBVerTotalesDescuentos: TToolButton;
     TBSep7: TToolButton;
     TBVerTotalesHaberes: TToolButton;
     SBAPeriodo: TSpeedButton;
     SplitterEmpleados: TSplitter;
     TBCerrarNomina: TToolButton;
     DBCHKPagado: TLFDBCheckBox;
     DBERic: TLFDbedit;
     LNumeroAsiento: TLFLabel;
     SBVerAsientos: TSpeedButton;
     PNLFiltroCabecera: TLFPanel;
     LPeriodoFiltro: TLFLabel;
     EFPeriodoFiltro: TLFEditFind2000;
     EPeriodoFiltro: TLFEdit;
     LPeriodo: TLFLabel;
     DBEFPeriodo: TLFDBEditFind2000;
     EPeriodo: TLFEdit;
     LFormula: TLFLabel;
     LHaberes: TLFLabel;
     LDescuentos: TLFLabel;
     PNLParametros: TLFPanel;
     DBGFParametros: TDBGridFind2000;
     TBPrametros: TLFToolBar;
     NavParametros: THYMNavigator;
     TBSep2: TToolButton;
     TBParametrosTodos: TToolButton;
     TBParametrosNoCalculados: TToolButton;
     TBSep5: TToolButton;
     TBVerTotalesParametros: TToolButton;
     LParametros: TLFLabel;
     AEnviarNominaCorreo: TAction;
     AImportarExcel: TAction;
     TSPagos: TTabSheet;
     LFTBPagos: TLFToolBar;
     NavPagos: THYMNavigator;
     Separador1: TToolButton;
     LFPBanco: TLFPanel;
     LEntidadEmpleado: TLFLabel;
     EFBanco: TLFEditFind2000;
     ETituloBanco: TLFEdit;
     TBMarcarTodos: TToolButton;
     TBDesmarcarTodos: TToolButton;
     Separador2: TToolButton;
     TBContabilizarPagos: TToolButton;
     TBDespagarPagos: TToolButton;
     LTotalBanco: TLFLabel;
     DBETotalBanco: TLFDbedit;
     DBGPagos: TDBGridFind2000;
     TBSep8: TToolButton;
     PNLDetalleResumido: TLFPanel;
     CBDetalleResumido: TLFCheckBox;
     LAFP: TLFLabel;
     LISAPRE: TLFLabel;
     LPlanISAPRE: TLFLabel;
     DBEAFP: TLFDBEditFind2000;
     DBEISAPRE: TLFDBEditFind2000;
     DBEPlanISAPRE: TLFDbedit;
     EISAPRETitulo: TLFEdit;
     EAFPTitulo: TLFEdit;
     PNLFiltroUsuario: TLFPanel;
     LFiltroEmpleado: TLFLabel;
     EFFiltroEmpleado: TLFEditFind2000;
     EFiltroEmpleado: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBDEDesdeChange(Sender: TObject);
     procedure AAdjuntoNominaExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AAdjuntoEmpleadoExecute(Sender: TObject);
     procedure ALstNominasExecute(Sender: TObject);
     procedure AConfLstNominasExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure TSNotasShow(Sender: TObject);
     procedure DBGFParametrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFHaberesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDescuentosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure PNLDetalleChileResize(Sender: TObject);
     procedure SplitterRightMoved(Sender: TObject);
     procedure ARecalcularNominaExecute(Sender: TObject);
     procedure AExportarExcelExecute(Sender: TObject);
     procedure TBVisualizarTodosClick(Sender: TObject);
     procedure TBVisualizarNoCaluladosClick(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure AExportarExcel2Execute(Sender: TObject);
     procedure DBEFEmpleadoChange(Sender: TObject);
     procedure SBAEmpleadoDblClick(Sender: TObject);
     procedure ALibroRemuneracionesExecute(Sender: TObject);
     procedure TBBorrarFirmaClick(Sender: TObject);
     procedure DBIDChange(Sender: TObject);
     procedure TSOtrosShow(Sender: TObject);
     procedure TBVerTotalesTotalesClick(Sender: TObject);
     procedure SBAPeriodoDblClick(Sender: TObject);
     procedure TBCerrarNominaClick(Sender: TObject);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure EFPeriodoFiltroChange(Sender: TObject);
     procedure DBEFPeriodoChange(Sender: TObject);
     procedure DBGFHaberesCellClick(Column: TColumn);
     procedure DBGFDescuentosCellClick(Column: TColumn);
     procedure AEnviarNominaCorreoExecute(Sender: TObject);
     procedure AImportarExcelExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBMarcarTodosClick(Sender: TObject);
     procedure TBDesmarcarTodosClick(Sender: TObject);
     procedure TBContabilizarPagosClick(Sender: TObject);
     procedure TBDespagarPagosClick(Sender: TObject);
     procedure EFBancoChange(Sender: TObject);
     procedure DBGPagosBusqueda(Sender: TObject);
     procedure CBDetalleResumidoChange(Sender: TObject);
     procedure DBEISAPREChange(Sender: TObject);
     procedure DBEAFPChange(Sender: TObject);
     procedure EFFiltroEmpleadoChange(Sender: TObject);
  private
     Closing: boolean;
     ColActual: TColumn;
     //FactoEscalaPNLDescuentos: double;
     //FactorEscalaPNLParametros: double;
     procedure ActualizaFirma;
  public
     { Public declarations }
     procedure Filtrar(Filtro: string);
     procedure FiltraIdEmpleado(IdEmpleado: integer);
     procedure FiltraPeriodo(Periodo: string);
     function DameFormula(Codigo: string): string;
     procedure MuestraTabla;
  end;

var
  FMNominasCabecera : TFMNominasCabecera;

implementation

uses
  UDMNominas, UDMMain, UEntorno, UUtiles, UDameDato, UFMain, UFPregDatosCSB34, UParam,
  UDMNominasCabecera, UFormGest, UFMAdjunto, DateUtils, UDMLstNominas, UFMListConfig,
  ShellApi, URecibeFicheros, UDMAdjunto, UFMSeleccion, UFMRemuneraciones, UFSendCorreo,
  UDMListados, UImagenes;

{$R *.dfm}

procedure TFMNominasCabecera.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  Closing := False;
  AbreData(TDMNominasCabecera, DMNominasCabecera);

  NavMAin.DataSource := DMNominasCabecera.DSQMNomCab;
  DBGMain.DataSource := DMNominasCabecera.DSQMNomCab;

  NavDetalle.DataSource := DMNominasCabecera.DSQMNomDet;
  DBGFDetalle.DataSource := DMNominasCabecera.DSQMNomDet;
  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'CONCEPTO');

  NavPagos.DataSource := DMNominasCabecera.DSQPagos;
  DBGPagos.DataSource := DMNominasCabecera.DSQPagos;

  // Chile
  NavHaberes.DataSource := DMNominasCabecera.DSQMNomDetHaberes;
  DBGFHaberes.DataSource := DMNominasCabecera.DSQMNomDetHaberes;
  DBGFHaberes.ColumnaInicial := EncuentraField(DBGFHaberes, 'CODIGO');

  NavDescuentos.DataSource := DMNominasCabecera.DSQMNomDetDescuentos;
  DBGFDescuentos.DataSource := DMNominasCabecera.DSQMNomDetDescuentos;
  DBGFDescuentos.ColumnaInicial := EncuentraField(DBGFDescuentos, 'CODIGO');

  NavParametros.DataSource := DMNominasCabecera.DSQMNomDetParametros;
  DBGFParametros.DataSource := DMNominasCabecera.DSQMNomDetParametros;
  DBGFParametros.ColumnaInicial := EncuentraField(DBGFParametros, 'CODIGO');

  G2kTableLoc.DataSource := DMNominasCabecera.DSQMNomCab;

  ColorCampoID(DBID);
  SolapaControles(SBAEmpleado, DBENombreEmpleado);
  SolapaControles(SBVerAsientos, DBERIC);
  DBENombreEmpleado.Color := REntorno.ColorEnlaceActivo;
  DBERIC.Color := REntorno.ColorEnlaceActivo;
  ColorSegunEstado(DBETituloEstado, DMNominasCabecera.QMNomCabESTADO.AsInteger);

  // Proporción para que el panel de parametros sea un poco mas grande porque tiene mas campos.
  // FactorEscalaPNLParametros := 2.61;
  // FactoEscalaPNLDescuentos := 3.19;

  //PNLDetalleChileResize(Sender);
  PNLDescuentos.Width := PNLDetalleChile.Width div 2;
  PNLHaberes.Width := PNLDetalleChile.Width div 2;

  DBGPagos.ColumnasChecked.Strings[DBGPagos.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := IntToStr(REntorno.Entrada);

  FiltraPeriodo(format('%.2d', [MonthOf(Today)]));
end;

function TFMNominasCabecera.DameFormula(Codigo: string): string;
begin
  Result := '';
  // Haberes
  if Codigo = 'H002' then
     Result := 'SI P061 = 0 ENTONCES H002 = ((H001 / 30) * P003)   SINO H002 = H073';
  if Codigo = 'H003' then
     Result := '((((H001 / 30) * 7) / 45) * 1.5) * P046';
  if Codigo = 'H005' then
     Result := 'SI A001 = "SI" ENTONCES (SI P006 > P007 ENTONCES H005 = P007 SINO H005 = P006) SINO H005 = 0';
  if Codigo = 'H006' then
     Result := '(P005 + H005 + H049 + H056 + (H038 + H039) + H048 + H050 - H030)';
  if Codigo = 'H007' then
     Result := 'SI P009 >= 25 ENTONCES H007 = P011 SINO  H007 = (P011 / 30) * P009';
  if Codigo = 'H011' then
     Result := ' H007 + H036 + H037 + H008 + P039 + H066 + H067';
  if Codigo = 'H012' then
     Result := 'H006 + H011';
  if Codigo = 'H013' then
     Result := 'SI H006 <= P047) ENTONCES H013 = H006 SINO H013 = ((P047 / 30) * P003)';
  if Codigo = 'H014' then
     Result := 'H006 - P014';
  if Codigo = 'H020' then
     Result := 'H012 - D017';
  if Codigo = 'H036' then
     Result := 'SI P061 = 1 ENTONCES H036 = H078 SINO H036 = (H009 / 30) * P003';
  if Codigo = 'H037' then
     Result := 'SI P061 = 1  ENTONCES H037 = H079  SINO H037 = (H010 / 30) * P003';
  if Codigo = 'H038' then
     Result := 'H057 * P001';
  if Codigo = 'H039' then
     Result := 'SI P061 = 1 ENTONCES  H039 = (H058 * P220) SINO H039 = (H058 * P002)';
  if Codigo = 'H040' then
     Result := 'H012 - D017';
  if Codigo = 'H042' then
     Result := 'H004 + H021 + H023 + H027 + H028 + H029 + H031 + H034';
  if Codigo = 'H043' then
     Result := '(H001 / 30) * P053';
  if Codigo = 'H044' then
     Result := 'H007 + H008';
  if Codigo = 'H045' then
     Result := '(((H001 / 30) * 7) / 45) * P176';
  if Codigo = 'H046' then
     Result := 'H001 / 30';
  if Codigo = 'H047' then
     Result := 'H001 / 30';
  if Codigo = 'H048' then
     Result := '(H043 + H043) - (H043 * 3)';
  if Codigo = 'H049' then
     Result := 'SI A004 = "SI" ENTONCES H049 = ((((H076 + H003 + H004) / 12) * P220) * A018)';
  if Codigo = 'H050' then
     Result := 'H045 - (H045 + H045)';
  if Codigo = 'H051' then
     Result := 'SI H006 <= P047 ENTONCES H051 = H006 * A019 * P003 SINO H051 = D004';
  if Codigo = 'H057' then
     Result := '(H046 + H046) - (H046 * 3)';
  if Codigo = 'H058' then
     Result := 'H047 + H047 - (H047 * 3)';
  if Codigo = 'H060' then
     Result := 'H059 * P177';
  if Codigo = 'H061' then
     Result := 'h061 = H001 - H049';
  if Codigo = 'H069' then
     Result := 'H004 + H022 + H023 + H031 + H034 + H021';
  if Codigo = 'H070' then
     Result := 'H027 + H028 + H029';
  if Codigo = 'H073' then
     Result := '0 PERO SI P061 = 1 y P221 <> 0 ENTONCES  H073 = H001 / P221 * P220';
  if Codigo = 'H074' then
     Result := 'H001 + H003 + H004';
  if Codigo = 'H075' then
     Result := '0 PERO SI P221 <> 0 ENTONCES H075 = (H001 / P221) * P220';
  if Codigo = 'H077' then
     Result := 'SI P221 <> 0 ENTONCES h077 = (h076 / p221) * p220';
  if Codigo = 'H078' then
     Result := 'SI P221 <> 0) ENTONCES H078 = (H009 / H221) * P220';
  if Codigo = 'H079' then
     Result := 'SI P221 <> 0 ENTONCES H079 = (H010 / P221) * P220';
  if Codigo = 'H080' then
     Result := 'H002 + H077';
  if Codigo = 'H081' then
     Result := 'H005 + H049';
  if Codigo = 'H083' then
     Result := 'SI P002 > 0 ENTONCES H083 = P151 SINO H083 = P022';
  if Codigo = 'H084' then
     Result := 'D003 + D011 + D018 + P022 + D031 + D053 + D055';
  if Codigo = 'H085' then
     Result := 'H021 + H004';

  // Descuentos
  if Codigo = 'D001' then
     Result := 'H013 *  Tasa de AFP Dependiente / 100';
  if Codigo = 'D003' then
     Result := 'D041';
  if Codigo = 'D008' then
     Result := 'D086 Tramos desde - hasta';
  if Codigo = 'D009' then
     Result := 'H016 * 0.1';
  if Codigo = 'D010' then
     Result := 'H017 * 0.1';
  if Codigo = 'D011' then
     Result := 'SI P300 = 0 ENTONCES D011 = P017 * A020 SINO ( if P300 = 1 ENTONCES D011 = 0 SINO (SI P301 = "SI" ENTONCES  D011 = 0 ))';
  if Codigo = 'D012' then
     Result := 'D001 + D002 + D003 + D004 + D011';
  if Codigo = 'D016' then
     Result := 'd016 = d001 + d002 + d008 + d011 + d013 + d015 + d019 + d022 + d024 + d025 + d028 + d061 + d082';
  if Codigo = 'D017' then
     Result := 'D026 + D016 + D030 + D029 + D042 + D060 + D014 + D080 + D418';
  if Codigo = 'D023' then
     Result := 'D018 - D012';
  if Codigo = 'D030' then
     Result := 'C001 * A015';
  if Codigo = 'D037' then
     Result := 'D003 + D004';
  if Codigo = 'D040' then
     Result := 'SI D004 < D041 ENTONCES  D040 = D041 SINO D040 = D004';
  if Codigo = 'D041' then
     Result := 'H013 * 7 / 100';
  if Codigo = 'D042' then
     Result := 'SI D003 > 1 ENTONCES D042 = D041SINO D042 = D040';
  if Codigo = 'D052' then
     Result := 'D015 + D013 + D022 + D024';
  if Codigo = 'D053' then
     Result := 'SI H013 <= P047) ENTONCES D053 = (H013 * A025 / 100) SINO  D053 = (P047 * A025 / 100)';
  if Codigo = 'D054' then
     Result := 'SI D003 > 1 ENTONCES D054 = H013 * A020';
  if Codigo = 'D055' then
     Result := 'D001 + D002';
  if Codigo = 'D056' then
     Result := 'D017 + P042 + P022 - P051 + P205';
  if Codigo = 'D057' then
     Result := 'C013 * C001';
  if Codigo = 'D058' then
     Result := 'A009 + A010 - CS00';
  if Codigo = 'D059' then
     Result := 'A009 + A010';
  if Codigo = 'D061' then
     Result := 'A011';
  if Codigo = 'D062' then
     Result := 'SI H006 <= P047 ENTONCES D062 = H006 * A024 / 100  SINO D062 = P047 * A024 / 100';
  if Codigo = 'D077' then
     Result := 'D003 + D018';
  if Codigo = 'D078' then
     Result := 'D003 + P042 - H007';
  if Codigo = 'D079' then
     Result := 'P038 + P013 + D011';
  if Codigo = 'D080' then
     Result := '0 SI P066 > 1 ENTONCES D080 = P066 * C001';
  if Codigo = 'D081' then
     Result := 'D013 + D015 + D019 + D022 + D024 + D025 + D027 + D028 + D061 + D064 + D065';
  if Codigo = 'D086' then
     Result := 'H013 - (D041 + D001 + D002 + D004 + D011)';
end;

procedure TFMNominasCabecera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Closing := True;
  CierraData(DMNominasCabecera);
end;

procedure TFMNominasCabecera.Filtrar(Filtro: string);
begin
  DMNominasCabecera.Filtrar(filtro);
end;

procedure TFMNominasCabecera.FiltraIdEmpleado(IdEmpleado: integer);
begin
  EFFiltroEmpleado.Text := IntToStr(DMNominasCabecera.DameEmpleadoSegunId(IdEmpleado));
end;

procedure TFMNominasCabecera.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMNominasCabecera.DBGFDetalleColEnter(Sender: TObject);
begin
  //if (ControlEdit <> CEDetalle) then
  //   ControlEdit := CEDetalle;
end;

procedure TFMNominasCabecera.DBDEDesdeChange(Sender: TObject);
begin
  inherited;
  LDias.Caption := IntToStr(DaysBetween(DMNominasCabecera.QMNomCabFECHA_INI_PERIODO.AsDateTime, DMNominasCabecera.QMNomCabFECHA_FIN_PERIODO.AsDateTime) + 1);
end;

procedure TFMNominasCabecera.AAdjuntoEmpleadoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('OPE', DMNominasCabecera.QMNomCabID_EMPLEADO.AsInteger);
end;

procedure TFMNominasCabecera.AAdjuntoNominaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('NOM', DMNominasCabecera.QMNomCabID.AsInteger);
end;

procedure TFMNominasCabecera.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMNominasCabecera.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // Ejecuta el filtro
  DMNominasCabecera.BusquedaCompleja;
end;

procedure TFMNominasCabecera.ALstNominasExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstNominas, DMLstNominas);
  try
     DMLstNominas.MostrarListado(0, 1, DMNominasCabecera.QMNomCabID.AsInteger);
     DMNominasCabecera.SetListado(DMNominasCabecera.QMNomCabID.AsInteger, 1);
  finally
     CierraData(DMLstNominas);
  end;
end;

procedure TFMNominasCabecera.AConfLstNominasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstNominas, DMLstNominas);
  TFMListConfig.Create(Self).Muestra(643, Formato, Cabecera, Copias,
     Pijama, '', DMLstNominas.frNominas, DMLstNominas.HYReport);
  CierraData(DMLstNominas);
end;

procedure TFMNominasCabecera.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('NOM', DMNominasCabecera.QMNomCabID.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoNomina.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMNominasCabecera.TSNotasShow(Sender: TObject);
begin
  inherited;
  if (DBRENotasInternasKri.Visible) then
     DBRENotasInternasKri.Height := (TSNotas.Height - PCabNotas.Height) div 2;
end;

procedure TFMNominasCabecera.DBGFParametrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DataSource.DataSet.FieldByName('ES_TOTAL').AsInteger = 1) then
           ColorResaltado4(Canvas)
        else
        if (UpperCase(Column.FieldName) = 'IMPORTE') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'N') then
              ColorInactivo(Canvas)
           else
           if (DataSource.DataSet.FieldByName('CALCULABLE').AsInteger = 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'DATO_TEXTO') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'T') then
              ColorInactivo(Canvas)
           else
           if (DataSource.DataSet.FieldByName('CALCULABLE').AsInteger = 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'DATO_FECHA') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'F') then
              ColorInactivo(Canvas)
           else
           if (DataSource.DataSet.FieldByName('CALCULABLE').AsInteger = 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNominasCabecera.DBGFHaberesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DataSource.DataSet.FieldByName('ES_TOTAL').AsInteger = 1) then
           ColorResaltado4(Canvas)
        else
        if (UpperCase(Column.FieldName) = 'IMPORTE') then
        begin
           if (DataSource.DataSet.FieldByName('CALCULABLE').AsInteger = 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNominasCabecera.DBGFDescuentosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DataSource.DataSet.FieldByName('ES_TOTAL').AsInteger = 1) then
           ColorResaltado4(Canvas)
        else
        if (UpperCase(Column.FieldName) = 'IMPORTE') then
        begin
           if (DataSource.DataSet.FieldByName('CALCULABLE').AsInteger = 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNominasCabecera.PNLDetalleChileResize(Sender: TObject);
begin
  inherited;
  {if (FactoEscalaPNLDescuentos = 0) then
     FactoEscalaPNLDescuentos := 3;
  if (FactorEscalaPNLParametros = 0) then
     FactorEscalaPNLParametros := 3;

  PNLDescuentos.Width := Trunc(PNLDetalleChile.Width / FactoEscalaPNLDescuentos);
  PNLParametros.Width := Trunc(PNLDetalleChile.Width / FactorEscalaPNLParametros);

  PNLParametros.Constraints.MinWidth := PNLDetalleChile.Width div 6;
  PNLParametros.Constraints.MaxWidth := PNLDetalleChile.Width div 6 * 4;

  PNLDescuentos.Constraints.MinWidth := PNLDetalleChile.Width div 6;
  PNLDescuentos.Constraints.MaxWidth := PNLDetalleChile.Width div 6 * 4;

  PNLHaberes.Constraints.MinWidth := PNLDetalleChile.Width div 6;
  PNLHaberes.Constraints.MaxWidth := PNLDetalleChile.Width div 6 * 4; }
end;

procedure TFMNominasCabecera.SplitterRightMoved(Sender: TObject);
begin
  inherited;
  {if (PNLDescuentos.Width = 0) then
     FactoEscalaPNLDescuentos := 2
  else
     FactoEscalaPNLDescuentos := PNLDetalleChile.Width / PNLDescuentos.Width; }
end;

procedure TFMNominasCabecera.ARecalcularNominaExecute(Sender: TObject);
begin
  inherited;
  DMNominasCabecera.RecalcularNomina;
end;

procedure TFMNominasCabecera.AExportarExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  // Nomina_EMPLEADO_EJERCICIO_PERIODO_fecha.xls ejemplo: Nomina_4-2023-9_20231001-143939.xls
  Archivo := Format(_('Nomina_%d-%s-%d_%s.xls'), [DMNominasCabecera.QMNomCabEMPLEADO.AsInteger, DMNominasCabecera.QMNomCabEJERCICIO.AsString, DMNominasCabecera.QMNomCabPERIODO.AsInteger, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMNominasCabecera') then
  begin
     Screen.Cursor := crHourGlass;
     try
        AbreData(TDMLstNominas, DMLstNominas);
        try
           DMLstNominas.MostrarListado(4, 1, DMNominasCabecera.QMNomCabID.AsInteger, False, 0, Archivo);
        finally
           CierraData(DMLstNominas);
        end;
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMNominasCabecera.TBVisualizarTodosClick(Sender: TObject);
begin
  inherited;
  DMNominasCabecera.Visualizar(TToolButton(Sender).Tag, '');
end;

procedure TFMNominasCabecera.TBVisualizarNoCaluladosClick(Sender: TObject);
begin
  inherited;
  DMNominasCabecera.Visualizar(TToolButton(Sender).Tag, 'C');
end;

procedure TFMNominasCabecera.TBVerTotalesTotalesClick(Sender: TObject);
begin
  inherited;
  DMNominasCabecera.Visualizar(TToolButton(Sender).Tag, 'T');
end;

procedure TFMNominasCabecera.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ALstNominas.Execute;
end;

procedure TFMNominasCabecera.AExportarExcel2Execute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  // Nomina_EMPLEADO_EJERCICIO_PERIODO_fecha.xls ejemplo: Nomina_4-2023-9_20231001-143939.xls
  Archivo := Format(_('Nomina_%d-%s-%d_%s.xls'), [DMNominasCabecera.QMNomCabEMPLEADO.AsInteger, DMNominasCabecera.QMNomCabEJERCICIO.AsString, DMNominasCabecera.QMNomCabPERIODO.AsInteger, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMNominasCabecera') then
  begin
     Screen.Cursor := crHourGlass;
     try
        AbreData(TDMLstNominas, DMLstNominas);
        try
           DMLstNominas.MostrarListado(4, 2, DMNominasCabecera.QMNomCabID.AsInteger, False, 0, Archivo);
        finally
           CierraData(DMLstNominas);
        end;
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMNominasCabecera.DBEFEmpleadoChange(Sender: TObject);
begin
  inherited;
  DBENombreEmpleado.Text := DameTituloEmpleado(StrToIntDef(DBEFEmpleado.Text, 0));
end;

procedure TFMNominasCabecera.SBAEmpleadoDblClick(Sender: TObject);
begin
  inherited;
  if (DMNominasCabecera.QMNomCabEMPLEADO.AsInteger <> 0) then
  begin
     if EstructuraCreada then
     begin
        FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ' + IntToStr(DMNominasCabecera.QMNomCabEMPLEADO.AsInteger));
     end;
  end;
end;

procedure TFMNominasCabecera.ALibroRemuneracionesExecute(Sender: TObject);
var
  Periodo : string;
begin
  inherited;

  { TODO : Parece que esto esta pendiente de terminar }

  Periodo := EFPeriodoFiltro.Text;
  if PideDato('PER', Periodo, '', ' PERIODO BETWEEN ''01'' AND ''12'' ') then
     AbreForm(TFMRemuneraciones, FMRemuneraciones);
end;

procedure TFMNominasCabecera.TBBorrarFirmaClick(Sender: TObject);
begin
  inherited;
  DMMain.BorrarFirma('NOM', DMNominasCabecera.QMNomCab.FieldByName('ID').AsInteger);
  ActualizaFirma;
end;

procedure TFMNominasCabecera.ActualizaFirma;
begin
  if (DMNominasCabecera.QMFirmas.Active) then
     RefrescarImagenFirma(ImgFirma, DMNominasCabecera.QMFirmas.FieldByName('ID_FIRMA').AsInteger);
end;

procedure TFMNominasCabecera.DBIDChange(Sender: TObject);
begin
  inherited;
  if not Closing then
  begin
     if (PCMain.ActivePage = TSOtros) then
        ActualizaFirma;

     if (Abs(DMNominasCabecera.xInfoActualizadaTDEVENGO.AsFloat - DMNominasCabecera.xInfoActualizadaTOTAL_DEVENGO_CONCEPTO.AsFloat) >= 0.01) then
        ColorError(DBETotalDevego)
     else
        ColorInfo(DBETotalDevego);

     if (Abs(DMNominasCabecera.xInfoActualizadaTDEDUCCION.AsFloat - DMNominasCabecera.xInfoActualizadaTOTAL_DEDUCCION_CONCEPTO.AsFloat) >= 0.01) then
        ColorError(DBETotalDeduccion)
     else
        ColorInfo(DBETotalDeduccion);

     if (Abs(DMNominasCabecera.xInfoActualizadaPERCIBIR.AsFloat - DMNominasCabecera.xInfoActualizadaTOTAL_PERCIBIR_CONCEPTO.AsFloat) >= 0.01) then
        ColorError(DBETotalPercibir)
     else
        ColorInfo(DBETotalPercibir);
  end;
end;

procedure TFMNominasCabecera.TSOtrosShow(Sender: TObject);
begin
  inherited;
  ActualizaFirma;
end;

procedure TFMNominasCabecera.SBAPeriodoDblClick(Sender: TObject);
begin
  inherited;
  if (DMNominasCabecera.QMNomCabPERIODO.AsString <> '') then
  begin
     if EstructuraCreada then
     begin
        FMain.EjecutaAccion(FMain.ANominasConstantes, DMNominasCabecera.QMNomCabPERIODO.AsString);
     end;
  end;
end;

procedure TFMNominasCabecera.TBCerrarNominaClick(Sender: TObject);
begin
  if (Trim(DBEFEmpleado.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un empleado'))
  else
  begin
     case DMNominasCabecera.QMNomCabESTADO.AsInteger of
        0:
        begin
           if ConfirmaMensaje(_('¿Esta seguro de que desea cerrar la nómina para el empleado?')) then
           begin
              Screen.Cursor := crHourGlass;
              try
                 DMNominasCabecera.SetCierreNomina(DMNominasCabecera.QMNomCabID.AsInteger, 1); // Cierra Nomina y contabiliza
                 DMNominasCabecera.SetEstadoNomina(DMNominasCabecera.QMNomCabID.AsInteger, 5);
              finally
                 Screen.Cursor := crDefault;
              end;
           end;
        end;
        5:
        begin
           if ConfirmaMensaje(_('¿Esta seguro de que desea abrir la nómina para el empleado?')) then
           begin
              Screen.Cursor := crHourGlass;
              try
                 DMNominasCabecera.SetCierreNomina(DMNominasCabecera.QMNomCabID.AsInteger, 0); // Abre Nomina y descontabiliza
                 DMNominasCabecera.SetEstadoNomina(DMNominasCabecera.QMNomCabID.AsInteger, 0);
              finally
                 Screen.Cursor := crDefault;
              end;
           end;
        end;
     end;
  end;
end;

procedure TFMNominasCabecera.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  ColorSegunEstado(DBETituloEstado, DMNominasCabecera.QMNomCabESTADO.AsInteger);

  if DMNominasCabecera.QMNomCabESTADO.AsInteger = 5 then
     TBCerrarNomina.ImageIndex := 67
  else
     TBCerrarNomina.ImageIndex := 68;
end;

procedure TFMNominasCabecera.FormActivate(Sender: TObject);
begin
  inherited;

  if (REntorno.Pais = 'ESP') then
  begin
     PCDetalle.ActivePage := TSDetalle;
     TSDetalle.TabVisible := True;
     TSPagos.TabVisible := True;
     TSDetalleChile.TabVisible := False;
     ARecalcularNomina.Visible := False;
     PNLParametros.Visible := False;
     PEdit.Align := alClient;
     LAFP.Visible := False;
     DBEAFP.Visible := False;
     EAFPTitulo.Visible := False;
     LISAPRE.Visible := False;
     DBEISAPRE.Visible := False;
     EISAPRETitulo.Visible := False;
     LPlanISAPRE.Visible := False;
     DBEPlanISAPRE.Visible := False;
  end;
  if (REntorno.Pais = 'CHL') then
  begin
     PCDetalle.ActivePage := TSDetalleChile;
     TSDetalleChile.TabVisible := True;
     TSDetalle.TabVisible := False;
     ARecalcularNomina.Visible := True;
     PNLParametros.Visible := True;
     TSPagos.TabVisible := False;
     LAFP.Visible := True;
     DBEAFP.Visible := True;
     EAFPTitulo.Visible := True;
     LISAPRE.Visible := True;
     DBEISAPRE.Visible := True;
     EISAPRETitulo.Visible := True;
     LPlanISAPRE.Visible := True;
     DBEPlanISAPRE.Visible := True;
  end;

  DMNominasCabecera.SetDetalleResumido(CBDetalleResumido.Checked);
end;

procedure TFMNominasCabecera.SBVerAsientosDblClick(Sender: TObject);
begin
  if ((DMNominasCabecera.QMNomCabESTADO.AsInteger = 5) and (DMNominasCabecera.QMNomCabRIC_CIERRE.AsInteger > 0)) then
     FMain.MuestraMovConta(' RIC= ' + DMNominasCabecera.QMNomCabRIC_CIERRE.AsString +
        ' AND EJERCICIO=' + DMNominasCabecera.QMNomCabEJERCICIO_CIERRE.AsString);
end;

procedure TFMNominasCabecera.EFPeriodoFiltroChange(Sender: TObject);
begin
  EPeriodoFiltro.Text := DameTituloPeriodo(EFPeriodoFiltro.Text);
  FiltraPeriodo(Trim(EFPeriodoFiltro.Text));
end;

procedure TFMNominasCabecera.EFFiltroEmpleadoChange(Sender: TObject);
begin
  inherited;
  EFiltroEmpleado.Text := DameTituloEmpleado(StrToIntDef(EFFiltroEmpleado.Text, 0));
  DMNominasCabecera.FiltraEmpleado(StrToIntDef(EFFiltroEmpleado.Text, 0));
end;

procedure TFMNominasCabecera.FiltraPeriodo(Periodo: string);
begin
  if (EFPeriodoFiltro.Text <> Periodo) then
     EFPeriodoFiltro.Text := Periodo;
  DMNominasCabecera.FiltraPeriodo(Periodo);
end;

procedure TFMNominasCabecera.DBEFPeriodoChange(Sender: TObject);
begin
  inherited;
  EPeriodo.Text := DameTituloPeriodo(DBEFPeriodo.Text);
end;

procedure TFMNominasCabecera.DBGFHaberesCellClick(Column: TColumn);
begin
  inherited;
  LFormula.Caption := DameFormula(DMNominasCabecera.QMNomDetHaberesCODIGO.AsString);
end;

procedure TFMNominasCabecera.DBGFDescuentosCellClick(Column: TColumn);
begin
  inherited;
  LFormula.Caption := DameFormula(DMNominasCabecera.QMNomDetDescuentosCODIGO.AsString);
end;

procedure TFMNominasCabecera.MuestraTabla;
begin
  PCMain.ActivePage := TSTabla;
end;

procedure TFMNominasCabecera.AEnviarNominaCorreoExecute(Sender: TObject);
var
  Memo, Cuerpo : TStrings;
  //FicherosAdj : TStrings;
  Subject, Titulo, email : string;
  DMLstNominasCargado, DMListadosCargado : boolean;
begin
  // Envía Nómina del empleado por correo

  DMLstNominasCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando Nómina por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     Titulo := _('Nomina') + '_' + DBENombreEmpleado.Text + '_Periodo_' + DMNominasCabecera.QMNomCabEJERCICIO_CIERRE.AsString + '-' + DMNominasCabecera.QMNomCabPERIODO.AsString;
     Subject := format(_('Nomina %s - %d-%s'), [DBENombreEmpleado.Text, DMNominasCabecera.QMNomCabEJERCICIO_CIERRE.AsInteger, DMNominasCabecera.QMNomCabPERIODO.AsString]);

     try
        begin
           AbreData(TDMLstNominas, DMLstNominas);
           DMLstNominasCargado := True;
           Memo := TStringList.Create;
           Cuerpo := TStringList.Create;
           try
              DMLstNominas.MostrarListadoMail(DMNominasCabecera.QMNomCabID.AsInteger, 2, Memo);
              Cuerpo.Add(format(_('Se adjunta las nominas de %s,'), [DBENombreEmpleado.Text]));
              Cuerpo.Add(format(_('correspondiente al periodo %d-%s'), [DMNominasCabecera.QMNomCabEJERCICIO_CIERRE.AsInteger, DMNominasCabecera.QMNomCabPERIODO.AsString]));

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));
              DMListados.DameDatosTercero(DMNominasCabecera.QMNomCabTERCERO.AsInteger, email);
              if (email <> '') then
              begin
                 // DMListados.SendMailTerceroPDF2(DMNominasCabecera.QMNomCabTERCERO.AsInteger, Memo, DMLstNominas.rutaFich, Titulo, Subject, '', -1, True, '','');
                 DMListados.SendMailPDF(email, Cuerpo, DMLstNominas.rutaFich, Titulo, Subject, '');
                 FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
              end
              else
                 FSendCorreo.Texto(_('El empleado no tiene email asignado'));
           finally
              CierraData(DMLstNominas);
              DMListadosCargado := False;
              Memo.Free;
              Cuerpo.Free;
           end;
           CierraData(DMListados);
           DMListadosCargado := False;
        end;
     except
        begin
           Application.ProcessMessages;
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

           // Liberamos objetos creados
           if DMLstNominasCargado then
              CierraData(DMLstNominas);
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

procedure TFMNominasCabecera.AImportarExcelExecute(Sender: TObject);
var
  Periodo, Archivo, ArchivoLog : string;
  Log : TStrings;
begin
  inherited;

  Periodo := EFPeriodoFiltro.Text;
  if PideDato('PER', Periodo, '', 'PERIODO BETWEEN ''01'' AND ''12''') then
  begin
     Archivo := '';
     if MyOpenDialog(Archivo, 'XLS,ODS,CSV,ALL', '', 'FMNominasCabecera.AImportarExcel') then
     begin
        ArchivoLog := IncludeTrailingPathDelimiter(ExtractFilePath(Archivo)) + format('ImportacionNominas_%s.log', [FormatDatetime('yyyymmdd_hhnn', Now)]);
        Log := TStringList.Create;
        try
           try
              DMNominasCabecera.ImportarXLS(Archivo, Periodo, Log);
           except
              Log.SaveToFile(ArchivoLog);
           end;
        finally
           Log.SaveToFile(ArchivoLog);
           Log.Free;
        end;

        // Refresco datos
        EFPeriodoFiltroChange(Sender);

        DMMain.AbrirArchivo(ArchivoLog);
     end;
  end;
end;

procedure TFMNominasCabecera.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'CONCEPTO') or (UpperCase(Column.FieldName) = 'DESCRIPCION') then
        begin
           // Color de conceptos "Totales"
           if (DMNominasCabecera.QMNomDetTIPO_CONCEPTO.AsInteger = 1) then
              ColorResaltado4(Canvas)
           else
           if (DMNominasCabecera.QMNomDetTIPO_CONCEPTO.AsInteger = 2) then
              ColorResaltado4(Canvas)
           else
           if (DMNominasCabecera.QMNomDetTIPO_CONCEPTO.AsInteger = 3) then
              ColorResaltado4(Canvas)
           else
           // Color de conceptos que suman a la nomina (Tipo "Empleado")
           if (DMNominasCabecera.QMNomDetTIPO_IMPORTE.AsInteger = 1) then
           begin
              if (DMNominasCabecera.QMNomDetSIGNO.AsInteger = 1) then
                 ColorObjeto(Canvas, Brighten(clGreen, 75), clWindowText) // Devengo
              else
                 ColorObjeto(Canvas, Brighten(clRed, 75), clWindowText); // Deduccion
           end
           else
           // Color de conceptos que NO suman a la nomina (Tipo "Empresa")
           if (DMNominasCabecera.QMNomDetTIPO_IMPORTE.AsInteger = 2) then // Empresa
              ColorResaltado(Canvas)
           // Otros conceptos
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNominasCabecera.TBMarcarTodosClick(Sender: TObject);
begin
  if Confirma then
     DMNominasCabecera.MarcarPagosTodos(REntorno.Entrada);
end;

procedure TFMNominasCabecera.TBDesmarcarTodosClick(Sender: TObject);
begin
  if Confirma then
     DMNominasCabecera.MarcarPagosTodos(0);
end;

procedure TFMNominasCabecera.TBContabilizarPagosClick(Sender: TObject);
begin
  if (StrToIntDef(EFBanco.Text, -1) = -1) then
     ShowMessage(_('Debe informar el banco a utilizar para el pago'))
  else
  begin
     if ConfirmaMensaje(_('¿Esta seguro de que desea Pagar las nóminas para el periodo?')) then
     begin
        Screen.Cursor := crHourGlass;
        try
           DMNominasCabecera.PagarNominasPeriodo(StrToIntDef(EFBanco.Text, -1));
        finally
           Screen.Cursor := crDefault;
        end;
     end;
  end;
end;

procedure TFMNominasCabecera.TBDespagarPagosClick(Sender: TObject);
begin
  inherited;
  if (Trim(EFPeriodoFiltro.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un Periodo'))
  else
  begin
     if DMNominasCabecera.HayMarca then
     begin
        if ConfirmaMensaje(_('¿Esta seguro de que desea Revertir los Pagos seleccionados?')) then
        begin
           Screen.Cursor := crHourGlass;
           try
              DMNominasCabecera.DespagarPagosSeleccionados;
           finally
              Screen.Cursor := crDefault;
              ShowMessage(_('Proceso Terminado.'));
           end;
        end;
     end
     else
        raise Exception.Create(_('Debe seleccionar al menos un pago con asiento pagado en el periodo'));
  end;
end;

procedure TFMNominasCabecera.EFBancoChange(Sender: TObject);
begin
  inherited;
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(EFBanco.Text, -1));
end;

procedure TFMNominasCabecera.DBGPagosBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'VER_BANCOS_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TITULO';
     end
     else
     begin
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMNominasCabecera.CBDetalleResumidoChange(Sender: TObject);
begin
  inherited;
  DMNominasCabecera.SetDetalleResumido(CBDetalleResumido.Checked);
end;

procedure TFMNominasCabecera.DBEISAPREChange(Sender: TObject);
begin
  inherited;
  EISAPRETitulo.Text := DameTituloEquivalenciaPrevired(16, DBEISAPRE.Text);
end;

procedure TFMNominasCabecera.DBEAFPChange(Sender: TObject);
begin
  inherited;
  EAFPTitulo.Text := DameTituloEquivalenciaPrevired(10, DBEAFP.Text);
end;

end.
