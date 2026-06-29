unit UFMAmortizaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DbComboBoxValue, UFIBDBEditfind, FIBTableDataSet,
  UComponentesBusquedaFiltrada, DBCtrls, ComCtrls, UDBDateTimePicker, Mask,
  Menus, UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, Grids,
  DBGrids, UHYDBGrid, ExtCtrls, UREcursos, rxPlacemnt, NsDBGrid, rxToolEdit,
  RXDBCtrl, ULFDBMemo, ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, HYFIBQuery, ULFDBDateEdit,
  ULFEdit, ShellAPI;

type
  TFMAmortizaciones = class(TFPEdit)
     TSNotas: TTabSheet;
     DBEArticulo: TLFDbedit;
     LBLArticulo: TLFLabel;
     LBLGrupo: TLFLabel;
     DBEGrupo: TLFDbedit;
     LBLTituloFicha: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLVCompra: TLFLabel;
     DBEValorCompra: TLFDbedit;
     DBEValorResidual: TLFDbedit;
     LBLVResidual: TLFLabel;
     DBEFEchaUltima: TLFDbedit;
     LBLUltModif: TLFLabel;
     DBEFechaFin: TLFDbedit;
     LBLFechaFAmort: TLFLabel;
     DBDTPFechaBaja: TLFDBDateEdit;
     LBLFechaBaja: TLFLabel;
     DBCBBaja: TLFDBCheckBox;
     ECGastos: TLFEdit;
     DBEFCuentaG: TLFDBEditFind2000;
     LBLGastosAmort: TLFLabel;
     LBLCAmort: TLFLabel;
     DBEFCuentaA: TLFDBEditFind2000;
     ECAmortizacion: TLFEdit;
     LBLCInmov: TLFLabel;
     DBEFCuentaI: TLFDBEditFind2000;
     ECInmovilizado: TLFEdit;
     DBCBIndirecta: TLFDBCheckBox;
     LBLPerAmort: TLFLabel;
     LBLMetAmort: TLFLabel;
     LBLVidaUtil: TLFLabel;
     DBEVidaUtil: TLFDbedit;
     DBEVidaMax: TLFDbedit;
     LBLCoeficiente: TLFLabel;
     DBECoeficiente: TLFDbedit;
     DBECoefMax: TLFDbedit;
     LBLCinvent: TLFLabel;
     DBECenInventario: TLFDbedit;
     DBEFCentInventario: TLFDBEditFind2000;
     LBLFechaCompra: TLFLabel;
     DBDTPFechaCompra: TLFDBDateEdit;
     LBLFechaIni: TLFLabel;
     DBDTPFEchaInicio: TLFDBDateEdit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PNLDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     PCPie: TLFPageControl;
     TSTotales: TTabSheet;
     TSEjercicio: TTabSheet;
     TBPie: TLFToolBar;
     NavDet: THYMNavigator;
     PNLPieTotales: TLFPanel;
     LBLAmortAcum: TLFLabel;
     DBEAmortAcum: TLFDbedit;
     LBLVActual: TLFLabel;
     DBEValorActual: TLFDbedit;
     PNLPieEjerActual: TLFPanel;
     LBLVIniEjerc: TLFLabel;
     DBEValorIniEje: TLFDbedit;
     LBLAmortEjer: TLFLabel;
     DBEAmorAcumEje: TLFDbedit;
     LBLVFinEjerc: TLFLabel;
     DBEValorFinEje: TLFDbedit;
     DBEFTipoAmortizacion: TLFDBEditFind2000;
     DBEFPeriodosAmortizacion: TLFDBEditFind2000;
     DBETituloMetodoAmortizacion: TLFDbedit;
     DBETituloPeriodoAmortizacion: TLFDbedit;
     DBCHBSegundaMano: TLFDBCheckBox;
     PNLNotas: TLFPanel;
     TBArticulo: TLFToolBar;
     NavNotas: THYMNavigator;
     ToolButton2: TToolButton;
     DBMemoNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LBLValorBaja: TLFLabel;
     DBEValorBaja: TLFDbedit;
     LblMoneda: TLFLabel;
     ETitMoneda: TLFEdit;
     DBEFMoneda: TLFDBEditFind2000;
     ALstAmortizaciones: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ATraspasa: TAction;
     ATraspasaCuotas: TAction;
     ABorraUno: TAction;
     ABorraTodos: TAction;
     ABorrar: TAction;
     PNLArticulo: TLFPanel;
     DBENotasArticulo: TLFDbedit;
     DBENotasTitulo: TLFDbedit;
     LFCategoryAction2: TLFCategoryAction;
     LBLValorCompraKri: TLFLabel;
     DBEValorCompraKri: TLFDbedit;
     AAsientoBaja: TAction;
     DBGCentroCoste: TDBGridFind2000;
     PNLCentroCoste: TLFPanel;
     NavCentroCoste: THYMNavigator;
     CECentroCoste: TControlEdit;
     CECentroCostePMEdit: TPopUpTeclas;
     LFCategoryAction3: TLFCategoryAction;
     AFiltrarPendientes: TAction;
     AFiltrarBajasPendientes: TAction;
     AQuitaFiltro: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AAdjuntosInmovilizado: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBEGrupoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBCBBajaClick(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure DBEFCuentaIVerificacion(Sender: TObject);
     procedure DBEFCuentaAVerificacion(Sender: TObject);
     procedure DBEFCuentaGVerificacion(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBEGrupoExit(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEMonedaChange(Sender: TObject);
     procedure ALstAmortizacionesExecute(Sender: TObject);
     procedure ATraspasaExecute(Sender: TObject);
     procedure ATraspasaCuotasExecute(Sender: TObject);
     procedure ABorraUnoExecute(Sender: TObject);
     procedure ABorraTodosExecute(Sender: TObject);
     procedure ABorrarExecute(Sender: TObject);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFCuentaGChange(Sender: TObject);
     procedure DBEFBusqueda(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAsientoBajaExecute(Sender: TObject);
     procedure DBGCentroCosteBusqueda(Sender: TObject);
     procedure PNLCentroCosteEnter(Sender: TObject);
     procedure PNLCentroCosteExit(Sender: TObject);
     procedure AFiltrarPendientesExecute(Sender: TObject);
     procedure DBEFCuentaIChange(Sender: TObject);
     procedure DBEFCuentaAChange(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure AFiltrarBajasPendientesExecute(Sender: TObject);
     procedure AQuitaFiltroExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAdjuntosInmovilizadoExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     procedure MostrarFechaBaja(valor: boolean);
     procedure ActivaDetalle(valor: boolean);
  end;

var
  FMAmortizaciones : TFMAmortizaciones;

implementation

{$R *.DFM}

uses UFormGest, UDMMain, UEntorno, UDMAmortizacion, UFMAmortizacionGrupos,
  UFMain, UUtiles, UDMLstAmortizaciones, UFPregAmortizaciones, UDMAdjunto, URecibeFicheros, UDameDato;

procedure TFMAmortizaciones.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMAmortizacion, DMAmortizacion);
  CEMainPMEdit.Teclas := DMMain.teclas;
  PCMain.ActivePage := TSFicha;
  // Añadir controles que deben de utilizar el punto (cuentas)
  FMain.AddComponentePunto(DBEFCuentaI);
  FMain.AddComponentePunto(DBEFCuentaA);
  FMain.AddComponentePunto(DBEFCuentaG);
  NavMain.DataSource := DMAmortizacion.DSQMInmovilizado;
  DBGMain.DataSource := DMAmortizacion.DSQMInmovilizado;
  G2kTableLoc.DataSource := DMAmortizacion.DSQMInmovilizado;
  ActivaDetalle(DMAmortizacion.QMInmovilizadoTIPO_AMORTIZACION.AsString = 'VAR');
  DMAmortizacion.MascarasMoneda;

  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMAmortizaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMAmortizacion);

  // Eliminar controles
  FMain.DelComponentePunto(DBEFCuentaI);
  FMain.DelComponentePunto(DBEFCuentaA);
  FMain.DelComponentePunto(DBEFCuentaG);
end;

procedure TFMAmortizaciones.DBEGrupoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  FMAmortizacionGrupos := TFMAmortizacionGrupos.Create(Self);
  FMAmortizacionGrupos.ShowModal;
  DMAmortizacion.AsignaGrupo;
end;

procedure TFMAmortizaciones.DBCBBajaClick(Sender: TObject);
begin
  inherited;
  FMAmortizaciones.MostrarFechaBaja(DBCBBaja.Checked);
end;

procedure TFMAmortizaciones.MostrarFechaBaja(valor: boolean);
begin
  LBLFechaBaja.Visible := valor;
  DBDTPFechaBaja.Visible := valor;
  LBLValorBaja.Visible := valor;   // Javier Castro
  DBEValorBaja.Visible := valor;   // Javier Castro
  if (Valor) then
     DBDTPFechaBaja.Date := REntorno.FechaTrab;
end;

procedure TFMAmortizaciones.ActivaDetalle(valor: boolean);
begin
  if valor then
  begin
     NavDet.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit,
        nbInsert, nbDelete, nbPost, nbCancel, nbRefresh];
     NavDet.Width := 220;
  end
  else
  begin
     NavDet.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit,
        nbPost, nbCancel, nbRefresh];
     NavDet.Width := 176;
  end;
end;

procedure TFMAmortizaciones.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMAmortizaciones.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMAmortizaciones.TSNotasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CENotas;
end;

procedure TFMAmortizaciones.DBEFCuentaIVerificacion(Sender: TObject);
begin
  try
     ExpandirCadenaEdit(DBEFCuentaI);
  except
     on e: Exception do
        MessageDlg('ExpandirCadenaEdit (I). ' + #13#10 + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFMAmortizaciones.DBEFCuentaAVerificacion(Sender: TObject);
begin
  try
     ExpandirCadenaEdit(DBEFCuentaA);
  except
     on e: Exception do
        MessageDlg('ExpandirCadenaEdit (A). ' + #13#10 + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFMAmortizaciones.DBEFCuentaGVerificacion(Sender: TObject);
begin
  try
     ExpandirCadenaEdit(DBEFCuentaG);
  except
     on e: Exception do
        MessageDlg('ExpandirCadenaEdit (G). ' + #13#10 + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFMAmortizaciones.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMAmortizaciones.DBEGrupoExit(Sender: TObject);
begin
  if DBEGrupo.Text = '' then
  begin
     FMAmortizacionGrupos := TFMAmortizacionGrupos.Create(Self);
     FMAmortizacionGrupos.ShowModal;
     DMAmortizacion.AsignaGrupo;
  end;
end;

procedure TFMAmortizaciones.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ControlEdit := CEDetalle;
  ColActual := Column;
end;

procedure TFMAmortizaciones.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  ActivaDetalle(DMAmortizacion.QMInmovilizadoTIPO_AMORTIZACION.AsString = 'VAR');
end;

procedure TFMAmortizaciones.NavDetClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  ActivaDetalle(DMAmortizacion.QMInmovilizadoTIPO_AMORTIZACION.AsString = 'VAR');
end;

procedure TFMAmortizaciones.DBGFDetalleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  ActivaDetalle(DMAmortizacion.QMInmovilizadoTIPO_AMORTIZACION.AsString = 'VAR');
end;

procedure TFMAmortizaciones.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  ActivaDetalle(DMAmortizacion.QMInmovilizadoTIPO_AMORTIZACION.AsString = 'VAR');
end;

procedure TFMAmortizaciones.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  ActivaDetalle(DMAmortizacion.QMInmovilizadoTIPO_AMORTIZACION.AsString = 'VAR');
end;

procedure TFMAmortizaciones.DBEMonedaChange(Sender: TObject);
begin
  inherited;
  DMAmortizacion.MascarasMoneda;
  // Se muestra la columna con la moneda del canal sólo en caso necesario.
  DBGFDetalle.Columns[3].Visible := (DMAmortizacion.QMInmovilizadoMONEDA.AsString <>
     REntorno.Moneda);
end;

procedure TFMAmortizaciones.ALstAmortizacionesExecute(Sender: TObject);
begin
  inherited;
  TFPregAmortizaciones.Create(Self).Muestra;
end;

procedure TFMAmortizaciones.ATraspasaExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMAmortizacion.TraspasaAContabilidad;
     DMAmortizacion.Refresca;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAmortizaciones.ATraspasaCuotasExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMAmortizacion.TraspasaTodos;
     DMAmortizacion.Refresca;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAmortizaciones.ABorraUnoExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('Se va a borrar el último asiento de amortización de este ejercicio'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     try
        Screen.Cursor := crHourGlass;
        DMAmortizacion.BorraUltimo;
     finally
        Screen.Cursor := crDefault;
     end;

  try
     Screen.Cursor := crHourGlass;
     DMAmortizacion.Refresca;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAmortizaciones.ABorraTodosExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('Se van a borrar los asientos de amortización del presente ejercicio de este artículo'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     try
        Screen.Cursor := crHourGlass;
        DMAmortizacion.BorraAsientos;
     finally
        Screen.Cursor := crDefault;
     end;

  try
     Screen.Cursor := crHourGlass;
     DMAmortizacion.Refresca;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAmortizaciones.ABorrarExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('Se van a borrar los asientos de amortización del presente ejercicio de TODOS los artículos'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     try
        Screen.Cursor := crHourGlass;
        DMAmortizacion.BorraTodos;
     finally
        Screen.Cursor := crDefault;
     end;

  try
     Screen.Cursor := crHourGlass;
     DMAmortizacion.Refresca;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAmortizaciones.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMAmortizaciones.DBEFCuentaGChange(Sender: TObject);
begin
  inherited;
  ECGastos.Text := DameTituloCuenta(DBEFCuentaG.Text);

  // Centros de Coste
  if (Trim(DBEFCuentaG.Text) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CENTRO_COSTE FROM CON_CUENTAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA ');
           SQL.Add(' AND EJERCICIO = :EJERCICIO ');
           SQL.Add(' AND CANAL = :CANAL ');
           SQL.Add(' AND CUENTA = :CUENTA ');
           SQL.Add(' AND PGC = :PGC ');
           Params.ByName['EMPRESA'].AsInteger := DMAmortizacion.QMInmovilizadoEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DMAmortizacion.QMInmovilizadoCANAL.AsInteger;
           Params.ByName['CANAL'].AsInteger := DMAmortizacion.QMInmovilizadoCANAL.AsInteger;
           Params.ByName['CUENTA'].AsString := Trim(DBEFCuentaG.Text);
           Params.ByName['PGC'].AsInteger := REntorno.Pgc;
           ExecQuery;
           DBGCentroCoste.Visible := (FieldByName['CENTRO_COSTE'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     DBGCentroCoste.Visible := False;
end;

procedure TFMAmortizaciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMAmortizacion.BusquedaCompleja;
end;

procedure TFMAmortizaciones.DBEFBusqueda(Sender: TObject);
begin
  try
     with TLFDBEditFind2000(Sender) do
     begin
        if (Pos('AND TIPO=5 AND NIVEL=', CondicionBusqueda) = 0) then
           CondicionBusqueda := CondicionBusqueda + ' AND TIPO=5 AND NIVEL=' + IntToStr(REntorno.NivelesCont);
     end;
  except
     on e: Exception do
        MessageDlg('DBEFBusqueda (' + TLFDBEditFind2000(Sender).Name + ').' + #13#10 + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFMAmortizaciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMAmortizaciones.AAsientoBajaExecute(Sender: TObject);
var
  RIC : integer;
begin
  inherited;
  if (DMAmortizacion.QMInmovilizadoCANCELADO.AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT RIC_FIN FROM CON_INMOVILIZADOS WHERE EMPRESA = ?EMPRESA AND CANAL = ?CANAL AND ARTICULO = ?ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := DMAmortizacion.QMInmovilizadoEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := DMAmortizacion.QMInmovilizadoCANAL.AsInteger;
           Params.ByName['ARTICULO'].AsString := DMAmortizacion.QMInmovilizadoARTICULO.AsString;
           ExecQuery;
           RIC := FieldByName['RIC_FIN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
     FMain.MuestraMovConta(' RIC= ' + IntToStr(RIC) + ' AND EJERCICIO=' + REntorno.EjercicioStr);
  end;
end;

procedure TFMAmortizaciones.DBGCentroCosteBusqueda(Sender: TObject);
begin
  inherited;
  if (DBGCentroCoste.ColumnaActual = 'DIGITO_1') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=1';
  if (DBGCentroCoste.ColumnaActual = 'DIGITO_2') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=2';
  if (DBGCentroCoste.ColumnaActual = 'DIGITO_3') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=3';
  if (DBGCentroCoste.ColumnaActual = 'DIGITO_4') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=4';
  if (DBGCentroCoste.ColumnaActual = 'DIGITO_5') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=5';
end;

procedure TFMAmortizaciones.PNLCentroCosteEnter(Sender: TObject);
begin
  inherited;
  PNLCentroCoste.Top := DBEFechaFin.Top;
  PNLCentroCoste.Height := (ECGastos.Top + ECGastos.Height) - DBEFechaFin.Top + 1;
  NavCentroCoste.Visible := True;
end;

procedure TFMAmortizaciones.PNLCentroCosteExit(Sender: TObject);
begin
  inherited;
  PNLCentroCoste.Top := ECInmovilizado.Top;
  PNLCentroCoste.Height := (ECGastos.Top + ECGastos.Height) - ECInmovilizado.Top + 1;
  NavCentroCoste.Visible := False;
end;

procedure TFMAmortizaciones.DBEFCuentaIChange(Sender: TObject);
begin
  inherited;
  ECInmovilizado.Text := DameTituloCuenta(DBEFCuentaI.Text);
end;

procedure TFMAmortizaciones.DBEFCuentaAChange(Sender: TObject);
begin
  inherited;
  ECAmortizacion.Text := DameTituloCuenta(DBEFCuentaA.Text);
end;

procedure TFMAmortizaciones.DBEFMonedaChange(Sender: TObject);
begin
  inherited;
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
end;

procedure TFMAmortizaciones.AFiltrarPendientesExecute(Sender: TObject);
begin
  inherited;
  DMAmortizacion.FiltrarSoloPendientes(True, False);
end;

procedure TFMAmortizaciones.AFiltrarBajasPendientesExecute(Sender: TObject);
begin
  inherited;
  DMAmortizacion.FiltrarSoloPendientes(True, True);
end;

procedure TFMAmortizaciones.AQuitaFiltroExecute(Sender: TObject);
begin
  inherited;
  DMAmortizacion.FiltrarSoloPendientes(False, False);
end;

procedure TFMAmortizaciones.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // Enlaces
  if (UpperCase(Column.FieldName) = 'RIC') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

procedure TFMAmortizaciones.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'RIC') then
  begin
     if (DMAmortizacion.QMAmortizacionesRIC.AsInteger > 0) then
        FMain.MuestraMovConta(' RIC= ' + DMAmortizacion.QMAmortizacionesRIC.AsString +
           ' AND EJERCICIO=' + DMAmortizacion.QMAmortizacionesEJERCICIO.AsString);
  end;
end;

procedure TFMAmortizaciones.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('AMO', DMAmortizacion.QMInmovilizadoID_INMOVILIZADO.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosInmovilizado.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMAmortizaciones.AAdjuntosInmovilizadoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('AMO', DMAmortizacion.QMInmovilizadoID_INMOVILIZADO.AsInteger);
end;

end.
