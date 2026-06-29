unit UIsoFMAccionesTipo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TIsoFMAccionesTipo = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMAccionesTipo : TIsoFMAccionesTipo;

implementation

uses UFormGest, UDMMain, UIsoDMAccionesTipo;

{$R *.DFM}

procedure TIsoFMAccionesTipo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMAccionesTipo, IsoDMAccionesTipo);
  NavMain.DataSource := IsoDMAccionesTipo.DSQMAccionesTipo;
  DBGMain.DataSource := IsoDMAccionesTipo.DSQMAccionesTipo;
end;

procedure TIsoFMAccionesTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMAccionesTipo);
end;

procedure TIsoFMAccionesTipo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMAccionesTipo.BusquedaCompleja;
  Continua := False;
end;

procedure TIsoFMAccionesTipo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
