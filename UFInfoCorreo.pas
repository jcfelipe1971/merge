unit UFInfoCorreo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, ULFPanel, ULFLabel;

type
  TFInfoCorreo = class(TForm)
     PNLMain: TLFPanel;
     ANITempo: TAnimate;
     Mensajes: TLFLabel;
     Progreso: TProgressBar;
     IProgreso: TLFLabel;
     BitButtOK: TBitBtn;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Total, PWork: integer;
     procedure IncrementaBarra;
  end;

var
  FInfoCorreo : TFInfoCorreo;

implementation

uses UDMMain, UUtiles;

{$R *.DFM}

procedure TFInfoCorreo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TFInfoCorreo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AniTempo.Visible := False;
  AniTempo.Active := False;
  Mensajes.Visible := False;
  IProgreso.Visible := False;
  BitButtOK.Visible := False;
  Progreso.Visible := True;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BitButtOK, 1, DMMain.ILMain_Ac, 19);
end;

procedure TFInfoCorreo.IncrementaBarra;
var
  Por : integer;
begin
  Por := Trunc(Int((PWork / Total) * 100));
  if Por > 100 then
     Por := 99;
  IProgreso.Caption := IntToStr(Por) + '%';
  Progreso.Position := PWork;
end;

end.
