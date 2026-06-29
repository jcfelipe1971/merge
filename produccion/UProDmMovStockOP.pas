unit UProDMMovStockOP;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, FIBInfoSet, Dialogs,
  jpeg, GIFImage, Graphics, ExtCtrls, Variants, Math, Controls;

type
  TProDMMovStockOP = class(TDataModule)
     TLocal: THYTransaction;
     QMovStocks: TFIBDataSetRO;
     DSxQMovStocks: TDataSource;
     QMovStocksN_MOV_STOCK: TIntegerField;
     QMovStocksPERIODO: TFIBStringField;
     QMovStocksALMACEN: TFIBStringField;
     QMovStocksARTICULO: TFIBStringField;
     QMovStocksTIPO_OPER: TFIBStringField;
     QMovStocksFECHA: TDateTimeField;
     QMovStocksCOMENTARIO: TFIBStringField;
     QMovStocksUNIDADES: TFloatField;
     QMovStocksPRECIO: TFloatField;
     QMovStocksORIGEN: TFIBStringField;
     QMovStocksIMPORTE: TFloatField;
     QMovStocksACTIVO: TIntegerField;
     QMovStocksUNIDADES_EXT: TFloatField;
     QMovStocksPRECIO_SIN_DTO: TFloatField;
     QMovStocksMOV_VIRTUAL: TIntegerField;
     QMovStocksID_A: TIntegerField;
     QMovStocksID_MOV_STOCKS: TIntegerField;
     QMovStocksDesc_Articulo: TStringField;
     QMovStocksDOC_NUMERO: TIntegerField;
     QMovStocksDOC_SERIE: TFIBStringField;
     xOrden: TFIBDataSetRO;
     DSxOrden: TDataSource;
     xOrdenEMPRESA: TIntegerField;
     xOrdenEJERCICIO: TIntegerField;
     xOrdenSERIES: TFIBStringField;
     xOrdenCANAL: TIntegerField;
     xOrdenRIG_OF: TIntegerField;
     xOrdenCOMPUESTO: TFIBStringField;
     xOrdenID_ORDEN: TIntegerField;
     QGesDetallesSt: TFIBDataSetRO;
     DSGesDetallesSt: TDataSource;
     QGesDetallesStEMPRESA: TIntegerField;
     QGesDetallesStEJERCICIO: TIntegerField;
     QGesDetallesStSERIE: TFIBStringField;
     QGesDetallesStRIG: TIntegerField;
     QGesDetallesStLINEA: TIntegerField;
     QGesDetallesStARTICULO: TFIBStringField;
     QGesDetallesStUNIDADES: TFloatField;
     QGesDetallesStPRECIO: TFloatField;
     QGesDetallesStVALOR: TFloatField;
     QGesDetallesStMOV_STOCK_A: TIntegerField;
     QGesDetallesStMOV_STOCK_B: TIntegerField;
     QGesDetallesStENTRADA: TIntegerField;
     QGesDetallesStUNIDADES_EXT: TFloatField;
     QGesDetallesStTITULO: TFIBStringField;
     QGesDetallesStPRECIO_VENTA: TFloatField;
     QGesDetallesStORDEN_PRODUCCION: TFIBStringField;
     QGesDetallesStID_MOV_STOCKS_A: TIntegerField;
     QGesDetallesStID_MOV_STOCKS_B: TIntegerField;
     QGesDetallesStID_A: TIntegerField;
     QGesDetallesStID_C_A: TIntegerField;
     QGesDetallesStNSERIE: TFIBStringField;
     QGesDetallesStID_DETALLES_ST: TIntegerField;
     QGesDetallesStRECIBIDAS: TFloatField;
     xOrdenID_MOV_STOCK: TIntegerField;
     QGesDetallesStORIGEN: TFIBStringField;
     QGesDetallesStFECHA: TDateTimeField;
     QGesDetallesStALMACEN_ORI: TFIBStringField;
     QGesDetallesStALMACEN_DST: TFIBStringField;
     QGesDetallesStTIPO_OPERACION: TFIBStringField;
     QGesDetallesStID_LOTE: TIntegerField;
     QGesDetallesStLOTE: TFIBStringField;
     QGesDetallesStCANTIDAD: TFloatField;
     QGesDetallesStSUBLINEA: TIntegerField;
     QGesDetallesStF_FABRICACION: TDateTimeField;
     QGesDetallesStF_ENVASADO: TDateTimeField;
     QGesDetallesStF_CADUCIDAD: TDateTimeField;
     QGesDetallesStLOTES: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMovStocksDesc_ArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xOrdenAfterOpen(DataSet: TDataSet);
     procedure xOrdenBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     IdOrden: integer;
  public
     { Public declarations }
     procedure AbreIdOrden(AIdOrden: integer);
     procedure Refrescar;
     procedure MuestraDocumento;
  end;

var
  ProDMMovStockOP : TProDMMovStockOP;

implementation

uses UDMMain, UEntorno, UDameDato, UFMain;

{$R *.dfm}

procedure TProDMMovStockOP.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QGesDetallesStFECHA.DisplayFormat := ShortDateFormat + ' hh:nn:ss';
  QGesDetallesStF_FABRICACION.DisplayFormat := ShortDateFormat;
  QGesDetallesStF_ENVASADO.DisplayFormat := ShortDateFormat;
  QGesDetallesStF_CADUCIDAD.DisplayFormat := ShortDateFormat;
  QGesDetallesStUNIDADES.DisplayFormat := MascaraN;
  QGesDetallesStCANTIDAD.DisplayFormat := MascaraN;
  QGesDetallesStPRECIO.DisplayFormat := MascaraN;
  QGesDetallesStVALOR.DisplayFormat := MascaraN;
  QGesDetallesStPRECIO_VENTA.DisplayFormat := MascaraN;
end;

procedure TProDMMovStockOP.AbreIdOrden(AIdOrden: integer);
begin
  IdOrden := AIdOrden;
  Refrescar;
end;

procedure TProDMMovStockOP.QMovStocksDesc_ArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMovStocksID_A.AsInteger);
end;

procedure TProDMMovStockOP.xOrdenAfterOpen(DataSet: TDataSet);
begin
  QMovStocks.Open;
  QGesDetallesSt.Open;
end;

procedure TProDMMovStockOP.xOrdenBeforeClose(DataSet: TDataSet);
begin
  QMovStocks.Close;
  QGesDetallesSt.Close;
end;

procedure TProDMMovStockOP.Refrescar;
begin
  with xOrden do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;
end;

procedure TProDMMovStockOP.MuestraDocumento;
begin
  FMain.MuestraDocumento(QGesDetallesStEJERCICIO.AsInteger, 'MVE', QGesDetallesStSERIE.AsString, QGesDetallesStRIG.AsInteger);
end;

end.
