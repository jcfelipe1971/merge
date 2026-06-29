unit UFMTiposReparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTiposReparacion = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTipo: TLFLabel;
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
  FMTiposReparacion : TFMTiposReparacion;

implementation

uses
  UDMTiposReparacion, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMTiposReparacion.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTiposReparacion, DMTiposReparacion);
  NavMain.DataSource := DMTiposReparacion.DSQMTiposReparacion;
  EPMain.DataSource := DMTiposReparacion.DSQMTiposReparacion;
  DBGMain.DataSource := DMTiposReparacion.DSQMTiposReparacion;
  G2kTableLoc.DataSource := DMTiposReparacion.DSQMTiposReparacion;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMTiposReparacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTiposReparacion);
end;

procedure TFMTiposReparacion.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMTiposReparacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposReparacion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposReparacion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
