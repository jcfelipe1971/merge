unit UDMFacturasAProveedor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  UComponentesBusquedaFiltrada, FIBDatabase, UFIBModificados, Controls,
  FIBDataSetRO, HYFIBQuery, Dialogs, XMLIntf, XMLDoc;

type
  TDMFacturasAProveedor = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
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
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     xInfoActualizada: TFIBDataSet;
     DSxInfoActualizada: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMDetalleENTRADA: TIntegerField;
     EntornoDoc: TEntornoFind2000;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaI_DTO_LINEAS: TFloatField;
     xInfoActualizadaS_BASES: TFloatField;
     xInfoActualizadaS_CUOTA_IVA: TFloatField;
     xInfoActualizadaS_CUOTA_RE: TFloatField;
     xInfoActualizadaB_DTO_LINEAS: TFloatField;
     QMDetalleCANAL: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraPROVEEDOR: TIntegerField;
     xProveedor: TFIBDataSetRO;
     DSxProveedor: TDataSource;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraBULTOS: TIntegerField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleP_COSTE: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     xInfoActualizadaLIQUIDO: TFloatField;
     QMCabeceraP_IRPF: TFloatField;
     QMCabeceraI_IRPF: TFloatField;
     QMCabeceraA_IRPF: TIntegerField;
     QMCabeceraTOTAL_FACTURA: TFloatField;
     QMCabeceraNUM_FACTURA: TFIBStringField;
     xInfoActualizadaI_IRPF: TFloatField;
     xInfoActualizadaTOTAL_FACTURA: TFloatField;
     QMCabeceraFORMA_DE_PAGO: TFIBStringField;
     QMCabeceraTIPO_IRPF: TIntegerField;
     QMCabeceraAPLICA_IRPF: TStringField;
     QMCabeceraBASE_IRPF: TFloatField;
     QMCabeceraDEVOLUCION: TIntegerField;
     QMCabeceraSIN_DETALLE: TIntegerField;
     TLocal: THYTransaction;
     QMCabeceraRIC_FAC: TStringField;
     QMCabeceraASIENTO: TIntegerField;
     QMCabeceraREGISTRO: TIntegerField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     xInfoActualizadaI_FINANCIACION: TFloatField;
     QMDetalleUNIDADES_EXT: TFloatField;
     xArticulos: TFIBDataSetRO;
     QMCabeceraFECHA_CON: TDateTimeField;
     QMDetallePRECIO: TFloatField;
     QBorraLineaExt: THYFIBQuery;
     QUnidadesExt: THYFIBQuery;
     QUptUnidadesExt: THYFIBQuery;
     QMDetalleNOTAS: TBlobField;
     QMDetalleNSERIE: TFIBStringField;
     QMCabeceraSIN_RECIBOS: TIntegerField;
     QLimpiaProcAuto: THYFIBQuery;
     QMDetalleSUPLIDO: TIntegerField;
     QRegistroIva: THYFIBQuery;
     QAsiento: THYFIBQuery;
     QMNIF: TFIBTableSet;
     DSQMNIF: TDataSource;
     QMNIFEMPRESA: TIntegerField;
     QMNIFEJERCICIO: TIntegerField;
     QMNIFCANAL: TIntegerField;
     QMNIFSERIE: TFIBStringField;
     QMNIFTIPO: TFIBStringField;
     QMNIFRIG: TIntegerField;
     QMNIFNOMBRE: TFIBStringField;
     QMNIFNIF: TFIBStringField;
     QMNIFDIRECCION: TFIBStringField;
     QMNIFC_POSTAL: TFIBStringField;
     QMNIFPROVINCIA: TFIBStringField;
     QMCabeceraFUERZA_VENCIMIENTOS: TIntegerField;
     QSPProcedencia: TFIBTableSet;
     DSQSPProcedencia: TDataSource;
     SPCambiaMoneda: THYFIBQuery;
     QMCabeceraTOTAL_CANAL: TFloatField;
     DSxTipoIRPF: TDataSource;
     xTipoIRPF: TFIBDataSetRO;
     QMCabecerasCostes: TFIBTableSet;
     QMDetallesCostes: TFIBTableSet;
     xCuentaArticulo: TFIBDataSetRO;
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
     xCuentaArticuloCTA_COMPRAS: TFIBStringField;
     xCuentaArticuloCENTRO_COSTE: TIntegerField;
     QMDetalleCENTRO_COSTE: TIntegerField;
     QMCabeceraCENTRO_COSTE: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraID_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMNIFPAIS: TFIBStringField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     xInfoActualizadaI_PORTES: TFloatField;
     QPortes: THYFIBQuery; // borrar
     QCreaRectificacion: THYFIBQuery;
     QMDetalleORDEN: TIntegerField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMCabeceraPROYECTO: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMCabeceraOBLIGA_AUTOFACTURA: TIntegerField;
     TUpdate: THYTransaction;
     QMNIFID_E: TIntegerField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMCabeceraFUERZA_MODO_IVA: TIntegerField;
     QMCabeceraMODO_IVA: TIntegerField;
     QMCabeceraZ_TIPO_BIENES: TFIBStringField;
     QMCabeceraRECT: TIntegerField;
     QMCabeceraID_RECT: TIntegerField;
     QMCabeceraZ_CONTADOR_NCF: TFIBStringField;
     QMCabeceraZ_TIPO_NCF: TIntegerField;
     QMDetalleCUENTA: TFIBStringField;
     QMNIFCOLONIA: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     QMCabeceraZ_PREFIJO_NCF: TFIBStringField;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     QMCabeceraRECC: TIntegerField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraFECHA_SII: TDateTimeField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraREGISTRO_CARTERA: TIntegerField;
     QMNIFTERCERO: TIntegerField;
     QMCabeceraSFV_AUTORIZACION: TFIBStringField;
     QMCabeceraSFV_CODIGO_CONTROL: TFIBStringField;
     QMCabeceraIMPORTE_ICE_TOTAL: TFloatField;
     QMDetalleIMPORTE_ICE: TFloatField;
     QMCabeceraSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField;
     QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMCabeceraIMPORTE_MINIMO_PORTE: TFloatField;
     QMCabeceraDESC_RECTIFICACION: TStringField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraS_CUOTA_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraS_CUOTA_IMP_ADICIONAL_CANAL: TFloatField;
     xInfoActualizadaIMPORTE_ICE_TOTAL: TFloatField;
     xInfoActualizadaS_CUOTA_IMPUESTO_ADICIONAL: TFloatField;
     QMDetalleI_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraDIR_ENTREGA_MANUAL: TMemoField;
     QMDetalleTITULO_CUENTA: TStringField;
     QMCabeceraDIRECCION: TIntegerField;
     DSxDirecciones: TDataSource;
     xDirecciones: TFIBDataSetRO;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     QMDetalleCOSTE_ADICIONAL: TFloatField;
     QMCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMCabeceraFOLIO: TFIBStringField;
     xAvisos: TFIBDataSetRO;
     QMCabeceraIDIOMA: TFIBStringField;
     xDireccionesTITULO: TFIBStringField;
     QMCabeceraRECIBO_PAGADO: TIntegerField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMSIIDteReferencia: TFIBTableSet;
     DSQMSIIDteReferencia: TDataSource;
     QMSIIDteReferenciaID_E: TIntegerField;
     QMSIIDteReferenciaNROLINREF: TIntegerField;
     QMSIIDteReferenciaID_E_REF: TIntegerField;
     QMSIIDteReferenciaTPODOCREF: TFIBStringField;
     QMSIIDteReferenciaFOLIOREF: TFIBStringField;
     QMSIIDteReferenciaFCHREF: TDateTimeField;
     QMSIIDteReferenciaCODREF: TIntegerField;
     QMSIIDteReferenciaRAZONREF: TFIBStringField;
     QMSIIDteReferenciaRUTOTR: TFIBStringField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMCabeceraCOD_MOTIVO_ABONO: TIntegerField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     QMCabeceraVENCIMIENTO: TDateTimeField;
     QMCabeceraNIF: TFIBStringField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMCabeceraORIGEN_DOCUMENTO: TFIBStringField;
     QMCabeceraOBSERVACIONES: TFIBStringField;
     xFacturaCompraDGII: TFIBDataSetRO;
     xFacturaCompraDGIIID_E: TIntegerField;
     xFacturaCompraDGIIID_ENVIO: TFIBStringField;
     xFacturaCompraDGIISTAMP_DATE: TFIBStringField;
     xFacturaCompraDGIISTATUS: TFIBStringField;
     xFacturaCompraDGIISECURITY_CODE: TFIBStringField;
     xFacturaCompraDGIISEQUENCE_CONSUMED: TIntegerField;
     xFacturaCompraDGIIENCF: TFIBStringField;
     xFacturaCompraDGIIURL_XML: TFIBStringField;
     xFacturaCompraDGIIURL_PDF: TFIBStringField;
     xFacturaCompraDGIIDOCUMENT_STAMP_URL: TFIBStringField;
     xFacturaCompraDGIITRACK_ID: TFIBStringField;
     xFacturaCompraDGIIGOVERMENT_RESPONSE: TFIBStringField;
     xFacturaCompraDGIIMENSAJE_ERROR_ENVIO_ECF: TFIBStringField;
     xFacturaCompraDGIISTATUS_CONSULTA: TFIBStringField;
     xFacturaCompraDGIILEGAL_STATUS_CONSULTA: TFIBStringField;
     xFacturaCompraDGIIMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField;
     DSxFacturaCompraDGII: TDataSource;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     xFacturaCompraDGIICODIGO_ERROR_ENVIO: TFIBStringField;
     QMCabeceraDOM_ID_TIPO_RETENCION: TIntegerField;
     QMCabeceraDOM_RET_POR_ITBIS: TFloatField;
     QMCabeceraDOM_RET_POR_ISR: TFloatField;
     xInfoActualizadaSUM_UNIDADES: TFloatField;
     xInfoActualizadaSUM_UNIDADES_SEC: TFloatField;
     xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField;
     xInfoActualizadaSUM_PESO: TFloatField;
     xInfoActualizadaCOUNT_LINEA: TIntegerField;
     procedure DMFacturasAProveedorCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraALMACENChange(Sender: TField);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMCabeceraPROVEEDORChange(Sender: TField);
     procedure QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
     procedure QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraRIC_FACGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCabeceraREGISTROGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DMFacturasAProveedorDestroy(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMCabeceraTIPO_IRPFChange(Sender: TField);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleBeforeScroll(DataSet: TDataSet);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraCAMBIO_FIJOChange(Sender: TField);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMCabeceraFUERZA_MODO_IVAChange(Sender: TField);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMDetalleTIPO_IMPUESTO_ADICIONALChange(Sender: TField);
     procedure QMDetalleCUENTAChange(Sender: TField);
     procedure QMDetalleTITULO_CUENTAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_IVAChange(Sender: TField);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraDIRECCIONChange(Sender: TField);
     procedure QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALChange(Sender: TField);
     procedure QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xProveedorAfterOpen(DataSet: TDataSet);
     procedure xProveedorBeforeClose(DataSet: TDataSet);
     procedure xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMSIIDteReferenciaNewRecord(DataSet: TDataSet);
     procedure QMSIIDteReferenciaAfterPost(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraFECHAChange(Sender: TField);
  private
     { Private declarations }
     Fecha_old: TDateTime;
     ComisionAgente, unidades_old: double;
     // NSErie: string;
     Serie: string;
     {RecalculaPrecios,} Editando, numserie: boolean;
     FlagModificandoUnidades: boolean;
     Param_SYSCONF005: integer;
     Param_DOCREFE009: boolean;
     Param_VENULKG001: boolean;
     Param_COMARTU001: boolean;
     Param_COMPREC001: boolean;
     Param_FAPFEC0001: string;
     KriConf470: boolean;
     OldLinea: TStrings;
     ComprobarFechaContabilizacion: boolean;
     ModificandoCambioFijo: boolean;
     {procedure InfoActualiza; dji lrk kri - TyC}
     procedure LimpiaProcAuto;
     function Traspasado: boolean;
     procedure RefrescaIRPF;
     procedure DamePorIRPF;
     procedure UbicaArticulo(Peso, Volumen, Diametro: double);
     {procedure CambiaMonedaFecha; No se utiliza}
     {function HayCambioFactor(var factor_ant: double): boolean; No se utiliza}
     {procedure RecalculaCambioFactor(factor_ant: double); No se utiliza}
     procedure RefrescaCabeceraManteniendoPosicionDetalle(DataSet: TDataSet);
     procedure RellenaDatosLinea(Linea: TStrings);
     function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
     function InsertaDetalleFactura(IdDocumento: integer; NmbItem, DscItem: string; QtyItem, PrcItem, DescuentoPct: double; TipoIva: integer): integer;
     function DameFormaPagoTipoEfecto(TipoEfecto: string): string;
     procedure CierraDocumento;
     {procedure AbreSerializadoAuto ; dji lrk kri - TyC}
  protected
     SQLFind, SQLBase: string;
  public
     { Public declarations }
     medida1, medida2, medida3, medida4, gprecio: double;
     // Recuperación de updates en u.ext
     Filtrado{, NotasLote}: boolean; // Controla si se editan las notas del lote
     gunidades: integer; // Idem
     monedaold: string;
     LocalMascaraN, LocalMascaraL: string;
     procedure CambiaUnidadesExt(Articulo: TField; modo: boolean);
     procedure BloqueaFactura;
     procedure DesBloqueaFactura;
     procedure Duplica;
     procedure Devuelve(SerieDestino: string);
     function BusquedaCompleja: integer;
     procedure CambiaSerie(SerieVar: string);
     procedure PreparaNotasDetalle;
     function Habilitar_but_cambia_iva: boolean;
     procedure ActualizaCondicionesProv(CrearCondicionModelo: boolean);
     function DameEstado: integer;
     procedure BorraLineaExt;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
     procedure DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
     procedure BusquedaArticulo(Descripcion: string);
     procedure VaciaNumSerie;
     procedure BuscaNumSerie(NroSerie: string; Filtro: boolean);
     function Inhabilitar: boolean;
     function Serializado: boolean;
     procedure FiltraFacturacion(Serie: string; Contador: integer);
     function ObtieneRegistroIVA: string;
     function ObtieneAsiento: string;
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     function DameDatosProveedor: boolean;
     procedure GrabaDatosProveedor(Estado: integer);
     procedure RefrescaTabla;
     procedure Historico;
     procedure Procedencia;
     procedure CambiaPreciosTarifa;
     function Dameejercicio: string;
     procedure CambiaMonedaDetalle;
     procedure MascarasMoneda; virtual; {TyC}
     function HayDocumentos: boolean;
     function EstadoDocumento: integer;
     function HayDetalle: boolean;
     procedure InfoLotes;
     procedure InfoActualiza; {TyC}
     procedure InsertaCosteCabecera(d1, d2, d3, d4, d5: string);
     procedure ActualizaCosteCabecera(d1, d2, d3, d4, d5: string);
     procedure BorraCosteCabecera;
     procedure InsertaCosteDetalle(d1, d2, d3, d4, d5: string);
     procedure ActualizaCosteDetalle(d1, d2, d3, d4, d5: string);
     procedure BorraCosteDetalle;
     // function CostesIntroducidos: smallint;
     procedure AbreSerializadoAuto;{TyC}
     procedure PreparaSerializacion;
     procedure ControlaRestriccion;
     procedure DistribuyeArticulo;
     procedure MuestraUbicacion;
     procedure TraspasodeDocumentos(id_e: integer);
     function CreaFacturaRectificacion(Serie: string; var d_rig: integer): boolean;
     procedure OrdenarLineas;
     procedure RefrescaCabecera(Accion: integer);
     procedure FiltraFact(Filtro: string);
     procedure ApunteAnalitico(evaluar: boolean);
     procedure BuscaArticulo(Articulo: string);
     procedure FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
     procedure AbreQMNif;
     procedure CierraQMNif;
     procedure CambiaFinanciacion;
     procedure PedirCentroCoste;
     procedure RellenaDatosOldLinea;
     procedure DuplicarLinea;
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
     function DameTipoNCFSerie(Serie: string): integer;
     procedure FiltraDocumento(Serie, Filtro: string);
     procedure ImportaXML(Archivo: string; Log: TStrings);
     procedure AbreDatosEnviosECF;
     procedure CierraDatosEnviosECF;
     procedure AbreDatosDTE;
     procedure CierraDatosDTE;
     function DocumentoEcfValido: boolean;
  end;

var
  DMFacturasAProveedor : TDMFacturasAProveedor;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, URecursos,
  UFBusca, UFMUnidadesExtGesC, UFInfoHistorico,
  UFCProcedencia, UFMPreciosArticuloDoc, {UFMIntroduceLotes,} UFParada,
  UFMDistribuyeArticulos, UFMArtSerializacion, UFMDatosFactRectificacion,
  UFOrdenaLineas, UFMImputacionCostes, UFMain, UFMFinanciaManual, UFMDigitosCoste,
  UFMAsignaLotes, DateUtils, UParam;

{$R *.DFM}

procedure TDMFacturasAProveedor.DMFacturasAProveedorCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  OldLinea := TStringList.Create;
  Kriconf470 := (DMMain.EstadoKri(470) = 1);
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005'), 0);
  Param_DOCREFE009 := (LeeParametro('DOCREFE009') = 'S');

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FlagModificandoUnidades := False;
  ModificandoCambioFijo := False;

  // Máscaras de visualización a los campos numéricos
  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);

  // Se asignan las máscaras de visualización a los campos que las requieren
  QMCabeceraDTO_CIAL.DisplayFormat := MascaraP;
  QMCabeceraDTO_PP.DisplayFormat := MascaraP;
  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMCabeceraFECHA.DisplayFormat := ShortDateFormat;
  QMCabeceraVALOR_CAMB_FIJO.DisplayFormat := '0.000000';
  QMCabeceraVALOR_CAMB_FIJO_INV.DisplayFormat := '0.000000';
  QMCabeceraP_IRPF.DisplayFormat := MascaraP;
  QMCabeceraPOR_PORTES.DisplayFormat := MascaraP;
  QMCabeceraI_PORTES.DisplayFormat := MascaraN;
  QMCabeceraFECHA_ENTREGA.DisplayFormat := ShortDateFormat + ' hh:nn';

  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_EXT.DisplayFormat := MascaraI;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetalleP_IVA.DisplayFormat := MascaraP;
  QMDetalleP_RECARGO.DisplayFormat := MascaraP;
  QMDetalleUNIDADES_SEC.DisplayFormat := MascaraI;
  QMDetalleP_IMPUESTO_ADICIONAL.DisplayFormat := MascaraP;
  QMDetalleCUENTA.EditMask := REntorno.MascaraCuentas;
  QMDetalleUNIDADES_LOGISTICAS.DisplayFormat := MascaraI;
  QMDetalleFECHA_PRE_DET.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMDetalleFECHA_REC_DET.DisplayFormat := ShortDateFormat + ' hh:nn';

  xInfoActualizadaI_PORTES.DisplayFormat := MascaraN;

  with QMCabecera.DeleteSQL do
  begin
     Clear;
     Add('EXECUTE PROCEDURE G_BORRA_RIG_ENTRADA_LOG ');
     Add('(?OLD_EMPRESA, ?OLD_EJERCICIO, ?OLD_CANAL, ?OLD_SERIE, ?OLD_TIPO, ?OLD_RIG, ?OLD_ID_E, ');
     Add(IntToStr(REntorno.Entrada) + ') ');
  end;

  with QMDetalle.DeleteSQL do
  begin
     Clear;
     Add('EXECUTE PROCEDURE G_BORRA_LINEA_ENTRADA_LOG ');
     Add('(?OLD_ID_DETALLES_E, ');
     Add(IntToStr(REntorno.Entrada) + ') ');
  end;

  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;

  xTipoNCF.Open;
  // Se inicializan las variables globales
  ComisionAgente := 0;

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_FACTURA_PROV ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''FAP'' ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' AND (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) ');
  SQLBase := QMCabecera.SelectSQL.Text;

  if (REntorno.Pais = 'CHL') then
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
  else
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  Serie := REntorno.Serie;

  Filtrado := False;

  // NotasLote := False;
  NumSerie := False;

  if (DMMain.EstadoKri(47) = 1) then
  begin
     QMDetalleUNIDADES_LOGISTICAS.DisplayLabel := _('Bultos');
     QMDetalleUNIDADES.DisplayLabel := _('Kilos');
  end;

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FECHA_CONTABILIZACION_COMPRAS FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ComprobarFechaContabilizacion := (FieldByName['FECHA_CONTABILIZACION_COMPRAS'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.Graba(DataSet: TDataSet);
begin
  //TFIBTableSet(DataSet).Transaction.CommitRetaining;
  //DMMain.Graba;
  DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMFacturasAProveedor.QMDetalleNewRecord(DataSet: TDataSet);
var
  i : integer;
  Linea, Campo, Valor : string;
begin
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMDetalleALMACEN.AsString := QMCabeceraALMACEN.AsString;
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleTIPO.AsString := QMCabeceraTIPO.AsString;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMDetallePAIS.AsString := REntorno.Pais;
  QMDetalleTITULO.AsString := '';
  QMDetalleUNIDADES.AsInteger := 1;
  QMDetalleENTRADA.AsInteger := REntorno.ENTRADA;
  QMDetalleUNIDADES_SEC.AsInteger := 0;
  QMDetalleUNIDADES_EXT.AsInteger := 0;
  QMDetalleNSERIE.AsString := '';
  QMDetalleSUPLIDO.AsInteger := 0;
  QMDetalleCENTRO_COSTE.AsInteger := 0;
  QMDetalleID_E.AsInteger := QMCabeceraID_E.AsInteger;
  Unidades_Old := 0;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  // Obtenemos el numero de linea más alto en la Factura a proveedor actual
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  NumSerie := False;

  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf470) then
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

procedure TDMFacturasAProveedor.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'FAP';
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_CON.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_SII.AsDateTime := Today;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraALMACEN.AsString := DMMain.DameAlmacenDocumento('FAP', Serie);
  QMCabeceraDEVOLUCION.AsInteger := 0;
  QMCabeceraSIN_DETALLE.AsInteger := 0;
  QMCabeceraSIN_RECIBOS.AsInteger := 0;
  QMCabeceraFUERZA_VENCIMIENTOS.AsInteger := 0;
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraTIPO_IRPF.AsInteger := 0;
  QMCabeceraP_IRPF.AsFloat := 0;
  QMCabeceraFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraTIPO_PORTES.AsInteger := 0;
  QMCabeceraPOR_PORTES.AsFloat := 0;
  QMCabeceraI_PORTES.AsFloat := 0;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraOBLIGA_AUTOFACTURA.AsInteger := 0;
  QMCabeceraFUERZA_MODO_IVA.AsInteger := 0;
  QMCabeceraRECC.AsInteger := 0;
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCCPRY001', Serie), 0);
  QMCabeceraCOD_MOTIVO_ABONO.AsInteger := 0;

  // Datos factura SII Chile
  QMCabeceraFOLIO.AsString := '';
  QMCabeceraTIPO_DOC_TRIBUTARIO.AsString := 'DES';

  Editando := False;
end;

procedure TDMFacturasAProveedor.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  if Param_DOCREFE009 and (Trim(QMCabeceraSU_REFERENCIA.AsString) <> '') then
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
              SelectSQL.Add(' SELECT LIST(C.TIPO || '' '' || C.EJERCICIO || ''-'' || C.SERIE || ''/'' || C.RIG, '', '') AS DOCUMENTO ');
              SelectSQL.Add(' FROM GES_CABECERAS_E C ');
              SelectSQL.Add(' JOIN GES_CABECERAS_E_FAC D ON C.ID_E = D.ID_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' C.TIPO = :TIPO AND ');
              SelectSQL.Add(' D.PROVEEDOR = :PROVEEDOR AND ');
              SelectSQL.Add(' C.SU_REFERENCIA = :SU_REFERENCIA AND ');
              SelectSQL.Add(' C.ID_E <> :ID_E ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['PROVEEDOR'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
              Params.ByName['SU_REFERENCIA'].AsString := QMCabeceraSU_REFERENCIA.AsString;
              Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
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
           ShowMessage(format('Hay otro/s documento/s con la misma referencia para este proveedor.'#13#10 + '%s', [Documentos]));
     end;
  end;

  DMMain.ValidaFecha(REntorno.Empresa, REntorno.Ejercicio, QMCabeceraFECHA_CON.AsDateTime);

  if (ComprobarFechaContabilizacion) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 ID_E FROM GES_CABECERAS_E_FAC ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIG < :RIG AND ');
           SQL.Add(' FECHA_CON > :FECHA_CON ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'FAP';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['FECHA_CON'].AsDateTime := Trunc(QMCabeceraFECHA_CON.AsDateTime) + 1;
           ExecQuery;
           if (FieldByName['ID_E'].AsInteger > 0) then
              ShowMessage(_('CUIDADO. La fecha de la factura es incorrecta'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (HourIntoDate(QMCabeceraFECHA_CON.AsDateTime, '00:00:00') < HourIntoDate(QMCabeceraFECHA.AsDateTime, '00:00:00')) then
     ShowMessage(_('CUIDADO. La fecha de contabilizacion a la fecha de la factura'));

  // Tipos de NCF que debemos calcular nosotros
  //Inicializamos valores solo si se esta insertando
  if (QMCabecera.State = dsInsert) then
  begin
     if (((QMCabeceraZ_TIPO_NCF.AsInteger >= 11) and (QMCabeceraZ_TIPO_NCF.AsInteger <= 13)) or (QMCabeceraZ_TIPO_NCF.AsInteger = 17) or (QMCabeceraZ_TIPO_NCF.AsInteger = 41) or (QMCabeceraZ_TIPO_NCF.AsInteger = 43) or (QMCabeceraZ_TIPO_NCF.AsInteger = 47)) then
     begin
        QMCabeceraZ_PREFIJO_NCF.AsString := '00000000000';
        QMCabeceraZ_CONTADOR_NCF.AsString := '00000000';
     end;
  end;

  if (REntorno.Pais = 'CHL') then
  begin
     // Verificamos que se haya asignado un tipo de documento tributario
     if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = 'DES') then
        raise Exception.Create(_('Debe asignar un tipo de documento tributario'));
  end;

  QMCabeceraNUM_FACTURA.AsString := Trim(QMCabeceraNUM_FACTURA.AsString);

  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_E', 'ID_E');

  {
  dji lrk kri - No recalculo precios si cambia la moneda o la fecha

  RecalculaPrecios := False;
  if (editando) then
    if (QMCabeceraMONEDA.AsString <> REntorno.MonedaEmpresa) then
      if (fecha_old <> QMCabeceraFECHA.AsDateTime) then
        if (Application.MessageBox('ATENCION! Se recalcularán los precios en función del cambio de moneda.',
          'Confirmación', MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
          RecalculaPrecios := True
        else
          QMCabeceraFECHA.AsDateTime := Fecha_Old;
  }
end;

procedure TDMFacturasAProveedor.QMDetalleARTICULOChange(Sender: TField);
var
  Baja : boolean;
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  if (not DMMain.ArticuloBloqueado(Sender.AsString, 'FAP')) then
  begin
     xArticulos.Close;
     xArticulos.Open;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, BAJA, UNIDADES, PESO, FACTOR_UNIDAD ');
           SQL.Add(' FROM ART_ARTICULOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Sender.AsString;
           ExecQuery;
           QMDetalleALFA_1.AsString := FieldByName['ALFA_1'].AsString;
           QMDetalleALFA_2.AsString := FieldByName['ALFA_2'].AsString;
           QMDetalleALFA_3.AsString := FieldByName['ALFA_3'].AsString;
           QMDetalleALFA_4.AsString := FieldByName['ALFA_4'].AsString;
           QMDetalleALFA_5.AsString := FieldByName['ALFA_5'].AsString;
           QMDetalleALFA_6.AsString := FieldByName['ALFA_6'].AsString;
           QMDetalleALFA_7.AsString := FieldByName['ALFA_7'].AsString;
           QMDetalleALFA_8.AsString := FieldByName['ALFA_8'].AsString;
           Baja := (FieldByName['BAJA'].AsInteger = 1);
           QMDetalleDECIMALES_UNIDADES.AsInteger := DMMain.DameDecimalesUnidad(FieldByName['UNIDADES'].AsString);
           QMDetallePESO.AsFloat := FieldByName['PESO'].AsFloat * FieldByName['FACTOR_UNIDAD'].AsFloat;
           QMDetallePESO_TOTAL.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES.AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if Baja then
        raise Exception.Create(_('El articulo esta dado de baja'));

     EntornoDoc.Cliente := QMCabeceraPROVEEDOR.AsInteger;
     CambiaUnidadesExt(Sender, False);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           SQL.Add(' SELECT TIPO_IVA, ID_A, ID_C_A, CTA_COMPRAS, CTA_DEVOLUCION_COMPRAS, DISPONIBILIDAD, TIPO_IMPUESTO_ADICIONAL FROM CON_CUENTAS_GES_ART ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
           QMDetalleID_C_A.AsInteger := FieldByName['ID_C_A'].AsInteger;
           QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger := FieldByName['TIPO_IMPUESTO_ADICIONAL'].AsInteger;
           QMDetalleTIPO_IVA.AsString := FieldByName['TIPO_IVA'].AsString;

           // Para Chile
           // - Si es factura exenta, el tipo de IVA sera cero.
           // - Si el DTE es una boleta de honorarios y tiene retención se asigna tipo de Iva cero.
           if (REntorno.Pais = 'CHL') then
           begin
              if (((QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = 'BHS') or (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = 'BHT')) and (QMCabeceraTIPO_IRPF.AsInteger > 0)) then
                 QMDetalleTIPO_IVA.AsInteger := 0;

              if (QMCabeceraTIPO_DOC_TRIBUTARIO.AsString = '34') then
                 QMDetalleTIPO_IVA.AsInteger := 0;
           end;

           if REntorno.VerSoloArticulosDisponibles then
              if (not (FieldByName['DISPONIBILIDAD'].AsInteger in [0, 1])) then
                 QMDetalle.Cancel;

           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((DMMain.EstadoKri(401) = 1) and (Trim(QMDetalleARTICULO.AsString) > '')) then
     begin
        // Asignamos la cuenta gasto del proveedor si la tuviese
        if (xProveedor.FieldByName('CUENTA_GASTOS').AsString > '') then
           QMDetalleCUENTA.AsString := xProveedor.FieldByName('CUENTA_GASTOS').AsString
        else
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT CUENTA FROM C_DAME_CUENTA_ART_COMPRA(:ID_C_A, :SERIE, :PROYECTO, :ABONO, :DEVOLUCION, :GRUPO_CUENTAS)';
                 Params.ByName['ID_C_A'].AsInteger := QMDetalleID_C_A.AsInteger;
                 Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
                 Params.ByName['PROYECTO'].AsInteger := QMCabeceraPROYECTO.AsInteger;
                 Params.ByName['ABONO'].AsInteger := QMCabeceraSIN_DETALLE.AsInteger;
                 Params.ByName['DEVOLUCION'].AsInteger := QMCabeceraDEVOLUCION.AsInteger;
                 Params.ByName['GRUPO_CUENTAS'].AsInteger := xProveedor.FieldByName('GRUPO_CUENTAS').AsInteger;
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

     if ((xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger = 1) and REntorno.PVP_Ud_Sec) then
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
              if (DMMain.EstadoKri(441) <> 1) then // Si se trata de una arrocera RD
                 QMDetalleUNIDADES.AsFloat := FieldByName['UNIDADES'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
     begin
        QMDetalleUNIDADES.AsFloat := QMDetallePESO.AsFloat * 1;
        QMDetallePESO_TOTAL.AsFloat := QMDetalleUNIDADES.AsFloat;
     end;

     if Param_COMARTU001 and (QMDetalleARTICULO.AsString = REntorno.ArtTextoLibre) then
        QMDetalleUNIDADES.AsInteger := 0;

     DMMain.MuestraAviso('ART', xArticulos.FieldByName('ID_A').AsInteger, QMCabeceraTIPO.AsString);
  end
  else
     QMDetalle.Cancel;
end;

procedure TDMFacturasAProveedor.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_E.AsInteger > 0) then
        Open;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if ((QMDetalleSUPLIDO.AsInteger = 1) and (QMDetalleP_IVA.AsFloat <> 0)) then
  begin
     ShowMessage(_('Los importes suplidos no pueden llevar IVA'));
     Abort;
  end;

  if (QMDetalleNSERIE.AsString <> '') then
     if ((QMDetalleUNIDADES.AsFloat <> 1) and (QMDetalleUNIDADES.AsFloat <> -1)) then
        raise Exception.Create(_('No se puede devolver más de una unidad de un artículo serializado'));

  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');

  QMDetalleENTRADA.AsInteger := REntorno.Entrada;

  {Calculo el CRC de las notas para poder agrupar}
  QMDetalleCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS));
  QMDetalleCRC_NOTAS2.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS2));

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

procedure TDMFacturasAProveedor.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Open;
  xDirecciones.Open;
  QMDetalle.Open;
  QMNIF.Open;
  RefrescaIRPF;
  QMCabecerasCostes.Open; {dji lrk kri - C.Costes}

  InfoActualiza;
end;

procedure TDMFacturasAProveedor.QMCabeceraALMACENChange(Sender: TField);
begin
  EntornoDoc.Almacen := Sender.AsString;
end;

procedure TDMFacturasAProveedor.AntesDeEditar(DataSet: TDataSet);
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
     Almacen := QMCabeceraALMACEN.AsString;
  end;

  monedaold := QMCabeceraMONEDA.AsString;
  unidades_old := QMDetalleUNIDADES.AsFloat;
  fecha_old := QMCabeceraFECHA.AsDateTime;
  Editando := True;
end;

procedure TDMFacturasAProveedor.BloqueaFactura;
var
  Cierra : boolean;
  {cambio : double;}
begin
  Cierra := True;

  if (xInfoActualizadaTOTAL_FACTURA.AsFloat = 0) then
     Cierra := (Application.MessageBox(PChar(string(_('Se va a cerrar un documento con total 0. Confirme por favor.'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes);

  {Done -oDuilio : No debe hacer el cambio de moneda. Para esto hay que modificar primero g_factura_prov_cierra/2, el pago de cartera, etc.}
  { ---------------------------------------------------------------------- }
  { ---------------------------------------------------------------------- }
  { Quitar todo esto.                                                      }
  { Primero hay que modificar el comportamiento de :                       }
  {     g_factura_prov_cierra                                              }
  {     g_factura_prov_cierra2                                             }
  {     Verificar asientos generados                                       }
  {     Verificar registro de iva                                          }
  {     Verificar asiento de pago en cartera                               }
  {
{  if ((QMCabeceraMONEDA.AsString <> REntorno.Moneda) and (QMCabeceraCAMBIO_FIJO.AsInteger = 0))then
{    if (HayCambioFactor(cambio)) then
{      if (Application.MessageBox('ATENCION! Se recalcularán los precios en función del cambio de moneda.',
{         'Confirmación', MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
{      begin
{        RecalculaCambioFactor(cambio);
{        QMCabecera.Refresh;
{        xInfoActualizada.Refresh;
{        QMDetalle.Close;
{        QMDetalle.Open;
{      end
{      else
{        cierra := False;
{ ----------------------------------------------------------------------}
  { ----------------------------------------------------------------------}

  if (Cierra) then
  begin
     CierraDocumento;
     QMCabecera.Refresh;
     ApunteAnalitico(True);
  end;
end;

procedure TDMFacturasAProveedor.DesBloqueaFActura;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_PROV_ABRE(:ID_E)';
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMFacturasAProveedor.QMCabeceraPROVEEDORChange(Sender: TField);
begin
  if (not DMMain.ProveedorBloqueado(QMCabeceraPROVEEDOR.AsInteger)) then
  begin
     with xProveedor do
     begin
        Close;
        Open;
        QMCabeceraDTO_PP.AsFloat := FieldByName('DESCUENTO_PP').AsFloat;
        QMCabeceraFORMA_DE_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        QMCabeceraDTO_CIAL.AsFloat := FieldByName('DESCUENTO').AsFloat;
        QMCabeceraTIPO_IRPF.AsInteger := FieldByName('TIPO_IRPF').AsInteger;
        QMCabeceraPOR_FINANCIACION.AsFloat := FieldByName('POR_FINANCIACION').AsFloat;
        QMCabeceraTITULO.AsString := FieldByName('TITULO').AsString;
        QMCabeceraMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMCabeceraTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMCabeceraDIRECCION.AsInteger := DMMain.DameMinDireccion(QMCabeceraTERCERO.AsInteger);
        QMCabeceraIDIOMA.AsString := FieldByName('IDIOMA').AsString;
        QMCabeceraZ_TIPO_NCF.AsInteger := FieldByName('TIPO_NCF').AsInteger;

        if (QMCabeceraFUERZA_MODO_IVA.AsInteger = 0) then
           QMCabeceraMODO_IVA.AsInteger := FieldByName('MODO_IVA').AsInteger;

        QMCabeceraTIPO_PORTES.AsInteger := FieldByName('TIPO_PORTES').AsInteger;
        case FieldByName('TIPO_PORTES').AsInteger of
           3: QMCabeceraPOR_PORTES.AsFloat := FieldByName('POR_PORTES').AsFloat;
           4: QMCabeceraI_PORTES.AsFloat := FieldByName('I_PORTES').AsFloat;
           // Para los tipo de portes rateados 5,6 se calculan en los triggers dependiendo
           // el valor del importes o del peso
        end;

        if (REntorno.Ejercicio >= 2014) then
           QMCabeceraRECC.AsInteger := FieldByName('RECC').AsInteger
        else
           QMCabeceraRECC.AsInteger := 0;
     end;
     RefrescaIRPF;
  end
  else
     QMCabecera.Cancel;

  DMMain.MuestraAviso('PRO', xProveedor.FieldByName('ID_PROVEEDOR').AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMFacturasAProveedor.QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT HEREDA_FINANCIACION, SIN_RECIBOS FROM CON_CUENTAS_GES_FP ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['FORMA_PAGO'].AsString := QMCabeceraFORMA_DE_PAGO.AsString;

        ExecQuery;

        if (FieldByName['HEREDA_FINANCIACION'].AsInteger = 1) then
           QMCabeceraPOR_FINANCIACION.AsFloat := xProveedor.FieldByName('POR_FINANCIACION').AsFloat;

        QMCabeceraSIN_RECIBOS.AsInteger := FieldByName['SIN_RECIBOS'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraA_IRPF.AsInteger = 0 then
     Text := _('Aplicable a la Base Imponible')
  else
     Text := _('Aplicable al Total con IVA');
end;

procedure TDMFacturasAProveedor.Duplica;
var
  IdDocDestino : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOC_E_DUPLICA ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ''FAP'', ?RIG, ');
        SQL.Add(' ?ENTRADA, ?D_EJERCICIO, ?FECHA, ?ID_E, ?RELACIONA) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        Params.ByName['RELACIONA'].AsInteger := 0;
        ExecQuery;
        IdDocDestino := FieldByName['ID_E_D'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCabecera.Close;
  QMCabecera.SelectSQL.Text := SQLBase;

  if (REntorno.Pais = 'CHL') then
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
  else
     QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  CambiaSerie(Serie);
  Refrescar(QMCabecera, 'ID_E', IdDocDestino);
end;

procedure TDMFacturasAProveedor.Devuelve(SerieDestino: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FAC_E_DEVUELVE (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''FAP'', :RIG, :ENTRADA, :FECHA, :ID_E)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := SerieDestino;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Close;
  QMCabecera.Open;
  QMCabecera.Last;
end;

function TDMFacturasAProveedor.BusquedaCompleja: integer;
begin
  DMMain.LogIni('DMFacturasAProveedor.BusquedaCompleja');
  Filtrado := True;

  with QMCabecera do
  begin
     Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10110', False, Serie);

     if (Result = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase;
        if (REntorno.Pais = 'CHL') then
           SelectSQL.Add(' ORDER BY EJERCICIO, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
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
  DMMain.LogFin('');
end;

procedure TDMFacturasAProveedor.QMCabeceraRIC_FACGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraESTADO.AsInteger = 0 then
     Text := ' '
  else
     Text := IntToStr(QMCabeceraASIENTO.AsInteger);
end;

function TDMFacturasAProveedor.Habilitar_but_cambia_iva: boolean;
begin
  Result := not ((QMDetalle.RecordCount = 0) or (QMCabeceraESTADO.AsInteger <> 0) or (xProveedor.Active and (xProveedor.FieldByName('MODO_IVA').AsInteger = 0)));
end;

procedure TDMFacturasAProveedor.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  {
  if (DMMain.TContador.InTransaction) then
    DMMain.TContador.Commit;
}
  {
dji lrk kri - No recalculo precios si cambia la moneda o la fecha

  if (monedaold <> QMCabeceraMONEDA.AsString) then
    CambiaMonedaDetalle;
  if RecalculaPrecios then
    CambiaMonedaFecha;
}
end;

procedure TDMFacturasAProveedor.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
     //DMMain.TContador.Rollback;
  end;
end;

procedure TDMFacturasAProveedor.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;

     if (LeeParametro('FAPULTD001', Serie) = 'S') then
        Last;
  end;

  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
  Param_COMARTU001 := (LeeParametro('COMARTU001', Serie) = 'S');
  Param_COMPREC001 := (LeeParametro('COMPREC001', Serie) = 'S');
  Param_FAPFEC0001 := LeeParametro('FAPFEC0001', Serie);
end;

procedure TDMFacturasAProveedor.PreparaNotasDetalle;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

procedure TDMFacturasAProveedor.QMCabeceraREGISTROGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraESTADO.AsInteger = 0 then
     Text := ' '
  else
     Text := IntToStr(QMCabeceraREGISTRO.AsInteger);
end;

procedure TDMFacturasAProveedor.ActualizaCondicionesProv(CrearCondicionModelo: boolean);
begin
  // Actualiza las condiciones Proveedor-Articulo de TODOS los articulos del documento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE UT_ACTUALIZA_CONDICIONES_PROV ');
        SQL.Add(' (:ID_E, :CREAR_CONDICION_MODELO) ');
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        Params.ByName['CREAR_CONDICION_MODELO'].AsInteger := BoolToInt(CrearCondicionModelo);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.CambiaUnidadesExt(Articulo: TField; Modo: boolean);
var
  Estado, Proveedor : integer;
  Unidades, Precio : double;
  Articulo_Old : string;
begin
  Estado := 2;
  if ((QMCabeceraESTADO.AsInteger <> 5) and (not Traspasado)) then
     if not (QMDetalle.State in [dsEdit, dsInsert]) and Modo then
        QMDetalle.Edit;

  Precio := 0;
  Proveedor := QMCabeceraPROVEEDOR.AsInteger;
  // Articulo_Old := xArticulos.FieldByName('ARTICULO').AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ARTICULO FROM GES_DETALLES_E ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_DETALLES_E = :ID_DETALLES_E ');
        Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
        ExecQuery;
        Articulo_Old := FieldByName['ARTICULO'].AsString;
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
     QMDetalleUNIDADES_SEC.AsFloat := FieldByName('DEFECTO_UD_SECUNDARIA').AsFloat;
     QMDetalleUNIDADES_SEC.AsFloat := QMDetalleUNIDADES.AsFloat * QMDetalleUNIDADES_SEC.AsFloat;
     if FieldByName('CONTROLA_MEDIDAS').AsInteger <> 0 then
     begin
        if (QMDetalle.State = dsInsert) then
           Estado := 0;
        if (QMDetalle.State = dsEdit) then
        begin
           if (Articulo_Old <> xArticulos.FieldByName('ARTICULO').AsString) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' DELETE FROM GES_DETALLES_E_UE ');
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
              with QUnidadesExt do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                 Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
                 Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                 Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
                 Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
                 ExecQuery;
                 medida1 := FieldByName['MEDIDA1'].AsFloat;
                 medida2 := FieldByName['MEDIDA2'].AsFloat;
                 medida3 := FieldByName['MEDIDA3'].AsFloat;
                 medida4 := FieldByName['MEDIDA4'].AsFloat;
                 gprecio := FieldByName['PRECIO'].AsFloat;
                 gunidades := FieldByName['UNIDADES'].AsInteger;
                 FreeHandle;
              end;
           end;
        end;
        Unidades := DevuelveValor(xArticulos, Self, QMDetalleEMPRESA.AsInteger, QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString, QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger,
           QMDetalleARTICULO.AsString, Estado, Precio, Proveedor, QMCabeceraMONEDA.AsString, QMCabeceraVALOR_CAMB_FIJO.AsFloat);

        if (Estado <> 2) then
        begin
           // Estado 441, comportamiento especial fanegas arroceras.
           if (DMMain.EstadoKri(441) = 1) then
           begin
              QMDetalleUNIDADES_EXT.AsFloat := 1;
              QMDetalleUNIDADES.AsFloat := Unidades;
              QMDetalleP_COSTE.AsFloat := Precio;
           end
           else
              QMDetalleUNIDADES_EXT.AsFloat := Unidades;
        end;

        if (QMDetalleUNIDADES_EXT.AsFloat = 0) then
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

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_PRECIO_COMPRA_MONEDA ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :ARTICULO, :FECHA, ');
        SQL.Add(' :UNIDADES, :UNIDADES_EXT, :PRECIOP, :MONEDA, :UNIDADES_OLD, :FACTOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['ARTICULO'].AsString := Articulo.AsString;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
        Params.ByName['UNIDADES_EXT'].AsFloat := QMDetalleUNIDADES_EXT.AsFloat;
        Params.ByName['PRECIOP'].AsFloat := Precio;
        Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
        Params.ByName['UNIDADES_OLD'].AsFloat := Unidades_Old;
        Params.ByName['FACTOR'].AsFloat := QMCabeceraVALOR_CAMB_FIJO.AsFloat;
        ExecQuery;
        QMDetalleTITULO.AsString := FieldByName['TITULO'].AsString;
        QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
        QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
        QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
        QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.CambiaPreciosTarifa;
var
  bueno : boolean;
begin
  DevuelvePrecio(0, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString, bueno,
     QMCabeceraMONEDA.AsString, QMCabeceraFECHA.AsDateTime,
     QMDetalleID_A.AsInteger);
end;

function TDMFacturasAProveedor.DameEstado: integer;
begin
  Result := QMCabeceraESTADO.Value;
end;

procedure TDMFacturasAProveedor.BorraLineaExt;
begin
  if QMDetalle.State = dsInsert then
  begin
     with QBorraLineaExt do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  end
  else if QMDetalle.State = dsEdit then
     with QUptUnidadesExt do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['UNIDADES'].AsInteger := gunidades;
        Params.ByName['MEDIDA1'].AsFloat := medida1;
        Params.ByName['MEDIDA2'].AsFloat := medida2;
        Params.ByName['MEDIDA3'].AsFloat := medida3;
        Params.ByName['MEDIDA4'].AsFloat := medida4;
        Params.ByName['PRECIO'].AsFloat := gprecio;
        ExecQuery;
        FreeHandle;
     end;
end;

procedure TDMFacturasAProveedor.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
end;

procedure TDMFacturasAProveedor.DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
begin
  Rig := QMCabeceraRIG.AsInteger;
  Tipo := QMCabeceraTIPO.AsString;
  Num_Factura := QMCabeceraNUM_FACTURA.AsString;
  Serie := QMCabeceraSERIE.AsString;
  Titulo := xProveedor.FieldByName('TITULO').AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
end;

procedure TDMFacturasAProveedor.DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
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

procedure TDMFacturasAProveedor.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMDetalleArticulo.OnChange;
  try
     QMDetalleArticulo.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN.AsString, 0, QMDetalleNSERIE);
     NumSerie := True;
  finally
     QMDetalleArticulo.OnChange := evt;
  end;
end;

procedure TDMFacturasaProveedor.VaciaNumSerie;
begin
  QMDetalleNSERIE.AsString := '';
end;

procedure TDMFacturasaProveedor.BuscaNumSerie(NroSerie: string; Filtro: boolean);
begin
  // NSerie := NroSerie;
  if (Filtro) then
  begin
     QMCabecera.Close;
     QMCabecera.SelectSQL.Text := '';
  end;

  ModificaSelect(QMCabecera, ' SELECT * FROM VER_CABECERAS_FACTURA_PROV  WHERE EMPRESA=?EMPRESA' +
     ' AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=''FAP''' +
     ' AND RIG IN (SELECT RIG FROM VER_DETALLE_SERIALIZACION ' +
     ' WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
     REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr +
     ' AND TIPO=''FAP'' AND SERIE=''' + Serie + ''' AND NSERIE=?NSERIE)', Filtro);

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
        SelectSQL.Text := SQLBase;

        if (REntorno.Pais = 'CHL') then
           SelectSQL.Add(' ORDER BY EJERCICIO, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
        else
           SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

        DMMain.FiltraTabla(QMCabecera, '11100', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
        Last;
     end;
  end;
end;

function TDMFacturasAProveedor.Inhabilitar: boolean;
begin
  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     Result := True
  else
     Result := False;
end;

function TDMFacturasAProveedor.Serializado: boolean;
begin
  if (xArticulos.FieldByName('SERIALIZADO').AsInteger = 1) then
     Result := True
  else
     Result := False;
end;

procedure TDMFacturasAProveedor.LimpiaProcAuto;
begin
  // Borramos los registros correspondientes de la tabla temporal
  with QLimpiaProcAuto do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMFacturasAProveedor.DMFacturasAProveedorDestroy(Sender: TObject);
begin
  LimpiaProcAuto;
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  OldLinea.Free;
end;

procedure TDMFacturasAProveedor.FiltraFacturacion(Serie: string; Contador: integer);
begin
  with QMcabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT VER.* FROM VER_CABECERAS_FACTURA_PROV VER ');
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
     SelectSQL.Add(' VER.TIPO = ''FAP'' AND ');
     SelectSQL.Add(' TMP.CONTADOR = ' + IntToStr(Contador));

     if (REntorno.Pais = 'CHL') then
        SelectSQL.Add(' ORDER BY VER.EJERCICIO, VER.TIPO_DOC_TRIBUTARIO, VER.FOLIO DESC ')
     else
        SelectSQL.Add(' ORDER BY VER.RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

function TDMFacturasAProveedor.ObtieneRegistroIVA: string;
begin
  with QRegistroIVA do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     ExecQuery;
     Result := FieldByName['RIS'].AsString;
     FreeHandle;
  end;
end;

function TDMFacturasAProveedor.ObtieneAsiento: string;
begin
  with QAsiento do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     ExecQuery;
     Result := FieldByName['RIC'].AsString;
     FreeHandle;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
  {dji lrk kri - C.Costes}
  xCuentaArticulo.Open;
  QMDetallesCostes.Open;
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAProveedor.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMMain.LogIni('DMFacturasAProveedor.FiltraCabecera');
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := SQLFind;
     SelectSQL.Add(' AND EJERCICIO = ?EJERCICIO ');
     SelectSQL.Add(' AND RIG = ?RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
  DMMain.LogFin('');
end;

function TDMFacturasAProveedor.Traspasado: boolean;
var
  Q : THYFIBQuery;
begin
  // Miramos si la línea tiene algún documento origen
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOCUMENTO_TRASPASADO_E ');
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
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMFacturasAProveedor.DameDatosProveedor: boolean;
begin
  if ((QMCabeceraPROVEEDOR.AsInteger <= -1)) then {Para todos los negarivos}
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

procedure TDMFacturasAProveedor.GrabaDatosProveedor(Estado: integer);
begin
  if (LeeParametro('TERLNIF001') = 'S') then
     QMNIFNIF.AsString := LimpiaNIF(QMNIFPAIS.AsString, QMNIFNIF.AsString);

  if (Estado = mrOk) and (EstadoDocumento = 0) then
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
           SQL.Text := 'DELETE FROM GES_CABECERAS_E_FAC_NIF WHERE ID_E = ?ID_E';
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturasAProveedor.QMNIFNewRecord(DataSet: TDataSet);
begin
  QMNifEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMNifEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMNifCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMNifSERIE.AsString := QMCabeceraSERIE.AsString;
  QMNifTIPO.AsString := QMCabeceraTIPO.AsString;
  QMNifRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMNifPAIS.AsString := REntorno.Pais;
  QMNifID_E.AsInteger := QMCabeceraID_E.AsInteger;
  QMNIFPAIS_DOC_IDENT.AsString := REntorno.Pais;
  QMNIFTIPO_DOC_IDENT.AsString := DMMain.DameTipoDocPaisDefecto(QMNIFPAIS_DOC_IDENT.AsString);
end;

// Refrescar el Grid de la Pestaña TABLA
procedure TDMFacturasAProveedor.RefrescaTabla;
begin
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     QMCabecera.Refresh;
     QMDetalle.EnableControls;
  end;
end;

// Histórico de Stocks
procedure TDMFacturasAProveedor.Historico;
begin
  if QMDetalleArticulo.AsString <> '' then
  begin
     FInfoHistorico := TFInfoHistorico.Create(Self);
     FInfoHistorico.Mostrar(QMCabeceraSERIE.AsString,
        QMDetalleARTICULO.AsString, QMCabeceraPROVEEDOR.AsInteger, 1);
     FInfoHistorico.Free;
  end;
end;

// Procedencia de la Linea
procedure TDMFacturasAProveedor.Procedencia;
begin
  with QSPProcedencia do
  begin
     Close;
     {
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
     Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
     Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
     Params.ByName['TIPO'].AsString := 'FAP';
     }
     Open;
  end;

  Application.CreateForm(TFCProcedencia, FCProcedencia);
  FCProcedencia.DBGProcedencia.DataSource := DMFacturasAProveedor.DSQSPProcedencia;
  FCProcedencia.ShowModal;
end;

// Centros de Coste
procedure TDMFacturasAProveedor.InsertaCosteCabecera(d1, d2, d3, d4, d5: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'insert into ges_cabeceras_costes(empresa,ejercicio,canal,' +
           'serie,tipo,rig,digito_1,digito_2,digito_3,digito_4,digito_5)values(' +
           '?empresa,?ejercicio,?canal,?serie,?tipo,?rig,?d1,?d2,?d3,?d4,?d5)';
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
     end;
  finally
     FreeAndNil(Q);
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     QMCabecera.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ver_cabeceras_factura_prov ' +
           ' set centro_coste=1' +
           ' where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and serie=?serie and tipo=?tipo ' +
           ' and rig=?rig';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCabecera.Refresh;
  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturasAProveedor.ActualizaCosteCabecera(d1, d2, d3, d4, d5: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ges_cabeceras_costes ' +
           'set digito_1=?d1, ' +
           'digito_2=?d2, ' +
           'digito_3=?d3, ' +
           'digito_4=?d4, ' +
           'digito_5=?d5 ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and ' +
           'serie=?serie and tipo=?tipo and rig=?rig';
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
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturasAProveedor.BorraCosteCabecera;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'delete from ges_cabeceras_costes ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and ' +
           'serie=?serie and tipo=?tipo and rig=?rig';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     QMCabecera.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ver_cabeceras_factura_prov ' +
           ' set centro_coste=0' +
           ' where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and serie=?serie and tipo=?tipo ' +
           ' and rig=?rig';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCabecera.Refresh;
  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturasAProveedor.InsertaCosteDetalle(d1, d2, d3, d4, d5: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'insert into ges_detalles_costes(empresa,ejercicio,canal,' +
           'serie,tipo,rig,linea,digito_1,digito_2,digito_3,digito_4,digito_5)values(' +
           '?empresa,?ejercicio,?canal,?serie,?tipo,?rig,?linea,?d1,?d2,?d3,?d4,?d5)';
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
     end;
  finally
     FreeAndNil(Q);
  end;

  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ver_detalle_factura_prov ' +
           ' set centro_coste=1' +
           ' where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and serie=?serie and tipo=?tipo ' +
           ' and rig=?rig and linea=?linea';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMDetalle.Refresh;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturasAProveedor.ActualizaCosteDetalle(d1, d2, d3, d4, d5: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ges_detalles_costes ' +
           'set digito_1=?d1, ' +
           'digito_2=?d2, ' +
           'digito_3=?d3, ' +
           'digito_4=?d4, ' +
           'digito_5=?d5 ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and ' +
           'serie=?serie and tipo=?tipo and rig=?rig and linea=?linea';
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
     end;
  finally
     FreeAndNil(Q);
  end;

  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturasAProveedor.BorraCosteDetalle;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'delete from ges_detalles_costes ' +
           'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and ' +
           'serie=?serie and tipo=?tipo and rig=?rig and linea=?linea';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ver_detalle_factura_prov ' +
           ' set centro_coste=0' +
           ' where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and serie=?serie and tipo=?tipo ' +
           ' and rig=?rig and linea=?linea';
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMDetalle.Refresh;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturasAProveedor.QMDetalleAfterPost(DataSet: TDataSet);
begin
  GrabaDetalle(DataSet);
  // Acá tengo que ver si la cuenta tiene Centro de Costos.
  if (QMDetalleCENTRO_COSTE.AsInteger = 0) then
     PedirCentroCoste;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
  RefrescaCabeceraManteniendoPosicionDetalle(DataSet);

  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAProveedor.PedirCentroCoste;
var
  Q : THYFIBQuery;
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
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
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
     end;
     FreeAndNil(Q);

     TFMDigitosCoste.Create(Self).Muestra(id, xCuentaArticuloCTA_COMPRAS.AsString);

     // Paso los centros de coste desde la tabla temporal
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
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
     end;
     FreeAndNil(Q);
  end;
end;

{
function TDMFacturasAProveedor.CostesIntroducidos: smallint;
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

procedure TDMFacturasAProveedor.QMDetalleBeforeScroll(DataSet: TDataSet);
begin
  // dji lrk kri Acá tengo que ver si la cuenta tiene Centro de Costos.
  if ((QMDetalleCENTRO_COSTE.AsInteger = 0) and (QMDetalleARTICULO.AsString <> '')) then
     PedirCentroCoste;
end;

function TDMFacturasAProveedor.Dameejercicio: string;
begin
  Result := IntToStr(QMCabeceraEJERCICIO.AsInteger);
end;

procedure TDMFacturasAProveedor.CambiaMonedaDetalle;
begin
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
        Params.ByName['MONEDAOLD'].AsString := monedaold;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        TFParada.Create(Self).ExecQuery(SPCambiaMoneda);
        FreeHandle;
     end;
     QMCabecera.Refresh;
  end;
end;

procedure TDMFacturasAProveedor.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  QMCabeceraTOTAL_FACTURA.DisplayFormat := LocalMascaraN;

  QMDetalleC_RECARGO.DisplayFormat := LocalMascaraL;
  QMDetalleM_BRUTO.DisplayFormat := LocalMascaraL;
  QMDetalleLIQUIDO.DisplayFormat := LocalMascaraL;
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleT_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleBRUTO.DisplayFormat := LocalMascaraL;
  QMDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraL;
  QMDetalleC_IVA.DisplayFormat := LocalMascaraL;
  QMDetalleI_DESCUENTO.DisplayFormat := LocalMascaraL;
  QMDetalleB_DTO_LINEA.DisplayFormat := LocalMascaraL;

  xInfoActualizadaS_CUOTA_IVA.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_CUOTA_RE.DisplayFormat := LocalMascaraN;
  xInfoActualizadaLIQUIDO.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_FINANCIACION.DisplayFormat := LocalMascaraN;
  xInfoActualizadaB_DTO_LINEAS.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_DTO_LINEAS.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_BASES.DisplayFormat := LocalMascaraN;
  xInfoActualizadaIMPORTE_ICE_TOTAL.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_CUOTA_IMPUESTO_ADICIONAL.DisplayFormat := LocalMascaraN;
  xInfoActualizadaTOTAL_FACTURA.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_IRPF.DisplayFormat := LocalMascaraN;
end;

procedure TDMFacturasAProveedor.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1),
     QMCabeceraLIQUIDO.AsFloat);
end;

function TDMFacturasAProveedor.HayDocumentos: boolean;
begin
  Result := (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMFacturasAProveedor.EstadoDocumento: integer;
begin
  Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

function TDMFacturasAProveedor.HayDetalle: boolean;
begin
  Result := (QMDetalle.RecordCount > 0);
end;

procedure TDMFacturasAProveedor.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  monedaold := QMCabeceraMONEDA.AsString;
end;

procedure TDMFacturasAProveedor.InfoLotes;
var
  AsignaLotes : TFMAsignaLotes;
  Q : THYFIBQuery;
  Editable : boolean;
begin
  {
  if (ArticuloLoteable(QMDetalleARTICULO.AsString)) then
  begin
  }
  // Si el documento esta abierto es editable
  Editable := (QMCabeceraESTADO.AsInteger = 0);

  // Si no proviene de un albaran es editable
  if (Editable) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST (1) RIG_O ');
           SQL.Add(' FROM G_PROCEDENCIA_DOCUMENTO_LINEA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA) ');
           SQL.Add(' WHERE ');
           SQL.Add(' TIPO_O = ''ALP'' ');
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
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  AsignaLotes := TFMAsignaLotes.Create(Self);
  try
     with AsignaLotes do
     begin
        AsignaDocumento(QMDetalleTIPO.AsString, QMDetalleID_DETALLES_E.AsInteger, Editable);
     end;
  finally
     AsignaLotes.Free;
  end;
  (*
     TFMIntroduceLotes.Create(Self).AsignaArticulo(QMDetalleTIPO.AsString,
        QMDetalleSERIE.AsString,
        QMDetalleARTICULO.AsString, QMDetalleEJERCICIO.AsInteger,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger, QMDetalleUNIDADES.AsFloat,
        QMCabeceraALMACEN.AsString,
        QMDetalleALMACEN.AsString, QMDetalleCANAL.AsInteger,
        QMDetalleCANAL.AsInteger,
        (QMCabeceraESTADO.AsInteger = 0), QMDetalleID_A.AsInteger,
        QMDetalleID_DETALLES_E.AsInteger, QMCabeceraPROVEEDOR.AsInteger, True);
*)
  // end;
end;

procedure TDMFacturasAProveedor.GrabaDetalle(DataSet: TDataSet);
var
  Q : THYFIBQuery;
  RIGOrigen : integer;
begin
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  // DMMain.Graba;
  DataSet.Refresh;
  InfoActualiza;

  // Siempre y cuando no provenga de una albaran
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
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
     end;
  finally
     FreeAndNil(Q);
  end;
  if (RIGOrigen = 0) then
     InfoLotes;

  DistribuyeArticulo;
  if ((Serializado) and (SerializadoAuto) and not (NumSerie)) then
     AbreSerializadoAuto;
end;

procedure TDMFacturasAProveedor.RefrescaIRPF;
begin
  with xTipoIRPF do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IRPF'].AsFloat := QMCabeceraTIPO_IRPF.AsFloat;
     Open;
  end;

  DamePorIRPF;
end;

procedure TDMFacturasAProveedor.DamePorIRPF;
var
  base : byte;
begin
  with xTipoIRPF do
  begin
     QMCabeceraP_IRPF.AsFloat := FieldByName('P_IRPF').AsFloat;
     base := FieldByName('BASE').AsInteger;
  end;

  if (base = 0) then
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable a la Base Imponible')
  else
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable al Total con IVA');
end;

procedure TDMFacturasAProveedor.QMCabeceraTIPO_IRPFChange(Sender: TField);
begin
  RefrescaIRPF;
end;

procedure TDMFacturasAProveedor.QMDetalleUNIDADESChange(Sender: TField);
begin
  // CambiaUnidadesExt (QMDetalleARTICULO, false);
  if ((Trim(QMDetalleARTICULO.AsString) > '') and (xArticulos.FieldByName('CONTROLA_MEDIDAS').AsInteger = 0)) then
  begin
     if ((QMDetalle.State = dsInsert) or (DMMain.EstadoKri(45) = 0)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE G_PRECIO_COMPRA_MONEDA ');
              SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :ARTICULO, :FECHA, ');
              SQL.Add(' :UNIDADES, :UNIDADES_EXT, :PRECIOP, :MONEDA, :UNIDADES_OLD, :FACTOR) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['PROVEEDOR'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
              Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
              Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
              Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
              Params.ByName['UNIDADES_EXT'].AsFloat := QMDetalleUNIDADES_EXT.AsFloat;
              Params.ByName['PRECIOP'].AsFloat := 0;
              Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
              Params.ByName['UNIDADES_OLD'].AsFloat := unidades_old;
              Params.ByName['FACTOR'].AsFloat := QMCabeceraVALOR_CAMB_FIJO.AsFloat;
              ExecQuery;
              if ((QMDetalle.State = dsInsert) or ((QMDetalle.State = dsEdit) and Param_COMPREC001)) then
              begin
                 if (FieldByName['PRECIO_ANT'].AsInteger = 0) then
                 begin
                    QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
                    QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
                    QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
                    QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
                 end;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  // Se calcula las unidades_sec en funcion del pvp de unidades_sec en la pestaña de articulos
  QMDetalleUNIDADES_SEC.AsFloat := xArticulos.FieldByName('DEFECTO_UD_SECUNDARIA').AsFloat * QMDetalleUNIDADES.AsFloat;

  if ((DMMain.EstadoKri(401) = 1) and (Trim(QMDetalleARTICULO.AsString) > '')) then
  begin
     // Asignamos la cuenta gasto del proveedor si la tuviese
     if (xProveedor.FieldByName('CUENTA_GASTOS').AsString > '') then
        QMDetalleCUENTA.AsString := xProveedor.FieldByName('CUENTA_GASTOS').AsString
     else
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT CUENTA FROM C_DAME_CUENTA_ART_COMPRA(:ID_C_A, :SERIE, :PROYECTO, :ABONO, :DEVOLUCION, :GRUPO_CUENTAS)';
              Params.ByName['ID_C_A'].AsInteger := QMDetalleID_C_A.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['PROYECTO'].AsInteger := QMCabeceraPROYECTO.AsInteger;
              Params.ByName['ABONO'].AsInteger := QMCabeceraSIN_DETALLE.AsInteger;
              Params.ByName['DEVOLUCION'].AsInteger := QMCabeceraDEVOLUCION.AsInteger;
              Params.ByName['GRUPO_CUENTAS'].AsInteger := xProveedor.FieldByName('GRUPO_CUENTAS').AsInteger;
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

  {dji lrk kri - Unidad Logistica}
  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) and (not FlagModificandoUnidades) then
  begin
     FlagModificandoUnidades := True;
     try
        if QMDetalleArticulo.AsString <> '' then
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

           if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
           begin
              QMDetalleUNIDADES.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;
              QMDetallePESO_TOTAL.AsFloat := QMDetalleUNIDADES.AsFloat;
              QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
           end
           else
           begin
              QMDetallePESO_TOTAL.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;
              QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
           end;
        end;
     finally
        FlagModificandoUnidades := False;
     end;
  end;
end;

procedure TDMFacturasAProveedor.PreparaSerializacion;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
end;

procedure TDMFacturasAProveedor.ControlaRestriccion;
begin
  ControlaBorrado(QMCabeceraID_E.AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMFacturasAProveedor.DistribuyeArticulo;
var
  peso, volumen, diametro : double;
begin
  if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     UbicaArticulo(Peso, Volumen, Diametro);
end;

procedure TDMFacturasAProveedor.MuestraUbicacion;
var
  peso, volumen, diametro : double;
begin
  if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
  begin
     TFMDistribuyeArticulos.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
        QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMDetalleID_DETALLES_E.AsInteger,
        QMDetalleID_A.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString,
        QMDetalleUNIDADES.AsFloat);
  end
  else
     ShowMessage(_('El artículo no es ubicable'));
end;

procedure TDMFacturasAProveedor.UbicaArticulo(Peso, Volumen, Diametro: double);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE A_ART_DISTRIBUYE_ARTICULOS ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ');
        SQL.Add(' ?ID_DETALLES_E, ?ID_A, ?UNIDADES, ?PESO, ?VOLUMEN, ?DIAMETRO, ');
        SQL.Add(' 99999, ?ARTICULO) ');
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
        Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
        Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsInteger;
        Params.ByName['PESO'].AsFloat := Peso;
        Params.ByName['VOLUMEN'].AsFloat := Volumen;
        Params.ByName['DIAMETRO'].AsFloat := Diametro;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

{procedure TDMFacturasAProveedor.CambiaMonedaFecha; No se utiliza
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text :=
        'execute procedure ut_refresca_det_e_moneda_fecha (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_E,?MONEDA,?FECHAOLD,?FECHA)';
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
     Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
     Params.ByName['FECHAOLD'].AsDateTime := fecha_old;
     Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
     TFParada.Create(Self).ExecQuery(Q);
     FreeHandle;
  end;
  FreeAndNil(Q);
  QMCabecera.Refresh;
end;}

procedure TDMFacturasAProveedor.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  Fecha_old := QMCabeceraFECHA.AsDateTime;
end;

{function TDMFacturasAProveedor.HayCambioFactor(var factor_ant: double): boolean; No se utiliza
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     DataBase := DMMain.DataBase;
     Close;
     SQL.Text := 'execute procedure dame_cambios_factor_e(?id_e,?origen,?destino,?fecha)';
     Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
     Params.ByName['ORIGEN'].AsString := QMCabeceraMONEDA.AsString;
     Params.ByName['DESTINO'].AsString := REntorno.Moneda;
     Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
     ExecQuery;
     Result := (FieldByName['HAY_CAMBIO'].AsInteger = 1);
     factor_ant := FieldByName['FACTOR_ANT'].AsFloat;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;}

{procedure TDMFacturasAProveedor.RecalculaCambioFactor(factor_ant: double); No se utiliza
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);

  with Q do
  begin
     DataBase := DMMain.DataBase;
     Close;
     SQL.Text :=
        'execute procedure ut_refresca_det_e_moneda_cierra(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_E,?MONEDA,?FECHA,?factor_ant)';
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
     Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
     Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
     Params.ByName['FACTOR_ANT'].AsDouble := Factor_ant;
     TFParada.Create(Self).ExecQuery(Q);
     FreeHandle;
  end;
  FreeAndNil(Q);
end;}

procedure TDMFacturasAProveedor.TraspasodeDocumentos(id_e: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_E = ?ID_E ');
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;
end;

procedure TDMFacturasAProveedor.AbreSerializadoAuto;
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado, Devolucion : integer;
  Ejercicio : smallint;
  Fecha : TDateTime;
  Unidades : double;
begin
  PreparaSerializacion;
  DatosSerializacion(Ejercicio, Serie, Tipo, Almacen,
     Articulo, Rig, Linea, Devolucion, Fecha, Unidades, Estado);
  MuestraSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig, Linea,
     Devolucion, Fecha, Unidades, Estado, Self);
end;

procedure TDMFacturasAProveedor.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;
end;

function TDMFacturasAProveedor.CreaFacturaRectificacion(Serie: string; var d_rig: integer): boolean;
begin
  d_rig := 0;
  Result := False;
  if (QMCabecera.State = dsInsert) then
     QMCabecera.Cancel;

  FMDatosFactRectificacion := TFMDatosFactRectificacion.Create(Self);
  FMDatosFactRectificacion.PasaTipo('FAP');
  FMDatosFactRectificacion.ShowModal;

  if (FMDatosFactRectificacion.ModalResult = mrOk) then
  begin
     with QCreaRectificacion do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_SERIE'].AsString := Serie;
        Params.ByName['D_FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['O_EJERCICIO'].AsInteger := FMDatosFactRectificacion.Ejercicio;
        Params.ByName['O_SERIE'].AsString := FMDatosFactRectificacion.Serie;
        Params.ByName['O_RIG'].AsInteger := FMDatosFactRectificacion.Rig;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := 'FAP';
        TFParada.Create(Self).ExecQuery(QCreaRectificacion);
        d_rig := FieldByName['D_RIG'].AsInteger;
        Result := True;
        FreeHandle;
     end;
  end;

  FMDatosFactRectificacion.Free;
end;

procedure TDMFacturasAProveedor.OrdenarLineas;
begin
  QMDetalle.DisableControls;
  OrdenaLineas('FAP', QMCabeceraID_E.AsInteger, Self);
  QMDetalle.Close;
  QMDetalle.Open;
  QMDetalle.EnableControls;
end;

procedure TDMFacturasAProveedor.RefrescaCabecera(Accion: integer);
begin
  case Accion of
     1: QMCabecera.Refresh;
     2: Refrescar(QMCabecera, 'ID_E', QMCabeceraID_E.AsInteger, False, True);
  end;
end;

procedure TDMFacturasAProveedor.QMCabeceraCAMBIO_FIJOChange(Sender: TField);
begin
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
end;

procedure TDMFacturasAProveedor.FiltraFact(Filtro: string);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(Filtro);
     SelectSQL.Add(' AND SERIE = ''' + REntorno.Serie + '''');
     SelectSQL.Add(' ORDER BY RIG, EJERCICIO ');
     Open;
  end;
end;

procedure TDMFacturasAProveedor.ApunteAnalitico(evaluar: boolean);
var
  Q : THYFIBQuery;
  ric : integer;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT RIC FROM CON_CUENTAS_ASIENTOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' ASIENTO=?ASIENTO ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEmpresa.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEjercicio.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['ASIENTO'].AsInteger := QMCabeceraAsiento.AsInteger;
        ExecQuery;
        ric := FieldByName['RIC'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if ((QMCabeceraESTADO.AsInteger = 5) and (ric > 0)) then
     AbrirImputacionCostes(ric, evaluar);
end;

procedure TDMFacturasAProveedor.BuscaArticulo(Articulo: string);
begin
  { TODO -cOptimizacion : Ver si se puede optimizar filtrando GES_DETALLES_E por EECS y TIPO. }
  with QMCabecera do
  begin
     Close;
     if (Articulo <> '') then
        ModificaSelect(QMCabecera, ' AND ID_E IN (SELECT ID_E FROM GES_DETALLES_E WHERE ID_A = ' + IntToStr(DameIDArticulo(Articulo)) + ')', (Articulo <> ''))
     else
     begin
        SelectSQL.Text := SQLBase;

        if (REntorno.Pais = 'CHL') then
           SelectSQL.Add(' ORDER BY VER.EJERCICIO, VER.TIPO_DOC_TRIBUTARIO, VER.FOLIO DESC ')
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

procedure TDMFacturasAProveedor.FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA_PROV ');
     SelectSQL.Add(' WHERE  ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''FAP'' AND ');
     SelectSQL.Add(' PROVEEDOR = ?PROVEEDOR ');
     case Estado of
        // 0: Todas
        // Activas
        1: SelectSQL.Add(' AND ESTADO = 0 ');
        // Cerradas
        2: SelectSQL.Add(' AND ESTADO = 5 ');
     end;

     if (REntorno.Pais = 'CHL') then
        SelectSQL.Add(' ORDER BY VER.EJERCICIO, VER.TIPO_DOC_TRIBUTARIO, VER.FOLIO DESC ')
     else
        SelectSQL.Add('ORDER BY EJERCICIO, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMFacturasAProveedor.AbreQMNif;
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

procedure TDMFacturasAProveedor.CierraQMNif;
begin
  QMNif.Close;
end;

procedure TDMFacturasAProveedor.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraPROVEEDOR.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;
end;

procedure TDMFacturasAProveedor.RefrescaCabeceraManteniendoPosicionDetalle(DataSet: TDataSet);
var
  id_detalles_e : integer;
begin
  with DataSet do
  begin
     DisableControls;
     if (State = dsInsert) then
        id_detalles_e := -1
     else
        id_detalles_e := FieldByName('ID_DETALLES_E').AsInteger;

     QMCabecera.Refresh;
     if (id_detalles_e = -1) then
        Last
     else
        while ((not EOF) and (FieldByName('ID_DETALLES_E').AsInteger <> id_detalles_e)) do
           Next;
     EnableControls;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
  RefrescaCabeceraManteniendoPosicionDetalle(DataSet);
end;

procedure TDMFacturasAProveedor.QMCabeceraFUERZA_MODO_IVAChange(Sender: TField);
begin
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     if (Sender.AsInteger = 0) then
        QMCabeceraMODO_IVA.AsInteger := xProveedor.FieldByName('MODO_IVA').AsInteger;
end;

procedure TDMFacturasAProveedor.CambiaFinanciacion;
var
  FMFinanciaManual : TFMFinanciaManual;
begin
  FMFinanciaManual := TFMFinanciaManual.Create(Self);
  with FMFinanciaManual do
  begin
     Muestra(QMCabeceraSERIE.AsString, QMCabeceraTIPO.AsString, QMCabeceraRIG.AsInteger);
     Free;
  end;
  QMCabecera.Refresh;
end;

procedure TDMFacturasAProveedor.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES.AsFloat]);
end;

procedure TDMFacturasAProveedor.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAProveedor.RellenaDatosOldLinea;
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAProveedor.RellenaDatosLinea(Linea: TStrings);

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
     // AddField(Linea, 'P_COSTE');
     AddField(Linea, 'DESCUENTO');
     AddField(Linea, 'TITULO');
     AddField(Linea, 'DESCUENTO');
     AddField(Linea, 'DESCUENTO_2');
     AddField(Linea, 'DESCUENTO_3');
     AddField(Linea, 'TIPO_IVA');
     AddField(Linea, 'NOTAS');
  end;
end;

procedure TDMFacturasAProveedor.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMFacturasAProveedor.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulos.Close;
  {dji lrk kri - C.Costes}
  xCuentaArticulo.Close;
  QMDetallesCostes.Close;
end;

procedure TDMFacturasAProveedor.DuplicarLinea;
var
  old_KriConf470 : boolean;
  // Q : THYFIBQuery;
  // IdDetallesE, i, NuevaLinea : integer;
begin
  old_KriConf470 := KriConf470;
  try
     KriConf470 := True;
     // IdDetallesE := QMDetalleID_DETALLES_E.AsInteger;

     // Guardo los datos con lo que hay en la linea si KriConf470 estaba deshabilidatdo
     RellenaDatosOldLinea;

     with QMDetalle do
     begin
        Insert;
        Post;
        Last;
     end;

     {
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO GES_DETALLES_S_DETALLES ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, REFERENCIA, SOPORTE, UNIDADES, ACABADO, ');
           SQL.Add(' EMBALAJE, FECHA_INSTALACION, LUGAR_INSTALACION, ENTRADA, ENTREGA_AAFF, ALTO_AREA_VISIBLE, ANCHO_AREA_VISIBLE, ');
           SQL.Add(' ALTO_MEDIDA_TOTAL, ANCHO_MEDIDA_TOTAL) ');
           SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, :NUEVA_LINEA, ID_S, 0, REFERENCIA, SOPORTE, UNIDADES, ACABADO, EMBALAJE, ');
           SQL.Add('        FECHA_INSTALACION, LUGAR_INSTALACION, :ENTRADA, ENTREGA_AAFF, ALTO_AREA_VISIBLE, ANCHO_AREA_VISIBLE, ');
           SQL.Add('        ALTO_MEDIDA_TOTAL, ANCHO_MEDIDA_TOTAL ');
           SQL.Add(' FROM GES_DETALLES_S_DETALLES ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_DETALLES_S = :ID_DETALLES_S ');
           Params.ByName['NUEVA_LINEA'].AsInteger := NuevaLinea;
           Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
     }
  finally
     KriConf470 := old_KriConf470;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
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

procedure TDMFacturasAProveedor.QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
begin
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

              if Param_VENULKG001 and (QMDetalleTIPO_UNIDAD_LOGISTICA.AsString = 'KG') then
              begin
                 QMDetalleUNIDADES.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;
                 QMDetallePESO_TOTAL.AsFloat := QMDetalleUNIDADES.AsFloat;
                 QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
              end
              else
              begin
                 QMDetallePESO_TOTAL.AsFloat := QMDetallePESO.AsFloat * QMDetalleUNIDADES_LOGISTICAS.AsFloat;
                 QMDetallePESO_REAL.AsFloat := QMDetallePESO_TOTAL.AsFloat;
              end;
           end;
        finally
           FlagModificandoUnidades := False;
        end;
     end;
  end;
end;

procedure TDMFacturasAProveedor.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);

  if (QMCabecera.FieldByName('RECT').AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_RECT';
           Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
           ExecQuery;
           QMCabeceraDESC_RECTIFICACION.AsString := Format(_('Rectificación de la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), IntToStr(FieldByName['RIG'].AsInteger), FieldByName['SERIE'].AsString]);
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
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_RECT';
           Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
           ExecQuery;
           QMCabeceraDESC_RECTIFICACION.AsString := Format(_('Rectificada en la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), IntToStr(FieldByName['RIG'].AsInteger), FieldByName['SERIE'].AsString]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMCabeceraDESC_RECTIFICACION.AsString := '';
end;

procedure TDMFacturasAProveedor.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
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

procedure TDMFacturasAProveedor.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
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

procedure TDMFacturasAProveedor.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
var
  IdLote : integer;
  Composicion : string;
begin
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

function TDMFacturasAProveedor.DameTipoNCFSerie(Serie: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT Z_TIPO_NCF FROM GEN_SERIES WHERE EMPRESA = :EMPRESA AND SERIE = :SERIE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := FieldByName['Z_TIPO_NCF'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleTIPO_IMPUESTO_ADICIONALChange(Sender: TField);
begin
  if (QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT PORCENTAJE FROM SYS_TIPO_IMPUESTO_ADICIONAL WHERE PAIS = :PAIS AND TIPO = :TIPO';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['TIPO'].AsInteger := QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger;
           ExecQuery;

           QMDetalleP_IMPUESTO_ADICIONAL.AsFloat := FieldByName['PORCENTAJE'].AsFloat;

           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDetalleI_IMPUESTO_ADICIONAL.AsFloat := (QMDetalleB_DTO_LINEA.AsFloat * QMDetalleP_IMPUESTO_ADICIONAL.AsFloat) / 100;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleCUENTAChange(Sender: TField);
var
  CuentaExpandida : string;
begin
  CuentaExpandida := ExpandirCadena(Trim(Sender.AsString), REntorno.DigitosSub);
  if (Sender.AsString <> CuentaExpandida) then
     Sender.AsString := CuentaExpandida;
  QMDetalleTITULO_CUENTA.AsString := DameTituloCuenta(CuentaExpandida);
end;

procedure TDMFacturasAProveedor.QMDetalleTITULO_CUENTAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (Trim(QMDetalleCUENTA.AsString) > '') then
     Text := DameTituloCuenta(QMDetalleCUENTA.AsString);
end;

procedure TDMFacturasAProveedor.QMDetalleTIPO_IVAChange(Sender: TField);
begin
  QMDetalleP_IVA.AsFloat := DMMain.DamePorcentajeIva(REntorno.Pais, QMDetalleTIPO_IVA.AsInteger);
end;

procedure TDMFacturasAProveedor.FiltraDocumento(Serie, Filtro: string);
begin
  DMMain.LogIni('DMFacturasAProveedor.FiltraDocumento');
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := SQLBase;
     if (Trim(Filtro) > '') then
        SelectSQL.Add(' AND (' + Filtro + ')');

     if (REntorno.Pais = 'CHL') then
        SelectSQL.Add(' ORDER BY EJERCICIO, TIPO_DOC_TRIBUTARIO, FOLIO DESC ')
     else
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

     DMMain.FiltraTabla(QMCabecera, '11100', False);
     Params.ByName['SERIE'].AsString := Serie;
     CambiaSerie(Serie);
  end;
  DMMain.LogFin('');
end;

procedure TDMFacturasAProveedor.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProveedor.Close;
  xDirecciones.Close;
  QMDetalle.Close;
  QMNIF.Close;
  QMCabecerasCostes.Close;
end;

procedure TDMFacturasAProveedor.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  with xDirecciones do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFacturasAProveedor.QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO.AsFloat]);
end;

procedure TDMFacturasAProveedor.QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_TOTAL.AsFloat]);
end;

procedure TDMFacturasAProveedor.QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_REAL.AsFloat]);
end;

procedure TDMFacturasAProveedor.QMDetallePESO_REALChange(Sender: TField);
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

procedure TDMFacturasAProveedor.ImportaXML(Archivo: string; Log: TStrings);
var
  RutEmisor, RutReceptor, TituloProveedor, Folio, TipoDTE, RznSoc, DirOrigen, TpoDocRef, FolioRef, RazonRef : string;
  TerceroEmisor, ProveedorEmisor : integer;
  MntNeto, MntTotal, MontoIVA, TasaIVA, MntExe, MontoItem, MontoImp : double;
  Documento : TXMLDocument;
  i, IdDocumento, IdDocumentoDetalle, MntBruto : integer;
  Nodo, NodoDetalle, NodoPadre : IXMLNode;
  Seguir : boolean;
  s, NmbItem, DscItem, TpoMov, TpoValor, FmaPago, CmnaOrigen : string;
  QtyItem, PrcItem, DescuentoPct, DescuentoMonto, ValorDR, ValorDRPctDesc, ValorDRPctRec : double;
  FchEmis, FchVenc, FchRef : TDateTime;
  PorcentajeIVA : double;
  TipoIVA, IndExe, NroLinRef, CodRef, Factor : integer;
  Pais, Provincia, Poblacion, Region : string;
  OrigenDocumentoEsExcento : boolean;
begin
  //IndExe := -1;
  Seguir := True;
  ProveedorEmisor := 0;
  MntNeto := 0;
  MntTotal := 0;
  //MontoIVA := 0;
  //QtyItem := 0;
  //PrcItem := 0;
  //DescuentoPct := 0;
  //DescuentoMonto := 0;
  ValorDRPctDesc := 0;
  ValorDRPctRec := 0;
  MntBruto := 0;
  TpoMov := '';
  TpoValor := '';
  ValorDR := 0;
  FmaPago := 'CON';
  Pais := 'CHL';
  Provincia := '';
  Poblacion := '';
  Region := '';
  Factor := 1;
  OrigenDocumentoEsExcento := False;

  Documento := TXMLDocument.Create(Self);
  with Documento do
  begin
     XML.LoadFromFile(Archivo);

     DMMain.Log('Documento.Active := True');
     // Se activa para poder utilizar el componente
     Active := True;

     DMMain.Log('Documento.Encoding = utf-8');
     // Codigifacion UTF-8
     Encoding := 'utf-8';

     DMMain.Log('Documento.NodeIndentStr = #8');
     // Caracter para indentar el fichero XML
     NodeIndentStr := #8;

     DMMain.Log('Obtener nodos');
     // Verificamos RUT del emisor
     NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'Caratula', 'RutEmisor']);
     if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RutEmisor')) then
        RutEmisor := NodoPadre.Text
     else
     begin
        Seguir := False;
        Log.Add(_('No se encontro el RUT del Emisor en el XML'));
     end;

     // Verificamos si el tercero y proveedor del emisor existe
     if Seguir then
     begin
        TerceroEmisor := DMMain.DameTerceroNIF(RutEmisor);
        if (TerceroEmisor <= 0) then
        begin
           // Si no existe el tercero lo creamos

           // Obtenemos la Razon Social del Xml
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor', 'RznSoc']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RznSoc') and (NodoPadre.Text > '')) then
              RznSoc := NodoPadre.Text
           else
           begin
              Seguir := False;
              Log.Add(_('Imposible crear el tercero, no se encontro el nombre de la Razon social'));
           end;

           if Seguir then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'EXECUTE PROCEDURE INSERTA_TERCERO(0, :PAIS_TERCERO, :NIF, :NOMBRE_R_SOCIAL, :FECHA_ALTA, :TELEFONO01, :TELEFONO02, :TELEFAX, :EMAIL, :WEB, :DIRECCION)';
                    Params.ByName['PAIS_TERCERO'].AsString := REntorno.Pais;
                    Params.ByName['NIF'].AsString := RutEmisor;
                    Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(RznSoc, 1, 60);
                    Params.ByName['FECHA_ALTA'].AsDateTime := Now;
                    Params.ByName['TELEFONO01'].AsString := '';
                    Params.ByName['TELEFONO02'].AsString := '';
                    Params.ByName['TELEFAX'].AsString := '';
                    Params.ByName['EMAIL'].AsString := '';
                    Params.ByName['WEB'].AsString := '';
                    Params.ByName['DIRECCION'].AsInteger := 1;
                    ExecQuery;
                    TerceroEmisor := FieldByName['TERCERO'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if (TerceroEmisor > 0) then
              begin
                 // Si tiene datos de direccion lo asignamos
                 // Obtenemos la direccion del emisor en Xml
                 DirOrigen := '';
                 NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor', 'DirOrigen']);
                 if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'DirOrigen') and (NodoPadre.Text > '')) then
                    DirOrigen := NodoPadre.Text;

                 // Obtenemos comuna desde el titulo
                 CmnaOrigen := '';
                 NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor', 'CmnaOrigen']);
                 if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'CmnaOrigen') and (NodoPadre.Text > '')) then
                    CmnaOrigen := NodoPadre.Text;

                 if (CmnaOrigen > '') then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('SELECT FIRST 1 PAIS, PROVINCIA, POBLACION, ');
                          SQL.Add('     (SELECT FIRST 1 REGION ');
                          SQL.Add('     FROM SYS_PROVINCIAS ');
                          SQL.Add('     WHERE ');
                          SQL.Add('     PAIS = P.PAIS AND ');
                          SQL.Add('     PROVINCIA = P.PROVINCIA) REGION ');
                          SQL.Add('FROM SYS_POBLACION P ');
                          SQL.Add('WHERE ');
                          SQL.Add('UPPER(P.TITULO) = UPPER(:TITULO) ');

                          Params.ByName['TITULO'].AsString := CmnaOrigen;
                          ExecQuery;
                          Pais := FieldByName['PAIS'].AsString;
                          Provincia := FieldByName['PROVINCIA'].AsString;
                          Poblacion := FieldByName['POBLACION'].AsString;
                          Region := FieldByName['REGION'].AsString;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 // Asignamos datos a la direccion
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add('UPDATE SYS_TERCEROS_DIRECCIONES ');
                       SQL.Add('SET ');
                       SQL.Add('DIR_NOMBRE = :DIR_NOMBRE, ');
                       SQL.Add('PAIS_DIRECCION = :PAIS, ');
                       SQL.Add('REGION = :REGION, ');
                       SQL.Add('PROVINCIA = :PROVINCIA, ');
                       SQL.Add('POBLACION = :POBLACION ');
                       SQL.Add('WHERE ');
                       SQL.Add('TERCERO = :TERCERO AND ');
                       SQL.Add('DIRECCION = 1  ');

                       Params.ByName['DIR_NOMBRE'].AsString := DirOrigen;
                       Params.ByName['PAIS'].AsString := Pais;
                       Params.ByName['REGION'].AsString := Region;
                       Params.ByName['PROVINCIA'].AsString := Provincia;
                       Params.ByName['POBLACION'].AsString := Poblacion;
                       Params.ByName['TERCERO'].AsInteger := TerceroEmisor;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end
              else
              begin
                 Seguir := False;
                 Log.Add(_('No se ha podido crear el tercero'));
              end;
           end;

        end;
     end;

     if Seguir then
     begin
        // Verificamos si el tercero tiene un Proveedor
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT PROVEEDOR FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA AND TERCERO = :TERCERO';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TERCERO'].AsInteger := TerceroEmisor;
              ExecQuery;
              ProveedorEmisor := FieldByName['PROVEEDOR'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (ProveedorEmisor > 0) then
        begin
           TituloProveedor := DameTituloProveedor(ProveedorEmisor, 0, 0, 0);
        end
        else
        begin
           // Si no existe el proveedor lo creamos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE INSERTA_PROVEEDOR (:EMPRESA, :CANAL, 0, :TERCERO, 0, NULL, '''' )';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TERCERO'].AsInteger := TerceroEmisor;
                 ExecQuery;
                 ProveedorEmisor := FieldByName['PROVEEDOR'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (ProveedorEmisor > 0) then
              TituloProveedor := DameTituloProveedor(ProveedorEmisor, 0, 0, 0);
        end;

        if (ProveedorEmisor <= 0) then
        begin
           Seguir := False;
           Log.Add(_('No se ha podido crear el Proveedor'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos RUT del Receptor
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'Caratula', 'RutReceptor']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RutReceptor')) then
           RutReceptor := NodoPadre.Text
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el RUT del Receptor en el XML'));
        end;

        if Seguir and (RutReceptor <> REntorno.CifEmpresa) then
           Seguir := ConfirmaMensaje(format(_('El RUT del Receptor es diferente al de la empresa.' + #13#10 + 'RUT Receptor: %s' + #13#10 + 'Desea continuar de todos modos?'), [RutReceptor]));
     end;

     if (Seguir) then
     begin
        Log.Add(format(_('Datos de la factura a importar' + #13#10 + #13#10 + 'Tercero: %d - RUT: %s'), [TerceroEmisor, RutEmisor]));
        Log.Add(format(_('Proveedor: %d  - %s'), [ProveedorEmisor, TituloProveedor]));
     end;

     if (Seguir) then
     begin
        // Verificamos Folio
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'Folio']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'Folio')) then
        begin
           Folio := NodoPadre.Text;
           Log.Add(format(_('Folio: %s'), [Folio]));
        end
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el Folio en el XML'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos TipoDTE
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'TipoDTE']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TipoDTE')) then
        begin
           TipoDTE := NodoPadre.Text;
           Log.Add(format(_('TipoDTE: %s'), [TipoDTE]));
        end
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el TipoDTE en el XML'));
        end;
     end;

     // Se verifica el DOCUMENTO origen de la NC
     if (Seguir) then
     begin
        // Creamos el detalle del documento
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento']);
        if Assigned(NodoPadre) then
        begin
           for i := 0 to NodoPadre.ChildNodes.Count - 1 do
           begin
              Nodo := NodoPadre.ChildNodes[i];
              if Assigned(Nodo) then
              begin
                 if (Nodo.NodeName = 'Referencia') then
                 begin

                    NodoDetalle := DameNodo(Nodo, ['TpoDocRef']);
                    if Assigned(NodoDetalle) then
                       TpoDocRef := NodoDetalle.Text
                    else
                       TpoDocRef := '';

                    NodoDetalle := DameNodo(Nodo, ['FolioRef']);
                    if Assigned(NodoDetalle) then
                       FolioRef := NodoDetalle.Text
                    else
                       FolioRef := '';

                    if ((TpoDocRef = '34') or (TpoDocRef = '41')) then
                       OrigenDocumentoEsExcento := True;
                 end;
              end;
           end;
        end;
     end;

     // Verificar si el documento ya existe para ese proveedor
     if DMMain.ExisteDocumentoFolio(RutEmisor, Folio, TipoDTE) then
     begin
        Seguir := False;
        Log.Add(format(_('El documento con RUT %s y Folio %s - %s ya existe!'), [RutEmisor, TipoDTE, Folio]));
     end;

     if (Seguir) then
     begin
        // Verificamos Fecha de emisión
        Seguir := False;

        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'FchEmis']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'FchEmis')) then
        begin
           s := NodoPadre.Text;
           // Convertimos a formato fecha (si es posible)
           // 1234567890
           // yyyy-mm-dd
           Seguir := TryEncodeDate(StrToIntDef(Copy(s, 1, 4), 0), StrToIntDef(Copy(s, 6, 2), 0), StrToIntDef(Copy(s, 9, 2), 0), FchEmis);
        end;

        if (Seguir) then
           Log.Add(format(_('Fecha Emision: %s (%s)'), [DateToStr(FchEmis), s]))
        else
           ShowMessage(_('No se pudo obtener la fecha de emision del XML'));
     end;

     if (Seguir) then
     begin
        // Verificamos Fecha de Vencimiento
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'FchVenc']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'FchVenc')) then
        begin
           Seguir := False;

           s := NodoPadre.Text;
           // Convertimos a formato fecha (si es posible)
           // 1234567890
           // yyyy-mm-dd
           Seguir := TryEncodeDate(StrToIntDef(Copy(s, 1, 4), 0), StrToIntDef(Copy(s, 6, 2), 0), StrToIntDef(Copy(s, 9, 2), 0), FchVenc);

           if (Seguir) then
              Log.Add(format(_('Fecha Vencimiento: %s (%s)'), [DateToStr(FchVenc), s]))
           else
              Log.Add(_('No se pudo obtener la fecha de vencimiento del XML'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos MntBruto
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'MntBruto']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntBruto')) then
           MntBruto := StrToInt(NodoPadre.Text);
     end;

     if (Seguir) then
     begin
        // Verificamos que el monto neto
        MntNeto := 0;
        if ((TipoDTE <> '34') and (not OrigenDocumentoEsExcento)) then
        begin
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntNeto']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntNeto')) then
           begin
              MntNeto := StrToFloatDec(NodoPadre.Text, '.');
              Log.Add(format(_('Monto Neto: %s'), [FloatToStr(MntNeto)]));
           end
           else
           begin
              Seguir := False;
              Log.Add(_('No se encontro el Monto neto en el XML'));
           end;
        end;
     end;

     // Verificamos si tiene monto Exento
     NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntExe']);
     if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntExe')) then
     begin
        MntExe := StrToFloatDec(NodoPadre.Text, '.');
        Log.Add(format(_('Monto Exento: %s'), [FloatToStr(MntNeto)]));
     end;

     if ((Seguir) and ((TipoDTE = '34') or (OrigenDocumentoEsExcento)) and (MntExe > 0)) then
        MntNeto := MntExe;

     if (Seguir) then
     begin
        // Verificamos la Tasa IVA
        TasaIVA := 0;
        if ((TipoDTE <> '34') and (not OrigenDocumentoEsExcento)) then
        begin
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'TasaIVA']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TasaIVA')) then
           begin
              TasaIVA := StrToFloatDec(NodoPadre.Text, '.');
              Log.Add(format(_('Tasa IVA: %s'), [FloatToStr(TasaIVA)]));
           end;
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos el monto de IVA
        MontoIVA := 0;
        if ((TipoDTE <> '34') and (not OrigenDocumentoEsExcento)) then
        begin
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'IVA']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'IVA')) then
           begin
              MontoIVA := StrToFloatDec(NodoPadre.Text, '.');
              Log.Add(format(_('Monto IVA: %s'), [FloatToStr(MontoIVA)]));
           end
           else
           begin
              Seguir := False;
              Log.Add(_('No se encontro el Monto IVA en el XML'));
           end;
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos importe a impuesto adicional
        MontoImp := 0;
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'ImptoReten', 'MontoImp']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MontoImp')) then
        begin
           MontoImp := StrToFloatDec(NodoPadre.Text, '.');
           Log.Add(format(_('Monto impuesto adicional: %s'), [FloatToStr(MontoImp)]));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos el monto total
        MntTotal := 0;
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntTotal']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntTotal')) then
        begin
           MntTotal := StrToFloatDec(NodoPadre.Text, '.');
           Log.Add(format(_('Monto Total: %s'), [FloatToStr(MntTotal)]));
        end
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el Monto total en el XML'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos si tiene descuento/incremento total
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'DscRcgGlobal', 'TpoMov']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TpoMov')) then
           TpoMov := NodoPadre.Text;

        if (TpoMov = 'D') then
           s := _('Descuento Global')
        else
        if (TpoMov = 'R') then
           s := _('Recargo Global');

        { TODO : MARCELO: Asegurar que estos son todos los valores posibles para estos campos }

        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'DscRcgGlobal', 'TpoValor']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TpoValor')) then
           TpoValor := NodoPadre.Text;

        if (TpoValor = '%') then
           s := _('Porcentaje') + ' ' + s
        else
        if (TpoValor = '$') then
           s := _('Importe') + ' ' + s;

        { TODO : MARCELO: Asegurar que estos son todos los valores posibles para estos campos }

        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'DscRcgGlobal', 'ValorDR']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'ValorDR')) then
           ValorDR := StrToFloatDec(NodoPadre.Text, '.');

        if (ValorDR <> 0) then
           Log.Add(format(s + ': %s', [FloatToStr(ValorDR)]));

        if (TpoValor = '%') then
        begin
           if (TpoMov = 'R') then
              // UPDATE a cabecera con porcentaje de financiacion
              ValorDRPctRec := ValorDR;

           if (TpoMov = 'D') then
              // UPDATE a cabecera con porcentaje de descuento
              ValorDRPctDesc := ValorDR;

           ValorDR := 0;
        end;
     end;

     if (Seguir) then
     begin
        {if ConfirmaMensajeCaption(MensajeEmergente, 'Importar factura') then
        begin}
        // Creamos cabecera de factura
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE INS_CABECERA_COMPRA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :PROVEEDOR, :REFERENCIA, :ALMACEN, :FECHA_DOC, :ENTRADA, :NUM_ALBARAN_FACTURA)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := REntorno.Serie;
              Params.ByName['TIPO'].AsString := 'FAP';
              Params.ByName['PROVEEDOR'].AsInteger := ProveedorEmisor;
              Params.ByName['REFERENCIA'].AsString := 'Importacion desde XML';
              Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
              Params.ByName['FECHA_DOC'].AsDateTime := FchEmis;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['NUM_ALBARAN_FACTURA'].AsString := TipoDTE + '-' + Folio;
              try
                 ExecQuery;
              except
                 on E: Exception do
                    Log.Add(E.Message);
              end;

              IdDocumento := FieldByName['ID_E'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (IdDocumento <= 0) then
           Seguir := False
        else
        // Posicionamos sobre la factura recien creada
        if (Seguir) then
           Refrescar(QMCabecera, 'ID_E', IdDocumento, False, True);

        if (Seguir) then
        begin
           // Si se trata de una nota de credito el factor para las unidades sera -1
           if (TipoDTE = '61') then
              Factor := -1;

           // Creamos el detalle del documento
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes[i];
                 if Assigned(Nodo) then
                 begin
                    if (Nodo.NodeName = 'Detalle') then
                    begin
                       NodoDetalle := DameNodo(Nodo, ['NmbItem']);
                       if Assigned(NodoDetalle) then
                          NmbItem := NodoDetalle.Text
                       else
                          NmbItem := '';

                       NodoDetalle := DameNodo(Nodo, ['DscItem']);
                       if Assigned(NodoDetalle) then
                          DscItem := NodoDetalle.Text
                       else
                          DscItem := '';

                       NodoDetalle := DameNodo(Nodo, ['QtyItem']);
                       if Assigned(NodoDetalle) then
                          QtyItem := StrToFloatDec(NodoDetalle.Text, '.') * Factor
                       else
                          QtyItem := 0;

                       NodoDetalle := DameNodo(Nodo, ['PrcItem']);
                       if Assigned(NodoDetalle) then
                          PrcItem := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          PrcItem := 0;

                       NodoDetalle := DameNodo(Nodo, ['MontoItem']);
                       if Assigned(NodoDetalle) then
                          MontoItem := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          MontoItem := 0;

                       NodoDetalle := DameNodo(Nodo, ['DescuentoPct']);
                       if Assigned(NodoDetalle) then
                          DescuentoPct := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          DescuentoPct := 0;

                       NodoDetalle := DameNodo(Nodo, ['DescuentoMonto']);
                       if Assigned(NodoDetalle) then
                          DescuentoMonto := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          DescuentoMonto := 0;

                       NodoDetalle := DameNodo(Nodo, ['IndExe']);
                       if Assigned(NodoDetalle) then
                          IndExe := StrToInt(NodoDetalle.Text)
                       else
                          IndExe := -1;

                       if (IndExe = 0) then
                          TipoIVA := 1
                       else if (IndExe = 1) then
                          TipoIVA := 0;

                       if ((TipoDTE = '34') or (OrigenDocumentoEsExcento)) then
                          TipoIVA := 0
                       else
                          TipoIVA := DameTipoIva(TasaIVA);

                       if ((TipoDTE = '33') and (IndExe = 1)) then
                          TipoIVA := 0
                       else
                          TipoIVA := DameTipoIva(TasaIVA);

                       if ((MontoItem >= 0) and (QtyItem = 0)) then
                       begin
                          QtyItem := 1;
                          PrcItem := MontoItem;
                       end;

                       if ((MontoItem >= 0) and ((DescuentoPct > 0) or (DescuentoMonto <> 0))) then
                       begin
                          NmbItem := NmbItem + ' x ' + FloatToStr(QtyItem);
                          DescuentoPct := 0;
                          QtyItem := 1;
                          PrcItem := MontoItem;
                       end;

                       if (PrcItem = 0) then
                          TipoIVA := 0;

                       // MntBruto - Indica si las líneas de detalle, descuentos y recargos se expresan en montos brutos.
                       //            (Sólo para documentos sin impuestos adicionales) .
                       if ((MntBruto = 1) and (PrcItem > 0)) then
                       begin
                          PorcentajeIVA := DMMain.DamePorcentajeIva(REntorno.Pais, TipoIVA);
                          PrcItem := PrcItem / (1 + PorcentajeIVA / 100);
                       end;

                       IdDocumentoDetalle := InsertaDetalleFactura(IdDocumento, NmbItem, DscItem, QtyItem, PrcItem, DescuentoPct, TipoIVA);

                       // Si el documento es excento actualizamos tipo de iva
                       // - Lo hacemos en delphi, porque en el procedimiento en ese punto no se tiene el tipo de ducumento tributario
                       if ((IdDocumentoDetalle > 0) and ((TipoDTE = '34') or (TipoDTE = '41'))) then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add('UPDATE VER_DETALLE_FACTURA_PROV ');
                                SQL.Add('SET TIPO_IVA = 0 ');
                                SQL.Add('WHERE ID_DETALLES_E = :ID_DETALLES_E ');
                                Params.ByName['ID_DETALLES_E'].AsInteger := IdDocumentoDetalle;
                                try
                                   ExecQuery;
                                except
                                   on E: Exception do
                                      Log.Add(E.Message);
                                end;

                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;

                       if (IdDocumentoDetalle <= 0) then
                       begin
                          Log.Add(format(_('No se ha insertado la linea %s'), [NmbItem]));
                          Seguir := False;
                       end;
                    end;
                 end;
              end;
           end;
        end;

        // Agregamos linea de descuento o recargo general si tuviese
        if (ValorDR <> 0) then
        begin
           if (MntBruto = 1) then
           begin
              //MntBruto - Indica si las líneas de detalle, descuentos y recargos se expresan en montos brutos.
              //           (Sólo para documentos sin impuestos adicionales) .
              // Obtenemos el Tipo de Iva para hacer los calculo
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;

                    SQL.Add(' SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' ARTICULO = :ARTICULO ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                    ExecQuery;
                    TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              PorcentajeIVA := DMMain.DamePorcentajeIva(REntorno.Pais, TipoIVA);
              ValorDR := ValorDR / (1 + PorcentajeIVA / 100);
           end;

           if ((TpoMov = 'D') and (TpoValor = '$')) then
           begin
              // Si el descuento es monetario agregamos una linea de detalle como descuento

              { TODO : MARCELO: Mira este comentario y revisa la documentacion sobre este tema }

              // Esto insertará una línea con el artículo '.'.
              // Esta línea tomará el IVA que tenga asignado el artículo.
              // No creo que haya que sumarle MontoIVA ya que esto es el total de IVA de la factura (No tiene ningún sentido)
              // Como mucho podría ser que el descuento fuera IVA exento, pero no lo creo ya que tiene poco sentido.

              IdDocumentoDetalle := InsertaDetalleFactura(IdDocumento, 'DESCUENTO', '', -1, ValorDR, 0, TipoIVA);
           end
           else
           if ((TpoMov = 'R') and (TpoValor = '$')) then
           begin
              // Si el descuento es monetario agregamos una linea de detalle como descuento
              IdDocumentoDetalle := InsertaDetalleFactura(IdDocumento, 'RECARGO', '', 1, ValorDR, 0, TipoIVA);
           end
           else
           begin
              Log.Add(format(_('No se ha insertado la linea %s'#13#10 + 'Tipo de Descuento/Recargo no valido (TipoMov=%s TipoValor=%s)'), [NmbItem, TpoMov, TpoValor]));
              Seguir := False;
           end;
        end;

        if (Seguir) then
        begin
           if (TipoDTE = '') then
              TipoDTE := 'DES';

           // Asignamos datos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_CABECERAS_E_FAC ');
                 SQL.Add(' SET ');
                 SQL.Add(' FOLIO = :FOLIO, ');
                 SQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO, ');
                 SQL.Add(' FECHA_CON = :FECHA_CON ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E ');
                 Params.ByName['FOLIO'].AsString := Folio;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDTE;
                 Params.ByName['FECHA_CON'].AsDateTime := Now;
                 // Params.ByName['FECHA_CON'].AsDateTime := FchEmis;
                 Params.ByName['ID_E'].AsInteger := IdDocumento;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        if (Seguir) then
        begin
           // Asignamos datos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_CABECERAS_E ');
                 SQL.Add(' SET ');
                 SQL.Add(' SU_REFERENCIA = :SU_REFERENCIA, ');
                 SQL.Add(' DTO_CIAL = :DTO_CIAL, ');
                 SQL.Add(' POR_FINANCIACION = :POR_FINANCIACION, ');
                 SQL.Add(' FECHA_ENTREGA = FECHA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E');

                 Params.ByName['POR_FINANCIACION'].AsFloat := ValorDRPctRec;
                 Params.ByName['DTO_CIAL'].AsFloat := ValorDRPctDesc;
                 Params.ByName['SU_REFERENCIA'].AsString := format(_('VENC. %s'), [DateToStr(FchVenc)]);
                 Params.ByName['ID_E'].AsInteger := IdDocumento;

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Asignamos importe a impuesto adicional
        if ((Seguir) and (MontoImp > 0)) then
        begin
           // Asignamos datos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE VER_DETALLE_FACTURA_PROV ');
                 SQL.Add(' SET ');
                 SQL.Add(' I_IMPUESTO_ADICIONAL = :I_IMPUESTO_ADICIONAL ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E AND ');
                 SQL.Add(' LINEA = 1 ');
                 Params.ByName['ID_E'].AsInteger := IdDocumento;
                 Params.ByName['I_IMPUESTO_ADICIONAL'].AsFloat := MontoImp;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Asignamos las referencias
        if (Seguir) then
        begin
           // Creamos el detalle del documento
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes[i];
                 if Assigned(Nodo) then
                 begin
                    if (Nodo.NodeName = 'Referencia') then
                    begin
                       NodoDetalle := DameNodo(Nodo, ['NroLinRef']);
                       if Assigned(NodoDetalle) then
                          NroLinRef := StrToInt(NodoDetalle.Text)
                       else
                          NroLinRef := 0;

                       NodoDetalle := DameNodo(Nodo, ['TpoDocRef']);
                       if Assigned(NodoDetalle) then
                          TpoDocRef := NodoDetalle.Text
                       else
                          TpoDocRef := '';

                       NodoDetalle := DameNodo(Nodo, ['FolioRef']);
                       if Assigned(NodoDetalle) then
                          FolioRef := NodoDetalle.Text
                       else
                          FolioRef := '';

                       NodoDetalle := DameNodo(Nodo, ['FchRef']);
                       if Assigned(NodoDetalle) then
                       begin
                          s := NodoDetalle.Text;
                          Seguir := TryEncodeDate(StrToIntDef(Copy(s, 1, 4), 0), StrToIntDef(Copy(s, 6, 2), 0), StrToIntDef(Copy(s, 9, 2), 0), FchRef);
                       end;

                       NodoDetalle := DameNodo(Nodo, ['CodRef']);
                       if Assigned(NodoDetalle) then
                          CodRef := StrToInt(NodoDetalle.Text)
                       else
                          CodRef := 0;

                       NodoDetalle := DameNodo(Nodo, ['RazonRef']);
                       if Assigned(NodoDetalle) then
                          RazonRef := NodoDetalle.Text
                       else
                          RazonRef := '';

                       // Insertamos la referencia
                       if ((Seguir) and (NroLinRef > 0)) then
                       begin
                          // Asignamos datos
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO SII_DTE_REFERENCIA_COMPRAS ( ');
                                SQL.Add(' ID_E, NROLINREF, TPODOCREF, FOLIOREF, FCHREF, CODREF, RAZONREF) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :ID_E, :NROLINREF, :TPODOCREF, :FOLIOREF, :FCHREF, :CODREF, :RAZONREF) ');
                                Params.ByName['ID_E'].AsInteger := IdDocumento;
                                Params.ByName['NROLINREF'].AsInteger := NroLinRef;
                                Params.ByName['TPODOCREF'].AsString := TpoDocRef;
                                Params.ByName['FOLIOREF'].AsString := FolioRef;
                                Params.ByName['FCHREF'].AsDateTime := FchRef;
                                Params.ByName['CODREF'].AsInteger := CodRef;
                                Params.ByName['RAZONREF'].AsString := RazonRef;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;
                 end;
              end;
           end;
        end;


        if (Seguir) then
        begin
           if (xInfoActualizadaS_BASES.AsFloat <> MntNeto) then
           begin
              Log.Add(format(_('Existe una diferencia en el monto neto total de la factura %s <> %s'), [FloatToStr(xInfoActualizadaS_BASES.AsFloat), FloatToStr(MntNeto)]));
              Seguir := False;
           end
           else if (xInfoActualizadaTOTAL_FACTURA.AsFloat <> MntTotal) then
           begin
              Log.Add(format(_('Existe una diferencia en el monto total de la factura %s <> %s'), [FloatToStr(xInfoActualizadaTOTAL_FACTURA.AsFloat), FloatToStr(MntTotal)]));
              Seguir := False;
           end;
        end;

        if (Seguir) then
           Log.Add(_('La factura se ha creado con exito.'))
        else
           Log.Add(_('No se ha podido crear la factura o se ha creado con errores.'));

        // Por parametro cerramos el documento creado
        if ((LeeParametro('FACDTED005') = 'S') and (IdDocumento > 0)) then
           CierraDocumento;
     end;
  end;
  Log.Add('==================================================================');
end;

function TDMFacturasAProveedor.DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
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

function TDMFacturasAProveedor.InsertaDetalleFactura(IdDocumento: integer; NmbItem, DscItem: string; QtyItem, PrcItem, DescuentoPct: double; TipoIva: integer): integer;
begin
  // InsertamosDetalle
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        SQL.Text := 'EXECUTE PROCEDURE WEB_INS_DETALLE_COMPRA_3(:ID_E, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO, :TIPO_UNIDAD_LOGISTICA, :UNIDADES_LOGISTICAS, :TIPO_IVA)';
        Params.ByName['ID_E'].AsInteger := IdDocumento;
        Params.ByName['ID_A'].AsInteger := DameIDArticulo(REntorno.ArtTextoLibre, REntorno.Empresa);
        Params.ByName['TITULO'].AsString := NmbItem;
        Params.ByName['UNIDADES'].AsFloat := QtyItem;
        Params.ByName['NOTAS'].AsString := DscItem;
        Params.ByName['PRECIO'].AsFloat := PrcItem;
        Params.ByName['DESCUENTO'].AsFloat := DescuentoPct;
        Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := 'GRNL';
        Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := QtyItem;
        Params.ByName['TIPO_IVA'].AsInteger := TipoIva;

        ExecQuery;
        Result := FieldByName['ID_DETALLES_E'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_EXT.AsFloat]);
end;

procedure TDMFacturasAProveedor.QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_SEC.AsFloat]);
end;

procedure TDMFacturasAProveedor.xProveedorAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMFacturasAProveedor.xProveedorBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMFacturasAProveedor.xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraPROVEEDOR.AsInteger < 0) then
  begin
     Text := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DIRECCION FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :PROVEDOR, :ID_E, 1) WHERE ((NUM = :NUM) OR (:PROVEDOR < 0))';
           Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
           Params.ByName['PROVEDOR'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
           Params.ByName['NUM'].AsInteger := QMCabeceraDIRECCION.AsInteger;
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
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


function TDMFacturasAProveedor.DameFormaPagoTipoEfecto(TipoEfecto: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 FORMA_PAGO FROM CON_CUENTAS_GES_FP ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' TIPO_EFECTO = :TIPO_EFECTO ');
        SQL.Add(' ORDER BY FORMA_PAGO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO_EFECTO'].AsString := TipoEfecto;
        ExecQuery;
        Result := FieldByName['FORMA_PAGO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAProveedor.QMSIIDteReferenciaNewRecord(DataSet: TDataSet);
begin
  QMSIIDteReferenciaTPODOCREF.AsString := '';
  QMSIIDteReferenciaID_E.AsInteger := QMCabeceraID_E.AsInteger;
  QMSIIDteReferenciaFOLIOREF.AsString := '';
end;

procedure TDMFacturasAProveedor.QMSIIDteReferenciaAfterPost(DataSet: TDataSet);
var
  NroLinRef : integer;
begin
  NroLinRef := QMSIIDteReferenciaNROLINREF.AsInteger;
  Refrescar(QMCabecera, 'ID_E', QMSIIDteReferenciaID_E.AsInteger);
  Refrescar(QMSIIDteReferencia, 'NROLINREF', NroLinRef);
end;

procedure TDMFacturasAProveedor.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMFacturasAProveedor.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMFacturasAProveedor.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMFacturasAProveedor.QMCabeceraFECHAChange(Sender: TField);
begin
  // Si modifica, que no cambien las fechas automaticamente
  if ((Param_FAPFEC0001 = 'S') or ((Param_FAPFEC0001 = 'I') and (QMCabecera.State = dsInsert))) then
  begin
     QMCabeceraFECHA_CON.AsDateTime := QMCabeceraFECHA.AsDateTime;

     QMCabeceraFECHA_ENTREGA.AsDateTime := QMCabeceraFECHA.AsDateTime;
  end;
end;

procedure TDMFacturasAProveedor.CierraDocumento;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_PROV_CIERRA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :TIPO, :FECHA, :ENTRADA, :ID_E)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMFacturasAProveedor.AbreDatosEnviosECF;
begin
  if (REntorno.Pais = 'DOM') then
     xFacturaCompraDGII.Open;
end;

procedure TDMFacturasAProveedor.CierraDatosEnviosECF;
begin
  xFacturaCompraDGII.Close;
end;

procedure TDMFacturasAProveedor.AbreDatosDTE;
begin
  if (REntorno.Pais = 'CHL') then
     QMSIIDteReferencia.Open;
end;

procedure TDMFacturasAProveedor.CierraDatosDTE;
begin
  QMSIIDteReferencia.Close;
end;

function TDMFacturasAProveedor.DocumentoEcfValido: boolean;
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

  function TieneItbis: boolean;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(TIPO_IVA) ITBIS FROM GES_DETALLES_E WHERE ID_E = :ID_E ');
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
           ExecQuery;
           Result := (FieldByName['ITBIS'].AsInteger > 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  Activo := xFacturaCompraDGII.Active;

  xFacturaCompraDGII.Close;
  xFacturaCompraDGII.Open;
  QMNIF.Open;

  Result := False;
  if ((QMCabeceraZ_TIPO_NCF.AsInteger <> 41) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 43) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 47)) then
  begin
     ShowMessage(_('Solo se acepta envios de documentos tipo 41, 43, 47'));
  end
  else
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     ShowMessage(_('El documento debe estar cerrado para ser enviado al DGII'));
  end
  else
  if ((TieneItbis) and (QMCabeceraZ_TIPO_NCF.AsInteger = 43)) then
  begin
     ShowMessage(_('El documento de gastos menores no puede tener Itbis asignado'));
  end
  else
  if ((Trim(QMCabeceraZ_PREFIJO_NCF.AsString) = '') or (Trim(QMCabeceraZ_CONTADOR_NCF.AsString) = '') or (QMCabeceraZ_TIPO_NCF.AsInteger = 0)) then
  begin
     ShowMessage(_('El documento debe tener asignado la secuencia ECF y el tipo CF'));
  end
  else
  if (xFacturaCompraDGII.RecordCount > 0) then
  begin
     ShowMessage(_('Ya existe un registro de envio para este documento'));
  end
  else
  if (((QMCabeceraZ_TIPO_NCF.AsInteger = 47) or (QMCabeceraZ_TIPO_NCF.AsInteger = 41)) and (QMCabeceraDOM_ID_TIPO_RETENCION.AsInteger = 0)) then
  begin
     ShowMessage(_('El documento tiene que tener una retencion asignada'));
  end
  else
  if ((QMCabeceraPROVEEDOR.AsInteger = -1) and ((QMNIFNIF.AsString = '') or (QMNIFNOMBRE.AsString = ''))) then
  begin
     ShowMessage(_('Debe asignar numero identificacion y razon social CTRL + D'));
  end
  {
  else
  if (not VerificaAsignacionItbis) then
  begin
     ShowMessage(_('El porcentaje de ITBIS no corresponde al tipo ITBIS - Verifique que el cliente no sea excento de ITBIS'));
  end
  else
  if ((QMCabeceraZ_TIPO_NCF.AsInteger = 34) and (Trim(QMDGIIReferenciasENCF_REF.AsString) = '')) then
  begin
     ShowMessage(_('El documento debe tener el ENCF de referencia asignado'));
  end
  else
  if (QMCabeceraTIPO_INGRESOS.AsInteger = 0) then
  begin
     ShowMessage(_('El documento debe tener el Tipo de Ingreso asignado'));
  end
  }
  else
  begin
     DMMain.VerificaDocumentoIdentificacion(xProveedor.FieldByName('PAIS_TERCERO').AsString, xProveedor.FieldByName('TIPO_DOC_IDENT').AsString, xProveedor.FieldByName('NIF').AsString, Valido, MensajeError);
     if ((not Valido) and (QMCabeceraZ_TIPO_NCF.AsInteger <> 43)) then
        ShowMessage(_('El Proveedor no tiene un RNC correcto') + #13#10 + MensajeError + #13#10 + QMCabeceraNIF.AsString)
     else
        Result := True;
  end;

  // Si son validas las cuestiones generales sigo validando numeros de identificacion del proveedor
  if (Result) then
  begin
     Result := False;
     if ((xProveedor.FieldByName('PROVEEDOR').AsInteger = -1) and (QMNIFNIF.AsString <> '')) then
     begin
        if (QMNIFPAIS_DOC_IDENT.AsString = 'DOM') and ((QMNIFTIPO_DOC_IDENT.AsString = 'RNC') or (QMNIFTIPO_DOC_IDENT.AsString = 'DNI')) and (Length(QMNIFNIF.AsString) > 11) then
        begin
           ShowMessage(_('El RNC deberia tener hasta a 11 caracteres'));
        end
        else if (QMNIFPAIS_DOC_IDENT.AsString <> 'DOM') and (QMNIFTIPO_DOC_IDENT.AsString = 'PAS') and (Length(QMNIFNIF.AsString) > 20) then
        begin
           ShowMessage(_('El Pasaporte deberia tener hasta 20 caracteres'));
        end
        else if ((QMNIFPAIS_DOC_IDENT.AsString = 'DOM') and ((QMNIFTIPO_DOC_IDENT.AsString <> 'RNC') and (QMNIFTIPO_DOC_IDENT.AsString <> 'DNI'))) then
        begin
           ShowMessage(_('El tipo de documento para un cliente dominicano deberia ser de tipo DNI o RNC'));
        end
        else if ((QMNIFPAIS_DOC_IDENT.AsString <> 'DOM') and (QMNIFTIPO_DOC_IDENT.AsString <> 'PAS')) then
        begin
           ShowMessage(_('El tipo de documento para un cliente extranjero deberia ser de tipo Pasaporte'));
        end
        else
           Result := True;
     end
     else
     if ((xProveedor.FieldByName('PROVEEDOR').AsInteger > 0) and (xProveedor.FieldByName('NIF').AsString <> '')) then
     begin
        if (xProveedor.FieldByName('PAIS_TERCERO').AsString = 'DOM') and ((xProveedor.FieldByName('TIPO_DOC_IDENT').AsString = 'DNI') or (xProveedor.FieldByName('TIPO_DOC_IDENT').AsString = 'RNC')) and (Length(xProveedor.FieldByName('NIF').AsString) > 11) then
        begin
           ShowMessage(_('El RNC deberia tener hasta 11 caracteres'));
        end
        else if (xProveedor.FieldByName('PAIS_TERCERO').AsString <> 'DOM') and (xProveedor.FieldByName('TIPO_DOC_IDENT').AsString = 'PAS') and (Length(xProveedor.FieldByName('NIF').AsString) > 20) then
        begin
           ShowMessage(_('El Pasaporte deberia tener hasta 20 caracteres'));
        end
        else if ((xProveedor.FieldByName('PAIS_TERCERO').AsString = 'DOM') and ((xProveedor.FieldByName('TIPO_DOC_IDENT').AsString <> 'RNC') and (xProveedor.FieldByName('TIPO_DOC_IDENT').AsString <> 'DNI'))) then
        begin
           ShowMessage(_('El tipo de documento para un cliente dominicano deberia ser de tipo DNI o RNC'));
        end
        else if ((xProveedor.FieldByName('PAIS_TERCERO').AsString <> 'DOM') and (xProveedor.FieldByName('TIPO_DOC_IDENT').AsString <> 'PAS')) then
        begin
           ShowMessage(_('El tipo de documento para un cliente extranjero deberia ser de tipo Pasaporte'));
        end
        else
           Result := True;
     end;
  end;

  // Dejo Datasets como estaban
  QMNIF.Close;
  if Activo and (not xFacturaCompraDGII.Active) then
     xFacturaCompraDGII.Open;
end;

end.
