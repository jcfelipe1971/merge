unit UFMPunteoAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ToolWin, ComCtrls, UNavigator,
  UHYDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  UEditPanel, Menus, UTeclas, UControlEdit, Mask, DBCtrls, UFormGest,
  URightMaskEdit, NsDBGrid, ULFEdit, ULFDBEdit, ULFPanel, ULFToolBar,
  ULFEditFind2000, ULFLabel, rxToolEdit, ULFDateEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, dbcgrids, ULFDBCtrlGrid, DB, HYFIBQuery,
  RXDBCtrl, ActnList, rxPlacemnt, ULFFormStorage, ULFActionList,
  UFPEditSimple;

type
  TFMPunteoAsientos = class(TFPEditSimple)
     DBGFPunteo: TDBGridFind2000;
     TButtSep1: TToolButton;
     PNLTBMain: TLFPanel;
     LDigiteCuenta: TLFLabel;
     TButtSep2: TToolButton;
     TButtPunteo: TToolButton;
     TButtNoPunteo: TToolButton;
     TButtSep3: TToolButton;
     TBPunteo: TLFToolBar;
     PNLTB2: TLFPanel;
     LCuenta: TLFLabel;
     EFCuenta: TLFEditFind2000;
     LBLSaldo: TLFLabel;
     ESaldo: TLFEdit;
     LBLSaldoPunteado: TLFLabel;
     DBESaldoPunteado: TLFDbedit;
     TButtSep4: TToolButton;
     TButtMuestraNorma43: TToolButton;
     PNLNorma43: TLFPanel;
     TBNorma43: TLFToolBar;
     TButtPunteoN43: TToolButton;
     TButtNoPunteoN43: TToolButton;
     EFEntidad: TLFEditFind2000;
     LEntidad: TLFLabel;
     PNLDetalleNorma43: TLFPanel;
     DBImporte: TDBText;
     LFDBCBPunteoN43: TLFDBCheckBox;
     DBTTitConceptoComun: TDBText;
     DBConcComun: TDBText;
     DBConcPropio: TDBText;
     DBTTitConceptoPropio: TDBText;
     DBFecOperacion: TDBText;
     DBFecValor: TDBText;
     DBReferencia1: TDBText;
     DBReferencia2: TDBText;
     DBNorma43Det: TDBText;
     DBGFNorma43: TDBGridFind2000;
     TButtVincularN43: TToolButton;
     ToolButton3: TToolButton;
     LSaldoPunteadoN43: TLFLabel;
     DBESaldoPunteadoN43: TLFDbedit;
     ToolButton2: TToolButton;
     AVincularN43: TAction;
     ToolButton4: TToolButton;
     EFBanco: TLFEditFind2000;
     LBanco: TLFLabel;
     PFiltroFechas: TLFPanel;
     LFEntreFechaKri: TLFLabel;
     LFDEDesdeFecha: TLFDateEdit;
     LFDEHastaFecha: TLFDateEdit;
     TBGeneraAsiento: TToolButton;
     AGeneraAsiento: TAction;
     TBTesoreria: TToolButton;
     ATesoreria: TAction;
     splNorma43: TSplitter;
     LRecibos: TLFLabel;
     LApuntesKri: TLFLabel;
     ToolButton5: TToolButton;
     ToolButton6: TToolButton;
     ECuenta: TLFEdit;
     ETituloCuenta: TLFEdit;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     AListadoPunteo: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AConfListadoPunteo: TAction;
     TButtTodos: TToolButton;
     TButtTodosN43: TToolButton;
     PNLPunteo: TLFPanel;
     DBTRelacion: TDBText;
     APuntearImporte: TAction;
     TBSincronizaPunteo: TToolButton;
     BMesAnterior: TButton;
     BEjercicio: TButton;
     BMes: TButton;
     BSemana: TButton;
     BMesSiguiente: TButton;
     TBSep1: TToolButton;
     CBSepararImportes: TLFCheckBox;
     AImportarNorma43: TAction;
     APuntearImporteTodos: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure TButtPunteoClick(Sender: TObject);
     procedure TButtNoPunteoClick(Sender: TObject);
     procedure EFCuentaExit(Sender: TObject);
     procedure LFDEDesdeFechaChange(Sender: TObject);
     procedure LFDEHastaFechaChange(Sender: TObject);
     procedure TButtMuestraNorma43Click(Sender: TObject);
     procedure EFEntidadChange(Sender: TObject);
     procedure TButtPunteoN43Click(Sender: TObject);
     procedure TButtNoPunteoN43Click(Sender: TObject);
     procedure AVincularN43Execute(Sender: TObject);
     procedure DBGFNorma43DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBESaldoPunteadoN43Change(Sender: TObject);
     procedure DBGFPunteoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AGeneraAsientoExecute(Sender: TObject);
     procedure ATesoreriaExecute(Sender: TObject);
     procedure DBGFPunteoDblClick(Sender: TObject);
     procedure AListadoPunteoExecute(Sender: TObject);
     procedure AConfListadoPunteoExecute(Sender: TObject);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtTodosN43Click(Sender: TObject);
     procedure APuntearImporteExecute(Sender: TObject);
     procedure TBSincronizaPunteoClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BSemanaClick(Sender: TObject);
     procedure BMesAnteriorClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure CBSepararImportesClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure AImportarNorma43Execute(Sender: TObject);
     procedure APuntearImporteTodosExecute(Sender: TObject);
     procedure splNorma43Moved(Sender: TObject);
  private
     { Private declarations }
     Left_splNorma43: integer;
     procedure Filtrame(Filtro: string);
     procedure Expande;
  public
     { Public declarations }
  end;

var
  FMPunteoAsientos : TFMPunteoAsientos;

implementation

uses UDMPunteoAsientos, UDMMain, UEntorno, UFMain, UUtiles,
  UFMBorradorContabilidad, UDMBorradorContabilidad, UFMPagaRecibosAgr,
  UDMPagaRecibosAgr, UFMSeleccionGrid, DateUtils, UDMLstPunteoAsientos,
  UFMListConfig, UParam, FIBDataSet, UDameDato;

{$R *.DFM}

procedure TFMPunteoAsientos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPunteoAsientos, DMPunteoAsientos);

  NavMain.DataSource := DMPunteoAsientos.DSQMPunteos;
  DBGFPunteo.DataSource := DMPunteoAsientos.DSQMPunteos;
  DBGFNorma43.DataSource := DMPunteoAsientos.DSQMNorma43;

  FMain.AddComponentePunto(EFCuenta);
  EFCuenta.MaxLength := REntorno.DigitosSub;
  ControlEdit := CEMain;
  LFDEDesdeFecha.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  LFDEHastaFecha.Date := EncodeDateTime(REntorno.Ejercicio, 12, 31, 23, 59, 59, 999);

  // Norma 43
  Left_splNorma43 := LeeDatoIni('FMPunteoAsientos', 'Left_splNorma43', 0);

  DMPunteoAsientos.CerrarNorma43; // Lo abre el cambio de LFDEDesdeFecha y LFDEHastaFecha
  PNLNorma43.Visible := False;
  splNorma43.Visible := False;
  PNLPunteo.Align := alClient;

  if (LeeParametro('MODNORMA43') = 'S') then
     TButtMuestraNorma43.Visible := True
  else
  begin
     TButtMuestraNorma43.Visible := False;
     AVincularN43.Visible := False;
     AGeneraAsiento.Visible := False;
     ATesoreria.Visible := False;
     LFCategoryAction1.Visible := False;
  end;

  with TBSincronizaPunteo do
  begin
     ImageIndex := 67;
     Caption := _('Sincroniza Punteo');
     Hint := _('Sincroniza Punteo - Busca un registro compatible para vinculacion');
  end;

  DMPunteoAsientos.SincronizaNorma43(True);
end;

procedure TFMPunteoAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  EscribeDatoIni('FMPunteoAsientos', 'Left_splNorma43', splNorma43.Left);

  FMain.DelComponentePunto(EFCuenta);
  CierraData(DMPunteoAsientos);
  Action := caFree;
end;

procedure TFMPunteoAsientos.Filtrame(Filtro: string);
var
  Parametro : TParametroFiltrado;
begin
  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     Parametro.SQLBase.Text := DMPunteoAsientos.SQLBase.Text;
     Parametro.Tabla := DMPunteoAsientos.QMPunteos;
     DMMain.FiltraSQL(Parametro, False);

     DMPunteoAsientos.FiltraPunteos(ECuenta.Text, LFDEDesdeFecha.Date, LFDEHastaFecha.Date);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;
end;

procedure TFMPunteoAsientos.TButtPunteoClick(Sender: TObject);
begin
  Filtrame('PUNTEO=1');
  DMPunteoAsientos.DameSaldoPunteado;
  DMPunteoAsientos.DameSaldoPunteadoN43;
end;

procedure TFMPunteoAsientos.TButtNoPunteoClick(Sender: TObject);
begin
  Filtrame('PUNTEO=0');
  DMPunteoAsientos.DameSaldoPunteado;
  DMPunteoAsientos.DameSaldoPunteadoN43;
end;

procedure TFMPunteoAsientos.TButtTodosClick(Sender: TObject);
begin
  Filtrame('1=1');
  DMPunteoAsientos.DameSaldoPunteado;
  DMPunteoAsientos.DameSaldoPunteadoN43;
end;

procedure TFMPunteoAsientos.EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     Expande;
end;

procedure TFMPunteoAsientos.EFCuentaExit(Sender: TObject);
begin
  Expande;
end;

procedure TFMPunteoAsientos.Expande;
var
  Banco : integer;
begin
  if (Trim(EFCuenta.Text) > '') then
  begin
     if Pos('.', EFCuenta.Text) <> 0 then
        EFCuenta.Text := ExpandirCadena(EFCuenta.Text, REntorno.DigitosSub);

     ECuenta.Text := EFCuenta.Text;

     DMPunteoAsientos.FiltraPunteos(ECuenta.Text, LFDEDesdeFecha.Date, LFDEHastaFecha.Date);
     ETituloCuenta.Text := DameTituloCuenta(ECuenta.Text);
     DMPunteoAsientos.CerrarNorma43;

     // Busco el banco que corresponda para la norma 43
     if (ECuenta.Text > '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT BANCO FROM VER_BANCOS_CUENTAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' CUENTA_CC = :CUENTA AND ');
              SQL.Add(' ACTIVO = 1 ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['CUENTA'].AsString := ECuenta.Text;
              ExecQuery;
              Banco := FieldByName['BANCO'].AsInteger;
              EFBanco.Text := IntToStr(Banco);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Banco > 0) then
           EFEntidad.Text := DameEntidadBanco(Banco)
        else
           EFEntidad.Text := '0000';

        if (PNLNorma43.Visible) then
           DMPunteoAsientos.AbrirNorma43(StrToIntDef(EFBanco.Text, 0));
     end;

     DBGFPunteo.SetFocus;
  end;

  ESaldo.Text := DMPunteoAsientos.DameSaldo(ECuenta.Text);
  DMPunteoAsientos.DameSaldoPunteado;
  DMPunteoAsientos.DameSaldoPunteadoN43;
  EFCuenta.Text := '';
end;

procedure TFMPunteoAsientos.LFDEDesdeFechaChange(Sender: TObject);
begin
  DMPunteoAsientos.FiltraPunteos(ECuenta.Text, LFDEDesdeFecha.Date, LFDEHastaFecha.Date);
  DMPunteoAsientos.DameSaldoPunteado;

  if (PNLNorma43.Visible) then
  begin
     DMPunteoAsientos.DameSaldoPunteadoN43;
     DMPunteoAsientos.AbrirNorma43(StrToIntDef(EFBanco.Text, 0));
  end;
end;

procedure TFMPunteoAsientos.LFDEHastaFechaChange(Sender: TObject);
begin
  DMPunteoAsientos.FiltraPunteos(ECuenta.Text, LFDEDesdeFecha.Date, LFDEHastaFecha.Date);
  DMPunteoAsientos.DameSaldoPunteado;

  if (PNLNorma43.Visible) then
  begin
     DMPunteoAsientos.DameSaldoPunteadoN43;
     DMPunteoAsientos.AbrirNorma43(StrToIntDef(EFBanco.Text, 0));
  end;
end;

procedure TFMPunteoAsientos.TButtMuestraNorma43Click(Sender: TObject);
begin
  // Norma 43
  // Hace visible o invisible la parte de Norma43
  PNLNorma43.Visible := not PNLNorma43.Visible;
  splNorma43.Visible := PNLNorma43.Visible;

  // Columnas y acciones habilitadas
  DBGFPunteo.FindColumn('PUNTEO').ReadOnly := PNLNorma43.Visible;
  DBGFNorma43.FindColumn('PUNTEO').ReadOnly := PNLNorma43.Visible;
  DBGFPunteo.FindColumn('PUNTEO').Field.ReadOnly := PNLNorma43.Visible;
  DBGFNorma43.FindColumn('PUNTEO').Field.ReadOnly := PNLNorma43.Visible;
  APuntearImporte.Enabled := not PNLNorma43.Visible;

  if (PNLNorma43.Visible) then
  begin
     DMPunteoAsientos.AbrirNorma43(StrToIntDef(EFBanco.Text, 0));
     DMPunteoAsientos.DameSaldoPunteadoN43;
     PNLPunteo.Align := alLeft;
     if (Left_splNorma43 = 0) then
        Left_splNorma43 := Trunc(PMain.Width / 4 * 3);

     PNLPunteo.Width := Left_splNorma43 - 1;
     splNorma43.Left := Left_splNorma43;
  end
  else
  begin
     DMPunteoAsientos.CerrarNorma43;
     PNLPunteo.Align := alClient;
  end;

  Refresh;
end;

procedure TFMPunteoAsientos.EFEntidadChange(Sender: TObject);
begin
  DMPunteoAsientos.Entidad := EFEntidad.Text;
end;

procedure TFMPunteoAsientos.TButtPunteoN43Click(Sender: TObject);
begin
  DMPunteoAsientos.FiltraN43('C.PUNTEO=1');
end;

procedure TFMPunteoAsientos.TButtNoPunteoN43Click(Sender: TObject);
begin
  DMPunteoAsientos.FiltraN43('C.PUNTEO=0');
end;

procedure TFMPunteoAsientos.TButtTodosN43Click(Sender: TObject);
begin
  DMPunteoAsientos.FiltraN43('');
end;

procedure TFMPunteoAsientos.AVincularN43Execute(Sender: TObject);
begin
  if (PNLNorma43.Visible) then // Solo si se utiliza la norma 43
  begin
     DMPunteoAsientos.VincularN43;
     DBGFPunteo.SetFocus;
     DMPunteoAsientos.DameSaldoPunteadoN43;
  end;
end;

procedure TFMPunteoAsientos.DBESaldoPunteadoN43Change(Sender: TObject);
begin
  if (DBESaldoPunteado.Text <> DBESaldoPunteadoN43.Text) then
  begin
     ColorError(DBESaldoPunteadoN43);
     ColorError(PNLNorma43);
     TBNorma43.Color := clRed;
     TBNorma43.Font.Color := clWhite;
  end
  else
  begin
     ColorInfo(DBESaldoPunteadoN43);
     ColorInfo(PNLNorma43);
     TBNorma43.Color := clBtnFace;
     TBNorma43.Font.Color := clWindowText;
  end;
end;

procedure TFMPunteoAsientos.DBGFPunteoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  cant : integer;
begin
  // Solo si se utiliza la norma 43
  if (PNLNorma43.Visible) then
  begin
     cant := DMPunteoAsientos.QMPunteosCANT_RELACIONES.AsInteger;
     // Evito obscurecer demasiado el grid
     if (Cant > 5) then
        Cant := 5;

     with TDBGridFind2000(Sender) do
     begin
        if (gdFocused in State) then
           ColorFocused(Canvas)
        else
        begin
           if (cant = 0) then
              ColorEdicion(Canvas)
           else
           begin
              Canvas.Font.Color := clBlack;
              Canvas.Brush.Color := Darken(clAqua, cant * 10); // $FF0000 - (128 + 8 * cant * $040000); {BGR-$F00000 - $000000}
           end;
        end;

        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TFMPunteoAsientos.DBGFNorma43DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Vinculado : boolean;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (DMPunteoAsientos.QMPunteos.RecordCount > 0) then
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           with DMPunteoAsientos do
              // Concateno ',' para evitar posibles falsos positivos (Ej. 123.1 <==> 123.1 / 123.11 / 123.111)
              Vinculado := (Pos(format('%d-%d-%d-%d,', [QMPunteosEJERCICIO.AsInteger, QMPunteosCANAL.AsInteger, QMPunteosRIC.AsInteger, QMPunteosLINEA.AsInteger]), QMNorma43RELACION.AsString + ',') > 0);

           if (Vinculado) then
           begin
              ColorResaltado6(Canvas);
              if (DMPunteoAsientos.QMNorma43SIGNO.AsString <> DMPunteoAsientos.QMPunteosSIGNO.AsString) then
                 ColorResaltado3(Canvas);
           end
           else
           if ((DMPunteoAsientos.QMNorma43IMPORTE.AsFloat = DMPunteoAsientos.QMPunteosIMPORTE.AsFloat) and
              (DMPunteoAsientos.QMNorma43SIGNO.AsString = DMPunteoAsientos.QMPunteosSIGNO.AsString)) then
           begin
              begin
                 if (Trunc(DMPunteoAsientos.QMPunteosFECHA.AsDateTime) = Trunc(DMPunteoAsientos.QMNorma43FECHA_OPERACION.AsDateTime)) then
                    ColorResaltado4(Canvas)
                 else
                    ColorResaltado2(Canvas);
              end;
           end;
        end;
     end; {if RecordCount>0}

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPunteoAsientos.AGeneraAsientoExecute(Sender: TObject);
var
  id, Plantilla : integer;
begin
  // Generar Asiento dependiendo del banco, concepto comun y concepto propio
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PLANTILLA FROM SYS_PLANTILLAS_CON ');
        SQL.Add(' WHERE ');
        SQL.Add(' BANCO = ?BANCO AND ');
        SQL.Add(' CONCEPTO_COMUN = ?CONCEPTO_COMUN AND ');
        SQL.Add(' CONCEPTO_PROPIO = ?CONCEPTO_PROPIO ');
        Params.ByName['BANCO'].AsInteger := DMPunteoAsientos.QMNorma43BANCO.AsInteger;
        Params.ByName['CONCEPTO_COMUN'].AsInteger := DMPunteoAsientos.QMNorma43CONCEPTO_COMUN.AsInteger;
        Params.ByName['CONCEPTO_PROPIO'].AsInteger := DMPunteoAsientos.QMNorma43CONCEPTO_PROPIO.AsInteger;
        ExecQuery;
        Plantilla := FieldByName['PLANTILLA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Plantilla <> 0) then
  begin
     AbreForm(TFMBorradorContabilidad, FMBorradorContabilidad, Self);
     FMBorradorContabilidad.CerrarAlTraspasar := True;
     with DMBorradorContabilidad do
     begin
        DePlantilla(Plantilla);
        // Pongo la fecha en la cabecera
        with QMAsientos do
        begin
           DisableControls;
           try
              Edit;
              QMAsientosFECHA.AsDateTime := DMPunteoAsientos.QMNorma43FECHA_OPERACION.AsDateTime;
              QMAsientosCANAL.AsInteger := REntorno.Canal;
              Post;
           finally
              EnableControls;
           end;
        end;

        // Pongo el importe en el detalle
        with QMApuntes do
        begin
           DisableControls;
           try
              First;
              while not (EOF) do
              begin
                 Edit;
                 QMApuntesIMPORTE.AsFloat := DMPunteoAsientos.QMNorma43IMPORTE.AsFloat;
                 Post;
                 Next;
              end;
              First;
           finally
              EnableControls;
           end;
        end;
     end;
     FMBorradorContabilidad.Hide;
     FMBorradorContabilidad.ShowModal;
  end;

  with DMPunteoAsientos do
  begin
     QMPunteos.DisableControls;
     try
        id := QMNorma43ID.AsInteger;
        QMPunteos.Close;
        QMPunteos.Open;
        Refrescar(QMNorma43, 'ID', id);
     finally
        QMPunteos.EnableControls;
     end;
  end;
end;

procedure TFMPunteoAsientos.ATesoreriaExecute(Sender: TObject);
var
  cant : integer;
  ImporteStr : string;
  s : TStrings;
  Seleccion : TFMSeleccionGrid;
  cod_cli_pro : integer;
  doc_tipo, TipoDoc : string;
  SignoCartera : string;
begin
  // Aqui debe hacer los cobros/pagos

  cod_cli_pro := 0;
  if (DMPunteoAsientos.QMNorma43SIGNO.AsString = 'H') then
     SignoCartera := 'P'
  else
     SignoCartera := 'C';

  // Buscar cuantos recibos hay de este importe
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM EMP_CARTERA_DETALLE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SIGNO = :SIGNO AND ');
        SQL.Add(' LIQUIDO = :LIQUIDO AND ');
        SQL.Add(' PAGADO = 0 AND ');
        SQL.Add(' VISIBLE = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := SignoCartera;
        Params.ByName['LIQUIDO'].AsFloat := DMPunteoAsientos.QMNorma43IMPORTE.AsFloat;
        ExecQuery;
        cant := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si solo hay uno, presento el form para pagar
  if (cant = 1) then
  begin
     // Buscar cuantos recibos hay de este importe
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SIGNO, D.REGISTRO, D.LINEA, C.COD_CLI_PRO, C.DOC_TIPO ');
           SQL.Add(' FROM EMP_CARTERA_DETALLE D ');
           SQL.Add(' JOIN EMP_CARTERA C ON C.ID_CARTERA = D.ID_CARTERA ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.SIGNO = :SIGNO AND ');
           SQL.Add(' D.LIQUIDO = :LIQUIDO AND ');
           SQL.Add(' D.PAGADO = 0 AND ');
           SQL.Add(' D.VISIBLE = 1 ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := SignoCartera;
           Params.ByName['LIQUIDO'].AsFloat := DMPunteoAsientos.QMNorma43IMPORTE.AsFloat;
           ExecQuery;
           doc_tipo := FieldByName['DOC_TIPO'].AsString;
           cod_cli_pro := FieldByName['COD_CLI_PRO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (cant > 1) then
  begin
     // Cambio comas por puntos, para que funcione en el SelectSQL
     ImporteStr := FloatToStrDec(DMPunteoAsientos.QMNorma43IMPORTE.AsFloat, '.', '0.00');

     s := TStringList.Create;
     try
        with s do
        begin
           Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SIGNO, D.REGISTRO, D.LINEA, C.COD_CLI_PRO, C.DOC_TIPO, C.DOC_SERIE, ');
           Add('        C.DOC_NUMERO, CC.TITULO, D.VENCIMIENTO ');
           Add(' FROM EMP_CARTERA_DETALLE D ');
           Add(' JOIN EMP_CARTERA C ');
           Add(' ON C.ID_CARTERA = D.ID_CARTERA ');
           Add(' JOIN CON_CUENTAS CC ');
           Add(' ON C.EMPRESA = CC.EMPRESA AND C.EJERCICIO = CC.EJERCICIO AND C.CANAL = CC.CANAL AND C.CUENTA = CC.CUENTA ');
           Add(' WHERE ');
           Add(' D.EMPRESA = ' + REntorno.EmpresaStr);
           Add(' AND D.CANAL = ' + REntorno.CanalStr);
           Add(' AND D.SIGNO = ''' + SignoCartera + '''');
           Add(' AND D.LIQUIDO = ' + ImporteStr);
           Add(' AND D.PAGADO = 0 ');
           Add(' AND D.VISIBLE = 1 ');
           Add(' AND CC.PGC = ' + IntToStr(REntorno.Pgc));
           Add(' ORDER BY D.VENCIMIENTO ');
        end;

        Seleccion := TFMSeleccionGrid.Create(Self);
        try
           with Seleccion do
           begin
              Caption := _('Selección de documento');
              AsignaSQL(s.Text);
              MostrarColumna('SIGNO', _('Signo'), 22);
              MostrarColumna('REGISTRO', _('Reg.'), 40);
              MostrarColumna('LINEA', _('Lin.'), 25);
              MostrarColumna('DOC_TIPO', _('Doc.'), 35);
              MostrarColumna('DOC_SERIE', _('Serie'), 35);
              MostrarColumna('DOC_NUMERO', _('Nro.'), 50);
              MostrarColumna('TITULO', _('Nombre'), 200);
              MostrarColumna('VENCIMIENTO', _('Venc.'), 65);
              if (ShowModal = mrCancel) then
                 cant := 0
              else
              begin
                 cant := 1;
                 doc_tipo := FDS.FieldByName('DOC_TIPO').AsString;
                 cod_cli_pro := FDS.FieldByName('COD_CLI_PRO').AsInteger;
              end;
           end;
        finally
           FreeAndNil(Seleccion);
        end;
     finally
        FreeAndNil(s);
     end;
  end;

  // Si solo hay uno, presento el form para pagar
  if (cant = 1) then
  begin
     AbreForm(TFMPagaRecibosAgr, FMPagaRecibosAgr, Self);
     with FMPagaRecibosAgr do
     begin
        CerrarAlPagar := True;

        if (DMPunteoAsientos.QMNorma43SIGNO.AsString = 'H') then
           CBSigno.ItemIndex := 1
        else
           CBSigno.ItemIndex := 0;
        CBSignoChange(Sender);

        if ((doc_tipo = 'FCR') or (doc_tipo = 'AFA')) then
           TipoDoc := 'FCR'
        else
        if ((doc_tipo = 'FAP') or (doc_tipo = 'AFP')) then
           TipoDoc := 'FAP'
        else
        if ((doc_tipo = 'FAC') or (doc_tipo = 'AFC')) then
           TipoDoc := 'FAC';

        PonDatosCli_Pro(cod_cli_pro, TipoDoc, ECuenta.Text, DMPunteoAsientos.QMNorma43FECHA_OPERACION.AsDateTime, 0);

        with DMPagaRecibosAgr do
        begin
           while ((not QMRecibos.EOF) and (QMRecibosLIQUIDO.AsFloat <> DMPunteoAsientos.QMNorma43IMPORTE.AsFloat)) do
              QMRecibos.Next;

           if (QMRecibosLIQUIDO.AsFloat = DMPunteoAsientos.QMNorma43IMPORTE.AsFloat) then
           begin
              QMRecibos.Edit;
              QMRecibosENTRADA.AsInteger := REntorno.Entrada;
              if (QMRecibos.State in [dsEdit]) then
                 QMRecibos.Post;
           end;
        end;

        Hide;
        ShowModal;
     end;
  end;

  DMPunteoAsientos.Refresca;
end;

procedure TFMPunteoAsientos.DBGFPunteoDblClick(Sender: TObject);
begin
  FMain.MuestraMovConta(' RIC= ' + DMPunteoAsientos.QMPunteosRIC.AsString + ' AND EJERCICIO=' + DMPunteoAsientos.QMPunteosEJERCICIO.AsString);
end;

procedure TFMPunteoAsientos.AListadoPunteoExecute(Sender: TObject);
begin
  AbreData(TDMLstPunteoAsientos, DMLstPunteoAsientos);
  DMLstPunteoAsientos.MostrarListado(ECuenta.Text, LFDEDesdeFecha.Date, LFDEHastaFecha.Date, 0);
  CierraData(DMLstPunteoAsientos);
end;

procedure TFMPunteoAsientos.AConfListadoPunteoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstPunteoAsientos, DMLstPunteoAsientos);
  TFMListConfig.Create(Self).Muestra(171, formato, cabecera, copias, pijama, '',
     DMLstPunteoAsientos.frPunteo);
  CierraData(DMLstPunteoAsientos);
end;

procedure TFMPunteoAsientos.APuntearImporteExecute(Sender: TObject);
begin
  inherited;
  DMPunteoAsientos.PuntearImporte;
end;

procedure TFMPunteoAsientos.APuntearImporteTodosExecute(Sender: TObject);
begin
  inherited;

  // Selecciono todo el ejercicio
  BEjercicio.Click;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT C.CUENTA ');
           SelectSQL.Add(' FROM CON_CUENTAS C ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' C.CANAL = :CANAL AND ');
           SelectSQL.Add(' C.CUENTA BETWEEN :D_CUENTA AND :H_CUENTA AND ');
           SelectSQL.Add(' C.CUENTA NOT STARTING WITH ''5720'' AND ');
           SelectSQL.Add(' C.NIVEL = 5 AND ');
           SelectSQL.Add(' EXISTS(SELECT * ');
           SelectSQL.Add('        FROM CON_CUENTAS_APUNTES A ');
           SelectSQL.Add('        WHERE ');
           SelectSQL.Add('        A.EMPRESA = C.EMPRESA AND ');
           SelectSQL.Add('        A.EJERCICIO = C.EJERCICIO AND ');
           SelectSQL.Add('        A.CANAL = C.CANAL AND ');
           SelectSQL.Add('        A.CUENTA = C.CUENTA) ');
           SelectSQL.Add(' ORDER BY C.CUENTA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['D_CUENTA'].AsString := '4';
           Params.ByName['H_CUENTA'].AsString := '5999';
           Open;
           while not EOF do
           begin
              // Selecciono cuenta
              EFCuenta.Text := FieldByName('CUENTA').AsString;
              // Procesos posteriores a seleccionar cuenta (totales, paneles, etc.)
              Expande;

              // Punteo por importes de la cuenta
              APuntearImporte.Execute;

              Application.ProcessMessages;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMPunteoAsientos.TBSincronizaPunteoClick(Sender: TObject);
begin
  inherited;
  with TBSincronizaPunteo do
  begin
     if (ImageIndex = 67) then
     begin
        ImageIndex := 68;
        Caption := _('Fija Punteo');
        Hint := _('Fija Punteo - Mantiene el registro seleccionado');
        DMPunteoAsientos.SincronizaNorma43(False);
     end
     else
     begin
        ImageIndex := 67;
        Caption := _('Sincroniza Punteo');
        Hint := _('Sincroniza Punteo - Busca un registro compatible para vinculacion');
        DMPunteoAsientos.SincronizaNorma43(True);
     end;
  end;
end;

procedure TFMPunteoAsientos.BEjercicioClick(Sender: TObject);
var
  FecIni, FecFin : TDateTime;
begin
  inherited;

  DameMinMax('EJE', FecIni, FecFin);
  LFDEDesdeFecha.Date := HourIntoDate(FecIni, '00:00:00');
  LFDEHastaFecha.Date := HourIntoDate(FecFin, '23:59:59');
end;

procedure TFMPunteoAsientos.BMesClick(Sender: TObject);
begin
  inherited;

  LFDEDesdeFecha.Date := RecodeDay(Today, 1);
  LFDEHastaFecha.Date := RecodeDay(Today, DaysInMonth(Today));
end;

procedure TFMPunteoAsientos.BSemanaClick(Sender: TObject);
var
  Dia : word;
begin
  inherited;
  Dia := DayOfTheWeek(Today);
  LFDEDesdeFecha.Date := Today - Dia + 1;
  LFDEHastaFecha.Date := Today + (7 - Dia);
end;

procedure TFMPunteoAsientos.BMesAnteriorClick(Sender: TObject);
begin
  inherited;

  LFDEDesdeFecha.Date := IncMonth(LFDEDesdeFecha.Date, -1);
  LFDEDesdeFecha.Date := RecodeDay(LFDEDesdeFecha.Date, 1);
  LFDEHastaFecha.Date := IncMonth(LFDEHastaFecha.Date, -1);
  LFDEHastaFecha.Date := RecodeDay(LFDEHastaFecha.Date, DaysInMonth(LFDEHastaFecha.Date));
end;

procedure TFMPunteoAsientos.BMesSiguienteClick(Sender: TObject);
begin
  inherited;

  LFDEDesdeFecha.Date := IncMonth(LFDEDesdeFecha.Date, 1);
  LFDEDesdeFecha.Date := RecodeDay(LFDEDesdeFecha.Date, 1);
  LFDEHastaFecha.Date := IncMonth(LFDEHastaFecha.Date, 1);
  LFDEHastaFecha.Date := RecodeDay(LFDEHastaFecha.Date, DaysInMonth(LFDEHastaFecha.Date));
end;

procedure TFMPunteoAsientos.CBSepararImportesClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := EncuentraField(DBGFPunteo, 'IMPORTE');
  if (i >= 0) then
     DBGFPunteo.Columns[i].Visible := not CBSepararImportes.Checked
  else
  begin
     with DBGFPunteo.Columns.Add do
     begin
        FieldName := 'IMPORTE_Importe';
        Title.Caption := _('Importe');
        Visible := not CBSepararImportes.Checked;
     end;
  end;

  i := EncuentraField(DBGFPunteo, 'IMPORTE_DEBE');
  if (i >= 0) then
     DBGFPunteo.Columns[i].Visible := CBSepararImportes.Checked
  else
  begin
     with DBGFPunteo.Columns.Add do
     begin
        FieldName := 'IMPORTE_DEBE';
        Title.Caption := _('Debe');
        Visible := CBSepararImportes.Checked;
     end;
  end;

  i := EncuentraField(DBGFPunteo, 'IMPORTE_HABER');
  if (i >= 0) then
     DBGFPunteo.Columns[i].Visible := CBSepararImportes.Checked
  else
  begin
     with DBGFPunteo.Columns.Add do
     begin
        FieldName := 'IMPORTE_HABER';
        Title.Caption := _('Haber');
        Visible := CBSepararImportes.Checked;
     end;
  end;
end;

procedure TFMPunteoAsientos.FormActivate(Sender: TObject);
begin
  inherited;
  CBSepararImportesClick(Sender);
end;

procedure TFMPunteoAsientos.AImportarNorma43Execute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ANorma43Kri);
end;

procedure TFMPunteoAsientos.splNorma43Moved(Sender: TObject);
begin
  inherited;
  Left_splNorma43 := splNorma43.Left;
end;

end.
