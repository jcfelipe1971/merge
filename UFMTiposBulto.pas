unit UFMTiposBulto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTiposBulto = class(TFPEdit)
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
  FMTiposBulto : TFMTiposBulto;

implementation

uses
  UDMTiposBulto, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMTiposBulto.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTiposBulto, DMTiposBulto);
  NavMain.DataSource := DMTiposBulto.DSQMTiposBulto;
  EPMain.DataSource := DMTiposBulto.DSQMTiposBulto;
  DBGMain.DataSource := DMTiposBulto.DSQMTiposBulto;
  G2kTableLoc.DataSource := DMTiposBulto.DSQMTiposBulto;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMTiposBulto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTiposBulto);
end;

procedure TFMTiposBulto.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMTiposBulto.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposBulto.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposBulto.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
