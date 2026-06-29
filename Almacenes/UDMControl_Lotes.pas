unit UDMControl_Lotes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, Controls, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TDMControl_Lotes = class(TDataModule)
     QMArticulos_Lotes: TFIBTableSet;
     DSQMArticulos_Lotes: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMDetCompras: TDataSource;
     DSQMDetVentas: TDataSource;
     DSQMMovMan: TDataSource;
     QMDetCompras: TFIBDataSetRO;
     QMDetVentas: TFIBDataSetRO;
     QMDetMovMan: TFIBDataSetRO;
     QMDetComprasEMPRESA: TIntegerField;
     QMDetComprasEJERCICIO: TIntegerField;
     QMDetComprasCANAL: TIntegerField;
     QMDetComprasSERIE: TFIBStringField;
     QMDetComprasTIPO: TFIBStringField;
     QMDetComprasRIG: TIntegerField;
     QMDetComprasLINEA: TIntegerField;
     QMDetComprasLOTE: TFIBStringField;
     QMDetComprasN_SERIE: TFIBStringField;
     QMDetComprasCLASIFICACION: TFIBStringField;
     QMDetComprasF_FABRICACION: TDateTimeField;
     QMDetComprasF_ENVASADO: TDateTimeField;
     QMDetComprasF_CADUCIDAD: TDateTimeField;
     QMDetComprasCANTIDAD: TFloatField;
     QMDetComprasARTICULO: TFIBStringField;
     QMDetComprasALMACEN: TFIBStringField;
     QMDetComprasID_DETALLES_E: TIntegerField;
     QMDetComprasID_A: TIntegerField;
     QMDetComprasPROVEEDOR: TIntegerField;
     QMDetComprasID_LOTE: TIntegerField;
     QMDetComprasLOTE_ANTERIOR: TFIBStringField;
     QMDetComprasID_REETIQUETADO: TIntegerField;
     QMDetVentasEMPRESA: TIntegerField;
     QMDetVentasEJERCICIO: TIntegerField;
     QMDetVentasCANAL: TIntegerField;
     QMDetVentasSERIE: TFIBStringField;
     QMDetVentasTIPO: TFIBStringField;
     QMDetVentasRIG: TIntegerField;
     QMDetVentasLINEA: TIntegerField;
     QMDetVentasLOTE: TFIBStringField;
     QMDetVentasN_SERIE: TFIBStringField;
     QMDetVentasCLASIFICACION: TFIBStringField;
     QMDetVentasF_FABRICACION: TDateTimeField;
     QMDetVentasF_ENVASADO: TDateTimeField;
     QMDetVentasF_CADUCIDAD: TDateTimeField;
     QMDetVentasCANTIDAD: TFloatField;
     QMDetVentasARTICULO: TFIBStringField;
     QMDetVentasALMACEN: TFIBStringField;
     QMDetVentasID_DETALLES_S: TIntegerField;
     QMDetVentasID_A: TIntegerField;
     QMDetVentasPROVEEDOR: TIntegerField;
     QMDetVentasID_LOTE: TIntegerField;
     QMDetMovManEMPRESA: TIntegerField;
     QMDetMovManEJERCICIO: TIntegerField;
     QMDetMovManSERIE: TFIBStringField;
     QMDetMovManRIG: TIntegerField;
     QMDetMovManLINEA: TIntegerField;
     QMDetMovManLOTE: TFIBStringField;
     QMDetMovManN_SERIE: TFIBStringField;
     QMDetMovManCLASIFICACION: TFIBStringField;
     QMDetMovManF_FABRICACION: TDateTimeField;
     QMDetMovManF_ENVASADO: TDateTimeField;
     QMDetMovManF_CADUCIDAD: TDateTimeField;
     QMDetMovManCANTIDAD: TFloatField;
     QMDetMovManARTICULO: TFIBStringField;
     QMDetMovManALMACEN_ORI: TFIBStringField;
     QMDetMovManALMACEN_DST: TFIBStringField;
     QMDetMovManCANAL_ORI: TIntegerField;
     QMDetMovManCANAL_DST: TIntegerField;
     QMDetMovManID_A: TIntegerField;
     QMDetMovManPROVEEDOR: TIntegerField;
     QMDetMovManID_LOTE: TIntegerField;
     QMDetMovManLOTE_ANTERIOR: TFIBStringField;
     QMDetMovManID_REETIQUETADO: TIntegerField;
     QMDetMovManID_DETALLES_ST: TIntegerField;
     QMDetMovManEMPRESA1: TIntegerField;
     QMDetMovManSERIE1: TFIBStringField;
     QMDetMovManEJERCICIO1: TIntegerField;
     QMDetMovManRIG1: TIntegerField;
     QMDetMovManTIPO_OPERACION: TFIBStringField;
     QMDetMovManFECHA: TDateTimeField;
     QMDetMovManALMACEN_ORI1: TFIBStringField;
     QMDetMovManCANAL_ORI1: TIntegerField;
     QMDetMovManALMACEN_DST1: TFIBStringField;
     QMDetMovManCANAL_DST1: TIntegerField;
     QMDetMovManCOMENTARIO: TFIBStringField;
     QMDetMovManTIPO_VALORACION: TIntegerField;
     QMDetMovManENTRADA: TIntegerField;
     QMDetMovManID_REG: TIntegerField;
     QMDetMovManESTADO: TIntegerField;
     QMDetMovManDEPOSITO: TIntegerField;
     QMDetMovManDEFINITIVO: TIntegerField;
     DSQMSof_ArticulosLotes: TDataSource;
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
     DSxArtStocks2: TDataSource;
     QMProduccion: TFIBDataSetRO;
     DSProduccion: TDataSource;
     QMProduccionEMPRESA: TIntegerField;
     QMProduccionEJERCICIO: TIntegerField;
     QMProduccionCANAL: TIntegerField;
     QMProduccionTIPO: TFIBStringField;
     QMProduccionNORDEN: TIntegerField;
     QMProduccionLOTE: TFIBStringField;
     QMProduccionN_SERIE: TFIBStringField;
     QMProduccionCLASIFICACION: TFIBStringField;
     QMProduccionF_FABRICACION: TDateTimeField;
     QMProduccionF_ENVASADO: TDateTimeField;
     QMProduccionF_CADUCIDAD: TDateTimeField;
     QMProduccionCANTIDAD: TFloatField;
     QMProduccionARTICULO: TFIBStringField;
     QMProduccionALMACEN: TFIBStringField;
     QMProduccionLINEA: TIntegerField;
     QMProduccionID_DETALLES_S: TIntegerField;
     QMProduccionESTADO_LOTE: TIntegerField;
     QMProduccionID_A: TIntegerField;
     QMProduccionSERIE: TFIBStringField;
     QMProduccionPROVEEDOR: TIntegerField;
     QMProduccionID_LOTE: TIntegerField;
     QMProduccionID_ORDEN: TIntegerField;
     QMProSinAsignar: TFIBDataSetRO;
     DSQMProSinAsignar: TDataSource;
     QMComSinAsignar: TFIBDataSetRO;
     DSQMComSinAsignar: TDataSource;
     QMVentSinAsignar: TFIBDataSetRO;
     DSQMVentSinAsignar: TDataSource;
     DSQMProCompSinAsignar: TDataSource;
     QMProCompSinAsignar: TFIBDataSetRO;
     QMComSinAsignarEMPRESA: TIntegerField;
     QMComSinAsignarEJERCICIO: TIntegerField;
     QMComSinAsignarCANAL: TIntegerField;
     QMComSinAsignarSERIE: TFIBStringField;
     QMComSinAsignarTIPO: TFIBStringField;
     QMComSinAsignarRIG: TIntegerField;
     QMComSinAsignarLINEA: TIntegerField;
     QMComSinAsignarALMACEN: TFIBStringField;
     QMComSinAsignarARTICULO: TFIBStringField;
     QMComSinAsignarTITULO: TFIBStringField;
     QMComSinAsignarUNIDADES: TFloatField;
     QMVentSinAsignarEMPRESA: TIntegerField;
     QMVentSinAsignarEJERCICIO: TIntegerField;
     QMVentSinAsignarCANAL: TIntegerField;
     QMVentSinAsignarSERIE: TFIBStringField;
     QMVentSinAsignarTIPO: TFIBStringField;
     QMVentSinAsignarRIG: TIntegerField;
     QMVentSinAsignarLINEA: TIntegerField;
     QMVentSinAsignarALMACEN: TFIBStringField;
     QMVentSinAsignarARTICULO: TFIBStringField;
     QMVentSinAsignarTITULO: TFIBStringField;
     QMVentSinAsignarUNIDADES: TFloatField;
     QMVentSinAsignarPRECIO: TFloatField;
     QMProSinAsignarEMPRESA: TIntegerField;
     QMProSinAsignarEJERCICIO: TIntegerField;
     QMProSinAsignarCANAL: TIntegerField;
     QMProSinAsignarSERIES: TFIBStringField;
     QMProSinAsignarRIG_OF: TIntegerField;
     QMProSinAsignarLINEA_MAT: TIntegerField;
     QMProSinAsignarALMACEN: TFIBStringField;
     QMProSinAsignarCOMPONENTE: TFIBStringField;
     QMProSinAsignarORDEN: TIntegerField;
     QMProSinAsignarLINEA_FASE: TIntegerField;
     QMProSinAsignarID_ORDEN: TIntegerField;
     QMProSinAsignarESTADO: TIntegerField;
     QMProCompSinAsignarEMPRESA: TIntegerField;
     QMProCompSinAsignarEJERCICIO: TIntegerField;
     QMProCompSinAsignarCANAL: TIntegerField;
     QMProCompSinAsignarSERIES: TFIBStringField;
     QMProCompSinAsignarRIG_OF: TIntegerField;
     QMProCompSinAsignarSUBORDEN: TIntegerField;
     QMProCompSinAsignarALMACEN_SAL: TFIBStringField;
     QMProCompSinAsignarALMACEN_LAN: TFIBStringField;
     QMProCompSinAsignarALMACEN_ENT: TFIBStringField;
     QMProCompSinAsignarFECHA_ORD: TDateTimeField;
     QMProCompSinAsignarCLIENTE: TIntegerField;
     QMProCompSinAsignarCOMPUESTO: TFIBStringField;
     QMProCompSinAsignarESCANDALLO: TIntegerField;
     QMProCompSinAsignarESTADO: TIntegerField;
     QMProCompSinAsignarPEDIDO: TIntegerField;
     QMProCompSinAsignarLINEA_PED: TIntegerField;
     QMProCompSinAsignarFECHA_PED: TDateTimeField;
     QMProCompSinAsignarUNI_PEDID: TFloatField;
     QMProCompSinAsignarUNI_MANUAL: TFloatField;
     QMProCompSinAsignarUNI_TOTAL: TFloatField;
     QMProCompSinAsignarUNI_PRODUC: TFloatField;
     QMProCompSinAsignarUNI_PENDIENTES: TFloatField;
     QMProCompSinAsignarID_ORDEN: TIntegerField;
     QMProCompSinAsignarTIPO_LANZAMIENTO: TIntegerField;
     QMProCompSinAsignarID_ORDEN_MAT: TIntegerField;
     QMProCompSinAsignarID_A: TIntegerField;
     QMProCompSinAsignarARTICULO: TFIBStringField;
     QMProCompSinAsignarTITULO: TFIBStringField;
     QMProCompSinAsignarUNIDADES: TFIBStringField;
     xArtStocks2EXISTENCIAS_REALES: TFloatField;
     QMSofArticulos_Lotes: TFIBDataSetRO;
     QMSofArticulos_LotesLOTE: TFIBStringField;
     QMSofArticulos_LotesPROVEEDOR: TIntegerField;
     QMSofArticulos_LotesSTOCK: TFloatField;
     QMSofArticulos_LotesALMACEN: TFIBStringField;
     DSQMDetMovUbi: TDataSource;
     QMDetMovUbi: TFIBDataSetRO;
     QMDetMovUbiENTRADA: TIntegerField;
     QMDetMovUbiEMPRESA: TIntegerField;
     QMDetMovUbiEJERCICIO: TIntegerField;
     QMDetMovUbiCANAL: TIntegerField;
     QMDetMovUbiN_MOV_UBICACION: TIntegerField;
     QMDetMovUbiO_ID_UBICACION: TIntegerField;
     QMDetMovUbiD_ID_UBICACION: TIntegerField;
     QMDetMovUbiID_A: TIntegerField;
     QMDetMovUbiO_ID_A_UBICACION: TIntegerField;
     QMDetMovUbiD_ID_A_UBICACION: TIntegerField;
     QMDetMovUbiFECHA: TDateTimeField;
     QMDetMovUbiUNIDADES: TFloatField;
     QMDetMovUbiID_MOV_STOCKS_UB: TIntegerField;
     QMDetMovUbiID_LOTE: TIntegerField;
     QMDetMovUbiO_COMPOSICION: TStringField;
     QMDetMovUbiD_COMPOSICION: TStringField;
     QMDetMovManSOF_MOVIMIENTO: TFIBStringField;
     QMDetMovManID_A_UBICACION_E: TIntegerField;
     QMDetMovManID_A_UBICACION_S: TIntegerField;
     QMDetMovManORIGEN: TFIBStringField;
     QMDetMovManID_ORIGEN: TIntegerField;
     QMSofArticulos_LotesMEDIDA1: TFloatField;
     QMSofArticulos_LotesMEDIDA2: TFloatField;
     QMSofArticulos_LotesMEDIDA3: TFloatField;
     QMSofArticulos_LotesMEDIDA4: TFloatField;
     QMSofArticulos_LotesUNI_EN_FAB: TFloatField;
     QMProSinAsignarUNIDADES_STOCK: TFloatField;
     QMComposicionCompuesto: TFIBDataSetRO;
     DSComposicionCompuesto: TDataSource;
     QMComposicionCompuestoCOMPONENTE: TFIBStringField;
     QMComposicionCompuestoTITULO_COMPONENTE: TFIBStringField;
     QMComposicionCompuestoCOMPOSICION: TFIBStringField;
     QMOrdenesProduccion: TFIBDataSetRO;
     DSOrdenesProduccion: TDataSource;
     QMOrdenesProduccionESCANDALLO: TIntegerField;
     QMOrdenesProduccionID_ORDEN: TIntegerField;
     QMVentSinAsignarID_S: TIntegerField;
     QMComSinAsignarID_E: TIntegerField;
     QMMovimientosStock: TFIBTableSet;
     DSQMMovimientosStock: TDataSource;
     QMMovimientosStockEMPRESA: TIntegerField;
     QMMovimientosStockCANAL: TIntegerField;
     QMMovimientosStockALMACEN: TFIBStringField;
     QMMovimientosStockARTICULO: TFIBStringField;
     QMMovimientosStockLOTE: TFIBStringField;
     QMMovimientosStockENTRADAS: TFloatField;
     QMMovimientosStockSALIDAS: TFloatField;
     QMMovimientosStockFECHA: TDateTimeField;
     QMMovimientosStockDOC_NUMERO: TIntegerField;
     QMMovimientosStockDOC_SERIE: TFIBStringField;
     QMMovimientosStockDOC_TIPO: TFIBStringField;
     QMMovimientosStockTIPO_OPER: TFIBStringField;
     QMMovimientosStockID_DOC: TIntegerField;
     QMMovimientosStockID_LOTE: TIntegerField;
     QMMovimientosStockID_MOV_STOCK: TIntegerField;
     QMMovimientosStockCOD_CLI_PRO: TIntegerField;
     QMMovimientosStockTITULO_CLI_PRO: TFIBStringField;
     QMMovimientosStockREF_PEDIDO: TFIBStringField;
     QMMovimientosStockID_DOC_PEDIDO: TIntegerField;
     QMMovimientosStockPRECIO: TFloatField;
     QMMovimientosStockPRECIO_SIN_DTO: TFloatField;
     QMMovimientosStockCOMENTARIO: TFIBStringField;
     QMMovimientosStockTITULO_ARTICULO: TFIBStringField;
     QMMovimientosStockFAMILIA: TFIBStringField;
     QMDetVentasID_A_UBICACION: TIntegerField;
     QMDetVentasSUBLINEA: TIntegerField;
     QMDetVentasCLIENTE: TIntegerField;
     QMDetVentasNOMBRE_R_SOCIAL: TFIBStringField;
     QMDetComprasID_A_UBICACION: TIntegerField;
     QMDetComprasSUBLINEA: TIntegerField;
     QMDetComprasNOMBRE_R_SOCIAL: TFIBStringField;
     QMArticulos_LotesEMPRESA: TIntegerField;
     QMArticulos_LotesCANAL: TIntegerField;
     QMArticulos_LotesALMACEN: TFIBStringField;
     QMArticulos_LotesARTICULO: TFIBStringField;
     QMArticulos_LotesLOTE: TFIBStringField;
     QMArticulos_LotesSERIE: TFIBStringField;
     QMArticulos_LotesCLASIFICACION: TFIBStringField;
     QMArticulos_LotesF_ENVASADO: TDateTimeField;
     QMArticulos_LotesF_CADUCIDAD: TDateTimeField;
     QMArticulos_LotesF_FABRICACION: TDateTimeField;
     QMArticulos_LotesID_A: TIntegerField;
     QMArticulos_LotesAUTO_REETIQUETADO: TIntegerField;
     QMArticulos_LotesCODIGO: TIntegerField;
     QMArticulos_LotesPROVEEDOR: TIntegerField;
     QMArticulos_LotesID_LOTE: TIntegerField;
     QMArticulos_LotesNOTAS: TMemoField;
     QMArticulos_LotesMEDIDA_1: TFloatField;
     QMArticulos_LotesMEDIDA_2: TFloatField;
     QMArticulos_LotesMEDIDA_3: TFloatField;
     QMArticulos_LotesMEDIDA_4: TFloatField;
     QMArticulos_LotesPRECIO: TFloatField;
     QMArticulos_LotesTITULO: TFIBStringField;
     QMArticulos_LotesALFA_1: TFIBStringField;
     QMArticulos_LotesALFA_2: TFIBStringField;
     QMArticulos_LotesALFA_3: TFIBStringField;
     QMArticulos_LotesALFA_4: TFIBStringField;
     QMArticulos_LotesALFA_5: TFIBStringField;
     QMArticulos_LotesALFA_6: TFIBStringField;
     QMArticulos_LotesALFA_7: TFIBStringField;
     QMArticulos_LotesALFA_8: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArticulos_LotesNewRecord(DataSet: TDataSet);
     procedure QMArticulos_LotesAfterOpen(DataSet: TDataSet);
     procedure QMArticulos_LotesBeforeClose(DataSet: TDataSet);
     procedure QMDetMovUbiO_COMPOSICIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetMovUbiD_COMPOSICIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticulos_LotesBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure CalculaStock;
     procedure Filtra(Articulo, Lote, Clasificacion: string);
     procedure AbreStock;
     procedure CierraStock;
     procedure FiltraLote(Filtro: string);
     procedure FiltraStockMovimientos(Alm_D, Alm_H, Art_D, Art_H, Lot_D, Lot_H, Fam_D, Fam_H: string; Fec_D, Fec_H: TDateTime);
  end;

var
  DMControl_Lotes : TDMControl_Lotes;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, UFormGest, UFMControl_Lotes, UParam, UDameDato;

{$R *.dfm}

procedure TDMControl_Lotes.DataModuleCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMArticulos_Lotes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT L.*, A.TITULO_LARGO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8 ');
     SelectSQL.Add(' FROM ART_ARTICULOS_LOTES L ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON L.EMPRESA = A.EMPRESA AND L.ARTICULO = A.ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' L.EMPRESA = :EMPRESA ');
     SelectSQL.Add(' ORDER BY L.ARTICULO, L.LOTE ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMArticulos_Lotes.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  // Mascaras
  AsignaDisplayFormat(QMArticulos_Lotes, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMMovimientosStock, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProduccion, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetCompras, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetVentas, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetMovMan, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetMovUbi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xArtStocks2, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMSofArticulos_Lotes, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProSinAsignar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMComSinAsignar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMVentSinAsignar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProCompSinAsignar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMComposicionCompuesto, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMOrdenesProduccion, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMMovimientosStock, MascaraN, MascaraI, ShortDateFormat);

  QMMovimientosStockPRECIO.DisplayFormat := MascaraL;
  QMMovimientosStockPRECIO_SIN_DTO.DisplayFormat := MascaraL;
end;

procedure TDMControl_Lotes.QMArticulos_LotesNewRecord(DataSet: TDataSet);
begin
  QMArticulos_LotesEMPRESA.AsInteger := REntorno.Empresa;
  QMArticulos_LotesCANAL.AsInteger := REntorno.Canal;
  QMArticulos_LotesF_FABRICACION.AsDateTime := REntorno.FechaTrabSH;
  QMArticulos_LotesF_ENVASADO.AsDateTime := REntorno.FechaTrabSH;
  QMArticulos_LotesF_CADUCIDAD.AsDateTime := REntorno.FechaTrabSH;
  QMArticulos_LotesID_LOTE.AsInteger := 0;
  QMArticulos_LotesAUTO_REETIQUETADO.AsInteger := 0;
  QMArticulos_LotesCODIGO.AsInteger := 0;
  QMArticulos_LotesALMACEN.AsString := REntorno.AlmacenDefecto;
  // QMArticulos_LotesALMACEN.AsString := '000';
end;

procedure TDMControl_Lotes.BusquedaCompleja;
var
  p : integer;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMArticulos_Lotes, '10000', False) <> mrCancel) then
  begin
     with QMArticulos_Lotes.SelectSQL do
     begin
        p := Pos('FROM ART_ARTICULOS_LOTES', UpperCase(Text));
        if (p > 0) then
        begin
           Text := 'SELECT L.*, A.TITULO_LARGO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8 FROM ART_ARTICULOS_LOTES L JOIN ART_ARTICULOS A ON L.EMPRESA = A.EMPRESA AND L.ARTICULO = A.ARTICULO ' + Copy(Text, p + 24, Length(Text));
        end
        else
           Filtra('', '', '');
     end;

     QMArticulos_Lotes.Open;
  end
  else
     Filtra('', '', '');
end;

procedure TDMControl_Lotes.QMArticulos_LotesAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMDetCompras');
  QMDetCompras.Open;
  DMMain.LogFin('QMDetCompras');
  DMMain.LogIni('QMDetVentas');
  QMDetVentas.Open;
  DMMain.LogFin('QMDetVentas');
  DMMain.LogIni('QMDetMovMan');
  QMDetMovMan.Open;
  DMMain.LogFin('QMDetMovMan');
  DMMain.LogIni('QMProduccion');
  QMProduccion.Open;
  DMMain.LogFin('QMProduccion');
  DMMain.LogIni('QMProSinAsignar');
  QMProSinAsignar.Open;
  DMMain.LogFin('QMProSinAsignar');
  DMMain.LogIni('QMComSinAsignar');
  QMComSinAsignar.Open;
  DMMain.LogFin('QMComSinAsignar');
  DMMain.LogIni('QMVentSinAsignar');
  QMVentSinAsignar.Open;
  DMMain.LogFin('QMVentSinAsignar');
  DMMain.LogIni('QMProCompSinAsignar');
  QMProCompSinAsignar.Open;
  DMMain.LogFin('QMProCompSinAsignar');
  DMMain.LogIni('QMDetMovUbi');
  QMDetMovUbi.Open;
  DMMain.LogFin('QMDetMovUbi');
  DMMain.LogIni('QMComposicionCompuesto');
  QMComposicionCompuesto.Open;
  DMMain.LogFin('QMComposicionCompuesto');
  DMMain.LogIni('QMOrdenesProduccion');
  QMOrdenesProduccion.Open;
  DMMain.LogFin('QMOrdenesProduccion');
end;

procedure TDMControl_Lotes.CalculaStock;
begin
end;

procedure TDMControl_Lotes.Filtra(Articulo, Lote, Clasificacion: string);
var
  StocksAbiertos : boolean;
begin
  StocksAbiertos := QMSofArticulos_Lotes.Active;

  with QMArticulos_Lotes do
  begin
     Close;
     // Construyo SQL
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT L.*, A.TITULO_LARGO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8 ');
     SelectSQL.Add(' FROM ART_ARTICULOS_LOTES L ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON L.EMPRESA = A.EMPRESA AND L.ARTICULO = A.ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' L.EMPRESA = ?EMPRESA ');
     if (Trim(Articulo) > '') then
        SelectSQL.Add(' AND L.ARTICULO = ?ARTICULO ');
     if (Trim(Lote) > '') then
        SelectSQL.Add(' AND L.LOTE = ?LOTE ');
     if (Trim(Clasificacion) > '') then
        SelectSQL.Add(' AND L.CLASIFICACION = ?CLASIFICACION ');
     SelectSQL.Add(' ORDER BY L.ARTICULO, L.LOTE');

     // Asigno parametros
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (Trim(Articulo) > '') then
        Params.ByName['ARTICULO'].AsString := Trim(Articulo);
     if (Trim(Lote) > '') then
        Params.ByName['LOTE'].AsString := Trim(Lote);
     if (Trim(Clasificacion) > '') then
        Params.ByName['CLASIFICACION'].AsString := Trim(Clasificacion);
     Open;
  end;

  if StocksAbiertos then
     AbreStock;
end;

procedure TDMControl_Lotes.QMArticulos_LotesBeforeClose(DataSet: TDataSet);
begin
  QMDetCompras.Close;
  QMDetVentas.Close;
  QMDetMovMan.Close;
  QMProduccion.Close;
  QMProSinAsignar.Close;
  QMComSinAsignar.Close;
  QMVentSinAsignar.Close;
  QMProCompSinAsignar.Close;
  QMDetMovUbi.Close;
  QMComposicionCompuesto.Close;
  QMOrdenesProduccion.Close;
end;

procedure TDMControl_Lotes.AbreStock;
begin
  xArtStocks2.Open;
  QMSofArticulos_lotes.Open;
end;

procedure TDMControl_Lotes.CierraStock;
begin
  xArtStocks2.Close;
  QMSofArticulos_lotes.Close;
end;

procedure TDMControl_Lotes.QMDetMovUbiO_COMPOSICIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameComposicionUbicacion(QMDetMovUbiO_ID_UBICACION.AsInteger);
end;

procedure TDMControl_Lotes.QMDetMovUbiD_COMPOSICIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameComposicionUbicacion(QMDetMovUbiD_ID_UBICACION.AsInteger);
end;

procedure TDMControl_Lotes.FiltraLote(Filtro: string);
begin
  with QMArticulos_Lotes do
  begin
     Close;
     if (filtro <> '') then
     begin
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT L.*, A.TITULO_LARGO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8 ');
        SelectSQL.Add(' FROM ART_ARTICULOS_LOTES L ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON L.EMPRESA = A.EMPRESA AND L.ARTICULO = A.ARTICULO ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(Filtro);
        SelectSQL.Add(' ORDER BY L.ARTICULO, L.LOTE ');
     end;
     Open;
  end;
end;

procedure TDMControl_Lotes.QMArticulos_LotesBeforePost(DataSet: TDataSet);
begin
  if (QMArticulos_LotesCODIGO.AsInteger = 0) then
     QMArticulos_LotesCODIGO.AsInteger := StrToIntDef(QMArticulos_LotesLOTE.AsString, 0);
end;

procedure TDMControl_Lotes.FiltraStockMovimientos(Alm_D, Alm_H, Art_D, Art_H, Lot_D, Lot_H, Fam_D, Fam_H: string; Fec_D, Fec_H: TDateTime);
begin
  with QMMovimientosStock do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN_DESDE'].AsString := Trim(Alm_D);
     Params.ByName['ALMACEN_HASTA'].AsString := Trim(Alm_H);
     Params.ByName['ARTICULO_DESDE'].AsString := Trim(Art_D);
     Params.ByName['ARTICULO_HASTA'].AsString := Trim(Art_H);
     Params.ByName['LOTE_DESDE'].AsString := Trim(Lot_D);
     Params.ByName['LOTE_HASTA'].AsString := Trim(Lot_H);
     Params.ByName['FECHA_DESDE'].AsDateTime := Fec_D;
     Params.ByName['FECHA_HASTA'].AsDateTime := Fec_H;
     Params.ByName['FAMILIA_DESDE'].AsString := Trim(Fam_D);
     Params.ByName['FAMILIA_HASTA'].AsString := Trim(Fam_H);
     Open;
  end;
end;

end.
