unit UFMTarFamPropagacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Mask, DBCtrls,
  UNavigator, UEditPanel, Menus, UTeclas, UControlEdit, URecursos, UFormGest,
  ULFDBEdit, ULFPanel, ULFToolBar, ULFLabel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList;

type
  TFMTarFamPropagacion = class(TFPEditSinNavegador)
     TSep1: TToolButton;
     LFamTar: TLFLabel;
     DBGDer: TDBGrid;
     DBGIzq: TDBGrid;
     TBDatos: TLFToolBar;
     TSep2: TToolButton;
     DBLCBCabecera: TDBLookupComboBox;
     PTitulo: TLFPanel;
     LNo: TLFLabel;
     LSi: TLFLabel;
     NavMain: THYMNavigator;
     TButtPropagaTodo: TToolButton;
     TSep4: TToolButton;
     PNLTitulo: TLFPanel;
     DBEBusca: TLFDbedit;
     TButCambiaSeleccion: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGIzqDblClick(Sender: TObject);
     procedure DBGDerDblClick(Sender: TObject);
     procedure TButtPropagaTodoClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TButCambiaSeleccionClick(Sender: TObject);
  private
     { Private declarations }
     Modo: smallint;
     procedure SetModo(aModo: smallint);
  public
     { Public declarations }
  end;

var
  FMTarFamPropagacion : TFMTarFamPropagacion;

implementation

uses UDMMain, UDMTarFamPropagacion;

{$R *.DFM}

procedure TFMTarFamPropagacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTarFamPropagacion, DMTarFamPropagacion);

  SetModo(1); // Tarifa
  ControlEdit := CEMain;
end;

procedure TFMTarFamPropagacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTarFamPropagacion);
end;

procedure TFMTarFamPropagacion.DBGIzqDblClick(Sender: TObject);
begin
  DMTarFamPropagacion.PropagaSi;
end;

procedure TFMTarFamPropagacion.DBGDerDblClick(Sender: TObject);
begin
  DMTarFamPropagacion.PropagaNo;
end;

procedure TFMTarFamPropagacion.TButtPropagaTodoClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMTarFamPropagacion.PropagaTodo;
     // EPMainClickRango(Self, Continua);
     SetModo(1); // Tarifa
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMTarFamPropagacion.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  DBLCBCabecera.KeyValue := DMTarFamPropagacion.xBuscCODIGO.AsString;
end;

procedure TFMTarFamPropagacion.SetModo(aModo: smallint);
begin
  Modo := aModo;
  if (Modo = 1) then
  begin
     LFamTar.Caption := _('Tarifa');
     LNo.Caption := _('Familias no propagadas');
     LSi.Caption := _('Familias propagadas');
     DMTarFamPropagacion.SetModo(Modo);
     DBLCBCabecera.KeyValue := DMTarFamPropagacion.xBusc.FieldByName('CODIGO').AsString;
  end
  else
  begin
     LFamTar.Caption := _('Familia');
     LNo.Caption := _('Tarifas no propagadas');
     LSi.Caption := _('Tarifas propagadas');
     DMTarFamPropagacion.SetModo(Modo);
     DBLCBCabecera.KeyValue := DMTarFamPropagacion.xBusc.FieldByName('CODIGO').AsString;
  end;
end;

procedure TFMTarFamPropagacion.TButCambiaSeleccionClick(Sender: TObject);
begin
  if (Modo = 0) then
     SetModo(1) // Tarifa
  else
     SetModo(0); // Familia
end;

end.
