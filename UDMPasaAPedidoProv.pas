unit UDMPasaAPedidoProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBQuery, HYFIBQuery, FIBDatabase,
  UFIBModificados, FIBTableDataSet;

type
  TDMPasaAPedidoProv = class(TDataModule)
     DSTMPPedidosAProv: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     TMPPedidosAProv: TFIBTableSet;
     TMPPedidosAProvEMPRESA: TIntegerField;
     TMPPedidosAProvEJERCICIO: TIntegerField;
     TMPPedidosAProvCANAL: TIntegerField;
     TMPPedidosAProvALMACEN: TFIBStringField;
     TMPPedidosAProvARTICULO: TFIBStringField;
     TMPPedidosAProvARTICULO_TITULO: TFIBStringField;
     TMPPedidosAProvENTRADA: TIntegerField;
     TMPPedidosAProvPROVEEDOR: TIntegerField;
     TMPPedidosAProvNOMBRE_R_SOCIAL: TFIBStringField;
     TMPPedidosAProvPEDIR: TFloatField;
     TMPPedidosAProvMARCADO: TIntegerField;
     TMPPedidosAProvNUEVO: TIntegerField;
     TMPPedidosAProvLINEA: TIntegerField;
     TMPPedidosAProvUNIDADES: TFloatField;
     TMPPedidosAProvPROYECTO: TIntegerField;
     TMPPedidosAProvLINEA_ESC: TIntegerField;
     TMPPedidosAProvES_COMPONENTE: TIntegerField;
     TMPPedidosAProvID_ORDEN: TIntegerField;
     TMPPedidosAProvSTOCK: TFloatField;
     TMPPedidosAProvSTOCK_MINIMO: TFloatField;
     TMPPedidosAProvSTOCK_MAXIMO: TFloatField;
     TMPPedidosAProvPEDIDOS_A_PRO: TFloatField;
     TMPPedidosAProvPEDIDOS_D_CLI: TFloatField;
     TMPPedidosAProvEN_PROCESO_PROD: TFloatField;
     TMPPedidosAProvPEDIDO_MINIMO: TFloatField;
     TMPPedidosAProvPEDIDO_OPTIMO: TFloatField;
     TMPPedidosAProvINCR_PEDIDO: TFloatField;
     TMPPedidosAProvDIAS_ENTREGA: TIntegerField;
     TMPPedidosAProvFECHA_ENTREGA: TDateTimeField;
     TMPPedidosAProvID_DETALLES_S: TIntegerField;
     TMPPedidosAProvID_DETALLES_E: TIntegerField;
     TMPPedidosAProvPRO_NUM_PLANO: TStringField;
     TMPPedidosAProvD_RIG: TIntegerField;
     TMPPedidosAProvFECHA_ENTREGA_PREV: TDateField;
     TMPPedidosAProvSTOCK_TOTAL: TFloatField;
     TMPPedidosAProvDES_ALTO: TFloatField;
     TMPPedidosAProvDES_ANCHO: TFloatField;
     TMPPedidosAProvDES_GRUESO: TFloatField;
     TMPPedidosAProvSTOCK_ALM: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure TMPPedidosAProvNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure TMPPedidosAProvCalcFields(DataSet: TDataSet);
     procedure TMPPedidosAProvD_RIGGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure TMPPedidosAProvFECHA_ENTREGA_PREVGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     procedure QuitarSinControlStock;
     procedure CalculoUnidadesAPedir;
     procedure RefrescaTabla;
  public
     { Public declarations }
     Serie: string;
     Tipo: string;
     Canal: integer;
     Almacen: string;
     Fecha: TDateTime;
     FechaEntrega: TDateTime;
     SuReferencia: string;
     Rig: integer;
     id_s: integer;
     AlmacenStock: string;
     StockAlm: TStrings;
     procedure LimpiaTemporal;
     procedure MarcaLineas(marca: integer);
     procedure TraspasaPedidoAProv(UnirAPedidoAbierto: boolean);
     procedure TraspasaPropuestaProv(UnirAPropuestaAbierta: boolean);
     procedure AbreTablaTemporal;
     procedure DesglosaEscandallo;
     procedure DesglosaOrden;
     procedure CambiaAlmacen(aAlmacen: string);
     procedure CambiaProveedor(Proveedor: integer);
     procedure SeleccionaLineas;
     procedure CalculoFechaEntrega;
     procedure MuestraPedidoCompra();
     procedure CambiarArticulo(Articulo: string);
     procedure MarcarPedidoListoParaPreparar;
     procedure PonVisiblesHojasDeTrabajo;
     function LonaPedida: string;
     function UnidadesNecesariasLonaOrdenes(Lona: string): double;
  end;

var
  DMPasaAPedidoProv : TDMPasaAPedidoProv;

implementation

uses UEntorno, UDMMain, UFMain, UUtiles, DateUtils, UParam;

{$R *.dfm}

procedure TDMPasaAPedidoProv.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  TMPPedidosAProvUNIDADES.DisplayFormat := ',0.##';
  TMPPedidosAProvPEDIR.DisplayFormat := ',0.##';
  TMPPedidosAProvSTOCK.DisplayFormat := ',0.##';
  TMPPedidosAProvSTOCK_TOTAL.DisplayFormat := ',0.##';
  TMPPedidosAProvSTOCK_MINIMO.DisplayFormat := ',0.##';
  TMPPedidosAProvSTOCK_MAXIMO.DisplayFormat := ',0.##';
  TMPPedidosAProvPEDIDOS_A_PRO.DisplayFormat := ',0.##';
  TMPPedidosAProvPEDIDOS_D_CLI.DisplayFormat := ',0.##';
  TMPPedidosAProvEN_PROCESO_PROD.DisplayFormat := ',0.##';
  TMPPedidosAProvPEDIDO_MINIMO.DisplayFormat := ',0.##';
  TMPPedidosAProvPEDIDO_OPTIMO.DisplayFormat := ',0.##';
  TMPPedidosAProvINCR_PEDIDO.DisplayFormat := ',0.##';
  TMPPedidosAProvFECHA_ENTREGA.DisplayFormat := ShortDateFormat;
  TMPPedidosAProvFECHA_ENTREGA_PREV.DisplayFormat := ShortDateFormat;

  StockAlm := TStringList.Create;
  AlmacenStock := LeeParametro('PRPSTKA001', '');
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);
end;

procedure TDMPasaAPedidoProv.DataModuleDestroy(Sender: TObject);
begin
  StockAlm.Free;
  TMPPedidosAProv.Close;
  LimpiaTemporal;
end;

procedure TDMPasaAPedidoProv.LimpiaTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PEDIDOS_POR_ENTRADA WHERE EMPRESA = ?EMPRESA AND ENTRADA = ?ENTRADA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.MarcaLineas(marca: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PEDIDOS_POR_ENTRADA SET MARCADO = ?MARCA WHERE EMPRESA = ?EMPRESA AND ENTRADA = ?ENTRADA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MARCA'].AsInteger := marca;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaTabla;
end;

procedure TDMPasaAPedidoProv.TraspasaPedidoAProv(UnirAPedidoAbierto: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE T_TRASPASO_A_COMPRA ');
        SQL.Add(' (?ID_S, ?D_CANAL, ?D_SERIE, ');
        SQL.Add(' ?ALMACEN, ?ENTRADA, ?D_FECHA_DOC, ?SU_REFERENCIA, ');
        SQL.Add(' ?UNIR_A_PEDIDO_ABIERTO, ''PEP'') ');
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['D_CANAL'].AsInteger := Canal;
        Params.ByName['D_SERIE'].AsString := Serie;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['D_FECHA_DOC'].AsDateTime := Fecha;
        Params.ByName['SU_REFERENCIA'].AsString := SuReferencia;
        Params.ByName['UNIR_A_PEDIDO_ABIERTO'].AsInteger := BoolToInt(UnirAPedidoAbierto);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.TraspasaPropuestaProv(UnirAPropuestaAbierta: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE T_TRASPASO_A_COMPRA ');
        SQL.Add(' (?ID_S, ?D_CANAL, ?D_SERIE, ');
        SQL.Add(' ?ALMACEN, ?ENTRADA, ?D_FECHA_DOC, ?SU_REFERENCIA, ');
        SQL.Add(' ?UNIR_A_PROPUESTA_ABIERTA, ''OFP'') ');
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['D_CANAL'].AsInteger := Canal;
        Params.ByName['D_SERIE'].AsString := Serie;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['D_FECHA_DOC'].AsDateTime := Fecha;
        Params.ByName['SU_REFERENCIA'].AsString := SuReferencia;
        Params.ByName['UNIR_A_PROPUESTA_ABIERTA'].AsInteger := BoolToInt(UnirAPropuestaAbierta);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.AbreTablaTemporal;
begin
  with TMPPedidosAProv do
  begin
     if Active then
        Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMPasaAPedidoProv.TMPPedidosAProvNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPasaAPedidoProv.DesglosaEscandallo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DESG_COMP_TRASP_PED(?EMPRESA, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CalculoFechaEntrega;
  QuitarSinControlStock;
  AbreTablaTemporal;
end;

procedure TDMPasaAPedidoProv.DesglosaOrden;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DESG_COMP_TRASP_PED_ORD(?EMPRESA, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CalculoFechaEntrega;
  QuitarSinControlStock;
  AbreTablaTemporal;
end;

procedure TDMPasaAPedidoProv.CambiaAlmacen(aAlmacen: string);
begin
  Almacen := aAlmacen;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PEDIDOS_POR_ENTRADA SET ALMACEN = ?ALMACEN WHERE EMPRESA = ?EMPRESA AND ENTRADA = ?ENTRADA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CalculoUnidadesAPedir;
  AbreTablaTemporal;
end;

procedure TDMPasaAPedidoProv.CambiaProveedor(Proveedor: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PEDIDOS_POR_ENTRADA SET PROVEEDOR = :PROVEEDOR WHERE EMPRESA = :EMPRESA AND ENTRADA = :ENTRADA AND MARCADO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbreTablaTemporal;
end;

procedure TDMPasaAPedidoProv.SeleccionaLineas;
begin
  // Obtengo las líneas a pedir
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CAPTA_LINEAS_PEDIDO_CLI(?EMPRESA, ?ENTRADA, ?ID_S)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // QuitarSinControlStock;
  CalculoFechaEntrega;
  CalculoUnidadesAPedir;

  AbreTablaTemporal;
end;

procedure TDMPasaAPedidoProv.CalculoFechaEntrega;
begin
  // Calculo la fecha de entrega
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PEDIDOS_POR_ENTRADA SET FECHA_ENTREGA = ?FECHA_ENTREGA - DIAS_ENTREGA WHERE EMPRESA = ?EMPRESA AND ENTRADA = ?ENTRADA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_ENTREGA'].AsDateTime := FechaEntrega;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.CalculoUnidadesAPedir;
begin
  // Calculo las unidades a pedir.
  // Cuando pongo 0, se recalcula en el trigger update
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PEDIDOS_POR_ENTRADA SET PEDIR = -1 WHERE EMPRESA = ?EMPRESA AND ENTRADA = ?ENTRADA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.QuitarSinControlStock;
begin
  // Quito lineas que no controlan stock

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_PEDIDOS_POR_ENTRADA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' ENTRADA = ?ENTRADA AND ');
        SQL.Add(' ARTICULO IN ( ');
        SQL.Add('     SELECT ARTICULO FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND CONTROL_STOCK = 0) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.TMPPedidosAProvCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
  CalcularStock : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT D.PRO_NUM_PLANO, P.FECHA_ENTREGA_PREV FROM GES_DETALLES_S D ');
        SQL.Add(' JOIN GES_DETALLES_S_PED P ');
        SQL.Add(' ON D.ID_DETALLES_S = P.ID_DETALLES_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ID_DETALLES_S = :ID_DETALLES_S ');
        Params.ByName['ID_DETALLES_S'].AsInteger := TMPPedidosAProvID_DETALLES_S.AsInteger;
        ExecQuery;
        TMPPedidosAProvPRO_NUM_PLANO.AsString := FieldByName['PRO_NUM_PLANO'].AsString;
        TMPPedidosAProvFECHA_ENTREGA_PREV.AsDateTime := FieldByName['FECHA_ENTREGA_PREV'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (TMPPedidosAProvID_DETALLES_E.AsInteger > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT RIG FROM GES_DETALLES_E WHERE ID_DETALLES_E = :ID_DETALLES_E';
           Params.ByName['ID_DETALLES_E'].AsInteger := TMPPedidosAProvID_DETALLES_E.AsInteger;
           ExecQuery;
           TMPPedidosAProvD_RIG.AsInteger := FieldByName['RIG'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     TMPPedidosAProvD_RIG.AsInteger := 0;

  Stock := 0;
  CalcularStock := (AlmacenStock <> 'NOCALC') and (DMMain.ArticuloControlaStock(TMPPedidosAProvARTICULO.AsString));
  if CalcularStock then
  begin
     Articulo := TMPPedidosAProvARTICULO.AsString;
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
  TMPPedidosAProvSTOCK_ALM.AsFloat := Stock;
end;

procedure TDMPasaAPedidoProv.TMPPedidosAProvD_RIGGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (TMPPedidosAProvD_RIG.AsInteger = 0) then
     Text := '';
end;

procedure TDMPasaAPedidoProv.MuestraPedidoCompra();
begin
  if (TMPPedidosAProvID_DETALLES_E.AsInteger > 0) then
     FMain.TraspasoDeDocumentosEntrada(TMPPedidosAProvID_DETALLES_E.AsInteger);
end;

procedure TDMPasaAPedidoProv.CambiarArticulo(Articulo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_PEDIDOS_POR_ENTRADA ');
        SQL.Add(' SET ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' LINEA = :LINEA AND ');
        SQL.Add(' LINEA_ESC = :LINEA_ESC ');
        Params.ByName['EMPRESA'].AsInteger := TMPPedidosAProvEMPRESA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := TMPPedidosAProvENTRADA.AsInteger;
        Params.ByName['LINEA'].AsInteger := TMPPedidosAProvLINEA.AsInteger;
        Params.ByName['LINEA_ESC'].AsInteger := TMPPedidosAProvLINEA_ESC.AsInteger;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaTabla;
end;

procedure TDMPasaAPedidoProv.RefrescaTabla;
var
  mark : TBookmark;
begin
  with TMPPedidosAProv do
  begin
     mark := TMPPedidosAProv.GetBookmark;
     try
        Close;
        Open;
        if BookmarkValid(mark) then
           GotoBookmark(mark);
     finally
        FreeBookmark(mark);
     end;
  end;
end;

procedure TDMPasaAPedidoProv.TMPPedidosAProvFECHA_ENTREGA_PREVGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (TMPPedidosAProvFECHA_ENTREGA.AsDateTime < Today) then
     Text := DateToStr(Today + TMPPedidosAProvDIAS_ENTREGA.AsInteger)
  else
     Text := FormatDateTime(ShortDateFormat, TMPPedidosAProvFECHA_ENTREGA.AsDateTime + TMPPedidosAProvDIAS_ENTREGA.AsInteger);
end;

function TDMPasaAPedidoProv.LonaPedida: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(1) COALESCE(M.COMPONENTE, '''') AS ARTICULO ');
        SQL.Add(' FROM PRO_ORD_MAT M ');
        SQL.Add(' JOIN PRO_ORD O ON O.ID_ORDEN = M.ID_ORDEN ');
        SQL.Add(' JOIN GES_DETALLES_S D ON O.EMPRESA = D.EMPRESA AND O.EJERCICIO = D.EJERCICIO AND O.CANAL = D.CANAL AND O.SERIES = D.SERIE AND D.TIPO = ''PEC'' AND O.PEDIDO = D.RIG AND O.LINEA_PED = D.LINEA ');
        SQL.Add(' JOIN ART_ARTICULOS A ON M.ID_A = A.ID_A ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.TIPO_ARTICULO_TYC = ''L'' AND ');
        SQL.Add(' D.ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;

        Result := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMPasaAPedidoProv.UnidadesNecesariasLonaOrdenes(Lona: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(M.UNIDADES_NEC) AS UNIDADES ');
        SQL.Add(' FROM PRO_ORD_MAT M ');
        SQL.Add(' JOIN PRO_ORD O ON O.ID_ORDEN = M.ID_ORDEN ');
        SQL.Add(' JOIN GES_DETALLES_S D ON O.EMPRESA = D.EMPRESA AND O.EJERCICIO = D.EJERCICIO AND O.CANAL = D.CANAL AND O.SERIES = D.SERIE AND D.TIPO = ''PEC'' AND O.PEDIDO = D.RIG AND O.LINEA_PED = D.LINEA ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ID_S = :ID_S AND ');
        SQL.Add(' M.COMPONENTE = :LONA ');
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['LONA'].AsString := Lona;
        ExecQuery;
        Result := FieldByName['UNIDADES'].AsDouble;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.MarcarPedidoListoParaPreparar;
begin
  // Marcamos pedido como LISTO_PARA_PREPARAR = 1
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_S_PED SET LISTO_PARA_PREPARAR = 1 WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPasaAPedidoProv.PonVisiblesHojasDeTrabajo;
begin
  // Marcamos pedido como LISTO_PARA_PREPARAR
  MarcarPedidoListoParaPreparar;

  // Ponemos visibles las hojas de trabajo de las ordenes del pedido
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE OPE_HOJAS_TRAB_VISIBILIDAD_PEC(:ID_S, 1)';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
