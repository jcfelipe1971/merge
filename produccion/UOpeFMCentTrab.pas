unit UOpeFMCentTrab;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel,
  ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TOpeFMCentTrab = class(TFPEdit)
     LCentro: TLFLabel;
     DBECentro: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescrip: TLFDbedit;
     LSeccion: TLFLabel;
     EFSeccion: TLFDBEditFind2000;
     ESeccionTitulo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSeccionChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMCentTrab : TOpeFMCentTrab;

implementation

uses UOpeDMCentTrab, UFormGest, UDMMain;

{$R *.DFM}

procedure TOpeFMCentTrab.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(Topedmcenttrab, OpeDMCentTrab);
  NavMain.DataSource := OpeDMCentTrab.DSQMCentroTrabajo;
  EPMain.DataSource := OpeDMCentTrab.DSQMCentroTrabajo;
  DBGMain.DataSource := OpeDMCentTrab.DSQMCentroTrabajo;
  G2kTableLoc.DataSource := OpeDMCentTrab.DSQMCentroTrabajo;
end;

procedure TOpeFMCentTrab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMCentTrab);
end;

procedure TOpeFMCentTrab.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMCentTrab.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMCentTrab.EFSeccionChange(Sender: TObject);
begin
  inherited;
  ESeccionTitulo.Text := OpeDMCentTrab.DameTituloSeccion(EFSeccion.Text);
end;

procedure TOpeFMCentTrab.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
