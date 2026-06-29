unit ZUDMArticulos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, Controls, FIBQuery, HYFIBQuery, Forms;

type
  TZDMArticulos = class(TDataModule)
     TLocal: THYTransaction;
     QMArticulos: TFIBTableSet;
     DSQMArticulos: TDataSource;
     QMDetStocks: TFIBTableSet;
     DSQMDetStocks: TDataSource;
     QMArticulosEMPRESA: TIntegerField;
     QMArticulosEJERCICIO: TIntegerField;
     QMArticulosCANAL: TIntegerField;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosTITULO: TFIBStringField;
     QMArticulosFAMILIA: TFIBStringField;
     QMArticulosTIPO_IVA: TIntegerField;
     QMArticulosTIPO_ARTICULO_TYC: TFIBStringField;
     QMArticulosPRECIO_VENTA: TFloatField;
     QMDetStocksALMACEN: TFIBStringField;
     QMDetStocksSALIDAS: TFloatField;
     QMDetStocksENTRADAS_EXT: TFloatField;
     QMDetStocksSALIDAS_EXT: TFloatField;
     QMDetStocksVALOR_ENTRADAS: TFloatField;
     QMDetStocksVALOR_SALIDAS: TFloatField;
     QMDetStocksSTOCK: TFloatField;
     QMDetStocksSTOCK_EXT: TFloatField;
     QMDetStocksSTOCK_MINIMO: TFloatField;
     QMDetStocksSTOCK_MAXIMO: TFloatField;
     QMDetStocksPEDIDOS_A_PRO: TFloatField;
     QMDetStocksPEDIDOS_D_CLI: TFloatField;
     QMDetStocksPEDIDOS_A_TMP: TFloatField;
     QMDetStocksSTOCK_VIRTUAL: TFloatField;
     QMDetStocksRESERVADAS: TFloatField;
     QMDetStocksDISPONIBLES: TFloatField;
     QMDetStocksEN_PROCESO_PROD: TFloatField;
     QMArticulosStockAlm: TFloatField;
     QMDetStocksPARA_SERVIR: TFloatField;
     QMDetStocksDISPONIBLE: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArticulosAfterOpen(DataSet: TDataSet);
     procedure QMArticulosAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     procedure InformaStockCabecera;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure AbreDetalle;
  end;

var
  ZDMArticulos : TZDMArticulos;

implementation

uses UDMMain, UEntorno, uFBusca, UFParada;

{$R *.dfm}

procedure TZDMArticulos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMArticulosPRECIO_VENTA.DisplayFormat := MascaraE;
  QMArticulosStockAlm.DisplayFormat := MascaraN;
  QMDetStocksSALIDAS.DisplayFormat := MascaraN;
  QMDetStocksENTRADAS_EXT.DisplayFormat := MascaraN;
  QMDetStocksSALIDAS_EXT.DisplayFormat := MascaraN;
  QMDetStocksVALOR_ENTRADAS.DisplayFormat := MascaraN;
  QMDetStocksVALOR_SALIDAS.DisplayFormat := MascaraN;
  QMDetStocksSTOCK.DisplayFormat := MascaraN;
  QMDetStocksSTOCK_MINIMO.DisplayFormat := MascaraN;
  QMDetStocksSTOCK_MAXIMO.DisplayFormat := MascaraN;
  QMDetStocksPEDIDOS_A_PRO.DisplayFormat := MascaraN;
  QMDetStocksPEDIDOS_D_CLI.DisplayFormat := MascaraN;
  QMDetStocksSTOCK_VIRTUAL.DisplayFormat := MascaraN;
  QMDetStocksDISPONIBLES.DisplayFormat := MascaraN;
  QMDetStocksEN_PROCESO_PROD.DisplayFormat := MascaraN;
  QMDetStocksRESERVADAS.DisplayFormat := MascaraN;
  QMDetStocksEN_PROCESO_PROD.DisplayFormat := MascaraN;
  QMDetStocksPARA_SERVIR.DisplayFormat := MascaraN;
  QMDetStocksDISPONIBLE.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMArticulos, '11100');
end;

procedure TZDMArticulos.AbreDetalle;
begin
  try
     Screen.Cursor := crHourGlass;
     QMDetStocks.Close;
     QMDetStocks.Open;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TZDMArticulos.BusquedaCompleja;
var
  orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMArticulos, '11100', False) <> mrCancel) then
  begin
     if QMArticulos.SelectSQL.Count <> 0 then
        QMArticulos.SelectSQL.Add(' AND FAMILIA <> ''' + REntorno.FamSistema + ''' ');
     QMArticulos.Ordenar(orden);
  end;
  QMArticulos.Open;
end;

procedure TZDMArticulos.QMArticulosAfterOpen(DataSet: TDataSet);
begin
  InformaStockCabecera;
end;

procedure TZDMArticulos.QMArticulosAfterScroll(DataSet: TDataSet);
begin
  InformaStockCabecera;
end;

procedure TZDMArticulos.InformaStockCabecera;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT STOCK FROM A_ART_DAME_STOCK(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL)';
        Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMArticulosCANAL.AsInteger;
        Params.ByName['ALMACEN'].AsString := '000';
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
        Params.ByName['FECHA'].AsString := 'NOW';
        ExecQuery;
        QMArticulosStockAlm.AsFloat := FieldByName['STOCK'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
