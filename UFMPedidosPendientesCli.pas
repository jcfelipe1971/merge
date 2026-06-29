unit UFMPedidosPendientesCli;

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
  TFMPedidosPendientesCli = class(TFPEditSinNavegador)
     PNLSeparador: TLFPanel;
     TButtSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtMostrarFiltros: TToolButton;
     TButtDesmarcar: TToolButton;
     DBGFPedidosPendientes: TDBGridFind2000;
     TButtRefrescar: TToolButton;
     TBFiltroclientes: TLFToolBar;
     TButtAnyadirSelecclientes: TToolButton;
     TButtQuitarSeleccliente: TToolButton;
     PNLClientes: TLFPanel;
     EFclienteDesde: TLFEditFind2000;
     EFclienteHasta: TLFEditFind2000;
     LDesdecliente: TLFLabel;
     LHastacliente: TLFLabel;
     ETituloclienteDesde: TLFEdit;
     ETituloclienteHasta: TLFEdit;
     TBFiltroFechaEntrega: TLFToolBar;
     TButtAnyadirSelecFechas: TToolButton;
     TButtQuitarSelecFechas: TToolButton;
     PNLSeleccionFechas: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesdeFecha: TLFDateEdit;
     DTPHastaFecha: TLFDateEdit;
     PNLSeleccionSeriecliente: TLFPanel;
     LBLSerie: TLFLabel;
     CBSeries: TLFComboBox;
     Lcliente: TLFLabel;
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
     LBLcliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     ETitulocliente: TLFEdit;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     ETituloFamilia: TLFEdit;
     TButtSep4: TToolButton;
     AHojaPreparacionPedido: TAction;
     LFCategoryAction3: TLFCategoryAction;
     PNLCabOtrosPNLPreparacion: TLFPanel;
     LAlmacenPreparacion: TLFLabel;
     CBAlmacenesPreparacion: TLFComboBox;
     TButtMarcarPreparables: TToolButton;
     TBHojasPreparacion: TLFToolBar;
     TButtGeneraHojas: TToolButton;
     TButtMarcarSemiPreparables: TToolButton;
     LBLResponsable: TLFLabel;
     EFResponsable: TLFEditFind2000;
     ETituloResponsable: TLFEdit;
     LUbicacionSimple: TLFLabel;
     EFUbicacionSimple: TLFEditFind2000;
     ETituloUbicacionSimple: TLFEdit;
     PNLColores: TLFPanel;
     LSinStock: TLFLabel;
     LPreparado: TLFLabel;
     LStockSuficiente: TLFLabel;
     LStockNoSuficiente: TLFLabel;
     LPreparable: TLFLabel;
     Splitter: TSplitter;
     TBDetalle: TLFToolBar;
     NavRelacion: THYMNavigator;
     TBSep1: TToolButton;
     TBBorrarRelacion: TToolButton;
     BHoy: TButton;
     BMes: TButton;
     BMesAnterio: TButton;
     BDiaAnterior: TButton;
     BMDiaSiguiente: TButton;
     BMesSiguiente: TButton;
     BEjercicio: TButton;
     PNLFiltroFecEntrega: TLFPanel;
     LDesdeFecEntrega: TLFLabel;
     LHastaFecEntrega: TLFLabel;
     LFiltroFechaEntrega: TLFLabel;
     DEDesdeFecEntrega: TLFDateEdit;
     DEHastaFecEntrega: TLFDateEdit;
     EArticulo: TLFEditFind2000;
     LArticulo: TLFLabel;
     EArticuloTitulo: TLFEdit;
     AListado: TAction;
     AConfiguracionRapidaListado: TAction;
     LFCategoryAction4: TLFCategoryAction;
     CBPedidosProveedor: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtMostrarFiltrosClick(Sender: TObject);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtAnyadirSelecFechasClick(Sender: TObject);
     procedure TButtQuitarSelecFechasClick(Sender: TObject);
     procedure TButtAnyadirSelecclientesClick(Sender: TObject);
     procedure TButtQuitarSelecclienteClick(Sender: TObject);
     procedure EFclienteDesdeChange(Sender: TObject);
     procedure EFclienteHastaChange(Sender: TObject);
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
     procedure EFClienteChange(Sender: TObject);
     procedure EFFamiliaChange(Sender: TObject);
     procedure AHojaPreparacionPedidoExecute(Sender: TObject);
     procedure TButtMarcarPreparablesClick(Sender: TObject);
     procedure TButtMarcarSemiPreparablesClick(Sender: TObject);
     procedure EFResponsableChange(Sender: TObject);
     procedure EFUbicacionSimpleChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TBBorrarRelacionClick(Sender: TObject);
     procedure BHoyClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BDiaAnteriorClick(Sender: TObject);
     procedure BMDiaSiguienteClick(Sender: TObject);
     procedure BMesAnterioClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure DEDesdeFecEntregaChange(Sender: TObject);
     procedure DEHastaFecEntregaChange(Sender: TObject);
     procedure DBGFPedidosPendientesTitleClick(Column: TColumn);
     procedure EArticuloChange(Sender: TObject);
     procedure AConfiguracionRapidaListadoExecute(Sender: TObject);
     procedure AListadoExecute(Sender: TObject);
     procedure CBPedidosProveedorChange(Sender: TObject);
  private
     { Private declarations }
     Serie: string;
     ColActual: TColumn;
     ColumnaOrden: integer;
     MostrandoFiltros: boolean;
     Almacen: string;
  public
     { Public declarations }
  end;

var
  FMPedidosPendientesCli : TFMPedidosPendientesCli;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFMain, DateUtils, UDMPedidosPendientesCli, UFMListConfig, UFMDocInfoStocks, UParam, URellenaLista;

{$R *.DFM}

procedure TFMPedidosPendientesCli.FormCreate(Sender: TObject);
var
  Lista : TStrings;
  i : integer;
  NuevaAccion : TAction;
  Param_ARTSTKD001 : string;
  AlmPreparacion : string;
  FechaPrevista : TDateTime;
begin
  inherited;
  MostrandoFiltros := False;
  ColumnaOrden := -1;
  AbreData(TDMPedidosPendientesCli, DMPedidosPendientesCli);

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  Serie := '';

  // Valor para marcado
  DBGFPedidosPendientes.ColumnasChecked.Strings[DBGFPedidosPendientes.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := REntorno.EntradaStr;

  // Inicializo filtros
  // Obtengo primera fecha de entrega prevista de detalle de pedidos abiertos.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 D.FECHA_ENTREGA_PREV ');
        SQL.Add(' FROM GES_DETALLES_S_PED D ');
        SQL.Add(' JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.EMPRESA = :EMPRESA AND ');
        SQL.Add(' D.CANAL = :CANAL AND ');
        SQL.Add(' D.SERVIDO = 0 AND ');
        SQL.Add(' C.ESTADO = 0 ');
        SQL.Add(' ORDER BY D.FECHA_ENTREGA_PREV ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FechaPrevista := FieldByName['FECHA_ENTREGA_PREV'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (FechaPrevista <= 0) then
     FechaPrevista := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), 1);

  DTPDesdeFecha.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), 1);
  DTPHastaFecha.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), DaysInAMonth(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab)));
  EFClienteDesde.Text := '';
  EFClienteHasta.Text := '';

  DEDesdeFecEntrega.Date := FechaPrevista;

  DEHastaFecEntrega.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), DaysInAMonth(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab)));

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
        NuevaAccion.Tag := 0;
        NuevaAccion.Category := 'Stock';
        NuevaAccion.OnExecute := AStockAlmacenExecute;
     end;
  finally
     Lista.Free;
  end;

  Param_ARTSTKD001 := LeeParametro('ARTSTKD001');
  if ((Param_ARTSTKD001 = 'DEFECTO')) then
     Almacen := REntorno.AlmacenDefecto
  else
     Almacen := Param_ARTSTKD001;

  DMPedidosPendientesCli.StockAlmacen(Almacen);

  RellenaAlmacenes(CBAlmacenesPreparacion.Items);

  // Buscamos almacen por defecto
  AlmPreparacion := REntorno.AlmacenDefecto;
  if (Trim(REntorno.AlmacenRestringido) > '') then
     AlmPreparacion := REntorno.AlmacenRestringido;

  CBAlmacenesPreparacion.ItemIndex := 0;
  while (Copy(CBAlmacenesPreparacion.Text, 1, 3) <> AlmPreparacion) do
     CBAlmacenesPreparacion.ItemIndex := CBAlmacenesPreparacion.ItemIndex + 1;

  if (Trim(REntorno.AlmacenRestringido) > '') then
     CBAlmacenesPreparacion.Enabled := False;
end;

procedure TFMPedidosPendientesCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPedidosPendientesCli);
end;

procedure TFMPedidosPendientesCli.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // Descripcion de Colores
  ColorError(LSinStock);
  ColorResaltado6(LPreparado);
  ColorResaltado2(LStockSuficiente);
  ColorResaltado5(LStockNoSuficiente);
  ColorResaltado(LPreparable);

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFPedidosPendientes, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFPedidosPendientes.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  CBPedidosProveedorChange(Sender);
end;

procedure TFMPedidosPendientesCli.TButtMostrarFiltrosClick(Sender: TObject);
begin
  // Cambio el estado
  MostrandoFiltros := not MostrandoFiltros;

  // Se hacen visibles/invisibles las toolbars de filtros
  TBFiltroFechaEntrega.Visible := MostrandoFiltros;
  TBFiltroclientes.Visible := MostrandoFiltros;
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

procedure TFMPedidosPendientesCli.TButtTodosClick(Sender: TObject);
begin
  DMPedidosPendientesCli.MarcarTodo(Serie, REntorno.Entrada, DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date);
end;

procedure TFMPedidosPendientesCli.TButtAnyadirSelecFechasClick(Sender: TObject);
begin
  DMPedidosPendientesCli.MarcarPorFecha(DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, DTPDesdeFecha.Date, DTPHastaFecha.Date, REntorno.Entrada, Serie);
end;

procedure TFMPedidosPendientesCli.TButtQuitarSelecFechasClick(Sender: TObject);
begin
  DMPedidosPendientesCli.MarcarPorFecha(DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, DTPDesdeFecha.Date, DTPHastaFecha.Date, 0, Serie);
end;

procedure TFMPedidosPendientesCli.TButtAnyadirSelecclientesClick(Sender: TObject);
begin
  if ((StrToIntDef(EFclienteDesde.Text, -999) <> -999) and (StrToIntDef(EFclienteHasta.Text, -999) <> -999)) then
     DMPedidosPendientesCli.MarcarPorcliente(DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, StrToInt(EFclienteDesde.Text), StrToInt(EFclienteHasta.Text), REntorno.Entrada, Serie);
end;

procedure TFMPedidosPendientesCli.TButtQuitarSelecclienteClick(Sender: TObject);
begin
  if ((StrToIntDef(EFclienteDesde.Text, -999) <> -999) and (StrToIntDef(EFclienteHasta.Text, -999) <> -999)) then
     DMPedidosPendientesCli.MarcarPorcliente(DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, StrToInt(EFclienteDesde.Text), StrToInt(EFclienteHasta.Text), 0, Serie);
end;

procedure TFMPedidosPendientesCli.EFclienteDesdeChange(Sender: TObject);
begin
  ETituloclienteDesde.Text := DameTitulocliente(StrToIntDef(EFclienteDesde.Text, 0));
end;

procedure TFMPedidosPendientesCli.EFclienteHastaChange(Sender: TObject);
begin
  ETituloclienteHasta.Text := DameTitulocliente(StrToIntDef(EFclienteHasta.Text, 0));
end;

procedure TFMPedidosPendientesCli.CBSeriesChange(Sender: TObject);
begin
  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.ItemIndex = 0) then
        Serie := ''
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;

     DMPedidosPendientesCli.AbreTabla(Serie, Trim(EFFamilia.Text), StrToIntDef(EFCliente.Text, 0), EArticulo.Text, DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, ColumnaOrden);
  end;
end;

procedure TFMPedidosPendientesCli.TButtRefrescarClick(Sender: TObject);
begin
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesCli.TButtAnyadirFechaConfirmadaClick(Sender: TObject);
begin
  DMPedidosPendientesCli.MarcarPorFechaConfirmadaVacia(DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, REntorno.Entrada, Serie);
end;

procedure TFMPedidosPendientesCli.TButtQuitarFechaConfirmadaClick(Sender: TObject);
begin
  DMPedidosPendientesCli.MarcarPorFechaConfirmadaVacia(DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, 0, Serie);
end;

procedure TFMPedidosPendientesCli.TButtDesmarcarClick(Sender: TObject);
begin
  DMPedidosPendientesCli.MarcarTodo(Serie, 0, DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date);
end;

procedure TFMPedidosPendientesCli.AEnviarCorreosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesCli.EnviarCorreos(Serie);
end;

procedure TFMPedidosPendientesCli.AConfiguracionRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;

  TFMListConfig.Create(Self).Muestra(2015, Formato, Cabecera, Copias, Pijama, Serie, DMPedidosPendientesCli.frListado);
end;

procedure TFMPedidosPendientesCli.AListadoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesCli.MostrarListado;
end;

procedure TFMPedidosPendientesCli.AConfiguracionRapidaListadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;

  TFMListConfig.Create(Self).Muestra(661, Formato, Cabecera, Copias, Pijama, Serie, DMPedidosPendientesCli.frListado);
end;

procedure TFMPedidosPendientesCli.DBGFPedidosPendientesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'RIG') then
  begin
     if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ID_DETALLES_S').AsInteger <> 0) then
     begin
        FMain.TraspasoDeDocumentosSalida(DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ID_S').AsInteger);
     end;
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ID_ORDEN') then
  begin
     if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ID_ORDEN').AsInteger > 0) then
        FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ID_ORDEN').AsInteger));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ARTICULO').AsString + '''')
  else
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('CLIENTE').AsString);
end;

procedure TFMPedidosPendientesCli.DBGFPedidosPendientesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'ID_ORDEN') or (UpperCase(Column.FieldName) = 'CLIENTE')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        // Coloreamos celdas especificas
        if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
        begin
           // Color para la columna STOCK
           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat >= (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PENDIENTES').AsFloat)) then
           begin
              // Mas stock que unidades pendientes. Pintamos de verde intenso.
              ColorResaltado2(Canvas);
           end
           else
           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat > 0) then
              ColorError(Canvas)
           else
           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat < 0) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'FECHA_PRE_PROV') then
        begin
           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('FECHA_PRE_PROV').AsDateTime < DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('FECHA_ENTREGA_PREV').AsDateTime) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_MINIMO') then
        begin
           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_MINIMO').AsFloat > DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'PEDIDOS_A_PRO') then
        begin
           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('PEDIDOS_A_PRO').AsFloat > 0) then
              ColorResaltado3(Canvas);
        end
        else
        begin
           // Coloreamos resto de la linea segun condiciones

           if (Almacen <> 'NOCALC') then
           begin
              if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('PREPARABLE').AsInteger = 1) then
              begin
                 if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PENDIENTES').AsFloat = DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PREPARADAS').AsFloat) then
                 begin
                    // Pedido con unidades preparadas igual a las pendientes de servir. Pintamos azul claro.
                    ColorResaltado6(Canvas);
                 end
                 else
                 if ((DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat > 0) and (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat < (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PENDIENTES').AsFloat - DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PREPARADAS').AsFloat))) then
                 begin
                    // Con stock pero insuficiente. Pintamos de verde claro.
                    ColorResaltado5(Canvas);
                 end
                 else
                 begin
                    // Articulo preparable pero no preparado Pintamos de amarillo.
                    ColorResaltado(Canvas);
                 end;
              end
              else
              begin
                 if ((DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat > 0) and (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat < (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PENDIENTES').AsFloat))) then
                 begin
                    // Con stock pero insuficiente. Pintamos de verde claro.
                    ColorResaltado5(Canvas);
                 end
                 else
                 if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat >= (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('U_PENDIENTES').AsFloat)) then
                 begin
                    // Con stock suficiente. Pintamos de verde.
                    ColorResaltado2(Canvas);
                 end
                 else
                 begin
                    // Articulo preparable pero no preparado Pintamos de amarillo.
                    ColorObjeto(Canvas, Brighten(clRed, 50), clWindowText);
                 end;
              end;
           end;

           if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('PEDIR').AsInteger = 1) then
           begin
              // Debemos pedir a proveedor.
              ColorBloqueado(Canvas);
           end;
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMPedidosPendientesCli.DBGFRelacionDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMPedidosPendientesCli.xRelacion.FieldByName('ID_E').AsInteger);
end;

procedure TFMPedidosPendientesCli.DBGFRelacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (UpperCase(Column.FieldName) = 'FECHA_PRE_CAB') then
        begin
           if (DMPedidosPendientesCli.xRelacion.FieldByName('FECHA_PRE_CAB').AsDateTime <> 0) then
              if (DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('FECHA_ENTREGA_PREV').AsDateTime > DMPedidosPendientesCli.xRelacion.FieldByName('FECHA_PRE_CAB').AsDateTime) then
                 ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'CANAL') then
        begin
           if (DMPedidosPendientesCli.xRelacion.FieldByName('CANAL').AsInteger <> REntorno.Canal) then
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPedidosPendientesCli.DBGFPedidosPendientesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMPedidosPendientesCli.AStockAlmacenExecute(Sender: TObject);
var
  i : integer;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Almacen := TAction(Sender).Caption;
  if (Almacen = _('No calcular stock')) then
     Almacen := 'NOCALC'
  else
  if (Almacen = _('Todos los Almacenes')) then
     Almacen := ''
  else
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);

  DMPedidosPendientesCli.StockAlmacen(Almacen);

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
end;

procedure TFMPedidosPendientesCli.CBPedidosProveedorChange(Sender: TObject);
var
  i : integer;
begin
  inherited;
  DMPedidosPendientesCli.CalculaPedidosProveedor(CBPedidosProveedor.Checked);
  i := EncuentraField(DBGFPedidosPendientes, 'PEDIDOS_A_PRO');
  if (i >= 0) then
     DBGFPedidosPendientes.Columns[i].Visible := CBPedidosProveedor.Checked
  else
  begin
     with DBGFPedidosPendientes.Columns.Add do
     begin
        FieldName := 'PEDIDOS_A_PRO';
        Visible := CBPedidosProveedor.Checked;
     end;
  end;
end;

procedure TFMPedidosPendientesCli.AEnviarPedidosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesCli.EnviarPedidos(Serie);
  TButtRefrescar.Click;
end;

procedure TFMPedidosPendientesCli.TButtInfoStockClick(Sender: TObject);
begin
  inherited;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ARTICULO').AsString, DMPedidosPendientesCli.QMPedidosPendientesCli.FieldByName('ALMACEN').AsString, Self);
end;

procedure TFMPedidosPendientesCli.EFClienteChange(Sender: TObject);
begin
  inherited;
  ETitulocliente.Text := DameTitulocliente(StrToIntDef(EFCliente.Text, 0));
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesCli.EFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloFamilia.Text := DameTituloFamilia(EFFamilia.Text);
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesCli.AHojaPreparacionPedidoExecute(Sender: TObject);
var
  Almacen : string;
begin
  inherited;
  if (CBAlmacenesPreparacion.ItemIndex < 1) then
     Almacen := '   '
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenesPreparacion.Items[CBAlmacenesPreparacion.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  DMPedidosPendientesCli.GeneraAltaPedidos(Almacen, Serie, StrToIntDef(EFResponsable.Text, 0), StrToIntDef(EFUbicacionSimple.Text, 0));
  ShowMessage(_('Proceso de generación de hojas de preparación finalizado.'));
end;

procedure TFMPedidosPendientesCli.TButtMarcarPreparablesClick(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesCli.MarcarListosParaPreparar;
end;

procedure TFMPedidosPendientesCli.TButtMarcarSemiPreparablesClick(Sender: TObject);
begin
  inherited;
  DMPedidosPendientesCli.MarcarSemiPreparables;
end;

procedure TFMPedidosPendientesCli.EFResponsableChange(Sender: TObject);
begin
  inherited;
  ETituloResponsable.Text := DameTituloEmpleado(StrToIntDef(EFResponsable.Text, 0));
end;

procedure TFMPedidosPendientesCli.EFUbicacionSimpleChange(Sender: TObject);
begin
  inherited;
  ETituloUbicacionSimple.Text := DameTituloUbicacionSimple(StrToIntDef(EFUbicacionSimple.Text, 0));
end;

procedure TFMPedidosPendientesCli.TBBorrarRelacionClick(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Esta seguro de querer borrar la relacion entre documentos')) then
     DMPedidosPendientesCli.BorrarRelacion;
end;

procedure TFMPedidosPendientesCli.BHoyClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecEntrega.Date := Today;
  DEHastaFecEntrega.Date := Today;
end;

procedure TFMPedidosPendientesCli.BMesClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecEntrega.Date := EncodeDate(YearOf(Today), MonthOf(Today), 1);
  DEHastaFecEntrega.Date := EncodeDate(YearOf(Today), MonthOf(Today), DaysInMonth(Today));
end;

procedure TFMPedidosPendientesCli.BEjercicioClick(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  DameMinMax('EJE', Min, Max);
  DEDesdeFecEntrega.Date := Min;
  DEHastaFecEntrega.Date := Max;
end;

procedure TFMPedidosPendientesCli.BDiaAnteriorClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecEntrega.Date := DEDesdeFecEntrega.Date - 1;
  DEHastaFecEntrega.Date := DEHastaFecEntrega.Date - 1;
end;

procedure TFMPedidosPendientesCli.BMDiaSiguienteClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecEntrega.Date := DEDesdeFecEntrega.Date + 1;
  DEHastaFecEntrega.Date := DEHastaFecEntrega.Date + 1;
end;

procedure TFMPedidosPendientesCli.BMesAnterioClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecEntrega.Date := IncMonth(DEDesdeFecEntrega.Date, -1);

  // Codigo para mantener el ultimo dia del mes
  if DaysInMonth(DEHastaFecEntrega.Date) = DayOf(DEHastaFecEntrega.Date) then
  begin
     DEHastaFecEntrega.Date := IncMonth(DEHastaFecEntrega.Date, -1);
     DEHastaFecEntrega.Date := RecodeDay(DEHastaFecEntrega.Date, DaysInMonth(DEHastaFecEntrega.Date));
  end
  else
     DEHastaFecEntrega.Date := IncMonth(DEHastaFecEntrega.Date, -1);
end;

procedure TFMPedidosPendientesCli.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecEntrega.Date := IncMonth(DEDesdeFecEntrega.Date, 1);

  // Codigo para mantener el ultimo dia del mes
  if DaysInMonth(DEHastaFecEntrega.Date) = DayOf(DEHastaFecEntrega.Date) then
  begin
     DEHastaFecEntrega.Date := IncMonth(DEHastaFecEntrega.Date, 1);
     DEHastaFecEntrega.Date := RecodeDay(DEHastaFecEntrega.Date, DaysInMonth(DEHastaFecEntrega.Date));
  end
  else
     DEHastaFecEntrega.Date := IncMonth(DEHastaFecEntrega.Date, 1);
end;

procedure TFMPedidosPendientesCli.DEDesdeFecEntregaChange(Sender: TObject);
begin
  inherited;
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesCli.DEHastaFecEntregaChange(Sender: TObject);
begin
  inherited;
  CBSeriesChange(Sender);
end;

procedure TFMPedidosPendientesCli.DBGFPedidosPendientesTitleClick(Column: TColumn);
begin
  inherited;
  // El ordenamiento debe hacerse a mano porque el SQL es complejo y tiene la sentencia ORDER BY dentro de subselects
  if (ColumnaOrden = Column.Field.FieldNo) then
     ColumnaOrden := ColumnaOrden * (-1)
  else
     ColumnaOrden := Column.Field.FieldNo;
  DMPedidosPendientesCli.AbreTabla(Serie, Trim(EFFamilia.Text), StrToIntDef(EFCliente.Text, 0), EArticulo.Text, DEDesdeFecEntrega.Date, DEHastaFecEntrega.Date, ColumnaOrden);
end;

procedure TFMPedidosPendientesCli.EArticuloChange(Sender: TObject);
begin
  inherited;
  EArticuloTitulo.Text := DameTituloArticulo(EArticulo.Text, REntorno.Empresa);
  CBSeriesChange(Sender);
end;

end.
