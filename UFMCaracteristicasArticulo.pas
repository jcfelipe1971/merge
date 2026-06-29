unit UFMCaracteristicasArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMCaracteristicasArticulo = class(TFPEdit)
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
  FMCaracteristicasArticulo : TFMCaracteristicasArticulo;

implementation

uses
  UDMCaracteristicasArticulo, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMCaracteristicasArticulo.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMCaracteristicasArticulo, DMCaracteristicasArticulo);
  NavMain.DataSource := DMCaracteristicasArticulo.DSQMCaracteristicasArticulo;
  EPMain.DataSource := DMCaracteristicasArticulo.DSQMCaracteristicasArticulo;
  DBGMain.DataSource := DMCaracteristicasArticulo.DSQMCaracteristicasArticulo;
  G2kTableLoc.DataSource := DMCaracteristicasArticulo.DSQMCaracteristicasArticulo;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMCaracteristicasArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMCaracteristicasArticulo);
end;

procedure TFMCaracteristicasArticulo.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMCaracteristicasArticulo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCaracteristicasArticulo.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCaracteristicasArticulo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
