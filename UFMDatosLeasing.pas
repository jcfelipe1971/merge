unit UFMDatosLeasing;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UNavigator, ToolWin, ComCtrls, Menus,
  UTeclas, UControlEdit, ULFToolBar, ULFDBCheckBox, ULFDBEdit,
  ULFDBEditFind2000, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel,
  ULFEdit;

type
  TFMDatosLeasing = class(TG2KForm)
     PNLMain: TLFPanel;
     DBEFIvaDif: TLFDBEditFind2000;
     DBEFGastos: TLFDBEditFind2000;
     DBEFAbonoGastos: TLFDBEditFind2000;
     DBEGastos: TLFDbedit;
     ETitIvaDif: TLFEdit;
     ETitGastos: TLFEdit;
     ETitAbonoGastos: TLFEdit;
     LCuentaIVADiferido: TLFLabel;
     LCuentaGastosInt: TLFLabel;
     LCuentaAbonoGastos: TLFLabel;
     LGastos: TLFLabel;
     TBMain: TLFToolBar;
     LIntroduzcaDatos: TLFLabel;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TButtSalir: TToolButton;
     DBCBIvaDiferido: TLFDBCheckBox;
     TButtSep: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtSalirClick(Sender: TObject);
     procedure DBEFIvaDifExit(Sender: TObject);
     procedure DBEFIvaDifKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFGastosExit(Sender: TObject);
     procedure DBEFGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFAbonoGastosExit(Sender: TObject);
     procedure DBEFAbonoGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBCBIvaDiferidoClick(Sender: TObject);
     procedure DBEFIvaDifChange(Sender: TObject);
     procedure DBEFGastosChange(Sender: TObject);
     procedure DBEFAbonoGastosChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraQuery(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Moneda: string);
  end;

var
  FMDatosLeasing : TFMDatosLeasing;

implementation

{$R *.dfm}

uses UDMMain, UDMDatosLeasing, UUtiles, UEntorno, UDameDato;

procedure TFMDatosLeasing.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMDatosLeasing, DMDatosLeasing);
  ControlEdit := CEMain;
  DBEFIvaDif.MaxLength := REntorno.DigitosSub;
  DBEFGastos.MaxLength := REntorno.DigitosSub;
  DBEFAbonoGastos.MaxLength := REntorno.DigitosSub;
end;

procedure TFMDatosLeasing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDatosLeasing);
  Action := caFree;
end;

procedure TFMDatosLeasing.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMDatosLeasing.FiltraQuery(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Moneda: string);
begin
  DMDatosLeasing.FiltraQuery(Empresa, Ejercicio, Canal, Serie, Tipo, Rig, Moneda);
end;

procedure TFMDatosLeasing.DBEFIvaDifExit(Sender: TObject);
begin
  DBEFIvaDif.Text := ExpandirCadena(DBEFIvaDif.Text, REntorno.DigitosSub);
end;

procedure TFMDatosLeasing.DBEFIvaDifKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DBEFIvaDif.Text := ExpandirCadena(DBEFIvaDif.Text, REntorno.DigitosSub);
end;

procedure TFMDatosLeasing.DBEFGastosExit(Sender: TObject);
begin
  DBEFGastos.Text := ExpandirCadena(DBEFGastos.Text, REntorno.DigitosSub);
end;

procedure TFMDatosLeasing.DBEFGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DBEFGastos.Text := ExpandirCadena(DBEFGastos.Text, REntorno.DigitosSub);
end;

procedure TFMDatosLeasing.DBEFAbonoGastosExit(Sender: TObject);
begin
  DBEFAbonoGastos.Text := ExpandirCadena(DBEFAbonoGastos.Text, REntorno.DigitosSub);
end;

procedure TFMDatosLeasing.DBEFAbonoGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DBEFAbonoGastos.Text := ExpandirCadena(DBEFAbonoGastos.Text, REntorno.DigitosSub);
end;

procedure TFMDatosLeasing.DBCBIvaDiferidoClick(Sender: TObject);
begin
  if (Sender as TLFDBCheckBox).Checked then
  begin
     DBEFIvaDif.Color := clInfobk;
     DBEFIvaDif.Font.Color := clGrayText;
  end
  else
  begin
     DBEFIvaDif.Color := clWindow;
     DBEFIvaDif.Font.Color := clWindowText;
  end;

  DBEFIvaDif.Enabled := not ((Sender as TLFDBCheckBox).Checked);
  DBEFIvaDif.ReadOnly := not (DBEFIvaDif.Enabled);
end;

procedure TFMDatosLeasing.DBEFIvaDifChange(Sender: TObject);
begin
  ETitIvaDif.Text := DameTituloCuenta(DBEFIvaDif.Text);
end;

procedure TFMDatosLeasing.DBEFGastosChange(Sender: TObject);
begin
  ETitGastos.Text := DameTituloCuenta(DBEFGastos.Text);
end;

procedure TFMDatosLeasing.DBEFAbonoGastosChange(Sender: TObject);
begin
  ETitAbonoGastos.Text := DameTituloCuenta(DBEFAbonoGastos.Text);
end;

end.
