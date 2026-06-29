unit UDMFacturas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, Dialogs, Math, UHYReport, Controls, FIBDataSetRO, HYFIBQuery, IdFTP, IdFTPCommon,
  IdComponent, XMLDoc, XMLIntf, ComObj;

type
  TDMFacturas = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetallePIEZAS_X_BULTO: TIntegerField;
     QMDetalleBULTOS: TIntegerField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleCOMISION: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_COMISION: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleI_COMISION: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     xDirecciones: TFIBDataSetRO;
     DSxDirecciones: TDataSource;
     xInfoActualizada: TFIBDataSet;
     DSxInfoActualizada: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraFECHA_ENTREGA_MANUAL: TDateTimeField;
     QMCabeceraFECHA_RECOGIDA_MANUAL: TDateTimeField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraBULTOS: TIntegerField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraM_BRUTO: TFloatField;
     QMCabeceraC_TOTAL: TFloatField;
     QMCabeceraAGENTE: TIntegerField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraB_COMISION: TFloatField;
     QMCabeceraI_COMISION: TFloatField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraTRANSPORTISTA: TIntegerField;
     QMCabeceraI_BASE_RETENCION: TFloatField;
     QMCabeceraP_RETENCION: TFloatField;
     QMCabeceraI_RETENCION: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMDetalleENTRADA: TIntegerField;
     EntornoDoc: TEntornoFind2000;
     xInfoActualizadaBULTOS: TIntegerField;
     xInfoActualizadaI_DTO_LINEAS: TFloatField;
     xInfoActualizadaS_BASES: TFloatField;
     xInfoActualizadaS_CUOTA_IVA: TFloatField;
     xInfoActualizadaS_CUOTA_RE: TFloatField;
     xInfoActualizadaB_DTO_LINEAS: TFloatField;
     xInfoActualizadaB_COMISION: TFloatField;
     xInfoActualizadaI_COMISION: TFloatField;
     xInfoActualizadaI_FINANCIACION: TFloatField;
     xInfoActualizadaLIQUIDO: TFloatField;
     xInfoActualizadaI_BASE_RETENCION: TFloatField;
     xInfoActualizadaI_RETENCION: TFloatField;
     QMDetalleCANAL: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFUERZA_VENCIMIENTOS: TIntegerField;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraCAMPANYA: TIntegerField;
     xCampanyas: TFIBDataSetRO;
     DSxCampanyas: TDataSource;
     xFormasPago: TFIBDataSetRO;
     QMCabeceraRIC: TIntegerField;
     QMCabeceraTIPO_IRPF: TIntegerField;
     QMCabeceraA_IRPF: TIntegerField;
     QMCabeceraTOTAL_A_COBRAR: TFloatField;
     xInfoActualizadaTOTAL_A_COBRAR: TFloatField;
     QMCabeceraAPLICA_IRPF: TStringField;
     QMCabeceraDEVOLUCION: TIntegerField;
     QMCabeceraSIN_DETALLE: TIntegerField;
     TLocal: THYTransaction;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraRIC_FAC: TStringField;
     QMCabeceraASIENTO: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     QSPProcedencia: TFIBTableSet;
     DSQSPProcedencia: TDataSource;
     SPRefrescaDetalle: THYFIBQuery;
     QMCabeceraREGISTRO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     xArticulos: TFIBDataSetRO;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraPORTES: TIntegerField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMNIF: TFIBTableSet;
     DSQMNIF: TDataSource;
     QMNIFEMPRESA: TIntegerField;
     QMNIFEJERCICIO: TIntegerField;
     QMNIFCANAL: TIntegerField;
     QMNIFSERIE: TFIBStringField;
     QMNIFTIPO: TFIBStringField;
     QMNIFRIG: TIntegerField;
     QMNIFNIF: TFIBStringField;
     QMNIFDIRECCION: TFIBStringField;
     QMNIFC_POSTAL: TFIBStringField;
     QMNIFPROVINCIA: TFIBStringField;
     xInfoActualizadaESTADO: TIntegerField;
     QMNIFNOMBRE: TFIBStringField;
     QMCabeceraTOTAL_CANAL: TFloatField;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraTARIFA: TFIBStringField;
     QMDetalleUNIDADES_SEC: TFloatField;
     xTipoIRPF: TFIBDataSetRO;
     DSxTipoIRPF: TDataSource;
     QMDetalleNSERIE: TFIBStringField;
     QMCabeceraID_S: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     xInfoActualizadaID_S: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMDetalleCOMISION_LINEAL: TFloatField;
     QMDetalleI_COMISION_LINEAL: TFloatField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMDetalleTITULO_IDIOMA: TFIBStringField;
     QMNIFPAIS: TFIBStringField;
     QMCabeceraRECT: TIntegerField;
     QMCabeceraID_RECT: TIntegerField;
     QMCabecerasCostes: TFIBTableSet;
     QMCabecerasCostesEMPRESA: TIntegerField;
     QMCabecerasCostesEJERCICIO: TIntegerField;
     QMCabecerasCostesCANAL: TIntegerField;
     QMCabecerasCostesSERIE: TFIBStringField;
     QMCabecerasCostesTIPO: TFIBStringField;
     QMCabecerasCostesRIG: TIntegerField;
     QMCabecerasCostesDIGITO_1: TFIBStringField;
     QMCabecerasCostesDIGITO_2: TFIBStringField;
     QMCabecerasCostesDIGITO_3: TFIBStringField;
     QMCabecerasCostesDIGITO_4: TFIBStringField;
     QMCabecerasCostesDIGITO_5: TFIBStringField;
     QMDetallesCostes: TFIBTableSet;
     QMDetallesCostesEMPRESA: TIntegerField;
     QMDetallesCostesEJERCICIO: TIntegerField;
     QMDetallesCostesCANAL: TIntegerField;
     QMDetallesCostesSERIE: TFIBStringField;
     QMDetallesCostesTIPO: TFIBStringField;
     QMDetallesCostesRIG: TIntegerField;
     QMDetallesCostesLINEA: TIntegerField;
     QMDetallesCostesDIGITO_1: TFIBStringField;
     QMDetallesCostesDIGITO_2: TFIBStringField;
     QMDetallesCostesDIGITO_3: TFIBStringField;
     QMDetallesCostesDIGITO_4: TFIBStringField;
     QMDetallesCostesDIGITO_5: TFIBStringField;
     xCuentaArticulo: TFIBDataSetRO;
     xCuentaArticuloCTA_VENTAS: TFIBStringField;
     xCuentaArticuloCENTRO_COSTE: TIntegerField;
     QMDetalleCENTRO_COSTE: TIntegerField;
     QMCabeceraCENTRO_COSTE: TIntegerField;
     xInfoActualizadaSUM_UNIDADES: TFloatField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     xInfoActualizadaI_PORTES: TFloatField;
     QMCabeceraRANGO: TIntegerField;
     QMCabeceraINDICE: TIntegerField;
     xRangos: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxRangos: TDataSource;
     xIndices: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSxIndices: TDataSource;
     QMDetalleORDEN: TIntegerField;
     QMDetalleTIPO_LINEA: TFIBStringField;
     QMDetallePROC_PROMOCION: TIntegerField;
     QMDetalleORIGEN: TIntegerField;
     QMDetalleID_P: TIntegerField;
     QMDetalleFECHA_ANTICIPO: TDateTimeField;
     QMDetalleCTA_PAGO_ANTICIPO: TFIBStringField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMCabeceraCONTACTO: TIntegerField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMCabeceraPROYECTO: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMDetalleLINEA_RELACION: TIntegerField;
     DSQMDetalleCertificado: TDataSource;
     xCertificadoAnt: TFIBDataSetRO;
     xCertificadoAntIMPORTE: TFloatField;
     DSxCertificadoAnt: TDataSource;
     QMDetalleCertificado: TFIBTableSet;
     QMDetalleCertificadoLINEA: TIntegerField;
     QMDetalleCertificadoARTICULO: TFIBStringField;
     QMDetalleCertificadoLINEA_RELACION: TIntegerField;
     QMDetalleCertificadoTITULO: TFIBStringField;
     QMDetalleCertificadoPRECIO: TFloatField;
     QMDetalleCertificadoUNIDADES: TFloatField;
     QMDetalleCertificadoDESCUENTO: TFloatField;
     QMDetalleCertificadoDESCUENTO_2: TFloatField;
     QMDetalleCertificadoDESCUENTO_3: TFloatField;
     QMDetalleCertificadoB_IMPONIBLE: TFloatField;
     QMDetalleCertificadoUNIDADES_SEC: TFloatField;
     QMDetalleCertificadoUNIDADES_EXT: TFloatField;
     QMDetalleCertificadoEJERCICIO: TIntegerField;
     TUpdate: THYTransaction;
     QMCabeceraNOTAS_INTERNAS_KRI: TBlobField;
     QMCabeceraTIPO_LINEA_KRI: TIntegerField;
     QMDetalleTIPO_LINEA_KRI: TIntegerField;
     QMNIFID_S: TIntegerField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraZ_PREFIJO_NCF: TFIBStringField;
     QMCabeceraZ_CONTADOR_NCF: TFIBStringField;
     QMCabeceraZ_TIPO_NCF: TIntegerField;
     QMCabeceraMODO_IVA: TIntegerField;
     QMDetalleCERTIFICADO2: TIntegerField;
     QMDetalleCERT_NEGATIVO: TIntegerField;
     QMDetalleCUENTA: TFIBStringField;
     QMNIFCOLONIA: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     QMDetalleLOTE_SIMPLE: TFIBStringField;
     QMDetalleDIRECCION_ENTREGA: TIntegerField;
     QMCabeceraRECC: TIntegerField;
     QMDetalleCOSTE_ADICIONAL: TFloatField;
     QMDetalleCODIGO_CLIENTE: TStringField;
     QMDetalleTITULO_CLIENTE: TStringField;
     QMCabeceraTIT_CONTACTO: TFIBStringField;
     QMCabeceraIMPORTE_ANTICIPO: TFloatField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMDetalleTOTAL_UNIDADES_EXT: TFloatField;
     QMDetalleMARGEN: TFloatField;
     QMCabeceraEMPLEADO_RESPONSABLE: TIntegerField;
     QMCabeceraEMPLEADO_ATENCION: TIntegerField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMDetalleMANIPULACION: TIntegerField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMCabeceraMARGEN: TFloatField;
     xInfoActualizadaC_TOTAL: TFloatField;
     xInfoActualizadaMARGEN: TFloatField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraUNIDADES: TFloatField;
     QMCabeceraREGISTRO_CARTERA: TIntegerField;
     QMNIFTERCERO: TIntegerField;
     QMCabeceraPOR_PROPINA: TFloatField;
     QMCabeceraSFV_AUTORIZACION: TFIBStringField;
     QMCabeceraSFV_CODIGO_CONTROL: TFIBStringField;
     QMCabeceraSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField;
     QMCabeceraSFV_NUM_DOSIFICACION: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     QMCabeceraPOR_RETENCION_GARANTIA: TFloatField;
     QMCabeceraI_RETENCION_GARANTIA: TFloatField;
     QMCabeceraFECHA_RETENCION_GARANTIA: TDateTimeField;
     QMDetalleID_IMAGEN: TIntegerField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraID_DEV: TIntegerField;
     QMFirmas: TFIBDataSetRO;
     QMFirmasID_FIRMA: TIntegerField;
     QMFirmasNOMBRE: TFIBStringField;
     QMFirmasNIF: TFIBStringField;
     DSQMFirmas: TDataSource;
     QMCabeceraBANCO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField;
     QMCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField;
     QMCabeceraTIPO_VENTA: TIntegerField;
     QMCabeceraCODIGO_RESPUESTA_SII: TMemoField;
     QMCabeceraFOLIO: TIntegerField;
     QMCabeceraCODIGO_GIRO_CLIENTE: TIntegerField;
     QMCabeceraCODIGO_GIRO_EMPRESA: TIntegerField;
     QMCabeceraID_TIPO_DESPACHO: TIntegerField;
     QMCabeceraFEChile: TFIBTableSet;
     DSQMCabeceraFEChile: TDataSource;
     QMCabeceraFEChileID_S: TIntegerField;
     QMCabeceraFEChileINDSERVICIO: TIntegerField;
     QMCabeceraFEChileMNTBRUTO: TFloatField;
     QMCabeceraFEChileTPOTRANCOMPRA: TIntegerField;
     QMCabeceraFEChileTPOTRANVENTA: TIntegerField;
     QMCabeceraFEChileFMAPAGO: TIntegerField;
     QMCabeceraFEChileFCHCANCEL: TDateTimeField;
     QMCabeceraFEChileMNTCANCEL: TFloatField;
     QMCabeceraFEChileSALDOINSOL: TFloatField;
     QMCabeceraFEChileMEDIOPAGO: TFIBStringField;
     QMCabeceraFEChileTIPOCTAPAGO: TFIBStringField;
     QMCabeceraFEChileNUMCTAPAGO: TFIBStringField;
     QMCabeceraFEChileBCOPAGO: TFIBStringField;
     QMCabeceraFEChileTERMPAGOCDG: TFIBStringField;
     QMCabeceraFEChileTERMPAGOGLOSA: TFIBStringField;
     QMCabeceraFEChileTERMPAGODIAS: TFloatField;
     QMCabeceraFEChileFCHVENC: TDateTimeField;
     QMCabeceraFEChileTIPOFACTESP: TFloatField;
     QMCabeceraFEChileGIROEMIS: TFIBStringField;
     QMCabeceraFEChileRUTEMISOR: TFIBStringField;
     QMCabeceraFEChileRZNSOC: TFIBStringField;
     QMCabeceraFEChileTELEFONO: TFIBStringField;
     QMCabeceraFEChileCORREOEMISOR: TFIBStringField;
     QMCabeceraFEChileACTECO: TIntegerField;
     QMCabeceraFEChileSUCURSAL: TFIBStringField;
     QMCabeceraFEChileCDGSIISUCUR: TIntegerField;
     QMCabeceraFEChileDIRORIGEN: TFIBStringField;
     QMCabeceraFEChileCMNAORIGEN: TFIBStringField;
     QMCabeceraFEChileCIUDADORIGEN: TFIBStringField;
     QMCabeceraFEChileCDGVENDEDOR: TFIBStringField;
     QMCabeceraFEChileRUTMANDANTE: TFIBStringField;
     QMCabeceraFEChileRUTRECEP: TFIBStringField;
     QMCabeceraFEChileCDGINTRECEP: TFIBStringField;
     QMCabeceraFEChileRZNSOCRECEP: TFIBStringField;
     QMCabeceraFEChileNUMID: TFIBStringField;
     QMCabeceraFEChileNACIONALIDAD: TFIBStringField;
     QMCabeceraFEChileTIPODOCID: TFIBStringField;
     QMCabeceraFEChileGIRORECEP: TFIBStringField;
     QMCabeceraFEChileCONTACTO: TFIBStringField;
     QMCabeceraFEChileCORREORECEP: TFIBStringField;
     QMCabeceraFEChileDIRRECEP: TFIBStringField;
     QMCabeceraFEChileCMNARECEP: TFIBStringField;
     QMCabeceraFEChileCIUDADRECEP: TFIBStringField;
     QMCabeceraFEChileDIRPOSTAL: TFIBStringField;
     QMCabeceraFEChileCMNAPOSTAL: TFIBStringField;
     QMCabeceraFEChileCIUDADPOSTAL: TFIBStringField;
     QMCabeceraFEChileRUTSOLICITA: TFIBStringField;
     QMCabeceraFEChilePATENTE: TFIBStringField;
     QMCabeceraFEChileRUTTRANS: TFIBStringField;
     QMCabeceraFEChileRUTCHOFER: TFIBStringField;
     QMCabeceraFEChileNOMBRECHOFER: TFIBStringField;
     QMCabeceraFEChileDIRDEST: TFIBStringField;
     QMCabeceraFEChileCMNADEST: TFIBStringField;
     QMCabeceraFEChileCIUDADDEST: TFIBStringField;
     QMCabeceraFEChileMNTNETO: TFloatField;
     QMCabeceraFEChileMNTEXE: TFloatField;
     QMCabeceraFEChileMNTBASE: TFloatField;
     QMCabeceraFEChileMNTMARGENCOM: TFloatField;
     QMCabeceraFEChileTASAIVA: TFloatField;
     QMCabeceraFEChileIVA: TFloatField;
     QMCabeceraFEChileVAPROP: TFloatField;
     QMCabeceraFEChileIVATERC: TFloatField;
     QMCabeceraFEChileCREDEC: TFloatField;
     QMCabeceraFEChileGRNTDEP: TFloatField;
     QMCabeceraFEChileMNTTOTAL: TFloatField;
     QMCabeceraFEChileMONTONF: TFloatField;
     QMCabeceraFEChileMONTOPERIODO: TFloatField;
     QMCabeceraFEChileSALDOANTERIOR: TFloatField;
     QMCabeceraFEChileVLRPAGAR: TFloatField;
     QMCabeceraFEChileTPOMONEDA: TFIBStringField;
     QMCabeceraFEChileTPOCAMBIO: TFloatField;
     QMCabeceraFEChileMNTNETOOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTEXEOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTFAECARNEOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTMARGCOMOTRMNDA: TFloatField;
     QMCabeceraFEChileIVAOTRMNDA: TFloatField;
     QMCabeceraFEChileVANORETOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTTOTOTRMNDA: TFloatField;
     QMNIFCARNET_APLICADOR: TFIBStringField;
     QMCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMCabeceraSII_FMA_PAGO: TIntegerField;
     QMCabeceraDESC_RECTIFICACION: TStringField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraFEChileSII_TRACKID: TFIBStringField;
     QMCabeceraTOTAL_ANTICIPADO: TFloatField;
     QMCabeceraSIN_RECIBOS: TIntegerField;
     QMCabeceraFECHA_CON: TDateTimeField;
     QMCabeceraFEChileNROLINREF: TIntegerField;
     QMCabeceraFEChileTPODOCREF: TFIBStringField;
     QMCabeceraFEChileRUTOTR: TFIBStringField;
     QMCabeceraFEChileFCHREF: TDateTimeField;
     QMCabeceraFEChileCODREF: TIntegerField;
     QMCabeceraFEChileRAZONREF: TFIBStringField;
     QMCabeceraFEChileXML_GENERADO: TMemoField;
     QMDetalleLOTEABLE: TIntegerField;
     QMDetalleCANT_LOTE: TFloatField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMCabeceraFECHA_ENTREGA_REPARTO: TDateTimeField;
     xTicketBAI: TFIBDataSetRO;
     DSxTicketBAI: TDataSource;
     xTicketBAICODIGO_IDENTIFICATIVO: TFIBStringField;
     QMCabeceraPEDIDO_CLIENTE: TFIBStringField;
     QMCabeceraZ_OBSERVACION: TFIBStringField;
     QMCabeceraDIR_ENTREGA_MANUAL: TMemoField;
     QMCabeceraSII_ID_DOC_REF: TIntegerField;
     QMSIIDteReferencia: TFIBTableSet;
     DSQMSIIDteReferencia: TDataSource;
     QMSIIDteReferenciaID_S: TIntegerField;
     QMSIIDteReferenciaNROLINREF: TIntegerField;
     QMSIIDteReferenciaTPODOCREF: TFIBStringField;
     QMSIIDteReferenciaFCHREF: TDateTimeField;
     QMSIIDteReferenciaCODREF: TIntegerField;
     QMSIIDteReferenciaRAZONREF: TFIBStringField;
     QMSIIDteReferenciaID_S_REF: TIntegerField;
     QMSIIDteReferenciaRUTOTR: TFIBStringField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     QMDetalleSIGNO_UNIDADES: TFIBStringField;
     xInfoActualizadaSUM_PESO: TFloatField;
     QMCabeceraDIR_COMPLETA: TFIBStringField;
     QMCabeceraCODIGO_POSTAL: TFIBStringField;
     QMCabeceraLOCALIDAD: TFIBStringField;
     QMCabeceraFEChileCANTIDAD_ERRORES: TIntegerField;
     QMCabeceraFEChileMENSAJE_ERROR: TFIBStringField;
     QMCabeceraFEChileXML_RESPUESTA: TMemoField;
     xInfoActualizadaRIESGO_ACT: TFloatField;
     xInfoActualizadaRIESGO_AUT: TFloatField;
     xInfoActualizadaNO_VENTA_RIESGO: TIntegerField;
     xInfoActualizadaRIESGO_PED: TFloatField;
     xInfoActualizadaRIESGO_EMP: TFloatField;
     xInfoActualizadaRIESGO_DISPONIBLE: TFloatField;
     xAvisos: TFIBDataSetRO;
     QMSIIDteReferenciaFOLIOREF: TFIBStringField;
     QMCabeceraFEChileFOLIOREF: TFIBStringField;
     xDireccionesTERCERO: TIntegerField;
     xDireccionesDIRECCION: TIntegerField;
     xDireccionesTITULO: TFIBStringField;
     xDireccionesDIR_NOMBRE_2: TFIBStringField;
     xDireccionesDIR_NOMBRE_3: TFIBStringField;
     xDireccionesLOCALIDAD: TFIBStringField;
     xDireccionesCOD_POSTAL: TFIBStringField;
     xDireccionesDIR_TRANSPORTISTA: TIntegerField;
     xDireccionesCLASE: TIntegerField;
     QMCabeceraVALOR_UNIDAD_FOMENTO: TFloatField;
     QMDetalleUNIDAD_FOMENTO: TFloatField;
     QMCabeceraPERIODO_FACTURACION_INI: TDateTimeField;
     QMCabeceraPERIODO_FACTURACION_FIN: TDateTimeField;
     QMCabeceraINDSERVICIO: TIntegerField;
     QMCabeceraRECIBO_PAGADO: TIntegerField;
     QMDetalleU_POR_U_LOGISTICA: TFloatField;
     QMDetalleRELACIONAR_U_LOGISTICA: TIntegerField;
     QMDetalleTIPO_IVA_ART: TIntegerField;
     QMDetalleECOTASA: TFloatField;
     xInfoActualizadaMARGEN_SIN_PORTES: TFloatField;
     QMCabeceraLEGAL_LITERALS: TMemoField;
     QMCabeceraCOD_MOTIVO_ABONO: TIntegerField;
     xProveedores: TFIBTableSet;
     xProveedoresEMPRESA: TIntegerField;
     xProveedoresEJERCICIO: TIntegerField;
     xProveedoresCANAL: TIntegerField;
     xProveedoresSERIE: TFIBStringField;
     xProveedoresTIPO: TFIBStringField;
     xProveedoresRIG: TIntegerField;
     xProveedoresID_S: TIntegerField;
     xProveedoresID_A: TIntegerField;
     xProveedoresARTICULO: TFIBStringField;
     xProveedoresTITULO: TFIBStringField;
     xProveedoresPROVEEDOR: TIntegerField;
     xProveedoresNOMBRE_R_SOCIAL: TFIBStringField;
     xProveedoresNOMBRE_COMERCIAL: TFIBStringField;
     xProveedoresPRECIO: TFloatField;
     xProveedoresFECHA_ENTREGA: TDateTimeField;
     xProveedoresUTILIZAR_COSTE: TIntegerField;
     xProveedoresOBSERVACIONES: TFIBStringField;
     DSxProveedores: TDataSource;
     QMCabeceraEMITIDA_POR_TERCEROS: TIntegerField;
     QMDetalleREQUIERE_LOTE_SIMPLE: TIntegerField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     xInfoActualizadaCOUNT_LINEA: TIntegerField;
     QMCabeceraVENCIMIENTO: TDateTimeField;
     DSxAvisos: TDataSource;
     xAvisosMENSAJE: TMemoField;
     xAvisosNOTAS: TMemoField;
     QMNIFCOMO_NOS_CONOCIERON: TIntegerField;
     QMDetalleCONTROL_STOCK: TIntegerField;
     QMCabeceraID_FICHA_TECNICA: TIntegerField;
     xVerifactu: TFIBDataSetRO;
     DSxVerifactu: TDataSource;
     xVerifactuID_SECUENCIA: TIntegerField;
     xVerifactuID_I: TIntegerField;
     xVerifactuID_S: TIntegerField;
     xVerifactuIDVERSION: TFIBStringField;
     xVerifactuIDFACTURA_IDEMISORFACTURA: TFIBStringField;
     xVerifactuIDFACTURA_NUMSERIEFACTURA: TFIBStringField;
     xVerifactuIDFACTURA_FECHAEXPEDICIONFAC: TDateTimeField;
     xVerifactuREFEXTERNA: TFIBStringField;
     xVerifactuNOMBRERAZONEMISOR: TFIBStringField;
     xVerifactuSUBSANACION: TFIBStringField;
     xVerifactuRECHAZOPREVIO: TFIBStringField;
     xVerifactuTIPOFACTURA: TFIBStringField;
     xVerifactuTIPORECTIFICATIVA: TFIBStringField;
     xVerifactuFR_IDFR_IDEMISORFACTURA: TFIBStringField;
     xVerifactuFR_IDFR_NUMSERIEFACTURA: TFIBStringField;
     xVerifactuFR_IDFR_FECHAEXPEDICIONFAC: TDateTimeField;
     xVerifactuFS_IDFS_IDEMISORFACTURA: TFIBStringField;
     xVerifactuFS_IDFS_NUMSERIEFACTURA: TFIBStringField;
     xVerifactuFS_IDFS_FECHAEXPEDICIONFAC: TDateTimeField;
     xVerifactuIMPORTERECT_BASERECTIFICADA: TFloatField;
     xVerifactuIMPORTERECT_CUOTARECTIFICADA: TFloatField;
     xVerifactuIMPORTERECT_CUOTARECARGORECT: TFloatField;
     xVerifactuFECHAOPERACION: TDateTimeField;
     xVerifactuDESCRIPCIONOPERACION: TFIBStringField;
     xVerifactuFACTURASIMPLIFICADAART7273: TFIBStringField;
     xVerifactuFACTURASINIDENTIFDEST: TFIBStringField;
     xVerifactuMACRODATO: TFIBStringField;
     xVerifactuEMITIDAPORTERCEROODEST: TFIBStringField;
     xVerifactuTERCERO_NOMBRERAZON: TFIBStringField;
     xVerifactuTERCERO_NIF: TFIBStringField;
     xVerifactuTERCERO_IDOTRO_CODIGOPAIS: TFIBStringField;
     xVerifactuTERCERO_IDOTRO_IDTYPE: TFIBStringField;
     xVerifactuTERCERO_IDOTRO_ID: TFIBStringField;
     xVerifactuDEST_IDD_NOMBRERAZON: TFIBStringField;
     xVerifactuDEST_IDD_NIF: TFIBStringField;
     xVerifactuDEST_IDD_IDOTRO_CODIGOPAIS: TFIBStringField;
     xVerifactuDEST_IDD_IDOTRO_IDTYPE: TFIBStringField;
     xVerifactuDEST_IDD_IDOTRO_ID: TFIBStringField;
     xVerifactuCUPON: TFIBStringField;
     xVerifactuCUOTATOTAL: TFloatField;
     xVerifactuIMPORTETOTAL: TFloatField;
     xVerifactuNUMREGISTROACUERDOFACTURACION: TFIBStringField;
     xVerifactuIDACUERDOSISTEMAINFORMATICO: TFIBStringField;
     xVerifactuINFO_QR: TFIBStringField;
     xVerifactuENC_RA_IDEMISORFACTURA: TFIBStringField;
     xVerifactuENC_RA_NUMSERIEFACTURA: TFIBStringField;
     xVerifactuENC_RA_FECHAEXPEDICIONFACTURA: TDateTimeField;
     xVerifactuENC_RA_HUELLA: TFIBStringField;
     xVerifactuHUELLA: TFIBStringField;
     QMCabeceraTITULO_GIRO_CLIENTE: TFIBStringField;
     xFactoring: TFIBDataSetRO;
     DSxFactoring: TDataSource;
     xFactoringID_S: TIntegerField;
     xFactoringTRACKID: TFIBStringField;
     xFactoringSTATUS: TIntegerField;
     QMCabeceraNIF: TFIBStringField;
     QMCabeceraDIR_NOMBRE_2: TFIBStringField;
     QMCabeceraMATRICULA: TFIBStringField;
     QMCabeceraORIGEN_DOCUMENTO: TFIBStringField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMDetalleUE_UNIDADES: TIntegerField;
     QMDetalleUE_MEDIDA1: TFloatField;
     QMDetalleUE_MEDIDA2: TFloatField;
     QMDetalleUE_MEDIDA3: TFloatField;
     QMDetalleUE_MEDIDA4: TFloatField;
     xFacturaDGII: TFIBDataSetRO;
     DSxFacturaDGII: TDataSource;
     xFacturaDGIIID_S: TIntegerField;
     xFacturaDGIIID_ENVIO: TFIBStringField;
     xFacturaDGIISTAMP_DATE: TFIBStringField;
     xFacturaDGIISTATUS: TFIBStringField;
     xFacturaDGIISECURITY_CODE: TFIBStringField;
     xFacturaDGIISEQUENCE_CONSUMED: TIntegerField;
     xFacturaDGIIENCF: TFIBStringField;
     xFacturaDGIIURL_XML: TFIBStringField;
     xFacturaDGIIURL_PDF: TFIBStringField;
     xFacturaDGIIDOCUMENT_STAMP_URL: TFIBStringField;
     xFacturaDGIITRACK_ID: TFIBStringField;
     xFacturaDGIIGOVERMENT_RESPONSE: TFIBStringField;
     xFacturaDGIIMENSAJE_ERROR_ENVIO_ECF: TFIBStringField;
     xFacturaDGIISTATUS_CONSULTA: TFIBStringField;
     xFacturaDGIILEGAL_STATUS_CONSULTA: TFIBStringField;
     xFacturaDGIIMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField;
     QMDetalleSTOCK_REAL: TFloatField;
     QMDGIIReferencias: TFIBTableSet;
     DSQMDGIIReferencias: TDataSource;
     QMDGIIReferenciasID_S: TIntegerField;
     QMDGIIReferenciasID_S_REF: TIntegerField;
     QMDGIIReferenciasTIPO_CF_REF: TIntegerField;
     QMDGIIReferenciasENCF_REF: TFIBStringField;
     QMDGIIReferenciasTIPO_REF: TIntegerField;
     QMCabeceraTIPO_INGRESOS: TIntegerField;
     QMDetalleNO_FABRICACION_KRI: TFIBStringField;
     QMCabeceraENTRADA_FACTURACION: TIntegerField;
     QMCabeceraGD_NROLINREF: TIntegerField;
     QMCabeceraGD_TPODOCREF: TFIBStringField;
     QMCabeceraGD_FOLIOREF: TFIBStringField;
     QMCabeceraGD_RUTOTR: TFIBStringField;
     QMCabeceraGD_FCHREF: TDateTimeField;
     QMCabeceraGD_CODREF: TIntegerField;
     QMCabeceraGD_RAZONREF: TFIBStringField;
     QMCabeceraOC_NROLINREF: TIntegerField;
     QMCabeceraOC_TPODOCREF: TFIBStringField;
     QMCabeceraOC_FOLIOREF: TFIBStringField;
     QMCabeceraOC_RUTOTR: TFIBStringField;
     QMCabeceraOC_FCHREF: TDateTimeField;
     QMCabeceraOC_CODREF: TIntegerField;
     QMCabeceraOC_RAZONREF: TFIBStringField;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     QMDetallePRECIO_U_C_DESC: TFloatField;
     QMCabeceraVF_ESTADO_REGISTRO_ALTA: TFIBStringField;
     QMCabeceraVF_CODIGO_ERROR_ALTA: TFIBStringField;
     QMCabeceraVF_DESCRIPCION_ERROR_ALTA: TFIBStringField;
     QMCabeceraVF_ESTADO_REGISTRO_ANULACION: TFIBStringField;
     QMCabeceraVF_CODIGO_ERROR_ANULACION: TFIBStringField;
     QMCabeceraVF_DESCRIPCION_ERROR_ANULACION: TFIBStringField;
     QMCabeceraVF_ESTADO_REGISTRO: TStringField;
     xFacturaDGIICODIGO_ERROR_ENVIO: TFIBStringField;
     xInfoActualizadaSUMA_BASES: TFloatField;
     xInfoActualizadaSUMA_COSTES: TFloatField;
     xInfoActualizadaSUM_UNIDADES_SEC: TFloatField;
     xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField;
     procedure DMDocsFacturaCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure GrabaBorrado(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraCLIENTEChange(Sender: TField);
     procedure QMCabeceraDIRECCIONChange(Sender: TField);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMCabeceraFORMA_PAGOChange(Sender: TField);
     procedure QMCabeceraCAMPANYAChange(Sender: TField);
     procedure QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraRIC_FACGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraREGISTROGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure DMFacturasDestroy(Sender: TObject);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraTARIFAChange(Sender: TField);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMCabeceraTIPO_IRPFChange(Sender: TField);
     procedure QMDetalleBeforeScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraTIPO_PORTESChange(Sender: TField);
     procedure QMCabeceraRANGOChange(Sender: TField);
     procedure QMCabeceraINDICEChange(Sender: TField);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraCAMBIO_FIJOChange(Sender: TField);
     procedure QMCabeceraCONTACTOChange(Sender: TField);
     procedure QMDetallePRECIOChange(Sender: TField);
     procedure QMDetalleP_COSTEChange(Sender: TField);
     procedure QMDetalleCOMISIONChange(Sender: TField);
     procedure QMDetallePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleTITULO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
     procedure QMCabeceraDTO_PPChange(Sender: TField);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraTRANSPORTISTAChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMCabeceraFECHAChange(Sender: TField);
     procedure QMCabeceraTIPO_DOC_TRIBUTARIOChange(Sender: TField);
     procedure QMSIIDteReferenciaBeforePost(DataSet: TDataSet);
     procedure QMSIIDteReferenciaNewRecord(DataSet: TDataSet);
     procedure QMSIIDteReferenciaAfterPost(DataSet: TDataSet);
     procedure QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_IVAChange(Sender: TField);
     procedure QMDetallePESO_REALChange(Sender: TField);
     procedure QMDetalleALMACENChange(Sender: TField);
     procedure xInfoActualizadaCalcFields(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTOTAL_UNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SECChange(Sender: TField);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure xProveedoresNewRecord(DataSet: TDataSet);
     procedure xProveedoresAfterPost(DataSet: TDataSet);
     procedure xProveedoresARTICULOChange(Sender: TField);
     // procedure MemoWrit(const FileName, SourceString : string);
  private
     { Private declarations }
     //ComisionAgente : double ;
     unidades_old: double;
     //SQL: String;
     SQLFind, SQLBase: string;
     FechaOld: TDateTime;
     Tarifa_old: string;
     Articulo_old: string;
     pago_automatico, RecalculaPrecios, RecalculaTarifa, Editando: boolean;
     FlagModificandoUnidades: boolean;
     ConPromociones: boolean;
     ControlaStockNegativo: boolean;
     KriConf126, KriConf429, KriConf465: boolean;
     OldLinea: TStrings;
     AlmacenStockReal: boolean;
     gUnidades: integer;
     Medida1, Medida2, Medida3, Medida4, gPrecio: double;
     PuedeAbrirFactura: boolean;
     ModificandoCambioFijo: boolean;
     TipoVenta: integer;
     CodigoGiroEmpresa: integer;
     IdDocEliminaPorte: integer;
     RespuestaEliminaPorte: boolean;
     LiquidoAnt: double;
     Param_MOVSTKC001: integer;
     Param_SYSCONF005: integer;
     Param_DOCREFE004: boolean;
     Param_CLIREFE001: boolean;
     Param_CERLIMP001: boolean;
     Param_VENULKG001: boolean;
     Param_DOCPREC002: boolean;
     Param_DOCPREC003: boolean;
     Param_VENARTU001: boolean;
     param_VENPREC001: boolean;
     Param_FACLSIM001: boolean;
     param_DOCPCTA001: boolean;
     param_DOCDESC001: double;
     param_FACNOST001: boolean;
     param_VENPREC002: boolean;
     param_VENUSEC001: boolean;
     param_FACMAXL001: integer;
     param_VENCONT001: boolean;
     {procedure InfoActualiza; dji lrk kri - TyC}
     procedure RefrescaTarifa;
     procedure LimpiaProcAuto;
     function Traspasado: boolean;
     procedure RefrescaIRPF;
     procedure DamePorIRPF;
     procedure ExtraeArticulos;
     {procedure CambiaMonedaFecha; No se utiliza}
     {function HayCambioFactor(var factor_ant: double): boolean; No se utiliza}
     {procedure RecalculaCambioFactor(factor_ant: double); No se utiliza}
     {procedure AbreSerializadoAuto ; dji lrk kri - TyC}
     procedure CierraAbreDet;
     procedure RellenaDatosLinea(Linea: TStrings);
     procedure EstaleceCondiciones(Articulo: TField; Precio: double; Forzar: boolean = False);
     // procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
     procedure AjustaPorteMinimo;
     // function DameFolio: integer;
  public
     { Public declarations }
     // NotasLote: boolean; // Controla si se editan las notas del lote
     // NSerie: string;
     Filtrado, Calcula_Unidades, NumSerie, Muestra_InfoStock: boolean;
     LocalMascaraN, LocalMascaraL: string;
     MonedaOld: string;
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     procedure ActualizaCondicionesCli(CrearCondicionModelo: boolean);
     function BusquedaCompleja: integer;
     procedure CierraFactura;
     procedure AbreFactura;
     procedure Duplica(Relaciona: integer; TipoDocTribDestino: string; FechaDestino: TDateTime);
     procedure Devuelve(SerieDestino: string);
     procedure CambiaSerie(SerieVar: string);
     function CompruebaAbono: boolean;
     procedure PreparaNotasDetalle;
     // procedure PreparaRecibos(editar:boolean);
     procedure ListadoRecibos(const Serie: string; Modo: integer);
     procedure Procedencia;
     procedure RefrescaDetalle;
     procedure Etiquetas(serie: string);
     procedure VentasCliente;
     procedure CambiaUnidadesExt(Articulo: TField; Modo, Mostrar: boolean);
     procedure CambiaPreciosTarifa;
     function Habilitar_but_cambia_iva: boolean;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure Historico;
     procedure BorraLineaUnidadesExt;
     procedure DatosHerencia(var rig, Ejercicio: integer; var tipo, su_referencia, titulo, serie: string);
     procedure DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
     procedure BusquedaArticulo(Descripcion: string);
     procedure VaciaNumSerie;
     procedure BuscaNumSerie(NroSerie: string; Filtro: boolean);
     function Inhabilitar: boolean;
     function DameEstado: smallint;
     procedure CalculaUnidades(pvp: double);
     function Serializado: boolean;
     procedure GrabaDatosCliente(Estado: integer);
     function DameDatosClientes: boolean;
     procedure AgrupacionPedidosFac(Serie: string; Contador: integer);
     function ObtieneRegistroIVA: string;
     procedure RefrescaTabla;
     function Dameejercicio: string;
     procedure MascarasMoneda; virtual;
     procedure CambiaMonedaDetalle;
     function HayDocumentos: boolean;
     function EstadoDocumento: integer;
     function HayDetalle: boolean;
     procedure InfoLotes;
     procedure InfoActualiza; {TyC}
     procedure AbreSerializadoAuto; {TyC}
     function PackingListGenerado: boolean; {TyC}
     procedure InsertaCosteCabecera(d1, d2, d3, d4, d5: string);
     procedure ActualizaCosteCabecera(d1, d2, d3, d4, d5: string);
     procedure BorraCosteCabecera;
     procedure InsertaCosteDetalle(d1, d2, d3, d4, d5: string);
     procedure ActualizaCosteDetalle(d1, d2, d3, d4, d5: string);
     procedure BorraCosteDetalle;
     // function CostesIntroducidos: smallint;
     procedure PreparaSerializacion;
     procedure ControlaRestriccion;
     procedure ComprobarFecha(FechaNueva: TDateTime);
     procedure MuestraUbicacion;
     function CreaFacturaRectificacion(Serie: string; var d_rig: integer): boolean;
     function ExisteRango(Rango: integer): boolean;
     procedure OrdenarLineas;
     procedure RefrescaCabecera(Accion: integer);
     procedure GenerarPackingList;
     procedure FiltraDocumento(Filtro: string);
     procedure CalculaComisionKRI20;
     procedure BuscaArticulo(Articulo: string);
     procedure FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
     function HayCertificacion: boolean;
     procedure AbreQMNif;
     procedure CierraQMNif;
     procedure CambiaFinanciacion;
     procedure EliminarPackingList;
     procedure OrdenarLineasPorDireccionEntrega;
     procedure PedirCentroCoste;
     function GeneraFacturaElectronicaES(Certificado: string): string;
     procedure RellenaDatosOldLinea;
     procedure CambiaPCosteLinea(PCoste: double);
     procedure CambiaCosteAdicionalLinea(CosteAdicional: double);
     procedure ImprimirDocumento(Modo: integer; Listado: integer = 1);
     procedure DuplicarLinea;
     procedure AsignaEmpleados;
     procedure ActualizaPorteSegunZona;
     procedure PosicionarID(IdDoc: integer);
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
     procedure DameFacturaDevolucion;
     procedure EnvioTBAI(aTipo: string);
     procedure AnularTBAI;
     function DocumentoDteValido: boolean;
     procedure LoaclizaFolio;
     procedure ConectaProveedores;
     procedure DesconectaProveedores;
     procedure ImportacionFacturas(Serie: string);
     // Facturas de VCVAUTO-Valencia
     procedure ImportacionFacturas2(Serie: string);
     procedure EnviaDocumentoFactoring(Proveedor: integer);
     function DocumentoAECValido: boolean;
     function DocumentoEcfValido: boolean;
     procedure MultiplicaPrecios(Factor: double);
     procedure Anular;
     procedure AnulaDocumento;
     procedure ResumeDocumento;
     function ExiteDocumentoReferido(TiporDocTributario: string): boolean;
  end;

var
  DMFacturas : TDMFacturas;
  Serie : string;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, URecursos, uFBusca,
  UFCProcedencia, UDMListados, UDMLstFacturasEti, UFPregEtiAlbaran, UFMVentasCli,
  UFMUnidadesExtGes, UFMPreciosArticuloDoc, UFInfoHistorico,
  UDMLstCarteraRecibos, {UFMIntroduceLotes,} UFParada, UFMExtraeArticulos,
  UFMDatosFactRectificacion, UFMArtSerializacion, UFOrdenaLineas, UFMDatosAnticipo,
  UFMRelacionaAnticipo, UFMFacturas, UFMFacturasTallas, UFMImputacionCostes, FIB, UFormGest,
  UFMain, UFMFinanciaManualVtas, UFMDigitosCoste, UFacturaElectronicaES, UFMAsignaLotes,
  UFPregAnticipo, UFMDetallePagoFactura, UDMLstFactura, UParam, UFMAsignaEmpleado,
  UFMSeleccion, UFSendCorreo, UFacturaElectronicaBO, UFMRegistroFitosanitario,
  UFacturaElectronicaCL, UDMAdjunto, UTicketBAI, DateUtils, UFirmas, Graphics, UHojaCalc, UDMFactoringChl;

{$R *.DFM}

function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
var
  i : integer;
begin
  Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  Result := Nodo;
end;

function DameDato(Nodo: IXMLNode; a: array of string): string; overload;
var
  i : integer;
begin
  Result := '';
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  if Assigned(Nodo) then
     Result := Nodo.Text;
end;

function DameDato(Nodo: IXMLNode; a: array of string; NameSpaceURI: string): string; overload;
var
  i : integer;
begin
  Result := '';
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i], NameSpaceURI);
     Inc(i);
  end;

  if Assigned(Nodo) then
     Result := Nodo.Text;
end;

procedure TDMFacturas.DMDocsFacturaCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  OldLinea := TStringList.Create;
  param_DOCPCTA001 := (LeeParametro('DOCPCTA001', REntorno.Serie) = 'S');
  KriConf126 := (DMMain.EstadoKri(126) = 1);
  KriConf429 := (DMMain.EstadoKri(429) = 1);
  Kriconf465 := (DMMain.EstadoKri(465) = 1);

  // Para que al abrir, antes de establecer la serie el parámetro tenga un valor.
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', REntorno.Serie), 0);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Se inicializan las variables globales
  // ComisionAgente := 0;
  FlagModificandoUnidades := False;
  Filtrado := False;
  Calcula_Unidades := True;
  ModificandoCambioFijo := False;
  IdDocEliminaPorte := 0;
  RespuestaEliminaPorte := False;

  // Máscaras de visualización a los campos numéricos
  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalleCertificado, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xProveedores, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xFacturaDGII, MascaraN, MascaraI, ShortDateFormat);

  // Se asignan las máscaras de visualización a los campos que las requieren
  QMCabeceraDTO_CIAL.DisplayFormat := MascaraP;
  QMCabeceraDTO_PP.DisplayFormat := MascaraP;
  QMCabeceraP_RETENCION.DisplayFormat := MascaraP;
  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMCabeceraPOR_PORTES.DisplayFormat := MascaraP;
  QMCabeceraMARGEN.DisplayFormat := MascaraP;
  // QMCabeceraFECHA.DisplayFormat := ShortDateFormat;
  QMCabeceraPOR_PROPINA.DisplayFormat := MascaraP;
  QMCabeceraFECHA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_ENTREGA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_ENTREGA_MANUAL.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_ENTREGA_REPARTO.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_RECOGIDA_MANUAL.DisplayFormat := ShortDateFormat + ' hh:nn';

  QMCabeceraPOR_RETENCION_GARANTIA.DisplayFormat := MascaraP;
  QMCabeceraFECHA_RETENCION_GARANTIA.DisplayFormat := ShortDateFormat;

  xInfoActualizadaBULTOS.DisplayFormat := MascaraI;
  xInfoActualizadaMARGEN.DisplayFormat := MascaraP;
  xInfoActualizadaMARGEN_SIN_PORTES.DisplayFormat := MascaraP;

  QMDetalleUNIDADES_SEC.DisplayFormat := ',0.000';
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetalleCOMISION.DisplayFormat := MascaraP;
  QMDetalleP_IVA.DisplayFormat := MascaraP;
  QMDetalleP_RECARGO.DisplayFormat := MascaraP;
  QMDetalleMARGEN.DisplayFormat := MascaraP;
  QMDetalleUNIDADES_LOGISTICAS.DisplayFormat := MascaraI;
  QMDetalleFECHA_PRE_DET.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMDetalleFECHA_REC_DET.DisplayFormat := ShortDateFormat + ' hh:nn';

  QMDetalleCertificadoDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleCertificadoDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleCertificadoDESCUENTO_3.DisplayFormat := MascaraP;

  ControlaStockNegativo := DMMain.ControlStockNegativoEmpresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PUEDE_ABRIR_FACTURA_VENTA FROM SYS_USUARIOS_PERFIL WHERE PERFIL = :PERFIL';
        Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
        ExecQuery;
        PuedeAbrirFactura := (FieldByName['PUEDE_ABRIR_FACTURA_VENTA'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  xTipoNCF.Open;

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_FACTURA ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');// Add(' EJERCICIO=?EJERCICIO AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''FAC'' ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add(' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' AND ((EJERCICIO = ?EJERCICIO) OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0))) ');
  SQLBase := QMCabecera.SelectSQL.Text;
  if (REntorno.Pais = 'CHL') then
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
  else
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

  with QMCabecera.DeleteSQL do
  begin
     Clear;
     Add(' EXECUTE PROCEDURE G_BORRA_RIG_SALIDA_LOG ');
     Add(' (?OLD_EMPRESA, ?OLD_EJERCICIO, ?OLD_CANAL, ?OLD_SERIE, ?OLD_TIPO, ?OLD_RIG, ?OLD_ID_S, ');
     Add(IntToStr(REntorno.Entrada) + ') ');
  end;

  with QMDetalle.DeleteSQL do
  begin
     Clear;
     Add('EXECUTE PROCEDURE G_BORRA_LINEA_SALIDA_LOG ');
     Add('(?OLD_ID_DETALLES_S, ');
     Add(IntToStr(REntorno.Entrada) + ') ');
  end;

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  Serie := REntorno.Serie;

  // NotasLote := False;
  NumSerie := False;

  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
     Tarifa := QMCabeceraTARIFA.AsString;
     if (xCliente.Active) then
     begin
        Tercero := xCliente.FieldByName('TERCERO').AsInteger;
        Cliente := xCliente.FieldByName('CLIENTE').AsInteger;
     end;
  end;

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  if (LeeParametro('LABPNPL001', Serie) <> QMDetallePRO_NUM_PLANO.DisplayLabel) then
     QMDetallePRO_NUM_PLANO.DisplayLabel := LeeParametro('LABPNPL001', Serie);

  if (LeeParametro('LABFABK001', Serie) <> QMDetalleNO_FABRICACION_KRI.DisplayLabel) then
     QMDetalleNO_FABRICACION_KRI.DisplayLabel := LeeParametro('LABFABK001', Serie);

  // Facturacion Chile
  TipoVenta := 0;
  CodigoGiroEmpresa := 0;
  if (REntorno.Pais = 'CHL') then
  begin
     TipoVenta := 1;
     CodigoGiroEmpresa := DMMain.DameGiro('EMP', REntorno.Empresa);
  end;
end;

procedure TDMFacturas.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMFacturas.GrabaBorrado(DataSet: TDataSet);
begin
  // DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMFacturas.QMDetalleNewRecord(DataSet: TDataSet);
var
  i : integer;
  Linea, Campo, Valor : string;
begin
  // Impedimos insertar mas lineas que el limite
  if (param_FACMAXL001 > 0) then
  begin
     if (QMDetalle.RecordCount >= param_FACMAXL001) then
        raise Exception.Create(format(_('El numero maximo de items para una factura son %d lineas'), [param_FACMAXL001]));
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMDetalleALMACEN.AsString := QMCabeceraALMACEN.AsString;
  QMDetalleTIPO.AsString := QMCabeceraTIPO.AsString;
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  // QMDetalleCOMISION.AsFloat := ComisionAgente;
  QMDetalleTITULO.AsString := '';
  QMDetalleUNIDADES.AsInteger := 1;
  QMDetalleENTRADA.AsInteger := REntorno.Entrada;
  QMDetalleUNIDADES_EXT.AsInteger := 0;
  QMDetalleNSERIE.AsString := '';
  QMDetalleUNIDADES_SEC.AsInteger := 0;
  QMDetalleID_S.AsInteger := QMCabeceraID_S.AsInteger;
  QMDetalleID_DETALLES_S.AsInteger := 0;
  QMDetalleCENTRO_COSTE.AsInteger := 0;
  QMDetalleTIPO_LINEA.AsString := 'NOR';
  QMDetalleTIPO_LINEA_KRI.AsInteger := QMCabeceraTIPO_LINEA_KRI.AsInteger; {dji lrk kri}
  QMDetalleBULTOS.AsInteger := 0;
  QMDetalleCOSTE_ADICIONAL.AsFloat := 0;
  QMDetalleMANIPULACION.AsInteger := 0;

  // QMDetallePIEZAS_X_BULTO.AsInteger := 0;
  // PIEZAS_X_BULTO puede tener un valor por defecto diferente a 0.
  QMDetallePIEZAS_X_BULTO.AsInteger := DMMain.EstadoKri(439);
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  Unidades_Old := 0;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  // FechaOld := REntorno.FechaTrabSH;

  // Obtenemos el numero de linea más alto en la factura actual
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_S.AsInteger);

  NumSerie := False;
  QMDetallePRO_NUM_PLANO.AsString := '';
  QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMDetalleLOTE_SIMPLE.AsString := '';
  QMDetalleDIRECCION_ENTREGA.AsInteger := QMCabeceraDIRECCION.AsInteger;
  QMDetalleUNIDAD_FOMENTO.AsFloat := 0;
  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf465) then
  begin
     for i := 0 to OldLinea.Count - 1 do
     begin
        Linea := OldLinea[i];
        Campo := Copy(Linea, 1, Pos('=', Linea) - 1);
        Valor := Copy(Linea, Pos('=', Linea) + 1, Length(Linea));
        with QMDetalle do
        begin
           if (FieldByName(Campo) is TIntegerField) then
              FieldByName(Campo).AsInteger := StrToIntDef(Valor, 0);
           if (FieldByName(Campo) is TFloatField) then
              FieldByName(Campo).AsFloat := StrToFloat(Valor);
           if ((FieldByName(Campo) is TFIBStringField) or (FieldByName(Campo) is TBlobField)) then
              FieldByName(Campo).AsString := Valor;
           if (FieldByName(Campo) is TDateTimeField) then
              FieldByName(Campo).AsDateTime := StrToDateTime(Valor);
        end;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraNewRecord(DataSet: TDataSet);
var
  Cliente : integer;
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'FAC';
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraALMACEN.AsString := DMMain.DameAlmacenDocumento('FAC', Serie);
  QMCabeceraCAMPANYA.AsInteger := 0;
  QMCabeceraDEVOLUCION.AsInteger := 0;
  QMCabeceraSIN_DETALLE.AsInteger := 0;
  QMCabeceraTARIFA.AsString := REntorno.TarifaDefecto;
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraP_RETENCION.AsFloat := 0;
  QMCabeceraID_S.AsInteger := 0;
  QMCabeceraFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraTIPO_PORTES.AsInteger := 0;
  QMCabeceraPOR_PORTES.AsFloat := 0;
  QMCabeceraI_PORTES.AsFloat := 0;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraTIPO_LINEA_KRI.AsInteger := 0; {dji lrk kri}
  QMCabeceraRECC.AsInteger := 0;
  QMCabeceraPORTES.AsInteger := 0;
  QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger := 0;
  QMCabeceraPOR_PROPINA.AsFloat := 0;
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCVPRY001', Serie), 0);
  QMCabeceraID_DEV.AsInteger := 0;
  QMCabeceraSIN_RECIBOS.AsInteger := 0;
  QMCabeceraFECHA_CON.AsDateTime := REntorno.FechaTrab;
  QMCabeceraCOD_MOTIVO_ABONO.AsInteger := 0;

  // Datos SII Chile
  QMCabeceraFOLIO.AsInteger := 0;
  QMCabeceraTIPO_DOC_TRIBUTARIO.AsString := LeeParametro('FACDTED001', Serie);
  QMCabeceraSII_FMA_PAGO.AsInteger := 0;
  QMCabeceraTIPO_VENTA.AsInteger := TipoVenta;
  QMCabeceraCODIGO_GIRO_EMPRESA.AsInteger := CodigoGiroEmpresa;
  QMCabeceraINDSERVICIO.AsInteger := 0;
  {
  // El tipo documento referencia es obligatorio y ponemos por defecto el de la factura electronica
  // QMCabeceraNROLINREF.AsInteger := 0;
  // QMCabeceraTPODOCREF.AsString := '33';
  // QMCabeceraFOLIOREF.AsString := '';
  // QMCabeceraRUTOTR.AsString := '';
  // QMCabeceraFCHREF.AsDateTime := QMCabeceraFECHA.AsDateTime;
  // QMCabeceraCODREF.AsInteger := 0;
  // QMCabeceraRAZONREF.AsString := '';
  }
  QMCabeceraVALOR_UNIDAD_FOMENTO.AsFloat := 0;

  // Facturacion Rep. Dominicana
  QMCabeceraTIPO_INGRESOS.AsInteger := 1;

  // Facturacion Bolivia
  QMCabeceraSFV_AUTORIZACION.AsString := '';
  QMCabeceraSFV_CODIGO_CONTROL.AsString := '';
  QMCabeceraTITULO_GIRO_CLIENTE.AsString := '';

  Editando := False;
  Tarifa_old := '';

  Cliente := StrToIntDef(LeeParametro('FACCLIE001', Serie), 0);
  if (Cliente <> 0) then
     QMCabeceraCLIENTE.AsInteger := Cliente;

  if (LeeParametro('VENAGEN001', Serie) = 'S') then
     QMCabeceraAGENTE.AsInteger := DameAgenteUsuario(REntorno.Usuario);

end;

procedure TDMFacturas.QMCabeceraCLIENTEChange(Sender: TField);
var
  Saldo : double;
  Moneda : string;
begin
  if (not DMMain.ClienteBloqueado(QMCabeceraCLIENTE.AsInteger)) then
  begin
     with xCliente do
     begin
        Close;
        Open;
        // Asignamos a EntornoDoc
        EntornoDoc.Tercero := FieldByName('TERCERO').AsInteger;
        EntornoDoc.Tarifa := FieldByName('TARIFA').AsString;
        EntornoDoc.Cliente := Sender.AsInteger;
        // Asignamos a la Factura
        QMCabeceraTERCERO.AsInteger := EntornoDoc.Tercero;

        if (LeeParametro('VENAGEN001', Serie) = 'N') then
           QMCabeceraAGENTE.AsInteger := FieldByName('AGENTE').AsInteger;

        QMCabeceraDTO_PP.AsFloat := FieldByName('DESCUENTO_PP').AsFloat;
        QMCabeceraDTO_CIAL.AsFloat := FieldByName('DESCUENTO_CIAL').AsFloat;
        QMCabeceraMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMCabeceraIDIOMA.AsString := FieldByName('IDIOMA').AsString;
        QMCabeceraTITULO.AsString := FieldByName('TITULO').AsString;
        QMCabeceraNOMBRE_COMERCIAL.AsString := FieldByName('NOMBRE_COMERCIAL').AsString;
        if (Param_CLIREFE001) then
        begin
           if (Trim(FieldByName('SU_REFERENCIA').AsString) > '') then
              QMCabeceraSU_REFERENCIA.AsString := FieldByName('SU_REFERENCIA').AsString;
        end
        else
           QMCabeceraSU_REFERENCIA.AsString := '';
        QMCabeceraFORMA_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        QMCabeceraTARIFA.AsString := EntornoDoc.Tarifa;
        QMCabeceraDIRECCION.AsInteger := DameDireccionDefectoVentas(FieldByName('EMPRESA').AsInteger, FieldByName('CLIENTE').AsInteger);

        QMCabeceraTIPO_IRPF.AsInteger := FieldByName('TIPO_IRPF').AsInteger;
        QMCabeceraMODO_IVA.AsInteger := FieldByName('MODO_IVA').AsInteger;
        QMCabeceraZ_TIPO_NCF.AsInteger := FieldByName('TIPO_NCF').AsInteger;

        QMCabeceraTIPO_PORTES.AsInteger := FieldByName('TIPO_PORTES').AsInteger;
        case FieldByName('TIPO_PORTES').AsInteger of
           3: QMCabeceraPOR_PORTES.AsFloat := FieldByName('POR_PORTES').AsFloat;
           4: QMCabeceraI_PORTES.AsFloat := FieldByName('I_PORTES').AsFloat;
           5, 6, 7:
           begin
              QMCabeceraRANGO.AsInteger := FieldByName('RANGO').AsInteger;
              QMCabeceraINDICE.AsInteger := FieldByName('INDICE').AsInteger;
           end;
        end;
        if (REntorno.Ejercicio >= 2014) then
           QMCabeceraRECC.AsInteger := FieldByName('RECC').AsInteger
        else
           QMCabeceraRECC.AsInteger := 0;

        // Controlamos si esta o no bloqueado y mostramos el aviso YA
        if (FieldByName('NO_ALB_FAC').AsInteger = 1) then
           MessageDlg(_('No se pueden realizar ventas a este cliente, cliente bloqueado.'),
              mtInformation, [mbOK], 0);
     end;

     DMMain.MuestraAviso('CLI', xCliente.FieldByName('ID_CLIENTE').AsInteger, QMCabeceraTIPO.AsString);

     if (xCliente.FieldByName('TIPO_PORTES').AsInteger = 0) then
        ActualizaPorteSegunZona;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT BANCO FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO AND DIRECCION = :DIRECCION';
           Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
           Params.ByName['DIRECCION'].AsInteger := QMCabeceraDIRECCION.AsInteger;
           ExecQuery;
           QMCabeceraBANCO.AsInteger := FieldByName['BANCO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     DamePorIRPF;

     DMMain.SaldoAnticipo('CLI', QMCabeceraCLIENTE.AsInteger, REntorno.FechaTrabSH, Saldo, Moneda);
     if (Saldo > 0) then
        ShowMessage(_('El cliente tiene anticipos por liquidar.'));

     {$IFNDEF Debug}
     // Si el pais es Chile asignamos el tipo de giro por defecto
     if ((REntorno.Pais = 'CHL') and
        (QMCabecera.State = dsInsert)) then
     begin
        QMCabeceraCODIGO_GIRO_CLIENTE.AsInteger := DMMain.DameGiro('CLI', QMCabeceraEMPRESA.AsInteger, QMCabeceraCLIENTE.AsInteger);
        if (QMCabeceraCODIGO_GIRO_CLIENTE.AsInteger > 0) then
           QMCabeceraTITULO_GIRO_CLIENTE.AsString := DameTituloCodigoGiro(QMCabeceraCODIGO_GIRO_CLIENTE.AsInteger);
     end;
     {$ENDIF}
  end
  else
     QMCabecera.Cancel;
end;

procedure TDMFacturas.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  if not (QMCabeceraTERCERO.IsNull) then
  begin
     with xDirecciones do
     begin
        Close;
        Open;
     end;

     if (xDirecciones.FieldByName('DIR_TRANSPORTISTA').AsInteger <> 0) then
        QMCabeceraTRANSPORTISTA.AsInteger := xDirecciones.FieldByName('DIR_TRANSPORTISTA').AsInteger
     else
        QMCabeceraTRANSPORTISTA.AsInteger := xCliente.FieldByName('TRANSPORTISTA').AsInteger;
  end;

  if (xCliente.FieldByName('TIPO_PORTES').AsInteger = 0) then
  begin
     QMCabeceraTIPO_PORTES.AsInteger := 0;
     ActualizaPorteSegunZona;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT BANCO FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO AND DIRECCION = :DIRECCION';
        Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
        Params.ByName['DIRECCION'].AsInteger := QMCabeceraDIRECCION.AsInteger;
        ExecQuery;
        QMCabeceraBANCO.AsInteger := FieldByName['BANCO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (QMCabecera.State = dsInsert) and param_VENCONT001 then
  begin
     // Seleccino de contacto
     // El primero de la direccion o el primero sin direccino asignada.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT 1 ORDEN, C.CONTACTO, C.DIRECCION, D.DIRECCION ');
           SQL.Add(' FROM SYS_TERCEROS_CONTACTOS C ');
           SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND C.DIRECCION = D.DIRECCION ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.TERCERO = :TERCERO AND ');
           SQL.Add(' C.DIRECCION = :DIRECCION ');
           SQL.Add(' UNION ');
           SQL.Add(' SELECT 2 ORDEN, C.CONTACTO, C.DIRECCION, 0 ');
           SQL.Add(' FROM SYS_TERCEROS_CONTACTOS C ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.TERCERO = :TERCERO AND ');
           SQL.Add(' C.DIRECCION = 0 ');
           Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
           Params.ByName['DIRECCION'].AsInteger := QMCabeceraDIRECCION.AsInteger;
           ExecQuery;
           QMCabeceraCONTACTO.AsInteger := FieldByName['CONTACTO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  QMCabeceraSU_REFERENCIA.AsString := Trim(QMCabeceraSU_REFERENCIA.AsString);
  QMCabeceraPEDIDO_CLIENTE.AsString := Trim(QMCabeceraPEDIDO_CLIENTE.AsString);
  QMCabeceraZ_OBSERVACION.AsString := Trim(QMCabeceraZ_OBSERVACION.AsString);

  if Param_DOCREFE004 and (Trim(QMCabeceraSU_REFERENCIA.AsString) <> '') then
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
              SelectSQL.Add(' SELECT LIST(TIPO || '' '' || EJERCICIO || ''-'' || SERIE || ''/'' || RIG, '', '') AS DOCUMENTO ');
              SelectSQL.Add(' FROM GES_CABECERAS_S ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' TIPO = :TIPO AND ');
              SelectSQL.Add(' CLIENTE = :CLIENTE AND ');
              SelectSQL.Add(' SU_REFERENCIA = :SU_REFERENCIA AND ');
              SelectSQL.Add(' ID_S <> :ID_S ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
              Params.ByName['SU_REFERENCIA'].AsString := QMCabeceraSU_REFERENCIA.AsString;
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              Open;
              Documentos := FieldByName('DOCUMENTO').AsString;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;

        if (Documentos > '') then
           ShowMessage(format('Hay otro/s documento/s con la misma referencia para este cliente.'#13#10 + '%s', [Documentos]));
     end;
  end;

  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_S', 'ID_S'); // ID

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 EMPRESA FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIG < :RIG AND ');
        SQL.Add(' FECHA > :FECHA ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['FECHA'].AsDateTime := Trunc(QMCabeceraFECHA.AsDateTime) + 1;
        ExecQuery;
        if (FieldByName['EMPRESA'].AsInteger > 0) then
           ShowMessage(_('CUIDADO. La fecha de la factura es incorrecta'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (QMCabeceraFECHA_ENTREGA.AsDateTime < QMCabeceraFECHA.AsDateTime) then
     ShowMessage(_('CUIDADO. La fecha de entrega de la última factura es menor que la actual.'));

  ComprobarFecha(QMCabeceraFECHA_ENTREGA.AsDateTime);

  RecalculaPrecios := False;
  RecalculaTarifa := False;
  if (Editando) then
  begin
     // Cambio de Moneda
     {
     // dji lrk kri - No recalculo precios si cambia la moneda o la fecha
     if (QMCabeceraMONEDA.AsString <> REntorno.MonedaEmpresa) then
        if (FechaOld <> QMCabeceraFECHA.AsDateTime) then
           if (Application.MessageBox('ATENCION! Se recalcularán los precios en función del cambio de moneda.',
              'Confirmación', MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
               RecalculaPrecios := True;
        else
           QMCabeceraFECHA.AsDateTime := FechaOld;
     }
     // Cambio de tarifa
     if (QMCabeceraTARIFA.AsString <> Tarifa_old) then
     begin
        if (HayCambioIVATarifa(QMCabeceraTARIFA.AsString, Tarifa_old)) then
        begin
           if (Application.MessageBox(PChar(string(_('ATENCION! Se recalcularán los precios en función la nueva tarifa.'))),
              PChar(string(_('Confirmación'))), MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
              RecalculaTarifa := True;
           // else
           // begin
           //    RecalculaTarifa := False;
           //    QMCabeceraTARIFA.AsString := Tarifa_old;
           // end;
        end
        else
        begin
           if (Application.MessageBox(PChar(string(_('Desea recalcular los precios en función de la nueva.'))),
              PChar(string(_('Confirmación'))), MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
              RecalculaTarifa := True;
           // else
           //   RecalculaTarifa := False;
        end;
     end;
  end;

  if ((REntorno.Pais = 'CHL') and (QMCabeceraGD_FOLIOREF.AsString = '')) then
  begin
     // Verificamos que se haya asignado un tipo de documento tributario
     if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = 'DES') then
        raise Exception.Create(_('Debe asignar un tipo de documento tributario'));

     if (QMCabecera.State = dsInsert) then
     begin
        // QMCabeceraSII_ID_DOC_REF.AsInteger := QMCabeceraID_S.AsInteger;
        // QMCabeceraTPODOCREF := QMCabeceraTIPO_DOC_TRIBUTARIO;
        // QMCabeceraFCHREF.AsDateTime := QMCabeceraFECHA.AsDateTime;

        // Si el documento es una factura electronica asignamos primera referencia asi misma
        if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '33') then
        begin
           DMMain.CreaReferenciaDte(QMCabeceraID_S.AsInteger, 0, QMCabeceraID_S.AsInteger, '', QMCabeceraTIPO_DOC_TRIBUTARIO.AsString, '', '', QMCabeceraFECHA.AsDateTime);
           Refrescar(QMSIIDteReferencia, 'NROLINREF', QMSIIDteReferenciaNROLINREF.AsInteger);
        end;
     end;
  end;

  // Si se edita se asigna forma de pago SII por trigger
  if ((REntorno.Pais = 'CHL') and (QMCabecera.State = dsEdit)) then
     QMCabeceraSII_FMA_PAGO.AsInteger := 0;
end;

procedure TDMFacturas.QMDetalleARTICULOChange(Sender: TField);
var
  MostrarUdsExt, Baja : boolean;
  AlmacenDefecto : string;
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  if (not DMMain.ArticuloBloqueado(Sender.AsString, 'FAC')) then
  begin
     QMDetalleID_A.AsInteger := 0;
     QMDetalleID_C_A.AsInteger := 0;

     xArticulos.Close;
     xArticulos.Open;

     Baja := (xArticulos.FieldByName('BAJA').AsInteger = 1);
     if Baja then
        raise Exception.Create(_('El articulo esta dado de baja'));

     QMDetalleTITULO.AsString := xArticulos.FieldByName('TITULO_LARGO').AsString;
     QMDetalleALFA_1.AsString := xArticulos.FieldByName('ALFA_1').AsString;
     QMDetalleALFA_2.AsString := xArticulos.FieldByName('ALFA_2').AsString;
     QMDetalleALFA_3.AsString := xArticulos.FieldByName('ALFA_3').AsString;
     QMDetalleALFA_4.AsString := xArticulos.FieldByName('ALFA_4').AsString;
     QMDetalleALFA_5.AsString := xArticulos.FieldByName('ALFA_5').AsString;
     QMDetalleALFA_6.AsString := xArticulos.FieldByName('ALFA_6').AsString;
     QMDetalleALFA_7.AsString := xArticulos.FieldByName('ALFA_7').AsString;
     QMDetalleALFA_8.AsString := xArticulos.FieldByName('ALFA_8').AsString;
     QMDetalleDECIMALES_UNIDADES.AsInteger := DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString);
     QMDetalleCONTROL_STOCK.AsInteger := xArticulos.FieldByName('CONTROL_STOCK').AsInteger;

     if (xArticulos.FieldByName('PROYECTO').AsInteger <> 0) then
        QMDetallePROYECTO.AsInteger := xArticulos.FieldByName('PROYECTO').AsInteger;

     with xCliente do
     begin
        Close;
        Open;
        EntornoDoc.Tarifa := QMCabeceraTARIFA.AsString;
        EntornoDoc.Cliente := QMCabeceraCLIENTE.AsInteger;
     end;

     // Solo muestra la ventana de unidades extendidas al pulsar el boton en el FM
     MostrarUdsExt := (DMMain.EstadoKri(21) = 0);

     // Solo muestra la ventana de unidades extendidas al pulsar el boton en el FM
     CambiaUnidadesExt(Sender, False, MostrarUdsExt);

     QMDetalleCOSTE_ADICIONAL.AsFloat := xArticulos.FieldByName('COSTE_ADICIONAL').AsFloat;

     QMDetallePESO_TOTAL.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES.AsFloat;
     QMDetalleSIGNO_UNIDADES.AsString := xArticulos.FieldByName('SIGNO').AsString;

     // Calcular la comision de acuerdo al cliente, articulo, familia, agrupacion
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_COMISION_AGENTE(:EMPRESA, :EJERCICIO, :CANAL, :AGENTE, :CLIENTE, :ARTICULO, :P_COSTE, :P_VENTA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['AGENTE'].AsInteger := QMCabeceraAGENTE.Value;
           Params.ByName['CLIENTE'].AsInteger := EntornoDoc.Cliente;
           Params.ByName['ARTICULO'].AsString := Sender.AsString;
           Params.ByName['P_COSTE'].AsFloat := 0;
           Params.ByName['P_VENTA'].AsFloat := 0;
           ExecQuery;
           QMDetalleCOMISION.AsFloat := FieldByName['P_COMISION'].AsFloat;
           QMDetalleCOMISION_LINEAL.AsFloat := FieldByName['COMISION_LINEAL'].AsFloat;
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
           SQL.Add(' SELECT TIPO_IVA, ID_A, ID_C_A, DISPONIBILIDAD, TIPO_IMPUESTO_ADICIONAL ');
           SQL.Add(' FROM CON_CUENTAS_GES_ART ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ARTICULO'].AsString := Sender.AsString;
           ExecQuery;

           if (FieldByName['ID_C_A'].AsInteger = 0) then
              raise Exception.Create(_('No se ha podido encontrar el artículo en el ejercicio'));

           QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
           QMDetalleID_C_A.AsInteger := FieldByName['ID_C_A'].AsInteger;
           QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger := FieldByName['TIPO_IMPUESTO_ADICIONAL'].AsInteger;
           QMDetalleTIPO_IVA.AsInteger := FieldByName['TIPO_IVA'].AsInteger;

           // Para Chile - Si es factura exenta, el tipo de IVA sera cero
           if ((REntorno.Pais = 'CHL') and (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '34')) then
              QMDetalleTIPO_IVA.AsInteger := 0;

           if REntorno.VerSoloArticulosDisponibles then
              if (not (FieldByName['DISPONIBILIDAD'].AsInteger in [1, 2])) then
                 QMDetalle.Cancel;

           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDetalleTITULO_IDIOMA.AsString := DameTituloIdiomaArticulo(QMDetalleID_A.AsInteger, QMCabeceraIDIOMA.AsString);

     if ((xArticulos.FieldByName('ANTICIPO').AsInteger = 1) or
        (xArticulos.FieldByName('ANTICIPO_CONTADO').AsInteger = 1)) then
        QMDetalleTIPO_LINEA.AsString := 'ANT'
     else
     if (QMDetalleTIPO_LINEA.AsString = 'ANT') then
     begin
        QMDetalleTIPO_LINEA.AsString := 'NOR';
        QMDetalleFECHA_ANTICIPO.Clear;
        QMDetalleCTA_PAGO_ANTICIPO.AsString := ' ';
     end;

     if ({REntorno.PVP_Ud_Sec and} (xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger = 1)) then
        QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger := 1;

     // Unidad Logistica
     if (QMDetalle.State in [dsEdit, dsInsert]) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT A.TIPO, S.UNIDADES FROM ART_ARTICULOS_UNIDAD_LOGISTICA A ');
              SQL.Add(' JOIN SYS_TIPO_UNIDAD_LOGISTICA S ');
              SQL.Add(' ON A.TIPO = S.TIPO ');
              SQL.Add(' WHERE ');
              SQL.Add(' A.EMPRESA = ?EMPRESA AND ');
              SQL.Add(' A.ARTICULO = ?ARTICULO AND ');
              SQL.Add(' A.DEFECTO = 1 ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
              ExecQuery;
              QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := FieldByName['TIPO'].AsString;
              QMDetalleUNIDADES.AsFloat := FieldByName['UNIDADES'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si calcula el peso segun las unidades secundarias
     if param_VENUSEC001 and (QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger = 1) then
        QMDetallePESO.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES_SEC.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat {dji}
     else
        QMDetallePESO.AsFloat := xArticulos.FieldByName('PESO').AsFloat * xArticulos.FieldByName('FACTOR_UNIDAD').AsFloat;

     QMDetallePESO_TOTAL.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;

     if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
     begin
        FlagModificandoUnidades := True;
        try
           QMDetalleUNIDADES.AsFloat := QMDetallePESO.AsFloat * 1;
           QMDetallePESO_TOTAL.AsFloat := QMDetalleUNIDADES.AsFloat;
        finally
           FlagModificandoUnidades := False;
        end;
     end;

     if Param_VENARTU001 and (QMDetalleARTICULO.AsString = REntorno.ArtTextoLibre) then
        QMDetalleUNIDADES.AsInteger := 0;

     DMMain.MuestraAviso('ART', xArticulos.FieldByName('ID_A').AsInteger, QMCabeceraTIPO.AsString);

     if (Param_FACLSIM001) then
     begin
        QMDetalleLOTE_SIMPLE.AsString := DMMain.DameLoteSimple(QMDetalleARTICULO.AsString, QMCabeceraFECHA.AsDateTime);
     end;

     if ((DMMain.EstadoKri(420) = 1) and (Trim(QMDetalleARTICULO.AsString) > '')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT CUENTA FROM C_DAME_CUENTA_ART_VENTA(:ID_C_A, :SERIE, :PROYECTO, :ABONO, :DEVOLUCION, :GRUPO_CUENTAS)';
              Params.ByName['ID_C_A'].AsInteger := QMDetalleID_C_A.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['PROYECTO'].AsInteger := QMCabeceraPROYECTO.AsInteger;
              Params.ByName['ABONO'].AsInteger := QMCabeceraSIN_DETALLE.AsInteger;
              Params.ByName['DEVOLUCION'].AsInteger := QMCabeceraDEVOLUCION.AsInteger;
              Params.ByName['GRUPO_CUENTAS'].AsInteger := xCliente.FieldByName('GRUPO_CUENTAS').AsInteger;
              ExecQuery;
              QMDetalleCUENTA.AsString := FieldByName['CUENTA'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
        QMDetalleCUENTA.AsString := '';

     // Asignamos Almacen por defecto
     AlmacenDefecto := DMMain.DameAlmacenDefectoArticulo(QMDetalleARTICULO.AsString);
     if (AlmacenDefecto <> '') then
        QMDetalleALMACEN.AsString := AlmacenDefecto
     else
        QMDetalleALMACEN.AsString := QMCabeceraALMACEN.AsString;
  end
  else
     QMDetalle.Cancel;
end;

procedure TDMFacturas.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_S.AsInteger > 0) then
        Open;
  end;

  with xCertificadoAnt do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFacturas.QMDetalleBeforePost(DataSet: TDataSet);
var
  HayStock : integer;
  {RiesgoDisponible,} RiesgoAut, RiesgoAct, RiesgoPed, RLinea : double;
  pot10 : extended;
  P_IVA : real;
  MaximoDescuento, DescuentoLineaCondicion : double;
  s : string;
begin
  // Comprobación de, si es un número de serie, sea siempre una unidad
  if (QMDetalleNSERIE.AsString <> '') then
     if ((QMDetalleUNIDADES.AsFloat <> 1) and (QMDetalleUNIDADES.AsFloat <> -1)) then
        raise Exception.Create(_('No se puede vender más de una unidad de un artículo serializado'));

  // DIFO - Obtengo descuento segun condiciones. Es un descuento valido a pesar de con cumplir con MaximoDescuento (Parametro DOCDESC001).
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT * FROM G_PRECIO_VENTA_MONEDA(:EMPRESA, :CLIENTE, :ARTICULO, :TARIFA, :FECHA, :EJERCICIO, :CANAL, ');
        SQL.Add(' :UNIDADES_EXT, :PRECIOP, :UNIDADES, :MONEDA, :ID_A, :UNIDADES_OLD, :IDIOMA, :TIPO_LINEA, :ID_P_OLD, :ALMACEN, :FACTOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := EntornoDoc.Cliente;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        Params.ByName['TARIFA'].AsString := EntornoDoc.Tarifa;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['UNIDADES_EXT'].AsFloat := QMDetalleUNIDADES_EXT.AsFloat;
        Params.ByName['PRECIOP'].AsFloat := 0;
        Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
        Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
        Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
        Params.ByName['UNIDADES_OLD'].AsFloat := 0;
        Params.ByName['IDIOMA'].AsString := QMCabeceraIDIOMA.AsString;
        Params.ByName['TIPO_LINEA'].AsString := QMDetalleTIPO_LINEA.AsString;
        Params.ByName['ID_P_OLD'].AsInteger := 0;
        Params.ByName['FACTOR'].AsFloat := QMCabeceraVALOR_CAMB_FIJO.AsFloat;
        ExecQuery;
        DescuentoLineaCondicion := FieldByName['DESCUENTO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  MaximoDescuento := param_DOCDESC001;
  if (MaximoDescuento > DescuentoLineaCondicion) then
     DescuentoLineaCondicion := MaximoDescuento;

  if (MaximoDescuento >= 0) then
  begin
     if (QMDetalleDESCUENTO.AsFloat > DescuentoLineaCondicion) then
        raise Exception.Create(Format(_('El descuento no puede ser mayor a %f'), [DescuentoLineaCondicion]));
  end;

  Muestra_InfoStock := True;

  if (ControlaStockNegativo or param_FACNOST001) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT HAY_STOCK FROM G_VENTAS_CONTROLA_STOCK_NEG(?EMPRESA,?CANAL,?ALMACEN,?ARTICULO,?UNIDADES)';
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           Params.ByName['UNIDADES'].AsDouble := QMDetalleUNIDADES.AsFloat - Unidades_Old;
           ExecQuery;
           HayStock := Fields[0].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (HayStock < 0) then
     begin
        if (param_FACNOST001) then
           raise Exception.Create(_('No hay existencias suficientes.'))
        else
        begin
           Muestra_InfoStock := False;
           FMFacturas.MuestraStock(1);
        end;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT A.TIPO, S.UNIDADES FROM ART_ARTICULOS_UNIDAD_LOGISTICA A ');
        SQL.Add(' JOIN SYS_TIPO_UNIDAD_LOGISTICA S ');
        SQL.Add(' ON A.TIPO = S.TIPO ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' A.ARTICULO = ?ARTICULO AND ');
        SQL.Add(' A.DEFECTO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        ExecQuery;
        s := FieldByName['TIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
  if (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString <> s) then
     ShowMessage(_('La unidad logistica de la linea no coincide con la unidad logistica del articulo'));

  // Riesgo en Pedidos, Autorizado y Actual
  RiesgoPed := DMMain.DameRiesgoPedido(QMCabeceraCLIENTE.AsInteger);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIESGO_AUT, RIESGO_ACT FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
        ExecQuery;
        RiesgoAut := FieldByName['RIESGO_AUT'].AsFloat;
        RiesgoAct := FieldByName['RIESGO_ACT'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  pot10 := Power(10, REntorno.DecimalesCalculo);
  RiesgoAut := (Trunc(RiesgoAut * pot10)) / pot10;

  RLinea := QMDetallePRECIO.AsFloat * QMDetalleUNIDADES.AsFloat;
  RLinea := RLinea - (RLinea * QMDetalleDESCUENTO.AsFloat / 100);
  RLinea := RLinea - (RLinea * QMDetalleDESCUENTO_2.AsFloat / 100);
  RLinea := RLinea - (RLinea * QMDetalleDESCUENTO_3.AsFloat / 100);

  if (QMDetalle.State = dsEdit) then
  begin
     RLinea := RLinea + (RLinea * QMDetalleP_IVA.AsFloat / 100);
     RLinea := RLinea - LiquidoAnt;
  end
  else
  begin
     {Busco porcentaje IVA}
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT P_IVA FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = :TIPO';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['TIPO'].AsInteger := QMDetalleTIPO_IVA.AsInteger;
           ExecQuery;
           P_IVA := FieldByName['P_IVA'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     RLinea := RLinea + (RLinea * P_IVA / 100);
  end;

  if (((RiesgoAut > 0) or KriConf126) and
     (RiesgoAut < RiesgoAct + RiesgoPed + RLinea)) then
  begin
     ShowMessage(
        format(_('El Riesgo Autorizado para el Cliente se ha superado.' + #13#10 +
        'Riesgo Autorizado: %s' + #13#10 +
        'Riesgo Actual: %s'), [FormatFloat(MascaraN, RiesgoAut), FormatFloat(MascaraN, RiesgoAct + RiesgoPed + RLinea)])
        );

     if (xCliente.FieldByName('NO_VENTA_RIESGO').AsInteger = 1) then
        Abort;

     InfoActualiza;
  end;
  {------------------------------------------------------------------------------}

  QMDetalleENTRADA.AsInteger := REntorno.Entrada;

  // ID
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_S', 'ID_DETALLES_S');

  {Calculo el CRC de las notas para poder agrupar}
  QMDetalleCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS));
  QMDetalleCRC_NOTAS2.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS2));

  {Unidades Logisticas}
  if (Param_SYSCONF005 = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT UNIDADES, RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA WHERE TIPO=?TIPO';
           Params.ByName['TIPO'].AsString := QMDetalleTIPO_UNIDAD_LOGISTICA.AsString;
           ExecQuery;
           if ((QMDetalleUNIDADES.AsFloat <> QMDetalleUNIDADES_LOGISTICAS.AsFloat * FieldByName['UNIDADES'].AsFloat) and
              (FieldByName['RELACIONAR_CON_UNIDADES'].AsInteger = 1)) then
              ShowMessage(_('ATENCION! Las Unidades Logísticas no coinciden exactamente con las unidades del artículo'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ((KriConf429) and (QMDetalleCONTROL_STOCK.AsInteger = 1)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EXISTENCIAS, STOCK_MINIMO FROM A_ART_DAME_STOCK_ART_ED (:EMPRESA, 1 /*CANAL*/, :ARTICULO, :ALMACEN, 1, 1, 0, 0, 0, 0, 0, NULL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           if ((FieldByName['EXISTENCIAS'].AsInteger - QMDetalleUNIDADES.AsInteger) < FieldByName['STOCK_MINIMO'].AsInteger) then
              MessageDlg(Format(_('El articulo %s rebasará el stock mínimo'), [QMDetalleARTICULO.AsString]), mtWarning, [mbOK], 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xCliente.Open;
  QMDetalle.Open;
  QMNIF.Open;
  xDirecciones.Open;
  xCampanyas.Open;
  RefrescaIRPF;
  xRangos.Open;
  xIndices.Open;
  QMDetalleCertificado.Open;
  QMFirmas.Open;
  InfoActualiza;

  if (REntorno.Pais = 'CHL') then
  begin
     QMCabeceraFEChile.Open;
     QMSIIDteReferencia.Open;
     xFactoring.Open;
  end;

  if (REntorno.Pais = 'DOM') then
     QMDGIIReferencias.Open;
end;

procedure TDMFacturas.CierraFactura;
var
  Cierra : boolean;
  Q : THYFIBQuery;
  Anticipo : double;
  AnticipoMaximo : double;
  Moneda : string;
  Accion : integer;
  NumeroAutorizacion : string;
  NumeroDosificacion : integer;
  NIT : string;
  FechaTransaccion : TDateTime;
  MontoTransaccion : double;
  LlaveDosificacion : string;
  CodigoControl : string;
  CodigoRespuestaRapida : string;
  FechaContabilizacion : TDateTime;
  FicheroTicketBAI : string;
  Clave1, Clave2, Clave3 : string;
  Certificado : string;
  SignatureValue : string;
  CodigoIdentificativo : string;
  StreamOrigen, StreamDestino : TStream;
  FacturaAnterior : integer;
begin
  // Aviso de total 0
  Cierra := True;

  if (xInfoActualizadaTOTAL_A_COBRAR.AsFloat = 0) then
     Cierra := (Application.MessageBox(PChar(string(_('Se va a cerrar un documento con total 0. Confirme por favor.'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes);

  if (Cierra) then
  begin
     if (REntorno.Pais = 'CHL') then
     begin
        DMMain.ReNumerarOrdenDetalleVenta(QMCabeceraID_S.AsInteger);

        // Validamos que se hayan ingresado todos los datos
        if (QMCabeceraCODIGO_GIRO_EMPRESA.AsInteger <= 0) then
        begin
           ShowMessage(_('Debe asiganar el giro de la empresa'));
           Cierra := False;
        end;
     end;
  end;

  if (Cierra) then
  begin
     // Anticipos creados en documentos de herencia (ALB, PEC, OFC)
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT IMPORTE_ANTICIPO ');
           SQL.Add(' FROM DAME_ANTICIPOS_PENDIENTE(:ID_S) ');
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           Anticipo := FieldByName['IMPORTE_ANTICIPO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Si no es un abono
     if (xInfoActualizadaLIQUIDO.AsFloat > 0) then
     begin
        // Si no hay anticipos para este documento, busco en la cuenta de anticipos el saldo disponible
        if (Anticipo = 0) then
        begin
           // Cuanto anticipo utilizó la última vez que cerró la factura
           Anticipo := QMCabeceraIMPORTE_ANTICIPO.AsFloat;

           // Averiguo cuanto anticipo puede utilizar (Saldo de la 4380)
           DMMain.SaldoAnticipo('CLI', QMCabeceraCLIENTE.AsInteger, REntorno.FechaTrabSH, AnticipoMaximo, Moneda);

           // No puede utilizar mas que el total de la factura
           if (AnticipoMaximo > xInfoActualizadaLIQUIDO.AsFloat) then
              AnticipoMaximo := xInfoActualizadaLIQUIDO.AsFloat;

           // Por defecto, el importe de la factura.
           if ((Anticipo = 0) and (AnticipoMaximo > 0)) then
              Anticipo := AnticipoMaximo;

           // Evito que se anticipe mas que el saldo disponible
           if (Anticipo > AnticipoMaximo) then
              Anticipo := AnticipoMaximo;

           // Si hay saldo pregunto cuanto desea utilizar
           if (AnticipoMaximo > 0) then
           begin
              Cierra := TFPregAnticipo.Create(Self).Mostrar(Anticipo, Moneda, AnticipoMaximo);

              // Evito que se anticipe mas que el saldo disponible
              if (Anticipo > AnticipoMaximo) then
                 Anticipo := AnticipoMaximo;
           end;
        end;
     end;
  end;

  if (Cierra) then
  begin
     if (REntorno.Pais = 'BOL') then
     begin
        // Calculo del codigo de control cuando se cierra la factura.
        // Ver si hay que tomar el contador de la autorizacion como numero de factura.
        // Replicar comportamiento en UDMTicketVenta.

        if (QMCabeceraCLIENTE.AsInteger < 0) then
           NIT := QMNIFNIF.AsString
        else
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT T.NIF FROM EMP_CLIENTES C ');
                 SQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' C.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' C.CLIENTE = :CLIENTE ');
                 Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                 Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
                 ExecQuery;
                 NIT := FieldByName['NIF'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Obtenemos la llave de doscificacion
        LlaveDosificacion := DMMain.DameLlaveDosificacion('E', NumeroAutorizacion);
        if (LlaveDosificacion = '') then
           raise Exception.Create(_('No existe una llave de doscificacion valida'));

        FechaTransaccion := Trunc(QMCabeceraFECHA.AsDateTime);
        MontoTransaccion := QMCabeceraLIQUIDO.AsFloat;

        //Calculamos el numero de doscificacion
        NumeroDosificacion := DMMain.DameNumeroDosifiacion('E', NumeroAutorizacion);

        CodigoControl := DameCodigoControl(NumeroAutorizacion, IntToStr(NumeroDosificacion), NIT, LlaveDosificacion, FechaTransaccion, MontoTransaccion);
        CodigoRespuestaRapida := REntorno.CifEmpresa{EMISOR} + '|' + IntToStr(NumeroDosificacion) + '|' + NumeroAutorizacion + '|' + DateTimeToStr(FechaTransaccion) + '|' + FloatToStr(MontoTransaccion) + '|' + FloatToStr(0 {Base}) + '|' + CodigoControl + '|' + NIT{NIT Comprador} + '|' + '0'{Importe ICE} + '|' + '0'{Importe por ventas no gravadas} + '|' + '0'{Importe no sujeto} + '|' + '0'{Descuentos, bonificaciones};

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE GES_CABECERAS_S_FAC ');
              SQL.Add(' SET ');
              SQL.Add(' SFV_AUTORIZACION = :SFV_AUTORIZACION, ');
              SQL.Add(' SFV_CODIGO_CONTROL = :SFV_CODIGO_CONTROL, ');
              SQL.Add(' SFV_NUM_DOSIFICACION = :SFV_NUM_DOSIFICACION, ');
              SQL.Add(' SFV_CODIGO_RESPUESTA_RAPIDA = :SFV_CODIGO_RESPUESTA_RAPIDA ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_S = :ID_S ');
              Params.ByName['SFV_AUTORIZACION'].AsString := NumeroAutorizacion;
              Params.ByName['SFV_CODIGO_CONTROL'].AsString := CodigoControl;
              Params.ByName['SFV_NUM_DOSIFICACION'].AsInteger := NumeroDosificacion;
              Params.ByName['SFV_CODIGO_RESPUESTA_RAPIDA'].AsString := CodigoRespuestaRapida;
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Actualizo el anticipo a utilizar
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_CABECERAS_S_FAC SET IMPORTE_ANTICIPO = :IMPORTE_ANTICIPO WHERE ID_S = :ID_S AND IMPORTE_ANTICIPO <> :IMPORTE_ANTICIPO';
           Params.ByName['IMPORTE_ANTICIPO'].AsFloat := Anticipo;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     FechaContabilizacion := QMCabeceraFECHA_CON.AsDateTime;
     if (QMCabeceraFECHA_CON.IsNull) then
        FechaContabilizacion := QMCabeceraFECHA.AsDateTime;

     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_CIERRA2(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :FECHA, :ENTRADA, :ID_S)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['FECHA'].AsDateTime := FechaContabilizacion;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     if (LeeParametro('MODREST027', QMCabeceraSERIE.AsString) = 'S') then
     begin
        QMCabecera.Refresh;

        FicheroTicketBAI := DameTempPath + Format('TicketBAI-%d-%s-%d.xml', [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger]);

        with TTicketBAI.Create(Self) do
        begin
           try
              Inicia('Alta', FicheroTicketBAI);

              // SetSujetosEmisor(REntorno.CifEmpresa, REntorno.NombreEmpresa);
              SetSujetosEmisor(LeeDatoIni('TBAI', 'NIF', ''), LeeDatoIni('TBAI', 'Nombre', ''));
              { TODO : Terminar de ver datos de pais y tipo de documento }
              SetSujetosDestinatarios(xCliente.FieldByName('NIF').AsString, xCliente.FieldByName('TITULO').AsString, xCliente.FieldByName('PAIS_C2').AsString, '', '', xDirecciones.FieldByName('COD_POSTAL').AsString, Trim(xDirecciones.FieldByName('TITULO').AsString));
              SetFacturaCabecera(QMCabeceraSERIE.AsString, QMCabeceraRIG.AsString, FechaContabilizacion);

              // Claves Ticket BAI
              {
              L9
              Clave de régimen especial de IVA y operaciones con trascendencia tributaria
              Valores - Descripción
              01 Operación de régimen general y cualquier otro supuesto que no esté recogido en los siguientes valores
              02 Exportación03Operaciones a las que se aplique el régimen especial de bienes usados, objetos de arte, antigüedades y objetos de colección
              04 Régimen especial del oro de inversión
              05 Régimen especial de las agencias de viajes
              06 Régimen especial grupo de entidades en IVA (Nivel Avanzado)
              07 Régimen especial del criterio de caja
              08 Operaciones sujetas al IPSI/IGIC (Impuesto sobre la Producción, los Servicios y la Importación / Impuesto General Indirecto Canario)
              09 Facturación de las prestaciones de servicios de agencias de viaje que actúan como mediadoras en nombre y por cuenta ajena (disposición adicional 3ª del Reglamento de Facturación)
              10 Cobros por cuenta de terceros o terceras de honorarios profesionales o de derechos derivados de la propiedad industrial, de autor u otros por cuenta de sus socios, socias, asociados, asociadas, colegiados o colegiadas efectuados por sociedades, asociaciones, colegios profesionales u otras entidades que realicen estas funciones de cobro
              11 Operaciones de arrendamiento de local de negocio sujetos a retención
              12 Operaciones de arrendamiento de local de negocio no sujetos a retención
              13 Operaciones de arrendamiento de local de negocio sujetas y no sujetas a retención
              14 Factura con IVA pendiente de devengo en certificaciones de obra cuya destinataria sea una Administración Pública
              15 Factura con IVA pendiente de devengo en operaciones de tracto sucesivo
              51 Operaciones en recargo de equivalencia
              52 Operaciones en régimen simplificado
              53 Operaciones realizadas por personas o entidades que no tengan la consideración de empresarios, empresarias o profesionales a efectos del IVA
              }

              { TODO : Terminar de ver como seleccionar la clave que corresponda }
              // Claves
              {
              L9
              Clave de régimen especial de IVA y operaciones con trascendencia tributaria
              Valores - Descripción
              01 Operación de régimen general y cualquier otro supuesto que no esté recogido en los siguientes valores
              02 Exportación
              03 Operaciones a las que se aplique el régimen especial de bienes usados, objetos de arte, antigüedades y objetos de colección
              04 Régimen especial del oro de inversión
              05 Régimen especial de las agencias de viajes
              06 Régimen especial grupo de entidades en IVA (Nivel Avanzado)
              07 Régimen especial del criterio de caja
              08 Operaciones sujetas al IPSI/IGIC (Impuesto sobre la Producción, los Servicios y la Importación / Impuesto General Indirecto Canario)
              09 Facturación de las prestaciones de servicios de agencias de viaje que actúan como mediadoras en nombre y por cuenta ajena (disposición adicional 3ª del Reglamento de Facturación)
              10 Cobros por cuenta de terceros o terceras de honorarios profesionales o de derechos derivados de la propiedad industrial, de autor u otros por cuenta de sus socios, socias, asociados, asociadas, colegiados o colegiadas efectuados por sociedades, asociaciones, colegios profesionales u otras entidades que realicen estas funciones de cobro
              11 Operaciones de arrendamiento de local de negocio sujetos a retención
              12 Operaciones de arrendamiento de local de negocio no sujetos a retención
              13 Operaciones de arrendamiento de local de negocio sujetas y no sujetas a retención
              14 Factura con IVA pendiente de devengo en certificaciones de obra cuya destinataria sea una Administración Pública
              15 Factura con IVA pendiente de devengo en operaciones de tracto sucesivo
              51 Operaciones en recargo de equivalencia
              52 Operaciones en régimen simplificado
              53 Operaciones realizadas por personas o entidades que no tengan la consideración de empresarios, empresarias o profesionales a efectos del IVA
              }
              Clave1 := '01';
              Clave2 := '';
              Clave3 := '';
              SetFacturaDatos(FechaContabilizacion, _('Venta'), QMCabeceraLIQUIDO.AsFloat, QMCabeceraI_RETENCION.AsFloat, 0 {BaseImponibleACoste}, Clave1, Clave2, Clave3);

              with TFIBDataSet.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    Transaction := DameTransactionRO(DMMain.DataBase);
                    try
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                       SelectSQL.Add(' SELECT TITULO, UNIDADES, PRECIO, I_DESCUENTO, B_DTO_LINEA, BRUTO, ROUND(LIQUIDO, 2) AS LIQUIDO ');
                       SelectSQL.Add(' FROM VER_DETALLE_FACTURA ');
                       SelectSQL.Add(' WHERE ');
                       SelectSQL.Add(' ID_S = :ID_S ');
                       SelectSQL.Add(' ORDER BY RIG, ORDEN ');
                       Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
                       Open;
                       while not EOF do
                       begin
                          SetFacturaDetalle(FieldByName('TITULO').AsString, FieldByName('UNIDADES').AsFloat, FieldByName('PRECIO').AsFloat {/ FieldByName('UNIDADES').AsFloat}, FieldByName('I_DESCUENTO').AsFloat, FieldByName('LIQUIDO').AsFloat);

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

              if (QMCabeceraI_PORTES.AsFloat <> 0) then
                 SetFacturaDetalle(_('PORTES'), 1, QMCabeceraI_PORTES.AsFloat, 0, QMCabeceraI_PORTES.AsFloat + (QMCabeceraI_PORTES.AsFloat * 21 / 100));

              // Abro registro de IVA
              with TFIBDataSet.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    Transaction := DameTransactionRO(DMMain.DataBase);
                    try
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                       SelectSQL.Add(' SELECT D.DEDUCIBLE, M.IVA, M.TIPO_TRANSACCION, M.RECARGO, T.REGIMEN, D.B_IMPONIBLE, D.P_IVA, D.P_REC, D.I_IVA, D.I_REC, D.INVERSION_SUJETO_PASIVO ');
                       SelectSQL.Add(' FROM EMP_REGISTRO_IVA C ');
                       SelectSQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON C.ID_I = D.ID_I ');
                       SelectSQL.Add(' JOIN SYS_MODO_IVA M ON C.MODO = M.MODO ');
                       SelectSQL.Add(' JOIN SYS_TIPO_IVA T ON D.TIPO_IVA = T.TIPO ');
                       SelectSQL.Add(' WHERE ');
                       SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
                       SelectSQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
                       SelectSQL.Add(' C.CANAL = :CANAL AND ');
                       SelectSQL.Add(' C.SIGNO = :SIGNO AND ');
                       SelectSQL.Add(' C.REGISTRO = :REGISTRO AND ');
                       SelectSQL.Add(' T.PAIS = :PAIS ');
                       SelectSQL.Add(' ORDER BY D.P_IVA ');
                       Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                       Params.ByName['SIGNO'].AsString := 'R';
                       Params.ByName['REGISTRO'].AsInteger := QMCabeceraREGISTRO.AsInteger;
                       Params.ByName['PAIS'].AsString := REntorno.PAis;
                       Open;
                       while not EOF do
                       begin
                          // Desglose a nivel de factura
                          // Desglose de factura: Cuando la contraparte es un "nacional"
                             {
                             SetFacturaDesgloseFactura_SujetaExenta(CausaExencion: string; BaseImponible: double);
                             SetFacturaDesgloseFactura_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
                             SetFacturaDesgloseFactura_NoSujeta(Causa: string; Imponible: double);
                             }
                          if (FieldByName('TIPO_TRANSACCION').AsInteger = 0) then
                          begin
                             // Nacionales
                             if (FieldByName('IVA').AsInteger = 0) then
                                // L13 Causa de no sujeción
                                // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
                                // RL No sujeto por reglas de localización
                                SetFacturaDesgloseFactura_NoSujeta('OT', FieldByName('B_IMPONIBLE').AsFloat)
                             else
                             if (FieldByName('P_IVA').AsFloat = 0) then
                                // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
                                // E1 Exenta por el artículo 20 de la Norma Foral del IVA
                                // E2 Exenta por el artículo 21 de la Norma Foral del IVA
                                // E3 Exenta por el artículo 22 de la Norma Foral del IVA
                                // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
                                // E5 Exenta por el artículo 25 de la Norma Foral del IVA
                                // E6 Exenta por otra causa
                                SetFacturaDesgloseFactura_SujetaExenta('E1', FieldByName('B_IMPONIBLE').AsFloat)
                             else
                             // L11
                             // S1 Sin inversión del sujeto pasivo
                             // S2 Con inversión del sujeto pasivo
                             if (FieldByName('INVERSION_SUJETO_PASIVO').AsInteger = 0) then
                             begin
                                if (FieldByName('RECARGO').AsInteger = 0) then
                                   SetFacturaDesgloseFactura_SujetaNoExenta('S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                else
                                   SetFacturaDesgloseFactura_SujetaNoExenta('S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                             end
                             else
                             begin
                                if (FieldByName('RECARGO').AsInteger = 0) then
                                   SetFacturaDesgloseFactura_SujetaNoExenta('S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                else
                                   SetFacturaDesgloseFactura_SujetaNoExenta('S2', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                             end;
                          end;

                          // Desglose de Tipo de Operación
                          // Entrega de bienes / Prestación de servicio: Cuando contraparte es no nacional.

                          { TODO : Averiguar como decidir si es entrega de bienes o prestacion de servicios }

                             {
                             SetFacturaDesgloseOperacion_Entrega_SujetaExenta(CausaExencion: string; BaseImponible: double);
                             SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
                             SetFacturaDesgloseOperacion_Entrega_NoSujeta(Causa: string; Imponible: double);

                             SetFacturaDesgloseOperacion_PrestacionServicios_SujetaExenta(CausaExencion: string; BaseImponible: double);
                             SetFacturaDesgloseOperacion_PrestacionServicios_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
                             SetFacturaDesgloseOperacion_PrestacionServicios_NoSujeta(Causa: string; Imponible: double);
                             }
                          if (FieldByName('TIPO_TRANSACCION').AsInteger <> 0) then
                          begin
                             if (FieldByName('DEDUCIBLE').AsInteger = 0) then
                                // L13 Causa de no sujeción
                                // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
                                // RL No sujeto por reglas de localización
                                SetFacturaDesgloseOperacion_Entrega_NoSujeta('OT', FieldByName('B_IMPONIBLE').AsFloat)
                             else
                             if (FieldByName('P_IVA').AsFloat = 0) then
                                // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
                                // E1 Exenta por el artículo 20 de la Norma Foral del IVA
                                // E2 Exenta por el artículo 21 de la Norma Foral del IVA
                                // E3 Exenta por el artículo 22 de la Norma Foral del IVA
                                // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
                                // E5 Exenta por el artículo 25 de la Norma Foral del IVA
                                // E6 Exenta por otra causa
                                SetFacturaDesgloseOperacion_Entrega_SujetaExenta('E1', FieldByName('B_IMPONIBLE').AsFloat)
                             else
                             // L11
                             // S1 Sin inversión del sujeto pasivo
                             // S2 Con inversión del sujeto pasivo
                             if (FieldByName('INVERSION_SUJETO_PASIVO').AsInteger = 0) then
                             begin
                                if (FieldByName('RECARGO').AsInteger = 0) then
                                   SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta('S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                else
                                   SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta('S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                             end
                             else
                             begin
                                if (FieldByName('RECARGO').AsInteger = 0) then
                                   SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta('S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                else
                                   SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta('S2', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
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

              // Obtengo datos de factura anterior
              with TFIBDataSet.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    Transaction := DameTransactionRO(DMMain.DataBase);
                    try
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                       SelectSQL.Add(' SELECT FIRST 1 C.SERIE, C.RIG, C.FECHA, CAST(SUBSTRING(T.SIGNATURE_VALUE FROM 1 FOR 1024) AS VARCHAR(1024)) AS SIGNATURE_VALUE ');
                       SelectSQL.Add(' FROM GES_CABECERAS_S_FAC_TBAI T ');
                       SelectSQL.Add(' JOIN GES_CABECERAS_S C ON T.ID_S = C.ID_S ');
                       SelectSQL.Add(' WHERE ');
                       SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
                       SelectSQL.Add(' T.CANAL = :CANAL AND ');
                       SelectSQL.Add(' T.SIGNATURE_VALUE > '''' ');
                       SelectSQL.Add(' ORDER BY T.SECUENCIA DESC ');
                       Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                       Open;
                       FacturaAnterior := FieldByName('RIG').AsInteger;

                       if (FacturaAnterior > 0) then
                          SetHuellaTBAIEncadenamiento(FieldByName('SERIE').AsString, FieldByName('RIG').AsString, FieldByName('FECHA').AsDateTime, FieldByName('SIGNATURE_VALUE').AsString);

                       Close;
                       Transaction.Commit;
                    finally
                       Transaction.Free;
                    end;
                 finally
                    Free;
                 end;
              end;

              // No he encontrado una factura en este ejercicio
              if (FacturaAnterior = 0) then
              begin
                 ShowMessage(_('No se ha encontrado datos para factura anterior'));
              end;

              { TODO : Obtener datos para rellenar Software}
              SetHuellaTBAISoftware(LeeDatoIni('TBAI', 'Licencia', 'TBAIBI00000000PRUEBA'), LeeDatoIni('TBAI', 'NIF', 'A99800005'), LeeDatoIni('TBAI', 'Nombre', 'SOFTWARE GARANTE TICKETBAI PRUEBA'), LeeDatoIni('TBAI', 'Version', '1.0'));

              // Utilizo la MAC del servidor como numero de serie del dispositivo
              SetHuellaTBAINumSerie(LeeDatoIni('TBAI', 'Dispositivo', ''));

              // Esto guarda el fichero generado
              Finaliza;

              // Certificado. Si viene en blanco, se toma el primero del ordenador.
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT CERTIFICADO FROM EMP_MODELOS_HACIENDA WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL';
                    Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                    ExecQuery;
                    Certificado := Trim(FieldByName['CERTIFICADO'].AsString);
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if (Certificado = '') then
                 Certificado := DMMain.DameCertificado(DMFacturas.QMDetalleSERIE.AsString);

              DMMain.Log(Format('Ceritficado: %s.', [Certificado]));

              try
                 FirmarTBAI(Certificado, Fichero);
              except
                 ShowMessage(_('No se ha podido firmar el fichero'))
              end;

              // Guardo los datos

              // Creo el registro si no existe
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO GES_CABECERAS_S_FAC_TBAI ( ');
                    SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
                    SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');

                    Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                    Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
                    Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
                    Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Fichero := ChangeFileExt(Fichero, '-Firmado.xsig');

              // Obtengo SignatureValue del xml firmado
              DMMain.Log('Fichero: ' + Fichero);
              with TXMLDocument.Create(Self) do
              begin
                 try
                    // Borro los datos que pudiera haber
                    XML.LoadFromFile(Fichero);
                    // Se activa para poder utilizar el componente
                    Active := True;
                    // Codigifacion UTF-8
                    Encoding := 'utf-8';
                    // Standalone="yes"
                    // StandAlone := 'yes';
                    // Caracter para indentar el fichero XML
                    NodeIndentStr := #8;

                    SignatureValue := DameDato(DocumentElement, ['Signature', 'ds:SignatureValue'], 'http://www.w3.org/2000/09/xmldsig#');
                    DMMain.Log(format('SignatureValue: %s', [SignatureValue]));
                 finally
                    Free;
                 end;
              end;

              with TFIBDataSet.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    Transaction := DameTransactionRW(DMMain.DataBase);
                    try
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;

                       SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FAC_TBAI WHERE ID_S = :ID_S ');

                       UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FAC_TBAI F ');
                       UpdateSQL.Add(' SET ');
                       UpdateSQL.Add(' F.XML = :XML, ');
                       UpdateSQL.Add(' F.CODIGO_IDENTIFICATIVO = :CODIGO_IDENTIFICATIVO, ');
                       UpdateSQL.Add(' F.SIGNATURE_VALUE = :SIGNATURE_VALUE, ');
                       UpdateSQL.Add(' F.SECUENCIA = COALESCE((SELECT MAX(SECUENCIA) ');
                       UpdateSQL.Add('                         FROM GES_CABECERAS_S_FAC_TBAI ');
                       UpdateSQL.Add('                         WHERE ');
                       UpdateSQL.Add('                         EMPRESA = F.EMPRESA AND ');
                       UpdateSQL.Add('                         CANAL = F.CANAL AND ');
                       UpdateSQL.Add('                         ID_S <> F.ID_S AND ');
                       UpdateSQL.Add('                         SECUENCIA > 0) + 1, 1) ');
                       UpdateSQL.Add(' WHERE ');
                       UpdateSQL.Add(' F.ID_S = :ID_S ');

                       // Abro Dataset
                       Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
                       Open;

                       // Se pone en modo Insert
                       Edit;

                       // Calculo de Codigo Identificativo
                       // TBAI-NNNNNNNNN-DDMMAA-FFFFFFFFFFFFF-CRC
                       CodigoIdentificativo := 'TBAI-' + REntorno.CifEmpresa + '-' + FormatDateTime('ddmmyy', FechaContabilizacion) + '-' + Copy(SignatureValue, 1, 13) + '-';

                       CodigoIdentificativo := CodigoIdentificativo + format('%.3d', [CalcCRC8Str(CodigoIdentificativo)]);

                       FieldByName('CODIGO_IDENTIFICATIVO').AsString := CodigoIdentificativo;
                       FieldByName('SIGNATURE_VALUE').AsString := SignatureValue;

                       StreamDestino := CreateBlobStream(FieldByName('XML'), bmRead);
                       try
                          try
                             StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                             try
                                StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                             finally
                                StreamOrigen.Free;
                             end;
                          finally
                             StreamDestino.Free;
                          end;

                          // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
                       except
                          Cancel;
                       end;

                       Post;

                       Close;
                       Transaction.Commit;
                    finally
                       Transaction.Free;
                    end;
                 finally
                    Free;
                 end;
              end;
           finally
              Free;
           end;
        end;
     end;

     QMCabecera.Refresh;
     AbrirImputacionCostes(QMCabeceraRIC.AsInteger, True);

     // A partir de aqui la factura está cerrada.
     // Si la forma de pago pide detalles, abrimos el formulario para editar la cartera generada.

     Accion := TFMDetallePagoFactura.Create(Self).PideDetalles(QMCabeceraID_S.AsInteger);
     // Previsualizar
     if (Accion = 1) then
        ImprimirDocumento(0);
     // Imprimir
     if (Accion = 2) then
        ImprimirDocumento(1);
  end;
end;

procedure TDMFacturas.AbreFactura;
begin
  if PuedeAbrirFactura then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ABRE(:ID_S)';
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end
  else
     ShowMessage(_('No tiene permisos para abrir facturas'));
end;

procedure TDMFacturas.AntesDeEditar(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMCabecera.Post;
     QMCabecera.Refresh;
     QMDetalle.Edit;
  end;

  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
     Tarifa := QMCabeceraTARIFA.AsString;
     Tercero := xCliente.FieldByName('TERCERO').AsInteger;
     Cliente := xCliente.FieldByName('CLIENTE').AsInteger;
     Almacen := QMCabeceraALMACEN.AsString;
  end;

  MonedaOld := QMCabeceraMONEDA.AsString;
  unidades_old := QMDetalleUNIDADES.AsFloat;
  FechaOld := QMCabeceraFECHA.AsDateTime;
  Editando := True;
  tarifa_old := QMCabeceraTARIFA.AsString;
  articulo_old := QMDetalleARTICULO.AsString;
end;

procedure TDMFacturas.QMCabeceraFORMA_PAGOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PRONTO_PAGO, HEREDA_FINANCIACION, PAGO_AUTOMATICO, SIN_RECIBOS FROM CON_CUENTAS_GES_FP ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['FORMA_PAGO'].AsString := QMCabeceraFORMA_PAGO.AsString;

        ExecQuery;

        if (FieldByName['PRONTO_PAGO'].AsInteger = 1) then
           QMCabeceraDTO_PP.AsFloat := xCliente.FieldByName('DESCUENTO_PP').AsFloat
        else
           QMCabeceraDTO_PP.AsFloat := 0;

        if (FieldByName['HEREDA_FINANCIACION'].AsInteger = 1) then
           QMCabeceraPOR_FINANCIACION.AsFloat := xCliente.FieldByName('POR_FINANCIACION').AsFloat;

        pago_automatico := (FieldByName['PAGO_AUTOMATICO'].AsInteger = 1);

        QMCabeceraSIN_RECIBOS.AsInteger := FieldByName['SIN_RECIBOS'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;

  if (xCliente.FieldByName('TIPO_PORTES').AsInteger = 0) then
     ActualizaPorteSegunZona;

  // Comprobamos que el cliente no supera el riesgo y si lo supera es
  if ((xCliente.FieldByName('RIESGO_ACT').AsFloat > xCliente.FieldByName('RIESGO_AUT').AsFloat) and
     ((xCliente.FieldByName('RIESGO_AUT').AsFloat <> 0) or KriConf126) and
     (pago_automatico = True) and
     (xCliente.FieldByName('NO_VENTA_RIESGO').AsInteger = 1)) then
     MessageDlg(_('El Riesgo Autorizado para el Cliente se ha superado.'),
        mtInformation, [mbOK], 0);
end;

procedure TDMFacturas.QMCabeceraCAMPANYAChange(Sender: TField);
begin
  with xCampanyas do
  begin
     Close;
     Open;
  end;
end;

function TDMFacturas.BusquedaCompleja: integer;
var
  Filtro : string;
begin
  Filtrado := True;

  with QMCabecera do
  begin
     // Para que se puedan ver los de otros ejercicios
     if (DMMain.EstadoKri(233) = 1) then
        Filtro := '10110'
     else
        Filtro := '11110';

     Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, Filtro, False, Serie);

     if (Result = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase;

        if (REntorno.Pais = 'CHL') then
           SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
        else
           SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

        DMMain.FiltraTabla(QMCabecera, '11100', False);
        CambiaSerie(Serie);
     end
     else
     begin
        if (LeeParametro('DOCFILT001', Serie) = 'S') then
           Ordenar('EJERCICIO, RIG');
        Open;
     end;

     // Después de buscar voy al último registro
     Last;
  end;
end;

procedure TDMFacturas.QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraA_IRPF.AsInteger = 0 then
     Text := _('Aplicable a la Base Imponible')
  else
     Text := _('Aplicable al Total con IVA');
end;

procedure TDMFacturas.Duplica(Relaciona: integer; TipoDocTribDestino: string; FechaDestino: TDateTime);
var
  IdDocDestino : integer;
  SerieDestino : string;
begin
  if (QMCabeceraESTADO.AsInteger = 6) then
     ShowMessage(_('No se puede duplicar una autofactura'))
  else
  if (not DMMain.EjercicioActivo(UDameDato.DameEjercicio(QMCabeceraEMPRESA.AsInteger, FechaDestino))) then
     ShowMessage(_('El ejercicio destino no existe o esta inactivo.'))
  else
  begin
     SerieDestino := LeeParametro('FACDTED004', QMCabeceraSERIE.AsString);
     if (SerieDestino = '') then
        SerieDestino := QMCabeceraSERIE.AsString;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_DOC_S_DUPLICA ');
           SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ''FAC'', ?RIG, ');
           SQL.Add(' ?ENTRADA, ?D_EJERCICIO, ?FECHA, ?NREFERENCIA, ?ID_S, ?RELACIONA, ?TIPO_DOC_TRIBUTARIO_DESTINO) ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := SerieDestino;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           // Obtenemos el ejercicio desde la fecha
           Params.ByName['D_EJERCICIO'].AsInteger := UDameDato.DameEjercicio(QMCabeceraEMPRESA.AsInteger, FechaDestino);
           Params.ByName['FECHA'].AsDateTime := FechaDestino;
           Params.ByName['NREFERENCIA'].AsString := '';
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           Params.ByName['RELACIONA'].AsInteger := Relaciona;
           Params.ByName['TIPO_DOC_TRIBUTARIO_DESTINO'].AsString := TipoDocTribDestino; // Para generar una N. Credito o N. Debito en Chile
           ExecQuery;
           IdDocDestino := FieldByName['ID_S_DESTINO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Close;
     QMCabecera.SelectSQL.Text := SQLBase;

     if (REntorno.Pais = 'CHL') then
        QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
     else
        QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

     DMMain.FiltraTabla(QMCabecera, '11100', False);
     CambiaSerie(Serie);
     Refrescar(QMCabecera, 'ID_S', IdDocDestino);
  end;
end;

procedure TDMFacturas.Devuelve(SerieDestino: string);
var
  IdDevolucion : integer;
begin
  if (QMCabeceraESTADO.AsInteger = 6) then
     ShowMessage(_('No se puede devoler una autofactura'))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FAC_S_DEVUELVE (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''FAC'', :RIG, :ENTRADA, :FECHA, :ID_S)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := SerieDestino;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           IdDevolucion := FieldByName['ID_S_DEVOLUCION'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMCabecera, 'ID_S', IdDevolucion);
  end;
end;

procedure TDMFacturas.QMCabeceraRIC_FACGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraESTADO.AsInteger = 0 then
     Text := ' '
  else
     Text := IntToStr(QMCabeceraASIENTO.AsInteger);
end;

procedure TDMFacturas.ActualizaCondicionesCli(CrearCondicionModelo: boolean);
begin
  // Actualiza las condiciones Cliente-Articulo de TODOS los articulos del documento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE UT_ACTUALIZA_CONDICIONES_CLI ');
        SQL.Add(' (:ID_S, :CREAR_CONDICION_MODELO) ');
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['CREAR_CONDICION_MODELO'].AsInteger := BoolToInt(CrearCondicionModelo);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
     //DMMain.TContador.Rollback;
  end;
end;

procedure TDMFacturas.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  {
  // dji lrk kri - No recalculo precios si cambia la moneda o la fecha
  if (MonedaOld <> QMCabeceraMONEDA.AsString) then
     CambiaMonedaDetalle;

  if RecalculaPrecios then
    CambiaMonedaFecha;
  }
  if RecalculaTarifa then
  begin
     CambiaTarifaVentas(QMCabeceraID_S.AsInteger, QMCabeceraTARIFA.AsString, Tarifa_old);
     QMCabecera.Refresh;
  end;

  if ((REntorno.Pais = 'CHL') and (QMCabeceraCODIGO_GIRO_CLIENTE.AsInteger = 0) and (Trim(QMCabeceraTITULO_GIRO_CLIENTE.AsString) > '')) then
  begin
     // Grabamos titulo del giro
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE EMP_CLIENTES ');
           SQL.Add(' SET ');
           SQL.Add(' GIRO_CLIENTE = :GIRO_CLIENTE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CLIENTE = :CLIENTE ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
           Params.ByName['GIRO_CLIENTE'].AsString := Trim(QMCabeceraTITULO_GIRO_CLIENTE.AsString);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

end;

procedure TDMFacturas.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;

  AlmacenStockReal := (LeeParametro('PECSTKR009', Serie) = 'S');
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', Serie), 0);
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005', Serie), 0);
  Param_DOCREFE004 := (LeeParametro('DOCREFE004', Serie) = 'S');
  Param_CLIREFE001 := (LeeParametro('CLIREFE001', Serie) = 'S');
  // Limpia el nombre del certificado reemplazando ' ', '(', ')' --> '_'
  Param_CERLIMP001 := (LeeParametro('CERLIMP001', Serie) = 'S');
  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
  Param_DOCPREC002 := (LeeParametro('DOCPREC002', Serie) = 'S');
  Param_DOCPREC003 := (LeeParametro('DOCPREC003', Serie) = 'S');
  Param_VENARTU001 := (LeeParametro('VENARTU001', Serie) = 'S');
  param_VENPREC001 := (LeeParametro('VENPREC001', Serie) = 'S');
  param_VENPREC002 := (LeeParametro('VENPREC002', Serie) = 'S');
  param_VENUSEC001 := (LeeParametro('VENUSEC001', Serie) = 'S');
  Param_FACLSIM001 := (LeeParametro('FACLSIM001', Serie) = 'S');
  param_DOCDESC001 := StrToFloatDef(LeeParametro('DOCDESC001', Serie), -1);
  param_FACNOST001 := (LeeParametro('FACNOST001', Serie) = 'S');
  param_FACMAXL001 := StrToIntDef(LeeParametro('FACMAXL001', Serie), 0);
  param_VENCONT001 := (LeeParametro('VENCONT001', Serie) = 'S');

  QMCabeceraDTO_CIAL.ReadOnly := (LeeParametro('VENREST001', Serie) = 'S');
  if (LeeParametro('VENREST002', Serie) = 'S') then
  begin
     QMDetalleDESCUENTO.ReadOnly := True;
     QMDetalleDESCUENTO_2.ReadOnly := True;
     QMDetalleDESCUENTO_3.ReadOnly := True;
  end;

  with QMCabecera do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;

     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;

     if (LeeParametro('FACULTD001', Serie) = 'S') then
        Last;
  end;
end;

function TDMFacturas.CompruebaAbono: boolean;
begin
  with QMDetalle do
  begin
     Last;
     First;
     Result := (QMDetalle.RecordCount = 0);
  end;
end;

procedure TDMFacturas.PreparaNotasDetalle;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

// Listado de Recibos de Facturas
procedure TDMFacturas.ListadoRecibos(const Serie: string; Modo: integer);
begin
  if (QMCabeceraESTADO.AsInteger <> 5) then
     raise Exception.Create(_('La factura debe estar cerrada'));

  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
  DMLstCarteraRecibos.ImprimirRecibosFactura('C', Serie, QMCabeceraTIPO.AsString,
     QMCabeceraEJERCICIO.AsInteger, QMCabeceraRIG.AsInteger, Modo);
  CierraData(DMLstCarteraRecibos);
end;

procedure TDMFacturas.Procedencia;
begin
  QSPProcedencia.Close;
  QSPProcedencia.Open;

  Application.CreateForm(TFCProcedencia, FCProcedencia);
  FCProcedencia.DBGProcedencia.DataSource := DSQSPProcedencia;
  FCProcedencia.ShowModal;

  QSPProcedencia.Close;
end;

procedure TDMFacturas.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
  {dji lrk kri - C.Costes}
  QMDetallesCostes.Open;
  xCuentaArticulo.Open;
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturas.RefrescaTarifa;
begin
  with xCliente do
  begin
     Close;
     Open;
     EntornoDoc.Tarifa := QMCabeceraTARIFA.AsString;
     EntornoDoc.Cliente := QMCabeceraCLIENTE.AsInteger;
  end;
end;

procedure TDMFacturas.RefrescaDetalle;
begin
  if (QMCabecera.RecordCount <> 0) then
  begin
     RefrescaTarifa;
     with SPRefrescaDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
        Params.ByName['TARIFA'].AsString := EntornoDoc.Tarifa;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
        ExecQuery;
        FreeHandle;
     end;
     QMCabecera.Refresh;
  end;
end;

procedure TDMFacturas.QMCabeceraREGISTROGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraESTADO.AsInteger = 0 then
     Text := ' '
  else
     Text := IntToStr(QMCabeceraREGISTRO.AsInteger);
end;

procedure TDMFacturas.Etiquetas(serie: string);
var
  fecha : TDateTime;
  copias, eje, cab : integer;
begin
  copias := QMCabeceraBULTOS.AsInteger + 2;
  fecha := QMCabeceraFECHA.AsDateTime;
  cab := QMCabeceraRIG.AsInteger;
  eje := QMCabeceraEJERCICIO.AsInteger; {dji lrk kri}
  TFPregEtiAlbaran.Create(Self).Muestra(copias, fecha, 'FAC', eje{dji lrk kri}, cab, serie);
end;

procedure TDMFacturas.VentasCliente;
begin
  TFMVentasCli.Create(Self).MuestraCliente(QMCabeceraCLIENTE.AsInteger, 3);
end;

procedure TDMFacturas.CambiaUnidadesExt(Articulo: TField; Modo, Mostrar: boolean);
var
  Tarifa : string;
  Estado, Cliente : integer;
  Unidades, Precio, UnidadesExt_Old : double;
  Articulo_Old : string;
  ForzarPrecio : boolean;
begin
  Estado := 2;
  if ((QMCabeceraESTADO.AsInteger <> 5) and (not Traspasado)) then
     if not (QMDetalle.State in [dsEdit, dsInsert]) and Modo then
        QMDetalle.Edit;

  Precio := 0;
  // Articulo_Old := xArticulos.FieldByName('ARTICULO').AsString;
  // UnidadesExt_Old := QMDetalleUNIDADES_EXT.AsFloat;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ARTICULO, UNIDADES_EXT FROM GES_DETALLES_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_DETALLES_S = :ID_DETALLES_S ');
        Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        Articulo_Old := FieldByName['ARTICULO'].AsString;
        UnidadesExt_Old := FieldByName['UNIDADES_EXT'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xArticulos do
  begin
     Close;
     Open;
     QMDetalleID_A.AsInteger := FieldByName('ID_A').AsInteger;
     if (Articulo.AsString <> Articulo_Old) then
     begin
        QMDetalleUNIDADES_SEC.AsFloat := FieldByName('DEFECTO_UD_SECUNDARIA').AsFloat;
        // QMDetalleUNIDADES_SEC.AsFloat := QMDetalleUNIDADES.AsFloat * QMDetalleUNIDADES_SEC.AsFloat;
     end;

     if (FieldByName('CONTROLA_MEDIDAS').AsInteger <> 0) then
     begin
        Cliente := EntornoDoc.Cliente;
        Tarifa := EntornoDoc.Tarifa;

        if (QMDetalle.State = dsInsert) then
           Estado := 0
        else
        if (QMDetalle.State = dsEdit) then
        begin
           if (Articulo_Old <> xArticulos.FieldByName('ARTICULO').AsString) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' DELETE FROM GES_DETALLES_S_UE ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' SERIE = :SERIE AND ');
                    SQL.Add(' TIPO = :TIPO AND ');
                    SQL.Add(' RIG = :RIG AND ');
                    SQL.Add(' LINEA = :LINEA ');
                    Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                    Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
                    Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                    Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
                    Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
              Estado := 0;
           end
           else
           begin
              Estado := 1;
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT * FROM GES_DETALLES_S_UE ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' SERIE = :SERIE AND ');
                    SQL.Add(' TIPO = :TIPO AND ');
                    SQL.Add(' RIG = :RIG AND ');
                    SQL.Add(' LINEA = :LINEA ');
                    Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                    Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
                    Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                    Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
                    Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
                    ExecQuery;
                    Medida1 := FieldByName['MEDIDA1'].AsFloat;
                    Medida2 := FieldByName['MEDIDA2'].AsFloat;
                    Medida3 := FieldByName['MEDIDA3'].AsFloat;
                    Medida4 := FieldByName['MEDIDA4'].AsFloat;
                    gPrecio := FieldByName['PRECIO'].AsFloat;
                    gUnidades := FieldByName['UNIDADES'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end
        else
           Estado := 2;

        Unidades := DevuelveValor(xArticulos, Self, QMDetalleEMPRESA.AsInteger, QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString, QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger, QMDetalleTIPO_LINEA.AsString, QMDetalleID_P.AsInteger, Estado, Precio, Tarifa, QMDetalleARTICULO.AsString, Cliente,
           QMDetalleID_A.AsInteger, QMCabeceraMONEDA.AsString, QMCabeceraVALOR_CAMB_FIJO.AsFloat, Mostrar);

        if (Estado <> 2) then
           QMDetalleUNIDADES_EXT.AsFloat := Unidades;
        if QMDetalleUNIDADES_EXT.AsFloat = 0 then
           QMDetalleUNIDADES_EXT.AsFloat := 1;

        // Si se cancela la asignacion de unidades extendidas se cancela la edicion de la linea de detalle
        if (Estado in [1, 2]) then
        begin
           QMDetalle.Cancel;
           Exit;
        end;
     end
     else
     begin
        QMDetalleUNIDADES_EXT.AsFloat := 0;
        if Modo then
        begin
           QMDetalle.Cancel;
           Exit;
        end;
     end;
  end;

  Precio := DMMain.DameCambio(False, QMCabeceraMONEDA.AsString, REntorno.Moneda, QMCabeceraFECHA.AsDateTime, Precio);

  // Si cambia el articulo o las unidades extendidas o el precio calculado segun unidades extendidas.
  ForzarPrecio := ((QMDetalle.State = dsInsert) or (xArticulos.FieldByName('ARTICULO').AsString <> Articulo_Old) or (QMDetalleUNIDADES_EXT.AsFloat <> UnidadesExt_Old) or (Precio <> gPrecio));
  EstaleceCondiciones(Articulo, Precio, ForzarPrecio);

  CalculaComisionKRI20;
end;

procedure TDMFacturas.CambiaPreciosTarifa;
var
  bueno, Abierto : boolean;
  valor : double;
begin
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     if not (QMDetalle.State in [dsEdit, dsInsert]) then
        QMDetalle.Edit;
     Abierto := True;
  end
  else
     Abierto := False;

  valor := DevuelvePrecio(1, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString, bueno,
     QMCabeceraMONEDA.AsString, QMCabeceraFECHA.AsDateTime,
     QMDetalleID_A.AsInteger);
  if (bueno and Abierto) then
     QMDetallePrecio.AsFloat := valor;
end;

function TDMFacturas.Habilitar_but_cambia_iva: boolean;
begin
  Result := not ((QMDetalle.RecordCount = 0) or (QMCabeceraESTADO.AsInteger <> 0) or (QMCabeceraMODO_IVA.AsInteger = 0));
end;

procedure TDMFacturas.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
end;

procedure TDMFacturas.Historico;
begin
  if QMDetalleArticulo.AsString <> '' then
  begin
     FInfoHistorico := TFInfoHistorico.Create(Self);
     FInfoHistorico.Mostrar(QMCabeceraSERIE.AsString,
        QMDetalleARTICULO.AsString, QMCabeceraCLIENTE.AsInteger, 0);
     FInfoHistorico.Free;
  end;
end;

procedure TDMFacturas.BorraLineaUnidadesExt;
begin
  if QMDetalle.State = dsInsert then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' DELETE FROM GES_DETALLES_S_UE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIG = :RIG AND ');
           SQL.Add(' LINEA = :LINEA ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     if QMDetalle.State = dsEdit then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE GES_DETALLES_S_UE ');
              SQL.Add(' SET ');
              SQL.Add(' UNIDADES = :UNIDADES, ');
              SQL.Add(' MEDIDA1 = :MEDIDA1, ');
              SQL.Add(' MEDIDA2 = :MEDIDA2, ');
              SQL.Add(' MEDIDA3 = :MEDIDA3, ');
              SQL.Add(' MEDIDA4 = :MEDIDA4, ');
              SQL.Add(' PRECIO = :PRECIO ');
              SQL.Add(' WHERE ');
              SQL.Add(' LINEA = :LINEA AND ');
              SQL.Add(' RIG = :RIG AND ');
              SQL.Add(' TIPO = :TIPO AND ');
              SQL.Add(' SERIE = :SERIE AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' EMPRESA = :EMPRESA ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
              Params.ByName['UNIDADES'].AsInteger := gUnidades;
              Params.ByName['MEDIDA1'].AsFloat := Medida1;
              Params.ByName['MEDIDA2'].AsFloat := Medida2;
              Params.ByName['MEDIDA3'].AsFloat := Medida3;
              Params.ByName['MEDIDA4'].AsFloat := Medida4;
              Params.ByName['PRECIO'].AsFloat := gPrecio;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMFacturas.DatosHerencia(var rig, Ejercicio: integer; var tipo, su_referencia, titulo, serie: string);
begin
  Rig := QMCabeceraRIG.AsInteger;
  Tipo := QMCabeceraTIPO.AsString;
  Su_Referencia := QMCabeceraSU_REFERENCIA.AsString;
  Serie := QMCabeceraSERIE.AsString;
  Titulo := xCliente.FieldByName('TITULO').AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
end;

procedure TDMFacturas.DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
begin
  Serie := QMCabeceraSERIE.AsString;
  Tipo := QMCabeceraTIPO.AsString;
  Rig := QMCabeceraRIG.AsInteger;
  Linea := QMDetalleLINEA.AsInteger;
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
  Fecha := QMCabeceraFECHA.AsDateTime;
  Unidades := QMDetalleUNIDADES.AsFloat;
  Estado := QMCabeceraESTADO.AsInteger;
  Ejercicio := QMCabeceraEjercicio.AsInteger;
  Devolucion := integer(QMDetalleUNIDADES.AsFloat < 0);
end;

procedure TDMFacturas.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMDetalleARTICULO.OnChange;
  try
     QMDetalleARTICULO.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN.AsString, QMCabeceraCLIENTE.AsInteger, QMDetalleNSERIE);
     NumSerie := True;
  finally
     QMDetalleARTICULO.OnChange := evt;
  end;
end;

procedure TDMFacturas.VaciaNumSerie;
begin
  QMDetalleNSERIE.AsString := '';
end;

procedure TDMFacturas.BuscaNumSerie(NroSerie: string; Filtro: boolean);
begin
  // NSerie := Num;
  if (Filtro) then
  begin
     QMCabecera.Close;
     QMCabecera.SelectSQL.Text := '';
  end;

  ModificaSelect(QMCabecera, ' SELECT * FROM VER_CABECERAS_FACTURA WHERE EMPRESA=?EMPRESA' +
     ' AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=''FAC''' +
     ' AND RIG IN (SELECT RIG FROM VER_DETALLE_SERIALIZACION ' +
     ' WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
     REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr +
     ' AND TIPO=''FAC'' AND SERIE=''' + Serie + ''' AND NSERIE =?NSERIE)', Filtro);

  if (not Filtrado) then
     DMMain.FiltraTabla(QMCabecera, '11100', False);

  QMCabecera.Params.ByName['SERIE'].AsString := Serie;
  if (Pos('NSERIE', QMCabecera.SelectSQL.Text) > 0) then
     QMCabecera.Params.ByName['NSERIE'].AsString := NroSerie;
  QMCabecera.Open;

  if ((QMCabecera.RecordCount = 0) and Filtro) then
  begin
     Application.MessageBox(PChar(string(Format(_('No se han encontrado documentos con el numero de serie %s'), [NroSerie]))),
        PChar(string(_('ATENCION!'))), MB_OK + mb_IconStop);
     with QMCabecera do
     begin
        Close;
        SelectSQL.Text := SQLFind;
        DMMain.FiltraTabla(QMCabecera, '11100', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
        Last;
     end;
  end;
end;

function TDMFacturas.Inhabilitar: boolean;
begin
  Result := ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit));
end;

procedure TDMFacturas.EstaleceCondiciones(Articulo: TField; Precio: double; Forzar: boolean = False);
var
  Modo : integer;
begin
  DMMain.LogIni('TDMFacturas.EstaleceCondiciones');
  if (Param_DOCPREC002 and (QMDetalleALMACEN.AsString = '000')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT PRECIO_VENTA, PRECIO_COSTE ');
           SQL.Add(' FROM A_ART_DAME_PRECIOS_TARIFA(:EMPRESA, :TARIFA, :ARTICULO, :UNIDADES) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo.AsString;
           Params.ByName['TARIFA'].AsString := EntornoDoc.Tarifa;
           Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
           ExecQuery;

           QMDetallePRECIO.AsFloat := FieldByName['PRECIO_VENTA'].AsFloat;
           // Utiliza precio coste de art_tarifas_precios
           if (param_DOCPCTA001) then
              QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO_COSTE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (xArticulos.FieldByName('NO_APLICA_DESC_LINEA_CLIENTE').AsInteger = 1) then
     begin
        QMDetalleDESCUENTO.AsFloat := 0;
        QMDetalleDESCUENTO_2.AsFloat := 0;
        QMDetalleDESCUENTO_3.AsFloat := 0;
     end
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT DTO_CIAL_LINEA, DTO_CIAL_LINEA_2, DTO_CIAL_LINEA_3 FROM EMP_CLIENTES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CLIENTE = :CLIENTE ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE'].AsInteger := EntornoDoc.Cliente;
              ExecQuery;
              QMDetalleDESCUENTO.AsFloat := FieldByName['DTO_CIAL_LINEA'].AsFloat;
              QMDetalleDESCUENTO_2.AsFloat := FieldByName['DTO_CIAL_LINEA_2'].AsFloat;
              QMDetalleDESCUENTO_3.AsFloat := FieldByName['DTO_CIAL_LINEA_3'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end
  else
  begin
     if (QMDetalle.State = dsInsert) or ((QMDetalle.State = dsEdit) and Param_DOCPREC003) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT * FROM G_PRECIO_VENTA_MONEDA(:EMPRESA, :CLIENTE, :ARTICULO, :TARIFA, :FECHA, :EJERCICIO, :CANAL, ');
              SQL.Add(' :UNIDADES_EXT, :PRECIOP, :UNIDADES, :MONEDA, :ID_A, :UNIDADES_OLD, :IDIOMA, :TIPO_LINEA, :ID_P_OLD, :ALMACEN, :FACTOR) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE'].AsInteger := EntornoDoc.Cliente;
              Params.ByName['ARTICULO'].AsString := Articulo.AsString;
              Params.ByName['TARIFA'].AsString := EntornoDoc.Tarifa;
              Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['UNIDADES_EXT'].AsFloat := QMDetalleUNIDADES_EXT.AsFloat;
              Params.ByName['PRECIOP'].AsFloat := Precio;
              Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
              Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
              Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
              Params.ByName['UNIDADES_OLD'].AsFloat := Unidades_Old;
              Params.ByName['IDIOMA'].AsString := QMCabeceraIDIOMA.AsString;
              Params.ByName['TIPO_LINEA'].AsString := QMDetalleTIPO_LINEA.AsString;
              Params.ByName['ID_P_OLD'].AsInteger := QMDetalleID_P.AsInteger;
              Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
              Params.ByName['FACTOR'].AsFloat := QMCabeceraVALOR_CAMB_FIJO.AsFloat;
              ExecQuery;

              // 0: Precio de Tarifa; 1-11: Precio de condiciones
              Modo := FieldByName['MODO'].AsInteger;

              if (Trim(QMDetalleTITULO_IDIOMA.AsString) = '') then
                 QMDetalleTITULO_IDIOMA.AsString := FieldByName['TITULO_IDIOMA'].AsString;
              if (Trim(QMDetalleTITULO.AsString) = '') then
                 QMDetalleTITULO.AsString := FieldByName['TITULO'].AsString;
              QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO_COSTE'].AsFloat;

              if ((FieldByName['PRECIO_ANT'].AsInteger = 0) or Forzar) then
              begin
                 QMDetallePRECIO.AsFloat := FieldByName['PRECIO'].AsFloat;
                 QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO'].AsFloat;
                 QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
                 QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
                 QMDetalleID_P.AsInteger := FieldByName['ID_P'].AsInteger;
              end;

              FreeHandle;
           finally
              Free;
           end;
        end;

        // Si no hay descuentos según condiciones tomo los descuentos del cliente para las líneas.
        if ((Modo = 0) and (QMDetalleDESCUENTO.AsFloat = 0) and (xArticulos.FieldByName('NO_APLICA_DESC_LINEA_CLIENTE').AsInteger = 0)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT DTO_CIAL_LINEA, DTO_CIAL_LINEA_2, DTO_CIAL_LINEA_3 FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CLIENTE'].AsInteger := EntornoDoc.Cliente;
                 ExecQuery;
                 QMDetalleDESCUENTO.AsFloat := FieldByName['DTO_CIAL_LINEA'].AsFloat;
                 QMDetalleDESCUENTO_2.AsFloat := FieldByName['DTO_CIAL_LINEA_2'].AsFloat;
                 QMDetalleDESCUENTO_3.AsFloat := FieldByName['DTO_CIAL_LINEA_3'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  end;

  if (QMDetalleID_P.AsInteger > 0) then
     QMDetallePROC_PROMOCION.AsInteger := 1;
  DMMain.LogFin('');
end;

procedure TDMFacturas.QMDetalleUNIDADESChange(Sender: TField);
var
  FactorUnidad : double;
begin
  if ((QMDetalle.State = dsEdit) and (PackingListGenerado) and
     (not ConfirmaMensaje(_('El Packing List ya ha sido generado y ha cambiado las unidades. ¿Desea continuar?')))) then
     QMDetalle.Cancel;

  if (Calcula_Unidades) and (xArticulos.FieldByName('CONTROLA_MEDIDAS').AsInteger = 0) then
     {1 - No cambia precio ni condiciones al editar una linea de documentos de venta}
     if ((not editando) or param_VENPREC001) then {dji lrk kri}
        EstaleceCondiciones(QMDetalleARTICULO, 0, (QMDetalle.State = dsInsert));

  // QMDetalleUNIDADES_SEC.AsFloat := QMDetalleUNIDADES.AsFloat * QMDetalleUNIDADES_SEC.AsFloat;
  // Se calcula las unidades_sec en funcion del pvp de unidades_sec en la pestaña de articulos
  // QMDetalleUNIDADES_SEC.AsFloat := xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger * xArticulos.FieldByName('DEFECTO_UD_SECUNDARIA').AsFloat * QMDetalleUNIDADES.AsFloat;

  {dji lrk kri - Unidad Logistica}
  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) and (not FlagModificandoUnidades) then
  begin
     FlagModificandoUnidades := True;
     try
        if (QMDetalleARTICULO.AsString <> '') then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT UNIDADES, RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA WHERE TIPO=?TIPO';
                 Params.ByName['TIPO'].AsString := QMDetalleTIPO_UNIDAD_LOGISTICA.AsString;
                 ExecQuery;

                 if (Param_SYSCONF005 < 2) then
                 begin
                    // Las cajas siempre son enteros. No se puede embalar media caja
                    if ((FieldByName['UNIDADES'].AsFloat <> 0) and (FieldByName['RELACIONAR_CON_UNIDADES'].AsInteger = 1)) then
                       QMDetalleUNIDADES_LOGISTICAS.AsFloat := QMDetalleUNIDADES.AsInteger div FieldByName['UNIDADES'].AsInteger;
                 end;

                 // Siempre habra por lo menos una caja
                 if (QMDetalleUNIDADES_LOGISTICAS.AsFloat = 0) then
                 begin
                    if (QMDetalleUNIDADES.AsInteger = 0) then
                       QMDetalleUNIDADES_LOGISTICAS.AsFloat := 0
                    else
                    if (QMDetalleUNIDADES.AsInteger > 0) then
                       QMDetalleUNIDADES_LOGISTICAS.AsFloat := 1
                    else
                       QMDetalleUNIDADES_LOGISTICAS.AsFloat := -1;
                 end;

                 FreeHandle;
              finally
                 Free;
              end;
           end;

           FactorUnidad := xArticulos.FieldByName('FACTOR_UNIDAD').AsFloat;
           if (FactorUnidad = 0) then
              //FactorUnidad := 1;

              if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
              begin
                 QMDetalleUNIDADES.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;
                 QMDetallePESO_TOTAL.AsFloat := QMDetalleUNIDADES.AsFloat;
                 QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
              end
              else
              begin
                 if param_VENUSEC001 and (QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger = 1) then
                    QMDetallePESO_TOTAL.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES_SEC.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat {dji}
                 else
                    QMDetallePESO_TOTAL.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES.AsFloat;

                 QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
              end;
        end;
     finally
        FlagModificandoUnidades := False;
     end;
  end;

  if ((DMMain.EstadoKri(420) = 1) and (Trim(QMDetalleARTICULO.AsString) > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CUENTA FROM C_DAME_CUENTA_ART_VENTA(:ID_C_A, :SERIE, :PROYECTO, :ABONO, :DEVOLUCION, :GRUPO_CUENTAS)';
           Params.ByName['ID_C_A'].AsInteger := QMDetalleID_C_A.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['PROYECTO'].AsInteger := QMCabeceraPROYECTO.AsInteger;
           Params.ByName['ABONO'].AsInteger := QMCabeceraSIN_DETALLE.AsInteger;
           Params.ByName['DEVOLUCION'].AsInteger := QMCabeceraDEVOLUCION.AsInteger;
           Params.ByName['GRUPO_CUENTAS'].AsInteger := xCliente.FieldByName('GRUPO_CUENTAS').AsInteger;
           ExecQuery;
           QMDetalleCUENTA.AsString := FieldByName['CUENTA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMDetalleCUENTA.AsString := '';

  CalculaComisionKRI20;
end;

procedure TDMFacturas.CalculaUnidades(pvp: double);
var
  precio : double;
begin
  if (QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit) then
     QMDetalle.Post;
  QMDetalle.Edit;
  precio := pvp;
  QMDetalleDESCUENTO.AsFloat := 0;
  QMDetalleDESCUENTO_2.AsFloat := 0;
  QMDetalleDESCUENTO_3.AsFloat := 0;

  if (not TarifaEsIvaIncluido(xCliente.FieldByName('TARIFA').AsString)) then
     precio := precio / (1 + (QMDetalleP_IVA.AsFloat / 100));
  QMDetalleUNIDADES.AsFloat := precio / QMDetallePRECIO.AsFloat;
  QMDetalle.Post;
end;

function TDMFacturas.DameEstado: smallint;
begin
  if ((QMDetalleARTICULO.AsString <> '') and (QMDetallePRECIO.AsFloat <> 0) and
     (QMCabecera.State <> dsInsert) and (QMCabecera.State <> dsEdit) and
     ((QMDetalle.RecordCount > 0) or
     ((QMDetalle.RecordCount = 0) and (QMDetalle.State = dsInsert))
     )
     ) then
     Result := QMCabeceraESTADO.AsInteger
  else
     Result := 1;
end;

function TDMFacturas.Serializado: boolean;
begin
  Result := (xArticulos.FieldByName('SERIALIZADO').AsInteger = 1);
end;

procedure TDMFacturas.QMNIFNewRecord(DataSet: TDataSet);
begin
  QMNifEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMNifEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMNifCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMNifSERIE.AsString := QMCabeceraSERIE.AsString;
  QMNifTIPO.AsString := QMCabeceraTIPO.AsString;
  QMNifRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMNifPAIS.AsString := REntorno.Pais;
  QMNifID_S.AsInteger := QMCabeceraID_S.AsInteger;
  QMNIFPAIS_DOC_IDENT.AsString := REntorno.Pais;
  QMNIFTIPO_DOC_IDENT.AsString := DMMain.DameTipoDocPaisDefecto(QMNIFPAIS_DOC_IDENT.AsString);
end;

function TDMFacturas.DameDatosClientes: boolean;
begin
  if ((QMCabeceraTERCERO.AsInteger <= -1)) then
  begin
     Result := True;
     if QMNIF.RecordCount > 0 then
        QMNIF.Edit
     else
        QMNIF.Insert;
  end
  else
     Result := False;
end;

procedure TDMFacturas.GrabaDatosCliente(Estado: integer);
begin
  if (LeeParametro('TERLNIF001') = 'S') then
     QMNIFNIF.AsString := LimpiaNIF(QMNIFPAIS.AsString, QMNIFNIF.AsString);

  // CLIVARI004 - Permite editar datos de clientes varios de documentos cerrados.
  if (Estado = mrOk) and ((EstadoDocumento = 0) or (LeeParametro('CLIVARI004') = 'S')) then
     QMNif.Post
  else
     QMNif.Cancel;

  if ((QMNIFNOMBRE.AsString = '') and
     (QMNifNIF.AsString = '') and
     (QMNifDIRECCION.AsString = '') and
     (QMNIFC_POSTAL.AsString = '') and
     (QMNifLOCALIDAD.AsString = '') and
     (QMNifPROVINCIA.AsString = '') and
     // Pais no lo tengo en cuenta porque se rellena con valores por defecto si es vacio. (QMNifPAIS.AsString = '') and
     (QMNifTELEFONO01.AsString = '') and
     (QMNifTELEFONO02.AsString = '') and
     (QMNifTELEFAX.AsString = '') and
     (QMNifEMAIL.AsString = '')
     ) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM GES_CABECERAS_S_FAC_NIF WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMNif.Close;
     QMNif.Open;
  end;
end;

procedure TDMFacturas.AgrupacionPedidosFac(Serie: string; Contador: integer);
begin
  with QMCabecera do
  begin
     Close;
     Plan.Text := '';
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT VER.* FROM VER_CABECERAS_FACTURA VER ');
     SelectSQL.Add(' JOIN TMP_PROCESOS_AUTO TMP ON ');
     SelectSQL.Add(' VER.EMPRESA = TMP.EMPRESA AND ');
     SelectSQL.Add(' VER.EJERCICIO = TMP.EJERCICIO AND ');
     SelectSQL.Add(' VER.CANAL = TMP.CANAL AND ');
     SelectSQL.Add(' VER.SERIE = TMP.SERIE AND ');
     SelectSQL.Add(' VER.TIPO = TMP.TIPO AND ');
     SelectSQL.Add(' VER.RIG = TMP.RIG ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' VER.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' VER.EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' VER.CANAL = ?CANAL AND ');
     SelectSQL.Add(' VER.SERIE = ?SERIE AND ');
     SelectSQL.Add(' VER.TIPO = ''FAC'' AND ');
     SelectSQL.Add(' TMP.CONTADOR = ' + IntToStr(Contador));

     if (REntorno.Pais = 'CHL') then
        SelectSQL.Add(' ORDER BY VER.EJERCICIO, VER.FECHA DESC, VER.TIPO_DOC_TRIBUTARIO, VER.FOLIO DESC ')
     else
        SelectSQL.Add(' ORDER BY VER.RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMFacturas.LimpiaProcAuto;
begin
  // Borramos los registros correspondientes de la tabla temporal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PROCESOS_AUTO WHERE ENTRADA = ?ENTRADA AND TIPO = ''FAC''';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.DMFacturasDestroy(Sender: TObject);
begin
  LimpiaProcAuto;
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  OldLinea.Free;
end;

function TDMFacturas.ObtieneRegistroIVA: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ' SELECT RIR FROM GES_CABECERAS_S_FAC WHERE ID_S = ?ID_S ';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        Result := FieldByName['RIR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''FAC'' AND ');
     SelectSQL.Add(' RIG = ?RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

function TDMFacturas.Traspasado: boolean;
begin
  // Miramos si la línea tiene algún documento origen
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOCUMENTO_TRASPASADO ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['TRASPASADO'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Refrescar el Grid de la Pestaña TABLA
procedure TDMFacturas.RefrescaTabla;
begin
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     QMCabecera.Refresh;
     QMDetalle.EnableControls;
  end;
end;

// Centros de Coste
procedure TDMFacturas.InsertaCosteCabecera(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO GES_CABECERAS_COSTES(EMPRESA,EJERCICIO,CANAL,' +
           'SERIE,TIPO,RIG,DIGITO_1,DIGITO_2,DIGITO_3,DIGITO_4,DIGITO_5)VALUES(' +
           '?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D1,?D2,?D3,?D4,?D5)';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     QMCabecera.Post;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_CABECERAS_FACTURA ' +
           '  SET     CENTRO_COSTE=1' +
           '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO ' +
           ' AND RIG=?RIG';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturas.ActualizaCosteCabecera(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_COSTES ' +
           '  SET DIGITO_1=?D1, ' +
           'DIGITO_2=?D2, ' +
           'DIGITO_3=?D3, ' +
           'DIGITO_4=?D4, ' +
           'DIGITO_5=?D5 ' +
           'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND ' +
           'SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturas.BorraCosteCabecera;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM GES_CABECERAS_COSTES ' +
           'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND ' +
           'SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     QMCabecera.Post;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_CABECERAS_FACTURA ' +
           '  SET     CENTRO_COSTE=0' +
           '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO ' +
           ' AND RIG=?RIG';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturas.InsertaCosteDetalle(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO GES_DETALLES_COSTES(EMPRESA,EJERCICIO,CANAL,' +
           'SERIE,TIPO,RIG,LINEA,DIGITO_1,DIGITO_2,DIGITO_3,DIGITO_4,DIGITO_5)VALUES(' +
           '?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?D1,?D2,?D3,?D4,?D5)';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_DETALLE_FACTURA ' +
           '  SET     CENTRO_COSTE=1' +
           '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO ' +
           ' AND RIG=?RIG AND LINEA=?LINEA';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturas.ActualizaCosteDetalle(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_DETALLES_COSTES ' +
           '  SET DIGITO_1=?D1, ' +
           'DIGITO_2=?D2, ' +
           'DIGITO_3=?D3, ' +
           'DIGITO_4=?D4, ' +
           'DIGITO_5=?D5 ' +
           'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND ' +
           'SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG AND LINEA=?LINEA';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturas.BorraCosteDetalle;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM GES_DETALLES_COSTES ' +
           'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND ' +
           'SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG AND LINEA=?LINEA';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_DETALLE_FACTURA ' +
           '  SET     CENTRO_COSTE=0' +
           '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO ' +
           ' AND RIG=?RIG AND LINEA=?LINEA';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturas.PedirCentroCoste;
var
  ID : integer;
begin
  // Grabo datos antes de pedir centro de coste
  if (QMCabecera.State in [dsEdit, dsInsert]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;

  if ((QMCabeceraESTADO.AsInteger = 0) and
     ((QMDetalle.RecordCount = 0) or (xCuentaArticuloCENTRO_COSTE.AsInteger = 1))) then
  begin
     // Paso los centros de coste a una tabla temporal
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM TMP_TRASPASA_CENTRO_COSTE (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?MODO, ?ID_TMP)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['MODO'].AsInteger := 0;
           Params.ByName['ID_TMP'].AsInteger := 0;
           ExecQuery;
           id := FieldByName['ID'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     TFMDigitosCoste.Create(Self).Muestra(id, xCuentaArticuloCTA_VENTAS.AsString);

     // Paso los centros de coste desde la tabla temporal
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM TMP_TRASPASA_CENTRO_COSTE (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?MODO, ?ID_TMP)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['MODO'].AsInteger := 1;
           Params.ByName['ID_TMP'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

{
function TDMFacturas.CostesIntroducidos: smallint;
begin
  with SPCostesIntroducidos do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
     ExecQuery;
     Result := FieldByName['numero'].AsInteger;
     FreeHandle;
  end;
end;
}

procedure TDMFacturas.QMDetalleBeforeScroll(DataSet: TDataSet);
begin
  //dji lrk kri Acá tengo que ver si la cuenta tiene Centro de Costos.
  {Se verifica en el AfterPost
  if ((QMDetalleCENTRO_COSTE.AsInteger = 0) and (QMDetalleARTICULO.AsString <> '')) then
    PedirCentroCoste}
end;

function TDMFacturas.Dameejercicio: string;
begin
  Result := IntToStr(QMCabeceraEJERCICIO.AsInteger);
end;

procedure TDMFacturas.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  QMCabeceraC_TOTAL.DisplayFormat := LocalMascaraN;
  QMCabeceraLIQUIDO.DisplayFormat := LocalMascaraN;
  QMCabeceraI_PORTES.DisplayFormat := LocalMascaraN;
  QMCabeceraI_RETENCION_GARANTIA.DisplayFormat := LocalMascaraN;
  QMCabeceraVALOR_CAMB_FIJO.DisplayFormat := '0.000000';
  QMCabeceraVALOR_CAMB_FIJO_INV.DisplayFormat := '0.000000';

  xInfoActualizadaSUM_UNIDADES.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_CUOTA_IVA.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_CUOTA_RE.DisplayFormat := LocalMascaraN;
  xInfoActualizadaLIQUIDO.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_BASE_RETENCION.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_RETENCION.DisplayFormat := LocalMascaraN;
  xInfoActualizadaB_COMISION.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_COMISION.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_FINANCIACION.DisplayFormat := LocalMascaraN;
  xInfoActualizadaB_DTO_LINEAS.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_BASES.DisplayFormat := LocalMascaraN;
  xInfoActualizadaTOTAL_A_COBRAR.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_DTO_LINEAS.DisplayFormat := LocalMascaraL;

  QMDetalleCOMISION_LINEAL.DisplayFormat := LocalMascaraN;
  QMDetalleI_COMISION_LINEAL.DisplayFormat := LocalMascaraN;
  QMDetalleLIQUIDO.DisplayFormat := LocalMascaraN;
  QMDetalleC_RECARGO.DisplayFormat := LocalMascaraN;
  QMDetalleM_BRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraN;
  QMDetalleC_IVA.DisplayFormat := LocalMascaraN;
  QMDetalleT_COSTE.DisplayFormat := LocalMascaraN;
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraN;
  QMDetalleBRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleI_COMISION.DisplayFormat := LocalMascaraL;
  QMDetalleB_COMISION.DisplayFormat := LocalMascaraL;
  QMDetallePRECIO.DisplayFormat := LocalMascaraL;
  QMDetalleB_DTO_LINEA.DisplayFormat := LocalMascaraL;
  QMDetalleI_DESCUENTO.DisplayFormat := LocalMascaraL;
  QMDetalleCOSTE_ADICIONAL.DisplayFormat := LocalMascaraN;

  // QMDetalleCertificadoB_IMPONIBLE.DisplayFormat := LocalMascaraN;
  // QMDetalleCertificadoPRECIO.DisplayFormat := LocalMascaraL;
  xCertificadoAntIMPORTE.DisplayFormat := LocalMascaraN;

  xProveedoresPRECIO.DisplayFormat := LocalMascaraL;
end;

procedure TDMFacturas.CambiaMonedaDetalle;
var
  Q : THYFIBQuery;
begin
  if ((QMCabecera.RecordCount <> 0) and (QMDetalle.RecordCount <> 0)) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE UT_REFRESCA_DETALLE_S_MONEDA (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?MONEDAOLD)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['MONEDAOLD'].AsString := MonedaOld;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
     QMCabecera.Refresh;
  end;
end;

procedure TDMFacturas.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(LocalMascaraN, QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMFacturas.QMCabeceraTARIFAChange(Sender: TField);
begin
  EntornoDoc.Tarifa := QMCabeceraTARIFA.AsString;
end;

function TDMFacturas.HayDocumentos: boolean;
begin
  Result := (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMFacturas.EstadoDocumento: integer;
begin
  Result := -1;
  if QMCabecera.Active then
     Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

function TDMFacturas.HayDetalle: boolean;
begin
  Result := (QMDetalle.RecordCount > 0);
end;

procedure TDMFacturas.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  MonedaOld := QMCabeceraMONEDA.AsString;
end;

procedure TDMFacturas.InfoLotes;
var
  AsignaLotes : TFMAsignaLotes;
  Editable : boolean;
begin
  if ((QMDetalle.State = dsBrowse) {and (ArticuloLoteable(QMDetalleARTICULO.AsString))}) then
  begin
     // Si el documento esta abierto es editable
     Editable := (QMCabeceraESTADO.AsInteger = 0);

     // Si no proviene de un albaran es editable
     if (Editable) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FIRST (1) RIG_O ');
              SQL.Add(' FROM G_PROCEDENCIA_DOCUMENTO_LINEA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA) ');
              SQL.Add(' WHERE ');
              SQL.Add(' TIPO_O = ''ALB'' ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceracanal.AsInteger;
              Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
              Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              ExecQuery;
              Editable := (FieldByName['RIG_O'].AsInteger = 0);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     AsignaLotes := TFMAsignaLotes.Create(Self);
     try
        with AsignaLotes do
        begin
           AsignaDocumento(QMDetalleTIPO.AsString, QMDetalleID_DETALLES_S.AsInteger, Editable);
        end;
     finally
        AsignaLotes.Free;
     end;
  end;
end;

procedure TDMFacturas.GrabaDetalle(DataSet: TDataSet);
var
  RIGOrigen : integer;
begin
  DataSet.Refresh;
  InfoActualiza;

  // Siempre y cuando no provenga de una albaran
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) RIG_O ');
        SQL.Add(' FROM G_PROCEDENCIA_DOCUMENTO_LINEA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA) ');
        SQL.Add(' WHERE ');
        SQL.Add(' TIPO_O = ''ALB'' ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceracanal.AsInteger;
        Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        ExecQuery;
        RIGOrigen := FieldByName['RIG_O'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (RIGOrigen = 0) then
     InfoLotes;

  ExtraeArticulos;
  if ((Serializado) and (SerializadoAuto) and not (NumSerie)) then
     AbreSerializadoAuto;

  if xCliente.Active and (xCliente.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat <> 0) then
     AjustaPorteMinimo;

  CierraAbreDet;
end;

procedure TDMFacturas.AjustaPorteMinimo;
var
  BaseImponible : double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(D.B_IMPONIBLE) FROM GES_DETALLES_S D ');
        SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ID_S = :ID_S AND ');
        SQL.Add(' A.TIPO_ARTICULO <> ''POR'' ');
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        BaseImponible := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (BaseImponible > xCliente.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat) then
  begin
     if (IdDocEliminaPorte <> QMCabeceraID_S.AsInteger) then
     begin
        RespuestaEliminaPorte := ConfirmaMensaje(_('Se ha superado el importe minimo para portes gratis. Desea quitarlos?'));
        IdDocEliminaPorte := QMCabeceraID_S.AsInteger;
     end;

     if RespuestaEliminaPorte then
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE GES_DETALLES_S D ');
              SQL.Add(' SET ');
              SQL.Add(' UNIDADES = 0 ');
              SQL.Add(' WHERE ');
              SQL.Add(' D.ID_S = :ID_S AND ');
              SQL.Add(' (SELECT TIPO_ARTICULO ');
              SQL.Add('  FROM ART_ARTICULOS ');
              SQL.Add('  WHERE ');
              SQL.Add('  ID_A = D.ID_A) = ''POR'' ');
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
  end;
end;

procedure TDMFacturas.QMCabeceraTIPO_IRPFChange(Sender: TField);
begin
  RefrescaIRPF;
end;

procedure TDMFacturas.RefrescaIRPF;
begin
  with xTipoIRPF do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IRPF'].AsInteger := QMCabeceraTIPO_IRPF.AsInteger;
     Open;
  end;

  DamePorIRPF;
end;

procedure TDMFacturas.DamePorIRPF;
var
  base : byte;
begin
  with xTipoIRPF do
  begin
     QMCabeceraP_RETENCION.AsFloat := FieldByName('P_IRPF').AsFloat;
     base := FieldByName('BASE').AsInteger;
  end;

  if (base = 0) then
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable a la Base Imponible')
  else
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable al Total con IVA');
end;

procedure TDMFacturas.PreparaSerializacion;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
end;

procedure TDMFacturas.ControlaRestriccion;
begin
  ControlaBorrado(QMCabeceraID_S.AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMFacturas.ComprobarFecha(FechaNueva: TDateTime);
var
  Existe : smallint;
begin
  { TODO :
Que es esto?
Creo que no tiene ningun sentido.
El RIG anterior no necesariamente es el RIG-1 }

  // Comprueba si la fecha de la ultima factura no es mayor de 30 dias
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(EMPRESA) FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIG = :RIG AND ');
        SQL.Add(' FECHA_ENTREGA < :FECHA_ENTREGA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger - 1;
        Params.ByName['FECHA_ENTREGA'].AsDateTime := FechaNueva - 30;
        ExecQuery;
        Existe := StrToIntDef(FieldByName['MIN'].AsString, 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Existe > 0) then
     ShowMessage(_('CUIDADO. La fecha de entrega de esta factura excede de 30 días respecto de la anterior.'));
end;

procedure TDMFacturas.ExtraeArticulos;
var
  Peso, Volumen, Diametro : double;
begin
  if ((CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) and (DMMain.CompruebaControlUbicacionAlmacen(QMDetalleALMACEN.AsString))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE A_ART_EXTRAE_ARTICULOS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, ');
           SQL.Add(' :ID_DETALLES_S, :ID_A, :UNIDADES, 99999, :PESO, :VOLUMEN, :DIAMETRO, :ARTICULO) ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
           Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
           Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsInteger;
           Params.ByName['PESO'].AsFloat := Peso;
           Params.ByName['VOLUMEN'].AsFloat := Volumen;
           Params.ByName['DIAMETRO'].AsFloat := Diametro;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturas.MuestraUbicacion;
var
  Peso, Volumen, Diametro : double;
begin
  if (DMMain.CompruebaControlUbicacionAlmacen(QMDetalleALMACEN.AsString)) then
  begin
     if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     begin
        TFMExtraeArticulos.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
           QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger,
           QMDetalleRIG.AsInteger,
           QMDetalleLINEA.AsInteger,
           QMDetalleID_DETALLES_S.AsInteger,
           QMDetalleID_A.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString,
           QMDetalleUNIDADES.AsFloat);
     end
     else
        ShowMessage(_('El artículo no es ubicable'));
  end
  else
     ShowMessage(_('El almacén no controla ubicaciones'));
end;

procedure TDMFacturas.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  IdDocEliminaPorte := 0;
  FechaOld := QMCabeceraFECHA.AsDateTime;
end;

function TDMFacturas.CreaFacturaRectificacion(Serie: string; var d_rig: integer): boolean;
var
  Q : THYFIBQuery;
begin
  d_rig := 0;
  Result := False;
  if (QMCabecera.State = dsInsert) then
     QMCabecera.Cancel;

  FMDatosFactRectificacion := TFMDatosFactRectificacion.Create(Self);
  try
     FMDatosFactRectificacion.PasaTipo('FAC');
     FMDatosFactRectificacion.ShowModal;

     if (FMDatosFactRectificacion.ModalResult = mrOk) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_CREA_FACTURA_RECTIFICACION(:EMPRESA, :D_EJERCICIO, :D_CANAL, :D_SERIE, :D_FECHA, :O_EJERCICIO, :O_SERIE, :O_RIG, :ENTRADA)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['D_SERIE'].AsString := Serie;
              Params.ByName['D_FECHA'].AsDateTime := REntorno.FechaTrab;
              Params.ByName['O_EJERCICIO'].AsInteger := FMDatosFactRectificacion.Ejercicio;
              Params.ByName['O_SERIE'].AsString := FMDatosFactRectificacion.Serie;
              Params.ByName['O_RIG'].AsInteger := FMDatosFactRectificacion.Rig;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              TFParada.Create(Self).ExecQuery(Q);
              d_rig := FieldByName['D_RIG'].AsInteger;
              Result := True;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     FMDatosFactRectificacion.Free;
  end;
end;

procedure TDMFacturas.AbreSerializadoAuto;
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado, Devolucion : integer;
  Ejercicio : smallint;
  Fecha : TDateTime;
  Unidades : double;
begin
  PreparaSerializacion;
  DatosSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo,
     Rig, Linea, Devolucion, Fecha, Unidades, Estado);
  MuestraSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig, Linea,
     Devolucion, Fecha, Unidades, Estado, Self);
end;

procedure TDMFacturas.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  LiquidoAnt := QMDetalleLIQUIDO.AsFloat;
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturas.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;
end;

procedure TDMFacturas.QMCabeceraTIPO_PORTESChange(Sender: TField);
begin
  if ((Sender.Value = 6) or (Sender.Value = 5) or (Sender.Value = 7)) then
  begin
     QMCabeceraRANGO.Clear;
     QMCabeceraINDICE.Clear;
  end;
end;

procedure TDMFacturas.QMCabeceraRANGOChange(Sender: TField);
begin
  with xRangos do
  begin
     Close;
     Params.ByName['RANGO'].AsInteger := Sender.AsInteger;
     Open;
  end;
  QMCabeceraINDICE.Clear;
end;

procedure TDMFacturas.QMCabeceraINDICEChange(Sender: TField);
begin
  with xIndices do
  begin
     Close;
     Params.ByName['INDICE'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

function TDMFacturas.ExisteRango(Rango: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_RANGO FROM EMP_RANGOS WHERE EMPRESA = ?EMPRESA AND RANGO = ?RANGO';
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

procedure TDMFacturas.OrdenarLineas;
begin
  with QMDetalle do
  begin
     try
        DisableControls;
        OrdenaLineas('FAC', QMCabeceraID_S.AsInteger, Self);
        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMFacturas.CierraAbreDet;
var
  Mark : TBookmark;
begin
  with QMDetalle do
  begin
     Mark := GetBookmark;
     try
        DisableControls;
        Close;
        Open;
        Last;
        GotoBookmark(Mark);
     finally
        EnableControls;
        FreeBookmark(Mark);
     end;
  end;
end;

procedure TDMFacturas.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
  if (HayDatosDetalle(QMCabeceraID_S.AsInteger)) then
  begin
     if (ConPromociones) then
     begin
        CierraAbreDet;
     end
     else
        QMDetalle.Refresh;
  end
  else
  begin
     QMDetalle.Close;
     QMDetalle.Open;
  end;
end;

procedure TDMFacturas.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
  ConPromociones := TienePromociones(QMDetalleID_DETALLES_S.AsInteger);
end;

procedure TDMFacturas.QMDetalleAfterPost(DataSet: TDataSet);
var
  i, UnidadesEnteras : integer;
begin
  GrabaDetalle(DataSet);

  if (((xArticulos.FieldByName('ANTICIPO').AsInteger = 1) or (xArticulos.FieldByName('ANTICIPO_CONTADO').AsInteger = 1)) and
     (articulo_old <> QMDetalleARTICULO.AsString)) then
     if ((xArticulos.FieldByName('ANTICIPO_PREG_DATOS').AsInteger = 1) and
        (QMDetalleUNIDADES.AsFloat > 0)) then
     begin
        QMDetalle.Edit;
        EditarDatosAnticipo(Self, DSQMDetalle, QMDetalleFECHA_ANTICIPO, QMDetalleCTA_PAGO_ANTICIPO);
     end
     else if (QMDetalleUNIDADES.AsFloat < 0) then
     begin
        RelacionaAnticipo(Self, DSQMDetalle, QMDetallePRECIO, EntornoDoc.Cliente,
           QMDetalleID_DETALLES_S.AsInteger);
     end;

  // Acá tengo que ver si la cuenta tiene Centro de Costos.
  if (QMDetalleCENTRO_COSTE.AsInteger = 0) then
     PedirCentroCoste;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;

  // Abro ventana de datos fitosanitarios si el articulo está marcado.
  if (xArticulos.Active) then
  begin
     if (xArticulos.FieldByName('TIPO_REGISTRO_FITOSANITARIO').AsString <> 'Z') then
     begin
        FMain.EjecutaAccion(FMain.ARegistroFitosanitario);
        with FMRegistroFitosanitario do
        begin
           AsignaDocumento('ALB', QMDetalle.FieldByName('ID_DETALLES_S').AsInteger);
           Hide;
           ShowModal;
        end;
     end;
  end;

  if (QMDetalleREQUIERE_LOTE_SIMPLE.AsInteger = 1) and (QMDetalleUNIDADES.AsFloat > 1) then
  begin
     if ConfirmaMensaje(_('¿Desea dividir las unidades en lineas diferentes?')) then
     begin
        UnidadesEnteras := Trunc(QMDetalleUNIDADES.AsFloat);

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE GES_DETALLES_S SET UNIDADES = 1 WHERE ID_DETALLES_S = :ID_DETALLES_S';
              Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
        QMDetalle.Refresh;
        Dec(UnidadesEnteras);

        for i := UnidadesEnteras downto 1 do
           DuplicarLinea;
     end;
  end;

  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturas.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
  articulo_old := '';
end;

procedure TDMFacturas.RefrescaCabecera(Accion: integer);
begin
  case Accion of
     1: QMCabecera.Refresh;
     2: Refrescar(QMCabecera, 'ID_S', QMCabeceraID_S.AsInteger);
  end;
end;

procedure TDMFacturas.GenerarPackingList;
begin
  if (not PackingListGenerado) then
  begin
     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.Database;
           SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_GENERAR(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMFacturas.PackingListGenerado: boolean;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_CABECERAS_S_BULTOS WHERE ID_S=?ID_S';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger > 0);
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraCAMBIO_FIJOChange(Sender: TField);
begin
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
end;

procedure TDMFacturas.FiltraDocumento(Filtro: string);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := SQLBase;
     if (Trim(Filtro) > '') then
        SelectSQL.Add(' AND (' + Filtro + ')');

     if (REntorno.Pais = 'CHL') then
        SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
     else
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

     DMMain.FiltraTabla(QMCabecera, '11100', False);
     Params.ByName['SERIE'].AsString := Serie;
     CambiaSerie(Serie);
  end;
end;

procedure TDMFacturas.QMDetalleP_COSTEChange(Sender: TField);
begin
  CalculaComisionKRI20;
end;

procedure TDMFacturas.QMDetallePRECIOChange(Sender: TField);
begin
  CalculaComisionKRI20;
end;

procedure TDMFacturas.QMDetalleCOMISIONChange(Sender: TField);
begin
  {Utiliza precio coste de art_tarifas_precios}
  if param_DOCPCTA001 then
  begin
     if (QMDetalleCOMISION.AsFloat > 300) or (QMDetalleCOMISION.AsFloat < -300) then
        QMDetalleCOMISION.AsFloat := 0;
  end;
end;

procedure TDMFacturas.CalculaComisionKRI20;
begin
  // ATENCION: En los triggers tambien se recalcula la comision,
  // usando en lugar del Precio: B_COMISION / UNIDADES
  // El campo B_COMISION se le restan los descuentos por linia y el descuento comercial (DTO_CIAL).

  {Utiliza precio coste de art_tarifas_precios}
  if param_DOCPCTA001 then
  begin
     if QMDetallePRECIO.AsFloat <> 0 then
        QMDetalleCOMISION.AsFloat := (1 - ((QMDetalleP_COSTE.AsFloat + QMDetalleCOSTE_ADICIONAL.AsFloat) / QMDetallePRECIO.AsFloat)) * 20  // 20 = 100/5
     else
        QMDetalleCOMISION.AsFloat := 0;
  end;
end;

procedure TDMFacturas.QMCabeceraCONTACTOChange(Sender: TField);
begin
  if (QMCabeceraCONTACTO.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT AGENTE, NOMBRE, APELLIDOS FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO=' + QMCabeceraTERCERO.AsString + ' AND CONTACTO=' + QMCabeceraCONTACTO.AsString;
           ExecQuery;
           if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
              if ((FieldByName['AGENTE'].AsInteger > 0) and (LeeParametro('VENAGEN001', Serie) = 'N')) then
                 QMCabeceraAGENTE.AsInteger := FieldByName['AGENTE'].AsInteger;
           if (Trim(FieldByName['NOMBRE'].AsString + Trim(FieldByName['APELLIDOS'].AsString)) > '') then
              QMCabeceraTIT_CONTACTO.AsString := FieldByName['NOMBRE'].AsString + ' ' + FieldByName['APELLIDOS'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturas.QMDetallePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if (ControlaStockNegativo and (Pos('exception 137.', EFIBError(E).Message) > 0) and (Muestra_InfoStock)) then
  begin
     Action := daAbort;
     FMFacturas.MuestraStock(1);
  end;
end;

procedure TDMFacturas.BuscaArticulo(Articulo: string);
begin
  { TODO -cOptimizacion : Ver si se puede optimizar filtrando GES_DETALLES_S por EECS y TIPO. }
  with QMCabecera do
  begin
     Close;
     if (Articulo <> '') then
        ModificaSelect(QMCabecera, ' AND ID_S IN (SELECT ID_S FROM GES_DETALLES_S WHERE ID_A = ' + IntToStr(DameIDArticulo(Articulo)) + ')', (Articulo <> ''))
     else
     begin
        SelectSQL.Text := SQLBase;

        if (REntorno.Pais = 'CHL') then
           SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
        else
           SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
     end;

     if ExisteParametro(QMCabecera, 'EMPRESA') then
     begin
        DMMain.FiltraTabla(QMCabecera, '11100', False);
     end;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMFacturas.FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := SQLFind;
     case Estado of
        // 0: Todas
        // Activas
        1: SelectSQL.Add(' AND ESTADO = 0 ');
        // Cerradas
        2: SelectSQL.Add(' AND ESTADO = 5 ');
     end;

     SelectSQL.Add(' AND CLIENTE = ?CLIENTE ');

     if (REntorno.Pais = 'CHL') then
        SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
     else
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['CLIENTE'].AsInteger := Cliente;

     Open;
  end;
end;

function TDMFacturas.HayCertificacion: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_DETALLES_S WHERE ID_S = ?ID_S AND CERTIFICADO = 1';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.AbreQMNif;
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

procedure TDMFacturas.CierraQMNif;
begin
  QMNif.Close;
end;

procedure TDMFacturas.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xCliente.Close;
  QMDetalle.Close;
  QMNIF.Close;
  xInfoActualizada.Close;
  xDirecciones.Close;
  xCampanyas.Close;
  xRangos.Close;
  xIndices.Close;
  QMDetalleCertificado.Close;
  xCertificadoAnt.Close;
  QMFirmas.Close;

  if (REntorno.Pais = 'CHL') then
  begin
     QMCabeceraFEChile.Close;
     QMSIIDteReferencia.Close;
     xFactoring.Close;
  end;

  if (REntorno.Pais = 'DOM') then
  begin
     xFacturaDGII.Close;
     QMDGIIReferencias.Open;
  end;
end;

procedure TDMFacturas.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // DMMain.LogIni('TDMFacturas.QMCabeceraTITULOGetText');

  if (QMCabeceraTERCERO.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_S.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;

  // DMMain.LogFin('');
end;

procedure TDMFacturas.QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
begin
  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) and (not FlagModificandoUnidades) then
  begin
     FlagModificandoUnidades := True;
     try
        if (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString <> '') then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT UNIDADES, RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA WHERE TIPO = ?TIPO';
                 Params.ByName['TIPO'].AsString := QMDetalleTIPO_UNIDAD_LOGISTICA.AsString;
                 ExecQuery;
                 QMDetalle.DisableControls;
                 try
                    if (Param_SYSCONF005 < 2) then
                    begin
                       // Las cajas siempre son enteros. No se puede embalar media caja
                       if ((FieldByName['UNIDADES'].AsFloat <> 0) and (FieldByName['RELACIONAR_CON_UNIDADES'].AsInteger = 1)) then
                          QMDetalleUNIDADES_LOGISTICAS.AsFloat := QMDetalleUNIDADES.AsInteger div FieldByName['UNIDADES'].AsInteger;
                    end;

                    // Siempre habra por lo menos una caja
                    if (QMDetalleUNIDADES_LOGISTICAS.AsFloat = 0) then
                    begin
                       if (QMDetalleUNIDADES.AsInteger > 0) then
                       begin
                          QMDetalleUNIDADES_LOGISTICAS.AsFloat := 1;
                          QMDetalleUNIDADES.AsFloat := FieldByName['UNIDADES'].AsFloat;
                       end
                       else
                       begin
                          QMDetalleUNIDADES_LOGISTICAS.AsFloat := -1;
                          QMDetalleUNIDADES.AsFloat := FieldByName['UNIDADES'].AsFloat * (-1);
                       end;
                    end;
                 finally
                    QMDetalle.EnableControls;
                 end;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     finally
        FlagModificandoUnidades := False;
     end;
  end;
end;

procedure TDMFacturas.QMDetalleTITULO_UNIDAD_LOGISTICAChange(Sender: TField);
begin
  if (Param_SYSCONF005 < 2) then
  begin
     if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) and (not FlagModificandoUnidades) then
     begin
        FlagModificandoUnidades := True;
        try
           if IntToStr(QMDetalleUNIDADES_LOGISTICAS.AsInteger) <> '' then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT UNIDADES, RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA WHERE TIPO=?TIPO';
                    Params.ByName['TIPO'].AsString := QMDetalleTIPO_UNIDAD_LOGISTICA.AsString;
                    ExecQuery;
                    if ((FieldByName['UNIDADES'].AsFloat <> 0) and (FieldByName['RELACIONAR_CON_UNIDADES'].AsInteger = 1)) then
                       QMDetalleUNIDADES.AsFloat := QMDetalleUNIDADES_LOGISTICAS.AsFloat * FieldByName['UNIDADES'].AsFloat;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        finally
           FlagModificandoUnidades := False;
        end;
     end;
  end;
end;

procedure TDMFacturas.QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
var
  FactorUnidad : double;
begin
  if (Param_SYSCONF005 < 2) then
  begin
     if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) and (not FlagModificandoUnidades) then
     begin
        FlagModificandoUnidades := True;
        try
           if IntToStr(QMDetalleUNIDADES_LOGISTICAS.AsInteger) <> '' then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT UNIDADES, RELACIONAR_CON_UNIDADES FROM SYS_TIPO_UNIDAD_LOGISTICA WHERE TIPO = :TIPO';
                    Params.ByName['TIPO'].AsString := QMDetalleTIPO_UNIDAD_LOGISTICA.AsString;
                    ExecQuery;
                    if ((FieldByName['UNIDADES'].AsFloat <> 0) and (FieldByName['RELACIONAR_CON_UNIDADES'].AsInteger = 1)) then
                       QMDetalleUNIDADES.AsFloat := QMDetalleUNIDADES_LOGISTICAS.AsFloat * FieldByName['UNIDADES'].AsFloat;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              FactorUnidad := xArticulos.FieldByName('FACTOR_UNIDAD').AsFloat;
              if (FactorUnidad = 0) then
                 //FactorUnidad := 1;

                 if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
                 begin
                    QMDetalleUNIDADES.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;
                    QMDetallePESO_TOTAL.AsFloat := QMDetalleUNIDADES.AsFloat;
                    QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
                 end
                 else
                 begin
                    if param_VENUSEC001 and (QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger = 1) then
                       QMDetallePESO_TOTAL.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES_SEC.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat {dji}
                    else
                       QMDetallePESO_TOTAL.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES.AsFloat;

                    QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
                 end;
           end;
        finally
           FlagModificandoUnidades := False;
        end;
     end;
  end;
end;

procedure TDMFacturas.CambiaFinanciacion;
var
  FMFinanciaManualVtas : TFMFinanciaManualVtas;
begin
  FMFinanciaManualVtas := TFMFinanciaManualVtas.Create(Self);
  with FMFinanciaManualVtas do
  begin
     Muestra(QMCabeceraSERIE.AsString, QMCabeceraTIPO.AsString, QMCabeceraRIG.AsInteger);
     Free;
  end;
  QMCabecera.Refresh;
end;

procedure TDMFacturas.EliminarPackingList;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_ELIMINAR(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraDTO_PPChange(Sender: TField);
begin
  if ((QMCabeceraDTO_PP.AsFloat <> 0) and (Trim(QMCabeceraFORMA_PAGO.AsString) > '')) then
  begin
     with xFormasPago do
     begin
        Open;
        if (FieldByName('PRONTO_PAGO').AsInteger = 0) then
        begin
           QMCabeceraDTO_PP.AsFloat := 0;
           ShowMessage('La forma de pago no admite descuento pronto pago');
        end;
        Close;
     end;
  end;
end;

{ No se utiliza
procedure TDMFacturas.CambiaMonedaFecha;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text :=
           'EXECUTE PROCEDURE UT_REFRESCA_DET_S_MONEDA_FECHA (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?MONEDA, ?FECHAOLD, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
        Params.ByName['FECHAOLD'].AsDateTime := FechaOld;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  QMCabecera.Refresh;
end;
}
{ No se utiliza
function TDMFacturas.HayCambioFactor(var factor_ant: double): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text := 'EXECUTE PROCEDURE DAME_CAMBIOS_FACTOR(?ID_S, ?ORIGEN, ?DESTINO, ?FECHA)';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['ORIGEN'].AsString := QMCabeceraMONEDA.AsString;
        Params.ByName['DESTINO'].AsString := REntorno.Moneda;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        ExecQuery;
        Result := (FieldByName['HAY_CAMBIO'].AsInteger = 1);
        factor_ant := FieldByName['FACTOR_ANT'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
{ No se utiliza
procedure TDMFacturas.RecalculaCambioFactor(factor_ant: double);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text :=
           'EXECUTE PROCEDURE UT_REFRESCA_DET_S_MONEDA_CIERRA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?MONEDA, ?FECHA, ?FACTOR_ANT)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        Params.ByName['FACTOR_ANT'].AsDouble := Factor_ant;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
procedure TDMFacturas.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES.AsFloat]);
end;

procedure TDMFacturas.OrdenarLineasPorDireccionEntrega;
var
  DS : TFIBDataSet;
  Orden : integer;
begin
  /// Ordena las lineas por direccion de entrega, articulo, linea

  Orden := 1;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT D.ID_DETALLES_S FROM GES_DETALLES_S D ');
           SelectSQL.Add(' JOIN GES_DETALLES_S_FAC F ');
           SelectSQL.Add(' ON D.ID_DETALLES_S = F.ID_DETALLES_S ');
           SelectSQL.Add(' WHERE D.ID_S = ?ID_S ');
           SelectSQL.Add(' ORDER BY F.DIRECCION_ENTREGA, D.ARTICULO, D.LINEA ');
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           Open;
           while not EOF do
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE GES_DETALLES_S SET ORDEN = ?ORDEN WHERE ID_DETALLES_S = ?ID_DETALLES_S AND ORDEN <> ?ORDEN';
                    Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    Params.ByName['ORDEN'].AsInteger := Orden;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Inc(Orden);
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

  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

function TDMFacturas.GeneraFacturaElectronicaES(Certificado: string): string;
var
  FacturaElectronica : TFacturaElectronicaES;
  PersonaJuridica, lValidCer : boolean;
  ResidenceTypeCode, TaxIdentificationNumber, CorporateNameOrName, TradeNameOrFistSurname, SecondSurname : string;
  Address, PostCode, Town, Province, CountryCode : string;
  DS : TFIBDataSet;
  PaymentMeans : string;
  IBAN, BancCode, BranchCode, BIC : string;
  ReconciliationReference, CollectionAditionalInformation, RegulatoryReportingData : string;
  CentreCode, RoleTypeCode, CentreDescription, PhysicalGLN, LogicalOperationalPoint : string;
  TituloPorte : string;
  PorcentajeIVAPorte : double;
  IssuerContractReference, IssuerTransactionReference, ReceiverTransactionReference, FileReference : string;
  LegalLiterals, InvoiceAditionaInformation : string;
  Carpeta : string;
  MesesCuota, DiasCuota : integer;
  FechaCuota, PeriodoFacturacionIni, PeriodoFacturacionFin : TDateTime;
  ClienteCanarias : boolean;
  HayInversionSujetoPasivo : boolean;
  s : string;
  p : integer;
begin
  Result := '';
  Carpeta := IncludeTrailingPathDelimiter(LeeDatoIni('FacturaE', 'Carpeta', GetSpecialFolderPath(CSIDL_PERSONAL, False)));
  EscribeDatoIni('FacturaE', 'Carpeta', Carpeta);

  FacturaElectronica := TFacturaElectronicaES.Create(Self);
  try
     with FacturaElectronica do
     begin
        // ...\Mis Documentos\Factura_A_123.xml
        Fichero := Carpeta + LimpiaNombreFichero(_('Factura') + '_' + QMCabeceraSERIE.AsString + '_' + IntToStr(QMCabeceraRIG.AsInteger) + '.xml');

        // Inicia(InvoiceIssuerType['EM', 'RE', 'TE'], InvoiceCurrencyCode['EUR',...]);
        Inicia('EM', QMCabeceraMONEDA.AsString);

        // Obtengo datos necesarios de la empresa
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT T.NIF, T.TIPO_RAZON, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, L.TITULO AS LOCALIDAD, P.TITULO AS PROVINCIA, L.PAIS ');
              SQL.Add(' FROM SYS_EMPRESAS E ');
              SQL.Add(' JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO ');
              SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
              SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
              SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
              SQL.Add(' WHERE ');
              SQL.Add(' E.EMPRESA = :EMPRESA AND ');
              SQL.Add(' D.DIR_DEFECTO = 1 ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              ExecQuery;
              TaxIdentificationNumber := FieldByName['NIF'].AsString;
              PersonaJuridica := (FieldByName['TIPO_RAZON'].AsString <> 'PF');
              ResidenceTypeCode := 'R'; // ????
              CorporateNameOrName := Copy(FieldByName['NOMBRE_R_SOCIAL'].AsString, 1, 40);
              TradeNameOrFistSurname := Copy(FieldByName['NOMBRE_COMERCIAL'].AsString, 1, 40);
              SecondSurname := '';
              Address := Trim(FieldByName['DIR_COMPLETA_N'].AsString);
              PostCode := Trim(FieldByName['CODIGO_POSTAL'].AsString);
              Town := Trim(FieldByName['LOCALIDAD'].AsString);
              Province := Trim(FieldByName['PROVINCIA'].AsString);
              CountryCode := Trim(FieldByName['PAIS'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;

        SetSellerParty(PersonaJuridica, ResidenceTypeCode, TaxIdentificationNumber, CorporateNameOrName, TradeNameOrFistSurname, SecondSurname,
           Address, PostCode, Town, Province, CountryCode);

        // Obtengo datos del cliente
        if (QMNIF.RecordCount >= 1) then
        begin
           with QMNIF do
           begin
              TaxIdentificationNumber := FieldByName('NIF').AsString;
              CorporateNameOrName := Copy(FieldByName('NOMBRE').AsString, 1, 40);
              TradeNameOrFistSurname := '';
              SecondSurname := '';
              Address := Trim(FieldByName('DIRECCION').AsString);
              PostCode := Trim(FieldByName('C_POSTAL').AsString);
              Town := Trim(FieldByName('LOCALIDAD').AsString);
              Province := Trim(FieldByName('PROVINCIA').AsString);
              CountryCode := Trim(FieldByName('PAIS').AsString);
              PersonaJuridica := False; // ???
              ResidenceTypeCode := 'R'; // ???
           end;
        end
        else
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT T.NIF, T.TIPO_RAZON, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, L.TITULO AS LOCALIDAD, P.TITULO AS PROVINCIA, L.PAIS ');
                 SQL.Add(' FROM SYS_TERCEROS T ');
                 SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
                 SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
                 SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' T.TERCERO = :TERCERO AND ');
                 SQL.Add(' D.DIRECCION = :DIRECCION ');
                 Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
                 Params.ByName['DIRECCION'].AsInteger := QMCabeceraDIRECCION.AsInteger;
                 ExecQuery;
                 TaxIdentificationNumber := FieldByName['NIF'].AsString;
                 PersonaJuridica := (FieldByName['TIPO_RAZON'].AsString <> 'PF');
                 ResidenceTypeCode := 'R'; // ????
                 CorporateNameOrName := Copy(FieldByName['NOMBRE_R_SOCIAL'].AsString, 1, 40);
                 TradeNameOrFistSurname := Copy(FieldByName['NOMBRE_COMERCIAL'].AsString, 1, 40);
                 SecondSurname := '';
                 Address := Trim(FieldByName['DIR_COMPLETA_N'].AsString);
                 PostCode := Trim(FieldByName['CODIGO_POSTAL'].AsString);
                 Town := Trim(FieldByName['LOCALIDAD'].AsString);
                 Province := Trim(FieldByName['PROVINCIA'].AsString);
                 CountryCode := Trim(FieldByName['PAIS'].AsString);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Canarias es provincia 35 (Las Plamas) y 38 (Santa Cruz de Tenerife)
        ClienteCanarias := ((CountryCode = 'ESP') and ((Copy(PostCode, 1, 2) = '35') or (Copy(PostCode, 1, 2) = '38')));

        SetBuyerParty(PersonaJuridica, ResidenceTypeCode, TaxIdentificationNumber, CorporateNameOrName, TradeNameOrFistSurname, SecondSurname,
           Address, PostCode, Town, Province, CountryCode);

        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add(' SELECT R.ROL, ');
                 SelectSQL.Add('        (SELECT FIRST 1 C.CENTRO_ADMINISTRATIVO ');
                 SelectSQL.Add('         FROM EMP_CLIENTES_CENTRO_ADM C ');
                 SelectSQL.Add('         WHERE ');
                 SelectSQL.Add('         C.EMPRESA = :EMPRESA AND ');
                 SelectSQL.Add('         C.CLIENTE = :CLIENTE AND ');
                 SelectSQL.Add('         C.ROL_CENTRO_ADMINISTRATIVO = R.ROL AND ');
                 SelectSQL.Add('         ((C.DIRECCION = :DIRECCION) OR (C.DIRECCION = 0)) ');
                 SelectSQL.Add('         ORDER BY C.DIRECCION DESC) AS CENTRO_ADMINISTRATIVO, ');
                 SelectSQL.Add('        (SELECT FIRST 1 C.NOMBRE ');
                 SelectSQL.Add('         FROM EMP_CLIENTES_CENTRO_ADM C ');
                 SelectSQL.Add('         WHERE ');
                 SelectSQL.Add('         C.EMPRESA = :EMPRESA AND ');
                 SelectSQL.Add('         C.CLIENTE = :CLIENTE AND ');
                 SelectSQL.Add('         C.ROL_CENTRO_ADMINISTRATIVO = R.ROL AND ');
                 SelectSQL.Add('         ((C.DIRECCION = :DIRECCION) OR (C.DIRECCION = 0)) ');
                 SelectSQL.Add('         ORDER BY C.DIRECCION DESC) AS NOMBRE ');
                 SelectSQL.Add(' FROM SYS_ROLES_CENTRO_ADM R ');
                 SelectSQL.Add(' ORDER BY R.ROL ');
                 Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                 Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
                 Params.ByName['DIRECCION'].AsInteger := QMCabeceraDIRECCION.AsInteger;
                 Open;
                 while not EOF do
                 begin
                    CentreCode := Trim(FieldByName('CENTRO_ADMINISTRATIVO').AsString);
                    RoleTypeCode := FieldByName('ROL').AsString;
                    CorporateNameOrName := FieldByName('NOMBRE').AsString;
                    TradeNameOrFistSurname := '';
                    SecondSurname := '';
                    CentreDescription := 'D';
                    PhysicalGLN := '';
                    LogicalOperationalPoint := '';

                    if (CentreCode > '') then
                       SetBuyerPartyAdministrativeCentre(CentreCode, RoleTypeCode, CorporateNameOrName, TradeNameOrFistSurname, SecondSurname, Address, PostCode, Town, Province, CountryCode, CentreDescription, PhysicalGLN, LogicalOperationalPoint);

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

        SetInvoice(Format('%d-%s/%d', [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger]), ''{InvoiceSeriesCode},
           'FC', 'OO', QMCabeceraFECHA.AsDateTime, QMCabeceraMONEDA.AsString, REntorno.Moneda, 'es');

        // Averiguo si viene de una cuota y cual es su periodicidad
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT D.FECHA, C.PERIODICIDAD, C.DIAS ');
              SQL.Add(' FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC D ');
              SQL.Add(' JOIN EMP_CLIENTES_CUOTAS C ON D.EMPRESA = C.EMPRESA AND D.CANAL = C.CANAL AND D.CLIENTE = C.CLIENTE AND D.CUOTA = C.CUOTA ');
              SQL.Add(' WHERE ');
              SQL.Add(' D.ID_S = :ID_S ');
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              ExecQuery;
              FechaCuota := FieldByName['FECHA'].AsDateTime;
              MesesCuota := FieldByName['PERIODICIDAD'].AsInteger;
              DiasCuota := FieldByName['DIAS'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Si viene de una cuota tendre datos de cual es el periodo de facturacion
        if ((MesesCuota > 0) or (DiasCuota > 0)) then
        begin
           PeriodoFacturacionIni := FechaCuota;
           PeriodoFacturacionFin := FechaCuota;

           // Resto de la fecha de cuota el periodo de facturacion
           if (MesesCuota > 0) then
           begin
              if (DayOf(FechaCuota) = 1) then
              begin
                 PeriodoFacturacionFin := IncDay(FechaCuota, -1);
                 PeriodoFacturacionIni := IncMonth(PeriodoFacturacionFin, MesesCuota * (-1) + 1);
                 PeriodoFacturacionIni := RecodeDay(PeriodoFacturacionIni, 1);
              end
              else
              begin
                 PeriodoFacturacionIni := RecodeDay(FechaCuota, 1);
                 PeriodoFacturacionIni := IncMonth(PeriodoFacturacionIni, MesesCuota * (-1) + 1);
                 PeriodoFacturacionFin := RecodeDay(FechaCuota, DaysInMonth(FechaCuota));
              end;
           end
           else
           if (DiasCuota > 0) then
           begin
              PeriodoFacturacionFin := IncDay(FechaCuota, -1);
              PeriodoFacturacionIni := IncDay(PeriodoFacturacionFin, DiasCuota * (-1));
           end;

           SetInvoicingPeriod(PeriodoFacturacionIni, PeriodoFacturacionFin);
        end
        else
        begin
           if ((QMCabeceraPERIODO_FACTURACION_INI.AsDateTime > EncodeDate(2000, 01, 01)) and (QMCabeceraPERIODO_FACTURACION_FIN.AsDateTime > EncodeDate(2000, 01, 01))) then
              SetInvoicingPeriod(QMCabeceraPERIODO_FACTURACION_INI.AsDateTime, QMCabeceraPERIODO_FACTURACION_FIN.AsDateTime);
        end;

        with QMDetalle do
        begin
           // Abro procedencia para obtener SU_REFERENCIA origen
           QSPProcedencia.Close;
           QSPProcedencia.Open;

           HayInversionSujetoPasivo := False;

           First;
           while not EOF do
           begin
              // Hasta que implemente los descuentos debo poner PRECIO después del descuento
              // SetItem(QMDetalleARTICULO.AsString, QMDetalleTITULO.AsString, '01'{UnitOfMeasure}, QMDetalleUNIDADES.AsFloat, QMDetallePRECIO.AsFloat, '01'{TaxTypeCode}, QMDetalleP_IVA.AsFloat, QMDetalleB_DTO_LINEA.AsFloat, QMDetalleC_IVA.AsFloat, QMCabeceraSU_REFERENCIA.AsString);

              { Parece qye ahora se admiten lineas a 0 }
              // No se adminten lineas a precio 0.
              // if ((QMDetalleUNIDADES.AsFloat <> 0) and (QMDetalleB_IMPONIBLE.AsFloat <> 0)) then
              begin
                 // Ultimos 4 campos son:
                 // IssuerContractReference: Referencia del contrato del Emisor. (Opcional). Se asigna documento origen.
                 // IssuerTransactionReference: Referencia de la Operación, Número de Pedido, Contrato, etc. del Emisor. (Opcional). Se asigna documento origen.
                 // ReceiverTransactionReference: Referencia de la Operación, Número de Pedido, Contrato, etc. del Receptor. (Opcional). Se asigna referencia del documento origen.
                 // FileReference: Referencia de expediente (Opcional). Se asigna referencia de la factura

                 IssuerContractReference := '';
                 IssuerTransactionReference := '';
                 QSPProcedencia.First;
                 while (not QSPProcedencia.EOF) and (QSPProcedencia.FieldByName('RIG_O').AsInteger > 0) do
                 begin
                    if (QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC') then
                    begin
                       IssuerContractReference := Format('%s-%s/%d', [QSPProcedencia.FieldByName('TIPO_O').AsString, QSPProcedencia.FieldByName('SERIE_O').AsString, QSPProcedencia.FieldByName('RIG_O').AsInteger]);
                       IssuerTransactionReference := Format('%s-%s/%d', [QSPProcedencia.FieldByName('TIPO_O').AsString, QSPProcedencia.FieldByName('SERIE_O').AsString, QSPProcedencia.FieldByName('RIG_O').AsInteger]);
                    end;

                    QSPProcedencia.Next;
                 end;

                 ReceiverTransactionReference := QMCabeceraPEDIDO_CLIENTE.AsString;
                 FileReference := QMCabeceraSU_REFERENCIA.AsString;

                 SetItem(QMDetalleARTICULO.AsString, QMDetalleTITULO.AsString, '01'{UnitOfMeasure}, QMDetalleUNIDADES.AsFloat, QMDetalleB_IMPONIBLE.AsFloat / QMDetalleUNIDADES.AsFloat, '01'{TaxTypeCode}, QMDetalleP_IVA.AsFloat, QMDetalleB_IMPONIBLE.AsFloat, QMDetalleC_IVA.AsFloat, IssuerContractReference, IssuerTransactionReference, ReceiverTransactionReference, FileReference);

                 // DeliveryNotesReferences: Referencias de albaranes.
                 QSPProcedencia.First;
                 while (not QSPProcedencia.EOF) and (QSPProcedencia.FieldByName('RIG_O').AsInteger > 0) do
                 begin
                    if (QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB') then
                       SetItemDeliveryNote(Format('%s/%d', [QSPProcedencia.FieldByName('SERIE_O').AsString, QSPProcedencia.FieldByName('RIG_O').AsInteger]), QSPProcedencia.FieldByName('FECHA').AsDateTime);

                    QSPProcedencia.Next;
                 end;

                 if (QMDetalleINVERSION_SUJETO_PASIVO.AsInteger = 1) then
                    HayInversionSujetoPasivo := True;
              end;

              Next;
           end;

           QSPProcedencia.Close;
        end;

        // Portes
        if (QMCabeceraI_PORTES.AsFloat <> 0) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT P.TITULO, I.P_IVA ');
                 SQL.Add(' FROM CON_CUENTAS_GES_PORTES P ');
                 SQL.Add(' JOIN SYS_TIPO_IVA I ON P.TIPO_IVA = I.TIPO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' I.PAIS = :PAIS AND ');
                 SQL.Add(' P.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' P.EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' P.CANAL = :CANAL AND ');
                 SQL.Add(' P.TIPO = :TIPO_PORTE ');
                 Params.ByName['PAIS'].AsString := REntorno.Pais;
                 Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                 Params.ByName['TIPO_PORTE'].AsInteger := QMCabeceraTIPO_PORTES.AsInteger;
                 ExecQuery;
                 TituloPorte := FieldByName['TITULO'].AsString;
                 PorcentajeIVAPorte := FieldByName['P_IVA'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // IssuerContractReference: Referencia del contrato del Emisor. (Opcional).
           // IssuerTransactionReference: Referencia de la Operación, Número de Pedido, Contrato, etc. del Emisor. (Opcional).
           // ReceiverTransactionReference: Referencia de la Operación, Número de Pedido, Contrato, etc. del Receptor. (Opcional).
           // FileReference: Referencia de expediente (Opcional). Se asigna referencia de la factura

           IssuerContractReference := '';
           IssuerTransactionReference := '';
           ReceiverTransactionReference := '';
           FileReference := QMCabeceraSU_REFERENCIA.AsString;

           SetItem(_('PORTES'), TituloPorte, '01'{UnitOfMeasure}, 1 {Quantity}, QMCabeceraI_PORTES.AsFloat, '01'{TaxTypeCode}, PorcentajeIVAPorte, QMCabeceraI_PORTES.AsFloat, (QMCabeceraI_PORTES.AsFloat * PorcentajeIVAPorte) / 100, IssuerContractReference, IssuerTransactionReference, ReceiverTransactionReference, FileReference);
        end;

        // SetPaymentDetails(Vencimiento: TDateTime; Importe: Double; PaymentMeans, IBAN, BancCode, BranchCode, Address, PostCode, Town, Province, CountryCode, BIC, ReconciliationReference, CollectionAditionalInformation, RegulatoryReportingData: string);
        // Si la factura esta cerrada, tiene vencimientos
        if (QMCabeceraESTADO.AsInteger = 5) then
        begin
           DS := TFIBDataSet.Create(nil);
           try
              with DS do
              begin
                 Transaction := TFIBTransaction.Create(nil);
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    with Transaction do
                    begin
                       DefaultDatabase := DMMain.DataBase;
                       TRParams.Clear;
                       TRParams.Add('read_committed');
                       TRParams.Add('read');
                       if (not InTransaction) then
                          StartTransaction;
                    end;
                    SelectSQL.Add(' SELECT C.REGISTRO, D.LINEA, C.FORMA_PAGO, D.VENCIMIENTO, D.LIQUIDO, D.TIPO_EFECTO, T.TIPO_EFECTO_FACTURAE, D.CTA_PAGO ');
                    SelectSQL.Add(' FROM EMP_CARTERA C ');
                    SelectSQL.Add(' JOIN EMP_CARTERA_DETALLE D ON C.ID_CARTERA = D.ID_CARTERA ');
                    SelectSQL.Add(' JOIN SYS_TIPO_EFECTO T ON D.TIPO_EFECTO = T.TIPO ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' C.ID_DOC = :ID_DOC AND ');
                    SelectSQL.Add(' C.SIGNO = ''C'' AND ');
                    SelectSQL.Add(' D.VISIBLE = 1 ');
                    Params.ByName['ID_DOC'].AsInteger := QMCabeceraID_S.AsInteger;
                    Open;
                    while not EOF do
                    begin
                       // Valores posibles para PaymentMeans (Forma de Pago)
                       // 01 Al contado
                       // 02 Recibo Domiciliado
                       // 03 Recibo
                       // 04 Transferencia
                       // 05 Letra aceptada
                       // 06 Credito Documentario
                       // 07 Contrato Adjudicacion
                       // 08 Letra de cambio
                       // 09 Pagare a la Orden
                       // 10 Pagare No a la Orden
                       // 11 Cheque
                       // 12 Reposicion
                       // 13 Especiales
                       // 14 Compensacion
                       // 15 Giro Postal
                       // 16 Cheque conformado
                       // 17 Cheque bancario
                       // 18 Pago contra reembolso
                       // 19 Pago mediante tarjeta
                       PaymentMeans := Format('%.2d', [FieldByName('TIPO_EFECTO_FACTURAE').AsInteger]);

                       // Selecciono el banco a utilizar segun la forma de pago (el del cliente o el de la empresa)
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;

                             SQL.Clear;
                             // Si es recibo muestro el banco por el que se girará.
                             // Si es otra forma de pago muestro el banco de la empresa.
                             if (DS.FieldByName('TIPO_EFECTO').AsString = 'REC') then
                             begin
                                // Si el banco no está establecido en el documento, muestro el primero del tercero
                                if (QMCabeceraBANCO.AsInteger = 0) then
                                begin
                                   // Ordeno por banco también por si hay varios con el mismo orden.
                                   SQL.Text := 'SELECT IBAN, BIC FROM SYS_TERCEROS_BANCOS WHERE TERCERO = :TERCERO AND ACTIVA = 1 AND MODO IN (0, 2) ORDER BY ORDEN, BANCO';
                                   Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
                                end
                                else
                                begin
                                   SQL.Text := 'SELECT IBAN, BIC FROM SYS_TERCEROS_BANCOS WHERE TERCERO = :TERCERO AND BANCO = :BANCO';
                                   Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
                                   Params.ByName['BANCO'].AsInteger := QMCabeceraBANCO.AsInteger;
                                end;
                             end
                             else
                             begin
                                // Todos los ejercicios mostrarian el mismo IBAN/BIC
                                SQL.Add(' SELECT FIRST 1 B.IBAN, B.BIC FROM EMP_BANCOS B ');
                                SQL.Add(' JOIN CON_CUENTAS_GES_BAN C ON B.EMPRESA = C.EMPRESA AND B.BANCO = C.BANCO ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' B.EMPRESA = :EMPRESA AND ');
                                SQL.Add(' B.ACTIVO = 1 AND ');
                                SQL.Add(' C.CUENTA_CC = :CUENTA ');
                                SQL.Add(' ORDER BY B.BANCO ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['CUENTA'].AsString := DS.FieldByName('CTA_PAGO').AsString;
                             end;

                             ExecQuery;
                             IBAN := FieldByName['IBAN'].AsString;
                             BIC := FieldByName['BIC'].AsString;
                             // Se debe poner el BIC en 11 caracteres. Si es de 8, se puede rellenar con 'XXX'.
                             if (Length(BIC) = 8) then
                                BIC := BIC + 'XXX';
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       BancCode := '';
                       BranchCode := '';
                       Address := '';
                       PostCode := '';
                       Town := '';
                       Province := '';
                       CountryCode := '';

                       // Para norma 43
                       ReconciliationReference := Format('FAC %d-%s/%d.%d', [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, FieldByName('LINEA').AsInteger]);
                       // Observaciones del cobro
                       CollectionAditionalInformation := '';
                       // Codigo estadistico
                       RegulatoryReportingData := '';

                       SetPaymentDetails(FieldByName('VENCIMIENTO').AsDateTime, FieldByName('LIQUIDO').AsFloat, PaymentMeans, IBAN, BancCode, BranchCode, Address, PostCode, Town, Province, CountryCode, BIC, ReconciliationReference, CollectionAditionalInformation, RegulatoryReportingData);
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
        end;

        if (QMCabeceraRECC.AsInteger = 1) then
           SetLegalLiterals('Régimen Especial del Criterio de Caja Artículo 23 de la ley 14/2013 de 27 de septiembre durante el ejercicio 2024');

        if (ClienteCanarias and HayInversionSujetoPasivo) then
        begin
           SetLegalLiterals('Operación exenta por aplicación del artículo 21 de la Ley 37/1992, de 28 de diciembre, del Impuesto sobre el Valor Añadido');
           SetLegalLiterals('Se invierte el sujeto pasivo. Artículo 19.1.2º a) de la ley 20/1991 de 7 de Junio, de modificación de los aspectos fiscales del Régimen Económico Fiscal de Canarias');
        end;

        // Separo por cada salto de linea en un elemento diferente
        LegalLiterals := Trim(QMCabeceraLEGAL_LITERALS.AsString);
        if (LegalLiterals > '') then
        begin
           // Agrego un intro al final si no lo tiene para que el bucle sea mas simple
           LegalLiterals := Trim(LegalLiterals) + #13#10;

           // Trato cada línea como un literal distinto
           while (Pos(#13#10, LegalLiterals) > 0) do
           begin
              s := Trim(Copy(LegalLiterals, 1, Pos(#13#10, LegalLiterals)));

              // Si tiene mas de 250 caracteres parto el texto en varios literales.
              while (Length(s) > 250) do
              begin
                 // Busco el ultimo espacio antes del caracter 250 para no cortar palabras
                 p := 250;
                 while (p > 0) and (s[p] <> ' ') do
                    Dec(p);

                 if (p > 0) then
                 begin
                    SetLegalLiterals(Trim(Copy(s, 1, p)));
                    s := Trim(Copy(s, p + 1, Length(s)));
                 end
                 else
                 begin
                    p := 250;
                    SetLegalLiterals(Trim(Copy(s, 1, p)));
                    s := Trim(Copy(s, p + 1, Length(s)));
                 end;
              end;

              // Si queda un resto de texto lo agrego a una última línea.
              if (s > '') then
                 SetLegalLiterals(s);

              LegalLiterals := Trim(Copy(LegalLiterals, Pos(#13#10, LegalLiterals) + 1, Length(LegalLiterals)));

              // Si queda algo agrego el INTRO al final para que entre otra vez al WHILE porque TRIM quita el INTRO
              if (LegalLiterals > '') then
                 LegalLiterals := Trim(LegalLiterals) + #13#10;
           end;
        end;

        InvoiceAditionaInformation := Trim(QMCabeceraNOTAS.AsString);
        if (InvoiceAditionaInformation > '') then
           SetAdditionalData(InvoiceAditionaInformation);

        // Fuerzo totales
        with TFIBDataSet.Create(nil) do
        begin
           try
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add('SELECT P_IVA, S_BASES, I_IVA FROM GES_CABECERAS_S_REDONDEOS WHERE  ID_S = :ID_S ORDER BY TIPO_IVA');
                 Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
                 Open;
                 while not EOF do
                 begin
                    SetInvoiceTaxesOutputs('01' {TaxTypeCode}, FieldByName('P_IVA').AsFloat, FieldByName('S_BASES').AsFloat, FieldByName('I_IVA').AsFloat);
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

        SetInvoiceTotals(QMCabeceraS_BASES.AsFloat, QMCabeceraS_CUOTA_IVA.AsFloat);

        Finaliza;

        // Firmar
        DMMain.Log(Format('Ceritficado: %s.', [Certificado]));
        if (Certificado <> '') then
        begin
           try
              FirmarFacturaE(Certificado, Fichero);
           except
              on E: Exception do
                 ShowMessage(_('No se ha podido firmar el fichero') + #13#10 + E.Message);
           end;
        end
        else
           Result := Fichero;
        //ShowMessage(Format(_('Se ha creado el fichero' + #13#10 + '%s'), [Fichero]));
     end;
  finally
     FacturaElectronica.Free;
  end;
end;

procedure TDMFacturas.RellenaDatosOldLinea;
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturas.RellenaDatosLinea(Linea: TStrings);

  procedure AddField(Linea: TStrings; Campo: string);
  begin
     if (QMDetalle.FieldByName(Campo) is TDateTimeField) then
        TStringList(Linea).Add(Campo + '=' + DateTimeToStr(QMDetalle.FieldByName(Campo).AsDateTime))
     else
        TStringList(Linea).Add(Campo + '=' + QMDetalle.FieldByName(Campo).AsString);
  end;

begin
  TStringList(Linea).Clear;

  // Si hay lineas copio los datos de la actual.
  if (QMDetalleLINEA.AsInteger > 0) then
  begin
     AddField(Linea, 'ARTICULO');
     AddField(Linea, 'TITULO');
     AddField(Linea, 'UNIDADES');
     // AddField(Linea, 'PRECIO');
     AddField(Linea, 'DESCUENTO');
     AddField(Linea, 'DESCUENTO_2');
     AddField(Linea, 'DESCUENTO_3');
     AddField(Linea, 'TIPO_IVA');
     AddField(Linea, 'NOTAS');
     AddField(Linea, 'NOTAS2');
     AddField(Linea, 'DIRECCION_ENTREGA');
     AddField(Linea, 'TITULO_IDIOMA');
     AddField(Linea, 'COSTE_ADICIONAL');
     AddField(Linea, 'TIPO_UNIDAD_LOGISTICA');
     // AddField(Linea, 'ID_UBICACION');
     AddField(Linea, 'ID_LOTE');
  end;
end;

procedure TDMFacturas.CambiaPCosteLinea(PCoste: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CAMBIA_P_COSTE_DETALLE (:ID_DETALLES_S, :P_COSTE)';
        Params.ByName['P_COSTE'].AsFloat := PCoste;
        Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
  InfoActualiza;
end;

procedure TDMFacturas.CambiaCosteAdicionalLinea(CosteAdicional: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CAMBIA_COSTE_ADIC_DETALLE (:ID_DETALLES_S, :COSTE_ADICIONAL)';
        Params.ByName['COSTE_ADICIONAL'].AsFloat := CosteAdicional;
        Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
  InfoActualiza;
end;

procedure TDMFacturas.ImprimirDocumento(Modo: integer; Listado: integer = 1);
var
  Imprimir : boolean;
  param_FACIMPR004 : string;
  param_FACDTED006 : string;
begin
  // Verificamos si puede imprimir
  if (REntorno.Pais = 'CHL') then
  begin
     param_FACDTED006 := LeeParametro('FACDTED006', QMCabeceraSERIE.AsString);
     if (param_FACDTED006 = 'S') then
        if (QMCabeceraFEChileSII_TRACKID.AsString = '') then
           raise Exception.Create(_('La factura no puede ser impresa porque no tiene un TrackId asignado'));
  end;

  // Cerramos la factura antes de imprimir
  if ((QMCabeceraESTADO.AsInteger = 0) and (LeeParametro('FACIMPR001', Serie) = 'S')) then
     CierraFactura;

  Imprimir := True;
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     param_FACIMPR004 := LeeParametro('FACIMPR004', Serie);
     if (param_FACIMPR004 = 'I') then
        Imprimir := False;
     if (param_FACIMPR004 = 'A') then
        Imprimir := (MessageDlg(_('La factura no esta cerrada. ¿Desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes);
  end;

  if Imprimir then
  begin
     AbreData(TDMLstFactura, DMLstFactura);
     try
        DMLstFactura.MostrarListado(QMCabeceraID_S.AsInteger, QMCabeceraRIG.AsInteger, QMCabeceraSERIE.AsString, Modo, Listado, QMCabeceraEJERCICIO.AsInteger, False {ForzarCopias}, 0 {Copias}, (LeeParametro('FACLSTM001') = 'S'));
     finally
        CierraData(DMLstFactura);
     end;
  end;

  // Refresco valor de check del estado listado
  InfoActualiza;
end;

procedure TDMFacturas.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMFacturas.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulos.Close;
  {dji lrk kri - C.Costes}
  QMDetallesCostes.Close;
  xCuentaArticulo.Close;
end;

procedure TDMFacturas.DuplicarLinea;
var
  old_KriConf465 : boolean;
  IdDetallesS, NuevaLinea : integer;
  Precio : double;
begin
  old_KriConf465 := KriConf465;
  try
     KriConf465 := True;
     IdDetallesS := QMDetalleID_DETALLES_S.AsInteger;

     // Guardo los datos con lo que hay en la linea si KriConf465 estaba deshabilidatdo
     RellenaDatosOldLinea;
     Precio := QMDetalle.FieldByName('PRECIO').AsFloat;

     with QMDetalle do
     begin
        Insert;
        QMDetalle.FieldByName('PRECIO').AsFloat := Precio;
        Post;
     end;
     NuevaLinea := QMDetalleLINEA.AsInteger;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO GES_DETALLES_S_DETALLES ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, REFERENCIA, SOPORTE, UNIDADES, ACABADO, ');
           SQL.Add(' EMBALAJE, FECHA_INSTALACION, LUGAR_INSTALACION, ENTRADA, ENTREGA_AAFF, ALTO_AREA_VISIBLE, ANCHO_AREA_VISIBLE, ');
           SQL.Add(' ALTO_MEDIDA_TOTAL, ANCHO_MEDIDA_TOTAL, FECHA_INSTALACION_PEND, ENTREGA_AAFF_PEND, HORA_INSTALACION_PEND) ');
           SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, :NUEVA_LINEA, ID_S, 0, REFERENCIA, SOPORTE, UNIDADES, ACABADO, EMBALAJE, ');
           SQL.Add('        FECHA_INSTALACION, LUGAR_INSTALACION, :ENTRADA, ENTREGA_AAFF, ALTO_AREA_VISIBLE, ANCHO_AREA_VISIBLE, ');
           SQL.Add('        ALTO_MEDIDA_TOTAL, ANCHO_MEDIDA_TOTAL, FECHA_INSTALACION_PEND, ENTREGA_AAFF_PEND, HORA_INSTALACION_PEND ');
           SQL.Add(' FROM GES_DETALLES_S_DETALLES ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_DETALLES_S = :ID_DETALLES_S ');
           Params.ByName['NUEVA_LINEA'].AsInteger := NuevaLinea;
           Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDetalle.Last;
  finally
     KriConf465 := old_KriConf465;
  end;
end;

procedure TDMFacturas.QMDetalleCalcFields(DataSet: TDataSet);
var
  Stock : double;
  Articulo : string;
  Canal : integer;
begin
  QMDetalleMARGEN.AsFloat := DMMain.DameMargenUtilidad(QMDetalleB_IMPONIBLE.AsFloat, QMDetalleT_COSTE.AsFloat);

  Articulo := QMDetalleARTICULO.AsString;
  if (QMDetalleCONTROL_STOCK.AsInteger = 1) then
  begin
     Canal := Param_MOVSTKC001;
     if (Canal = 0) then
        Canal := REntorno.Canal;

     Stock := 0;
     if AlmacenStockReal then
        Stock := DMMain.DameStockRealArticulo(REntorno.Empresa, Canal, Articulo, QMDetalleALMACEN.AsString);
     QMDetalleSTOCK_REAL.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK_REAL.AsFloat := 0;
  end;
end;

procedure TDMFacturas.AsignaEmpleados;
begin
  UFMAsignaEmpleado.PideDato(QMCabeceraID_S.AsInteger);
end;

procedure TDMFacturas.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);
  QMCabeceraMARGEN.AsFloat := DMMain.DameMargenUtilidad(QMCabeceraS_BASES.AsFloat, QMCabeceraC_TOTAL.AsFloat);

  if QMCabeceraESTADO.AsInteger = 5 then
     QMCabeceraVF_ESTADO_REGISTRO.AsString := QMCabeceraVF_ESTADO_REGISTRO_ALTA.AsString
  else
  if QMCabeceraESTADO.AsInteger = 2 then
     QMCabeceraVF_ESTADO_REGISTRO.AsString := QMCabeceraVF_ESTADO_REGISTRO_ANULACION.AsString
  else
     QMCabeceraVF_ESTADO_REGISTRO.AsString := '';

  if (QMCabecera.FieldByName('RECT').AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_RECT';
           Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
           ExecQuery;
           QMCabeceraDESC_RECTIFICACION.AsString := Format(_('Rectificación de la Factura: (%d) %s/%d'), [FieldByName['EJERCICIO'].AsInteger, FieldByName['SERIE'].AsString, FieldByName['RIG'].AsInteger]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  if (QMCabecera.FieldByName('ID_RECT').AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_RECT';
           Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
           ExecQuery;
           QMCabeceraDESC_RECTIFICACION.AsString := Format(_('Rectificada en la Factura: (%d) %s/%d'), [FieldByName['EJERCICIO'].AsInteger, FieldByName['SERIE'].AsString, FieldByName['RIG'].AsInteger]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMCabeceraDESC_RECTIFICACION.AsString := '';
end;

procedure TDMFacturas.ActualizaPorteSegunZona;
var
  Zona : string;
  CodigoPostal : string;
  Importe, ImporteReembolso : double;
  TipoEfectoFacturae : integer;
begin
  // Obtengo codigo postal de direccion
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT L.CODIGO_POSTAL FROM SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.TERCERO = :TERCERO AND ');
        SQL.Add(' D.DIRECCION = :DIRECCION ');

        Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
        Params.ByName['DIRECCION'].AsInteger := QMCabeceraDIRECCION.AsInteger;
        ExecQuery;
        CodigoPostal := FieldByName['CODIGO_POSTAL'].AsString;
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
        SQL.Add(' SELECT ZONA, IMPORTE, IMPORTE_RMB ');
        SQL.Add(' FROM CON_CUENTAS_GES_TAR_PORTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ACREEDOR = :ACREEDOR AND ');
        SQL.Add(' ((ZONA = :ZONA) OR ');
        SQL.Add('  (CODIGO_POSTAL_INI <= :CODIGO_POSTAL) AND (CODIGO_POSTAL_FIN >= :CODIGO_POSTAL)) ');
        SQL.Add(' ORDER BY ZONA, CODIGO_POSTAL_INI ');

        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['ACREEDOR'].AsInteger := QMCabeceraTRANSPORTISTA.AsInteger;
        Params.ByName['ZONA'].AsString := xCliente.FieldByName('ZONA').AsString;
        Params.ByName['CODIGO_POSTAL'].AsString := CodigoPostal;
        ExecQuery;
        Zona := Trim(FieldByName['ZONA'].AsString);
        Importe := FieldByName['IMPORTE'].AsFloat;
        ImporteReembolso := FieldByName['IMPORTE_RMB'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((Importe <> 0) or (ImporteReembolso <> 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT E.TIPO_EFECTO_FACTURAE ');
           SQL.Add(' FROM CON_CUENTAS_GES_FP F ');
           SQL.Add(' JOIN SYS_TIPO_EFECTO E ON F.TIPO_EFECTO = E.TIPO ');
           SQL.Add(' WHERE ');
           SQL.Add(' F.EMPRESA = :EMPRESA AND ');
           SQL.Add(' F.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' F.CANAL = :CANAL AND ');
           SQL.Add(' F.FORMA_PAGO = :FORMA_PAGO ');

           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['FORMA_PAGO'].AsString := QMCabeceraFORMA_PAGO.AsString;
           ExecQuery;
           TipoEfectoFacturae := FieldByName['TIPO_EFECTO_FACTURAE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (TipoEfectoFacturae = 18) then
     begin
        QMCabeceraTIPO_PORTES.AsInteger := 4;
        QMCabeceraI_PORTES.AsFloat := ImporteReembolso;
     end
     else
     begin
        QMCabeceraTIPO_PORTES.AsInteger := 4;
        QMCabeceraI_PORTES.AsFloat := Importe;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraTRANSPORTISTAChange(Sender: TField);
begin
  if (xCliente.FieldByName('TIPO_PORTES').AsInteger = 0) then
     ActualizaPorteSegunZona;
end;

{
procedure TDMFacturas.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
begin
  if (Assigned(FSendCorreo)) then
  begin
     FSendCorreo.Texto(Format('%d kb transferidos', [AWorkCount div 1024]));
     Application.ProcessMessages;
  end;
end;
}

procedure TDMFacturas.PosicionarID(IdDoc: integer);
begin
  // Si pertenece al ejercicio posiciono, sino filtro ese documento
  if (DMMain.DameEjercicioDoc('FAC', IdDoc) = REntorno.Ejercicio) then
  begin
     // Quito filtro si lo hubiera
     FiltraDocumento('');
     Posicionar(QMCabecera, 'ID_S', IdDoc);
  end
  else
     FiltraDocumento('ID_S = ' + IntToStr(IdDoc));
end;

procedure TDMFacturas.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
begin
  if (not ModificandoCambioFijo) then
  begin
     ModificandoCambioFijo := True;
     try
        if (QMCabeceraVALOR_CAMB_FIJO.AsFloat <> 0) then
           QMCabeceraVALOR_CAMB_FIJO_INV.AsFloat := 1 / QMCabeceraVALOR_CAMB_FIJO.AsFloat
        else
           QMCabeceraVALOR_CAMB_FIJO_INV.AsFloat := 1;
     finally
        ModificandoCambioFijo := False;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
begin
  if (not ModificandoCambioFijo) then
  begin
     ModificandoCambioFijo := True;
     try
        if (QMCabeceraVALOR_CAMB_FIJO_INV.AsFloat <> 0) then
           QMCabeceraVALOR_CAMB_FIJO.AsFloat := 1 / QMCabeceraVALOR_CAMB_FIJO_INV.AsFloat
        else
           QMCabeceraVALOR_CAMB_FIJO.AsFloat := 1;
     finally
        ModificandoCambioFijo := False;
     end;
  end;
end;

procedure TDMFacturas.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
var
  IdLote : integer;
  Composicion : string;
begin
  if (ArticuloLoteable(Articulo) = False) then
     Lote := '';
  if (ArticuloUbicable(Articulo) = False) then
     IdUbicacion := 0;

  // Se comprueba que exista el lote
  if (Lote <> '') then
  begin
     IdLote := DameIDLote(Articulo, Lote);

     // Insertamos lote si no existe
     if (IdLote = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_CREA_LOTE(:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :LOTE, :FECHA, :RIG, :SERIE)';
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['LOTE'].AsString := Lote;
              Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              ExecQuery;
              // IdLote := FieldByName['ID_LOTE'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  // Se comprueba que exista ubicacion
  if (IdUbicacion <> 0) then
  begin
     Composicion := DameComposicionUbicacion(IdUbicacion);
     // if (Composicion = '') then
     //    IdUbicacion := 0;
  end;

  // Se insera el registro
  QMDetalle.Insert;
  QMDetalleARTICULO.AsString := Articulo;
  if (Descripcion <> '') then
     QMDetalleTITULO.AsString := Descripcion;
  QMDetalleUNIDADES.AsFloat := Unidades;
  if (Precio >= 0) then
     QMDetallePRECIO.AsFloat := Precio;
  if (PCoste >= 0) then
     QMDetalleP_COSTE.AsFloat := PCoste;
  if (Descuento1 >= 0) then
     QMDetalleDESCUENTO.AsFloat := Descuento1;
  if (Descuento2 >= 0) then
     QMDetalleDESCUENTO_2.AsFloat := Descuento2;
  if (Descuento3 >= 0) then
     QMDetalleDESCUENTO_3.AsFloat := Descuento3;
  if (FechaPrevista >= QMCabeceraFECHA.AsDateTime) then
     QMDetalleFECHA_PRE_DET.AsDateTime := FechaPrevista;

  { TODO -oDuilio : Ver como insertar Lote de la linea }
  {
  if (IdLote <> 0) then
     QMDetalleID_LOTE.AsInteger := IdLote;
  }
  { TODO -oDuilio : Ver como insertar Ubicacion de la linea }
  {
  if (IdUbicacion <> 0) then // Si es 0 se deja en blanco y el trigger se encgargara
     QMDetalleID_UBICACION.AsInteger := IdUbicacion;
  }

  QMDetalle.Post;
end;

procedure TDMFacturas.DameFacturaDevolucion;
var
  EncfOrigen : string;
begin
  if (QMCabeceraID_DEV.AsInteger = 0) then
  begin
     with TFMDatosFactRectificacion.Create(Self) do
     begin
        try
           PasaTipo('FAC');
           ShowModal;

           if (ModalResult = mrOk) then
           begin
              QMCabeceraID_DEV.AsInteger := IdDoc;

              // Ahora buscamos los datos de cabecera.
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT CLIENTE, DIRECCION, CONTACTO, AGENTE, FORMA_PAGO, TARIFA, ALMACEN, SU_REFERENCIA, ');
                    SQL.Add(' TRANSPORTISTA, TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE, DTO_CIAL, DTO_PP, ');
                    SQL.Add(' MONEDA, PROYECTO, CAMPANYA, POR_FINANCIACION, TIPO_IRPF, ');
                    SQL.Add(' PERIODO_FACTURACION_INI, PERIODO_FACTURACION_FIN ');
                    SQL.Add(' FROM VER_CABECERAS_FACTURA ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_S = :ID_S_ORIGEN');
                    Params.ByName['ID_S_ORIGEN'].AsInteger := IdDoc;

                    ExecQuery;

                    // Datos de factura origen
                    QMCabecera.FieldByName('CLIENTE').AsInteger := FieldByName['CLIENTE'].AsInteger;
                    QMCabecera.FieldByName('DIRECCION').AsInteger := FieldByName['DIRECCION'].AsInteger;
                    QMCabecera.FieldByName('CONTACTO').AsInteger := FieldByName['CONTACTO'].AsInteger;
                    QMCabecera.FieldByName('AGENTE').AsInteger := FieldByName['AGENTE'].AsInteger;
                    QMCabecera.FieldByName('FORMA_PAGO').AsString := FieldByName['FORMA_PAGO'].AsString;
                    QMCabecera.FieldByName('TARIFA').AsString := FieldByName['TARIFA'].AsString;
                    QMCabecera.FieldByName('ALMACEN').AsString := FieldByName['ALMACEN'].AsString;
                    QMCabecera.FieldByName('SU_REFERENCIA').AsString := FieldByName['SU_REFERENCIA'].AsString;
                    QMCabecera.FieldByName('TRANSPORTISTA').AsInteger := FieldByName['TRANSPORTISTA'].AsInteger;
                    QMCabecera.FieldByName('TIPO_PORTES').AsInteger := FieldByName['TIPO_PORTES'].AsInteger;
                    QMCabecera.FieldByName('POR_PORTES').AsFloat := FieldByName['POR_PORTES'].AsFloat;
                    QMCabecera.FieldByName('I_PORTES').AsFloat := FieldByName['I_PORTES'].AsFloat;
                    QMCabecera.FieldByName('RANGO').AsInteger := FieldByName['RANGO'].AsInteger;
                    QMCabecera.FieldByName('INDICE').AsInteger := FieldByName['INDICE'].AsInteger;
                    QMCabecera.FieldByName('DTO_CIAL').AsFloat := FieldByName['DTO_CIAL'].AsFloat;
                    QMCabecera.FieldByName('DTO_PP').AsFloat := FieldByName['DTO_PP'].AsFloat;
                    QMCabecera.FieldByName('MONEDA').AsString := FieldByName['MONEDA'].AsString;
                    QMCabecera.FieldByName('PROYECTO').AsInteger := FieldByName['PROYECTO'].AsInteger;
                    QMCabecera.FieldByName('CAMPANYA').AsInteger := FieldByName['CAMPANYA'].AsInteger;
                    QMCabecera.FieldByName('POR_FINANCIACION').AsFloat := FieldByName['POR_FINANCIACION'].AsFloat;
                    QMCabecera.FieldByName('TIPO_IRPF').AsInteger := FieldByName['TIPO_IRPF'].AsInteger;
                    QMCabecera.FieldByName('PERIODO_FACTURACION_INI').AsDateTime := FieldByName['PERIODO_FACTURACION_INI'].AsDateTime;
                    QMCabecera.FieldByName('PERIODO_FACTURACION_FIN').AsDateTime := FieldByName['PERIODO_FACTURACION_FIN'].AsDateTime;

                    // Datos para la devolucion
                    QMCabecera.FieldByName('FECHA').AsDateTime := Now;
                    // QMCabecera.FieldByName('Z_TIPO_NCF').AsInteger := ???;

                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
              QMCabecera.Post;

              // Insertamos los datos de clientes varios de la factura de origen
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO GES_CABECERAS_S_FAC_NIF ( ');
                    SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, NOMBRE, NIF, DIRECCION, C_POSTAL, PROVINCIA, PAIS, LOCALIDAD, TELEFONO01, ');
                    SQL.Add(' TELEFONO02, TELEFAX, EMAIL, NOTAS, COLONIA, TERCERO, CARNET_APLICADOR, NOMBRE_CONTACTO, COMO_NOS_CONOCIERON, ');
                    SQL.Add(' TIPO_DOC_IDENT, PAIS_DOC_IDENT) ');
                    SQL.Add(' SELECT :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, NOMBRE, NIF, DIRECCION, C_POSTAL, PROVINCIA, PAIS, LOCALIDAD, ');
                    SQL.Add('        TELEFONO01, TELEFONO02, TELEFAX, EMAIL, NOTAS, COLONIA, TERCERO, CARNET_APLICADOR, NOMBRE_CONTACTO, ');
                    SQL.Add('        COMO_NOS_CONOCIERON, TIPO_DOC_IDENT, PAIS_DOC_IDENT ');
                    SQL.Add(' FROM GES_CABECERAS_S_FAC_NIF ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_S = :ID_S_ORIGEN ');

                    Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
                    Params.ByName['ID_S_ORIGEN'].AsInteger := IdDoc;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              // Creamos la referencia para anulacion de documento
              if (REntorno.Pais = 'DOM') then
              begin
                 //Obtenemos el encf del documento origen
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add('SELECT FIRST 1 ENCF ');
                       SQL.Add('FROM GES_CABECERAS_S_FAC_DGII ');
                       SQL.Add('WHERE ID_S = :ID_S ');
                       Params.ByName['ID_S'].AsInteger := IdDoc;
                       ExecQuery;
                       EncfOrigen := FieldByName['ENCF'].AsString;
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
                       SQL.Add('INSERT INTO DGII_ECF_REFERENCIA (ID_S, ID_S_REF, TIPO_CF_REF, ENCF_REF, TIPO_REF) ');
                       SQL.Add('VALUES (:ID_S, :ID_S_REF, :TIPO_CF_REF, :ENCF_REF, :TIPO_REF) ');
                       Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
                       Params.ByName['ID_S_REF'].AsInteger := IdDoc;
                       Params.ByName['TIPO_CF_REF'].AsInteger := 34;
                       Params.ByName['ENCF_REF'].AsString := EncfOrigen;
                       Params.ByName['TIPO_REF'].AsInteger := 1;
                       ExecQuery;

                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 QMCabecera.Edit;
                 QMCabeceraZ_TIPO_NCF.AsInteger := 34;
                 QMCabecera.Post;
              end;
              // A continuacion insertamos las lineas con unidades negativas
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ( ');
                    SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ALMACEN, ARTICULO, TITULO, UNIDADES, PRECIO, PIEZAS_X_BULTO, BULTOS, ');
                    SQL.Add(' DESCUENTO, COMISION, P_COSTE, TIPO_IVA, ENTRADA, NOTAS, NOTAS2, DESCUENTO_2, DESCUENTO_3, UNIDADES_SEC, ID_S, ID_A, ');
                    SQL.Add(' COMISION_LINEAL, TITULO_IDIOMA, TIPO_LINEA, APLICA_UNIDADES_SECUNDARIAS, PROYECTO, TIPO_LINEA_KRI, CRC_NOTAS, ');
                    SQL.Add(' CRC_NOTAS2, PRO_NUM_PLANO, TIPO_UNIDAD_LOGISTICA, UNIDADES_LOGISTICAS, CUENTA, LOTE_SIMPLE, DIRECCION_ENTREGA, ');
                    SQL.Add(' COSTE_ADICIONAL, MANIPULACION, INVERSION_SUJETO_PASIVO) ');
                    SQL.Add(' SELECT :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, LINEA, ALMACEN, ARTICULO, TITULO, UNIDADES * (-1), PRECIO, ');
                    SQL.Add('        PIEZAS_X_BULTO, BULTOS, DESCUENTO, COMISION, P_COSTE, TIPO_IVA, :ENTRADA, NOTAS, NOTAS2, DESCUENTO_2, ');
                    SQL.Add('        DESCUENTO_3, UNIDADES_SEC, :ID_S, ID_A, COMISION_LINEAL, TITULO_IDIOMA, TIPO_LINEA, APLICA_UNIDADES_SECUNDARIAS, ');
                    SQL.Add('        PROYECTO, TIPO_LINEA_KRI, CRC_NOTAS, CRC_NOTAS2, PRO_NUM_PLANO, TIPO_UNIDAD_LOGISTICA, UNIDADES_LOGISTICAS, ');
                    SQL.Add('        CUENTA, LOTE_SIMPLE, DIRECCION_ENTREGA, COSTE_ADICIONAL, MANIPULACION, INVERSION_SUJETO_PASIVO ');
                    SQL.Add(' FROM VER_DETALLE_FACTURA ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_S = :ID_S_ORIGEN ');
                    SQL.Add(' ORDER BY LINEA ');

                    Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
                    Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
                    Params.ByName['ID_S_ORIGEN'].AsInteger := IdDoc;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              QMCabecera.Refresh;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturas.QMCabeceraFECHAChange(Sender: TField);
begin
  QMCabeceraFECHA_CON.AsDateTime := QMCabeceraFECHA.AsDateTime;
end;

{
procedure TDMFacturas.EnviaSetPruebasFEChile;
var
  p:integer;
begin
  with QMSetPruebasChl do
  begin
    Close;
    // Obtenemos el select de las facturas filtradas
    SelectSQL.Assign(QMCabecera.SelectSql);

    // Solo selecciono los campos que necesito
    p := Pos('FROM', UpperCase(SelectSQL.Text));
    SelectSQL.Text := 'SELECT ID_S ' + Copy(SelectSQL.Text, p, Length(SelectSQL.Text));

    Open;

    for i := 0 to QMSetPruebasChl.Params.Count - 1 do
    begin
        GeneraFacturaElectronicaCL(QMSetPruebasChl)
    end;
  end;
end;
}

{
function TDMFacturas.DameFolio: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FOLIO ');
        SQL.Add(' FROM GES_CABECERAS_S_FAC ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ID_DEV = :ID_DEV ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['ID_DEV'].AsInteger := QMCabeceraID_DEV.AsInteger;
        ExecQuery;
        Result := FieldByName['FOLIO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;
}

procedure TDMFacturas.QMCabeceraTIPO_DOC_TRIBUTARIOChange(Sender: TField);
begin
  // Asignamos automaticamente el tipo de doc tributario de referencia
  if ((REntorno.Pais = 'CHL') and ((QMCabecera.State = dsEdit) or (QMCabecera.State = dsInsert))) then
  begin
     if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '33') then
        QMCabeceraGD_TPODOCREF.AsString := '33'
     else if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') then
        QMCabeceraGD_TPODOCREF.AsString := '33'
     else if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '56') then
        QMCabeceraGD_TPODOCREF.AsString := '61';
  end;
end;

procedure TDMFacturas.QMSIIDteReferenciaBeforePost(DataSet: TDataSet);
begin
  if ((QMSIIDteReferencia.State = dsInsert) or (QMSIIDteReferencia.State = dsEdit)) then
  begin
     // Validamos que la factura no este cerrada
     if (QMCabeceraESTADO.AsInteger = 5) then
        raise Exception.Create(_('No se puede modificar o agregar la referencia con el documento cerrado'));

     // Validamos si el tipo de documento tributario es valido
     if not (DMMain.TipoDocTributarioValido('FAC', QMSIIDteReferenciaTPODOCREF.AsString)) then
        raise Exception.Create(_('Tipo de documento tributario invalido '));

     // Si la referencia es de orden de compra verificamos que tenga asignado un numero de folio
     if ((QMSIIDteReferenciaTPODOCREF.AsString = '801') and (QMSIIDteReferenciaFOLIOREF.AsString = '')) then
        raise Exception.Create(_('Debe asiganar un numero de folio para la orden de compra'));

     // Cuando se trata de un DTE 33, 56 ó 61 verificamos si existe el id_s de referencia
     if ((QMSIIDteReferenciaTPODOCREF.AsString = '33') or (QMSIIDteReferenciaTPODOCREF.AsString = '56') or (QMSIIDteReferenciaTPODOCREF.AsString = '61')) then
        if (not DMMain.ExisteDocumentoReferencia(QMSIIDteReferenciaID_S_REF.AsInteger)) then
           raise Exception.Create(_('El ID del documento de referencia no corresponde a ningun documento'))
        else
           QMSIIDteReferenciaFOLIOREF.AsString := IntToStr(DMMain.DameFolioDTE(QMSIIDteReferenciaID_S_REF.AsInteger));
  end;
end;

procedure TDMFacturas.QMSIIDteReferenciaNewRecord(DataSet: TDataSet);
begin
  QMSIIDteReferenciaTPODOCREF.AsString := '';
  QMSIIDteReferenciaID_S.AsInteger := QMCabeceraID_S.AsInteger;
  QMSIIDteReferenciaFOLIOREF.AsString := '';
end;

procedure TDMFacturas.QMSIIDteReferenciaAfterPost(DataSet: TDataSet);
var
  NroLinRef : integer;
begin
  NroLinRef := QMSIIDteReferenciaNROLINREF.AsInteger;
  Refrescar(QMCabecera, 'ID_S', QMSIIDteReferenciaID_S.AsInteger);
  Refrescar(QMSIIDteReferencia, 'NROLINREF', NroLinRef);
end;

procedure TDMFacturas.QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO.AsFloat]);
end;

procedure TDMFacturas.QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_TOTAL.AsFloat]);
end;

procedure TDMFacturas.QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_REAL.AsFloat]);
end;

procedure TDMFacturas.QMDetalleTIPO_IVAChange(Sender: TField);
begin
  QMDetalleP_IVA.AsFloat := DMMain.DamePorcentajeIva(REntorno.Pais, QMDetalleTIPO_IVA.AsInteger);
end;

procedure TDMFacturas.EnvioTBAI(aTipo: string);
var
  FicheroTBAI : string;
  StreamOrigen, StreamDestino : TStream;
begin
  if (QMCabeceraESTADO.AsInteger <> 5) then
     ShowMessage('La factura no esta cerrada')
  else
  begin
     FicheroTBAI := DameTempPath + Format('TicketBAI-%d-%s-%d.xml', [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger]);
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              if (aTipo = 'Alta') then
                 SelectSQL.Add(' SELECT XML FROM GES_CABECERAS_S_FAC_TBAI WHERE TIPO = :TIPO AND ID_S = :ID_S ');
              if (aTipo = 'Baja') then
                 SelectSQL.Add(' SELECT XML_BAJA AS XML FROM GES_CABECERAS_S_FAC_TBAI WHERE TIPO = :TIPO AND ID_S = :ID_S ');
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              Open;

              StreamOrigen := CreateBlobStream(FieldByName('XML'), bmRead);
              try
                 StreamDestino := TFileStream.Create(FicheroTBAI, fmOpenWrite);
                 try
                    StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                 finally
                    StreamDestino.Free;
                 end;
              finally
                 StreamOrigen.Free;
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

     DMMain.LogIni('TBAI.Enviar(' + QMCabeceraID_S.AsString + ', ' + FicheroTBAI + ')');
     with TTicketBAI.Create(Self) do
     begin
        try
           Fichero := FicheroTBAI;
           Tipo := aTipo;
           Enviar(QMCabeceraID_S.AsInteger);
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturas.AnularTBAI;
var
  FicheroTBAI : string;
  //lValidCer : boolean;
  Certificado : string;
  StreamOrigen, StreamDestino : TStream;
begin
  FicheroTBAI := DameTempPath + Format('TicketBAI-%d-%s-%d-Baja.xml', [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger]);

  with TTicketBAI.Create(Self) do
  begin
     try
        Inicia('Baja', FicheroTBAI);

        SetIdFacturaEmisor(REntorno.CifEmpresa, REntorno.NombreEmpresa);
        SetIdFacturaCabecera(QMCabeceraSERIE.AsString, QMCabeceraRIG.AsString, QMCabeceraFECHA_CON.AsDateTime);

        { TODO : Obtener datos para rellenar Software}
        // SetHuellaTBAISoftware(LicenciaTBAI: string; NIFEntidad, Nombre, Version: string; CodigoPais: string = ''; IDType: string = ''; ID: string = '');
        SetHuellaTBAISoftware(LeeDatoIni('TBAI', 'Licencia', 'TBAIBI00000000PRUEBA'), LeeDatoIni('TBAI', 'NIF', 'A99800005'), LeeDatoIni('TBAI', 'Nombre', 'SOFTWARE GARANTE TICKETBAI PRUEBA'), LeeDatoIni('TBAI', 'Version', '1.0'));

        // Utilizo la MAC del servidor como numero de serie del dispositivo
        SetHuellaTBAINumSerie(MySendARP('localhost'));

        // Esto guarda el fichero generado
        Finaliza;

        // Certificado. Si viene en blanco, se toma el primero del ordenador.
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT CERTIFICADO FROM EMP_MODELOS_HACIENDA WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL';
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              ExecQuery;
              Certificado := Trim(FieldByName['CERTIFICADO'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Certificado = '') then
           Certificado := DMMain.DameCertificado(DMFacturas.QMDetalleSERIE.AsString);
        DMMain.Log(Format('Ceritficado: %s.', [Certificado]));

        try
           FirmarTBAI(Certificado, Fichero);
        except
           ShowMessage(_('No se ha podido firmar el fichero'))
        end;

        // Guardo los datos

        // Creo el registro si no existe
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE OR INSERT INTO GES_CABECERAS_S_FAC_TBAI ( ');
              SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
              SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');

              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRW(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;

                 SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FAC_TBAI WHERE ID_S = :ID_S ');

                 UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FAC_TBAI F ');
                 UpdateSQL.Add(' SET ');
                 UpdateSQL.Add(' F.XML_BAJA = :XML_BAJA ');
                 UpdateSQL.Add(' WHERE ');
                 UpdateSQL.Add(' F.ID_S = :ID_S ');

                 // Abro Dataset
                 Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
                 Open;

                 // Se pone en modo Insert
                 Edit;

                 StreamDestino := CreateBlobStream(FieldByName('XML_BAJA'), bmRead);
                 try
                    try
                       StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                       try
                          StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                       finally
                          StreamOrigen.Free;
                       end;
                    finally
                       StreamDestino.Free;
                    end;

                    // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
                 except
                    Cancel;
                 end;

                 Post;

                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.QMDetallePESO_REALChange(Sender: TField);
begin
  FlagModificandoUnidades := True;
  try
     if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
     begin
        QMDetalleUNIDADES.AsFloat := QMDetallePESO_REAL.AsFloat;
        QMDetallePESO_TOTAL.AsFloat := QMDetallePESO_REAL.AsFloat;
     end;
  finally
     FlagModificandoUnidades := False;
  end;
end;

procedure TDMFacturas.QMDetalleALMACENChange(Sender: TField);
begin
  if (param_VENPREC002) then
     EstaleceCondiciones(QMDetalleARTICULO, 0, (QMDetalle.State in [dsInsert, dsEdit]));
end;

procedure TDMFacturas.xInfoActualizadaCalcFields(DataSet: TDataSet);
begin
  xInfoActualizadaRIESGO_DISPONIBLE.AsFloat := (xInfoActualizadaRIESGO_AUT.AsFloat) - (xInfoActualizadaRIESGO_ACT.AsFloat + xInfoActualizadaRIESGO_PED.AsFloat);
end;

procedure TDMFacturas.QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_EXT.AsFloat]);
end;

procedure TDMFacturas.QMDetalleTOTAL_UNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleTOTAL_UNIDADES_EXT.AsFloat]);
end;

procedure TDMFacturas.QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleCANT_LOTE.AsFloat]);
end;

procedure TDMFacturas.xClienteAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMFacturas.xClienteBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMFacturas.xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraCLIENTE.AsInteger < 0) then
  begin
     Text := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DIRECCION FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIENTE, :ID_S, 0) WHERE ((NUM = :NUM) OR (:CLIENTE < 0))';
           Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
           Params.ByName['NUM'].AsInteger := QMCabeceraDIRECCION.AsInteger;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           Text := FieldByName['DIRECCION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  if (Text = '') then
     Text := xDireccionesTITULO.AsString;
end;

function TDMFacturas.DocumentoDteValido: boolean;

  function CAFVencido(Empresa, Canal: integer; TipoSocTributario: string): boolean;
  var
     FechaAutorizacion : TDateTime;
  begin
     // El CAF tiene una validez de 6 meses, lo verificamos antes de enviar.
     // porque el servicio de impuestos no devuelve un error en la respuesta,
     // Envia un reporte posteriormente al correo electronico del cliente.

     // Obtenemos la fecha de autorizacion del CAF
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FECHA_AUTORIZACION ');
           SQL.Add(' FROM SII_FOLIOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           // Los folios no deben filtrarse por serie.
           // SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' ACTIVO = 1 AND ');
           SQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['CANAL'].AsInteger := Canal;
           // Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoSocTributario;
           ExecQuery;
           FechaAutorizacion := FieldByName['FECHA_AUTORIZACION'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Result := (Now > IncMonth(FechaAutorizacion, 6));
  end;

  function ExisteComuna(Empresa, Cliente: integer): boolean;
  var
     Poblacion : string;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT FIRST 1 POBLACION ');
           SQL.Add('FROM SYS_TERCEROS_DIRECCIONES ');
           SQL.Add('WHERE ');
           SQL.Add('TERCERO = (SELECT TERCERO ');
           SQL.Add('           FROM EMP_CLIENTES ');
           SQL.Add('           WHERE ');
           SQL.Add('           EMPRESA = :EMPRESA AND ');
           SQL.Add('           CLIENTE = :CLIENTE) AND ');
           SQL.Add('ACTIVO = 1 ');
           SQL.Add('ORDER BY DIRECCION ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           ExecQuery;
           Poblacion := FieldByName['POBLACION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Result := ((Poblacion > '') and (Poblacion <> 'ZZZ'));
  end;

begin
  Result := True;

  // TODO Se comenta temporalmente hasta que corrijan la API de factronica para poder procesar con caracteres especiales
  {
  if (ContieneCaracteresNoPermitidos(QMCabeceraNOMBRE_COMERCIAL.AsString, '<>&''"')) then
  begin
     ShowMessage(_('El nombre del cliente contiene alguno de los caracteres no permitidos'));
     Result := False;
  end
  else
  }
  // Verificamos si el CAF esta vigente
  if CAFVencido(QMCabeceraEMPRESA.AsInteger, QMCabeceraCANAL.AsInteger, QMCabeceraTIPO_DOC_TRIBUTARIO.AsString) then
  begin
     ShowMessage(_('El CAF ha caducado o no se encuentra activo'));
     Result := False;
  end
  else
  if (Trim(REntorno.Tel1Empresa) = '') then
  begin
     ShowMessage(_('Debe asignar numero de telefono al tercero de la empresa'));
     Result := False;
  end
  else
  if ((QMCabeceraTITULO_GIRO_CLIENTE.AsString = '') or (QMCabeceraTITULO_GIRO_CLIENTE.AsString = 'NO ASIGNADO')) then
  begin
     ShowMessage(_('Debe asignar el giro del cliente'));
     Result := False;
  end
  else
  // Verificamos que no sea una guia electronica
  if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '52') then
  begin
     ShowMessage(_('El documento no puede ser una guia electrónica'));
     Result := False;
  end
  else
  // Verificamos si la comuna del cliente es valida
  // No se toma encuenta si el cliente es -1
  if (QMCabeceraCLIENTE.AsInteger <> -1) and (not ExisteComuna(QMCabeceraEMPRESA.AsInteger, QMCabeceraCLIENTE.AsInteger)) then
  begin
     ShowMessage(_('La comuna de la direccion del cliente no es valida'));
     Result := False;
  end
  else
  // Verificamos que la factura este cerrada
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     ShowMessage(_('El documento debe estar cerrado para poder ser enviado al SII'));
     Result := False;
  end
  else
  // Verificamos si la factura tiene numero de folio asignado
  if (QMCabeceraFOLIO.AsInteger <> 0) then
  begin
     ShowMessage(_('La factura ya tiene un numero de folio asigando'));
     Result := False;
  end
  else
  // Si la fatura o boleta es exenta verificamos que no lleve IVA
  // Solo si hay cuota de IVA
  if (xInfoActualizadaS_CUOTA_IVA.AsFloat <> 0) and ((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '34') or (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '41')) then
  begin
     ShowMessage(_('Un documento exento no deberia tener un importe de IVA'));
     Result := False;
  end
  else
  // Verificamos que el documento tenga referencia ??? Nota de credito y Nota de debito
  if ((QMSIIDteReferencia.RecordCount = 0) and ((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '56') or (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61'))) then
  begin
     ShowMessage(_('El documento debe tener asignada al menos una referencia'));
     Result := False;
  end
  else
  // Si es una Nota de credito y DTE de referencia es FE debe tener asignado el tipo de Referencia
  if ((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') and ((QMSIIDteReferenciaTPODOCREF.AsString = '33') or (QMSIIDteReferenciaTPODOCREF.AsString = '34')) and (QMSIIDteReferenciaCODREF.AsInteger = 0)) then
  begin
     ShowMessage(_('Se debe asignar un tipo de referencia '));
     Result := False;
  end
  else
  // Si es una Nota de credito y el tipo de referencia es para corregir Texto Documento
  if ((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') and ((QMSIIDteReferenciaTPODOCREF.AsString = '33') or (QMSIIDteReferenciaTPODOCREF.AsString = '34')) and (QMSIIDteReferenciaCODREF.AsInteger = 2)) then
  begin
     if (QMDetalle.RecordCount <> 1) then
     begin
        ShowMessage(_('El documento debe tener solo una linea de detalle conteniendo la modificacion del texto'));
        Result := False;
     end
     else
     if (QMDetalleARTICULO.AsString <> '.') then
     begin
        ShowMessage(_('El codigo de articulo para esta Nota de credito debe ser el Punto'));
        Result := False;
     end
     else
     if (QMDetalleUNIDADES.AsInteger <> -1) then
     begin
        ShowMessage(_('Las unidades para esta Nota de credito debe ser -1'));
        Result := False;
     end
     else
     if (QMDetallePRECIO.AsFloat <> 0) then
     begin
        ShowMessage(_('El precio para esta Nota de credito debe ser cero'));
        Result := False;
     end;
  end
  else
  begin
     if not xCliente.Active then
        xCliente.Open;

     if (((QMCabeceraCLIENTE.AsInteger = -1) and (Trim(QMNIFDIRECCION.AsString) = '')) or
        ((QMCabeceraCLIENTE.AsInteger > 0) and (Trim(xCliente.FieldByName('DIR_COMPLETA_N').AsString) = ''))) then
     begin
        ShowMessage(_('La dirección del cliente no puede ser vacia'));
        Result := False;
     end;

     xCliente.Close;
  end;
end;

procedure TDMFacturas.QMDetalleUNIDADES_SECChange(Sender: TField);
begin
  // Si calcula el peso segun las unidades secundarias
  if param_VENUSEC001 and (QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger = 1) then
     QMDetallePESO.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES_SEC.AsFloat
  else
     QMDetallePESO.AsFloat := xArticulos.FieldByName('PESO').AsFloat * xArticulos.FieldByName('FACTOR_UNIDAD').AsFloat;

  QMDetalleUNIDADESChange(Sender);
end;

procedure TDMFacturas.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMFacturas.LoaclizaFolio;
var
  Folio : integer;
begin
  Folio := 0;
  if PideDato('INT', Folio, _('Folio')) then
  begin
     if (Folio > 0) then
     begin
        Refrescar(QMCabecera, 'FOLIO', Folio);
     end;
  end;
end;

procedure TDMFacturas.ConectaProveedores;
begin
  xProveedores.Open;
end;

procedure TDMFacturas.DesconectaProveedores;
begin
  xProveedores.Close;
end;

procedure TDMFacturas.xProveedoresNewRecord(DataSet: TDataSet);
begin
  xProveedoresEMPRESA.AsInteger := QMDetalleEMPRESA.AsInteger;
  xProveedoresEJERCICIO.AsInteger := QMDetalleEJERCICIO.AsInteger;
  xProveedoresCANAL.AsInteger := QMDetalleCANAL.AsInteger;
  xProveedoresSERIE.AsString := QMDetalleSERIE.AsString;
  xProveedoresTIPO.AsString := QMDetalleTIPO.AsString;
  xProveedoresRIG.AsInteger := QMDetalleRIG.AsInteger;
  xProveedoresID_S.AsInteger := QMDetalleID_S.AsInteger;
  xProveedoresID_A.AsInteger := QMDetalleID_A.AsInteger;
  xProveedoresARTICULO.AsString := QMDetalleARTICULO.AsString;
end;

procedure TDMFacturas.xProveedoresAfterPost(DataSet: TDataSet);
begin
  if (xProveedoresUTILIZAR_COSTE.AsInteger = 1) then
  begin
     CierraAbreDet;
     InfoActualiza;
  end;
end;

procedure TDMFacturas.xProveedoresARTICULOChange(Sender: TField);
begin
  QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);
  xProveedoresNOMBRE_R_SOCIAL.AsString := DameTituloProveedor(xProveedoresPROVEEDOR.AsInteger);
  xProveedoresNOMBRE_COMERCIAL.AsString := DameNombreComercialProveedor(xProveedoresPROVEEDOR.AsInteger);
end;

procedure TDMFacturas.ImportacionFacturas(Serie: string);
var
  HCalc : THojaCalc;
  i : integer;
  //id_a, id_reg : integer;
  //Articulo, Lote, Titulo, UnidadesExcel, PrecioExcel : string;
  Archivo : string;
  HayError : boolean;
  //Unidades, Precio : double;
  SeparadorDecimal, s : string;
  FechaDocumento : TDateTime;
  NIF, RazonSocial, CodigoPostal, Direccion, TituloProvincia, SuReferencia : string;
  NumFactura : integer;
  BaseImponible : double;
  //LineaMemo : integer;
  IdS : integer;
  //WndList : Pointer;
  Log : TStrings;
  ArchivoLog : string;

  function ImportaFactura: integer;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_GENERA_DOC_VENTA_ESP(:ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, ');
           SQL.Add(' :SERIE, :TIPO, :RIG, :FECHA, :NIF, :BASE_IMPONIBLE, :TIPO_IVA, :RAZON_SOCIAL, :CODIGO_POSTAL, ');
           SQL.Add(' :DIRECCION, :TITULO_PROVINCIA, :SU_REFERENCIA) ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := NumFactura;
           Params.ByName['FECHA'].AsDateTime := FechaDocumento;
           Params.ByName['NIF'].AsString := NIF;
           Params.ByName['BASE_IMPONIBLE'].AsFloat := BaseImponible;
           Params.ByName['TIPO_IVA'].AsInteger := 1;
           Params.ByName['RAZON_SOCIAL'].AsString := RazonSocial;
           Params.ByName['CODIGO_POSTAL'].AsString := CodigoPostal;
           Params.ByName['DIRECCION'].AsString := Direccion;
           Params.ByName['TITULO_PROVINCIA'].AsString := TituloProvincia;
           Params.ByName['SU_REFERENCIA'].AsString := SuReferencia;
           ExecQuery;
           Result := FieldByName['ID_S'].AsInteger;
           Close;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  inherited;
  Log := TStringList.Create;
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Importando Documento ...'));

     SeparadorDecimal := ' ';
     Archivo := '';
     if MyOpenDialog(Archivo, 'XLS,ODS,TXT', '', 'DMFacturas-ImportacionFacturas') then
     begin
        try
           FSendCorreo.Show;
           FSendCorreo.Texto(_('Leyendo fichero ' + Archivo));

           //LineaMemo := 0;
           Log.Clear;

           HCalc := THojaCalc.Create(Archivo, False);
           try
              HCalc.ActivateSheetByIndex(1);
              FSendCorreo.MuestraBarraProgreso(HCalc.LastRow + 1);

              // La primera fila son los titulos, importamos a partir de la fila 2
              for i := 2 to HCalc.LastRow + 1 do
              begin
                 //HayError := False;
                 FSendCorreo.PBProgreso.Position := i;

                 NumFactura := 0;
                 FechaDocumento := EncodeDate(1900, 1, 1);
                 NIF := '';
                 BaseImponible := 0;
                 RazonSocial := '';
                 CodigoPostal := '';
                 Direccion := '';
                 TituloProvincia := '';
                 SuReferencia := '';

                 try
                    s := LimpiaCeldaExcel(HCalc.CellText[i, 1]);
                    if (s = '') then
                       HayError := True
                    else
                    begin
                       NumFactura := StrToInt(s);
                       HayError := (NumFactura = 0);
                    end
                 except
                    HayError := True;
                 end;
                 DMMain.Log(format(_('Numero actura = %d'), [NumFactura]));

                 if (not HayError) then
                 begin
                    // Obtenemos fecha de documento
                    s := '';
                    try
                       s := LimpiaCeldaExcel(HCalc.CellText[i, 3]);
                       FechaDocumento := StrToDate(s);
                    except
                       HayError := True;
                    end;
                 end;
                 DMMain.Log(format(_('Fecha Documento = %s'), [DateToStr(FechaDocumento)]));

                 if (not HayError) then
                 begin
                    // NIF
                    try
                       NIF := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 9]), 1, 20);

                       // Solo dejo letras y numeros
                       NIF := LimpiaNIF(REntorno.Pais, NIF);
                    except
                       NIF := '';
                    end;
                 end;
                 DMMain.Log(format(_('NIF = %s'), [NIF]));

                 if (not HayError) then
                 begin
                    // Base
                    s := LimpiaCadenaNumero(LimpiaCeldaExcel(HCalc.CellText[i, 10]));

                    if (SeparadorDecimal = ' ') and ((Pos(',', s) >= 0) or (Pos('.', s) >= 0)) then
                       PideDato('STR', SeparadorDecimal, format(_('Cuál es el separador Decimal en este numero? %s'), [s]));

                    try
                       DMMain.Log('StrToFloatDec(''' + s + ''', ''' + SeparadorDecimal + ''')');
                       BaseImponible := StrToFloatDec(s, SeparadorDecimal[1]);
                    except
                       DMMain.Log('ERROR CONVERSION : StrToFloatDec(''' + s + ''', ''' + SeparadorDecimal + ''')');
                       HayError := True;
                    end;
                 end;
                 DMMain.Log(format(_('Base Imponible = %.2f'), [BaseImponible]));

                 if (not HayError) then
                 begin
                    // RazonSocial
                    try
                       RazonSocial := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 4]), 1, 60);
                    except
                       RazonSocial := '';
                    end;
                 end;
                 DMMain.Log(format(_('Razon Social = %s'), [RazonSocial]));

                 if (not HayError) then
                 begin
                    // Codigo postal
                    try
                       CodigoPostal := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 7]), 1, 10);
                    except
                       CodigoPostal := '';
                    end;
                 end;
                 DMMain.Log(format(_('Codigo Postal = %s'), [CodigoPostal]));

                 if (not HayError) then
                 begin
                    // Direccion literal
                    try
                       Direccion := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 5]), 1, 228);
                    except
                       Direccion := '';
                    end;
                 end;
                 DMMain.Log(format(_('Direccion = %s'), [Direccion]));

                 if (not HayError) then
                 begin
                    // Titulo Provincia
                    try
                       TituloProvincia := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 8]), 1, 40);
                    except
                       TituloProvincia := '';
                    end;
                 end;
                 DMMain.Log(format(_('Provincia = %s'), [TituloProvincia]));

                 if (not HayError) then
                 begin
                    // Referencia
                    try
                       SuReferencia := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 2]), 1, 40);
                    except
                       SuReferencia := '';
                    end;
                 end;
                 DMMain.Log(format(_('Su Referencia = %s'), [SuReferencia]));

                 if (HayError) then
                 begin
                    Log.Add(format(_('*** Se han encontrado errores leyendo linea %d'), [i]));
                    Log.Add(format(_('    Numero Factura = %d'), [NumFactura]));
                    Log.Add(format(_('    Fecha Documento = %s'), [DateToStr(FechaDocumento)]));
                    Log.Add(format(_('    NIF = %s'), [NIF]));
                    Log.Add(format(_('    Base Imponible = %.2f'), [BaseImponible]));
                    Log.Add(format(_('    Razon Social = %s'), [RazonSocial]));
                    Log.Add(format(_('    Codigo Postal = %s'), [CodigoPostal]));
                    Log.Add(format(_('    Direccion = %s'), [Direccion]));
                    Log.Add(format(_('    Provincia = %s'), [TituloProvincia]));
                    Log.Add(format(_('    Su Referencia = %s'), [SuReferencia]));
                 end
                 else
                 begin
                    try
                       IdS := ImportaFactura;
                       if (IdS = 0) then
                          Log.Add(format(_('*** No se ha podido importar el documento %s - Linea: %d'), [SuReferencia, i]));
                    except
                       on E: Exception do
                          Log.Add(format(_('*** Fallo en la importacion - Linea: %d'), [i]) + E.message);
                    end;
                 end;
              end; {for}
           finally
              Sleep(1000);
              HCalc.Free;
           end;
        except
           on E: Exception do
              Log.Add(_('Fallo en la importacion - ' + E.message));
        end;

        FSendCorreo.Texto(_('Proceso terminado'));
        FSendCorreo.BitBtnOk.Visible := True;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;

        if (Log.Count > 0) then
        begin
           ArchivoLog := DameTempPath + format('ImportacionFacturas-%s.txt', [FormatDateTime('yyyymmdd_hhnnss', Now)]);
           Log.SaveToFile(ArchivoLog);
           DMMain.AbrirArchivo(ArchivoLog);
        end;
     end;
  finally
     Log.Free;
     // Se libera solo en OnClose
     // FreeAndNil(FSendCorreo);
  end;

  Refrescar(QMCabecera, 'ID_S', 0);
end;

procedure TDMFacturas.ImportacionFacturas2(Serie: string);
var
  HCalc : THojaCalc;
  i : integer;
  //id_a, id_reg : integer;
  //Articulo : string;
  //Lote, Titulo, UnidadesExcel, PrecioExcel : string;
  Archivo : string;
  Matricula, Marca : string;
  HayError : boolean;
  //Unidades, Precio : double;
  SeparadorDecimal, s : string;
  FechaDocumento : TDateTime;
  NIF, RazonSocial, CodigoPostal, Direccion, TituloProvincia, SuReferencia : string;
  NumFactura : integer;
  BaseImponible, BaseExenta : double;
  //LineaMemo : integer;
  IdS : integer;
  //WndList : Pointer;
  Log : TStrings;
  ArchivoLog : string;

  function ImportaFactura: integer;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_GENERA_DOC_VENTA_ESP(:ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, ');
           SQL.Add(' :SERIE, :TIPO, :RIG, :FECHA, :NIF, :BASE_IMPONIBLE, :TIPO_IVA, :RAZON_SOCIAL, :CODIGO_POSTAL, ');
           SQL.Add(' :DIRECCION, :TITULO_PROVINCIA, :SU_REFERENCIA) ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := NumFactura;
           Params.ByName['FECHA'].AsDateTime := FechaDocumento;
           Params.ByName['NIF'].AsString := NIF;
           Params.ByName['BASE_IMPONIBLE'].AsFloat := BaseImponible;
           Params.ByName['TIPO_IVA'].AsInteger := 1;
           Params.ByName['RAZON_SOCIAL'].AsString := RazonSocial;
           Params.ByName['CODIGO_POSTAL'].AsString := CodigoPostal;
           Params.ByName['DIRECCION'].AsString := Direccion;
           Params.ByName['TITULO_PROVINCIA'].AsString := TituloProvincia;
           Params.ByName['SU_REFERENCIA'].AsString := SuReferencia;
           ExecQuery;
           Result := FieldByName['ID_S'].AsInteger;
           Close;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  inherited;
  // Facturas de VCVAUTO-Valencia
  Log := TStringList.Create;
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Importando Documento ...'));

     SeparadorDecimal := ' ';
     Archivo := '';
     if MyOpenDialog(Archivo, 'XLS,ODS,TXT', '', 'DMFacturas-ImportacionFacturas') then
     begin
        try
           FSendCorreo.Show;
           FSendCorreo.Texto(_('Leyendo fichero ' + Archivo));

           //LineaMemo := 0;
           Log.Clear;

           HCalc := THojaCalc.Create(Archivo, False);
           try
              HCalc.ActivateSheetByIndex(1);
              FSendCorreo.MuestraBarraProgreso(HCalc.LastRow + 1);

              // La primera fila son los titulos, importamos a partir de la fila 2
              for i := 2 to HCalc.LastRow + 1 do
              begin
                 HayError := False;
                 FSendCorreo.PBProgreso.Position := i;

                 // Las lineas a importar tienen una primera columna que dice FACTURAS
                 // DMMain.Log(format(_('CellText(%d, %d) = %s'), [i, 1, HCalc.CellText[i, 1]]));
                 if (Trim(LimpiaCeldaExcel(HCalc.CellText[i, 1])) = 'FACTURAS') then
                 begin
                    NumFactura := 0;
                    FechaDocumento := EncodeDate(1900, 1, 1);
                    NIF := '';
                    BaseImponible := 0;
                    BaseExenta := 0;
                    RazonSocial := '';
                    CodigoPostal := '46001';
                    Direccion := '';
                    TituloProvincia := 'VALENCIA';
                    SuReferencia := '';
                    Matricula := '';
                    Marca := '';

                    s := LimpiaCeldaExcel(HCalc.CellText[i, 2]);
                    DMMain.Log(format(_('CellText(%d, %d) = %s --> %s'), [i, 2, s, DateTimeToStr(StrExcelToDateTime(s))]));

                    if (not HayError) then
                    begin
                       // Obtenemos fecha de documento
                       s := '';
                       try
                          s := LimpiaCeldaExcel(HCalc.CellText[i, 2]);
                          FechaDocumento := StrExcelToDateTime(s);
                       except
                          //HayError := True;
                       end;
                    end;
                    DMMain.Log(format(_('Fecha Documento = %s - Excel(%s)'), [DateToStr(FechaDocumento), s]));

                    try
                       s := LimpiaCeldaExcel(HCalc.CellText[i, 3]);
                       if (s = '') then
                          HayError := True
                       else
                       begin
                          NumFactura := StrToInt(s);
                          HayError := (NumFactura = 0);
                       end
                    except
                       HayError := True;
                    end;
                    DMMain.Log(format(_('Numero actura = %d'), [NumFactura]));

                   { Tomare matricula + marca como referencia
                   if (not HayError) then
                   begin
                      // Referencia - Numero de Orden
                      try
                         SuReferencia := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 5]), 1, 40);
                      except
                         SuReferencia := '';
                      end;
                   end;
                   DMMain.Log(format(_('Su Referencia = %s'), [SuReferencia]));
                   }

                    if (not HayError) then
                    begin
                       // Matricula
                       try
                          Matricula := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 9]), 1, 40);
                       except
                          Matricula := '';
                       end;
                    end;
                    DMMain.Log(format(_('Matricula = %s'), [Matricula]));

                    if (not HayError) then
                    begin
                       // Marca
                       try
                          Marca := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 10]), 1, 40);
                       except
                          Marca := '';
                       end;
                    end;
                    DMMain.Log(format(_('Marca = %s'), [Marca]));

                    SuReferencia := Copy(Matricula + ' - ' + Marca, 1, 40);

                    // 11 - Cliente - Codigo

                    if (not HayError) then
                    begin
                       // RazonSocial
                       try
                          RazonSocial := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 12]), 1, 60);
                       except
                          RazonSocial := '';
                       end;
                    end;
                    DMMain.Log(format(_('Razon Social = %s'), [RazonSocial]));

                    if (not HayError) then
                    begin
                       // NIF
                       try
                          NIF := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 13]), 1, 20);

                          // Solo dejo letras y numeros
                          NIF := LimpiaNIF(REntorno.Pais, NIF);
                       except
                          NIF := '';
                       end;
                    end;
                    DMMain.Log(format(_('NIF = %s'), [NIF]));

                    // 14 - Tipo Cliente
                    // 15 - Cliente Pagador - Codigo
                    // 16 - Cliente Pagador - Nombre
                    // 17 - G. Cliente Pagador
                    // 18 - Propietario - Codigo
                    // 19 - Nombre Propietario
                    // 20 - Grupo Propietario
                    // 21 - Apertura Orden Trabajo
                    // 22 - Apertura Orden Trabajo
                    // 23 - 36 - Totales Desglosados

                    if (not HayError) then
                    begin
                       // 37 - Base Imponible
                       s := LimpiaCadenaNumero(LimpiaCeldaExcel(HCalc.CellText[i, 37]));

                       if (SeparadorDecimal = ' ') and ((Pos(',', s) >= 0) or (Pos('.', s) >= 0)) then
                          PideDato('STR', SeparadorDecimal, format(_('Cuál es el separador Decimal en este numero? %s'), [s]));

                       try
                          DMMain.Log('StrToFloatDec(''' + s + ''', ''' + SeparadorDecimal + ''')');
                          BaseImponible := StrToFloatDec(s, SeparadorDecimal[1]);
                       except
                          DMMain.Log('ERROR CONVERSION : StrToFloatDec(''' + s + ''', ''' + SeparadorDecimal + ''')');
                          HayError := True;
                       end;
                    end;
                    DMMain.Log(format(_('Base Imponible = %.2f - Excel(%s)'), [BaseImponible, HCalc.CellText[i, 37]]));

                    if (not HayError) then
                    begin
                       // 38 - Base Exenta
                       s := LimpiaCadenaNumero(LimpiaCeldaExcel(HCalc.CellText[i, 38]));

                       if (SeparadorDecimal = ' ') and ((Pos(',', s) >= 0) or (Pos('.', s) >= 0)) then
                          PideDato('STR', SeparadorDecimal, format(_('Cuál es el separador Decimal en este numero? %s'), [s]));

                       try
                          DMMain.Log('StrToFloatDec(''' + s + ''', ''' + SeparadorDecimal + ''')');
                          BaseExenta := StrToFloatDec(s, SeparadorDecimal[1]);
                       except
                          DMMain.Log('ERROR CONVERSION : StrToFloatDec(''' + s + ''', ''' + SeparadorDecimal + ''')');
                          HayError := True;
                       end;
                    end;
                    DMMain.Log(format(_('Base Exenta = %.2f - Excel(%s)'), [BaseExenta, HCalc.CellText[i, 37]]));

                    // 39 - Impuestos
                    // 40 - Importe Total
                    // 41 - Mecanica
                    // 42 - Franquicia en Factura
                    // 43 - Tipo de Operacion
                    // 44 - Centro de Trabajo
                    // 45 - Forma de Pago
                    // 46 - Recepcionista
                    // 47 - Perito
                    // 48 - Vehiculo Sustitucion

                   {
                   if (not HayError) then
                   begin
                      // Codigo postal
                      try
                         CodigoPostal := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 7]), 1, 10);
                      except
                         CodigoPostal := '';
                      end;
                   end;
                   DMMain.Log(format(_('Codigo Postal = %s'), [CodigoPostal]));
                   }

                   {
                   if (not HayError) then
                   begin
                      // Direccion literal
                      try
                         Direccion := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 5]), 1, 228);
                      except
                         Direccion := '';
                      end;
                   end;
                   DMMain.Log(format(_('Direccion = %s'), [Direccion]));
                   }

                   {
                   if (not HayError) then
                   begin
                      // Titulo Provincia
                      try
                         TituloProvincia := Copy(LimpiaCeldaExcel(HCalc.CellText[i, 8]), 1, 40);
                      except
                         TituloProvincia := '';
                      end;
                   end;
                   DMMain.Log(format(_('Provincia = %s'), [TituloProvincia]));
                   }

                    if (HayError) then
                    begin
                       Log.Add(format(_('*** Se han encontrado errores leyendo linea %d'), [i]));
                       Log.Add(format(_('    Numero Factura = %d'), [NumFactura]));
                       Log.Add(format(_('    Fecha Documento = %s'), [DateToStr(FechaDocumento)]));
                       Log.Add(format(_('    Su Referencia = %s'), [SuReferencia]));
                       Log.Add(format(_('    NIF = %s'), [NIF]));
                       Log.Add(format(_('    Razon Social = %s'), [RazonSocial]));
                       Log.Add(format(_('    Base Imponible = %.2f'), [BaseImponible]));
                       Log.Add(format(_('    Base Exenta = %.2f'), [BaseExenta]));
                      {
                      Log.Add(format(_('    Codigo Postal = %s'), [CodigoPostal]));
                      Log.Add(format(_('    Direccion = %s'), [Direccion]));
                      Log.Add(format(_('    Provincia = %s'), [TituloProvincia]));
                      }
                    end
                    else
                    begin
                       try
                          IdS := ImportaFactura;
                          if (IdS = 0) then
                             Log.Add(format(_('*** No se ha podido importar el documento %s - Linea: %d'), [SuReferencia, i]));
                       except
                          on E: Exception do
                             Log.Add(format(_('*** Fallo en la importacion - Linea: %d'), [i]) + E.message);
                       end;
                    end;
                 end;
              end; {for}
           finally
              Sleep(1000);
              HCalc.Free;
           end;
        except
           on E: Exception do
              Log.Add(_('Fallo en la importacion - ' + E.message));
        end;

        FSendCorreo.Texto(_('Proceso terminado'));
        FSendCorreo.BitBtnOk.Visible := True;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;

        if (Log.Count > 0) then
        begin
           ArchivoLog := ChangefileExt(Archivo, format('_%s.log', [FormatDateTime('yyyymmdd_hhnnss', Now)]));
           Log.SaveToFile(ArchivoLog);
           DMMain.AbrirArchivo(ArchivoLog);
        end;
     end;
  finally
     Log.Free;
     // Se libera solo en OnClose
     // FreeAndNil(FSendCorreo);
  end;

  Refrescar(QMCabecera, 'ID_S', 0);
end;

procedure TDMFacturas.EnviaDocumentoFactoring(Proveedor: integer);
begin
  AbreData(TDMFactoringChl, DMFactoringChl);
  DMFactoringChl.EnviaDocumentoFactoring(Proveedor, QMCabeceraID_S.AsInteger);
  CierraData(DMFactoringChl);
end;

function TDMFacturas.DocumentoAECValido: boolean;
begin
  Result := True;
  // Verifica si la fecha de vencimiento es mayor a la del documento
  if ((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '33') and (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '34')) then
  begin
     ShowMessage(_('La cesion solo se permite para facturas.'));
     Result := False;
  end
  else
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     ShowMessage(_('La factura debe estar cerrada.'));
     Result := False;
  end
  else
  if (QMCabeceraFOLIO.AsInteger <= 0) then
  begin
     ShowMessage(_('La factura debe haber sido enviada al SII y tener un Folio asignado.'));
     Result := False;
  end
  else
  // Verifica si la fecha de vencimiento es mayor a la del documento
  if (RecodeTime(QMCabeceraVENCIMIENTO.AsDateTime, 0, 0, 0, 0) <= RecodeTime(QMCabeceraFECHA.AsDateTime, 0, 0, 0, 0)) then
  begin
     ShowMessage(_('La fecha de vencimiento no puede ser menor o igual a la fecha del documento.'));
     Result := False;
  end
  else
  // Verifica que la forma de pago del DTE no sea al contado
  if (QMCabeceraSII_FMA_PAGO.AsInteger <> 2) then
  begin
     ShowMessage(_('La Forma de pago del DTE no puede ser al contado'));
     Result := False;
  end;
end;

function TDMFacturas.DocumentoEcfValido: boolean;
var
  Activo : boolean;
  Valido : boolean;
  MensajeError : string;

  function VerificaAsignacionItbis: boolean;
  begin
     // Verifica Si el porcentaje del Tipo de IVA es igual al Porcentaje de la linea
     // Esto fallará si el Modo de IVA es 5 (Extranjero)

     Result := True;

     with QMDetalle do
     begin
        DisableControls;
        try
           First;
           while ((not EOF) and (Result)) do
           begin
              if (DMMain.DamePorcentajeIva(REntorno.Pais, QMDetalleTIPO_IVA.AsInteger) <> QMDetalleP_IVA.AsInteger) then
                 Result := False;

              Next;
           end;

           First;
        finally
           EnableControls;
        end;
     end;
  end;

begin
  Activo := xFacturaDGII.Active;

  xFacturaDGII.Close;
  if not Activo then
     xFacturaDGII.Open;

  //Result := False;
  if ((QMCabeceraZ_TIPO_NCF.AsInteger <> 31) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 32) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 34) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 44) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 45)) then
  begin
     ShowMessage(_('Solo se acepta envios de documentos tipo 31, 32, 34, 44, 45'));
     //Result := False;
  end
  else
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     ShowMessage(_('El documento debe estar cerrado para ser enviado al DGII'));
     //Result := False;
  end
  else
  if ((Trim(QMCabeceraZ_PREFIJO_NCF.AsString) = '') or (Trim(QMCabeceraZ_CONTADOR_NCF.AsString) = '') or (QMCabeceraZ_TIPO_NCF.AsInteger = 0)) then
  begin
     ShowMessage(_('El documento debe tener asignado la secuencia ECF y el tipo CF'));
     //Result := False;
  end
  else
  if (not VerificaAsignacionItbis) then
  begin
     ShowMessage(_('El porcentaje de ITBIS no corresponde al tipo ITBIS - Verifique que el cliente no sea excento de ITBIS'));
     //Result := False;
  end
  else
  if (xFacturaDGII.RecordCount > 0) then
  begin
     ShowMessage(_('Ya existe un registro de envio para este documento'));
     //Result := False;
  end
  else
  {
  if ((QMCabeceraZ_TIPO_NCF.AsInteger = 34) and (Trim(QMDGIIReferenciasENCF_REF.AsString) = '')) then
     ShowMessage(_('El documento debe tener el ENCF de referencia asignado'))
  else
  }
  if ((xCliente.FieldByName('CLIENTE').AsInteger = -1) and (QMNIFNIF.AsString <> '')) then
  begin
     if (QMNIFPAIS_DOC_IDENT.AsString = 'DOM') and ((QMNIFTIPO_DOC_IDENT.AsString = 'RNC') or (QMNIFTIPO_DOC_IDENT.AsString = 'DNI')) and (Length(QMNIFNIF.AsString) <> 11) then
     begin
        ShowMessage(_('El RNC deberia tener hasta a 11 caracteres'));
        //Result := False;
     end
     else if (QMNIFPAIS_DOC_IDENT.AsString <> 'DOM') and (QMNIFTIPO_DOC_IDENT.AsString = 'PAS') and (Length(QMNIFNIF.AsString) <> 20) then
     begin
        ShowMessage(_('El Pasaporte deberia tener hasta 20 caracteres'));
        //Result := False;
     end
     else if ((QMNIFPAIS_DOC_IDENT.AsString = 'DOM') and ((QMNIFTIPO_DOC_IDENT.AsString <> 'RNC') and (QMNIFTIPO_DOC_IDENT.AsString <> 'DNI'))) then
     begin
        ShowMessage(_('El tipo de documento para un cliente dominicano deberia ser de tipo DNI o RNC'));
        //Result := False;
     end
     else if ((QMNIFPAIS_DOC_IDENT.AsString <> 'DOM') and (QMNIFTIPO_DOC_IDENT.AsString <> 'PAS')) then
     begin
        ShowMessage(_('El tipo de documento para un cliente extranjero deberia ser de tipo Pasaporte'));
        //Result := False;
     end
     else;
     //Result := True;
  end
  else
  if ((xCliente.FieldByName('CLIENTE').AsInteger > 0) and (xCliente.FieldByName('NIF').AsString <> '')) then
  begin
     if (xCliente.FieldByName('PAIS_TERCERO').AsString = 'DOM') and (xCliente.FieldByName('TIPO_DOC_IDENT').AsString = 'DNI') and (Length(xCliente.FieldByName('NIF').AsString) <> 11) then
     begin
        ShowMessage(_('El RNC deberia tener hasta 11 caracteres'));
        //Result := False;
     end
     else if (xCliente.FieldByName('PAIS_TERCERO').AsString <> 'DOM') and (xCliente.FieldByName('TIPO_DOC_IDENT').AsString = 'PAS') and (Length(xCliente.FieldByName('NIF').AsString) <> 20) then
     begin
        ShowMessage(_('El Pasaporte deberia tener hasta 20 caracteres'));
        //Result := False;
     end
     else if ((xCliente.FieldByName('PAIS_TERCERO').AsString = 'DOM') and ((xCliente.FieldByName('TIPO_DOC_IDENT').AsString <> 'RNC') and (xCliente.FieldByName('TIPO_DOC_IDENT').AsString <> 'DNI'))) then
     begin
        ShowMessage(_('El tipo de documento para un cliente dominicano deberia ser de tipo DNI o RNC'));
        //Result := False;
     end
     else if ((xCliente.FieldByName('PAIS_TERCERO').AsString <> 'DOM') and (xCliente.FieldByName('TIPO_DOC_IDENT').AsString <> 'PAS')) then
     begin
        ShowMessage(_('El tipo de documento para un cliente extranjero deberia ser de tipo Pasaporte'));
        //Result := False;
     end
     else;
     //Result := True;
  end;

  if (((xCliente.FieldByName('CLIENTE').AsInteger = -1) and (QMNIFNIF.AsString = '')) or ((xCliente.FieldByName('CLIENTE').AsInteger > 0) and (xCliente.FieldByName('NIF').AsString = ''))) then
  begin
     if ((QMCabeceraZ_TIPO_NCF.AsInteger = 32) and (QMCabeceraLIQUIDO.AsFloat >= 250000)) then
     begin
        ShowMessage(_('Cuando el total es igual o mayor a 250,000 el documento debe tener un RNC o pasaporte asignado'));
        Result := False;
     end
     else
        Result := True;
  end
  else
  if (QMCabeceraTIPO_INGRESOS.AsInteger = 0) then
  begin
     ShowMessage(_('El documento debe tener el Tipo de Ingreso asignado'));
     Result := False;
  end
  else
  begin
     DMMain.VerificaDocumentoIdentificacion(xCliente.FieldByName('PAIS_TERCERO').AsString, xCliente.FieldByName('TIPO_DOC_IDENT').AsString, xCliente.FieldByName('NIF').AsString, Valido, MensajeError);
     if not Valido then
     begin
        ShowMessage(_('El Cliente no tiene un RNC correcto') + #13#10 + MensajeError + #13#10 + QMCabeceraNIF.AsString);
        Result := False;
     end
     else
        Result := True;
  end;

  if Activo then
     xFacturaDGII.Open;
end;

procedure TDMFacturas.MultiplicaPrecios(Factor: double);
var
  id : integer;
begin
  DMMain.LogIni('DMFacturas.MultiplicaPrecios');

  id := QMDetalleID_DETALLES_S.AsInteger;
  with QMDetalle do
  begin
     DisableControls;
     try
        First;
        while (not EOF) do
        begin
           Edit;
           QMDetallePRECIO.AsFloat := QMDetallePRECIO.AsFloat * Factor;
           Post;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMDetalle, 'ID_DETALLES_S', id);

  DMMain.LogFin('');
end;

procedure TDMFacturas.Anular;
begin
  // Anula factura
  // En el caso de España, generará un registro de anulacion Verifactu
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_S SET ESTADO = :ESTADO WHERE ID_S = :ID_S AND ESTADO <> :ESTADO';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['ESTADO'].AsInteger := 2;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturas.AnulaDocumento;
begin
  // DMMain.Log('TDMFacturas.AnulaDocumento');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_ANULA_DOCUMENTO_S (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMFacturas.ResumeDocumento;
begin
  /// Agrupa lineas con el mismo articulo (y mismas condiciones) en una sola linea - KOMBATPADEL
  // DMMain.Log('TDMFacturas.ResumeDocumento');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_RESUME_FACTURA (:ID_S)';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

function TDMFacturas.ExiteDocumentoReferido(TiporDocTributario: string): boolean;
begin
  //Result := False;
  // Verificamos si tiene un documento refereido
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT COUNT(ID_S) EXISTE ');
        SQL.Add('FROM GES_CABECERAS_S_FAC ');
        SQL.Add('WHERE ');
        SQL.Add('ID_S = (SELECT FIRST 1 ID_S ');
        SQL.Add('        FROM SII_DTE_REFERENCIA ');
        SQL.Add('        WHERE ');
        SQL.Add('        ID_S_REF = :ID_S_ORIGEN) AND ');
        SQL.Add('TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');
        Params.ByName['ID_S_ORIGEN'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TiporDocTributario;
        ExecQuery;
        Result := (FieldByName['EXISTE'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
