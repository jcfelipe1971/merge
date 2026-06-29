unit UFLogo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, GIFImage, jpeg;

type
  TFLogo = class(TForm)
     IMGFondoClose: TImage;
     ImgAdmXXI: TImage;
     ImgMaxFactu: TImage;
     procedure FormCreate(Sender: TObject);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FLogo : TFLogo;

implementation

uses UEntorno;

{$R *.DFM}

procedure TFLogo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Imagen Logo Delfos
  ClientHeight := 257;
  ClientWidth := 308;

  {$IFDEF AdmXXI}
  // Imagen Logo Administra XXI
  IMGFondoClose.Picture.Assign(ImgAdmXXI.Picture);
  ClientHeight := 468;
  ClientWidth := 468;
  {$ENDIF}

  {$IFDEF MaxFactu}
  // Imagen Logo MaxFactu
  IMGFondoClose.Picture.Assign(ImgMaxFactu.Picture);
  ClientHeight := 137;
  ClientWidth := 427;
  {$ENDIF}

  Brush.Style := bsClear;
  try
     if (REntorno.Logo <> '') then
        IMGFondoClose.Picture.LoadFromFile(REntorno.Logo);
  except

  end;
end;

procedure TFLogo.FormResize(Sender: TObject);
begin
  Position := poScreenCenter;
end;

end.
