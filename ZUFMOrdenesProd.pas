unit ZUFMOrdenesProd;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, UFIBDBEditfind, DB,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UDBDateTimePicker, ActnList,
  rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFEditFind2000, UG2kTBLoc, ULFLabel;

type
  TZFMOrdenesProd = class(TFPEdit)
     DBERig: TLFDbedit;
     DBETitSerie: TLFDbedit;
     EFSerie: TLFEditFind2000;
     LSerie: TLFLabel;
     DBETitCliente: TLFDbedit;
     DBETitDirec: TLFDbedit;
     DBETitArticulo: TLFDbedit;
     DBETitEstado: TLFDbedit;
     DBETitMaquina: TLFDbedit;
     EFCliente: TLFDBEditFind2000;
     EFDirCliente: TLFDBEditFind2000;
     EFArticulo: TLFDBEditFind2000;
     EFEstado: TLFDBEditFind2000;
     EFMaquina: TLFDBEditFind2000;
     LblRIG: TLFLabel;
     LblEstado: TLFLabel;
     LblCliente: TLFLabel;
     LblDireccionEntrega: TLFLabel;
     LblMaquina: TLFLabel;
     LblArticulo: TLFLabel;
     LblFechaEmision: TLFLabel;
     LblFechaEntrega: TLFLabel;
     LblfechaFabricacion: TLFLabel;
     TSNotas: TTabSheet;
     PNotas: TLFPanel;
     LCantidad: TLFLabel;
     DBECantidad: TLFDbedit;
     LPrecio: TLFLabel;
     DBEPrecio: TLFDbedit;
     LblGastosIniciales: TLFLabel;
     DBEGastosIniciales: TLFDbedit;
     TBNotas: TLFToolBar;
     PNLNotas: TLFPanel;
     DBRigNotas: TLFDbedit;
     DBArtDescNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     DBMemoNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LblSuReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     LblZ_codigo_cliente: TLFLabel;
     DBEz_codigo_cliente: TLFDbedit;
     DBCBPublicarWeb: TLFDBCheckBox;
     DBECantGastEspeciales: TLFDbedit;
     LblCantGastEspeciales: TLFLabel;
     LPedido: TLFLabel;
     LLinea: TLFLabel;
     DBEFPedido: TLFDBEditFind2000;
     DBEFLinea: TLFDBEditFind2000;
     ToolButton2: TToolButton;
     ActionList1: TActionList;
     DBEFLineaGastosIni: TLFDBEditFind2000;
     LLineaGastosIni: TLFLabel;
     DBEFArticuloGtosIni: TLFDBEditFind2000;
     DBETitArticuloGtosIni: TLFDbedit;
     LPrecioGastosIni: TLFLabel;
     DBEPrecioGtosIni: TLFDbedit;
     GBDatosExpedicion: TGroupBox;
     LblTransportista: TLFLabel;
     LblFechaEnvio: TLFLabel;
     LNumExpedicion: TLFLabel;
     EFTransportista: TLFDBEditFind2000;
     DBETitTransportista: TLFDbedit;
     DBENumExpedicion: TLFDbedit;
     DBDEFechaEnvio: TLFDBDateEdit;
     DBDEFechaEmision: TLFDBDateEdit;
     DBDEFechaEntrega: TLFDBDateEdit;
     DBDEFechaFabricacion: TLFDBDateEdit;
     AListados: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ToolButton1: TToolButton;
     PNLSerie: TLFPanel;
     procedure EFSerieChange(Sender: TObject);
     procedure EFDirClienteBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSNotasShow(Sender: TObject);
     procedure LineaGastosIniBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure LineaBusqueda(Sender: TObject);
     procedure EFTransportistaChange(Sender: TObject);
     procedure AListadosExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EFEstadoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMOrdenesProd : TZFMOrdenesProd;

implementation

uses ZUDMOrdenesProd, UDMMain, UFormGest, UEntorno, FIBDataSetRO,
  ZUFMLstOrdenes;

{$R *.DFM}

procedure TZFMOrdenesProd.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMOrdenesProd, ZDMOrdenesProd);

  NavMain.DataSource := ZDMOrdenesProd.DSQMOrdProd;
  EPMain.DataSource := ZDMOrdenesProd.DSQMOrdProd;
  DBGMain.DataSource := ZDMOrdenesProd.DSQMOrdProd;
  G2KTableLoc.DataSource := ZDMOrdenesProd.DSQMOrdProd;
  EFSerie.Text := REntorno.Serie;
end;

procedure TZFMOrdenesProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMOrdenesProd);
  Application.ProcessMessages;
end;

procedure TZFMOrdenesProd.EFSerieChange(Sender: TObject);
begin
  if EFSerie.Text <> '' then
  begin
     ZDMOrdenesProd.CambiaSerie(EFSerie.Text);
     G2KTableLoc.CondicionBusqueda := 'TIPO=''ZOF'' AND SERIE=''' + EFSerie.Text + '''';
  end;
end;

procedure TZFMOrdenesProd.EFDirClienteBusqueda(Sender: TObject);
begin
  EFDirCliente.CondicionBusqueda := 'TERCERO=' + IntToStr(ZDMOrdenesProd.QMOrdProdTERCERO.AsInteger);
end;

procedure TZFMOrdenesProd.TSNotasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotas;
  PNotas.Enabled := False;
end;

procedure TZFMOrdenesProd.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMOrdenesProd.BusquedaCompleja;
end;

procedure TZFMOrdenesProd.LineaGastosIniBusqueda(Sender: TObject);
begin
  inherited;
  if (ZDMOrdenesProd.QMOrdProdPEDIDO.AsString <> '') then
     TDBEditFind2000(Sender).CondicionBusqueda := 'rig=' + ZDMOrdenesProd.QMOrdProdPEDIDO.AsString;
end;

procedure TZFMOrdenesProd.LineaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFLinea.CondicionBusqueda := 'rig=' + ZDMOrdenesProd.QMOrdProdPEDIDO.AsString +
     ' AND linea NOT IN (SELECT linea FROM z_ges_ordprod_c WHERE empresa=' + REntorno.EmpresaStr +
     ' AND ejercicio=' + REntorno.EjercicioStr + ' AND canal=' + REntorno.CanalStr +
     ' AND serie=''' + EFSerie.Text + ''' AND pedido=' + ZDMOrdenesProd.QMOrdProdPEDIDO.AsString + ')';
end;

procedure TZFMOrdenesProd.EFTransportistaChange(Sender: TObject);
begin
  inherited;
  ZDMOrdenesProd.Transportista := StrToIntDef(EFTransportista.Text, 0);
end;

procedure TZFMOrdenesProd.AListadosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstOrdenes, ZFMLstOrdenes);
  ZFMLstOrdenes.ShowRig(DBERig.Text);
end;

procedure TZFMOrdenesProd.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TZFMOrdenesProd.EFEstadoChange(Sender: TObject);
begin
  inherited;
  GBDatosExpedicion.Enabled := EFEstado.Text = 'EX';
end;

end.
