unit ZUFMColores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEdit;

type
  TZFMColores = class(TFPEdit)
     LCodigo: TLFLabel;
     LDescripcion: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LCodComponente: TLFLabel;
     DBECodComponente: TLFDbedit;
     LDiasRetraso: TLFLabel;
     DBEDiasRetraso: TLFDbedit;
     LPorcentajeIncrementeo: TLFLabel;
     DBEPorcentajeIncrementeo: TLFDbedit;
     CBColor: TLFDBCheckBox;
     EColor: TLFEdit;
     LCodColor: TLFLabel;
     DBCBActivo: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EColorClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGMainDblClick(Sender: TObject);
     procedure DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RefrescaColores;
  end;

var
  ZFMColores : TZFMColores;

implementation

uses ZUDMColores, UFormGest, UUtiles;

{$R *.dfm}

procedure TZFMColores.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMColores, ZDMColores);
  RefrescaColores;
end;

procedure TZFMColores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMColores);
end;

procedure TZFMColores.EColorClick(Sender: TObject);
begin
  inherited;
  EColor.Color := DameColor(EColor.Color);
end;

procedure TZFMColores.RefrescaColores;
begin
  EColor.Color := ZDMColores.DameColor;
end;

procedure TZFMColores.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  RefrescaColores;
end;

procedure TZFMColores.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  RefrescaColores;
end;

procedure TZFMColores.DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited;
  RefrescaColores;
end;

procedure TZFMColores.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  RefrescaColores;
end;

procedure TZFMColores.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbPost) then
  begin
     ZDMColores.PonColor(EColor.Color);
  end;
end;

procedure TZFMColores.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
