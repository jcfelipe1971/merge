unit UProFMLstHojaTrabajo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, DBCtrls, ULFDBEdit,
  ULFLabel, ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TProFMLstHojaTrabajo = class(TFPEditListadoSfg)
     PanelCentral: TLFPanel;
     LDesdeNroPedido: TLFLabel;
     LHastaNroPedido: TLFLabel;
     DBEPedidoRefD: TLFDbedit;
     DBEPedidoRefH: TLFDbedit;
     EFPedidoD: TLFEditFind2000;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     DBEDescClienteD: TLFDbedit;
     DBEDescClienteH: TLFDbedit;
     EFClienteD: TLFEditFind2000;
     EFPedidoH: TLFEditFind2000;
     EFClienteH: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFPedidoDChange(Sender: TObject);
     procedure EFPedidoHChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Recarga;
  end;

var
  ProFMLstHojaTrabajo : TProFMLstHojaTrabajo;

implementation

uses UFormGest, UProDMLstHojaTrabajo, UDMMain, UEntorno;

{$R *.dfm}

procedure TProFMLstHojaTrabajo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstHojaTrabajo, ProDMLstHojaTrabajo);

  Grupo := 8052;
  Listado := ProDMLstHojaTrabajo.frListadoHoja;

  Recarga;
end;

procedure TProFMLstHojaTrabajo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstHojaTrabajo);
end;

procedure TProFMLstHojaTrabajo.APrevExecute(Sender: TObject);
begin
  inherited;
  ProDMLstHojaTrabajo.Comentario := EComentario.Text;
  ProDMLstHojaTrabajo.FechaListado := TDPFechaListado.Date;
  ProDMLstHojaTrabajo.TFiltro := '';{' Orden: ' + EFOrd.Text + ' ' +
    DBEComD.Text + '  Desde Fase: ' + EFFaseD.Text +
    ' ' + DBEFaseD.Text + '  Hasta Fase: ' + EFFaseH.Text +
    ' ' + DBEFaseH.Text;              }

  ProDMLstHojaTrabajo.MostrarListado(0, StrToInt(EFPedidoD.Text), StrToInt(EFPedidoH.Text),
     StrToInt(EFClienteD.Text), StrToInt(EFClienteH.Text));
end;

procedure TProFMLstHojaTrabajo.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Recarga;
end;

procedure TProFMLstHojaTrabajo.Recarga;
begin
  ProDMLstHojaTrabajo.EntrePedidos;
  ProDMLstHojaTrabajo.EntreClientes;

  EComentario.Text := '';

  TDPFechaListado.Date := REntorno.FechaTrabSH;
end;

procedure TProFMLstHojaTrabajo.EFPedidoDChange(Sender: TObject);
begin
  inherited;
  ProDMLstHojaTrabajo.DescPedidoD(StrToInt(EFPedidoD.Text));
end;

procedure TProFMLstHojaTrabajo.EFPedidoHChange(Sender: TObject);
begin
  inherited;
  ProDMLstHojaTrabajo.DescPedidoH(StrToInt(EFPedidoH.Text));
end;

procedure TProFMLstHojaTrabajo.EFClienteDChange(Sender: TObject);
begin
  inherited;
  ProDMLstHojaTrabajo.DescClienteD(StrToInt(EFClienteD.Text));
end;

procedure TProFMLstHojaTrabajo.EFClienteHChange(Sender: TObject);
begin
  inherited;
  ProDMLstHojaTrabajo.DescClienteH(StrToInt(EFClienteH.Text));
end;

end.
