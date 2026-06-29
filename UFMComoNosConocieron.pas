unit UFMComoNosConocieron;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMComoNosConocieron = class(TFPEdit)
     DBEModo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LModo: TLFLabel;
     LTitulo: TLFLabel;
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
  FMComoNosConocieron : TFMComoNosConocieron;

implementation

uses
  UDMComoNosConocieron, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMComoNosConocieron.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMComoNosConocieron, DMComoNosConocieron);
  NavMain.DataSource := DMComoNosConocieron.DSQMComoNosConocieron;
  EPMain.DataSource := DMComoNosConocieron.DSQMComoNosConocieron;
  DBGMain.DataSource := DMComoNosConocieron.DSQMComoNosConocieron;
  G2kTableLoc.DataSource := DMComoNosConocieron.DSQMComoNosConocieron;

  // Color campo ID
  ColorCampoID(DBEModo);
end;

procedure TFMComoNosConocieron.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMComoNosConocieron);
end;

procedure TFMComoNosConocieron.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbEdit) then
  begin
     DBEModo.Color := clInfoBk;
     DBEModo.Font.Color := clGrayText;
     DBEModo.Enabled := False;
  end
  else
  if (Button = nbInsert) then
  begin
     DBEModo.Color := clWindow;
     DBEModo.Font.Color := clWindowText;
     DBEModo.Enabled := True;
  end
  else
     ColorCampoID(DBEModo);
end;

procedure TFMComoNosConocieron.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMComoNosConocieron.BusquedaCompleja;
  Continua := False;
end;

procedure TFMComoNosConocieron.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
