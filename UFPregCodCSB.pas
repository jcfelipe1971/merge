unit UFPregCodCSB;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, ToolWin, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, UControlEdit, UFormGest, ULFCheckBox, ULFEdit,
  ULFPanel, ULFToolBar, TFlatCheckBoxUnit, ULFLabel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas;

type
  TFPregCodCSB = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     ECodigoCSB: TLFEdit;
     LBLCodCSB: TLFLabel;
     CBRef: TLFCheckBox;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure ECodigoCSBKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     function ElegirCodigo(var Codigo: string; var Referencia: smallint): boolean;
  end;

var
  FPregCodCSB : TFPregCodCSB;

implementation

uses UDMMain, UDMRemesas, UEntorno;

{$R *.DFM}

procedure TFPregCodCSB.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFPregCodCSB.ElegirCodigo(var Codigo: string; var Referencia: smallint): boolean;
begin
  ECodigoCSB.Text := Codigo;

  Result := False;
  if ShowModal = mrOk then
  begin
     Codigo := IntToStr(StrToIntDef(ECodigoCSB.Text, 0));

     while (Length(Codigo) < 3) do
        Codigo := '0' + Codigo;

     if (CBRef.Checked) then
        Referencia := 1
     else
        Referencia := 0;

     Result := True;
  end;
end;

procedure TFPregCodCSB.ECodigoCSBKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

end.
