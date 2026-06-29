unit UFPregModelo340;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ULFEdit, ULFComboBox,
  ULFLabel, DateUtils, rxPlacemnt, ULFFormStorage, ExtCtrls, ULFPanel,
  UFPEditListadoSimple;

type
  TFPregModelo340 = class(TFPEditListadoSimple)
     LPeriodo: TLFLabel;
     LEjercicio: TLFLabel;
     CBPeriodo: TLFComboBox;
     CBEjercicio: TLFComboBox;
     TBExportacion340: TToolButton;
     AExportarModelo340: TAction;
     LSecuencia: TLFLabel;
     ESecuencia: TLFEdit;
     LTipoDeclaracion: TLFLabel;
     LDeclaracionAnterior: TLFLabel;
     EDeclaracionAnterior: TLFEdit;
     CBTipoDeclaracion: TLFComboBox;
     LModoPresentacion: TLFLabel;
     CBModoPresentacion: TLFComboBox;
     LDesdeRegistro: TLFLabel;
     EDesdeRegistro: TLFEdit;
     LHastaRegistro: TLFLabel;
     EHastaRegistro: TLFEdit;
     TButtConfRapida: TToolButton;
     PNLLimites: TLFPanel;
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBTipoDeclaracionChange(Sender: TObject);
     procedure AExportarModelo340Execute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
     procedure periodo;
     function DamePeriodo: string;
  public
     { Public declarations }
  end;

var
  FPregModelo340 : TFPregModelo340;

implementation

uses UDMRModelosHacienda, UFormGest, UEntorno, UFMListConfig;

{$R *.dfm}

procedure TFPregModelo340.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFPregModelo340.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  periodo;
  DMRModelosHacienda.RecargaCombo(CBEjercicio);
  ARecargar.Execute;
  Grupo := 2005;
  Listado := DMRModelosHacienda.frModelo340;
end;

procedure TFPregModelo340.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
  Action := caFree;
end;

procedure TFPregModelo340.Periodo;
var
  periodo : string;
begin
  periodo := DMRModelosHacienda.DamePeriodo(1);
  CBPeriodo.ItemIndex := StrToIntDef(Periodo, 0) + 2;
  if periodo = '13' then
     CBPeriodo.ItemIndex := 0; // 1º Trimestre
  if periodo = '14' then
     CBPeriodo.ItemIndex := 1; // 2º Trimestre
  if periodo = '15' then
     CBPeriodo.ItemIndex := 2; // 3º Trimestre
  if periodo = '16' then
     CBPeriodo.ItemIndex := 3; // 4º Trimestre
end;

function TFPregModelo340.DamePeriodo: string;
begin
  Result := '13';
  case CBPeriodo.ItemIndex of
     0: Result := '13';
     1: Result := '14';
     2: Result := '15';
     3: Result := '16';
     4: Result := '01';
     5: Result := '02';
     6: Result := '03';
     7: Result := '04';
     8: Result := '05';
     9: Result := '06';
     10: Result := '07';
     11: Result := '08';
     12: Result := '09';
     13: Result := '10';
     14: Result := '11';
     15: Result := '12';
  end;
end;

procedure TFPregModelo340.CBTipoDeclaracionChange(Sender: TObject);
begin
  inherited;
  LDeclaracionAnterior.Visible := CBTipoDeclaracion.ItemIndex > 0;
  EDeclaracionAnterior.Visible := CBTipoDeclaracion.ItemIndex > 0;
end;

procedure TFPregModelo340.AExportarModelo340Execute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.FormatoModelo340(StrToInt(CBEjercicio.Text), DamePeriodo, StrToIntDef(ESecuencia.Text, 1), CBTipoDeclaracion.ItemIndex, EDeclaracionAnterior.Text, CBModoPresentacion.ItemIndex);
end;

procedure TFPregModelo340.ARecargarExecute(Sender: TObject);
begin
  inherited;
  CBEjercicio.ItemIndex := 0;
  CBPeriodo.ItemIndex := MonthOf(Now) + 2;
  ESecuencia.Text := '1';
  CBTipoDeclaracion.ItemIndex := 0;
  CBModoPresentacion.ItemIndex := 0;
  EDeclaracionAnterior.Text := '340EEEEPPSSSS';
  CBTipoDeclaracionChange(Sender); {Para poner visible/invisible EDeclaracionAnterior}
end;

procedure TFPregModelo340.APrevExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.Previsualizar340(StrToInt(CBEjercicio.Text), DamePeriodo, StrToIntDef(ESecuencia.Text, 1), CBTipoDeclaracion.ItemIndex, EDeclaracionAnterior.Text, CBModoPresentacion.ItemIndex, 0);
end;

procedure TFPregModelo340.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.Previsualizar340(StrToInt(CBEjercicio.Text), DamePeriodo, StrToIntDef(ESecuencia.Text, 1), CBTipoDeclaracion.ItemIndex, EDeclaracionAnterior.Text, CBModoPresentacion.ItemIndex, 1);
end;

end.
