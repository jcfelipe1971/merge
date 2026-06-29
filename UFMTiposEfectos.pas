unit UFMTiposEfectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  DbComboBoxValue;

type
  TFMTiposEfectos = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     CBTipoEfectoFacturaE: TDBComboBoxValue;
     LTipoEfectoFacturaE: TLFLabel;
     LMedioPagoFacturaECL: TLFLabel;
     DBCBMedioPagoFacturaECL: TDBComboBoxValue;
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
  FMTiposEfectos : TFMTiposEfectos;

implementation

uses
  UDMTiposEfectos, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMTiposEfectos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTiposEfectos, DMTiposEfectos);
  NavMain.DataSource := DMTiposEfectos.DSQMTiposEfectos;
  EPMain.DataSource := DMTiposEfectos.DSQMTiposEfectos;
  DBGMain.DataSource := DMTiposEfectos.DSQMTiposEfectos;
end;

procedure TFMTiposEfectos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTiposEfectos);
end;

procedure TFMTiposEfectos.NavMainClick(Sender: TObject; Button: TNavigateBtn);
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

procedure TFMTiposEfectos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposEfectos.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposEfectos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
