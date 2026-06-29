unit UDMAgrupacionPedidosVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBDataSetRO, HYFIBQuery;

type
  TDMAgrupacionPedidosVentas = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     TLocal: THYTransaction;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCLIENTE: TIntegerField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleUNIDADES_SERVIDAS: TFloatField;
     QMDetalleUNIDADES_RESERVADAS: TFloatField;
     QMDetalleSERVIDO: TIntegerField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleENTRADA_AGRUPACION: TIntegerField;
     EBusca: TEntornoFind2000;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleMONEDA: TFIBStringField;
     xArticulos: TFIBDataSetRO;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     xRecorre: TFIBDataSetRO;
     xProcesar: TFIBDataSetRO;
     QMDetalleENTRADA: TIntegerField;
     xPortes: TFIBDataSetRO;
     xPortesTITULO: TFIBStringField;
     DSxPortes: TDataSource;
     xRangos: TFIBDataSetRO;
     xRangosTITULO: TFIBStringField;
     DSxRangos: TDataSource;
     xIndices: TFIBDataSetRO;
     DSxIndices: TDataSource;
     xIndicesTITULO: TFIBStringField;
     QMDetalleTIPO_LINEA: TFIBStringField;
     QMDetalleID_S: TIntegerField;
     QMDetalleORIGEN: TIntegerField;
     xCanales: TFIBDataSetRO;
     DSxCanales: TDataSource;
     xCanalesTITULO: TFIBStringField;
     xDocumentos: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     QMDetalleUNIDADES_PENDIENTES: TFloatField;
     QMDetalleFECHA_ENTREGA_PREV: TDateTimeField;
     QMDetalleBARRAS: TFIBStringField;
     QMDetalleDIRECCION_ENTREGA: TIntegerField;
     xFacturados: TFIBDataSetRO;
     xFacturadosARTICULO: TFIBStringField;
     TUpdate: THYTransaction;
     DSQMCabeceraPre: TDataSource;
     DSQMDetallePre: TDataSource;
     QMCabeceraPre: TFIBTableSet;
     QMDetallePre: TFIBTableSet;
     QMCabeceraPreEMPRESA: TIntegerField;
     QMCabeceraPreHOJA: TIntegerField;
     QMCabeceraPreCLIENTE: TIntegerField;
     QMCabeceraPreFECHA_INICIO: TDateTimeField;
     QMCabeceraPreFECHA_FIN: TDateTimeField;
     QMCabeceraPreCOMENTARIO: TFIBStringField;
     QMCabeceraPreTOTAL_UNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraPreTOTAL_UNIDADES: TFloatField;
     QMCabeceraPreDIRECCION: TIntegerField;
     QMCabeceraPreID: TIntegerField;
     QMCabeceraPreESTADO: TIntegerField;
     QMCabeceraPreRESPONSABLE: TIntegerField;
     QMCabeceraPreID_EMPLEADO: TIntegerField;
     QMCabeceraPreGENERAR_ALBARAN: TIntegerField;
     QMDetallePreEMPRESA: TIntegerField;
     QMDetallePreHOJA: TIntegerField;
     QMDetallePreLINEA: TIntegerField;
     QMDetallePreEJERCICIO: TIntegerField;
     QMDetallePreCANAL: TIntegerField;
     QMDetallePreSERIE: TFIBStringField;
     QMDetallePreTIPO: TFIBStringField;
     QMDetallePreRIG: TIntegerField;
     QMDetallePreLINEA_PED: TIntegerField;
     QMDetallePreALMACEN: TFIBStringField;
     QMDetallePreARTICULO: TFIBStringField;
     QMDetallePreUNIDADES_PED: TFloatField;
     QMDetallePreTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetallePreUNIDADES_LOGISTICAS: TFloatField;
     QMDetallePreUNIDADES: TFloatField;
     QMDetallePrePICO: TFloatField;
     QMDetallePrePUNTOS: TFloatField;
     QMDetallePrePESO: TFloatField;
     QMDetallePrePREPARACION: TIntegerField;
     QMDetallePreID: TIntegerField;
     QMDetallePreID_HOJA: TIntegerField;
     QMDetallePreID_S: TIntegerField;
     QMDetallePreID_DETALLES_S: TIntegerField;
     QMDetallePreID_A: TIntegerField;
     QMCabeceraAlbaran: TFIBTableSet;
     DSQMCabeceraAlbaran: TDataSource;
     QMDetalleAlbaran: TFIBTableSet;
     DSQMDetalleAlbaran: TDataSource;
     DSQMDetallePreUbicaciones: TDataSource;
     QMDetallePreUbicaciones: TFIBTableSet;
     QMDetallePreUbicacionesEMPRESA: TIntegerField;
     QMDetallePreUbicacionesHOJA: TIntegerField;
     QMDetallePreUbicacionesLINEA: TIntegerField;
     QMDetallePreUbicacionesLINEA_UBICACION: TIntegerField;
     QMDetallePreUbicacionesUNIDADES: TFloatField;
     QMDetallePreUbicacionesALMACEN: TFIBStringField;
     QMDetallePreUbicacionesCALLE: TFIBStringField;
     QMDetallePreUbicacionesESTANTERIA: TFIBStringField;
     QMDetallePreUbicacionesREPISA: TFIBStringField;
     QMDetallePreUbicacionesPOSICION: TFIBStringField;
     QMDetallePreUbicacionesVOLUMEN: TFloatField;
     QMDetallePreUbicacionesPESO: TFloatField;
     QMDetallePreUbicacionesDIAMETRO: TFloatField;
     QMDetallePreUbicacionesID: TIntegerField;
     QMDetallePreUbicacionesID_HOJA: TIntegerField;
     QMDetallePreUbicacionesID_HOJA_DET: TIntegerField;
     QMDetallePreUbicacionesID_A: TIntegerField;
     QMDetallePreUbicacionesID_DETALLES_S: TIntegerField;
     QMDetallePreUbicacionesID_UBICACION: TIntegerField;
     QMDetallePreUbicacionesID_A_UBICACION: TIntegerField;
     QMDetallePreUbicacionesID_D_S_UBICACION: TIntegerField;
     QMDetallePreUbicacionesLOTE: TFIBStringField;
     QMCabeceraAlbaranEMPRESA: TIntegerField;
     QMCabeceraAlbaranEJERCICIO: TIntegerField;
     QMCabeceraAlbaranCANAL: TIntegerField;
     QMCabeceraAlbaranSERIE: TFIBStringField;
     QMCabeceraAlbaranTIPO: TFIBStringField;
     QMCabeceraAlbaranRIG: TIntegerField;
     QMCabeceraAlbaranALMACEN: TFIBStringField;
     QMCabeceraAlbaranMONEDA: TFIBStringField;
     QMCabeceraAlbaranFECHA: TDateTimeField;
     QMCabeceraAlbaranCLIENTE: TIntegerField;
     QMCabeceraAlbaranTERCERO: TIntegerField;
     QMCabeceraAlbaranDIRECCION: TIntegerField;
     QMCabeceraAlbaranSU_REFERENCIA: TFIBStringField;
     QMCabeceraAlbaranFORMA_PAGO: TFIBStringField;
     QMCabeceraAlbaranCAMPANYA: TIntegerField;
     QMCabeceraAlbaranNOTAS: TBlobField;
     QMCabeceraAlbaranESTADO: TIntegerField;
     QMCabeceraAlbaranBULTOS: TIntegerField;
     QMCabeceraAlbaranLINEAS: TIntegerField;
     QMCabeceraAlbaranBRUTO: TFloatField;
     QMCabeceraAlbaranI_DTO_LINEAS: TFloatField;
     QMCabeceraAlbaranS_BASES: TFloatField;
     QMCabeceraAlbaranM_BRUTO: TFloatField;
     QMCabeceraAlbaranC_TOTAL: TFloatField;
     QMCabeceraAlbaranAGENTE: TIntegerField;
     QMCabeceraAlbaranS_CUOTA_IVA: TFloatField;
     QMCabeceraAlbaranS_CUOTA_RE: TFloatField;
     QMCabeceraAlbaranDTO_PP: TFloatField;
     QMCabeceraAlbaranDTO_CIAL: TFloatField;
     QMCabeceraAlbaranB_COMISION: TFloatField;
     QMCabeceraAlbaranI_COMISION: TFloatField;
     QMCabeceraAlbaranPOR_FINANCIACION: TFloatField;
     QMCabeceraAlbaranI_FINANCIACION: TFloatField;
     QMCabeceraAlbaranLIQUIDO: TFloatField;
     QMCabeceraAlbaranENTRADA: TIntegerField;
     QMCabeceraAlbaranPROCESO_AUTO: TIntegerField;
     QMCabeceraAlbaranI_DTO_PP: TFloatField;
     QMCabeceraAlbaranI_DTO_CIAL: TFloatField;
     QMCabeceraAlbaranPORTES: TIntegerField;
     QMCabeceraAlbaranI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraAlbaranS_BASES_CANAL: TFloatField;
     QMCabeceraAlbaranS_CUOTA_IVA_CANAL: TFloatField;
     QMCabeceraAlbaranS_CUOTA_RE_CANAL: TFloatField;
     QMCabeceraAlbaranLIQUIDO_CANAL: TFloatField;
     QMCabeceraAlbaranCHG_MONEDA: TIntegerField;
     QMCabeceraAlbaranTARIFA: TFIBStringField;
     QMCabeceraAlbaranB_DTO_LINEAS: TFloatField;
     QMCabeceraAlbaranID_S: TIntegerField;
     QMCabeceraAlbaranCLIENTE_EDI: TFIBStringField;
     QMCabeceraAlbaranCOMPRADOR: TFIBStringField;
     QMCabeceraAlbaranVENDEDOR: TFIBStringField;
     QMCabeceraAlbaranDPTO: TFIBStringField;
     QMCabeceraAlbaranRECEPTOR: TFIBStringField;
     QMCabeceraAlbaranMUELLE: TFIBStringField;
     QMCabeceraAlbaranPAGADOR: TFIBStringField;
     QMCabeceraAlbaranRECOGIDA: TFIBStringField;
     QMCabeceraAlbaranDESTINO: TFIBStringField;
     QMCabeceraAlbaranMODIFICA_DOC: TIntegerField;
     QMCabeceraAlbaranCOMISION_LINEAL: TFloatField;
     QMCabeceraAlbaranI_COMISION_LINEAL: TFloatField;
     QMCabeceraAlbaranFECHA_ENTREGA: TDateTimeField;
     QMCabeceraAlbaranIDIOMA: TFIBStringField;
     QMCabeceraAlbaranENVIO: TIntegerField;
     QMCabeceraAlbaranUSUARIO: TIntegerField;
     QMCabeceraAlbaranCONTACTO: TIntegerField;
     QMCabeceraAlbaranMARGEN_KRI: TFloatField;
     QMCabeceraAlbaranADJUNTO: TFIBStringField;
     QMCabeceraAlbaranNOTAS_INTERNAS_KRI: TBlobField;
     QMCabeceraAlbaranTIPO_LINEA_KRI: TIntegerField;
     QMCabeceraAlbaranI_PORTES: TFloatField;
     QMCabeceraAlbaranPOR_PORTES: TFloatField;
     QMCabeceraAlbaranTIPO_PORTES: TIntegerField;
     QMCabeceraAlbaranI_PORTES_CANAL: TFloatField;
     QMCabeceraAlbaranRANGO: TIntegerField;
     QMCabeceraAlbaranINDICE: TIntegerField;
     QMCabeceraAlbaranCAMBIO_FIJO: TIntegerField;
     QMCabeceraAlbaranVALOR_CAMB_FIJO: TFloatField;
     QMCabeceraAlbaranPROYECTO: TIntegerField;
     QMCabeceraAlbaranFECHA_CREACION_KRI: TDateTimeField;
     QMCabeceraAlbaranPEDIDO_CLIENTE: TFIBStringField;
     QMCabeceraAlbaranZ_CONTACTO: TIntegerField;
     QMCabeceraAlbaranZ_OBSERVACION: TFIBStringField;
     QMCabeceraAlbaranCONTADOR: TIntegerField;
     QMCabeceraAlbaranENTRADA1: TIntegerField;
     QMCabeceraAlbaranEMPRESA1: TIntegerField;
     QMCabeceraAlbaranEJERCICIO1: TIntegerField;
     QMCabeceraAlbaranCANAL1: TIntegerField;
     QMCabeceraAlbaranSERIE1: TFIBStringField;
     QMCabeceraAlbaranTIPO1: TFIBStringField;
     QMCabeceraAlbaranRIG1: TIntegerField;
     QMDetalleAlbaranEMPRESA: TIntegerField;
     QMDetalleAlbaranEJERCICIO: TIntegerField;
     QMDetalleAlbaranCANAL: TIntegerField;
     QMDetalleAlbaranSERIE: TFIBStringField;
     QMDetalleAlbaranTIPO: TFIBStringField;
     QMDetalleAlbaranRIG: TIntegerField;
     QMDetalleAlbaranLINEA: TIntegerField;
     QMDetalleAlbaranALMACEN: TFIBStringField;
     QMDetalleAlbaranARTICULO: TFIBStringField;
     QMDetalleAlbaranTITULO: TFIBStringField;
     QMDetalleAlbaranUNIDADES: TFloatField;
     QMDetalleAlbaranPRECIO: TFloatField;
     QMDetalleAlbaranPIEZAS_X_BULTO: TIntegerField;
     QMDetalleAlbaranBULTOS: TIntegerField;
     QMDetalleAlbaranDESCUENTO: TFloatField;
     QMDetalleAlbaranDESCUENTO_2: TFloatField;
     QMDetalleAlbaranDESCUENTO_3: TFloatField;
     QMDetalleAlbaranCOMISION: TFloatField;
     QMDetalleAlbaranP_COSTE: TFloatField;
     QMDetalleAlbaranM_MOV_STOCK: TIntegerField;
     QMDetalleAlbaranPAIS: TFIBStringField;
     QMDetalleAlbaranTIPO_IVA: TIntegerField;
     QMDetalleAlbaranP_IVA: TFloatField;
     QMDetalleAlbaranP_RECARGO: TFloatField;
     QMDetalleAlbaranBRUTO: TFloatField;
     QMDetalleAlbaranB_COMISION: TFloatField;
     QMDetalleAlbaranDTO_PP: TFloatField;
     QMDetalleAlbaranDTO_CIAL: TFloatField;
     QMDetalleAlbaranI_DTO_PP: TFloatField;
     QMDetalleAlbaranI_DTO_CIAL: TFloatField;
     QMDetalleAlbaranI_DESCUENTO: TFloatField;
     QMDetalleAlbaranB_IMPONIBLE: TFloatField;
     QMDetalleAlbaranB_DTO_LINEA: TFloatField;
     QMDetalleAlbaranI_COMISION: TFloatField;
     QMDetalleAlbaranC_IVA: TFloatField;
     QMDetalleAlbaranC_RECARGO: TFloatField;
     QMDetalleAlbaranT_COSTE: TFloatField;
     QMDetalleAlbaranM_BRUTO: TFloatField;
     QMDetalleAlbaranLIQUIDO: TFloatField;
     QMDetalleAlbaranENTRADA: TIntegerField;
     QMDetalleAlbaranNOTAS: TBlobField;
     QMDetalleAlbaranUNIDADES_EXT: TFloatField;
     QMDetalleAlbaranIVA_INCLUIDO: TIntegerField;
     QMDetalleAlbaranNSERIE: TFIBStringField;
     QMDetalleAlbaranB_COMISION_CANAL: TFloatField;
     QMDetalleAlbaranEJER_MOV: TIntegerField;
     QMDetalleAlbaranUNIDADES_SEC: TFloatField;
     QMDetalleAlbaranNO_FABRICACION_KRI: TFIBStringField;
     QMDetalleAlbaranID_S: TIntegerField;
     QMDetalleAlbaranID_DETALLES_S: TIntegerField;
     QMDetalleAlbaranID_D_S_GR: TIntegerField;
     QMDetalleAlbaranID_A_M_C_T: TIntegerField;
     QMDetalleAlbaranID_C_A: TIntegerField;
     QMDetalleAlbaranID_A: TIntegerField;
     QMDetalleAlbaranID_MOV_STOCKS: TIntegerField;
     QMDetalleAlbaranCOMISION_LINEAL: TFloatField;
     QMDetalleAlbaranI_COMISION_LINEAL: TFloatField;
     QMDetalleAlbaranTITULO_IDIOMA: TFIBStringField;
     QMDetalleAlbaranMARGEN_KRI: TFloatField;
     QMDetalleAlbaranTIPO_LINEA_KRI: TIntegerField;
     QMDetalleAlbaranORDEN: TIntegerField;
     QMDetalleAlbaranTIPO_LINEA: TFIBStringField;
     QMDetalleAlbaranORIGEN: TIntegerField;
     QMDetalleAlbaranPROC_PROMOCION: TIntegerField;
     QMDetalleAlbaranID_P: TIntegerField;
     QMDetalleAlbaranAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMDetalleAlbaranPROYECTO: TIntegerField;
     QMDetalleAlbaranCERTIFICADO: TIntegerField;
     QMDetalleAlbaranCERT_NEGATIVO: TIntegerField;
     QMDetalleAlbaranLINEA_RELACION: TIntegerField;
     QMDetalleAlbaranNOTAS2: TBlobField;
     QMDetalleAlbaranCRC_NOTAS: TFIBStringField;
     QMDetalleAlbaranCRC_NOTAS2: TFIBStringField;
     QMDetalleAlbaranPRO_NUM_PLANO: TFIBStringField;
     QMDetallePreUNIDADES_A_SERVIR: TFloatField;
     xRecorreCabHojas: TFIBDataSetRO;
     DsxRecorreCabHojas: TDataSource;
     xRecorreDetHoja: TFIBDataSetRO;
     DSxRecorreDetHojas: TDataSource;
     xRecorreCabHojasEMPRESA: TIntegerField;
     xRecorreCabHojasHOJA: TIntegerField;
     xRecorreCabHojasCLIENTE: TIntegerField;
     xRecorreCabHojasFECHA_INICIO: TDateTimeField;
     xRecorreCabHojasFECHA_FIN: TDateTimeField;
     xRecorreCabHojasCOMENTARIO: TFIBStringField;
     xRecorreCabHojasTOTAL_UNIDADES_LOGISTICAS: TFloatField;
     xRecorreCabHojasTOTAL_UNIDADES: TFloatField;
     xRecorreCabHojasDIRECCION: TIntegerField;
     xRecorreCabHojasID: TIntegerField;
     xRecorreCabHojasESTADO: TIntegerField;
     xRecorreCabHojasRESPONSABLE: TIntegerField;
     xRecorreCabHojasID_EMPLEADO: TIntegerField;
     xRecorreCabHojasGENERAR_ALBARAN: TIntegerField;
     xRecorreDetHojaEMPRESA: TIntegerField;
     xRecorreDetHojaHOJA: TIntegerField;
     xRecorreDetHojaLINEA: TIntegerField;
     xRecorreDetHojaEJERCICIO: TIntegerField;
     xRecorreDetHojaCANAL: TIntegerField;
     xRecorreDetHojaSERIE: TFIBStringField;
     xRecorreDetHojaTIPO: TFIBStringField;
     xRecorreDetHojaRIG: TIntegerField;
     xRecorreDetHojaLINEA_PED: TIntegerField;
     xRecorreDetHojaALMACEN: TFIBStringField;
     xRecorreDetHojaARTICULO: TFIBStringField;
     xRecorreDetHojaUNIDADES_PED: TFloatField;
     xRecorreDetHojaTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     xRecorreDetHojaUNIDADES_LOGISTICAS: TFloatField;
     xRecorreDetHojaUNIDADES: TFloatField;
     xRecorreDetHojaPICO: TFloatField;
     xRecorreDetHojaPUNTOS: TFloatField;
     xRecorreDetHojaPESO: TFloatField;
     xRecorreDetHojaPREPARACION: TIntegerField;
     xRecorreDetHojaID: TIntegerField;
     xRecorreDetHojaID_HOJA: TIntegerField;
     xRecorreDetHojaID_S: TIntegerField;
     xRecorreDetHojaID_DETALLES_S: TIntegerField;
     xRecorreDetHojaID_A: TIntegerField;
     xRecorreDetHojaUNIDADES_A_SERVIR: TFloatField;
     xRecorreDetHojaSERVIDO: TIntegerField;
     QMDetallePreUbicacionesID_LOTE: TIntegerField;
     xLote: TFIBDataSetRO;
     xLoteEMPRESA: TIntegerField;
     xLoteCANAL: TIntegerField;
     xLoteALMACEN: TFIBStringField;
     xLoteARTICULO: TFIBStringField;
     xLoteLOTE: TFIBStringField;
     xLoteSERIE: TFIBStringField;
     xLoteCLASIFICACION: TFIBStringField;
     xLoteF_ENVASADO: TDateTimeField;
     xLoteF_CADUCIDAD: TDateTimeField;
     xLoteF_FABRICACION: TDateTimeField;
     xLoteID_A: TIntegerField;
     xLoteAUTO_REETIQUETADO: TIntegerField;
     xLoteCODIGO: TIntegerField;
     xLotePROVEEDOR: TIntegerField;
     xLoteID_LOTE: TIntegerField;
     xLoteNOTAS: TBlobField;
     QMDetallePAIS: TStringField;
     xUnidadesMarcadas: TFIBDataSetRO;
     DSxUnidadesMarcadas: TDataSource;
     xUnidadesMarcadasUNIDADES: TFloatField;
     xUnidadesMarcadasUNIDADES_SERVIDAS: TFloatField;
     xUnidadesMarcadasUNIDADES_RESERVADAS: TFloatField;
     xUnidadesMarcadasUNIDADES_PENDIENTES: TFloatField;
     QMDetalleSTOCK: TFloatField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMDetalleUNIDADES_POR_UL: TFloatField;
     QMDetalleRELACIONAR_CON_UNIDADES: TIntegerField;
     QMDetalleU_LOGISTICAS_RESERVADAS: TFloatField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMDetalleCANT_LOTE: TIntegerField;
     QMDetalleSTOCK_MINIMO: TFloatField;
     QMDetalleORDEN: TIntegerField;
     QMDetalleUNIDADES_PREPARADAS: TFloatField;
     QMDetalleSU_REFERENCIA: TFIBStringField;
     QMDetalleASEGURADO: TFIBStringField;
     QMDetallePACIENTE: TFIBStringField;
     QMDetalleAUTORIZACION: TFIBStringField;
     QMDetallePOLIZA: TFIBStringField;
     QMDetalleFEC_REC_IH: TDateTimeField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDOCUMENTO_MUESTRAS: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMDetalleREF_PROVEEDOR: TFIBStringField;
     QMDetalleLOTES: TIntegerField;
     xClientesID_CLIENTE: TIntegerField;
     xClientesCLIENTE: TIntegerField;
     xClientesNOMBRE_R_SOCIAL: TFIBStringField;
     xClientesAVISOS: TMemoField;
     QMDetalleLISTO_PARA_PREPARAR: TIntegerField;
     QMDetallePEDIDO_CLIENTE: TFIBStringField;
     QMDetalleLOTE_SIMPLE: TFIBStringField;
     QMDetallePEDIR: TIntegerField;
     QMDireccion: TFIBDataSetRO;
     QMDireccionTERCERO: TIntegerField;
     QMDireccionDIRECCION: TIntegerField;
     QMDireccionDIR_NOMBRE: TFIBStringField;
     QMDireccionDIR_NOMBRE_2: TFIBStringField;
     QMDireccionDIR_NOMBRE_3: TFIBStringField;
     QMDireccionDIR_COMPLETA_N: TFIBStringField;
     QMDireccionLOCALIDAD: TFIBStringField;
     QMDireccionCODIGO_POSTAL: TFIBStringField;
     QMDireccionPROVINCIA: TFIBStringField;
     QMDireccionPAIS: TFIBStringField;
     QMDireccionPAIS_NOMBRE: TFIBStringField;
     DSQMDireccion: TDataSource;
     QMDetallePEDIDOS_A_PRO: TFloatField;
     procedure xClientesAfterOpen(DataSet: TDataSet);
     procedure DMAgrupacionPedidosVentasCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_RECEPCIONChange(Sender: TField);
     procedure QMDetalleUNIDADES_RESERVADASChange(Sender: TField);
     procedure QMDetalleENTRADA_AGRUPACIONChange(Sender: TField);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraPreAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraPreBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAlbaranAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraAlbaranBeforeClose(DataSet: TDataSet);
     procedure QMDetallePreAfterOpen(DataSet: TDataSet);
     procedure QMDetallePreBeforeClose(DataSet: TDataSet);
     procedure xRecorreCabHojasAfterOpen(DataSet: TDataSet);
     procedure QMDetallePreUbicacionesAfterOpen(DataSet: TDataSet);
     procedure QMDetallePreUbicacionesBeforeClose(DataSet: TDataSet);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SERVIDASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_RESERVADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleU_LOGISTICAS_RESERVADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleU_LOGISTICAS_RESERVADASChange(Sender: TField);
     procedure QMDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_PENDIENTESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_PREPARADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     Pais: string;
     Servido: integer;
     Dir: integer;
     Articulo: string;
     CalcularTotales: boolean;
     ModificandoUnidadesReservadas: boolean;
     KriConf108: boolean;
     PedidoDesde: integer;
     PedidoHasta: integer;
     SoloListoPreparar: boolean;
     Param_VENULKG001: boolean;
     StockAlm, PedidosAProv: TStrings;
     procedure CompruebaCambioUnidades;
     function TipoLinea: string;
     function TienePromo: boolean;
     function AceptaCambioCanal: boolean;
     procedure MyFiltraPedidos;
     procedure RefrescarTotales;
     procedure LimpiaLotesTemporales;
  public
     { Public declarations }
     Controla: boolean;
     Fecha_rec: TDateTime;
     SerieDestino: string;
     Proceso_auto: integer;
     Errores: TStringList; {dji lrk kri}
     CalculaStock, PedidosProv: boolean;
     procedure FiltrarPedidos(Cliente: integer; Serie: string);
     procedure RefrescarPedidos;
     procedure MostrarLineasServidas(mostrar: integer);
     procedure MarcarLineasPedidos;
     procedure ServirTodaLinea;
     procedure ServirMarcados;
     procedure DesmarcarEntradas;
     procedure ConfiguraLotes;
     procedure InicializaTraspaso;
     procedure GeneraCabeceras(Ejercicio, Canal, Rig, id_s: integer; Serie, Tipo: string; Transportista, Portes, Rango, Indice, Canal_Destino: integer; I_Portes, Por_Portes: double; Fecha: TDateTime; DireccionKri: integer; ForzarPortes, DividirDirecciones: boolean; IdDocDest: integer);
     procedure TraspasaPedido(id_s, id_s_d: integer; Tipo: string; DividirDirecciones: boolean; ForzarDestino: boolean = False);
     procedure BorraTemporales;
     procedure GrabaDetalle;
     function PermitirTraspaso: boolean;
     procedure ActualizaPedidos(id_s, id_s_d: integer);
     procedure AbreDocumentos(Destino, Ser: string; Contador: integer);
     procedure InsertaErrores(ejercicio, canal, rig: integer; serie: string);
     procedure CorrigeError(ejercicio, canal, rig, id_s: integer; serie: string);
     function HayErrores: boolean;
     procedure MarcarLineasPedidosProc(Marcar: smallint);
     function DameMinTransportista(Cliente: integer): integer;
     procedure DamePortesCliente(Cliente: integer; var Tipo_Portes, Rango, Indice: integer; var I_Portes, Por_Portes: double);
     procedure CambiaPortes(Porte: integer);
     procedure CambiaIndice(Rango, Indice: integer);
     procedure CambiaRango(Rango: integer; var Existe: boolean);
     procedure DameTituloCanal(Canal: integer);
     procedure MuestraDocumentos(Destino, ser: string; contador, CanalDestino: integer);
     procedure FiltraPedidos(aPedidoDesde, aPedidoHasta: integer; aPais: string; aDir: integer; aArticulo: string; aSoloListoPreparar: boolean);
     procedure AgregaArticulo(Articulo: string; Pedido: integer; IdLote: integer = 0; Cantidad: double = 1);
     procedure RecorreProcesados(Entrada: integer);
     procedure Final(proc_auto, CanalDestino: integer; Tipo, serie_fac: string);
     procedure MuestraErrores;
     procedure SetSerie(Serie: string);
     function GetSerie: string;
     procedure SetCliente(Cliente: integer);
     function GetCliente: integer;
     function PuedeRealizarAlbFac(Cliente: integer): boolean;
     procedure ActualizaPrecio(Articulo: string; Proceso_auto: integer);
     procedure RecorreFacturados(Proceso_auto: integer);
     procedure FiltraHojaPreparacion(Cliente: integer);
     procedure InicializaTraspasoHojas(Tipo: string);
     procedure ActualizaInfoAlbaran;
     procedure ActualizaEstadoHojaPrep;
     procedure EnviaPedidosFiltrados;
     procedure ServirArticulo(Articulo: string; Cantidad: currency);
     procedure InfoLotes;
     procedure ImportarXLS(Archivo: string);
  end;

var
  DMAgrupacionPedidosVentas : TDMAgrupacionPedidosVentas;

implementation

uses UDMMain, UEntorno, UFMFacturas, UFMAlbaranes, UUtiles, UFMConfigTraspasoLotes,
  UFMControlAgrupPedidos, UFMAgrupacionPedidosVentas, UFMain, UFormGest, UFParadaExt,
  UFMControlErroresAgrupPec, DateUtils, UFMAsignaLotes, UParam, ComObj, Variants, UDameDato;

{$R *.DFM}

procedure TDMAgrupacionPedidosVentas.DMAgrupacionPedidosVentasCreate(Sender: TObject);
var
  i : integer;
begin
  StockAlm := TStringList.Create;
  PedidosAProv := TStringList.Create;

  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  KriConf108 := (DMMain.EstadoKri(108) = 1);

  xClientes.Close;

  EBusca.Empresa := REntorno.Empresa;
  EBusca.Ejercicio := REntorno.Ejercicio;
  EBusca.Canal := REntorno.Canal;

  // QMDetalleUNIDADES_RESERVADAS.DisplayFormat := MascaraI;
  // QMDetalleUNIDADES_PREPARADAS.DisplayFormat := MascaraI;
  // QMDetalleUNIDADES_SERVIDAS.DisplayFormat := MascaraI;
  QMDetalleSTOCK.DisplayFormat := MascaraI;
  QMDetalleSTOCK_MINIMO.DisplayFormat := MascaraI;
  QMDetalleCANT_LOTE.DisplayFormat := MascaraI;
  QMDetallePRECIO.DisplayFormat := MascaraN;
  xUnidadesMarcadasUNIDADES.DisplayFormat := MascaraI;
  xUnidadesMarcadasUNIDADES_SERVIDAS.DisplayFormat := MascaraI;
  xUnidadesMarcadasUNIDADES_RESERVADAS.DisplayFormat := MascaraI;
  xUnidadesMarcadasUNIDADES_PENDIENTES.DisplayFormat := MascaraI;

  PedidoDesde := 0;
  PedidoHasta := 0;
  Pais := '';
  Servido := 0;
  Dir := 0;
  Articulo := '';
  CalcularTotales := True;
  ModificandoUnidadesReservadas := False;
  CalculaStock := False;
  PedidosProv := False;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  Errores := TStringList.Create;
  MyFiltraPedidos;
end;

procedure TDMAgrupacionPedidosVentas.DataModuleDestroy(Sender: TObject);
begin
  StockAlm.Free;
  PedidosAProv.Free;
  Errores.Free;
  BorraTemporales;
  LimpiaLotesTemporales;
end;

procedure TDMAgrupacionPedidosVentas.xClientesAfterOpen(DataSet: TDataSet);
begin
  MyFiltraPedidos;
end;

procedure TDMAgrupacionPedidosVentas.FiltrarPedidos(Cliente: integer; Serie: string);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.LogIni('FiltrarPedidos');

  // Fuerzo recalculo de stock y Pedidos a proveedor.
  StockAlm.Clear;
  PedidosAProv.Clear;

  with xClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
     if (EBusca.Cliente <> 0) then
        Open;
  end;
  DMMain.LogFin('FiltrarPedidos');
end;

procedure TDMAgrupacionPedidosVentas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAgrupacionPedidosVentas.RefrescarPedidos;
begin
  FiltrarPedidos(EBusca.Cliente, EBusca.Serie);
end;

procedure TDMAgrupacionPedidosVentas.MostrarLineasServidas(Mostrar: integer);
begin
  if (Mostrar <> Servido) then
  begin
     Servido := Mostrar;
     MyFiltraPedidos;
  end;
end;

procedure TDMAgrupacionPedidosVentas.MarcarLineasPedidos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PEDIDOS_MARCA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['CANAL'].AsInteger := EBusca.Canal;
        Params.ByName['SERIE'].AsString := EBusca.Serie;
        Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarPedidos;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADES_RECEPCIONChange(Sender: TField);
begin
  if Sender.AsFloat <> 0 then
     QMDetalleENTRADA_AGRUPACION.AsInteger := REntorno.Entrada
  else
     QMDetalleENTRADA_AGRUPACION.AsInteger := 0;

  if Sender.AsFloat >= QMDetalleUNIDADES.AsFloat then
     QMDetalleSERVIDO.AsInteger := 1
  else
     QMDetalleSERVIDO.AsInteger := 0;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADASChange(Sender: TField);
begin
  QMDetalleENTRADA_AGRUPACION.AsInteger := REntorno.Entrada;

  {dji lrk kri - no permite enviar mas que las pedidas}
  if (QMDetalleUNIDADES_RESERVADAS.AsFloat > QMDetalleUNIDADES_PENDIENTES.AsFloat) then
  begin
     if (KriConf108) then
        Sender.AsFloat := 0;
  end;

  if (Sender.AsFloat + QMDetalleUNIDADES_SERVIDAS.AsFloat) >= QMDetalleUNIDADES.AsFloat then
  begin
     QMDetalleSERVIDO.AsInteger := 1;
  end
  else
  begin
     QMDetalleSERVIDO.AsInteger := 0;
  end;

  if (QMDetalleUNIDADES_RESERVADAS.AsFloat = 0) then
  begin
     ModificandoUnidadesReservadas := True;
     QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := 0;
     ModificandoUnidadesReservadas := False;
  end
  else
  begin
     if ((QMDetalleUNIDADES_RESERVADAS.AsFloat = QMDetalleUNIDADES_PENDIENTES.AsFloat) and
        (QMDetalleUNIDADES_RESERVADAS.AsFloat = QMDetalleUNIDADES.AsFloat)) then
     begin
        ModificandoUnidadesReservadas := True;
        QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := QMDetalleUNIDADES_LOGISTICAS.AsFloat;
        ModificandoUnidadesReservadas := False;
     end
     else
     begin
        // if (QMDetalleRELACIONAR_CON_UNIDADES.AsInteger = 1) then
        // begin
        ModificandoUnidadesReservadas := True;

        if Param_VENULKG001 then
        begin
           if (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
              if (QMDetalleUNIDADES.AsFloat <> 0) then
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat :=
                    Trunc((QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES.AsFloat) * QMDetalleUNIDADES_LOGISTICAS.AsFloat)
              else
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := 1; // No se que hacer aqui.
        end
        else
        if (QMDetalleUNIDADES_POR_UL.AsFloat <> 0) then
        begin
           QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat :=
              Trunc(QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES_POR_UL.AsFloat);
        end
        else
           QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := QMDetalleUNIDADES_RESERVADAS.AsInteger;

        ModificandoUnidadesReservadas := False;
        // end;
     end;
  end;

  CompruebaCambioUnidades;
end;

procedure TDMAgrupacionPedidosVentas.ServirTodaLinea;
begin
  with QMDetalle do
  begin
     if (RecordCount > 0) then
     begin
        if (QMDetalleUNIDADES_RESERVADAS.AsFloat <> QMDetalleUNIDADES.AsFloat -
           QMDetalleUNIDADES_SERVIDAS.AsFloat) then
        begin
           if not (State = dsEdit) then
              Edit;

           ModificandoUnidadesReservadas := True;
           try
              QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat;

              // Si sirvo la totalidad no hago calculos para evitar redondeos
              if (QMDetalleUNIDADES_RESERVADAS.AsFloat = QMDetalleUNIDADES.AsFloat) then
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := QMDetalleUNIDADES_LOGISTICAS.AsFloat
              else
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat :=
                    Trunc(QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES_POR_UL.AsFloat);
           finally
              ModificandoUnidadesReservadas := False;
           end;
           Post;
        end;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.AbreDocumentos(Destino, Ser: string; Contador: integer);
begin
  if (destino = 'ALB') then
  begin
     FMain.EjecutaAccion(FMain.AAlbaranes);
     FMAlbaranes.AgrupacionPedidos(Ser, Contador);
  end
  else
  begin
     FMain.EjecutaAccion(FMain.AFacturas);
     FMFacturas.AgrupacionPedidosFac(Ser, Contador);
  end;
end;

// Servir los Pedidos Marcados
procedure TDMAgrupacionPedidosVentas.ServirMarcados;
begin
  // Commit de la Transacción
  if (QMDetalle.State = dsEdit) then
     QMDetalle.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PEDIDOS_CERRAR_SERVIDOS (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE, :ENTRADA, :FECHA_REC)';
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['CANAL'].AsInteger := EBusca.Canal;
        Params.ByName['SERIE'].AsString := EBusca.Serie;
        Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_REC'].AsDateTime := Fecha_rec;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarPedidos;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleENTRADA_AGRUPACIONChange(Sender: TField);
begin
  if QMDetalleENTRADA_AGRUPACION.AsInteger <> 0 then
     if QMDetalleUNIDADES_RESERVADAS.AsFloat = 0 then
        QMDetalleENTRADA_AGRUPACION.AsInteger := 0;
end;

procedure TDMAgrupacionPedidosVentas.DesmarcarEntradas;
begin
  DMMain.LogIni('DesmarcarEntradas');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_DETALLE_PEDIDO ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA_AGRUPACION = 0, ');
        SQL.Add(' SERVIDO = 0, ');
        SQL.Add(' UNIDADES_RESERVADAS = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO <= :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = ''PEC'' AND ');
        SQL.Add(' CLIENTE = :CLIENTE AND ');
        SQL.Add(' ESTADO <> 5 AND ');
        SQL.Add(' ENTRADA_AGRUPACION = :ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['CANAL'].AsInteger := EBusca.Canal;
        Params.ByName['SERIE'].AsString := EBusca.Serie;
        Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  DMMain.LogFin('DesmarcarEntradas');

  LimpiaLotesTemporales;
end;

procedure TDMAgrupacionPedidosVentas.ConfiguraLotes;
begin
  if (ArticuloLoteable(QMDetalleARTICULO.AsString)) then
  begin
     if (QMDetalle.State = dsEdit) then
        QMDetalle.Post;

     TFMConfigTraspasoLotes.Create(Self).AsignaLote(QMDetalleTIPO.AsString,
        QMDetalleSERIE.AsString,
        QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString,
        QMDetalleEJERCICIO.AsInteger, QMDetalleRIG.AsInteger,
        QMDetalleCANAL.AsInteger, QMDetalleID_A.AsInteger,
        QMDetalleID_DETALLES_S.AsInteger, 0,
        QMDetalleUNIDADES_RESERVADAS.AsFloat);
  end;
end;

procedure TDMAgrupacionPedidosVentas.CompruebaCambioUnidades;
var
  Total : double;
begin
  if (QMDetalleUNIDADES_RESERVADAS.AsFloat > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(UNIDADES) FROM TMP_TRASPASO_PEDIDO_LOTES WHERE ENTRADA = ?ENTRADA AND ID_DETALLES = ?ID_DETALLES_S AND TIPO = ?TIPO';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
           Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
           ExecQuery;
           Total := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((Total > QMDetalleUNIDADES_RESERVADAS.AsFloat) and (Total <> 0)) then
     begin
        ShowMessage(_('Las unidades a servir son menores que las unidades definidas en los lotes'));
        QMDetalleUNIDADES_RESERVADAS.AsFloat := Total;
     end;

     if ((Total < QMDetalleUNIDADES_RESERVADAS.AsFloat) and (Total <> 0)) then
     begin
        ShowMessage(_('Las unidades a servir son mayores que las unidades definidas en los lotes por favor definalas en los lotes'));
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE TMP_TRASPASO_PEDIDO_LOTES ');
              SQL.Add(' SET ERROR = 1 ');
              SQL.Add(' WHERE ENTRADA = ?ENTRADA AND ID_DETALLES = ?ID_DETALLES AND TIPO = ?TIPO ');
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_DETALLES'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
              Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if ((Total = QMDetalleUNIDADES_RESERVADAS.AsFloat) and (Total <> 0)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE TMP_TRASPASO_PEDIDO_LOTES ');
              SQL.Add(' SET ERROR = 0 ');
              SQL.Add(' WHERE ENTRADA = ?ENTRADA AND ID_DETALLES = ?ID_DETALLES AND TIPO = ?TIPO ');
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_DETALLES'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
              Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMAgrupacionPedidosVentas.PermitirTraspaso: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS ERROR FROM TMP_TRASPASO_PEDIDO_LOTES WHERE ENTRADA = ?ENTRADA AND TIPO = ?TIPO AND ERROR = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := 'PEC';
        ExecQuery;
        if (FieldByName['ERROR'].AsInteger > 0) then
           Result := False
        else
           Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.InicializaTraspaso;
begin
  BorraTemporales;

  // Generamos el contador de procesos automaticos
  Proceso_auto := DMMain.ContadorGen('conta_tmp_proc_auto');

  with xRecorre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
     Params.ByName['CANAL'].AsInteger := EBusca.Canal;
     Params.ByName['SERIE'].AsString := EBusca.Serie;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAgrupacionPedidosVentas.GeneraCabeceras(Ejercicio, Canal, Rig, id_s: integer; Serie, Tipo: string; Transportista, Portes, Rango, Indice, Canal_Destino: integer; I_Portes, Por_Portes: double; Fecha: TDateTime; DireccionKri: integer; ForzarPortes, DividirDirecciones: boolean; IdDocDest: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_PED_CLI_PROCESA_PEC ');
        SQL.Add(' (?EMPRESA, ?O_EJERCICIO, ?CANAL, ?SERIE,  ?FECHA, ?ID_S, ?ENTRADA, ?TIPO_DEST, ');
        SQL.Add(' ?EJERCICIO, ?PROC_AUTO, ?TRANSPORTISTA, ?TIPO_PORTES, ?RANGO, ?INDICE, ');
        SQL.Add(' ?I_PORTES, ?POR_PORTES, ?D_CANAL, ?DIRECCION, ?FORZAR_PORTE, ?DIVIDIR_POR_DIRECCION, ');
        SQL.Add(' ?FACTURABLE, ?ID_S_D) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['FECHA'].AsDateTime := Fecha {dji lrk kri - REntorno.FechaTrab};
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO_DEST'].AsString := tipo;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
        Params.ByName['TIPO_PORTES'].AsInteger := Portes;
        Params.ByName['RANGO'].AsInteger := Rango;
        Params.ByName['INDICE'].AsInteger := Indice;
        Params.ByName['I_PORTES'].AsFloat := I_Portes;
        Params.ByName['POR_PORTES'].AsFloat := Por_Portes;
        Params.ByName['D_CANAL'].AsInteger := Canal_destino;
        Params.ByName['DIRECCION'].AsInteger := DireccionKri;
        Params.ByName['FORZAR_PORTE'].AsInteger := BoolToInt(ForzarPortes);
        Params.ByName['DIVIDIR_POR_DIRECCION'].AsInteger := BoolToInt(DividirDirecciones);
        Params.ByName['FACTURABLE'].AsInteger := BoolToInt(LeeParametro('ALBFACT001') = 'S');
        Params.ByName['ID_S_D'].AsInteger := IdDocDest;
        ExecQuery;
        SerieDestino := FieldByName['SERIE_DESTINO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.TraspasaPedido(id_s, id_s_d: integer; Tipo: string; DividirDirecciones: boolean; ForzarDestino: boolean = False);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_PED_CLI_TRASPASA_PEC(?ID_S, ?ID_S_D, ?ENTRADA, ?TIPO_DEST, ?FECHA_REC, ?DIVIDIR_POR_DIRECCION, :FORZAR_DESTINO)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ID_S_D'].AsInteger := id_s_d;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO_DEST'].AsString := Tipo;
        Params.ByName['FECHA_REC'].AsDateTime := Fecha_rec;
        Params.ByName['DIVIDIR_POR_DIRECCION'].AsInteger := BoolToInt(DividirDirecciones);
        Params.ByName['FORZAR_DESTINO'].AsInteger := BoolToInt(ForzarDestino);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_FACTURA_PEDIDOS WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
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
        SQL.Text := 'UPDATE GES_CABECERAS_S SET ESTADO = 0 WHERE ESTADO = 1';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.GrabaDetalle;
begin
  if QMDetalle.State = dsEdit then
     QMDetalle.Post;
end;

procedure TDMAgrupacionPedidosVentas.ActualizaPedidos(id_s, id_s_d: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_PED_CLI_ACT_PEC(?ID_S, ?ID_S_D, ?ENTRADA, ?FECHA_REC)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ID_S_D'].AsInteger := id_s_d;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_REC'].AsDateTime := Fecha_Rec;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.InsertaErrores(Ejercicio, Canal, Rig: integer; Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INSERTA_ERRORES_AGRUP_PEC(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?PROC_AUTO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['RIG'].AsInteger := Rig;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.CorrigeError(Ejercicio, Canal, Rig, id_s: integer; Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE BORRA_CABECERA_AGRUP_PEC(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?PROC_AUTO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['RIG'].AsInteger := Rig;
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  InsertaErrores(Ejercicio, Canal, Rig, Serie);
end;

function TDMAgrupacionPedidosVentas.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS ERROR FROM TMP_ERRORES_AGRUP_PEDIDOS WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (0 < FieldByName['ERROR'].AsInteger);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.MarcarLineasPedidosProc(Marcar: smallint);
var
  CalcPedidosProv : boolean;
  IdDetallesS : integer;

  procedure MarcarLinea(Marca: integer; Unidades: double);
  begin
     with QMDetalle do
     begin
        Edit;
        QMDetalleSERVIDO.AsInteger := Marca;
        QMDetalleUNIDADES_RESERVADAS.AsFloat := Unidades;
        Post;
     end;
  end;

begin
  {
  Los datos se introducen en edicion porque desde un procedimiento, al hacer commit,
  la linea_servida cambia y se quedan como servidas y no aparecen en el grid.
  }
  // Marcar 0: Desmarcar - 1:Todas - 2:Linea completa - 3:Linea Parcial
  IdDetallesS := QMDetalleID_DETALLES_S.AsInteger;
  with QMDetalle do
  begin
     CalcularTotales := False;
     CalcPedidosProv := PedidosProv;
     PedidosProv := False;
     DisableControls;
     try
        First;
        while not EOF do
        begin
           // Desmarcar siempre desmarca
           case Marcar of
              0:
              begin
                 if (QMDetalleUNIDADES_RESERVADAS.AsFloat <> 0) then
                    MarcarLinea(0, 0);
              end;
              1:
              begin
                 MarcarLinea(1, QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat);
              end;
              2:
              begin
                 if (QMDetalleSTOCK.AsFloat >= QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat) then
                    MarcarLinea(1, QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat);
              end;
              3:
              begin
                 if (QMDetalleSTOCK.AsFloat >= QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat) then
                    MarcarLinea(1, QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat)
                 else
                 if (QMDetalleSTOCK.AsFloat > 0) then
                    MarcarLinea(1, QMDetalleSTOCK.AsFloat);
              end;
           end;

           Next;
        end;
        First;
     finally
        CalcularTotales := True;
        PedidosProv := CalcPedidosProv;
        EnableControls;
     end;
  end;

  Refrescar(QMDetalle, 'ID_DETALLES_S', IdDetallesS);
  RefrescarTotales;
end;

procedure TDMAgrupacionPedidosVentas.AgregaArticulo(Articulo: string; Pedido: integer; IdLote: integer = 0; Cantidad: double = 1);
var
  Valido : boolean;
begin
  Valido := False;
  Articulo := Trim(Articulo);

  with QMDetalle do
  begin
     CalcularTotales := False;
     DisableControls;
     try
        First;
        while ((not EOF) and (not Valido)) do
        begin
           if ((Pedido = 0) or (FieldByName('RIG').AsInteger = Pedido)) then
           begin
              if (FieldByName('ARTICULO').AsString = Articulo) then
              begin
                 if (FieldByName('UNIDADES_RESERVADAS').AsFloat < FieldByName('UNIDADES_PENDIENTES').AsFloat) then
                 begin
                    Edit;
                    FieldByName('UNIDADES_RESERVADAS').AsFloat :=
                       FieldByName('UNIDADES_RESERVADAS').AsFloat + Cantidad;
                    Valido := True;
                    Post;

                    if (IdLote <> 0) then
                    begin
                       with THYFIBQuery.Create(Self) do
                       begin
                          try
                             Database := DMMain.DataBase;
                             Close;
                             SQL.Text :=
                                'EXECUTE PROCEDURE G_ASIGNA_LOTE(:TIPO, :ID_DOC, :ID_LOTE, :CANTIDAD, :ALMACEN)';
                             Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                             Params.ByName['ID_DOC'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
                             Params.ByName['ID_LOTE'].AsInteger := IdLote;
                             Params.ByName['CANTIDAD'].AsFloat := Cantidad;
                             Params.ByName['ALMACEN'].AsString := '   '; // Lo obtiene de la linea de documento
                             ExecQuery;
                             Close;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

                    Refresh;
                 end;
              end;
           end;

           Next;
        end;

        First;
        while ((not EOF) and (not Valido)) do
        begin
           if ((Pedido = 0) or (FieldByName('RIG').AsInteger = Pedido)) then
           begin
              if (FieldByName('ARTICULO').AsString = Articulo) then
              begin
                 Edit;
                 FieldByName('UNIDADES_RESERVADAS').AsFloat := FieldByName('UNIDADES_RESERVADAS').AsFloat + Cantidad;
                 Valido := True;
                 Post;

                 if (IdLote <> 0) then
                 begin
                    with THYFIBQuery.Create(Self) do
                    begin
                       try
                          Database := DMMain.DataBase;
                          Close;
                          SQL.Text := 'EXECUTE PROCEDURE G_ASIGNA_LOTE(:TIPO, :ID_DOC, :ID_LOTE, :CANTIDAD, :ALMACEN)';
                          Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                          Params.ByName['ID_DOC'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
                          Params.ByName['ID_LOTE'].AsInteger := IdLote;
                          Params.ByName['CANTIDAD'].AsFloat := Cantidad;
                          Params.ByName['ALMACEN'].AsString := '   '; // Lo obtiene de la linea de documento
                          ExecQuery;
                          Close;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 Refresh;
              end;
           end;

           Next;
        end;

        if (not Valido) then
        begin
           // Errores.Add(Format(_('No existe %s en el pedido %d'), [Articulo, Pedido]));
           ShowMessage(Format(_('No existe %s en el pedido %d'), [Articulo, Pedido]));
           // Beep;
        end;
     finally
        CalcularTotales := True;
        EnableControls;
     end;
  end;

  RefrescarTotales;
end;

function TDMAgrupacionPedidosVentas.DameMinTransportista(Cliente: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := FieldByName['TRANSPORTISTA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.DamePortesCliente(Cliente: integer; var Tipo_Portes, Rango, Indice: integer; var I_Portes, Por_Portes: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TIPO_PORTES, I_PORTES, POR_PORTES, RANGO, INDICE FROM CON_CUENTAS_GES_CLI ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' CLIENTE = ?CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['CANAL'].AsInteger := EBusca.Canal;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Tipo_Portes := FieldByName['TIPO_PORTES'].AsInteger;
        I_Portes := FieldByName['I_PORTES'].AsFloat;
        Por_Portes := FieldByName['POR_PORTES'].AsFloat;
        Rango := FieldByName['RANGO'].AsInteger;
        Indice := FieldByName['INDICE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.CambiaPortes(Porte: integer);
begin
  with xPortes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
     Params.ByName['CANAL'].AsInteger := EBusca.Canal;
     Params.ByName['TIPO'].AsInteger := Porte;
     Open;
  end;
end;

procedure TDMAgrupacionPedidosVentas.CambiaRango(Rango: integer; var Existe: boolean);
begin
  with xRangos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['RANGO'].AsInteger := Rango;
     Open;
  end;

  existe := not (xRangos.FieldByName('TITULO').IsNUll);
end;

procedure TDMAgrupacionPedidosVentas.CambiaIndice(Rango, Indice: integer);
begin
  with xIndices do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['RANGO'].AsInteger := Rango;
     Params.ByName['INDICE'].AsInteger := Indice;
     Open;
  end;
end;

function TDMAgrupacionPedidosVentas.TipoLinea: string;
begin
  Result := QMDetalleTIPO_LINEA.AsString;
end;

function TDMAgrupacionPedidosVentas.TienePromo: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_DETALLES_S WHERE ID_S = ?ID_S AND ORIGEN = ?ORIGEN';
        Params.ByName['ID_S'].AsInteger := QMDetalleID_S.AsInteger;
        Params.ByName['ORIGEN'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleAfterPost(DataSet: TDataSet);
var
  Origen : integer;
  id_s : integer;
  str : string;
  servir : boolean;
begin
  // Graba(QMDetalle);
  if ((TipoLinea = 'NOR') and (TienePromo)) then
  begin
     servir := False;

     if (QMDetalleENTRADA_AGRUPACION.AsInteger = REntorno.Entrada) then
     begin
        str := _('Desea servir las promociones asociadas?');
        servir := True;
     end
     else
        str := _('Desea no servir las promociones asociadas?');

     if (ConfirmaMensaje(str)) then
     begin
        QMDetalle.DisableControls;
        try
           Origen := QMDetalleID_DETALLES_S.AsInteger;
           id_s := QMDetalleID_S.AsInteger;
           QMDetalle.Next;
           while not QMDetalle.EOF do
           begin
              if ((QMDetalleID_S.AsInteger = id_s) and
                 (QMDetalleORIGEN.AsInteger = Origen) and
                 (QMDetalleTIPO_LINEA.AsString = 'PRM')) then
              begin
                 QMDetalle.Edit;
                 if servir then
                 begin
                    if ((QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat) > 0) then
                       QMDetalleUNIDADES_RESERVADAS.AsFloat :=
                          QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat;
                 end
                 else
                    QMDetalleUNIDADES_RESERVADAS.AsFloat := 0;
                 QMDetalle.Post;
              end;
              QMDetalle.Next;
           end;

           QMDetalle.First;
           while (not QMDetalle.EOF) and (Origen <> QMDetalleID_DETALLES_S.AsInteger) do
              QMDetalle.Next;
        finally
           QMDetalle.EnableControls;
        end;
     end;
  end;

  RefrescarTotales;
end;

procedure TDMAgrupacionPedidosVentas.DameTituloCanal(Canal: integer);
begin
  with xCanales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Open;
  end;
end;

procedure TDMAgrupacionPedidosVentas.MuestraDocumentos(Destino, ser: string; contador, CanalDestino: integer);
begin
  with xDocumentos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Ser;
     Params.ByName['TIPO'].AsString := destino;
     Params.ByName['CONTADOR'].AsInteger := contador;
     Open;
  end;
  if (AceptaCambioCanal) then
  begin
     CierraFormsMenos(FMAgrupacionPedidosVentas);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, CanalDestino);
     AbreDocumentos(Destino, Ser, Contador);
     // Cerramos el formulario desde el propio formulario.
     // FMAgrupacionPedidosVentas.Close;
  end;
end;

function TDMAgrupacionPedidosVentas.AceptaCambioCanal: boolean;
begin
  FMControlAgrupPedidos := TFMControlAgrupPedidos.Create(DMAgrupacionPedidosVentas);
  FMControlAgrupPedidos.AsignaDataSource(DMAgrupacionPedidosVentas.DSxDocumentos);
  Result := (FMControlAgrupPedidos as TFMControlAgrupPedidos).Inicializa;
  FMControlAgrupPedidos.Free;
end;

procedure TDMAgrupacionPedidosVentas.RecorreProcesados(Entrada: integer);
begin
  with xProcesar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := Entrada;
     Open;
  end;
end;

procedure TDMAgrupacionPedidosVentas.Final(proc_auto, CanalDestino: integer; Tipo, serie_fac: string);
begin
  if HayErrores then
     MuestraErrores;
  if (REntorno.Canal = CanalDestino) then
  begin
     AbreDocumentos(Tipo, serie_fac, proc_auto);
     {RefrescarPedidos; dji lrk kri - ya lo hara FMAgrupacionPedidosVentas.RefrescarDatos}
  end
  else
  begin
     MuestraDocumentos(Tipo, Serie_fac, proc_auto, CanalDestino);
  end;

  LimpiaLotesTemporales;
end;

procedure TDMAgrupacionPedidosVentas.MuestraErrores;
begin
  FMControlErroresAgrupPec := TFMControlErroresAgrupPec.Create(Self);
  FMControlErroresAgrupPec.ShowModal;
  FMControlErroresAgrupPec.Free;
end;

procedure TDMAgrupacionPedidosVentas.SetCliente(Cliente: integer);
begin
  EBusca.Cliente := Cliente;
end;

procedure TDMAgrupacionPedidosVentas.SetSerie(Serie: string);
begin
  EBusca.Serie := Serie;
  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
end;

function TDMAgrupacionPedidosVentas.GetCliente: integer;
begin
  Result := EBusca.Cliente;
end;

function TDMAgrupacionPedidosVentas.GetSerie: string;
begin
  Result := EBusca.Serie;
end;

function TDMAgrupacionPedidosVentas.PuedeRealizarAlbFac(Cliente: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ' SELECT NO_ALB_FAC FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := (FieldByName['NO_ALB_FAC'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.ActualizaPrecio(Articulo: string; Proceso_auto: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_PED_CLI_ACT_PRECIO(:ARTICULO, :EMPRESA, :EJERCICIO, :PROCESO_AUTO)';
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['PROCESO_AUTO'].AsInteger := Proceso_auto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.RecorreFacturados(Proceso_auto: integer);
begin
  with xFacturados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PROCESO_AUTO'].AsInteger := Proceso_auto;
     Open;
  end;
end;

procedure TDMAgrupacionPedidosVentas.FiltraHojaPreparacion(Cliente: integer);
begin
  with QMCabeceraPre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMAgrupacionPedidosVentas.InicializaTraspasoHojas(Tipo: string);
begin
  {Deshabilito controles para obtener mejor velocidad}
  try
     CalcularTotales := False;
     QMCabeceraPre.DisableControls;
     QMDetallePre.DisableControls;
     QMDetalle.DisableControls;

     {Recorro las hojas}
     QMCabeceraPre.First;
     while not QMCabeceraPre.EOF do
     begin
        {Recorro el detalle de la hoja}
        QMDetallePre.First;
        while not QMDetallePre.EOF do
        begin
           {Marco las lineas de pedido segun el detalle de la Hoja de Preparacion}
           QMDetalle.First;
           while not QMDetalle.EOF do
           begin
              if QMDetalleID_DETALLES_S.AsInteger = QMDetallePreID_DETALLES_S.AsInteger then
              begin
                 {Si debo marcar los pedidos}
                 if (QMCabeceraPreGENERAR_ALBARAN.AsInteger = 1) then
                 begin
                    {Solo marco o desmarco si debo hacerlo}
                    //sfg.albert - Es posa perquè no li passa el valor
                    QMDetallePreUNIDADES_A_SERVIR.AsFloat := QMDetallePreUNIDADES.AsFloat;
                    if (QMDetalleUNIDADES_RESERVADAS.AsFloat <> QMDetallePreUNIDADES_A_SERVIR.AsFloat) then
                    begin
                       QMDetalle.Edit;
                       QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetallePreUNIDADES_A_SERVIR.AsFloat;
                       QMDetalle.Post;

                       {Agrego los lotes a traspasar para esa linea}
                       if (ArticuloLoteable(QMDetalleARTICULO.AsString)) then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO TMP_TRASPASO_PEDIDO_LOTES( ');
                                SQL.Add(
                                   ' ENTRADA, ID_DETALLES, LINEA, LOTE, UNIDADES, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ');
                                SQL.Add(
                                   ' ALMACEN, ARTICULO, SERIE, CLASIFICACION, TIPO, ID_A, PROVEEDOR, ID_LOTE, ID_A_UBICACION) ');
                                SQL.Add(' VALUES( ');
                                SQL.Add(' ?ENTRADA, ?ID_DETALLES, ?LINEA, ?LOTE, ?UNIDADES, ?F_ENVASADO, ');
                                SQL.Add(
                                   ' ?F_CADUCIDAD, ?F_FABRICACION, ?ALMACEN, ?ARTICULO, ?SERIE, ?CLASIFICACION, ');
                                SQL.Add(' ?TIPO, ?ID_A, ?PROVEEDOR, ?ID_LOTE, ?ID_A_UBICACION) ');
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ID_DETALLES'].AsInteger :=
                                   QMDetallePreUbicacionesID_DETALLES_S.AsInteger;
                                Params.ByName['LINEA'].AsInteger := 0;
                                Params.ByName['LOTE'].AsString := QMDetallePreUbicacionesLOTE.AsString;
                                Params.ByName['UNIDADES'].AsFloat := QMDetallePreUbicacionesUNIDADES.AsFloat;
                                Params.ByName['F_ENVASADO'].AsDateTime := xLoteF_ENVASADO.AsDateTime;
                                Params.ByName['F_CADUCIDAD'].AsDateTime := xLoteF_CADUCIDAD.AsDateTime;
                                Params.ByName['F_FABRICACION'].AsDateTime := xLoteF_FABRICACION.AsDateTime;
                                Params.ByName['ALMACEN'].AsString := xLoteALMACEN.AsString;
                                Params.ByName['ARTICULO'].AsString := xLoteARTICULO.AsString;
                                Params.ByName['SERIE'].AsString := xLoteSERIE.AsString;
                                Params.ByName['CLASIFICACION'].AsString := xLoteCLASIFICACION.AsString;
                                Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                                Params.ByName['ID_A'].AsInteger := QMDetallePreUbicacionesID_A.AsInteger;
                                Params.ByName['PROVEEDOR'].AsInteger := xLotePROVEEDOR.AsInteger;
                                Params.ByName['ID_LOTE'].AsInteger := QMDetallePreUbicacionesID_LOTE.AsInteger;
                                Params.ByName['ID_A_UBICACION'].AsInteger :=
                                   QMDetallePreUbicacionesID_A_UBICACION.AsInteger;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                       //sfg.albert - es posa l'estat albaranado S'HAURIA DE POSAR JUST DESPRES DE CREAR ALBARA
                       //  QMCabeceraPre.Edit;
                       //  QMCabeceraPreESTADO.AsInteger:=4;
                       //  QMCabeceraPre.Post;
                    end;
                 end
                 else
                    {Si debo desmarcar los pedidos}
                 begin
                    {Solo marco o desmarco si debo hacerlo}
                    if (QMDetalleUNIDADES_RESERVADAS.AsFloat <> 0) then
                    begin
                       QMDetalle.Edit;
                       QMDetalleUNIDADES_RESERVADAS.AsFloat := 0;
                       QMDetalle.Post;
                    end;
                 end;
              end;
              QMDetalle.Next;
           end;
           QMDetallePre.Next;
        end;
        QMCabeceraPre.Next;
     end;
  finally
     {Habilito controles}
     CalcularTotales := True;
     QMDetalle.EnableControls;
     QMDetallePre.EnableControls;
     QMCabeceraPre.EnableControls;
  end;
end;

procedure TDMAgrupacionPedidosVentas.QMCabeceraPreAfterOpen(DataSet: TDataSet);
begin
  QMDetallePre.Open;
end;

procedure TDMAgrupacionPedidosVentas.QMCabeceraPreBeforeClose(DataSet: TDataSet);
begin
  QMDetallePre.Close;
end;

procedure TDMAgrupacionPedidosVentas.ActualizaInfoAlbaran;
begin
  {Estos son los albaranes generados por la agrupacion}
  with QMCabeceraAlbaran do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMDetallePreEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMDetallePreEjercicio.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMDetallePreCanal.AsInteger;
     // Params.ByName['SERIE'].AsString := QMDetallePreSERIE.asString;
     Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
     Open;
  end;

  {Recorro los albaranes generados}
  QMCabeceraAlbaran.First;
  while not QMCabeceraAlbaran.EOF do
  begin
     {Recorro el detalle de cada albaran generado}
     while not QMDetalleAlbaran.EOF do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE TRASPASA_HOJA_UBICACION_LOTE(?ID_DETALLES_S)';
              Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleAlbaranID_DETALLES_S.AsInteger;
              // ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        QMDetalleAlbaran.Next;
     end;
     QMCabeceraAlbaran.Next;
  end;

  //CAMBIAMOS A ESTADO 4 EN HOJA DE PREPARACIÓN
  ActualizaEstadoHojaPrep;
  {
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase ;
     SQL.Text := 'UPDATE GES_CABECERAS_S_PRE SET ESTADO = 4 WHERE ID = ?ID';
     Params.ByName['ID'].AsInteger := QMDetallePreID_HOJA.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
  }
end;

procedure TDMAgrupacionPedidosVentas.QMCabeceraAlbaranAfterOpen(DataSet: TDataSet);
begin
  QMDetalleAlbaran.Open;
end;

procedure TDMAgrupacionPedidosVentas.QMCabeceraAlbaranBeforeClose(DataSet: TDataSet);
begin
  QMDetalleAlbaran.Close;
end;

procedure TDMAgrupacionPedidosVentas.QMDetallePreAfterOpen(DataSet: TDataSet);
begin
  QMDetallePreUbicaciones.Open;
end;

procedure TDMAgrupacionPedidosVentas.QMDetallePreBeforeClose(DataSet: TDataSet);
begin
  QMDetallePreUbicaciones.Close;
end;

procedure TDMAgrupacionPedidosVentas.ActualizaEstadoHojaPrep;
var
  CompletamenteServida : boolean;
  articulo : string;
  linea_hoja : integer;
begin
  xRecorreCabHojas.Open;
  xRecorreCabHojas.First;
  QMDetallePre.First;
  CompletamenteServida := True;
  linea_hoja := 0;
  while (not xRecorreCabHojas.EOF) do
  begin
     while (not xRecorreDetHoja.EOF) do
     begin
        if not ((xRecorreDetHojaUNIDADES.AsFloat = QMDetallePreUNIDADES_PED.AsFloat) or
           (xRecorreDetHojaSERVIDO.AsInteger = 1)) then
        begin
           CompletamenteServida := False;
           articulo := xRecorreDetHojaARTICULO.AsString;
           linea_hoja := xRecorreDetHojaLINEA.AsInteger;
        end;
        xRecorreDetHoja.Next;
        QMDetallePre.Next;
     end;

     if (CompletamenteServida) then
     begin
        // CAMBIAMOS A ESTADO 4 EN HOJA DE PREPARACIÓN
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE GES_CABECERAS_S_PRE SET ESTADO = 4 WHERE ID = ?ID';
              Params.ByName['ID'].AsInteger := xRecorreDetHojaID_HOJA.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
        ShowMessage(Format(_('La linea %d con artículo %s no ha sido traspasada en su totalidad' + #13#10 +
           'Cierre la hoja manualmente'), [linea_hoja, articulo]));
     xRecorreCabHojas.Next;
  end;
end;

procedure TDMAgrupacionPedidosVentas.FiltraPedidos(aPedidoDesde, aPedidoHasta: integer; aPais: string; aDir: integer; aArticulo: string; aSoloListoPreparar: boolean);
begin
  // Guardo las variables que me pasan
  PedidoDesde := aPedidoDesde;
  PedidoHasta := aPedidoHasta;
  Pais := aPais;
  Dir := aDir;
  Articulo := aArticulo;
  SoloListoPreparar := aSoloListoPreparar;

  MyFiltraPedidos;
end;

procedure TDMAgrupacionPedidosVentas.EnviaPedidosFiltrados;
begin
  with QMDetalle do
  begin
     CalcularTotales := False;
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (QMDetalleUNIDADES_RESERVADAS.AsFloat <> QMDetalleUNIDADES_PENDIENTES.AsFloat) then
           begin
              Edit;
              QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES_PENDIENTES.AsFloat;
              QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := QMDetalleUNIDADES_LOGISTICAS.AsFloat;
              Post;
           end;
           Next;
        end;
     finally
        CalcularTotales := True;
        EnableControls;
     end;
  end;

  RefrescarTotales;
end;

//Servir una cantidad de un artitulo entre los diferentes pedidos
procedure TDMAgrupacionPedidosVentas.ServirArticulo(Articulo: string; Cantidad: currency);
begin
  with QMDetalle do
  begin
     CalcularTotales := False;
     DisableControls;
     try
        First;
        while ((not EOF) and (Cantidad > 0)) do
        begin
           if (QMDetalleARTICULO.AsString = Articulo) then
           begin
              if (QMDetalleUNIDADES_PENDIENTES.AsFloat <> 0) then
              begin
                 Edit;

                 if (QMDetalleUNIDADES_PENDIENTES.AsFloat > Cantidad) then
                 begin
                    QMDetalleUNIDADES_RESERVADAS.AsFloat := Cantidad;
                    Cantidad := 0;
                 end
                 else
                 begin
                    QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES_PENDIENTES.AsFloat;
                    Cantidad := Cantidad - QMDetalleUNIDADES_PENDIENTES.AsFloat;
                 end;

                 Post;
              end;
           end;

           Next;
        end;
     finally
        CalcularTotales := True;
        EnableControls;
     end;
  end;

  RefrescarTotales;
end;

procedure TDMAgrupacionPedidosVentas.MyFiltraPedidos;
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.LogIni('MyFiltraPedidos');
  with QMDetalle do
  begin
     Close;
     // Filtro general del VER_DETALLE_PEDIDO
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA, D.CLIENTE, D.UNIDADES, D.UNIDADES_SERVIDAS, D.PAIS, ');
     SelectSQL.Add('        D.UNIDADES_RESERVADAS, D.UNIDADES_PREPARADAS, D.SERVIDO, D.P_COSTE, D.ENTRADA_AGRUPACION, D.ARTICULO, D.TITULO, D.ALMACEN, ');
     SelectSQL.Add('        D.ENTRADA, D.MONEDA, D.FECHA_REC_DET, D.ID_A, D.ID_DETALLES_S, D.TIPO_LINEA, D.ID_S, D.ORIGEN, D.UNIDADES_PENDIENTES, ');
     SelectSQL.Add('        D.FECHA_ENTREGA_PREV, D.DIRECCION_ENTREGA, D.TIPO_UNIDAD_LOGISTICA, D.TITULO_UNIDAD_LOGISTICA, D.UNIDADES_LOGISTICAS, ');
     SelectSQL.Add('        D.U_LOGISTICAS_RESERVADAS, D.ORDEN, D.SU_REFERENCIA, CP.DOCUMENTO_MUESTRAS, D.LISTO_PARA_PREPARAR, D.LOTE_SIMPLE, ');
     SelectSQL.Add('        (SELECT UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         TIPO = D.TIPO_UNIDAD_LOGISTICA) UNIDADES_POR_UL, ');
     SelectSQL.Add('        (SELECT RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         TIPO = D.TIPO) RELACIONAR_CON_UNIDADES, ');
     // Evito tomar stock desde A_ART_DAME_STOCK2 porque necesita una transaccion RW
     (*
     // Se toma A_ART_DAME_STOCK2 para ganar velocidad.
     SelectSQL.Add('        (SELECT STOCK ');
     SelectSQL.Add('         FROM A_ART_DAME_STOCK2(D.EMPRESA, D.CANAL, D.ALMACEN, D.ARTICULO, ''01/01/3000'')) STOCK, ');
     *)
     (*
     SelectSQL.Add('        (SELECT SUM(EXISTENCIAS) ');
     SelectSQL.Add('         FROM A_ART_DAME_STOCK_ART_ED(D.EMPRESA, D.CANAL, D.ARTICULO, D.ALMACEN, 1, 0, 0, 0, 0, 0, 0, NULL) ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         CANAL = D.CANAL) STOCK, ');
     *)
     (* Se comenta porque no da los mismos resultados que A_ART_DAME_STOCK_ART_ED
     SelectSQL.Add('        (SELECT STOCK ');
     SelectSQL.Add('         FROM A_ART_DAME_STOCK_SIN_VALORAR(D.EMPRESA, D.CANAL, D.ALMACEN, D.ARTICULO, 0)) STOCK, ');
     *)
     SelectSQL.Add('        (SELECT FIRST(1) ID_LOTE FROM GES_DETALLES_S_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_DETALLES_S = D.ID_DETALLES_S ');
     SelectSQL.Add('         ORDER BY SUBLINEA) ID_LOTE, ');
     SelectSQL.Add('        (SELECT FIRST(1) LOTE FROM GES_DETALLES_S_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_DETALLES_S = D.ID_DETALLES_S ');
     SelectSQL.Add('         ORDER BY SUBLINEA) LOTE, ');
     SelectSQL.Add('        (SELECT COUNT(ID_LOTE) FROM GES_DETALLES_S_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_DETALLES_S = D.ID_DETALLES_S) CANT_LOTE, ');
     SelectSQL.Add('        (SELECT STOCK_MINIMO ');
     SelectSQL.Add('         FROM ART_ARTICULOS_ALMACENES_ART ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         EMPRESA = D.EMPRESA AND ');
     SelectSQL.Add('         CANAL = D.CANAL AND ');
     SelectSQL.Add('         ALMACEN = D.ALMACEN AND ');
     SelectSQL.Add('         ARTICULO = D.ARTICULO) STOCK_MINIMO, ');
     SelectSQL.Add('         D.PRECIO, D.ASEGURADO, D.PACIENTE, D.AUTORIZACION, D.POLIZA, D.FEC_REC_IH, D.DECIMALES_UNIDADES,  ');
     SelectSQL.Add('         D.ALFA_1, D.ALFA_2, D.ALFA_3, D.ALFA_4, D.ALFA_5, D.ALFA_6, D.ALFA_7, D.ALFA_8, ');
     SelectSQL.Add('         AM.REF_PROVEEDOR, ART.LOTES, C.PEDIDO_CLIENTE, D.BARRAS, D.PEDIR ');
     SelectSQL.Add('         FROM VER_DETALLE_PEDIDO D ');
     SelectSQL.Add('         JOIN GES_CABECERAS_S_PED CP ON D.ID_S = CP.ID_S ');
     SelectSQL.Add('         JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S ');
     SelectSQL.Add('         JOIN ART_ARTICULOS ART ON D.ID_A = ART.ID_A ');
     SelectSQL.Add('         JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
     SelectSQL.Add('         JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
     SelectSQL.Add('         JOIN ART_ARTICULOS_MODELOS AM ON AMC.ID_A_M = AM.ID_A_M ');
     SelectSQL.Add(' WHERE ');

     // Hasta aquí el Select y el Refresh son iguales.
     RefreshSQL.Text := SelectSQL.Text;
     RefreshSQL.Add(' D.ID_S = :OLD_ID_S AND ');
     RefreshSQL.Add(' D.ID_DETALLES_S = :OLD_ID_DETALLES_S ');

     // Sigo con el WHERE del Select
     SelectSQL.Add(' (D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' D.CANAL = :CANAL AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' D.TIPO = ''PEC'' AND ');
     SelectSQL.Add(' D.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' D.ESTADO = 0 ');

     // Agregamos los filtros que correspondan
     if (PedidoDesde > 0) then
     begin
        if ((PedidoDesde = PedidoHasta) or (PedidoHasta <= 0)) then
           SelectSQL.Add(' AND D.RIG = ' + IntToStr(PedidoDesde))
        else
           SelectSQL.Add(' AND D.RIG >= ' + IntToStr(PedidoDesde));
     end;
     if ((PedidoHasta > 0) and (PedidoDesde <> PedidoHasta)) then
        SelectSQL.Add(' AND D.RIG <= ' + IntToStr(PedidoHasta));
     if (Pais > '') then
        SelectSQL.Add(' AND D.PAIS = ''' + Pais + '''');
     if (Articulo > '') then
        SelectSQL.Add(' AND D.ARTICULO STARTING WITH ''' + Articulo + '''');
     if (Dir > 0) then
        SelectSQL.Add(' AND D.DIRECCION_ENTREGA = ' + IntToStr(Dir));
     if (Servido = 0) then
        SelectSQL.Add(' AND D.SERVIDO = 0 ');
     if (SoloListoPreparar) then
        SelectSQL.Add(' AND D.LISTO_PARA_PREPARAR = 1 ');

     // Esto es para poder seguir viendo lo marcado a pesar de que este servido, si lo he marcado con mi entrada
     SelectSQL.Add(' ) OR ');
     SelectSQL.Add(' (D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' D.CANAL = :CANAL AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' D.TIPO = ''PEC'' AND ');
     SelectSQL.Add(' D.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' D.ESTADO = 0 AND ');
     SelectSQL.Add(' D.ENTRADA_AGRUPACION = :ENTRADA) ');

     // dji lrk kri - mirko lo quiere ordenado por direccion de entrega
     if (DMMain.EstadoKri(205) = 1) then
        SelectSQL.Add(' ORDER BY D.DIRECCION_ENTREGA, D.EJERCICIO, D.RIG, D.ORDEN')
     else
        SelectSQL.Add(' ORDER BY D.EJERCICIO, D.RIG, D.ORDEN');

     DMMain.Log('DMAgrupacionPedidosVentas.MyFiltraPedidos.QMDetalle.SelectSQL:' + #13#10 + SelectSQL.Text);

     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
     Params.ByName['CANAL'].AsInteger := EBusca.Canal;
     Params.ByName['SERIE'].AsString := EBusca.Serie;
     Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

     Open;

     // Traigo todas las lineas para agilizar el scroll posteriormente
     FetchAll;
     First;
  end;

  RefrescarTotales;
  DMMain.LogFin('MyFiltraPedidos');
end;

procedure TDMAgrupacionPedidosVentas.xRecorreCabHojasAfterOpen(DataSet: TDataSet);
begin
  xRecorreDetHoja.Open;
end;

procedure TDMAgrupacionPedidosVentas.QMDetallePreUbicacionesAfterOpen(DataSet: TDataSet);
begin
  xLote.Open;
end;

procedure TDMAgrupacionPedidosVentas.QMDetallePreUbicacionesBeforeClose(DataSet: TDataSet);
begin
  xLote.Close;
end;

procedure TDMAgrupacionPedidosVentas.RefrescarTotales;
begin
  if (CalcularTotales) then
  begin
     DMMain.LogIni('RefrescarTotales');
     with xUnidadesMarcadas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['CANAL'].AsInteger := EBusca.Canal;
        Params.ByName['SERIE'].AsString := EBusca.Serie;
        // Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
        DMMain.LogFin('RefrescarTotales');
     end;
  end;
end;

// ANDALPLAST
procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADES_SERVIDASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES_SERVIDAS.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES_RESERVADAS.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.LimpiaLotesTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_TRASPASO_PEDIDO_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
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
        SQL.Add(' DELETE FROM GES_DETALLES_S_LOTES L ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' EXISTS(SELECT EMPRESA ');
        SQL.Add('        FROM GES_CABECERAS_S ');
        SQL.Add('        WHERE ');
        SQL.Add('        EMPRESA = L.EMPRESA AND ');
        SQL.Add('        EJERCICIO = L.EJERCICIO AND ');
        SQL.Add('        CANAL = L.CANAL AND ');
        SQL.Add('        SERIE = L.SERIE AND ');
        SQL.Add('        TIPO = L.TIPO AND ');
        SQL.Add('        RIG = L.RIG) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := 'PEC';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleU_LOGISTICAS_RESERVADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  // No tengo en cuenta, por ahora, QMDetalleRELACIONAR_CON_UNIDADES.AsInteger
  if (QMDetalleUNIDADES_POR_UL.AsFloat <> 0) then
     // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES_POR_UL.AsFloat)
     Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES_POR_UL.AsFloat])
  else
     // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES_RESERVADAS.AsFloat);
  }
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleU_LOGISTICAS_RESERVADASChange(Sender: TField);
begin
  if (not ModificandoUnidadesReservadas) then
  begin
     if (QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat = 0) then
        QMDetalleUNIDADES_RESERVADAS.AsFloat := 0
     else
     begin
        if (QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat = QMDetalleUNIDADES_LOGISTICAS.AsFloat) then
        begin
           QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES_PENDIENTES.AsFloat;
        end
        else
        begin
           // No tengo en cuenta, por ahora, QMDetalleRELACIONAR_CON_UNIDADES.AsInteger
           // if (QMDetalleRELACIONAR_CON_UNIDADES.AsInteger = 1) then
           // begin
           if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
           begin
              if (QMDetalleUNIDADES_LOGISTICAS.AsFloat <> 0) then
                 QMDetalleUNIDADES_RESERVADAS.AsFloat :=
                    (QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat / QMDetalleUNIDADES_LOGISTICAS.AsFloat) * QMDetalleUNIDADES.AsFloat
              else
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES.AsFloat; // No se que poner aqui.
           end
           else
           begin
              if (QMDetalleUNIDADES_POR_UL.AsFloat <> 0) then
                 QMDetalleUNIDADES_RESERVADAS.AsFloat :=
                    QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat * QMDetalleUNIDADES_POR_UL.AsFloat
              else
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat;
           end;
           // end;
        end;
     end;
  end;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := QMDetalleLOTE.AsString;
  if (QMDetalleCANT_LOTE.AsInteger > 1) then
     Text := Text + ' (+' + QMDetalleCANT_LOTE.AsString + ')';
end;

procedure TDMAgrupacionPedidosVentas.InfoLotes;
begin
  if (QMDetalle.State <> dsBrowse) then
     QMDetalle.Post;

  if (QMDetalle.State = dsBrowse) then
  begin
     with TFMAsignaLotes.Create(Self) do
     begin
        try
           AsignaDocumento(QMDetalleTIPO.AsString, QMDetalleID_DETALLES_S.AsInteger, True);
        finally
           Free;
        end;
     end;

     QMDetalle.Refresh;
  end;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
begin
  if (CalculaStock) then
  begin
     //Stock := 0;
     Articulo := QMDetalleALMACEN.AsString + '|' + QMDetalleARTICULO.AsString;
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(QMDetalleEMPRESA.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString);
           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;

     QMDetalleSTOCK.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK.AsFloat := 0;
  end;

  if (PedidosProv) then
  begin
     //Stock := 0;
     Articulo := QMDetalleALMACEN.AsString + '|' + QMDetalleARTICULO.AsString;
     with PedidosAProv do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT PEDIDOS_A_PRO FROM A_ART_DAME_PEDIDOS_PRO(' + IntToStr(QMDetalleEMPRESA.AsInteger) + ', ' + IntToStr(QMDetalleCANAL.AsInteger) + ', ''' + QMDetalleALMACEN.AsString + ''', ''' + QMDetalleARTICULO.AsString + ''')';
                 ExecQuery;
                 Stock := FieldByName['PEDIDOS_A_PRO'].AsFloat;
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

     QMDetallePEDIDOS_A_PRO.AsFloat := Stock;
  end
  else
  begin
     QMDetallePEDIDOS_A_PRO.AsFloat := 0;
  end;
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADES_PENDIENTESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleUNIDADES_PREPARADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionPedidosVentas.ImportarXLS(Archivo: string);
var
  Excel, Libro, Hoja, Rango : olevariant;
  Data : variant;
  Fila, CantidadFilas, CantidadFilasVacias, Modificados : integer;
  Articulo, sUnidadesServidas, SuPedido : string;
  UnidadesServidas : double;
  Log : TStrings;
  ArchivoLog : string;
const
  // Sacado de https://msdn.microsoft.com/en-us/library/office/ff820880.aspx
  xlDown = -4121;
begin
  DMMain.Log('Importando fichero: ' + Archivo);
  Excel := CreateOleObject('Excel.Application');
  Log := TStringList.Create;
  try
     Log.Add(format(_('Importando fichero: %s'), [Archivo]));
     Libro := Excel.WorkBooks.Open(Archivo);
     try
        Hoja := Libro.Worksheets.Item[1];
     except
        begin
           Log.Add(_('No se cuentra hoja a importar'));
           Exit;
        end;
     end;

     try
        // No funciona si la columna G tiene celdas vacias.
        // Rango := Hoja.Range['A1', Hoja.Range['G1'].end[xlDown]]; //para escoger el rango desde hasta en las columnas de excel
        Rango := Hoja.Range['A1', 'G1048576'];
        Data := Rango.Value;
     except
        begin
           Log.Add(_('No se puede definir el rango A1-Gnnn'));
           Exit;
        end;
     end;

     // Formato
     // NRO_OD     FECHA        COD_L_ENTREGA   SKU     DESCRIPCION_LARGA                CANTIDAD_PROD
     // 14311598   04/04/2023   117             299081  LIMPIAPARABRISAS 3,785 L AUTOS   732

     try
        CantidadFilas := VarArrayHighBound(Data, 1);
        // CantidadColumnas := VarArrayHighBound(Data, 2);
     except
        begin
           Log.Add(_('No se puede obtener la cantidad de filas a importar'));
           CantidadFilas := 1048576; // Maxima cantidad de filas de Excel
        end;
     end;

     Log.Add(format(_('CantidadFilas: %d'), [CantidadFilas]));
     Modificados := 0;
     CantidadFilasVacias := 0;
     with QMDetalle do
     begin
        DisableControls;
        try
           // Fila 1 son los nombres de los campos ( Data[Fila, Columna] ) no empiezan en 0 empiezan en 1
           Fila := 2;
           while ((CantidadFilasVacias < 5) and (Fila <= CantidadFilas)) do
           begin
              // DMMain.Log(format(_('Fila: %d - CantidadFilas: %d - CantidadFilasVacias: %d'), [Fila, CantidadFilas, CantidadFilasVacias]));

              SuPedido := '';
              Articulo := '';
              try
                 SuPedido := Trim(Copy(Data[Fila, 1], 1, 20));
                 Articulo := Trim(Copy(Data[Fila, 4], 1, 15));
                 sUnidadesServidas := Data[Fila, 7];
                 UnidadesServidas := StrToFloatDef(sUnidadesServidas, 0);
                 // DMMain.Log(format(_('Fila: %d - SuPedido: %s - Articulo: %s - Unidades: %.2f (%s)'), [Fila, SuPedido, Articulo, UnidadesServidas, sUnidadesServidas]));
              except
                 on E: Exception do
                 begin
                    Log.Add(format('***' + _('Error leyendo fila %d'), [Fila]) + #13#10 + E.Message);
                    SuPedido := '';
                    Articulo := '';
                    UnidadesServidas := 0;
                 end;
              end;

              if ((SuPedido = '') and (Articulo = '')) then
              begin
                 Inc(CantidadFilasVacias);
              end
              else
              begin
                 if (CantidadFilasVacias > 0) then
                    Log.Add(format('*** ' + _('%d Fila(s) vacia(s). (Sin informacion de SuPedido o Articulo)'), [CantidadFilasVacias]));

                 Log.Add(format(_('Fila: %d - SuPedido: %s - Articulo: %s - Unidades: %.2f (%s)'), [Fila, SuPedido, Articulo, UnidadesServidas, sUnidadesServidas]));

                 if (UnidadesServidas = 0) then
                    Log.Add('*** ' + _('Unidades a servir = 0'));

                 // Si es una fila valida, comienzo a contar filas vacias desde 0.
                 CantidadFilasVacias := 0;
                 First;
                 while (not EOF) and (UnidadesServidas > 0) do
                 begin
                    // Busco SU_PEDIDO + ARTICULO + UDS. PENDIENTES > 0
                    // Busco SU_PEDIDO en PEDIDO_CLIENTE y SU_REFERENCIA
                    if ((QMDetallePEDIDO_CLIENTE.AsString = SuPedido) or (QMDetalleSU_REFERENCIA.AsString = SuPedido)) and (QMDetalleARTICULO.AsString = Articulo) and (QMDetalleUNIDADES_PENDIENTES.AsFloat > 0) then
                    begin
                       Inc(Modificados);
                       Edit;

                       if (UnidadesServidas > QMDetalleUNIDADES_PENDIENTES.AsFloat) then
                       begin
                          QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES_PENDIENTES.AsFloat;
                          UnidadesServidas := UnidadesServidas - QMDetalleUNIDADES_PENDIENTES.AsFloat;
                       end
                       else
                       begin
                          if (QMDetalleUNIDADES_RESERVADAS.AsFloat + UnidadesServidas > QMDetalleUNIDADES_PENDIENTES.AsFloat) then
                          begin
                             UnidadesServidas := UnidadesServidas - QMDetalleUNIDADES_PENDIENTES.AsFloat + QMDetalleUNIDADES_RESERVADAS.AsFloat;
                             QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES_PENDIENTES.AsFloat;
                          end
                          else
                          begin
                             QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES_RESERVADAS.AsFloat + UnidadesServidas;
                             UnidadesServidas := 0;
                          end;
                       end;

                       Post;
                    end;

                    Next;
                 end;

                 if (UnidadesServidas > 0) then
                    Log.Add(format('*** ' + _('Quedaron %.2f unidades pendientes de servir'), [UnidadesServidas]));
              end;

              Inc(Fila);
           end;
        finally
           EnableControls;
        end;
     end;
     Log.Add(format(_('Importando Finalizada - Lineas modificadas: %d'), [Modificados]));

     ArchivoLog := GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\AgrupacionPedVentas-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.txt';
     if FileExists(ArchivoLog) then
        DeleteFile(ArchivoLog);
     Log.SaveToFile(ArchivoLog);
  finally
     // Clean up all references so Excel will close cleanly
     Rango := Unassigned;
     Hoja := Unassigned;
     Libro := Unassigned;
     Excel.Quit;
     Excel := Unassigned;
     Log.Free;
  end;

  DMMain.AbrirArchivo(ArchivoLog);
end;

end.
