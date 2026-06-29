unit UFPregModelo349;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, DBCtrls, ULFComboBox,
  ULFActionList, ULFPageControl, ULFToolBar, ULFLabel, ShellApi, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt, ULFFormStorage, ULFPanel,
  UFPEditListadoSimple;

type
  TFPregModelo349 = class(TFPEditListadoSimple)
     CBPeriodo: TLFComboBox;
     LPeriodo: TLFLabel;
     LEjercicio: TLFLabel;
     CBEjercicio: TLFComboBox;
     TButtConfigurar: TToolButton;
     TButtExportar: TToolButton;
     TButtInstrucciones: TToolButton;
     AInstrucciones: TAction;
     LTipoSoporte: TLFLabel;
     CBTipoSoporte: TLFComboBox;
     LNumeroDeclaracion: TLFLabel;
     ENroDeclaracion: TLFEdit;
     CBDeclaracionSustitutiva: TLFCheckBox;
     ENroDeclaracionSustituir: TLFEdit;
     PNLLimites: TLFPanel;
     function DamePeriodo: string;
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AExportarExecute(Sender: TObject);
     procedure AInstruccionesExecute(Sender: TObject);
     procedure CBDeclaracionSustitutivaChange(Sender: TObject);
  private
     { Private declarations }
     DevolucionMensual: boolean;
     procedure Periodo;
  public
     { Public declarations }
  end;

var
  FPregModelo349 : TFPregModelo349;

implementation

uses UDMMain, UDMRModelosHacienda, UEntorno, UFormGest, UDMListados,
  UFMListConfig, UUtiles;

{$R *.DFM}

procedure TFPregModelo349.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFPregModelo349.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);

  with CBPeriodo do
  begin
     Clear;
     if (DMRModelosHacienda.xDatosModelosHaciendaDEVOLUCION_MENSUAL_M349.AsInteger = 1) then
     begin
        Items.Add(MesStr(1));
        Items.Add(MesStr(2));
        Items.Add(MesStr(3));
        Items.Add(MesStr(4));
        Items.Add(MesStr(5));
        Items.Add(MesStr(6));
        Items.Add(MesStr(7));
        Items.Add(MesStr(8));
        Items.Add(MesStr(9));
        Items.Add(MesStr(10));
        Items.Add(MesStr(11));
        Items.Add(MesStr(12));
        Items.Add(_('Ejercicio completo'));
        DropDownCount := 13;
        DevolucionMensual := True;
     end
     else
     begin
        Items.Add(_('1º Trimestre'));
        Items.Add(_('2º Trimestre'));
        Items.Add(_('3º Trimestre'));
        Items.Add(_('4º Trimestre'));
        Items.Add(_('Ejercicio completo'));
        DropDownCount := 5;
        DevolucionMensual := False;
     end;
  end;

  Periodo;
  DMRModelosHacienda.RecargaCombo(CBEjercicio);
  CBTipoSoporte.ItemIndex := 1;
  CBDeclaracionSustitutiva.Checked := False;
  CBDeclaracionSustitutivaChange(Sender); // Para que ponga visible/invisible ENroDeclaracionSustituir

  Grupo := 151;
  Listado := DMRModelosHacienda.frModelo349;
end;

procedure TFPregModelo349.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
  Action := caFree;
end;

procedure TFPregModelo349.APrevExecute(Sender: TObject);
begin
  DMRModelosHacienda.Previsualizar349(StrToIntDef(CBEjercicio.Text, REntorno.Ejercicio),
     DamePeriodo, 0);
end;

function TFPregModelo349.DamePeriodo: string;
begin
  if (DevolucionMensual) then
  begin
     case CBPeriodo.ItemIndex of
        0: Result := '01';
        1: Result := '02';
        2: Result := '03';
        3: Result := '04';
        4: Result := '05';
        5: Result := '06';
        6: Result := '07';
        7: Result := '08';
        8: Result := '09';
        9: Result := '10';
        10: Result := '11';
        11: Result := '12';
        12: Result := '19';
     end;
  end
  else
  begin
     case CBPeriodo.ItemIndex of
        0: Result := '13';
        1: Result := '14';
        2: Result := '15';
        3: Result := '16';
        4: Result := '19';
     end;
  end;
end;

procedure TFPregModelo349.AImprimirExecute(Sender: TObject);
begin
  DMRModelosHacienda.Previsualizar349(StrToIntDef(CBEjercicio.Text, REntorno.Ejercicio),
     DamePeriodo, 1);
end;

procedure TFPregModelo349.Periodo;
var
  Periodo : string;
begin
  if (DevolucionMensual) then
  begin
     Periodo := DMRModelosHacienda.DamePeriodo(1);
     if Periodo = '01' then
        CBPeriodo.ItemIndex := 0;
     if Periodo = '02' then
        CBPeriodo.ItemIndex := 1;
     if Periodo = '03' then
        CBPeriodo.ItemIndex := 2;
     if Periodo = '04' then
        CBPeriodo.ItemIndex := 3;
     if Periodo = '05' then
        CBPeriodo.ItemIndex := 4;
     if Periodo = '06' then
        CBPeriodo.ItemIndex := 5;
     if Periodo = '07' then
        CBPeriodo.ItemIndex := 6;
     if Periodo = '08' then
        CBPeriodo.ItemIndex := 7;
     if Periodo = '09' then
        CBPeriodo.ItemIndex := 8;
     if Periodo = '10' then
        CBPeriodo.ItemIndex := 9;
     if Periodo = '11' then
        CBPeriodo.ItemIndex := 10;
     if Periodo = '12' then
        CBPeriodo.ItemIndex := 11;
  end
  else
  begin
     Periodo := DMRModelosHacienda.DamePeriodo(0);
     if Periodo = '13' then
        CBPeriodo.ItemIndex := 0; // 1º Trimestre
     if Periodo = '14' then
        CBPeriodo.ItemIndex := 1; // 2º Trimestre
     if Periodo = '15' then
        CBPeriodo.ItemIndex := 2; // 3º Trimestre
     if Periodo = '16' then
        CBPeriodo.ItemIndex := 3; // 4º Trimestre
  end;
end;

procedure TFPregModelo349.AExportarExecute(Sender: TObject);
begin
  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  DMRModelosHacienda.FormatoModelo349(DamePeriodo, CBTipoSoporte.ItemIndex, StrToIntDef(ENroDeclaracion.Text, 0), CBDeclaracionSustitutiva.Checked, StrToIntDef(ENroDeclaracionSustituir.Text, 0));
  CierraData(DMRModelosHacienda);
end;

procedure TFPregModelo349.AInstruccionesExecute(Sender: TObject);
begin
  {dji lrk kri - Cambio la ruta, relativa al exe}
  if ShellExecute(Application.Handle, nil, PChar(REntorno.RutaEXE + 'ModelosHacienda\instr_349.pdf'), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la búsqueda de la ayuda'));
end;

procedure TFPregModelo349.CBDeclaracionSustitutivaChange(Sender: TObject);
begin
  inherited;
  ENroDeclaracionSustituir.Visible := CBDeclaracionSustitutiva.Checked;
end;

end.
