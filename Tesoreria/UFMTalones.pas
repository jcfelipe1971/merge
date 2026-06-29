unit UFMTalones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UEditPanel, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, UHYDBGrid, UFormGest, DB,
  UNavigator, Buttons, NsDBGrid, rxToolEdit, RXDBCtrl, ULFEdit,
  ULFDBCheckBox, ULFDBEdit, ULFDBEditFind2000, ULFPanel, ULFPageControl,
  ULFToolBar, ULFActionList, ActnList, rxPlacemnt, ULFFormStorage,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFComboBox, HYFIBQuery, FIBQuery,
  FIBDatabase, ULFDateEdit, DateUtils, ULFEditFind2000, ULFDBMemo, ULFDBDateEdit,
  UFPEdit, UG2kTBLoc;

type
  TFMTalones = class(TFPEdit)
     LBanco: TLFLabel;
     DBEFBanco: TLFDBEditFind2000;
     ETituloBanco: TLFEdit;
     DBDTPFecha: TLFDBDateEdit;
     LBLFecha: TLFLabel;
     DBEImporte: TLFDbedit;
     LImporte: TLFLabel;
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBCHKCerrada: TLFDBCheckBox;
     DBETalon: TLFDbedit;
     LBLTalon: TLFLabel;
     LBLDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LLugar: TLFLabel;
     DBELugar: TLFDbedit;
     SPBPermuta: TSpeedButton;
     EPro_Acre: TLFEdit;
     LBLPro_Acr: TLFLabel;
     DBEFProv_Acr: TLFDBEditFind2000;
     AImprimeTalones: TAction;
     AVerCartaPago: TAction;
     AImprimirCartaPago: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ASep: TAction;
     DBEFTipo_asiento: TLFDBEditFind2000;
     LTipo_asiento: TLFLabel;
     DBEImporteKri: TLFDbedit;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     TButtSep2: TToolButton;
     TButtMostrarDisponibles: TToolButton;
     EPDetalle: THYMEditPanel;
     TButtSeleccionarTodas: TToolButton;
     TButtSep5: TToolButton;
     TButtCerrarTalon: TToolButton;
     TButtAbrirTalon: TToolButton;
     LFCategoryAction2: TLFCategoryAction;
     AVerListadoTalones: TAction;
     AVerListadoTalonesNoContabilizados: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AConfigurarCartaDePago: TAction;
     AConfigurarListadoTalones: TAction;
     LSaldoAcreedor: TLFLabel;
     LSaldoDeudor: TLFLabel;
     PNLSerieParaSaldosKri: TLFPanel;
     CBSerieParaSaldo: TLFComboBox;
     LSerieParaSaldoKri: TLFLabel;
     LSaldo: TLFLabel;
     ADesgloseDeSaldoKri: TAction;
     AVerListadoTalonesNoContabilizadosPorSerie: TAction;
     AVerCartaPagoNoContabilizadoPorSerie: TAction;
     TSGeneracionAutomatica: TTabSheet;
     PNLGeneracionAutomatica: TLFPanel;
     TBGeneracionAutomatica: TLFToolBar;
     NavGeneracionAutomatica: THYMNavigator;
     ToolButton1: TToolButton;
     DBGTalones: TDBGridFind2000;
     LFCategoryAction4: TLFCategoryAction;
     AGeneraTalones: TAction;
     ABorraTalonesMarcados: TAction;
     TButtGeneraTalones: TToolButton;
     TButtBorraTalonesMarcados: TToolButton;
     ToolButton4: TToolButton;
     LFechaDesde: TLFLabel;
     DEFechaDesdeTalon: TLFDateEdit;
     DBETalonPapel: TLFDbedit;
     PNLCaberceraAutomatico: TLFPanel;
     LFechaHasta: TLFLabel;
     DEFechaHastaTalon: TLFDateEdit;
     LBancoTalon: TLFLabel;
     EFBancoTalon: TLFEditFind2000;
     ETituloBancoTalon: TLFEdit;
     LSerieTalon: TLFLabel;
     DBGIncidencias: TNsDBGrid;
     EFSerieTalon: TLFEditFind2000;
     ELugar: TLFEdit;
     LGenAutoLugar: TLFLabel;
     DBEAsiento: TLFDbedit;
     SBVerAsientos: TSpeedButton;
     AAsientoTalon: TAction;
     LContador: TLFLabel;
     DBEContador: TLFDbedit;
     LComentario: TLFLabel;
     LFDBComentario: TLFDBMemo;
     TBModificaRet: TToolButton;
     ToolButton3: TToolButton;
     DBESaldoDeudor: TLFDbedit;
     DBESaldoAcreedor: TLFDbedit;
     DBESaldo: TLFDbedit;
     PNLVerSaldos: TLFPanel;
     CBVerSaldos: TLFCheckBox;
     LFCategoryAction5: TLFCategoryAction;
     ANormaSabadell: TAction;
     ARespuestaANormaSabadell: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBEFBancoChange(Sender: TObject);
     procedure TButtMostrarDisponiblesClick(Sender: TObject);
     procedure TButtSeleccionarTodasClick(Sender: TObject);
     procedure TButtCerrarTalonClick(Sender: TObject);
     procedure TButtAbrirTalonClick(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure SPBPermutaClick(Sender: TObject);
     procedure DBEFProv_AcrChange(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure AImprimeTalonesExecute(Sender: TObject);
     procedure AVerCartaPagoExecute(Sender: TObject);
     procedure AImprimirCartaPagoExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ACierraTodoKriExecute(Sender: TObject);
     procedure AVerCartaPagoNoContabilizadoExecute(Sender: TObject);
     procedure AImprimirCartaPagoNoContabilizadoExecute(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AVerListadoTalonesExecute(Sender: TObject);
     procedure AVerListadoTalonesNoContabilizadosExecute(Sender: TObject);
     procedure AConfigurarCartaDePagoExecute(Sender: TObject);
     procedure AConfigurarListadoTalonesExecute(Sender: TObject);
     procedure ADesgloseDeSaldoKriExecute(Sender: TObject);
     procedure AVerListadoTalonesNoContabilizadosPorSerieExecute(Sender: TObject);
     procedure AVerCartaPagoNoContabilizadoPorSerieExecute(Sender: TObject);
     procedure AGeneraTalonesExecute(Sender: TObject);
     procedure ABorraTalonesMarcadosExecute(Sender: TObject);
     procedure EFBancoTalonChange(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure AAsientoTalonExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBCHKCerradaChange(Sender: TObject);
     procedure TBModificaRetClick(Sender: TObject);
     procedure CBVerSaldosChange(Sender: TObject);
     procedure ANormaSabadellExecute(Sender: TObject);
     procedure ARespuestaANormaSabadellExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AjustaCheckTalon(Talon: string);
     procedure CambiaTipoTercero(Tipo: string);
  end;

var
  FMTalones : TFMTalones;

implementation

uses UDMMain, UUtiles, UDMTalones, UFPregTalones, UDMLSTTalones,
  UFMListConfig, UEntorno, UFMain, UFMRetenciones, UDameDato;

{$R *.DFM}

procedure TFMTalones.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;

  try
     AbreData(TDMTalones, DMTalones);
  except
     MessageDlg('Error. AbreData.', mtError, [mbOK], 0);
  end;

  try
     // Se asigna el PopUp del principal
     FMTalones.PopupMenu := CEMainPMEdit;
     REntorno.Asiento_TAL_P := 'PRE';

     DEFechaDesdeTalon.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
     DEFechaHastaTalon.Date := EncodeDate(YearOf(Now), MonthOf(Now), DaysInAMonth(YearOf(Now), MonthOf(Now)));

     DBEImporteKri.Visible := DMMain.EstadoKri(26) = 1;

     CBVerSaldos.Checked := False;
     if (DMMain.EstadoKri(217) = 1) then
        PNLVerSaldos.Visible := True
     else
     begin
        PNLSerieParaSaldosKri.Visible := False;
        AVerListadoTalonesNoContabilizadosPorSerie.Visible := False;
        PNLVerSaldos.Visible := False;
        ADesgloseDeSaldoKri.Visible := False;
     end;

     CBVerSaldosChange(Self);
  except
     MessageDlg('Error. 217.', mtError, [mbOK], 0);
  end;

  // Generacion automática de Talones - Fercam
  if not (DMMain.EstadoKri(255) = 1) then
  begin
     TSGeneracionAutomatica.TabVisible := False;
     // Primero borro las acciones
     try
        for i := Self.ComponentCount - 1 downto 0 do
        begin
           if (Self.Components[i] is TAction) then
              if TAction(Self.Components[i]).Category = 'GeneracionAutomatica' then
                 TAction(Self.Components[i]).Free;
        end;
     except
        MessageDlg('Error. Generacion Automatica 1 (action).', mtError, [mbOK], 0);
     end;

     {Despues borro las categorias}
     try
        for i := Self.ComponentCount - 1 downto 0 do
        begin
           if (Components[i] is TLFCategoryAction) then
              if TLFCategoryAction(Self.Components[i]).Category = 'GeneracionAutomatica' then
                 TLFCategoryAction(Self.Components[i]).Free;
        end;
     except
        MessageDlg('Error. Generacion Automatica 2 (category).', mtError, [mbOK], 0);
     end;
  end;

  try
     // Numero de Talones real (segun papel) - Fercam
     DBETalonPapel.Visible := DMMain.EstadoKri(256) = 1;

     SolapaControles(SBVerAsientos, DBEAsiento);
     DBEAsiento.Color := REntorno.ColorEnlaceActivo;
  except
     MessageDlg('Error. Fin Create.', mtError, [mbOK], 0);
  end;

  if (REntorno.Pais <> 'DOM') then
  begin
     DBGFDetalle.FindColumn('RETENCION').Visible := False;
     DBGFDetalle.FindColumn('TIPO_RETENCION').Visible := False;
     DBEContador.Visible := False;
     LContador.Visible := False;
     TBModificaRet.Visible := False;
  end;

  if (REntorno.Pais = 'DOM') then
     LLugar.Caption := _('Nomb.');

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SPBPermuta, 1, DMMain.ILMain_Ac, 54);
end;

procedure TFMTalones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTalones);
end;

procedure TFMTalones.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMTalones.TSTablaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMTalones.DBEFBancoChange(Sender: TObject);
begin
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(DBEFBanco.Text, 0));
end;

procedure TFMTalones.TButtMostrarDisponiblesClick(Sender: TObject);
begin
  if (not DBCHKCerrada.Checked) then
     DMTalones.MostrarRecibosDisponibles;
end;

procedure TFMTalones.AjustaCheckTalon(Talon: string);
begin
  with DBGFDetalle.ColumnasCheckBoxes do
     if IndexOf('TALON') = -1 then
        Append('TALON');

  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf('TALON')] := Talon;
end;

procedure TFMTalones.TButtSeleccionarTodasClick(Sender: TObject);
begin
  if (not DBCHKCerrada.Checked) then
     DMTalones.SeleccionaTodos;
end;

procedure TFMTalones.TButtCerrarTalonClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     ShowMessage(_('El talon ya está contabilizado.'))
  else
     DMTalones.CierraTalon;
end;

procedure TFMTalones.TButtAbrirTalonClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     DMTalones.AbreTalon
  else
     ShowMessage(_('El talon no está contabilizado.'));
end;

procedure TFMTalones.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  if (not DBCHKCerrada.Checked) then
     DMTalones.FiltraDetalle;
end;

procedure TFMTalones.SPBPermutaClick(Sender: TObject);
begin
  if (not DMTalones.Detalle) then
  begin
     if LBLPro_Acr.Caption = _('Proveedor') then
        CambiaTipoTercero('ACR')
     else
        CambiaTipoTercero('PRO');
  end;
end;

procedure TFMTalones.CambiaTipoTercero(Tipo: string);
var
  Titulo : string;
  Columna : integer;
begin
  if (Tipo = 'ACR') then
  begin
     LBLPro_Acr.Caption := _('Acreedor');
     EPro_Acre.Text := '';
     DBEFProv_Acr.Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
     DBEFProv_Acr.CampoNum := 'ACREEDOR';
     DBEFProv_Acr.OrdenadoPor.Text := 'ACREEDOR';
     Columna := EncuentraField(DBGFDetalle, 'COD_CLI_PRO');
     if (Columna >= 0) then
        DBGFDetalle.Columns[Columna].Title.Caption := _('Acr.');
     Columna := EncuentraField(DBGFDetalle, 'NUM_FACTURA_PROV');
     if (Columna >= 0) then
        DBGFDetalle.Columns[Columna].Visible := False;
     Columna := EncuentraField(DBGFDetalle, 'NUM_FACTURA_ACR');
     if (Columna >= 0) then
        DBGFDetalle.Columns[Columna].Visible := True;
  end
  else
  begin
     LBLPro_Acr.Caption := _('Proveedor');
     EPro_Acre.Text := '';
     DBEFProv_Acr.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
     DBEFProv_Acr.CampoNum := 'PROVEEDOR';
     DBEFProv_Acr.OrdenadoPor.Text := 'PROVEEDOR';
     Columna := EncuentraField(DBGFDetalle, 'COD_CLI_PRO');
     if (Columna >= 0) then
        DBGFDetalle.Columns[Columna].Title.Caption := _('Prov.');
     Columna := EncuentraField(DBGFDetalle, 'NUM_FACTURA_PROV');
     if (Columna >= 0) then
        DBGFDetalle.Columns[Columna].Visible := True;
     Columna := EncuentraField(DBGFDetalle, 'NUM_FACTURA_ACR');
     if (Columna >= 0) then
        DBGFDetalle.Columns[Columna].Visible := False;
  end;

  DMTalones.CambiaCod_Pro(Tipo, StrToIntDef(DBEFProv_Acr.Text, 0), Titulo);
  EPro_Acre.Text := Titulo;
end;

procedure TFMTalones.DBEFProv_AcrChange(Sender: TObject);
var
  Tipo, Titulo : string;
begin
  Tipo := DMTalones.QMTalonesTIPO_TERCERO.AsString;

  if ((DMTalones.QMTalones.State = dsInsert) or (DMTalones.QMTalones.State = dsEdit)) then
  begin
     if LBLPro_Acr.Caption = _('Proveedor') then
        Tipo := 'PRO'
     else
        Tipo := 'ACR';
  end;

  DMTalones.CambiaCod_Pro(Tipo, StrToIntDef(DBEFProv_Acr.Text, 0), Titulo);
  EPro_Acre.Text := Titulo;
end;

procedure TFMTalones.DBGFDetalleCellClick(Column: TColumn);
begin
  DMTalones.Recibos;
end;

procedure TFMTalones.AImprimeTalonesExecute(Sender: TObject);
begin
  TFpregTalones.Create(Self).mostrar(1, 'T');
end;

procedure TFMTalones.AVerCartaPagoExecute(Sender: TObject);
begin
  DMTalones.MostrarCartaPago(0, 0, '');
end;

procedure TFMTalones.AImprimirCartaPagoExecute(Sender: TObject);
begin
  DMTalones.MostrarCartaPago(1, 0, '');
end;

procedure TFMTalones.ACierraTodoKriExecute(Sender: TObject);
begin
  DMTalones.CierraTalonTodosKri;
end;

procedure TFMTalones.AVerCartaPagoNoContabilizadoExecute(Sender: TObject);
begin
  DMTalones.MostrarCartaPago(0, 1, '');
end;

procedure TFMTalones.AImprimirCartaPagoNoContabilizadoExecute(Sender: TObject);
begin
  DMTalones.MostrarCartaPago(1, 1, '');
end;

procedure TFMTalones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMTalones.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTalones.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
     DBETalon.Enabled := True;
     DBETalon.ReadOnly := not DBETalon.Enabled;
     ColorNormal(DBETalon);
  end
  else
  begin
     DBETalon.Enabled := False;
     DBETalon.ReadOnly := not DBETalon.Enabled;
     ColorInfo(DBETalon);
  end;
end;

procedure TFMTalones.AVerListadoTalonesExecute(Sender: TObject);
begin
  TFpregTalones.Create(Self).mostrar(1, 'L');
  // DMTalones.MostrarListadoTalones(0, 0, '');
end;

procedure TFMTalones.AVerListadoTalonesNoContabilizadosExecute(Sender: TObject);
begin
  DMTalones.MostrarListadoTalones(0, True, '');
end;

procedure TFMTalones.AConfigurarCartaDePagoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstTalones, DMLstTalones);
  TFMListConfig.Create(Self).Muestra(93, formato, cabecera, copias,
     pijama, '', DMLstTalones.frCartaPago, DMLstTalones.HYTalones);
  CierraData(DMLstTalones);
end;

procedure TFMTalones.AConfigurarListadoTalonesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstTalones, DMLstTalones);
  TFMListConfig.Create(Self).Muestra(5093, formato, cabecera, copias,
     pijama, '', DMLstTalones.frCartaPago, DMLstTalones.HYTalones);
  CierraData(DMLstTalones);
end;

procedure TFMTalones.ADesgloseDeSaldoKriExecute(Sender: TObject);
var
  Q : TFIBQuery;
  T : TFIBTransaction;
  s, m1, m2 : string;
begin
  s := '';
  try
     T := TFIBTransaction.Create(nil);
     T.DefaultDataBase := DMMain.DataBase;
     T.TRParams.Clear;
     T.TRParams.Add('read_committed');
     T.TRParams.Add('read');
     try
        Q := TFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           Transaction := T;
           Transaction.StartTransaction;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT EJERCICIO_SALDO, CUENTA, TITULO, SALDO_DEUDOR, SALDO_ACREEDOR, SALDO ');
           SQL.Add(' FROM KRI_SALDO_AGRUPADO_CLI_PRO (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :MAESTRO) ');
           SQL.Add(' ORDER BY CUENTA, EJERCICIO_SALDO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := CBSerieParaSaldo.Text;
           if LBLPro_Acr.Caption = 'Proveedor' then
              Params.ByName['TIPO'].AsString := 'P'
           else
              Params.ByName['TIPO'].AsString := 'A';
           Params.ByName['MAESTRO'].AsInteger := StrToIntDef(DBEFProv_Acr.Text, 0);
           ExecQuery;
           while not (EOF) do
           begin
              s := #13#10 + s + Format('%d - %s - %n - %n - %n - %s' + #13#10, [FieldByName['EJERCICIO_SALDO'].AsInteger, FieldByName['CUENTA'].AsString, FieldByName['SALDO_DEUDOR'].AsFloat, FieldByName['SALDO_ACREEDOR'].AsFloat, FieldByName['SALDO'].AsFloat, FieldByName['TITULO'].AsString]);
              Next;
           end;
           Transaction.Commit;
        end;
     finally
        FreeAndNil(Q);
     end
  finally
     FreeAndNil(T);
  end;

  m2 := _('Desglose del saldo');
  if (Length(s) > 0) then
  begin
     m1 := _('EJER - CUENTA   - DEBE      - HABER        - SALDO     - TITULO') + s;
     Application.MessageBox(PChar(m1), PChar(m2), MB_OK);
  end
  else
  begin
     m1 := _('No hay cuentas con saldo');
     Application.MessageBox(PChar(m1), PChar(m2), MB_OK);
  end;
end;

procedure TFMTalones.AVerListadoTalonesNoContabilizadosPorSerieExecute(Sender: TObject);
begin
  DMTalones.MostrarListadoTalones(0, True, CBSerieParaSaldo.Text);
end;

procedure TFMTalones.AVerCartaPagoNoContabilizadoPorSerieExecute(Sender: TObject);
begin
  DMTalones.MostrarCartaPago(0, 1, CBSerieParaSaldo.Text);
end;

procedure TFMTalones.AGeneraTalonesExecute(Sender: TObject);
begin
  DMTalones.GeneraTalones(DEFechaDesdeTalon.Date, DEFechaHastaTalon.Date, EFSerieTalon.Text, StrToIntDef(EFBancoTalon.Text, 0), ELugar.Text);
end;

procedure TFMTalones.ABorraTalonesMarcadosExecute(Sender: TObject);
begin
  DMTalones.BorraTalones;
end;

procedure TFMTalones.EFBancoTalonChange(Sender: TObject);
begin
  ETituloBancoTalon.Text := DameTituloBanco(StrToIntDef(EFBancoTalon.Text, 0));
end;

procedure TFMTalones.PCMainChange(Sender: TObject);
begin
  try
     if (TSGeneracionAutomatica.TabVisible) then
     begin
        AGeneraTalones.Enabled := PCMain.ActivePage = TSGeneracionAutomatica;
        ABorraTalonesMarcados.Enabled := PCMain.ActivePage = TSGeneracionAutomatica;
     end;
  except
     on e: Exception do
        MessageDlg('Error. PCMainChange.' + #13#10 + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFMTalones.SBVerAsientosDblClick(Sender: TObject);
begin
  AAsientoTalon.Execute;
end;

procedure TFMTalones.AAsientoTalonExecute(Sender: TObject);
begin
  if (DMTalones.QMTalonesPAGADO.AsInteger = 1) then
     FMain.MuestraMovConta(' RIC= ' + DMTalones.QMTalonesRIC.AsString +
        ' and ejercicio=' + DMTalones.QMTalonesEJERCICIO.AsString);
end;

procedure TFMTalones.DBGFDetalleBusqueda(Sender: TObject);
begin
  if DBGFDetalle.ColumnaActual = 'TIPO_RETENCION' then
     DBGFDetalle.CondicionBusqueda := '';
end;

procedure TFMTalones.DBCHKCerradaChange(Sender: TObject);
begin
  DBEAsiento.Visible := DBCHKCerrada.Checked;
end;

procedure TFMTalones.TBModificaRetClick(Sender: TObject);
begin
  if (DBCHKCerrada.Checked = False) then
     ShowMessage(_('El talon no está contabilizado.'))
  else
  begin
     AbreForm(TFMRetenciones, FMRetenciones, Sender);
     FMRetenciones.Muestra(DMTalones.QMDetalleID_CARTERA_DETALLE.AsInteger);
     DMTalones.Refrescar;
  end;
end;

procedure TFMTalones.CBVerSaldosChange(Sender: TObject);
begin
  DMTalones.CalcularSaldo := CBVerSaldos.Checked;

  if CBVerSaldos.Checked then
     PEdit.Height := DBESaldoDeudor.Top + DBESaldoDeudor.Height + 5
  else
     PEdit.Height := DBEImporte.Top + DBEImporte.Height + 5;

  LSaldoDeudor.Visible := CBVerSaldos.Checked;
  LSaldoAcreedor.Visible := CBVerSaldos.Checked;
  LSaldo.Visible := CBVerSaldos.Checked;
  DBESaldoDeudor.Visible := CBVerSaldos.Checked;
  DBESaldoAcreedor.Visible := CBVerSaldos.Checked;
  DBESaldo.Visible := CBVerSaldos.Checked;
end;

procedure TFMTalones.ANormaSabadellExecute(Sender: TObject);
var
  Archivo : string;
begin
  Archivo := Format(_('Talones_%s.txt'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'TXT', '', 'FMTalones-NormaSabadell') then
     DMTalones.CrearNormaSabadell(Archivo);
end;

procedure TFMTalones.ARespuestaANormaSabadellExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'TXT', '', 'FMTalones-RespuestaANormaSabadell') then
     DMTalones.LeerRespuestaNormaSabadell(Archivo);
end;

procedure TFMTalones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  G2kTableLoc.Click;
end;

end.
