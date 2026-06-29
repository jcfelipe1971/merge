{ TODO : Hacer que se puedan editar los primeros niveles. (1 a 4) }
unit UFMEstructura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UNavigator, ComCtrls, ToolWin, StdCtrls, Spin, Grids, DBGrids,
  Mask, DBCtrls, dbcgrids, Buttons, UDBSpin, UControlEdit, UFormGest,
  ULFEdit, ULFPanel, ULFToolBar, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas, UEditPanel;

type
  TFMEstructura = class(TFPEditSinNavegador)
     TRKBNiveles: TTrackBar;
     EDTNiveles: TLFEdit;
     LBLNiveles: TLFLabel;
     SEDigitos: TSpinEdit;
     LBLEditable: TLFLabel;
     TButtGeneraContabilidad: TToolButton;
     TButtCancela: TToolButton;
     TButtPropaga: TToolButton;
     TButtCancelaTodos: TToolButton;
     TButtSep2: TToolButton;
     ANITempo: TAnimate;
     SGNiveles: TStringGrid;
     TButtGraba: TToolButton;
     TButtSep4: TToolButton;
     StatBarMain: TStatusBar;
     TButtBajaNiveles: TToolButton;
     TButtRegeneraGes: TToolButton;
     TButtSep3: TToolButton;
     TButtTraspasaUno: TToolButton;
     LBLDigitos: TLFLabel;
     PNLNiveles: TLFPanel;
     PNLVisualizacion: TLFPanel;
     PNLEdicion: TLFPanel;
     TButtSep1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TRKBNivelesChange(Sender: TObject);
     procedure TButtGeneraContabilidadClick(Sender: TObject);
     procedure TButtCancelaClick(Sender: TObject);
     procedure TButtCancelaTodosClick(Sender: TObject);
     procedure TButtGrabaClick(Sender: TObject);
     procedure TButtBajaNivelesClick(Sender: TObject);
     procedure TButtPropagaClick(Sender: TObject);
     procedure TButtRegeneraGesClick(Sender: TObject);
     procedure TButtTraspasaUnoClick(Sender: TObject);
  private
     { Private declarations }
     PosAnt: smallint;
     Resta: smallint;
     Niveles: smallint;
     Cambios: boolean; // Han Habido cambios en la estructura
     Estado: smallint; // Estado de la estructura
     procedure Animacion(Activo: boolean);
     procedure RellenaSGrid;
     procedure SubeNiveles;
     procedure bajaNiveles;
     procedure EstructuraEditable;
  public
     { Public declarations }
  end;

var
  FMEstructura : TFMEstructura;

implementation

uses UDMCuentas, UDMMain, UEntorno, UUtiles, UFMSGInformacion,
  UFMCanalesTraspasa;

{$R *.DFM}

var
  aDigAcum, aDigCont : TaDigCont;

procedure TFMEstructura.FormCreate(Sender: TObject);
begin
  inherited;
  Cambios := False;
  AbreData(TDMCuentas, DMCuentas);
  PosAnt := REntorno.NivelesCont;
  Niveles := PosAnt;
  aDigAcum := REntorno.DigitAcumula;
  aDigCont := REntorno.DigitCont;
  TRKBNiveles.Position := Niveles;
  EDTniveles.Text := IntToStr(TRKBNiveles.Position);
  Self.RellenaSGrid;
  SEDigitos.MaxValue := Resta;
  SEDigitos.Value := Resta;
  Self.EstructuraEditable;
end;

procedure TFMEstructura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMCuentas);
end;

procedure TFMEstructura.RellenaSGrid;
var
  x : smallint;
begin
  with SGNiveles do
  begin
     Cells[0, 0] := _('Nivel');
     Cells[1, 0] := _('Dígitos');
     Cells[2, 0] := _('Acumula');
     for x := 1 to 4 do
     begin
        aDigCont[x] := 1;
        aDigAcum[x] := x;
     end;
     Resta := 11;
     for x := 1 to 15 do
     begin
        Cells[0, x] := FormatFloat('##', x);
        Cells[1, x] := FormatFloat('##', aDigCont[x]);
        Cells[2, x] := FormatFloat('##', aDigAcum[x]);
     end;
     Row := Niveles;
  end;
end;

procedure TFMEstructura.TRKBNivelesChange(Sender: TObject);
begin
  if (TRKBNiveles.Position < 4) then
     TRKBNiveles.Position := 4;
  if (TRKBNiveles.Position > PosAnt) then
  begin
     if (SEDigitos.Value < 1) then
        TRKBNiveles.Position := PosAnt
     else
        Self.SubeNiveles;
  end;
  if (TRKBNiveles.Position < PosAnt) then
     Self.bajaNiveles;
end;

procedure TFMEstructura.SubeNiveles;
var
  Niv : smallint;
begin
  Cambios := True;
  Niv := TRKBNiveles.Position;
  aDigCont[Niv] := SEDigitos.Value;
  aDigAcum[Niv] := aDigAcum[Niv - 1] + aDigCont[Niv];
  Niveles := Niv;
  PosAnt := Niv;
  Resta := 15 - aDigAcum[Niv];
  SEDigitos.MaxValue := Resta;
  SEDigitos.Value := Resta;
  SGNiveles.Cells[0, Niv] := FormatFloat('##', Niv);
  SGNiveles.Cells[1, Niv] := FormatFloat('##', aDigCont[Niv]);
  SGNiveles.Cells[2, Niv] := FormatFloat('##', aDigAcum[Niv]);
  SGNiveles.Row := Niv;
end;

procedure TFMEstructura.BajaNiveles;
var
  Niv : smallint;
begin
  Cambios := True;
  Niv := TRKBNiveles.Position;
  aDigCont[Niv + 1] := 0;
  aDigAcum[Niv + 1] := 0;
  Niveles := Niv;
  PosAnt := Niv;
  Resta := 15 - aDigAcum[Niv];
  SEDigitos.MaxValue := Resta;
  SEDigitos.Value := Resta;
  SGNiveles.Cells[0, Niv + 1] := '';
  SGNiveles.Cells[1, Niv + 1] := '';
  SGNiveles.Cells[2, Niv + 1] := '';
  SGNiveles.Row := Niv;
end;

procedure TFMEstructura.TButtGeneraContabilidadClick(Sender: TObject);
begin
  if Cambios then
  begin
     ShowMessage(_('Se ha cambiado la estructura: Grabe antes de generar '));
     Exit;
  end;
  try
     Animacion(True);
     Screen.Cursor := crHourGlass;
     DMCuentas.AltaCuentas(1);
  finally
     Screen.Cursor := crDefault;
     Animacion(False);
  end;
  Self.EstructuraEditable;
end;

procedure TFMEstructura.TButtCancelaClick(Sender: TObject);
begin
  if (Estado = -1) then
  begin
     ShowMessage(_('No se pueden cancelar las cuentas porque tienen saldos'));
     Exit;
  end;
  try
     Animacion(True);
     Screen.Cursor := crHourGlass;
     DMCuentas.BajaCuentas;
  finally
     Screen.Cursor := crDefault;
     Animacion(False);
  end;
  Self.EstructuraEditable;
end;

procedure TFMEstructura.TButtCancelaTodosClick(Sender: TObject);
begin
  if Confirma then
  begin
     try
        Animacion(True);
        Screen.Cursor := crHourGlass;
        DMCuentas.PropagaCancelacion;
     finally
        Screen.Cursor := crDefault;
        Animacion(False);
     end;
     TFMSGInformacion.Create(Self).Muestra(DMCuentas.DSxPropagaBajas);
     EstructuraEditable;
  end;
end;

procedure TFMEstructura.Animacion(Activo: boolean);
begin
  AniTempo.Visible := Activo;
  AniTempo.Active := Activo;
end;

procedure TFMEstructura.TButtGrabaClick(Sender: TObject);
var
  x : integer;
begin
  if (DMCuentas.NivelesEditables <> 1) then
  begin
     ShowMessage(_('No se puede modificar la estructura contable : Tiene Datos '));
     Exit;
  end;
  for x := 1 to Niveles do
     DMCuentas.FijaNiveles(aDigCont[x], x);
  DMMain.AjustaNivelesContables;
  Cambios := False;
end;

procedure TFMEstructura.EstructuraEditable;
var
  Mensaje : string;
begin
  Estado := DMCuentas.NivelesEditables;
  case Estado of
     0: Mensaje := _('Hay Cuentas creadas sin apuntes');
     -1: Mensaje := _('Hay Cuentas creadas con apuntes');
     1: Mensaje := _('La estructura contable es editable');
  end; // Case
  STatBarMain.Panels[0].Text := Mensaje;
  PNLEdicion.Enabled := (Estado = 1);
end;

procedure TFMEstructura.TButtBajaNivelesClick(Sender: TObject);
begin
  if (Estado <> 1) then
  begin
     ShowMessage(_('No se pueden eliminar niveles porque hay cuentas'));
     Exit;
  end;
  if (Niveles > 4) then
  begin
     DMCuentas.BajaNiveles;
     aDigAcum := REntorno.DigitAcumula;
     aDigCont := REntorno.DigitCont;
     TRKBNiveles.Position := 4;
     Resta := 11;
     SEDigitos.MaxValue := Resta;
     SEDigitos.Value := Resta;
     Self.RellenaSGrid;
  end;
end;

procedure TFMEstructura.TButtPropagaClick(Sender: TObject);
begin
  if Confirma then
  begin
     try
        Animacion(True);
        Screen.Cursor := crHourGlass;
        DMCuentas.TodoPropaga;
     finally
        Screen.Cursor := crDefault;
        Animacion(False);
     end;
  end;
end;

procedure TFMEstructura.TButtRegeneraGesClick(Sender: TObject);
begin
  DMCuentas.GeneraCuentasGes;
end;

procedure TFMEstructura.TButtTraspasaUnoClick(Sender: TObject);
var
  canal : smallint;
begin
  if TFMCanalesTraspasa.Create(Self).muestra(canal) = mrOk then
  begin
     try
        Animacion(True);
        Screen.Cursor := crHourGlass;
        DMCuentas.PropagaCuentasCanal(canal);
     finally
        Screen.Cursor := crDefault;
        Animacion(False);
     end;
     TFMSGInformacion.Create(Self).Muestra(DMCuentas.DSxPropagaAltasUno);
  end;
end;

end.
