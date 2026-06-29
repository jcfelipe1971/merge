unit UFSelecProyectosComprasDetalle;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UHYDBGrid, UControlEdit, UFormGest, NsDBGrid,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UEditPanel, ToolWin, ComCtrls, ULFToolBar, ExtCtrls,
  ULFPanel;

type
  TFSelecProyectosComprasDetalle = class(TFPEditSinNavegador)
     DBGComprasC: THYTDBGrid;
     PNLPie: TLFPanel;
     procedure DBGComprasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGComprasCDblClick(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FSelecProyectosComprasDetalle : TFSelecProyectosComprasDetalle;

implementation

uses UDMProyectos, UFSelecProyectosCompras, UFMain;

{$R *.DFM}

procedure TFSelecProyectosComprasDetalle.DBGComprasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case key of
     13: DMProyectos.InsercionesCompras(1);
     27: ModalResult := mrCancel;
  end;
end;

procedure TFSelecProyectosComprasDetalle.FormCreate(Sender: TObject);
begin
  inherited;
  FMain.AddComponenteReturn(DBGComprasC);
end;

procedure TFSelecProyectosComprasDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(DBGComprasC);
end;

procedure TFSelecProyectosComprasDetalle.DBGComprasCDblClick(Sender: TObject);
begin
  inherited;
  DMProyectos.InsercionesCompras(1);
end;

procedure TFSelecProyectosComprasDetalle.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrCancel;
end;

end.
