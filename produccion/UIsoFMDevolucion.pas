unit UIsoFMDevolucion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBCheckBox, ULFDBMemo, ULFDBEditFind2000, ULFDBEdit,
  rxToolEdit, RXDBCtrl, TFlatCheckBoxUnit, ULFCheckBox, UG2kTBLoc, ImgList,
  ULFEdit, ULFFIBDBEditFind, Buttons, ULFLabel, ULFDBDateEdit, ULFComboBox;

type
  TIsoFMDevolucion = class(TFPEdit)
     LNDevolucion: TLFLabel;
     DBENDevolucion: TLFDbedit;
     LFecha: TLFLabel;
     LProveedor: TLFLabel;
     LNINC: TLFLabel;
     LMotivoDevolucion: TLFLabel;
     DBEFProveedor: TLFDBEditFind2000;
     DBEDescProv: TLFDbedit;
     DBMMotivos: TLFDBMemo;
     GBInstrucciones: TGroupBox;
     DBCBReponer: TLFDBCheckBox;
     DBCBAbonar: TLFDBCheckBox;
     DBCBReparacion: TLFDBCheckBox;
     DBCBOtros: TLFDBCheckBox;
     LPedido: TLFLabel;
     DBEPedido: TLFDbedit;
     DBCBCerrado: TLFDBCheckBox;
     DBCBVBCalidad: TLFDBCheckBox;
     DBCBVBCompras: TLFDBCheckBox;
     DBCBVBProveedor: TLFDBCheckBox;
     TSNotas: TTabSheet;
     PDet: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDet: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     PNLNotas: TLFPanel;
     PNLNotasProveedor: TLFPanel;
     NavNotas: THYMNavigator;
     DBENotasNDev: TLFDbedit;
     LNotasNDev: TLFLabel;
     LNotasProv: TLFLabel;
     DBENotasCodProv: TLFDbedit;
     DBENotasDescProv: TLFDbedit;
     PNLDetalleNotas: TLFPanel;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     CEDetallePMEdit: TPopUpTeclas;
     GBDetRealizada: TGroupBox;
     DBCBEsetri: TLFDBCheckBox;
     DBCBCliente: TLFDBCheckBox;
     DBCBUrgente: TLFDBCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     ADevolucionMat: TAction;
     DTPFecha: TLFDBDateEdit;
     TBNotas: TLFToolBar;
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
     ToolButton2: TToolButton;
     TButtColor: TToolButton;
     DBMObservaciones: TDBRichEdit;
     PNNotas: TLFPanel;
     ALstConfig: TAction;
     DBEFRicInc: TLFFibDBEditFind;
     DBEFNINC: TLFDbedit;
     SBEnlaceINC: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBCBReponerClick(Sender: TObject);
     procedure DBCBAbonarClick(Sender: TObject);
     procedure DBCBReparacionClick(Sender: TObject);
     procedure DBCBOtrosClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DevolucindeMaterial1Click(Sender: TObject);
     procedure ADevolucionMatExecute(Sender: TObject);
     procedure SelectionChange(Sender: TObject);
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
     procedure ALstConfigExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure SBEnlaceINCDblClick(Sender: TObject);
  private
     { Private declarations }
     FUpdating: boolean;
     function CurrText(Notas: TDBRichEdit): TTextAttributes;
     procedure GetFontNames;
  public
     { Public declarations }
     procedure FiltraDevolucion(Filtro: string);
  end;

var
  IsoFMDevolucion : TIsoFMDevolucion;

implementation

uses UDMMain, UIsoDMDevolucion, UFormGest, UUtiles, UEntorno,
  UDMListados, UFMListconfig, UIsoFMInc;

{$R *.DFM}

procedure TIsoFMDevolucion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMDevolucion, IsoDMDevolucion);
  AbreData(TDMListados, DMListados);

  //Formatació texte
  GetFontNames;
  SelectionChange(Self);

  CurrText(DBMObservaciones).Name := DefFontData.Name;
  CurrText(DBMObservaciones).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  NavMain.DataSource := IsoDMDevolucion.DSQMCabecera;
  EPMain.DataSource := IsoDMDevolucion.DSQMCabecera;
  DBGMain.DataSource := IsoDMDevolucion.DSQMCabecera;
  Navdet.DataSource := IsoDMDevolucion.DSQMDetalle;
  DBGFDetalle.DataSource := IsoDMDevolucion.DSQMDetalle;
  CEMainPMEdit.Teclas := DMMain.teclas;

  DBEFRicInc.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBEnlaceINC, DBEFRicInc);
end;

procedure TIsoFMDevolucion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMDevolucion);
end;

procedure TIsoFMDevolucion.DBCBReponerClick(Sender: TObject);
begin
  inherited;
  if DBCBReponer.Checked = True then
  begin
     DBCBAbonar.Checked := False;
     DBCBReparacion.Checked := False;
     DBCBOtros.Checked := False;
     IsoDMDevolucion.QMCabeceraABONAR.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraOTROS.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraCARGO_REP.AsInteger := 0;
  end;
end;

procedure TIsoFMDevolucion.DBCBAbonarClick(Sender: TObject);
begin
  inherited;
  if DBCBAbonar.Checked = True then
  begin
     DBCBReponer.Checked := False;
     DBCBReparacion.Checked := False;
     DBCBOtros.Checked := False;
     IsoDMDevolucion.QMCabeceraREPONER.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraOTROS.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraCARGO_REP.AsInteger := 0;
  end;
end;

procedure TIsoFMDevolucion.DBCBReparacionClick(Sender: TObject);
begin
  inherited;
  if DBCBReparacion.Checked = True then
  begin
     DBCBAbonar.Checked := False;
     DBCBReponer.Checked := False;
     DBCBOtros.Checked := False;
     IsoDMDevolucion.QMCabeceraABONAR.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraOTROS.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraREPONER.AsInteger := 0;
  end;
end;

procedure TIsoFMDevolucion.DBCBOtrosClick(Sender: TObject);
begin
  inherited;
  if DBCBOtros.Checked = True then
  begin
     DBCBAbonar.Checked := False;
     DBCBReparacion.Checked := False;
     DBCBReponer.Checked := False;
     IsoDMDevolucion.QMCabeceraABONAR.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraCARGO_REP.AsInteger := 0;
     IsoDMDevolucion.QMCabeceraREPONER.AsInteger := 0;
  end;
end;

procedure TIsoFMDevolucion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMDevolucion.BusquedaCompleja;
end;

procedure TIsoFMDevolucion.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  DBGFDetalle.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
  DBGFDetalle.CondicionBusqueda := DBGFDetalle.CondicionBusqueda + ' AND CONTADOR = ''' + IsoDMDevolucion.QMCabeceraCONTADOR.AsString + '''';
end;

//********************* Fermin ***************************
procedure TIsoFMDevolucion.DevolucindeMaterial1Click(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8020, 0, '', str, IsoDMDevolucion.frIsoDevolucion, nil);
  {
  with IsoDMDevolucion.frHYIsoDev do
    begin
      LoadFromFIB(9008,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;
//*********************************************************
procedure TIsoFMDevolucion.ADevolucionMatExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8020, 0, '', str, IsoDMDevolucion.frIsoDevolucion, nil);
  {
  with IsoDMDevolucion.frHYIsoDev do
    begin
      LoadFromFIB(9008,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;

function TIsoFMDevolucion.CurrText(Notas: TDBRichEdit): TTextAttributes;
begin
  if Notas.SelLength > 0 then
     Result := Notas.SelAttributes
  else
     Result := Notas.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TIsoFMDevolucion.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TIsoFMDevolucion.SelectionChange(Sender: TObject);
begin
  with DBMObservaciones.Paragraph do
     try
        FUpdating := True;
        TButtNegrita.Down := fsBold in DBMObservaciones.SelAttributes.Style;
        TButtCursiva.Down := fsItalic in DBMObservaciones.SelAttributes.Style;
        TButtSubrayado.Down := fsUnderline in DBMObservaciones.SelAttributes.Style;

        FontSize.Text := IntToStr(DBMObservaciones.SelAttributes.Size);
        FontName.Text := DBMObservaciones.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlign.Down := True;
           1: TButtRightAlign.Down := True;
           2: TButtCenterAlign.Down := True;
        end;
     finally
        FUpdating := False;
     end;
end;

procedure TIsoFMDevolucion.TButtUndoClick(Sender: TObject);
begin
  inherited;
  with DBMObservaciones do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TIsoFMDevolucion.TButtCutClick(Sender: TObject);
begin
  inherited;
  DBMObservaciones.CutToClipboard;
end;

procedure TIsoFMDevolucion.TButtCopyClick(Sender: TObject);
begin
  inherited;
  DBMObservaciones.CopyToClipboard;
end;

procedure TIsoFMDevolucion.TButtPasteClick(Sender: TObject);
begin
  inherited;
  DBMObservaciones.PasteFromClipboard;
end;

procedure TIsoFMDevolucion.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMObservaciones).Name := FontName.Items[FontName.ItemIndex];
end;

procedure TIsoFMDevolucion.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMObservaciones).Size := StrToInt(FontSize.Text);
end;

procedure TIsoFMDevolucion.TButtNegritaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegrita.Down then
     CurrText(DBMObservaciones).Style := CurrText(DBMObservaciones).Style + [fsBold]
  else
     CurrText(DBMObservaciones).Style := CurrText(DBMObservaciones).Style - [fsBold];
end;

procedure TIsoFMDevolucion.TButtCursivaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursiva.Down then
     CurrText(DBMObservaciones).Style := CurrText(DBMObservaciones).Style + [fsItalic]
  else
     CurrText(DBMObservaciones).Style := CurrText(DBMObservaciones).Style - [fsItalic];
end;

procedure TIsoFMDevolucion.TButtSubrayadoClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayado.Down then
     CurrText(DBMObservaciones).Style := CurrText(DBMObservaciones).Style + [fsUnderline]
  else
     CurrText(DBMObservaciones).Style := CurrText(DBMObservaciones).Style - [fsUnderline];
end;

procedure TIsoFMDevolucion.TButtLeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMObservaciones.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TIsoFMDevolucion.TButtCenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMObservaciones.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TIsoFMDevolucion.TButtRightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMObservaciones.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TIsoFMDevolucion.TButtColorClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBMObservaciones.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText(DBMObservaciones).Color := ColorSeleccionado
  else
     CurrText(DBMObservaciones).Color := ColorDefecto;
end;

procedure TIsoFMDevolucion.ALstConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8020, Formato, Cabecera, Copias, Pijama, '', IsoDMDevolucion.frIsoDevolucion);
end;

procedure TIsoFMDevolucion.FiltraDevolucion(Filtro: string);
begin
  with IsoDMDevolucion.QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'SELECT * FROM ISO_DEVOLUCION_C WHERE ' + filtro;
     Open;
  end;
end;

procedure TIsoFMDevolucion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMDevolucion.SBEnlaceINCDblClick(Sender: TObject);
begin
  inherited;
  AbreForm(TIsoFMInc, IsoFMInc, Sender);
  IsoFMInc.FiltraInciencia(IsoDMDevolucion.QMCabeceraRIC_INC.AsInteger);
end;

end.
