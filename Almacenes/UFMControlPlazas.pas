unit UFMControlPlazas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFPEditSinNavegador, StdCtrls, ULFLabel,
  Mask, rxToolEdit, ULFDateEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMControlPlazas = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSEstructura: TTabSheet;
     TSHorarios: TTabSheet;
     TBEstructura: TLFToolBar;
     TBHorarios: TLFToolBar;
     DBGEstructuraGolo: TDBGridFind2000;
     PNLEstructuraGolo: TLFPanel;
     PNLEstructuraCat: TLFPanel;
     PNLEstructuraEsc: TLFPanel;
     DBGEstructuraCat: TDBGridFind2000;
     DBGEstructuraEsc: TDBGridFind2000;
     PNLHorarios: TLFPanel;
     PNLHorariosGolo: TLFPanel;
     DBGHorariosGolo: TDBGridFind2000;
     PNLHorariosCat: TLFPanel;
     DBGHorariosCat: TDBGridFind2000;
     PNLHorariosEsc: TLFPanel;
     DBGHorariosEsc: TDBGridFind2000;
     LDia: TLFLabel;
     PNLDia: TLFPanel;
     LDiaSemana: TLFLabel;
     ToolButton1: TToolButton;
     TButtDiaSemanaAnterior: TToolButton;
     TButtDiaSemanaSiguiente: TToolButton;
     ADiaSemanaSiguiente: TAction;
     ADiaSemanaAnterior: TAction;
     ADiaSiguiente: TAction;
     ADiaAnterior: TAction;
     PNLFecha: TLFPanel;
     LFecha: TLFLabel;
     DEFecha: TLFDateEdit;
     ToolButton4: TToolButton;
     TButtDiaAnterior: TToolButton;
     TButtADiaSiguiente: TToolButton;
     PCEstructura: TLFPageControl;
     TSEstructuraGolondrina: TTabSheet;
     TSEstructuraCatamaran: TTabSheet;
     TSEstructuraEscuela: TTabSheet;
     PCHorarios: TLFPageControl;
     TSHorariosGolondrina: TTabSheet;
     TSHorariosCatamaran: TTabSheet;
     TSHorarioEscuela: TTabSheet;
     LActivoWeb: TLFLabel;
     LVisibleWeb: TLFLabel;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure ADiaSemanaSiguienteExecute(Sender: TObject);
     procedure ADiaSemanaAnteriorExecute(Sender: TObject);
     procedure DEFechaChange(Sender: TObject);
     procedure ADiaSiguienteExecute(Sender: TObject);
     procedure ADiaAnteriorExecute(Sender: TObject);
  private
     { Private declarations }
     DiaSemana: integer;
     procedure RefrescaDatos;
  public
     { Public declarations }
  end;

var
  FMControlPlazas : TFMControlPlazas;

implementation

uses UDMControlPlazas, UDMMain, DateUtils, UFormGest, UUtiles;

{$R *.dfm}

procedure TFMControlPlazas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMControlPlazas, DMControlPlazas);

  DEFecha.Date := Today;
  DMControlPlazas.SetFecha(DEFecha.Date);

  // 1 Lunes - 7 Domingo
  DiaSemana := DayOfTheWeek(DEFecha.Date);
  DMControlPlazas.SetDiaSemana(DiaSemana);

  RefrescaDatos;

  PCEstructura.ActivePage := TSEstructuraGolondrina;
  PCHorarios.ActivePage := TSHorariosGolondrina;
end;

procedure TFMControlPlazas.RefrescaDatos;
begin
  LDiaSemana.Caption := DiaStr(DiaSemana);
end;

procedure TFMControlPlazas.ADiaSemanaSiguienteExecute(Sender: TObject);
begin
  inherited;
  Inc(DiaSemana);
  if (DiaSemana > 7) then
     DiaSemana := 1;
  DMControlPlazas.SetDiaSemana(DiaSemana);
  RefrescaDatos;
end;

procedure TFMControlPlazas.ADiaSemanaAnteriorExecute(Sender: TObject);
begin
  inherited;
  Dec(DiaSemana);
  if (DiaSemana < 1) then
     DiaSemana := 7;
  DMControlPlazas.SetDiaSemana(DiaSemana);
  RefrescaDatos;
end;

procedure TFMControlPlazas.DEFechaChange(Sender: TObject);
begin
  inherited;
  DMControlPlazas.SetFecha(DEFecha.Date);
end;

procedure TFMControlPlazas.ADiaSiguienteExecute(Sender: TObject);
begin
  inherited;
  DEFecha.Date := DEFecha.Date + 1;
end;

procedure TFMControlPlazas.ADiaAnteriorExecute(Sender: TObject);
begin
  inherited;
  DEFecha.Date := DEFecha.Date - 1;
end;

end.
