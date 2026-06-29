unit ZUFMArticulos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, ULFLabel, Mask, DBCtrls,
  ULFDBEdit, ULFEdit, UFPEditDetalle;

type
  TZFMArticulos = class(TFPEditDetalle)
     DBEArticulo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LArticulo: TLFLabel;
     LPrecioVenta: TLFLabel;
     DBEPVenta: TLFDbedit;
     LStock: TLFLabel;
     DBEStockCab: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMArticulos : TZFMArticulos;

implementation

uses ZUDMArticulos, UFormGest, UDMMain;

{$R *.dfm}

procedure TZFMArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMArticulos, ZDMArticulos);

  NavMain.DataSource := ZDMArticulos.DSQMArticulos;
  DBGMain.DataSource := ZDMArticulos.DSQMArticulos;
  G2KTableLoc.Base_de_datos := DMMain.DataBase;
  G2KTableLoc.DataSource := ZDMArticulos.DSQMArticulos;
end;

procedure TZFMArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMArticulos);
end;

procedure TZFMArticulos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TZFMArticulos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMArticulos.BusquedaCompleja;
end;

procedure TZFMArticulos.TbuttCompClick(Sender: TObject);
begin
  inherited;
  ZDMArticulos.AbreDetalle;
end;

end.
