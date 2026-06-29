unit UDMAgrupacionOfertasVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBDataSetRO, HYFIBQuery, UDameDato;

type
  TDMAgrupacionOfertasVentas = class(TDataModule)
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
     QMDetalleBARRAS: TStringField;
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
     procedure xClientesAfterOpen(DataSet: TDataSet);
     procedure DMAgrupacionOfertasVentasCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_RECEPCIONChange(Sender: TField);
     procedure QMDetalleUNIDADES_RESERVADASChange(Sender: TField);
     procedure QMDetalleENTRADA_AGRUPACIONChange(Sender: TField);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleBARRASGetText(Sender: TField; var Text: string; DisplayText: boolean);
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
     OfertaDesde: integer;
     OfertaHasta: integer;
     SoloListoPreparar: boolean;
     Param_VENULKG001: boolean;
     procedure CompruebaCambioUnidades;
     function TipoLinea: string;
     function TienePromo: boolean;
     function AceptaCambioCanal: boolean;
     procedure MyFiltraOfertas;
     procedure RefrescarTotales;
     procedure LimpiaLotesTemporales;
  public
     { Public declarations }
     Controla: boolean;
     Fecha_rec: TDateTime;
     SerieDestino: string;
     Proceso_auto: integer;
     Errores: TStringList; {dji lrk kri}
     CalculaStock: boolean;
     procedure FiltrarOfertas(cliente: integer; Serie: string);
     procedure RefrescarOfertas;
     procedure MostrarLineasServidas(mostrar: integer);
     procedure MarcarLineasOfertas;
     procedure ServirTodaLinea;
     procedure ServirMarcados;
     procedure DesmarcarEntradas;
     procedure ConfiguraLotes;
     procedure InicializaTraspaso;
     procedure GeneraCabeceras(Ejercicio, Canal, Rig, id_s: integer; Serie, Tipo: string; Transportista, Portes, Rango, Indice, Canal_Destino: integer; I_Portes, Por_Portes: double; Fecha: TDateTime; DireccionKri: integer; ForzarPortes, DividirDirecciones: boolean; IdDocDest: integer);
     procedure TraspasaOferta(id_s, id_s_d: integer; Tipo: string; DividirDirecciones: boolean; ForzarDestino: boolean = False);
     procedure BorraTemporales;
     procedure GrabaDetalle;
     function PermitirTraspaso: boolean;
     procedure ActualizaOfertas(id_s, id_s_d: integer);
     procedure AbreDocumentos(Destino, Ser: string; Contador: integer);
     procedure InsertaErrores(ejercicio, canal, rig: integer; serie: string);
     procedure CorrigeError(ejercicio, canal, rig, id_s: integer; serie: string);
     function HayErrores: boolean;
     procedure MarcarLineasOfertasProc(marcar: smallint);
     function DameMinTransportista(Cliente: integer): integer;
     procedure DamePortesCliente(Cliente: integer; var Tipo_Portes, Rango, Indice: integer; var I_Portes, Por_Portes: double);
     procedure CambiaPortes(Porte: integer);
     procedure CambiaIndice(Rango, Indice: integer);
     procedure CambiaRango(Rango: integer; var Existe: boolean);
     procedure DameTituloCanal(Canal: integer);
     procedure MuestraDocumentos(Destino, ser: string; contador, CanalDestino: integer);
     procedure FiltraOfertas(aOfertaDesde, aOfertaHasta: integer; aPais: string; aDir: integer; aArticulo: string; aSoloListoPreparar: boolean);
     procedure AgregaArticulo(Articulo: string; Oferta: integer);
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
     procedure EnviaOfertasFiltrados;
     procedure InfoLotes;
  end;

var
  DMAgrupacionOfertasVentas : TDMAgrupacionOfertasVentas;

implementation

uses UDMMain, UEntorno, UFMFacturas, UFMAlbaranes, UUtiles, UFMConfigTraspasoLotes,
  UFMControlAgrupPedidos, UFMAgrupacionOfertasVentas, UFMain, UFormGest, UFParadaExt,
  UFMControlErroresAgrupPec, DateUtils, UFMAsignaLotes, UParam;

{$R *.DFM}

procedure TDMAgrupacionOfertasVentas.DMAgrupacionOfertasVentasCreate(Sender: TObject);
var
  i : integer;
begin
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

  OfertaDesde := 0;
  OfertaHasta := 0;
  Pais := '';
  Servido := 0;
  Dir := 0;
  Articulo := '';
  CalcularTotales := True;
  ModificandoUnidadesReservadas := False;
  CalculaStock := True;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  Errores := TStringList.Create;
  MyFiltraOfertas;
end;

procedure TDMAgrupacionOfertasVentas.xClientesAfterOpen(DataSet: TDataSet);
begin
  MyFiltraOfertas;
end;

procedure TDMAgrupacionOfertasVentas.FiltrarOfertas(Cliente: integer; Serie: string);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.LogIni('FiltrarOfertas');
  with xClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
     Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
     if (EBusca.Cliente <> 0) then
        Open;
  end;
  DMMain.LogFin('FiltrarOfertas');
end;

procedure TDMAgrupacionOfertasVentas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAgrupacionOfertasVentas.RefrescarOfertas;
begin
  FiltrarOfertas(EBusca.Cliente, EBusca.Serie);
end;

procedure TDMAgrupacionOfertasVentas.MostrarLineasServidas(Mostrar: integer);
begin
  if (Mostrar <> Servido) then
  begin
     Servido := Mostrar;
     MyFiltraOfertas;
  end;
end;

procedure TDMAgrupacionOfertasVentas.MarcarLineasOfertas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_OFERTAS_MARCA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE, :ENTRADA)';
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

  RefrescarOfertas;
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADES_RECEPCIONChange(Sender: TField);
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

procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADES_RESERVADASChange(Sender: TField);
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
     if ((QMDetalleUNIDADES_RESERVADAS.AsFloat = QMDetalleUNIDADES_PENDIENTES.AsFloat) and (QMDetalleUNIDADES_RESERVADAS.AsFloat = QMDetalleUNIDADES.AsFloat)) then
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
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := Trunc((QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES.AsFloat) * QMDetalleUNIDADES_LOGISTICAS.AsFloat)
              else
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := 1; // No se que hacer aqui.
        end
        else
        if (QMDetalleUNIDADES_POR_UL.AsFloat <> 0) then
        begin
           QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := Trunc(QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES_POR_UL.AsFloat);
        end
        else
           QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := QMDetalleUNIDADES_RESERVADAS.AsInteger;

        ModificandoUnidadesReservadas := False;
        // end;
     end;
  end;

  CompruebaCambioUnidades;
end;

procedure TDMAgrupacionOfertasVentas.ServirTodaLinea;
begin
  with QMDetalle do
  begin
     if (RecordCount > 0) then
     begin
        if (QMDetalleUNIDADES_RESERVADAS.AsFloat <> QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat) then
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
                 QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat := Trunc(QMDetalleUNIDADES_RESERVADAS.AsFloat / QMDetalleUNIDADES_POR_UL.AsFloat);
           finally
              ModificandoUnidadesReservadas := False;
           end;
           Post;
        end;
     end;
  end;
end;

procedure TDMAgrupacionOfertasVentas.AbreDocumentos(Destino, Ser: string; Contador: integer);
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

// Servir los Ofertas Marcados
procedure TDMAgrupacionOfertasVentas.ServirMarcados;
begin
  // Commit de la Transacción
  if (QMDetalle.State = dsEdit) then
     QMDetalle.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_OFERTAS_CERRAR_SERVIDOS (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE, :ENTRADA, :FECHA_REC)';
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

  RefrescarOfertas;
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleENTRADA_AGRUPACIONChange(Sender: TField);
begin
  if QMDetalleENTRADA_AGRUPACION.AsInteger <> 0 then
     if QMDetalleUNIDADES_RESERVADAS.AsFloat = 0 then
        QMDetalleENTRADA_AGRUPACION.AsInteger := 0;
end;

procedure TDMAgrupacionOfertasVentas.DesmarcarEntradas;
begin
  DMMain.LogIni('DesmarcarEntradas');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_DETALLE_OFERTA_C ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA_AGRUPACION = 0, ');
        SQL.Add(' SERVIDO = 0, ');
        SQL.Add(' UNIDADES_RESERVADAS = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO <= :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = ''OFC'' AND ');
        //SQL.Add(' CLIENTE = :CLIENTE AND ');
        //SQL.Add(' ESTADO <> 5 AND ');
        SQL.Add(' ENTRADA_AGRUPACION = :ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := EBusca.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EBusca.Ejercicio;
        Params.ByName['CANAL'].AsInteger := EBusca.Canal;
        Params.ByName['SERIE'].AsString := EBusca.Serie;
        //Params.ByName['CLIENTE'].AsInteger := EBusca.Cliente;
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

procedure TDMAgrupacionOfertasVentas.ConfiguraLotes;
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

procedure TDMAgrupacionOfertasVentas.CompruebaCambioUnidades;
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

function TDMAgrupacionOfertasVentas.PermitirTraspaso: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS ERROR FROM TMP_TRASPASO_PEDIDO_LOTES WHERE ENTRADA = ?ENTRADA AND TIPO = ?TIPO AND ERROR = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := 'OFC';
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

procedure TDMAgrupacionOfertasVentas.InicializaTraspaso;
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

procedure TDMAgrupacionOfertasVentas.GeneraCabeceras(Ejercicio, Canal, Rig, id_s: integer; Serie, Tipo: string; Transportista, Portes, Rango, Indice, Canal_Destino: integer; I_Portes, Por_Portes: double; Fecha: TDateTime; DireccionKri: integer; ForzarPortes, DividirDirecciones: boolean; IdDocDest: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_OFC_CLI_PROCESA_PEC ');
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

procedure TDMAgrupacionOfertasVentas.TraspasaOferta(id_s, id_s_d: integer; Tipo: string; DividirDirecciones: boolean; ForzarDestino: boolean = False);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_OFC_CLI_TRASPASA_PEC(?ID_S, ?ID_S_D, ?ENTRADA, ?TIPO_DEST, ?FECHA_REC, ?DIVIDIR_POR_DIRECCION, :FORZAR_DESTINO)';
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

procedure TDMAgrupacionOfertasVentas.BorraTemporales;
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

procedure TDMAgrupacionOfertasVentas.GrabaDetalle;
begin
  if QMDetalle.State = dsEdit then
     QMDetalle.Post;
end;

procedure TDMAgrupacionOfertasVentas.ActualizaOfertas(id_s, id_s_d: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_OFC_CLI_ACT_PEC(?ID_S, ?ID_S_D, ?ENTRADA, ?FECHA_REC)';
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

procedure TDMAgrupacionOfertasVentas.InsertaErrores(Ejercicio, Canal, Rig: integer; Serie: string);
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
        Params.ByName['TIPO'].AsString := 'OFC';
        Params.ByName['RIG'].AsInteger := Rig;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionOfertasVentas.CorrigeError(Ejercicio, Canal, Rig, id_s: integer; Serie: string);
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
        Params.ByName['TIPO'].AsString := 'OFC';
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

function TDMAgrupacionOfertasVentas.HayErrores: boolean;
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

procedure TDMAgrupacionOfertasVentas.MarcarLineasOfertasProc(Marcar: smallint);
begin
  {los datos se introducen en edicion porque desde un procedimiento, al hacer commit, la linea_servida cambia y
  se quedan como servidas y no aparecen en el grid. }
  with QMDetalle do
  begin
     CalcularTotales := False;
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if ((QMDetalleSERVIDO.AsInteger <> Marcar) or
              ((Marcar = 1) and (QMDetalleUNIDADES_RESERVADAS.AsFloat <> QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat)) or
              ((Marcar = 0) and (QMDetalleUNIDADES_RESERVADAS.AsFloat <> 0))
              ) then
           begin
              Edit;
              QMDetalleSERVIDO.AsInteger := Marcar;
              if Marcar = 1 then
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat
              else
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := 0;
           end;
           Next;
        end;
        First;
     finally
        CalcularTotales := True;
        EnableControls;
     end;
  end;
  RefrescarTotales;
end;

procedure TDMAgrupacionOfertasVentas.AgregaArticulo(Articulo: string; Oferta: integer);
var
  Valido : boolean;
begin
  Valido := False;
  with QMDetalle do
  begin
     CalcularTotales := False;
     DisableControls;
     try
        First;
        while ((not (EOF)) and (not Valido)) do
        begin
           if ((FieldByName('RIG').AsInteger = Oferta) or (Oferta = 0)) then
              if (Trim(FieldByName('ARTICULO').AsString) = Trim(Articulo)) then
              begin
                 if (FieldByName('UNIDADES_RESERVADAS').AsInteger < FieldByName('UNIDADES_PENDIENTES').AsInteger) then
                 begin
                    Edit;
                    FieldByName('UNIDADES_RESERVADAS').AsInteger := FieldByName('UNIDADES_RESERVADAS').AsInteger + 1;
                    Valido := True;
                    Post;
                 end;
              end;
           Next;
        end;
        First;
        while ((not (EOF)) and (not Valido)) do
        begin
           if ((FieldByName('RIG').AsInteger = Oferta) or (Oferta = 0)) then
              if (Trim(FieldByName('ARTICULO').AsString) = Trim(Articulo)) then
              begin
                 Edit;
                 FieldByName('UNIDADES_RESERVADAS').AsInteger := FieldByName('UNIDADES_RESERVADAS').AsInteger + 1;
                 Valido := True;
                 Post;
              end;
           Next;
        end;
        if (not Valido) then
        begin
           Errores.Add(Format(_('No existe %s en la Oferta %d'), [Articulo, Oferta]));
           beep;
        end;
     finally
        CalcularTotales := True;
        EnableControls;
     end;
  end;

  RefrescarTotales;
end;

function TDMAgrupacionOfertasVentas.DameMinTransportista(Cliente: integer): integer;
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

procedure TDMAgrupacionOfertasVentas.DamePortesCliente(Cliente: integer; var Tipo_Portes, Rango, Indice: integer; var I_Portes, Por_Portes: double);
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

procedure TDMAgrupacionOfertasVentas.CambiaPortes(Porte: integer);
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

procedure TDMAgrupacionOfertasVentas.CambiaRango(Rango: integer; var Existe: boolean);
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

procedure TDMAgrupacionOfertasVentas.CambiaIndice(Rango, Indice: integer);
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

function TDMAgrupacionOfertasVentas.TipoLinea: string;
begin
  Result := QMDetalleTIPO_LINEA.AsString;
end;

function TDMAgrupacionOfertasVentas.TienePromo: boolean;
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

procedure TDMAgrupacionOfertasVentas.QMDetalleAfterPost(DataSet: TDataSet);
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
                       QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat;
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

procedure TDMAgrupacionOfertasVentas.DameTituloCanal(Canal: integer);
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

procedure TDMAgrupacionOfertasVentas.MuestraDocumentos(Destino, ser: string; contador, CanalDestino: integer);
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
     CierraFormsMenos(FMAgrupacionOfertasVentas);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, CanalDestino);
     AbreDocumentos(Destino, Ser, Contador);
     // Cerramos el formulario desde el propio formulario.
     // FMAgrupacionPedidosVentas.Close;
  end;
end;

function TDMAgrupacionOfertasVentas.AceptaCambioCanal: boolean;
begin
  FMControlAgrupPedidos := TFMControlAgrupPedidos.Create(DMAgrupacionOfertasVentas);
  FMControlAgrupPedidos.AsignaDataSource(DMAgrupacionOfertasVentas.DSxDocumentos);
  Result := (FMControlAgrupPedidos as TFMControlAgrupPedidos).Inicializa;
  FMControlAgrupPedidos.Free;
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleBARRASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameCodigoBarras(QMDetalleARTICULO.Text);
end;

procedure TDMAgrupacionOfertasVentas.RecorreProcesados(Entrada: integer);
begin
  with xProcesar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := Entrada;
     Open;
  end;
end;

procedure TDMAgrupacionOfertasVentas.Final(proc_auto, CanalDestino: integer; Tipo, serie_fac: string);
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

procedure TDMAgrupacionOfertasVentas.MuestraErrores;
begin
  FMControlErroresAgrupPec := TFMControlErroresAgrupPec.Create(Self);
  FMControlErroresAgrupPec.ShowModal;
  FMControlErroresAgrupPec.Free;
end;

procedure TDMAgrupacionOfertasVentas.SetCliente(Cliente: integer);
begin
  EBusca.Cliente := Cliente;
end;

procedure TDMAgrupacionOfertasVentas.SetSerie(Serie: string);
begin
  EBusca.Serie := Serie;
  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
end;

function TDMAgrupacionOfertasVentas.GetCliente: integer;
begin
  Result := EBusca.Cliente;
end;

function TDMAgrupacionOfertasVentas.GetSerie: string;
begin
  Result := EBusca.Serie;
end;

function TDMAgrupacionOfertasVentas.PuedeRealizarAlbFac(Cliente: integer): boolean;
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

procedure TDMAgrupacionOfertasVentas.ActualizaPrecio(Articulo: string; Proceso_auto: integer);
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

procedure TDMAgrupacionOfertasVentas.RecorreFacturados(Proceso_auto: integer);
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

procedure TDMAgrupacionOfertasVentas.DataModuleDestroy(Sender: TObject);
begin
  Errores.Free;
  BorraTemporales;
  LimpiaLotesTemporales;
end;

procedure TDMAgrupacionOfertasVentas.FiltraHojaPreparacion(Cliente: integer);
begin
  with QMCabeceraPre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMAgrupacionOfertasVentas.InicializaTraspasoHojas(Tipo: string);
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
           {Marco las lineas de Oferta segun el detalle de la Hoja de Preparacion}
           QMDetalle.First;
           while not QMDetalle.EOF do
           begin
              if QMDetalleID_DETALLES_S.AsInteger = QMDetallePreID_DETALLES_S.AsInteger then
              begin
                 {Si debo marcar los Ofertas}
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
                                SQL.Add(' ENTRADA, ID_DETALLES, LINEA, LOTE, UNIDADES, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ');
                                SQL.Add(' ALMACEN, ARTICULO, SERIE, CLASIFICACION, TIPO, ID_A, PROVEEDOR, ID_LOTE, ID_A_UBICACION) ');
                                SQL.Add(' VALUES( ');
                                SQL.Add(' ?ENTRADA, ?ID_DETALLES, ?LINEA, ?LOTE, ?UNIDADES, ?F_ENVASADO, ');
                                SQL.Add(' ?F_CADUCIDAD, ?F_FABRICACION, ?ALMACEN, ?ARTICULO, ?SERIE, ?CLASIFICACION, ');
                                SQL.Add(' ?TIPO, ?ID_A, ?PROVEEDOR, ?ID_LOTE, ?ID_A_UBICACION) ');
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ID_DETALLES'].AsInteger := QMDetallePreUbicacionesID_DETALLES_S.AsInteger;
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
                                Params.ByName['ID_A_UBICACION'].AsInteger := QMDetallePreUbicacionesID_A_UBICACION.AsInteger;
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
                    {Si debo desmarcar los Ofertas}
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

procedure TDMAgrupacionOfertasVentas.QMCabeceraPreAfterOpen(DataSet: TDataSet);
begin
  QMDetallePre.Open;
end;

procedure TDMAgrupacionOfertasVentas.QMCabeceraPreBeforeClose(DataSet: TDataSet);
begin
  QMDetallePre.Close;
end;

procedure TDMAgrupacionOfertasVentas.ActualizaInfoAlbaran;
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

procedure TDMAgrupacionOfertasVentas.QMCabeceraAlbaranAfterOpen(DataSet: TDataSet);
begin
  QMDetalleAlbaran.Open;
end;

procedure TDMAgrupacionOfertasVentas.QMCabeceraAlbaranBeforeClose(DataSet: TDataSet);
begin
  QMDetalleAlbaran.Close;
end;

procedure TDMAgrupacionOfertasVentas.QMDetallePreAfterOpen(DataSet: TDataSet);
begin
  QMDetallePreUbicaciones.Open;
end;

procedure TDMAgrupacionOfertasVentas.QMDetallePreBeforeClose(DataSet: TDataSet);
begin
  QMDetallePreUbicaciones.Close;
end;

procedure TDMAgrupacionOfertasVentas.ActualizaEstadoHojaPrep;
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

procedure TDMAgrupacionOfertasVentas.FiltraOfertas(aOfertaDesde, aOfertaHasta: integer; aPais: string; aDir: integer; aArticulo: string; aSoloListoPreparar: boolean);
begin
  // Guardo las variables que me pasan
  OfertaDesde := aOfertaDesde;
  OfertaHasta := aOfertaHasta;
  Pais := aPais;
  Dir := aDir;
  Articulo := aArticulo;
  SoloListoPreparar := aSoloListoPreparar;

  MyFiltraOfertas;
end;

procedure TDMAgrupacionOfertasVentas.EnviaOfertasFiltrados;
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

procedure TDMAgrupacionOfertasVentas.MyFiltraOfertas;
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.LogIni('MyFiltraOfertas');
  with QMDetalle do
  begin
     Close;
     // Filtro general del VER_DETALLE_OFERTA_C
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA, C.CLIENTE, C.ESTADO, /**/ ''ESP'' as PAIS, D.UNIDADES, D.UNIDADES_SERVIDAS,');
     SelectSQL.Add('        D.UNIDADES_RESERVADAS, /**/ cast(0 as double precision) as UNIDADES_PREPARADAS, D.SERVIDO, D.P_COSTE, D.ENTRADA_AGRUPACION, D.ARTICULO, D.TITULO, D.ALMACEN, ');
     SelectSQL.Add('        D.ENTRADA, C.MONEDA, /**/ cast(''NOW'' as date) as FECHA_REC_DET, D.ID_A, D.ID_DETALLES_S, D.TIPO_LINEA, D.ID_S, D.ORIGEN, D.UNIDADES_PENDIENTES, ');
     SelectSQL.Add('        D.FECHA_ENTREGA_PREV, D.DIRECCION_ENTREGA, D.TIPO_UNIDAD_LOGISTICA, D.TITULO_UNIDAD_LOGISTICA, D.UNIDADES_LOGISTICAS, ');
     SelectSQL.Add('        D.U_LOGISTICAS_RESERVADAS, D.ORDEN, C.SU_REFERENCIA, CP.DOCUMENTO_MUESTRAS, cast(1 as smallint) as LISTO_PARA_PREPARAR, cast('''' as varchar(40)) as LOTE_SIMPLE, ');
     SelectSQL.Add('        (SELECT UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         TIPO = D.TIPO_UNIDAD_LOGISTICA) UNIDADES_POR_UL, ');
     SelectSQL.Add('        (SELECT RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         TIPO = D.TIPO) RELACIONAR_CON_UNIDADES, ');
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
     SelectSQL.Add('         D.PRECIO, /**/ CAST('''' AS varchar(25)) AS ASEGURADO,');
     SelectSQL.Add('         /**/ CAST('''' AS varchar(25)) AS PACIENTE,');
     SelectSQL.Add('         /**/ CAST('''' AS varchar(20)) AS AUTORIZACION,');
     SelectSQL.Add('         /**/ CAST('''' AS varchar(25)) AS POLIZA,');
     SelectSQL.Add('         /**/ CAST(''NOW'' AS date) AS FEC_REC_IH, D.DECIMALES_UNIDADES,');
     SelectSQL.Add('         D.ALFA_1, D.ALFA_2, D.ALFA_3, D.ALFA_4, D.ALFA_5, D.ALFA_6, D.ALFA_7, D.ALFA_8, ');
     SelectSQL.Add('         AM.REF_PROVEEDOR, ART.LOTES, C.PEDIDO_CLIENTE ');
     SelectSQL.Add('         FROM VER_DETALLE_OFERTA_C D ');
     SelectSQL.Add('         JOIN GES_CABECERAS_S_OFC CP ON D.ID_S = CP.ID_S ');
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
     SelectSQL.Add(' D.TIPO = ''OFC'' AND ');
     SelectSQL.Add(' C.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' C.ESTADO = 0 ');

     // Agregamos los filtros que correspondan
     if (OfertaDesde > 0) then
     begin
        if ((OfertaDesde = OfertaHasta) or (OfertaHasta <= 0)) then
           SelectSQL.Add(' AND D.RIG = ' + IntToStr(OfertaDesde))
        else
           SelectSQL.Add(' AND D.RIG >= ' + IntToStr(OfertaDesde));
     end;
     if ((OfertaHasta > 0) and (OfertaDesde <> OfertaHasta)) then
        SelectSQL.Add(' AND D.RIG <= ' + IntToStr(OfertaHasta));
     if (Pais > '') then
        SelectSQL.Add(' AND PAIS = ''' + Pais + '''');
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
     SelectSQL.Add(' D.TIPO = ''OFC'' AND ');
     SelectSQL.Add(' C.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' C.ESTADO = 0 AND ');
     SelectSQL.Add(' D.ENTRADA_AGRUPACION = :ENTRADA) ');

     // dji lrk kri - mirko lo quiere ordenado por direccion de entrega
     if (DMMain.EstadoKri(205) = 1) then
        SelectSQL.Add(' ORDER BY D.DIRECCION_ENTREGA, D.EJERCICIO, D.RIG, D.ORDEN')
     else
        SelectSQL.Add(' ORDER BY D.EJERCICIO, D.RIG, D.ORDEN');

     DMMain.Log('DMAgrupacionOfertasVentas.MyFiltraOfertas.QMDetalle.SelectSQL:' + #13#10 + SelectSQL.Text);

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
  DMMain.LogFin('MyFiltraOfertas');
end;

procedure TDMAgrupacionOfertasVentas.xRecorreCabHojasAfterOpen(DataSet: TDataSet);
begin
  xRecorreDetHoja.Open;
end;

procedure TDMAgrupacionOfertasVentas.QMDetallePreUbicacionesAfterOpen(DataSet: TDataSet);
begin
  xLote.Open;
end;

procedure TDMAgrupacionOfertasVentas.QMDetallePreUbicacionesBeforeClose(DataSet: TDataSet);
begin
  xLote.Close;
end;

procedure TDMAgrupacionOfertasVentas.RefrescarTotales;
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
procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADES_SERVIDASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES_SERVIDAS.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADES_RESERVADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES_RESERVADAS.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.LimpiaLotesTemporales;
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
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleU_LOGISTICAS_RESERVADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
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

procedure TDMAgrupacionOfertasVentas.QMDetalleU_LOGISTICAS_RESERVADASChange(Sender: TField);
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
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := (QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat / QMDetalleUNIDADES_LOGISTICAS.AsFloat) * QMDetalleUNIDADES.AsFloat
              else
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleUNIDADES.AsFloat; // No se que poner aqui.
           end
           else
           begin
              if (QMDetalleUNIDADES_POR_UL.AsFloat <> 0) then
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat * QMDetalleUNIDADES_POR_UL.AsFloat
              else
                 QMDetalleUNIDADES_RESERVADAS.AsFloat := QMDetalleU_LOGISTICAS_RESERVADAS.AsFloat;
           end;
           // end;
        end;
     end;
  end;
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := QMDetalleLOTE.AsString;
  if (QMDetalleCANT_LOTE.AsInteger > 1) then
     Text := Text + ' (+' + QMDetalleCANT_LOTE.AsString + ')';
end;

procedure TDMAgrupacionOfertasVentas.InfoLotes;
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

procedure TDMAgrupacionOfertasVentas.QMDetalleCalcFields(DataSet: TDataSet);
begin
  // Obtengo el stock del articulo
  if CalculaStock then
     QMDetalleSTOCK.AsFloat := DMMain.DameStockArticulo(QMDetalleEMPRESA.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString)
  else
     QMDetalleSTOCK.AsFloat := 0;
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADES_PENDIENTESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleUNIDADES_PREPARADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

procedure TDMAgrupacionOfertasVentas.QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, TFloatField(Sender).AsFloat]);
end;

end.
