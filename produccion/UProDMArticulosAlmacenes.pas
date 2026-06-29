unit UProDMArticulosAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, Controls, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TProDMArticulosAlmacenes = class(TDataModule)
     TLocal: THYTransaction;
     QMArticulos: TFIBTableSet;
     DSQMArticulos: TDataSource;
     QMDetStocks: TFIBTableSet;
     DSQMDetStocks: TDataSource;
     QMArticulosEMPRESA: TIntegerField;
     QMArticulosTARIFA: TFIBStringField;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosTITULO_ARTICULO: TFIBStringField;
     QMArticulosFAMILIA: TFIBStringField;
     QMArticulosLINEA: TIntegerField;
     QMArticulosCALCULO: TIntegerField;
     QMArticulosTITULO_CALCULO: TFIBStringField;
     QMArticulosUNID_MINIMAS: TFloatField;
     QMArticulosUNID_MAXIMAS: TFloatField;
     QMArticulosPRECIO_BASE: TFloatField;
     QMArticulosPRECIO_VENTA: TFloatField;
     QMArticulosMARGEN_PC: TFloatField;
     QMArticulosMARGEN_PV: TFloatField;
     QMArticulosCOMISION: TFloatField;
     QMArticulosBLOQUEADO: TIntegerField;
     QMArticulosMONEDA: TFIBStringField;
     QMArticulosACTIVA: TIntegerField;
     QMArticulosMARGEN: TFloatField;
     QMArticulosID_A: TIntegerField;
     QSPBusquedaArticulo: THYFIBQuery;
     xTarifas: TFIBDataSetRO;
     DSxTarifas: TDataSource;
     QMDetStocksEMPRESA: TIntegerField;
     QMDetStocksALMACEN: TFIBStringField;
     QMDetStocksENTRADAS: TFloatField;
     QMDetStocksSALIDAS: TFloatField;
     QMDetStocksEXISTENCIAS: TFloatField;
     QMDetStocksPEDIDOS_D_CLI: TFloatField;
     QMDetStocksRESERVADAS: TFloatField;
     QMDetStocksSTOCK_MINIMO: TFloatField;
     QMDetStocksSTOCK_MAXIMO: TFloatField;
     QMDetStocksPEDIDOS_A_PRO: TFloatField;
     QMDetStocksEN_PROCESO_PROD: TFloatField;
     QMDetStocksARTICULO: TFIBStringField;
     xTarifasTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArticulosAfterOpen(DataSet: TDataSet);
     procedure QMDetStocksz_stock_virtualGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure FiltraVista(articulo, tarifa: string);
  private
     { Private declarations }
     SentenciaSQL: string;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure BuscarArticulo(articulo, tarifa: string);
     procedure DatosStocks(var Articulo, Almacen: string);
  end;

var
  ProDMArticulosAlmacenes : TProDMArticulosAlmacenes;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.dfm}

procedure TProDMArticulosAlmacenes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  //SFG_Ruth
  SentenciaSQL := QMArticulos.SelectSQL.Text;

  QMArticulosPRECIO_VENTA.DisplayFormat := MascaraE;

  QMDetStocksENTRADAS.DisplayFormat := MascaraN;
  QMDetStocksSALIDAS.DisplayFormat := MascaraN;
  QMDetStocksEXISTENCIAS.DisplayFormat := MascaraN;
  QMDetStocksSTOCK_MINIMO.DisplayFormat := MascaraN;
  QMDetStocksSTOCK_MAXIMO.DisplayFormat := MascaraN;
  QMDetStocksPEDIDOS_A_PRO.DisplayFormat := MascaraN;
  QMDetStocksPEDIDOS_D_CLI.DisplayFormat := MascaraN;
  QMDetStocksEN_PROCESO_PROD.DisplayFormat := MascaraN;
  QMDetStocksRESERVADAS.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMArticulos, '10000');
end;

procedure TProDMArticulosAlmacenes.QMArticulosAfterOpen(DataSet: TDataSet);
begin
  QMDetStocks.Close;
  QMDetStocks.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMDetStocks.Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
  // QMDetStocks.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMDetStocks.Open;
end;

procedure TProDMArticulosAlmacenes.BusquedaCompleja;
var
  orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMArticulos, '10000', False) <> mrCancel) then
  begin
     orden := QMArticulos.OrdenadoPor;
     QMArticulos.Ordenar('');
     if QMArticulos.SelectSQL.Count <> 0 then
        QMArticulos.SelectSQL.Add('and familia<>''' + REntorno.FamSistema + '''');
     QMArticulos.Ordenar(orden);
     QMArticulos.Ordenar('ARTICULO');
  end;
  QMArticulos.Open;
end;

procedure TProDMArticulosAlmacenes.QMDetStocksz_stock_virtualGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraN, QMDetStocksEXISTENCIAS.AsFloat - QMDetStocksPEDIDOS_D_CLI.AsFloat - QMDetStocksRESERVADAS.AsFloat);
end;

procedure TProDMArticulosAlmacenes.BuscarArticulo(articulo, tarifa: string);
var
  Codigo_articulo : string;
begin
  xTarifas.Close;
  xTarifas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xTarifas.Params.ByName['TARIFA'].AsString := tarifa;
  xTarifas.Open;

  with QSPBusquedaArticulo do
  begin
     SQL.Clear;
     SQL.Add('EXECUTE PROCEDURE DAME_ARTICULO(?articulo,?empresa)');
     Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := articulo;
     ExecQuery;
     Transaction.CommitRetaining;
     Codigo_articulo := FieldByName['COD_ARTICULO'].AsString;
     FreeHandle;
  end;

  if (articulo <> '') then
  begin
     with QMArticulos do
     begin
        Close;
        QMArticulosARTICULO.AsString := Codigo_articulo;
        QMArticulosTARIFA.AsString := tarifa;

        SelectSQL.Text := ('SELECT * FROM VER_ART_TARIFAS_PRECIOS WHERE ARTICULO=?cod_articulo' +
           ' AND TARIFA=?tarifa');
        Params.ByName['COD_ARTICULO'].AsString := Codigo_articulo;
        Params.ByName['TARIFA'].AsString := tarifa;
        Open;
     end;
  end
  else
  begin
     QMArticulos.Close;
     QMArticulos.SelectSQL.Text := ('SELECT * FROM VER_ART_TARIFAS_PRECIOS WHERE' +
        ' TARIFA=?tarifa AND familia<>''' + REntorno.FamSistema +
        '''' + ' AND empresa=' + REntorno.EmpresaStr +
        ' ORDER BY ARTICULO');
     QMArticulos.Params.ByName['TARIFA'].AsString := tarifa;
     QMArticulos.Open;
  end;
end;

procedure TProDMArticulosAlmacenes.FiltraVista(articulo, tarifa: string);
var
  Codigo_articulo : string;
begin
  xTarifas.Close;
  xTarifas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xTarifas.Params.ByName['TARIFA'].AsString := tarifa;
  xTarifas.Open;

  with QSPBusquedaArticulo do
  begin
     SQL.Clear;
     SQL.Add('EXECUTE PROCEDURE DAME_ARTICULO(?articulo,?empresa)');
     Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := articulo;
     ExecQuery;
     Transaction.CommitRetaining;
     Codigo_articulo := FieldByName['COD_ARTICULO'].AsString;
     FreeHandle;
  end;
  if (articulo <> '') then
  begin
     with QMArticulos do
     begin
        Close;
        QMArticulosARTICULO.AsString := Codigo_articulo;
        QMArticulosTARIFA.AsString := tarifa;
        SelectSQL.Text := ('SELECT * FROM VER_ART_TARIFAS_PRECIOS WHERE ARTICULO=?cod_articulo' +
           ' AND TARIFA=?tarifa');
        Params.ByName['COD_ARTICULO'].AsString := Codigo_articulo;
        Params.ByName['TARIFA'].AsString := tarifa;
        Open;
     end;
  end
  else
  begin
     QMArticulos.Close;
     QMArticulosTARIFA.AsString := tarifa;
     QMArticulos.SelectSQL.Text := ('SELECT * FROM VER_ART_TARIFAS_PRECIOS WHERE' +
        ' TARIFA=?tarifa AND familia<>''' + REntorno.FamSistema +
        '''' + ' AND empresa=' + REntorno.EmpresaStr +
        ' ORDER BY ARTICULO');
     QMArticulos.Params.ByName['TARIFA'].AsString := tarifa;

     QMArticulos.Open;
  end;
end;

procedure TProDMArticulosAlmacenes.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetStocksARTICULO.AsString;
  Almacen := QMDetStocksALMACEN.AsString;
end;

end.
