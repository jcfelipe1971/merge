unit UFMNumerosDeAutorizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, DbComboBoxValue,
  ULFDBComboBoxValue, rxToolEdit, RXDBCtrl, ULFDBDateEdit, Mask, DBCtrls,
  ULFDBEdit;

type
  TFMNumerosDeAutorizacion = class(TFPEdit)
     DBEAutorizacion: TLFDbedit;
     DBELlaveDosificacion: TLFDbedit;
     DBEContador: TLFDbedit;
     DTFechaHasta: TLFDBDateEdit;
     DTFechaDesde: TLFDBDateEdit;
     CBTipo: TLFDBComboBoxValue;
     LLlaveDoscificacion: TLFLabel;
     LAutorizacion: TLFLabel;
     LContador: TLFLabel;
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     LTipo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMNumerosDeAutorizacion : TFMNumerosDeAutorizacion;

implementation

uses
  UDMNumerosDeAutorizacion, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMNumerosDeAutorizacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMNumerosDeAutorizacion, DMNumerosDeAutorizacion);
  NavMain.DataSource := DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion;
  DBGMain.DataSource := DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion;
  EPMain.DataSource := DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion;
  G2KTableLoc.DataSource := DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion;
end;

procedure TFMNumerosDeAutorizacion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
