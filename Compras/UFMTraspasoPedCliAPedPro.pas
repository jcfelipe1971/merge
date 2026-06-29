unit UFMTraspasoPedCliAPedPro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UControlEdit, ToolWin, ComCtrls, ExtCtrls, StdCtrls,
  UFIBDBEditfind, Grids, DBGrids, NsDBGrid, UComponentesBusquedaFiltrada,
  UEditPanel, UNavigator, Menus, UTeclas, Mask, UHYDescription, UFormGest,
  ULFToolBar, ULFPanel, ULFHYDBDescription, ULFEditFind2000, ULFLabel,
  ULFEdit, rxPlacemnt, ULFFormStorage, DBCtrls, ULFDBMemo, rxToolEdit,
  ULFDateEdit, HYFIBQuery, ExtActns, ActnList, StdActns, TFlatCheckBoxUnit,
  ULFCheckBox, UFPEditSimple, ULFActionList;

type
  TFMTraspasoPedCliAPedPro = class(TFPEditSimple)
     DBGLineas: TDBGridFind2000;
     ToolButton4: TToolButton;
     TBTraspasaPedido: TToolButton;
     ToolButton3: TToolButton;
     TButtTodas: TToolButton;
     TButtNinguna: TToolButton;
     PNLProveedor: TLFPanel;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     LFEProveedor: TLFEdit;
     PNLDatosCabecera: TLFPanel;
     PNLLineas: TLFPanel;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     LAlmacen: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     EAlmacen: TLFEdit;
     LReferencia: TLFLabel;
     EReferencia: TLFEdit;
     DEFecha: TLFDateEdit;
     LFecha: TLFLabel;
     TButtRegenera: TToolButton;
     PNLNotas: TLFPanel;
     DBRENotas: TDBRichEdit;
     DBRENotas2: TDBRichEdit;
     TBNotasRich: TLFToolBar;
     TButtIdiomaNegrita: TToolButton;
     TButtIdiomaCursiva: TToolButton;
     TButtIdiomaSubrayado: TToolButton;
     TButtIdiomaSep1: TToolButton;
     TButtIdiomaAlinIzq: TToolButton;
     TButtIdiomaAlinCentr: TToolButton;
     TButtIdiomaAlinDer: TToolButton;
     TButtIdiomaSep2: TToolButton;
     TButtIdiomaBullet: TToolButton;
     TButtIdiomaSep3: TToolButton;
     PNLTamano: TLFPanel;
     EFontSize: TLFEdit;
     UpDownFontSize: TUpDown;
     CBAgregarAAbierto: TLFCheckBox;
     TBSep1: TToolButton;
     TButtInfStocks: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBTraspasaPedidoClick(Sender: TObject);
     procedure TButtTodasClick(Sender: TObject);
     procedure TButtNingunaClick(Sender: TObject);
     procedure EFProveedorExiste(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure DBGLineasDblClick(Sender: TObject);
     procedure DBGLineasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure EFontSizeChange(Sender: TObject);
     procedure DBRENotasSelectionChange(Sender: TObject);
     procedure DBRENotas2SelectionChange(Sender: TObject);
     procedure DBRENotasEnter(Sender: TObject);
     procedure DBRENotas2Enter(Sender: TObject);
     procedure PNLNotasResize(Sender: TObject);
     procedure TButtInfStocksClick(Sender: TObject);
  private
     { Private declarations }
     FUpdating: boolean;
     RichEditConFoco: TDBRichEdit;
  public
     { Public declarations }
  end;

var
  FMTraspasoPedCliAPedPro : TFMTraspasoPedCliAPedPro;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, UDMTraspasoPedCliAPedPro, UFMain, UUtiles, UParam, UFMDocInfoStocks, UDameDato;

procedure TFMTraspasoPedCliAPedPro.FormCreate(Sender: TObject);
var
  i : integer;
  AlmacenStock : string;
begin
  inherited;
  ControlEdit := CEMain;
  AbreData(TDMTraspasoPedCliAPedPro, DMTraspasoPedCliAPedPro);
  EFSerie.Text := REntorno.Serie;
  EFAlmacen.Text := REntorno.AlmacenDefecto;
  DEFecha.Date := Now;
  if (DMMain.EstadoKri(198) <> 1) then
  begin
     TBNotasRich.Visible := False;
     DBRENotas2.Visible := False;
     DBRENotas.PlainText := True;
  end;

  // Almacen especial del cual mostrar stock
  AlmacenStock := LeeParametro('PECSTKA001', '');
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);
  if (AlmacenStock <> 'NOCALC') then
  begin
     i := EncuentraField(DBGLineas, 'STOCK_ALM');
     if (i >= 0) then
     begin
        DBGLineas.Columns[i].Visible := True;
        DBGLineas.Columns[i].Title.Caption := _('Stock') + ' ' + AlmacenStock;
     end
     else
     begin
        with DBGLineas.Columns.Add do
        begin
           FieldName := 'STOCK_ALM';
           Title.Caption := _('Stock') + ' ' + AlmacenStock;
           Visible := True;
        end;
     end;
  end;

  RichEditConFoco := DBRENotas;
  FUpdating := False;
end;

procedure TFMTraspasoPedCliAPedPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  DMTraspasoPedCliAPedPro.LimpiaTemporal;
  CierraData(DMTraspasoPedCliAPedPro);
end;

procedure TFMTraspasoPedCliAPedPro.TBTraspasaPedidoClick(Sender: TObject);
begin
  if (EFProveedor.Text <> '') then
     DMTraspasoPedCliAPedPro.TraspasaPedidoAProv(StrToInt(EFProveedor.Text), EFSerie.Text, EFAlmacen.Text, EReferencia.Text, DEFecha.Date, CBAgregarAAbierto.Checked);
end;

procedure TFMTraspasoPedCliAPedPro.TButtTodasClick(Sender: TObject);
begin
  DMTraspasoPedCliAPedPro.MarcaLineas(1);
end;

procedure TFMTraspasoPedCliAPedPro.TButtNingunaClick(Sender: TObject);
begin
  DMTraspasoPedCliAPedPro.MarcaLineas(0);
end;

procedure TFMTraspasoPedCliAPedPro.EFProveedorExiste(Sender: TObject);
begin
  LFEProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
  DMTraspasoPedCliAPedPro.CaptaPedidos(StrToIntDef(EFProveedor.Text, 0));
  EFAlmacenChange(Sender);
end;

procedure TFMTraspasoPedCliAPedPro.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMTraspasoPedCliAPedPro.EFAlmacenChange(Sender: TObject);
begin
  EAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
  if ((DMTraspasoPedCliAPedPro.TMPPedidosAProv.RecordCount > 0) and (EAlmacen.Text > '')) then
     DMTraspasoPedCliAPedPro.RellenaStockMinimo(EFAlmacen.Text);
end;

procedure TFMTraspasoPedCliAPedPro.DBGLineasDblClick(Sender: TObject);
begin
  if DMTraspasoPedCliAPedPro.TMPPedidosAProv.RecordCount > 0 then
  begin
     if (UpperCase(DBGLineas.SelectedField.FieldName) = 'ARTICULO') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'ARTICULO = ''' + DMTraspasoPedCliAPedPro.TMPPedidosAProvARTICULO.AsString + '''' +
           ' AND EJERCICIO=' + DMTraspasoPedCliAPedPro.TMPPedidosAProvEJERCICIO.AsString);

     if (UpperCase(DBGLineas.SelectedField.FieldName) = 'PEDIDO') then
     begin
        // Buscamos los datos para abrir el pedido
        if (DMTraspasoPedCliAPedPro.TMPPedidosAProvID_S.AsInteger > 0) then
           FMain.TraspasoDeDocumentosSalida(DMTraspasoPedCliAPedPro.TMPPedidosAProvID_S.AsInteger);
     end;
  end;
end;

procedure TFMTraspasoPedCliAPedPro.DBGLineasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMTraspasoPedCliAPedPro.TMPPedidosAProv.RecordCount > 0 then
     if ((UpperCase(Column.FieldName) = 'ARTICULO') or
        (UpperCase(Column.FieldName) = 'PEDIDO')) then
        CeldaEnlace(DBGLineas, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
        begin
           if (DMTraspasoPedCliAPedPro.TMPPedidosAProvSTOCK_ALM.AsFloat > 0) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFMTraspasoPedCliAPedPro.TButtRegeneraClick(Sender: TObject);
begin
  LFEProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
  DMTraspasoPedCliAPedPro.CaptaPedidos(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMTraspasoPedCliAPedPro.EFontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  if (RichEditConFoco <> nil) then
     with RichEditConFoco do
     begin
        if SelLength > 0 then
           SelAttributes.Size := StrToInt(EFontSize.Text)
        else
           DefAttributes.Size := StrToInt(EFontSize.Text);
     end;
end;

procedure TFMTraspasoPedCliAPedPro.DBRENotasSelectionChange(Sender: TObject);
begin
  try
     FUpdating := True;
     with DBRENotas.Paragraph do
     begin
        EFontSize.Text := IntToStr(DBRENotas.SelAttributes.Size);
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMTraspasoPedCliAPedPro.DBRENotas2SelectionChange(Sender: TObject);
begin
  try
     FUpdating := True;
     with DBRENotas2.Paragraph do
     begin
        EFontSize.Text := IntToStr(DBRENotas2.SelAttributes.Size);
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMTraspasoPedCliAPedPro.DBRENotasEnter(Sender: TObject);
begin
  RichEditConFoco := DBRENotas;
end;

procedure TFMTraspasoPedCliAPedPro.DBRENotas2Enter(Sender: TObject);
begin
  RichEditConFoco := DBRENotas2;
end;

procedure TFMTraspasoPedCliAPedPro.PNLNotasResize(Sender: TObject);
begin
  DBRENotas2.Width := PNLNotas.Width div 2;
end;

procedure TFMTraspasoPedCliAPedPro.TButtInfStocksClick(Sender: TObject);
begin
  inherited;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMTraspasoPedCliAPedPro.TMPPedidosAProvARTICULO.AsString, DMTraspasoPedCliAPedPro.TMPPedidosAProvALMACEN.AsString, Self);
end;

end.
