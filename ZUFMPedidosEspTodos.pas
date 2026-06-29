unit ZUFMPedidosEspTodos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, UNavigator, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ToolWin, ComCtrls,
  ULFToolBar, UFormGest, Menus, UTeclas, UControlEdit, StdCtrls,
  ULFComboBox, ULFLabel, ULFEditFind2000, ULFEdit, Mask, DBCtrls, ULFDBEdit;

type
  TZFMPedidosEspTodos = class(TG2KForm)
     LFToolBar1: TLFToolBar;
     DBGFPedidos: TDBGridFind2000;
     NavMain: THYMNavigator;
     PnlFiltros: TLFPanel;
     CEPedidos: TControlEdit;
     CEPedidosPMEdit: TPopUpTeclas;
     TSep1: TToolButton;
     TButtSalir: TToolButton;
     LEstado: TLFLabel;
     CBEstado: TLFComboBox;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     LSuReferencia: TLFLabel;
     ESuRef: TLFEdit;
     DBEDescCliente: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFPedidosDblClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure CBEstadoChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure ESuRefChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMPedidosEspTodos : TZFMPedidosEspTodos;

implementation

uses ZUDMPedidosEspTodos, UDMMain, ZUFMPedidosEsp;

{$R *.dfm}

procedure TZFMPedidosEspTodos.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TZDMPedidosEspTodos, ZDMPedidosEspTodos);
end;

procedure TZFMPedidosEspTodos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMPedidosEspTodos);
  Action := caFree;
end;

procedure TZFMPedidosEspTodos.DBGFPedidosDblClick(Sender: TObject);
begin
  AbreForm(TZFMPedidosEsp, ZFMPedidosEsp);
  ZFMPedidosEsp.AbreRig(ZDMPedidosEspTodos.QMPedidosEspRIG.AsInteger);
end;

procedure TZFMPedidosEspTodos.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMPedidosEspTodos.CBEstadoChange(Sender: TObject);
begin
  ZDMPedidosEspTodos.FiltraTabla;
end;

procedure TZFMPedidosEspTodos.EFClienteChange(Sender: TObject);
begin
  ZDMPedidosEspTodos.FiltraTabla;
  if EFCliente.Text <> '' then
     ZDMPedidosEspTodos.DescCliente(StrToInt(EFCliente.Text))
  else
     ZDMPedidosEspTodos.DescCliente(0);
end;

procedure TZFMPedidosEspTodos.ESuRefChange(Sender: TObject);
begin
  ZDMPedidosEspTodos.FiltraTabla;
end;

end.
