unit UFMAgrupaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBMemo, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UG2kTBLoc;

type
  TFMAgrupaciones = class(TFPEdit)
     DBEAgrupacion: TLFDbedit;
     DBETitulo: TLFDbedit;
     LAgrupacion: TLFLabel;
     LTitulo: TLFLabel;
     DBRGAgrupa: TDBRadioGroup;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     PNLNotas: TLFPanel;
     DBECodNotas: TLFDbedit;
     DBEDesNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     PNLENotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     LBLTituloWeb: TLFLabel;
     DBTituloWeb: TLFDbedit;
     LFDBChkWeb: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSNotasShow(Sender: TObject);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAgrupaciones : TFMAgrupaciones;

implementation

uses UDMAgrupaciones, UDMMain, UFormGest;

{$R *.DFM}

procedure TFMAgrupaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAgrupaciones, DMAgrupaciones);
  NavMain.DataSource := DMAgrupaciones.DSQMAgrupaciones;
  DBGMain.DataSource := DMAgrupaciones.DSQMAgrupaciones;
  G2kTableLoc.DataSource := DMAgrupaciones.DSQMAgrupaciones;
end;

procedure TFMAgrupaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAgrupaciones);
end;

procedure TFMAgrupaciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMAgrupaciones.BusquedaCompleja;
  Continua := False;
end;

procedure TFMAgrupaciones.TSNotasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotas;
end;

procedure TFMAgrupaciones.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMAgrupaciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
