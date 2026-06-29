unit UFPregDatosCSB34;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, StdCtrls, ULFEdit, ULFToolBar,
  ULFLabel, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, ULFPanel;

type
  TFPregDatosCSB34 = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LSufijo: TLFLabel;
     ESufijo: TLFEdit;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure ESufijoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     function Datos(var Sufijo: string): boolean;
  end;

var
  FPregDatosCSB34 : TFPregDatosCSB34;

implementation

{$R *.DFM}

procedure TFPregDatosCSB34.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFPregDatosCSB34.Datos(var Sufijo: string): boolean;
begin
  if (Sufijo = '') then
     Result := True
  else
  begin
     Caption := _('Datos de la Norma');
     ESufijo.MaxLength := Length(Sufijo);
     ESufijo.Text := Sufijo;

     Result := False;
     if (ShowModal = mrOk) then
     begin
        Sufijo := ESufijo.Text;
        Result := True;
     end;
  end;
end;

procedure TFPregDatosCSB34.ESufijoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

end.
