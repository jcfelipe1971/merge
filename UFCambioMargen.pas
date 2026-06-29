unit UFCambioMargen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMTarifaPArticulo, StdCtrls, ExtCtrls, UEditPanel, ComCtrls,
  ToolWin, UFormGest, ULFPanel, ULFToolBar, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit;

type
  TFCambioMargen = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     edtMargen: TLabeledEdit;
     RGModo: TRadioGroup;
     procedure TButtConfirmarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Margen: double;
     Modo: integer;
  end;

var
  FCambioMargen : TFCambioMargen;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFCambioMargen.TButtConfirmarClick(Sender: TObject);
begin
  try
     Margen := StrToFloat(EDTMArgen.Text);
     Modo := RGModo.ItemIndex;
     ModalResult := mrOk;
  except
     on E: Exception do
     begin
        ShowMessage(E.Message);
        Margen := 0;
     end;
  end;
end;

end.
