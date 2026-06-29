unit UFMCentrosCoste;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFComboBox, ULFPageControl, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEdit, UNavigator, Menus,
  UTeclas, UControlEdit, URecursos, ULFLabel, rxPlacemnt, ULFFormStorage;

type
  TFMCentrosCoste = class(TG2kForm)
     PAvisos: TLFPanel;
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     CBPlanes: TLFComboBox;
     PArbolCC: TLFPanel;
     PCMain: TLFPageControl;
     TSCentrosCoste: TTabSheet;
     TSPresupuestos: TTabSheet;
     TSPlantillasDP: TTabSheet;
     TVCentrosCoste: TTreeView;
     TBCentroCoste: TLFToolBar;
     DBGFCentrosCoste: TDBGridFind2000;
     NavCentrosCoste: THYMNavigator;
     TSep1: TToolButton;
     TButtSubirNivel: TToolButton;
     TButtRefrescar: TToolButton;
     TSep2: TToolButton;
     TButtBajarNivel: TToolButton;
     TBPresupuestos: TLFToolBar;
     NavPresupuestos: THYMNavigator;
     TSep3: TToolButton;
     TSep4: TToolButton;
     TButtPropagar: TToolButton;
     DBGFPresupuestos: TDBGridFind2000;
     TBPlantillasDP: TLFToolBar;
     NavPlantillasDP: THYMNavigator;
     TSep5: TToolButton;
     TSep6: TToolButton;
     TButtRepartir: TToolButton;
     DBGFPlantillasDP: TDBGridFind2000;
     ToolButton4: TToolButton;
     TButtSalir: TToolButton;
     CECentrosCoste: TControlEdit;
     CECentrosCostePMEdit: TPopUpTeclas;
     PCentrosCosteCC: TLFPanel;
     EdCentroCosteCC: TLFEdit;
     PCentrosCosteP: TLFPanel;
     EdCentroCostePP: TLFEdit;
     CEPresupuestos: TControlEdit;
     CEPresupuestosPMEdit: TPopUpTeclas;
     PEdCentroCosteDP: TLFPanel;
     EdCentroCosteDP: TLFEdit;
     CEPlantillasDP: TControlEdit;
     CEPlantillasDPPMEdit: TPopUpTeclas;
     LBLCcNoDistribuidos: TLFLabel;
     LBLAlertaPresupuesto: TLFLabel;
     LVCcNoDistribuidos: TListView;
     LVAlertaPresupuesto: TListView;
     TSCuentas: TTabSheet;
     TBCuentas: TLFToolBar;
     NavCuentas: THYMNavigator;
     ToolButton1: TToolButton;
     PNLCuenta: TLFPanel;
     EdCuenta: TLFEdit;
     ToolButton2: TToolButton;
     DBGFCuentas: TDBGridFind2000;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtSalirClick(Sender: TObject);
     procedure CBPlanesSelect(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure TButtSubirNivelClick(Sender: TObject);
     procedure TButtBajarNivelClick(Sender: TObject);
     procedure TSCentrosCosteShow(Sender: TObject);
     procedure DBGFCentrosCosteColEnter(Sender: TObject);
     procedure TVCentrosCosteDeletion(Sender: TObject; Node: TTreeNode);
     procedure TVCentrosCosteDblClick(Sender: TObject);
     procedure DBGFPresupuestosColEnter(Sender: TObject);
     procedure TSPresupuestosShow(Sender: TObject);
     procedure TSPlantillasDPShow(Sender: TObject);
     procedure DBGFPlantillasDPColEnter(Sender: TObject);
     procedure DBGFPlantillasDPBusqueda(Sender: TObject);
     procedure NavPlantillasDPClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFPlantillasDPCellClick(Column: TColumn);
     procedure DBGFPlantillasDPKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure LVCcNoDistribuidosDeletion(Sender: TObject; Item: TListItem);
     procedure LVAlertaPresupuestoDeletion(Sender: TObject; Item: TListItem);
     procedure LVCcNoDistribuidosDblClick(Sender: TObject);
     procedure LVAlertaPresupuestoDblClick(Sender: TObject);
     procedure DBGFPlantillasDPDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFPresupuestosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TButtPropagarClick(Sender: TObject);
     procedure TButtRepartirClick(Sender: TObject);
  private
     { Private declarations }
     function PlanSeleccionado: string;
     function CentroCoste(Nodo: TTreeNode): integer; overload;
     function CentroCoste(Item: TListItem): integer; overload;
     // procedure AdicionaHijo(Padre: TTreeNode; Info: PCentroCosteInfo);
     procedure LlenarArbol;
     procedure ActualizaTituloCC;
     procedure HabilitaDP(Modo: boolean);
     procedure LlenarAvisos;
  public
     { Public declarations }
     procedure HabilitaPA;
  end;

var
  FMCentrosCoste : TFMCentrosCoste;

implementation

{$R *.dfm}

uses
  UDMMain, UDMCentrosCoste, UFPregPropagaPresp;

procedure AdicionaHijo(Padre: TTreeNode; Info: PCentroCosteInfo);
var
  Hijos : TList;
  i : integer;

  function Titulo(Info: PCentroCosteInfo): string;
  begin
     Result := Info^.Codigo + '. ' + Info^.Titulo;
  end;

begin
  Hijos := DMCentrosCoste.ObtenerHijos(Info^.Codigo);
  if Hijos.Count > 0 then
  begin
     Padre := FMCentrosCoste.TVCentrosCoste.Items.AddChildObject(Padre, Titulo(Info), Info);
     for i := 0 to Hijos.Count - 1 do
        AdicionaHijo(Padre, Hijos[i]);
  end
  else
     FMCentrosCoste.TVCentrosCoste.Items.AddChildObject(Padre, Titulo(Info), Info);
  Hijos.Free;
end;

procedure TFMCentrosCoste.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMCentrosCoste, DMCentrosCoste);

  NavCentrosCoste.DataSource := DMCentrosCoste.DSQMCentrosCoste;
  DBGFCentrosCoste.DataSource := DMCentrosCoste.DSQMCentrosCoste;
  NavPresupuestos.DataSource := DMCentrosCoste.DSQMPresupuestos;
  DBGFPresupuestos.DataSource := DMCentrosCoste.DSQMPresupuestos;
  CECentrosCostePMEdit.Teclas := DMMain.Teclas;
  CEPresupuestosPMEdit.Teclas := DMMain.Teclas;

  DMCentrosCoste.LlenaPlanesContables(CBPlanes.Items);
  CBPlanes.ItemIndex := 0;
  DMCentrosCoste.AbrirPlanContable(PlanSeleccionado);
  DMCentrosCoste.AbrirCentrosCoste;
  DMCentrosCoste.AbrirPresupuestos;
  DMCentrosCoste.AbrirPlantillas;
  DMCentrosCoste.AbrirCuentas;
  LlenarArbol;
  LlenarAvisos;

  PCMain.ActivePage := TSCentrosCoste;
  ActualizaTituloCC;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
  TSPlantillasDP.Parent := PCMain;
end;

procedure TFMCentrosCoste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMCentrosCoste);
end;

procedure TFMCentrosCoste.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

function TFMCentrosCoste.PlanSeleccionado: string;
var
  P : integer;
begin
  P := Pos('-', CBPlanes.Items[CBPlanes.ItemIndex]);
  Result := Copy(CBPlanes.Items[CBPlanes.ItemIndex], 1, P - 1);
end;

procedure TFMCentrosCoste.CBPlanesSelect(Sender: TObject);
begin
  DMCentrosCoste.AbrirPlanContable(PlanSeleccionado);
  DMCentrosCoste.AbrirCentrosCoste;
  DMCentrosCoste.AbrirPresupuestos;
  DMCentrosCoste.AbrirPlantillas;
  DMCentrosCoste.AbrirCuentas;
  LlenarArbol;
  LlenarAvisos;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
end;

procedure TFMCentrosCoste.TButtRefrescarClick(Sender: TObject);
begin
  LlenarArbol;
end;

{
procedure TFMCentrosCoste.AdicionaHijo(Padre: TTreeNode; Info: PCentroCosteInfo);
var
  Hijos: TList;
  i: Integer;

function Titulo(Info: PCentroCosteInfo): String
begin
  Result := Info^.Codigo + '. ' + Info^.Titulo;
end;

begin
  Hijos := DMCentrosCoste.ObtenerHijos(Nodo);
  if Hijos.Count > 0 then
  begin
    Padre := TVCentrosCoste.Items.AddChildObject(Padre, Titulo(Info), Info);
    for i := 0 to Hijos.Count - 1 do
      AdicionaHijo(Padre, Hijos[i]);
  end
  else
    TVCentrosCoste.Items.AddChildObject(Padre, Titulo(Info), Info);
  Hijos.Free;
end;
}
procedure TFMCentrosCoste.TButtSubirNivelClick(Sender: TObject);
begin
  DMCentrosCoste.SubirNivel;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
  ActualizaTituloCC;
end;

procedure TFMCentrosCoste.TButtBajarNivelClick(Sender: TObject);
begin
  DMCentrosCoste.BajarNivel;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
  ActualizaTituloCC;
end;

procedure TFMCentrosCoste.LlenarArbol;
var
  Info : PCentroCosteInfo;
begin
  TVCentrosCoste.Items.Clear;
  New(Info);
  Info^.Codigo := '';
  Info^.Titulo := PlanSeleccionado;
  Info^.ID_CC := 0;
  AdicionaHijo(nil, Info);
  TVCentrosCoste.FullExpand;
end;

procedure TFMCentrosCoste.TSCentrosCosteShow(Sender: TObject);
begin
  ControlEdit := CECentrosCoste;
end;

procedure TFMCentrosCoste.DBGFCentrosCosteColEnter(Sender: TObject);
begin
  ControlEdit := CECentrosCoste;
end;

procedure TFMCentrosCoste.TVCentrosCosteDeletion(Sender: TObject; Node: TTreeNode);
begin
  if (Node.Data <> nil) then
     Dispose(Node.Data);
end;

function TFMCentrosCoste.CentroCoste(Nodo: TTreeNode): integer;
begin
  if (Nodo <> nil) then
     Result := PCentroCosteInfo(Nodo.Data)^.ID_CC
  else
     Result := -1;
end;

procedure TFMCentrosCoste.TVCentrosCosteDblClick(Sender: TObject);
begin
  TVCentrosCoste.FullExpand;
  DMCentrosCoste.AbrirCCPadre(CentroCoste(TVCentrosCoste.Selected));
  DMCentrosCoste.AbrirCentrosCoste;
  DMCentrosCoste.AbrirPresupuestos;
  DMCentrosCoste.AbrirPlantillas;
  DMCentrosCoste.AbrirCuentas;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
  ActualizaTituloCC;
end;

procedure TFMCentrosCoste.ActualizaTituloCC;
begin
  EdCentroCosteCC.Text := DMCentrosCoste.DameTituloCCPadre;
  EdCentroCostePP.Text := DMCentrosCoste.DameTituloCCPadre;
  EdCentroCosteDP.Text := DMCentrosCoste.DameTituloCCPadre;
  EdCuenta.Text := DMCentrosCoste.DameTituloCCPadre;
end;

procedure TFMCentrosCoste.DBGFPresupuestosColEnter(Sender: TObject);
begin
  ControlEdit := CEPresupuestos;
end;

procedure TFMCentrosCoste.TSPresupuestosShow(Sender: TObject);
begin
  ControlEdit := CEPresupuestos;
end;

procedure TFMCentrosCoste.TSPlantillasDPShow(Sender: TObject);
begin
  ControlEdit := CEPlantillasDP;
  HabilitaPA;
end;

procedure TFMCentrosCoste.DBGFPlantillasDPColEnter(Sender: TObject);
begin
  ControlEdit := CEPlantillasDP;
end;

procedure TFMCentrosCoste.DBGFPlantillasDPBusqueda(Sender: TObject);
begin
  with DMCentrosCoste do
     DBGFPlantillasDP.CondicionBusqueda := 'PLAN_CONTABLE=''' + PlanActivo + '''';
end;

procedure TFMCentrosCoste.HabilitaDP(Modo: boolean);
begin
  if Modo then
     TSPlantillasDP.PageControl := PCMain
  else
     TSPlantillasDP.PageControl := nil;
end;

procedure TFMCentrosCoste.HabilitaPA;
begin
  if (TSPlantillasDP.PageControl <> nil) then
  begin
     TButtRepartir.Enabled := DMCentrosCoste.PlantillasVacias;
     if TButtRepartir.Enabled then
        if DMCentrosCoste.PlantillaAplicada then
        begin
           TButtRepartir.ImageIndex := 27;
           TButtRepartir.Hint := _('Desreparto de imputaciones.');
           TButtRepartir.Tag := 0;
        end
        else
        begin
           TButtRepartir.ImageIndex := 28;
           TButtRepartir.Hint := _('Reparto de imputaciones.');
           TButtRepartir.Tag := 1;
        end;
  end;
end;

procedure TFMCentrosCoste.NavPlantillasDPClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button in [nbNext, nbPrior, nbFirst, nbLast, nbPost, nbDelete, nbRefresh]) then
     HabilitaPA;
end;

procedure TFMCentrosCoste.DBGFPlantillasDPCellClick(Column: TColumn);
begin
  HabilitaPA;
end;

procedure TFMCentrosCoste.DBGFPlantillasDPKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR, VK_HOME, VK_END]) then
     HabilitaPA;
end;

procedure TFMCentrosCoste.LVCcNoDistribuidosDeletion(Sender: TObject; Item: TListItem);
begin
  if (Item.Data <> nil) then
     Dispose(Item.Data);
end;

procedure TFMCentrosCoste.LVAlertaPresupuestoDeletion(Sender: TObject; Item: TListItem);
begin
  if (Item.Data <> nil) then
     Dispose(Item.Data);
end;

procedure TFMCentrosCoste.LlenarAvisos;
begin
  with DMCentrosCoste do
  begin
     LlenarAlertaPresupuesto(LVAlertaPresupuesto.Items);
     LlenarCcNoDistribuidos(LVCcNoDistribuidos.Items);
  end;
end;

function TFMCentrosCoste.CentroCoste(Item: TListItem): integer;
begin
  if (Item <> nil) then
     Result := PCentroCosteInfo(Item.Data)^.ID_CC
  else
     Result := -1;
end;

procedure TFMCentrosCoste.LVCcNoDistribuidosDblClick(Sender: TObject);
begin
  DMCentrosCoste.AbrirCCPadre(CentroCoste(LVCcNoDistribuidos.Selected));
  DMCentrosCoste.AbrirCentrosCoste;
  DMCentrosCoste.AbrirPresupuestos;
  DMCentrosCoste.AbrirPlantillas;
  DMCentrosCoste.AbrirCuentas;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
  ActualizaTituloCC;
  TSPlantillasDP.Show;
end;

procedure TFMCentrosCoste.LVAlertaPresupuestoDblClick(Sender: TObject);
begin
  DMCentrosCoste.AbrirCCPadre(CentroCoste(LVAlertaPresupuesto.Selected));
  DMCentrosCoste.AbrirCentrosCoste;
  DMCentrosCoste.AbrirPresupuestos;
  DMCentrosCoste.AbrirPlantillas;
  DMCentrosCoste.AbrirCuentas;
  HabilitaDP(DMCentrosCoste.DistribucionPosterior);
  ActualizaTituloCC;
  TSPresupuestos.Show;
end;

procedure TFMCentrosCoste.DBGFPlantillasDPDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (not ((gdSelected in State) or (gdFocused in State))) or
     (not DBGFPlantillasDP.Focused) then
     if (DMCentrosCoste.PeriodoNoDistribuido) then
        with DBGFPlantillasDP.Canvas do
        begin
           Brush.Color := clRed;
           Font.Color := clWhite;
           FillRect(Rect);
        end;
  DBGFPlantillasDP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMCentrosCoste.DBGFPresupuestosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (not ((gdSelected in State) or (gdFocused in State))) or
     (not DBGFPresupuestos.Focused) then
     if (DMCentrosCoste.AlertaPresupuesto) then
        with DBGFPresupuestos.Canvas do
        begin
           Brush.Color := clRed;
           Font.Color := clWhite;
           FillRect(Rect);
        end;
  DBGFPresupuestos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMCentrosCoste.TButtPropagarClick(Sender: TObject);
var
  FPregPropaga : TFPregPropagaPresp;
  Modo : smallint;
begin
  FPregPropaga := TFPregPropagaPresp.Create(Self);
  with FPregPropaga do
     try
        if (ShowModal = mrOk) then
        begin
           if (Presupuesto) then
              Modo := 0
           else
              Modo := 1;
           DMCentrosCoste.PropagaPresupuestos(Ejercicio, NivelInicial, NivelFinal,
              IncPorc, IncLineal, CCInicial, CCFinal, Modo);
           ShowMessage(_('Propagación terminada con éxito'));
        end;
     finally
        Free;
     end;
end;

procedure TFMCentrosCoste.TButtRepartirClick(Sender: TObject);
begin
  DMCentrosCoste.AplicarPlantillaDP(TButtRepartir.Tag);
  HabilitaPA;
end;

end.
