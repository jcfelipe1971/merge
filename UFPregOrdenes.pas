unit UFPregOrdenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, Spin, rxToolEdit,
  ULFCheckBox, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, ULFEdit, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregOrdenes = class(TFPEditListadoSimple)
     LBLEscandallo: TLFLabel;
     LBLOrden: TLFLabel;
     LBLCantidad: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     EFOrden: TLFEditFind2000;
     AConfiguracion: TAction;
     TButtConf: TToolButton;
     Label1: TLFLabel;
     DTPFecha: TLFDateEdit;
     Label2: TLFLabel;
     EFArticulo: TLFEditFind2000;
     SpinEscandallo: TSpinEdit;
     Label3: TLFLabel;
     SpinPedido: TSpinEdit;
     EFOrdenH: TLFEditFind2000;
     DTPFechaH: TLFDateEdit;
     EFAlmacenH: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     SpinEscandalloH: TSpinEdit;
     SpinPedidoH: TSpinEdit;
     Label4: TLFLabel;
     Label5: TLFLabel;
     Label6: TLFLabel;
     Label7: TLFLabel;
     Label8: TLFLabel;
     Label9: TLFLabel;
     Label10: TLFLabel;
     Label11: TLFLabel;
     Label12: TLFLabel;
     Label13: TLFLabel;
     Label14: TLFLabel;
     Label15: TLFLabel;
     CBOrden: TLFCheckBox;
     CBFecha: TLFCheckBox;
     CBAlmacen: TLFCheckBox;
     CBArticulo: TLFCheckBox;
     CBEscandallo: TLFCheckBox;
     CBPedido: TLFCheckBox;
     LCantidad: TLFLabel;
     ECantidad: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AConfiguracionExecute(Sender: TObject);
     procedure EFArticuloBusqueda(Sender: TObject);
  private
     { Private declarations }
     ListadoCodBarras: boolean;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(orden: string);
     procedure MuestraCodBarras(orden: string);
  end;

var
  FPregOrdenes : TFPregOrdenes;

implementation

uses UDMLstNecesidades, UFormGest, UEntorno, UDMMain, UFMListConfig;

{$R *.DFM}

procedure TFPregOrdenes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstNecesidades, DMLstNecesidades);

  Grupo := 105;
  Listado := DMLstNecesidades.frNecesidades;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregOrdenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstNecesidades);
end;

procedure TFPregOrdenes.Muestra(orden: string);
begin
  EFOrden.Text := orden;
  EFOrdenH.Text := orden;
  DTPFecha.Date := REntorno.FechaTrabSH;
  DTPFechaH.Date := REntorno.FechaTrabSH;
  ListadoCodBarras := False;
  FPregOrdenes.Caption := 'Listado de Ordenes';
  LCantidad.Visible := False;
  ECantidad.Visible := False;
  ShowModal;
end;

procedure TFPregOrdenes.MuestraCodBarras(orden: string);
begin
  EFOrden.Text := orden;
  EFOrdenH.Text := orden;
  DTPFecha.Date := REntorno.FechaTrabSH;
  DTPFechaH.Date := REntorno.FechaTrabSH;
  ListadoCodBarras := True;
  FPregOrdenes.Caption := 'Listado de Códigos de Barras de Ordenes';
  LCantidad.Visible := True;
  ECantidad.Visible := True;
  ShowModal;
end;

procedure TFPregOrdenes.AConfiguracionExecute(Sender: TObject);
begin
  Grupo := 0;
  if (not ListadoCodBarras) then
     Grupo := 105
  else
     Grupo := 5103;

  inherited;
end;

procedure TFPregOrdenes.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregOrdenes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Orden, fecha, almacen, articulo, escandallo, pedido : smallint;
begin
  if (CBOrden.Checked) then
     orden := 1
  else
     orden := 0;
  if (CBfecha.Checked) then
     fecha := 1
  else
     fecha := 0;
  if (CBAlmacen.Checked) then
     almacen := 1
  else
     almacen := 0;
  if (CBArticulo.Checked) then
     articulo := 1
  else
     articulo := 0;
  if (CBEscandallo.Checked) then
     escandallo := 1
  else
     escandallo := 0;
  if (CBPedido.Checked) then
     pedido := 1
  else
     pedido := 0;

  if (not ListadoCodBarras) then
     DMLstNecesidades.PreparaListadoOrd(orden, fecha, almacen, articulo, escandallo, pedido,
        EFOrden.Text, EFOrdenH.Text, DTPFecha.Date, DTPFechaH.Date,
        EFAlmacen.Text, EFAlmacenH.Text,
        EFArticulo.Text, EFarticuloH.Text, SpinEscandallo.Value,
        SpinEscandalloH.Value, SpinPedido.Value, SpinPedidoH.Value, Modo, StrToIntDef(ECantidad.Text, 1))
  else
     DMLstNecesidades.PreparaListadoCodBarras(orden, fecha, almacen, articulo, escandallo, pedido,
        EFOrden.Text, EFOrdenH.Text, DTPFecha.Date, DTPFechaH.Date,
        EFAlmacen.Text, EFAlmacenH.Text,
        EFArticulo.Text, EFarticuloH.Text, SpinEscandallo.Value,
        SpinEscandalloH.Value, SpinPedido.Value, SpinPedidoH.Value, Modo, StrToIntDef(ECantidad.Text, 1));
end;

end.
