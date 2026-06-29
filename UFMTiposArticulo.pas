unit UFMTiposArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTiposArticulo = class(TFPEdit)
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
  FMTiposArticulo : TFMTiposArticulo;

implementation

uses
  UDMTiposArticulo, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMTiposArticulo.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTiposArticulo, DMTiposArticulo);
  NavMain.DataSource := DMTiposArticulo.DSQMTiposArticulo;
  EPMain.DataSource := DMTiposArticulo.DSQMTiposArticulo;
  DBGMain.DataSource := DMTiposArticulo.DSQMTiposArticulo;
  G2kTableLoc.DataSource := DMTiposArticulo.DSQMTiposArticulo;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMTiposArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTiposArticulo);
end;

procedure TFMTiposArticulo.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMTiposArticulo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposArticulo.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposArticulo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
