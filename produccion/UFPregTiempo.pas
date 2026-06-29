unit UFPregTiempo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, ULFLabel, ULFEdit, ULFPanel;

type
  TFPregTiempo = class(TForm)
     BOk: TButton;
     BCancel: TButton;
     PNLTiempo: TLFPanel;
     LTiempo: TLFLabel;
     SeparadorHoraMinuto: TLFLabel;
     LSeparadorMinutoSegundo: TLFLabel;
     LFEHoras: TLFEdit;
     LFEMinutos: TLFEdit;
     LFESegundos: TLFEdit;
     procedure LFEHorasExit(Sender: TObject);
     procedure LFEMinutosExit(Sender: TObject);
     procedure LFESegundosExit(Sender: TObject);
     procedure LFEHorasKeyPress(Sender: TObject; var Key: char);
     procedure LFEMinutosKeyPress(Sender: TObject; var Key: char);
     procedure LFESegundosKeyPress(Sender: TObject; var Key: char);
     procedure FormActivate(Sender: TObject);
     procedure LFEHorasEnter(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregTiempo : TFPregTiempo;

implementation

{$R *.DFM}

procedure TFPregTiempo.LFEHorasExit(Sender: TObject);
begin
  LFEHoras.Text := Format('%2.2d', [StrToIntDef(LFEHoras.Text, 0)]);

  if (StrToInt(LFEHoras.Text) > 23) then
     LFEHoras.SetFocus();
end;

procedure TFPregTiempo.LFEMinutosExit(Sender: TObject);
begin
  LFEMinutos.Text := Format('%2.2d', [StrToIntDef(LFEMinutos.Text, 0)]);

  if (StrToInt(LFEMinutos.Text) > 59) then
     LFEMinutos.SetFocus();
end;

procedure TFPregTiempo.LFESegundosExit(Sender: TObject);
begin
  LFESegundos.Text := Format('%2.2d', [StrToIntDef(LFESegundos.Text, 0)]);

  if (StrToInt(LFESegundos.Text) > 59) then
     LFESegundos.SetFocus();
end;

procedure TFPregTiempo.LFEHorasKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, '-'{, ThousandSeparator, DecimalSeparator}]) then
     Key := #0;
end;

procedure TFPregTiempo.LFEMinutosKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8{, '-', ThousandSeparator, DecimalSeparator}]) then
     Key := #0;
end;

procedure TFPregTiempo.LFESegundosKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8{, '-', ThousandSeparator, DecimalSeparator}]) then
     Key := #0;
end;

procedure TFPregTiempo.FormActivate(Sender: TObject);
begin
  LFEHoras.SetFocus;
end;

procedure TFPregTiempo.LFEHorasEnter(Sender: TObject);
begin
  LFEHoras.SelStart := 0;
  LFEHoras.SelLength := Length(LFEHoras.Text);
  LFEHoras.SelectAll;
end;

procedure TFPregTiempo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
