unit UFMEmpBancos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, UEditPanel, UNavigator, ToolWin, Menus, UTeclas,
  UControlEdit, StdCtrls, DBCtrls, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, UHYDBGrid, UFormGest,
  NsDBGrid, Spin, UDBSpin, ULFDBCheckBox, ULFDBEdit, ULFDBEditFind2000,
  ULFPanel, ULFPageControl, ULFToolBar, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, Buttons, ULFEdit,
  UFPEdit, UG2kTBLoc;

type
  TFMEmpBancos = class(TFPEdit)
     LBL_Banco: TLFLabel;
     LBL_Riesgo_Con: TLFLabel;
     LBL_Cuenta: TLFLabel;
     LBL_Riesgo_Uti: TLFLabel;
     DBEEntidad: TLFDBEditFind2000;
     DBEDescripcion: TLFDbedit;
     DBERiesgo_Con: TLFDbedit;
     DBEBanco: TLFDbedit;
     DBEOficina: TLFDbedit;
     DBECC: TLFDbedit;
     DBERiesgo_Uti: TLFDbedit;
     DBCBActiva: TLFDBCheckBox;
     DBEDC: TLFDbedit;
     LBL_Riesgo_dis: TLFLabel;
     DBERiesgo_dif: TLFDbedit;
     LBLCuContableCC: TLFLabel;
     DBEFCuentaCorriente: TLFDBEditFind2000;
     LBLCuContable: TLFLabel;
     DBEFCuentaAhorro: TLFDBEditFind2000;
     DBCBSepara: TLFDBCheckBox;
     DBEFCuentaConfirming: TLFDBEditFind2000;
     LBLCuentaConfirming: TLFLabel;
     DBERConfirming: TLFDbedit;
     DBERDescuento: TLFDbedit;
     LBLRiesgoDescuento: TLFLabel;
     LBLConfirmimg: TLFLabel;
     LBLCif: TLFLabel;
     DBEFTercero: TLFDBEditFind2000;
     LCuentaDesc: TLFLabel;
     DBECuentaDto: TLFDBEditFind2000;
     LblGastos: TLFLabel;
     DBEFCuentaGastos: TLFDBEditFind2000;
     LBLGastosDes: TLFLabel;
     DBEFCuentaGastosDes: TLFDBEditFind2000;
     DBSEDiaValor: TDBSpinEdit;
     LBLDiaValor: TLFLabel;
     AInfoTercero: TAction;
     AActualizaRiesgos: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LBLRiesgoDescPagares: TLFLabel;
     DBERDescuentoPagares: TLFDbedit;
     LCuentaPagare: TLFLabel;
     LCuentaRemesaPagare: TLFLabel;
     LCuentaInteresesPagare: TLFLabel;
     DBEFCuentaPagares: TLFDBEditFind2000;
     DBEFCuentaGastosPagares: TLFDBEditFind2000;
     DBEFCuentaIntereses: TLFDBEditFind2000;
     ALBancos: TLFActionList;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     LFLIBAN: TLFLabel;
     DBEIBAN: TLFDbedit;
     LFLBIC: TLFLabel;
     DBEBIC: TLFDbedit;
     LContadorTalones: TLFLabel;
     DBEContador: TLFDbedit;
     DBCBAuto: TLFDBCheckBox;
     LGastosImpagados: TLFLabel;
     DBEFCuentaGastosImpagados: TLFDBEditFind2000;
     LCedenteConfirming: TLFLabel;
     DBECedenteConfirming: TLFDbedit;
     TSCedente: TTabSheet;
     PNLCedente: TLFPanel;
     LBancoCedente: TLFLabel;
     DBEBancoCedente: TLFDbedit;
     ETituloBancoCedente: TLFDbedit;
     DBGCedenteMoneda: TDBGridFind2000;
     NavCedente: THYMNavigator;
     DBETituloCuentaCorriente: TLFEdit;
     DBETituloCuentaAhorro: TLFEdit;
     DBETituloCuentaDto: TLFEdit;
     DBETituloCuentaConfirming: TLFEdit;
     DBETituloCuentaGastos: TLFEdit;
     DBETituloCuentaGastosDes: TLFEdit;
     DBETituloCuentaPagares: TLFEdit;
     DBETituloCuentaGastosPagares: TLFEdit;
     DBETituloCuentaIntereses: TLFEdit;
     DBETituloCuentaGastosImpagado: TLFEdit;
     ETituloTercero: TLFEdit;
     LCodigoOrdenante: TLFLabel;
     DBECodigoOrdenante: TLFDbedit;
     LAlfanumero: TLFLabel;
     DBEAlfanumero: TLFDbedit;
     LFCategoryAction2: TLFCategoryAction;
     AConfigCircularizacion: TAction;
     LFCategoryAction3: TLFCategoryAction;
     LFCategoryAction4: TLFCategoryAction;
     AVisualizarCartaCircularizacion: TAction;
     AImprimirCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion: TAction;
     AEnviarEmailCartaCircularizacion2: TAction;
     DBEFPais: TLFDBEditFind2000;
     LPais: TLabel;
     ETituloPais: TEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFCuentaCorrienteExit(Sender: TObject);
     procedure DBEFCuentaCorrienteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaAhorroExit(Sender: TObject);
     procedure DBEFCuentaConfirmingExit(Sender: TObject);
     procedure DBEFCuentaConfirmingKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBECuentaDtoExit(Sender: TObject);
     procedure DBECuentaDtoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaAhorroKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaGastosExit(Sender: TObject);
     procedure DBEFCuentaGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaGastosDesExit(Sender: TObject);
     procedure DBEFCuentaGastosDesKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AInfoTerceroExecute(Sender: TObject);
     procedure AActualizaRiesgosExecute(Sender: TObject);
     procedure DBEFCuentaInteresesKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaGastosPagaresKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaPagaresKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaPagaresExit(Sender: TObject);
     procedure DBEFCuentaGastosPagaresExit(Sender: TObject);
     procedure DBEFCuentaInteresesExit(Sender: TObject);
     procedure AATerceroExecute(Sender: TObject);
     procedure DBEFCuentaGastosImpagadosExit(Sender: TObject);
     procedure DBEFCuentaGastosImpagadosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFCuentaCorrienteChange(Sender: TObject);
     procedure DBEFCuentaAhorroChange(Sender: TObject);
     procedure DBECuentaDtoChange(Sender: TObject);
     procedure DBEFCuentaConfirmingChange(Sender: TObject);
     procedure DBEFCuentaGastosChange(Sender: TObject);
     procedure DBEFCuentaGastosDesChange(Sender: TObject);
     procedure DBEFCuentaPagaresChange(Sender: TObject);
     procedure DBEFCuentaGastosPagaresChange(Sender: TObject);
     procedure DBEFCuentaInteresesChange(Sender: TObject);
     procedure DBEFCuentaGastosImpagadosChange(Sender: TObject);
     procedure DBEFTerceroChange(Sender: TObject);
     procedure DBEIBANEnter(Sender: TObject);
     procedure DBEIBANChange(Sender: TObject);
     procedure DBEEntidadChange(Sender: TObject);
     procedure AConfigCircularizacionExecute(Sender: TObject);
     procedure AVisualizarCartaCircularizacionExecute(Sender: TObject);
     procedure AImprimirCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
     procedure AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
     procedure DBEFPaisChange(Sender: TObject);
     procedure DBEEntidadBusqueda(Sender: TObject);
  private
     { Private declarations }
     procedure CompruebaCuentaBancaria;
  public
     { Public declarations }
     procedure FiltraBanco(aFiltro: string);
  end;

var
  FMEmpBancos : TFMEmpBancos;

implementation

uses UDMEmpBancos, UDMMain, UUtiles, UEntorno, UFMain,
  UDMLstCircularizacion, UFMListConfig, UDameDato;

{$R *.DFM}

procedure TFMEmpBancos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEmpBancos, DMEmpBancos);
  NavMain.DataSource := DMEmpBancos.DSQMEmp_Bancos;
  EPMain.DataSource := DMEmpBancos.DSQMEmp_Bancos;
  DBGMain.DataSource := DMEmpBancos.DSQMEmp_Bancos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  DBEFCuentaCorriente.MaxLength := REntorno.DigitosSub;
  DBEFCuentaAhorro.MaxLength := REntorno.DigitosSub;
  DBEFCuentaConfirming.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(DBEFCuentaCorriente);
  FMain.AddComponentePunto(DBEFCuentaAhorro);
  FMain.AddComponentePunto(DBECuentaDto);
  FMain.AddComponentePunto(DBEFCuentaConfirming);
  FMain.AddComponentePunto(DBEFCuentaGastos);
  FMain.AddComponentePunto(DBEFCuentaGastosDes);
  FMain.AddComponentePunto(DBEFCuentaPagares);
  FMain.AddComponentePunto(DBEFCuentaGastosPagares);
  FMain.AddComponentePunto(DBEFCuentaIntereses);
  FMain.AddComponentePunto(DBEFCuentaGastosImpagados);
  if (REntorno.Pais <> 'DOM') then
  begin
     LContadorTalones.Visible := False;
     DBEContador.Visible := False;
     DBCBAuto.Visible := False;
  end;

  SolapaControles(SBATercero, ETituloTercero);
end;

procedure TFMEmpBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(DBEFCuentaCorriente);
  FMain.DelComponentePunto(DBEFCuentaAhorro);
  FMain.DelComponentePunto(DBECuentaDto);
  FMain.DelComponentePunto(DBEFCuentaConfirming);
  FMain.DelComponentePunto(DBEFCuentaGastos);
  FMain.DelComponentePunto(DBEFCuentaGastosDes);
  FMain.DelComponentePunto(DBEFCuentaPagares);
  FMain.DelComponentePunto(DBEFCuentaGastosPagares);
  FMain.DelComponentePunto(DBEFCuentaIntereses);
  FMain.DelComponentePunto(DBEFCuentaGastosImpagados);

  CierraData(DMEmpBancos);
end;

procedure TFMEmpBancos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEmpBancos.BusquedaCompleja;
  Continua := False;
end;

procedure TFMEmpBancos.DBEFCuentaCorrienteExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaCorriente);
end;

procedure TFMEmpBancos.DBEFCuentaCorrienteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaCorriente);
end;

procedure TFMEmpBancos.DBEFCuentaAhorroExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaAhorro);
end;

procedure TFMEmpBancos.DBEFCuentaConfirmingExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaConfirming);
end;

procedure TFMEmpBancos.DBEFCuentaConfirmingKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaConfirming);
end;

procedure TFMEmpBancos.DBECuentaDtoExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBECuentaDto);
end;

procedure TFMEmpBancos.DBECuentaDtoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBECuentaDto);
end;

procedure TFMEmpBancos.DBEFCuentaAhorroKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaAhorro);
end;

procedure TFMEmpBancos.DBEFCuentaGastosExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaGastos);
end;

procedure TFMEmpBancos.DBEFCuentaGastosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaGastos);
end;

procedure TFMEmpBancos.DBEFCuentaGastosDesExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaGastosDes);
end;

procedure TFMEmpBancos.DBEFCuentaGastosDesKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaGastosdes);
end;

procedure TFMEmpBancos.AInfoTerceroExecute(Sender: TObject);
begin
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMEmpBancos.AActualizaRiesgosExecute(Sender: TObject);
begin
  DMEmpBancos.ActualizaRiesgos;
end;

procedure TFMEmpBancos.DBEFCuentaGastosPagaresKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaGastosPagares);
end;

procedure TFMEmpBancos.DBEFCuentaPagaresKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaPagares);
end;

procedure TFMEmpBancos.DBEFCuentaPagaresExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaPagares);
end;

procedure TFMEmpBancos.DBEFCuentaGastosPagaresExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaGastosPagares);
end;

procedure TFMEmpBancos.DBEFCuentaInteresesExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaIntereses);
end;

procedure TFMEmpBancos.DBEFCuentaInteresesKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaIntereses);
end;

procedure TFMEmpBancos.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if DBEFTercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBEFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DMEmpBancos.QMEmp_BancosTERCERO.AsInteger));
end;

procedure TFMEmpBancos.DBEFCuentaGastosImpagadosExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuentaGastosImpagados);
end;

procedure TFMEmpBancos.DBEFCuentaGastosImpagadosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaGastosImpagados);
end;

procedure TFMEmpBancos.DBEFCuentaCorrienteChange(Sender: TObject);
begin
  DBETituloCuentaCorriente.Text := DameTituloCuenta(DBEFCuentaCorriente.Text);
end;

procedure TFMEmpBancos.DBEFCuentaAhorroChange(Sender: TObject);
begin
  DBETituloCuentaAhorro.Text := DameTituloCuenta(DBEFCuentaAhorro.Text);
end;

procedure TFMEmpBancos.DBECuentaDtoChange(Sender: TObject);
begin
  DBETituloCuentaDto.Text := DameTituloCuenta(DBECuentaDto.Text);
end;

procedure TFMEmpBancos.DBEFCuentaConfirmingChange(Sender: TObject);
begin
  DBETituloCuentaConfirming.Text := DameTituloCuenta(DBEFCuentaConfirming.Text);
end;

procedure TFMEmpBancos.DBEFCuentaGastosChange(Sender: TObject);
begin
  DBETituloCuentaGastos.Text := DameTituloCuenta(DBEFCuentaGastos.Text);
end;

procedure TFMEmpBancos.DBEFCuentaGastosDesChange(Sender: TObject);
begin
  DBETituloCuentaGastosDes.Text := DameTituloCuenta(DBEFCuentaGastosDes.Text);
end;

procedure TFMEmpBancos.DBEFCuentaPagaresChange(Sender: TObject);
begin
  DBETituloCuentaPagares.Text := DameTituloCuenta(DBEFCuentaPagares.Text);
end;

procedure TFMEmpBancos.DBEFCuentaGastosPagaresChange(Sender: TObject);
begin
  DBETituloCuentaGastosPagares.Text := DameTituloCuenta(DBEFCuentaGastosPagares.Text);
end;

procedure TFMEmpBancos.DBEFCuentaInteresesChange(Sender: TObject);
begin
  DBETituloCuentaIntereses.Text := DameTituloCuenta(DBEFCuentaIntereses.Text);
end;

procedure TFMEmpBancos.DBEFCuentaGastosImpagadosChange(Sender: TObject);
begin
  DBETituloCuentaGastosImpagado.Text := DameTituloCuenta(DBEFCuentaGastosImpagados.Text);
end;

procedure TFMEmpBancos.DBEFTerceroChange(Sender: TObject);
begin
  ETituloTercero.Text := DameTituloTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMEmpBancos.DBEIBANEnter(Sender: TObject);
begin
  if (DBEIBAN.Text = '') and (Trim(DBECC.Text) <> '') then
     DBEIBAN.Text := CalcularIBAN(DamePaisC2(REntorno.Pais), Trim(DBEEntidad.Text) + Trim(DBEOficina.Text) + Trim(DBEDC.Text) + Trim(DBECC.Text));
end;

procedure TFMEmpBancos.CompruebaCuentaBancaria;
begin
  // Si esta vacio no lo chequeo
  if ((Trim(DBEEntidad.Text) + Trim(DBEOficina.Text) + Trim(DBEDC.Text) + Trim(DBECC.Text) > ' ')) and
     (DBEDC.Text <> '**') and
     (CuentaCCCValida(DBEEntidad.Text, DBEOficina.Text, DBEDC.Text, Trim(DBECC.Text))) then
  begin
     ColorEdicion(DBEEntidad);
     ColorEdicion(DBEOficina);
     ColorEdicion(DBEDC);
     ColorEdicion(DBECC);
  end
  else
  begin
     ColorError(DBEEntidad);
     ColorError(DBEOficina);
     ColorError(DBEDC);
     ColorError(DBECC);
  end;
end;

procedure TFMEmpBancos.DBEIBANChange(Sender: TObject);
begin
  if (Trim(DBEIBAN.Text) > '') and (not IBANValido(DBEIBAN.Text)) then
     ColorError(DBEIBAN)
  else
     ColorEdicion(DBEIBAN);
end;

procedure TFMEmpBancos.DBEEntidadChange(Sender: TObject);
begin
  CompruebaCuentaBancaria;
  // Si el pais es Chile asignamos el titulo sys_bancos
  if (REntorno.Pais = 'CHL') then
  begin
     DMEmpBancos.QMEmp_BancosTITULO.AsString := DameTituloEntidad(DBEFPais.Text, DBEEntidad.Text);
     DMEmpBancos.QMEmp_BancosSUCURSAL.AsString := '0000';
     DMEmpBancos.QMEmp_BancosCONTROL.AsString := '00';
  end;
end;

procedure TFMEmpBancos.FiltraBanco(aFiltro: string);
begin
  DMEmpBancos.FiltraBanco(aFiltro);
end;

procedure TFMEmpBancos.AConfigCircularizacionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  TFMListConfig.Create(Self).Muestra(647, Formato, Cabecera, Copias, Pijama, '', DMLstCircularizacion.frCircularizacion);
  CierraData(DMLstCircularizacion);
end;

procedure TFMEmpBancos.AVisualizarCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DMEmpBancos.ImprimirCircularizacion(0, False);
end;

procedure TFMEmpBancos.AImprimirCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DMEmpBancos.ImprimirCircularizacion(1, False);
end;

procedure TFMEmpBancos.AEnviarEmailCartaCircularizacionExecute(Sender: TObject);
begin
  inherited;
  DMEmpBancos.ImprimirCircularizacion(2, False, True);
end;

procedure TFMEmpBancos.AEnviarEmailCartaCircularizacion2Execute(Sender: TObject);
begin
  inherited;
  DMEmpBancos.ImprimirCircularizacion(2, True);
end;

procedure TFMEmpBancos.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFMEmpBancos.DBEEntidadBusqueda(Sender: TObject);
begin
  inherited;
  DBEEntidad.CondicionBusqueda := 'PAIS = ''' + DBEFPais.Text + '''';
end;

end.
