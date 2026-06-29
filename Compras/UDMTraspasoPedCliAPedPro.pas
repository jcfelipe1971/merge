unit UDMTraspasoPedCliAPedPro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBQuery, HYFIBQuery, FIBTableDataSet;

type
  TDMTraspasoPedCliAPedPro = class(TDataModule)
     TLocal: THYTransaction;
     DSTMPPedidosAProv: TDataSource;
     TMPPedidosAProv: TFIBTableSet;
     TMPPedidosAProvEMPRESA: TIntegerField;
     TMPPedidosAProvEJERCICIO: TIntegerField;
     TMPPedidosAProvCANAL: TIntegerField;
     TMPPedidosAProvALMACEN: TFIBStringField;
     TMPPedidosAProvARTICULO: TFIBStringField;
     TMPPedidosAProvARTICULO_TITULO: TFIBStringField;
     TMPPedidosAProvENTRADA: TIntegerField;
     TMPPedidosAProvPROVEEDOR: TIntegerField;
     TMPPedidosAProvPEDIR: TFloatField;
     TMPPedidosAProvMARCADO: TIntegerField;
     TMPPedidosAProvUNIDADES: TFloatField;
     TMPPedidosAProvID_S: TIntegerField;
     TMPPedidosAProvID_DETALLES_S: TIntegerField;
     TMPPedidosAProvP_COSTE: TFloatField;
     TMPPedidosAProvNOTAS: TBlobField;
     TMPPedidosAProvDESCUENTO_1: TFloatField;
     TMPPedidosAProvDESCUENTO_2: TFloatField;
     TMPPedidosAProvDESCUENTO_3: TFloatField;
     TMPPedidosAProvCLIENTE: TIntegerField;
     TMPPedidosAProvTITULO_CLI: TFIBStringField;
     TMPPedidosAProvSTOCK: TFloatField;
     TMPPedidosAProvSTOCK_MINIMO: TFloatField;
     TMPPedidosAProvSTOCK_MAXIMO: TFloatField;
     TMPPedidosAProvSU_REFERENCIA: TFIBStringField;
     TMPPedidosAProvPEDIDO: TFIBStringField;
     TMPPedidosAProvNOMBRE_R_SOCIAL: TFIBStringField;
     TMPPedidosAProvNOTAS2: TBlobField;
     TMPPedidosAProvCRC_NOTAS: TFIBStringField;
     TMPPedidosAProvCRC_NOTAS2: TFIBStringField;
     TUpdate: THYTransaction;
     TMPPedidosAProvLINEA_ESC: TIntegerField;
     TMPPedidosAProvSTOCK_ALM: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure TMPPedidosAProvNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure TMPPedidosAProvBeforePost(DataSet: TDataSet);
     procedure TMPPedidosAProvCalcFields(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     AlmacenStock: string;
     StockAlm: TStrings;
  public
     { Public declarations }
     procedure CaptaPedidos(Proveedor: integer);
     procedure MarcaLineas(marca: integer);
     procedure LimpiaTemporal;
     procedure TraspasaPedidoAProv(Proveedor: integer; Serie, almacen, SuReferencia: string; Fecha: TDateTime; AgregarAAbierto: boolean);
     procedure RellenaStockMinimo(Almacen: string);
  end;

var
  DMTraspasoPedCliAPedPro : TDMTraspasoPedCliAPedPro;

implementation

uses UDMMain, UEntorno, UFMain, UUtiles, UParam;

{$R *.dfm}

procedure TDMTraspasoPedCliAPedPro.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  StockAlm := TStringList.Create;

  TMPPedidosAProvP_COSTE.DisplayFormat := MascaraN;
  TMPPedidosAProvDESCUENTO_1.DisplayFormat := MascaraP;
  TMPPedidosAProvDESCUENTO_2.DisplayFormat := MascaraP;
  TMPPedidosAProvDESCUENTO_3.DisplayFormat := MascaraP;
  TMPPedidosAProvUNIDADES.DisplayFormat := MascaraN;
  TMPPedidosAProvPEDIR.DisplayFormat := MascaraN;
  TMPPedidosAProvSTOCK.DisplayFormat := MascaraN;
  TMPPedidosAProvSTOCK_MINIMO.DisplayFormat := MascaraN;
  TMPPedidosAProvSTOCK_MAXIMO.DisplayFormat := MascaraN;
  TMPPedidosAProvSTOCK_ALM.DisplayFormat := MascaraN;
end;

procedure TDMTraspasoPedCliAPedPro.DataModuleDestroy(Sender: TObject);
begin
  StockAlm.Free;
end;

procedure TDMTraspasoPedCliAPedPro.CaptaPedidos(Proveedor: integer);
begin
  AlmacenStock := LeeParametro('PECSTKA001', '');
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  LimpiaTemporal;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Creo la tabla temporal con los pedidos pendientes de pasar a ped de proveedor
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CAPTA_LINEAS_PEDIDO_CLI_KRI (?ENTRADA, ?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?PROVEEDOR)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with TMPPedidosAProv do
  begin
     if Active then
        Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMTraspasoPedCliAPedPro.RellenaStockMinimo(Almacen: string);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Relleno Stock_Minimo y Stock_Maximo segun el almacen
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE RELLENA_STOCK_MIN_KRI (:ENTRADA, :EMPRESA, :CANAL, :ALMACEN)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with TMPPedidosAProv do
  begin
     if Active then
        Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMTraspasoPedCliAPedPro.MarcaLineas(marca: integer);
var
  mark : TBookmark;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PEDIDOS_POR_ENTRADA_KRI SET MARCADO = :MARCA WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MARCA'].AsInteger := marca;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with TMPPedidosAProv do
  begin
     mark := TMPPedidosAProv.GetBookmark;
     try
        Close;
        Open;

        try
           GotoBookmark(mark);
        except
           First;
        end;
     finally
        FreeBookmark(mark);
     end;
  end;
end;

procedure TDMTraspasoPedCliAPedPro.TMPPedidosAProvNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMTraspasoPedCliAPedPro.LimpiaTemporal;
begin
  with TMPPedidosAProv do
  begin
     if Active then
        Close;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PEDIDOS_POR_ENTRADA_KRI WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTraspasoPedCliAPedPro.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMTraspasoPedCliAPedPro.TraspasaPedidoAProv(Proveedor: integer; Serie, almacen, SuReferencia: string; Fecha: TDateTime; AgregarAAbierto: boolean);
var
  id_e : integer;
begin
  // Traspasamos las lineas seleccionadas a Pedido a Proveedor
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE T_TRASPASO_A_PEDIDO_PROV_KRI( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ALMACEN, :ENTRADA, ');
        SQL.Add(' :FECHA_DOC, :SU_REFERENCIA, :PROVEEDOR, :AGREGAR_A_ABIERTO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_DOC'].AsDateTime := Fecha;
        Params.ByName['SU_REFERENCIA'].AsString := SuReferencia;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        if (AgregarAAbierto) then
           Params.ByName['AGREGAR_A_ABIERTO'].AsInteger := 1
        else
           Params.ByName['AGREGAR_A_ABIERTO'].AsInteger := 0;
        ExecQuery;
        id_e := FieldByName['ID_E'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Buscamos los datos para abrir el pedido a proveedor generado
  if (id_e > 0) then
     FMain.TraspasoDeDocumentosEntrada(id_e);

  // Recargamos lo que quede pendiente para este proveedor
  CaptaPedidos(Proveedor);
end;

procedure TDMTraspasoPedCliAPedPro.TMPPedidosAProvBeforePost(DataSet: TDataSet);
begin
  // Calculo el CRC de las notas para poder agrupar
  TMPPedidosAProvCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(TMPPedidosAProvNOTAS));
  TMPPedidosAProvCRC_NOTAS2.AsString := CalcCRC32Str(FMain.DameTexto(TMPPedidosAProvNOTAS2));
end;

procedure TDMTraspasoPedCliAPedPro.TMPPedidosAProvCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
  CalcularStock : boolean;
begin
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

end.
