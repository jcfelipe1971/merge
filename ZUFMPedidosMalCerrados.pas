unit ZUFMPedidosMalCerrados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls,
  Mask, rxToolEdit, ULFDateEdit, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada;

type
  TZFMPedidosMalCerrados = class(TForm)
     LFPanel1: TLFPanel;
     LFToolBar1: TLFToolBar;
     TPedidosConAlbaran: TToolButton;
     ToolButton2: TToolButton;
     TSalir: TToolButton;
     TPedidosConOrdenAbierta: TToolButton;
     DBGridFind20001: TDBGridFind2000;
     LFDateLeft: TLFDateEdit;
     LFDateRight: TLFDateEdit;
     procedure TPedidosConAlbaranClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSalirClick(Sender: TObject);
     procedure TPedidosConOrdenAbiertaClick(Sender: TObject);
     procedure ToolButton2Click(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMPedidosMalCerrados : TZFMPedidosMalCerrados;

implementation

uses ZUDMPedidosMalCerrados, UDMMain, FIBDataSetRO, UEntorno, UFormGest;

{$R *.dfm}

procedure TZFMPedidosMalCerrados.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TZDMPedidosMalCerrados, ZDMPedidosMalCerrados);
end;

procedure TZFMPedidosMalCerrados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ZDMPedidosMalCerrados);
end;

procedure TZFMPedidosMalCerrados.TSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMPedidosMalCerrados.TPedidosConOrdenAbiertaClick(Sender: TObject);
begin
  ZDMPedidosMalCerrados.TipoOpcion := 2;
  ZDMPedidosMalCerrados.PedidosAbiertosConAlbaran;
end;

procedure TZFMPedidosMalCerrados.TPedidosConAlbaranClick(Sender: TObject);
begin
  ZDMPedidosMalCerrados.TipoOpcion := 1;
  ZDMPedidosMalCerrados.PedidosAbiertosConAlbaran;
end;

procedure TZFMPedidosMalCerrados.ToolButton2Click(Sender: TObject);
begin
  ZDMPedidosMalCerrados.Procesa;
end;

end.
