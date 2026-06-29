unit UFMAltaHojasDePreparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind, ComCtrls,
  ULFToolBar, ToolWin, UNavigator, ExtCtrls, UEntorno, ActnList,
  ULFActionList, ULFEdit, StdCtrls, UComponentesBusquedaFiltrada, ULFLabel, HYFIBQuery,
  Mask, rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDateEdit, DateUtils,
  DBCtrls, ULFDBEdit, ULFComboBox, UEditPanel, ULFEditFind2000, rxPlacemnt,
  ULFFormStorage, ULFPanel, UFPEditSimple, Menus, UTeclas, UControlEdit;

type
  TFMAltaHojasDePreparacion = class(TFPEditSimple)
     DBGPreparaPed: TFIBHYGGridFind;
     PnlCabeceraPed: TLFPanel;
     TBPrepararPedidos: TLFToolButton;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LDesdePedido: TLFLabel;
     LHastaPedido: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     EDesdeCliente: TLFEdit;
     EHastaCliente: TLFEdit;
     ALHojasDePreparacion: TLFActionList;
     AFiltraAltaPedido: TAction;
     EFDesdeFecha: TLFDateEdit;
     EFHastaFecha: TLFDateEdit;
     EFDesdePedido: TLFEdit;
     EFHastaPedido: TLFEdit;
     APreparaPedidos: TAction;
     ToolButton1: TToolButton;
     TBSeleccionarTodos: TToolButton;
     TBDeseleccionarTodos: TToolButton;
     ASeleccionarTodos: TAction;
     ADeseleccionarTodos: TAction;
     ToolButton3: TToolButton;
     tButtRefrescar: TToolButton;
     ARefrescar: TAction;
     LDesdeArticulo: TLFLabel;
     EFDesdeArticulo: TLFEditFind2000;
     LHastaArticulo: TLFLabel;
     EFHastaArticulo: TLFEditFind2000;
     ASeleccionarPreparables: TAction;
     TBSeleccionarPreparables: TToolButton;
     LAlmacen: TLFLabel;
     CBAlmacenes: TLFComboBox;
     AImprimeHojaGenerada: TAction;
     ToolButton4: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     AListadoCarteraDePedidosOLD: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListadoCarteraPedidosOLD: TAction;
     TBFiltraPedidos: TToolButton;
     ToolButton6: TToolButton;
     APoneAEstadoListado: TAction;
     AFiltraPedidos: TAction;
     tButtRefrescarFiltros: TToolButton;
     ToolButton7: TToolButton;
     ARefrescarFiltros: TAction;
     ToolButton8: TToolButton;
     AListadoCarteraDePedidos: TAction;
     AConfListadoCarteraPedidos: TAction;
     EDesdeArticulo: TLFEdit;
     EHastaArticulo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
     procedure AFiltraAltaPedidoExecute(Sender: TObject);
     procedure EFDesdePedido2Change(Sender: TObject);
     procedure EFHastaPedido2Change(Sender: TObject);
     procedure EFDesdeFechaChange(Sender: TObject);
     procedure EFHastaFechaChange(Sender: TObject);
     procedure EFDesdePedidoChange(Sender: TObject);
     procedure EFHastaPedidoChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APreparaPedidosExecute(Sender: TObject);
     procedure ASeleccionarTodosExecute(Sender: TObject);
     procedure ADeseleccionarTodosExecute(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure EFDesdeArticuloChange(Sender: TObject);
     procedure EFHastaArticuloChange(Sender: TObject);
     procedure DBGPreparaPedDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ASeleccionarPreparablesExecute(Sender: TObject);
     procedure CBAlmacenesChange(Sender: TObject);
     procedure AImprimeHojaGeneradaExecute(Sender: TObject);
     procedure AListadoCarteraPedidosExecute(Sender: TObject);
     procedure AListadoCarteraDePedidosOLDExecute(Sender: TObject);
     procedure AConfListadoCarteraPedidosOLDExecute(Sender: TObject);
     procedure APoneAEstadoListadoExecute(Sender: TObject);
     procedure AFiltraPedidosExecute(Sender: TObject);
     procedure ARefrescarFiltrosExecute(Sender: TObject);
     procedure AListadoCarteraDePedidosExecute(Sender: TObject);
     procedure AConfListadoCarteraPedidosExecute(Sender: TObject);
     procedure DBGPreparaPedDblClick(Sender: TObject);
     procedure DBGPreparaPedCellClick(Column: TColumn);
  private
     { Private declarations }
     FiltraPedidosPendientes, Creando: boolean;
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMAltaHojasDePreparacion : TFMAltaHojasDePreparacion;

implementation

uses UDMAltaHojasDePreparacion, UDMMain, UDMLstAltaHojaDePrepaparacion,
  UFMListConfig, UFMain, UUtiles, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFMAltaHojasDePreparacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAltaHojasDePreparacion, DMAltaHojasDePreparacion);

  // Establezco la entrada para marcar registros
  DBGPreparaPed.ColumnasChecked.Strings[DBGPreparaPed.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := REntorno.EntradaStr;

  // Evita que se recalculen los datos a mostrar durante la inicializacion
  FiltraPedidosPendientes := True;

  RellenaAlmacenes(CBAlmacenes.Items);

  ColActual := DBGPreparaPed.Columns[0];

  ARefrescarFiltros.Execute;
end;

procedure TFMAltaHojasDePreparacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAltaHojasDePreparacion);
end;

procedure TFMAltaHojasDePreparacion.EFDesdeClienteChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
  EDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
end;

procedure TFMAltaHojasDePreparacion.EFHastaClienteChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
  EHastaCliente.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
end;

procedure TFMAltaHojasDePreparacion.AFiltraAltaPedidoExecute(Sender: TObject);
var
  Almacen : string;
begin
  if (CBAlmacenes.ItemIndex < 1) then
     Almacen := 'Todos'
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenes.Items[CBAlmacenes.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  DMAltaHojasDePreparacion.FiltraDetalle(StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0),
     StrToIntDef(EFDesdePedido.Text, 0), StrToIntDef(EFHastaPedido.Text, 0),
     StrToDate(EFDesdeFecha.Text), HourIntoDate(StrToDate(EFHastaFecha.Text), '23:59:59'),
     EFDesdeArticulo.Text, EFHastaArticulo.Text, Almacen, FiltraPedidosPendientes);

  // Actualiza Cartera Pedidos Clientes
  {Ya lo hace FiltraDetalle()
   DMAltaHojasDePreparacion.QMAltaPedidos.Close;
   DMAltaHojasDePreparacion.QMAltaPedidos.Open;
   }
end;

procedure TFMAltaHojasDePreparacion.EFDesdePedido2Change(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
end;

procedure TFMAltaHojasDePreparacion.EFHastaPedido2Change(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
end;

procedure TFMAltaHojasDePreparacion.EFDesdeFechaChange(Sender: TObject);
//var
//dummy : TDateTime;
begin
  if (not Creando) then
  begin
     try
        //dummy := StrToDate(EFDesdeFecha.Text);
        AFiltraAltaPedido.Execute;
     except
     end;
  end;
end;

procedure TFMAltaHojasDePreparacion.EFHastaFechaChange(Sender: TObject);
//var
//dummy : TDateTime;
begin
  if (not Creando) then
  begin
     try
        //dummy := StrToDate(EFHastaFecha.Text);
        AFiltraAltaPedido.Execute;
     except
     end;
  end;
end;

procedure TFMAltaHojasDePreparacion.EFDesdePedidoChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
end;

procedure TFMAltaHojasDePreparacion.EFHastaPedidoChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
end;

procedure TFMAltaHojasDePreparacion.APreparaPedidosExecute(Sender: TObject);
var
  Almacen : string;
begin
  if (CBAlmacenes.ItemIndex < 1) then
     Almacen := '   '
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenes.Items[CBAlmacenes.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  DMAltaHojasDePreparacion.GeneraAltaPedidos(Almacen);
  AFiltraAltaPedido.Execute;
  ARefrescar.Execute;
  AImprimeHojaGenerada.Execute;
  APoneAEstadoListado.Execute;
end;

procedure TFMAltaHojasDePreparacion.ASeleccionarTodosExecute(Sender: TObject);
begin
  DMAltaHojasDePreparacion.MarcarTodos(StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0),
     StrToIntDef(EFDesdePedido.Text, 0), StrToIntDef(EFHastaPedido.Text, 0),
     StrToDate(EFDesdeFecha.Text), HourIntoDate(StrToDate(EFHastaFecha.Text), '23:59:59'),
     REntorno.Entrada);
end;

procedure TFMAltaHojasDePreparacion.ASeleccionarPreparablesExecute(Sender: TObject);
begin
  DMAltaHojasDePreparacion.MarcarTodos(StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0),
     StrToIntDef(EFDesdePedido.Text, 0), StrToIntDef(EFHastaPedido.Text, 0),
     StrToDate(EFDesdeFecha.Text), HourIntoDate(StrToDate(EFHastaFecha.Text), '23:59:59'), -1);
end;

procedure TFMAltaHojasDePreparacion.ADeseleccionarTodosExecute(Sender: TObject);
begin
  DMAltaHojasDePreparacion.MarcarTodos(StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0),
     StrToIntDef(EFDesdePedido.Text, 0), StrToIntDef(EFHastaPedido.Text, 0),
     StrToDate(EFDesdeFecha.Text), HourIntoDate(StrToDate(EFHastaFecha.Text), '23:59:59'),
     0);
end;

procedure TFMAltaHojasDePreparacion.ARefrescarExecute(Sender: TObject);
begin
  AFiltraAltaPedido.Execute;
end;

procedure TFMAltaHojasDePreparacion.EFDesdeArticuloChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
  EDesdeArticulo.Text := DameTituloArticulo(EFDesdeArticulo.Text);
end;

procedure TFMAltaHojasDePreparacion.EFHastaArticuloChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
  EHastaArticulo.Text := DameTituloArticulo(EFHastaArticulo.Text);
end;

procedure TFMAltaHojasDePreparacion.DBGPreparaPedDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(DBGPreparaPed, Rect);

  with DBGPreparaPed do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     if (Column.ReadOnly) then
     begin
        // if (DMAltaHojasDePreparacion.StockSuficiente) then
        if (DMAltaHojasDePreparacion.QMAltaPedidosESTADO_REGISTRO.AsInteger = 0) then
        begin
           // Si hay NO stock suficiente
           ColorResaltado2(Canvas);
        end
        else
        if (DMAltaHojasDePreparacion.QMAltaPedidosESTADO_REGISTRO.AsInteger = 1) then
        begin
           // 1-Todo esta pendiente. No se ha servido ni preparado nada.
           {Canvas.Font.Color := clWhite; // clInactiveCaptionText;
           Canvas.Brush.Color := clBlue;}
           ColorError(Canvas);
        end
        else
        if (DMAltaHojasDePreparacion.QMAltaPedidosESTADO_REGISTRO.AsInteger = 2) then
        begin
           // 2 -Pendiente una parte y resto en hoja de preparación y nada servido
           {Canvas.Font.Color := clWindowText; // clInactiveCaptionText;
           Canvas.Brush.Color := clOlive;}
           ColorResaltado5(Canvas);
        end
        else
        if (DMAltaHojasDePreparacion.QMAltaPedidosESTADO_REGISTRO.AsInteger = 3) then
        begin
           // 3-Toda la linea del pedido esta en preparación
           ColorResaltado4(Canvas);
        end
        else
        if (DMAltaHojasDePreparacion.QMAltaPedidosESTADO_REGISTRO.AsInteger = 4) then
        begin
           // 4-Hay una parte albaranada y nada en preparación
           ColorResaltado3(Canvas);
        end
        else
        if (DMAltaHojasDePreparacion.QMAltaPedidosESTADO_REGISTRO.AsInteger = 5) then
        begin
           // 5-Una parte albaranada, una parte en preparación
           ColorResaltado6(Canvas);
        end;
     end
     else
     begin
        ColorEdicion(Canvas);
     end;
  end; {With DBGPreparaPed}

  DBGPreparaPed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMAltaHojasDePreparacion.CBAlmacenesChange(Sender: TObject);
begin
  {
  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
  }
end;

procedure TFMAltaHojasDePreparacion.AImprimeHojaGeneradaExecute;

begin
  DMAltaHojasDePreparacion.ImprimeHojaDePreparacionGenerada;
end;

procedure TFMAltaHojasDePreparacion.AListadoCarteraPedidosExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstAltaHojaDePrepaparacion, DMLstAltaHojaDePrepaparacion);
  DMLstAltaHojaDePrepaparacion.MuestraListado(0);
  CierraData(DMLstAltaHojaDePrepaparacion);
end;

procedure TFMAltaHojasDePreparacion.AListadoCarteraDePedidosOLDExecute(Sender: TObject);
begin
  {
  AbreData(TDMLstAltaHojaDePrepaparacion, DMLstAltaHojaDePrepaparacion);
  DMLstAltaHojaDePrepaparacion.MuestraListado(0);
  CierraData(DMLstAltaHojaDePrepaparacion);
  }
end;

procedure TFMAltaHojasDePreparacion.AConfListadoCarteraPedidosOLDExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAltaHojaDePrepaparacion, DMLstAltaHojaDePrepaparacion);
  TFMListConfig.Create(Self).Muestra(5110, formato, cabecera, copias,
     pijama, '', DMLstAltaHojaDePrepaparacion.frQMAltaPedidos);
  CierraData(DMLstAltaHojaDePrepaparacion);
end;

procedure TFMAltaHojasDePreparacion.APoneAEstadoListadoExecute(Sender: TObject);
begin
  DMAltaHojasDePreparacion.PasaAEstadoListado;
end;

procedure TFMAltaHojasDePreparacion.AFiltraPedidosExecute(Sender: TObject);
begin
  // TBFiltraPedidos.
  if AFiltraPedidos.ImageIndex = 7 then
  begin
     AFiltraPedidos.ImageIndex := 8;
     AFiltraPedidos.Hint := _('Ver solo pedidos pendientes');
     FiltraPedidosPendientes := False;
  end
  else
  begin
     AFiltraPedidos.ImageIndex := 7;
     AFiltraPedidos.Hint := _('Ver todos los pedidos');
     FiltraPedidosPendientes := True;
  end;

  if (not Creando) then
  begin
     AFiltraAltaPedido.Execute;
  end;
end;

procedure TFMAltaHojasDePreparacion.ARefrescarFiltrosExecute(Sender: TObject);
var
  Min, Max, Almacen : string;
  MinD, MaxD : TDateTime;
begin
  Creando := True;

  // Establezco minimos y maximos para el filtro
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(CLIENTE) AS MIN_CLIENTE, MAX(CLIENTE) AS MAX_CLIENTE, ');
        SQL.Add('        MIN(RIG) AS MIN_RIG, MAX(RIG) AS MAX_RIG ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
        Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
        ExecQuery;
        EFDesdeCliente.Text := FieldByName['MIN_CLIENTE'].AsString;
        EFHastaCliente.Text := FieldByName['MAX_CLIENTE'].AsString;
        EFDesdePedido.Text := FieldByName['MIN_RIG'].AsString;
        EFHastaPedido.Text := FieldByName['MAX_RIG'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DameMinMax('CAR', Min, Max);
  EFDesdeArticulo.Text := Min;
  EFHastaArticulo.Text := Max;

  DameMinMax('EJE', MinD, MaxD);
  EFDesdeFecha.Date := MinD;
  EFHastaFecha.Date := MaxD;

  // Buscamos almacen por defecto
  Almacen := REntorno.AlmacenDefecto;
  if (Trim(REntorno.AlmacenRestringido) > '') then
     Almacen := REntorno.AlmacenRestringido;

  CBAlmacenes.ItemIndex := 0;
  while (Copy(CBAlmacenes.Text, 1, 3) <> Almacen) do
     CBAlmacenes.ItemIndex := CBAlmacenes.ItemIndex + 1;

  if (Trim(REntorno.AlmacenRestringido) > '') then
     CBAlmacenes.Enabled := False;

  Creando := False;
  // AFiltraAltaPedido.Execute;
end;

procedure TFMAltaHojasDePreparacion.AListadoCarteraDePedidosExecute(Sender: TObject);
var
  Almacen : string;
begin
  AbreData(TDMLstAltaHojaDePrepaparacion, DMLstAltaHojaDePrepaparacion);

  if (CBAlmacenes.ItemIndex < 1) then
     Almacen := 'Todos'
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenes.Items[CBAlmacenes.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  DMLstAltaHojaDePrepaparacion.MuestraListadoFiltrado(0, StrToIntDef(EFDesdeCliente.Text, 0)
     , StrToIntDef(EFHastaCliente.Text, 0), StrToIntDef(EFDesdePedido.Text, 0)
     , StrToIntDef(EFHastaPedido.Text, 0), StrToDate(EFDesdeFecha.Text)
     , HourIntoDate(StrToDate(EFHastaFecha.Text), '23:59:59')
     , EFDesdeArticulo.Text, EFHastaArticulo.Text, Almacen, DMAltaHojasDePreparacion.QMAltaPedidos.SelectSQL);

  CierraData(DMLstAltaHojaDePrepaparacion);
end;

procedure TFMAltaHojasDePreparacion.AConfListadoCarteraPedidosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstAltaHojaDePrepaparacion, DMLstAltaHojaDePrepaparacion);
  TFMListConfig.Create(Self).Muestra(5120, Formato, Cabecera, Copias,
     Pijama, '', DMLstAltaHojaDePrepaparacion.frQMAltaPedidos);
  CierraData(DMLstAltaHojaDePrepaparacion);
end;

procedure TFMAltaHojasDePreparacion.DBGPreparaPedDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'RIG') then
  begin
     if (DMLstAltaHojaDePrepaparacion.QMAltaPedidos.FieldByName('ID_S').AsInteger <> 0) then
     begin
        FMain.TraspasoDeDocumentosSalida(DMLstAltaHojaDePrepaparacion.QMAltaPedidos.FieldByName('ID_S').AsInteger);
     end;
  end;
end;

procedure TFMAltaHojasDePreparacion.DBGPreparaPedCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
