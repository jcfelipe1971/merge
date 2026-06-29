unit UDMGestionTareasProduccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMGestionTareasProduccion = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMTarea: TDataSource;
     QMTarea: TFIBTableSet;
     QMTareaEMPRESA: TIntegerField;
     QMTareaEJERCICIO: TIntegerField;
     QMTareaCANAL: TIntegerField;
     QMTareaSERIE: TFIBStringField;
     QMTareaRIG_OF: TIntegerField;
     QMTareaSUBORDEN: TIntegerField;
     QMTareaLINEA_FASE: TIntegerField;
     QMTareaLINEA_TAREA: TIntegerField;
     QMTareaTAREA: TFIBStringField;
     QMTareaORDEN: TIntegerField;
     QMTareaTIPOTAREA: TFIBStringField;
     QMTareaCOMENTARIO: TMemoField;
     QMTareaRECURSO: TFIBStringField;
     QMTareaCANTIDAD: TFloatField;
     QMTareaARTICULO: TFIBStringField;
     QMTareaPRE_COS_UNI_PRE: TFloatField;
     QMTareaTOTAL_VAR_PRE: TFloatField;
     QMTareaPRECIO_FIJO_PRE: TFloatField;
     QMTareaTOTAL_PRE: TFloatField;
     QMTareaPRE_COS_UNI_REAL: TFloatField;
     QMTareaTOTAL_VAR_REAL: TFloatField;
     QMTareaPRECIO_FIJO_REAL: TFloatField;
     QMTareaTOTAL_REAL: TFloatField;
     QMTareaESTADO: TIntegerField;
     QMTareaFECHA_FIN_TAREA: TDateTimeField;
     QMTareaIDENTIFICADOR: TIntegerField;
     QMTareaENTRADA: TIntegerField;
     QMTareaID_ORDEN: TIntegerField;
     QMTareaCANTIDAD_UTIL: TFloatField;
     QMTareaID_UTILLAJE: TFIBStringField;
     QMTareaDESC_UTILLAJE: TFIBStringField;
     QMTareaTIEMPO: TFloatField;
     QMTareaTIEMPO_UTIL: TFloatField;
     QMTareaUDS_FABRICADAS: TFloatField;
     QMTareaCANTIDAD_IMPUTADA: TFloatField;
     QMTareaOPERACIONES_NUM: TIntegerField;
     QMTareaOPERACIONES_TIEMPO: TIntegerField;
     QMTareaTOTAL_IMP: TFloatField;
     QMTareaPRECIO_IMP: TFloatField;
     QMTareaTOTAL: TFloatField;
     QMTareaTOTAL_HORAS: TFloatField;
     QMTareaMAQUINA: TIntegerField;
     QMTareaTIEMPO_PRODUCCION: TFIBStringField;
     QMTareaFORMULA: TIntegerField;
     QMTareaRESULTADO_FORMULA: TFloatField;
     QMTareaFECHA_INICIO_TAREA: TDateTimeField;
     DSQMOrden: TDataSource;
     QMOrden: TFIBTableSet;
     QMOrdenEMPRESA: TIntegerField;
     QMOrdenEJERCICIO: TIntegerField;
     QMOrdenCANAL: TIntegerField;
     QMOrdenSERIES: TFIBStringField;
     QMOrdenRIG_OF: TIntegerField;
     QMOrdenSUBORDEN: TIntegerField;
     QMOrdenALMACEN_SAL: TFIBStringField;
     QMOrdenALMACEN_LAN: TFIBStringField;
     QMOrdenALMACEN_ENT: TFIBStringField;
     QMOrdenFECHA_ORD: TDateTimeField;
     QMOrdenCLIENTE: TIntegerField;
     QMOrdenCOMPUESTO: TFIBStringField;
     QMOrdenESCANDALLO: TIntegerField;
     QMOrdenESTADO: TIntegerField;
     QMOrdenPEDIDO: TIntegerField;
     QMOrdenLINEA_PED: TIntegerField;
     QMOrdenFECHA_PED: TDateTimeField;
     QMOrdenUNI_PEDID: TFloatField;
     QMOrdenUNI_MANUAL: TFloatField;
     QMOrdenUNI_TOTAL: TFloatField;
     QMOrdenPRIORIDAD: TIntegerField;
     QMOrdenMERMA: TFloatField;
     QMOrdenUNI_PRODUC: TFloatField;
     QMOrdenUNI_PENDIENTES: TFloatField;
     QMOrdenFECHA_ENTREGA: TDateTimeField;
     QMOrdenFECHA_INI: TDateTimeField;
     QMOrdenFECHA_FIN: TDateTimeField;
     QMOrdenCOSTE_FIJO_PRE: TFloatField;
     QMOrdenCOSTE_VAR_PRE: TFloatField;
     QMOrdenCOSTE_MAT_PRE: TFloatField;
     QMOrdenCOSTE_MO_PRE: TFloatField;
     QMOrdenCOSTE_MAQ_PRE: TFloatField;
     QMOrdenCOSTE_TEX_PRE: TFloatField;
     QMOrdenCOSTE_TOT_PRE: TFloatField;
     QMOrdenCOSTE_FIJO_REAL: TFloatField;
     QMOrdenCOSTE_VAR_REAL: TFloatField;
     QMOrdenCOSTE_MAT_REAL: TFloatField;
     QMOrdenCOSTE_MO_REAL: TFloatField;
     QMOrdenCOSTE_MAQ_REAL: TFloatField;
     QMOrdenCOSTE_TEX_REAL: TFloatField;
     QMOrdenCOSTE_TOT_REAL: TFloatField;
     QMOrdenCOSTE_UNITARIO: TFloatField;
     QMOrdenPRECIO_VENTA: TFloatField;
     QMOrdenHORAS_TOTALES: TFloatField;
     QMOrdenMARGEN_UNI: TFloatField;
     QMOrdenMARGEN_TOTAL: TFloatField;
     QMOrdenOBSERVACIONES: TMemoField;
     QMOrdenVISTOBUENO1: TIntegerField;
     QMOrdenVISTOBUENO2: TIntegerField;
     QMOrdenVISTOBUENO3: TIntegerField;
     QMOrdenSITUACION: TIntegerField;
     QMOrdenMARGEN_UNI_CIEN: TFloatField;
     QMOrdenENTRADA: TIntegerField;
     QMOrdenID_ORDEN: TIntegerField;
     QMOrdenTIPO_LANZAMIENTO: TIntegerField;
     QMOrdenID_ORDEN_MAT: TIntegerField;
     QMOrdenTIPO_RESERVA: TIntegerField;
     QMOrdenID_MOV_STOCK: TIntegerField;
     QMOrdenISO_APROBADO: TIntegerField;
     QMOrdenISO_VERIFICADO: TIntegerField;
     QMOrdenISO_VALIDADO: TIntegerField;
     QMOrdenID_A: TIntegerField;
     QMOrdenPADRE_SUBORDEN: TIntegerField;
     QMOrdenCONT_SUBORDEN: TIntegerField;
     QMOrdenREFERENCIA: TFIBStringField;
     QMOrdenCOSTE_COMPRAS: TFloatField;
     QMOrdenHORAS_OPERARIO: TFloatField;
     QMOrdenHORAS_MAQUINA: TFloatField;
     QMOrdenID_DESPIECE: TIntegerField;
     QMOrdenID_ORDEN_SUBORDEN: TIntegerField;
     QMOrdenSELECCIONADA: TIntegerField;
     QMOrdenPREVALECE_ALM_ORDEN: TIntegerField;
     QMOrdenCERRAR_SUBORDENES: TIntegerField;
     QMOrdenIMPORTAR_OP: TIntegerField;
     QMOrdenCASO_OP: TIntegerField;
     QMOrdenRESERVA_STOCK_OP: TIntegerField;
     QMOrdenMEDIDA_1: TFloatField;
     QMOrdenMEDIDA_2: TFloatField;
     QMOrdenMEDIDA_3: TFloatField;
     QMOrdenMEDIDA_4: TFloatField;
     QMOrdenDESACTIVA_TRIGGER: TIntegerField;
     QMOrdenRESPONSABLE: TIntegerField;
     QMOrdenDIF_COSTE_FIJO: TFloatField;
     QMOrdenDIF_COSTE_MAT: TFloatField;
     QMOrdenDIF_COSTE_MO: TFloatField;
     QMOrdenDIF_COSTE_MAQ: TFloatField;
     QMOrdenDIF_COSTE_TEXT: TFloatField;
     QMOrdenDIF_COSTE_VAR: TFloatField;
     QMOrdenCOSTE_COMPRAS_PRE: TFloatField;
     QMOrdenDIF_COSTE_COMPRAS: TFloatField;
     QMOrdenDIF_COSTE_TOTAL: TFloatField;
     QMOrdenCOMPUESTOS_VIRTUALES: TIntegerField;
     QMOrdenSEGUIR_SIN_STOCK: TIntegerField;
     QMOrdenMARGEN_TOTAL_PRE: TFloatField;
     QMOrdenMARGEN_UNI_CIEN_PRE: TFloatField;
     QMOrdenCOSTE_UNITARIO_PRE: TFloatField;
     QMOrdenMARGEN_UNI_PRE: TFloatField;
     QMOrdenPRECIO_VENTA_PRE: TFloatField;
     QMOrdenPRECIO_VENTA_TOT_PRE: TFloatField;
     QMOrdenPRECIO_VENTA_TOT_REAL: TFloatField;
     QMOrdenDIF_COSTE_MARGEN_TOTAL: TFloatField;
     QMOrdenDIF_MARGEN_TOTAL: TFloatField;
     QMOrdenDIF_MARGEN_UNI_CIEN: TFloatField;
     QMOrdenDIF_PRECIO_VENTA_UNI: TFloatField;
     QMOrdenDIF_COSTE_UNI: TFloatField;
     QMOrdenDIF_MARGEN_UNI: TFloatField;
     QMOrdenDIF_PRECIO_VENTA_TOT: TFloatField;
     QMOrdenHORAS_OPERARIO_PRE: TFloatField;
     QMOrdenHORAS_MAQUINA_PRE: TFloatField;
     QMOrdenDIF_HORAS_MAQUINA: TFloatField;
     QMOrdenDIF_HORAS_OPERARIO: TFloatField;
     QMOrdenRECUPERADO_MARCAJE: TIntegerField;
     QMOrdenUNI_FABRICADAS: TFloatField;
     QMOrdenPLANIFICACION: TIntegerField;
     QMOrdenLINEA_PLANIFICACION: TIntegerField;
     QMOrdenID_PLANIFICACION: TIntegerField;
     QMOrdenID_PLANIFICACION_DET: TIntegerField;
     QMOrdenID_UBICACION: TIntegerField;
     QMOrdenID_MOV_STOCK_RESERVA: TIntegerField;
     QMOrdenUNIDAD: TFIBStringField;
     QMOrdenCOSTE_MERMA_PRE: TFloatField;
     QMOrdenCOSTE_MERMA_REAL: TFloatField;
     QMOrdenDIF_COSTE_MERMA: TFloatField;
     QMOrdenCOPIAS_PMP: TIntegerField;
     QMOrdenVERSION_ORDEN: TFIBStringField;
     DSQMFase: TDataSource;
     QMFase: TFIBTableSet;
     DSQMMaterial: TDataSource;
     QMMaterial: TFIBTableSet;
     QMMaterialEMPRESA: TIntegerField;
     QMMaterialEJERCICIO: TIntegerField;
     QMMaterialCANAL: TIntegerField;
     QMMaterialSERIES: TFIBStringField;
     QMMaterialRIG_OF: TIntegerField;
     QMMaterialSUBORDEN: TIntegerField;
     QMMaterialLINEA_MAT: TIntegerField;
     QMMaterialALMACEN: TFIBStringField;
     QMMaterialLOTE: TFIBStringField;
     QMMaterialCOMPONENTE: TFIBStringField;
     QMMaterialORDEN: TIntegerField;
     QMMaterialUNIDADES_NEC: TFloatField;
     QMMaterialUNIDADES_UTIL: TFloatField;
     QMMaterialPORCENTAJE: TFloatField;
     QMMaterialLINEA_FASE: TIntegerField;
     QMMaterialPRE_COS_UNI: TFloatField;
     QMMaterialTOTAL_VAR: TFloatField;
     QMMaterialPRECIO_FIJO: TFloatField;
     QMMaterialTOTAL: TFloatField;
     QMMaterialPRODUCCION: TIntegerField;
     QMMaterialMATESC: TIntegerField;
     QMMaterialENTRADA: TIntegerField;
     QMMaterialID_ORDEN: TIntegerField;
     QMMaterialID_ORDEN_MAT: TIntegerField;
     QMMaterialUNIDADES_FAB: TFloatField;
     QMMaterialUNIDADES_STOCK: TFloatField;
     QMMaterialPRE_COS_UNI_REAL: TFloatField;
     QMMaterialID_MOV_STOCK: TIntegerField;
     QMMaterialUNIDADES_PREV: TFloatField;
     QMMaterialPRECIO_FIJO_REAL: TFloatField;
     QMMaterialTOTAL_VAR_REAL: TFloatField;
     QMMaterialTOTAL_REAL: TFloatField;
     QMMaterialNOTAS_MAT: TMemoField;
     QMMaterialMEDIDAS: TFIBStringField;
     QMMaterialTIPO_PIEZA: TFIBStringField;
     QMMaterialNUM_PIEZAS: TFIBStringField;
     QMMaterialID_MOV_STOCK_B: TIntegerField;
     QMMaterialID_MOV_STOCK_C: TIntegerField;
     QMMaterialUNIDAD_ART: TFIBStringField;
     QMMaterialUNIDAD_FAB: TFIBStringField;
     QMMaterialID_EQUIVAL: TIntegerField;
     QMMaterialCOMPRAR: TIntegerField;
     QMMaterialPROVEEDOR_COMPRA: TIntegerField;
     QMMaterialMOV_STOCK_COMPRA: TIntegerField;
     QMMaterialID_A: TIntegerField;
     QMMaterialUDS_COMPRA: TFloatField;
     QMMaterialRESERVA_STOCK: TIntegerField;
     QMMaterialN_MOV_STOCK: TIntegerField;
     QMMaterialMINI_NOTA: TFIBStringField;
     QMMaterialRESULTADO_FORMULA: TFloatField;
     QMMaterialFORMULA: TIntegerField;
     QMMaterialDESACTIVA_TRIGGER: TIntegerField;
     QMMaterialDES_ALTO: TFloatField;
     QMMaterialDES_ANCHO: TFloatField;
     QMMaterialDES_GRUESO: TFloatField;
     QMMaterialESTADO: TIntegerField;
     QMMaterialLINEA_TAREA: TIntegerField;
     QMMaterialID_DETALLES_ST: TIntegerField;
     QMMaterialID_LOTE: TIntegerField;
     QMMaterialID_UBICACION: TIntegerField;
     QMMaterialMERMA: TFloatField;
     QMMaterialUNIDADES_DEVOLVER: TFloatField;
     QMMaterialALMACEN_DEVOLVER: TFIBStringField;
     QMMaterialN_MOV_STOCK_RESERVA: TIntegerField;
     QMFaseEMPRESA: TIntegerField;
     QMFaseEJERCICIO: TIntegerField;
     QMFaseCANAL: TIntegerField;
     QMFaseSERIES: TFIBStringField;
     QMFaseRIG_OF: TIntegerField;
     QMFaseSUBORDEN: TIntegerField;
     QMFaseLINEA_FASE: TIntegerField;
     QMFaseFASE: TFIBStringField;
     QMFaseORDEN: TIntegerField;
     QMFaseTIPOFASE: TFIBStringField;
     QMFaseNOTAS: TMemoField;
     QMFaseDIBUJO: TFIBStringField;
     QMFaseESTADO: TIntegerField;
     QMFaseVALORCALIDAD: TIntegerField;
     QMFaseFECHA_FIN_FASE: TDateTimeField;
     QMFaseENTRADA: TIntegerField;
     QMFaseID_ORDEN: TIntegerField;
     QMFaseID_IMAGEN: TIntegerField;
     QMFaseREBAJE: TIntegerField;
     QMFaseCANTIDAD_ENTRADA: TFloatField;
     QMFaseCANTIDAD_TERMINADA: TFloatField;
     QMFaseMEDIDA_1: TFloatField;
     QMFaseMEDIDA_2: TFloatField;
     QMFaseMEDIDA_3: TFloatField;
     QMFaseMEDIDA_4: TFloatField;
     QMFaseMERMA_FASE_PREV: TFloatField;
     QMFasePIEZAS_HORA_PREV: TFloatField;
     QMFaseFECHA_INICIO_FASE: TDateTimeField;
     DSQMMarcajes: TDataSource;
     QMMarcajes: TFIBTableSet;
     QMMarcajesID: TIntegerField;
     QMMarcajesCADENA: TFIBStringField;
     QMMarcajesPROCESADO: TIntegerField;
     QMMarcajesFECHA_LECTURA: TDateTimeField;
     QMMarcajesFECHA_PROCESADO: TDateTimeField;
     QMMarcajesID_GRUPO: TIntegerField;
     QMMarcajesEMPRESA: TIntegerField;
     QMMarcajesEJERCICIO: TIntegerField;
     QMMarcajesCANAL: TIntegerField;
     QMMarcajesSERIE: TFIBStringField;
     QMMarcajesBORRAR_DETALLE: TIntegerField;
     QMMarcajesHORA_PROCESADO: TFloatField;
     QMMarcajesID_TAREA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTareaAfterOpen(DataSet: TDataSet);
     procedure QMTareaBeforeClose(DataSet: TDataSet);
     procedure QMFaseAfterOpen(DataSet: TDataSet);
     procedure QMFaseBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMGestionTareasProduccion : TDMGestionTareasProduccion;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMGestionTareasProduccion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTarea, '111000');
end;

procedure TDMGestionTareasProduccion.QMTareaAfterOpen(DataSet: TDataSet);
begin
  QMOrden.Open;
  QMFase.Open;
  QMMarcajes.Open;
end;

procedure TDMGestionTareasProduccion.QMTareaBeforeClose(DataSet: TDataSet);
begin
  QMOrden.Close;
  QMFase.Close;
  QMMarcajes.Close;
end;

procedure TDMGestionTareasProduccion.QMFaseAfterOpen(DataSet: TDataSet);
begin
  QMMaterial.Open;
end;

procedure TDMGestionTareasProduccion.QMFaseBeforeClose(DataSet: TDataSet);
begin
  QMMaterial.Close;
end;

end.
