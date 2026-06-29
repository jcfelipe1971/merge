unit UOpeFMEstadoMarcajePedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  DbComboBoxValue, ULFDBComboBoxValue, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox;

type
  TOpeFMEstadoMarcajePedido = class(TFPEdit)
     LIdEstadoMarcajePedido: TLFLabel;
     DBIdEstadoMarcajePedido: TLFDbedit;
     DBTitulo: TLFDbedit;
     LTitulo: TLFLabel;
     LOrdenEjecucion: TLFLabel;
     DBOrdenEjecucion: TLFDbedit;
     DBChkAfectaStock: TLFDBCheckBox;
     LFechaAsociada: TLFLabel;
     DBCBAsociarFechaMarcaje: TLFDBComboBoxValue;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMEstadoMarcajePedido : TOpeFMEstadoMarcajePedido;

implementation

uses UDMMain, UOpeDMEstadoMarcajePedido, UFormGest, UUtiles, UEntorno;

{$R *.dfm}

procedure TOpeFMEstadoMarcajePedido.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMEstadoMarcajePedido, OpeDMEstadoMarcajePedido);
  NavMain.DataSource := OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido;
  EPMain.DataSource := OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido;
  DBGMain.DataSource := OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido;
  G2kTableLoc.DataSource := OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido;
end;

procedure TOpeFMEstadoMarcajePedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMEstadoMarcajePedido);
end;

procedure TOpeFMEstadoMarcajePedido.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
