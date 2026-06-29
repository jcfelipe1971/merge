unit UFEligeModoXML;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UEditPanel, ComCtrls,
  ToolWin, UFormGest, ULFPanel, ULFToolBar;

type
  TFEligeModoXML = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtConfirmar: TToolButton;
     EPMain: THYMEditPanel;
     PNMain: TLFPanel;
     RGVersion: TRadioGroup;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     // Margen: double;
     Modo: integer;
  end;

var
  FEligeModoXML : TFEligeModoXML;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFEligeModoXML.TButtConfirmarClick(Sender: TObject);
begin
  Modo := RGVersion.ItemIndex;
  ModalResult := mrOk;
end;

procedure TFEligeModoXML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Action := caFree;
end;

end.
