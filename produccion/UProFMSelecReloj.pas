unit UProFMSelecReloj;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, rxPlacemnt,
  ULFPanel;

type
  TProFMSelecReloj = class(TForm)
     PanelMain: TLFPanel;
     DBGReloj: TDBGrid;
     BotoOk: TBitBtn;
     BotoCancel: TBitBtn;
     FormStorage: TFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BotoOkClick(Sender: TObject);
     procedure BotoCancelClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMSelecReloj : TProFMSelecReloj;

implementation

uses UProDMConfigRecMarcajes, UProFMReloj, UEntorno, UDMMain, UFMain, UFormGest, UUtiles;

{$R *.dfm}

procedure TProFMSelecReloj.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMConfigRecMarcajes, ProDMConfigRecMarcajes);

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BotoOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BotoCancel, 1, DMMain.ILMain_Ac, 20);
end;

procedure TProFMSelecReloj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMConfigRecMarcajes);
end;

procedure TProFMSelecReloj.BotoOkClick(Sender: TObject);
begin
  ProFMReloj.Configuracion := ProDMConfigRecMarcajes.QMConfigCabMarcaRIG.AsInteger;
  ProFMReloj.LblTipoReloj.Caption := ProDMConfigRecMarcajes.QMConfigCabMarcaDESCRIPCION.AsString;
  ProFMReloj.ModoMarcaje := ProDMConfigRecMarcajes.QMConfigCabMarcaTIPOMARCAJE.AsInteger;
  Close;
end;

procedure TProFMSelecReloj.BotoCancelClick(Sender: TObject);
begin
  Close;
end;

end.
