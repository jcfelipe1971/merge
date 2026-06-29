{CORREGIR UPDATE BLOB QMProOrdTarea.COMENTARIO}
{CORREGIR UPDATE BLOB QMProOrdMat.NOTAS_MAT}

{                                                                     
  Se ha añadido el evento OnGetText en la UNIDADES, para que muestre
  los decimales de las unidades segun el tipo de unidad del artículo.
  En el caso especial del tipo Millar (Mi), se mostraran todos sus
  decimales aunque sean ceros.

  Codigo modificado marcado con SFG_JLA
}

unit UProDMOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, FIBInfoSet, Dialogs,
  jpeg, GIFImage, Graphics, ExtCtrls, Variants, Math, Controls,
  FIBDataSetRW, Forms;

type
  TProDMOrden = class(TDataModule)
     QMProOrd: TFIBTableSet;
     DSQMProOrd: TDataSource;
     TLocal: THYTransaction;
     QMProOrdEMPRESA: TIntegerField;
     QMProOrdEJERCICIO: TIntegerField;
     QMProOrdCANAL: TIntegerField;
     QMProOrdSERIES: TFIBStringField;
     QMProOrdRIG_OF: TIntegerField;
     QMProOrdSUBORDEN: TIntegerField;
     QMProOrdALMACEN_SAL: TFIBStringField;
     QMProOrdALMACEN_LAN: TFIBStringField;
     QMProOrdALMACEN_ENT: TFIBStringField;
     QMProOrdFECHA_ORD: TDateTimeField;
     QMProOrdCLIENTE: TIntegerField;
     QMProOrdCOMPUESTO: TFIBStringField;
     QMProOrdESCANDALLO: TIntegerField;
     QMProOrdESTADO: TIntegerField;
     QMProOrdPEDIDO: TIntegerField;
     QMProOrdLINEA_PED: TIntegerField;
     QMProOrdFECHA_PED: TDateTimeField;
     QMProOrdUNI_PEDID: TFloatField;
     QMProOrdUNI_MANUAL: TFloatField;
     QMProOrdUNI_TOTAL: TFloatField;
     QMProOrdPRIORIDAD: TIntegerField;
     QMProOrdMERMA: TFloatField;
     QMProOrdUNI_PRODUC: TFloatField;
     QMProOrdUNI_PENDIENTES: TFloatField;
     QMProOrdFECHA_ENTREGA: TDateTimeField;
     QMProOrdFECHA_INI: TDateTimeField;
     QMProOrdFECHA_FIN: TDateTimeField;
     QMProOrdCOSTE_FIJO_REAL: TFloatField;
     QMProOrdPRECIO_VENTA: TFloatField;
     QMProOrdOBSERVACIONES: TMemoField;
     QMProOrdVISTOBUENO1: TIntegerField;
     QMProOrdVISTOBUENO2: TIntegerField;
     QMProOrdVISTOBUENO3: TIntegerField;
     QMProOrdMat: TFIBTableSet;
     DSQMProOrdMat: TDataSource;
     QMProOrdMatEMPRESA: TIntegerField;
     QMProOrdMatEJERCICIO: TIntegerField;
     QMProOrdMatCANAL: TIntegerField;
     QMProOrdMatSERIES: TFIBStringField;
     QMProOrdMatRIG_OF: TIntegerField;
     QMProOrdMatSUBORDEN: TIntegerField;
     QMProOrdMatLINEA_MAT: TIntegerField;
     QMProOrdMatALMACEN: TFIBStringField;
     QMProOrdMatCOMPONENTE: TFIBStringField;
     QMProOrdMatORDEN: TIntegerField;
     QMProOrdMatUNIDADES_NEC: TFloatField;
     QMProOrdMatUNIDADES_UTIL: TFloatField;
     QMProOrdMatPORCENTAJE: TFloatField;
     QMProOrdMatLINEA_FASE: TIntegerField;
     QMProOrdMatPRE_COS_UNI: TFloatField;
     QMProOrdMatTOTAL_VAR: TFloatField;
     QMProOrdMatPRECIO_FIJO: TFloatField;
     QMProOrdMatTOTAL: TFloatField;
     QMProOrdFases: TFIBTableSet;
     DSQMProOrdFases: TDataSource;
     QMProOrdFasesEMPRESA: TIntegerField;
     QMProOrdFasesEJERCICIO: TIntegerField;
     QMProOrdFasesCANAL: TIntegerField;
     QMProOrdFasesSERIES: TFIBStringField;
     QMProOrdFasesRIG_OF: TIntegerField;
     QMProOrdFasesSUBORDEN: TIntegerField;
     QMProOrdFasesLINEA_FASE: TIntegerField;
     QMProOrdFasesORDEN: TIntegerField;
     QMProOrdFasesTIPOFASE: TFIBStringField;
     QMProOrdFasesNOTAS: TMemoField;
     QMProOrdFasesESTADO: TIntegerField;
     QMProOrdFasesVALORCALIDAD: TIntegerField;
     QMProOrdTarea: TFIBTableSet;
     DSQMProOrdTarea: TDataSource;
     QMProOrdTareaEJERCICIO: TIntegerField;
     QMProOrdTareaCANAL: TIntegerField;
     QMProOrdTareaSERIE: TFIBStringField;
     QMProOrdTareaRIG_OF: TIntegerField;
     QMProOrdTareaSUBORDEN: TIntegerField;
     QMProOrdTareaLINEA_FASE: TIntegerField;
     QMProOrdTareaLINEA_TAREA: TIntegerField;
     QMProOrdTareaTAREA: TFIBStringField;
     QMProOrdTareaORDEN: TIntegerField;
     QMProOrdTareaTIPOTAREA: TFIBStringField;
     QMProOrdTareaCOMENTARIO: TMemoField;
     QMProOrdTareaCANTIDAD: TFloatField;
     QMProOrdTareaPRE_COS_UNI_PRE: TFloatField;
     QMProOrdTareaTOTAL_VAR_PRE: TFloatField;
     QMProOrdTareaPRECIO_FIJO_PRE: TFloatField;
     QMProOrdTareaTOTAL_PRE: TFloatField;
     QMProOrdTareaPRE_COS_UNI_REAL: TFloatField;
     QMProOrdTareaTOTAL_VAR_REAL: TFloatField;
     QMProOrdTareaPRECIO_FIJO_REAL: TFloatField;
     QMProOrdTareaTOTAL_REAL: TFloatField;
     QMProOrdTareaESTADO: TIntegerField;
     QMProOrdTITULO_CLIENTE: TStringField;
     QMProOrdFasesFASE: TFIBStringField;
     QMProOrdTareaDescrRecurso: TStringField;
     QMProOrdMatDescrAlmacen: TStringField;
     QMProOrdMatPrecioMat: TFloatField;
     QMProOrdSITUACION: TIntegerField;
     QMProOrdFasesDIBUJO: TFIBStringField;
     QMProOrdMatPRODUCCION: TIntegerField;
     QMProOrdMatMATESC: TIntegerField;
     DSQSubOrdenes: TDataSource;
     QSubOrdenes: TFIBTableSet;
     QSubOrdenesEMPRESA: TIntegerField;
     QSubOrdenesEJERCICIO: TIntegerField;
     QSubOrdenesCANAL: TIntegerField;
     QSubOrdenesSERIES: TFIBStringField;
     QSubOrdenesRIG_OF: TIntegerField;
     QSubOrdenesSUBORDEN: TIntegerField;
     QSubOrdenesALMACEN_SAL: TFIBStringField;
     QSubOrdenesALMACEN_LAN: TFIBStringField;
     QSubOrdenesALMACEN_ENT: TFIBStringField;
     QSubOrdenesFECHA_ORD: TDateTimeField;
     QSubOrdenesCLIENTE: TIntegerField;
     QSubOrdenesCOMPUESTO: TFIBStringField;
     QSubOrdenesESCANDALLO: TIntegerField;
     QSubOrdenesESTADO: TIntegerField;
     QSubOrdenesPEDIDO: TIntegerField;
     QSubOrdenesLINEA_PED: TIntegerField;
     QSubOrdenesFECHA_PED: TDateTimeField;
     QSubOrdenesUNI_PEDID: TFloatField;
     QSubOrdenesUNI_MANUAL: TFloatField;
     QSubOrdenesUNI_TOTAL: TFloatField;
     QSubOrdenesPRIORIDAD: TIntegerField;
     QSubOrdenesMERMA: TFloatField;
     QSubOrdenesUNI_PRODUC: TFloatField;
     QSubOrdenesUNI_PENDIENTES: TFloatField;
     QSubOrdenesFECHA_ENTREGA: TDateTimeField;
     QSubOrdenesFECHA_INI: TDateTimeField;
     QSubOrdenesFECHA_FIN: TDateTimeField;
     QSubOrdenesCOSTE_FIJO_PRE: TFloatField;
     QSubOrdenesCOSTE_VAR_PRE: TFloatField;
     QSubOrdenesCOSTE_MAT_PRE: TFloatField;
     QSubOrdenesCOSTE_MO_PRE: TFloatField;
     QSubOrdenesCOSTE_MAQ_PRE: TFloatField;
     QSubOrdenesCOSTE_TEX_PRE: TFloatField;
     QSubOrdenesCOSTE_TOT_PRE: TFloatField;
     QSubOrdenesCOSTE_FIJO_REAL: TFloatField;
     QSubOrdenesCOSTE_VAR_REAL: TFloatField;
     QSubOrdenesCOSTE_MAT_REAL: TFloatField;
     QSubOrdenesCOSTE_MO_REAL: TFloatField;
     QSubOrdenesCOSTE_MAQ_REAL: TFloatField;
     QSubOrdenesCOSTE_TEX_REAL: TFloatField;
     QSubOrdenesCOSTE_TOT_REAL: TFloatField;
     QSubOrdenesCOSTE_UNITARIO: TFloatField;
     QSubOrdenesPRECIO_VENTA: TFloatField;
     QSubOrdenesHORAS_TOTALES: TFloatField;
     QSubOrdenesMARGEN_UNI: TFloatField;
     QSubOrdenesMARGEN_TOTAL: TFloatField;
     QSubOrdenesOBSERVACIONES: TMemoField;
     QSubOrdenesVISTOBUENO1: TIntegerField;
     QSubOrdenesVISTOBUENO2: TIntegerField;
     QSubOrdenesVISTOBUENO3: TIntegerField;
     QSubOrdenesSITUACION: TIntegerField;
     xCostesTOrden: TFIBDataSetRO;
     DSxCostesTOrden: TDataSource;
     xCostesTOrdenCLIENTE: TIntegerField;
     xCostesTOrdenCOSTE_TOT_REAL: TFloatField;
     xCostesTOrdenCOSTE_TEX_REAL: TFloatField;
     xCostesTOrdenCOSTE_MAQ_REAL: TFloatField;
     xCostesTOrdenCOSTE_MO_REAL: TFloatField;
     xCostesTOrdenCOSTE_MAT_REAL: TFloatField;
     xCostesTOrdenCOSTE_VAR_REAL: TFloatField;
     xCostesTOrdenCOSTE_FIJO_REAL: TFloatField;
     xCostesTOrdenCOSTE_TOT_PRE: TFloatField;
     xCostesTOrdenCOSTE_MO_PRE: TFloatField;
     xCostesTOrdenUNI_PEDID: TFloatField;
     xCostesTOrdenCOSTE_MAQ_PRE: TFloatField;
     xCostesTOrdenUNI_MANUAL: TFloatField;
     xCostesTOrdenUNI_TOTAL: TFloatField;
     xCostesTOrdenUNI_PRODUC: TFloatField;
     xCostesTOrdenUNI_PENDIENTES: TFloatField;
     xCostesTOrdenCOSTE_FIJO_PRE: TFloatField;
     xCostesTOrdenCOSTE_TEX_PRE: TFloatField;
     xCostesTOrdenCOSTE_MAT_PRE: TFloatField;
     xCostesTOrdenCOSTE_VAR_PRE: TFloatField;
     QMProOrdTareaIDENTIFICADOR: TIntegerField;
     QMProOrdENTRADA: TIntegerField;
     QMProOrdMatENTRADA: TIntegerField;
     QMProOrdFasesENTRADA: TIntegerField;
     QMProOrdTareaENTRADA: TIntegerField;
     QMProOrdFasesFECHA_FIN_FASE: TDateTimeField;
     QMProOrdTareaFECHA_FIN_TAREA: TDateTimeField;
     QMProOrdTareaRECURSO: TFIBStringField;
     QMProOrdMatID_ORDEN: TIntegerField;
     QMProOrdMatUNIDADES_FAB: TFloatField;
     QMProOrdMatUNIDADES_STOCK: TFloatField;
     QMProOrdTareaEMPRESA: TIntegerField;
     QMProOrdFasesG: TFIBTableSet;
     QMProOrdMatG: TFIBTableSet;
     QMProOrdTarG: TFIBTableSet;
     DSQMProOrdFasesG: TDataSource;
     DSQMProOrdMatG: TDataSource;
     DSQMProOrdTarG: TDataSource;
     QMProOrdFasesGEMPRESA: TIntegerField;
     QMProOrdFasesGEJERCICIO: TIntegerField;
     QMProOrdFasesGCANAL: TIntegerField;
     QMProOrdFasesGSERIES: TFIBStringField;
     QMProOrdFasesGRIG_OF: TIntegerField;
     QMProOrdFasesGSUBORDEN: TIntegerField;
     QMProOrdFasesGLINEA_FASE: TIntegerField;
     QMProOrdFasesGFASE: TFIBStringField;
     QMProOrdFasesGORDEN: TIntegerField;
     QMProOrdFasesGTIPOFASE: TFIBStringField;
     QMProOrdFasesGNOTAS: TMemoField;
     QMProOrdFasesGDIBUJO: TFIBStringField;
     QMProOrdFasesGESTADO: TIntegerField;
     QMProOrdFasesGVALORCALIDAD: TIntegerField;
     QMProOrdFasesGFECHA_FIN_FASE: TDateTimeField;
     QMProOrdFasesGENTRADA: TIntegerField;
     QMProOrdFasesGID_ORDEN: TIntegerField;
     QMProOrdTarGEMPRESA: TIntegerField;
     QMProOrdTarGEJERCICIO: TIntegerField;
     QMProOrdTarGCANAL: TIntegerField;
     QMProOrdTarGSERIE: TFIBStringField;
     QMProOrdTarGRIG_OF: TIntegerField;
     QMProOrdTarGSUBORDEN: TIntegerField;
     QMProOrdTarGLINEA_FASE: TIntegerField;
     QMProOrdTarGLINEA_TAREA: TIntegerField;
     QMProOrdTarGTAREA: TFIBStringField;
     QMProOrdTarGORDEN: TIntegerField;
     QMProOrdTarGTIPOTAREA: TFIBStringField;
     QMProOrdTarGCOMENTARIO: TMemoField;
     QMProOrdTarGRECURSO: TFIBStringField;
     QMProOrdTarGCANTIDAD: TFloatField;
     QMProOrdTarGARTICULO: TFIBStringField;
     QMProOrdTarGPRE_COS_UNI_PRE: TFloatField;
     QMProOrdTarGTOTAL_VAR_PRE: TFloatField;
     QMProOrdTarGPRECIO_FIJO_PRE: TFloatField;
     QMProOrdTarGTOTAL_PRE: TFloatField;
     QMProOrdTarGPRE_COS_UNI_REAL: TFloatField;
     QMProOrdTarGTOTAL_VAR_REAL: TFloatField;
     QMProOrdTarGPRECIO_FIJO_REAL: TFloatField;
     QMProOrdTarGTOTAL_REAL: TFloatField;
     QMProOrdTarGESTADO: TIntegerField;
     QMProOrdTarGFECHA_FIN_TAREA: TDateTimeField;
     QMProOrdTarGIDENTIFICADOR: TIntegerField;
     QMProOrdTarGENTRADA: TIntegerField;
     QMProOrdTarGID_ORDEN: TIntegerField;
     QMProOrdTarGCANTIDAD_UTIL: TFloatField;
     QMProOrdMatGEMPRESA: TIntegerField;
     QMProOrdMatGEJERCICIO: TIntegerField;
     QMProOrdMatGCANAL: TIntegerField;
     QMProOrdMatGSERIES: TFIBStringField;
     QMProOrdMatGRIG_OF: TIntegerField;
     QMProOrdMatGSUBORDEN: TIntegerField;
     QMProOrdMatGLINEA_MAT: TIntegerField;
     QMProOrdMatGALMACEN: TFIBStringField;
     QMProOrdMatGLOTE: TFIBStringField;
     QMProOrdMatGCOMPONENTE: TFIBStringField;
     QMProOrdMatGORDEN: TIntegerField;
     QMProOrdMatGUNIDADES_NEC: TFloatField;
     QMProOrdMatGUNIDADES_UTIL: TFloatField;
     QMProOrdMatGPORCENTAJE: TFloatField;
     QMProOrdMatGLINEA_FASE: TIntegerField;
     QMProOrdMatGPRE_COS_UNI: TFloatField;
     QMProOrdMatGTOTAL_VAR: TFloatField;
     QMProOrdMatGPRECIO_FIJO: TFloatField;
     QMProOrdMatGTOTAL: TFloatField;
     QMProOrdMatGPRODUCCION: TIntegerField;
     QMProOrdMatGMATESC: TIntegerField;
     QMProOrdMatGENTRADA: TIntegerField;
     QMProOrdMatGID_ORDEN: TIntegerField;
     QMProOrdMatGID_ORDEN_MAT: TIntegerField;
     QMProOrdMatGUNIDADES_FAB: TFloatField;
     QMProOrdMatGUNIDADES_STOCK: TFloatField;
     QMProOrdMatGPRE_COS_UNI_REAL: TFloatField;
     QMProOrdMatGDescAlmacen: TStringField;
     QMProOrdMatGDescArt: TStringField;
     QMProOrdMatGPrecioMat: TFloatField;
     QMProOrdTarGDescrTarea: TStringField;
     QMProOrdTarGDescrRecurso: TStringField;
     QMProOrdMatID_ORDEN_MAT: TIntegerField;
     DSQMProOrdG: TDataSource;
     QMProOrdG: TFIBTableSet;
     QMProOrdGEMPRESA: TIntegerField;
     QMProOrdGEJERCICIO: TIntegerField;
     QMProOrdGCANAL: TIntegerField;
     QMProOrdGSERIES: TFIBStringField;
     QMProOrdGRIG_OF: TIntegerField;
     QMProOrdGSUBORDEN: TIntegerField;
     QMProOrdGALMACEN_SAL: TFIBStringField;
     QMProOrdGALMACEN_LAN: TFIBStringField;
     QMProOrdGALMACEN_ENT: TFIBStringField;
     QMProOrdGFECHA_ORD: TDateTimeField;
     QMProOrdGCLIENTE: TIntegerField;
     QMProOrdGCOMPUESTO: TFIBStringField;
     QMProOrdGESCANDALLO: TIntegerField;
     QMProOrdGESTADO: TIntegerField;
     QMProOrdGPEDIDO: TIntegerField;
     QMProOrdGLINEA_PED: TIntegerField;
     QMProOrdGFECHA_PED: TDateTimeField;
     QMProOrdGUNI_PEDID: TFloatField;
     QMProOrdGUNI_MANUAL: TFloatField;
     QMProOrdGUNI_TOTAL: TFloatField;
     QMProOrdGPRIORIDAD: TIntegerField;
     QMProOrdGMERMA: TFloatField;
     QMProOrdGUNI_PRODUC: TFloatField;
     QMProOrdGUNI_PENDIENTES: TFloatField;
     QMProOrdGFECHA_ENTREGA: TDateTimeField;
     QMProOrdGFECHA_INI: TDateTimeField;
     QMProOrdGFECHA_FIN: TDateTimeField;
     QMProOrdGCOSTE_FIJO_PRE: TFloatField;
     QMProOrdGCOSTE_VAR_PRE: TFloatField;
     QMProOrdGCOSTE_MAT_PRE: TFloatField;
     QMProOrdGCOSTE_MO_PRE: TFloatField;
     QMProOrdGCOSTE_MAQ_PRE: TFloatField;
     QMProOrdGCOSTE_TEX_PRE: TFloatField;
     QMProOrdGCOSTE_TOT_PRE: TFloatField;
     QMProOrdGCOSTE_FIJO_REAL: TFloatField;
     QMProOrdGCOSTE_VAR_REAL: TFloatField;
     QMProOrdGCOSTE_MAT_REAL: TFloatField;
     QMProOrdGCOSTE_MO_REAL: TFloatField;
     QMProOrdGCOSTE_MAQ_REAL: TFloatField;
     QMProOrdGCOSTE_TEX_REAL: TFloatField;
     QMProOrdGCOSTE_TOT_REAL: TFloatField;
     QMProOrdGCOSTE_UNITARIO: TFloatField;
     QMProOrdGPRECIO_VENTA: TFloatField;
     QMProOrdGHORAS_TOTALES: TFloatField;
     QMProOrdGMARGEN_UNI: TFloatField;
     QMProOrdGMARGEN_TOTAL: TFloatField;
     QMProOrdGOBSERVACIONES: TMemoField;
     QMProOrdGVISTOBUENO1: TIntegerField;
     QMProOrdGVISTOBUENO2: TIntegerField;
     QMProOrdGVISTOBUENO3: TIntegerField;
     QMProOrdGSITUACION: TIntegerField;
     QMProOrdGMARGEN_UNI_CIEN: TFloatField;
     QMProOrdGENTRADA: TIntegerField;
     QMProOrdGID_ORDEN: TIntegerField;
     QMProOrdGTIPO_LANZAMIENTO: TIntegerField;
     QMProOrdGID_ORDEN_MAT: TIntegerField;
     QMProOrdGTIPO_RESERVA: TIntegerField;
     QMProOrdGID_MOV_STOCK: TIntegerField;
     QMProOrdGISO_APROBADO: TIntegerField;
     QMProOrdGISO_VERIFICADO: TIntegerField;
     QMProOrdGISO_VALIDADO: TIntegerField;
     xCompuesto_: TFIBDataSetRO;
     QMProOrdID_ORDEN: TIntegerField;
     QMProOrdTIPO_LANZAMIENTO: TIntegerField;
     QMProOrdID_ORDEN_MAT: TIntegerField;
     QMProOrdTIPO_RESERVA: TIntegerField;
     xCompuesto_ARTICULO: TFIBStringField;
     xCompuesto_CONTROLA_MEDIDAS: TIntegerField;
     xCompuesto_SERIALIZADO: TIntegerField;
     xCompuesto_LOTES: TIntegerField;
     xCompuesto_MULTIPLO_1: TFloatField;
     xCompuesto_MULTIPLO_2: TFloatField;
     xCompuesto_MULTIPLO_3: TFloatField;
     xCompuesto_MULTIPLO_4: TFloatField;
     xCompuesto_FACTOR_ESCALA: TFloatField;
     xCompuesto_UD_MINIMO_COMPRA: TFloatField;
     xCompuesto_UD_MINIMO_VENTA: TFloatField;
     xCompuesto_UNIDADES: TFIBStringField;
     xCompuesto_ID_A: TIntegerField;
     QMProOrdMatLOTE: TFIBStringField;
     QMProOrdMatID_MOV_STOCK: TIntegerField;
     QMProOrdMatGID_MOV_STOCK: TIntegerField;
     xGrafRecursosFases: TFIBDataSetRO;
     xGrafRecursosFasesHORAS_TOTALES: TFloatField;
     xGrafRecursosFasesFASE: TFIBStringField;
     xGrafRecursosFasesHORAS_FASE: TFloatField;
     xGrafRecursosFasesPORCENTAJE_FASE: TFloatField;
     xComponente: TFIBDataSetRO;
     xComponenteARTICULO: TFIBStringField;
     xComponenteCONTROLA_MEDIDAS: TIntegerField;
     xComponenteSERIALIZADO: TIntegerField;
     xComponenteLOTES: TIntegerField;
     xComponenteMULTIPLO_1: TFloatField;
     xComponenteMULTIPLO_2: TFloatField;
     xComponenteMULTIPLO_3: TFloatField;
     xComponenteMULTIPLO_4: TFloatField;
     xComponenteFACTOR_ESCALA: TFloatField;
     xComponenteUD_MINIMO_COMPRA: TFloatField;
     xComponenteUD_MINIMO_VENTA: TFloatField;
     xComponenteUNIDADES: TFIBStringField;
     xComponenteID_A: TIntegerField;
     QMProOrdMatUNIDADES_PREV: TFloatField;
     QMProOrdMatPRECIO_FIJO_REAL: TFloatField;
     QMProOrdMatTOTAL_VAR_REAL: TFloatField;
     QMProOrdMatTOTAL_REAL: TFloatField;
     QMProOrdMatPRE_COS_UNI_REAL: TFloatField;
     QMProOrdMatNOTAS_MAT: TMemoField;
     QMProOrdTareaID_UTILLAJE: TFIBStringField;
     DSxInfoActualizada: TDataSource;
     QMProOrdMatMEDIDAS: TFIBStringField;
     QMProOrdMatTIPO_PIEZA: TFIBStringField;
     QMProOrdMatNUM_PIEZAS: TFIBStringField;
     QMProOrdISO_APROBADO: TIntegerField;
     QMProOrdISO_VERIFICADO: TIntegerField;
     QMProOrdISO_VALIDADO: TIntegerField;
     QMProOrdTareaARTICULO: TFIBStringField;
     QMProOrdTareaID_ORDEN: TIntegerField;
     QMProOrdTareaCANTIDAD_UTIL: TFloatField;
     QMProOrdFasesID_ORDEN: TIntegerField;
     QMProOrdFasesID_IMAGEN: TIntegerField;
     QMProOrdTareaTIME: TStringField;
     QMProOrdTareaTIEMPO: TFloatField;
     QMProOrdTareaDESC_UTILLAJE: TFIBStringField;
     QMProOrdMatUNIDAD_ART: TFIBStringField;
     QMProOrdMatUNIDAD_FAB: TFIBStringField;
     QMProOrdTareaTIEMPO_UTIL: TFloatField;
     QMProOrdTareaUDS_FABRICADAS: TFloatField;
     QMProOrdTareaTIME_UTIL: TStringField;
     QMProOrdMatID_MOV_STOCK_B: TIntegerField;
     QMProOrdMatID_MOV_STOCK_C: TIntegerField;
     QMProOrdMatID_EQUIVAL: TIntegerField;
     QMProOrdMatCOMPRAR: TIntegerField;
     QMProOrdMatPROVEEDOR_COMPRA: TIntegerField;
     QMProOrdMatMOV_STOCK_COMPRA: TIntegerField;
     xSeleccEquival: TFIBDataSetRO;
     xSeleccEquivalID_EQUIVAL: TIntegerField;
     QMProOrdMatID_A: TIntegerField;
     QMProOrdMatCompra: TFIBTableSet;
     DSQMProOrdMatCompra: TDataSource;
     QMProOrdID_A: TIntegerField;
     xDatosCompra: TFIBDataSetRO;
     QMProOrdMatUDS_COMPRA: TFloatField;
     QMProOrdMatRESERVA_STOCK: TIntegerField;
     DSxDatosCompra: TDataSource;
     xDatosCompraARTICULO: TFIBStringField;
     xDatosCompraTITULO: TFIBStringField;
     xDatosCompraTIPO_COMPRA: TFIBStringField;
     xDatosCompraUNIDADES: TFloatField;
     xDatosCompraUDS_UTILIZADAS: TFloatField;
     xDatosCompraP_COSTE: TFloatField;
     xDatosCompraNUM_DOC: TIntegerField;
     QMProOrdMatDESCRIPPROVEEDOR: TStringField;
     QMProOrdPADRE_SUBORDEN: TIntegerField;
     QMProOrdCONT_SUBORDEN: TIntegerField;
     QMProOrdREFERENCIA: TFIBStringField;
     QMProOrdTareaCANTIDAD_IMPUTADA: TFloatField;
     QMProOrdTareaOPERACIONES_NUM: TIntegerField;
     QMProOrdTareaOPERACIONES_TIEMPO: TIntegerField;
     QMProOrdTareaCosteOperacionPre: TFloatField;
     QMProOrdTareaCosteOperacionReal: TFloatField;
     xCostesTOrdenCOSTE_COMPRAS: TFloatField;
     QMProOrdTareaTOTAL_IMP: TFloatField;
     QMProOrdTareaPRECIO_IMP: TFloatField;
     QMProOrdTareaTOTAL: TFloatField;
     QMProOrdTareaTOTAL_HORAS: TFloatField;
     QMProOrdPREVALECE_ALM_ORDEN: TIntegerField;
     QMProOrdCERRAR_SUBORDENES: TIntegerField;
     QMProOrdIMPORTAR_OP: TIntegerField;
     QMProOrdCASO_OP: TIntegerField;
     QMProOrdRESERVA_STOCK_OP: TIntegerField;
     QMProOrdID_DESPIECE: TIntegerField;
     QMProOrdID_ORDEN_SUBORDEN: TIntegerField;
     QMProOrdSELECCIONADA: TIntegerField;
     QMProOrdMEDIDA_1: TFloatField;
     QMProOrdMEDIDA_2: TFloatField;
     QMProOrdMEDIDA_3: TFloatField;
     QMProOrdMEDIDA_4: TFloatField;
     QMProOrdMatRESULTADO_FORMULA: TFloatField;
     QMProOrdMatFORMULA: TIntegerField;
     QMProOrdRESPONSABLE: TIntegerField;
     QMProOrdMatDES_ALTO: TFloatField;
     QMProOrdMatDES_ANCHO: TFloatField;
     QMProOrdMatDES_GRUESO: TFloatField;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaEMPRESA: TIntegerField;
     xInfoActualizadaEJERCICIO: TIntegerField;
     xInfoActualizadaCANAL: TIntegerField;
     xInfoActualizadaSERIES: TFIBStringField;
     xInfoActualizadaRIG_OF: TIntegerField;
     xInfoActualizadaSUBORDEN: TIntegerField;
     xInfoActualizadaALMACEN_SAL: TFIBStringField;
     xInfoActualizadaALMACEN_LAN: TFIBStringField;
     xInfoActualizadaALMACEN_ENT: TFIBStringField;
     xInfoActualizadaFECHA_ORD: TDateTimeField;
     xInfoActualizadaCLIENTE: TIntegerField;
     xInfoActualizadaCOMPUESTO: TFIBStringField;
     xInfoActualizadaESCANDALLO: TIntegerField;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaPEDIDO: TIntegerField;
     xInfoActualizadaLINEA_PED: TIntegerField;
     xInfoActualizadaFECHA_PED: TDateTimeField;
     xInfoActualizadaUNI_PEDID: TFloatField;
     xInfoActualizadaUNI_MANUAL: TFloatField;
     xInfoActualizadaUNI_TOTAL: TFloatField;
     xInfoActualizadaPRIORIDAD: TIntegerField;
     xInfoActualizadaMERMA: TFloatField;
     xInfoActualizadaUNI_PRODUC: TFloatField;
     xInfoActualizadaUNI_PENDIENTES: TFloatField;
     xInfoActualizadaFECHA_ENTREGA: TDateTimeField;
     xInfoActualizadaFECHA_INI: TDateTimeField;
     xInfoActualizadaFECHA_FIN: TDateTimeField;
     xInfoActualizadaCOSTE_FIJO_PRE: TFloatField;
     xInfoActualizadaCOSTE_VAR_PRE: TFloatField;
     xInfoActualizadaCOSTE_MAT_PRE: TFloatField;
     xInfoActualizadaCOSTE_MO_PRE: TFloatField;
     xInfoActualizadaCOSTE_MAQ_PRE: TFloatField;
     xInfoActualizadaCOSTE_TEX_PRE: TFloatField;
     xInfoActualizadaCOSTE_TOT_PRE: TFloatField;
     xInfoActualizadaCOSTE_FIJO_REAL: TFloatField;
     xInfoActualizadaCOSTE_VAR_REAL: TFloatField;
     xInfoActualizadaCOSTE_MAT_REAL: TFloatField;
     xInfoActualizadaCOSTE_MO_REAL: TFloatField;
     xInfoActualizadaCOSTE_MAQ_REAL: TFloatField;
     xInfoActualizadaCOSTE_TEX_REAL: TFloatField;
     xInfoActualizadaCOSTE_TOT_REAL: TFloatField;
     xInfoActualizadaCOSTE_UNITARIO: TFloatField;
     xInfoActualizadaPRECIO_VENTA: TFloatField;
     xInfoActualizadaHORAS_TOTALES: TFloatField;
     xInfoActualizadaMARGEN_UNI: TFloatField;
     xInfoActualizadaMARGEN_TOTAL: TFloatField;
     xInfoActualizadaVISTOBUENO1: TIntegerField;
     xInfoActualizadaVISTOBUENO2: TIntegerField;
     xInfoActualizadaVISTOBUENO3: TIntegerField;
     xInfoActualizadaSITUACION: TIntegerField;
     xInfoActualizadaMARGEN_UNI_CIEN: TFloatField;
     xInfoActualizadaENTRADA: TIntegerField;
     xInfoActualizadaID_ORDEN: TIntegerField;
     xInfoActualizadaTIPO_LANZAMIENTO: TIntegerField;
     xInfoActualizadaID_ORDEN_MAT: TIntegerField;
     xInfoActualizadaTIPO_RESERVA: TIntegerField;
     xInfoActualizadaID_MOV_STOCK: TIntegerField;
     xInfoActualizadaISO_APROBADO: TIntegerField;
     xInfoActualizadaISO_VERIFICADO: TIntegerField;
     xInfoActualizadaISO_VALIDADO: TIntegerField;
     xInfoActualizadaID_A: TIntegerField;
     xInfoActualizadaPADRE_SUBORDEN: TIntegerField;
     xInfoActualizadaCONT_SUBORDEN: TIntegerField;
     xInfoActualizadaREFERENCIA: TFIBStringField;
     xInfoActualizadaCOSTE_COMPRAS: TFloatField;
     xInfoActualizadaHORAS_OPERARIO: TFloatField;
     xInfoActualizadaHORAS_MAQUINA: TFloatField;
     xInfoActualizadaID_DESPIECE: TIntegerField;
     xInfoActualizadaID_ORDEN_SUBORDEN: TIntegerField;
     xInfoActualizadaSELECCIONADA: TIntegerField;
     xInfoActualizadaPREVALECE_ALM_ORDEN: TIntegerField;
     xInfoActualizadaCERRAR_SUBORDENES: TIntegerField;
     xInfoActualizadaIMPORTAR_OP: TIntegerField;
     xInfoActualizadaCASO_OP: TIntegerField;
     xInfoActualizadaRESERVA_STOCK_OP: TIntegerField;
     xInfoActualizadaMEDIDA_1: TFloatField;
     xInfoActualizadaMEDIDA_2: TFloatField;
     xInfoActualizadaMEDIDA_3: TFloatField;
     xInfoActualizadaMEDIDA_4: TFloatField;
     xInfoActualizadaDESACTIVA_TRIGGER: TIntegerField;
     xInfoActualizadaRESPONSABLE: TIntegerField;
     xInfoActualizadaDIF_COSTE_FIJO: TFloatField;
     xInfoActualizadaDIF_COSTE_MAT: TFloatField;
     xInfoActualizadaDIF_COSTE_MAQ: TFloatField;
     xInfoActualizadaDIF_COSTE_TEXT: TFloatField;
     xInfoActualizadaDIF_COSTE_VAR: TFloatField;
     xInfoActualizadaDIF_COSTE_MO: TFloatField;
     xInfoActualizadaDIF_COSTE_TOTAL: TFloatField;
     xInfoActualizadaCOSTE_COMPRAS_PRE: TFloatField;
     xInfoActualizadaDIF_COSTE_COMPRAS: TFloatField;
     QMProOrdCOMPUESTOS_VIRTUALES: TIntegerField;
     xDatosCompraUNIDADES_PENDIENTES: TFloatField;
     QMTmpStock: TFIBDataSetRO;
     QMTmpStockID_ORDEN: TIntegerField;
     QMTmpStockARTICULO: TFIBStringField;
     QMTmpStockCANTIDAD: TFloatField;
     QMTmpStockSTOCK: TFloatField;
     QMTmpStockRIG_OF: TIntegerField;
     QMTmpStockSUBORDEN: TIntegerField;
     QMTmpStockLINEA_MAT: TIntegerField;
     DSTmpStock: TDataSource;
     QMProOrdDESACTIVA_TRIGGER: TIntegerField;
     QMProOrdSEGUIR_SIN_STOCK: TIntegerField;
     QMTmpStockTOTAL: TFloatField;
     xInfoActualizadaCOMPUESTOS_VIRTUALES: TIntegerField;
     xInfoActualizadaSEGUIR_SIN_STOCK: TIntegerField;
     xInfoActualizadaMARGEN_TOTAL_PRE: TFloatField;
     xInfoActualizadaMARGEN_UNI_CIEN_PRE: TFloatField;
     xInfoActualizadaCOSTE_UNITARIO_PRE: TFloatField;
     xInfoActualizadaMARGEN_UNI_PRE: TFloatField;
     xInfoActualizadaPRECIO_VENTA_PRE: TFloatField;
     xInfoActualizadaPRECIO_VENTA_TOT_PRE: TFloatField;
     xInfoActualizadaPRECIO_VENTA_TOT_REAL: TFloatField;
     xInfoActualizadaDIF_MARGEN_TOTAL: TFloatField;
     xInfoActualizadaDIF_MARGEN_UNI_CIEN: TFloatField;
     xInfoActualizadaDIF_PRECIO_VENTA_UNI: TFloatField;
     xInfoActualizadaDIF_COSTE_UNI: TFloatField;
     xInfoActualizadaDIF_MARGEN_UNI: TFloatField;
     xInfoActualizadaDIF_PRECIO_VENTA_TOT: TFloatField;
     xInfoActualizadaHORAS_OPERARIO_PRE: TFloatField;
     xInfoActualizadaHORAS_MAQUINA_PRE: TFloatField;
     xInfoActualizadaDIF_HORAS_MAQUINA: TFloatField;
     xInfoActualizadaDIF_HORAS_OPERARIO: TFloatField;
     xInfoActualizadaDIF_COSTE_MARGEN_TOTAL: TFloatField;
     xInfoIncMaterial: TFIBDataSetRO;
     DSxInfoIncMaterial: TDataSource;
     xInfoIncMaterialLINEA: TIntegerField;
     xInfoIncMaterialCOMPONENTE: TFIBStringField;
     xInfoIncMaterialUNDS: TFloatField;
     xInfoIncMaterialPRE_COS_UNI: TFloatField;
     xInfoIncMaterialTOTAL: TFloatField;
     QMProOrdRECUPERADO_MARCAJE: TIntegerField;
     QMProOrdMatN_MOV_STOCK: TIntegerField;
     QMProOrdMatMINI_NOTA: TFIBStringField;
     QMProOrdMatDESACTIVA_TRIGGER: TIntegerField;
     QMProOrdMatESTADO: TIntegerField;
     QMProOrdMatLINEA_TAREA: TIntegerField;
     xDatosCompraHERENCIA_RIG: TIntegerField;
     xDatosCompraPROVEEDOR: TIntegerField;
     xDatosCompraTITULO_PROV: TFIBStringField;
     xInfoIncMaterialRIG_OF: TIntegerField;
     xInfoIncMaterialID_INC_C: TIntegerField;
     xInfoIncMaterialEMPRESA: TIntegerField;
     xInfoIncMaterialEJERCICIO: TIntegerField;
     xInfoIncMaterialCANAL: TIntegerField;
     xInfoIncMaterialSERIE: TFIBStringField;
     xInfoIncMaterialNOTAS: TBlobField;
     xInfoIncMaterialID_CIERRE: TIntegerField;
     xInfoIncMaterialID_ORDEN_MAT: TIntegerField;
     xInfoIncMaterialN_MOV_STOCK: TIntegerField;
     xInfoIncMaterialALMACEN: TFIBStringField;
     xInfoIncMaterialID_ORDEN: TIntegerField;
     xInfoIncMaterialID_INC_D: TIntegerField;
     xInfoIncMaterialID_ORDEN_MAT_COMPRA: TIntegerField;
     xInfoIncMaterialFASES: TFIBStringField;
     xDatosCompraEJERCICIO_DOC: TIntegerField;
     QMProOrdFasesREBAJE: TIntegerField;
     QMProOrdFasesCANTIDAD_ENTRADA: TFloatField;
     QMProOrdFasesCANTIDAD_TERMINADA: TFloatField;
     QMProOrdUNI_FABRICADAS: TFloatField;
     xInfoActualizadaRECUPERADO_MARCAJE: TIntegerField;
     xInfoActualizadaUNI_FABRICADAS: TFloatField;
     xInfoMateriales: TFIBDataSetRO;
     DSxInfoMat: TDataSource;
     xInfoMaterialesEMPRESA: TIntegerField;
     xInfoMaterialesEJERCICIO: TIntegerField;
     xInfoMaterialesCANAL: TIntegerField;
     xInfoMaterialesSERIES: TFIBStringField;
     xInfoMaterialesRIG_OF: TIntegerField;
     xInfoMaterialesSUBORDEN: TIntegerField;
     xInfoMaterialesLINEA_MAT: TIntegerField;
     xInfoMaterialesALMACEN: TFIBStringField;
     xInfoMaterialesLOTE: TFIBStringField;
     xInfoMaterialesCOMPONENTE: TFIBStringField;
     xInfoMaterialesORDEN: TIntegerField;
     xInfoMaterialesUNIDADES_NEC: TFloatField;
     xInfoMaterialesUNIDADES_UTIL: TFloatField;
     xInfoMaterialesPORCENTAJE: TFloatField;
     xInfoMaterialesLINEA_FASE: TIntegerField;
     xInfoMaterialesPRE_COS_UNI: TFloatField;
     xInfoMaterialesTOTAL_VAR: TFloatField;
     xInfoMaterialesPRECIO_FIJO: TFloatField;
     xInfoMaterialesTOTAL: TFloatField;
     xInfoMaterialesPRODUCCION: TIntegerField;
     xInfoMaterialesMATESC: TIntegerField;
     xInfoMaterialesENTRADA: TIntegerField;
     xInfoMaterialesID_ORDEN: TIntegerField;
     xInfoMaterialesID_ORDEN_MAT: TIntegerField;
     xInfoMaterialesUNIDADES_FAB: TFloatField;
     xInfoMaterialesUNIDADES_STOCK: TFloatField;
     xInfoMaterialesPRE_COS_UNI_REAL: TFloatField;
     xInfoMaterialesID_MOV_STOCK: TIntegerField;
     xInfoMaterialesUNIDADES_PREV: TFloatField;
     xInfoMaterialesPRECIO_FIJO_REAL: TFloatField;
     xInfoMaterialesTOTAL_VAR_REAL: TFloatField;
     xInfoMaterialesTOTAL_REAL: TFloatField;
     xInfoMaterialesMEDIDAS: TFIBStringField;
     xInfoMaterialesTIPO_PIEZA: TFIBStringField;
     xInfoMaterialesNUM_PIEZAS: TFIBStringField;
     xInfoMaterialesID_MOV_STOCK_B: TIntegerField;
     xInfoMaterialesID_MOV_STOCK_C: TIntegerField;
     xInfoMaterialesUNIDAD_ART: TFIBStringField;
     xInfoMaterialesUNIDAD_FAB: TFIBStringField;
     xInfoMaterialesID_EQUIVAL: TIntegerField;
     xInfoMaterialesCOMPRAR: TIntegerField;
     xInfoMaterialesPROVEEDOR_COMPRA: TIntegerField;
     xInfoMaterialesMOV_STOCK_COMPRA: TIntegerField;
     xInfoMaterialesID_A: TIntegerField;
     xInfoMaterialesUDS_COMPRA: TFloatField;
     xInfoMaterialesRESERVA_STOCK: TIntegerField;
     xInfoMaterialesN_MOV_STOCK: TIntegerField;
     xInfoMaterialesMINI_NOTA: TFIBStringField;
     xInfoMaterialesRESULTADO_FORMULA: TFloatField;
     xInfoMaterialesFORMULA: TIntegerField;
     xInfoMaterialesDESACTIVA_TRIGGER: TIntegerField;
     xInfoMaterialesDES_ALTO: TFloatField;
     xInfoMaterialesDES_ANCHO: TFloatField;
     xInfoMaterialesDES_GRUESO: TFloatField;
     xInfoMaterialesESTADO: TIntegerField;
     xInfoMaterialesLINEA_TAREA: TIntegerField;
     xInfoMaterialesID_DETALLES_ST: TIntegerField;
     xInfoTarea: TFIBDataSetRO;
     DSxInfoTar: TDataSource;
     xInfoTareaEMPRESA: TIntegerField;
     xInfoTareaEJERCICIO: TIntegerField;
     xInfoTareaCANAL: TIntegerField;
     xInfoTareaSERIE: TFIBStringField;
     xInfoTareaRIG_OF: TIntegerField;
     xInfoTareaSUBORDEN: TIntegerField;
     xInfoTareaLINEA_FASE: TIntegerField;
     xInfoTareaLINEA_TAREA: TIntegerField;
     xInfoTareaTAREA: TFIBStringField;
     xInfoTareaORDEN: TIntegerField;
     xInfoTareaTIPOTAREA: TFIBStringField;
     xInfoTareaCOMENTARIO: TMemoField;
     xInfoTareaRECURSO: TFIBStringField;
     xInfoTareaCANTIDAD: TFloatField;
     xInfoTareaARTICULO: TFIBStringField;
     xInfoTareaPRE_COS_UNI_PRE: TFloatField;
     xInfoTareaTOTAL_VAR_PRE: TFloatField;
     xInfoTareaPRECIO_FIJO_PRE: TFloatField;
     xInfoTareaTOTAL_PRE: TFloatField;
     xInfoTareaPRE_COS_UNI_REAL: TFloatField;
     xInfoTareaTOTAL_VAR_REAL: TFloatField;
     xInfoTareaPRECIO_FIJO_REAL: TFloatField;
     xInfoTareaTOTAL_REAL: TFloatField;
     xInfoTareaESTADO: TIntegerField;
     xInfoTareaFECHA_FIN_TAREA: TDateTimeField;
     xInfoTareaIDENTIFICADOR: TIntegerField;
     xInfoTareaENTRADA: TIntegerField;
     xInfoTareaID_ORDEN: TIntegerField;
     xInfoTareaCANTIDAD_UTIL: TFloatField;
     xInfoTareaID_UTILLAJE: TFIBStringField;
     xInfoTareaDESC_UTILLAJE: TFIBStringField;
     xInfoTareaTIEMPO: TFloatField;
     xInfoTareaTIEMPO_UTIL: TFloatField;
     xInfoTareaUDS_FABRICADAS: TFloatField;
     xInfoTareaCANTIDAD_IMPUTADA: TFloatField;
     xInfoTareaOPERACIONES_NUM: TIntegerField;
     xInfoTareaOPERACIONES_TIEMPO: TIntegerField;
     xInfoTareaTOTAL_IMP: TFloatField;
     xInfoTareaPRECIO_IMP: TFloatField;
     xInfoTareaTOTAL: TFloatField;
     xInfoTareaTOTAL_HORAS: TFloatField;
     xInfoTareaIMPUTACION: TFIBStringField;
     xInfoTareaDESCRIPCION_IMP: TFIBStringField;
     xInfoTareaFECHA_MARCAJE: TDateTimeField;
     xInfoTareaEMPLEADO: TIntegerField;
     xInfoTareaNOMBRE_R_SOCIAL: TFIBStringField;
     xInfoFase: TFIBDataSetRO;
     DSxInfoFase: TDataSource;
     xInfoFaseEMPRESA: TIntegerField;
     xInfoFaseEJERCICIO: TIntegerField;
     xInfoFaseCANAL: TIntegerField;
     xInfoFaseSERIES: TFIBStringField;
     xInfoFaseRIG_OF: TIntegerField;
     xInfoFaseSUBORDEN: TIntegerField;
     xInfoFaseLINEA_FASE: TIntegerField;
     xInfoFaseFASE: TFIBStringField;
     xInfoFaseORDEN: TIntegerField;
     xInfoFaseTIPOFASE: TFIBStringField;
     xInfoFaseDIBUJO: TFIBStringField;
     xInfoFaseESTADO: TIntegerField;
     xInfoFaseVALORCALIDAD: TIntegerField;
     xInfoFaseFECHA_FIN_FASE: TDateTimeField;
     xInfoFaseENTRADA: TIntegerField;
     xInfoFaseID_ORDEN: TIntegerField;
     xInfoFaseID_IMAGEN: TIntegerField;
     xInfoFaseREBAJE: TIntegerField;
     xInfoFaseCANTIDAD_ENTRADA: TFloatField;
     xInfoFaseCANTIDAD_TERMINADA: TFloatField;
     QMProOrdMatID_DETALLES_ST: TIntegerField;
     QMProOrdMatID_LOTE: TIntegerField;
     QMProOrdMatID_UBICACION: TIntegerField;
     QMProOrdMatTITULO_UBICACION: TStringField;
     QMProOrdPLANIFICACION: TIntegerField;
     QMProOrdLINEA_PLANIFICACION: TIntegerField;
     QMProOrdID_PLANIFICACION: TIntegerField;
     QMProOrdID_PLANIFICACION_DET: TIntegerField;
     QMProOrdID_LOTE: TIntegerField;
     QMProOrdID_UBICACION: TIntegerField;
     QMProOrdTITULO_LOTE: TStringField;
     QMProOrdTITULO_UBICACION: TStringField;
     QMProOrdTareaMAQUINA: TIntegerField;
     QMProOrdTareaDescMaquina: TStringField;
     QMProOrdMatMERMA: TFloatField;
     QMProOrdID_MOV_STOCK_RESERVA: TIntegerField;
     QMProOrdDESC_LOTE: TFIBStringField;
     QMProOrdUNIDAD: TFIBStringField;
     xInfoActualizadaPLANIFICACION: TIntegerField;
     xInfoActualizadaLINEA_PLANIFICACION: TIntegerField;
     xInfoActualizadaID_PLANIFICACION: TIntegerField;
     xInfoActualizadaID_PLANIFICACION_DET: TIntegerField;
     xInfoActualizadaID_LOTE: TIntegerField;
     xInfoActualizadaID_UBICACION: TIntegerField;
     xInfoActualizadaID_MOV_STOCK_RESERVA: TIntegerField;
     xInfoActualizadaDESC_LOTE: TFIBStringField;
     xInfoActualizadaUNIDAD: TFIBStringField;
     xInfoActualizadaCOSTE_MERMA_PRE: TFloatField;
     xInfoActualizadaCOSTE_MERMA_REAL: TFloatField;
     xInfoActualizadaDIF_COSTE_MERMA: TFloatField;
     xCostesTOrdenCOSTE_MERMA_PRE: TFloatField;
     xCostesTOrdenCOSTE_MERMA_REAL: TFloatField;
     QMProOrdCOPIAS_PMP: TIntegerField;
     QMProOrdTareaTIEMPO_PRODUCCION: TFIBStringField;
     QMProOrdTareaFORMULA: TIntegerField;
     QMProOrdMatUNIDADES_DEVOLVER: TFloatField;
     QMProOrdMatALMACEN_DEVOLVER: TFIBStringField;
     QMProOrdMatDESC_COMPONENTE: TStringField;
     QMProOrdVERSION_ORDEN: TFIBStringField;
     QMProOrdFasesMERMA_FASE_PREV: TFloatField;
     QMProOrdFasesPIEZAS_HORA_PREV: TFloatField;
     QMProOrdFasesFECHA_INICIO_FASE: TDateTimeField;
     QMProOrdTareaFECHA_INICIO_TAREA: TDateTimeField;
     QMProOrdMatALMACEN_SAL: TFIBStringField;
     QMProOrdMatSTOCK: TFloatField;
     QMProOrdMatPEDIDOS_A_PRO: TFloatField;
     QMProOrdTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     QMTmpStockTITULO: TFIBStringField;
     QMProOrdREALIZABLE: TIntegerField;
     QMProOrdMatCTROL_UBICACION: TIntegerField;
     QMProOrdMatUBICABLE: TIntegerField;
     QMProOrdMatLOTES: TIntegerField;
     QMProOrdMatCONTROL_STOCK: TIntegerField;
     QMProOrdMatTITULO_LARGO: TFIBStringField;
     QMProOrdMatMASCARA_UNIDADES_COMPONENTE: TStringField;
     QMProOrdMASCARA_UNIDADES_COMPUESTO: TStringField;
     QMProOrdMatCANT_LOTE: TIntegerField;
     QMProOrdTareaSECCION: TFIBStringField;
     xInfoActualizadaUNIDADES_RESERVADAS: TFloatField;
     QMProOrdMatSTOCK_ALM_LAN: TFloatField;
     QMProOrdRESERVA: TIntegerField;
     QMProOrdCANT_RESERVAR: TFloatField;
     QMProOrdMatCompraEMPRESA: TIntegerField;
     QMProOrdMatCompraEJERCICIO: TIntegerField;
     QMProOrdMatCompraCANAL: TIntegerField;
     QMProOrdMatCompraSERIE: TFIBStringField;
     QMProOrdMatCompraRIG_OF: TIntegerField;
     QMProOrdMatCompraLINEA_FASE: TIntegerField;
     QMProOrdMatCompraLINEA_COMPRA: TIntegerField;
     QMProOrdMatCompraID_ORDEN: TIntegerField;
     QMProOrdMatCompraTIPO_COMPRA: TFIBStringField;
     QMProOrdMatCompraID_DET_COMPRA: TIntegerField;
     QMProOrdMatCompraUDS_UTILIZADAS: TFloatField;
     QMProOrdMatCompraALMACEN: TFIBStringField;
     QMProOrdMatCompraINCR_COSTE: TFloatField;
     QMProOrdMatCompraLINEA_COMPRA_DEST: TIntegerField;
     QMProOrdMatCompraMOV_STOCK_COMPRA: TIntegerField;
     QMProOrdMatCompraLINEA_COMPRA_ORIG: TIntegerField;
     QMProOrdMatCompraID_ORDEN_MAT_COMPRA: TIntegerField;
     QMProOrdMatCompraFECHA: TDateTimeField;
     QMProOrdMatCompraBRUTO: TFloatField;
     QMProOrdMatCompraB_DTO_LINEAS: TFloatField;
     QMProOrdMatCompraNUM_DOC: TIntegerField;
     QMProOrdMatCompraARTICULO: TFIBStringField;
     QMProOrdMatCompraTITULO: TFIBStringField;
     QMProOrdMatCompraUNIDADES: TFloatField;
     QMProOrdMatCompraP_COSTE: TFloatField;
     QMProOrdMatCompraUNIDADES_PENDIENTES: TFloatField;
     QMProOrdMatCompraHERENCIA_RIG: TIntegerField;
     QMProOrdMatCompraPROVEEDOR: TIntegerField;
     QMProOrdMatCompraTITULO_PROV: TFIBStringField;
     QMProOrdMatCompraEJERCICIO_DOC: TIntegerField;
     QMProOrdMatCompraCOSTE_MAT_COMPRA: TFloatField;
     QMProOrdMatCompraCOSTE_MAT_TOTAL: TFloatField;
     QMProOrdMatCompraUDS_PENDIENTES: TFloatField;
     QMProOrdMatCompraTITULO_ALMACEN: TFIBStringField;
     QMProOrdESTADO_RESERVA: TIntegerField;
     QMProOrdTareaUNIDADES_DEFECTUOSAS: TFloatField;
     xProOrdMatNotas: TFIBTableSet;
     DSxProOrdMatNotas: TDataSource;
     xProOrdTareaNotas: TFIBTableSet;
     DSxProOrdTareaNotas: TDataSource;
     QMProOrdTareaORDEN_COLA_MAQUINA: TIntegerField;
     QMProOrdTareaORDEN_OF: TIntegerField;
     QMProOrdPROYECTO: TIntegerField;
     QMProOrdTITULO_SITUACION: TStringField;
     QMProOrdID_LOTE_RESERVA: TIntegerField;
     QMProOrdDESC_LOTE_RESERVA: TFIBStringField;
     QMProOrdTareaNO_PRODUCTIVA: TIntegerField;
     QMProOrdMatDESC_PROVEEDOR: TFIBStringField;
     QMProOrdMatDESC_ALMACEN: TFIBStringField;
     QMProOrdMatP_COSTE: TFloatField;
     QMProOrdMatDESC_UBICACION: TFIBStringField;
     QMProOrdMatDESCIMALES_UNIDAD_FAB: TIntegerField;
     QMProOrdDECIMALES_MASCARA: TIntegerField;
     QMProOrdCANT_ESCANDALLO: TIntegerField;
     QMProOrdTareaTIPORECURSO: TFIBStringField;
     QMProOrdSERIALIZADO: TIntegerField;
     QMProOrdLOTEABLE: TIntegerField;
     QMProOrdESTADO_FIRMA_ISO_APROBADO: TIntegerField;
     QMProOrdESTADO_FIRMA_ISO_VERIFICADO: TIntegerField;
     QMProOrdESTADO_FIRMA_ISO_VALIDADO: TIntegerField;
     QMProOrdTITULO_2: TFIBStringField;
     QMProOrdESCANDALLO_2: TIntegerField;
     QMProOrdFasesID_FASE_ESC: TIntegerField;
     QMProOrdTareaID_TAREA_ESC: TIntegerField;
     QMProOrdTIPO_ESC: TFIBStringField;
     QMProOrdTIPO_ESC_2: TFIBStringField;
     QMProOrdFasesTIEMPO: TFloatField;
     QMProOrdFasesTIEMPO_UTIL: TFloatField;
     QMProOrdFasesDIFERENCIA_TIEMPO: TFloatField;
     QMProOrdURGENTE: TIntegerField;
     QMProOrdSIN_LONA: TIntegerField;
     QMProOrdSIN_HERRAJE: TIntegerField;
     QMProOrdSIN_MOTOR: TIntegerField;
     QMProOrdSIN_ROTULACION: TIntegerField;
     QMProOrdRETENIDO_COMERCIAL: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProOrdAfterOpen(DataSet: TDataSet);
     procedure QMProOrdNewRecord(DataSet: TDataSet);
     procedure QMProOrdCOMPUESTOChange(Sender: TField);
     procedure QMProOrdUNI_MANUALChange(Sender: TField);
     // procedure QMProOrdTITULO_CLIENTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdFasesTIPOFASEChange(Sender: TField);
     procedure QMProOrdMatNewRecord(DataSet: TDataSet);
     procedure QMProOrdFasesNewRecord(DataSet: TDataSet);
     procedure QMProOrdTareaNewRecord(DataSet: TDataSet);
     procedure QMProOrdTareaRECURSOChange(Sender: TField);
     procedure QMProOrdMatALMACENChange(Sender: TField);
     procedure QMProOrdMatCOMPONENTEChange(Sender: TField);
     procedure QMProOrdMatUNIDADES_NECChange(Sender: TField);
     procedure QMProOrdMatPRE_COS_UNIChange(Sender: TField);
     procedure QMProOrdMatPRECIO_FIJOChange(Sender: TField);
     procedure QMProOrdTareaTIPOTAREAChange(Sender: TField);
     procedure QMProOrdTareaCANTIDADChange(Sender: TField);
     procedure QMProOrdTareaTIEMPOChange(Sender: TField);
     procedure QMProOrdTareaPRE_COS_UNI_PREChange(Sender: TField);
     procedure QMProOrdTareaPRECIO_FIJO_PREChange(Sender: TField);
     (*
     procedure QMProOrdTareaID_UTILLAJEChange(Sender: TField);
     *)
     procedure QMProOrdAfterScroll(DataSet: TDataSet);
     procedure QMProOrdFasesBeforeInsert(DataSet: TDataSet);
     procedure QMProOrdMatBeforeInsert(DataSet: TDataSet);
     procedure QMProOrdTareaBeforeInsert(DataSet: TDataSet);
     procedure QMProOrdFasesBeforeEdit(DataSet: TDataSet);
     procedure QMProOrdMatBeforeEdit(DataSet: TDataSet);
     procedure QMProOrdTareaBeforeEdit(DataSet: TDataSet);
     procedure QMProOrdFasesBeforeDelete(DataSet: TDataSet);
     procedure QMProOrdMatBeforeDelete(DataSet: TDataSet);
     procedure QMProOrdTareaBeforeDelete(DataSet: TDataSet);
     procedure QMProOrdBeforePost(DataSet: TDataSet);
     procedure QMProOrdFasesBeforePost(DataSet: TDataSet);
     procedure QMProOrdMatBeforePost(DataSet: TDataSet);
     procedure QMProOrdTareaBeforePost(DataSet: TDataSet);
     procedure QMProOrdFasesAfterPost(DataSet: TDataSet);
     procedure QMProOrdMatAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProOrdFasesESTADOChange(Sender: TField);
     procedure QMProOrdTareaESTADOChange(Sender: TField);
     procedure QMProOrdFasesGAfterOpen(DataSet: TDataSet);
     procedure QMProOrdMatGDescAlmacenGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdMatGDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdMatGCOMPONENTEChange(Sender: TField);
     procedure QMProOrdTarGDescrTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdTarGTIPOTAREAChange(Sender: TField);
     procedure QMProOrdTarGDescrRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdTarGRECURSOChange(Sender: TField);
     procedure QMProOrdGAfterScroll(DataSet: TDataSet);
     procedure QMProOrdMatPRE_COS_UNI_REALChange(Sender: TField);
     procedure QMProOrdTareaAfterScroll(DataSet: TDataSet);
     procedure QMProOrdESCANDALLOChange(Sender: TField);
     procedure QMProOrdAfterCancel(DataSet: TDataSet);
     procedure QMProOrdTareaCalcFields(DataSet: TDataSet);
     procedure QMProOrdFasesAfterOpen(DataSet: TDataSet);
     procedure QMProOrdTareaCANTIDAD_UTILChange(Sender: TField);
     procedure QMProOrdTareaTIEMPO_UTILChange(Sender: TField);
     procedure QMProOrdMatPROVEEDOR_COMPRAChange(Sender: TField);
     procedure QMProOrdMatCOMPRARChange(Sender: TField);
     procedure QMProOrdTareaOPERACIONES_NUMChange(Sender: TField);
     procedure QMProOrdTareaOPERACIONES_TIEMPOChange(Sender: TField);
     procedure QMProOrdBeforeClose(DataSet: TDataSet);
     procedure QMProOrdFasesBeforeClose(DataSet: TDataSet);
     procedure QMProOrdGAfterOpen(DataSet: TDataSet);
     procedure QMProOrdGBeforeClose(DataSet: TDataSet);
     procedure QMProOrdFasesGBeforeClose(DataSet: TDataSet);
     procedure QMProOrdMatID_UBICACIONChange(Sender: TField);
     procedure QMProOrdID_UBICACIONChange(Sender: TField);
     procedure QMProOrdID_LOTEChange(Sender: TField);
     procedure QMProOrdMatCalcFields(DataSet: TDataSet);
     procedure QMProOrdMatSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdMatPEDIDOS_A_PROGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdCalcFields(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMProOrdMatCompraNewRecord(DataSet: TDataSet);
     procedure QMProOrdMatCompraBeforePost(DataSet: TDataSet);
     procedure QMProOrdMatSTOCK_ALM_LANGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdMatUNIDADES_NECGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdMatUNIDADES_STOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdTareaAfterOpen(DataSet: TDataSet);
     procedure QMProOrdTareaBeforeClose(DataSet: TDataSet);
     procedure QMProOrdFasesTIEMPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdFasesTIEMPO_UTILGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProOrdFasesDIFERENCIA_TIEMPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     SQLBase: TStrings;
     SQLFind: TStrings;
     Serie: string;
     ControlaStockNegativo: boolean;
     IdReserva: integer;
     OrdenesRealizables: TStrings;
     HayBookmark: boolean;
     Posicionando: boolean;
     CalculandoRealizable: boolean;
     procedure ValoresDefectoProConstantes;
     // procedure Crear_Lanzar(ForzarReserva: boolean = False);
     // procedure MostrarDatosCierre(ForzarReserva: boolean = False);
     procedure ComprobarValorDefecto;
  public
     NotasLote: boolean; // Controla si se editan las notas del lote
     ModTiempo: boolean; // Controla si se modifica el tiempo previsto en segundos de la tarea
     ModTiempoReal: boolean; // Controla si se modifica el tiempo real en segundos de la tarea
     PermitirModificarCompras, PermitirBorrarCompras, PermitirIntroducirDatosCierre: boolean;
     FiltroSituacion: integer;
     FiltroAlmacenLanzamiento: string;
     // proc_precio_venta: integer; // Variable per saber d'on prové el preu venta
     function BusquedaCompleja: integer;
     procedure SituacionSiguiente(ForzarReserva: boolean = False);
     procedure SituacionAnterior;
     procedure Lanzar(TipoLanzamiento: integer);
     procedure Reservar;
     procedure Cerrar;
     function Serializado(tipo: integer): boolean;
     function CompuestoLoteable: boolean;
     procedure DatosSerializacion(var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer; tipodato: integer);
     procedure InfoLotes(EsComponente: boolean);
     procedure PreparaNotasDetalle(Tabla: TFIBTableSet);
     procedure CompruebaFirma(tipo, IdFirma: integer);
     function HayMateriales: boolean;
     function EstadoFirma(IdFirma: integer): smallint;
     procedure FiltraOrden(IdOrden: integer);
     procedure FiltraOrdenesSituacion(Situacion: integer);
     procedure FiltraOrdenesAlmacenLanzamiento(Almacen: string);
     procedure FiltraOrdenes(AbrirDataSet: boolean = True);
     procedure MuestraUbicacion(Tipo: string);
     procedure ExtraeArticulos;
     function EquivalenciaLinea: boolean;
     procedure VerificaEstadoOrden;
     procedure CambiaEstadoCompras(Modo: smallint);
     procedure VerOrigenCompra;
     procedure CambiaSerie(aSerie: string; AbrirDataSet: boolean = True);
     procedure CalculaTiempo;
     procedure CalculaTiempoReal;
     function CalculaTotalVarPre_Tarea: double;
     function CalculaTotalPre_Tarea: double;
     function CalculaTotalVarReal_Tarea: double;
     function CalculaTotalReal_Tarea: double;
     procedure EtiquetasOrdenes;
     procedure RecalculaMarcajes(id_orden: integer); // recàlcul de marcatges
     (*
     procedure TraspasoTipoLanzamientos(TipoLanzamiento: integer);
     *)
     procedure CalculaFormulas(IdOrden: integer);
     procedure RecuperarPrecioVenta;
     function ComprobarStock(Neteja: boolean): boolean;
     procedure CambiaSelectTmpStock(MuestraTodos: boolean);
     function HayMarcajesARecuperar(id_orden: integer): boolean; // Mira si hi ha marcatges a recuperar
     procedure RecalcularCostesMasivo; // recàlcul de costos massiu
     function DameCantTerminada(linea: integer): real; // Me devuelve la cant.terminada linea anterior
     function CalcularUniCierreParcial: real; // Me devuelve las unidades cerrades parcialmente de la OP
     function CompruebaMatLotUbi(id_orden: integer): boolean;
     procedure CrearFichaTecnica;
     procedure CargaMedidasLote(id_lote: integer; var medida1, medida2, medida3, medida4: string);
     function DameIdDespiece(id_orden: integer): integer;
     procedure CrearDespieceOP;
     procedure RecuperarMarcaje;
     procedure MarcaRecuperado(Recuperado: boolean);
     // procedure Lanzar(ForzarReserva: boolean = False);
     function CrearLoteCompuesto: integer;
     function HayCompras: boolean;
     procedure ActualizaMedidas(IDOrden: integer; Medida1, Medida2, Medida3, Medida4: double);
     procedure PropagaAlmacenLanzamientoAMateriales;
     procedure IntroduceMedidas;
     procedure PosicionaIdOrden(IDOrden: integer);
     procedure PosicionaSubordenEscandallo(Escandallo: integer);
     procedure FiltraOrdenesYSubordenes;
     procedure EnvioTrabajoExterno(Tipo, AlmacenOrigen, AlmacenDestino: string; Cantidad: double);
     procedure CreaMovimientoComponente(Tipo, Componente, AlmacenOrigen, AlmacenDestino, Comentario: string; Cantidad: double);
     procedure CambiaComponente(Articulo: string);
     procedure ModificaTiempoTarea(Modo: integer; Valor: double);
     procedure FuerzaRefrescoRealizable(IdOrden: integer);
     procedure DesvincularOrdensuborden(IdOrden: integer);
     procedure CierraSubordenes(IdOrden: integer);
     procedure GeneraPropuestaPedido(IdOrden: integer; Serie: string);
     procedure OptimizaBusqueda(Optimizar: boolean);
     function DameCantidadEscandallo(Compuesto: string): integer;
     procedure RefrescaStock;
     procedure LanzaOrdenMasSubordenes;
  end;

var
  ProDMOrden : TProDMOrden;

implementation

uses UDMMain, UFMain, UEntorno, UFBusca, UProFMOrden, UUtiles, UDameDato,
  UProFMExtraeArticulos, UFormGest, UProFMLSTEtiOrden,
  UFParada, UFMIntroduceLotes, UIsoFMCertificadoAnalisis,
  UIsoDMCertificadoAnalisis, UProFMIntroduceDatosCierre, UProFMIntroduceDatosReserva,
  UProFMMostrarStock, UProFMInfoMedidasOF, DateUtils, UProFMVerOrigenCompra, UFMSeleccion, Windows, UProFMInfoReservas, UProDMIntroduceDatosReserva, UParam
  {$IFNDEF TPV}
  , UFMPropuestas
  {$ENDIF}  ;

{$R *.dfm}

procedure TProDMOrden.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  NotasLote := False;
  ModTiempo := False;
  Posicionando := False;
  CalculandoRealizable := False;
  HayBookmark := False;

  // Máscara fases
  AsignaDisplayFormat(QMProOrdFases, MascaraN, MascaraI, ShortDateFormat);
  QMProOrdFasesMERMA_FASE_PREV.DisplayFormat := MascaraP;

  // Máscara Compras
  AsignaDisplayFormat(QMProOrdMatCompra, MascaraN, MascaraI, ShortDateFormat);

  // Máscara Tareas
  AsignaDisplayFormat(QMProOrdTarea, MascaraN, MascaraI, ShortDateFormat);
  QMProOrdTareaTIEMPO.DisplayFormat := ',##0.000';
  QMProOrdTareaTIEMPO_UTIL.DisplayFormat := ',##0.000';

  // Mascaras
  AsignaDisplayFormat(QMProOrd, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  xInfoActualizadaMARGEN_UNI_CIEN.DisplayFormat := MascaraP;
  AsignaDisplayFormat(xInfoIncMaterial, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xCostesTOrden, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProOrdMat, MascaraN, MascaraI, ShortDateFormat);

  ControlaStockNegativo := DMMain.ControlStockNegativoEmpresa;

  OrdenesRealizables := TStringList.Create;
  ComprobarValorDefecto;

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, ');
  SQLBase.Add(' ALMACEN_SAL, ALMACEN_LAN, ALMACEN_ENT, FECHA_ORD, CLIENTE, ');
  SQLBase.Add(' COMPUESTO, TITULO, TIPO_ESC, ESCANDALLO, TITULO_2, TIPO_ESC_2, ESCANDALLO_2, ESTADO, PEDIDO, LINEA_PED, ');
  SQLBase.Add(' FECHA_PED, UNI_PEDID, UNI_MANUAL, UNI_TOTAL, PRIORIDAD, MERMA, ');
  SQLBase.Add(' UNI_PRODUC, UNI_PENDIENTES, FECHA_ENTREGA, FECHA_INI, FECHA_FIN, ');
  SQLBase.Add(' COSTE_FIJO_REAL, PRECIO_VENTA, OBSERVACIONES, VISTOBUENO1, ');
  SQLBase.Add(' VISTOBUENO2, VISTOBUENO3, SITUACION, ENTRADA, ID_ORDEN, ');
  SQLBase.Add(' TIPO_LANZAMIENTO, ID_ORDEN_MAT, TIPO_RESERVA, ISO_APROBADO, ');
  SQLBase.Add(' ISO_VERIFICADO, ISO_VALIDADO, ID_A, PADRE_SUBORDEN, ');
  SQLBase.Add(' CONT_SUBORDEN, REFERENCIA, ID_DESPIECE, ID_ORDEN_SUBORDEN, ');
  SQLBase.Add(' SELECCIONADA, PREVALECE_ALM_ORDEN, CERRAR_SUBORDENES, ');
  SQLBase.Add(' IMPORTAR_OP, CASO_OP, RESERVA_STOCK_OP, MEDIDA_1, MEDIDA_2, ');
  SQLBase.Add(' MEDIDA_3, MEDIDA_4, DESACTIVA_TRIGGER, RESPONSABLE, ');
  SQLBase.Add(' COMPUESTOS_VIRTUALES, SEGUIR_SIN_STOCK, RECUPERADO_MARCAJE, ');
  SQLBase.Add(' UNI_FABRICADAS, PLANIFICACION, LINEA_PLANIFICACION, ');
  SQLBase.Add(' ID_PLANIFICACION, ID_PLANIFICACION_DET, ID_UBICACION, ');
  SQLBase.Add(' ID_MOV_STOCK_RESERVA, UNIDAD, DIF_COSTE_MERMA, COPIAS_PMP, ');
  SQLBase.Add(' VERSION_ORDEN, ID_LOTE, DESC_LOTE, ID_LOTE_RESERVA, DESC_LOTE_RESERVA, ');
  SQLBase.Add(' RESERVA, CANT_RESERVAR, ESTADO_RESERVA, PROYECTO, DECIMALES_MASCARA, ');
  SQLBase.Add(' TITULO_CLIENTE, SERIALIZADO, LOTEABLE, ESTADO_FIRMA_ISO_APROBADO, ');
  SQLBase.Add(' ESTADO_FIRMA_ISO_VERIFICADO, ESTADO_FIRMA_ISO_VALIDADO, ');
  SQLBase.Add(' URGENTE, SIN_LONA, SIN_HERRAJE, SIN_MOTOR, SIN_ROTULACION, RETENIDO_COMERCIAL ');
  SQLBase.Add(' FROM VER_PRO_ORD ');

  SQLFind := TStringList.Create;
  SQLFind.Text := SQLBase.Text;
  SQLFind.Add(' WHERE ');
  SQLFind.Add(' EMPRESA = :EMPRESA AND ');
  SQLFind.Add(' CANAL = :CANAL AND ');
  SQLFind.Add(' SERIES = :SERIE AND ');
  SQLFind.Add(' EJERCICIO >= :EJERCICIO -1 ');
  SQLFind.Add(' ORDER BY ID_ORDEN, FECHA_ORD ');

  with QMProOrd do
  begin
     SelectSQL.Text := SQLFind.Text;

     RefreshSQL.Text := SQLBase.Text;
     RefreshSQL.Add(' WHERE ');
     RefreshSQL.Add(' EMPRESA = :EMPRESA AND ');
     RefreshSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     RefreshSQL.Add(' CANAL = :CANAL AND ');
     RefreshSQL.Add(' SERIES = :SERIES AND ');
     RefreshSQL.Add(' RIG_OF = :RIG_OF ');
  end;

  DMMain.FiltraTabla(QMProOrd, '11110', False);
  DMMain.FiltraTabla(QMProOrdG, '11110', False);

  // Solo ordenes activas (SITUACION <> 4).
  FiltroSituacion := 5;
end;

procedure TProDMOrden.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
  SQLFind.Free;
  OrdenesRealizables.Free;
end;

procedure TProDMOrden.QMProOrdAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdAfterOpen');
  xInfoActualizada.Open;
  DMMain.LogFin('QMProOrdAfterOpen');
end;

function TProDMOrden.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMProOrd, '10100');
  with QMProOrd do
  begin
     if (Result = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLFind.Text;
        DMMain.FiltraTabla(QMProOrd, '11110', True);
     end;

     // Después de buscar voy al último registro
     Last;
  end;
end;

procedure TProDMOrden.QMProOrdNewRecord(DataSet: TDataSet);
begin
  QMProOrdEMPRESA.AsInteger := REntorno.Empresa;
  QMProOrdEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProOrdCANAL.AsInteger := REntorno.Canal;
  QMProOrdSERIES.AsString := Serie;
  QMProOrdFECHA_ORD.AsDateTime := REntorno.FechaTrab;
  QMProOrdFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMProOrdFECHA_INI.AsDateTime := REntorno.FechaTrab;
  QMProOrdESCANDALLO.AsInteger := 0;
  QMProOrdESCANDALLO_2.AsInteger := 0;
  QMProOrdTIPO_ESC.AsString := 'EPR';
  QMProOrdTIPO_ESC_2.AsString := 'EPR';
  QMProOrdALMACEN_SAL.AsString := REntorno.AlmacenDefecto;
  QMProOrdALMACEN_LAN.AsString := REntorno.AlmacenDefecto;
  QMProOrdALMACEN_ENT.AsString := REntorno.AlmacenDefecto;
  QMProOrdSUBORDEN.AsInteger := 0;
  QMProOrdRECUPERADO_MARCAJE.AsInteger := 0;

  QMProOrdUNI_MANUAL.AsFloat := 1;
  QMProOrdUNI_FABRICADAS.AsFloat := 0;

  QMProOrdISO_APROBADO.AsInteger := 0;
  QMProOrdISO_VERIFICADO.AsInteger := 0;
  QMProOrdISO_VALIDADO.AsInteger := 0;
  QMProOrdCLIENTE.AsInteger := -1;

  // sfg.albert - Es posa el empleado assignat a l'usuari com a responsable de l'OF
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPLEADO FROM SYS_USUARIOS WHERE USUARIO = ?USUARIO';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        QMProOrdRESPONSABLE.AsInteger := FieldByName['EMPLEADO'].AsInteger;
     finally
        Free;
     end;
  end;

  // Leer valores por defecto de Configuración (Útiles)
  ValoresDefectoProConstantes;
  // ProFMOrden.CargaDatos;
  // sfg.albert
  QMProOrdCOPIAS_PMP.AsInteger := 1;
end;

procedure TProDMOrden.QMProOrdCOMPUESTOChange(Sender: TField);
begin
  // Busco y selecciono el escandallo por defecto y sus almacenes
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(1) ESCANDALLO, MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4 ');
        SQL.Add(' FROM PRO_ESCANDALLO ');
        SQL.Add(' WHERE EMPRESA = ?EMPRESA AND COMPUESTO = ?COMPUESTO AND TIPO = ''EPR'' AND ESTADO = 1 ');
        SQL.Add(' ORDER BY DEFECTO DESC, ESCANDALLO ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPUESTO'].AsString := QMProOrdCOMPUESTO.AsString;
        ExecQuery;
        QMProOrdESCANDALLO.AsInteger := FieldByName['ESCANDALLO'].AsInteger;
        // sfg.albert - Es comproba si es permet el volcat de les medides o no
        if (DMMain.DameConstanteProduccion('ESC_TRASPASAR_MEDIDAS_OF') = 1) then
        begin
           QMProOrdMEDIDA_1.AsFloat := FieldByName['MEDIDA_1'].AsFloat;
           QMProOrdMEDIDA_2.AsFloat := FieldByName['MEDIDA_2'].AsFloat;
           QMProOrdMEDIDA_3.AsFloat := FieldByName['MEDIDA_3'].AsFloat;
           QMProOrdMEDIDA_4.AsFloat := FieldByName['MEDIDA_4'].AsFloat;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdUNI_MANUALChange(Sender: TField);
begin
  if QMProOrd.State in [dsEdit, dsInsert] then
  begin
     QMProOrdUNI_TOTAL.AsFloat := QMProOrdUNI_PEDID.AsFloat + QMProOrdUNI_MANUAL.AsFloat;
     QMProOrdUNI_PENDIENTES.AsFloat := QMProOrdUNI_PEDID.AsFloat + QMProOrdUNI_MANUAL.AsFloat;
  end;
end;

procedure TProDMOrden.QMProOrdFasesTIPOFASEChange(Sender: TField);
begin
  if QMProOrdFases.State in [dsEdit, dsInsert] then
     QMProOrdFasesFase.Value := DameTituloFase(QMProOrdFasesTIPOFASE.AsString);
end;

procedure TProDMOrden.QMProOrdMatNewRecord(DataSet: TDataSet);
begin
  if (QMProOrdFasesLINEA_FASE.AsInteger = 0) then
  begin
     // raise Exception.Create('Debe de especificarse la fase a la que se imputa el material.');
     ShowMessage(_('Debe de especificarse la fase a la que se imputa el material.'));
  end
  else
  begin
     QMProOrdMatEMPRESA.Value := QMProOrdFasesEMPRESA.AsInteger;
     QMProOrdMatEJERCICIO.Value := QMProOrdFasesEJERCICIO.AsInteger;
     QMProOrdMatCANAL.Value := QMProOrdFasesCANAL.AsInteger;
     QMProOrdMatSERIES.Value := QMProOrdFasesSERIES.AsString;
     QMProOrdMatRIG_OF.Value := QMProOrdFasesRIG_OF.Value;
     QMProOrdMatSUBORDEN.Value := QMProOrdFasesSUBORDEN.Value;
     QMProOrdMatLINEA_FASE.Value := QMProOrdFasesLINEA_FASE.Value;
     QMProOrdMatID_ORDEN.Value := QMProOrdFasesID_ORDEN.Value;

     // nº de linea
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA_MAT) FROM PRO_ORD_MAT ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIES = ?SERIES AND ');
           SQL.Add(' RIG_OF = ?RIG_OF ');
           Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
           Params.ByName['SERIES'].AsString := QMProOrdSERIES.AsString;
           Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
           ExecQuery;
           QMProOrdMatLINEA_MAT.AsInteger := FieldByName['MAX'].AsInteger + 1;
           QMProOrdMatORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Almacen
     QMProOrdMatALMACEN.AsString := QMProOrdALMACEN_LAN.AsString;
     QMProOrdMatALMACEN_SAL.AsString := QMProOrdALMACEN_SAL.AsString;
  end;
end;

procedure TProDMOrden.QMProOrdFasesNewRecord(DataSet: TDataSet);
begin
  // Tan les fases com les tareas, quan es crea una fase no hauria de tenir
  // ejercici, ja que si es crea una OF el 2009 i el segueix el 2010 creant una nova fase,
  // aquesta donarà error perquè és diferent de l'OF

  QMProOrdFasesEMPRESA.AsInteger := QMProOrdEMPRESA.AsInteger;
  QMProOrdFasesEJERCICIO.AsInteger := QMProOrdEJERCICIO.AsInteger;
  QMProOrdFasesCANAL.AsInteger := QMProOrdCANAL.AsInteger;
  QMProOrdFasesSERIES.AsString := QMProOrdSERIES.AsString;
  QMProOrdFasesRIG_OF.AsInteger := QMProOrdRIG_OF.Value;
  QMProOrdFasesSUBORDEN.AsInteger := QMProOrdSUBORDEN.Value;
  QMProOrdFasesDIBUJO.AsString := ' ';
  QMProOrdFasesENTRADA.AsInteger := REntorno.Entrada;
  QMProOrdFasesID_FASE_ESC.AsInteger := 0;

  // nº de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA_FASE) MAX_LINEA, MAX(ORDEN) MAX_ORDEN FROM PRO_ORD_FASES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIES = ?SERIES AND ');
        SQL.Add(' RIG_OF = ?RIG_OF ');
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
        Params.ByName['SERIES'].AsString := QMProOrdSERIES.AsString;
        Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
        ExecQuery;
        QMProOrdFasesLINEA_FASE.AsInteger := FieldByName['MAX_LINEA'].AsInteger + 1;
        QMProOrdFasesORDEN.AsInteger := FieldByName['MAX_ORDEN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProOrdFasesCANTIDAD_ENTRADA.AsFloat := DameCantTerminada(QMProOrdFasesLINEA_FASE.AsInteger - 1);
  QMProOrdFasesCANTIDAD_TERMINADA.AsFloat := 0;
end;

procedure TProDMOrden.QMProOrdTareaNewRecord(DataSet: TDataSet);
begin
  if (QMProOrdFasesLINEA_FASE.AsInteger = 0) then
  begin
     // raise Exception.Create('Debe de especificarse la fase a la que se imputa la tarea.');
     ShowMessage(_('Debe de especificarse la fase a la que se imputa la tarea.'));
  end
  else
  begin
     QMProOrdTareaEMPRESA.Value := QMProOrdFasesEMPRESA.AsInteger;
     QMProOrdTareaEJERCICIO.Value := QMProOrdFasesEJERCICIO.AsInteger;
     QMProOrdTareaCANAL.Value := QMProOrdFasesCANAL.AsInteger;
     QMProOrdTareaSERIE.Value := QMProOrdFasesSERIES.AsString;
     QMProOrdTareaRIG_OF.Value := QMProOrdFasesRIG_OF.Value;
     QMProOrdTareaSUBORDEN.Value := QMProOrdFasesSUBORDEN.Value;
     QMProOrdTareaLINEA_FASE.Value := QMProOrdFasesLINEA_FASE.Value;
     QMProOrdTareaID_UTILLAJE.Value := '000';
     QMProOrdTareaOPERACIONES_NUM.AsInteger := 1;
     QMProOrdTareaOPERACIONES_TIEMPO.AsInteger := 3600;
     QMProOrdTareaSECCION.Value := 'DES';
     QMProOrdTareaORDEN_OF.AsInteger := 0;

     // nº de linea
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA_TAREA) FROM PRO_ORD_TAREA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' RIG_OF = ?RIG_OF ');
           Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMProOrdSERIES.AsString;
           Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
           ExecQuery;
           QMProOrdTareaLINEA_TAREA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           QMProOrdTareaORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdTareaRECURSOChange(Sender: TField);
begin
  QMProOrdTareaDescrRecurso.Text := DameTituloRecurso(QMProOrdTareaRECURSO.AsString);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PRECIO_RECURSO(:EMPRESA, :RECURSO, :FECHA)';
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['RECURSO'].AsString := QMProOrdTareaRECURSO.AsString;
        Params.ByName['FECHA'].AsDateTime := QMProOrdFECHA_ORD.AsDateTime;
        ExecQuery;
        QMProOrdTareaPRE_COS_UNI_PRE.AsFloat := FieldByName['PRECIO_EST'].AsFloat;
        QMProOrdTareaOPERACIONES_NUM.AsInteger := FieldByName['OPERACIONES_NUM'].AsInteger;
        QMProOrdTareaOPERACIONES_TIEMPO.AsInteger := FieldByName['OPERACIONES_TIEMPO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdMatALMACENChange(Sender: TField);
begin
  QMProOrdMatDescrAlmacen.AsString := DameTituloAlmacen(QMProOrdMatALMACEN.AsString);
end;

procedure TProDMOrden.QMProOrdMatCOMPONENTEChange(Sender: TField);
begin
  // Si no encuentra ninguna equivalencia, no pone ningun valor
  xSeleccEquival.Open;
  if (xSeleccEquivalID_EQUIVAL.Value <> 0) then
     QMProOrdMatID_EQUIVAL.AsInteger := xSeleccEquivalID_EQUIVAL.AsInteger
  else
     QMProOrdMatID_EQUIVAL.Clear;
  xSeleccEquival.Close;

  if QMProOrdMat.State in [dsEdit, dsInsert] then
  begin
     with THYFIBQuery.Create(Self) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT P_COSTE, UNIDADES FROM ART_ARTICULOS WHERE ARTICULO = ?ARTICULO AND EMPRESA = ?EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := QMProOrdMatCOMPONENTE.AsString;
           ExecQuery;
           QMProOrdMatPRE_COS_UNI.AsFloat := FieldByName['P_COSTE'].AsFloat;
           QMProOrdMatUNIDAD_ART.AsString := FieldByName['UNIDADES'].AsString;
           QMProOrdMatUNIDAD_FAB.AsString := FieldByName['UNIDADES'].AsString;
        finally
           Free;
        end;
     end;
  end;

  QMProOrdMatID_A.AsInteger := DameIDArticulo(QMProOrdMatCOMPONENTE.AsString);
end;

procedure TProDMOrden.QMProOrdMatUNIDADES_NECChange(Sender: TField);
begin
  QMProOrdMatTotal_var.Value := QMProOrdMatUnidades_nec.Value * QMProOrdMatPre_Cos_Uni.Value;
  QMProOrdMatTotal.Value := QMProOrdMatTotal_var.Value + QMProOrdMatPrecio_Fijo.Value;
end;

procedure TProDMOrden.QMProOrdMatPRE_COS_UNIChange(Sender: TField);
begin
  QMProOrdMatTOTAL_VAR.Value := QMProOrdMatUNIDADES_PREV.Value * QMProOrdMatPRE_COS_UNI.Value;
  QMProOrdMatTOTAL.Value := QMProOrdMatTOTAL_VAR.Value + QMProOrdMatPRECIO_FIJO.Value;
end;

procedure TProDMOrden.QMProOrdMatPRECIO_FIJOChange(Sender: TField);
begin
  QMProOrdMatTOTAL.Value := QMProOrdMatTOTAL_VAR.Value + QMProOrdMatPRECIO_FIJO.Value;
end;

procedure TProDMOrden.QMProOrdTareaTIPOTAREAChange(Sender: TField);
begin
  if (QMProOrdTarea.State in [dsEdit, dsInsert]) then
     QMProOrdTareaTAREA.AsString := DameTituloTarea(QMProOrdTareaTIPOTAREA.AsString);
end;

function TProDMOrden.CalculaTotalVarPre_Tarea: double;
begin
  // Calculamos el total previsto de la tarea en funcion del Rendimiento de la operacion
  if (QMProOrdTareaOPERACIONES_NUM.AsInteger <> 0) then
     Result := (QMProOrdTareaCANTIDAD.Value * QMProOrdTareaPRE_COS_UNI_PRE.Value *
        (QMProOrdTareaOPERACIONES_TIEMPO.AsInteger / QMProOrdTareaOPERACIONES_NUM.AsInteger)) / 3600
  else
     Result := 0;
end;

function TProDMOrden.CalculaTotalPre_Tarea: double;
begin
  Result := QMProOrdTareaTOTAL_VAR_PRE.Value + QMProOrdTareaPRECIO_FIJO_PRE.Value;
end;

procedure TProDMOrden.QMProOrdTareaCANTIDADChange(Sender: TField);
begin
  if (not ModTiempo) then
     CalculaTiempo;

  QMProOrdTareaTOTAL_VAR_PRE.Value := CalculaTotalVarPre_Tarea;
  QMProOrdTareaTOTAL_PRE.Value := CalculaTotalPre_Tarea;
end;

procedure TProDMOrden.QMProOrdTareaTIEMPOChange(Sender: TField);
begin
  ModTiempo := True;
  CalculaTiempo;
  ModTiempo := False;
end;

procedure TProDMOrden.QMProOrdTareaPRE_COS_UNI_PREChange(Sender: TField);
begin
  QMProOrdTareaTOTAL_VAR_PRE.Value := CalculaTotalVarPre_Tarea;
  QMProOrdTareaTOTAL_PRE.Value := CalculaTotalPre_Tarea;
end;

procedure TProDMOrden.QMProOrdTareaPRECIO_FIJO_PREChange(Sender: TField);
begin
  QMProOrdTareaTOTAL_PRE.Value := CalculaTotalPre_Tarea;
end;

procedure TProDMOrden.QMProOrdTareaESTADOChange(Sender: TField);
begin
  if (QMProOrdTareaESTADO.AsInteger = 1) then
     QMProOrdTareaFECHA_FIN_TAREA.AsDateTime := REntorno.FechaTrab
  else
     QMProOrdTareaFECHA_FIN_TAREA.Clear;
end;

procedure TProDMOrden.QMProOrdFasesESTADOChange(Sender: TField);
begin
  if (QMProOrdFasesESTADO.AsInteger = 1) then
     QMProOrdFasesFECHA_FIN_FASE.AsDateTime := REntorno.FechaTrab
  else
     QMProOrdFasesFECHA_FIN_FASE.Clear;
end;

procedure TProDMOrden.QMProOrdAfterScroll(DataSet: TDataSet);
var
  Mascara : string;
begin
  if (not Posicionando) then
  begin
     DMMain.LogIni('QMProOrdAfterScroll');
     if (QMProOrdG.Active) and (HayBookmark) then
     begin
        HayBookmark := False;
        QMProOrdG.Bookmark := QMProOrd.Bookmark;
     end
     else
        HayBookmark := True;

     // Cambia máscara a xInfoActualizada
     Mascara := QMProOrdMASCARA_UNIDADES_COMPUESTO.AsString;
     if (xInfoActualizadaUNI_PEDID.DisplayFormat <> Mascara) then
     begin
        xInfoActualizadaUNI_PEDID.DisplayFormat := Mascara;
        xInfoActualizadaUNI_MANUAL.DisplayFormat := Mascara;
        xInfoActualizadaUNI_TOTAL.DisplayFormat := Mascara;
        xInfoActualizadaUNI_PRODUC.DisplayFormat := Mascara;
        xInfoActualizadaUNI_PENDIENTES.DisplayFormat := Mascara;
        xInfoActualizadaUNIDADES_RESERVADAS.DisplayFormat := Mascara;

        // Cambia máscara a QMProOrd
        QMProOrdUNI_PEDID.DisplayFormat := Mascara;
        QMProOrdUNI_MANUAL.DisplayFormat := Mascara;
        QMProOrdUNI_TOTAL.DisplayFormat := Mascara;
        QMProOrdUNI_PRODUC.DisplayFormat := Mascara;
        QMProOrdUNI_PENDIENTES.DisplayFormat := Mascara;
        QMProOrdMatUNIDADES_STOCK.DisplayFormat := Mascara;
        QMProOrdMatUNIDADES_FAB.DisplayFormat := Mascara;
        QMProOrdMatUNIDADES_NEC.DisplayFormat := Mascara;
        QMProOrdMatUNIDADES_UTIL.DisplayFormat := Mascara;
        QMProOrdMatUNIDADES_PREV.DisplayFormat := Mascara;
     end;
     DMMain.LogFin('QMProOrdAfterScroll');
  end;
end;

procedure TProDMOrden.SituacionSiguiente(ForzarReserva: boolean = False);
var
  Situacion : integer;

  IdOrden : integer;

  ReservaStockOP : boolean;
  Seguir : boolean;
  FMIntroduceDatosCierre : TProFMIntroduceDatosCierre;
  FMIntroduceDatosReserva : TProFMIntroduceDatosReserva;

  IdLote, IdUbicacion : integer;
  EscandalloActivo : boolean;

  procedure MarcarSeguirSinStock(IdOrden: integer);
  begin
     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.DataBase;
           Close;
           SQL.Text := 'UPDATE PRO_ORD SET SEGUIR_SIN_STOCK = 1 WHERE ID_ORDEN = ' + IntToStr(IdOrden);
           ExecQuery;
           Close;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  procedure LlenarSerializacion(IdOrden, Tipo: integer);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_SERIALIZACION_COMPONENTE(:ID_ORDEN, :TIPO)';
           Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
           Params.ByName['TIPO'].AsInteger := Tipo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  procedure BorrarSerializacion(IdOrden, Tipo: integer);
  begin
     // Borra depenent de l'estat en què estigui l'OP: Si estat=0, borra compostos i sinó component
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM PRO_SERIALIZACION_ORDEN WHERE ID_ORDEN = :ID_ORDEN AND TIPO = :TIPO';
           Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
           Params.ByName['TIPO'].AsInteger := Tipo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  DMMain.LogIni('SituacionSiguiente');

  Situacion := QMProOrdSITUACION.AsInteger;
  IdOrden := QMProOrdID_ORDEN.AsInteger;
  IdReserva := 0;
  ReservaStockOP := False;
  EscandalloActivo := True;

  // Si esta deslanzada o lanzada o si estamos forzando una nueva reserva
  if (((Situacion < 2) or (ForzarReserva)) and (QMProOrdESCANDALLO.AsInteger <> 0)) then
  begin
     // Comprobamos que el escandallo esté activo si estamos lanzando o reservando
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ESTADO FROM PRO_ESCANDALLO WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = ''EPR'' ';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMProOrdESCANDALLO.AsInteger;
           ExecQuery;
           EscandalloActivo := (FieldByName['ESTADO'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (not EscandalloActivo) then
     raise Exception.Create(_('ERROR: El escandallo asignado a esta OF esta en estado NO ACTIVO u OBSOLETO.' + #13#10 + 'Debe estar ACTIVO'));

  FMIntroduceDatosCierre := TProFMIntroduceDatosCierre.Create(Self);
  FMIntroduceDatosReserva := TProFMIntroduceDatosReserva.Create(Self);
  try
     if (DMMain.EstadoKRI(284) = 1) then
     begin
        // Aqui se crea el lote del compuesto si no lo tiene.
        // Si hay al menos un componente sin stock se mostrara y preguntara

        // if ((ControlaStockNegativo) and ((Situacion = 1) or ((Situacion <= 3) and ForzarReserva)) and (ComprobarStock(True))) then
        if ((Situacion < 2) or (ForzarReserva)) then
        begin
           // S'assigna el lot nou i tot seguit es crea.
           if ((QMProOrdID_LOTE.AsInteger = 0) or (QMProOrdID_UBICACION.AsInteger = 0)) then
           begin
              IdLote := 0;
              IdUbicacion := 0;

              if ((QMProOrdID_LOTE.AsInteger = 0) and
                 (ArticuloLoteable(QMProOrdCOMPUESTO.AsString))) then
                 IdLote := CrearLoteCompuesto
              else
                 IdLote := QMProOrdID_LOTE.AsInteger;

              // Selecciono una ubicacion del almacén donde entrará el compuesto una vez acabada la producción.
              if ((QMProOrdID_UBICACION.AsInteger = 0) and
                 (DMMain.CompruebaControlUbicacionAlmacen(QMProOrdALMACEN_ENT.AsString)) and
                 (ArticuloUbicable(QMProOrdCOMPUESTO.AsString))) then
                 IdUbicacion := DameIDUbicacionGeneral(QMProOrdALMACEN_ENT.AsString)
              else
                 IdUbicacion := QMProOrdID_UBICACION.AsInteger;

              if (IdLote <> 0) then
              begin
                 with THYFIBQuery.Create(Self) do
                 begin
                    try
                       Database := DMMain.DataBase;
                       Close;
                       SQL.Add(' UPDATE OR INSERT INTO PRO_ORD_LOTE ( ');
                       SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, RIG_OF, ID_LOTE, CANTIDAD) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG_OF, :ID_LOTE, :CANTIDAD) ');
                       SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, SERIE, RIG_OF, ID_LOTE) ');
                       Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
                       Params.ByName['SERIE'].AsString := QMProOrdSERIES.AsString;
                       Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
                       Params.ByName['ID_LOTE'].AsInteger := IdLote;
                       Params.ByName['CANTIDAD'].AsFloat := QMProOrdUNI_TOTAL.AsFloat;
                       ExecQuery;
                       Close;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           end;
        end; // fin ControlaStockNegativo
     end;

     // Es creen els registres per assignar les series als components i compostos, si
     // algun dels seus articles té serialització standard
     if (PermitirIntroducirDatosCierre) then
     begin
        case Situacion of
           0: // Creada -> Lanzada
              LlenarSerializacion(IdOrden, 1); // Compuesto
           1: // Lanzada -> Reservada
              LlenarSerializacion(IdOrden, 2); // Componente
        end;

        if ((Situacion = 1) or ForzarReserva) then
           FMIntroduceDatosReserva.FiltraSituacion(Situacion, ForzarReserva)
        else
           FMIntroduceDatosCierre.FiltraSituacion(Situacion);
     end;

     if (ControlaStockNegativo) then
     begin
        Seguir := True;
        if (PermitirIntroducirDatosCierre) then
        begin
           if ((Situacion = 1) or ForzarReserva) then
           begin
              IdReserva := FMIntroduceDatosReserva.DameIdReserva;
              Seguir := (IdReserva > 0);
           end
           else
              Seguir := FMIntroduceDatosCierre.DameCierre;
        end;

        if (Seguir) then
        begin
           Seguir := False;
           ProFMMostrarStock := TProFMMostrarStock.Create(Self);
           try
              if (ProFMMostrarStock.ShowModal = mrOk) then
              begin
                 MarcarSeguirSinStock(IdOrden);
                 // Segun si está marcada la reserva, creo+reservo o solamente creo
                 ReservaStockOP := (QMProOrdRESERVA_STOCK_OP.AsInteger = 1);
                 Seguir := True;
              end
           finally
              ProFMMostrarStock.Free;
           end;
        end;
     end // ControlaStockNegativo = True
     else
     begin
        Seguir := True;
        if (PermitirIntroducirDatosCierre) then
        begin
           if ((Situacion = 1) or ForzarReserva) then
           begin
              IdReserva := FMIntroduceDatosReserva.DameIdReserva;
              Seguir := (IdReserva > 0);
           end
           else
              Seguir := FMIntroduceDatosCierre.DameCierre;

           if (Seguir) then
           begin
              // Segun si esta marcada la reserva, creo+reservo o solamente creo
              ReservaStockOP := (QMProOrdRESERVA_STOCK_OP.AsInteger = 1);
           end
           else // Si fas cancel al formulari ProFMIntroduceDatosCierre
           begin
              if (Situacion = 0) then // Deslanzada->Lanzada
              begin
                 BorrarSerializacion(IdOrden, 1); // Compuesto
              end;
              if (Situacion = 1) then // Lanzada->Reservada
              begin
                 BorrarSerializacion(IdOrden, 2); // Componente
              end;
           end;
        end
        else
        begin
           // Si estoy reservando y no se desea mostrar el dialogo de reservas.
           if ((Situacion = 1) or ForzarReserva) then
           begin
              AbreData(TProDMIntroduceDatosReserva, ProDMIntroduceDatosReserva);
              try
                 IdReserva := ProDMIntroduceDatosReserva.CreaRegistroReserva;
                 Seguir := (IdReserva > 0);
              finally
                 CierraData(ProDMIntroduceDatosReserva);
              end;
           end;

           // Segun si esta marcada la reserva, creo+reservo o solamente creo
           ReservaStockOP := (QMProOrdRESERVA_STOCK_OP.AsInteger = 1);
        end;
     end; // ControlaStockNegativo = False

     if (Seguir) then
     begin
        {Se realiza en procedimiento PRO_LANZAR_ORDEN
         if (Situacion = 0) then
            TraspasoTipoLanzamientos(ProFMOrden.RGImportar.ItemIndex * 100 + ProFMOrden.RGCaso.ItemIndex * 10);
        }
        if (ForzarReserva) then
           Situacion := 1;

        Screen.Cursor := crHourGlass;
        try
           case Situacion of
              // Lanzar
              0:
              begin
                 Lanzar(ProFMOrden.RGImportar.ItemIndex * 100 + ProFMOrden.RGCaso.ItemIndex * 10);
                 CalculaFormulas(IdOrden);
              end;

              // Reservar
              1: Reservar;

              // Desde "Reservado" a "Cerrado"
              2: Cerrar;

              // Desde "Cierrado Parcialmente" a "Cerrado"
              3: Cerrar;
           end;
        finally
           Screen.Cursor := crDefault;
        end;

        // Fuerzo refresco sobre esta orden que ahora debe estar lanzada
        FiltroSituacion := -1; // Todas las situaciones
        FiltraOrdenes(False); // Aplico filtro pero mantego cerrado dataset
        PosicionaIdOrden(IdOrden);

        if (Situacion = 0) and (ReservaStockOP) then
        begin
           // Esto reserva la orden
           SituacionSiguiente;
        end
        else
        begin
           FuerzaRefrescoRealizable(IDOrden);
        end;
     end
     else
        QMPRoOrd.Refresh;
  finally
     FMIntroduceDatosReserva.Free;
     FMIntroduceDatosCierre.Free;
  end;

  RefrescaStock;

  DMMain.LogFin('SituacionSiguiente');
end;

procedure TProDMOrden.SituacionAnterior;
var
  Situacion : integer;
  CantidadReservas, IdReserva : integer;
  TieneCierreParcial : boolean;
  InfoReservas : TProFMInfoReservas;
begin
  DMMain.LogIni('SituacionAnterior');

  Situacion := QMProOrdSITUACION.AsInteger;

  TieneCierreParcial := True;
  if ((Situacion = 3) or (Situacion = 4)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST 1 EMPRESA FROM PRO_ORD_CIERRE_PARCIAL_DET WHERE ID_ORDEN = :ID_ORDEN';
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           ExecQuery;
           TieneCierreParcial := (FieldByName['EMPRESA'].AsInteger <> 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  case Situacion of
     // Deslanzar
     1:
     begin
        // Es comproba qu eno tingui imputacions de compres. Si es així, no es pot desllançar
        if (HayCompras) then
           ShowMessage(_('Esta OF contiene imputaciones de compras. No se puede deslanzar'))
        else
        if (Application.MessageBox(PChar(string(_('Si deslanza la OF, borrará todos los marcajes imputados a la orden' + #13#10 +
           'y desasignará los lotes de los componentes y del compuesto. Desea deslanzar la orden actual?'))), PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE PRO_DESLANZAR_ORDEN(:ID_ORDEN, :ENTRADA)';
                 Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
     // Desreserva
     2:
     begin
        // Cuento las reservas que tiene.
        // Si tiene una, la desreservo.
        // Si tiene muchas, pregunto cual quiere desreservar.
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT COUNT(EMPRESA), MIN(ID_RESERVA) FROM PRO_ORD_RESERVA WHERE ID_ORDEN = :ID_ORDEN';
              Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
              ExecQuery;
              CantidadReservas := FieldByName['COUNT'].AsInteger;
              IdReserva := FieldByName['MIN'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (CantidadReservas > 1) then
        begin
           // MessageDlg(_('Hay multiples reservas. Deberá seleccionar una'), mtInformation, [mbOk], 0)
           InfoReservas := TProFMInfoReservas.Create(Self);
           InfoReservas.Reservas(QMProOrdID_ORDEN.AsInteger);
           InfoReservas.ShowModal;
        end
        else
        begin
           if MessageDlg(_('Se eliminará el mov. stock de reserva. Desea continuar?'),
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' EXECUTE PROCEDURE PRO_DESRESERVAR_ORDEN(:ID_ORDEN, :ENTRADA, :ID_RESERVA) ');
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
                    Params.ByName['ID_RESERVA'].AsInteger := IdReserva;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end;
     // Abre
     3:
     begin
        if ((not TieneCierreParcial) or (MessageDlg(_('Se eliminaran el mov. stock generados.' + #13#10 + 'Desea deshacer el cierre total de la orden?'),
           mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE PRO_ORD ');
                 SQL.Add(' SET ');
                 SQL.Add(' SITUACION = ?SITUACION, ');
                 SQL.Add(' ENTRADA = ?ENTRADA ');
                 SQL.Add(' WHERE ID_ORDEN = ?ID_ORDEN ');
                 Params.ByName['SITUACION'].AsInteger := Situacion - 1;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           { TODO : Aqui hay que ver si hay reservas. Si no las hay, hay que hacer un update con SITUACION = 1. *** NO HAY QUE LLAMAR A SituacionAnterior() porque al no haber reserva, dará un error. }
        end;
     end;
     4:
     begin
        if MessageDlg(_('Se eliminaran el mov. stock generados.' + #13#10 + ' Desea deshacer el cierre total de la orden?'),
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE PRO_ORD ');
                 SQL.Add(' SET ');
                 SQL.Add(' SITUACION = ?SITUACION, ');
                 SQL.Add(' ENTRADA = ?ENTRADA ');
                 SQL.Add(' WHERE ID_ORDEN = ?ID_ORDEN ');
                 Params.ByName['SITUACION'].AsInteger := Situacion - 1;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
           // Para evitar que vuelva a entrar para deshacer el cierre parcial.
           Situacion := 0;
     end;
  end;

  // Si estaba "Cerrada Totalmente" y abro la orden, verifico si tiene "Cierre Parciales".
  // Si no tiene retrocedo un estado para dejarla como "Reservada".
  if ((Situacion = 4) and (not TieneCierreParcial)) then
  begin
     // Refresco los datos de este registro
     QMProOrd.Refresh;
     // Aqui la SITUACION debería ser 3
     SituacionAnterior;
  end
  else
  begin
     PosicionaIdOrden(QMProOrdID_ORDEN.AsInteger);

     { TODO : Esto no tiene sentido, porque MarcaRecuperado solo actua si SITUACION = 1 }
     if (QMProOrdSITUACION.AsInteger = 0) then
        MarcaRecuperado(False);
  end;

  RefrescaStock;

  DMMain.LogFin('SituacionAnterior');
end;

procedure TProDMOrden.QMProOrdFasesBeforeInsert(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdMatBeforeInsert(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdTareaBeforeInsert(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdFasesBeforeEdit(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdMatBeforeEdit(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdTareaBeforeEdit(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdFasesBeforeDelete(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdTareaBeforeDelete(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdMatBeforeDelete(DataSet: TDataSet);
begin
  VerificaEstadoOrden;
end;

procedure TProDMOrden.QMProOrdBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMProOrdRIG_OF.AsInteger := DMMain.Contador_EECS(Serie, 'ZOR');

  QMProOrdENTRADA.AsInteger := REntorno.Entrada;

  // Verifico la ubicacion. Asigno la que tiene segun prioridad el articulo o la generica del almacen.
  if (QMProOrd.State in [dsEdit, dsInsert]) then
  begin
     // Si el almacen es ubicable
     if (DMMain.CompruebaControlUbicacionAlmacen(QMProOrdALMACEN_ENT.AsString)) then
     begin
        if (QMProOrdID_A.AsInteger = 0) then
           QMProOrdID_A.AsInteger := DameIDArticulo(QMProOrdCOMPUESTO.AsString);

        // Si el articulo es ubicable
        if (ArticuloUbicable(QMProOrdID_A.AsInteger)) then
        begin
           if (QMProOrdID_UBICACION.AsInteger <> 0) then
           begin
              // Si la ubicacion pertenece al almacen la dejo
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT ALMACEN FROM ART_ALMACENES_UBICACIONES WHERE ID_UBICACION = :ID_UBICACION';
                    Params.ByName['ID_UBICACION'].AsInteger := QMProOrdID_UBICACION.AsInteger;
                    ExecQuery;
                    if (FieldByName['ALMACEN'].AsString <> QMProOrdALMACEN_ENT.AsString) then
                       QMProOrdID_UBICACION.AsInteger := 0;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (QMProOrdID_UBICACION.AsInteger = 0) then
           begin
              // Busco la ubicación por defecto del articulo
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT A.ID_UBICACION ');
                    SQL.Add(' FROM ART_ARTICULOS_UBICACIONES A ');
                    SQL.Add(' JOIN ART_ALMACENES_UBICACIONES M ');
                    SQL.Add(' ON A.ID_UBICACION = M.ID_UBICACION ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' A.ID_A = :ID_A AND ');
                    SQL.Add(' M.EMPRESA = :EMPRESA AND ');
                    SQL.Add(' M.ALMACEN = :ALMACEN ');
                    SQL.Add(' ORDER BY A.PRIORIDAD DESC ');
                    Params.ByName['ID_A'].AsInteger := QMProOrdID_A.AsInteger;
                    Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
                    Params.ByName['ALMACEN'].AsString := QMProOrdALMACEN_ENT.AsString;
                    ExecQuery;
                    QMProOrdID_UBICACION.AsInteger := FieldByName['ID_UBICACION'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (QMProOrdID_UBICACION.AsInteger = 0) then
              QMProOrdID_UBICACION.AsInteger := DameIDUbicacionGeneral(QMProOrdALMACEN_ENT.AsString);
        end
        else
           QMProOrdID_UBICACION.AsInteger := 0;
     end
     else
        QMProOrdID_UBICACION.AsInteger := 0;
  end;
end;

procedure TProDMOrden.QMProOrdFasesBeforePost(DataSet: TDataSet);
begin
  QMProOrdFasesEntrada.Value := REntorno.Entrada;
end;

procedure TProDMOrden.QMProOrdMatBeforePost(DataSet: TDataSet);
begin
  QMProOrdMatEntrada.Value := REntorno.Entrada;
  DMMain.Contador_Gen(DataSet, 'PRO_CONTA_ORDENES_MAT', 'ID_ORDEN_MAT');
end;

procedure TProDMOrden.QMProOrdTareaBeforePost(DataSet: TDataSet);
begin
  QMProOrdTareaENTRADA.Value := REntorno.Entrada;
  QMProOrdTareaTIEMPO_PRODUCCION.AsString := QMProOrdTareaTIME_UTIL.AsString;

  if (QMProOrdTareaTIPOTAREA.AsString = '') and
     (QMProOrdTareaRECURSO.AsString = '') then
     QMProOrdTarea.Cancel;
end;

procedure TProDMOrden.QMProOrdFasesAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);

  // Si marca estado, marcaré tots els estats de la seva tarea. sfg_albert
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD_TAREA ');
        SQL.Add(' SET ');
        SQL.Add(' ESTADO = :NUEVO_ESTADO, ');
        SQL.Add(' FECHA_FIN_TAREA = :FECHA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' RIG_OF = :ORDEN AND ');
        SQL.Add(' SUBORDEN = :SUBORDEN AND ');
        SQL.Add(' LINEA_FASE = :LINEA_FASE AND ');
        SQL.Add(' ESTADO = :VIEJO_ESTADO ');

        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProOrdSERIES.AsString;
        Params.ByName['ORDEN'].AsInteger := QMProOrdRIG_OF.AsInteger;
        Params.ByName['SUBORDEN'].AsInteger := QMProOrdSUBORDEN.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMProOrdFasesLINEA_FASE.AsInteger;
        if (QMProOrdFasesESTADO.AsInteger = 1) then
        begin
           Params.ByName['NUEVO_ESTADO'].AsInteger := 1;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
           Params.ByName['VIEJO_ESTADO'].AsInteger := 0;
        end
        else // Si desmarca, descarcaré tots els de tareas
        begin
           Params.ByName['NUEVO_ESTADO'].AsInteger := 0;
           Params.ByName['FECHA'].Clear;
           Params.ByName['VIEJO_ESTADO'].AsInteger := 1;
        end;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

procedure TProDMOrden.QMProOrdMatAfterPost(DataSet: TDataSet);
var
  Peso, Volumen, Diametro : double;
begin
  Graba(DataSet);
  if not (NotasLote) then
     InfoLotes(True);
  NotasLote := False;

  ExtraeArticulos;

  if (DMMain.CompruebaControlUbicacionAlmacen(QMProOrdMatALMACEN.AsString)) and
     (CompruebaCheckUbicaciones(QMProOrdMatID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     MuestraUbicacion('ZOM');
end;

procedure TProDMOrden.Graba(DataSet: TDataSet);
begin
  if (QMProOrdRIG_OF.AsInteger <> 0) then
     xInfoActualizada.Refresh;
end;

procedure TProDMOrden.QMProOrdFasesGAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdFasesGAfterOpen');
  QMProOrdMatG.Open;
  QMProOrdTarG.Open;
  DMMain.LogFin('QMProOrdFasesGAfterOpen');
end;

procedure TProDMOrden.QMProOrdMatGDescAlmacenGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatGDescAlmacenGetText');
  Text := DameTituloAlmacen(QMProOrdMatGALMACEN.AsString);
end;

procedure TProDMOrden.QMProOrdMatGDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatGDescArtGetText');
  Text := DameTituloArticulo(QMProOrdMatGCOMPONENTE.AsString);
end;

procedure TProDMOrden.QMProOrdMatGCOMPONENTEChange(Sender: TField);
begin
  if QMProOrdMat.State in [dsEdit, dsInsert] then
     QMProOrdMatGPRE_COS_UNI.AsFloat := DMMain.DamePrecioCosteArticulo(QMProOrdMatGCOMPONENTE.AsString);
end;

procedure TProDMOrden.QMProOrdTarGDescrTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdTarGDescrTareaGetText');
  Text := DameTituloTarea(QMProOrdTarGTIPOTAREA.AsString);
end;

procedure TProDMOrden.QMProOrdTarGTIPOTAREAChange(Sender: TField);
begin
  if QMProOrdTarea.State in [dsEdit, dsInsert] then
     QMProOrdTarGTarea.AsString := DameTituloTarea(QMProOrdTarGTIPOTAREA.AsString);
end;

procedure TProDMOrden.QMProOrdTarGDescrRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdTarGDescrRecursoGetText');
  Text := DameTituloRecurso(QMProOrdTarGRECURSO.AsString);
end;

procedure TProDMOrden.QMProOrdTarGRECURSOChange(Sender: TField);
begin
  if QMProOrdTarea.State in [dsEdit, dsInsert] then
     QMProOrdTarGDescrRecurso.Text := DameTituloRecurso(QMProOrdTarGRECURSO.AsString);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PRECIO_RECURSO(:EMPRESA, :RECURSO, :FECHA)';
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['RECURSO'].AsString := QMProOrdTareaRECURSO.AsString;
        Params.ByName['FECHA'].AsDateTime := QMProOrdFECHA_ORD.AsDateTime;
        ExecQuery;
        QMProOrdTareaPRE_COS_UNI_PRE.AsFloat := FieldByName['PRECIO_EST'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdGAfterScroll(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdGAfterScroll');
  QMProOrdFasesG.DataSource := DSQMProOrdG;
  QMProOrdMatG.DataSource := DSQMProOrdFasesG;
  QMProOrdTarG.DataSource := DSQMProOrdFasesG;

  if (HayBookmark) then
  begin
     HayBookMark := False;
     if (QMProOrd.State = dsBrowse) then
        QMProOrd.Bookmark := QMProOrdG.Bookmark;
  end
  else
     HayBookMark := True;
  DMMain.LogFin('QMProOrdGAfterScroll');
end;

function TProDMOrden.Serializado(tipo: integer): boolean;
begin
  // Prové de la OF
  Result := False;
  case tipo of
     0: Result := (QMProOrdSERIALIZADO.AsInteger = 1);
     1:
     begin
        xComponente.Open;
        Result := (xComponenteSERIALIZADO.AsInteger = 1);
        xComponente.Close;
     end;
  end;
end;

procedure TProDMOrden.DatosSerializacion(var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer; tipodato: integer);
begin
  case tipodato of
     0:
     begin
        // Proviene de la orden de producción
        Serie := QMProOrdSERIES.AsString;
        Tipo := 'PRO';
        Rig := QMProOrdRIG_OF.AsInteger;
        Linea := 0;
        Articulo := QMProOrdCOMPUESTO.AsString;
        Almacen := QMProOrdALMACEN_SAL.AsString;
        Fecha := QMProOrdFECHA_FIN.AsDateTime;
        Unidades := QMProOrdUNI_TOTAL.AsFloat;
        Estado := 0;
     end;
     1:
     begin
        // Proviene de los componentes materiales
        Serie := QMProOrdMatSERIES.AsString;
        Tipo := 'PRO';
        Rig := QMProOrdMatRIG_OF.AsInteger;
        Linea := QMProOrdMatLINEA_MAT.AsInteger;
        Articulo := QMProOrdMatCOMPONENTE.AsString;
        Almacen := QMProOrdMatALMACEN.AsString;
        Fecha := QMProOrdFECHA_FIN.AsDateTime;
        Unidades := QMProOrdMatUNIDADES_NEC.AsFloat;
        Estado := 0;
     end;
  end;
end;

procedure TProDMOrden.InfoLotes(EsComponente: boolean);
var
  Articulo : string;
  IntroduceLotes : TFMIntroduceLotes;
  medida1, medida2, medida3, medida4 : string;
  aIdLote, aIdUbicacion : integer;
begin
  if (EsComponente) then
     Articulo := QMProOrdMatCOMPONENTE.AsString
  else
     Articulo := QMProOrdCOMPUESTO.AsString;

  if (ArticuloLoteable(Articulo)) then
  begin
     IntroduceLotes := TFMIntroduceLotes.Create(Self);
     try
        if (EsComponente) then
        begin
           (*
           // Asignación del lote del componente
           if (QMProOrdMat.State = dsBrowse) then
              QMProOrdMat.Edit;
           *)

           with IntroduceLotes do
           begin
              aIdLote := AsignaArticulo('MAT',
                 QMProOrdMatSERIES.AsString,
                 Articulo, QMProOrdMatEJERCICIO.AsInteger,
                 QMProOrdMatRIG_OF.AsInteger,
                 QMProOrdMatLINEA_Mat.AsInteger, QMProOrdMatUNIDADES_NEC.AsFloat,
                 QMProOrdMatALMACEN.AsString,
                 QMProOrdMatALMACEN.AsString, QMProOrdMatCANAL.AsInteger,
                 QMProOrdMatCANAL.AsInteger,
                 True, QMProOrdMatID_A.AsInteger,
                 QMProOrdMatID_ORDEN.AsInteger, 0, False);

              aIdUbicacion := 0;
              // Informo la ubicacion seleccionada en la seleccion de lote
              if (ArticuloUbicable(Articulo)) then
                 aIdUbicacion := IntroduceLotes.IDUbicacion;

              if (QMProOrdMat.State = dsBrowse) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE PRO_ORD_MAT SET ID_LOTE = :ID_LOTE, ID_UBICACION = :ID_UBICACION WHERE ID_ORDEN_MAT = :ID_ORDEN_MAT';
                       Params.ByName['ID_LOTE'].AsInteger := aIdLote;
                       Params.ByName['ID_UBICACION'].AsInteger := aIdUbicacion;
                       Params.ByName['ID_ORDEN_MAT'].AsInteger := QMProOrdMatID_ORDEN_MAT.AsInteger;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 QMProOrdMat.Refresh;
              end
              else
              begin
                 QMProOrdMatID_LOTE.AsInteger := aIdLote;
                 QMProOrdMatID_UBICACION.AsInteger := aIdUbicacion;
              end;
           end;
           NotasLote := True;
        end
        else
        begin
           // Creación del lote del compuesto
           with IntroduceLotes do
           begin
              QMProOrdID_LOTE.AsInteger := AsignaArticulo('COM',
                 QMProOrdSERIES.AsString,
                 Articulo, QMProOrdEJERCICIO.AsInteger,
                 QMProOrdRIG_OF.AsInteger,
                 0, QMProOrdUNI_TOTAL.AsFloat,
                 QMProOrdALMACEN_ENT.AsString,
                 QMProOrdALMACEN_ENT.AsString, QMProOrdCANAL.AsInteger,
                 QMProOrdCANAL.AsInteger,
                 True, QMProOrdID_A.AsInteger,
                 QMProOrdID_ORDEN.AsInteger, 0, False);

              {Informo la ubicacion seleccionada en la seleccion de lote}
              if (ArticuloUbicable(Articulo)) then
                 QMProOrdID_UBICACION.AsInteger := IntroduceLotes.IDUbicacion;

              //sfg.albert - Retorna les medidas
              if (QMProOrdID_LOTE.AsInteger <> 0) then
              begin
                 CargaMedidasLote(QMProOrdID_LOTE.AsInteger, medida1, medida2, medida3, medida4);
                 QMProOrdMEDIDA_1.AsFloat := StrToFloat(medida1);
                 QMProOrdMEDIDA_2.AsFloat := StrToFloat(medida2);
                 QMProOrdMEDIDA_3.AsFloat := StrToFloat(medida3);
                 QMProOrdMEDIDA_4.AsFloat := StrToFloat(medida4);
              end;
           end;
           NotasLote := True;
        end;
     finally
        IntroduceLotes.Free;
     end;
  end;
end;

function TProDMOrden.CompuestoLoteable: boolean;
begin
  Result := (QMProOrdLOTEABLE.AsInteger = 1);
end;

procedure TProDMOrden.QMProOrdMatPRE_COS_UNI_REALChange(Sender: TField);
begin
  QMProOrdMatTOTAL_VAR_REAL.Value := QMProOrdMatUNIDADES_NEC.Value * QMProOrdMatPRE_COS_UNI_REAL.Value;
  QMProOrdMatTOTAL_REAL.Value := QMProOrdMatTOTAL_VAR_REAL.Value + QMProOrdMatPRECIO_FIJO_REAL.Value;
end;

procedure TProDMOrden.PreparaNotasDetalle(Tabla: TFIBTableSet);
begin
  if (Tabla.State in [dsEdit, dsInsert]) then
     Tabla.Post;
  if (QMProOrdSITUACION.AsInteger < 2) then
     Tabla.Edit;
end;

(*
procedure TProDMOrden.QMProOrdTareaID_UTILLAJEChange(Sender: TField);
begin
  QMProOrdTareaDESC_UTILLAJE.AsString := DameTituloUtillaje(QMProOrdTareaID_UTILLAJE.AsString);
end;
*)
procedure TProDMOrden.CompruebaFirma(tipo, IdFirma: integer);
var
  Firma : boolean;
begin
  DMMain.LogIni(format('CompruebaFirma(%s, &d)', [Tipo, IdFirma]));
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_FIRMA, OK FROM ISO_FIRMAS WHERE EMPRESA = :EMPRESA AND ID_FIRMA = :ID_FIRMA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_FIRMA'].AsInteger := IdFirma;
        ExecQuery;
        Firma := (FieldByName['ID_FIRMA'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Firma) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE PRO_ORD ');
           case tipo of
              0: SQL.Add(' SET ISO_APROBADO = ' + IntToStr(IdFirma));
              1: SQL.Add(' SET ISO_VERIFICADO = ' + IntToStr(IdFirma));
              2: SQL.Add(' SET ISO_VALIDADO = ' + IntToStr(IdFirma));
           end;
           SQL.Add(' WHERE ID_ORDEN = ' + QMProOrdID_ORDEN.AsString);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMProOrd.Refresh;
  end;
  DMMain.LogFin('CompruebaFirma');
end;

function TProDMOrden.EstadoFirma(IdFirma: integer): smallint;
begin
  DMMain.LogIni(format('EstadoFirma(&d)', [IdFirma]));
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_FIRMA, OK FROM ISO_FIRMAS WHERE EMPRESA = :EMPRESA AND ID_FIRMA = :ID_FIRMA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_FIRMA'].AsInteger := IdFirma;
        ExecQuery;
        if (FieldByName['ID_FIRMA'].AsInteger > 0) then
           Result := FieldByName['OK'].AsInteger + 1
        else
           Result := 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
  DMMain.LogFin('EstadoFirma');
end;

function TProDMOrden.HayMateriales: boolean;
begin
  Result := (QMProOrdMat.FieldByName('LINEA_MAT').AsInteger <> 0);
end;

procedure TProDMOrden.QMProOrdTareaAfterScroll(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdTareaAfterScroll');
  ProFMOrden.TButtTrabExt.Enabled := (QMProOrdTareaTIPORECURSO.AsString = 'TE');
  DMMain.LogFin('QMProOrdTareaAfterScroll');
end;

procedure TProDMOrden.QMProOrdESCANDALLOChange(Sender: TField);
begin
  // Busco y selecciono el escandallo por defecto y sus almacenes
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ALMACEN_ENT, ALMACEN_LAN, ALMACEN_SAL, UNIDADES, UNIDAD ');
        SQL.Add(' FROM PRO_ESCANDALLO ');
        SQL.Add(' WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = ''EPR'' ');
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['ESCANDALLO'].AsInteger := QMProOrdESCANDALLO.AsInteger;
        ExecQuery;
        QMProOrdALMACEN_LAN.AsString := FieldByName['ALMACEN_LAN'].AsString;
        QMProOrdALMACEN_ENT.AsString := FieldByName['ALMACEN_ENT'].AsString;
        QMProOrdALMACEN_SAL.AsString := FieldByName['ALMACEN_SAL'].AsString;
        QMProOrdUNIDAD.AsString := FieldByName['UNIDAD'].AsString;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdAfterCancel(DataSet: TDataSet);
begin
  HayBookmark := False;
end;

procedure TProDMOrden.QMProOrdFasesAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdFasesAfterOpen');
  QMProOrdMat.Open;
  QMProOrdTarea.Open;

  xInfoMateriales.Open;
  xInfoTarea.Open;
  xInfoIncMaterial.Open;
  DMMain.LogFin('QMProOrdFasesAfterOpen');
end;

procedure TProDMOrden.QMProOrdTareaCalcFields(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdTareaCalcFields');
  if (not ModTiempo) and (not (QMProOrdTarea.State in [dsInsert, dsEdit])) then
     CalculaTiempo;

  if (not ModTiempoReal) and (not (QMProOrdTarea.State in [dsInsert, dsEdit])) then
     CalculaTiempoReal;

  QMProOrdTareaTIME.AsString := SegundosToStr(QMProOrdTareaTIEMPO.AsFloat);
  QMProOrdTareaTIME_UTIL.AsString := SegundosToStr(QMProOrdTareaTIEMPO_UTIL.AsFloat);

  QMProOrdTareaDescMaquina.AsString := DameTituloMaquina(StrToIntDef(QMProOrdTareaMAQUINA.AsString, 0));
  QMProOrdTareaDescrRecurso.AsString := DameTituloRecurso(QMProOrdTareaRECURSO.AsString);
  // No es un campo calculado. QMProOrdTareaDESC_UTILLAJE.AsString := DameTituloUtillaje(QMProOrdTareaID_UTILLAJE.AsString);

  if (QMProOrdTareaOPERACIONES_NUM.AsInteger <> 0) then
     QMProOrdTareaCosteOperacionReal.AsFloat := (QMProOrdTareaPRE_COS_UNI_REAL.AsFloat * QMProOrdTareaOPERACIONES_TIEMPO.AsInteger) / (3600 * QMProOrdTareaOPERACIONES_NUM.AsInteger)
  else
     QMProOrdTareaCosteOperacionReal.AsFloat := 0;

  if (QMProOrdTareaOPERACIONES_NUM.AsInteger <> 0) then
     QMProOrdTareaCosteOperacionPre.AsFloat := (QMProOrdTareaPRE_COS_UNI_PRE.AsFloat * QMProOrdTareaOPERACIONES_TIEMPO.AsInteger) / (3600 * QMProOrdTareaOPERACIONES_NUM.AsInteger)
  else
     QMProOrdTareaCosteOperacionPre.AsFloat := 0;

  DMMain.LogFin('QMProOrdTareaCalcFields');
end;

procedure TProDMOrden.FiltraOrden(IdOrden: integer);
begin
  // Fuerzo el recalculo
  OrdenesRealizables.Clear;

  with QMProOrd do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_ORDEN = ?ID_ORDEN ');
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;
end;

procedure TProDMOrden.FiltraOrdenesSituacion(Situacion: integer);
begin
  FiltroSituacion := Situacion;
  FiltraOrdenes;
end;

procedure TProDMOrden.FiltraOrdenesAlmacenLanzamiento(Almacen: string);
begin
  FiltroAlmacenLanzamiento := Almacen;
  FiltraOrdenes;
end;

procedure TProDMOrden.FiltraOrdenes(AbrirDataSet: boolean = True);
var
  Orden : string;
begin
  with QMProOrd do
  begin
     Close;
     // Guardo el orden
     Orden := OrdenadoPor;
     // Se establece SQL original
     SelectSQL.Text := SQLFind.Text;

     // Aplico filtros
     Ordenar('');
     if ((FiltroSituacion >= 0) and (FiltroSituacion < 5)) then
        SelectSQL.Add(' AND (SITUACION = ' + IntToStr(FiltroSituacion) + ')');

     if (FiltroSituacion = 5) then
        SelectSQL.Add(' AND (SITUACION <> 4)');

     if (FiltroAlmacenLanzamiento > '') then
        SelectSQL.Add(' AND (ALMACEN_LAN = ''' + FiltroAlmacenLanzamiento + ''')');

     // Ordeno DataSet
     Ordenar(Orden);

     // Se pasan parametros EECS con los que se está trabajando
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;

     // Tengo mis dudas de que esto ayude en algo, pero...
     // Asignem de nou els events, pq si no dona error al insertar varies vegades despres de canviar la serie
     AfterCancel := QMProOrdAfterCancel;
     AfterDelete := Graba;
     AfterOpen := QMProOrdAfterOpen;
     AfterPost := Graba;
     AfterScroll := QMProOrdAfterScroll;
     BeforeClose := QMProOrdBeforeClose;
     BeforePost := QMProOrdBeforePost;
     OnCalcFields := QMProOrdCalcFields;
     OnNewRecord := QMProOrdNewRecord;

     if (AbrirDataSet) then
        Open;
  end;
end;

procedure TProDMOrden.QMProOrdTareaCANTIDAD_UTILChange(Sender: TField);
begin
  if (not ModTiempoReal) then
     CalculaTiempoReal;

  QMProOrdTareaTOTAL_VAR_REAL.Value := CalculaTotalVarReal_Tarea;
  QMProOrdTareaTOTAL_REAL.Value := CalculaTotalReal_Tarea;
end;

procedure TProDMOrden.QMProOrdTareaTIEMPO_UTILChange(Sender: TField);
begin
  ModTiempoReal := True;
  CalculaTiempoReal;
  ModTiempoReal := False;
end;

procedure TProDMOrden.MuestraUbicacion(Tipo: string);
var
  Peso, Volumen, Diametro : double;
begin
  if (Tipo = 'ZOM') then
  begin
     // sfg_rsl Para ver si el elemento es ubicable se pasa el identificador del elemento
     // if (CompruebaCheckUbicaciones(QMProOrdMatID_ORDEN_MAT.AsInteger, Peso, Volumen, Diametro) = 1) then
     if (CompruebaCheckUbicaciones(QMProOrdMatID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     begin
        TProFMExtraeArticulos.Create(Self).MuestraUbiArtic(QMProOrdMatEMPRESA.AsInteger,
           QMProOrdMatEJERCICIO.AsInteger, QMProOrdMatCANAL.AsInteger,
           QMProOrdMatRIG_OF.AsInteger,
           QMProOrdMatLINEA_MAT.AsInteger,
           QMProOrdMatID_ORDEN_MAT.AsInteger,
           QMProOrdMatID_A.AsInteger, QMProOrdMatSERIES.AsString, tipo,
           QMProOrdMatUNIDADES_NEC.AsFloat);
     end
     else
        ShowMessage(_('El artículo no es ubicable'));
  end
  else
  if (Tipo = 'ZOR') then
  begin
     // sfg_rsl Para ver si el elemento es ubicable se pasa el identificador del elemento
     //  if (CompruebaCheckUbicaciones(QMProOrdID_ORDEN.AsInteger, Peso, Volumen, Diametro) = 1) then
     if (CompruebaCheckUbicaciones(QMProOrdID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     begin
        TProFMExtraeArticulos.Create(Self).MuestraUbiArtic(QMProOrdEMPRESA.AsInteger,
           QMProOrdEJERCICIO.AsInteger, QMProOrdCANAL.AsInteger,
           QMProOrdRIG_OF.AsInteger,
           0,
           QMProOrdID_ORDEN.AsInteger,
           QMProOrdID_A.AsInteger, QMProOrdSERIES.AsString, tipo,
           QMProOrdUNI_TOTAL.AsFloat);
     end
     else
        ShowMessage(_('El artículo no es ubicable'));
  end;
end;

procedure TProDMOrden.ExtraeArticulos;
var
  Peso, Volumen, Diametro : double;
begin
  if (CompruebaCheckUbicaciones(QMProOrdMatID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_A_ART_EXTRAE_ARTICULOS ');
           SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?RIG, ?LINEA_FASE, ');
           SQL.Add(' ?LINEA_MAT, ?ID_ORDEN_MAT, ?ID_A, ?UNIDADES, ');
           SQL.Add(' 99999, ?PESO, ?VOLUMEN, ?DIAMETRO, ?ARTICULO) ');
           Params.ByName['EMPRESA'].AsInteger := QMProOrdMatEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMProOrdMatEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMProOrdMatCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMProOrdMatSERIES.AsString;
           Params.ByName['RIG'].AsInteger := QMProOrdMatRIG_OF.AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMProOrdMatLINEA_FASE.AsInteger;
           Params.ByName['LINEA_MAT'].AsInteger := QMProOrdMatLINEA_MAT.AsInteger;
           Params.ByName['ID_ORDEN_MAT'].AsInteger := QMProOrdMatID_ORDEN_MAT.AsInteger;
           Params.ByName['ID_A'].AsInteger := QMProOrdMatID_A.AsInteger;
           Params.ByName['UNIDADES'].AsFloat := QMProOrdMatUNIDADES_STOCK.AsFloat;
           Params.ByName['PESO'].AsFloat := Peso;
           Params.ByName['VOLUMEN'].AsFloat := Volumen;
           Params.ByName['DIAMETRO'].AsFloat := Diametro;
           Params.ByName['ARTICULO'].AsString := QMProOrdMatCOMPONENTE.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TProDMOrden.EquivalenciaLinea: boolean;
var
  Peso, Volumen, Diametro : double;
begin
  VerificaEstadoOrden;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CAMBIO FROM PRO_ORD_CAMBIO_ART_EQUIVAL(?ID_ORDEN, ?LINEA_FASE, ?LINEA_MAT)';
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdMatID_ORDEN.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMProOrdMatLINEA_FASE.AsInteger;
        Params.ByName['LINEA_MAT'].AsInteger := QMProOrdMatLINEA_MAT.AsInteger;
        ExecQuery;
        Result := (FieldByName['CAMBIO'].AsShort = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProOrdMat.Refresh;

  if (Result) then
  begin
     ExtraeArticulos;

     if (DMMain.CompruebaControlUbicacionAlmacen(QMProOrdMatALMACEN.AsString)) and
        (CompruebaCheckUbicaciones(QMProOrdMatID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
        MuestraUbicacion('ZOM');
  end;
end;

procedure TProDMOrden.VerificaEstadoOrden;
begin
  if QMProOrdSITUACION.Value = 2 then
  begin
     ShowMessage(_('La Orden esta Lanzada y Reservado el Stock.') + #13#10 +
        _('No es posible su modificación'));
     Abort;
  end;

  if QMProOrdSITUACION.Value >= 3 then
  begin
     ShowMessage(_('El proceso de fabricación ha terminado'));
     Abort;
  end;
end;

procedure TProDMOrden.CambiaEstadoCompras(Modo: smallint);
begin
  with QMProOrdMatCompra do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT C.*, O.*, ');
        Add('        (C.UDS_UTILIZADAS * O.P_COSTE) AS COSTE_MAT_COMPRA, ');
        Add('        (O.P_COSTE * (1 + C.INCR_COSTE / 100) * C.UDS_UTILIZADAS) AS COSTE_MAT_TOTAL, ');
        Add('        (O.UNIDADES - C.UDS_UTILIZADAS) AS UDS_PENDIENTES, A.TITULO AS TITULO_ALMACEN ');
        Add(' FROM PRO_ORD_MAT_COMPRA C ');
        Add(' JOIN ART_ALMACENES A ON C.EMPRESA = A.EMPRESA AND C.ALMACEN = A.ALMACEN ');
        Add(' LEFT JOIN PRO_ORD_COMPRA_ORIG(C.ID_ORDEN, C.LINEA_FASE, C.LINEA_COMPRA, 0 /*RECURSIVO*/ ) O ON 1 = 1 ');
        Add(' WHERE ');
        Add(' C.ID_ORDEN = :ID_ORDEN AND ');
        Add(' C.LINEA_FASE = :LINEA_FASE ');
        case Modo of
           1: Add(' AND C.TIPO_COMPRA = ''MAT'''); // COMPRAS DESDE MATERIALES
           2: Add(' AND C.TIPO_COMPRA = ''PEP'''); // COMPRAS DESDE PEDIDOS
           3: Add(' AND C.TIPO_COMPRA = ''ALP'''); // COMPRAS DESDE ALBARANES
           4: Add(' AND C.TIPO_COMPRA = ''FAP'''); // COMPRAS DESDE FACTURAS
        end;
        Add(' ORDER BY C.LINEA_COMPRA ');
     end;
     Open;
  end;
end;

procedure TProDMOrden.VerOrigenCompra;
begin
  with xDatosCompra do
  begin
     Close;
     Params.ByName['RECURSIVO'].AsInteger := 1;
     Open;

     TProFMVerOrigenCompra.Create(Self).ShowModal;

     Close;
  end;
end;

procedure TProDMOrden.QMProOrdMatPROVEEDOR_COMPRAChange(Sender: TField);
begin
  QMProOrdMatDescripProveedor.AsString := DameTituloProveedor(QMProOrdMatPROVEEDOR_COMPRA.AsInteger);
end;

procedure TProDMOrden.QMProOrdMatCOMPRARChange(Sender: TField);
begin
  if (QMProOrdMatCOMPRAR.AsInteger = 0) then
  begin
     QMProOrdMatUDS_COMPRA.AsFloat := 0;
     QMProOrdMatPROVEEDOR_COMPRA.AsInteger := 0;
     QMProOrdMatMOV_STOCK_COMPRA.AsInteger := 0;
  end;
end;

procedure TProDMOrden.CambiaSerie(aSerie: string; AbrirDataSet: boolean = True);
begin
  DMMain.LogIni('ProDMOrden.CambiaSerie');
  Serie := aSerie;
  FiltraOrdenes(AbrirDataSet);

  if AbrirDataSet then
  begin
     try
        Posicionando := True;
        QMProOrd.Last;
     finally
        Posicionando := False;
     end;

     // QMProOrd.Refresh;
  end;

  QMProOrdMEDIDA_1.DisplayLabel := LeeParametro('MEDITIT001', Serie);
  QMProOrdMEDIDA_2.DisplayLabel := LeeParametro('MEDITIT002', Serie);
  QMProOrdMEDIDA_3.DisplayLabel := LeeParametro('MEDITIT003', Serie);
  QMProOrdMEDIDA_4.DisplayLabel := LeeParametro('MEDITIT004', Serie);
  DMMain.LogFin('ProDMOrden.CambiaSerie');
end;

procedure TProDMOrden.CalculaTiempo;
begin
  if ((QMProOrdTarea.State in [dsEdit, dsInsert]) and (QMProOrdTareaTIPOTAREA.AsString > '')) then
  begin
     if (ModTiempo) then
     begin
        // Si modificamos el TIEMPO, calculamos la CANTIDAD (en numero de operaciones)
        // La cantidad sera equivalente al numero de horas,
        // si el rendimiento de la maquina es de 1 operacion por hora: OP_NUM=1, OP_TIEMPO=3600
        if (QMProOrdTareaOPERACIONES_TIEMPO.AsInteger <> 0) then
           QMProOrdTareaCANTIDAD.AsFloat :=
              (QMProOrdTareaTIEMPO.AsFloat * QMProOrdTareaOPERACIONES_NUM.AsInteger) /
              (QMProOrdTareaOPERACIONES_TIEMPO.AsInteger)
        else // Si OP_TIEMPO=0, dejaremos la CANTIDAD en horas.
           QMProOrdTareaCANTIDAD.AsFloat := QMProOrdTareaTIEMPO.AsFloat / 3600;
     end
     else
     begin
        // Si modificamos la CANTIDAD, o el rendimiento de la maquina, se recalculara el TIEMPO
        ModTiempo := True;
        if (QMProOrdTareaOPERACIONES_NUM.AsInteger <> 0) then
           QMProOrdTareaTIEMPO.AsFloat :=
              (QMProOrdTareaCANTIDAD.AsFloat * QMProOrdTareaOPERACIONES_TIEMPO.AsInteger) /
              (QMProOrdTareaOPERACIONES_NUM.AsInteger)
        else
           QMProOrdTareaTIEMPO.AsFloat := QMProOrdTareaCANTIDAD.AsFloat * 3600;
        ModTiempo := False;
     end;
  end;
end;

procedure TProDMOrden.CalculaTiempoReal;
begin
  if ((QMProOrdTarea.State in [dsEdit, dsInsert]) and (QMProOrdTareaTIPOTAREA.AsString > '')) then
  begin
     if (ModTiempoReal) then
     begin
        // Si modificamos el TIEMPO_UTIL, calculamos la CANTIDAD_UTIL (en numero de operaciones)
        // La cantidad sera equivalente al numero de horas,
        // si el rendimiento de la maquina es de 1 operacion por hora: OP_NUM=1, OP_TIEMPO=3600
        if (QMProOrdTareaOPERACIONES_TIEMPO.AsInteger <> 0) then
           QMProOrdTareaCANTIDAD_UTIL.AsFloat :=
              (QMProOrdTareaTIEMPO_UTIL.AsFloat * QMProOrdTareaOPERACIONES_NUM.AsInteger) /
              (QMProOrdTareaOPERACIONES_TIEMPO.AsInteger)
        else // Si OP_TIEMPO=0, dejaremos la CANTIDAD en horas.
           QMProOrdTareaCANTIDAD_UTIL.AsFloat := QMProOrdTareaTIEMPO_UTIL.AsFloat / 3600;
     end
     else
     begin
        // Si modificamos la CANTIDAD_UTIL, o el rendimiento de la maquina, se recalculara el TIEMPO_UTIL
        ModTiempoReal := True;
        if (QMProOrdTareaOPERACIONES_NUM.AsInteger <> 0) then
           QMProOrdTareaTIEMPO_UTIL.AsFloat :=
              (QMProOrdTareaCANTIDAD_UTIL.AsFloat * QMProOrdTareaOPERACIONES_TIEMPO.AsInteger) /
              (QMProOrdTareaOPERACIONES_NUM.AsInteger)
        else
           QMProOrdTareaTIEMPO_UTIL.AsFloat := QMProOrdTareaCANTIDAD_UTIL.AsFloat * 3600;
        ModTiempoReal := False;
     end;
  end;
end;

function TProDMOrden.CalculaTotalVarReal_Tarea: double;
begin
  //Calculamos el total real de la tarea en funcion del Rendimiento de la operacion
  if (QMProOrdTareaOPERACIONES_NUM.AsInteger <> 0) then
     Result := (QMProOrdTareaCANTIDAD_UTIL.Value * QMProOrdTareaPRE_COS_UNI_REAL.Value *
        (QMProOrdTareaOPERACIONES_TIEMPO.AsInteger / QMProOrdTareaOPERACIONES_NUM.AsInteger)) / 3600
  else
     Result := 0;
end;

function TProDMOrden.CalculaTotalReal_Tarea: double;
begin
  Result := QMProOrdTareaTOTAL_VAR_REAL.Value + QMProOrdTareaPRECIO_FIJO_REAL.Value;
end;

procedure TProDMOrden.QMProOrdTareaOPERACIONES_NUMChange(Sender: TField);
begin
  CalculaTiempo;
  CalculaTiempoReal;
end;

procedure TProDMOrden.QMProOrdTareaOPERACIONES_TIEMPOChange(Sender: TField);
begin
  CalculaTiempo;
  CalculaTiempoReal;
end;

procedure TProDMOrden.EtiquetasOrdenes;
var
  Copias, Orden : integer;
  UnidadesPorCaja, CajasPorBulto : double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ESCANDALLO, UNIDADES, UNIDADES_POR_CAJA, CAJAS_POR_BULTO ');
        SQL.Add(' FROM PRO_ESCANDALLO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ESCANDALLO = :ESCANDALLO AND ');
        SQL.Add(' TIPO = :TIPO_ESC ');
        SQL.Add(' ORDER BY ESCANDALLO ');
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['ESCANDALLO'].AsInteger := QMProOrdESCANDALLO.AsInteger;
        Params.ByName['TIPO_ESC'].AsString := QMProOrdTIPO_ESC.AsString;
        ExecQuery;
        UnidadesPorCaja := FieldByName['UNIDADES_POR_CAJA'].AsFloat;
        CajasPorBulto := FieldByName['CAJAS_POR_BULTO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Copias := xInfoActualizadaUNI_TOTAL.AsInteger;
  Orden := QMProOrdID_ORDEN.AsInteger;
  TProFMLstEtiOrden.Create(Self).Muestra(Orden, Copias, UnidadesPorCaja, CajasPorBulto);
end;

procedure TProDMOrden.RecalculaMarcajes(id_orden: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_RECALCULA_MARCATGES(' + IntToStr(id_orden) + ')';
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMOrden.ValoresDefectoProConstantes;
begin
  QMProOrdCERRAR_SUBORDENES.Value := DMMain.DameConstanteProduccion('CERRAR_SUBORDENES');
  QMProOrdPREVALECE_ALM_ORDEN.Value := DMMain.DameConstanteProduccion('PREVALECE_ALM_ORDEN');
  QMProOrdIMPORTAR_OP.Value := DMMain.DameConstanteProduccion('IMPORTAR_OP');
  QMProOrdCASO_OP.Value := DMMain.DameConstanteProduccion('CASO_OP');
  QMProOrdRESERVA_STOCK_OP.Value := DMMain.DameConstanteProduccion('RESERVA_STOCK_OP');
end;

procedure TProDMOrden.CalculaFormulas(IdOrden: integer);
begin
  // Calculamos las formulas de la orden
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_DAME_CALCULO_FORMULA(:ID_ORDEN, 0, 2)';
        Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProOrdMat.Close;
  QMProOrdMat.Open;
end;

procedure TProDMOrden.RecuperarPrecioVenta;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'UPDATE PRO_ORD SET PRECIO_VENTA = 0 WHERE ID_ORDEN = :ID_ORDEN';
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

function TProDMOrden.ComprobarStock(Neteja: boolean): boolean;
begin
  /// Procedimiento que verifica que haya stock suficiente de materiales en orden y subordenes.
  /// Si no hay stock suficiente, se puede ver la tabla TMP_COMPROBAR_STOCKS.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_COMPROBAR_STOCKS(:EMPRESA, :EJERCICIO, ?CANAL, :ID_ORDEN, :NETEJA, NULL /*ALMACEN*/)';
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        Params.ByName['NETEJA'].AsInteger := BoolToInt(Neteja);
        ExecQuery;
        Result := (FieldByName['ART_STOCK_INSUFICIENTE'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.CambiaSelectTmpStock(MuestraTodos: boolean);
begin
  with QMTmpStock do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT TMP.ID_ORDEN, TMP.ARTICULO, TMP.CANTIDAD, TMP.STOCK, TMP.RIG_OF, TMP.SUBORDEN, TMP.LINEA_MAT, ART.TITULO, ');
        Add(' (TMP.STOCK - TMP.CANTIDAD) AS TOTAL ');
        Add(' FROM TMP_COMPROBAR_STOCKS TMP ');
        Add(' JOIN CON_CUENTAS_GES_ART GART ');
        Add(' ON (GART.ARTICULO = TMP.ARTICULO) ');
        Add(' JOIN ART_ARTICULOS ART ');
        Add(' ON (ART.ID_A = GART.ID_A) ');
        Add(' JOIN CON_CUENTAS_GES_FAM FAM ');
        Add(' ON (FAM.EMPRESA = GART.EMPRESA AND FAM.EJERCICIO = GART.EJERCICIO AND FAM.CANAL = GART.CANAL AND FAM.FAMILIA = ART.FAMILIA) ');
        Add(' WHERE ');
        Add(' GART.EMPRESA = :EMPRESA AND ');
        Add(' GART.EJERCICIO = :EJERCICIO AND ');
        Add(' GART.CANAL = :CANAL ');

        // Si no muestra todos, muestra solo los que controlan stock negativo
        if (not MuestraTodos) then
           Add(' AND FAM.VENTA = 0 ');

        Add(' ORDER BY TMP.ID_ORDEN, TMP.SUBORDEN, TMP.LINEA_MAT ');
     end;

     Open;
  end;
end;

function TProDMOrden.HayMarcajesARecuperar(id_orden: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_ORDEN FROM PRO_ORD_DET_MARCA WHERE ID_ORDEN = :ID_ORDEN AND NUEVA_TAREA = 1';
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_ORDEN'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.RecalcularCostesMasivo;
begin
  // sfg.albert - Primer es recalcula els costos de compres. Es crida al procediment
  // temp_pro_calcular_costes_of i aquest al pro_calcular_costes_of que és qui calcula

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_RECALCULAR_COSTES_OF_TODOS (:EMPRESA, :EJERCICIO, 2)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdBeforeClose(DataSet: TDataSet);
begin
  QMProOrdFases.Close;
  // xCompuesto.Close;
  xGrafRecursosFases.Close;
  xInfoActualizada.Close;
end;

procedure TProDMOrden.QMProOrdFasesBeforeClose(DataSet: TDataSet);
begin
  QMProOrdMat.Close;

  QMProOrdTarea.Close;

  QMProOrdMatCompra.Close;

  xInfoMateriales.Close;
  xInfoTarea.Close;
  xInfoIncMaterial.Close;
end;

procedure TProDMOrden.QMProOrdGAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdGAfterOpen');
  QSubOrdenes.Open;
  QMProOrdFasesG.Open;
  DMMain.LogFin('QMProOrdGAfterOpen');
end;

procedure TProDMOrden.QMProOrdGBeforeClose(DataSet: TDataSet);
begin
  QSubOrdenes.Close;
  QMProOrdFasesG.Close;
end;

procedure TProDMOrden.QMProOrdFasesGBeforeClose(DataSet: TDataSet);
begin
  QMProOrdMatG.Close;
  QMProOrdTarG.Close;
end;

function TProDMOrden.DameCantTerminada(linea: integer): real;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CANTIDAD_TERMINADA FROM PRO_ORD_FASES WHERE ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINEA_ANT';
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        Params.ByName['LINEA_ANT'].AsInteger := linea;
        ExecQuery;
        Result := FieldByName['CANTIDAD_TERMINADA'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TProDMOrden.CalcularUniCierreParcial: real;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(LOT.UNIDADES) FROM PRO_ORD_CIERRE_PARCIAL CAB ');
        SQL.Add(' LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET DET ');
        SQL.Add(' ON ');
        SQL.Add(' CAB.EMPRESA = DET.EMPRESA AND ');
        SQL.Add(' CAB.EJERCICIO = DET.EJERCICIO AND ');
        SQL.Add(' CAB.CANAL = DET.CANAL AND ');
        SQL.Add(' CAB.SERIE = DET.SERIE AND ');
        SQL.Add(' CAB.CIERRE = DET.CIERRE ');
        SQL.Add(' LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET_LOTE LOT ');
        SQL.Add(' ON ');
        SQL.Add(' LOT.EMPRESA = DET.EMPRESA AND ');
        SQL.Add(' LOT.EJERCICIO = DET.EJERCICIO AND ');
        SQL.Add(' LOT.CANAL = DET.CANAL AND ');
        SQL.Add(' LOT.SERIE = DET.SERIE AND ');
        SQL.Add(' LOT.CIERRE = DET.CIERRE ');
        SQL.Add(' WHERE ');
        SQL.Add(' CAB.ESTADO = 1 AND ');
        SQL.Add(' DET.ID_ORDEN = ?ID_ORDEN ');

        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.QMProOrdMatID_UBICACIONChange(Sender: TField);
begin
  NotasLote := True;
end;

procedure TProDMOrden.QMProOrdID_UBICACIONChange(Sender: TField);
begin
  QMProOrdTITULO_UBICACION.AsString := DameTituloUbicacion(QMProOrdID_UBICACION.AsInteger);
end;

procedure TProDMOrden.QMProOrdID_LOTEChange(Sender: TField);
begin
  QMProOrdTITULO_LOTE.AsString := DameLote(QMProOrdID_LOTE.AsInteger);
end;

//sfg.albert - Funció que tornarà si hi ha registres amb lots i/o ubicacions pendents
//d'informar
function TProDMOrden.CompruebaMatLotUbi(id_orden: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT EMPRESA FROM PRO_ORD_MAT ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN = :ID_ORDEN AND ');
        SQL.Add(' (((ID_LOTE = 0) OR (ID_LOTE IS NULL)) OR ((ID_UBICACION = 0) OR (ID_UBICACION IS NULL))) ');
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        Result := (Fields[0].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.CrearFichaTecnica;
begin
  FMain.EjecutaAccion(FMain.AIsoCertificadoAnalisis, 'Empresa = ' + REntorno.EmpresaStr + ' and id_orden=' + QMProOrdID_ORDEN.AsString);
  IsoFMCertificadoAnalisis.CrearFicha(QMProOrdID_ORDEN.AsInteger,
     QMProOrdCLIENTE.AsInteger, QMProOrdID_LOTE.AsInteger,
     QMProOrdCOMPUESTO.AsString);
end;

procedure TProDMOrden.CargaMedidasLote(id_lote: integer; var medida1, medida2, medida3, medida4: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4 FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = :ID_LOTE';
        Params.ByName['ID_LOTE'].AsInteger := ID_Lote;
        ExecQuery;
        medida1 := FieldByName['MEDIDA_1'].AsString;
        medida2 := FieldByName['MEDIDA_2'].AsString;
        medida3 := FieldByName['MEDIDA_3'].AsString;
        medida4 := FieldByName['MEDIDA_4'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TProDMOrden.DameIdDespiece(id_orden: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_DESPIECE FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
        Params.ByName['ID_ORDEN'].AsInteger := id_orden;
        ExecQuery;
        Result := FieldByName['ID_DESPIECE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.CrearDespieceOP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_DESPIECE_CREAR_OP(:ID_DESPIECE, :ENTRADA)';
        Params.ByName['ID_DESPIECE'].AsInteger := QMProOrdID_DESPIECE.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProOrd.Refresh;
end;

procedure TProDMOrden.RecuperarMarcaje;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_RECALCULO_MARCAJES_OF(:ID_ORDEN, :ENTRADA)';
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Marcajes recuperados'));
end;

procedure TProDMOrden.MarcaRecuperado(Recuperado: boolean);
begin
  // Es controla si s'ha recuperar o no
  if (QMProOrdSITUACION.AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE PRO_ORD SET RECUPERADO_MARCAJE = :RECUPERAR WHERE ID_ORDEN = :ID_ORDEN';
           Params.ByName['RECUPERAR'].AsInteger := BoolToInt(Recuperado);
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TProDMOrden.CrearLoteCompuesto: integer;
var
  Lote : string;
begin
  Lote := DMMain.DameLoteSiguiente(QMProOrdID_A.AsInteger, QMProOrdRIG_OF.AsInteger, 'PRO', QMProOrdID_ORDEN.AsInteger);
  Result := DMMain.CrearLote(QMProOrdID_A.AsInteger, Lote, '', QMProOrdALMACEN_ENT.AsString);
end;

function TProDMOrden.HayCompras: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_ORDEN FROM PRO_ORD_MAT_COMPRA WHERE ID_ORDEN = :ID_ORDEN';
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_ORDEN'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.ActualizaMedidas(IDOrden: integer; Medida1, Medida2, Medida3, Medida4: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET ');
        SQL.Add(' MEDIDA_1 = :MEDIDA1, ');
        SQL.Add(' MEDIDA_2 = :MEDIDA2, ');
        SQL.Add(' MEDIDA_3 = :MEDIDA3, ');
        SQL.Add(' MEDIDA_4 = :MEDIDA4 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN = :ID_ORDEN ');
        Params.ByName['MEDIDA1'].AsFloat := Medida1;
        Params.ByName['MEDIDA2'].AsFloat := Medida2;
        Params.ByName['MEDIDA3'].AsFloat := Medida3;
        Params.ByName['MEDIDA4'].AsFloat := Medida4;
        Params.ByName['ID_ORDEN'].AsInteger := IDOrden;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.PropagaAlmacenLanzamientoAMateriales;
begin
  if ((QMProOrd.State = dsBrowse) and (QMProOrdID_ORDEN.AsInteger > 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE PRO_ORD_MAT SET ALMACEN = :ALMACEN_LAN WHERE ID_ORDEN = :ID_ORDEN AND ALMACEN <> :ALMACEN_LAN';
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           Params.ByName['ALMACEN_LAN'].AsString := QMProOrdALMACEN_LAN.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (QMProOrdMat.Active) then
  begin
     QMProOrdMat.Close;
     QMProOrdMat.Open;
  end;
end;

procedure TProDMOrden.IntroduceMedidas;
begin
  AbreForm(TProFMInfoMedidasOF, ProFMInfoMedidasOF, Self);
  ProFMInfoMedidasOF.Inicializa(QMProOrdMEDIDA_1.AsFloat, QMProOrdMEDIDA_2.AsFloat, QMProOrdMEDIDA_3.AsFloat, QMProOrdMEDIDA_4.AsFloat);
end;

procedure TProDMOrden.PosicionaIdOrden(IDOrden: integer);
begin
  DMMain.LogIni('PosicionaIdOrden');
  with QMProOrd do
  begin
     try
        Posicionando := True;
        CalculandoRealizable := True;
        QMProOrdFases.DataSource := nil;
        DisableControls;
        try
           Close;
           Open;
           Last;
           while ((not BOF) and (QMProOrdID_ORDEN.AsInteger <> IDOrden)) do
              Prior;
        finally
           EnableControls;
        end;
     finally
        Posicionando := False;
        CalculandoRealizable := False;
        QMProOrdFases.DataSource := DSQMProOrd;
     end;

     // Refresco datos ya que durante el recorrido no se han calculado los campos calculados.
     if (QMProOrd.RecordCount > 0) then
        Refresh;
  end;

  DMMain.LogFin('PosicionaIdOrden');
end;

procedure TProDMOrden.PosicionaSubordenEscandallo(Escandallo: integer);
var
  IdOrden : integer;
begin
  if (Escandallo <> 0) then
  begin
     IDOrden := QMProOrdMatMATESC.AsInteger;
     Escandallo := QMProOrdMatMATESC.AsInteger;
     FiltraOrdenesYSubordenes;
     try
        Posicionando := True;
        with QMProOrd do
        begin
           DisableControls;
           try
              First;
              while ((not EOF) and (QMProOrdESCANDALLO.AsInteger <> Escandallo)) do
                 Next;
           finally
              EnableControls;
           end;
           if (EOF) then
              PosicionaIdOrden(IDOrden);
        end;
     finally
        Posicionando := False;
     end;
  end;
end;

procedure TProDMOrden.FiltraOrdenesYSubordenes;
var
  IDOrden : integer;
  DataSetDesarrolloAbierto : boolean;
begin
  // Guardo el IDOrden para posicionar después del filtro
  IDOrden := QMProOrdID_ORDEN.AsInteger;
  DataSetDesarrolloAbierto := QMProOrdFases.Active;

  with QMProOrd do
  begin
     DisableControls;
     try
        CalculandoRealizable := True;
        Close;
        SelectSQL.Text := SQLBase.Text;
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_ORDEN IN (SELECT ID_ORDEN ');
        SelectSQL.Add('              FROM PRO_DAME_ORDENES_RELACIONADAS(:ID_ORDEN)) ');
        SelectSQL.Add(' ORDER BY ID_ORDEN, FECHA_ORD ');
        Params.ByName['ID_ORDEN'].AsInteger := IDOrden;
        Open;

        // Fuerzo el recalculo
        while not EOF do
        begin
           FuerzaRefrescoRealizable(QMProOrdID_ORDEN.AsInteger);
           Next;
        end;
     finally
        CalculandoRealizable := False;
        EnableControls;
     end;
  end;

  PosicionaIdOrden(IDOrden);

  if DataSetDesarrolloAbierto then
     QMProOrdFases.Open;
end;

procedure TProDMOrden.QMProOrdMatCalcFields(DataSet: TDataSet);
var
  Lote : string;
  // Stock : double;
begin
  DMMain.LogIni('QMProOrdMatCalcFields');
  QMProOrdMatMASCARA_UNIDADES_COMPONENTE.AsString := CalculaMascara(QMProOrdMatDESCIMALES_UNIDAD_FAB.AsInteger, False); // DMMain.DameMascaraUnidades(QMProOrdMatCOMPONENTE.AsString);

  {
  if (abs(Stock - QMProOrdMatSTOCK.AsFloat) > 0.1) then
     QMProOrdMatDESCRALMACEN.AsString := format('DIF %8.2f - %8.2f = %8.2f',[Stock, QMProOrdMatSTOCK.AsFloat,Stock - QMProOrdMatSTOCK.AsFloat])
  else
  }
  QMProOrdMatDESCRALMACEN.AsString := QMProOrdMatDESC_ALMACEN.AsString;
  QMProOrdMatPRECIOMAT.AsFloat := QMProOrdMatP_COSTE.AsFloat;
  QMProOrdMatDESCRIPPROVEEDOR.AsString := QMProOrdMatDESC_PROVEEDOR.AsString;
  // Lote := DameLote(QMProOrdMatID_LOTE.AsInteger);
  Lote := QMProOrdMatLOTE.AsString;
  if (QMProOrdMatCANT_LOTE.AsInteger > 1) then
     Lote := Lote + ' (+' + QMProOrdMatCANT_LOTE.AsString + ')';
  QMProOrdMatLOTE.AsString := Lote;
  QMProOrdMatTITULO_UBICACION.AsString := QMProOrdMatDESC_UBICACION.AsString;
  DMMain.LogFin('QMProOrdMatCalcFields');
end;

procedure TProDMOrden.QMProOrdMatSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatSTOCKGetText');
  Text := FormatFloat(QMProOrdMatMASCARA_UNIDADES_COMPONENTE.AsString, QMProOrdMatSTOCK.AsFloat);
end;

procedure TProDMOrden.QMProOrdMatPEDIDOS_A_PROGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatPEDIDOS_A_PROGetText');
  Text := FormatFloat(QMProOrdMatMASCARA_UNIDADES_COMPONENTE.AsString, QMProOrdMatPEDIDOS_A_PRO.AsFloat);
end;

procedure TProDMOrden.ComprobarValorDefecto;
begin
  PermitirModificarCompras := (DMMain.DameConstanteProduccion('OF_MODIF_COMPRAS') = 1);
  PermitirBorrarCompras := (DMMain.DameConstanteProduccion('OF_BORRADO_COMPRAS') = 1);
  PermitirIntroducirDatosCierre := (DMMain.DameConstanteProduccion('OF_DATOS_CIERRE') = 1);
end;

procedure TProDMOrden.Lanzar(TipoLanzamiento: integer);
begin
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_LANZAR_ORDEN (:ID_ORDEN, :ENTRADA, :TIPO_LANZAMIENTO, :FECHA) ');
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['TIPO_LANZAMIENTO'].AsInteger := TipoLanzamiento;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(_('Ha ocurrido un error al generar el lanzamiento.') + #13#10 + E.Message);
     end;
  end;
end;

procedure TProDMOrden.Reservar;
begin
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_RESERVAR_ORDEN(:ID_ORDEN, :ENTRADA, :ID_RESERVA) ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           Params.ByName['ID_RESERVA'].AsFloat := IdReserva;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(_('Ha ocurrido un error al generar la reserva.') + #13#10 + E.Message);

        // Si hay algun problema, borro la cabecera de reserva
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'DELETE FROM PRO_ORD_RESERVA WHERE ID_ORDEN = :ID_ORDEN AND ID_RESERVA =  :ID_RESERVA';
              Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
              Params.ByName['ID_RESERVA'].AsFloat := IdReserva;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TProDMOrden.Cerrar;
var
  FechaFin : TDateTime;
begin
  // FECHA_FIN se utilizará para hacer los movimientos de stock de cierre y devolucion
  FechaFin := REntorno.FechaTrab;

  if (PideDato('DTM', FechaFin, 'Fecha de Cierre')) then
  begin
     try
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE PRO_CERRAR_ORDEN (:ID_ORDEN, :ENTRADA, :FECHA) ');
              Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['FECHA'].AsDateTime := FechaFin; // REntorno.FechaTrab
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     except
        on E: Exception do
        begin
           ShowMessage(_('Ha ocurrido un error al cerrar la orden de produccion.') + #13#10 + E.Message);
        end;
     end;
  end;
end;

procedure TProDMOrden.EnvioTrabajoExterno(Tipo, AlmacenOrigen, AlmacenDestino: string; Cantidad: double);
var
  RIG : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE PRO_RECEPCION_TRABAJO_EXTRNO (:EMPRESA, :EJERCICIO, :CANAL, :TIPO, :ID_ORDEN, :ALMACEN_ORI, :ALMACEN_DST, :UNIDADES, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        Params.ByName['ALMACEN_ORI'].AsString := AlmacenOrigen;
        Params.ByName['ALMACEN_DST'].AsString := AlmacenDestino;
        Params.ByName['UNIDADES'].AsFloat := Cantidad;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        RIG := FieldByName['RIG_MOV'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if MessageDlg(Format(_('Se ha creado el movimiento %s. ¿Desea abrirlo?'), [REntorno.EjercicioStr + '-' + QMProOrdSERIES.AsString + '/' + IntToStr(RIG)]),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     FMain.MuestraDocumento(REntorno.Ejercicio, 'MVT', QMProOrdSERIES.AsString, RIG);
end;

procedure TProDMOrden.CreaMovimientoComponente(Tipo, Componente, AlmacenOrigen, AlmacenDestino, Comentario: string; Cantidad: double);
var
  RIG : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE PRO_CREA_MOV_MANUAL_COMPONENTE (:TIPO, :ID_ORDEN, :COMPONENTE, :ALMACEN_ORI, :ALMACEN_DST, :UNIDADES, :COMENTARIO, :ENTRADA) ');
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        Params.ByName['COMPONENTE'].AsString := Componente;
        Params.ByName['ALMACEN_ORI'].AsString := AlmacenOrigen;
        Params.ByName['ALMACEN_DST'].AsString := AlmacenDestino;
        Params.ByName['UNIDADES'].AsFloat := Cantidad;
        Params.ByName['COMENTARIO'].AsString := Comentario;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        RIG := FieldByName['RIG_MOV'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if MessageDlg(Format(_('Se ha creado el movimiento %s. ¿Desea abrirlo?'), [REntorno.EjercicioStr + '-' + QMProOrdSERIES.AsString + '/' + IntToStr(RIG)]),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     FMain.MuestraDocumento(REntorno.Ejercicio, 'MVT', QMProOrdSERIES.AsString, RIG);
end;

procedure TProDMOrden.FuerzaRefrescoRealizable(IdOrden: integer);
var
  i : integer;
begin
  with OrdenesRealizables do
  begin
     i := IndexOfName(IntToStr(IdOrden));
     if (i >= 0) then
        Delete(i);
  end;
end;

procedure TProDMOrden.QMProOrdCalcFields(DataSet: TDataSet);
var
  // i : integer;
  s : string;
  StockSuficiente, FechaProxima : boolean;
  IdOrden : string;
  // DataSetDesarrolloAbierto : boolean;
  (*
  xFases, xMat : TFIBDataSet;
  DSFases : TDataSource;
  StockMaterial : double;
  *)
begin
  DMMain.LogIni('QMProOrdCalcFields');
  if True {(not Posicionando)} then
  begin
     IdOrden := QMProOrdID_ORDEN.AsString;
     if (IdOrden <> '') then
     begin
        QMProOrdTITULO_SITUACION.AsString := DameTituloSituacionProduccion(QMProOrdSITUACION.AsInteger);
        QMProOrdMASCARA_UNIDADES_COMPUESTO.AsString := CalculaMascara(QMProOrdDECIMALES_MASCARA.AsInteger, False); // DMMain.DameMascaraUnidades(QMProOrdCOMPUESTO.AsString);
        QMProOrdTITULO_UBICACION.AsString := DameTituloUbicacion(QMProOrdID_UBICACION.AsInteger);
        QMProOrdTITULO_LOTE.AsString := QMProOrdDESC_LOTE.AsString; // DameLote(QMProOrdID_LOTE.AsInteger);
        // Cantidad de escandallos activos para el compuesto
        QMProOrdCANT_ESCANDALLO.AsInteger := DameCantidadEscandallo(QMProOrdCOMPUESTO.AsString);
        // QMProOrdTITULO_CLIENTE.AsString := DMMain.DameTituloCliente(QMProOrdCLIENTE.AsInteger);

        // Verifico si la orden es realizable (stock suficiente y fecha proxima)
        // Solo trato las lanzadas
        if (QMProOrdSITUACION.AsInteger <> 1) then
           QMProOrdREALIZABLE.AsInteger := 0
        else
        begin
           with OrdenesRealizables do
           begin
              // i := IndexOfName(IdOrden);
              s := Values[IdOrden];
              if (s > '') then
              begin
                 QMProOrdREALIZABLE.AsInteger := StrToInt(s);
              end
              else
              begin
                 StockSuficiente := True;

                 // Verificar que la fecha sea "proxima"
                 // Anteriores a hoy o dentro del proximo mes
                 FechaProxima := (QMProOrdFECHA_ORD.AsDateTime <= Today + 30);

                 if (FechaProxima) then
                 begin
                    { TODO : Ver si para esto sería mejor utilizar "ComprobarStock". }
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT SUFICIENTE FROM PRO_STOCK_SUFICIENTE(:ID_ORDEN)';
                          Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
                          ExecQuery;
                          StockSuficiente := (FieldByName['SUFICIENTE'].AsInteger = 1);
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    (*
                    // Verificar stock de componentes
                    xFases := TFIBDataSet.Create(nil);
                    xMat := TFIBDataSet.Create(nil);
                    DSFases := TDataSource.Create(nil);
                    try
                       with xFases do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          Transaction := DameTransactionRO(DMMain.DataBase);
                          if (not Transaction.InTransaction) then
                             Transaction.StartTransaction;
                          SelectSQL.Text := QMProOrdFases.SelectSQL.Text;
                          DataSource := QMProOrdFases.DataSource;
                          Open;
                       end;
                       DSFases.DataSet := xFases;
                       with xMat do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          Transaction := DameTransactionRO(DMMain.DataBase);
                          if (not Transaction.InTransaction) then
                             Transaction.StartTransaction;
                          SelectSQL.Text := QMProOrdMat.SelectSQL.Text;
                          DataSource := DSFases;
                       end;

                       while StockSuficiente and (not xFases.EOF) do
                       begin
                          xMat.Close;
                          xMat.Open;
                          while StockSuficiente and (not xMat.EOF) do
                          begin
                             // Stock es suficiente
                             // - si se controla stock.
                             // - si hay suficiente stock
                             // - o si se fabricara.
                             if (xMat.FieldByName('CONTROL_STOCK').AsInteger = 1) then
                             begin
                                // Buscamos el stock del almacen de salida
                                with THYFIBQuery.Create(nil) do
                                begin
                                   try
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      {SQL.Add(' SELECT EXISTENCIAS FROM ');
                                      SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 0, 0, 0, 0, 0, NULL) ');
                                      SQL.Add(' WHERE CANAL = :CANAL ');
                                      }
                                      SQL.Add(' SELECT STOCK FROM ');
                                      SQL.Add(' A_ART_DAME_STOCK2 (:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, ''NOW'') ');

                                      Params.ByName['EMPRESA'].AsInteger := xMat.FieldByName('EMPRESA').AsInteger;
                                      Params.ByName['CANAL'].AsInteger := xMat.FieldByName('CANAL').AsInteger;
                                      Params.ByName['ARTICULO'].AsString := xMat.FieldByName('COMPONENTE').AsString;
                                      Params.ByName['ALMACEN'].AsString := xMat.FieldByName('ALMACEN_SAL').AsString;
                                      ExecQuery;
                                      StockMaterial := FieldByName['STOCK'].AsFloat;
                                      {
                                      StockMaterial := FieldByName['EXISTENCIAS'].AsFloat;
                                      }
                                      FreeHandle;
                                   finally
                                      Free;
                                   end;
                                end;
                                StockSuficiente := (StockMaterial >= xMat.FieldByName('UNIDADES_STOCK').AsFloat + xMat.FieldByName('UNIDADES_FAB').AsFloat);
                             end;

                             xMat.Next;
                          end;
                          xFases.Next;
                       end;
                    finally
                       if xMat.Transaction.InTransaction then
                          xMat.Transaction.Commit;
                       if xFases.Transaction.InTransaction then
                          xFases.Transaction.Commit;

                       xMat.Transaction.Free;
                       xFases.Transaction.Free;

                       xMat.Transaction := nil;
                       xFases.Transaction := nil;

                       xMat.Free;
                       DSFases.Free;
                       xFases.Free;
                    end;
                    *)
                 end;

                 // Guardo el dato
                 QMProOrdREALIZABLE.AsInteger := BoolToInt(StockSuficiente and FechaProxima);
                 Values[IdOrden] := QMProOrdREALIZABLE.AsString;
              end;
           end;
        end;
     end;
  end;
  DMMain.LogFin('QMProOrdCalcFields');
end;

procedure TProDMOrden.QMProOrdMatCompraNewRecord(DataSet: TDataSet);
begin
  QMProOrdMatCompraEMPRESA.AsInteger := QMProOrdFasesEMPRESA.AsInteger;
  QMProOrdMatCompraEJERCICIO.AsInteger := QMProOrdFasesEJERCICIO.AsInteger;
  QMProOrdMatCompraCANAL.AsInteger := QMProOrdFasesCANAL.AsInteger;
  QMProOrdMatCompraSERIE.AsString := QMProOrdFasesSERIES.AsString;
  QMProOrdMatCompraRIG_OF.AsInteger := QMProOrdFasesRIG_OF.AsInteger;
  QMProOrdMatCompraID_ORDEN.AsInteger := QMProOrdFasesID_ORDEN.AsInteger;
  QMProOrdMatCompraLINEA_FASE.AsInteger := QMProOrdFasesLINEA_FASE.AsInteger;
  QMProOrdMatCompraALMACEN.AsString := REntorno.AlmacenDefecto;
end;

procedure TProDMOrden.QMProOrdMatCompraBeforePost(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA_MAT) FROM PRO_ORD_MAT_COMPRA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIES AND ');
        SQL.Add(' RIG_OF = ?RIG_OF AND ');
        SQL.Add(' LINEA_FASE = ?LINEA_FASE ');
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProOrdSERIES.AsString;
        Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMProOrdFasesLINEA_FASE.AsInteger;
        ExecQuery;
        QMProOrdMatCompraLINEA_COMPRA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMOrden.CambiaComponente(Articulo: string);
begin
  with QMProOrdMat do
  begin
     if not (State in [dsEdit, dsInsert]) then
        Edit;
     QMProOrdMatCOMPONENTE.AsString := Articulo;
     Post;
  end;
end;

procedure TProDMOrden.ModificaTiempoTarea(Modo: integer; Valor: double);
begin
  /// Modifica el campo PRO_ORD_TAREA.TIEMPO o TIEMPO_UTIL del registro de tarea actual.

  case Modo of
     0: QMProOrdTareaTIEMPO.AsFloat := Valor;
     1: QMProOrdTareaTIEMPO_UTIL.AsFloat := Valor;
  end;

  {
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD_TAREA ');
        SQL.Add(' SET ');
        if (Modo = 0) then
           SQL.Add('    TIEMPO = :VALOR ');
        if (Modo = 1) then
           SQL.Add('    TIEMPO_UTIL = :VALOR ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' RIG_OF = :RIG_OF AND ');
        SQL.Add(' LINEA_FASE = :LINEA_FASE AND ');
        SQL.Add(' LINEA_TAREA = :LINEA_TAREA ');
        Params.ByName['EMPRESA'].AsInteger := QMProOrdTareaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdTareaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdTareaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProOrdTareaSERIE.AsString;
        Params.ByName['RIG_OF'].AsInteger := QMProOrdTareaRIG_OF.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMProOrdTareaLINEA_FASE.AsInteger;
        Params.ByName['LINEA_TAREA'].AsInteger := QMProOrdTareaLINEA_TAREA.AsInteger;
        Params.ByName['VALOR'].AsFloat := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProOrdTarea.Refresh;
  }
end;

(*
procedure TProDMOrden.TraspasoTipoLanzamientos(TipoLanzamiento: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET ');
        SQL.Add(' TIPO_LANZAMIENTO = :TIPO_LANZAMIENTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIES = :SERIES AND ');
        SQL.Add(' RIG_OF = :RIG_OF AND ');
        SQL.Add(' SUBORDEN = :SUBORDEN ');
        Params.ByName['TIPO_LANZAMIENTO'].AsInteger := TipoLanzamiento;
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
        Params.ByName['SERIES'].AsString := QMProOrdSERIES.AsString;
        Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
        Params.ByName['SUBORDEN'].AsInteger := QMProOrdSUBORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
*)

procedure TProDMOrden.QMProOrdMatSTOCK_ALM_LANGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatSTOCK_ALM_LANGetText');
  Text := FormatFloat(QMProOrdMatMASCARA_UNIDADES_COMPONENTE.AsString, QMProOrdMatSTOCK_ALM_LAN.AsFloat);
end;

procedure TProDMOrden.DesvincularOrdensuborden(IdOrden: integer);
var
  Q : THYFIBQuery;
begin
  /// Desvincula las subordenes de esta orden.
  /// Las subordenes quedan marcadas para que no generen subordenes cuando sean lanzadas.

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET ');
        SQL.Add(' ID_ORDEN_SUBORDEN = 0, ');
        SQL.Add(' ID_ORDEN_MAT = 0, ');
        SQL.Add(' SUBORDEN = 0, ');
        SQL.Add(' PADRE_SUBORDEN = RIG_OF, ');
        SQL.Add(' CONT_SUBORDEN = 1, ');
        SQL.Add(' CASO_OP = 2  /* No crea subordenes */ ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN IN (SELECT ID_ORDEN ');
        SQL.Add('              FROM PRO_DAME_SUBORDENES(:ID_ORDEN)) ');
        Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMOrden.CierraSubordenes(IdOrden: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_CERRAR_SUBORDENES (:ID_ORDEN, :ENTRADA) ';
        Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Para forzar refresco de datos
  PosicionaIdOrden(IdOrden);
end;

procedure TProDMOrden.GeneraPropuestaPedido(IdOrden: integer; Serie: string);
var
  ProcesoAutomatico : integer;
begin
  // Recorre componentes de orden + suborden.
  // Solo si esta lanzada
  // Compara stock y stock minimo
  // Genera propuesta/s de pedido a proveedor segun proveedor del compuesto.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_GENERA_PROPUESTA (:ID_ORDEN, :ENTRADA)';
        Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        ProcesoAutomatico := FieldByName['PROCESO_AUTO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.APropuestas);
  FMPropuestas.FiltraProcesoAutomatico(Serie, ProcesoAutomatico);
  {$ENDIF}
end;

procedure TProDMOrden.QMProOrdMatUNIDADES_NECGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatUNIDADES_NECGetText');
  Text := FormatFloat(QMProOrdMatMASCARA_UNIDADES_COMPONENTE.AsString, QMProOrdMatUNIDADES_NEC.AsFloat);
end;

procedure TProDMOrden.QMProOrdMatUNIDADES_STOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DMMain.Log('QMProOrdMatUNIDADES_STOCKGetText');
  Text := FormatFloat(QMProOrdMatMASCARA_UNIDADES_COMPONENTE.AsString, QMProOrdMatUNIDADES_STOCK.AsFloat);
end;

procedure TProDMOrden.OptimizaBusqueda(Optimizar: boolean);
begin
  /// Establece variable Posicionando que evita que se ejecuta AfterScroll
  /// Cuando se quita la optimización hay que forzar la ejecución para refrescar algunos datos.

  Posicionando := Optimizar;
  if not Posicionando then
     QMProOrdAfterScroll(QMProOrd);
end;

procedure TProDMOrden.QMProOrdTareaAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMProOrdTareaAfterOpen');
  xProOrdTareaNotas.Open;
  DMMain.LogFin('QMProOrdTareaAfterOpen');
end;

procedure TProDMOrden.QMProOrdTareaBeforeClose(DataSet: TDataSet);
begin
  xProOrdTareaNotas.Close;
end;

function TProDMOrden.DameCantidadEscandallo(Compuesto: string): integer;
begin
  /// Devuelve la cantidad de escandallos activos para el compuesto

  DMMain.LogIni('DameCantidadEscandallo');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM PRO_ESCANDALLO WHERE EMPRESA = ?EMPRESA AND COMPUESTO = ?COMPUESTO AND TIPO = ''EPR'' AND ESTADO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPUESTO'].AsString := QMProOrdCOMPUESTO.AsString;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
     finally
        Free;
     end;
  end;
  DMMain.LogFin('DameCantidadEscandallo');
end;

procedure TProDMOrden.RefrescaStock;
begin
  // Recorro materiales pidiendo stock para que el procedimiento lo recalcule
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ALMACEN, ALMACEN_SAL, COMPONENTE ');
           SelectSQL.Add(' FROM PRO_ORD_MAT ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' SERIES = :SERIE AND ');
           SelectSQL.Add(' RIG_OF = :RIG_OF ');
           Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMProOrdSERIES.AsString;
           Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
           Open;

           while not EOF do
           begin
              DMMain.DameStockArticulo(QMProOrdEMPRESA.AsInteger, QMProOrdCANAL.AsInteger, FieldByName('COMPONENTE').AsString, FieldByName('ALMACEN').AsString);
              if (FieldByName('ALMACEN').AsString <> FieldByName('ALMACEN_SAL').AsString) then
                 DMMain.DameStockArticulo(QMProOrdEMPRESA.AsInteger, QMProOrdCANAL.AsInteger, FieldByName('COMPONENTE').AsString, FieldByName('ALMACEN_SAL').AsString);
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
end;

procedure TProDMOrden.LanzaOrdenMasSubordenes;
var
  IdOrden : integer;
begin
  IdOrden := QMProOrdID_ORDEN.AsInteger;

  if (QMProOrdSITUACION.AsInteger = 0) then
     SituacionSiguiente;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ID_ORDEN FROM PRO_ORD ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' SERIES = :SERIES AND ');
           SelectSQL.Add(' SUBORDEN = :RIG_OF ');
           SelectSQL.Add(' ORDER BY RIG_OF ');
           Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.AsInteger;
           Params.ByName['SERIES'].AsString := QMProOrdSERIES.AsString;
           Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.AsInteger;
           Open;

           while not EOF do
           begin
              PosicionaIdOrden(FieldByName('ID_ORDEN').AsInteger);
              LanzaOrdenMasSubordenes;

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

  // Fuerzo refresco y reposiciono orden
  FiltroSituacion := -1; // Todas las situaciones
  FiltraOrdenes(False); // Aplico filtro pero mantego cerrado dataset
  PosicionaIdOrden(IdOrden);
end;

procedure TProDMOrden.QMProOrdFasesTIEMPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := SegundosToStr(QMProOrdFases.FieldByName('TIEMPO').AsFloat);
end;

procedure TProDMOrden.QMProOrdFasesTIEMPO_UTILGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := SegundosToStr(QMProOrdFases.FieldByName('TIEMPO_UTIL').AsFloat);
end;

procedure TProDMOrden.QMProOrdFasesDIFERENCIA_TIEMPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := SegundosToStr(QMProOrdFases.FieldByName('DIFERENCIA_TIEMPO').AsFloat);
end;

end.
