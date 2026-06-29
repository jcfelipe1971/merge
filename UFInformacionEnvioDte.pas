unit UFInformacionEnvioDte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ULFLabel, ULFPanel, ULFMemo;

type
  TFInformacionEnvioDte = class(TForm)
     LBLGeneral: TLFLabel;
     GBProcesaCab: TGroupBox;
     LTituloTipoDocTributario: TLFLabel;
     LTituloFolio: TLFLabel;
     LTituloCliente: TLFLabel;
     LTituloRutReceptor: TLFLabel;
     LTituloRig: TLFLabel;
     LTipoDocTributario: TLFLabel;
     LRig: TLFLabel;
     LFolio: TLFLabel;
     LRutReceptor: TLFLabel;
     LCliente: TLFLabel;
     PnlLog: TLFPanel;
     PnlMain: TLFPanel;
     MLog: TLFMemo;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FInformacionEnvioDte : TFInformacionEnvioDte;

implementation

{$R *.dfm}

procedure TFInformacionEnvioDte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
