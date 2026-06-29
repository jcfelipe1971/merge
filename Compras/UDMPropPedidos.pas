unit UDMPropPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  HYFIBQuery, FIBDataSetRO;

type
  TDMPropPedidos = class(TDataModule)
     QMPedidos: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMPedidos: TDataSource;
     TUpdate: THYTransaction;
     xPedidosOrigen: TFIBTableSet;
     DSxMPedidosOrigen: TDataSource;
     xPedidosOrigenEMPRESA: TIntegerField;
     xPedidosOrigenEJERCICIO: TIntegerField;
     xPedidosOrigenCANAL: TIntegerField;
     xPedidosOrigenSERIE: TFIBStringField;
     xPedidosOrigenRIG: TIntegerField;
     xPedidosOrigenLINEA: TIntegerField;
     xPedidosOrigenUNIDADES: TFloatField;
     xPedidosOrigenU_PENDIENTES: TFloatField;
     xPedidosOrigenFECHA_ENTREGA_PREV: TDateTimeField;
     xPedidosOrigenID_S: TIntegerField;
     xPedidosOrigenCLIENTE: TIntegerField;
     xPedidosOrigenNOMBRE_R_SOCIAL: TFIBStringField;
     xPedidosOrigenAGENTE: TIntegerField;
     xPedidosOrigenNOMBRE_AGENTE: TFIBStringField;
     xPedidosOrigenMANIPULACION: TIntegerField;
     DSQMPedidosTotales: TDataSource;
     QMPedidosTotales: TFIBDataSetRO;
     QMPedidosTotalesUNIDADES_PEDIDAS: TFloatField;
     QMPedidosEMPRESA: TIntegerField;
     QMPedidosEJERCICIO: TIntegerField;
     QMPedidosCANAL: TIntegerField;
     QMPedidosALMACEN: TFIBStringField;
     QMPedidosARTICULO: TFIBStringField;
     QMPedidosARTICULO_TITULO: TFIBStringField;
     QMPedidosENTRADA: TIntegerField;
     QMPedidosPROVEEDOR: TIntegerField;
     QMPedidosNOMBRE_R_SOCIAL: TFIBStringField;
     QMPedidosEXISTENCIAS: TFloatField;
     QMPedidosMINIMO: TFloatField;
     QMPedidosMAXIMO: TFloatField;
     QMPedidosP_MINIMO: TFloatField;
     QMPedidosP_OPTIMO: TFloatField;
     QMPedidosPEDIR: TFloatField;
     QMPedidosMARCADO: TIntegerField;
     QMPedidosZ_PRO_COMPRA: TIntegerField;
     QMPedidosZ_PRO_ID_ORDEN_MAT: TIntegerField;
     QMPedidosPEDIDOS_D_CLI: TFloatField;
     QMPedidosPEDIDOS_A_PRO: TFloatField;
     QMPedidosINCR_PEDIDO: TFloatField;
     QMPedidosDIAS_ENTREGA: TIntegerField;
     QMPedidosID_A: TIntegerField;
     QMPedidosTIPO_ARTICULO: TFIBStringField;
     QMPedidosFECHA_COMPARACION_DESDE: TDateTimeField;
     QMPedidosFECHA_COMPARACION_HASTA: TDateTimeField;
     QMPedidosVENTAS_PERIODO_ANTERIOR: TFloatField;
     QMPedidosMODO: TIntegerField;
     QMPedidosRECALCULAR: TIntegerField;
     QMPedidosSTOCK_VIRTUAL: TFloatField;
     QMPedidosEN_PRODUCCION: TFloatField;
     QMPedidosCOBERTURA: TFloatField;
     QMPedidosROTURA: TFloatField;
     QMPedidosUNIDADES_COBERTURA: TFloatField;
     QMPedidosCOBERTURA_ROTURA: TFloatField;
     QMPedidosFAMILIA: TFIBStringField;
     QMPedidosTITULO_FAMILIA: TFIBStringField;
     QMPedidosALFA_1: TFIBStringField;
     QMPedidosALFA_2: TFIBStringField;
     QMPedidosALFA_3: TFIBStringField;
     QMPedidosALFA_4: TFIBStringField;
     QMPedidosALFA_5: TFIBStringField;
     QMPedidosALFA_6: TFIBStringField;
     QMPedidosALFA_7: TFIBStringField;
     QMPedidosALFA_8: TFIBStringField;
     QMPedidosSTOCK_ALM: TFloatField;
     QMPedidosNOTA_DETALLE_PEDIDO: TMemoField;
     QMPedidosREF_PROVEEDOR: TFIBStringField;
     QMPedidosUNIDADES_PEDIDO: TFloatField;
     QMPedidosUNIDADES_PRODUCCION: TFloatField;
     QMPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosP_COSTE_ULT: TFloatField;
     QMPedidosCODIGO_PROVEEDOR: TFIBStringField;
     procedure DMPropPedidosCreate(Sender: TObject);
     procedure QMPedidosNewRecord(DataSet: TDataSet);
     procedure QMPedidosMARCADOChange(Sender: TField);
     procedure QMPedidosAfterOpen(DataSet: TDataSet);
     procedure QMPedidosAfterClose(DataSet: TDataSet);
     procedure QMPedidosPROVEEDORChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMPedidosCalcFields(DataSet: TDataSet);
     procedure QMPedidosAfterPost(DataSet: TDataSet);
     procedure QMPedidosPEDIRChange(Sender: TField);
  private
     { Private declarations }
     AlmacenStock: string;
     TipoMarcado: smallint;
     StockAlm: TStrings;
     SQLBase: TStrings;
  public
     { Public declarations }
     CancelarRecalculo: boolean;
     procedure RefrescaDatos;
     procedure GeneraPropuesta(Modo: integer; Almacen: string; FechaDesde, FechaHasta: TDateTime; IncluyeStockCompuesto, IncluyeStockComponente: boolean);
     procedure EjecutaPropuesta(Almacen, Serie, Tipo: string; TodosAlmacenes, AgregarADocAbierto: boolean);
     procedure CancelaPropuesta(Modo: integer; Almacen: string);
     procedure FiltraRango(aTipoMarcado: smallint; Almacen, Proveedor: string; Modo: integer; SoloPedir: boolean; TipoArticulo, DesdeArticulo, HastaArticulo, DesdeArticulo2, HastaArticulo2, DesdeFamilia, HastaFamilia: string; CampoOrden: integer);
     procedure AsignaProveedor(Proveedor: integer);
     procedure MarcaProveedor(Proveedor: integer);
     procedure MarcarRegistros(Marcado: integer);
     procedure BusquedaCompleja(Almacen, Proveedor: string; Modo: integer);
     procedure Recalcular(FechaDesde, FechaHasta: TDateTime);
     procedure RellenaEstrategiasCompra(Lista: TStrings);
     procedure LocalizaPedido;
  end;

var
  DMPropPedidos : TDMPropPedidos;

implementation

uses UDMMain, UEntorno, UParam, UUtiles, UFBusca, DateUtils, UFMSeleccion, UDameDato;

{$R *.DFM}

procedure TDMPropPedidos.DMPropPedidosCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMPedidos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMPedidosTotales, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPedidosOrigen, MascaraN, MascaraI, ShortDateFormat);

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMPedidos.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  StockAlm := TStringList.Create;
  AlmacenStock := LeeParametro('PRPSTKA001', '');
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  SQLBase := TStringList.Create;
  SQLBase.Text := QMPedidos.SelectSQL.Text;
  QMPedidos.SelectSQL.Add(' ORDER BY T.ARTICULO, T.ALMACEN ');
  DMMain.FiltraTabla(QMPedidos, '11100', False);
end;

procedure TDMPropPedidos.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
  StockAlm.Free;
end;

procedure TDMPropPedidos.GeneraPropuesta(Modo: integer; Almacen: string; FechaDesde, FechaHasta: TDateTime; IncluyeStockCompuesto, IncluyeStockComponente: boolean);
var
  Incluye_Stock_compuesto, Incluye_Stock_componente : integer;
begin
  if (IncluyeStockComponente) then
     Incluye_Stock_componente := 1
  else
     Incluye_Stock_componente := 0;

  if (IncluyeStockCompuesto) then
     Incluye_Stock_compuesto := 1
  else
     Incluye_Stock_compuesto := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_PEDIDOS_ALTA_KRI (:EMPRESA, :EJERCICIO, :CANAL, :ENTRADA, :ALMACEN, :MODO, :TODOS_ALM, :PERIODO_COMPARACION_DESDE, :PERIODO_COMPARACION_HASTA, :INCLUYE_STOCK_COMPUESTO, :INCLUYE_STOCK_COMPONENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ALMACEN'].AsString := Copy(Almacen, 1, 3);
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['TODOS_ALM'].AsInteger := BoolToInt((Almacen = ''));
        Params.ByName['PERIODO_COMPARACION_DESDE'].AsDateTime := RecodeTime(FechaDesde, 0, 0, 0, 0);
        Params.ByName['PERIODO_COMPARACION_HASTA'].AsDateTime := RecodeTime(FechaHasta, 23, 59, 59, 999);
        Params.ByName['INCLUYE_STOCK_COMPUESTO'].AsInteger := Incluye_Stock_compuesto;
        Params.ByName['INCLUYE_STOCK_COMPONENTE'].AsInteger := Incluye_Stock_componente;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPropPedidos.CancelaPropuesta(Modo: integer; Almacen: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_PEDIDOS_BAJA_KRI(:EMPRESA, :CANAL, :ALMACEN, :MODO, :TODOS_ALM)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['TODOS_ALM'].AsInteger := BoolToInt((Almacen = ''));
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPropPedidos.FiltraRango(aTipoMarcado: smallint; Almacen, Proveedor: string; Modo: integer; SoloPedir: boolean; TipoArticulo, DesdeArticulo, HastaArticulo, DesdeArticulo2, HastaArticulo2, DesdeFamilia, HastaFamilia: string; CampoOrden: integer);
begin
  TipoMarcado := aTipoMarcado;

  with QMPedidosTotales do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT SUM(PEDIR) UNIDADES_PEDIDAS FROM TMP_PEDIDOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' MODO = :MODO AND ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' MARCADO = 1 ');
     if (Almacen <> '') then
        SelectSQL.Add(' AND ALMACEN = ''' + Copy(Almacen, 1, 3) + ''' ');
     DMMain.FiltraRO(QMPedidosTotales, '11100', False);
     Params.ByName['MODO'].AsInteger := Modo;
     // Se abrira en QMPedidos.AfterOpen / QMPedidos.AfterPost
  end;

  with QMPedidos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := SQLBase.Text;
     if (Almacen <> '') then
        SelectSQL.Add(' AND T.ALMACEN = ''' + Copy(Almacen, 1, 3) + ''' ');
     if (Proveedor <> '') then
        SelectSQL.Add(' AND T.PROVEEDOR = ' + Proveedor);
     if (SoloPedir) then
        SelectSQL.Add(' AND T.PEDIR > 0 ');
     if (TipoArticulo <> '') then
        SelectSQL.Add(' AND T.TIPO_ARTICULO = ''' + Trim(TipoArticulo) + ''' ');
     if (DesdeArticulo2 <> '') then
     begin
        SelectSQL.Add(' AND (( ');
        if (DesdeArticulo <> '') then
           SelectSQL.Add(' T.ARTICULO >= ''' + Trim(DesdeArticulo) + ''' ');
        if (HastaArticulo <> '') then
           SelectSQL.Add(' AND T.ARTICULO <= ''' + Trim(HastaArticulo) + ''' ');
        SelectSQL.Add(' ) OR ( ');
        if (DesdeArticulo2 <> '') then
           SelectSQL.Add(' T.ARTICULO >= ''' + Trim(DesdeArticulo2) + ''' ');
        if (HastaArticulo2 <> '') then
           SelectSQL.Add(' AND T.ARTICULO <= ''' + Trim(HastaArticulo2) + ''' ');
        SelectSQL.Add(' )) ');
     end
     else
     begin
        if (DesdeArticulo <> '') then
           SelectSQL.Add(' AND T.ARTICULO >= ''' + Trim(DesdeArticulo) + ''' ');
        if (HastaArticulo <> '') then
           SelectSQL.Add(' AND T.ARTICULO <= ''' + Trim(HastaArticulo) + ''' ');
     end;
     if (DesdeFamilia <> '') then
        SelectSQL.Add(' AND T.FAMILIA >= ''' + Trim(DesdeFamilia) + ''' ');
     if (HastaFamilia <> '') then
        SelectSQL.Add(' AND T.FAMILIA <= ''' + Trim(HastaFamilia) + ''' ');

     case TipoMarcado of
        // 0: SelectSQL.Add('');
        1: SelectSQL.Add(' AND T.MARCADO = 1 ');
        2: SelectSQL.Add(' AND T.MARCADO = 0 ');
     end;

     if CampoOrden = 0 then
        SelectSQL.Add(' ORDER BY T.ARTICULO, T.ALMACEN ')
     else
     begin
        if CampoOrden > 0 then
           SelectSQL.Add(' ORDER BY ' + IntToStr(CampoOrden))
        else
           SelectSQL.Add(' ORDER BY ' + IntToStr(Abs(CampoOrden)) + ' DESC');
     end;

     DMMain.FiltraTabla(QMPedidos, '11100', False);
     Params.ByName['MODO'].AsInteger := Modo;
     Open;

     if (Modo in [7, 8]) then
        QMPedidosVENTAS_PERIODO_ANTERIOR.DisplayLabel := _('Prom. Ventas Ejer. Ant.')
     else
        QMPedidosVENTAS_PERIODO_ANTERIOR.DisplayLabel := _('Ventas Ejer. Ant.');
  end;
end;

procedure TDMPropPedidos.AsignaProveedor(Proveedor: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_PEDIDOS_ASIGNA_P(:EMPRESA, :CANAL, :ALMACEN, :PROVEEDOR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        // ??? Params.ByName['ALMACEN'].AsString := xAlmacenesALMACEN.AsString;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPropPedidos.MarcaProveedor(Proveedor: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_PEDIDOS_MARCA_P_KRI(:EMPRESA, :CANAL, :PROVEEDOR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPropPedidos.EjecutaPropuesta(Almacen, Serie, Tipo: string; TodosAlmacenes, AgregarADocAbierto: boolean);
begin
  //Hacemos un post si esta en modo edicion
  if (QMPedidos.State = dsEdit) then
     QMPedidos.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_PEDIDO_GENERA_PROPUESTA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ALMACEN, :ENTRADA, :FECHA_DOC, :TODOS_ALM, :D_TIPO, :AGREGAR_A_ABIERTO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_DOC'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['TODOS_ALM'].AsInteger := BoolToInt(TodosAlmacenes);
        Params.ByName['D_TIPO'].AsString := Tipo;
        Params.ByName['AGREGAR_A_ABIERTO'].AsInteger := BoolToInt(AgregarADocAbierto);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPropPedidos.QMPedidosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
  DataSet.Edit;
end;

procedure TDMPropPedidos.QMPedidosMARCADOChange(Sender: TField);
begin
  if Sender.AsInteger = 1 then
  begin
     QMPedidosENTRADA.AsInteger := REntorno.Entrada;
  end;
end;

procedure TDMPropPedidos.QMPedidosAfterOpen(DataSet: TDataSet);
begin
  xPedidosOrigen.Open;
  QMPedidosTotales.Close;
  QMPedidosTotales.Open;
end;

procedure TDMPropPedidos.QMPedidosAfterClose(DataSet: TDataSet);
begin
  xPedidosOrigen.Close;
end;

procedure TDMPropPedidos.MarcarRegistros(Marcado: integer);
var
  BM : TBookmark;
begin
  /// Recorre las lineas filtradas y las marca.

  if Confirma then
  begin
     {
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE TMP_PEDIDOS SET MARCADO = ?MARCADO WHERE ENTRADA = ?ENTRADA AND MARCADO <> ?MARCADO';
           Params.ByName['MARCADO'].AsInteger := Marcado;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     }

     with QMPedidos do
     begin
        BM := GetBookmark;
        try
           Last;
           First;
           DisableControls;

           while (not EOF) do
           begin
              if (FieldByName('MARCADO').AsInteger <> Marcado) then
              begin
                 Edit;
                 FieldByName('MARCADO').AsInteger := Marcado;
                 Post;
              end;

              Next;
           end;

           if BookmarkValid(BM) then
              GotoBookmark(BM);
        finally
           FreeBookmark(BM);
           EnableControls;
        end;
     end;

     RefrescaDatos;
  end;
end;

procedure TDMPropPedidos.QMPedidosPROVEEDORChange(Sender: TField);
begin
  QMPedidosNOMBRE_R_SOCIAL.AsString := DameTituloProveedor(StrToIntDef(QMPedidosPROVEEDOR.AsString, 0));
end;

procedure TDMPropPedidos.QMPedidosCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
  CalcularStock : boolean;
begin
  Stock := 0;
  CalcularStock := (AlmacenStock <> 'NOCALC') and (DMMain.ArticuloControlaStock(QMPedidosARTICULO.AsString));
  if CalcularStock then
  begin
     Articulo := QMPedidosARTICULO.AsString;
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, AlmacenStock);
           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;
  end;
  QMPedidosSTOCK_ALM.AsFloat := Stock;
end;

procedure TDMPropPedidos.BusquedaCompleja(Almacen, Proveedor: string; Modo: integer);
var
  Orden : string;
  mr : integer;
begin
  // QUITO la posibilidad de buscar (en EPMain), porque para que funcione el SELECT deberia ser una vista.
  // Ahora el filtro devuelve el select "SELECT * FROM TMP_PEDIDOS WHERE ...".
  // Esto no tiene el alias T ni el JOIN con ART_ARTICULOS

  with QMPedidos do
  begin
     Orden := OrdenadoPor;

     Close;
     SelectSQL.Clear;
     SelectSQL.Clear;
     SelectSQL.Text := SQLBase.Text;

     mr := TFBusca.Create(Self).SeleccionaBusqueda(QMPedidos, '11100', False);
     if (mr = mrAll) then
     begin
        SelectSQL.Clear;
        SelectSQL.Text := SQLBase.Text;
     end
     else
        Ordenar('');

     SelectSQL.Add(' AND T.MODO = :MODO ');
     if (Almacen <> '') then
        SelectSQL.Add(' AND T.ALMACEN = ''' + Copy(Almacen, 1, 3) + ''' ');
     if (Proveedor <> '') then
        SelectSQL.Add(' AND T.PROVEEDOR = ' + Proveedor);

     case TipoMarcado of
        // 0: SelectSQL.Add('');
        1: SelectSQL.Add(' AND T.MARCADO = 1 ');
        2: SelectSQL.Add(' AND T.MARCADO = 0 ');
     end;

     Ordenar(Orden);

     Params.ByName['MODO'].AsInteger := Modo;
     Open;
  end;
end;

procedure TDMPropPedidos.RefrescaDatos;
var
  BM : TBookmark;
begin
  with QMPedidos do
  begin
     BM := GetBookmark;
     try
        Close;
        Open;
        Last;
        First;

        if BookmarkValid(BM) then
           GotoBookmark(BM);
     finally
        FreeBookmark(BM);
     end;
  end;
end;

procedure TDMPropPedidos.Recalcular(FechaDesde, FechaHasta: TDateTime);
var
  BM : TBookmark;
  i : integer;
begin
  /// Recorre las lineas filtradas y recalcula datos para calcular unidades a pedir.

  CancelarRecalculo := False;
  i := 0;
  with QMPedidos do
  begin
     BM := GetBookmark;
     DisableControls;
     try
        Last;
        First;

        while ((not EOF) and (not CancelarRecalculo)) do
        begin
           Edit;
           FieldByName('FECHA_COMPARACION_DESDE').AsDateTime := RecodeTime(FechaDesde, 0, 0, 0, 0);
           FieldByName('FECHA_COMPARACION_HASTA').AsDateTime := RecodeTime(FechaHasta, 23, 59, 59, 999);
           FieldByName('RECALCULAR').AsInteger := 1;
           FieldByName('NOTA_DETALLE_PEDIDO').AsString := '';
           Post;

           if (FieldByName('PEDIR').AsFloat > 0) then
           begin
              Edit;
              FieldByName('RECALCULAR').AsInteger := 0;
              FieldByName('MARCADO').AsInteger := 1;
              Post;
           end;

           Next;

           // Para acelerar el proceso evito refrescar la pantalla demasiado.
           Inc(i);
           if (i >= 10) then
           begin
              EnableControls;
              Application.ProcessMessages;
              DisableControls;
              i := 0;
           end;
        end;

        if BookmarkValid(BM) then
           GotoBookmark(BM);
     finally
        FreeBookmark(BM);
        EnableControls;
     end;
  end;
end;

procedure TDMPropPedidos.QMPedidosAfterPost(DataSet: TDataSet);
begin
  QMPedidosTotales.Close;
  QMPedidosTotales.Open;
end;

procedure TDMPropPedidos.RellenaEstrategiasCompra(Lista: TStrings);
var
  Estrategia : integer;
begin
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT ESTRATEGIA, TITULO FROM SYS_ESTRATEGIA_COMPRA ');
           SelectSQL.Add(' ORDER BY ESTRATEGIA ');
           Open;
           while not EOF do
           begin
              Estrategia := FieldByName('ESTRATEGIA').AsInteger;
              Lista.AddObject(FieldByName('TITULO').AsString, Pointer(Estrategia));
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

procedure TDMPropPedidos.QMPedidosPEDIRChange(Sender: TField);
begin
  if (QMPedidosPEDIR.AsInteger <> 0) then
     QMPedidosMARCADO.AsInteger := 1
  else
     QMPedidosMARCADO.AsInteger := 0;
end;

procedure TDMPropPedidos.LocalizaPedido;
var
  ArticuloPed : string;
begin
  ArticuloPed := '';
  if not PideDato('ART', ArticuloPed, _('Articulo'), 'FAMILIA <> ''' + REntorno.FamSistema + '''') then
     ArticuloPed := '';

  with QMPedidos do
  begin
     DisableControls;
     First;
     while ((not EOF) and (QMPedidosARTICULO.AsString <> ArticuloPed)) do
     begin

        Next;
     end;
     EnableControls;
  end;
end;

end.
