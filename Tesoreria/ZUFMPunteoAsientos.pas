unit ZUFMPunteoAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ToolWin, ComCtrls, UNavigator,
  UHYDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  UEditPanel, Menus, UTeclas, UControlEdit, Mask, DBCtrls, UFormGest,
  URightMaskEdit, NsDBGrid, ULFEdit, ULFDBEdit, ULFPanel, ULFToolBar,
  ULFEditFind2000, ULFLabel, rxToolEdit, ULFDateEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, dbcgrids, ULFDBCtrlGrid, DB, HYFIBQuery,
  RXDBCtrl, ActnList, rxPlacemnt, ULFFormStorage;

type
  TZFMPunteoAsientos = class(TG2KForm)
     TBMain: TLFToolBar;
     PNLMain: TLFPanel;
     NavMain: THYMNavigator;
     DBGFPunteo: TDBGridFind2000;
     TButtSep1: TToolButton;
     PNLTBMain: TLFPanel;
     LDigiteCuenta: TLFLabel;
     EPPunteo: THYMEditPanel;
     TButtSep2: TToolButton;
     CEPunteo: TControlEdit;
     CEPunteoPMEdit: TPopUpTeclas;
     TButtSep3: TToolButton;
     TBPunteo: TLFToolBar;
     PNLTB2: TLFPanel;
     LCuenta: TLFLabel;
     EFCuenta: TLFEditFind2000;
     LSaldo: TLFLabel;
     ESaldoAnterior: TLFEdit;
     LSaldoPunteado: TLFLabel;
     ESaldoPunteado: TLFEdit;
     ToolButton1: TToolButton;
     ActionList1: TActionList;
     AVincularN43: TAction;
     PFiltroFechas: TLFPanel;
     LFEntreFechaKri: TLFLabel;
     LFDEDesdeFecha: TLFDateEdit;
     LFDEHastaFecha: TLFDateEdit;
     AGeneraAsiento: TAction;
     ATesoreria: TAction;
     FSMain: TLFFibFormStorage;
     ECuenta: TLFEdit;
     ETituloCuenta: TLFEdit;
     ETotalCreditoPunteado: TLFEdit;
     LTotalCreditoPost: TLFLabel;
     ETotalDebitoPunteado: TLFEdit;
     LTotalDebitoPost: TLFLabel;
     LNetoEnTransito: TLFLabel;
     ESaldoTransito: TLFEdit;
     LDebitoEnTranisto: TLFLabel;
     ETotalDebitoTransito: TLFEdit;
     LCreditoEnTransito: TLFLabel;
     ETotalCrebitoTransito: TLFEdit;
     LDiferencia: TLFLabel;
     EDiferencia: TLFEdit;
     PNLNorma43: TLFPanel;
     TBN43: TLFToolBar;
     TButtPunteoN43: TToolButton;
     TButtNoPunteoN43: TToolButton;
     LBanco: TLFLabel;
     EFBanco: TLFEditFind2000;
     ToolButton4: TToolButton;
     LEntidad: TLFLabel;
     EFEntidad: TLFEditFind2000;
     ToolButton3: TToolButton;
     TButtVincularN43: TToolButton;
     ToolButton2: TToolButton;
     LSaldoPunteadoN43: TLFLabel;
     ESaldoPunteadoN43: TLFEdit;
     ToolButton5: TToolButton;
     TBGeneraAsiento: TToolButton;
     LApuntesKri: TLFLabel;
     ToolButton6: TToolButton;
     TBTesoreria: TToolButton;
     LRecibos: TLFLabel;
     PNLDetalleNorma43: TLFPanel;
     DBImporte: TDBText;
     DBTTitConceptoComun: TDBText;
     DBConcComun: TDBText;
     DBConcPropio: TDBText;
     DBTTitConceptoPropio: TDBText;
     DBFecOperacion: TDBText;
     DBFecValor: TDBText;
     DBReferencia1: TDBText;
     DBReferencia2: TDBText;
     LNorma43Det: TLFLabel;
     LFDBCBPunteoN43: TLFDBCheckBox;
     DBGFNorma43: TDBGridFind2000;
     Splitter1: TSplitter;
     EBalanceSBanco: TLFEdit;
     LBalanceSBanco: TLFLabel;
     LBalanceSLibro: TLFLabel;
     EBalanceSegunLibro: TLFEdit;
     chkTransitos: TLFCheckBox;
     chkPunteados: TLFCheckBox;
     BFiltra: TButton;
     PNLSeleccionTraPro: TLFPanel;
     PNLActualizaDatos: TLFPanel;
     TButtDisenarListado: TToolButton;
     ADisenarListado: TAction;
     LBalanceLibro: TLFLabel;
     EBalanceLibro: TLFEdit;
     LTotalDebito: TLFLabel;
     ETotalDebito: TLFEdit;
     LTotalCredito: TLFLabel;
     ETotalCredito: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
     procedure ESaldoPunteadoN43Change(Sender: TObject);
     procedure DBGFPunteoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AGeneraAsientoExecute(Sender: TObject);
     procedure ATesoreriaExecute(Sender: TObject);
     procedure DBGFPunteoDblClick(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure BFiltraClick(Sender: TObject);
     procedure EPPunteoClickImprime(Sender: TObject; var Continua: boolean);
     procedure ADisenarListadoExecute(Sender: TObject);
     procedure EBalanceSBancoChange(Sender: TObject);
  private
     { Private declarations }
     WidthOriginal: integer;  {dji lrk kri - Norma 43}
     CuentaKri: string;
     InResize: boolean;
     procedure Filtrame(Filtro: string);
  public
     { Public declarations }
     procedure Filtra;
  end;

var
  ZFMPunteoAsientos : TZFMPunteoAsientos;

implementation

uses ZUDMPunteoAsientos, UDMMain, UEntorno, UFMain, UUtiles,
  UFMBorradorContabilidad, UDMBorradorContabilidad, UFMPagaRecibosAgr,
  UDMPagaRecibosAgr, UFMSeleccionGrid, DateUtils, ZUDMLstPunteoAsientos,
  UFMListConfig, UParam, UDameDato;

{$R *.DFM}

procedure TZFMPunteoAsientos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TZDMPunteoAsientos, ZDMPunteoAsientos);
  FMain.AddComponentePunto(EFCuenta);
  EFCuenta.MaxLength := REntorno.DigitosSub;
  ControlEdit := CEPunteo;
  LFDEDesdeFecha.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  LFDEHastaFecha.Date := EncodeDateTime(REntorno.Ejercicio, 12, 31, 23, 59, 59, 999);

  {dji lrk kri - Norma 43}
  ZDMPunteoAsientos.CerrarNorma43; {Lo abre el cambio de LFDEDesdeFecha y LFDEHastaFecha}
  // PNLNorma43.Visible := False;
  // Splitter1.Visible := False;
  Width := 750;
  WidthOriginal := Width;
  if (LeeParametro('MODNORMA43') <> 'S') then
  // TButtMuestraNorma43.Visible := True
  else
     // TButtMuestraNorma43.Visible := False;
     InResize := False;
end;

procedure TZFMPunteoAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(EFCuenta);
  CierraData(ZDMPunteoAsientos);
  Action := caFree;
end;

procedure TZFMPunteoAsientos.Filtrame(Filtro: string);
var
  Parametro : TParametroFiltrado;
begin
  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     Parametro.SQLBase.Text := ZDMPunteoAsientos.SQLBase.Text;
     Parametro.Tabla := ZDMPunteoAsientos.QMPunteos;
     DMMain.FiltraSQL(Parametro, False);
     with ZDMPunteoAsientos.QMPunteos do
     begin
        Params.ByName['CUENTA'].AsString := CuentaKri;
        Params.ByName['DFECHA'].AsDateTime := LFDEDesdeFecha.Date;
        Params.ByName['HFECHA'].AsDateTime := HourIntoDate(LFDEHastaFecha.Date, '23:59:59');
        Open;
     end;
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;
end;

procedure TZFMPunteoAsientos.TButtPunteoClick(Sender: TObject);
begin
  Filtrame('p.PUNTEO=1');
  //  ESaldoPunteado.Text := ZDMPunteoAsientos.DameSaldoPunteado;
  //  ESaldoPunteadoN43.Text := ZDMPunteoAsientos.DameSaldoPunteadoN43;
end;

procedure TZFMPunteoAsientos.TButtNoPunteoClick(Sender: TObject);
begin
  Filtrame('p.PUNTEO=0');
  // ESaldoPunteado.Text := ZDMPunteoAsientos.DameSaldoPunteado;
  // ESaldoPunteadoN43.Text := ZDMPunteoAsientos.DameSaldoPunteadoN43;
end;

procedure TZFMPunteoAsientos.EFCuentaExit(Sender: TObject);
begin
  // ZDMPunteoAsientos.ActualizaCalculos;
  CuentaKri := EFCuenta.Text; {dji lrk kri}
  ECuenta.Text := CuentaKri;
  ETituloCuenta.Text := DameTituloCuenta(CuentaKri);
end;

procedure TZFMPunteoAsientos.LFDEDesdeFechaChange(Sender: TObject);
begin
  with ZDMPunteoAsientos.QMPunteos do
  begin
     if (Active) then
     begin
        Close;
        try
           Params.ByName['DFECHA'].AsDateTime := LFDEDesdeFecha.Date;
           Params.ByName['HFECHA'].AsDateTime := HourIntoDate(LFDEHastaFecha.Date, '23:59:59');
        finally
           Open;
        end;
     end;
  end;
  // ESaldoPunteado.Text := ZDMPunteoAsientos.DameSaldoPunteado;
  if (PNLNorma43.Visible) then {dji lrk kri}
  begin
     ESaldoPunteadoN43.Text := ZDMPunteoAsientos.DameSaldoPunteadoN43;
     ZDMPunteoAsientos.AbrirNorma43;
  end;
end;

procedure TZFMPunteoAsientos.LFDEHastaFechaChange(Sender: TObject);
begin
  with ZDMPunteoAsientos.QMPunteos do
  begin
     if (Active) then
     begin
        Close;
        try
           Params.ByName['DFECHA'].AsDateTime := LFDEDesdeFecha.Date;
           Params.ByName['HFECHA'].AsDateTime := HourIntoDate(LFDEHastaFecha.Date, '23:59:59');
        finally
           Open;
        end;
     end;
  end;
  // ESaldoPunteado.Text := ZDMPunteoAsientos.DameSaldoPunteado;
  if (PNLNorma43.Visible) then {dji lrk kri}
  begin
     ESaldoPunteadoN43.Text := ZDMPunteoAsientos.DameSaldoPunteadoN43;
     ZDMPunteoAsientos.AbrirNorma43;
  end;
end;

procedure TZFMPunteoAsientos.TButtMuestraNorma43Click(Sender: TObject);
begin
  {dji lrk kri - Norma 43}
  {Hace visible o invisible la parte de Norma43}
  PNLNorma43.Visible := not PNLNorma43.Visible;
  Splitter1.Visible := PNLNorma43.Visible;
  PNLNorma43.Left := Splitter1.Left + Splitter1.Width;
  if (PNLNorma43.Visible) then
  begin
     ZDMPunteoAsientos.AbrirNorma43;
     Constraints.MinWidth := 750 + Splitter1.Width + PNLNorma43.Width + 8;

     if (WindowState <> wsMaximized) then
        Width := PNLMain.Width + Splitter1.Width + PNLNorma43.Width + 8;
     ESaldoPunteadoN43.Text := ZDMPunteoAsientos.DameSaldoPunteadoN43;
     DBGFPunteo.FindColumn('PUNTEO').ReadOnly := True;
     DBGFNorma43.FindColumn('PUNTEO').ReadOnly := True;
     DBGFPunteo.FindColumn('PUNTEO').Field.ReadOnly := True;
     DBGFNorma43.FindColumn('PUNTEO').Field.ReadOnly := True;
  end
  else
  begin
     ZDMPunteoAsientos.CerrarNorma43;
     Constraints.MinWidth := 750;
     if (WindowState <> wsMaximized) then
        Width := 0;
     DBGFPunteo.FindColumn('PUNTEO').ReadOnly := False;
     DBGFNorma43.FindColumn('PUNTEO').ReadOnly := False;
     DBGFPunteo.FindColumn('PUNTEO').Field.ReadOnly := False;
     DBGFNorma43.FindColumn('PUNTEO').Field.ReadOnly := False;
  end;
  if (WindowState <> wsMaximized) then
     if (Left + Width > Screen.Width) then
        Left := Screen.Width - Width;
  Refresh;
end;

procedure TZFMPunteoAsientos.EFEntidadChange(Sender: TObject);
begin
  {dji lrk kri - Norma 43}
  ZDMPunteoAsientos.Entidad := EFEntidad.Text;
end;

procedure TZFMPunteoAsientos.TButtPunteoN43Click(Sender: TObject);
begin
  {dji lrk kri - Norma 43}
  ZDMPunteoAsientos.FiltraN43('c.PUNTEO=1');
end;

procedure TZFMPunteoAsientos.TButtNoPunteoN43Click(Sender: TObject);
begin
  {dji lrk kri - Norma 43}
  ZDMPunteoAsientos.FiltraN43('c.PUNTEO=0');
end;

procedure TZFMPunteoAsientos.AVincularN43Execute(Sender: TObject);
begin
  {dji lrk kri - Norma 43}
  if (PNLNorma43.Visible) then {Solo si se utiliza la norma 43}
  begin
     ZDMPunteoAsientos.VincularN43;
     DBGFPunteo.SetFocus;
     ESaldoPunteadoN43.Text := ZDMPunteoAsientos.DameSaldoPunteadoN43;
  end;
end;

procedure TZFMPunteoAsientos.ESaldoPunteadoN43Change(Sender: TObject);
begin
  if (ESaldoPunteado.Text <> ESaldoPunteadoN43.Text) then
  begin
     ESaldoPunteadoN43.Color := clRed;
     ESAldoPunteadoN43.Font.Color := clWhite;
     ESAldoPunteadoN43.Font.Style := [fsBold];
     // Beep;
  end
  else
  begin
     ESaldoPunteadoN43.Color := clInfoBk;
     ESAldoPunteadoN43.Font.Color := clGrayText;
     ESAldoPunteadoN43.Font.Style := [];
  end;
end;

procedure TZFMPunteoAsientos.DBGFPunteoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  cant : integer;
begin
  if (PNLNorma43.Visible) then {Solo si se utiliza la norma 43}
  begin
     cant := 0; //ZDMPunteoAsientos.QMPunteosRELACIONES.AsInteger;

     with DBGFPunteo do
     begin
        if (cant > 0) then
        begin
           Canvas.Font.Color := clBlack;
           Canvas.Brush.Color := clWindow;
           if (gdFocused in State) //If the cell has the focus
           then
           begin
              Canvas.Font.Color := clWhite;
              Canvas.Brush.Color := clHighlight;
           end
           else
           begin
              Canvas.Font.Color := clBlack;
              Canvas.Brush.Color := $FF0000 - (128 + 8 * cant * $040000); {BGR-$F00000 - $000000}
           end;
        end;
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TZFMPunteoAsientos.DBGFNorma43DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Vinculado : boolean;
begin
  with DBGFNorma43 do
  begin
     if (ZDMPunteoAsientos.QMPunteos.RecordCount > 0) then
     begin
        Vinculado := (ZDMPunteoAsientos.QMNorma43RIC.AsInteger = ZDMPunteoAsientos.QMPunteosRIC.AsInteger) and (ZDMPunteoAsientos.QMNorma43LINEA.AsInteger = ZDMPunteoAsientos.QMPunteosLINEA.AsInteger);
        if (Vinculado) then
        begin
           if (gdFocused in State) then //If the cell has the focus
           begin
              Canvas.Font.Color := clWhite;
              Canvas.Brush.Color := clHighlight;
           end
           else
           begin
              Canvas.Font.Color := clBlack;
              Canvas.Brush.Color := clAqua;
           end;
        end
        else
        if ((ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat = ZDMPunteoAsientos.QMPunteosIMPORTE.AsFloat) and
           (ZDMPunteoAsientos.QMNorma43SIGNO.AsString = ZDMPunteoAsientos.QMPunteosSIGNO.AsString)) then
        begin
           if (gdFocused in State) then //If the cell has the focus
           begin
              Canvas.Font.Color := clWhite;
              Canvas.Brush.Color := clHighlight;
           end
           else
           begin
              if (Trunc(ZDMPunteoAsientos.QMPunteosFECHA.AsDateTime) = Trunc(ZDMPunteoAsientos.QMNorma43FECHA_OPERACION.AsDateTime)) then
              begin
                 Canvas.Font.Color := clWhite;
                 Canvas.Brush.Color := clGreen;
              end
              else
              begin
                 Canvas.Font.Color := clBlack;
                 Canvas.Brush.Color := clLime;
              end;
           end;
        end;
     end; {if RecordCount>0}
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with}
end;

procedure TZFMPunteoAsientos.AGeneraAsientoExecute(Sender: TObject);
var
  Q : THYFIBQuery;
  plantilla : integer;
  id : integer;
begin
  {Generar Asiento dependiendo del banco, concepto comun y concepto propio}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select plantilla from sys_plantillas_con ' +
        'where banco=?banco and concepto_comun=?concepto_comun and concepto_propio=?concepto_propio';
     Params.ByName['BANCO'].AsInteger := ZDMPunteoAsientos.QMNorma43BANCO.AsInteger;
     Params.ByName['CONCEPTO_COMUN'].AsInteger := ZDMPunteoAsientos.QMNorma43CONCEPTO_COMUN.AsInteger;
     Params.ByName['CONCEPTO_PROPIO'].AsInteger := ZDMPunteoAsientos.QMNorma43CONCEPTO_PROPIO.AsInteger;
     ExecQuery;
     plantilla := FieldByName['PLANTILLA'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (plantilla <> 0) then
  begin
     AbreForm(TFMBorradorContabilidad, FMBorradorContabilidad, Self);
     FMBorradorContabilidad.CerrarAlTraspasar := True;
     with DMBorradorContabilidad do
     begin
        DePlantilla(plantilla);
        {Pongo la fecha en la cabecera}
        QMAsientos.DisableControls;
        QMAsientos.Edit;
        QMAsientosFECHA.AsDateTime := ZDMPunteoAsientos.QMNorma43FECHA_OPERACION.AsDateTime;
        QMAsientos.Post;
        QMAsientos.EnableControls;

        {Pongo el importe en el detalle}
        QMApuntes.DisableControls;
        QMApuntes.First;
        while not (QMApuntes.EOF) do
        begin
           QMApuntes.Edit;
           QMApuntesIMPORTE.AsFloat := ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat;
           QMApuntes.Post;
           QMApuntes.Next;
        end;
        QMApuntes.First;
        QMApuntes.EnableControls;
     end;
     FMBorradorContabilidad.Hide;
     FMBorradorContabilidad.ShowModal;
  end;
  with ZDMPunteoAsientos do
  begin
     QMNorma43.DisableControls;
     QMPunteos.DisableControls;
     id := QMNorma43ID.AsInteger;
     QMNorma43.Close;
     QMPunteos.Close;
     QMPunteos.Open;
     QMNorma43.Open;
     while ((not QMNorma43.EOF) and (id <> QMNorma43ID.AsInteger)) do
        QMNorma43.Next;
     QMNorma43.EnableControls;
     QMPunteos.EnableControls;
  end;
end;

procedure TZFMPunteoAsientos.ATesoreriaExecute(Sender: TObject);
var
  Q : THYFIBQuery;
  cant : integer;
  ImporteStr : string;
  s : TStrings;
  Seleccion : TFMSeleccionGrid;
  cod_cli_pro : integer;
  doc_tipo : string;
  SignoCartera : string;
begin
  {Aqui debe hacer los cobros/pagos}

  cod_cli_pro := 0;
  if (ZDMPunteoAsientos.QMNorma43SIGNO.AsString = 'H') then
     SignoCartera := 'P'
  else
     SignoCartera := 'C';

  {Buscar cuantos recibos hay de este importe}
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
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
        Params.ByName['LIQUIDO'].AsFloat := ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat;
        ExecQuery;
        cant := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  {si solo hay uno, presento el form para pagar}
  if (cant = 1) then
  begin
     {Buscar cuantos recibos hay de este importe}
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
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
           Params.ByName['LIQUIDO'].AsFloat := ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat;
           ExecQuery;
           doc_tipo := FieldByName['DOC_TIPO'].AsString;
           cod_cli_pro := FieldByName['COD_CLI_PRO'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  if (cant > 1) then
  begin
     {cambio comas por puntos, para que funcione en el SelectSQL}
     ImporteStr := FloatToStrDec(ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat, '.', '0.00');

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

  {si solo hay uno, presento el form para pagar}
  if (cant = 1) then
  begin
     AbreForm(TFMPagaRecibosAgr, FMPagaRecibosAgr, Self);
     with FMPagaRecibosAgr do
     begin
        CerrarAlPagar := True;

        if (ZDMPunteoAsientos.QMNorma43SIGNO.AsString = 'H') then
           CBSigno.ItemIndex := 1
        else
           CBSigno.ItemIndex := 0;
        CBSignoChange(Sender);

        if (((doc_tipo = 'FCR') or (doc_tipo = 'AFA')) and (LBLCliPro.Caption = 'Proveedor')) then
           TButtPermutaProvAcreeClick(Sender);

        EFCli_Pro.Text := IntToStr(cod_cli_pro);
        EFCtaPago.Text := CuentaKri;
        DTPFecha.Date := ZDMPunteoAsientos.QMNorma43FECHA_OPERACION.AsDateTime;

        with DMPagaRecibosAgr do
        begin
           while ((not QMRecibos.EOF) and (QMRecibosLIQUIDO.AsFloat <> ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat)) do
              QMRecibos.Next;

           if (QMRecibosLIQUIDO.AsFloat = ZDMPunteoAsientos.QMNorma43IMPORTE.AsFloat) then
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

  ZDMPunteoAsientos.Refresca;
end;

procedure TZFMPunteoAsientos.DBGFPunteoDblClick(Sender: TObject);
begin
  FMain.MuestraMovConta(' RIC= ' + ZDMPunteoAsientos.QMPunteosRIC.AsString + ' and ejercicio=' + ZDMPunteoAsientos.QMPunteosEJERCICIO.AsString);
end;

procedure TZFMPunteoAsientos.FormResize(Sender: TObject);
begin
  if (not InResize) then
  begin
     if (WindowState = wsMaximized) then
     begin
        InResize := True;
        if (PNLNorma43.Visible) then
           Width := PNLMain.Width + Splitter1.Width + PNLNorma43.Width + 8
        else
           Width := PNLMain.Width;

        if (Left + Width > Screen.Width) then
           Left := Screen.Width - Width;
        InResize := False;
     end;
  end;
end;

procedure TZFMPunteoAsientos.Filtra;
var
  T, P : string;
begin
  ZDMPunteoAsientos.QMPunteos.Close;
  ZDMPunteoAsientos.QMPunteos.SelectSQL.Clear;
  // ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('SELECT p.* from VER_CUENTAS_PUNTEOS p WHERE (p.EMPRESA=?EMPRESA AND p.EJERCICIO=?EJERCICIO AND p.CANAL=?CANAL AND p.CUENTA=?CUENTA)');
  ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('SELECT p.* from VER_CUENTAS_PUNTEOS p WHERE (p.EMPRESA=?EMPRESA AND p.CANAL=?CANAL AND p.CUENTA=?CUENTA)');
  t := '';
  p := '';
  if (chkTransitos.Checked and chkPunteados.Checked) then
     ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('AND ( ((p.fecha <= ?fecha2) AND ( (p.punteo=0) OR (p.fecha_punteo > ?fecha2 AND p.punteo=1))) OR (p.fecha_punteo = ?fecha2 and p.punteo=1) )')
  else
  begin
     if chkTransitos.Checked then //TRANSITOS
     begin
        // ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('AND ((p.fecha <= ?fecha2) AND (p.punteo=0) and (p.fecha_punteo < ?fecha2))');
        ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('AND ( (p.fecha <= ?fecha2) AND ( (p.punteo=0) OR (p.fecha_punteo > ?fecha2 AND p.punteo=1)))');
     end;
     if chkPunteados.Checked then //PUNTEADOS
        ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('AND (p.fecha_punteo = ?fecha2 and p.punteo=1)');
  end;
  ZDMPunteoAsientos.QMPunteos.SelectSQL.Add('ORDER BY P.FECHA');
  ZDMPunteoAsientos.QMPunteos.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  // ZDMPunteoAsientos.QMPunteos.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  ZDMPunteoAsientos.QMPunteos.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  ZDMPunteoAsientos.QMPunteos.Params.ByName['CUENTA'].AsString := CuentaKri;
  if (chkTransitos.Checked or chkPunteados.Checked) then
  begin
     // ZDMPunteoAsientos.QMPunteos.Params.ByName['fecha1'].AsDateTime := LFDEDesdeFecha.Date;
     ZDMPunteoAsientos.QMPunteos.Params.ByName['fecha2'].AsDateTime := LFDEHastaFecha.Date + 0.99999;
  end;
  // ShowMessage(ZDMPunteoAsientos.QMPunteos.SelectSQL.Text);
  ZDMPunteoAsientos.QMPunteos.Open;
  ZDMPunteoAsientos.CuentaKri := Self.CuentaKri;
end;

procedure TZFMPunteoAsientos.BFiltraClick(Sender: TObject);
begin
  Filtra;
  ZDMPunteoAsientos.ActualizaCalculos;
end;

procedure TZFMPunteoAsientos.EPPunteoClickImprime(Sender: TObject; var Continua: boolean);
begin
  AbreData(TZDMLstPunteoAsientos, ZDMLstPunteoAsientos);
  ZDMLstPunteoAsientos.Muestra(0, ECuenta.Text, LFDEDesdeFecha.Date, LFDEHastaFecha.Date);
  CierraData(ZDMLstPunteoAsientos);
end;

procedure TZFMPunteoAsientos.ADisenarListadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TZDMLstPunteoAsientos, ZDMLstPunteoAsientos);
  TFMListConfig.Create(Self).Muestra(999, Formato, Cabecera, Copias,
     Pijama, '', ZDMLstPunteoAsientos.frPunteos);
  CierraData(ZDMLstPunteoAsientos);
end;

procedure TZFMPunteoAsientos.EBalanceSBancoChange(Sender: TObject);
begin
  ZDMPunteoAsientos.ActualizaCalculos;
end;

end.
