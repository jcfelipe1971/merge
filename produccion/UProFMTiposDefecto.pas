unit UProFMTiposDefecto;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TProFMTiposDefecto = class(TFPEdit)
     LDefecto: TLFLabel;
     LDescripcion: TLFLabel;
     LFDBCodigo: TLFDbedit;
     LFDBDescDefecto: TLFDbedit;
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
  ProFMTiposDefecto : TProFMTiposDefecto;

implementation

uses UProDMTiposDefecto, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMTiposDefecto.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTiposDefecto, ProDMTiposDefecto);
  NavMain.DataSource := ProDMTiposDefecto.DSQMDefecto;
  EPMain.DataSource := ProDMTiposDefecto.DSQMDefecto;
  DBGMain.DataSource := ProDMTiposDefecto.DSQMDefecto;
  G2kTableLoc.DataSource := ProDMTiposDefecto.DSQMDefecto;
end;

procedure TProFMTiposDefecto.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  ProDMTiposDefecto.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMTiposDefecto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMTiposDefecto);
  Action := caFree;
end;

procedure TProFMTiposDefecto.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
