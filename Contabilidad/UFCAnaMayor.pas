unit UFCAnaMayor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UControlEdit, Grids, DBGrids, UHYDBGrid, dbcgrids, Mask, DBCtrls,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, UEditPanel, UNavigator, ToolWin,
  UTeclas, UFIBDBEditfind, UComponentesBusquedaFiltrada, ActnList, UFormGest,
  NsDBGrid, rxToolEdit, ULFActionList, ULFToolBar, ULFEdit, ULFDBEdit,
  ULFPanel, ULFPageControl, ULFComboBox, ULFEditFind2000, rxPlacemnt,
  ULFFormStorage, ULFLabel, ULFDateEdit, DateUtils;

type
  TFCAnaMayor = class(TG2KForm)
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     PNL_Cta_2: TLFPanel;
     DBECentroCoste: TLFDbedit;
     DBETitulo: TLFDbedit;
     TSTabla: TTabSheet;
     DBGMain: THYTDBGrid;
     DBEDebe: TLFDbedit;
     DBEHaber: TLFDbedit;
     TSMovPeriodos: TTabSheet;
     PNL_Per_1: TLFPanel;
     DBEpCentroCoste: TLFDbedit;
     DBEpTitulo: TLFDbedit;
     PNL_Cta_1: TLFPanel;
     LBLSaldoAnt: TLFLabel;
     DBEAntD: TLFDbedit;
     DBEAntH: TLFDbedit;
     DBGPeriodos: THYTDBGrid;
     PNL_Cta_3: TLFPanel;
     PNL_Cta_4: TLFPanel;
     LBLDesde: TLFLabel;
     DTPDesde: TLFDateEdit;
     LBLHasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     LBLMonedaFicha: TLFLabel;
     TBNav: TLFToolBar;
     NavMayor: THYMNavigator;
     EPMain: THYMEditPanel;
     TButtSeparador2: TToolButton;
     TButtEdita: TToolButton;
     CEMain: TControlEdit;
     TButtSeparador1: TToolButton;
     CEMainPMEdit: TPopUpTeclas;
     LBLMoneda: TLFLabel;
     TButtSeparador3: TToolButton;
     EFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     DBGConsulta: THYTDBGrid;
     TButtFiltra: TToolButton;
     TButtMoneda: TToolButton;
     DBESaldoAnt: TLFDbedit;
     DBESaldo: TLFDbedit;
     LBLSaldoAct: TLFLabel;
     DBESaldoAct: TLFDbedit;
     EMoneda: TLFEdit;
     PNLCuenta: TLFPanel;
     LCentroCoste: TLFLabel;
     EFCentroCoste: TLFEditFind2000;
     CBCanales: TLFComboBox;
     TBActions: TLFToolBar;
     FSMain: TLFFibFormStorage;
     ALMain: TLFActionList;
     AMoficarImputacion: TAction;
     AFiltraFechas: TAction;
     ARefrescaMayor: TAction;
     AFiltraMoneda: TAction;
     AEliminaImputacion: TAction;
     AVisualizarListado: TAction;
     AVisualizaMayor: TAction;
     Asep: TAction;
     AConfRapidaListadoMayor: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     CBPlanesContables: TLFComboBox;
     LPlan: TLFLabel;
     AConfRapidaListadoMayorOrdCC: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSMovPeriodosShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormShow(Sender: TObject);
     procedure MuestraFiltrado;
     procedure EFCentroCosteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGConsultaDblClick(Sender: TObject);
     procedure EFCentroCosteExit(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure AMoficarImputacionExecute(Sender: TObject);
     procedure AFiltraFechasExecute(Sender: TObject);
     procedure ARefrescaMayorExecute(Sender: TObject);
     procedure AFiltraMonedaExecute(Sender: TObject);
     procedure AEliminaImputacionExecute(Sender: TObject);
     procedure AVisualizarListadoExecute(Sender: TObject);
     procedure AVisualizaMayorExecute(Sender: TObject);
     procedure AConfRapidaListadoMayorExecute(Sender: TObject);
     procedure DBGConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AConfRapidaListadoMayorOrdCCExecute(Sender: TObject);
     procedure EFCentroCosteBusqueda(Sender: TObject);
     procedure CBPlanesContablesSelect(Sender: TObject);
  private
     procedure Expande;
     function PlanSeleccionado: string;
  public
  end;

var
  FCAnaMayor : TFCAnaMayor;

implementation

{$R *.DFM}

uses UDMAnaMayor, UEntorno, UDMMain, UUtiles, UFMain, UFMListConfig,
  UFMMovConta, UDMMovConta, UDMRAnaMayor, UFPregAnaMayor,
  UFMImputacionCostes, URellenaLista;

procedure TFCAnaMayor.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAnaMayor, DMAnaMayor);
  NavMayor.DataSource := DMAnaMayor.DSxCentrosCoste;
  DBGConsulta.DataSource := DMAnaMayor.DSxMayor;
  DBGMain.DataSource := DMAnaMayor.DSxCentrosCoste;
  DBGPeriodos.DataSource := DMAnaMayor.DSxmayor_cc_periodo;

  // Ponemos las fechas por defecto
  DMAnaMayor.CalculaFechas;
  DTPDesde.Date := DMAnaMayor.Desde;
  DTPHasta.Date := DMAnaMayor.Hasta;

  // Rellenamos el combo de canales
  // CBCanales.Items := DMAnaMayor.RellenaCanales;
  RellenaCanales(CBCanales.Items); {dji lrk kri - Memory Leak}
  CBCanales.ItemIndex := REntorno.Canal;
  DMAnaMayor.Canal := REntorno.Canal;
  DMAnaMayor.Alcance := 1;

  // Rellenamos el combo de planes contables
  // CBPlanesContables.Items := DMAnaMayor.RellenaPlanesContables;
  DMAnaMayor.RellenaPlanesContables(CBPlanesContables.Items); {dji lrk kri - Memory Leak}
  CBPlanesContables.ItemIndex := 0;
  DMAnaMayor.PlanContable := PlanSeleccionado;

  DMAnaMayor.FiltradoInicial;

  // Teclas
  CEMainPMEdit.Teclas := DMMain.teclas;
  ControlEdit := CEMain;

  EFMoneda.Text := REntorno.Moneda;

  // Controlamos la longitud de la cadena
  FMain.AddComponentePunto(EFCentroCoste);
  EFCentroCoste.MaxLength := LargoCentroCoste;
end;

procedure TFCAnaMayor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(EFCentroCoste);
  Action := caFree;
  CierraData(DMAnaMayor);
end;

procedure TFCAnaMayor.TSFichaShow(Sender: TObject);
begin
  EFCentroCoste.SetFocus;
end;

procedure TFCAnaMayor.TSTablaShow(Sender: TObject);
begin
  DBGMain.SetFocus;
end;

procedure TFCAnaMayor.TSMovPeriodosShow(Sender: TObject);
begin
  EMoneda.Text := EFMoneda.Text;
  DBGPeriodos.SetFocus;
  DMAnaMayor.FiltraPeriodo;
end;

procedure TFCAnaMayor.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMAnaMayor.BusquedaCompleja;
  Continua := False;
end;

procedure TFCAnaMayor.FormShow(Sender: TObject);
begin
  DMAnaMayor.Desde := DTPDesde.Date;
  DMAnaMayor.Hasta := DTPHasta.Date;
  DMAnaMayor.Moneda := EFMoneda.Text;
  DMAnaMayor.CambiaMascara(DMAnaMayor.Moneda);
  EFCentroCoste.SetFocus;
end;

procedure TFCAnaMayor.MuestraFiltrado;
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMAnaMayor.xMayor.SelectSQL);
  AbreData(TDMRAnaMayor, DMRAnaMayor);
  TempSql.AddStrings(DMRAnaMayor.xListaAnaMayor.SelectSQL);
  DMRAnaMayor.xListaAnaMayor.Close;
  DMRAnaMayor.xListaAnaMayor.SelectSQL.Assign(SqlFiltro);
  // DMRMayor.Mostrarlistado;
  DMAnaMayor.LanzaListado;
  DMRAnaMayor.xListaAnaMayor.Close;
  DMRAnaMayor.xListaAnaMayor.SelectSQL.Assign(TempSQL);
  CierraData(DMRAnaMayor);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFCAnaMayor.EFCentroCosteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DBGConsulta.SetFocus; // Expande;
end;

procedure TFCAnaMayor.DBGConsultaDblClick(Sender: TObject);
begin
  if DMAnaMayor.HayDatos then
     FMain.MuestraMovConta(' RIC= ' + DMAnaMayor.DameRICStr + ' and ejercicio=' +
        REntorno.EjercicioStr, IntToStr(DMAnaMayor.DameCanal));
end;

procedure TFCAnaMayor.EFCentroCosteExit(Sender: TObject);
begin
  Expande;
end;

procedure TFCAnaMayor.Expande;
begin
  PCMain.ActivePage := TSFicha;
  TSFicha.Visible := True;

  if EFCentroCoste.Text = '' then
     Exit;

  // if Pos('.', EFCentroCoste.Text) <> 0 then
  //    EFCentroCoste.Text := ExpandirCadena(EFCentroCoste.Text, LargoCentroCoste);

  DMAnaMayor.FiltraCC(EFCentroCoste.Text);

  DBGConsulta.SetFocus;
  EFCentroCoste.Text := '';
end;

procedure TFCAnaMayor.CBCanalesChange(Sender: TObject);
begin
  if (CBCanales.ItemIndex = 0) then
  begin
     DMAnaMayor.Alcance := 0;
     DMAnaMayor.Canal := REntorno.Canal;
  end
  else
  begin
     DMAnaMayor.Alcance := 1;
     DMAnaMayor.Canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);
  end;

  // CBPlanesContables.Items := DMAnaMayor.RellenaPlanesContables;
  DMAnaMayor.RellenaPlanesContables(CBPlanesContables.Items); {dji lrk kri - Memory Leak}
  CBPlanesContables.ItemIndex := 0;
end;

procedure TFCAnaMayor.EFMonedaChange(Sender: TObject);
begin
  DMAnaMayor.CambiaTituloMoneda(EFMoneda.Text, False);
end;

procedure TFCAnaMayor.AMoficarImputacionExecute(Sender: TObject);
var
  Ric, Linea : integer;
begin
  Ric := DMAnaMayor.DameRic;
  Linea := DMAnaMayor.DameLinea;
  if (Ric > 0) then
     AbrirImputacionCostesLinea(Ric, Linea);
end;

procedure TFCAnaMayor.AFiltraFechasExecute(Sender: TObject);
begin
  TBNav.SetFocus;
  DMAnaMayor.Desde := DTPDesde.Date;
  DMAnaMayor.Hasta := RecodeTime(DTPDesde.Date, 23, 59, 59, 999);
  DMAnaMayor.Filtra;
end;

procedure TFCAnaMayor.ARefrescaMayorExecute(Sender: TObject);
begin
  DMAnaMayor.Refresca;
end;

procedure TFCAnaMayor.AFiltraMonedaExecute(Sender: TObject);
begin
  DMAnaMayor.CambiaTituloMoneda(EFMoneda.Text, True);
end;

procedure TFCAnaMayor.AEliminaImputacionExecute(Sender: TObject);
begin
  DMAnaMayor.BorraImputacion;
end;

procedure TFCAnaMayor.AVisualizarListadoExecute(Sender: TObject);
begin
  MuestraFiltrado;
end;

procedure TFCAnaMayor.AVisualizaMayorExecute(Sender: TObject);
begin
  TFPregAnaMayor.Create(Self).Mostrar(PlanSeleccionado,
     DMAnaMayor.xCentrosCosteCENTRO_COSTE.AsString, DTPDesde.Date, DTPHasta.Date);
end;

procedure TFCAnaMayor.AConfRapidaListadoMayorExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRAnaMayor, DMRAnaMayor);
  TFMListConfig.Create(Self).Muestra(605, formato, cabecera, copias, pijama, '',
     DMRAnaMayor.frAnaMayor);
  CierraData(DMRAnaMayor);
end;

procedure TFCAnaMayor.DBGConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMAnaMAyor.HayDatos then
  begin
     if (UpperCase(Column.FieldName) = 'ASIENTO') then
        CeldaEnlace(DBGConsulta, Rect);
  end;

  if (DMAnaMayor.DameTipoAsiento = 'ANA') then
     with DBGConsulta.Canvas do
     begin
        Font.Color := clGreen;
        FillRect(Rect);
     end;

  // DBGConsulta.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function TFCAnaMayor.PlanSeleccionado: string;
var
  P : integer;
begin
  P := Pos('-', CBPlanesContables.Items[CBPlanesContables.ItemIndex]);
  Result := Trim(Copy(CBPlanesContables.Items[CBPlanesContables.ItemIndex], 1, P - 1));
end;

procedure TFCAnaMayor.AConfRapidaListadoMayorOrdCCExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRAnaMayor, DMRAnaMayor);
  TFMListConfig.Create(Self).Muestra(601, formato, cabecera, copias, pijama, '',
     DMRAnaMayor.frAnaMayor);
  CierraData(DMRAnaMayor);
end;

procedure TFCAnaMayor.EFCentroCosteBusqueda(Sender: TObject);
begin
  EFCentroCoste.CondicionBusqueda := 'plan_contable=''' + PlanSeleccionado + '''';
end;

procedure TFCAnaMayor.CBPlanesContablesSelect(Sender: TObject);
begin
  DMAnaMayor.PlanContable := PlanSeleccionado;
end;

end.
