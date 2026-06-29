unit UFMCentInventario;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMCentInventario = class(TFPEdit)
     LBLCentro: TLFLabel;
     DBEAlmacen: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLTercero: TLFLabel;
     DBEFTercero: TLFDBEditFind2000;
     DBETitTercero: TLFDbedit;
     AInfoTercero: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure AInfoTerceroExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCentInventario : TFMCentInventario;

implementation

uses UFormGest, UDMMain, UEntorno, UDMCentInventario, UFMain;

{$R *.DFM}

procedure TFMCentInventario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCentrosInventario, DMCentrosInventario);
  NavMain.DataSource := DMCentrosInventario.DSQMCentrosInventario;
  DBGMain.DataSource := DMCentrosInventario.DSQMCentrosInventario;
end;

procedure TFMCentInventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCentrosInventario);
end;

procedure TFMCentInventario.AInfoTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMCentInventario.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
