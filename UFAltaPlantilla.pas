unit UFAltaPlantilla;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, UFIBDBEditfind, UControlEdit, UFormGest,
  ULFEdit, ULFPanel, ULFLabel;

type
  TFAltaPlantilla = class(TG2KForm)
     PNLEdit: TLFPanel;
     PNLBotones: TLFPanel;
     BBAceptar: TBitBtn;
     BBCancelar: TBitBtn;
     LBLPlantilla: TLFLabel;
     LBLTitulo: TLFLabel;
     EDTNom: TLFEdit;
     RECod: THYGRightEdit;
     LBLAviso: TLFLabel;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     function Muestra(var Cod: integer; var Nom: string): integer;
  end;

var
  FAltaPlantilla : TFAltaPlantilla;

implementation

uses UDMMain, UUtiles;

{$R *.DFM}

function TFAltaPlantilla.Muestra(var Cod: integer; var Nom: string): integer;
begin
  RECod.Text := IntToStr(Cod);
  EDTNom.Text := Nom;
  Result := ShowModal;
  if (Result = mrOk) then
  begin
     Cod := StrToInt(RECod.Text);
     Nom := EDTNom.Text;
  end;
end;

procedure TFAltaPlantilla.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancelar, 1, DMMain.ILMain_Ac, 0);
end;

end.
