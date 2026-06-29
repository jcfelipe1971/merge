unit UFMDivisionesMaestro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit;

type
  TFMDivisionesMaestro = class(TFPEdit)
     DBEDivision: TLFDbedit;
     DBETitulo: TLFDbedit;
     LDivision: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMDivisionesMaestro : TFMDivisionesMaestro;

implementation

uses UDMDivisionesMaestro, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TFMDivisionesMaestro.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDivisionesMaestro, DMDivisionesMaestro);
  NavMain.DataSource := DMDivisionesMaestro.DSQMDivisiones;
  DBGMain.DataSource := DMDivisionesMaestro.DSQMDivisiones;

  // Color campo ID
  ColorCampoID(DBEDivision);
end;

procedure TFMDivisionesMaestro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDivisionesMaestro);
end;

procedure TFMDivisionesMaestro.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMDivisionesMaestro.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMDivisionesMaestro.BusquedaCompleja;
  Continua := False;
end;

procedure TFMDivisionesMaestro.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBEDivision.Enabled := False;
     DBEDivision.Color := clInfoBk;
  end
  else
  begin
     DBEDivision.Enabled := True;
     DBEDivision.Color := clWindow;
  end;
end;

end.
