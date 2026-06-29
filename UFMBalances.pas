unit UFMBalances;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, ComCtrls, StdCtrls, DBCtrls, Spin, UDBSpin, Mask, Menus,
  UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, ActnList, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFEdit,
  ULFFormStorage, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel,
  ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada, UG2kTBLoc,
  UFPEditDetalle;

type
  TFMBalances = class(TFPEditDetalle)
     LBLClave: TLFLabel;
     LBLTitulo: TLFLabel;
     DBEClave: TLFDbedit;
     DBETitulo: TLFDbedit;
     LBLOrden: TLFLabel;
     LBLTipo: TLFLabel;
     LBLGrupo: TLFLabel;
     LBLSigno: TLFLabel;
     DBSEOrden: TDBSpinEdit;
     DBCBTipo: TDBComboBox;
     DBCBGrupo: TDBComboBox;
     DBCBSigno: TDBComboBox;
     NavBalances: THYMNavigator;
     PNLTitBalance: TLFPanel;
     DBEBalance: TLFDbedit;
     TButtRefrescar: TToolButton;
     ARenumera: TAction;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     AVisualizarDefBalance: TAction;
     AConfDefBalance: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ASep: TAction;
     LFCategoryAction3: TLFCategoryAction;
     EDTTipo: TLFDbedit;
     EDTGrupo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEBalanceChange(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBGBalanceDetalleColEnter(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure ARenumeraExecute(Sender: TObject);
     procedure AVisualizarDefBalanceExecute(Sender: TObject);
     procedure AConfDefBalanceExecute(Sender: TObject);
     procedure DBGFBalancesDetColEnter(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMBalances : TFMBalances;

implementation

uses UFormGest, UUtiles, UDMBalances, UDMMain, UDMLstBalances, UFMListConfig,
  DB;

{$R *.DFM}

procedure TFMBalances.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMBalances, DMBalances);
  DMBalances.Refresca;
  NavMain.DataSource := DMBalances.DSQMBalances_Def;
  DBGMain.DataSource := DMBalances.DSQMBalances_Def;
  NavDetalle.DataSource := DMBalances.DSQMBalances_Def_Detalle;
  DBGFDetalle.DataSource := DMBalances.DSQMBalances_Def_Detalle;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  TSTablaMaximizada := True;

  // Color campo ID
  ColorCampoID(DBEBalance);
end;

procedure TFMBalances.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMBalances);
end;

procedure TFMBalances.DBEBalanceChange(Sender: TObject);
var
  Balance : integer;
begin
  // Balance := StrToIntDef(Copy(DBEBalance.Text, 0,2), 0);

  Balance := DMBalances.xBalancesBALANCE.AsInteger;
  if (Balance >= 10) and (Balance < 20) then
  begin
     // El grupo puede ser (A)ctivo/(P)asivo
     DBCBGrupo.Items.Clear;
     DBCBGrupo.Items.Add('A');
     DBCBGrupo.Items.Add('P');
  end;
  if (Balance >= 20) and (Balance < 30) then
  begin
     // El grupo puede ser (D)ebe/(H)aber
     DBCBGrupo.Items.Clear;
     DBCBGrupo.Items.Add('D');
     DBCBGrupo.Items.Add('H');
  end;
  if (Balance >= 30) then
  begin
     // El grupo puede ser (A)ctivo/(P)asivo
     DBCBGrupo.Items.Clear;
     DBCBGrupo.Items.Add('A');
     DBCBGrupo.Items.Add('P');
  end;

  G2kTableLoc.CondicionBusqueda := 'PAIS=''' + DMBalances.xBalancesPAIS.AsString + ''' AND BALANCE=' + DMBalances.xBalancesBALANCE.AsString;
end;

procedure TFMBalances.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMBalances.BusquedaCompleja;
  Continua := False;
end;

procedure TFMBalances.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMBalances.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMBalances.DBGBalanceDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMBalances.TButtRefrescarClick(Sender: TObject);
begin
  DMBalances.Refresca;
end;

procedure TFMBalances.ARenumeraExecute(Sender: TObject);
begin
  inherited;
  DMBalances.RenumeraBalances;
end;

procedure TFMBalances.AVisualizarDefBalanceExecute(Sender: TObject);
var
  Balance : integer;
  Pais : string;
begin
  inherited;
  Balance := DMBalances.xBalancesBALANCE.AsInteger;
  Pais := DMBalances.xBalancesPAIS.AsString;
  AbreData(TDMLstBalances, DMLstBalances);
  DMLstBalances.MostrarListado(Balance, DBEClave.Text, Pais, DBCBTipo.Text);
  CierraData(DMLstBalances);
end;

procedure TFMBalances.AConfDefBalanceExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstBalances, DMLstBalances);
  TFMListConfig.Create(Self).Muestra(160, formato, cabecera, copias,
     pijama, '', DMLstBalances.frBalances);
  CierraData(DMLstBalances);
end;

procedure TFMBalances.DBGFBalancesDetColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMBalances.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
