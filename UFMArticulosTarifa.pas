unit UFMArticulosTarifa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UHYDBGrid, UControlEdit, UFormGest,
  ULFDBEdit, NsDBGrid, ULFPanel, ULFToolBar, ULFEditFind2000, UEditPanel,
  ULFLabel;

type
  TFMArticulosTarifa = class(TG2KForm)
     TBMain: TLFToolBar;
     PMain: TLFPanel;
     DBGArtTarifas: THYTDBGrid;
     PNLTarifa: TLFPanel;
     LBLTarifa: TLFLabel;
     EFTarifa: TLFEditFind2000;
     DBETarifa: TLFDbedit;
     HYMEditPanel1: THYMEditPanel;
     ToolButton1: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure EFTarifaBusqueda(Sender: TObject);
     procedure EFTarifaChange(Sender: TObject);
     procedure DBGArtTarifasDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMArticulosTarifa : TFMArticulosTarifa;

implementation

uses UDMPedidosAProveedor, UFMPedidosAProveedor, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMArticulosTarifa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMPedidosAProveedor.xArticulosTarifa.Close;
  FMPedidosAProveedor.SWCerrar := 0;
  Action := caFree;
end;

procedure TFMArticulosTarifa.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  // inicio
end;

procedure TFMArticulosTarifa.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMArticulosTarifa.EFTarifaBusqueda(Sender: TObject);
begin
  EFTarifa.CondicionBusqueda := 'Proveedor=' +
     IntToStr(DMPedidosAProveedor.QMCabeceraPROVEEDOR.AsInteger);
end;

procedure TFMArticulosTarifa.EFTarifaChange(Sender: TObject);
begin
  DMPedidosAProveedor.CambiaTarifa(EFTarifa.Text);
end;

procedure TFMArticulosTarifa.DBGArtTarifasDblClick(Sender: TObject);
begin
  DMPedidosAProveedor.InsertaArticulo(DMPedidosAProveedor.xArticulosTarifa.FieldByName('ARTICULO').AsString);
end;

end.
