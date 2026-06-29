unit UProFMTurnos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TProFMTurnos = class(TFPEdit)
     LTurno: TLFLabel;
     LDescripcion: TLFLabel;
     LFDBTurno: TLFDbedit;
     LFDBDescTurno: TLFDbedit;
     LFLOrden: TLFLabel;
     LFDOrden: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTurnos : TProFMTurnos;

implementation

uses UProDMTurnos, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMTurnos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTurnos, ProDMTurnos);
  NavMain.DataSource := ProDMTurnos.DSQMTurno;
  EPMain.DataSource := ProDMTurnos.DSQMTurno;
  DBGMain.DataSource := ProDMTurnos.DSQMTurno;
  G2kTableLoc.DataSource := ProDMTurnos.DSQMTurno;
end;

procedure TProFMTurnos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  ProDMTurnos.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMTurnos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMTurnos);
  Action := caFree;
end;

procedure TProFMTurnos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
