unit UDMDocInfoStocks;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMDocInfoStocks = class(TDataModule)
     xArtStocks: TFIBDataSetRO;
     DSxArtStocks: TDataSource;
     TLocal: THYTransaction;
     xArtStocksEMPRESA: TIntegerField;
     xArtStocksCANAL: TIntegerField;
     xArtStocksALMACEN: TFIBStringField;
     xArtStocksTITULO_ALM: TFIBStringField;
     xArtStocksARTICULO: TFIBStringField;
     xArtStocksTITULO_ART: TFIBStringField;
     xArtStocksEXISTENCIAS: TFloatField;
     xArtStocksENTRADAS: TFloatField;
     xArtStocksVALOR_ENTRADAS: TFloatField;
     xArtStocksSALIDAS: TFloatField;
     xArtStocksVALOR_SALIDAS: TFloatField;
     xArtStocksVALOR_EXISTENCIAS: TFloatField;
     xArtStocksP_COSTE: TFloatField;
     xArtStocksPMP: TFloatField;
     xArtStocksSTOCK_MINIMO: TFloatField;
     xArtStocksSTOCK_MAXIMO: TFloatField;
     xArtStocksPEDIDOS_A_PRO: TFloatField;
     xArtStocksPEDIDOS_D_CLI: TFloatField;
     xArtStocksPEDIDOS_A_TMP: TFloatField;
     xArtStocksSTOCK_VIRTUAL: TFloatField;
     xArtStocksRESERVADAS: TFloatField;
     xArtStocksDISPONIBLES: TFloatField;
     xArtStocksFABRICABLES: TFloatField;
     xArtStocksEXISTENCIAS_FABRICABLES: TFloatField;
     xArtStocksEN_PROCESO_PROD: TFloatField;
     xArtStocksID_A: TIntegerField;
     xArtStocksEXISTENCIAS_EXT: TFloatField;
     DSxArtStocks2: TDataSource;
     xArtStocksTOTAL: TFloatField;
     xArtStocks2: TFIBTableSet;
     xArtStocks2EMPRESA: TIntegerField;
     xArtStocks2CANAL: TIntegerField;
     xArtStocks2ALMACEN: TFIBStringField;
     xArtStocks2TITULO_ALM: TFIBStringField;
     xArtStocks2ARTICULO: TFIBStringField;
     xArtStocks2TITULO_ART: TFIBStringField;
     xArtStocks2EXISTENCIAS: TFloatField;
     xArtStocks2EXISTENCIAS_EXT: TFloatField;
     xArtStocks2ENTRADAS: TFloatField;
     xArtStocks2VALOR_ENTRADAS: TFloatField;
     xArtStocks2SALIDAS: TFloatField;
     xArtStocks2VALOR_SALIDAS: TFloatField;
     xArtStocks2VALOR_EXISTENCIAS: TFloatField;
     xArtStocks2P_COSTE: TFloatField;
     xArtStocks2PMP: TFloatField;
     xArtStocks2STOCK_MINIMO: TFloatField;
     xArtStocks2STOCK_MAXIMO: TFloatField;
     xArtStocks2PEDIDOS_A_PRO: TFloatField;
     xArtStocks2PEDIDOS_D_CLI: TFloatField;
     xArtStocks2PEDIDOS_A_TMP: TFloatField;
     xArtStocks2STOCK_VIRTUAL: TFloatField;
     xArtStocks2RESERVADAS: TFloatField;
     xArtStocks2DISPONIBLES: TFloatField;
     xArtStocks2EN_PROCESO_PROD: TFloatField;
     xArtStocks2ID_A: TIntegerField;
     xArtStocks2EXISTENCIAS_REALES: TFloatField;
     QMStockUbicaciones: TFIBDataSetRO;
     DSQMStockUbicaciones: TDataSource;
     QMStockUbicacionesEMPRESA: TIntegerField;
     QMStockUbicacionesCANAL: TIntegerField;
     QMStockUbicacionesALMACEN: TFIBStringField;
     QMStockUbicacionesCALLE: TFIBStringField;
     QMStockUbicacionesESTANTERIA: TFIBStringField;
     QMStockUbicacionesREPISA: TFIBStringField;
     QMStockUbicacionesPOSICION: TFIBStringField;
     QMStockUbicacionesARTICULO: TFIBStringField;
     QMStockUbicacionesTITULO: TFIBStringField;
     QMStockUbicacionesCOMPOSICION: TFIBStringField;
     QMStockUbicacionesTITULO_COMP: TFIBStringField;
     QMStockUbicacionesID_A: TIntegerField;
     QMStockUbicacionesENTRADAS: TFloatField;
     QMStockUbicacionesSALIDAS: TFloatField;
     QMStockUbicacionesEXISTENCIAS: TFloatField;
     QMStockUbicacionesID_STOCKS_UB: TIntegerField;
     QMStockUbicacionesID_A_UBICACION: TIntegerField;
     QMStockUbicacionesID_UBICACION: TIntegerField;
     QMStockUbicacionesGENERAL: TIntegerField;
     QMNroSerieLote: TFIBDataSetRO;
     DSQMNroSerieLote: TDataSource;
     QMNroSerieKRI: TFIBDataSetRO;
     DSQMNroSerieKRI: TDataSource;
     QMNroSerieKRIARTICULO: TFIBStringField;
     QMNroSerieKRIEMPRESA: TIntegerField;
     QMNroSerieKRINRO_SERIE: TFIBStringField;
     QMNroSerieKRIALMACEN_ENT: TFIBStringField;
     QMNroSerieLoteEMPRESA: TIntegerField;
     QMNroSerieLoteCANAL: TIntegerField;
     QMNroSerieLoteARTICULO: TFIBStringField;
     QMNroSerieLoteLOTE: TFIBStringField;
     QMNroSerieLoteSERIE: TFIBStringField;
     QMNroSerieLoteCLASIFICACION: TFIBStringField;
     QMNroSerieLoteF_ENVASADO: TDateTimeField;
     QMNroSerieLoteF_CADUCIDAD: TDateTimeField;
     QMNroSerieLoteF_FABRICACION: TDateTimeField;
     QMNroSerieLoteID_A: TIntegerField;
     QMNroSerieLoteAUTO_REETIQUETADO: TIntegerField;
     QMNroSerieLoteCODIGO: TIntegerField;
     QMNroSerieLotePROVEEDOR: TIntegerField;
     QMNroSerieLoteID_LOTE: TIntegerField;
     QMNroSerieLoteALMACEN: TFIBStringField;
     QMNroSerieLoteSTOCK: TFloatField;
     QMNroSerieLoteID_UBICACION: TIntegerField;
     QMNroSerieLoteID_A_UBICACION: TIntegerField;
     QMNroSerieLoteCALLE: TFIBStringField;
     QMNroSerieLoteESTANTERIA: TFIBStringField;
     QMNroSerieLoteREPISA: TFIBStringField;
     QMNroSerieLotePOSICION: TFIBStringField;
     QMNroSerieLoteTITULO: TFIBStringField;
     QMNroSerieLoteVOLUMEN_MAX: TFloatField;
     QMNroSerieLoteDIAMETRO_MAX: TFloatField;
     QMNroSerieLotePESO_MAX: TFloatField;
     QMNroSerieLoteVOLUMEN_ACC: TFloatField;
     QMNroSerieLotePESO_ACC: TFloatField;
     QMNroSerieLoteDIAMETRO_ACC: TFloatField;
     QMNroSerieLoteCOMPOSICION: TFIBStringField;
     QMNroSerieLoteGENERAL: TIntegerField;
     QMNroSerieLoteUNIDADES_ACC: TFloatField;
     QMNroSerieLoteTIPO: TFIBStringField;
     QMNroSerieLoteSECTOR: TFIBStringField;
     QMNroSerieLoteDISPONIBLE: TIntegerField;
     QMStockFuturo: TFIBDataSetRO;
     DSQMStockFuturo: TDataSource;
     QMStockFuturoARTICULO: TFIBStringField;
     QMStockFuturoFECHA: TDateTimeField;
     QMStockFuturoTIPO: TFIBStringField;
     QMStockFuturoCOD_CLI_PRO: TIntegerField;
     QMStockFuturoNOMBRE: TFIBStringField;
     QMStockFuturoDOCUMENTO: TFIBStringField;
     QMStockFuturoCANTIDAD: TFloatField;
     QMStockFuturoSTOCK: TFloatField;
     QMStockFuturoID_DOC: TIntegerField;
     QMStockFuturoALMACEN: TFIBStringField;
     QMNroSerie: TFIBDataSetRO;
     DSQMNroSerie: TDataSource;
     QMNroSerieEMPRESA: TIntegerField;
     QMNroSerieCANAL: TIntegerField;
     QMNroSerieCODIGO: TIntegerField;
     QMNroSerieNSERIE: TFIBStringField;
     QMNroSerieARTICULO: TFIBStringField;
     QMNroSerieALMACEN: TFIBStringField;
     QMNroSerieFECHA_CADUCIDAD: TDateTimeField;
     QMNroSerieFECHA_GARANTIA_CLIENTE: TDateTimeField;
     QMNroSerieFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     QMNroSerieCLIENTE_REPARACION: TIntegerField;
     QMMovStock: TFIBDataSetRO;
     DSQMMovStock: TDataSource;
     QMMovStockEMPRESA: TIntegerField;
     QMMovStockCANAL: TIntegerField;
     QMMovStockALMACEN: TFIBStringField;
     QMMovStockARTICULO: TFIBStringField;
     QMMovStockLOTE: TFIBStringField;
     QMMovStockENTRADAS: TFloatField;
     QMMovStockSALIDAS: TFloatField;
     QMMovStockSTOCK: TFloatField;
     QMMovStockFECHA: TDateTimeField;
     QMMovStockDOC_NUMERO: TIntegerField;
     QMMovStockDOC_SERIE: TFIBStringField;
     QMMovStockDOC_TIPO: TFIBStringField;
     QMMovStockTIPO_OPER: TFIBStringField;
     QMMovStockID_DOC: TIntegerField;
     QMMovStockID_LOTE: TIntegerField;
     QMMovStockID_MOV_STOCK: TIntegerField;
     QMMovStockCOD_CLI_PRO: TIntegerField;
     QMMovStockTITULO_CLI_PRO: TFIBStringField;
     QMMovStockREF_PEDIDO: TFIBStringField;
     QMMovStockID_DOC_PEDIDO: TIntegerField;
     QMStockFuturoSU_REFERENCIA: TFIBStringField;
     QMMovStockPRECIO: TFloatField;
     QMMovStockPRECIO_SIN_DTO: TFloatField;
     QMMovStockCOMENTARIO: TFIBStringField;
     xTarifa: TFIBTableSet;
     DSxTarifa: TDataSource;
     xTarifaEMPRESA: TIntegerField;
     xTarifaTARIFA: TFIBStringField;
     xTarifaARTICULO: TFIBStringField;
     xTarifaLINEA: TIntegerField;
     xTarifaCALCULO: TIntegerField;
     xTarifaUNID_MINIMAS: TFloatField;
     xTarifaUNID_MAXIMAS: TFloatField;
     xTarifaPRECIO_BASE: TFloatField;
     xTarifaPRECIO_VENTA: TFloatField;
     xTarifaMARGEN_PC: TFloatField;
     xTarifaMARGEN_PV: TFloatField;
     xTarifaCOMISION: TFloatField;
     xTarifaBLOQUEADO: TIntegerField;
     xTarifaMARGEN: TFloatField;
     xTarifaID_A: TIntegerField;
     xTarifaULT_MODIFICACION: TDateTimeField;
     xTarifaDESCUENTO_COMPRA: TFloatField;
     xTarifaPRECIO_COMPRA: TFloatField;
     xTarifaPRECIO_COSTE: TFloatField;
     QMMovStockPMP: TFloatField;
     xArtStocksPREPARADAS: TFloatField;
     QMStockFuturoID_DETALLE_DOC: TIntegerField;
     QMStockFuturoFECHA_ENTREGA_PREV: TDateTimeField;
     QMStockFuturoFECHA_ENTREGA_PREV_DET: TDateTimeField;
     QMStockFuturoFECHA_CONF: TDateTimeField;
     QMStockFuturoFECHA_CONF_DET: TDateTimeField;
     xArtStocksSTOCK_REAL: TFloatField;
     xTarifaTITULO: TFIBStringField;
     xTarifaACTIVA: TIntegerField;
     xTarifaMONEDA: TFIBStringField;
     xArtStocks2TIPO_U_LOGISTICA: TFIBStringField;
     xArtStocks2UNIDADES_LOGISTICAS: TFloatField;
     xArtStocks2EXISTENCIAS_U_LOGISTICAS: TFloatField;
     QMMovStockDTE: TStringField;
     TUpdate: THYTransaction;
     TRW: THYTransaction;
     procedure DMDocInfoStocksCreate(Sender: TObject);
     procedure xArtStocksTOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMMovStockTIPO_OPERGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMovStockDTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     Empresa: smallint;
     Canal: smallint;
     Articulo: string;
     Almacen: string;
     CalcularPMPMovimientos: boolean;
     SepararAlmacenes: boolean;
     TotalCalculado: boolean;
     ExistenciasTotales: double;
     MascaraUnidades: string;
     Param_INFOSTK002: boolean;
     function DameTotal: double;
  public
     { Public declarations }
     PMP: double;
     procedure MuestraInfo(aEmpresa: smallint; aCanal: smallint; aArticulo: string; aAlmacen: string; aCalcularPMPMovimientos: boolean; aSepararAlmacenes: boolean);
     function DameImagenArticulo(Empresa: integer; Articulo: string): integer;
  end;

var
  DMDocInfoStocks : TDMDocInfoStocks;

implementation

uses UDMMain, UEntorno, UUtiles, UParam, UDameDato;

{$R *.DFM}

procedure TDMDocInfoStocks.DMDocInfoStocksCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Param_INFOSTK002 := (LeeParametro('INFOSTK002') = 'S');

  // Ponemos las máscaras
  xArtStocksVALOR_ENTRADAS.DisplayFormat := MascaraE;
  xArtStocksVALOR_SALIDAS.DisplayFormat := MascaraE;
  xArtStocksVALOR_EXISTENCIAS.DisplayFormat := MascaraE;
  xArtStocksPMP.DisplayFormat := MascaraE;
  QMNroSerieLoteF_ENVASADO.DisplayFormat := ShortDateFormat;
  QMNroSerieLoteF_CADUCIDAD.DisplayFormat := ShortDateFormat;
  QMNroSerieLoteF_FABRICACION.DisplayFormat := ShortDateFormat;
  QMNroSerieFECHA_CADUCIDAD.DisplayFormat := ShortDateFormat;
  QMNroSerieFECHA_GARANTIA_CLIENTE.DisplayFormat := ShortDateFormat;
  QMNroSerieFECHA_GARANTIA_PROVEEDOR.DisplayFormat := ShortDateFormat;

  QMMovStockPRECIO.DisplayFormat := MascaraL;
  QMMovStockPRECIO_SIN_DTO.DisplayFormat := MascaraL;
  QMMovStockPMP.DisplayFormat := MascaraL;

  xTarifaPRECIO_BASE.DisplayFormat := MascaraL;
  xTarifaPRECIO_VENTA.DisplayFormat := MascaraL;
  xTarifaPRECIO_COMPRA.DisplayFormat := MascaraL;
  xTarifaDESCUENTO_COMPRA.DisplayFormat := MascaraP;
  xTarifaPRECIO_COSTE.DisplayFormat := MascaraL;
  xTarifaMARGEN.DisplayFormat := MascaraP;
  xTarifaMARGEN_PC.DisplayFormat := MascaraP;
  xTarifaMARGEN_PV.DisplayFormat := MascaraP;
  xTarifaCOMISION.DisplayFormat := MascaraP;

  TotalCalculado := False;
end;

procedure TDMDocInfoStocks.MuestraInfo(aEmpresa: smallint; aCanal: smallint; aArticulo: string; aAlmacen: string; aCalcularPMPMovimientos: boolean; aSepararAlmacenes: boolean);
var
  dummy : double;
begin
  Empresa := aEmpresa;
  Canal := aCanal;
  Articulo := aArticulo;
  Almacen := aAlmacen;
  CalcularPMPMovimientos := aCalcularPMPMovimientos;
  SepararAlmacenes := aSepararAlmacenes;

  // Establezco el formato de unidades segun la unidade de medida del articulo
  MascaraUnidades := DMMain.DameMascaraUnidades(Articulo);
  xArtStocksENTRADAS.DisplayFormat := MascaraUnidades;
  xArtStocksSALIDAS.DisplayFormat := MascaraUnidades;
  xArtStocksEXISTENCIAS.DisplayFormat := MascaraUnidades;
  xArtStocksTOTAL.DisplayFormat := MascaraUnidades;
  xArtStocksSTOCK_MINIMO.DisplayFormat := MascaraUnidades;
  xArtStocksSTOCK_MAXIMO.DisplayFormat := MascaraUnidades;
  xArtStocksSTOCK_VIRTUAL.DisplayFormat := MascaraUnidades;
  xArtStocksSTOCK_REAL.DisplayFormat := MascaraUnidades;
  xArtStocksPEDIDOS_A_PRO.DisplayFormat := MascaraUnidades;
  xArtStocksPEDIDOS_D_CLI.DisplayFormat := MascaraUnidades;
  xArtStocksRESERVADAS.DisplayFormat := MascaraUnidades;
  xArtStocksDISPONIBLES.DisplayFormat := MascaraUnidades;
  xArtStocksEXISTENCIAS_EXT.DisplayFormat := MascaraUnidades;
  xArtStocksEN_PROCESO_PROD.DisplayFormat := MascaraUnidades;
  xArtStocks2EXISTENCIAS.DisplayFormat := MascaraUnidades;
  xArtStocks2EXISTENCIAS_REALES.DisplayFormat := MascaraUnidades;
  QMStockUbicacionesENTRADAS.DisplayFormat := MascaraUnidades;
  QMStockUbicacionesSALIDAS.DisplayFormat := MascaraUnidades;
  QMStockUbicacionesEXISTENCIAS.DisplayFormat := MascaraUnidades;
  QMNroSerieLoteSTOCK.DisplayFormat := MascaraUnidades;
  QMStockFuturoCANTIDAD.DisplayFormat := MascaraUnidades;
  QMStockFuturoSTOCK.DisplayFormat := MascaraUnidades;
  QMMovStockENTRADAS.DisplayFormat := MascaraUnidades;
  QMMovStockSALIDAS.DisplayFormat := MascaraUnidades;
  QMMovStockSTOCK.DisplayFormat := MascaraUnidades;

  // Esto fuerza el recalculo de stock en una transacción RW para poder utilizar luego en siguientes SQLs con transaccion RO.
  dummy := DMMain.DameStockArticuloFecha(Empresa, Canal, Articulo, Almacen, EncodeDate(3000, 12, 31));

  with xArtStocks2 do
  begin
     DisableControls;
     try
        if ((Articulo <> xArtStocks2ARTICULO.AsString) or (Canal <> xArtStocks2CANAL.AsInteger) or (Almacen <> xArtStocks2ALMACEN.AsString)) then
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           if Param_INFOSTK002 then
              Params.ByName['CANAL'].AsInteger := Canal
           else
              Params.ByName['CANAL'].AsInteger := 0;
           Open;
        end;

        Posicionar(xArtStocks2, 'ALMACEN', Almacen);
     finally
        EnableControls;
     end;
  end;

  with xArtStocks do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Open;
  end;

  PMP := DMMain.DamePMPArticulo(Articulo, Almacen);

  with QMStockUbicaciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Open;
  end;

  with QMNroSerieLote do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Open;
  end;

  with QMNroSerie do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     {Params.ByName['ALMACEN'].AsString  := Almacen; dji lrk kri - Deberia filtrar ? }
     Open;
  end;

  with QMNroSerieKRI do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     {Params.ByName['ALMACEN'].AsString  := Almacen; dji lrk kri - Deberia filtrar ? }
     Open;
  end;

  with xTarifa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;

  // Los siguientes datasets (QMStockFuturo y QMMovStock) necesita una transaccion RW.
  // Limpio la transacción antes de empezar (Commit).
  // Abro la transacción y hago CommitRetaining al final de la obtencion de datos
  if TRW.InTransaction then
     TRW.Commit;
  TRW.StartTransaction;

  with QMStockFuturo do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := DameIDArticulo(Articulo);
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if SepararAlmacenes then
        Params.ByName['ALMACEN'].AsString := Almacen
     else
        Params.ByName['ALMACEN'].AsString := '   ';
     Open;
     FetchAll;
  end;

  with QMMovStock do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['CALCULAR_PMP'].AsInteger := BoolToInt(CalcularPMPMovimientos);
     Open;
     FetchAll;
  end;
  TRW.CommitRetaining;
end;

function TDMDocInfoStocks.DameTotal: double;
begin
  if (not TotalCalculado) then
  begin
     ExistenciasTotales := 0;
     with xArtStocks2 do
     begin
        First;
        while not EOF do
        begin
           ExistenciasTotales := ExistenciasTotales + xArtStocks2EXISTENCIAS_REALES.AsFloat;
           Next;
        end;
        First; {dji lrk kri - para cuando hay muchos almacenes}
     end;
     TotalCalculado := True;
  end;

  Result := ExistenciasTotales;
end;

procedure TDMDocInfoStocks.xArtStocksTOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraUnidades, DameTotal);
end;

procedure TDMDocInfoStocks.DataModuleDestroy(Sender: TObject);
begin
  if (TRW.InTransaction) then
     TRW.Commit;
end;

procedure TDMDocInfoStocks.QMMovStockTIPO_OPERGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMMovStockTIPO_OPER.AsString = 'O') then
     Text := 'S [O]'
  else
  if (QMMovStockTIPO_OPER.AsString = 'D') then
     Text := 'E [D]'
  else
     Text := QMMovStockTIPO_OPER.AsString;
end;

function TDMDocInfoStocks.DameImagenArticulo(Empresa: integer; Articulo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT IMAGEN FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := FieldByName['IMAGEN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDocInfoStocks.QMMovStockDTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  TipoDoc : string;
begin
  TipoDoc := QMMovStockDOC_TIPO.AsString;
  if ((REntorno.Pais = 'CHL') and ((TipoDoc = 'ALB') or (TipoDoc = 'FAC') or (TipoDoc = 'FAP'))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TIPO_DOC_TRIBUTARIO||''-''||FOLIO as DTE ');
           if (TipoDoc = 'FAC') then
              SQL.Add(' FROM GES_CABECERAS_S_FAC ')
           else if (TipoDoc = 'ALB') then
              SQL.Add(' FROM GES_CABECERAS_S_ALB ')
           else if (TipoDoc = 'FAP') then
              SQL.Add(' FROM GES_CABECERAS_E_FAC ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIG = :RIG ');
           Params.ByName['EMPRESA'].AsInteger := QMMovStockEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := QMMovStockCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMMovStockDOC_SERIE.AsString;
           Params.ByName['TIPO'].AsString := TipoDoc;
           Params.ByName['RIG'].AsInteger := QMMovStockDOC_NUMERO.AsInteger;
           ExecQuery;
           Text := FieldByName['DTE'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     Text := '0';
end;

end.
