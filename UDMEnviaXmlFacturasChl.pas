unit UDMEnviaXMLFacturasChl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery, XMLDoc, XMLIntf, Psock, NMpop3, NMMSG, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdPOP3, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachment, ShellAPI;

type
  TDMEnviaXMLFacturasChl = class(TDataModule)
     DSQMDocumentos: TDataSource;
     QMDocumentos: TFIBTableSet;
     TLocal: THYTransaction;
     QMDetalleFactura: TFIBDataSetRO;
     DSDetalleFactura: TDataSource;
     QMDetalleFacturaLINEA: TIntegerField;
     QMDetalleFacturaARTICULO: TFIBStringField;
     QMDetalleFacturaTITULO: TFIBStringField;
     QMDetalleFacturaUNIDADES: TFloatField;
     QMDetalleFacturaPRECIO: TFloatField;
     QMDetalleFacturaI_DESCUENTO: TFloatField;
     QMDetalleFacturaNOTAS: TMemoField;
     QMDetalleFacturaDESCUENTO: TFloatField;
     QMCabeceraFEChile: TFIBDataSetRO;
     DSCabeceraFEChile: TDataSource;
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
     QMCabeceraFEChileXML_GENERADO: TMemoField;
     QMCabeceraFEChileSII_TRACKID: TFIBStringField;
     QMCabeceraFEChileXML_RESPUESTA: TMemoField;
     QMCabeceraFEChileNROLINREF: TIntegerField;
     QMCabeceraFEChileTPODOCREF: TFIBStringField;
     QMCabeceraFEChileRUTOTR: TFIBStringField;
     QMCabeceraFEChileFCHREF: TDateTimeField;
     QMCabeceraFEChileCODREF: TIntegerField;
     QMCabeceraFEChileRAZONREF: TFIBStringField;
     // QMCabeceraFEChileTIMBRE_ELECTRONICO: TMemoField;
     // QMCabeceraFEChileTIMBRE_ELECTRONICO_IMG: TBlobField;
     QMCabeceraFEChileTIMBRE_TEXTO: TMemoField;
     QMCabeceraFEChileTIMBRE_COD_BARRA: TBlobField;
     TUpdate: THYTransaction;
     QMSIIDteReferencia: TFIBDataSetRO;
     DSQMSIIDteReferencia: TDataSource;
     QMSIIDteReferenciaID_S: TIntegerField;
     QMSIIDteReferenciaNROLINREF: TIntegerField;
     QMSIIDteReferenciaTPODOCREF: TFIBStringField;
     QMSIIDteReferenciaFCHREF: TDateTimeField;
     QMSIIDteReferenciaCODREF: TIntegerField;
     QMSIIDteReferenciaRAZONREF: TFIBStringField;
     QMSIIDteReferenciaFOLIO: TIntegerField;
     QMSIIDteReferenciaID_S_REF: TIntegerField;
     QMSIIDteReferenciaRUTOTR: TFIBStringField;
     QMSIIDteReferenciaFOLIOREF: TFIBStringField;
     QMDocumentosEMPRESA: TIntegerField;
     QMDocumentosEJERCICIO: TIntegerField;
     QMDocumentosCANAL: TIntegerField;
     QMDocumentosSERIE: TFIBStringField;
     QMDocumentosTIPO: TFIBStringField;
     QMDocumentosRIG: TIntegerField;
     QMDocumentosENTRADA_FACTURACION: TIntegerField;
     QMDocumentosFECHA: TDateTimeField;
     QMDocumentosCLIENTE: TIntegerField;
     QMDocumentosTITULO: TFIBStringField;
     QMDocumentosSU_REFERENCIA: TFIBStringField;
     QMDocumentosFORMA_PAGO: TFIBStringField;
     QMDocumentosTOTAL_A_COBRAR: TFloatField;
     QMDocumentosMONEDA: TFIBStringField;
     QMDocumentosTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMDocumentosID_S: TIntegerField;
     QMDocumentosINDTRASLADO: TIntegerField;
     QMDocumentosTPOIMPRESION: TFIBStringField;
     QMDocumentosID_TIPO_DESPACHO: TIntegerField;
     QMDocumentosSII_FMA_PAGO: TIntegerField;
     QMDocumentosCODIGO_GIRO_EMPRESA: TIntegerField;
     QMDocumentosTERCERO: TIntegerField;
     QMDocumentosDIRECCION: TIntegerField;
     QMDocumentosLIQUIDO: TFloatField;
     QMCabeceraFEChileFOLIOREF: TFIBStringField;
     QMDocumentosCODIGO_GIRO_CLIENTE: TIntegerField;
     DSQMSIITipDocTributario: TDataSource;
     QMSIITipDocTributario: TFIBDataSetRO;
     QMSIITipDocTributarioCODIGO: TFIBStringField;
     QMSIITipDocTributarioTITULO: TFIBStringField;
     QMSIITipDocTributarioVISIBLE_ALB: TIntegerField;
     QMSIITipDocTributarioVISIBLE_FAC: TIntegerField;
     DSQMRCV_VENTA: TDataSource;
     QMRCV_VENTA: TFIBTableSet;
     QMRCV_VENTAEMPRESA: TIntegerField;
     QMRCV_VENTATIPO_DOC: TFIBStringField;
     QMRCV_VENTATIPO_VENTA: TFIBStringField;
     QMRCV_VENTARUT_CLIENTE: TFIBStringField;
     QMRCV_VENTARAZON_SOCIAL: TFIBStringField;
     QMRCV_VENTAFOLIO: TIntegerField;
     QMRCV_VENTAFECHA_DOCTO: TDateTimeField;
     QMRCV_VENTAFECHA_RECEPCION: TDateTimeField;
     QMRCV_VENTAFECHA_ACUSE_RECIBO: TDateTimeField;
     QMRCV_VENTAFECHA_RECLAMO: TDateTimeField;
     QMRCV_VENTAMONTO_EXENTO: TFloatField;
     QMRCV_VENTAMONTO_NETO: TFloatField;
     QMRCV_VENTAMONTO_IVA: TFloatField;
     QMRCV_VENTAMONTO_TOTAL: TFloatField;
     QMRCV_VENTAIVA_RETENIDO_TOTAL: TFloatField;
     QMRCV_VENTAIVA_RETENIDO_PARCIAL: TFloatField;
     QMRCV_VENTAIVA_NO_RETENIDO: TFloatField;
     QMRCV_VENTAIVA_PROPIO: TFloatField;
     QMRCV_VENTAIVA_TERCEROS: TFloatField;
     QMRCV_VENTARUT_EMISOR_LIQUID_FACTURA: TFIBStringField;
     QMRCV_VENTANETO_COMISION_LIQUID_FACTURA: TFloatField;
     QMRCV_VENTAEXENTO_COMISION_LIQUID_FACTURA: TFloatField;
     QMRCV_VENTAIVA_COMISION_LIQUID_FACTURA: TFloatField;
     QMRCV_VENTAIVA_FUERA_DE_PLAZO: TFloatField;
     QMRCV_VENTATIPO_DOCTO_REFERENCIA: TFIBStringField;
     QMRCV_VENTAFOLIO_DOCTO_REFERENCIA: TIntegerField;
     QMRCV_VENTANUM_IDENT_RECEPTOR_EXTRANJERO: TFIBStringField;
     QMRCV_VENTANACIONALIDAD_RECEPTOR_EXT: TFIBStringField;
     QMRCV_VENTACREDITO_EMPRESA_CONSTRUCTORA: TFloatField;
     QMRCV_VENTAIMPTO_ZONA_FRANCA_LEY_18211: TFloatField;
     QMRCV_VENTAGARANTIA_DEP_ENVASES: TFloatField;
     QMRCV_VENTAINDICADOR_VENTA_SIN_COSTO: TFloatField;
     QMRCV_VENTAINDICADOR_SERVICIO_PERIODICO: TFloatField;
     QMRCV_VENTAMONTO_NO_FACTURABLE: TFloatField;
     QMRCV_VENTATOTAL_MONTO_PERIODO: TFloatField;
     QMRCV_VENTAVENTA_PASAJES_TRANSPORTE_NAC: TFloatField;
     QMRCV_VENTAVENTA_PASAJES_TRANSPORTE_INT: TFloatField;
     QMRCV_VENTANUMERO_INTERNO: TIntegerField;
     QMRCV_VENTACODIGO_SUCURSAL: TIntegerField;
     QMRCV_VENTANCE_O_NDE_SOBRE_FACT_DE_COM: TIntegerField;
     QMRCV_VENTACODIGO_OTRO_IMP: TIntegerField;
     QMRCV_VENTAVALOR_OTRO_IMP: TFloatField;
     QMRCV_VENTATASA_OTRO_IMP: TFloatField;
     QMRCV_VENTA_TOTAL: TFIBDataSetRO;
     DSQMRCV_VENTA_TOTAL: TDataSource;
     QMRCV_VENTA_TOTALTITULO: TFIBStringField;
     QMRCV_VENTA_TOTALTIPO_DOC: TIntegerField;
     QMRCV_VENTA_TOTALMONTO_EXENTO: TFloatField;
     QMRCV_VENTA_TOTALMONTO_NETO: TFloatField;
     QMRCV_VENTA_TOTALMONTO_IVA: TFloatField;
     QMRCV_VENTA_TOTALMONTO_TOTAL: TFloatField;
     QMDocumentos_Totales: TFIBDataSetRO;
     DSQMDocumentos_Totales: TDataSource;
     QMDocumentos_TotalesTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMDocumentos_TotalesTOTAL_A_COBRAR: TFloatField;
     QMDocumentos_TotalesLIQUIDO: TFloatField;
     QMDocumentosPERIODO: TStringField;
     QMDocumentosFECHA_DOCTO: TDateTimeField;
     QMDocumentosFECHA_RECLAMO: TDateTimeField;
     QMDocumentosMONTO_TOTAL: TFloatField;
     QMDocumentosNIF: TFIBStringField;
     QMDocumentosFOLIO: TIntegerField;
     QMDocumentosT_D_TRIB: TFIBStringField;
     QMDocumentosENVIADO_MAIL_CLIENTE: TIntegerField;
     QMDocumentosACEPTADO_CLIENTE: TIntegerField;
     QMDocumentosESTADO: TFIBStringField;
     QMDocumentosGLOSA: TFIBStringField;
     QMDocumentosERR_CODE: TFIBStringField;
     QMDocumentosGLOSA_ERR: TFIBStringField;
     QMDocumentosENVIADO_SII: TSmallintField;
     QMDocumentosCANTIDAD_ERRORES: TIntegerField;
     QMDocumentosSII_TRACKID: TFIBStringField;
     QMDocumentosESTADO_SII: TSmallintField;
     IdPOP31: TIdPOP3;
     SSL1: TIdSSLIOHandlerSocketOpenSSL;
     QMDocumentosEstadoDteCliente: TSmallintField;
     DSxAdjuntos: TDataSource;
     xAdjuntos: TFIBDataSetRO;
     QMDocumentosID_ADJUNTO_SIE: TIntegerField;
     xAdjuntosID: TIntegerField;
     xAdjuntosNOMBRE: TFIBStringField;
     QMDocumentosRECEPDTEGLOSA: TFIBStringField;
     QMDocumentosINDSERVICIO: TIntegerField;
     QMDocumentosFECHA_ENTREGA: TFIBStringField;
     QMDTE: TFIBTableSet;
     DSQMDTE: TDataSource;
     QMDTEEMPRESA: TIntegerField;
     QMDTEEJERCICIO: TIntegerField;
     QMDTECANAL: TIntegerField;
     QMDTESERIE: TFIBStringField;
     QMDTETIPO: TFIBStringField;
     QMDTERIG: TIntegerField;
     QMDTEENTRADA_FACTURACION: TIntegerField;
     QMDTEFECHA: TDateTimeField;
     QMDTECLIENTE: TIntegerField;
     QMDTETITULO: TFIBStringField;
     QMDTESU_REFERENCIA: TFIBStringField;
     QMDTEFORMA_PAGO: TFIBStringField;
     QMDTETOTAL_A_COBRAR: TFloatField;
     QMDTEMONEDA: TFIBStringField;
     QMDTETIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMDTEFOLIO: TIntegerField;
     QMDTEID_S: TIntegerField;
     QMDTEINDTRASLADO: TIntegerField;
     QMDTETPOIMPRESION: TFIBStringField;
     QMDTEID_TIPO_DESPACHO: TIntegerField;
     QMDTESII_FMA_PAGO: TIntegerField;
     QMDTECODIGO_GIRO_EMPRESA: TIntegerField;
     QMDTETERCERO: TIntegerField;
     QMDTEDIRECCION: TIntegerField;
     QMDTELIQUIDO: TFloatField;
     QMDTECODIGO_GIRO_CLIENTE: TIntegerField;
     QMDTEPERIODO: TFIBStringField;
     QMDTETITULO_PERIODO: TFIBStringField;
     QMDTEFECHA_DOCTO: TDateTimeField;
     QMDTEFECHA_RECLAMO: TDateTimeField;
     QMDTEMONTO_TOTAL: TFloatField;
     QMDTENIF: TFIBStringField;
     QMDTET_D_TRIB: TFIBStringField;
     QMDTEENVIADO_MAIL_CLIENTE: TIntegerField;
     QMDTEACEPTADO_CLIENTE: TIntegerField;
     QMDTEESTADO: TFIBStringField;
     QMDTEGLOSA: TFIBStringField;
     QMDTEERR_CODE: TFIBStringField;
     QMDTEGLOSA_ERR: TFIBStringField;
     QMDTECANTIDAD_ERRORES: TIntegerField;
     QMDTESII_TRACKID: TFIBStringField;
     QMDTEID_ADJUNTO_SIE: TIntegerField;
     QMDTERECEPDTEGLOSA: TFIBStringField;
     QMDTEINDSERVICIO: TIntegerField;
     QMDTEFECHA_ENTREGA: TFIBStringField;
     QMDocumentosMENSAJE_ERROR: TFIBStringField;
     QMDocumentosXML_DTE_RECIBIDO: TIntegerField;
     QMDocumentosXML_RESPUESTA_ENVIO: TIntegerField;
     QMDocumentosXML_GENERADO: TMemoField;
     QMDocumentosXML_RESPUESTA: TMemoField;
     QMDetalleFacturaORDEN: TIntegerField;
     QMDTETITULO_GIRO_CLIENTE: TFIBStringField;
     QMCabeceraFEChileESTADO_DOCUMENTO: TFIBStringField;
     QMCabeceraFEChileGLOSA_ESTADO_DOCUMENTO: TFIBStringField;
     QMCabeceraFEChileESTADO: TFIBStringField;
     QMCabeceraFEChileGLOSA: TFIBStringField;
     QMCabeceraFEChileERR_CODE: TFIBStringField;
     QMCabeceraFEChileGLOSA_ERR: TFIBStringField;
     QMDocumentosESTADO_DOCUMENTO: TFIBStringField;
     QMDocumentosGLOSA_ESTADO_DOCUMENTO: TFIBStringField;
     procedure DMEnviaXMLFacturasChlCreate(Sender: TObject);
     procedure QMDocumentosTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDocumentosENVIADO_SIIGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDocumentosESTADO_SIIGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDocumentosEstadoDteClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDTEAfterOpen(DataSet: TDataSet);
     procedure QMDTEBeforeClose(DataSet: TDataSet);
     procedure QMDocumentosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     DesdeRig, HastaRig, Cliente: integer;
     Serie, TipoDocTributario, Tipo, Periodo: string;
     DocumentosPendientes: boolean;

     procedure Marcar(Tipo: string; IdDoc, Marca: integer);
     procedure AsignaEstadoEnvioDte(RutReceptor, TipoDte: string; Id_s, FolioDte: integer; MontoDte: double; FechaEmisionDte: TDateTime);
     function TerceroTieneCorreo(Tercero: integer; Tipo: string): boolean;
     function VerificaSmtpDTE: boolean;
  public
     { Public declarations }
     procedure BusquedaCompleja(Serie: string);
     procedure MarcaTodas(Marca: integer);
     procedure CambiarSeleccion(aDesdeRig, aHastaRig, aCliente: integer; aSerie, aTipoDocTributario, aPeriodo: string; aTipo: integer; aDocumentosPendientes: boolean);
     procedure EnvioDteMasivo;
     procedure EnviaDte(ID_S: integer; CerrarVentana: boolean);
     procedure MarcarDocumento(Tipo: string; IdDoc: integer);
     procedure PosicionarFolioDocumentos(Folio: integer);
     procedure PosicionarFolioRCVVenta(Folio: integer);
     procedure AsignaFolioADocumento(IdDoc: integer);
     function ExisteDatosFEChile(IdDoc: integer): boolean;
     procedure InsertaDatosFEChile(IdDoc: integer);
     procedure DameDatosDocVenta(IdS: integer; var Serie, Tipo: string; var Rig: integer; var Cliente: integer);
     procedure InsertaRCV_VENTA(aTIPO_DOC: string; aFOLIO: integer);
     procedure ImportarCSV(Archivo: string);
     function XmlAcuseReciboDte(Fichero: string; ID_Adjunto_SIE: integer): boolean;
     function XmlDocumentoEstadoCliente(Fichero: string; ID_Adjunto_SIE: integer): boolean;
     function XmlDteProveedor(Fichero: string; ID_Adjunto_SIE: integer): boolean;
     function HayDetalle: boolean;
     procedure AbreMensaje;
     procedure AsignaEstado;
     procedure AbreXmlDTE;
     procedure AbreXmlRespuestaEnvio;
     function LimpiaFolioProcesado(Empresa, Canal: integer; Serie, Tipo: string; Folio, IdS: integer; TipoDocTributario: string): boolean;
     procedure EnviaConsultaDocumentoSII;
     procedure EnviaConsultaMasivaDocumentoSII;
  end;

var
  DMEnviaXMLFacturasChl : TDMEnviaXMLFacturasChl;

implementation

uses UFBusca, UEntorno, UFormGest, UDMMain, UUtiles, UParam, UFacturaElectronicaCL, UDMAdjunto, DateUtils, UHojaCalc, UDMListados, IdText, UFMAdjunto,
  UDMLstFactura, UFInformacionEnvioDte, UDMLstAlbaranes, UFMain, UDMDTEChl, UDameDato;

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

function DameDato(Nodo: IXMLNode; a: array of string): string;
begin
  Result := '';

  Nodo := DameNodo(Nodo, a);

  // Si encuentro el nodo, obtengo el texto
  if Assigned(Nodo) then
     Result := Nodo.Text
  else
     Result := '';
end;

procedure TDMEnviaXMLFacturasChl.DMEnviaXMLFacturasChlCreate(Sender: TObject);
var
  MascaraMoneda : string;
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // QMFacturasTOTAL_A_COBRAR.displayFormat := MascaraN;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DesdeRig := 0;
  HastaRig := 0;
  Cliente := 0;
  Serie := '';
  TipoDocTributario := '';
  Tipo := '';
  Periodo := '';
  DocumentosPendientes := True;

  MascaraMoneda := DMMain.MascaraMoneda(REntorno.Moneda);
  with QMDocumentos do
  begin
     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TFloatField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraMoneda;
        if (Fields[i] is TIntegerField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraI;
        if (Fields[i] is TDateTimeField) then
           TFloatField(Fields[i]).DisplayFormat := ShortDateFormat;
     end;
  end;

  with QMDTE do
  begin
     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TFloatField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraMoneda;
        if (Fields[i] is TIntegerField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraI;
        if (Fields[i] is TDateTimeField) then
           TFloatField(Fields[i]).DisplayFormat := ShortDateFormat;
     end;
  end;

  with QMRCV_VENTA do
  begin
     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TFloatField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraMoneda;
        if (Fields[i] is TIntegerField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraI;
        if (Fields[i] is TDateTimeField) then
           TFloatField(Fields[i]).DisplayFormat := ShortDateFormat;
     end;
  end;

  QMRCV_VENTAFECHA_RECEPCION.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMRCV_VENTAFECHA_ACUSE_RECIBO.DisplayFormat := ShortDateFormat + ' hh:nn';
end;

procedure TDMEnviaXMLFacturasChl.DataModuleDestroy(Sender: TObject);
begin
  // Desmarco documentos antes de salir
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_CABECERAS_S_ALB ');
        SQL.Add(' SET ENTRADA_FACTURACION = 0 ');
        SQL.Add(' WHERE ENTRADA_FACTURACION = :ENTRADA_FACTURACION ');
        Params.ByName['ENTRADA_FACTURACION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Close;
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
        SQL.Add(' UPDATE GES_CABECERAS_S_FAC ');
        SQL.Add(' SET ENTRADA_FACTURACION = 0 ');
        SQL.Add(' WHERE ENTRADA_FACTURACION = :ENTRADA_FACTURACION ');
        Params.ByName['ENTRADA_FACTURACION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.Marcar(Tipo: string; IdDoc, Marca: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ('UPDATE ');

        if (Tipo = 'FAC') then
           SQL.Add('GES_CABECERAS_S_FAC ')
        else if (Tipo = 'ALB') then
           SQL.Add('GES_CABECERAS_S_ALB ');

        SQL.Add('SET ENTRADA_FACTURACION = :ENTRADA_FACTURACION ');
        SQL.Add('WHERE ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := IdDoc;
        Params.ByName['ENTRADA_FACTURACION'].AsInteger := Marca;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.MarcaTodas(Marca: integer);
var
  IdS : integer;
begin
  IdS := QMDocumentos.FieldByName('ID_S').AsInteger;
  with QMDocumentos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (QMDocumentos.FieldByName('ENTRADA_FACTURACION').AsInteger <> Marca) then
              Marcar(QMDocumentos.FieldByName('TIPO').AsString, QMDocumentos.FieldByName('ID_S').AsInteger, Marca);

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  Refrescar(QMDocumentos, 'ID_S', IdS);
end;

procedure TDMEnviaXMLFacturasChl.BusquedaCompleja(Serie: string);
var
  Orden : string;
begin
  with QMDocumentos do
  begin
     Close;
     if TFBusca.Create(Self).SeleccionaBusqueda(QMDocumentos, '11100', False) = mrOk then
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
        begin
           SelectSQL.Add(' AND TIPO = ''FAC'' ');
        end;
        Ordenar(Orden);
     end
     else
        CambiarSeleccion(0, 0, 0, Serie, '', '', 0, DocumentosPendientes);

     Open;
  end;
end;

procedure TDMEnviaXMLFacturasChl.CambiarSeleccion(aDesdeRig, aHastaRig, aCliente: integer; aSerie, aTipoDocTributario, aPeriodo: string; aTipo: integer; aDocumentosPendientes: boolean);
begin
  DesdeRig := aDesdeRig;
  HastaRig := aHastaRig;
  Cliente := aCliente;
  Serie := aSerie;
  TipoDocTributario := aTipoDocTributario;
  Periodo := Copy(aPeriodo, 1, 2);
  case aTipo of
     1: Tipo := 'ALB';
     2: Tipo := 'FAC';
     else
        Tipo := '';
  end;
  DocumentosPendientes := aDocumentosPendientes;

  with QMRCV_VENTA do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM RCV_VENTA ');
        Add(' WHERE ');
        Add(' EMPRESA = :EMPRESA ');
        if (Periodo <> '') then
        begin
           Add(' AND  ');
           Add(' FECHA_DOCTO BETWEEN (SELECT DESDE ');
           Add('                      FROM EMP_PERIODOS ');
           Add('                      WHERE ');
           Add('                      EMPRESA = :EMPRESA AND ');
           Add('                      EJERCICIO = :EJERCICIO AND ');
           Add('                      PERIODO = :PERIODO AND ');
           Add('                      TIPO = 1) AND ');
           Add('                     (SELECT HASTA ');
           Add('                      FROM EMP_PERIODOS ');
           Add('                      WHERE ');
           Add('                      EMPRESA = :EMPRESA AND ');
           Add('                      EJERCICIO = :EJERCICIO AND ');
           Add('                      PERIODO = :PERIODO AND ');
           Add('                      TIPO = 1) ');
        end;
        Add(' ORDER BY TIPO_DOC, FOLIO ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (Periodo <> '') then
     begin
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['PERIODO'].AsString := Periodo;
     end;

     Open;
  end;

  with QMDocumentos do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM (SELECT A.EMPRESA, A.EJERCICIO, A.CANAL, A.SERIE, A.TIPO, A.RIG, A.ENTRADA_FACTURACION, A.FECHA, A.CLIENTE, ');
        Add(' A.TITULO, A.SU_REFERENCIA, A.FORMA_PAGO, A.TOTAL_A_COBRAR, A.MONEDA, A.TIPO_DOC_TRIBUTARIO, A.FOLIO, ');
        Add(' A.ID_S, 0 AS INDSERVICIO, '''' AS FECHA_ENTREGA, A.INDTRASLADO AS INDTRASLADO, ');
        Add(' A.TPOIMPRESION AS TPOIMPRESION, A.ID_TIPO_DESPACHO, A.SII_FMA_PAGO, A.CODIGO_GIRO_EMPRESA, A.TERCERO, ');
        Add(' A.DIRECCION, A.LIQUIDO, A.CODIGO_GIRO_CLIENTE, P.PERIODO, P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, ');
        Add(' V.FECHA_RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, FE.CANTIDAD_ERRORES, FE.SII_TRACKID, ');
        Add(' FE.XML_GENERADO, FE.XML_RESPUESTA, FE.ESTADO, FE.GLOSA, ');
        Add(' FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ERR_CODE, FE.GLOSA_ERR, FE.ID_ADJUNTO_SIE, ');
        Add(' FE.RECEPDTEGLOSA, FE.MENSAJE_ERROR, FE.ESTADO_DOCUMENTO, FE.GLOSA_ESTADO_DOCUMENTO ');
        Add(' FROM VER_CABECERAS_ALBARAN A ');
        Add(' JOIN EMP_PERIODOS P ON A.EMPRESA = P.EMPRESA AND A.EJERCICIO = P.EJERCICIO AND A.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1 ');
        Add(' LEFT JOIN RCV_VENTA V ON A.EMPRESA = V.EMPRESA AND A.TIPO_DOC_TRIBUTARIO = V.TIPO_DOC AND A.FOLIO = V.FOLIO ');
        Add(' LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = A.TERCERO) ');
        Add(' LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (A.TIPO_DOC_TRIBUTARIO = TDT.CODIGO) ');
        Add(' LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = A.ID_S) ');
        Add(' WHERE ');
        Add(' A.EMPRESA = :EMPRESA AND ');
        Add(' A.EJERCICIO = :EJERCICIO AND ');
        Add(' A.CANAL = :CANAL AND ');
        Add(' ((A.TIPO = :TIPO) OR (CAST(:TIPO AS VARCHAR(3)) = '''')) AND ');
        Add(' A.TIPO <> ''DES'' AND ');
        Add(' A.TIPO_DOC_TRIBUTARIO NOT IN(''48'') ');
        if DocumentosPendientes then
           Add(' AND A.FOLIO = 0 ');
        if (Serie <> '') then
           Add(' AND A.SERIE = :SERIE ');
        if (DesdeRig <> 0) then
           Add(' AND A.RIG >= :DESDE_RIG ');
        if (HastaRig <> 0) then
           Add(' AND A.RIG <= :HASTA_RIG ');
        if (TipoDocTributario <> '') then
           Add(' AND A.TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');
        if (Cliente <> 0) then
           Add(' AND A.CLIENTE = :CLIENTE ');
        if (Periodo <> '') then
           Add(' AND P.PERIODO = :PERIODO ');

        Add(' UNION ');

        Add(' SELECT F.EMPRESA, F.EJERCICIO, F.CANAL, F.SERIE, F.TIPO, F.RIG, F.ENTRADA_FACTURACION, F.FECHA, F.CLIENTE, ');
        Add(' F.TITULO, F.SU_REFERENCIA, F.FORMA_PAGO, F.TOTAL_A_COBRAR, F.MONEDA, F.TIPO_DOC_TRIBUTARIO, F.FOLIO, ');
        Add(' F.ID_S, F.INDSERVICIO, F.FECHA_ENTREGA, 0 AS INDTRASLADO, CAST('''' AS VARCHAR(10)) AS TPOIMPRESION, ');
        Add(' F.ID_TIPO_DESPACHO, F.SII_FMA_PAGO, F.CODIGO_GIRO_EMPRESA, F.TERCERO, F.DIRECCION, F.LIQUIDO, ');
        Add(' F.CODIGO_GIRO_CLIENTE, P.PERIODO, P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_RECLAMO, ');
        Add(' V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.XML_GENERADO, ');
        Add(' FE.XML_RESPUESTA, FE.ESTADO, FE.GLOSA, ');
        Add(' FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ERR_CODE, FE.GLOSA_ERR, FE.ID_ADJUNTO_SIE, ');
        Add(' FE.RECEPDTEGLOSA, FE.MENSAJE_ERROR, FE.ESTADO_DOCUMENTO, FE.GLOSA_ESTADO_DOCUMENTO ');
        Add(' FROM VER_CABECERAS_FACTURA F ');
        Add(' JOIN EMP_PERIODOS P ON F.EMPRESA = P.EMPRESA AND F.EJERCICIO = P.EJERCICIO AND F.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1 ');
        Add(' LEFT JOIN RCV_VENTA V ON F.EMPRESA = V.EMPRESA AND F.TIPO_DOC_TRIBUTARIO = V.TIPO_DOC AND F.FOLIO = V.FOLIO ');
        Add(' LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = F.TERCERO) ');
        Add(' LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (F.TIPO_DOC_TRIBUTARIO = TDT.CODIGO) ');
        Add(' LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = F.ID_S) ');
        Add(' WHERE ');
        Add(' F.EMPRESA = :EMPRESA AND ');
        Add(' F.EJERCICIO = :EJERCICIO AND ');
        Add(' F.CANAL = :CANAL AND ');
        Add(' ((F.TIPO = :TIPO) OR (CAST(:TIPO AS VARCHAR(3)) = '''')) AND ');
        Add(' F.TIPO <> ''DES'' AND ');
        Add(' F.TIPO_DOC_TRIBUTARIO NOT IN(''48'') ');

        if DocumentosPendientes then
           Add(' AND F.FOLIO = 0 AND F.ESTADO = 5 ')
        else
           Add(' AND F.FOLIO > 0 ');

        if (Serie <> '') then
           Add(' AND F.SERIE = :SERIE ');
        if (DesdeRig <> 0) then
           Add(' AND F.RIG >= :DESDE_RIG ');
        if (HastaRig <> 0) then
           Add(' AND F.RIG <= :HASTA_RIG ');
        if (TipoDocTributario <> '') then
           Add(' AND F.TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');
        if (Cliente <> 0) then
           Add(' AND F.CLIENTE = :CLIENTE ');
        if (Periodo <> '') then
           Add(' AND P.PERIODO = :PERIODO ');

        Add(' ) ');
        Add(' ORDER BY EJERCICIO, SERIE, TIPO, RIG ');

        {$IFDEF Debug}
        SaveToFile('C:\Documentos-DTE.sql') ;
        {$ENDIF}
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := Tipo;

     if (Periodo <> '') then
        Params.ByName['PERIODO'].AsString := Periodo;

     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;

     if (DesdeRig <> 0) then
        Params.ByName['DESDE_RIG'].AsInteger := DesdeRig;

     if (HastaRig <> 0) then
        Params.ByName['HASTA_RIG'].AsInteger := HastaRig;

     if (TipoDocTributario <> '') then
        Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTributario;

     if (Cliente <> 0) then
        Params.ByName['CLIENTE'].AsInteger := Cliente;

     Open;
  end;
end;

procedure TDMEnviaXMLFacturasChl.MarcarDocumento(Tipo: string; IdDoc: integer);
begin
  // Marcamos solo si tiene tipo de documento
  if (Tipo > '') then
     Marcar(Tipo, IdDoc, REntorno.Entrada);
end;

procedure TDMEnviaXMLFacturasChl.PosicionarFolioDocumentos(Folio: integer);
begin
  Posicionar(QMDocumentos, 'FOLIO', Folio);
end;

procedure TDMEnviaXMLFacturasChl.PosicionarFolioRCVVenta(Folio: integer);
begin
  Posicionar(QMRCV_VENTA, 'FOLIO', Folio);
end;

procedure TDMEnviaXMLFacturasChl.AsignaFolioADocumento(IdDoc: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CABECERA_ASIGNA_FOLIO(:ID_S)';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMEnviaXMLFacturasChl.ExisteDatosFEChile(IdDoc: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.InsertaDatosFEChile(IdDoc: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INSERTA_DATOS_FE_CL(?ID_S)';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.QMDocumentosTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDocumentos.FieldByName('MONEDA').AsString, 1),
     QMDocumentos.FieldByName('TOTAL_A_COBRAR').AsFloat);
end;

procedure TDMEnviaXMLFacturasChl.DameDatosDocVenta(IdS: integer; var Serie: string; var Tipo: string; var Rig: integer; var Cliente: integer);
begin
  if (IdS > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT SERIE, TIPO, RIG, CLIENTE FROM GES_CABECERAS_S WHERE ID_S = :ID_S ');
           Params.ByName['ID_S'].AsInteger := IdS;
           ExecQuery;
           Serie := FieldByName['SERIE'].AsString;
           Tipo := FieldByName['TIPO'].AsString;
           Rig := FieldByName['RIG'].AsInteger;
           Cliente := FieldByName['CLIENTE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.InsertaRCV_VENTA(aTIPO_DOC: string; aFOLIO: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO RCV_VENTA ( ');
        SQL.Add('  EMPRESA, TIPO_DOC, TIPO_VENTA, RUT_CLIENTE, RAZON_SOCIAL, FOLIO, FECHA_DOCTO, FECHA_RECEPCION, FECHA_ACUSE_RECIBO, ');
        SQL.Add('  FECHA_RECLAMO, MONTO_EXENTO, MONTO_NETO, MONTO_IVA, MONTO_TOTAL, IVA_RETENIDO_TOTAL, IVA_RETENIDO_PARCIAL, ');
        SQL.Add('  IVA_NO_RETENIDO, IVA_PROPIO, IVA_TERCEROS, RUT_EMISOR_LIQUID_FACTURA, NETO_COMISION_LIQUID_FACTURA, ');
        SQL.Add('  EXENTO_COMISION_LIQUID_FACTURA, IVA_COMISION_LIQUID_FACTURA, IVA_FUERA_DE_PLAZO, TIPO_DOCTO_REFERENCIA, ');
        SQL.Add('  FOLIO_DOCTO_REFERENCIA, NUM_IDENT_RECEPTOR_EXTRANJERO, NACIONALIDAD_RECEPTOR_EXT, CREDITO_EMPRESA_CONSTRUCTORA, ');
        SQL.Add('  IMPTO_ZONA_FRANCA_LEY_18211, GARANTIA_DEP_ENVASES, INDICADOR_VENTA_SIN_COSTO, INDICADOR_SERVICIO_PERIODICO, ');
        SQL.Add('  MONTO_NO_FACTURABLE, TOTAL_MONTO_PERIODO, VENTA_PASAJES_TRANSPORTE_NAC, VENTA_PASAJES_TRANSPORTE_INT, NUMERO_INTERNO, ');
        SQL.Add('  CODIGO_SUCURSAL, NCE_O_NDE_SOBRE_FACT_DE_COM, CODIGO_OTRO_IMP, VALOR_OTRO_IMP, TASA_OTRO_IMP) ');
        SQL.Add(' VALUES ( ');
        SQL.Add('  :EMPRESA, :TIPO_DOC, :TIPO_VENTA, :RUT_CLIENTE, :RAZON_SOCIAL, :FOLIO, :FECHA_DOCTO, :FECHA_RECEPCION, ');
        SQL.Add('  :FECHA_ACUSE_RECIBO, :FECHA_RECLAMO, :MONTO_EXENTO, :MONTO_NETO, :MONTO_IVA, :MONTO_TOTAL, :IVA_RETENIDO_TOTAL, ');
        SQL.Add('  :IVA_RETENIDO_PARCIAL, :IVA_NO_RETENIDO, :IVA_PROPIO, :IVA_TERCEROS, :RUT_EMISOR_LIQUID_FACTURA, ');
        SQL.Add('  :NETO_COMISION_LIQUID_FACTURA, :EXENTO_COMISION_LIQUID_FACTURA, :IVA_COMISION_LIQUID_FACTURA, :IVA_FUERA_DE_PLAZO, ');
        SQL.Add('  :TIPO_DOCTO_REFERENCIA, :FOLIO_DOCTO_REFERENCIA, :NUM_IDENT_RECEPTOR_EXTRANJERO, :NACIONALIDAD_RECEPTOR_EXT, ');
        SQL.Add('  :CREDITO_EMPRESA_CONSTRUCTORA, :IMPTO_ZONA_FRANCA_LEY_18211, :GARANTIA_DEP_ENVASES, :INDICADOR_VENTA_SIN_COSTO, ');
        SQL.Add('  :INDICADOR_SERVICIO_PERIODICO, :MONTO_NO_FACTURABLE, :TOTAL_MONTO_PERIODO, :VENTA_PASAJES_TRANSPORTE_NAC, ');
        SQL.Add('  :VENTA_PASAJES_TRANSPORTE_INT, :NUMERO_INTERNO, :CODIGO_SUCURSAL, :NCE_O_NDE_SOBRE_FACT_DE_COM, :CODIGO_OTRO_IMP, ');
        SQL.Add('  :VALOR_OTRO_IMP, :TASA_OTRO_IMP) ');
        SQL.Add(' MATCHING (EMPRESA, TIPO_DOC, FOLIO) ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO_DOC'].AsString := aTIPO_DOC;
        Params.ByName['FOLIO'].AsInteger := aFOLIO;

        Params.ByName['RUT_CLIENTE'].AsString := '';
        Params.ByName['RAZON_SOCIAL'].AsString := '';
        Params.ByName['FOLIO'].AsInteger := 0;
        Params.ByName['FECHA_DOCTO'].AsDateTime := Now;
        Params.ByName['FECHA_RECEPCION'].AsDateTime := Now;
        Params.ByName['FECHA_ACUSE_RECIBO'].AsDateTime := Now;
        Params.ByName['FECHA_RECLAMO'].AsDateTime := Now;
        Params.ByName['MONTO_EXENTO'].AsFloat := 0;
        Params.ByName['MONTO_NETO'].AsFloat := 0;
        Params.ByName['MONTO_IVA'].AsFloat := 0;
        Params.ByName['MONTO_TOTAL'].AsFloat := 0;
        Params.ByName['IVA_RETENIDO_TOTAL'].AsFloat := 0;
        Params.ByName['IVA_RETENIDO_PARCIAL'].AsFloat := 0;
        Params.ByName['IVA_NO_RETENIDO'].AsFloat := 0;
        Params.ByName['IVA_PROPIO'].AsFloat := 0;
        Params.ByName['IVA_TERCEROS'].AsFloat := 0;
        Params.ByName['RUT_EMISOR_LIQUID_FACTURA'].AsString := '';
        Params.ByName['NETO_COMISION_LIQUID_FACTURA'].AsFloat := 0;
        Params.ByName['EXENTO_COMISION_LIQUID_FACTURA'].AsFloat := 0;
        Params.ByName['IVA_COMISION_LIQUID_FACTURA'].AsFloat := 0;
        Params.ByName['IVA_FUERA_DE_PLAZO'].AsFloat := 0;
        Params.ByName['TIPO_DOCTO_REFERENCIA'].AsString := '';
        Params.ByName['FOLIO_DOCTO_REFERENCIA'].AsInteger := 0;
        Params.ByName['NUM_IDENT_RECEPTOR_EXTRANJERO'].AsString := '';
        Params.ByName['NACIONALIDAD_RECEPTOR_EXT'].AsString := '';
        Params.ByName['CREDITO_EMPRESA_CONSTRUCTORA'].AsFloat := 0;
        Params.ByName['IMPTO_ZONA_FRANCA_LEY_18211'].AsFloat := 0;
        Params.ByName['GARANTIA_DEP_ENVASES'].AsFloat := 0;
        Params.ByName['INDICADOR_VENTA_SIN_COSTO'].AsFloat := 0;
        Params.ByName['INDICADOR_SERVICIO_PERIODICO'].AsFloat := 0;
        Params.ByName['MONTO_NO_FACTURABLE'].AsFloat := 0;
        Params.ByName['TOTAL_MONTO_PERIODO'].AsFloat := 0;
        Params.ByName['VENTA_PASAJES_TRANSPORTE_NAC'].AsFloat := 0;
        Params.ByName['VENTA_PASAJES_TRANSPORTE_INT'].AsFloat := 0;
        Params.ByName['NUMERO_INTERNO'].AsInteger := 0;
        Params.ByName['CODIGO_SUCURSAL'].AsInteger := 0;
        Params.ByName['NCE_O_NDE_SOBRE_FACT_DE_COM'].AsInteger := 0;
        Params.ByName['CODIGO_OTRO_IMP'].AsInteger := 0;
        Params.ByName['VALOR_OTRO_IMP'].AsFloat := 0;
        Params.ByName['TASA_OTRO_IMP'].AsInteger := 0;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.ImportarCSV(Archivo: string);
var
  ts : TStrings;
  i, Campo, PosicionSeparador, NroLinea : integer;
  s : string;
  Separador : string;

  function StrDD_MM_YYYY_HH_NN_SSToDateTime(s: string): TDateTime;
  var
     FechaValida : boolean;
     aux : string;
  begin
     /// 04-10-2022 15:33:15
     /// Se ignoran separadores en la parte fecha
     /// La hora puede tener 1 o dos dígitos

     FechaValida := TryEncodeDate(StrToIntDef(Copy(s, 7, 4), 0), StrToIntDef(Copy(s, 4, 2), 0), StrToIntDef(Copy(s, 1, 2), 0), Result);

     if (FechaValida) then
     begin
        if (Length(s) > 10) then
        begin
           s := Trim(Copy(s, 11, Length(s)));

           aux := Copy(s, 1, Pos(':', s) - 1);
           Result := RecodeHour(Result, StrToIntDef(aux, 0));

           s := Copy(s, Pos(':', s) + 1, Length(s));

           aux := Copy(s, 1, Pos(':', s) - 1);
           if (aux = '') then
           begin
              aux := s;
              s := '';
           end;
           Result := RecodeMinute(Result, StrToIntDef(aux, 0));

           s := Copy(s, Pos(':', s) + 1, Length(s));

           if (Length(s) > 0) then
           begin
              aux := s;
              Result := RecodeSecond(Result, StrToIntDef(aux, 0));
              Result := RecodeMilliSecond(Result, 0);
           end;
        end
        else
           RecodeTime(Result, 0, 0, 0, 0);
     end
     else
        Result := EncodeDate(1900, 1, 1);
  end;

begin
  /// Crea o modifica un registro para cada TIPO_DOC+FOLIO

  ts := TStringList.Create;
  with ts do
  begin
     try
        LoadFromFile(Archivo);

        Separador := ';';
        i := 1; // Porque la linea 0 son los nombre de los campos
        while (i < Count) do
        begin
           s := ts[i];

           // Formato:
           // Nro;Tipo Doc;Tipo Venta;Rut cliente;Razon Social;Folio;Fecha Docto;Fecha Recepcion;Fecha Acuse Recibo;Fecha Reclamo;Monto Exento;Monto Neto;Monto IVA;Monto total;IVA Retenido Total;IVA Retenido Parcial;IVA no retenido;IVA propio;IVA Terceros;RUT Emisor Liquid. Factura;Neto Comision Liquid. Factura;Exento Comision Liquid. Factura;IVA Comision Liquid. Factura;IVA fuera de plazo;Tipo Docto. Referencia;Folio Docto. Referencia;Num. Ident. Receptor Extranjero;Nacionalidad Receptor Extranjero;Credito empresa constructora;Impto. Zona Franca (Ley 18211);Garantia Dep. Envases;Indicador Venta sin Costo;Indicador Servicio Periodico;Monto No facturable;Total Monto Periodo;Venta Pasajes Transporte Nacional;Venta Pasajes Transporte Internacional;Numero Interno;Codigo Sucursal;NCE o NDE sobre Fact. de Compra;Codigo Otro Imp.;Valor Otro Imp.;Tasa Otro Imp.
           // 1;33;Del Giro;76975059-2;LOGISTICA AE SPA;11067;04-10-2022;04-10-2022 15:33;;;0;58824;11177;70001;0;0;0;0;0;-;0;0;0;0;33;11067;;;0;;0;1;0;0;70001;;;;0;;;;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO RCV_VENTA ( ');
                 SQL.Add('  EMPRESA, TIPO_DOC, TIPO_VENTA, RUT_CLIENTE, RAZON_SOCIAL, FOLIO, FECHA_DOCTO, FECHA_RECEPCION, FECHA_ACUSE_RECIBO, ');
                 SQL.Add('  FECHA_RECLAMO, MONTO_EXENTO, MONTO_NETO, MONTO_IVA, MONTO_TOTAL, IVA_RETENIDO_TOTAL, IVA_RETENIDO_PARCIAL, ');
                 SQL.Add('  IVA_NO_RETENIDO, IVA_PROPIO, IVA_TERCEROS, RUT_EMISOR_LIQUID_FACTURA, NETO_COMISION_LIQUID_FACTURA, ');
                 SQL.Add('  EXENTO_COMISION_LIQUID_FACTURA, IVA_COMISION_LIQUID_FACTURA, IVA_FUERA_DE_PLAZO, TIPO_DOCTO_REFERENCIA, ');
                 SQL.Add('  FOLIO_DOCTO_REFERENCIA, NUM_IDENT_RECEPTOR_EXTRANJERO, NACIONALIDAD_RECEPTOR_EXT, CREDITO_EMPRESA_CONSTRUCTORA, ');
                 SQL.Add('  IMPTO_ZONA_FRANCA_LEY_18211, GARANTIA_DEP_ENVASES, INDICADOR_VENTA_SIN_COSTO, INDICADOR_SERVICIO_PERIODICO, ');
                 SQL.Add('  MONTO_NO_FACTURABLE, TOTAL_MONTO_PERIODO, VENTA_PASAJES_TRANSPORTE_NAC, VENTA_PASAJES_TRANSPORTE_INT, NUMERO_INTERNO, ');
                 SQL.Add('  CODIGO_SUCURSAL, NCE_O_NDE_SOBRE_FACT_DE_COM, CODIGO_OTRO_IMP, VALOR_OTRO_IMP, TASA_OTRO_IMP) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add('  :EMPRESA, :TIPO_DOC, :TIPO_VENTA, :RUT_CLIENTE, :RAZON_SOCIAL, :FOLIO, :FECHA_DOCTO, :FECHA_RECEPCION, ');
                 SQL.Add('  :FECHA_ACUSE_RECIBO, :FECHA_RECLAMO, :MONTO_EXENTO, :MONTO_NETO, :MONTO_IVA, :MONTO_TOTAL, :IVA_RETENIDO_TOTAL, ');
                 SQL.Add('  :IVA_RETENIDO_PARCIAL, :IVA_NO_RETENIDO, :IVA_PROPIO, :IVA_TERCEROS, :RUT_EMISOR_LIQUID_FACTURA, ');
                 SQL.Add('  :NETO_COMISION_LIQUID_FACTURA, :EXENTO_COMISION_LIQUID_FACTURA, :IVA_COMISION_LIQUID_FACTURA, :IVA_FUERA_DE_PLAZO, ');
                 SQL.Add('  :TIPO_DOCTO_REFERENCIA, :FOLIO_DOCTO_REFERENCIA, :NUM_IDENT_RECEPTOR_EXTRANJERO, :NACIONALIDAD_RECEPTOR_EXT, ');
                 SQL.Add('  :CREDITO_EMPRESA_CONSTRUCTORA, :IMPTO_ZONA_FRANCA_LEY_18211, :GARANTIA_DEP_ENVASES, :INDICADOR_VENTA_SIN_COSTO, ');
                 SQL.Add('  :INDICADOR_SERVICIO_PERIODICO, :MONTO_NO_FACTURABLE, :TOTAL_MONTO_PERIODO, :VENTA_PASAJES_TRANSPORTE_NAC, ');
                 SQL.Add('  :VENTA_PASAJES_TRANSPORTE_INT, :NUMERO_INTERNO, :CODIGO_SUCURSAL, :NCE_O_NDE_SOBRE_FACT_DE_COM, :CODIGO_OTRO_IMP, ');
                 SQL.Add('  :VALOR_OTRO_IMP, :TASA_OTRO_IMP) ');
                 SQL.Add(' MATCHING (EMPRESA, TIPO_DOC, FOLIO) ');

                 // Inicializo campos
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['TIPO_DOC'].AsString := '';
                 Params.ByName['TIPO_VENTA'].AsString := '';
                 Params.ByName['FOLIO'].AsInteger := 0;
                 Params.ByName['RUT_CLIENTE'].AsString := '';
                 Params.ByName['RAZON_SOCIAL'].AsString := '';
                 Params.ByName['FOLIO'].AsInteger := 0;
                 Params.ByName['FECHA_DOCTO'].AsDateTime := Now;
                 Params.ByName['FECHA_RECEPCION'].AsDateTime := Now;
                 Params.ByName['FECHA_ACUSE_RECIBO'].AsDateTime := Now;
                 Params.ByName['FECHA_RECLAMO'].AsDateTime := Now;
                 Params.ByName['MONTO_EXENTO'].AsFloat := 0;
                 Params.ByName['MONTO_NETO'].AsFloat := 0;
                 Params.ByName['MONTO_IVA'].AsFloat := 0;
                 Params.ByName['MONTO_TOTAL'].AsFloat := 0;
                 Params.ByName['IVA_RETENIDO_TOTAL'].AsFloat := 0;
                 Params.ByName['IVA_RETENIDO_PARCIAL'].AsFloat := 0;
                 Params.ByName['IVA_NO_RETENIDO'].AsFloat := 0;
                 Params.ByName['IVA_PROPIO'].AsFloat := 0;
                 Params.ByName['IVA_TERCEROS'].AsFloat := 0;
                 Params.ByName['RUT_EMISOR_LIQUID_FACTURA'].AsString := '';
                 Params.ByName['NETO_COMISION_LIQUID_FACTURA'].AsFloat := 0;
                 Params.ByName['EXENTO_COMISION_LIQUID_FACTURA'].AsFloat := 0;
                 Params.ByName['IVA_COMISION_LIQUID_FACTURA'].AsFloat := 0;
                 Params.ByName['IVA_FUERA_DE_PLAZO'].AsFloat := 0;
                 Params.ByName['TIPO_DOCTO_REFERENCIA'].AsString := '';
                 Params.ByName['FOLIO_DOCTO_REFERENCIA'].AsInteger := 0;
                 Params.ByName['NUM_IDENT_RECEPTOR_EXTRANJERO'].AsString := '';
                 Params.ByName['NACIONALIDAD_RECEPTOR_EXT'].AsString := '';
                 Params.ByName['CREDITO_EMPRESA_CONSTRUCTORA'].AsFloat := 0;
                 Params.ByName['IMPTO_ZONA_FRANCA_LEY_18211'].AsFloat := 0;
                 Params.ByName['GARANTIA_DEP_ENVASES'].AsFloat := 0;
                 Params.ByName['INDICADOR_VENTA_SIN_COSTO'].AsFloat := 0;
                 Params.ByName['INDICADOR_SERVICIO_PERIODICO'].AsFloat := 0;
                 Params.ByName['MONTO_NO_FACTURABLE'].AsFloat := 0;
                 Params.ByName['TOTAL_MONTO_PERIODO'].AsFloat := 0;
                 Params.ByName['VENTA_PASAJES_TRANSPORTE_NAC'].AsFloat := 0;
                 Params.ByName['VENTA_PASAJES_TRANSPORTE_INT'].AsFloat := 0;
                 Params.ByName['NUMERO_INTERNO'].AsInteger := 0;
                 Params.ByName['CODIGO_SUCURSAL'].AsInteger := 0;
                 Params.ByName['NCE_O_NDE_SOBRE_FACT_DE_COM'].AsInteger := 0;
                 Params.ByName['CODIGO_OTRO_IMP'].AsInteger := 0;
                 Params.ByName['VALOR_OTRO_IMP'].AsFloat := 0;
                 Params.ByName['TASA_OTRO_IMP'].AsInteger := 0;

                 Campo := 0;
                 while (s > '') do
                 begin
                    PosicionSeparador := Pos(Separador, s);
                    if PosicionSeparador = 0 then
                       PosicionSeparador := Length(s);
                    case Campo of
                       0: NroLinea := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       1: Params.ByName['TIPO_DOC'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       2: Params.ByName['TIPO_VENTA'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       3: Params.ByName['RUT_CLIENTE'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       4: Params.ByName['RAZON_SOCIAL'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       5: Params.ByName['FOLIO'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       6: Params.ByName['FECHA_DOCTO'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       7: Params.ByName['FECHA_RECEPCION'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       8: Params.ByName['FECHA_ACUSE_RECIBO'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       9: Params.ByName['FECHA_RECLAMO'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       10: Params.ByName['MONTO_EXENTO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       11: Params.ByName['MONTO_NETO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       12: Params.ByName['MONTO_IVA'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       13: Params.ByName['MONTO_TOTAL'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       14: Params.ByName['IVA_RETENIDO_TOTAL'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       15: Params.ByName['IVA_RETENIDO_PARCIAL'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       16: Params.ByName['IVA_NO_RETENIDO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       17: Params.ByName['IVA_PROPIO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       18: Params.ByName['IVA_TERCEROS'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       19: Params.ByName['RUT_EMISOR_LIQUID_FACTURA'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       20: Params.ByName['NETO_COMISION_LIQUID_FACTURA'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       21: Params.ByName['EXENTO_COMISION_LIQUID_FACTURA'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       22: Params.ByName['IVA_COMISION_LIQUID_FACTURA'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       23: Params.ByName['IVA_FUERA_DE_PLAZO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       24: Params.ByName['TIPO_DOCTO_REFERENCIA'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       25: Params.ByName['FOLIO_DOCTO_REFERENCIA'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       26: Params.ByName['NUM_IDENT_RECEPTOR_EXTRANJERO'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       27: Params.ByName['NACIONALIDAD_RECEPTOR_EXT'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       28: Params.ByName['CREDITO_EMPRESA_CONSTRUCTORA'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       29: Params.ByName['IMPTO_ZONA_FRANCA_LEY_18211'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       30: Params.ByName['GARANTIA_DEP_ENVASES'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       31: Params.ByName['INDICADOR_VENTA_SIN_COSTO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       32: Params.ByName['INDICADOR_SERVICIO_PERIODICO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       33: Params.ByName['MONTO_NO_FACTURABLE'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       34: Params.ByName['TOTAL_MONTO_PERIODO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       35: Params.ByName['VENTA_PASAJES_TRANSPORTE_NAC'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       36: Params.ByName['VENTA_PASAJES_TRANSPORTE_INT'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       37: Params.ByName['NUMERO_INTERNO'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       38: Params.ByName['CODIGO_SUCURSAL'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       39: Params.ByName['NCE_O_NDE_SOBRE_FACT_DE_COM'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       40: Params.ByName['CODIGO_OTRO_IMP'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       41: Params.ByName['VALOR_OTRO_IMP'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       42: Params.ByName['TASA_OTRO_IMP'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                    end;

                    System.Delete(s, 1, PosicionSeparador);
                    Inc(Campo);
                 end;

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Inc(i);
        end;
     finally
        Free;
     end;
  end;
  QMRCV_VENTA.Close;
  QMRCV_VENTA.Open;

  MessageDlg(Format(_('Proceso finalizado.' + #13#10 + 'Se han recibido %d lineas.'), [i]), mtInformation, [mbOK], 0);
end;

procedure TDMEnviaXMLFacturasChl.AsignaEstadoEnvioDte(RutReceptor, TipoDte: string; Id_s, FolioDte: integer; MontoDte: double; FechaEmisionDte: TDateTime);
var
  EndpointSII_CL : string;
  Contrasenya : string;
  RutConsultante : string;
  RutCompania : string;
  DS : TFIBDataSet;
  FicheroCertificado : string;
  m, f : TStream;
  Respuesta : TStrings;
  FacturaElectronica : TFacturaElectronicaCL;
  Documento : TXMLDocument;
  Estado, GlosaEstado, Err_code, GlosaErr : string;
  Nodo : IXMLNode;
  NodoHijo : IXMLNode;
  NodoNieto : IXMLNode;
begin
  DMMain.LogIni('AsignaEstadoEnvioDTE');

  if (FolioDte > 0) then
  begin
     EndpointSII_CL := DMMain.DameUrlEndPoint('DTE');
     DMMain.Log('Obtenemos URL del SSI_Chile - ' + EndpointSII_CL);

     // Obtenemos certificado
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT FIRST 1 CERTIFICADO, CONTRASENYA, RUT FROM SII_CERTIFICADOS WHERE EMPRESA = :EMPRESA';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Open;
              Contrasenya := FieldByName('CONTRASENYA').AsString;
              RutConsultante := FieldByName('RUT').AsString;

              FicheroCertificado := DameTempPath + RutConsultante + '.p12';
              m := CreateBlobStream(FieldByName('CERTIFICADO'), bmRead);
              try
                 f := TFileStream.Create(FicheroCertificado, fmCreate);
                 try
                    f.CopyFrom(m, m.Size);
                 finally
                    f.Free;
                 end;
              finally
                 m.Free;
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

     // Obtenemos los datos de la empresa
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT TER.NIF ');
           SQL.Add('FROM SYS_EMPRESAS EMP ');
           SQL.Add('JOIN SYS_TERCEROS TER ON (EMP.TERCERO = TER.TERCERO) ');
           SQL.Add('WHERE ');
           SQL.Add('EMP.EMPRESA = :EMPRESA');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           RutCompania := FieldByName['NIF'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Respuesta := TStringList.Create;
     try
        DMMain.Log('Enviamos solicitud de estado del DTE ');
        DMMain.Log('RutConsultante=' + RutConsultante);
        DMMain.Log('password_certificado=' + Contrasenya);
        DMMain.Log('RutCompania=' + RutCompania);
        DMMain.Log('RutReceptor=' + RutReceptor);
        DMMain.Log('TipoDte=' + TipoDte);
        DMMain.Log('FolioDte=' + IntToStr(FolioDte));
        DMMain.Log('MontoDte=' + FloatToStr(MontoDte));
        DMMain.Log('FechaEmisionDte=' + FormatDateTime('dd-mm-yyyy', FechaEmisionDte));

        FacturaElectronica.ConsultaSiiChile(EndpointSII_CL + '/dameEstadoDTE.php?' +
           'RutConsultante=' + RutConsultante +
           '&password_certificado=' + Contrasenya +
           '&RutCompania=' + RutCompania +
           '&RutReceptor=' + RutReceptor +
           '&TipoDte=' + TipoDte +
           '&FolioDte=' + IntToStr(FolioDte) +
           '&MontoDte=' + FloatToStr(MontoDte) +
           '&FechaEmisionDte=' + FormatDateTime('dd-mm-yyyy', FechaEmisionDte)
           , Respuesta);

        // Guardamos en temporal Xml respuesta generado
        // Respuesta.SaveToFile(DameTempPath + 'respuesta_estado_dte.xml');

        // Recuperamos datos de respuesta DTE y los pasamos a XML
        DMMain.Log('Recuperamos datos de respuesta estado DTE y los pasamos a XML');
        Documento := TXMLDocument.Create(Self);
        try
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              DMMain.Log('Documento.Active := True');
              // Se activa para poder utilizar el componente
              Active := True;
              DMMain.Log('Documento.Encoding = utf-8');
              // Codigifacion UTF-8
              // Para Envio DTE de Chile debe ser ISO-8859-1
              Encoding := 'utf-8';

              DMMain.Log('Documento.NodeIndentStr = #8');
              // Caracter para indentar el fichero XML
              NodeIndentStr := #8;

              DMMain.Log('Obtener nodos');
              Nodo := DocumentElement;

              while Assigned(Nodo) do
              begin
                 NodoHijo := Nodo.ChildNodes.First;
                 while Assigned(NodoHijo) do
                 begin
                    NodoNieto := NodoHijo.ChildNodes.First;
                    while Assigned(NodoNieto) do
                    begin
                       if (NodoNieto.LocalName = 'ESTADO') then
                       begin
                          Estado := NodoNieto.Text;
                          DMMain.Log('Estado:' + Estado);
                       end;

                       if (NodoNieto.LocalName = 'GLOSA_ESTADO') then
                       begin
                          GlosaEstado := NodoNieto.Text;
                          DMMain.Log('GlosaEstado:' + GlosaEstado);
                       end;

                       if (NodoNieto.LocalName = 'ERR_CODE') then
                       begin
                          Err_code := NodoNieto.Text;
                          DMMain.Log('Err_code:' + Err_code);
                       end;

                       if (NodoNieto.LocalName = 'GLOSA_ERR') then
                       begin
                          GlosaErr := NodoNieto.Text;
                          DMMain.Log('GlosaErr:' + GlosaErr);
                       end;

                       NodoNieto := NodoNieto.NextSibling;
                    end;
                    NodoHijo := NodoHijo.NextSibling;
                 end;
                 Nodo := Nodo.NextSibling;
              end;
           end;
        finally
           Documento.Free;
        end;
     finally
        Respuesta.Free;
     end;

     // Asignamos estado del DTE
     DMMain.Log('Asignamos estado del DTE');
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_CABECERAS_S_FE_CHL ');
           SQL.Add(' SET ');
           SQL.Add(' ESTADO = :ESTADO, ');
           SQL.Add(' GLOSA = :GLOSA, ');
           SQL.Add(' ERR_CODE = :ERR_CODE, ');
           SQL.Add(' GLOSA_ERR = :GLOSA_ERR ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_S = :ID_S ');

           Params.ByName['ESTADO'].AsString := Estado;
           Params.ByName['GLOSA'].AsString := GlosaEstado;
           Params.ByName['ERR_CODE'].AsString := Err_code;
           Params.ByName['GLOSA_ERR'].AsString := GlosaErr;
           Params.ByName['ID_S'].AsInteger := Id_s;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     QMDocumentos.Refresh;
  end;
  DMMain.LogFin('AsignaEstadoEnvioDTE');
end;

procedure TDMEnviaXMLFacturasChl.QMDocumentosENVIADO_SIIGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((QMDocumentosCANTIDAD_ERRORES.AsInteger = 0) and (QMDocumentosSII_TRACKID.AsString > '')) then
     Text := '1'
  else
     Text := '0';
end;

procedure TDMEnviaXMLFacturasChl.QMDocumentosESTADO_SIIGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((QMDocumentosESTADO.AsString = 'DOK') and (QMDocumentosERR_CODE.AsString = '0')) then
     Text := '1'
  else
     Text := '0';
end;

function TDMEnviaXMLFacturasChl.XmlAcuseReciboDte(Fichero: string; ID_Adjunto_SIE: integer): boolean;
var
  //s : string;
  Documento : TXMLDocument;
  NodoPadre, NodoHijo : IXMLNode;
  Continua : boolean;
  Folio : integer;
  TipoDocTrib, RUTRecep : string;
begin
  DMMain.LogIni('XmlAcuseReciboDte');
  DMMain.Log('fichero: ' + Fichero + 'ID_Adjunto_SIE: ' + IntToStr(ID_Adjunto_SIE));

  // Verificamos si el Xml es sobre documento recibido
  Continua := False;
  Documento := TXMLDocument.Create(Self);
  Result := False;
  try
     with Documento do
     begin
        XML.LoadFromFile(Fichero);
        DMMain.Log('Documento.Active := True');
        // Se activa para poder utilizar el componente
        Active := True;
        DMMain.Log('Documento.Encoding = utf-8');
        // Codigifacion UTF-8
        // Para Envio DTE de Chile debe ser ISO-8859-1
        Encoding := 'utf-8';

        DMMain.Log('Documento.NodeIndentStr = #8');
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        DMMain.Log('Obtener nodos');
        NodoPadre := DocumentElement;

        NodoHijo := DameNodo(NodoPadre, ['SetRecibos', 'Recibo', 'DocumentoRecibo']);
        if Assigned(NodoHijo) then
        begin
           TipoDocTrib := DameDato(NodoHijo, ['TipoDoc']);
           Folio := StrToInt(DameDato(NodoHijo, ['Folio']));
           RUTRecep := DameDato(NodoHijo, ['RUTRecep']);

           // Asignamos el campo de acuse de recibo por el cliente
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add('UPDATE GES_CABECERAS_S_FE_CHL ');
                 SQL.Add('SET ');
                 SQL.Add('ENVIADO_MAIL_CLIENTE = 1, ');
                 SQL.Add('ID_ADJUNTO_SIE = :ID_ADJUNTO_SIE ');
                 SQL.Add('WHERE ');
                 SQL.Add('TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                 SQL.Add('FOLIO = :FOLIO AND ');
                 SQL.Add('RUTRECEP = :RUT_RECEPTOR ');

                 Params.ByName['ID_ADJUNTO_SIE'].AsInteger := ID_Adjunto_SIE;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTrib;
                 Params.ByName['FOLIO'].AsInteger := Folio;
                 Params.ByName['RUT_RECEPTOR'].AsString := RUTRecep;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Result := True;
        end;
     end;
  finally
     Documento.Free;
  end;
  DMMain.LogFin('XmlAcuseReciboDte');
end;

function TDMEnviaXMLFacturasChl.XmlDocumentoEstadoCliente(Fichero: string; ID_Adjunto_SIE: integer): boolean;
var
  //s : string;
  Documento : TXMLDocument;
  NodoPadre, NodoHijo : IXMLNode;
  //Continua : boolean;
  Folio, EstadoRecepDTE : integer;
  TipoDocTrib, RUTRecep, RecepDteGlosa : string;
begin
  DMMain.LogIni('XmlDocumentoEstadoCliente');
  DMMain.Log('fichero: ' + Fichero + 'ID_Adjunto_SIE: ' + IntToStr(ID_Adjunto_SIE));

  // Verificamos si el Xml es sobre el estado del documento asignado por el cliente
  Result := False;

  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        XML.LoadFromFile(Fichero);
        DMMain.Log('Documento.Active := True');
        // Se activa para poder utilizar el componente
        Active := True;
        DMMain.Log('Documento.Encoding = utf-8');
        // Codigifacion UTF-8
        // Para Envio DTE de Chile debe ser ISO-8859-1
        Encoding := 'utf-8';

        DMMain.Log('Documento.NodeIndentStr = #8');
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        DMMain.Log('Obtener nodos');
        NodoPadre := DocumentElement;

        NodoHijo := DameNodo(NodoPadre, ['Resultado', 'RecepcionEnvio', 'RecepcionDTE']);
        if Assigned(NodoHijo) then
        begin
           TipoDocTrib := DameDato(NodoHijo, ['TipoDTE']);
           Folio := StrToInt(DameDato(NodoHijo, ['Folio']));
           RUTRecep := DameDato(NodoHijo, ['RUTRecep']);
           EstadoRecepDTE := StrToInt(DameDato(NodoHijo, ['EstadoRecepDTE']));
           RecepDteGlosa := DameDato(NodoHijo, ['RecepDTEGlosa']);

           // Asignamos el campo de Estado de documento cliente
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add('UPDATE GES_CABECERAS_S_FE_CHL ');
                 SQL.Add('SET ');
                 SQL.Add('ACEPTADO_CLIENTE = :ACEPTADO_CLIENTE, ');
                 SQL.Add('RECEPDTEGLOSA = :RECEPDTEGLOSA, ');
                 SQL.Add('ID_ADJUNTO_SIE = :ID_ADJUNTO_SIE ');
                 SQL.Add('WHERE ');
                 SQL.Add('TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                 SQL.Add('FOLIO = :FOLIO AND ');
                 SQL.Add('RUTRECEP = :RUT_RECEPTOR ');

                 Params.ByName['ID_ADJUNTO_SIE'].AsInteger := ID_Adjunto_SIE;
                 Params.ByName['ACEPTADO_CLIENTE'].AsInteger := EstadoRecepDTE;
                 Params.ByName['RECEPDTEGLOSA'].AsString := RecepDteGlosa;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTrib;
                 Params.ByName['FOLIO'].AsInteger := Folio;
                 Params.ByName['RUT_RECEPTOR'].AsString := RUTRecep;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Result := True;
        end;
     end;
  finally
     Documento.Free;
  end;
  DMMain.LogFin('XmlDocumentoEstadoCliente');
end;

function TDMEnviaXMLFacturasChl.XmlDteProveedor(Fichero: string; ID_Adjunto_SIE: integer): boolean;
var
  //s : string;
  Documento : TXMLDocument;
  NodoPadre, NodoHijo : IXMLNode;
  //Continua : boolean;
  //EstadoRecepDTE : integer;
  TipoDocTrib, RUTEmisor, FchEmis : string;
  FechaEmision : TDateTime;
  Folio : string;
begin
  DMMain.LogIni('XmlDteProveedor');
  DMMain.Log('fichero: ' + Fichero + 'ID_Adjunto_SIE: ' + IntToStr(ID_Adjunto_SIE));

  // Verificamos si el Xml es sobre el estado del documento asignado por el cliente
  Result := False;

  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        XML.LoadFromFile(Fichero);
        DMMain.Log('Documento.Active := True');
        // Se activa para poder utilizar el componente
        Active := True;
        DMMain.Log('Documento.Encoding = utf-8');
        // Codigifacion UTF-8
        // Para Envio DTE de Chile debe ser ISO-8859-1
        Encoding := 'utf-8';

        DMMain.Log('Documento.NodeIndentStr = #8');
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        DMMain.Log('Obtener nodos');
        NodoPadre := DocumentElement;

        NodoHijo := DameNodo(NodoPadre, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc']);
        if Assigned(NodoHijo) then
        begin
           TipoDocTrib := DameDato(NodoHijo, ['TipoDTE']);
           Folio := DameDato(NodoHijo, ['Folio']);
           FchEmis := DameDato(NodoHijo, ['FchEmis']);
           FechaEmision := StrToDateTime(Copy(FchEmis, 9, Length(FchEmis)) + '/' + Copy(FchEmis, 6, Length(FchEmis) - 8) + '/' + Copy(FchEmis, 0, Length(FchEmis) - 6));

           NodoHijo := DameNodo(NodoPadre, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor']);
           if Assigned(NodoHijo) then
           begin
              RUTEmisor := DameDato(NodoHijo, ['RUTEmisor']);

              // Insertamos o creamos registro de factura de compra
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO RCV_COMPRA( ');
                    SQL.Add('  EMPRESA, RUT_PROVEEDOR, TIPO_DOC, FOLIO, FECHA_DOCTO, ID_ADJUNTO_SIE ');
                    {
                    SQL.Add('  , TIPO_COMPRA, RAZON_SOCIAL, FECHA_RECEPCION, FECHA_ACUSE, ');
                    SQL.Add('  MONTO_EXENTO, MONTO_NETO, MONTO_IVA_RECUPERABLE, MONTO_IVA_NO_RECUPERABLE, CODIGO_IVA_NO_RECUPERABLE,  MONTO_TOTAL, ');
                    SQL.Add('  MONTO_NETO_ACTIVO_FIJO, IVA_ACTIVO_FIJO, IVA_USO_COMUN, IMPUESTO_SIN_DERECHO_CREDITO, ');
                    SQL.Add('  IVA_NO_RETENIDO, TABACOS_PUROS, TABACOS_SIGARRILLOS, TABACOS_ELABORADOS, NCE_NDE_FACTURA_COMPRA, ');
                    SQL.Add('  CODIGO_OTRO, VALOR_OTRO_IMP, TASA_OTRO_IMP ');
                    }
                    SQL.Add(' ) VALUES ( ');
                    SQL.Add('  :EMPRESA, :RUT_PROVEEDOR, :TIPO_DOC, :FOLIO, :FECHA_DOCTO, :ID_ADJUNTO_SIE ');
                    {
                    SQL.Add('  :TIPO_COMPRA, :RAZON_SOCIAL, :FECHA_RECEPCION, :FECHA_ACUSE, ');
                    SQL.Add('  :MONTO_EXENTO, :MONTO_NETO, :MONTO_IVA_RECUPERABLE, :MONTO_IVA_NO_RECUPERABLE, :CODIGO_IVA_NO_RECUPERABLE,  :MONTO_TOTAL, ');
                    SQL.Add('  :MONTO_NETO_ACTIVO_FIJO, :IVA_ACTIVO_FIJO, :IVA_USO_COMUN, :IMPUESTO_SIN_DERECHO_CREDITO, ');
                    SQL.Add('  :IVA_NO_RETENIDO, :TABACOS_PUROS, :TABACOS_SIGARRILLOS, :TABACOS_ELABORADOS, :NCE_NDE_FACTURA_COMPRA, ');
                    SQL.Add('  :CODIGO_OTRO, :VALOR_OTRO_IMP, :TASA_OTRO_IMP ');
                    }
                    SQL.Add(' ) MATCHING (EMPRESA, RUT_PROVEEDOR, TIPO_DOC, FOLIO) ');

                    // Inicializo campos
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['TIPO_DOC'].AsString := TipoDocTrib;
                    Params.ByName['RUT_PROVEEDOR'].AsString := RUTEmisor;
                    Params.ByName['FOLIO'].AsString := Folio;
                    Params.ByName['FECHA_DOCTO'].AsDateTime := FechaEmision;
                    Params.ByName['ID_ADJUNTO_SIE'].AsInteger := ID_Adjunto_SIE;
                    {
                    Params.ByName['TIPO_COMPRA'].AsString := '';
                    Params.ByName['RAZON_SOCIAL'].AsString := '';
                    Params.ByName['FECHA_DOCTO'].AsDateTime := FechaEmision;
                    Params.ByName['FECHA_RECEPCION'].AsDateTime := Now;
                    Params.ByName['FECHA_ACUSE'].AsDateTime := Now;
                    Params.ByName['MONTO_EXENTO'].AsFloat := 0;
                    Params.ByName['MONTO_NETO'].AsFloat := 0;
                    Params.ByName['MONTO_IVA_RECUPERABLE'].AsFloat := 0;
                    Params.ByName['MONTO_IVA_NO_RECUPERABLE'].AsFloat := 0;
                    Params.ByName['CODIGO_IVA_NO_RECUPERABLE'].AsFloat := 0;
                    Params.ByName['MONTO_TOTAL'].AsFloat := 0;
                    Params.ByName['MONTO_NETO_ACTIVO_FIJO'].AsFloat := 0;
                    Params.ByName['IVA_ACTIVO_FIJO'].AsFloat := 0;
                    Params.ByName['IVA_USO_COMUN'].AsFloat := 0;
                    Params.ByName['IMPUESTO_SIN_DERECHO_CREDITO'].AsFloat := 0;
                    Params.ByName['IVA_NO_RETENIDO'].AsFloat := 0;
                    Params.ByName['TABACOS_PUROS'].AsFloat := 0;
                    Params.ByName['TABACOS_SIGARRILLOS'].AsFloat := 0;
                    Params.ByName['TABACOS_ELABORADOS'].AsFloat := 0;
                    Params.ByName['NCE_NDE_FACTURA_COMPRA'].AsFloat := 0;
                    Params.ByName['CODIGO_OTRO'].AsFloat := 0;
                    Params.ByName['VALOR_OTRO_IMP'].AsFloat := 0;
                    Params.ByName['TASA_OTRO_IMP'].AsInteger := 0;
                    }
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Result := True;
           end;
        end;
     end;
  finally
     Documento.Free;
  end;
  DMMain.LogFin('XmlDteProveedor');
end;

procedure TDMEnviaXMLFacturasChl.QMDocumentosEstadoDteClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((QMDocumentosACEPTADO_CLIENTE.AsInteger = 0) and (QMDocumentosRECEPDTEGLOSA.AsString > '')) then
     Text := 'Aceptado'
  else
  if ((QMDocumentosACEPTADO_CLIENTE.AsInteger = 1) and (QMDocumentosRECEPDTEGLOSA.AsString > '')) then
     Text := 'Aceptado con reparo'
  else
  if ((QMDocumentosACEPTADO_CLIENTE.AsInteger = 2) and (QMDocumentosRECEPDTEGLOSA.AsString > '')) then
     Text := 'DTE Rechazado'
  else
     Text := '';
end;

function TDMEnviaXMLFacturasChl.HayDetalle: boolean;
begin
  Result := (QMDocumentos.RecordCount > 0);
end;

procedure TDMEnviaXMLFacturasChl.AbreMensaje;
begin
  with xAdjuntos do
  begin
     First;
     while not EOF do
     begin
        if (QMDocumentosID_ADJUNTO_SIE.AsInteger > 0) then
        begin
           if (UpperCase(ExtractFileExt(xAdjuntosNOMBRE.AsString)) = UpperCase('.HTML')) then
           begin
              FMain.MuestraAdunto('SIE', QMDocumentosID_ADJUNTO_SIE.AsInteger);
           end;
        end;

        Next;
     end;
  end;
end;

procedure TDMEnviaXmlFacturasChl.AsignaEstado;
begin
  with QMDocumentos do
  begin
     First;
     while not EOF do
     begin
        if (QMDocumentosERR_CODE.AsString = '') then
           AsignaEstadoEnvioDte(QMDocumentosNIF.AsString, QMDocumentosTIPO_DOC_TRIBUTARIO.AsString, QMDocumentosID_S.AsInteger, QMDocumentosFOLIO.AsInteger, QMDocumentosTOTAL_A_COBRAR.AsFloat, QMDocumentosFECHA.AsDateTime);
        Next;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.EnviaDte(ID_S: integer; CerrarVentana: boolean);
var
  FacturaElectronica : TFacturaElectronicaCL;
  IdDoc : integer;
  Vencimiento : TDateTime;
  Liquido : double;
  MedioPago : string;
  RUTEmisor : string;
  RazonSocial : string;
  GiroEmisor : string;
  RUTReceptor : string;
  RazonSocialReceptor : string;
  GiroReceptor : string;
  Pais_receptor : string;
  Acteco : integer;
  DireccionOrigen, ComunaOrigen : string;
  TelefonoEmisor : string;
  CorreoEmisor : string;
  Sucursal : string;
  CodigoSucursal : integer;
  CiudadOrigen : string;
  CodigoVendedor : string;
  CodigoInternoReceptor : string;
  ExtranjeroNumId : string;
  ExtranjeroNacionalidad : string;
  ExtranjeroTipoDocId : string;
  ContactoReceptor : string;
  CorreoReceptor : string;
  DireccionReceptor : string;
  ComunaReceptor : string;
  CiudadReceptor : string;
  DireccionPostal : string;
  ComunaPostal : string;
  CiudadPostal : string;
  CodImpuestoAdicional : string;
  TasImpuestoRetencion : double;
  ValorImpuestoRetencion : double;
  MontoTotal : double;
  ValorAPagar : double;
  NroLinDet : integer;
  TpoCodigo : string;
  VlrCodigo : string;
  IndExe : integer;
  ndAgente : string;
  MntBaseFaena : double;
  MntMargComer : double;
  PrcConsFinal : double;
  NmbItem : string;
  DscItem : string;
  UnmdRef : string;
  PrcRef : double;
  QtyItem : double;
  SubQty : double;
  SubCod : string;
  FchElabor : TDateTime;
  FchVencim, FchVenc : TDateTime;
  UnmdItem : string;
  PrcItem : double;
  PrcOtrMon : double;
  Moneda : string;
  FctConv : double;
  DctoOtrMnda : double;
  RecargoOtrMnda : double;
  MontoItemOtrMnda : double;
  DescuentoPct : double;
  DescuentoMonto : double;
  TipoDscto : string;
  ValorDscto : double;
  RecargoPct : double;
  RecargoMonto : double;
  TipoRecargo : string;
  ValorRecargo : double;
  CodImpAdic : double;
  MontoItem : double;
  NroSTI : integer;
  GlosaSTI : string;
  OrdenSTI : integer;
  SubTotNetoSTI : double;
  SubTotIVASTI : double;
  SubTotAdicSTI : double;
  SubTotExeSTI : double;
  ValSubtotSTI : double;
  LineasDeta : integer;
  NroLinDR : integer;
  TpoMov : string;
  GlosaDR : string;
  TpoValor : string;
  ValorDR : double;
  ValorDROtrMnda : double;
  IndExeDR : integer;
  IndGlobal : integer;
  NroLinCom : integer;
  TipoMovim : string;
  GlosaComision : string;
  TasaComision : double;
  ValComNeto : double;
  ComExento : double;
  IvaComision : double;
  Factor : double;
  Valido : boolean;
  MensajeError : string;
  FicheroXML : string;
  RutOtroRef : string;
  FolioRef : string;
  TipoDocTributario : string;
  RutReceptorCaratula : string;
  LineaReferencia : integer;
  FolioEnvio : string;
  CodigoGiroCliente : integer;
  XmlEnviadoCliente : boolean;
  FechaDocumento : TDateTime;
  Empresa : integer;
  CantidadErrores : integer;
  MensageError : string;
  EndpointSII_CL : string;
  RespuestaFactura : string;
  Respuesta : TStrings;
  UrlEnvioXml : string;
  DS : TFIBDataSet;
  Contrasenya : string;
  Rut : string;
  FicheroCertificado, FicheroAutFolios : string;
  m, f, n : TStream;
  i : integer;
  FicheroPDF : string;
  Memo : TStrings;
  FicherosEnviar : TStrings;
  Documento : TXMLDocument;
  TrackId : string;
  AMemoryStream : TMemoryStream;
  s : string;
  XMLGenerado : WideString;
  XMLGeneradoCliente : WideString;
  XMLTimbreElectronico : WideString;
  TimbreElectronicoImg : WideString;
  nodo : IXMLNode;
  FolioDTE : integer;
  FechaResolucion : TDateTime;
  NroResolucion : integer;
  CuerpoMail : TStrings;
  param_FACASUN001 : string;
  Asunto : string;
  NombreFichero : string;
  param_DTEENVI002 : string;
  WndList : Pointer;
  LineaMemo : integer;
  FolioNumeroFinal, FolioContador, FolioId, FoliosRestantes : integer;
  Seguir : boolean;
  TipoEnvio : string;
  TituloGiroCliente : string;
begin
  // Procedimiento que genera Xml y envia DTE, para los siguientes documentos:
  //    33  FACTURA ELECTRONICA
  //    34  FACTURA NO AFECTA O EXENTA ELECTRONICA
  //    52  GUIA DE DESPACHO ELECTRONICA
  //    61  NOTA DE CREDITO ELECTRONICA
  //    56  NOTA DE DEBITO ELECTRONICA
  //    46  FACTURA DE COMPRA ELECTRONICA
  //    43  LIQUIDACION FACTURA ELECTRONICA
  //    110 FACTURA DE EXPORTACION ELECTRONICA
  //    112 NOTA DE CREDITO DE EXPORTACION ELECTRONICA
  //    111 NOTA DE DEBITO DE EXPORTACION ELECTRONICA
  //    39  BOLETA ELECTRONICA
  //    41  BOLETA EXENTA ELECTRONICA
  Seguir := True;
  DMMain.LogIni('Documento DTE');
  FicheroXML := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'envioDTE.xml';

  // Inicializanos Rut Recepcion caratula
  RutReceptorCaratula := '60803000-K';
  FInformacionEnvioDte := TFInformacionEnvioDte.Create(Self);
  WndList := DisableTaskWindows(FInformacionEnvioDte.Handle);
  try

     // Iniciamos la insercion de datos en el XMl deL DTE
     FacturaElectronica := TFacturaElectronicaCL.Create(Self);
     try
        LineaMemo := 0;
        with FInformacionEnvioDte do
        begin
           LBLGeneral.Caption := _('Inicializando Facturación ...');
           MLog.Lines.Clear;
           Show;
        end;

        with FacturaElectronica do
        begin
           // ...\Mis Documentos\Factura_A_123.xml
           Fichero := FicheroXML;
           Inicia;
        end;

        FInformacionEnvioDte.LBLGeneral.Caption := _('Enviando DTE ...');
        FInformacionEnvioDte.GBProcesaCab.Visible := True;

        //Obtenemos informacion del DTE
        with QMDTE do
        begin
           Close;
           with SelectSQL do
           begin
              Clear;
              Add(' SELECT * ');
              Add(' FROM (SELECT A.EMPRESA, A.EJERCICIO, A.CANAL, A.SERIE, A.TIPO, A.RIG, A.ENTRADA_FACTURACION, A.FECHA, A.CLIENTE, ');
              Add(' A.TITULO, A.SU_REFERENCIA, A.FORMA_PAGO, A.TOTAL_A_COBRAR, A.MONEDA, A.TIPO_DOC_TRIBUTARIO, A.FOLIO, ');
              Add(' A.ID_S, A.INDTRASLADO AS INDTRASLADO, A.TPOIMPRESION AS TPOIMPRESION, A.ID_TIPO_DESPACHO, A.SII_FMA_PAGO, ');
              Add(' A.CODIGO_GIRO_EMPRESA, A.TERCERO, A.DIRECCION, A.LIQUIDO, A.CODIGO_GIRO_CLIENTE, P.PERIODO, ');
              Add(' P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, ');
              Add(' FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ESTADO, FE.GLOSA, FE.ERR_CODE, FE.GLOSA_ERR, ');
              Add(' FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.ID_ADJUNTO_SIE, FE.RECEPDTEGLOSA, 0 AS INDSERVICIO, ');
              Add(' '''' AS FECHA_ENTREGA, A.TITULO_GIRO_CLIENTE ');
              Add(' FROM VER_CABECERAS_ALBARAN A ');
              Add(' JOIN EMP_PERIODOS P ON A.EMPRESA = P.EMPRESA AND A.EJERCICIO = P.EJERCICIO AND A.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1 ');
              Add(' LEFT JOIN RCV_VENTA V ON A.EMPRESA = V.EMPRESA AND A.TIPO_DOC_TRIBUTARIO = V.TIPO_DOC AND A.FOLIO = V.FOLIO ');
              Add(' LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = A.TERCERO) ');
              Add(' LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (A.TIPO_DOC_TRIBUTARIO = TDT.CODIGO) ');
              Add(' LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = A.ID_S) ');
              Add(' WHERE ');
              Add(' A.ID_S = :ID_S AND ');
              Add(' A.TIPO <> ''DES'' ');
              Add(' UNION ');
              Add(' SELECT F.EMPRESA, F.EJERCICIO, F.CANAL, F.SERIE, F.TIPO, F.RIG, F.ENTRADA_FACTURACION, F.FECHA, F.CLIENTE, ');
              Add(' F.TITULO, F.SU_REFERENCIA, FORMA_PAGO, F.TOTAL_A_COBRAR, F.MONEDA, F.TIPO_DOC_TRIBUTARIO, F.FOLIO, F.ID_S, ');
              Add(' 0 AS INDTRASLADO, CAST('''' AS VARCHAR(10)) AS TPOIMPRESION, F.ID_TIPO_DESPACHO, F.SII_FMA_PAGO, ');
              Add(' F.CODIGO_GIRO_EMPRESA, F.TERCERO, DIRECCION, F.LIQUIDO, F.CODIGO_GIRO_CLIENTE, P.PERIODO, ');
              Add(' P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, ');
              Add(' FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ESTADO, FE.GLOSA, FE.ERR_CODE, FE.GLOSA_ERR, ');
              Add(' FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.ID_ADJUNTO_SIE, FE.RECEPDTEGLOSA, F.INDSERVICIO, F.FECHA_ENTREGA, F.TITULO_GIRO_CLIENTE ');
              Add(' FROM VER_CABECERAS_FACTURA F ');
              Add(' JOIN EMP_PERIODOS P ON F.EMPRESA = P.EMPRESA AND F.EJERCICIO = P.EJERCICIO AND F.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1 ');
              Add(' LEFT JOIN RCV_VENTA V ON F.EMPRESA = V.EMPRESA AND F.TIPO_DOC_TRIBUTARIO = V.TIPO_DOC AND F.FOLIO = V.FOLIO ');
              Add(' LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = F.TERCERO) ');
              Add(' LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (F.TIPO_DOC_TRIBUTARIO = TDT.CODIGO) ');
              Add(' LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = F.ID_S) ');
              Add(' WHERE ');
              Add(' F.ID_S = :ID_S AND ');
              Add(' F.TIPO <> ''DES'') ');

                {$IFDEF Debug}
                SaveToFile('C:\Documentos-DTE.sql') ;
                {$ENDIF}
           end;
           Params.ByName['ID_S'].AsInteger := ID_S;
           Open;

           TipoDocTributario := QMDTE.FieldByName('TIPO_DOC_TRIBUTARIO').AsString;
           if ((TipoDocTributario = '39') or (TipoDocTributario = '41')) then
              TipoEnvio := 'envioBoleta'
           else
              TipoEnvio := 'envioDte';

           FicheroXML := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + TipoEnvio + '.xml';

           with FacturaElectronica do
           begin
              // ...\Mis Documentos\Factura_A_123.xml
              Fichero := FicheroXML;
              Inicia;
           end;


           // Verificamos que exista solo un DTE disponible con el ID_S
           if (QMDTE.RecordCount <> 1) then
              raise Exception.Create(_('No existe un solo DTE con el Id_s: ' + IntToStr(ID_S)));

           XmlEnviadoCliente := False;

           //Verificamos que a fecha este un rango válido
           if ((QMDTE.FieldByName('FECHA').AsDateTime >= StrToDateTime('01/04/2003')) and (QMDTE.FieldByName('FECHA').AsDateTime <= StrToDateTime('31/12/2050'))) then
              DMMain.Log('Inicia la creacion del DTE con ID: ' + IntToStr(QMDTEID_S.AsInteger))
           else
              raise Exception.Create(_('La fecha del documento está fuera de rango'));

           TipoDocTributario := QMDTE.FieldByName('TIPO_DOC_TRIBUTARIO').AsString;

           //Validamos que el tipo de DTE este soportado por el envio DTE
           if ((TipoDocTributario <> '33') and
              (TipoDocTributario <> '34') and
              (TipoDocTributario <> '52') and
              (TipoDocTributario <> '61') and
              (TipoDocTributario <> '56') and
              (TipoDocTributario <> '46') and
              (TipoDocTributario <> '43') and
              (TipoDocTributario <> '110') and
              (TipoDocTributario <> '112') and
              (TipoDocTributario <> '111') and
              (TipoDocTributario <> '39') and
              (TipoDocTributario <> '41')
              ) then
           begin
              DMMain.Log('ERROR: Solo soporta documentos tributarios del tipo 33, 34, 52, 61, 56, 46, 43, 110, 112, 111, 39, 41');
              raise Exception.Create(_('Solo soporta documentos tributarios del tipo 33, 34, 52, 61, 56, 46, 43, 110, 112, 111, 39, 41, Documento: ' + IntToStr(QMDTE.FieldByName('RIG').AsInteger)));
           end;

           //Asignamos factor -1 para aplicar a las unidades de las guias de despacho
           if (QMDTE.FieldByName('TIPO_DOC_TRIBUTARIO').AsString = '61') then
              Factor := -1
           else
              Factor := 1;

           Empresa := QMDTE.FieldByName('EMPRESA').AsInteger;

           IdDoc := ID_S;

           // Esto crea el nodo <Documento> y los Setxxx pondran los tags en el
           FacturaElectronica.NuevoDocumento;

           // Asignamos numero de folio a documento
           DMMain.Log('Asignamos numero de folio al ID_S: ' + IntToStr(IdDoc));
           AsignaFolioADocumento(IdDoc);

           // Guardamos informacion de documento en datos de envio del DTE ventas
           if not (ExisteDatosFEChile(IdDoc)) then
              InsertaDatosFEChile(IdDoc)
           else
              raise Exception.Create(_('Ya existe un registro de envio de este documento'));

           CodigoGiroCliente := QMDTE.FieldByName('CODIGO_GIRO_CLIENTE').AsInteger;
           TituloGiroCliente := QMDTE.FieldByName('TITULO_GIRO_CLIENTE').AsString;

           // Se Refresca datos de folio asignado anteriormente y los datos insertados en cabecera de factura de chile
           Refrescar(QMDTE, 'ID_S', IdDoc);
           QMCabeceraFEChile.Close;
           QMCabeceraFEChile.Open;

           with FInformacionEnvioDte do
           begin
              Caption := _('Enviando DTE al SII');
              LTipoDocTributario.Caption := DameTituloTipoDocTributario(QMDTETIPO_DOC_TRIBUTARIO.AsString);
              LRutReceptor.Caption := QMCabeceraFEChileRUTRECEP.AsString;
              LRig.Caption := IntToStr(QMDTERIG.AsInteger);
              LFolio.Caption := IntToStr(QMDTEFOLIO.AsInteger);
              LCliente.Caption := QMCabeceraFEChileRZNSOCRECEP.AsString;
              MLog.Lines.Add(_('Preparando datos documento'));
           end;

           FechaDocumento := QMDTE.FieldByName('FECHA').AsDateTime;
           FacturaElectronica.SetCabecera(QMDTE.FieldByName('FOLIO').AsInteger, QMDTE.FieldByName('INDSERVICIO').AsInteger, QMDTE.FieldByName('TIPO_DOC_TRIBUTARIO').AsString, FechaDocumento);
           FolioEnvio := Format('%.8d', [QMDTE.FieldByName('FOLIO').AsInteger]);

           //Tipo de despacho
           if ((TipoDocTributario = '33') or
              (TipoDocTributario = '34') or
              (TipoDocTributario = '52') or
              (TipoDocTributario = '46') or
              (TipoDocTributario = '110')) then
           begin
              if ((QMDTE.FieldByName('ID_TIPO_DESPACHO').AsInteger >= 0) and (QMDTE.FieldByName('ID_TIPO_DESPACHO').AsInteger <= 3)) then
                 FacturaElectronica.SetTipoDespacho(QMDTE.FieldByName('ID_TIPO_DESPACHO').AsInteger)
              else
              begin
                 ShowMessage(Format(_('El valor del tipo despacho es incorrecto Val: 1, 2, 3 - (Factura %s/%d)'), [QMDTE.FieldByName('SERIE').AsString, QMDTE.FieldByName('RIG').AsInteger]));
                 Seguir := False;
              end;
           end;

           if ((TipoDocTributario = '52') and (Seguir)) then
              //  Indicador de traslado para guia de despacho
              //  1: Operación constituye venta 1
              //  2: Ventas por efectuar
              //  3: Consignaciones
              //  4: Entrega gratuita
              //  5: Traslados internos
              //  6: Otros traslados no venta
              //  7: Guía de devolución
              //  8: Traslado para exportación. (no venta)
              //  9: Venta para exportación
              if ((QMDTE.FieldByName('INDTRASLADO').AsInteger >= 1) and (QMDTE.FieldByName('INDTRASLADO').AsInteger <= 9)) then
              begin
                 DMMain.Log('SetIndicadorTraslado');
                 FacturaElectronica.SetIndicadorTraslado(QMDTE.FieldByName('INDTRASLADO').AsInteger); // Dato Obligatorio
              end
              else
              begin
                 ShowMessage(_('La guia de despacho debe tener un indicador de traslado valido'));
                 Seguir := False;
              end;

           if ((TipoDocTributario = '52') and (Seguir)) then
              //  Describe modalidad de Impresión de la representación impresa en formato normal o en formato Ticket
              //  N (Normal) o T (Ticket)
              //  Por omisión se asume “N”
              if ((QMDTE.FieldByName('TPOIMPRESION').AsString = 'N') or (QMDTE.FieldByName('TPOIMPRESION').AsString = 'T')) then
              begin
                 DMMain.Log('SetTipoImpresion');
                 FacturaElectronica.SetTipoImpresion(QMDTE.FieldByName('TPOIMPRESION').AsString); // Dato Condicional
              end;

           // Indicaor de servicio
           if (Seguir) then
              if (
                 (TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111') or
                 (TipoDocTributario = '39') or
                 (TipoDocTributario = '41')
                 ) then
              begin
                 DMMain.Log('SetIndicadorServicio');
                 FacturaElectronica.SetIndicadorServicio(QMCabeceraFEChileINDSERVICIO.AsInteger); // Dato condicional
              end;

           // Indicaor de servicio
           // Indica si las líneas de detalle, descuentos y recargos se expresan en montos brutos. (Sólo para documentos sin impuestos adicionales) .
           // 1: Montos de líneas de detalle vienen expresados en montos brutos.
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43')) then
              begin
                 // Indica si las líneas de detalle, descuentos y recargos se expresan en montos brutos. (Sólo para documentos sin impuestos adicionales) .
                 // 1: Montos de líneas de detalle vienen expresados en montos brutos.
                 DMMain.Log('SetMontosBrutos');
                 FacturaElectronica.SetMontosBrutos(QMCabeceraFEChileMNTBRUTO.AsFloat); // Dato condicional
              end;

           // Es una sugerencia que indica el Tipo de Transacción de Compra para el comprador donde el vendedor no es responsable por errores en su digitación. Campo opcional para indicar en el documento qué tipo de compra es para el comprador (para el Receptor de Factura o Emisor de Factura de Compra).
           // Disponible sólo para facilitar el registro en las compras. No obliga al comprador a registrarlo de la misma forma en sus compras.
           // Tipo de Compra para el comprador:
           // 1: Compras del Giro
           // 2: Compras en Supermercados o similares
           // 3: Adquisición Bien Raíz.
           // 4: Compra Activo Fijo
           // 5: Compra con IVA Uso Común
           // 6: Compra sin derecho a  Crédito
           // 7: Compra que no corresponde incluir

           // Solo para TDT 33
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43')) then
                 FacturaElectronica.SetTipoTransaccionCompra(QMCabeceraFEChileTPOTRANCOMPRA.AsInteger);

           // Indica el Tipo de Transacción de Venta. Campo opcional a nivel de Schema, pero obligatorio en su uso. En caso de no informarse se asumirá como “Ventas del Giro”. Se indica en el documento qué tipo de Venta es para el vendedor (para el Emisor de Factura o Receptor de Factura de Compra)
           // Disponible para facilitar el registro en las Ventas. Obliga al vendedor a registrarlo de la misma forma en sus ventas.
           // Inicialmente opcional en el Schema, más adelante será un campo obligatorio.
           // Tipo de Venta para el vendedor:
           // 1: Ventas del Giro
           // 2: Venta Activo Fijo
           // 3: Venta Bien Raíz
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43')
                 ) then // No, para guia de despacho
                 FacturaElectronica.SetTipoTransaccionVenta(QMCabeceraFEChileTPOTRANVENTA.AsInteger);

           //La forma de pago es para todos los tipos de documentos
           // 1 Credito, 2 contado, 3 Gratuito
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')
                 ) then
              begin
                 if ((QMDTE.FieldByName('SII_FMA_PAGO').AsInteger >= 1) and (QMDTE.FieldByName('SII_FMA_PAGO').AsInteger <= 3)) then
                    FacturaElectronica.SetFormaPago(QMDTE.FieldByName('SII_FMA_PAGO').AsInteger)
                 else
                 begin
                    ShowMessage(_('Debe asignarse una forma de pago valida al documento.'));
                    Seguir := False;
                 end;
              end;

           // TODO => FmaPagoExp ---------------------------------------------- !!!
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')) then
              begin
                 FacturaElectronica.SetFechaCancelacion(QMCabeceraFEChileFCHCANCEL.AsDateTime); // Opcional
                 FacturaElectronica.SetMontoCancelado(QMCabeceraFEChileMNTCANCEL.AsFloat); // Opcional
                 FacturaElectronica.SetSaldoInsoluto(QMCabeceraFEChileSALDOINSOL.AsFloat); // Opcional
              end;

           { TODO : Esto solo obtiene el primer vencimiento. Hacer un bucle. }
           // Obtenemos datos cartera
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT FIRST 1 D.VENCIMIENTO AS VENCIMIENTO, D.LIQUIDO AS LIQUIDO, T.MEDIO_PAGO_FACTURAE_CL ');
                 SQL.Add(' FROM EMP_CARTERA C ');
                 SQL.Add(' JOIN EMP_CARTERA_DETALLE D ON C.ID_CARTERA = D.ID_CARTERA ');
                 SQL.Add(' JOIN SYS_TIPO_EFECTO T ON D.TIPO_EFECTO = T.TIPO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' C.ID_DOC = :ID_DOC AND ');
                 SQL.Add(' C.SIGNO = ''C'' AND ');
                 SQL.Add(' D.VISIBLE = 1 ');
                 SQL.Add(' ORDER BY VENCIMIENTO ASC ');
                 Params.ByName['ID_DOC'].AsInteger := QMDTE.FieldByName('ID_S').AsInteger;
                 ExecQuery;
                 Vencimiento := FieldByName['VENCIMIENTO'].AsDateTime;
                 Liquido := FieldByName['LIQUIDO'].AsFloat * Factor;
                 MedioPago := FieldByName['MEDIO_PAGO_FACTURAE_CL'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (Seguir) then
              if ((TipoDocTributario = '52') or ((TipoDocTributario = '61') and (QMSIIDteReferenciaCODREF.AsInteger = 2))) then //Si es Guia de despacho la fecha de vencimiento se obtien del documento
                 Vencimiento := QMDTE.FieldByName('FECHA').AsDateTime;

           // Vencimiento - Dato obligatorio
           // Liquido - Dato obligatorio
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')) then
              begin
                 FacturaElectronica.SetMontoPagos(Vencimiento, Liquido, '');
              end;

           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111') or
                 (TipoDocTributario = '39') or
                 (TipoDocTributario = '41')) then
              begin
                 if ((QMDTE.FieldByName('INDSERVICIO').AsInteger = 1) or (QMDTE.FieldByName('INDSERVICIO').AsInteger = 2)) then
                 begin
                    FacturaElectronica.SetPeriodoDesde(QMDTE.FieldByName('FECHA').AsDateTime);
                    FacturaElectronica.SetPeriodoHasta(QMDTE.FieldByName('FECHA').AsDateTime);
                 end;
              end;

           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')) then
              begin
                 // Indica en que modalidad se pagará.
                 // Valores:
                 //    CH: Cheque
                 //    CF: Cheque a fecha
                 //    LT: Letra
                 //    EF: Efectivo
                 //    PE: Pago A Cta.Cte.
                 //    TC: Tarjeta Crédito
                 //    OT: Otro
                 FacturaElectronica.SetMedioPago('');

                 FacturaElectronica.SetTipoCtaPago('');
                 FacturaElectronica.SetCtaPago(QMCabeceraFEChileNUMCTAPAGO.AsString);
                 FacturaElectronica.SetBancoPago(QMCabeceraFEChileBCOPAGO.AsString); // Opcional
              end;

           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')) then
              begin
                 // Es un código acordado entre las empresas, que indica términos de referencia
                 // Ejemplos: Fecha Recepción Factura (FRF), o Fecha entrega Mercaderías (FEM), etc.
                 FacturaElectronica.SetTerminosPagoCodigo(QMCabeceraFEChileTERMPAGOCDG.AsString); // Opcional

                 // Es un código acordado entre las empresas, que indica términos de referencia
                 // Ejemplos: Fecha Recepción Factura (FRF), o Fecha entrega Mercaderías (FEM), etc.
                 FacturaElectronica.SetTerminosPagoGlosa(QMCabeceraFEChileTERMPAGOGLOSA.AsString); // Opcional

                 // Cantidad de días de acuerdo al código de Términos de pago: Ejemplo 5 días Fecha entrega Mercaderías (Día = 5, Código =FEM)
                 // Número mayor que cero
                 FacturaElectronica.SetTerminosPagoDias(QMCabeceraFEChileTERMPAGODIAS.AsInteger); // Opcional
              end;

           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '43') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')
                 ) then
              begin
                 // Fecha de vencimiento (AAAA-MM-DD)
                 // Fecha válida entre 2002-08-01 y 2050-12-31
                 //                 FacturaElectronica.SetFechaVencimiento(QMDTE.FieldByName('FECHA_ENTREGA').AsDateTime; // Condicional  //  *****preguntar***** Vencimiento?
                 //FacturaElectronica.SetFechaVencimiento(QMDTE.FieldByName('FECHA').AsDateTime); // Condicional  //  *****preguntar***** Vencimiento?
                 FacturaElectronica.SetFechaVencimiento(Vencimiento); // Condicional 
              end;

           //Si es una boleta electronica la feca de vencimiento solo obligatorio en caso de servicios periodicos.
           if (Seguir) then
              if (((TipoDocTributario = '39') or (TipoDocTributario = '41')) and ((QMDTEINDSERVICIO.AsInteger = 1) or (QMDTEINDSERVICIO.AsInteger = 1))) then
                 FacturaElectronica.SetFechaVencimiento(Vencimiento); // Condicional  //  *****preguntar***** Vencimiento?

           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '61')) then
                 FacturaElectronica.SetTipoFacturaEspecial(QMCabeceraFEChileTIPOFACTESP.AsInteger); // Opcional para TDT 33 y 61

           // ----------------------------- <EMISOR> -------------------------------
           // Obtengo datos necesarios de la empresa
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, ');
                 SQL.Add(' D.DIR_COMPLETA_N, P.TITULO AS TITULO_POBLACION ');
                 SQL.Add(' FROM SYS_EMPRESAS E ');
                 SQL.Add(' JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO ');
                 SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
                 SQL.Add(' JOIN SYS_POBLACION P ON D.POBLACION = P.POBLACION ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' E.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' D.DIR_DEFECTO = 1 ');
                 Params.ByName['EMPRESA'].AsInteger := Empresa;
                 ExecQuery;
                 RutEmisor := FieldByName['NIF'].AsString;
                 RazonSocial := QuitarAcentosTexto(FieldByName['NOMBRE_R_SOCIAL'].AsString);
                 GiroEmisor := DameTituloCodigoGiro(QMDTE.FieldByName('CODIGO_GIRO_EMPRESA').AsInteger);
                 TelefonoEmisor := FieldByName['TELEFONO01'].AsString;
                 CorreoEmisor := FieldByName['EMAIL'].AsString;
                 Acteco := QMDTE.FieldByName('CODIGO_GIRO_EMPRESA').AsInteger;
                 Sucursal := '';
                 CodigoSucursal := 0;
                 DireccionOrigen := QuitarAcentosTexto(FieldByName['DIR_COMPLETA_N'].AsString);
                 ComunaOrigen := QuitarAcentosTexto(FieldByName['TITULO_POBLACION'].AsString);
                 CiudadOrigen := QuitarAcentosTexto(FieldByName['TITULO_POBLACION'].AsString);
                 CodigoVendedor := '';
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Los datos de emisor van para todos los documentos, incluidas las boletas
           if (Seguir) then
              FacturaElectronica.SetEmisor(
                 TipoDocTributario,
                 RutEmisor,
                 RazonSocial,
                 GiroEmisor,
                 TelefonoEmisor,
                 CorreoEmisor,
                 Acteco,
                 Sucursal,
                 CodigoSucursal,
                 DireccionOrigen,
                 ComunaOrigen,
                 CiudadOrigen,
                 CodigoVendedor
                 );

           // TODO => IdAdicEmisor ---------------------------------------------- !!!

           // ----------------------------- <RUTMANDANTE> --------------------------
           // Corresponde al RUT del mandante si el total de la venta o servicio es por cuenta de otro el cual es responsable del IVA devengado en el período
           // Con guión y dígito verificador
           // Cuerpo numérico entre 100.000 y 99 millones, guión y dígito verificador alfanumérico entre 0 y 9 o K
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '39') or
                 (TipoDocTributario = '41')
                 ) then
              begin
                 DMMain.Log('SetRutMandante');
                 FacturaElectronica.SetRutMandante(QMCabeceraFEChileRUTMANDANTE.AsString); // Dato condicional
              end;
           //Dependiendo de si es una boleta electronica y el indicador de servicio asignamos el RUT  que corresponde
           //Si el cliente es -1 verificamos si el documento tiene datos en ges_cabeceras_s_fac_nif
           if (Seguir) then
              if (QMDTE.FieldByName('CLIENTE').AsInteger = -1) then
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
                       SQL.Add(' COALESCE(PAIS, ''DESCONOCIDO'') AS PAIS ');
                       SQL.Add(' FROM GES_CABECERAS_S_FAC_NIF ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_S = :ID_S ');
                       Params.ByName['ID_S'].AsInteger := QMDTE.FieldByName('ID_S').AsInteger;
                       ExecQuery;
                       RutReceptor := FieldByName['NIF'].AsString;
                       Pais_receptor := FieldByName['PAIS'].AsString;
                       CodigoInternoReceptor := '-1';
                       Cliente := -1;
                       RazonSocialReceptor := QuitarAcentosTexto(FieldByName['NOMBRE'].AsString);
                       ExtranjeroNumId := '';
                       ExtranjeroNacionalidad := '';
                       ExtranjeroTipoDocId := '';
                       GiroReceptor := '';
                       ContactoReceptor := FieldByName['TELEFONO01'].AsString;
                       CorreoReceptor := FieldByName['EMAIL'].AsString;
                       DireccionReceptor := QuitarAcentosTexto(FieldByName['DIRECCION'].AsString);
                       ComunaReceptor := QuitarAcentosTexto(FieldByName['PROVINCIA'].AsString);
                       CiudadReceptor := QuitarAcentosTexto(FieldByName['PROVINCIA'].AsString);
                       DireccionPostal := QuitarAcentosTexto(FieldByName['DIRECCION'].AsString);
                       ComunaPostal := FieldByName['C_POSTAL'].AsString;
                       CiudadPostal := FieldByName['C_POSTAL'].AsString;
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
                       SQL.Add(' SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_COMPLETA_N, ');
                       SQL.Add(' P.TITULO AS TITULO_POBLACION, D.CODIGO_POSTAL, D.PAIS_DIRECCION,  PR.TITULO TITULO_PROVINCIA ');
                       SQL.Add(' FROM SYS_TERCEROS T ');
                       SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO) ');
                       SQL.Add(' LEFT JOIN SYS_PROVINCIAS PR ON (D.PAIS_DIRECCION=PR.PAIS AND D.PROVINCIA = PR.PROVINCIA ) ');
                       SQL.Add(' LEFT JOIN SYS_POBLACION P ON (D.PAIS_DIRECCION=P.PAIS AND D.POBLACION = P.POBLACION ) ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' T.TERCERO = :TERCERO AND ');
                       SQL.Add(' D.DIRECCION = :DIRECCION ');
                       Params.ByName['TERCERO'].AsInteger := QMDTE.FieldByName('TERCERO').AsInteger;
                       Params.ByName['DIRECCION'].AsInteger := QMDTE.FieldByName('DIRECCION').AsInteger;
                       ExecQuery;
                       RutReceptor := FieldByName['NIF'].AsString;
                       Pais_receptor := FieldByName['PAIS_DIRECCION'].AsString;
                       CodigoInternoReceptor := QMDTE.FieldByName('CLIENTE').AsString;
                       Cliente := QMDTE.FieldByName('CLIENTE').AsInteger;
                       RazonSocialReceptor := QuitarAcentosTexto(FieldByName['NOMBRE_R_SOCIAL'].AsString);
                       ExtranjeroNumId := '';
                       ExtranjeroNacionalidad := '';
                       ExtranjeroTipoDocId := '';
                       GiroReceptor := TituloGiroCliente;
                       ContactoReceptor := FieldByName['TELEFONO01'].AsString;
                       CorreoReceptor := FieldByName['EMAIL'].AsString;
                       DireccionReceptor := QuitarAcentosTexto(FieldByName['DIR_COMPLETA_N'].AsString);
                       ComunaReceptor := QuitarAcentosTexto(FieldByName['TITULO_POBLACION'].AsString);
                       CiudadReceptor := QuitarAcentosTexto(FieldByName['TITULO_PROVINCIA'].AsString);
                       DireccionPostal := QuitarAcentosTexto(FieldByName['DIR_COMPLETA_N'].AsString);
                       ComunaPostal := FieldByName['CODIGO_POSTAL'].AsString;
                       CiudadPostal := FieldByName['CODIGO_POSTAL'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

           //Si es una boleta electronica normal o excenta, sin cliente asignado y el indicador de servicio es 3 se asigna un Rut especial
           if (Seguir) then
              if ((TipoDocTributario = '39') or (TipoDocTributario = '41')) then
              begin
                 if (QMDTE.FieldByName('CLIENTE').AsInteger = -1) then
                 begin
                    RutReceptor := '0';
                    if (QMDTE.FieldByName('INDSERVICIO').AsInteger = 3) then
                    begin
                       RutReceptor := '66666666-6';
                       CodigoInternoReceptor := '';
                    end;
                 end;
              end
              else
              if (RutReceptor > '') then
              begin
                 // Verificamos la validez del RUT  del receptor
                 DMMain.VerificaDocumentoIdentificacion(Pais_receptor, 'RUT', RutReceptor, Valido, MensajeError);
                 if not Valido then
                 begin
                    ShowMessage(MensajeError);
                    Seguir := False;
                 end;
              end
              else
              begin
                 ShowMessage(_('El Rut del receptor no puede ser vacio'));
                 Seguir := False;
              end;

           // Si es guia de despacho no se incluye ExtranjeroNumId y ExtranjeroTipoDocId
           if (Seguir) then
              if (TipoDocTributario = '52') then
              begin
                 ExtranjeroNumId := '';
                 ExtranjeroTipoDocId := '';
              end;

           // Los datos del Receptor son para todos los tipos de documentos tributarios
           if (Seguir) then
              FacturaElectronica.SetReceptor(
                 TipoDocTributario,
                 RutReceptor,
                 CodigoInternoReceptor,
                 RazonSocialReceptor,
                 ExtranjeroNumId,
                 ExtranjeroNacionalidad,
                 ExtranjeroTipoDocId,
                 GiroReceptor,
                 ContactoReceptor,
                 CorreoReceptor,
                 DireccionReceptor,
                 ComunaReceptor,
                 CiudadReceptor,
                 DireccionPostal,
                 ComunaPostal,
                 CiudadPostal
                 );

           // ----------------------------- <RUTSOLICITA> --------------------------
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '46')
                 ) then
              begin
                 FacturaElectronica.SetRutSolicitante('');
              end;
           // ----------------------------- <TRANSPORTE> ---------------------------
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')
                 ) then
              begin
                 FacturaElectronica.SetTransporte(
                    TipoDocTributario,
                    QMCabeceraFEChilePATENTE.AsString,
                    QMCabeceraFEChileRUTTRANS.AsString,
                    QMCabeceraFEChileRUTCHOFER.AsString,
                    QMCabeceraFEChileNOMBRECHOFER.AsString,
                    QMCabeceraFEChileDIRDEST.AsString,
                    QMCabeceraFEChileCMNADEST.AsString,
                    QMCabeceraFEChileCIUDADDEST.AsString
                    );
              end;
           // ----------------------------- <TOTALES> ------------------------------

           // Descripcion: Código del impuesto o retención de acuerdo a la codificación detallada en tabla de códigos
           // (ver Punto 4 del índice). Incluye Retención de Cambio sujeto de Construcción
           CodImpuestoAdicional := ''; // Dato condicional

           // Descripcion: Se debe indicar la tasa de Impuesto adicional o retención. En el caso de impuesto específicos se puede omitir
           TasImpuestoRetencion := 0; // Dato condicional

           // Descripcion: Valor del impuesto o retención asociado al código indicado anteriormente
           // a) Tasa* (Suma de líneas de detalle con código de Impuesto adicional o retención), excepto Diesel, Gasolina, margen de comercialización e “Iva anticipado faenamiento carne”
           // b) Tasa * Monto base faenamiento para Iva anticipado faenamiento carne
           // c) Valor numérico en otros casos > 0
           ValorImpuestoRetencion := 0; // Dato condicional

           // Valor cobrado   // ****************** Preguntar: donde se obtiene el valor cobrado?
           MontoTotal := QMDTE.FieldByName('LIQUIDO').AsFloat * Factor;
           ValorAPagar := MontoTotal; // Opcional

           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111') or
                 (TipoDocTributario = '39') or
                 (TipoDocTributario = '41')
                 ) then
              begin
                 FacturaElectronica.SetTotales(
                    TipoDocTributario,
                    QMCabeceraFEChileMNTNETO.AsFloat * Factor,
                    QMCabeceraFEChileMNTEXE.AsFloat * Factor,
                    QMCabeceraFEChileMNTBASE.AsFloat * Factor,
                    QMCabeceraFEChileMNTMARGENCOM.AsFloat * Factor,
                    QMCabeceraFEChileTASAIVA.AsFloat,
                    QMCabeceraFEChileIVA.AsFloat * Factor,
                    QMCabeceraFEChileVAPROP.AsFloat * Factor,
                    QMCabeceraFEChileIVATERC.AsFloat * Factor,
                    CodImpuestoAdicional,
                    TasImpuestoRetencion,
                    ValorImpuestoRetencion,
                    QMCabeceraFEChileCREDEC.AsFloat,
                    QMCabeceraFEChileGRNTDEP.AsFloat,
                    MontoTotal,
                    QMCabeceraFEChileMONTONF.AsFloat,
                    QMCabeceraFEChileMONTOPERIODO.AsFloat * Factor,
                    QMCabeceraFEChileSALDOANTERIOR.AsFloat * Factor,
                    QMCabeceraFEChileVLRPAGAR.AsFloat * Factor
                    );
              end;
           // ----------------------------- <OTRAMONEDA> ---------------------------

           { TODO : No implementado }
              {
              FacturaElectronica.SetOtraMoneda(
                 QMCabeceraFEChileTPOMONEDA.AsString,
                 QMCabeceraFEChileTPOCAMBIO.AsFloat,
                 QMCabeceraFEChileMNTNETOOTRMNDA.AsFloat,
                 QMCabeceraFEChileMNTEXEOTRMNDA.AsFloat,
                 QMCabeceraFEChileMNTFAECARNEOTRMNDA.AsFloat,
                 QMCabeceraFEChileMNTMARGCOMOTRMNDA.AsFloat,
                 QMCabeceraFEChileIVAOTRMNDA.AsFloat,
                 QMCabeceraFEChileTPOMONEDA.AsString,
                 QMCabeceraFEChileIVAOTRMNDA.AsFloat,
                 QMCabeceraFEChileVANORETOTRMNDA.AsFloat,
                 QMCabeceraFEChileMNTTOTOTRMNDA.AsFloat
                 );
              }

           // ----------------------------- <DETALLE> ------------------------------

           // Generamos el detalle de la factura
           if (Seguir) then
              with QMDetalleFactura do
              begin
                 First;
                 while not EOF do
                 begin
                    // Descripcion: Número del ítem. Desde 1 a 60
                    // Validacion: Número secuencial de la línea
                    NroLinDet := QMDetalleFacturaORDEN.AsInteger;

                    // Desc: Tipo de codificación utilizada para el ítem Standard: EAN, PLU, DUN o Interna (Hasta 5 tipos de códigos)
                    // Validacion: Sin validación. Ejemplo: EAN13, PLU, DUN14, INT1, INT2, EAN128, etc.
                    TpoCodigo := 'INT1';

                    // Desc: Código del producto de acuerdo a tipo de codificación indicada en campo anterior (Hasta 5 códigos)
                    VlrCodigo := QMDetalleFacturaARTICULO.AsString;
                    NmbItem := QMDetalleFacturaTITULO.AsString;

                    // Cantidad del ítem en 12 enteros y 6 decimales
                    // Obligatorio para facturas de venta, compra o notas que indican emisor opera como Agente Retenedor
                    QtyItem := QMDetalleFacturaUNIDADES.AsFloat * Factor;

                    // 12 enteros, 6 decimales Valor numérico
                    PrcItem := QMDetalleFacturaPRECIO.AsFloat;

                    // Monto Item (Valor por línea de detalle) - (Precio Unitario * Cantidad ) – Monto Descuento + Monto Recargo
                    // Valor numérico, de acuerdo con descripción y:
                    // 1) Debe ser cero cuando:
                    //    * Indicador de facturación/ exención tiene valor 4 o 5
                    //    * Es una Nota de Crédito tipo fe de erratas.(Ver campo Código de Referencia en Referencias)
                    // 2) Puede ser cero cuando el documento es una Guía de despacho NO VENTA (Según campo Indicador Tipo de traslado de bienes del encabezado)
                    // 3) En liquidaciones factura puede ser negativo.
                    // CUANDO ES CERO PUEDE NO IMPRIMIRSE o Imprimirse un texto explicatorio (s/valor, sin costo, etc)
                    MontoItem := ((QMDetalleFacturaPRECIO.AsFloat * QMDetalleFacturaUNIDADES.AsFloat) - QMDetalleFacturaI_DESCUENTO.AsFloat) * Factor;
                    if (Seguir) then
                       FacturaElectronica.SetLineaDetalle(
                          TipoDocTributario,
                          NroLinDet,
                          TpoCodigo,
                          VlrCodigo,
                          NmbItem,
                          QtyItem,
                          PrcItem,
                          MontoItem
                          );

                    // ----------------------------------------------------------------

                    // Descripcion: Indica si el producto o servicio es exento o no afecto a impuesto o si ya ha sido facturado.
                    // (También se utiliza para indicar garantía de depósito por envases. Art.28,Inc3 Reglamento DL 825)
                    // (Cervezas, Jugos, Aguas Minerales, Bebidas Analcohólicas u otros autorizados por Resolución especial)
                    // Si todos los ítems de una factura tienen valor 1 en este indicador la factura no puede ser factura electrónica
                    // (código 33), debería ser factura exenta (código 34) .
                    // Sólo en caso de Liquidación-Factura que tenga ítems no facturables negativos, se debe señalar el indicador 2,
                    // e informar el valor con signo negativo
                    // Validacion:
                    //   1: No afecto o exento de IVA (10)
                    //   2: Producto o servicio no es facturable
                    //   3: Garantía de depósito por envases (Cervezas, Jugos, Aguas Minerales, Bebidas Analcohólicas u otros autorizados por Resolución especial)
                    //   4: Ítem No Venta. (Para facturas y guías de despacho (ésta última con Indicador Tipo de Traslado de Bienes igual a 1) y este ítem no
                    IndExe := 0; // Dato condicional
                    if (Seguir) then
                       FacturaElectronica.SetIndFacturacionExencion(NroLinDet, IndExe);

                    // ----------------------------------------------------------------

                    // Desc: Obligatorio para agentes retenedores, indica para cada transacción si es agente retenedor del producto que está vendiendo
                    // Validacion: “R”
                    ndAgente := ''; // Dato condicional
                    // Desc: Sólo para transacciones realizadas por Agentes Retenedores, según códigos de retención 17
                    MntBaseFaena := 0; // Dato condicional
                    // Desc: Sólo para transacciones realizadas por Agentes Retenedores, según códigos de retención 14, 17 y 50
                    MntMargComer := 0; // Dato condicional
                    // Desc: Sólo para transacciones realizadas por Agentes Retenedores, según códigos de retención 17
                    PrcConsFinal := 0; // Dato condicional

                    if (Seguir) then
                       if ((TipoDocTributario <> '39') and (TipoDocTributario <> '41')) then
                          FacturaElectronica.SetRetenedor(NroLinDet, ndAgente, MntBaseFaena, MntMargComer, PrcConsFinal);

                    // ----------------------------------------------------------------

                    // Descripcion: Descripción Adicional del producto o servicio. Se utiliza para pack, servicios con detalle
                    // Sin Validación
                    DscItem := QMDetalleFacturaNOTAS.AsString;

                    if (Seguir) then
                       FacturaElectronica.SetDescripcionAdicional(NroLinDet, DscItem); // Opcional

                    // ----------------------------------------------------------------

                    // Descripcion: Glosa con unidad de medida de referencia
                    // Obligatorio para facturas de venta, compra o notas que indican emisor opera como Agente Retenedor
                    // Sin Validación: En Guías de Despacho con Indicador de tipo de Traslado de Bienes 8 o 9, es obligatoria si el campo
                    // Cantidad no está en la unidad Kgs brutos. Adicionalmente en dicho caso se debe utilizar tabla de unidades de Aduanas
                    UnmdRef := '';

                    if (Seguir) then
                       FacturaElectronica.SetUnidadReferencia(NroLinDet, UnmdRef); // Dato condicional

                    // ----------------------------------------------------------------

                    // Descripcion: Precio unitario para la unidad de medida de referencia (no se usa para el cálculo del valor neto) 12 enteros, 6 decimales.
                    // Obligatorio para facturas de venta, compra o notas que indican emisor
                    // Valor numérico 12 enteros, 6 decimales
                    PrcRef := QMDetalleFacturaPRECIO.AsFloat;

                    if (Seguir) then
                       FacturaElectronica.SetPrecioReferncia(NroLinDet, PrcRef); // Dato condicional

                    // ----------------------------------------------------------------

                    // Desc: Cantidad del ítem en 12 enteros y 6 decimales.
                    // Validacion: Valor numérico <= Cantidad
                    SubQty := 0; // Opcional
                    // Desc: Código descriptivo. Se repite hasta cinco veces.
                    // Validacion: Sin Validación
                    SubCod := ''; // Opcional

                    // Descripcion: Se pueden incluir 5 repeticiones de pares cantidad - código
                    if (Seguir) then
                       FacturaElectronica.SetDistribuicionCantidad(TipoDocTributario, NroLinDet, SubQty, SubCod);

                    // ----------------------------------------------------------------
                    if (Seguir) then
                       if ((TipoDocTributario <> '39') and (TipoDocTributario <> '41')) then
                       begin
                          FchElabor := StrToDate('01/08/2010');
                          FacturaElectronica.SetFechaElaboracion(NroLinDet, FchElabor); // Opcional
                       end;

                    // ----------------------------------------------------------------
                    if (Seguir) then
                       if ((TipoDocTributario <> '39') and (TipoDocTributario <> '41')) then
                       begin
                          FchVencim := StrToDate('01/08/2010');
                          FacturaElectronica.SetFechaVencimientoDetalle(NroLinDet, FchVencim); // Opcional
                       end;

                    // ----------------------------------------------------------------

                    // Obligatorio para facturas de venta, compra o notas que indican emisor opera como Agente Retenedor
                    // Obligatorio en Guías de Despacho con Indicador de tipo de Traslado de Bienes = 8 y 9
                    // En Facturas de Exportación Campo obligatorio a excepción cuando en el “Indicador de Servicio” se
                    // registra el valor 3, 4 o 5. En dicho caso se debe utilizar tabla de unidades de Aduanas
                    UnmdItem := '';

                    if (Seguir) then
                       FacturaElectronica.SetunidadMedida(NroLinDet, UnmdItem);

                    // ----------------------------------------------------------------

                    // Precio unitario en otra moneda 14 enteros 4 decimales.
                    // Obligatorio en Guías de Despacho con Indicador de tipo de Traslado de Bienes = 9
                    PrcOtrMon := 0;
                    // Código otra Moneda - Indica moneda del campo anterior “Precio Unitario en otra moneda”
                    // En Guía de Despacho se debe indicar si se informa un Precio Unitario en otra moneda, según tabla Banco Cenral
                    Moneda := '';
                    // Factor para convertir a $
                    // 6 enteros y 4 decimales
                    // En documentos de Exportación corresponde al tipo de cambio de la fecha de emisión del documento,
                    // publicado por el Banco Central de Chile.
                    FctConv := 0;
                    // Descuento en Otra Moneda - Dinero correspondiente al Descuento en %. Totaliza todos los descuentos otorgados al
                    // ítem en otra moneda Valor numérico. 14 enteros 4 decimales. Sin validación.
                    DctoOtrMnda := 0;
                    // Recargo en Otra Moneda - Dinero correspondiente al Recargo en %. Totaliza todos los recargos otorgados al ítem en otra moneda
                    // Valor numérico. 14 enteros 4 decimales. Sin validación.
                    RecargoOtrMnda := 0;
                    // Valor por línea de detalle en Otra Moneda - (Precio Unitario en otra moneda * Cantidad ) – Descuento en otra moneda + Recargo en otra moneda.
                    // Valor numérico, 14 enteros y 4 decimales. Obligatorio en Guías de Despacho con Indicador de tipo de Traslado de Bienes = 9
                    MontoItemOtrMnda := 0;

                    if (Seguir) then
                       FacturaElectronica.SetOtraMonedaDetalle(NroLinDet, PrcOtrMon, Moneda, FctConv, DctoOtrMnda, RecargoOtrMnda, MontoItemOtrMnda);

                    // ----------------------------------------------------------------

                    // Descuento (%) en 3 enteros y 2 decimales
                    DescuentoPct := QMDetalleFacturaDESCUENTO.AsFloat;
                    if (Seguir) then
                       FacturaElectronica.SetPorDescuento(NroLinDet, DescuentoPct);

                    // ----------------------------------------------------------------

                    // Monto Descuento
                    // Correspondiente al anterior. Totaliza todos los descuentos otorgados al ítem
                    // Si va el descuento en %, debe ir el monto correspondiente.
                    DescuentoMonto := QMDetalleFacturaI_DESCUENTO.AsFloat;
                    if (Seguir) then
                       FacturaElectronica.SetMontoDescuento(NroLinDet, DescuentoMonto);

                    // ----------------------------------------------------------------

                    // Subdescuento-Tipo de Subdescuento- valor
                    // Indica si el Subdescuento está en $ o %
                    TipoDscto := ''; // Opcional

                    // Subdescuento- valor  -  16 enteros, 2 decimales
                    ValorDscto := 0; // Opcional
                    if (Seguir) then
                       FacturaElectronica.SetDistribucionDescuento(NroLinDet, TipoDscto, ValorDscto);

                    // ----------------------------------------------------------------

                    // Recargo en % - Recargo (%) en 3 enteros y 2 decimales
                    RecargoPct := 0; // Dato condicional
                    if (Seguir) then
                       FacturaElectronica.SetRecargoPorc(NroLinDet, RecargoPct);

                    // ----------------------------------------------------------------

                    // Monto Recargo - Correspondiente al anterior. Totaliza todos los recargos otorgados al ítem
                    // Si va el recargo en %, debe ir el monto correspondiente.
                    RecargoMonto := 0; // Dato condicional
                    if (Seguir) then
                       FacturaElectronica.SetMontoRecargo(NroLinDet, RecargoMonto);  // *********Preguntar si se tiene que poner el recargo *****

                    // ----------------------------------------------------------------

                    // Sub-recargo-Tipo
                    // Indica si el Sub-recargo está en $ o %
                    TipoRecargo := '';
                    ValorRecargo := 0;
                    if (Seguir) then
                       FacturaElectronica.SetDistribucionRecargo(NroLinDet, TipoRecargo, ValorRecargo);

                    // ----------------------------------------------------------------

                    // Código Impuesto o retenciones  - Indica el código según tabla de códigos (Ver en Índice 4.- Codificación Tipos de Impuesto).
                    CodImpAdic := 0;
                    if (Seguir) then
                       FacturaElectronica.SetCodImpuestoORetencion(NroLinDet, CodImpAdic);

                    Next;
                 end;
              end;

           // ----------------------------- <ETIQUETAS OPCIONALES> ---------------------------
           if (Seguir) then
              if ((TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '52') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')
                 ) then
              begin
                 FacturaElectronica.setEtiquetasOpcionales();
              end;

           // ----------------------------- <SUBTOTINFO> ---------------------------

           // Definimos subtotales informativos
           // Número secuencial de acuerdo al número de subtotales
           NroSTI := 0;

           if (Seguir) then
              if (
                 (TipoDocTributario = '33') or
                 (TipoDocTributario = '34') or
                 (TipoDocTributario = '56') or
                 (TipoDocTributario = '61') or
                 (TipoDocTributario = '46') or
                 (TipoDocTributario = '110') or
                 (TipoDocTributario = '112') or
                 (TipoDocTributario = '111')
                 ) then
              begin
                 NroSTI := 0;
                 FacturaElectronica.SetNumSubTotal(NroSTI); // Dato obligatorio   *** Preguntar sobre el tema

                 GlosaSTI := '';
                 if (Seguir) then
                    FacturaElectronica.SetGlosa(GlosaSTI); // Dato obligatorio   *** Preguntar sobre el tema

                 // Orden - Ubicación para Impresión
                 OrdenSTI := 0;
                 if (Seguir) then
                    FacturaElectronica.SetOrden(OrdenSTI); // Opcional

                 // Subtotal Neto - Valor Neto del Subtotal - 16 Enteros y 2 decimales. Aplica en subtotales en $ u otra moneda. SIN VALIDACIÓN
                 SubTotNetoSTI := 0; // Opcional
                 if (Seguir) then
                    FacturaElectronica.SetSubTotalNeto(SubTotNetoSTI);

                 // Subtotal IVA - Valor del IVA del Subtotal
                 SubTotIVASTI := 0; // Opcional
                 if (Seguir) then
                    FacturaElectronica.SetSubTotalIva(SubTotIVASTI);

                 // Subtotal Impuestos adicionales o específicos
                 // Valor de los Impuestos adicionales o específicos del Subtotal
                 SubTotAdicSTI := 0; // Opcional
                 if (Seguir) then
                    FacturaElectronica.SetSubTotalImpAdicOEspecificos(SubTotAdicSTI);

                 // Subtotal no Afecto o Exento
                 // Valor no Afecto o Exento del Subtotal
                 SubTotExeSTI := 0; // Opcional
                 if (Seguir) then
                    FacturaElectronica.SetSubTotalNoAfectoOExento(SubTotExeSTI);

                 ValSubtotSTI := 0; // Opcional
                 if (Seguir) then
                    FacturaElectronica.SetValorSubtotal(ValSubtotSTI);

                 LineasDeta := 0; // Opcional
                 if (Seguir) then
                    FacturaElectronica.SetLineas(LineasDeta);
              end;

           // ----------------------------- <DSCRCGGLOBAL> ---------------------------

           // N° de Línea o N° Secuencial
           // Número secuencial de la línea. La obligatoriedad se refiere a que si se
           // incluye esta zona debe haber al menos una línea y este caso debe ir el dato de número de línea.
           NroLinDR := 0; // Dato obligatorio
           if (Seguir) then
              FacturaElectronica.SetLineaNumSecuencia(NroLinDR);

           // Tipo de movimiento
           // D(descuento) o R(recargo)
           TpoMov := ''; // Dato obligatorio
           if (Seguir) then
              FacturaElectronica.SetTipoMovimiento(TpoMov);

           // Glosa - Especificación de descuento o recargo
           GlosaDR := ''; // Opcional
           if (Seguir) then
              FacturaElectronica.SetGlosaDR(GlosaDR);

           // Tipo de valor - Indica si es Porcentaje o Monto  - “%” o “$”
           TpoValor := ''; // Dato obligatorio
           if (Seguir) then
              FacturaElectronica.SetTipoValorDR(TpoValor);

           // Valor del descuento o recargo en 16 enteros y 2 decimales
           ValorDR := 0; // Dato obligatorio
           if (Seguir) then
              FacturaElectronica.SetValorDR(ValorDR);

           // Valor en otra moneda - Sin validación. 14 Enteros y 4 decimales. Aplica en montos de desctos. o recargos
           ValorDROtrMnda := 0; // Opcional
           if (Seguir) then
              FacturaElectronica.SetValorOtraMoneda(ValorDROtrMnda);

           // Indicador de facturación/ exención
           // Indica si el descuento o recargo afecta a ítems exentos o no afectos a IVA.
           // 1: No afecto o exento de IVA
           // 2: No facturable
           IndExeDR := 0; // Dato condicional
           if (Seguir) then
              FacturaElectronica.SetIndicadorFactExeDR(IndExeDR);

           // ----------------------------- <REFERENCIA> ---------------------------

           // Número de la referencia. De 1 a 40
           // Tipo Documento de referencia
           // Indica si el documento de referencia es:
           // 30: factura
           // 32: factura de venta bienes y servicios no afectos o exentos de IVA 35: Boleta
           // 35: Boleta
           // 38: Boleta exenta
           // 45: factura de compra
           // 55: nota de débito
           // 60: nota de crédito
           // 103: Liquidación
           // 40: Liquidación Factura
           // 43: Liquidación-Factura Electrónica
           // 33: Factura Electrónica
           // 34: Factura No Afecta o Exenta Electrónica
           // 39: Boleta Electrónica
           // 41: Boleta Exenta Electrónica
           // 46: Factura de Compra Electrónica.
           // 56: Nota de Débito Electrónica
           // 61: Nota de Crédito Electrónica
           // 50 Guía de Despacho.
           // 52:Guía de Despacho Electrónica
           // 110: Factura de Exportación Electrónica
           // 111: Nota de Débito de Exportación Electrónica
           // 112: Nota de Crédito de Exportación Electrónica
           // 801 Orden de Compra
           // 802 Nota de pedido
           // 803 Contrato
           // 804 Resolución 805 Proceso ChileCompra 806 Ficha ChileCompra
           // 807 DUS
           // 808 B/L (Conocimiento de embarque)
           // 809 AWB (Air Will Bill)
           // 810 MIC/DTA
           // 811 Carta de Porte
           // 812 Resolución del SNA donde
           // califica Servicios de Exportación
           // 813 Pasaporte
           // 814 Certificado de Depósito Bolsa Prod. Chile.
           // 815 Vale de Prenda Bolsa Prod. Chile


           // Indicador de Referencia Global
           // Documento afecta a un número de más de 20 documentos del mismo Tipo Documento de referencia Se explicita la Razón en Razón Referencia
           // Valor =1 Ejemplo: Factura de todas las guías del mes.
           IndGlobal := 0; // Tipo: 2

           // Identificación del documento de referencia.
           // Folio de documento que referencia.
           // Debe ser cero sólo si el documento tiene encendido el Indicador de referencia global. Puede ser alfanumérico si
           // se trata de un documento no tributario (rango del 800)

           // Sólo si el documento de referencia es de tipo tributario y fue emitido por otro contribuyente12
           // (Con guión y dígito verificador)
           if (Seguir) then
              if ((TipoDocTributario = '56') or (TipoDocTributario = '61')) then
                 RutOtroRef := QMCabeceraFEChileRUTOTR.AsString
              else
                 RutOtroRef := '';

           // Código de referencia
           // Código utilizado para los siguientes casos:
           // a) Nota de Crédito que elimina documento de referencia en forma completa (Factura de venta, Nota de débito, o Factura de compra
           // b) Nota de crédito que corrige un texto del documento de referencia (ver campo Corrección Factura)
           // c) Nota de Débito que elimina una Nota de Crédito en la referencia en forma completa
           // d) Notas de crédito o débito que corrigen montos de otro documento
           // CASOS a) b) y c) DEBEN TENER UN ÚNICO DOCUMENTO DE REFERENCIA.

           // Razón referencia
           // Explicitar razón. Ejemplo una Nota de Crédito que hacer referencia a una factura,
           // indica "descuento por pronto pago" o "error en precio" etc.

           // Insertamos las referencias para Orden de compra
           if (Seguir) then
              with QMSIIDteReferencia do
              begin
                 Close;
                 SelectSQL.Clear;
                 SelectSQL.Add('SELECT DTE.*, FAC.FOLIO ');
                 SelectSQL.Add('FROM SII_DTE_REFERENCIA DTE ');
                 SelectSQL.Add('LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S) ');
                 SelectSQL.Add('WHERE ');
                 SelectSQL.Add('DTE.ID_S = :ID_S AND ');
                 SelectSQL.Add('DTE.TPODOCREF = :TPODOCREF ');
                 Params.ByName['ID_S'].AsInteger := QMDTEID_S.AsInteger;
                 Params.ByName['TPODOCREF'].AsString := '801';
                 Open;
                 DisableControls;
                 try
                    First;
                    while not EOF do
                    begin
                       LineaReferencia := LineaReferencia + 1;
                       FolioRef := QMSIIDteReferenciaFOLIOREF.AsString;
                       FacturaElectronica.SetReferenciaDTE(LineaReferencia, IndGlobal, QMSIIDteReferenciaCODREF.AsInteger, FolioRef, QMSIIDteReferenciaTPODOCREF.AsString, RutOtroRef, QMSIIDteReferenciaRAZONREF.AsString, QMSIIDteReferenciaFCHREF.AsDateTime);
                       Next;
                    end;
                 finally
                    EnableControls;
                 end;
              end;

           // Insertamos las referencias para Guias de despacho
           if (Seguir) then
              with QMSIIDteReferencia do
              begin
                 Close;
                 SelectSQL.Clear;
                 SelectSQL.Add('SELECT DTE.*, FAC.FOLIO ');
                 SelectSQL.Add('FROM SII_DTE_REFERENCIA DTE ');
                 SelectSQL.Add('LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S) ');
                 SelectSQL.Add('WHERE ');
                 SelectSQL.Add('DTE.ID_S = :ID_S AND ');
                 SelectSQL.Add('DTE.TPODOCREF in (''50'',''52'') ');
                 Params.ByName['ID_S'].AsInteger := QMDTEID_S.AsInteger;
                 Open;
                 DisableControls;
                 try
                    First;
                    while not EOF do
                    begin
                       LineaReferencia := LineaReferencia + 1;
                       FolioRef := QMSIIDteReferenciaFOLIOREF.AsString;
                       FacturaElectronica.SetReferenciaDTE(LineaReferencia, IndGlobal, QMSIIDteReferenciaCODREF.AsInteger, FolioRef, QMSIIDteReferenciaTPODOCREF.AsString, RutOtroRef, QMSIIDteReferenciaRAZONREF.AsString, QMSIIDteReferenciaFCHREF.AsDateTime);
                       Next;
                    end;
                 finally
                    EnableControls;
                 end;
              end;

           // Insertamos las referencias para Facturas
           if (Seguir) then
              with QMSIIDteReferencia do
              begin
                 Close;
                 SelectSQL.Clear;
                 SelectSQL.Add('SELECT DTE.*, FAC.FOLIO ');
                 SelectSQL.Add('FROM SII_DTE_REFERENCIA DTE ');
                 SelectSQL.Add('LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S) ');
                 SelectSQL.Add('WHERE ');
                 SelectSQL.Add('DTE.ID_S = :ID_S AND ');
                 SelectSQL.Add('DTE.TPODOCREF in (''33'') ');
                 Params.ByName['ID_S'].AsInteger := QMDTEID_S.AsInteger;
                 Open;
                 DisableControls;
                 try
                    First;
                    while not EOF do
                    begin
                       LineaReferencia := LineaReferencia + 1;
                       FolioRef := QMSIIDteReferenciaFOLIOREF.AsString;
                       FacturaElectronica.SetReferenciaDTE(LineaReferencia, IndGlobal, QMSIIDteReferenciaCODREF.AsInteger, FolioRef, QMSIIDteReferenciaTPODOCREF.AsString, RutOtroRef, QMSIIDteReferenciaRAZONREF.AsString, QMSIIDteReferenciaFCHREF.AsDateTime);
                       Next;
                    end;
                 finally
                    EnableControls;
                 end;
              end;

           // Insertamos las referencias para el resto de documentos que no sean orden de compra ni guias de despacho
           if (Seguir) then
              with QMSIIDteReferencia do
              begin
                 Close;
                 SelectSQL.Clear;
                 SelectSQL.Add('SELECT DTE.*, FAC.FOLIO ');
                 SelectSQL.Add('FROM SII_DTE_REFERENCIA DTE ');
                 SelectSQL.Add('LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S) ');
                 SelectSQL.Add('WHERE ');
                 SelectSQL.Add('DTE.ID_S = :ID_S AND ');
                 SelectSQL.Add('DTE.TPODOCREF not in (''801'',''50'',''52'',''33'') ');
                 Params.ByName['ID_S'].AsInteger := QMDTEID_S.AsInteger;
                 Open;
                 DisableControls;
                 try
                    First;
                    while not EOF do
                    begin
                       LineaReferencia := LineaReferencia + 1;
                       FolioRef := QMSIIDteReferenciaFOLIOREF.AsString;
                       FacturaElectronica.SetReferenciaDTE(LineaReferencia, IndGlobal, QMSIIDteReferenciaCODREF.AsInteger, FolioRef, QMSIIDteReferenciaTPODOCREF.AsString, RutOtroRef, QMSIIDteReferenciaRAZONREF.AsString, QMSIIDteReferenciaFCHREF.AsDateTime);
                       Next;
                    end;
                 finally
                    EnableControls;
                 end;
              end;

           // Restauramos select de QMSIIDteReferencia
           if (Seguir) then
              with QMSIIDteReferencia do
              begin
                 Close;
                 SelectSQL.Clear;
                 SelectSQL.Add('SELECT DTE.*, FAC.FOLIO ');
                 SelectSQL.Add('FROM SII_DTE_REFERENCIA DTE ');
                 SelectSQL.Add('LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S) ');
                 SelectSQL.Add('WHERE ');
                 SelectSQL.Add('DTE.ID_S = :ID_S ');
                 SelectSQL.Add('ORDER BY DTE.NROLINREF ');
                 Params.ByName['ID_S'].AsInteger := QMDTEID_S.AsInteger;
                 Open;
              end;

           // SOLO PARA LA CERTIFICACION en la primera linea de referencia, el tipo de referencia debe ser "SET" y la razon de referencia debe contener el numero de caso "CASO XXXX"
           if (Seguir) then
              if ((TipoDocTributario <> '39') and (TipoDocTributario <> '41')) then
                 FacturaElectronica.setEtiquetasOpcionales2;

           // ----------------------------- <COMISIONES> ---------------------------
           // Descripcion: Número de comisión u otro cargo. De 1 a 20.
           // Validacion: Número secuencial de la línea. La obligatoriedad se refiere a que si se incluye esta zona debe
           // haber al menos una línea y este caso debe ir el dato de número de línea.
           NroLinCom := 0;
           if (Seguir) then
              FacturaElectronica.SetNumLineaSecuencialComision(NroLinCom);

           TipoMovim := '';
           if (Seguir) then
              FacturaElectronica.SetTipoMovimientoComision(TipoMovim);

           GlosaComision := '';
           if (Seguir) then
              FacturaElectronica.SetGlosaComision(GlosaComision);

           TasaComision := 0;
           if (Seguir) then
              FacturaElectronica.SetTasaComision(TasaComision);

           ValComNeto := 0;
           if (Seguir) then
              FacturaElectronica.SetComisionNeto(ValComNeto);

           ComExento := 0;
           if (Seguir) then
              FacturaElectronica.SetComisionExento(ComExento);

           IvaComision := 0;
           if (Seguir) then
              FacturaElectronica.SetIVAComision(IvaComision);

        end;

        //Determinamos el Rut del receptor para la cartula
        if ((TipoDocTributario = '52') or (TipoDocTributario = '111')) then
           RutReceptorCaratula := '60803000-K'
        else
           RutReceptorCaratula := RutReceptor;

        FacturaElectronica.Finaliza;
     finally
        FacturaElectronica.Free;
     end;

     // Envia al PHP el xml generado

     // Obtenemos URL del SSI_Chile
     DMMain.Log('Obtenemos URL del SSI_Chile - ' + EndpointSII_CL);
     EndpointSII_CL := DMMain.DameUrlEndPoint('DTE');

     // Definimos ruta para el envio del XML
     UrlEnvioXml := EndpointSII_CL + '/recepcionXML.php';

     // Enviamos xml Factura
     DMMain.Log('Enviamos xml Factura');
     if not (UploadFile(UrlEnvioXml, FicheroXML)) then
     begin
        ShowMessage(_('No se ha podido subir el XML del DTE'));
        Seguir := False;
     end
     else
        // Si se ha enviado el fichero el archivo eliminamos del temporal
        DeleteFile(FicheroXML);

     // Obtenemos certificado
     if (Seguir) then
     begin
        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Text := 'SELECT FIRST 1 CERTIFICADO, CONTRASENYA, RUT, FECHA_RESOLUCION, NRO_RESOLUCION FROM SII_CERTIFICADOS WHERE EMPRESA = :EMPRESA';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Open;
                 Contrasenya := FieldByName('CONTRASENYA').AsString;
                 Rut := FieldByName('RUT').AsString;
                 FechaResolucion := FieldByName('FECHA_RESOLUCION').AsDateTime;
                 NroResolucion := FieldByName('NRO_RESOLUCION').AsInteger;

                 FicheroCertificado := DameTempPath + Rut + '.p12'; // IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + Rut + '.p12'
                 m := CreateBlobStream(FieldByName('CERTIFICADO'), bmRead);
                 try
                    f := TFileStream.Create(FicheroCertificado, fmCreate);
                    try
                       f.CopyFrom(m, m.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    m.Free;
                 end;

                 // Enviamos Certificado
                 DMMain.Log('Enviamos xml Autorizacion folios');
                 if not (UploadFile(UrlEnvioXml, FicheroCertificado)) then
                    ShowMessage(_('No se ha podido enviar el certificado de la empresa'))
                 else
                    // Si se ha enviado el fichero el archivo eliminamos del temporal
                    DeleteFile(FicheroCertificado);

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
     // Obtenemos Autorizaciones de folio

     DS := TFIBDataSet.Create(nil);
     if (Seguir) then
        try
           with DS do
           begin
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;

                 SelectSQL.Add(' SELECT FIRST 1 XML_AUTORIZACION_FOLIOS, NUMERO_FINAL, CONTADOR, ID ');
                 SelectSQL.Add(' FROM SII_FOLIOS ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' EMPRESA=:EMPRESA AND ');
                 SelectSQL.Add(' CANAL=:CANAL AND ');
                 SelectSQL.Add(' SERIE=:SERIE AND ');
                 SelectSQL.Add(' TIPO=:TIPO AND ');
                 SelectSQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                 SelectSQL.Add(' ACTIVO = 1 AND ');
                 SelectSQL.Add(' :FOLIO BETWEEN NUMERO_INICIO AND NUMERO_FINAL ');
                 SelectSQL.Add(' ORDER BY FECHA_AUTORIZACION DESC ');

                 Params.ByName['EMPRESA'].AsInteger := QMDTEEMPRESA.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMDTECANAL.AsInteger;
                 Params.ByName['SERIE'].AsString := QMDTESERIE.AsString;
                 Params.ByName['TIPO'].AsString := QMDTETIPO.AsString;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTributario;
                 Params.ByName['FOLIO'].AsInteger := QMDTEFOLIO.AsInteger;

                 Open;

                 FolioNumeroFinal := FieldByName('NUMERO_FINAL').AsInteger;
                 FolioContador := FieldByName('CONTADOR').AsInteger;
                 FoliosRestantes := FolioNumeroFinal - FolioContador;
                 FolioId := FieldByName('ID').AsInteger;
                 FicheroAutFolios := DameTempPath + Rut + '.xml';
                 m := CreateBlobStream(FieldByName('XML_AUTORIZACION_FOLIOS'), bmRead);
                 try
                    f := TFileStream.Create(FicheroAutFolios, fmCreate);
                    try
                       f.CopyFrom(m, m.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    m.Free;
                 end;

                 // Enviamos xml Autorizacion folios
                 DMMain.Log('Enviamos xml Autorizacion folios');

                 if not (UploadFile(UrlEnvioXml, FicheroAutFolios)) then
                    raise Exception.Create(_('No se ha podido enviar el XML de Autorizacion de folios.'))
                 else
                 begin
                    // Si se ha enviado el fichero el archivo eliminamos del temporal
                    DeleteFile(FicheroAutFolios);
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

     //Refrescamos DS
     Refrescar(QMDTE, 'ID_S', IdDoc);
     QMCabeceraFEChile.Close;
     QMCabeceraFEChile.Open;

     // Envio DTE
     RespuestaFactura := '';
     Respuesta := TStringList.Create;
     if (Seguir) then
        try
           FInformacionEnvioDte.MLog.Lines.Add(_('Enviando DTE al servicio de impuestos'));
           FacturaElectronica.ConsultaSiiChile(EndpointSII_CL + '/' +
              TipoEnvio + '.php?xmlfile=' + ExtractFileName(FicheroXML) +
              '&password=' + Contrasenya + '&rut=' + Rut +
              '&RutReceptorCaratula=' + RutReceptorCaratula +
              '&TipoDocTributario=' + TipoDocTributario +
              '&NroResolucion=' + IntToStr(NroResolucion) +
              '&FechaResolucion=' + FormatDateTime('yyyy-mm-dd', FechaResolucion)
              , Respuesta);

           // Guardamos en temporal Xml respuesta generado
           Respuesta.SaveToFile(DameTempPath + 'respuesta.xml');
           // RespuestaFactura := Respuesta.Text;

           FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo respuesta del envio'));

           // Recuperamos datos de respuesta DTE y los pasamos a XML
           DMMain.Log('Recuperamos datos DTE y los pasamos a XML');
           Documento := TXMLDocument.Create(Self);
           try
              with Documento do
              begin
                 XML.Text := Respuesta.Text;
                 //XML.LoadFromFile(DameTempPath + 'respuesta.xml');

                 DMMain.Log('Documento.Active := True');
                 // Se activa para poder utilizar el componente
                 Active := True;
                 DMMain.Log('Documento.Encoding = utf-8');
                 // Codigifacion UTF-8
                 // Para Envio DTE de Chile debe ser ISO-8859-1
                 Encoding := 'utf-8';
                 DMMain.Log('Documento.NodeIndentStr = #8');
                 // Caracter para indentar el fichero XML
                 NodeIndentStr := #8;

                 DMMain.Log('Obtener nodos');
                 // Obtenemos el trackID
                 TrackId := DameDato(DocumentElement, ['TRACKID']);
                 DMMain.Log('TrackId' + TrackId);

                 // Obtenemos xml generado
                 XMLGenerado := DameDato(DocumentElement, ['XML_GENERADO']);
                 DMMain.Log('XMLGenerado:' + XMLGenerado);

                 XMLGeneradoCliente := DameDato(DocumentElement, ['XML_GENERADO_CLIENTE']);
                 DMMain.Log('XMLGeneradoCliente:' + XMLGeneradoCliente);

                 CantidadErrores := StrToInt(DameDato(DocumentElement, ['ERROR_COUNT']));

                 DMMain.Log('Obtener errores');
                 MensageError := '';
                 if (CantidadErrores > 0) then
                 begin
                    for i := 1 to CantidadErrores do
                       MensageError := MensageError + DameDato(DocumentElement, ['ERROR_MESSAGE', 'ERROR_' + IntToStr(i)]) + #13#10;
                 end
                 else
                 // Deshabilitamos Caff si ya no es valido
                 if ((FolioNumeroFinal = FolioContador) and (FolioNumeroFinal = QMDTEFOLIO.AsInteger)) then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'UPDATE SII_FOLIOS SET ACTIVO = 0 WHERE ID = :ID ';
                          Params.ByName['ID'].AsInteger := FolioId;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
                 DMMain.Log('Fin Obtener errores');
                 DMMain.Log('Fin Obtener nodos');

                 // Asignamos timbres del(os) folio(s) en base de datos
                 DMMain.Log('Asignamos timbres');
                 for i := 0 to DocumentElement.ChildNodes.Count - 1 do
                 begin
                    Nodo := DocumentElement.ChildNodes[i];
                    if Assigned(Nodo) then
                    begin
                       if (Copy(Nodo.NodeName, 1, 6) = 'FOLIO_') then
                       begin
                          // Obtenemos el numero de folio
                          FolioDTE := StrToIntDef(Copy(Nodo.NodeName, 7, Length(Nodo.NodeName)), 0);
                          XMLTimbreElectronico := DameDato(nodo, ['TIMBRE']);
                          TimbreElectronicoImg := DameDato(nodo, ['TIMBRE_PDF417']);
                          DMMain.Log('Asignamos timbre electronico e imagen');
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
                                   DMMain.Log('Guardamos el XML generado en la base de datos select de GES_CABECERAS_S_FE_CHL');
                                   SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FE_CHL  ');
                                   SelectSQL.Add(' WHERE ');
                                   SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
                                   SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
                                   SelectSQL.Add(' CANAL = :CANAL AND ');
                                   SelectSQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                                   SelectSQL.Add(' FOLIO = :FOLIO');

                                   UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FE_CHL ');
                                   UpdateSQL.Add(' SET ');
                                   UpdateSQL.Add(' XML_GENERADO = :XML_GENERADO, ');
                                   // Si el DTE es una guia de despacho no se recibe xml para cliente
                                   // if (TipoDocTributario <> '52') then
                                   UpdateSQL.Add(' XML_GENERADO_CLIENTE = :XML_GENERADO_CLIENTE, ');
                                   UpdateSQL.Add(' XML_RESPUESTA = :XML_RESPUESTA, ');
                                   UpdateSQL.Add(' SII_TRACKID = :SII_TRACKID, ');
                                   UpdateSQL.Add(' CANTIDAD_ERRORES = :CANTIDAD_ERRORES, ');
                                   UpdateSQL.Add(' MENSAJE_ERROR = :MENSAJE_ERROR, ');
                                   UpdateSQL.Add(' TIMBRE_TEXTO = :TIMBRE_TEXTO, ');
                                   UpdateSQL.Add(' TIMBRE_COD_BARRA = :TIMBRE_COD_BARRA ');
                                   UpdateSQL.Add(' WHERE ');
                                   UpdateSQL.Add(' EMPRESA = :EMPRESA AND ');
                                   UpdateSQL.Add(' EJERCICIO = :EJERCICIO AND ');
                                   UpdateSQL.Add(' CANAL = :CANAL AND ');
                                   UpdateSQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                                   UpdateSQL.Add(' FOLIO = :FOLIO ');

                                   Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                   Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                                   Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                   Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTributario;
                                   Params.ByName['FOLIO'].AsInteger := FolioDTE;

                                   Open;
                                   Edit;

                                   FieldByName('XML_GENERADO').Value := XMLGenerado;

                                   // Si el DTE es una guia de despacho no se recibe xml para cliente
                                   // if (TipoDocTributario <> '52') then
                                   FieldByName('XML_GENERADO_CLIENTE').Value := XMLGeneradoCliente;

                                   FieldByName('XML_RESPUESTA').Value := Respuesta.Text;
                                   FieldByName('CANTIDAD_ERRORES').Value := CantidadErrores;
                                   FieldByName('MENSAJE_ERROR').Value := Copy(MensageError, 1, 100);
                                   FieldByName('SII_TRACKID').Value := TrackId;
                                   FieldByName('TIMBRE_TEXTO').Value := XMLTimbreElectronico;

                                   DMMain.Log('Guardamos el timbre en memorystream');
                                   n := CreateBlobStream(FieldByName('TIMBRE_COD_BARRA'), bmWrite);
                                   try
                                      AMemoryStream := TMemoryStream.Create;
                                      with AMemoryStream do
                                      begin
                                         try
                                            s := string(TimbreElectronicoImg);
                                            StrB64ToStream(s, AMemoryStream);
                                            Position := 0;
                                            n.CopyFrom(AMemoryStream, AMemoryStream.Size);
                                         finally
                                            Free;
                                         end;
                                      end;
                                   finally
                                      n.Free;
                                   end;

                                   Post;

                                   Transaction.Commit;
                                   Transaction.StartTransaction;

                                   Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                   Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                                   Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                   Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTributario;
                                   Params.ByName['FOLIO'].AsInteger := FolioDTE;

                                   Open;

                                   // Si no hay errores guardamos el xml timbrado como adjunto
                                   if (CantidadErrores = 0) then
                                   begin
                                      DMMain.Log('Sin errores');

                                      FicheroXML := 'DTE_' + TipoDocTributario + '_' + Copy(RutReceptor, 0, Length(RutReceptor) - 2) + '_' + FolioEnvio + '.xml';
                                      FicheroXML := DameTempPath + FicheroXML;

                                      DMMain.Log('Guardamos el xml En un temporal - ' + FicheroXML);
                                      with TStringList.Create do
                                      begin
                                         try
                                            Text := XMLGeneradoCliente; // XML generado con caratula para el cliente
                                            SaveToFile(FicheroXML);
                                         finally
                                            Free;
                                         end;
                                      end;

                                      DMMain.Log('Guardamos fichero como Adjunto');
                                      AbreData(TDMAdjunto, DMAdjunto);

                                      // Si guardan los ficheros PDF y XML como adjuntos
                                      if (TipoDocTributario <> '52') then
                                      begin
                                         // Crear la factura en PDF
                                         AbreData(TDMLstFactura, DMLstFactura);
                                         Memo := TStringList.Create;
                                         try
                                            DMLstFactura.MostrarListadoMail(FieldByName('ID_S').AsInteger, QMDTESERIE.AsString, 2, QMDTEEJERCICIO.AsInteger, Memo);
                                            FicheroPDF := DMLstFactura.rutaFich;
                                         finally
                                            Memo.Free;
                                            CierraData(DMLstFactura);
                                         end;
                                         DMAdjunto.CreaAdjunto(QMDTETIPO.AsString, FieldByName('ID_S').AsInteger, FicheroPDF, Format(_('Factura enviada %s'), [DateTimeToStr(Now)]));
                                         DMAdjunto.CreaAdjunto(QMDTETIPO.AsString, FieldByName('ID_S').AsInteger, FicheroXML, Format(_('Factura electronica enviada %s'), [DateTimeToStr(Now)]));
                                      end
                                      else
                                      begin
                                         // Crear la guia de despacho en PDF
                                         AbreData(TDMLstAlbaranes, DMLstAlbaranes);
                                         // Memo := TStringList.Create;
                                         try
                                            DMLstAlbaranes.MostrarListadoMail(FieldByName('ID_S').AsInteger, QMDTESERIE.AsString, 2, QMDTEEJERCICIO.AsInteger, False);
                                            FicheroPDF := DMLstAlbaranes.rutaFich;
                                         finally
                                            // Memo.Free;
                                            CierraData(DMLstAlbaranes);
                                         end;
                                         DMAdjunto.CreaAdjunto(QMDTETIPO.AsString, FieldByName('ID_S').AsInteger, FicheroPDF, Format(_('Guia enviada %s'), [DateTimeToStr(Now)]));
                                         DMAdjunto.CreaAdjunto(QMDTETIPO.AsString, FieldByName('ID_S').AsInteger, FicheroXML, Format(_('Guia electronica enviada %s'), [DateTimeToStr(Now)]));
                                      end;

                                      CierraData(DMAdjunto);

                                      // Verificamos si se envia automaticamente el DTE por E-mail al cliente
                                      if (LeeParametro('DTEENVI001') = 'S') then
                                      begin
                                         // Si el usuario tiene configurado el SMTP enviamos email al cliente
                                         if (VerificaSmtpDTE) then
                                         begin
                                            // Enviamos el XML por email al cliente
                                            if (TerceroTieneCorreo(QMDTETERCERO.AsInteger, QMDTETIPO.AsString)) then
                                            begin
                                               AbreData(TDMListados, DMListados);
                                               FicherosEnviar := TStringList.Create;

                                               InicializaVariableEmail('DTE');
                                               with VariableEmail do
                                               begin
                                                  Ejercicio := QMDTEEJERCICIO.AsInteger;
                                                  Serie := QMDTESERIE.AsString;
                                                  NumeroDocumento := FolioDTE; // Se toma el Folio como numero de documento
                                                  Fecha := FechaDocumento;
                                                  SuReferencia := QMDTESU_REFERENCIA.AsString;
                                                  SuPedido := '';
                                                  Folio := IntToStr(FolioDTE);
                                                  TituloDocTributario := DameTituloTipoDocTributario(TipoDocTributario);
                                                  NombreFichero := FicheroPDF;
                                                  Matricula := '';
                                               end;
                                               DamePartesEmail(Asunto, CuerpoMail);

                                               try
                                                  // Ficheros a enviar segun parámetro (*P*DF; *X*ML)
                                                  param_DTEENVI002 := LeeParametro('DTEENVI002');

                                                  NombreFichero := '';
                                                  if ((Pos('P', param_DTEENVI002) > 0){ and (TipoDocTributario <> '52')}) then
                                                  begin
                                                     FicherosEnviar.Add(FicheroPDF);
                                                     NombreFichero := FicheroPDF;
                                                  end;

                                                  if ((Pos('X', param_DTEENVI002) > 0){ and (TipoDocTributario <> '52')}) then
                                                  begin
                                                     FicherosEnviar.Add(FicheroXML);
                                                     NombreFichero := FicheroXML;
                                                  end;

                                                  FInformacionEnvioDte.MLog.Lines.Add(_('Enviando DTE al E-mail del cliente'));
                                                  DMListados.SendMailClientePDF(Cliente, CuerpoMail, FicherosEnviar, NombreFichero, Asunto, QMDTETIPO.AsString, -1, False, '', 'DTE');

                                                  XmlEnviadoCliente := True
                                               finally
                                                  CuerpoMail.Free;
                                                  FicherosEnviar.Free;
                                               end;

                                               CierraData(DMListados);
                                            end
                                            else
                                               XmlEnviadoCliente := False;
                                         end
                                         else
                                            MessageDlg(_('ATENCIÓN: No tiene configurado el SMTP para el envio de DTE.' +
                                               #13#10 + 'Por favor, envie manualmente los adjuntos del documento a su cliente'),
                                               mtWarning, [mbOK], 0);
                                      end;
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
              end;
           finally
              Documento.Free;
           end;
        finally
           Respuesta.Free;
        end;

     // Maracamos como Xml enviado a cliente
     if (Seguir) then
        if ((XmlEnviadoCliente) and (TipoDocTributario <> '52')) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_CABECERAS_S_FE_CHL ');
                 SQL.Add(' SET ');
                 SQL.Add(' ENVIADO_MAIL_CLIENTE = 1 ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' FOLIO = :FOLIO ');

                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['FOLIO'].AsInteger := FolioDTE;

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

     // Dependiendo del resultado del envío DTE enviamos un mensaje u otro
     if (MensageError > '') then
     begin
        DMMain.Log('Error: ' + MensageError);
        FInformacionEnvioDte.MLog.Lines.Add(_(MensageError));
        ShowMessage(MensageError);
     end
     else
     begin
        if (XmlEnviadoCliente) then
        begin
           FInformacionEnvioDte.MLog.Lines.Add(_('Factura enviada con exito!'));
           FoliosRestantes := FoliosRestantes - 1;
           FInformacionEnvioDte.MLog.Lines.Add(_('Folios restantes: ' + IntToStr(FoliosRestantes)));
           DMMain.Log(_('Factura enviada con exito!'));
        end
        else
        begin
           FInformacionEnvioDte.MLog.Lines.Add(_('La Factura fue enviada al SII con exito, pero el envio del XML al cliente debera hacerlo manualmente'));
           DMMain.Log(_('La Factura fue enviada al SII con exito, pero el envio del XML al cliente debera hacerlo manualmente'));
        end;
        DMMain.Log(_('Fin del envio'));
     end;
     // Limpiar entradas
     QMDTE.Close;
     QMDTE.Open;
     DMMain.LogFin('FacturaElectronica');
  finally
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);

     if (CerrarVentana) then
     begin
        FInformacionEnvioDte.Close;
        if (FoliosRestantes <= 3) then
           ShowMessage(_('Quedan ' + IntToStr(FoliosRestantes) + ' folios disponibles en el CAF'));
     end;

     if ((Seguir) and (CantidadErrores > 0)) then//Limpiamos solo folio de documento
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              if (Tipo = 'FAC') then
                 SQL.Add('UPDATE GES_CABECERAS_S_FAC ')
              else
              if (Tipo = 'ALB') then
                 SQL.Add('UPDATE GES_CABECERAS_S_ALB ');

              SQL.Add('SET ');
              SQL.Add('FOLIO = 0 ');
              SQL.Add('WHERE ');
              SQL.Add('ID_S = :ID_S');

              Params.ByName['ID_S'].AsInteger := QMDTEID_S.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
        ShowMessage(_('El SII reporto errores en el DTE'));
     end
     else
     //Si ocurrio un error limpiamos registro de folio
     if (not Seguir) then
     begin
        LimpiaFolioProcesado(QMDocumentosEMPRESA.AsInteger, QMDocumentosCANAL.AsInteger, QMDocumentosSERIE.AsString, QMDocumentosTIPO.AsString, QMDTEFOLIO.AsInteger, QMDTEID_S.AsInteger, QMDTETIPO_DOC_TRIBUTARIO.AsString);
        ShowMessage(_('No se ha podido enviar el DTE'));
     end;

  end;
end;

procedure TDMEnviaXMLFacturasChl.QMDTEAfterOpen(DataSet: TDataSet);
begin
  QMDetalleFactura.Open;
  QMCabeceraFEChile.Open;
  QMSIIDteReferencia.Open;
  QMSIITipDocTributario.Open;
  QMRCV_VENTA.Open;
  xAdjuntos.Open;
end;

procedure TDMEnviaXMLFacturasChl.QMDTEBeforeClose(DataSet: TDataSet);
begin
  QMDetalleFactura.Close;
  QMCabeceraFEChile.Close;
  QMSIIDteReferencia.Close;
  QMSIITipDocTributario.Close;
  QMRCV_VENTA.Close;
  xAdjuntos.Close;
end;

procedure TDMEnviaXMLFacturasChl.EnvioDteMasivo;
begin
  with QMDocumentos do
  begin
     First;
     // Recorremos los documentos seleccionamos
     while not EOF do
     begin
        if (QMDocumentos.FieldByName('ENTRADA_FACTURACION').AsInteger = REntorno.Entrada) then
        begin
           if (LeeParametro('DTEENVI004') = 'S') then
           begin
              try
                 AbreData(TDMDTEChl, DMDTEChl);
                 try
                    DMDTEChl.EnviaDTE(QMDocumentosID_S.AsInteger);
                 finally
                    CierraData(DMDTEChl);
                 end;
              except
                 ShowMessage(Format(_('No se ha podido enviar el Documento: %s - %s '), [QMDocumentosTIPO_DOC_TRIBUTARIO.AsString, IntToStr(QMDocumentosFOLIO.AsInteger)]));
              end;
           end
           else
           begin
              try
                 EnviaDte(QMDocumentosID_S.AsInteger, True);
              except
                 ShowMessage(Format(_('No se ha podido enviar el Documento: %s - %s '), [QMDocumentosTIPO_DOC_TRIBUTARIO.AsString, IntToStr(QMDocumentosFOLIO.AsInteger)]));
              end;
           end;
        end;
        Next;
     end;
  end;
end;

function TDMEnviaXMLFacturasChl.TerceroTieneCorreo(Tercero: integer; Tipo: string): boolean;
begin
  /// Comprueba si el tercero tiene un correo para enviar documento.
  /// *** Devuevle FALSO si TIPO no es FAC o ALB, aunque el tercero tenga un correo asignado en su ficha.

  /// --------------------------------------------------------------------------
  /// DMListados.SeleccionarDireccionesEnvio()
  /// Los documentos se enviaran a los correos marcados con el TIPO de documento.
  /// Si no hay ninguno marcado, segun la configuracion de SELMAIL001:
  ///   (T) - Se enviará a TODOS los correos.
  ///   (F) - Se enviará solo al de la ficha del tercero.

  Result := False;

  if ((Tipo = 'FAC') or (Tipo = 'ALB')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT EMAIL FROM L_DAME_EMAIL_TERCERO_TIPO(?TERCERO, ?TIPO) ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMAIL_FIC = 1 ');

           if (Tipo = 'FAC') then
              SQL.Add(' OR EMAIL_FAC = 1 ')
           else
           if (Tipo = 'ALB') then
              SQL.Add(' OR EMAIL_ALB = 1 ');

           Params.ByName['TERCERO'].AsInteger := Tercero;
           Params.ByName['TIPO'].AsString := 'ALL';
           ExecQuery;
           Result := (FieldByName['EMAIL'].AsString > '');
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.AbreXmlDTE;
var
  DS : TFIBDataSet;
  //Titulo : string;
  FicheroXml : string;
  m, f : TStream;
  RutEmisor : string;
  Folio : integer;
begin
  // Obtenemos Xml del Dte
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT RUTEMISOR, FOLIO, XML_GENERADO FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := QMDocumentosID_S.AsInteger;
           Open;
           RutEmisor := FieldByName('RUTEMISOR').AsString;
           Folio := FieldByName('FOLIO').AsInteger;

           FicheroXml := DameTempPath + format('%s_%s.xml', [Trim(RutEmisor), IntToStr(Folio)]);
           m := CreateBlobStream(FieldByName('XML_GENERADO'), bmRead);
           try
              f := TFileStream.Create(FicheroXml, fmCreate);
              try
                 f.CopyFrom(m, m.Size);
              finally
                 f.Free;
              end;
           finally
              m.Free;
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

  if ShellExecute(Application.Handle, nil, PChar(FicheroXml), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('No se pudo abrir el Xml del DTE'));
end;

procedure TDMEnviaXMLFacturasChl.QMDocumentosCalcFields(DataSet: TDataSet);
begin
  if (QMDocumentosXML_GENERADO.AsString > '') then
     QMDocumentosXML_DTE_RECIBIDO.AsInteger := 1
  else
     QMDocumentosXML_DTE_RECIBIDO.AsInteger := 0;

  if (QMDocumentosXML_RESPUESTA.AsString > '') then
     QMDocumentosXML_RESPUESTA_ENVIO.AsInteger := 1
  else
     QMDocumentosXML_RESPUESTA_ENVIO.AsInteger := 0;
end;

procedure TDMEnviaXMLFacturasChl.AbreXmlRespuestaEnvio;
var
  DS : TFIBDataSet;
  //Titulo : string;
  FicheroXml : string;
  m, f : TStream;
  RutEmisor : string;
  Folio : integer;
begin
  // Obtenemos Xml de respuesta de envio DTE
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT RUTEMISOR, FOLIO, XML_RESPUESTA FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := QMDocumentosID_S.AsInteger;
           Open;
           RutEmisor := FieldByName('RUTEMISOR').AsString;
           Folio := FieldByName('FOLIO').AsInteger;

           FicheroXml := DameTempPath + format('%s_%s_respuesta.xml', [Trim(RutEmisor), IntToStr(Folio)]);
           m := CreateBlobStream(FieldByName('XML_RESPUESTA'), bmRead);
           try
              f := TFileStream.Create(FicheroXml, fmCreate);
              try
                 f.CopyFrom(m, m.Size);
              finally
                 f.Free;
              end;
           finally
              m.Free;
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

  if ShellExecute(Application.Handle, nil, PChar(FicheroXml), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('No se pudo abrir el Xml de respuesta de envio DTE'));
end;

function TDMEnviaXMLFacturasChl.VerificaSmtpDTE: boolean;
begin
  /// Verifica si tiene datos de configuracion SMTP para envio DTE
  Result := False;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT VENTAS_SERVIDOR_SMTP, VENTAS_USUARIO_SMTP, VENTAS_PASSWORD_SMTP ');
        SQL.Add(' FROM SII_CONFIGURACION_EMAIL ');
        SQL.Add(' WHERE EMPRESA = :EMPRESA ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := ((FieldByName['VENTAS_SERVIDOR_SMTP'].AsString > '') and
           (FieldByName['VENTAS_USUARIO_SMTP'].AsString > '') and
           (FieldByName['VENTAS_PASSWORD_SMTP'].AsString > ''));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMEnviaXMLFacturasChl.LimpiaFolioProcesado(Empresa, Canal: integer; Serie, Tipo: string; Folio, IdS: integer; TipoDocTributario: string): boolean;
begin
  Result := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE SII_ELIMINA_DATOS_ENVIO_DTE(:EMPRESA, :CANAL, :SERIE, :TIPO, :CONTADOR, :TIPO_DOC_TRIBUTARIO, :ID_S) ');

        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CONTADOR'].AsInteger := Folio;
        Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTributario;
        Params.ByName['ID_S'].AsInteger := IdS;
        ExecQuery;
        FreeHandle;
        Result := True;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnviaXMLFacturasChl.EnviaConsultaDocumentoSII;
begin
  AbreData(TDMDTEChl, DMDTEChl);
  DMDTEChl.EnviaConsultaDocumentoSII(QMDocumentosID_S.AsInteger);
  CierraData(DMDTEChl);
end;

procedure TDMEnviaXMLFacturasChl.EnviaConsultaMasivaDocumentoSII;
var
  WndList : Pointer;
begin
  AbreData(TDMDTEChl, DMDTEChl);
  FInformacionEnvioDte := TFInformacionEnvioDte.Create(Self);
  try
     WndList := DisableTaskWindows(FInformacionEnvioDte.Handle);
     with FInformacionEnvioDte do
     begin
        LBLGeneral.Caption := _('Inicializando consulta...');
        MLog.Lines.Clear;
        Show;
     end;

     with QMDocumentos do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (QMDocumentosENTRADA_FACTURACION.AsInteger > 0) then
              begin
                 FInformacionEnvioDte.MLog.Lines.Add(_('Realizando consulta para el documento: ' + QMDocumentosTIPO_DOC_TRIBUTARIO.AsString + '-' + QMDocumentosFOLIO.AsString));
                 DMDTEChl.EnviaConsultaDocumentoSII(QMDocumentosID_S.AsInteger);
              end;
              Next;
           end;
        finally
           EnableControls;
        end;
     end;
  finally
     FInformacionEnvioDte.MLog.Lines.Add(_('Finalizado las consultas'));
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     FInformacionEnvioDte.Close;
     CierraData(DMDTEChl);
  end;
end;

end.
