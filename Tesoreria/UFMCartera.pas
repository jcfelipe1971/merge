unit UFMCartera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker, ActnList,
  Buttons, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFComboBox,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, UG2kTBLoc, ULFDBDateEdit, ULFFIBDBEditFind,
  ULFEdit, UFPEditDetalle;

type
  TFMCartera = class(TFPEditDetalle)
     DBERegistro: TLFDbedit;
     LNRegistro: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     DBEFCuenta: TLFDBEditFind2000;
     LCuenta: TLFLabel;
     ETitCuenta: TLFEdit;
     DBEFFormaPago: TLFDBEditFind2000;
     LFormaSerie: TLFLabel;
     EFormaPago: TLFEdit;
     DBEBases: TLFDbedit;
     DBCBPagado: TLFDBCheckBox;
     LBase: TLFLabel;
     TButtLimpiaRegistro: TToolButton;
     TButtLimpiaTodo: TToolButton;
     CBSigno: TLFComboBox;
     DBESerie: TLFDbedit;
     DBENumero: TLFDbedit;
     DBDTPFechaDoc: TLFDBDateEdit;
     LSerie: TLFLabel;
     LBLNumero: TLFLabel;
     LFechaFicha: TLFLabel;
     LRegIVA: TLFLabel;
     DBERegIva: TLFDbedit;
     LAsiento: TLFLabel;
     DBEAsiento: TLFDbedit;
     ALCartera: TLFActionList;
     DBELiquido: TLFDbedit;
     LLiquido: TLFLabel;
     TButtRefresca: TToolButton;
     TButtSep2: TToolButton;
     LTipo: TLFLabel;
     DBETipoDocumento: TLFDbedit;
     LDocumento: TLFLabel;
     ToolButton1: TToolButton;
     TButtPagaRecibos: TToolButton;
     ToolButton2: TToolButton;
     TButtInvisible: TToolButton;
     TButtVisible: TToolButton;
     ToolButton3: TToolButton;
     TButtRecibosAgrupados: TToolButton;
     TButtImprimirUnRecibo: TToolButton;
     DBEDescripcion: TLFDbedit;
     LDescripcion: TLFLabel;
     SBVerFactura: TSpeedButton;
     N1: TMenuItem;
     CEMainVerFactura: TMenuItem;
     AFactura: TAction;
     DBEMoneda: TLFDbedit;
     LMoneda: TLFLabel;
     DBECPagada: TLFDbedit;
     LCPagada: TLFLabel;
     DBEFTipoAsiento: TLFDBEditFind2000;
     LTipoAsiento: TLFLabel;
     TButtAsiento: TToolButton;
     PMAsiento: TPopupMenu;
     MIAsientodePago: TMenuItem;
     MIAsientoRecibido: TMenuItem;
     AAsientoPago: TAction;
     AAsientoRecibido: TAction;
     ALstTesoreria: TAction;
     ALstPrevisionPagos: TAction;
     ALstPrevisionCobros: TAction;
     ALstPrevisionCuentas: TAction;
     ALstRecibosAgrupacion: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfRecibos: TAction;
     AConfRecibosAgente: TAction;
     AConfTesoreria: TAction;
     AConfPrevPagos: TAction;
     AConfPagosCodigo: TAction;
     AConfPrevCobros: TAction;
     AConfCobrosCodigo: TAction;
     AConfRecibosAgrupacion: TAction;
     AConfRecibosCartera: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstCartera: TAction;
     ARecibosFacturas: TAction;
     ADesagrupaRecibos: TAction;
     LFCategoryAction3: TLFCategoryAction;
     LFCategoryAction4: TLFCategoryAction;
     AControlIVA: TAction;
     ASep: TAction;
     ABuscarxImporte: TAction;
     ALstCobrosVencidos: TAction;
     ToolButton4: TToolButton;
     TBDatosReciboKri: TToolButton;
     MIIraReciboqueAgrupaKRI1: TMenuItem;
     AReciboAgrupaKri: TAction;
     LObservacionesPago: TLFLabel;
     DBEObservacionesPago: TLFDbedit;
     PNLObservaciones: TLFPanel;
     LTipoEfecto: TLFLabel;
     LObservacionesVencimiento: TLFLabel;
     DBEFTipoEfecto: TLFFibDBEditFind;
     DBEObservaciones: TLFDbedit;
     LPerteneceAgrupacion: TLFLabel;
     PNLTipo: TLFPanel;
     SBVerRegistro: TSpeedButton;
     ARegistroIVA: TAction;
     SBVerAsientos: TSpeedButton;
     AAsientoFactura: TAction;
     LFechaValor: TLFLabel;
     DBDTPFechaValor: TLFDBDateEdit;
     SBAContaExtracto: TSpeedButton;
     AContaExtracto: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFCuentaBusqueda(Sender: TObject);
     procedure CBSignoChange(Sender: TObject);
     procedure TButtLimpiaRegistroClick(Sender: TObject);
     procedure TButtLimpiaTodoClick(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure TButtRefrescaClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TButtPagaRecibosClick(Sender: TObject);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TButtInvisibleClick(Sender: TObject);
     procedure TButtVisibleClick(Sender: TObject);
     procedure TButtRecibosAgrupadosClick(Sender: TObject);
     procedure TButtImprimirUnReciboClick(Sender: TObject);
     procedure AFacturaExecute(Sender: TObject);
     procedure DBEMonedaChange(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AAsientoPagoExecute(Sender: TObject);
     procedure AAsientoRecibidoExecute(Sender: TObject);
     procedure DBEFCuentaExit(Sender: TObject);
     procedure DBEFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ALstTesoreriaExecute(Sender: TObject);
     procedure ALstPrevisionPagosExecute(Sender: TObject);
     procedure ALstPrevisionCobrosExecute(Sender: TObject);
     procedure ALstPrevisionCuentasExecute(Sender: TObject);
     procedure ALstRecibosAgrupacionExecute(Sender: TObject);
     procedure AConfRecibosExecute(Sender: TObject);
     procedure AConfRecibosAgenteExecute(Sender: TObject);
     procedure AConfTesoreriaExecute(Sender: TObject);
     procedure AConfPrevPagosExecute(Sender: TObject);
     procedure AConfPagosCodigoExecute(Sender: TObject);
     procedure AConfPrevCobrosExecute(Sender: TObject);
     procedure AConfCobrosCodigoExecute(Sender: TObject);
     procedure AConfRecibosAgrupacionExecute(Sender: TObject);
     procedure AConfRecibosCarteraExecute(Sender: TObject);
     procedure ALstCarteraExecute(Sender: TObject);
     procedure ARecibosFacturasExecute(Sender: TObject);
     procedure ADesagrupaRecibosExecute(Sender: TObject);
     procedure AControlIVAExecute(Sender: TObject);
     procedure ABuscarxImporteExecute(Sender: TObject);
     procedure ALstCobrosVencidosExecute(Sender: TObject);
     procedure TBDatosReciboKriClick(Sender: TObject);
     procedure AReciboAgrupaKriExecute(Sender: TObject);
     procedure DBEFCuentaChange(Sender: TObject);
     procedure DBEFFormaPagoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBERegistroChange(Sender: TObject);
     procedure ARegistroIVAExecute(Sender: TObject);
     procedure SBVerRegistroDblClick(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure AAsientoFacturaExecute(Sender: TObject);
     procedure SBAContaExtractoDblClick(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure G2KTableLocClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     FiltroCuenta: string;
     InicializaSigno: boolean;
     function DameSigno(n: smallint): string;
     procedure CambiaSignoSinFiltrar(Signo: char);
  public
     procedure FiltraRegistro(Ejercicio, Canal: smallint; Signo: char; Registro: integer); overload;
     procedure FiltraRegistro(Signo: char; ListaId: string); overload;
  end;

var
  FMCartera : TFMCartera;

implementation

uses UDMCartera, UFormGest, UDMMain, UUtiles, UDMLSTCartera,
  UFPregPrevisionCobro, UFPregPrevisionPago, UFPregCartera,
  UFPregTesoreria, UDMRTesoreria, UDMRPrevisionCobro,
  UDMRPrevisionPago, UFMListConfig, UFPregAgrupaciones, UDMLstAgrupacion,
  UFPregPagaRecibos, UFMain, UEntorno, UFMRecibosAgrupados, UDMLstCarteraRecibos,
  UFMRecibosFactura, UFPregPrevisionCuentas, UFMBuscaRecxImp,
  UFPregCobrosVencidos, UFMAgrupacionesRecibos, DateUtils, UParam, UDameDato;

{$R *.DFM}

procedure TFMCartera.FormCreate(Sender: TObject);
var
  c : TColumn;
begin
  inherited;
  AbreData(TDMCartera, DMCartera);

  FiltroCuenta := 'GESTION IN (4,5)';

  NavMain.DataSource := DMCartera.DSQMCartera;
  DBGMain.DataSource := DMCartera.DSQMCartera;
  NavDetalle.DataSource := DMCartera.DSQMCarteraDetalle;
  DBGFDetalle.DataSource := DMCartera.DSQMCarteraDetalle;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  CEDetallePMEdit.Teclas := DMMain.Teclas;
  SolapaControles(SBVerFactura, DBETipoDocumento);
  SolapaControles(SBVerRegistro, DBERegIva);
  SolapaControles(SBVerAsientos, DBEAsiento);
  DBETipoDocumento.Color := REntorno.ColorEnlaceActivo;
  DBERegIva.Color := REntorno.ColorEnlaceActivo;
  DBEAsiento.Color := REntorno.ColorEnlaceActivo;

  if (FMain.AContaExtracto.Enabled = False) then
  begin
     DBEFCuenta.Color := clWindow;
  end
  else
  begin
     SolapaControles(SBAContaExtracto, DBEFCuenta);
     DBEFCuenta.Color := REntorno.ColorEnlaceActivo;
  end;

  REntorno.Asiento_CAR_C := 'CRE';
  REntorno.Asiento_CAR_P := 'PRE';
  if (REntorno.Pais <> 'DOM') then
  begin
     c := DBGFDetalle.FindColumn('RETENCION');
     if Assigned(c) then
        c.Visible := False;
     c := DBGFDetalle.FindColumn('TIPO_RETENCION');
     if Assigned(c) then
        c.Visible := False;
  end;

  InicializaSigno := True;
  CBSigno.ItemIndex := 0;
  // Esto abre la cartera filtrada por signo
  CBSignoChange(Sender);
end;

procedure TFMCartera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCartera);
end;

procedure TFMCartera.DBEFCuentaBusqueda(Sender: TObject);
var
  Ejercicio, Pgc : integer;
  Tipo : string;
begin
  if ((DBGFDetalle.ColumnaActual = 'TIPO_RETENCION') or (DBGFDetalle.ColumnaActual = 'TIPO_EFECTO')) then
     DBGFDetalle.CondicionBusqueda := ''
  else
  if (DBGFDetalle.ColumnaActual = 'BANCO_CLIPRO') then
  begin
     if Pos('SYS_TERCEROS_BANCOS', Trim(DBGFDetalle.TablaABuscar)) > 0 then
     begin
        if (DMCartera.QMCarteraSIGNO.AsString = 'C') then
           Tipo := 'CLI'
        else
        if ((DMCartera.QMCarteraDOC_TIPO.AsString = 'FAP') or (DMCartera.QMCarteraDOC_TIPO.AsString = 'AGP') or
           (DMCartera.QMCarteraDOC_TIPO.AsString = 'NRP') or (DMCartera.QMCarteraDOC_TIPO.AsString = 'AFP')) then
           Tipo := 'PRO'
        else
           Tipo := 'ACR';

        DBGFDetalle.CondicionBusqueda := 'TERCERO=' + IntToStr(DameTercero(Tipo, DMCartera.QMCarteraCOD_CLI_PRO.AsInteger));
     end;
  end
  else
  begin
     if Pos('CON_CUENTAS', Trim(DBGFDetalle.TablaABuscar)) > 0 then
     begin
        Ejercicio := DameEjercicio(REntorno.Empresa, DMCartera.QMCarteraDetalleVENCIMIENTO.AsDateTime);
        Pgc := DamePgc(REntorno.Empresa, Ejercicio, REntorno.Canal);
        DBGFDetalle.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           IntToStr(Ejercicio) + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC= ' + IntToStr(Pgc) + ' AND TIPO = 5';
     end;
  end;
end;

procedure TFMCartera.CBSignoChange(Sender: TObject);
begin
  if (CBSigno.ItemIndex = 0) then
  begin
     LCPagada.Caption := _('C. Cobrada');
  end
  else
  begin
     LCPagada.Caption := _('C. Pagada');
  end;

  // Inicializamos el modo normal de Cartera, por si se hubiera usado el SQL Filtrado
  if (InicializaSigno) then
     DMCartera.InicializaQMCartera(DameSigno(CBSigno.ItemIndex));
end;

procedure TFMCartera.TButtLimpiaRegistroClick(Sender: TObject);
begin
  DMCartera.LimpiaRegistro;
end;

procedure TFMCartera.TButtLimpiaTodoClick(Sender: TObject);
begin
  DMCartera.LimpiaSigno;
end;

procedure TFMCartera.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;

  if (DBGFDetalle.SelectedField.FieldName = 'CTA_PAGO') then
  begin
     FMain.AddComponentePunto(DBGFDetalle);
  end
  else
  begin
     FMain.DelComponentePunto(DBGFDetalle);
  end;
end;

procedure TFMCartera.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (Button = nbDelete) then
     if not confirma then
        Continua := False
     else if not ConfirmaGrave then
        Continua := False;
end;

procedure TFMCartera.TButtRefrescaClick(Sender: TObject);
begin
  DMCartera.Refresca;
end;

procedure TFMCartera.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMCartera.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCartera.TButtPagaRecibosClick(Sender: TObject);
begin
  with TFPregPagaRecibos.Create(Self) do
  begin
     try
        Muestra(DameSigno(CBSigno.ItemIndex), DMCartera.QMCarteraDetalleCTA_PAGO.AsString);
     finally
        Free;
     end;
  end;
end;

procedure TFMCartera.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  if (DBGFDetalle.SelectedField.FieldName = 'CTA_PAGO') then
  begin
     // Cuando se abandone la columna de cuenta se
     // expandira la cuenta si esta tiene un punto
     DBGFDetalle.SelectedField.AsString :=
        ExpandirCadena(Trim(DBGFDetalle.SelectedField.AsString), REntorno.DigitosSub);
     // Titulo de la cuenta en el ejercicio del vencimiento
     DMCartera.QMCarteraDetalleTITULO.AsString :=
        DameTituloCuenta(DMCartera.QMCarteraDetalleCTA_PAGO.AsString, DameEjercicio(REntorno.Empresa, DMCartera.QMCarteraDetalleVENCIMIENTO.AsDateTime));
  end;
end;

procedure TFMCartera.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMCartera.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMCartera.TButtInvisibleClick(Sender: TObject);
begin
  DMCartera.Invisible;
end;

procedure TFMCartera.TButtVisibleClick(Sender: TObject);
begin
  DMCartera.Visible;
end;

procedure TFMCartera.TButtRecibosAgrupadosClick(Sender: TObject);
begin
  inherited;
  if (DMCartera.EsAgrupado) then
  begin
     TFMRecibosAgrupados.Create(Self).Mostrar(REntorno.Empresa, REntorno.Ejercicio,
        REntorno.Canal, StrToIntDef(DBERegistro.Text, 0),
        DMCartera.QMCarteraEJERCICIO.AsInteger, DameSigno(CBSigno.ItemIndex)); {dji lrk kri - Si la agrupacion no esta visible o esta vacia necesito el ejercicio de la cab.}
  end
  else
  begin
     if (DMCartera.PerteneceAgrupacion) then
     begin
        TFMAgrupacionesRecibos.Create(Self).Mostrar(REntorno.Empresa, REntorno.Ejercicio,
           REntorno.Canal, StrToIntDef(DBERegistro.Text, 0), DameSigno(CBSigno.ItemIndex), DMCartera.QMCarteraEJERCICIO.AsInteger);
        FMAgrupacionesRecibos.Free;
     end
     else
        ShowMessage(_('Este recibo no está agrupado'));
  end;
end;

procedure TFMCartera.TButtImprimirUnReciboClick(Sender: TObject);
begin
  if (DMCartera.QMCarteraDetalle.RecordCount > 0) then
  begin
     AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
     DMLstCarteraRecibos.ImprimirUnRecibo(0, DMCartera.QMCarteraDetalleSIGNO.AsString,
        DMCartera.QMCarteraDetalleEJERCICIO.AsInteger,
        DMCartera.QMCarteraDetalleREGISTRO.AsInteger,
        DMCartera.QMCarteraDetalleLINEA.AsInteger);
     CierraData(DMLstCarteraRecibos);
  end
  else
     ShowMessage(_('No existen recibos para su impresión'));
end;

procedure TFMCartera.FiltraRegistro(Ejercicio, Canal: smallint; Signo: char; Registro: integer);
begin
  CambiaSignoSinFiltrar(Signo);
  DMCartera.FiltraCartera(Ejercicio, Canal, Signo, Registro);
end;

procedure TFMCartera.AFacturaExecute(Sender: TObject);
begin
  // Abre factura o asiento segun corresponda

  if ((DMCartera.QMCarteraDOC_TIPO.AsString = 'AFA') or
     (DMCartera.QMCarteraDOC_TIPO.AsString = 'AFC') or
     (DMCartera.QMCarteraDOC_TIPO.AsString = 'AFP')) then
     FMain.MuestraMovConta(' RIC= ' + DMCartera.QMCarteraRIC.AsString +
        ' AND EJERCICIO=' + IntToStr(YearOf(DMCartera.QMCarteraDOC_FECHA.AsDateTime)))
  else
  begin
     // El año de la fecha del documento no necesariamente es el ejerciico (compras que cruzan ejercicos)
     // FMain.MuestraDocumento(YearOf(DMCartera.QMCarteraDOC_FECHA.AsDateTime), DMCartera.QMCarteraDOC_TIPO.AsString, DBESerie.Text, StrToIntDef(DBENumero.Text, 0));
     if (DMCartera.QMCarteraSIGNO.AsString = 'C') then
        FMain.TraspasoDeDocumentosSalida(DMCartera.QMCarteraID_DOC.AsInteger)
     else
        FMain.TraspasoDeDocumentosEntrada(DMCartera.QMCarteraID_DOC.AsInteger);
  end;
end;

procedure TFMCartera.DBEMonedaChange(Sender: TObject);
begin
  DMCartera.MascarasMoneda;
end;

procedure TFMCartera.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if button = nbPost then
     NavDetalle.SetFocus;
end;

procedure TFMCartera.AAsientoPagoExecute(Sender: TObject);
var
  RIC, Pagado, Ejercicio : integer;
begin
  DMCartera.DameDatosReciboPagado(RIC, Pagado, Ejercicio);
  if ((Pagado = 1) and (RIC <> 0)) then
     FMain.MuestraMovConta(' RIC= ' + IntToStr(RIC) + ' AND EJERCICIO=' + IntToStr(Ejercicio));
end;

procedure TFMCartera.AAsientoRecibidoExecute(Sender: TObject);
var
  RIC, Recibido, Ejercicio : integer;
begin
  DMCartera.DameDatosReciboRecibido(RIC, Recibido, Ejercicio);
  if ((Recibido = 1) and (RIC <> 0)) then
     FMain.MuestraMovConta(' RIC= ' + IntToStr(RIC) + ' AND EJERCICIO=' + IntToStr(Ejercicio));
end;

procedure TFMCartera.DBEFCuentaExit(Sender: TObject);
begin
  inherited;
  DBEFCuenta.Text := ExpandirCadena(DBEFCuenta.Text, REntorno.DigitosSub);
end;

procedure TFMCartera.DBEFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) then
     DBEFCuenta.Text := ExpandirCadena(DBEFCuenta.Text, REntorno.DigitosSub);
end;

procedure TFMCartera.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and
     (DBGFDetalle.SelectedField.FieldName = 'CTA_PAGO') then
     DMCartera.QMCarteraDetalleCTA_PAGO.AsString :=
        ExpandirCadena(DMCartera.QMCarteraDetalleCTA_PAGO.AsString, REntorno.DigitosSub);
end;

procedure TFMCartera.ALstTesoreriaExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregTesoreria, FPregTesoreria, Sender);
end;

procedure TFMCartera.ALstPrevisionPagosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregPrevisionPago, FPregPrevisionPago, Sender);
end;

procedure TFMCartera.ALstPrevisionCobrosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregPrevisionCobro, FPregPrevisionCobro, Sender);
end;

procedure TFMCartera.ALstPrevisionCuentasExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregPrevisionCuentas, FPregPrevisionCuentas, Sender);
end;

procedure TFMCartera.ALstRecibosAgrupacionExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregAgrupaciones, FPregAgrupaciones, Sender);
end;

procedure TFMCartera.AConfRecibosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCartera, DMLstCartera);
  TFMListConfig.Create(Self).Muestra(28, formato, cabecera, copias,
     pijama, '', DMLstCartera.frRecibos);
  CierraData(DMLstCartera);
end;

procedure TFMCartera.AConfRecibosAgenteExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCartera, DMLstCartera);
  TFMListConfig.Create(Self).Muestra(33, formato, cabecera, copias,
     pijama, '', DMLstCartera.frRecibos);
  CierraData(DMLstCartera);
end;

procedure TFMCartera.AConfTesoreriaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRTesoreria, DMRTesoreria);
  TFMListConfig.Create(Self).Muestra(29, formato, cabecera, copias,
     pijama, '', DMRTesoreria.frHYTesoreria);
  CierraData(DMRTesoreria);
end;

procedure TFMCartera.AConfPrevPagosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRPrevisionPago, DMRPrevisionPago);
  TFMListConfig.Create(Self).Muestra(30, formato, cabecera, copias,
     pijama, '', DMRPrevisionPago.frHYPrevisionPago);
  CierraData(DMRPrevisionPago);
end;

procedure TFMCartera.AConfPagosCodigoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRPrevisionPago, DMRPrevisionPago);
  TFMListConfig.Create(Self).Muestra(83, formato, cabecera, copias,
     pijama, '', DMRPrevisionPago.frHYPrevisionPago);
  CierraData(DMRPrevisionPago);
end;

procedure TFMCartera.AConfPrevCobrosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRPrevisionCobro, DMRPrevisionCobro);
  TFMListConfig.Create(Self).Muestra(31, formato, cabecera, copias,
     pijama, '', DMRPrevisionCobro.frHYPrevisionCobro);
  CierraData(DMRPrevisionCobro);
end;

procedure TFMCartera.AConfCobrosCodigoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRPrevisionPago, DMRPrevisionPago);
  TFMListConfig.Create(Self).Muestra(84, formato, cabecera, copias,
     pijama, '', DMRPrevisionPago.frHYPrevisionPago);
  CierraData(DMRPrevisionPago);
end;

procedure TFMCartera.AConfRecibosAgrupacionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAgrupaciones, DMLstAgrupaciones);
  TFMListConfig.Create(Self).Muestra(57, formato, cabecera, copias,
     pijama, '', DMLstAgrupaciones.frCarteraAgrupacion);
  CierraData(DMLstAgrupaciones);
end;

procedure TFMCartera.AConfRecibosCarteraExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
  TFMListConfig.Create(Self).Muestra(1, formato, cabecera, copias, pijama, '',
     DMLstCarteraRecibos.frRecibos, DMLstCarteraRecibos.HYRRecibos);
  CierraData(DMLstCarteraRecibos);
end;

procedure TFMCartera.ALstCarteraExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregCartera, FPregCartera, Sender);
end;

procedure TFMCartera.ARecibosFacturasExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecibosFactura, FMRecibosFactura);
end;

procedure TFMCartera.ADesagrupaRecibosExecute(Sender: TObject);
begin
  inherited;
  DMCartera.DesagrupaRecibos;
end;

procedure TFMCartera.AControlIVAExecute(Sender: TObject);
begin
  inherited;
  DMCartera.ProcesaIVA;
end;

procedure TFMCartera.ABuscarxImporteExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMBuscaRecxImp, FMBuscaRecxImp, Sender);
  FMBuscaRecxImp.SetSigno(DameSigno(CBSigno.ItemIndex));
end;

procedure TFMCartera.ALstCobrosVencidosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregCobrosVencidos, FPregCobrosVencidos, Sender);
end;

procedure TFMCartera.TBDatosReciboKriClick(Sender: TObject);
begin
  inherited;
  DMCartera.DatosRegistro;
end;

procedure TFMCartera.AReciboAgrupaKriExecute(Sender: TObject);
begin
  inherited;
  DMCartera.FiltraReciboQueAgrupa;

  // Si el recibo que agrupa a este es de otro signo,
  // modifico el signo en la cabecera evitando que ejecute parte del proceso que inicializa el SQL
  if ((CBSigno.ItemIndex = 0) and (DMCartera.QMCarteraSIGNO.AsString = 'P')) then
     CambiaSignoSinFiltrar('P');

  if ((CBSigno.ItemIndex = 1) and (DMCartera.QMCarteraSIGNO.AsString = 'C')) then
     CambiaSignoSinFiltrar('C');
end;

procedure TFMCartera.DBEFCuentaChange(Sender: TObject);
begin
  inherited;
  ETitCuenta.Text := DameTituloCuenta(DBEFCuenta.Text);
end;

procedure TFMCartera.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  EFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

procedure TFMCartera.FiltraRegistro(Signo: char; ListaId: string);
begin
  /// Filtra los registros que pertenezcan a esta empresa dentro de la lista de ID_CARTERA
  /// ListaId es un string que contiene numeros correspondientes a ID_CARTERA separados por coma
  if (Signo = 'C') then
     CambiaSignoSinFiltrar('C')
  else
     CambiaSignoSinFiltrar('P');

  DMCartera.FiltraCartera(Signo, ListaId);
end;

procedure TFMCartera.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMCartera.DBERegistroChange(Sender: TObject);
begin
  inherited;
  LPerteneceAgrupacion.Visible := DMCartera.PerteneceAgrupacion;
end;

procedure TFMCartera.ARegistroIVAExecute(Sender: TObject);
begin
  inherited;
  if (DMCartera.QMCarteraREG_IVA.AsInteger <> 0) then
     FMain.MuestraIVA('EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + IntToStr(DMCartera.QMCarteraEJERCICIO.AsInteger) + ' AND CANAL=' + IntToStr(DMCartera.QMCarteraCANAL.AsInteger) + ' AND REGISTRO=' + IntToStr(DMCartera.QMCarteraRIVA.AsInteger), 'R');
end;

procedure TFMCartera.SBVerRegistroDblClick(Sender: TObject);
begin
  inherited;
  ARegistroIVA.Execute;
end;

procedure TFMCartera.SBVerAsientosDblClick(Sender: TObject);
begin
  inherited;
  AAsientoFactura.Execute;
end;

procedure TFMCartera.AAsientoFacturaExecute(Sender: TObject);
begin
  inherited;
  if (DMCartera.QMCarteraASIENTO.AsInteger <> 0) then
     FMain.MuestraMovConta(' RIC= ' + DMCartera.QMCarteraRIC.AsString +
        ' AND EJERCICIO=' + IntToStr(DMCartera.QMCarteraEJERCICIO.AsInteger));
end;

function TFMCartera.DameSigno(n: smallint): string;
begin
  Result := 'C';
  if (n = 1) then
     Result := 'P';
end;

procedure TFMCartera.SBAContaExtractoDblClick(Sender: TObject);
begin
  inherited;
  AContaExtracto.Execute;
end;

procedure TFMCartera.AContaExtractoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AContaExtracto, DBEFCuenta.Text);
end;

procedure TFMCartera.G2KTableLocClick(Sender: TObject);
begin
  inherited;
  if CBSigno.ItemIndex = 0 then
     G2kTableLoc.CondicionBusqueda := 'SIGNO=''C'''
  else
     G2kTableLoc.CondicionBusqueda := 'SIGNO=''P''';
end;

procedure TFMCartera.CambiaSignoSinFiltrar(Signo: char);
begin
  InicializaSigno := False;
  try
     if (Signo = 'C') then
        CBSigno.ItemIndex := 0
     else
        CBSigno.ItemIndex := 1;

     CBSignoChange(Self);
  finally
     InicializaSigno := True;
  end;
end;

procedure TFMCartera.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  // CARRECI001 - Campo RECIBIDO en cartera invisible (S/N) - Rep. Dominicana no trabaja con esto y puede generar errores.
  if (LeeParametro('CARRECI001') = 'S') then
  begin
     i := EncuentraField(DBGFDetalle, 'RECIBIDO');
     if (i >= 0) then
        DBGFDetalle.Columns.Items[i].Visible := False;
  end;
end;

end.
