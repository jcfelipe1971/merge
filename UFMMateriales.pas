unit UFMMateriales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMMateriales = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
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
  FMMateriales : TFMMateriales;

implementation

uses
  UDMMateriales, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMMateriales.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMateriales, DMMateriales);
  NavMain.DataSource := DMMateriales.DSQMMateriales;
  EPMain.DataSource := DMMateriales.DSQMMateriales;
  DBGMain.DataSource := DMMateriales.DSQMMateriales;
  G2kTableLoc.DataSource := DMMateriales.DSQMMateriales;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMMateriales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMMateriales);
end;

procedure TFMMateriales.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbEdit) then
  begin
     DBETipo.Color := clInfoBk;
     DBETipo.Font.Color := clGrayText;
     DBETipo.Enabled := False;
  end
  else
  begin
     DBETipo.Color := clWindow;
     DBETipo.Font.Color := clWindowText;
     DBETipo.Enabled := True;
  end;
end;

procedure TFMMateriales.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMateriales.BusquedaCompleja;
  Continua := False;
end;

procedure TFMMateriales.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
