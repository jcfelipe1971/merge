unit UFPregDatosCFM;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, StdCtrls, ULFEdit, ULFToolBar,
  ULFLabel, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, ULFPanel;

type
  TFPregDatosCFM = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LCedente: TLFLabel;
     ECedente: TLFEdit;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure ECedenteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     function Datos(var Cedente: string): boolean;
  end;

var
  FPregDatosCFM : TFPregDatosCFM;

implementation

{$R *.DFM}

procedure TFPregDatosCFM.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFPregDatosCFM.Datos(var Cedente: string): boolean;
begin
  Result := True;
  if (Length(Cedente) > 0) then
  begin
     Caption := _('Datos de la Norma');
     ECedente.MaxLength := Length(Cedente);
     ECedente.Text := Cedente;

     Result := False;
     if ShowModal = mrOk then
     begin
        Cedente := ECedente.Text;
        Result := True;
     end;
  end;
end;

procedure TFPregDatosCFM.ECedenteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

end.
