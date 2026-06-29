unit UFMTiposActuacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBMemo;

type
  TFMTiposActuacion = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     LDescripcion: TLFLabel;
     DBMDescripcion: TLFDBMemo;
     LHintDescripcion: TLFLabel;
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
  FMTiposActuacion : TFMTiposActuacion;

implementation

uses
  UDMTiposActuacion, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMTiposActuacion.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTiposActuacion, DMTiposActuacion);
  NavMain.DataSource := DMTiposActuacion.DSQMTiposActuacion;
  EPMain.DataSource := DMTiposActuacion.DSQMTiposActuacion;
  DBGMain.DataSource := DMTiposActuacion.DSQMTiposActuacion;
  G2kTableLoc.DataSource := DMTiposActuacion.DSQMTiposActuacion;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMTiposActuacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTiposActuacion);
end;

procedure TFMTiposActuacion.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMTiposActuacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposActuacion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposActuacion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
