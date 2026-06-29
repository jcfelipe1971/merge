unit UDMHistoricoPrecios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMHistoricoPrecios = class(TDataModule)
     TLocal: THYTransaction;
     QMHistPrecios: TFIBTableSet;
     DSQMHistPrecios: TDataSource;
     QMHistPreciosEMPRESA: TIntegerField;
     QMHistPreciosCANAL: TIntegerField;
     QMHistPreciosALMACEN: TFIBStringField;
     QMHistPreciosARTICULO: TFIBStringField;
     QMHistPreciosENTRADAS: TFloatField;
     QMHistPreciosSALIDAS: TFloatField;
     QMHistPreciosENTRADAS_EXT: TFloatField;
     QMHistPreciosSALIDAS_EXT: TFloatField;
     QMHistPreciosVALOR_ENTRADAS: TFloatField;
     QMHistPreciosVALOR_SALIDAS: TFloatField;
     QMHistPreciosSTOCK: TFloatField;
     QMHistPreciosSTOCK_EXT: TFloatField;
     QMHistPreciosP_COSTE: TFloatField;
     QMHistPreciosPMP: TFloatField;
     QMHistPreciosFECHA_P: TDateTimeField;
     QMHistPreciosUNIDADES: TFloatField;
     QMHistPreciosUNIDADES_EXT: TFloatField;
     QMHistPreciosID_MOV_STOCK: TIntegerField;
     QMHistPreciosEMPRESA_O: TIntegerField;
     QMHistPreciosCANAL_O: TIntegerField;
     QMHistPreciosALMACEN_O: TFIBStringField;
     QMHistPreciosN_MOV_STOCK: TIntegerField;
     QMHistPreciosID_A: TIntegerField;
     QMHistPreciosDOC_NUMERO: TIntegerField;
     QMHistPreciosDOC_SERIE: TFIBStringField;
     QMHistPreciosDOC_TIPO: TFIBStringField;
     QMHistPreciosTIPO_OPER: TFIBStringField;
     QMHistPreciosSTOCK_MINIMO: TFloatField;
     QMHistPreciosSTOCK_MAXIMO: TFloatField;
     QMHistPreciosPEDIDOS_A_PRO: TFloatField;
     QMHistPreciosPEDIDOS_D_CLI: TFloatField;
     QMHistPreciosPEDIDOS_A_TMP: TFloatField;
     QMHistPreciosSTOCK_VIRTUAL: TFloatField;
     QMHistPreciosRESERVADAS: TFloatField;
     QMHistPreciosDISPONIBLES: TFloatField;
     QMHistPreciosEN_PROCESO_PROD: TFloatField;
     TUpdate: THYTransaction;
     procedure DMHistoricoPreciosCreate(Sender: TObject);
     procedure QMHistPreciosNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMHistPreciosAfterPost(DataSet: TDataSet);
     procedure QMHistPreciosBeforeEdit(DataSet: TDataSet);
  private
     { Private declarations }
     Articulo, Almacen: string;
  public
     { Public declarations }
     procedure Refrescar(const aAlmacen, aArticulo: string);
  end;

var
  DMHistoricoPrecios : TDMHistoricoPrecios;

implementation

{$R *.DFM}

uses UEntorno, UDMMain;

procedure TDMHistoricoPrecios.DMHistoricoPreciosCreate(Sender: TObject);
var
  LocalMascaraL : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Aplicar máscaras
  QMHistPreciosUNIDADES.DisplayFormat := MascaraI;
  QMHistPreciosStock.DisplayFormat := MascaraI;

  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
  QMHistPreciosPMP.DisplayFormat := LocalMascaraL;
  QMHistPreciosP_COSTE.DisplayFormat := LocalMascaraL;
end;

procedure TDMHistoricoPrecios.QMHistPreciosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

// Refrescar el Histórico de Precios
procedure TDMHistoricoPrecios.Refrescar(const aAlmacen, aArticulo: string);
begin
  Almacen := aAlmacen; // Almacenar la variable para el Refresco
  Articulo := aArticulo; // Almacenar la variable para el Refresco

  QMHistPrecios.Close;
  if (Almacen <> '') and (Articulo <> '') then
  begin
     with QMHistPrecios do
     begin
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Open;
     end;
  end;
end;

procedure TDMHistoricoPrecios.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMHistoricoPrecios.QMHistPreciosAfterPost(DataSet: TDataSet);
var
  Puntero : TBookmark;
begin
  Graba(DataSet);
  Puntero := QMHistPrecios.GetBookmark;
  try
     Refrescar(Almacen, Articulo);
     QMHistPrecios.GotoBookmark(Puntero);
  finally
     QMHistPrecios.FreeBookmark(Puntero);
  end;
end;

procedure TDMHistoricoPrecios.QMHistPreciosBeforeEdit(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
