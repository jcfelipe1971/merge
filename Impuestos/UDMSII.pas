// SII (Suministro Inmediato de Información)

unit UDMSII;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, XMLDoc, XMLIntf;

type
  TDMSII = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xRegIVA: TFIBDataSet;
     DSRegIVA: TDataSource;
     RegIVADetalle: TFIBDataSet;
     DSRegIVADetalle: TDataSource;
     RegIVADetalleDUA: TFIBDataSet;
     DSRegIVADetalleDUA: TDataSource;
     RegIVADetalleRECC: TFIBDataSet;
     DSRegIVADetalleRECC: TDataSource;
     xPresentacion: TFIBTableSet;
     DSPresentacion: TDataSource;
     xSLRFacEmi: TFIBTableSet;
     DSSLRFacEmi: TDataSource;
     xPresentacionID_SII_PRESENTACION: TIntegerField;
     xPresentacionEMPRESA: TIntegerField;
     xPresentacionCANAL: TIntegerField;
     xSLRFacEmiID_SII_PRESENTACION: TIntegerField;
     xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS: TIntegerField;
     xSLRFacEmiIDVERSIONSII: TFIBStringField;
     xSLRFacEmiTITULAR_NOMBRE_RAZON: TFIBStringField;
     xSLRFacEmiNIF_REPRESENTANTE: TFIBStringField;
     xSLRFacEmiNIF: TFIBStringField;
     xSLRFacEmiTIPOCOMUNICACION: TFIBStringField;
     xSLRFacEmiFECHA_CREACION: TDateTimeField;
     xSLRFacEmiFECHA_PRESENTACION: TDateTimeField;
     xSLRFacRec: TFIBTableSet;
     DSSLRFacRec: TDataSource;
     xRLRFacEmi: TFIBTableSet;
     DSRLRFacEmi: TDataSource;
     xRLRFacEmiID_SII_PRESENTACION: TIntegerField;
     xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField;
     xRLRFacEmiPERIODOIMPOSITIVO_EJERCICIO: TIntegerField;
     xRLRFacEmiPERIODOIMPOSITIVO_PERIODO: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_NIF: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField;
     xRLRFacEmiFACEXP_TIPOFACTURA: TFIBStringField;
     xRLRFacEmiFACEXP_TIPORECTIFICATIVA: TFIBStringField;
     xRLRFacEmiFACEXP_FAGR_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacEmiFACEXP_FAGR_FECHAEXPEDICION: TDateTimeField;
     xRLRFacEmiFACEXP_FRECT_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacEmiFACEXP_FRECT_FECHAEXPEDICION: TDateTimeField;
     xRLRFacEmiFACEXP_IMPRECT_BASERECT: TFloatField;
     xRLRFacEmiFACEXP_IMPRECT_CUOTARECT: TFloatField;
     xRLRFacEmiFACEXP_IMPRECT_CUOTARECRECT: TFloatField;
     xRLRFacEmiFACEXP_FECHAOPERACION: TDateTimeField;
     xRLRFacEmiFACEXP_CLAVE_REG_ESP: TFIBStringField;
     xRLRFacEmiFACEXP_IMPORTE_TOTAL: TFloatField;
     xRLRFacEmiFACEXP_BASEIMPONIBLEACOSTE: TFloatField;
     xRLRFacEmiFACEXP_DESCRIPCION: TFIBStringField;
     xRLRFacEmiFACEXP_INMUEBLE_SITUACIONINM: TFIBStringField;
     xRLRFacEmiFACEXP_INMUEBLE_REFCATASTRAL: TFIBStringField;
     xRLRFacEmiFACEXP_IMPORTETRANSMSUJETAIVA: TFloatField;
     xRLRFacEmiFACEXP_EMITIDA_POR_TERCEROS: TFIBStringField;
     xRLRFacEmiFACEXP_VARIOSDESTINATARIOS: TFIBStringField;
     xRLRFacEmiFACEXP_CUPON: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAP_NOMBRE_RAZON: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAP_NIF_REPRES: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAP_NIF: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAPARTE_CODPAIS: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAPARTE_IDTYPE: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAPARTE_ID: TFIBStringField;
     xRLRFacRec: TFIBTableSet;
     DSRLRFacRec: TDataSource;
     xRLRFacRecID_SII_PRESENTACION: TIntegerField;
     xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField;
     xRLRFacRecPERIODOIMPOSITIVO_EJERCICIO: TIntegerField;
     xRLRFacRecPERIODOIMPOSITIVO_PERIODO: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_NIF: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField;
     xRLRFacRecFACREC_TIPOFACTURA: TFIBStringField;
     xRLRFacRecFACREC_TIPORECTIFICATIVA: TFIBStringField;
     xRLRFacRecFACREC_FAGR_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacRecFACREC_FAGR_FECHAEXPEDICION: TDateTimeField;
     xRLRFacRecFACREC_FRECT_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacRecFACREC_FRECT_FECHAEXPEDICION: TDateTimeField;
     xRLRFacRecFACREC_IMPRECT_BASERECT: TFloatField;
     xRLRFacRecFACREC_IMPRECT_CUOTARECT: TFloatField;
     xRLRFacRecFACREC_IMPRECT_CUOTARECRECT: TFloatField;
     xRLRFacRecFACREC_FECHAOPERACION: TDateTimeField;
     xRLRFacRecFACREC_CLAVE_REG_ESP: TFIBStringField;
     xRLRFacRecFACREC_IMPORTE_TOTAL: TFloatField;
     xRLRFacRecFACREC_BASEIMPONIBLEACOSTE: TFloatField;
     xRLRFacRecFACREC_DESCRIPCION: TFIBStringField;
     xRLRFacRecFACREC_ADUANAS_NUMERODUA: TFIBStringField;
     xRLRFacRecFACREC_ADUANAS_FECHAREGCONTDUA: TDateTimeField;
     xRLRFacRecFACREC_CONTRAP_NOMBRE_RAZON: TFIBStringField;
     xRLRFacRecFACREC_CONTRAP_NIF_REPRES: TFIBStringField;
     xRLRFacRecFACREC_CONTRAP_NIF: TFIBStringField;
     xRLRFacRecFACREC_CONTRAPARTE_CODPAIS: TFIBStringField;
     xRLRFacRecFACREC_CONTRAPARTE_IDTYPE: TFIBStringField;
     xRLRFacRecFACREC_CONTRAPARTE_ID: TFIBStringField;
     xRLRFacRecFACREC_FECHAREGCONTABLE: TDateTimeField;
     xRLRFacRecFACREC_CUOTA_DEDUCIBLE: TFloatField;
     xRLRFacEmiID_SII_SUMLRFACTURASEMITIDAS: TIntegerField;
     xRLRFacRecID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField;
     xSLRFacRecID_SII_PRESENTACION: TIntegerField;
     xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField;
     xSLRFacRecIDVERSIONSII: TFIBStringField;
     xSLRFacRecTITULAR_NOMBRE_RAZON: TFIBStringField;
     xSLRFacRecNIF_REPRESENTANTE: TFIBStringField;
     xSLRFacRecNIF: TFIBStringField;
     xSLRFacRecTIPOCOMUNICACION: TFIBStringField;
     xSLRFacRecFECHA_CREACION: TDateTimeField;
     xSLRFacRecFECHA_PRESENTACION: TDateTimeField;
     xDesgloseFacEmi: TFIBTableSet;
     DSDesgloseFacEmi: TDataSource;
     xDesgloseFacRec: TFIBTableSet;
     DSDesgloseFacRec: TDataSource;
     xRLRFacEmiID_I: TIntegerField;
     xRLRFacRecID_I: TIntegerField;
     xDesgloseFacRecID_SII_PRESENTACION: TIntegerField;
     xDesgloseFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField;
     xDesgloseFacRecID_SII_DESGLOSEFACTURA_REC: TIntegerField;
     xDesgloseFacRecISP_TIPOIMPOSITIVO: TFloatField;
     xDesgloseFacRecISP_BASEIMPONIBLE: TFloatField;
     xDesgloseFacRecISP_CUOTASOPORTADA: TFloatField;
     xDesgloseFacRecISP_TIPORECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecISP_CUOTARECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecDI_TIPOIMPOSITIVO: TFloatField;
     xDesgloseFacRecDI_BASEIMPONIBLE: TFloatField;
     xDesgloseFacRecDI_CUOTASOPORTADA: TFloatField;
     xDesgloseFacRecDI_TIPORECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecDI_CUOTARECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecDI_PORCENTCOMPSENSACIONREAGYP: TFloatField;
     xDesgloseFacRecDI_IMPORTECOMPSENSACIONREAGYP: TFloatField;
     xDesgloseFacEmiID_SII_PRESENTACION: TIntegerField;
     xDesgloseFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField;
     xDesgloseFacEmiID_SII_DESGLOSEFACTURA_EMI: TIntegerField;
     xDesgloseFacEmiSUJETA_EXENTA_CAUSA: TFIBStringField;
     xDesgloseFacEmiSUJETA_EXENTA_BASEIMPONIBLE: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_TIPO: TFIBStringField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_TIPOIMP: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_BASEIMP: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_CUOTAREP: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_TIPOREC: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_CUOTAREC: TFloatField;
     xDesgloseFacEmiNO_SUJETA_IMPORTE_ART_7_14: TFloatField;
     xDesgloseFacEmiNO_SUJETA_IMPORTE_TAI: TFloatField;
     xPresentacionTIPO_PRESENTACION: TFIBStringField;
     xRLRFacEmiTIPO_DESGLOSE: TFIBStringField;
     xRLRFacEmiFACEXP_CLAVE_REG_ESP1: TFIBStringField;
     xRLRFacEmiFACEXP_CLAVE_REG_ESP2: TFIBStringField;
     xRLRFacEmiFACEXP_NUMREGACUERDOFAC: TFIBStringField;
     xRLRFacEmiTIPO_DESGLOSE_OPERACION: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_OTRO_CODPAIS: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_OTRO_IDTYPE: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_OTRO_ID: TFIBStringField;
     xRLRFacRecFACREC_CLAVE_REG_ESP1: TFIBStringField;
     xRLRFacRecFACREC_CLAVE_REG_ESP2: TFIBStringField;
     xRLRFacRecFACREC_NUMREGACUERDOFAC: TFIBStringField;
     xSLRFacEmiCSV: TFIBStringField;
     xSLRFacEmiESTADO_ENVIO: TFIBStringField;
     xSLRFacRecCSV: TFIBStringField;
     xSLRFacRecESTADO_ENVIO: TFIBStringField;
     xRLRFacEmiESTADO_REGISTRO: TFIBStringField;
     xRLRFacEmiCODIGO_ERROR: TFIBStringField;
     xRLRFacEmiDESCRIPCION_ERROR: TFIBStringField;
     xRLRFacRecESTADO_REGISTRO: TFIBStringField;
     xRLRFacRecCODIGO_ERROR: TFIBStringField;
     xRLRFacRecDESCRIPCION_ERROR: TFIBStringField;
     xRLRFacEmiDisponibles: TFIBTableSet;
     DSRLRFacEmiDisponibles: TDataSource;
     xRLRFacEmiDisponiblesID_SII_PRESENTACION: TIntegerField;
     xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS: TIntegerField;
     xRLRFacEmiDisponiblesID_SII_SUMLRFACTURASEMITIDAS: TIntegerField;
     xRLRFacEmiDisponiblesID_I: TIntegerField;
     xRLRFacEmiDisponiblesPERIODOIMPOSITIVO_EJERCICIO: TIntegerField;
     xRLRFacEmiDisponiblesPERIODOIMPOSITIVO_PERIODO: TFIBStringField;
     xRLRFacEmiDisponiblesIDFAC_EMISOR_NIF: TFIBStringField;
     xRLRFacEmiDisponiblesIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField;
     xRLRFacEmiDisponiblesIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField;
     xRLRFacEmiDisponiblesIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField;
     xRLRFacEmiDisponiblesFACEXP_TIPOFACTURA: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_TIPORECTIFICATIVA: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_FAGR_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_FAGR_FECHAEXPEDICION: TDateTimeField;
     xRLRFacEmiDisponiblesFACEXP_FRECT_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_FRECT_FECHAEXPEDICION: TDateTimeField;
     xRLRFacEmiDisponiblesFACEXP_IMPRECT_BASERECT: TFloatField;
     xRLRFacEmiDisponiblesFACEXP_IMPRECT_CUOTARECT: TFloatField;
     xRLRFacEmiDisponiblesFACEXP_IMPRECT_CUOTARECRECT: TFloatField;
     xRLRFacEmiDisponiblesFACEXP_FECHAOPERACION: TDateTimeField;
     xRLRFacEmiDisponiblesFACEXP_CLAVE_REG_ESP: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CLAVE_REG_ESP1: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CLAVE_REG_ESP2: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_NUMREGACUERDOFAC: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_IMPORTE_TOTAL: TFloatField;
     xRLRFacEmiDisponiblesFACEXP_BASEIMPONIBLEACOSTE: TFloatField;
     xRLRFacEmiDisponiblesFACEXP_DESCRIPCION: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_INMUEBLE_SITUACIONINM: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_INMUEBLE_REFCATASTRAL: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_IMPORTETRANSMSUJETAIVA: TFloatField;
     xRLRFacEmiDisponiblesFACEXP_EMITIDA_POR_TERCEROS: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_VARIOSDESTINATARIOS: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CUPON: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CONTRAP_NOMBRE_RAZON: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CONTRAP_NIF_REPRES: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CONTRAP_NIF: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_CODPAIS: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_IDTYPE: TFIBStringField;
     xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_ID: TFIBStringField;
     xRLRFacEmiDisponiblesTIPO_DESGLOSE: TFIBStringField;
     xRLRFacEmiDisponiblesTIPO_DESGLOSE_OPERACION: TFIBStringField;
     xRLRFacEmiDisponiblesESTADO_REGISTRO: TFIBStringField;
     xRLRFacEmiDisponiblesCODIGO_ERROR: TFIBStringField;
     xRLRFacEmiDisponiblesDESCRIPCION_ERROR: TFIBStringField;
     xRLRFacRecDisponibles: TFIBTableSet;
     DSRLRFacRecDisponibles: TDataSource;
     xRLRFacRecDisponiblesID_SII_PRESENTACION: TIntegerField;
     xRLRFacRecDisponiblesID_SII_REGLRFACTURASRECIBIDAS: TIntegerField;
     xRLRFacRecDisponiblesID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField;
     xRLRFacRecDisponiblesID_I: TIntegerField;
     xRLRFacRecDisponiblesPERIODOIMPOSITIVO_EJERCICIO: TIntegerField;
     xRLRFacRecDisponiblesPERIODOIMPOSITIVO_PERIODO: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_NIF: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_CODPAIS: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_IDTYPE: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_ID: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField;
     xRLRFacRecDisponiblesIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField;
     xRLRFacRecDisponiblesFACREC_TIPOFACTURA: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_TIPORECTIFICATIVA: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_FAGR_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_FAGR_FECHAEXPEDICION: TDateTimeField;
     xRLRFacRecDisponiblesFACREC_FRECT_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_FRECT_FECHAEXPEDICION: TDateTimeField;
     xRLRFacRecDisponiblesFACREC_IMPRECT_BASERECT: TFloatField;
     xRLRFacRecDisponiblesFACREC_IMPRECT_CUOTARECT: TFloatField;
     xRLRFacRecDisponiblesFACREC_IMPRECT_CUOTARECRECT: TFloatField;
     xRLRFacRecDisponiblesFACREC_FECHAOPERACION: TDateTimeField;
     xRLRFacRecDisponiblesFACREC_CLAVE_REG_ESP: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CLAVE_REG_ESP1: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CLAVE_REG_ESP2: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_NUMREGACUERDOFAC: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_IMPORTE_TOTAL: TFloatField;
     xRLRFacRecDisponiblesFACREC_BASEIMPONIBLEACOSTE: TFloatField;
     xRLRFacRecDisponiblesFACREC_DESCRIPCION: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_ADUANAS_NUMERODUA: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_ADUANAS_FECHAREGCONTDUA: TDateTimeField;
     xRLRFacRecDisponiblesFACREC_CONTRAP_NOMBRE_RAZON: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CONTRAP_NIF_REPRES: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CONTRAP_NIF: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CONTRAPARTE_CODPAIS: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CONTRAPARTE_IDTYPE: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_CONTRAPARTE_ID: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_FECHAREGCONTABLE: TDateTimeField;
     xRLRFacRecDisponiblesFACREC_CUOTA_DEDUCIBLE: TFloatField;
     xRLRFacRecDisponiblesESTADO_REGISTRO: TFIBStringField;
     xRLRFacRecDisponiblesCODIGO_ERROR: TFIBStringField;
     xRLRFacRecDisponiblesDESCRIPCION_ERROR: TFIBStringField;
     xRLRFacRecTIPOCOMUNICACION_DESTINO: TFIBStringField;
     xRLRFacRecFACREC_INMUEBLE_SITUACIONINM: TFIBStringField;
     xRLRFacRecFACREC_INMUEBLE_REFCATASTRAL: TFIBStringField;
     xRLRFacRecDisponiblesTIPOCOMUNICACION_DESTINO: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_INMUEBLE_SITUACIONINM: TFIBStringField;
     xRLRFacRecDisponiblesFACREC_INMUEBLE_REFCATASTRAL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xPresentacionAfterOpen(DataSet: TDataSet);
     procedure xPresentacionBeforeClose(DataSet: TDataSet);
     procedure xSLRFacEmiAfterOpen(DataSet: TDataSet);
     procedure xSLRFacEmiBeforeClose(DataSet: TDataSet);
     procedure xSLRFacRecAfterOpen(DataSet: TDataSet);
     procedure xSLRFacRecBeforeClose(DataSet: TDataSet);
     procedure xRLRFacEmiAfterOpen(DataSet: TDataSet);
     procedure xRLRFacEmiBeforeClose(DataSet: TDataSet);
     procedure xRLRFacRecAfterOpen(DataSet: TDataSet);
     procedure xRLRFacRecBeforeClose(DataSet: TDataSet);
     procedure xPresentacionNewRecord(DataSet: TDataSet);
     procedure xPresentacionBeforePost(DataSet: TDataSet);
     procedure xSLRFacEmiNewRecord(DataSet: TDataSet);
     procedure xSLRFacEmiBeforePost(DataSet: TDataSet);
     procedure xSLRFacRecBeforePost(DataSet: TDataSet);
     procedure xSLRFacRecNewRecord(DataSet: TDataSet);
     procedure xRLRFacEmiAfterDelete(DataSet: TDataSet);
     procedure xRLRFacRecAfterDelete(DataSet: TDataSet);
     procedure xSLRFacEmiAfterScroll(DataSet: TDataSet);
     procedure xSLRFacRecAfterScroll(DataSet: TDataSet);
     procedure xPresentacionAfterScroll(DataSet: TDataSet);
     procedure xPresentacionAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Closing: boolean;
     procedure CreaElemento(NodoPadre: IXMLNode; Prefix, TagName, AText: WideString);
     function CreaNodo(NodoPadre: IXMLNode; Prefix, TagName: WideString): IXMLNode;
     function CreaSoapEnv(Documento: TXMLDocument): IXMLNode;
     procedure GuardaXML(id: integer; Tipo, xml: string);
     function DameXML(id: integer; Tipo: string): string;
  public
     { Public declarations }
     (*
     procedure SII_CreaPresentacion(Entrada: integer);
     *)
     procedure SII_LibroFacturasEmitidas(Entrada: integer);
     procedure SII_LibroFacturasRecibidas(Entrada: integer);
     procedure EnviarPresentacion(Entrada: integer);
     procedure VerificarRespuestaPresentacion(Entrada: integer);
     procedure GuardarFicheroPresentacion;
     procedure GuardarFicheroRespuesta;
     procedure SeleccionaFacturaEmitida;
     procedure SeleccionaFacturaRecibida;
     procedure SeleccionaFacturaEmitidaFecha(Desde, Hasta: TDateTime);
     procedure SeleccionaFacturaRecibidaFecha(Desde, Hasta: TDateTime);
  end;

var
  DMSII : TDMSII;

implementation

uses Math, Dialogs, DateUtils, UEntorno, UDMMain, ComObj {CreateOleObject}, Variants, UUtiles, HYFIBQuery, UParam, UFormGest, UDMAdjunto;

{$R *.dfm}

const
  Prefixsoapenv: WideString = 'soapenv:';
  Prefixenv: WideString = 'env:';
  Prefixsii: WideString = 'sii:';
  PrefixsiiR: WideString = 'siiR:';
  PrefixsiiLR: WideString = 'siiLR:';
  DOMString: WideString = '';
  IDVersionSii: WideString = '1.1';

{Funciones auxiliares}
function DameNodo(NodoPadre: IXMLNode; a: array of WideString): IXMLNode;
var
  i : integer;
  Nodo : IXMLNode;
  APrefix, ATagName : WideString;
begin
  Result := nil;
  i := 0;
  Nodo := NodoPadre;
  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     // Nodo := Nodo.ChildNodes.FindNode(a[i]);

     APrefix := Copy(a[i], 1, Pos(':', a[i]) - 1);
     ATagName := Copy(a[i], Pos(':', a[i]) + 1, Length(a[i]));

     Nodo := NodoPadre.ChildNodes.First;
     while (Assigned(Nodo) and ((Nodo.LocalName <> ATagName) or (Nodo.Prefix <> APrefix))) do
        Nodo := Nodo.NextSibling;

     // Si lo encontre
     if (Assigned(Nodo) and (Nodo.LocalName = ATagName) and (Nodo.Prefix = APrefix)) then
     begin
        Inc(i);
        NodoPadre := Nodo;
     end;
  end;

  Result := Nodo;
end;

function DameDato(Nodo: IXMLNode; a: array of string): string;
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

procedure TDMSII.DataModuleCreate(Sender: TObject);
begin
  Closing := False;
  TranslateComponent(Self); //IDIOMA_CODE

  DMMain.Log('DataModuleCreate');
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xPresentacion, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSLRFacEmi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRLRFacEmi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRLRFacEmiDisponibles, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDesgloseFacEmi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSLRFacRec, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRLRFacRec, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRLRFacRecDisponibles, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDesgloseFacRec, MascaraN, MascaraI, ShortDateFormat);

  DMMain.Log('FiltraTabla(xPresentacion, ...');
  DMMain.FiltraTabla(xPresentacion, '10100');
end;

procedure TDMSII.DataModuleDestroy(Sender: TObject);
begin
  Closing := True;
end;

{Libro de facturas emitidas}

function TDMSII.CreaSoapEnv(Documento: TXMLDocument): IXMLNode;
begin
  // Crea primer elemento, correspondiente al SoapEnv
  with Documento do
  begin
     DocumentElement := CreateElement(Prefixsoapenv + 'Envelope', DOMString);
     with DocumentElement do
     begin
        DeclareNamespace('soapenv', 'http://schemas.xmlsoap.org/soap/envelope/');
        DeclareNamespace('siiLR', 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroLR.xsd');
        DeclareNamespace('sii', 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroInformacion.xsd');
     end;

     Result := DocumentElement;
  end;
end;

function TDMSII.CreaNodo(NodoPadre: IXMLNode; Prefix, TagName: WideString): IXMLNode;
begin
  Result := NodoPadre.AddChild(Prefix + TagName);
end;

procedure TDMSII.CreaElemento(NodoPadre: IXMLNode; Prefix, TagName, AText: WideString);
// var
//   Nodo : IXMLNode;
begin
  // Nodo := NodoPadre.AddChild(Prefix + TagName);
  // Nodo.Text := AText;

  NodoPadre.AddChild(Prefix + TagName).Text := AText;
end;

procedure TDMSII.SII_LibroFacturasEmitidas(Entrada: integer);
var
  Documento : TXMLDocument;
  NodoRoot : IXMLNode;
  NodoPadre : IXMLNode;
  SuministroLRFacturasEmitidas, RegistroLRFacturasEmitidas, IDFactura, FacturaExpedida, DesgloseFactura, TipoDesglose, Sujeta, NoSujeta, Exenta, NoExenta : IXMLNode;
  DesgloseTipoOperacion, PrestacionServicios, Entrega : IXMLNode;
  Nodo : IXMLNode;
begin
  // Datos a Exportar
  {
  with xSLRFacEmi do
  begin
     Close;
     UniDirectional := True;
     Open;
  end;
  }

  with xRLRFacEmi do
  begin
     Close;
     UniDirectional := True;
     Open;
  end;

  with xDesgloseFacEmi do
  begin
     Close;
     UniDirectional := True;
     Open;
  end;

  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        // Borro los datos que pudiera haber
        XML.Text := '';
        // Se activa para poder utilizar el componente
        Active := True;
        // Codigifacion UTF-8
        Encoding := 'utf-8';
        // Standalone="yes"
        // StandAlone := 'yes';
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        NodoRoot := CreaSoapEnv(Documento);
        NodoPadre := CreaNodo(NodoRoot, Prefixsoapenv, 'Header');
        NodoPadre := CreaNodo(NodoRoot, Prefixsoapenv, 'Body');

        // Si se trata de una baja, es un mensaje diferente
        if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
        begin
           SuministroLRFacturasEmitidas := CreaNodo(NodoPadre, PrefixsiiLR, 'BajaLRFacturasEmitidas');
           NodoPadre := CreaNodo(SuministroLRFacturasEmitidas, Prefixsii, 'Cabecera');
           CreaElemento(NodoPadre, Prefixsii, 'IDVersionSii', xSLRFacEmiIDVERSIONSII.AsString);
           NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'Titular');
           CreaElemento(NodoPadre, Prefixsii, 'NombreRazon', QuitarAcentosTexto(xSLRFacEmiTITULAR_NOMBRE_RAZON.AsString));
           CreaElemento(NodoPadre, Prefixsii, 'NIF', Copy(xSLRFacEmiNIF.AsString, 1, 9));

           // Solo si es menor de edad (NIF empieza por 'K')
           if (xSLRFacEmiNIF_REPRESENTANTE.AsString <> '') then
           begin
              Nodo := NodoPadre.AddChild(Prefixsii + 'NIFRepresentante', DOMString);
              Nodo.Text := Copy(xSLRFacEmiNIF_REPRESENTANTE.AsString, 1, 9);
           end;

           with xRLRFacEmi do
           begin
              while not EOF do
              begin
                 RegistroLRFacturasEmitidas := CreaNodo(SuministroLRFacturasEmitidas, PrefixsiiLR, 'RegistroLRBajaExpedidas');

                 // PeriodoLiquidacion
                 NodoPadre := CreaNodo(RegistroLRFacturasEmitidas, Prefixsii, 'PeriodoLiquidacion');
                 CreaElemento(NodoPadre, Prefixsii, 'Ejercicio', FieldByName('PERIODOIMPOSITIVO_EJERCICIO').AsString);
                 CreaElemento(NodoPadre, Prefixsii, 'Periodo', FieldByName('PERIODOIMPOSITIVO_PERIODO').AsString); {'01..'12'}

                 // IDFactura
                 IDFactura := CreaNodo(RegistroLRFacturasEmitidas, PrefixsiiLR, 'IDFactura');
                 Nodo := CreaNodo(IDFactura, Prefixsii, 'IDEmisorFactura');
                 { TODO : Reemplazar con datos de empresa }
                 CreaElemento(Nodo, Prefixsii, 'NIF', Copy(FieldByName('IDFAC_EMISOR_NIF').AsString, 1, 9));
                 CreaElemento(IDFactura, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('IDFAC_EMISOR_NUMSERIEFAC').AsString);
                 CreaElemento(IDFactura, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('IDFAC_EMISOR_FECHA_EXPEDICION').AsDateTime));

                 Next;
              end;
           end;
        end
        else
        begin
           SuministroLRFacturasEmitidas := CreaNodo(NodoPadre, PrefixsiiLR, 'SuministroLRFacturasEmitidas');

           NodoPadre := CreaNodo(SuministroLRFacturasEmitidas, Prefixsii, 'Cabecera');
           CreaElemento(NodoPadre, Prefixsii, 'IDVersionSii', xSLRFacEmiIDVERSIONSII.AsString);
           NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'Titular');
           CreaElemento(NodoPadre, Prefixsii, 'NombreRazon', QuitarAcentosTexto(xSLRFacEmiTITULAR_NOMBRE_RAZON.AsString));
           CreaElemento(NodoPadre, Prefixsii, 'NIF', Copy(xSLRFacEmiNIF.AsString, 1, 9));

           // Solo si es menor de edad (NIF empieza por 'K')
           if (xSLRFacEmiNIF_REPRESENTANTE.AsString <> '') then
           begin
              Nodo := NodoPadre.AddChild(Prefixsii + 'NIFRepresentante', DOMString);
              Nodo.Text := Copy(xSLRFacEmiNIF_REPRESENTANTE.AsString, 1, 9);
           end;

           // Vuelvo a la cabecera
           NodoPadre := DameNodo(SuministroLRFacturasEmitidas, [Prefixsii + 'Cabecera']);
           if (Assigned(NodoPadre)) then
           begin
              // A0 Alta, A1 Modificacion, A4 Modificacion Regimen Viajeros
              CreaElemento(NodoPadre, Prefixsii, 'TipoComunicacion', xSLRFacEmiTIPOCOMUNICACION.AsString);
           end;

           // -------------------------------------------------------
           // Las facturas tienen que estar agrupadas por periodo ???
           // -------------------------------------------------------

           // Se recorren los registros de IVA
           with xRLRFacEmi do
           begin
              while not EOF do
              begin
                 RegistroLRFacturasEmitidas := CreaNodo(SuministroLRFacturasEmitidas, PrefixsiiLR, 'RegistroLRFacturasEmitidas');

                 // PeriodoLiquidacion
                 NodoPadre := CreaNodo(RegistroLRFacturasEmitidas, Prefixsii, 'PeriodoLiquidacion');
                 CreaElemento(NodoPadre, Prefixsii, 'Ejercicio', FieldByName('PERIODOIMPOSITIVO_EJERCICIO').AsString);
                 CreaElemento(NodoPadre, Prefixsii, 'Periodo', FieldByName('PERIODOIMPOSITIVO_PERIODO').AsString); {'01..'12'}

                 // IDFactura
                 IDFactura := CreaNodo(RegistroLRFacturasEmitidas, PrefixsiiLR, 'IDFactura');
                 Nodo := CreaNodo(IDFactura, Prefixsii, 'IDEmisorFactura');
                 { TODO : Reemplazar con datos de empresa }
                 CreaElemento(Nodo, Prefixsii, 'NIF', Copy(FieldByName('IDFAC_EMISOR_NIF').AsString, 1, 9));
                 CreaElemento(IDFactura, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('IDFAC_EMISOR_NUMSERIEFAC').AsString);
                 CreaElemento(IDFactura, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('IDFAC_EMISOR_FECHA_EXPEDICION').AsDateTime));

                 // FacturaExpedida
                 FacturaExpedida := CreaNodo(RegistroLRFacturasEmitidas, PrefixsiiLR, 'FacturaExpedida');
                 // Especificación del tipo de factura a dar de alta: factura normal, factura rectificativa, tickets, factura emitida en sustitución de facturas.
                 // Lista L2_EMI - Tipo de Factura Emitidas :
                 // F1 Factura (art. 6, 7.2 y 7.3 del RD 1619/2012)
                 // F2 Factura Simplificada y Facturas sin identificación del destinatario art. 6.1.d) RD 1619/2012
                 // F3 Factura emitida en sustitución de facturas simplificadas facturadas y declaradas
                 // F4 Asiento resumen de facturas
                 // R1 Factura Rectificativa (Art 80.1 y 80.2, 80.6 y error fundado en derecho)
                 // R2 Factura Rectificativa (Art. 80.3)
                 // R3 Factura Rectificativa (Art. 80.4)
                 // R4 Factura Rectificativa (Resto)
                 // R5 Factura Rectificativa en facturas simplificadas
                 CreaElemento(FacturaExpedida, Prefixsii, 'TipoFactura', FieldByName('FACEXP_TIPOFACTURA').AsString);

                 if (FieldByName('FACEXP_TIPORECTIFICATIVA').AsString <> '' {Es_Rectificativa - R1, R2, R3, R4, R5}) then
                 begin
                    // Campo que identifica si el tipo de factura rectificativa es por sustitución o por diferencia
                    // Lista L5 - Tipo de Factura Rectificativa
                    // S Por sustitución
                    // I Por diferencias
                    CreaElemento(FacturaExpedida, Prefixsii, 'TipoRectificativa', FieldByName('FACEXP_TIPORECTIFICATIVA').AsString);

                    if (FieldByName('FACEXP_TIPOFACTURA').AsString = 'R5' {Es_Rectificativa R5???}) then
                    begin
                       // FacturasAgrupadas
                       NodoPadre := CreaNodo(FacturaExpedida, Prefixsii, 'FacturasAgrupadas');
                       NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDFacturaAgrupada');
                       // Nº Serie+Nº Factura que identifica a la factura emitida
                       CreaElemento(NodoPadre, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('FACEXP_FAGR_NUMSERIEFACEMISOR').AsString);
                       // Fecha de expedición de la factura
                       CreaElemento(NodoPadre, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('FACEXP_FAGR_FECHAEXPEDICION').AsDateTime));
                    end;

                    if (FieldByName('FACEXP_TIPORECTIFICATIVA').AsString = 'I' {Rectificativa Por diferencias}) then
                    begin
                       // FacturasRectificadas
                       NodoPadre := CreaNodo(FacturaExpedida, Prefixsii, 'FacturasRectificadas');
                       NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDFacturaRectificada');
                       // Nº Serie+Nº Factura que identifica a la factura emitida
                       CreaElemento(NodoPadre, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('FACEXP_FRECT_NUMSERIEFACEMISOR').AsString);
                       // Fecha de expedición de la factura
                       CreaElemento(NodoPadre, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('FACEXP_FRECT_FECHAEXPEDICION').AsDateTime));
                    end
                    else
                    if (FieldByName('FACEXP_TIPORECTIFICATIVA').AsString = 'S' {Rectificativa Por sustitución}) then
                    begin
                       NodoPadre := CreaNodo(FacturaExpedida, Prefixsii, 'ImporteRectificacion');
                       CreaElemento(NodoPadre, Prefixsii, 'BaseRectificada', FormatAmount(FieldByName('FACEXP_IMPRECT_BASERECT').AsFloat, 2));
                       CreaElemento(NodoPadre, Prefixsii, 'CuotaRectificada', FormatAmount(FieldByName('FACEXP_IMPRECT_CUOTARECT').AsFloat, 2));
                       if (FieldByName('FACEXP_IMPRECT_CUOTARECRECT').AsFloat <> 0) then
                          CreaElemento(NodoPadre, Prefixsii, 'CuotaRecargoRectificado', FormatAmount(FieldByName('FACEXP_IMPRECT_CUOTARECRECT').AsFloat, 2));
                    end;
                 end;

                 // Fecha Operacion: Fecha en la que se ha realizado la operacion siempre que sea diferente a la fecha de expedicion.
                 // ??? De donde sacamos esta fecha? Albaran?
                 // CreaElemento(FacturaExpedida, Prefixsii, 'FechaOperacion', FormatDateTime('dd-mm-yyyy', FieldByName('FACEXP_FECHAOPERACION').AsDAteTime));

                 // ??? En que casos se utiliza ???
                 // Clave que identificará el tipo de operación o el régimen especial con transcendencia tributaria
                 // L3.1 - Clave de régimen especial o trascendencia en facturas expedidas
                 // 01 Operación de régimen común
                 // 02 Exportación
                 // 03 Operaciones a las que se aplique el régimen especial de bienes usados, objetos de arte, antigüedades y objetos de colección (135-139 LIVA)
                 // 04 Régimen especial oro de inversión
                 // 05 Régimen especial agencias de viajes 06 Régimen especial grupo de entidades en IVA (Nivel Avanzado)
                 // 07 Régimen especial criterio de caja
                 // 08 Operaciones sujetas al IPSI / IGIC
                 // 09 Facturación de las prestaciones de servicios de agencias de viaje que actúan como mediadoras en nombre y por cuenta ajena (D.A.4ª RD1619/2012)
                 // 10 Cobros por cuenta de terceros de honorarios profesionales o de derechos derivados de la propiedad industrial, de autor u otros por cuenta de sus socios, asociados o colegiados efectuados por sociedades, asociaciones, colegios profesionales u otras entidades que realicen estas funciones de cobro
                 // 11 Operaciones de arrendamiento de local de negocio sujetas a retención
                 // 12 Operaciones de arrendamiento de local de negocio no  sujetos a retención
                 // 13 Operaciones de arrendamiento de local de negocio sujetas y no sujetas a retención
                 // 14 Factura con IVA pendiente de devengo (certificaciones de obra cuyo destinatario sea una Administración Pública)
                 // 15 Factura con IVA pendiente de devengo - operaciones de tracto sucesivo
                 // 16 Primer semestre
                 // Si se trata de una BAJA, hay que poner '02' y CausaExcenta = 'E2'
                 CreaElemento(FacturaExpedida, Prefixsii, 'ClaveRegimenEspecialOTrascendencia', FieldByName('FACEXP_CLAVE_REG_ESP').AsString);

                 if (FieldByName('FACEXP_CLAVE_REG_ESP1').AsString <> '') then
                    CreaElemento(FacturaExpedida, Prefixsii, 'ClaveRegimenEspecialOTrascendencia1', FieldByName('FACEXP_CLAVE_REG_ESP1').AsString);
                 if (FieldByName('FACEXP_CLAVE_REG_ESP2').AsString <> '') then
                    CreaElemento(FacturaExpedida, Prefixsii, 'ClaveRegimenEspecialOTrascendencia2', FieldByName('FACEXP_CLAVE_REG_ESP2').AsString);

                 if (FieldByName('FACEXP_NUMREGACUERDOFAC').AsString > '') then
                    CreaElemento(FacturaExpedida, Prefixsii, 'NumRegistroAcuerdoFacturacion', FieldByName('FACEXP_NUMREGACUERDOFAC').AsString);

                 if (FieldByName('FACEXP_TIPOFACTURA').AsString <> 'F4') then
                 begin
                    // Importe total de la factura
                    CreaElemento(FacturaExpedida, Prefixsii, 'ImporteTotal', FormatAmount(FieldByName('FACEXP_IMPORTE_TOTAL').AsFloat, 2));
                 end;

                 if (FieldByName('FACEXP_CLAVE_REG_ESP').AsString = '07') then
                 begin
                    // ??? En que casos se utiliza
                    // Para grupos de IVA
                    CreaElemento(FacturaExpedida, Prefixsii, 'BaseImponibleACoste', FormatAmount(FieldByName('FACEXP_BASEIMPONIBLEACOSTE').AsFloat, 2));
                 end;

                 // ??? Que se supone que debemos rellenar aqui?
                 // Descripción del objeto de la factura
                 CreaElemento(FacturaExpedida, Prefixsii, 'DescripcionOperacion', FieldByName('FACEXP_DESCRIPCION').AsString);

                 if ((FieldByName('FACEXP_CLAVE_REG_ESP').AsString = '13') or
                    (FieldByName('FACEXP_CLAVE_REG_ESP').AsString = '14') or
                    (FieldByName('FACEXP_CLAVE_REG_ESP').AsString = '15')) then
                 begin
                    NodoPadre := CreaNodo(FacturaExpedida, Prefixsii, 'DatosInmueble');
                    NodoPadre := CreaNodo(FacturaExpedida, Prefixsii, 'DetalleInmueble');
                    // Lista L6 - Situación del Inmueble
                    // 1 Inmueble con referencia catastral situado en cualquier punto del territorio español, excepto País Vasco y Navarra
                    // 2 Inmueble situado en la Comunidad Autónoma del País Vasco o en la Comunidad Foral de Navarra
                    // 3 Inmueble en cualquiera de las situaciones anteriores  pero sin referencia catastral
                    // 4 Inmueble situado en el extranjero
                    CreaElemento(NodoPadre, Prefixsii, 'SituacionInmueble', FieldByName('FACEXP_INMUEBLE_SITUACIONINM').AsString);
                    CreaElemento(NodoPadre, Prefixsii, 'ReferenciaCatastral', FieldByName('FACEXP_INMUEBLE_REFCATASTRAL').AsString);
                 end;

                 // ??? En que casos se debe rellenar esto?
                 // CreaElemento(FacturaExpedida, Prefixsii, 'ImportaTransmisionSujetoAIVA', FormatAmount(FieldByName('FACEXP_IMPORTETRANSMSUJETAIVA').AsFloat, 2));

                 if (FieldByName('FACEXP_EMITIDA_POR_TERCEROS').AsString = 'S') then
                 begin
                    // Identificador que especifica si la factura ha sido emitida por un tercero.
                    // Si no se informa este campo se entenderá que tiene valor  “N”.
                    // Lista L10 - Emitidas por Terceros
                    // S Si
                    // N No
                    CreaElemento(FacturaExpedida, Prefixsii, 'EmitidaPorTercerosODestinatario', FieldByName('FACEXP_EMITIDA_POR_TERCEROS').AsString);
                 end;

                 if (FieldByName('FACEXP_VARIOSDESTINATARIOS').AsString = 'S') then
                 begin
                    // Identificador que especifica si la factura tiene varios destinatarios.
                    // Si no se informa este campo se entenderá que tiene valor  “N”.
                    // Lista L20 - Varios destinatarios
                    // S Si
                    // N No
                    CreaElemento(FacturaExpedida, Prefixsii, 'VariosDestinatarios', FieldByName('FACEXP_VARIOSDESTINATARIOS').AsString);
                 end;

                 // ??? Que es esto?
                 if (FieldByName('FACEXP_CUPON').AsString = 'S') then
                 begin
                    // Identificador que especifica si la factura tipo R5 o F4 tiene minoración de la base imponible por la concesión de cupones,
                    // bonificaciones o descuentos cuando solo se expide el original de la factura.
                    // Si no se informa este campo se entenderá que tiene valor  “N”.
                    // Lista L22 - Varios destinatarios
                    // S Si
                    // N No
                    CreaElemento(FacturaExpedida, Prefixsii, 'Cupon', FieldByName('FACEXP_CUPON').AsString);
                 end;

                 // Facturas simplificadas no llevan <Contraparte>
                 if (FieldByName('FACEXP_TIPOFACTURA').AsString <> 'F2') then
                 begin
                    NodoPadre := CreaNodo(FacturaExpedida, Prefixsii, 'Contraparte');
                    // Nombre-razón social de la contraparte de la operación (cliente) de facturas expedidas
                    CreaElemento(NodoPadre, Prefixsii, 'NombreRazon', QuitarAcentosTexto(FieldByName('FACEXP_CONTRAP_NOMBRE_RAZON').AsString));
                    if (FieldByName('FACEXP_CONTRAP_NIF_REPRES').AsString > '') then
                    begin
                       // NIF del representante de la contraparte de la operación
                       CreaElemento(NodoPadre, Prefixsii, 'NIFRepresentante', FieldByName('FACEXP_CONTRAP_NIF_REPRES').AsString);
                    end;

                    // Ver el caso de NIE. Creo que todos empiezan por X
                    if (FieldByName('FACEXP_CONTRAPARTE_IDTYPE').AsString = '') then
                    begin
                       // Identificador del NIF contraparte de la operación (cliente) de facturas expedida
                       CreaElemento(NodoPadre, Prefixsii, 'NIF', FieldByName('FACEXP_CONTRAP_NIF').AsString);
                    end
                    else
                    begin
                       NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDOtro');
                       CreaElemento(NodoPadre, Prefixsii, 'CodigoPais', FieldByName('FACEXP_CONTRAPARTE_CODPAIS').AsString);
                       // Clave para establecer el tipo de identificación en el pais de residencia
                       // Lista L4 - Tipos de Identificación en el país de residencia
                       // 02 NIF-IVA
                       // 03 PASAPORTE
                       // 04 DOCUMENTO OFICIAL DE IDENTIFICACIÓN EXPEDIDO POR EL PAIS O TERRITORIO DE RESIDENCIA
                       // 05 CERTIFICADO DE RESIDENCIA
                       // 06 OTRO DOCUMENTO PROBATORIO
                       CreaElemento(NodoPadre, Prefixsii, 'IDType', FieldByName('FACEXP_CONTRAPARTE_IDTYPE').AsString);
                       CreaElemento(NodoPadre, Prefixsii, 'ID', FieldByName('FACEXP_CONTRAPARTE_ID').AsString);
                    end;
                 end;

                 // Desglose
                 with xDesgloseFacEmi do
                 begin
                    TipoDesglose := CreaNodo(FacturaExpedida, Prefixsii, 'TipoDesglose');
                    if (xRLRFacEmi.FieldByName('TIPO_DESGLOSE').AsString = 'F') then
                    begin
                       DesgloseFactura := CreaNodo(TipoDesglose, Prefixsii, 'DesgloseFactura');

                       if ((FieldByName('SUJETA_EXENTA_CAUSA').AsString <> '') or
                          (FieldByName('SUJETA_NO_EXENTA_TIPO').AsString <> '')) then
                       begin
                          Sujeta := CreaNodo(DesgloseFactura, Prefixsii, 'Sujeta');
                          Exenta := nil;
                          NoExenta := nil;
                          while not EOF do
                          begin
                             if (FieldByName('SUJETA_EXENTA_CAUSA').AsString <> '') then
                             begin
                                if (not Assigned(Exenta)) then
                                   Exenta := CreaNodo(Sujeta, Prefixsii, 'Exenta');

                                // Version 1.1 - puede haber mas de una clase de excenta
                                Exenta := CreaNodo(Exenta, Prefixsii, 'DetalleExenta');

                                // Lista L9 - Causa de exención de operaciones sujetas y exentas
                                // E1 Exenta por el artículo 20
                                // E2 Exenta por el artículo 21
                                // E3 Exenta por el artículo 22
                                // E4 Exenta por el artículo 24
                                // E5 Exenta por el artículo 25
                                // E6 Exenta por Otros
                                CreaElemento(Exenta, Prefixsii, 'CausaExencion', FieldByName('SUJETA_EXENTA_CAUSA').AsString);
                                CreaElemento(Exenta, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('SUJETA_EXENTA_BASEIMPONIBLE').AsFloat, 2));
                             end
                             else
                             begin
                                // Debo buscar un nodo "NoExenta" que contenga TipoNoExenta que corresponda (S1, S2)
                                NoExenta := DameNodo(Sujeta, [Prefixsii + 'NoExenta']);

                                while Assigned(NoExenta) and (DameDato(NoExenta, [Prefixsii + 'TipoNoExenta']) <> FieldByName('SUJETA_NO_EXENTA_TIPO').AsString) do
                                   NoExenta := NoExenta.NextSibling;

                                if (not Assigned(NoExenta)) then
                                begin
                                   NoExenta := CreaNodo(Sujeta, Prefixsii, 'NoExenta');

                                   // Lista L7 - Calificación del tipo de operación Sujeta/ No Exenta
                                   // S1 Sujeta – No Exenta
                                   // S2 Sujeta – No Exenta - Inv. Suj. Pasiv

                                   // if (not Assigned(DameNodo(NoExenta, [Prefixsii + 'TipoNoExenta']))) then
                                   CreaElemento(NoExenta, Prefixsii, 'TipoNoExenta', FieldByName('SUJETA_NO_EXENTA_TIPO').AsString);
                                end;

                                NodoPadre := DameNodo(NoExenta, [Prefixsii + 'DesgloseIVA']);
                                if (not Assigned(NodoPadre)) then
                                   NodoPadre := CreaNodo(NoExenta, Prefixsii, 'DesgloseIVA');

                                NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'DetalleIVA');
                                CreaElemento(NodoPadre, Prefixsii, 'TipoImpositivo', FormatAmount(FieldByName('SUJETA_NO_EXENTA_TIPOIMP').AsFloat, 2));
                                CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('SUJETA_NO_EXENTA_BASEIMP').AsFloat, 2));
                                CreaElemento(NodoPadre, Prefixsii, 'CuotaRepercutida', FormatAmount(FieldByName('SUJETA_NO_EXENTA_CUOTAREP').AsFloat, 2));
                                if (FieldByName('SUJETA_NO_EXENTA_TIPOREC').AsFloat <> 0) then
                                begin
                                   CreaElemento(NodoPadre, Prefixsii, 'TipoRecargoEquivalencia', FormatAmount(FieldByName('SUJETA_NO_EXENTA_TIPOREC').AsFloat, 2));
                                   CreaElemento(NodoPadre, Prefixsii, 'CuotaRecargoEquivalencia', FormatAmount(FieldByName('SUJETA_NO_EXENTA_CUOTAREC').AsFloat, 2));
                                end;
                             end;

                             Next;
                          end;
                       end
                       else
                       begin
                          NoSujeta := CreaNodo(DesgloseFactura, Prefixsii, 'NoSujeta');
                          // Importe en euros si la sujeción es por el art. 7,14,  otros
                          CreaElemento(NoSujeta, Prefixsii, 'ImportePorArticulos7_14_Otros', FormatAmount(FieldByName('NO_SUJETA_IMPORTE_ART_7_14').AsFloat, 2));
                          // Importe en euros si la sujeción es por operaciones no sujetas en el TAI por reglas de localización
                          CreaElemento(NoSujeta, Prefixsii, 'ImporteTAIReglasLocalizacion', FormatAmount(FieldByName('NO_SUJETA_IMPORTE_TAI').AsFloat, 2));
                       end;
                    end
                    else
                    begin
                       DesgloseTipoOperacion := CreaNodo(TipoDesglose, Prefixsii, 'DesgloseTipoOperacion');
                       if (xRLRFacEmi.FieldByName('TIPO_DESGLOSE_OPERACION').AsString = 'P') then
                       begin
                          PrestacionServicios := CreaNodo(DesgloseTipoOperacion, Prefixsii, 'PrestacionServicios');

                          if ((FieldByName('SUJETA_EXENTA_CAUSA').AsString <> '') or
                             (FieldByName('SUJETA_NO_EXENTA_TIPO').AsString <> '')) then
                          begin
                             Sujeta := CreaNodo(PrestacionServicios, Prefixsii, 'Sujeta');

                             Exenta := nil;
                             NoExenta := nil;

                             while not EOF do
                             begin
                                if (FieldByName('SUJETA_EXENTA_CAUSA').AsString <> '') then
                                begin
                                   NodoPadre := CreaNodo(Sujeta, Prefixsii, 'Exenta');

                                   // Version 1.1 - puede haber mas de una clase de excenta
                                   NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'DetalleExenta');

                                   // Lista L9 - Causa de exención de operaciones sujetas y exentas
                                   // E1 Exenta por el artículo 20
                                   // E2 Exenta por el artículo 21
                                   // E3 Exenta por el artículo 22
                                   // E4 Exenta por el artículo 24
                                   // E5 Exenta por el artículo 25
                                   // E6 Exenta por Otros
                                   CreaElemento(NodoPadre, Prefixsii, 'CausaExencion', FieldByName('SUJETA_EXENTA_CAUSA').AsString);
                                   CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('SUJETA_EXENTA_BASEIMPONIBLE').AsFloat, 2));
                                end
                                else
                                begin
                                   if (not Assigned(NoExenta)) then
                                      NoExenta := CreaNodo(Sujeta, Prefixsii, 'NoExenta');
                                   // Lista L7 - Calificación del tipo de operación Sujeta/ No Exenta
                                   // S1 Sujeta – No Exenta
                                   // S2 Sujeta – No Exenta - Inv. Suj. Pasiv

                                   if (not Assigned(DameNodo(NoExenta, [Prefixsii + 'TipoNoExenta']))) then
                                      CreaElemento(NoExenta, Prefixsii, 'TipoNoExenta', FieldByName('SUJETA_NO_EXENTA_TIPO').AsString);

                                   NodoPadre := DameNodo(NoExenta, [Prefixsii + 'DesgloseIVA']);
                                   if (not Assigned(NodoPadre)) then
                                      NodoPadre := CreaNodo(NoExenta, Prefixsii, 'DesgloseIVA');

                                   NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'DetalleIVA');
                                   CreaElemento(NodoPadre, Prefixsii, 'TipoImpositivo', FormatAmount(FieldByName('SUJETA_NO_EXENTA_TIPOIMP').AsFloat, 2));
                                   CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('SUJETA_NO_EXENTA_BASEIMP').AsFloat, 2));
                                   CreaElemento(NodoPadre, Prefixsii, 'CuotaRepercutida', FormatAmount(FieldByName('SUJETA_NO_EXENTA_CUOTAREP').AsFloat, 2));
                                end;

                                Next;
                             end;
                          end
                          else
                          begin
                             NoSujeta := CreaNodo(PrestacionServicios, Prefixsii, 'NoSujeta');
                             // Importe en euros si la sujeción es por el art. 7,14,  otros
                             CreaElemento(NoSujeta, Prefixsii, 'ImportePorArticulos7_14_Otros', FormatAmount(FieldByName('NO_SUJETA_IMPORTE_ART_7_14').AsFloat, 2));
                             // Importe en euros si la sujeción es por operaciones no sujetas en el TAI por reglas de localización
                             CreaElemento(NoSujeta, Prefixsii, 'ImporteTAIReglasLocalizacion', FormatAmount(FieldByName('NO_SUJETA_IMPORTE_TAI').AsFloat, 2));
                          end;
                       end
                       else
                       begin
                          Entrega := CreaNodo(DesgloseTipoOperacion, Prefixsii, 'Entrega');

                          if ((FieldByName('SUJETA_EXENTA_CAUSA').AsString <> '') or
                             (FieldByName('SUJETA_NO_EXENTA_TIPO').AsString <> '')) then
                          begin
                             Sujeta := CreaNodo(Entrega, Prefixsii, 'Sujeta');

                             Exenta := nil;
                             NoExenta := nil;

                             while not EOF do
                             begin
                                if (FieldByName('SUJETA_EXENTA_CAUSA').AsString <> '') then
                                begin
                                   NodoPadre := CreaNodo(Sujeta, Prefixsii, 'Exenta');

                                   // Version 1.1 - puede haber mas de una clase de excenta
                                   NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'DetalleExenta');

                                   // Lista L9 - Causa de exención de operaciones sujetas y exentas
                                   // E1 Exenta por el artículo 20
                                   // E2 Exenta por el artículo 21
                                   // E3 Exenta por el artículo 22
                                   // E4 Exenta por el artículo 24
                                   // E5 Exenta por el artículo 25
                                   // E6 Exenta por Otros
                                   CreaElemento(NodoPadre, Prefixsii, 'CausaExencion', FieldByName('SUJETA_EXENTA_CAUSA').AsString);
                                   CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('SUJETA_EXENTA_BASEIMPONIBLE').AsFloat, 2));
                                end
                                else
                                begin
                                   if (not Assigned(NoExenta)) then
                                      NoExenta := CreaNodo(Sujeta, Prefixsii, 'NoExenta');
                                   // Lista L7 - Calificación del tipo de operación Sujeta/ No Exenta
                                   // S1 Sujeta – No Exenta
                                   // S2 Sujeta – No Exenta - Inv. Suj. Pasiv

                                   if (not Assigned(DameNodo(NoExenta, [Prefixsii + 'TipoNoExenta']))) then
                                      CreaElemento(NoExenta, Prefixsii, 'TipoNoExenta', FieldByName('SUJETA_NO_EXENTA_TIPO').AsString);

                                   NodoPadre := DameNodo(NoExenta, [Prefixsii + 'DesgloseIVA']);
                                   if (not Assigned(NodoPadre)) then
                                      NodoPadre := CreaNodo(NoExenta, Prefixsii, 'DesgloseIVA');

                                   NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'DetalleIVA');
                                   CreaElemento(NodoPadre, Prefixsii, 'TipoImpositivo', FormatAmount(FieldByName('SUJETA_NO_EXENTA_TIPOIMP').AsFloat, 2));
                                   CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('SUJETA_NO_EXENTA_BASEIMP').AsFloat, 2));
                                   CreaElemento(NodoPadre, Prefixsii, 'CuotaRepercutida', FormatAmount(FieldByName('SUJETA_NO_EXENTA_CUOTAREP').AsFloat, 2));
                                   if (FieldByName('SUJETA_NO_EXENTA_TIPOREC').AsFloat <> 0) then
                                   begin
                                      CreaElemento(NodoPadre, Prefixsii, 'TipoRecargoEquivalencia', FormatAmount(FieldByName('SUJETA_NO_EXENTA_TIPOREC').AsFloat, 2));
                                      CreaElemento(NodoPadre, Prefixsii, 'CuotaRecargoEquivalencia', FormatAmount(FieldByName('SUJETA_NO_EXENTA_CUOTAREC').AsFloat, 2));
                                   end;
                                end;

                                Next;
                             end;
                          end
                          else
                          begin
                             NoSujeta := CreaNodo(Entrega, Prefixsii, 'NoSujeta');
                             // Importe en euros si la sujeción es por el art. 7,14,  otros
                             CreaElemento(NoSujeta, Prefixsii, 'ImportePorArticulos7_14_Otros', FormatAmount(FieldByName('NO_SUJETA_IMPORTE_ART_7_14').AsFloat, 2));
                             // Importe en euros si la sujeción es por operaciones no sujetas en el TAI por reglas de localización
                             CreaElemento(NoSujeta, Prefixsii, 'ImporteTAIReglasLocalizacion', FormatAmount(FieldByName('NO_SUJETA_IMPORTE_TAI').AsFloat, 2));
                          end;
                       end;
                    end;
                 end;

                 Next;
              end;
           end;
        end;

        // Doy formato al fichero y lo grabo a disco
        XML.Text := FormatXMLData(XML.Text);

        // Guardo presentacion
        GuardaXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'PRE', XML.Text);

        {
        Active := True;
        Encoding := 'utf-8';
        }
        Active := False;
        // Borro los datos
        XML.Text := '';
     end;
  finally
     Documento.Free;
  end;

  with xSLRFacEmi do
  begin
     Close;
     UniDirectional := False;
     Open;
  end;

  with xRLRFacEmi do
  begin
     Close;
     UniDirectional := False;
     Open;
  end;

  with xDesgloseFacEmi do
  begin
     Close;
     UniDirectional := False;
     Open;
  end;

  Refrescar(xPresentacion, 'ID_SII_PRESENTACION', xPresentacionID_SII_PRESENTACION.AsInteger);
end;

procedure TDMSII.SII_LibroFacturasRecibidas(Entrada: integer);
var
  Documento : TXMLDocument;
  NodoRoot : IXMLNode;
  NodoPadre : IXMLNode;
  SuministroLRFacturasRecibidas, RegistroLRFacturasRecibidas, IDFactura, FacturaRecibida, DesgloseFactura, Desglose : IXMLNode;
  Nodo : IXMLNode;
begin
  // Datos a Exportar
  {
  with xSLRFacRec do
  begin
     Close;
     UniDirectional := True;
     Open;
  end;
  }

  with xRLRFacRec do
  begin
     Close;
     UniDirectional := True;
     Open;
  end;

  with xDesgloseFacRec do
  begin
     Close;
     UniDirectional := True;
     Open;
  end;

  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        // Borro los datos que pudiera haber
        XML.Text := '';
        // Se activa para poder utilizar el componente
        Active := True;
        // Codigifacion UTF-8
        Encoding := 'utf-8';
        // Standalone="yes"
        // StandAlone := 'yes';
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        NodoRoot := CreaSoapEnv(Documento);
        NodoPadre := CreaNodo(NodoRoot, Prefixsoapenv, 'Header');
        NodoPadre := CreaNodo(NodoRoot, Prefixsoapenv, 'Body');

        SuministroLRFacturasRecibidas := CreaNodo(NodoPadre, PrefixsiiLR, 'SuministroLRFacturasRecibidas');

        NodoPadre := CreaNodo(SuministroLRFacturasRecibidas, Prefixsii, 'Cabecera');
        CreaElemento(NodoPadre, Prefixsii, 'IDVersionSii', xSLRFacRecIDVERSIONSII.AsString);
        NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'Titular');
        CreaElemento(NodoPadre, Prefixsii, 'NombreRazon', QuitarAcentosTexto(xSLRFacRecTITULAR_NOMBRE_RAZON.AsString));
        CreaElemento(NodoPadre, Prefixsii, 'NIF', Copy(xSLRFacRecNIF.AsString, 1, 9));

        // Solo si es menor de edad (NIF empieza por 'K')
        if (xSLRFacRecNIF_REPRESENTANTE.AsString <> '') then
        begin
           Nodo := NodoPadre.AddChild(Prefixsii + 'NIFRepresentante', DOMString);
           Nodo.Text := Copy(xSLRFacRecNIF_REPRESENTANTE.AsString, 1, 9);
        end;

        // Vuelvo a la cabecera
        NodoPadre := DameNodo(SuministroLRFacturasRecibidas, [Prefixsii + 'Cabecera']);
        if (Assigned(NodoPadre)) then
        begin
           // A0 Alta, A1 Modificacion, A4 Modificacion Regimen Viajeros
           CreaElemento(NodoPadre, Prefixsii, 'TipoComunicacion', xSLRFacRecTIPOCOMUNICACION.AsString);
        end;

        // -------------------------------------------------------
        // Las facturas tienen que estar agrupadas por periodo ???
        // -------------------------------------------------------

        // Se recorren los registros de IVA
        with xRLRFacRec do
        begin
           while not EOF do
           begin
              RegistroLRFacturasRecibidas := CreaNodo(SuministroLRFacturasRecibidas, PrefixsiiLR, 'RegistroLRFacturasRecibidas');

              // PeriodoLiquidacion
              NodoPadre := CreaNodo(RegistroLRFacturasRecibidas, Prefixsii, 'PeriodoLiquidacion');
              CreaElemento(NodoPadre, Prefixsii, 'Ejercicio', FieldByName('PERIODOIMPOSITIVO_EJERCICIO').AsString);
              CreaElemento(NodoPadre, Prefixsii, 'Periodo', FieldByName('PERIODOIMPOSITIVO_PERIODO').AsString); {'01..'12', 'A0'}

              // IDFactura
              IDFactura := CreaNodo(RegistroLRFacturasRecibidas, PrefixsiiLR, 'IDFactura');
              NodoPadre := CreaNodo(IDFactura, Prefixsii, 'IDEmisorFactura');

              // Ver el caso de NIE. Creo que todos empiezan por X
              if (FieldByName('FACREC_CONTRAPARTE_IDTYPE').AsString = '') then
              begin
                 // Identificador del NIF contraparte de la operación (cliente) de facturas expedida
                 CreaElemento(NodoPadre, Prefixsii, 'NIF', FieldByName('IDFAC_EMISOR_NIF').AsString);
              end
              else
              begin
                 NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDOtro');
                 CreaElemento(NodoPadre, Prefixsii, 'CodigoPais', FieldByName('IDFAC_EMISOR_OTRO_CODPAIS').AsString);
                 // Clave para establecer el tipo de identificación en el pais de residencia
                 // Lista L4 - Tipos de Identificación en el país de residencia
                 // 02 NIF-IVA
                 // 03 PASAPORTE
                 // 04 DOCUMENTO OFICIAL DE IDENTIFICACIÓN EXPEDIDO POR EL PAIS O TERRITORIO DE RESIDENCIA
                 // 05 CERTIFICADO DE RESIDENCIA
                 // 06 OTRO DOCUMENTO PROBATORIO
                 // 04 No censado
                 CreaElemento(NodoPadre, Prefixsii, 'IDType', FieldByName('IDFAC_EMISOR_OTRO_IDTYPE').AsString);
                 CreaElemento(NodoPadre, Prefixsii, 'ID', FieldByName('IDFAC_EMISOR_OTRO_ID').AsString);
              end;

              CreaElemento(IDFactura, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('IDFAC_EMISOR_NUMSERIEFAC').AsString);
              CreaElemento(IDFactura, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('IDFAC_EMISOR_FECHA_EXPEDICION').AsDateTime));

              // FacturaRecibida
              FacturaRecibida := CreaNodo(RegistroLRFacturasRecibidas, PrefixsiiLR, 'FacturaRecibida');
              // Especificación del tipo de factura a dar de alta: factura normal, factura rectificativa, tickets, factura emitida en sustitución de facturas.
              // Lista L2_REC - Tipo de Factura Recibidas :
              // F1 Factura (art. 6, 7.2 y 7.3 del RD 1619/2012)
              // F2 Factura Simplificada y y Facturas sin identificación del destinatario art. 6.1.d) RD 1619/2012
              // F3 Factura emitida en sustitución de facturas simplificadas facturadas y declaradas
              // F4 Asiento resumen de facturas
              // F5 Importaciones (DUA)
              // F6 Justificantes contables
              // R1 Factura Rectificativa (Error fundado en derecho y Art. 80 Uno Dos y Seis LIVA)
              // R2 Factura Rectificativa (Art. 80.3)
              // R3 Factura Rectificativa (Art. 80.4)
              // R4 Factura Rectificativa (Resto)
              // R5 Factura Rectificativa en facturas simplificadas
              // LC Aduanas - Liquidación complementaria
              CreaElemento(FacturaRecibida, Prefixsii, 'TipoFactura', FieldByName('FACREC_TIPOFACTURA').AsString);

              if (FieldByName('FACREC_TIPORECTIFICATIVA').AsString <> '' {Es_Rectificativa - R1, R2, R3, R4, R5}) then
              begin
                 // Campo que identifica si el tipo de factura rectificativa es por sustitución o por diferencia
                 // Lista L5 - Tipo de Factura Rectificativa
                 // S Por sustitución
                 // I Por diferencias
                 CreaElemento(FacturaRecibida, Prefixsii, 'TipoRectificativa', FieldByName('FACREC_TIPORECTIFICATIVA').AsString);

                 if (FieldByName('FACREC_TIPOFACTURA').AsString = 'R5' {Es_Rectificativa R5???}) then
                 begin
                    // FacturasAgrupadas
                    NodoPadre := CreaNodo(FacturaRecibida, Prefixsii, 'FacturasAgrupadas');
                    NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDFacturaAgrupada');
                    // Nº Serie+Nº Factura que identifica a la factura emitida
                    CreaElemento(NodoPadre, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('FACREC_FAGR_NUMSERIEFACEMISOR').AsString);
                    // Fecha de expedición de la factura
                    CreaElemento(NodoPadre, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('FACREC_FAGR_FECHAEXPEDICION').AsDateTime));
                 end;

                 if (FieldByName('FACREC_TIPOFACTURA').AsString <> 'R5' {Es_Rectificativa}) then
                 begin
                    // FacturasRectificadas
                    NodoPadre := CreaNodo(FacturaRecibida, Prefixsii, 'FacturasRectificadas');
                    NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDFacturaRectificada');
                    // Nº Serie+Nº Factura que identifica a la factura emitida
                    CreaElemento(NodoPadre, Prefixsii, 'NumSerieFacturaEmisor', FieldByName('FACREC_FRECT_NUMSERIEFACEMISOR').AsString);
                    // Fecha de expedición de la factura
                    CreaElemento(NodoPadre, Prefixsii, 'FechaExpedicionFacturaEmisor', FormatDateTime('dd-mm-yyyy', FieldByName('FACREC_FRECT_FECHAEXPEDICION').AsDateTime));
                 end;

                 if (True {Es_Rectificativa - Opcional???}) then
                 begin
                    NodoPadre := CreaNodo(FacturaRecibida, Prefixsii, 'ImporteRectificacion');
                    CreaElemento(NodoPadre, Prefixsii, 'BaseRectificada', FormatAmount(FieldByName('FACREC_IMPRECT_BASERECT').AsFloat, 2));
                    CreaElemento(NodoPadre, Prefixsii, 'CuotaRectificada', FormatAmount(FieldByName('FACREC_IMPRECT_CUOTARECT').AsFloat, 2));
                    CreaElemento(NodoPadre, Prefixsii, 'CuotaRecargoRectificado', FormatAmount(FieldByName('FACREC_IMPRECT_CUOTARECRECT').AsFloat, 2));
                 end;
              end;

              // Fecha Operacion: Fecha en la que se ha realizado la operacion siempre que sea diferente a la fecha de expedicion.
              // ??? De donde sacamos esta fecha? Albaran?
              // CreaElemento(FacturaExpedida, Prefixsii, 'FechaOperacion', FormatDateTime('dd-mm-yyyy', FieldByName('FACREC_FECHAOPERACION').AsDAteTime));

              // ??? En que casos se utiliza ???
              // Clave que identificará el tipo de operación o el régimen especial con transcendencia tributaria
              // L3.1 - Clave de régimen especial o trascendencia en facturas expedidas
              // 01 Operación de régimen común
              // 02 Exportación
              // 03 Operaciones a las que se aplique el régimen especial de bienes usados, objetos de arte, antigüedades y objetos de colección (135-139 LIVA)
              // 04 Régimen especial oro de inversión
              // 05 Régimen especial agencias de viajes 06 Régimen especial grupo de entidades en IVA (Nivel Avanzado)
              // 07 Régimen especial criterio de caja
              // 08 Operaciones sujetas al IPSI / IGIC
              // 09 Facturación de las prestaciones de servicios de agencias de viaje que actúan como mediadoras en nombre y por cuenta ajena (D.A.4ª RD1619/2012)
              // 10 Cobros por cuenta de terceros de honorarios profesionales o de derechos derivados de la propiedad industrial, de autor u otros por cuenta de sus socios, asociados o colegiados efectuados por sociedades, asociaciones, colegios profesionales u otras entidades que realicen estas funciones de cobro
              // 11 Operaciones de arrendamiento de local de negocio sujetas a retención
              // 12 Operaciones de arrendamiento de local de negocio no  sujetos a retención
              // 13 Operaciones de arrendamiento de local de negocio sujetas y no sujetas a retención
              // 14 Factura con IVA pendiente de devengo (certificaciones de obra cuyo destinatario sea una Administración Pública)
              // 15 Factura con IVA pendiente de devengo - operaciones de tracto sucesivo
              // 16 Primer semestre 2017
              CreaElemento(FacturaRecibida, Prefixsii, 'ClaveRegimenEspecialOTrascendencia', FieldByName('FACREC_CLAVE_REG_ESP').AsString);
              if (FieldByName('FACREC_CLAVE_REG_ESP1').AsString <> '') then
                 CreaElemento(FacturaRecibida, Prefixsii, 'ClaveRegimenEspecialOTrascendencia1', FieldByName('FACREC_CLAVE_REG_ESP1').AsString);
              if (FieldByName('FACREC_CLAVE_REG_ESP2').AsString <> '') then
                 CreaElemento(FacturaRecibida, Prefixsii, 'ClaveRegimenEspecialOTrascendencia2', FieldByName('FACREC_CLAVE_REG_ESP2').AsString);

              if (FieldByName('FACREC_NUMREGACUERDOFAC').AsString > '') then
                 CreaElemento(FacturaRecibida, Prefixsii, 'NumRegistroAcuerdoFacturacion', FieldByName('FACREC_NUMREGACUERDOFAC').AsString);

              if (FieldByName('FACREC_TIPOFACTURA').AsString <> 'F4') then
              begin
                 // Importe total de la factura
                 CreaElemento(FacturaRecibida, Prefixsii, 'ImporteTotal', FormatAmount(FieldByName('FACREC_IMPORTE_TOTAL').AsFloat, 2));
              end;

              if (FieldByName('FACREC_CLAVE_REG_ESP').AsString = '07') then
              begin
                 // ??? En que casos se utiliza
                 // Para grupos de IVA
                 CreaElemento(FacturaRecibida, Prefixsii, 'BaseImponibleACoste', FormatAmount(FieldByName('FACREC_BASEIMPONIBLEACOSTE').AsFloat, 2));
              end;

              // ??? Que se supone que debemos rellenar aqui?
              // Descripción del objeto de la factura
              CreaElemento(FacturaRecibida, Prefixsii, 'DescripcionOperacion', FieldByName('FACREC_DESCRIPCION').AsString);

              if (FieldByName('FACREC_CLAVE_REG_ESP').AsString = '12') then
              begin
                 NodoPadre := CreaNodo(FacturaRecibida, Prefixsii, 'DatosInmueble');
                 NodoPadre := CreaNodo(FacturaRecibida, Prefixsii, 'DetalleInmueble');
                 // Lista L6 - Situación del Inmueble
                 // 1 Inmueble con referencia catastral situado en cualquier punto del territorio español, excepto País Vasco y Navarra
                 // 2 Inmueble situado en la Comunidad Autónoma del País Vasco o en la Comunidad Foral de Navarra
                 // 3 Inmueble en cualquiera de las situaciones anteriores  pero sin referencia catastral
                 // 4 Inmueble situado en el extranjero
                 CreaElemento(NodoPadre, Prefixsii, 'SituacionInmueble', FieldByName('FACREC_INMUEBLE_SITUACIONINM').AsString);
                 CreaElemento(NodoPadre, Prefixsii, 'ReferenciaCatastral', FieldByName('FACREC_INMUEBLE_REFCATASTRAL').AsString);
              end;

              // ??? En que casos se debe rellenar esto?
              // CreaElemento(FacturaExpedida, Prefixsii, 'ImportaTransmisionSujetoAIVA', FormatAmount(FieldByName('FACEXP_IMPORTETRANSMSUJETAIVA').AsFloat, 2));

              {No esta en Facturas Recibidas
              if (FieldByName('FACREC_EMITIDA_POR_TERCEROS').AsString = 'S') then
              begin
                 // Identificador que especifica si la factura ha sido emitida por un tercero.
                 // Si no se informa este campo se entenderá que tiene valor  “N”.
                 // Lista L10 - Recibidas por Terceros
                 // S Si
                 // N No
                 CreaElemento(FacturaRecibida, Prefixsii, 'EmitidaPorTercerosODestinatario', FieldByName('FACREC_EMITIDA_POR_TERCEROS').AsString);
              end;
              }
              {No esta en Facturas Recibidas
              if (FieldByName('FACREC_VARIOSDESTINATARIOS').AsString = 'S') then
              begin
                 // Identificador que especifica si la factura tiene varios destinatarios.
                 // Si no se informa este campo se entenderá que tiene valor  “N”.
                 // Lista L20 - Varios destinatarios
                 // S Si
                 // N No
                 CreaElemento(FacturaRecibida, Prefixsii, 'VariosDestinatarios', FieldByName('FACREC_VARIOSDESTINATARIOS').AsString);
              end;
              }

              {No esta en Facturas Recibidas
              // ??? Que es esto?
              if (FieldByName('FACREC_CUPON').AsString = 'S') then
              begin
                 // Identificador que especifica si la factura tipo R5 o F4 tiene minoración de la base imponible por la concesión de cupones,
                 // bonificaciones o descuentos cuando solo se expide el original de la factura.
                 // Si no se informa este campo se entenderá que tiene valor  “N”.
                 // Lista L22 - Varios destinatarios
                 // S Si
                 // N No
                 CreaElemento(FacturaRecibida, Prefixsii, 'Cupon', FieldByName('FACREC_CUPON').AsString);
              end;
              }

              // Desglose
              // Recorro el detalle y se agrupa segun sea inversion de sujeto pasivo o no.
              DesgloseFactura := CreaNodo(FacturaRecibida, Prefixsii, 'DesgloseFactura');
              with xDesgloseFacRec do
              begin
                 while not EOF do
                 begin
                    // Puede ser Inversion del sujeto pasivo o Desglose de IVA.
                    if (FieldByName('ISP_BASEIMPONIBLE').AsFloat <> 0) then
                    begin
                       Desglose := DameNodo(DesgloseFactura, [Prefixsii + 'InversionSujetoPasivo']);
                       if not Assigned(Desglose) then
                          Desglose := CreaNodo(DesgloseFactura, Prefixsii, 'InversionSujetoPasivo');

                       NodoPadre := CreaNodo(Desglose, Prefixsii, 'DetalleIVA');
                       CreaElemento(NodoPadre, Prefixsii, 'TipoImpositivo', FormatAmount(FieldByName('ISP_TIPOIMPOSITIVO').AsFloat, 2));
                       CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('ISP_BASEIMPONIBLE').AsFloat, 2));
                       CreaElemento(NodoPadre, Prefixsii, 'CuotaSoportada', FormatAmount(FieldByName('ISP_CUOTASOPORTADA').AsFloat, 2));
                       if (FieldByName('ISP_TIPORECARGOEQUIVALENCIA').AsFloat <> 0) then
                       begin
                          CreaElemento(NodoPadre, Prefixsii, 'TipoRecargoEquivalencia', FormatAmount(FieldByName('ISP_TIPORECARGOEQUIVALENCIA').AsFloat, 2));
                          CreaElemento(NodoPadre, Prefixsii, 'CuotaRecargoEquivalencia', FormatAmount(FieldByName('ISP_CUOTARECARGOEQUIVALENCIA').AsFloat, 2));
                       end;
                    end
                    else
                    begin
                       Desglose := DameNodo(DesgloseFactura, [Prefixsii + 'DesgloseIVA']);
                       if not Assigned(Desglose) then
                          Desglose := CreaNodo(DesgloseFactura, Prefixsii, 'DesgloseIVA');

                       NodoPadre := CreaNodo(Desglose, Prefixsii, 'DetalleIVA');
                       CreaElemento(NodoPadre, Prefixsii, 'TipoImpositivo', FormatAmount(FieldByName('DI_TIPOIMPOSITIVO').AsFloat, 2));
                       CreaElemento(NodoPadre, Prefixsii, 'BaseImponible', FormatAmount(FieldByName('DI_BASEIMPONIBLE').AsFloat, 2));
                       CreaElemento(NodoPadre, Prefixsii, 'CuotaSoportada', FormatAmount(FieldByName('DI_CUOTASOPORTADA').AsFloat, 2));
                       if (FieldByName('DI_TIPORECARGOEQUIVALENCIA').AsFloat <> 0) then
                       begin
                          CreaElemento(NodoPadre, Prefixsii, 'TipoRecargoEquivalencia', FormatAmount(FieldByName('DI_TIPORECARGOEQUIVALENCIA').AsFloat, 2));
                          CreaElemento(NodoPadre, Prefixsii, 'CuotaRecargoEquivalencia', FormatAmount(FieldByName('DI_CUOTARECARGOEQUIVALENCIA').AsFloat, 2));
                       end;
                       if (FieldByName('DI_PORCENTCOMPSENSACIONREAGYP').AsFloat <> 0) then
                       begin
                          CreaElemento(NodoPadre, Prefixsii, 'PorcentCompsensacionREAGYP', FormatAmount(FieldByName('DI_PORCENTCOMPSENSACIONREAGYP').AsFloat, 2));
                          CreaElemento(NodoPadre, Prefixsii, 'ImporteCompsensacionREAGYP', FormatAmount(FieldByName('DI_IMPORTECOMPSENSACIONREAGYP').AsFloat, 2));
                       end;
                    end;

                    Next;
                 end;
              end;

              NodoPadre := CreaNodo(FacturaRecibida, Prefixsii, 'Contraparte');
              // Nombre-razón social de la contraparte de la operación (proveedor) de facturas recibidas
              CreaElemento(NodoPadre, Prefixsii, 'NombreRazon', QuitarAcentosTexto(FieldByName('FACREC_CONTRAP_NOMBRE_RAZON').AsString));
              if (FieldByName('FACREC_CONTRAP_NIF_REPRES').AsString > '') then
              begin
                 // NIF del representante de la contraparte de la operación
                 CreaElemento(NodoPadre, Prefixsii, 'NIFRepresentante', FieldByName('FACREC_CONTRAP_NIF_REPRES').AsString);
              end;

              // Ver el caso de NIE. Creo que todos empiezan por X
              if (FieldByName('FACREC_CONTRAPARTE_IDTYPE').AsString = '') then
              begin
                 // Identificador del NIF contraparte de la operación (cliente) de facturas expedida
                 CreaElemento(NodoPadre, Prefixsii, 'NIF', FieldByName('FACREC_CONTRAP_NIF').AsString);
              end
              else
              begin
                 NodoPadre := CreaNodo(NodoPadre, Prefixsii, 'IDOtro');
                 CreaElemento(NodoPadre, Prefixsii, 'CodigoPais', FieldByName('FACREC_CONTRAPARTE_CODPAIS').AsString);
                 // Clave para establecer el tipo de identificación en el pais de residencia
                 // Lista L4 - Tipos de Identificación en el país de residencia
                 // 02 NIF-IVA
                 // 03 PASAPORTE
                 // 04 DOCUMENTO OFICIAL DE IDENTIFICACIÓN EXPEDIDO POR EL PAIS O TERRITORIO DE RESIDENCIA
                 // 05 CERTIFICADO DE RESIDENCIA
                 // 06 OTRO DOCUMENTO PROBATORIO
                 CreaElemento(NodoPadre, Prefixsii, 'IDType', FieldByName('FACREC_CONTRAPARTE_IDTYPE').AsString);
                 CreaElemento(NodoPadre, Prefixsii, 'ID', FieldByName('FACREC_CONTRAPARTE_ID').AsString);
              end;

              CreaElemento(FacturaRecibida, Prefixsii, 'FechaRegContable', FormatDateTime('dd-mm-yyyy', FieldByName('FACREC_FECHAREGCONTABLE').AsDateTime));
              CreaElemento(FacturaRecibida, Prefixsii, 'CuotaDeducible', FormatAmount(FieldByName('FACREC_CUOTA_DEDUCIBLE').AsFloat, 2));

              Next;
           end;
        end;

        // Doy formato al fichero y lo grabo a disco
        XML.Text := FormatXMLData(XML.Text);

        // Guardo presentacion
        GuardaXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'PRE', XML.Text);

        {
        Active := True;
        Encoding := 'utf-8';
        }
        Active := False;
        // Borro los datos
        XML.Text := '';
     end;
  finally
     Documento.Free;
  end;

  with xSLRFacRec do
  begin
     Close;
     UniDirectional := False;
     Open;
  end;

  with xRLRFacRec do
  begin
     Close;
     UniDirectional := False;
     Open;
  end;

  with xDesgloseFacRec do
  begin
     Close;
     UniDirectional := False;
     Open;
  end;

  Refrescar(xPresentacion, 'ID_SII_PRESENTACION', xPresentacionID_SII_PRESENTACION.AsInteger);
end;

procedure TDMSII.xPresentacionAfterOpen(DataSet: TDataSet);
begin
  DMMain.Log('xPresentacionAfterOpen');
  xSLRFacEmi.Open;
  xSLRFacRec.Open;
end;

procedure TDMSII.xPresentacionBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('xPresentacionBeforeClose');
  xSLRFacEmi.Close;
  xSLRFacRec.Close;
end;

procedure TDMSII.xSLRFacEmiAfterOpen(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacEmiAfterOpen');
  xRLRFacEmi.Open;
end;

procedure TDMSII.xSLRFacEmiBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacEmiBeforeClose');
  xRLRFacEmi.Close;
end;

procedure TDMSII.xSLRFacRecAfterOpen(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacRecAfterOpen');
  xRLRFacRec.Open;
end;

procedure TDMSII.xSLRFacRecBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacRecBeforeClose');
  xRLRFacRec.Close;
end;

procedure TDMSII.xRLRFacEmiAfterOpen(DataSet: TDataSet);
begin
  DMMain.Log('xRLRFacEmiAfterOpen');
  xDesgloseFacEmi.Open;
end;

procedure TDMSII.xRLRFacEmiBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('xRLRFacEmiBeforeClose');
  xDesgloseFacEmi.Close;
end;

procedure TDMSII.xRLRFacRecAfterOpen(DataSet: TDataSet);
begin
  DMMain.Log('xRLRFacRecAfterOpen');
  xDesgloseFacRec.Open;
end;

procedure TDMSII.xRLRFacRecBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('xRLRFacRecBeforeClose');
  xDesgloseFacRec.Close;
end;

procedure TDMSII.xPresentacionNewRecord(DataSet: TDataSet);
begin
  DMMain.Log('xPresentacionNewRecord');
  xPresentacionEMPRESA.AsInteger := REntorno.Empresa;
  xPresentacionCANAL.AsInteger := REntorno.Canal;
  xPresentacionTIPO_PRESENTACION.AsString := 'EMI';
end;

procedure TDMSII.xPresentacionBeforePost(DataSet: TDataSet);
begin
  DMMain.Log('xPresentacionBeforePost');
  DMMain.Contador_Gen(xPresentacion, 'ID_SII_PRESENTACION', 'ID_SII_PRESENTACION');
end;

procedure TDMSII.xSLRFacEmiNewRecord(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacEmiNewRecord');
  if (xPresentacion.State = dsInsert) then
     xPresentacion.Post;

  xSLRFacEmiID_SII_PRESENTACION.AsInteger := xPresentacionID_SII_PRESENTACION.AsInteger;
  xSLRFacEmiIDVERSIONSII.AsString := IDVersionSii;
  xSLRFacEmiTITULAR_NOMBRE_RAZON.AsString := Copy(REntorno.NombreEmpresa, 1, 120);
  xSLRFacEmiNIF_REPRESENTANTE.AsString := '';
  xSLRFacEmiNIF.AsString := REntorno.CifEmpresa;
  xSLRFacEmiTIPOCOMUNICACION.AsString := 'A0'; // A0 Alta, A1 Modificacion, A4 Modificacion Regimen Viajeros
  xSLRFacEmiFECHA_CREACION.AsDateTime := Now;
  xSLRFacEmiFECHA_PRESENTACION.AsDateTime := Now;
  xSLRFacEmiCSV.AsString := '';
end;

procedure TDMSII.xSLRFacEmiBeforePost(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacEmiBeforePost');
  DMMain.Contador_Gen(xSLRFacEmi, 'ID_SII_SUMLRFACTURASEMITIDAS', 'ID_SII_SUMLRFACTURASEMITIDAS');
end;

procedure TDMSII.xSLRFacRecBeforePost(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacRecBeforePost');
  DMMain.Contador_Gen(xSLRFacRec, 'ID_SII_SUMLRFACTURASRECIBIDAS', 'ID_SII_SUMLRFACTURASRECIBIDAS');
end;

procedure TDMSII.xSLRFacRecNewRecord(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacRecNewRecord');
  if (xPresentacion.State = dsInsert) then
     xPresentacion.Post;

  xSLRFacRecID_SII_PRESENTACION.AsInteger := xPresentacionID_SII_PRESENTACION.AsInteger;
  xSLRFacRecIDVERSIONSII.AsString := IDVersionSii;
  xSLRFacRecTITULAR_NOMBRE_RAZON.AsString := Copy(REntorno.NombreEmpresa, 1, 120);
  xSLRFacRecNIF_REPRESENTANTE.AsString := '';
  xSLRFacRecNIF.AsString := REntorno.CifEmpresa;
  xSLRFacRecTIPOCOMUNICACION.AsString := 'A0'; // A0 Alta, A1 Modificacion, A4 Modificacion Regimen Viajeros
  xSLRFacRecFECHA_CREACION.AsDateTime := Now;
  xSLRFacRecFECHA_PRESENTACION.AsDateTime := Now;
  xSLRFacRecCSV.AsString := '';
end;

procedure TDMSII.EnviarPresentacion(Entrada: integer);
var
  Server : variant;
  Url, CertName, Fichero : string;
  Documento : TXMLDocument;
  Nodo, RespuestaLinea : IXMLNode;
  CSV, EstadoEnvio, s : WideString;
  NumSerieFacturaEmisor, EstadoRegistro, CodigoErrorRegistro, DescripcionErrorRegistro : WideString;
  IdRegLRFacturas, id : integer;
  VersionMSXML : string;
begin
  DMMain.LogIni('EnviarSII_LibroFacturasEmitidas');
  try
     // Certificado. Si viene en blanco, se toma el primero del ordenador.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CERTIFICADO FROM EMP_MODELOS_HACIENDA WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL';
           Params.ByName['EMPRESA'].AsInteger := xPresentacionEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := xPresentacionCANAL.AsInteger;
           ExecQuery;
           CertName := FieldByName['CERTIFICADO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     {
     DEFINE URLENDPOINT {"FE" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP",;
                         "FR" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fr/SiiFactFRV1SOAP",;
                         "CE" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactCOBV1SOAP",;
                         "PR" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fr/SiiFactPAGV1SOAP",;
                         "OI" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/oi/SiiFactOIV1SOAP",;
                         "BI" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/bi/SiiFactBIV1SOAP",;
                         "CM" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/pm/SiiFactCMV1SOAP",;
                         "OS" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/pm/SiiFactCMV1SOAP"
     }


     Url := DMMain.DameUrlEndPoint(DMSII.xPresentacionTIPO_PRESENTACION.AsString);
     DMMain.Log('UrlEndPoint: ' + Url);

     s := '';

     // Por defecto tomaria '6.0', pero puede ser tambien '3.0'
     VersionMSXML := LeeParametro('SIIMSXML01', '');
     DMMain.Log('CreateOleObject(''MSXML2.ServerXMLHTTP.' + VersionMSXML + ''')');
     Server := CreateOleObject('MSXML2.ServerXMLHTTP.' + VersionMSXML);
     // DMMain.Log('CreateOleObject(''MSXML2.XMLHTTP.' + VersionMSXML + ''')');
     // Server := CreateOleObject('MSXML2.XMLHTTP.' + VersionMSXML);

     try
        DMMain.Log('SetOption SXH_OPTION_SELECT_CLIENT_SSL_CERT + ' + CertName);
        // 0: SXH_OPTION_URL_CODEPAGE
        // 1: SXH_OPTION_ESCAPE_PERCENT_IN_URL
        // 2: SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS
        // 3: SXH_OPTION_SELECT_CLIENT_SSL_CERT
        // HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\My\Certificates\BCCC7608D2B2ADAC616CCCB6D78F956130CC3945

        Server.setOption(3, CertName);

        // Para verificad el nombre de certificado utilizado
        CertName := '';
        CertName := Server.getOption(3);
        DMMain.Log('getOption(CertName) = ' + CertName + '<');

        DMMain.Log('Server.Open(''POST'', Url, False)');
        Server.Open('POST', Url, False);

        DMMain.Log('Server.SetRequestHeader(''Content-Type'', ''text/xml'')');
        Server.SetRequestHeader('Content-Type', 'text/xml');

        // s := xPresentacionXML_PRESENTADO.AsString;
        s := DameXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'PRE');
        DMMain.Log('XML_PRESENTADO:');
        DMMain.Log(s);

        // Lo guardo como adjunto, para poder tenerlo si pasa algo.
        DMMain.Log('Guardo como adjunto');
        Fichero := DameTempPath + 'SII-ENV-' + xPresentacionID_SII_PRESENTACION.AsString + '-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.xml';

        DMMain.Log('Creo fichero: ' + Fichero);
        with TStringList.Create do
        begin
           try
              Text := s;
              SaveToFile(Fichero);
           finally
              Free;
           end;
        end;

        DMMain.LogIni('CreaAdjunto("SII", ' + xPresentacionID_SII_PRESENTACION.AsString + ', ' + Fichero + ', ...)');
        AbreData(TDMAdjunto, DMAdjunto);
        DMAdjunto.CreaAdjunto('SII', xPresentacionID_SII_PRESENTACION.AsInteger, Fichero, 'Envio Presentacion ' + xPresentacionID_SII_PRESENTACION.AsString + ' ' + FormatDateTime('yyyymmdd-hhnnss', Now));
        CierraData(DMAdjunto);
        DMMain.LogFin('Fin CreaAdjunto(...)');

        DMMain.Log('Server.Send');
        Server.Send(s);

        s := Server.ResponseText;
        DMMain.Log('Respuesta');
        DMMain.Log(s);

        // Formateo respuesta XML
        try
           Documento := TXMLDocument.Create(Self);
           try
              with Documento do
              begin
                 // Borro los datos que pudiera haber
                 XML.Text := '';
                 Active := True;
                 Encoding := 'utf-8';

                 // Cargo XML en el componente
                 XML.Text := Utf8Encode(s);

                 // Doy formato al fichero
                 XML.Text := FormatXMLData(XML.Text);
                 s := XML.Text;
                 Active := True;

                 // Guardo respuesta
                 GuardaXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'RES', s);

                 EstadoEnvio := '';
                 Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', Prefixenv + 'Fault']);
                 if (Assigned(Nodo)) then
                 begin
                    Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', Prefixenv + 'Fault', 'faultcode']);
                    if (Assigned(Nodo)) then
                       EstadoEnvio := EstadoEnvio + Nodo.Text;
                    Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', Prefixenv + 'Fault', 'faultstring']);
                    if (Assigned(Nodo)) then
                       EstadoEnvio := EstadoEnvio + ' ' + Nodo.Text;
                    ShowMessage(_('El formato es incorrecto y no ha podido enviarse.') + #13#10 + EstadoEnvio);
                 end
                 else
                 begin
                    // Busco CSV y mensajes de respuesta
                    if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                       Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasRecibidas', PrefixsiiR + 'CSV'])
                    else
                    if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                    begin
                       if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
                          Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRBajaFacturasEmitidas', PrefixsiiR + 'CSV'])
                       else
                          Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasEmitidas', PrefixsiiR + 'CSV']);
                    end;
                    if (Assigned(Nodo)) then
                       CSV := Nodo.Text;

                    // Busco EstadoEnvio y mensajes de respuesta
                    if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                       Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasRecibidas', PrefixsiiR + 'EstadoEnvio'])
                    else
                    if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                    begin
                       if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
                          Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRBajaFacturasEmitidas', PrefixsiiR + 'EstadoEnvio'])
                       else
                          Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasEmitidas', PrefixsiiR + 'EstadoEnvio']);
                    end;
                    if (Assigned(Nodo)) then
                       EstadoEnvio := Nodo.Text;

                    DMMain.Log('CSV: ' + CSV);
                    DMMain.Log('EstadoEnvio: ' + EstadoEnvio);

                    DMMain.Log('Lineas de Respuestas');
                    if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                       RespuestaLinea := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasRecibidas', PrefixsiiR + 'RespuestaLinea'])
                    else
                    if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                    begin
                       if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
                          RespuestaLinea := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRBajaFacturasEmitidas', PrefixsiiR + 'RespuestaLinea'])
                       else
                          RespuestaLinea := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasEmitidas', PrefixsiiR + 'RespuestaLinea']);
                    end;

                    while Assigned(RespuestaLinea) do
                    begin
                       NumSerieFacturaEmisor := '';
                       EstadoRegistro := '';
                       CodigoErrorRegistro := '';
                       DescripcionErrorRegistro := '';

                       Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'IDFactura', Prefixsii + 'NumSerieFacturaEmisor']);
                       if Assigned(Nodo) then
                          NumSerieFacturaEmisor := Nodo.Text;
                       Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'EstadoRegistro']);
                       if Assigned(Nodo) then
                          EstadoRegistro := Nodo.Text;
                       Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'CodigoErrorRegistro']);
                       if Assigned(Nodo) then
                          CodigoErrorRegistro := Nodo.Text;
                       Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'DescripcionErrorRegistro']);
                       if Assigned(Nodo) then
                          DescripcionErrorRegistro := Nodo.Text;

                       DMMain.Log('NumSerieFacturaEmisor: ' + NumSerieFacturaEmisor);
                       DMMain.Log('EstadoRegistro: ' + EstadoRegistro);
                       DMMain.Log('CodigoErrorRegistro: ' + CodigoErrorRegistro);
                       DMMain.Log('DescripcionErrorRegistro: ' + DescripcionErrorRegistro);

                       if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' UPDATE SII_REGLRFACTURASEMITIDAS ');
                                SQL.Add(' SET ');
                                SQL.Add(' ESTADO_REGISTRO = :ESTADO_REGISTRO, ');
                                SQL.Add(' CODIGO_ERROR = :CODIGO_ERROR, ');
                                SQL.Add(' DESCRIPCION_ERROR = :DESCRIPCION_ERROR ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS AND ');
                                SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                                Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                Params.ByName['ESTADO_REGISTRO'].AsString := Copy(EstadoRegistro, 1, 40);
                                Params.ByName['CODIGO_ERROR'].AsString := Copy(CodigoErrorRegistro, 1, 20);
                                Params.ByName['DESCRIPCION_ERROR'].AsString := Copy(DescripcionErrorRegistro, 1, 500);
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          // Si no es correcto, hago una copia, para que se solucione.
                          if (EstadoRegistro <> 'Correcto') then
                          begin
                             // Obtengo el ID que debo duplicar
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add(' SELECT ID_SII_REGLRFACTURASEMITIDAS FROM SII_REGLRFACTURASEMITIDAS ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS AND ');
                                   SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                   Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                                   Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                   ExecQuery;
                                   IdRegLRFacturas := FieldByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;

                             id := DMMain.ContadorGen('ID_SII_REGLRFACTURASEMITIDAS');

                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add(' INSERT INTO SII_REGLRFACTURASEMITIDAS ( ');
                                   SQL.Add('  ID_SII_REGLRFACTURASEMITIDAS, ID_SII_PRESENTACION, ID_SII_SUMLRFACTURASEMITIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
                                   SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, ');
                                   SQL.Add('  IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPORECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR, ');
                                   SQL.Add('  FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FACEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT, ');
                                   SQL.Add('  FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_FECHAOPERACION, FACEXP_CLAVE_REG_ESP, ');
                                   SQL.Add('  FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUERDOFAC, FACEXP_IMPORTE_TOTAL, ');
                                   SQL.Add('  FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL, ');
                                   SQL.Add('  FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FACEXP_VARIOSDESTINATARIOS, FACEXP_CUPON, ');
                                   SQL.Add('  FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS, ');
                                   SQL.Add('  FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE, TIPO_DESGLOSE_OPERACION, ESTADO_REGISTRO, ');
                                   SQL.Add('  CODIGO_ERROR, DESCRIPCION_ERROR, TIPOCOMUNICACION_DESTINO) ');
                                   SQL.Add(' SELECT ');
                                   SQL.Add('  :ID_SII_REGLRFACTURAS, 0, 0, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
                                   SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, ');
                                   SQL.Add('  IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPORECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR, ');
                                   SQL.Add('  FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FACEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT, ');
                                   SQL.Add('  FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_FECHAOPERACION, FACEXP_CLAVE_REG_ESP, ');
                                   SQL.Add('  FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUERDOFAC, FACEXP_IMPORTE_TOTAL, ');
                                   SQL.Add('  FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL, ');
                                   SQL.Add('  FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FACEXP_VARIOSDESTINATARIOS, FACEXP_CUPON, ');
                                   SQL.Add('  FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS, ');
                                   SQL.Add('  FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE, TIPO_DESGLOSE_OPERACION, ''PENDIENTE CORRECCION'', ');
                                   SQL.Add('  CODIGO_ERROR, DESCRIPCION_ERROR, :TIPOCOMUNICACION_DESTINO ');
                                   SQL.Add('  FROM SII_REGLRFACTURASEMITIDAS ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
                                   Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                   Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := IdRegLRFacturas;
                                   if (EstadoRegistro = 'AceptadoConErrores') then
                                      Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A1'
                                   else
                                      Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A0';
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
                                   SQL.Add(' INSERT INTO SII_DESGLOSEFACTURA_EMI ( ');
                                   SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS, ID_SII_PRESENTACION, ID_SII_DESGLOSEFACTURA_EMI, SUJETA_EXENTA_CAUSA, ');
                                   SQL.Add('  SUJETA_EXENTA_BASEIMPONIBLE, SUJETA_NO_EXENTA_TIPO, SUJETA_NO_EXENTA_TIPOIMP, SUJETA_NO_EXENTA_BASEIMP, ');
                                   SQL.Add('  SUJETA_NO_EXENTA_CUOTAREP, SUJETA_NO_EXENTA_TIPOREC, SUJETA_NO_EXENTA_CUOTAREC, NO_SUJETA_IMPORTE_ART_7_14, ');
                                   SQL.Add('  NO_SUJETA_IMPORTE_TAI) ');
                                   SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, SUJETA_EXENTA_CAUSA, ');
                                   SQL.Add('        SUJETA_EXENTA_BASEIMPONIBLE, SUJETA_NO_EXENTA_TIPO, SUJETA_NO_EXENTA_TIPOIMP, SUJETA_NO_EXENTA_BASEIMP, ');
                                   SQL.Add('        SUJETA_NO_EXENTA_CUOTAREP, SUJETA_NO_EXENTA_TIPOREC, SUJETA_NO_EXENTA_CUOTAREC, NO_SUJETA_IMPORTE_ART_7_14, ');
                                   SQL.Add('        NO_SUJETA_IMPORTE_TAI ');
                                   SQL.Add(' FROM SII_DESGLOSEFACTURA_EMI ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
                                   Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := IdRegLRFacturas;
                                   Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                          end;
                       end
                       else
                       begin
                          if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                          begin
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add(' UPDATE SII_REGLRFACTURASRECIBIDAS ');
                                   SQL.Add(' SET ');
                                   SQL.Add(' ESTADO_REGISTRO = :ESTADO_REGISTRO, ');
                                   SQL.Add(' CODIGO_ERROR = :CODIGO_ERROR, ');
                                   SQL.Add(' DESCRIPCION_ERROR = :DESCRIPCION_ERROR ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS AND ');
                                   SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                   Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                                   Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                   Params.ByName['ESTADO_REGISTRO'].AsString := Copy(EstadoRegistro, 1, 40);
                                   Params.ByName['CODIGO_ERROR'].AsString := Copy(CodigoErrorRegistro, 1, 20);
                                   Params.ByName['DESCRIPCION_ERROR'].AsString := Copy(DescripcionErrorRegistro, 1, 500);
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;

                             // Si no es correcto, hago una copia, para que se solucione.
                             if (EstadoRegistro <> 'Correcto') then
                             begin
                                // Obtengo el ID que debo duplicar
                                with THYFIBQuery.Create(nil) do
                                begin
                                   try
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Add(' SELECT ID_SII_REGLRFACTURASRECIBIDAS FROM SII_REGLRFACTURASRECIBIDAS ');
                                      SQL.Add(' WHERE ');
                                      SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS AND ');
                                      SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                      Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                                      Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                      ExecQuery;
                                      IdRegLRFacturas := FieldByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger;
                                      FreeHandle;
                                   finally
                                      Free;
                                   end;
                                end;

                                id := DMMain.ContadorGen('ID_SII_REGLRFACTURASRECIBIDAS');

                                with THYFIBQuery.Create(nil) do
                                begin
                                   try
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Add(' INSERT INTO SII_REGLRFACTURASRECIBIDAS ( ');
                                      SQL.Add('  ID_SII_REGLRFACTURASRECIBIDAS, ID_SII_PRESENTACION, ID_SII_SUMLRFACTURASRECIBIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
                                      SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_OTRO_CODPAIS, IDFAC_EMISOR_OTRO_IDTYPE, IDFAC_EMISOR_OTRO_ID, ');
                                      SQL.Add('  IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, IDFAC_EMISOR_FECHA_EXPEDICION, FACREC_TIPOFACTURA, ');
                                      SQL.Add('  FACREC_TIPORECTIFICATIVA, FACREC_FAGR_NUMSERIEFACEMISOR, FACREC_FAGR_FECHAEXPEDICION, FACREC_FRECT_NUMSERIEFACEMISOR, ');
                                      SQL.Add('  FACREC_FRECT_FECHAEXPEDICION, FACREC_IMPRECT_BASERECT, FACREC_IMPRECT_CUOTARECT, FACREC_IMPRECT_CUOTARECRECT, ');
                                      SQL.Add('  FACREC_FECHAOPERACION, FACREC_CLAVE_REG_ESP, FACREC_CLAVE_REG_ESP1, FACREC_CLAVE_REG_ESP2, FACREC_NUMREGACUERDOFAC, ');
                                      SQL.Add('  FACREC_IMPORTE_TOTAL, FACREC_BASEIMPONIBLEACOSTE, FACREC_DESCRIPCION, FACREC_ADUANAS_NUMERODUA, ');
                                      SQL.Add('  FACREC_ADUANAS_FECHAREGCONTDUA, FACREC_CONTRAP_NOMBRE_RAZON, FACREC_CONTRAP_NIF_REPRES, FACREC_CONTRAP_NIF, ');
                                      SQL.Add('  FACREC_CONTRAPARTE_CODPAIS, FACREC_CONTRAPARTE_IDTYPE, FACREC_CONTRAPARTE_ID, FACREC_FECHAREGCONTABLE, ');
                                      SQL.Add('  FACREC_CUOTA_DEDUCIBLE, ESTADO_REGISTRO, CODIGO_ERROR, DESCRIPCION_ERROR, TIPOCOMUNICACION_DESTINO) ');
                                      SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, ID_I, PERIODOIMPOSITIVO_EJERCICIO, PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, ');
                                      SQL.Add('        IDFAC_EMISOR_OTRO_CODPAIS, IDFAC_EMISOR_OTRO_IDTYPE, IDFAC_EMISOR_OTRO_ID, IDFAC_EMISOR_NUMSERIEFAC, ');
                                      SQL.Add('        IDFAC_EMISOR_NUMSERIEFACFIN, IDFAC_EMISOR_FECHA_EXPEDICION, FACREC_TIPOFACTURA, FACREC_TIPORECTIFICATIVA, ');
                                      SQL.Add('        FACREC_FAGR_NUMSERIEFACEMISOR, FACREC_FAGR_FECHAEXPEDICION, FACREC_FRECT_NUMSERIEFACEMISOR, ');
                                      SQL.Add('        FACREC_FRECT_FECHAEXPEDICION, FACREC_IMPRECT_BASERECT, FACREC_IMPRECT_CUOTARECT, FACREC_IMPRECT_CUOTARECRECT, ');
                                      SQL.Add('        FACREC_FECHAOPERACION, FACREC_CLAVE_REG_ESP, FACREC_CLAVE_REG_ESP1, FACREC_CLAVE_REG_ESP2, ');
                                      SQL.Add('        FACREC_NUMREGACUERDOFAC, FACREC_IMPORTE_TOTAL, FACREC_BASEIMPONIBLEACOSTE, FACREC_DESCRIPCION, ');
                                      SQL.Add('        FACREC_ADUANAS_NUMERODUA, FACREC_ADUANAS_FECHAREGCONTDUA, FACREC_CONTRAP_NOMBRE_RAZON, FACREC_CONTRAP_NIF_REPRES, ');
                                      SQL.Add('        FACREC_CONTRAP_NIF, FACREC_CONTRAPARTE_CODPAIS, FACREC_CONTRAPARTE_IDTYPE, FACREC_CONTRAPARTE_ID, ');
                                      SQL.Add('        FACREC_FECHAREGCONTABLE, FACREC_CUOTA_DEDUCIBLE, ''PENDIENTE CORRECCION'', CODIGO_ERROR, DESCRIPCION_ERROR, :TIPOCOMUNICACION_DESTINO ');
                                      SQL.Add(' FROM SII_REGLRFACTURASRECIBIDAS ');
                                      SQL.Add(' WHERE ');
                                      SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
                                      Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                      Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := IdRegLRFacturas;
                                      if (EstadoRegistro = 'AceptadoConErrores') then
                                         Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A1'
                                      else
                                         Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A0';
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
                                      SQL.Add(' INSERT INTO SII_DESGLOSEFACTURA_REC ( ');
                                      SQL.Add('  ID_SII_REGLRFACTURASRECIBIDAS, ID_SII_PRESENTACION, ID_SII_DESGLOSEFACTURA_REC, ISP_TIPOIMPOSITIVO, ISP_BASEIMPONIBLE, ');
                                      SQL.Add('  ISP_CUOTASOPORTADA, ISP_TIPORECARGOEQUIVALENCIA, ISP_CUOTARECARGOEQUIVALENCIA, DI_TIPOIMPOSITIVO, DI_BASEIMPONIBLE, ');
                                      SQL.Add('  DI_CUOTASOPORTADA, DI_TIPORECARGOEQUIVALENCIA, DI_CUOTARECARGOEQUIVALENCIA, DI_PORCENTCOMPSENSACIONREAGYP, ');
                                      SQL.Add('  DI_IMPORTECOMPSENSACIONREAGYP) ');
                                      SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, ISP_TIPOIMPOSITIVO, ISP_BASEIMPONIBLE, ISP_CUOTASOPORTADA, ');
                                      SQL.Add('        ISP_TIPORECARGOEQUIVALENCIA, ISP_CUOTARECARGOEQUIVALENCIA, DI_TIPOIMPOSITIVO, DI_BASEIMPONIBLE, ');
                                      SQL.Add('        DI_CUOTASOPORTADA, DI_TIPORECARGOEQUIVALENCIA, DI_CUOTARECARGOEQUIVALENCIA, DI_PORCENTCOMPSENSACIONREAGYP, ');
                                      SQL.Add('        DI_IMPORTECOMPSENSACIONREAGYP ');
                                      SQL.Add(' FROM SII_DESGLOSEFACTURA_REC ');
                                      SQL.Add(' WHERE ');
                                      SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
                                      Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := IdRegLRFacturas;
                                      Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                      ExecQuery;
                                      FreeHandle;
                                   finally
                                      Free;
                                   end;
                                end;
                             end;
                          end;
                       end;

                       RespuestaLinea := RespuestaLinea.NextSibling;
                    end;
                    DMMain.Log('FIN Lineas de Respuestas');

                    if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                    begin
                       // Guardo estado del envio
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SII_SUMLRFACTURASEMITIDAS ');
                             SQL.Add(' SET ');
                             SQL.Add(' ESTADO_ENVIO = :ESTADO_ENVIO ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
                             Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                             Params.ByName['ESTADO_ENVIO'].AsString := Copy(EstadoEnvio, 1, 40);
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       // Guardo CSV
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SII_SUMLRFACTURASEMITIDAS ');
                             SQL.Add(' SET ');
                             SQL.Add(' CSV = :CSV ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
                             Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                             Params.ByName['CSV'].AsString := CSV;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;
                    if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                    begin
                       // Guardo estado del envio
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SII_SUMLRFACTURASRECIBIDAS ');
                             SQL.Add(' SET ');
                             SQL.Add(' ESTADO_ENVIO = :ESTADO_ENVIO ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
                             Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                             Params.ByName['ESTADO_ENVIO'].AsString := Copy(EstadoEnvio, 1, 40);
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       // Guardo CSV
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SII_SUMLRFACTURASRECIBIDAS ');
                             SQL.Add(' SET ');
                             SQL.Add(' CSV = :CSV ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
                             Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                             Params.ByName['CSV'].AsString := CSV;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;
                 end;

                 Active := True;
                 Encoding := 'utf-8';
                 Active := False;
                 // Borro los datos
                 XML.Text := '';
              end;
           finally
              Documento.Free;
           end;

           DMMain.Log('Respuesta + Formato');
           DMMain.Log(s);
        except
           on e: Exception do
           begin
              // Si algo falla al tratar la respuesta, por lo menos guardo la version en bruto
              try
                 // Guardo respuesta
                 GuardaXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'RES', s + #13#10 + #13#10 + E.Message);
              except
                 on E: Exception do
                 begin
                    // Si todo falla, por lo menos guardo en un archivo
                    with TStringList.Create do
                    begin
                       try
                          Text := s;
                          SaveToFile(GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\SII-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.xml');
                          Text := E.Message;
                          SaveToFile(GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\SII-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '_Mensaje.txt');
                       finally
                          Free;
                       end;
                       ShowMessage('Hubo un fallo. Se ha guardado una copia de la respuesta en disco.' + #13#10 + E.Message);
                    end;
                 end;
              end;
           end;
        end;
     finally
        Server := Unassigned;
     end;

     // Lo guardo como adjunto, para poder tenerlo si pasa algo.
     DMMain.Log('Guardo como adjunto');
     Fichero := DameTempPath + 'SII-REC-' + xPresentacionID_SII_PRESENTACION.AsString + '-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.xml';

     DMMain.Log('Creo fichero: ' + Fichero);
     with TStringList.Create do
     begin
        try
           Text := s;
           SaveToFile(Fichero);
        finally
           Free;
        end;
     end;

     DMMain.LogIni('CreaAdjunto("SII", ' + xPresentacionID_SII_PRESENTACION.AsString + ', ' + Fichero + ', ...)');
     AbreData(TDMAdjunto, DMAdjunto);
     DMAdjunto.CreaAdjunto('SII', xPresentacionID_SII_PRESENTACION.AsInteger, Fichero, 'Respuesta Presentacion ' + xPresentacionID_SII_PRESENTACION.AsString + ' ' + FormatDateTime('yyyymmdd-hhnnss', Now));
     CierraData(DMAdjunto);
     DMMain.LogFin('Fin CreaAdjunto(...)');

     Refrescar(xPresentacion, 'ID_SII_PRESENTACION', xPresentacionID_SII_PRESENTACION.AsInteger);
  finally
     DMMain.LogFin('EnviarSII_LibroFacturasEmitidas');
  end;
end;

procedure TDMSII.GuardarFicheroPresentacion;
var
  Archivo : string;
  xml : TStrings;
begin
  Archivo := Format('\sii_presentacion-%d.xml', [xPresentacionID_SII_PRESENTACION.AsInteger]);
  if MySaveDialog(Archivo, 'XML', '', 'DMSII') then
  begin
     xml := TStringList.Create;
     try
        xml.Text := DameXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'PRE');
        // xPresentacionXML_PRESENTADO.SaveToFile(Archivo);
        xml.SaveToFile(Archivo);
     finally
        xml.Free;
     end;
  end;
end;

procedure TDMSII.GuardarFicheroRespuesta;
var
  Archivo : string;
  xml : TStrings;
begin
  Archivo := Format('\sii_respuesta-%d.xml', [xPresentacionID_SII_PRESENTACION.AsInteger]);
  if MySaveDialog(Archivo, 'XML', '', 'DMSII') then
  begin
     xml := TStringList.Create;
     try
        xml.Text := DameXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'RES');
        // xPresentacionXML_RESPUESTA.SaveToFile(Archivo);
        xml.SaveToFile(Archivo);
     finally
        xml.Free;
     end;
  end;
end;

procedure TDMSII.SeleccionaFacturaEmitida;
var
  id, idRefresco : integer;
begin
  if (xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_CODPAIS.AsString <> 'ZZ') then
  begin
     id := xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS.AsInteger;

     // Busco el registro siguiente para posicionar al refrescar
     idRefresco := xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS.AsInteger;
     xRLRFacEmiDisponibles.Next;
     if not xRLRFacEmiDisponibles.EOF then
        idRefresco := xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS.AsInteger;

     Refrescar(xRLRFacEmiDisponibles, 'ID_SII_REGLRFACTURASEMITIDAS', id);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE SII_REGLRFACTURASEMITIDAS ');
           SQL.Add(' SET ');
           SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
           SQL.Add(' AND FACEXP_CONTRAPARTE_CODPAIS <> ''ZZ'' ');
           Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
           Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Posiciono aproximadamente donde estaba.
     Refrescar(xRLRFacEmiDisponibles, 'ID_SII_REGLRFACTURASEMITIDAS', idRefresco, False, True);
     Refrescar(xRLRFacEmi, 'ID_SII_REGLRFACTURASEMITIDAS', id);
  end;
end;

procedure TDMSII.SeleccionaFacturaRecibida;
var
  id, idRefresco : integer;
begin
  if ((xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_CODPAIS.AsString <> 'ZZ') and
     (xRLRFacRecDisponiblesFACREC_CONTRAPARTE_CODPAIS.AsString <> 'ZZ')) then
  begin
     id := xRLRFacRecDisponiblesID_SII_REGLRFACTURASRECIBIDAS.AsInteger;

     // Busco el registro siguiente para posicionar al refrescar
     idRefresco := xRLRFacRecDisponiblesID_SII_REGLRFACTURASRECIBIDAS.AsInteger;
     xRLRFacRecDisponibles.Next;
     if not xRLRFacRecDisponibles.EOF then
        idRefresco := xRLRFacRecDisponiblesID_SII_REGLRFACTURASRECIBIDAS.AsInteger;

     Refrescar(xRLRFacRecDisponibles, 'ID_SII_REGLRFACTURASRECIBIDAS', id);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE SII_REGLRFACTURASRECIBIDAS ');
           SQL.Add(' SET ');
           SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
           SQL.Add(' AND IDFAC_EMISOR_OTRO_CODPAIS <> ''ZZ'' ');
           SQL.Add(' AND FACREC_CONTRAPARTE_CODPAIS <> ''ZZ'' ');
           Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
           Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Posiciono aproximadamente donde estaba.
     Refrescar(xRLRFacRecDisponibles, 'ID_SII_REGLRFACTURASRECIBIDAS', idRefresco, False, True);
     Refrescar(xRLRFacRec, 'ID_SII_REGLRFACTURASRECIBIDAS', id);
  end;
end;

procedure TDMSII.xRLRFacEmiAfterDelete(DataSet: TDataSet);
begin
  DMMain.Log('xRLRFacEmiAfterDelete');
  // Refresco facturas disponibles
  Refrescar(xRLRFacEmiDisponibles, 'ID_SII_REGLRFACTURASEMITIDAS', -1, True);
end;

procedure TDMSII.xRLRFacRecAfterDelete(DataSet: TDataSet);
begin
  DMMain.Log('xRLRFacRecAfterDelete');
  // Refresco facturas disponibles
  Refrescar(xRLRFacRecDisponibles, 'ID_SII_REGLRFACTURASRECIBIDAS', -1, True);
end;

procedure TDMSII.xPresentacionAfterScroll(DataSet: TDataSet);
begin
  DMMain.Log('xPresentacionAfterScroll');
  // Abro Disponibles si no ha sido presentado
  if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
     xSLRFacEmiAfterScroll(DataSet);
  if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
     xSLRFacRecAfterScroll(DataSet);
end;

procedure TDMSII.xSLRFacEmiAfterScroll(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacEmiAfterScroll');
  if not Closing then
  begin
     // Abro Disponibles si no ha sido presentado
     if (xSLRFacEmiCSV.AsString = '') then
     begin
        if (not xRLRFacEmiDisponibles.Active) then
        begin
           xRLRFacEmiDisponibles.Params.ByName['EMPRESA'].AsInteger := xPresentacionEMPRESA.AsInteger;
           xRLRFacEmiDisponibles.Params.ByName['CANAL'].AsInteger := xPresentacionCANAL.AsInteger;
           xRLRFacEmiDisponibles.Open;
        end;

        xPresentacion.AccionesInhibidas := [];
        xSLRFacEmi.AccionesInhibidas := [];
        xRLRFacEmi.AccionesInhibidas := [];
        xDesgloseFacEmi.AccionesInhibidas := [];
     end
     else
     begin
        if (xRLRFacEmiDisponibles.Active) then
           xRLRFacEmiDisponibles.Close;

        xPresentacion.AccionesInhibidas := [Borrar, Modificar];
        xSLRFacEmi.AccionesInhibidas := [Borrar, Insertar, Modificar];
        xRLRFacEmi.AccionesInhibidas := [Borrar, Insertar, Modificar];
        xDesgloseFacEmi.AccionesInhibidas := [Borrar, Insertar, Modificar];
     end;
  end;
end;

procedure TDMSII.xSLRFacRecAfterScroll(DataSet: TDataSet);
begin
  DMMain.Log('xSLRFacRecAfterScroll');
  if not Closing then
  begin
     // Abro Disponibles si no ha sido presentado
     if (xSLRFacRecCSV.AsString = '') then
     begin
        if (not xRLRFacRecDisponibles.Active) then
        begin
           xRLRFacRecDisponibles.Params.ByName['EMPRESA'].AsInteger := xPresentacionEMPRESA.AsInteger;
           xRLRFacRecDisponibles.Params.ByName['CANAL'].AsInteger := xPresentacionCANAL.AsInteger;
           xRLRFacRecDisponibles.Open;
        end;

        xPresentacion.AccionesInhibidas := [];
        xSLRFacRec.AccionesInhibidas := [];
        xRLRFacRec.AccionesInhibidas := [];
        xDesgloseFacRec.AccionesInhibidas := [];
     end
     else
     begin
        if (xRLRFacRecDisponibles.Active) then
           xRLRFacRecDisponibles.Close;

        xPresentacion.AccionesInhibidas := [Borrar, Modificar];
        xSLRFacRec.AccionesInhibidas := [Borrar, Insertar, Modificar];
        xRLRFacRec.AccionesInhibidas := [Borrar, Insertar, Modificar];
        xDesgloseFacRec.AccionesInhibidas := [Borrar, Insertar, Modificar];
     end;
  end;
end;

procedure TDMSII.SeleccionaFacturaEmitidaFecha(Desde, Hasta: TDateTime);
var
  id : integer;
begin
  id := xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_REGLRFACTURASEMITIDAS E ');
        SQL.Add(' SET ');
        SQL.Add(' E.ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.ID_SII_SUMLRFACTURASEMITIDAS = 0 AND ');
        SQL.Add(' E.TIPOCOMUNICACION_DESTINO = :TIPOCOMUNICACION_DESTINO AND ');
        SQL.Add(' E.IDFAC_EMISOR_FECHA_EXPEDICION >= :IDFAC_EMISOR_FECHA_EXPEDICION_DESDE AND ');
        SQL.Add(' E.IDFAC_EMISOR_FECHA_EXPEDICION <= :IDFAC_EMISOR_FECHA_EXPEDICION_HASTA ');
        SQL.Add(' AND ((SELECT EMPRESA FROM EMP_REGISTRO_IVA WHERE ID_I = E.ID_I) = :EMPRESA) ');
        SQL.Add(' AND ((SELECT CANAL FROM EMP_REGISTRO_IVA WHERE ID_I = E.ID_I) = :CANAL) ');
        // Evito facturas con el pais sin informar
        SQL.Add(' AND E.FACEXP_CONTRAPARTE_CODPAIS <> ''ZZ'' ');
        Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
        Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := xSLRFacEmiTIPOCOMUNICACION.AsString;
        Params.ByName['IDFAC_EMISOR_FECHA_EXPEDICION_DESDE'].AsDateTime := HourIntoDate(Desde, '00:00:00');
        Params.ByName['IDFAC_EMISOR_FECHA_EXPEDICION_HASTA'].AsDateTime := HourIntoDate(Hasta, '23:59:59');
        Params.ByName['EMPRESA'].AsInteger := xPresentacionEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := xPresentacionCANAL.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Posiciono aproximadamente donde estaba.
  Refrescar(xRLRFacEmiDisponibles, 'ID_SII_REGLRFACTURASEMITIDAS', 0, False, True);
  Refrescar(xRLRFacEmi, 'ID_SII_REGLRFACTURASEMITIDAS', id);
end;

procedure TDMSII.SeleccionaFacturaRecibidaFecha(Desde, Hasta: TDateTime);
var
  id : integer;
begin
  id := xRLRFacRecDisponiblesID_SII_REGLRFACTURASRECIBIDAS.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_REGLRFACTURASRECIBIDAS R ');
        SQL.Add(' SET ');
        SQL.Add(' R.ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' R.ID_SII_SUMLRFACTURASRECIBIDAS = 0 AND ');
        SQL.Add(' R.TIPOCOMUNICACION_DESTINO = :TIPOCOMUNICACION_DESTINO AND ');
        SQL.Add(' R.FACREC_FECHAREGCONTABLE >= :FACREC_FECHAREGCONTABLE_DESDE AND ');
        SQL.Add(' R.FACREC_FECHAREGCONTABLE <= :FACREC_FECHAREGCONTABLE_HASTA ');
        SQL.Add(' AND ((SELECT EMPRESA FROM EMP_REGISTRO_IVA WHERE ID_I = R.ID_I) = :EMPRESA) ');
        SQL.Add(' AND ((SELECT CANAL FROM EMP_REGISTRO_IVA WHERE ID_I = R.ID_I) = :CANAL) ');
        // Evito facturas con el pais sin informar
        SQL.Add(' AND R.IDFAC_EMISOR_OTRO_CODPAIS <> ''ZZ'' ');
        SQL.Add(' AND R.FACREC_CONTRAPARTE_CODPAIS <> ''ZZ'' ');
        // Las facturas de compra de importacion no se tienen en cuenta. Solo las de DUA (Tipo F5 y emusor=empresa)
        // Ademas de las españolas y las intracomunitarias
        SQL.Add(' AND ');
        SQL.Add(' ( ');
        SQL.Add(' ((IDFAC_EMISOR_OTRO_CODPAIS = ''ES'') and ');
        SQL.Add(' (FACREC_TIPOFACTURA = ''F1'') and ');
        SQL.Add(' (FACREC_CLAVE_REG_ESP = ''01'')) ');
        SQL.Add(' OR ');
        SQL.Add(' (FACREC_CLAVE_REG_ESP = ''09'') ');
        SQL.Add(' OR ');
        SQL.Add(' ((FACREC_TIPOFACTURA = ''F5'') and ');
        SQL.Add(' (IDFAC_EMISOR_OTRO_CODPAIS = ''ES'')) ');
        SQL.Add(' ) ');

        Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
        Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := xSLRFacRecTIPOCOMUNICACION.AsString;
        Params.ByName['FACREC_FECHAREGCONTABLE_DESDE'].AsDateTime := HourIntoDate(Desde, '00:00:00');
        Params.ByName['FACREC_FECHAREGCONTABLE_HASTA'].AsDateTime := HourIntoDate(Hasta, '23:59:59');
        Params.ByName['EMPRESA'].AsInteger := xPresentacionEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := xPresentacionCANAL.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Posiciono aproximadamente donde estaba.
  Refrescar(xRLRFacRecDisponibles, 'ID_SII_REGLRFACTURASRECIBIDAS', 0, False, True);
  Refrescar(xRLRFacRec, 'ID_SII_REGLRFACTURASRECIBIDAS', id);
end;

procedure TDMSII.xPresentacionAfterPost(DataSet: TDataSet);
begin
  DMMain.Log('xPresentacionAfterPost');
  // Abro Disponibles si no ha sido presentado
  if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
     xSLRFacEmiAfterScroll(DataSet);
  if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
     xSLRFacRecAfterScroll(DataSet);
end;

procedure TDMSII.VerificarRespuestaPresentacion(Entrada: integer);
var
  // Url, CertName, Fichero : string;
  Documento : TXMLDocument;
  Nodo, RespuestaLinea : IXMLNode;
  CSV, EstadoEnvio, s : WideString;
  NumSerieFacturaEmisor, EstadoRegistro, CodigoErrorRegistro, DescripcionErrorRegistro : WideString;
  IdRegLRFacturas, id : integer;
  // VersionMSXML : string;
begin
  DMMain.LogIni('VerificarRespuestaPresentacion');
  try
     // s := xPresentacionXML_RESPUESTA.AsString;
     s := DameXML(xPresentacionID_SII_PRESENTACION.AsInteger, 'RES');
     DMMain.Log('Respuesta');
     DMMain.Log(s);

     // Formateo respuesta XML
     try
        Documento := TXMLDocument.Create(Self);
        try
           with Documento do
           begin
              // Borro los datos que pudiera haber
              XML.Text := '';
              Active := True;
              Encoding := 'utf-8';

              // Cargo XML en el componente
              XML.Text := Utf8Encode(s);

              // Doy formato al fichero
              XML.Text := FormatXMLData(XML.Text);
              s := XML.Text;
              Active := True;

              EstadoEnvio := '';
              Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', Prefixenv + 'Fault']);
              if (Assigned(Nodo)) then
              begin
                 Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', Prefixenv + 'Fault', 'faultcode']);
                 if (Assigned(Nodo)) then
                    EstadoEnvio := EstadoEnvio + Nodo.Text;
                 Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', Prefixenv + 'Fault', 'faultstring']);
                 if (Assigned(Nodo)) then
                    EstadoEnvio := EstadoEnvio + ' ' + Nodo.Text;
                 ShowMessage(_('El formato es incorrecto y no ha podido enviarse.') + #13#10 + EstadoEnvio);
              end
              else
              begin
                 // Busco CSV y mensajes de respuesta
                 if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                    Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasRecibidas', PrefixsiiR + 'CSV'])
                 else
                 if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                 begin
                    if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
                       Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRBajaFacturasEmitidas', PrefixsiiR + 'CSV'])
                    else
                       Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasEmitidas', PrefixsiiR + 'CSV']);
                 end;
                 if (Assigned(Nodo)) then
                    CSV := Nodo.Text;

                 // Busco EstadoEnvio y mensajes de respuesta
                 if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                    Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasRecibidas', PrefixsiiR + 'EstadoEnvio'])
                 else
                 if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                 begin
                    if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
                       Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRBajaFacturasEmitidas', PrefixsiiR + 'EstadoEnvio'])
                    else
                       Nodo := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasEmitidas', PrefixsiiR + 'EstadoEnvio']);
                 end;
                 if (Assigned(Nodo)) then
                    EstadoEnvio := Nodo.Text;

                 DMMain.Log('CSV: ' + CSV);
                 DMMain.Log('EstadoEnvio: ' + EstadoEnvio);

                 DMMain.Log('Lineas de Respuestas');
                 if (xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                    RespuestaLinea := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasRecibidas', PrefixsiiR + 'RespuestaLinea'])
                 else
                 if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                 begin
                    if (xSLRFacEmiTIPOCOMUNICACION.AsString = 'A4') then
                       RespuestaLinea := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRBajaFacturasEmitidas', PrefixsiiR + 'RespuestaLinea'])
                    else
                       RespuestaLinea := DameNodo(DocumentElement, [Prefixenv + 'Body', PrefixsiiR + 'RespuestaLRFacturasEmitidas', PrefixsiiR + 'RespuestaLinea']);
                 end;

                 while Assigned(RespuestaLinea) do
                 begin
                    NumSerieFacturaEmisor := '';
                    EstadoRegistro := '';
                    CodigoErrorRegistro := '';
                    DescripcionErrorRegistro := '';

                    Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'IDFactura', Prefixsii + 'NumSerieFacturaEmisor']);
                    if Assigned(Nodo) then
                       NumSerieFacturaEmisor := Nodo.Text;
                    Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'EstadoRegistro']);
                    if Assigned(Nodo) then
                       EstadoRegistro := Nodo.Text;
                    Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'CodigoErrorRegistro']);
                    if Assigned(Nodo) then
                       CodigoErrorRegistro := Nodo.Text;
                    Nodo := DameNodo(RespuestaLinea, [PrefixsiiR + 'DescripcionErrorRegistro']);
                    if Assigned(Nodo) then
                       DescripcionErrorRegistro := Nodo.Text;

                    DMMain.Log('NumSerieFacturaEmisor: ' + NumSerieFacturaEmisor);
                    DMMain.Log('EstadoRegistro: ' + EstadoRegistro);
                    DMMain.Log('CodigoErrorRegistro: ' + CodigoErrorRegistro);
                    DMMain.Log('DescripcionErrorRegistro: ' + DescripcionErrorRegistro);

                    if (xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SII_REGLRFACTURASEMITIDAS ');
                             SQL.Add(' SET ');
                             SQL.Add(' ESTADO_REGISTRO = :ESTADO_REGISTRO, ');
                             SQL.Add(' CODIGO_ERROR = :CODIGO_ERROR, ');
                             SQL.Add(' DESCRIPCION_ERROR = :DESCRIPCION_ERROR ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS AND ');
                             SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                             Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                             Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                             Params.ByName['ESTADO_REGISTRO'].AsString := Copy(EstadoRegistro, 1, 40);
                             Params.ByName['CODIGO_ERROR'].AsString := Copy(CodigoErrorRegistro, 1, 20);
                             Params.ByName['DESCRIPCION_ERROR'].AsString := Copy(DescripcionErrorRegistro, 1, 500);
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       // Si no es correcto, hago una copia, para que se solucione.
                       if (EstadoRegistro <> 'Correcto') then
                       begin
                          // Obtengo el ID que debo duplicar
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' SELECT ID_SII_REGLRFACTURASEMITIDAS FROM SII_REGLRFACTURASEMITIDAS ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS AND ');
                                SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                                Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                ExecQuery;
                                IdRegLRFacturas := FieldByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          id := DMMain.ContadorGen('ID_SII_REGLRFACTURASEMITIDAS');

                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO SII_REGLRFACTURASEMITIDAS ( ');
                                SQL.Add('  ID_SII_REGLRFACTURASEMITIDAS, ID_SII_PRESENTACION, ID_SII_SUMLRFACTURASEMITIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
                                SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, ');
                                SQL.Add('  IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPORECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR, ');
                                SQL.Add('  FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FACEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT, ');
                                SQL.Add('  FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_FECHAOPERACION, FACEXP_CLAVE_REG_ESP, ');
                                SQL.Add('  FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUERDOFAC, FACEXP_IMPORTE_TOTAL, ');
                                SQL.Add('  FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL, ');
                                SQL.Add('  FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FACEXP_VARIOSDESTINATARIOS, FACEXP_CUPON, ');
                                SQL.Add('  FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS, ');
                                SQL.Add('  FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE, TIPO_DESGLOSE_OPERACION, ESTADO_REGISTRO, ');
                                SQL.Add('  CODIGO_ERROR, DESCRIPCION_ERROR, TIPOCOMUNICACION_DESTINO) ');
                                SQL.Add(' SELECT ');
                                SQL.Add('  :ID_SII_REGLRFACTURAS, 0, 0, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
                                SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, ');
                                SQL.Add('  IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPORECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR, ');
                                SQL.Add('  FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FACEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT, ');
                                SQL.Add('  FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_FECHAOPERACION, FACEXP_CLAVE_REG_ESP, ');
                                SQL.Add('  FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUERDOFAC, FACEXP_IMPORTE_TOTAL, ');
                                SQL.Add('  FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL, ');
                                SQL.Add('  FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FACEXP_VARIOSDESTINATARIOS, FACEXP_CUPON, ');
                                SQL.Add('  FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS, ');
                                SQL.Add('  FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE, TIPO_DESGLOSE_OPERACION, ''PENDIENTE CORRECCION'', ');
                                SQL.Add('  CODIGO_ERROR, DESCRIPCION_ERROR, :TIPOCOMUNICACION_DESTINO ');
                                SQL.Add('  FROM SII_REGLRFACTURASEMITIDAS ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
                                Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := IdRegLRFacturas;
                                if (EstadoRegistro = 'AceptadoConErrores') then
                                   Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A1'
                                else
                                   Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A0';
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
                                SQL.Add(' INSERT INTO SII_DESGLOSEFACTURA_EMI ( ');
                                SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS, ID_SII_PRESENTACION, ID_SII_DESGLOSEFACTURA_EMI, SUJETA_EXENTA_CAUSA, ');
                                SQL.Add('  SUJETA_EXENTA_BASEIMPONIBLE, SUJETA_NO_EXENTA_TIPO, SUJETA_NO_EXENTA_TIPOIMP, SUJETA_NO_EXENTA_BASEIMP, ');
                                SQL.Add('  SUJETA_NO_EXENTA_CUOTAREP, SUJETA_NO_EXENTA_TIPOREC, SUJETA_NO_EXENTA_CUOTAREC, NO_SUJETA_IMPORTE_ART_7_14, ');
                                SQL.Add('  NO_SUJETA_IMPORTE_TAI) ');
                                SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, SUJETA_EXENTA_CAUSA, ');
                                SQL.Add('        SUJETA_EXENTA_BASEIMPONIBLE, SUJETA_NO_EXENTA_TIPO, SUJETA_NO_EXENTA_TIPOIMP, SUJETA_NO_EXENTA_BASEIMP, ');
                                SQL.Add('        SUJETA_NO_EXENTA_CUOTAREP, SUJETA_NO_EXENTA_TIPOREC, SUJETA_NO_EXENTA_CUOTAREC, NO_SUJETA_IMPORTE_ART_7_14, ');
                                SQL.Add('        NO_SUJETA_IMPORTE_TAI ');
                                SQL.Add(' FROM SII_DESGLOSEFACTURA_EMI ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
                                Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := IdRegLRFacturas;
                                Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end
                    else
                    begin
                       if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' UPDATE SII_REGLRFACTURASRECIBIDAS ');
                                SQL.Add(' SET ');
                                SQL.Add(' ESTADO_REGISTRO = :ESTADO_REGISTRO, ');
                                SQL.Add(' CODIGO_ERROR = :CODIGO_ERROR, ');
                                SQL.Add(' DESCRIPCION_ERROR = :DESCRIPCION_ERROR ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS AND ');
                                SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                                Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                Params.ByName['ESTADO_REGISTRO'].AsString := Copy(EstadoRegistro, 1, 40);
                                Params.ByName['CODIGO_ERROR'].AsString := Copy(CodigoErrorRegistro, 1, 20);
                                Params.ByName['DESCRIPCION_ERROR'].AsString := Copy(DescripcionErrorRegistro, 1, 500);
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          // Si no es correcto, hago una copia, para que se solucione.
                          if (EstadoRegistro <> 'Correcto') then
                          begin
                             // Obtengo el ID que debo duplicar
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add(' SELECT ID_SII_REGLRFACTURASRECIBIDAS FROM SII_REGLRFACTURASRECIBIDAS ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS AND ');
                                   SQL.Add(' IDFAC_EMISOR_NUMSERIEFAC = :IDFAC_EMISOR_NUMSERIEFAC ');
                                   Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                                   Params.ByName['IDFAC_EMISOR_NUMSERIEFAC'].AsString := NumSerieFacturaEmisor;
                                   ExecQuery;
                                   IdRegLRFacturas := FieldByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;

                             id := DMMain.ContadorGen('ID_SII_REGLRFACTURASRECIBIDAS');

                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add(' INSERT INTO SII_REGLRFACTURASRECIBIDAS ( ');
                                   SQL.Add('  ID_SII_REGLRFACTURASRECIBIDAS, ID_SII_PRESENTACION, ID_SII_SUMLRFACTURASRECIBIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
                                   SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_OTRO_CODPAIS, IDFAC_EMISOR_OTRO_IDTYPE, IDFAC_EMISOR_OTRO_ID, ');
                                   SQL.Add('  IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, IDFAC_EMISOR_FECHA_EXPEDICION, FACREC_TIPOFACTURA, ');
                                   SQL.Add('  FACREC_TIPORECTIFICATIVA, FACREC_FAGR_NUMSERIEFACEMISOR, FACREC_FAGR_FECHAEXPEDICION, FACREC_FRECT_NUMSERIEFACEMISOR, ');
                                   SQL.Add('  FACREC_FRECT_FECHAEXPEDICION, FACREC_IMPRECT_BASERECT, FACREC_IMPRECT_CUOTARECT, FACREC_IMPRECT_CUOTARECRECT, ');
                                   SQL.Add('  FACREC_FECHAOPERACION, FACREC_CLAVE_REG_ESP, FACREC_CLAVE_REG_ESP1, FACREC_CLAVE_REG_ESP2, FACREC_NUMREGACUERDOFAC, ');
                                   SQL.Add('  FACREC_IMPORTE_TOTAL, FACREC_BASEIMPONIBLEACOSTE, FACREC_DESCRIPCION, FACREC_ADUANAS_NUMERODUA, ');
                                   SQL.Add('  FACREC_ADUANAS_FECHAREGCONTDUA, FACREC_CONTRAP_NOMBRE_RAZON, FACREC_CONTRAP_NIF_REPRES, FACREC_CONTRAP_NIF, ');
                                   SQL.Add('  FACREC_CONTRAPARTE_CODPAIS, FACREC_CONTRAPARTE_IDTYPE, FACREC_CONTRAPARTE_ID, FACREC_FECHAREGCONTABLE, ');
                                   SQL.Add('  FACREC_CUOTA_DEDUCIBLE, ESTADO_REGISTRO, CODIGO_ERROR, DESCRIPCION_ERROR, TIPOCOMUNICACION_DESTINO) ');
                                   SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, ID_I, PERIODOIMPOSITIVO_EJERCICIO, PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, ');
                                   SQL.Add('        IDFAC_EMISOR_OTRO_CODPAIS, IDFAC_EMISOR_OTRO_IDTYPE, IDFAC_EMISOR_OTRO_ID, IDFAC_EMISOR_NUMSERIEFAC, ');
                                   SQL.Add('        IDFAC_EMISOR_NUMSERIEFACFIN, IDFAC_EMISOR_FECHA_EXPEDICION, FACREC_TIPOFACTURA, FACREC_TIPORECTIFICATIVA, ');
                                   SQL.Add('        FACREC_FAGR_NUMSERIEFACEMISOR, FACREC_FAGR_FECHAEXPEDICION, FACREC_FRECT_NUMSERIEFACEMISOR, ');
                                   SQL.Add('        FACREC_FRECT_FECHAEXPEDICION, FACREC_IMPRECT_BASERECT, FACREC_IMPRECT_CUOTARECT, FACREC_IMPRECT_CUOTARECRECT, ');
                                   SQL.Add('        FACREC_FECHAOPERACION, FACREC_CLAVE_REG_ESP, FACREC_CLAVE_REG_ESP1, FACREC_CLAVE_REG_ESP2, ');
                                   SQL.Add('        FACREC_NUMREGACUERDOFAC, FACREC_IMPORTE_TOTAL, FACREC_BASEIMPONIBLEACOSTE, FACREC_DESCRIPCION, ');
                                   SQL.Add('        FACREC_ADUANAS_NUMERODUA, FACREC_ADUANAS_FECHAREGCONTDUA, FACREC_CONTRAP_NOMBRE_RAZON, FACREC_CONTRAP_NIF_REPRES, ');
                                   SQL.Add('        FACREC_CONTRAP_NIF, FACREC_CONTRAPARTE_CODPAIS, FACREC_CONTRAPARTE_IDTYPE, FACREC_CONTRAPARTE_ID, ');
                                   SQL.Add('        FACREC_FECHAREGCONTABLE, FACREC_CUOTA_DEDUCIBLE, ''PENDIENTE CORRECCION'', CODIGO_ERROR, DESCRIPCION_ERROR, :TIPOCOMUNICACION_DESTINO ');
                                   SQL.Add(' FROM SII_REGLRFACTURASRECIBIDAS ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
                                   Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                   Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := IdRegLRFacturas;
                                   if (EstadoRegistro = 'AceptadoConErrores') then
                                      Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A1'
                                   else
                                      Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := 'A0';
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
                                   SQL.Add(' INSERT INTO SII_DESGLOSEFACTURA_REC ( ');
                                   SQL.Add('  ID_SII_REGLRFACTURASRECIBIDAS, ID_SII_PRESENTACION, ID_SII_DESGLOSEFACTURA_REC, ISP_TIPOIMPOSITIVO, ISP_BASEIMPONIBLE, ');
                                   SQL.Add('  ISP_CUOTASOPORTADA, ISP_TIPORECARGOEQUIVALENCIA, ISP_CUOTARECARGOEQUIVALENCIA, DI_TIPOIMPOSITIVO, DI_BASEIMPONIBLE, ');
                                   SQL.Add('  DI_CUOTASOPORTADA, DI_TIPORECARGOEQUIVALENCIA, DI_CUOTARECARGOEQUIVALENCIA, DI_PORCENTCOMPSENSACIONREAGYP, ');
                                   SQL.Add('  DI_IMPORTECOMPSENSACIONREAGYP) ');
                                   SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, ISP_TIPOIMPOSITIVO, ISP_BASEIMPONIBLE, ISP_CUOTASOPORTADA, ');
                                   SQL.Add('        ISP_TIPORECARGOEQUIVALENCIA, ISP_CUOTARECARGOEQUIVALENCIA, DI_TIPOIMPOSITIVO, DI_BASEIMPONIBLE, ');
                                   SQL.Add('        DI_CUOTASOPORTADA, DI_TIPORECARGOEQUIVALENCIA, DI_CUOTARECARGOEQUIVALENCIA, DI_PORCENTCOMPSENSACIONREAGYP, ');
                                   SQL.Add('        DI_IMPORTECOMPSENSACIONREAGYP ');
                                   SQL.Add(' FROM SII_DESGLOSEFACTURA_REC ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
                                   Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := IdRegLRFacturas;
                                   Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                          end;
                       end;
                    end;

                    RespuestaLinea := RespuestaLinea.NextSibling;
                 end;
                 DMMain.Log('FIN Lineas de Respuestas');

                 if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
                 begin
                    // Guardo estado del envio
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SII_SUMLRFACTURASEMITIDAS ');
                          SQL.Add(' SET ');
                          SQL.Add(' ESTADO_ENVIO = :ESTADO_ENVIO ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
                          Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                          Params.ByName['ESTADO_ENVIO'].AsString := Copy(EstadoEnvio, 1, 40);
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    // Guardo CSV
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SII_SUMLRFACTURASEMITIDAS ');
                          SQL.Add(' SET ');
                          SQL.Add(' CSV = :CSV ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
                          Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
                          Params.ByName['CSV'].AsString := CSV;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
                 if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
                 begin
                    // Guardo estado del envio
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SII_SUMLRFACTURASRECIBIDAS ');
                          SQL.Add(' SET ');
                          SQL.Add(' ESTADO_ENVIO = :ESTADO_ENVIO ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
                          Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                          Params.ByName['ESTADO_ENVIO'].AsString := Copy(EstadoEnvio, 1, 40);
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    // Guardo CSV
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SII_SUMLRFACTURASRECIBIDAS ');
                          SQL.Add(' SET ');
                          SQL.Add(' CSV = :CSV ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
                          Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
                          Params.ByName['CSV'].AsString := CSV;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end;

              Active := True;
              Encoding := 'utf-8';
              Active := False;
              // Borro los datos
              XML.Text := '';
           end;
        finally
           Documento.Free;
        end;

        DMMain.Log('Respuesta + Formato');
        DMMain.Log(s);
     except
        on e: Exception do
        begin
           DMMain.LogFin('Error' + #13#10 + E.Message);
           ConfirmaMensaje('Error' + #13#10 + E.Message);
        end;
     end;

     Refrescar(xPresentacion, 'ID_SII_PRESENTACION', xPresentacionID_SII_PRESENTACION.AsInteger);
  finally
     DMMain.LogFin('VerificarRespuestaPresentacion');
  end;
end;

procedure TDMSII.GuardaXML(id: integer; Tipo, xml: string);
var
  DS : TFIBDataSet;
  StreamDestino, StreamOrigen : TStream;
begin
  // Primero borro el contenido, porque sucede que queda basura cuando se hace un update.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_PRESENTACION ');
        SQL.Add(' SET ');
        if (Tipo = 'PRE') then
           SQL.Add(' XML_PRESENTADO = NULL ');
        if (Tipo = 'RES') then
           SQL.Add(' XML_RESPUESTA = NULL ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_SII_PRESENTACION = :ID_SII_PRESENTACION ');

        Params.ByName['ID_SII_PRESENTACION'].AsInteger := id;

        ExecQuery;
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
        Transaction := DameTransactionRW(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT * FROM SII_PRESENTACION WHERE ID_SII_PRESENTACION = :ID_SII_PRESENTACION ');

           UpdateSQL.Add(' UPDATE SII_PRESENTACION ');
           UpdateSQL.Add(' SET ');
           if (Tipo = 'PRE') then
              UpdateSQL.Add(' XML_PRESENTADO = :XML_PRESENTADO ');
           if (Tipo = 'RES') then
              UpdateSQL.Add(' XML_RESPUESTA = :XML_RESPUESTA ');
           UpdateSQL.Add(' WHERE ');
           UpdateSQL.Add(' ID_SII_PRESENTACION = :ID_SII_PRESENTACION ');

           // Abro Dataset
           Params.ByName['ID_SII_PRESENTACION'].AsInteger := id;
           Open;

           // Se pone en modo Edicion
           Edit;

           StreamDestino := nil;
           if (Tipo = 'PRE') then
              StreamDestino := CreateBlobStream(FieldByName('XML_PRESENTADO'), bmRead);
           if (Tipo = 'RES') then
              StreamDestino := CreateBlobStream(FieldByName('XML_RESPUESTA'), bmRead);

           try
              try
                 if Assigned(StreamDestino) then
                 begin
                    StreamOrigen := TStringStream.Create(xml);
                    try
                       StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                    finally
                       StreamOrigen.Free;
                    end;
                 end;
              finally
                 StreamDestino.Free;
              end;

              // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
           except
              DS.Cancel;
           end;

           Post;

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

function TDMSII.DameXML(id: integer; Tipo: string): string;
var
  DS : TFIBDataSet;
  // StreamDestino, StreamOrigen : TStream;
begin
  Result := '';
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

           SelectSQL.Add(' SELECT * FROM SII_PRESENTACION WHERE ID_SII_PRESENTACION = :ID_SII_PRESENTACION ');
           Params.ByName['ID_SII_PRESENTACION'].AsInteger := id;
           Open;

           if (Tipo = 'PRE') then
              Result := FieldByName('XML_PRESENTADO').AsString;
           if (Tipo = 'RES') then
              Result := FieldByName('XML_RESPUESTA').AsString;

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

end.
