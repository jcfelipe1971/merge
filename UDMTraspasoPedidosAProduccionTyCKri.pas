unit UDMTraspasoPedidosAProduccionTyCKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBTableDataSetRO, HYFIBQuery;

type
  TDMTraspasoPedidosAProduccionTyCKri = class(TDataModule)
     xStocksAlmacenesModeloColor: TFIBTableSetRO;
     xStocksAlmacenesModeloColorALMACEN: TFIBStringField;
     xStocksAlmacenesModeloColorUNIDADES: TFloatField;
     xStocksAlmacenesModeloColorVALOR_UNIDADES: TFloatField;
     xStocksAlmacenesModeloColorHORMA: TIntegerField;
     xStocksAlmacenesModeloColorS_COLOR: TFIBStringField;
     xStocksAlmacenesModeloColorID_A_C: TIntegerField;
     xStocksAlmacenesModeloColorT01: TFloatField;
     xStocksAlmacenesModeloColorT02: TFloatField;
     xStocksAlmacenesModeloColorT03: TFloatField;
     xStocksAlmacenesModeloColorT04: TFloatField;
     xStocksAlmacenesModeloColorT05: TFloatField;
     xStocksAlmacenesModeloColorT06: TFloatField;
     xStocksAlmacenesModeloColorT07: TFloatField;
     xStocksAlmacenesModeloColorT08: TFloatField;
     xStocksAlmacenesModeloColorT09: TFloatField;
     xStocksAlmacenesModeloColorT10: TFloatField;
     xStocksAlmacenesModeloColorT11: TFloatField;
     xStocksAlmacenesModeloColorT12: TFloatField;
     xStocksAlmacenesModeloColorT13: TFloatField;
     xStocksAlmacenesModeloColorT14: TFloatField;
     xStocksAlmacenesModeloColorT15: TFloatField;
     xStocksAlmacenesModeloColorT16: TFloatField;
     xStocksAlmacenesModeloColorT17: TFloatField;
     xStocksAlmacenesModeloColorT18: TFloatField;
     xStocksAlmacenesModeloColorT19: TFloatField;
     xStocksAlmacenesModeloColorT20: TFloatField;
     xStocksAlmacenesModeloColorT21: TFloatField;
     xStocksAlmacenesModeloColorT22: TFloatField;
     xStocksAlmacenesModeloColorID_A_M: TIntegerField;
     xStocksAlmacenesModeloColorID_G_T: TIntegerField;
     xStocksAlmacenesModelo: TFIBTableSetRO;
     xStocksAlmacenesModeloUNIDADES: TFloatField;
     xStocksAlmacenesModeloVALOR_UNIDADES: TFloatField;
     xStocksAlmacenesModeloALMACEN: TFIBStringField;
     xStocksAlmacenesModeloPROVEEDOR: TIntegerField;
     xStocksAlmacenesModeloFAMILIA: TFIBStringField;
     xStocksAlmacenesModeloAGNO: TFIBStringField;
     xStocksAlmacenesModeloTEMPORADA: TIntegerField;
     xStocksAlmacenesModeloSECCION: TIntegerField;
     xStocksAlmacenesModeloP_COMPRA: TFloatField;
     xStocksAlmacenesModeloP_VENTA: TFloatField;
     xStocksAlmacenesModeloHORMA: TIntegerField;
     xStocksAlmacenesModeloS_COLOR: TFIBStringField;
     xStocksAlmacenesModeloID_A_C: TIntegerField;
     xStocksAlmacenesModeloT01: TFloatField;
     xStocksAlmacenesModeloT02: TFloatField;
     xStocksAlmacenesModeloT03: TFloatField;
     xStocksAlmacenesModeloT04: TFloatField;
     xStocksAlmacenesModeloT05: TFloatField;
     xStocksAlmacenesModeloT06: TFloatField;
     xStocksAlmacenesModeloT07: TFloatField;
     xStocksAlmacenesModeloT08: TFloatField;
     xStocksAlmacenesModeloT09: TFloatField;
     xStocksAlmacenesModeloT10: TFloatField;
     xStocksAlmacenesModeloT11: TFloatField;
     xStocksAlmacenesModeloT12: TFloatField;
     xStocksAlmacenesModeloT13: TFloatField;
     xStocksAlmacenesModeloT14: TFloatField;
     xStocksAlmacenesModeloT15: TFloatField;
     xStocksAlmacenesModeloT16: TFloatField;
     xStocksAlmacenesModeloT17: TFloatField;
     xStocksAlmacenesModeloT18: TFloatField;
     xStocksAlmacenesModeloT19: TFloatField;
     xStocksAlmacenesModeloT20: TFloatField;
     xStocksAlmacenesModeloT21: TFloatField;
     xStocksAlmacenesModeloT22: TFloatField;
     xStocksAlmacenesModeloID_G_T: TIntegerField;
     DSxStocksAlmacenesModeloColor: TDataSource;
     xget_tallas: TFIBDataSetRO;
     xget_tallasNVISIBLE: TIntegerField;
     xget_tallasGRUPO: TFIBStringField;
     xget_tallasT01: TFIBStringField;
     xget_tallasT02: TFIBStringField;
     xget_tallasT03: TFIBStringField;
     xget_tallasT04: TFIBStringField;
     xget_tallasT05: TFIBStringField;
     xget_tallasT06: TFIBStringField;
     xget_tallasT07: TFIBStringField;
     xget_tallasT08: TFIBStringField;
     xget_tallasT09: TFIBStringField;
     xget_tallasT10: TFIBStringField;
     xget_tallasT11: TFIBStringField;
     xget_tallasT12: TFIBStringField;
     xget_tallasT13: TFIBStringField;
     xget_tallasT14: TFIBStringField;
     xget_tallasT15: TFIBStringField;
     xget_tallasT16: TFIBStringField;
     xget_tallasT17: TFIBStringField;
     xget_tallasT18: TFIBStringField;
     xget_tallasT19: TFIBStringField;
     xget_tallasT20: TFIBStringField;
     xget_tallasT21: TFIBStringField;
     xget_tallasT22: TFIBStringField;
     xget_tallasID_G_T: TIntegerField;
  private
     { Private declarations }
     id_a_m_c: integer;
  public
     { Public declarations }
     procedure AbrirAMC(id_a_m_c: integer; modo: integer);
     function DameUdsPedido(id_s, talla: integer): integer;
     function DameStock(id_a_m_c, talla: integer): integer;
     function DameEnProduccion(id_a_m_c, talla: integer): integer;
     function DameVisible(talla: integer): boolean;
  end;

var
  DMTraspasoPedidosAProduccionTyCKri : TDMTraspasoPedidosAProduccionTyCKri;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMTraspasoPedidosAProduccionTyCKri.AbrirAMC(id_a_m_c: integer; modo: integer);
begin
  Self.id_a_m_c := id_a_m_c;
  with xStocksAlmacenesModeloColor do
  begin
     if Active then
        Close;
     Params.ByName['ID_A_M_C'].AsInteger := id_a_m_c;
     Params.ByName['MODO'].AsInteger := modo;
     Open;
  end;
  with xget_tallas do
  begin
     Open;
     Last;
     Locate('ID_G_T', xStocksAlmacenesModeloColorID_G_T.AsInteger, []);
  end;
end;

function TDMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, talla: integer): integer;
var
  // i : integer;
  Q : THYFIBQuery;
begin
  // Result := 0;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select SUM(UNIDADES) from ges_detalles_s gds join art_articulos_m_c_tallas aamct on ' +
           'gds.id_a_m_c_t = aamct.id_a_m_c_t left join art_tallas artt on artt.id_a_t = aamct.id_a_t ' +
           'where gds.id_s = ' + IntToStr(id_s) +
           ' and cod_talla = ' + IntToStr(talla) + ' and id_a_m_c = ' + IntToStr(id_a_m_c);
        ExecQuery;
        Result := FieldByName['SUM'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMTraspasoPedidosAProduccionTyCKri.DameStock(id_a_m_c, talla: integer): integer;
var
  Q : THYFIBQuery;
begin
  // Result := 0;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT sum(EXISTENCIAS) FROM a_art_dame_stock_art_ed (:empresa, :canal, ' +
        '(select articulo from  art_articulos_m_c_tallas aamct ' +
        ' left join art_tallas artt on artt.id_a_t = aamct.id_a_t ' +
        ' where cod_talla=-:cod_talla and id_a_m_c=:id_a_m_c), :almacen, 1, 0, 0, 0, 0, 0, 0, null)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['COD_TALLA'].AsInteger := talla;
     Params.ByName['ID_A_M_C'].AsInteger := id_a_m_c;
     Params.ByName['ALMACEN'].AsString := '';
     ExecQuery;
     Result := FieldByName['SUM'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

function TDMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(id_a_m_c, talla: integer): integer;
var
  Q : THYFIBQuery;
begin
  // Result := 0;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select sum(aop.unidades) from art_ordenes_produccion aop join art_articulos art ' +
           'on aop.empresa = art.empresa and aop.articulo = art.articulo ' +
           'join art_articulos_m_c_tallas aamct ' +
           'on aamct.id_a_m_c_t = art. id_a_m_c_t  left join art_tallas artt on artt.id_a_t = aamct.id_a_t ' +
           'where aop.estado <= 1 and aop.empresa = ' +
           REntorno.EmpresaStr + ' and aamct.id_a_m_c = ' + IntToStr(id_a_m_c) +
           ' and cod_talla = ' + IntToStr(talla);
        ExecQuery;
        Result := FieldByName['SUM'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMTraspasoPedidosAProduccionTyCKri.DameVisible(talla: integer): boolean;
begin
  Result := talla <= xget_tallasNVISIBLE.AsInteger;
end;

end.
