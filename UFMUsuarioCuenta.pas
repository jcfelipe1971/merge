unit UFMUsuarioCuenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, StdCtrls, UFormGest, Mask, rxToolEdit,
  ULFEdit, ULFToolBar, ULFPanel, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, DBCtrls, ULFDBEdit, RXDBCtrl, UNavigator, URecursos,
  Menus, UTeclas, UControlEdit, ULFDBDateEdit;

type
  TFMUsuarioCuenta = class(TG2kForm)
     PNMain: TLFPanel;
     TBMain: TLFToolBar;
     PNUsuario: TLFPanel;
     LBLNombre: TLFLabel;
     LBLFechaCambioPassw: TLFLabel;
     LBLClave: TLFLabel;
     DBEClave: TLFDbedit;
     LBLNombreCorreo: TLFLabel;
     DBENombreCorreo: TLFDbedit;
     DBEDirCorreo: TLFDbedit;
     LBLDirCorreo: TLFLabel;
     LBLDiasCaducidad: TLFLabel;
     DBEDiasCaducidad: TLFDbedit;
     DBENombre: TLFDbedit;
     DBDTPFechaCambioPassw: TLFDBDateEdit;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     EDTClaveCofirm: TLFEdit;
     LBLClaveConfirm: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormKeyPress(Sender: TObject; var Key: char);
     procedure DBEClaveChange(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
     CambioClave: boolean;
     ModoFormulario: smallint;
  public
     { Public declarations }
     procedure MuestraUsuario(Usuario, ModoForm: integer);
  end;

var
  FMUsuarioCuenta : TFMUsuarioCuenta;

implementation

uses UDMMain, UDMUsuarioCuenta, UEntorno;

{$R *.DFM}

procedure TFMUsuarioCuenta.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMUsuarioCuenta, DMUsuarioCuenta);
  NavMain.DataSource := DMUsuarioCuenta.DSQMUsuario;
  CEMainPMEdit.Teclas := DMMain.teclas;
  ControlEdit := CEMain;

  // Inicializamos cambio clave
  CambioClave := False;
end;

procedure TFMUsuarioCuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  // Si estamos obligando a modificar la clave y
  // ésta se encuentra caducada, cerramos la aplicación.
  if (ModoFormulario = 1) and (DMUSuarioCuenta.ClaveCaducada) then
     Application.Terminate;

  CierraData(DMUsuarioCuenta);
  FMUsuarioCuenta := nil;
  Action := caFree;
end;

procedure TFMUsuarioCuenta.MuestraUsuario(Usuario, ModoForm: integer);
begin
  DMUsuarioCuenta.FiltraUsuario(Usuario);
  // Modo formulario: 0 => Permite cancelar aunque la clave esté caducada
  //                  1 => No permite cancelar si la clave está caducada
  ModoFormulario := ModoForm;
  ShowModal;
end;

procedure TFMUsuarioCuenta.FormShow(Sender: TObject);
begin
  LBLClaveConfirm.Enabled := False;
  EDTClaveCofirm.Enabled := False;
  DBEClave.SetFocus;
end;

procedure TFMUsuarioCuenta.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  Close;
end;

procedure TFMUsuarioCuenta.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
     NavMain.BtnClick(nbPost);
  if key = #27 then
     NavMain.BtnClick(nbCancel);
end;

procedure TFMUsuarioCuenta.DBEClaveChange(Sender: TObject);
begin
  // Activamos semáforo si estamos modificando la clave
  CambioClave := True;
  LBLClaveConfirm.Enabled := True;
  EDTClaveCofirm.Enabled := True;
end;

procedure TFMUsuarioCuenta.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button = nbPost) then
  begin
     // Comprobamos si la cuenta ha caducado
     if (DMUsuarioCuenta.ClaveCaducada) and (DBEClave.Text = DMUsuarioCuenta.ClaveOld) then
        raise Exception.Create(_('Su cuenta de usuario ha caducado, debe cambiar su clave'));

     if (CambioClave) and (DBEClave.Text <> EDTClaveCofirm.Text) then
        raise Exception.Create(_('Debe confirmar la clave correctamente'));

     // Sin error.
     DMUsuarioCuenta.ClaveCaducada := False;
  end;
end;

end.
