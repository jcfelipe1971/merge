unit UFCMayor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UControlEdit, Grids, DBGrids, UHYDBGrid, dbcgrids, Mask, DBCtrls,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, UEditPanel, UNavigator, ToolWin,
  UTeclas, UFIBDBEditfind, UComponentesBusquedaFiltrada, ActnList, UFormGest,
  NsDBGrid, rxToolEdit, ULFActionList, ULFToolBar, ULFEdit, ULFDBEdit,
  ULFPanel, ULFPageControl, ULFComboBox, ULFEditFind2000, rxPlacemnt,
  ULFFormStorage, ULFLabel, DateUtils, ULFDateEdit, UFPEdit, UG2kTBLoc;

type
  TFCMayor = class(TFPEdit)
     DBECuenta: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEDebe: TLFDbedit;
     DBEHaber: TLFDbedit;
     TSMovPeriodos: TTabSheet;
     PNL_Per_1: TLFPanel;
     DBEpCuenta: TLFDbedit;
     DBEpTitulo: TLFDbedit;
     LBLSaldoAnt: TLFLabel;
     DBEAntD: TLFDbedit;
     DBEAntH: TLFDbedit;
     DBGPeriodos: THYTDBGrid;
     LBLDesde: TLFLabel;
     DTPDesde: TLFDateEdit;
     LBLHasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     LBLMonedaFicha: TLFLabel;
     TButtSeparador2: TToolButton;
     TButtRefrescaMayor: TToolButton;
     LBLMoneda: TLFLabel;
     TButtSeparador3: TToolButton;
     EFMoneda: TLFEditFind2000;
     DBGConsulta: THYTDBGrid;
     TButtFiltraFichas: TToolButton;
     TButtFiltraMoneda: TToolButton;
     DBESaldoAnt: TLFDbedit;
     DBESaldo: TLFDbedit;
     LBLSaldoAct: TLFLabel;
     DBESaldoAct: TLFDbedit;
     EMoneda: TLFEdit;
     PNLCuenta: TLFPanel;
     LDigiteCuenta: TLFLabel;
     EFCuenta: TLFEditFind2000;
     CBCanales: TLFComboBox;
     ATraspasaBorrador: TAction;
     AFiltraFechas: TAction;
     ARefrescaMayor: TAction;
     AFiltraMoneda: TAction;
     AEliminaRIC: TAction;
     AVisualizarListado: TAction;
     AVisualizaMayor: TAction;
     Asep: TAction;
     AConfRapidaListadoMayor: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     PNLCentroCoste: TLFPanel;
     LCentroCoste: TLFLabel;
     EFDigito1: TLFEditFind2000;
     EFDigito2: TLFEditFind2000;
     EFDigito3: TLFEditFind2000;
     EFDigito4: TLFEditFind2000;
     EFDigito5: TLFEditFind2000;
     ETitMoneda: TLFEdit;
     PNLSaldos: TLFPanel;
     NavMayor: THYMNavigator;
     AExportarHojaCalculo: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSMovPeriodosShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormShow(Sender: TObject);
     procedure MuestraFiltrado;
     procedure EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGConsultaDblClick(Sender: TObject);
     procedure EFCuentaExit(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure ATraspasaBorradorExecute(Sender: TObject);
     procedure AFiltraFechasExecute(Sender: TObject);
     procedure ARefrescaMayorExecute(Sender: TObject);
     procedure AFiltraMonedaExecute(Sender: TObject);
     procedure AEliminaRICExecute(Sender: TObject);
     procedure AVisualizarListadoExecute(Sender: TObject);
     procedure AVisualizaMayorExecute(Sender: TObject);
     procedure AConfRapidaListadoMayorExecute(Sender: TObject);
     procedure EFDigito1Change(Sender: TObject);
     procedure EFDigito2Change(Sender: TObject);
     procedure EFDigito3Change(Sender: TObject);
     procedure EFDigito4Change(Sender: TObject);
     procedure EFDigito5Change(Sender: TObject);
     procedure DBGConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AExportarHojaCalculoExecute(Sender: TObject);
  private
     { Private declarations }
     procedure Expande;
  public
     { Public declarations }
     procedure Filtra(Cuenta: string);
  end;

var
  FCMayor : TFCMayor;

implementation

uses UDMMayor, UEntorno, UDMMain, UUtiles, UFMain, UFMListConfig,
  UDMBorradorContabilidad, UFMMovConta, UDMMovConta, UDMRMayor, UFPregMayor,
  UFMBorradorContabilidad, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFCMayor.FormCreate(Sender: TObject);
var
  Apertura, Cierre : TDateTime;
begin
  inherited;
  AbreData(TDMMayor, DMMayor);
  NavMain.DataSource := DMMayor.DSxCuentas;
  DBGConsulta.DataSource := DMMayor.DSxMayor;
  DBGMain.DataSource := DMMayor.DSxCuentas;
  DBGPeriodos.DataSource := DMMayor.DSxmayor_cuenta_periodo;

  // Ponemos las fechas por defecto
  DameMinMax('EJE', Apertura, Cierre);
  DTPDesde.Date := Apertura;
  DTPHasta.Date := Cierre;
  // Llamo a Filtra() para establecer las fechas en el DM
  DMMayor.Filtra(DTPDesde.Date, DTPHasta.Date);

  // Rellenamos el combo de canales
  RellenaCanales(CBCanales.Items);
  CBCanales.ItemIndex := REntorno.Canal;
  DMMayor.Canal := REntorno.Canal;
  DMMayor.Alcance := 1;

  // Para que no se pueda seleccionar canal, por los inspectores
  if (DMMain.EstadoKri(9) = 1) then
     CBCanales.Visible := False;

  // Teclas
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  EFMoneda.Text := REntorno.Moneda;
  if REntorno.ContabilidadRestringida then
  begin
     ATraspasaBorrador.Visible := False;
     AEliminaRIC.Visible := False;
     EFCuenta.CondicionBusqueda := 'RESTRICCION = 0';
  end
  else
  begin
     ATraspasaBorrador.Visible := True;
     AEliminaRIC.Visible := True;
     EFCuenta.CondicionBusqueda := 'EMPRESA = EMPRESA';
  end;

  // Controlamos la longitud de la cadena
  FMain.AddComponentePunto(EFCuenta);
  EFCuenta.MaxLength := REntorno.DigitosSub;
  try {dji lrk kri - para que no pete cuando no está activo el borrador}
     if Assigned(FMBorradorContabilidad) then
        with FMBorradorContabilidad do
        begin
           if DBGFDetalle.SelectedField.FieldName = 'ABONO' then
              EFCuenta.Text := DBGFDetalle.SelectedField.AsString
           else
              EFCuenta.Text := DBGFDetalle.FindColumn('CARGO').Field.AsString;
           Self.SetFocusedControl(DTPDesde);
        end;
  except
  end;
end;

procedure TFCMayor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(EFCuenta);
  CierraData(DMMayor);
end;

procedure TFCMayor.Filtra(Cuenta: string);
begin
  EFCuenta.Text := Cuenta;
  Expande;
end;

procedure TFCMayor.TSFichaShow(Sender: TObject);
begin
  EFCuenta.SetFocus;
end;

procedure TFCMayor.TSTablaShow(Sender: TObject);
begin
  DBGMain.SetFocus;
end;

procedure TFCMayor.TSMovPeriodosShow(Sender: TObject);
begin
  EMoneda.Text := EFMoneda.Text;
  DBGPeriodos.SetFocus;
  DMMayor.FiltraPeriodo;
end;

procedure TFCMayor.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMMayor.BusquedaCompleja;
  Continua := False;
end;

procedure TFCMayor.FormShow(Sender: TObject);
begin
  DMMayor.Moneda := EFMoneda.Text;
  DMMayor.CambiaMascara(DMMayor.Moneda);
  EFCuenta.SetFocus;
end;

procedure TFCMayor.MuestraFiltrado;
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  try
     SqlFiltro.AddStrings(DMMayor.xMayor.SelectSQL);
     AbreData(TDMRMayor, DMRMayor);
     with DMRMayor do
     begin
        TempSql.AddStrings(xListaMayor.SelectSQL);
        xListaMayor.Close;
        xListaMayor.SelectSQL.Assign(SqlFiltro);
        DMMayor.LanzaListado(EFDigito1.Text, EFDigito2.Text, EFDigito3.Text, EFDigito4.Text, EFDigito5.Text, DTPDesde.Date, DTPHasta.Date);
        xListaMayor.Close;
        xListaMayor.SelectSQL.Assign(TempSQL);
     end;
     CierraData(DMRMayor);
  finally
     SqlFiltro.Free;
     TempSql.Free;
  end;
end;

procedure TFCMayor.EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     Expande;
end;

procedure TFCMayor.DBGConsultaDblClick(Sender: TObject);
begin
  if DMMAyor.HayDatos then
     FMain.MuestraMovConta(' RIC= ' + DMMayor.DameRIC + ' and ejercicio=' +
        IntToStr(DMMayor.DameEjercicio), IntToStr(DMMayor.DameCanal));
end;

procedure TFCMayor.EFCuentaExit(Sender: TObject);
begin
  Expande;
end;

procedure TFCMayor.Expande;
begin
  PCMain.ActivePage := TSFicha;
  TSFicha.Visible := True;
  if EFCuenta.Text = '' then
     Exit;
  if Pos('.', EFCuenta.Text) <> 0 then
     EFCuenta.Text := ExpandirCadena(EFCuenta.Text, REntorno.DigitosSub);

  DMMain.BuscaRO(EFCuenta.Text, DMMayor.xCuentas, 'CUENTA', 'TITULO', '111001', 'CUENTA');

  EFCuenta.Text := '';
  DBGConsulta.SetFocus;
end;

procedure TFCMayor.CBCanalesChange(Sender: TObject);
begin
  if (CBCanales.ItemIndex = 0) then
  begin
     DMMayor.Alcance := 0;
     DMMayor.Canal := REntorno.Canal;
  end
  else
  begin
     DMMayor.Alcance := 1;
     DMMayor.Canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);
  end;
end;

procedure TFCMayor.EFMonedaChange(Sender: TObject);
begin
  ETitMoneda.Text := DameTituloMoneda(EFMoneda.Text);
  DMMayor.CambiaTituloMoneda(EFMoneda.Text, False);
end;

procedure TFCMayor.ATraspasaBorradorExecute(Sender: TObject);
var
  Tipo : string;
  Empresa, Ejercicio, Ric : integer;
begin
  Tipo := DMMayor.DameTipoAsiento;
  if Tipo = 'APE' then
     ShowMessage(_('El Asiento de Apertura no puede modificarse desde el borrador'))
  else if Tipo = 'CIE' then
     ShowMessage(_('El Asiento de Cierre no puede modificarse desde el borrador'))
  else if Tipo = 'REG' then
     ShowMessage(_('El Asiento de Regularización no puede modificarse desde el borrador'))
  else
  begin
     DMMayor.ABorradorConDatos(Empresa, Ejercicio, Ric);
     if (Ric > 0) then
     begin
        FMain.AContaBorrador.Execute;
        DMBorradorContabilidad.PosicionaRIB(Empresa, Ejercicio, Ric);
     end
     else
        ShowMessage(_('Este Asiento no puede modificarse desde el borrador'));
  end;
end;

procedure TFCMayor.AFiltraFechasExecute(Sender: TObject);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  DMMayor.Filtra(DTPDesde.Date, DTPHasta.Date);
end;

procedure TFCMayor.ARefrescaMayorExecute(Sender: TObject);
begin
  DMMayor.Refresca;
end;

procedure TFCMayor.AFiltraMonedaExecute(Sender: TObject);
begin
  DMMayor.CambiaTituloMoneda(EFMoneda.Text, True);
end;

procedure TFCMayor.AEliminaRICExecute(Sender: TObject);
begin
  DMMayor.BorraRic;
end;

procedure TFCMayor.AVisualizarListadoExecute(Sender: TObject);
begin
  MuestraFiltrado;
end;

procedure TFCMayor.AVisualizaMayorExecute(Sender: TObject);
begin
  TFPregMayor.Create(Self).Mostrar(DMMayor.xCuentas.FieldByName('CUENTA').AsString,
     FCMayor.DTPDesde.Date, FCMayor.DTPHasta.Date, EFDigito1.Text, EFDigito2.Text, EFDigito3.Text, EFDigito4.Text, EFDigito5.Text);
end;

procedure TFCMayor.AConfRapidaListadoMayorExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMRMayor, DMRMayor);
  TFMListConfig.Create(Self).Muestra(4, formato, cabecera, copias, pijama, '',
     DMRMayor.frMayor);
  CierraData(DMRMayor);
end;

procedure TFCMayor.EFDigito1Change(Sender: TObject);
begin
  EFDigito2.SetFocus;
  DMMayor.D1 := EFDigito1.Text;
  DMMayor.Refresca;
end;

procedure TFCMayor.EFDigito2Change(Sender: TObject);
begin
  EFDigito3.SetFocus;
  DMMayor.D2 := EFDigito2.Text;
  DMMayor.Refresca;
end;

procedure TFCMayor.EFDigito3Change(Sender: TObject);
begin
  EFDigito4.SetFocus;
  DMMayor.D3 := EFDigito3.Text;
  DMMayor.Refresca;
end;

procedure TFCMayor.EFDigito4Change(Sender: TObject);
begin
  EFDigito5.SetFocus;
  DMMayor.D4 := EFDigito4.Text;
  DMMayor.Refresca;
end;

procedure TFCMayor.EFDigito5Change(Sender: TObject);
begin
  DMMayor.D5 := EFDigito5.Text;
  DMMayor.Refresca;
end;

procedure TFCMayor.DBGConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMMAyor.HayDatos then
  begin
     if (UpperCase(Column.FieldName) = 'ASIENTO') then
        CeldaEnlace(DBGConsulta, Rect);
  end;
end;

procedure TFCMayor.AExportarHojaCalculoExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := Format(_('Extracto_Cta_-%s_%s.xls'), [Trim(DBECuenta.Text), FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FCMayor') then
  begin
     Screen.Cursor := crHourGlass;
     try
        ExportarExcel(Archivo, DBGConsulta.DataSource, True, True);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

end.
