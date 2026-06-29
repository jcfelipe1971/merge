unit UFMRemesasImpagado;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, ToolWin, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, URightMaskEdit, UFIBDBEditfind, UControlEdit, UFormGest,
  rxToolEdit, ULFToolBar, ULFLabel, ULFEdit, UComponentesBusquedaFiltrada,
  ULFEditFind2000, ULFDateEdit, ULFPanel, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMRemesasImpagado = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     DTPFechaImpagado: TLFDateEdit;
     LFechaImpagado: TLFLabel;
     LBLIvaGastos: TLFLabel;
     LBLGastosSinIva: TLFLabel;
     LBLGastos: TLFLabel;
     REBaseGastos: TLFEdit;
     REIvaGastos: TLFEdit;
     REGastosSinIva: TLFEdit;
     EFDigito_1: TLFEditFind2000;
     EFDigito_2: TLFEditFind2000;
     EFDigito_3: TLFEditFind2000;
     EFDigito_4: TLFEditFind2000;
     EFDigito_5: TLFEditFind2000;
     LCentroCoste: TLFLabel;
     CBGastosEmpresa: TLFCheckBox;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure OnKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     function ElegirImpagadoRemesa(var Fecha: TDateTime; var Gastos, GastosIVA, GastosSinIVA: double; var d1, d2, d3, d4, d5: string; var GastosEmpresa: boolean; TituloVentana: string): boolean;
  end;

var
  FMRemesasImpagado : TFMRemesasImpagado;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMRemesasImpagado.TButtConfirmarClick(Sender: TObject);
var
  Ex : boolean;
begin
  Ex := True;
  try
     if (REBaseGastos.Text = '') then
        REBaseGastos.Text := '0';
     REBaseGastos.Text := FormatFloat(MascaraN, StrToFloat(REBaseGastos.Text));
  except
     REBaseGastos.SetFocus();
     REBaseGastos.SelectAll;
     Ex := False;
  end;

  try
     if (REIvaGastos.Text = '') then
        REIvaGastos.Text := '0';
     REIvaGastos.Text := FormatFloat(MascaraN, StrToFloat(REIvaGastos.Text));
  except
     REIvaGastos.SetFocus();
     REIvaGastos.SelectAll;
     Ex := False;
  end;

  try
     if (REGastosSinIva.Text = '') then
        REGastosSinIva.Text := '0';
     REGastosSinIva.Text := FormatFloat(MascaraN, StrToFloat(REGastosSinIva.Text));
  except
     REGastosSinIva.SetFocus();
     REGastosSinIva.SelectAll;
     Ex := False;
  end;

  if Ex then
     ModalResult := mrOk
  else
     ModalResult := mrNone;
end;

function TFMRemesasImpagado.ElegirImpagadoRemesa(var Fecha: TDateTime; var Gastos, GastosIVA, GastosSinIVA: double; var d1, d2, d3, d4, d5: string; var GastosEmpresa: boolean; TituloVentana: string): boolean;
begin
  Caption := TituloVentana;
  Result := False;
  DTPFechaImpagado.Date := REntorno.FechaTrabSH;
  if ShowModal = mrOk then
  begin
     Fecha := Trunc(DTPFechaImpagado.Date);
     Gastos := StrToFloatDec(Trim(StringReplace(REBaseGastos.Text, ThousandSeparator, '', [rfReplaceAll])), DecimalSeparator);
     GastosIVA := StrToFloatDec(Trim(StringReplace(REIvaGastos.Text, ThousandSeparator, '', [rfReplaceAll])), DecimalSeparator);
     GastosSinIVA := StrToFloatDec(Trim(StringReplace(REGastosSinIva.Text, ThousandSeparator, '', [rfReplaceAll])), DecimalSeparator);
     d1 := EFDigito_1.Text;
     d2 := EFDigito_2.Text;
     d3 := EFDigito_3.Text;
     d4 := EFDigito_4.Text;
     d5 := EFDigito_5.Text;
     GastosEmpresa := CBGastosEmpresa.Checked;
     Result := True;
  end;
end;

procedure TFMRemesasImpagado.OnKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     TButtConfirmarClick(TButtConfirmar);
end;

end.
