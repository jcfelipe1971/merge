unit UFSelecProyectosVentasDetalle;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UHYDBGrid, UControlEdit, UFormGest, NsDBGrid,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UEditPanel, ToolWin, ComCtrls, ULFToolBar, ExtCtrls,
  ULFPanel;

type
  TFSelecProyectosVentasDetalle = class(TFPEditSinNavegador)
     DBGVentasC: THYTDBGrid;
     PNLPie: TLFPanel;
     procedure DBGVentasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGVentasCDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FSelecProyectosVentasDetalle : TFSelecProyectosVentasDetalle;

implementation

uses UDMProyectos, UFSelecProyectosVentas, UFMain;

{$R *.DFM}

procedure TFSelecProyectosVentasDetalle.DBGVentasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case key of
     13: DMProyectos.InsercionesVentas(1);
     27: ModalResult := mrCancel;
  end;
end;

procedure TFSelecProyectosVentasDetalle.DBGVentasCDblClick(Sender: TObject);
begin
  inherited;
  DMProyectos.InsercionesVentas(1);
end;

procedure TFSelecProyectosVentasDetalle.FormCreate(Sender: TObject);
begin
  inherited;
  FMain.AddComponenteReturn(DBGVentasC);
end;

procedure TFSelecProyectosVentasDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(DBGVentasC);
end;

procedure TFSelecProyectosVentasDetalle.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrCancel;
end;

end.
