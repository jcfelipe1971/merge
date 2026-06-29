unit UFMBalancesCab;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMBalancesCAB = class(TFPEdit)
     LBalance: TLFLabel;
     DBEBalance: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBRGTipo: TDBRadioGroup;
     ARegenera: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBCBActivo: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure ARegeneraExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMBalancesCAB : TFMBalancesCAB;

implementation

uses UDMBalances, UDMMain, UFormGest, UFReplicaBalance, UUtiles, UEntorno;

{$R *.DFM}

procedure TFMBalancesCAB.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMBalances, DMBalances);
  DMBalances.AbreCab;
  NavMain.DataSource := DMBalances.DSQMBalancesCAB;
  DBGMain.DataSource := DMBalances.DSQMBalancesCAB;
  G2kTableLoc.DataSource := DMBalances.DSQMBalancesCAB;
  G2kTableLoc.CondicionBusqueda := 'PAIS = ''' + REntorno.Pais + '''';
  CEMainPMEdit.Teclas := DMMain.Teclas;

  // Color campo ID
  ColorCampoID(DBEBalance);
end;

procedure TFMBalancesCAB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMBalances);
end;

procedure TFMBalancesCAB.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbInsert) then
     TFReplicaBalance.Create(Self).Muestra;
  Continua := True;
end;

procedure TFMBalancesCAB.ARegeneraExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
  begin
     Screen.Cursor := crHourGlass;
     DMBalances.Regenera;
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMBalancesCAB.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
