unit UFPEditDetalle;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc,
  StdCtrls;

type
  TFPEditDetalle = class(TFPEdit)
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFDetalle: TDBGridFind2000;
     BMaximizarTabla: TButton;
     procedure TSTablaResize(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure BMaximizarTablaClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     TSTablaMaximizada: boolean;
     PMainAlturaOriginal: integer;
     PDetalleAlturaMinima: integer;
     PMainMaximizado: boolean;
     procedure MaximizarPMain;
     procedure RestarurarPMain;
  end;

var
  FPEditDetalle : TFPEditDetalle;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFPEditDetalle.FormCreate(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSFicha;
  PMainAlturaOriginal := PMain.Height;
  PMainMaximizado := False;
  TSTablaMaximizada := False;
  PDetalleAlturaMinima := 150;
end;

procedure TFPEditDetalle.TSTablaResize(Sender: TObject);
begin
  inherited;
  BMaximizarTabla.Top := TSTabla.Height - BMaximizarTabla.Height;
  BMaximizarTabla.Left := (TSTabla.Width div 2) - (BMaximizarTabla.Width div 2);
end;

procedure TFPEditDetalle.TSTablaShow(Sender: TObject);
begin
  inherited;
  TSTablaResize(Sender);

  if (TSTablaMaximizada) then
     PMain.Height := Self.Height - PDetalleAlturaMinima
  else
     PMain.Height := PMainAlturaOriginal;
end;

procedure TFPEditDetalle.BMaximizarTablaClick(Sender: TObject);
begin
  inherited;
  if (not TSTablaMaximizada) then
     MaximizarPMain
  else
     RestarurarPMain;

  TSTablaMaximizada := not TSTablaMaximizada;
end;

procedure TFPEditDetalle.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage <> TSTabla) then
  begin
     if (PMainMaximizado) then
        MaximizarPMain
     else
        RestarurarPMain;
  end;
end;

procedure TFPEditDetalle.MaximizarPMain;
begin
  PMain.Height := Self.Height - TBActions.Height - PDetalleAlturaMinima;
end;

procedure TFPEditDetalle.RestarurarPMain;
begin
  PMain.Height := PMainAlturaOriginal;
end;

procedure TFPEditDetalle.TSFichaShow(Sender: TObject);
begin
  inherited;
  PMain.Height := PMainAlturaOriginal;
end;

end.
