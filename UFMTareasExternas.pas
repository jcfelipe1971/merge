unit UFMTareasExternas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  ULFEditFind2000, ULFLabel, ULFComboBox, Mask, rxToolEdit, ULFDateEdit,
  ULFEdit, HYFIBQuery, DBCtrls, ULFDBMemo, ULFDBEdit;

type
  THackDBGrid = class(TDBGrid);

type
  TFMTareasExternas = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     Splitter: TSplitter;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavRelacion: THYMNavigator;
     TBSep1: TToolButton;
     TBGrabarSalida: TToolButton;
     TBGrabarEntrada: TToolButton;
     AFTodos: TAction;
     AFCerrados: TAction;
     CBAlmacenStockVirtual: TCheckBox;
     TBSep2: TToolButton;
     AArticulo: TAction;
     AOrdenProduccion: TAction;
     ACliente: TAction;
     AProveedor: TAction;
     APedido: TAction;
     APedidoProveedor: TAction;
     AMovimientoStock: TAction;
     ACompuesto: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     ACompuestoComponente: TAction;
     PnlFiltro: TLFPanel;
     CBSeries: TLFComboBox;
     LSerie: TLFLabel;
     ETitulocliente: TLFEdit;
     EFCliente: TLFEditFind2000;
     LCliente: TLFLabel;
     EFOrdenProduccion: TLFEditFind2000;
     LOrdenProduccion: TLFLabel;
     ETituloArticulo: TLFEdit;
     EFArticulo: TLFEditFind2000;
     LFiltroArticulo: TLFLabel;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     ETituloProveedor: TLFEdit;
     LDesdeFecEntrega: TLFLabel;
     DEDesdeFec: TLFDateEdit;
     LHastaFecEntrega: TLFLabel;
     DEHastaFec: TLFDateEdit;
     PnlTop: TLFPanel;
     PNLInfoTarea: TLFPanel;
     Imagen: TImage;
     DBMComentario: TLFDBMemo;
     DBETarea: TLFDbedit;
     PNLInfoTareaDerecha: TLFPanel;
     CBSituacion: TLFComboBox;
     LSituacion: TLabel;
     DBEImagen: TDBEdit;
     TmrImagen: TTimer;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFOrdenProduccionChange(Sender: TObject);
     procedure DBGMainTitleClick(Column: TColumn);
     procedure CBSeriesChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure TBGrabarSalidaClick(Sender: TObject);
     procedure AFTodosExecute(Sender: TObject);
     procedure AFCerradosExecute(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure CBAlmacenStockVirtualClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBGrabarEntradaClick(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure DBGMainDblClick(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure AArticuloExecute(Sender: TObject);
     procedure AOrdenProduccionExecute(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure AProveedorExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure APedidoExecute(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure APedidoProveedorExecute(Sender: TObject);
     procedure AMovimientoStockExecute(Sender: TObject);
     procedure ACompuestoExecute(Sender: TObject);
     procedure ACompuestoComponenteExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBEImagenChange(Sender: TObject);
     procedure TmrImagenTimer(Sender: TObject);
  private
     { Private declarations }
     ColumnaOrden: integer;
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMTareasExternas : TFMTareasExternas;

implementation

uses UDMMain, UUtiles, UDameDato, UDMTareasExternas, UFormGest,
  UFMListConfig, UEntorno, UFMain, FIBQuery, UProFMTrabExtS, UProFMTrabExtE,
  UFMDocInfoStocks, URellenaLista, UImagenes;

{$R *.dfm}

procedure TFMTareasExternas.FormCreate(Sender: TObject);
begin
  inherited;
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  ColumnaOrden := -1;
  AbreData(TDMTareasExternas, DMTareasExternas);
  NavMain.DataSource := DMTareasExternas.DSQMPRO_ORD_TAREA_TEX;
  DBGMain.DataSource := DMTareasExternas.DSQMPRO_ORD_TAREA_TEX;
  NavRelacion.DataSource := DMTareasExternas.DSQMPRO_ORD_TAREA_TEX_MOVS;
  DBGFDetalle.DataSource := DMTareasExternas.DSQMPRO_ORD_TAREA_TEX_MOVS;
  CBSeriesChange(Self);
  ColActual := DBGMain.Columns[0];
end;

procedure TFMTareasExternas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTareasExternas);
end;

procedure TFMTareasExternas.FormShow(Sender: TObject);
begin
  inherited;
  TmrImagen.Enabled := True;
end;

procedure TFMTareasExternas.EFOrdenProduccionChange(Sender: TObject);
begin
  inherited;
  CBSeriesChange(Sender);
end;

procedure TFMTareasExternas.EFClienteChange(Sender: TObject);
begin
  inherited;
  ETitulocliente.Text := DameTitulocliente(StrToIntDef(EFCliente.Text, 0));
  CBSeriesChange(Sender);
end;

procedure TFMTareasExternas.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
  CBSeriesChange(Self);
end;

procedure TFMTareasExternas.CBSeriesChange(Sender: TObject);
var
  Serie : string;
begin
  if (CBSeries.ItemIndex = 0) then
     Serie := ''
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
  end;
  DMTareasExternas.AbreTabla(Serie, EFOrdenProduccion.Text, Trim(EFCliente.Text), Trim(EFArticulo.Text), Trim(EFProveedor.Text), DEDesdeFec.Date, DEHastaFec.Date, CBSituacion.ItemIndex{CBMostrarOrdenesCerradas.Checked}, ColumnaOrden);
end;

procedure TFMTareasExternas.DBGMainTitleClick(Column: TColumn);
begin
  inherited;
  // El ordenamiento debe hacerse a mano porque el SQL es complejo y tiene la sentencia ORDER BY dentro de subselects
  if (ColumnaOrden = Column.Field.FieldNo) then
     ColumnaOrden := ColumnaOrden * (-1)
  else
     ColumnaOrden := Column.Field.FieldNo;

  CBSeriesChange(Self);
end;

procedure TFMTareasExternas.TBGrabarSalidaClick(Sender: TObject);
begin
  inherited;
  // DMTareasExternas.GrabarSalida;
  AbreForm(TProFMTrabExtS, ProFMTrabExtS, Sender);

  DMTareasExternas.QMPro_Ord_Tarea_Tex_Movs.Insert;
  DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsTIPO_OPERACION.AsString := 'S';

  ProFMTrabExtS.Hide;
  ProFMTrabExtS.ShowModal;
end;

procedure TFMTareasExternas.AFTodosExecute(Sender: TObject);
begin
  inherited;
  // Todas las Ordenes
  CBSituacion.ItemIndex := 0;

  CBSeriesChange(Self);
end;

procedure TFMTareasExternas.AFCerradosExecute(Sender: TObject);
begin
  inherited;
  // Ordenes Cerradas
  CBSituacion.ItemIndex := 4;

  CBSeriesChange(Self);
end;

procedure TFMTareasExternas.EFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));

  CBSeriesChange(Self);
end;

procedure TFMTareasExternas.CBAlmacenStockVirtualClick(Sender: TObject);
begin
  inherited;
  DMTareasExternas.SetCalculaStockVirtual(CBAlmacenStockVirtual.Checked);
end;

procedure TFMTareasExternas.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  // Coloreamos el borde para indicar que estas columnas son enlaces
  inherited;
  if ((UpperCase(Column.FieldName) = 'COMPUESTO') or (UpperCase(Column.FieldName) = 'ID_ORDEN') or (UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'PEDIDO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     if (UpperCase(Column.FieldName) = 'SITUACION') or (UpperCase(Column.FieldName) = 'TITULO_SITUACION') then
        ColorSegunSituacion(Canvas, DMTareasExternas.QMPro_Ord_Tarea_TexSITUACION.AsInteger)
     else
     begin
        if (THackDBGrid(Sender).DataLink.ActiveRecord + 1 = THackDBGrid(Sender).Row) or (gdFocused in State) or (gdSelected in State) then
           Canvas.Brush.Color := Brighten(clHighlight, 70);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMTareasExternas.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'PROVEEDOR') or (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'COMPUESTO_COMPONENTE') or (UpperCase(Column.FieldName) = 'SERIE_DOC') or (UpperCase(Column.FieldName) = 'RIG_DOC') or (UpperCase(Column.FieldName) = 'SERIE_ST') or (UpperCase(Column.FieldName) = 'RIG_ST')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'STOCK_PERPARACION') then
        begin
           if (not CBAlmacenStockVirtual.Checked) then
              ColorInactivo(Canvas)
           else
           if (DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsSTOCK_PERPARACION.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_TEX') then
        begin
           if (not CBAlmacenStockVirtual.Checked) then
              ColorInactivo(Canvas)
           else
           if (DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsSTOCK_TEX.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMTareasExternas.TBGrabarEntradaClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMTrabExtE, ProFMTrabExtE, Sender);

  DMTareasExternas.QMPro_Ord_Tarea_Tex_Movs.Insert;
  DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsTIPO_OPERACION.AsString := 'E';
  DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsTIPO_DOC.AsString := 'ALP';
  DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsALMACEN_PERPARACION.AsString := DMTareasExternas.QMPro_Ord_Tarea_TexALMACEN_ENTRADA.AsString;

  ProFMTrabExtE.Hide;
  ProFMTrabExtE.ShowModal;
end;

procedure TFMTareasExternas.TbuttCompClick(Sender: TObject);
var
  alm : string;
begin
  inherited;
  alm := REntorno.AlmacenDefecto;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMTareasExternas.QMPro_Ord_Tarea_TexCOMPUESTO.AsString, alm, Self);
end;

procedure TFMTareasExternas.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'COMPUESTO') then
     ACompuesto.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'ID_ORDEN') then
     AOrdenProduccion.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
     ACliente.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'PEDIDO') then
     APedido.Execute;
end;

procedure TFMTareasExternas.DBGMainCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMTareasExternas.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMTareasExternas.ACompuestoExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AArticulos,
        'ARTICULO = ' + QuotedStr(DMTareasExternas.QMPro_Ord_Tarea_TexCOMPUESTO.AsString));
end;

procedure TFMTareasExternas.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AArticulos,
        'ARTICULO = ' + QuotedStr(DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsARTICULO.AsString));
end;

procedure TFMTareasExternas.AOrdenProduccionExecute(Sender: TObject);
begin
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DMTareasExternas.QMPro_Ord_Tarea_TexID_ORDEN.AsInteger));
end;

procedure TFMTareasExternas.AClienteExecute(Sender: TObject);
begin
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMTareasExternas.QMPro_Ord_Tarea_TexCLIENTE.AsInteger));
end;

procedure TFMTareasExternas.APedidoExecute(Sender: TObject);
begin
  if EstructuraCreada then
     FMain.MuestraDocumento(DMTareasExternas.QMPro_Ord_Tarea_TexEJERCICIO.AsInteger,
        'PEC',
        DMTareasExternas.QMPro_Ord_Tarea_TexSERIE.AsString,
        DMTareasExternas.QMPro_Ord_Tarea_TexPEDIDO.AsInteger);
end;

procedure TFMTareasExternas.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     AArticulo.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'COMPUESTO_COMPONENTE') then
     ACompuestoComponente.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'PROVEEDOR') then
     AProveedor.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'TIPO_DOC') or (UpperCase(ColActual.FieldName) = 'RIG_DOC') or (UpperCase(ColActual.FieldName) = 'SERIE_DOC') then
     APedidoProveedor.Execute
  else
  if (UpperCase(ColActual.FieldName) = 'RIG_ST') or (UpperCase(ColActual.FieldName) = 'SERIE_ST') then
     AMovimientoStock.Execute;
end;

procedure TFMTareasExternas.AProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AProveedores,
        'PROVEEDOR=' + IntToStr(DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsPROVEEDOR.AsInteger) +
        ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TFMTareasExternas.APedidoProveedorExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.MuestraDocumento(DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsEJERCICIO_DOC.AsInteger,
        DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsTIPO_DOC.AsString,
        DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsSERIE_DOC.AsString,
        DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsRIG_DOC.AsInteger);
  end;
end;

procedure TFMTareasExternas.AMovimientoStockExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.MuestraDocumento(DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsEJERCICIO_ST.AsInteger,
        'MVT',
        DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsSERIE_ST.AsString,
        DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsRIG_ST.AsInteger);
  end;
end;

procedure TFMTareasExternas.ACompuestoComponenteExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AArticulos,
        'ARTICULO = ' + QuotedStr(DMTareasExternas.QMPro_Ord_Tarea_Tex_MovsCOMPUESTO_COMPONENTE.AsString));
end;

procedure TFMTareasExternas.DBEImagenChange(Sender: TObject);
begin
  inherited;
  TmrImagen.Enabled := False;
  TmrImagen.Enabled := True;
end;

procedure TFMTareasExternas.TmrImagenTimer(Sender: TObject);
begin
  inherited;
  TmrImagen.Enabled := False;
  RefrescarImagen(Imagen, DMTareasExternas.QMPro_Ord_Tarea_TexIMAGEN_COMPUESTO.AsInteger);
end;

end.
