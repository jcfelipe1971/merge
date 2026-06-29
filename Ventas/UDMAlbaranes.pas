unit UDMAlbaranes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, Math, FIBDataSetRO, HYFIBQuery;

type
  TDMAlbaranes = class(TDataModule)
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
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraTRANSPORTISTA: TIntegerField;
     QMCabeceraI_BASE_RETENCION: TFloatField;
     QMCabeceraP_RETENCION: TFloatField;
     QMCabeceraI_RETENCION: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMDetalleENTRADA: TIntegerField;
     EntornoDoc: TEntornoFind2000;
     QMDetalleCANAL: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraTITULO: TFIBStringField;
     xFormasPago: TFIBDataSetRO;
     DSxFormasPago: TDataSource;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraCAMPANYA: TIntegerField;
     QMCabeceraTIPO_IRPF: TIntegerField;
     QMCabeceraA_IRPF: TIntegerField;
     QMCabeceraTOTAL_A_COBRAR: TFloatField;
     QMCabeceraAPLICA_IRPF: TStringField;
     TLocal: THYTransaction;
     QMDetalleNOTAS: TBlobField;
     QSPProcedencia: TFIBDataSetRO;
     DSQSPProcedencia: TDataSource;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     SPRefrescaDetalle: THYFIBQuery;
     QMDetalleUNIDADES_EXT: TFloatField;
     xArticulos: TFIBDataSetRO;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMDetalleNSERIE: TFIBStringField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     xInfoActualizadaBULTOS: TIntegerField;
     xInfoActualizadaS_BASES: TFloatField;
     xInfoActualizadaS_CUOTA_IVA: TFloatField;
     xInfoActualizadaS_CUOTA_RE: TFloatField;
     xInfoActualizadaLIQUIDO: TFloatField;
     xInfoActualizadaTOTAL_A_COBRAR: TFloatField;
     xInfoActualizadaI_BASE_RETENCION: TFloatField;
     xInfoActualizadaI_RETENCION: TFloatField;
     xInfoActualizadaB_COMISION: TFloatField;
     xInfoActualizadaI_COMISION: TFloatField;
     xInfoActualizadaI_FINANCIACION: TFloatField;
     xInfoActualizadaB_DTO_LINEAS: TFloatField;
     xInfoActualizadaI_DTO_LINEAS: TFloatField;
     xInfoActualizadaESTADO: TIntegerField;
     SPCambiaMoneda: THYFIBQuery;
     QMCabeceraTOTAL_CANAL: TFloatField;
     QMCabeceraTARIFA: TFIBStringField;
     QMDetalleUNIDADES_SEC: TFloatField;
     xTipoIRPF: TFIBDataSetRO;
     DSxTipoIRPF: TDataSource;
     QMCabeceraID_S: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraBULTOS_KRI: TIntegerField;
     QMDetalleNO_FABRICACION_KRI: TFIBStringField;
     QMCabeceraGARANTIA: TIntegerField;
     QMDetalleUNIDADES_FACTURADAS: TFloatField;
     QMDetalleLINEA_SERVIDA: TIntegerField;
     QMDetalleCAJA_EDI: TIntegerField;
     QMDetalleTIPO_CAJA_EDI: TFIBStringField;
     QMCabeceraAGRUPACION_KRI: TIntegerField;
     QMCabeceraEDI: TFIBTableSet;
     DSQMCabeceraEDI: TDataSource;
     QMCabeceraEDIEMPRESA: TIntegerField;
     QMCabeceraEDIEJERCICIO: TIntegerField;
     QMCabeceraEDICANAL: TIntegerField;
     QMCabeceraEDISERIE: TFIBStringField;
     QMCabeceraEDITIPO: TFIBStringField;
     QMCabeceraEDIRIG: TIntegerField;
     QMCabeceraEDIIDCAB: TFIBStringField;
     QMCabeceraEDINUMDES: TFIBStringField;
     QMCabeceraEDITIPOA: TFIBStringField;
     QMCabeceraEDIFUNCION: TFIBStringField;
     QMCabeceraEDIFECDES: TDateTimeField;
     QMCabeceraEDIFECENT: TDateTimeField;
     QMCabeceraEDIFECENTSO: TDateTimeField;
     QMCabeceraEDIFECPANT: TDateTimeField;
     QMCabeceraEDIFECPDES: TDateTimeField;
     QMCabeceraEDICONESP: TFIBStringField;
     QMCabeceraEDINUMALB: TFIBStringField;
     QMCabeceraEDIFECALB: TDateTimeField;
     QMCabeceraEDINUMPED: TFIBStringField;
     QMCabeceraEDIFECPED: TDateTimeField;
     QMCabeceraEDINUMPICK: TFIBStringField;
     QMCabeceraEDIFECPICK: TDateTimeField;
     QMCabeceraEDIORIGEN: TFIBStringField;
     QMCabeceraEDIDESTINO: TFIBStringField;
     QMCabeceraEDIPROVEEDOR: TFIBStringField;
     QMCabeceraEDICOMPRADOR: TFIBStringField;
     QMCabeceraEDIDPTO: TFIBStringField;
     QMCabeceraEDIRECEPTOR: TFIBStringField;
     QMCabeceraEDIMUELLE: TFIBStringField;
     QMCabeceraEDIPUNTENV: TFIBStringField;
     QMCabeceraEDIEXPEDIDOR: TFIBStringField;
     QMCabeceraEDIULTCONS: TFIBStringField;
     QMCabeceraEDIENTREGA: TFIBStringField;
     QMCabeceraEDIREPOS: TFIBStringField;
     QMCabeceraEDIPORTES: TFIBStringField;
     QMCabeceraEDIRECOGIDA: TFIBStringField;
     QMCabeceraEDITIPTRANS: TFIBStringField;
     QMCabeceraEDIIDTRANS: TFIBStringField;
     QMCabeceraEDIMATRIC: TFIBStringField;
     QMCabeceraEDITOTQTY: TFloatField;
     QMCabeceraEDIIDENTIF: TFIBStringField;
     QMCabeceraEDICONSIG: TFIBStringField;
     QMCabeceraEDICIP: TFIBStringField;
     QMCabeceraEDIFECENVIO: TDateTimeField;
     xInfoActualizadaSUM_UNIDADES: TFloatField;
     QMCartaPortes: TFIBTableSet;
     QMCartaPortesEMPRESA: TIntegerField;
     QMCartaPortesEJERCICIO: TIntegerField;
     QMCartaPortesCANAL: TIntegerField;
     QMCartaPortesSERIE: TFIBStringField;
     QMCartaPortesTIPO: TFIBStringField;
     QMCartaPortesRIG: TIntegerField;
     QMCartaPortesID_S: TIntegerField;
     QMCartaPortesCARGADORA: TIntegerField;
     QMCartaPortesDIR_CARGADORA: TIntegerField;
     QMCartaPortesEXPEDIDORA: TIntegerField;
     QMCartaPortesDIR_EXPEDIDORA: TIntegerField;
     QMCartaPortesINTERMEDIARIA: TIntegerField;
     QMCartaPortesDIR_INTERMEDIARIA: TIntegerField;
     QMCartaPortesTRANSPORTISTA: TIntegerField;
     QMCartaPortesDIR_TRANSPORTISTA: TIntegerField;
     QMCartaPortesDESTINATARIO: TIntegerField;
     QMCartaPortesDIR_DESTINATARIO: TIntegerField;
     QMCartaPortesBULTOS: TFloatField;
     QMCartaPortesPESO: TFloatField;
     QMCartaPortesORIGEN: TIntegerField;
     QMCartaPortesDESTINO: TIntegerField;
     QMCartaPortesFECHA_TRANSPORTE: TDateTimeField;
     QMCartaPortesNOTAS: TBlobField;
     DSCartaPortes: TDataSource;
     QMNaturaleza: TFIBTableSet;
     QMNaturalezaEMPRESA: TIntegerField;
     QMNaturalezaEJERCICIO: TIntegerField;
     QMNaturalezaCANAL: TIntegerField;
     QMNaturalezaSERIE: TFIBStringField;
     QMNaturalezaTIPO: TFIBStringField;
     QMNaturalezaRIG: TIntegerField;
     QMNaturalezaID_S: TIntegerField;
     QMNaturalezaNATURALEZA: TIntegerField;
     QMNaturalezaTITULO: TFIBStringField;
     DSQMNaturaleza: TDataSource;
     QMMatriculas: TFIBTableSet;
     QMMatriculasEMPRESA: TIntegerField;
     QMMatriculasEJERCICIO: TIntegerField;
     QMMatriculasCANAL: TIntegerField;
     QMMatriculasSERIE: TFIBStringField;
     QMMatriculasTIPO: TFIBStringField;
     QMMatriculasRIG: TIntegerField;
     QMMatriculasID_S: TIntegerField;
     QMMatriculasMATRICULA: TFIBStringField;
     QMMatriculasTITULO: TFIBStringField;
     QMMatriculasTRANSPORTISTA: TIntegerField;
     QMMatriculasTITULO_TRANS: TFIBStringField;
     DSQMMatriculas: TDataSource;
     xTransportistaCarta: TFIBDataSetRO;
     xTransportistaCartaTITULO: TFIBStringField;
     xTransportistaCartaTERCERO: TIntegerField;
     xOrigen: TFIBDataSetRO;
     xOrigenTITULO: TFIBStringField;
     DSxOrigen: TDataSource;
     QTituloNaturaleza: THYFIBQuery;
     QTituloMatricula: THYFIBQuery;
     QMDetalleCOMISION_LINEAL: TFloatField;
     QMDetalleI_COMISION_LINEAL: TFloatField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMCabeceraALMACEN_DEPOSITO: TFIBStringField;
     QMCabeceraNUM_MOV_DEPOSITO: TIntegerField;
     QMCabeceraDEPOSITO: TIntegerField;
     QMCabeceraDEVOLUCION_DEPOSITO: TIntegerField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMDetalleTITULO_IDIOMA: TFIBStringField;
     QMNIF: TFIBTableSet;
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
     QMNIFNOMBRE: TFIBStringField;
     QMNIFPAIS: TFIBStringField;
     DSQMNIF: TDataSource;
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
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMCabeceraPROYECTO: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetalleLINEA_RELACION: TIntegerField;
     TUpdate: THYTransaction;
     QMCabeceraCONTACTO: TIntegerField;
     QMCabeceraNOTAS_INTERNAS_KRI: TBlobField;
     QMCabeceraTIPO_LINEA_KRI: TIntegerField;
     QMDetalleTIPO_LINEA_KRI: TIntegerField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMNIFID_S: TIntegerField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMCartaPortesPALETS: TFloatField;
     QMDetalleLOTE: TFIBStringField;
     QMDetalleID_UBICACION: TIntegerField;
     QMDetalleID_A_UBICACION: TIntegerField;
     QMDetalleUNIDADES_UB: TFloatField;
     QMDetalleALMACEN_UB: TFIBStringField;
     QMDetalleCALLE: TFIBStringField;
     QMDetalleESTANTERIA: TFIBStringField;
     QMDetalleREPISA: TFIBStringField;
     QMDetallePOSICION: TFIBStringField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleCOMPOSICION: TFIBStringField;
     QMCartaPortesPESO_BRUTO: TFloatField;
     QMCartaPortesUNIDADES_LOGISTICAS: TFloatField;
     QMNIFCOLONIA: TFIBStringField;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     QMDetalleLOTE_SIMPLE: TFIBStringField;
     QMDetalleDIRECCION_ENTREGA: TIntegerField;
     QMCabeceraALBARAN_VALORADO: TIntegerField;
     QMCartaPortesVOLUMEN: TFloatField;
     QMDetalleCOSTE_ADICIONAL: TFloatField;
     QMDetalleCODIGO_CLIENTE: TStringField;
     QMDetalleTITULO_CLIENTE: TStringField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMDetalleTOTAL_UNIDADES_EXT: TFloatField;
     QMDetalleLOTEABLE: TIntegerField;
     QMCabeceraFECHA_SERVIDO: TDateTimeField;
     QMCabeceraPEDIDO_CLIENTE: TFIBStringField;
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
     QMCabeceraDOCUMENTO_MUESTRAS: TIntegerField;
     QMCabeceraTOTAL_ANTICIPADO: TFloatField;
     xInfoActualizadaTOTAL_ANTICIPADO: TFloatField;
     QMCabeceraFACTURABLE: TIntegerField;
     QMCabeceraMARGEN: TFloatField;
     xInfoActualizadaMARGEN: TFloatField;
     QMCabeceraTIT_CONTACTO: TFIBStringField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraUNIDADES: TFloatField;
     QMNIFTERCERO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMDetalleID_IMAGEN: TIntegerField;
     QMFirmas: TFIBDataSetRO;
     QMFirmasID_FIRMA: TIntegerField;
     QMFirmasNOMBRE: TFIBStringField;
     QMFirmasNIF: TFIBStringField;
     DSQMFirmas: TDataSource;
     QMCabeceraBANCO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMNIFCARNET_APLICADOR: TFIBStringField;
     QMCabeceraFOLIO: TIntegerField;
     QMCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMCabeceraSII_FMA_PAGO: TIntegerField;
     QMCabeceraTIPO_VENTA: TIntegerField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMDetalleCANT_LOTE: TFloatField;
     QMCabeceraFECHA_ENTREGA_REPARTO: TDateTimeField;
     QMCabeceraZ_OBSERVACION: TFIBStringField;
     QMCabeceraDIR_ENTREGA_MANUAL: TMemoField;
     QMSIIDteReferencia: TFIBTableSet;
     DSQMSIIDteReferencia: TDataSource;
     QMSIIDteReferenciaID_S: TIntegerField;
     QMSIIDteReferenciaID_S_REF: TIntegerField;
     QMSIIDteReferenciaNROLINREF: TIntegerField;
     QMSIIDteReferenciaTPODOCREF: TFIBStringField;
     QMSIIDteReferenciaFCHREF: TDateTimeField;
     QMSIIDteReferenciaCODREF: TIntegerField;
     QMSIIDteReferenciaRAZONREF: TFIBStringField;
     QMSIIDteReferenciaRUTOTR: TFIBStringField;
     QMSIIDteReferenciaFOLIOREF: TFIBStringField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMCabeceraID_TIPO_DESPACHO: TIntegerField;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     QMDetalleSIGNO_UNIDADES: TFIBStringField;
     xInfoActualizadaSUM_PESO: TFloatField;
     QMCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField;
     QMCabeceraCODIGO_GIRO_CLIENTE: TIntegerField;
     QMCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField;
     QMCabeceraCODIGO_GIRO_EMPRESA: TIntegerField;
     QMCabeceraINDTRASLADO: TIntegerField;
     QMCabeceraTPOIMPRESION: TFIBStringField;
     QMCabeceraDIR_COMPLETA: TFIBStringField;
     QMCabeceraCODIGO_POSTAL: TFIBStringField;
     QMCabeceraLOCALIDAD: TFIBStringField;
     xInfoActualizadaRIESGO_ACT: TFloatField;
     xInfoActualizadaRIESGO_AUT: TFloatField;
     xInfoActualizadaNO_VENTA_RIESGO: TIntegerField;
     xInfoActualizadaRIESGO_PED: TFloatField;
     xInfoActualizadaRIESGO_EMP: TFloatField;
     xInfoActualizadaRIESGO_DISPONIBLE: TFloatField;
     xSiiDte: TFIBDataSetRO;
     DSxSiiDte: TDataSource;
     xSiiDteID_S: TIntegerField;
     xSiiDteCANTIDAD_ERRORES: TIntegerField;
     xSiiDteMENSAJE_ERROR: TFIBStringField;
     xSiiDteXML_RESPUESTA: TMemoField;
     xAvisos: TFIBDataSetRO;
     QMCabeceraCARTA_PORTE_TRANSPORTISTA: TIntegerField;
     xDireccionesTITULO: TFIBStringField;
     xDireccionesDIR_TRANSPORTISTA: TIntegerField;
     QMDetalleSTOCK_ALM: TFloatField;
     QMDetalleSTOCK_ALM2: TFloatField;
     QMDetalleSTOCK_ALM3: TFloatField;
     QMDetalleSTOCKV_ALM: TFloatField;
     QMDetalleSTOCKV_ALM2: TFloatField;
     QMDetalleSTOCKV_ALM3: TFloatField;
     QMDetalleSTOCKR_ALM: TFloatField;
     QMDetalleSTOCKR_ALM2: TFloatField;
     QMDetalleSTOCKR_ALM3: TFloatField;
     QMDetalleSTOCK_VIRTUAL: TFloatField;
     QMDetalleSTOCK_MONTURAS: TFloatField;
     QMDetalleSTOCK_REF_BASE: TFloatField;
     QMDetalleSTOCKM_ALM: TFloatField;
     QMDetalleSTOCKM_ALM2: TFloatField;
     QMDetalleSTOCKM_ALM3: TFloatField;
     QMDetalleU_POR_U_LOGISTICA: TFloatField;
     QMDetalleRELACIONAR_U_LOGISTICA: TIntegerField;
     QMDetalleTIPO_IVA_ART: TIntegerField;
     QMDetalleECOTASA: TFloatField;
     xInfoActualizadaMARGEN_SIN_PORTES: TFloatField;
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
     QMCabeceraMODO_IVA: TIntegerField;
     QMDetalleREQUIERE_LOTE_SIMPLE: TIntegerField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     xInfoActualizadaCOUNT_LINEA: TIntegerField;
     QMCartaPortesCODIGO_EXPEDICION: TFIBStringField;
     xAvisosMENSAJE: TMemoField;
     xAvisosNOTAS: TMemoField;
     DSxAvisos: TDataSource;
     QMNIFCOMO_NOS_CONOCIERON: TIntegerField;
     QMDetalleCONTROL_STOCK: TIntegerField;
     QMDetalleSTOCK: TFloatField;
     QMCabeceraID_FICHA_TECNICA: TIntegerField;
     QMCabeceraTITULO_GIRO_CLIENTE: TFIBStringField;
     xSiiDteSII_TRACKID: TFIBStringField;
     QMCabeceraDIR_NOMBRE_2: TFIBStringField;
     QMCabeceraCOMPRADOR_EDI: TFIBStringField;
     QMCabeceraCOMPRADOR: TFIBStringField;
     QMCabeceraMATRICULA: TFIBStringField;
     QMCabeceraDIA_PAGO_1: TIntegerField;
     QMCabeceraDIA_PAGO_2: TIntegerField;
     QMCabeceraDIA_PAGO_3: TIntegerField;
     QMCabeceraORIGEN_DOCUMENTO: TFIBStringField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMDetalleUE_UNIDADES: TIntegerField;
     QMDetalleUE_MEDIDA1: TFloatField;
     QMDetalleUE_MEDIDA2: TFloatField;
     QMDetalleUE_MEDIDA3: TFloatField;
     QMDetalleUE_MEDIDA4: TFloatField;
     QMDetalleSTOCK_REAL: TFloatField;
     QMCabeceraPORTES: TIntegerField;
     QMCabeceraENTRADA_FACTURACION: TIntegerField;
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
     xInfoActualizadaSUMA_BASES: TFloatField;
     xInfoActualizadaSUMA_COSTES: TFloatField;
     xInfoActualizadaSUM_UNIDADES_SEC: TFloatField;
     xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField;
     procedure DMDocsAlbaranCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
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
     procedure QMCabeceraALMACENChange(Sender: TField);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMCabeceraFORMA_PAGOChange(Sender: TField);
     procedure QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure DMAlbaranesDestroy(Sender: TObject);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraTARIFAChange(Sender: TField);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMCabeceraTIPO_IRPFChange(Sender: TField);
     procedure QMCartaPortesNewRecord(DataSet: TDataSet);
     procedure QMCartaPortesAfterOpen(DataSet: TDataSet);
     procedure QMCartaPortesCARGADORAChange(Sender: TField);
     procedure QMCartaPortesEXPEDIDORAChange(Sender: TField);
     procedure QMCartaPortesINTERMEDIARIAChange(Sender: TField);
     procedure QMCartaPortesTRANSPORTISTAChange(Sender: TField);
     procedure QMCartaPortesDESTINATARIOChange(Sender: TField);
     procedure QMMatriculasMATRICULAChange(Sender: TField);
     procedure QMNaturalezaNATURALEZAChange(Sender: TField);
     procedure QMMatriculasNewRecord(DataSet: TDataSet);
     procedure QMNaturalezaNewRecord(DataSet: TDataSet);
     procedure QMCartaPortesAfterInsert(DataSet: TDataSet);
     procedure QMMatriculasAfterInsert(DataSet: TDataSet);
     procedure QMNaturalezaAfterInsert(DataSet: TDataSet);
     procedure GrabaMatNat(DataSet: TDataSet);
     procedure QMCartaPortesAfterCancel(DataSet: TDataSet);
     procedure QMCartaPortesBeforeCancel(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure QMCabeceraRANGOChange(Sender: TField);
     procedure QMCabeceraINDICEChange(Sender: TField);
     procedure QMCabeceraTIPO_PORTESChange(Sender: TField);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMDetallePRECIOChange(Sender: TField);
     procedure QMDetalleP_COSTEChange(Sender: TField);
     procedure QMDetalleCOMISIONChange(Sender: TField);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraCONTACTOChange(Sender: TField);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMDetallePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCabeceraPROYECTOChange(Sender: TField);
     procedure QMCartaPortesBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleTITULO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
     procedure CambiaFechaAlbaranes(FechaNueva: TDateTime);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraDTO_PPChange(Sender: TField);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCartaPortesBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraTRANSPORTISTAChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMSIIDteReferenciaAfterPost(DataSet: TDataSet);
     procedure QMSIIDteReferenciaBeforePost(DataSet: TDataSet);
     procedure QMSIIDteReferenciaNewRecord(DataSet: TDataSet);
     procedure QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_IVAChange(Sender: TField);
     procedure QMDetallePESO_REALChange(Sender: TField);
     procedure QMDetalleALMACENChange(Sender: TField);
     procedure xInfoActualizadaCalcFields(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_FACTURADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTOTAL_UNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SECChange(Sender: TField);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure xProveedoresNewRecord(DataSet: TDataSet);
     procedure xProveedoresAfterPost(DataSet: TDataSet);
     procedure xProveedoresARTICULOChange(Sender: TField);
  private
     { Private declarations }
     //ComisionAgente : double ;
     unidades_old: double;
     SQLFind, SQLBase: string;
     Tarifa_old: string;
     fecha_old: TDateTime;
     RecalculaPrecios, editando, RecalculaTarifa: boolean;
     FlagModificandoUnidades: boolean;
     pago_automatico: boolean;
     ConPromociones: boolean;
     ControlaStockNegativo: boolean;
     moneda_old: string;
     KriConf126, KriConf429, KriConf464: boolean;
     OldLinea: TStrings;
     gUnidades: integer;
     Medida1, Medida2, Medida3, Medida4, gPrecio: double;
     AlmacenStock, AlmacenStock2, AlmacenStock3: string;
     AlmacenStockV, AlmacenStockV2, AlmacenStockV3: string;
     AlmacenStockR, AlmacenStockR2, AlmacenStockR3: string;
     AlmacenStockM, AlmacenStockM2, AlmacenStockM3: string;
     AlmacenStockActual, AlmacenStockVirtual, AlmacenStockReal, AlmacenStockMontura, AlmacenStockRefBase: boolean;
     StockAlm, StockAlm2, StockAlm3: TStrings;
     StockAlmV, StockAlmV2, StockAlmV3: TStrings;
     StockAlmR, StockAlmR2, StockAlmR3: TStrings;
     StockAlmM, StockAlmM2, StockAlmM3: TStrings;
     ModificandoCambioFijo: boolean;
     IdDocEliminaPorte: integer;
     RespuestaEliminaPorte: boolean;
     TipoVenta: integer;
     CodigoGiroEmpresa: integer;
     LiquidoAnt: double;
     Param_SYSCONF005: integer;
     Param_DOCREFE003: boolean;
     Param_CLIREFE001: boolean;
     Param_VENULKG001: boolean;
     Param_DOCPREC002: boolean;
     Param_DOCPREC003: boolean;
     Param_VENARTU001: boolean;
     Param_MOVSTKC001: integer;
     param_VENPREC001: boolean;
     Param_ALBLSIM001: boolean;
     param_DOCPCTA001: boolean;
     param_DOCDESC001: double;
     param_ALBNOST001: boolean;
     param_VENPREC002: boolean;
     param_VENUSEC001: boolean;
     param_ALBMAXL001: integer;
     param_VENCONT001: boolean;
     param_ALBETIQ001: integer;
     param_ALBETIQ002: boolean;
     param_VENAGEN001: boolean;
     {procedure InfoActualiza; dji lrk kri - public - TyC}
     procedure RefrescaTarifa;       // Refresca la tarifa y el cliente
     procedure LimpiaProcAuto;
     function Traspasado: boolean;
     procedure RefrescaIRPF;
     procedure DamePorIRPF;
     {function DameAlmacenDep: boolean; No se utiliza}
     {procedure CambiaMonedaFecha; No se utiliza}
     procedure AbreDocumentos(id_s_d: integer; destino, serie: string);
     {procedure AbreSerializadoAuto ; dji lrk kri - public - TyC}
     {procedure CierraAbreDet; dji lrk kri - public - TyC}
     {function PackingListGenerado: Boolean; dji lrk kri - public - TyC}
     procedure UbicaDefecto;
     procedure RellenaDatosLinea(Linea: TStrings);
     procedure EstaleceCondiciones(Articulo: TField; Precio: double; Forzar: boolean = False);
     procedure CambiaEstadoDocumento(Estado: integer);
     procedure AjustaPorteMinimo;
  public
     articulo_old: string; {dji lrk kri - Para saber si cambio}
     Posicionando: boolean;
     Filtrado{, NotasLote}: boolean; // Controla si se editan las notas del lote
     // NSerie: string;
     Calcula_unidades, NumSerie: boolean;
     LocalMascaraN, LocalMascaraL: string;
     TituloMatricula, TituloNaturaleza, Matricula: string;
     Naturaleza: integer;
     GrabaCarta, InsertNatDesdePortes, InsertMatDesdePortes, CancelaCarta, Muestra_InfoStock: boolean;
     procedure ActualizaCondicionesCli(CrearCondicionModelo: boolean);
     procedure CambiaUnidadesExt(Articulo: TField; Modo, Mostrar: boolean);
     function BusquedaCompleja: integer;
     procedure TraspasarAlbaranActual(TipoDestino: string);
     procedure Duplica(Relaciona: integer);
     procedure CambiaSerie(SerieVar: string);
     procedure PreparaNotasDetalle;
     procedure Procedencia;
     procedure RefrescaDetalle;
     procedure Etiquetas(serie: string);
     procedure CambiaPreciosTarifa;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure Historico;
     procedure BorraLineaUnidadesExt;
     procedure DatosHerencia(var rig, Ejercicio: integer; var tipo, su_referencia, titulo, serie: string);
     procedure DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
     procedure BusquedaArticulo(Descripcion: string);
     procedure VaciaNumSerie;
     procedure BuscaNumSerie(NroSerie: string; Filtrar: boolean);
     function Inhabilitar: boolean;
     function DameEstado: smallint;
     procedure CalculaUnidades(pvp: double);
     function Serializado: boolean;
     procedure AgrupacionPedidos(Serie: string; Contador: integer);
     procedure RefrescaTabla;
     procedure AnulaDocumento;
     procedure CambiaMonedaDetalle;
     procedure MascarasMoneda; virtual; {TyC}
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraCabeceraALFACliente(Alfa: integer; Valor: string; Fecha: TDateTime);
     function HayDocumentos: boolean;
     function HayDetalle: boolean;
     function EstadoDocumento: integer;
     procedure InfoLotes;
     procedure InfoActualiza; {TyC}
     procedure AbreSerializadoAuto; {TyC}
     procedure CierraAbreDet; {TyC}
     function PackingListGenerado: boolean; {TyC}
     procedure EditarNroDeSerieKri;
     procedure EditarLoteKri;
     procedure AgrupaAlbaranesFiltradosKri;
     procedure PreparaSerializacion;
     procedure Devuelve(SerieDestino: string);
     procedure ControlaRestriccion;
     function HayCartaPortes: boolean;
     procedure GrabaCabCartaPortes;
     procedure AbrirCartaPortes;
     procedure CerrarCartaPortes;
     procedure CancelarCarta;
     procedure MuestraUbicacion;
     procedure ExtraeArticulos;
     procedure GrabaDatosCliente(Estado: integer);
     function DameDatosClientes: boolean;
     function ExisteRango(Rango: integer): boolean;
     procedure OrdenarLineas;
     procedure RefrescaCabecera(Accion: integer);
     procedure GenerarPackingList;
     procedure FiltraDocumento(Serie, Filtro: string);
     procedure CalculaComisionKRI20;
     procedure BuscaArticulo(Articulo: string);
     procedure BuscaLoteSimple(LoteSimple: string);
     procedure FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
     procedure AbreQMNif;
     procedure CierraQMNif;
     procedure OrdenarLineasPorDireccionEntrega(id_s: integer = 0);
     procedure OrdenarLineasPorDireccionEntrega_Filtradas;
     procedure DistribuyeLineasPorDirecionEntrega;
     procedure RellenaDatosOldLinea;
     procedure ConectaProveedores;
     procedure DesconectaProveedores;
     procedure CambiaPCosteLinea(PCoste: double);
     procedure CambiaCosteAdicionalLinea(CosteAdicional: double);
     procedure DuplicarLinea;
     procedure ExportarVGG;
     procedure EliminarPackingList;
     procedure DameSqlImpresionEtiquetas(SQL: TStrings);
     procedure GeneraMovDeposito(AlmacenDeposito: string);
     procedure BorraMovDeposito;
     procedure CreaRuta;
     procedure AsignaEmpleados;
     procedure CreaReciboAnticipo;
     procedure TraspasoMovimientoStock;
     procedure ActualizaPorteSegunZona;
     procedure PosicionarID(IdDoc: integer);
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
     procedure AbreAlbaran;
     procedure CierraAlbaran;
     procedure TraspasaLinea(Tipo: string; id_s: integer);
     procedure ReiniciaStock(Articulo: string = '');
     function DocumentoDteValido: boolean;
     procedure LoaclizaFolio;
     procedure TraspasaMovimientoStock(Comentario: string; Todos: boolean = False);
     procedure MultiplicaPrecios(Factor: double);
     function LotesSimplesAsignados: boolean;
     procedure DameDatosCliente(Cliente: integer; var incoterm: string);
  end;

var
  DMAlbaranes : TDMAlbaranes;
  Serie : string;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFMAlbaranes, URecursos,
  uFBusca, UFCProcedencia, UDMLstAlbaranesEti, UFPregEtiAlbaran,
  UFMUnidadesExtGes, UFMPreciosArticuloDoc, UFInfoHistorico,
  {UFMIntroduceLotes,} UFParada, UFMExtraeArticulos, UFMFacturas,
  UFMArtSerializacion, UFOrdenaLineas, FIB,
  UFMNumerosDeSerieKri, UFMLotesVentaKri, UFMVerificaStockEscandallo,
  UFMAlbaranesTallas, UFormGest, UFMain, UFMAsignaLotes,
  UFMAlbaranesAlquiler, UDMAdjunto, UParam, UFMReciboNuevo, UFMAsignaEmpleado,
  UDMMovManStock, UFMSeleccion, UFMRegistroFitosanitario;

{$R *.DFM}

procedure TDMAlbaranes.DMDocsAlbaranCreate(Sender: TObject);
var
  i : integer;
begin
  // DMMain.Log('TDMAlbaranes.DMDocsAlbaranCreate');
  TranslateComponent(Self); //IDIOMA_CODE
  Posicionando := False;

  StockAlm := TStringList.Create;
  StockAlm2 := TStringList.Create;
  StockAlm3 := TStringList.Create;

  StockAlmV := TStringList.Create;
  StockAlmV2 := TStringList.Create;
  StockAlmV3 := TStringList.Create;

  StockAlmR := TStringList.Create;
  StockAlmR2 := TStringList.Create;
  StockAlmR3 := TStringList.Create;

  StockAlmM := TStringList.Create;
  StockAlmM2 := TStringList.Create;
  StockAlmM3 := TStringList.Create;

  OldLinea := TStringList.Create;
  param_DOCPCTA001 := (LeeParametro('DOCPCTA001', REntorno.Serie) = 'S');
  KriConf126 := (DMMain.EstadoKri(126) = 1);
  KriConf429 := (DMMain.EstadoKri(429) = 1);
  Kriconf464 := (DMMain.EstadoKri(464) = 1);

  // Para que al abrir, antes de establecer la serie el parámetro tenga un valor.
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', REntorno.Serie), 0);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Se inicializan las variables globales
  // ComisionAgente := 0;
  FlagModificandoUnidades := False;
  ModificandoCambioFijo := False;
  IdDocEliminaPorte := 0;
  RespuestaEliminaPorte := False;

  // Máscaras de visualización a los campos numéricos
  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xProveedores, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCartaPortes, MascaraN, MascaraI, ShortDateFormat);

  // Se asignan las máscaras de visualización a los campos que las requieren
  QMCabeceraDTO_CIAL.DisplayFormat := MascaraP;
  QMCabeceraDTO_PP.DisplayFormat := MascaraP;
  QMCabeceraP_RETENCION.DisplayFormat := MascaraP;
  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMCabeceraPOR_PORTES.DisplayFormat := MascaraP;
  QMCabeceraMARGEN.DisplayFormat := MascaraP;
  // QMCabeceraFECHA.DisplayFormat := ShortDateFormat;
  QMCabeceraFECHA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_ENTREGA_MANUAL.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_ENTREGA_REPARTO.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_RECOGIDA_MANUAL.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_SERVIDO.DisplayFormat := ShortDateFormat + ' hh:nn';

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
  QMDetalleSTOCK_ALM.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_LOGISTICAS.DisplayFormat := MascaraI;
  QMDetalleFECHA_PRE_DET.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMDetalleFECHA_REC_DET.DisplayFormat := ShortDateFormat + ' hh:nn';

  QMCartaPortesBULTOS.DisplayFormat := MascaraI;
  QMCartaPortesPESO.DisplayFormat := MascaraI;
  QMCartaPortesPALETS.DisplayFormat := MascaraI;
  QMCartaPortesPESO_BRUTO.DisplayFormat := MascaraI;
  QMCartaPortesUNIDADES_LOGISTICAS.DisplayFormat := MascaraI;
  QMCartaPortesVOLUMEN.DisplayFormat := MascaraI;
  QMCartaPortesFECHA_TRANSPORTE.DisplayFormat := ShortDateFormat + ' hh:nn';

  ControlaStockNegativo := DMMain.ControlStockNegativoEmpresa;

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_ALBARAN ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''ALB'' ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add(' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' AND ((EJERCICIO = ?EJERCICIO) OR ((EJERCICIO < ?EJERCICIO) AND ((ESTADO = 0) OR (ESTADO = 3)))) ');
  SQLBase := QMCabecera.SelectSQL.Text;

  if (REntorno.Pais = 'CHL') then
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
  else
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

  with QMCabecera.DeleteSQL do
  begin
     Clear;
     Add('EXECUTE PROCEDURE G_BORRA_RIG_SALIDA_LOG ');
     Add('(?OLD_EMPRESA, ?OLD_EJERCICIO, ?OLD_CANAL, ?OLD_SERIE, ?OLD_TIPO, ?OLD_RIG, ?OLD_ID_S, ');
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

  Filtrado := False;
  Calcula_Unidades := True;

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

  // NotasLote := False;

  if (REntorno.AlbaranRestringido) then
  begin
     QMCabecera.AccionesInhibidas := DMAlbaranes.QMCabecera.AccionesInhibidas + [Borrar];
     QMDetalle.AccionesInhibidas := DMAlbaranes.QMDetalle.AccionesInhibidas + [Borrar];
  end;

  GrabaCarta := True;
  InsertNatDesdePortes := False;
  InsertMatDesdePortes := False;
  NumSerie := False;

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

  if (DMMain.EstadoKri(47) = 1) then
  begin
     QMDetalleUNIDADES_LOGISTICAS.DisplayLabel := _('Bultos');
     QMDetalleUNIDADES.DisplayLabel := _('Kilos');
  end;
end;

procedure TDMAlbaranes.DMAlbaranesDestroy(Sender: TObject);
begin
  // DMMain.Log('TDMAlbaranes.DMAlbaranesDestroy');
  LimpiaProcAuto;
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  StockAlm.Free;
  StockAlm2.Free;
  StockAlm3.Free;
  StockAlmV.Free;
  StockAlmV2.Free;
  StockAlmV3.Free;
  StockAlmR.Free;
  StockAlmR2.Free;
  StockAlmR3.Free;
  StockAlmM.Free;
  StockAlmM2.Free;
  StockAlmM3.Free;
  OldLinea.Free;
end;

procedure TDMAlbaranes.Graba(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.Graba');
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMAlbaranes.GrabaBorrado(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.GrabaBorrado');
  InfoActualiza;
end;

procedure TDMAlbaranes.QMDetalleNewRecord(DataSet: TDataSet);
var
  i : integer;
  Linea, Campo, Valor : string;
begin
  // Impedimos insertar mas lineas que el limite
  if (param_ALBMAXL001 > 0) then
  begin
     if (QMDetalle.RecordCount >= param_ALBMAXL001) then
        raise Exception.Create(format(_('El numero maximo de items para un albaran son %d lineas'), [param_ALBMAXL001]));
  end;

  // DMMain.Log('TDMAlbaranes.QMDetalleNewRecord');
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleTIPO.AsString := QMCabeceraTIPO.AsString;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMDetalleID_S.AsInteger := QMCabeceraID_S.AsInteger;
  QMDetalleALMACEN.AsString := QMCabeceraALMACEN.AsString;
  // QMDetalleCOMISION.AsFloat := ComisionAgente;
  QMDetalleTITULO.AsString := '';
  QMDetalleUNIDADES.AsInteger := 1;
  QMDetalleENTRADA.AsInteger := REntorno.ENTRADA;
  QMDetalleUNIDADES_EXT.AsInteger := 0;
  QMDetalleUNIDADES_SEC.AsInteger := 0;
  QMDetalleNSERIE.AsString := '';
  QMDetalleID_DETALLES_S.AsInteger := 0;
  QMDetalleTIPO_LINEA.AsString := 'NOR';
  QMDetalleBULTOS.AsInteger := 0;
  QMDetalleCOSTE_ADICIONAL.AsFloat := 0;

  // QMDetallePIEZAS_X_BULTO.AsInteger := 0;
  // PIEZAS_X_BULTO puede tener un valor por defecto diferente a 0.
  QMDetallePIEZAS_X_BULTO.AsInteger := DMMain.EstadoKri(439);

  QMDetalleUNIDADES_FACTURADAS.AsInteger := 0; {dji lrk kri}
  QMDetalleLINEA_SERVIDA.AsInteger := 0; {dji lrk kri}
  QMDetalleCAJA_EDI.AsString := '1';     {dji lrk kri - EDI}
  QMDetalleTIPO_CAJA_EDI.AsString := 'C1'; {dji lrk kri - EDI}
  QMDetalleTIPO_LINEA_KRI.AsInteger := QMCabeceraTIPO_LINEA_KRI.AsInteger; {dji lrk kri}
  Unidades_Old := 0;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  // Obtenemos el número de línea más alto en el albarán actual
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_S.AsInteger);

  NumSerie := False;
  QMDetallePRO_NUM_PLANO.AsString := '';
  QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMDetalleLOTE_SIMPLE.AsString := '';
  QMDetalleDIRECCION_ENTREGA.AsInteger := QMCabeceraDIRECCION.AsInteger;
  QMDetalleMANIPULACION.AsInteger := 0;

  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf464) then
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

procedure TDMAlbaranes.QMCabeceraNewRecord(DataSet: TDataSet);
var
  Cliente : integer;
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraNewRecord');
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'ALB';
  QMCabeceraRIG.AsInteger := 0;
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraALMACEN.AsString := DMMain.DameAlmacenDocumento('ALB', Serie);
  QMCabeceraCAMPANYA.AsInteger := 0;
  QMCabeceraP_RETENCION.AsFloat := 0;
  QMCabeceraTIPO_IRPF.AsInteger := 0;
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraID_S.AsInteger := 0;
  QMCabeceraGARANTIA.AsInteger := 0; {dji lrk kri}
  QMCabeceraALMACEN_DEPOSITO.AsString := '';
  QMCabeceraNUM_MOV_DEPOSITO.AsInteger := 0;
  QMCabeceraDEPOSITO.AsInteger := 0;
  QMCabeceraDEVOLUCION_DEPOSITO.AsInteger := 0;
  QMCabeceraTIPO_PORTES.AsInteger := 0;
  QMCabeceraPOR_PORTES.AsFloat := 0;
  QMCabeceraMARGEN.AsFloat := 0;
  QMCabeceraI_PORTES.AsFloat := 0;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
  QMCabeceraTIPO_LINEA_KRI.AsInteger := 0; {dji lrk kri}
  QMCabeceraTARIFA.AsString := REntorno.TarifaDefecto;
  QMCabeceraDOCUMENTO_MUESTRAS.AsInteger := 0;
  QMCabeceraFACTURABLE.AsInteger := BoolToInt(LeeParametro('ALBFACT001') = 'S');
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCVPRY001', Serie), 0);
  QMCabeceraCONTACTO.AsInteger := 0;
  QMCabeceraESTADO.AsInteger := 0;
  QMCabeceraPEDIDO_CLIENTE.AsString := '';
  QMCabeceraEMPLEADO_RESPONSABLE.AsInteger := 0;
  QMCabeceraEMPLEADO_ATENCION.AsInteger := 0;
  QMCabeceraBULTOS_KRI.AsInteger := 0;
  QMCabeceraCOD_MOTIVO_ABONO.AsInteger := 0;
  QMCabeceraTITULO_GIRO_CLIENTE.AsString := '';

  Cliente := StrToIntDef(LeeParametro('ALBCLIE001', Serie), 0);
  if (Cliente <> 0) then
     QMCabeceraCLIENTE.AsInteger := Cliente;

  if param_VENAGEN001 then
     QMCabeceraAGENTE.AsInteger := DameAgenteUsuario(REntorno.Usuario);

  // Datos SII Chile
  QMCabeceraFOLIO.AsInteger := 0;

  // Para Chile el Tipo de Documento Tributario en Alabranes es la guia de despacho
  if (REntorno.Pais = 'CHL') then
     QMCabeceraTIPO_DOC_TRIBUTARIO.AsString := '52'
  else
     QMCabeceraTIPO_DOC_TRIBUTARIO.AsString := 'DES';

  QMCabeceraSII_FMA_PAGO.AsInteger := 0;
  QMCabeceraTIPO_VENTA.AsInteger := TipoVenta;
  QMCabeceraCODIGO_GIRO_EMPRESA.AsInteger := CodigoGiroEmpresa;
  QMCabeceraINDTRASLADO.AsInteger := 0;
  QMCabeceraTPOIMPRESION.AsString := '';

  Editando := False;
  Tarifa_old := '';
  CancelaCarta := True;
end;

procedure TDMAlbaranes.QMCabeceraCLIENTEChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraCLIENTEChange');
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
        // Asignamos al Albaran
        QMCabeceraTERCERO.AsInteger := EntornoDoc.Tercero;

        if not param_VENAGEN001 then
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
        QMCabeceraALBARAN_VALORADO.AsInteger := FieldByName('ALBARAN_VALORADO').AsInteger;

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

        // Controlamos si esta o no bloqueado y mostramos el aviso YA
        if (FieldByName('NO_ALB_FAC').AsInteger = 1) then
           MessageDlg(_('No se pueden realizar ventas a este cliente, cliente bloqueado.'),
              mtInformation, [mbOK], 0);
     end;

     if (LeeParametro('DIRCLA4002', Serie) <> 'S') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_DAME_DIRECCION_ENVIO_CLI(:EMPRESA, :CLIENTE)';
              Params.ByName['EMPRESA'].AsInteger := EntornoDoc.Empresa;
              Params.ByName['CLIENTE'].AsInteger := Sender.AsInteger;
              ExecQuery;
              QMCabeceraDIRECCION.AsInteger := FieldByName['DIRECCION'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        // Direccion por defecto es la de Clase=4 (envio por defecto) excepto si solo hay una dirección. Si hay muchas dejo vacio
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT (SELECT FIRST 1 DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = T.TERCERO AND DIR_CLASE = 4 AND ACTIVO = 1 ORDER BY DIRECCION) DIRECCION_CLASE_4, ');
              SQL.Add('        (SELECT COUNT(DIRECCION) FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = T.TERCERO AND ACTIVO = 1) CANT_DIRECCIONES, ');
              SQL.Add('        (SELECT FIRST 1 DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = T.TERCERO AND DIR_DEFECTO = 1 AND ACTIVO = 1 ORDER BY DIRECCION) DIRECCION ');
              SQL.Add(' FROM SYS_TERCEROS T ');
              SQL.Add(' WHERE ');
              SQL.Add(' T.TERCERO = :TERCERO ');
              Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
              ExecQuery;
              if (FieldByName['DIRECCION_CLASE_4'].AsInteger <> 0) then
                 QMCabeceraDIRECCION.AsInteger := FieldByName['DIRECCION_CLASE_4'].AsInteger
              else
              if (FieldByName['CANT_DIRECCIONES'].AsInteger = 1) then
                 QMCabeceraDIRECCION.AsInteger := FieldByName['DIRECCION'].AsInteger
              else
                 QMCabeceraDIRECCION.Clear;
              FreeHandle;
           finally
              Free;
           end;
        end;
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

     if (
      {$IFNDEF Debug}
        (REntorno.Pais = 'CHL') and
      {$ENDIF}
        (QMCabecera.State = dsInsert)) then
        QMCabeceraCODIGO_GIRO_CLIENTE.AsInteger := DMMain.DameGiro('CLI', QMCabeceraEMPRESA.AsInteger, QMCabeceraCLIENTE.AsInteger);
  end
  else
     QMCabecera.Cancel;
end;

procedure TDMAlbaranes.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraDIRECCIONChange');
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

procedure TDMAlbaranes.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraBeforePost');
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  QMCabeceraSU_REFERENCIA.AsString := Trim(QMCabeceraSU_REFERENCIA.AsString);
  QMCabeceraPEDIDO_CLIENTE.AsString := Trim(QMCabeceraPEDIDO_CLIENTE.AsString);
  QMCabeceraZ_OBSERVACION.AsString := Trim(QMCabeceraZ_OBSERVACION.AsString);

  if Param_DOCREFE003 and (QMCabeceraSU_REFERENCIA.AsString <> '') then
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

  RecalculaPrecios := False;
  RecalculaTarifa := False;
  if (editando) then
  begin
     //Cambio de Moneda
     {
     dji lrk kri - No recalculo precios si cambia la moneda o la fecha
     if ( QMCabeceraMONEDA.AsString <> REntorno.MonedaEmpresa) then
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
              RecalculaTarifa := True
           else
           begin
              RecalculaTarifa := False;
              QMCabeceraTARIFA.AsString := Tarifa_old;
           end;
        end
        else
        begin
           if (Application.MessageBox(PChar(string(_('Desea recalcular los precios en función de la nueva.'))),
              PChar(string(_('Confirmación'))), MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
              RecalculaTarifa := True
           else
              RecalculaTarifa := False;
        end;
     end;
  end;

  // Temas de Chile
  if (REntorno.Pais = 'CHL') then
  begin
     if (QMCabecera.State = dsInsert) then
     begin
        // Si el documento es una Guia de despacho
        if ((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString <> 'DES') and (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '52')) then
        begin
           DMMain.CreaReferenciaDte(QMCabeceraID_S.AsInteger, 0, QMCabeceraID_S.AsInteger, '', QMCabeceraTIPO_DOC_TRIBUTARIO.AsString, '', '', QMCabeceraFECHA.AsDateTime);
           Refrescar(QMSIIDteReferencia, 'NROLINREF', QMSIIDteReferenciaNROLINREF.AsInteger);
        end;
     end;

     // Si se edita se asigna forma de pago SII por trigger
     if (QMCabecera.State = dsEdit) then
        QMCabeceraSII_FMA_PAGO.AsInteger := 0;
  end;
end;

procedure TDMAlbaranes.QMDetalleARTICULOChange(Sender: TField);
var
  MostrarUdsExt, Baja : boolean;
  AlmacenDefecto : string;
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleARTICULOChange');

  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  if (not DMMain.ArticuloBloqueado(Sender.AsString, 'ALB')) then
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

     RefrescaTarifa;

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
           QMDetalleTIPO_IVA.AsString := FieldByName['TIPO_IVA'].AsString;
           QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
           QMDetalleID_C_A.AsInteger := FieldByName['ID_C_A'].AsInteger;
           QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger := FieldByName['TIPO_IMPUESTO_ADICIONAL'].AsInteger;

           if REntorno.VerSoloArticulosDisponibles then
              if (not (FieldByName['DISPONIBILIDAD'].AsInteger in [1, 2])) then
                 QMDetalle.Cancel;

           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDetalleTITULO_IDIOMA.AsString := DameTituloIdiomaArticulo(QMDetalleID_A.AsInteger, QMCabeceraIDIOMA.AsString);

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

     if (Param_ALBLSIM001) then
     begin
        QMDetalleLOTE_SIMPLE.AsString := DMMain.DameLoteSimple(QMDetalleARTICULO.AsString, QMCabeceraFECHA.AsDateTime);
     end;

     QMDetalleCalcFields(QMDetalle);

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

procedure TDMAlbaranes.InfoActualiza;
begin
  // DMMain.Log('TDMAlbaranes.InfoActualiza');
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_S.AsInteger > 0) then
        Open;
  end;
end;

procedure TDMAlbaranes.QMDetalleBeforePost(DataSet: TDataSet);
var
  HayStock : integer;
  P_IVA : real;
  NSerie : TFMNumerosDeSerieKri;
  // Lotes : TFMLotesVentaKri;
  Garantia : boolean;
  HayExistenciaEscandallo : boolean;
  {Lotes_kri,} Serializado_kri : boolean;
  VerificaStockEscandallo : TFMVerificaStockEscandallo;
  RiesgoAut, RiesgoAct, RiesgoPed, RLinea : double;
  pot10 : extended;
  MaximoDescuento : double;
  s : string;
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleBeforePost');

  MaximoDescuento := param_DOCDESC001;
  if (MaximoDescuento >= 0) then
  begin
     if (QMDetalleDESCUENTO.AsFloat > MaximoDescuento) then
        raise Exception.Create(Format(_('El descuento no puede ser mayor a %f'), [MaximoDescuento]));
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

  HayExistenciaEscandallo := True;
  if (DMMain.EstadoKri(249) = 1) then
  begin
     if (QMDetalleUNIDADES.Value <> unidades_old) or
        (QMDetalleARTICULO.Value <> articulo_old) then
     begin
        VerificaStockEscandallo := TFMVerificaStockEscandallo.Create(Self);
        HayExistenciaEscandallo :=
           VerificaStockEscandallo.Muestra(QMDetalleARTICULO.AsString,
           QMCabeceraALMACEN.AsString, QMDetalleUNIDADES.AsFloat);
        VerificaStockEscandallo.Release;
     end;
  end;

  if (not HayExistenciaEscandallo) then
  begin
     Abort;
     //raise Exception.Create('No hay existencias suficientes algún componente del escandallo.');
     //DataSet.Cancel;
     //DataSet.Refresh;
  end
  else
  begin
     if (QMDetalleNSERIE.AsString <> '') then
        if ((QMDetalleUNIDADES.AsFloat <> 1) and (QMDetalleUNIDADES.AsFloat <> -1)) then
           raise Exception.Create(_('No se puede vender más de una unidad de un artículo serializado'));

     Muestra_InfoStock := True;

     if (ControlaStockNegativo or param_ALBNOST001) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT HAY_STOCK FROM G_VENTAS_CONTROLA_STOCK_NEG(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :UNIDADES)';
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
           if param_ALBNOST001 then
              raise Exception.Create(_('No hay existencias suficientes.'))
           else
           begin
              Muestra_InfoStock := False;
              FMAlbaranes.MuestraStock(1);
           end;
        end;
     end;

     {Calculo el CRC de las notas para poder agrupar}
     QMDetalleCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS));
     QMDetalleCRC_NOTAS2.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS2));

     QMDetalleENTRADA.AsInteger := REntorno.Entrada;

     // ID
     if (DataSet.State = dsInsert) then
        DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_S', 'ID_DETALLES_S');

     {lotes_kri := True; No se utiliza}
     serializado_kri := True;
     if ((DMMain.EstadoKri(161) = 1) and (xArticulos.FieldByName('ABIERTO').AsInteger = 0)) then
     begin
        {if (xArticulos.FieldByName('LOTES_KRI').AsInteger = 0) then
           lotes_kri := False; No se utiliza}
        if (xArticulos.FieldByName('SERIALIZADO_KRI').AsInteger = 0) then
           serializado_kri := False;
     end;
     {    if lotes_kri then
    begin
      Lotes := TFMLotesVentaKri.Create(Self);
      Lotes.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        REntorno.Canal,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN.AsString,
        QMCabeceraCLIENTE.AsInteger,
        QMDetalleUNIDADES.AsInteger,
        false,  -ESCANDALLO-
        false); -ForzarEntrada-
      Lotes.Release;
    end;}
     if serializado_kri then
     begin
        NSerie := TFMNumerosDeSerieKri.Create(Self);
        Garantia := False;
        NSerie.Muestra(REntorno.Empresa,
           REntorno.Ejercicio,
           REntorno.Canal,
           QMDetalleSERIE.AsString,
           QMDetalleRIG.AsInteger,
           QMDetalleLINEA.AsInteger,
           QMCabeceraFECHA.AsDateTime,
           QMDetalleARTICULO.AsString,
           QMCabeceraALMACEN.AsString,
           QMCabeceraCLIENTE.AsInteger,
           QMDetalleUNIDADES.AsInteger,
           0,  {ESCANDALLO}
           garantia,
           False); {ForzarEntrada}
        NSerie.Release;
     end;

     // if (QMDetalleID_LOTE.AsInteger = 0) then
     //    InfoLotes;

     // Unidades Logisticas
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
  end;

  // Verifico si el stock baja del stock mínimo y lo informo
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

procedure TDMAlbaranes.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraAfterOpen');
  xCliente.Open;
  QMDetalle.Open;
  xDirecciones.Open;
  xFormasPago.Open;
  RefrescaIRPF;
  xRangos.Close;
  xRangos.Open;
  xIndices.Close;
  xIndices.Open;
  xProyectos.Open;
  QMSIIDteReferencia.Open;
  QMFirmas.Open;
  if (REntorno.Pais = 'CHL') then
     xSiiDte.Open;

  UbicaDefecto;
  InfoActualiza;
end;

procedure TDMAlbaranes.QMCabeceraALMACENChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraALMACENChange');
  EntornoDoc.Almacen := Sender.AsString;
end;

procedure TDMAlbaranes.AntesDeEditar(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

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

  moneda_old := QMCabeceraMONEDA.AsString;
  unidades_old := QMDetalleUNIDADES.AsFloat;
  articulo_old := QMDetalleARTICULO.AsString;
  fecha_old := QMCabeceraFECHA.AsDateTime;
  editando := True;
  tarifa_old := QMCabeceraTARIFA.AsString;
end;

procedure TDMAlbaranes.QMCabeceraFORMA_PAGOChange(Sender: TField);
var
  RiesgoAut, RiesgoAct, RiesgoPed : double;
  pot10 : extended;
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraFORMA_PAGOChange');
  with xFormasPago do
  begin
     Close;
     Open;
  end;

  if xFormasPago.FieldByName('PRONTO_PAGO').AsInteger = 1 then
     QMCabeceraDTO_PP.AsFloat := xCliente.FieldByName('DESCUENTO_PP').AsFloat
  else
     QMCabeceraDTO_PP.AsFloat := 0;

  if xFormasPago.FieldByName('HEREDA_FINANCIACION').AsInteger = 1 then
     QMCabeceraPOR_FINANCIACION.AsFloat := xCliente.FieldByName('POR_FINANCIACION').AsFloat;

  if xFormasPago.FieldByName('PAGO_AUTOMATICO').AsInteger = 1 then
     pago_automatico := True
  else
     pago_automatico := False;

  if (xCliente.FieldByName('TIPO_PORTES').AsInteger = 0) then
     ActualizaPorteSegunZona;

  // Comprobamos que el cliente no supera el riesgo y si lo supera es
  with xCliente do
  begin
     Refresh;
     RiesgoAut := FieldByName('RIESGO_AUT').AsFloat;
     RiesgoAct := FieldByName('RIESGO_ACT').AsFloat;
  end;

  pot10 := Power(10, REntorno.DecimalesCalculo);
  RiesgoAut := (Trunc(RiesgoAut * pot10)) / pot10;
  RiesgoPed := DMMain.DameRiesgoPedido(QMCabeceraCLIENTE.AsInteger);

  if ((RiesgoAut < RiesgoAct + RiesgoPed) and
     (pago_automatico = True) and {dji lrk kri - quizas deberia ser false}
     ((xCliente.FieldByName('NO_VENTA_RIESGO').AsInteger = 1) or KriConf126)) then
     MessageDlg(Format(_('El Riesgo Autorizado para el Cliente se ha superado.' + #13#10 + #13#10 +
        'Riesgo Autorizado: %s' + #13#10 +
        'Riesgo Actual: %s'),
        [FormatFloat(MascaraN, RiesgoAut), FormatFloat(MascaraN, RiesgoAct + RiesgoPed)]),
        mtInformation, [mbOK], 0);
end;

procedure TDMAlbaranes.TraspasarAlbaranActual(TipoDestino: string);
var
  id_s_d, EjercicioDestino : integer;
  Fecha : TDateTime;
  s : string;
begin
  // DMMain.Log('TDMAlbaranes.TraspasarAlbaranActual');
  if (QMCabeceraGARANTIA.AsInteger = 1) then
     raise Exception.Create(_('El albarán es una garantía y no se puede facturar'))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 D_ID_S, D_TIPO || ''-'' || D_EJERCICIO || ''-'' || D_SERIE || ''/'' || D_RIG AS DESTINO ');
           SQL.Add(' FROM GES_CABECERAS_RELACIONES ');
           SQL.Add(' WHERE ');
           SQL.Add(' O_ID_S = :ID_S AND ');
           SQL.Add(' O_TIPO = :TIPO AND ');
           SQL.Add(' D_TIPO = ''FAC'' ');
           SQL.Add(' ORDER BY D_ID_S ');
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           id_s_d := FieldByName['D_ID_S'].AsInteger;
           s := FieldByName['DESTINO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (id_s_d > 0) then
        raise Exception.Create(format(_('El documento ha sido traspasado a %s'), [s]));
  end;
  begin
     if ((QMCabeceraFACTURABLE.AsInteger = 1) or ConfirmaMensaje(_('El albaran no esta marcado como facturable.' + #13#10 + '¿Desea facturarlo de todos modos?'))) then
     begin
        if (REntorno.Pais = 'CHL') then
           DMMain.ReNumerarOrdenDetalleVenta(QMCabeceraID_S.AsInteger);

        if DMMain.EstadoKri(4) = 1 then
           Fecha := QMCabeceraFECHA.AsDateTime
        else
           Fecha := REntorno.FechaTrab;

        EjercicioDestino := DameEjercicio(REntorno.Empresa, Fecha);

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_ALBARAN_A_OTRO_MUL ');
              SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ');
              SQL.Add(' ?D_TIPO, ?ENTRADA, ?FECHA, ?TRANSPORTISTA, ');
              SQL.Add(' ?D_EJERCICIO, ?D_CANAL, ?D_SERIE, ?ID_S, 0, 0, 0, 0, 0) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['TIPO'].AsString := 'ALB';
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              Params.ByName['D_TIPO'].AsString := TipoDestino;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Params.ByName['TRANSPORTISTA'].AsInteger := QMCabeceraTRANSPORTISTA.AsInteger;
              Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDestino;
              Params.ByName['D_CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['D_SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              ExecQuery;
              id_s_d := FieldByName['ID_S_D'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (REntorno.Ejercicio >= EjercicioDestino) then
        begin
           QMCabecera.Refresh;
           AbreDocumentos(id_s_d, TipoDestino, QMCabeceraSERIE.AsString);
        end
        else
        begin
           QMCabecera.Close;
           QMCabecera.Open;
        end;
     end;
  end;
end;

function TDMAlbaranes.BusquedaCompleja: integer;
begin
  // DMMain.Log('TDMAlbaranes.BusquedaCompleja');
  Filtrado := True;

  with QMCabecera do
  begin
     Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10110', True, Serie);

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

procedure TDMAlbaranes.QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraAPLICA_IRPFGetText');
  if QMCabeceraA_IRPF.AsInteger = 0 then
     Text := _('Aplicable a la Base Imponible')
  else
     Text := _('Aplicable al Total con IVA');
end;

procedure TDMAlbaranes.Duplica(Relaciona: integer);
var
  RiesgoAut, RiesgoAct, TotalFact : double;
  pot10 : extended;
  IdDocDestino : integer;
begin
  // DMMain.Log('TDMAlbaranes.Duplica');
  with xCliente do
  begin
     Refresh;
     RiesgoAut := FieldByName('RIESGO_AUT').AsFloat;
     RiesgoAct := FieldByName('RIESGO_ACT').AsFloat;
  end;

  with xInfoActualizada do
  begin
     TotalFact := FieldByName('TOTAL_A_COBRAR').AsFloat;
  end;

  pot10 := Power(10, REntorno.DecimalesCalculo);
  RiesgoAut := (Trunc(RiesgoAut * pot10)) / pot10;

  if ((RiesgoAut > 0) or KriConf126) then
     if (RiesgoAut < (RiesgoAct + TotalFact)) then
        ShowMessage(_('El Riesgo Autorizado para el Cliente se ha superado'));

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOC_S_DUPLICA ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, ');
        SQL.Add(' :ENTRADA, :D_EJERCICIO, :FECHA, :NREFERENCIA, :ID_S, :RELACIONA_KRI, :TIPO_DOC_TRIBUTARIO_DESTINO) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        // Obtenemos el ejercicio desde la fecha
        Params.ByName['D_EJERCICIO'].AsInteger := DameEjercicio(QMCabeceraEMPRESA.AsInteger, REntorno.FechaTrab);
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['NREFERENCIA'].AsString := '';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['RELACIONA_KRI'].AsInteger := Relaciona;
        Params.ByName['TIPO_DOC_TRIBUTARIO_DESTINO'].AsString := ''; // Para generar un DTE en Chile
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
  Posicionando := True;
  try
     Refrescar(QMCabecera, 'ID_S', IdDocDestino);
  finally
     Posicionando := False;
  end;
end;

procedure TDMAlbaranes.ActualizaCondicionesCli(CrearCondicionModelo: boolean);
begin
  // DMMain.Log('TDMAlbaranes.ActualizaCondicionesCli');
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

procedure TDMAlbaranes.QMCabeceraAfterPost(DataSet: TDataSet);
var
  RiesgoAut, RiesgoAct, RiesgoPed : double;
  pot10 : extended;
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraAfterPost');
  //Graba(DataSet);
  {
  if (DMMain.TContador.InTransaction) then
    DMMain.TContador.Commit;
}

  {
dji lrk kri - No recalculo precios si cambia la moneda o la fecha

  if (moneda_old <> QMCabeceraMONEDA.AsString) then CambiaMonedaDetalle;
  if RecalculaPrecios then
    CambiaMonedaFecha;
}
  if RecalculaTarifa then
  begin
     CambiaTarifaVentas(QMCabeceraID_S.AsInteger, QMCabeceraTARIFA.AsString, Tarifa_old);
     QMCabecera.Refresh;
  end;

  with xCliente do
  begin
     Refresh;
     RiesgoAut := FieldByName('RIESGO_AUT').AsFloat;
     RiesgoAct := FieldByName('RIESGO_ACT').AsFloat;
  end;

  pot10 := Power(10, REntorno.DecimalesCalculo);
  RiesgoAut := (Trunc(RiesgoAut * pot10)) / pot10;
  RiesgoPed := DMMain.DameRiesgoPedido(QMCabeceraCLIENTE.AsInteger);

  if ((RiesgoAut < RiesgoAct + RiesgoPed) and
     ((xCliente.FieldByName('NO_VENTA_RIESGO').AsInteger = 1) or KriConf126)) then
     MessageDlg(Format(_('El Riesgo Autorizado para el Cliente se ha superado.' + #13#10 + #13#10 +
        'Riesgo Autorizado: %s' + #13#10 +
        'Riesgo Actual: %s'),
        [FormatFloat(MascaraN, RiesgoAut), FormatFloat(MascaraN, RiesgoAct + RiesgoPed)]),
        mtInformation, [mbOK], 0);
  {------------------------------------------------------------------------------}

  UbicaDefecto;
end;

procedure TDMAlbaranes.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraPostError');
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
     //DMMain.TContador.Rollback;
  end;
end;

procedure TDMAlbaranes.CambiaSerie(SerieVar: string);
begin
  // DMMain.Log('TDMAlbaranes.CambiaSerie');
  Serie := SerieVar;

  AlmacenStock := LeeParametro('ALBSTKA001', Serie);
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  AlmacenStock2 := LeeParametro('ALBSTKA002', Serie);
  if (AlmacenStock2 = '') then
     AlmacenStock2 := 'NOCALC';
  if (AlmacenStock2 <> 'NOCALC') then
     AlmacenStock2 := Copy(AlmacenStock2, 1, 3);

  AlmacenStock3 := LeeParametro('ALBSTKA003', Serie);
  if (AlmacenStock3 = '') then
     AlmacenStock3 := 'NOCALC';
  if (AlmacenStock3 <> 'NOCALC') then
     AlmacenStock3 := Copy(AlmacenStock3, 1, 3);

  AlmacenStockV := LeeParametro('ALBSTKV001', Serie);
  if (AlmacenStockV = '') then
     AlmacenStockV := 'NOCALC';
  if (AlmacenStockV <> 'NOCALC') then
     AlmacenStockV := Copy(AlmacenStockV, 1, 3);

  AlmacenStockV2 := LeeParametro('ALBSTKV002', Serie);
  if (AlmacenStockV2 = '') then
     AlmacenStockV2 := 'NOCALC';
  if (AlmacenStockV2 <> 'NOCALC') then
     AlmacenStockV2 := Copy(AlmacenStockV2, 1, 3);

  AlmacenStockV3 := LeeParametro('ALBSTKV003', Serie);
  if (AlmacenStockV3 = '') then
     AlmacenStockV3 := 'NOCALC';
  if (AlmacenStockV3 <> 'NOCALC') then
     AlmacenStockV3 := Copy(AlmacenStockV3, 1, 3);

  AlmacenStockR := LeeParametro('ALBSTKR001', Serie);
  if (AlmacenStockR = '') then
     AlmacenStockR := 'NOCALC';
  if (AlmacenStockR <> 'NOCALC') then
     AlmacenStockR := Copy(AlmacenStockR, 1, 3);

  AlmacenStockR2 := LeeParametro('ALBSTKR002', Serie);
  if (AlmacenStockR2 = '') then
     AlmacenStockR2 := 'NOCALC';
  if (AlmacenStockR2 <> 'NOCALC') then
     AlmacenStockR2 := Copy(AlmacenStockR2, 1, 3);

  AlmacenStockR3 := LeeParametro('ALBSTKR003', Serie);
  if (AlmacenStockR3 = '') then
     AlmacenStockR3 := 'NOCALC';
  if (AlmacenStockR3 <> 'NOCALC') then
     AlmacenStockR3 := Copy(AlmacenStockR3, 1, 3);

  AlmacenStockM := LeeParametro('ALBSTKM002', Serie);
  if (AlmacenStockM = '') then
     AlmacenStockM := 'NOCALC';
  if (AlmacenStockM <> 'NOCALC') then
     AlmacenStockM := Copy(AlmacenStockM, 1, 3);

  AlmacenStockM2 := LeeParametro('ALBSTKM003', Serie);
  if (AlmacenStockM2 = '') then
     AlmacenStockM2 := 'NOCALC';
  if (AlmacenStockM2 <> 'NOCALC') then
     AlmacenStockM2 := Copy(AlmacenStockM2, 1, 3);

  AlmacenStockM3 := LeeParametro('ALBSTKM004', Serie);
  if (AlmacenStockM3 = '') then
     AlmacenStockM3 := 'NOCALC';
  if (AlmacenStockM3 <> 'NOCALC') then
     AlmacenStockM3 := Copy(AlmacenStockM3, 1, 3);

  AlmacenStockActual := (LeeParametro('ALBSTKA000', Serie) = 'S');
  AlmacenStockVirtual := (LeeParametro('ALBSTKV009', Serie) = 'S');
  AlmacenStockReal := (LeeParametro('ALBSTKR009', Serie) = 'S');
  AlmacenStockMontura := (LeeParametro('ALBSTKM001', Serie) = 'S');
  AlmacenStockRefBase := (LeeParametro('ALBSTKB001', Serie) = 'S');

  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005', Serie), 0);
  Param_DOCREFE003 := (LeeParametro('DOCREFE003', Serie) = 'S');
  Param_CLIREFE001 := (LeeParametro('CLIREFE001', Serie) = 'S');
  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
  Param_DOCPREC002 := (LeeParametro('DOCPREC002', Serie) = 'S');
  Param_DOCPREC003 := (LeeParametro('DOCPREC003', Serie) = 'S');
  Param_VENARTU001 := (LeeParametro('VENARTU001', Serie) = 'S');
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', Serie), 0);
  param_VENPREC001 := (LeeParametro('VENPREC001', Serie) = 'S');
  param_VENPREC002 := (LeeParametro('VENPREC002', Serie) = 'S');
  param_VENUSEC001 := (LeeParametro('VENUSEC001', Serie) = 'S');
  Param_ALBLSIM001 := (LeeParametro('ALBLSIM001', Serie) = 'S');
  param_DOCDESC001 := StrToFloatDef(LeeParametro('DOCDESC001', Serie), -1);
  param_ALBNOST001 := (LeeParametro('ALBNOST001', Serie) = 'S');
  param_ALBMAXL001 := StrToIntDef(LeeParametro('ALBMAXL001', Serie), 0);
  param_VENCONT001 := (LeeParametro('VENCONT001', Serie) = 'S');
  param_ALBETIQ001 := StrToIntDef(LeeParametro('ALBETIQ001', Serie), 0);
  param_ALBETIQ002 := (LeeParametro('ALBETIQ002', Serie) = 'S');
  param_VENAGEN001 := (LeeParametro('VENAGEN001', Serie) = 'S');

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

     if (LeeParametro('ALBULTD001', Serie) = 'S') then
        Last;
  end;
end;

procedure TDMAlbaranes.PreparaNotasDetalle;
begin
  // DMMain.Log('TDMAlbaranes.PreparaNotasDetalle');
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

procedure TDMAlbaranes.Procedencia;
begin
  // DMMain.Log('TDMAlbaranes.Procedencia');
  QSPProcedencia.Close;
  QSPProcedencia.Open;

  Application.CreateForm(TFCProcedencia, FCProcedencia);
  FCProcedencia.DBGProcedencia.DataSource := DSQSPProcedencia;
  FCProcedencia.ShowModal;

  QSPProcedencia.Close;
end;

procedure TDMAlbaranes.RefrescaDetalle;
begin
  // DMMain.Log('TDMAlbaranes.RefrescaDetalle');
  if (QMCabecera.RecordCount <> 0) then
  begin
     RefrescaTarifa;
     with SPRefrescaDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := 'ALB';
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

procedure TDMAlbaranes.RefrescaTarifa;
begin
  // DMMain.Log('TDMAlbaranes.RefrescaTarifa');
  with xCliente do
  begin
     Close;
     Open;
     EntornoDoc.Tarifa := QMCabeceraTARIFA.AsString;
     EntornoDoc.Cliente := QMCabeceraCLIENTE.AsInteger;
  end;
end;

procedure TDMAlbaranes.Etiquetas(serie: string);
var
  fecha : TDateTime;
  copias, eje, cab : integer;
begin
  // DMMain.Log('TDMAlbaranes.Etiquetas');
  { copias := QMCabeceraBULTOS.AsInteger + 2; dji lrk kri}
  copias := QMCabeceraBULTOS_KRI.AsInteger;
  fecha := QMCabeceraFECHA.AsDateTime;
  cab := QMCabeceraRIG.AsInteger;
  eje := QMCabeceraEJERCICIO.AsInteger; {dji lrk kri}
  TFPregEtiAlbaran.Create(Self).Muestra(copias, fecha, 'ALB', eje{dji lrk kri}, cab, serie);
end;

procedure TDMAlbaranes.CambiaUnidadesExt(Articulo: TField; Modo, Mostrar: boolean);
var
  Tarifa : string;
  Estado, Cliente : integer;
  Unidades, Precio, UnidadesExt_Old : double;
  Articulo_Old : string;
  ForzarPrecio : boolean;
begin
  // DMMain.Log('TDMAlbaranes.CambiaUnidadesExt');
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

procedure TDMAlbaranes.CambiaPreciosTarifa;
var
  Bueno, Abierto : boolean;
  Valor : double;
begin
  // DMMain.Log('TDMAlbaranes.CambiaPreciosTarifa');
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     if not (QMDetalle.State in [dsEdit, dsInsert]) then
        QMDetalle.Edit;
     Abierto := True;
  end
  else
     Abierto := False;

  Valor := DevuelvePrecio(1, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString, Bueno,
     QMCabeceraMONEDA.AsString, QMCabeceraFECHA.AsDateTime,
     QMDetalleID_A.AsInteger);
  if (Bueno and Abierto) then
     QMDetallePrecio.AsFloat := Valor;
end;

procedure TDMAlbaranes.DatosStocks(var Articulo, Almacen: string);
begin
  // DMMain.Log('TDMAlbaranes.DatosStocks');
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
end;

procedure TDMAlbaranes.Historico;
begin
  // DMMain.Log('TDMAlbaranes.Historico');
  if QMDetalleArticulo.AsString <> '' then
  begin
     FInfoHistorico := TFInfoHistorico.Create(Self);
     FInfoHistorico.Mostrar(QMCabeceraSERIE.AsString,
        QMDetalleARTICULO.AsString, QMCabeceraCLIENTE.AsInteger, 0);
     FInfoHistorico.Free;
  end;
end;

procedure TDMAlbaranes.BorraLineaUnidadesExt;
begin
  // DMMain.Log('TDMAlbaranes.BorraLineaUnidadesExt');
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

procedure TDMAlbaranes.DatosHerencia(var rig, ejercicio: integer; var tipo, su_referencia, titulo, serie: string);
begin
  // DMMain.Log('TDMAlbaranes.DatosHerencia');
  Rig := QMCabeceraRIG.AsInteger;
  Tipo := QMCabeceraTIPO.AsString;
  Su_Referencia := QMCabeceraSU_REFERENCIA.AsString;
  Serie := QMCabeceraSERIE.AsString;
  Titulo := xCliente.FieldByName('TITULO').AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
end;

procedure TDMAlbaranes.DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
begin
  // DMMain.Log('TDMAlbaranes.DatosSerializacion');
  Serie := QMCabeceraSERIE.AsString;
  Tipo := QMCabeceraTIPO.AsString;
  Rig := QMCabeceraRIG.AsInteger;
  Linea := QMDetalleLINEA.AsInteger;
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
  Fecha := QMCabeceraFECHA.AsDateTime;
  Unidades := QMDetalleUNIDADES.AsFloat;
  Estado := QMCabeceraESTADO.AsInteger;
  Devolucion := integer(QMDetalleUNIDADES.AsFloat < 0);
  Ejercicio := QMCabeceraEjercicio.AsInteger;
end;

procedure TDMAlbaranes.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  // DMMain.Log('TDMAlbaranes.BusquedaArticulo');
  evt := QMDetalleARTICULO.OnChange;
  try
     QMDetalleARTICULO.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN.AsString, QMCabeceraCLIENTE.AsInteger, QMDetalleNSERIE);
     NumSerie := True;
  finally
     QMDetalleARTICULO.OnChange := evt;
  end;
end;

procedure TDMAlbaranes.VaciaNumSerie;
begin
  // DMMain.Log('TDMAlbaranes.VaciaNumSerie');
  QMDetalleNSERIE.AsString := '';
end;

procedure TDMAlbaranes.BuscaNumSerie(NroSerie: string; Filtrar: boolean);
begin
  // DMMain.Log('TDMAlbaranes.BuscaNumSerie');
  // NSerie := NroSerie;
  if Filtrar then
  begin
     QMCabecera.Close;
     QMCabecera.SelectSQL.Text := '';
  end;

  ModificaSelect(QMCabecera, ' SELECT * FROM VER_CABECERAS_ALBARAN WHERE EMPRESA=?EMPRESA' +
     ' AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=''ALB''' +
     ' AND RIG IN (SELECT RIG FROM VER_DETALLE_SERIALIZACION ' +
     ' WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
     REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr +
     ' AND TIPO=''ALB'' AND SERIE=''' + Serie + ''' AND NSERIE =?NSERIE)', Filtrar);

  if (not Filtrado) then
     DMMain.FiltraTabla(QMCabecera, '11100', False);

  QMCabecera.Params.ByName['SERIE'].AsString := Serie;
  if (Pos('NSERIE', QMCabecera.SelectSQL.Text) > 0) then
     QMCabecera.Params.ByName['NSERIE'].AsString := NroSerie;

  QMCabecera.Open;
  if ((QMCabecera.RecordCount = 0) and Filtrar) then
  begin
     Application.MessageBox(PChar(string(Format(_('No se han encontrado documentos con el numero de serie %s'), [NroSerie]))),
        PChar(string(_('ATENCION!'))), MB_OK + mb_IconStop);

     with QMCabecera do
     begin
        Close;
        SelectSQL.Text := SQLBase;

        if (REntorno.Pais = 'CHL') then
           SelectSQL.Add(' ORDER BY EJERCICIO, FECHA DESC, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
        else
           SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

        DMMain.FiltraTabla(QMCabecera, '11100', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
        Last;
     end;
  end;
end;

function TDMAlbaranes.Inhabilitar: boolean;
begin
  // DMMain.Log('TDMAlbaranes.Inhabilitar');
  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     Result := True
  else
     Result := False;
end;

procedure TDMAlbaranes.EstaleceCondiciones(Articulo: TField; Precio: double; Forzar: boolean = False);
var
  Modo : integer;
begin
  DMMain.LogIni('TDMAlbaranes.EstaleceCondiciones');
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

procedure TDMAlbaranes.QMDetalleUNIDADESChange(Sender: TField);
var
  FactorUnidad : double;
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleUNIDADESChange');
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

  CalculaComisionKRI20;
end;

procedure TDMAlbaranes.CalculaUnidades(pvp: double);
var
  precio : double;
begin
  // DMMain.Log('TDMAlbaranes.CalculaUnidades');
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

function TDMAlbaranes.DameEstado: smallint;
begin
  // DMMain.Log('TDMAlbaranes.DameEstado');
  if ((QMDetalleARTICULO.AsString <> '') and (QMDetallePRECIO.AsFloat <> 0) and
     (QMCabecera.State <> dsInsert) and (QMCabecera.State <> dsEdit) and
     ((QMDetalle.RecordCount > 0) or ((QMDetalle.RecordCount = 0) and
     (QMDetalle.State = dsInsert)))) then
     Result := QMCabeceraESTADO.AsInteger
  else
     Result := 1;
end;

function TDMAlbaranes.Serializado: boolean;
begin
  // DMMain.Log('TDMAlbaranes.Serializado');
  // Primero miro si el articulo es serializado
  Result := (xArticulos.FieldByName('SERIALIZADO').AsInteger = 1);

  // Si no lo es, miro el detalle de su escandallo
  if not Result then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 D.SERIALIZADO FROM ART_ARTICULOS_ESCANDALLO E ');
           SQL.Add(' JOIN ART_ARTICULOS D ON E.EMPRESA = D.EMPRESA AND E.DETALLE = D.ARTICULO ');
           SQL.Add(' WHERE ');
           SQL.Add(' E.EMPRESA = :EMPRESA AND ');
           SQL.Add(' E.ARTICULO = :ARTICULO AND ');
           SQL.Add(' D.SERIALIZADO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           Result := (FieldByName['SERIALIZADO'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAlbaranes.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleAfterOpen');
  xArticulos.Open;
  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranes.AgrupacionPedidos(Serie: string; Contador: integer);
begin
  // DMMain.Log('TDMAlbaranes.AgrupacionPedidos');
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT VER.* FROM VER_CABECERAS_ALBARAN VER');
     SelectSQL.Add(' JOIN TMP_PROCESOS_AUTO TMP ON ');
     SelectSQL.Add(' VER.EMPRESA=TMP.EMPRESA AND ');
     SelectSQL.Add(' VER.EJERCICIO=TMP.EJERCICIO AND ');
     SelectSQL.Add(' VER.CANAL=TMP.CANAL AND ');
     SelectSQL.Add(' VER.SERIE=TMP.SERIE AND ');
     SelectSQL.Add(' VER.TIPO=TMP.TIPO AND ');
     SelectSQL.Add(' VER.RIG=TMP.RIG ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' VER.EMPRESA=?EMPRESA AND ');
     SelectSQL.Add(' VER.EJERCICIO=?EJERCICIO AND ');
     SelectSQL.Add(' VER.CANAL=?CANAL AND ');
     SelectSQL.Add(' VER.SERIE=?SERIE AND ');
     SelectSQL.Add(' VER.TIPO=''ALB'' AND ');
     SelectSQL.Add(' TMP.CONTADOR=' + IntToStr(Contador));

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

procedure TDMAlbaranes.LimpiaProcAuto;
begin
  // DMMain.Log('TDMAlbaranes.LimpiaProcAuto');
  // Borramos los registros correspondientes de la tabla temporal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PROCESOS_AUTO WHERE ENTRADA = :ENTRADA AND TIPO = ''ALB''';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAlbaranes.Traspasado: boolean;
begin
  // DMMain.Log('TDMAlbaranes.Traspasado');
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
procedure TDMAlbaranes.RefrescaTabla;
begin
  // DMMain.Log('TDMAlbaranes.RefrescaTabla');
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     QMCabecera.Refresh;
     QMDetalle.EnableControls;
  end;
end;

procedure TDMAlbaranes.AnulaDocumento;
begin
  // DMMain.Log('TDMAlbaranes.AnulaDocumento');
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

procedure TDMAlbaranes.CambiaMonedaDetalle;
begin
  // DMMain.Log('TDMAlbaranes.CambiaMonedaDetalle');
  if ((QMCabecera.RecordCount <> 0) and (QMDetalle.RecordCount <> 0)) then
  begin
     with SPCambiaMoneda do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['MONEDAOLD'].AsString := moneda_old;
        TFParada.Create(Self).ExecQuery(SPCambiaMoneda);
        FreeHandle;
     end;
     QMCabecera.Refresh;
  end;
end;

procedure TDMAlbaranes.MascarasMoneda;
begin
  // DMMain.Log('TDMAlbaranes.MascarasMoneda');
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  QMCabeceraLIQUIDO.DisplayFormat := LocalMascaraN;
  QMCabeceraC_TOTAL.DisplayFormat := LocalMascaraN;
  QMCabeceraVALOR_CAMB_FIJO.DisplayFormat := '0.000000';
  QMCabeceraVALOR_CAMB_FIJO_INV.DisplayFormat := '0.000000';
  QMCabeceraTOTAL_ANTICIPADO.DisplayFormat := MascaraN;

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
  xInfoActualizadaTOTAL_ANTICIPADO.DisplayFormat := MascaraN;

  QMDetalleCOMISION_LINEAL.DisplayFormat := LocalMascaraN;
  QMDetalleI_COMISION_LINEAL.DisplayFormat := LocalMascaraN;
  QMDetalleC_RECARGO.DisplayFormat := LocalMascaraN;
  QMDetalleM_BRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleLIQUIDO.DisplayFormat := LocalMascaraN;
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraN;
  QMDetalleCOSTE_ADICIONAL.DisplayFormat := LocalMascaraN;
  QMDetalleBRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleT_COSTE.DisplayFormat := LocalMascaraN;
  QMDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraN;
  QMDetalleC_IVA.DisplayFormat := LocalMascaraN;
  QMDetallePRECIO.DisplayFormat := LocalMascaraL;
  QMDetalleI_DESCUENTO.DisplayFormat := LocalMascaraL;
  QMDetalleB_DTO_LINEA.DisplayFormat := LocalMascaraL;
  QMDetalleI_COMISION.DisplayFormat := LocalMascaraL;
  QMDetalleB_COMISION.DisplayFormat := LocalMascaraL;

  xProveedoresPRECIO.DisplayFormat := LocalMascaraL;
end;

procedure TDMAlbaranes.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraTOTAL_CANALGetText');
  Text := FormatFloat(DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1),
     QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMAlbaranes.QMCabeceraTARIFAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraTARIFAChange');
  EntornoDoc.Tarifa := QMCabeceraTARIFA.AsString;
end;

procedure TDMAlbaranes.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  // DMMain.Log('TDMAlbaranes.FiltraCabecera');
  with QMCabecera do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM VER_CABECERAS_ALBARAN ');
        Add(' WHERE ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' SERIE = ?SERIE AND ');
        Add(' TIPO = ''ALB'' AND ');
        Add(' RIG = ?RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

procedure TDMAlbaranes.FiltraCabeceraALFACliente(Alfa: integer; Valor: string; Fecha: TDateTime);
begin
  /// Filtra albaranes de una fecha determinada que tengan un valor determinado en uno de los campos ALFA del cliente.

  // DMMain.Log('TDMAlbaranes.FiltraCabeceraALFACliente');
  with QMCabecera do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM VER_CABECERAS_ALBARAN ');
        Add(' WHERE ');
        Add(' EMPRESA = :EMPRESA AND ');
        Add(' EJERCICIO = :EJERCICIO AND ');
        Add(' CANAL = :CANAL AND ');
        Add(' SERIE = :SERIE AND ');
        Add(' TIPO = ''ALB'' AND ');
        Add(' CAST(EXTRACT(YEAR FROM FECHA) || ''.'' || EXTRACT(MONTH FROM FECHA) || ''.'' || EXTRACT(DAY FROM FECHA) AS DATE) = ');
        Add('    CAST(EXTRACT(YEAR FROM CAST(:FECHA AS DATE)) || ''.'' || EXTRACT(MONTH FROM CAST(:FECHA AS DATE)) || ''.'' || EXTRACT(DAY FROM CAST(:FECHA AS DATE)) AS DATE) AND ');
        Add(' CLIENTE IN (SELECT CLIENTE ');
        Add('             FROM EMP_CLIENTES ');
        Add('             WHERE ');
        Add('             EMPRESA = :EMPRESA AND ');
        Add(format('      ALFA_%d = :ALFA) ', [Alfa]));
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['ALFA'].AsString := Valor;
     Open;
  end;
end;

function TDMAlbaranes.HayDocumentos: boolean;
begin
  // DMMain.Log('TDMAlbaranes.HayDocumentos');
  Result := QMCabecera.Active and (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMAlbaranes.HayDetalle: boolean;
begin
  // DMMain.Log('TDMAlbaranes.HayDetalle');
  try
     Result := (QMDetalle.Active and (QMDetalle.RecordCount > 0));
  except
     // DMMain.Log('TDMAlbaranes.HayDetalle - *Exception*');
     Result := False;
  end;
end;

procedure TDMAlbaranes.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraAfterInsert');
  moneda_old := QMCabeceraMONEDA.AsString;
end;

procedure TDMAlbaranes.InfoLotes;
(*
var
  IntroduceLotes : TFMIntroduceLotes;
  aIdLote : integer;
*)
begin
  // DMMain.Log('TDMAlbaranes.InfoLotes');
  if ((QMDetalle.State = dsBrowse) {and (ArticuloLoteable(QMDetalleARTICULO.AsString))}) then
  begin
     with TFMAsignaLotes.Create(Self) do
     begin
        try
           AsignaDocumento(QMDetalleTIPO.AsString, QMDetalleID_DETALLES_S.AsInteger, (QMCabeceraESTADO.AsInteger = 0));
        finally
           Free;
        end;
     end;

     (*
     if (QMDetalle.State = dsBrowse) then
        QMDetalle.Edit;
     IntroduceLotes := TFMIntroduceLotes.Create(Self);
     try
        with IntroduceLotes do
        begin
           aIdLote := AsignaArticulo(QMDetalleTIPO.AsString,
              QMDetalleSERIE.AsString,
              QMDetalleARTICULO.AsString, QMDetalleEJERCICIO.AsInteger,
              QMDetalleRIG.AsInteger,
              QMDetalleLINEA.AsInteger, QMDetalleUNIDADES.AsFloat,
              QMCabeceraALMACEN.AsString,
              QMCabeceraALMACEN.AsString, QMCabeceraCANAL.AsInteger,
              QMCabeceraCANAL.AsInteger,
              (QMCabeceraESTADO.AsInteger = 0), QMDetalleID_A.AsInteger,
              QMDetalleID_DETALLES_S.AsInteger, 0, False);

           if (aIdLote <> 0) then
              QMDetalleID_LOTE.AsInteger := aIdLote;

           {Informo la ubicacion seleccionada en la seleccion de lote}
           if (ArticuloUbicable(QMDetalleARTICULO.AsString)) then
              QMDetalleID_UBICACION.AsInteger := IntroduceLotes.IDUbicacion;
        end;
     finally
        IntroduceLotes.Free;
     end;
     *)

     CierraAbreDet;
  end;
end;

procedure TDMAlbaranes.GrabaDetalle(DataSet: TDataSet);
var
  i, UnidadesEnteras : integer;
begin
  // DMMain.Log('TDMAlbaranes.GrabaDetalle');

  // El stock del artículo para actualizar el grid
  ReiniciaStock(QMDetalleARTICULO.AsString);

  DataSet.Refresh;
  InfoActualiza;

  if (QMDetalleID_LOTE.AsInteger = 0) then
     InfoLotes;

  if ((Serializado) and (SerializadoAuto) and not (NumSerie)) then
     AbreSerializadoAuto;

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

  if xCliente.Active and (xCliente.FieldByName('IMPORTE_MINIMO_PORTE').AsFloat <> 0) then
     AjustaPorteMinimo;

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

  CierraAbreDet;

  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranes.AjustaPorteMinimo;
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

procedure TDMAlbaranes.RefrescaIRPF;
begin
  // DMMain.Log('TDMAlbaranes.RefrescaIRPF');
  with xTipoIRPF do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IRPF'].AsInteger := QMCabeceraTIPO_IRPF.AsInteger;
     Open;
  end;

  DamePorIRPF;
end;

procedure TDMAlbaranes.DamePorIRPF;
var
  base : byte;
begin
  // DMMain.Log('TDMAlbaranes.DamePorIRPF');
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

procedure TDMAlbaranes.QMCabeceraTIPO_IRPFChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraTIPO_IRPFChange');
  RefrescaIRPF;
end;

procedure TDMAlbaranes.EditarNroDeSerieKri;
var
  NSerie : TFMNumerosDeSerieKri;
  Garantia : boolean;
  Serializado_kri : boolean;
begin
  // DMMain.Log('TDMAlbaranes.EditarNroDeSerieKri');
  serializado_kri := True;
  if DMMain.EstadoKri(161) = 1 then
  begin
     if (xArticulos.FieldByName('SERIALIZADO_KRI').AsInteger = 0) then
        serializado_kri := False;
  end;
  if serializado_kri then
  begin
     NSerie := TFMNumerosDeSerieKri.Create(Self);
     Garantia := False;
     NSerie.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        REntorno.Canal,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN.AsString,
        QMCabeceraCLIENTE.AsInteger,
        QMDetalleUNIDADES.AsInteger,
        0,  {ESCANDALLO}
        garantia,
        True); {ForzarEntrada}
     NSerie.Release;
  end;
end;

procedure TDMAlbaranes.EditarLoteKri;
var
  Lotes : TFMLotesVentaKri;
  Lotes_kri : boolean;
begin
  // DMMain.Log('TDMAlbaranes.EditarLoteKri');
  lotes_kri := True;
  if DMMain.EstadoKri(161) = 1 then
  begin
     if (xArticulos.FieldByName('LOTES_KRI').AsInteger = 0) then
        lotes_kri := False;
  end;
  if lotes_kri then
  begin
     Lotes := TFMLotesVentaKri.Create(Self);
     Lotes.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        REntorno.Canal,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN.AsString,
        QMCabeceraCLIENTE.AsInteger,
        QMDetalleUNIDADES.AsInteger,
        False,  {ESCANDALLO}
        True);  {ForzarEntrada}
     Lotes.Release;
  end;
end;

procedure TDMAlbaranes.AgrupaAlbaranesFiltradosKri;
var
  id_s : integer;
  agrupacion : integer;
  agrupacionMin : integer;
  YaAsignados : string;
begin
  // DMMain.Log('TDMAlbaranes.AgrupaAlbaranesFiltradosKri');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(ID_S_AG) FROM GES_CABECERAS_S_AGRUP WHERE EMPRESA = ' + REntorno.EmpresaStr +
           ' AND CANAL = ''' + REntorno.CanalStr + ''' AND TIPO = ''ALB''';
        ExecQuery;
        agrupacionMin := FieldByName['MIN'].AsInteger;
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
        SQL.Text := 'SELECT MAX(ID_S_AG) FROM GES_CABECERAS_S_AGRUP ';
        ExecQuery;
        agrupacion := FieldByName['MAX'].AsInteger + 1;
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
        SQL.Text := 'INSERT INTO GES_CABECERAS_S_AGRUP (EMPRESA,CANAL,TIPO,ID_S_AG) VALUES (' +
           REntorno.EmpresaStr + ',' + REntorno.CanalStr + ',''ALB'',' + IntToStr(agrupacion) + ')';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  YaAsignados := '';
  with QMCabecera do
  begin
     DisableControls;
     try
        id_s := QMCabeceraID_S.AsInteger;
        First;
        while not EOF do
        begin
           if (QMCabeceraAGRUPACION_KRI.AsInteger <= agrupacionMin) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE GES_CABECERAS_S_AGRUP_DET SET ID_S_AG = ' + IntToStr(agrupacion) +
                       ' WHERE ID_S = ' + QMCabeceraID_S.AsString;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Refresh;
           end
           else
              YaAsignados := YaAsignados + QMCabeceraRIG.AsString + ', ';
           Next;
        end;
        while ((not BOF) and (QMCabeceraID_S.AsInteger <> id_s)) do
           Prior;
     finally
        EnableControls;
     end;
     if (YaAsignados > '') then
        MessageDlg(Format(_('Estos Albaranes ya habían sido asignados:' + #13#10 + '%s'), [YaAsignados]), mtInformation, [mbOK], 0);
  end;
end;

procedure TDMAlbaranes.QMCartaPortesAfterOpen(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesAfterOpen');
  xTransportistaCarta.Open;
  xOrigen.Open;
  QMNaturaleza.Open;
  QMMatriculas.Open;
end;

procedure TDMAlbaranes.QMCartaPortesCARGADORAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesCARGADORAChange');
  QMCartaPortesDIR_CARGADORA.AsInteger := DMMain.DameMinDireccion(QMCartaPortesCARGADORA.AsInteger);
end;

procedure TDMAlbaranes.QMCartaPortesEXPEDIDORAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesEXPEDIDORAChange');
  QMCartaPortesDIR_EXPEDIDORA.AsInteger := DMMain.DameMinDireccion(QMCartaPortesEXPEDIDORA.AsInteger);
end;

procedure TDMAlbaranes.QMCartaPortesINTERMEDIARIAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesINTERMEDIARIAChange');
  QMCartaPortesDIR_INTERMEDIARIA.AsInteger := DMMain.DameMinDireccion(QMCartaPortesINTERMEDIARIA.AsInteger);
end;

procedure TDMAlbaranes.QMCartaPortesTRANSPORTISTAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesTRANSPORTISTAChange');
  with xTransportistaCarta do
  begin
     Close;
     Open;
  end;

  QMCartaPortesDIR_TRANSPORTISTA.AsInteger := DMMain.DameMinDireccion(xTransportistaCartaTERCERO.AsInteger);
end;

procedure TDMAlbaranes.QMCartaPortesDESTINATARIOChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesDESTINATARIOChange');
  QMCartaPortesDIR_DESTINATARIO.AsInteger := DMMain.DameMinDireccion(QMCartaPortesDESTINATARIO.AsInteger);
end;

procedure TDMAlbaranes.QMMatriculasMATRICULAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMMatriculasMATRICULAChange');
  with QTituloMatricula do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['MATRICULA'].AsString := QMMatriculas.FieldByName('MATRICULA').AsString;
     ExecQuery;
     QMMatriculasTITULO.AsString := QTituloMatricula.FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMAlbaranes.QMNaturalezaNATURALEZAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMNaturalezaNATURALEZAChange');
  with QTituloNaturaleza do
  begin
     Close;
     Params.ByName['NATURALEZA'].AsInteger := QMNaturaleza.FieldByName('NATURALEZA').AsInteger;
     ExecQuery;
     QMNaturalezaTITULO.AsString := QTituloNaturaleza.FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMAlbaranes.QMMatriculasNewRecord(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMMatriculasNewRecord');
  QMMatriculasEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMMatriculasEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMMatriculasCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMMatriculasSERIE.AsString := QMCabeceraSERIE.AsString;
  QMMatriculasTIPO.AsString := QMCabeceraTIPO.AsString;
  QMMatriculasRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMMatriculasID_S.AsInteger := QMCabeceraID_S.AsInteger;
end;

procedure TDMAlbaranes.QMNaturalezaNewRecord(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMNaturalezaNewRecord');
  QMNaturalezaEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMNaturalezaEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMNaturalezaCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMNaturalezaSERIE.AsString := QMCabeceraSERIE.AsString;
  QMNaturalezaTIPO.AsString := QMCabeceraTIPO.AsString;
  QMNaturalezaRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMNaturalezaID_S.AsInteger := QMCabeceraID_S.AsInteger;
end;

procedure TDMAlbaranes.QMCartaPortesAfterInsert(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesAfterInsert');
  Matricula := '';
  TituloMatricula := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 MATRICULA, TITULO ');
        SQL.Add(' FROM EMP_MATRICULAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TRANSPORTISTA = :TRANSPORTISTA AND ');
        SQL.Add(' DEFECTO = 1 ');
        SQL.Add(' ORDER BY MATRICULA ');
        Params.ByName['EMPRESA'].AsInteger := QMCartaportesEMPRESA.AsInteger;
        Params.ByName['TRANSPORTISTA'].AsInteger := QMCartaportesTRANSPORTISTA.AsInteger;
        ExecQuery;
        Matricula := FieldByName['MATRICULA'].AsString;
        TituloMatricula := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Matricula > '') then
  begin
     with QMMatriculas do
     begin
        Insert;
        QMMatriculasMATRICULA.AsString := Matricula;
        QMMatriculasTITULO.AsString := TituloMatricula;
     end;
  end;

  TituloNaturaleza := '';
  Naturaleza := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 NATURALEZA, TITULO ');
        SQL.Add(' FROM SYS_NATURALEZA_CARGA ');
        SQL.Add(' WHERE ');
        SQL.Add(' DEFECTO = 1 ');
        ExecQuery;
        Naturaleza := FieldByName['NATURALEZA'].AsInteger;
        TituloNaturaleza := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (TituloNaturaleza > '') then
  begin
     with QMNaturaleza do
     begin
        Insert;
        QMNaturalezaNATURALEZA.AsInteger := Naturaleza;
        QMNaturalezaTITULO.AsString := TituloNaturaleza;
     end;
  end;

  InsertNatDesdePortes := True;
  InsertMatDesdePortes := True;
end;

procedure TDMAlbaranes.QMMatriculasAfterInsert(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMMatriculasAfterInsert');
  if (QMCartaportesTRANSPORTISTA.AsString <> '') then
  begin
     if not (InsertMatDesdePortes) and (QMCartaportesTRANSPORTISTA.AsString <> '') then
     begin
        Matricula := '';
        TituloMatricula := '';

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FIRST 1 MATRICULA, TITULO ');
              SQL.Add(' FROM EMP_MATRICULAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' DEFECTO = 1 AND ');
              SQL.Add(' TRANSPORTISTA = :TRANSPORTISTA AND ');
              SQL.Add(' (MATRICULA NOT IN (SELECT MATRICULA ');
              SQL.Add('                    FROM GES_CABECERAS_S_MAT MAT ');
              SQL.Add('                    WHERE ');
              SQL.Add('                    MAT.ID_S = :ID_S)) ');
              Params.ByName['EMPRESA'].AsInteger := QMCartaportesEMPRESA.AsInteger;
              Params.ByName['TRANSPORTISTA'].AsInteger := QMCartaportesTRANSPORTISTA.AsInteger;
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              ExecQuery;
              Matricula := FieldByName['MATRICULA'].AsString;
              TituloMatricula := FieldByName['TITULO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        if (Matricula > '') then
           with QMMatriculas do
           begin
              QMMatriculasMATRICULA.AsString := Matricula;
              QMMatriculasTITULO.AsString := TituloMatricula;
              InsertMatDesdePortes := False;
           end;
     end;
  end;
end;

procedure TDMAlbaranes.QMNaturalezaAfterInsert(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMNaturalezaAfterInsert');
  if not InsertNatDesdePortes then
  begin
     TituloNaturaleza := '';
     Naturaleza := 0;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 NATURALEZA, TITULO ');
           SQL.Add(' FROM SYS_NATURALEZA_CARGA ');
           SQL.Add(' WHERE ');
           SQL.Add(' DEFECTO = 1 AND ');
           SQL.Add(' (NATURALEZA NOT IN (SELECT NATURALEZA ');
           SQL.Add('                     FROM GES_CABECERAS_S_NAT NAT ');
           SQL.Add('                     WHERE ');
           SQL.Add('                     NAT.ID_S = :ID_S)) ');
           Params.ByName['ID_S'].AsInteger := QMNaturalezaID_S.AsInteger;
           ExecQuery;
           Naturaleza := FieldByName['NATURALEZA'].AsInteger;
           TituloNaturaleza := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     if (TituloNaturaleza > '') then
        with QMNaturaleza do
        begin
           QMNaturalezaNATURALEZA.AsInteger := Naturaleza;
           QMNaturalezaTITULO.AsString := TituloNaturaleza;
           InsertNatDesdePortes := False;
        end;
  end;
end;

procedure TDMAlbaranes.QMCartaPortesAfterCancel(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesAfterCancel');
  if (QMMatriculas.State = dsInsert) then
     QMMatriculas.Cancel;
  if (QMNaturaleza.State = dsInsert) then
     QMNaturaleza.Cancel;

  QMCabecera.Refresh;
end;

procedure TDMAlbaranes.GrabaMatNat(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.GrabaMatNat');
  if (QMMatriculas.State = dsInsert) then
     QMMatriculas.Post;
  if (QMNaturaleza.State = dsInsert) then
     QMNaturaleza.Post;

  QMCabecera.Refresh;
  InfoActualiza;
end;

procedure TDMAlbaranes.QMCartaPortesNewRecord(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesNewRecord');
  QMCartaPortesEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMCartaPortesEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMCartaPortesCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMCartaPortesSERIE.AsString := QMCabeceraSERIE.AsString;
  QMCartaPortesTIPO.AsString := QMCabeceraTIPO.AsString;
  QMCartaPortesRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMCartaPortesID_S.AsInteger := QMCabeceraID_S.AsInteger;
  QMCartaPortesCARGADORA.AsInteger := REntorno.Tercero;
  QMCartaPortesEXPEDIDORA.AsInteger := REntorno.Tercero;
  QMCartaPortesINTERMEDIARIA.AsInteger := REntorno.Tercero;
  QMCartaPortesTRANSPORTISTA.AsInteger := QMCabeceraTRANSPORTISTA.AsInteger;
  QMCartaPortesFECHA_TRANSPORTE.AsDateTime := QMCabeceraFECHA.AsDateTime;

  QMCartaPortesDIR_CARGADORA.AsInteger := DMMain.DameMinDireccion(QMCartaPortesCARGADORA.AsInteger);
  QMCartaPortesDIR_EXPEDIDORA.AsInteger := DMMain.DameMinDireccion(QMCartaPortesEXPEDIDORA.AsInteger);
  QMCartaPortesDIR_INTERMEDIARIA.AsInteger := DMMain.DameMinDireccion(QMCartaPortesINTERMEDIARIA.AsInteger);
  QMCartaPortesDIR_TRANSPORTISTA.AsInteger := DMMain.DameMinDireccion(xTransportistaCartaTERCERO.AsInteger);

  // Direccion de entrega del albaran
  QMCartaPortesDESTINATARIO.AsInteger := QMCabeceraTERCERO.AsInteger;
  QMCartaPortesDIR_DESTINATARIO.AsInteger := QMCabeceraDIRECCION.AsInteger;
  QMCartaPortesDESTINO.AsInteger := QMCabeceraDIRECCION.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(DET.BULTOS) BULTOS, SUM((ART.PESO) * (DET.UNIDADES)) PESO , SUM((ART.VOLUMEN_UNIT) * (DET.UNIDADES)) VOLUMEN ');
        SQL.Add(' FROM GES_DETALLES_S DET ');
        SQL.Add(' JOIN ART_ARTICULOS ART ');
        SQL.Add(' ON (DET.ID_A = ART.ID_A) ');
        SQL.Add(' WHERE ');
        SQL.Add(' DET.ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;

        if (FieldByName['BULTOS'].AsFloat = 0) then
           QMCartaPortesBULTOS.AsFloat := 1
        else
           QMCartaPortesBULTOS.AsFloat := FieldByName['BULTOS'].AsFloat;

        if (FieldByName['PESO'].AsFloat = 0) then
           QMCartaPortesPESO.AsFloat := 1
        else
           QMCartaPortesPESO.AsFloat := FieldByName['PESO'].AsFloat;

        QMCartaPortesVOLUMEN.AsFloat := FieldByName['VOLUMEN'].AsFloat;
        FreeHandle;
     finally;
        Free;
     end;
  end;
end;

procedure TDMAlbaranes.AbrirCartaPortes;
begin
  // DMMain.Log('TDMAlbaranes.AbrirCartaPortes');
  QMCartaPortes.Close;
  QMCartaPortes.Open;
end;

procedure TDMAlbaranes.CerrarCartaPortes;
begin
  // DMMain.Log('TDMAlbaranes.CerrarCartaPortes');
  QMCartaPortes.Close;
end;

procedure TDMAlbaranes.CancelarCarta;
begin
  // DMMain.Log('TDMAlbaranes.CancelarCarta');
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' DELETE FROM GES_CABECERAS_S_CGA WHERE ID_S = :ID_S ');
           Params.ByName['ID_S'].AsInteger := QMCartaPortesID_S.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on e: Exception do
        ShowMessage(_('Error a borrar carta de portes') + #13#10 + e.Message);
  end;
end;

function TDMAlbaranes.HayCartaPortes: boolean;
begin
  // DMMain.Log('TDMAlbaranes.HayCartaPortes');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 ID_S FROM GES_CABECERAS_S_CGA WHERE ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranes.GrabaCabCartaPortes;
begin
  // DMMain.Log('TDMAlbaranes.GrabaCabCartaPortes');
  GrabaCarta := not HayCartaPortes;
  if (GrabaCarta) then
  begin
     QMMatriculas.Cancel;
     QMNaturaleza.Cancel;
     GrabaCarta := False;
     if QMCartaPortes.State = dsBrowse then
        QMCartaPortes.Edit;
     QMCartaPortes.Post;
     QMCartaPortes.Edit;
     QMMatriculas.Insert;
     QMNaturaleza.Insert;
     if not CancelaCarta then
        CancelaCarta := True;
  end
  else
  begin
     QMCartaPortes.Close;
     QMCartaPortes.Open;
  end;
end;

procedure TDMAlbaranes.PreparaSerializacion;
begin
  // DMMain.Log('TDMAlbaranes.PreparaSerializacion');
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
end;

{ No se utiliza
function TDMAlbaranes.DameAlmacenDep: boolean;
begin
  Result := (QMCabecera.FieldByName('ALMACEN_DEPOSITO').AsString >= '000');
end;}

procedure TDMAlbaranes.Devuelve(SerieDestino: string);
var
  IdDevolucion : integer;
begin
  // DMMain.Log('TDMAlbaranes.Devuelve');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_ALB_S_DEVUELVE (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''ALB'', :RIG, :ENTRADA, :FECHA, :ID_S)';
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

  Posicionando := True;
  try
     Refrescar(QMCabecera, 'ID_S', IdDevolucion);
  finally
     Posicionando := False;
  end;
end;

procedure TDMAlbaranes.ControlaRestriccion;
begin
  // DMMain.Log('TDMAlbaranes.ControlaRestriccion');
  ControlaBorrado(QMCabeceraID_S.AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMAlbaranes.QMCartaPortesBeforeCancel(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesBeforeCancel');
  if CancelaCarta then
     CancelarCarta;
end;

procedure TDMAlbaranes.MuestraUbicacion;
var
  Peso, Volumen, Diametro : double;
  DS : TFIBDataSet;
begin
  // DMMain.Log('TDMAlbaranes.MuestraUbicacion');
  if ((CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) or
     (ArticuloLoteable(QMDetalleID_A.AsInteger)) or
     (ArticuloSerializado(QMDetalleID_A.AsInteger))) then
  begin
     TFMExtraeArticulos.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
        QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMDetalleID_DETALLES_S.AsInteger,
        QMDetalleID_A.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString,
        QMDetalleUNIDADES.AsFloat);
  end;

  {Escandallos}
  if (xArticulos.FieldByName('ABIERTO').AsInteger = 1) then
  begin
     {Creo un DataSet para recorrer los componentes del escandallo}
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT ID_A_DET, DETALLE, CANTIDAD FROM ART_ARTICULOS_ESCANDALLO WHERE ID_A = :ID_A ');
              Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
              Open;

              if (CompruebaCheckUbicaciones(DS.FieldByName('ID_A_DET').AsInteger, Peso, Volumen, Diametro) = 1) then
                 {Ubico el componente}
                 TFMExtraeArticulos.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
                    QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger,
                    QMDetalleRIG.AsInteger,
                    QMDetalleLINEA.AsInteger,
                    QMDetalleID_DETALLES_S.AsInteger,
                    DS.FieldByName('ID_A_DET').AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString,
                    QMDetalleUNIDADES.AsFloat * DS.FieldByName('CANTIDAD').AsInteger);

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
end;

procedure TDMAlbaranes.ExtraeArticulos;
var
  Peso, Volumen, Diametro : double;
  DS : TFIBDataSet;
begin
  // DMMain.Log('TDMAlbaranes.ExtraeArticulos');
  if ((CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) and (DMMain.CompruebaControlUbicacionAlmacen(QMDetalleALMACEN.AsString))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE A_ART_EXTRAE_ARTICULOS ');
           SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, ');
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
           Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
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

  {Escandallos}
  if (xArticulos.FieldByName('ABIERTO').AsInteger = 1) then
  begin
     {Creo un DataSet para recorrer los componentes del escandallo}
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT ID_A_DET, DETALLE, CANTIDAD FROM ART_ARTICULOS_ESCANDALLO WHERE ID_A = :ID_A');
              Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
              Open;

              if (CompruebaCheckUbicaciones(DS.FieldByName('ID_A_DET').AsInteger, Peso, Volumen, Diametro) = 1) then
              begin
                 {Ubico el componente}
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' EXECUTE PROCEDURE A_ART_EXTRAE_ARTICULOS ');
                       SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, ');
                       SQL.Add(' :ID_DETALLES_S, :ID_A, :UNIDADES, 99999, :PESO, :VOLUMEN, :DIAMETRO, :ARTICULO) ');
                       Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                       Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
                       Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                       Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
                       Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
                       Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
                       Params.ByName['ID_A'].AsInteger := DS.FieldByName('ID_A_DET').AsInteger;
                       Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsInteger * DS.FieldByName('CANTIDAD').AsInteger;
                       Params.ByName['PESO'].AsFloat := Peso;
                       Params.ByName['VOLUMEN'].AsFloat := Volumen;
                       Params.ByName['DIAMETRO'].AsFloat := Diametro;
                       Params.ByName['ARTICULO'].AsString := DS.FieldByName('DETALLE').AsString;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
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
end;

procedure TDMAlbaranes.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraAfterScroll');
  IdDocEliminaPorte := 0;
  fecha_old := QMCabeceraFECHA.AsDateTime;

  UbicaDefecto;
end;

{ No se utiliza
procedure TDMAlbaranes.CambiaMonedaFecha;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text :=
        'execute procedure ut_refresca_det_s_moneda_fecha (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?MONEDA,?FECHAOLD,?FECHA)';
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
     Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
     Params.ByName['FECHAOLD'].AsDateTime := fecha_old;
     Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
     TFParada.Create(Self).ExecQuery(Q);
     FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;
}

procedure TDMAlbaranes.AbreDocumentos(id_s_d: integer; destino, serie: string);
begin
  // DMMain.Log('TDMAlbaranes.AbreDocumentos');
  if (destino = 'FAC') then
     TraspasoAFactura(serie, id_s_d);
end;

procedure TDMAlbaranes.QMNIFNewRecord(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMNIFNewRecord');
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

function TDMAlbaranes.DameDatosClientes: boolean;
begin
  // DMMain.Log('TDMAlbaranes.DameDatosClientes');
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

procedure TDMAlbaranes.GrabaDatosCliente(Estado: integer);
begin
  // DMMain.Log('TDMAlbaranes.GrabaDatosCliente');
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

procedure TDMAlbaranes.AbreSerializadoAuto;
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado, Devolucion : integer;
  Ejercicio : smallint;
  Fecha : TDateTime;
  Unidades : double;
begin
  // DMMain.Log('TDMAlbaranes.AbreSerializadoAuto');
  PreparaSerializacion;
  DatosSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo,
     Rig, Linea, Devolucion, Fecha, Unidades, Estado);
  MuestraSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig, Linea,
     Devolucion, Fecha, Unidades, Estado, Self);
end;

procedure TDMAlbaranes.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleAfterScroll');
  {dji lrk kri}
  LiquidoAnt := QMDetalleLIQUIDO.AsFloat;
  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranes.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraBeforeInsert');
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;
end;

procedure TDMAlbaranes.QMCabeceraRANGOChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraRANGOChange');
  with xRangos do
  begin
     Close;
     Params.ByName['RANGO'].AsInteger := Sender.AsInteger;
     Open;
  end;
  QMCabeceraINDICE.Clear;
end;

procedure TDMAlbaranes.QMCabeceraINDICEChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraINDICEChange');
  with xIndices do
  begin
     Close;
     Params.ByName['INDICE'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMAlbaranes.QMCabeceraTIPO_PORTESChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraTIPO_PORTESChange');
  if ((Sender.Value = 5) or (Sender.Value = 6) or (Sender.Value = 7)) then
  begin
     QMCabeceraRANGO.Clear;
     QMCabeceraINDICE.Clear;
  end;
end;

function TDMAlbaranes.ExisteRango(Rango: integer): boolean;
begin
  // DMMain.Log('TDMAlbaranes.ExisteRango');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_RANGO FROM EMP_RANGOS WHERE EMPRESA = :EMPRESA AND RANGO = :RANGO';
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

procedure TDMAlbaranes.OrdenarLineas;
begin
  // DMMain.Log('TDMAlbaranes.OrdenarLineas');
  with QMDetalle do
  begin
     DisableControls;
     try
        OrdenaLineas('ALB', QMCabeceraID_S.AsInteger, Self);
        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAlbaranes.CierraAbreDet;
var
  id_detalles_s : integer;
begin
  // DMMain.Log('TDMAlbaranes.CierraAbreDet');
  with QMDetalle do
  begin
     id_detalles_s := FieldByName('ID_DETALLES_S').AsInteger;
     try
        DisableControls;
        Close;
        Open;
        Last;
        while ((not BOF) and (FieldByName('ID_DETALLES_S').AsInteger <> id_detalles_s)) do
           Prior;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAlbaranes.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleAfterDelete');
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

procedure TDMAlbaranes.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleBeforeDelete');

  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

  if (REntorno.AlbaranRestringido) then
     DataSet.Cancel
  else
     ConPromociones := TienePromociones(QMDetalleID_DETALLES_S.AsInteger);
end;

procedure TDMAlbaranes.RefrescaCabecera(Accion: integer);
begin
  // DMMain.Log('TDMAlbaranes.RefrescaCabecera');
  case Accion of
     1: QMCabecera.Refresh;
     2:
     begin
        Posicionando := True;
        try
           Refrescar(QMCabecera, 'ID_S', QMCabeceraID_S.AsInteger);
        finally
           Posicionando := False;
        end;
     end;
  end;
end;

procedure TDMAlbaranes.GenerarPackingList;
begin
  // DMMain.Log('TDMAlbaranes.GenerarPackingList');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_GENERAR(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := 'ALB';
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
     finally
        Free;
     end;
  end;
end;

function TDMAlbaranes.PackingListGenerado: boolean;
begin
  // DMMain.Log('TDMAlbaranes.PackingListGenerado');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT COUNT(*) FROM GES_CABECERAS_S_BULTOS WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranes.FiltraDocumento(Serie, Filtro: string);
begin
  // DMMain.Log('TDMAlbaranes.FiltraDocumento');
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

procedure TDMAlbaranes.QMDetallePRECIOChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMDetallePRECIOChange');
  CalculaComisionKRI20;
end;

procedure TDMAlbaranes.QMDetalleP_COSTEChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleP_COSTEChange');
  CalculaComisionKRI20;
end;

procedure TDMAlbaranes.QMDetalleCOMISIONChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleCOMISIONChange');
  // Utiliza precio coste de art_tarifas_precios
  if (param_DOCPCTA001) then
  begin
     if (QMDetalleCOMISION.AsFloat > 300) or (QMDetalleCOMISION.AsFloat < -300) then
        QMDetalleCOMISION.AsFloat := 0;
  end;
end;

procedure TDMAlbaranes.CalculaComisionKRI20;
begin
  // DMMain.Log('TDMAlbaranes.CalculaComisionKRI20');
  // ATENCION: En los triggers tambien se recalcula la comision,
  // usando en lugar del Precio: B_COMISION / UNIDADES
  // El campo B_COMISION se le restan los descuentos por linea y el descuento comercial (DTO_CIAL).

  // Utiliza precio coste de art_tarifas_precios
  if (param_DOCPCTA001) then
  begin
     if QMDetallePRECIO.AsFloat <> 0 then
        QMDetalleCOMISION.AsFloat := (1 - ((QMDetalleP_COSTE.AsFloat + QMDetalleCOSTE_ADICIONAL.AsFloat) / QMDetallePRECIO.AsFloat)) * 20  // 20 = 100/5
     else
        QMDetalleCOMISION.AsFloat := 0;
  end;
end;

procedure TDMAlbaranes.QMCabeceraCONTACTOChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraCONTACTOChange');
  if (QMCabeceraCONTACTO.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT AGENTE, NOMBRE, APELLIDOS FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO=' + IntToStr(QMCabeceraTERCERO.AsInteger) + ' AND CONTACTO=' + IntToStr(QMCabeceraCONTACTO.AsInteger);
           ExecQuery;
           if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
              if ((FieldByName['AGENTE'].AsInteger > 0) and (not param_VENAGEN001)) then
                 QMCabeceraAGENTE.AsInteger := FieldByName['AGENTE'].AsInteger;
           QMCabeceraTIT_CONTACTO.AsString := Trim(FieldByName['NOMBRE'].AsString + ' ' + FieldByName['APELLIDOS'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMCabeceraTIT_CONTACTO.AsString := '';
end;

procedure TDMAlbaranes.QMDetallePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  // DMMain.Log('TDMAlbaranes.QMDetallePostError');
  if (ControlaStockNegativo and (Pos('exception 137.', EFIBError(E).Message) > 0) and (Muestra_InfoStock)) then
  begin
     Action := daAbort;
     FMAlbaranes.MuestraStock(1);
  end;
end;

procedure TDMAlbaranes.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraBeforeDelete');
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

  if (REntorno.AlbaranRestringido) then
     DataSet.Cancel;

  // Chile - Se evita eliminar el albaran si tiene un numero de folio asignado
  if ((REntorno.Pais = 'CHL') and (QMCabeceraFOLIO.AsInteger > 0)) then
  begin
     ShowMessage(_('No se puede eliminar una guia con un numero de folio asignado'));
     DataSet.Cancel;
  end;
end;

procedure TDMAlbaranes.QMCabeceraPROYECTOChange(Sender: TField);
var
  TituloAnt, Titulo : string;
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraPROYECTOChange');
  with xProyectos do
  begin
     TituloAnt := FieldByName('TITULO').AsString;
     Close;
     Open;
     Titulo := FieldByName('TITULO').AsString;
  end;

  if ((QMCabeceraSU_REFERENCIA.AsString = TituloAnt) or (QMCabeceraSU_REFERENCIA.AsString = '')) then
  begin
     if (QMCabeceraPROYECTO.AsInteger = 0) then
        QMCabeceraSU_REFERENCIA.AsString := ''
     else
        QMCabeceraSU_REFERENCIA.AsString := Titulo;
  end;
end;

procedure TDMAlbaranes.BuscaArticulo(Articulo: string);
begin
  // DMMain.Log('TDMAlbaranes.BuscaArticulo');
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

procedure TDMAlbaranes.BuscaLoteSimple(LoteSimple: string);
begin
  // DMMain.Log('TDMAlbaranes.BuscaLoteSimple');
  { TODO -cOptimizacion : Ver si se puede optimizar filtrando GES_DETALLES_S por EECS y TIPO. }
  with QMCabecera do
  begin
     Close;
     if (LoteSimple <> '') then
        ModificaSelect(QMCabecera, ' AND ID_S IN (SELECT ID_S FROM GES_DETALLES_S WHERE LOTE_SIMPLE = ''' + LoteSimple + ''')', (LoteSimple <> ''))
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

procedure TDMAlbaranes.FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente, Estado: integer);
begin
  // DMMain.Log('TDMAlbaranes.FiltraClienteKri');
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

procedure TDMAlbaranes.QMCartaPortesBeforeClose(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesBeforeClose');
  xTransportistaCarta.Close;
  xOrigen.Close;
  QMNaturaleza.Close;
  QMMatriculas.Close;
end;

procedure TDMAlbaranes.AbreQMNif;
begin
  // DMMain.Log('TDMAlbaranes.AbreQMNif');
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

procedure TDMAlbaranes.CierraQMNif;
begin
  // DMMain.Log('TDMAlbaranes.CierraQMNif');
  QMNif.Close;
end;

function TDMAlbaranes.EstadoDocumento: integer;
begin
  // DMMain.Log('TDMAlbaranes.EstadoDocumento');
  Result := -1;
  if QMCabecera.Active then
     Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

procedure TDMAlbaranes.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // DMMain.LogIni('TDMAlbaranes.QMCabeceraTITULOGetText');

  if (QMCabeceraTERCERO.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_S.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;

  // DMMain.LogFin('');
end;

procedure TDMAlbaranes.QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleTIPO_UNIDAD_LOGISTICAChange');
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

procedure TDMAlbaranes.QMDetalleTITULO_UNIDAD_LOGISTICAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleTITULO_UNIDAD_LOGISTICAChange');
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

procedure TDMAlbaranes.QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
var
  FactorUnidad : double;
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleUNIDADES_LOGISTICASChange');
  { 0 No utiliza UNIDADES_LOGISTICAS
    1 Utiliza UNIDADES_LOGISTICAS
    2 No relaciona UNIDADES con UNIDADES_LOGISTICAS }

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
                 finally;
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

procedure TDMAlbaranes.CambiaFechaAlbaranes(FechaNueva: TDateTime);
begin
  // DMMain.Log('TDMAlbaranes.CambiaFechaAlbaranes');
  with QMCabecera do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if FieldByName('ESTADO').AsInteger = 0 then
           begin
              Edit;
              FieldByName('FECHA').AsDateTime := FechaNueva;
              Post;
           end;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAlbaranes.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleBeforeClose');
  xArticulos.Close;
end;

procedure TDMAlbaranes.QMCabeceraDTO_PPChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraDTO_PPChange');
  if ((xFormasPago.FieldByName('PRONTO_PAGO').AsInteger = 0) and (QMCabeceraDTO_PP.AsFloat <> 0) and (Trim(QMCabeceraFORMA_PAGO.AsString) > '')) then
  begin
     QMCabeceraDTO_PP.AsFloat := 0;
     ShowMessage('La forma de pago no admite descuento pronto pago');
  end;
end;

procedure TDMAlbaranes.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleUNIDADESGetText');
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES.AsFloat]);
end;

procedure TDMAlbaranes.UbicaDefecto;
begin
  if (not Posicionando) and (QMCabeceraESTADO.AsInteger = 0) then
  begin
     DMMain.Log('TDMAlbaranes.UbicaDefecto');
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SERIE, DET.TIPO, DET.RIG, DET.LINEA, ');
           SQL.Add(' DET.ID_S, DET.ID_DETALLES_S, DET.ID_A, DET.UNIDADES ');
           SQL.Add(' FROM GES_DETALLES_S DET ');
           SQL.Add(' JOIN ART_ARTICULOS ART ');
           SQL.Add(' ON (DET.ID_A = ART.ID_A) ');
           SQL.Add(' JOIN GES_DETALLES_S_UBICACIONES UBI ');
           SQL.Add(' ON (UBI.ID_DETALLES_S = DET.ID_DETALLES_S) ');
           SQL.Add(' WHERE ');
           SQL.Add(' DET.EMPRESA = ?EMPRESA AND ');
           SQL.Add(' DET.EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' DET.CANAL = ?CANAL AND ');
           SQL.Add(' DET.SERIE = ?SERIE AND ');
           SQL.Add(' DET.TIPO = ?TIPO AND ');
           SQL.Add(' DET.RIG = ?RIG AND ');
           SQL.Add(' DET.ALMACEN = ''000'' AND ');
           SQL.Add(' ART.UBICABLE = 1 AND ');
           SQL.Add(' ((UBI.ID_UBICACION = 1) OR (UBI.ID_UBICACION IS NULL)) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'ALB';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           ExecQuery;
           FreeHandle;
           Close;
           ExecQuery;
           if (not EOF) then
              ShowMessage(_('ATENCIÓN: Hay artículos sin ubicar.'));
           while not EOF do
           begin
              TFMExtraeArticulos.Create(Self).MuestraUbiArtic(FieldByName['EMPRESA'].AsInteger,
                 FieldByName['EJERCICIO'].AsInteger, FieldByName['CANAL'].AsInteger,
                 FieldByName['RIG'].AsInteger, FieldByName['LINEA'].AsInteger,
                 FieldByName['ID_DETALLES_S'].AsInteger, FieldByName['ID_A'].AsInteger,
                 FieldByName['SERIE'].AsString, FieldByName['TIPO'].AsString,
                 FieldByName['UNIDADES'].AsFloat);
              Next;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAlbaranes.OrdenarLineasPorDireccionEntrega(id_s: integer = 0);
var
  DS : TFIBDataSet;
  Orden : integer;
  RefrescaDetalle : boolean;
begin
  // DMMain.Log('TDMAlbaranes.OrdenarLineasPorDireccionEntrega');
  /// Ordena las lineas por direccion de entrega, articulo, linea
  /// Si ID_S = 0, toma el registro actual

  RefrescaDetalle := False;
  if (id_s = 0) then
  begin
     id_s := QMCabeceraID_S.AsInteger;
     RefrescaDetalle := True;
  end;

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
           SelectSQL.Add(' JOIN GES_DETALLES_S_ALB A ');
           SelectSQL.Add(' ON D.ID_DETALLES_S = A.ID_DETALLES_S ');
           SelectSQL.Add(' WHERE D.ID_S = ?ID_S ');
           SelectSQL.Add(' ORDER BY A.DIRECCION_ENTREGA, D.ARTICULO, D.LINEA ');
           Params.ByName['ID_S'].AsInteger := id_s;
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

  if (RefrescaDetalle) then
     CierraAbreDet;
end;

procedure TDMAlbaranes.OrdenarLineasPorDireccionEntrega_Filtradas;
var
  id_s : integer;
begin
  // DMMain.Log('TDMAlbaranes.OrdenarLineasPorDireccionEntrega_Filtradas');
  if ConfirmaGrave then
  begin
     // Guardo ID_S para volver a este registro
     id_s := QMCabeceraID_S.AsInteger;

     with QMCabecera do
     begin
        DisableControls;
        try
           // Recorro documentos filtrados
           First;
           while (not EOF) do
           begin
              OrdenarLineasPorDireccionEntrega(QMCabeceraID_S.AsInteger);
              Next;
           end;

           // Reposiciono en el documento que estaba al incio del proceso
           First;
           while ((QMCabeceraID_S.AsInteger <> id_s) and (not EOF)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMAlbaranes.DistribuyeLineasPorDirecionEntrega;
begin
  // DMMain.Log('TDMAlbaranes.DistribuyeLineasPorDirecionEntrega');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DISTRIBUIR_POR_DIR_ENTREGA(?ID_S)';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CierraAbreDet;
end;

procedure TDMAlbaranes.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraBeforeClose');
  xCliente.Close;
  QMDetalle.Close;
  xInfoActualizada.Close;
  xDirecciones.Close;
  xFormasPago.Close;
  xRangos.Close;
  xIndices.Close;
  xIndices.Close;
  xProyectos.Close;
  QMFirmas.Close;
  QMSIIDteReferencia.Close;
  if (xSiiDte.Active) then
     xSiiDte.Close;
end;

procedure TDMAlbaranes.RellenaDatosOldLinea;
begin
  // DMMain.Log('TDMAlbaranes.RellenaDatosOldLinea');
  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranes.RellenaDatosLinea(Linea: TStrings);

  procedure AddField(Linea: TStrings; Campo: string);
  begin
     if (QMDetalle.FieldByName(Campo) is TDateTimeField) then
        TStringList(Linea).Add(Campo + '=' + DateTimeToStr(QMDetalle.FieldByName(Campo).AsDateTime))
     else
        TStringList(Linea).Add(Campo + '=' + QMDetalle.FieldByName(Campo).AsString);
  end;

begin
  // DMMain.Log('TDMAlbaranes.RellenaDatosLinea');
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
     AddField(Linea, 'FECHA_PRE_DET');
     AddField(Linea, 'DIRECCION_ENTREGA');
     AddField(Linea, 'TITULO_IDIOMA');
     AddField(Linea, 'COSTE_ADICIONAL');
     AddField(Linea, 'TIPO_UNIDAD_LOGISTICA');
     AddField(Linea, 'ID_UBICACION');
     AddField(Linea, 'ID_LOTE');
     AddField(Linea, 'CAJA_EDI');
     AddField(Linea, 'TIPO_CAJA_EDI');
  end;
end;

procedure TDMAlbaranes.CambiaPCosteLinea(PCoste: double);
begin
  // DMMain.Log('TDMAlbaranes.CambiaPCosteLinea');
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

procedure TDMAlbaranes.CambiaCosteAdicionalLinea(CosteAdicional: double);
begin
  // DMMain.Log('TDMAlbaranes.CambiaCosteAdicionalLinea');
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

procedure TDMAlbaranes.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // DMMain.Log('TDMAlbaranes.xInfoActualizadaTITULO_ESTADOGetText');
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMAlbaranes.DuplicarLinea;
var
  old_KriConf464 : boolean;
  IdDetallesS, NuevaLinea : integer;
  Precio : double;
begin
  // DMMain.Log('TDMAlbaranes.DuplicarLinea');
  old_KriConf464 := KriConf464;
  try
     KriConf464 := True;
     IdDetallesS := QMDetalleID_DETALLES_S.AsInteger;

     // Guardo los datos con lo que hay en la linea si KriConf464 estaba deshabilidatdo
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
     KriConf464 := old_KriConf464;
  end;
end;

procedure TDMAlbaranes.ExportarVGG;
var
  SQL, Fichero, Corte : string;
  CuantosHay : integer;
  TmpDecimalSeparator, TmpThousandSeparator : char;
begin
  // DMMain.Log('TDMAlbaranes.ExportarVGG');
  /// Exportacion de albaran especial para VGG (ARMTEX)
  /// Exporta datos del albarán seleccionado a un fichero separado por tabulaodr
  /// El fichero se nombra ALBEEEE-SSSRRRR.txt --> Ejemplo: ALB2016-A123.txt
  /// El fichero quedara en la carpeta "Mis documentos" del usuario

  // Nombre del fichero a exportar
  Fichero := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'ALB-' + QMCabeceraEJERCICIO.AsString + '-' + QMCabeceraSERIE.AsString + '-' + QMCabeceraRIG.AsString + '.txt';

  // Buscamos si hay algun articulo CORTE en el albaran
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(ARTICULO) AS CUANTOS FROM GES_DETALLES_S WHERE ARTICULO = ''CORTE'' AND ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        CuantosHay := FieldByName['CUANTOS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (CuantosHay > 0) then
     Corte := 'CORTE'
  else
     Corte := '';

  // SQL - No envia los articulos CORTE
  SQL := 'select ' +
     'substring(cab.ejercicio || cab.serie || cab.rig from 1 for 15) as nro_albaran, ' +  // NumeroDeAlbaranDeTercero 1
     'substring(cab.su_referencia from 1 for 15) as nro_pedido, ' + // NumeroDePedidoDeTercero 2
     'substring(cast('''' as varchar(15)) from 1 for 15) as nro_proveedor, ' + // NumeroDeProveedor 3
     'substring(ter.nombre_comercial from 1 for 50) as nombre_comercial, ' + // NombreComercial 4
     'substring(dir.dir_completa from 1 for 50) as domicilio1, ' + // Domicilio1 5
     'substring(dir.dir_completa from 50 for 50) as domicilio2, ' + // Domicilio2 6
     'substring(sl.codigo_postal from 1 for 10) as codigo_postal, ' + // CodigoPostal 7
     'substring(sl.titulo from 1 for 50) as poblacion, ' + // Población 8
     'substring(prov.titulo from 1 for 50) as provincia, ' + // Provincia 9
     'substring(sl.pais from 1 for 10) as codigo_pais, ' + // CodigoDePais 10
     'cab.fecha, ' + // Fecha 11
     'det.notas as observaciones, ' + // Observaciones 12
     'cast(''' + Corte + ''' as varchar(15)) as codigo_serv_transporte, ' + // CodigoDeServicioDeTransporte  -> Adaptacion para Armtex, se informa un texto literal 13
     'cast('''' as varchar(1)) as portes, ' + // Portes 14
     'det.articulo as codigo_articulo, ' +     // CodigoDeArticulo 15
     '(case when ue.unidades is null then cast('''' as varchar(6)) ' +
     ' when ue.unidades = 1 then cast('''' as varchar(6)) ' +
     ' when ue.unidades > 1 then cast(cast(ue.medida1 as integer) as varchar(6)) ' +
     ' end) as codigo_clasificacion, ' + // CodigoDeClasificacion 16
     'cast('''' as varchar(20)) as codigo_lote, ' + // CodigoDeLote 17
     'substring(det.titulo from 1 for 50) as descripcion, ' + // Descripción 18
     '(case when ue.unidades is null then det.unidades ' +
     '  when ue.unidades = 1 then det.unidades ' +
     '  when ue.unidades > 1 then det.unidades*ue.medida1 ' +
     '  end) as metros_lineales, ' + // Unidades 19 -> Metros lineales
     'det.unidades as unidades_a, ' + // UnidadesA 20 -> Cantidad
     'cast('''' as varchar(1)) as unidades_b ' + // UnidadesB 'cast(0 as double precision) as unidades_b ' 21
     'from ges_cabeceras_s cab ' +
     'join ges_detalles_s det on (cab.id_s = det.id_s) ' +
     'left join ges_detalles_s_ue ue on (det.empresa = ue.empresa and det.ejercicio = ue.ejercicio and det.canal = ue.canal ' +
     '      and det.serie = ue.serie and det.tipo = ue.tipo and det.rig = ue.rig and det.linea = ue.linea) ' +
     'left join sys_terceros ter on (cab.tercero = ter.tercero) ' +
     'left join sys_terceros_direcciones dir on (cab.tercero = dir.tercero and cab.direccion = dir.direccion) ' +
     'left join sys_localidades sl on (dir.id_local = sl.id_local) ' +
     'left join sys_provincias prov on (sl.pais = prov.pais and sl.provincia = prov.provincia)' +
     'where cab.id_s = ' + QMCabeceraID_S.AsString +
     ' and det.articulo <> ''CORTE''';

  TmpDecimalSeparator := DecimalSeparator;
  TmpThousandSeparator := ThousandSeparator;
  try
     DecimalSeparator := ',';
     ExportarCSV(Fichero, SQL, chr(9), False, False, True); // chr(9) tab horizontal

     // Guardo el fichero como adjunto.
     AbreData(TDMAdjunto, DMAdjunto);
     DMAdjunto.CreaAdjunto('ALB', QMCabeceraID_S.AsInteger, Fichero, Format(_('Exportacion VGG %s'), [DateTimeToStr(Now)]));
     CierraData(DMAdjunto);

     ShowMessage(Format(_('Proceso finalizado.' + #13#10 + 'Fichero: %s'), [Fichero]));
  finally
     DecimalSeparator := TmpDecimalSeparator;
     ThousandSeparator := TmpThousandSeparator;
  end;
end;

procedure TDMAlbaranes.EliminarPackingList;
begin
  // DMMain.Log('TDMAlbaranes.EliminarPackingList');
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_ELIMINAR(:ID_S)';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranes.DameSqlImpresionEtiquetas(SQL: TStrings);
begin
  // DMMain.Log('TDMAlbaranes.DameSqlImpresionEtiquetas');
  /// Genera SQL para rellenar ART_IMPRESION_CB_DETALLE con los articulos filtrados.
  /// Contiene el parametro NUMERO que sera utilizado dentro de UDMImprimircodBarras.

  with SQL do
  begin
     Clear;
     Add(' INSERT INTO ART_IMPRESION_CB_DETALLE ');
     Add(' (EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO, ID_DETALLE_DOC, COD_BARRAS, TIPO, NUM_COPIAS, FECHA, ALFA_6, ID_LOTE, UNIDADES) ');
     Add(' SELECT ' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', ');
     Add(' :NUMERO, 0, DET.ARTICULO, DET.ID_DETALLES_S, ');
     Add(' (SELECT FIRST 1 BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = DET.EMPRESA AND ARTICULO = DET.ARTICULO ORDER BY TIPO DESC),');
     Add(' (SELECT FIRST 1 TIPO FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = DET.EMPRESA AND ARTICULO = DET.ARTICULO ORDER BY TIPO DESC), ');

     // param_ALBETIQ001
     if (param_ALBETIQ001 <> 0) then
        Add(format(' %d, ', [param_ALBETIQ001]))
     else
        Add(' COALESCE(LOT.CANTIDAD, DEA.UNIDADES_LOGISTICAS), ');

     Add(' CAB.FECHA, A.ALFA_6, LOT.ID_LOTE, ');

     // param_ALBETIQ002
     if (param_ALBETIQ002) then
        Add(' DET.BULTOS ')
     else
        Add(' DEA.UNIDADES_LOGISTICAS ');

     Add(' FROM GES_DETALLES_S DET ');
     Add(' JOIN GES_DETALLES_S_ALB DEA ON (DET.ID_DETALLES_S = DEA.ID_DETALLES_S) ');
     Add(' LEFT JOIN GES_DETALLES_S_LOTES LOT ON (DET.ID_DETALLES_S = LOT.ID_DETALLES_S) ');
     Add(' JOIN GES_CABECERAS_S CAB ON (CAB.ID_S = DET.ID_S) ');
     Add(' JOIN ART_ARTICULOS A ON (A.EMPRESA = DET.EMPRESA AND A.ARTICULO = DET.ARTICULO) ');
     Add(' WHERE DET.ID_S = ' + IntToStr(QMCabeceraID_S.AsInteger));
     Add(' ORDER BY DET.LINEA, LOT.SUBLINEA ');
  end;
end;

procedure TDMAlbaranes.GeneraMovDeposito(AlmacenDeposito: string);
begin
  // DMMain.Log('TDMAlbaranes.GeneraMovDeposito');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_GENERA_MOV_DEPOSITO(:ID_S, :ALMACEN_DEPOSITO)';
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['ALMACEN_DEPOSITO'].AsString := AlmacenDeposito;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMAlbaranes.BorraMovDeposito;
begin
  // DMMain.Log('TDMAlbaranes.BorraMovDeposito');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_ELIMINA_MOV_DEPOSITO(:EMPRESA, :EJERCICIO, :SERIE, :NUM_MOV_DEPOSITO, :ID_S, 1)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['NUM_MOV_DEPOSITO'].AsInteger := QMCabeceraNUM_MOV_DEPOSITO.AsInteger;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMAlbaranes.CreaRuta;
var
  IdArticulo, IdEmpleado, IdRuta, IdCliente : integer;
  FechaRuta : TDateTime;
begin
  // DMMain.Log('TDMAlbaranes.CreaRuta');
  /// Crea una ruta con fecha de albaran, si no ha sido creada previamente.
  /// Toma el empleado asociado al usuario.
  /// El resto de campos son valores por defecto.
  /// Queda asociado al documento (TIPO, ID_S).
  /// Se crea un tramo vacio para asociarle conductor, vehiculo y remolque

  // Verifico que no haya creado una ruta previamente
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_RUTA FROM TRANS_RUTA WHERE TIPO_DOC_ORI = :TIPO AND ID_DOC_ORI = :ID_S';
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        IdRuta := FieldByName['ID_RUTA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (IdRuta <> 0) then
     MessageDlg(Format(_('Este documento ya tiene una ruta asignada (Ruta %d)'), [IdRuta]), mtError, [mbOK], 0)
  else
  begin
     IdCliente := DameIdCliente(QMCabeceraCLIENTE.AsInteger);

     // Obtengo el ID_A del articulo a utilizar para facturar
     IdArticulo := DameIDArticulo(REntorno.ArtTextoLibre, REntorno.Empresa);

     // Obtengo el empleado asociado al usuario
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID_EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND USUARIO = :USUARIO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;
           IdEmpleado := FieldByName['ID_EMPLEADO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Obtengo la fecha mas proxima para reparto segun zona de cliente
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 Z.FECHA ');
           SQL.Add(' FROM EMP_CLIENTES C ');
           SQL.Add(' JOIN OPE_CALENDARIO_ZONA Z ON C.EMPRESA = Z.EMPRESA AND C.ZONA = Z.ZONA ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.ID_CLIENTE = :ID_CLIENTE AND ');
           SQL.Add(' Z.FECHA >= :FECHA AND ');
           SQL.Add(' Z.REPARTO = 1 ');
           SQL.Add(' ORDER BY Z.FECHA ');
           Params.ByName['ID_CLIENTE'].AsInteger := IdCliente;
           Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
           ExecQuery;
           FechaRuta := FieldByName['FECHA'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Creo la ruta
     IdRuta := DMMain.ContadorGen('CONTA_ID_RUTA');
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO TRANS_RUTA ( ');
           SQL.Add(' ID_RUTA, TITULO, EMPRESA, FECHA_PREV_INI, FECHA_PREV_FIN, TIPO_DOC_ORI, ID_DOC_ORI, ID_EMPLEADO, ');
           SQL.Add(' ID_ARTICULO, TITULO_ARTICULO, NOTA, ID_CLIENTE, SU_REFERENCIA ');
           SQL.Add(' /* ');
           SQL.Add(' ID_PLANTILLA_RUTA, PASAJEROS, FECHA, ');
           SQL.Add(' KM_PREVISTOS, TIEMPO_PREVISTO, TIPO_CALCULO_PRECIO, UNIDADES, PRECIO, ESTADO, TIPO_DOC, ');
           SQL.Add(' ID_DOC, FECHA_INI, FECHA_FIN ');
           SQL.Add(' */ ');
           SQL.Add(' ) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :ID_RUTA, :TITULO, :EMPRESA, :FECHA_PREV_INI, :FECHA_PREV_FIN, :TIPO_DOC_ORI, :ID_DOC_ORI, :ID_EMPLEADO, ');
           SQL.Add(' :ID_ARTICULO, :TITULO_ARTICULO, :NOTA, :ID_CLIENTE, :SU_REFERENCIA) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ID_RUTA'].AsInteger := IdRuta;
           Params.ByName['TITULO'].AsString := Copy(Trim(Format('%s-%d %s %s', [QMCabeceraTIPO.AsString, QMCabeceraRIG.AsInteger, QMCabeceraTITULO.AsString, QMCabeceraSU_REFERENCIA.AsString])), 1, 60);
           Params.ByName['FECHA_PREV_INI'].AsDateTime := FechaRuta;
           Params.ByName['FECHA_PREV_FIN'].AsDateTime := FechaRuta + ((1 / 24) * 1); // Una horas despues de la fecha de inicio
           Params.ByName['TIPO_DOC_ORI'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['ID_DOC_ORI'].AsInteger := QMCabeceraID_S.AsInteger;
           Params.ByName['ID_EMPLEADO'].AsInteger := IdEmpleado;
           Params.ByName['ID_ARTICULO'].AsInteger := IdArticulo;
           Params.ByName['ID_CLIENTE'].AsInteger := IdCliente;
           Params.ByName['SU_REFERENCIA'].AsString := QMCabeceraSU_REFERENCIA.AsString;
           Params.ByName['TITULO_ARTICULO'].AsString := Copy(_(Format('%s-%d-%s/%d %s', [QMCabeceraTIPO.AsString, QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, QMCabeceraTITULO.AsString])), 1, 60);
           Params.ByName['NOTA'].AsString := '';
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // ******************************************************************************************
     // Si se modifica el comportamiento de KRICONF_515, también habrá que modificarlo a nivel web
     // ******************************************************************************************

     // Creo un tramo vacio para esta ruta
     if (DMMain.EstadoKri(515) = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO TRANS_TRAMO ( ');
              SQL.Add(' ID_RUTA, EMPRESA, FECHA_PREV_INI, FECHA_PREV_FIN ');
              SQL.Add(' /* ');
              SQL.Add('  ID_TRAMO, ORDEN, TITULO, ORIGEN, ID_GEO_ORIGEN, TERCERO_ORIGEN, TELEFONO_ORIGEN, NOTA_ORIGEN, DESTINO, ');
              SQL.Add('  ID_GEO_DESTINO, TERCERO_DESTINO, TELEFONO_DESTINO, NOTA_DESTINO, REALIZADO_ORI, REALIZADO_DES, ');
              SQL.Add('  VISIBLE_CLIENTE, TRAMO_VACIO, FINALIZADO, FECHA_INI, FECHA_FIN, TIPO_DOC, ID_DETALLE_DOC ');
              SQL.Add(' */ ');
              SQL.Add(' ) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' :ID_RUTA, :EMPRESA, :FECHA_PREV_INI, :FECHA_PREV_FIN) ');
              Params.ByName['ID_RUTA'].AsInteger := IdRuta;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['FECHA_PREV_INI'].AsDateTime := FechaRuta;
              Params.ByName['FECHA_PREV_FIN'].AsDateTime := FechaRuta + ((1 / 24) * 1); // Dos horas despues de la fecha de inicio
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMAlbaranes.QMCartaPortesBeforeEdit(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCartaPortesBeforeEdit');
  if ((QMCabeceraESTADO.AsInteger = 5)) then
  begin
     // Permite crear/modificar carta porte de albaran cerrado (S/N)
     if (LeeParametro('CARPORT002', QMCabeceraSERIE.AsString) = 'N') then
     begin
        raise Exception.Create(_('Documento Bloqueado'));
        DataSet.Cancel;
     end;
  end;

  if CancelaCarta then
     CancelaCarta := False;
end;

procedure TDMAlbaranes.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
  Canal : integer;
begin
  // DMMain.Log('TDMAlbaranes.QMDetalleCalcFields');
  QMDetalleMARGEN.AsFloat := DMMain.DameMargenUtilidad(QMDetalleB_IMPONIBLE.AsFloat, QMDetalleT_COSTE.AsFloat);

  if (QMDetalleCONTROL_STOCK.AsInteger = 1) then
  begin
     Articulo := QMDetalleARTICULO.AsString;
     Canal := Param_MOVSTKC001;
     if (Canal = 0) then
        Canal := REntorno.Canal;

     Stock := 0;
     if (AlmacenStock <> 'NOCALC') then
     begin
        with StockAlm do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock2 <> 'NOCALC') then
     begin
        with StockAlm2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock2);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock3 <> 'NOCALC') then
     begin
        with StockAlm3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock3);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM3.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockV <> 'NOCALC') then
     begin
        with StockAlmV do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockVirtualArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStockV);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKV_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockV2 <> 'NOCALC') then
     begin
        with StockAlmV2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockVirtualArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStockV2);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKV_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockV3 <> 'NOCALC') then
     begin
        with StockAlmV3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockVirtualArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStockV3);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKV_ALM3.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockR <> 'NOCALC') then
     begin
        with StockAlmR do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockRealArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStockR);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKR_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockR2 <> 'NOCALC') then
     begin
        with StockAlmR2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockRealArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStockR2);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKR_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockR3 <> 'NOCALC') then
     begin
        with StockAlmR3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockRealArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStockR3);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKR_ALM3.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockM <> 'NOCALC') then
     begin
        with StockAlmM do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockMontura(REntorno.Empresa, Canal, Articulo, AlmacenStockM);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKM_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockM2 <> 'NOCALC') then
     begin
        with StockAlmM2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockMontura(REntorno.Empresa, Canal, Articulo, AlmacenStockM2);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKM_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStockM3 <> 'NOCALC') then
     begin
        with StockAlmM3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockMontura(REntorno.Empresa, Canal, Articulo, AlmacenStockM3);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCKM_ALM3.AsFloat := Stock;

     Stock := 0;
     if AlmacenStockActual then
        Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, QMDetalleALMACEN.AsString);
     QMDetalleSTOCK.AsFloat := Stock;

     Stock := 0;
     if AlmacenStockVirtual then
        Stock := DMMain.DameStockVirtualArticulo(REntorno.Empresa, Canal, Articulo, QMDetalleALMACEN.AsString);
     QMDetalleSTOCK_VIRTUAL.AsFloat := Stock;

     Stock := 0;
     if AlmacenStockMontura then
        Stock := DMMain.DameStockMontura(REntorno.Empresa, Canal, Articulo, QMDetalleALMACEN.AsString);
     QMDetalleSTOCK_MONTURAS.AsFloat := Stock;

     Stock := 0;
     if AlmacenStockRefBase then
        Stock := DMMain.DameStockRefBase(REntorno.Empresa, Canal, Articulo, QMDetalleALMACEN.AsString);
     QMDetalleSTOCK_REF_BASE.AsFloat := Stock;

     Stock := 0;
     if AlmacenStockReal then
        Stock := DMMain.DameStockRealArticulo(REntorno.Empresa, Canal, Articulo, QMDetalleALMACEN.AsString);
     QMDetalleSTOCK_REAL.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK.AsFloat := 0;
     QMDetalleSTOCK_ALM.AsFloat := 0;
     QMDetalleSTOCK_ALM2.AsFloat := 0;
     QMDetalleSTOCK_ALM3.AsFloat := 0;
     QMDetalleSTOCKV_ALM.AsFloat := 0;
     QMDetalleSTOCKV_ALM2.AsFloat := 0;
     QMDetalleSTOCKV_ALM3.AsFloat := 0;
     QMDetalleSTOCKR_ALM.AsFloat := 0;
     QMDetalleSTOCKR_ALM2.AsFloat := 0;
     QMDetalleSTOCKR_ALM3.AsFloat := 0;
     QMDetalleSTOCKM_ALM.AsFloat := 0;
     QMDetalleSTOCKM_ALM2.AsFloat := 0;
     QMDetalleSTOCKM_ALM3.AsFloat := 0;
     QMDetalleSTOCK_VIRTUAL.AsFloat := 0;
     QMDetalleSTOCK_MONTURAS.AsFloat := 0;
     QMDetalleSTOCK_REF_BASE.AsFloat := 0;
     QMDetalleSTOCK_REAL.AsFloat := 0;
  end;
end;

procedure TDMAlbaranes.AsignaEmpleados;
begin
  // DMMain.Log('TDMAlbaranes.AsignaEmpleados');
  UFMAsignaEmpleado.PideDato(QMCabeceraID_S.AsInteger);
end;

procedure TDMAlbaranes.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraCalcFields');
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);
  QMCabeceraMARGEN.AsFloat := DMMain.DameMargenUtilidad(QMCabeceraS_BASES.AsFloat, QMCabeceraC_TOTAL.AsFloat);
end;

procedure TDMAlbaranes.CreaReciboAnticipo;
var
  IdCartera : integer;
  ImportePendiente : double;
  TipoRecibo, Referencia : string;
begin
  if (QMCabeceraESTADO.AsInteger = 0) or ConfirmaMensaje(_('El documento está cerrado/anulado. Desea crear un anticipo de todos modos?')) then
  begin
     // DMMain.Log('TDMAlbaranes.CreaReciboAnticipo');
     Referencia := Copy(Trim(Format('Anticipo %s-%s/%d %s', [QMCabeceraTIPO.AsString, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, QMCabeceraSU_REFERENCIA.AsString])), 1, 60);
     ImportePendiente := xInfoActualizadaTOTAL_A_COBRAR.AsFloat - DMMain.DameTotalRecibosDocumento(QMCabeceraID_S.AsInteger);
     if (ImportePendiente <= 0) then
        ShowMessage(_('Ya se ha anticipado el total del documento.'));

     if (LeeParametro('RECANTC001') <> 'S') then
        TipoRecibo := 'ANC'
     else
        TipoRecibo := 'CLI';
     IdCartera := UFMReciboNuevo.CreaRecibo(QMCabeceraSERIE.AsString, TipoRecibo, QMCabeceraCLIENTE.AsInteger, ImportePendiente, Referencia, (LeeParametro('RECDESH001') = 'S'));

     if (IdCartera <> 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'INSERT INTO GES_CABECERAS_S_CAR (ID_S, ID_CARTERA, ENTRADA) VALUES (:ID_S, :ID_CARTERA, :ENTRADA)';
              Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
              Params.ByName['ID_CARTERA'].AsInteger := IdCartera;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // FMain.MuestraCartera(IdCartera);
  end;
end;

procedure TDMAlbaranes.TraspasoMovimientoStock;
var
  Almacen : string;
begin
  // DMMain.Log('TDMAlbaranes.TraspasoMovimientoStock');
  (*
  Si se modifica esto modificar también:
  - DMRegInventario.TraspasoMovimientoStock;
  - DMAlbaranes.TraspasoMovimientoStock;
  *)

  if (UFMSeleccion.PideDato('ALM', Almacen, _('Almacen de entrada'), 'ACTIVO=1')) then
  begin
     // Abro Movimientos Manuales de Stock
     FMain.EjecutaAccion(FMain.AMvStMan);

     // Creo cabecera
     DMMovManStock.QMCabecera.Insert;
     DMMovManStock.QMCabeceraEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
     DMMovManStock.QMCabeceraEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
     DMMovManStock.QMCabeceraSERIE.AsString := QMCabeceraSERIE.AsString;
     DMMovManStock.QMCabeceraFECHA.AsDateTime := QMCabeceraFECHA.AsDateTime;
     DMMovManStock.QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
     DMMovManStock.QMCabeceraALMACEN_DST.AsString := Almacen;
     DMMovManStock.QMCabeceraCANAL_DST.AsInteger := QMCabeceraCANAL.AsInteger;
     DMMovManStock.QMCabeceraTIPO_OPERACION.AsString := 'E';
     DMMovManStock.QMCabeceraCOMENTARIO.AsString := Copy(Format(_('%s %s/%d - %s'), [QMCabeceraTIPO.AsString, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, QMCabeceraSU_REFERENCIA.AsString]), 1, 40);
     DMMovManStock.QMCabecera.Post;

     // Recorro detalle de Albaran creando detalle de Movimiento Manual de Stock
     QMDetalle.First;
     while not QMDetalle.EOF do
     begin
        // Solo tiene en cuenta un lote. Si hay multiples lotes por linea, modificar origen de datos.
        DMMovManStock.Inserta(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat, QMDetalleLOTE.AsString, 0, QMDetallePRECIO.AsFloat, '', QMDetalleP_COSTE.AsFloat);
        QMDetalle.Next;
     end;

     DMMovManStock.AbreCierra(5);
  end;
end;

procedure TDMAlbaranes.ActualizaPorteSegunZona;
var
  Zona : string;
  CodigoPostal : string;
  Importe, ImporteReembolso : double;
  TipoEfectoFacturae : integer;
begin
  // DMMain.Log('TDMAlbaranes.ActualizaPorteSegunZona');
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

procedure TDMAlbaranes.QMCabeceraTRANSPORTISTAChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraTRANSPORTISTAChange');
  if (xCliente.FieldByName('TIPO_PORTES').AsInteger = 0) then
     ActualizaPorteSegunZona;
end;

procedure TDMAlbaranes.PosicionarID(IdDoc: integer);
begin
  // DMMain.Log('TDMAlbaranes.PosicionarID');
  // Si pertenece al ejercicio posiciono, sino filtro ese documento
  if (DMMain.DameEjercicioDoc('ALB', IdDoc) = REntorno.Ejercicio) then
  begin
     // Quito filtro si lo hubiera
     FiltraDocumento(Serie, '');
     Posicionando := True;
     try
        Posicionar(QMCabecera, 'ID_S', IdDoc);
     finally
        Posicionando := False;
     end;
  end
  else
     FiltraDocumento(Serie, 'ID_S = ' + IntToStr(IdDoc));
end;

procedure TDMAlbaranes.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraVALOR_CAMB_FIJOChange');
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

procedure TDMAlbaranes.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
begin
  // DMMain.Log('TDMAlbaranes.QMCabeceraVALOR_CAMB_FIJO_INVChange');
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

procedure TDMAlbaranes.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
var
  IdLote : integer;
  Composicion : string;
begin
  // DMMain.Log('TDMAlbaranes.Inserta');
  IdLote := 0;
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
              IdLote := FieldByName['ID_LOTE'].AsInteger;
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
     if (Composicion = '') then
        IdUbicacion := 0;
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

  if (IdLote <> 0) then
     QMDetalleID_LOTE.AsInteger := IdLote;
  if (IdUbicacion <> 0) then // Si es 0 se deja en blanco y el trigger se encgargara
     QMDetalleID_UBICACION.AsInteger := IdUbicacion;

  QMDetalle.Post;
end;

procedure TDMAlbaranes.AbreAlbaran;
begin
  // DMMain.Log('TDMAlbaranes.AbreAlbaran');
  CambiaEstadoDocumento(0);
end;

procedure TDMAlbaranes.CierraAlbaran;
begin
  // DMMain.Log('TDMAlbaranes.CierraAlbaran');
  if (REntorno.Pais = 'CHL') then
     DMMain.ReNumerarOrdenDetalleVenta(QMCabeceraID_S.AsInteger);

  CambiaEstadoDocumento(5);
end;

procedure TDMAlbaranes.CambiaEstadoDocumento(Estado: integer);
begin
  // DMMain.Log('TDMAlbaranes.CambiaEstadoDocumento');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_S SET ESTADO = :ESTADO WHERE ID_S = :ID_S';
        Params.ByName['ESTADO'].AsInteger := Estado;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMAlbaranes.TraspasaLinea(Tipo: string; id_s: integer);
begin
  // DMMain.Log('TDMAlbaranes.TraspasaLinea');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_DET_A_OTRO(:O_ID_DETALLES_S, :D_ID_S, :ENTRADA)';
        Params.ByName['O_ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['D_ID_S'].AsInteger := id_s;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMDetalle, 'ID_DETALLES_S', QMDetalleID_DETALLES_S.AsInteger);
  AbreDocumentos(id_s, Tipo, QMCabeceraSERIE.AsString);
end;

procedure TDMAlbaranes.ReiniciaStock(Articulo: string = '');
var
  i : integer;
begin
  // DMMain.Log('TDMAlbaranes.ReiniciaStock');
  if (Articulo <> '') then
  begin
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlm2 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlm3 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmV do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmV2 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmV3 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmR do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmR2 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmR3 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmM do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmM2 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlmM3 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;
  end
  else
  begin
     StockAlm.Clear;
     StockAlm2.Clear;
     StockAlm3.Clear;

     StockAlmV.Clear;
     StockAlmV2.Clear;
     StockAlmV3.Clear;

     StockAlmR.Clear;
     StockAlmR2.Clear;
     StockAlmR3.Clear;

     StockAlmM.Clear;
     StockAlmM2.Clear;
     StockAlmM3.Clear;
  end;
end;

procedure TDMAlbaranes.QMSIIDteReferenciaAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMSIIDteReferencia, 'NROLINREF', QMSIIDteReferenciaNROLINREF.AsInteger);
end;

procedure TDMAlbaranes.QMSIIDteReferenciaBeforePost(DataSet: TDataSet);
begin
  if ((QMSIIDteReferencia.State = dsInsert) or (QMSIIDteReferencia.State = dsEdit)) then
  begin
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

procedure TDMAlbaranes.QMSIIDteReferenciaNewRecord(DataSet: TDataSet);
begin
  QMSIIDteReferenciaTPODOCREF.AsString := '';
  QMSIIDteReferenciaID_S.AsInteger := QMCabeceraID_S.AsInteger;
  QMSIIDteReferenciaFOLIOREF.AsString := '';
end;

procedure TDMAlbaranes.QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO.AsFloat]);
end;

procedure TDMAlbaranes.QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_TOTAL.AsFloat]);
end;

procedure TDMAlbaranes.QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_REAL.AsFloat]);
end;

procedure TDMAlbaranes.QMDetalleTIPO_IVAChange(Sender: TField);
begin
  QMDetalleP_IVA.AsFloat := DMMain.DamePorcentajeIva(REntorno.Pais, QMDetalleTIPO_IVA.AsInteger);
end;

function TDMAlbaranes.DocumentoDteValido: boolean;

  function ExisteComuna: boolean;
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
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
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
  // Verificamos que se haya asignado un tipo de documento tributario
  if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = 'DES') then
  begin
     ShowMessage(_('Debe asignar un tipo de documento tributario al documento'));
     Result := False;
  end
  else
  // Verificamos el tipo de documento tributario sea para guia electronica
  if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '52') then
  begin
     ShowMessage(_('El tipo de documento tributario debe ser para guia electrónica'));
     Result := False;
  end
  else //Verificamos si la comuna del cliente es valida
  if (not ExisteComuna) then
  begin
     ShowMessage(_('La comuna de la direccion del cliente no es valida'));
     Result := False;
  end
  else
  // Verificamos si el documento tiene numero de folio asignado
  if (QMCabeceraFOLIO.AsInteger <> 0) then
  begin
     ShowMessage(_('La guia de despacho ya tiene asignado un número de folio'));
     Result := False;
  end
  else
  if ((QMCabeceraTITULO_GIRO_CLIENTE.AsString = '') or (QMCabeceraTITULO_GIRO_CLIENTE.AsString = 'NO ASIGNADO')) then
  begin
     ShowMessage(_('Debe asignar el giro del cliente'));
     Result := False;
  end
  else
  // Verificamos que tenga asignado un indicador de traslado
  if (QMCabeceraINDTRASLADO.AsInteger = 0) then
  begin
     ShowMessage(_('Debe asignar un indicador de traslado a la guia de despacho'));
     Result := False;
  end
  else
  // Verificamos que el documento tenga detalle
  if (QMDetalle.RecordCount = 0) then
  begin
     ShowMessage(_('El documento no tiene detalle'));
     Result := False;
  end
  else
     Result := True;
end;

procedure TDMAlbaranes.QMDetallePESO_REALChange(Sender: TField);
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

procedure TDMAlbaranes.QMDetalleALMACENChange(Sender: TField);
begin
  if (param_VENPREC002) then
     EstaleceCondiciones(QMDetalleARTICULO, 0, (QMDetalle.State in [dsInsert, dsEdit]));
end;

procedure TDMAlbaranes.xInfoActualizadaCalcFields(DataSet: TDataSet);
begin
  xInfoActualizadaRIESGO_DISPONIBLE.AsFloat := (xInfoActualizadaRIESGO_AUT.AsFloat) - (xInfoActualizadaRIESGO_ACT.AsFloat + xInfoActualizadaRIESGO_PED.AsFloat);
end;

procedure TDMAlbaranes.QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_EXT.AsFloat]);
end;

procedure TDMAlbaranes.QMDetalleUNIDADES_FACTURADASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_FACTURADAS.AsFloat]);
end;

procedure TDMAlbaranes.QMDetalleTOTAL_UNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleTOTAL_UNIDADES_EXT.AsFloat]);
end;

procedure TDMAlbaranes.QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleCANT_LOTE.AsFloat]);
end;

procedure TDMAlbaranes.xClienteAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMAlbaranes.xClienteBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMAlbaranes.xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
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

procedure TDMAlbaranes.QMDetalleUNIDADES_SECChange(Sender: TField);
begin
  // Si calcula el peso segun las unidades secundarias
  if param_VENUSEC001 and (QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger = 1) then
     QMDetallePESO.AsFloat := xArticulos.FieldByName('PESO').AsFloat * QMDetalleUNIDADES_SEC.AsFloat
  else
     QMDetallePESO.AsFloat := xArticulos.FieldByName('PESO').AsFloat * xArticulos.FieldByName('FACTOR_UNIDAD').AsFloat;

  QMDetalleUNIDADESChange(Sender);
end;

procedure TDMAlbaranes.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMAlbaranes.LoaclizaFolio;
var
  Folio : integer;
begin
  Folio := 0;
  if PideDato('INT', Folio, _('Folio')) then
  begin
     if (Folio > 0) then
     begin
        Posicionando := True;
        try
           Refrescar(QMCabecera, 'FOLIO', Folio);
        finally
           Posicionando := False;
        end;
     end;
  end;
end;

procedure TDMAlbaranes.ConectaProveedores;
begin
  xProveedores.Open;
end;

procedure TDMAlbaranes.DesconectaProveedores;
begin
  xProveedores.Close;
end;

procedure TDMAlbaranes.xProveedoresNewRecord(DataSet: TDataSet);
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

procedure TDMAlbaranes.xProveedoresAfterPost(DataSet: TDataSet);
begin
  if (xProveedoresUTILIZAR_COSTE.AsInteger = 1) then
  begin
     CierraAbreDet;
     InfoActualiza;
  end;
end;

procedure TDMAlbaranes.xProveedoresARTICULOChange(Sender: TField);
begin
  QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);
  xProveedoresNOMBRE_R_SOCIAL.AsString := DameTituloProveedor(xProveedoresPROVEEDOR.AsInteger);
  xProveedoresNOMBRE_COMERCIAL.AsString := DameNombreComercialProveedor(xProveedoresPROVEEDOR.AsInteger);
end;

procedure TDMAlbaranes.TraspasaMovimientoStock(Comentario: string; Todos: boolean = False);
var
  IdMovStock : integer;
begin
  IdMovStock := 0;

  if (not Todos) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_A_MOV(:ID_S, :CANAL_MOV, :COMENTARIO, :ID_ST_IN)';
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           Params.ByName['CANAL_MOV'].AsInteger := 1;
           Params.ByName['COMENTARIO'].AsString := Comentario;
           Params.ByName['ID_ST_IN'].AsInteger := IdMovStock;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with QMCabecera do
     begin
        First;

        while not EOF do
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_A_MOV(:ID_S, :CANAL_MOV, :COMENTARIO, :ID_ST_IN)';
                 Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
                 Params.ByName['CANAL_MOV'].AsInteger := 1;
                 Params.ByName['COMENTARIO'].AsString := Comentario;
                 Params.ByName['ID_ST_IN'].AsInteger := IdMovStock;
                 ExecQuery;
                 IdMovStock := FieldByName['ID_ST'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;
     end;
  end;

  Refrescar(QMCabecera, 'ID_S', QMCabeceraID_S.AsInteger, True, True);
end;

procedure TDMAlbaranes.MultiplicaPrecios(Factor: double);
var
  id : integer;
begin
  DMMain.LogIni('DMAlbaranes.MultiplicaPrecios');

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

function TDMAlbaranes.LotesSimplesAsignados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) FROM GES_CABECERAS_S C ');
        SQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
        SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.ID_S = :ID_S AND ');
        SQL.Add(' C.ESTADO = 0 AND ');
        SQL.Add(' A.REQUIERE_LOTE_SIMPLE = 1 AND ');
        SQL.Add(' TRIM(D.LOTE_SIMPLE) = '''' ');
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranes.DameDatosCliente(Cliente: integer; var incoterm: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CODIGO_INCOTERM ');
        SQL.Add(' FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        incoterm := FieldByName['CODIGO_INCOTERM'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
