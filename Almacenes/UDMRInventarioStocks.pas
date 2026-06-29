unit UDMRInventarioStocks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, DBTables, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport;

type
  TDMRInventarioStocks = class(TDataModule)
     QSPInventarioStock: TFIBDataSetRO;
     DSInventarioStock: TDataSource;
     frDSInventarioStock: TfrDBDataSet;
     frInventario_Stock: TfrHYReport;
     TLocal: THYTransaction;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     xFamilia_Desde: TFIBDataSetRO;
     xFamilia_Hasta: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     DSxFamilia_Desde: TDataSource;
     DSxFamilia_Hasta: TDataSource;
     QSPInventarioStockARTICULO: TFIBStringField;
     QSPInventarioStockDESCRIPCION: TFIBStringField;
     QSPInventarioStockUNI_ENT_PER: TFloatField;
     QSPInventarioStockUNI_ENT_ACU: TFloatField;
     QSPInventarioStockUNI_SAL_PER: TFloatField;
     QSPInventarioStockUNI_SAL_ACU: TFloatField;
     QSPInventarioStockUNI_SALD_ACU: TFloatField;
     QSPInventarioStockPRECIO: TFloatField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xNumSeries: TFIBDataSetRO;
     DSxNumSeries: TDataSource;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     QSPInventarioStockV_EMPRESA: TIntegerField;
     QSPInventarioStockV_EJERCICIO: TIntegerField;
     QSPInventarioStockV_CANAL: TIntegerField;
     QSPInventarioStockV_ALMACEN: TFIBStringField;
     frDSxNumSeries: TfrDBDataSet;
     frDSxLotes: TfrDBDataSet;
     xNumSeriesEMPRESA: TIntegerField;
     xNumSeriesCANAL: TIntegerField;
     xNumSeriesCODIGO: TIntegerField;
     xNumSeriesNSERIE: TFIBStringField;
     xNumSeriesARTICULO: TFIBStringField;
     xNumSeriesALMACEN: TFIBStringField;
     xNumSeriesESTADO: TIntegerField;
     xNumSeriesFECHA_CADUCIDAD: TDateTimeField;
     xNumSeriesFECHA_GARANTIA_CLIENTE: TDateTimeField;
     xNumSeriesFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     xNumSeriesNOTAS: TBlobField;
     xNumSeriesDEVUELTO_PROV: TIntegerField;
     xNumSeriesCONTADOR: TIntegerField;
     xNumSeriesACTIVO: TIntegerField;
     xLotesEMPRESA: TIntegerField;
     xLotesCANAL: TIntegerField;
     xLotesALMACEN: TFIBStringField;
     xLotesARTICULO: TFIBStringField;
     xLotesLOTE: TFIBStringField;
     xLotesSERIE: TFIBStringField;
     xLotesCLASIFICACION: TFIBStringField;
     xLotesF_ENVASADO: TDateTimeField;
     xLotesF_CADUCIDAD: TDateTimeField;
     xLotesF_FABRICACION: TDateTimeField;
     xLotesID_A: TIntegerField;
     frxInventario_Stock: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure frInventario_StockEnterRect(Memo: TStringList; View: TfrView);
     procedure frInventario_StockGetValue(const ParName: string; var ParValue: variant);
     procedure DMRInventario_StocksDestroy(Sender: TObject);
     procedure DMRInventarioStocksCreate(Sender: TObject);
     procedure frxInventario_StockBeforePrint(Sender: TfrxReportComponent);
     procedure frxInventario_StockGetValue(const VarName: string; var Value: variant);
     procedure QSPInventarioStockAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     RangoSelec: string;
     LocalMascaraN: string;
     procedure ActualizarRangoSelec(LCan, LAlm: TStringList; Canal: smallint; const Alm: string);
  public
     { Public declarations }
     Periodo, Almacen: string;
     Articulo_Desde, Articulo_Hasta: string;
     Familia_Desde, Familia_Hasta: string;
     T_Cal, Resumido: integer;
     Sin_Stock, T_Acu: string;
     Limites: string;
     TotalMes, TotalAcum: double;
     NSeries, Lotes: boolean;
     procedure Rangos;
     procedure CalculaInforme(LCan, LAlm: TStringList; Canal, Modo, Orden: smallint);
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMRInventarioStocks : TDMRInventarioStocks;
  SW : integer;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, UDMMultiSeleccion, UUtiles;

procedure TDMRInventarioStocks.DMRInventarioStocksCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRInventarioStocks.DMRInventario_StocksDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRInventarioStocks.CalculaInforme(LCan, LAlm: TStringList; Canal, Modo, Orden: smallint);
var
  str, Sentencia1, Sentencia2 : string;
begin
  if (LAlm.Count = 1) then
     LAlm[0] := Almacen;
  DMListados.Normalizar_Desde_Hasta(Articulo_Desde, Articulo_Hasta);
  DMListados.Normalizar_Desde_Hasta(Familia_Desde, Familia_Hasta);
  ActualizarRangoSelec(LCan, LAlm, Canal, Almacen);

  if Canal = 0 then   //Multiselección
  begin
     Sentencia1 := 'SELECT * FROM ART_ARTICULOS_SERIALIZACION ' +
        'WHERE EMPRESA = ?V_EMPRESA ' +
        DMMultiSeleccion.WhereCanales(LCan) +
        DMMultiSeleccion.WhereAlmacenes(LAlm) +
        ' AND ARTICULO = ?ARTICULO AND ' +
        'ESTADO = 1 ';
     Sentencia2 := 'SELECT * FROM ART_ARTICULOS_LOTES ' +
        'WHERE EMPRESA = ?V_EMPRESA ' +
        DMMultiSeleccion.WhereCanales(LCan) +
        DMMultiSeleccion.WhereAlmacenes(LAlm) +
        ' AND ARTICULO = ?ARTICULO ';
  end
  else
  begin
     Sentencia1 := 'SELECT * FROM ART_ARTICULOS_SERIALIZACION ' +
        'WHERE EMPRESA = ?V_EMPRESA AND ' +
        'CANAL = ?V_CANAL AND ' +
        'ALMACEN = ?V_ALMACEN AND ' +
        'ARTICULO = ?ARTICULO AND ' +
        'ESTADO = 1 ';
     Sentencia2 := 'SELECT * FROM SOF_ARTICULOS_LOTES(?V_EMPRESA,?ARTICULO,?V_CANAL) ' +
        'WHERE EMPRESA = ?V_EMPRESA AND ' +
        'CANAL = ?V_CANAL AND ' +
        'ALMACEN = ?V_ALMACEN AND ' +
        'ARTICULO = ?ARTICULO ';
  end;

  with xNumSeries do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := Sentencia1;
  end;

  with xLotes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := Sentencia2;
  end;

  with QSPInventarioStock do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM a_art_inventario_stocks(?ENTRADA,?EMPRESA, ?EJERCICIO, ' +
        '?CANAL, ?PERIODO, ?ALMACEN, ?ART_INI, ?ART_FIN, ?FAM_INI, ' +
        '?FAM_FIN, ?TIPO_CALCULO, ?TIPO_ACUMULADO, ' +
        '?LST_ART_SIN_STOC,?MONEDA)';

     // Orden 0 codigo articulo (orden natural del SP) 1 descripcion articulo
     if (Orden = 1) then
     begin
        SelectSQL.Text := SelectSQL.Text + ' order by descripcion';
     end;

     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PERIODO'].AsString := Periodo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['ART_INI'].AsString := Articulo_Desde;
     Params.ByName['ART_FIN'].AsString := Articulo_Hasta;
     Params.ByName['FAM_INI'].AsString := Familia_Desde;
     Params.ByName['FAM_FIN'].AsString := Familia_Hasta;
     Params.ByName['TIPO_CALCULO'].AsInteger := T_Cal;
     Params.ByName['TIPO_ACUMULADO'].AsString := T_Acu;
     Params.ByName['LST_ART_SIN_STOC'].AsString := Sin_Stock;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Open;
  end;

  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  SW := 1;
  case Resumido of
     0: DMListados.Cargar(21, '');
     1: DMListados.Cargar(126, '');  // Resumido
  end;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frInventario_Stock.LoadFromFIB(REntorno.Formato, str);
     frInventario_Stock.PrepareReport;
     case Modo of
        0: frInventario_Stock.ShowPreparedReport;
        1: frInventario_Stock.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxInventario_Stock.LoadFromFIB(REntorno.Formato, str);
     frxInventario_Stock.PrepareReport;
     case Modo of
        0: frxInventario_Stock.ShowPreparedReport;
        1: frxInventario_Stock.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMRInventarioStocks.Rangos;
var
  dummy : string;
begin
  DameMinMax('CAR', Articulo_Desde, Articulo_Hasta);
  DameMinMax('ALM', Almacen, dummy);
  DameMinMax('FAM', Familia_Desde, Familia_Hasta);
  Periodo := DMMain.DamePeriodo(REntorno.FechaTrab);
end;

procedure TDMRInventarioStocks.frInventario_StockEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMRInventarioStocks.frInventario_StockGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Inicializa' then
  begin
     TotalMes := 0;
     TotalAcum := 0;
  end;
  if ParName = 'Limites' then
     ParValue := Limites;
  if ParName = 'AcumDifVal' then
  begin
     TotalMes := TotalMes + ((QSPInventarioStock.FieldByName('UNI_ENT_PER').AsFloat *
        QSPInventarioStock.FieldByName('PRECIO').AsFloat) -
        (QSPInventarioStock.FieldByName('UNI_SAL_PER').AsFloat *
        QSPInventarioStock.FieldByName('PRECIO').AsFloat));
     TotalAcum := TotalAcum + ((QSPInventarioStock.FieldByName('UNI_ENT_ACU').AsFloat *
        QSPInventarioStock.FieldByName('PRECIO').AsFloat) -
        (QSPInventarioStock.FieldByName('UNI_SAL_ACU').AsFloat *
        QSPInventarioStock.FieldByName('PRECIO').AsFloat));
  end;
  if ParName = 'MesTotal' then
     ParValue := TotalMes;
  if ParName = 'AcumTotal' then
     ParValue := TotalAcum;
  if ParName = 'Periodo' then
  begin
     ParValue := Format(_('%s, Articulo: %s - %s, %s'), [Periodo, Articulo_Desde, Articulo_Hasta, RangoSelec]);
  end;
  if ParName = 'Familia' then
  begin
     ParValue := Format(_('%s - %s, Tipo Val: %d, StinStock: %s'), [Familia_Desde, Familia_Hasta, T_Cal, Sin_Stock]);
  end;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;

  if ParName = 'Desglosado' then
     ParValue := (((xLotes.RecordCount > 0) and (Lotes)) or
        ((xNumSeries.RecordCount > 0) and (NSeries)));

  if ParName = 'NSeries' then
     ParValue := NSeries;

  if ParName = 'Lotes' then
     ParValue := Lotes;
end;

procedure TDMRInventarioStocks.ActualizarRangoSelec(LCan, LAlm: TStringList; Canal: smallint; const Alm: string);
var
  i : integer;
begin
  if (LCan.Count = 0) then
     RangoSelec := Format(_('Canal: %d Almacen %s'), [Canal, Alm])
  else
  begin
     RangoSelec := '';
     for i := 0 to (LCan.Count - 1) do
     begin
        if (i > 0) then
           RangoSelec := RangoSelec + ', ';
        RangoSelec := RangoSelec + Format(_('Canal: %s Almacen %s'), [LCan[i], LAlm[i]]);
     end;
  end;
end;

procedure TDMRInventarioStocks.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMRInventarioStocks.frxInventario_StockBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRInventarioStocks.frxInventario_StockGetValue(const VarName: string; var Value: variant);
begin
  frInventario_StockGetValue(VarName, Value);
end;

procedure TDMRInventarioStocks.QSPInventarioStockAfterOpen(DataSet: TDataSet);
begin
  xNumSeries.Close;
  xNumSeries.Open;
  xLotes.Close;
  xLotes.Open;
end;

end.
