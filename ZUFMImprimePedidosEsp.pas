unit ZUFMImprimePedidosEsp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, StdCtrls, Mask, rxToolEdit, rxCurrEdit,
  ULFLabel, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList;

type
  TZFMImprimePedidosEsp = class(TFPEditSimple)
     HYTDBGPedidosEsp: THYTDBGrid;
     TButtCancelar: TToolButton;
     TbuttMarcar: TToolButton;
     TButtSeparador1: TToolButton;
     TButtSeparador2: TToolButton;
     TButtImprimir: TToolButton;
     PMImprime: TPopupMenu;
     MIImprimirAlbaranes: TMenuItem;
     MIConfiguracionRapida: TMenuItem;
     N1: TMenuItem;
     ToolButton1: TToolButton;
     Z_PnlCopias: TLFPanel;
     Z_LblNumCopias: TLFLabel;
     Z_CENumCopias: TCurrencyEdit;
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure HYTDBGPedidosEspKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure HYTDBGPedidosEspKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure HYTDBGPedidosEspCellClick(Column: TColumn);
     procedure MIImprimirAlbaranesClick(Sender: TObject);
     procedure MIConfiguracionRapidaClick(Sender: TObject);
  private
     semaforoclick: boolean;
     { Private declarations }
  public
     { Public declarations }
     function seleccionado: boolean;
     procedure Marca;
     function Muestra(Query: TDataSet): integer;
  end;

var
  ZFMImprimePedidosEsp : TZFMImprimePedidosEsp;

implementation

uses ZUDMImprimePedidosEsp, UDMMain, UFMListConfig, ZUDMLstPedidos;

{$R *.DFM}

procedure TZFMImprimePedidosEsp.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMImprimePedidosEsp, ZDMImprimePedidosEsp);
  CEMainPMEdit.Teclas := DMMain.teclas;
  ControlEdit := CEMain;
  semaforoclick := False;
end;

procedure TZFMImprimePedidosEsp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMImprimePedidosEsp);
end;

procedure TZFMImprimePedidosEsp.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  ZDMImprimePedidosEsp.ImprimePedidosEsp(Self, 0);  // Imprimir Pedidos Especiales
end;

function TZFMImprimePedidosEsp.seleccionado: boolean;
begin
  Result := HYTDBGPedidosEsp.SelectedRows.CurrentRowSelected;
end;

procedure TZFMImprimePedidosEsp.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  ZDMImprimePedidosEsp.BusquedaCompleja;
  Continua := False;
end;

function TZFMImprimePedidosEsp.Muestra(Query: TDataSet): integer;
begin
  EPMain.VisibleButtons := [neReport, neSalir];
  ZDMImprimePedidosEsp.Filtra(Query);
  Result := ShowModal;
end;

procedure TZFMImprimePedidosEsp.TbuttMarcarClick(Sender: TObject);
begin
  HYTDBGPedidosEsp.SelectedRows.Clear;
  ZDMImprimePedidosEsp.Marcatodas(Self);
end;

procedure TZFMImprimePedidosEsp.Marca;
begin
  HYTDBGPedidosEsp.SelectedRows.CurrentRowSelected := True;
end;

procedure TZFMImprimePedidosEsp.TButtCancelarClick(Sender: TObject);
begin
  HYTDBGPedidosEsp.SelectedRows.Clear;
end;

procedure TZFMImprimePedidosEsp.HYTDBGPedidosEspKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) then
     semaforoclick := True;
end;

procedure TZFMImprimePedidosEsp.HYTDBGPedidosEspKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Shift = [] then
     semaforoclick := False;
end;

procedure TZFMImprimePedidosEsp.HYTDBGPedidosEspCellClick(Column: TColumn);
begin
  if semaforoclick then
  begin
     HYTDBGPedidosEsp.SelectedRows.CurrentRowSelected := False;
     ZDMImprimePedidosEsp.MarcaHasta(Self);
     semaforoclick := False;
  end;
end;

procedure TZFMImprimePedidosEsp.MIImprimirAlbaranesClick(Sender: TObject);
begin
  ZDMImprimePedidosEsp.ImprimePedidosEsp(Self, 0);  // Imprimir Pedidos Especiales
end;

procedure TZFMImprimePedidosEsp.MIConfiguracionRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TZDMLstPedidos, ZDMLstPedidos);
  TFMListConfig.Create(Self).Muestra(9002, formato, cabecera, copias,
     pijama, '', ZDMLstPedidos.frPedidoEsp);
  CierraData(ZDMLstPedidos);
end;

end.
