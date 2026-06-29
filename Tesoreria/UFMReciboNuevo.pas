unit UFMReciboNuevo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UFormGest,
  Buttons, StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ComCtrls, ExtCtrls, ToolWin,
  rxToolEdit, ULFComboBox, ULFToolBar, ULFEdit, ULFDBEdit, ULFPanel,
  ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage, ULFDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, UFPEditSinNavegador, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel;

type
  TFMReciboNuevo = class(TFPEditSinNavegador)
     DTPFechaRegistro: TLFDateEdit;
     EFFormaPago: TLFEditFind2000;
     EFormaPago: TLFEdit;
     LFechaRegistro: TLFLabel;
     LFormaPago: TLFLabel;
     LCuentaPago: TLFLabel;
     EFCuentaPago: TLFEditFind2000;
     ECuentaPago: TLFEdit;
     LCantidad: TLFLabel;
     ECantidad: TLFEdit;
     LCodCliPro: TLFLabel;
     EFCodCliPro: TLFEditFind2000;
     ECodCliPro: TLFEdit;
     LTipoCartera: TLFLabel;
     CBSigno: TLFComboBox;
     TButtSep1: TToolButton;
     TButtRecibo: TToolButton;
     EDescripcion: TLFEdit;
     LDescripcion: TLFLabel;
     TButtPermuta: TSpeedButton;
     LMoneda: TLFLabel;
     EFMoneda: TLFEditFind2000;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     CBContabilizar: TLFCheckBox;
     EFCtaContrapartida: TLFEditFind2000;
     LCuentaContrapartida: TLFLabel;
     ECuentaContrapartida: TLFEdit;
     PNLTipoCartera: TLFPanel;
     procedure TButtPermutaClick(Sender: TObject);
     procedure CBSignoChange(Sender: TObject);
     procedure EFCodCliProChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFFormaPagoChange(Sender: TObject);
     procedure EFCuentaPagoChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtReciboClick(Sender: TObject);
     procedure EFCuentaPagoExit(Sender: TObject);
     procedure ECantidadKeyPress(Sender: TObject; var Key: char);
     procedure EFCuentaPagoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFSerieChange(Sender: TObject);
     procedure CBContabilizarClick(Sender: TObject);
     procedure EFCtaContrapartidaChange(Sender: TObject);
     procedure EFCtaContrapartidaExit(Sender: TObject);
     procedure EFCtaContrapartidaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
     procedure DeshabilitaCampos;
  public
     { Public declarations }
     IdCartera: integer;
  end;

var
  FMReciboNuevo : TFMReciboNuevo;

function CreaRecibo(Serie, Tipo: string; CodCliPro: integer; Importe: double; Descripcion: string; Limitado: boolean = False): integer;

implementation

uses UDMReciboNuevo, UEntorno, UDMMain, UUtiles, UFMain, UParam, UDameDato;

{$R *.DFM}

function CreaRecibo(Serie, Tipo: string; CodCliPro: integer; Importe: double; Descripcion: string; Limitado: boolean = False): integer;
begin
  Result := 0;

  AbreForm(TFMReciboNuevo, FMReciboNuevo, nil);

  with FMReciboNuevo do
  begin
     if (Tipo = 'CLI') then
        CBSigno.ItemIndex := 0
     else
     if (Tipo = 'ANC') then
        CBSigno.ItemIndex := 2
     else
     if (Tipo = 'PRO') then
        CBSigno.ItemIndex := 1
     else
     if (Tipo = 'ACR') then
        CBSigno.ItemIndex := 1
     else
        CBSigno.ItemIndex := 3;

     CBSignoChange(CBSigno);

     // Al modificar el signo el tipo es cliente o proveedor
     if (Tipo = 'ACR') then
        TButtPermuta.Click;

     EFSerie.Text := Serie;
     if (CodCliPro <> 0) then
        EFCodCliPro.Text := IntToStr(CodCliPro);
     ECantidad.Text := FloatToStr(Importe);
     EDescripcion.Text := Descripcion;
     CBContabilizar.Checked := False;
     EFCtaContrapartida.Text := EFCuentaPago.Text;

     if Limitado then
        DeshabilitaCampos;

     if (CodCliPro = 0) then
        EFCodCliPro.SetFocus
     else
     begin
        ECantidad.SetFocus;
        ECantidad.SelectAll;
     end;

     Hide;
     if (ShowModal = mrOk) then
        Result := IdCartera;

     // CierraForm(FMReciboNuevo);
  end;
end;

procedure TFMReciboNuevo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMReciboNuevo, DMReciboNuevo);
  HabilitarPunto; // Habilitar el Punto en la Cuenta
  CBSigno.ItemIndex := 0;
  CBSignoChange(Sender);
  DTPFechaRegistro.Date := REntorno.FechaTrabSH;
  ECantidad.Text := '0';
  EFCuentaPago.MaxLength := REntorno.DigitosSub;

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(TButtPermuta, 1, DMMain.ILMain_Ac, 54);
end;

procedure TFMReciboNuevo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DeshabilitarPunto;
  CierraData(DMReciboNuevo);
end;

procedure TFMReciboNuevo.TButtPermutaClick(Sender: TObject);
begin
  if LCodCliPro.Caption = _('Proveedor') then
  begin
     LCodCliPro.Caption := _('Acreedor');
     EFCodCliPro.Text := '';
     EFCodCliPro.Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
     EFCodCliPro.CampoNum := 'ACREEDOR';
     EFCodCliPro.OrdenadoPor.Clear;
     EFCodCliPro.OrdenadoPor.Add('ACREEDOR');
  end
  else
  begin
     LCodCliPro.Caption := _('Proveedor');
     EFCodCliPro.Text := '';
     EFCodCliPro.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
     EFCodCliPro.CampoNum := 'PROVEEDOR';
     EFCodCliPro.OrdenadoPor.Clear;
     EFCodCliPro.OrdenadoPor.Add('PROVEEDOR');
  end;
end;

procedure TFMReciboNuevo.CBSignoChange(Sender: TObject);
begin
  case CBSigno.ItemIndex of
     0, 2:
     begin
        TButtPermuta.Visible := False;
        LCodCliPro.Caption := _('Cliente');
        LCuentaPago.Caption := _('Cta. de Cobro');
        LCuentaContrapartida.Caption := _('Cta. de Pago');
        EFCodCliPro.Text := '';
        EFCodCliPro.Tabla_a_buscar := 'VER_CLIENTES_EF';
        EFCodCliPro.CampoNum := 'CLIENTE';
        EFCodCliPro.OrdenadoPor.Clear;
        EFCodCliPro.OrdenadoPor.Add('CLIENTE');
     end;
     1, 3:
     begin
        TButtPermuta.Visible := True;
        LCodCliPro.Caption := _('Proveedor');
        LCuentaPago.Caption := _('Cta. de Pago');
        LCuentaContrapartida.Caption := _('Cta. de Cobro');
        EFCodCliPro.Text := '';
        EFCodCliPro.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
        EFCodCliPro.CampoNum := 'PROVEEDOR';
        EFCodCliPro.OrdenadoPor.Clear;
        EFCodCliPro.OrdenadoPor.Add('PROVEEDOR');
     end;
  end;
end;

procedure TFMReciboNuevo.EFCodCliProChange(Sender: TObject);
var
  TipoDoc, Titulo : string;
begin
  if CBSigno.ItemIndex = 0 then
     TipoDoc := 'FAC'
  else
  if CBSigno.ItemIndex = 2 then
     TipoDoc := 'ANC'
  else
  if CBSigno.ItemIndex = 1 then
  begin
     if LCodCliPro.Caption = _('Proveedor') then
        TipoDoc := 'FAP'
     else
        TipoDoc := 'FCR';
  end
  else
  if CBSigno.ItemIndex = 3 then
  begin
     if LCodCliPro.Caption = _('Proveedor') then
        TipoDoc := 'ANP'
     else
        TipoDoc := 'ANA';
  end;

  DMReciboNuevo.CambiaCod_Cli(TipoDoc, StrToIntDef(EFCodCliPro.Text, 0), Titulo);
  ECodCliPro.Text := Titulo;
  EFFormaPago.Text := DMReciboNuevo.DameFormaPago(TipoDoc);
  EFMoneda.Text := DMReciboNuevo.DameMoneda(TipoDoc);
  EFCuentaPago.Text := DMReciboNuevo.DameCtaFormaPago(EFSerie.Text, EFFormaPago.Text);
end;

procedure TFMReciboNuevo.EFFormaPagoChange(Sender: TObject);
begin
  EFormaPago.Text := DameTituloFormaPago(EFFormaPago.Text);

  if ((EFCuentaPago.Text = '') or (not EFCuentaPago.Visible)) then
     EFCuentaPago.Text := DMReciboNuevo.DameCtaFormaPago(EFSerie.Text, EFFormaPago.Text);
end;

procedure TFMReciboNuevo.EFCuentaPagoChange(Sender: TObject);
begin
  ECuentaPago.Text := DameTituloCuenta(EFCuentaPago.Text);
end;

procedure TFMReciboNuevo.TButtReciboClick(Sender: TObject);
var
  TipoDoc : string;
begin
  if CBSigno.ItemIndex = 0 then
     TipoDoc := 'NRC'
  else
  if CBSigno.ItemIndex = 2 then
     TipoDoc := 'ANC'
  else
  begin
     if CBSigno.ItemIndex = 1 then
     begin
        if LCodCliPro.Caption = _('Proveedor') then
           TipoDoc := 'NRP'
        else
           TipoDoc := 'NRA';
     end
     else
     if CBSigno.ItemIndex = 3 then
     begin
        if LCodCliPro.Caption = _('Proveedor') then
           TipoDoc := 'ANP'
        else
           TipoDoc := 'ANA';
     end;
  end;

  if ((EFCodCliPro.Text <> '') and (EFFormaPago.Text <> '') and (EFCuentaPago.Text <> '') and
     (ECantidad.Text <> '') and (ECantidad.Text <> '0')) and
     ((not CBContabilizar.Checked) or ((CBContabilizar.Checked) and (EFCtaContrapartida.Text <> ''))) then
  begin
     IdCartera := DMReciboNuevo.CreaRecibo(StrToIntDef(EFCodCliPro.Text, 0), TipoDoc,
        EFFormaPago.Text, EFMoneda.Text, DTPFechaRegistro.Date, EDescripcion.Text,
        EFCuentaPago.Text,
        StrToFloat(ECantidad.Text), EFSerie.Text, EFCtaContrapartida.Text, CBContabilizar.Checked);
     ModalResult := mrOk;
  end
  else
     ShowMessage(_('Datos incompletos'));
end;

procedure TFMReciboNuevo.EFCuentaPagoExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCuentaPago);
end;

procedure TFMReciboNuevo.ECantidadKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, '-', {ThousandSeparator,} DecimalSeparator]) then
     Key := #0;
end;

procedure TFMReciboNuevo.HabilitarPunto;
begin
  FMain.AddComponentePunto(EFCuentaPago);
  FMain.AddComponentePunto(EFCtaContrapartida);
end;

procedure TFMReciboNuevo.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(EFCuentaPago);
  FMain.DelComponentePunto(EFCtaContrapartida);
end;

procedure TFMReciboNuevo.EFCuentaPagoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCuentaPago);
end;

procedure TFMReciboNuevo.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMReciboNuevo.CBContabilizarClick(Sender: TObject);
begin
  inherited;
  LCuentaContrapartida.Enabled := CBContabilizar.Checked;
  EFCtaContrapartida.Enabled := CBContabilizar.Checked;
  ECuentaContrapartida.Enabled := CBContabilizar.Checked;
end;

procedure TFMReciboNuevo.EFCtaContrapartidaChange(Sender: TObject);
begin
  ECuentaContrapartida.Text := DameTituloCuenta(EFCtaContrapartida.Text);
end;

procedure TFMReciboNuevo.EFCtaContrapartidaExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCtaContrapartida);
end;

procedure TFMReciboNuevo.EFCtaContrapartidaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCtaContrapartida);
end;

procedure TFMReciboNuevo.DeshabilitaCampos;
begin
  PNLTipoCartera.Visible := False;

  LCodCliPro.Visible := False;
  EFCodCliPro.Visible := False;
  ECodCliPro.Visible := False;

  LFechaRegistro.Visible := False;
  DTPFechaRegistro.Visible := False;

  LCuentaPago.Visible := False;
  EFCuentaPago.Visible := False;
  ECuentaPago.Visible := False;

  LDescripcion.Visible := False;
  EDescripcion.Visible := False;

  LMoneda.Visible := False;
  EFMoneda.Visible := False;

  LSerie.Visible := False;
  EFSerie.Visible := False;
  ESerie.Visible := False;

  CBContabilizar.Visible := False;
  LCuentaContrapartida.Visible := False;
  EFCtaContrapartida.Visible := False;
  ECuentaContrapartida.Visible := False;

  TButtPermuta.Visible := False;

  LFormaPago.Top := LCodCliPro.Top;
  EFFormaPago.Top := EFCodCliPro.Top;
  EFormaPago.Top := EFFormaPago.Top;

  LCantidad.Top := LFechaRegistro.Top;
  ECantidad.Top := DTPFechaRegistro.Top;

  Self.Height := 170;
end;

end.
