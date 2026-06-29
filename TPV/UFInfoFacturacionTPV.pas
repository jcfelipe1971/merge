unit UFInfoFacturacionTPV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ULFLabel, ULFToolBar, ToolWin,
  ActnList, UFormGest;

type
  TFInfoFacturacionTPV = class(TG2KForm)
     PNLMain: TPanel;
     LInfoGeneral: TLFLabel;
     GBProcesaCab: TGroupBox;
     LEjercicio: TLFLabel;
     LInfoEjercicio: TLFLabel;
     LCanal: TLFLabel;
     LInfoCanal: TLFLabel;
     LSerie: TLFLabel;
     LInfoSerie: TLFLabel;
     LTipo: TLFLabel;
     LInfoRig: TLFLabel;
     ActionList1: TActionList;
     ASalir: TAction;
     TBMain: TLFToolBar;
     BSalir: TToolButton;
     procedure ASalirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FInfoFacturacionTPV : TFInfoFacturacionTPV;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFInfoFacturacionTPV.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFInfoFacturacionTPV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFInfoFacturacionTPV.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
