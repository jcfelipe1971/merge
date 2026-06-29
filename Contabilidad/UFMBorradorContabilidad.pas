unit UFMBorradorContabilidad;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UControlEdit, UHYDBGrid, Grids, DBGrids, UFIBDBEditfind,
  DBCtrls, StdCtrls, ComCtrls, UDBDateTimePicker, Mask,
  ExtCtrls, UEditPanel, UNavigator, ToolWin, ActnList, FIBEditFind, UTeclas,
  URecursos, Buttons, UComponentesBusquedaFiltrada, UFormGest, NsDBGrid,
  rxToolEdit, RXDBCtrl, ULFActionList, ULFDBEditFind2000, ULFDBCheckBox,
  ULFPageControl, ULFDBEdit, ULFToolBar, ULFPanel, ULFEditFind2000,
  ULFFormStorage, TFlatCheckBoxUnit, ULFCheckBox, ULFEdit,
  ULFLabel, HYFIBQuery, ULFDBDateEdit, rxPlacemnt, UFPEditDetalle,
  UG2kTBLoc;

type
  TFMBorradorContabilidad = class(TFPEditDetalle)
     ALBorrador: TLFActionList;
     ASesion: TAction;
     ANormal: TAction;
     LBLTituloAbono: TLFLabel;
     PNLTitulos: TLFPanel;
     DBETitCta_Abono: TLFDbedit;
     LBLRIB: TLFLabel;
     LBLTipo: TLFLabel;
     LBLCanal: TLFLabel;
     LBLMoneda: TLFLabel;
     DBERib: TLFDbedit;
     DBDTPApunte: TLFDBDateEdit;
     DBCHKBloqueado: TLFDBCheckBox;
     DBETitulo: TLFDbedit;
     DBEFTipoAsiento: TLFDBEditFind2000;
     DBETitTipo: TLFDbedit;
     DBEFCanal: TLFDBEditFind2000;
     DBETituloCanal: TLFDbedit;
     DBEFMoneda: TLFDBEditFind2000;
     DBETituloMoneda: TLFDbedit;
     PNLCambio: TLFPanel;
     LCambioFecha: TLFLabel;
     DBECambio: TLFDbedit;
     DBEFechaCambio: TLFDbedit;
     PNLSaldo: TLFPanel;
     LBLDebe: TLFLabel;
     LBLHaber: TLFLabel;
     LBLSaldo: TLFLabel;
     DBEDebe: TLFDbedit;
     DBEHaber: TLFDbedit;
     DBESaldo: TLFDbedit;
     TButtRefresca: TToolButton;
     TButtSesion: TToolButton;
     TButtMostrarBorrador: TToolButton;
     TButtSep5: TToolButton;
     PNLPlantilla: TLFPanel;
     LBLPlantilla: TLFLabel;
     EFPlantilla: TLFEditFind2000;
     DTPHora: TDBDateTimePicker;
     TButtVerApunteIVA: TToolButton;
     TBSeparator1: TToolButton;
     AVerApunteIva: TAction;
     AValidar: TAction;
     ATraspasa: TAction;
     ASep: TAction;
     AVerTerceroAsiento: TAction;
     ACuadrar: TAction;
     APasaAPlantilla: TAction;
     APasaDePlantilla: TAction;
     ARenumera: TAction;
     LBLTipoKri: TLFLabel;
     DBEFTipoAsientoKri: TLFDBEditFind2000;
     ACentroCoste: TAction;
     AContaExtracto: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     ACambiaTexto: TAction;
     LSaldoDebe: TLFLabel;
     LSaldoHaber: TLFLabel;
     DBESDebe: TLFDbedit;
     DBESHaber: TLFDbedit;
     ATraspasaFiltrados: TAction;
     ETitTipoKri: TLFEdit;
     LBLTituloCargo: TLFLabel;
     DBETitCta_Cargo: TLFDbedit;
     AValidarTodos: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AAdjuntosAsiento: TAction;
     TButtDuplicarLinea: TToolButton;
     ADuplicarLinea: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtRefrescaClick(Sender: TObject);
     procedure DBESaldoChange(Sender: TObject);
     procedure EFPlantillaExit(Sender: TObject);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ASesionExecute(Sender: TObject);
     procedure ANormalExecute(Sender: TObject);
     procedure EPAsientosClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFMonedaBusqueda(Sender: TObject);
     procedure AVerApunteIvaExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure HabilitaBotonesCabecera;
     procedure HabilitaBotonesDetalle;
     procedure DeshabilitaDetalle;
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure ACentroCosteExecute(Sender: TObject);
     procedure AValidarExecute(Sender: TObject);
     procedure ATraspasaExecute(Sender: TObject);
     procedure AVerTerceroAsientoExecute(Sender: TObject);
     procedure ACuadrarExecute(Sender: TObject);
     procedure APasaAPlantillaExecute(Sender: TObject);
     procedure APasaDePlantillaExecute(Sender: TObject);
     procedure ARenumeraExecute(Sender: TObject);
     procedure AContaExtractoExecute(Sender: TObject);
     procedure ACambiaTextoExecute(Sender: TObject);
     procedure DBEFTipoAsientoVerificacion(Sender: TObject);
     procedure ATraspasaFiltradosExecute(Sender: TObject);
     procedure DBEFTipoAsientoKriChange(Sender: TObject);
     procedure NavDetalleChangeState(Sender: TObject);
     procedure AValidarTodosExecute(Sender: TObject);
     procedure AAdjuntosAsientoExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure ADuplicarLineaExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     CerrarAlTraspasar: boolean;
     procedure Muestra(Rib: integer);
  end;

var
  FMBorradorContabilidad : TFMBorradorContabilidad;

implementation

uses UDMBorradorContabilidad, UEntorno, UDMMain, DB, UUtiles, UFMain,
  UFMTercerosIVA, UFMDatosTercerosIVA, UFMDatosBorradorFac, UFMPagaRecibosAgrBorrador,
  UFMInfoRecibosBorrador, UFCMayor, UFMAdjunto,
  ShellApi, URecibeFicheros, UDMAdjunto, UDameDato, UImagenes;

{$R *.DFM}

procedure TFMBorradorContabilidad.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMBorradorContabilidad, DMBorradorContabilidad);
  // DBLCBTipo.KeyValue := 'NOR';
  // DBLCBCanal.KeyValue := REntorno.Canal;

  // Conectamos el navegador y el grid con sus datasources
  NavMain.DataSource := DMBorradorContabilidad.DSQMAsientos;
  DBGMain.DataSource := DMBorradorContabilidad.DSQMAsientos;

  NavDetalle.DataSource := DMBorradorContabilidad.DSQMApuntes;
  DBGFDetalle.DataSource := DMBorradorContabilidad.DSQMApuntes;

  // Conectamos las teclas
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  {dji lrk kri - Para que se vea el saldo negativo en blanco sobre rojo}
  DBEDebe.Enabled := True;
  DBEHaber.Enabled := True;
  DBESaldo.Enabled := True;
  PNLSaldo.Enabled := False;
  CerrarAlTraspasar := False; {dji lrk kri - Punteo de asientos}

  // Color campo ID
  ColorCampoID(DBERib);
end;

procedure TFMBorradorContabilidad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMBorradorContabilidad);
end;

procedure TFMBorradorContabilidad.TButtRefrescaClick(Sender: TObject);
begin
  DMBorradorContabilidad.Refresca;
end;

procedure TFMBorradorContabilidad.DBESaldoChange(Sender: TObject);
begin
  if Assigned(DBESaldo.Field) then
  begin
     if DBESaldo.Field.AsFloat <> 0 then
        ColorError(DBESaldo)
     else
        ColorInfo(DBESaldo);
  end;
end;

procedure TFMBorradorContabilidad.EFPlantillaExit(Sender: TObject);
begin
  if (EFPlantilla.Text <> '') and Confirma then
     DMBorradorContabilidad.DePlantilla(StrToInt(EFPlantilla.Text));
end;

procedure TFMBorradorContabilidad.Muestra(Rib: integer);
begin
  DMBorradorContabilidad.DePlantilla(Rib);
  Show;
end;

procedure TFMBorradorContabilidad.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  if (DBGFDetalle.SelectedField.FieldName = 'CARGO') or
     (DBGFDetalle.SelectedField.FieldName = 'ABONO') then
  begin
     // Cuando se abandone la columna de cuenta (ya sea de cargo o abono) se
     // expandira la cuenta si esta tiene un punto
     DBGFDetalle.SelectedField.AsString :=
        ExpandirCadena(Trim(DBGFDetalle.SelectedField.AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMBorradorContabilidad.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  HabilitaBotonesCabecera; // Unica
  HabilitaBotonesDetalle;
  DMBorradorContabilidad.CambiaMascara;
end;

procedure TFMBorradorContabilidad.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
  if (DBGFDetalle.SelectedField.FieldName = 'CARGO') or
     (DBGFDetalle.SelectedField.FieldName = 'ABONO') then
     FMain.AddComponentePunto(DBGFDetalle)
  else
     FMain.DelComponentePunto(DBGFDetalle);
end;

procedure TFMBorradorContabilidad.ASesionExecute(Sender: TObject);
begin
  DMBorradorContabilidad.FiltraSesion;
end;

procedure TFMBorradorContabilidad.ANormalExecute(Sender: TObject);
begin
  DMBorradorContabilidad.DesFiltraSesion;
end;

procedure TFMBorradorContabilidad.EPAsientosClickRango(Sender: TObject; var Continua: boolean);
begin
  DMBorradorContabilidad.BusquedaCompleja;
end;

procedure TFMBorradorContabilidad.DBEFMonedaBusqueda(Sender: TObject);
begin
  DBEFMoneda.CondicionBusqueda := 'ACTIVO=1 AND ORIGEN=''' + REntorno.Moneda + '''';
end;

procedure TFMBorradorContabilidad.ACentroCosteExecute(Sender: TObject);
begin
  DMBorradorContabilidad.PedirCentroCoste;
end;

procedure TFMBorradorContabilidad.AVerApunteIvaExecute(Sender: TObject);
begin
  DMBorradorContabilidad.QMApuntes.Edit;
  FMTercerosIva := TFMTercerosIva.Create(Self);
  try
     FMTercerosIva.MostarParametrizado(0);
     DMBorradorContabilidad.ObtenerDatosIva(DMBorradorContabilidad.QMApuntesTIPO.AsString);
  finally
     FMTercerosIva.Free;
  end;
  DMBorradorContabilidad.QMApuntes.Post;
  HabilitaBotonesDetalle;
end;

procedure TFMBorradorContabilidad.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if Pos('SYS_TIPO_APUNTE', Trim(TablaABuscar)) > 0 then
     begin
        CondicionBusqueda := 'PAIS=''' + DMBorradorContabilidad.DamePaisEEC(DMBorradorContabilidad.QMAsientosEMPRESA.AsInteger, DMBorradorContabilidad.QMAsientosEJERCICIO.AsInteger, DMBorradorContabilidad.QMAsientosCANAL.AsInteger) + '''';
        if (DMBorradorContabilidad.xTipos.FieldByName('EXT').AsInteger = 0) then
           CondicionBusqueda := CondicionBusqueda + ' AND TIPO = -1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO_APUNTE';
     end
     else
     if Pos('EMP_PROYECTOS', Trim(TablaABuscar)) > 0 then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' and (CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROYECTO';
     end
     else
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + DMBorradorContabilidad.QMAsientosCANAL.AsString +
           ' AND PGC =' + IntToStr(DamePgc(DMBorradorContabilidad.QMAsientosEMPRESA.AsInteger, DMBorradorContabilidad.QMAsientosEJERCICIO.AsInteger, DMBorradorContabilidad.QMAsientosCANAL.AsInteger));
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end;
  end;
end;

procedure TFMBorradorContabilidad.DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
begin
  if (DBGFDetalle.SelectedField.FieldName = 'TIPO') then
     if Pos('IVA', valor) > 0 then
     begin
        DMBorradorContabilidad.QMApuntesTIPO.AsString := valor;
        FMTercerosIva := TFMTercerosIva.Create(Self);
        try
           FMTercerosIva.MostarParametrizado(0);
           DMBorradorContabilidad.ObtenerDatosIva(Valor);

           if FMTercerosIva.Grabar then
              DMBorradorContabilidad.QMApuntes.Post;
        finally
           FMTercerosIva.Free;
        end;
     end;
end;

procedure TFMBorradorContabilidad.HabilitaBotonesCabecera;
begin
  with DMBorradorContabilidad do
     if (xTipos.FieldByName('EXT').AsInteger = 1) then
     begin
        AVerTerceroAsiento.Enabled := True;
        // TButtVerTercero.Enabled := True;
     end
     else
     begin
        // TButtVerTercero.Enabled := False;
        AVerTerceroAsiento.Enabled := False;
     end;

  // Cartera
  if ((DBEFTipoAsiento.Text = 'CRC') or (DBEFTipoAsiento.Text = 'PRP') or (DBEFTipoAsiento.Text = 'PRA') or
     (DBEFTipoAsiento.Text = 'CPB')) then
  begin
     AVerTerceroAsiento.Enabled := True;
     // TButtVerTercero.Enabled := True;
  end;
end;

procedure TFMBorradorContabilidad.HabilitaBotonesDetalle;
begin
  with DMBorradorContabilidad do
  begin
     if (Pos('IVA', QMApuntesTIPO.AsString) > 0) then
     begin
        AVerApunteIva.Enabled := True;
        TButtVerApunteIVA.Enabled := True;
     end
     else
     begin
        AVerApunteIva.Enabled := False;
        TButtVerApunteIVA.Enabled := False;
     end;
  end;
end;

procedure TFMBorradorContabilidad.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  HabilitaBotonesDetalle;
end;

procedure TFMBorradorContabilidad.FormShow(Sender: TObject);
begin
  HabilitaBotonesCabecera;
  HabilitaBotonesDetalle;
end;

procedure TFMBorradorContabilidad.DBGFDetalleRowChange(Sender: TObject);
begin
  HabilitaBotonesDetalle;
end;

procedure TFMBorradorContabilidad.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  // Control de edicion de tipo, canal, moneda en asientos de cobro y pago

  if ((Button = nbEdit) and
     ((DBEFTipoAsiento.Text = 'CRC') or (DBEFTipoAsiento.Text = 'PRP') or
     (DBEFTipoAsiento.Text = 'PRA') or (DBEFTipoAsiento.Text = 'CPB'))) then
  begin
     ColorInfo(DBEFTipoAsiento);
     DBEFTipoAsiento.ReadOnly := True;
     DBEFTipoAsiento.Enabled := False;
  end
  else
  begin
     ColorEdicion(DBEFTipoAsiento);
     DBEFTipoAsiento.ReadOnly := False;
     DBEFTipoAsiento.Enabled := True;
  end;
end;

procedure TFMBorradorContabilidad.AValidarExecute(Sender: TObject);
begin
  DMBorradorContabilidad.Valida;
end;

procedure TFMBorradorContabilidad.ATraspasaExecute(Sender: TObject);
begin
  if (DBEFTipoAsiento.Text = 'REG') or (DBEFTipoAsiento.Text = 'CIE') then
     ShowMessage(_('Este tipo de Asiento no se puede generar desde el Borrador'))
  else
  begin
     if DMBorradorContabilidad.Traspasa(CerrarAlTraspasar) then
     begin

     end;

     if (CerrarAlTraspasar) then // Punteo de asientos
        Close;
  end;
end;

procedure TFMBorradorContabilidad.AVerTerceroAsientoExecute(Sender: TObject);
begin
  with DMBorradorContabilidad do
     TipoOld := QMAsientosTIPO.AsString;

  if (DBEFTipoAsiento.Text = 'EXT') then
  begin
     FMDatosTercerosIVA := TFMDatosTercerosIVA.Create(Self);
     FMDatosTercerosIVA.MostarParametrizado(1);
     FMDatosTercerosIVA.Free;
  end
  else if ((DBEFTipoAsiento.Text = 'AFC') or (DBEFTipoAsiento.Text = 'AFP') or
     (DBEFTipoAsiento.Text = 'AFA')) then
  begin
     DMBorradorContabilidad.TipoAsiento := DBEFTipoAsiento.Text;
     FMDatosBorradorFac := TFMDatosBorradorFac.Create(Self);
     FMDatosBorradorFac.MostrarParametrizado(1);
     FMDatosBorradorFac.Free;
  end;

  if ((DBEFTipoAsiento.Text = 'CRC') or (DBEFTipoAsiento.Text = 'PRP') or (DBEFTipoAsiento.Text = 'PRA') or
     (DBEFTipoAsiento.Text = 'CPB')) then
     if (DMBorradorContabilidad.QMAsientos.State = dsBrowse) then
     begin
        FMInfoRecibosBorrador := TFMInfoRecibosBorrador.Create(Self);
        FMInfoRecibosBorrador.ShowModal;
        FMInfoRecibosBorrador.Free;
     end;
end;

procedure TFMBorradorContabilidad.ACuadrarExecute(Sender: TObject);
begin
  DMBorradorContabilidad.Cuadrar;
end;

procedure TFMBorradorContabilidad.APasaAPlantillaExecute(Sender: TObject);
begin
  DMBorradorContabilidad.APlantilla;
end;

procedure TFMBorradorContabilidad.APasaDePlantillaExecute(Sender: TObject);
var
  Tecla : char;
begin
  if (NavMain.DataSource.State <> dsInsert) then
  begin
     Tecla := #32;
     with EFPlantilla do
     begin
        Enabled := True;
        Text := '';
        SetFocus;
        KeyPress(Tecla);
        Enabled := False;
     end;
     ActiveControl := NavMain;
  end;
end;

procedure TFMBorradorContabilidad.ARenumeraExecute(Sender: TObject);
begin
  DMMain.AjustaMovimientos;
end;

procedure TFMBorradorContabilidad.AContaExtractoExecute(Sender: TObject);
begin
  FMain.AContaExtracto.Execute;
  {dji lrk kri}
  if ((DBGFDetalle.SelectedField.FieldName = 'ABONO') and (DBGFDetalle.SelectedField.AsString <> '')) then
     FCMayor.EFCuenta.Text := DBGFDetalle.SelectedField.AsString
  else
  if ((DBGFDetalle.SelectedField.FieldName = 'CARGO') and (DBGFDetalle.SelectedField.AsString <> '')) then
     FCMayor.EFCuenta.Text := DBGFDetalle.FindColumn('CARGO').Field.AsString
  else
  if ((DBGFDetalle.FindColumn('ABONO').Field.AsString > '')) then
     FCMayor.EFCuenta.Text := DBGFDetalle.FindColumn('ABONO').Field.AsString
  else
     FCMayor.EFCuenta.Text := DBGFDetalle.FindColumn('CARGO').Field.AsString;
end;

procedure TFMBorradorContabilidad.ACambiaTextoExecute(Sender: TObject);
begin
  if ConfirmaMensaje(_('Va a cambiar todos los textos de los apuntes. ¿Está seguro?')) then
     DMBorradorContabilidad.CambiaTextoAsiento;
end;

procedure TFMBorradorContabilidad.DBEFTipoAsientoVerificacion(Sender: TObject);
begin
  if (DMBorradorContabilidad.AsientoExtendido(TDBEdit(Sender).Text)) and
     ((DMBorradorContabilidad.QMAsientos.State = dsInsert) or
     (DMBorradorContabilidad.QMAsientos.State = dsEdit)) then
  begin
     // Mostrar pantalla para recoger los datos del registro de iva
     if (DBEFTipoAsiento.Text = 'EXT') then
     begin
        FMDatosTercerosIVA := TFMDatosTercerosIVA.Create(Self);
        FMDatosTercerosIVA.MostarParametrizado(2);
        if FMDatosTercerosIVA.Grabar then
        begin
           FMDatosTercerosIVA.Free;
           DMBorradorContabilidad.QMAsientos.Post;
        end
        else
           FMDatosTercerosIVA.Free;
     end;

     if ((DBEFTipoAsiento.Text = 'AFC') or (DBEFTipoAsiento.Text = 'AFP') or
        (DBEFTipoAsiento.Text = 'AFA')) then
     begin
        DMBorradorContabilidad.TipoAsiento := DBEFTipoAsiento.Text;
        FMDatosBorradorFac := TFMDatosBorradorFac.Create(Self);
        if (DMBorradorContabilidad.QMAsientos.State = dsInsert) then
        begin
           FMDatosBorradorFac.MostrarParametrizado(0);
           if FMDatosBorradorFac.Grabar then
           begin
              DMBorradorContabilidad.QMAsientos.Post;
           end;
        end
        else
           FMDatosBorradorFac.MostrarParametrizado(1);
        FMDatosBorradorFac.Free; {dji lrk kri - Se debe liberar aqui y no solo dentro del if}
     end;
     DMBorradorContabilidad.CambioAsiento := DBEFTipoAsiento.Text;
  end;

  if ((DBEFTipoAsiento.Text = 'CRC') or (DBEFTipoAsiento.Text = 'PRP') or (DBEFTipoAsiento.Text = 'PRA') or
     (DBEFTipoAsiento.Text = 'CPB')) then
  begin
     // Solo se puede hacer un cobro pago en la moneda del canal
     ColorInfo(DBEFMoneda);
     DBEFMoneda.ReadOnly := True;
     DBEFMoneda.Enabled := False;
     if ((DMBorradorContabilidad.QMAsientos.State = dsInsert) or
        (DMBorradorContabilidad.QMAsientos.State = dsEdit)) then
        DMBorradorContabilidad.QMAsientosMONEDA.AsString := REntorno.Moneda;
  end
  else
  begin
     ColorEdicion(DBEFMoneda);
     DBEFMoneda.ReadOnly := False;
     DBEFMoneda.Enabled := True;
  end;

  if (((DBEFTipoAsiento.Text = 'CRC') or (DBEFTipoAsiento.Text = 'PRP') or
     (DBEFTipoAsiento.Text = 'PRA') or
     (DBEFTipoAsiento.Text = 'CPB')) and
     (DMBorradorContabilidad.QMAsientos.State = dsInsert)) then
  begin
     DMBorradorContabilidad.TipoAsiento := DBEFTipoAsiento.Text;
     FMPagaRecibosAgrBorrador := TFMPagaRecibosAgrBorrador.Create(Self);
     FMPagaRecibosAgrBorrador.Mostrar(DBEFTipoAsiento.Text);
     FMPagaRecibosAgrBorrador.Free;
     HabilitaBotonesCabecera;
     DeshabilitaDetalle;
  end;
end;

procedure TFMBorradorContabilidad.ATraspasaFiltradosExecute(Sender: TObject);
begin
  if ConfirmaMensaje(_('Va a traspasar TODOS los asientos filtrados a contabilidad. ¿Está seguro?')) then
     DMBorradorContabilidad.TraspasaAsientosFiltrados;
end;

procedure TFMBorradorContabilidad.DBEFTipoAsientoKriChange(Sender: TObject);
begin
  ETitTipoKri.Text := '';
  if (Trim(DBEFTipoAsientoKri.Text) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_ASIENTO WHERE TIPO=''' + DBEFTipoAsientoKri.Text + '''';
           ExecQuery;
           ETitTipoKri.Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMBorradorContabilidad.DeshabilitaDetalle;
begin
  // DBGFDetalle.ReadOnly := True;
end;

procedure TFMBorradorContabilidad.NavDetalleChangeState(Sender: TObject);
begin
  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'CARGO');
end;

procedure TFMBorradorContabilidad.AValidarTodosExecute(Sender: TObject);
begin
  inherited;
  DMBorradorContabilidad.Valida(True);
end;

procedure TFMBorradorContabilidad.AAdjuntosAsientoExecute(Sender: TObject);
begin
  inherited;
  if (DMBorradorContabilidad.QMAsientosID_ASIENTO.AsInteger > 0) then
  begin
     FMain.MuestraAdunto('ASI', DMBorradorContabilidad.QMAsientosID_ASIENTO.AsInteger);
  end
  else
  begin
     ShowMessage(_('El borrador no tiene un asiento asociado'));
  end;
end;

procedure TFMBorradorContabilidad.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('ASI', DMBorradorContabilidad.QMAsientosID_ASIENTO.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosAsiento.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMBorradorContabilidad.ADuplicarLineaExecute(Sender: TObject);
begin
  inherited;
  DMBorradorContabilidad.DuplicarLinea;
end;

end.
