unit ZUDMPresupueto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  ExtCtrls, FIBQuery, HYFIBQuery;

type
  TZDMPresupuesto = class(TDataModule)
     TLocal: THYTransaction;
     QMPresupuesto: TFIBTableSet;
     DSQMPresupuesto: TDataSource;
     QMPresupuestoEMPRESA: TIntegerField;
     QMPresupuestoN_PRESUPUETO: TIntegerField;
     QMPresupuestoEJERCICIO: TIntegerField;
     QMPresupuestoCANAL: TIntegerField;
     QMPresupuestoFECHA_EMISION: TDateTimeField;
     QMPresupuestoCLIENTE: TIntegerField;
     QMPresupuestoDESCRIPCION: TFIBStringField;
     QMPresupuestoANCHO: TFloatField;
     QMPresupuestoAVANCE: TFloatField;
     QMPresupuestoCOMENTARIOS: TFIBStringField;
     QMPresupuestoESCALADO_CANT1: TFloatField;
     QMPresupuestoESCALADO_CANT2: TFloatField;
     QMPresupuestoESCALADO_CANT3: TFloatField;
     QMPresupuestoESCALADO_CANT4: TFloatField;
     QMPresupuestoESCALADO_COTIZ1: TFloatField;
     QMPresupuestoESCALADO_COTIZ2: TFloatField;
     QMPresupuestoESCALADO_COTIZ3: TFloatField;
     QMPresupuestoESCALADO_COTIZ4: TFloatField;
     QMPresupuestoGASTOS_INICIALES: TFloatField;
     QMPresupuestoGASTOS_INICIALES_DESCR: TFIBStringField;
     QMPresupuestoIMAGEN_ETIQUETA: TFIBStringField;
     QMPresupuestoNOTAS: TBlobField;
     QMPresupuestoTIPO_AUX_ADHESIVO: TFIBStringField;
     QMPresupuestoCODIGO_ADHESIVO: TFIBStringField;
     QMPresupuestoTIPO_AUX_MATERIAL: TFIBStringField;
     QMPresupuestoCODIGO_MATERIAL: TFIBStringField;
     QMPresupuestoTIPO_AUX_TINTA: TFIBStringField;
     QMPresupuestoCODIGO_TINTA: TFIBStringField;
     QMPresupuestoTIPO_AUX_PRESENTACION: TFIBStringField;
     QMPresupuestoCODIGO_PRESENTACION: TFIBStringField;
     QMPresupuestoTIPO_AUX_FORMA_ENVIO: TFIBStringField;
     QMPresupuestoCODIGO_FORMA_ENVIO: TFIBStringField;
     QMPresupuestoTIPO_AUX_SITUACION_PRES: TFIBStringField;
     QMPresupuestoCODIGO_SITUACION_PRES: TFIBStringField;
     QMPresupuestoAGENTES: TIntegerField;
     QMPresupuestoCOMISION: TFloatField;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     xMaestros: TFIBDataSetRO;
     xMaestrosDESCRIPCION: TFIBStringField;
     QMPresupuestoDescAdhesivo: TStringField;
     QMPresupuestoDescMaterial: TStringField;
     QMPresupuestoDescTinta: TStringField;
     QMPresupuestoDescPresentacion: TStringField;
     QMPresupuestoDescFormaEnv: TStringField;
     QMPresupuestoDescSituacionPres: TStringField;
     xAgentes: TFIBDataSetRO;
     xAgentesEMPRESA: TIntegerField;
     xAgentesAGENTE: TIntegerField;
     xAgentesTERCERO: TIntegerField;
     xAgentesTITULO: TFIBStringField;
     xAgentesCOMISION: TFloatField;
     DSxAgentes: TDataSource;
     frPresupuesto: TfrHYReport;
     frDBDSPresup: TfrDBDataSet;
     DSxLstPresup: TDataSource;
     QMPresupuestoTERCERO: TIntegerField;
     QMPresupuestoCONTACTO: TIntegerField;
     xContacto: TFIBDataSetRO;
     xContactoTERCERO: TIntegerField;
     xContactoCONTACTO: TIntegerField;
     xContactoNOMBRE: TFIBStringField;
     xContactoAPELLIDOS: TFIBStringField;
     xContactoMOVIL: TFIBStringField;
     xContactoTELEFONO: TFIBStringField;
     xContactoFAX: TFIBStringField;
     xContactoEXTENSION: TFIBStringField;
     xContactoCORREO: TFIBStringField;
     xContactoNOTAS: TBlobField;
     DSContacto: TDataSource;
     QMPresupuestoWEB: TIntegerField;
     QMPresupuestoTITULO_CLIENTE: TFIBStringField;
     QMPresupuestoEMAIL_CLIENTE: TFIBStringField;
     xClientesEMPRESA: TIntegerField;
     xClientesEJERCICIO: TIntegerField;
     xClientesCANAL: TIntegerField;
     xClientesNUM_CLIENTE: TIntegerField;
     xClientesNUM_TERCERO: TIntegerField;
     xClientesCUENTA_CONTABLE: TFIBStringField;
     xClientesNOMBRE_SOCIAL: TFIBStringField;
     xClientesNOMBRE_COMERCIAL: TFIBStringField;
     xClientesNIF: TFIBStringField;
     xClientesTELEFONO01: TFIBStringField;
     xClientesTELEFONO02: TFIBStringField;
     xClientesFAX: TFIBStringField;
     xClientesE_MAIL: TFIBStringField;
     xClientesWEB: TFIBStringField;
     xClientesBANCO: TFIBStringField;
     xClientesENTIDAD: TFIBStringField;
     xClientesSUCURSAL: TFIBStringField;
     xClientesDC: TFIBStringField;
     xClientesTIPO_DIRECCION: TFIBStringField;
     xClientesDIRECCION: TFIBStringField;
     xClientesDIRECCION2: TFIBStringField;
     xClientesDIR_NUMERO: TFIBStringField;
     xClientesDIR_ESCALERA: TFIBStringField;
     xClientesDIR_PISO: TFIBStringField;
     xClientesDIR_PUERTA: TFIBStringField;
     xClientesDIR_COMPLETA: TFIBStringField;
     xClientesDIR_COMPLETA2: TFIBStringField;
     xClientesCODIGO_POSTAL: TFIBStringField;
     xClientesPOBLACION: TFIBStringField;
     xClientesPROVINCIA: TFIBStringField;
     xClientesPAIS: TFIBStringField;
     xLstPresupuestos: TFIBDataSetRO;
     xLstPresupuestosEMPRESA: TIntegerField;
     xLstPresupuestosN_PRESUPUETO: TIntegerField;
     xLstPresupuestosEJERCICIO: TIntegerField;
     xLstPresupuestosCANAL: TIntegerField;
     xLstPresupuestosFECHA_EMISION: TDateTimeField;
     xLstPresupuestosCLIENTE: TIntegerField;
     xLstPresupuestosDESCRIPCION: TFIBStringField;
     xLstPresupuestosANCHO: TFloatField;
     xLstPresupuestosAVANCE: TFloatField;
     xLstPresupuestosCOMENTARIOS: TFIBStringField;
     xLstPresupuestosESCALADO_CANT1: TFloatField;
     xLstPresupuestosESCALADO_CANT2: TFloatField;
     xLstPresupuestosESCALADO_CANT3: TFloatField;
     xLstPresupuestosESCALADO_CANT4: TFloatField;
     xLstPresupuestosESCALADO_COTIZ1: TFloatField;
     xLstPresupuestosESCALADO_COTIZ2: TFloatField;
     xLstPresupuestosESCALADO_COTIZ3: TFloatField;
     xLstPresupuestosESCALADO_COTIZ4: TFloatField;
     xLstPresupuestosGASTOS_INICIALES: TFloatField;
     xLstPresupuestosGASTOS_INICIALES_DESCR: TFIBStringField;
     xLstPresupuestosIMAGEN_ETIQUETA: TFIBStringField;
     xLstPresupuestosNOTAS: TBlobField;
     xLstPresupuestosTIPO_AUX_ADHESIVO: TFIBStringField;
     xLstPresupuestosCODIGO_ADHESIVO: TFIBStringField;
     xLstPresupuestosTIPO_AUX_MATERIAL: TFIBStringField;
     xLstPresupuestosCODIGO_MATERIAL: TFIBStringField;
     xLstPresupuestosTIPO_AUX_TINTA: TFIBStringField;
     xLstPresupuestosCODIGO_TINTA: TFIBStringField;
     xLstPresupuestosTIPO_AUX_PRESENTACION: TFIBStringField;
     xLstPresupuestosCODIGO_PRESENTACION: TFIBStringField;
     xLstPresupuestosTIPO_AUX_FORMA_ENVIO: TFIBStringField;
     xLstPresupuestosCODIGO_FORMA_ENVIO: TFIBStringField;
     xLstPresupuestosTIPO_AUX_SITUACION_PRES: TFIBStringField;
     xLstPresupuestosCODIGO_SITUACION_PRES: TFIBStringField;
     xLstPresupuestosAGENTES: TIntegerField;
     xLstPresupuestosCOMISION: TFloatField;
     xLstPresupuestosTERCERO: TIntegerField;
     xLstPresupuestosCONTACTO: TIntegerField;
     xLstPresupuestosWEB: TIntegerField;
     xLstPresupuestosTITULO_CLIENTE: TFIBStringField;
     xLstPresupuestosEMAIL_CLIENTE: TFIBStringField;
     QMPresupuestoNOMBRE_CONTACTO: TFIBStringField;
     QMPresupuestoAPELLIDOS_CONTACTO: TFIBStringField;
     xLstPresupuestosNOMBRE_CONTACTO: TFIBStringField;
     xLstPresupuestosAPELLIDOS_CONTACTO: TFIBStringField;
     QMPresupuestoTIPO_COTIZACION: TIntegerField;
     QMPresupuestoESCALADO_CANT5: TFloatField;
     QMPresupuestoESCALADO_CANT6: TFloatField;
     QMPresupuestoESCALADO_COTIZ6: TFloatField;
     QMPresupuestoGASTOS_TROQUEL1: TFloatField;
     QMPresupuestoGASTOS_TROQUEL1_DESCR: TFIBStringField;
     QMPresupuestoGASTOS_TROQUEL2: TFloatField;
     QMPresupuestoESTAMPACION: TIntegerField;
     QMPresupuestoRELIEVE: TIntegerField;
     QMPresupuestoESCALADO_COTIZ5: TFloatField;
     QMPresupuestoGASTOS_TROQUEL2_DESCR: TFIBStringField;
     SPDuplicar: THYFIBQuery;
     xLstPresupuestosTIPO_COTIZACION: TIntegerField;
     xLstPresupuestosESCALADO_CANT5: TFloatField;
     xLstPresupuestosESCALADO_COTIZ5: TFloatField;
     xLstPresupuestosESCALADO_CANT6: TFloatField;
     xLstPresupuestosESCALADO_COTIZ6: TFloatField;
     xLstPresupuestosGASTOS_TROQUEL1: TFloatField;
     xLstPresupuestosGASTOS_TROQUEL1_DESCR: TFIBStringField;
     xLstPresupuestosGASTOS_TROQUEL2: TFloatField;
     xLstPresupuestosGASTOS_TROQUEL2_DESCR: TFIBStringField;
     xLstPresupuestosESTAMPACION: TIntegerField;
     xLstPresupuestosRELIEVE: TIntegerField;
     QMPresupuestoREIMPRESION: TIntegerField;
     QMPresupuestoBARNIZ: TIntegerField;
     QMPresupuestoDIAMETRO_INT: TFloatField;
     QMPresupuestoDIAMETRO_EXT: TFloatField;
     QMPresupuestoETIQUETA_ROLLO: TFloatField;
     QMPresupuestoETIQUETA_ANCHO: TFloatField;
     QMPresupuestoPOSICION_SALIDA: TFIBStringField;
     QMPresupuestoOBSERVACIONES_ETIQUETA: TFIBStringField;
     DSxClientesFormaPago: TDataSource;
     xClientesFormaPago: TFIBDataSetRO;
     xClientesFormaPagoTITULO: TFIBStringField;
     xClientesCC: TFIBStringField;
     QMPresupuestoWEB_CLIENTE: TFIBStringField;
     QMPresupuestoTELEFONO_CLIENTE: TFIBStringField;
     QMPresupuestoFAX_CLIENTE: TFIBStringField;
     QMPresupuestoCIF_CLIENTE: TFIBStringField;
     QMPresupuestoDIRECCION_CLIENTE: TFIBStringField;
     QMPresupuestoCP_CLIENTE: TFIBStringField;
     QMPresupuestoPOBLACION: TFIBStringField;
     QMPresupuestoFORMA_PAGO: TFIBStringField;
     QMPresupuestoENTIDAD: TFIBStringField;
     QMPresupuestoSUCURSAL: TFIBStringField;
     QMPresupuestoDC: TFIBStringField;
     QMPresupuestoCC: TFIBStringField;
     QMPresupuestoID_DETALLES_OFERTAS_V: TIntegerField;
     ZxUpdatePresupuesto: THYFIBQuery;
     QGen: THYFIBQuery;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     QMPresupuestoARTICULO_MATERIAL: TFIBStringField;
     SPCrearOfertaEscandallo: THYFIBQuery;
     QMPresupuestoARTICULO_ADHESIVO: TFIBStringField;
     QMPresupuestoARTICULO_CAJA: TFIBStringField;
     QMPresupuestoARTICULO_BARNIZ: TFIBStringField;
     QMPresupuestoARTICULO_TINTA1: TFIBStringField;
     QMPresupuestoARTICULO_TINTA2: TFIBStringField;
     QMPresupuestoARTICULO_TINTA3: TFIBStringField;
     QMPresupuestoARTICULO_TINTA4: TFIBStringField;
     QMPresupuestoARTICULO_TINTA5: TFIBStringField;
     QMPresupuestoARTICULO_TINTA6: TFIBStringField;
     QMPresupuestoARTICULO_TINTA7: TFIBStringField;
     QMPresupuestoARTICULO_TINTA8: TFIBStringField;
     xMaestrosTIPO_AUX: TFIBStringField;
     xMaestrosCODIGO: TFIBStringField;
     xMaestrosCANTIDAD: TIntegerField;
     xMaestrosPORCENTAJE: TFloatField;
     DSMaestros: TDataSource;
     QMPresupuestoDescArtMat: TStringField;
     xArticulosTITULO: TFIBStringField;
     QMPresupuestoDescArtAdh: TStringField;
     QMPresupuestoDescArtBarniz: TStringField;
     QMPresupuestoDescartCaja: TStringField;
     QMPresupuestoDescArtTinta1: TStringField;
     QMPresupuestoDescArtTinta2: TStringField;
     QMPresupuestoDescArtTinta3: TStringField;
     QMPresupuestoDesctArtTinta4: TStringField;
     QMPresupuestoDescArtTinta5: TStringField;
     QMPresupuestoDesctArtTinta6: TStringField;
     QMPresupuestoDescArtTinta7: TStringField;
     QMPresupuestoDescArtTinta8: TStringField;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleN_PRESUPUESTO: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCANTIDAD: TFloatField;
     QMDetalleMAQUINA: TIntegerField;
     QMDetalleTINTA: TIntegerField;
     QMDetalleANCHO: TFloatField;
     QMDetalleAVANCE: TFloatField;
     QMDetalleSEPARACION: TFloatField;
     QMDetalleFIGURAS: TFloatField;
     QMDetalleCAMBIO_BOBINAS: TFloatField;
     QMDetalleARREGLO: TFloatField;
     QMDetalleCAMBIOS: TFloatField;
     QMDetalleANCHO_BOBINA: TFloatField;
     QMDetalleNUMERO_CAJAS: TFloatField;
     SPLineaSegDet: THYFIBQuery;
     QMDetalleANCHO_TOTAL: TFloatField;
     QMDetalleVALOR_CAMBIO_BOBINA: TFloatField;
     QMDetalleVALOR_CAMBIO: TFloatField;
     QMDetalleM2: TFloatField;
     QMDetalleCAMBIO_COLOR: TFloatField;
     QMPresupuestoP_COSTE_CAJA: TFloatField;
     QMPresupuestoP_COSTE_ADHESIVO: TFloatField;
     QMPresupuestoP_COSTE_BARNIZ: TFloatField;
     QMPresupuestoP_COSTE_MATERIAL: TFloatField;
     QMPresupuestoP_COSTE_TINTA1: TFloatField;
     QMPresupuestoP_COSTE_TINTA2: TFloatField;
     QMPresupuestoP_COSTE_TINTA3: TFloatField;
     QMPresupuestoP_COSTE_TINTA4: TFloatField;
     QMPresupuestoP_COSTE_TINTA5: TFloatField;
     QMPresupuestoP_COSTE_TINTA6: TFloatField;
     QMPresupuestoP_COSTE_TINTA7: TFloatField;
     QMPresupuestoP_COSTE_TINTA8: TFloatField;
     xArticulosP_COSTE: TFloatField;
     QMPresupuestoARTICULO_PORTES: TFIBStringField;
     QMPresupuestoP_COSTE_PORTES: TFloatField;
     QMPresupuestoRECURSO: TFIBStringField;
     QMPresupuestoP_COSTE_RECURSO: TFloatField;
     QMPresupuestoDescRecurso: TStringField;
     xRecursos: TFIBDataSetRO;
     DSxRecursos: TDataSource;
     xRecursosTITULO: TFIBStringField;
     QMDetalleID_ESC: TIntegerField;
     xRecursosIMPORTE: TFloatField;
     QMDetalleHORAS_CAMBIOS: TFloatField;
     QMDetalleCOSTE_CAMBIO_BOBINAS: TFloatField;
     QMDetalleTOTAL_HORAS: TFloatField;
     QMDetallePRECIO_HORAS_IMPRESION: TFloatField;
     QMDetalleIMPORTE_RECURSO: TFloatField;
     QMDetalleVALOR_HORAS_CAMBIO: TFloatField;
     QMPresupuestoDescArtPortes: TStringField;
     SPBorrarOfertaEscandallo: THYFIBQuery;
     Precio_Recurso: THYFIBQuery;
     QMPresupuestoNUM_TINTAS: TFloatField;
     QMPresupuestoPORCENTAJE: TFloatField;
     QMDetalleML_TIRAJE: TFloatField;
     QMDetalleML_CAMBIO_BOBINA: TFloatField;
     QMDetalleML_CAMBIO_COLOR: TFloatField;
     QMDetalleML_PREPARACION: TFloatField;
     QMDetalleML_CAMBIO_PLANCHA: TFloatField;
     QMDetalleLONGITUD_BOBINA: TFloatField;
     QMDetalleML_CAMBIO_BOBINA_CTE: TFloatField;
     Tinta: THYFIBQuery;
     Constantes: THYFIBQuery;
     QMDetalleVALOR_ML_CAMBIO_PLANCHA: TFloatField;
     Maquina: THYFIBQuery;
     QMDetalleML_TOTAL: TFloatField;
     QMDetalleGRAMOS_TINTA: TFloatField;
     QMDetalleGRAMOS_BARNIZ: TFloatField;
     QMDetalleKGS_TINTA: TFloatField;
     QMDetalleKGS_BARNIZ: TFloatField;
     QMDetalleHORAS_PREPARACION_MAQUINA: TFloatField;
     QMDetalleTIEMPO_PREPARACION: TFloatField;
     QMDetalleHORAS_IMPRESION: TFloatField;
     QMDetalleHORAS_CAMBIO_POLIMEROS: TFloatField;
     QMDetalleHORAS_CAMBIO_BOBINAS: TFloatField;
     ProMaquina: THYFIBQuery;
     QMDetalleRECURSO: TFIBStringField;
     QMDetallePVP: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure graba(DataSet: TDataSet);
     procedure QMPresupuestoNewRecord(DataSet: TDataSet);
     procedure QMPresupuestoBeforePost(DataSet: TDataSet);
     procedure QMPresupuestoAfterOpen(DataSet: TDataSet);
     procedure QMPresupuestoCLIENTEChange(Sender: TField);
     procedure QMPresupuestoCODIGO_ADHESIVOChange(Sender: TField);
     procedure QMPresupuestoCODIGO_MATERIALChange(Sender: TField);
     procedure QMPresupuestoCODIGO_TINTAChange(Sender: TField);
     procedure QMPresupuestoCODIGO_PRESENTACIONChange(Sender: TField);
     procedure QMPresupuestoCODIGO_FORMA_ENVIOChange(Sender: TField);
     procedure QMPresupuestoCODIGO_SITUACION_PRESChange(Sender: TField);
     procedure QMPresupuestoAGENTESChange(Sender: TField);
     procedure QMPresupuestoDescAdhesivoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescMaterialGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescTintaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescPresentacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescFormaEnvGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescSituacionPresGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoBeforeScroll(DataSet: TDataSet);
     procedure frPresupuestoGetValue(const ParName: string; var ParValue: variant);
     procedure QMPresupuestoCONTACTOChange(Sender: TField);
     procedure frPresupuestoEnterRect(Memo: TStringList; View: TfrView);
     procedure QMPresupuestoDescArtMatGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtAdhGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtBarnizGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescartCajaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtTinta1GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtTinta2GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtTinta3GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDesctArtTinta4GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtTinta5GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDesctArtTinta6GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtTinta7GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoDescArtTinta8GetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoPorcentajeGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMPresupuestoARTICULO_BARNIZChange(Sender: TField);
     procedure QMPresupuestoARTICULO_MATERIALChange(Sender: TField);
     procedure QMPresupuestoARTICULO_ADHESIVOChange(Sender: TField);
     procedure QMPresupuestoARTICULO_CAJAChange(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA1Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA2Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA3Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA4Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA5Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA7Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA8Change(Sender: TField);
     procedure QMPresupuestoARTICULO_TINTA6Change(Sender: TField);
     procedure QMPresupuestoDescRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPresupuestoARTICULO_PORTESChange(Sender: TField);
     procedure QMPresupuestoRECURSOChange(Sender: TField);
     procedure QMPresupuestoDescArtPortesGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleRECURSOChange(Sender: TField);
     procedure QMDetalleTINTAChange(Sender: TField);
     procedure QMDetalleMAQUINAChange(Sender: TField);
     procedure QMPresupuestoBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     procedure MaestroDescripcion(Maestro: string; Codigo: string);
     function DamePCosteArticulo(Articulo: string): real;
  public
     { Public declarations }
     ID_Detalle: integer;
     procedure BusquedaCompleja;
     procedure CargaImagen;
     procedure ImprimeListado(numlistado: integer);
     function SeleccionarPresupuesto(ID: integer): boolean;
     procedure InsertarPresupuesto(ID: integer);
     procedure UpdatePresupuesto(ID: integer);
     procedure AbrirPresupuesto(ID: integer);
     procedure DameTituloRecurso(RECURSO: string);
     procedure CrearOfertaEscandallo;
     procedure BorrarOfertaEscandallo;
     procedure RellenaDatosDetalle;
  end;

var
  ZDMPresupuesto : TZDMPresupuesto;

implementation

{$R *.dfm}

uses UDMMain, uFBusca, UEntorno, UDameDato, jpeg, ZUFMPresupuesto, Dialogs, UFMain;

procedure TZDMPresupuesto.CargaImagen;
begin
  try
     if (ZFMPresupuesto.PCMain.ActivePage = ZFMPresupuesto.TSImagen) and (Trim(QMPresupuestoIMAGEN_ETIQUETA.AsString) <> '') then
        ZFMPresupuesto.IImagenes.Picture.LoadFromFile(QMPresupuestoIMAGEN_ETIQUETA.AsString)
     else
        ZFMPresupuesto.IImagenes.Picture := nil;
  except
     ZFMPresupuesto.IImagenes.Picture := nil;
     ShowMessage(_('No puede cargar la imagen.'));
  end;
end;

procedure TZDMPresupuesto.MaestroDescripcion(Maestro: string; Codigo: string);
begin
  with xMaestros do
  begin
     Close;
     Params.ByName['tipo_aux'].AsString := Maestro;
     Params.ByName['codigo'].AsString := Codigo;
     Open;
  end;
end;

procedure TZDMPresupuesto.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  //Mascaras
  QMPresupuestoCOMISION.DisplayFormat := MascaraP;
  QMPresupuestoANCHO.DisplayFormat := MascaraI;
  QMPresupuestoAVANCE.DisplayFormat := MascaraI;
  QMPresupuestoGASTOS_INICIALES.DisplayFormat := MascaraN;
  QMPresupuestoGASTOS_TROQUEL1.DisplayFormat := MascaraN;
  QMPresupuestoGASTOS_TROQUEL2.DisplayFormat := MascaraN;
  QMPresupuestoDIAMETRO_INT.DisplayFormat := MascaraN;
  QMPresupuestoDIAMETRO_EXT.DisplayFormat := MascaraN;
  QMPresupuestoETIQUETA_ROLLO.DisplayFormat := MascaraN;
  QMPresupuestoETIQUETA_ANCHO.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_CAJA.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_MATERIAL.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_BARNIZ.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_ADHESIVO.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA1.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA2.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA3.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA4.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA5.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA6.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA7.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_TINTA8.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_PORTES.DisplayFormat := MascaraN;
  QMPresupuestoP_COSTE_RECURSO.DisplayFormat := MascaraN;
  QMDetalleANCHO_TOTAL.DisplayFormat := MascaraN;
  QMDetalleML_TIRAJE.DisplayFormat := MascaraN;
  QMDetalleTOTAL_HORAS.DisplayFormat := MascaraN;
  QMDetallePRECIO_HORAS_IMPRESION.DisplayFormat := MascaraN;
  QMDetalleML_TOTAL.DisplayFormat := MascaraN;
  QMDetalleKGS_TINTA.DisplayFormat := MascaraI;
  QMDetalleKGS_BARNIZ.DisplayFormat := MascaraI;
  QMDetalleHORAS_IMPRESION.DisplayFormat := MascaraI;
  QMDetalleHORAS_CAMBIO_BOBINAS.DisplayFormat := MascaraI;

  DMMain.FiltraTabla(QMPresupuesto, '11100', True);
end;

procedure TZDMPresupuesto.graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  UpdatePresupuesto(ID_Detalle);
end;

procedure TZDMPresupuesto.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPresupuesto, '10000');
end;

procedure TZDMPresupuesto.QMPresupuestoNewRecord(DataSet: TDataSet);
begin
  QMPresupuestoEMPRESA.AsInteger := REntorno.Empresa;
  QMPresupuestoEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPresupuestoCANAL.AsInteger := REntorno.Canal;
  QMPresupuestoFECHA_EMISION.AsDateTime := REntorno.FechaTrabSH;

  QMPresupuestoTIPO_AUX_ADHESIVO.AsString := 'ADH';
  QMPresupuestoTIPO_AUX_MATERIAL.AsString := 'MAT';
  QMPresupuestoTIPO_AUX_TINTA.AsString := 'TIN';
  QMPresupuestoTIPO_AUX_PRESENTACION.AsString := 'PRE';
  QMPresupuestoTIPO_AUX_FORMA_ENVIO.AsString := 'ENV';
  QMPresupuestoTIPO_AUX_SITUACION_PRES.AsString := 'SPR';

  QMPresupuestoTIPO_COTIZACION.AsInteger := 0;
  QMPresupuestoESTAMPACION.AsInteger := 0;
  QMPresupuestoRELIEVE.AsInteger := 0;
  QMPresupuestoREIMPRESION.AsInteger := 0;
  QMPresupuestoBARNIZ.AsInteger := 0;
end;

procedure TZDMPresupuesto.QMPresupuestoBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMPresupuestoN_PRESUPUETO.AsInteger = 0)) then
     QMPresupuestoN_PRESUPUETO.AsInteger := DMMain.Contador_E('ZPR');
end;

procedure TZDMPresupuesto.QMPresupuestoAfterOpen(DataSet: TDataSet);
begin
  xClientes.Open;
  xClientesFormaPago.Open;
  xAgentes.Open;
  xContacto.Open;
  xArticulos.Open;
  xRecursos.Open;
  QMDetalle.Open;
end;

procedure TZDMPresupuesto.QMPresupuestoCLIENTEChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
  begin
     xClientes.Close;
     xClientes.Open;
     xClientesFormaPago.Close;
     xClientesFormaPago.Open;
     QMPresupuestoTERCERO.AsInteger := xClientesNUM_TERCERO.AsInteger;
     QMPresupuestoTITULO_CLIENTE.AsString := xClientesNOMBRE_SOCIAL.AsString;
     QMPresupuestoEMAIL_CLIENTE.AsString := xClientesE_MAIL.AsString;
     QMPresupuestoWEB_CLIENTE.AsString := xClientesWEB.AsString;
     QMPresupuestoTELEFONO_CLIENTE.AsString := xClientesTELEFONO01.AsString;
     QMPresupuestoFAX_CLIENTE.AsString := xClientesFAX.AsString;
     QMPresupuestoCIF_CLIENTE.AsString := xClientesNIF.AsString;
     QMPresupuestoDIRECCION_CLIENTE.AsString := xClientesDIRECCION.AsString;
     QMPresupuestoCP_CLIENTE.AsString := xClientesCODIGO_POSTAL.AsString;
     QMPresupuestoPOBLACION.AsString := xClientesPOBLACION.AsString;
     QMPresupuestoFORMA_PAGO.AsString := xClientesFormaPagoTITULO.AsString;
     QMPresupuestoENTIDAD.AsString := xClientesENTIDAD.AsString;
     QMPresupuestoSUCURSAL.AsString := xClientesSUCURSAL.AsString;
     QMPresupuestoDC.AsString := xClientesDC.AsString;
     QMPresupuestoCC.AsString := xClientesCC.AsString;
     QMPresupuestoCONTACTO.AsInteger := 1;
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoCODIGO_ADHESIVOChange(Sender: TField);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_ADHESIVO.AsString,
     QMPresupuestoCODIGO_ADHESIVO.AsString);
  QMPresupuestoDescAdhesivo.AsString := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoCODIGO_MATERIALChange(Sender: TField);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_MATERIAL.AsString,
     QMPresupuestoCODIGO_MATERIAL.AsString);
  QMPresupuestoDescMaterial.AsString := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoCODIGO_TINTAChange(Sender: TField);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_TINTA.AsString,
     QMPresupuestoCODIGO_TINTA.AsString);
  QMPresupuestoDescTinta.AsString := xMaestrosDESCRIPCION.AsString;
  QMPresupuestoNUM_TINTAS.AsInteger := xMaestrosCANTIDAD.AsInteger;
  QMPresupuestoPORCENTAJE.AsInteger := xMaestrosPORCENTAJE.AsInteger;
end;

procedure TZDMPresupuesto.QMPresupuestoCODIGO_PRESENTACIONChange(Sender: TField);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_PRESENTACION.AsString,
     QMPresupuestoCODIGO_PRESENTACION.AsString);
  QMPresupuestoDescPresentacion.AsString := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoCODIGO_FORMA_ENVIOChange(Sender: TField);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_FORMA_ENVIO.AsString,
     QMPresupuestoCODIGO_FORMA_ENVIO.AsString);
  QMPresupuestoDescFormaEnv.AsString := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoCODIGO_SITUACION_PRESChange(Sender: TField);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_SITUACION_PRES.AsString,
     QMPresupuestoCODIGO_SITUACION_PRES.AsString);
  QMPresupuestoDescSituacionPres.AsString := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoAGENTESChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
  begin
     xAgentes.Close;
     xAgentes.Open;
     if ((QMPresupuestoCOMISION.AsFloat = 0) and ((QMPresupuesto.State = dsInsert) or (QMPresupuesto.State = dsEdit))) then
        QMPresupuestoCOMISION.AsFloat := xAgentesCOMISION.AsFloat;
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoDescAdhesivoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_ADHESIVO.AsString,
     QMPresupuestoCODIGO_ADHESIVO.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoDescMaterialGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_MATERIAL.AsString,
     QMPresupuestoCODIGO_MATERIAL.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoDescTintaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_TINTA.AsString,
     QMPresupuestoCODIGO_TINTA.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoDescPresentacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_PRESENTACION.AsString,
     QMPresupuestoCODIGO_PRESENTACION.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoDescFormaEnvGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_FORMA_ENVIO.AsString,
     QMPresupuestoCODIGO_FORMA_ENVIO.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoDescSituacionPresGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_SITUACION_PRES.AsString,
     QMPresupuestoCODIGO_SITUACION_PRES.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoBeforeScroll(DataSet: TDataSet);
begin
  CargaImagen;
end;

procedure TZDMPresupuesto.ImprimeListado(numlistado: integer);
var
  str : string;
begin
  with xLstPresupuestos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['N_PRESUPUESTO'].AsInteger := QMPresupuestoN_PRESUPUETO.AsInteger;
     Open;
  end;

  {  with xClientes do
    begin
      Close;
      Open;
    end;       }

  with xAgentes do
  begin
     Close;
     Open;
  end;

  {  with xContacto do
    begin
      Close;
      Open;
    end;}

  with frPresupuesto do
  begin
     str := '';
     LoadFromFIB(numlistado, str);
     PrepareReport;
     ShowReport;
  end;
end;

procedure TZDMPresupuesto.frPresupuestoGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'DescAdhesivo' then
  begin
     MaestroDescripcion(QMPresupuestoTIPO_AUX_ADHESIVO.AsString,
        QMPresupuestoCODIGO_ADHESIVO.AsString);
     ParValue := xMaestrosDESCRIPCION.AsString;
  end;

  if ParName = 'DescMaterial' then
  begin
     MaestroDescripcion(QMPresupuestoTIPO_AUX_MATERIAL.AsString,
        QMPresupuestoCODIGO_MATERIAL.AsString);
     ParValue := xMaestrosDESCRIPCION.AsString;
  end;

  if ParName = 'DescTinta' then
  begin
     MaestroDescripcion(QMPresupuestoTIPO_AUX_TINTA.AsString,
        QMPresupuestoCODIGO_TINTA.AsString);
     ParValue := xMaestrosDESCRIPCION.AsString;
  end;

  if ParName = 'DescPresentacion' then
  begin
     MaestroDescripcion(QMPresupuestoTIPO_AUX_PRESENTACION.AsString,
        QMPresupuestoCODIGO_PRESENTACION.AsString);
     ParValue := xMaestrosDESCRIPCION.AsString;
  end;

  if ParName = 'DescFormaEnv' then
  begin
     MaestroDescripcion(QMPresupuestoTIPO_AUX_FORMA_ENVIO.AsString,
        QMPresupuestoCODIGO_FORMA_ENVIO.AsString);
     ParValue := xMaestrosDESCRIPCION.AsString;
  end;

  if ParName = 'DescSituacionPres' then
  begin
     MaestroDescripcion(QMPresupuestoTIPO_AUX_SITUACION_PRES.AsString,
        QMPresupuestoCODIGO_SITUACION_PRES.AsString);
     ParValue := xMaestrosDESCRIPCION.AsString;
  end;

  if ParName = 'cotizacion' then
  begin
     if (QMPresupuestoTIPO_COTIZACION.AsInteger = 0) then
        ParValue := _('€/unidad')
     else if (QMPresupuestoTIPO_COTIZACION.AsInteger = 1) then
        ParValue := _('€/millar')
     else if (QMPresupuestoTIPO_COTIZACION.AsInteger = 2) then
        ParValue := _('€/total pedido');
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoCONTACTOChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
  begin
     xContacto.Close;
     xContacto.Open;

     QMPresupuestoNOMBRE_CONTACTO.AsString := xContactoNOMBRE.AsString;
     QMPresupuestoAPELLIDOS_CONTACTO.AsString := xContactoAPELLIDOS.AsString;
  end;
end;

procedure TZDMPresupuesto.frPresupuestoEnterRect(Memo: TStringList; View: TfrView);
var
  imgEtiq : TImage;
begin
  if (memo.Count > 0) then
  begin
     if (Memo[0] = '[ImgEtiqueta]') then
     begin
        imgEtiq := TImage.Create(Self);
        if (Trim(QMPresupuestoIMAGEN_ETIQUETA.AsString) > '') then
           imgEtiq.Picture.LoadFromFile(ExtractShortPathName(QMPresupuestoIMAGEN_ETIQUETA.AsString))
        else
           imgEtiq := nil;
        TfrPictureView(View).Picture.Assign(imgEtiq.Picture);
        imgEtiq.Free;
     end;
  end;
end;

function TZDMPresupuesto.SeleccionarPresupuesto(ID: integer): boolean;
var
  num : integer;
begin
  with QGen do
  begin
     SQL.Text := 'SELECT N_PRESUPUETO FROM Z_EMP_PRESUPUESTO ' +
        'where (empresa=?empresa) and (id_detalles_ofertas_v=?id_detalles_ofertas_v)';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['id_detalles_ofertas_v'].AsInteger := ID;
     ExecQuery;
     num := FieldByName['N_PRESUPUETO'].AsInteger;
     FreeHandle;
  end;

  if (num <> 0) then
     Result := True
  else
     Result := False;
end;

procedure TZDMPresupuesto.InsertarPresupuesto(ID: integer);
var
  NewSQL : TStringList;
begin
  NewSQL := TStringList.Create;
  try
     NewSQL.Text := 'SELECT * FROM Z_EMP_PRESUPUESTO ' +
        'where (empresa=?empresa)';
     QMPresupuesto.Close;
     QMPresupuesto.SelectSQL.Clear;
     QMPresupuesto.SelectSQL.Add(NewSQL.Text);
  finally
     NewSQL.Free;
  end;
  DMMain.FiltraTabla(QMPresupuesto, '10000', True);
  ID_Detalle := ID;
  QMPresupuesto.Insert;
end;

procedure TZDMPresupuesto.UpdatePresupuesto(ID: integer);
var
  maximo : integer;
begin
  with QGen do
  begin
     SQL.Text := 'SELECT MAX(N_PRESUPUETO) AS MAXIMO FROM Z_EMP_PRESUPUESTO ' +
        'where (empresa=?empresa)';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     ExecQuery;
     maximo := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;

  ZxUpdatePresupuesto.Close;
  ZxUpdatePresupuesto.Params.ByName['id_detalles_ofertas_v'].AsInteger := ID;
  ZxUpdatePresupuesto.Params.ByName['n_presupueto'].AsInteger := maximo;
  ZxUpdatePresupuesto.Prepare;
  ZxUpdatePresupuesto.ExecQuery;
  ZxUpdatePresupuesto.FreeHandle;
end;

procedure TZDMPresupuesto.AbrirPresupuesto(ID: integer);
begin
  with QGen do
  begin
     SQL.Text := 'SELECT * FROM Z_EMP_PRESUPUESTO ' +
        'where (empresa=?empresa) and (id_detalles_ofertas_v=?id)';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['id'].AsInteger := ID;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtMatGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_MATERIAL.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtAdhGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_ADHESIVO.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtBarnizGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_BARNIZ.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescartCajaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_CAJA.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtTinta1GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA1.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtTinta2GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA2.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtTinta3GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA3.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDesctArtTinta4GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA4.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtTinta5GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA5.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDesctArtTinta6GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA6.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtTinta7GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA7.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtTinta8GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_TINTA8.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoPorcentajeGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMPresupuestoTIPO_AUX_TINTA.AsString,
     QMPresupuestoCODIGO_TINTA.AsString);
  Text := IntToStr(xMaestrosPORCENTAJE.AsInteger);
end;

procedure TZDMPresupuesto.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TZDMPresupuesto.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMPresupuesto.State = dsInsert) or (QMPresupuesto.State = dsEdit)) then
  begin
     QMDetalle.Post;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMPresupuestoEMPRESA.AsInteger;
  QMDetalleN_PRESUPUESTO.AsInteger := QMPresupuestoN_PRESUPUETO.AsInteger;

  // Obtenemos el numero de linea más alto del detalle
  with SPLineaSegDet do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['n_presupuesto'].AsInteger := QMPresupuestoN_PRESUPUETO.AsInteger;
     ExecQuery;
     QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
     QMDetalleN_PRESUPUESTO.AsInteger := QMPresupuestoN_PRESUPUETO.AsInteger;
     QMDetalleLINEA.AsInteger := SPLineaSegDet.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TZDMPresupuesto.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  //??? QMPresupuesto.Open;
end;

function TZDMPresupuesto.DamePCosteArticulo(Articulo: string): real;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT P_COSTE FROM ART_ARTICULOS WHERE EMPRESA = ' +
           REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + '''';
        ExecQuery;
        Result := FieldByName['P_COSTE'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_BARNIZChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_BARNIZ.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_BARNIZ.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_MATERIALChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_MATERIAL.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_MATERIAL.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_ADHESIVOChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_ADHESIVO.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_ADHESIVO.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_CAJAChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_CAJA.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_CAJA.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA1Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA1.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA1.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA2Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA2.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA2.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA3Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA3.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA3.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA4Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA4.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA4.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA5Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA5.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA5.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA6Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA6.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA6.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA7Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA7.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA7.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_TINTA8Change(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_TINTA8.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_TINTA8.AsString);
end;

procedure TZDMPresupuesto.QMPresupuestoDescRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xRecursosTITULO.AsString;
end;

procedure TZDMPresupuesto.QMPresupuestoARTICULO_PORTESChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
     QMPresupuestoP_COSTE_PORTES.AsFloat := DamePCosteArticulo(QMPresupuestoARTICULO_PORTES.AsString);
end;

procedure TZDMPresupuesto.DameTituloRecurso(Recurso: string);
begin
  with xRecursos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['RECURSO'].AsString := RECURSO;
     Open;
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoRECURSOChange(Sender: TField);
begin
  if (QMPresupuesto.State in [dsInsert, dsEdit]) then
  begin
     with Precio_Recurso do
     begin
        Params.ByName['Empresa'].AsInteger := QMPresupuestoEMPRESA.AsInteger;
        Params.ByName['Recurso'].AsString := QMPresupuestoRECURSO.AsString;
        Params.ByName['Fecha'].AsDateTime := QMPresupuestoFECHA_EMISION.AsDateTime;
        ExecQuery;
     end;
     QMPresupuestoP_COSTE_RECURSO.AsFloat := Precio_Recurso.FieldByName['Precio_Est'].AsFloat;
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoDescArtPortesGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMPresupuestoARTICULO_PORTES.AsString);
end;

procedure TZDMPresupuesto.CrearOfertaEscandallo;
begin
  with SPCrearOfertaEscandallo do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['articulo_material'].AsString := QMPresupuestoARTICULO_MATERIAL.AsString;
     Params.ByName['articulo_barniz'].AsString := QMPresupuestoARTICULO_BARNIZ.AsString;
     Params.ByName['articulo_caja'].AsString := QMPresupuestoARTICULO_CAJA.AsString;
     Params.ByName['articulo_adhesivo'].AsString := QMPresupuestoARTICULO_ADHESIVO.AsString;
     Params.ByName['articulo_tinta1'].AsString := QMPresupuestoARTICULO_TINTA1.AsString;
     Params.ByName['articulo_tinta2'].AsString := QMPresupuestoARTICULO_TINTA2.AsString;
     Params.ByName['articulo_tinta3'].AsString := QMPresupuestoARTICULO_TINTA3.AsString;
     Params.ByName['articulo_tinta4'].AsString := QMPresupuestoARTICULO_TINTA4.AsString;
     Params.ByName['articulo_tinta5'].AsString := QMPresupuestoARTICULO_TINTA5.AsString;
     Params.ByName['articulo_tinta6'].AsString := QMPresupuestoARTICULO_TINTA6.AsString;
     Params.ByName['articulo_tinta7'].AsString := QMPresupuestoARTICULO_TINTA7.AsString;
     Params.ByName['articulo_tinta8'].AsString := QMPresupuestoARTICULO_TINTA8.AsString;
     Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     Params.ByName['cliente'].AsInteger := QMPresupuestoCLIENTE.AsInteger;
     Params.ByName['n_presupuesto'].AsInteger := QMPresupuestoN_PRESUPUETO.AsInteger;
     Params.ByName['articulo_portes'].AsString := QMPresupuestoARTICULO_PORTES.AsString;
     Params.ByName['articulo_recurso'].AsString := QMPresupuestoRECURSO.AsString;

     ExecQuery;
  end;
  QMDetalleID_ESC.AsInteger := SPCrearOfertaEscandallo.FieldByName['ID_ESC'].AsInteger;

  ShowMessage(_('Creacion de oferta escandallo realizada'));

  FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' + IntToStr(SPCrearOfertaEscandallo.FieldByName['ID_ESC'].AsInteger));
end;

procedure TZDMPresupuesto.BorrarOfertaEscandallo;
begin
  with SPBorrarOfertaEscandallo do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['n_presupuesto'].AsInteger := QMPresupuestoN_PRESUPUETO.AsInteger;
     ExecQuery;
  end;
  QMDetalleID_ESC.AsInteger := 0;

  // Button1.Enabled:=False;
  ShowMessage(_('Eliminación de oferta escandallo realizada'));
  QMDetalle.Open;
end;

procedure TZDMPresupuesto.QMDetalleRECURSOChange(Sender: TField);
begin
  if (QMDetalle.State in [dsInsert, dsEdit]) then
  begin
     with Precio_Recurso do
     begin
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Recurso'].AsString := QMDetalleRECURSO.AsString;
        Params.ByName['Fecha'].AsDateTime := QMPresupuestoFECHA_EMISION.AsDateTime;
        ExecQuery;
     end;
     QMDetalleIMPORTE_RECURSO.AsFloat := Precio_Recurso.FieldByName['Precio_Est'].AsFloat;
  end;
end;

procedure TZDMPresupuesto.QMDetalleTINTAChange(Sender: TField);
begin
  if (QMDetalle.State in [dsInsert, dsEdit]) then
  begin
     with Tinta do
     begin
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['codmaq'].AsString := QMDetalleMAQUINA.AsString;
        Params.ByName['tinta'].AsInteger := QMDetalleTINTA.AsInteger;
        ExecQuery;
     end;
     QMDetalleML_PREPARACION.AsFloat := Tinta.FieldByName['CAMBIO_COLOR'].AsFloat;
     QMDetalleML_CAMBIO_COLOR.AsFloat := Tinta.FieldByName['CAMBIO_COLOR'].AsFloat;
     QMDetalleGRAMOS_TINTA.AsFloat := Tinta.FieldByName['GRAMOS_TINTA'].AsFloat;
     QMDetalleGRAMOS_BARNIZ.AsFloat := Tinta.FieldByName['GRAMOS_BARNIZ'].AsFloat;
     QMDetalleTIEMPO_PREPARACION.AsFloat := Tinta.FieldByName['HORAS_PREPARACION'].AsFloat;
  end;
end;

procedure TZDMPresupuesto.RellenaDatosDetalle;
begin
  with Constantes do
  begin
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ExecQuery;
  end;
  QMDetalleLONGITUD_BOBINA.AsFloat := Constantes.FieldByName['LONGITUD_BOBINA'].AsFloat;
  QMDetalleML_CAMBIO_BOBINA_CTE.AsFloat := Constantes.FieldByName['ML_CAMBIO_BOBINA'].AsFloat;
  QMDetalleVALOR_HORAS_CAMBIO.AsFloat := Constantes.FieldByName['HORAS_CAMBIO_BOBINA'].AsFloat;
end;

procedure TZDMPresupuesto.QMDetalleMAQUINAChange(Sender: TField);
begin
  if (QMDetalle.State in [dsInsert, dsEdit]) then
  begin
     with Maquina do
     begin
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['codmaq'].AsString := QMDetalleMAQUINA.AsString;
        ExecQuery;
     end;

     QMDetalleVALOR_ML_CAMBIO_PLANCHA.AsFloat := Maquina.FieldByName['ML_CAMBIO_PLANCHA'].AsFloat;

     with ProMaquina do
     begin
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['codmaq'].AsString := QMDetalleMAQUINA.AsString;
        ExecQuery;
     end;

     QMDetalleRECURSO.AsString := ProMaquina.FieldByName['RECURSO'].AsString;
  end;
end;

procedure TZDMPresupuesto.QMPresupuestoBeforeClose(DataSet: TDataSet);
begin
  xClientes.Close;
  xClientesFormaPago.Close;
  xAgentes.Close;
  xContacto.Close;
  xArticulos.Close;
  xRecursos.Close;
  QMDetalle.Close;
end;

end.
