unit UProFMArticulosAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, ULFLabel, Mask, DBCtrls,
  ULFDBEdit, ULFDBEditFind2000, ULFEdit, ULFEditFind2000, ULFDBMemo, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit, UHYDescription, ULFHYDBDescription,
  DbComboBoxValue, Buttons, DB, UDBDateTimePicker,
  TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox,
  Fr_HYReport; //SFG_JLA_PRODUCCION

type
  TProFMArticulosAlmacenes = class(TFPEdit)
     DBEArticulo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LArticulo: TLFLabel;
     LPrecioVenta: TLFLabel;
     DBEPVenta: TLFDbedit;
     PnlDet: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetStocks: THYMNavigator;
     DBGFDetStocks: TDBGridFind2000;
     CEDetStocks: TControlEdit;
     CEDetStocksPMEdit: TPopUpTeclas;
     LFCategoryAction1: TLFCategoryAction;
     EArticulo: TLFEdit;
     TButtImagenesArticulo: TToolButton;
     LBLTarifa: TLFLabel;
     LFLabel4: TLFLabel;
     LFETarifa: TLFEditFind2000;
     DBETitTarifa: TLFDbedit;
     TButtFicherosDePedidoDeCliente: TToolButton;
     SBAArticulo: TSpeedButton;
     ALArticulosAlmacen: TLFActionList;
     AArticulos: TAction;
     TButtInfoStock: TToolButton;
     AInfoStocks: TAction;
     ToolButton4: TToolButton;
     AArticulosImagenes: TAction;
     AListStocksArticulo: TAction;
     AImagenesArticulo: TAction;
     AFicherosDePedidoDeCliente: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ToolButton2Click(Sender: TObject);
     procedure LFETarifaChange(Sender: TObject);
     procedure EArticuloKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure Expande;
     procedure DBETituloDblClick(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure AListStocksArticuloExecute(Sender: TObject);
     procedure AFicherosDePedidoDeClienteExecute(Sender: TObject);
     procedure AImagenesArticuloExecute(Sender: TObject);
  private
     { Private declarations }
     procedure HabilitaEnlaces;
  public
     { Public declarations }
  end;

var
  ProFMArticulosAlmacenes : TProFMArticulosAlmacenes;

implementation

uses UFormGest, UDMMain, UFMain,
  UUtiles, UEntorno, UProDMArticulosAlmacenes,
  UProFMArticulosImg, UProFMFicherosCliente, FIBQuery,
  UFMDocInfoStocks, UFPregFichasArticulos;

{$R *.dfm}

procedure TProFMArticulosAlmacenes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMArticulosAlmacenes, ProDMArticulosAlmacenes);
  NavMain.DataSource := ProDMArticulosAlmacenes.DSQMArticulos;
  DBGMain.DataSource := ProDMArticulosAlmacenes.DSQMArticulos;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  G2KTableLoc.Base_de_datos := DMMain.DataBase;
  G2KTableLoc.DataSource := ProDMArticulosAlmacenes.DSQMArticulos;

  HabilitaEnlaces;

  LFETarifa.Text := 'NOR';

  G2KTableLoc.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND TARIFA=''' + LFETarifa.Text + ''' ';
end;

procedure TProFMArticulosAlmacenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMArticulosAlmacenes);
end;

procedure TProFMArticulosAlmacenes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TProFMArticulosAlmacenes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMArticulosAlmacenes.BusquedaCompleja;
end;

procedure TProFMArticulosAlmacenes.ToolButton2Click(Sender: TObject);
begin
  inherited;
  if (DBEArticulo.Text <> '') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos,//FMain.AArticulosAlmacenes,
        'Articulo = ''' + ProDMArticulosAlmacenes.QMArticulosARTICULO.AsString + '''' +
        ' and empresa=' + REntorno.EmpresaStr);
  end;
end;

procedure TProFMArticulosAlmacenes.LFETarifaChange(Sender: TObject);
var
  codigo_articulo, codigo_tarifa : string;

begin
  inherited;
  codigo_articulo := EArticulo.Text;
  codigo_tarifa := LFETarifa.Text;
  G2KTableLoc.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND TARIFA=''' + LFETarifa.Text + ''' ';
  ProDMArticulosAlmacenes.FiltraVista(codigo_articulo, codigo_tarifa);
end;

procedure TProFMArticulosAlmacenes.EArticuloKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     Expande;
end;

procedure TProFMArticulosAlmacenes.Expande;
var
  codigo_articulo, codigo_tarifa : string;
begin
  inherited;
  codigo_articulo := EArticulo.Text;
  codigo_tarifa := LFETarifa.Text;
  ProDMArticulosAlmacenes.BuscarArticulo(codigo_articulo, codigo_tarifa);
end;

procedure TProFMArticulosAlmacenes.HabilitaEnlaces;
begin
  // if (FMain.AArticulos.Enabled = False) then
  // begin
  //    SBAArticulo.Width:= 0;
  // end
  // else
  // begin
  SolapaControles(SBAArticulo, DBETitulo);
  DBETitulo.Color := REntorno.ColorEnlaceActivo;
  // end;
end;

procedure TProFMArticulosAlmacenes.DBETituloDblClick(Sender: TObject);
begin
  inherited;
  AArticulos.Execute;
end;

procedure TProFMArticulosAlmacenes.AArticuloExecute(Sender: TObject);
begin
  inherited;
  if (DBEArticulo.Text <> '') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos,//FMain.AArticulosAlmacenes,
        'Articulo = ''' + ProDMArticulosAlmacenes.QMArticulosARTICULO.AsString + '''' +
        ' and empresa=' + REntorno.EmpresaStr);
  end;
end;

procedure TProFMArticulosAlmacenes.AInfoStocksExecute(Sender: TObject);
var
  Articulo, Almacen : string;
begin
  ProDMArticulosAlmacenes.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TProFMArticulosAlmacenes.AListStocksArticuloExecute(Sender: TObject);
begin
  inherited;
  TFPregFichasArticulos.Create(Self).Muestra(DBEArticulo.Text, 0);
end;

procedure TProFMArticulosAlmacenes.AFicherosDePedidoDeClienteExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(ProDMArticulosAlmacenes.QMArticulosID_A.AsString, 'ART_ARTICULOS(ID_A)', 'DELFOS', _('Ficheros de Articulo'));
end;

procedure TProFMArticulosAlmacenes.AImagenesArticuloExecute(Sender: TObject);
begin
  inherited;
  if (DBEArticulo.Text <> '') then
  begin
     AbreForm(TProFMArticulosImg, ProFMArticulosImg, Sender);
     ProFMArticulosImg.FiltrarArticulo(ProDMArticulosAlmacenes.QMArticulosARTICULO.AsString);
  end;
end;

end.
