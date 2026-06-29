unit UFMLstPedidoRentabilidad;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFLabel, UFPEditListado,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, DBCtrls,
  ULFDBEdit, Fr_HYReport, Grids, DBGrids, NsDBGrid, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFMLstPedidoRentabilidad = class(TFPEditListadoSimple)
     PNLFiltros: TLFPanel;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TDateEdit;
     DTPHasta: TDateEdit;
     GBPedido: TGroupBox;
     LDesdePedido: TLFLabel;
     LHastaPedido: TLFLabel;
     LFPedidoD: TLFEditFind2000;
     LFPedidoH: TLFEditFind2000;
     GBCliente: TGroupBox;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EClienteDesde: TLFEdit;
     EClienteHasta: TLFEdit;
     LFClienteD: TLFEditFind2000;
     LFClienteH: TLFEditFind2000;
     TButtConfRapida: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure LFClienteDChange(Sender: TObject);
     procedure LFClienteHChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure LFPedidoDBusqueda(Sender: TObject);
     procedure TButtRecargarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLstPedidoRentabilidad : TFMLstPedidoRentabilidad;

implementation

uses UDMMain, UDMLstPedidoRentabilidad, UFormGest, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMLstPedidoRentabilidad.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPedidoRentabilidad, DMLstPedidoRentabilidad);

  Grupo := 9014;
  Listado := DMLstPedidoRentabilidad.frPedidoRentabilidad;
end;

procedure TFMLstPedidoRentabilidad.LFClienteDChange(Sender: TObject);
begin
  inherited;
  EClienteDesde.Text := DameTituloCliente(StrToIntDef(LFClienteD.Text, 0));
end;

procedure TFMLstPedidoRentabilidad.LFClienteHChange(Sender: TObject);
begin
  inherited;
  EClienteHasta.Text := DameTituloCliente(StrToIntDef(LFClienteH.Text, 0));
end;

procedure TFMLstPedidoRentabilidad.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLstPedidoRentabilidad.MostrarListado(0, StrToInt(LFPedidoD.Text), StrToInt(LFPedidoH.Text),
     StrToInt(LFClienteD.Text), StrToInt(LFClienteH.Text), DTPDesde.Date, DTPHasta.Date);
end;

procedure TFMLstPedidoRentabilidad.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstPedidoRentabilidad.MostrarListado(1, StrToInt(LFPedidoD.Text), StrToInt(LFPedidoH.Text),
     StrToInt(LFClienteD.Text), StrToInt(LFClienteH.Text), DTPDesde.Date, DTPHasta.Date);
end;

procedure TFMLstPedidoRentabilidad.LFPedidoDBusqueda(Sender: TObject);
begin
  inherited;
  LFPedidoD.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
     REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
end;

procedure TFMLstPedidoRentabilidad.TButtRecargarClick(Sender: TObject);
var
  Min, Max : integer;
  MinD, MaxD : TDateTime;
begin
  inherited;
  DameMinMax('CLI', Min, Max);
  LFClienteD.Text := IntToStr(Min);
  LFClienteH.Text := IntToStr(Min);

  DameMinMax('EJE', MinD, MaxD);
  DTPDesde.Date := MinD;
  DTPHasta.Date := MaxD;
end;

end.
