unit UFInfoFacturacionAlb;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ULFLabel, ULFPanel;

type
  TFInfoFacturacionAlb = class(TForm)
     PNLMain: TLFPanel;
     LBLGeneral: TLFLabel;
     GBProcesaCab: TGroupBox;
     LTitEjercicio: TLFLabel;
     LBLEjercicio: TLFLabel;
     LTitCanal: TLFLabel;
     LBLCanal: TLFLabel;
     LTitSerie: TLFLabel;
     LBLSerie: TLFLabel;
     LTitRIG: TLFLabel;
     LBLRig: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FInfoFacturacionAlb : TFInfoFacturacionAlb;

implementation

{$R *.dfm}

procedure TFInfoFacturacionAlb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
