unit UCrmFMArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TCrmFMArticulos = class(TFPEdit)
     LFCodigo: TLFLabel;
     LFDBCodigo: TLFDbedit;
     LFLabel1: TLFLabel;
     LFDBDesc: TLFDbedit;
     LFCantidad: TLFLabel;
     LFDBCantidad: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMArticulos : TCrmFMArticulos;

implementation

uses UCrmDMArticulos, UFormGest;

{$R *.dfm}

procedure TCrmFMArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMArticulos, CrmDMArticulos);

  NavMain.DataSource := CrmDMArticulos.DSQMArticulo;
end;

procedure TCrmFMArticulos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
