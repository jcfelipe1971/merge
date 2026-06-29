unit UDMArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, StdCtrls, ExtCtrls,
  UComponentesBusquedaFiltrada, FIBDatabase, UFIBModificados, Math,
  HYFIBQuery, FIBDataSetRO, uControlEdit, jpeg, GIFImage;

type
  TDMArticulos = class(TDataModule)
     DSQMArticulos: TDataSource;
     xHistCoste: TFIBDataSetRO;
     DSxHistCoste: TDataSource;
     QMArticulos: TFIBTableSet;
     QMArticulosEMPRESA: TIntegerField;
     QMArticulosEJERCICIO: TIntegerField;
     QMArticulosCANAL: TIntegerField;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosTITULO: TFIBStringField;
     QMArticulosFAMILIA: TFIBStringField;
     QMArticulosP_COSTE: TFloatField;
     QMArticulosABIERTO: TIntegerField;
     QMArticulosCONTROL_STOCK: TIntegerField;
     QMArticulosPAIS: TFIBStringField;
     QMArticulosTIPO_IVA: TIntegerField;
     QMArticulosCTA_COMPRAS: TFIBStringField;
     QMArticulosCTA_VENTAS: TFIBStringField;
     xTipoIva: TFIBDataSetRO;
     DSxTipoIva: TDataSource;
     QMArticulosENTRADA: TIntegerField;
     xHistCosteEMPRESA: TIntegerField;
     xHistCosteARTICULO: TFIBStringField;
     xHistCostePRECIO: TFloatField;
     xHistCosteUSUARIO: TFIBStringField;
     xHistCosteFECHA: TDateTimeField;
     xHistCosteMAQUINA: TFIBStringField;
     QMProveedores: TFIBTableSet;
     DSQMProveedores: TDataSource;
     QMProveedoresEMPRESA: TIntegerField;
     QMProveedoresARTICULO: TFIBStringField;
     QMProveedoresPROVEEDOR: TIntegerField;
     QMProveedoresPRIORIDAD: TIntegerField;
     QMProveedoresPEDIDO_MINIMO: TFloatField;
     QMProveedoresPEDIDO_OPTIMO: TFloatField;
     QMProveedoresACTIVO: TIntegerField;
     QMProveedoresTITULO: TStringField;
     QMProveedoresDESCUENTO: TFloatField;
     QMProveedoresP_COSTE: TFloatField;
     TLocal: THYTransaction;
     xUnidades: TFIBDataSetRO;
     DSxUnidades: TDataSource;
     QMArticulosUNIDADES: TFIBStringField;
     QMArticulosVIRTUAL: TIntegerField;
     QMArticulosTITULO_CORTO: TFIBStringField;
     QMArticulosNOTAS: TBlobField;
     QMCodigoBarra: TFIBTableSet;
     DSCodigoBarra: TDataSource;
     QMCodigoBarraEMPRESA: TIntegerField;
     QMCodigoBarraARTICULO: TFIBStringField;
     QMCodigoBarraBARRAS: TFIBStringField;
     QMCodigoBarraTIPO: TIntegerField;
     QMCodigoBarraFUNCION: TIntegerField;
     QMCodigoBarraTITULO: TFIBStringField;
     QMCodigoBarraLONGITUD: TIntegerField;
     xTitulos: TFIBDataSetRO;
     QMArticulosDISPONIBILIDAD: TIntegerField;
     xDisponibilidad: TFIBDataSetRO;
     DSxDisponibilidad: TDataSource;
     QMArticulosACTUALIZA_VENTA: TIntegerField;
     QMArticulosPTO_VERDE: TFloatField;
     QMArticulosCONTROLA_MEDIDAS: TIntegerField;
     QMProvArt: TFIBTableSet;
     DSQMProvArt: TDataSource;
     QMProvArtEMPRESA: TIntegerField;
     QMProvArtARTICULO: TFIBStringField;
     QMProvArtPROVEEDOR: TIntegerField;
     QMProvArtNOMBRE_PROVEEDOR: TFIBStringField;
     QMProvArtCODIGO_PROVEEDOR: TFIBStringField;
     QMArticulosSERIALIZADO: TIntegerField;
     xTipoGarantia: TFIBDataSetRO;
     DSxTipoGarantia: TDataSource;
     QMArticulosGARANTIA: TIntegerField;
     QMArticulosPRODUCCION: TIntegerField;
     QMArticulosDESCUENTO: TFloatField;
     QMArticulosDESCUENTO_2: TFloatField;
     QMArticulosDESCUENTO_3: TFloatField;
     QMProveedoresINCR_PEDIDO: TFloatField;
     DSQMSeries: TDataSource;
     QMArticulosIVA_ESCANDALLO: TIntegerField;
     xTipoIvaP_IVA: TFloatField;
     xTipoIvaP_RECARGO: TFloatField;
     xTipoIvaTITULO: TFIBStringField;
     xAgrupDisp: TFIBDataSetRO;
     DSxAgrupDisp: TDataSource;
     xAgrupSon: TFIBDataSetRO;
     DSxAgrupSon: TDataSource;
     QMArticulosP_COSTE_CANAL: TFloatField;
     QMArticulosPVP_POR_UD_SECUNDARIA: TIntegerField;
     QMArticulosPrecios: TFIBTableSet;
     DSQMArticulosPrecios: TDataSource;
     QMArticulosPreciosEMPRESA: TIntegerField;
     QMArticulosPreciosARTICULO: TFIBStringField;
     QMArticulosPreciosTIPO_PRECIO_BASE: TIntegerField;
     QMArticulosPreciosACT_TAR_AUTOM: TIntegerField;
     QMArticulosPreciosENTRADA: TIntegerField;
     QMArticulosPreciosMARGEN: TFloatField;
     QMArticulosPreciosPRECIO_ENTRADA: TFloatField;
     QMArticulosPreciosPRECIO_ULT_ENTRADA: TFloatField;
     QMArticulosPreciosPRECIO_ULT_VENTA: TFloatField;
     QMArticulosPreciosPRECIO_PMP: TFloatField;
     QMArticulosPreciosPRECIO_LIFO: TFloatField;
     QMArticulosPreciosPRECIO_FIFO: TFloatField;
     QMArticulosPreciosPRECIO_MERCADO: TFloatField;
     QMArticulosPreciosPRECIO_MANUAL: TFloatField;
     QMArticulosPreciosPUNTOS: TFloatField;
     QMArticuloTarifas: TFIBTableSet;
     DSQMArticuloTarifas: TDataSource;
     QMArticuloTarifasEMPRESA: TIntegerField;
     QMArticuloTarifasTARIFA: TFIBStringField;
     QMArticuloTarifasARTICULO: TFIBStringField;
     QMArticuloTarifasTITULO_ARTICULO: TFIBStringField;
     QMArticuloTarifasLINEA: TIntegerField;
     QMArticuloTarifasCALCULO: TIntegerField;
     QMArticuloTarifasTITULO_CALCULO: TFIBStringField;
     QMArticuloTarifasUNID_MINIMAS: TFloatField;
     QMArticuloTarifasUNID_MAXIMAS: TFloatField;
     QMArticuloTarifasPRECIO_VENTA: TFloatField;
     QMArticuloTarifasMARGEN_PC: TFloatField;
     QMArticuloTarifasMARGEN_PV: TFloatField;
     QMArticuloTarifasCOMISION: TFloatField;
     QMArticuloTarifasBLOQUEADO: TIntegerField;
     QMArticuloTarifasCOMISION_CANAL: TFloatField;
     QMArticuloTarifasPRECIO_VENTA_CANAL: TFloatField;
     QMArticulosPreciosCANAL_CALCULO: TIntegerField;
     QMArticulosPreciosALMACEN_CALCULO: TFIBStringField;
     QMArticuloTarifasPRECIO_VENTA_MONEDA: TFloatField;
     QMArticuloTarifasDESCUENTO_COMPRA: TFloatField;
     QMArticuloTarifasDESCUENTO_COMPRA_2: TFloatField;
     QMArticuloTarifasDESCUENTO_COMPRA_3: TFloatField;
     QMArticuloTarifasPRECIO_COSTE: TFloatField;
     QMArticuloTarifasPRECIO_COMPRA: TFloatField;
     QMArticulosALFA_1: TFIBStringField;
     QMArticulosALFA_2: TFIBStringField;
     QMArticulosSERIALIZADO_KRI: TIntegerField;
     QMArticulosALFA_3: TFIBStringField;
     QMArticulosALFA_4: TFIBStringField;
     QMArticulosALFA_5: TFIBStringField;
     QMArticulosALFA_6: TFIBStringField;
     QMArticulosLOTES_KRI: TIntegerField;
     QMArticulosLOTES: TIntegerField;
     QMArticuloTarifasFAMILIA: TFIBStringField;
     QMArticuloTarifasMONEDA: TFIBStringField;
     QMArticuloTarifasACTIVA: TIntegerField;
     QMArticuloTarifasMARGEN: TFloatField;
     QMArticuloTarifasPRECIO_BASE: TFloatField;
     QMArticuloTarifasPRECIO_BASE_MONEDA: TFloatField;
     xTiposRedondeo: TFIBDataSetRO;
     DSxTiposRedondeos: TDataSource;
     QMArticulosPreciosPRECIO_BASE: TIntegerField;
     QMArticulosPreciosFECHA_ULT_VENTA: TDateTimeField;
     QMArticulosPreciosTIPO_REDONDEO: TIntegerField;
     QMArticulosMULTIPLO_1: TFloatField;
     QMArticulosMULTIPLO_2: TFloatField;
     QMArticulosMULTIPLO_3: TFloatField;
     QMArticulosMULTIPLO_4: TFloatField;
     QMArticulosFACTOR_ESCALA: TFloatField;
     QMArticulosUD_MINIMO_COMPRA: TFloatField;
     QMArticulosUD_MINIMO_VENTA: TFloatField;
     QMArticulosID_A: TIntegerField;
     QMArticulosID_C_A: TIntegerField;
     QMProvArtID_A: TIntegerField;
     QMProveedoresID_A: TIntegerField;
     QMArticulosPreciosID_A: TIntegerField;
     QMArticuloTarifasID_A: TIntegerField;
     QMCodigoBarraID_A: TIntegerField;
     QMArticulosIMAGEN: TIntegerField;
     QMArticulosCODIGO_INTRA: TFIBStringField;
     QMArticulosPESO: TFloatField;
     QMArticulosCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMArticulosCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMArticulosCTA_ABONO_COMPRAS: TFIBStringField;
     QMArticulosCTA_ABONO_VENTAS: TFIBStringField;
     QMSeries: TFIBTableSet;
     QMSeriesEMPRESA: TIntegerField;
     QMSeriesEJERCICIO: TIntegerField;
     QMSeriesCANAL: TIntegerField;
     QMSeriesSERIE: TFIBStringField;
     QMSeriesARTICULO: TFIBStringField;
     QMSeriesCTA_COMPRAS: TFIBStringField;
     QMSeriesCTA_VENTAS: TFIBStringField;
     QMSeriesID_C_A: TIntegerField;
     QMSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMSeriesCTA_ABONO_COMPRAS: TFIBStringField;
     QMSeriesCTA_ABONO_VENTAS: TFIBStringField;
     QMIdiomas: TFIBTableSet;
     QMIdiomasARTICULO: TFIBStringField;
     QMIdiomasIDIOMA: TFIBStringField;
     QMIdiomasTITULO: TFIBStringField;
     DSQMIdiomas: TDataSource;
     QMIdiomasEMPRESA: TIntegerField;
     QMIdiomasID_A: TIntegerField;
     QMArticulosUBICABLE: TIntegerField;
     QMArticulosVOLUMEN_UNIT: TFloatField;
     QMArticulosDIAMETRO_UNIT: TFloatField;
     QMArticulosDEFECTO_UD_SECUNDARIA: TFloatField;
     QMArticulosANTICIPO: TIntegerField;
     QMArticulosANTICIPO_CONTADO: TIntegerField;
     QMArticulosANTICIPO_PREG_DATOS: TIntegerField;
     QMArticulosPreciosPRORRATEO: TFloatField;
     xPedidosDeClientes: TFIBDataSetRO;
     DSPedidosDeClientes: TDataSource;
     xPedidosAProveedor: TFIBDataSetRO;
     DSPedidosAProveedor: TDataSource;
     xPropuestas: TFIBDataSetRO;
     DSPropuestas: TDataSource;
     xPropuestasConfir: TFIBDataSetRO;
     DSPropuestasConfir: TDataSource;
     QMArticulosNOTAS_COMPRAS: TBlobField;
     QMArticulosNOTAS_VENTAS: TBlobField;
     xPedidosDeClientesEMPRESA: TIntegerField;
     xPedidosDeClientesEJERCICIO: TIntegerField;
     xPedidosDeClientesCANAL: TIntegerField;
     xPedidosDeClientesSERIE: TFIBStringField;
     xPedidosDeClientesTIPO: TFIBStringField;
     xPedidosDeClientesRIG: TIntegerField;
     xPedidosDeClientesID_S: TIntegerField;
     xPedidosDeClientesALMACEN: TFIBStringField;
     xPedidosDeClientesFECHA: TDateTimeField;
     xPedidosDeClientesCLIENTE: TIntegerField;
     xPedidosDeClientesAGENTE: TIntegerField;
     xPedidosDeClientesFECHA_ENTREGA_PREV: TDateTimeField;
     xPedidosDeClientesLINEA: TIntegerField;
     xPedidosDeClientesARTICULO: TFIBStringField;
     xPedidosDeClientesTITULO: TFIBStringField;
     xPedidosDeClientesID_A: TIntegerField;
     xPedidosDeClientesUNIDADES: TFloatField;
     xPedidosDeClientesPRECIO: TFloatField;
     xPedidosDeClientesDESCUENTO: TFloatField;
     xPedidosDeClientesDESCUENTO_2: TFloatField;
     xPedidosDeClientesDESCUENTO_3: TFloatField;
     xPedidosDeClientesB_IMPONIBLE: TFloatField;
     xPedidosDeClientesU_SERVIDAS: TFloatField;
     xPedidosDeClientesU_PENDIENTES: TFloatField;
     xPedidosDeClientesFECHA_ENTREGA_ARTICULO: TDateTimeField;
     xPedidosDeClientesFECHA_CONF_DET: TDateTimeField;
     xPedidosAProveedorEMPRESA: TIntegerField;
     xPedidosAProveedorEJERCICIO: TIntegerField;
     xPedidosAProveedorCANAL: TIntegerField;
     xPedidosAProveedorSERIE: TFIBStringField;
     xPedidosAProveedorTIPO: TFIBStringField;
     xPedidosAProveedorRIG: TIntegerField;
     xPedidosAProveedorID_E: TIntegerField;
     xPedidosAProveedorALMACEN: TFIBStringField;
     xPedidosAProveedorFECHA: TDateTimeField;
     xPedidosAProveedorPROVEEDOR: TIntegerField;
     xPedidosAProveedorFECHA_PRE_CAB: TDateTimeField;
     xPedidosAProveedorLINEA: TIntegerField;
     xPedidosAProveedorARTICULO: TFIBStringField;
     xPedidosAProveedorTITULO: TFIBStringField;
     xPedidosAProveedorID_A: TIntegerField;
     xPedidosAProveedorUNIDADES: TFloatField;
     xPedidosAProveedorP_COSTE: TFloatField;
     xPedidosAProveedorDESCUENTO: TFloatField;
     xPedidosAProveedorDESCUENTO_2: TFloatField;
     xPedidosAProveedorDESCUENTO_3: TFloatField;
     xPedidosAProveedorB_IMPONIBLE: TFloatField;
     xPedidosAProveedorUNIDADES_SERVIDAS: TFloatField;
     xPedidosAProveedorUNIDADES_POR_SERVIR: TFloatField;
     xPedidosAProveedorFECHA_CONF_KRI: TDateTimeField;
     xPedidosAProveedorFECHA_PRE_DET: TDateTimeField;
     xPropuestasEMPRESA: TIntegerField;
     xPropuestasEJERCICIO: TIntegerField;
     xPropuestasCANAL: TIntegerField;
     xPropuestasSERIE: TFIBStringField;
     xPropuestasTIPO: TFIBStringField;
     xPropuestasRIG: TIntegerField;
     xPropuestasID_E: TIntegerField;
     xPropuestasALMACEN: TFIBStringField;
     xPropuestasFECHA: TDateTimeField;
     xPropuestasPROVEEDOR: TIntegerField;
     xPropuestasLINEA: TIntegerField;
     xPropuestasARTICULO: TFIBStringField;
     xPropuestasTITULO: TFIBStringField;
     xPropuestasID_A: TIntegerField;
     xPropuestasUNIDADES: TFloatField;
     xPropuestasP_COSTE: TFloatField;
     xPropuestasDESCUENTO: TFloatField;
     xPropuestasDESCUENTO_2: TFloatField;
     xPropuestasDESCUENTO_3: TFloatField;
     xPropuestasB_IMPONIBLE: TFloatField;
     xPropuestasConfirEMPRESA: TIntegerField;
     xPropuestasConfirEJERCICIO: TIntegerField;
     xPropuestasConfirCANAL: TIntegerField;
     xPropuestasConfirSERIE: TFIBStringField;
     xPropuestasConfirTIPO: TFIBStringField;
     xPropuestasConfirRIG: TIntegerField;
     xPropuestasConfirID_E: TIntegerField;
     xPropuestasConfirALMACEN: TFIBStringField;
     xPropuestasConfirFECHA: TDateTimeField;
     xPropuestasConfirPROVEEDOR: TIntegerField;
     xPropuestasConfirLINEA: TIntegerField;
     xPropuestasConfirARTICULO: TFIBStringField;
     xPropuestasConfirTITULO: TFIBStringField;
     xPropuestasConfirID_A: TIntegerField;
     xPropuestasConfirUNIDADES: TFloatField;
     xPropuestasConfirP_COSTE: TFloatField;
     xPropuestasConfirDESCUENTO: TFloatField;
     xPropuestasConfirDESCUENTO_2: TFloatField;
     xPropuestasConfirDESCUENTO_3: TFloatField;
     xPropuestasConfirB_IMPONIBLE: TFloatField;
     QMArticulosWEB: TIntegerField;
     QMArticulosFABRICANTE: TIntegerField;
     QMArticulosTIPO_ARTICULO_TYC: TFIBStringField;
     QMArticulosZ_SALIDA: TFloatField;
     QMArticulosZ_LINEA: TFloatField;
     QMArticulosZ_ARMAZON: TFIBStringField;
     QMArticulosZ_LONA: TFIBStringField;
     QMArticulosZ_LACADO: TIntegerField;
     QMArticulosZ_TIPO_LACADO: TFIBStringField;
     QMArticulosZ_CORTE: TIntegerField;
     QMArticulosZ_LONA_MODELO: TFIBStringField;
     QMArticulosZ_LONA_FORMA: TFIBStringField;
     QMArticulosZ_LONA_CONFECCION: TFIBStringField;
     QMArticulosZ_QUITAR_SI_HAY_MOTOR: TIntegerField;
     QMArticulosZ_SUSTITUTO: TFIBStringField;
     QMArticulosZ_KIT_TIPO: TFIBStringField;
     QMArticulosZ_PREPARABLE: TIntegerField;
     QMArticulosZ_MERMA: TFloatField;
     DSQMProyectos: TDataSource;
     QMProyectos: TFIBTableSet;
     DSQMProyectosSeries: TDataSource;
     QMProyectosSeries: TFIBTableSet;
     QMProyectosEMPRESA: TIntegerField;
     QMProyectosEJERCICIO: TIntegerField;
     QMProyectosCANAL: TIntegerField;
     QMProyectosPROYECTO: TIntegerField;
     QMProyectosARTICULO: TFIBStringField;
     QMProyectosCTA_COMPRAS: TFIBStringField;
     QMProyectosCTA_VENTAS: TFIBStringField;
     QMProyectosID_C_A: TIntegerField;
     QMProyectosCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMProyectosCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMProyectosCTA_ABONO_COMPRAS: TFIBStringField;
     QMProyectosCTA_ABONO_VENTAS: TFIBStringField;
     QMProyectosSeriesEMPRESA: TIntegerField;
     QMProyectosSeriesEJERCICIO: TIntegerField;
     QMProyectosSeriesCANAL: TIntegerField;
     QMProyectosSeriesPROYECTO: TIntegerField;
     QMProyectosSeriesSERIE: TFIBStringField;
     QMProyectosSeriesARTICULO: TFIBStringField;
     QMProyectosSeriesCTA_COMPRAS: TFIBStringField;
     QMProyectosSeriesCTA_VENTAS: TFIBStringField;
     QMProyectosSeriesID_C_A: TIntegerField;
     QMProyectosSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMProyectosSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMProyectosSeriesCTA_ABONO_COMPRAS: TFIBStringField;
     QMProyectosSeriesCTA_ABONO_VENTAS: TFIBStringField;
     QMArtStocks: TFIBTableSet;
     DSQMArtStocks: TDataSource;
     QMArtStocksEMPRESA: TIntegerField;
     QMArtStocksCANAL: TIntegerField;
     QMArtStocksALMACEN: TFIBStringField;
     QMArtStocksARTICULO: TFIBStringField;
     QMArtStocksEXISTENCIAS: TFloatField;
     QMArtStocksENTRADAS: TFloatField;
     QMArtStocksVALOR_ENTRADAS: TFloatField;
     QMArtStocksSALIDAS: TFloatField;
     QMArtStocksVALOR_SALIDAS: TFloatField;
     QMArtStocksP_COSTE: TFloatField;
     QMArtStocksPMP: TFloatField;
     QMArtStocksSTOCK_MINIMO: TFloatField;
     QMArtStocksSTOCK_MAXIMO: TFloatField;
     QMArtStocksPEDIDOS_A_PRO: TFloatField;
     QMArtStocksPEDIDOS_D_CLI: TFloatField;
     QMArtStocksPEDIDOS_A_TMP: TFloatField;
     QMArtStocksSTOCK_VIRTUAL: TFloatField;
     QMArtStocksRESERVADAS: TFloatField;
     QMArtStocksDISPONIBLES: TFloatField;
     QMArtStocksEN_PROCESO_PROD: TFloatField;
     QMArtStocksTITULO_ALM: TFIBStringField;
     QMArtStocksTITULO_ART: TFIBStringField;
     QMArtStocksVALOR_EXISTENCIAS: TFloatField;
     QMArtStocksID_A: TIntegerField;
     QMArtStocksfabricables: TFloatField;
     QMArtStocksExistFabr: TFloatField;
     QMArtStocksEXISTENCIAS_EXT: TFloatField;
     xTiposPreciosBase: TFIBDataSetRO;
     DSxTiposPreciosBase: TDataSource;
     QMIdiomasDESCRIPCION_EXTENDIDA: TBlobField;
     TUpdate: THYTransaction;
     QMArticulosNO_CALCULA_STOCKMINMAX: TIntegerField;
     QMIdiomasCRC_DESC_EXT: TFIBStringField;
     QMArticulosCRC_NOTAS: TFIBStringField;
     QMArticulosCRC_NOTAS_COMPRAS: TFIBStringField;
     QMArticulosCRC_NOTAS_VENTAS: TFIBStringField;
     DSQMStockUbicaciones: TDataSource;
     QMStockUbicaciones: TFIBTableSet;
     QMStockUbicacionesEMPRESA: TIntegerField;
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
     QMStockUbicacionesID_A_UBICACION: TIntegerField;
     QMStockUbicacionesID_UBICACION: TIntegerField;
     QMStockUbicacionesGENERAL: TIntegerField;
     QMNrosLote: TFIBTableSet;
     DSNrosLote: TDataSource;
     QMNroSerieKRI: TFIBTableSet;
     DSQMNroSerieKRI: TDataSource;
     QMNroSerieKRIARTICULO: TFIBStringField;
     QMNroSerieKRIEMPRESA: TIntegerField;
     QMNroSerieKRINRO_SERIE: TFIBStringField;
     QMNroSerieKRIALMACEN_ENT: TFIBStringField;
     DSQMUnidadesLogisticas: TDataSource;
     QMUnidadesLogisticas: TFIBTableSet;
     QMUnidadesLogisticasEMPRESA: TIntegerField;
     QMUnidadesLogisticasARTICULO: TFIBStringField;
     QMUnidadesLogisticasTIPO: TFIBStringField;
     QMUnidadesLogisticasPESO: TFloatField;
     QMUnidadesLogisticasPESO_TOTAL: TFloatField;
     QMUnidadesLogisticasDEFECTO: TIntegerField;
     QMUnidadesLogisticasID_A: TIntegerField;
     QMUnidadesLogisticasTITULO: TFIBStringField;
     QMUnidadesLogisticasUNIDADES: TFloatField;
     QMStockUbicacionesDISPONIBLE: TIntegerField;
     QMArticulosPreciosPMP_MAS_PRORRATEO: TFloatField;
     QMNrosLoteEMPRESA: TIntegerField;
     QMNrosLoteCANAL: TIntegerField;
     QMNrosLoteARTICULO: TFIBStringField;
     QMNrosLoteLOTE: TFIBStringField;
     QMNrosLoteSERIE: TFIBStringField;
     QMNrosLoteCLASIFICACION: TFIBStringField;
     QMNrosLoteF_ENVASADO: TDateTimeField;
     QMNrosLoteF_CADUCIDAD: TDateTimeField;
     QMNrosLoteF_FABRICACION: TDateTimeField;
     QMNrosLoteID_A: TIntegerField;
     QMNrosLoteAUTO_REETIQUETADO: TIntegerField;
     QMNrosLoteCODIGO: TIntegerField;
     QMNrosLotePROVEEDOR: TIntegerField;
     QMNrosLoteID_LOTE: TIntegerField;
     QMNrosLoteALMACEN: TFIBStringField;
     QMNrosLoteSTOCK: TFloatField;
     QMNrosLoteID_UBICACION: TIntegerField;
     QMNrosLoteID_A_UBICACION: TIntegerField;
     QMNrosLoteCALLE: TFIBStringField;
     QMNrosLoteESTANTERIA: TFIBStringField;
     QMNrosLoteREPISA: TFIBStringField;
     QMNrosLotePOSICION: TFIBStringField;
     QMNrosLoteTITULO: TFIBStringField;
     QMNrosLoteVOLUMEN_MAX: TFloatField;
     QMNrosLoteDIAMETRO_MAX: TFloatField;
     QMNrosLotePESO_MAX: TFloatField;
     QMNrosLoteVOLUMEN_ACC: TFloatField;
     QMNrosLotePESO_ACC: TFloatField;
     QMNrosLoteDIAMETRO_ACC: TFloatField;
     QMNrosLoteCOMPOSICION: TFIBStringField;
     QMNrosLoteGENERAL: TIntegerField;
     QMNrosLoteUNIDADES_ACC: TFloatField;
     QMNrosLoteTIPO: TFIBStringField;
     QMNrosLoteSECTOR: TFIBStringField;
     QMNrosLoteDISPONIBLE: TIntegerField;
     QMProvArtTITULO_ART: TFIBStringField;
     QMArticulosBAJA: TIntegerField;
     QMArticulosFECHA_BAJA: TDateTimeField;
     QMArticulosMOTIVO_BAJA: TFIBStringField;
     QMArticulosID_A_M_C_T: TIntegerField;
     xPropuestasFECHA_PRE_CAB: TDateTimeField;
     xPropuestasConfirFECHA_PRE_CAB: TDateTimeField;
     QMArticulosTIPO_CLAVE_ADR: TIntegerField;
     QMArticulosCANTIDAD_LIMITADA: TIntegerField;
     QMProveedoresDIAS_ENTREGA: TIntegerField;
     DSQMCondiciones: TDataSource;
     QMCondiciones: TFIBTableSet;
     QMCondicionesARTICULO: TFIBStringField;
     QMCondicionesPROVEEDOR: TIntegerField;
     QMCondicionesPRIORIDAD: TIntegerField;
     QMCondicionesPEDIDO_MINIMO: TFloatField;
     QMCondicionesPEDIDO_OPTIMO: TFloatField;
     QMCondicionesALTA: TDateTimeField;
     QMCondicionesBAJA: TDateTimeField;
     QMCondicionesUNID_MINIMAS: TFloatField;
     QMCondicionesUNID_MAXIMAS: TFloatField;
     QMCondicionesPRECIO: TFloatField;
     QMCondicionesDIAS_ENTREGA: TIntegerField;
     QMCondicionesEMPRESA: TIntegerField;
     QMCondicionesEJERCICIO: TIntegerField;
     QMCondicionesCANAL: TIntegerField;
     QMCondicionesTIPO: TFIBStringField;
     QMCondicionesRIG: TIntegerField;
     QMCondicionesLINEA: TIntegerField;
     QMArticulosZ_MODELO: TFIBStringField;
     QMArticulosZ_LONA_TIPO: TFIBStringField;
     QMArticulosZ_FORZAR_LACADO_SN: TIntegerField;
     QMArticulosZ_TIPO_LACADO_FORZADO: TFIBStringField;
     QMArticulosCOMPONENTE_MOTOR: TIntegerField;
     QMArticulosZ_LAM_ANCHO: TFloatField;
     QMArticulosZ_LAM_LARGO: TFloatField;
     QMArticulosZ_LAM_COLOR: TFIBStringField;
     QMArticulosSUBFAMILIA: TFIBStringField;
     QMArticulosSUBTIPO_ARTICULO_TYC: TFIBStringField;
     QMArticulosID_GALERIA: TIntegerField;
     DSQMArticulosSimilares: TDataSource;
     QMArticulosSimilares: TFIBTableSet;
     QMArticulosSimilaresEMPRESA: TIntegerField;
     QMArticulosSimilaresARTICULO: TFIBStringField;
     QMArticulosSimilaresID_A: TIntegerField;
     QMArticulosSimilaresTITULO: TFIBStringField;
     QMArticulosSimilaresARTICULO_SIMILAR: TFIBStringField;
     QMArticulosSimilaresID_A_SIMILAR: TIntegerField;
     QMArticulosSimilaresTITULO_SIMILAR: TFIBStringField;
     QMCliArt: TFIBTableSet;
     DSQMCliArt: TDataSource;
     QMCliArtEMPRESA: TIntegerField;
     QMCliArtARTICULO: TFIBStringField;
     QMCliArtCLIENTE: TIntegerField;
     QMCliArtCODIGO_CLIENTE: TFIBStringField;
     QMCliArtNOMBRE_R_SOCIAL: TFIBStringField;
     QMCliArtID_A: TIntegerField;
     QMCliArtTITULO_ARTICULO: TFIBStringField;
     QMCliArtNOTAS_PREPARACION: TFIBStringField;
     QMArticulosEXPORTAR: TIntegerField;
     xPedidosDeClientesFECHA_CLIENTE: TDateTimeField;
     xPedidosAProveedorFECHA_CONFIRMADA_KRI: TDateTimeField;
     xPedidosAProveedorPALZO_CONFIRM_KRI_CAB: TDateTimeField;
     xPedidosAProveedorPLAZO_INICIAL_KRI: TDateTimeField;
     xPedidosAProveedorPALZO_CONFIRM_KRI_DET: TDateTimeField;
     QMArticulosCOSTE_ADICIONAL: TFloatField;
     QMArticulosP_COSTE_MAS_ADICIONAL: TFloatField;
     xPedidosDeClientesCODIGO_CLIENTE: TFIBStringField;
     xPedidosAProveedorCODIGO_PROVEEDOR: TFIBStringField;
     QMNroSerie: TFIBTableSet;
     DSQMNroSerie: TDataSource;
     QMNroSerieNSERIE: TFIBStringField;
     QMNroSerieARTICULO: TFIBStringField;
     QMNroSerieALMACEN: TFIBStringField;
     QMNroSerieFECHA_CADUCIDAD: TDateTimeField;
     QMNroSerieFECHA_GARANTIA_CLIENTE: TDateTimeField;
     QMNroSerieFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     QMNroSerieCLIENTE_REPARACION: TIntegerField;
     QMMovimientosStock: TFIBDataSet;
     DSQMMovimientosStock: TDataSource;
     QMMovimientosStockEMPRESA: TIntegerField;
     QMMovimientosStockCANAL: TIntegerField;
     QMMovimientosStockALMACEN: TFIBStringField;
     QMMovimientosStockARTICULO: TFIBStringField;
     QMMovimientosStockLOTE: TFIBStringField;
     QMMovimientosStockENTRADAS: TFloatField;
     QMMovimientosStockSALIDAS: TFloatField;
     QMMovimientosStockSTOCK: TFloatField;
     QMMovimientosStockFECHA: TDateTimeField;
     QMMovimientosStockDOC_NUMERO: TIntegerField;
     QMMovimientosStockDOC_SERIE: TFIBStringField;
     QMMovimientosStockDOC_TIPO: TFIBStringField;
     QMMovimientosStockTIPO_OPER: TFIBStringField;
     QMMovimientosStockID_DOC: TIntegerField;
     QMMovimientosStockID_LOTE: TIntegerField;
     QMMovimientosStockID_MOV_STOCK: TIntegerField;
     xPedidosDeClientesSU_REFERENCIA: TFIBStringField;
     xPedidosDeClientesPEDIDO_CLIENTE: TFIBStringField;
     xPedidosAProveedorSU_REFERENCIA: TFIBStringField;
     QMStockFuturo: TFIBDataSetRO;
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
     DSQMStockFuturo: TDataSource;
     QMArticulosSTOCK_ALM: TFloatField;
     dsQMEquivalenciasCab: TDataSource;
     QMEquivalenciasCab: TFIBDataSetRO;
     DSQMEquivalenciasDet: TDataSource;
     QMEquivalenciasDet: TFIBDataSetRO;
     QMEquivalenciasCabEMPRESA: TIntegerField;
     QMEquivalenciasCabID_EQUIVAL: TIntegerField;
     QMEquivalenciasCabDESC_EQUIVAL: TFIBStringField;
     QMEquivalenciasCabARTICULO: TFIBStringField;
     QMEquivalenciasCabDEFECTO: TIntegerField;
     QMEquivalenciasDetEMPRESA: TIntegerField;
     QMEquivalenciasDetID_EQUIVAL: TIntegerField;
     QMEquivalenciasDetLINEA: TIntegerField;
     QMEquivalenciasDetORDEN: TIntegerField;
     QMEquivalenciasDetARTICULO_EQUIVAL: TFIBStringField;
     QMEquivalenciasDetTITULO: TFIBStringField;
     xPedidosAProveedorFECHA_REC_DET: TDateTimeField;
     xPedidosDeClientesFECHA_REC_DET: TDateTimeField;
     QMArticulosALFA_7: TFIBStringField;
     QMArticulosALFA_8: TFIBStringField;
     QMMovimientosStockCOD_CLI_PRO: TIntegerField;
     QMMovimientosStockTITULO_CLI_PRO: TFIBStringField;
     QMMovimientosStockREF_PEDIDO: TFIBStringField;
     QMMovimientosStockID_DOC_PEDIDO: TIntegerField;
     QMStockFuturoSU_REFERENCIA: TFIBStringField;
     QMArticulosTITULO_FABRICANTE: TStringField;
     QMArticulosSTOCK_VIRTUAL: TFloatField;
     QMArticulosPRECIO_TARIFA: TFloatField;
     QMArticulosPRECIO_MERCADO: TFloatField;
     QMMovimientosStockPRECIO: TFloatField;
     QMMovimientosStockPRECIO_SIN_DTO: TFloatField;
     QMMovimientosStockCOMENTARIO: TFIBStringField;
     QMArticulosZ_QUITAR_SI_ES_MANUAL: TIntegerField;
     QMMovimientosStockCLASIFICACION: TStringField;
     QMMovimientosStockPMP: TFloatField;
     QMArticulosID_MARCA: TIntegerField;
     QMArticulosMARCA: TFIBStringField;
     QMArticulosTITULO_MARCA: TFIBStringField;
     QMArticulosPMP: TFloatField;
     QMArticulosCOD_COLOR_HILO: TFIBStringField;
     xCondiciones: TFIBTableSet;
     xCondicionesEMPRESA: TIntegerField;
     xCondicionesEJERCICIO: TIntegerField;
     xCondicionesCANAL: TIntegerField;
     xCondicionesTIPO: TFIBStringField;
     xCondicionesRIG: TIntegerField;
     xCondicionesCLIENTE: TIntegerField;
     xCondicionesARTICULO: TFIBStringField;
     xCondicionesFAMILIA: TFIBStringField;
     xCondicionesPERFIL: TFIBStringField;
     xCondicionesAGRUPACION: TFIBStringField;
     xCondicionesALTA: TDateTimeField;
     xCondicionesBAJA: TDateTimeField;
     xCondicionesACTIVO: TIntegerField;
     xCondicionesLINEA: TIntegerField;
     xCondicionesUNID_MINIMAS: TFloatField;
     xCondicionesUNID_MAXIMAS: TFloatField;
     xCondicionesPRECIO: TFloatField;
     xCondicionesDESCUENTO: TFloatField;
     xCondicionesDESCUENTO_2: TFloatField;
     xCondicionesDESCUENTO_3: TFloatField;
     DSxCondiciones: TDataSource;
     xCondicionesTITULO_CLIENTE: TFIBStringField;
     QMArticulosID_A_M: TIntegerField;
     QMArticulosBLOQUEO_COMPRAS: TIntegerField;
     QMArticulosMOTIVO_BLOQUEO_COMPRAS: TFIBStringField;
     QMArticulosBLOQUEO_VENTAS: TIntegerField;
     QMArticulosMOTIVO_BLOQUEO_VENTAS: TFIBStringField;
     QMArticulosADR_PACKAGE: TFIBStringField;
     QMArticulosTIPO_ARTICULO: TFIBStringField;
     QMArticulosTIPO_REGISTRO_FITOSANITARIO: TFIBStringField;
     QMArticulosPREPARABLE: TIntegerField;
     QMArticulosTIPO_IBAE: TIntegerField;
     QMArticulosLITROS_POR_UNIDAD: TFloatField;
     QMArticulosZ_RIBETE_DEFECTO: TFIBStringField;
     QMNroSerieKRIID: TIntegerField;
     TRW: THYTransaction;
     QMArticuloTarifasTITULO_TARIFA: TStringField;
     QMArticulosZ_LON_COLOR_1: TFIBStringField;
     QMArticulosZ_LON_COLOR_2: TFIBStringField;
     QMArticulosZ_LON_COLOR_3: TFIBStringField;
     QMArticulosFORMULA_DEFECTO: TIntegerField;
     QMArticulosTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     xCombinaciones: TFIBTableSet;
     DSxCombinaciones: TDataSource;
     xCombinacionesID: TIntegerField;
     xCombinacionesID_A: TIntegerField;
     xCombinacionesMARCA: TFIBStringField;
     xCombinacionesMODELO: TFIBStringField;
     xCombinacionesESPECIFICACION: TFIBStringField;
     xCombinacionesBOMBIN: TFIBStringField;
     xCombinacionesLLAVE: TFIBStringField;
     QMArticulosGENERAR_PEDIDO_COMPRA_SIEMPRE: TIntegerField;
     xCombinacionesTIPO_VEHICULO: TFIBStringField;
     xCombinacionesID_MARCA: TIntegerField;
     xCombinacionesID_MODELO: TIntegerField;
     xCombinacionesID_ESPECIFICACION: TIntegerField;
     xCombinacionesID_BOMBIN: TIntegerField;
     xCombinacionesID_LLAVE: TIntegerField;
     xCombinacionesID_TIPO_VEHICULO: TIntegerField;
     QMMovimientosStockALFA_2: TStringField;
     QMStockFuturoID_DETALLE_DOC: TIntegerField;
     QMStockFuturoFECHA_ENTREGA_PREV: TDateTimeField;
     QMStockFuturoFECHA_ENTREGA_PREV_DET: TDateTimeField;
     QMStockFuturoFECHA_CONF: TDateTimeField;
     QMStockFuturoFECHA_CONF_DET: TDateTimeField;
     QMConfECPrestashop: TFIBTableSet;
     DSQMConfECPrestashop: TDataSource;
     DSQMArticuloECPrestashop: TDataSource;
     QMArticuloECPrestashop: TFIBTableSet;
     QMConfECPrestashopID: TIntegerField;
     QMConfECPrestashopTITULO: TFIBStringField;
     QMConfECPrestashopWEB: TFIBStringField;
     QMConfECPrestashopEMPRESA: TIntegerField;
     QMConfECPrestashopCANAL: TIntegerField;
     QMConfECPrestashopSERIE: TFIBStringField;
     QMConfECPrestashopACTIVO: TIntegerField;
     QMConfECPrestashopPREFIJO_ART: TFIBStringField;
     QMConfECPrestashopALMACEN: TFIBStringField;
     QMConfECPrestashopAGENTE: TIntegerField;
     QMConfECPrestashopSOLO_CLIENTE_CON_PEDIDO: TIntegerField;
     QMConfECPrestashopUTILIZA_MODULO_PAYPAL: TIntegerField;
     QMConfECPrestashopART_SIN_CONTROL_STOCK: TIntegerField;
     QMConfECPrestashopUTILIZA_REF_PRESTAHOP: TIntegerField;
     QMConfECPrestashopVERSION_PRESTASHOP: TFIBStringField;
     QMConfECPrestashopID_TIENDA_ARTICULOS: TIntegerField;
     QMConfECPrestashopWS_URL: TFIBStringField;
     QMConfECPrestashopWS_KEY: TFIBStringField;
     QMConfECPrestashopWS_VERSION: TFIBStringField;
     QMConfECPrestashopWS_DEBUG: TIntegerField;
     QMConfECPrestashopWS_LANGUAGE: TIntegerField;
     QMConfECPrestashopWS_ORDER_STATE: TIntegerField;
     QMArticuloECPrestashopID_CONFIGURACION: TIntegerField;
     QMArticuloECPrestashopID_A: TIntegerField;
     QMArticuloECPrestashopID_PRODUCT: TIntegerField;
     QMArticuloECPrestashopID_ATTRIBUTE: TIntegerField;
     QMArticuloECPrestashopULT_SINCRONIZACION: TDateTimeField;
     QMArticuloECPrestashopID_ATTRIBUTES: TFIBStringField;
     QMArticuloECPrestashopID_PRODUCT_ATTRIBUTE: TIntegerField;
     QMArticuloECPrestashopTITULO: TFIBStringField;
     QMArticuloECPrestashopREFERENCIA: TFIBStringField;
     QMArticuloECPrestashopDESCRIPCION_CORTA: TBlobField;
     QMArticuloECPrestashopDESCRIPCION_LARGA: TBlobField;
     QMArticuloECPrestashopPRECIO: TFloatField;
     QMArticuloECPrestashopSTOCK: TFloatField;
     QMConfECWoocommerce: TFIBTableSet;
     QMArticuloECWoocommerce: TFIBTableSet;
     DSQMConfECWoocommerce: TDataSource;
     DSQMArticuloECWoocommerce: TDataSource;
     QMConfECWoocommerceID: TIntegerField;
     QMConfECWoocommerceTITULO: TFIBStringField;
     QMConfECWoocommerceWEB: TFIBStringField;
     QMConfECWoocommerceEMPRESA: TIntegerField;
     QMConfECWoocommerceCANAL: TIntegerField;
     QMConfECWoocommerceSERIE: TFIBStringField;
     QMConfECWoocommerceACTIVO: TIntegerField;
     QMConfECWoocommercePREFIJO_ART: TFIBStringField;
     QMConfECWoocommerceALMACEN: TFIBStringField;
     QMConfECWoocommerceAGENTE: TIntegerField;
     QMConfECWoocommerceVERSION_WORDPRESS: TFIBStringField;
     QMConfECWoocommerceWS_URL: TFIBStringField;
     QMConfECWoocommerceID_TIENDA_ARTICULOS: TIntegerField;
     QMArticuloECWoocommerceID_CONFIGURACION: TIntegerField;
     QMArticuloECWoocommerceID_A: TIntegerField;
     QMArticuloECWoocommerceID_PRODUCT: TIntegerField;
     QMArticuloECWoocommerceULT_SINCRONIZACION: TDateTimeField;
     QMArticuloECWoocommerceTITULO: TFIBStringField;
     QMArticuloECWoocommerceREFERENCIA: TFIBStringField;
     QMArticuloECWoocommerceDESCRIPCION_CORTA: TBlobField;
     QMArticuloECWoocommerceDESCRIPCION_LARGA: TBlobField;
     QMArticuloECWoocommercePRECIO: TFloatField;
     QMConfECPrestashopTARIFA: TFIBStringField;
     QMConfECWoocommerceTARIFA: TFIBStringField;
     QMConfECWoocommerceWS_CONSUMER_KEY: TFIBStringField;
     QMConfECWoocommerceWS_CONSUMER_SECRET: TFIBStringField;
     QMConfECPrestashopWEB_BACKOFFICE: TFIBStringField;
     QMConfECPrestashopMANTENER_DESCRIPCIONES: TIntegerField;
     QMConfECPrestashopMANTENER_PRECIO: TIntegerField;
     QMArticuloECPrestashopID_STOCK_AVAILABLE: TIntegerField;
     QMConfECWoocommerceWS_ORDER_STATE: TIntegerField;
     QMConfECWoocommerceUTILIZA_REF_WOOCOMMERCE: TIntegerField;
     QMConfECWoocommerceART_SIN_CONTROL_STOCK: TIntegerField;
     QMConfECWoocommerceWS_VERSION: TFIBStringField;
     QMConfECWoocommerceWEB_BACKOFFICE: TFIBStringField;
     QMArticulosSECCION: TFIBStringField;
     QMArticulosFACTOR_UNIDAD: TFloatField;
     QMArticulosPESO_FACTOR: TFloatField;
     QMArticulosDIAMETRO_FACTOR: TFloatField;
     QMArticulosVOLUMEN_FACTOR: TFloatField;
     QMArticulosNO_APLICA_DESC_LINEA_CLIENTE: TIntegerField;
     DSxAvisos: TDataSource;
     xAvisos: TFIBTableSet;
     xAvisosTIPO_OBJETO: TFIBStringField;
     xAvisosID_OBJETO: TIntegerField;
     xAvisosID_AVISO_OFC: TIntegerField;
     xAvisosACTIVO_OFC: TIntegerField;
     xAvisosMENSAJE_OFC: TMemoField;
     xAvisosID_AVISO_PEC: TIntegerField;
     xAvisosACTIVO_PEC: TIntegerField;
     xAvisosMENSAJE_PEC: TMemoField;
     xAvisosID_AVISO_ALB: TIntegerField;
     xAvisosACTIVO_ALB: TIntegerField;
     xAvisosMENSAJE_ALB: TMemoField;
     xAvisosID_AVISO_FAC: TIntegerField;
     xAvisosACTIVO_FAC: TIntegerField;
     xAvisosMENSAJE_FAC: TMemoField;
     xAvisosID_AVISO_OFP: TIntegerField;
     xAvisosACTIVO_OFP: TIntegerField;
     xAvisosMENSAJE_OFP: TMemoField;
     xAvisosID_AVISO_OCP: TIntegerField;
     xAvisosACTIVO_OCP: TIntegerField;
     xAvisosMENSAJE_OCP: TMemoField;
     xAvisosID_AVISO_PEP: TIntegerField;
     xAvisosACTIVO_PEP: TIntegerField;
     xAvisosMENSAJE_PEP: TMemoField;
     xAvisosID_AVISO_ALP: TIntegerField;
     xAvisosACTIVO_ALP: TIntegerField;
     xAvisosMENSAJE_ALP: TMemoField;
     xAvisosID_AVISO_FAP: TIntegerField;
     xAvisosACTIVO_FAP: TIntegerField;
     xAvisosMENSAJE_FAP: TMemoField;
     xAvisosID_AVISO_FCR: TIntegerField;
     xAvisosACTIVO_FCR: TIntegerField;
     xAvisosMENSAJE_FCR: TMemoField;
     QMArtStocksLANZADAS: TFloatField;
     QMArticuloECWoocommerceID_VARIATION: TIntegerField;
     QMCondicionesNOMBRE_R_SOCIAL: TFIBStringField;
     QMCondicionesDESCUENTO: TFloatField;
     QMCondicionesDESCUENTO_2: TFloatField;
     QMCondicionesDESCUENTO_3: TFloatField;
     QMArticulosALTO: TFloatField;
     QMArticulosANCHO: TFloatField;
     QMArticulosFONDO: TFloatField;
     xPedidosDeClientesTITULO_CLIENTE: TFIBStringField;
     xPedidosDeClientesID_DETALLES_S: TIntegerField;
     xPedidosAProveedorTITULO_PROVEEDOR: TFIBStringField;
     xPedidosAProveedorID_DETALLES_E: TIntegerField;
     xPropuestasTITULO_PROVEEDOR: TFIBStringField;
     xPropuestasID_DETALLES_E: TIntegerField;
     xPropuestasConfirTITULO_PROVEEDOR: TFIBStringField;
     xPropuestasConfirID_DETALLES_E: TIntegerField;
     QMArticulosTITULO_LARGO: TFIBStringField;
     QMArticulosFECHA_ALTA: TDateTimeField;
     QMArticulosLANZADA_ALM: TFloatField;
     QMArticuloTarifasCODIGO_ARTICULO_TARIFA: TFIBStringField;
     QMArtStocksAVISO_STOCK_MINIMO: TIntegerField;
     QMCliArtTITULO_ARTICULO_CLIENTE: TFIBStringField;
     QMArticulosKG_PLASTICO_VIRGEN: TFloatField;
     QMArticulosIMPORTE_IEPNR: TFloatField;
     QMArticulosTASA_DE_DESTRUCCION: TFloatField;
     QMArticulosPASTADAS: TIntegerField;
     QMArticulosPASTADA_CANT_ETIQUETAS: TIntegerField;
     QMArtStocksALMACEN_DEFECTO: TIntegerField;
     xBultos: TFIBTableSet;
     DSxBultos: TDataSource;
     xBultosEMPRESA: TIntegerField;
     xBultosARTICULO: TFIBStringField;
     xBultosBULTO: TIntegerField;
     xBultosTITULO: TFIBStringField;
     xBultosUNIDADES: TFloatField;
     xPedidosAProveedorLINEA_SERVIDA: TIntegerField;
     xPedidosDeClientesSERVIDO: TIntegerField;
     QMArticulosECOTASA: TFloatField;
     QMArticulosID_FAMILIA: TIntegerField;
     QMArticulosID_SUBFAMILIA: TIntegerField;
     QMArticulosINFLUYE_MARGEN: TIntegerField;
     QMArticuloTarifasPRECIO_SIN_IVA: TFloatField;
     QMArticuloTarifasPRECIO_CON_IVA: TFloatField;
     QMArticuloECWoocommerceSTOCK: TIntegerField;
     QMCondicionesFAMILIA: TFIBStringField;
     QMCondicionesACTIVO: TIntegerField;
     QMArticulosPreciosFECHA_ULT_ALBARAN_VENTA: TDateTimeField;
     QMArticulosPreciosFECHA_ULT_FACTURA_VENTA: TDateTimeField;
     QMArticulosPreciosFECHA_ULT_ALBARAN_COMPRA: TDateTimeField;
     QMArticulosPreciosFECHA_ULT_FACTURA_COMPRA: TDateTimeField;
     QMArticulosPARETO: TFIBStringField;
     QMArticulosESTRATEGIA_COMPRA: TIntegerField;
     QMArticulosIEPNR_CLAVE_PRODUCTO: TFIBStringField;
     QMArticulosIEPNR_KILOGRAMOS: TFloatField;
     QMArticulosIEPNR_KILOGRAMOS_NO_RECICLADOS: TFloatField;
     QMArticulosREQUIERE_LOTE_SIMPLE: TIntegerField;
     QMCondicionesAGRUPACION: TFIBStringField;
     QMArticulosPreciosPRECIO_REPOSICION: TFloatField;
     QMArticulosPreciosGAMA: TFIBStringField;
     QMArticulosPreciosPRECIO_BASE_REPOSICION: TFloatField;
     QMArticuloECWoocommercePRODUCT_TYPE: TFIBStringField;
     xTarfiasProveedor: TFIBTableSet;
     DSxTarfiasProveedor: TDataSource;
     xTarfiasProveedorEMPRESA: TIntegerField;
     xTarfiasProveedorEJERCICIO: TIntegerField;
     xTarfiasProveedorCANAL: TIntegerField;
     xTarfiasProveedorPROVEEDOR: TIntegerField;
     xTarfiasProveedorTARIFA: TFIBStringField;
     xTarfiasProveedorTITULO: TFIBStringField;
     xTarfiasProveedorFECHA_INICIO: TDateTimeField;
     xTarfiasProveedorFECHA_FINAL: TDateTimeField;
     xTarfiasProveedorDESCUENTO1: TFloatField;
     xTarfiasProveedorDESCUENTO2: TFloatField;
     xTarfiasProveedorDESCUENTO3: TFloatField;
     xTarfiasProveedorMONEDA: TFIBStringField;
     xTarfiasProveedorNOMBRE_R_SOCIAL: TFIBStringField;
     xTarfiasProveedorARTICULO: TFIBStringField;
     xTarfiasProveedorARTICULO_PROVEEDOR: TFIBStringField;
     xTarfiasProveedorP_COSTE: TFloatField;
     QMPictograma: TFIBTableSet;
     DSQMPictograma: TDataSource;
     QMPictogramaEMPRESA: TIntegerField;
     QMPictogramaARTICULO: TFIBStringField;
     QMPictogramaPICTOGRAMA: TIntegerField;
     QMPictogramaIMAGEN: TIntegerField;
     QMPictogramaNOMBRE: TFIBStringField;
     QMArticulosBLISTER: TFIBStringField;
     QMArticulosPROYECTO: TIntegerField;
     QMArtStocksSTOCK_REAL: TFloatField;
     QMArtStocksEXISTENCIAS_REALES: TFloatField;
     QMArtStocksPREPARADAS: TFloatField;
     QMArtStocksPREPARACION: TFloatField;
     DSxLogistica: TDataSource;
     xLogistica: TFIBTableSet;
     xLogisticaEMPRESA: TIntegerField;
     xLogisticaARTICULO: TFIBStringField;
     xLogisticaID_A: TIntegerField;
     xLogisticaEAN13: TFIBStringField;
     xLogisticaPESO_ENVASE_GR: TFloatField;
     xLogisticaALTO_ENVASE_CM: TFloatField;
     xLogisticaANCHO_ENVASE_CM: TFloatField;
     xLogisticaFONDO_ENVASE_CM: TFloatField;
     xLogisticaDUN14: TFIBStringField;
     xLogisticaUNIDADES_X_CAJA: TFloatField;
     xLogisticaPESO_CAJA_GR: TFloatField;
     xLogisticaALTO_CAJA_CM: TFloatField;
     xLogisticaANCHO_CAJA_CM: TFloatField;
     xLogisticaFONDO_CAJA_CM: TFloatField;
     xLogisticaPESO_PALET_KG: TFloatField;
     xLogisticaCAJAS_X_PALET: TFloatField;
     xLogisticaCAPAS_PALET: TFloatField;
     xLogisticaALTO_PALET_M: TFloatField;
     xCaracteristica: TFIBTableSet;
     DSxCaracteristica: TDataSource;
     xCaracteristicaEMPRESA: TIntegerField;
     xCaracteristicaARTICULO: TFIBStringField;
     xCaracteristicaCODIGO: TFIBStringField;
     xCaracteristicaTITULO: TFIBStringField;
     xCaracteristicaID_A: TIntegerField;
     xCaracteristicaVALOR1: TFIBStringField;
     xCaracteristicaVALOR2: TFIBStringField;
     procedure Graba(DataSet: TDataSet);
     procedure GrabaSinActualizar(DataSet: TDataSet);
     procedure CamposDefectoNewRecord(DataSet: TDataSet);
     procedure QMArticulosFAMILIAChange(Sender: TField);
     procedure QMArticulosTIPO_IVAChange(Sender: TField);
     procedure QMArticulosBeforePost(DataSet: TDataSet);
     procedure QMProveedoresTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProveedoresBeforeEdit(DataSet: TDataSet);
     procedure QMArtStocksBeforeEdit(DataSet: TDataSet);
     procedure QMArticulosUNIDADESChange(Sender: TField);
     procedure QMArtStocksfabricablesGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCodigoBarraBeforePost(DataSet: TDataSet);
     procedure QMCodigoBarraNewRecord(DataSet: TDataSet);
     procedure QMCodigoBarraTIPOChange(Sender: TField);
     procedure QMArticulosDISPONIBILIDADChange(Sender: TField);
     procedure QMCodigoBarraAfterPost(DataSet: TDataSet);
     procedure QMCodigoBarraAfterDelete(DataSet: TDataSet);
     procedure QMProvArtNewRecord(DataSet: TDataSet);
     procedure QMProvArtPROVEEDORChange(Sender: TField);
     procedure QMProvArtBeforePost(DataSet: TDataSet);
     procedure QMArtStocksExistFabrGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticulosGARANTIAChange(Sender: TField);
     procedure QMSeriesNewRecord(DataSet: TDataSet);
     procedure QMArticulosAfterCancel(DataSet: TDataSet);
     procedure QMArticulosAfterScroll(DataSet: TDataSet);
     procedure QMArticulosP_COSTE_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticuloTarifasCOMISION_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticuloTarifasPRECIO_VENTA_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticulosPreciosAfterPost(DataSet: TDataSet);
     procedure QMArticuloTarifasPRECIO_VENTA_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticuloTarifasNewRecord(DataSet: TDataSet);
     procedure QMArticuloTarifasPRECIO_BASE_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticulosPreciosAfterOpen(DataSet: TDataSet);
     procedure QMArticulosPreciosTIPO_REDONDEOChange(Sender: TField);
     procedure QMProvArtAfterDelete(DataSet: TDataSet);
     procedure QMArticulosAfterOpen(DataSet: TDataSet);
     procedure QMIdiomasNewRecord(DataSet: TDataSet);
     procedure GrabaIdioma(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArticulosTIPO_ARTICULO_TYCChange(Sender: TField);
     procedure Z_Armazon(Sender: TField);
     procedure Z_Toldo(Sender: TField);
     procedure QMArticulosZ_TIPO_LACADOChange(Sender: TField);
     procedure Z_Lona(Sender: TField);
     procedure Z_Kit(Sender: TField);
     procedure CalculaCosteKRI20(Sender: TField);
     procedure CalculaMargenkri20(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMArticulosPreciosTIPO_PRECIO_BASEChange(Sender: TField);
     procedure QMIdiomasBeforePost(DataSet: TDataSet);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMUnidadesLogisticasNewRecord(DataSet: TDataSet);
     procedure QMArticulosAfterPost(DataSet: TDataSet);
     procedure QMArticulosSimilaresNewRecord(DataSet: TDataSet);
     procedure QMCliArtNewRecord(DataSet: TDataSet);
     procedure QMCliArtBeforePost(DataSet: TDataSet);
     procedure QMArticulosCalcFields(DataSet: TDataSet);
     procedure QMUnidadesLogisticasAfterPost(DataSet: TDataSet);
     procedure QMMovimientosStockTIPO_OPERGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticulosSTOCK_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMEquivalenciasCabAfterOpen(DataSet: TDataSet);
     procedure QMEquivalenciasCabBeforeClose(DataSet: TDataSet);
     procedure QMProveedoresNewRecord(DataSet: TDataSet);
     procedure QMArticulosFABRICANTEChange(Sender: TField);
     procedure QMArticulosSTOCK_VIRTUALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticulosPRECIO_TARIFAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProvArtAfterPost(DataSet: TDataSet);
     procedure QMMovimientosStockLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArtStocksBeforeClose(DataSet: TDataSet);
     procedure QMMovimientosStockBeforeOpen(DataSet: TDataSet);
     procedure QMArticuloTarifasCalcFields(DataSet: TDataSet);
     procedure QMMovimientosStockALFA_2GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticuloECPrestashopBeforeOpen(DataSet: TDataSet);
     procedure QMConfECPrestashopAfterScroll(DataSet: TDataSet);
     procedure QMArticuloECPrestashopBeforeEdit(DataSet: TDataSet);
     procedure QMArticuloECPrestashopNewRecord(DataSet: TDataSet);
     procedure QMConfECWoocommerceAfterScroll(DataSet: TDataSet);
     procedure QMArticuloECWoocommerceBeforeEdit(DataSet: TDataSet);
     procedure QMArticuloECWoocommerceBeforeOpen(DataSet: TDataSet);
     procedure QMArticuloECWoocommerceNewRecord(DataSet: TDataSet);
     procedure xAvisosBeforePost(DataSet: TDataSet);
     procedure xAvisosNewRecord(DataSet: TDataSet);
     procedure QMArticuloECWoocommerceBeforePost(DataSet: TDataSet);
     procedure QMArticulosLANZADA_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCliArtCLIENTEChange(Sender: TField);
     procedure QMArtStocksAfterPost(DataSet: TDataSet);
     procedure xBultosNewRecord(DataSet: TDataSet);
     procedure xBultosBULTOChange(Sender: TField);
     procedure QMPictogramaNewRecord(DataSet: TDataSet);
     procedure QMArticulosBeforeClose(DataSet: TDataSet);
     procedure QMPictogramaBeforePost(DataSet: TDataSet);
     procedure QMArtStocksCalcFields(DataSet: TDataSet);
     procedure xLogisticaNewRecord(DataSet: TDataSet);
     procedure xCaracteristicaNewRecord(DataSet: TDataSet);
     procedure xCaracteristicaCODIGOChange(Sender: TField);
  private
     IdiomaKri: string; {Aquí se guarda el idioma por defecto de la empresa}
     id_a_duplicado, id_c_a_duplicado: integer;
     AlmacenBeforeScroll: string;
     Almacen, AlmacenLanzada, Tarifa: string;
     FSoloUbicacionConStock: boolean;
     RecalculoActivo: boolean;
     OldArticulo: TStrings;
     StockAlm, LanzadaAlm, PrecioTar, PrecioMerc: TStrings;
     MascaraMoneda: string;
     IdMarcaDefecto: integer;
     HayOR: boolean;
     FiltroCliente: string;
     FiltroRefCliente: string;
     FiltroRefProveedor: string;
     FiltroProveedor: string;
     FiltroFamilia: string;
     FiltroArticulo: string;
     FiltroTituloArticulo: string;
     procedure EstableceMascara;
     procedure EstableceMascaraUnidades;
     function DigitosBarras: string;
     procedure SetSoloUbicacionConStock(Value: boolean);
     procedure RellenaDatosArticulo(Articulo: TStrings);
     function DameCadenaInicioArticulo(TipoArticulo: string): string;
     procedure ActualizaPrecios(Empresa, Canal: integer; Almacen, Articulo: string);
     function DameDescripcionTipoArt(Codigo: string): string;
  public
     SQLBase: TStrings;
     SWFil: integer;
     Posicionando: boolean;
     CalcularPMPMovimientos: boolean;
     FM: TForm;
     Proveedor: integer;
     CodProv: string;
     procedure Busca(EBusca: TEdit);
     procedure AutoCuentaFam;
     procedure AutoCuentaTodos(Modo: smallint);
     procedure BusquedaCompleja;
     procedure RefrescarDatos;
     procedure Fabricar_Articulo(can_fabricar: double; unidades_ext: double);
     procedure DesFabricar_Articulo(can_fabricar: double; unidades_ext: double);
     procedure HabilitaFabricacion(var hab: smallint);
     function Calcula_UnidadesExt: double;
     // Abrir Tablas por Pestañas
     procedure AbrirFicha;
     procedure AbrirHistorico;
     procedure AbrirStock;
     procedure AbrirStockUbicaciones;
     procedure AbrirStockLote;
     procedure AbrirStockNroSerie;
     procedure AbrirStockMovimientos;
     procedure AbrirStockFuturo(SepararAlmacenes: boolean);
     procedure AbrirStockNroSerieKRI;
     procedure AbrirPrecios;
     procedure AbrirProveedores;
     procedure AbrirClientes;
     procedure AbrirCodBarras;
     procedure AbrirSeries;
     procedure AbrirAgrupacion;
     procedure AbrirIdiomas;
     procedure AbrirPedidos(SoloPendientes: boolean; Almacen: string; IdCampoOrdenCliente, IdCampoOrdenProveedor: integer);
     procedure AbrirPropuestas(SoloPendientes: boolean; Almacen: string; IdCampoOrdenPropuestas, IdCampoOrdenPropuestasConfirmadas: integer);
     procedure AbrirProyectos;
     procedure AbrirProyectosSeries;
     procedure AbrirSimilares;
     procedure AbrirUnidadesLogisitcas;
     procedure AbrirEquivalencias;
     procedure AbrirCondiciones;
     procedure AbrirCombinaciones;
     procedure AbrirECommerce;
     procedure AbrirAvisos;
     procedure AbrirBultos;
     procedure AbrirLogistica;
     procedure AbrirCaracteristicas;
     // Cerrar Tablas por Pestañas
     procedure CerrarFicha;
     procedure CerrarHistorico;
     procedure CerrarStock;
     procedure CerrarPrecios;
     procedure CerrarProveedores;
     procedure CerrarClientes;
     procedure CerrarCodBarras;
     procedure CerrarCuentas;
     procedure CerrarAgrupacion;
     procedure CerrarIdiomas;
     procedure CerrarPedidos;
     procedure CerrarPropuestas;
     procedure CerrarSimilares;
     procedure CerrarUnidadesLogisitcas;
     procedure CerrarEquivalencias;
     procedure CerrarCondiciones;
     procedure CerrarDataSetsStock;
     procedure CerrarCombinaciones;
     procedure CerrarECommerce;
     procedure CerrarAvisos;
     procedure CerrarBultos;
     procedure CerrarLogistica;
     procedure CerrarCaracteristicas;
     procedure ListarCodBarras(ICodBarras: TImage);
     function DameProduccion: integer;
     function DameArticulo: string;
     procedure Heredar;
     procedure GenerarCodBarrasAuto(Tipo, Stock: smallint);
     procedure RefrescarDMArticulos;
     function ConfigCBarras: boolean;
     procedure EscribirConfigCBarras(Flag: boolean);
     procedure InsertarArticulo(aProveedor: integer = 0; aCodProv: string = '');
     procedure RecalculaPB; // Recalculo de los precios base.
     procedure PropagaMargen;
     procedure SetEditaPrecios;
     procedure CambiaFamiliaSistema(Sistema: boolean);
     procedure RecalculaStock(Option: byte; mostrar_fparada: boolean);
     procedure CambiarCodigo(CodigoNuevo: string; BorraOrigen, ReemplazaEscandallo: boolean);
     procedure RecalculaStockArt(Articulo: string);
     function TieneEscandallo(Articulo: string): boolean;
     procedure DuplicaArticuloKri;
     procedure FiltraStockUbicaciones {(Almacen:string)};
     procedure FiltraStockLotes {(Lote:string)};
     procedure FiltraStockSeriales;
     procedure FiltraStockMovimientos;
     procedure FiltraStockFuturo(SepararAlmacenes: boolean);
     procedure FiltraStockFuturoTransaccion;
     procedure FiltraStockSerialesKRI;
     procedure RecalculaStockUbicaciones;
     procedure IniciaRecalculo;
     procedure ParaRecalculo;
     procedure RellenaDatosOldArticulo;
     procedure MueveAgrupacion(Rellena: boolean);
     procedure Z_RellenaArmazon;    //SFG_JLA
     procedure Z_RellenaToldo;      //SFG_JLA
     procedure Z_RellenaLona;       //SFG_JLA
     procedure Z_RellenaComponente; //SFG_JLA
     procedure Z_RellenaKit;        //SFG_JLA
     procedure StockAlmacen(aAlmacen: string);
     procedure LanzadaAlmacen(aAlmacen: string);
     procedure PrecioTarifa(aTarifa: string);
     procedure CambiaPrecioMovStock(Valor: double);
     procedure OptimizaBusqueda(Optimizar: boolean);
     procedure CrearCodigoBarra;
     procedure CrearCodigoBarraEAN13;
     procedure RellenaAtributos(Tipo: string; Lista: TStrings; TipoPadre: string = ''; IdPadre: integer = 0);
     procedure CrearCombinacion(IdMarca, IdModelo, IdEspecificacion, IdBombin, IdLlave, IdTipoVehiculo: integer);
     procedure FiltrarECommercePrestashop(IdTienda: integer);
     procedure CopiaCodProveedorAModelo;
     procedure FiltraSeleccion;
     procedure Traspasa_agrupaciones;
     procedure Borra_TMP_agrupaciones;
     procedure Carga_agrupaciones(agrupacion: string);
     procedure Filtra_agrupaciones(Agrupacion: string; Negativo: integer);
     procedure FiltrarPorArticulo(Articulo: string);
     procedure FiltrarPorTituloArticulo(Titulo: string);
     procedure FiltrarPorCliente(Cliente: integer);
     procedure FiltrarPorProveedor(Proveedor: integer);
     procedure FiltrarPorRefProveedor(RefProveedor: string);
     procedure FiltrarPorRefCliente(RefCliente: string);
     procedure FiltrarPorFamilia(Familia: string);
     procedure Filtrar;
     procedure QuitaFiltros;
     procedure FiltraAgrupacionDisponible(Filtro: string);
     procedure AsignarEAN13(Codigo: string);
     procedure AsignarDUN14(Codigo: string);
     procedure AsignarMedidas(Peso, Alto, Ancho, Fondo: double);
  published
     property SoloUbicacionConStock: boolean Read FSoloUbicacionConStock Write SetSoloUbicacionConStock;
  end;

{
var
  DMArticulos : TDMArticulos;
}

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, uFBusca,
  UFMUnidadesExt, UFPregCodBarras, UDMRFichasArticulos, UFParada, UFBarras,
  UDMLstEtiquetas, UFMain, UParam, XMLDoc, XMLIntf, UFMArticulos;

{$R *.DFM}

procedure TDMArticulos.DataModuleCreate(Sender: TObject);
var
  Param_ARTPCOS001 : string;
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  OldArticulo := TStringList.Create;
  StockAlm := TStringList.Create;
  LanzadaAlm := TStringList.Create;
  PrecioTar := TStringList.Create;
  PrecioMerc := TStringList.Create;
  SQLBase := TStringList.Create;

  // Auditoria
  QMArticulos.DeleteSQL.Text := 'EXECUTE PROCEDURE DEL_VER_ARTICULOS_CUENTAS(?old_ID_C_A, ' + IntToStr(REntorno.Entrada) + ')';

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Posicionando := False;
  Self.EstableceMascara;

  FiltroCliente := '';
  FiltroRefCliente := '';
  FiltroRefProveedor := '';
  FiltroProveedor := '';
  FiltroFamilia := '';
  FiltroArticulo := '';
  FiltroTituloArticulo := '';

  CambiaFamiliaSistema(False);

  if not REntorno.DatosAbiertos then
     QMArticulos.Close;

  QMArticuloTarifas.OnNewRecord := QMArticuloTarifasNewRecord;

  // Busco el idioma por defecto de la empresa
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT IDIOMA FROM SYS_IDIOMAS WHERE DEFECTO=1';
        ExecQuery;
        IdiomaKri := FieldByName['IDIOMA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Busco el marca por defecto de la empresa
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(ID_MARCA) FROM ART_ARTICULOS_MOD_MARCAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        IdMarcaDefecto := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  {cuando duplica un articulo, en el post del nuevo, se duplican el resto de tablas}
  id_a_duplicado := -1;
  id_c_a_duplicado := -1;

  FSoloUbicacionConStock := True;
  AlmacenBeforeScroll := '';

  // PCoste no editable si parametro es invisible o deshabilitado
  Param_ARTPCOS001 := LeeParametro('ARTPCOS001');
  QMArticulosP_COSTE.ReadOnly := ((Param_ARTPCOS001 = 'I') or (Param_ARTPCOS001 = 'D'));

  if (LeeParametro('ARTREST001') = 'S') then
  begin
     QMArtStocksSTOCK_MINIMO.ReadOnly := True;
     QMArtStocksSTOCK_MAXIMO.ReadOnly := True;
  end;

  // Nombres de los campos fechas igualados a lo que dice en los formularios
  // Pedidos de Clientes
  xPedidosDeClientesFECHA.DisplayLabel := _('Fecha');
  xPedidosDeClientesFECHA_CLIENTE.DisplayLabel := _('Fecha Pedido');
  xPedidosDeClientesFECHA_ENTREGA_PREV.DisplayLabel := _('Fecha prevista');
  // Pedidos a Proveedor
  xPedidosAProveedorFECHA.DisplayLabel := _('Fecha Pedido');
  xPedidosAProveedorFECHA_PRE_CAB.DisplayLabel := _('Fecha Prevista');
  xPedidosAProveedorFECHA_CONFIRMADA_KRI.DisplayLabel := _('Fecha Confirmada Cab.');
  xPedidosAProveedorFECHA_CONF_KRI.DisplayLabel := _('Fecha Confirmada Det.');
  xPedidosAProveedorFECHA_PRE_DET.DisplayLabel := _('Fec. Prev. Det.');
  xPedidosAProveedorPALZO_CONFIRM_KRI_CAB.DisplayLabel := _('Plazo Conf. Cab.');
  xPedidosAProveedorPALZO_CONFIRM_KRI_DET.DisplayLabel := _('Plazo Conf. Det.');
  xPedidosAProveedorPLAZO_INICIAL_KRI.DisplayLabel := _('Plazo Inicial');

  if (DMMain.EstadoKri(203) = 1) then
  begin
     xPedidosDeClientesFECHA.DisplayLabel := _('Fecha Pedido');
     xPedidosDeClientesFECHA_CLIENTE.DisplayLabel := _('Fecha Solicitada');
     xPedidosDeClientesFECHA_ENTREGA_PREV.DisplayLabel := _('Fecha Confirmada');
     // xPedidosDeClientesFECHA_REC_CAB.DisplayLabel := _('Fecha Recepcion');
     xPedidosDeClientesFECHA_ENTREGA_ARTICULO.DisplayLabel := _('Fec. Confirmada');
     // xPedidosDeClientesFECHA_REC_DET.DisplayLabel := _('Fec. Recepción');

     xPedidosAProveedorFECHA.DisplayLabel := _('Fecha Pedido');
     xPedidosAProveedorFECHA_PRE_CAB.DisplayLabel := _('Fecha Requerida');
     xPedidosAProveedorFECHA_CONFIRMADA_KRI.DisplayLabel := _('Fecha Confirmada Cab.');
     xPedidosAProveedorFECHA_CONF_KRI.DisplayLabel := _('Fecha Confirmada Det.');
     xPedidosAProveedorFECHA_PRE_DET.DisplayLabel := _('Fec. Requerida');
     xPedidosAProveedorPALZO_CONFIRM_KRI_CAB.DisplayLabel := _('Plazo Conf. Cab.');
     xPedidosAProveedorPALZO_CONFIRM_KRI_DET.DisplayLabel := _('Plazo Conf. Det.');
     xPedidosAProveedorPLAZO_INICIAL_KRI.DisplayLabel := _('Plazo Inicial');
  end;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMArticulos.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  QMMovimientosStock.FieldByName('ALFA_2').DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [2]));

  Almacen := 'NOCALC';
  Tarifa := 'NOCALC';
  MascaraMoneda := DMMain.MascaraMoneda(REntorno.Moneda, 0);
end;

procedure TDMArticulos.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
  OldArticulo.Free;
  StockAlm.Free;
  LanzadaAlm.Free;
  PrecioTar.Free;
  PrecioMerc.Free;
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMArticulos.RellenaDatosArticulo(Articulo: TStrings);

  procedure AddField(Articulo: TStrings; Campo: string);
  begin
     if (QMArticulos.FieldByName(Campo) is TDateTimeField) then
        Articulo.Add(Campo + '=' + DateTimeToStr(QMArticulos.FieldByName(Campo).AsDateTime))
     else
        Articulo.Add(Campo + '=' + QMArticulos.FieldByName(Campo).AsString);
  end;

begin
  Articulo.Clear;
  AddField(Articulo, 'FAMILIA');
  AddField(Articulo, 'SUBFAMILIA');
  AddField(Articulo, 'CTA_COMPRAS');
  AddField(Articulo, 'CTA_VENTAS');
  AddField(Articulo, 'UNIDADES');
  AddField(Articulo, 'TITULO_CORTO');
  AddField(Articulo, 'DESCUENTO');
  AddField(Articulo, 'DESCUENTO_2');
  AddField(Articulo, 'DESCUENTO_3');
  AddField(Articulo, 'ALFA_1');
  AddField(Articulo, 'ALFA_2');
  AddField(Articulo, 'ALFA_3');
  AddField(Articulo, 'ALFA_4');
  AddField(Articulo, 'ALFA_5');
  AddField(Articulo, 'ALFA_6');
  AddField(Articulo, 'ALFA_7');
  AddField(Articulo, 'ALFA_8');
  AddField(Articulo, 'IMAGEN');
  AddField(Articulo, 'CODIGO_INTRA');
  AddField(Articulo, 'PESO');
  AddField(Articulo, 'CTA_DEVOLUCION_COMPRAS');
  AddField(Articulo, 'CTA_DEVOLUCION_VENTAS');
  AddField(Articulo, 'CTA_ABONO_COMPRAS');
  AddField(Articulo, 'CTA_ABONO_VENTAS');
  AddField(Articulo, 'VOLUMEN_UNIT');
  AddField(Articulo, 'DIAMETRO_UNIT');
  AddField(Articulo, 'ALTO');
  AddField(Articulo, 'ANCHO');
  AddField(Articulo, 'FONDO');
  AddField(Articulo, 'WEB');
  AddField(Articulo, 'BAJA');
  AddField(Articulo, 'FECHA_BAJA');
  AddField(Articulo, 'MOTIVO_BAJA');
  AddField(Articulo, 'COSTE_ADICIONAL');
end;

procedure TDMArticulos.EstableceMascara;
begin
  AsignaDisplayFormat(QMArticulos, MascaraN, MascaraI, ShortDateFormat);
  QMArticulosP_COSTE.DisplayFormat := MascaraE;
  QMArticulosPTO_VERDE.DisplayFormat := MascaraE;
  QMArticulosDESCUENTO.DisplayFormat := MascaraP;
  QMArticulosDESCUENTO_2.DisplayFormat := MascaraP;
  QMArticulosDESCUENTO_3.DisplayFormat := MascaraP;
  QMArticulosMULTIPLO_1.DisplayFormat := MascaraI;
  QMArticulosMULTIPLO_2.DisplayFormat := MascaraI;
  QMArticulosMULTIPLO_3.DisplayFormat := MascaraI;
  QMArticulosMULTIPLO_4.DisplayFormat := MascaraI;
  QMArticulosFACTOR_ESCALA.DisplayFormat := MascaraI;
  QMArticulosPESO.DisplayFormat := MascaraI;
  QMArticulosVOLUMEN_UNIT.DisplayFormat := MascaraI;
  QMArticulosDIAMETRO_UNIT.DisplayFormat := MascaraI;
  QMArticulosPESO_FACTOR.DisplayFormat := MascaraI;
  QMArticulosDIAMETRO_FACTOR.DisplayFormat := MascaraI;
  QMArticulosVOLUMEN_FACTOR.DisplayFormat := MascaraI;
  QMArticulosALTO.DisplayFormat := MascaraI;
  QMArticulosANCHO.DisplayFormat := MascaraI;
  QMArticulosFONDO.DisplayFormat := MascaraI;
  QMArticulosLITROS_POR_UNIDAD.DisplayFormat := MascaraI;
  QMArticulosDEFECTO_UD_SECUNDARIA.DisplayFormat := MascaraI;
  QMArticulosCOSTE_ADICIONAL.DisplayFormat := MascaraE;
  QMArticulosP_COSTE_MAS_ADICIONAL.DisplayFormat := MascaraE;
  QMArticulosPRECIO_MERCADO.DisplayFormat := MascaraE;
  QMArticulosPMP.DisplayFormat := MascaraE;
  QMArticulosKG_PLASTICO_VIRGEN.DisplayFormat := MascaraL;
  QMArticulosIMPORTE_IEPNR.DisplayFormat := MascaraL;
  QMArticulosTASA_DE_DESTRUCCION.DisplayFormat := MascaraL;
  QMArticulosECOTASA.DisplayFormat := MascaraL;
  QMArticulosIEPNR_KILOGRAMOS.DisplayFormat := ',0.00###';
  QMArticulosIEPNR_KILOGRAMOS_NO_RECICLADOS.DisplayFormat := ',0.00###';

  AsignaDisplayFormat(xTipoIva, MascaraN, MascaraI, ShortDateFormat);
  xTipoIvaP_IVA.DisplayFormat := MascaraP;
  xTipoIvaP_RECARGO.DisplayFormat := MascaraP;

  AsignaDisplayFormat(xHistCoste, MascaraN, MascaraI, ShortDateFormat);
  xHistCostePRECIO.DisplayFormat := MascaraE;

  AsignaDisplayFormat(QMArtStocks, MascaraN, MascaraI, ShortDateFormat);
  QMArtStocksVALOR_ENTRADAS.DisplayFormat := MascaraE;
  QMArtStocksVALOR_SALIDAS.DisplayFormat := MascaraE;
  QMArtStocksVALOR_EXISTENCIAS.DisplayFormat := MascaraE;
  QMArtStocksPMP.DisplayFormat := MascaraE;

  AsignaDisplayFormat(QMArticulosPrecios, MascaraN, MascaraI, ShortDateFormat);
  QMArticulosPreciosPRORRATEO.DisplayFormat := MascaraL;
  QMArticulosPreciosPMP_MAS_PRORRATEO.DisplayFormat := MascaraL;
  QMArticulosPreciosMARGEN.DisplayFormat := MascaraP;
  QMArticulosPreciosPRECIO_ENTRADA.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_ULT_ENTRADA.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_ULT_VENTA.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_PMP.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_MERCADO.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_REPOSICION.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_BASE_REPOSICION.DisplayFormat := MascaraE;
  QMArticulosPreciosPRECIO_MANUAL.DisplayFormat := MascaraE;

  AsignaDisplayFormat(QMArticuloTarifas, MascaraN, MascaraI, ShortDateFormat);
  QMArticuloTarifasCOMISION.DisplayFormat := MascaraD;
  QMArticuloTarifasPRECIO_VENTA.DisplayFormat := MascaraE;
  QMArticuloTarifasPRECIO_BASE.DisplayFormat := MascaraL;
  QMArticuloTarifasMARGEN.DisplayFormat := MascaraP;
  QMArticuloTarifasMARGEN_PC.DisplayFormat := MascaraP;
  QMArticuloTarifasMARGEN_PV.DisplayFormat := MascaraP;
  QMArticuloTarifasPRECIO_COSTE.DisplayFormat := MascaraE;
  QMArticuloTarifasPRECIO_COMPRA.DisplayFormat := MascaraE;
  QMArticuloTarifasDESCUENTO_COMPRA.DisplayFormat := MascaraP;
  QMArticuloTarifasDESCUENTO_COMPRA_2.DisplayFormat := MascaraP;
  QMArticuloTarifasDESCUENTO_COMPRA_3.DisplayFormat := MascaraP;
  QMArticuloTarifasPRECIO_SIN_IVA.DisplayFormat := MascaraE;
  QMArticuloTarifasPRECIO_CON_IVA.DisplayFormat := MascaraE;

  AsignaDisplayFormat(xPedidosDeClientes, MascaraN, MascaraI, ShortDateFormat);
  xPedidosDeClientesPRECIO.DisplayFormat := MascaraE;
  xPedidosDeClientesDESCUENTO.DisplayFormat := MascaraP;
  xPedidosDeClientesDESCUENTO_2.DisplayFormat := MascaraP;
  xPedidosDeClientesDESCUENTO_3.DisplayFormat := MascaraP;
  xPedidosDeClientesB_IMPONIBLE.DisplayFormat := MascaraE;

  AsignaDisplayFormat(xPropuestas, MascaraN, MascaraI, ShortDateFormat);
  xPropuestasP_COSTE.DisplayFormat := MascaraE;
  xPropuestasDESCUENTO.DisplayFormat := MascaraP;
  xPropuestasDESCUENTO_2.DisplayFormat := MascaraP;
  xPropuestasDESCUENTO_3.DisplayFormat := MascaraP;
  xPropuestasB_IMPONIBLE.DisplayFormat := MascaraE;

  {dji lrk kri - Pedidos a Proveedor en los que se encuentra el articulo}
  AsignaDisplayFormat(xPedidosAProveedor, MascaraN, MascaraI, ShortDateFormat);
  xPedidosAProveedorP_COSTE.DisplayFormat := MascaraE;
  xPedidosAProveedorDESCUENTO.DisplayFormat := MascaraP;
  xPedidosAProveedorDESCUENTO_2.DisplayFormat := MascaraP;
  xPedidosAProveedorDESCUENTO_3.DisplayFormat := MascaraP;
  xPedidosAProveedorB_IMPONIBLE.DisplayFormat := MascaraE;

  AsignaDisplayFormat(xPropuestasConfir, MascaraN, MascaraI, ShortDateFormat);
  xPropuestasConfirP_COSTE.DisplayFormat := MascaraE;
  xPropuestasConfirDESCUENTO.DisplayFormat := MascaraP;
  xPropuestasConfirDESCUENTO_2.DisplayFormat := MascaraP;
  xPropuestasConfirDESCUENTO_3.DisplayFormat := MascaraP;
  xPropuestasConfirB_IMPONIBLE.DisplayFormat := MascaraE;

  AsignaDisplayFormat(QMUnidadesLogisticas, MascaraN, MascaraI, ShortDateFormat);
  QMUnidadesLogisticasPESO.DisplayFormat := MascaraE;
  QMUnidadesLogisticasPESO_TOTAL.DisplayFormat := MascaraE;

  AsignaDisplayFormat(QMCondiciones, MascaraN, MascaraI, ShortDateFormat);
  QMCondicionesPRECIO.DisplayFormat := MascaraE;
  QMCondicionesDIAS_ENTREGA.DisplayFormat := MascaraI;
  QMCondicionesDESCUENTO.DisplayFormat := MascaraP;
  QMCondicionesDESCUENTO_2.DisplayFormat := MascaraP;
  QMCondicionesDESCUENTO_3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMNroSerie, MascaraN, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(QMMovimientosStock, MascaraN, MascaraI, ShortDateFormat);
  QMMovimientosStockPRECIO.DisplayFormat := MascaraL;
  QMMovimientosStockPRECIO_SIN_DTO.DisplayFormat := MascaraL;
  QMMovimientosStockPMP.DisplayFormat := MascaraL;
  QMMovimientosStockFECHA.DisplayFormat := ShortDateFormat + ' hh:nn:ss';

  QMStockFuturoFECHA.DisplayFormat := ShortDateFormat + ' hh:nn:ss';

  AsignaDisplayFormat(xCondiciones, MascaraN, MascaraI, ShortDateFormat);
  xCondicionesPRECIO.DisplayFormat := MascaraL;
  xCondicionesDESCUENTO.DisplayFormat := MascaraP;
  xCondicionesDESCUENTO_2.DisplayFormat := MascaraP;
  xCondicionesDESCUENTO_3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(xTarfiasProveedor, MascaraL, MascaraI, ShortDateFormat);
  xTarfiasProveedorDESCUENTO1.DisplayFormat := MascaraP;
  xTarfiasProveedorDESCUENTO2.DisplayFormat := MascaraP;
  xTarfiasProveedorDESCUENTO3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMArticuloECPrestashop, MascaraN, MascaraI, ShortDateFormat);
  QMArticuloECPrestashopPRECIO.DisplayFormat := ',0.00####';
  // En Prestashop el stock es entero
  QMArticuloECPrestashopSTOCK.DisplayFormat := MascaraI;

  AsignaDisplayFormat(QMArticuloECWoocommerce, MascaraN, MascaraI, ShortDateFormat);
  QMArticuloECWoocommercePRECIO.DisplayFormat := ',0.00####';
  QMArticuloECWoocommerceSTOCK.DisplayFormat := MascaraL;

  AsignaDisplayFormat(xLogistica, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TDMArticulos.EstableceMascaraUnidades;
var
  MascaraUnidades : string;
begin
  MascaraUnidades := DMMain.DameMascaraUnidades(QMArticulosARTICULO.AsString);

  QMArticulosUD_MINIMO_COMPRA.DisplayFormat := MascaraUnidades;
  QMArticulosUD_MINIMO_VENTA.DisplayFormat := MascaraUnidades;
  QMProveedoresPEDIDO_MINIMO.DisplayFormat := MascaraUnidades;
  QMProveedoresPEDIDO_OPTIMO.DisplayFormat := MascaraUnidades;
  QMProveedoresINCR_PEDIDO.DisplayFormat := MascaraUnidades;

  QMArtStocksENTRADAS.DisplayFormat := MascaraUnidades;
  QMArtStocksSALIDAS.DisplayFormat := MascaraUnidades;
  QMArtStocksEXISTENCIAS.DisplayFormat := MascaraUnidades;
  QMArtStocksSTOCK_MINIMO.DisplayFormat := MascaraUnidades;
  QMArtStocksSTOCK_MAXIMO.DisplayFormat := MascaraUnidades;
  QMArtStocksSTOCK_VIRTUAL.DisplayFormat := MascaraUnidades;
  QMArtStocksPEDIDOS_A_PRO.DisplayFormat := MascaraUnidades;
  QMArtStocksPEDIDOS_D_CLI.DisplayFormat := MascaraUnidades;
  QMArtStocksRESERVADAS.DisplayFormat := MascaraUnidades;
  QMArtStocksDISPONIBLES.DisplayFormat := MascaraUnidades;
  QMArtStocksEN_PROCESO_PROD.DisplayFormat := MascaraUnidades;
  QMArtStocksLANZADAS.DisplayFormat := MascaraUnidades;
  QMArtStocksSTOCK_REAL.DisplayFormat := MascaraUnidades;

  QMStockUbicacionesENTRADAS.DisplayFormat := MascaraUnidades;
  QMStockUbicacionesSALIDAS.DisplayFormat := MascaraUnidades;
  QMStockUbicacionesEXISTENCIAS.DisplayFormat := MascaraUnidades;

  QMNrosLoteSTOCK.DisplayFormat := MascaraUnidades;

  QMStockFuturoCANTIDAD.DisplayFormat := MascaraUnidades;
  QMStockFuturoSTOCK.DisplayFormat := MascaraUnidades;

  QMMovimientosStockENTRADAS.DisplayFormat := MascaraUnidades;
  QMMovimientosStockSALIDAS.DisplayFormat := MascaraUnidades;
  QMMovimientosStockSTOCK.DisplayFormat := MascaraUnidades;

  QMArticuloTarifasUNID_MINIMAS.DisplayFormat := MascaraUnidades;
  QMArticuloTarifasUNID_MAXIMAS.DisplayFormat := MascaraUnidades;
  xPedidosDeClientesUNIDADES.DisplayFormat := MascaraUnidades;
  xPedidosDeClientesU_SERVIDAS.DisplayFormat := MascaraUnidades;
  xPedidosDeClientesU_PENDIENTES.DisplayFormat := MascaraUnidades;
  xPropuestasUNIDADES.DisplayFormat := MascaraUnidades;
  xPedidosAProveedorUNIDADES.DisplayFormat := MascaraUnidades;
  xPedidosAProveedorUNIDADES_SERVIDAS.DisplayFormat := MascaraUnidades;
  xPedidosAProveedorUNIDADES_POR_SERVIR.DisplayFormat := MascaraUnidades;
  xPropuestasConfirUNIDADES.DisplayFormat := MascaraUnidades;
  QMUnidadesLogisticasUNIDADES.DisplayFormat := MascaraUnidades;
  QMCondicionesPEDIDO_MINIMO.DisplayFormat := MascaraUnidades;
  QMCondicionesUNID_MINIMAS.DisplayFormat := MascaraUnidades;
  QMCondicionesUNID_MAXIMAS.DisplayFormat := MascaraUnidades;
end;

procedure TDMArticulos.Graba(DataSet: TDataSet);
var
  DS : TFIBDataSet;
  existe : boolean;
begin
  if (id_c_a_duplicado <> -1) then
  begin
     try
        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add('SELECT EMPRESA,''' + QMArticulosARTICULO.AsString + ''' AS ARTICULO, IDIOMA, TITULO, DESCRIPCION_EXTENDIDA, CRC_DESC_EXT FROM ART_ARTICULOS_IDIOMAS WHERE ID_A = ' + IntToStr(id_a_duplicado));
                 Open;

                 while not EOF do
                 begin
                    // Verifico si existe el idioma
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('SELECT IDIOMA FROM ART_ARTICULOS_IDIOMAS ');
                          SQL.Add('WHERE EMPRESA = ' + DS.FieldByName('EMPRESA').AsString + ' and ARTICULO = ''' + DS.FieldByName('ARTICULO').AsString + ''' and IDIOMA = ''' + DS.FieldByName('IDIOMA').AsString + '''');
                          ExecQuery;
                          existe := (FieldByName['IDIOMA'].AsString > '   ');
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          if (existe) then
                          begin
                             SQL.Add('UPDATE ART_ARTICULOS_IDIOMAS a ');
                             SQL.Add('SET ');
                             SQL.Add('A.TITULO = (SELECT TITULO FROM ART_ARTICULOS_IDIOMAS WHERE ID_A=' + IntToStr(id_a_duplicado) + ' AND IDIOMA=A.IDIOMA), ');
                             SQL.Add('A.DESCRIPCION_EXTENDIDA = (SELECT DESCRIPCION_EXTENDIDA from ART_ARTICULOS_IDIOMAS WHERE ID_A=' + IntToStr(id_a_duplicado) + ' AND IDIOMA=A.IDIOMA), ');
                             SQL.Add('A.CRC_DESC_EXT = (SELECT CRC_DESC_EXT FROM ART_ARTICULOS_IDIOMAS WHERE ID_A=' + IntToStr(id_a_duplicado) + ' AND IDIOMA=A.IDIOMA) ');
                             SQL.Add('WHERE ');
                             SQL.Add('A.EMPRESA=' + QMArticulosEMPRESA.AsString + ' AND ');
                             SQL.Add('A.ARTICULO=''' + QMArticulosARTICULO.AsString + ''' AND ');
                             SQL.Add('A.IDIOMA=''' + DS.FieldByName('IDIOMA').AsString + '''');
                          end
                          else
                          begin
                             SQL.Add('INSERT INTO ART_ARTICULOS_IDIOMAS (EMPRESA, ARTICULO, IDIOMA, TITULO, DESCRIPCION_EXTENDIDA, CRC_DESC_EXT) ');
                             SQL.Add('SELECT EMPRESA, ''' + QMArticulosARTICULO.AsString + ''', IDIOMA, TITULO, DESCRIPCION_EXTENDIDA, CRC_DESC_EXT FROM ART_ARTICULOS_IDIOMAS ');
                             SQL.Add('WHERE ');
                             SQL.Add('ID_A=' + IntToStr(id_a_duplicado) + ' AND ');
                             SQL.Add('IDIOMA=''' + DS.FieldByName('IDIOMA').AsString + '''');
                          end;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    Next;
                 end;

                 // QMCabeceraNOTAS.Assign(FieldByName('NOTAS_KRI'));
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
                 Transaction := nil;
              end;
           end;
        finally
           FreeAndNil(DS);
        end;

        id_a_duplicado := -1;
        id_c_a_duplicado := -1;
     except
        on E: Exception do
           MessageDlg(_('No se pudieron duplicar los idiomas.') + #13#10 + #13#10 + E.Message, mtError, [mbOK], 0);
     end;

     if Assigned(FM) then
        TFMArticulos(FM).RestauraTabSeet;
  end;
end;

procedure TDMArticulos.CamposDefectoNewRecord(DataSet: TDataSet);
begin
  QMArticulosEMPRESA.AsInteger := REntorno.Empresa;
  QMArticulosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMArticulosCANAL.AsInteger := REntorno.Canal;
  QMArticulosABIERTO.AsInteger := 0;
  QMArticulosFAMILIA.AsString := REntorno.FamDefecto;
  QMArticulosCONTROL_STOCK.AsInteger := BoolToInt((LeeParametro('ARTCSTO002') <> 'N'));
  QMArticulosUNIDADES.AsString := '-';
  QMArticulosVIRTUAL.AsInteger := 0;
  QMArticulosCONTROLA_MEDIDAS.AsInteger := 0;
  QMArticulosSERIALIZADO.AsInteger := 0;
  QMArticulosGARANTIA.AsInteger := 0;
  QMArticulosPRODUCCION.AsInteger := 0;
  QMArticulosDESCUENTO.AsFloat := 0;
  QMArticulosDESCUENTO_2.AsFloat := 0;
  QMArticulosDESCUENTO_3.AsFloat := 0;
  QMArticulosIVA_ESCANDALLO.AsInteger := 0;
  QMArticulosPVP_POR_UD_SECUNDARIA.AsInteger := 0;
  QMArticulosSERIALIZADO_KRI.AsInteger := 0;
  QMArticulosLOTES_KRI.AsInteger := 0;
  QMArticulosLOTES.AsInteger := 0;
  QMArticulosMULTIPLO_1.AsFloat := 0;
  QMArticulosMULTIPLO_2.AsFloat := 0;
  QMArticulosMULTIPLO_3.AsFloat := 0;
  QMArticulosMULTIPLO_4.AsFloat := 0;
  QMArticulosFACTOR_ESCALA.AsFloat := 1;
  QMArticulosUD_MINIMO_COMPRA.AsFloat := 0;
  QMArticulosUD_MINIMO_VENTA.AsFloat := 0;
  QMArticulosIMAGEN.AsInteger := 0;
  QMArticulosUBICABLE.AsInteger := 0;
  QMArticulosDEFECTO_UD_SECUNDARIA.AsFloat := 0;
  QMArticulosNO_CALCULA_STOCKMINMAX.AsFloat := 0;
  QMArticulosFABRICANTE.AsInteger := 1;
  QMArticulosWEB.AsInteger := 1;
  QMArticulosEXPORTAR.AsInteger := 0;
  // Anticipos
  QMArticulosANTICIPO.AsInteger := 0;
  QMArticulosANTICIPO_CONTADO.AsInteger := 0;
  QMArticulosANTICIPO_PREG_DATOS.AsInteger := 0;
  // Quimicas
  QMArticulosTIPO_CLAVE_ADR.AsInteger := 0;
  QMArticulosCANTIDAD_LIMITADA.AsInteger := 0;
  // Toldos y Cortinas
  QMArticulosTIPO_ARTICULO_TYC.AsString := 'V';
  QMArticulosID_GALERIA.AsInteger := 0;
  QMArticulosCOSTE_ADICIONAL.AsFloat := 0;
  QMArticulosBAJA.AsInteger := 0;
  QMArticulosCOD_COLOR_HILO.AsString := 'IND';
  QMArticulosTIPO_ARTICULO.AsString := 'NOR';
  QMArticulosPREPARABLE.AsInteger := 0;
  QMArticulosTIPO_IBAE.AsInteger := 0;
  QMArticulosLITROS_POR_UNIDAD.AsFloat := 0;
  QMArticulosZ_RIBETE_DEFECTO.AsString := 'IND';
  QMArticulosID_MARCA.AsInteger := IdMarcaDefecto;
  QMArticulosFORMULA_DEFECTO.AsInteger := 0;
  QMArticulosTIPO_IMPUESTO_ADICIONAL.AsInteger := 0;
  QMArticulosGENERAR_PEDIDO_COMPRA_SIEMPRE.AsInteger := 0;
  QMArticulosSECCION.AsString := 'DES';
  QMArticulosFACTOR_UNIDAD.AsFloat := 1;
  QMArticulosKG_PLASTICO_VIRGEN.AsFloat := 0;
  QMArticulosIMPORTE_IEPNR.AsFloat := 0;
  QMArticulosTASA_DE_DESTRUCCION.AsFloat := 0;
  QMArticulosECOTASA.AsFloat := 0;
  QMArticulosPASTADAS.AsInteger := 0;
  QMArticulosPASTADA_CANT_ETIQUETAS.AsInteger := 0;
  QMArticulosINFLUYE_MARGEN.AsInteger := 1;
  QMArticulosPARETO.AsString := '';
  QMArticulosESTRATEGIA_COMPRA.AsInteger := 0;

  // Inicializo con color por defecto.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COD_COLOR FROM ART_COLORES WHERE ID_A_C = -1';
        ExecQuery;
        QMArticulosZ_LON_COLOR_1.AsString := FieldByName['COD_COLOR'].AsString;
        QMArticulosZ_LON_COLOR_2.AsString := FieldByName['COD_COLOR'].AsString;
        QMArticulosZ_LON_COLOR_3.AsString := FieldByName['COD_COLOR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.QMArticulosFAMILIAChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PAIS, TIPO_IVA, CTA_COMPRAS, CTA_VENTAS, CTA_DEVOLUCION_COMPRAS, CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, CTA_ABONO_VENTAS ');
        SQL.Add(' FROM CON_CUENTAS_GES_FAM ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' FAMILIA = ?FAMILIA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FAMILIA'].AsString := Sender.AsString;
        ExecQuery;
        QMArticulosPAIS.AsString := FieldByName['PAIS'].AsString;
        QMArticulosTIPO_IVA.AsInteger := FieldByName['TIPO_IVA'].AsInteger;
        QMArticulosCTA_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
        QMArticulosCTA_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
        QMArticulosCTA_DEVOLUCION_COMPRAS.AsString := FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
        QMArticulosCTA_DEVOLUCION_VENTAS.AsString := FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
        QMArticulosCTA_ABONO_COMPRAS.AsString := FieldByName['CTA_ABONO_COMPRAS'].AsString;
        QMArticulosCTA_ABONO_VENTAS.AsString := FieldByName['CTA_ABONO_VENTAS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (QMArticulos.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TIPO_REGISTRO_FITOSANITARIO, DISPONIBILIDAD, ACTUALIZA_VENTA FROM ART_FAMILIAS WHERE EMPRESA = :EMPRESA AND FAMILIA = :FAMILIA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['FAMILIA'].AsString := Sender.AsString;
           ExecQuery;
           QMArticulosDISPONIBILIDAD.AsInteger := FieldByName['DISPONIBILIDAD'].AsInteger;
           QMArticulosTIPO_REGISTRO_FITOSANITARIO.AsString := FieldByName['TIPO_REGISTRO_FITOSANITARIO'].AsString;
           QMArticulosACTUALIZA_VENTA.AsInteger := FieldByName['ACTUALIZA_VENTA'].AsInteger;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  { XAVI COMENTO TEMA DE INICIALIZACIÓN DEL CÓDIGO DE ARTICULO
  if (QMArticulos.State = dsInsert) and (QMArticulosTIPO_ARTICULO_TYC.AsString = 'K') then
     Z_RellenaKit;
 }
end;

procedure TDMArticulos.Busca(EBusca: TEdit);
begin
  DMMain.Busca(EBusca.Text, QMArticulos, 'ARTICULO', 'TITULO', '11100');
end;

procedure TDMArticulos.QMArticulosTIPO_IVAChange(Sender: TField);
begin
  with xTipoIva do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IVA'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMArticulos.QMArticulosBeforePost(DataSet: TDataSet);
var
  Param_ARTCODI001 : string;
  MensajeDeError : TStrings;
  i, id_a : integer;
begin
  if (QMArticulosDISPONIBILIDAD.AsString = '') or (QMArticulosPTO_VERDE.AsString = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT VENTA, PTO_VERDE ');
           SQL.Add(' FROM CON_CUENTAS_GES_FAM ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' FAMILIA = ?FAMILIA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FAMILIA'].AsString := QMArticulosFAMILIA.AsString;
           ExecQuery;
           if (QMArticulosPTO_VERDE.AsString = '') then
              QMArticulosPTO_VERDE.AsFloat := FieldByName['PTO_VERDE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  QMArticulosENTRADA.AsInteger := REntorno.Entrada;

  if (DataSet.State = dsInsert) then
  begin
     QMArticulosARTICULO.AsString := Trim(QMArticulosARTICULO.AsString);

     id_a := DameIDArticulo(QMArticulosARTICULO.AsString);
     if (id_a = 0) then
        DMMain.Contador_Gen(DataSet, 'ID_ARTICULOS', 'ID_A')
     else
        QMArticulosID_A.AsInteger := id_a;

     DMMain.Contador_Gen(DataSet, 'ID_ARTICULOS_CUENTAS', 'ID_C_A');

     // Si codigo de articulo esta vacio lo genero mediante formula.
     // (INDELEC, VCVAUTO) - Si el articulo es vacio codificamos como FFF-SS-NNN (Familia+Subfamilia+MaxContador)
     Param_ARTCODI001 := LeeParametro('ARTCODI001');
     if ((QMArticulosARTICULO.AsString = '') and (Param_ARTCODI001 <> '')) then
     begin
        QMArticulosARTICULO.AsString := DMMain.DameCodigoArticulo(Param_ARTCODI001, QMArticulosFAMILIA.AsString, QMArticulosSUBFAMILIA.AsString);
     end;

     {TODO (sfg_jla): Los campos que no son de si tipo les damos un valor por defecto para que no de error de NULL}
     if (QMArticulosTIPO_ARTICULO_TYC.AsString <> 'A') and (QMArticulosTIPO_ARTICULO_TYC.AsString <> 'T') then
        QMArticulosZ_MODELO.AsString := 'ZZZ';

     if (QMArticulosTIPO_ARTICULO_TYC.AsString <> 'T') then
     begin
        QMArticulosZ_ARMAZON.AsString := 'Z';
        QMArticulosZ_LONA.AsString := 'Z';
     end;

     if (QMArticulosTIPO_ARTICULO_TYC.AsString <> 'L') then
     begin
        QMArticulosZ_LONA_TIPO.AsString := 'Z';
        QMArticulosZ_LONA_FORMA.AsString := 'Z';
     end;

     if (QMArticulosTIPO_ARTICULO_TYC.AsString <> 'C') and (QMArticulosTIPO_ARTICULO_TYC.AsString <> 'K') then
        QMArticulosZ_TIPO_LACADO.AsString := 'ZZ';
  end;

  // Parametros ARTALFA00n se utiliza para verificar que no haya otro articulo con el mismo ALFA_n
  for i := 1 to 8 do
  begin
     if (LeeParametro(Format('ARTALFA00%d', [i])) = 'S') then
     begin
        if (QMArticulos.FieldByName(Format('ALFA_%d', [i])).AsString > ' ') then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT ARTICULO FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ARTICULO <> ?ARTICULO AND ' + Format('ALFA_%d', [i]) + ' = ?ALFA';
                 Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
                 Params.ByName['ALFA'].AsString := QMArticulos.FieldByName(Format('ALFA_%d', [i])).AsString;
                 ExecQuery;
                 if (FieldByName['ARTICULO'].AsString <> '') then
                    ShowMessage(Format(_('Ya existe otro articulo con mismo %s (Art. "%s")'), [LeeParametro(format('ARTDESC%3.3d', [i])), FieldByName['ARTICULO'].AsString]));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  end;

  if DMMain.EstadoKri(170) = 1 then {dji lrk kri Estanterías Navarrete}
  begin
     MensajeDeError := TStringList.Create;
     try
        if (QMArticulosALFA_4.AsString > ' ') then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT ARTICULO, TITULO FROM ART_ARTICULOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' ARTICULO <> :ARTICULO AND ');
                 SQL.Add(' ((ALFA_4 = :ESTANTERIA) OR (ALFA_5 = :ESTANTERIA)) ');
                 Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
                 Params.ByName['ESTANTERIA'].AsString := QMArticulosALFA_4.AsString;
                 ExecQuery;
                 if (FieldByName['ARTICULO'].AsString <> '') then
                    MensajeDeError.Add(FieldByName['ARTICULO'].AsString + ' ' + FieldByName['TITULO'].AsString);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        if (QMArticulosALFA_5.AsString > ' ') then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT ARTICULO, TITULO FROM ART_ARTICULOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' ARTICULO <> :ARTICULO AND ');
                 SQL.Add(' ((ALFA_4 = :ESTANTERIA) OR (ALFA_5 = :ESTANTERIA)) ');
                 Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
                 Params.ByName['ESTANTERIA'].AsString := QMArticulosALFA_5.AsString;
                 ExecQuery;
                 if (FieldByName['ARTICULO'].AsString <> '') then
                    MensajeDeError.Add(FieldByName['ARTICULO'].AsString + ' ' + FieldByName['TITULO'].AsString);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        if MensajeDeError.Count > 0 then
        begin
           MensajeDeError.Insert(0, _('Estanteria ocupada tambien por el/los articulo/s :'));
           MessageDlg(MensajeDeError.Text, mtInformation, [mbOK], 0);
        end;
     finally
        MensajeDeError.Free;
     end;
  end;

  // Calculo el CRC de las notas para poder agrupar
  QMArticulosCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMArticulosNOTAS));
  QMArticulosCRC_NOTAS_COMPRAS.AsString := CalcCRC32Str(FMain.DameTexto(QMArticulosNOTAS_COMPRAS));
  QMArticulosCRC_NOTAS_VENTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMArticulosNOTAS_VENTAS));
  if (DMMain.EstadoKri(23) = 1) then
     QMArticulosTITULO.AsString := '';
end;

procedure TDMArticulos.AutoCuentaFam;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_AUTO_CUENTA_FAM(:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArticulos.Refresh;
end;

procedure TDMArticulos.AutoCuentaTodos(Modo: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_AUTO_CUENTAS(:EMPRESA, :EJERCICIO, :CANAL, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArticulos.Refresh;
end;

procedure TDMArticulos.QMProveedoresTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloProveedor(QMProveedoresPROVEEDOR.AsInteger);
end;

procedure TDMArticulos.BusquedaCompleja;
var
  Orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMArticulos, '11100', False) <> mrCancel) then
  begin
     with QMArticulos do
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
           SelectSQL.Add('AND FAMILIA<>''' + REntorno.FamSistema + '''');
        Ordenar(Orden);
     end;
  end;

  QMArticulos.Open;
end;

procedure TDMArticulos.QMProveedoresBeforeEdit(DataSet: TDataSet);
begin
  if QMProveedores.RecordCount = 0 then
     QMProveedores.Cancel;
end;

procedure TDMArticulos.QMArtStocksBeforeEdit(DataSet: TDataSet);
begin
  if QMArtStocks.RecordCount = 0 then
     QMArtStocks.Cancel;
end;

procedure TDMArticulos.RefrescarDatos;
begin
  with QMArticuloTarifas do
  begin
     Close;
     Open;
  end;
end;

procedure TDMArticulos.QMArticulosUNIDADESChange(Sender: TField);
begin
  with xUnidades do
  begin
     Close;
     Params.ByName['UNIDADES'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMArticulos.QMArtStocksfabricablesGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_MAXIMA_FABRICACION(:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, :ID_A)';
        Params.ByName['EMPRESA'].AsInteger := QMArtStocksEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMArtStocksCANAL.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMArtStocksARTICULO.AsString;
        Params.ByName['ALMACEN'].AsString := QMArtStocksALMACEN.AsString;
        Params.ByName['ID_A'].AsInteger := QMArtStocksID_A.AsInteger;
        ExecQuery;
        Text := FloatToStr(FieldByName['VALOR'].AsFloat);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.HabilitaFabricacion(var hab: smallint);
begin
  if (QMArticulosVIRTUAL.Value = 0) and (QMArticulosABIERTO.Value = 1) then
     hab := 1;
end;

procedure TDMArticulos.Fabricar_Articulo(can_fabricar: double; unidades_ext: double);
begin
  // Fabricacion con modo 0, aunque no haya existencias de los componentes
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE A_ART_FABRICA_ARTICULO ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :CANTIDAD, ');
        SQL.Add(' :UNIDADES_EXT, :ALMACEN, :ENTRADA, :MODO, :ID_A, :FECHA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.Value;
        Params.ByName['CANTIDAD'].AsFloat := can_fabricar;
        Params.ByName['UNIDADES_EXT'].AsFloat := unidades_ext;
        Params.ByName['ALMACEN'].AsString := QMArtStocksALMACEN.Value;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MODO'].AsInteger := 0;
        Params.ByName['ID_A'].AsInteger := QMArtStocksID_A.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArtstocks.Refresh;
end;

procedure TDMArticulos.DesFabricar_Articulo(can_fabricar: double; unidades_ext: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE A_ART_DESFABRICA_ARTICULO ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :CANTIDAD, ');
        SQL.Add(' :UNIDADES_EXT, :ALMACEN, :ENTRADA, :ID_A, :FECHA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.Value;
        Params.ByName['CANTIDAD'].AsFloat := can_fabricar;
        Params.ByName['UNIDADES_EXT'].AsFloat := unidades_ext;
        Params.ByName['ALMACEN'].AsString := QMArtStocksALMACEN.Value;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_A'].AsInteger := QMArtStocksID_A.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArtstocks.Refresh;
end;

procedure TDMArticulos.QMCodigoBarraBeforePost(DataSet: TDataSet);
var
  Prefijo, Codigo : string;
  Tipo, Longitud : integer;
begin
  Tipo := QMCodigoBarraTIPO.AsInteger;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT LONGITUD FROM SYS_TIPO_CODIGO_BARRAS WHERE TIPO = ?TIPO';
        Params.ByName['TIPO'].AsInteger := Tipo;
        ExecQuery;
        Longitud := FieldByName['LONGITUD'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si es tipo EAN13 y esta en blanco genera uno propio nuevo
  if (QMCodigoBarraBARRAS.Value = '') and (Tipo = 3) then
  begin
     Prefijo := DigitosBarras;
     Codigo := IntToStr(DMMain.Contador_E('XCB'));
     while (12 > Length(Prefijo + Codigo)) do
        Codigo := '0' + Codigo;

     QMCodigoBarraBARRAS.AsString := Prefijo + Codigo + IntToStr(Modulo10(Prefijo + Codigo));
  end;

  // Si me dan los primeros 7 numeros caluclo el digito de control EAN8
  if ((Tipo = 2) and (Length(QMCodigoBarraBARRAS.AsString) = Longitud - 1)) then
     QMCodigoBarraBARRAS.AsString := QMCodigoBarraBARRAS.AsString + Codigo + IntToStr(Modulo10(QMCodigoBarraBARRAS.AsString + Codigo));

  // Si me dan los primeros 12 numeros caluclo el digito de control EAN13
  if ((Tipo = 3) and (Length(QMCodigoBarraBARRAS.AsString) = Longitud - 1)) then
     QMCodigoBarraBARRAS.AsString := QMCodigoBarraBARRAS.AsString + Codigo + IntToStr(Modulo10(QMCodigoBarraBARRAS.AsString + Codigo));

  // Si me dan los primeros 13 numeros caluclo el digito de control DUN14
  if ((Tipo = 6) and (Length(QMCodigoBarraBARRAS.AsString) = Longitud - 1)) then
     QMCodigoBarraBARRAS.AsString := QMCodigoBarraBARRAS.AsString + Codigo + IntToStr(Modulo10(QMCodigoBarraBARRAS.AsString + Codigo));

  // Puedo validar mediante Modulo10 codigos EAN8, EAN13, DUN14 y quizas ISBN
  if ((Tipo in [2, 3, 6]) and (not CodigoEANValido(QMCodigoBarraBARRAS.AsString))) then
  begin
     QMCodigoBarra.Cancel;
     raise Exception.Create(_('Codigo Ean Incorrecto'));
  end;
end;

procedure TDMArticulos.QMCodigoBarraNewRecord(DataSet: TDataSet);
begin
  QMCodigoBarraEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  QMCodigoBarraARTICULO.AsString := QMArticulosARTICULO.AsString;
  QMCodigoBarraID_A.AsInteger := QMArticulosID_A.AsInteger;

  // Introduce funcion 1 como corresponde codigo barra para venta
  QMCodigoBarraFUNCION.AsInteger := 1;

  // Valor por defecto para TIPO en código de barras de artículos (estado 28 sustituido por el parametro TIPBARR001)
  // Definido en SYS_TIPO_CODIGO_BARRAS
  QMCodigoBarraTIPO.AsInteger := StrToIntDef(LeeParametro('TIPBARR001'), 1);
  if (QMCodigoBarraTIPO.AsInteger = 3) then
     QMCodigoBarraBARRAS.AsString := DigitosBarras;
end;

procedure TDMArticulos.QMCodigoBarraTIPOChange(Sender: TField);
begin
  with xTitulos do
  begin
     Close;
     Open;
     QMCodigoBarraTITULO.AsString := xTitulos.FieldByName('TITULO').AsString;
  end;
end;

procedure TDMArticulos.QMArticulosDISPONIBILIDADChange(Sender: TField);
begin
  with xDisponibilidad do
  begin
     Close;
     Open;
  end;
end;

{ **********  Abrir y cerrar las tablas por pestañas  ********** }

procedure TDMArticulos.AbrirFicha;
begin
  xTipoIVA.Open;
  xDisponibilidad.Open;
  xUnidades.Open;
  xTipoGarantia.Open;
end;

procedure TDMArticulos.CerrarFicha;
begin
  xTipoIVA.Close;
  xDisponibilidad.Close;
  xUnidades.Close;
  xTipoGarantia.Close;
end;

procedure TDMArticulos.AbrirHistorico;
begin
  xHistCoste.Open;
end;

procedure TDMArticulos.CerrarHistorico;
begin
  xHistCoste.Close;
end;

procedure TDMArticulos.AbrirStock;
begin
  with QMArtStocks do
  begin
     DisableControls;
     try
        Open;
        if (AlmacenBeforeScroll <> '') then
        begin
           while ((QMArtStocksALMACEN.AsString <> AlmacenBeforeScroll) and not EOF) do
              Next;
        end
        else
        begin
           while (not QMArtStocks.EOF) and (QMArtStocksALMACEN.AsString <> REntorno.AlmacenDefecto) do
              QMArtStocks.Next;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMArticulos.CerrarStock;
begin
  QMArtStocks.Close;
end;

procedure TDMArticulos.AbrirPrecios;
begin
  xTipoIVA.Open;
  QMArticuloTarifas.Open;
  QMArticulosPrecios.Open;
end;

procedure TDMArticulos.CerrarPrecios;
begin
  xTipoIVA.Close;
  QMArticuloTarifas.Close;
  QMArticulosPrecios.Close;
end;

procedure TDMArticulos.AbrirProveedores;
begin
  QMProveedores.Open;
  QMProvArt.Open;
  QMCondiciones.Open;
  xTarfiasProveedor.Open;
end;

procedure TDMArticulos.CerrarProveedores;
begin
  QMProveedores.Close;
  QMProvArt.Close;
  QMCondiciones.Close;
  xTarfiasProveedor.Close;
end;

procedure TDMArticulos.AbrirCodBarras;
begin
  QmCodigoBarra.Close;
  QmCodigoBarra.Open;
end;

procedure TDMArticulos.CerrarCodBarras;
begin
  QmCodigoBarra.Close;
end;

procedure TDMArticulos.AbrirSeries;
begin
  QMSeries.Open;
end;

procedure TDMArticulos.AbrirAgrupacion;
begin
  xAgrupDisp.Open;
  xAgrupSon.Open;
end;

procedure TDMArticulos.CerrarAgrupacion;
begin
  xAgrupDisp.Close;
  xAgrupSon.Close;
end;

procedure TDMArticulos.CerrarCuentas;
begin
  QMSeries.Close;
  QMProyectos.Close;
  QMProyectosSeries.Close;
end;

{ Después de INSERTAR o MODIFICAR => Grabar y Actualizar Cod.Barras }
procedure TDMArticulos.QMCodigoBarraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);  // Grabar primero
  AbrirCodBarras;
end;

{ BORRAR => Actualiza Cod.Barras }
procedure TDMArticulos.QMCodigoBarraAfterDelete(DataSet: TDataSet);
begin
  AbrirCodBarras;
end;

procedure TDMArticulos.QMProvArtNewRecord(DataSet: TDataSet);
begin
  QMProvArtEMPRESA.AsInteger := REntorno.Empresa;
  QMProvArtARTICULO.Value := QMArticulosARTICULO.Value;
  QMProvArtID_A.AsInteger := QMArticulosID_A.AsInteger;
end;

procedure TDMArticulos.QMProvArtPROVEEDORChange(Sender: TField);
begin
  QMProvArtNOMBRE_PROVEEDOR.AsString := DameTituloProveedor(Sender.AsInteger);
end;

procedure TDMArticulos.QMProvArtBeforePost(DataSet: TDataSet);
begin
  QMProvArtCODIGO_PROVEEDOR.AsString := UpperCase(Trim(QMProvArtCODIGO_PROVEEDOR.AsString));
end;

function TDMArticulos.Calcula_UnidadesExt: double;
begin
  if QMArticulosCONTROLA_MEDIDAS.AsInteger <> 0 then
     Result := DevuelveValor(QMArticulos, Self)
  else
     Result := 0;
end;

procedure TDMArticulos.ListarCodBarras(ICodBarras: TImage);
var
  Modo,{djir lrk kri - no se utiliza tipo,}CantidadEtiquetas, CantidadEtiquetsEnBlanco, Origen, Valorado, UsarBultos : integer;
  Tarifa : string;
  Form : TFPregCodBarras;
  dm : TDMLstEtiquetas;
  Texto1, Texto2, Texto3, Idioma : string;
begin
  Origen := 1;
  Form := TFPregCodBarras.Create(Self);
  Form.Muestrate(Modo, CantidadEtiquetas, CantidadEtiquetsEnBlanco, Origen, Valorado, UsarBultos, Tarifa, Texto1, Texto2, Texto3, Idioma);
  if (Modo < 2) then
  begin
     dm := nil;
     AbreData(TDMLstEtiquetas, dm);

     dm.Texto1 := Texto1;
     dm.Texto2 := Texto2;
     dm.Texto3 := Texto3;
     dm.Idioma := Idioma;

     dm.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal,
        '', 0, QMArticulosARTICULO.AsString, CantidadEtiquetas, CantidadEtiquetsEnBlanco, Modo, Origen,
        Tarifa, 0, Valorado, QMCodigoBarraBARRAS.AsString, 0);
     CierraData(dm);
  end;
end;

procedure TDMArticulos.QMArtStocksExistFabrGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  /// Cálculo de las existencias a fabricar teniendo en cuenta la posible fabricación de sus componentes

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_MAXIMA_FABRICACION_ESC(:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, :ID_A)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := QMArtStocksARTICULO.AsString;
        Params.ByName['ALMACEN'].AsString := QMArtStocksALMACEN.AsString;
        Params.ByName['ID_A'].AsInteger := QMArtStocksID_A.AsInteger;
        ExecQuery;
        Text := FloatToStr(FieldByName['VALOR'].AsFloat);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.QMArticulosGARANTIAChange(Sender: TField);
begin
  with xTipoGarantia do
  begin
     Close;
     Open;
  end;
end;

function TDMArticulos.DameProduccion: integer;
begin
  Result := QMArticulosPRODUCCION.AsInteger;
end;

function TDMArticulos.DameArticulo: string;
begin
  Result := QMArticulosARTICULO.AsString;
end;

procedure TDMArticulos.QMSeriesNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  with (TFIBTableSet(DataSet)) do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('ARTICULO').AsString := QMArticulosARTICULO.AsString;
     FieldByName('ID_C_A').AsInteger := QMArticulosID_C_A.AsInteger;

     // Cuentas
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE DAME_CUENTAS_COMPRA_VENTA(:EMPRESA, :EJERCICIO, :CANAL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
        end;
        FieldByName('CTA_COMPRAS').AsString := Q.FieldByName['CTA_COMPRAS'].AsString;
        FieldByName('CTA_VENTAS').AsString := Q.FieldByName['CTA_VENTAS'].AsString;
        FieldByName('CTA_DEVOLUCION_COMPRAS').AsString := Q.FieldByName['CTA_DEV_COMPRAS'].AsString;
        FieldByName('CTA_DEVOLUCION_VENTAS').AsString := Q.FieldByName['CTA_DEV_VENTAS'].AsString;
        FieldByName('CTA_ABONO_COMPRAS').AsString := Q.FieldByName['CTA_COMPRAS'].AsString;
        FieldByName('CTA_ABONO_VENTAS').AsString := Q.FieldByName['CTA_VENTAS'].AsString;
        Q.FreeHandle;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMArticulos.Heredar;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_HEREDA_CUENTAS_FAMILIA(:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :ID_C_A, :ID_A)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
        Params.ByName['ID_C_A'].AsInteger := QMArticulosID_C_A.AsInteger;
        Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMSeries.Close;
  QMSeries.Open;
  QMProyectos.Open;
  QMProyectos.Close;
  QMProyectosSeries.Open;
  QMProyectosSeries.Close;
end;

// Generar de forma automática los Cod.Barras de los artículos
// que no tengan Cod.Barras asociado
procedure TDMArticulos.GenerarCodBarrasAuto(Tipo, Stock: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_GENERAR_COD_BARRAS(:EMPRESA, :TIPO, :STOCK)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO'].AsInteger := Tipo;
        Params.ByName['STOCK'].AsInteger := Stock;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // QMArticulos.Refresh;
end;

procedure TDMArticulos.RefrescarDMArticulos;
var
  id_a : integer;
begin
  // Guardo el ID para volver a posicionarme
  id_a := QMArticulosID_A.AsInteger;

  // Utilizo esto para abrir y cerrar la tabla de articulos
  CambiaFamiliaSistema(False);

  // Voy al registro 
  with QMArticulos do
  begin
     DisableControls;
     try
        while ((not EOF) and (QMArticulosID_A.AsInteger <> id_a)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMArticulos.QMArticulosAfterCancel(DataSet: TDataSet);
begin
  id_a_duplicado := -1;
  id_c_a_duplicado := -1;
  Proveedor := 0;
  CodProv := '';
end;

procedure TDMArticulos.QMArticulosAfterScroll(DataSet: TDataSet);
begin
  if (not Posicionando) then
  begin
     EstableceMascaraUnidades;

     RellenaDatosArticulo(OldArticulo); // Guardo los datos del articulo para compararlo en el Post y ver si ha cambiado
  end;
end;

// Leer el Flag de INSERTAR_CB
function TDMArticulos.ConfigCBarras: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT INSERTAR_CB FROM SYS_CONSTANTES';
        ExecQuery;
        Result := (FieldByName['INSERTAR_CB'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Escribir el Flag de INSERTAR_CB
procedure TDMArticulos.EscribirConfigCBarras(Flag: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET INSERTAR_CB = :INSERTAR_CB';
        Params.ByName['INSERTAR_CB'].AsInteger := BoolToInt(Flag);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.MueveAgrupacion(Rellena: boolean);
var
  DS : TFIBDataSet;
begin
  if (Rellena) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_AGRUPACIONES_RELLENA_ART(:AGRUPACION, :EMPRESA, :ARTICULO, :ID_A)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
           Params.ByName['AGRUPACION'].AsString := xAgrupDisp.FieldByName('AGRUPACION').AsString;
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM EMP_AGRUPACIONES_ART WHERE AGRUPACION = :AGRUPACION AND ID_A = :ID_A';
           Params.ByName['AGRUPACION'].AsString := xAgrupSon.FieldByName('AGRUPACION').AsString;
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Si pertenece a un modelo de Talas y Colores,
  // pregunto si desea modificar los datos del resto de articulos del modelo
  if (QMArticulosID_A_M_C_T.AsInteger > 0) then
  begin
     if (Application.MessageBox(PChar(string(_('El articulo ha cambiado. ¿Desea modificar los articulos del mismo modelo?'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes) then
     begin
        // Aqui debemos modificar los datos de los artículos que pertenecen al mismo modelo/color
        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT ART.ARTICULO, ART.ID_A ');
                 SelectSQL.Add(' FROM ART_ARTICULOS ART ');
                 SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ');
                 SelectSQL.Add(' ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
                 SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ');
                 SelectSQL.Add(' ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' ART.ARTICULO <> :ARTICULO AND ');
                 SelectSQL.Add(' AMC.ID_A_M = ');
                 // id_a_m es el modelo del articulo
                 SelectSQL.Add(' (SELECT ');
                 SelectSQL.Add('  AMC.ID_A_M ');
                 SelectSQL.Add('  FROM ART_ARTICULOS ART ');
                 SelectSQL.Add('  JOIN ART_ARTICULOS_M_C_TALLAS AMCT ');
                 SelectSQL.Add('  ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
                 SelectSQL.Add('  JOIN ART_ARTICULOS_MOD_COLOR AMC ');
                 SelectSQL.Add('  ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
                 SelectSQL.Add('  WHERE ART.EMPRESA = :EMPRESA AND ART.ARTICULO = :ARTICULO) ');
                 Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
                 Open;

                 // Recorremos los articulos del modelo ejecutando la accion necesaria
                 while not EOF do
                 begin
                    if (Rellena) then
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'EXECUTE PROCEDURE E_AGRUPACIONES_RELLENA_ART(:AGRUPACION, :EMPRESA, :ARTICULO, :ID_A)';
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['ARTICULO'].AsString := DS.FieldByName('ARTICULO').AsString;
                             Params.ByName['AGRUPACION'].AsString := xAgrupDisp.FieldByName('AGRUPACION').AsString;
                             Params.ByName['ID_A'].AsInteger := DS.FieldByName('ID_A').AsInteger;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end
                    else
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'DELETE FROM EMP_AGRUPACIONES_ART WHERE AGRUPACION = :AGRUPACION AND ID_A = :ID_A';
                             Params.ByName['AGRUPACION'].AsString := xAgrupSon.FieldByName('AGRUPACION').AsString;
                             Params.ByName['ID_A'].AsInteger := DS.FieldByName('ID_A').AsInteger;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
                 Transaction := nil;
              end;
           end;
        finally
           FreeAndNil(DS);
        end;
     end;
  end;

  // Refrescamos datos de agrupaciones
  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMArticulos.InsertarArticulo(aProveedor: integer = 0; aCodProv: string = '');
begin
  Proveedor := aProveedor;
  CodProv := aCodProv;

  with QMArticulos do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_ARTICULOS_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO = '''' ';
     DMMain.FiltraTabla(QMArticulos, '11100', True);
     Insert;
  end;
end;

procedure TDMArticulos.QMArticulosP_COSTE_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  auxver, auxcalculo : double;
begin
  DMMain.Cambios(REntorno.MonedaEmpresa, REntorno.Moneda, REntorno.FechaTrab,
     QMArticulosP_COSTE.AsFloat, auxver, auxcalculo);
  Text := FormatFloat(MascaraMoneda, auxcalculo);
end;

procedure TDMArticulos.QMArticuloTarifasCOMISION_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  auxver, auxcalculo : double;
  auxmoneda : string;
begin
  auxmoneda := QMArticuloTarifasMONEDA.AsString;
  if (auxmoneda <> REntorno.Moneda) then
  begin
     DMMain.Cambios(auxmoneda, REntorno.Moneda, REntorno.FechaTrab,
        QMArticuloTarifasCOMISION.AsFloat, auxver, auxcalculo);
     Text := FormatFloat(MascaraMoneda, auxcalculo);
  end
  else
     Text := FormatFloat(MascaraMoneda, QMArticuloTarifasCOMISION.AsFloat);
end;

procedure TDMArticulos.QMArticuloTarifasPRECIO_VENTA_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  auxver, auxcalculo : double;
  auxmoneda : string;
begin
  auxmoneda := QMArticuloTarifasMONEDA.AsString;
  if (auxmoneda <> REntorno.Moneda) then
  begin
     DMMain.Cambios(auxmoneda, REntorno.Moneda, REntorno.FechaTrab,
        QMArticuloTarifasPRECIO_VENTA.AsFloat, auxver, auxcalculo);
     Text := FormatFloat(MascaraMoneda, auxcalculo);
  end
  else
     Text := FormatFloat(MascaraMoneda, QMArticuloTarifasPRECIO_VENTA.AsFloat);
end;

procedure TDMArticulos.QMArticulosPreciosAfterPost(DataSet: TDataSet);
begin
  QMArticuloTarifas.Close;
  QMArticuloTarifas.Open;
end;

procedure TDMArticulos.QMArticuloTarifasPRECIO_VENTA_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  auxver, auxcalculo : double;
  auxmoneda : string;
begin
  auxmoneda := QMArticuloTarifasMONEDA.AsString;
  if (auxmoneda <> REntorno.Moneda) then
  begin
     DMMain.Cambios(auxmoneda, auxmoneda, REntorno.FechaTrab,
        QMArticuloTarifasPRECIO_VENTA.AsFloat, auxver, auxcalculo);
     Text := FormatFloat(DMMain.MascaraMoneda(auxmoneda, 0), auxcalculo);
  end;
  Text := FormatFloat(DMMain.MascaraMoneda(auxmoneda, 0), QMArticuloTarifasPRECIO_VENTA.AsFloat);
end;

procedure TDMArticulos.RecalculaPB;
begin
  /// Recalculo de los precios base.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_ARTICULOS_PRECIOS SET ENTRADA = ENTRADA WHERE ID_A = :ID_A';
        Params.ByName['ID_A'].AsInteger := QMArticulosID_a.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.QMArticuloTarifasNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMArticulos.GrabaSinActualizar(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMArticulos.SetEditaPrecios;
begin
  if (QMArticuloTarifas.State <> dsEdit) then
     QMArticuloTarifas.Edit;
end;

procedure TDMArticulos.QMArticuloTarifasPRECIO_BASE_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMArticuloTarifasMONEDA.AsString, 0), QMArticuloTarifasPRECIO_BASE.AsFloat);
end;

procedure TDMArticulos.QMArticulosPreciosAfterOpen(DataSet: TDataSet);
begin
  xTiposRedondeo.Open;
  xTiposPreciosBase.Open;
end;

procedure TDMArticulos.QMArticulosPreciosTIPO_REDONDEOChange(Sender: TField);
begin
  xTiposRedondeo.Close;
  xTiposRedondeo.Open;
end;

procedure TDMArticulos.PropagaMargen;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ACTUALIZA_MARGEN_PRECIOS(:ID_A)';
        Params.ByName['ID_A'].AsInteger := QMArticulosID_a.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArticulos.Refresh;
end;

procedure TDMArticulos.QMProvArtAfterDelete(DataSet: TDataSet);
begin
  // Si borra un codigo de prov. tiene que borrar el prov.
  QMProveedores.Close;
  QMProveedores.Open;
end;

procedure TDMArticulos.CambiaFamiliaSistema(Sistema: boolean);
begin
  with SQLBase do
  begin
     Clear;
     Add(' SELECT * FROM VER_ARTICULOS_CUENTAS ');
     Add(' WHERE ');
     Add(' EMPRESA = :EMPRESA AND ');
     Add(' EJERCICIO = :EJERCICIO AND ');
     Add(' CANAL = :CANAL ');
     if Sistema then
        Add(' AND FAMILIA = :FAMILIA ')
     else
        Add(' AND FAMILIA <> :FAMILIA ');
  end;

  Filtrar;
end;

procedure TDMArticulos.RecalculaStock(Option: byte; mostrar_fparada: boolean);
var
  Q : THYFIBQuery;
begin
  if (Option and 4) <> 0 then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_RECALCULA_PONDERA_DOC (?EMPRESA, ?ARTICULO, ?ID_A)';
           Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           // No ejecuta el FParada si viene de FMRecalculoStocksTotales para poder interrumpir el proceso
           if (mostrar_fparada) then
              TFParada.Create(Self).ExecQuery(Q, _('Recalculando el Precio Ponderado en sus Documentos'))
           else
              ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  if (Option and 8) <> 0 then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_RECALCULA_LOTES (?EMPRESA, ?ARTICULO, ?ID_A)';
           Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           // No ejecuta el FParada si viene de FMRecalculoStocksTotales para poder interrumpir el proceso
           if (mostrar_fparada) then
              TFParada.Create(Self).ExecQuery(Q, _('Recalculando los Lotes'))
           else
              ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  if (Option and 16) <> 0 then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_RECALCULA_NSERIE (?EMPRESA, ?ARTICULO, ?ID_A)';
           Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           // No ejecuta el FParada si viene de FMRecalculoStocksTotales para poder interrumpir el proceso
           if (mostrar_fparada) then
              TFParada.Create(Self).ExecQuery(Q, _('Recalculando los Números de Serie'))
           else
              ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     QMNroSerie.Close;
     QMNroSerie.Open;
  end;
end;

procedure TDMArticulos.QMArticulosAfterOpen(DataSet: TDataSet);
begin
  EstableceMascaraUnidades;
  xTipoIva.Close;
  xTipoIva.Open;
  xUnidades.Close;
  xUnidades.Open;
  xTipoGarantia.Close;
  xTipoGarantia.Open;
  xDisponibilidad.Close;
  xDisponibilidad.Open;
  QMPictograma.Close;
  QMPictograma.Open;

  RellenaDatosArticulo(OldArticulo); // Guardo los datos del articulo para compararlo en el Post y ver si ha cambiado
end;

procedure TDMArticulos.QMArticulosBeforeClose(DataSet: TDataSet);
begin
  xTipoIva.Close;
  xUnidades.Close;
  xTipoGarantia.Close;
  xDisponibilidad.Close;
  QMPictograma.Close;
end;

procedure TDMArticulos.QMIdiomasNewRecord(DataSet: TDataSet);
begin
  QMIdiomasEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  QMIdiomasARTICULO.AsString := QMArticulosARTICULO.AsString;
  QMIdiomasID_A.AsInteger := QMArticulosID_A.AsInteger;
end;

procedure TDMArticulos.GrabaIdioma(DataSet: TDataSet);
begin
  if (not TLocal.InTransaction) then
     TLocal.CommitRetaining;
end;

procedure TDMArticulos.AbrirIdiomas;
begin
  QMIdiomas.Close;
  QMIdiomas.Open;
end;

procedure TDMArticulos.CerrarIdiomas;
begin
  QMIdiomas.Close;
end;

function TDMArticulos.DigitosBarras: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT GS1_COMPANY_PREFIX FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := Trim(FieldByName['GS1_COMPANY_PREFIX'].AsString);
     finally
        Free;
     end;
  end;

  if (Result = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ART_COD_BARRAS FROM SYS_CONSTANTES';
           ExecQuery;
           Result := Trim(FieldByName['ART_COD_BARRAS'].AsString)
        finally
           Free;
        end;
     end;

     if (Result = '') then
        Result := '20';
  end;
end;

procedure TDMArticulos.CambiarCodigo(CodigoNuevo: string; BorraOrigen, ReemplazaEscandallo: boolean);
{
var
  Q : THYFIBQuery;
  id_a : integer;
  Continua, D_Barras, O_Barras : boolean;
  Barras : smallint;
}
begin
  /// Elimino esta opción por el peligro que conlleva.
  /// Deshabilita TODOS los trigger y si algo falla no los vuelve a habilitar
  ShowMessage(_('Opcion deshabilitada'));
  {
  Continua := True;
  if ((CodigoNuevo = QMArticulosARTICULO.AsString) and
     (Application.MessageBox(PChar(string(_('ATENCION! El artículo origen y destino son el mismo.' #13#10 + '¿Desea Continuar?'))),
     PChar(string(_('Warning'))), MB_ICONWARNING + MB_OKCANCEL) = idCancel)) then
     Continua := False;

  if (Continua) then
  begin
     Q := THYFIBQuery.Create(Self);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;

           SQL.Text := 'select id_a from art_articulos where empresa=?empresa and articulo=?art_nuevo';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ART_NUEVO'].AsString := CodigoNuevo;
           ExecQuery;
           id_a := FieldByName['ID_A'].AsInteger;
           FreeHandle;

           if (id_a = 0) then
           begin
              SQL.Text := 'execute procedure a_art_duplica(?empresa,?ejercicio,?canal,?art_actual,?art_nuevo,?entrada)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ART_ACTUAL'].AsString := QMArticulosARTICULO.AsString;
              Params.ByName['ART_NUEVO'].AsString := CodigoNuevo;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              //ExecQuery ;
              TFParada.Create(Self).ExecQuery(Q, _('Creando el nuevo artículo'));
              id_a := FieldByName['ID_A'].AsInteger;
              FreeHandle;
           end;

           //Miramos si los artículos tienen código de barras
           Barras := 0;
           SQL.Text := 'select count(*) as contador from art_articulos_barras where id_a=?id_a';
           Params.ByName['ID_A'].AsInteger := ID_A;
           ExecQuery;
           D_Barras := (FieldByName['CONTADOR'].AsInteger > 0);
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           ExecQuery;
           O_Barras := (FieldByName['CONTADOR'].AsInteger > 0);
           if (O_Barras and D_Barras) then
           begin
              // 0 - Mantener los dos
              // 1 - Mantener Origen
              // 2 - Mantener Destino
              Barras := CodBarras(DMArticulos);
           end;

           SQL.Text := 'execute procedure ut_off_triggers';
           //ExecQuery;
           TFParada.Create(Self).ExecQuery(Q, _('Preparando proceso'));
           FreeHandle;

           SQL.Text := 'EXECUTE PROCEDURE A_ART_CAMBIA_CODIGO(:EMPRESA, :ART_ACTUAL, :ART_NUEVO, :ENTRADA, :REEMPLAZARESCANDALLO, :BARRAS)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ART_ACTUAL'].AsString := QMArticulosARTICULO.AsString;
           Params.ByName['ART_NUEVO'].AsString := CodigoNuevo;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['REEMPLAZARESCANDALLO'].AsInteger := Ord(ReemplazaEscandallo);
           Params.ByName['BARRAS'].AsInteger := Barras;
           //ExecQuery ;
           //FreeHandle;
           TFParada.Create(Self).ExecQuery(Q, _('Cambiando el Código del Artículo'));
           FreeHandle;
        end;
     finally
        Q.SQL.Text := 'execute procedure ut_on_triggers';
        TFParada.Create(Self).ExecQuery(Q, _('Restaurando sistema'));
        FreeHandle;
        FreeAndNil(Q);
     end;
     RecalculaStockArt(QMArticulosARTICULO.AsString, QMArticulosID_A.AsInteger);
     RecalculaStockArt(CodigoNuevo, Id_a);

     if (BorraOrigen) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'delete from art_articulos where id_a=?id_a';
           Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
           ExecQuery;
           FreeHandle;
        end;
        FreeAndNil(Q);
        TLocal.CommitRetaining;
     end;
     QMArticulos.Transaction.CommitRetaining;
     if not (QMArticulos.Locate('ARTICULO', CodigoNuevo, [])) then
     begin
        QMArticulos.Close;
        QMArticulos.Open;
     end;
  end;
}
end;

procedure TDMArticulos.RecalculaStockArt(Articulo: string);
begin
  // Se regenera tabla de PMP y Stock y se marca como invalido para que se recalcule
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE ART_REGENERA_MOV_STOCKS_PRECIO (:EMPRESA, :ARTICULO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMArticulos.TieneEscandallo(Articulo: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 EMPRESA FROM ART_ARTICULOS_ESCANDALLO WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.AbrirPedidos(SoloPendientes: boolean; Almacen: string; IdCampoOrdenCliente, IdCampoOrdenProveedor: integer);
var
  s : string;
begin
  s := 'X';
  if (Trim(REntorno.SerieRestringida) > '') then
     s := REntorno.SerieRestringida;
  if (not xPedidosDeClientes.Active) then
  begin
     with xPedidosDeClientes.SelectSQL do
     begin
        Clear;
        Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ID_S, D.ALMACEN, C.FECHA, C.CLIENTE, T.NOMBRE_R_SOCIAL TITULO_CLIENTE, C.AGENTE, ');
        Add('        CP.FECHA_ENTREGA_PREV, CP.FECHA_CLIENTE, D.LINEA, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.PRECIO, ');
        Add('        D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.U_SERVIDAS, DP.U_PENDIENTES, ');
        Add('        DP.FECHA_ENTREGA_PREV AS FECHA_ENTREGA_ARTICULO, DP.FECHA_CONF_DET, A.CODIGO_CLIENTE, C.SU_REFERENCIA, ');
        Add('        C.PEDIDO_CLIENTE, DP.FECHA_REC_DET, D.ID_DETALLES_S, DP.SERVIDO ');
        Add(' FROM GES_CABECERAS_S C ');
        Add(' JOIN GES_CABECERAS_S_PED CP ON C.ID_S = CP.ID_S ');
        Add(' JOIN GES_DETALLES_S D ON CP.ID_S = D.ID_S ');
        Add(' JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETALLES_S ');
        Add(' JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = CL.CLIENTE ');
        Add(' JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN ART_ARTICULOS_CODCLI A ON C.EMPRESA = A.EMPRESA AND C.CLIENTE = A.CLIENTE AND D.ARTICULO = A.ARTICULO ');
        Add(' WHERE ');
        Add(' C.EMPRESA = :EMPRESA AND ');
        Add(' ((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE ''X%'')) AND ');
        Add(' C.TIPO = ''PEC'' ');
        if (SoloPendientes) then
           Add(' AND C.ESTADO = 0 AND ABS(DP.U_PENDIENTES) > 0.01 AND DP.SERVIDO = 0 ');
        Add(' AND D.ID_A = :ID_A ');
        if (Almacen <> 'Todos') then
           Add(' AND D.ALMACEN = ''' + Almacen + ''' ');

        Add(' UNION ');
        Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ID_S, D.ALMACEN, C.FECHA, C.CLIENTE, T.NOMBRE_R_SOCIAL TITULO_CLIENTE, C.AGENTE, ');
        Add('        CP.FECHA_ENTREGA_PREV, CP.FECHA_CLIENTE, D.LINEA, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.PRECIO, ');
        Add('        D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.U_SERVIDAS, DP.U_PENDIENTES * ESC.CANTIDAD, ');
        Add('        DP.FECHA_ENTREGA_PREV AS FECHA_ENTREGA_ARTICULO, DP.FECHA_CONF_DET, A.CODIGO_CLIENTE, C.SU_REFERENCIA, ');
        Add('        C.PEDIDO_CLIENTE, DP.FECHA_REC_DET, D.ID_DETALLES_S, DP.SERVIDO ');
        Add(' FROM GES_CABECERAS_S C ');
        Add(' JOIN GES_CABECERAS_S_PED CP ON C.ID_S = CP.ID_S ');
        Add(' JOIN GES_DETALLES_S D ON CP.ID_S = D.ID_S ');
        Add(' JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETALLES_S ');
        Add(' JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = CL.CLIENTE ');
        Add(' JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO ');
        Add(' JOIN ART_ARTICULOS_ESCANDALLO ESC ON D.ID_A = ESC.ID_A ');
        Add(' LEFT JOIN ART_ARTICULOS_CODCLI A ON C.EMPRESA = A.EMPRESA AND C.CLIENTE = A.CLIENTE AND ESC.DETALLE = A.ARTICULO ');
        Add(' WHERE ');
        Add(' C.EMPRESA = :EMPRESA AND ');
        Add(' ((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE ''X%'')) AND ');
        Add(' C.TIPO = ''PEC'' ');
        if (SoloPendientes) then
           Add(' AND C.ESTADO = 0 AND ABS(DP.U_PENDIENTES) > 0.01 AND DP.SERVIDO = 0 ');
        Add(' AND ESC.ID_A_DET = :ID_A ');
        if (Almacen <> 'Todos') then
           Add(' AND D.ALMACEN = ''' + Almacen + ''' ');

        Add(' UNION ');
        Add(' SELECT O.EMPRESA, O.EJERCICIO, O.CANAL, O.SERIES, ''ORD'', O.RIG_OF, O.ID_ORDEN, M.ALMACEN, O.FECHA_ORD, O.CLIENTE, T.NOMBRE_R_SOCIAL TITULO_CLIENTE, CL.AGENTE, ');
        Add('        O.FECHA_ENTREGA, O.FECHA_PED, M.LINEA_MAT, M.COMPONENTE, AR.TITULO, M.ID_A, M.UNIDADES_STOCK, M.PRE_COS_UNI, ');
        Add('        0, 0, 0, 0 /*B_IMPONIBLE*/ , 0 /*U_SERVIDAS*/ , M.UNIDADES_STOCK /*U_PENDIENTES*/ , ');
        Add('        O.FECHA_ENTREGA /*FECHA_ENTREGA_ARTICULO*/ , O.FECHA_ENTREGA /*FECHA_CONF_DET*/ , A.CODIGO_CLIENTE, '''' /*SU_REFERENCIA*/ , ');
        Add('        '''' /*PEDIDO_CLIENTE*/ , O.FECHA_ENTREGA /*FECHA_REC_DET*/ , M.ID_ORDEN_MAT, 0 /*SERVIDO*/ ');
        Add(' FROM PRO_ORD O ');
        Add(' JOIN PRO_ORD_MAT M ON O.ID_ORDEN = M.ID_ORDEN ');
        Add(' JOIN EMP_CLIENTES CL ON O.EMPRESA = CL.EMPRESA AND O.CLIENTE = CL.CLIENTE ');
        Add(' JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO ');
        Add(' JOIN ART_ARTICULOS AR ON M.EMPRESA = AR.EMPRESA AND M.COMPONENTE = AR.ARTICULO ');
        Add(' LEFT JOIN ART_ARTICULOS_CODCLI A ON O.EMPRESA = A.EMPRESA AND O.CLIENTE = A.CLIENTE AND M.COMPONENTE = A.ARTICULO ');
        Add(' WHERE ');
        Add(' O.EMPRESA = :EMPRESA AND ');
        Add(' ((O.SERIES = :DOC_SERIE) OR (:DOC_SERIE LIKE ''X%'')) AND ');
        Add(' -- DP.U_PENDIENTES > 0 AND ');
        Add(' M.ID_A = :ID_A  ');
        if (SoloPendientes) then
           Add(' AND O.SITUACION < 4 ');
        if (Almacen <> 'Todos') then
           Add(' AND M.ALMACEN = ''' + Almacen + ''' ');

        if (IdCampoOrdenCliente <> 0) then
        begin
           if (IdCampoOrdenCliente > 0) then
              Add('ORDER BY ' + IntToStr(IdCampoOrdenCliente) + ', 8, 2 DESC, 6 DESC, 13 ')
           else
              Add('ORDER BY ' + IntToStr(abs(IdCampoOrdenCliente)) + ' DESC, 8, 2 DESC, 6 DESC, 13 ');
        end
        else
           Add('ORDER BY 8, 2 DESC, 6 DESC, 13 ');
     end;
     xPedidosDeClientes.DataSource := DSQMArticulos;
     xPedidosDeClientes.Params.ByName['DOC_SERIE'].AsString := s;
     xPedidosDeClientes.Open;
  end;

  Application.ProcessMessages;

  if (not xPedidosAProveedor.Active) then
  begin
     with xPedidosAProveedor.SelectSQL do
     begin
        Clear;
        Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR, T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, ');
        Add('        CP.FECHA_PRE_CAB, CP.FECHA_CONFIRMADA_KRI, CP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_CAB, CP.PLAZO_INICIAL_KRI, ');
        Add('        DP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_DET, D.LINEA, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, ');
        Add('        D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.UNIDADES_SERVIDAS, DP.UNIDADES_POR_SERVIR, ');
        Add('        DP.FECHA_CONF_KRI, DP.FECHA_PRE_DET, A.CODIGO_PROVEEDOR, C.SU_REFERENCIA, DP.FECHA_REC_DET, D.ID_DETALLES_E, DP.LINEA_SERVIDA ');
        Add(' FROM GES_CABECERAS_E C ');
        Add(' JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E ');
        Add(' JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E ');
        Add(' JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E ');
        Add(' JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDOR = P.PROVEEDOR ');
        Add(' JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN ART_ARTICULOS_CODPROV A ON C.EMPRESA = A.EMPRESA AND CP.PROVEEDOR = A.PROVEEDOR AND D.ARTICULO = A.ARTICULO ');
        Add(' WHERE ');
        Add(' C.EMPRESA = :EMPRESA AND ');
        Add(' ((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE ''X%'')) AND ');
        Add(' C.TIPO = ''PEP'' AND ');
        Add(' D.ID_A = :ID_A ');
        if (SoloPendientes) then
           Add(' AND C.ESTADO = 0 AND ABS(DP.UNIDADES_POR_SERVIR) > 0.01 AND DP.LINEA_SERVIDA = 0 ');
        if (Almacen <> 'Todos') then
           Add(' AND D.ALMACEN = ''' + Almacen + ''' ');
        Add(' UNION ');
        Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR, T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, ');
        Add('        CP.FECHA_PRE_CAB, CP.FECHA_CONFIRMADA_KRI, CP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_CAB, CP.PLAZO_INICIAL_KRI, ');
        Add('        DP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_DET, D.LINEA, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, ');
        Add('        D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.UNIDADES_SERVIDAS, ');
        Add('        DP.UNIDADES_POR_SERVIR * ESC.CANTIDAD, DP.FECHA_CONF_KRI, DP.FECHA_PRE_DET, A.CODIGO_PROVEEDOR, C.SU_REFERENCIA, DP.FECHA_REC_DET, D.ID_DETALLES_E, DP.LINEA_SERVIDA ');
        Add(' FROM GES_CABECERAS_E C ');
        Add(' JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E ');
        Add(' JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E ');
        Add(' JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E ');
        Add(' JOIN ART_ARTICULOS_ESCANDALLO ESC ON D.ID_A = ESC.ID_A ');
        Add(' JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDOR = P.PROVEEDOR ');
        Add(' JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN ART_ARTICULOS_CODPROV A ON C.EMPRESA = A.EMPRESA AND CP.PROVEEDOR = A.PROVEEDOR AND ESC.DETALLE = A.ARTICULO ');
        Add(' WHERE ');
        Add(' C.EMPRESA = :EMPRESA AND ');
        Add(' ((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE ''X%'')) AND ');
        Add(' C.TIPO = ''PEP'' AND ');
        Add(' ESC.ID_A_DET = :ID_A ');
        if (SoloPendientes) then
           Add(' AND C.ESTADO = 0 AND ABS(DP.UNIDADES_POR_SERVIR) > 0.01 AND DP.LINEA_SERVIDA = 0 ');
        if (Almacen <> 'Todos') then
           Add(' AND D.ALMACEN = ''' + Almacen + ''' ');
        if (IdCampoOrdenProveedor <> 0) then
        begin
           if (IdCampoOrdenProveedor > 0) then
              Add('ORDER BY ' + IntToStr(IdCampoOrdenProveedor) + ', 8, 2 DESC, 6 DESC, 13 ')
           else
              Add('ORDER BY ' + IntToStr(abs(IdCampoOrdenProveedor)) + ' DESC, 8, 2 DESC, 6 DESC, 13 ');
        end
        else
           Add('ORDER BY 8, 2 DESC, 6 DESC, 13 ');
     end;
     xPedidosAProveedor.DataSource := DSQMArticulos;
     xPedidosAProveedor.Params.ByName['DOC_SERIE'].AsString := s;
     xPedidosAProveedor.Open;
  end;
end;

procedure TDMArticulos.AbrirPropuestas(SoloPendientes: boolean; Almacen: string; IdCampoOrdenPropuestas, IdCampoOrdenPropuestasConfirmadas: integer);
var
  s : string;
begin
  s := 'X';
  if (Trim(REntorno.SerieRestringida) > '') then
     s := REntorno.SerieRestringida;

  if (not xPropuestas.Active) then
  begin
     with xPropuestas.SelectSQL do
     begin
        Clear;
        Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR, T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, ');
        Add(' D.LINEA, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, CP.FECHA_PRE_CAB, D.ID_DETALLES_E ');
        Add(' FROM GES_CABECERAS_E C ');
        Add(' JOIN GES_CABECERAS_E_OFP CP ');
        Add(' ON C.ID_E = CP.ID_E ');
        Add(' JOIN GES_DETALLES_E D ');
        Add(' ON CP.ID_E = D.ID_E ');
        Add(' JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDOR = P.PROVEEDOR ');
        Add(' JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO ');
        Add(' WHERE ');
        Add(' C.EMPRESA = ?EMPRESA AND ');
        Add(' ((C.SERIE = ?DOC_SERIE) OR (?DOC_SERIE LIKE ''X%'')) AND ');
        Add(' C.TIPO = ''OFP'' ');
        Add(' AND D.ID_A = ?ID_A ');
        if (SoloPendientes) then
           Add(' AND C.ESTADO = 0 ');
        if (Almacen <> 'Todos') then
           Add(' AND D.ALMACEN = ''' + Almacen + ''' ');
        if (IdCampoOrdenPropuestas <> 0) then
        begin
           if (IdCampoOrdenPropuestas > 0) then
              Add('ORDER BY ' + IntToStr(IdCampoOrdenPropuestas) + ', 8, 2 DESC, 6 DESC, 11 ')
           else
              Add('ORDER BY ' + IntToStr(abs(IdCampoOrdenPropuestas)) + ' DESC, 8, 2 DESC, 6 DESC, 11 ');
        end
        else
           Add(' ORDER BY 8, 2 DESC, 6 DESC, 11');
     end;
     xPropuestas.DataSource := DSQMArticulos;
     xPropuestas.Params.ByName['DOC_SERIE'].AsString := s;
     xPropuestas.Open;
  end;

  Application.ProcessMessages;

  if (not xPropuestasConfir.Active) then
  begin
     with xPropuestasConfir.SelectSQL do
     begin
        Clear;
        Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR, T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, ');
        Add(' D.LINEA, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, CP.FECHA_PRE_CAB, D.ID_DETALLES_E ');
        Add(' FROM GES_CABECERAS_E C ');
        Add(' JOIN GES_CABECERAS_E_OCP CP ');
        Add(' ON C.ID_E = CP.ID_E ');
        Add(' JOIN GES_DETALLES_E D ');
        Add(' ON CP.ID_E = D.ID_E ');
        Add(' JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDOR = P.PROVEEDOR ');
        Add(' JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO ');
        Add(' WHERE ');
        Add(' C.EMPRESA=?EMPRESA AND ');
        Add(' ((C.SERIE = ?DOC_SERIE) OR (?DOC_SERIE LIKE ''X%'')) AND ');
        Add(' C.TIPO = ''OCP'' AND ');
        Add(' D.ID_A = ?ID_A ');
        if (SoloPendientes) then
           Add(' AND C.ESTADO = 0 ');
        if (Almacen <> 'Todos') then
           Add(' AND D.ALMACEN = ''' + Almacen + ''' ');
        if (IdCampoOrdenPropuestasConfirmadas <> 0) then
        begin
           if (IdCampoOrdenPropuestasConfirmadas > 0) then
              Add('ORDER BY ' + IntToStr(IdCampoOrdenPropuestasConfirmadas) + ', 8, 2 DESC, 6 DESC, 11 ')
           else
              Add('ORDER BY ' + IntToStr(abs(IdCampoOrdenPropuestasConfirmadas)) + ' DESC, 8, 2 DESC, 6 DESC, 11 ');
        end
        else
           Add(' ORDER BY 8, 2 DESC, 6 DESC, 11');
     end;
     xPropuestasConfir.DataSource := DSQMArticulos;
     xPropuestasConfir.Params.ByName['DOC_SERIE'].AsString := s;
     xPropuestasConfir.Open;
  end;
end;

procedure TDMArticulos.CerrarPedidos;
begin
  xPedidosDeClientes.Close;
  xPedidosAProveedor.Close;
end;

procedure TDMArticulos.CerrarPropuestas;
begin
  xPropuestas.Close;
  xPropuestasConfir.Close;
end;

{TODO (sfg_jla): Procedures especiales de TyC}
procedure TDMArticulos.QMArticulosTIPO_ARTICULO_TYCChange(Sender: TField);
begin
  if (QMArticulos.State = dsInsert) then
  begin
     if QMArticulosTIPO_ARTICULO_TYC.AsString = 'A' then
        Z_RellenaArmazon
     else if QMArticulosTIPO_ARTICULO_TYC.AsString = 'T' then
        Z_RellenaToldo
     else if QMArticulosTIPO_ARTICULO_TYC.AsString = 'L' then
     begin
        Z_RellenaLona;
        QMArticulosUNIDADES.AsString := 'M2';
     end
     else if QMArticulosTIPO_ARTICULO_TYC.AsString = 'C' then
     begin
        QMArticulosZ_TIPO_LACADO.AsString := 'BL';
        QMArticulosZ_LACADO.AsInteger := 1;
        QMArticulosZ_CORTE.AsInteger := 0;
     end
     else if QMArticulosTIPO_ARTICULO_TYC.AsString = 'K' then
     begin
        Z_RellenaKit;
        QMArticulosZ_KIT_TIPO.AsString := 'MO';
        QMArticulosZ_TIPO_LACADO.AsString := 'BL';
     end;
  end;
end;

// Calculo del Precio de Coste a partir del Precio de compra y el Descuento (EN TRIGGERS TAMBIEN)
procedure TDMArticulos.CalculaCosteKRI20(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT VALOR_CON_DTO FROM APLICA_DESCUENTOS(?VALOR, ?DTO_1, ?DTO_2, ?DTO_3, ?MONEDA)';
        Params.ByName['VALOR'].AsFloat := QMArticuloTarifasPRECIO_COMPRA.AsFloat;
        Params.ByName['DTO_1'].AsFloat := QMArticuloTarifasDESCUENTO_COMPRA.AsFloat;
        Params.ByName['DTO_2'].AsFloat := QMArticuloTarifasDESCUENTO_COMPRA_2.AsFloat;
        Params.ByName['DTO_3'].AsFloat := QMArticuloTarifasDESCUENTO_COMPRA_3.AsFloat;
        Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
        ExecQuery;
        QMArticuloTarifasPRECIO_COSTE.AsFloat := FieldByName['VALOR_CON_DTO'].AsFloat;
     finally
        Free;
     end;
  end;
end;

// Calculo del Margen a partir del precio de venta y Precio de coste (EN TRIGGERS TAMBIEN)
procedure TDMArticulos.CalculaMargenKRI20(Sender: TField);
begin
  // Utiliza precio coste de art_tarifas_precios
  (*
  if (LeeParametro('DOCPCTA001') = 'S') then
  begin
     if (QMArticuloTarifasPRECIO_VENTA.AsFloat <> 0) then
        QMArticuloTarifasMARGEN.AsFloat := (
           (QMArticuloTarifasPRECIO_VENTA.AsFloat - QMArticuloTarifasPRECIO_COSTE.AsFloat) / QMArticuloTarifasPRECIO_VENTA.AsFloat) * 100
     else
        QMArticuloTarifasMARGEN.AsFloat := 0;
  end;
  *)
  // QMArticuloTarifasZ_FECHA_MODIFICACION.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMArticulos.Z_Armazon(Sender: TField);
begin
  { XAVI COMENTO TEMA DE INICIALIZACIÓN DEL CÓDIGO DE ARTICULO
  if (QMArticulos.State = dsInsert) and
     (QMArticulosTIPO_ARTICULO_TYC.AsString = 'A') then
     Z_RellenaArmazon;
  }
end;

procedure TDMArticulos.Z_Toldo(Sender: TField);
begin
  { XAVI COMENTO TEMA DE INICIALIZACIÓN DEL CÓDIGO DE ARTICULO
  if (QMArticulos.State = dsInsert) and
     (QMArticulosTIPO_ARTICULO_TYC.AsString = 'T') then
     Z_RellenaToldo;
 }
end;

procedure TDMArticulos.Z_Lona(Sender: TField);
begin
  { XAVI COMENTO TEMA DE INICIALIZACIÓN DEL CÓDIGO DE ARTICULO
  if (QMArticulos.State = dsInsert) and
     (QMArticulosTIPO_ARTICULO_TYC.AsString = 'L') then
     Z_RellenaLona;
 }
end;

procedure TDMArticulos.Z_Kit(Sender: TField);
begin
  { XAVI COMENTO TEMA DE INICIALIZACIÓN DEL CÓDIGO DE ARTICULO
  if (QMArticulos.State = dsInsert) and
     (QMArticulosTIPO_ARTICULO_TYC.AsString = 'K') then
     Z_RellenaKit;
  }
end;

procedure TDMArticulos.QMArticulosZ_TIPO_LACADOChange(Sender: TField);
begin
  { XAVI COMENTO TEMA DE INICIALIZACIÓN DEL CÓDIGO DE ARTICULO
  if (QMArticulos.State = dsInsert) then
  begin
     if (QMArticulosTIPO_ARTICULO_TYC.AsString = 'C') then
        Z_RellenaComponente;

     if (QMArticulosTIPO_ARTICULO_TYC.AsString = 'K') then
        Z_RellenaKit;
  end;
  }
end;

// Devuelve la cadena inicio del campo artículo según el tipo de artículo
function TDMArticulos.DameCadenaInicioArticulo(TipoArticulo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CADENA_INICIO FROM SYS_TIPOS_ARTICULO_TYC WHERE TIPO_ARTICULO_TYC = ?TIPO_ARTICULO_TYC';
        Params.ByName['TIPO_ARTICULO_TYC'].AsString := TipoArticulo;
        ExecQuery;
        Result := FieldByName['CADENA_INICIO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMArticulos.DameDescripcionTipoArt(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM SYS_TIPOS_ARTICULO_TYC WHERE TIPO_ARTICULO_TYC = :TIPO_ARTICULO_TYC';
        Params.ByName['TIPO_ARTICULO_TYC'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.Z_RellenaArmazon;
begin
  QMArticulosARTICULO.AsString :=
     DameCadenaInicioArticulo(QMArticulosTIPO_ARTICULO_TYC.AsString) + QMArticulosZ_MODELO.AsString +
     QMArticulosZ_LINEA.AsString + QMArticulosZ_SALIDA.AsString;

  QMArticulosTITULO.AsString := DameDescripcionTipoArt(QMArticulosTIPO_ARTICULO_TYC.AsString) + ' ' + DameTituloModeoTyC(QMArticulosZ_MODELO.AsString);
end;

procedure TDMArticulos.Z_RellenaToldo;
var
  Modelo : string;
  Linea, Salida : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MODELO, LINEA, SALIDA FROM Z_ART_ARTICULOS_ARMAZON WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMArticulosZ_ARMAZON.AsString;
        ExecQuery;
        Modelo := FieldByName['MODELO'].AsString;
        Linea := FieldByName['LINEA'].AsInteger;
        Salida := FieldByName['SALIDA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArticulosZ_MODELO.AsString := Modelo;
  QMArticulosARTICULO.AsString := DameCadenaInicioArticulo(QMArticulosTIPO_ARTICULO_TYC.AsString) + Modelo + IntToStr(Linea) + IntToStr(Salida);
  QMArticulosTITULO.AsString := 'TOLDO ' + DameTituloModeoTyC(QMArticulosZ_MODELO.AsString);
end;

procedure TDMArticulos.Z_RellenaLona;
begin

end;

procedure TDMArticulos.Z_RellenaComponente;
begin
end;

procedure TDMArticulos.Z_RellenaKit;
begin
end;

procedure TDMArticulos.AbrirProyectos;
begin
  QMProyectos.Open;
end;

procedure TDMArticulos.AbrirProyectosSeries;
begin
  QMProyectosSeries.Open;
end;

procedure TDMArticulos.QMArticulosPreciosTIPO_PRECIO_BASEChange(Sender: TField);
begin
  xTiposPreciosBase.Close;
  xTiposPreciosBase.Open;
end;

procedure TDMArticulos.QMIdiomasBeforePost(DataSet: TDataSet);
begin
  {dji lrk kri - Si el idioma es el por defecto de la empresa, el titulo es el titulo del articulo}
  if (QMIdiomasIDIOMA.AsString = IdiomaKri) then
     QMIdiomasTITULO.AsString := QMArticulosTITULO.AsString;

  {Calculo el CRC de las notas para poder agrupar}
  QMIdiomasCRC_DESC_EXT.AsString := CalcCRC32Str(FMain.DameTexto(QMIdiomasDESCRIPCION_EXTENDIDA));
end;

procedure TDMArticulos.SetPGCBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['PGC'].AsInteger := REntorno.Pgc;
end;

procedure TDMArticulos.DuplicaArticuloKri;
var
  i : integer;
  DS : TFIBDataSet;
  DuplicarNotas : boolean;
begin
  inherited;
  /// Este procedimiento, toma los datos del artículo e inserta otro sin codigo

  // ANVER no quiere que se dupliquen las notas
  DuplicarNotas := (DMMain.EstadoKri(288) = 0);

  with QMArticulos do
  begin
     id_a_duplicado := FieldByName('ID_A').AsInteger;
     id_c_a_duplicado := FieldByName('ID_C_A').AsInteger;

     Insert;

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM VER_ARTICULOS_CUENTAS WHERE ID_C_A=' + IntToStr(id_c_a_duplicado));
              Open;

              // Recorro los campos de la tabla y obtengo los datos del select
              for i := 0 to QMArticulos.FieldCount - 1 do
              begin
                 if ((QMArticulos.Fields[i].FieldKind <> fkCalculated) and
                    (QMArticulos.Fields[i].FieldName <> 'ARTICULO') and (QMArticulos.Fields[i].FieldName <> 'ID_A') and (QMArticulos.Fields[i].FieldName <> 'ID_C_A') and
                    (QMArticulos.Fields[i].FieldName <> 'ABIERTO') and (QMArticulos.Fields[i].FieldName <> 'ENTRADA') and (QMArticulos.Fields[i].FieldName <> 'P_COSTE_CANAL') and
                    (QMArticulos.Fields[i].FieldName <> 'ID_A_M_C_T')) then
                 begin
                    // ANVER no quiere que se dupliquen las notas
                    if (DuplicarNotas) or (QMArticulos.Fields[i].FieldName <> 'NOTAS') then
                       QMArticulos.Fields[i].Value := FieldByName(QMArticulos.Fields[i].FieldName).Value;
                 end;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
              Transaction := nil;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end; {with}
end;

procedure TDMArticulos.FiltraStockUbicaciones {(Almacen:string)};
begin
  with QMStockUbicaciones do
  begin
     Close;
     DataSource := DSQMArtStocks;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ');
     SelectSQL.Add(' EMPRESA, ALMACEN, CALLE, ESTANTERIA, REPISA, POSICION, ARTICULO, TITULO, COMPOSICION, TITULO_COMP, ID_A, ');
     SelectSQL.Add(' SUM(ENTRADAS) AS ENTRADAS, SUM(SALIDAS) AS SALIDAS, SUM(EXISTENCIAS) AS EXISTENCIAS, ID_A_UBICACION, ');
     SelectSQL.Add(' ID_UBICACION, GENERAL, DISPONIBLE ');
     SelectSQL.Add(' FROM VER_ART_STOCKS_UBICACIONES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' /* CANAL = :CANAL  AND */ ');
     SelectSQL.Add(' ALMACEN = :ALMACEN ');
     if (FSoloUbicacionConStock) then
        SelectSQL.Add(' AND EXISTENCIAS <> 0 ');
     SelectSQL.Add(' GROUP BY ');
     SelectSQL.Add(' COMPOSICION, EMPRESA, ALMACEN, CALLE, ESTANTERIA, ');
     SelectSQL.Add(' REPISA, POSICION, ARTICULO, TITULO, ');
     SelectSQL.Add(' TITULO_COMP, ID_A, ');
     SelectSQL.Add(' ID_A_UBICACION, ID_UBICACION, GENERAL, DISPONIBLE ');

     //Params.ByName['Almacen'].AsString := Almacen;
     Open;
  end;
end;

procedure TDMArticulos.FiltraStockLotes {(Lote:string)};
begin
  with QMNrosLote do
  begin
     Close;
     DataSource := DSQMArtStocks;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM A_ART_STOCK_LOTE(:EMPRESA, :ARTICULO, :CANAL, :ALMACEN, -1 /* Todas las ubiaciones */) l');
     SelectSQL.Add('LEFT JOIN ART_ALMACENES_UBICACIONES U');
     SelectSQL.Add('ON L.ID_UBICACION=U.ID_UBICACION');
     if (FSoloUbicacionConStock) then
        SelectSQL.Add('WHERE L.STOCK <> 0');
     SelectSQL.Add('ORDER BY L.CANAL, L.LOTE, U.COMPOSICION');
     Open;
  end;
end;

procedure TDMArticulos.FiltraStockSeriales;
begin
  with QMNroSerie do
  begin
     Close;
     DataSource := DSQMArtStocks;
     Open;
  end;
end;

procedure TDMArticulos.FiltraStockMovimientos;
begin
  with QMMovimientosStock do
  begin
     Close;
     if not Transaction.InTransaction then
        Transaction.StartTransaction;
     DataSource := DSQMArtStocks;
     Params.ByName['CALCULAR_PMP'].AsInteger := BoolToInt(CalcularPMPMovimientos);
     Open;
  end;
end;

procedure TDMArticulos.FiltraStockFuturo(SepararAlmacenes: boolean);
begin
  with QMStockFuturo do
  begin
     Close;
     if Transaction.InTransaction then
        Transaction.Commit;

     Transaction.StartTransaction;
     SelectSQL.Clear;

     SelectSQL.Add(' SELECT F.*, CS.FECHA_ENTREGA_PREV, DS.FECHA_ENTREGA_PREV FECHA_ENTREGA_PREV_DET, CE.FECHA_CONFIRMADA_KRI FECHA_CONF, ');
     SelectSQL.Add('        DE.FECHA_CONF_KRI FECHA_CONF_DET ');
     if (SepararAlmacenes) then
        SelectSQL.Add(' FROM A_ART_STOCK_FUTURO(:ID_A, :CANAL, :ALMACEN) F ')
     else
        SelectSQL.Add(' FROM A_ART_STOCK_FUTURO(:ID_A, :CANAL, ''   '') F ');
     SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S_PED CS ON F.ID_DOC = CS.ID_S AND F.TIPO = CS.TIPO ');
     SelectSQL.Add(' LEFT JOIN GES_CABECERAS_E_PED CE ON F.ID_DOC = CE.ID_E AND F.TIPO = CE.TIPO ');
     SelectSQL.Add(' LEFT JOIN GES_DETALLES_S_PED DS ON F.ID_DETALLE_DOC = DS.ID_DETALLES_S AND F.TIPO = DS.TIPO ');
     SelectSQL.Add(' LEFT JOIN GES_DETALLES_E_PED DE ON F.ID_DETALLE_DOC = DE.ID_DETALLES_E AND F.TIPO = DE.TIPO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' F.CANTIDAD <> 0 ');

     DataSource := DSQMArtStocks;
     Open;
     FetchAll;
     Transaction.CommitRetaining;
  end;
end;

procedure TDMArticulos.FiltraStockFuturoTransaccion;
var
  id : integer;
begin
  /// Procedimiento que cierra y abre una nueva transaccion RW para evitar congestionar la base de datos.

  id := QMStockFuturoID_DETALLE_DOC.AsInteger;
  with QMStockFuturo do
  begin
     Close;

     if Transaction.InTransaction then
        Transaction.Commit;
     Transaction.StartTransaction;

     Open;
     FetchAll;
     Transaction.CommitRetaining;
  end;

  Posicionar(QMStockFuturo, 'ID_DETALLE_DOC', id);
end;

procedure TDMArticulos.FiltraStockSerialesKRI {(Serial:string)};
begin
  with QMNroSerieKRI do
  begin
     Close;
     DataSource := DSQMArtStocks;
     Open;
  end;
end;

procedure TDMArticulos.CerrarUnidadesLogisitcas;
begin
  QMUnidadesLogisticas.Close;
end;

procedure TDMArticulos.AbrirUnidadesLogisitcas;
begin
  QMUnidadesLogisticas.Open;
end;

procedure TDMArticulos.QMUnidadesLogisticasNewRecord(DataSet: TDataSet);
begin
  QMUnidadesLogisticasEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  QMUnidadesLogisticasARTICULO.AsString := QMArticulosARTICULO.AsString;
  QMUnidadesLogisticasPESO.AsFloat := 0;
  QMUnidadesLogisticasDEFECTO.AsInteger := 0;
end;

procedure TDMArticulos.SetSoloUbicacionConStock(Value: boolean);
begin
  FSoloUbicacionConStock := Value;
  FiltraStockUbicaciones{(QMArtStocksALMACEN.AsString)};
  FiltraStockLotes;
  FiltraStockSeriales;
  FiltraStockSerialesKRI;
end;

procedure TDMArticulos.AbrirStockLote;
begin
  FiltraStockLotes;
end;

procedure TDMArticulos.AbrirStockUbicaciones;
begin
  FiltraStockUbicaciones{(QMArtStocksALMACEN.AsString)};
end;

procedure TDMArticulos.AbrirStockNroSerie;
begin
  FiltraStockSeriales;
end;

procedure TDMArticulos.AbrirStockMovimientos;
begin
  FiltraStockMovimientos;
end;

procedure TDMArticulos.AbrirStockFuturo(SepararAlmacenes: boolean);
begin
  FiltraStockFuturo(SepararAlmacenes);
end;

procedure TDMArticulos.AbrirStockNroSerieKRI;
begin
  FiltraStockSerialesKRI;
end;

procedure TDMArticulos.RecalculaStockUbicaciones;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE RECALCULA_STOCK_UBI_ART_ALM(:EMPRESA, :ALMACEN, :ARTICULO)';
        Params.ByName['EMPRESA'].AsInteger := QMStockUbicacionesEMPRESA.AsInteger;
        Params.ByName['ALMACEN'].AsString := QMStockUbicacionesALMACEN.AsString;
        Params.ByName['ARTICULO'].AsString := QMStockUbicacionesARTICULO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArtStocks.Refresh;
end;

procedure TDMArticulos.IniciaRecalculo;
var
  Almacen : string;
  Error : boolean;
  ts : TStrings;
begin
  RecalculoActivo := True;
  Error := False;
  Almacen := QMStockUbicacionesALMACEN.AsString;
  while ((RecalculoActivo) and (not Error)) do
  begin
     with QMArticulos do
     begin
        while not EOF do
        begin
           while ((Almacen <> QMArtStocksALMACEN.AsString) and (not QMArtStocks.EOF)) do
              QMArtStocks.Next;
           try
              RecalculaStockUbicaciones;
           except
              on e: Exception do
              begin
                 ts := TStringList.Create;
                 try
                    try
                       ts.LoadFromFile('C:\RecalculoUbicaciones.log');
                    except
                    end;
                    ts.Add('Articulo: ' + QMArticulosARTICULO.AsString);
                    ts.Add(e.Message);
                    ts.SaveToFile('C:\RecalculoUbicaciones.log');
                 finally
                    ts.Free;
                 end;
              end;
           end;
           Error := (QMStockUbicacionesEXISTENCIAS.AsFloat <> QMArtStocksEXISTENCIAS.AsFloat);
           if (Error) then
           begin
              ts := TStringList.Create;
              try
                 try
                    ts.LoadFromFile('C:\RecalculoUbicaciones_Diferencias.log');
                 except
                 end;
                 ts.Add('Articulo: ' + QMArticulosARTICULO.AsString);
                 ts.Add('Stock: ' + FormatFloat(',0.00', QMArtStocksEXISTENCIAS.AsFloat) + ' Ubicadas: ' + FormatFloat(',0.00', QMStockUbicacionesEXISTENCIAS.AsFloat));
                 ts.SaveToFile('C:\RecalculoUbicaciones_Diferencias.log');
              finally
                 ts.Free;
              end;
              Error := False;
           end;
           Next;
        end;
     end;
     Application.ProcessMessages;
  end;
end;

procedure TDMArticulos.ParaRecalculo;
begin
  RecalculoActivo := False;
end;

procedure TDMArticulos.QMArticulosAfterPost(DataSet: TDataSet);
var
  Articulo : TStrings;
  i : integer;
  Linea, Campo, Valor, Conjuncion : string;
begin
  Graba(DataSet);
  // Si pertenece a un modelo de Talas y Colores,
  // pregunto si desea modificar los datos del resto de articulos del modelo
  if (QMArticulosID_A_M_C_T.AsInteger > 0) then
  begin
     Articulo := TStringList.Create;
     try
        RellenaDatosArticulo(Articulo);
        if (Articulo.Text <> OldArticulo.Text) then
        begin
           if (Application.MessageBox(PChar(string(_('El articulo ha cambiado. ¿Desea modificar los articulos del mismo modelo?'))),
              PChar(string(_('Confirmación'))),
              mb_iconstop + mb_yesno) = id_yes) then
           begin
              // Aqui debemos modificar los datos de los artículos que pertenecen al mismo modelo/color
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE VER_ARTICULOS_CUENTAS ');
                    SQL.Add(' SET ');

                    // Rellenos los valores de los campos que participan en el update
                    Conjuncion := '';
                    for i := 0 to Articulo.Count - 1 do
                    begin
                       Linea := Articulo[i];
                       Campo := Copy(Linea, 1, Pos('=', Linea) - 1);
                       Valor := Copy(Linea, Pos('=', Linea) + 1, Length(Linea));
                       if (QMArticulos.FieldByName(campo) is TIntegerField) then
                          SQL.Add(conjuncion + campo + ' = ' + Valor);
                       if (QMArticulos.FieldByName(campo) is TFloatField) then
                          SQL.Add(conjuncion + campo + ' = ' + FloatToStrDec(StrToFloat(Valor), '.'));
                       if (QMArticulos.FieldByName(campo) is TFIBStringField) then
                          SQL.Add(conjuncion + campo + ' = ''' + Valor + '''');
                       if (QMArticulos.FieldByName(campo) is TDateTimeField) then
                          SQL.Add(conjuncion + campo + ' = ''' + FormatDateTime('yyyy-mm-dd hh:nn:ss', StrToDateTime(Valor)) + '''');
                       // TBlobField no se traspasa
                       Conjuncion := ', ';
                    end;
                    // *************************

                    SQL.Add(' WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO <> :ARTICULO ');
                    SQL.Add(' AND ARTICULO IN ');
                    // articulos que perteneces al modelo
                    SQL.Add('(SELECT ART.ARTICULO ');
                    SQL.Add(' FROM ART_ARTICULOS ART ');
                    SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ');
                    SQL.Add(' ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
                    SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ');
                    SQL.Add(' ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' AMC.ID_A_M = ');
                    // id_a_m es el modelo del articulo
                    SQL.Add(' (SELECT ');
                    SQL.Add('  AMC.ID_A_M ');
                    SQL.Add('  FROM ART_ARTICULOS ART ');
                    SQL.Add('  JOIN ART_ARTICULOS_M_C_TALLAS AMCT ');
                    SQL.Add('  ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
                    SQL.Add('  JOIN ART_ARTICULOS_MOD_COLOR AMC ');
                    SQL.Add('  ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
                    SQL.Add('  WHERE ART.EMPRESA = :EMPRESA AND ART.ARTICULO = :ARTICULO)) ');
                    Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMArticulosEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMArticulosCANAL.AsInteger;
                    Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
        RellenaDatosArticulo(OldArticulo);
     finally
        Articulo.Free;
     end;
  end;

  if (Proveedor <> 0) and (CodProv <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_CODPROV ( ');
           SQL.Add(' EMPRESA, ARTICULO, PROVEEDOR, CODIGO_PROVEEDOR, TITULO_ART) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :ARTICULO, :PROVEEDOR, :CODIGO_PROVEEDOR, :TITULO_ART) ');
           SQL.Add(' MATCHING (EMPRESA, ARTICULO, PROVEEDOR) ');
           Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
           Params.ByName['CODIGO_PROVEEDOR'].AsString := CodProv;
           Params.ByName['TITULO_ART'].AsString := QMArticulosTITULO_LARGO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Proveedor := 0;
     CodProv := '';
  end;
end;

procedure TDMArticulos.RellenaDatosOldArticulo;
begin
  RellenaDatosArticulo(OldArticulo); // Guardo los datos del articulo para compararlo en el Post y ver si ha cambiado
end;

procedure TDMArticulos.AbrirSimilares;
begin
  QMArticulosSimilares.Open;
end;

procedure TDMArticulos.CerrarSimilares;
begin
  QMArticulosSimilares.Close;
end;

procedure TDMArticulos.QMArticulosSimilaresNewRecord(DataSet: TDataSet);
begin
  QMArticulosSimilaresEMPRESA.AsInteger := REntorno.Empresa;
  QMArticulosSimilaresID_A.AsInteger := QMArticulosID_A.AsInteger;
  QMArticulosSimilaresARTICULO.AsString := QMArticulosARTICULO.AsString;
  QMArticulosSimilaresID_A_Similar.AsInteger := 0;
end;

procedure TDMArticulos.AbrirClientes;
begin
  QMCliArt.Open;
end;

procedure TDMArticulos.CerrarClientes;
begin
  QMCliArt.Close;
end;

procedure TDMArticulos.QMCliArtNewRecord(DataSet: TDataSet);
begin
  QMCliArtEMPRESA.AsInteger := REntorno.Empresa;
  QMCliArtARTICULO.Value := QMArticulosARTICULO.Value;
  QMCliArtID_A.AsInteger := QMArticulosID_A.AsInteger;
end;

procedure TDMArticulos.QMCliArtBeforePost(DataSet: TDataSet);
begin
  QMCliArtCODIGO_CLIENTE.AsString := UpperCase(Trim(QMCliArtCODIGO_CLIENTE.AsString));
end;

procedure TDMArticulos.QMArticulosCalcFields(DataSet: TDataSet);
begin
  if (not Posicionando) then
  begin
     QMArticulosP_COSTE_MAS_ADICIONAL.AsFloat := QMArticulosP_COSTE.AsFloat + QMArticulosCOSTE_ADICIONAL.AsFloat;
     QMArticulosTITULO_FABRICANTE.AsString := DameTituloTercero(QMArticulosFABRICANTE.AsInteger);
     QMArticulosPESO_FACTOR.AsFloat := QMArticulosPESO.AsFloat * QMArticulosFACTOR_UNIDAD.AsFloat;
     QMArticulosDIAMETRO_FACTOR.AsFloat := QMArticulosDIAMETRO_UNIT.AsFloat * QMArticulosFACTOR_UNIDAD.AsFloat;
     QMArticulosVOLUMEN_FACTOR.AsFloat := QMArticulosVOLUMEN_UNIT.AsFloat * QMArticulosFACTOR_UNIDAD.AsFloat;
  end;
end;

procedure TDMArticulos.QMUnidadesLogisticasAfterPost(DataSet: TDataSet);
var
  Tipo : string;
begin
  /// Si he marcado como defecto este registro, refresco los datos, porque la anterior se habrá desmarcado.
  if (QMUnidadesLogisticasDEFECTO.AsInteger = 1) then
  begin
     with QMUnidadesLogisticas do
     begin
        Tipo := QMUnidadesLogisticasTIPO.AsString;
        DisableControls;
        try
           Close;
           Open;
           while ((not EOF) and (QMUnidadesLogisticasTIPO.AsString <> Tipo)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMArticulos.QMMovimientosStockTIPO_OPERGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMMovimientosStockTIPO_OPER.AsString = 'O') then
     Text := 'S [O]'
  else
  if (QMMovimientosStockTIPO_OPER.AsString = 'D') then
     Text := 'E [D]'
  else
     Text := QMMovimientosStockTIPO_OPER.AsString;
end;

procedure TDMArticulos.QMArticulosSTOCK_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  i : integer;
  Stock : double;
  Articulo : string;
begin
  /// Campo especial para JVV. Quiere el stock del almacen 002.
  /// Pondremos el del almacén por defecto de la empresa.

  if ((Almacen = 'NOCALC') or (QMArticulosCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
  begin
     Articulo := QMArticulosARTICULO.AsString;
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, Almacen);
           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;
     Text := FormatFloat(MascaraN, Stock);
  end;
end;

procedure TDMArticulos.QMArticulosPRECIO_TARIFAGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  i : integer;
  PrecioVenta : double;
  Articulo : string;
begin
  /// Campo especial para Blaublanc

  if (Tarifa = 'NOCALC') then
     Text := ''
  else
  begin
     Articulo := QMArticulosARTICULO.AsString;
     with PrecioTar do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           PrecioVenta := DMMain.DamePrecioTarifa(Tarifa, Articulo);
           Values[Articulo] := FloatToStr(PrecioVenta);
        end
        else
        begin
           PrecioVenta := StrToFloat(Values[Articulo]);
        end;
     end;
     Text := FormatFloat(MascaraMoneda, PrecioVenta);
  end;
end;

procedure TDMArticulos.AbrirEquivalencias;
begin
  QMEquivalenciasCab.Open;
end;

procedure TDMArticulos.CerrarEquivalencias;
begin
  QMEquivalenciasCab.Close;
end;

procedure TDMArticulos.QMEquivalenciasCabAfterOpen(DataSet: TDataSet);
begin
  QMEquivalenciasDet.Open;
end;

procedure TDMArticulos.QMEquivalenciasCabBeforeClose(DataSet: TDataSet);
begin
  QMEquivalenciasDet.Close;
end;

procedure TDMArticulos.StockAlmacen(aAlmacen: string);
var
  TituloColumanAlmacen : string;
begin
  Almacen := aAlmacen;

  // Cambio el titulo de la columna para informar de que almacen obtengo el stock
  if (Almacen = 'NOCALC') then
     TituloColumanAlmacen := 'OFF'
  else
  if (Almacen = '') then
     TituloColumanAlmacen := 'ALL'
  else
     TituloColumanAlmacen := Almacen;
  QMArticulosSTOCK_ALM.DisplayLabel := Format(_('Stock[%s]'), [TituloColumanAlmacen]);

  // Refresco el detalle
  StockAlm.Clear;
  if (QMArticulos.Active) then
     QMArticulos.Refresh;
end;

procedure TDMArticulos.LanzadaAlmacen(aAlmacen: string);
var
  TituloColumanAlmacen : string;
begin
  AlmacenLanzada := aAlmacen;

  // Cambio el titulo de la columna para informar de que almacen obtengo el stock
  if (AlmacenLanzada = 'NOCALC') then
     TituloColumanAlmacen := 'OFF'
  else
  if (AlmacenLanzada = '') then
     TituloColumanAlmacen := 'ALL'
  else
     TituloColumanAlmacen := AlmacenLanzada;
  QMArticulosLANZADA_ALM.DisplayLabel := Format(_('Lanzada[%s]'), [TituloColumanAlmacen]);

  // Refresco el detalle
  LanzadaAlm.Clear;
  if (QMArticulos.Active) then
     QMArticulos.Refresh;
end;

procedure TDMArticulos.PrecioTarifa(aTarifa: string);
var
  TituloColumanTarifa : string;
begin
  Tarifa := aTarifa;

  // Cambio el titulo de la columna para informar de que almacen obtengo el stock
  if (Tarifa = 'NOCALC') then
     TituloColumanTarifa := 'OFF'
  else
  if (Tarifa = '') then
     TituloColumanTarifa := 'ALL'
  else
     TituloColumanTarifa := Tarifa;
  QMArticulosPRECIO_TARIFA.DisplayLabel := Format(_('P. Tarifa[%s]'), [TituloColumanTarifa]);

  // Refresco el detalle
  PrecioTar.Clear;
  PrecioMerc.Clear;
  if (QMArticulos.Active) then
     QMArticulos.Refresh;
end;

procedure TDMArticulos.QMProveedoresNewRecord(DataSet: TDataSet);
begin
  QMProveedoresEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  QMProveedoresARTICULO.AsString := QMArticulosARTICULO.AsString;
  QMProveedoresID_A.AsInteger := QMArticulosID_A.AsInteger;
  QMProveedoresACTIVO.AsInteger := 1;
end;

procedure TDMArticulos.QMArticulosFABRICANTEChange(Sender: TField);
begin
  QMArticulosTITULO_FABRICANTE.AsString := DameTituloTercero(QMArticulosFABRICANTE.AsInteger);
end;

procedure TDMArticulos.QMArticulosSTOCK_VIRTUALGetText(Sender: TField; var Text: string; DisplayText: boolean);
(*
var
  Q : THYFIBQuery;
  i : integer;
  Stock : double;
  Articulo : string;
*)
begin
  /// Campo especial para JVV
  /// Quiere el stock del almacen 002
  (*
  if ((QMArticulosCONTROL_STOCK.AsInteger = 0) or (Almacen = 'NOCALC')) then
     Text := ''
  else
  begin
     Articulo := QMArticulosARTICULO.AsString;
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, Almacen);
           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;
     Text := FloatToStrDec(Stock, DecimalSeparator);
  end;

     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT STOCK_VIRTUAL FROM A_ART_DAME_STOCK_ART_ED (?EMPRESA, ?CANAL, ?ARTICULO, ?ALMACEN, 1, 0, 1, 1, 0, 0, 0, NULL)';
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        ExecQuery;
        Text := FormatFloat(',0', FieldByName['STOCK_VIRTUAL'].AsFloat);
        FreeHandle;
     end;
     FreeAndNil(Q);
*)
end;

procedure TDMArticulos.QMProvArtAfterPost(DataSet: TDataSet);
begin
  QMProveedores.Close;
  QMProveedores.Open;
end;

procedure TDMArticulos.QMMovimientosStockLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMArticulosLOTES.AsInteger = 1) then
  begin
     if (QMMovimientosStockID_LOTE.AsInteger > 0) then
        Text := QMMovimientosStockLOTE.AsString
     else
        Text := _('Sin Asignar');
  end
  else
     Text := '';
end;

procedure TDMArticulos.QMArtStocksBeforeClose(DataSet: TDataSet);
begin
  AlmacenBeforeScroll := QMArtStocksALMACEN.AsString;
end;

procedure TDMArticulos.CambiaPrecioMovStock(Valor: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_MOV_STOCKS SET PRECIO = :PRECIO WHERE ID_MOV_STOCKS = :ID_MOV_STOCK';
        Params.ByName['PRECIO'].AsFloat := Valor;
        Params.ByName['ID_MOV_STOCK'].AsInteger := QMMovimientosStockID_MOV_STOCK.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMMovimientosStock, 'ID_MOV_STOCK', QMMovimientosStockID_MOV_STOCK.AsInteger);
end;

procedure TDMArticulos.CerrarCondiciones;
begin
  xCondiciones.Close;
end;

procedure TDMArticulos.AbrirCondiciones;
begin
  xCondiciones.Open;
end;

procedure TDMArticulos.OptimizaBusqueda(Optimizar: boolean);
begin
  /// Establece variable Posicionando que evita que se ejecuta AfterScroll
  /// Cuando se quita la optimización hay que forzar la ejecución para refrescar algunos datos.

  Posicionando := Optimizar;
  if Posicionando then
  begin
     xTipoIva.DataSource := nil;
     xTipoIva.DataSource := nil;
     xUnidades.DataSource := nil;
     xUnidades.DataSource := nil;
     xTipoGarantia.DataSource := nil;
     xTipoGarantia.DataSource := nil;
     xDisponibilidad.DataSource := nil;
     xDisponibilidad.DataSource := nil;
  end
  else
  begin
     xTipoIva.DataSource := DSQMArticulos;
     xTipoIva.DataSource := DSQMArticulos;
     xUnidades.DataSource := DSQMArticulos;
     xUnidades.DataSource := DSQMArticulos;
     xTipoGarantia.DataSource := DSQMArticulos;
     xTipoGarantia.DataSource := DSQMArticulos;
     xDisponibilidad.DataSource := DSQMArticulos;
     xDisponibilidad.DataSource := DSQMArticulos;

     QMArticulosAfterScroll(QMArticulos);
     QMArticulosCalcFields(QMArticulos);
  end;
end;

procedure TDMArticulos.CrearCodigoBarra;
begin
  /// Si El codigo de barras con el codigo del articulo

  if (not QMCodigoBarra.Active) then
     QMCodigoBarra.Open;

  QMCodigoBarra.Insert;
  QMCodigoBarraTIPO.AsInteger := 1;
  QMCodigoBarraBARRAS.AsString := QMArticulosARTICULO.AsString;
  QMCodigoBarraFUNCION.AsInteger := 1;
  QMCodigoBarra.Post;
end;

procedure TDMArticulos.CrearCodigoBarraEAN13;
begin
  /// Si El codigo de barras está vacio, crea uno nuevo según prefijo de empresa/aplicacion + contador XCB

  if (not QMCodigoBarra.Active) then
     QMCodigoBarra.Open;

  QMCodigoBarra.Insert;
  QMCodigoBarraBARRAS.AsString := '';
  QMCodigoBarraTIPO.AsInteger := 3;
  QMCodigoBarra.Post;
end;

procedure TDMArticulos.ActualizaPrecios(Empresa, Canal: integer; Almacen, Articulo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_DAME_STOCK2(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, ''01/01/3000'')';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.QMMovimientosStockBeforeOpen(DataSet: TDataSet);
begin
  ActualizaPrecios(QMArtStocksEMPRESA.AsInteger, QMArtStocksCANAL.AsInteger, QMArtStocksALMACEN.AsString, QMArtStocksARTICULO.AsString);
end;

procedure TDMArticulos.CerrarDataSetsStock;
begin
  with QMStockUbicaciones do
  begin
     Close;
     DataSource := nil;
  end;

  with QMNrosLote do
  begin
     Close;
     DataSource := nil;
  end;

  with QMNroSerie do
  begin
     Close;
     DataSource := nil;
  end;

  with QMNroSerieKRI do
  begin
     Close;
     DataSource := nil;
  end;

  with QMMovimientosStock do
  begin
     Close;
     DataSource := nil;
  end;

  with QMStockFuturo do
  begin
     if Transaction.InTransaction then
        Transaction.Commit;
     Close;
     DataSource := nil;
  end;
end;

procedure TDMArticulos.QMArticuloTarifasCalcFields(DataSet: TDataSet);
begin
  QMArticuloTarifasTITULO_TARIFA.AsString := DameTituloTarifa(QMArticuloTarifasTARIFA.AsString);

  if TarifaEsIvaIncluido(QMArticuloTarifasTARIFA.AsString, REntorno.Empresa) then  //tarifa con precios de IVA ya calculado
  begin
     QMArticuloTarifasPRECIO_CON_IVA.AsFloat := QMArticuloTarifasPRECIO_VENTA.AsFloat;
     QMArticuloTarifasPRECIO_SIN_IVA.AsFloat := QMArticuloTarifasPRECIO_VENTA.AsFloat / (xTipoIvaP_IVA.AsFloat / 100 + 1); //TotalConIva/(%IVA/100+1)
  end
  else //el precio no tiene incluido el IVA
  begin
     QMArticuloTarifasPRECIO_SIN_IVA.AsFloat := QMArticuloTarifasPRECIO_VENTA.AsFloat;
     QMArticuloTarifasPRECIO_CON_IVA.AsFloat := QMArticuloTarifasPRECIO_VENTA.AsFloat + (QMArticuloTarifasPRECIO_VENTA.AsFloat * (xTipoIvaP_IVA.AsFloat / 100)); //PrecioSinIVA+(PrecioSinIVA*(%IVA/100))
  end;
end;

procedure TDMArticulos.AbrirCombinaciones;
begin
  xCombinaciones.Open;
end;

procedure TDMArticulos.CerrarCombinaciones;
begin
  xCombinaciones.Close;
end;

procedure TDMArticulos.RellenaAtributos(Tipo: string; Lista: TStrings; TipoPadre: string = ''; IdPadre: integer = 0);
var
  id : integer;
begin
  Lista.Clear;
  Lista.AddObject(_('No aplica'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT ID, ATRIBUTO FROM ART_ATRIBUTO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' TIPO = :TIPO ');

           if (TipoPadre <> '') then
           begin
              SelectSQL.Add(' AND TIPO_PADRE = :TIPO_PADRE ');
              SelectSQL.Add(' AND ID_PADRE = :ID_PADRE ');
           end;

           SelectSQL.Add(' ORDER BY ATRIBUTO ');

           Params.ByName['TIPO'].AsString := Tipo;

           if (TipoPadre <> '') then
           begin
              Params.ByName['TIPO_PADRE'].AsString := TipoPadre;
              Params.ByName['ID_PADRE'].AsInteger := IdPadre;
           end;

           Open;

           while not EOF do
           begin
              id := FieldByName('ID').AsInteger;
              Lista.AddObject(FieldByName('ATRIBUTO').AsString, Pointer(id));
              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.CrearCombinacion(IdMarca, IdModelo, IdEspecificacion, IdBombin, IdLlave, IdTipoVehiculo: integer);
var
  IdCombinacion : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE ART_CREA_COMBINACION (:ID_A, :ID_MARCA, :ID_MODELO, :ID_ESPECIFICACION, :ID_BOMBIN, :ID_LLAVE, :ID_TIPO_VEHICULO)';
        Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
        Params.ByName['ID_MARCA'].AsInteger := IdMarca;
        Params.ByName['ID_MODELO'].AsInteger := IdModelo;
        Params.ByName['ID_ESPECIFICACION'].AsInteger := IdEspecificacion;
        Params.ByName['ID_BOMBIN'].AsInteger := IdBombin;
        Params.ByName['ID_LLAVE'].AsInteger := IdLlave;
        Params.ByName['ID_TIPO_VEHICULO'].AsInteger := IdTipoVehiculo;
        ExecQuery;
        IdCombinacion := FieldByName['ID'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(xCombinaciones, 'ID_COMBINACION', IdCombinacion);
end;

procedure TDMArticulos.QMMovimientosStockALFA_2GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := QMArticulosALFA_2.AsString;
end;

procedure TDMArticulos.QMArticuloECPrestashopBeforeOpen(DataSet: TDataSet);
begin
  QMArticuloECPrestashop.Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfECPrestashopID.AsInteger;
end;

procedure TDMArticulos.QMConfECPrestashopAfterScroll(DataSet: TDataSet);
begin
  QMArticuloECPrestashop.Close;
  QMArticuloECPrestashop.Open;
end;

procedure TDMArticulos.QMArticuloECPrestashopBeforeEdit(DataSet: TDataSet);
begin
  QMArticuloECPrestashop.Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfECPrestashopID.AsInteger;
end;

procedure TDMArticulos.AbrirECommerce;
begin
  // Abrimos tienda Prestashop
  with QMConfECPrestashop do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
  QMArticuloECPrestashop.Open;

  // Abrimos tienda Woocommerce
  with QMConfECWoocommerce do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
  QMArticuloECWoocommerce.Open;
end;

procedure TDMArticulos.CerrarECommerce;
begin
  QMArticuloECPrestashop.Close;
  QMConfECPrestashop.Close;

  QMArticuloECWoocommerce.Close;
  QMConfECWoocommerce.Close;
end;

procedure TDMArticulos.FiltrarECommercePrestashop(IdTienda: integer);
begin
  with QMConfECPrestashop do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_CONF_PRESTASHOP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL ');
     if (IdTienda <> 0) then
        SelectSQL.Add(' AND ID = :ID ');
     SelectSQL.Add(' ORDER BY ID ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (IdTienda <> 0) then
        Params.ByName['ID'].AsInteger := IdTienda;
     Open;
  end;

  QMArticuloECPrestashop.Open;
end;

procedure TDMArticulos.QMArticuloECPrestashopNewRecord(DataSet: TDataSet);
var
  Precio : double;
begin
  QMArticuloECPrestashopID_CONFIGURACION.AsInteger := QMConfECPrestashopID.AsInteger;
  QMArticuloECPrestashopID_A.AsInteger := QMArticulosID_A.AsInteger;
  QMArticuloECPrestashopID_PRODUCT.AsInteger := 0;
  QMArticuloECPrestashopID_PRODUCT_ATTRIBUTE.AsInteger := 0;
  QMArticuloECPrestashopID_ATTRIBUTE.AsInteger := 0;
  QMArticuloECPrestashopID_ATTRIBUTES.AsString := '';
  QMArticuloECPrestashopREFERENCIA.AsString := QMArticulosARTICULO.AsString;
  QMArticuloECPrestashopTITULO.AsString := QMArticulosTITULO.AsString;
  QMArticuloECPrestashopDESCRIPCION_CORTA.AsString := QMArticulosTITULO.AsString;
  QMArticuloECPrestashopDESCRIPCION_LARGA.AsString := QMArticulosTITULO.AsString;

  Precio := DMMain.DamePrecioTarifa(QMConfECPrestashopTARIFA.AsString, QMArticulosARTICULO.AsString);
  QMArticuloECPrestashopPRECIO.AsFloat := Precio;
  if TarifaEsIvaIncluido(QMConfECPrestashopTARIFA.AsString) then
  begin
     // Quito la cuota del IVA dejando 6 dígitos decimales.
     QMArticuloECPrestashopPRECIO.AsFloat := SimpleRoundTo(Precio / (1 + DMMain.DamePorcentajeIva(REntorno.Pais, QMArticulosTIPO_IVA.AsInteger) / 100), -6);
  end;

  QMArticuloECPrestashopSTOCK.AsFloat := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMArticulosARTICULO.AsString, QMConfECPrestashopALMACEN.AsString);

  QMArticuloECPrestashopULT_SINCRONIZACION.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMArticulos.QMConfECWoocommerceAfterScroll(DataSet: TDataSet);
begin
  QMArticuloECWoocommerce.Close;
  QMArticuloECWoocommerce.Open;
end;

procedure TDMArticulos.QMArticuloECWoocommerceBeforeEdit(DataSet: TDataSet);
begin
  QMArticuloECWoocommerce.Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfECWoocommerceID.AsInteger;
end;

procedure TDMArticulos.QMArticuloECWoocommerceBeforeOpen(DataSet: TDataSet);
begin
  QMArticuloECWoocommerce.Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfECWoocommerceID.AsInteger;
end;

procedure TDMArticulos.QMArticuloECWoocommerceNewRecord(DataSet: TDataSet);
var
  Precio : double;
begin
  QMArticuloECWoocommerceID_CONFIGURACION.AsInteger := QMConfECWoocommerceID.AsInteger;
  QMArticuloECWoocommerceID_A.AsInteger := QMArticulosID_A.AsInteger;
  QMArticuloECWoocommerceID_PRODUCT.AsInteger := 0;
  QMArticuloECWoocommerceID_VARIATION.AsInteger := 0;
  QMArticuloECWoocommerceREFERENCIA.AsString := QMArticulosARTICULO.AsString;
  QMArticuloECWoocommerceTITULO.AsString := QMArticulosTITULO.AsString;
  QMArticuloECWoocommerceDESCRIPCION_CORTA.AsString := QMArticulosTITULO.AsString;
  QMArticuloECWoocommerceDESCRIPCION_LARGA.AsString := QMArticulosTITULO.AsString;
  QMArticuloECWoocommercePRODUCT_TYPE.AsInteger := 0;

  Precio := DMMain.DamePrecioTarifa(QMConfECWoocommerceTARIFA.AsString, QMArticulosARTICULO.AsString);
  QMArticuloECWoocommercePRECIO.AsFloat := Precio;
  if TarifaEsIvaIncluido(QMConfECWoocommerceTARIFA.AsString) then
  begin
     // Quito la cuota del IVA dejando 6 dígitos decimales.
     QMArticuloECWoocommercePRECIO.AsFloat := Precio / (1 + DMMain.DamePorcentajeIva(REntorno.Pais, QMArticulosTIPO_IVA.AsInteger) / 100);
  end;

  QMArticuloECWoocommerceSTOCK.AsFloat := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMArticulosARTICULO.AsString, QMConfECWoocommerceALMACEN.AsString);

  QMArticuloECWoocommerceULT_SINCRONIZACION.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMArticulos.AbrirAvisos;
begin
  xAvisos.Open;
end;

procedure TDMArticulos.AbrirBultos;
begin
  xBultos.Open;
end;

procedure TDMArticulos.AbrirCaracteristicas;
begin
  xCaracteristica.Open;
end;

procedure TDMArticulos.CerrarAvisos;
begin
  xAvisos.Close;
end;

procedure TDMArticulos.CerrarBultos;
begin
  xBultos.Close;
end;

procedure TDMArticulos.CerrarCaracteristicas;
begin
  xCaracteristica.Close;
end;

procedure TDMArticulos.xAvisosBeforePost(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'ART';
  xAvisosID_OBJETO.AsInteger := QMArticulosID_A.AsInteger;
end;

procedure TDMArticulos.xAvisosNewRecord(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'ART';
  xAvisosID_OBJETO.AsInteger := QMArticulosID_A.AsInteger;
  xAvisosACTIVO_OFC.AsInteger := 1;
  xAvisosACTIVO_PEC.AsInteger := 1;
  xAvisosACTIVO_ALB.AsInteger := 1;
  xAvisosACTIVO_FAC.AsInteger := 1;
  xAvisosACTIVO_OFP.AsInteger := 1;
  xAvisosACTIVO_OCP.AsInteger := 1;
  xAvisosACTIVO_PEP.AsInteger := 1;
  xAvisosACTIVO_ALP.AsInteger := 1;
  xAvisosACTIVO_FAP.AsInteger := 1;
end;

procedure TDMArticulos.QMArticuloECWoocommerceBeforePost(DataSet: TDataSet);
begin
  if (QMArticuloECWoocommerceID_VARIATION.AsInteger <> 0) then
     QMArticuloECWoocommercePRODUCT_TYPE.AsInteger := 1;
end;

procedure TDMArticulos.CopiaCodProveedorAModelo;
var
  Articulo : string;
  IdA : integer;
begin
  // Si pertenece a un modelo de Talas y Colores,
  // pregunto si desea modificar los datos del resto de articulos del modelo
  if (QMArticulosID_A_M_C_T.AsInteger > 0) then
  begin
     if (Application.MessageBox(PChar(string(_('¿Desea copiar los datos al resto de articulos del mismo modelo?'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes) then
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT ART.ARTICULO, ART.ID_A ');
                 SelectSQL.Add(' FROM ART_ARTICULOS ART ');
                 SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
                 SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' -- ID_A_M ES EL MODELO DEL ARTICULO ');
                 SelectSQL.Add(' AMC.ID_A_M = (SELECT AMC.ID_A_M ');
                 SelectSQL.Add('               FROM ART_ARTICULOS ART ');
                 SelectSQL.Add('               JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
                 SelectSQL.Add('               JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
                 SelectSQL.Add('               WHERE ');
                 SelectSQL.Add('               ART.EMPRESA = :EMPRESA AND ');
                 SelectSQL.Add('               ART.ARTICULO = :ARTICULO) ');
                 Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
                 Open;
                 while not EOF do
                 begin
                    Articulo := FieldByName('ARTICULO').AsString;
                    IdA := FieldByName('ID_A').AsInteger;

                    // Borro el codigo que haya para el proveedor y pongo el nuevo
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' DELETE FROM ART_ARTICULOS_CODPROV ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' ARTICULO = :ARTICULO AND ');
                          SQL.Add(' PROVEEDOR = :PROVEEDOR ');
                          Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          Params.ByName['PROVEEDOR'].AsInteger := QMProvArtPROVEEDOR.AsInteger;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_CODPROV ( ');
                          SQL.Add(' EMPRESA, ARTICULO, ID_A, PROVEEDOR, CODIGO_PROVEEDOR, TITULO_ART) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :EMPRESA, :ARTICULO, :ID_A, :PROVEEDOR, :CODIGO_PROVEEDOR, :TITULO_ART) ');
                          SQL.Add(' MATCHING (EMPRESA, ARTICULO, PROVEEDOR, CODIGO_PROVEEDOR) ');
                          Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          Params.ByName['ID_A'].AsInteger := IdA;
                          Params.ByName['PROVEEDOR'].AsInteger := QMProvArtPROVEEDOR.AsInteger;
                          Params.ByName['CODIGO_PROVEEDOR'].AsString := QMProvArtCODIGO_PROVEEDOR.AsString;
                          Params.ByName['TITULO_ART'].AsString := QMProvArtTITULO_ART.AsString;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMArticulos.Traspasa_agrupaciones;
begin
  HayOr := True;

  // Detecta que ha habido una condición OR para incluirla en el Select de QMClientes
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_TMP_ART (:EMPRESA, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.FiltraSeleccion;
// var
//   old_order : string;
begin
  with QMArticulos do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     // old_order := OrdenadoPor;
     // Ordenar('');
     SelectSQL.Add(' AND (');
     SelectSQL.Add(' ARTICULO IN (SELECT AGT.ARTICULO FROM TMP_ARTICULOS_AGRUPACION_TMP AGT WHERE AGT.ENTRADA = ' + REntorno.EntradaStr + ') ');
     if (HayOR = True) then
        SelectSQL.Add(' OR (ARTICULO IN (SELECT AG.ARTICULO FROM TMP_ARTICULOS_AGRUPACION AG WHERE (AG.ENTRADA = ' + REntorno.EntradaStr + '))) ');
     SelectSQL.Add(') ');

     // Ordenar(old_order);
     SelectSQL.Add(' ORDER BY ARTICULO ');

     if ExisteParametro(QMArticulos, 'EMPRESA') then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if ExisteParametro(QMArticulos, 'EJERCICIO') then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     if ExisteParametro(QMArticulos, 'CANAL') then
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if ExisteParametro(QMArticulos, 'FAMILIA') then
        Params.ByName['FAMILIA'].AsString := REntorno.FamDefecto;

     Open;
  end;
end;

// *********** Procesos que se usan para el filtrado de clientes por Agrupación
procedure TDMArticulos.Borra_TMP_agrupaciones;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ARTICULOS_AGRUPACION_TMP';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ARTICULOS_AGRUPACION';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.Carga_agrupaciones(agrupacion: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CARGA_TMP_ART (:EMPRESA, :ENTRADA, :AGRUPACION)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['AGRUPACION'].AsString := agrupacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.Filtra_agrupaciones(Agrupacion: string; Negativo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FILTRA_TMP_ART (:EMPRESA, :ENTRADA, :AGRUPACION, :NEG)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        Params.ByName['NEG'].AsInteger := Negativo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.FiltrarPorProveedor(Proveedor: integer);
begin
  FiltroProveedor := '';
  if (Proveedor <> 0) then
     FiltroProveedor := ' AND ARTICULO IN (SELECT ARTICULO FROM ART_ARTICULOS_PROVEEDORES WHERE EMPRESA = :EMPRESA AND PROVEEDOR = ' + IntToStr(Proveedor) + ') ';

  Filtrar;
end;

procedure TDMArticulos.FiltrarPorCliente(Cliente: integer);
begin
  FiltroCliente := '';
  if (Cliente <> 0) then
     FiltroCliente := ' AND ARTICULO IN (SELECT ARTICULO FROM ART_ARTICULOS_CODCLI WHERE EMPRESA = :EMPRESA AND CLIENTE = ' + IntToStr(Cliente) + ')';

  Filtrar;
end;

procedure TDMArticulos.FiltrarPorRefCliente(RefCliente: string);
begin
  RefCliente := Trim(RefCliente);

  FiltroRefCliente := '';
  if (RefCliente > '') then
     FiltroRefCliente := ' AND ARTICULO IN (SELECT ARTICULO FROM ART_ARTICULOS_CODCLI WHERE EMPRESA = :EMPRESA AND CODIGO_CLIENTE = ''' + Trim(RefCliente) + ''') ';

  Filtrar;
end;

procedure TDMArticulos.FiltrarPorRefProveedor(RefProveedor: string);
begin
  RefProveedor := Trim(RefProveedor);

  FiltroRefProveedor := '';
  if (RefProveedor > '') then
     FiltroRefProveedor := ' AND ARTICULO IN (SELECT ARTICULO FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = :EMPRESA AND CODIGO_PROVEEDOR = ''' + RefProveedor + ''') ';

  Filtrar;
end;

procedure TDMArticulos.Filtrar;
begin
  with QMArticulos do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     if (Trim(FiltroCliente) <> '') then
        SelectSQL.Add(FiltroCliente);

     if (Trim(FiltroRefCliente) <> '') then
        SelectSQL.Add(FiltroRefCliente);

     if (Trim(FiltroProveedor) <> '') then
        SelectSQL.Add(FiltroProveedor);

     if (Trim(FiltroRefProveedor) <> '') then
        SelectSQL.Add(FiltroRefProveedor);

     if (Trim(FiltroFamilia) <> '') then
        SelectSQL.Add(FiltroFamilia);

     if (Trim(FiltroArticulo) <> '') then
        SelectSQL.Add(FiltroArticulo);

     if (Trim(FiltroTituloArticulo) <> '') then
        SelectSQL.Add(FiltroTituloArticulo);

     SelectSQL.Add(' ORDER BY ARTICULO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;

     Open;
  end;

  AbrirFicha;
end;

procedure TDMArticulos.FiltrarPorArticulo(Articulo: string);
begin
  Articulo := Trim(Articulo);

  FiltroArticulo := '';
  if (Articulo > '') then
     FiltroArticulo := ' AND UPPER(ARTICULO) = UPPER(''' + Articulo + ''') ';

  Filtrar;
end;

procedure TDMArticulos.FiltrarPorTituloArticulo(Titulo: string);
begin
  Titulo := Trim(Titulo);

  FiltroTituloArticulo := '';
  if (Titulo > '') then
     FiltroTituloArticulo := ' AND UPPER(TITULO_LARGO) LIKE UPPER(''%' + Titulo + '%'') ';

  Filtrar;
end;

procedure TDMArticulos.FiltrarPorFamilia(Familia: string);
begin
  Familia := Trim(Familia);

  FiltroFamilia := '';
  if (Familia > '') then
     FiltroFamilia := ' AND FAMILIA = ''' + Familia + ''' ';

  Filtrar;
end;

procedure TDMArticulos.QMArticulosLANZADA_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  i : integer;
  Stock : double;
  Articulo : string;
begin
  if ((AlmacenLanzada = 'NOCALC') or (QMArticulosCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
  begin
     Articulo := QMArticulosARTICULO.AsString;
     with LanzadaAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(M.UNIDADES_NEC) ');
                 SQL.Add(' FROM PRO_ORD P ');
                 SQL.Add(' JOIN PRO_ORD_MAT M ON P.ID_ORDEN = M.ID_ORDEN ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' P.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' P.CANAL = :CANAL AND ');
                 SQL.Add(' P.SITUACION = 1 AND ');
                 SQL.Add(' M.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' M.COMPONENTE = :ARTICULO ');
                 if (AlmacenLanzada <> '') then
                    SQL.Add(' AND M.ALMACEN = :ALMACEN ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['ARTICULO'].AsString := Articulo;
                 if (AlmacenLanzada <> '') then
                    Params.ByName['ALMACEN'].AsString := AlmacenLanzada;
                 ExecQuery;
                 Stock := FieldByName['SUM'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;
     Text := FormatFloat(MascaraN, Stock);
  end;
end;

procedure TDMArticulos.QuitaFiltros;
begin
  FiltroCliente := '';
  FiltroRefCliente := '';
  FiltroRefProveedor := '';
  FiltroProveedor := '';
  FiltroFamilia := '';
  FiltroArticulo := '';
  FiltroTituloArticulo := '';
  Filtrar;
end;

procedure TDMArticulos.QMCliArtCLIENTEChange(Sender: TField);
begin
  QMCliArtNOMBRE_R_SOCIAL.AsString := DameTituloCliente(QMCliArtCLIENTE.AsInteger);
end;

procedure TDMArticulos.FiltraAgrupacionDisponible(Filtro: string);
begin
  Filtro := Trim(Filtro);
  with xAgrupDisp do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT TITULO, AGRUPACION ');
     SelectSQL.Add(' FROM VER_AGRUPACIONES ');
     SelectSQL.Add(' WHERE ');
     if (Filtro > '') then
     begin
        SelectSQL.Add(' ((UPPER(TITULO) LIKE  UPPER(''%' + Copy(Filtro, 1, 40) + '%'')) OR ');
        SelectSQL.Add('  (UPPER(AGRUPACION) LIKE  UPPER(''%' + Copy(Filtro, 1, 3) + '%''))) AND ');
     end;
     SelectSQL.Add(' TIPO = ''T'' AND ');
     SelectSQL.Add(' AGRUPACION NOT IN (SELECT AGRUPACION ');
     SelectSQL.Add('                    FROM EMP_AGRUPACIONES_ART ');
     SelectSQL.Add('                    WHERE ');
     SelectSQL.Add('                    ID_A = :ID_A) ');
     SelectSQL.Add(' ORDER BY AGRUPACION ');
     Open;
  end;
end;

procedure TDMArticulos.QMArtStocksAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMArtStocks, 'ALMACEN', QMArtStocksALMACEN.AsString);
end;

procedure TDMArticulos.xBultosNewRecord(DataSet: TDataSet);
begin
  xBultosEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  xBultosARTICULO.AsString := QMArticulosARTICULO.AsString;
end;

procedure TDMArticulos.xBultosBULTOChange(Sender: TField);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT TITULO FROM ART_BULTOS WHERE EMPRESA = :EMPRESA AND BULTO = :BULTO';
        Params.ByName['EMPRESA'].AsInteger := xBultosEMPRESA.AsInteger;
        Params.ByName['BULTO'].AsInteger := xBultosBULTO.AsInteger;
        ExecQuery;
        xBultosTITULO.AsString := FieldByName['TITULO'].AsString;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.QMPictogramaNewRecord(DataSet: TDataSet);
begin
  QMPictogramaEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  QMPictogramaARTICULO.AsString := QMArticulosARTICULO.AsString;
end;

procedure TDMArticulos.QMPictogramaBeforePost(DataSet: TDataSet);
begin
  if (QMArticulos.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(PICTOGRAMA) FROM VER_ARTICULOS_PICTOGRAMAS WHERE EMPRESA=:EMPRESA AND ARTICULO=:ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
           ExecQuery;
           QMPictogramaPICTOGRAMA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMArticulos.QMArtStocksCalcFields(DataSet: TDataSet);
begin
  QMArtStocksSTOCK_REAL.AsFloat := QMArtStocksEXISTENCIAS.AsFloat - QMArtStocksPEDIDOS_D_CLI.AsFloat;
end;

procedure TDMArticulos.xLogisticaNewRecord(DataSet: TDataSet);
begin
  xLogisticaEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  xLogisticaARTICULO.AsString := QMArticulosARTICULO.AsString;
  xLogisticaID_A.AsInteger := QMArticulosID_A.AsInteger;
  xLogisticaEAN13.AsString := DameEAN13Articulo(QMArticulosARTICULO.AsString);
  xLogisticaDUN14.AsString := DameDUN14Articulo(QMArticulosARTICULO.AsString);
  xLogisticaPESO_ENVASE_GR.AsFloat := QMArticulosPESO.AsFloat;
  xLogisticaALTO_ENVASE_CM.AsFloat := QMArticulosALTO.AsFloat;
  xLogisticaANCHO_ENVASE_CM.AsFloat := QMArticulosANCHO.AsFloat;
  xLogisticaFONDO_ENVASE_CM.AsFloat := QMArticulosFONDO.AsFloat;
end;

procedure TDMArticulos.AbrirLogistica;
begin
  xLogistica.Open;
end;

procedure TDMArticulos.CerrarLogistica;
begin
  xLogistica.Close;
end;

procedure TDMArticulos.AsignarDUN14(Codigo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_BARRAS ( ');
        SQL.Add(' EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION) ');
        SQL.Add(' MATCHING (EMPRESA, ARTICULO, TIPO) ');
        Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
        Params.ByName['BARRAS'].AsString := Codigo;
        Params.ByName['TIPO'].AsInteger := 6;
        Params.ByName['FUNCION'].AsInteger := 1;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.AsignarEAN13(Codigo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_BARRAS ( ');
        SQL.Add(' EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION) ');
        SQL.Add(' MATCHING (EMPRESA, ARTICULO, TIPO) ');
        Params.ByName['EMPRESA'].AsInteger := QMArticulosEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMArticulosARTICULO.AsString;
        Params.ByName['BARRAS'].AsString := Codigo;
        Params.ByName['TIPO'].AsInteger := 3;
        Params.ByName['FUNCION'].AsInteger := 1;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.AsignarMedidas(Peso, Alto, Ancho, Fondo: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE ART_ARTICULOS ');
        SQL.Add(' SET ');
        SQL.Add(' PESO = :PESO, ');
        SQL.Add(' ALTO = :ALTO, ');
        SQL.Add(' ANCHO = :ANCHO, ');
        SQL.Add(' FONDO = :FONDO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_A = :ID_A ');
        Params.ByName['ID_A'].AsInteger := QMArticulosID_A.AsInteger;
        Params.ByName['PESO'].AsFloat := Peso;
        Params.ByName['ALTO'].AsFloat := Alto;
        Params.ByName['ANCHO'].AsFloat := Ancho;
        Params.ByName['FONDO'].AsFloat := Fondo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArticulos.xCaracteristicaNewRecord(DataSet: TDataSet);
begin
  xCaracteristicaEMPRESA.AsInteger := QMArticulosEMPRESA.AsInteger;
  xCaracteristicaARTICULO.AsString := QMArticulosARTICULO.AsString;
  xCaracteristicaID_A.AsInteger := QMArticulosID_A.AsInteger;
end;

procedure TDMArticulos.xCaracteristicaCODIGOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM ART_CARACTERISTICAS WHERE EMPRESA=:EMPRESA AND CODIGO=:CODIGO';
        Params.ByName['EMPRESA'].AsInteger := xCaracteristicaEMPRESA.AsInteger;
        Params.ByName['CODIGO'].AsString := xCaracteristicaCODIGO.AsString;
        ExecQuery;
        xCaracteristicaTITULO.AsString := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
