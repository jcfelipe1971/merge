unit UDMClientes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, StdCtrls,
  FIBDatabase, UFIBModificados, FIBQuery, SysUtils, FIBDataSetRO, HYFIBQuery,
  FIBTableDataSetRO, Dialogs, idGlobalProtocols, ShellApi, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport;

type
  TDMClientes = class(TDataModule)
     QMClientes: TFIBTableSet;
     DSQMClientes: TDataSource;
     DSxIRPF: TDataSource;
     TLocal: THYTransaction;
     DSxAgrupDisp: TDataSource;
     DSxAgrupSon: TDataSource;
     SPRellena: THYFIBQuery;
     SPVacia: THYFIBQuery;
     QMVacaciones: TFIBTableSet;
     DSQMVacaciones: TDataSource;
     QMVacacionesEMPRESA: TIntegerField;
     QMVacacionesCLIENTE: TIntegerField;
     QMVacacionesINICIO_VACACIONES: TDateTimeField;
     QMVacacionesFIN_VACACIONES: TDateTimeField;
     QMVacacionesFECHA_PAGO: TDateTimeField;
     QMVacacionesLINEA: TIntegerField;
     xAgrupDisp: TFIBDataSetRO;
     xAgrupSon: TFIBDataSetRO;
     xIRPF: TFIBDataSetRO;
     xIRPFP_IRPF: TFloatField;
     xIRPFTITULO: TFIBStringField;
     QMClientesEMPRESA: TIntegerField;
     QMClientesEJERCICIO: TIntegerField;
     QMClientesCANAL: TIntegerField;
     QMClientesCLIENTE: TIntegerField;
     QMClientesTERCERO: TIntegerField;
     QMClientesTARIFA: TFIBStringField;
     QMClientesFORMA_PAGO: TFIBStringField;
     QMClientesRIESGO_AUT: TFloatField;
     QMClientesRIESGO_ACT: TFloatField;
     QMClientesMODO_IVA: TIntegerField;
     QMClientesDIA_PAGO_1: TIntegerField;
     QMClientesDIA_PAGO_2: TIntegerField;
     QMClientesDESCUENTO_PP: TFloatField;
     QMClientesDESCUENTO_CIAL: TFloatField;
     QMClientesAGENTE: TIntegerField;
     QMClientesNOTAS: TBlobField;
     QMClientesCUENTA: TFIBStringField;
     QMClientesTITULO: TFIBStringField;
     QMClientesPERFIL: TFIBStringField;
     QMClientesTIPO_IRPF: TIntegerField;
     QMClientesPAIS: TFIBStringField;
     QMClientesTIPO: TIntegerField;
     QMClientesPORTES: TIntegerField;
     QMClientesNOMBRE_COMERCIAL: TFIBStringField;
     QMClientesUSAR_ANTICIPOS: TIntegerField;
     QMClientesSU_PROVEEDOR: TFIBStringField;
     QMClientesEVAL_FEB: TIntegerField;
     QMClientesEVAL_FEB_SI: TIntegerField;
     QMClientesMONEDA: TFIBStringField;
     QMClientesFINANCIACION: TIntegerField;
     QMClientesFACTURAR_AGENTE: TIntegerField;
     QMClientesFACTURAR_TRANSPORTISTA: TIntegerField;
     QMClientesFACTURAR_REFERENCIA: TIntegerField;
     QMClientesFACTURAR_DIRECCION: TIntegerField;
     QMClientesRIESGOVENCIDO: TFloatField;
     QMClientesRIESGO_AUT_CANAL: TFloatField;
     QMClientesRIESGO_ACT_CANAL: TFloatField;
     QMClientesFACTURA_DIRECCION_ADMTVA: TIntegerField;
     QMClientesALBARAN_DIRECCION_ENVIO: TIntegerField;
     QMClientesPOR_FINANCIACION: TFloatField;
     QMClientesNO_ALB_FAC: TIntegerField;
     QMClientesNO_VENTA_RIESGO: TIntegerField;
     xSeries: TFIBQuery;
     QMClientesFACTURAR_SERIE: TIntegerField;
     QMClientesSERIE_A_FACTURAR: TFIBStringField;
     QMClientesTRANSPORTISTA: TIntegerField;
     DSxVentas: TDataSource;
     xVentas: TFIBTableSetRO;
     xVentasEMPRESA: TIntegerField;
     xVentasEJERCICIO: TIntegerField;
     xVentasCANAL: TIntegerField;
     xVentasSERIE: TFIBStringField;
     xVentasTIPO: TFIBStringField;
     xVentasRIG: TIntegerField;
     xVentasALMACEN: TFIBStringField;
     xVentasMONEDA: TFIBStringField;
     xVentasFECHA: TDateTimeField;
     xVentasCLIENTE: TIntegerField;
     xVentasTERCERO: TIntegerField;
     xVentasDIRECCION: TIntegerField;
     xVentasSU_REFERENCIA: TFIBStringField;
     xVentasFORMA_PAGO: TFIBStringField;
     xVentasCAMPANYA: TIntegerField;
     xVentasNOTAS: TBlobField;
     xVentasESTADO: TIntegerField;
     xVentasBULTOS: TIntegerField;
     xVentasLINEAS: TIntegerField;
     xVentasBRUTO: TFloatField;
     xVentasI_DTO_LINEAS: TFloatField;
     xVentasS_BASES: TFloatField;
     xVentasM_BRUTO: TFloatField;
     xVentasC_TOTAL: TFloatField;
     xVentasAGENTE: TIntegerField;
     xVentasS_CUOTA_IVA: TFloatField;
     xVentasS_CUOTA_RE: TFloatField;
     xVentasB_DTO_LINEAS: TFloatField;
     xVentasDTO_PP: TFloatField;
     xVentasDTO_CIAL: TFloatField;
     xVentasB_COMISION: TFloatField;
     xVentasI_COMISION: TFloatField;
     xVentasPOR_FINANCIACION: TFloatField;
     xVentasI_FINANCIACION: TFloatField;
     xVentasLIQUIDO: TFloatField;
     xVentasENTRADA: TIntegerField;
     xVentasPROCESO_AUTO: TIntegerField;
     xVentasI_DTO_PP: TFloatField;
     xVentasI_DTO_CIAL: TFloatField;
     xVentasPORTES: TIntegerField;
     xVentasI_FINANCIACION_CANAL: TFloatField;
     xVentasS_BASES_CANAL: TFloatField;
     xVentasS_CUOTA_IVA_CANAL: TFloatField;
     xVentasS_CUOTA_RE_CANAL: TFloatField;
     xVentasLIQUIDO_CANAL: TFloatField;
     xVentasCHG_MONEDA: TIntegerField;
     xVentasTARIFA: TFIBStringField;
     QMPrecios: TFIBTableSet;
     QMPreciosEMPRESA: TIntegerField;
     QMPreciosEJERCICIO: TIntegerField;
     QMPreciosCANAL: TIntegerField;
     QMPreciosTIPO: TFIBStringField;
     QMPreciosRIG: TIntegerField;
     QMPreciosCLIENTE: TIntegerField;
     QMPreciosARTICULO: TFIBStringField;
     QMPreciosFAMILIA: TFIBStringField;
     QMPreciosPERFIL: TFIBStringField;
     QMPreciosAGRUPACION: TFIBStringField;
     QMPreciosALTA: TDateTimeField;
     QMPreciosBAJA: TDateTimeField;
     QMPreciosACTIVO: TIntegerField;
     QMPreciosLINEA: TIntegerField;
     QMPreciosUNID_MINIMAS: TFloatField;
     QMPreciosUNID_MAXIMAS: TFloatField;
     QMPreciosPRECIO: TFloatField;
     QMPreciosDESCUENTO: TFloatField;
     QMPreciosDESCUENTO_2: TFloatField;
     QMPreciosDESCUENTO_3: TFloatField;
     DSQMPrecios: TDataSource;
     QMClientesSU_REFERENCIA: TFIBStringField;
     QMClientesFACTURAR_ALMACEN: TIntegerField;
     QMVacacionesMES_VENCIMIENTO: TIntegerField;
     QMClientesRIESGO_FAC: TFloatField;
     QMClientesRIESGO_ALB: TFloatField;
     QMClientesRIESGO_CAR: TFloatField;
     QMClientesRIESGO_REM: TFloatField;
     QMClientesRIESGODESCUENTO: TFloatField;
     QMClientesRIESGO_PENDIENTE: TFloatField;
     xBuscoMaxCte: TFIBQuery;
     QMClientesMOROSO: TIntegerField;
     QMClientesCREDITO_Y_CAUCION: TIntegerField;
     QMClientesNRO_EMPLEADOS: TIntegerField;
     QMClientesFACTURACION_TOTAL: TFloatField;
     QMClientesCONSUMO_MATERIAL: TFloatField;
     QMClientesPROVEEDORES_HABITUALES: TFIBStringField;
     QMClientesRUTA: TIntegerField;
     QMClientesCLIENTE_POTENCIAL: TIntegerField;
     QMClientesTIPO_CLIENTE: TFIBStringField;
     QMClientesINTRA: TIntegerField;
     QMClientesINTRA_TRANS: TIntegerField;
     QMClientesFACTURAR_TARIFA: TIntegerField;
     DSQMClientes2: TDataSource;
     QMClientesNO_CALC_DESC_KRI: TSmallintField;
     QMClientesNO_AGRUPAR_PED_KRI: TIntegerField;
     QMClientesPOTENCIAL_DE_COMPRA: TFloatField;
     QMClientesNOTAS_FACTURACION_KRI: TBlobField;
     QMClientesRIESGO_PED: TFloatField;
     QMClientesPAIS_C2: TFIBStringField;
     QMClientesRIESGOREMPAG: TFloatField;
     QMClientesTIT_LOCALIDAD: TFIBStringField;
     QMClientesCODIGO_POSTAL: TFIBStringField;
     QMClientesCUENTA_DTOPP: TFIBStringField;
     QMClientesDIAS_ENTREGA: TIntegerField;
     QMClientesIDIOMA: TFIBStringField;
     xIncidencias: TFIBTableSet;
     DSxIncidencias: TDataSource;
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
     QMClientesAPLICAR_PTO_VERDE: TIntegerField;
     QMClientesCOD_CREDITO_Y_CAUCION: TIntegerField;
     QMClientesFACTURAS_POR_EMAIL_KRI: TIntegerField;
     QMClientesTIPO_PORTES: TIntegerField;
     QMClientesPOR_PORTES: TFloatField;
     QMClientesI_PORTES: TFloatField;
     xRangos: TFIBDataSetRO;
     DSxRangos: TDataSource;
     xRangosTITULO: TFIBStringField;
     xIndices: TFIBDataSetRO;
     DSxIndices: TDataSource;
     xIndicesTITULO: TFIBStringField;
     QMClientesRANGO: TIntegerField;
     QMClientesINDICE: TIntegerField;
     QMClientesANTICIPO_EMP: TFloatField;
     QMClientesANTICIPO_CAN: TFloatField;
     xFacturasAnualC_1: TFIBTableSet;
     xFacturasAnualC_1TOTAL_BASE: TFloatField;
     xFacturasAnualC_1TOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualC_1: TDataSource;
     xFacturasAnualC_2: TFIBTableSet;
     xFacturasAnualC_2TOTAL_BASE: TFloatField;
     xFacturasAnualC_2TOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualC_2: TDataSource;
     xFacturasAnualC_3: TFIBTableSet;
     xFacturasAnualC_3TOTAL_BASE: TFloatField;
     xFacturasAnualC_3TOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualC_3: TDataSource;
     xFacturasMensual: TFIBTableSet;
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
     xFacturasMensualL_JULIO: TFloatField;
     xFacturasMensualL_AGOSTO: TFloatField;
     xFacturasMensualB_SEPTIEMBRE: TFloatField;
     xFacturasMensualL_SEPTIEMBRE: TFloatField;
     xFacturasMensualB_OCTUBRE: TFloatField;
     xFacturasMensualL_OCTUBRE: TFloatField;
     xFacturasMensualL_NOVIEMBRE: TFloatField;
     xFacturasMensualB_DICIEMBRE: TFloatField;
     xFacturasMensualL_DICIEMBRE: TFloatField;
     DSxFacturasMensual: TDataSource;
     xFacturasMensualCompara: TFIBTableSet;
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
     xFacturasMensualComparaL_JULIO: TFloatField;
     xFacturasMensualComparaL_AGOSTO: TFloatField;
     xFacturasMensualComparaB_SEPTIEMBRE: TFloatField;
     xFacturasMensualComparaL_SEPTIEMBRE: TFloatField;
     xFacturasMensualComparaB_OCTUBRE: TFloatField;
     xFacturasMensualComparaL_OCTUBRE: TFloatField;
     xFacturasMensualComparaL_NOVIEMBRE: TFloatField;
     xFacturasMensualComparaB_DICIEMBRE: TFloatField;
     xFacturasMensualComparaL_DICIEMBRE: TFloatField;
     DSxFacturasMensualCompara: TDataSource;
     xFacturasAnual: TFIBTableSet;
     xFacturasAnualTOTAL_BASE: TFloatField;
     xFacturasAnualTOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnual: TDataSource;
     xFacturasAnualCompara: TFIBTableSet;
     xFacturasAnualComparaTOTAL_BASE: TFloatField;
     xFacturasAnualComparaTOTAL_LIQUIDO: TFloatField;
     DSxFacturasAnualCompara: TDataSource;
     xPrevisionMensual: TFIBTableSet;
     xPrevisionMensualCLIENTE: TIntegerField;
     xPrevisionMensualEJERCICIO: TIntegerField;
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
     xPrevisionMensualL_JULIO: TFloatField;
     xPrevisionMensualL_AGOSTO: TFloatField;
     xPrevisionMensualB_SEPTIEMBRE: TFloatField;
     xPrevisionMensualL_SEPTIEMBRE: TFloatField;
     xPrevisionMensualB_OCTUBRE: TFloatField;
     xPrevisionMensualL_OCTUBRE: TFloatField;
     xPrevisionMensualL_NOVIEMBRE: TFloatField;
     xPrevisionMensualB_DICIEMBRE: TFloatField;
     xPrevisionMensualL_DICIEMBRE: TFloatField;
     DSxPrevisionMensual: TDataSource;
     xPrevisionAnual: TFIBTableSet;
     xPrevisionAnualTOTAL_BASE: TFloatField;
     xPrevisionAnualTOTAL_LIQUIDO: TFloatField;
     DSxPrevisionAnual: TDataSource;
     xDocumentos: TFIBDataSetRO;
     xFactCobrada: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     DSxFactCobrada: TDataSource;
     xDocumentosN_PAGADO: TIntegerField;
     xDocumentosT_PAGADO: TFloatField;
     xDocumentosN_IMPAGADO: TIntegerField;
     xDocumentosT_IMPAGADO: TFloatField;
     xDocumentosN_PEND_COBRAR: TIntegerField;
     xDocumentosT_PEND_COBRAR: TFloatField;
     xDocumentosN_PEND_RECIBIR: TIntegerField;
     xDocumentosT_PEND_RECIBIR: TFloatField;
     xDocumentosMEDIA_DIAS_PAGO: TIntegerField;
     xDocumentosMEDIA_DIAS_REC: TIntegerField;
     xDocumentosCUENTA_PEND: TFIBStringField;
     xDocumentosCUENTA_ANTICIPO: TFIBStringField;
     xDocumentosN_PRESUP_PEND: TIntegerField;
     xDocumentosB_PRESUP_PEND: TFloatField;
     xDocumentosT_PRESUP_PEND: TFloatField;
     xDocumentosN_PRESUP_ACEPT: TIntegerField;
     xDocumentosB_PRESUP_ACEPT: TFloatField;
     xDocumentosT_PRESUP_ACEPT: TFloatField;
     xDocumentosN_PRESUP_DENI: TIntegerField;
     xDocumentosB_PRESUP_DENI: TFloatField;
     xDocumentosT_PRESUP_DENI: TFloatField;
     xDocumentosN_PED_PEND: TIntegerField;
     xDocumentosB_PED_PEND: TFloatField;
     xDocumentosT_PED_PEND: TFloatField;
     xDocumentosN_ALB_PEND: TIntegerField;
     xDocumentosB_ALB_PEND: TFloatField;
     xDocumentosT_ALB_PEND: TFloatField;
     xDocumentosN_FAC_PEND: TIntegerField;
     xDocumentosB_FAC_PEND: TFloatField;
     xDocumentosT_FAC_PEND: TFloatField;
     xFactCobradaN_PAGADO: TIntegerField;
     xFactCobradaT_PAGADO: TFloatField;
     xFactCobradaN_IMPAGADO: TIntegerField;
     xFactCobradaT_IMPAGADO: TFloatField;
     xFactCobradaN_PEND_COBRAR: TIntegerField;
     xFactCobradaT_PEND_COBRAR: TFloatField;
     xFactCobradaN_PEND_RECIBIR: TIntegerField;
     xFactCobradaT_PEND_RECIBIR: TFloatField;
     xFactCobradaMEDIA_DIAS_PAGO: TIntegerField;
     xFactCobradaMEDIA_DIAS_REC: TIntegerField;
     DSQMDescuentosKri: TDataSource;
     QMDescuentosKri: TFIBTableSet;
     QMDescuentosKriEMPRESA: TIntegerField;
     QMDescuentosKriEJERCICIO: TIntegerField;
     QMDescuentosKriCANAL: TIntegerField;
     QMDescuentosKriCLIENTE: TIntegerField;
     QMDescuentosKriDTO_CIAL: TFloatField;
     QMDescuentosKriIMPORTE: TFloatField;
     QMDescuentosKriID: TIntegerField;
     xFacturasMensualComparaB_JULIO: TFloatField;
     xFacturasMensualComparaB_AGOSTO: TFloatField;
     xFacturasMensualComparaB_NOVIEMBRE: TFloatField;
     xFacturasMensualB_JULIO: TFloatField;
     xFacturasMensualB_AGOSTO: TFloatField;
     xFacturasMensualB_NOVIEMBRE: TFloatField;
     xPrevisionMensualB_AGOSTO: TFloatField;
     xPrevisionMensualB_NOVIEMBRE: TFloatField;
     xPrevisionMensualB_JULIO: TFloatField;
     QMClientesFRECUENCIA: TIntegerField;
     TUpdate: THYTransaction;
     SPRellenarSeleccion: THYFIBQuery;
     QMClientesFECHA_ULT_COMPRA_KRI: TDateField;
     QMClientesRIESGO_ACT_PED: TFloatField;
     QMClientesRIESGO_PENDIENTE_PED: TFloatField;
     QMClientesIMPAGADOS_KRI: TFloatField;
     DSxComunicaciones: TDataSource;
     xComunicaciones: TFIBTableSet;
     xComunicacionesID: TIntegerField;
     xComunicacionesEMPRESA: TIntegerField;
     xComunicacionesTIPO: TFIBStringField;
     xComunicacionesCOD_CLI_PRO: TIntegerField;
     xComunicacionesARCHIVO: TFIBStringField;
     xComunicacionesFECHA_CREACION: TDateTimeField;
     xComunicacionesFECHA_MODIFICACION: TDateTimeField;
     xComunicacionesDESCRIPCION: TFIBStringField;
     QMClientesZONA: TFIBStringField;
     QMClientesPROTOCOLO: TFIBStringField;
     QMClientesBLOQUEO: TIntegerField;
     QMClientesMOTIVO_BLOQUEO: TFIBStringField;
     QMClientesCODIGO_INCOTERM: TFIBStringField;
     QMClientesDIR_DEFECTO_VENTAS: TIntegerField;
     QMClientesDIRECCION_DEFECTO: TIntegerField;
     QMClientesSIN_DESCUENTOS: TIntegerField;
     DSDetConsumo: TDataSource;
     QMDetConsumo: TFIBTableSet;
     QMDetConsumoIDDETCONSUMO: TIntegerField;
     QMDetConsumoAGRUPACION: TFIBStringField;
     QMDetConsumoCONSUMO: TFloatField;
     QMDetConsumoDescAgrupacion: TStringField;
     QMDetConsumoLINEA: TIntegerField;
     QMDetConsumoCLIENTE: TIntegerField;
     QMDetConsumoEMPRESA: TIntegerField;
     QMDetConsumoEJERCICIO: TIntegerField;
     QMDetConsumoTERCERO: TIntegerField;
     QMClientesUTILIZA_F_PAGO_ALTERNATIVA: TIntegerField;
     QMClientesBAJA: TIntegerField;
     QMClientesFECHA_BAJA: TDateTimeField;
     QMClientesMOTIVO_BAJA: TFIBStringField;
     QMClientesCUENTA_DTOCIAL: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     QMClientesTIPO_NCF: TIntegerField;
     QMClientesCUENTA_COMPRA: TFIBStringField;
     QMClientesCUENTA_VENTA: TFIBStringField;
     QMClientesALBARAN_VALORADO: TIntegerField;
     xIsoCli: TFIBDataSetRO;
     DSxIsoCli: TDataSource;
     xIsoCliEMPRESA: TIntegerField;
     xIsoCliRIC: TIntegerField;
     xIsoCliTIPO: TFIBStringField;
     xIsoCliCLI_PRO_INTE: TIntegerField;
     xIsoCliSITUACION: TFIBStringField;
     xIsoCliSERIE_DOC: TFIBStringField;
     xIsoCliNUM_DOC: TIntegerField;
     xIsoCliDESCRIPCION: TFIBStringField;
     xIsoCliFECHA_INC: TDateTimeField;
     xIsoCliRESPONSABLE: TIntegerField;
     xIsoCliPOR_CLASIFICA: TIntegerField;
     xIsoCliESTADO: TIntegerField;
     xIsoCliNOTAS: TBlobField;
     xIsoCliTIRAR: TIntegerField;
     xIsoCliRECUPERAR_ISO: TIntegerField;
     xIsoCliDEVOLVER: TIntegerField;
     xIsoCliACEPTAR: TIntegerField;
     xIsoCliOTROS: TIntegerField;
     xIsoCliVBCALIDAD: TIntegerField;
     xIsoCliVBRESDEPARTAMENTO: TIntegerField;
     xIsoCliCANTIDAD: TIntegerField;
     xIsoCliFECHA_CIERRE: TDateTimeField;
     xIsoCliNDEVOLUCION: TIntegerField;
     xIsoCliCONTADOR: TFIBStringField;
     xIsoCliDEPARTAMENTO: TFIBStringField;
     xIsoCliEVIDENCIA: TFIBStringField;
     xIsoCliNDOCCLI: TIntegerField;
     xIsoCliREFERENCIACLI: TFIBStringField;
     xIsoCliNOTAS_INC: TMemoField;
     xIsoCliCOSTE_TOTAL: TFloatField;
     xIsoCliLINEA: TIntegerField;
     xIsoCliEJERCICIO: TIntegerField;
     xIsoCliCLIPRO: TIntegerField;
     xIsoCliCANAL: TIntegerField;
     xIsoCliCOSTE_INC: TFloatField;
     QMClientesTELEFONO: TFIBStringField;
     QMClientesFEC_PROP_CREDITO_Y_CAUCION: TDateTimeField;
     QMClientesRECC: TIntegerField;
     QMClientesEXPORTAR: TIntegerField;
     QMCentroAdministrativo: TFIBTableSet;
     DSQMCentroAdministrativo: TDataSource;
     QMCentroAdministrativoEMPRESA: TIntegerField;
     QMCentroAdministrativoCLIENTE: TIntegerField;
     QMCentroAdministrativoID_CLIENTE: TIntegerField;
     QMCentroAdministrativoCENTRO_ADMINISTRATIVO: TFIBStringField;
     QMCentroAdministrativoROL_CENTRO_ADMINISTRATIVO: TFIBStringField;
     QMCentroAdministrativoTITULO_ROL: TStringField;
     QMCentroAdministrativoTERCERO: TIntegerField;
     QMCentroAdministrativoDIRECCION: TIntegerField;
     QMCentroAdministrativoTITULO_DIRECCION: TStringField;
     QMClientesID_CUSTOMER_PRESTASHOP: TIntegerField;
     DSQMPrestaShop: TDataSource;
     QMPrestaShop: TFIBTableSet;
     QMPrestaShopID_CONFIGURACION: TIntegerField;
     QMPrestaShopID_CLIENTE: TIntegerField;
     QMPrestaShopID_CUSTOMER: TIntegerField;
     QMPrestaShopULT_SINCRONIZACION: TDateTimeField;
     QMClientesBANCO_PAGOS: TIntegerField;
     QMClientesPEDIDO_VALORADO: TIntegerField;
     QMClientesPERIODO_FACTURACION: TFIBStringField;
     QMClientesCLIENTE_PADRE: TIntegerField;
     DSxVentasDetalle: TDataSource;
     xVentasDetalle: TFIBTableSetRO;
     xVentasDetalleEMPRESA: TIntegerField;
     xVentasDetalleEJERCICIO: TIntegerField;
     xVentasDetalleCANAL: TIntegerField;
     xVentasDetalleSERIE: TFIBStringField;
     xVentasDetalleTIPO: TFIBStringField;
     xVentasDetalleRIG: TIntegerField;
     xVentasDetalleALMACEN: TFIBStringField;
     xVentasDetalleMONEDA: TFIBStringField;
     xVentasDetalleFECHA: TDateTimeField;
     xVentasDetalleCLIENTE: TIntegerField;
     xVentasDetalleTERCERO: TIntegerField;
     xVentasDetalleDIRECCION: TIntegerField;
     xVentasDetalleSU_REFERENCIA: TFIBStringField;
     xVentasDetalleFORMA_PAGO: TFIBStringField;
     xVentasDetalleCAMPANYA: TIntegerField;
     xVentasDetalleESTADO: TIntegerField;
     xVentasDetalleAGENTE: TIntegerField;
     xVentasDetalleDTO_PP: TFloatField;
     xVentasDetalleDTO_CIAL: TFloatField;
     xVentasDetallePOR_FINANCIACION: TFloatField;
     xVentasDetallePORTES: TIntegerField;
     xVentasDetalleTARIFA: TFIBStringField;
     xVentasDetalleID_S: TIntegerField;
     xVentasDetalleFECHA_ENTREGA: TDateTimeField;
     xVentasDetalleIDIOMA: TFIBStringField;
     xVentasDetalleCONTACTO: TIntegerField;
     xVentasDetallePOR_PORTES: TFloatField;
     xVentasDetalleTIPO_PORTES: TIntegerField;
     xVentasDetalleRANGO: TIntegerField;
     xVentasDetalleINDICE: TIntegerField;
     xVentasDetalleCAMBIO_FIJO: TIntegerField;
     xVentasDetallePROYECTO: TIntegerField;
     xVentasDetallePEDIDO_CLIENTE: TFIBStringField;
     xVentasDetalleZ_CONTACTO: TIntegerField;
     xVentasDetalleZ_OBSERVACION: TFIBStringField;
     xVentasDetalleLINEA: TIntegerField;
     xVentasDetalleARTICULO: TFIBStringField;
     xVentasDetalleTITULO: TFIBStringField;
     xVentasDetalleUNIDADES: TFloatField;
     xVentasDetallePRECIO: TFloatField;
     xVentasDetallePIEZAS_X_BULTO: TIntegerField;
     xVentasDetalleDESCUENTO: TFloatField;
     xVentasDetalleDESCUENTO_2: TFloatField;
     xVentasDetalleDESCUENTO_3: TFloatField;
     xVentasDetalleCOMISION: TFloatField;
     xVentasDetalleP_COSTE: TFloatField;
     xVentasDetalleM_MOV_STOCK: TIntegerField;
     xVentasDetallePAIS: TFIBStringField;
     xVentasDetalleTIPO_IVA: TIntegerField;
     xVentasDetalleP_IVA: TFloatField;
     xVentasDetalleP_RECARGO: TFloatField;
     xVentasDetalleI_DESCUENTO: TFloatField;
     xVentasDetalleB_IMPONIBLE: TFloatField;
     xVentasDetalleB_DTO_LINEA: TFloatField;
     xVentasDetalleC_IVA: TFloatField;
     xVentasDetalleC_RECARGO: TFloatField;
     xVentasDetalleUNIDADES_EXT: TFloatField;
     xVentasDetalleIVA_INCLUIDO: TIntegerField;
     xVentasDetalleNSERIE: TFIBStringField;
     xVentasDetalleB_COMISION_CANAL: TFloatField;
     xVentasDetalleEJER_MOV: TIntegerField;
     xVentasDetalleUNIDADES_SEC: TFloatField;
     xVentasDetalleNO_FABRICACION_KRI: TFIBStringField;
     xVentasDetalleID_DETALLES_S: TIntegerField;
     xVentasDetalleID_D_S_GR: TIntegerField;
     xVentasDetalleID_A_M_C_T: TIntegerField;
     xVentasDetalleID_C_A: TIntegerField;
     xVentasDetalleID_A: TIntegerField;
     xVentasDetalleID_MOV_STOCKS: TIntegerField;
     xVentasDetalleTITULO_IDIOMA: TFIBStringField;
     xVentasDetalleORDEN: TIntegerField;
     xVentasDetalleTIPO_LINEA: TFIBStringField;
     xVentasDetalleORIGEN: TIntegerField;
     xVentasDetallePROC_PROMOCION: TIntegerField;
     xVentasDetalleID_P: TIntegerField;
     xVentasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xVentasDetalleCERTIFICADO: TIntegerField;
     xVentasDetalleCERT_NEGATIVO: TIntegerField;
     xVentasDetalleLINEA_RELACION: TIntegerField;
     xVentasDetalleNOTAS2: TBlobField;
     xVentasDetalleCRC_NOTAS: TFIBStringField;
     xVentasDetalleCRC_NOTAS2: TFIBStringField;
     xVentasDetallePRO_NUM_PLANO: TFIBStringField;
     xVentasDetalleCUENTA: TFIBStringField;
     xVentasDetalleLOTE_SIMPLE: TFIBStringField;
     xVentasDetalleID_DESPIECE: TIntegerField;
     xVentasDetalleCOSTE_ADICIONAL: TFloatField;
     xVentasDetalleT_COSTE: TFloatField;
     xVentasDetalleMANIPULACION: TIntegerField;
     xVentasID_S: TIntegerField;
     QMClientesGRUPO_CUENTAS: TIntegerField;
     xVentasDetalleCODIGO_CLIENTE: TFIBStringField;
     xVentasPEDIDO_CLIENTE: TFIBStringField;
     xVentasZ_OBSERVACION: TFIBStringField;
     xVentasCONTACTO: TIntegerField;
     xVentasI_PORTES: TFloatField;
     xVentasPOR_PORTES: TFloatField;
     xVentasTIPO_PORTES: TIntegerField;
     xVentasRANGO: TIntegerField;
     xVentasINDICE: TIntegerField;
     xVentasPROYECTO: TIntegerField;
     xVentasTRANSPORTISTA: TIntegerField;
     QMPreciosTITULO_ARTICULO: TFIBStringField;
     QMPreciosTITULO_FAMILIA: TFIBStringField;
     QMPreciosP_COSTE: TFloatField;
     QMPreciosMARGEN_PC: TFloatField;
     QMPreciosMARGEN_PV: TFloatField;
     QMClientesCUENTA_IRPF: TFIBStringField;
     QMClientesNIF: TFIBStringField;
     QMClientesDTO_CIAL_LINEA: TFloatField;
     QMClientesDTO_CIAL_LINEA_2: TFloatField;
     QMClientesDTO_CIAL_LINEA_3: TFloatField;
     QMClientesTELEFONO02: TFIBStringField;
     QMClientesTELEFAX: TFIBStringField;
     QMClientesSEPARAR_DTO_CIAL: TIntegerField;
     xTipoGiro: TFIBTableSet;
     DSxTipoGiro: TDataSource;
     xTipoGiroEMPRESA: TIntegerField;
     xTipoGiroCLIENTE: TIntegerField;
     xTipoGiroCODIGO_GIRO: TIntegerField;
     xTipoGiroDEFECTO: TIntegerField;
     xTipoGiroTITULO: TFIBStringField;
     QMClientesID_CLIENTE: TIntegerField;
     QMClientesDIA_SEMANA_PAGO: TFIBStringField;
     QMClientesCATEGORIA: TFIBStringField;
     QMCentroAdministrativoNOMBRE: TFIBStringField;
     QMClientesTIPO_DOC_IDENT: TFIBStringField;
     QMClientesCANAL_DST_PEC: TIntegerField;
     QMClientesSERIE_DST_PEC: TFIBStringField;
     QMClientesTIPO_DST_PEC: TFIBStringField;
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
     QMClientesIMPORTE_MINIMO_PORTE: TFloatField;
     QMClientesALBARANAR_SERIE: TIntegerField;
     QMClientesSERIE_A_ALBARANAR: TFIBStringField;
     QMClientesRIESGO_EMP: TFloatField;
     QMClientesRIESGO_CYC: TFloatField;
     QMClientesRIESGO_FACTOR: TFloatField;
     xAvisos: TFIBTableSet;
     DSxAvisos: TDataSource;
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
     QMPreciosALFA_1: TFIBStringField;
     QMPreciosALFA_2: TFIBStringField;
     QMPreciosALFA_3: TFIBStringField;
     QMPreciosALFA_4: TFIBStringField;
     QMPreciosALFA_5: TFIBStringField;
     QMPreciosALFA_6: TFIBStringField;
     QMPreciosALFA_7: TFIBStringField;
     QMPreciosALFA_8: TFIBStringField;
     xVentasDetalleADJUNTO: TFIBStringField;
     xVentasDetalleI_PORTES: TFloatField;
     xVentasDetalleTRANSPORTISTA: TIntegerField;
     xVentasDetalleBANCO: TIntegerField;
     xVentasDetalleBULTOS: TIntegerField;
     xVentasDetalleBRUTO: TFloatField;
     xVentasDetalleB_COMISION: TFloatField;
     xVentasDetalleI_DTO_PP: TFloatField;
     xVentasDetalleI_DTO_CIAL: TFloatField;
     xVentasDetalleI_COMISION: TFloatField;
     xVentasDetalleENTRADA: TIntegerField;
     xVentasDetalleNOTAS: TMemoField;
     xVentasDetalleCOMISION_LINEAL: TFloatField;
     xVentasDetalleI_COMISION_LINEAL: TFloatField;
     xVentasDetalleMARGEN_KRI: TFloatField;
     xVentasDetalleTIPO_LINEA_KRI: TIntegerField;
     xVentasDetalleULT_MODIFICACION: TDateTimeField;
     xVentasDetalleID_REGISTRO: TIntegerField;
     xVentasDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     xVentasDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     xVentasDetalleLIQUIDO: TFloatField;
     xVentasDetalleM_BRUTO: TFloatField;
     xVentasDetallePESO: TFloatField;
     xVentasDetallePESO_TOTAL: TFloatField;
     xVentasDetallePESO_REAL: TFloatField;
     QMClientesDIA_PAGO_3: TIntegerField;
     TEstadistica: THYTransaction;
     DSxVentasMargenes: TDataSource;
     xVentasMargenes: TFIBTableSetRO;
     xVentasMargenesCLIENTE: TIntegerField;
     xVentasMargenesARTICULO: TFIBStringField;
     xVentasMargenesTITULO: TFIBStringField;
     xVentasMargenesALFA_1: TFIBStringField;
     xVentasMargenesP_COSTE_ARTICULO: TFloatField;
     QMClientesFECHA_ALTA: TDateTimeField;
     QMClientesRUTA_ORDEN: TIntegerField;
     QMCliArt: TFIBTableSet;
     QMCliArtEMPRESA: TIntegerField;
     QMCliArtARTICULO: TFIBStringField;
     QMCliArtCLIENTE: TIntegerField;
     QMCliArtCODIGO_CLIENTE: TFIBStringField;
     QMCliArtNOMBRE_R_SOCIAL: TFIBStringField;
     QMCliArtID_A: TIntegerField;
     DSQMCliArt: TDataSource;
     QMCliArtNOTAS_PREPARACION: TFIBStringField;
     QMCliArtTITULO_ARTICULO: TFIBStringField;
     QMCliArtTITULO_ARTICULO_CLIENTE: TFIBStringField;
     QMClientesNO_AGRUPAR_ALBARANES: TIntegerField;
     xVentasMargenesEMPRESA: TIntegerField;
     xVentasDetalleU_PENDIENTES: TFloatField;
     QMClientesALFA_1: TStringField;
     QMClientesALFA_2: TStringField;
     QMClientesALFA_3: TStringField;
     QMClientesALFA_4: TStringField;
     QMClientesALFA_5: TStringField;
     QMClientesALFA_6: TStringField;
     QMClientesALFA_7: TStringField;
     QMClientesALFA_8: TStringField;
     QMClientesTITULO_ZONA: TFIBStringField;
     QMClientesDIR_COMPLETA_N: TFIBStringField;
     QMClientesEMAIL: TFIBStringField;
     QMClientesTITULO_REGION: TFIBStringField;
     QMClientesTITULO_PROVINCIA: TFIBStringField;
     QMClientesTITULO_POBLACION: TFIBStringField;
     QMClientesTITULO_CODIGO_POSTAL: TFIBStringField;
     QMClientesPROYECTO: TIntegerField;
     xVentasNOMBRE: TFIBStringField;
     xVentasNIF: TFIBStringField;
     xVentasDIR_NOMBRE: TFIBStringField;
     xVentasC_POSTAL: TFIBStringField;
     xVentasLOCALIDAD: TFIBStringField;
     xVentasPROVINCIA: TFIBStringField;
     xVentasPAIS: TFIBStringField;
     xVentasTELEFONO01: TFIBStringField;
     xVentasTELEFONO02: TFIBStringField;
     xVentasTELEFAX: TFIBStringField;
     xVentasEMAIL: TFIBStringField;
     xVentasNOMBRE_CONTACTO: TFIBStringField;
     xVentasCOMO_NOS_CONOCIERON: TFIBStringField;
     QMClientesPAIS_TERCERO: TFIBStringField;
     QMClientesGIRO_CLIENTE: TFIBStringField;
     QMClientesENTRADA: TIntegerField;
     QMClientesAGENTE2: TIntegerField;
     QMClientesENVIAR_CONFIRMACION_PEDIDO: TIntegerField;
     QMRedesSociales: TFIBTableSet;
     DSQMRedesSociales: TDataSource;
     QMRedesSocialesTERCERO: TIntegerField;
     QMRedesSocialesID_RED_SOCIAL: TIntegerField;
     QMRedesSocialesNOMBRE: TFIBStringField;
     QMRedesSocialesURL_BASE: TFIBStringField;
     QMRedesSocialesROL: TFIBStringField;
     QMRedesSocialesRED_SOCIAL_ACTIVA: TIntegerField;
     QMRedesSocialesURL: TFIBStringField;
     QMRedesSocialesHANDLE: TFIBStringField;
     xVentasMargenesALFA_2: TFIBStringField;
     xVentasMargenesALFA_3: TFIBStringField;
     xVentasMargenesALFA_4: TFIBStringField;
     xVentasMargenesALFA_5: TFIBStringField;
     xVentasMargenesALFA_6: TFIBStringField;
     xVentasMargenesALFA_7: TFIBStringField;
     xVentasMargenesALFA_8: TFIBStringField;
     xVentasMargenesULTIMA_FECHA_DOC: TDateTimeField;
     xVentasMargenesULTIMO_P_COSTE_DOC: TFloatField;
     xVentasMargenesULTIMO_PRECIO_DOC: TFloatField;
     xVentasMargenesMARGEN_P_COSTE_ART_PRECIO: TFloatField;
     xVentasMargenesMARGEN_P_COSTE_ART_B_IMP: TFloatField;
     xVentasMargenesMARGEN_P_COSTE_DOC_PRECIO: TFloatField;
     xVentasMargenesMARGEN_P_COSTE_DOC_B_IMP: TFloatField;
     xVentasMargenesMARGEN_V_P_COSTE_ART_PRECIO: TFloatField;
     xVentasMargenesMARGEN_V_P_COSTE_ART_B_IMP: TFloatField;
     xVentasMargenesMARGEN_V_P_COSTE_DOC_PRECIO: TFloatField;
     xVentasMargenesMARGEN_V_P_COSTE_DOC_B_IMP: TFloatField;
     QMClientesRIESGO_PEC: TFloatField;
     procedure DMClientesCreate(Sender: TObject);
     procedure QMClientesNewRecord(DataSet: TDataSet);
     procedure QMClientesTERCEROChange(Sender: TField);
     procedure QMClientesBeforePost(DataSet: TDataSet);
     procedure QMClientesAfterOpen(DataSet: TDataSet);
     procedure QMClientesTIPO_IRPFChange(Sender: TField);
     procedure QMClientesTIPOChange(Sender: TField);
     procedure QMClientesBeforeEdit(DataSet: TDataSet);
     procedure DMClientesDestroy(Sender: TObject);
     procedure QMVacacionesNewRecord(DataSet: TDataSet);
     procedure QMClientesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMClientesTIPO_PORTESChange(Sender: TField);
     procedure QMClientesRANGOChange(Sender: TField);
     procedure QMClientesINDICEChange(Sender: TField);
     procedure QMDescuentosKriNewRecord(DataSet: TDataSet);
     procedure QMDescuentosKriBeforePost(DataSet: TDataSet);
     procedure QMClientesAfterPost(DataSet: TDataSet);
     procedure QMClientesFECHA_ULT_COMPRA_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMClientesIMPAGADOS_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xComunicacionesNewRecord(DataSet: TDataSet);
     procedure xComunicacionesBeforePost(DataSet: TDataSet);
     procedure QMDetConsumoDescAgrupacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetConsumoNewRecord(DataSet: TDataSet);
     procedure QMDetConsumoAGRUPACIONChange(Sender: TField);
     procedure QMCentroAdministrativoNewRecord(DataSet: TDataSet);
     procedure QMCentroAdministrativoTITULO_ROLGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCentroAdministrativoTITULO_DIRECCIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMClientesBeforeClose(DataSet: TDataSet);
     procedure xTipoGiroNewRecord(DataSet: TDataSet);
     procedure xTipoGiroAfterPost(DataSet: TDataSet);
     procedure xTipoGiroAfterDelete(DataSet: TDataSet);
     procedure QMClientesRIESGO_AUTChange(Sender: TField);
     procedure QMClientesCalcFields(DataSet: TDataSet);
     procedure xAvisosNewRecord(DataSet: TDataSet);
     procedure xAvisosBeforePost(DataSet: TDataSet);
     procedure QMClientesRUTAChange(Sender: TField);
     procedure QMCliArtNewRecord(DataSet: TDataSet);
     procedure QMCliArtBeforePost(DataSet: TDataSet);
     procedure QMCliArtARTICULOChange(Sender: TField);
     procedure QMRedesSocialesNewRecord(DataSet: TDataSet);
     procedure QMRedesSocialesID_RED_SOCIALChange(Sender: TField);
  private
     Cambiar: boolean;
     cuentaold: string;
     Ruta_old: integer;
     RutaOrden_old: integer;
     LocalMascaraN: string;
     LocalMascaraL: string;
     TransportistaDefecto: integer;
     IDTiendaPrestashop: integer;
     HayOR: boolean;
     procedure PreparaMultiSeleccion;
  public
     SQLBase: TStrings;
     cancelar_recalculo_riesgo: boolean; {dji lrk kri}
     TraspasoClientePotencial: boolean; {dji lrk kri}
     ClientePotencial: integer;
     PlantillaComunicaciones: string;
     //procedure Busca( Busca : string ) ;
     function BusquedaCompleja: integer;
     procedure AgrupacionRellena;
     procedure AgrupacionVacia;
     procedure VentasCliente;
     function cliente: integer;
     procedure ActualizaVacaciones;
     procedure CambiarTercero(Tercero: integer);
     procedure FiltraSeleccion;
     procedure Filtra_agrupaciones(Agrupacion: string; Negativo: integer);
     procedure Traspasa_agrupaciones;
     procedure Carga_agrupaciones(agrupacion: string);
     procedure Borra_TMP_agrupaciones;
     procedure MuestraRiesgos;
     procedure ActRiesgoCliente(Cliente: integer);
     procedure ActRiesgoEmpresa;
     function HayDetalle(Tipo: integer): boolean;
     function ExisteRango(Rango: integer): boolean;
     function DameCuentaPendiente: string;
     function DameCliente: integer;
     procedure CargaEstadisticas(Ejercicio, Ejercicio2: integer; Moneda: string; Porcentaje: double; Tipo: string);
     procedure MuestraDocumentos;
     procedure CierraDocumentos;
     procedure CierraEstadisticas;
     procedure ImportaClientePotencial(aClientePotencial, aTercero: integer);
     procedure RegenerarCondicionesSegunProtocolo;
     procedure ExportarClientesFiltrados;
     procedure ExportarDirCliFiltrados;
     procedure AsignaTarifa(Tarifa: string);
     procedure AbreFacturaElectronica;
     procedure CierraFacturaElectronica;
     procedure FiltraVentas(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; Pendientes: boolean; CampoOrdenDetalleVentas, CampoOrdenMargenesVentas: string; CalcularMargenes: boolean);
     procedure ActualizaConfiguracionCliente(ClienteOrigen: integer);
     procedure ImprimirCartaLOPD(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
     procedure AbrirDatosFacturacion;
     procedure CerrarDatosFacturacion;
     procedure AbrirConsumos;
     procedure CerrarConsumos;
     procedure AbrirDescuentos;
     procedure CerrarDescuentos;
     procedure AbrirPrecios;
     procedure CerrarPrecios;
     procedure AbrirIso;
     procedure CerrarIso;
     procedure AbrirAgrupaciones;
     procedure CerrarAgrupaciones;
     procedure CerrarAvisos;
     procedure AbrirAvisos;
     procedure CerrarVentas;
     function DameTituloTipoTercero(Tipo: integer): string;
     function DameTituloPaisC2(Pais: string): string;
     function DameTituloTipoTransporte(Tipo: integer): string;
     procedure QuitaFiltros;
     procedure FiltraCliente(Cliente: integer);
     procedure CerrarArticulos;
     procedure AbrirArticulos;
     procedure ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
     procedure FiltraAgrupacionDisponible(Filtro: string);
     procedure AbrirRedesSociales;
     procedure CerrarRedesSociales;
  end;

var
  DMClientes : TDMClientes;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, uFBusca, UDMLSTClientes, UFPregEtiCliente,
  UFormGest, UFMVentasCli, UFMain, UFMTerceros, UFMClientes, Controls, UParam,
  UDMListados, UDMLstCircularizacion;

{$R *.DFM}

procedure TDMClientes.DMClientesCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Auditoria
  QMClientes.DeleteSQL.Text := 'EXECUTE PROCEDURE DEL_VER_CLIENTES_CUENTAS(:old_EMPRESA, :old_EJERCICIO, :old_CANAL, :old_CLIENTE, ' + IntToStr(REntorno.Entrada) + ')';

  // Creamos la sentencia SQL básica para QMClientes

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);

  AsignaDisplayFormat(QMClientes, LocalMascaraN, MascaraI, ShortDateFormat);
  QMClientesDESCUENTO_PP.DisplayFormat := MascaraP;
  QMClientesPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMClientesDESCUENTO_CIAL.DisplayFormat := MascaraP;
  QMClientesPOR_PORTES.DisplayFormat := MascaraP;
  QMClientesI_PORTES.DisplayFormat := MascaraN;
  QMClientesDTO_CIAL_LINEA.DisplayFormat := MascaraP;
  QMClientesDTO_CIAL_LINEA_2.DisplayFormat := MascaraP;
  QMClientesDTO_CIAL_LINEA_3.DisplayFormat := MascaraP;

  xIRPFP_IRPF.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMDescuentosKri, LocalMascaraN, MascaraI, ShortDateFormat);
  QMDescuentosKriDTO_CIAL.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMPrecios, LocalMascaraN, MascaraI, ShortDateFormat);
  QMPreciosPRECIO.DisplayFormat := MascaraL;
  QMPreciosDESCUENTO.DisplayFormat := MascaraP;
  QMPreciosDESCUENTO_2.DisplayFormat := MascaraP;
  QMPreciosDESCUENTO_3.DisplayFormat := MascaraP;
  QMPreciosMARGEN_PC.DisplayFormat := MascaraP;
  QMPreciosMARGEN_PV.DisplayFormat := MascaraP;
  QMPreciosP_COSTE.DisplayFormat := MascaraL;

  AsignaDisplayFormat(QMDetConsumo, LocalMascaraN, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(xDocumentos, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFactCobrada, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasMensual, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasMensualCompara, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPrevisionMensual, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasAnual, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturasAnualCompara, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPrevisionAnual, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVentas, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVentasDetalle, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVentasMargenes, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetConsumo, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetConsumo, LocalMascaraN, MascaraI, ShortDateFormat);

  // Estos importes deben ir con formato DECIMALES_CALCULO de la moneda
  xVentasDetallePRECIO.DisplayFormat := LocalMascaraL;
  xVentasDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraL;
  xVentasDetalleB_DTO_LINEA.DisplayFormat := LocalMascaraL;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
  begin
     QMPrecios.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
     xVentasMargenes.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMClientes.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('CLIDESC%3.3d', [i]));

  SQLBase := TStringList.Create;
  with SQLBase do
  begin
     Add(' SELECT * FROM VER_CLIENTES_CUENTAS ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' EJERCICIO = ?EJERCICIO AND ');
     Add(' CANAL = ?CANAL ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add(' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
  end;
  QMClientes.SelectSQL.Text := SQLBase.Text;
  QMClientes.SelectSQL.Add(' ORDER BY CLIENTE ');

  TraspasoClientePotencial := False; {dji lrk kri}

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  {Latino}
  if (DMMain.EstadoKri(410) = 1) then
     xTipoNCF.Open;

  TransportistaDefecto := StrToIntDef(LeeParametro('CLITRAN001'), 0);
  if (TransportistaDefecto = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MIN(TRANSPORTISTA) FROM VER_TRANSPORTISTAS WHERE EMPRESA = ?EMPRESA ';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           TransportistaDefecto := FieldByName['MIN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

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
  end;

  if not (FMain.autcliente) then
     DMMain.FiltraTabla(QMClientes, '11100', REntorno.DatosAbiertos);
  Cambiar := False;
end;

procedure TDMClientes.DMClientesDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMClientes.QMClientesNewRecord(DataSet: TDataSet);
begin
  QMClientesEMPRESA.AsInteger := REntorno.Empresa;
  QMClientesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMClientesCANAL.AsInteger := REntorno.Canal;
  QMClientesFORMA_PAGO.AsString := LeeParametro('CLIFPAG001'); // 'CON';
  QMClientesTARIFA.AsString := REntorno.TarifaDefecto;
  QMClientesMODO_IVA.AsInteger := DMMain.DameModoIVACanal;
  QMClientesPERFIL.AsString := REntorno.Perfil;
  QMClientesPAIS.AsString := REntorno.Pais;
  QMClientesTIPO_IRPF.AsInteger := DMMain.DameMinIRPF;
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
     QMClientesAGENTE.AsInteger := DameAgenteUsuario(REntorno.Usuario)
  else
     QMClientesAGENTE.AsInteger := 1;
  QMClientesTIPO.AsInteger := 1;
  QMClientesTERCERO.AsInteger := REntorno.Tercero;
  QMClientesPORTES.AsInteger := StrToIntDef(LeeParametro('CLIPORT001'), 0); // 0;
  // Rep. Dominicana no utilizará anticipos
  if ((REntorno.Pais = 'DOM') or (REntorno.Pais = 'USA')) then
     QMClientesUSAR_ANTICIPOS.AsInteger := 0
  else
     QMClientesUSAR_ANTICIPOS.AsInteger := 1;
  QMClientesEVAL_FEB.AsInteger := 1; {dji lrk kri}
  QMClientesEVAL_FEB_SI.AsInteger := 1; {dji lrk kri}
  QMClientesFINANCIACION.AsInteger := 0;
  QMClientesMONEDA.AsString := REntorno.Moneda;
  QMClientesFACTURAR_DIRECCION.AsInteger := StrToIntDef(LeeParametro('CLIFDIR001'), 1); // 1;
  QMClientesFACTURAR_AGENTE.AsInteger := StrToIntDef(LeeParametro('CLIFAGE001'), 1); // 1;
  QMClientesFACTURAR_TRANSPORTISTA.AsInteger := StrToIntDef(LeeParametro('CLIFTRA001'), 1); // 1;
  QMClientesFACTURAR_REFERENCIA.AsInteger := StrToIntDef(LeeParametro('CLIFREF001'), 1); // 0;
  QMClientesFACTURAR_ALMACEN.AsInteger := 0;
  QMClientesFACTURAR_TARIFA.AsInteger := StrToIntDef(LeeParametro('CLIFTAR001'), 1); // 1;
  QMClientesPOR_FINANCIACION.AsFloat := 0;
  QMClientesNO_VENTA_RIESGO.AsInteger := StrToIntDef(LeeParametro('CLIFRIE001'), 1); // 1;
  QMClientesNO_AGRUPAR_PED_KRI.AsInteger := 0;
  QMClientesFACTURA_DIRECCION_ADMTVA.AsInteger := 1;
  QMClientesMOROSO.AsInteger := 0;
  QMClientesCLIENTE_POTENCIAL.AsInteger := 0;
  QMClientesCREDITO_Y_CAUCION.AsInteger := 0;
  QMClientesAPLICAR_PTO_VERDE.AsInteger := 0;
  QMClientesRIESGO_FACTOR.AsFloat := 1;
  QMClientesSIN_DESCUENTOS.AsInteger := 0;
  QMClientesINTRA.AsInteger := 0;
  QMClientesINTRA_TRANS.AsInteger := 0;
  QMClientesCODIGO_INCOTERM.AsString := 'EXW';
  QMClientesUTILIZA_F_PAGO_ALTERNATIVA.AsInteger := 0;
  QMClientesSIN_DESCUENTOS.AsInteger := 0;
  QMClientesRECC.AsInteger := REntorno.RECC;
  QMClientesEXPORTAR.AsInteger := 0;
  QMClientesPERIODO_FACTURACION.AsString := '00';
  QMClientesCLIENTE_PADRE.AsInteger := 0;
  QMClientesGRUPO_CUENTAS.AsInteger := 0;
  QMClientesCANAL_DST_PEC.AsInteger := 0;
  QMClientesSERIE_DST_PEC.AsString := '';
  QMClientesTIPO_DST_PEC.AsString := '';
  QMClientesIMPORTE_MINIMO_PORTE.AsFloat := 0;
  QMClientesALBARAN_VALORADO.AsInteger := BoolToInt(LeeParametro('CLIAVAL000') = 'S');
  QMClientesPEDIDO_VALORADO.AsInteger := BoolToInt(LeeParametro('CLIPVAL000') = 'S');
  QMClientesRUTA.AsInteger := 0;
  QMClientesRUTA_ORDEN.AsInteger := 0;
  QMClientesFACTURAS_POR_EMAIL_KRI.AsInteger := BoolToInt(LeeParametro('CLIEMLF000') = 'S');
  QMClientesPROYECTO.AsInteger := 0;
  QMClientesNO_AGRUPAR_ALBARANES.AsInteger := BoolToInt(LeeParametro('CLINAGA001') = 'S');

  // Portes
  QMClientesTIPO_PORTES.AsInteger := DMMain.EstadoKri(508);
  QMClientesI_PORTES.AsFloat := 0;
  QMClientesPOR_PORTES.AsFloat := 0;
  QMClientesBANCO_PAGOS.AsInteger := 0;
  Cambiar := False;

  QMClientesTRANSPORTISTA.AsInteger := TransportistaDefecto;

  QMClientesPAIS_C2.AsString := DamePaisC2(REntorno.Pais);
  QMClientesCUENTA_DTOPP.AsString := DMMain.DameCuentaGestion(15, 1);
  QMClientesCUENTA_DTOCIAL.AsString := DMMain.DameCuentaGestion(25);
  QMClientesCUENTA.AsString := LeeParametro('CLICUEN000');

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ZONA FROM SYS_ZONAS WHERE DEFECTO=1';
        ExecQuery;
        QMClientesZONA.AsString := FieldByName['ZONA'].AsString;
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
        SQL.Text := 'SELECT FIRST 1 TIPO_NCF FROM Z_SYS_TIPO_NCF WHERE TIPO_DOCUMENTO = 2 AND DEFECTO = 1';
        ExecQuery;
        QMClientesTIPO_NCF.AsInteger := FieldByName['TIPO_NCF'].AsInteger;
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
        QMClientesIDIOMA.AsString := FieldByName['IDIOMA'].AsString;
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
        SQL.Text := 'SELECT CTA_COMPRAS, CTA_VENTAS FROM DAME_CUENTAS_COMPRA_VENTA (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
        ExecQuery;
        QMClientesCUENTA_COMPRA.AsString := FieldByName['CTA_COMPRAS'].AsString;
        QMClientesCUENTA_VENTA.AsString := FieldByName['CTA_VENTAS'].AsString;
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
        SQL.Add(' SELECT SEPARAR_DTO_CIAL FROM SYS_EMPRESAS ');
        SQL.Add(' WHERE EMPRESA = ?EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        QMClientesSEPARAR_DTO_CIAL.AsInteger := FieldByName['SEPARAR_DTO_CIAL'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.QMClientesTERCEROChange(Sender: TField);
begin
  QMClientesTITULO.AsString := DameTituloTercero(QMClientesTERCERO.AsInteger);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P.PAIS_C2 ');
        SQL.Add(' FROM SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON (D.ID_LOCAL = L.ID_LOCAL) ');
        SQL.Add(' JOIN SYS_PAISES P ON (P.PAIS = L.PAIS) ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.TERCERO = :TERCERO AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['TERCERO'].AsInteger := QMClientesTERCERO.AsInteger;
        ExecQuery;
        QMClientesPAIS_C2.AsString := FieldByName['PAIS_C2'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.QMClientesBeforePost(DataSet: TDataSet);
var
  Semilla, Cuenta : string;
  Tipo : integer;
  Existe : boolean;
  Crea : boolean;
begin
  Tipo := QMClientesTIPO.AsInteger;
  Semilla := DMMain.DameSemillaCuentaGestion(SemClientes, Tipo);
  Cuenta := QMClientesCUENTA.AsString;
  if ((DataSet.State = dsInsert) and (QMClientesCLIENTE.AsInteger = 0)) then
     QMClientesCLIENTE.AsInteger := DMMain.Contador_E('XCL');

  // Si la cuenta está vacia o son solo los primeros digitos
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
  begin
     // Si en cuenta estan los primeros digitos de la cuenta, los utilizo como semilla
     if (Length(Cuenta + '.') = Length(Semilla)) then
        Semilla := Cuenta + '.';

     Cuenta := ExpandirCadena(Semilla + QMClientesCLIENTE.AsString);
     // Si el interfijo es diferente del nro de cliente, utilizo solo los 3 primeros numeros de la semilla
     if (DMMain.EstadoKri(326) = 1) then
     begin
        if (StrToInt(Copy(Cuenta, Length(cuenta) - Length(QMClientesCLIENTE.AsString) + 1,
           Length(QMClientesCLIENTE.AsString))) <> QMClientesCLIENTE.AsInteger) then
           Cuenta := ExpandirCadena(Copy(Semilla, 1, 3) + '.' + QMClientesCLIENTE.AsString);
     end;
  end
  else
  begin
     // Si 1, no verifica que la cuenta empiece por la semilla.
     if (DMMain.EstadoKri(325) <> 1) then
     begin
        if ((Copy(Cuenta, 1, Length(Semilla) - 1)) <>
           (Copy(Semilla, 1, Length(Semilla) - 1))) then
           raise Exception.Create(_('La cuenta introducida no es correcta'));
     end;
  end;
  QMClientesCUENTA.AsString := Cuenta;
  Cambiar := False;
  if (Length(Cuenta) > REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada excede de la estructura contable actual'));
  if (Length(Cuenta) < REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada tiene menos dígitos que la estructura contable actual'));

  // Control de que la cuenta ya existe
  if (DataSet.State = dsInsert) then
     cuentaold := '';

  if (cuentaold <> QMClientesCUENTA.AsString) then
  begin
     Crea := True;
     Existe := (DameTituloCuenta(QMClientesCUENTA.AsString) > '');

     if (Existe) and (LeeParametro('CLICUEN000') = '') then
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
              SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_GES_EXISTE(:EMPRESA, :EJERCICIO, :CANAL, :CUENTA, 0)';
              Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
              Params.ByName['CUENTA'].AsString := QMClientesCUENTA.AsString;
              ExecQuery;
              Existe := (FieldByName['EXISTE'].AsInteger >= 1);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Existe) and (LeeParametro('CLICUEN000') = '') then
        begin
           Crea := (Application.MessageBox(PChar(string(_('La cuenta ya esta usada por otro cliente, ¿quiere realmente crearlo?'))),
              PChar(string(_('Confirmación'))),
              mb_iconstop + mb_yesno) = id_yes);
        end;
     end;

     if not (Crea) then
        raise Exception.Create(_('El Cliente no ha sido creado'));
  end;

  QMClientesENTRADA.AsInteger := REntorno.Entrada;
  // MuestraRiesgos;
end;

procedure TDMClientes.QMClientesAfterOpen(DataSet: TDataSet);
begin
  QMVacaciones.Open;
  xIRPF.Open;
  // xIncidencias.Open;
  xRangos.Open;
  xIndices.Open;
end;

function TDMClientes.BusquedaCompleja: integer;
var
  Orden : string;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMClientes, '11100');

  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     with QMClientes do
     begin
        Close;
        if (Result <> mrAll) then
        begin
           Orden := OrdenadoPor;
           Ordenar('');
           if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
              SelectSQL.Add(' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
           Ordenar(Orden);
           Open;
        end
        else
        begin
           SelectSQL.Add(' ORDER BY CLIENTE ');
           SelectSQL.Text := SQLBase.Text;
           DMMain.FiltraTabla(QMClientes, '11100', True);
        end;

        Open;
     end;
  end;
end;

procedure TDMClientes.QMClientesTIPO_IRPFChange(Sender: TField);
begin
  with xIRPF do
  begin
     Close;
     Params.ByName['TIPO_IRPF'].AsInteger := Sender.AsInteger;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDMClientes.QMClientesTIPOChange(Sender: TField);
begin
  if Cambiar then
     QMClientesCUENTA.AsString := LeeParametro('CLICUEN000');
end;

procedure TDMClientes.QMClientesBeforeEdit(DataSet: TDataSet);
begin
  Cambiar := True;
  cuentaold := QMClientesCUENTA.AsString;
  Ruta_old := QMClientesRUTA.AsInteger;
  RutaOrden_old := QMClientesRUTA_ORDEN.AsInteger;
end;

procedure TDMClientes.AgrupacionRellena;
begin
  with SPRellena do
  begin
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := QMClientesCLIENTE.AsInteger;
     Params.ByName['Agrupacion'].AsString := xAgrupDisp.FieldByName('Agrupacion').AsString;
     ExecQuery;
     FreeHandle;
  end;
  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMClientes.AgrupacionVacia;
begin
  with SPVacia do
  begin
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := QMClientesCLIENTE.AsInteger;
     Params.ByName['Agrupacion'].AsString := xAgrupSon.FieldByName('Agrupacion').AsString;
     ExecQuery;
     FreeHandle;
  end;
  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

function TDMClientes.cliente: integer;
begin
  Result := QMClientesTercero.AsInteger;
end;

procedure TDMClientes.VentasCliente;
begin
  TFMVentasCli.Create(Self).MuestraCliente(QMClientesCLIENTE.AsInteger, 2);
end;

procedure TDMClientes.QMVacacionesNewRecord(DataSet: TDataSet);
begin
  QMVacacionesEMPRESA.AsInteger := QMClientesEMPRESA.AsInteger;
  QMVacacionesCLIENTE.AsInteger := QMClientesCLIENTE.AsInteger;
  QMVacacionesMES_VENCIMIENTO.AsInteger := 0;
end;

procedure TDMClientes.ActualizaVacaciones;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_VACACIONES_CLI(:EMPRESA, :EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMVacaciones.Close;
  QMVacaciones.Open;
end;

procedure TDMClientes.QMClientesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMClientes.State = dsInsert then
  begin
     QMClientesCLIENTE.Clear;
     QMClientesCUENTA.Clear;
  end;
end;

procedure TDMClientes.CambiarTercero(Tercero: integer);
begin
  with QMClientes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CLIENTES_CUENTAS ');
     SelectSQL.Add(' WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL ');
     SelectSQL.Add(' AND CLIENTE = 0 ');
     SelectSQL.Add(' ORDER BY CLIENTE');
     DMMain.FiltraTabla(QMClientes, '11100', True);
     Insert;
     FieldByName('TERCERO').AsInteger := Tercero;
  end;
end;

// *********** Procesos que se usan para el filtrado de clientes por Agrupación
procedure TDMClientes.Borra_TMP_agrupaciones;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_CLIENTES_AGRUPACION_TMP';
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
        SQL.Text := 'DELETE FROM TMP_CLIENTES_AGRUPACION';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.FiltraSeleccion;
var
  old_order, old_plan : string;
begin
  with QMClientes do
  begin
     Close;
     old_plan := Plan.Text;
     Plan.Clear;
     old_order := OrdenadoPor;
     Ordenar('');
     SelectSQL.Add(' AND (');
     SelectSQL.Add(' CLIENTE IN (SELECT AGT.CLIENTE FROM TMP_CLIENTES_AGRUPACION_TMP AGT WHERE AGT.ENTRADA = ' + REntorno.EntradaStr + ') ');
     if (HayOR = True) then
        SelectSQL.Add(' OR (CLIENTE IN (SELECT AG.CLIENTE FROM TMP_CLIENTES_AGRUPACION AG WHERE (AG.ENTRADA = ' + REntorno.EntradaStr + '))) ');
     SelectSQL.Add(') ');

     Ordenar(old_order);

     if ExisteParametro(QMClientes, 'EMPRESA') then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if ExisteParametro(QMClientes, 'EJERCICIO') then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     if ExisteParametro(QMClientes, 'CANAL') then
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
     Plan.Text := old_plan;
  end;
end;

procedure TDMClientes.Filtra_agrupaciones(Agrupacion: string; Negativo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FILTRA_TMP_CLI (:EMPRESA, :ENTRADA, :AGRUPACION, :NEG)';
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

procedure TDMClientes.Traspasa_agrupaciones;
begin
  HayOr := True;

  // Detecta que ha habido una condición OR para incluirla en el Select de QMClientes
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_TMP_CLI (:EMPRESA, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.Carga_agrupaciones(agrupacion: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CARGA_TMP_CLI (:EMPRESA, :ENTRADA, :AGRUPACION)';
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
//******************************************************************************

procedure TDMClientes.MuestraRiesgos;
var
  auxver, auxcalculo : double;
begin
  // Riesgo Actual
  DMMain.Cambios(REntorno.MonedaEmpresa, REntorno.Moneda, REntorno.FechaTrab,
     QMClientesRIESGO_ACT.AsFloat, auxver, auxcalculo);
  QMClientesRIESGO_ACT_CANAL.Value := auxver;

  // Riesgo AUT.
  DMMain.Cambios(REntorno.MonedaEmpresa, REntorno.Moneda, REntorno.FechaTrab,
     QMClientesRIESGO_AUT.AsFloat, auxver, auxcalculo);
  QMClientesRIESGO_AUT_CANAL.Value := auxver;

  // Riesgo vencido
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_RIESGO_VENCIDO(:EMPRESA, :EJERCICIO, :CANAL, :FECHA, :CLIENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH - 10;
        Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
        ExecQuery;
        QMClientesRIESGOVENCIDO.AsFloat := FieldByName['IMPORTE'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Riesgo Descuento
  // Se calculará con la fecha valor del recibo.
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_RIESGO_DESCUENTO(:EMPRESA, :EJERCICIO, :CANAL, :FECHA, :CLIENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
        ExecQuery;
        QMClientesRIESGODESCUENTO.AsFloat := FieldByName['RIESGO_DES'].AsFloat;
        QMClientesRIESGOREMPAG.AsFloat := FieldByName['RIESGO_PAG'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Se muestran los saldos de las cuentas de anticipo del cliente
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        // SQL.Text := 'select anticipo_total,anticipo_canal from dame_saldo_anticipos_cliente(?EMPRESA,?EJERCICIO,?CANAL,?COD_CLI_PRO,?FECHA)';
        SQL.Text := 'SELECT * FROM C_DAME_SALDO_CUENTA_ANT (:EMPRESA, :EJERCICIO, :CANAL, :TIPO_TERCERO, :COD_CLI_PRO, :FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO_TERCERO'].AsString := 'CLI';
        Params.ByName['COD_CLI_PRO'].AsInteger := QMClientesCLIENTE.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        ExecQuery;
        // QMClientesANTICIPO_EMP.AsFloat := FieldByName['ANTICIPO_TOTAL'].AsFloat;
        // QMClientesANTICIPO_CAN.AsFloat := FieldByName['ANTICIPO_CANAL'].AsFloat;
        QMClientesANTICIPO_EMP.AsFloat := FieldByName['SALDO'].AsFloat;
        QMClientesANTICIPO_CAN.AsFloat := FieldByName['SALDO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.ActRiesgoCliente(Cliente: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_ACT_RIESGO_CLIENTE(:CLIENTE, :EMPRESA, :MONEDA)';
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.ActRiesgoEmpresa;
var
  cant : integer;
  DS : TFIBDataSet;
  CaptionForm : string;
begin
  /// Se hacia todo mediante EXECUTE PROCEDURE E_CARTERA_ACT_RIESGO_EMPRESA(:EMPRESA)
  /// Se hace en un bucle para evitar hacerlo todo en una misma transaccion.

  CaptionForm := FMClientes.Caption;
  try
     cancelar_recalculo_riesgo := False;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(CLIENTE) FROM EMP_CLIENTES WHERE EMPRESA = ' + REntorno.EmpresaStr;
           ExecQuery;
           cant := FieldByName['COUNT'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

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
              SelectSQL.Add('SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = ' + REntorno.EmpresaStr);
              Open;
              while ((not EOF) and (not cancelar_recalculo_riesgo)) do
              begin
                 FMClientes.Caption := Format(_('Clientes - Faltan : %d'), [cant]);
                 Application.ProcessMessages;

                 ActRiesgoCliente(FieldByName('CLIENTE').AsInteger);
                 Dec(cant);
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  finally
     FMClientes.Caption := CaptionForm;
  end;

  Refrescar(QMClientes, 'ID_CLIENTE', QMClientesID_CLIENTE.AsInteger);
end;

function TDMClientes.HayDetalle(Tipo: integer): boolean;
begin
  case Tipo of
     1: Result := (xIncidencias.FieldByName('INCIDENCIA').AsInteger <> 0);
     2: Result := (xIsoCli.FieldByName('RIC').AsInteger <> 0);
     else
        Result := False;
  end;
end;

procedure TDMClientes.QMClientesTIPO_PORTESChange(Sender: TField);
begin
  {dji lrk kri - Por que borra rango e indice ???
  if ((Sender.Value=6)or(Sender.Value=5)or(Sender.Value=7)) then
    begin
      QMClientesRANGO.Clear;
      QMClientesINDICE.Clear;
    end;
}
end;

function TDMClientes.ExisteRango(Rango: integer): boolean;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RDB$DB_KEY FROM EMP_RANGOS WHERE EMPRESA = ?EMPRESA AND RANGO = ?RANGO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RANGO'].AsInteger := Rango;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.QMClientesRANGOChange(Sender: TField);
begin
  with xRangos do
  begin
     Close;
     Params.ByName['RANGO'].AsInteger := Sender.AsInteger;
     Open;
  end;
  {dji lrk kri - Por que borra indice ???
  QMClientesINDICE.Clear;
}
end;

procedure TDMClientes.QMClientesINDICEChange(Sender: TField);
begin
  with xIndices do
  begin
     Close;
     Params.ByName['INDICE'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMClientes.CargaEstadisticas(Ejercicio, Ejercicio2: integer; Moneda: string; Porcentaje: double; Tipo: string);
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
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
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;
end;

procedure TDMClientes.CierraDocumentos;
begin
  xDocumentos.Close;
  xFactCobrada.Close;
end;

procedure TDMClientes.CierraEstadisticas;
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

procedure TDMClientes.MuestraDocumentos;
begin
  PreparaMultiSeleccion;

  xDocumentos.Open;
  xFactCobrada.Open;
end;

function TDMClientes.DameCuentaPendiente: string;
begin
  Result := xDocumentosCUENTA_PEND.AsString;
end;

function TDMClientes.DameCliente: integer;
begin
  Result := QMClientesCliente.AsInteger;
end;

procedure TDMClientes.QMDescuentosKriNewRecord(DataSet: TDataSet);
begin
  QMDescuentosKriEMPRESA.AsInteger := REntorno.Empresa;
  QMDescuentosKriEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDescuentosKriCANAL.AsInteger := REntorno.Canal;
  QMDescuentosKriCLIENTE.AsInteger := QMClientesCLIENTE.AsInteger;
end;

procedure TDMClientes.QMDescuentosKriBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(ID) FROM EMP_CLIENTES_DESCUENTOS_KRI';
           ExecQuery;
           QMDescuentosKriID.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMClientes.PreparaMultiSeleccion;
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

procedure TDMClientes.ImportaClientePotencial(aClientePotencial, aTercero: integer);
begin
  ClientePotencial := aClientePotencial;
  CambiarTercero(aTercero); // Pone QMClientes en Insert
  TraspasoClientePotencial := True;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SelectSQL.Text := 'SELECT * FROM EMP_CLIENTES_POTENCIALES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := ClientePotencial;
        Open;
        QMClientesTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMClientesTARIFA.AsString := FieldByName('TARIFA').AsString;
        QMClientesFORMA_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        QMClientesDIA_PAGO_1.AsInteger := FieldByName('DIA_PAGO_1').AsInteger;
        QMClientesDIA_PAGO_2.AsInteger := FieldByName('DIA_PAGO_2').AsInteger;
        QMClientesDESCUENTO_PP.AsFloat := FieldByName('DESCUENTO_PP').AsFloat;
        QMClientesDESCUENTO_CIAL.AsFloat := FieldByName('DESCUENTO_CIAL').AsFloat;
        QMClientesAGENTE.AsInteger := FieldByName('AGENTE').AsInteger;
        QMClientesNOTAS.AsString := FieldByName('NOTAS').AsString;
        QMClientesPAIS.AsString := FieldByName('PAIS').AsString;
        QMClientesTIPO.AsInteger := FieldByName('TIPO').AsInteger;
        QMClientesPORTES.AsInteger := FieldByName('PORTES').AsInteger;
        QMClientesUSAR_ANTICIPOS.AsInteger := FieldByName('USAR_ANTICIPOS').AsInteger;
        QMClientesSU_PROVEEDOR.AsString := FieldByName('SU_PROVEEDOR').AsString;
        QMClientesEVAL_FEB.AsInteger := FieldByName('EVAL_FEB').AsInteger;
        QMClientesEVAL_FEB_SI.AsInteger := FieldByName('EVAL_FEB_SI').AsInteger;
        QMClientesMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMClientesFINANCIACION.AsInteger := FieldByName('FINANCIACION').AsInteger;
        QMClientesPOR_FINANCIACION.AsFloat := FieldByName('POR_FINANCIACION').AsFloat;
        QMClientesTRANSPORTISTA.AsInteger := FieldByName('TRANSPORTISTA').AsInteger;
        QMClientesSU_REFERENCIA.AsString := FieldByName('SU_REFERENCIA').AsString;
        QMClientesCREDITO_Y_CAUCION.AsInteger := FieldByName('CREDITO_Y_CAUCION').AsInteger;
        QMClientesNRO_EMPLEADOS.AsInteger := FieldByName('NRO_EMPLEADOS').AsInteger;
        QMClientesFACTURACION_TOTAL.AsFloat := FieldByName('FACTURACION_TOTAL').AsFloat;
        QMClientesCONSUMO_MATERIAL.AsFloat := FieldByName('CONSUMO_MATERIAL').AsFloat;
        QMClientesPROVEEDORES_HABITUALES.AsString := FieldByName('PROVEEDORES_HABITUALES').AsString;
        QMClientesRUTA.AsInteger := FieldByName('RUTA').AsInteger;
        QMClientesTIPO_CLIENTE.AsString := FieldByName('TIPO_CLIENTE').AsString;
        QMClientesINTRA.AsInteger := FieldByName('INTRA').AsInteger;
        QMClientesINTRA_TRANS.AsInteger := FieldByName('INTRA_TRANS').AsInteger;
        QMClientesPOTENCIAL_DE_COMPRA.AsFloat := FieldByName('POTENCIAL_DE_COMPRA').AsFloat;
        QMClientesPAIS_C2.AsString := FieldByName('PAIS_C2').AsString;
        QMClientesDIAS_ENTREGA.AsInteger := FieldByName('DIAS_ENTREGA').AsInteger;
        QMClientesIDIOMA.AsString := FieldByName('IDIOMA').AsString;
        QMClientesAPLICAR_PTO_VERDE.AsInteger := FieldByName('APLICAR_PTO_VERDE').AsInteger;
        QMClientesFRECUENCIA.AsInteger := FieldByName('FRECUENCIA').AsInteger;
        Close;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.QMClientesAfterPost(DataSet: TDataSet);
begin
  // Traspaso otros datos de Clientes Potenciales
  if (TraspasoClientePotencial) then
  begin
     try
        // Traspaso de incidencias
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO EMP_INCIDENCIAS( ');
              SQL.Add(' EMPRESA,TIPO_TERCERO,COD_CLI_PRO,TITULO, ');
              SQL.Add(' FECHA,FECHA_RECEPCION,TERCERO,DATOS_INCIDENCIA, ');
              SQL.Add(' FECHA_RESPUESTA,RESPUESTA_INCIDENCIA,ID_S,ID_E, ');
              SQL.Add(' DOC_EJERCICIO,DOC_CANAL,DOC_SERIE,DOC_TIPO,DOC_RIG, ');
              SQL.Add(' ENTRADA) ');
              SQL.Add(' SELECT EMPRESA,''CLI'',?CLIENTE,TITULO, ');
              SQL.Add(' FECHA,FECHA_RECEPCION,TERCERO,DATOS_INCIDENCIA, ');
              SQL.Add(' FECHA_RESPUESTA,RESPUESTA_INCIDENCIA,ID_S,ID_E, ');
              SQL.Add(' DOC_EJERCICIO,DOC_CANAL,DOC_SERIE,DOC_TIPO,DOC_RIG, ');
              SQL.Add(' ENTRADA ');
              SQL.Add(' FROM EMP_INCIDENCIAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' TIPO_TERCERO = ''POT'' AND ');
              SQL.Add(' COD_CLI_PRO = ?CLIENTE_POTENCIAL ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
              Params.ByName['CLIENTE_POTENCIAL'].AsInteger := ClientePotencial;
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
              SQL.Add(' DELETE FROM EMP_INCIDENCIAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' TIPO_TERCERO = ''POT'' AND ');
              SQL.Add(' COD_CLI_PRO = ?CLIENTE_POTENCIAL ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE_POTENCIAL'].AsInteger := ClientePotencial;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Traspaso de agrupaciones
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO EMP_AGRUPACIONES_CLI ( ');
              SQL.Add(' EMPRESA, AGRUPACION, CLIENTE) ');
              SQL.Add(' SELECT EMPRESA, AGRUPACION, ?CLIENTE FROM EMP_AGRUPACIONES_POT ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CLIENTE = ?CLIENTE_POTENCIAL ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
              Params.ByName['CLIENTE_POTENCIAL'].AsInteger := ClientePotencial;
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
              SQL.Add(' DELETE FROM EMP_AGRUPACIONES_CLI ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CLIENTE = ?CLIENTE_POTENCIAL ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE_POTENCIAL'].AsInteger := ClientePotencial;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Finalmente borro el cliente potencial
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' DELETE FROM EMP_CLIENTES_POTENCIALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CLIENTE = ?CLIENTE_POTENCIAL ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE_POTENCIAL'].AsInteger := ClientePotencial;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        TraspasoClientePotencial := False;
     except
        on e: Exception do
           MessageDlg(_('Error traspasando incidencias') + #13#10 + e.Message, mtError, [mbOK], 0);
     end;
  end;

  // Si cambia la ruta refresco datos porque se reordena el resto de clientes
  if ((Ruta_old <> QMClientesRUTA.AsInteger) or (RutaOrden_old <> QMClientesRUTA_ORDEN.AsInteger)) then
     Refrescar(QMClientes, 'ID_CLIENTE', QMClientesID_CLIENTE.AsInteger);
end;

procedure TDMClientes.QMClientesFECHA_ULT_COMPRA_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 FECHA FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ((EJERCICIO = :EJERCICIO) OR (EJERCICIO = :EJERCICIO - 1)) AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' CLIENTE = :CLIENTE AND ');
        SQL.Add(' TIPO = ''ALB'' ');
        SQL.Add(' ORDER BY FECHA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
        ExecQuery;

        if (FieldByName['FECHA'].AsDateTime > 0) then
           Text := DateToStr(FieldByName['FECHA'].AsDateTime)
        else
           Text := '';

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.QMClientesIMPAGADOS_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((QMClientes.Active) and (QMClientes.State = dsBrowse)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SALDO FROM DAME_SALDO_IMPAGADO_CLIENTE(:EMPRESA, :EJERCICIO, :CANAL, :CUENTA)';
           Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
           Params.ByName['CUENTA'].AsString := '4315' + Trim(Copy(QMClientesCUENTA.AsString, 5, Length(Trim(QMClientesCUENTA.AsString)) - 4));
           ExecQuery;
           Text := FormatFloat(LocalMascaraN, FieldByName['SALDO'].AsFloat);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMClientes.xComunicacionesNewRecord(DataSet: TDataSet);
begin
  xComunicacionesEMPRESA.AsInteger := QMClientesEMPRESA.AsInteger;
  xComunicacionesTIPO.AsString := 'CLI';
  xComunicacionesCOD_CLI_PRO.AsInteger := QMClientesCLIENTE.AsInteger;
  xComunicacionesDESCRIPCION.AsString := '';
  xComunicacionesFECHA_CREACION.AsDateTime := Now;
  xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
end;

procedure TDMClientes.xComunicacionesBeforePost(DataSet: TDataSet);
var
  DirectorioPlantilla, Directorio : string;
  Fichero, Extension : string;
  Contador : integer;
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CONTA_COMUNICACIONES', 'ID');

     {Fichero := DirInicial \ Empresa \ Tipo \ Cliente \ archivo[-nnn].ext}
     DirectorioPlantilla := DMMain.DameDirectorioComunicaciones('CLI');
     Directorio := DMMain.DameDirectorioCodCliPro('CLI', xComunicacionesCOD_CLI_PRO.AsInteger);
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

procedure TDMClientes.RegenerarCondicionesSegunProtocolo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_PROPAGA_PROTOCOLO (:EMPRESA, :EJERCICIO, :CANAL, :PROTOCOLO, :TIPO, :CLIENTE)';
        Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
        Params.ByName['TIPO'].AsString := ''; {Todas las condiciones}
        Params.ByName['PROTOCOLO'].AsString := QMClientesPROTOCOLO.AsString;
        Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMPrecios do
  begin
     if Active then
        Close;
     Open;
  end;
end;

procedure TDMClientes.QMDetConsumoDescAgrupacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloAgrupacion('T', QMDetConsumoAGRUPACION.AsString);
end;

procedure TDMClientes.QMDetConsumoNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMDetConsumoEMPRESA.AsInteger := REntorno.Empresa;
  QMDetConsumoEJERCICIO.AsInteger := QMClientesEJERCICIO.AsInteger;
  QMDetConsumoCLIENTE.AsInteger := QMClientesCLIENTE.AsInteger;
  QMDetConsumoTERCERO.AsInteger := QMClientesTERCERO.AsInteger;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM EMP_CLIENTES_CONSUMO WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CLIENTE=?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
        ExecQuery;
        QMDetConsumoLINEA.AsInteger := Fields[0].AsInteger + 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMClientes.QMDetConsumoAGRUPACIONChange(Sender: TField);
begin
  QMDetConsumoDescAgrupacion.AsString := DameTituloAgrupacion('T', QMDetConsumoAGRUPACION.AsString);
end;

procedure TDMClientes.ExportarClientesFiltrados;
var
  Cliente : integer;
  s : string;
  tsClientes : TStrings;
  Q : THYFIBQuery;
begin
  tsClientes := TStringList.Create;
  try
     with QMClientes do
     begin
        DisableControls;
        Cliente := QMClientesCLIENTE.AsInteger;
        First;
        while not EOF do
        begin
           {
           Ejemplo: 43;T;910;BAZAR DEL TRAILER;C/.SOFRE,P-140,NV.2-A/POLG.RIU;-CLAR;43006;TARRAGONA;ESPAÑA;5;0;39687260R;0;N

              43    : N° province (43 ESPAÑA)
              T     : 1° lettre nom client
              910   : N° ordre (donné à la création manuellement - pas compteur auto)
              -CLAR : 2° ligne adresse - attention chaque ligne d'adresse doit avoir 30 caractères maximum tout comme le nom du client
              5     : Code paiement (apparait automatiquement à la saise de commande - peut être changé pour une cde donnée)
              0     : Nbe J paiement (apparait automatiquement à la saise de commande - peut être changé pour une cde donnée)
              O     : TVA normale (O,N) (apparait automatiquement à la saise de commande - peut être changé pour une cde donnée)
              N     :  Req. equivalence (TVA 2°) (apparait automatiquement à la saise de commande - peut être changé pour une cde donnée.)
           }
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT T.NIF, D.DIR_NOMBRE, D.DIR_NOMBRE_2, L.TITULO AS TITULO_LOCALIDAD, L.CODIGO_POSTAL, P.TITULO AS TITULO_PAIS');
                 SQL.Add(' FROM SYS_TERCEROS T ');
                 SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ');
                 SQL.Add(' ON T.TERCERO = D.TERCERO ');
                 SQL.Add(' JOIN SYS_LOCALIDADES L ');
                 SQL.Add(' ON D.ID_LOCAL = L.ID_LOCAL ');
                 SQL.Add(' JOIN SYS_PAISES P ');
                 SQL.Add(' ON L.PAIS = P.PAIS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' T.TERCERO = ?TERCERO AND ');
                 SQL.Add(' D.DIR_DEFECTO = 1 ');
                 Params.ByName['TERCERO'].AsInteger := QMClientes.FieldByName('TERCERO').AsInteger;
                 ExecQuery;
                 s := '';
                 s := s + '43' + ';'; // N° province (43 ESPAÑA)
                 s := s + Copy(QMClientes.FieldByName('TITULO').AsString, 1, 1) + ';'; // 1° lettre nom client
                 s := s + Copy(QMClientes.FieldByName('SU_REFERENCIA').AsString, 4, 3) + ';';
                 s := s + Trim(QMClientes.FieldByName('TITULO').AsString) + ';';
                 s := s + Trim(Q.FieldByName['DIR_NOMBRE'].AsString) + ';';
                 s := s + Trim(Q.FieldByName['DIR_NOMBRE_2'].AsString) + ';';
                 s := s + Q.FieldByName['CODIGO_POSTAL'].AsString + ';';
                 s := s + Trim(Q.FieldByName['TITULO_LOCALIDAD'].AsString) + ';';
                 s := s + Trim(Q.FieldByName['TITULO_PAIS'].AsString) + ';';
                 s := s + Copy(QMClientes.FieldByName('FORMA_PAGO').AsString, 1, 1) + ';'; // Forma de Pago (Primer dígito)
                 if (Trim(Copy(QMClientes.FieldByName('FORMA_PAGO').AsString, 2, 2)) > '') then
                    s := s + Trim(Copy(QMClientes.FieldByName('FORMA_PAGO').AsString, 2, 2)) + ';' // Forma de Pago (Segundos dígitos, ¿dias de pago?)
                 else
                    s := s + ';'; // Forma de Pago (Segundos dígitos)
                 s := s + Trim(Q.FieldByName['NIF'].AsString) + ';';
                 s := s + '0' + ';'; // ??? - TVA normale (O ou N)
                 s := s + 'N' + ';'; // ??? - Req. équivalence (O ou N)
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;

           tsClientes.Add(s);

           Next;
        end;

        tsClientes.SaveToFile(REntorno.DirectorioLector + 'client.txt');

        // Vuelvo a posicionar el cliente
        while ((not BOF) and (QMClientesCLIENTE.AsInteger <> Cliente)) do
           Prior;
        EnableControls;
     end;
  finally
     tsClientes.Free;
  end;

  ShowMessage(Format(_('Ficheros creados en %s'), [REntorno.DirectorioLector]));
end;

procedure TDMClientes.ExportarDirCliFiltrados;
var
  Cliente : integer;
  s : string;
  tsClientes : TStrings;
  DS : TFIBDataSet;
begin
  tsClientes := TStringList.Create;
  try
     with QMClientes do
     begin
        DisableControls;
        try
           Cliente := QMClientesCLIENTE.AsInteger;
           First;
           while not EOF do
           begin
              {
              N° client C 6 (Su referencia)
              Nº adresse N 2,0
              Nom C 30
              Adresse ligne 1 C 30
              Adresse ligne 2 C 30
              Code postal C 5
              Ville C 30
              Pays C 25
           }

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
                       SelectSQL.Add(' select cl.su_referencia as n_client, di.direccion as n_adresse,te.nombre_r_social as nom, di.dir_completa as ligne_1,');
                       SelectSQL.Add(' di.dir_nombre_2 as ligne_2, lo.codigo_postal as code_postal, lo.titulo as ville, pa.titulo as pays ');
                       SelectSQL.Add(' from emp_clientes cl ');
                       SelectSQL.Add(' join sys_terceros te on (te.tercero=cl.tercero) ');
                       SelectSQL.Add(' join sys_terceros_direcciones di on (te.tercero=di.tercero) ');
                       SelectSQL.Add(' join sys_localidades lo on (di.id_local=lo.id_local) ');
                       SelectSQL.Add(' join sys_paises pa on (pa.pais=lo.pais)');
                       SelectSQL.Add(' where ');
                       SelectSQL.Add(' te.tercero = ?TERCERO ');
                       SelectSQL.Add(' order by di.direccion ');
                       Params.ByName['TERCERO'].AsInteger := QMClientes.FieldByName('TERCERO').AsInteger;
                       Open;

                       while not EOF do
                       begin
                          s := '';
                          s := s + Copy(Trim(DS.FieldByName('N_CLIENT').AsString), 1, 6) + ';';
                          s := s + Format('%.2d', [DS.FieldByName('N_ADRESSE').AsInteger]) + ';';
                          s := s + Copy(Trim(DS.FieldByName('NOM').AsString), 1, 30) + ';';
                          s := s + Copy(Trim(DS.FieldByName('ligne_1').AsString), 1, 30) + ';';
                          s := s + Copy(Trim(DS.FieldByName('ligne_2').AsString), 1, 30) + ';';
                          s := s + Copy(Trim(DS.FieldByName('code_postal').AsString), 1, 5) + ';';
                          s := s + Copy(Trim(DS.FieldByName('ville').AsString), 1, 30) + ';';
                          s := s + Copy(Trim(DS.FieldByName('pays').AsString), 1, 25) + ';';

                          tsClientes.Add(s);
                          Next;
                       end;
                       Close;
                       Transaction.Commit;
                    finally
                       Transaction.Free;
                    end;
                 end;
              finally
                 FreeAndNil(DS);
              end;
              Next;
           end;

           tsClientes.SaveToFile(REntorno.DirectorioLector + 'commande_adl.txt');

           // Vuelvo a posicionar el cliente
           while ((not BOF) and (QMClientesCLIENTE.AsInteger <> Cliente)) do
              Prior;
        finally
           EnableControls;
        end;
     end;
  finally
     tsClientes.Free;
  end;

  ShowMessage(Format(_('Ficheros creados en %s'), [REntorno.DirectorioLector]));
end;

procedure TDMClientes.AsignaTarifa(Tarifa: string);
begin
  with QMClientes do
  begin
     DisableControls;
     try
        // Bucle que modifica las tarifas de los clientes que vamos recorriendo
        First;
        while (not EOF) do
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE EMP_CLIENTES SET TARIFA = :TARIFA WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE AND TARIFA <> :TARIFA';
                 Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
                 Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
                 Params.ByName['TARIFA'].AsString := Tarifa;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  // Refresco y reposiciono registro
  Refrescar(QMClientes, 'CLIENTE', QMClientesCLIENTE.AsInteger);
end;

procedure TDMClientes.QMCentroAdministrativoNewRecord(DataSet: TDataSet);
begin
  QMCentroAdministrativoEMPRESA.AsInteger := QMClientesEMPRESA.AsInteger;
  QMCentroAdministrativoCLIENTE.AsInteger := QMClientesCLIENTE.AsInteger;
  QMCentroAdministrativoTERCERO.AsInteger := QMClientesTERCERO.AsInteger;
  QMCentroAdministrativoDIRECCION.AsInteger := 0;
end;

procedure TDMClientes.QMCentroAdministrativoTITULO_ROLGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_ROLES_CENTRO_ADM WHERE ROL = :ROL';
        Params.ByName['ROL'].AsString := QMCentroAdministrativoROL_CENTRO_ADMINISTRATIVO.AsString;
        ExecQuery;
        Text := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.AbreFacturaElectronica;
begin
  QMCentroAdministrativo.Open;
  xTipoGiro.Open;
end;

procedure TDMClientes.CierraFacturaElectronica;
begin
  QMCentroAdministrativo.Close;
  xTipoGiro.Close;
end;

procedure TDMClientes.QMCentroAdministrativoTITULO_DIRECCIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCentroAdministrativoDIRECCION.AsInteger = 0) then
     Text := _('Para todas las direcciones')
  else
     Text := DameDireccionTercero(QMCentroAdministrativoTERCERO.AsInteger, QMCentroAdministrativoDIRECCION.AsInteger);
end;

procedure TDMClientes.QMClientesBeforeClose(DataSet: TDataSet);
begin
  if (IDTiendaPrestashop <> 0) then
     QMPrestaShop.Close;
end;

procedure TDMClientes.FiltraVentas(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; Pendientes: boolean; CampoOrdenDetalleVentas, CampoOrdenMargenesVentas: string; CalcularMargenes: boolean);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');
  if (LeeParametro('BUSASTR002') = 'S') then
     Descripcion := StringReplace(Descripcion, ' ', '%', [rfReplaceAll]);

  with xVentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.*, N.NOMBRE, N.NIF, N.DIRECCION DIR_NOMBRE, N.C_POSTAL, N.LOCALIDAD, N.PROVINCIA, N.PAIS, N.TELEFONO01, ');
     SelectSQL.Add('        N.TELEFONO02, N.TELEFAX, N.EMAIL, N.NOMBRE_CONTACTO, CC.TITULO COMO_NOS_CONOCIERON ');
     SelectSQL.Add(' FROM GES_CABECERAS_S C ');
     SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S_FAC_NIF N ON C.ID_S = N.ID_S AND C.TIPO = N.TIPO ');
     SelectSQL.Add(' LEFT JOIN SYS_COMO_NOS_CONOCIERON CC ON N.COMO_NOS_CONOCIERON = CC.MODO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' C.TERCERO = :TERCERO /* PARA UTILIZAR INDICES */ ');
     SelectSQL.Add(' AND C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND C.SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND C.TIPO = :DOCTIPO ');
     if Pendientes and ((TipoDocumento = 'OFC') or (TipoDocumento = 'PEC') or (TipoDocumento = 'ALB')) then
        SelectSQL.Add(' AND C.ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY C.FECHA DESC, C.RIG ');

     Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMClientesTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
     if (Serie <> ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     Open;
  end;

  with xVentasDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.SU_REFERENCIA, C.FORMA_PAGO, C.CAMPANYA, C.ESTADO, ');
     SelectSQL.Add('        C.POR_FINANCIACION, C.PORTES, C.TARIFA, C.FECHA_ENTREGA, C.IDIOMA, C.CONTACTO, C.ADJUNTO, C.I_PORTES, ');
     SelectSQL.Add('        C.POR_PORTES, C.TIPO_PORTES, C.RANGO, C.INDICE, C.CAMBIO_FIJO, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION, ');
     SelectSQL.Add('        C.TRANSPORTISTA, C.BANCO, D.*, CC.CODIGO_CLIENTE, ');
     SelectSQL.Add('        CASE C.TIPO ');
     SelectSQL.Add('          WHEN ''PEC'' THEN ');
     SelectSQL.Add('              DP.U_PENDIENTES ');
     SelectSQL.Add('          WHEN ''ALB'' THEN ');
     SelectSQL.Add('              DA.UNIDADES_A_FACTURAR ');
     SelectSQL.Add('          ELSE 0 ');
     SelectSQL.Add('        END AS U_PENDIENTES ');
     SelectSQL.Add(' FROM GES_CABECERAS_S C ');
     SelectSQL.Add(' JOIN GES_DETALLES_S D ');
     SelectSQL.Add(' ON C.ID_S = D.ID_S ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_CODCLI CC ');
     SelectSQL.Add(' ON C.EMPRESA = CC.EMPRESA AND D.ARTICULO = CC.ARTICULO AND C.CLIENTE = CC.CLIENTE ');
     SelectSQL.Add(' LEFT JOIN GES_DETALLES_S_PED DP ');
     SelectSQL.Add(' ON D.ID_DETALLES_S = DP.ID_DETALLES_S ');
     SelectSQL.Add(' LEFT JOIN GES_DETALLES_S_ALB DA ');
     SelectSQL.Add(' ON D.ID_DETALLES_S = DA.ID_DETALLES_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' C.TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND C.SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND C.TIPO = :DOCTIPO ');
     if (Articulo <> '') then
        SelectSQL.Add(' AND D.ARTICULO = :ARTICULO ');
     if (Descripcion <> '') then
        SelectSQL.Add(' AND UPPER(D.TITULO) LIKE UPPER(:DESCRIPCION) ');
     if Pendientes and (TipoDocumento = 'PEC') then
        SelectSQL.Add(' AND C.ESTADO = 0 AND DP.SERVIDO = 0 ');
     if Pendientes and (TipoDocumento = 'ALB') then
        SelectSQL.Add(' AND C.ESTADO = 0 AND DA.UNIDADES_FACTURADAS <> D.UNIDADES ');
     if (CampoOrdenDetalleVentas = '') then
        SelectSQL.Add(' ORDER BY C.FECHA DESC, C.RIG, D.ORDEN ')
     else
     begin
        if (StrToIntDef(CampoOrdenDetalleVentas, 0) > 0) then
           SelectSQL.Add(' ORDER BY ' + CampoOrdenDetalleVentas)
        else
           SelectSQL.Add(' ORDER BY ' + IntToStr(ABS(StrToIntDef(CampoOrdenDetalleVentas, 0))) + ' DESC');
     end;

     Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMClientesTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
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

  with xVentasMargenes do
  begin
     Close;
     {$IFDEF Debug}
     SelectSQL.SaveToFile(DameTempPath+'\xVentasMargenes.sql');
     {$ENDIF}

     Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
     Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
     Params.ByName['SERIE'].AsString := Serie;
     {
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     }
     Params.ByName['DOCTIPO'].AsString := 'ALB';

     if CalcularMargenes then
        Open;
  end;
end;

procedure TDMClientes.ActualizaConfiguracionCliente(ClienteOrigen: integer);

  procedure AgregaCampo(SQL: TStrings; Campo: string);
  begin
     SQL.Add(' ,' + Campo + ' = (SELECT ' + Campo + ' ');
     SQL.Add('                   FROM VER_CLIENTES_CUENTAS ');
     SQL.Add('                   WHERE ');
     SQL.Add('                   EMPRESA = :EMPRESA AND ');
     SQL.Add('                   EJERCICIO = :EJERCICIO AND ');
     SQL.Add('                   CANAL = :CANAL AND ');
     SQL.Add('                   CLIENTE = :CLIENTE_ORIGEN) ');
  end;

begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CLIENTES_CUENTAS ');
        SQL.Add(' SET ');
        SQL.Add(' CLIENTE = CLIENTE ');
        AgregaCampo(SQL, 'FACTURA_DIRECCION_ADMTVA');
        AgregaCampo(SQL, 'FACTURAR_AGENTE');
        AgregaCampo(SQL, 'FACTURAR_TRANSPORTISTA');
        AgregaCampo(SQL, 'FACTURAR_REFERENCIA');
        AgregaCampo(SQL, 'FACTURAR_ALMACEN');
        AgregaCampo(SQL, 'FACTURAR_TARIFA');
        AgregaCampo(SQL, 'ALBARAN_DIRECCION_ENVIO');
        AgregaCampo(SQL, 'NO_ALB_FAC');
        AgregaCampo(SQL, 'NO_VENTA_RIESGO');
        AgregaCampo(SQL, 'FACTURAR_SERIE');
        AgregaCampo(SQL, 'SERIE_A_FACTURAR');
        AgregaCampo(SQL, 'POR_FINANCIACION');
        AgregaCampo(SQL, 'TIPO_IRPF');
        AgregaCampo(SQL, 'PERIODO_FACTURACION');
        AgregaCampo(SQL, 'NO_CALC_DESC_KRI');
        AgregaCampo(SQL, 'NO_AGRUPAR_PED_KRI');
        AgregaCampo(SQL, 'FACTURAS_POR_EMAIL_KRI');
        AgregaCampo(SQL, 'DIR_DEFECTO_VENTAS');
        AgregaCampo(SQL, 'FECHA_ENTREGA_X_STOCK');
        AgregaCampo(SQL, 'UTILIZA_F_PAGO_ALTERNATIVA');
        AgregaCampo(SQL, 'FINANCIACION');
        SQL.Add(' WHERE EMPRESA = :EMPRESA and ');
        SQL.Add('       EJERCICIO = :EJERCICIO and ');
        SQL.Add('       CANAL = :CANAL and ');
        SQL.Add('       CLIENTE = :CLIENTE_DESTINO ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE_ORIGEN'].AsInteger := ClienteOrigen;
        Params.ByName['CLIENTE_DESTINO'].AsInteger := QMClientesCLIENTE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMClientes.Refresh;
end;

procedure TDMClientes.ImprimirCartaLOPD(Modo: integer; MedianteClienteCorreo, MuestraCuerpo: boolean);
var
  CuerpoMail : TStrings;
  Archivo : string;
begin
  AbreData(TDMLstClientes, DMLstClientes);

  Archivo := _('CartaLOPD') + '-' + QMClientesNIF.AsString + '.pdf';
  DMLstClientes.MuestraCartaLOPD(Modo, QMClientesCLIENTE.AsInteger, Archivo);
  CierraData(DMLstClientes);

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
        CuerpoMail.Add('Correspondiente al documento: ' + _('Carta de consentimiento del uso de datos'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Carta de consentimiento del uso de datos'));

        if MedianteClienteCorreo then
           DMListados.SendMailTerceroPDF2(QMClientes.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de consentimiento del uso de datos'), 'TER', QMClientes.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMClientes.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de consentimiento del uso de datos'), 'TER', QMClientes.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TDMClientes.xTipoGiroNewRecord(DataSet: TDataSet);
begin
  xTipoGiroEMPRESA.AsInteger := QMClientesEMPRESA.AsInteger;
  xTipoGiroCLIENTE.AsInteger := QMClientesCLIENTE.AsInteger;
end;

procedure TDMClientes.xTipoGiroAfterPost(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', xTipoGiroCODIGO_GIRO.AsInteger);
end;

procedure TDMClientes.xTipoGiroAfterDelete(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', 0);
end;

procedure TDMClientes.AbrirDatosFacturacion;
begin
  QMPrestaShop.Close;
  QMPrestaShop.Params.ByName['ID_CONFIGURACION'].AsInteger := IDTiendaPrestashop;
  QMPrestaShop.Open;
end;

procedure TDMClientes.CerrarDatosFacturacion;
begin
  QMPrestaShop.Close;
end;

procedure TDMClientes.AbrirConsumos;
begin
  QMDetConsumo.Open;
end;

procedure TDMClientes.CerrarConsumos;
begin
  QMDetConsumo.Close;
end;

procedure TDMClientes.AbrirDescuentos;
begin
  QMDescuentosKri.Open;
end;

procedure TDMClientes.CerrarDescuentos;
begin
  QMDescuentosKri.Close;
end;

procedure TDMClientes.AbrirPrecios;
begin
  QMPrecios.Open;
end;

procedure TDMClientes.CerrarPrecios;
begin
  QMPrecios.Close;
end;

procedure TDMClientes.AbrirIso;
begin
  xIsoCli.Open;
end;

procedure TDMClientes.CerrarIso;
begin
  xIsoCli.Close;
end;

function TDMClientes.DameTituloTipoTercero(Tipo: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_TIPOS_TERCERO WHERE TIPO = :TIPO';
        Params.ByName['TIPO'].AsInteger := Tipo;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMClientes.DameTituloPaisC2(Pais: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_PAISES WHERE PAIS_C2 = :PAIS_C2';
        Params.ByName['PAIS_C2'].AsString := Pais;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMClientes.DameTituloTipoTransporte(Tipo: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_TIPOS_TRANSPORTE WHERE TIPO = :TIPO';
        Params.ByName['TIPO'].AsInteger := Tipo;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMClientes.AbrirAgrupaciones;
begin
  xAgrupSon.Open;
  xAgrupDisp.Open;
end;

procedure TDMClientes.CerrarAgrupaciones;
begin
  xAgrupSon.Close;
  xAgrupDisp.Close;
end;

procedure TDMClientes.QMClientesRIESGO_AUTChange(Sender: TField);
begin
  QMClientesRIESGO_AUT.AsFloat := (QMClientesRIESGO_EMP.AsFloat + QMClientesRIESGO_CYC.AsFloat) * QMClientesRIESGO_FACTOR.AsFloat;
  QMClientesRIESGO_PENDIENTE.AsFloat := QMClientesRIESGO_AUT.AsFloat - QMClientesRIESGO_ACT.AsFloat;
  QMClientesRIESGO_PENDIENTE_PED.AsFloat := QMClientesRIESGO_AUT.AsFloat - QMClientesRIESGO_ACT.AsFloat - QMClientesRIESGO_PED.AsFloat;
end;

procedure TDMClientes.QMClientesCalcFields(DataSet: TDataSet);
begin
  QMClientesRIESGO_PED.AsFloat := DMMain.DameRiesgoPedido(QMClientesCLIENTE.AsInteger);
  QMClientesRIESGO_PENDIENTE.AsFloat := QMClientesRIESGO_AUT.AsFloat - QMClientesRIESGO_ACT.AsFloat;
  QMClientesRIESGO_PENDIENTE_PED.AsFloat := QMClientesRIESGO_AUT.AsFloat - QMClientesRIESGO_ACT.AsFloat - QMClientesRIESGO_PED.AsFloat;
  QMClientesRIESGO_ACT_PED.AsFloat := QMClientesRIESGO_ACT.AsFloat + QMClientesRIESGO_PED.AsFloat;
end;

procedure TDMClientes.xAvisosNewRecord(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'CLI';
  xAvisosID_OBJETO.AsInteger := QMClientesID_CLIENTE.AsInteger;
  xAvisosACTIVO_OFC.AsInteger := 1;
  xAvisosACTIVO_PEC.AsInteger := 1;
  xAvisosACTIVO_ALB.AsInteger := 1;
  xAvisosACTIVO_FAC.AsInteger := 1;
end;

procedure TDMClientes.xAvisosBeforePost(DataSet: TDataSet);
begin
  xAvisosTIPO_OBJETO.AsString := 'CLI';
  xAvisosID_OBJETO.AsInteger := QMClientesID_CLIENTE.AsInteger;
end;

procedure TDMClientes.CerrarAvisos;
begin
  xAvisos.Close;
end;

procedure TDMClientes.AbrirAvisos;
begin
  xAvisos.Open;
end;

procedure TDMClientes.FiltraCliente(Cliente: integer);
begin
  with QMClientes do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     if (Cliente <> 0) then
        SelectSQL.Add(format(' AND CLIENTE = %d', [Cliente]));
     SelectSQL.Add(' ORDER BY CLIENTE ');
     DMMain.FiltraTabla(QMClientes, '11100');
  end;
end;

procedure TDMClientes.QuitaFiltros;
begin
  with QMClientes do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     SelectSQL.Add(' ORDER BY CLIENTE ');
     DMMain.FiltraTabla(QMClientes, '11100');
  end;
end;

procedure TDMClientes.QMClientesRUTAChange(Sender: TField);
begin
  if (QMClientesRUTA.AsInteger = 0) then
     QMClientesRUTA_ORDEN.AsInteger := 0
  else
  begin
     if (QMClientesRUTA_ORDEN.AsInteger = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(RUTA_ORDEN) FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND RUTA = :RUTA AND CLIENTE <> :CLIENTE';
              Params.ByName['EMPRESA'].AsInteger := QMClientesEMPRESA.AsInteger;
              Params.ByName['RUTA'].AsInteger := QMClientesRUTA.AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMClientesCLIENTE.AsInteger;
              ExecQuery;
              QMClientesRUTA_ORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMClientes.CerrarArticulos;
begin
  QMCliArt.Close;
end;

procedure TDMClientes.AbrirArticulos;
begin
  QMCliArt.Open;
end;

procedure TDMClientes.QMCliArtNewRecord(DataSet: TDataSet);
begin
  QMCliArtEMPRESA.AsInteger := QMClientesEMPRESA.AsInteger;
  QMCliArtCLIENTE.AsInteger := QMClientesCLIENTE.AsInteger;
end;

procedure TDMClientes.QMCliArtBeforePost(DataSet: TDataSet);
begin
  QMCliArtCODIGO_CLIENTE.AsString := UpperCase(Trim(QMCliArtCODIGO_CLIENTE.AsString));
end;

procedure TDMClientes.QMCliArtARTICULOChange(Sender: TField);
begin
  QMCliArtTITULO_ARTICULO.AsString := DameTituloArticulo(QMCliArtARTICULO.AsString);
end;

procedure TDMClientes.ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo, MuestraCuerpo: boolean);
var
  CuerpoMail : TStrings;
  Archivo : string;
  FDesde, FHasta : TDateTime;
begin

  Archivo := format(_('CircularizacionCliente_%d.pdf'), [QMClientesCLIENTE.AsInteger]);
  DameMinMax('EJE', FDesde, FHasta);
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  DMLstCircularizacion.MostrarListadoCliente(Modo, QMClientesCLIENTE.AsInteger, FDesde, FHasta, Archivo);
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
           DMListados.SendMailTerceroPDF2(QMClientes.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMClientes.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMClientes.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMClientes.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TDMClientes.CerrarVentas;
begin
  xVentas.Close;
  xVentasDetalle.Close;
  xVentasMargenes.Close;
end;

procedure TDMClientes.FiltraAgrupacionDisponible(Filtro: string);
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
     SelectSQL.Add(' TIPO = ''C'' AND ');
     SelectSQL.Add(' AGRUPACION NOT IN (SELECT AGRUPACION ');
     SelectSQL.Add('                    FROM EMP_AGRUPACIONES_CLI ');
     SelectSQL.Add('                    WHERE ');
     SelectSQL.Add('                    EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('                    CLIENTE = :CLIENTE) ');
     SelectSQL.Add(' ORDER BY AGRUPACION ');
     Open;
  end;
end;

procedure TDMClientes.QMRedesSocialesNewRecord(DataSet: TDataSet);
begin
  QMRedesSocialesTERCERO.AsInteger := QMClientesTERCERO.AsInteger;
  QMRedesSocialesROL.AsString := 'CLI';
  QMRedesSocialesURL.AsString := '';
end;

procedure TDMClientes.AbrirRedesSociales;
begin
  QMRedesSociales.Open;
end;

procedure TDMClientes.CerrarRedesSociales;
begin
  QMRedesSociales.Close;
end;

procedure TDMClientes.QMRedesSocialesID_RED_SOCIALChange(Sender: TField);
begin
  if (QMRedesSociales.State = dsEdit) then
  begin
     ShowMessage(_('No se puede modificar el ID'));
     QMRedesSociales.Cancel;
  end;

  QMRedesSocialesNOMBRE.AsString := DameRedSocial(QMRedesSocialesID_RED_SOCIAL.AsInteger);
end;

end.
