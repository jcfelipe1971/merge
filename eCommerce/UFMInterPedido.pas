unit UFMInterPedido;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UNavigator,
  ToolWin, ComCtrls, ExtCtrls, ActnList, Menus, UTeclas, UControlEdit,
  UFormGest, StdCtrls, DBCtrls, NsDBGrid, ULFDBMemo, ULFPanel, ULFMemo,
  Mask, ULFDBEditFind2000, ULFLabel, ULFDBEdit, ULFToolBar;

type
  TFMInterPedido = class(TG2KForm)
     PPrincipal: TLFPanel;
     PCabecera: TLFPanel;
     TBCabecera: TLFToolBar;
     NavCabecera: THYMNavigator;
     DBGFCabecera: TDBGridFind2000;
     Splitter1: TSplitter;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     TBOpcDetalle: TLFToolBar;
     TBGeneral: TLFToolBar;
     ToolButton1: TToolButton;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     ALMain: TActionList;
     ACargarFichero: TAction;
     ToolButton2: TToolButton;
     ToolButton5: TToolButton;
     ARefrescar: TAction;
     ToolButton6: TToolButton;
     ToolButton7: TToolButton;
     ATraspasarPed: TAction;
     ASelecTodo: TAction;
     ADesmarcaTodo: TAction;
     ToolButton8: TToolButton;
     AEliminaPedido: TAction;
     ToolButton9: TToolButton;
     ToolButton10: TToolButton;
     CECabecera: TControlEdit;
     CEDetalle: TControlEdit;
     CECabeceraPMEdit: TPopUpTeclas;
     CEDetallePMEdit: TPopUpTeclas;
     GBObs: TGroupBox;
     DBMObs: TLFDBMemo;
     PDatosPedido: TLFPanel;
     LDireccionPedido: TLFLabel;
     LDireccion: TLFLabel;
     MDireccionPedido: TLFDBMemo;
     EFDireccion: TLFDBEditFind2000;
     DBECliente: TLFDbedit;
     DBEDireccionCompleta: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ACargarFicheroExecute(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure ATraspasarPedExecute(Sender: TObject);
     procedure MarcarCliente(Sender: TObject);
     procedure AEliminaPedidoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMInterPedido : TFMInterPedido;

implementation

{$R *.DFM}

uses UDMMain, UDMInterPedido;

procedure TFMInterPedido.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMInterPedido, DMInterPedido);

  NavCabecera.DataSource := DMInterPedido.DSQMCabecera;
  DBGFCabecera.DataSource := DMInterPedido.DSQMCabecera;
  NavDetalle.DataSource := DMInterPedido.DSQMDetalle;
  DBGFDetalle.DataSource := DMInterPedido.DSQMDetalle;
end;

procedure TFMInterPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMInterPedido);
end;

procedure TFMInterPedido.ACargarFicheroExecute(Sender: TObject);
begin
  DMInterPedido.CargarFichero;
end;

procedure TFMInterPedido.ARefrescarExecute(Sender: TObject);
begin
  DMInterPedido.Refrescar;
end;

procedure TFMInterPedido.ATraspasarPedExecute(Sender: TObject);
begin
  //Traspasar pedidos seleccionados
  DMInterPedido.TraspasarPedido;
end;

procedure TFMInterPedido.MarcarCliente(Sender: TObject);
begin
  //Marca o desmarca todo
  DMInterPedido.MarcarTodo(TAction(Sender).Tag);
end;

procedure TFMInterPedido.AEliminaPedidoExecute(Sender: TObject);
begin
  //Elimina Pedido
  DMInterPedido.EliminaPedido;
end;

end.
