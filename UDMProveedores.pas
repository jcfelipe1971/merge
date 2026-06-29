unit UDMProveedores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, StdCtrls, FIBQuery, FIBDatabase,
  UFIBModificados, FIBDataSetRO, HYFIBQuery, FIBDataSetRW, FR_DSet,
  FR_DBSet, FR_Class, idGlobalProtocols, ShellApi, FIBTableDataSetRO;

type
  TDMProveedores = class(TDataModule)
     QMProveedores: TFIBTableSet;
     DSProveedores: TDataSource;
     DSxFormasPago: TDataSource;
     QMProveedoresEMPRESA: TIntegerField;
     QMProveedoresEJERCICIO: TIntegerField;
     QMProveedoresCANAL: TIntegerField;
     QMProveedoresPROVEEDOR: TIntegerField;
     QMProveedoresTERCERO: TIntegerField;
     QMProveedoresDESCUENTO: TFloatField;
     QMProveedoresFORMA_PAGO: TFIBStringField;
     QMProveedoresDIA_PAGO_1: TIntegerField;
     QMProveedoresDIA_PAGO_2: TIntegerField;
     QMProveedoresDESCUENTO_PP: TFloatField;
     QMProveedoresNOTAS: TBlobField;
     QMProveedoresCUENTA: TFIBStringField;
     QMProveedoresTITULO: TFIBStringField;
     DSIvaModos: TDataSource;
     QMProveedoresMODO_IVA: TIntegerField;
     DSIRPF: TDataSource;
     QMProveedoresTIPO_IRPF: TIntegerField;
     QMProveedoresPAIS: TFIBStringField;
     DSxTipoTercero: TDataSource;
     DSxTipo_T: TDataSource;
     QMProveedoresTIPO: TIntegerField;
     TLocal: THYTransaction;
     QMProveedoresPORTES: TIntegerField;
     QMRappel: TFIBTableSet;
     DSQMRappel: TDataSource;
     QMRappelEMPRESA: TIntegerField;
     QMRappelEJERCICIO: TIntegerField;
     QMRappelCANAL: TIntegerField;
     QMRappelPROVEEDOR: TIntegerField;
     QMRappelIMPORTE: TFloatField;
     QMRappelRAPPEL: TFloatField;
     SPCalculaRappelanual: THYFIBQuery;
     QMProveedoresNOMBRE_R_SOCIAL: TFIBStringField;
     QMProveedoresMONEDA: TFIBStringField;
     QMProveedoresUSAR_ANTICIPOS: TIntegerField;
     xFormasPago: TFIBDataSetRO;
     xIvaModos: TFIBDataSetRO;
     xIRPF: TFIBDataSetRO;
     xIRPFTITULO: TFIBStringField;
     xIRPFP_IRPF: TFloatField;
     xTipoTercero: TFIBDataSetRO;
     xTipo_T: TFIBDataSetRO;
     QMProveedoresEVAL_FEB: TIntegerField;
     QMProveedoresEVAL_FEB_SI: TIntegerField;
     xMoneda: TFIBDataSetRO;
     xMonedaMONEDA: TFIBStringField;
     xMonedaTITULO: TFIBStringField;
     xMonedaSIGNO_MONEDA: TFIBStringField;
     xMonedaDEC_VER: TIntegerField;
     xMonedaDEC_CALCULOS: TIntegerField;
     xMonedaDEFECTO: TIntegerField;
     DSxMoneda: TDataSource;
     QMProveedoresISO9000: TIntegerField;
     QMProveedoresFECHA_ISO9000: TDateTimeField;
     QMProveedoresFINANCIACION: TIntegerField;
     QMProveedoresPOR_FINANCIACION: TFloatField;
     xAgrupDisp: TFIBDataSetRO;
     DSxAgrupDisp: TDataSource;
     xAgrupSon: TFIBDataSetRO;
     DSxAgrupSon: TDataSource;
     QMProveedoresFACTURAR_SERIE: TIntegerField;
     QMProveedoresSERIE_A_FACTURAR: TFIBStringField;
     QMProveedoresFACTURAR_ALMACEN: TIntegerField;
     QMProveedoresINTRA: TIntegerField;
     QMProveedoresINTRA_TRANS: TIntegerField;
     xTipoTrans: TFIBDataSetRO;
     DSxTipoTrans: TDataSource;
     xTipoTransTIPO: TIntegerField;
     xTipoTransTITULO: TFIBStringField;
     xPais: TFIBDataSetRO;
     DSxPais: TDataSource;
     xPaisPAIS: TFIBStringField;
     xPaisTITULO: TFIBStringField;
     xPaisPAIS_C2: TFIBStringField;
     xPaisPAIS_N3: TFIBStringField;
     xPaisCODIGO_TEL: TFIBStringField;
     xPaisIDIOMA: TFIBStringField;
     QMProveedoresPAIS_C2: TFIBStringField;
     QMProveedoresDIAS_ENTREGA: TIntegerField;
     QMProveedoresTIT_LOCALIDAD: TFIBStringField;
     QMProveedoresCODIGO_POSTAL: TFIBStringField;
     QMProveedoresCUENTA_DTOPP: TFIBStringField;
     xCuentas: TFIBDataSetRO;
     DSxCuentas: TDataSource;
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
     QMProveedoresTRANSPORTISTA: TIntegerField;
     QMProveedoresTRANSPORTISTA_RAPIDO: TIntegerField;
     QMProveedoresDIAS_TRANSPORTE: TIntegerField;
     QMProveedoresDIAS_TRANSPORTE_RAPIDO: TIntegerField;
     QMProveedoresDIAS_CONFIRM_TRANSPORTE: TIntegerField;
     QMProveedoresTIPO_PORTES: TIntegerField;
     QMProveedoresPOR_PORTES: TFloatField;
     QMProveedoresI_PORTES: TFloatField;
     xPortes: TFIBDataSetRO;
     xPortesTITULO: TFIBStringField;
     DSxPortes: TDataSource;
     xRangos: TFIBDataSetRO;
     xRangosTITULO: TFIBStringField;
     DSxRangos: TDataSource;
     xIndices: TFIBDataSetRO;
     xIndicesTITULO: TFIBStringField;
     DSxIndices: TDataSource;
     QMProveedoresDISTINGUE_REFERENCIA: TIntegerField;
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
     xFacPend: TFIBDataSetRO;
     xFacPendN_PAGADO: TIntegerField;
     xFacPendT_PAGADO: TFloatField;
     xFacPendN_IMPAGADO: TIntegerField;
     xFacPendT_IMPAGADO: TFloatField;
     xFacPendN_PEND_COBRAR: TIntegerField;
     xFacPendT_PEND_COBRAR: TFloatField;
     xFacPendN_PEND_RECIBIR: TIntegerField;
     xFacPendT_PEND_RECIBIR: TFloatField;
     xFacPendMEDIA_DIAS_PAGO: TIntegerField;
     xFacPendMEDIA_DIAS_REC: TIntegerField;
     DSxFactPend: TDataSource;
     DSxDocumentos: TDataSource;
     xDocumentos: TFIBDataSetRO;
     xDocumentosT_PAGADO: TFloatField;
     xDocumentosN_PEND_COBRAR: TIntegerField;
     xDocumentosT_PEND_COBRAR: TFloatField;
     xDocumentosN_PEND_RECIBIR: TIntegerField;
     xDocumentosT_PEND_RECIBIR: TFloatField;
     xDocumentosCUENTA_PEND: TFIBStringField;
     xDocumentosCUENTA_ANTICIPO: TFIBStringField;
     xDocumentosN_PED_PEND: TIntegerField;
     xDocumentosB_PED_PEND: TFloatField;
     xDocumentosT_PED_PEND: TFloatField;
     xDocumentosN_ALB_PEND: TIntegerField;
     xDocumentosB_ALB_PEND: TFloatField;
     xDocumentosT_ALB_PEND: TFloatField;
     xDocumentosN_FAC_PEND: TIntegerField;
     xDocumentosB_FAC_PEND: TFloatField;
     xDocumentosT_FAC_PEND: TFloatField;
     xFacturasMensualPROVEEDOR: TIntegerField;
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
     xFacturasMensualComparaPROVEEDOR: TIntegerField;
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
     DSQMDescuentosKri: TDataSource;
     QMDescuentosKri: TFIBTableSet;
     QMDescuentosKriID: TIntegerField;
     QMDescuentosKriEMPRESA: TIntegerField;
     QMDescuentosKriEJERCICIO: TIntegerField;
     QMDescuentosKriCANAL: TIntegerField;
     QMDescuentosKriPROVEEDOR: TIntegerField;
     QMDescuentosKriDTO_CIAL: TFloatField;
     QMDescuentosKriIMPORTE: TFloatField;
     QMDescuentosKriACTIVO: TIntegerField;
     QMDescuentosKriAPLICA_PEP: TIntegerField;
     QMDescuentosKriAPLICA_ALP: TIntegerField;
     QMDescuentosKriAPLICA_FAP: TIntegerField;
     xIsoPro: TFIBDataSetRO;
     xIsoProEMPRESA: TIntegerField;
     xIsoProRIC: TIntegerField;
     xIsoProTIPO: TFIBStringField;
     xIsoProCLI_PRO_INTE: TIntegerField;
     xIsoProSITUACION: TFIBStringField;
     xIsoProSERIE_DOC: TFIBStringField;
     xIsoProNUM_DOC: TIntegerField;
     xIsoProDESCRIPCION: TFIBStringField;
     xIsoProFECHA_INC: TDateTimeField;
     xIsoProRESPONSABLE: TIntegerField;
     xIsoProPOR_CLASIFICA: TIntegerField;
     xIsoProESTADO: TIntegerField;
     xIsoProNOTAS: TBlobField;
     xIsoProTIRAR: TIntegerField;
     xIsoProRECUPERAR_ISO: TIntegerField;
     xIsoProDEVOLVER: TIntegerField;
     xIsoProACEPTAR: TIntegerField;
     xIsoProOTROS: TIntegerField;
     xIsoProVBCALIDAD: TIntegerField;
     xIsoProVBRESDEPARTAMENTO: TIntegerField;
     xIsoProCANTIDAD: TIntegerField;
     xIsoProFECHA_CIERRE: TDateTimeField;
     xIsoProNDEVOLUCION: TIntegerField;
     xIsoProCONTADOR: TFIBStringField;
     xIsoProDEPARTAMENTO: TFIBStringField;
     xIsoProEVIDENCIA: TFIBStringField;
     xIsoProNDOCCLI: TIntegerField;
     xIsoProREFERENCIACLI: TFIBStringField;
     xIsoProNOTAS_INC: TMemoField;
     xIsoProCOSTE_TOTAL: TFloatField;
     xIsoProLINEA: TIntegerField;
     xIsoProEJERCICIO: TIntegerField;
     xIsoProCLIPRO: TIntegerField;
     xIsoProCANAL: TIntegerField;
     xIsoProCOSTE_INC: TFloatField;
     DSxIsoPro: TDataSource;
     QMProveedoresBLOQUEO: TIntegerField;
     QMProveedoresMOTIVO_BLOQUEO: TFIBStringField;
     QMProveedoresCODIGO_INCOTERM: TFIBStringField;
     QMProveedoresBAJA: TIntegerField;
     QMProveedoresFECHA_BAJA: TDateTimeField;
     QMProveedoresMOTIVO_BAJA: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     QMProveedoresTIPO_NCF: TIntegerField;
     QMProveedoresIDIOMA: TFIBStringField;
     QMProveedoresRECC: TIntegerField;
     QMProveedoresBANCO_PAGOS: TIntegerField;
     DSQMPrestaShop: TDataSource;
     QMPrestaShop: TFIBTableSet;
     QMPrestaShopID_CONFIGURACION: TIntegerField;
     QMPrestaShopID_PROVEEDOR: TIntegerField;
     QMPrestaShopID_SUPPLIER: TIntegerField;
     QMPrestaShopULT_SINCRONIZACION: TDateTimeField;
     QMProveedoresPEDIDO_VALORADO: TIntegerField;
     QMProveedoresALBARAN_VALORADO: TIntegerField;
     QMProveedoresGRUPO_CUENTAS: TIntegerField;
     DSxCompras: TDataSource;
     xCompras: TFIBTableSetRO;
     DSxComprasDetalle: TDataSource;
     xComprasDetalle: TFIBTableSetRO;
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
     xComprasPROVEEDOR: TIntegerField;
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
     xComprasDetallePROVEEDOR: TIntegerField;
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
     xComprasDetalleCODIGO_PROVEEDOR: TFIBStringField;
     QMProveedoresCUENTA_IRPF: TFIBStringField;
     QMProveedoresNIF: TFIBStringField;
     xTipoGiro: TFIBTableSet;
     xTipoGiroEMPRESA: TIntegerField;
     xTipoGiroPROVEEDOR: TIntegerField;
     xTipoGiroCODIGO_GIRO: TIntegerField;
     xTipoGiroDEFECTO: TIntegerField;
     xTipoGiroTITULO: TFIBStringField;
     DSxTipoGiro: TDataSource;
     xComprasNUM_DOCUMENTO: TFIBStringField;
     QMProveedoresIMPORTE_MINIMO_PORTE: TFloatField;
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
     QMProveedoresID_PROVEEDOR: TIntegerField;
     QMProveedoresDIA_PAGO_3: TIntegerField;
     TEstadistica: THYTransaction;
     QMProveedoresFECHA_ALTA: TDateTimeField;
     QMProveedoresCUENTA_GASTOS: TFIBStringField;
     QMProArt: TFIBTableSet;
     DSQMProArt: TDataSource;
     QMProArtEMPRESA: TIntegerField;
     QMProArtARTICULO: TFIBStringField;
     QMProArtPROVEEDOR: TIntegerField;
     QMProArtCODIGO_PROVEEDOR: TFIBStringField;
     QMProArtNOMBRE_PROVEEDOR: TFIBStringField;
     QMProArtID_A: TIntegerField;
     QMProArtTITULO_ART: TFIBStringField;
     xComprasDetalleUNIDADES_POR_SERVIR: TFloatField;
     QMProveedoresALFA_1: TStringField;
     QMProveedoresALFA_2: TStringField;
     QMProveedoresALFA_3: TStringField;
     QMProveedoresALFA_4: TStringField;
     QMProveedoresALFA_5: TStringField;
     QMProveedoresALFA_6: TStringField;
     QMProveedoresALFA_7: TStringField;
     QMProveedoresALFA_8: TStringField;
     QMProveedoresTITULO_REGION: TFIBStringField;
     QMProveedoresTITULO_PROVINCIA: TFIBStringField;
     QMProveedoresTITULO_POBLACION: TFIBStringField;
     QMProveedoresTITULO_CODIGO_POSTAL: TFIBStringField;
     QMProveedoresPROYECTO: TIntegerField;
     QMProveedoresFACTORING: TIntegerField;
     procedure DMProveedoresCreate(Sender: TObject);
     procedure QMProveedoresBeforePost(DataSet: TDataSet);
     procedure QMProveedoresNewRecord(DataSet: TDataSet);
     procedure QMProveedoresTERCEROChange(Sender: TField);
     procedure QMProveedoresAfterOpen(DataSet: TDataSet);
     procedure QMProveedoresTIPO_IRPFChange(Sender: TField);
     procedure QMProveedoresBeforeEdit(DataSet: TDataSet);
     procedure QMProveedoresTIPOChange(Sender: TField);
     procedure QMProveedoresPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure DMProveedoresDestroy(Sender: TObject);
     procedure QMRappelNewRecord(DataSet: TDataSet);
     procedure QMProveedoresMODO_IVAChange(Sender: TField);
     procedure QMProveedoresFORMA_PAGOChange(Sender: TField);
     procedure QMProveedoresMONEDAChange(Sender: TField);
     procedure QMProveedoresISO9000Change(Sender: TField);
     procedure QMProveedoresINTRA_TRANSChange(Sender: TField);
     procedure QMProveedoresPAIS_C2Change(Sender: TField);
     procedure QMProveedoresCUENTA_DTOPPChange(Sender: TField);
     procedure QMProveedoresTIPO_PORTESChange(Sender: TField);
     procedure QMProveedoresBeforeClose(DataSet: TDataSet);
     procedure xCuentasBeforeOpen(DataSet: TDataSet);
     procedure xComunicacionesBeforePost(DataSet: TDataSet);
     procedure xComunicacionesNewRecord(DataSet: TDataSet);
     procedure QMDescuentosKriBeforePost(DataSet: TDataSet);
     procedure QMDescuentosKriNewRecord(DataSet: TDataSet);
     procedure QMProveedoresAfterScroll(DataSet: TDataSet);
     procedure QMProveedoresAfterEdit(DataSet: TDataSet);
     procedure QMProveedoresAfterCancel(DataSet: TDataSet);
     procedure xTipoGiroAfterPost(DataSet: TDataSet);
     procedure xTipoGiroAfterDelete(DataSet: TDataSet);
     procedure xTipoGiroNewRecord(DataSet: TDataSet);
     procedure xAvisosBeforePost(DataSet: TDataSet);
     procedure xAvisosNewRecord(DataSet: TDataSet);
     procedure QMProArtBeforePost(DataSet: TDataSet);
     procedure QMProArtNewRecord(DataSet: TDataSet);
     procedure QMProArtARTICULOChange(Sender: TField);
  private
     { Private declarations }
     cambiar: boolean;
     cuentaold: string;
     IDTiendaPrestashop: integer;
     procedure PreparaMultiSeleccion;
  public
     SQLBase: TStrings;
     PlantillaComunicaciones: string;
     procedure CambiarTercero(Tercero: integer);
     //procedure Busca( Texto : String );
     procedure AgrupacionRellena;
     procedure AgrupacionVacia;
     function BusquedaCompleja: integer;
     procedure DameRappel(var rappel: double);
     function Tercero: integer;
     function HayDetalle(tipo: integer): boolean;
     procedure MuestraDocumentos;
     procedure CierraDocumentos;
     function DameProveedor: integer;
     function DameCuenta: string;
     procedure CargaEstadisticas(Ejercicio, Ejercicio2: integer; Moneda: string; Porcentaje: double; Tipo: string);
     procedure CierraEstadisticas;
     procedure FiltraCompras(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; PedidosPendientes: boolean);
     procedure QuitaFiltros;
     procedure FiltraProveedor(Proveedor: integer);
     procedure CerrarArticulos;
     procedure AbrirArticulos;
     procedure ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
     procedure FiltraAgrupacionDisponible(Filtro: string);
  end;

var
  DMProveedores : TDMProveedores;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, uFBusca, UDMLSTProveedor, UFormGest,
  UFPregEtiCliente, UFMain, UFMTerceros, UFMProveedores, Clipbrd, UParam,
  UDMLstCircularizacion, UDMListados;

{$R *.DFM}

procedure TDMProveedores.DMProveedoresCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AsignaDisplayFormat(QMProveedores, MascaraN, MascaraI, ShortDateFormat);
  QMProveedoresDESCUENTO_PP.DisplayFormat := MascaraP;
  QMProveedoresDESCUENTO.DisplayFormat := MascaraP;
  QMProveedoresPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMProveedoresPOR_PORTES.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMRappel, MascaraN, MascaraI, ShortDateFormat);
  QMRappelRAPPEL.DisplayFormat := MascaraP;

  xIRPFP_IRPF.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMDescuentosKri, MascaraN, MascaraI, ShortDateFormat);
  QMDescuentosKriDTO_CIAL.DisplayFormat := MascaraP;

  AsignaDisplayFormat(xFacPend, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDocumentos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasMensual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasMensualCompara, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPrevisionMensual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasAnualCompara, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasAnual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPrevisionAnual, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xCompras, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xComprasDetalle, MascaraN, MascaraI, ShortDateFormat);

  // Estos importes deben ir con formato DECIMALES_CALCULO de la moneda
  xComprasDetalleP_COSTE.DisplayFormat := MascaraL;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMProveedores.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('PRODESC%3.3d', [i]));

  // Creamos la sentencia SQL básica para QMProveedores
  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_PROVEEDORES_CUENTAS ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add('   EMPRESA = ?EMPRESA AND ');
  SQLBase.Add('   EJERCICIO = ?EJERCICIO AND ');
  SQLBase.Add('   CANAL = ?CANAL ');

  QMProveedores.SelectSQL.Text := SQLBase.Text;
  QMProveedores.SelectSQL.Add(' ORDER BY PROVEEDOR ');

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  {Latino}
  if (DMMain.EstadoKri(410) = 1) then
     xTipoNCF.Open;

  IDTiendaPrestashop := 0;
  if (LeeParametro('MODSINC003') = 'S') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM SYS_CONF_PRESTASHOP WHERE EMPRESA = :EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           IDTiendaPrestashop := FieldByName['ID'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMPrestaShop.Params.ByName['ID_CONFIGURACION'].AsInteger := IDTiendaPrestashop;
  end;

  if not (FMain.autproveedor) then
     DMMain.FiltraTabla(QMProveedores, '11100', REntorno.DatosAbiertos);
  cambiar := False;
end;

procedure TDMProveedores.DMProveedoresDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMProveedores.QMProveedoresBeforePost(DataSet: TDataSet);
var
  Semilla, Cuenta : string;
  Tipo : integer;
  Existe : boolean;
  Crea : boolean;
begin
  Tipo := QMProveedoresTIPO.AsInteger;
  Semilla := DMMain.DameSemillaCuentaGestion(SemProveedores, tipo);
  Cuenta := QMProveedoresCUENTA.AsString;
  if (DataSet.State = dsInsert) then
     QMProveedoresPROVEEDOR.AsInteger := DMMain.Contador_Libre('XPR',
        QMProveedoresPROVEEDOR.AsInteger);

  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
  begin
     // Si en cuenta estan los primeros digitos de la cuenta, los utilizo como semilla
     if (Length(Cuenta + '.') = Length(Semilla)) then
        Semilla := Cuenta + '.';

     Cuenta := ExpandirCadena(Semilla + QMProveedoresPROVEEDOR.AsString);
     // Si el interfijo es diferente del nro de cliente, utilizo solo los 3 primeros numeros de la semilla
     if (DMMain.EstadoKri(326) = 1) then
     begin
        if (StrToInt(Copy(Cuenta, Length(cuenta) - Length(QMProveedoresPROVEEDOR.AsString) + 1,
           Length(QMProveedoresPROVEEDOR.AsString))) <> QMProveedoresPROVEEDOR.AsInteger) then
           Cuenta := ExpandirCadena(Copy(Semilla, 1, 3) + '.' + QMProveedoresPROVEEDOR.AsString);
     end;
  end;

  if (QMProveedoresCUENTA.AsString <> Cuenta) then
     QMProveedoresCUENTA.AsString := Cuenta;
  cambiar := False;
  if (Length(Cuenta) > REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada excede de la estructura contable actual'));
  if (Length(Cuenta) < REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada tiene menos dígitos que la estructura contable actual'));

  // Control de que la cuenta ya existe
  if (DataSet.State = dsInsert) then
     cuentaold := '';

  if (cuentaold <> QMProveedoresCUENTA.AsString) then
  begin
     Crea := True;
     Existe := (DameTituloCuenta(QMProveedoresCUENTA.AsString) > '');

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
              SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_GES_EXISTE(:EMPRESA, :EJERCICIO, :CANAL, :CUENTA, 1)';
              Params.ByName['EMPRESA'].AsInteger := QMProveedoresEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMProveedoresEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMProveedoresCANAL.AsInteger;
              Params.ByName['CUENTA'].AsString := QMProveedoresCUENTA.AsString;
              ExecQuery;
              Existe := (FieldByName['EXISTE'].AsInteger >= 1);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Existe) then
        begin
           Crea := (Application.MessageBox(PChar(string(_('La cuenta ya esta usada por otro proveedor, ¿quiere realmente crearlo?'))),
              PChar(string(_('Confirmación'))),
              mb_iconstop + mb_yesno) = id_yes);
        end;
     end;

     if not (Crea) then
        raise Exception.Create(_('El Proveedor no ha sido creado'));
  end;
end;

procedure TDMProveedores.QMProveedoresNewRecord(DataSet: TDataSet);
begin
  QMProveedoresEMPRESA.AsInteger := REntorno.Empresa;
  QMProveedoresEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProveedoresCANAL.AsInteger := REntorno.Canal;
  QMProveedoresFORMA_PAGO.AsString := 'CON';
  QMProveedoresMODO_IVA.AsInteger := DMMain.DameModoIVACanal;
  QMProveedoresPAIS.AsString := REntorno.Pais;
  QMProveedoresTIPO_IRPF.AsInteger := DMMain.DameMinIRPF;
  QMProveedoresTIPO.AsInteger := 1;
  QMProveedoresTercero.AsInteger := REntorno.Tercero;
  QMProveedoresPORTES.AsInteger := 0;
  // Rep. Dominicana no utilizará anticipos
  if (REntorno.Pais = 'DOM') then
     QMProveedoresUSAR_ANTICIPOS.AsInteger := 0
  else
     QMProveedoresUSAR_ANTICIPOS.AsInteger := 1;
  QMProveedoresEVAL_FEB.AsInteger := 1; {dji lrk kri}
  QMProveedoresEVAL_FEB_SI.AsInteger := 1; {dji lrk kri}
  QMProveedoresFINANCIACION.AsInteger := 0;
  QMProveedoresMONEDA.AsString := REntorno.Moneda;
  QMProveedoresPOR_FINANCIACION.AsFloat := 0;
  QMProveedoresFecha_ISO9000.AsDateTime := REntorno.FechaTrabSH;
  cambiar := False;
  QMProveedoresFACTURAR_SERIE.AsInteger := 0;
  QMProveedoresSERIE_A_FACTURAR.AsString := REntorno.Serie;
  QMProveedoresFACTURAR_ALMACEN.AsInteger := 0;
  QMProveedoresISO9000.AsInteger := 0;
  QMProveedoresINTRA.AsInteger := 0;
  QMProveedoresINTRA_TRANS.AsInteger := 0;
  //Portes
  QMProveedoresTIPO_PORTES.AsInteger := 0;
  QMProveedoresPOR_PORTES.AsFloat := 0;
  QMProveedoresI_PORTES.AsFloat := 0;
  QMProveedoresCODIGO_INCOTERM.AsString := 'EXW';
  QMProveedoresPAIS_C2.AsString := DamePaisC2(REntorno.Pais);
  QMProveedoresRECC.AsInteger := REntorno.RECC;

  QMProveedoresCUENTA_GASTOS.AsString := '';
  QMProveedoresCUENTA_DTOPP.AsString := DMMain.DameCuentaGestion(14);
  QMProveedoresBANCO_PAGOS.AsInteger := 0;
  QMProveedoresIMPORTE_MINIMO_PORTE.AsInteger := 0;
  QMProveedoresPROYECTO.AsInteger := 0;
  QMProveedoresFACTORING.AsInteger := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 TIPO_NCF FROM Z_SYS_TIPO_NCF WHERE TIPO_DOCUMENTO = 1 AND DEFECTO = 1';
        ExecQuery;
        QMProveedoresTIPO_NCF.AsInteger := FieldByName['TIPO_NCF'].AsInteger;
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
        QMProveedoresIDIOMA.AsString := FieldByName['IDIOMA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMProveedores.QMProveedoresTERCEROChange(Sender: TField);
begin
  QMProveedoresTITULO.AsString := DameTituloTercero(Sender.AsInteger);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P.PAIS_C2 FROM SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON (D.ID_LOCAL = L.ID_LOCAL) ');
        SQL.Add(' JOIN SYS_PAISES P ON (P.PAIS = L.PAIS) ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.TERCERO = ?TERCERO AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['TERCERO'].AsInteger := QMProveedoresTERCERO.AsInteger;
        ExecQuery;
        QMProveedoresPAIS_C2.AsString := FieldByName['PAIS_C2'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMProveedores.QMProveedoresAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraRO(xFormasPago, '11100', True);
  QMRappel.Open;
  xFormasPago.Open;
  xIvaModos.Open;
  xIRPF.Open;
  xMoneda.Open;
  xTipo_T.Open;
  xTipoTercero.Open;
  xAgrupSon.Open;
  xAgrupDisp.Open;
  xTipoTrans.Open;
  xPais.Open;
  xCuentas.Open;
  xIncidencias.Open;
  xPortes.Open;
  QMDescuentosKri.Open;
  xIsoPro.Open;
  xTipoGiro.Open;
  xAvisos.Open;

  if (IDTiendaPrestashop <> 0) then
  begin
     QMPrestaShop.Close;
     QMPrestaShop.Params.ByName['ID_PROVEEDOR'].AsInteger := DameIDProveedor(QMProveedoresPROVEEDOR.AsInteger);
     QMPrestaShop.Open;
  end;
end;

function TDMProveedores.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMProveedores, '11100');
end;

procedure TDMProveedores.QMProveedoresTIPO_IRPFChange(Sender: TField);
begin
  with xIRPF do
  begin
     Close;
     Params.ByName['TIPO_IRPF'].AsInteger := Sender.AsInteger;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDMProveedores.QMProveedoresBeforeEdit(DataSet: TDataSet);
begin
  cambiar := True;
  cuentaold := QMProveedoresCUENTA.AsString;
end;

procedure TDMProveedores.QMProveedoresTIPOChange(Sender: TField);
begin
  with xTipoTercero do
  begin
     Close;
     Params.ByName['TIPO'].AsString := Sender.AsString;
     Open;
  end;
  if cambiar then
     QMProveedoresCUENTA.AsString := '';
end;

procedure TDMProveedores.QMProveedoresPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMProveedores.State = dsInsert then
  begin
     QMProveedoresPROVEEDOR.Clear;
     QMProveedoresCUENTA.Clear;
  end;
end;

procedure TDMProveedores.DameRappel(var rappel: double);
begin
  with SPCalculaRappelAnual do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Proveedor'].AsInteger := QMProveedoresProveedor.AsInteger;
     ExecQuery;
     rappel := FieldByName['Devolucion'].AsFloat;
     FreeHandle;
  end;
end;

procedure TDMProveedores.QMRappelNewRecord(DataSet: TDataSet);
begin
  QMRappelEMPRESA.AsInteger := REntorno.Empresa;
  QMRappelEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMRappelCANAL.AsInteger := REntorno.Canal;
  QMRappelPROVEEDOR.AsInteger := QMProveedoresPROVEEDOR.AsInteger;
end;

function TDMProveedores.Tercero: integer;
begin
  Result := QMProveedoresTERCERO.AsInteger;
end;

procedure TDMProveedores.QMProveedoresMODO_IVAChange(Sender: TField);
begin
  with xIvaModos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMProveedores.QMProveedoresFORMA_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Open;
  end;
end;

procedure TDMProveedores.CambiarTercero(Tercero: integer);
begin
  with QMProveedores do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PROVEEDORES_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' PROVEEDOR < -1 ');
     SelectSQL.Add(' ORDER BY PROVEEDOR ');

     DMMain.FiltraTabla(QMProveedores, '11100', True);

     Insert;
     QMProveedoresTERCERO.AsInteger := Tercero;
  end;
end;

procedure TDMProveedores.QMProveedoresMONEDAChange(Sender: TField);
begin
  with xMoneda do
  begin
     Close;
     Open;
  end;
end;

procedure TDMProveedores.QMProveedoresISO9000Change(Sender: TField);
begin
  if (Sender.AsInteger = 1) then
     QMProveedoresFecha_ISO9000.AsDateTime :=
        REntorno.FechaTrabSH;
end;

procedure TDMProveedores.AgrupacionRellena;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_AGRUPACIONES_RELLENA_PROV(?AGRUPACION, ?EMPRESA, ?PROVEEDOR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
        Params.ByName['AGRUPACION'].AsString := xAgrupDisp.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMProveedores.AgrupacionVacia;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM EMP_AGRUPACIONES_PROV ');
        SQL.Add(' WHERE ');
        SQL.Add(' AGRUPACION = ?AGRUPACION AND ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' PROVEEDOR = ?PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
        Params.ByName['AGRUPACION'].AsString := xAgrupSon.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMProveedores.QMProveedoresINTRA_TRANSChange(Sender: TField);
begin
  with xTipoTrans do
  begin
     Close;
     Open;
  end;
end;

procedure TDMProveedores.QMProveedoresPAIS_C2Change(Sender: TField);
begin
  with xPais do
  begin
     Close;
     Open;
  end;
end;

procedure TDMProveedores.QMProveedoresCUENTA_DTOPPChange(Sender: TField);
begin
  xCuentas.Close;
  xCuentas.Open;
end;

function TDMProveedores.HayDetalle(Tipo: integer): boolean;
begin
  //tipo=1 -> indicencia
  //tipo=2 -> Iso
  Result := False;
  if (Tipo = 1) then
     Result := (xIncidencias.FieldByName('INCIDENCIA').AsInteger <> 0)
  else if (Tipo = 2) then
     Result := (xIsoPro.FieldByName('RIC').AsInteger <> 0);
end;

procedure TDMProveedores.QMProveedoresTIPO_PORTESChange(Sender: TField);
begin
  with xPortes do
  begin
     Close;
     Open;
  end;
end;

procedure TDMProveedores.CargaEstadisticas(Ejercicio, Ejercicio2: integer; Moneda: string; Porcentaje: double; Tipo: string);
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
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
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;
end;

procedure TDMProveedores.CierraDocumentos;
begin
  xDocumentos.Close;
  xFacPend.Close;
end;

procedure TDMProveedores.CierraEstadisticas;
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

procedure TDMProveedores.MuestraDocumentos;
begin
  PreparaMultiSeleccion;

  xDocumentos.Open;
  xFacPend.Open;
end;

function TDMProveedores.DameCuenta: string;
begin
  Result := QMProveedoresCUENTA.AsString;
end;

function TDMProveedores.DameProveedor: integer;
begin
  Result := QMProveedoresPROVEEDOR.AsInteger;
end;

procedure TDMProveedores.QMProveedoresBeforeClose(DataSet: TDataSet);
begin
  xFormasPago.Close;
  QMRappel.Close;
  xFormasPago.Close;
  xIvaModos.Close;
  xIRPF.Close;
  xMoneda.Close;
  xTipo_T.Close;
  xTipoTercero.Close;
  xAgrupSon.Close;
  xAgrupDisp.Close;
  xTipoTrans.Close;
  xPais.Close;
  xCuentas.Close;
  xIncidencias.Close;
  xPortes.Close;
  QMDescuentosKri.Close;
  xIsoPro.Close;
  xTipoGiro.Close;
  xAvisos.Close;

  if (IDTiendaPrestashop <> 0) then
     QMPrestaShop.Close;
end;

procedure TDMProveedores.PreparaMultiSeleccion;
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

procedure TDMProveedores.xCuentasBeforeOpen(DataSet: TDataSet);
begin
  xCuentas.Params.ByName['PGC'].AsInteger := REntorno.Pgc;
end;

procedure TDMProveedores.xComunicacionesNewRecord(DataSet: TDataSet);
begin
  xComunicacionesEMPRESA.AsInteger := QMProveedoresEMPRESA.AsInteger;
  xComunicacionesTIPO.AsString := 'PRO';
  xComunicacionesCOD_CLI_PRO.AsInteger := QMProveedoresPROVEEDOR.AsInteger;
  xComunicacionesDESCRIPCION.AsString := '';
  xComunicacionesFECHA_CREACION.AsDateTime := Now;
  xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
end;

procedure TDMProveedores.xComunicacionesBeforePost(DataSet: TDataSet);
var
  DirectorioPlantilla, Directorio : string;
  Fichero, Extension : string;
  Contador : integer;
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CONTA_COMUNICACIONES', 'ID');

     {Fichero := DirInicial \ Empresa \ Tipo \ Proveedor \ archivo[-nnn].doc}
     DirectorioPlantilla := DMMain.DameDirectorioComunicaciones('PRO');
     Directorio := DMMain.DameDirectorioCodCliPro('PRO', xComunicacionesCOD_CLI_PRO.AsInteger);
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

procedure TDMProveedores.QMDescuentosKriBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (DataSet.State = dsInsert) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
        SQL.Text := 'SELECT MAX(ID) FROM CON_CUENTAS_GES_PRO_DESC_KRI';
        ExecQuery;
        QMDescuentosKriID.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMProveedores.QMDescuentosKriNewRecord(DataSet: TDataSet);
begin
  QMDescuentosKriEMPRESA.AsInteger := QMProveedoresEMPRESA.AsInteger;
  QMDescuentosKriEJERCICIO.AsInteger := QMProveedoresEJERCICIO.AsInteger;
  QMDescuentosKriCANAL.AsInteger := QMProveedoresCANAL.AsInteger;
  QMDescuentosKriPROVEEDOR.AsInteger := QMProveedoresPROVEEDOR.AsInteger;
  QMDescuentosKriACTIVO.AsInteger := 1;
  QMDescuentosKriAPLICA_PEP.AsInteger := 1;
  QMDescuentosKriAPLICA_ALP.AsInteger := 1;
  QMDescuentosKriAPLICA_FAP.AsInteger := 1;
end;

procedure TDMProveedores.QMProveedoresAfterScroll(DataSet: TDataSet);
begin
  if (IDTiendaPrestashop <> 0) then
  begin
     QMPrestaShop.Close;
     QMPrestaShop.Params.ByName['ID_PROVEEDOR'].AsInteger := DameIDProveedor(QMProveedoresPROVEEDOR.AsInteger);
     QMPrestaShop.Open;
  end;
end;

procedure TDMProveedores.QMProveedoresAfterEdit(DataSet: TDataSet);
begin
  {
  if (IDTiendaPrestashop <> 0) then
     QMPrestaShop.Edit;
  }
end;

procedure TDMProveedores.QMProveedoresAfterCancel(DataSet: TDataSet);
begin
  {
  if (IDTiendaPrestashop <> 0) then
     QMPrestaShop.Cancel;
  }
end;

procedure TDMProveedores.FiltraCompras(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; PedidosPendientes: boolean);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');
  if (LeeParametro('BUSASTR002') = 'S') then
     Descripcion := StringReplace(Descripcion, ' ', '%', [rfReplaceAll]);

  with xCompras do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DOCUMENTOS_PROVEEDOR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND TIPO = :DOCTIPO ');
     if PedidosPendientes and (TipoDocumento = 'PEP') then
        SelectSQL.Add(' AND ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY FECHA DESC, RIG ');

     Params.ByName['EMPRESA'].AsInteger := QMProveedoresEMPRESA.AsInteger;
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMProveedoresTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMProveedoresEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMProveedoresCANAL.AsInteger;
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
     SelectSQL.Add(' SELECT * FROM VER_DOCUMENTOS_PROVEEDOR_DET DT ');
     if PedidosPendientes and (TipoDocumento = 'PEP') then
        SelectSQL.Add(' JOIN GES_DETALLES_E_PED PE ON PE.ID_DETALLES_E = DT.ID_DETALLES_E ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DT.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DT.PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' DT.TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND DT.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND DT.SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND DT.TIPO = :DOCTIPO ');
     if (Articulo <> '') then
        SelectSQL.Add(' AND DT.ARTICULO = :ARTICULO ');
     if (Descripcion <> '') then
        SelectSQL.Add(' AND UPPER(DT.TITULO) LIKE UPPER(:DESCRIPCION) ');
     if PedidosPendientes and (TipoDocumento = 'PEP') then
        SelectSQL.Add(' AND DT.ESTADO = 0 AND PE.LINEA_SERVIDA = 0');
     SelectSQL.Add(' ORDER BY DT.FECHA DESC, DT.RIG, DT.ORDEN ');

     Params.ByName['EMPRESA'].AsInteger := QMProveedoresEMPRESA.AsInteger;
     Params.ByName['PROVEEDOR'].AsInteger := QMProveedoresPROVEEDOR.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMProveedoresTERCERO.AsInteger;
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

procedure TDMProveedores.xTipoGiroNewRecord(DataSet: TDataSet);
begin
  xTipoGiroEMPRESA.AsInteger := QMProveedoresEMPRESA.AsInteger;
  xTipoGiroPROVEEDOR.AsInteger := QMProveedoresPROVEEDOR.AsInteger;
end;

procedure TDMProveedores.xTipoGiroAfterPost(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', xTipoGiroCODIGO_GIRO.AsInteger);
end;

procedure TDMProveedores.xTipoGiroAfterDelete(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', 0);
end;

procedure TDMProveedores.xAvisosBeforePost(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'PRO';
  xAvisosID_OBJETO.AsInteger := QMProveedoresID_PROVEEDOR.AsInteger;
end;

procedure TDMProveedores.xAvisosNewRecord(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'PRO';
  xAvisosID_OBJETO.AsInteger := QMProveedoresID_PROVEEDOR.AsInteger;
  xAvisosACTIVO_OFP.AsInteger := 1;
  xAvisosACTIVO_OCP.AsInteger := 1;
  xAvisosACTIVO_PEP.AsInteger := 1;
  xAvisosACTIVO_ALP.AsInteger := 1;
  xAvisosACTIVO_FAP.AsInteger := 1;
end;

procedure TDMProveedores.FiltraProveedor(Proveedor: integer);
begin
  with QMProveedores do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     if (Proveedor <> 0) then
        SelectSQL.Add(format(' AND PROVEEDOR = %d', [Proveedor]));
     SelectSQL.Add(' ORDER BY PROVEEDOR ');
     DMMain.FiltraTabla(QMProveedores, '11100');
  end;
end;

procedure TDMProveedores.QuitaFiltros;
begin
  with QMProveedores do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     SelectSQL.Add(' ORDER BY PROVEEDOR ');
     DMMain.FiltraTabla(QMProveedores, '11100');
  end;
end;

procedure TDMProveedores.CerrarArticulos;
begin
  QMProArt.Close;
end;

procedure TDMProveedores.AbrirArticulos;
begin
  QMProArt.Open;
end;

procedure TDMProveedores.QMProArtBeforePost(DataSet: TDataSet);
begin
  QMProArtCODIGO_PROVEEDOR.AsString := UpperCase(Trim(QMProArtCODIGO_PROVEEDOR.AsString));
end;

procedure TDMProveedores.QMProArtNewRecord(DataSet: TDataSet);
begin
  QMProArtEMPRESA.AsInteger := QMProveedoresEMPRESA.AsInteger;
  QMProArtPROVEEDOR.AsInteger := QMProveedoresPROVEEDOR.AsInteger;
end;

procedure TDMProveedores.QMProArtARTICULOChange(Sender: TField);
begin
  QMProArtTITULO_ART.AsString := DameTituloArticulo(QMProArtARTICULO.AsString);
end;

procedure TDMProveedores.ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo, MuestraCuerpo: boolean);
var
  CuerpoMail : TStrings;
  Archivo : string;
  FDesde, FHasta : TDateTime;
begin

  Archivo := format(_('CircularizacionProveedor_%d.pdf'), [QMProveedoresPROVEEDOR.AsInteger]);
  DameMinMax('EJE', FDesde, FHasta);
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  DMLstCircularizacion.MostrarListadoProveedor(Modo, QMProveedoresPROVEEDOR.AsInteger, FDesde, FHasta, Archivo);
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
           DMListados.SendMailTerceroPDF2(QMProveedores.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMProveedores.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMProveedores.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMProveedores.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TDMProveedores.FiltraAgrupacionDisponible(Filtro: string);
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
     SelectSQL.Add(' TIPO = ''P'' AND ');
     SelectSQL.Add(' AGRUPACION NOT IN (SELECT AGRUPACION ');
     SelectSQL.Add('                    FROM EMP_AGRUPACIONES_PROV ');
     SelectSQL.Add('                    WHERE ');
     SelectSQL.Add('                    EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('                    PROVEEDOR = :PROVEEDOR) ');
     SelectSQL.Add(' ORDER BY AGRUPACION ');
     Open;
  end;
end;

end.
