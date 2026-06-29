unit UFPregEtiVacias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXSpin, ULFLabel, ExtCtrls, ULFPanel, UFormGest,
  TFlatEditUnit, TFlatSpinEditUnit, ULFEdit;

type
  TFPregEtiVacias = class(TG2KForm)
     LFPNMain: TLFPanel;
     LBLEtiVacias: TLFLabel;
     PNLBotones: TLFPanel;
     BBAceptar: TBitBtn;
     BBCancelar: TBitBtn;
     EEtiquetas: TLFEdit;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function Muestra: integer;
  end;

var
  FPregEtiVacias : TFPregEtiVacias;

implementation

uses UUtiles, UDMMain;

{$R *.dfm}

function TFPregEtiVacias.Muestra: integer;
begin
  EEtiquetas.Text := '0';
  if (ShowModal = mrOk) then
     Result := StrToIntDef(EEtiquetas.Text, 0)
  else
     Result := -1;
end;

procedure TFPregEtiVacias.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancelar, 1, DMMain.ILMain_Ac, 0);
end;

end.
