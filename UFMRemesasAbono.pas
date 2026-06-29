unit UFMRemesasAbono;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, ToolWin, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, UControlEdit, UFormGest, rxToolEdit, RXDBCtrl,
  UFIBDBEditfind, ULFToolBar, ULFLabel, ULFEdit, ULFDateEdit,
  UComponentesBusquedaFiltrada, ULFEditFind2000;

type
  TFMRemesasAbono = class(TG2KForm)
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     TButtConfirmar: TToolButton;
     LFechaAbono: TLFLabel;
     LBLBase: TLFLabel;
     LImporteCA: TLFLabel;
     CargosDescuento: TLFLabel;
     LBLIba: TLFLabel;
     LBLGastosSinIva: TLFLabel;
     DEFechaAbono: TLFDateEdit;
     REBaseGastos: TLFEdit;
     REGastosIva: TLFEdit;
     REGastosSinIva: TLFEdit;
     REGastosDto: TLFEdit;
     REImporteCA: TLFEdit;
     LCentroCoste: TLFLabel;
     EFDigito_1: TLFEditFind2000;
     EFDigito_2: TLFEditFind2000;
     EFDigito_3: TLFEditFind2000;
     EFDigito_4: TLFEditFind2000;
     EFDigito_5: TLFEditFind2000;
     LFechaGastos: TLFLabel;
     DEFechaGastos: TLFDateEdit;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure OnKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     // Obtener los datos del los gastos del abono.
     function ObtenerGastosAbono(var Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA: double; var FechaAbono, FechaGastos: TDateTime; var d1, d2, d3, d4, d5: string; TituloVentana: string): boolean;
  end;

var
  FMRemesasAbono : TFMRemesasAbono;

implementation

uses UDMMain, UEntorno, UFMain;

{$R *.DFM}

procedure TFMRemesasAbono.TButtConfirmarClick(Sender: TObject);
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
     if (REGastosIva.Text = '') then
        REGastosIva.Text := '0';
     REGastosIva.Text := FormatFloat(MascaraN, StrToFloat(REGastosIva.Text));
  except
     REGastosIva.SetFocus();
     REGastosIva.SelectAll;
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
  try
     if (REGastosDto.Text = '') then
        REGastosDto.Text := '0';
     REGastosDto.Text := FormatFloat(MascaraN, StrToFloat(REGastosDto.Text));
  except
     REGastosDto.SetFocus();
     REGastosDto.SelectAll;
     Ex := False;
  end;
  try
     if (REImporteCA.Text = '') then
        REImporteCA.Text := '0';
     REImporteCA.Text := FormatFloat(MascaraN, StrToFloat(REImporteCA.Text));
  except
     REImporteCA.SetFocus();
     REImporteCA.SelectAll;
     Ex := False;
  end;
  if Ex then
     ModalResult := mrOk
  else
     ModalResult := mrNone;
end;

procedure TFMRemesasAbono.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  {
  FMain.DelComponentePunto(REBaseGastos);
  FMain.DelComponentePunto(REGastosIva);
  FMain.DelComponentePunto(REGastosSinIva);
  FMain.DelComponentePunto(REGastosDto);
  FMain.DelComponentePunto(REImporteCA);
  }
  Action := caFree;
end;

function TFMRemesasAbono.ObtenerGastosAbono(var Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA: double; var FechaAbono, FechaGastos: TDateTime; var d1, d2, d3, d4, d5: string; TituloVentana: string): boolean;
begin
  Caption := TituloVentana;
  Result := False;
  DEFechaAbono.Date := REntorno.FechaTrabSH;
  DEFechaGastos.Date := REntorno.FechaTrabSH;
  if ShowModal = mrOk then
  begin
     FechaAbono := Trunc(DEFechaAbono.Date);
     FechaGastos := Trunc(DEFechaGastos.Date);
     try
        Gastos := StrToFloat(REBaseGastos.Text);
     except
        Gastos := 0;
     end;
     try
        GastosIva := StrToFloat(REGastosIva.Text);
     except
        GastosIva := 0;
     end;
     try
        GastosSinIva := StrToFloat(REGastosSinIva.Text);
     except
        GastosSinIva := 0;
     end;
     try
        GastosDto := StrToFloat(REGastosDto.Text);
     except
        GastosDto := 0;
     end;
     try
        ImporteCA := StrToFloat(REImporteCA.Text);
     except
        ImporteCA := 0;
     end;
     d1 := EFDigito_1.Text;
     d2 := EFDigito_2.Text;
     d3 := EFDigito_3.Text;
     d4 := EFDigito_4.Text;
     d5 := EFDigito_5.Text;
     Result := True;
  end;
end;

procedure TFMRemesasAbono.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  {
  FMain.AddComponentePunto(REBaseGastos);
  FMain.AddComponentePunto(REGastosIva);
  FMain.AddComponentePunto(REGastosSinIva);
  FMain.AddComponentePunto(REGastosDto);
  FMain.AddComponentePunto(REImporteCA);
  }
end;

procedure TFMRemesasAbono.OnKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     TButtConfirmarClick(TButtConfirmar);
end;

end.
