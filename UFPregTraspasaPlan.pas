unit UFPregTraspasaPlan;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  ULFLabel, ULFComboBox, Mask, DBCtrls, ULFDBEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000;

type
  TFPregTraspasaPlan = class(TForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtConfirmar: TToolButton;
     TButtSalir: TToolButton;
     LBLEmpresa: TLFLabel;
     LBLEjercicio: TLFLabel;
     LBLCanal: TLFLabel;
     EFEmpresa: TLFEditFind2000;
     DBETituloEmpresa: TLFDbedit;
     CBEjercicios: TLFComboBox;
     CBCanales: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure EFEmpresaChange(Sender: TObject);
     procedure TButtConfirmarClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Empresa, Ejercicio, Canal: smallint;
  end;

var
  FPregTraspasaPlan : TFPregTraspasaPlan;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPlanesContables, UEntorno;

procedure TFPregTraspasaPlan.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  EFEmpresa.Text := REntorno.EmpresaStr;
end;

procedure TFPregTraspasaPlan.EFEmpresaChange(Sender: TObject);
begin
  with DMPlanesContables do
  begin
     ActualizaEmpresa(StrToIntDef(EFEmpresa.Text, REntorno.Empresa));

     LlenaEjercicios;
     CBEjercicios.Items := Ejercicios;
     CBEjercicios.ItemIndex := 0;

     LlenaCanales(StrToInt(CBEjercicios.Text));
     CBCanales.Items := Canales;
     CBCanales.ItemIndex := 0;
  end;
end;

procedure TFPregTraspasaPlan.TButtConfirmarClick(Sender: TObject);
begin
  Empresa := StrToInt(EFEmpresa.Text);
  Ejercicio := StrToInt(CBEjercicios.Text);
  Canal := StrToInt(CBCanales.Text);

  ModalResult := mrOk;
end;

procedure TFPregTraspasaPlan.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
