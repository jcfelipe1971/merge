unit UFSendCorreo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UFormGest,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, ULFPanel, ULFLabel;

type
  TFSendCorreo = class(TG2KForm)
     PNLMain: TLFPanel;
     LTexto: TLFLabel;
     BitBtnOk: TBitBtn;
     PNLTexto: TLFPanel;
     PBProgreso: TProgressBar;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BitBtnOkClick(Sender: TObject);
     procedure PNLMainResize(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     SePuede: boolean;
     procedure Titulo(s: string);
     procedure Texto(s: string);
     procedure CambiarSizeFont(aSize: integer);
     procedure AlineamientoFont(aAlignment: TAlignment);
     procedure MuestraBarraProgreso(aMax: integer);
  end;

var
  FSendCorreo : TFSendCorreo;

implementation

uses UEntorno, UDMMain, UUtiles;

{$R *.DFM}

procedure TFSendCorreo.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  BitBtnOk.Visible := False;
  PBProgreso.Visible := False;

  SePuede := False;

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(BitBtnOk, 1, DMMain.ILMain_Ac, 19);
end;

procedure TFSendCorreo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not (SePuede) then
     Exit;
  Action := caFree;
end;

procedure TFSendCorreo.BitBtnOkClick(Sender: TObject);
begin
  SePuede := True;
  Close;
end;

procedure TFSendCorreo.Titulo(s: string);
begin
  Caption := s;
end;

procedure TFSendCorreo.Texto(s: string);
begin
  LTexto.Caption := s;
  Application.ProcessMessages;
end;

procedure TFSendCorreo.CambiarSizeFont(aSize: integer);
begin
  LTexto.Font.Size := aSize;
end;

procedure TFSendCorreo.AlineamientoFont(aAlignment: TAlignment);
begin
  LTexto.Alignment := aAlignment;
end;

procedure TFSendCorreo.PNLMainResize(Sender: TObject);
begin
  BitBtnOk.Left := (Self.Left div 2) - (BitBtnOk.Left div 2);
end;

procedure TFSendCorreo.FormShow(Sender: TObject);
begin
  PNLMainResize(Sender);
end;

procedure TFSendCorreo.MuestraBarraProgreso(aMax: integer);
begin
  with PBProgreso do
  begin
     Max := aMax;
     Position := 0;
     Visible := True;
  end;
end;

end.
