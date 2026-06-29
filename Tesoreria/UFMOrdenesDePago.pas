unit UFMOrdenesDePago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UEditPanel, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, UHYDBGrid, UFormGest, DB,
  UNavigator, NsDBGrid, rxToolEdit, RXDBCtrl, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFPanel, ULFPageControl, ULFToolBar,
  ActnList, ULFActionList, rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, Buttons, ULFEditFind2000, ULFDBDateEdit, ULFEdit;

type
  TFMOrdenesDePago = class(TG2KForm)
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     TSepNav: TToolButton;
     EPMain: THYMEditPanel;
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     TSTabla: TTabSheet;
     PEdit: TLFPanel;
     LBLOrden: TLFLabel;
     LBanco: TLFLabel;
     DBEFBanco: TLFDBEditFind2000;
     ETituloBanco: TLFEdit;
     DBDTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     DBEImporte: TLFDbedit;
     LImporte: TLFLabel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TButtSep2: TToolButton;
     EPDetalle: THYMEditPanel;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     TButtMostrarDisponibles: TToolButton;
     TButtSeleccionarTodas: TToolButton;
     TButtSep5: TToolButton;
     DBCHKCerrada: TLFDBCheckBox;
     DBEConfirming: TLFDbedit;
     DBETituloOrden: TLFDbedit;
     HYDBGConfirming: THYTDBGrid;
     TButtAbreOCierra: TToolButton;
     ToolButton1: TToolButton;
     TButtGeneraConfirming: TToolButton;
     PPFormatos: TPopUpTeclas;
     FSMain: TLFFibFormStorage;
     ALMain: TLFActionList;
     TBActions: TLFToolBar;
     AImpresion: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBCHKDetalleCargos: TLFDBCheckBox;
     LFDBECodigo: TLFDbedit;
     LFLCodigo: TLFLabel;
     MINormaCSB34: TMenuItem;
     LBLNAsiento: TLFLabel;
     DBERic: TLFDbedit;
     MIIrAAsiento1: TMenuItem;
     SBARic: TSpeedButton;
     DBCHKNormaGenerada: TLFDBCheckBox;
     PNLFiltro: TLFPanel;
     SBAcreedores: TSpeedButton;
     SBProveedores: TSpeedButton;
     SBIndemnizaciones: TSpeedButton;
     ToolButton2: TToolButton;
     EFEmpresaIndemnizacion: TLFEditFind2000;
     TBDatosRecibo: TToolButton;
     ToolButton4: TToolButton;
     MINormaCSB34_1: TMenuItem;
     DBRGGastos: TDBRadioGroup;
     MINormaCSB34_1_Banesto: TMenuItem;
     MINormaCSB34_1_Pastor: TMenuItem;
     PNLVerSaldos: TLFPanel;
     CBVerSaldos: TLFCheckBox;
     PNLSaldos: TLFPanel;
     LSaldoDeudor: TLFLabel;
     DBESaldoDeudor: TLFDbedit;
     LSaldoAcreedor: TLFLabel;
     DBESaldoAcreedor: TLFDbedit;
     LSaldo: TLFLabel;
     DBESaldo: TLFDbedit;
     MINormaCSB34_1_Bankinter: TMenuItem;
     MINormaCSB34_1_BancoPopular: TMenuItem;
     MISEPA: TMenuItem;
     SBABanco: TSpeedButton;
     LFCategoryAction2: TLFCategoryAction;
     ABanco: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBEFBancoChange(Sender: TObject);
     procedure TButtMostrarDisponiblesClick(Sender: TObject);
     procedure TButtSeleccionarTodasClick(Sender: TObject);
     procedure TButtCerrarOrdPAgoClick(Sender: TObject);
     procedure TButtAbreOCierraClick(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure MINormaCSB34Click(Sender: TObject);
     procedure MIIrAAsiento1Click(Sender: TObject);
     procedure BotonPNLFiltroClick(Sender: TObject);
     procedure EFEmpresaIndemnizacionChange(Sender: TObject);
     procedure TBDatosReciboClick(Sender: TObject);
     procedure MINormaCSB34_1Click(Sender: TObject);
     procedure MINormaCSB34_1_BanestoClick(Sender: TObject);
     procedure MINormaCSB34_1_PastorClick(Sender: TObject);
     procedure CBVerSaldosChange(Sender: TObject);
     procedure MINormaCSB34_1_BankinterClick(Sender: TObject);
     procedure MINormaCSB34_1_BancoPopularClick(Sender: TObject);
     procedure MISEPAClick(Sender: TObject);
     procedure DBCHKCerradaChange(Sender: TObject);
     procedure AImpresionExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure ABancoExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure IniciaFormato(Formato: smallint);
     procedure AbreOCierra;
  public
     { Public declarations }
     procedure AjustaCheckOrdPago(OrdPago: integer);
  end;

var
  FMOrdenesDePago : TFMOrdenesDePago;

implementation

uses UDMOrdenesDePago, UDMMain, UUtiles, UFMListConfig, UFPregDatosCSB34, UEntorno,
  UFMain, UFPregOrdenesDePago, UDameDato;

{$R *.DFM}

procedure TFMOrdenesDePago.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMOrdenesDePago, DMOrdenesDePago);
  DMOrdenesDePago.Filtra;
  //Se asigna el PopUp del principal
  FMOrdenesDePago.PopupMenu := CEMainPMEdit;

  DBERic.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBARic, DBERic);
  ETituloBanco.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBABanco, ETituloBanco);

  EFEmpresaIndemnizacion.Width := SBAcreedores.Width;
  PNLFiltro.Width := SBAcreedores.Width + SBProveedores.Width + SBIndemnizaciones.Width + EFEmpresaIndemnizacion.Width;
  SBProveedores.Left := SBAcreedores.Width;
  SBIndemnizaciones.Left := SBAcreedores.Width + SBProveedores.Width;
  EFEmpresaIndemnizacion.Left := SBAcreedores.Width + SBProveedores.Width + SBIndemnizaciones.Width;

  CBVerSaldos.Checked := False;
  PNLVerSaldos.Visible := (DMMain.EstadoKri(217) = 1);
  CBVerSaldosChange(Self);

  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMOrdenesDePago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMOrdenesDePago);
  Action := caFree;
end;

procedure TFMOrdenesDePago.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMOrdenesDePago.TSTablaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMOrdenesDePago.DBEFBancoChange(Sender: TObject);
begin
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(DBEFBanco.Text, 0));
end;

procedure TFMOrdenesDePago.TButtMostrarDisponiblesClick(Sender: TObject);
begin
  DMOrdenesDePago.MostrarRecibosDisponibles(' ', ' ');
end;

procedure TFMOrdenesDePago.AjustaCheckOrdPago(OrdPago: integer);
begin
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf('ORD_PAGO')] := IntToStr(OrdPago);
end;

procedure TFMOrdenesDePago.TButtSeleccionarTodasClick(Sender: TObject);
begin
  DMOrdenesDePago.SeleccionaTodos;
end;

procedure TFMOrdenesDePago.TButtCerrarOrdPAgoClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     ShowMessage(_('La Orden de Pago ya está cerrada.'))
  else
     DMOrdenesDePago.CierraOrdPago;
end;

procedure TFMOrdenesDePago.TButtAbreOCierraClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
  begin
     if DBCHKNormaGenerada.Checked then
     begin
        if ConfirmaMensaje(_('La orden de pago ya ha sido generada, desea abrirla de todas formas?')) then
           DMOrdenesDePago.AbreOrdPago;
     end
     else
        DMOrdenesDePago.AbreOrdPago;
  end
  else
     DMOrdenesDePago.CierraOrdPago;
end;

procedure TFMOrdenesDePago.MINormaCSB34Click(Sender: TObject);
begin
  IniciaFormato(-1);
end;

procedure TFMOrdenesDePago.IniciaFormato(Formato: smallint);
var
  Sufijo : string;
begin
  Sufijo := '';
  case Formato of
     0: Sufijo := '000';
     1: Sufijo := '000';
     2: Sufijo := '000';
     3: Sufijo := '000';
     4: Sufijo := '000';
     5: Sufijo := '000';
  end;

  with TFPregDatosCSB34.Create(Self) do
  begin
     if Datos(Sufijo) then
        if (DBCHKCerrada.Checked) then
        begin
           case Formato of
              -1: DMOrdenesDePago.ImprimirNorma34;
              0..3: DMOrdenesDePago.ImprimirNorma34_1(Formato, Sufijo);
              4: DMOrdenesDePago.ImprimirNorma34_14(Formato, Sufijo);
              5: DMOrdenesDePago.ImprimirSEPA(Formato, Sufijo);
           end;
        end
        else
           ShowMessage(_('La Orden de Pago no ha sido cerrada.'));
  end;
end;

procedure TFMOrdenesDePago.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  DMOrdenesDePago.FiltraDetalle;
end;

procedure TFMOrdenesDePago.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMOrdenesDePago.BusquedaCompleja;
  Continua := False;
end;

procedure TFMOrdenesDePago.MINormaCSB34_1Click(Sender: TObject);
begin
  IniciaFormato(0);
end;

procedure TFMOrdenesDePago.MIIrAAsiento1Click(Sender: TObject);
begin
  if (DBCHKCerrada.Checked) then
     FMain.MuestraMovConta(' RIC= ' +
        DMOrdenesDePago.QMOrdenPagoRIC.AsString + ' and ejercicio=' + DMOrdenesDePago.QMOrdenPagoEJERCICIO.AsString);
end;

procedure TFMOrdenesDePago.BotonPNLFiltroClick(Sender: TObject);
begin
  if (DMOrdenesDePago.QMOrdenPagoCERRADO.AsInteger = 0) then
  begin
     if (TSpeedButton(Sender).Name = 'SBAcreedores') then
     begin
        DMOrdenesDePago.MostrarRecibosDisponibles('A', ' ');
        EFEmpresaIndemnizacion.Text := ' ';
     end;
     if (TSpeedButton(Sender).Name = 'SBProveedores') then
     begin
        DMOrdenesDePago.MostrarRecibosDisponibles('P', ' ');
        EFEmpresaIndemnizacion.Text := ' ';
     end;
     if ((TSpeedButton(Sender).Name = 'SBIndemnizaciones') and (Trim(EFEmpresaIndemnizacion.Text) > ' ')) then
        DMOrdenesDePago.MostrarRecibosDisponibles('I', EFEmpresaIndemnizacion.Text[1]);
  end;
end;

procedure TFMOrdenesDePago.EFEmpresaIndemnizacionChange(Sender: TObject);
begin
  if (Trim(EFEmpresaIndemnizacion.Text) > ' ') then
     SBIndemnizaciones.Click;
end;

procedure TFMOrdenesDePago.TBDatosReciboClick(Sender: TObject);
begin
  DMOrdenesDePago.DatosRegistro;
end;

procedure TFMOrdenesDePago.MINormaCSB34_1_BanestoClick(Sender: TObject);
begin
  IniciaFormato(1);
end;

procedure TFMOrdenesDePago.MINormaCSB34_1_PastorClick(Sender: TObject);
begin
  IniciaFormato(2);
end;

procedure TFMOrdenesDePago.MINormaCSB34_1_BankinterClick(Sender: TObject);
begin
  IniciaFormato(3);
end;

procedure TFMOrdenesDePago.MINormaCSB34_1_BancoPopularClick(Sender: TObject);
begin
  IniciaFormato(4);
end;

procedure TFMOrdenesDePago.CBVerSaldosChange(Sender: TObject);
begin
  DMOrdenesDePago.CalcularSaldo := CBVerSaldos.Checked;
  PNLSaldos.Visible := CBVerSaldos.Checked;
end;

procedure TFMOrdenesDePago.MISEPAClick(Sender: TObject);
begin
  IniciaFormato(5);
end;

procedure TFMOrdenesDePago.AbreOCierra;
begin
  with TButtAbreOCierra do
  begin
     if not (DBCHKCerrada.Checked) then
     begin
        Caption := _('Cerrar');
        Hint := _('Cierra y bloquea la Orden de Pago');
        ImageIndex := 68;
        Tag := 0;
     end
     else
     begin
        Caption := _('Abrir');
        Hint := _('Abrir la Orden de Pago');
        ImageIndex := 67;
        Tag := 1;
     end;
  end;
end;

procedure TFMOrdenesDePago.DBCHKCerradaChange(Sender: TObject);
begin
  AbreOCierra;
end;

procedure TFMOrdenesDePago.AImpresionExecute(Sender: TObject);
begin
  TFPregOrdenesDePago.Create(Self).Muestra(DMOrdenesDePago.QMOrdenPagoNUM_ORDEN.AsInteger);
end;

procedure TFMOrdenesDePago.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ((UpperCase(ColActual.FieldName) = 'DOC_NUMERO') or (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or (UpperCase(ColActual.FieldName) = 'DOC_TIPO') or (UpperCase(ColActual.FieldName) = 'REGISTRO') or (UpperCase(ColActual.FieldName) = 'COD_CLI_PRO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMOrdenesDePago.DBGFDetalleDblClick(Sender: TObject);
begin
  if (DMOrdenesDePago.QMDetalleID_CARTERA.AsInteger <> 0) then
  begin
     if ((UpperCase(ColActual.FieldName) = 'DOC_NUMERO') or (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or (UpperCase(ColActual.FieldName) = 'DOC_TIPO')) then
        FMain.TraspasoDeDocumentosEntrada(DMOrdenesDePago.QMDetalle.FieldByName('ID_DOC').AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'REGISTRO') then
        FMain.MuestraCartera(DMOrdenesDePago.QMDetalleID_CARTERA.AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'COD_CLI_PRO') then
     begin
        if ((DMOrdenesDePago.QMDetalleDOC_TIPO.AsString = 'FAP') or (DMOrdenesDePago.QMDetalleDOC_TIPO.AsString = 'AFP') or (DMOrdenesDePago.QMDetalleDOC_TIPO.AsString = 'NRP') or (DMOrdenesDePago.QMDetalleDOC_TIPO.AsString = '???')) then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DMOrdenesDePago.QMDetalle.FieldByName('COD_CLI_PRO').AsString)
        else
           FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR = ' + DMOrdenesDePago.QMDetalle.FieldByName('COD_CLI_PRO').AsString);
     end;
  end;
end;

procedure TFMOrdenesDePago.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMOrdenesDePago.ABancoExecute(Sender: TObject);
begin
  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.ABancos,
     'BANCO = ' + IntToStr(DMOrdenesDePago.QMOrdenPagoBANCO.AsInteger));
  {$ENDIF}
end;

end.
