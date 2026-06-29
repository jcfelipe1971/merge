unit UFMREgularizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Buttons, UControlEdit,
  UFormGest, ULFCheckBox, ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel;

type
  TFMRegularizacion = class(TG2KForm)
     EFCuenta: TLFEditFind2000;
     LCuenta: TLFLabel;
     CBAmortizacion: TLFCheckBox;
     ButtAceptar: TButton;
     ButtCancelar: TButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCuentaExit(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ButtAceptarClick(Sender: TObject);
     procedure ButtCancelarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function Muestra(var Cuenta: string; var Amortiza: boolean): integer;
     procedure Expande;
  end;

var
  FMRegularizacion : TFMRegularizacion;

implementation

uses UDMMain, UUtiles, UEntorno, UDMCierreApertura;

{$R *.DFM}

function TFMRegularizacion.Muestra(var Cuenta: string; var Amortiza: boolean): integer;
begin
  Result := ShowModal;
  Cuenta := EFCuenta.Text;
  Amortiza := CBAmortizacion.Checked;
end;

procedure TFMRegularizacion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  EFCuenta.MaxLength := REntorno.DigitosSub;
end;

procedure TFMRegularizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
end;

procedure TFMRegularizacion.EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     Expande;
end;

procedure TFMRegularizacion.Expande;
begin
  if Pos('.', EFCuenta.Text) <> 0 then
     EFCuenta.Text := ExpandirCadena(EFCuenta.Text, REntorno.DigitosSub);

  if not (DMCierreApertura.ExisteCuenta(EFCuenta.Text)) then
     EFCuenta.SetFocus;
end;

procedure TFMRegularizacion.EFCuentaExit(Sender: TObject);
begin
  Expande;
end;

procedure TFMRegularizacion.ButtAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMRegularizacion.ButtCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
