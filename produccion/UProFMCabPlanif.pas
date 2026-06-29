unit UProFMCabPlanif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel, ULFLabel;

type
  TProFMCabPlanif = class(TFPEdit)
     DBEPlanif: TLFDbedit;
     DBETitulo: TLFDbedit;
     LPlanificacion: TLFLabel;
     LTitulo: TLFLabel;
     ToolButton1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ToolButton1Click(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMCabPlanif : TProFMCabPlanif;

implementation

uses UProDMCabPlanif, UFormGest, UProFPregPlanif;

{$R *.dfm}

procedure TProFMCabPlanif.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMCabPlanif, ProDMCabPlanif);
  ControlEdit := CEMain;
  NavMain.DataSource := ProDMCabPlanif.DSQMProCabPlanif;
  DBGMain.DataSource := ProDMCabPlanif.DSQMProCabPlanif;
end;

procedure TProFMCabPlanif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMCabPlanif);
end;

procedure TProFMCabPlanif.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMCabPlanif.ToolButton1Click(Sender: TObject);
begin
  inherited;
  AbreForm(TProFPregPlanif, ProFPregPlanif, Sender);
end;

procedure TProFMCabPlanif.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMCabPlanif.BusquedaCompleja;
end;

end.
