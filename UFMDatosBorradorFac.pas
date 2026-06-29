unit UFMDatosBorradorFac;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, UNavigator, UEditPanel,
  ActnList, Menus, UTeclas, UControlEdit, DB, ULFActionList, ULFToolBar,
  ULFDBEdit, ULFDBEditFind2000, ULFPanel, ULFLabel;

type
  TFMDatosBorradorFac = class(TG2KForm)
     PNLMain: TLFPanel;
     TBMain: TLFToolBar;
     LBLMaestro: TLFLabel;
     LBLTercero: TLFLabel;
     LBLCuenta: TLFLabel;
     LBLCuentaContrapartida: TLFLabel;
     LBLTipoIva: TLFLabel;
     LBLFormaPago: TLFLabel;
     LBLBaseImponible: TLFLabel;
     LBLDocNumero: TLFLabel;
     LBLDocSerie: TLFLabel;
     DBEFMaestro: TLFDBEditFind2000;
     DBETitMaestro: TLFDbedit;
     DBEFTercero: TLFDBEditFind2000;
     DBETitTercero: TLFDbedit;
     DBEFCuenta: TLFDBEditFind2000;
     DBETitCuenta: TLFDbedit;
     DBEFCuenta_Con: TLFDBEditFind2000;
     DBETitCuenta_Con: TLFDbedit;
     DBEBaseImponible: TLFDbedit;
     DBETitFormaPago: TLFDbedit;
     DBEFForma_Pago: TLFDBEditFind2000;
     DBEDoc_Numero: TLFDbedit;
     DBEFSerie: TLFDBEditFind2000;
     DBETitSerie: TLFDbedit;
     LBLTipoFactura: TLFLabel;
     NavMain: THYMNavigator;
     TBSeparador: TToolButton;
     EPMain: THYMEditPanel;
     TBSeparador2: TToolButton;
     TBConfirma: TToolButton;
     ALMain: TLFActionList;
     AConfirmaDatos: TAction;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     LModoIVA: TLFLabel;
     DBETitModoIva: TLFDbedit;
     DBEFTipoIva: TLFDBEditFind2000;
     DBEFModoIva: TLFDBEditFind2000;
     LDireccion: TLFLabel;
     DBEDireccion: TLFDbedit;
     LCodigoPostal: TLFLabel;
     DBECodPostal: TLFDbedit;
     LProvincia: TLFLabel;
     DBEProvincia: TLFDbedit;
     LBLNIF: TLFLabel;
     DBENif: TLFDbedit;
     DBETitTipoIva: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure DBEFMaestroBusqueda(Sender: TObject);
     procedure DBEFCuentaBusqueda(Sender: TObject);
     procedure DBEFCuenta_ConBusqueda(Sender: TObject);
     procedure DBEFForma_PagoBusqueda(Sender: TObject);
     procedure DBEFSerieBusqueda(Sender: TObject);
     procedure AConfirmaDatosExecute(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBEFMaestroChange(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
     ModoGen: boolean;
     TeclaGrabar: integer;
     procedure Habilitar(Modo: boolean);
  public
     { Public declarations }
     Grabar: boolean;
     procedure MostrarParametrizado(pEstado: smallint);
     procedure HabilitaNIF(Modo: boolean);
  end;

var
  FMDatosBorradorFac : TFMDatosBorradorFac;

implementation

uses UDMMain, UDMBorradorContabilidad, UEntorno, UUtiles, UFMain, UDameDato;

{$R *.dfm}

procedure TFMDatosBorradorFac.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  // Componentes punto
  FMain.AddComponentePunto(DBEFCuenta);
  FMain.AddComponentePunto(DBEFCuenta_Con);

  TeclaGrabar := DMMain.Teclas.TecNPost;
  slvar := False;
  Grabar := False;
  DMMain.Teclas.TecNPost := 0;
  AConfirmaDatos.ShortCut := TeclaGrabar;
  DMMain.Teclas.ActualizarTeclasPopUp(CEMainPmEdit);

  NavMain.DataSource := DMBorradorContabilidad.DSQMAsientos;
  ControlEdit := CEMain;

  if (DMBorradorContabilidad.TipoAsiento = 'AFC') then
  begin
     LBLTipoFactura.Caption := _('FACTURA DE CLIENTE');
     LBLMaestro.Caption := _('Cliente');
     DBEFMaestro.Tabla_a_buscar := 'VER_CLIENTES_EF';
     DBEFMaestro.CampoNum := 'CLIENTE';
     DBETitMaestro.DataSource := DMBorradorContabilidad.DSxClientes;
  end;

  if (DMBorradorContabilidad.TipoAsiento = 'AFP') then
  begin
     LBLTipoFactura.Caption := _('FACTURA DE PROVEEDOR');
     LBLMaestro.Caption := _('Proveedor');
     DBEFMaestro.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
     DBEFMaestro.CampoNum := 'PROVEEDOR';
     DBETitMaestro.DataSource := DMBorradorContabilidad.DSxProveedor;
  end;

  if (DMBorradorContabilidad.TipoAsiento = 'AFA') then
  begin
     LBLTipoFactura.Caption := _('FACTURA DE ACREEDOR');
     LBLMaestro.Caption := _('Acreeedor');
     DBEFMaestro.Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
     DBEFMaestro.CampoNum := 'ACREEDOR';
     DBETitMaestro.DataSource := DMBorradorContabilidad.DSxAcreedor;
  end;
  DBEFMaestro.CampoStr := 'TITULO';
  DBETitMaestro.DataField := 'TITULO';

  DMBorradorContabilidad.AbreAuxiliaresNIF;

  if ((DMBorradorContabilidad.QMAsientos.State = dsInsert) or
     (DMBorradorContabilidad.tipoold <> DMBorradorContabilidad.QMAsientosTIPO.AsString)) then
     DMBorradorContabilidad.RellenaFacturaBorrador;

  // Maximos digitos para las cuentas

  DBEFCuenta.MaxLength := REntorno.DigitosSub;
  DBEFCuenta_Con.MaxLength := REntorno.DigitosSub;
end;

procedure TFMDatosBorradorFac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (PNLMain.Enabled) then
     PNLMain.SetFocus;

  if (DMBorradorContabilidad.QMAsientos.State = dsInsert) and
     (DMBorradorContabilidad.QMAsientosBASE_IMPONIBLE.AsFloat = 0) then
     DMBorradorContabilidad.QMAsientosBASE_IMPONIBLE.AsFloat :=
        StrToFloat(DBEBaseImponible.Text);

  DMMain.Teclas.TecNPost := TeclaGrabar;
  FMain.DelComponentePunto(DBEFCuenta);
  FMain.DelComponentePunto(DBEFCuenta_Con);
end;

procedure TFMDatosBorradorFac.MostrarParametrizado(pEstado: smallint);
var
  i : integer;
begin
  if (pEstado = 0) then // Preparar ventana para vista modal en edicion
  begin
     NavMain.Parent := nil;
     ControlEdit.ActivaEdicion;
     for i := 0 to PNLMain.ControlCount - 1 do
        DMMain.AddComponenteEsc(PNLMain.Controls[i]);
     TBSeparador.Visible := False;

     // Habilitar o no controles
     ModoGen := True;
     Habilitar(1 = 1);
  end
  else
  begin
     TBSeparador.Visible := True;
     ModoGen := False;
     Habilitar(1 = 0);
  end;

  // Caso especial edicion con cambio de asiento
  if ((pEstado = 1) and (DMBorradorContabilidad.tipoold <>
     DMBorradorContabilidad.QMAsientosTIPO.AsString) and
     (DMBorradorContabilidad.QMAsientos.State = dsEdit)) then
     habilitar(True);

  ShowModal;
end;

procedure TFMDatosBorradorFac.DBEFMaestroBusqueda(Sender: TObject);
begin
  DBEFMaestro.CondicionBusqueda := 'canal =' + DMBorradorContabilidad.QMAsientosCanal.AsString;
end;

procedure TFMDatosBorradorFac.DBEFCuentaBusqueda(Sender: TObject);
var
  Canal, Pgc : integer;
begin
  with DMBorradorContabilidad do
  begin
     Canal := QMAsientosCanal.AsInteger;
     Pgc := DamePgc(QMAsientosEMPRESA.AsInteger, QMAsientosEJERCICIO.AsInteger, Canal);
     DBEFCuenta.CondicionBusqueda := 'canal =' +
        IntToStr(Canal) + ' AND PGC=' + IntToStr(Pgc) + ' AND TIPO = 5';
  end;
end;

procedure TFMDatosBorradorFac.DBEFCuenta_ConBusqueda(Sender: TObject);
var
  Canal, Pgc : integer;
begin
  with DMBorradorContabilidad do
  begin
     Canal := QMAsientosCanal.AsInteger;
     Pgc := DamePgc(QMAsientosEMPRESA.AsInteger, QMAsientosEJERCICIO.AsInteger, Canal);
     DBEFCuenta_Con.CondicionBusqueda := 'canal =' +
        IntToStr(Canal) + ' AND PGC=' + IntToStr(Pgc) + ' AND TIPO = 5';
  end;
end;

procedure TFMDatosBorradorFac.DBEFForma_PagoBusqueda(Sender: TObject);
begin
  DBEFForma_Pago.CondicionBusqueda := 'canal =' + DMBorradorContabilidad.QMAsientosCanal.AsString;
end;

procedure TFMDatosBorradorFac.DBEFSerieBusqueda(Sender: TObject);
begin
  DBEFSerie.CondicionBusqueda := 'canal =' + DMBorradorContabilidad.QMAsientosCanal.AsString;
end;

procedure TFMDatosBorradorFac.AConfirmaDatosExecute(Sender: TObject);
var
  Acepta : boolean;
begin
  Acepta := True;
  if ((DBETitTercero.Text <= '') or
     (DBENif.Text <= '') or
     (DBEDireccion.Text <= '') or
     (DBECodPostal.Text <= '') or
     (DBEProvincia.Text <= '')) then
     Acepta := ConfirmaMensaje(_('Alguno de los campos esta vacio') + #13#10 + _('¿Grabar cambios?'));

  if Acepta then
  begin
     Grabar := True;
     if FMDatosBorradorFac.CloseQuery then
        Close;
  end;
end;

procedure TFMDatosBorradorFac.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i : integer;
begin
  for i := 0 to PNLMain.ControlCount - 1 do
     DMMain.DelComponenteEsc(PNLMain.Controls[i]);

  CanClose := True;
end;

procedure TFMDatosBorradorFac.Habilitar(Modo: boolean);
var
  ColorFondo, ColorLetra : TColor;
begin
  if (Modo) then
  begin
     ColorFondo := clWindow;
     ColorLetra := clWindowText;
     PNLMain.Enabled := True;
  end
  else
  begin
     ColorFondo := clInfoBk;
     ColorLetra := clGrayText;
  end;

  DBEFMaestro.Enabled := Modo;
  DBEFMaestro.ReadOnly := not (Modo);
  DBEFMaestro.Color := ColorFondo;
  DBEFMaestro.Font.Color := ColorLetra;

  DBEFTercero.Enabled := Modo;
  DBEFTercero.ReadOnly := not (Modo);
  DBEFTercero.Color := ColorFondo;
  DBEFTercero.Font.Color := ColorLetra;

  DBEFCuenta.Enabled := Modo;
  DBEFCuenta.ReadOnly := not (Modo);
  DBEFCuenta.Color := ColorFondo;
  DBEFCuenta.Font.Color := ColorLetra;

  DBEFCuenta_Con.Enabled := Modo;
  DBEFCuenta_Con.ReadOnly := not (Modo);
  DBEFCuenta_Con.Color := ColorFondo;
  DBEFCuenta_Con.Font.Color := ColorLetra;

  DBEFTipoIVA.Enabled := Modo;
  DBEFTipoIVA.ReadOnly := not (Modo);
  DBEFTipoIVA.Color := ColorFondo;
  DBEFTipoIVA.Font.Color := ColorLetra;

  DBEFModoIVA.Enabled := Modo;
  DBEFModoIVA.ReadOnly := not (Modo);
  DBEFModoIVA.Color := ColorFondo;
  DBEFModoIVA.Font.Color := ColorLetra;

  DBEBaseImponible.Enabled := Modo;
  DBEBaseImponible.ReadOnly := not (Modo);
  DBEBaseImponible.Color := ColorFondo;
  DBEBaseImponible.Font.Color := ColorLetra;

  DBEDoc_Numero.Enabled := Modo;
  DBEDoc_Numero.ReadOnly := not (Modo);
  DBEDoc_Numero.Color := ColorFondo;
  DBEDoc_Numero.Font.Color := ColorLetra;

  DBEFSerie.Enabled := Modo;
  DBEFSerie.ReadOnly := not (Modo);
  DBEFSerie.Color := ColorFondo;
  DBEFSerie.Font.Color := ColorLetra;

  // Variacion por si se esta modificando el asiento o si se esta en modo lectura
  if ((DMBorradorContabilidad.QMAsientos.State = dsInsert) or
     (DMBorradorContabilidad.QMAsientos.State = dsEdit)) then
  begin
     HabilitaNIF(DMBorradorContabilidad.QMAsientosMAESTRO.AsInteger = -1);
     DBEFForma_Pago.Enabled := True;
     DBEFForma_Pago.ReadOnly := False;
     DBEFForma_Pago.Color := clWindow;
     DBEFForma_Pago.Font.Color := clWindowText;
  end
  else
  begin
     HabilitaNIF(False);
     DBEFForma_Pago.Enabled := False;
     DBEFForma_Pago.ReadOnly := True;
     DBEFForma_Pago.Color := clInfoBk;
     DBEFForma_Pago.Font.Color := clGrayText;
  end;
end;

procedure TFMDatosBorradorFac.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbEdit) then
  begin
     HabilitaNIF(DMBorradorContabilidad.QMAsientosMAESTRO.AsInteger = -1);
     DBEFForma_Pago.Enabled := True;
     DBEFForma_Pago.ReadOnly := False;
     DBEFForma_Pago.Color := clWindow;
     DBEFForma_Pago.Font.Color := clWindowText;
  end
  else
  begin
     HabilitaNIF(False);
     DBEFForma_Pago.Enabled := False;
     DBEFForma_Pago.ReadOnly := True;
     DBEFForma_Pago.Color := clInfoBk;
     DBEFForma_Pago.Font.Color := clGrayText;
  end;
end;

procedure TFMDatosBorradorFac.HabilitaNIF(Modo: boolean);
begin
  DBENif.Enabled := Modo;
  DBENif.ReadOnly := not Modo;

  DBETitTercero.Enabled := Modo;
  DBETitTercero.ReadOnly := not Modo;

  DBEDireccion.Enabled := Modo;
  DBEDireccion.ReadOnly := not Modo;

  DBECodPostal.Enabled := Modo;
  DBECodPostal.ReadOnly := not Modo;

  DBEProvincia.Enabled := Modo;
  DBEProvincia.ReadOnly := not Modo;

  if Modo then
  begin
     DBENif.Color := clWindow;
     DBENif.Font.Color := clWindowText;

     DBETitTercero.Color := clWindow;
     DBETitTercero.Font.Color := clWindowText;

     DBEDireccion.Color := clWindow;
     DBEDireccion.Font.Color := clWindowText;

     DBECodPostal.Color := clWindow;
     DBECodPostal.Font.Color := clWindowText;

     DBEProvincia.Color := clWindow;
     DBEProvincia.Font.Color := clWindowText;
  end
  else
  begin
     DBENif.Color := clInfoBk;
     DBENif.Font.Color := clGrayText;

     DBETitTercero.Color := clInfoBk;
     DBETitTercero.Font.Color := clGrayText;

     DBEDireccion.Color := clInfoBk;
     DBEDireccion.Font.Color := clGrayText;

     DBECodPostal.Color := clInfoBk;
     DBECodPostal.Font.Color := clGrayText;

     DBEProvincia.Color := clInfoBk;
     DBEProvincia.Font.Color := clGrayText;
  end;
end;

procedure TFMDatosBorradorFac.DBEFMaestroChange(Sender: TObject);
begin
  HabilitaNIF(DBEFMaestro.Text = '-1');
end;

procedure TFMDatosBorradorFac.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMDatosBorradorFac.TeclaExpandirCta(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaCta(Sender);
end;

end.
