unit UFMCaravanas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFormGest, StdCtrls, DBCtrls, rxToolEdit, RXDBCtrl,
  ULFDBEditFind2000, ULFDBMemo, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, ULFPanel,
  ULFEdit, ULFDBEdit, ULFLabel, ULFFormStorage, ActnList, ULFActionList,
  ULFToolBar, UG2kTBLoc, ULFPageControl, ULFDBDateEdit;

type
  TFMCaravanas = class(TFPEdit)
     LNroPedido: TLFLabel;
     LCliente: TLFLabel;
     LFechaEnvioSolicitado: TLFLabel;
     LFechaRecepcion: TLFLabel;
     LModelo: TLFLabel;
     LAnyo: TLFLabel;
     LNroPedidoHobby: TLFLabel;
     LNroOrdenConf: TLFLabel;
     LFechaPrevistaEntrega: TLFLabel;
     LFechaEntrega: TLFLabel;
     LBastidor: TLFLabel;
     LNroFacturaHobby: TLFLabel;
     DBEPedido: TLFDBEdit;
     DBEAno: TLFDBEdit;
     DBENroRHobby: TLFDBEdit;
     DBENroOrdenConf: TLFDBEdit;
     DBEImporte: TLFDBEdit;
     DBEPlan: TLFDBEdit;
     DBEBastidor: TLFDBEdit;
     DBENroFacHobby: TLFDBEdit;
     LImporte: TLFLabel;
     LPlan: TLFLabel;
     LAccesorios: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     DBDEFecEnvioSol: TLFDBDateEdit;
     DBDEFecRecepcionSol: TLFDBDateEdit;
     DBDEFecPrevEntrega: TLFDBDateEdit;
     DBDEFecEntrega: TLFDBDateEdit;
     DBEFModelo: TLFDBEditFind2000;
     DBMAccesorios: TLFDBMemo;
     ECliente: TLFEdit;
     EModelo: TLFEdit;
     PFiltros: TLFPanel;
     LFiltroPedido: TLFLabel;
     EFilPedido: TLFEdit;
     LFiltroCliente: TLFLabel;
     EFilCliente: TLFEdit;
     LFiltroModelo: TLFLabel;
     LFiltroBastidor: TLFLabel;
     EFilBastidor: TLFEdit;
     EFilModelo: TLFEdit;
     LFiltroFacturaHobby: TLFLabel;
     EFilFacHobby: TLFEdit;
     TButtBorraFiltro: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFModeloChange(Sender: TObject);
     procedure TButtBorraFiltroClick(Sender: TObject);
     procedure Filtra(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCaravanas : TFMCaravanas;

implementation

uses UDMCaravanas, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMCaravanas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCaravanas, DMCaravanas);
  NavMain.DataSource := DMCaravanas.DSxCaravana;
  DBGMain.DataSource := DMCaravanas.DSxCaravana;

  DBEFModelo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCaravanas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCaravanas);
end;

procedure TFMCaravanas.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFCliente.Text) > '') then
     ECliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0))
  else
     ECliente.Text := '';
end;

procedure TFMCaravanas.DBEFModeloChange(Sender: TObject);
begin
  inherited;
  EModelo.Text := DameTituloArticulo(DBEFModelo.Text);
end;

procedure TFMCaravanas.Filtra(Sender: TObject);
var
  s : string;
begin
  s := '';
  if (Trim(EFilPedido.Text) > '') then
     s := s + 'PEDIDO=' + EFilPedido.Text;
  if (Trim(EFilCliente.Text) > '') then
     if (s > '') then
        s := s + ' AND CLIENTE=' + EFilCliente.Text
     else
        s := s + 'CLIENTE=' + EFilCliente.Text;
  if (Trim(EFilModelo.Text) > '') then
     if (s > '') then
        s := s + ' AND MODELO=''' + EFilModelo.Text + ''''
     else
        s := s + 'MODELO=''' + EFilModelo.Text + '''';
  if (Trim(EFilBastidor.Text) > '') then
     if (s > '') then
        s := s + ' AND BASTIDOR=''' + EFilBastidor.Text + ''''
     else
        s := s + 'BASTIDOR=' + EFilBastidor.Text;
  if (Trim(EFilFacHobby.Text) > '') then
     if (s > '') then
        s := s + ' AND FACTURA=''' + EFilFacHobby.Text + ''''
     else
        s := s + 'FACTURA=''' + EFilFacHobby.Text + '''';
  if (s > '') then
     s := 'SELECT * FROM HOB_CARAVANAS WHERE ' + s + ' ORDER BY ID'
  else
     s := 'SELECT * FROM HOB_CARAVANAS ORDER BY ID';
  with DMCaravanas.xCaravana do
  begin
     Close;
     SelectSQL.Text := s;
     Open;
  end;
end;

procedure TFMCaravanas.TButtBorraFiltroClick(Sender: TObject);
begin
  inherited;
  EFilPedido.Text := '';
  EFilCliente.Text := '';
  EFilModelo.Text := '';
  EFilBastidor.Text := '';
  EFilFacHobby.Text := '';
end;

procedure TFMCaravanas.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  DMCaravanas.EnviarMail;
end;

procedure TFMCaravanas.TbuttCompClick(Sender: TObject);
begin
  DMCaravanas.Imprimir;
end;

end.
