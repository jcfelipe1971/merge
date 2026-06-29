unit UFMRemesas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, UHYDBGrid, UFormGest,
  Buttons, NsDBGrid, rxToolEdit, RXDBCtrl, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFPageControl, ULFToolBar, ULFPanel, UFPedit, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, TFlatCheckBoxUnit, ULFCheckBox,
  ULFComboBox, ULFLabel, ULFDBDateEdit, UG2kTBLoc, UFPEditDetalle;

type
  TFMRemesas = class(TFPEditDetalle)
     PMNorma19: TPopupMenu;
     MINorma19: TMenuItem;
     PMNorma32_58: TPopupMenu;
     MINorma32: TMenuItem;
     MINorma58: TMenuItem;
     TButtSep2: TToolButton;
     TButtMostrarDisponibles: TToolButton;
     TButtSeleccionarTodas: TToolButton;
     TButtSep5: TToolButton;
     TButtCerrarRemesa: TToolButton;
     TButtSep4: TToolButton;
     TButtAbono: TToolButton;
     TButtSep6: TToolButton;
     TButtGeneraRemesa: TToolButton;
     TButtSep3: TToolButton;
     TButtImpagoRecibo: TToolButton;
     TButtSep8: TToolButton;
     TButtPagaGastos: TToolButton;
     EPDetalle: THYMEditPanel;
     ButtImprimirUnRecibo: TToolButton;
     TButtDesvenceRecibo: TToolButton;
     MINorma19_2: TMenuItem;
     LRemesa: TLFLabel;
     LBanco: TLFLabel;
     LFecha: TLFLabel;
     LRiesgo: TLFLabel;
     LImporte: TLFLabel;
     CBTipoRemesa: TLFComboBox;
     DBERemesa: TLFDbedit;
     DBEFBanco: TLFDBEditFind2000;
     DBETituloBanco: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     DBERiesgo: TLFDbedit;
     DBEImporte: TLFDbedit;
     DBETituloRemesa: TLFDbedit;
     DBCHKTipoRemesa: TLFDBCheckBox;
     LBLTipo_asiento: TLFLabel;
     DBEFTipo_asiento: TLFDBEditFind2000;
     TCDetalle: TTabControl;
     ALstInformeRemesa: TAction;
     ALstRecibosRemesa: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfInformeRemesa: TAction;
     AConfRecibosRemesa: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AVenceRemesa: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ToolButton1: TToolButton;
     TButtonIrContabilidad: TToolButton;
     PMIrApunte: TPopupMenu;
     MIIrCierreRemesa: TMenuItem;
     MIIrAbonoRemesa: TMenuItem;
     MIIrVencimientoRemesa: TMenuItem;
     LTipo: TLFLabel;
     PMPagoImpago: TPopupMenu;
     MIGenerarImpagoRecibo: TMenuItem;
     MIDeshacerImpagoRecibo: TMenuItem;
     PMAbonarDesabonar: TPopupMenu;
     MIAbonarRemesa: TMenuItem;
     MIAbonarTodo: TMenuItem;
     MIDesabonarRemesa: TMenuItem;
     MIDesabonaAbono: TMenuItem;
     PMPagaImpagoDespagaImpago: TPopupMenu;
     MIPagaGastosImpagado: TMenuItem;
     MIDeshacePagoImpagado: TMenuItem;
     ToolButton3: TToolButton;
     LBCuentaCorriente: TLFLabel;
     DBECuentaBancariaTercero: TLFDbedit;
     DBESucursal: TLFDbedit;
     DBEControl: TLFDbedit;
     DBECuenta: TLFDbedit;
     ASep: TAction;
     GBEstado: TGroupBox;
     DBCHKCerrada: TLFDBCheckBox;
     DBCHKAbono: TLFDBCheckBox;
     DBCHKVencida: TLFDBCheckBox;
     AVenceReciboActual: TAction;
     AVenceRemesaActual: TAction;
     MISEPA_Vista: TMenuItem;
     MISEPA_Descuento: TMenuItem;
     PNLInfoSEPA: TLFPanel;
     LIBAN: TLFLabel;
     DBEIBAN: TLFDbedit;
     LFLabel1: TLFLabel;
     DBEBIC: TLFDbedit;
     LTipoAdeudo: TLFLabel;
     DBETipoAdeudo: TLFDbedit;
     LTipoContrato: TLFLabel;
     DBETipoContrato: TLFDbedit;
     LMandato: TLFLabel;
     DBEMandato: TLFDbedit;
     ABanco: TAction;
     SBABanco: TSpeedButton;
     DBEBanco: TLFDbedit;
     DBDEFechaVencimiento: TLFDBDateEdit;
     DBCBFuerzaVencimiento: TLFDBCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure TButtMostrarDisponiblesClick(Sender: TObject);
     procedure TButtSeleccionarTodasClick(Sender: TObject);
     procedure TButtDeseleccionarTodasClick(Sender: TObject);
     procedure TButtCerrarRemesaClick(Sender: TObject);
     procedure TButtAbrirRemesaClick(Sender: TObject);
     procedure TButtDesAbonarClick(Sender: TObject);
     procedure TButtAnulaPagoImpagadoClick(Sender: TObject);
     procedure TButtImpagoReciboClick(Sender: TObject);
     procedure TButtDesImpagoReciboClick(Sender: TObject);
     procedure TButtGeneraRemesaClick(Sender: TObject);
     procedure DBGMainDblClick(Sender: TObject);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure CBTipoRemesaChange(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure MINorma32Click(Sender: TObject);
     procedure MINorma19Click(Sender: TObject);
     procedure MINorma58Click(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ButtImprimirUnReciboClick(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TButtDesvenceReciboClick(Sender: TObject);
     procedure MINorma19_2Click(Sender: TObject);
     procedure TCDetalleChange(Sender: TObject);
     procedure TButtDesAbonarAbonoClick(Sender: TObject);
     procedure ALstInformeRemesaExecute(Sender: TObject);
     procedure ALstRecibosRemesaExecute(Sender: TObject);
     procedure AConfInformeRemesaExecute(Sender: TObject);
     procedure AConfRecibosRemesaExecute(Sender: TObject);
     procedure AVenceRemesaExecute(Sender: TObject);
     procedure MIIrCierreRemesaClick(Sender: TObject);
     procedure MIIrAbonoRemesaClick(Sender: TObject);
     procedure MIIrVencimientoRemesaClick(Sender: TObject);
     procedure MIPagaGastosImpagadoClick(Sender: TObject);
     procedure MIDeshacePagoImpagadoClick(Sender: TObject);
     procedure MIDeshacerImpagoReciboClick(Sender: TObject);
     procedure MIAbonarRemesaClick(Sender: TObject);
     procedure MIAbonarTodoClick(Sender: TObject);
     procedure MIDesabonarRemesaClick(Sender: TObject);
     procedure MIDesabonaAbonoClick(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AVenceReciboActualExecute(Sender: TObject);
     procedure AVenceRemesaActualExecute(Sender: TObject);
     procedure DBECuentaChange(Sender: TObject);
     procedure DBEControlChange(Sender: TObject);
     procedure DBESucursalChange(Sender: TObject);
     procedure DBECuentaBancariaTerceroChange(Sender: TObject);
     procedure MISEPA_VistaClick(Sender: TObject);
     procedure MISEPA_DescuentoClick(Sender: TObject);
     procedure DBEIBANChange(Sender: TObject);
     procedure DBETipoAdeudoChange(Sender: TObject);
     procedure DBETipoContratoChange(Sender: TObject);
     procedure DBEMandatoChange(Sender: TObject);
     procedure ABancoExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEBancoChange(Sender: TObject);
     procedure DBCBFuerzaVencimientoChange(Sender: TObject);
     procedure DBERemesaChange(Sender: TObject);
     procedure DBCHKCerradaChange(Sender: TObject);
     procedure DBEFBancoChange(Sender: TObject);
     procedure DBEFBancoExit(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure AbreOCierra;
     procedure CambiarNorma;
     procedure RefrescaDetalle;
     procedure ResaltaBanco;
  public
     { Public declarations }
     procedure AjustaCheckRemesa(campo: string; remesa: integer);
     procedure AjustarDetalle;
     procedure GastosDelAbono;
     procedure FiltraPorRIC(ric: integer);
  end;

var
  FMRemesas : TFMRemesas;

implementation

uses UDMRemesas, UDMMain, UUtiles, UFMRemesasAbono, UFMRemesasVence,
  UFMRemesasImpagado, UFMRemesasPagoGastos, UDMRRemesasBanco, UFMListConfig,
  UFPregCodCSB, UFPregDatosCSB32, UFPregDatosCSB58, UFPregFechasClientes,
  UDMLstCarteraRecibos, UFMFechaVenceRecibos, UEntorno, UFMain,
  UFMRecibosAgrupados, UFMAgrupacionesRecibos;

{$R *.DFM}

procedure TFMRemesas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRemesas, DMRemesas);

  //Se asigna el PopUp del principal
  Self.PopupMenu := CEMainPMEdit;
  ControlEdit := CEMain;
  REntorno.Asiento_REM := 'REM'; {dji lrk kri diarios}

  // DataSource
  NavMain.DataSource := DMRemesas.DSQMRemesas;
  DBGMain.DataSource := DMRemesas.DSQMRemesas;
  G2kTableLoc.DataSource := DMRemesas.DSQMRemesas;
  NavDetalle.DataSource := DMRemesas.DSQMDetalle;
  DBGFDetalle.DataSource := DMRemesas.DSQMDetalle;

  // Tipo Remesas por defecto
  CBTipoRemesa.ItemIndex := 0;

  // Lanzo el evento de Cambio de Tipo
  CBTipoRemesaChange(Sender);
  AbreOCierra;
  RefrescaDetalle;

  if (DMMain.EstadoKri(213) <> 1) then
     DBGFDetalle.FindColumn('AGRUP_COD_CLI_PRO_KRI').Visible := False;
  ColActual := DBGFDetalle.Columns[0];

  DBETituloBanco.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBABanco, DBETituloBanco);
end;

procedure TFMRemesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMRemesas.GrabaCabecera;
  DMRemesas.GrabaDetalle;
  CierraData(DMRemesas);
end;

procedure TFMRemesas.AjustaCheckRemesa(Campo: string; Remesa: integer);
begin
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf(UpperCase(Campo))] := IntToStr(Remesa);
end;

procedure TFMRemesas.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  DMRemesas.GrabaCabecera;
  DMRemesas.BusquedaComplejaDetalle;
end;

procedure TFMRemesas.TButtMostrarDisponiblesClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  // Depende del estado de combo
  if CBTipoRemesa.ItemIndex = 0 then
     DMRemesas.MostrarRecibosDisponibles
  else
     DMRemesas.MostrarPagaresDisponibles;
end;

procedure TFMRemesas.TButtSeleccionarTodasClick(Sender: TObject);
begin
  with TButtSeleccionarTodas do
  begin
     if (Tag = 0) then
     begin
        DMRemesas.SeleccionarRecibosDetalle;
        Tag := 1;
        ImageIndex := 147;
        Hint := _('Deseleccionar todos los recibos');
     end
     else
     begin
        DMRemesas.GrabaCabecera;
        DMRemesas.DeseleccionarRecibosDetalle;
        Tag := 0;
        ImageIndex := 146;
        Hint := _('Seleccionar todos los recibos');
     end;
  end;
end;

procedure TFMRemesas.TButtDeseleccionarTodasClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  DMRemesas.DeseleccionarRecibosDetalle;
end;

procedure TFMRemesas.TButtCerrarRemesaClick(Sender: TObject);
var
  c : integer;
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        if (TButtCerrarRemesa.Tag = 0) then
        begin
           DMRemesas.CierraRemesa;
           c := EncuentraField(DBGFDetalle, 'ABONO');
           if (c >= 0) then
              DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ABONO');
        end
        else
        begin
           DMRemesas.AbreRemesa;
           c := EncuentraField(DBGFDetalle, 'REMESA');
           if (c >= 0) then
              DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'REMESA');
        end;
     finally
        Screen.Cursor := crDefault;
        AbreOCierra;
        RefrescaDetalle;
        NavDetalle.SetFocus;
     end;
end;

procedure TFMRemesas.TButtAbrirRemesaClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
  begin
     DMRemesas.AbreRemesa;
     AjustarDetalle;
  end;
end;

procedure TFMRemesas.TButtDesAbonarClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesAbonaRemesa;
end;

procedure TFMRemesas.TButtAnulaPagoImpagadoClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesPagaImpagado;
end;

procedure TFMRemesas.TButtImpagoReciboClick(Sender: TObject);
var
  Fecha : TDateTime;
  Gastos : double;
  GastosIVA : double;
  GastosSinIVA : double;
  d1, d2, d3, d4, d5 : string;
  TituloVentana : string;
  GastosEmpresa : boolean;
begin
  if (DMRemesas.QMDetalleIMPAGADO.AsInteger = 1) then
     MessageDlg(_('El recibo ya ha sido impagado'), mtError, [mbOK], 0)
  else
  if not (DMRemesas.ReciboDescontado) then
     MessageDlg(_('El recibo no ha vencido (no ha sido descontado)'), mtError, [mbOK], 0)
  else
  begin
     DMRemesas.GrabaCabecera;
     // if ((DBCHKCerrada.Checked)and(DBCHKAbono.Checked)) then
     if ((not DBCHKTipoRemesa.Checked) and (DBCHKCerrada.Checked) and (DBCHKAbono.Checked)) or
        ((DBCHKTipoRemesa.Checked) and (DBCHKCerrada.Checked) and
        (DMRemesas.QMDetalleABONO.AsInteger > 0)) then
     begin
        with TFMRemesasImpagado.Create(Self) do
        begin
           Gastos := 0;
           GastosIVA := 0;
           GastosSinIVA := 0;
           TituloVentana := Format(_('Impago Recibo %d/%d.%d'), [DMRemesas.QMDetalleEJERCICIO.AsInteger, DMRemesas.QMDetalleREGISTRO.AsInteger, DMRemesas.QMDetalleLINEA.AsInteger]);
           if ElegirImpagadoRemesa(Fecha, Gastos, GastosIVA, GastosSinIVA, d1, d2, d3, d4, d5, GastosEmpresa, TituloVentana) then
              DMRemesas.GeneraImpagado(Fecha, Gastos, GastosIVA, GastosSinIVA, d1, d2, d3, d4, d5, GastosEmpresa);
           Free;
        end;
     end;
  end;
end;

procedure TFMRemesas.TButtDesImpagoReciboClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesGeneraImpagado;
end;

{procedure TFMRemesas.EPMainClickReport(Sender: TObject;
  var Continua: Boolean);
begin
  //Se imprime la remesa
  DMRemesas.ImprimeRemesa(False);

  Continua:=False;
end;}

procedure TFMRemesas.TButtGeneraRemesaClick(Sender: TObject);
begin
  MISEPA_Vista.Click;
end;

procedure TFMRemesas.DBGMainDblClick(Sender: TObject);
begin
  PCMain.ActivePage := TSFicha;
end;

procedure TFMRemesas.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     PCMain.ActivePage := TSFicha;
end;

procedure TFMRemesas.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMRemesas.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
end;

procedure TFMRemesas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
{var
  i: integer; No se utiliza}
begin
  CambiarNorma;
  if Button in [{nbFirst, nbPrior, nbNext, nbLast, }nbInsert, nbRefresh] then
     RefrescaDetalle;

  DMRemesas.GrabaDetalle;
  {dji lrk kri - Para que se quede la marca de 'origen impagado'
  for i := 0 to DBGFDetalle.Columns.Count - 1 do
    if (DBGFDetalle.Columns.Items[i].FieldName = 'ORIGEN_IMPAGADO') then
      DBGFDetalle.Columns.Items[i].Visible := true;}

  if Button in [nbPost, nbCancel, nbRefresh] then
     ResaltaBanco;
end;

procedure TFMRemesas.MINorma19Click(Sender: TObject);
var
  cod, aux : string;
  ref : smallint;
begin
  if (DBCHKCerrada.Checked) then
     with TFPregCodCSB.Create(Self) do
     begin
        DMRemesas.DameDatosCSB(cod, aux);
        if ElegirCodigo(cod, ref) then
           DMRemesas.Disco(cod, 1, ref);
     end
  else
     ShowMessage(_('No se puede generar el CSB de recibos no remesables ...'));
end;

procedure TFMRemesas.MINorma19_2Click(Sender: TObject);
var
  cod, aux : string;
  ref : smallint;
begin
  if (DBCHKCerrada.Checked) then
     with TFPregCodCSB.Create(Self) do
     begin
        DMRemesas.DameDatosCSB(cod, aux);
        if ElegirCodigo(cod, ref) then
           DMRemesas.Disco(cod, 2, ref);
     end
  else
     ShowMessage(_('No se puede generar el CSB de recibos no remesables ...'));
end;

procedure TFMRemesas.MINorma32Click(Sender: TObject);
var
  cod, idcedente, entrecep, sucrecep : string;
  truncados : boolean;
  ref, detalle : smallint;
begin
  if (DBCHKCerrada.Checked) then
  begin
     cod := '0001';
     idcedente := '00000';
     DMRemesas.DameSucursal(entrecep, sucrecep);
     with TFPregDatosCSB32.Create(Self) do
     begin
        if DatosCsB32(cod, idcedente, truncados, entrecep, sucrecep, ref, detalle) then
           DMRemesas.Disco32(cod, idcedente, truncados, entrecep, sucrecep, ref, detalle);
     end;
  end
  else
     ShowMessage(_('No se puede generar el CSB de recibos no remesables ...'));
end;

procedure TFMRemesas.MINorma58Click(Sender: TObject);
var
  cod, entrecep, sucrecep, alfanumero : string;
  ref, detalle : smallint;
begin
  if (DBCHKCerrada.Checked) then
  begin
     DMRemesas.DameSucursal(entrecep, sucrecep);
     DMRemesas.DameDatosCSB(cod, alfanumero);
     with TFPregDatosCSB58.Create(Self) do
     begin
        if DatosCsB58(cod, entrecep, sucrecep, alfanumero, ref, detalle) then
           DMRemesas.Disco58(cod, entrecep, sucrecep, alfanumero, ref, detalle);
     end;
  end
  else
     ShowMessage(_('No se puede generar el CSB de recibos no remesables ...'));
end;

procedure TFMRemesas.MISEPA_VistaClick(Sender: TObject);
var
  cod, entrecep, sucrecep, alfanumero : string;
  ref, detalle : smallint;
begin
  // Norma SEPA a la vista
  if (DBCHKCerrada.Checked) then
  begin
     DMRemesas.DameSucursal(entrecep, sucrecep);
     DMRemesas.DameDatosCSB(cod, alfanumero);
     ref := 0;
     detalle := 1;
     with TFPregDatosCSB58.Create(Self) do
     begin
        if DatosCsB58(cod, entrecep, sucrecep, alfanumero, ref, detalle) then
           DMRemesas.SEPA(cod, entrecep, sucrecep, alfanumero, ref, detalle);
     end;
  end
  else
     ShowMessage(_('No se puede generar el CSB de recibos si la remesa no está cerrada.'));
end;

procedure TFMRemesas.DBGFDetalleColEnter(Sender: TObject);
begin
  if (ControlEdit <> CEDetalle) then
     ControlEdit := CEDetalle;
end;

procedure TFMRemesas.ButtImprimirUnReciboClick(Sender: TObject);
begin
  if (DMRemesas.QMDetalle.RecordCount > 0) then
  begin
     AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
     DMLstCarteraRecibos.ImprimirUnRecibo(0, DMRemesas.QMDetalleSIGNO.AsString,
        DMRemesas.QMDetalleEJERCICIO_CARTERA.AsInteger,
        DMRemesas.QMDetalleREGISTRO.AsInteger,
        DMRemesas.QMDetalleLINEA.AsInteger);
     CierraData(DMLstCarteraRecibos);
  end
  else
     ShowMessage(_('No existen recibos en esta remesa'));
end;

procedure TFMRemesas.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  DMRemesas.GrabaCabecera;
end;

procedure TFMRemesas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMRemesas.BusquedaCompleja;
  Continua := False;
  AbreOCierra;
  RefrescaDetalle;
end;

procedure TFMRemesas.TButtDesvenceReciboClick(Sender: TObject);
begin
  DMRemesas.DesVenceRecibo;
end;

procedure TFMRemesas.AjustarDetalle;
begin
  if (DMRemesas.QMRemesasTIPO_REMESA.AsInteger = 0) then
  begin
     // Al descuento
     with DBGFDetalle.ColumnasCheckBoxes do
        if IndexOf('ABONO') = -1 then
           Append('ABONO');

     DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].Visible := True;

     if (DMRemesas.QMRemesasCERRADA.AsInteger = 0) then
     begin
        DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index].ReadOnly := False;
        DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].ReadOnly := True;

        if TCDetalle.Tabs.Count > 0 then
           TCDetalle.Tabs.Clear;
     end;

     if (DMRemesas.QMRemesasCERRADA.AsInteger = 1) then
     begin
        if (DMRemesas.QMRemesasABONADA.AsInteger = 0) then
        begin
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index].ReadOnly := True;
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].ReadOnly := False;
        end
        else
        begin
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index].ReadOnly := True;
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].ReadOnly := True;
        end;

        if (TCDetalle.Tabs.Count = 0) then
        begin
           TCDetalle.Tabs.Append(_('Por abonar'));
           TCDetalle.Tabs.Append(_('Abonados'));
        end;
     end;
  end
  else
  begin
     // Para remesas a la vista
     with DBGFDetalle.ColumnasCheckBoxes do
        if IndexOf('ABONO') = -1 then
           Append('ABONO');

     DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].Visible := True;

     if (DMRemesas.QMRemesasCERRADA.AsInteger = 0) then
     begin
        DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index].ReadOnly := False;
        DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].ReadOnly := True;

        if TCDetalle.Tabs.Count > 0 then
           TCDetalle.Tabs.Clear;
     end;

     if (DMRemesas.QMRemesasCERRADA.AsInteger = 1) then
     begin
        if (DMRemesas.QMRemesasABONADA.AsInteger = 0) then
        begin
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index].ReadOnly := True;
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].ReadOnly := False;
        end
        else
        begin
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index].ReadOnly := True;
           DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index].ReadOnly := True;
        end;

        if (TCDetalle.Tabs.Count = 0) then
        begin
           TCDetalle.Tabs.Append(_('Por abonar'));
           TCDetalle.Tabs.Append(_('Abonados'));
        end;
     end;
  end;

  // Color segun ReadOnly 
  with DBGFDetalle.Columns[DBGFDetalle.FindColumn('REMESA').Index] do
  begin
     if (ReadOnly) then
        Color := clInfoBk
     else
        Color := clWhite;
  end;

  with DBGFDetalle.Columns[DBGFDetalle.FindColumn('ABONO').Index] do
  begin
     if (ReadOnly) then
        Color := clInfoBk
     else
        Color := clWhite;
  end;
end;

procedure TFMRemesas.TCDetalleChange(Sender: TObject);
begin
  if TCDetalle.TabIndex = 1 then
  begin
     if DBGFDetalle.ColumnasCheckBoxes.IndexOf('ABONO') > 1 then
        DBGFDetalle.ColumnasCheckBoxes.Delete(DBGFDetalle.ColumnasCheckBoxes.IndexOf('ABONO'));
     DMRemesas.MuestraAbonados;
  end
  else
  begin
     if DBGFDetalle.ColumnasCheckBoxes.IndexOf('ABONO') = -1 then
        DBGFDetalle.ColumnasCheckBoxes.Append('ABONO');
     if DMRemesas.Abono > 0 then
        AjustaCheckRemesa('ABONO', DMRemesas.Abono);
     DMRemesas.MuestraPorAbonar;
  end;
end;

procedure TFMRemesas.TButtDesAbonarAbonoClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesAbonaAbono;
end;

procedure TFMRemesas.ALstInformeRemesaExecute(Sender: TObject);
begin
  inherited;
  if (DBCHKCerrada.Checked) then
  begin
     AbreData(TDMRRemesasBanco, DMRRemesasBanco);
     DMRRemesasBanco.MostrarListado(DMRemesas.QMRemesasREMESA.Value,
        DMRemesas.QMRemesasID_REMESAS.AsInteger, DMRemesas.QMRemesasSIGNO.Value,
        DMRemesas.QMDetalle.OrdenadoPor);
     CierraData(DMRRemesasBanco);
  end
  else
     ShowMessage(_('No se puede listar una remesa abierta'));
end;

procedure TFMRemesas.ALstRecibosRemesaExecute(Sender: TObject);
begin
  inherited;
  //Se imprime la remesa
  AbreData(TDMRRemesasBanco, DMRRemesasBanco);
  TFPregFechasClientes.Create(Self).Mostrar(DMRemesas.DameRemesa);
  CierraData(DMRRemesasBanco);
end;

procedure TFMRemesas.AConfInformeRemesaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRRemesasBanco, DMRRemesasBanco);
  TFMListConfig.Create(Self).Muestra(27, formato, cabecera, copias,
     pijama, '', DMRRemesasBanco.frRemesas, DMRRemesasBanco.HYRRemesas);
  CierraData(DMRRemesasBanco);
end;

procedure TFMRemesas.AConfRecibosRemesaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMRRemesasBanco, DMRRemesasBanco);
  TFMListConfig.Create(Self).Muestra(1, formato, cabecera, copias, pijama, '',
     DMRRemesasBanco.frRemesas);
  CierraData(DMRRemesasBanco);
end;

procedure TFMRemesas.AVenceRemesaExecute(Sender: TObject);
var
  FechaValor : TDateTime;
  Forzar : boolean;
begin
  inherited;
  // FechaValor := TFMFechaVenceRecibos.Create(Self).DevuelveFechaValor(1);
  Forzar := False;
  FechaValor := DevuelveFechaValor(1, Self, Forzar, False);
  if (FechaValor <> 0) then
     DMRemesas.VenceRemesas(FechaValor, Forzar);
end;

procedure TFMRemesas.AVenceRemesaActualExecute(Sender: TObject);
var
  FechaValor : TDateTime;
  Forzar : boolean;
begin
  Forzar := False;
  FechaValor := DevuelveFechaValor(1, Self, Forzar);

  if (FechaValor <> 0) then
     DMRemesas.VenceRemesaActual(FechaValor, Forzar);
end;

procedure TFMRemesas.AVenceReciboActualExecute(Sender: TObject);
var
  FechaValor : TDateTime;
  Forzar : boolean;
begin
  Forzar := False;
  FechaValor := DevuelveFechaValor(1, Self, Forzar);

  if (FechaValor <> 0) then
     DMRemesas.VenceReciboActual(FechaValor, Forzar);
end;

procedure TFMRemesas.MIIrCierreRemesaClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     FMain.MuestraMovConta(' RIC= ' + DMRemesas.QMRemesasRIC.AsString +
        ' and ejercicio=' + DMRemesas.QMRemesasEJERCICIO.AsString)
  else
     ShowMessage(_('La remesa no esta abonada'));
end;

procedure TFMRemesas.MIIrAbonoRemesaClick(Sender: TObject);
begin
  DMRemesas.CalculaRIC_ABONO;
end;

procedure TFMRemesas.MIIrVencimientoRemesaClick(Sender: TObject);
var
  RIC_VTO : integer;
begin
  RIC_VTO := DMRemesas.DameAsientoVto;
  if (RIC_VTO = 0) then
     ShowMessage(_('La remesa no ha vencido'))
  else
     FMain.MuestraMovConta(' RIC= ' + IntToStr(RIC_VTO) + ' and ejercicio=' +
        IntToStr(DMRemesas.EjercicioVto));
end;

procedure TFMRemesas.CBTipoRemesaChange(Sender: TObject);
begin
  // Para realizar impagados de pagarés
  {
  if (CBTipoRemesa.ItemIndex = 1) then
  begin
     TButtImpagoRecibo.Visible := False;
     TButtPagaGastos.Visible := False;
     TButtSep8.Visible := False;
  end
  else
  begin
     TButtImpagoRecibo.Visible := True;
     TButtPagaGastos.Visible := True;
     TButtSep8.Visible := True;
  end;
  }
  DMRemesas.FiltraMaestro(CBTipoRemesa.ItemIndex);
  AbreOCierra;
  RefrescaDetalle;
  ResaltaBanco;
end;

procedure TFMRemesas.MIPagaGastosImpagadoClick(Sender: TObject);
var
  fecha : TDateTime;
  d1, d2, d3, d4, d5 : string;
  TituloVentana : string;
begin
  DMRemesas.GrabaCabecera;
  with TFMRemesasPagoGastos.Create(Self) do
  begin
     TituloVentana := Format(_('Pago Gastos Impagado Recibo %d/%d.%d'), [DMRemesas.QMDetalleEJERCICIO.AsInteger, DMRemesas.QMDetalleREGISTRO.AsInteger, DMRemesas.QMDetalleLINEA.AsInteger]);
     if ElegirPagoRemesa(fecha, d1, d2, d3, d4, d5, TituloVentana) then
        DMRemesas.PagaImpago(fecha, d1, d2, d3, d4, d5);
  end;
end;

procedure TFMRemesas.MIDeshacePagoImpagadoClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesPagaImpagado;
end;

procedure TFMRemesas.MIDeshacerImpagoReciboClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesGeneraImpagado;
end;

procedure TFMRemesas.GastosDelAbono;
var
  Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA : double;
  FechaAbono, FechaGastos : TDateTime;
  d1, d2, d3, d4, d5 : string;
  TituloVentana : string;
begin
  DMRemesas.GrabaCabecera;
  if not DBCHKAbono.Checked then // si no esta abonada
  begin
     TituloVentana := Format(_('Abono Remesa %d'), [DMRemesas.QMRemesasREMESA.AsInteger]);
     Gastos := 0;
     GastosIva := 0;
     GastosSinIva := 0;
     GastosDto := 0;
     ImporteCA := 0;
     if DBCHKTipoRemesa.Checked then // si es a la vista
     begin
        with TFMRemesasAbona.Create(Self) do // Está en la unidad UFMRemesasVence
        begin
           if ObtenerGastosAbono(Gastos, GastosIva, GastosSinIva, FechaAbono, d1, d2, d3, d4, d5, TituloVentana) then
              DMRemesas.AbonaRemesa(Gastos, GastosIva, GastosSinIva, 0, 0, FechaAbono, FechaAbono, d1, d2, d3, d4, d5);
        end;
     end
     else // si es al descuento
     begin
        with TFMRemesasAbono.Create(Self) do // Está en la unidad UFMRemesasAbono
        begin
           if ObtenerGastosAbono(Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA, FechaAbono, FechaGastos, d1, d2, d3, d4, d5, TituloVentana) then
              DMRemesas.AbonaRemesa(Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA, FechaAbono, FechaGastos, d1, d2, d3, d4, d5);
        end;
     end;
  end;
end;

procedure TFMRemesas.MIAbonarRemesaClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if (DMRemesas.QMRemesasCERRADA.AsInteger <> 0) then
  begin
     if not (DMRemesas.HayAbonosMarcados) then
        raise Exception.Create(_('No hay ninguna linea marcada para abonar.'))
     else
        GastosDelAbono;
  end
  else
     raise Exception.Create(_('La Remesa no está cerrada. Imposible Abonar'));
end;

procedure TFMRemesas.MIAbonarTodoClick(Sender: TObject);
begin
  DMRemesas.QMRemesasBeforeScroll(DMRemesas.QMRemesas);
  DMRemesas.AbonaTodo;
  GastosDelAbono;
end;

procedure TFMRemesas.MIDesabonarRemesaClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesAbonaRemesa;
end;

procedure TFMRemesas.MIDesabonaAbonoClick(Sender: TObject);
begin
  DMRemesas.GrabaCabecera;
  if Confirma then
     DMRemesas.DesAbonaAbono;
end;

procedure TFMRemesas.AbreOCierra;
begin
  if (DMRemesas.RemesaAbiertaCerrada = 1) then // si remesa cerrada saca boton abrir
  begin
     TButtCerrarRemesa.Hint := _('Abre y desbloquea la remesa');
     TButtCerrarRemesa.ImageIndex := 67;
     TButtCerrarRemesa.Tag := 1;
     {dji lrk kri - Para que se quede la marca de 'origen impagado'
     for i := 0 to DBGFDetalle.Columns.Count - 1 do
        if (DBGFDetalle.Columns.Items[i].FieldName = 'ORIGEN_IMPAGADO') then
           DBGFDetalle.Columns.Items[i].Visible := true;}
  end;

  if (DMRemesas.RemesaAbiertaCerrada = 0) then // si remesa abierta saca boton cerrar
  begin
     TButtCerrarRemesa.Hint := _('Cierra y bloquea la remesa');
     TButtCerrarRemesa.ImageIndex := 68;
     TButtCerrarRemesa.Tag := 0;
     {dji lrk kri - Para que se quede la marca de 'origen impagado'
     for i := 0 to DBGFDetalle.Columns.Count - 1 do
        if (DBGFDetalle.Columns.Items[i].FieldName = 'ORIGEN_IMPAGADO') then
           DBGFDetalle.Columns.Items[i].Visible := true;}
  end;
end;

procedure TFMRemesas.RefrescaDetalle;
begin
  AjustarDetalle;

  // Control de tipo de norma a sacar
  CambiarNorma;
  TCDetalleChange(TCDetalle);
end;

procedure TFMRemesas.DBGMainCellClick(Column: TColumn);
begin
  CambiarNorma;
end;

procedure TFMRemesas.CambiarNorma;
begin
  if (DBCHKTipoRemesa.Checked) then
     TButtGeneraRemesa.DropdownMenu := PMNorma19
  else
     TButtGeneraRemesa.DropdownMenu := PMNorma32_58;
end;

procedure TFMRemesas.FiltraPorRIC(ric: integer);
begin
  DMRemesas.FiltraPorRIC(ric);
end;

procedure TFMRemesas.DBGFDetalleDblClick(Sender: TObject);
var
  signo : string;
  cSigno : char;
begin
  if (UpperCase(ColActual.FieldName) = 'DOC_NUMERO') then
  begin
     if (DMRemesas.QMDetalleSIGNO.AsString = 'C') then
        cSigno := 'C'
     else
        cSigno := 'P';
     FMain.MuestraCartera(DMRemesas.QMDetalleEJERCICIO_CARTERA.AsInteger, DMRemesas.QMDetalleCANAL.AsInteger, cSigno, DMRemesas.QMDetalleREGISTRO.AsInteger);
  end
  else
  begin
     if (DMRemesas.EsAgrupado) then
     begin
        signo := 'C';
        TFMRecibosAgrupados.Create(Self).mostrar(REntorno.Empresa, REntorno.Ejercicio,
           REntorno.Canal, DMRemesas.QMDetalleREGISTRO.AsInteger,
           DMRemesas.QMDetalleEJERCICIO.AsInteger, signo);
     end
     else
     begin
        if (DMRemesas.PerteneceAgrupacion) then
        begin
           signo := 'C';
           TFMAgrupacionesRecibos.Create(Self).mostrar(REntorno.Empresa, REntorno.Ejercicio,
              REntorno.Canal, DMRemesas.QMDetalleREGISTRO.AsInteger, signo, DMRemesas.QMDetalleEJERCICIO.AsInteger);
           FMAgrupacionesRecibos.Free;
        end
        else
           ShowMessage(_('Este recibo no está agrupado'));
     end;
  end;
end;

procedure TFMRemesas.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMRemesas.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (DMRemesas.QMDetalle.RecordCount > 0) then
     if (UpperCase(Column.FieldName) = 'DOC_NUMERO') then
        CeldaEnlace(DBGFDetalle, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'TIPO_EFECTO') or (UpperCase(Column.FieldName) = 'TITULO')) then
        begin
           if (DMRemesas.QMDetalleTIPO_EFECTO.AsString <> 'REC') then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMRemesas.DBECuentaChange(Sender: TObject);
begin
  if ((DBECuenta.Text = '') or (DBECuenta.Text = '0000000000')) then
     ColorError(DBECuenta)
  else
     ColorInfo(DBECuenta);
end;

procedure TFMRemesas.DBEControlChange(Sender: TObject);
begin
  if ((DBEControl.Text = '') or (DBEControl.Text = '00')) then
     ColorError(DBEControl)
  else
     ColorInfo(DBEControl);
end;

procedure TFMRemesas.DBESucursalChange(Sender: TObject);
begin
  if ((DBESucursal.Text = '') or (DBESucursal.Text = '0000')) then
     ColorError(DBESucursal)
  else
     ColorInfo(DBESucursal);
end;

procedure TFMRemesas.DBECuentaBancariaTerceroChange(Sender: TObject);
begin
  if ((DBECuentaBancariaTercero.Text = '') or (DBECuentaBancariaTercero.Text = '0000')) then
     ColorError(DBECuentaBancariaTercero)
  else
     ColorInfo(DBECuentaBancariaTercero);
end;

procedure TFMRemesas.MISEPA_DescuentoClick(Sender: TObject);
begin
  // Aparentemente es la misma norma que SEPA para recibos a la vista.
  MISEPA_VistaClick(Sender);
end;

procedure TFMRemesas.DBEIBANChange(Sender: TObject);
begin
  if ((Trim(DBEIBAN.Text) = '') or (not IBANValido(DBEIBAN.Text))) then
     ColorError(DBEIBAN)
  else
     ColorInfo(DBEIBAN);
end;

procedure TFMRemesas.DBETipoAdeudoChange(Sender: TObject);
begin
  if ((Trim(DBETipoAdeudo.Text) = '') or (Trim(DBETipoAdeudo.Text) = 'NONE')) then
     ColorError(DBETipoAdeudo)
  else
     ColorInfo(DBETipoAdeudo);
end;

procedure TFMRemesas.DBETipoContratoChange(Sender: TObject);
begin
  if ((Trim(DBETipoContrato.Text) = '') or (Trim(DBETipoContrato.Text) = 'NONE')) then
     ColorError(DBETipoContrato)
  else
     ColorInfo(DBETipoContrato);
end;

procedure TFMRemesas.DBEMandatoChange(Sender: TObject);
begin
  if (Trim(DBEMandato.Text) = '') then
     ColorError(DBEMandato)
  else
     ColorInfo(DBEMandato);
end;

procedure TFMRemesas.ABancoExecute(Sender: TObject);
begin
  inherited;
  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.ABancos,
     'BANCO = ' + IntToStr(DMRemesas.QMRemesasBANCO.AsInteger));
  {$ENDIF}
end;

procedure TFMRemesas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRemesas.Posicionando := True;
  try
     // Filtro Remesas de Cobro o de Pagares
     G2kTableLoc.CondicionBusqueda := 'TIPO_REMESA_PAG = ' + (IntToStr(CBTipoRemesa.ItemIndex));
     G2kTableLoc.Click;
  finally
     DMRemesas.Posicionando := False;
  end;

  // Refresco (lo que haría AfterScroll de QMRemesas)
  AjustarDetalle;
  AjustaCheckRemesa(DMRemesas.QMRemesasREMESA.FieldName, DMRemesas.QMRemesasREMESA.AsInteger);
  TCDetalleChange(DMRemesas);
end;

procedure TFMRemesas.DBEBancoChange(Sender: TObject);
begin
  inherited;
  if (DBEBanco.Text = '') then
     ColorError(DBEBanco)
  else
     ColorInfo(DBEBanco);
end;

procedure TFMRemesas.DBCBFuerzaVencimientoChange(Sender: TObject);
begin
  inherited;
  DBDEFechaVencimiento.Enabled := DBCBFuerzaVencimiento.Checked;
end;

procedure TFMRemesas.DBERemesaChange(Sender: TObject);
begin
  inherited;
  DBDEFechaVencimiento.Enabled := (DMRemesas.QMRemesasFUERZA_VENCIMIENTO.AsInteger = 0);
end;

procedure TFMRemesas.DBCHKCerradaChange(Sender: TObject);
begin
  inherited;
  AbreOCierra;
end;

procedure TFMRemesas.ResaltaBanco;
begin
  inherited;
  if (DMRemesas.xBancosACTIVO.AsInteger = 1) then
     ColorCampoEnlace(DBETituloBanco)
  else
     ColorError(DBETituloBanco);
end;

procedure TFMRemesas.DBEFBancoChange(Sender: TObject);
begin
  inherited;
  ResaltaBanco;
end;

procedure TFMRemesas.DBEFBancoExit(Sender: TObject);
begin
  inherited;
  ResaltaBanco;
end;

end.
