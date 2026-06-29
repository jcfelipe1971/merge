unit UFInfoTraspasoACont;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, StdCtrls, ULFLabel;

type
  TFInfoTraspasoACont = class(TForm)
     PNLMain: TLFPanel;
     LBLGeneral: TLFLabel;
     GBProcesaCab: TGroupBox;
     LEjercicio: TLFLabel;
     LBLEjercicio: TLFLabel;
     LRIB: TLFLabel;
     LBLRib: TLFLabel;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FInfoTraspasoACont : TFInfoTraspasoACont;

implementation

{$R *.dfm}

end.
