unit UFSelecProyectosVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, UHYDBGrid, UControlEdit, UFormGest, NsDBGrid,
  ULFPanel, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UEditPanel, ToolWin, ComCtrls, ULFToolBar;

type
  TFSelecProyectosVentas = class(TFPEditSinNavegador)
     PNLPie: TLFPanel;
     DBGVentasC: THYTDBGrid;
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
  FSelecProyectosVentas : TFSelecProyectosVentas;

implementation

uses UDMProyectos, UEntorno, UDMMain, UFSelecProyectosVentasDetalle, UFMain;

{$R *.DFM}

procedure TFSelecProyectosVentas.DBGVentasCKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case key of
     32: TFSelecProyectosVentasDetalle.Create(Self).ShowModal;
     13: DMProyectos.InsercionesVentas(0);
     27: ModalResult := mrCancel;
  end;
end;

procedure TFSelecProyectosVentas.DBGVentasCDblClick(Sender: TObject);
begin
  DMProyectos.InsercionesVentas(0);
end;

procedure TFSelecProyectosVentas.FormCreate(Sender: TObject);
begin
  inherited;
  FMain.AddComponenteReturn(DBGVentasC);
end;

procedure TFSelecProyectosVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(DBGVentasC);
end;

procedure TFSelecProyectosVentas.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrCancel;
end;

end.
