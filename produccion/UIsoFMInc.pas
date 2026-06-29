unit UIsoFMInc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, DBCtrls, StdCtrls, Mask,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  URightMaskEdit, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, rxToolEdit, RXDBCtrl,
  TFlatCheckBoxUnit, ULFCheckBox, UG2kTBLoc, ULFEdit, ImgList, ULFLabel,
  ULFFIBDBEditFind, Buttons, ULFDBDateEdit, ULFComboBox, ShellAPI;

type
  TIsoFMINC = class(TFPEdit)
     LBLRIC: TLFLabel;
     LBLTipo: TLFLabel;
     LbTercero: TLFLabel;
     LBLLugar: TLFLabel;
     LBLSerieDoc: TLFLabel;
     LBLNDoc: TLFLabel;
     LBLDescripcion: TLFLabel;
     LBLFechaInc: TLFLabel;
     LBLResponsable: TLFLabel;
     DBETituloEmpleado: TLFDbedit;
     LBLPorClas: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     DBETituloTipo: TLFDbedit;
     DBEFTercero: TLFDBEditFind2000;
     DBETituloTercero: TLFDbedit;
     DBEFResponsable: TLFDBEditFind2000;
     DBCBPiezas: TLFDBCheckBox;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBEDescripcion: TLFDbedit;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDet: THYMNavigator;
     LActuacion: TLFLabel;
     DBCBTirar: TLFDBCheckBox;
     DBCBRecuperar: TLFDBCheckBox;
     DBCBDevolver: TLFDBCheckBox;
     DBCBAceptar: TLFDBCheckBox;
     DBCBOtros: TLFDBCheckBox;
     DBMemo: TLFDBMemo;
     DBCBVBCalidad: TLFDBCheckBox;
     DBCBRespDepart: TLFDBCheckBox;
     PCDetalle: TLFPageControl;
     TSDetAccion: TTabSheet;
     TSDetArticulos: TTabSheet;
     DBGFDetalle: TDBGridFind2000;
     DBGFDetArticulo: TDBGridFind2000;
     LCantidad: TLFLabel;
     DBECantidad: TLFDbedit;
     CEDetArt: TControlEdit;
     CEDetArtPMEdit: TPopUpTeclas;
     ToolButton2: TToolButton;
     LFFEchaCierre: TLFLabel;
     DBETituloDocumento: TLFDbedit;
     DBEFDocumento: TLFDBEditFind2000;
     DBEFFactorCla: TLFDBEditFind2000;
     DBETituloFactorCla: TLFDbedit;
     DBENDev: TLFDbedit;
     DBECodigo: TLFDbedit;
     DBETituloDepartamento: TLFDbedit;
     LDepartamento: TLFLabel;
     DBEdFDepartamento: TLFDBEditFind2000;
     DBMEvidencia: TLFDBMemo;
     LEvidencia: TLFLabel;
     DBENDocCli: TLFDbedit;
     DBESuRef: TLFDbedit;
     LNDoc: TLFLabel;
     LSuRef: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AInformeNoCon: TAction;
     DBDTPFechaInc: TLFDBDateEdit;
     LFCategoryAction2: TLFCategoryAction;
     AConfInformeNoCon: TAction;
     TSNotas: TTabSheet;
     LFPNotas: TLFPanel;
     DBMNotas: TDBRichEdit;
     TButtNotas: TLFToolBar;
     TButtUndo: TToolButton;
     TButtCut: TToolButton;
     TButtCopy: TToolButton;
     TButtPaste: TToolButton;
     ToolButton6: TToolButton;
     FontName: TLFComboBox;
     FontSize: TLFEdit;
     UpDown1: TUpDown;
     ToolButton3: TToolButton;
     TButtNegrita: TToolButton;
     TButtCursiva: TToolButton;
     TButtSubrayado: TToolButton;
     ToolButton7: TToolButton;
     TButtLeftAlign: TToolButton;
     TButtCenterAlign: TToolButton;
     TButtRightAlign: TToolButton;
     ToolButton1: TToolButton;
     TButtColor: TToolButton;
     DBRicNotas: TLFDbedit;
     DBEDescTerceroNotas: TLFDbedit;
     DBETerceroNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     TBNotas: TLFToolBar;
     ToolButton4: TToolButton;
     ToolButton5: TToolButton;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     DBEDoc: TLFDBEditFind2000;
     DBESerieDoc: TLFDBEditFind2000;
     ToolButton8: TToolButton;
     TButtNotasDetalle: TToolButton;
     ALInc: TLFActionList;
     ANotasDetalle: TAction;
     LCosteAcciones: TLFLabel;
     LFDBCosteAcc: TLFDbedit;
     LFDContador: TLFDbedit;
     LContador: TLFLabel;
     AEtiquetasNoCon: TAction;
     AEtiquetadNoconf: TAction;
     TBAcciones: TToolButton;
     AAcciones: TAction;
     ADevolucion: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ADevolucionArt: TAction;
     SBADevolver: TSpeedButton;
     ADevolver: TAction;
     SBADoc: TSpeedButton;
     AAbreDocs: TAction;
     DBFEchaCierre: TLFDBDateEdit;
     LbCliPro: TLFLabel;
     LFDBECliPro: TLFDBEditFind2000;
     LFDbDescCliPro: TLFEdit;
     LFDBCosteINC: TLFDbedit;
     ALstResumenInc: TAction;
     AConfInformeLstResumenInc: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AAdjuntoIncidencia: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
     procedure InformeNoConformidad1Click(Sender: TObject);
     procedure DBCBTirarClick(Sender: TObject);
     procedure DBCBRecuperarClick(Sender: TObject);
     procedure DBCBDevolverClick(Sender: TObject);
     procedure DBCBAceptarClick(Sender: TObject);
     procedure DBCBOtrosClick(Sender: TObject);
     procedure TSDetArticulosShow(Sender: TObject);
     procedure TSDetAccionShow(Sender: TObject);
     procedure CBLugarINCExit(Sender: TObject);
     procedure DBCBFactorClaExit(Sender: TObject);
     procedure DBCBPiezasClick(Sender: TObject);
     procedure CBFactorClaExit(Sender: TObject);
     procedure AccinPreventivaCorrectora1Click(Sender: TObject);
     procedure PCDetalleChange(Sender: TObject);
     procedure AInformeNoConExecute(Sender: TObject);
     procedure AConfInformeNoConExecute(Sender: TObject);
     procedure TButtUndoClick(Sender: TObject);
     procedure TButtCutClick(Sender: TObject);
     procedure TButtCopyClick(Sender: TObject);
     procedure TButtPasteClick(Sender: TObject);
     procedure FontNameChange(Sender: TObject);
     procedure FontSizeChange(Sender: TObject);
     procedure TButtNegritaClick(Sender: TObject);
     procedure TButtCursivaClick(Sender: TObject);
     procedure TButtSubrayadoClick(Sender: TObject);
     procedure TButtLeftAlignClick(Sender: TObject);
     procedure TButtCenterAlignClick(Sender: TObject);
     procedure TButtRightAlignClick(Sender: TObject);
     procedure TButtColorClick(Sender: TObject);
     procedure SelectionChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEDocBusqueda(Sender: TObject);
     procedure DBEFTipoChange(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure AEtiquetasNoConExecute(Sender: TObject);
     procedure AEtiquetadNoconfExecute(Sender: TObject);
     procedure AAccionesExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure ADevolucionArtExecute(Sender: TObject);
     procedure SBADevolverDblClick(Sender: TObject);
     procedure ADevolverExecute(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure SBADocDblClick(Sender: TObject);
     procedure AAbreDocsExecute(Sender: TObject);
     procedure LFDBECliProBusqueda(Sender: TObject);
     procedure DBEFTerceroBusqueda(Sender: TObject);
     procedure LFDBECliProChange(Sender: TObject);
     procedure ALstResumenIncExecute(Sender: TObject);
     procedure AConfInformeLstResumenIncExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAdjuntoIncidenciaExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     FUpdating: boolean;
     function CurrText(Notas: TDBRichEdit): TTextAttributes;
     procedure GetFontNames;
  public
     { Public declarations }
     procedure FiltraInciencia(Incidencia: integer);
     procedure VisualizaEtiCliProv;
     procedure Filtrar(Filtro: string);
     procedure LimpiaFormulario; //sfg.albert
  end;

var
  IsoFMINC : TIsoFMINC;

implementation

uses UDMMain, UIsoDMInc, UFormGest, UUtiles, UEntorno,
  UDMListados, UFMListConfig, UFMNotasCampo, UFMain, UProFMOrden, URecibeFicheros, UFMAdjunto, UDMAdjunto;

{$R *.DFM}

procedure TIsoFMINC.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreData(TIsoDMInc, IsoDMInc);
  AbreData(TDMListados, DMListados);

  // Formatació texte
  GetFontNames;
  SelectionChange(Self);

  CurrText(DBMNotas).Name := DefFontData.Name;
  CurrText(DBMNotas).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  // NO EM FA CAS EL FONTSIZE

  NavMain.DataSource := IsoDMInc.DSQMInc;
  EPMain.DataSource := IsoDMInc.DSQMInc;
  DBGMain.DataSource := IsoDMInc.DSQMInc;
  NavDet.DataSource := IsoDMInc.DSQMDetalle;
  DBGFDetalle.DataSource := IsoDMInc.DSQMDetalle;
  CEMainPMEdit.Teclas := DMMain.teclas;
  PCDetalle.ActivePage := TSDetArticulos;

  G2KTableLoc.DataSource := IsoDMInc.DSQMInc;

  PCDetalle.ActivePage := TSDetArticulos;

  DBENDev.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBADevolver, DBENDev);
  SolapaControles(SBADoc, DBEDoc);
end;

procedure TIsoFMINC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMInc);
end;

procedure TIsoFMINC.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMInc.BusquedaCompleja;
end;

procedure TIsoFMINC.TbuttCompClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TIsoFMINC.InformeNoConformidad1Click(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  IsoDMInc.QMDetArticulos.Close;
  IsoDMInc.QMDetArticulos.Open;

  DMListados.Imprimir(8022, 0, '', str, IsoDMInc.frIsoInc, nil);

  {with IsoDMInc.frHYIsoInc do
    begin
      LoadFromFIB(9003,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;

procedure TIsoFMINC.DBCBTirarClick(Sender: TObject);
begin
  inherited;
  if DBCBTirar.Checked = True then
  begin
     DBCBRecuperar.Checked := False;
     IsoDMInc.QMIncRECUPERAR_ISO.AsInteger := 0;
     DBCBDevolver.Checked := False;
     IsoDMInc.QMIncDEVOLVER.AsInteger := 0;
     DBCBAceptar.Checked := False;
     IsoDMInc.QMIncACEPTAR.AsInteger := 0;
     DBCBOtros.Checked := False;
     IsoDMInc.QMIncOTROS.AsInteger := 0;
  end;
end;

procedure TIsoFMINC.DBCBRecuperarClick(Sender: TObject);
begin
  inherited;
  if DBCBrecuperar.Checked = True then
  begin
     DBCBTirar.Checked := False;
     IsoDMInc.QMIncTIRAR.AsInteger := 0;
     DBCBDevolver.Checked := False;
     IsoDMInc.QMIncdevolver.AsInteger := 0;
     DBCBAceptar.Checked := False;
     IsoDMInc.QMIncACEPTAR.AsInteger := 0;
     DBCBOtros.Checked := False;
     IsoDMInc.QMIncOTROS.AsInteger := 0;
  end;
end;

procedure TIsoFMINC.DBCBDevolverClick(Sender: TObject);
begin
  inherited;
  if DBCBDevolver.Checked = True then
  begin
     DBCBRecuperar.Checked := False;
     IsoDMInc.QMIncRECUPERAR_ISO.AsInteger := 0;
     DBCBTirar.Checked := False;
     IsoDMInc.QMIncTIRAR.AsInteger := 0;
     DBCBAceptar.Checked := False;
     IsoDMInc.QMIncACEPTAR.AsInteger := 0;
     DBCBOtros.Checked := False;
     IsoDMInc.QMIncOTROS.AsInteger := 0;
     DBENDev.Visible := True;
  end
  else
     DBENDev.Visible := False;
end;

procedure TIsoFMINC.DBCBAceptarClick(Sender: TObject);
begin
  inherited;
  if DBCBAceptar.Checked = True then
  begin
     DBCBRecuperar.Checked := False;
     IsoDMInc.QMIncRECUPERAR_ISO.AsInteger := 0;
     DBCBDevolver.Checked := False;
     IsoDMInc.QMIncDEVOLVER.AsInteger := 0;
     DBCBTirar.Checked := False;
     IsoDMInc.QMIncTIRAR.AsInteger := 0;
     DBCBOtros.Checked := False;
     IsoDMInc.QMIncTIRAR.AsInteger := 0;
  end;
end;

procedure TIsoFMINC.DBCBOtrosClick(Sender: TObject);
begin
  inherited;
  if DBCBOtros.Checked = True then
  begin
     DBCBRecuperar.Checked := False;
     IsoDMInc.QMIncRECUPERAR_ISO.AsInteger := 0;
     DBCBDevolver.Checked := False;
     IsoDMInc.QMIncDEVOLVER.AsInteger := 0;
     DBCBAceptar.Checked := False;
     IsoDMInc.QMIncACEPTAR.AsInteger := 0;
     DBCBTirar.Checked := False;
     IsoDMInc.QMIncTIRAR.AsInteger := 0;
  end;
end;

procedure TIsoFMINC.TSDetArticulosShow(Sender: TObject);
begin
  inherited;
  NavDet.ControlEdit := CEDetArt;
  NavDet.DataSource := IsoDMInc.DSQMDetArticulos;
end;

procedure TIsoFMINC.TSDetAccionShow(Sender: TObject);
begin
  inherited;
  NavDet.ControlEdit := CEDetalle;
  NavDet.DataSource := IsoDMInc.DSQMDetalle;
  TBAcciones.Enabled := True;
end;

procedure TIsoFMINC.CBLugarINCExit(Sender: TObject);
begin
  inherited;
  // DBESerieDoc.SetFocus;
end;

procedure TIsoFMINC.DBCBFactorClaExit(Sender: TObject);
begin
  inherited;
  DBEDescripcion.SetFocus;
end;

procedure TIsoFMINC.DBCBPiezasClick(Sender: TObject);
begin
  inherited;
  if DBCBPiezas.Checked = True then
  begin
     IsoDMInc.QMIncFECHA_CIERRE.AsDateTime := REntorno.FechaTrabSH;
     LFFEchaCierre.Visible := True;
     DBFEchaCierre.Visible := True;
  end
  else
  begin
     LFFEchaCierre.Visible := False;
     DBFEchaCierre.Visible := False;
  end;
end;

procedure TIsoFMINC.CBFactorClaExit(Sender: TObject);
begin
  inherited;
  DBEDescripcion.SetFocus;
end;

//****************** Fermin **********************
procedure TIsoFMINC.AccinPreventivaCorrectora1Click(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8022, 0, '', str, IsoDMInc.frIsoInc, nil);
  {
  with IsoDMInc.frIsoInc do
    begin
      LoadFromFIB(9011,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;
//************************************************

procedure TIsoFMINC.PCDetalleChange(Sender: TObject);
begin
  inherited;
  if (PCDetalle.ActivePage = TSDetAccion) then
  begin
     Navdet.DataSource := IsoDMInc.DSQMDetalle;
     NavDet.EditaControl := DBGFDetalle;
     NavDet.InsertaControl := DBGFDetalle;
     TBAcciones.Enabled := True;
  end
  else
  begin
     NavDet.DataSource := IsoDMInc.DSQMDetArticulos;
     NavDet.EditaControl := DBGFDetArticulo;
     NavDet.InsertaControl := DBGFDetArticulo;
     TBAcciones.Enabled := False;
  end;
end;

procedure TIsoFMINC.AInformeNoConExecute(Sender: TObject);
var
  str{, serie} : string;
  {grupo : integer;}
begin
  inherited;
  str := '';
  IsoDMInc.QMDetArticulos.Close;
  IsoDMInc.QMDetArticulos.Open;

  // serie:=Rentorno.Serie;
  // grupo:=8022;

  // DMListados.Cargar(grupo, serie);
  DMListados.Imprimir(8022, 0, '', str, IsoDMInc.frIsoInc, nil);

  {with IsoDMInc.frHYIsoInc do
    begin
      LoadFromFIB(9003,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;

procedure TIsoFMINC.AConfInformeNoConExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8022, formato, cabecera, copias, pijama, '', IsoDMInc.frIsoInc);
end;

procedure TIsoFMINC.TButtUndoClick(Sender: TObject);
begin
  inherited;
  with DBMNotas do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TIsoFMINC.TButtCutClick(Sender: TObject);
begin
  inherited;
  DBMNotas.CutToClipboard;
end;

procedure TIsoFMINC.TButtCopyClick(Sender: TObject);
begin
  inherited;
  DBMNotas.CopyToClipboard;
end;

procedure TIsoFMINC.TButtPasteClick(Sender: TObject);
begin
  inherited;
  DBMNotas.PasteFromClipboard;
end;

procedure TIsoFMINC.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotas).Name := FontName.Items[FontName.ItemIndex];
end;

procedure TIsoFMINC.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotas).Size := StrToInt(FontSize.Text);
  beep;
end;

procedure TIsoFMINC.TButtNegritaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegrita.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsBold]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsBold];
end;

procedure TIsoFMINC.TButtCursivaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursiva.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsItalic]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsItalic];
end;

procedure TIsoFMINC.TButtSubrayadoClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayado.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsUnderline]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsUnderline];
end;

procedure TIsoFMINC.TButtLeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TIsoFMINC.TButtCenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TIsoFMINC.TButtRightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TIsoFMINC.TButtColorClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBMNotas.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText(DBMNotas).Color := ColorSeleccionado
  else
     CurrText(DBMNotas).Color := ColorDefecto;
end;

// Formatació texte
function TIsoFMINC.CurrText(Notas: TDBRichEdit): TTextAttributes;
begin
  if Notas.SelLength > 0 then
     Result := Notas.SelAttributes
  else
     Result := Notas.DefAttributes;
end;

// Formatació texte
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

// Formatació texte
procedure TIsoFMINC.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

// Formatació texte
procedure TIsoFMINC.SelectionChange(Sender: TObject);
begin
  with DBMNotas.Paragraph do
     try
        FUpdating := True;
        TButtNegrita.Down := fsBold in DBMNotas.SelAttributes.Style;
        TButtCursiva.Down := fsItalic in DBMNotas.SelAttributes.Style;
        TButtSubrayado.Down := fsUnderline in DBMNotas.SelAttributes.Style;

        FontSize.Text := IntToStr(DBMNotas.SelAttributes.Size);
        FontName.Text := DBMNotas.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlign.Down := True;
           1: TButtRightAlign.Down := True;
           2: TButtCenterAlign.Down := True;
        end;
     finally
        FUpdating := False;
     end;
end;

procedure TIsoFMINC.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMINC.DBEDocBusqueda(Sender: TObject);
begin
  inherited;
  // Cliente
  if (IsoDMInc.QMIncTIPO.AsString = 'C') then
  begin
     DBEDoc.Tabla_a_buscar := 'GES_CABECERAS_S';
     DBEDoc.CampoNum := 'RIG';
     DBEDoc.CampoStr := 'FECHA';

     if (IsoDMInc.QMIncSITUACION.AsString = 'PED') then
        DBEDoc.CondicionBusqueda := 'serie=''' + IsoDMInc.QMIncSERIE_DOC.AsString + ''' and tipo=''PEC''';

     if (IsoDMInc.QMIncSITUACION.AsString = 'ALB') then
        DBEDoc.CondicionBusqueda := 'serie=''' + IsoDMInc.QMIncSERIE_DOC.AsString + ''' and tipo=''ALB''';

     if (IsoDMInc.QMIncSITUACION.AsString = 'FAC') then
        DBEDoc.CondicionBusqueda := 'serie=''' + IsoDMInc.QMIncSERIE_DOC.AsString + ''' and tipo=''FAC''';
  end;

  // Proveedor
  if (IsoDMInc.QMIncTIPO.AsString = 'P') then
  begin
     DBEDoc.Tabla_a_buscar := 'GES_CABECERAS_E';
     DBEDoc.CampoNum := 'RIG';
     DBEDoc.CampoStr := 'FECHA';

     if (IsoDMInc.QMIncSITUACION.AsString = 'PED') then
        DBEDoc.CondicionBusqueda := 'serie=''' + IsoDMInc.QMIncSERIE_DOC.AsString + ''' and tipo=''PEP''';

     if (IsoDMInc.QMIncSITUACION.AsString = 'ALB') then
        DBEDoc.CondicionBusqueda := 'serie=''' + IsoDMInc.QMIncSERIE_DOC.AsString + ''' and tipo=''ALP''';

     if (IsoDMInc.QMIncSITUACION.AsString = 'FAC') then
        DBEDoc.CondicionBusqueda := 'serie=''' + IsoDMInc.QMIncSERIE_DOC.AsString + ''' and tipo=''FAP''';
  end;

  // Fabricación (OF)
  if (IsoDMInc.QMIncTIPO.AsString = 'F') then
  begin
     DBEDoc.Tabla_a_buscar := 'PRO_ORD';
     DBEDoc.CampoNum := 'ID_ORDEN';
     DBEDoc.CampoStr := 'FECHA_ORD';

     if (IsoDMInc.QMIncSITUACION.AsString = 'OFB') then
        DBEDoc.CondicionBusqueda := 'series=''' + IsoDMInc.QMIncSERIE_DOC.AsString + '''';
  end;
end;

procedure TIsoFMINC.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  DBESerieDoc.Enabled := (DBEFTipo.Text <> 'O');
  DBEDoc.Enabled := DBESerieDoc.Enabled;
  DBESerieDoc.ReadOnly := not DBESerieDoc.Enabled;
  DBEDoc.ReadOnly := not DBEDoc.Enabled;
end;

procedure TIsoFMINC.ANotasDetalleExecute(Sender: TObject);
begin
  inherited;
  if (PCDetalle.ActivePage = TSDetArticulos) then
     EditarCampoNotas(Self, IsoDMInc.DSQMDetArticulos, IsoDMInc.QMDetArticulosNOTAS)
  else
     EditarCampoNotas(Self, IsoDMInc.DSQMDetalle, IsoDMInc.QMDetalleNOTAS);
end;

procedure TIsoFMINC.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with DBGFDetalle do
  begin
     CondicionBusqueda := '';

     if (TablaABuscar = 'VER_EMPLEADOS_EF') then
     begin
        begin
           CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
           i := Tablas.IndexOf(TablaABuscar);
           if (i >= 0) then
              OrdenadosPor[i] := 'EMPLEADO';
        end;
     end
     else
     if (TablaABuscar = 'ISO_INC_ACCIONES_TIPO') then
     begin
        begin
           i := Tablas.IndexOf(TablaABuscar);
           if (i >= 0) then
              OrdenadosPor[i] := 'TIPO';
        end;
     end;
  end;
  // Código por si se quiere buscar la serie y el número de documento.
  // Ahora se copia de la cabecera
  {
  if (DBGFDetalle.TablaABuscar='VER_CANALES_SERIES') then
    begin
      DBGFDetalle.CondicionBusqueda:='empresa='+REntorno.EmpresaStr + ' and ejercicio='+
        REntorno.EjercicioStr+' and canal='+REntorno.CanalStr;
    end;

  //Num doc del client
  if ((IsoDMInc.QMIncTIPO.AsString='C') and (DBGFDetalle.ColumnaActual='NUM_DOC')) then
    begin
      DBGFDetalle.Tablas[3]:='GES_CABECERAS_S';

      if (DBGFDetalle.Tablas[3]='GES_CABECERAS_S') then
        begin
           if (IsoDMInc.QMIncSITUACION.AsString='ALB') then
             DBGFDetalle.CondicionBusqueda:='empresa='+REntorno.EmpresaStr+' and ejercicio='+
               REntorno.EjercicioStr+' and canal='+REntorno.CanalStr+' and serie='''
               +IsoDMInc.QMDetalleSERIE_DOC.AsString+''' and tipo=''ALB'''

           else if (IsoDMInc.QMIncSITUACION.AsString='FAC') then
             DBGFDetalle.CondicionBusqueda:='empresa='+REntorno.EmpresaStr+' and ejercicio='+
               REntorno.EjercicioStr+' and canal='+REntorno.CanalStr+' and serie='''
               +IsoDMInc.QMDetalleSERIE_DOC.AsString+''' and tipo=''FAC''';
        end;
    end;

  //Num. doc del proveïdor
  if ((IsoDMInc.QMIncTIPO.AsString='P') and (DBGFDetalle.ColumnaActual='NUM_DOC')) then
    begin
      DBGFDetalle.Tablas[3]:='GES_CABECERAS_E';

      if (DBGFDetalle.Tablas[3]='GES_CABECERAS_E') then
        begin
           if (IsoDMInc.QMIncSITUACION.AsString='ALB') then
             DBGFDetalle.CondicionBusqueda:='empresa='+REntorno.EmpresaStr+' and ejercicio='+
               REntorno.EjercicioStr+' and canal='+REntorno.CanalStr+' and serie='''
               +IsoDMInc.QMDetalleSERIE_DOC.AsString+''' and tipo=''ALP'''

           else if (IsoDMInc.QMIncSITUACION.AsString='FAC') then
             DBGFDetalle.CondicionBusqueda:='empresa='+REntorno.EmpresaStr+' and ejercicio='+
               REntorno.EjercicioStr+' and canal='+REntorno.CanalStr+' and serie='''
               +IsoDMInc.QMDetalleSERIE_DOC.AsString+''' and tipo=''FAP''';
        end;
    end;
 }
end;

procedure TIsoFMINC.AEtiquetasNoConExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8037, 0, '', str, IsoDMInc.frIsoInc, nil);
end;

procedure TIsoFMINC.AEtiquetadNoconfExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8037, formato, cabecera, copias, pijama, '', IsoDMInc.frIsoInc);
end;

procedure TIsoFMINC.AAccionesExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AIsoAccPreventiva, 'ID_ACCION_PRE = ' +
     IntToStr(IsoDMINC.QMDetalleID_ACCION.AsInteger) + ' and empresa=' + REntorno.EmpresaStr);
end;

procedure TIsoFMINC.FormShow(Sender: TObject);
begin
  inherited;
  // Si el check està marcat no es deixa que es faci una nova devolució
  if ((IsoDMInc.QMIncDEVOLVER.AsInteger = 1) and (IsoDMInc.QMIncNDEVOLUCION.AsInteger > 0)) then
     IsoFMInc.ADevolucionArt.Enabled := False
  else
     IsoFMInc.ADevolucionArt.Enabled := True;

  // Si estem a accions, s'activarà le botó de traspassar a accions
  if (PCDetalle.ActivePage = TSDetArticulos) then
     TBAcciones.Enabled := False
  else if (PCDetalle.ActivePage = TSDetAccion) then
     TBAcciones.Enabled := True;
end;

procedure TIsoFMINC.ADevolucionArtExecute(Sender: TObject);
begin
  inherited;
  if ((IsoDMInc.QMIncDEVOLVER.AsInteger = 0) and (IsoDMInc.QMIncNDEVOLUCION.AsInteger = 0)) then
  begin
     // Execució del procés de devolució d'articles
     IsoDMInc.SPDevolucion.Close;
     IsoDMInc.SPDevolucion.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     IsoDMInc.SPDevolucion.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     IsoDMInc.SPDevolucion.Params.ByName['Ric'].AsInteger := IsoDMInc.QMIncRIC.AsInteger;
     IsoDMInc.SPDevolucion.Prepare;
     IsoDMInc.SPDevolucion.ExecQuery;
     IsoDMInc.SPDevolucion.FreeHandle;
  end;
end;

procedure TIsoFMINC.SBADevolverDblClick(Sender: TObject);
begin
  inherited;
  ADevolver.Execute;
end;

procedure TIsoFMINC.ADevolverExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AIsoDevMat, 'empresa = ' +
     REntorno.EmpresaStr + ' and ejercicio=' + REntorno.EjercicioStr +
     ' and ric=' + IsoDMInc.QMIncNDEVOLUCION.AsString);
end;

procedure TIsoFMINC.FormActivate(Sender: TObject);
begin
  inherited;
  // Refresco el detall per si s'ha modificat el cost
  if (IsoDMInc.QMInc.RecordCount > 0) then
     IsoDMInc.QMInc.Refresh;
end;

procedure TIsoFMINC.TSNotasShow(Sender: TObject);
begin
  inherited;
  NavNotas.SetFocus;
end;

procedure TIsoFMINC.SBADocDblClick(Sender: TObject);
begin
  inherited;
  AAbreDocs.Execute;
end;

procedure TIsoFMINC.AAbreDocsExecute(Sender: TObject);
begin
  inherited;
  if (IsoDMInc.QMIncTIPO.AsString = 'C') then
  begin
     if (IsoDMInc.QMIncSITUACION.AsString = 'PED') then
        FMain.MuestraDocumento(REntorno.Ejercicio, 'PEC', IsoDMINC.QMIncSERIE_DOC.AsString, IsoDMINC.QMIncNUM_DOC.AsInteger);

     if (IsoDMInc.QMIncSITUACION.AsString = 'ALB') then
        FMain.MuestraDocumento(REntorno.Ejercicio, 'ALB', IsoDMINC.QMIncSERIE_DOC.AsString, IsoDMINC.QMIncNUM_DOC.AsInteger);

     if (IsoDMInc.QMIncSITUACION.AsString = 'FAC') then
        FMain.MuestraDocumento(REntorno.Ejercicio, 'FAC', IsoDMINC.QMIncSERIE_DOC.AsString, IsoDMINC.QMIncNUM_DOC.AsInteger);
  end;

  // Proveedor
  if (IsoDMInc.QMIncTIPO.AsString = 'P') then
  begin
     if (IsoDMInc.QMIncSITUACION.AsString = 'PED') then
        FMain.MuestraDocumento(REntorno.Ejercicio, 'PEP', IsoDMINC.QMIncSERIE_DOC.AsString, IsoDMINC.QMIncNUM_DOC.AsInteger);

     if (IsoDMInc.QMIncSITUACION.AsString = 'ALB') then
        FMain.MuestraDocumento(REntorno.Ejercicio, 'ALP', IsoDMINC.QMIncSERIE_DOC.AsString, IsoDMINC.QMIncNUM_DOC.AsInteger);

     if (IsoDMInc.QMIncSITUACION.AsString = 'FAC') then
        FMain.MuestraDocumento(REntorno.Ejercicio, 'FAP', IsoDMINC.QMIncSERIE_DOC.AsString, IsoDMINC.QMIncNUM_DOC.AsInteger);
  end;

  // Fabricación (OF)
  if (IsoDMInc.QMIncTIPO.AsString = 'F') then
  begin
     if (IsoDMInc.QMIncSITUACION.AsString = 'OFB') then
     begin
        FMain.EjecutaAccion(FMain.AProOrden);
        ProFMOrden.FiltraOrden(IsoDMINC.QMIncNUM_DOC.AsInteger);
     end;
  end;
end;

procedure TIsoFMINC.FiltraInciencia(Incidencia: integer);
begin
  IsoDmInc.FiltraInciencia(Incidencia);
end;

procedure TIsoFMINC.LFDBECliProBusqueda(Sender: TObject);
begin
  inherited;
  with LFDBECliPro do
  begin
     Filtros := [obEmpresa, obEjercicio, obCanal];
     if (IsoDMInc.QMIncTIPO.AsString = 'C') then
     begin
        Tabla_a_buscar := 'VER_CLIENTES_EF';
        CampoNum := 'CLIENTE';
        CampoStr := 'TITULO';
        OrdenadoPor.Text := 'CLIENTE';
        IsoDMInc.BuscaTerDeCli;
     end;

     // Proveedor
     if (IsoDMInc.QMIncTIPO.AsString = 'P') then
     begin
        Tabla_a_buscar := 'VER_PROVEEDORES';
        CampoNum := 'PROVEEDOR';
        CampoStr := 'TITULO';
        OrdenadoPor.Text := 'PROVEEDOR';
        IsoDMInc.BuscaTerDePro;
     end;
  end;
end;

procedure TIsoFMINC.DBEFTerceroBusqueda(Sender: TObject);
begin
  inherited;
  if ((IsoDMInc.QMIncTIPO.AsString = 'C') or (IsoDMInc.QMIncTIPO.AsString = 'P')) then
     DBEFTercero.CondicionBusqueda :=
        'TERCERO =' + IsoDMInc.QMIncCLI_PRO_INTE.AsString;
end;

procedure TIsoFMINC.VisualizaEtiCliProv;
begin
  LbCliPro.Visible := True;
  LFDbDescCliPro.Visible := True;
  LFDBECliPro.Visible := True;
  DBEFTercero.Color := clWindow;
  DBEFTercero.ReadOnly := False;
  DBEFTercero.TabStop := True;

  if (IsoDMINC.QMIncTIPO.AsString = 'C') then
  begin
     LbCliPro.Caption := _('Cliente');
     DBEFTercero.Color := clInfoBk;
     DBEFTercero.ReadOnly := True;
     DBEFTercero.TabStop := False;
  end
  else if (IsoDMINC.QMIncTIPO.AsString = 'P') then
  begin
     LbCliPro.Caption := _('Proveedor');
     DBEFTercero.Color := clInfoBk;
     DBEFTercero.ReadOnly := True;
     DBEFTercero.TabStop := False;
  end
  else
  begin
     LbCliPro.Visible := False;
     LFDbDescCliPro.Visible := False;
     LFDBECliPro.Visible := False;
  end;
end;

procedure TIsoFMINC.LFDBECliProChange(Sender: TObject);
begin
  inherited;
  VisualizaEtiCliProv;
end;

procedure TIsoFMINC.ALstResumenIncExecute(Sender: TObject);
var
  str{, serie} : string;
  {grupo : integer;}
begin
  inherited;
  str := '';
  // IsoDMInc.QMInc.Close;
  // IsoDMInc.QMInc.Open;

  DMListados.Imprimir(8060, 0, '', str, IsoDMInc.frIsoResumenInc, nil);
end;

procedure TIsoFMINC.AConfInformeLstResumenIncExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8060, formato, cabecera, copias, pijama, '', IsoDMInc.frIsoResumenInc);
end;

procedure TIsoFMINC.Filtrar(Filtro: string);
begin
  IsoDMInc.Filtrar(Filtro);
end;

procedure TIsoFMINC.LimpiaFormulario;
begin
  LFDBECliPro.Clear;
  LFDbDescCliPro.Clear;
  DBEFTercero.Clear;
  DBETituloTercero.Clear;
  LFDContador.Clear;
  DBEFDocumento.Text := 'MAN';
  DBEFResponsable.Clear;
  DBETituloEmpleado.Clear;
  DBESerieDoc.Clear;
  DBEDoc.Clear;
  DBEFFactorCla.Clear;
  DBEDescripcion.Clear;
  DBEdFDepartamento.Text := 'DES';
  DBENDocCli.Clear;
  DBESuRef.Clear;
  DBCBTirar.Checked := False;
  DBCBRecuperar.Checked := False;
  DBCBDevolver.Checked := False;
  DBENDev.Clear;
  DBCBAceptar.Checked := False;
  DBCBOtros.Checked := False;
  DBMemo.Clear;
  DBMEvidencia.Clear;
  DBCBRespDepart.Checked := False;
  DBCBVBCalidad.Checked := False;
  DBCBPiezas.Checked := False;
end;

procedure TIsoFMINC.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('NCO', IsoDMInc.QMIncRIC.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoIncidencia.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TIsoFMINC.AAdjuntoIncidenciaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('NCO', IsoDMInc.QMIncRIC.AsInteger);
end;

procedure TIsoFMINC.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AInformeNoCon.Execute;
end;

end.
