unit UFMAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFPEditSinNavegador, StdCtrls, DBCtrls,
  ULFDBMemo, ULFDBEdit, Mask, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  dbcgrids, ULFDBCtrlGrid, DbComboBoxValue, ULFDBComboBoxValue, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMAgenda = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSAgenda: TTabSheet;
     TSEventos: TTabSheet;
     DBCtrlGAgenda: TLFDBCtrlGrid;
     DBCtrlGEventos: TLFDBCtrlGrid;
     DBDEFecha: TLFDBDateEdit;
     DBETitulo: TLFDbedit;
     DBMDescripcion: TLFDBMemo;
     DBETituloEvento: TLFDbedit;
     DBEDiaMes: TLFDbedit;
     DBEFechaInicio: TLFDBDateEdit;
     DBEFechaFin: TLFDBDateEdit;
     DBDescripcion: TLFDBMemo;
     LTitulo: TLFLabel;
     LPeriodicidad: TLFLabel;
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     DBDiaSemana: TLFDBComboBoxValue;
     DBMes: TLFDBComboBoxValue;
     AGeneraAgenda: TAction;
     DBCEstado: TLFDBCheckBox;
     TBAgenda: TLFToolBar;
     TBGrabaAgenda: TToolButton;
     AEliminaAgenda: TAction;
     TBEventos: TLFToolBar;
     TBGrabaAgendaEvento: TToolButton;
     TBEliminaAgendaEvento: TToolButton;
     AGrabaAgenda: TAction;
     AEliminaEventoAgenda: TAction;
     AGrabaEventoAgenda: TAction;
     TBEliminaAgenda: TToolButton;
     ALAgenda: TLFActionList;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AGeneraAgendaExecute(Sender: TObject);
     procedure AEliminaAgendaExecute(Sender: TObject);
     procedure TBEliminarEventoClick(Sender: TObject);
     procedure AGrabaAgendaExecute(Sender: TObject);
     procedure AEliminaEventoAgendaExecute(Sender: TObject);
     procedure TBGrabarEventoClick(Sender: TObject);
     procedure AGrabaEventoAgendaExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAgenda : TFMAgenda;

implementation

uses
  UDMMain, UDMAgenda, UFormGest;

{$R *.dfm}

procedure TFMAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAgenda, DMAgenda);
end;

procedure TFMAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAgenda);
end;

procedure TFMAgenda.AGeneraAgendaExecute(Sender: TObject);
begin
  inherited;
  DMAgenda.GeneraAgenda;
end;

procedure TFMAgenda.AEliminaAgendaExecute(Sender: TObject);
begin
  inherited;
  DMAgenda.QMAgenda.Delete;
end;

procedure TFMAgenda.TBEliminarEventoClick(Sender: TObject);
begin
  inherited;
  DMAgenda.QMAgendaEventoPeriodos.Delete;
end;

procedure TFMAgenda.AGrabaAgendaExecute(Sender: TObject);
begin
  inherited;
  DMAgenda.QMAgendaEventoPeriodos.Post;
end;

procedure TFMAgenda.AEliminaEventoAgendaExecute(Sender: TObject);
begin
  inherited;
  DMAgenda.QMAgendaEventoPeriodos.Delete;
end;

procedure TFMAgenda.TBGrabarEventoClick(Sender: TObject);
begin
  inherited;
  DMAgenda.GrabaEvento;
end;

procedure TFMAgenda.AGrabaEventoAgendaExecute(Sender: TObject);
begin
  inherited;
  DMAgenda.GrabaAgenda;
end;

end.
