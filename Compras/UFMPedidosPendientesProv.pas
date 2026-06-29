unit UFMPedidosPendientesProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls, UControlEdit,
  UFormGest, Mask, NsDBGrid, rxToolEdit, ULFDBEdit, ULFPanel, ULFComboBox,
  ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel,
  rxPlacemnt, ULFFormStorage, FIBDataSet, FIBDatabase, ULFEdit, ULFMemo,
  ULFDateEdit, UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas, HYFIBQuery,
  UNavigator;

type
  TFMPedidosPendientesProv = class(TFPEditSinNavegador)
     PNLSeparador: TLFPanel;
     TButtSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtMostrarFiltros: TToolButton;
     TButtDesmarcar: TToolButton;
     DBGFPedidosPendientes: TDBGridFind2000;
     TButtSep1: TToolButton;
     TButtRefrescar: TToolButton;
     TBFiltroProveedores: TLFToolBar;
     TButtAnyadirSelecProveedors: TToolButton;
     TButtQuitarSelecProveedor: TToolButton;
     PNLClientes: TLFPanel;
     EFProveedorDesde: TLFEditFind2000;
     EFProveedorHasta: TLFEditFind2000;
     LDesdeProveedor: TLFLabel;
     LHastaProveedor: TLFLabel;
     ETituloProveedorDesde: TLFEdit;
     ETituloProveedorHasta: TLFEdit;
     TBFiltroFechaEntrega: TLFToolBar;
     TButtAnyadirSelecFechas: TToolButton;
     TButtQuitarSelecFechas: TToolButton;
     PNLSeleccionFechas: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesdeFecha: TLFDateEdit;
     DTPHastaFecha: TLFDateEdit;
     PNLSeleccionSerieProveedor: TLFPanel;
     LBLSerie: TLFLabel;
     CBSeries: TLFComboBox;
     LProveedor: TLFLabel;
     LFechaPrevista: TLFLabel;
     TBFiltroFechaConfirmada: TLFToolBar;
     TButtAnyadirFechaConfirmada: TToolButton;
     TButtQuitarFechaConfirmada: TToolButton;
     PNLFiltroFechaConfirmada: TLFPanel;
     LFechaConfirmada: TLFLabel;
     LFechaConfirmadaVacia: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AEnviarCorreos: TAction;
     AConfiguracionRapida: TAction;
     PNLRelacion: TPanel;
     DBGFRelacion: TDBGridFind2000;
     LFCategoryAction2: TLFCategoryAction;
     ANoCalcularStock: TAction;
     AEnviarPedidos: TAction;
     TButtSep3: TToolButton;
     TButtInfoStock: TToolButton;
     LBLProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     ETituloProveedor: TLFEdit;
     PNLColores: TLFPanel;
     LSinStock: TLFLabel;
     LPreparado: TLFLabel;
     LStockSuficiente: TLFLabel;
     LStockNoSuficiente: TLFLabel;
     LPreparable: TLFLabel;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     ETituloFamilia: TLFEdit;
     Splitter: TSplitter;
     TBDetalle: TLFToolBar;
     NavRelacion: THYMNavigator;
     TBSep1: TToolButton;
     TBBorrarRelacion: TToolButton;
     EArticulo: TLFEdit;
     LFiltraArticulo: TLFLabel;
     LClienteRelacionado: TLFLabel;
     EFCliente: TLFEditFind2000;
     ECliente: TLFEdit;
     LFCategoryAction3: TLFCategoryAction;
     ANoCalcularStock2: TAction;
     CBPedidosCliente: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtMostrarFiltrosClick(Sender: TObject);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtAnyadirSelecFechasClick(Sender: TObject);
     procedure TButtQuitarSelecFechasClick(Sender: TObject);
     procedure TButtAnyadirSelecProveedorsClick(Sender: TObject);
     procedure TButtQuitarSelecProveedorClick(Sender: TObject);
     procedure EFProveedorDesdeChange(Sender: TObject);
     procedure EFProveedorHastaChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure TButtAnyadirFechaConfirmadaClick(Sender: TObject);
     procedure TButtQuitarFechaConfirmadaClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure AEnviarCorreosExecute(Sender: TObject);
     procedure AConfiguracionRapidaExecute(Sender: TObject);
     procedure DBGFPedidosPendientesDblClick(Sender: TObject);
     procedure DBGFPedidosPendientesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFRelacionDblClick(Sender: TObject);
     procedure DBGFRelacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFPedidosPendientesCellClick(Column: TColumn);
     procedure AStockAlmacenExecute(Sender: TObject);
     procedure AEnviarPedidosExecute(Sender: TObject);
     procedure TButtInfoStockClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure DBGFPedidosPendientesTitleClick(Column: TColumn);
     procedure EFFamiliaChange(Sender: TObject);
     procedure TBBorrarRelacionClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EArticuloChange(Sender: TObject);
     procedure ELClienteRelacionadoChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure CBPedidosClienteChange(Sender: TObject);
  private
     { Private declarations }
     Serie: string;
     ColActual: TColumn;
     ColumnaOrden: integer;
     MostrandoFiltros: boolean;
  public
     { Public declarations }
  end;

var
  FMPedidosPendientesProv : TFMPedidosPendientesProv;

implementation

uses UDMMain, UDMPedidosPendientesProv, UEntorno, UUtiles, UFMain, DateUtils, UFMListConfig, UFMDocInfoStocks, UParam, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMPedidosPendientesProv.FormCreate(Sender: TObject);
var
  Lista : TStrings;
  i : integer;
  NuevaAccion : TAction;
  Param_ARTSTKD001 : string;
  Param_PPPSTK2001 : string;
begin
  inherited;
  MostrandoFiltros := False;
  ColumnaOrden := -1;
  AbreData(TDMPedidosPendientesProv, DMPedidosPendientesProv);

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  Serie := '';

  // Valor para marcado
  DBGFPedidosPendientes.ColumnasChecked.Strings[DBGFPedidosPendientes.ColumnasCheckBoxes.IndexOf('ENTRADA_RECEPCION')] := REntorno.EntradaStr;

  // Inicializo filtros
  DTPDesdeFecha.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), 1);
  DTPHastaFecha.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), DaysInAMonth(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab)));
  EFProveedorDesde.Text := '';
  EFProveedorHasta.Text := '';

  TButtRefrescar.Click;

  ColActual := DBGFPedidosPendientes.Columns[0];

  // Genero acciones para filtrar por los diferentes almacenes de lanzamiento.
  Lista := TStringList.Create;

  try
     RellenaAlmacenes(Lista);

     for i := 0 to Lista.Count - 1 do
     begin
        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('AStockAlmacen%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 128;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 1;
        NuevaAccion.Category := 'Stock';
        NuevaAccion.OnExecute := AStockAlmacenExecute;

        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('AStockAlmacen_2%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 128;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 2;
        NuevaAccion.Category := 'Stock2';
        NuevaAccion.OnExecute := AStockAlmacenExecute;
     end;
  finally
     Lista.Free;
  end;

  Param_ARTSTKD001 := LeeParametro('ARTSTKD001');
  if ((Param_ARTSTKD001 = 'DEFECTO')) then
     DMPedidosPendientesProv.StockAlmacen(REntorno.AlmacenDefecto)
  else
     DMPedidosPendientesProv.StockAlmacen(Param_ARTSTKD001);

  Param_PPPSTK2001 := LeeParametro('PPPSTK2001');
  if ((Param_PPPSTK2001 = 'DEFECTO')) then
     DMPedidosPendientesProv.StockAlmacen2(REntorno.AlmacenDefecto)
  else
     DMPedidosPendientesProv.StockAlmacen2(Param_PPPSTK2001);
end;

procedure TFMPedidosPendientesProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPedidosPendientesProv);
  Action := caFree;
end;

procedure TFMPedidosPendientesProv.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFPedidosPendientes, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFPedidosPendientes.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  CBPedidosClienteChange(Sender);
end;

procedure TFMPedidosPendientesProv.TButtMostrarFiltrosClick(Sender: TObject);
begin
  // Cambio el estado
  MostrandoFiltros := not MostrandoFiltros;

  // Se hacen visibles/invisibles las toolbars de filtros
  TBFiltroFechaEntrega.Visible := MostrandoFiltros;
  TBFiltroProveedores.Visible := MostrandoFiltros;
  TBFiltroFechaConfirmada.Visible := MostrandoFiltros;

  // Cambio icono y hint
  if MostrandoFiltros then
  begin
     TButtMostrarFiltros.ImageIndex := 22;
     TButtMostrarFiltros.Hint := _('Ocultar los filtros de marcado');
  end
  else
  begin
     TButtMostrarFiltros.ImageIndex := 23;
     TButtMostrarFiltros.Hint := _('Mostrar los filtros de marcado');
  end;
end;

procedure TFMPedidosPendientesProv.TButtTodosClick(Sender: TObject);
begin
  DMPedidosPendientesProv.MarcarTodo(Serie, REntorno.Entrada);
end;

procedure TFMPedidosPendientesProv.TButtDesmarcarClick(Sender: TObject);
begin
  DMPedidosPendientesProv.MarcarTodo(Serie, 0);
end;

procedure TFMPedidosPendientesProv.TButtAnyadirSelecFechasClick(Sender: TObject);
begin
  DMPedidosPendientesProv.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, REntorno.Entrada, Serie);
end;

procedure TFMPedidosPendientesProv.TButtQuitarSelecFechasClick(Sender: TObject);
begin
  DMPedidosPendientesProv.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, 0, Serie);
end;

procedure TFMPedidosPendientesProv.TButtAnyadirSelecProveedorsClick(Sender: TObject);
begin
  if ((StrToIntDef(EFProveedorDesde.Text, -999) <> -999) and (StrToIntDef(EFProveedorHasta.Text, -999) <> -999)) then
     DMPedidosPendientesProv.MarcarPorProveedor(StrToInt(EFProveedorDesde.Text), StrToInt(EFProveedorHasta.Text), REntorno.Entrada, Serie);
end;

procedure TFMPedidosPendientesProv.TButtQuitarSelecProveedorClick(Sender: TObject);
begin
  if ((StrToIntDef(EFProveedorDesde.Text, -999) <> -999) and (StrToIntDef(EFProveedorHasta.Text, -999) <> -999)) then
     DMPedidosPendientesProv.MarcarPorProveedor(StrToInt(EFProveedorDesde.Text), StrToInt(EFProveedorHasta.Text), 0, Serie);
end;

procedure TFMPedidosPendientesProv.EFProveedorDesdeChange(Sender: TObject);
begin
  ETituloProveedorDesde.Text := DameTituloProveedor(StrToIntDef(EFProveedorDesde.Text, 0));
end;

procedure TFMPedidosPendientesProv.EFProveedorHastaChange(Sender: TObject);
begin
  ETituloProveedorHasta.Text := DameTituloProveedor(StrToIntDef(EFProveedorHasta.Text, 0));
end;

procedure TFMPedidosPendientesProv.CBSeriesChange(Sender: TObject);
begin
  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.Text = _('Todas las Series')) then
        Serie := ''
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;

     DMPedidosPendientesProv.AbreTabla(Serie, Trim(EFFamilia.Text), EArticulo.Text, StrToIntDef(EFProveedor.Text, 0), StrToIntDef(EFCliente.Text, 0), ColumnaOrden);
  end;
end;

procedure TFMPedidosPendientesProv.TButtRefrescarClick(Sender: TObject);
begin
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesProv.TButtAnyadirFechaConfirmadaClick(Sender: TObject);
begin
  DMPedidosPendientesProv.MarcarPorFechaConfirmadaVacia(REntorno.Entrada, Serie);
end;

procedure TFMPedidosPendientesProv.TButtQuitarFechaConfirmadaClick(Sender: TObject);
begin
  DMPedidosPendientesProv.MarcarPorFechaConfirmadaVacia(0, Serie);
end;

procedure TFMPedidosPendientesProv.AEnviarCorreosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesProv.EnviarCorreos(Serie);
end;

procedure TFMPedidosPendientesProv.AEnviarPedidosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesProv.EnviarPedidos(Serie);
  TButtRefrescar.Click;
end;

procedure TFMPedidosPendientesProv.AConfiguracionRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;

  TFMListConfig.Create(Self).Muestra(2012, Formato, Cabecera, Copias, Pijama, Serie, DMPedidosPendientesProv.frListado);
end;

procedure TFMPedidosPendientesProv.DBGFPedidosPendientesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'RIG') then
  begin
     if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ID_DETALLES_E').AsInteger <> 0) then
     begin
        FMain.TraspasoDeDocumentosEntrada(DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ID_E').AsInteger);
     end;
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ID_ORDEN') then
  begin
     if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ID_ORDEN').AsInteger > 0) then
        FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ID_ORDEN').AsInteger));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ARTICULO').AsString + '''');
  end;
end;

procedure TFMPedidosPendientesProv.DBGFPedidosPendientesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'ID_ORDEN')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'FECHA_ENTREGA_PREV_CLI') then
        begin
           if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('FECHA_ENTREGA_PREV_CLI').AsDateTime < DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('FECHA_PRE_DET').AsDateTime) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
        begin
           if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('STOCK_ALM').AsFloat < 0) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_ALM_2') then
        begin
           if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('STOCK_ALM_2').AsFloat < 0) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_MINIMO') then
        begin
           if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('STOCK_ALM').AsFloat < DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('STOCK_MINIMO').AsFloat) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'PEDIDOS_D_CLI') then
        begin
           if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('PEDIDOS_D_CLI').AsFloat > 0) then
              ColorResaltado3(Canvas);
        end;
     end;
  end;
  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMPedidosPendientesProv.DBGFRelacionDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMPedidosPendientesProv.xRelacion.FieldByName('ID_S').AsInteger);
end;

procedure TFMPedidosPendientesProv.DBGFRelacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'RIG') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'FECHA_ENTREGA_PREV') then
        begin
           if (DMPedidosPendientesProv.xRelacion.FieldByName('FECHA_ENTREGA_PREV').AsDateTime <> 0) then
              if (DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('FECHA_PRE_DET').AsDateTime > DMPedidosPendientesProv.xRelacion.FieldByName('FECHA_ENTREGA_PREV').AsDateTime) then
                 ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'CANAL') then
        begin
           if (DMPedidosPendientesProv.xRelacion.FieldByName('CANAL').AsInteger <> REntorno.Canal) then
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPedidosPendientesProv.DBGFPedidosPendientesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMPedidosPendientesProv.AStockAlmacenExecute(Sender: TObject);
var
  Almacen : string;
  InfoStock : integer;
  i : integer;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Almacen := TAction(Sender).Caption;
  InfoStock := TAction(Sender).Tag;
  if (Almacen = _('No calcular stock')) then
     Almacen := 'NOCALC'
  else
  if (Almacen = _('Todos los Almacenes')) then
     Almacen := ''
  else
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);

  if (InfoStock = 1) then
  begin
     DMPedidosPendientesProv.StockAlmacen(Almacen);

     i := EncuentraField(DBGFPedidosPendientes, 'STOCK_ALM');
     if (i >= 0) then
        DBGFPedidosPendientes.Columns[i].Visible := (Almacen <> 'NOCALC')
     else
     begin
        with DBGFPedidosPendientes.Columns.Add do
        begin
           FieldName := 'STOCK_ALM';
           Visible := (Almacen <> 'NOCALC');
        end;
     end;

     i := EncuentraField(DBGFPedidosPendientes, 'STOCK_MINIMO');
     if (i >= 0) then
        DBGFPedidosPendientes.Columns[i].Visible := (Almacen <> 'NOCALC')
     else
     begin
        with DBGFPedidosPendientes.Columns.Add do
        begin
           FieldName := 'STOCK_MINIMO';
           Visible := (Almacen <> 'NOCALC');
        end;
     end;
  end
  else
  if (InfoStock = 2) then
  begin
     DMPedidosPendientesProv.StockAlmacen2(Almacen);
     i := EncuentraField(DBGFPedidosPendientes, 'STOCK_ALM_2');
     if (i >= 0) then
        DBGFPedidosPendientes.Columns[i].Visible := (Almacen <> 'NOCALC')
     else
     begin
        with DBGFPedidosPendientes.Columns.Add do
        begin
           FieldName := 'STOCK_ALM_2';
           Visible := (Almacen <> 'NOCALC');
        end;
     end;
  end;
end;

procedure TFMPedidosPendientesProv.CBPedidosClienteChange(Sender: TObject);
var
  i : integer;
begin
  inherited;

  DMPedidosPendientesProv.CalculaPedidosCliente(CBPedidosCliente.Checked);
  i := EncuentraField(DBGFPedidosPendientes, 'PEDIDOS_D_CLI');
  if (i >= 0) then
     DBGFPedidosPendientes.Columns[i].Visible := CBPedidosCliente.Checked
  else
  begin
     with DBGFPedidosPendientes.Columns.Add do
     begin
        FieldName := 'PEDIDOS_D_CLI';
        Visible := CBPedidosCliente.Checked;
     end;
  end;
end;

procedure TFMPedidosPendientesProv.TButtInfoStockClick(Sender: TObject);
begin
  inherited;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ARTICULO').AsString, DMPedidosPendientesProv.QMPedidosPendientesProv.FieldByName('ALMACEN').AsString, Self);
end;

procedure TFMPedidosPendientesProv.EFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesProv.DBGFPedidosPendientesTitleClick(Column: TColumn);
begin
  // El ordenamiento debe hacerse a mano porque el SQL es complejo y tiene la sentencia ORDER BY dentro de subselects
  if (ColumnaOrden = Column.Field.FieldNo) then
     ColumnaOrden := ColumnaOrden * (-1)
  else
     ColumnaOrden := Column.Field.FieldNo;
  DMPedidosPendientesProv.AbreTabla(Serie, Trim(EFFamilia.Text), EArticulo.Text, StrToIntDef(EFProveedor.Text, 0), StrToIntDef(EFCliente.Text, 0), ColumnaOrden, True);
end;

procedure TFMPedidosPendientesProv.EFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloFamilia.Text := DameTituloFamilia(EFFamilia.Text);
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesProv.TBBorrarRelacionClick(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Esta seguro de querer borrar la relacion entre documentos')) then
     DMPedidosPendientesProv.BorrarRelacion;
end;

procedure TFMPedidosPendientesProv.EArticuloChange(Sender: TObject);
begin
  inherited;
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesProv.ELClienteRelacionadoChange(Sender: TObject);
begin
  inherited;
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesProv.EFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
  CBSeriesChange(Sender);
end;

end.
