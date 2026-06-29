unit UFMMovConta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, DBCtrls, StdCtrls, ComCtrls, UDBDateTimePicker, Mask,
  Menus, UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, Grids,
  DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ActnList, rxPlacemnt, NsDBGrid,
  ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel,
  UG2kTBLoc;

type
  TFMMovConta = class(TFPEdit)
     PEdAsientos: TLFPanel;
     PNLPROAsientos: TLFPanel;
     DBETitTipo: TLFDbedit;
     DBEDebe: TLFDbedit;
     DBEHaber: TLFDbedit;
     PNLPRwAsientos: TLFPanel;
     LBLRIC: TLFLabel;
     DBERic: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBCHKFirme: TLFDBCheckBox;
     PNLPRwATipo: TLFPanel;
     LBLTipo: TLFLabel;
     TBDetalle: TLFToolBar;
     NavApuntes: THYMNavigator;
     PNLApuntes: TLFPanel;
     DBETitCta: TLFDbedit;
     TButtRefresca: TToolButton;
     DBGApuntes: TDBGridFind2000;
     DBEFecha: TLFDbedit;
     DBETipo: TLFDbedit;
     DBEAsiento: TLFDbedit;
     LBAsiento: TLFLabel;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     TButtOrdenarSigno: TToolButton;
     TButtOrdenarLinea: TToolButton;
     TSep1: TToolButton;
     ToolButton1: TToolButton;
     ALstLibroDiario: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ARefresca: TAction;
     ATraspasaBorrador: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AEliminaAsiento: TAction;
     ASep: TAction;
     AOrdenarSigno: TAction;
     AOrdenarLinea: TAction;
     AInfoExtendido: TAction;
     DBETipoAsientoKri: TLFDBEdit;
     LTipoAsientoKri: TLFLabel;
     LFCategoryAction3: TLFCategoryAction;
     ABuscaPorImportes: TAction;
     ToolButton2: TToolButton;
     TButtAnalitica: TToolButton;
     AAnalitica: TAction;
     AModificarCuenta: TAction;
     TBNotas: TToolButton;
     ANotas: TAction;
     PNLDetalle: TLFPanel;
     AAdjuntosAsiento: TAction;
     LFCategoryAction4: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure CompruebaInfoExtendida;
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure ALstLibroDiarioExecute(Sender: TObject);
     procedure ARefrescaExecute(Sender: TObject);
     procedure ATraspasaBorradorExecute(Sender: TObject);
     procedure AEliminaAsientoExecute(Sender: TObject);
     procedure AOrdenarSignoExecute(Sender: TObject);
     procedure AOrdenarLineaExecute(Sender: TObject);
     procedure AInfoExtendidoExecute(Sender: TObject);
     procedure ABuscaPorImportesExecute(Sender: TObject);
     procedure AAnaliticaExecute(Sender: TObject);
     procedure AModificarCuentaExecute(Sender: TObject);
     procedure DBGApuntesDblClick(Sender: TObject);
     procedure ANotasExecute(Sender: TObject);
     procedure DBGApuntesCellClick(Column: TColumn);
     procedure DBGApuntesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AAdjuntosAsientoExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     ColActual: TColumn;
     procedure CompruebaRecibos;
  public
     { Public declarations }
     procedure FiltraMovimientos(Filtro: string; Canal: string = '');
  end;

var
  FMMovConta : TFMMovConta;

implementation

uses UFormGest, UDMMovConta, UDMMain, UEntorno, UUtiles, UFMain,
  UDMBorradorContabilidad, UFPregLibroDiarioConta, UFMovContaINFO,
  UFMovContaRecibos, UFMBuscaAsientosxImp, UFMImputacionCostes,
  UFPregModificaCuenta, HYFIBQuery, FIBQuery, UFMNotas, UFMRemesas, UFMAdjunto,
  ShellApi, URecibeFicheros, UDMAdjunto, UDameDato;

{$R *.DFM}

procedure TFMMovConta.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMMovConta, DMMovConta);

  NavMain.DataSource := DMMovConta.DSQMAsientos;
  DBGMain.DataSource := DMMovConta.DSQMAsientos;
  NavApuntes.DataSource := DMMovConta.DSQMApuntes;
  DBGApuntes.DataSource := DMMovConta.DSQMApuntes;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  AAnalitica.Visible := DMMain.PuedeHacerImputaciones;
  {dji lrk kri}
  ATraspasaBorrador.Visible := True;
  AEliminaAsiento.Visible := True;
  if REntorno.ContabilidadRestringida then
  begin
     ATraspasaBorrador.Visible := False;
     AEliminaAsiento.Visible := False;
  end;

  // Color campo ID
  ColorCampoID(DBEAsiento);
  ColorCampoID(DBERic);
end;

procedure TFMMovConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMovConta);
end;

procedure TFMMovConta.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMMovConta.BusquedaCompleja;
  Continua := False;
  CompruebaInfoExtendida;
  CompruebaRecibos;
end;

procedure TFMMovConta.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMMovConta.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMMovConta.FiltraMovimientos(Filtro: string; canal: string = '');
var
  Parametro : TParametroFiltrado;
begin
  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     // Mismo SQL pero sin filtrar EJERCICIO
     // Parametro.SQLBase.Text := DMMovConta.SQLBase.Text;
     Parametro.SQLBase.Add(' SELECT * FROM CON_CUENTAS_ASIENTOS ');
     Parametro.SQLBase.Add(' WHERE ');
     Parametro.SQLBase.Add(' EMPRESA = :EMPRESA AND ');
     Parametro.SQLBase.Add(' CANAL = :CANAL ');
     Parametro.SQLBase.Add(' ORDER BY ASIENTO ');
     Parametro.Tabla := DMMovConta.QMAsientos;
     DMMain.FiltraSQL(Parametro, False);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;

  DMMovConta.CambiaCanal(Canal);
  CompruebaInfoExtendida;
  CompruebaRecibos;
end;

procedure TFMMovConta.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  CompruebaInfoExtendida;
  CompruebaRecibos;
end;

procedure TFMMovConta.CompruebaInfoExtendida;
var
  Tipo : string;
begin
  Tipo := DMMovConta.QMAsientosTIPO.AsString;

  if (FMovContaINFO <> nil) then
  begin
     if ((Tipo = 'EXT') or (Tipo = 'AFC') or (Tipo = 'AFA') or (Tipo = 'AFP')) then
        FMovContaINFO.FiltraDatos
     else
        FreeAndNil(FMovContaINFO);
  end;
end;

procedure TFMMovConta.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  CompruebaInfoExtendida;
  CompruebaRecibos;
end;

procedure TFMMovConta.DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  CompruebaInfoExtendida;
  CompruebaRecibos;
end;

procedure TFMMovConta.CompruebaRecibos;
var
  Tipo : string;
begin
  Tipo := DMMovConta.QMAsientosTIPO.AsString;
  if (FMovContaRecibos <> nil) then
  begin
     if ((Tipo = 'PRA') or (Tipo = 'PRP') or (Tipo = 'CRC') or (Tipo = 'CPB')) then
        FMovContaRecibos.FiltraDatos
     else
        FreeAndNil(FMovContaRecibos);
  end;
end;

procedure TFMMovConta.ALstLibroDiarioExecute(Sender: TObject);
var
  f_desde : TDateTime;
  FechaStr : string;
begin
  inherited;
  if (DBEFecha.Text > '') then
  begin
     FechaStr := Copy(DBEFecha.Text, 1, 10);
     F_desde := StrToDate(FechaStr);
     TFPregLibroDiarioConta.Create(Self).mostrar(F_Desde, StrToIntDef(DBEasiento.Text, 1));
  end;
end;

procedure TFMMovConta.ARefrescaExecute(Sender: TObject);
begin
  inherited;
  DMMovConta.Refresca;
end;

procedure TFMMovConta.ATraspasaBorradorExecute(Sender: TObject);
var
  Empresa, Ejercicio, Ric : integer;
begin
  inherited;
  if DBETipo.Text = 'CIE' then
     ShowMessage(_('El Asiento de Cierre no puede modificarse desde el borrador'))
  else if DBETipo.Text = 'REG' then
     ShowMessage(_('El Asiento de Regularización no puede modificarse desde el borrador'))
  else
  begin
     Empresa := DMMovConta.QMAsientosEMPRESA.AsInteger;
     Ejercicio := DMMovConta.QMAsientosEJERCICIO.AsInteger;
     Ric := DMMovConta.ABorrador;

     if (Ric > 0) then
     begin
        FMain.AContaBorrador.Execute;
        DMBorradorContabilidad.PosicionaRIB(Empresa, Ejercicio, Ric);
     end;

     if (ric = -1) then
        ShowMessage(_('Este Asiento no puede modificarse desde el borrador'));
  end;
end;

procedure TFMMovConta.AEliminaAsientoExecute(Sender: TObject);
begin
  inherited;
  DMMovConta.EliminaRic;
end;

procedure TFMMovConta.AOrdenarSignoExecute(Sender: TObject);
begin
  inherited;
  DMMovConta.OrdenarSigno;
end;

procedure TFMMovConta.AOrdenarLineaExecute(Sender: TObject);
begin
  inherited;
  DMMovConta.OrdenarLinea;
end;

procedure TFMMovConta.AInfoExtendidoExecute(Sender: TObject);
var
  Tipo : string;
begin
  inherited;

  Tipo := DMMovConta.QMAsientosTIPO.AsString;

  if ((Tipo = 'EXT') or
     (Tipo = 'AFC') or
     (Tipo = 'AFA') or
     (Tipo = 'AFP')) then
  begin
     AbreForm(TFMovContaINFO, FMovContaINFO, Sender);
     FMovContaINFO.FiltraDatos;
  end
  else
  if ((Tipo = 'PRA') or
     (Tipo = 'PRP') or
     (Tipo = 'CPB') or
     (Tipo = 'CRC')) then
  begin
     AbreForm(TFMovContaRecibos, FMovContaRecibos, Sender);
     FMovContaRecibos.FiltraDatos;
  end
  else
  if (Tipo = 'REM') then
  begin
     FMain.ARemesasExecute(Sender);
     FMRemesas.FiltraPorRIC(DMMovConta.QMAsientosRIC.AsInteger);
  end
  else
  if ((Tipo = 'CRE') or (Tipo = 'PRE') or (Tipo = 'CPR')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT D.EJERCICIO, D.CANAL, D.SIGNO, D.REGISTRO ');
           SQL.Add(' FROM EMP_CARTERA_DETALLE D ');
           SQL.Add(' JOIN EMP_CARTERA C ON D.ID_CARTERA = C.ID_CARTERA ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.RIC = :RIC ');
           if (DMMovConta.QMApuntesDOC_NUMERO.AsInteger > 0) then
           begin
              SQL.Add(' AND C.DOC_NUMERO = :DOC_NUMERO ');
              SQL.Add(' AND C.DOC_SERIE = :DOC_SERIE ');
           end;
           Params.ByName['EMPRESA'].AsInteger := DMMovConta.QMAsientosEMPRESA.AsInteger;
           // Ejercicio segun fecha de documento
           // Params.ByName['EJERCICIO'].AsInteger := DMMovConta.QMAsientosEJERCICIO.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(DMMovConta.QMAsientosEMPRESA.AsInteger, (DMMovConta.QMApuntesDOC_FECHA.AsDateTime));
           Params.ByName['CANAL'].AsInteger := DMMovConta.QMAsientosCANAL.AsInteger;
           Params.ByName['RIC'].AsInteger := DMMovConta.QMAsientosRIC.AsInteger;
           if (DMMovConta.QMApuntesDOC_NUMERO.AsInteger > 0) then
           begin
              Params.ByName['DOC_NUMERO'].AsInteger := DMMovConta.QMApuntesDOC_NUMERO.AsInteger;
              Params.ByName['DOC_SERIE'].AsString := DMMovConta.QMApuntesDOC_SERIE.AsString;
           end;
           ExecQuery;
           FMain.MuestraCartera(FieldByName['EJERCICIO'].AsInteger, FieldByName['CANAL'].AsInteger, FieldByName['SIGNO'].AsString[1], FieldByName['REGISTRO'].AsInteger);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMMovConta.ABuscaPorImportesExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMBuscaAsientosxImp, FMBuscaAsientosxImp, Sender);
end;

procedure TFMMovConta.AAnaliticaExecute(Sender: TObject);
begin
  AbrirImputacionCostes(DMMovConta.QMAsientosRIC.AsInteger, False);
end;

procedure TFMMovConta.AModificarCuentaExecute(Sender: TObject);
var
  Cuenta : string;
begin
  Cuenta := DMMovConta.DameCuenta;

  if (DMMovConta.CuentaCierre(Cuenta)) then
     ShowMessage(_('No se puede modificar la cuenta.' + #13#10 + 'No es una cuenta de Perdida o Ganancia.'))
  else
  begin
     with TFPregModificaCuenta.Create(Self) do
        try
           EjecutaModificaCuenta(Cuenta);
        finally
           Free;
        end;
  end;
end;

procedure TFMMovConta.DBGApuntesDblClick(Sender: TObject);
var
  Tipo, TipoKri : string;
begin
  if (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or (UpperCase(ColActual.FieldName) = 'DOC_NUMERO') then
  begin
     Tipo := DMMovConta.QMAsientosTIPO.AsString;
     TipoKri := DMMovConta.QMAsientosTIPO_ASIENTO_KRI.AsString;
     if (Tipo = 'VEN') and (TipoKri = 'VEN') then
        Tipo := 'FAC';
     if (Tipo = 'COM') and ((TipoKri = 'COM') or (TipoKri = 'CEE') or (TipoKri = 'COE')) then
        Tipo := 'FAP';
     if (Tipo = 'COM') and (TipoKri = 'ACR') then
        Tipo := 'FCR';

     if ((Tipo = 'EXT') or (Tipo = 'AFC') or (Tipo = 'AFA') or (Tipo = 'AFP') or
        (Tipo = 'PRA') or (Tipo = 'PRP') or (Tipo = 'CPB') or (Tipo = 'CRC') or
        (Tipo = 'REM') or
        (Tipo = 'CRE') or (Tipo = 'PRE') or
        (Tipo = 'CPR') or (Tipo = '')) then
        AInfoExtendido.Execute
     else
     if ((Tipo = 'FAC') or (Tipo = 'FAP') or (Tipo = 'FCR')) then
        FMain.MuestraDocumento(DameEjercicio(REntorno.Empresa, DMMovConta.QMAsientosFECHA.AsDateTime), Tipo, DMMovConta.QMApuntesDOC_SERIE.AsString, DMMovConta.QMApuntesDOC_NUMERO.AsInteger);
  end
  else
     AModificarCuentaExecute(Sender);
end;

procedure TFMMovConta.ANotasExecute(Sender: TObject);
var
  fm : TFMNotas;
begin
  inherited;
  fm := TFMNotas.Create(Self);
  with DMMovConta do
  begin
     fm.AbreNotas(QMAsientosASIENTO.AsInteger, QMAsientosRIC.AsInteger,
        QMAsientosEMPRESA.AsInteger, QMAsientosEJERCICIO.AsInteger,
        QMAsientosCANAL.AsInteger, QMAsientosFECHA.AsDateTime);
  end;
  fm.Free;
end;

procedure TFMMovConta.DBGApuntesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMMovConta.DBGApuntesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (DMMovConta.QMApuntes.RecordCount > 0) then
     if ((UpperCase(Column.FieldName) = 'DOC_SERIE') or (UpperCase(Column.FieldName) = 'DOC_NUMERO')) then
        CeldaEnlace(DBGApuntes, Rect);
end;

procedure TFMMovConta.AAdjuntosAsientoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('ASI', DMMovConta.QMAsientosID_ASIENTO.AsInteger);
end;

procedure TFMMovConta.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('ASI', DMMovConta.QMAsientosID_ASIENTO.AsInteger, Ficheros[i]);
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

end.
