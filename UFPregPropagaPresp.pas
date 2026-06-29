unit UFPregPropagaPresp;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFLabel, ULFComboBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit;

type
  TFPregPropagaPresp = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtConfirmar: TToolButton;
     TButtSalir: TToolButton;
     GBActualizar: TGroupBox;
     RBReal: TRadioButton;
     RBPresupuesto: TRadioButton;
     GBCentrosCoste: TGroupBox;
     EdCCInicialTit: TLFEdit;
     EdCCFinalTit: TLFEdit;
     GBNiveles: TGroupBox;
     GBIncrementos: TGroupBox;
     EFCCInicial: TLFEditFind2000;
     EFCCFinal: TLFEditFind2000;
     LBLCCInicial: TLFLabel;
     LBLCCFinal: TLFLabel;
     EFNivelInicial: TLFEditFind2000;
     EFNivelFinal: TLFEditFind2000;
     LBLNivelInicial: TLFLabel;
     Label4: TLFLabel;
     LBLIncPorciento: TLFLabel;
     LBLIncLineal: TLFLabel;
     EdIncPorc: TLFEdit;
     EdIncLineal: TLFEdit;
     CBEjercicio: TLFComboBox;
     LBLEjercicio: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure EFNivelInicialBusqueda(Sender: TObject);
     procedure EFNivelFinalBusqueda(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtConfirmarClick(Sender: TObject);
     procedure EFCCInicialBusqueda(Sender: TObject);
     procedure EFCCFinalBusqueda(Sender: TObject);
     procedure EFCCInicialChange(Sender: TObject);
     procedure EFCCFinalChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     CCInicial, CCFinal: string;
     Ejercicio, NivelInicial, NivelFinal: smallint;
     IncPorc, IncLineal: double;
     real, Presupuesto: boolean;
  end;

var
  FPregPropagaPresp : TFPregPropagaPresp;

implementation

{$R *.dfm}

uses
  UDMMain, UDMCentrosCoste;

procedure TFPregPropagaPresp.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  CBEjercicio.ItemIndex := DMCentrosCoste.LlenarEjercicios(CBEjercicio.Items);
  EFNivelInicial.Text := DMCentrosCoste.xCCActivoNIVEL.AsString;
  EFNivelFinal.Text := DMCentrosCoste.xCCActivoNIVEL.AsString;
  EFCCInicial.Text := DMCentrosCoste.xCCActivoCENTRO_COSTE.AsString;
  EFCCFinal.Text := DMCentrosCoste.xCCActivoCENTRO_COSTE.AsString;
end;

procedure TFPregPropagaPresp.EFNivelInicialBusqueda(Sender: TObject);
begin
  EFNivelInicial.CondicionBusqueda :=
     'PLAN_CONTABLE=''' + DMCentrosCoste.PlanActivo + '''';
end;

procedure TFPregPropagaPresp.EFNivelFinalBusqueda(Sender: TObject);
begin
  EFNivelFinal.CondicionBusqueda :=
     'PLAN_CONTABLE=''' + DMCentrosCoste.PlanActivo + '''';
end;

procedure TFPregPropagaPresp.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFPregPropagaPresp.TButtConfirmarClick(Sender: TObject);
begin
  Ejercicio := StrToIntDef(CBEjercicio.Text, 0);
  real := RBReal.Checked;
  Presupuesto := RBPresupuesto.Checked;
  NivelInicial := StrToIntDef(EFNivelInicial.Text, 0);
  NivelFinal := StrToIntDef(EFNivelFinal.Text, 0);
  IncPorc := StrToFloatDef(EdIncPorc.Text, 0);
  IncLineal := StrToFloatDef(EdIncPorc.Text, 0);
  CCInicial := EFCCInicial.Text;
  CCFinal := EFCCFinal.Text;
  ModalResult := mrOk;
end;

procedure TFPregPropagaPresp.EFCCInicialBusqueda(Sender: TObject);
begin
  EFCCInicial.CondicionBusqueda :=
     'PLAN_CONTABLE=''' + DMCentrosCoste.PlanActivo + '''';
end;

procedure TFPregPropagaPresp.EFCCFinalBusqueda(Sender: TObject);
begin
  EFCCFinal.CondicionBusqueda :=
     'PLAN_CONTABLE=''' + DMCentrosCoste.PlanActivo + '''';
end;

procedure TFPregPropagaPresp.EFCCInicialChange(Sender: TObject);
begin
  EdCCInicialTit.Text := DMCentrosCoste.DameTituloCC(EFCCInicial.Text);
end;

procedure TFPregPropagaPresp.EFCCFinalChange(Sender: TObject);
begin
  EdCCFinalTit.Text := DMCentrosCoste.DameTituloCC(EFCCFinal.Text);
end;

end.
