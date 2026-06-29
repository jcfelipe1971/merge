unit UFMRelacionPedidosVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls, ULFComboBox,
  ULFEdit, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid;

type
  TFMRelacionPedidosVenta = class(TFPEditSimple)
     PNLFiltros: TLFPanel;
     DBGPedidos: THYTDBGrid;
     LPedido: TLFLabel;
     EDesdePedido: TLFEdit;
     EHastaPedido: TLFEdit;
     LSerie: TLFLabel;
     CBSeries: TLFComboBox;
     LCliente: TLFLabel;
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     EDesdeCliente: TLFEdit;
     EHastaCliente: TLFEdit;
     LEstado: TLFLabel;
     CBEstado: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
     procedure Filtrar(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRelacionPedidosVenta : TFMRelacionPedidosVenta;

implementation

uses
  UDMMain, UDMRelacionPedidosVenta, UEntorno, UFormGest, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFMRelacionPedidosVenta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRelacionPedidosVenta, DMRelacionPedidosVenta);
  NavMain.DataSource := DMRelacionPedidosVenta.DSQMPedidos;
  CEMain.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  RellenaSeries(CBSeries.Items);
  // Me posiciono en la serie por defecto (REntorno.Serie)
  CBSeries.ItemIndex := 0;
  while ((CBSeries.ItemIndex < CBSeries.Items.Count - 1) and
        (Copy(CBSeries.Items[CBSeries.ItemIndex], 1, Length(REntorno.Serie + ' ')) <> REntorno.Serie + ' ')) do
     CBSeries.ItemIndex := CBSeries.ItemIndex + 1;
  CBEstado.ItemIndex := 1;
  CBEstado.Text := CBEstado.Items[CBEstado.ItemIndex];
  Filtrar(nil);
end;

procedure TFMRelacionPedidosVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRelacionPedidosVenta);
end;

procedure TFMRelacionPedidosVenta.EFDesdeClienteChange(Sender: TObject);
begin
  inherited;
  EDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
  Filtrar(Sender);
end;

procedure TFMRelacionPedidosVenta.EFHastaClienteChange(Sender: TObject);
begin
  inherited;
  EHastaCliente.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
  Filtrar(Sender);
end;

procedure TFMRelacionPedidosVenta.Filtrar(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  if CBSeries.ItemIndex <= 0 then
     Serie := ''
  else
     Serie := Copy(CBSeries.Items[CBSeries.ItemIndex], 1, Length(REntorno.Serie + ' '));

  DMRelacionPedidosVenta.Filtrar(Serie, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), StrToIntDef(EDesdePedido.Text, 0), StrToIntDef(EHastaPedido.Text, 0), CBEstado.ItemIndex);
end;

end.
