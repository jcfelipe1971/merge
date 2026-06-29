unit UFMTiposDir;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, URecursos, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  NsDBGrid, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTiposDir = class(TFPEdit)
     DBTipo: THYDBEdit;
     DBTitulo: THYDBEdit;
     LBTipo: TLFLabel;
     LBTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTiposDir : TFMTiposDir;

implementation

uses UDMMain, UDMTiposDir, UFormGest;

{$R *.DFM}

procedure TFMTiposDir.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTiposDir, DMTiposDir);
  NavMain.DataSource := DMTiposDir.DSQMTiposDir;
  DBGMain.DataSource := DMTiposDir.DSQMTiposDir;
  G2kTableLoc.DataSource := DMTiposDir.DSQMTiposDir;
end;

procedure TFMTiposDir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTiposDir);
end;

procedure TFMTiposDir.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBTipo.Enabled := False;
     DBTipo.ReadOnly := True;
     DBTipo.Color := clInfoBk;
     DBTipo.Font.Color := clGrayText;
  end
  else
  begin
     DBTipo.Enabled := True;
     DBTipo.ReadOnly := False;
     DBTipo.Color := clWindow;
     DBTipo.Font.Color := clWindowText;
  end;
end;

procedure TFMTiposDir.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposDir.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposDir.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
