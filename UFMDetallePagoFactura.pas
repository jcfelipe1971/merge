unit UFMDetallePagoFactura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEdit, ULFEditFind2000, rxToolEdit,
  ULFDateEdit, ULFLabel;

type
  TFMDetallePagoFactura = class(TFPEditSinNavegador)
     LTotalFactura: TLFLabel;
     LAnticipado: TLFLabel;
     LACobrar: TLFLabel;
     LResto: TLFLabel;
     DBETotalFactura: TLFDbedit;
     DBEAnticipado: TLFDbedit;
     DBEResto: TLFDbedit;
     DBECobrar: TLFDbedit;
     BCobrar: TButton;
     PNLCobro: TLFPanel;
     PNLDetalle: TLFPanel;
     DBGDetalleCartera: TDBGridFind2000;
     ToolButton1: TToolButton;
     TButtImprimir: TToolButton;
     TButtPrevisualizar: TToolButton;
     LFormaPago: TLFLabel;
     EFFormaPago: TLFEditFind2000;
     EComentario: TLFEdit;
     LComentario: TLFLabel;
     LAsignaVencimiento: TLFLabel;
     DEVencimiento: TLFDateEdit;
     BAsignaVencimiento: TButton;
     procedure FormCreate(Sender: TObject);
     procedure BCobrarClick(Sender: TObject);
     procedure TButtImprimirClick(Sender: TObject);
     procedure TButtPrevisualizarClick(Sender: TObject);
     procedure DBGDetalleCarteraBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BAsignaVencimientoClick(Sender: TObject);
  private
     { Private declarations }
     id_s: integer;
     Previsualizar, Imprimir: boolean;
  public
     { Public declarations }
     function PideDetalles(aid_s: integer): integer;
  end;

var
  FMDetallePagoFactura : TFMDetallePagoFactura;

implementation

uses UDMDetallePagoFactura, UFormGest, UDMMain, UEntorno, DB, DateUtils;

{$R *.dfm}

procedure TFMDetallePagoFactura.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDetallePagoFactura, DMDetallePagoFactura);
  Previsualizar := False;
  Imprimir := False;
  DEVencimiento.Date := Today;
end;

procedure TFMDetallePagoFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDetallePagoFactura);
end;

function TFMDetallePagoFactura.PideDetalles(aid_s: integer): integer;
begin
  id_s := aid_s;
  Result := 0;

  // Carga datos de factura y cartera
  DMDetallePagoFactura.Filtrar(id_s);

  // Verifica que la forma de pago pida detalles
  if (DMDetallePagoFactura.PedirDetallePago) then
  begin
     DBECobrar.SelectAll;

     // ShowModal para editar estos datos
     ShowModal;

     if (Previsualizar) then
        Result := 1;
     if (Imprimir) then
        Result := 2;

     Close;
  end;
end;

procedure TFMDetallePagoFactura.BCobrarClick(Sender: TObject);
begin
  inherited;
  // Pongo en estado de edicion para que tenga efecto el post y genere recibos
  if (DMDetallePagoFactura.QMCabecera.State = dsBrowse) then
     DMDetallePagoFactura.QMCabecera.Edit;

  DMDetallePagoFactura.FormaPago := EFFormaPago.Text;
  DMDetallePagoFactura.Observaciones := EComentario.Text;
  DMDetallePagoFactura.Filtrar(id_s);

  DBECobrar.SetFocus;
  DMDetallePagoFactura.QMCabecera.Refresh;
  DBECobrar.SelectAll;
end;

procedure TFMDetallePagoFactura.TButtImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir := True;
  ModalResult := mrOk;
end;

procedure TFMDetallePagoFactura.TButtPrevisualizarClick(Sender: TObject);
begin
  inherited;
  Previsualizar := True;
  ModalResult := mrOk;
end;

procedure TFMDetallePagoFactura.DBGDetalleCarteraBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end
     else
     if Trim(TablaABuscar) = 'SYS_TIPO_EFECTO' then
     begin
        CondicionBusqueda := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end;
  end;
end;

procedure TFMDetallePagoFactura.BAsignaVencimientoClick(Sender: TObject);
begin
  inherited;
  DMDetallePagoFactura.AsignaVencimiento(DEVencimiento.Date);
end;

end.
