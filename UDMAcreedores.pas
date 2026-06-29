unit UDMAcreedores;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, SysUtils, FIBQuery, HYFIBQuery,
  FIBDataSetRW, FR_DSet, FR_DBSet, FR_Class, idGlobalProtocols, ShellApi,
  FIBTableDataSetRO;

type
  TDMAcreedores = class(TDataModule)
     QMAcreedores: TFIBTableSet;
     DSQMAcreedores: TDataSource;
     DSxTerceros: TDataSource;
     DSxFormasPago: TDataSource;
     DSxTipos: TDataSource;
     QMAcreedoresEMPRESA: TIntegerField;
     QMAcreedoresEJERCICIO: TIntegerField;
     QMAcreedoresCANAL: TIntegerField;
     QMAcreedoresACREEDOR: TIntegerField;
     QMAcreedoresTIPO: TIntegerField;
     QMAcreedoresTERCERO: TIntegerField;
     QMAcreedoresFORMA_PAGO: TFIBStringField;
     QMAcreedoresDIA_PAGO_1: TIntegerField;
     QMAcreedoresDESCUENTO_PP: TFloatField;
     QMAcreedoresNOTAS: TBlobField;
     QMAcreedoresCUENTA: TFIBStringField;
     QMAcreedoresTITULO: TFIBStringField;
     DSxIvaModos: TDataSource;
     QMAcreedoresMODO_IVA: TIntegerField;
     DSxIRPF: TDataSource;
     QMAcreedoresTIPO_IRPF: TIntegerField;
     QMAcreedoresPAIS: TFIBStringField;
     TLocal: THYTransaction;
     QMAcreedoresNOMBRE_R_SOCIAL: TFIBStringField;
     QMAcreedoresUSAR_ANTICIPOS: TIntegerField;
     xTerceros: TFIBDataSetRO;
     xFormasPago: TFIBDataSetRO;
     xFormasPagoFORMA_PAGO: TFIBStringField;
     xFormasPagoTITULO: TFIBStringField;
     xTipos: TFIBDataSetRO;
     xIvaModos: TFIBDataSetRO;
     xIRPF: TFIBDataSetRO;
     xIRPFP_IRPF: TFloatField;
     xIRPFTITULO: TFIBStringField;
     QMAcreedoresEVAL_FEB: TIntegerField;
     QMAcreedoresEVAL_FEB_SI: TIntegerField;
     QMAcreedoresMONEDA: TFIBStringField;
     xMoneda: TFIBDataSetRO;
     xMonedaMONEDA: TFIBStringField;
     xMonedaTITULO: TFIBStringField;
     xMonedaSIGNO_MONEDA: TFIBStringField;
     xMonedaDEC_VER: TIntegerField;
     xMonedaDEC_CALCULOS: TIntegerField;
     xMonedaDEFECTO: TIntegerField;
     DSxMoneda: TDataSource;
     QMAcreedoresCUENTA_GASTOS: TFIBStringField;
     xCuentas: TFIBDataSetRO;
     DSxCuentas: TDataSource;
     QMAcreedoresFINANCIACION: TIntegerField;
     QMAcreedoresPOR_FINANCIACION: TFloatField;
     QMAcreedoresDIA_PAGO_2: TIntegerField;
     QMAcreedoresDIA_PAGO_3: TIntegerField;
     QMAcreedoresTIT_LOCALIDAD: TFIBStringField;
     QMAcreedoresCODIGO_POSTAL: TFIBStringField;
     xCuentaDto: TFIBDataSetRO;
     DSxCuentaDto: TDataSource;
     QMAcreedoresCUENTA_DTOPP: TFIBStringField;
     xIncidencias: TFIBTableSet;
     xIncidenciasEMPRESA: TIntegerField;
     xIncidenciasINCIDENCIA: TIntegerField;
     xIncidenciasTITULO_INCIDENCIA: TFIBStringField;
     xIncidenciasFECHA: TDateTimeField;
     xIncidenciasFECHA_RECEPCION: TDateTimeField;
     xIncidenciasTIPO_TERCERO: TFIBStringField;
     xIncidenciasCOD_CLI_PRO: TIntegerField;
     xIncidenciasTERCERO: TIntegerField;
     xIncidenciasTITULO_TERCERO: TFIBStringField;
     xIncidenciasDATOS_INCIDENCIA: TBlobField;
     xIncidenciasFECHA_RESPUESTA: TDateTimeField;
     xIncidenciasRESPUESTA_INCIDENCIA: TBlobField;
     xIncidenciasID_S: TIntegerField;
     xIncidenciasID_E: TIntegerField;
     xIncidenciasDOC_EJERCICIO: TIntegerField;
     xIncidenciasDOC_SERIE: TFIBStringField;
     xIncidenciasDOC_CANAL: TIntegerField;
     xIncidenciasDOC_TIPO: TFIBStringField;
     xIncidenciasDOC_RIG: TIntegerField;
     DSxIncidencias: TDataSource;
     QMAcreedoresTRANSPORTE_RAPIDO_KRI: TIntegerField;
     DSxFacturasMensual: TDataSource;
     xPrevisionAnual: TFIBDataSet;
     xPrevisionAnualTOTAL_BASE: TFloatField;
     xPrevisionAnualTOTAL_LIQUIDO: TFloatField;
     DSxPrevisionAnual: TDataSource;
     xFacturasAnual: TFIBDataSet;
     xFacturasAnualTOTAL_BASE: TFloatField;
     xFacturasAnualTOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnual: TDataSource;
     DSxFacturasMensualCompara: TDataSource;
     xFacturasMensualCompara: TFIBDataSet;
     xPrevisionMensual: TFIBDataSet;
     DSxPrevisionMensual: TDataSource;
     xFacturasMensual: TFIBTableSet;
     xFacturasAnualCompara: TFIBDataSet;
     xFacturasAnualComparaTOTAL_BASE: TFloatField;
     xFacturasAnualComparaTOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualCompara: TDataSource;
     DSxMonedas: TDataSource;
     xFacturasAnualC_1: TFIBDataSet;
     xFacturasAnualC_1TOTAL_BASE: TFloatField;
     xFacturasAnualC_1TOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualC_1: TDataSource;
     xFacturasAnualC_2: TFIBDataSet;
     xFacturasAnualC_2TOTAL_BASE: TFloatField;
     xFacturasAnualC_2TOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualC_2: TDataSource;
     xFacturasAnualC_3: TFIBDataSet;
     xFacturasAnualC_3TOTAL_BASE: TFloatField;
     xFacturasAnualC_3TOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualC_3: TDataSource;
     xMonedas: TFIBDataSet;
     xMonedasMONEDA: TFIBStringField;
     xFactPend: TFIBDataSetRO;
     xFactPendN_PAGADO: TIntegerField;
     xFactPendT_PAGADO: TFloatField;
     xFactPendN_IMPAGADO: TIntegerField;
     xFactPendT_IMPAGADO: TFloatField;
     xFactPendN_PEND_COBRAR: TIntegerField;
     xFactPendT_PEND_COBRAR: TFloatField;
     xFactPendN_PEND_RECIBIR: TIntegerField;
     xFactPendT_PEND_RECIBIR: TFloatField;
     xFactPendMEDIA_DIAS_PAGO: TIntegerField;
     xFactPendMEDIA_DIAS_REC: TIntegerField;
     DSxfactPend: TDataSource;
     DSxDocumentos: TDataSource;
     xDocumentos: TFIBDataSetRO;
     xDocumentosT_PAGADO: TFloatField;
     xDocumentosT_PEND_COBRAR: TFloatField;
     xDocumentosT_PEND_RECIBIR: TFloatField;
     xDocumentosCUENTA_PEND: TFIBStringField;
     xDocumentosCUENTA_ANTICIPO: TFIBStringField;
     xDocumentosN_FAC_PEND: TIntegerField;
     xDocumentosB_FAC_PEND: TFloatField;
     xDocumentosT_FAC_PEND: TFloatField;
     xDocumentosN_PEND_COBRAR: TIntegerField;
     xDocumentosN_PEND_RECIBIR: TIntegerField;
     xFacturasMensualComparaACREEDOR: TIntegerField;
     xFacturasMensualComparaB_ENERO: TFloatField;
     xFacturasMensualComparaL_ENERO: TFloatField;
     xFacturasMensualComparaB_FEBRERO: TFloatField;
     xFacturasMensualComparaL_FEBRERO: TFloatField;
     xFacturasMensualComparaB_MARZO: TFloatField;
     xFacturasMensualComparaL_MARZO: TFloatField;
     xFacturasMensualComparaB_ABRIL: TFloatField;
     xFacturasMensualComparaL_ABRIL: TFloatField;
     xFacturasMensualComparaB_MAYO: TFloatField;
     xFacturasMensualComparaL_MAYO: TFloatField;
     xFacturasMensualComparaB_JUNIO: TFloatField;
     xFacturasMensualComparaL_JUNIO: TFloatField;
     xFacturasMensualComparaB_JULIO: TFloatField;
     xFacturasMensualComparaL_JULIO: TFloatField;
     xFacturasMensualComparaB_AGOSTO: TFloatField;
     xFacturasMensualComparaL_AGOSTO: TFloatField;
     xFacturasMensualComparaB_SEPTIEMBRE: TFloatField;
     xFacturasMensualComparaL_SEPTIEMBRE: TFloatField;
     xFacturasMensualComparaB_OCTUBRE: TFloatField;
     xFacturasMensualComparaL_OCTUBRE: TFloatField;
     xFacturasMensualComparaB_NOVIEMBRE: TFloatField;
     xFacturasMensualComparaL_NOVIEMBRE: TFloatField;
     xFacturasMensualComparaB_DICIEMBRE: TFloatField;
     xFacturasMensualComparaL_DICIEMBRE: TFloatField;
     xFacturasMensualACREEDOR: TIntegerField;
     xFacturasMensualB_ENERO: TFloatField;
     xFacturasMensualL_ENERO: TFloatField;
     xFacturasMensualB_FEBRERO: TFloatField;
     xFacturasMensualL_FEBRERO: TFloatField;
     xFacturasMensualB_MARZO: TFloatField;
     xFacturasMensualL_MARZO: TFloatField;
     xFacturasMensualB_ABRIL: TFloatField;
     xFacturasMensualL_ABRIL: TFloatField;
     xFacturasMensualB_MAYO: TFloatField;
     xFacturasMensualL_MAYO: TFloatField;
     xFacturasMensualB_JUNIO: TFloatField;
     xFacturasMensualL_JUNIO: TFloatField;
     xFacturasMensualB_JULIO: TFloatField;
     xFacturasMensualL_JULIO: TFloatField;
     xFacturasMensualB_AGOSTO: TFloatField;
     xFacturasMensualL_AGOSTO: TFloatField;
     xFacturasMensualB_SEPTIEMBRE: TFloatField;
     xFacturasMensualL_SEPTIEMBRE: TFloatField;
     xFacturasMensualB_OCTUBRE: TFloatField;
     xFacturasMensualL_OCTUBRE: TFloatField;
     xFacturasMensualB_NOVIEMBRE: TFloatField;
     xFacturasMensualL_NOVIEMBRE: TFloatField;
     xFacturasMensualB_DICIEMBRE: TFloatField;
     xFacturasMensualL_DICIEMBRE: TFloatField;
     xPrevisionMensualB_ENERO: TFloatField;
     xPrevisionMensualL_ENERO: TFloatField;
     xPrevisionMensualB_FEBRERO: TFloatField;
     xPrevisionMensualL_FEBRERO: TFloatField;
     xPrevisionMensualB_MARZO: TFloatField;
     xPrevisionMensualL_MARZO: TFloatField;
     xPrevisionMensualB_ABRIL: TFloatField;
     xPrevisionMensualL_ABRIL: TFloatField;
     xPrevisionMensualB_MAYO: TFloatField;
     xPrevisionMensualL_MAYO: TFloatField;
     xPrevisionMensualB_JUNIO: TFloatField;
     xPrevisionMensualL_JUNIO: TFloatField;
     xPrevisionMensualB_JULIO: TFloatField;
     xPrevisionMensualL_JULIO: TFloatField;
     xPrevisionMensualB_AGOSTO: TFloatField;
     xPrevisionMensualL_AGOSTO: TFloatField;
     xPrevisionMensualB_SEPTIEMBRE: TFloatField;
     xPrevisionMensualL_SEPTIEMBRE: TFloatField;
     xPrevisionMensualB_OCTUBRE: TFloatField;
     xPrevisionMensualL_OCTUBRE: TFloatField;
     xPrevisionMensualB_NOVIEMBRE: TFloatField;
     xPrevisionMensualL_NOVIEMBRE: TFloatField;
     xPrevisionMensualB_DICIEMBRE: TFloatField;
     xPrevisionMensualL_DICIEMBRE: TFloatField;
     TUpdate: THYTransaction;
     xComunicaciones: TFIBTableSet;
     xComunicacionesID: TIntegerField;
     xComunicacionesEMPRESA: TIntegerField;
     xComunicacionesTIPO: TFIBStringField;
     xComunicacionesCOD_CLI_PRO: TIntegerField;
     xComunicacionesARCHIVO: TFIBStringField;
     xComunicacionesFECHA_CREACION: TDateTimeField;
     xComunicacionesFECHA_MODIFICACION: TDateTimeField;
     xComunicacionesDESCRIPCION: TFIBStringField;
     DSxComunicaciones: TDataSource;
     QMAcreedoresGENERA_TALONES: TIntegerField;
     QMAcreedoresBAJA: TIntegerField;
     QMAcreedoresFECHA_BAJA: TDateTimeField;
     QMAcreedoresMOTIVO_BAJA: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     QMAcreedoresTIPO_NCF: TIntegerField;
     QMAcreedoresIDIOMA: TFIBStringField;
     QMAcreedoresRECC: TIntegerField;
     QMAcreedoresBANCO_PAGOS: TIntegerField;
     QMAcreedoresINTRA: TIntegerField;
     QMAcreedoresINTRA_TRANS: TIntegerField;
     QMAcreedoresPAIS_C2: TFIBStringField;
     QMAcreedoresTRANSPORTISTA_CREA_RUTA: TIntegerField;
     xTipoTrans: TFIBDataSetRO;
     xTipoTransTIPO: TIntegerField;
     xTipoTransTITULO: TFIBStringField;
     DSxTipoTrans: TDataSource;
     xPais: TFIBDataSetRO;
     xPaisPAIS: TFIBStringField;
     xPaisTITULO: TFIBStringField;
     xPaisPAIS_C2: TFIBStringField;
     xPaisPAIS_N3: TFIBStringField;
     xPaisCODIGO_TEL: TFIBStringField;
     xPaisIDIOMA: TFIBStringField;
     DSxPais: TDataSource;
     xTarifaPortes: TFIBTableSet;
     DSxTarifaPortes: TDataSource;
     xTarifaPortesEMPRESA: TIntegerField;
     xTarifaPortesEJERCICIO: TIntegerField;
     xTarifaPortesCANAL: TIntegerField;
     xTarifaPortesACREEDOR: TIntegerField;
     xTarifaPortesZONA: TFIBStringField;
     xTarifaPortesTITULO: TFIBStringField;
     xTarifaPortesIMPORTE: TFloatField;
     xTarifaPortesIMPORTE_RMB: TFloatField;
     QMAcreedoresBLOQUEO: TIntegerField;
     QMAcreedoresMOTIVO_BLOQUEO: TFIBStringField;
     QMAcreedoresGENERA_ENVIO: TIntegerField;
     DSxCompras: TDataSource;
     xCompras: TFIBTableSetRO;
     xComprasEMPRESA: TIntegerField;
     xComprasEJERCICIO: TIntegerField;
     xComprasCANAL: TIntegerField;
     xComprasSERIE: TFIBStringField;
     xComprasTIPO: TFIBStringField;
     xComprasRIG: TIntegerField;
     xComprasALMACEN: TFIBStringField;
     xComprasMONEDA: TFIBStringField;
     xComprasFECHA: TDateTimeField;
     xComprasNOTAS: TBlobField;
     xComprasESTADO: TIntegerField;
     xComprasBULTOS: TIntegerField;
     xComprasLINEAS: TIntegerField;
     xComprasBRUTO: TFloatField;
     xComprasI_DTO_LINEAS: TFloatField;
     xComprasS_BASES: TFloatField;
     xComprasS_CUOTA_IVA: TFloatField;
     xComprasS_CUOTA_RE: TFloatField;
     xComprasB_DTO_LINEAS: TFloatField;
     xComprasDTO_PP: TFloatField;
     xComprasDTO_CIAL: TFloatField;
     xComprasENTRADA: TIntegerField;
     xComprasI_DTO_CIAL: TFloatField;
     xComprasI_DTO_PP: TFloatField;
     xComprasLIQUIDO: TFloatField;
     xComprasPOR_FINANCIACION: TFloatField;
     xComprasI_FINANCIACION: TFloatField;
     xComprasFORMA_DE_PAGO: TFIBStringField;
     xComprasI_FINANCIACION_CANAL: TFloatField;
     xComprasS_BASES_CANAL: TFloatField;
     xComprasS_CUOTA_IVA_CANAL: TFloatField;
     xComprasS_CUOTA_RE_CANAL: TFloatField;
     xComprasLIQUIDO_CANAL: TFloatField;
     xComprasCHG_MONEDA: TIntegerField;
     xComprasSU_REFERENCIA: TFIBStringField;
     xComprasID_E: TIntegerField;
     xComprasMODIFICA_DOC: TIntegerField;
     xComprasFECHA_ENTREGA: TDateTimeField;
     xComprasI_PORTES: TFloatField;
     xComprasPOR_PORTES: TFloatField;
     xComprasTIPO_PORTES: TIntegerField;
     xComprasI_PORTES_CANAL: TFloatField;
     xComprasCAMBIO_FIJO: TIntegerField;
     xComprasVALOR_CAMB_FIJO: TFloatField;
     xComprasPROCESO_AUTO: TIntegerField;
     xComprasPROYECTO: TIntegerField;
     xComprasPERMITIR_SUPERAR_IMPORTE_KRI: TIntegerField;
     xComprasTERCERO: TIntegerField;
     xComprasACREEDOR: TIntegerField;
     DSxComprasDetalle: TDataSource;
     xComprasDetalle: TFIBTableSetRO;
     xComprasDetalleEMPRESA: TIntegerField;
     xComprasDetalleEJERCICIO: TIntegerField;
     xComprasDetalleCANAL: TIntegerField;
     xComprasDetalleSERIE: TFIBStringField;
     xComprasDetalleTIPO: TFIBStringField;
     xComprasDetalleRIG: TIntegerField;
     xComprasDetalleALMACEN: TFIBStringField;
     xComprasDetalleMONEDA: TFIBStringField;
     xComprasDetalleFECHA: TDateTimeField;
     xComprasDetalleNOTAS: TBlobField;
     xComprasDetalleESTADO: TIntegerField;
     xComprasDetalleBULTOS: TIntegerField;
     xComprasDetalleLINEAS: TIntegerField;
     xComprasDetalleBRUTO: TFloatField;
     xComprasDetalleI_DTO_LINEAS: TFloatField;
     xComprasDetalleS_BASES: TFloatField;
     xComprasDetalleS_CUOTA_IVA: TFloatField;
     xComprasDetalleS_CUOTA_RE: TFloatField;
     xComprasDetalleB_DTO_LINEAS: TFloatField;
     xComprasDetalleDTO_PP: TFloatField;
     xComprasDetalleDTO_CIAL: TFloatField;
     xComprasDetalleENTRADA: TIntegerField;
     xComprasDetalleI_DTO_CIAL: TFloatField;
     xComprasDetalleI_DTO_PP: TFloatField;
     xComprasDetalleLIQUIDO: TFloatField;
     xComprasDetallePOR_FINANCIACION: TFloatField;
     xComprasDetalleI_FINANCIACION: TFloatField;
     xComprasDetalleFORMA_DE_PAGO: TFIBStringField;
     xComprasDetalleI_FINANCIACION_CANAL: TFloatField;
     xComprasDetalleS_BASES_CANAL: TFloatField;
     xComprasDetalleS_CUOTA_IVA_CANAL: TFloatField;
     xComprasDetalleS_CUOTA_RE_CANAL: TFloatField;
     xComprasDetalleLIQUIDO_CANAL: TFloatField;
     xComprasDetalleCHG_MONEDA: TIntegerField;
     xComprasDetalleSU_REFERENCIA: TFIBStringField;
     xComprasDetalleID_E: TIntegerField;
     xComprasDetalleMODIFICA_DOC: TIntegerField;
     xComprasDetalleFECHA_ENTREGA: TDateTimeField;
     xComprasDetalleI_PORTES: TFloatField;
     xComprasDetallePOR_PORTES: TFloatField;
     xComprasDetalleTIPO_PORTES: TIntegerField;
     xComprasDetalleI_PORTES_CANAL: TFloatField;
     xComprasDetalleCAMBIO_FIJO: TIntegerField;
     xComprasDetalleVALOR_CAMB_FIJO: TFloatField;
     xComprasDetallePROCESO_AUTO: TIntegerField;
     xComprasDetallePROYECTO: TIntegerField;
     xComprasDetallePERMITIR_SUPERAR_IMPORTE_KRI: TIntegerField;
     xComprasDetalleTERCERO: TIntegerField;
     xComprasDetalleACREEDOR: TIntegerField;
     xComprasDetalleLINEA: TIntegerField;
     xComprasDetalleALMACEN_DET: TFIBStringField;
     xComprasDetalleARTICULO: TFIBStringField;
     xComprasDetalleTITULO: TFIBStringField;
     xComprasDetalleUNIDADES: TFloatField;
     xComprasDetallePRECIO: TFloatField;
     xComprasDetalleDESCUENTO: TFloatField;
     xComprasDetalleDESCUENTO_2: TFloatField;
     xComprasDetalleDESCUENTO_3: TFloatField;
     xComprasDetalleP_COSTE: TFloatField;
     xComprasDetalleTIPO_IVA: TIntegerField;
     xComprasDetalleP_IVA: TFloatField;
     xComprasDetalleP_RECARGO: TFloatField;
     xComprasDetalleI_DESCUENTO: TFloatField;
     xComprasDetalleB_IMPONIBLE: TFloatField;
     xComprasDetalleB_DTO_LINEA: TFloatField;
     xComprasDetalleC_IVA: TFloatField;
     xComprasDetalleC_RECARGO: TFloatField;
     xComprasDetalleT_COSTE: TFloatField;
     xComprasDetalleM_BRUTO: TFloatField;
     xComprasDetalleNOTAS_DET: TBlobField;
     xComprasDetalleID_DETALLES_E: TIntegerField;
     xComprasDetalleID_C_A: TIntegerField;
     xComprasDetalleID_A: TIntegerField;
     xComprasDetalleID_MOV_STOCKS: TIntegerField;
     xComprasDetalleNSERIE: TFIBStringField;
     xComprasDetalleBULTOS_DET: TFloatField;
     xComprasDetalleORDEN: TIntegerField;
     xComprasDetalleUNIDADES_SEC: TFloatField;
     xComprasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xComprasDetallePROYECTO_DET: TIntegerField;
     xComprasDetalleNOTAS_DET2: TBlobField;
     xComprasDetalleCRC_NOTAS: TFIBStringField;
     xComprasDetalleCRC_NOTAS_DET2: TFIBStringField;
     xComprasDetalleID_DETALLES_E_REGALO: TIntegerField;
     xComprasDetalleCUENTA: TFIBStringField;
     QMAcreedoresCUENTA_IRPF: TFIBStringField;
     QMAcreedoresNIF: TFIBStringField;
     xTipoGiro: TFIBTableSet;
     xTipoGiroEMPRESA: TIntegerField;
     xTipoGiroACREEDOR: TIntegerField;
     xTipoGiroCODIGO_GIRO: TIntegerField;
     xTipoGiroDEFECTO: TIntegerField;
     xTipoGiroTITULO: TFIBStringField;
     DSxTipoGiro: TDataSource;
     xComprasNUM_DOCUMENTO: TFIBStringField;
     xTarifaPortesPAIS: TFIBStringField;
     xTarifaPortesTITULO_PAIS: TFIBStringField;
     xTarifaPortesCODIGO_POSTAL_INI: TFIBStringField;
     xTarifaPortesCODIGO_POSTAL_FIN: TFIBStringField;
     xIncidenciasENTRADA: TIntegerField;
     xIncidenciasDIRECCION: TIntegerField;
     xIncidenciasDIR_NOMBRE: TFIBStringField;
     xIncidenciasAGENTE: TIntegerField;
     xIncidenciasCONTACTO: TIntegerField;
     xIncidenciasTIT_CONTACTO: TFIBStringField;
     xIncidenciasCONTACTO2: TIntegerField;
     xIncidenciasTIT_CONTACTO2: TFIBStringField;
     xIncidenciasCONTACTO3: TIntegerField;
     xIncidenciasTIT_CONTACTO3: TFIBStringField;
     xIncidenciasTIT_AGENTE: TFIBStringField;
     xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasUSUARIO: TIntegerField;
     xIncidenciasNOMBRE_USUARIO: TFIBStringField;
     xIncidenciasHORAS: TFloatField;
     xIncidenciasFINALIZADO: TIntegerField;
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
     DSxAvisos: TDataSource;
     QMAcreedoresID_ACREEDOR: TIntegerField;
     TEstadistica: THYTransaction;
     QMAcreedoresFECHA_ALTA: TDateTimeField;
     QMAcreedoresALFA_1: TStringField;
     QMAcreedoresALFA_2: TStringField;
     QMAcreedoresALFA_3: TStringField;
     QMAcreedoresALFA_5: TStringField;
     QMAcreedoresALFA_6: TStringField;
     QMAcreedoresALFA_7: TStringField;
     QMAcreedoresALFA_8: TStringField;
     QMAcreedoresALFA_4: TStringField;
     QMAcreedoresTITULO_REGION: TFIBStringField;
     QMAcreedoresTITULO_PROVINCIA: TFIBStringField;
     QMAcreedoresTITULO_POBLACION: TFIBStringField;
     QMAcreedoresTITULO_CODIGO_POSTAL: TFIBStringField;
     QMAcreedoresPROYECTO: TIntegerField;
     procedure QMAcreedoresNewRecord(DataSet: TDataSet);
     procedure QMAcreedoresBeforePost(DataSet: TDataSet);
     procedure QMAcreedoresTERCEROChange(Sender: TField);
     procedure QMAcreedoresNOMBRE_R_SOCIALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAcreedoresTIPOChange(Sender: TField);
     procedure QMAcreedoresAfterOpen(DataSet: TDataSet);
     procedure QMAcreedoresTIPO_IRPFChange(Sender: TField);
     procedure DMAcreedoresCreate(Sender: TObject);
     procedure DMAcreedoresDestroy(Sender: TObject);
     procedure QMAcreedoresPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMAcreedoresFORMA_PAGOChange(Sender: TField);
     procedure QMAcreedoresMODO_IVAChange(Sender: TField);
     procedure QMAcreedoresBeforeEdit(DataSet: TDataSet);
     procedure QMAcreedoresMONEDAChange(Sender: TField);
     procedure QMAcreedoresCUENTA_GASTOSChange(Sender: TField);
     procedure QMAcreedoresCUENTA_DTOPPChange(Sender: TField);
     procedure QMAcreedoresBeforeClose(DataSet: TDataSet);
     procedure xCuentasBeforeOpen(DataSet: TDataSet);
     procedure xComunicacionesNewRecord(DataSet: TDataSet);
     procedure xComunicacionesBeforePost(DataSet: TDataSet);
     procedure QMAcreedoresINTRA_TRANSChange(Sender: TField);
     procedure QMAcreedoresPAIS_C2Change(Sender: TField);
     procedure xTarifaPortesNewRecord(DataSet: TDataSet);
     procedure xTipoGiroNewRecord(DataSet: TDataSet);
     procedure xTipoGiroAfterPost(DataSet: TDataSet);
     procedure xTipoGiroBeforeDelete(DataSet: TDataSet);
     procedure xAvisosBeforePost(DataSet: TDataSet);
     procedure xAvisosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     cuentaold: string;
     procedure PreparaMultiSeleccion;
  public
     SQLBase: TStrings;
     PlantillaComunicaciones: string;
     procedure CambiarTercero(Tercero: integer);
     function BusquedaCompleja: integer;
     function HayDetalle: boolean;
     procedure CargaEstadisticas(Ejercicio, Ejercicio2: integer; Moneda: string; Porcentaje: double; Tipo: string);
     procedure CierraEstadisticas;
     procedure MuestraDocumentos;
     procedure CierraDocumentos;
     function DameAcreedor: integer;
     function DameCuenta: string;
     procedure FiltraCompras(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; SoloFacturasAbiertas: boolean);
     procedure QuitaFiltros;
     procedure FiltraAcreedor(Acreedor: integer);
     procedure ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
  end;

var
  DMAcreedores : TDMAcreedores;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, UFMain, UParam, UDMLstCircularizacion,
  UDMListados, UFormGest, UDameDato;

{$R *.DFM}

procedure TDMAcreedores.DMAcreedoresCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AsignaDisplayFormat(QMAcreedores, MascaraN, MascaraI, ShortDateFormat);
  QMAcreedoresDESCUENTO_PP.DisplayFormat := MascaraP;
  QMAcreedoresPOR_FINANCIACION.DisplayFormat := MascaraP;

  xIRPFP_IRPF.DisplayFormat := MascaraP;

  AsignaDisplayFormat(xFactPend, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDocumentos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasMensualCompara, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasAnualCompara, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasMensual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasAnual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPrevisionMensual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPrevisionAnual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xCompras, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xComprasDetalle, MascaraN, MascaraI, ShortDateFormat);

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMAcreedores.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ACRDESC%3.3d', [i]));

  {Latino}
  if (DMMain.EstadoKri(410) = 1) then
     xTipoNCF.Open;

  // Creamos la sentencia SQL básica para QMAcreedores
  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_ACREEDORES_CUENTAS ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add('   EMPRESA = ?EMPRESA AND ');
  SQLBase.Add('   EJERCICIO = ?EJERCICIO AND ');
  SQLBase.Add('   CANAL = ?CANAL ');

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAcreedores.SelectSQL.Text := SQLBase.Text;
  QMAcreedores.SelectSQL.Add(' ORDER BY ACREEDOR ');
  if not (FMain.autacreedor) then
  begin
     DMMain.FiltraTabla(QMAcreedores, '11100', True);
     DMMain.FiltraRO(xFormasPago, '11100', True);
  end;
end;

procedure TDMAcreedores.DMAcreedoresDestroy(Sender: TObject);
begin
  SQLBase.Free;   // Destruimos la sentencia SQL base
end;

procedure TDMAcreedores.QMAcreedoresNewRecord(DataSet: TDataSet);
begin
  QMAcreedoresEMPRESA.AsInteger := REntorno.Empresa;
  QMAcreedoresEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAcreedoresCANAL.AsInteger := REntorno.Canal;
  QMAcreedoresFORMA_PAGO.AsString := 'CON';
  QMAcreedoresTIPO.AsInteger := 1;
  QMAcreedoresPAIS.AsString := REntorno.Pais;
  QMAcreedoresTIPO_IRPF.AsInteger := DMMain.DameMinIRPF;
  QMAcreedoresMODO_IVA.AsInteger := DMMain.DameModoIVACanal;
  QMAcreedoresTercero.AsInteger := REntorno.Tercero;
  // Rep. Dominicana no utilizará anticipos
  if (REntorno.Pais = 'DOM') then
     QMAcreedoresUSAR_ANTICIPOS.AsInteger := 0
  else
     QMAcreedoresUSAR_ANTICIPOS.AsInteger := 1;
  QMAcreedoresEVAL_FEB.AsInteger := 1; {dji lrk kri}
  QMAcreedoresEVAL_FEB_SI.AsInteger := 1; {dji lrk kri}
  QMAcreedoresFINANCIACION.AsInteger := 0;
  QMAcreedoresMONEDA.AsString := REntorno.Moneda;
  QMAcreedoresPOR_FINANCIACION.AsFloat := 0;
  QMAcreedoresGENERA_TALONES.AsInteger := 0; {dji lrk kri}
  QMAcreedoresRECC.AsInteger := REntorno.RECC;
  QMAcreedoresINTRA.AsInteger := 0;
  QMAcreedoresINTRA_TRANS.AsInteger := 0;
  QMAcreedoresPAIS_C2.AsString := DamePaisC2(REntorno.Pais);

  QMAcreedoresCUENTA_GASTOS.AsString := DMMain.DameCuentaGestion(32);
  QMAcreedoresCUENTA_DTOPP.AsString := DMMain.DameCuentaGestion(14);
  QMAcreedoresBANCO_PAGOS.AsInteger := 0;
  QMAcreedoresTRANSPORTISTA_CREA_RUTA.AsInteger := 0;
  QMAcreedoresGENERA_ENVIO.AsInteger := 0;

  QMAcreedoresBLOQUEO.AsInteger := 0;
  QMAcreedoresMOTIVO_BLOQUEO.AsString := '';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 TIPO_NCF FROM Z_SYS_TIPO_NCF WHERE TIPO_DOCUMENTO = 1 AND DEFECTO = 1';
        ExecQuery;
        QMAcreedoresTIPO_NCF.AsInteger := FieldByName['TIPO_NCF'].AsInteger;
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
        SQL.Text := 'SELECT IDIOMA FROM SYS_IDIOMAS WHERE DEFECTO = 1';
        ExecQuery;
        QMAcreedoresIDIOMA.AsString := FieldByName['IDIOMA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAcreedores.QMAcreedoresBeforePost(DataSet: TDataSet);
var
  Semilla, Cuenta : string;
  Existe : boolean;
  Crea : boolean;
begin
  Semilla := DMMain.DameSemillaCuentaGestion(SemAcreedores, 1);
  Cuenta := QMAcreedoresCUENTA.AsString;
  if (DataSet.State = dsInsert) then
  begin
     // Calculo el nro de acreedor
     if DMMain.EstadoKri(116) = 1 then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(ACREEDOR) AS MAXIMO FROM EMP_ACREEDORES WHERE EMPRESA = ?EMPRESA AND ACREEDOR < 400000000';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              ExecQuery;
              QMAcreedoresACREEDOR.AsInteger := FieldByName['MAXIMO'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
        QMAcreedoresACREEDOR.AsInteger := DMMain.Contador_Libre('XAC',
           QMAcreedoresACREEDOR.AsInteger);
  end;

  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
  begin
     // Si en cuenta estan los primeros digitos de la cuenta, los utilizo como semilla
     if (Length(Cuenta + '.') = Length(Semilla)) then
        Semilla := Cuenta + '.';

     Cuenta := ExpandirCadena(Semilla + QMAcreedoresACREEDOR.AsString);
     // Si el interfijo es diferente del nro de cliente, utilizo solo los 3 primeros numeros de la semilla
     if (DMMain.EstadoKri(326) = 1) then
     begin
        if (StrToInt(Copy(Cuenta, Length(cuenta) - Length(QMAcreedoresACREEDOR.AsString) + 1,
           Length(QMAcreedoresACREEDOR.AsString))) <> QMAcreedoresACREEDOR.AsInteger) then
           Cuenta := ExpandirCadena(Copy(Semilla, 1, 3) + '.' + QMAcreedoresACREEDOR.AsString);
     end;
  end;

  if (QMAcreedoresCUENTA.AsString <> Cuenta) then
     QMAcreedoresCUENTA.AsString := Cuenta;

  if (Length(Cuenta) > REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada excede de la estructura contable actual'));
  if (Length(Cuenta) < REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada tiene menos dígitos que la estructura contable actual'));

  // Control de que la cuenta ya existe
  if (DataSet.State = dsInsert) then
     cuentaold := '';

  if (cuentaold <> QMAcreedoresCUENTA.AsString) then
  begin
     Crea := True;
     Existe := (DameTituloCuenta(QMAcreedoresCUENTA.AsString) > '');

     if (Existe) then
     begin
        Crea := (Application.MessageBox(PChar(string(_('La cuenta ya existe, ¿quiere realmente utilizarla?'))),
           PChar(string(_('Confirmación'))),
           mb_iconstop + mb_yesno) = id_yes);
     end;

     if (Crea) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_GES_EXISTE(:EMPRESA, :EJERCICIO, :CANAL, :CUENTA, 2)';
              Params.ByName['EMPRESA'].AsInteger := QMAcreedoresEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMAcreedoresEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAcreedoresCANAL.AsInteger;
              Params.ByName['CUENTA'].AsString := QMAcreedoresCUENTA.AsString;
              ExecQuery;
              Existe := (FieldByName['EXISTE'].AsInteger >= 1);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Existe) then
        begin
           Crea := (Application.MessageBox(PChar(string(_('La cuenta ya esta usada por otro Acreedor, ¿quiere realmente crearlo?'))),
              PChar(string(_('Confirmación'))),
              mb_iconstop + mb_yesno) = id_yes);
        end;
     end;

     if not (Crea) then
        raise Exception.Create(_('El Acreedor no ha sido creado'));
  end;
end;

procedure TDMAcreedores.QMAcreedoresTERCEROChange(Sender: TField);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Sender.AsInteger;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PA.PAIS_C2 ');
        SQL.Add(' FROM SYS_TERCEROS_DIRECCIONES DI ');
        SQL.Add(' JOIN SYS_LOCALIDADES LOC ON (DI.ID_LOCAL = LOC.ID_LOCAL) ');
        SQL.Add(' JOIN SYS_PAISES PA ON (PA.PAIS = LOC.PAIS) ');
        SQL.Add(' WHERE ((DI.TERCERO = :TERCERO) AND (DI.DIR_DEFECTO = 1)) ');
        Params.ByName['TERCERO'].AsInteger := QMAcreedoresTERCERO.AsInteger;
        ExecQuery;
        QMAcreedoresPAIS_C2.AsString := FieldByName['PAIS_C2'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAcreedores.QMAcreedoresNOMBRE_R_SOCIALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xTerceros.Close;
  xTerceros.Open;
  Text := xTerceros.FieldByName('NOMBRE_R_SOCIAL').AsString;
end;

procedure TDMAcreedores.QMAcreedoresTIPOChange(Sender: TField);
begin
  with xTipos do
  begin
     Close;
     Open;
  end;
end;

// Para borrar...
{procedure TDMAcreedores.Busca( Busca : string );
begin
  DMMain.Busca( Busca , QMAcreedores, 'ACREEDOR', 'TITULO','11100' );
end;  }

procedure TDMAcreedores.QMAcreedoresAfterOpen(DataSet: TDataSet);
begin
  xTerceros.Open;
  xTipos.Open;
  xIvaModos.Open;
  xIRPF.Open;
  xCuentas.Open;
  xMoneda.Open;
  xCuentaDto.Open;
  xIncidencias.Open;
  xFormasPago.Open;
  xTipoTrans.Open;
  xPais.Open;
  xTarifaPortes.Open;
  xTipoGiro.Open;
  xAvisos.Open;
end;

function TDMAcreedores.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMAcreedores, '11100');
end;

procedure TDMAcreedores.QMAcreedoresTIPO_IRPFChange(Sender: TField);
begin
  with xIRPF do
  begin
     Close;
     Params.ByName['TIPO_IRPF'].AsInteger := Sender.AsInteger;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDMAcreedores.QMAcreedoresPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMAcreedores.State = dsInsert then
  begin
     QMAcreedoresACREEDOR.Clear;
     QMAcreedoresCUENTA.Clear;
  end;
end;

procedure TDMAcreedores.QMAcreedoresFORMA_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAcreedores.QMAcreedoresMODO_IVAChange(Sender: TField);
begin
  with xIvaModos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAcreedores.CambiarTercero(Tercero: integer);
begin
  with QMAcreedores do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT   * FROM VER_ACREEDORES_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' ACREEDOR < -1 ');
     SelectSQL.Add(' ORDER BY ACREEDOR ');

     DMMain.FiltraTabla(QMAcreedores, '11100', True);

     Insert;
     QMAcreedoresTERCERO.AsInteger := Tercero;
  end;
end;

procedure TDMAcreedores.QMAcreedoresBeforeEdit(DataSet: TDataSet);
begin
  cuentaold := QMAcreedoresCUENTA.AsString;
end;

procedure TDMAcreedores.QMAcreedoresMONEDAChange(Sender: TField);
begin
  with xMoneda do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAcreedores.QMAcreedoresCUENTA_GASTOSChange(Sender: TField);
begin
  xCuentas.Close;
  xCuentas.Open;
end;

procedure TDMAcreedores.QMAcreedoresCUENTA_DTOPPChange(Sender: TField);
begin
  xCuentaDto.Close;
  xCuentaDto.Open;
end;

function TDMAcreedores.HayDetalle: boolean;
begin
  Result := (xIncidencias.FieldByName('INCIDENCIA').AsInteger <> 0);
end;

procedure TDMAcreedores.CargaEstadisticas(Ejercicio, Ejercicio2: integer; Moneda: string; Porcentaje: double; Tipo: string);
var
  ExisteMultiSeleccionMarcada : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := 'SELECT FIRST 1 ENTRADA FROM TMP_MULTISELECCION WHERE ENTRADA = :ENTRADA AND MARCADO = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        ExisteMultiSeleccionMarcada := (FieldByName['ENTRADA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (not ExisteMultiSeleccionMarcada) then
     PreparaMultiSeleccion;

  if (TEstadistica.InTransaction) then
     TEstadistica.Commit;

  TEstadistica.StartTransaction;

  with xFacturasMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasMensualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_1 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 1;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_2 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_3 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 3;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xPrevisionMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xPrevisionAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;
end;

procedure TDMAcreedores.CierraDocumentos;
begin
  xDocumentos.Close;
  xFactPend.Close;
end;

procedure TDMAcreedores.CierraEstadisticas;
begin
  xFacturasMensual.Close;
  xFacturasMensualCompara.Close;
  xFacturasAnual.Close;
  xFacturasAnualCompara.Close;
  xPrevisionMensual.Close;
  xPrevisionAnual.Close;
  xFacturasAnualC_1.Close;
  xFacturasAnualC_2.Close;
  xFacturasAnualC_3.Close;

  if (TEstadistica.InTransaction) then
     TEstadistica.Commit;
end;

procedure TDMAcreedores.MuestraDocumentos;
begin
  PreparaMultiSeleccion;

  xDocumentos.Open;
  xFactPend.Open;
end;

function TDMAcreedores.DameAcreedor: integer;
begin
  Result := QMAcreedoresACREEDOR.AsInteger;
end;

function TDMAcreedores.DameCuenta: string;
begin
  Result := QMAcreedoresCUENTA.AsString;
end;

procedure TDMAcreedores.PreparaMultiSeleccion;
begin
  /// Rellena multiseleccion de canal y marca el canal en el que estamos

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_MULTISELECCION(:ENTRADA, :EMPRESA, :EJERCICIO, :MODO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['MODO'].AsInteger := 0; // Rellena Multi Canal
        ExecQuery;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_MULTISELECCION ');
        SQL.Add(' SET ');
        SQL.Add(' MARCADO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
     finally
        Free;
     end;
  end;
end;

procedure TDMAcreedores.QMAcreedoresBeforeClose(DataSet: TDataSet);
begin
  xTerceros.Close;
  xTipos.Close;
  xIvaModos.Close;
  xIRPF.Close;
  xCuentas.Close;
  xMoneda.Close;
  xCuentaDto.Close;
  xIncidencias.Close;
  xFormasPago.Close;
  xTipoTrans.Close;
  xPais.Close;
  xTarifaPortes.Close;
  xTipoGiro.Close;
  xAvisos.Close;
end;

procedure TDMAcreedores.xCuentasBeforeOpen(DataSet: TDataSet);
begin
  xCuentas.Params.ByName['PGC'].AsInteger := REntorno.Pgc;
end;

procedure TDMAcreedores.xComunicacionesNewRecord(DataSet: TDataSet);
begin
  xComunicacionesEMPRESA.AsInteger := QMAcreedoresEMPRESA.AsInteger;
  xComunicacionesTIPO.AsString := 'ACR';
  xComunicacionesCOD_CLI_PRO.AsInteger := QMAcreedoresACREEDOR.AsInteger;
  xComunicacionesDESCRIPCION.AsString := '';
  xComunicacionesFECHA_CREACION.AsDateTime := Now;
  xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
end;

procedure TDMAcreedores.xComunicacionesBeforePost(DataSet: TDataSet);
var
  DirectorioPlantilla, Directorio : string;
  Fichero, Extension : string;
  Contador : integer;
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CONTA_COMUNICACIONES', 'ID');

     {Fichero := DirInicial \ Empresa \ Tipo \ Cliente \ archivo[-nnn].doc}
     DirectorioPlantilla := DMMain.DameDirectorioComunicaciones('ACR');
     Directorio := DMMain.DameDirectorioCodCliPro('ACR', xComunicacionesCOD_CLI_PRO.AsInteger);
     Extension := ExtractFileExt(PlantillaComunicaciones);
     if (Extension = '') then
        Extension := '.doc';

     {Si archivo es vacio, creo un nombre segun la fecha}
     if (Trim(xComunicacionesARCHIVO.AsString) = '') then
     begin
        Contador := 0;

        Fichero := FormatDateTime('yyyymmdd', Now);
        {Si ya existe le agrego un numero de orden}
        if FileExists(Directorio + Fichero + '-' + Ajusta(IntToStr(Contador), 'I', 3, '0') + Extension) then
        begin
           while FileExists(Directorio + Fichero + '-' + Ajusta(IntToStr(Contador), 'I', 3, '0') + Extension) do
              Inc(Contador);
        end;
        xComunicacionesARCHIVO.AsString := Fichero + '-' + Ajusta(IntToStr(Contador), 'I', 3, '0') + Extension;
     end
     else
     begin
        {Verifico que tenga extensión}
        xComunicacionesARCHIVO.AsString := Trim(xComunicacionesARCHIVO.AsString);
        if (UpperCase(Copy(xComunicacionesARCHIVO.AsString, Length(xComunicacionesARCHIVO.AsString) - 3, 4)) <> UpperCase(Extension)) then
           xComunicacionesARCHIVO.AsString := xComunicacionesARCHIVO.AsString + Extension;
     end;

     CopyFileTo(DirectorioPlantilla + PlantillaComunicaciones, Directorio + xComunicacionesARCHIVO.AsString);

     DMMain.AbrirArchivo(Directorio + xComunicacionesARCHIVO.AsString);
     // ShellExecute(FMain.Handle, 'open', PChar(Directorio + xComunicacionesARCHIVO.AsString), nil, nil, SW_SHOW);
     {AbreWord(Directorio+xComunicacionesARCHIVO.AsString);}

     PlantillaComunicaciones := '';
  end;
end;

procedure TDMAcreedores.QMAcreedoresINTRA_TRANSChange(Sender: TField);
begin
  with xTipoTrans do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAcreedores.QMAcreedoresPAIS_C2Change(Sender: TField);
begin
  with xPais do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAcreedores.xTarifaPortesNewRecord(DataSet: TDataSet);
begin
  xTarifaPortesEMPRESA.AsInteger := QMAcreedoresEMPRESA.AsInteger;
  xTarifaPortesEJERCICIO.AsInteger := QMAcreedoresEJERCICIO.AsInteger;
  xTarifaPortesCANAL.AsInteger := QMAcreedoresCANAL.AsInteger;
  xTarifaPortesACREEDOR.AsInteger := QMAcreedoresACREEDOR.AsInteger;
  xTarifaPortesZONA.AsString := '';
  xTarifaPortesPAIS.AsString := REntorno.Pais;
end;

procedure TDMAcreedores.FiltraCompras(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; SoloFacturasAbiertas: boolean);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');
  if (LeeParametro('BUSASTR002') = 'S') then
     Descripcion := StringReplace(Descripcion, ' ', '%', [rfReplaceAll]);

  with xCompras do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DOCUMENTOS_ACREEDOR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' ACREEDOR = :ACREEDOR AND ');
     SelectSQL.Add(' TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND TIPO = :DOCTIPO ');
     if SoloFacturasAbiertas then
        SelectSQL.Add(' AND ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY FECHA DESC ');

     Params.ByName['EMPRESA'].AsInteger := QMAcreedoresEMPRESA.AsInteger;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMAcreedoresTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMAcreedoresEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMAcreedoresCANAL.AsInteger;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
     if (Serie <> ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     Open;
  end;

  with xComprasDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DOCUMENTOS_ACREEDOR_DET ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' ACREEDOR = :ACREEDOR AND ');
     SelectSQL.Add(' TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND TIPO = :DOCTIPO ');
     if (Articulo <> '') then
        SelectSQL.Add(' AND ARTICULO = :ARTICULO ');
     if (Descripcion <> '') then
        SelectSQL.Add(' AND UPPER(TITULO) LIKE UPPER(:DESCRIPCION) ');
     if SoloFacturasAbiertas then
        SelectSQL.Add(' AND ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY FECHA DESC ');

     Params.ByName['EMPRESA'].AsInteger := QMAcreedoresEMPRESA.AsInteger;
     Params.ByName['ACREEDOR'].AsInteger := QMAcreedoresACREEDOR.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMAcreedoresTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMAcreedoresEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMAcreedoresCANAL.AsInteger;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
     if (Serie <> ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     if (Articulo <> '') then
        Params.ByName['ARTICULO'].AsString := Articulo;
     if (Descripcion <> '') then
        Params.ByName['DESCRIPCION'].AsString := '%' + Descripcion + '%';

     Open;
  end;
end;

procedure TDMAcreedores.xTipoGiroNewRecord(DataSet: TDataSet);
begin
  xTipoGiroEMPRESA.AsInteger := QMAcreedoresEMPRESA.AsInteger;
  xTipoGiroACREEDOR.AsInteger := QMAcreedoresACREEDOR.AsInteger;
end;

procedure TDMAcreedores.xTipoGiroAfterPost(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', xTipoGiroCODIGO_GIRO.AsInteger);
end;

procedure TDMAcreedores.xTipoGiroBeforeDelete(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', 0);
end;

procedure TDMAcreedores.xAvisosBeforePost(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'ACR';
  xAvisosID_OBJETO.AsInteger := QMAcreedoresID_ACREEDOR.AsInteger;
end;

procedure TDMAcreedores.xAvisosNewRecord(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'ACR';
  xAvisosID_OBJETO.AsInteger := QMAcreedoresID_ACREEDOR.AsInteger;
  xAvisosACTIVO_FCR.AsInteger := 1;
end;

procedure TDMAcreedores.FiltraAcreedor(Acreedor: integer);
begin
  with QMAcreedores do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     if (Acreedor <> 0) then
        SelectSQL.Add(format(' AND ACREEDOR = %d', [Acreedor]));
     SelectSQL.Add(' ORDER BY ACREEDOR ');
     DMMain.FiltraTabla(QMAcreedores, '11100');
  end;
end;

procedure TDMAcreedores.QuitaFiltros;
begin
  with QMAcreedores do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     SelectSQL.Add(' ORDER BY ACREEDOR ');
     DMMain.FiltraTabla(QMAcreedores, '11100');
  end;
end;

procedure TDMAcreedores.ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo, MuestraCuerpo: boolean);
var
  CuerpoMail : TStrings;
  Archivo : string;
  FDesde, FHasta : TDateTime;
begin

  Archivo := format(_('CircularizacionAcreedor_%d.pdf'), [QMAcreedoresACREEDOR.AsInteger]);
  DameMinMax('EJE', FDesde, FHasta);
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  DMLstCircularizacion.MostrarListadoAcreedor(Modo, QMAcreedoresACREEDOR.AsInteger, FDesde, FHasta, Archivo);
  CierraData(DMLstCircularizacion);

  // Modo 2 es para enviar por email. Genera un PDF y lo deja en %TEMP%
  if (Modo = 2) then
  begin
     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('Y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('Correspondiente al documento: ' + _('Circularizacion'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Circularizacion'));

        if MedianteClienteCorreo then
           DMListados.SendMailTerceroPDF2(QMAcreedores.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMAcreedores.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMAcreedores.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMAcreedores.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;


end.
