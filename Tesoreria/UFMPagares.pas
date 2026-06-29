unit UFMPagares;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UEditPanel, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, UHYDBGrid, UFormGest, DB,
  UNavigator, Buttons, NsDBGrid, rxToolEdit, RXDBCtrl, ULFEdit,
  ULFDBCheckBox, ULFDBEdit, ULFDBEditFind2000, ULFPanel, ULFPageControl,
  ULFToolBar, ActnList, ULFActionList, rxPlacemnt, ULFFormStorage,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, HYFIBQuery, ULFDBDateEdit,
  UFPEditDetalle, UG2kTBLoc;

type
  TFMPagares = class(TFPEditDetalle)
     LBanco: TLFLabel;
     DBEFBanco: TLFDBEditFind2000;
     ETituloBanco: TLFEdit;
     DBDTPFecha: TLFDBDateEdit;
     DBEImporte: TLFDbedit;
     LImporte: TLFLabel;
     LBLDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LBLLugar: TLFLabel;
     DBELugar: TLFDbedit;
     SPBPermuta: TSpeedButton;
     EPro_Acre: TLFEdit;
     LBLPro_Acr: TLFLabel;
     DBEFProv_Acr: TLFDBEditFind2000;
     LBLFVencimiento: TLFLabel;
     DBDTPFVencimiento: TLFDBDateEdit;
     DBCBPagado: TLFDBCheckBox;
     DBCBContabilizado: TLFDBCheckBox;
     DBEPagare: TLFDbedit;
     LBLTipo_asiento: TLFLabel;
     DBEFTipo_asiento: TLFDBEditFind2000;
     AImprimePagares: TAction;
     AVerCartaPago: TAction;
     AImprimirCartaPago: TAction;
     AListConfig: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AContabilizaPagares: TAction;
     APagapagares: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ASep: TAction;
     TButtSep2: TToolButton;
     TButtMostrarDisponibles: TToolButton;
     EPDetalle: THYMEditPanel;
     TButtSeleccionarTodas: TToolButton;
     TButtSep5: TToolButton;
     TButtContabilizaPagare: TToolButton;
     TButtDescontabilizaPagare: TToolButton;
     TButtPagaPagare: TToolButton;
     TButtDespagaPagare: TToolButton;
     PMIrApunte: TPopupMenu;
     MIIrApunteContabilizado: TMenuItem;
     MIIrApuntePagado: TMenuItem;
     ToolButton1: TToolButton;
     TBIrApuntes: TToolButton;
     LSaldoDeudor: TLFLabel;
     DBESaldoDeudor: TLFDbedit;
     LSaldoAcreedor: TLFLabel;
     DBESaldoAcreedor: TLFDbedit;
     LSaldo: TLFLabel;
     DBESaldo: TLFDbedit;
     PNLVerSaldos: TLFPanel;
     CBVerSaldos: TLFCheckBox;
     TBSep1: TToolButton;
     TBListado: TToolButton;
     TBCarta: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBEFBancoChange(Sender: TObject);
     procedure TButtMostrarDisponiblesClick(Sender: TObject);
     procedure TButtSeleccionarTodasClick(Sender: TObject);
     procedure TButtCerrarPagareClick(Sender: TObject);
     procedure TButtAbrirPagareClick(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure SPBPermutaClick(Sender: TObject);
     procedure DBEFProv_AcrChange(Sender: TObject);
     procedure TButtPagaPagareClick(Sender: TObject);
     procedure TButtDespagaPagareClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AImprimePagaresExecute(Sender: TObject);
     procedure AVerCartaPagoExecute(Sender: TObject);
     procedure AImprimirCartaPagoExecute(Sender: TObject);
     procedure AListConfigExecute(Sender: TObject);
     procedure AContabilizaPagaresExecute(Sender: TObject);
     procedure APagapagaresExecute(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure MIIrApunteContabilizadoClick(Sender: TObject);
     procedure MIIrApuntePagadoClick(Sender: TObject);
     procedure CBVerSaldosChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEPagareChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AjustaCheckPagare(Pagare: string);
     procedure TipoTercero(Tipo: string);
     procedure DetalleVacio(Registros: integer);
  end;

var
  FMPagares : TFMPagares;

implementation

uses UDMMain, UUtiles, UDMPagares, UFPregPagares, UDMLSTPagares,
  UFMListConfig, UEntorno, UFMain, FIBQuery, UDameDato;

{$R *.DFM}

procedure TFMPagares.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPagares, DMPagares);
  // Se asigna el PopUp del principal
  FMPagares.PopupMenu := CEMainPMEdit;
  REntorno.Asiento_PAG_C := 'CRE';
  REntorno.Asiento_PAG_P := 'PRE';

  NavMain.DataSource := DMPagares.DSQMPagares;
  DBGMain.DataSource := DMPagares.DSQMPagares;
  G2kTableLoc.DataSource := DMPagares.DSQMPagares;
  NavDetalle.DataSource := DMPagares.DSQMDetalle;
  DBGFDetalle.DataSource := DMPagares.DSQMDetalle;

  CBVerSaldos.Checked := False;
  PNLVerSaldos.Visible := (DMMain.EstadoKri(217) = 1);
  CBVerSaldosChange(Self);

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(SPBPermuta, 1, DMMain.ILMain_Ac, 54);
end;

procedure TFMPagares.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPagares);
end;

procedure TFMPagares.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPagares.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
end;

procedure TFMPagares.DBEFBancoChange(Sender: TObject);
begin
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(DBEFBanco.Text, 0));
end;

procedure TFMPagares.TButtMostrarDisponiblesClick(Sender: TObject);
begin
  if (not DBCBContabilizado.Checked) then
     DMPagares.MostrarRecibosDisponibles;
end;

procedure TFMPagares.AjustaCheckPagare(Pagare: string);
begin
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf('PAGARE')] := Pagare;
end;

procedure TFMPagares.TButtSeleccionarTodasClick(Sender: TObject);
begin
  if (not DBCBContabilizado.Checked) then
     DMPagares.SeleccionaTodos;
end;

procedure TFMPagares.TButtCerrarPagareClick(Sender: TObject);
begin
  if ((DMPagares.QMPagares.State = dsEdit) or (DMPagares.QMPagares.State = dsInsert)) then
     DMPagares.QMPagares.Post;

  if ((DMPagares.QMDetalle.State = dsEdit) or (DMPagares.QMDetalle.State = dsInsert)) then
     DMPagares.QMDetalle.Post;

  if DBCBContabilizado.Checked then
     ShowMessage(_('El Pagaré ya está contabilizado'))
  else
     DMPagares.CierraPagare;
end;

procedure TFMPagares.TButtAbrirPagareClick(Sender: TObject);
begin
  if ((DMPagares.QMPagares.State = dsEdit) or (DMPagares.QMPagares.State = dsInsert)) then
     DMPagares.QMPagares.Post;

  if DBCBContabilizado.Checked then
     DMPagares.AbrePagare
  else
     ShowMessage(_('El Pagaré no está contabilizado'));
end;

procedure TFMPagares.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  if (not DBCBContabilizado.Checked) then
     DMPagares.FiltraDetalle;
end;

procedure TFMPagares.SPBPermutaClick(Sender: TObject);
begin
  if (not DMPagares.detalle) then
  begin
     if LBLPro_Acr.Caption = _('Proveedor') then
        TipoTercero('ACR')
     else
     begin
        if LBLPro_Acr.Caption = _('Acreedor') then
           TipoTercero('CLI')
        else
        begin
           if LBLPro_Acr.Caption = _('Cliente') then
              TipoTercero('PRO');
        end;
     end;
     DMPagares.CierraDetalle;
  end;
end;

procedure TFMPagares.TipoTercero(Tipo: string);
begin
  if Tipo = 'ACR' then
  begin
     LBLPro_Acr.Caption := _('Acreedor');
     DBEFProv_Acr.Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
     DBEFProv_Acr.CampoNum := 'ACREEDOR';
     DBEFProv_Acr.CampoStr := 'NOMBRE_R_SOCIAL';
     DBEFProv_Acr.OrdenadoPor.Text := 'ACREEDOR';
     DBGFDetalle.Columns[1].Title.Caption := 'Acr.';
  end
  else
  if Tipo = 'PRO' then
  begin
     LBLPro_Acr.Caption := _('Proveedor');
     DBEFProv_Acr.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
     DBEFProv_Acr.CampoNum := 'PROVEEDOR';
     DBEFProv_Acr.CampoStr := 'NOMBRE_R_SOCIAL';
     DBEFProv_Acr.OrdenadoPor.Text := 'PROVEEDOR';
     DBGFDetalle.Columns[1].Title.Caption := 'Prov.';
  end
  else
  if Tipo = 'CLI' then
  begin
     LBLPro_Acr.Caption := _('Cliente');
     DBEFProv_Acr.Tabla_a_buscar := 'VER_CLIENTES_CUENTAS';
     DBEFProv_Acr.CampoNum := 'CLIENTE';
     DBEFProv_Acr.CampoStr := 'TITULO';
     DBEFProv_Acr.OrdenadoPor.Text := 'CLIENTE';
     DBGFDetalle.Columns[1].Title.Caption := 'Cli.';
     EPro_Acre.Text := DameTituloCliente(StrToIntDef(DBEFProv_Acr.Text, 0));
  end;

  DBEFProv_AcrChange(Self);
end;

procedure TFMPagares.DBEFProv_AcrChange(Sender: TObject);
var
  Tipo : string;
begin
  if LBLPro_Acr.Caption = _('Proveedor') then
  begin
     Tipo := 'PRO';
     EPro_Acre.Text := DameTituloProveedor(StrToIntDef(DBEFProv_Acr.Text, 0));
  end
  else
  if LBLPro_Acr.Caption = _('Acreedor') then
  begin
     Tipo := 'ACR';
     EPro_Acre.Text := DameTituloAcreedor(StrToIntDef(DBEFProv_Acr.Text, 0));
  end
  else
  if LBLPro_Acr.Caption = _('Cliente') then
  begin
     Tipo := 'CLI';
     EPro_Acre.Text := DameTituloCliente(StrToIntDef(DBEFProv_Acr.Text, 0));
  end;

  DMPagares.CambiaCod_Pro(Tipo);
end;

procedure TFMPagares.TButtPagaPagareClick(Sender: TObject);
begin
  if ((DMPagares.QMPagares.State = dsEdit) or (DMPagares.QMPagares.State = dsInsert)) then
     DMPagares.QMPagares.Post;

  if DBCBPagado.Checked then
     ShowMessage(_('El Pagaré ya está pagado'))
  else
     DMPagares.PagaPagare;
end;

procedure TFMPagares.TButtDespagaPagareClick(Sender: TObject);
begin
  if ((DMPagares.QMPagares.State = dsEdit) or (DMPagares.QMPagares.State = dsInsert)) then
     DMPagares.QMPagares.Post;

  if DBCBPagado.Checked then
     DMPagares.DespagaPagare
  else
     ShowMessage(_('El Pagaré no está pagado'));
end;

procedure TFMPagares.DetalleVacio(Registros: integer);
begin
  if (Registros < 1) then
     PDetalle.Enabled := False
  else
     PDetalle.Enabled := True;
end;

procedure TFMPagares.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMPagares.BusquedaCompleja;
  Continua := False;
end;

procedure TFMPagares.AImprimePagaresExecute(Sender: TObject);
begin
  TFPregPagares.Create(Self).Mostrar(DMPagares.QMPagaresPAGARE.AsString);
end;

procedure TFMPagares.AVerCartaPagoExecute(Sender: TObject);
begin
  DMPagares.MostrarCartaPago(0);
end;

procedure TFMPagares.AImprimirCartaPagoExecute(Sender: TObject);
begin
  DMPagares.MostrarCartaPago(1);
end;

procedure TFMPagares.AListConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPagares, DMLstPagares);
  TFMListConfig.Create(Self).Muestra(103, formato, cabecera, copias,
     pijama, '', DMLstPagares.frCartaPago, DMLstPagares.HYPagares);
  CierraData(DMLstPagares);
end;

procedure TFMPagares.AContabilizaPagaresExecute(Sender: TObject);
begin
  DMPagares.ContabilizaPagares;
end;

procedure TFMPagares.APagapagaresExecute(Sender: TObject);
begin
  DMPagares.PagaPagares;
end;

procedure TFMPagares.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
     DBEPagare.Enabled := True;
     DBEPagare.ReadOnly := False;
     DBEPagare.Color := clWindow;
     DBEPagare.Font.Color := clWindowText;
  end
  else
  begin
     DBEPagare.Enabled := False;
     DBEPagare.ReadOnly := True;
     DBEPagare.Color := clInfoBk;
     DBEPagare.Font.Color := clGrayText;
  end;
end;

procedure TFMPagares.MIIrApunteContabilizadoClick(Sender: TObject);
begin
  // Apunte de Contabilizado
  if (DMPagares.QMPagaresCONTABILIZADO.AsInteger > 0) then
     FMain.MuestraMovConta(' RIC= ' + DMPagares.QMPagaresRIC_CONTABILIZADO.AsString +
        ' and EJERCICIO=' + DMPagares.QMPagaresEJERCICIO.AsString, DMPagares.QMPagaresCANAL.AsString);
end;

procedure TFMPagares.MIIrApuntePagadoClick(Sender: TObject);
var
  Ejercicio : integer;
begin
  // Apunte de Pago
  if (DMPagares.QMPagaresPAGADO.AsInteger > 0) then
  begin
     Ejercicio := DameEjercicio(DMPagares.QMPagaresEMPRESA.AsInteger, DMPagares.QMPagaresFECHA_VENCIMIENTO.AsDateTime);
     FMain.MuestraMovConta(' RIC= ' + DMPagares.QMPagaresRIC_PAGADO.AsString +
        ' and EJERCICIO=' + IntToStr(Ejercicio), DMPagares.QMPagaresCANAL.AsString);
  end;
end;

procedure TFMPagares.CBVerSaldosChange(Sender: TObject);
begin
  DMPagares.CalcularSaldo := CBVerSaldos.Checked;

  if CBVerSaldos.Checked then
     PEdit.Height := DBESaldoDeudor.Top + DBESaldoDeudor.Height + 5
  else
     PEdit.Height := DBEFTipo_asiento.Top + DBEFTipo_asiento.Height + 5;

  LSaldoDeudor.Visible := CBVerSaldos.Checked;
  LSaldoAcreedor.Visible := CBVerSaldos.Checked;
  LSaldo.Visible := CBVerSaldos.Checked;
  DBESaldoDeudor.Visible := CBVerSaldos.Checked;
  DBESaldoAcreedor.Visible := CBVerSaldos.Checked;
  DBESaldo.Visible := CBVerSaldos.Checked;
end;

procedure TFMPagares.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMPagares.DBEPagareChange(Sender: TObject);
begin
  inherited;
  TipoTercero(DMPagares.QMPagaresTIPO_TERCERO.AsString);
  AjustaCheckPagare(DBEPagare.Text);
end;

end.
