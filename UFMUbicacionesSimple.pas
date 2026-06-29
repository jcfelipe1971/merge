unit UFMUbicacionesSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMUbicacionesSimple = class(TFPEdit)
     LID: TLFLabel;
     LTitulo: TLFLabel;
     DBIDUbicacionSimple: TLFDbedit;
     DBTitulo: TLFDbedit;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMUbicacionesSimple : TFMUbicacionesSimple;

implementation

uses UDMUbicacionesSimple, UFormGest, uUtiles;

{$R *.dfm}

procedure TFMUbicacionesSimple.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUbicacionesSimple.BusquedaCompleja;
  Continua := False;

  // Color campo ID
  ColorCampoID(DBIDUbicacionSimple);
end;

procedure TFMUbicacionesSimple.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMUbicacionesSimple.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMUbicacionesSimple, DMUbicacionesSimple);
  NavMain.DataSource := DMUbicacionesSimple.DSQMUbicacionesSimple;
  EPMain.DataSource := DMUbicacionesSimple.DSQMUbicacionesSimple;
  DBGMain.DataSource := DMUbicacionesSimple.DSQMUbicacionesSimple;
  G2kTableLoc.DataSource := DMUbicacionesSimple.DSQMUbicacionesSimple;
end;

end.
