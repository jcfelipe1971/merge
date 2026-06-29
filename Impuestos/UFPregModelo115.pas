unit UFPregModelo115;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, DBCtrls, ULFComboBox,
  ULFActionList, ULFPageControl, ULFToolBar, ULFLabel, ShellApi,
  rxPlacemnt, ULFFormStorage, ULFPanel, UFPEditListadoSimple;

type
  TFPregModelo115 = class(TFPEditListadoSimple)
     CBPeriodo: TLFComboBox;
     LPeriodo: TLFLabel;
     LEjercicio: TLFLabel;
     CBEjercicio: TLFComboBox;
     TButtConfigurar: TToolButton;
     TButtModeloOficial: TToolButton;
     TButtInstrucciones: TToolButton;
     AModeloOficial: TAction;
     AIntrucciones: TAction;
     PNLLimites: TLFPanel;
     function DamePeriodo: string;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AModeloOficialExecute(Sender: TObject);
     procedure AIntruccionesExecute(Sender: TObject);
  private
     { Private declarations }
     procedure Periodo;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregModelo115 : TFPregModelo115;

implementation

uses UDMMain, UDMRModelosHacienda, UEntorno, UFormGest, UDMListados,
  UFMListConfig;

{$R *.DFM}

procedure TFPregModelo115.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  Periodo;
  DMRModelosHacienda.RecargaCombo(CBEjercicio);
  Grupo := 130;
  Listado := DMRModelosHacienda.frModelo115;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregModelo115.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
  Action := caFree;
end;

function TFPregModelo115.DamePeriodo: string;
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
     16: Result := '19';
  end;
end;

procedure TFPregModelo115.Periodo;
var
  aPeriodo : string;
begin
  aPeriodo := DMRModelosHacienda.DamePeriodo(0);
  if (aPeriodo = '13') then
     CBPeriodo.ItemIndex := 0; // 1º Trimestre
  if (aPeriodo = '14') then
     CBPeriodo.ItemIndex := 1; // 2º Trimestre
  if (aPeriodo = '15') then
     CBPeriodo.ItemIndex := 2; // 3º Trimestre
  if (aPeriodo = '16') then
     CBPeriodo.ItemIndex := 3; // 4º Trimestre
end;

procedure TFPregModelo115.AModeloOficialExecute(Sender: TObject);
begin
  DMRModelosHacienda.GeneraModeloOficial_115(StrToIntDef(CBEjercicio.Text, REntorno.Ejercicio),
     DamePeriodo);
end;

procedure TFPregModelo115.AIntruccionesExecute(Sender: TObject);
begin
  {dji lrk kri - Cambio la ruta, relativa al exe}
  if ShellExecute(Application.Handle, nil, PChar(REntorno.RutaEXE + 'ModelosHacienda\intr_mod115.pdf'), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la busqueda de la ayuda'));
end;

procedure TFPregModelo115.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRModelosHacienda.Previsualizar115(StrToIntDef(CBEjercicio.Text, REntorno.Ejercicio),
     DamePeriodo, Modo);
end;

end.
