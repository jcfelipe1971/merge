unit UFPregPlanCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEditListado, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  StdCtrls, ExtCtrls, UEditPanel, ToolWin, ActnList, Mask, DBCtrls,
  rxToolEdit, ULFEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregPlanCuentas = class(TFPEditListadoSimple)
     PNLLimites: TLFPanel;
     GBCuentas: TGroupBox;
     LInferior: TLFLabel;
     EFCuentaInf: TLFEditFind2000;
     LSuperior: TLFLabel;
     EFCuentaSup: TLFEditFind2000;
     GBOtros: TGroupBox;
     LCaracterRelleno: TLFLabel;
     ECharRelleno: TLFEdit;
     LTituloListado: TLFLabel;
     ETituloListado: TLFEdit;
     LFechaListado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     DBECtaDesde: TLFDbedit;
     DBECtaHasta: TLFDbedit;
     TButtConfRapida: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFCuentaInfChange(Sender: TObject);
     procedure EFCuentaSupChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFCuentaInfExit(Sender: TObject);
     procedure EFCuentaSupExit(Sender: TObject);
     procedure EFCuentaInfKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCuentaSupKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregPlanCuentas : TFPregPlanCuentas;

implementation

uses UDMMain, UEntorno, UFormGest, UDMRPlanCuentas, UFMListConfig, UFMain,
  UUtiles;

{$R *.DFM}

procedure TFPregPlanCuentas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRPlanCuentas, DMRPlanCuentas);

  Grupo := 19;
  Listado := DMRPlanCuentas.frPlanCuentas;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := DMRPlanCuentas.frxPlanCuentas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Self);
  EFCuentaInf.MaxLength := REntorno.DigitosSub;
  EFCuentaSup.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(EFCuentaInf);
  FMain.AddComponentePunto(EFCuentaSup);
end;

procedure TFPregPlanCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FMain.DelComponentePunto(EFCuentaInf);
  FMain.DelComponentePunto(EFCuentaSup);
  CierraData(DMRPlanCuentas);
end;

procedure TFPregPlanCuentas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  with DMRPlanCuentas do
  begin
     Cuenta_Inf := EFCuentaInf.Text;
     Cuenta_Sup := EFCuentaSup.Text;
     Char_Relleno := ECharRelleno.Text;
     CalculaInforme;
     Titulo := ETituloListado.Text;
     FechaListado := int(DTPFechaListado.Date);
     MostrarInforme(Modo);
  end;
end;

procedure TFPregPlanCuentas.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRPlanCuentas.Rangos;
  EFCuentaInf.Text := DMRPlanCuentas.Cuenta_Inf;
  EFCuentaSup.Text := DMRPlanCuentas.Cuenta_Sup;
  DTPFechaListado.Date := REntorno.FechaTrabSH;
end;

procedure TFPregPlanCuentas.EFCuentaInfChange(Sender: TObject);
begin
  DMRPlanCuentas.Actualiza_Cuenta(DMRPlanCuentas.xCta_Desde, EFCuentaInf.Text);
end;

procedure TFPregPlanCuentas.EFCuentaSupChange(Sender: TObject);
begin
  DMRPlanCuentas.Actualiza_Cuenta(DMRPlanCuentas.xCta_Hasta, EFCuentaSup.Text);
end;

procedure TFPregPlanCuentas.FormShow(Sender: TObject);
begin
  EFCuentaInf.SetFocus;
end;

procedure TFPregPlanCuentas.EFCuentaInfExit(Sender: TObject);
begin
  EFCuentaInf.Text := ExpandirCadena(EFCuentaInf.Text, REntorno.DigitosSub);
end;

procedure TFPregPlanCuentas.EFCuentaSupExit(Sender: TObject);
begin
  EFCuentaInf.Text := ExpandirCadena(EFCuentaInf.Text, REntorno.DigitosSub);
end;

procedure TFPregPlanCuentas.EFCuentaInfKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCuentaInf);
end;

procedure TFPregPlanCuentas.EFCuentaSupKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCuentaSup);
end;

end.
