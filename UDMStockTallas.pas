unit UDMStockTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBTableDataSetRO,
  FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TDMStockTallas = class(TDataModule)
     xStocksAlmacenesModeloColor: TFIBTableSet;
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
     xStocksAlmacenesModeloColorALMACEN: TFIBStringField;
     xStocksAlmacenesModelo: TFIBTableSet;
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
     xStocksAlmacenesModeloColorID_A_M: TIntegerField;
     xStocksAlmacenesModeloID_G_T: TIntegerField;
     xStocksAlmacenesModeloColorID_G_T: TIntegerField;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     FSinCanal: boolean;
     procedure SetSinCanal(const Value: boolean);
  public
     procedure AbrirAM(id_a_m: integer; modo: integer);
     procedure AbrirAMC(id_a_m_c: integer; modo: integer);
     procedure AbrirArt(Empresa: integer; Articulo: string);
     property SinCanal: boolean Read FSinCanal Write SetSinCanal;
  end;

var
  DMStockTallas : TDMStockTallas;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMStockTallas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // TLocal es una transaccion RW
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  xStocksAlmacenesModeloColorVALOR_UNIDADES.DisplayFormat := MascaraN;
  xStocksAlmacenesModeloVALOR_UNIDADES.DisplayFormat := MascaraN;
  xStocksAlmacenesModeloP_COMPRA.DisplayFormat := MascaraN;
  xStocksAlmacenesModeloP_VENTA.DisplayFormat := MascaraN;

  FSinCanal := False;
end;

procedure TDMStockTallas.DataModuleDestroy(Sender: TObject);
begin
  // TLocal es una transaccion RW por lo que hago commit para no perder los recaluclos
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMStockTallas.AbrirAMC(id_a_m_c: integer; modo: integer);
begin
  with xStocksAlmacenesModeloColor do
  begin
     if Active then
        Close;

     // TLocal es una transaccion RW
     if (TLocal.InTransaction) then
        TLocal.Commit;
     TLocal.StartTransaction;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (FSinCanal) then
        Params.ByName['CANAL'].AsInteger := 0
     else
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ID_A_M_C'].AsInteger := id_a_m_c;
     Params.ByName['MODO'].AsInteger := modo;
     Open;
  end;
end;

procedure TDMStockTallas.AbrirAM(id_a_m: integer; modo: integer);
begin
  with xStocksAlmacenesModelo do
  begin
     if Active then
        Close;

     // TLocal es una transaccion RW
     if (TLocal.InTransaction) then
        TLocal.Commit;
     TLocal.StartTransaction;

     SelectSQL.Text := 'SELECT * FROM XGET_STOCK_AM_ALM (:EMPRESA, :CANAL, :ID_A_M, ''NOW'', :MODO, 0, '''') ORDER BY S_COLOR, ALMACEN';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (FSinCanal) then
        Params.ByName['CANAL'].AsInteger := 0
     else
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ID_A_M'].AsInteger := id_a_m;
     Params.ByName['MODO'].AsInteger := modo;
     Open;
  end;
end;

procedure TDMStockTallas.SetSinCanal(const Value: boolean);
begin
  FSinCanal := Value;
end;

procedure TDMStockTallas.AbrirArt(Empresa: integer; Articulo: string);
begin
  with xStocksAlmacenesModelo do
  begin
     if Active then
        Close;

     // TLocal es una transaccion RW
     if (TLocal.InTransaction) then
        TLocal.Commit;
     TLocal.StartTransaction;

     SelectSQL.Clear;
     SelectSQL.Add('SELECT -1 ID_G_T,S.EXISTENCIAS UNIDADES,S.VALOR_EXISTENCIAS VALOR_UNIDADES,S.ALMACEN,-1 PROVEEDOR,CAST('''' AS VARCHAR(5)) FAMILIA, ');
     SelectSQL.Add('CAST(''00'' AS VARCHAR(2)) AGNO, 1 TEMPORADA, 1 SECCION, S.P_COSTE P_COMPRA, 0.0 P_VENTA, 1 HORMA, CAST(''0000'' AS VARCHAR(10)) S_COLOR, -1 ID_A_C, ');
     SelectSQL.Add('S.EXISTENCIAS T01, 0.0 T02, 0.0 T03, 0.0 T04, 0.0 T05, 0.0 T06, 0.0 T07, 0.0 T08, 0.0 T09, 0.0 T10, ');
     SelectSQL.Add('0.0 T11, 0.0 T12, 0.0 T13, 0.0 T14, 0.0 T15, 0.0 T16, 0.0 T17, 0.0 T18, 0.0 T19, 0.0 T20, 0.0 T21, 0.0 T22 ');
     SelectSQL.Add('FROM A_ART_DAME_STOCK_ART_ED(?EMPRESA, ?CANAL, ?ARTICULO, '''', 1, 0, 0, 0, 0, 0, 0, NULL) S ');
     SelectSQL.Add('JOIN ART_ALMACENES A ');
     SelectSQL.Add('ON S.EMPRESA = A.EMPRESA AND S.ALMACEN = A.ALMACEN ');
     SelectSQL.Add('WHERE A.ACTIVO = 1 ');
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     if (FSinCanal) then
        Params.ByName['CANAL'].AsInteger := 0
     else
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

end.
