unit UFSelecProyectosCompras;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, UHYDBGrid, UControlEdit, UFormGest, NsDBGrid,
  ULFPanel, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UEditPanel, ToolWin, ComCtrls, ULFToolBar;

type
  TFSelecProyectosCompras = class(TFPEditSinNavegador)
     PNLPie: TLFPanel;
     DBGComprasC: THYTDBGrid;
     procedure DBGComprasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGComprasCDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FSelecProyectosCompras : TFSelecProyectosCompras;

implementation

uses UDMProyectos, UEntorno, UDMMain, UFSelecProyectosComprasDetalle, UFMain;

{$R *.DFM}

procedure TFSelecProyectosCompras.DBGComprasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case key of
     32: TFSelecProyectosComprasDetalle.Create(Self).ShowModal;
     13: DMProyectos.InsercionesCompras(0);
     27: ModalResult := mrCancel;
  end;
end;

procedure TFSelecProyectosCompras.DBGComprasCDblClick(Sender: TObject);
begin
  DMProyectos.InsercionesCompras(0);
end;

procedure TFSelecProyectosCompras.FormCreate(Sender: TObject);
begin
  inherited;
  FMain.AddComponenteReturn(DBGComprasC);
end;

procedure TFSelecProyectosCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(DBGComprasC);
end;

procedure TFSelecProyectosCompras.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrCancel;
end;

end.
