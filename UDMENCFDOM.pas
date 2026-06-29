unit UDMENCFDOM;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSetRO, Forms,
  Controls, Windows, FIBDataSet, HYFIBQuery, IdHTTP, IdSSLOpenSSL, Dialogs, Variants, Math;

type
  TDMENCFDOM = class(TDataModule)
     xFacturaCabecera: TFIBDataSetRO;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xNcfDet: TFIBDataSetRO;
     xFormaPago: TFIBDataSetRO;
     DSxFacturaCabecera: TDataSource;
     DSxNcfDet: TDataSource;
     DSxFormaPago: TDataSource;
     xFacturaCabeceraEMPRESA: TIntegerField;
     xFacturaCabeceraEJERCICIO: TIntegerField;
     xFacturaCabeceraCANAL: TIntegerField;
     xFacturaCabeceraSERIE: TFIBStringField;
     xFacturaCabeceraTIPO: TFIBStringField;
     xFacturaCabeceraRIG: TIntegerField;
     xFacturaCabeceraALMACEN: TFIBStringField;
     xFacturaCabeceraMONEDA: TFIBStringField;
     xFacturaCabeceraFECHA: TDateTimeField;
     xFacturaCabeceraTERCERO: TIntegerField;
     xFacturaCabeceraTITULO: TFIBStringField;
     xFacturaCabeceraDIRECCION: TIntegerField;
     xFacturaCabeceraDIR_COMPLETA: TFIBStringField;
     xFacturaCabeceraDIR_NOMBRE_2: TFIBStringField;
     xFacturaCabeceraCODIGO_POSTAL: TFIBStringField;
     xFacturaCabeceraLOCALIDAD: TFIBStringField;
     xFacturaCabeceraCLIENTE: TIntegerField;
     xFacturaCabeceraCONTACTO: TIntegerField;
     xFacturaCabeceraSU_REFERENCIA: TFIBStringField;
     xFacturaCabeceraFORMA_PAGO: TFIBStringField;
     xFacturaCabeceraBANCO: TIntegerField;
     xFacturaCabeceraCAMPANYA: TIntegerField;
     xFacturaCabeceraNOTAS: TBlobField;
     xFacturaCabeceraESTADO: TIntegerField;
     xFacturaCabeceraBULTOS: TIntegerField;
     xFacturaCabeceraLINEAS: TIntegerField;
     xFacturaCabeceraBRUTO: TFloatField;
     xFacturaCabeceraI_DTO_LINEAS: TFloatField;
     xFacturaCabeceraS_BASES: TFloatField;
     xFacturaCabeceraM_BRUTO: TFloatField;
     xFacturaCabeceraC_TOTAL: TFloatField;
     xFacturaCabeceraAGENTE: TIntegerField;
     xFacturaCabeceraS_CUOTA_IVA: TFloatField;
     xFacturaCabeceraS_CUOTA_RE: TFloatField;
     xFacturaCabeceraB_DTO_LINEAS: TFloatField;
     xFacturaCabeceraDTO_PP: TFloatField;
     xFacturaCabeceraDTO_CIAL: TFloatField;
     xFacturaCabeceraI_DTO_CIAL: TFloatField;
     xFacturaCabeceraI_DTO_PP: TFloatField;
     xFacturaCabeceraB_COMISION: TFloatField;
     xFacturaCabeceraI_COMISION: TFloatField;
     xFacturaCabeceraPOR_FINANCIACION: TFloatField;
     xFacturaCabeceraI_FINANCIACION: TFloatField;
     xFacturaCabeceraLIQUIDO: TFloatField;
     xFacturaCabeceraENTRADA: TIntegerField;
     xFacturaCabeceraTRANSPORTISTA: TIntegerField;
     xFacturaCabeceraI_BASE_RETENCION: TFloatField;
     xFacturaCabeceraP_RETENCION: TFloatField;
     xFacturaCabeceraI_RETENCION: TFloatField;
     xFacturaCabeceraFUERZA_VENCIMIENTOS: TIntegerField;
     xFacturaCabeceraRIC: TIntegerField;
     xFacturaCabeceraTIPO_IRPF: TIntegerField;
     xFacturaCabeceraA_IRPF: TIntegerField;
     xFacturaCabeceraTOTAL_A_COBRAR: TFloatField;
     xFacturaCabeceraDEVOLUCION: TIntegerField;
     xFacturaCabeceraSIN_DETALLE: TIntegerField;
     xFacturaCabeceraASIENTO: TIntegerField;
     xFacturaCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     xFacturaCabeceraREGISTRO: TIntegerField;
     xFacturaCabeceraPORTES: TIntegerField;
     xFacturaCabeceraI_FINANCIACION_CANAL: TFloatField;
     xFacturaCabeceraTARIFA: TFIBStringField;
     xFacturaCabeceraCENTRO_COSTE: TIntegerField;
     xFacturaCabeceraID_S: TIntegerField;
     xFacturaCabeceraPROCESO_AUTO: TIntegerField;
     xFacturaCabeceraFECHA_ENTREGA: TDateTimeField;
     xFacturaCabeceraIDIOMA: TFIBStringField;
     xFacturaCabeceraRECT: TIntegerField;
     xFacturaCabeceraID_RECT: TIntegerField;
     xFacturaCabeceraTIPO_PORTES: TIntegerField;
     xFacturaCabeceraPOR_PORTES: TFloatField;
     xFacturaCabeceraI_PORTES: TFloatField;
     xFacturaCabeceraI_PORTES_CANAL: TFloatField;
     xFacturaCabeceraRANGO: TIntegerField;
     xFacturaCabeceraINDICE: TIntegerField;
     xFacturaCabeceraCAMBIO_FIJO: TIntegerField;
     xFacturaCabeceraVALOR_CAMB_FIJO: TFloatField;
     xFacturaCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     xFacturaCabeceraPROYECTO: TIntegerField;
     xFacturaCabeceraNOTAS_INTERNAS_KRI: TBlobField;
     xFacturaCabeceraTIPO_LINEA_KRI: TIntegerField;
     xFacturaCabeceraREGISTRO_CARTERA: TIntegerField;
     xFacturaCabeceraVENCIMIENTO: TDateTimeField;
     xFacturaCabeceraTIT_CONTACTO: TFIBStringField;
     xFacturaCabeceraMODO_IVA: TIntegerField;
     xFacturaCabeceraZ_PREFIJO_NCF: TFIBStringField;
     xFacturaCabeceraZ_CONTADOR_NCF: TFIBStringField;
     xFacturaCabeceraZ_TIPO_NCF: TIntegerField;
     xFacturaCabeceraCADENA_ORIGINAL: TBlobField;
     xFacturaCabeceraSELLO_DIGITAL: TBlobField;
     xFacturaCabeceraCERTIFICADO: TBlobField;
     xFacturaCabeceraFICHERO: TBlobField;
     xFacturaCabeceraMODIFICA_DOC: TIntegerField;
     xFacturaCabeceraNIF: TFIBStringField;
     xFacturaCabeceraRECC: TIntegerField;
     xFacturaCabeceraIMPORTE_ANTICIPO: TFloatField;
     xFacturaCabeceraSALDO_ANTICIPO_A_CIERRE_FAC: TFloatField;
     xFacturaCabeceraUSUARIO: TIntegerField;
     xFacturaCabeceraEMPLEADO_RESPONSABLE: TIntegerField;
     xFacturaCabeceraEMPLEADO_ATENCION: TIntegerField;
     xFacturaCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     xFacturaCabeceraTOTAL_ANTICIPADO: TFloatField;
     xFacturaCabeceraUNIDADES: TFloatField;
     xFacturaCabeceraPOR_PROPINA: TFloatField;
     xFacturaCabeceraPOR_RETENCION_GARANTIA: TFloatField;
     xFacturaCabeceraI_RETENCION_GARANTIA: TFloatField;
     xFacturaCabeceraFECHA_RETENCION_GARANTIA: TDateTimeField;
     xFacturaCabeceraID_DEV: TIntegerField;
     xFacturaCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField;
     xFacturaCabeceraCODIGO_GIRO_CLIENTE: TIntegerField;
     xFacturaCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField;
     xFacturaCabeceraCODIGO_GIRO_EMPRESA: TIntegerField;
     xFacturaCabeceraTIPO_VENTA: TIntegerField;
     xFacturaCabeceraCODIGO_RESPUESTA_SII: TBlobField;
     xFacturaCabeceraID_TIPO_DESPACHO: TIntegerField;
     xFacturaCabeceraFECHA_CON: TDateTimeField;
     xFacturaCabeceraFECHA_ENTREGA_REPARTO: TDateTimeField;
     xFacturaCabeceraZ_OBSERVACION: TFIBStringField;
     xFacturaCabeceraENTRADA_FACTURACION: TIntegerField;
     xFacturaCabeceraPEDIDO_CLIENTE: TFIBStringField;
     xFacturaCabeceraEMPAQUETADO_EMPRESA: TIntegerField;
     xFacturaCabeceraDIR_RECOGIDA_MANUAL: TBlobField;
     xFacturaCabeceraDIR_ENTREGA_MANUAL: TBlobField;
     xFacturaCabeceraEQUIPO_RECOGIDA: TFIBStringField;
     xFacturaCabeceraEQUIPO_ENTREGA: TFIBStringField;
     xFacturaCabeceraMATRICULA_RECOGIDA: TFIBStringField;
     xFacturaCabeceraMATRICULA_ENTREGA: TFIBStringField;
     xFacturaCabeceraFECHA_RECOGIDA_MANUAL: TDateTimeField;
     xFacturaCabeceraFECHA_ENTREGA_MANUAL: TDateTimeField;
     xFacturaCabeceraSII_ID_DOC_REF: TIntegerField;
     xFacturaCabeceraUSUARIO_CREACION: TIntegerField;
     xFacturaCabeceraVALOR_UNIDAD_FOMENTO: TFloatField;
     xFacturaCabeceraPERIODO_FACTURACION_INI: TDateTimeField;
     xFacturaCabeceraPERIODO_FACTURACION_FIN: TDateTimeField;
     xFacturaCabeceraINDSERVICIO: TIntegerField;
     xFacturaCabeceraRECIBO_PAGADO: TIntegerField;
     xFacturaCabeceraLEGAL_LITERALS: TBlobField;
     xFacturaCabeceraCOD_MOTIVO_ABONO: TIntegerField;
     xFacturaCabeceraEMITIDA_POR_TERCEROS: TIntegerField;
     xFacturaCabeceraID_FICHA_TECNICA: TIntegerField;
     xFacturaCabeceraMATRICULA: TFIBStringField;
     xFacturaCabeceraTITULO_GIRO_CLIENTE: TFIBStringField;
     xFacturaCabeceraORIGEN_DOCUMENTO: TFIBStringField;
     xNcfDetTIPO: TFIBStringField;
     xNcfDetPREFIJO: TFIBStringField;
     xNcfDetLINEA: TIntegerField;
     xNcfDetFECHA_INI: TDateTimeField;
     xNcfDetCONTADOR_INI: TIntegerField;
     xNcfDetCONTADOR_FIN: TIntegerField;
     xNcfDetCONTADOR_ACTUAL: TIntegerField;
     xNcfDetACTIVO: TIntegerField;
     xNcfDetTIPO_NCF: TIntegerField;
     xNcfDetFECHA_FIN: TDateTimeField;
     xFormaPagoTIPO_PAGO: TIntegerField;
     xTerceroCliente: TFIBDataSetRO;
     DSxTerceroCliente: TDataSource;
     xTerceroClienteTERCERO: TIntegerField;
     xTerceroClienteNOMBRE_R_SOCIAL: TFIBStringField;
     xTerceroClienteNIF: TFIBStringField;
     xTerceroClienteDIR_NOMBRE: TFIBStringField;
     xTerceroClienteTELEFONO01: TFIBStringField;
     xTerceroClienteTELEFONO02: TFIBStringField;
     xTerceroClienteEMAIL: TFIBStringField;
     xTerceroClienteNOMBRE_COMERCIAL: TFIBStringField;
     DSxEmisor: TDataSource;
     xEmisor: TFIBDataSetRO;
     xEmisorNIF: TFIBStringField;
     xEmisorNOMBRE_R_SOCIAL: TFIBStringField;
     xEmisorTELEFONO01: TFIBStringField;
     xEmisorEMAIL: TFIBStringField;
     xEmisorDIR_COMPLETA_N: TFIBStringField;
     xEmisorWEB: TFIBStringField;
     xEmisorNOMBRE_COMERCIAL: TFIBStringField;
     xFacturaDetalle: TFIBDataSetRO;
     DSxFacturaDetalle: TDataSource;
     xFacturaDetalleORDEN: TIntegerField;
     xFacturaDetalleLINEA: TIntegerField;
     xFacturaDetalleARTICULO: TFIBStringField;
     xFacturaDetalleTITULO: TFIBStringField;
     xFacturaDetalleUNIDADES: TFloatField;
     xFacturaDetallePRECIO: TFloatField;
     xFacturaDetalleI_DESCUENTO: TFloatField;
     xFacturaDetalleNOTAS: TBlobField;
     xFacturaDetalleDESCUENTO: TFloatField;
     xFacturaDetalleSIGNO_UNIDADES: TFIBStringField;
     xFacturaDetalleTIPO_IVA: TIntegerField;
     xFacturaDetalleLIQUIDO: TFloatField;
     xFacturaDetalleB_IMPONIBLE: TFloatField;
     xFacturaDetalleB_DTO_LINEA: TFloatField;
     xFacturaDetalleB_COMISION: TFloatField;
     xFacturaDetalleBRUTO: TFloatField;
     xFacturaDetalleCOMISION: TFloatField;
     xFacturaDetalleCOSTE_ADICIONAL: TFloatField;
     xFacturaDetalleP_IVA: TFloatField;
     xDGIIConfiguracion: TFIBDataSetRO;
     xDGIIConfiguracionEMPRESA: TIntegerField;
     xDGIIConfiguracionTOKEN: TFIBStringField;
     xDGIIConfiguracionURL_BASE: TFIBStringField;
     xECFVentas: TFIBDataSetRO;
     DSxECFVentas: TDataSource;
     xECFVentasID_S: TIntegerField;
     xECFVentasID_ENVIO: TFIBStringField;
     xECFVentasSTAMP_DATE: TFIBStringField;
     xECFVentasSTATUS: TFIBStringField;
     xECFVentasSECURITY_CODE: TFIBStringField;
     xECFVentasSEQUENCE_CONSUMED: TIntegerField;
     xECFVentasENCF: TFIBStringField;
     xECFVentasURL_XML: TFIBStringField;
     xECFVentasURL_PDF: TFIBStringField;
     xECFVentasXML: TMemoField;
     xECFVentasPDF: TBlobField;
     xECFVentasDOCUMENT_STAMP_URL: TFIBStringField;
     xECFVentasTRACK_ID: TFIBStringField;
     xECFVentasENVIO_RESPUESTA_JSON: TMemoField;
     xECFVentasCONSULTA_RESPUESTA_JSON: TMemoField;
     xECFVentasGOVERMENT_RESPONSE: TFIBStringField;
     xECFVentasMENSAJE_ERROR_ENVIO_ECF: TFIBStringField;
     xECFVentasSTATUS_CONSULTA: TFIBStringField;
     xECFVentasLEGAL_STATUS_CONSULTA: TFIBStringField;
     xDGIIConfiguracionID_COMPANY: TFIBStringField;
     QMDGIIReferencias: TFIBDataSetRO;
     DSQMDGIIReferencias: TDataSource;
     QMDGIIReferenciasID_S: TIntegerField;
     QMDGIIReferenciasID_S_REF: TIntegerField;
     QMDGIIReferenciasTIPO_CF_REF: TIntegerField;
     QMDGIIReferenciasENCF_REF: TFIBStringField;
     QMDGIIReferenciasTIPO_REF: TIntegerField;
     xFacturaDetalleCONTROL_STOCK: TIntegerField;
     xFacturaCabeceraTIPO_INGRESOS: TIntegerField;
     xFacturaCabeceraCompras: TFIBDataSetRO;
     xFacturaDetalleCompras: TFIBDataSetRO;
     xDGIIConfiguracionCompras: TFIBDataSetRO;
     xNcfDetCompras: TFIBDataSetRO;
     DSxFacturaCabeceraCompras: TDataSource;
     DSxFacturaDetalleCompras: TDataSource;
     DSxDGIIConfiguracionCompras: TDataSource;
     DSxNcfDetCompras: TDataSource;
     xDGIIConfiguracionComprasEMPRESA: TIntegerField;
     xDGIIConfiguracionComprasTOKEN: TFIBStringField;
     xDGIIConfiguracionComprasURL_BASE: TFIBStringField;
     xDGIIConfiguracionComprasID_COMPANY: TFIBStringField;
     xFacturaCabeceraComprasEMPRESA: TIntegerField;
     xFacturaCabeceraComprasEJERCICIO: TIntegerField;
     xFacturaCabeceraComprasCANAL: TIntegerField;
     xFacturaCabeceraComprasSERIE: TFIBStringField;
     xFacturaCabeceraComprasTIPO: TFIBStringField;
     xFacturaCabeceraComprasRIG: TIntegerField;
     xFacturaCabeceraComprasALMACEN: TFIBStringField;
     xFacturaCabeceraComprasMONEDA: TFIBStringField;
     xFacturaCabeceraComprasFECHA: TDateTimeField;
     xFacturaCabeceraComprasPROVEEDOR: TIntegerField;
     xFacturaCabeceraComprasTERCERO: TIntegerField;
     xFacturaCabeceraComprasDIRECCION: TIntegerField;
     xFacturaCabeceraComprasTITULO: TFIBStringField;
     xFacturaCabeceraComprasNOTAS: TMemoField;
     xFacturaCabeceraComprasESTADO: TIntegerField;
     xFacturaCabeceraComprasBULTOS: TIntegerField;
     xFacturaCabeceraComprasLINEAS: TIntegerField;
     xFacturaCabeceraComprasBRUTO: TFloatField;
     xFacturaCabeceraComprasI_DTO_LINEAS: TFloatField;
     xFacturaCabeceraComprasS_BASES: TFloatField;
     xFacturaCabeceraComprasS_CUOTA_IVA: TFloatField;
     xFacturaCabeceraComprasS_CUOTA_RE: TFloatField;
     xFacturaCabeceraComprasB_DTO_LINEAS: TFloatField;
     xFacturaCabeceraComprasDTO_PP: TFloatField;
     xFacturaCabeceraComprasDTO_CIAL: TFloatField;
     xFacturaCabeceraComprasI_DTO_CIAL: TFloatField;
     xFacturaCabeceraComprasI_DTO_PP: TFloatField;
     xFacturaCabeceraComprasLIQUIDO: TFloatField;
     xFacturaCabeceraComprasENTRADA: TIntegerField;
     xFacturaCabeceraComprasP_IRPF: TFloatField;
     xFacturaCabeceraComprasI_IRPF: TFloatField;
     xFacturaCabeceraComprasA_IRPF: TIntegerField;
     xFacturaCabeceraComprasTOTAL_FACTURA: TFloatField;
     xFacturaCabeceraComprasNUM_FACTURA: TFIBStringField;
     xFacturaCabeceraComprasFORMA_DE_PAGO: TFIBStringField;
     xFacturaCabeceraComprasTIPO_IRPF: TIntegerField;
     xFacturaCabeceraComprasBASE_IRPF: TFloatField;
     xFacturaCabeceraComprasDEVOLUCION: TIntegerField;
     xFacturaCabeceraComprasSIN_DETALLE: TIntegerField;
     xFacturaCabeceraComprasASIENTO: TIntegerField;
     xFacturaCabeceraComprasNOMBRE_COMERCIAL: TFIBStringField;
     xFacturaCabeceraComprasREGISTRO: TIntegerField;
     xFacturaCabeceraComprasPOR_FINANCIACION: TFloatField;
     xFacturaCabeceraComprasI_FINANCIACION: TFloatField;
     xFacturaCabeceraComprasFECHA_CON: TDateTimeField;
     xFacturaCabeceraComprasFECHA_SII: TDateTimeField;
     xFacturaCabeceraComprasSIN_RECIBOS: TIntegerField;
     xFacturaCabeceraComprasFUERZA_VENCIMIENTOS: TIntegerField;
     xFacturaCabeceraComprasI_FINANCIACION_CANAL: TFloatField;
     xFacturaCabeceraComprasCENTRO_COSTE: TIntegerField;
     xFacturaCabeceraComprasID_E: TIntegerField;
     xFacturaCabeceraComprasFECHA_ENTREGA: TDateTimeField;
     xFacturaCabeceraComprasSU_REFERENCIA: TFIBStringField;
     xFacturaCabeceraComprasRECT: TIntegerField;
     xFacturaCabeceraComprasID_RECT: TIntegerField;
     xFacturaCabeceraComprasTIPO_PORTES: TIntegerField;
     xFacturaCabeceraComprasPOR_PORTES: TFloatField;
     xFacturaCabeceraComprasI_PORTES: TFloatField;
     xFacturaCabeceraComprasI_PORTES_CANAL: TFloatField;
     xFacturaCabeceraComprasCAMBIO_FIJO: TIntegerField;
     xFacturaCabeceraComprasVALOR_CAMB_FIJO: TFloatField;
     xFacturaCabeceraComprasVALOR_CAMB_FIJO_INV: TFloatField;
     xFacturaCabeceraComprasPROYECTO: TIntegerField;
     xFacturaCabeceraComprasOBLIGA_AUTOFACTURA: TIntegerField;
     xFacturaCabeceraComprasFUERZA_MODO_IVA: TIntegerField;
     xFacturaCabeceraComprasMODO_IVA: TIntegerField;
     xFacturaCabeceraComprasZ_TIPO_BIENES: TFIBStringField;
     xFacturaCabeceraComprasZ_TIPO_NCF: TIntegerField;
     xFacturaCabeceraComprasZ_PREFIJO_NCF: TFIBStringField;
     xFacturaCabeceraComprasZ_CONTADOR_NCF: TFIBStringField;
     xFacturaCabeceraComprasMODIFICA_DOC: TIntegerField;
     xFacturaCabeceraComprasRECC: TIntegerField;
     xFacturaCabeceraComprasINVERSION_SUJETO_PASIVO: TIntegerField;
     xFacturaCabeceraComprasREGISTRO_CARTERA: TIntegerField;
     xFacturaCabeceraComprasVENCIMIENTO: TDateTimeField;
     xFacturaCabeceraComprasSFV_AUTORIZACION: TFIBStringField;
     xFacturaCabeceraComprasSFV_CODIGO_CONTROL: TFIBStringField;
     xFacturaCabeceraComprasSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField;
     xFacturaCabeceraComprasIMPORTE_ICE_TOTAL: TFloatField;
     xFacturaCabeceraComprasID_TIPO_GIRO_PRO_ACR: TIntegerField;
     xFacturaCabeceraComprasCODIGO_GIRO_PRO_ACR: TIntegerField;
     xFacturaCabeceraComprasID_TIPO_GIRO_EMPRESA: TIntegerField;
     xFacturaCabeceraComprasCODIGO_GIRO_EMPRESA: TIntegerField;
     xFacturaCabeceraComprasTIPO_COMPRA: TIntegerField;
     xFacturaCabeceraComprasCODIGO_RESPUESTA_SII: TMemoField;
     xFacturaCabeceraComprasFOLIO: TFIBStringField;
     xFacturaCabeceraComprasIMPORTE_MINIMO_PORTE: TFloatField;
     xFacturaCabeceraComprasTIPO_DOC_TRIBUTARIO: TFIBStringField;
     xFacturaCabeceraComprasS_CUOTA_IMPUESTO_ADICIONAL: TFloatField;
     xFacturaCabeceraComprasS_CUOTA_IMP_ADICIONAL_CANAL: TFloatField;
     xFacturaCabeceraComprasEMPAQUETADO_EMPRESA: TIntegerField;
     xFacturaCabeceraComprasDIR_RECOGIDA_MANUAL: TMemoField;
     xFacturaCabeceraComprasDIR_ENTREGA_MANUAL: TMemoField;
     xFacturaCabeceraComprasEQUIPO_RECOGIDA: TFIBStringField;
     xFacturaCabeceraComprasEQUIPO_ENTREGA: TFIBStringField;
     xFacturaCabeceraComprasMATRICULA_RECOGIDA: TFIBStringField;
     xFacturaCabeceraComprasMATRICULA_ENTREGA: TFIBStringField;
     xFacturaCabeceraComprasFECHA_RECOGIDA_MANUAL: TDateTimeField;
     xFacturaCabeceraComprasFECHA_ENTREGA_MANUAL: TDateTimeField;
     xFacturaCabeceraComprasIDIOMA: TFIBStringField;
     xFacturaCabeceraComprasRECIBO_PAGADO: TIntegerField;
     xFacturaCabeceraComprasUSUARIO_CREACION: TIntegerField;
     xFacturaCabeceraComprasCOD_MOTIVO_ABONO: TIntegerField;
     xFacturaCabeceraComprasNIF: TFIBStringField;
     xFacturaCabeceraComprasORIGEN_DOCUMENTO: TFIBStringField;
     xFacturaCabeceraComprasOBSERVACIONES: TFIBStringField;
     xFacturaDetalleComprasORDEN: TIntegerField;
     xFacturaDetalleComprasLINEA: TIntegerField;
     xFacturaDetalleComprasARTICULO: TFIBStringField;
     xFacturaDetalleComprasTITULO: TFIBStringField;
     xFacturaDetalleComprasUNIDADES: TFloatField;
     xFacturaDetalleComprasPRECIO: TFloatField;
     xFacturaDetalleComprasI_DESCUENTO: TFloatField;
     xFacturaDetalleComprasNOTAS: TMemoField;
     xFacturaDetalleComprasDESCUENTO: TFloatField;
     xFacturaDetalleComprasTIPO_IVA: TIntegerField;
     xFacturaDetalleComprasB_IMPONIBLE: TFloatField;
     xFacturaDetalleComprasB_DTO_LINEA: TFloatField;
     xFacturaDetalleComprasBRUTO: TFloatField;
     xFacturaDetalleComprasCOSTE_ADICIONAL: TFloatField;
     xFacturaDetalleComprasLIQUIDO: TFloatField;
     xFacturaDetalleComprasP_IVA: TFloatField;
     xNcfDetComprasTIPO: TFIBStringField;
     xNcfDetComprasSERIE: TFIBStringField;
     xNcfDetComprasPREFIJO: TFIBStringField;
     xNcfDetComprasLINEA: TIntegerField;
     xNcfDetComprasORDEN: TIntegerField;
     xNcfDetComprasFECHA_INI: TDateTimeField;
     xNcfDetComprasCONTADOR_INI: TIntegerField;
     xNcfDetComprasCONTADOR_FIN: TIntegerField;
     xNcfDetComprasCONTADOR_ACTUAL: TIntegerField;
     xNcfDetComprasACTIVO: TIntegerField;
     xNcfDetComprasTIPO_NCF: TIntegerField;
     xNcfDetComprasFECHA_FIN: TDateTimeField;
     xNcfDetComprasFOLIO_INI: TIntegerField;
     xNcfDetComprasFOLIO_FIN: TIntegerField;
     xNcfDetComprasNUM_APROBACION: TIntegerField;
     xNcfDetComprasANO_APROBACION: TIntegerField;
     xNcfDetComprasSERIE_DIR: TFIBStringField;
     xNcfDetComprasFICHERO: TFIBStringField;
     xNcfDetComprasCLAVE: TFIBStringField;
     xNcfDetComprasCERTIFICADO: TFIBStringField;
     xNcfDetComprasEMPRESA: TIntegerField;
     xNcfDetComprasCANAL: TIntegerField;
     xNcfDetComprasVERSION_NCF: TFIBStringField;
     DSxEmisorCompras: TDataSource;
     DSxTerceroProveedor: TDataSource;
     xEmisorCompras: TFIBDataSetRO;
     xTerceroProveedor: TFIBDataSetRO;
     xEmisorComprasNIF: TFIBStringField;
     xEmisorComprasNOMBRE_R_SOCIAL: TFIBStringField;
     xEmisorComprasTELEFONO01: TFIBStringField;
     xEmisorComprasEMAIL: TFIBStringField;
     xEmisorComprasDIR_COMPLETA_N: TFIBStringField;
     xEmisorComprasWEB: TFIBStringField;
     xEmisorComprasNOMBRE_COMERCIAL: TFIBStringField;
     xTerceroProveedorTERCERO: TIntegerField;
     xTerceroProveedorNOMBRE_COMERCIAL: TFIBStringField;
     xTerceroProveedorNOMBRE_R_SOCIAL: TFIBStringField;
     xTerceroProveedorTIPO_RAZON: TFIBStringField;
     xTerceroProveedorNIF: TFIBStringField;
     xTerceroProveedorDIR_CLASE: TIntegerField;
     xTerceroProveedorDIR_TIPO: TFIBStringField;
     xTerceroProveedorDIR_NOMBRE: TFIBStringField;
     xTerceroProveedorDIR_NOMBRE_2: TFIBStringField;
     xTerceroProveedorDIR_NOMBRE_3: TFIBStringField;
     xTerceroProveedorDIR_NUMERO: TFIBStringField;
     xTerceroProveedorDIR_BLOQUE_ESCALERA: TFIBStringField;
     xTerceroProveedorDIR_PISO: TFIBStringField;
     xTerceroProveedorDIR_PUERTA: TFIBStringField;
     xTerceroProveedorDIR_LOCALIDAD: TFIBStringField;
     xTerceroProveedorCOLONIA: TFIBStringField;
     xTerceroProveedorDIR_DEFECTO: TIntegerField;
     xTerceroProveedorFECHA_ALTA: TDateTimeField;
     xTerceroProveedorNOTAS: TMemoField;
     xTerceroProveedorTELEFONO01: TFIBStringField;
     xTerceroProveedorTELEFONO02: TFIBStringField;
     xTerceroProveedorTELEFAX: TFIBStringField;
     xTerceroProveedorEMAIL: TFIBStringField;
     xTerceroProveedorWEB: TFIBStringField;
     xTerceroProveedorIMAGEN: TIntegerField;
     xTerceroProveedorCLIENTE_POTENCIAL: TIntegerField;
     xTerceroProveedorCODIGO_EDI: TFIBStringField;
     xTerceroProveedorREGISTRO_MERCANTIL: TFIBStringField;
     xTerceroProveedorTIT_LOCALIDAD: TFIBStringField;
     xTerceroProveedorCODIGO_POSTAL: TFIBStringField;
     xTerceroProveedorID_LOCAL: TIntegerField;
     xTerceroProveedorFECHA_NACIMIENTO: TDateTimeField;
     xTerceroProveedorCARNET_APLICADOR: TFIBStringField;
     xTerceroProveedorFECHA_VALIDEZ_CARNET_APLICADOR: TDateTimeField;
     xTerceroProveedorLATITUD: TFloatField;
     xTerceroProveedorLONGITUD: TFloatField;
     xTerceroProveedorPAIS_TERCERO: TFIBStringField;
     xTerceroProveedorTIPO_DOC_IDENT: TFIBStringField;
     xTerceroProveedorPAIS_DIRECCION: TFIBStringField;
     xTerceroProveedorPROVINCIA_DIRECCION: TFIBStringField;
     xTerceroProveedorREGION_DIRECCION: TFIBStringField;
     xTerceroProveedorPOBLACION_DIRECCION: TFIBStringField;
     xTerceroProveedorDIRECCION: TIntegerField;
     xTerceroProveedorDIR_TRANSPORTISTA: TIntegerField;
     xTerceroProveedorDIRECCION_LITERAL: TMemoField;
     xTerceroProveedorDIRECCION_CODIGO_POSTAL: TFIBStringField;
     xTerceroProveedorTITULO_REGION: TFIBStringField;
     xTerceroProveedorTITULO_PROVINCIA: TFIBStringField;
     xTerceroProveedorTITULO_POBLACION: TFIBStringField;
     xTerceroProveedorTITULO_CODIGO_POSTAL: TFIBStringField;
     xTerceroProveedorTITULO_PROVINCIA_LOC: TFIBStringField;
     xTerceroProveedorCOMO_NOS_CONOCIERON: TIntegerField;
     xFacturaDetalleComprasCONTROL_STOCK: TIntegerField;
     xECFCompras: TFIBDataSetRO;
     DSxECFCompras: TDataSource;
     xECFComprasID_E: TIntegerField;
     xECFComprasSTAMP_DATE: TFIBStringField;
     xECFComprasSTATUS: TFIBStringField;
     xECFComprasSECURITY_CODE: TFIBStringField;
     xECFComprasSEQUENCE_CONSUMED: TIntegerField;
     xECFComprasENCF: TFIBStringField;
     xECFComprasURL_XML: TFIBStringField;
     xECFComprasURL_PDF: TFIBStringField;
     xECFComprasXML: TMemoField;
     xECFComprasPDF: TBlobField;
     xECFComprasDOCUMENT_STAMP_URL: TFIBStringField;
     xECFComprasTRACK_ID: TFIBStringField;
     xECFComprasENVIO_RESPUESTA_JSON: TMemoField;
     xECFComprasCONSULTA_RESPUESTA_JSON: TMemoField;
     xECFComprasGOVERMENT_RESPONSE: TFIBStringField;
     xECFComprasMENSAJE_ERROR_ENVIO_ECF: TFIBStringField;
     xECFComprasSTATUS_CONSULTA: TFIBStringField;
     xECFComprasLEGAL_STATUS_CONSULTA: TFIBStringField;
     xECFComprasMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField;
     xECFComprasID_ENVIO: TFIBStringField;
     xFacturaDetalleComprasP_COSTE: TFloatField;
     xTerceroClienteTIPO_DOC_IDENT: TFIBStringField;
     xTerceroClientePAIS_TERCERO: TFIBStringField;
     xFacturaCabeceraComprasDOM_ID_TIPO_RETENCION: TIntegerField;
     xFacturaCabeceraComprasDOM_RET_POR_ITBIS: TFloatField;
     xFacturaCabeceraComprasDOM_RET_POR_ISR: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xFacturaCabeceraAfterOpen(DataSet: TDataSet);
     procedure xFacturaCabeceraBeforeClose(DataSet: TDataSet);
     procedure xFacturaCabeceraComprasAfterOpen(DataSet: TDataSet);
     procedure xFacturaCabeceraComprasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     TipoEcf: integer;
     Resource: string;
     {
     WSSecureProtocol: boolean;
     WSURL: string;
     WSKey: string;
     WSAssociate: string;
     }
     function GeneraFicheroJson(ID_S: integer): string;
     function GeneraFicheroJsonCompras(ID_E: integer): string;
     procedure ObtieneDatosFacturaDelfos(ID_S: integer);
     procedure ObtieneDatosComprasFacturaDelfos(ID_E: integer);
     procedure PostJsonIdHTTP(TipoDocumento, Token, UrlConsulta, FicheroJson: string; var CodigoDeRespuesta: integer; Respuesta: TStrings; MensajeError: TStrings);
     procedure GetJsonIdHTTP(Token, UrlConsulta: string; var CodigoDeRespuesta: integer; Respuesta: TStrings; MensajeError: TStrings);
     procedure LeeYGuardaDatosDeConsulta(IdDoc, CodigoDeRespuesta: integer; Respuesta, MensajeError: TStrings; DocVenta: boolean = True);
     function LeeYGuardaDatosDeEnvio(IdDoc, CodigoDeRespuesta: integer; Respuesta, MensajeError: TStrings; DocVenta: boolean = True): string;
     function DameFormaDePagoDGII(FormaDePago: string): integer;
  public
     { Public declarations }
     procedure EnviaEcf(IdDoc: integer; DocVenta: boolean = True);
     procedure ConsultaEcf(IdDoc: integer; DocVenta: boolean = True);
  end;

var
  DMENCFDOM : TDMENCFDOM;

implementation

uses
  UDMMain, UlkJSON, UUtiles, UFInformacionEnvioDte, UFormGest, WinInet, HttpConnectionWinInet,
  UDMAdjunto, DateUtils;

{$R *.dfm}

procedure TDMENCFDOM.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

function TDMENCFDOM.GeneraFicheroJson(ID_S: integer): string;
var
  TieneItbisI1, TieneItbisI2, TieneItbisI3 : boolean;
  JSONRoot, JSONCompany, JSONIdDoc, JSONEmisor, JSONComprador, JSONTotales : TlkJSONobject;
  JSONReferencias : TlkJSONobject;
  JSONDetalleItems, JSONCodigoTablaItem, JSONSubdescuentoTablaItem : TlkJSONlist;
  JSONDetalleItem, JSONItemCodigo, JSONItemSubDescuento : TlkJSONobject;
  Linea, IndicadorFacturacion, Factor : integer;
  FormaPago, DiasEntreNCYDoc : integer;
  RutComprador, PaisComprador, RazonSocialComprador, ContactoComprador : string;
  CorreoComprador, DireccionComprador, CiudadComprador, CodigoPostal : string;
  NcfModifiedDate : TDateTime;
  TipoDocIdent : string;

  function TieneItbis(IdS, PIVA: integer): boolean;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COUNT(TIPO_IVA) EXISTE ');
           SQL.Add(' FROM GES_CABECERAS_S_REDONDEOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_S = :ID_S AND ');
           SQL.Add(' P_IVA = :P_IVA ');
           Params.ByName['ID_S'].AsInteger := IdS;
           Params.ByName['P_IVA'].AsFloat := PIVA;
           ExecQuery;
           Result := (FieldByName['EXISTE'].AsInteger > 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  /// Crea fichero con formato JSON de la factura.
  /// Devuelve ruta y nombre del fichero generado. (%TEMP%\factura_electronica-[ID_S].json)
  Result := '';

  // Crear el objeto JSON principal
  JSONRoot := TlkJSONobject.Create;
  TieneItbisI1 := TieneItbis(ID_S, 18);
  TieneItbisI2 := TieneItbis(ID_S, 16);
  TieneItbisI3 := TieneItbis(ID_S, 0);


  if (TipoEcf = 34) then
     Factor := -1
  else
     Factor := 1;

  try
     // Seccion Company
     JSONCompany := TlkJSONobject.Create;
     JSONCompany.Add('id', Trim(xDGIIConfiguracionID_COMPANY.AsString));
     JSONRoot.Add('company', JSONCompany);

     // Sección idDoc
     JSONIdDoc := TlkJSONobject.Create;
     JSONIdDoc.Add('encf', Trim(xFacturaCabeceraZ_PREFIJO_NCF.AsString) + Ajusta(Trim(xFacturaCabeceraZ_CONTADOR_NCF.AsString), 'I', 10, '0'));
     if (TipoEcf = 34) then
     begin
        // Obtenemos fecha del documento origen
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FECHA FROM GES_CABECERAS_S WHERE ');
              SQL.Add(' ID_S = :ID_S ');
              Params.ByName['ID_S'].AsInteger := QMDGIIReferenciasID_S_REF.AsInteger;
              ExecQuery;
              // Fecha sin hora
              NcfModifiedDate := RecodeTime(FieldByName['FECHA'].AsDateTime, 0, 0, 0, 0);
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Dias enteros entre fecha de factura y fecha del documento origen
        // Ambas fechas sin hora
        DiasEntreNCYDoc := DaysBetween(RecodeTime(xFacturaCabeceraFECHA.AsDateTime, 0, 0, 0, 0), NcfModifiedDate); // Trunc(xFacturaCabeceraFECHA.AsDateTime - NcfModifiedDate);

        if (DiasEntreNCYDoc > 30) then
           JSONIdDoc.Add('creditNoteIndicator', 1)
        else
           JSONIdDoc.Add('creditNoteIndicator', 0);

     end;

     JSONIdDoc.Add('sequenceDueDate', FormatDateTime('yyyy-mm-dd', xNcfDetFECHA_FIN.AsDateTime));

     // -Condicional-
     // Indica si en la línea de detalle, el monto se encuentra con ITBIS incluido (impuestos adicionales no están incluidos en el precio del item).
     // Condicional a que el bien o servicio sea gravado con ITBIS.Indica si en la línea de detalle, el monto se encuentra con ITBIS incluido (impuestos adicionales no están incluidos en el precio del item).
     // Condicional a que el bien o servicio sea gravado con ITBIS.
     //           a) Valor 0 si los montos en las líneas sección B “Detalle de Bienes o Servicios” no tienen ITBIS incluido.
     //           b) Valor 1 si los montos en las líneas sección B “Detalle de Bienes o Servicios” se encuentran con ITBIS incluido.

     if ((TipoEcf = 31) or (TipoEcf = 32) or (TipoEcf = 34) or (TipoEcf = 45)) then
        JSONIdDoc.Add('taxAmountIndicator', 0);

     // TODO - Verificar si es correcto
     // -Obligatorio-
     // Indica el tipo de ingreso recibido, según clasificación del formato de envío de ventas de Bienes o Servicios.
     //           a) Código Tipo:
     //                   01: Ingresos por operaciones (No financieros). -  Valor para la API 1
     //                   02: Ingresos Financieros - Valor para la API 2
     //                   03: Ingresos Extraordinarios - Valor para la API 3
     //                   04: Ingresos por Arrendamientos - Valor para la API 4
     //                   05: Ingresos por Venta de Activo Depreciable - Valor para la API 5
     //                   06: Otros Ingresos

     if ((TipoEcf = 31) or
        (TipoEcf = 32) or
        (TipoEcf = 33) or
        (TipoEcf = 34) or
        (TipoEcf = 44) or
        (TipoEcf = 45) or
        (TipoEcf = 46)) then
        JSONIdDoc.Add('incomeType', xFacturaCabeceraTIPO_INGRESOS.AsInteger);

     // -Obligatorio-
     // Indica el tipo de pago del cliente.
     // Las facturas por entrega gratuita(código 3), no son válidas para crédito fiscal.
     //   a) Código Tipo:
     //           1: Contado
     //           2: Crédito
     //           3: Gratuito
     // * Se incluye en todos los tipos de documentos para el 43 y 47 es opcional

     FormaPago := DameFormaDePagoDGII(xFacturaCabeceraFORMA_PAGO.AsString);
     JSONIdDoc.Add('paymentType', FormaPago);

     // Solo para facturas a crédito. Condicional a que el tipo de pago sea a crédito.
     if ((TipoEcf <> 46) and (FormaPago = 2)) then
        JSONIdDoc.Add('paymentDeadline', FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA_CON.AsDateTime));


     JSONRoot.Add('idDoc', JSONIdDoc);

     // Seccion Emisor
     JSONEmisor := TlkJSONobject.Create;
     JSONEmisor.Add('rnc', xEmisorNIF.AsString);
     JSONEmisor.Add('companyName', xEmisorNOMBRE_R_SOCIAL.AsString);
     JSONEmisor.Add('tradename', xEmisorNOMBRE_COMERCIAL.AsString);
     JSONEmisor.Add('branchOffice', 'xxx');
     JSONEmisor.Add('address', Trim(xEmisorDIR_COMPLETA_N.AsString));
     JSONEmisor.Add('stampDate', FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime));
     JSONRoot.Add('sender', JSONEmisor);

     // Seccion Comprador
     RutComprador := '';
     PaisComprador := '';
     RazonSocialComprador := '';
     ContactoComprador := '';
     CorreoComprador := '';
     DireccionComprador := '';
     CiudadComprador := '';
     CodigoPostal := '';
     TipoDocIdent := '';

     JSONComprador := TlkJSONobject.Create;

     if (xFacturaCabeceraCLIENTE.AsInteger = -1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT NIF, COALESCE(NOMBRE, ''DESCONOCIDO'') AS NOMBRE, ');
              SQL.Add(' COALESCE(TELEFONO01, ''DESCONOCIDO'') AS TELEFONO01, ');
              SQL.Add(' COALESCE(EMAIL, ''DESCONOCIDO'') AS EMAIL, COALESCE(DIRECCION, ''DESCONOCIDO'') AS DIRECCION, ');
              SQL.Add(' COALESCE(PROVINCIA, ''DESCONOCIDO'') AS PROVINCIA, COALESCE(C_POSTAL, ''DESCONOCIDO'') AS C_POSTAL, ');
              SQL.Add(' COALESCE(PAIS, ''DESCONOCIDO'') AS PAIS, TIPO_DOC_IDENT ');
              SQL.Add(' FROM GES_CABECERAS_S_FAC_NIF ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_S = :ID_S ');
              Params.ByName['ID_S'].AsInteger := xFacturaCabeceraID_S.AsInteger;
              ExecQuery;
              RutComprador := FieldByName['NIF'].AsString;
              PaisComprador := FieldByName['PAIS'].AsString;
              RazonSocialComprador := QuitarAcentosTexto(FieldByName['NOMBRE'].AsString);
              ContactoComprador := FieldByName['TELEFONO01'].AsString;
              CorreoComprador := FieldByName['EMAIL'].AsString;
              DireccionComprador := QuitarAcentosTexto(FieldByName['DIRECCION'].AsString);
              CiudadComprador := QuitarAcentosTexto(FieldByName['PROVINCIA'].AsString);
              CodigoPostal := FieldByName['C_POSTAL'].AsString;
              TipoDocIdent := FieldByName['TIPO_DOC_IDENT'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        RutComprador := xTerceroClienteNIF.AsString;
        TipoDocIdent := xTerceroClienteTIPO_DOC_IDENT.AsString;
        RazonSocialComprador := xTerceroClienteNOMBRE_R_SOCIAL.AsString;
        DireccionComprador := xFacturaCabeceraDIR_COMPLETA.AsString;
        PaisComprador := xTerceroClientePAIS_TERCERO.AsString;
     end;

     if ((TipoDocIdent = 'PAS') and (PaisComprador <> 'DOM')) then
        JSONComprador.Add('foreignIdentifier', RutComprador)
     else
     begin
        if (RutComprador > '') then
           JSONComprador.Add('rnc', RutComprador);
     end;

     JSONComprador.Add('companyName', RazonSocialComprador);
     JSONComprador.Add('address', DireccionComprador);
     JSONRoot.Add('buyer', JSONComprador);

     // Seccion totales
     JSONTotales := TlkJSONobject.Create;

     if (
        (TipoEcf = 31) or
        (TipoEcf = 32) or
        (TipoEcf = 33) or
        (TipoEcf = 34) or
        (TipoEcf = 45)
        ) then
     begin
        // Monto Gravado Total - Condicional
        // Total de la suma de valores de monto gravado ITBIS a diferentes tasas.
        // Condicional a que exista Monto gravado1, y/o Monto gravado 2 y/o Monto gravado 3.
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_S_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_S = :ID_S ');
              Params.ByName['ID_S'].AsInteger := ID_S;
              ExecQuery;
              JSONTotales.Add('totalTaxedAmount', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Monto Gravado ITBIS Tasa 1 -Condicional
        // Total de la suma de valores de Ítems gravados asignados a ITBIS tasa 1 (tasa 18%), menos descuentos más recargos.
        // Condicional a que en la línea de detalle exista algún ítem gravado a tasa ITBIS1.
        if (TieneItbisI1) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_S_REDONDEOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' P_IVA = 18 ');
                 Params.ByName['ID_S'].AsInteger := ID_S;
                 ExecQuery;
                 JSONTotales.Add('i1AmountTaxed', (FieldByName['SUM'].AsFloat * Factor));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // MontoGravadoI2 - Condicional
        // Total de la suma de valores de Ítems gravados asignados a ITBIS tasa 2(tasa 16%), menos descuentos más recargos.
        // Condicional a que en la línea de detalle exista algún ítem gravado a tasa ITBIS2.
        if (TieneItbisI2) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_S_REDONDEOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' P_IVA = 16 ');
                 Params.ByName['ID_S'].AsInteger := ID_S;
                 ExecQuery;
                 JSONTotales.Add('i2AmountTaxed', (FieldByName['SUM'].AsFloat * Factor));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // MontoGravadoI3 - Condicional
        // Total de la suma de valores de Ítems gravados asignados a ITBIS tasa 3 (tasa 0%), menos descuentos más recargos.
        // Condicional a que en la línea de detalle exista algún ítem gravado a tasa ITBIS3.
        if (TieneItbisI3) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_S_REDONDEOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' P_IVA = 0 ');
                 Params.ByName['ID_S'].AsInteger := ID_S;
                 ExecQuery;
                 JSONTotales.Add('i3AmountTaxed', (FieldByName['SUM'].AsFloat * Factor));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // TODO - Monto Exento - Condicional **** Pendiente de preguntar cual es la diferencia con tipo de Iva cero****

        // ITBIS Tasa 1 - Condicional
        // Tasa de ITBIS 1 (18%).
        // Condicional a que en la línea de detalle exista ítem gravado a tasa 1.
        if (TieneItbisI1) then
           JSONTotales.Add('itbisS1', 18);

        // ITBIS Tasa 2 - Condicional
        // Tasa de ITBIS 2 (16%).
        // Condicional a que en la línea de detalle exista ítem gravado a tasa 2.
        if (TieneItbisI2) then
           JSONTotales.Add('itbisS2', 16);

        // ITBIS Tasa 3 - Condicional
        // Tasa de ITBIS 3 (0%).
        // Condicional a que en la línea de detalle exista ítem gravado a tasa 3.
        if (TieneItbisI3) then
           JSONTotales.Add('itbisS3', 0);

        // TotalITBIS
        // Total de la suma de valores de ITBIS a diferentes tasas.
        // Condicional a que exista Total ITBIS Tasa 1, y/o Total ITBIS Tasa 2 y/o Total ITBIS Tasa 3.
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_S_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_S = :ID_S ');
              Params.ByName['ID_S'].AsInteger := ID_S;
              ExecQuery;
              JSONTotales.Add('itbisTotal', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Total ITBIS Tasa 1
        // Valor numérico igual a Monto Gravado ITBIS Tasa2*tasa ITBIS 2.
        // Condicional a que exista Monto Gravado tasa 2 y tasa ITBIS 2.
        if (TieneItbisI1) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_S_REDONDEOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' P_IVA = 18 ');
                 Params.ByName['ID_S'].AsInteger := ID_S;
                 ExecQuery;
                 JSONTotales.Add('itbis1Total', (FieldByName['SUM'].AsFloat * Factor));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Total ITBIS Tasa 2
        // Valor numérico igual a Monto Gravado ITBIS Tasa2*tasa ITBIS 2.
        // Condicional a que exista Monto Gravado tasa 2 y tasa ITBIS 2.
        if (TieneItbisI2) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_S_REDONDEOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' P_IVA = 16 ');
                 Params.ByName['ID_S'].AsInteger := ID_S;
                 ExecQuery;
                 JSONTotales.Add('itbis2Total', (FieldByName['SUM'].AsFloat * Factor));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Total ITBIS Tasa3
        // Valor numérico igual a Monto gravado ITBIS Tasa3*tasa ITBIS 3.
        // Condicional a que exista Monto Gravado tasa 3 y tasa ITBIS 3.
        if (TieneItbisI3) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_S_REDONDEOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' P_IVA = 0');
                 Params.ByName['ID_S'].AsInteger := ID_S;
                 ExecQuery;
                 JSONTotales.Add('itbis3Total', (FieldByName['SUM'].AsFloat * Factor));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;

     if (TipoEcf = 34) then
        JSONTotales.Add('totalAmount', xFacturaCabeceraLIQUIDO.AsFloat * Factor)
     else
        JSONTotales.Add('totalAmount', xFacturaCabeceraLIQUIDO.AsFloat);
     JSONRoot.Add('totals', JSONTotales);

     // Seccion de detalle
     JSONDetalleItems := TlkJSONlist.Create;
     Linea := 1;
     with xFacturaDetalle do
     begin
        First;

        while not EOF do
        begin
           // Item
           JSONDetalleItem := TlkJSONobject.Create;
           // Indicador de Facturación - Obligatorio
           // Indica si el ítem es exento, si es gravado, o No facturable. Indicará las distintas tasas:
           // 0: No Facturable
           // ITBIS 1: ítem gravado a ITBIS tasa1 (18%).
           // ITBIS 2: ítem gravado a ITBIS tasa2 (16%).
           // ITBIS 3: ítem gravado a ITBIS tasa3 (0%).
           // E: Exento TODO - Verificar si es exento
           IndicadorFacturacion := 0;
           if (xFacturaDetalleP_IVA.AsFloat = 18) then
              IndicadorFacturacion := 1
           else
           if (xFacturaDetalleP_IVA.AsFloat = 16) then
              IndicadorFacturacion := 2
           else
           if (xFacturaDetalleP_IVA.AsFloat = 0) then
              IndicadorFacturacion := 3;

           // Para la factura de regimenes especiales el indicador de facturación tiene que ser igual a 4 (Exento)
           if (TipoEcf = 44) then
              JSONDetalleItem.Add('billingIndicator', 4)
           else
              JSONDetalleItem.Add('billingIndicator', IndicadorFacturacion);

           // Indicador Bien o Servicio - Obligatorio
           // Identifica si el ítem corresponde a Bien o Servicio.
           // a) Indicar si es Valor: TODO: Averiguar como definir este indicador
           // 1: Bien
           // 2: Servicio
           if (xFacturaDetalleCONTROL_STOCK.AsInteger = 1) then
              JSONDetalleItem.Add('goodServiceIndicator', 1)
           else
              JSONDetalleItem.Add('goodServiceIndicator', 2);

           JSONDetalleItem.Add('lineNumber', Linea);

           // Datos de Codigo del Item
           JSONCodigoTablaItem := TlkJSONlist.Create;
           JSONItemCodigo := TlkJSONobject.Create;

           // Tipo Código - Opcional
           // Tipo de codificación utilizada para el ítem
           // Standard: EAN, PLU, DUN o Interna (Hasta 5 tipos de códigos)
           JSONItemCodigo.Add('codeType', 'Interna');
           JSONItemCodigo.Add('itemCode', Copy(xFacturaDetalleARTICULO.AsString, 1, 14));
           JSONCodigoTablaItem.Add(JSONItemCodigo);
           JSONDetalleItem.Add('itemCodeTable', JSONCodigoTablaItem);

           JSONDetalleItem.Add('itemName', Copy(xFacturaDetalleTITULO.AsString, 1, 80));
           JSONDetalleItem.Add('quantityItem', (xFacturaDetalleUNIDADES.AsFloat * Factor));
           JSONDetalleItem.Add('unitPriceItem', xFacturaDetallePRECIO.AsFloat);

           // Monto Descuento
           // Totaliza todos los subdescuentos otorgados al ítem en montos.
           // Condicional a que exista Monto Subdescuento.
           if (xFacturaDetalleI_DESCUENTO.AsFloat > 0) then
           begin
              JSONDetalleItem.Add('DescuentoMonto', FloatToStr(xFacturaDetalleI_DESCUENTO.AsFloat));

              // Detalle de descuentos
              // Condicional a que exista descuento en el ítem. Se pueden incluir 12 repeticiones. Incluye los tres campos siguientes:
              // *** De momento ponemos solo un descuento por linea
              // Datos de Codigo del Item
              JSONSubdescuentoTablaItem := TlkJSONlist.Create;
              JSONItemSubDescuento := TlkJSONobject.Create;

              // Indica si el Subdescuento está en monto ($) o porcentaje (%). Condicional a que exista descuento en el ítem.
              if (TipoEcf <> 44) then
                 JSONItemSubDescuento.Add('TipoSubDescuento', '$');

              // Correspondiente al valor del descuento expresado en monto.
              // Si va el subdescuento en %, deberá ir el monto del subdescuento.
              JSONItemSubDescuento.Add('MontoSubDescuento', FloatToStr(xFacturaDetalleI_DESCUENTO.AsFloat));
              JSONSubdescuentoTablaItem.Add(JSONItemSubDescuento);
              JSONDetalleItem.Add('TablaSubDescuento', JSONSubdescuentoTablaItem);
           end;

           // TODO - Verificar si es correcto
           {Seguramente será B_DTO_LINEA - solo Base Imponible = Unidades x (Precio - descuento)}
           JSONDetalleItem.Add('itemAmount', (xFacturaDetalleB_IMPONIBLE.AsFloat * Factor));

           JSONDetalleItems.Add(JSONDetalleItem);
           Inc(Linea);
           Next;
        end;

        JSONRoot.Add('itemDetails', JSONDetalleItems);
     end;

     if (TipoEcf = 34) then
     begin
        // Seccion Referencias
        JSONReferencias := TlkJSONobject.Create;
        // Es el número del comprobante fiscal que será afectado o remplazado por una secuencia electrónica.
        // Tanto el comprobante afectado o reemplazado, como la secuencia electrónica, deben estar emitidos por el mismo RNC/Cédula.
        // Condicional a que la emisión del e-CF corresponda a un reemplazo de Comprobante Fiscal no electrónico emitido en contingencia.
        JSONReferencias.Add('ncfModified', Trim(QMDGIIReferenciasENCF_REF.AsString));
        // Fecha del número de comprobante fiscal modificado.
        // Condicional a que la emisión del e-CF corresponda a un
        // reemplazo de Comprobante Fiscal no electrónico emitido en contingencia.


        JSONReferencias.Add('ncfModifiedDate', FormatDateTime('yyyy-mm-dd', NcfModifiedDate));

        // Código utilizado para indicar si el e-CF del comprobante fiscal modificado es con la finalidad de:
        // 1- Anulación total
        // 2- Corrige texto del comprobante fiscal modificado
        // 3- Corrige montos del NCF modificado
        // 4- Reemplazo NCF emitido en contingencia
        JSONReferencias.Add('modificationCode', QMDGIIReferenciasTIPO_REF.AsInteger);
        JSONRoot.Add('informationReference', JSONReferencias);
     end;

     // Guardo el JSON en un archivo
     with TStringList.Create do
     begin
        try
           Text := TlkJSON.GenerateText(JSONRoot);
           Result := DameTempPath + format('factura_electronica-%d.json', [ID_S]);
           SaveToFile(Result);
        finally
           Free;
        end;
     end;
  finally
     // JSONRoot.Free;
  end;
end;

function TDMENCFDOM.GeneraFicheroJsonCompras(ID_E: integer): string;
var
  TieneItbisI1, TieneItbisI2, TieneItbisI3 : boolean;
  JSONRoot, JSONCompany, JSONIdDoc, JSONEmisor, JSONComprador, JSONTotales : TlkJSONobject;
  JSONReferencias : TlkJSONobject;
  JSONDetalleItems, JSONCodigoTablaItem, JSONSubdescuentoTablaItem, JSONRetentionTabla : TlkJSONlist;
  JSONDetalleItem, JSONItemCodigo, JSONItemSubDescuento, JSONRetention : TlkJSONobject;
  Linea, IndicadorFacturacion, Factor : integer;
  FormaPago : integer;
  TotalRetencion, ItbisTotal, IsrTotalRetention, TotalTaxedAmount : double;
  RutComprador, PaisComprador, RazonSocialComprador, ContactoComprador : string;
  CorreoComprador, DireccionComprador, CiudadComprador, CodigoPostal : string;
  TipoDocIdent : string;
  goodServiceIndicator : integer;

  function TieneItbis(IdE, PIVA: integer): boolean;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COUNT(TIPO_IVA) EXISTE ');
           SQL.Add(' FROM GES_CABECERAS_E_REDONDEOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_E = :ID_E AND ');
           SQL.Add(' P_IVA = :P_IVA ');
           Params.ByName['ID_E'].AsInteger := IdE;
           Params.ByName['P_IVA'].AsFloat := PIVA;
           ExecQuery;
           Result := (FieldByName['EXISTE'].AsInteger > 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  /// Crea fichero con formato JSON de la factura.
  /// Devuelve ruta y nombre del fichero generado. (%TEMP%\factura_electronica-[ID_S].json)
  Result := '';

  // Crear el objeto JSON principal
  JSONRoot := TlkJSONobject.Create;
  TieneItbisI1 := TieneItbis(ID_E, 18);
  TieneItbisI2 := TieneItbis(ID_E, 16);
  TieneItbisI3 := TieneItbis(ID_E, 0);

  Factor := 1;

  try
     // Seccion Company
     JSONCompany := TlkJSONobject.Create;
     JSONCompany.Add('id', Trim(xDGIIConfiguracionComprasID_COMPANY.AsString));
     JSONRoot.Add('company', JSONCompany);

     // Sección idDoc
     JSONIdDoc := TlkJSONobject.Create;
     JSONIdDoc.Add('encf', Trim(xFacturaCabeceraComprasZ_PREFIJO_NCF.AsString) + Ajusta(Trim(xFacturaCabeceraComprasZ_CONTADOR_NCF.AsString), 'I', 10, '0'));
     {
     if (TipoEcf = 34) then
        JSONIdDoc.Add('creditNoteIndicator', 1);
     }
     JSONIdDoc.Add('sequenceDueDate', FormatDateTime('yyyy-mm-dd', xNcfDetComprasFECHA_FIN.AsDateTime));

     // -Condicional-
     // Indica si en la línea de detalle, el monto se encuentra con ITBIS incluido (impuestos adicionales no están incluidos en el precio del item).
     // Condicional a que el bien o servicio sea gravado con ITBIS.Indica si en la línea de detalle, el monto se encuentra con ITBIS incluido (impuestos adicionales no están incluidos en el precio del item).
     // Condicional a que el bien o servicio sea gravado con ITBIS.
     //           a) Valor 0 si los montos en las líneas sección B “Detalle de Bienes o Servicios” no tienen ITBIS incluido.
     //           b) Valor 1 si los montos en las líneas sección B “Detalle de Bienes o Servicios” se encuentran con ITBIS incluido.

     if (TipoEcf = 41) then
        JSONIdDoc.Add('taxAmountIndicator', 0);

     // TODO - Verificar si es correcto
     // -Obligatorio-
     // Indica el tipo de ingreso recibido, según clasificación del formato de envío de ventas de Bienes o Servicios.
     //           a) Código Tipo:
     //                   01: Ingresos por operaciones (No financieros). -  Valor para la API 1
     //                   02: Ingresos Financieros - Valor para la API 2
     //                   03: Ingresos Extraordinarios - Valor para la API 3
     //                   04: Ingresos por Arrendamientos - Valor para la API 4
     //                   05: Ingresos por Venta de Activo Depreciable - Valor para la API 5
     //                   06: Otros Ingresos

     {
     if ((TipoEcf = 31) or
        (TipoEcf = 32) or
        (TipoEcf = 33) or
        (TipoEcf = 34) or
        (TipoEcf = 44) or
        (TipoEcf = 45) or
        (TipoEcf = 46)) then
        JSONIdDoc.Add('incomeType', xFacturaCabeceraTIPO_INGRESOS.AsInteger);
     }

     // -Obligatorio-
     // Indica el tipo de pago del cliente.
     // Las facturas por entrega gratuita(código 3), no son válidas para crédito fiscal.
     //   a) Código Tipo:
     //           1: Contado
     //           2: Crédito
     //           3: Gratuito
     // * Se incluye en todos los tipos de documentos para el 43 y 47 es opcional

     FormaPago := DameFormaDePagoDGII(xFacturaCabeceraComprasFORMA_DE_PAGO.AsString);
     JSONIdDoc.Add('paymentType', FormaPago);

     // En compras electronicas si FP es credito se asigna fecha de vencimiento
     if ((TipoEcf = 41) or (TipoEcf = 43)) then
        if (FormaPago = 2) then
           JSONIdDoc.Add('paymentDeadline', FormatDateTime('yyyy-mm-dd', xFacturaCabeceraComprasVENCIMIENTO.AsDateTime));

     // Solo para facturas a crédito. Condicional a que el tipo de pago sea a crédito.
     {
     if ((TipoEcf <> 46) and (FormaPago = 2)) then
        JSONIdDoc.Add('paymentDeadline', FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA_CON.AsDateTime));
     }

     JSONRoot.Add('idDoc', JSONIdDoc);

     // Seccion Emisor
     JSONEmisor := TlkJSONobject.Create;
     JSONEmisor.Add('rnc', xEmisorComprasNIF.AsString);
     JSONEmisor.Add('companyName', xEmisorComprasNOMBRE_R_SOCIAL.AsString);
     {
     JSONEmisor.Add('tradename', xEmisorNOMBRE_COMERCIAL.AsString);
     JSONEmisor.Add('branchOffice', 'xxx');
     }
     JSONEmisor.Add('address', Trim(xEmisorComprasDIR_COMPLETA_N.AsString));
     JSONEmisor.Add('stampDate', FormatDateTime('yyyy-mm-dd', xFacturaCabeceraComprasFECHA.AsDateTime));
     JSONRoot.Add('sender', JSONEmisor);

     if (TipoEcf <> 43) then //No se toma en cuenta si el documento es de gastos menores
     begin
        // Seccion Comprador
        RutComprador := '';
        PaisComprador := '';
        RazonSocialComprador := '';
        ContactoComprador := '';
        CorreoComprador := '';
        DireccionComprador := '';
        CiudadComprador := '';
        CodigoPostal := '';

        // Seccion Comprador
        JSONComprador := TlkJSONobject.Create;

        if (xFacturaCabeceraComprasPROVEEDOR.AsInteger = -1) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT NIF, COALESCE(NOMBRE, ''DESCONOCIDO'') AS NOMBRE, ');
                 SQL.Add(' COALESCE(TELEFONO01, ''DESCONOCIDO'') AS TELEFONO01, ');
                 SQL.Add(' COALESCE(EMAIL, ''DESCONOCIDO'') AS EMAIL, COALESCE(DIRECCION, ''DESCONOCIDO'') AS DIRECCION, ');
                 SQL.Add(' COALESCE(PROVINCIA, ''DESCONOCIDO'') AS PROVINCIA, COALESCE(C_POSTAL, ''DESCONOCIDO'') AS C_POSTAL, ');
                 SQL.Add(' COALESCE(PAIS, ''DESCONOCIDO'') AS PAIS, TIPO_DOC_IDENT ');
                 SQL.Add(' FROM GES_CABECERAS_E_FAC_NIF ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E ');
                 Params.ByName['ID_E'].AsInteger := xFacturaCabeceraComprasID_E.AsInteger;
                 ExecQuery;
                 RutComprador := FieldByName['NIF'].AsString;
                 PaisComprador := FieldByName['PAIS'].AsString;
                 RazonSocialComprador := QuitarAcentosTexto(FieldByName['NOMBRE'].AsString);
                 ContactoComprador := FieldByName['TELEFONO01'].AsString;
                 CorreoComprador := FieldByName['EMAIL'].AsString;
                 DireccionComprador := QuitarAcentosTexto(FieldByName['DIRECCION'].AsString);
                 CiudadComprador := QuitarAcentosTexto(FieldByName['PROVINCIA'].AsString);
                 CodigoPostal := FieldByName['C_POSTAL'].AsString;
                 TipoDocIdent := FieldByName['TIPO_DOC_IDENT'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
        begin
           RutComprador := xTerceroProveedorNIF.AsString;
           TipoDocIdent := xTerceroProveedorTIPO_DOC_IDENT.AsString;
           RazonSocialComprador := xTerceroProveedorNOMBRE_R_SOCIAL.AsString;
           DireccionComprador := xTerceroProveedorDIR_NOMBRE.AsString;
           PaisComprador := xTerceroProveedorPAIS_TERCERO.AsString;
        end;

        if (TipoEcf = 47) then
           JSONComprador.Add('foreignIdentifier', RutComprador)
        else
           JSONComprador.Add('rnc', RutComprador);

        JSONComprador.Add('companyName', RazonSocialComprador);
        if (TipoEcf <> 47) then
           JSONComprador.Add('address', DireccionComprador);

        JSONRoot.Add('buyer', JSONComprador);
     end;

     // Seccion totales
     JSONTotales := TlkJSONobject.Create;

     {
     if (
        (TipoEcf = 31) or
        (TipoEcf = 32) or
        (TipoEcf = 33) or
        (TipoEcf = 34) or
        (TipoEcf = 45)
        ) then
     begin
     }
     // Monto Gravado Total - Condicional
     // Total de la suma de valores de monto gravado ITBIS a diferentes tasas.
     // Condicional a que exista Monto gravado1, y/o Monto gravado 2 y/o Monto gravado 3.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_E_REDONDEOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_E = :ID_E ');
           Params.ByName['ID_E'].AsInteger := ID_E;
           ExecQuery;
           if ((TipoEcf = 43) or (TipoEcf = 47)) then
              JSONTotales.Add('exemptAmount', (FieldByName['SUM'].AsFloat * Factor))
           else
           begin
              TotalTaxedAmount := (FieldByName['SUM'].AsFloat * Factor);
              JSONTotales.Add('totalTaxedAmount', TotalTaxedAmount);
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Monto Gravado ITBIS Tasa 1 -Condicional
     // Total de la suma de valores de Ítems gravados asignados a ITBIS tasa 1 (tasa 18%), menos descuentos más recargos.
     // Condicional a que en la línea de detalle exista algún ítem gravado a tasa ITBIS1.
     if ((TieneItbisI1) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E AND ');
              SQL.Add(' P_IVA = 18 ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              JSONTotales.Add('i1AmountTaxed', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // MontoGravadoI2 - Condicional
     // Total de la suma de valores de Ítems gravados asignados a ITBIS tasa 2(tasa 16%), menos descuentos más recargos.
     // Condicional a que en la línea de detalle exista algún ítem gravado a tasa ITBIS2.
     if ((TieneItbisI2) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E AND ');
              SQL.Add(' P_IVA = 16 ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              JSONTotales.Add('i2AmountTaxed', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // MontoGravadoI3 - Condicional
     // Total de la suma de valores de Ítems gravados asignados a ITBIS tasa 3 (tasa 0%), menos descuentos más recargos.
     // Condicional a que en la línea de detalle exista algún ítem gravado a tasa ITBIS3.
     if ((TieneItbisI3) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E AND ');
              SQL.Add(' P_IVA = 0 ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              JSONTotales.Add('i3AmountTaxed', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // TODO - Monto Exento - Condicional **** Pendiente de preguntar cual es la diferencia con tipo de Iva cero****

     // ITBIS Tasa 1 - Condicional
     // Tasa de ITBIS 1 (18%).
     // Condicional a que en la línea de detalle exista ítem gravado a tasa 1.
     if ((TieneItbisI1) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
        JSONTotales.Add('itbisS1', 18);

     // ITBIS Tasa 2 - Condicional
     // Tasa de ITBIS 2 (16%).
     // Condicional a que en la línea de detalle exista ítem gravado a tasa 2.
     if ((TieneItbisI2) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
        JSONTotales.Add('itbisS2', 16);

     // ITBIS Tasa 3 - Condicional
     // Tasa de ITBIS 3 (0%).
     // Condicional a que en la línea de detalle exista ítem gravado a tasa 3.
     if ((TieneItbisI3) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
        JSONTotales.Add('itbisS3', 0);

     // TotalITBIS
     // Total de la suma de valores de ITBIS a diferentes tasas.
     // Condicional a que exista Total ITBIS Tasa 1, y/o Total ITBIS Tasa 2 y/o Total ITBIS Tasa 3.
     if (TipoEcf <> 43) then
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              ItbisTotal := (FieldByName['SUM'].AsFloat * Factor);
              JSONTotales.Add('itbisTotal', ItbisTotal);
              FreeHandle;
           finally
              Free;
           end;
        end;

     // Total ITBIS Tasa 1
     // Valor numérico igual a Monto Gravado ITBIS Tasa2*tasa ITBIS 2.
     // Condicional a que exista Monto Gravado tasa 2 y tasa ITBIS 2.
     if ((TieneItbisI1) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E AND ');
              SQL.Add(' P_IVA = 18 ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              JSONTotales.Add('itbis1Total', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Total ITBIS Tasa 2
     // Valor numérico igual a Monto Gravado ITBIS Tasa2*tasa ITBIS 2.
     // Condicional a que exista Monto Gravado tasa 2 y tasa ITBIS 2.
     if ((TieneItbisI2) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E AND ');
              SQL.Add(' P_IVA = 16 ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              JSONTotales.Add('itbis2Total', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Total ITBIS Tasa3
     // Valor numérico igual a Monto gravado ITBIS Tasa3*tasa ITBIS 3.
     // Condicional a que exista Monto Gravado tasa 3 y tasa ITBIS 3.
     if ((TieneItbisI3) and ((TipoEcf <> 43) or (TipoEcf <> 47))) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E AND ');
              SQL.Add(' P_IVA = 0');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              JSONTotales.Add('itbis3Total', (FieldByName['SUM'].AsFloat * Factor));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     // end;

     // Definimos el total de la retencion
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(I_IVA) FROM GES_CABECERAS_E_REDONDEOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_E = :ID_E AND ');
           SQL.Add(' P_IVA = 0');
           Params.ByName['ID_E'].AsInteger := ID_E;
           ExecQuery;

           JSONTotales.Add('itbis3Total', (FieldByName['SUM'].AsFloat * Factor));
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Agregamos Retencion si el documento es comprobante de pagos al exterior
     if (TipoEcf = 47) then
     begin
        // Obtenemos el total de la retencion
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(S_BASES) FROM GES_CABECERAS_E_REDONDEOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E ');
              Params.ByName['ID_E'].AsInteger := ID_E;
              ExecQuery;
              TotalRetencion := (RoundTo(((xFacturaCabeceraComprasDOM_RET_POR_ISR.AsFloat * FieldByName['SUM'].AsFloat * Factor) / 100), 2));
              FreeHandle;
           finally
              Free;
           end;
        end;

        JSONTotales.Add('isrTotalRetention', TotalRetencion);
     end;

     if (TipoEcf = 41) then
     begin
        JSONTotales.Add('itbisTotalRetained', RoundTo(itbisTotal * (xFacturaCabeceraComprasDOM_RET_POR_ISR.AsFloat / 100), 2));
        IsrTotalRetention := ((2 * TotalTaxedAmount) / xFacturaCabeceraComprasDOM_RET_POR_ITBIS.AsFloat);
        JSONTotales.Add('isrTotalRetention', RoundTo(IsrTotalRetention, 2));
        JSONTotales.Add('totalAmount', RoundTo(((totalTaxedAmount + itbisTotal) - (itbisTotal * (xFacturaCabeceraComprasDOM_RET_POR_ISR.AsFloat / 100)) - IsrTotalRetention), 2));
     end
     else
        JSONTotales.Add('totalAmount', xFacturaCabeceraComprasLIQUIDO.AsFloat);

     JSONRoot.Add('totals', JSONTotales);

     // Seccion de detalle
     JSONDetalleItems := TlkJSONlist.Create;
     Linea := 1;
     with xFacturaDetalleCompras do
     begin
        First;
        Open;
        while not EOF do
        begin
           // Item
           JSONDetalleItem := TlkJSONobject.Create;
           // Indicador de Facturación - Obligatorio
           // Indica si el ítem es exento, si es gravado, o No facturable. Indicará las distintas tasas:
           // 0: No Facturable
           // ITBIS 1: ítem gravado a ITBIS tasa1 (18%).
           // ITBIS 2: ítem gravado a ITBIS tasa2 (16%).
           // ITBIS 3: ítem gravado a ITBIS tasa3 (0%).
           // E: Exento TODO - Verificar si es exento
           IndicadorFacturacion := 0;
           if (xFacturaDetalleComprasP_IVA.AsFloat = 18) then
              IndicadorFacturacion := 1
           else
           if (xFacturaDetalleComprasP_IVA.AsFloat = 16) then
              IndicadorFacturacion := 2
           else
           if (xFacturaDetalleComprasP_IVA.AsFloat = 0) then
              IndicadorFacturacion := 3;

           if ((TipoEcf = 43) or (TipoEcf = 47)) then

              JSONDetalleItem.Add('billingIndicator', 4)
           else
              JSONDetalleItem.Add('billingIndicator', IndicadorFacturacion);

           // Indicador Bien o Servicio - Obligatorio
           // Identifica si el ítem corresponde a Bien o Servicio.
           // a) Indicar si es Valor: TODO: Averiguar como definir este indicador
           // 1: Bien
           // 2: Servicio
           if ((xFacturaDetalleComprasCONTROL_STOCK.AsInteger = 1) and (TipoEcf <> 47)) then
              goodServiceIndicator := 1
           else
              goodServiceIndicator := 2;

           if (TipoEcf = 41) then
              goodServiceIndicator := 2;

           JSONDetalleItem.Add('goodServiceIndicator', goodServiceIndicator);

           // Agente retenedor
           // Seccion Comprador
           if (TipoEcf <> 43) then
           begin
              JSONRetention := TlkJSONobject.Create;
              if (((TipoEcf = 47) or (TipoEcf = 41)) and (xFacturaCabeceraComprasDOM_ID_TIPO_RETENCION.AsInteger > 0)) then
              begin
                 DMMain.Log('Tipo de documento:' + IntToStr(TipoEcf));
                 DMMain.Log('goodServiceIndicator:' + IntToStr(goodServiceIndicator));
                 JSONRetention.Add('indicatorAgentWithholdingPerception', 1);
                 if (goodServiceIndicator = 2) then
                 begin
                    JSONRetention.Add('itbisAmountWithheld', RoundTo((itbisTotal * (xFacturaCabeceraComprasDOM_RET_POR_ISR.AsFloat / 100)), -2));
                    JSONRetention.Add('isrAmountWithheld', RoundTo(IsrTotalRetention, 0));
                 end;
              end
              else
                 JSONRetention.Add('indicatorAgentWithholdingPerception', 2);

              JSONDetalleItem.Add('retention', JSONRetention);
           end;

           JSONDetalleItem.Add('lineNumber', Linea);

           // Datos de Codigo del Item
           JSONCodigoTablaItem := TlkJSONlist.Create;
           JSONItemCodigo := TlkJSONobject.Create;

           // Tipo Código - Opcional
           // Tipo de codificación utilizada para el ítem
           // Standard: EAN, PLU, DUN o Interna (Hasta 5 tipos de códigos)
           {
           JSONItemCodigo.Add('codeType', 'Interna');
           JSONItemCodigo.Add('itemCode', Copy(xFacturaDetalleARTICULO.AsString, 1, 14));
           JSONCodigoTablaItem.Add(JSONItemCodigo);
           JSONDetalleItem.Add('itemCodeTable', JSONCodigoTablaItem);
           }
           JSONDetalleItem.Add('itemName', Copy(xFacturaDetalleComprasTITULO.AsString, 1, 80));
           JSONDetalleItem.Add('quantityItem', (xFacturaDetalleComprasUNIDADES.AsFloat * Factor));
           JSONDetalleItem.Add('unitPriceItem', xFacturaDetalleComprasP_COSTE.AsFloat);

           // Monto Descuento
           // Totaliza todos los subdescuentos otorgados al ítem en montos.
           // Condicional a que exista Monto Subdescuento.

           if ((xFacturaDetalleComprasI_DESCUENTO.AsFloat > 0) and (TipoEcf <> 43)) then
           begin
              JSONDetalleItem.Add('discountAmount', FloatToStr(xFacturaDetalleComprasI_DESCUENTO.AsFloat));

              // Detalle de descuentos
              // Condicional a que exista descuento en el ítem. Se pueden incluir 12 repeticiones. Incluye los tres campos siguientes:
              // *** De momento ponemos solo un descuento por linea
              // Datos de Codigo del Item
              JSONSubdescuentoTablaItem := TlkJSONlist.Create;
              JSONItemSubDescuento := TlkJSONobject.Create;

              // Indica si el Subdescuento está en monto ($) o porcentaje (%). Condicional a que exista descuento en el ítem.
              if (TipoEcf <> 44) then
                 JSONItemSubDescuento.Add('subDiscountRate', '$');

              // Correspondiente al valor del descuento expresado en monto.
              // Si va el subdescuento en %, deberá ir el monto del subdescuento.
              JSONItemSubDescuento.Add('subDiscountAmount', FloatToStr(xFacturaDetalleComprasI_DESCUENTO.AsFloat));
              JSONSubdescuentoTablaItem.Add(JSONItemSubDescuento);
              JSONDetalleItem.Add('subDiscounts', JSONSubdescuentoTablaItem);
           end;

           // TODO - Verificar si es correcto
           {Seguramente será B_DTO_LINEA - solo Base Imponible = Unidades x (Precio - descuento)}
           JSONDetalleItem.Add('itemAmount', (xFacturaDetalleComprasB_IMPONIBLE.AsFloat * Factor));

           JSONDetalleItems.Add(JSONDetalleItem);
           JSONRoot.Add('itemDetails', JSONDetalleItems);

           Inc(Linea);
           Next;
        end;
        Close;
     end;

     {
     if (TipoEcf = 34) then
     begin
        // Seccion Referencias
        JSONReferencias := TlkJSONobject.Create;
        // Es el número del comprobante fiscal que será afectado o remplazado por una secuencia electrónica.
        // Tanto el comprobante afectado o reemplazado, como la secuencia electrónica, deben estar emitidos por el mismo RNC/Cédula.
        // Condicional a que la emisión del e-CF corresponda a un reemplazo de Comprobante Fiscal no electrónico emitido en contingencia.
        JSONReferencias.Add('ncfModified', Trim(QMDGIIReferenciasENCF_REF.AsString));
        // Fecha del número de comprobante fiscal modificado.
        // Condicional a que la emisión del e-CF corresponda a un
        // reemplazo de Comprobante Fiscal no electrónico emitido en contingencia.
        JSONReferencias.Add('ncfModifiedDate', FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime));

        // Código utilizado para indicar si el e-CF del comprobante fiscal modificado es con la finalidad de:
        // 1- Anulación total
        // 2- Corrige texto del comprobante fiscal modificado
        // 3- Corrige montos del NCF modificado
        // 4- Reemplazo NCF emitido en contingencia
        JSONReferencias.Add('modificationCode', QMDGIIReferenciasTIPO_REF.AsInteger);
        JSONRoot.Add('informationReference', JSONReferencias);
     end;
     }
     // Guardo el JSON en un archivo
     with TStringList.Create do
     begin
        try
           Text := TlkJSON.GenerateText(JSONRoot);
           Result := DameTempPath + format('factura_electronica-%d.json', [ID_E]);
           SaveToFile(Result);
        finally
           Free;
        end;
     end;
  finally
     // JSONRoot.Free;
  end;
end;

function TDMENCFDOM.LeeYGuardaDatosDeEnvio(IdDoc, CodigoDeRespuesta: integer; Respuesta, MensajeError: TStrings; DocVenta: boolean = True): string;
var
  //i : integer;
  CodigoError, DescripcionError : string;
  Documento, NodoPadre : TlkJSONbase;
  //Nodo : TlkJSONbase;
  IDEnvio : string;
  StatusEnvio, UrlXml, UrlPdf : string;
  StampDate : string;
  DocumentStampUrl : string;
  SecurityCode : string;
  SequenceConsumed : integer;
  //DetalleError : string;
  //DetalleObj : TlkJSONbase;
begin
  /// Procesa respuesta y guarda los datos en la tabla GES_CABECERAS_S_FAC_DGII
  /// Devuelve el ID del Envio

  IDEnvio := '';
  StampDate := '';
  StatusEnvio := '';
  SecurityCode := '';
  SequenceConsumed := 0;
  UrlXml := '';
  UrlPdf := '';
  DocumentStampUrl := '';
  DescripcionError := '';
  CodigoError := '';
  if (CodigoDeRespuesta = 201) then
  begin
     // Leemos respuesta
     Documento := TlkJSON.ParseText(Respuesta.Text);

     (*
     // ***Comentado para pruebas
     FicheroTemporalJson := TStringList.Create;
     FicheroTemporalJson.LoadFromFile(FicheroJson);
     Documento := TlkJSON.ParseText(FicheroTemporalJson.Text);
     *)
     try
        // Verificamos si tiene estado del envio la respuesta
        if Assigned(Documento) then
        begin
           DMMain.Log('Lee respuesta json de envio de ECF');
           NodoPadre := Documento.Field['id'];
           if Assigned(NodoPadre) then
           begin
              IDEnvio := NodoPadre.Field['id'].Value;
              DMMain.Log('ID de envio:' + IDEnvio);
              FInformacionEnvioDte.MLog.Lines.Add(_('Se obtuvo el ID de envio: ' + IDEnvio));
              if (TipoEcf = 32) then
              begin
                 NodoPadre := Documento.Field['signatureDate'];
                 if Assigned(NodoPadre) then
                    StampDate := NodoPadre.Field['signatureDate'].Value;
              end
              else
              begin
                 NodoPadre := Documento.Field['stampDate'];
                 if Assigned(NodoPadre) then
                    StampDate := NodoPadre.Field['stampDate'].Value;
              end;

              NodoPadre := Documento.Field['status'];
              if Assigned(NodoPadre) then
                 StatusEnvio := NodoPadre.Field['status'].Value;

              NodoPadre := Documento.Field['xml'];
              if Assigned(NodoPadre) then
                 UrlXml := NodoPadre.Field['xml'].Value;

              NodoPadre := Documento.Field['pdf'];
              if Assigned(NodoPadre) then
                 UrlPdf := NodoPadre.Field['pdf'].Value;

              NodoPadre := Documento.Field['documentStampUrl'];
              if Assigned(NodoPadre) then
                 DocumentStampUrl := NodoPadre.Field['documentStampUrl'].Value;

              NodoPadre := Documento.Field['securityCode'];
              if Assigned(NodoPadre) then
                 SecurityCode := NodoPadre.Field['securityCode'].Value;

              NodoPadre := Documento.Field['sequenceConsumed'];
              if Assigned(NodoPadre) then
              begin
                 if (NodoPadre.Field['sequenceConsumed'].Value = True) then
                    SequenceConsumed := 1
                 else
                    SequenceConsumed := 0;
              end;
           end;
        end;
     finally
        Documento.Free;
     end;
  end // Resulado = 201 OK
  else
  if (CodigoDeRespuesta = 400) then
  begin
     // Leemos respuesta
     Documento := TlkJSON.ParseText(Respuesta.Text);
     try
        // Verificamos si tiene estado del envio la respuesta
        if Assigned(Documento) then
        begin
           DMMain.Log('Lee respuesta json de envio de ECF');
           NodoPadre := Documento.Field['code'];
           if Assigned(NodoPadre) then
           begin
              CodigoError := NodoPadre.Field['code'].Value;
              DMMain.Log('Se obtuvo el codigo de error:' + CodigoError);
              FInformacionEnvioDte.MLog.Lines.Add(_('Se obtuvo el codigo de error: ' + CodigoError));

           {   NodoPadre := Documento.Field['message'];
              if Assigned(NodoPadre) then
                 DescripcionError := NodoPadre.Field['message'].Value;}

           end;
        end;
     finally
        Documento.Free;
     end;
  end
  else
  begin

     DescripcionError := MensajeError.Text;

     DMMain.Log('MensajeError:' + MensajeError.Text);
     FInformacionEnvioDte.MLog.Lines.Add(_('Se genero el error: ' + MensajeError.Text));
  end;

  // Guardamos datos obtenidos
  if (DocVenta) then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRW(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              DMMain.Log('Guardamos el JSON generado en la base de datos select de GES_CABECERAS_S_FAC_DGII');
              SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FAC_DGII ');
              SelectSQL.Add(' WHERE ID_S = :ID_S ');

              InsertSQL.Add(' INSERT INTO GES_CABECERAS_S_FAC_DGII ');
              InsertSQL.Add(' (ID_S, ID_ENVIO, STAMP_DATE,STATUS,SECURITY_CODE, SEQUENCE_CONSUMED, URL_XML, URL_PDF,DOCUMENT_STAMP_URL,ENVIO_RESPUESTA_JSON, MENSAJE_ERROR_ENVIO_ECF, CODIGO_ERROR_ENVIO) ');
              InsertSQL.Add(' VALUES ');
              InsertSQL.Add(' (:ID_S, :ID_ENVIO, :STAMP_DATE,:STATUS,:SECURITY_CODE, :SEQUENCE_CONSUMED, :URL_XML, :URL_PDF,:DOCUMENT_STAMP_URL,:ENVIO_RESPUESTA_JSON, :MENSAJE_ERROR_ENVIO_ECF, :CODIGO_ERROR_ENVIO) ');

              Params.ByName['ID_S'].AsInteger := IdDoc;

              Open;
              Insert;

              FieldByName('ID_S').Value := IdDoc;
              FieldByName('ID_ENVIO').Value := IDEnvio;
              FieldByName('STAMP_DATE').Value := StampDate;
              FieldByName('STATUS').Value := StatusEnvio;
              FieldByName('SECURITY_CODE').Value := SecurityCode;
              FieldByName('SEQUENCE_CONSUMED').Value := SequenceConsumed;
              FieldByName('URL_XML').Value := UrlXml;
              FieldByName('URL_PDF').Value := UrlPdf;
              FieldByName('DOCUMENT_STAMP_URL').Value := DocumentStampUrl;
              FieldByName('ENVIO_RESPUESTA_JSON').Value := Respuesta.Text;
              FieldByName('MENSAJE_ERROR_ENVIO_ECF').Value := Copy(DescripcionError, 1, 500);
              FieldByName('CODIGO_ERROR_ENVIO').Value := CodigoError;
              Post;

              Transaction.Commit;
              Transaction.StartTransaction;

              Params.ByName['ID_S'].AsInteger := IdDoc;
              Open;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRW(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              DMMain.Log('Guardamos el JSON generado en la base de datos select de GES_CABECERAS_E_FAC_DGII');
              SelectSQL.Add(' SELECT * FROM GES_CABECERAS_E_FAC_DGII ');
              SelectSQL.Add(' WHERE ID_E = :ID_E ');

              InsertSQL.Add(' INSERT INTO GES_CABECERAS_E_FAC_DGII ');
              InsertSQL.Add(' (ID_E, ID_ENVIO, STAMP_DATE,STATUS,SECURITY_CODE, SEQUENCE_CONSUMED, URL_XML, URL_PDF,DOCUMENT_STAMP_URL,ENVIO_RESPUESTA_JSON, MENSAJE_ERROR_ENVIO_ECF, CODIGO_ERROR_ENVIO) ');
              InsertSQL.Add(' VALUES ');
              InsertSQL.Add(' (:ID_E, :ID_ENVIO, :STAMP_DATE,:STATUS,:SECURITY_CODE, :SEQUENCE_CONSUMED, :URL_XML, :URL_PDF,:DOCUMENT_STAMP_URL,:ENVIO_RESPUESTA_JSON, :MENSAJE_ERROR_ENVIO_ECF, :CODIGO_ERROR_ENVIO) ');

              Params.ByName['ID_E'].AsInteger := IdDoc;

              Open;
              Insert;

              FieldByName('ID_E').Value := IdDoc;
              FieldByName('ID_ENVIO').Value := IDEnvio;
              FieldByName('STAMP_DATE').Value := StampDate;
              FieldByName('STATUS').Value := StatusEnvio;
              FieldByName('SECURITY_CODE').Value := SecurityCode;
              FieldByName('SEQUENCE_CONSUMED').Value := SequenceConsumed;
              FieldByName('URL_XML').Value := UrlXml;
              FieldByName('URL_PDF').Value := UrlPdf;
              FieldByName('DOCUMENT_STAMP_URL').Value := DocumentStampUrl;
              FieldByName('ENVIO_RESPUESTA_JSON').Value := Respuesta.Text;
              FieldByName('MENSAJE_ERROR_ENVIO_ECF').Value := Copy(DescripcionError, 1, 500);
              FieldByName('CODIGO_ERROR_ENVIO').Value := CodigoError;


              Post;

              Transaction.Commit;
              Transaction.StartTransaction;

              Params.ByName['ID_E'].AsInteger := IdDoc;
              Open;
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
  Result := IDEnvio;
end;

procedure TDMENCFDOM.LeeYGuardaDatosDeConsulta(IdDoc, CodigoDeRespuesta: integer; Respuesta, MensajeError: TStrings; DocVenta: boolean = True);
var
  Documento, NodoPadre, Nodo : TlkJSONbase;
  IDEnvio : string;
  UrlXml, UrlPdf : string;
  DocumentStampUrl : string;
  SequenceConsumed : integer;
  DocumentNumber : string;
  StatusConsulta : string;
  LegalStatusConsulta : string;
  TrackId : string;
  DescripcionError : string;
  //DetalleObj : TlkJSONbase;
  Fichero : string;
begin
  DocumentNumber := '';
  SequenceConsumed := 0;
  StatusConsulta := '';
  LegalStatusConsulta := '';
  TrackId := '';
  DocumentStampUrl := '';
  UrlXml := '';
  UrlPdf := '';
  DescripcionError := '';
  if (CodigoDeRespuesta = 200) then
  begin
     // Leemos respuesta
     Documento := TlkJSON.ParseText(Respuesta.Text);
     try
        // Verificamos si tiene ID del envio la respuesta
        if Assigned(Documento) then
        begin
           DMMain.Log('Lee respuesta json de Consulta de ECF');
           NodoPadre := Documento.Field['id'];
           if Assigned(NodoPadre) then
           begin
              IDEnvio := NodoPadre.Field['id'].Value;
              DMMain.Log('ID de envio:' + IDEnvio);
              //FInformacionEnvioDte.MLog.Lines.Add(_('Se obtuvo el ID de envio en consulta: ' + IDEnvio));

              NodoPadre := Documento.Field['documentNumber'];
              if Assigned(NodoPadre) then
                 DocumentNumber := NodoPadre.Field['documentNumber'].Value;

              NodoPadre := Documento.Field['sequenceConsumed'];
              if Assigned(NodoPadre) then
              begin
                 if (NodoPadre.Field['sequenceConsumed'].Value = True) then
                    SequenceConsumed := 1
                 else
                    SequenceConsumed := 0;
              end;

              NodoPadre := Documento.Field['status'];
              if Assigned(NodoPadre) then
                 StatusConsulta := NodoPadre.Field['status'].Value;

              NodoPadre := Documento.Field['legalStatus'];
              if Assigned(NodoPadre) then
              begin
                 if Assigned(NodoPadre.Field['legalStatus']) then //Validamos que no sea nulo
                 begin
                    if VarIsNull(NodoPadre.Field['legalStatus'].Value) or VarIsEmpty(NodoPadre.Field['legalStatus'].Value) then
                       LegalStatusConsulta := ''
                    else
                       LegalStatusConsulta := NodoPadre.Field['legalStatus'].Value;
                 end
                 else
                    LegalStatusConsulta := '';
              end;

              NodoPadre := Documento.Field['trackId'];
              if Assigned(NodoPadre) then
              begin
                 if Assigned(NodoPadre.Field['trackId']) then //Validamos que no sea nulo
                 begin
                    if VarIsNull(NodoPadre.Field['trackId'].Value) or VarIsEmpty(NodoPadre.Field['trackId'].Value) then
                       TrackId := ''
                    else
                       TrackId := NodoPadre.Field['trackId'].Value;
                 end
                 else
                    TrackId := '';
              end;

              NodoPadre := Documento.Field['documentStampUrl'];
              if Assigned(NodoPadre) then
                 DocumentStampUrl := NodoPadre.Field['documentStampUrl'].Value;

              NodoPadre := Documento.Field['xml'];
              if Assigned(NodoPadre) then
                 UrlXml := NodoPadre.Field['xml'].Value;

              NodoPadre := Documento.Field['pdf'];
              if Assigned(NodoPadre) then
                 UrlPdf := NodoPadre.Field['pdf'].Value;

              NodoPadre := Documento.Field['governmentResponse'];
              if Assigned(NodoPadre) then
              begin
                 Nodo := TlkJSONobject(NodoPadre);
                 // Verificar que el campo 'error' existe y es un valor string
                 if Assigned(Nodo.Field['error']) and (Nodo.Field['error'] is TlkJSONstring) then
                    DescripcionError := Nodo.Field['error'].Value
                 else
                    DescripcionError := '';
              end
              else
                 DMMain.Log('No se ha podido leer los errore del documento');
           end;
        end;
     finally
        Documento.Free;
     end;

     // Guardamos datos obtenidos
     if (DocVenta) then
     begin

        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRW(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;

                 // Guardamos el XML generado en la base de datos
                 DMMain.Log('Guardamos el XML generado en la base de datos select de GES_CABECERAS_S_FAC_DGII');
                 SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FAC_DGII ');
                 SelectSQL.Add(' WHERE ID_S = :ID_S ');

                 UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FAC_DGII ');
                 UpdateSQL.Add(' SET ENCF = :ENCF, ');
                 UpdateSQL.Add('     SEQUENCE_CONSUMED = :SEQUENCE_CONSUMED, ');
                 UpdateSQL.Add('     STATUS_CONSULTA = :STATUS_CONSULTA, ');
                 UpdateSQL.Add('     LEGAL_STATUS_CONSULTA = :LEGAL_STATUS_CONSULTA, ');
                 UpdateSQL.Add('     TRACK_ID = :TRACK_ID, ');
                 // UpdateSQL.Add('     DOCUMENT_STAMP_URL = :DOCUMENT_STAMP_URL, ');
                 UpdateSQL.Add('     URL_XML = :URL_XML, ');
                 UpdateSQL.Add('     URL_PDF = :URL_PDF, ');
                 UpdateSQL.Add('     CONSULTA_RESPUESTA_JSON = :CONSULTA_RESPUESTA_JSON, ');
                 UpdateSQL.Add('     MENSAJE_ERROR_CONSULTA_ECF = :MENSAJE_ERROR_CONSULTA_ECF ');
                 UpdateSQL.Add(' WHERE ID_S = :ID_S ');

                 Params.ByName['ID_S'].AsInteger := IdDoc;

                 Open;
                 Edit;

                 FieldByName('ID_S').Value := IdDoc;
                 FieldByName('ENCF').Value := DocumentNumber;
                 FieldByName('SEQUENCE_CONSUMED').Value := SequenceConsumed;
                 FieldByName('STATUS_CONSULTA').Value := StatusConsulta;
                 FieldByName('LEGAL_STATUS_CONSULTA').Value := LegalStatusConsulta;
                 FieldByName('TRACK_ID').Value := TrackId;
                 //FieldByName('DOCUMENT_STAMP_URL').Value := DocumentStampUrl;
                 FieldByName('URL_XML').Value := UrlXml;
                 FieldByName('URL_PDF').Value := UrlPdf;
                 FieldByName('CONSULTA_RESPUESTA_JSON').Value := Respuesta.Text;
                 FieldByName('MENSAJE_ERROR_CONSULTA_ECF').Value := Copy(DescripcionError, 1, 500);

                 Post;

                 Transaction.Commit;
                 Transaction.StartTransaction;

                 Params.ByName['ID_S'].AsInteger := IdDoc;
                 Open;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;

              // Guardamos ficheros PDF y XML como adjuntos
              Fichero := DameTempPath + format('Factura_%d.pdf', [IdDoc]);
              AbreData(TDMAdjunto, DMAdjunto);
              try
                 if (UrlPdf > '') and (DescargaFichero(UrlPdf, Fichero)) then
                 begin
                    DMMain.Log('Creando adjunto pdf');
                    DMAdjunto.CreaAdjunto(xFacturaCabeceraTIPO.AsString, IdDoc, Fichero, Format(_('DGII - Factura enviada %s'), [DateTimeToStr(Now)]));
                 end;

                 Fichero := DameTempPath + format('Factura_%d.xml', [IdDoc]);
                 if (UrlXml > '') and (DescargaFichero(UrlXml, Fichero)) then
                 begin
                    DMMain.Log('Creando adjunto xml');
                    DMAdjunto.CreaAdjunto(xFacturaCabeceraTIPO.AsString, IdDoc, Fichero, Format(_('DGII - Factura electronica enviada %s'), [DateTimeToStr(Now)]));
                 end;
              finally
                 CierraData(DMAdjunto);
              end;

           finally
              Free;
           end;
        end;
     end
     else
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRW(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;

                 // Guardamos el XML generado en la base de datos
                 DMMain.Log('Guardamos el XML generado en la base de datos select de GES_CABECERAS_S_FAC_DGII');
                 SelectSQL.Add(' SELECT * FROM GES_CABECERAS_E_FAC_DGII ');
                 SelectSQL.Add(' WHERE ID_E = :ID_E ');

                 UpdateSQL.Add(' UPDATE GES_CABECERAS_E_FAC_DGII ');
                 UpdateSQL.Add(' SET ENCF = :ENCF, ');
                 UpdateSQL.Add('     SEQUENCE_CONSUMED = :SEQUENCE_CONSUMED, ');
                 UpdateSQL.Add('     STATUS_CONSULTA = :STATUS_CONSULTA, ');
                 UpdateSQL.Add('     LEGAL_STATUS_CONSULTA = :LEGAL_STATUS_CONSULTA, ');
                 UpdateSQL.Add('     TRACK_ID = :TRACK_ID, ');
                 UpdateSQL.Add('     DOCUMENT_STAMP_URL = :DOCUMENT_STAMP_URL, ');
                 UpdateSQL.Add('     URL_XML = :URL_XML, ');
                 UpdateSQL.Add('     URL_PDF = :URL_PDF, ');
                 UpdateSQL.Add('     CONSULTA_RESPUESTA_JSON = :CONSULTA_RESPUESTA_JSON, ');
                 UpdateSQL.Add('     MENSAJE_ERROR_CONSULTA_ECF = :MENSAJE_ERROR_CONSULTA_ECF ');
                 UpdateSQL.Add(' WHERE ID_E = :ID_E ');

                 Params.ByName['ID_E'].AsInteger := IdDoc;

                 Open;
                 Edit;

                 FieldByName('ID_E').Value := IdDoc;
                 FieldByName('ENCF').Value := DocumentNumber;
                 FieldByName('SEQUENCE_CONSUMED').Value := SequenceConsumed;
                 FieldByName('STATUS_CONSULTA').Value := StatusConsulta;
                 FieldByName('LEGAL_STATUS_CONSULTA').Value := LegalStatusConsulta;
                 FieldByName('TRACK_ID').Value := TrackId;
                 FieldByName('DOCUMENT_STAMP_URL').Value := DocumentStampUrl;
                 FieldByName('URL_XML').Value := UrlXml;
                 FieldByName('URL_PDF').Value := UrlPdf;
                 FieldByName('CONSULTA_RESPUESTA_JSON').Value := Respuesta.Text;
                 FieldByName('MENSAJE_ERROR_CONSULTA_ECF').Value := Copy(DescripcionError, 1, 500);

                 Post;

                 Transaction.Commit;
                 Transaction.StartTransaction;

                 Params.ByName['ID_E'].AsInteger := IdDoc;
                 Open;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;

              // Guardamos ficheros PDF y XML como adjuntos
              Fichero := DameTempPath + format('Factura_%d.pdf', [IdDoc]);
              AbreData(TDMAdjunto, DMAdjunto);
              try
                 if (UrlPdf > '') and (DescargaFichero(UrlPdf, Fichero)) then
                 begin
                    DMMain.Log('Creando adjunto pdf');
                    if (DocVenta) then
                       DMAdjunto.CreaAdjunto(xFacturaCabeceraTIPO.AsString, IdDoc, Fichero, Format(_('DGII - Factura enviada %s'), [DateTimeToStr(Now)]))
                    else
                       DMAdjunto.CreaAdjunto(xFacturaCabeceraComprasTIPO.AsString, IdDoc, Fichero, Format(_('DGII - Factura enviada %s'), [DateTimeToStr(Now)]));
                 end;

                 Fichero := DameTempPath + format('Factura_%d.xml', [IdDoc]);
                 if (UrlXml > '') and (DescargaFichero(UrlXml, Fichero)) then
                 begin
                    DMMain.Log('Creando adjunto xml');
                    if (DocVenta) then
                       DMAdjunto.CreaAdjunto(xFacturaCabeceraTIPO.AsString, IdDoc, Fichero, Format(_('DGII - Factura electronica enviada %s'), [DateTimeToStr(Now)]))
                    else
                       DMAdjunto.CreaAdjunto(xFacturaCabeceraComprasTIPO.AsString, IdDoc, Fichero, Format(_('DGII - Factura electronica enviada %s'), [DateTimeToStr(Now)]));
                 end;
              finally
                 CierraData(DMAdjunto);
              end;

           finally
              Free;
           end;
        end;
     end;
  end; // Resulado = 200 OK
        (*
        else
        begin
           Documento := TlkJSON.ParseText(MensajeError.Text);
           try
              NodoPadre := Documento.Field['errors'];
              if Assigned(NodoPadre) and (NodoPadre is TlkJSONlist) then
              begin
                 DescripcionError := '';
                 // Recorremos lista de errores
                 for i := 0 to TlkJSONlist(NodoPadre).Count - 1 do
                 begin
                    DetalleObj := TlkJSONobject(TlkJSONlist(NodoPadre).Child[i]);

                    Nodo := DetalleObj.Field['code'];
                    if Assigned(Nodo) then
                    begin
                       CodigoError := Nodo.Value;
                       DMMain.Log('Codigo error: ' + CodigoError);
                    end
                    else
                       DMMain.Log('No se ha podido leer el codigo del error');

                    Nodo := DetalleObj.Field['message'];
                    if Assigned(Nodo) then
                    begin
                       DescripcionError := Nodo.Value;
                       DMMain.Log('Descripción del error: ' + DescripcionError);
                    end
                    else
                       DMMain.Log('No se ha podido leer la descripción del error');

                    DetalleError := '(' + CodigoError + '-' + DescripcionError + ') ';

                    DescripcionError := DescripcionError + ':' + DetalleError;
                 end;
              end
              else
                 DMMain.Log('No se ha podido leer los errore del documento');
           finally
              Documento.Free;
           end;

           DMMain.Log('DescripcionLineaError:' + DescripcionError);
           FInformacionEnvioDte.MLog.Lines.Add(_('Se genero el error: ' + DescripcionError));
        end;
        *)
end;

procedure TDMENCFDOM.EnviaEcf(IdDoc: integer; DocVenta: boolean = True);
var
  //i : integer;
  WndList : Pointer;
  UrlConsultaDocumento : string;
  CodigoDeRespuesta : integer;
  Respuesta : TStrings;
  MensajeError : TStrings;
  FicheroJson : string;
  IDEnvio : string;
  IdDocumentoConsulta : string;
begin
  DMMain.LogIni(format('Inicio Envio E-CF - ID_DOC = %d', [IdDoc]));
  FInformacionEnvioDte := TFInformacionEnvioDte.Create(Self);
  WndList := DisableTaskWindows(FInformacionEnvioDte.Handle);

  try
     with FInformacionEnvioDte do
     begin
        LBLGeneral.Caption := _('Inicializando envio...');
        MLog.Lines.Clear;
        Show;
     end;

     // Obtenemos datos factura Delfos
     DMMain.Log('Obtenemos datos factura');
     FInformacionEnvioDte.MLog.Lines.Add(_('Obeniendo datos factura'));
     if (DocVenta) then
        ObtieneDatosFacturaDelfos(IdDoc)
     else
        ObtieneDatosComprasFacturaDelfos(IdDoc);

     DMMain.Log('Creando fichero de intercambio');
     FInformacionEnvioDte.MLog.Lines.Add(_('Creando fichero de intercambio'));

     if (DocVenta) then
        FicheroJson := GeneraFicheroJson(IdDoc)
     else
        FicheroJson := GeneraFicheroJsonCompras(IdDoc);

     FInformacionEnvioDte.MLog.Lines.Add(format(_('Se ha generado el fichero %s'), [FicheroJson]));
     DMMain.Log(format('Se ha generado el fichero %s', [FicheroJson]));

     // Enviamos el documento al DGII
     Respuesta := TStringList.Create;
     MensajeError := TStringList.Create;
     try
        DMMain.Log(format('Enviamos el documento con ID_S: %d al DGII', [IdDoc]));
        FInformacionEnvioDte.MLog.Lines.Add(format('Enviamos el documento con ID_S: %d al DGII', [IdDoc]));

        if (DocVenta) then
           PostJsonIdHTTP('ventas', xDGIIConfiguracionTOKEN.AsString, xDGIIConfiguracionURL_BASE.AsString + Resource, FicheroJson, CodigoDeRespuesta, Respuesta, MensajeError)
        else
           PostJsonIdHTTP('compras', xDGIIConfiguracionComprasTOKEN.AsString, xDGIIConfiguracionComprasURL_BASE.AsString + Resource, FicheroJson, CodigoDeRespuesta, Respuesta, MensajeError);

        DMMain.Log(format('CodigoDeRespuesta: %d', [CodigoDeRespuesta]));
        if Assigned(Respuesta) then
        begin
           DMMain.Log(format('Respuesta %s', [Respuesta.Text]));
          {$IFDEF Debug}
          Respuesta.SaveTofile(ChangeFileExt(FicheroJson, '_Respuesta.json'));
          {$ENDIF}
        end;

        DMMain.Log('Se lee y se guarda los datos de acuse de envio');
        FInformacionEnvioDte.MLog.Lines.Add('Se lee y se guarda los datos de acuse de envio');
        IDEnvio := LeeYGuardaDatosDeEnvio(IdDoc, CodigoDeRespuesta, Respuesta, MensajeError, DocVenta);
     finally
        FreeAndNil(Respuesta);
        FreeAndNil(MensajeError);
     end;

     // Realizamos consulta de estodo del documento enviado
     if (IDEnvio > '') then
     begin
        IdDocumentoConsulta := '/' + Trim(IDEnvio) + '/idCompany/' + Trim(xDGIIConfiguracionID_COMPANY.AsString) + '?pdfType=generic';

        if (DocVenta) then
           UrlConsultaDocumento := xDGIIConfiguracionURL_BASE.AsString + Resource + IdDocumentoConsulta
        else
           UrlConsultaDocumento := xDGIIConfiguracionComprasURL_BASE.AsString + Resource + IdDocumentoConsulta;

        // Envia la consulta
        DMMain.Log(format('Se Realiza consulta de estado del documento url: %s', [UrlConsultaDocumento]));
        Sleep(8000);

        // Se crean TStrings Respuesta y MensajeError que debo liberar después de usar
        Respuesta := TStringList.Create;
        MensajeError := TStringList.Create;
        try
           if (DocVenta) then
              GetJsonIdHTTP(xDGIIConfiguracionTOKEN.AsString, UrlConsultaDocumento, CodigoDeRespuesta, Respuesta, MensajeError)
           else
              GetJsonIdHTTP(xDGIIConfiguracionComprasTOKEN.AsString, UrlConsultaDocumento, CodigoDeRespuesta, Respuesta, MensajeError);

           DMMain.Log(format('CodigoDeRespuesta: %d', [CodigoDeRespuesta]));
           if Assigned(Respuesta) then
           begin
              DMMain.Log(format('Respuesta %s', [Respuesta.Text]));
            {$IFDEF Debug}
            Respuesta.SaveTofile(ChangeFileExt(FicheroJson, '_Respuesta_consulta.json'));
            {$ENDIF}
           end;

           // Guardamos datos de la consulta
           LeeYGuardaDatosDeConsulta(IdDoc, CodigoDeRespuesta, Respuesta, MensajeError, DocVenta);
        finally
           FreeAndNil(Respuesta);
           FreeAndNil(MensajeError);
        end;
     end;
  finally
     FInformacionEnvioDte.MLog.Lines.Add(_('Finalizado el envio del E-CF'));
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     FInformacionEnvioDte.Close;
     // DMMain.LogFin(format('Fin Envio E-CF - ID_S = %d', [IdDoc]));
  end;
end;

procedure TDMENCFDOM.ObtieneDatosFacturaDelfos(ID_S: integer);
begin
  with xFacturaCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;

     // Definimos el Tipo de ECF
     TipoEcf := xFacturaCabeceraZ_TIPO_NCF.AsInteger;

     if (TipoEcf = 31) then
        Resource := 'fiscal-invoices'
     else
     if (TipoEcf = 32) then
        Resource := 'invoices'
     else
     if (TipoEcf = 44) then
        Resource := 'special-regimes'
     else
     if (TipoEcf = 45) then
        Resource := 'gubernamentals'
     else
     if (TipoEcf = 46) then
        Resource := 'export-supports'
     else
     if (TipoEcf = 33) then
        Resource := 'debit-notes'
     else
     if (TipoEcf = 34) then
        Resource := 'credit-notes'
     else
        raise Exception.Create(_('Tipo CF desconocido'));
  end;
end;

procedure TDMENCFDOM.ObtieneDatosComprasFacturaDelfos(ID_E: integer);
begin
  with xFacturaCabeceraCompras do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := ID_E;
     Open;

     // Definimos el Tipo de ECF
     TipoEcf := xFacturaCabeceraComprasZ_TIPO_NCF.AsInteger;

     if (TipoEcf = 41) then
        Resource := 'purchases'
     else
     if (TipoEcf = 43) then
        Resource := 'minor-expenses'
     else
     if (TipoEcf = 47) then
        Resource := 'payment-abroad-supports'
     else
        raise Exception.Create(_('Tipo CF desconocido'));
  end;
end;

procedure TDMENCFDOM.xFacturaCabeceraAfterOpen(DataSet: TDataSet);
begin
  xNcfDet.Open;
  xFormaPago.Open;
  xTerceroCliente.Open;
  xEmisor.Open;
  xFacturaDetalle.Open;
  xDGIIConfiguracion.Open;
  xECFVentas.Open;
  QMDGIIReferencias.Open;
end;

procedure TDMENCFDOM.xFacturaCabeceraBeforeClose(DataSet: TDataSet);
begin
  xNcfDet.Close;
  xFormaPago.Close;
  xTerceroCliente.Close;
  xEmisor.Close;
  xFacturaDetalle.Close;
  xDGIIConfiguracion.Close;
  xECFVentas.Close;
  QMDGIIReferencias.Close;
end;

procedure TDMENCFDOM.PostJsonIdHTTP(TipoDocumento, Token, UrlConsulta, FicheroJson: string; var CodigoDeRespuesta: integer; Respuesta: TStrings; MensajeError: TStrings);
var
  IdHTTP : TIdHTTP;
  IdSSLIOHandler : TIdSSLIOHandlerSocketOpenSSL;
  RequestStream : TMemoryStream;
  ResponseStream : TStringStream;
  JSONContent : ansistring;
  IdDoc : integer;

  procedure AsignaErrorDeEnvio(CodError, MensajeError: string);
  begin
     if (TipoDocumento = 'ventas') then
        IdDoc := xFacturaCabeceraID_S.AsInteger
     else
        IdDoc := xFacturaCabeceraComprasID_E.AsInteger;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (TipoDocumento = 'ventas') then
              SQL.Add(' UPDATE GES_CABECERAS_S_FAC_DGII ')
           else
              SQL.Add(' UPDATE GES_CABECERAS_E_FAC_DGII ');

           SQL.Add(' SET CODIGO_ERROR_ENVIO = :CODIGO_ERROR_ENVIO, ');
           SQL.Add(' MENSAJE_ERROR_CONSULTA_ECF = :MENSAJE_ERROR_CONSULTA_ECF ');

           if (TipoDocumento = 'ventas') then
              SQL.Add(' WHERE ID_S = :ID_S ')
           else
              SQL.Add(' WHERE ID_E = :ID_E ');

           Params.ByName['CODIGO_ERROR_ENVIO'].AsString := CodError;
           Params.ByName['MENSAJE_ERROR_CONSULTA_ECF'].AsString := MensajeError;
           if (TipoDocumento = 'ventas') then
              Params.ByName['ID_S'].AsInteger := IdDoc
           else
              Params.ByName['ID_E'].AsInteger := IdDoc;

           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

  end;

begin
  Respuesta.Clear;
  MensajeError.Clear;
  CodigoDeRespuesta := 0;
  //if (TipoDocumento = 'compras') then

  // Leemos archivo JSON en un AnsiString
  with TFileStream.Create(FicheroJson, fmOpenRead) do
  begin
     try
        SetLength(JSONContent, Size);
        Read(Pointer(JSONContent)^, Size);
     finally
        Free;
     end;
  end;

  // Configuramos componentes Indy
  IdHTTP := TIdHTTP.Create(nil);
  IdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  RequestStream := TMemoryStream.Create;
  ResponseStream := TStringStream.Create('');
  try
     // Configuracion SSL
     IdSSLIOHandler.SSLOptions.Method := sslvTLSv1;
     IdSSLIOHandler.SSLOptions.Mode := sslmClient;
     IdSSLIOHandler.SSLOptions.VerifyDepth := 0;
     IdSSLIOHandler.SSLOptions.VerifyMode := [];
     IdSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
     IdSSLIOHandler.SSLOptions.Method := sslvTLSv1_2;

     // Configurar HTTP
     IdHTTP.IOHandler := IdSSLIOHandler;
     IdHTTP.Request.ContentType := 'application/json; charset=utf-8';
     IdHTTP.Request.Accept := 'application/json';
     IdHTTP.Request.UserAgent := 'Mozilla/5.0 (compatible; Delphi6)';
     IdHTTP.Request.CustomHeaders.Add('Authorization: Bearer ' + Token);
     IdHTTP.Request.CustomHeaders.Add('X-Requested-With: XMLHttpRequest');
     IdHTTP.HandleRedirects := True;
     IdHTTP.ConnectTimeout := 10000;
     IdHTTP.ReadTimeout := 30000;

     // Preparamos el stream de request
     RequestStream.WriteBuffer(Pointer(JSONContent)^, Length(JSONContent));
     RequestStream.Position := 0;

     try
        // Realizamos el POST
        IdHTTP.Post(UrlConsulta, RequestStream, ResponseStream);
        CodigoDeRespuesta := IdHTTP.ResponseCode;
        Respuesta.Text := ResponseStream.DataString;
     except
        on E: EIdHTTPProtocolException do
        begin
           CodigoDeRespuesta := E.ErrorCode;
           MensajeError.Text := E.ErrorMessage;
           Respuesta.Text := E.ErrorMessage;
           DMMain.Log('Error EIdHTTPProtocolException' + #13#10 +
              format('ErrorCode: %d', [E.ErrorCode]) + #13#10 +
              format('ErrorMessage: %s', [E.ErrorMessage]) + #13#10 +
              'Headers:' + #13#10 + IdHTTP.Response.RawHeaders.Text);
        end;
        on E: Exception do
        begin
           MensajeError.Text := 'Error general: ' + AnsiString(E.ClassName) + ': ' + E.Message;
           DMMain.Log('Error Generico' + #13#10 + AnsiString(E.ClassName) + ': ' + E.Message);
           AsignaErrorDeEnvio('DESCONOCIDO', MensajeError.Text);
        end;
     end;
  finally
     ResponseStream.Free;
     RequestStream.Free;
     IdSSLIOHandler.Free;
     IdHTTP.Free;
  end;
end;

procedure TDMENCFDOM.GetJsonIdHTTP(Token, UrlConsulta: string; var CodigoDeRespuesta: integer; Respuesta: TStrings; MensajeError: TStrings);
var
  IdHTTP : TIdHTTP;
  IdSSLIOHandler : TIdSSLIOHandlerSocketOpenSSL;
  ResponseStream : TStringStream;
begin
  Respuesta.Clear;
  MensajeError.Clear;
  CodigoDeRespuesta := 0;

  IdHTTP := TIdHTTP.Create(nil);
  IdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  ResponseStream := TStringStream.Create('');
  try
     // asignar el IOHandler!!!! (SIN esto no funciona TLS 1.2)
     IdHTTP.IOHandler := IdSSLIOHandler;

     // CONFIGURACION SSL
     IdSSLIOHandler.SSLOptions.Method := sslvTLSv1_2;
     IdSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
     IdSSLIOHandler.SSLOptions.VerifyDepth := 0;
     IdSSLIOHandler.SSLOptions.VerifyMode := [];

     // Configurar HTTP
     IdHTTP.Request.Clear;
     IdHTTP.Request.CustomHeaders.Clear;
     IdHTTP.Request.ContentType := 'application/json';
     IdHTTP.Request.Accept := 'application/json';
     IdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)';
     IdHTTP.Request.CustomHeaders.Add('Authorization: Bearer ' + Token);

     try
        IdHTTP.Get(UrlConsulta, ResponseStream);
        CodigoDeRespuesta := IdHTTP.ResponseCode;

        if CodigoDeRespuesta = 200 then
           Respuesta.Text := ResponseStream.DataString;

     except
        on E: Exception do
        begin
           MensajeError.Text := 'Error general: ' + AnsiString(E.ClassName) + ': ' + E.Message;
        end;
     end;
  finally
     ResponseStream.Free;
     IdSSLIOHandler.Free;
     IdHTTP.Free;
  end;
end;

procedure TDMENCFDOM.ConsultaEcf(IdDoc: integer; DocVenta: boolean = True);
var
  Respuesta : TStrings;
  MensajeError : TStrings;
  CodigoDeRespuesta : integer;
  IdDocumentoConsulta : string;
  UrlConsultaDocumento : string;
begin
  Respuesta := TStringList.Create;
  MensajeError := TStringList.Create;
  try
     if (DocVenta) then
     begin
        ObtieneDatosFacturaDelfos(IdDoc);
        IdDocumentoConsulta := '/' + xECFVentasID_ENVIO.AsString + '/idCompany/' + xDGIIConfiguracionID_COMPANY.AsString + '?pdfType=generic';
        UrlConsultaDocumento := xDGIIConfiguracionURL_BASE.AsString + Resource + IdDocumentoConsulta;
        GetJsonIdHTTP(xDGIIConfiguracionTOKEN.AsString, UrlConsultaDocumento, CodigoDeRespuesta, Respuesta, MensajeError);
     end
     else
     begin
        ObtieneDatosComprasFacturaDelfos(IdDoc);
        IdDocumentoConsulta := '/' + xECFComprasID_ENVIO.AsString + '/idCompany/' + xDGIIConfiguracionComprasID_COMPANY.AsString + '?pdfType=generic';
        UrlConsultaDocumento := xDGIIConfiguracionComprasURL_BASE.AsString + Resource + IdDocumentoConsulta;
        GetJsonIdHTTP(xDGIIConfiguracionComprasTOKEN.AsString, UrlConsultaDocumento, CodigoDeRespuesta, Respuesta, MensajeError);
     end;


     DMMain.Log(format('CodigoDeRespuesta: %d', [CodigoDeRespuesta]));
     if Assigned(Respuesta) then
     begin
        DMMain.Log(format('Respuesta %s', [Respuesta.Text]));
        {$IFDEF Debug}
        Respuesta.SaveTofile(DameTempPath + format(Resource + '-%d_Respuesta_consulta.json', [IdDoc]));
        {$ENDIF}
     end;

     // Guardamos datos de la consulta
     LeeYGuardaDatosDeConsulta(IdDoc, CodigoDeRespuesta, Respuesta, MensajeError, DocVenta);
  finally
     FreeAndNil(Respuesta);
     FreeAndNil(MensajeError);
  end;
end;

function TDMENCFDOM.DameFormaDePagoDGII(FormaDePago: string): integer;
var
  TipoEfecto : string;
begin
  Result := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 TIPO_EFECTO FROM SYS_FORMAS_PAGO ');
        SQL.Add(' WHERE ');
        SQL.Add(' FORMA = :FORMA_PAGO ');
        Params.ByName['FORMA_PAGO'].AsString := FormaDePago;
        ExecQuery;
        TipoEfecto := FieldByName['TIPO_EFECTO'].AsString;

        if ((TipoEfecto = 'CRE') or (TipoEfecto = 'CHE') or (TipoEfecto = 'TAL')) then
           Result := 2
        else if ((TipoEfecto = 'CON') or (TipoEfecto = 'TAR') or (TipoEfecto = 'TRN')) then
           Result := 1
        else
           Result := 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMENCFDOM.xFacturaCabeceraComprasAfterOpen(DataSet: TDataSet);
begin
  xFacturaDetalleCompras.Open;
  xDGIIConfiguracionCompras.Open;
  xNcfDetCompras.Open;
  xEmisorCompras.Open;
  xTerceroProveedor.Open;
  xDGIIConfiguracion.Open;
  xECFCompras.Open;
end;

procedure TDMENCFDOM.xFacturaCabeceraComprasBeforeClose(DataSet: TDataSet);
begin
  xFacturaDetalleCompras.Close;
  xDGIIConfiguracionCompras.Close;
  xNcfDetCompras.Close;
  xEmisorCompras.Close;
  xTerceroProveedor.Close;
  xDGIIConfiguracion.Close;
  xECFCompras.Close;
end;

end.
