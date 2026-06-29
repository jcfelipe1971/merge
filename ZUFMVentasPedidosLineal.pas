unit ZUFMVentasPedidosLineal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, UFPEditListado, ULFLabel, Mask, rxToolEdit, ULFDateEdit,
  UFPEditListadoSimple;

type
  TZFMVentasPedidosLineal = class(TFPEditListadoSimple)
     LfDesde: TLFDateEdit;
     LfHasta: TLFDateEdit;
     LbDesde: TLFLabel;
     LbHasta: TLFLabel;
     ToolButton1: TToolButton;
     PNLLimites: TPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ToolButton1Click(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     grupo: integer;
  end;

var
  ZFMVentasPedidosLineal : TZFMVentasPedidosLineal;

implementation

uses UDMMain, UEntorno, UFmain, UFMListConfig, ZUDMVentasPedidosLineal;

{$R *.dfm}

procedure TZFMVentasPedidosLineal.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMVentasPedidosLineal, ZDMVentasPedidosLineal);
  grupo := 9015;
end;

procedure TZFMVentasPedidosLineal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMVentasPedidosLineal);
end;

procedure TZFMVentasPedidosLineal.ToolButton1Click(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(grupo, Formato, Cabecera, Copias, Pijama, '', ZDMVentasPedidosLineal.frPedidosLineal);
end;

procedure TZFMVentasPedidosLineal.APrevExecute(Sender: TObject);
begin
  inherited;
  ZDMVentasPedidosLineal.MostrarListado(lfdesde.Date, lfhasta.Date, 0, grupo);
end;

procedure TZFMVentasPedidosLineal.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ZDMVentasPedidosLineal.MostrarListado(lfdesde.Date, lfhasta.Date, 0, grupo);
end;

end.
