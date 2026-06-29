unit UCrmFMConsultaAcciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UNavigator, ExtCtrls, ULFPanel, ToolWin, ULFToolBar,
  ActnList, StdCtrls, DBCtrls, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ImgList, Menus, UTeclas, UControlEdit, UFormGest,
  ULFEditFind2000, rxPlacemnt, ULFFormStorage, ULFLabel, DB,
  ULFActionList, Mask, rxToolEdit, ULFDateEdit, ULFPageControl, ULFDBEdit,
  Buttons, ULFComboBox, DateUtils, ULFDBMemo, ULFDBEditFind2000, ULFEdit,
  UFPEditSinNavegador, UEditPanel, UDBDateTimePicker, RXDBCtrl,
  ULFDBDateEdit;

type
  TCrmFMConsultaAcciones = class(TFPEditSinNavegador)
     PNLFiltroSeguimientos: TLFPanel;
     PNLNotas: TLFPanel;
     PNLDatosSeguimiento: TLFPanel;
     DBreNotas: TDBRichEdit;
     ALEdit: TActionList;
     EditUndoCmd: TAction;
     EditCutCmd: TAction;
     EditCopyCmd: TAction;
     EditPasteCmd: TAction;
     EditFontCmd: TAction;
     TBEdit: TLFToolBar;
     TButtUndo: TToolButton;
     TButtCut: TToolButton;
     TButtCopy: TToolButton;
     TButtPaste: TToolButton;
     TSepEdit1: TToolButton;
     FontDialog1: TFontDialog;
     TButtNegrita: TToolButton;
     TButtCursiva: TToolButton;
     TButtSubrayado: TToolButton;
     TSepEdit3: TToolButton;
     TButtLeftAlign: TToolButton;
     TButtCenterAlign: TToolButton;
     TButtRightAlign: TToolButton;
     PMListado: TPopupMenu;
     ListadodelInforme1: TMenuItem;
     Configuracin1: TMenuItem;
     ListadodelInforme2: TMenuItem;
     PnlFiltros: TLFPanel;
     LblAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     EFContacto: TLFEditFind2000;
     LblContacto: TLFLabel;
     DBGFSeguimientos: TDBGridFind2000;
     LblTipo: TLFLabel;
     LblFecha: TLFLabel;
     EFTipo: TLFEditFind2000;
     TButtColor: TToolButton;
     ToolButton4: TToolButton;
     TBNotasAccion: TLFToolBar;
     ToolButton5: TToolButton;
     TButtListados: TToolButton;
     ALAcciones: TLFActionList;
     AAImprimir: TAction;
     DEFechaAccion: TLFDateEdit;
     FontName: TLFComboBox;
     FontSize: TLFEdit;
     UpDown: TUpDown;
     ToolButton6: TToolButton;
     ToolButton7: TToolButton;
     PNLSeguimientos: TLFPanel;
     PNLDatosAccion: TLFPanel;
     TBSeguimientos: TLFToolBar;
     NavSeg: THYMNavigator;
     AContacto: TAction;
     LFPanelAccionesDet: TLFPanel;
     LSeguimientos: TLFLabel;
     LFDBNif: TLFDbedit;
     LFDBNomCom: TLFDbedit;
     LFDBDireccion: TLFDbedit;
     LFDBTelefono: TLFDbedit;
     LNombreComercial: TLFLabel;
     LDireccion: TLFLabel;
     LNIF: TLFLabel;
     LTelefono: TLFLabel;
     LFPanelContacto: TLFPanel;
     LContacto: TLFLabel;
     LFecha: TLFLabel;
     LFFechaTipo: TLFComboBox;
     LFPanelAccCom: TLFPanel;
     LAccionComercial: TLFLabel;
     LFechaAccionComercial: TLFLabel;
     LTituloAccionComercia: TLFLabel;
     LFDBAccCom: TLFDbedit;
     LFDBFechaAccCom: TLFDbedit;
     TBAccionComercial: TLFToolBar;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     ToolButton2: TToolButton;
     ToolButton9: TToolButton;
     TBNuevoSeg: TToolButton;
     TBCierra: TToolButton;
     LFFinalizadoSeg: TLFComboBox;
     LEstado: TLFLabel;
     LFAccion: TLFLabel;
     EFAccion: TLFEditFind2000;
     TBMail: TToolButton;
     TBFax: TToolButton;
     CBTipoSeguimiento: TLFComboBox;
     LFiltroTipoSeguimiento: TLFLabel;
     ToolButton8: TToolButton;
     LEmail: TLFLabel;
     LFDBMail: TLFDbedit;
     LAgente: TLFLabel;
     DBEAgente: TLFDbedit;
     LTipoAccion: TLFLabel;
     DBETipoAccion: TLFDbedit;
     LFDBTAccion: TLFDbedit;
     LFDBAgente: TLFDbedit;
     PMCerrar: TPopupMenu;
     CerrarSeguimientoActual1: TMenuItem;
     CerrarAccinActual1: TMenuItem;
     PNLContacto: TLFPanel;
     DBGPersonasContacto: TDBGridFind2000;
     LPersonasContacto: TLFLabel;
     DBRichEdit1: TDBRichEdit;
     LFLabelDoc: TLFLabel;
     DBEFEjercicioDocumentoAsociado: TLFDBEditFind2000;
     DBEFDocumentoAsociado: TLFDBEditFind2000;
     SBDocumentoAsociado: TSpeedButton;
     ADocumentoAsociado: TAction;
     ToolButton1: TToolButton;
     Splitter1: TSplitter;
     TrBProgresoSeg: TTrackBar;
     LProgresoSeg: TLFLabel;
     PNLProgresoAcc: TLFPanel;
     LProgresoAcc: TLFLabel;
     TrBProgresoAcc: TTrackBar;
     PNLIdAccion: TLFPanel;
     LIdAccion: TLFLabel;
     DBEIdAccion: TLFDbedit;
     PNLIdSeguimiento: TLFPanel;
     LIdSeguimiento: TLFLabel;
     DBEIdSeguimiento: TLFDbedit;
     TBSep1: TToolButton;
     TBRefrescar: TToolButton;
     LFiltroAccionComercial: TLFLabel;
     EFAccionComercial: TLFEditFind2000;
     LIdContacto: TLFLabel;
     DBEIdContacto: TLFDbedit;
     splSegtop: TSplitter;
     splSegBottom: TSplitter;
     ASeguimiento: TAction;
     AAccion: TAction;
     PNLNotasSeguimiento: TLFPanel;
     LTipoSeguimiento: TLFLabel;
     DBETipoSeguimiento: TLFDbedit;
     PNLSeguimiento: TLFPanel;
     LDescripcinSeguimiento: TLFLabel;
     DBEDescripcionseguimiento: TLFDbedit;
     DBDEFechaAccionProx: TLFDBDateEdit;
     LFechaSeguimiento: TLFLabel;
     DBDTPFechaPrevista: TDBDateTimePicker;
     BLimpiaFiltroAgente: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EditUndo(Sender: TObject);
     procedure EditCut(Sender: TObject);
     procedure EditCopy(Sender: TObject);
     procedure EditPaste(Sender: TObject);
     procedure SelectFont(Sender: TObject);
     procedure TButtNegritaClick(Sender: TObject);
     procedure TButtCursivaClick(Sender: TObject);
     procedure TButtSubrayadoClick(Sender: TObject);
     procedure TButtAlignClick(Sender: TObject);
     procedure FontNameChange(Sender: TObject);
     procedure FontSizeChange(Sender: TObject);
     procedure ALEditUpdate(Action: TBasicAction; var Handled: boolean);
     procedure SelectionChange(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure EFContactoChange(Sender: TObject);
     procedure EFTipoChange(Sender: TObject);
     procedure PNLDatosSeguimientoExit(Sender: TObject);
     procedure TButtColorClick(Sender: TObject);
     procedure DBreNotasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure AContactoExecute(Sender: TObject);
     procedure LFFechaTipoChange(Sender: TObject);
     procedure TBNuevoSegClick(Sender: TObject);
     procedure TBCierraClick(Sender: TObject);
     procedure LFFinalizadoSegChange(Sender: TObject);
     procedure EFAccionBusqueda(Sender: TObject);
     procedure EFAccionChange(Sender: TObject);
     procedure TBMailClick(Sender: TObject);
     procedure CBTipoSeguimientoChange(Sender: TObject);
     procedure DEFechaAccionChange(Sender: TObject);
     procedure CerrarSeguimientoActual1Click(Sender: TObject);
     procedure CerrarAccinActual1Click(Sender: TObject);
     procedure NavNotasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure ADocumentoAsociadoExecute(Sender: TObject);
     procedure SBDocumentoAsociadoDblClick(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure FormPaint(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure NavSegClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEIdSeguimientoChange(Sender: TObject);
     procedure DBEIdAccionChange(Sender: TObject);
     procedure TBRefrescarClick(Sender: TObject);
     procedure DBGFSeguimientosDblClick(Sender: TObject);
     procedure EFAccionComercialChange(Sender: TObject);
     procedure DBEIdContactoDblClick(Sender: TObject);
     procedure DBEIdAccionDblClick(Sender: TObject);
     procedure DBEIdSeguimientoDblClick(Sender: TObject);
     procedure ASeguimientoExecute(Sender: TObject);
     procedure AAccionExecute(Sender: TObject);
     procedure DBETipoSeguimientoChange(Sender: TObject);
     procedure BLimpiaFiltroAgenteClick(Sender: TObject);
  private
     { Private declarations }
     FUpdating: boolean;
     Filtrando: boolean;
     AgenteUsuario: integer;
     FiltraContactoAccion, FiltraContactoAccionDetalle: boolean;
     function CurrText: TTextAttributes;
     procedure GetFontNames;
     procedure SetEditRect;
     function FiltroFin: smallint;
     function FiltroTipoSeguimiento: string;
  public
     { Public declarations }
     procedure ComprobarValorDefecto;
     procedure Filtra;
  end;

var
  CrmFMConsultaAcciones : TCrmFMConsultaAcciones;

implementation

uses UDMMain, RichEdit, UCrmDMConsultaAcciones, //UDMLstPeticiones,
  UEntorno, ShellApi, UCrmFMContactos, UCrmDMConfiguracion,
  UFMain, UUtiles, UDameDato;

const
  GutterWid = 6;

{$R *.dfm}

procedure TCrmFMConsultaAcciones.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TCrmDMConsultaAcciones, CrmDMConsultaAcciones);

  GetFontNames;

  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  SelectionChange(Self);

  FiltraContactoAccion := False;
  FiltraContactoAccionDetalle := False;

  SolapaControles(SBDocumentoAsociado, DBEFDocumentoAsociado);
  DBEFDocumentoAsociado.Color := REntorno.ColorEnlaceActivo;

  DBEIdAccion.Color := REntorno.ColorEnlaceActivo;
  DBEIdSeguimiento.Color := REntorno.ColorEnlaceActivo;
  DBEIdContacto.Color := REntorno.ColorEnlaceActivo;

  // Inicializo Filtros
  try
     Filtrando := True;
     LFFinalizadoSeg.ItemIndex := 0;
     LFFechaTipo.ItemIndex := 4;
     LblFecha.Enabled := True;
     DEFechaAccion.Enabled := True;
     DEFechaAccion.Date := Date;

     // Restriccion de agente por usuario
     AgenteUsuario := DameAgenteUsuario(REntorno.Usuario);
     EFAgente.Text := '';
     if (AgenteUsuario <> 0) then
        EFAgente.Text := IntToStr(AgenteUsuario);

     EFAgente.Enabled := True;
     EFAgente.ReadOnly := False;
     EFAgente.Color := clWindow;
     EFContacto.CondicionBusqueda := '';
     if DameRestriccionAgenteUsuario(REntorno.Usuario) then
     begin
        EFAgente.Enabled := False;
        EFAgente.ReadOnly := True;
        EFAgente.Color := clInfoBk;
        EFContacto.CondicionBusqueda := 'AGENTE = ' + IntToStr(AgenteUsuario);
        BLimpiaFiltroAgente.Visible := False;
     end;

     CrmDMConsultaAcciones.RellenaTipoSeguimiento(CBTipoSeguimiento.Items);
     CBTipoSeguimiento.ItemIndex := 0;
  finally
     Filtrando := False;
  end;

  Filtra;
end;

procedure TCrmFMConsultaAcciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(CrmDMConsultaAcciones);
end;

procedure TCrmFMConsultaAcciones.EditUndo(Sender: TObject);
begin
  with DBreNotas do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TCrmFMConsultaAcciones.EditCut(Sender: TObject);
begin
  DBreNotas.CutToClipboard;
end;

procedure TCrmFMConsultaAcciones.EditCopy(Sender: TObject);
begin
  DBreNotas.CopyToClipboard;
end;

procedure TCrmFMConsultaAcciones.EditPaste(Sender: TObject);
begin
  DBreNotas.PasteFromClipboard;
end;

procedure TCrmFMConsultaAcciones.SelectFont(Sender: TObject);
begin
  FontDialog1.Font.Assign(DBreNotas.SelAttributes);
  if FontDialog1.Execute then
     CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  if DBreNotas.CanFocus then
     DBreNotas.SetFocus;
end;

procedure TCrmFMConsultaAcciones.TButtNegritaClick(Sender: TObject);
begin
  if FUpdating then
     Exit;
  if TButtNegrita.Down then
     CurrText.Style := CurrText.Style + [fsBold]
  else
     CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TCrmFMConsultaAcciones.TButtCursivaClick(Sender: TObject);
begin
  if FUpdating then
     Exit;
  if TButtCursiva.Down then
     CurrText.Style := CurrText.Style + [fsItalic]
  else
     CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TCrmFMConsultaAcciones.TButtSubrayadoClick(Sender: TObject);
begin
  if FUpdating then
     Exit;
  if TButtSubrayado.Down then
     CurrText.Style := CurrText.Style + [fsUnderline]
  else
     CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TCrmFMConsultaAcciones.TButtAlignClick(Sender: TObject);
begin
  if FUpdating then
     Exit;
  DBreNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TCrmFMConsultaAcciones.FontNameChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TCrmFMConsultaAcciones.FontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TCrmFMConsultaAcciones.ALEditUpdate(Action: TBasicAction; var Handled: boolean);
begin
  { Update the status of the edit commands }
  EditCutCmd.Enabled := DBreNotas.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if DBreNotas.HandleAllocated then
  begin
     EditUndoCmd.Enabled := DBreNotas.Perform(EM_CANUNDO, 0, 0) <> 0;
     EditPasteCmd.Enabled := DBreNotas.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
end;

function TCrmFMConsultaAcciones.CurrText: TTextAttributes;
begin
  if DBreNotas.SelLength > 0 then
     Result := DBreNotas.SelAttributes
  else
     Result := DBreNotas.DefAttributes;
end;

procedure TCrmFMConsultaAcciones.FormPaint(Sender: TObject);
begin
  inherited;
  SetEditRect;
end;

procedure TCrmFMConsultaAcciones.SetEditRect;
var
  R : TRect;
begin
  with DBreNotas do
  begin
     R := Rect(GutterWid, 0, ClientWidth - GutterWid, ClientHeight);
     SendMessage(Handle, EM_SETRECT, 0, longint(@R));
  end;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TCrmFMConsultaAcciones.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TCrmFMConsultaAcciones.FormResize(Sender: TObject);
begin
  inherited;
  SetEditRect;
  SelectionChange(Sender);
  SolapaControles(SBDocumentoAsociado, DBEFDocumentoAsociado);
  DBEFDocumentoAsociado.Color := REntorno.ColorEnlaceActivo;
end;

procedure TCrmFMConsultaAcciones.SelectionChange(Sender: TObject);
begin
  with DBreNotas.Paragraph do
     try
        FUpdating := True;
        // FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
        // LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
        // RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
        TButtNegrita.Down := fsBold in DBreNotas.SelAttributes.Style;
        TButtCursiva.Down := fsItalic in DBreNotas.SelAttributes.Style;
        TButtSubrayado.Down := fsUnderline in DBreNotas.SelAttributes.Style;

        FontSize.Text := IntToStr(DBreNotas.SelAttributes.Size);
        FontName.Text := DBreNotas.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlign.Down := True;
           1: TButtRightAlign.Down := True;
           2: TButtCenterAlign.Down := True;
        end;
        // UpdateCursorPos;
     finally
        FUpdating := False;
     end;
end;

procedure TCrmFMConsultaAcciones.EFAgenteChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.EFContactoChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.EFTipoChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.Filtra;
var
  Any, Mes, Dia : word;
  DataFiltrar, DataFiltrar2 : TDateTime;
  TipoFecha : integer;
begin
  if not Filtrando then
  begin
     try
        Filtrando := True;
        {Hoy
        Semana Actual
        Mes Actual
        Año Actual
        }
        DataFiltrar := Date;
        DataFiltrar2 := 0;
        TipoFecha := 0;
        DecodeDate(Date, any, mes, dia);

        // Filtramo per el dia de hoy
        if (LFFechaTipo.ItemIndex = 0) then
           TipoFecha := 1
        // Setmana Actual
        else if (LFFechaTipo.ItemIndex = 1) then
        begin
           DataFiltrar := EndOfAWeek(any, WeekOfTheYear(Date), 1);
           DataFiltrar2 := EndOfAWeek(any, WeekOfTheYear(Date), 7);
           TipoFecha := 1;
        end
        // Mes Actual
        else if (LFFechaTipo.ItemIndex = 2) then
        begin
           DataFiltrar := EncodeDate(Any, Mes, 1);
           DataFiltrar2 := EncodeDate(Any, Mes, DaysInAMonth(Any, Mes));
           TipoFecha := 1;
        end
        // Any Actual
        else if (LFFechaTipo.ItemIndex = 3) then
        begin
           DataFiltrar := EncodeDate(Any, 1, 1);
           DataFiltrar2 := EncodeDate(Any, 12, 31);
           TipoFecha := 1;
        end
        else if (LFFechaTipo.ItemIndex = 4) then
        begin
           DataFiltrar := DEFechaAccion.Date;
        end;

        CrmDMConsultaAcciones.Filtra(StrToIntDef(EFAgente.Text, 0), StrToIntDef(EFContacto.Text, 0), StrToIntDef(EFAccionComercial.Text, 0), EFTipo.Text,
           DataFiltrar, FiltroFin, TipoFecha, DataFiltrar2, StrToIntDef(EFAccion.Text, -1),
           FiltroTipoSeguimiento);

        CrmDMConsultaAcciones.xSeguimiento.FetchAll;
        LSeguimientos.Caption := format(_('Seguimientos') + ' - %d', [CrmDMConsultaAcciones.xSeguimiento.RecordCount]);

        // sfg.albert - Desconnecto el botó si estic mirant seguiments finalitzats
        if (LFFinalizadoSeg.ItemIndex <> 1) then
        begin
           TBCierra.Enabled := True;
           TBNuevoSeg.Enabled := True;
        end
        else
        begin
           TBCierra.Enabled := False;
           TBNuevoSeg.Enabled := False;
        end;
     finally
        Filtrando := False;
     end;
  end;
end;

function TCrmFMConsultaAcciones.FiltroFin: smallint;
begin
  if (LFFinalizadoSeg.ItemIndex = 0) then // Pendientes
     Result := 0
  else if (LFFinalizadoSeg.ItemIndex = 1) then // Finalizados
     Result := 1
  else if (LFFinalizadoSeg.ItemIndex = 2) then // Todos
     Result := 2
  else
     Result := -1;
end;

procedure TCrmFMConsultaAcciones.PNLDatosSeguimientoExit(Sender: TObject);
begin
  // Faig el Post al Memo, si està en mode edició
  if (CrmDMConsultaAcciones.QMAccionesSeg.State in [dsEdit]) then
     CrmDMConsultaAcciones.QMAccionesSeg.Post;
end;

procedure TCrmFMConsultaAcciones.TButtColorClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBRENotas.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText.Color := ColorSeleccionado
  else
     CurrText.Color := ColorDefecto;
end;

procedure TCrmFMConsultaAcciones.DBreNotasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if (Button = mbRight) and (Trim(DBRENotas.SelText) <> '') then
  begin
     if FileExists(Trim(DBRENotas.SelText)) then
        DMMain.AbrirArchivo(Trim(DBRENotas.SelText))
     else
        ShowMessage(_('El archivo no existe'));
  end;
end;

procedure TCrmFMConsultaAcciones.ComprobarValorDefecto;
var
  crm_tamany_letra, crm_auto_accion, crm_avisos : integer;
  crm_tipo_letra, crm_accion_defecto : string;
begin
  AbreData(TCrmDMConfiguracion, CrmDMConfiguracion);
  CrmDMConfiguracion.LeeDatos(crm_tamany_letra, crm_tipo_letra, crm_auto_accion, crm_avisos, crm_accion_defecto);

  FUpdating := True;

  DBreNotas.Font.Size := crm_tamany_letra;
  DBreNotas.Font.Name := crm_tipo_letra;
  CurrText.Size := crm_tamany_letra;
  FontName.Text := crm_tipo_letra;
  FontSize.Text := IntToStr(crm_tamany_letra);
  UpDown.Position := crm_tamany_letra;

  FUpdating := False;

  CierraData(CrmDMConfiguracion);
end;

procedure TCrmFMConsultaAcciones.AContactoExecute(Sender: TObject);
var
  AgenteFiltro : integer;
begin
  FMain.EjecutaAccion(FMain.ACrmContactos);

  AgenteFiltro := 0;
  // Comprobamos la restriccion de agente
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
     AgenteFiltro := AgenteUsuario;

  CrmFMContactos.FiltroContactos('id_contacto=' + IntToStr(CrmDMConsultaAcciones.xContactosID_CONTACTO.AsInteger), AgenteFiltro);
end;

procedure TCrmFMConsultaAcciones.AAccionExecute(Sender: TObject);
var
  AgenteFiltro, IdAccion : integer;
begin
  inherited;

  FMain.EjecutaAccion(FMain.ACrmContactos);

  AgenteFiltro := 0;
  // Comprobamos la restriccion de agente
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
     AgenteFiltro := AgenteUsuario;

  IdAccion := CrmDMConsultaAcciones.xSeguimientoID_ACCION.AsInteger;
  CrmFMContactos.FiltroContactos('id_contacto=' + IntToStr(CrmDMConsultaAcciones.xContactosID_CONTACTO.AsInteger), AgenteFiltro, IdAccion);
end;

procedure TCrmFMConsultaAcciones.ASeguimientoExecute(Sender: TObject);
var
  AgenteFiltro, IdAccion, IdAccionDet : integer;
begin
  inherited;

  FMain.EjecutaAccion(FMain.ACrmContactos);

  AgenteFiltro := 0;
  // Comprobamos la restriccion de agente
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
     AgenteFiltro := AgenteUsuario;

  IdAccion := CrmDMConsultaAcciones.xSeguimientoID_ACCION.AsInteger;
  IdAccionDet := CrmDMConsultaAcciones.xSeguimientoID_ACCION_DET.AsInteger;
  CrmFMContactos.FiltroContactos('id_contacto=' + IntToStr(CrmDMConsultaAcciones.xContactosID_CONTACTO.AsInteger), AgenteFiltro, IdAccion, IdAccionDet);
end;

procedure TCrmFMConsultaAcciones.LFFechaTipoChange(Sender: TObject);
begin
  LblFecha.Enabled := False;
  DEFechaAccion.Enabled := False;

  if (LFFechaTipo.ItemIndex = 4) then
  begin
     LblFecha.Enabled := True;
     DEFechaAccion.Enabled := True;
     DEFechaAccion.Clear;
     if DEFechaAccion.CanFocus then
        DEFechaAccion.SetFocus;
     DEFechaAccion.Date := Date;
  end;

  Filtra;
end;

procedure TCrmFMConsultaAcciones.TBNuevoSegClick(Sender: TObject);
begin
  CrmDMConsultaAcciones.ObrirSeguiment('I');
end;

procedure TCrmFMConsultaAcciones.TBCierraClick(Sender: TObject);
begin
  CerrarSeguimientoActual1Click(Sender);
end;

procedure TCrmFMConsultaAcciones.LFFinalizadoSegChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.EFAccionBusqueda(Sender: TObject);
begin
  if (EFContacto.Text <> '') then
     EFAccion.CondicionBusqueda := 'id_contacto=' + EFContacto.Text;
end;

procedure TCrmFMConsultaAcciones.EFAccionChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.TBMailClick(Sender: TObject);
begin
  if ShellExecute(Application.Handle, nil, PChar('mailto:' + CrmDMConsultaAcciones.xContactosEMAIL.AsString)
     , nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en el Mail'));
end;

function TCrmFMConsultaAcciones.FiltroTipoSeguimiento: string;
begin
  if (CBTipoSeguimiento.ItemIndex = 0) then
     Result := 'TOT' // Mostrar todos
  else
     Result := Trim(Copy(CBTipoSeguimiento.Text, 1, Pos('-', CBTipoSeguimiento.Text) - 1));
end;

procedure TCrmFMConsultaAcciones.CBTipoSeguimientoChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.DEFechaAccionChange(Sender: TObject);
begin
  Filtra;
end;

procedure TCrmFMConsultaAcciones.CerrarSeguimientoActual1Click(Sender: TObject);
begin
  CrmDMConsultaAcciones.TancaSegActual(CrmDMConsultaAcciones.xSeguimientoID_ACCION_DET.AsInteger);
  Filtra;
end;

procedure TCrmFMConsultaAcciones.CerrarAccinActual1Click(Sender: TObject);
begin
  CrmDMConsultaAcciones.TancaAccActual(CrmDMConsultaAcciones.xSeguimientoID_ACCION.AsInteger);
  Filtra;
end;

procedure TCrmFMConsultaAcciones.NavNotasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  Continua := False;
  if (Button = nbEdit) then
     CrmDMConsultaAcciones.ObrirSeguiment('E');
  if (Button = nbInsert) then
     CrmDMConsultaAcciones.ObrirSeguiment('I');
  DBEIdSeguimientoChange(Sender);
end;

procedure TCrmFMConsultaAcciones.ADocumentoAsociadoExecute(Sender: TObject);
begin
  CrmDMConsultaAcciones.MuestraDocumentoAsociado;
end;

procedure TCrmFMConsultaAcciones.SBDocumentoAsociadoDblClick(Sender: TObject);
begin
  ADocumentoAsociado.Execute;
end;

procedure TCrmFMConsultaAcciones.FormActivate(Sender: TObject);
begin
  inherited;
  SelectionChange(Self);
  if DBGFSeguimientos.CanFocus then
     DBGFSeguimientos.SetFocus;
end;

procedure TCrmFMConsultaAcciones.NavSegClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  LSeguimientos.Caption := format(_('Seguimientos') + ' - %d', [CrmDMConsultaAcciones.xSeguimiento.RecordCount]);
end;

procedure TCrmFMConsultaAcciones.DBEIdSeguimientoChange(Sender: TObject);
begin
  inherited;
  TrBProgresoSeg.Position := (CrmDMConsultaAcciones.xSeguimientoPROGRESO.AsInteger div 10);
  SelectionChange(Sender);
end;

procedure TCrmFMConsultaAcciones.DBEIdAccionChange(Sender: TObject);
begin
  inherited;
  TrBProgresoAcc.Position := (CrmDMConsultaAcciones.xSeguimientoPROGRESO_ACCION.AsInteger div 10);
end;

procedure TCrmFMConsultaAcciones.TBRefrescarClick(Sender: TObject);
begin
  inherited;
  CrmDMConsultaAcciones.RefrescarSeguimiento;
  DBEIdAccionChange(Sender);
  DBEIdSeguimientoChange(Sender);
end;

procedure TCrmFMConsultaAcciones.DBGFSeguimientosDblClick(Sender: TObject);
begin
  inherited;
  ASeguimiento.Execute;
end;

procedure TCrmFMConsultaAcciones.EFAccionComercialChange(Sender: TObject);
begin
  inherited;
  Filtra;
end;

procedure TCrmFMConsultaAcciones.DBEIdContactoDblClick(Sender: TObject);
begin
  inherited;
  AContacto.Execute;
end;

procedure TCrmFMConsultaAcciones.DBEIdAccionDblClick(Sender: TObject);
begin
  inherited;
  AAccion.Execute;
end;

procedure TCrmFMConsultaAcciones.DBEIdSeguimientoDblClick(Sender: TObject);
begin
  inherited;
  ASeguimiento.Execute;
end;

procedure TCrmFMConsultaAcciones.DBETipoSeguimientoChange(Sender: TObject);
begin
  inherited;
  if (CrmDMConsultaAcciones.xTipoAccSegTIPO_SEG.AsString = 'CEL') then
  begin
     TBMail.Enabled := True;
     TBFax.Enabled := False;
  end
  else
  if (CrmDMConsultaAcciones.xTipoAccSegTIPO_SEG.AsString = 'FAX') then
  begin
     TBFax.Enabled := True;
     TBMail.Enabled := False;
  end
  else
  begin
     TBFax.Enabled := False;
     TBMail.Enabled := False;
  end;
end;

procedure TCrmFMConsultaAcciones.BLimpiaFiltroAgenteClick(Sender: TObject);
begin
  inherited;
  EFAgente.Text := '';
end;

end.
