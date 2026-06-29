unit UFMCambiaIdioma;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ULFToolBar, StdCtrls, ULFLabel, ULFComboBox,
  ExtCtrls, ULFPanel, HYFIBQuery, UUtiles, UFormGest;

type
  TFMCambiaIdioma = class(TG2KForm)
     PnlMain: TLFPanel;
     CBIdioma: TLFComboBox;
     LblIdioma: TLFLabel;
     ButtAplicar: TButton;
     TBMain: TLFToolBar;
     TButtSalir: TToolButton;
     procedure TButtSalirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtAplicarClick(Sender: TObject);
     procedure TButtRestalecerListaClick(Sender: TObject);
  private
     { Private declarations }
     procedure EscribeIni;
     procedure ReestableceLista;
  public
     { Public declarations }
  end;

var
  FMCambiaIdioma : TFMCambiaIdioma;

implementation

uses UEntorno;

{$R *.dfm}

procedure TFMCambiaIdioma.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMCambiaIdioma.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  ReestableceLista;
end;

procedure TFMCambiaIdioma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMCambiaIdioma.ButtAplicarClick(Sender: TObject);
begin
  EscribeIni;

  UseLanguage(CBIdioma.Text);
  // El dominio se establece la primera vez en REntorno.InicializaIdioma
  // TextDomain('delfos_' + GetCurrentLanguage);
  RetranslateForms;

  //Close;
end;

procedure TFMCambiaIdioma.TButtRestalecerListaClick(Sender: TObject);
begin
  ReestableceLista;
end;

procedure TFMCambiaIdioma.ReestableceLista;
begin
  CBIdioma.Clear;
  DefaultInstance.GetListOfLanguages(Copy(ExtractFileName(Application.ExeName), 1, Pos('.', ExtractFileName(Application.ExeName)) - 1), CBIdioma.Items);
  CBIdioma.ItemIndex := CBIdioma.Items.IndexOf(GetCurrentLanguage);
end;

procedure TFMCambiaIdioma.EscribeIni;
begin
  EscribeDatoIni('Usuario', 'Lang', CBIdioma.Text);
end;

end.
