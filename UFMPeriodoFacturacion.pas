unit UFMPeriodoFacturacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMPeriodoFacturacion = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LPeriodo: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPeriodoFacturacion : TFMPeriodoFacturacion;

implementation

uses
  UDMPeriodoFacturacion, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMPeriodoFacturacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPeriodoFacturacion, DMPeriodoFacturacion);
  NavMain.DataSource := DMPeriodoFacturacion.DSQMPeriodoFacturacion;
  EPMain.DataSource := DMPeriodoFacturacion.DSQMPeriodoFacturacion;
  DBGMain.DataSource := DMPeriodoFacturacion.DSQMPeriodoFacturacion;
end;

procedure TFMPeriodoFacturacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPeriodoFacturacion);
end;

procedure TFMPeriodoFacturacion.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMPeriodoFacturacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPeriodoFacturacion.BusquedaCompleja;
  Continua := False;
end;

end.
