{CORREGIR UPDATE BLOB QMProTareaEsc.COMENTARIO}
{CORREGIR UPDATE BLOB QMProMatEsc.NOTAS}
unit UProDMEscandallo;

//sfg_rsl - (19-04-07) : Nueva Página Precios. Estandarizar con oferta escandallos

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math, Forms, Windows;

type
  TProDMEscandallo = class(TDataModule)
     QMProEscandallo: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMProEscandallo: TDataSource;
     QMProEscandalloEMPRESA: TIntegerField;
     QMProEscandalloESCANDALLO: TIntegerField;
     QMProEscandalloCOMPUESTO: TFIBStringField;
     QMProEscandalloUNIDAD: TFIBStringField;
     QMProEscandalloUNIDADES: TFloatField;
     QMProEscandalloMEDIDA_1: TFloatField;
     QMProEscandalloMEDIDA_2: TFloatField;
     QMProEscandalloMEDIDA_3: TFloatField;
     QMProEscandalloCOSTE_FIJO: TFloatField;
     QMProEscandalloCOSTE_MATER: TFloatField;
     QMProEscandalloCOSTE_MOBRA: TFloatField;
     QMProEscandalloCOSTE_MAQUI: TFloatField;
     QMProEscandalloCOSTE_TEXTE: TFloatField;
     QMProEscandalloCOSTE_TOTAL: TFloatField;
     QMProEscandalloFECHA_CREAC: TDateTimeField;
     QMProEscandalloNOTAS: TMemoField;
     QMProEscandalloDIBUJO: TMemoField;
     QMProEscandalloACTUALIZA_REC: TIntegerField;
     QMProEscandalloACTUALIZA_MAT: TIntegerField;
     QMProMatEsc: TFIBTableSet;
     DSQMProMatEsc: TDataSource;
     QMProMatEscEMPRESA: TIntegerField;
     QMProMatEscESCANDALLO: TIntegerField;
     QMProMatEscLINEA_COMP: TIntegerField;
     QMProMatEscALMACEN: TFIBStringField;
     QMProMatEscCOMPONENTE: TFIBStringField;
     QMProMatEscORDEN: TIntegerField;
     QMProMatEscUNIDADES: TFloatField;
     QMProMatEscPORCENTAJE: TFloatField;
     QMProMatEscLINEA_FASE: TIntegerField;
     QMProMatEscPRE_COS_UNI: TFloatField;
     QMProMatEscTOTAL_VAR: TFloatField;
     QMProMatEscPRECIO_FIJO: TFloatField;
     QMProMatEscTOTAL: TFloatField;
     QMProFasesEsc: TFIBTableSet;
     DSQMProFasesEsc: TDataSource;
     QMProFasesEscEMPRESA: TIntegerField;
     QMProFasesEscESCANDALLO: TIntegerField;
     QMProFasesEscLINEA_FASE: TIntegerField;
     QMProFasesEscFASE: TFIBStringField;
     QMProFasesEscORDEN: TIntegerField;
     QMProFasesEscTIPOFASE: TFIBStringField;
     QMProFasesEscNOTAS: TMemoField;
     QMProTareaEsc: TFIBTableSet;
     DSQMProTareaEsc: TDataSource;
     QMProTareaEscEMPRESA: TIntegerField;
     QMProTareaEscESCANDALLO: TIntegerField;
     QMProTareaEscLINEA_FASE: TIntegerField;
     QMProTareaEscLINEA_TAREA: TIntegerField;
     QMProTareaEscTAREA: TFIBStringField;
     QMProTareaEscORDEN: TIntegerField;
     QMProTareaEscTIPOTAREA: TFIBStringField;
     QMProTareaEscCOMENTARIO: TMemoField;
     QMProTareaEscCANTIDAD: TFloatField;
     QMProTareaEscPRE_COS_UNI: TFloatField;
     QMProTareaEscTOTAL_VAR: TFloatField;
     QMProTareaEscPRECIO_FIJO: TFloatField;
     QMProTareaEscTOTAL: TFloatField;
     QMProEscandalloCOSTE_VAR: TFloatField;
     QMProEscandalloDEFECTO: TIntegerField;
     QMProEscandalloDESCUNIDAD: TStringField;
     QMProFasesEscDescFase: TStringField;
     QMProDibEsc: TFIBTableSet;
     DSQMProDibEsc: TDataSource;
     xTituloArtMat: TFIBDataSetRO;
     xTituloArtMatTITULO: TFIBStringField;
     QMProTareaEscDescrTarea: TStringField;
     QMProTareaEscDescrRecurso: TStringField;
     QMProMatEscMATESC: TIntegerField;
     QMProMatEscPRECIOMAT: TFloatField;
     xTituloArtMatP_COSTE: TFloatField;
     QMProFasesEscDIBUJO: TFIBStringField;
     QMProEscandalloALMACEN_ENT: TFIBStringField;
     QMProEscandalloALMACEN_LAN: TFIBStringField;
     QMProFasesEscENTRADA: TIntegerField;
     QMProTareaEscENTRADA: TIntegerField;
     QMProEscandalloENTRADA: TIntegerField;
     QMProMatEscENTRADA: TIntegerField;
     QMProTareaEscRECURSO: TFIBStringField;
     QMProEscandalloAUTO_CALC: TIntegerField;
     QMProEscandalloTIPO_PRECIO: TIntegerField;
     DSTipo_Precio: TDataSource;
     QMProMatEscTIPO_PRECIO: TIntegerField;
     QMProMatEsclkTIPO_PRECIO: TStringField;
     QMProEscandalloAUTO_ENTRADA: TIntegerField;
     QMProFasesEscACTUALIZA_REC: TIntegerField;
     QMProFasesEscACTUALIZA_MAT: TIntegerField;
     QMProMatEscACTUALIZA_MAT: TIntegerField;
     QMProTareaEscACTUALIZA_REC: TIntegerField;
     xTipoPrecio: TFIBDataSetRO;
     xTipoPrecioTIPO_PRECIO_BASE: TIntegerField;
     xTipoPrecioTITULO: TFIBStringField;
     QMProEscandalloGENERA_OF: TIntegerField;
     xCostesTEsc: TFIBDataSetRO;
     DSxCostesTEsc: TDataSource;
     QMProMatEscNOTAS: TBlobField;
     QMProTareaEscID_UTILLAJES: TFIBStringField;
     QMProMatEscMEDIDAS: TFIBStringField;
     QMProMatEscTIPO_PIEZA: TFIBStringField;
     QMProMatEscNUM_PIEZAS: TFIBStringField;
     QMProEscandalloISO_APROBADO: TIntegerField;
     QMProEscandalloISO_VERIFICADO: TIntegerField;
     QMProEscandalloISO_VALIDADO: TIntegerField;
     QMProDibEscEMPRESA: TIntegerField;
     QMProDibEscESCANDALLO: TIntegerField;
     QMProDibEscRUTA: TFIBStringField;
     QMProDibEscLINEA: TIntegerField;
     QMProDibEscID_IMAGEN: TIntegerField;
     QMProDibEscNOMBRE: TFIBStringField;
     QMProFasesEscID_IMAGEN: TIntegerField;
     QMProEscandalloALMACEN_SAL: TFIBStringField;
     QMProTareaEscDESC_UTILLAJE: TFIBStringField;
     QMProTareaEscTIME: TStringField;
     QMProTareaEscTIEMPO: TFloatField;
     QMProMatEscUNIDAD_ART: TFIBStringField;
     QMProMatEscUNIDAD_FAB: TFIBStringField;
     xTituloArtMatUNIDADES: TFIBStringField;
     QMProEscandalloCOSTE_UNITARIO: TFloatField;
     QMProEscandalloTIPO: TFIBStringField;
     QMProDibEscTIPO: TFIBStringField;
     QMProFasesEscTIPO: TFIBStringField;
     QMProTareaEscTIPO: TFIBStringField;
     QMProMatEscTIPO: TFIBStringField;
     QMProEscandalloID_DETALLES_OFERTAS_V: TIntegerField;
     QMProEscandalloID_ESC: TIntegerField;
     QMProMatEscID_ESC: TIntegerField;
     QMProMatEscID_EQUIVAL: TIntegerField;
     QMProEscandalloTITULO: TFIBStringField;
     QMProEscandalloTITULO_ALMACEN_E: TFIBStringField;
     QMProEscandalloTITULO_ALMACEN_L: TFIBStringField;
     QMProEscandalloTITULO_ALMACEN_S: TFIBStringField;
     QMProTareaEscID_ESC: TIntegerField;
     QMProTareaEscOPERACIONES_NUM: TIntegerField;
     QMProTareaEscOPERACIONES_TIEMPO: TIntegerField;
     QMProTareaEscCOSTE_OPERACIONES: TFloatField;
     QMProEscandalloMEDIDA_4: TFloatField;
     QMProEscandalloDESCRIPCION: TFIBStringField;
     QMProMatEscDES_TIPO_PIEZA: TFIBStringField;
     QMProMatEscDES_CANTIDAD_TPIEZA: TFloatField;
     QMProMatEscDES_ALTO: TFloatField;
     QMProMatEscDES_ANCHO: TFloatField;
     QMProMatEscDES_GRUESO: TFloatField;
     QMProMatEscDES_METROS_DESCONTAR: TFloatField;
     QMProMatEscDescDesTPieza: TStringField;
     xDesTPieza: TFIBDataSetRO;
     xDesTPiezaDESCRIPCION: TFIBStringField;
     QMProMatEscDES_TIPO_MATERIAL: TFIBStringField;
     QMProMatEscDescDesTMaterial: TStringField;
     xDesTMaterial: TFIBDataSetRO;
     xDesTMaterialDESCRIPCION: TFIBStringField;
     QMProEscandalloMARGEN_MAQUI: TFloatField;
     QMProEscandalloMARGEN_MATER: TFloatField;
     QMProEscandalloMARGEN_OPE: TFloatField;
     QMProEscandalloMARGEN_VAR: TFloatField;
     QMProEscandalloMARGEN_TRAB: TFloatField;
     QMProEscandalloCLIENTE: TIntegerField;
     QMProEscandalloUSA_P_OPTIMO: TIntegerField;
     QMProMatEscunidades_por_compuesto: TFloatField;
     QMProTareaEsccantidad_por_compuesto: TFloatField;
     QMProTareaEsctiempo_por_compuesto: TFloatField;
     QMProEscandalloTIPO_CONTROL: TIntegerField;
     QMProDibEscID_ESC: TIntegerField;
     QMProFasesEscID_ESC: TIntegerField;
     QMProMatEscLINEA_TAREA: TIntegerField;
     QMProMatEscMINI_NOTA: TFIBStringField;
     QMProEscandalloDescEstado: TStringField;
     QMProMatEscPORCENT_SN: TIntegerField;
     QMProMatEscDENSIDAD: TFloatField;
     QMProMatEscUNIDADES_DENSIDAD: TFloatField;
     QMProEscandalloPOptUni: TStringField;
     QMProEscandalloPOptTotal: TStringField;
     QMProEscandalloBen_tot_opt: TStringField;
     QMProEscandalloBen_tot: TStringField;
     QMProEscandalloBen_opt_uni_por: TStringField;
     QMProEscandalloBen_opt_uni: TStringField;
     QMProEscandalloBen_uni_por: TStringField;
     QMProEscandalloBen_uni: TStringField;
     QMProEscandalloPrecio_total: TStringField;
     QMProEscandalloPrecio_uni: TStringField;
     QMProEscandalloESTADO: TIntegerField;
     QMProMatEscRESULTADO_FORMULA: TFloatField;
     QMProMatEscFORMULA: TIntegerField;
     QMProEscandalloRESPONSABLE: TIntegerField;
     QMProMatEscMERMA: TFloatField;
     QMProMatEscDESACTIVA_TRIGGER: TIntegerField;
     QMProEscandalloPLAZO_FABRICACION: TIntegerField;
     QMProEscandalloCOSTE_HMAQUINA: TFloatField;
     QMProEscandalloCOSTE_HOPERARIO: TFloatField;
     QMProEscandalloMERMA: TFloatField;
     QMProEscandalloLOTE_OPTIMO: TFloatField;
     QMProFasesEscREBAJE: TIntegerField;
     QMProEscandalloTOTAL_COMPONENTES: TIntegerField;
     QMProEscandalloTOTAL_PESO: TFloatField;
     QMProTareaEscFORMULA: TIntegerField;
     QMProTareaEscID_TAREA: TIntegerField;
     QMProTareaEscRESULTADO_FORMULA: TFloatField;
     QMProTareaEscUNIDADES: TFloatField;
     QMProTareaEscTIEMPO_UNITARIO: TFloatField;
     QMProMatEscID_MATERIAL: TIntegerField;
     QMProEscandalloVERSION_ESCANDALLO: TFIBStringField;
     QMProTareaEscCAMPO_1: TFloatField;
     QMProTareaEscCAMPO_2: TFloatField;
     QMProEscandalloCOSTE_HEXTERNOS: TFloatField;
     QMProEscandalloCOSTE_HVARIOS: TFloatField;
     QMProFasesEscMERMA_FASE: TFloatField;
     QMProFasesEscPIEZAS_HORA: TFloatField;
     QMProMatEscALMACEN_SAL: TFIBStringField;
     TUpdate: THYTransaction;
     QMProTareaEscMAQUINA: TIntegerField;
     QMProTareaEscSECCION: TFIBStringField;
     QMProEscandalloTIEMPO_ESTIMADO_FABRICACION: TFloatField;
     xCostesTEscCOSTE_FIJO: TFloatField;
     xCostesTEscCOSTE_MATER: TFloatField;
     xCostesTEscCOSTE_MAQUI_VAR: TFloatField;
     xCostesTEscCOSTE_MAQUI_ABS: TFloatField;
     xCostesTEscCOSTE_MOBRA_VAR: TFloatField;
     xCostesTEscCOSTE_MOBRA_ABS: TFloatField;
     xCostesTEscCOSTE_VAR_VAR: TFloatField;
     xCostesTEscCOSTE_VAR_ABS: TFloatField;
     xCostesTEscCOSTE_TEXTE_VAR: TFloatField;
     xCostesTEscCOSTE_TEXTE_ABS: TFloatField;
     xCostesTEscCOSTE_UNITARIO: TFloatField;
     xCostesTEscCOSTE_TOTAL: TFloatField;
     QMProEscandalloSUBTIPO: TFIBStringField;
     QMProTareaEscORDEN_OF: TIntegerField;
     xTareaEscNotas: TFIBTableSet;
     DSxTareaEscNotas: TDataSource;
     xTareaEscNotasEMPRESA: TIntegerField;
     xTareaEscNotasESCANDALLO: TIntegerField;
     xTareaEscNotasTIPO: TFIBStringField;
     xTareaEscNotasLINEA_FASE: TIntegerField;
     xTareaEscNotasLINEA_TAREA: TIntegerField;
     xTareaEscNotasCOMENTARIO: TMemoField;
     xMaterialesEscNotas: TFIBTableSet;
     DSxMaterialesEscNotas: TDataSource;
     xMaterialesEscNotasEMPRESA: TIntegerField;
     xMaterialesEscNotasESCANDALLO: TIntegerField;
     xMaterialesEscNotasTIPO: TFIBStringField;
     xMaterialesEscNotasLINEA_COMP: TIntegerField;
     xMaterialesEscNotasNOTAS: TMemoField;
     QMProTareaEscNO_PRODUCTIVA: TIntegerField;
     QMProMatEscDESC_ALMACEN: TFIBStringField;
     QMProMatEscDESC_ARTICULO: TFIBStringField;
     QMProMatEscDECIMALES_UNIDAD_FAB: TIntegerField;
     QMProMatEscP_COSTE: TFloatField;
     QMProMatEscDECIMALES_UNIDAD_ART: TIntegerField;
     QMProMatEscDESC_TIPO_PIEZA: TFIBStringField;
     QMProMatEscDESC_TIPO_MATERIAL: TFIBStringField;
     QMProMatEscTIENE_ADJUNTO: TIntegerField;
     QMProMatEscUNIDADES_FIJAS: TSmallintField;
     QMTmpCostesEscandallos: TFIBTableSet;
     DSTmpCostesEscandallos: TDataSource;
     QMTmpCostesEscandallosID_ESC: TIntegerField;
     QMTmpCostesEscandallosUNIDADES: TFloatField;
     QMTmpCostesEscandallosCOSTE_MATERIAL: TFloatField;
     QMTmpCostesEscandallosCOSTE_TAREA: TFloatField;
     QMTmpCostesEscandallosCOSTE_TOTAL: TFloatField;
     QMTmpCostesEscandallosPRECIO_UNITARIO: TFloatField;
     QMTmpCostesEscandallosMARGEN: TFloatField;
     QMTmpCostesEscandallosPRECIO_VENTA: TFloatField;
     QMTmpCostesEscandallosPRECIO_MARGEN: TFloatField;
     QMCalculoMetros: TFIBTableSet;
     DSQMCalculoMetros: TDataSource;
     QMCalculoMetrosEMPRESA: TIntegerField;
     QMCalculoMetrosESCANDALLO: TIntegerField;
     QMCalculoMetrosTIPO: TFIBStringField;
     QMCalculoMetrosANCHO: TFloatField;
     QMCalculoMetrosLARGO: TFloatField;
     QMCalculoMetrosCOLORES: TIntegerField;
     QMCalculoMetrosTROQUEL: TIntegerField;
     QMCalculoMetrosSH_ANCHO_TROQUEL: TFloatField;
     QMCalculoMetrosFIGURAS_ANCHO_TROQUEL: TFloatField;
     QMCalculoMetrosSV_AVANCE_TROQUEL: TFloatField;
     QMCalculoMetrosFIGURAS_AVANCE_TROQUEL: TFloatField;
     QMCalculoMetrosARTICULO: TFIBStringField;
     QMCalculoMetrosANCHO_ARTICULO: TFloatField;
     QMCalculoMetrosMAQUINA: TIntegerField;
     QMCalculoMetrosVELOCIDAD_MAQUINA: TFloatField;
     QMCalculoMetrosCALCULO_1: TFloatField;
     QMCalculoMetrosCALCULO_2: TFloatField;
     QMCalculoMetrosCALCULO_3: TFloatField;
     QMCalculoMetrosCILINDRO: TIntegerField;
     QMProFasesEscID_FASE: TIntegerField;
     QMTmpCostesEscandallosMARGEN_2: TFloatField;
     QMTmpCostesEscandallosMARGEN_3: TFloatField;
     QMTmpCostesEscandallosPRECIO_MARGEN_2: TFloatField;
     QMTmpCostesEscandallosPRECIO_MARGEN_3: TFloatField;
     QMProEscandalloUNIDADES_POR_CAJA: TFloatField;
     QMProEscandalloCAJAS_POR_BULTO: TFloatField;
     QMProMatEscTIENE_SUBESCANDALLO: TIntegerField;
     QMProMatEscULT_MODIFICACION: TDateTimeField;
     QMProMatEscSTOCK: TFloatField;
     QMProMatEscSTOCK_ALM_LAN: TFloatField;
     QMProMatEscCONTROL_STOCK: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProEscandalloNewRecord(DataSet: TDataSet);
     procedure QMProEscandalloCOMPUESTOChange(Sender: TField);
     procedure QMProEscandalloAfterScroll(DataSet: TDataSet);
     procedure QMProEscandalloBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProFasesEscNewRecord(DataSet: TDataSet);
     procedure QMProDibEscNewRecord(DataSet: TDataSet);
     procedure QMProMatEscNewRecord(DataSet: TDataSet);
     procedure QMProFasesEscAfterScroll(DataSet: TDataSet);
     procedure QMProTareaEscNewRecord(DataSet: TDataSet);
     procedure QMProMatEscCOMPONENTEChange(Sender: TField);
     procedure QMProFasesEscTIPOFASEChange(Sender: TField);
     procedure QMProTareaEscRECURSOChange(Sender: TField);
     procedure QMProEscandalloAfterPost(DataSet: TDataSet);
     procedure QMProTareaEscCANTIDADChange(Sender: TField);
     procedure QMProTareaEscPRE_COS_UNIChange(Sender: TField);
     procedure QMProTareaEscPRECIO_FIJOChange(Sender: TField);
     procedure QMProMatEscUNIDADESChange(Sender: TField);
     procedure QMProMatEscPRE_COS_UNIChange(Sender: TField);
     procedure QMProMatEscPRECIO_FIJOChange(Sender: TField);
     procedure QMProEscandalloCOSTE_FIJOChange(Sender: TField);
     procedure QMProMatEscBeforePost(DataSet: TDataSet);
     procedure QMProFasesEscBeforePost(DataSet: TDataSet);
     procedure QMProTareaEscBeforePost(DataSet: TDataSet);
     procedure QMProDibEscAfterScroll(DataSet: TDataSet);
     procedure QMProFasesEscAfterOpen(DataSet: TDataSet);
     procedure QMProTareaEscID_UTILLAJESChange(Sender: TField);
     procedure QMProTareaEscAfterScroll(DataSet: TDataSet);
     procedure QMProTareaEscTIEMPOChange(Sender: TField);
     procedure QMProTareaEscCalcFields(DataSet: TDataSet);
     procedure QMProEscandalloUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProMatEscUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProTareaEscCOSTE_OPERACIONESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProTareaEscOPERACIONES_NUMChange(Sender: TField);
     procedure QMProTareaEscOPERACIONES_TIEMPOChange(Sender: TField);
     procedure QMProMatEscDES_TIPO_PIEZAChange(Sender: TField);
     procedure QMProMatEscDES_TIPO_MATERIALChange(Sender: TField);
     procedure QMProDibEscNOMBREGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProMatEscunidades_por_compuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProTareaEsccantidad_por_compuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProTareaEsctiempo_por_compuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure CalculaCosteUnitarioOptimo;
     procedure CalculaCosteTotalOptimo;
     procedure RecalculaPrecios(Sender: TField);
     procedure CalculaBeneficios;
     procedure CalculaPrecioVenta;
     procedure QMProEscandalloCLIENTEChange(Sender: TField);
     procedure QMProEscandalloCalcFields(DataSet: TDataSet);
     procedure QMProMatEscUNIDADES_DENSIDADChange(Sender: TField);
     procedure QMProMatEscAfterEdit(DataSet: TDataSet);
     procedure QMProTareaEscAfterEdit(DataSet: TDataSet);
     procedure QMProFasesEscAfterEdit(DataSet: TDataSet);
     procedure QMProDibEscAfterEdit(DataSet: TDataSet);
     procedure QMProEscandalloBeforeClose(DataSet: TDataSet);
     procedure QMProFasesEscBeforeClose(DataSet: TDataSet);
     procedure QMProMatEscAfterOpen(DataSet: TDataSet);
     procedure QMProMatEscBeforeClose(DataSet: TDataSet);
     procedure QMProTareaEscTIPOTAREAChange(Sender: TField);
     procedure QMProTareaEscTIMEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProTareaEscAfterOpen(DataSet: TDataSet);
     procedure QMProTareaEscBeforeClose(DataSet: TDataSet);
     procedure QMTmpCostesEscandallosNewRecord(DataSet: TDataSet);
     procedure QMCalculoMetrosNewRecord(DataSet: TDataSet);
     procedure QMCalculoMetrosTROQUELChange(Sender: TField);
     procedure QMProMatEscCalcFields(DataSet: TDataSet);
     procedure QMProMatEscSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProMatEscSTOCK_ALM_LANGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     DEFECTO_ValorAntiguo: integer;
     PrecioOptimoUnitario, PrecioVentaUnitario, PrecioVentaTotal, PrecioOptimoTotal: double;
     AlmacenEnt, AlmacenLan, AlmacenSal: string;
     Posicionando: boolean;
     procedure CalculaFormulas2(procedencia: string; id_mat_tar: integer; Tipo: string; Escandallo: integer);
  public
     { Public declarations }
     ModTiempo: boolean;
     FTipo: string;
     FiltroEsc: string;
     procedure BusquedaCompleja;
     procedure PreparaNotasDetalle(Tabla: TFIBTableSet);
     procedure CompruebaFirma(Tipo, IdFirma: integer);
     function EstadoFirma(IdFirma: integer): smallint;
     function HayMateriales: boolean;
     procedure CalculaTiempo;
     procedure CambiarEstado(Estado: integer; IDEsc: integer = 0);
     function CalculaTotalVar_Tarea: double;
     function CalculaTotal_Tarea: double;
     function NoAccesActivo(modul: TFIBTableSet): integer;
     procedure ValorDefecto(tipus: integer);
     procedure CalculaFormulas(Tipo: string; Escandallo: integer);
     procedure CompruebaFases;
     procedure OrdenarLineas(Tipo: string);
     procedure CalculaFormulasFiltro;
     procedure ActualizarPCosteArticulosFiltro;
     procedure ActualizarPrecios(Escandallo: integer; Tipo: string = '');
     procedure ActualizarPreciosFiltro; //sfg.albert
     function TotalEscandallosFiltro: integer; //sfg.albert
     procedure FiltraEscandallo(Tipo, Filtro: string);
     procedure VerificarCompuestoEscandallo(Compuesto: string);
     procedure PropagaAlmacenLanzamientoAMateriales;
     procedure ActualizaDefecto;
     procedure PosicionaEscandallo(Escandallo: integer);
     procedure OptimizaBusqueda(Optimizar: boolean);
     procedure InsertaMaterial(Articulo, Titulo, Familia, Subfamilia, CodigoProveedor: string; Unidades, Precio: double; Proveedor: integer; PCoste: double; NoCrearEscandallo: array of string);
     procedure CopiaNotasAModelo;
     procedure DuplicarTarea(Empresa, Escandallo, Linea_fase, Linea_tarea: integer; Tipo: string);
     procedure DuplicarMaterial(Empresa, Escandallo, Linea_comp: integer; Tipo: string);
     procedure RecalcularCostesPorUnidades;
     procedure CambiarEstadoFiltrados(Estado: integer);
     procedure DameDatosTroquel(Troquel: integer);
     procedure CrearDesarrolloEscandallo;
  end;

var
  ProDMEscandallo : TProDMEscandallo;

implementation

uses UDMMain, UEntorno, UFBusca, UProFMEscandallo, UUtiles, UDameDato, UFormGest, UFOrdenaLineas, UParam, UImagenes;

{$R *.dfm}

procedure TProDMEscandallo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Para poder obtener stock, agrego canal del entorno ya que escandallo no lo tiene.
  with QMProMatEsc do
  begin
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT M.*, AL.TITULO DESC_ALMACEN, AR.TITULO_LARGO DESC_ARTICULO, U.DECIMALES DECIMALES_UNIDAD_FAB, AR.P_COSTE, ');
     SelectSQL.Add('        UAR.DECIMALES DECIMALES_UNIDAD_ART, TP.DESCRIPCION DESC_TIPO_PIEZA, TM.DESCRIPCION DESC_TIPO_MATERIAL, ');
     SelectSQL.Add('        AR.CONTROL_STOCK, ST_ALM_SAL.STOCK, ST_ALM_LAN.STOCK STOCK_ALM_LAN, ');
     SelectSQL.Add('        CASE ');
     SelectSQL.Add('          WHEN EXISTS(SELECT * ');
     SelectSQL.Add('                      FROM EMP_ADJUNTOS_RELACION ');
     SelectSQL.Add('                      WHERE ');
     SelectSQL.Add('                      TIPO = ''ART'' AND ');
     SelectSQL.Add('                      ID = AR.ID_A) THEN ');
     SelectSQL.Add('              1 ');
     SelectSQL.Add('          ELSE 0 ');
     SelectSQL.Add('        END TIENE_ADJUNTO, ');
     SelectSQL.Add('        CASE ');
     SelectSQL.Add('          WHEN EXISTS(SELECT * ');
     SelectSQL.Add('                      FROM PRO_ESCANDALLO ');
     SelectSQL.Add('                      WHERE ');
     SelectSQL.Add('                      EMPRESA = M.EMPRESA AND ');
     SelectSQL.Add('                      COMPUESTO = M.COMPONENTE AND ');
     SelectSQL.Add('                      TIPO = ''EPR'') THEN ');
     SelectSQL.Add('              1 ');
     SelectSQL.Add('          ELSE 0 ');
     SelectSQL.Add('        END TIENE_SUBESCANDALLO ');
     SelectSQL.Add(' FROM PRO_MAT_ESC M ');
     SelectSQL.Add(' JOIN ART_ALMACENES AL ON M.EMPRESA = AL.EMPRESA AND M.ALMACEN = AL.ALMACEN ');
     SelectSQL.Add(' JOIN ART_ARTICULOS AR ON M.EMPRESA = AR.EMPRESA AND M.COMPONENTE = AR.ARTICULO ');
     SelectSQL.Add(' JOIN SYS_UNIDADES_ARTICULOS U ON M.UNIDAD_FAB = U.TIPO ');
     SelectSQL.Add(' JOIN SYS_UNIDADES_ARTICULOS UAR ON AR.UNIDADES = UAR.TIPO ');
     SelectSQL.Add(' JOIN PRO_DES_TIPO_PIEZA TP ON TP.CODIGO = M.DES_TIPO_PIEZA ');
     SelectSQL.Add(' JOIN PRO_DES_CAB_MATERIAL TM ON TM.TIPO = M.DES_TIPO_MATERIAL ');
     SelectSQL.Add(' LEFT JOIN A_ART_DAME_STOCK3(M.EMPRESA, ' + REntorno.CanalStr + ', M.ALMACEN_SAL, M.COMPONENTE, ''NOW'') ST_ALM_SAL ON 1 = 1 ');
     SelectSQL.Add(' LEFT JOIN A_ART_DAME_STOCK3(M.EMPRESA, ' + REntorno.CanalStr + ', M.ALMACEN, M.COMPONENTE, ''NOW'') ST_ALM_LAN ON 1 = 1 ');
     SelectSQL.Add(' WHERE ');

     SelectSQL.Add(' M.ESCANDALLO = :ESCANDALLO AND ');
     SelectSQL.Add(' M.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' M.LINEA_FASE = :LINEA_FASE AND ');
     SelectSQL.Add(' M.TIPO = :TIPO ');

     RefreshSQL.Text := SelectSQL.Text;

     SelectSQL.Add(' ORDER BY M.ORDEN, M.LINEA_COMP ');
     RefreshSQL.Add(' AND M.LINEA_COMP = :LINEA_COMP ');
  end;

  // Mascaras
  AsignaDisplayFormat(QMProEscandallo, MascaraL, MascaraI, ShortDateFormat);

  QMProEscandalloUNIDADES.DisplayFormat := MascaraN;
  QMProEscandalloUNIDADES_POR_CAJA.DisplayFormat := MascaraN;
  QMProEscandalloCAJAS_POR_BULTO.DisplayFormat := MascaraN;
  QMProEscandalloMEDIDA_1.DisplayFormat := MascaraN;
  QMProEscandalloMEDIDA_2.DisplayFormat := MascaraN;
  QMProEscandalloMEDIDA_3.DisplayFormat := MascaraN;
  QMProEscandalloMEDIDA_4.DisplayFormat := MascaraN;
  QMProEscandalloLOTE_OPTIMO.DisplayFormat := MascaraN;
  QMProEscandalloMARGEN_MAQUI.DisplayFormat := MascaraP;
  QMProEscandalloMARGEN_MATER.DisplayFormat := MascaraP;
  QMProEscandalloMARGEN_OPE.DisplayFormat := MascaraP;
  QMProEscandalloMARGEN_VAR.DisplayFormat := MascaraP;
  QMProEscandalloMARGEN_TRAB.DisplayFormat := MascaraP;
  QMProEscandalloMERMA.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMProFasesEsc, MascaraL, MascaraI, ShortDateFormat);
  QMProFasesEscMERMA_FASE.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMProMatEsc, MascaraL, MascaraI, ShortDateFormat);
  QMProMatEscUNIDADES.DisplayFormat := MascaraN;
  QMProMatEscPORCENTAJE.DisplayFormat := MascaraP;
  QMProMatEscDENSIDAD.DisplayFormat := ',##0.000';

  AsignaDisplayFormat(QMProTareaEsc, MascaraL, MascaraI, ShortDateFormat);
  QMProTareaEscUNIDADES.DisplayFormat := MascaraN;
  QMProTareaEscPRECIO_FIJO.DisplayFormat := MascaraI;
  QMProTareaEscTIEMPO.DisplayFormat := ',##0.000';

  AsignaDisplayFormat(xCostesTEsc, MascaraL, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(QMTmpCostesEscandallos, MascaraL, MascaraI, ShortDateFormat);
  QMTmpCostesEscandallosUNIDADES.DisplayFormat := MascaraN;
  QMTmpCostesEscandallosMARGEN.DisplayFormat := MascaraN;
  QMTmpCostesEscandallosMARGEN_2.DisplayFormat := MascaraN;
  QMTmpCostesEscandallosMARGEN_3.DisplayFormat := MascaraN;

  Posicionando := False;

  {No es necesario abrir. Se abre mediante UProFMEscandallo.FiltraEscandallo que llama a UProDMEscandallo.FiltraEscandallo}
  DMMain.FiltraTabla(QMProEscandallo, '10000', False);
  xTipoPrecio.Open;
  ModTiempo := False;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN_ENT, ALMACEN_LAN, ALMACEN_SAL FROM PRO_CONSTANTES WHERE EMPRESA=?EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        AlmacenEnt := FieldByName['ALMACEN_ENT'].AsString;
        AlmacenLan := FieldByName['ALMACEN_LAN'].AsString;
        AlmacenSal := FieldByName['ALMACEN_SAL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProEscandalloMEDIDA_1.DisplayLabel := LeeParametro('MEDITIT001');
  QMProEscandalloMEDIDA_2.DisplayLabel := LeeParametro('MEDITIT002');
  QMProEscandalloMEDIDA_3.DisplayLabel := LeeParametro('MEDITIT003');
  QMProEscandalloMEDIDA_4.DisplayLabel := LeeParametro('MEDITIT004');
end;

procedure TProDMEscandallo.FiltraEscandallo(Tipo, Filtro: string);
begin
  FTipo := Tipo;
  FiltroEsc := Filtro;
  with QMProEscandallo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_VER_ESCANDALLO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' TIPO = ?TIPO AND ');
     SelectSQL.Add(' ESCANDALLO > 0 ');
     if (Filtro <> '') then
        SelectSQL.Add(' AND ' + Filtro);
     SelectSQL.Add(' ORDER BY ESCANDALLO, FECHA_CREAC ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TIPO'].AsString := FTipo;
     Open;

     // Fuerzo refresco de arbol si no pasa por AfterScroll
     if (EOF) then
        ProFMEscandallo.ArbolEsc;
  end;
end;

procedure TProDMEscandallo.BusquedaCompleja;
var
  Orden : string;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProEscandallo, '00000', False);
  with QMProEscandallo do
  begin
     Orden := OrdenadoPor;
     Ordenar('');
     SelectSQL.Add(' AND EMPRESA = ?EMPRESA AND TIPO = ?TIPO ');
     Ordenar(Orden);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TIPO'].AsString := FTipo;
     Open;

     // Fuerzo refresco de arbol si no pasa por AfterScroll
     if (EOF) then
        ProFMEscandallo.ArbolEsc;
  end;
end;

procedure TProDMEscandallo.QMProEscandalloNewRecord(DataSet: TDataSet);
begin
  DEFECTO_ValorAntiguo := 0;
  ProFMEscandallo.Arbol.Items.Clear;
  QMProEscandalloEMPRESA.Value := REntorno.Empresa;
  QMProEscandalloTIPO.Value := FTipo; // Escandall en producció
  QMProEscandalloSUBTIPO.AsString := 'NOR';
  QMProEscandalloFECHA_CREAC.Value := REntorno.FechaTrab;
  // QMProEscandalloESTADO.Value    := 0;
  QMProEscandalloDEFECTO.Value := 0;
  // QMProEscandalloGENERA_OF.Value := 0;

  QMProEscandalloTIPO_PRECIO.Value := -1;
  // QMProEscandalloAUTO_ENTRADA.Value := 0;
  // QMProEscandalloAUTO_CALC.Value := 0;
  // QMProEscandalloACTUALIZA_MAT.Value := 1;
  // QMProEscandalloACTUALIZA_REC.Value := 1;

  QMProEscandalloISO_APROBADO.Value := 0;
  QMProEscandalloISO_VERIFICADO.Value := 0;
  QMProEscandalloISO_VALIDADO.Value := 0;

  QMProEscandalloALMACEN_ENT.AsString := AlmacenEnt;
  QMProEscandalloALMACEN_LAN.AsString := AlmacenLan;
  // KRICONF-493 - Temas especificos de JVV
  if ((DMMain.EstadoKri(493) = 1) and (DMMain.DameFamiliaArticulo(QMProEscandalloCOMPUESTO.AsString, REntorno.Empresa) = '36')) then
     QMProEscandalloALMACEN_LAN.AsString := '006'
  else
     QMProEscandalloALMACEN_LAN.AsString := AlmacenLan;

  QMProEscandalloALMACEN_SAL.AsString := AlmacenSal;
  QMProEscandalloUNIDADES.AsFloat := StrToIntDef(LeeParametro('PROESCA001'), 1);
  QMProEscandalloMEDIDA_1.AsFloat := 0;
  QMProEscandalloMEDIDA_2.AsFloat := 0;
  QMProEscandalloMEDIDA_3.AsFloat := 0;
  QMProEscandalloMEDIDA_4.AsFloat := 0;
  QMProEscandalloCOSTE_FIJO.AsFloat := 0;
  QMProEscandalloPLAZO_FABRICACION.AsInteger := 0;
  QMProEscandalloTIEMPO_ESTIMADO_FABRICACION.AsFloat := 0;

  QMProEscandalloTIPO_CONTROL.AsInteger := 0;
  QMProEscandalloUNIDAD.AsString := '-';
  QMProEscandalloCOSTE_HMAQUINA.AsFloat := 0;
  QMProEscandalloCOSTE_HOPERARIO.AsFloat := 0;
  QMProEscandalloCOSTE_HEXTERNOS.AsFloat := 0;
  QMProEscandalloCOSTE_HVARIOS.AsFloat := 0;
  QMProEscandalloLOTE_OPTIMO.AsFloat := 1;
  QMProEscandalloMERMA.AsFloat := 0;
  QMProEscandalloUNIDADES_POR_CAJA.AsInteger := 1;
  QMProEscandalloCAJAS_POR_BULTO.AsInteger := 0;

  ValorDefecto(1);

  // Foco en compuesto
  ProFMEscandallo.DBEFCompuesto.SetFocus;

  // Por defecto el cliente en precios es -1
  if (QMProEscandalloCLIENTE.AsInteger = 0) then
     QMProEscandalloCLIENTE.AsInteger := -1;

  // Es posa el empleado assignat a l'usuari com a responsable de l'escandall
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPLEADO FROM SYS_USUARIOS WHERE USUARIO = ?USUARIO';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        QMProEscandalloRESPONSABLE.AsInteger := FieldByName['EMPLEADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMEscandallo.QMProEscandalloCOMPUESTOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT UNIDADES FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMProEscandalloCOMPUESTO.AsString;
        ExecQuery;
        QMProEscandalloUNIDAD.AsString := FieldByName['UNIDADES'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no hay otra definicion para el escandallo, este se marca por DEFECTO.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM PRO_ESCANDALLO WHERE EMPRESA = :EMPRESA AND COMPUESTO = :COMPUESTO';
        Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
        Params.ByName['COMPUESTO'].AsString := QMProEscandalloCOMPUESTO.AsString;
        ExecQuery;
        if (FieldByName['COUNT'].AsInteger = 0) then
           QMProEscandalloDEFECTO.AsInteger := 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (QMProEscandallo.State = dsInsert) then
  begin
     // La descripción del compuesto en el escandallo lleva o no el código del artículo concatenado
     if (DMMain.EstadoKRI(513) = 1) then
        QMProEscandalloDESCRIPCION.AsString := Copy(DameTituloArticulo(QMProEscandalloCOMPUESTO.AsString), 0, 100)
     else
        QMProEscandalloDESCRIPCION.AsString := Copy(QMProEscandalloCOMPUESTO.AsString + ' - ' + DameTituloArticulo(QMProEscandalloCOMPUESTO.AsString), 0, 100);

     // KRICONF-493 - Temas especificos de JVV
     if ((DMMain.EstadoKri(493) = 1) and (DMMain.DameFamiliaArticulo(QMProEscandalloCOMPUESTO.AsString, REntorno.Empresa) = '36')) then
     begin
        QMProEscandalloALMACEN_LAN.AsString := '006';
        QMProEscandalloALMACEN_ENT.AsString := '003';
     end
     else
     begin
        QMProEscandalloALMACEN_LAN.AsString := AlmacenLan;
        QMProEscandalloALMACEN_ENT.AsString := AlmacenEnt;
     end;
  end;
end;

procedure TProDMEscandallo.QMProEscandalloAfterScroll(DataSet: TDataSet);
begin
  if (not Posicionando) then
  begin
     {
     Esto creo que es un error
     if QMProEscandallo.State <> dsInsert then
        if ((ProFMEscandallo.PCMain.ActivePage = ProFMEscandallo.TSFicha) and
           (QMProEscandallo.RecordCount > 0)) then
           QMProEscandallo.Refresh;
     }
     DEFECTO_ValorAntiguo := QMProEscandalloDEFECTO.AsInteger;

     if QMProEscandallo.State = dsBrowse then
        ProFMEscandallo.ArbolEsc;

     // Borro la imatge en pantalla
     ProFMEscandallo.EscImagen.Picture.Bitmap := nil;
     {Solo si la tabla esta activa - Significa que la ficha tambien esta activa}
     if (QMProDibEsc.Active) then
        if (QMProDibEsc.RecordCount <> 0) then
        begin
           QMProDibEsc.First;
           RefrescarImagen(ProFMEscandallo.EscImagen, QMProDibEscID_IMAGEN.AsInteger);
        end;

     // Marcamos los checks de firmas ISO segun si tienen firma o no
     ProFMEscandallo.ChecksFirmas(
        EstadoFirma(QMProEscandalloISO_APROBADO.AsInteger),
        EstadoFirma(QMProEscandalloISO_VERIFICADO.AsInteger),
        EstadoFirma(QMProEscandalloISO_VALIDADO.AsInteger));
     CalculaCosteUnitarioOptimo;
     CalculaCosteTotalOptimo;
     CalculaPrecioVenta;
  end;
end;

procedure TProDMEscandallo.QMProEscandalloBeforePost(DataSet: TDataSet);
var
  EscandalloPorDefecto, IDEscandalloPorDefecto : integer;
  EstadoEscandallo : integer;
  DS : TFIBDataSet;
begin
  if (DataSet.State = dsInsert) then
  begin
     if (QMProEscandalloTIPO.AsString = 'EPR') then
     begin
        QMProEscandalloEscandallo.AsInteger := DMMain.Contador_E('ZES');
     end;
     if (QMProEscandalloTIPO.AsString = 'OFE') then
     begin
        QMProEscandalloEscandallo.AsInteger := DMMain.Contador_E('ZOE');
     end;
  end;

  // Miro que no haya más de un escandallo del mismo compuesto como por defecto
  if (QMProEscandalloDEFECTO.AsInteger > DEFECTO_ValorAntiguo) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ESCANDALLO, ID_ESC, ESTADO FROM PRO_ESCANDALLO WHERE EMPRESA = :EMPRESA AND COMPUESTO = :COMPUESTO AND DEFECTO = 1 AND TIPO = ?TIPO AND ESCANDALLO <> :ESCANDALLO';
           Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
           Params.ByName['COMPUESTO'].AsString := QMProEscandalloCOMPUESTO.AsString;
           Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
           Params.ByName['ESCANDALLO'].AsInteger := QMProEscandalloESCANDALLO.AsInteger;
           ExecQuery;
           EscandalloPorDefecto := FieldByName['ESCANDALLO'].AsInteger;
           IDEscandalloPorDefecto := FieldByName['ID_ESC'].AsInteger;
           EstadoEscandallo := FieldByName['ESTADO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Si hay algun otro Por Defecto
     if (EscandalloPorDefecto > 0) then
     begin
        if MessageDlg(_('Ya existe un escandallo por defecto de este compuesto.' +
           #13#10 + 'Solo puede existir un solo escandallo por defecto.' + #13#10 +
           '¿Desea que el actual sea el Por Defecto?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           // Quito la marca DEFECTO al escandallo

           // Deshabilito el escandallo si es necesario para poder hacer modificaciones
           if (EstadoEscandallo <> 0) then
              CambiarEstado(0, IDEscandalloPorDefecto);

           // Quito marca
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE PRO_VER_ESCANDALLO SET DEFECTO = 0 WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = :TIPO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['ESCANDALLO'].AsInteger := EscandalloPorDefecto;
                 Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Habilito el escandallo si estaba habilitado
           if (EstadoEscandallo <> 0) then
              CambiarEstado(EstadoEscandallo, IDEscandalloPorDefecto);

           // Verifico si hay componentes que utilizan el escandallo porfecto anterior
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
                    SelectSQL.Add(' SELECT ID_ESC ');
                    SelectSQL.Add(' FROM PRO_MAT_ESC ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
                    SelectSQL.Add(' MATESC = :MATESC AND ');
                    SelectSQL.Add(' TIPO = :TIPO ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['MATESC'].AsInteger := EscandalloPorDefecto;
                    Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
                    Open;
                    if not EOF then
                    begin
                       if MessageDlg(_('¿Desea modificar los escandallos que utilizan el antiguo escandallo por defecto por este escandallo?'),
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                       begin
                          // Recorro los escandallos que contienen al anterior escandallo por defecto
                          while not EOF do
                          begin
                             // Obtengo estado del escandallo
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Text := 'SELECT ESTADO FROM PRO_ESCANDALLO WHERE ID_ESC = :ID_ESC';
                                   Params.ByName['ID_ESC'].AsInteger := DS.FieldByName('ID_ESC').AsInteger;
                                   ExecQuery;
                                   EstadoEscandallo := FieldByName['ESTADO'].AsInteger;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                             if (EstadoEscandallo <> 0) then
                                CambiarEstado(0, FieldByName('ID_ESC').AsInteger);

                             // Sustituyo el anterior componente por defecto por el actual
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Text := 'UPDATE PRO_MAT_ESC SET MATESC = :MATESC WHERE ID_ESC = :ID_ESC AND MATESC = :MATESC_A_SUSTITUIR';
                                   Params.ByName['ID_ESC'].AsInteger := DS.FieldByName('ID_ESC').AsInteger;
                                   Params.ByName['MATESC'].AsInteger := QMProEscandalloESCANDALLO.AsInteger;
                                   Params.ByName['MATESC_A_SUSTITUIR'].AsInteger := EscandalloPorDefecto;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;

                             // Habilito el escandallo si estaba habilitado
                             if (EstadoEscandallo <> 0) then
                                CambiarEstado(EstadoEscandallo, FieldByName('ID_ESC').AsInteger);

                             Next;
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
        end
        else // Canvio l'estat del per defecte actual
           QMProEscandalloDEFECTO.AsInteger := 0;
     end
     else  // Si EscandalloPorDefecto=0 Canvio l'estat del per defecte inicial
        QMProEscandalloDEFECTO.AsInteger := 1;
  end;

  DEFECTO_ValorAntiguo := QMProEscandalloDEFECTO.AsInteger;
  QMProEscandalloENTRADA.Value := REntorno.Entrada;
end;

procedure TProDMEscandallo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  RefrescarImagen(ProFMEscandallo.EscImagen, QMProDibEscID_IMAGEN.AsInteger);
  CompruebaFases;
end;

procedure TProDMEscandallo.QMProFasesEscNewRecord(DataSet: TDataSet);
begin
  // Es mira com esta l'estat per evitar la inserció de fases amb esc. actiu
  if (NoAccesActivo(QMProFasesEsc) = 0) then
  begin
     QMProFasesEscEMPRESA.AsInteger := REntorno.Empresa;
     QMProFasesEscESCANDALLO.AsInteger := QMProEscandalloESCANDALLO.AsInteger;
     QMProFasesEscTIPO.AsString := QMProEscandalloTIPO.AsString;

     QMProFasesEscDIBUJO.AsString := ' ';
     QMProFasesEscID_IMAGEN.AsInteger := 0;
     QMProFasesEscACTUALIZA_REC.AsInteger := QMProEscandalloACTUALIZA_REC.AsInteger;
     QMProFasesEscACTUALIZA_MAT.AsInteger := QMProEscandalloACTUALIZA_MAT.AsInteger;
     QMProFasesEscREBAJE.AsInteger := 0;

     // nº de linea
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(LINEA_FASE) MAX_LINEA, MAX(ORDEN) MAX_ORDEN FROM PRO_FASES_ESC WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO';
           Params.ByName['EMPRESA'].AsString := QMProEscandalloEMPRESA.AsString;
           Params.ByName['ESCANDALLO'].AsString := QMProEscandalloESCANDALLO.AsString;
           Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
           ExecQuery;
           QMProFasesEscLINEA_FASE.AsInteger := FieldByName['MAX_LINEA'].AsInteger + 1;
           QMProFasesEscORDEN.AsInteger := FieldByName['MAX_ORDEN'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMEscandallo.QMProDibEscNewRecord(DataSet: TDataSet);
begin
  // Linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM PRO_DIB_ESC WHERE ID_ESC = ?ID_ESC';
        Params.ByName['ID_ESC'].AsInteger := QMProEscandalloID_ESC.AsInteger;
        ExecQuery;
        QMProDibEscLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProDibEscEmpresa.Value := REntorno.Empresa;
  QMProDibEscEscandallo.Value := QMProEscandalloEscandallo.Value;
  QMProDibEscTIPO.Value := QMProEscandalloTIPO.Value;
end;

procedure TProDMEscandallo.QMProMatEscNewRecord(DataSet: TDataSet);
begin
  // Es mira com esta l'estat per evitar la inserció de material amb esc. actiu
  if (NoAccesActivo(QMProMatEsc) = 0) then
  begin
     // Inicialización de valores
     QMProMatEscDES_CANTIDAD_TPIEZA.AsFloat := 0;
     QMProMatEscDES_ALTO.AsFloat := 0;
     QMProMatEscDES_ANCHO.AsFloat := 0;
     QMProMatEscDES_GRUESO.AsFloat := 0;

     QMProMatEscDES_TIPO_PIEZA.AsString := 'VAR';
     QMProMatEscDES_TIPO_MATERIAL.AsString := 'VAR';
     QMProMatEscPORCENT_SN.AsInteger := 0;

     if (QMProFasesEsc['Linea_Fase'] = null) then
     begin
        ShowMessage(_('Debe de especificarse la fase a la que se imputa el material.'));
        {dji lrk kri - Se actualiza por DataSource
          QMProMatEsc.Close;
          QMProMatEsc.Open;}
     end
     else
     begin
        QMProMatEscEMPRESA.AsInteger := REntorno.Empresa;
        QMProMatEscESCANDALLO.AsInteger := QMProEscandalloESCANDALLO.AsInteger;
        QMProMatEscLINEA_FASE.AsInteger := QMProFasesEscLINEA_FASE.AsInteger;
        QMProMatEscTIPO.AsString := QMProEscandalloTIPO.AsString;
        QMProMatEscALMACEN.AsString := QMProEscandalloALMACEN_LAN.AsString;
        QMProMatEscALMACEN_SAL.AsString := QMProEscandalloALMACEN_SAL.AsString;
        QMProMatEscUNIDADES.AsInteger := 1;
        QMProMatEscUNIDADES_DENSIDAD.AsFloat := 1;
        QMProMatEscACTUALIZA_MAT.AsInteger := QMProEscandalloACTUALIZA_MAT.AsInteger;
        QMProMatEscTIPO_PRECIO.AsInteger := QMProEscandalloTIPO_PRECIO.AsInteger;
        QMProMatEscID_ESC.AsInteger := QMProEscandalloID_ESC.AsInteger;

        // nº de linea de componente
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(LINEA_COMP) FROM PRO_MAT_ESC WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO';
              Params.ByName['EMPRESA'].AsString := QMProEscandalloEMPRESA.AsString;
              Params.ByName['ESCANDALLO'].AsString := QMProEscandalloESCANDALLO.AsString;
              Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
              ExecQuery;
              QMProMatEscLINEA_COMP.AsInteger := FieldByName['MAX'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // nº de orden
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(ORDEN) FROM PRO_MAT_ESC WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND LINEA_FASE = ?LINEA_FASE AND TIPO = ?TIPO';
              Params.ByName['EMPRESA'].AsString := QMProEscandalloEMPRESA.AsString;
              Params.ByName['ESCANDALLO'].AsString := QMProEscandalloESCANDALLO.AsString;
              Params.ByName['LINEA_FASE'].AsString := QMProFasesEscLINEA_FASE.AsString;
              Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
              ExecQuery;
              QMProMatEscORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  QMProMatEscLINEA_TAREA.AsInteger := 0;
  ValorDefecto(2);
end;

procedure TProDMEscandallo.QMProFasesEscAfterScroll(DataSet: TDataSet);
begin
  CompruebaFases;
end;

procedure TProDMEscandallo.QMProTareaEscNewRecord(DataSet: TDataSet);
begin
  // Es mira com esta l'estat per evitar la inserció de material amb esc. actiu
  if (NoAccesActivo(QMProTareaEsc) = 0) then
  begin
     if (QMProFasesEsc['Linea_Fase'] = null) then
     begin
        ShowMessage(_('Debe de especificarse la fase a la que se imputa la tarea.'));
        {dji lrk kri - Se actualiza por DataSource
          QMProTareaEsc.Close;
          QMProTareaEsc.Open;}
     end
     else
     begin
        QMProTareaEscEMPRESA.AsInteger := REntorno.Empresa;
        QMProTareaEscESCANDALLO.AsInteger := QMProEscandalloESCANDALLO.AsInteger;
        QMProTareaEscLINEA_FASE.AsInteger := QMProFasesEscLINEA_FASE.AsInteger;
        QMProTareaEscTIPO.AsString := QMProEscandalloTIPO.AsString;
        QMProTareaEscUNIDADES.AsFloat := 0;
        QMProTareaEscSECCION.AsString := 'DES';

        // Li posem un NULL a id_utillajes
        QMProTareaEscID_UTILLAJES.AsString := '';
        QMProTareaEscACTUALIZA_REC.AsInteger := QMProEscandalloACTUALIZA_REC.AsInteger;

        QMProTareaEscOPERACIONES_NUM.AsInteger := 1;
        QMProTareaEscOPERACIONES_TIEMPO.AsInteger := 3600;
        QMProTareaEscSECCION.AsString := 'DES';

        // Nro. Linea y orden
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(LINEA_TAREA) MAX_LINEA_TAREA, MAX(ORDEN) MAX_ORDEN FROM PRO_TAREA_ESC WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND LINEA_FASE = ?LINEA_FASE AND TIPO = ?TIPO';
              Params.ByName['EMPRESA'].AsString := QMProEscandalloEMPRESA.AsString;
              Params.ByName['ESCANDALLO'].AsString := QMProEscandalloESCANDALLO.AsString;
              Params.ByName['LINEA_FASE'].AsString := QMProFasesEscLINEA_FASE.AsString;
              Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
              ExecQuery;
              QMProTareaEscLINEA_TAREA.AsInteger := FieldByName['MAX_LINEA_TAREA'].AsInteger + 1;
              QMProTareaEscORDEN.AsInteger := FieldByName['MAX_ORDEN'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Orden general (dentro de la of, sin tener en cuenta la fase)
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(ORDEN_OF) FROM PRO_TAREA_ESC WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO';
              Params.ByName['EMPRESA'].AsString := QMProEscandalloEMPRESA.AsString;
              Params.ByName['ESCANDALLO'].AsString := QMProEscandalloESCANDALLO.AsString;
              Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
              ExecQuery;
              QMProTareaEscORDEN_OF.AsInteger := FieldByName['MAX'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;

        QMProTareaEscID_UTILLAJES.AsString := '000';
        QMProTareaEscDESC_UTILLAJE.AsString := DameTituloUtillaje(QMProTareaEscID_UTILLAJES.AsString);
     end;
  end;
end;

procedure TProDMEscandallo.QMProMatEscCOMPONENTEChange(Sender: TField);
begin
  // Escogo el subescandallo por defecto y activo asociado al componente
  // Si no encuentra ninguno, se pone a 0
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) ESCANDALLO FROM PRO_ESCANDALLO WHERE EMPRESA = ?EMPRESA AND COMPUESTO = ?COMPONENTE AND ESTADO <> 2 ORDER BY DEFECTO DESC, ESCANDALLO';
        Params.ByName['EMPRESA'].AsInteger := QMProMatEscEMPRESA.AsInteger;
        Params.ByName['COMPONENTE'].AsString := QMProMatEscCOMPONENTE.AsString;
        ExecQuery;
        if (FieldByName['ESCANDALLO'].AsInteger <> 0) then
           QMProMatEscMATESC.Value := FieldByName['ESCANDALLO'].AsInteger
        else
           QMProMatEscMATESC.Value := 0;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no encuentra ninguno, no pone ningun valor
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) ID_EQUIVAL FROM PRO_SYS_CAB_EQUIVAL WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?COMPONENTE ORDER BY DEFECTO DESC, ID_EQUIVAL';
        Params.ByName['EMPRESA'].AsInteger := QMProMatEscEMPRESA.AsInteger;
        Params.ByName['COMPONENTE'].AsString := QMProMatEscCOMPONENTE.AsString;
        ExecQuery;
        if (FieldByName['ID_EQUIVAL'].AsInteger <> 0) then
           QMProMatEscID_EQUIVAL.AsInteger := FieldByName['ID_EQUIVAL'].AsInteger
        else
           QMProMatEscID_EQUIVAL.Clear;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if QMProMatEsc.State in [dsEdit, dsInsert] then
  begin
     xTituloArtMat.Open;
     QMProMatEscPRE_COS_UNI.AsFloat := xTituloArtMatP_Coste.AsFloat;
     QMProMatEscUNIDAD_ART.AsString := xTituloArtMatUNIDADES.AsString;
     QMProMatEscUNIDAD_FAB.AsString := xTituloArtMatUNIDADES.AsString;
     xTituloArtMat.Close;
  end;

  // Valor por defecto del articulo
  // Siempre calculo la densedad
  // if (DMMain.DameConstanteProduccion('QUIM_DENSIDAD') = 1) then
  // begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT (PESO / VOLUMEN_UNIT) AS DENSIDAD FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :COMPONENTE AND VOLUMEN_UNIT <> 0';
        Params.ByName['EMPRESA'].AsInteger := QMProMatEscEMPRESA.AsInteger;
        Params.ByName['COMPONENTE'].AsString := QMProMatEscCOMPONENTE.AsString;
        ExecQuery;
        QMProMatEscDENSIDAD.AsFloat := FieldByName['DENSIDAD'].AsFloat;
        if (QMProMatEscDENSIDAD.AsFloat = 0) then
           QMProMatEscDENSIDAD.AsFloat := 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
  // end
  // else
  //   QMProMatEscDENSIDAD.AsFloat := 1;
end;

procedure TProDMEscandallo.QMProFasesEscTIPOFASEChange(Sender: TField);
begin
  if QMProFasesEsc.State in [dsEdit, dsInsert] then
     QMProFasesEscFase.Value := DameTituloFase(QMProFasesEscTIPOFASE.AsString);
end;

procedure TProDMEscandallo.QMProTareaEscRECURSOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PRECIO_RECURSO (?EMPRESA, ?RECURSO, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
        Params.ByName['RECURSO'].AsString := QMProTareaEscRECURSO.AsString;
        Params.ByName['FECHA'].AsDateTime := QMProEscandalloFECHA_CREAC.AsDateTime;
        ExecQuery;
        QMProTareaEscPRE_COS_UNI.AsFloat := FieldByName['PRECIO_EST'].AsFloat;
        QMProTareaEscOPERACIONES_NUM.AsInteger := FieldByName['OPERACIONES_NUM'].AsInteger;
        QMProTareaEscOPERACIONES_TIEMPO.AsInteger := FieldByName['OPERACIONES_TIEMPO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMEscandallo.QMProEscandalloAfterPost(DataSet: TDataSet);
begin
  if QMProEscandallo.State = dsBrowse then
     ProFMEscandallo.ArbolEsc;
end;

procedure TProDMEscandallo.QMProTareaEscCANTIDADChange(Sender: TField);
begin
  if (not ModTiempo) then
     CalculaTiempo;

  QMProTareaEscTOTAL_VAR.Value := CalculaTotalVar_Tarea;
  QMProTareaEscTOTAL.Value := CalculaTotal_Tarea;
end;

procedure TProDMEscandallo.QMProTareaEscPRE_COS_UNIChange(Sender: TField);
begin
  QMProTareaEscTOTAL_VAR.Value := CalculaTotalVar_Tarea;
  QMProTareaEscTOTAL.Value := CalculaTotal_Tarea;
end;

procedure TProDMEscandallo.QMProTareaEscPRECIO_FIJOChange(Sender: TField);
begin
  QMProTareaEscTOTAL.Value := CalculaTotal_Tarea;
end;

procedure TProDMEscandallo.QMProMatEscUNIDADESChange(Sender: TField);
begin
  QMProMatEscTOTAL_VAR.Value := QMProMatEscUNIDADES.Value * QMProMatEscPRE_COS_UNI.Value;
  QMProMatEscTOTAL.Value := QMProMatEscTOTAL_VAR.Value + QMProMatEscPRECIO_FIJO.Value;
end;

procedure TProDMEscandallo.QMProMatEscPRE_COS_UNIChange(Sender: TField);
begin
  QMProMatEscTOTAL_VAR.Value := QMProMatEscUNIDADES.Value * QMProMatEscPRE_COS_UNI.Value;
  QMProMatEscTOTAL.Value := QMProMatEscTOTAL_VAR.Value + QMProMatEscPRECIO_FIJO.Value;
end;

procedure TProDMEscandallo.QMProMatEscPRECIO_FIJOChange(Sender: TField);
begin
  QMProMatEscTOTAL.Value := QMProMatEscTOTAL_VAR.Value + QMProMatEscPRECIO_FIJO.Value;
end;

procedure TProDMEscandallo.QMProEscandalloCOSTE_FIJOChange(Sender: TField);
begin
  QMProEscandalloCoste_Total.Value := QMProEscandalloCoste_Mater.Value +
     QMProEscandalloCoste_MObra.Value + QMProEscandalloCoste_Maqui.Value +
     QMProEscandalloCoste_Texte.Value + QMProEscandalloCoste_Fijo.Value;

  CalculaCosteUnitarioOptimo;
  CalculaCosteTotalOptimo;
  CalculaPrecioVenta;
end;

procedure TProDMEscandallo.QMProMatEscBeforePost(DataSet: TDataSet);
begin
  if (QMProMatEscMATESC.AsInteger > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_CONTROLAR_RECURSIVIDAD (?EMPRESA, ?ESCANDALLO, ?SUBESCANDALLO, ?TIPO)';
           Params.ByName['EMPRESA'].AsInteger := QMProMatEscEMPRESA.AsInteger;
           Params.ByName['ESCANDALLO'].AsString := QMProMatEscMATESC.AsString;
           Params.ByName['SUBESCANDALLO'].AsString := QMProEscandalloESCANDALLO.AsString;
           Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  QMProMatEscENTRADA.Value := REntorno.Entrada;
end;

procedure TProDMEscandallo.QMProFasesEscBeforePost(DataSet: TDataSet);
begin
  QMProFasesEscENTRADA.Value := REntorno.Entrada;
end;

procedure TProDMEscandallo.QMProTareaEscBeforePost(DataSet: TDataSet);
begin
  QMProTareaEscENTRADA.Value := REntorno.Entrada;

  if (QMProTareaEsc.State = dsInsert) then
  begin
     if (DMMain.EstadoKri(493) = 1) then
     begin
        // KRICONF-493 - Temas especificos de JVV
        // Para JVV, si se trata de la fase SMD, la tarea ISM y la cantidad es = 1
        if ((QMProFasesEscTIPOFASE.AsString = 'SMD') and (QMProTareaEscTIPOTAREA.AsString = 'ISM')) then
           QMProTareaEscCANTIDAD.AsFloat := 1
        else
           QMProTareaEscCANTIDAD.AsFloat := 0;
     end;
  end;
end;

procedure TProDMEscandallo.PreparaNotasDetalle(tabla: TFIBTableSet);
begin
  if (tabla.State in [dsEdit, dsInsert]) then
     tabla.Post;
  tabla.Edit;
end;

procedure TProDMEscandallo.CompruebaFirma(Tipo, IdFirma: integer);
begin
  if (EstadoFirma(IdFirma) > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE PRO_VER_ESCANDALLO ');
           if tipo = 0 then
              SQL.Add(' SET ISO_APROBADO = ?ID_FIRMA ')
           else
           if tipo = 1 then
              SQL.Add(' SET ISO_VERIFICADO = ?ID_FIRMA ')
           else
           if tipo = 2 then
              SQL.Add(' SET ISO_VALIDADO = ?ID_FIRMA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO ');
           Params.ByName['ID_FIRMA'].AsInteger := IdFirma;
           Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
           Params.ByName['ESCANDALLO'].AsInteger := QMProEscandalloESCANDALLO.AsInteger;
           Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMProEscandallo.Refresh;
  end;
end;

procedure TProDMEscandallo.QMProDibEscAfterScroll(DataSet: TDataSet);
begin
  RefrescarImagen(ProFMEscandallo.EscImagen, QMProDibEscID_IMAGEN.AsInteger);
end;

function TProDMEscandallo.EstadoFirma(IdFirma: integer): smallint;
begin
  // Si no hi ha firma:            Result = 0
  // Si hi ha firma pero no OK:    Result = 1
  // Si hi ha firma i esta OK:     Result = 2

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
end;

function TProDMEscandallo.HayMateriales: boolean;
begin
  Result := (QMProMatEsc.FieldByName('LINEA_COMP').AsInteger <> 0);
end;

procedure TProDMEscandallo.QMProFasesEscAfterOpen(DataSet: TDataSet);
begin
  QMProMatEsc.Open;
  QMProTareaEsc.Open;

  CompruebaFases;
end;

procedure TProDMEscandallo.QMProTareaEscID_UTILLAJESChange(Sender: TField);
begin
  QMProTareaEscDESC_UTILLAJE.AsString := DameTituloUtillaje(QMProTareaEscID_UTILLAJES.AsString);
end;

procedure TProDMEscandallo.QMProTareaEscAfterScroll(DataSet: TDataSet);
begin
  CalculaTiempo;
end;

procedure TProDMEscandallo.QMProTareaEscTIEMPOChange(Sender: TField);
begin
  ModTiempo := True;
  CalculaTiempo;
  ModTiempo := False;
end;

procedure TProDMEscandallo.QMProTareaEscCalcFields(DataSet: TDataSet);
begin
  if (not ModTiempo) and (not (QMProTareaEsc.State in [dsInsert, dsEdit])) then
     CalculaTiempo;

  QMProTareaEscDescrTarea.AsString := DameTituloTarea(QMProTareaEscTIPOTAREA.AsString);
  QMProTareaEscDescrRecurso.AsString := DameTituloRecurso(QMProTareaEscRECURSO.AsString);
end;

procedure TProDMEscandallo.QMProEscandalloUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(CalculaMascara(DMMain.DameDecimalesUnidad(QMProEscandalloUNIDAD.AsString), False), QMProEscandalloUNIDADES.AsFloat);
end;

procedure TProDMEscandallo.CalculaTiempo;
begin
  if ((QMProTareaEsc.State in [dsEdit, dsInsert]) and (QMProTareaEscTIPOTAREA.AsString > '')) then
  begin
     if (ModTiempo) then
     begin
        // Si modificamos el TIEMPO, calculamos la CANTIDAD (en numero de operaciones)
        // La cantidad sera equivalente al numero de horas,
        // si el rendimiento de la maquina es de 1 operacion por hora: OP_NUM=1, OP_TIEMPO=3600
        if (QMProTareaEscOPERACIONES_TIEMPO.AsInteger <> 0) then
           QMProTareaEscCANTIDAD.AsFloat :=
              (QMProTareaEscTIEMPO.AsFloat * QMProTareaEscOPERACIONES_NUM.AsInteger) /
              (QMProTareaEscOPERACIONES_TIEMPO.AsInteger)
        else // Si OP_TIEMPO=0, dejaremos la CANTIDAD en horas.
           QMProTareaEscCANTIDAD.AsFloat := QMProTareaEscTIEMPO.AsFloat / 3600;
     end
     else
     begin
        // Si modificamos la CANTIDAD, o el rendimiento de la maquina, se recalculara el TIEMPO
        ModTiempo := True;
        if (QMProTareaEscOPERACIONES_NUM.AsInteger <> 0) then
           QMProTareaEscTIEMPO.AsFloat :=
              (QMProTareaEscCANTIDAD.AsFloat * QMProTareaEscOPERACIONES_TIEMPO.AsInteger) /
              (QMProTareaEscOPERACIONES_NUM.AsInteger)
        else
           QMProTareaEscTIEMPO.AsFloat := QMProTareaEscCANTIDAD.AsFloat * 3600;
        ModTiempo := False;
     end;
  end;
end;

function TProDMEscandallo.CalculaTotalVar_Tarea: double;
begin
  // Calculamos el total de la tarea en funcion del Rendimiento de la operacion
  if (QMProTareaEscOPERACIONES_NUM.AsInteger <> 0) then
     Result := (QMProTareaEscCANTIDAD.Value * QMProTareaEscPRE_COS_UNI.Value *
        (QMProTareaEscOPERACIONES_TIEMPO.AsInteger / QMProTareaEscOPERACIONES_NUM.AsInteger)) /
        3600
  else
     Result := 0;
end;

function TProDMEscandallo.CalculaTotal_Tarea: double;
begin
  Result := QMProTareaEscTOTAL_VAR.Value + QMProTareaEscPRECIO_FIJO.Value;
end;

procedure TProDMEscandallo.QMProMatEscUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, False), QMProMatEscUNIDADES.AsFloat);
end;

procedure TProDMEscandallo.QMProTareaEscCOSTE_OPERACIONESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProTareaEscOPERACIONES_NUM.AsInteger <> 0) then
     Text := FormatFloat(',##0.00000',
        (QMProTareaEscPRE_COS_UNI.AsFloat * QMProTareaEscOPERACIONES_TIEMPO.AsInteger) /
        (3600 * QMProTareaEscOPERACIONES_NUM.AsInteger))
  else
     Text := FormatFloat(',##0.00000', 0);
end;

procedure TProDMEscandallo.QMProTareaEscOPERACIONES_NUMChange(Sender: TField);
begin
  CalculaTiempo;
end;

procedure TProDMEscandallo.QMProTareaEscOPERACIONES_TIEMPOChange(Sender: TField);
begin
  CalculaTiempo;
end;

procedure TProDMEscandallo.QMProMatEscDES_TIPO_PIEZAChange(Sender: TField);
begin
  xDesTPieza.Open;
  QMProMatEscDESC_TIPO_PIEZA.AsString := xDesTPiezaDESCRIPCION.AsString;
  xDesTPieza.Close;
end;

procedure TProDMEscandallo.QMProMatEscDES_TIPO_MATERIALChange(Sender: TField);
begin
  xDesTMaterial.Open;
  QMProMatEscDESC_TIPO_MATERIAL.AsString := xDesTMaterialDESCRIPCION.AsString;
  xDesTMaterial.Close;
end;

procedure TProDMEscandallo.QMProDibEscNOMBREGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProDibEscID_IMAGEN.AsString <> '') then
     Text := DameTituloImagen(QMProDibEscID_IMAGEN.AsInteger);
end;

procedure TProDMEscandallo.QMProMatEscunidades_por_compuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProEscandalloUNIDADES.AsFloat <> 0) then
  begin
     if (QMProMatEscUNIDAD_FAB.AsString = 'Mi') or
        (QMProMatEscUNIDAD_FAB.AsString = 'Tn') then
        Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, True), QMProMatEscUNIDADES.AsFloat / QMProEscandalloUNIDADES.AsFloat)
     else
        Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, False), QMProMatEscUNIDADES.AsFloat / QMProEscandalloUNIDADES.AsFloat);
  end
  else
     Text := FormatFloat(MascaraN, 0);
end;

procedure TProDMEscandallo.QMProTareaEsccantidad_por_compuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProMatEscUNIDAD_FAB.AsString = 'Mi') or
     (QMProMatEscUNIDAD_FAB.AsString = 'Tn') then
     Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, True), QMProMatEscUNIDADES.AsFloat)
  else
     Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, False), QMProMatEscUNIDADES.AsFloat);

  if (QMProEscandalloUNIDADES.AsFloat <> 0) then
     Text := FormatFloat(MascaraN, QMProTareaEscCANTIDAD.AsFloat / QMProEscandalloUNIDADES.AsFloat)
  else
     Text := FormatFloat(MascaraN, 0);
end;

procedure TProDMEscandallo.QMProTareaEsctiempo_por_compuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProEscandalloUNIDADES.AsFloat <> 0) then
     Text := FormatFloat(MascaraN, QMProTareaEscTIEMPO.AsFloat / QMProEscandalloUNIDADES.AsFloat)
  else
     Text := FormatFloat(MascaraN, 0);
end;

procedure TProDMEscandallo.CalculaCosteUnitarioOptimo;
var
  PrecioMaq, PrecioMater, PrecioOpe, PrecioVar, PrecioTrab : double;
begin
  //Cálculo del precio óptimo, a partir de los márgenes
  if (QMProEscandalloUNIDADES.AsFloat <> 0) then
  begin
     PrecioMaq := QMProEscandalloCOSTE_MAQUI.AsFloat + QMProEscandalloCOSTE_MAQUI.AsFloat * QMProEscandalloMARGEN_MAQUI.AsFloat / 100;
     PrecioMater := QMProEscandalloCOSTE_MATER.AsFloat + QMProEscandalloCOSTE_MATER.AsFloat * QMProEscandalloMARGEN_MATER.AsFloat / 100;
     PrecioOpe := QMProEscandalloCOSTE_MOBRA.AsFloat + QMProEscandalloCOSTE_MOBRA.AsFloat * QMProEscandalloMARGEN_OPE.AsFloat / 100;
     PrecioVar := QMProEscandalloCOSTE_VAR.AsFloat + QMProEscandalloCOSTE_VAR.AsFloat * QMProEscandalloMARGEN_VAR.AsFloat / 100;
     PrecioTrab := QMProEscandalloCOSTE_TEXTE.AsFloat + QMProEscandalloCOSTE_TEXTE.AsFloat * QMProEscandalloMARGEN_TRAB.AsFloat / 100;

     PrecioOptimoUnitario := ((QMProEscandalloCOSTE_FIJO.AsFloat + PrecioMaq + PrecioMater + PrecioOpe + PrecioVar + PrecioTrab) / QMProEscandallounidades.AsFloat);
     QMProEscandalloPOptUni.AsString := FormatFloat(MascaraL, PrecioOptimoUnitario);
  end;
end;

procedure TProDMEscandallo.CalculaCosteTotalOptimo;
var
  PrecioMaq, PrecioMater, PrecioOpe, PrecioVar, PrecioTrab : double;
begin
  if (QMProEscandalloUNIDADES.AsFloat <> 0) then
  begin
     PrecioMaq := QMProEscandalloCOSTE_MAQUI.AsFloat + QMProEscandalloCOSTE_MAQUI.AsFloat * QMProEscandalloMARGEN_MAQUI.AsFloat / 100;
     PrecioMater := QMProEscandalloCOSTE_MATER.AsFloat + QMProEscandalloCOSTE_MATER.AsFloat * QMProEscandalloMARGEN_MATER.AsFloat / 100;
     PrecioOpe := QMProEscandalloCOSTE_MOBRA.AsFloat + QMProEscandalloCOSTE_MOBRA.AsFloat * QMProEscandalloMARGEN_OPE.AsFloat / 100;
     PrecioVar := QMProEscandalloCOSTE_VAR.AsFloat + QMProEscandalloCOSTE_VAR.AsFloat * QMProEscandalloMARGEN_VAR.AsFloat / 100;
     PrecioTrab := QMProEscandalloCOSTE_TEXTE.AsFloat + QMProEscandalloCOSTE_TEXTE.AsFloat * QMProEscandalloMARGEN_TRAB.AsFloat / 100;

     PrecioOptimoTotal := QMProEscandalloCOSTE_FIJO.AsFloat + PrecioMaq + PrecioMater + PrecioOpe + PrecioVar + PrecioTrab;
     QMProEscandalloPOptTotal.AsString := FormatFloat(MascaraL, PrecioOptimoTotal);
  end;
end;

procedure TProDMEscandallo.RecalculaPrecios(Sender: TField);
begin
  CalculaCosteUnitarioOptimo;
  CalculaCosteTotalOptimo;
  CalculaPrecioVenta;
end;

procedure TProDMEscandallo.CalculaPrecioVenta;
begin
  // Descripción y tarifa del cliente

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT EC.TARIFA, ST.NOMBRE_R_SOCIAL, ATP.LINEA, ATP.PRECIO_VENTA ');
        SQL.Add(' FROM EMP_CLIENTES EC ');
        SQL.Add(' JOIN SYS_TERCEROS ST ON EC.TERCERO = ST.TERCERO ');
        SQL.Add(' JOIN ART_TARIFAS_D ATD ON ATD.EMPRESA = EC.EMPRESA AND ATD.TARIFA = EC.TARIFA ');
        SQL.Add(' JOIN ART_TARIFAS_PRECIOS ATP ON EC.EMPRESA = ATP.EMPRESA AND EC.TARIFA = ATP.TARIFA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE AND ');
        SQL.Add(' UNID_MINIMAS <= :UNIDADES AND ');
        SQL.Add(' UNID_MAXIMAS >= :UNIDADES AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' ((ATP.LINEA = ATD.LINEA) OR (ATD.LINEA IS NULL)) ');
        SQL.Add(' ORDER BY ATP.LINEA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := QMProEscandalloCLIENTE.AsInteger;
        Params.ByName['UNIDADES'].AsInteger := QMProEscandalloUNIDADES.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMProEscandalloCOMPUESTO.AsString;
        ExecQuery;
        ProFMEscandallo.EdDescCliente.Text := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        ProFMEscandallo.EdTarifa.Text := FieldByName['TARIFA'].AsString;
        ProFMEscandallo.EdLineaTarifa.Text := FieldByName['LINEA'].AsString;
        PrecioVentaUnitario := FieldByName['PRECIO_VENTA'].AsFloat;
     finally
        Free;
     end;
  end;

  PrecioVentaTotal := PrecioVentaUnitario * QMProEscandalloUnidades.AsInteger;

  QMProEscandalloPrecio_uni.AsString := FormatFloat(MascaraL, PrecioVentaUnitario);
  QMProEscandalloPrecio_total.AsString := FormatFloat(MascaraL, PrecioVentaTotal);

  CalculaBeneficios;
end;

procedure TProDMEscandallo.CalculaBeneficios;
var
  BenUni, BenUniPor, BenOptUni, BenOptUniPor, BenTot, BenTotOpt : double;
  CosteUnitario, CosteTotal : double;
begin
  CosteUnitario := 0;
  if (QMProEscandalloUnidades.AsInteger <> 0) then
     CosteUnitario := QMProEscandalloCoste_Total.AsFloat / QMProEscandalloUnidades.AsInteger;

  CosteTotal := QMProEscandalloCoste_Total.AsFloat;

  if (PrecioVentaUnitario = 0) then
  begin
     BenUni := 0;
     BenUniPor := 0;
  end
  else
  begin
     BenUni := (PrecioVentaUnitario - CosteUnitario);
     BenUniPor := ((PrecioVentaUnitario - CosteUnitario) * 100) / PrecioVentaUnitario;
  end;

  if (PrecioOptimoUnitario = 0) then
  begin
     BenOptUni := 0;
     BenOptUniPor := 0;
  end
  else
  begin
     BenOptUni := (PrecioOptimoUnitario - CosteUnitario);
     BenOptUniPor := ((PrecioOptimoUnitario - CosteUnitario) * 100) / PrecioOptimoUnitario;
  end;

  if ((PrecioVentaUnitario = 0) or (PrecioOptimoUnitario = 0)) then
  begin
     BenTot := 0;
     BenTotOpt := 0;
  end
  else
  begin
     BenTot := (PrecioVentaTotal - CosteTotal);
     BenTotOpt := (PrecioOptimoTotal - CosteTotal);
  end;

  QMProEscandalloBen_uni.AsString := FormatFloat(MascaraL, BenUni);
  QMProEscandalloBen_uni_Por.AsString := FormatFloat(MascaraP, BenUniPor);

  QMProEscandalloBen_opt_uni.AsString := FormatFloat(MascaraL, BenOptUni);
  QMProEscandalloBen_opt_uni_Por.AsString := FormatFloat(MascaraP, BenOptUniPor);

  QMProEscandalloBen_tot.AsString := FormatFloat(MascaraL, BenTot);
  QMProEscandalloBen_tot_opt.AsString := FormatFloat(MascaraL, BenTotOpt);
end;

procedure TProDMEscandallo.QMProEscandalloCLIENTEChange(Sender: TField);
begin
  CalculaPrecioVenta;
end;

procedure TProDMEscandallo.QMProEscandalloCalcFields(DataSet: TDataSet);
begin
  // sfg.Albert - Es crea un nou tipus de veure l'estat
  case QMProEscandalloESTADO.AsInteger of
     0: QMProEscandalloDESCESTADO.AsString := _('No Activo');
     1: QMProEscandalloDESCESTADO.AsString := _('Activo');
     2: QMProEscandalloDESCESTADO.AsString := _('Obsoleto');
  end;

  QMProEscandalloDESCUNIDAD.AsString := DameTituloTipoUnidad(QMProEscandalloUNIDAD.AsString);
  if (QMProEscandalloUNIDADES.AsFloat <> 0) then
     QMProEscandalloCOSTE_UNITARIO.AsFloat := QMProEscandalloCOSTE_TOTAL.AsFloat / QMProEscandalloUNIDADES.AsFloat
  else
     QMProEscandalloCOSTE_UNITARIO.AsFloat := 0;
end;

procedure TProDMEscandallo.CambiarEstado(Estado: integer; IDEsc: integer = 0);
var
  Refrescar : boolean;
begin
  // Si IDEsc viene a 0, utilizo el id del escandallo actual y refresco el dataset
  Refrescar := False;
  if (IDEsc = 0) then
  begin
     IDEsc := QMProEscandalloID_ESC.AsInteger;
     Refrescar := True;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE PRO_VER_ESCANDALLO SET ESTADO = :ESTADO WHERE ID_ESC = :ID_ESC AND ESTADO <> :ESTADO';
        Params.ByName['ESTADO'].AsInteger := Estado;
        Params.ByName['ID_ESC'].AsInteger := IDEsc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Refrescar) then
     QMProEscandallo.Refresh;
end;

function TProDMEscandallo.NoAccesActivo(modul: TFIBTableSet): integer;
begin
  Result := 0;
  if ((QMProEscandalloESTADO.AsInteger = 1) or (QMProEscandalloESTADO.AsInteger = 2)) then
  begin
     ShowMessage(_('No se puede modificar un escandallo activo u obsoleto'));
     modul.Cancel;
     Result := 1;
  end;
end;

procedure TProDMEscandallo.QMProMatEscUNIDADES_DENSIDADChange(Sender: TField);
begin
  QMProMatEscUNIDADES.AsFloat := QMProMatEscUNIDADES_DENSIDAD.AsFloat * QMProMatEscDENSIDAD.AsFloat;
end;

procedure TProDMEscandallo.ValorDefecto(tipus: integer);
begin
  if (tipus = 1) then
  begin
     // Checks per defecte
     QMProEscandalloGENERA_OF.AsInteger := DMMain.DameConstanteProduccion('ESC_GENERA_OF');
     QMProEscandalloAUTO_ENTRADA.AsInteger := DMMain.DameConstanteProduccion('ESC_MODIFICAR_COSTE');
     QMProEscandalloACTUALIZA_MAT.AsInteger := DMMain.DameConstanteProduccion('ESC_MATERIALES');
     QMProEscandalloAUTO_CALC.AsInteger := DMMain.DameConstanteProduccion('ESC_AUTO_CALCULAR');
     QMProEscandalloACTUALIZA_REC.AsInteger := DMMain.DameConstanteProduccion('ESC_RECURSOS');
     QMProEscandalloESTADO.AsInteger := DMMain.DameConstanteProduccion('ESC_ACTIVO');
  end;

  if (tipus = 2) then
  begin
     // Checks per defecte als materials
     QMProMatEscPORCENT_SN.AsInteger := DMMain.DameConstanteProduccion('ESC_PORCENT');
  end;
end;

procedure TProDMEscandallo.QMProMatEscAfterEdit(DataSet: TDataSet);
begin
  // sfg.albert - Es posa el control perque no puguin fer cap update si està actiu
  NoAccesActivo(QMProMatEsc);
end;

procedure TProDMEscandallo.QMProTareaEscAfterEdit(DataSet: TDataSet);
begin
  // sfg.albert - Es posa el control perque no puguin fer cap update si està actiu
  NoAccesActivo(QMProTareaEsc);
end;

procedure TProDMEscandallo.QMProFasesEscAfterEdit(DataSet: TDataSet);
begin
  // sfg.albert - Es posa el control perque no puguin fer cap update si està actiu
  NoAccesActivo(QMProFasesEsc);
end;

procedure TProDMEscandallo.QMProDibEscAfterEdit(DataSet: TDataSet);
begin
  // sfg.albert - Es posa el control perque no puguin fer cap update si està actiu
  NoAccesActivo(QMProDibEsc);
end;

procedure TProDMEscandallo.CalculaFormulas(Tipo: string; Escandallo: integer);
var
  DS : TFIBDataSet;
begin
  // pro_mat_esc
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
           SelectSQL.Add(' SELECT ID_MATERIAL FROM PRO_MAT_ESC ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = :TIPO AND FORMULA <> 0');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
           Params.ByName['TIPO'].AsString := Tipo;

           Open;

           if (not EOF) then
           begin
              QMProMatEsc.Close;
              while not (EOF) do
              begin
                 CalculaFormulas2('pro_mat_esc', FieldByName('ID_MATERIAL').AsInteger, Tipo, Escandallo);
                 Next;
              end;
              QMProMatEsc.Open;
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

  // pro_tarea_esc
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
           SelectSQL.Add(' SELECT ID_TAREA FROM PRO_TAREA_ESC ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = :TIPO AND FORMULA <> 0');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
           Params.ByName['TIPO'].AsString := Tipo;

           Open;

           if (not EOF) then
           begin
              QMProTareaEsc.Close;
              while not (EOF) do
              begin
                 CalculaFormulas2('pro_tarea_esc', FieldByName('ID_TAREA').AsInteger, Tipo, Escandallo);
                 Next;
              end;
              QMProTareaEsc.Open;
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

procedure TProDMEscandallo.CalculaFormulas2(procedencia: string; id_mat_tar: integer; Tipo: string; Escandallo: integer);
var
  var_nombre, var_campo, var_tabla, cab_formula, cab_campo, cab_campo_tmp, cab_tabla : string;
  id_esc, ID_formula, num_var, num_campos, {I,} J, Z : integer;
  id_formula_campos_cab, ID_formula_campos_det, activo, cab_redondeo : integer;
  valor, resultado : double;
begin
  // numero de detalle del escandallo afectados por fórmulas (necesario para el recorrido)
  // with Q do
  // begin
  //    Close;
  //    Database := DMMain.DataBase;
  //    recorrer detalle del escandallo calculando cada fórmula
  //    linea_comp_actual := 0;
  //    if (num_escandallos <> 0) then
  //       for I := 0 to num_escandallos - 1 do  // begin - for num_escandallos
  //       begin

  // seleccionar la fórmula de la linea del detalle tratada
  // sea de pro_mat_esc o pro_tarea_esc

  ID_formula := 0;
  id_esc := 0;
  // PRO_MAT_ESC
  if (procedencia = 'pro_mat_esc') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           Database := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' SELECT FORMULA, LINEA_COMP, ID_ESC FROM PRO_MAT_ESC ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' ESCANDALLO = ?ESCANDALLO AND ');
           SQL.Add(' TIPO = ?TIPO AND ');
           SQL.Add(' ID_MATERIAL = ?ID_MATERIAL ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID_MATERIAL'].AsInteger := id_mat_tar;
           // Params.ByName['LINEA_COMP'].AsInteger := linea_comp_actual;
           ExecQuery;
           ID_formula := FieldByName['FORMULA'].AsInteger;
           // linea_comp_actual := FieldByName['LINEA_COMP'].AsInteger;
           id_esc := FieldByName['ID_ESC'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // PRO_TAREA_ESC
  if (procedencia = 'pro_tarea_esc') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           Database := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' SELECT FORMULA, LINEA_TAREA FROM PRO_TAREA_ESC ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' ESCANDALLO = ?ESCANDALLO AND ');
           SQL.Add(' TIPO = ?TIPO AND ');
           SQL.Add(' ID_TAREA = ?ID_TAREA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID_TAREA'].AsInteger := id_mat_tar;
           ExecQuery;
           ID_formula := FieldByName['FORMULA'].AsInteger;
           // linea_comp_actual := FieldByName['LINEA_TAREA'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Buscar número de campos que están implicados en la fórmula
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT COUNT(ID_FORMULA_CAMPOS_CAB) ');
        SQL.Add(' FROM PRO_FORMULAS_CAMPOS_CAB ');
        SQL.Add(' WHERE ');
        SQL.Add(' TABLA_ESC <> '''' AND ');
        SQL.Add(' ID_FORMULA = ?ID_FORMULA ');
        Params.ByName['ID_FORMULA'].AsInteger := ID_formula;
        ExecQuery;
        num_campos := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Recorrer cada campo actualizándolo con su subfórmula
  id_formula_campos_cab := 0;
  if (num_campos <> 0) then
     for Z := 0 to num_campos - 1 do  // begin - for num_campos
     begin
        // Comprobación si la formula esta activa
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              SQL.Text := 'SELECT ACTIVO FROM PRO_FORMULAS WHERE ID_FORMULA = ?ID_FORMULA';
              Params.ByName['ID_FORMULA'].AsInteger := ID_formula;
              ExecQuery;
              activo := FieldByName['ACTIVO'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (activo = 1) then
        begin
           // Recorrido para campo
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Clear;
                 SQL.Add(' SELECT CAB.ID_FORMULA_CAMPOS_CAB, CAB.FORMULA, CAB.CAMPO_ESC, CAB.TABLA_ESC, CAB.TIPO_REDONDEO ');
                 SQL.Add(' FROM PRO_FORMULAS_CAMPOS_CAB CAB ');
                 SQL.Add(' JOIN PRO_FORMULAS FOM ');
                 SQL.Add(' ON (CAB.ID_FORMULA = FOM.ID_FORMULA) ');
                 SQL.Add(' WHERE  ');
                 SQL.Add(' CAB.TABLA_ESC <> '''' AND ');
                 SQL.Add(' CAB.ID_FORMULA = ?ID_FORMULA AND ');
                 SQL.Add(' CAB.ID_FORMULA_CAMPOS_CAB > ?ID_FORMULA_CAMPOS_CAB AND ');
                 SQL.Add(' FOM.ACTIVO = 1 ');
                 SQL.Add(' ORDER BY CAB.ID_FORMULA_CAMPOS_CAB ');
                 Params.ByName['ID_FORMULA'].AsInteger := ID_formula;
                 Params.ByName['ID_FORMULA_CAMPOS_CAB'].AsInteger := ID_formula_campos_cab;
                 ExecQuery;
                 id_formula_campos_cab := FieldByName['ID_FORMULA_CAMPOS_CAB'].AsInteger;
                 cab_formula := FieldByName['FORMULA'].AsString;
                 cab_campo := FieldByName['CAMPO_ESC'].AsString;
                 cab_tabla := FieldByName['TABLA_ESC'].AsString;
                 cab_redondeo := FieldByName['TIPO_REDONDEO'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Borrar tabla temporal
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Clear;
                 SQL.Add(' DELETE FROM PRO_TMP_VALOR_FORMULA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ENTRADA = ?ENTRADA AND ');
                 SQL.Add(' PROCEDENCIA = ?PROCEDENCIA ');
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['PROCEDENCIA'].AsString := procedencia{'pro_mat_esc'};
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Seleccionar el numero de campos implicados en la fórmula del campo
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Clear;
                 SQL.Add(' SELECT COUNT(NOMBRE) ');
                 SQL.Add(' FROM PRO_FORMULAS_CAMPOS_DET ');
                 SQL.Add(' WHERE ID_FORMULA_CAMPOS_CAB = ?ID_FORMULA_CAMPOS_CAB ');
                 Params.ByName['ID_FORMULA_CAMPOS_CAB'].AsInteger := ID_formula_campos_cab;
                 ExecQuery;
                 num_var := FieldByName['COUNT'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           ID_formula_campos_det := 0;
           if (num_var <> 0) then
              for J := 0 to num_var - 1 do
              begin     // begin - for num_var
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       Database := DMMain.DataBase;
                       SQL.Clear;
                       SQL.Add(' SELECT ID_FORMULA_CAMPOS_DET, NOMBRE, CAMPO_ESC, TABLA_ESC, VALOR ');
                       SQL.Add(' FROM PRO_FORMULAS_CAMPOS_DET ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_FORMULA_CAMPOS_CAB = ?ID_FORMULA_CAMPOS_CAB AND ');
                       SQL.Add(' ID_FORMULA_CAMPOS_DET > ?ID_FORMULA_CAMPOS_DET ');
                       SQL.Add(' ORDER BY ID_FORMULA_CAMPOS_DET ASC ');
                       Params.ByName['ID_FORMULA_CAMPOS_CAB'].AsInteger := ID_formula_campos_cab;
                       Params.ByName['ID_FORMULA_CAMPOS_DET'].AsInteger := ID_formula_campos_det;
                       ExecQuery;
                       ID_formula_campos_det := FieldByName['ID_FORMULA_CAMPOS_DET'].AsInteger;
                       var_nombre := FieldByName['NOMBRE'].AsString;
                       var_campo := FieldByName['CAMPO_ESC'].AsString;
                       var_tabla := FieldByName['TABLA_ESC'].AsString;
                       valor := FieldByName['VALOR'].AsFloat;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (valor = 0) then
                 begin
                    // obtener valor númerico del campo de la variable
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          Database := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add('SELECT ' + var_campo + ' AS CAMPO ' + 'FROM ' + var_tabla);

                          if (Trim(var_tabla) = 'PRO_ESCANDALLO') then
                          begin
                             SQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO ');
                          end
                          else if (Trim(var_tabla) = 'PRO_MAT_ESC') then
                          begin
                             SQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO AND ID_MATERIAL = ?ID_MATERIAL');
                             { 'and linea_comp=?linea_comp';}
                             Params.ByName['id_material'].AsInteger := id_mat_tar;
                          end
                          else if (Trim(var_tabla) = 'PRO_TAREA_ESC') then
                          begin
                             SQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO AND ID_TAREA = ?ID_TAREA');
                             { 'and linea_comp=?linea_comp';}
                             Params.ByName['id_tarea'].AsInteger := id_mat_tar;
                          end
                          else if (Trim(var_tabla) = 'VER_DATOS_ESCANDALLO') then
                          begin
                             SQL.Add(' WHERE ID_ESC = ?ID_ESC');
                             Params.ByName['id_esc'].AsInteger := id_esc;
                          end;

                          if (Trim(var_tabla) <> 'VER_DATOS_ESCANDALLO') then
                          begin
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
                             Params.ByName['TIPO'].AsString := Tipo;
                          end;

                          ExecQuery;
                          valor := FieldByName['CAMPO'].AsFloat;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       Database := DMMain.DataBase;
                       SQL.Clear;
                       SQL.Add('INSERT INTO PRO_TMP_VALOR_FORMULA(ENTRADA, NOMBRE_VARIABLE, VALOR, PROCEDENCIA) ');
                       SQL.Add('VALUES (?ENTRADA, ?NOMBRE_VAR, ?VALOR_CAMPO, ?PROCEDENCIA) ');
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Params.ByName['NOMBRE_VAR'].AsString := var_nombre;
                       Params.ByName['VALOR_CAMPO'].AsFloat := valor;
                       Params.ByName['PROCEDENCIA'].AsString := procedencia;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end; // end - for num_var

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Text := 'SELECT VALOR FROM PRO_CALCULA_FORMULA (?ENTRADA, ?FORMULA, ?PROCEDENCIA, ?TIPO_REDONDEO)';
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['FORMULA'].AsString := cab_formula;
                 Params.ByName['PROCEDENCIA'].AsString := procedencia;
                 Params.ByName['TIPO_REDONDEO'].AsInteger := cab_redondeo;
                 ExecQuery;
                 resultado := FieldByName['VALOR'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Clear;

                 if (Trim(cab_tabla) = 'PRO_ESCANDALLO') then
                 begin
                    cab_campo_tmp := Trim(cab_Campo);
                    cab_campo_tmp := Copy(cab_campo_tmp, 0, 6);
                    SQL.Add(' UPDATE ' + Trim(cab_tabla));
                    SQL.Add(' SET ');
                    if (cab_campo_tmp <> 'MEDIDA') then
                       SQL.Add(' DESACTIVA_TRIGGER = 1, ')
                    else
                       SQL.Add(' DESACTIVA_TRIGGER = 0, ');

                    SQL.Add(Trim(cab_campo) + ' = ?RESULTADO ');
                    SQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
                    Params.ByName['TIPO'].AsString := Tipo;
                    Params.ByName['RESULTADO'].AsFloat := resultado;
                 end
                 else
                 if (Trim(cab_tabla) = 'PRO_TAREA_ESC') then
                 begin
                    SQL.Add(' UPDATE ' + Trim(cab_tabla));
                    SQL.Add(' SET ' + Trim(cab_campo) + '= ?resultado ');
                    SQL.Add(' WHERE EMPRESA = ?EMPRESA AND ESCANDALLO = ?ESCANDALLO AND TIPO = ?TIPO AND ID_TAREA = ?ID_TAREA ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
                    Params.ByName['TIPO'].AsString := Tipo;
                    Params.ByName['ID_TAREA'].AsInteger := id_mat_tar;
                    Params.ByName['RESULTADO'].AsFloat := resultado;
                 end
                 else
                 if (Trim(cab_tabla) = 'PRO_MAT_ESC') then
                 begin
                    SQL.Add(' UPDATE ' + Trim(cab_tabla));
                    SQL.Add(' SET ' + Trim(cab_campo) + ' = ?RESULTADO ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = ?EMPRESA AND ');
                    SQL.Add(' ESCANDALLO = ?ESCANDALLO AND ');
                    SQL.Add(' TIPO = ?TIPO AND ');
                    SQL.Add(' ID_MATERIAL = ?ID_MATERIAL ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
                    Params.ByName['TIPO'].AsString := Tipo;
                    Params.ByName['ID_MATERIAL'].AsInteger := id_mat_tar;
                    Params.ByName['RESULTADO'].AsFloat := resultado;
                 end;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end; // end - si esta activo
        // sfg.albert 22/10/2013
        // else
        //   ShowMessage(_('Se está utilizando una fórmula que no esta activa: ') + IntToStr(ID_formula));
     end; // end -  for num_campos
  // end; // end- for num_escandallos
  // QMProMatEsc.Open;
end;

procedure TProDMEscandallo.CompruebaFases;
begin
  ProFMEscandallo.PCMatTar.Enabled := True;
  ProFMEscandallo.PCMatTar.Visible := True;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(ID_ESC) FROM PRO_FASES_ESC WHERE ID_ESC = ?ID_ESC';
        Params.ByName['ID_ESC'].AsInteger := QMProEscandalloID_ESC.AsInteger;
        ExecQuery;

        if (FieldByName['COUNT'].AsInteger) = 0 then
        begin
           // Deshabilita materiales porque no existe Fase
           ProFMEscandallo.PCMatTar.Enabled := False;
           ProFMEscandallo.PCMatTar.Visible := False;
        end;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMEscandallo.QMProEscandalloBeforeClose(DataSet: TDataSet);
begin
  {dji lrk kri - DataSource }
  QMProFasesEsc.Close;
  QMProDibEsc.Close;
end;

procedure TProDMEscandallo.QMProFasesEscBeforeClose(DataSet: TDataSet);
begin
  QMProTareaEsc.Close;
  QMProMatEsc.Close;
end;

procedure TProDMEscandallo.QMProMatEscAfterOpen(DataSet: TDataSet);
begin
  xMaterialesEscNotas.Open;
end;

procedure TProDMEscandallo.QMProMatEscBeforeClose(DataSet: TDataSet);
begin
  xMaterialesEscNotas.Close;
end;

procedure TProDMEscandallo.QMProTareaEscTIPOTAREAChange(Sender: TField);
begin
  if QMProTareaEsc.State in [dsEdit, dsInsert] then
     QMProTareaEscTAREA.AsString := DameTituloTarea(QMProTareaEscTIPOTAREA.AsString);
end;

procedure TProDMEscandallo.OrdenarLineas(Tipo: string);
var
  TS : TFIBTableSet;
begin
  TS := nil;
  if (Tipo = 'MESC') then
     TS := QMProMatEsc
  else
  if (Tipo = 'TESC') then
     TS := QMProTareaEsc;

  TS.DisableControls;
  try
     OrdenaLineas(Tipo, QMProEscandalloID_ESC.AsInteger, Self);
     TS.Close;
     TS.Open;
  finally
     TS.EnableControls;
  end;
end;

procedure TProDMEscandallo.CalculaFormulasFiltro;
var
  IdEscandallo : integer;
begin
  /// Recorro los escandallos filtrados calculando la formula de cada uno.
  /// Al finalizar reposiciono en el escandallo original

  // Guardo posicion
  IdEscandallo := QMProEscandalloID_ESC.AsInteger;

  Screen.Cursor := crHourGlass;
  try
     with QMProEscandallo do
     begin
        DisableControls;
        try
           First;
           while (not EOF) do
           begin
              CalculaFormulas(QMProEscandalloTIPO.AsString, QMProEscandalloESCANDALLO.AsInteger);
              Next;
           end;
        finally
           EnableControls;
        end;
     end;
  finally
     Screen.Cursor := crDefault;
  end;

  Posicionar(QMProEscandallo, 'ID_ESC', IdEscandallo);
end;

procedure TProDMEscandallo.ActualizarPCosteArticulosFiltro;
var
  IdEscandallo : integer;
begin
  /// Recorro los escandallos filtrados calculando la formula de cada uno.
  /// Al finalizar reposiciono en el escandallo original

  // Guardo posicion
  IdEscandallo := QMProEscandalloID_ESC.AsInteger;

  Screen.Cursor := crHourGlass;
  try
     with QMProEscandallo do
     begin
        DisableControls;
        try
           First;
           while (not EOF) do
           begin
              if ((QMProEscandalloESTADO.AsInteger = 1) and (QMProEscandalloDEFECTO.AsInteger = 1)) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE ART_ARTICULOS SET P_COSTE = :P_COSTE WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND P_COSTE <> :P_COSTE';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['ARTICULO'].AsString := QMProEscandalloCOMPUESTO.AsString;
                       if (QMProEscandalloUNIDADES.AsFloat <> 0) then
                          Params.ByName['P_COSTE'].AsFloat := QMProEscandalloCOSTE_TOTAL.AsFloat / QMProEscandalloUNIDADES.AsFloat
                       else
                          Params.ByName['P_COSTE'].AsFloat := QMProEscandalloCOSTE_TOTAL.AsFloat;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
              Next;
           end;
        finally
           EnableControls;
        end;
     end;
  finally
     Screen.Cursor := crDefault;
  end;

  Posicionar(QMProEscandallo, 'ID_ESC', IdEscandallo);
end;

procedure TProDMEscandallo.ActualizarPrecios(Escandallo: integer; Tipo: string = '');
begin
  Screen.Cursor := crHourGlass;
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_ACTUALIZA_PRECIO_MAT_MODELO(:EMPRESA, :ESCANDALLO, :TIPO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           if (Escandallo > 0) then
           begin
              Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
              Params.ByName['TIPO'].AsString := Tipo;
           end
           else
           begin
              Params.ByName['ESCANDALLO'].AsInteger := QMProEscandalloESCANDALLO.AsInteger;
              Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
           end;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TProDMEscandallo.ActualizarPreciosFiltro;
var
  Escandallo : integer;
begin
  Screen.Cursor := crHourGlass;
  try
     Escandallo := QMProEscandalloESCANDALLO.AsInteger;
     with QMProEscandallo do
     begin
        First;
        DisableControls;
        try
           while (not EOF) do
           begin
              ActualizarPrecios(QMProEscandalloESCANDALLO.AsInteger, QMProEscandalloTIPO.AsString);
              Next;
           end;

           Close;
           Open;
           while ((not EOF) and (Escandallo <> QMProEscandalloESCANDALLO.AsInteger)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  finally
     Screen.Cursor := crDefault;
  end;
end;

function TProDMEscandallo.TotalEscandallosFiltro: integer; //sfg.albert
var
  Escandallo : integer;
begin
  Escandallo := QMProEscandalloESCANDALLO.AsInteger;

  with QMProEscandallo do
  begin
     Last;
     Result := RecordCount;
  end;

  PosicionaEscandallo(Escandallo);
end;

procedure TProDMEscandallo.QMProTareaEscTIMEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := SegundosToStr(QMProTareaEscTIEMPO.AsFloat);
end;

procedure TProDMEscandallo.VerificarCompuestoEscandallo(Compuesto: string);
begin
  if (QMProEscandallo.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, ESCANDALLO FROM PRO_ESCANDALLO WHERE EMPRESA = :EMPRESA AND COMPUESTO = :COMPUESTO AND TIPO = ''EPR''';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['COMPUESTO'].AsString := Compuesto;
           ExecQuery;

           if (FieldByName['EMPRESA'].AsInteger > 0) then
           begin
              if MessageDlg(Format(_('Existe un escandallo para este compuesto.' + #13#10 +
                 'Escandallo nº %s' + #13#10 + #13#10 +
                 '¿Desea continuar?'), [FieldByName['ESCANDALLO'].AsString]),
                 mtInformation, [mbOK, mbCancel], 0) = mrCancel then
                 ProDMEscandallo.QMProEscandallo.Cancel;
           end
           else
              ProDMEscandallo.QMProEscandalloDEFECTO.AsInteger := 1;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMEscandallo.PropagaAlmacenLanzamientoAMateriales;
begin
  if ((QMProEscandallo.State = dsBrowse) and (QMProEscandalloID_ESC.AsInteger > 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE PRO_MAT_ESC SET ALMACEN = :ALMACEN_LAN WHERE ID_ESC = :ID_ESC AND ALMACEN <> :ALMACEN_LAN';
           Params.ByName['ID_ESC'].AsInteger := QMProEscandalloID_ESC.AsInteger;
           Params.ByName['ALMACEN_LAN'].AsString := QMProEscandalloALMACEN_LAN.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMEscandallo.ActualizaDefecto;
begin
  DEFECTO_ValorAntiguo := QMProEscandalloDEFECTO.AsInteger;
end;

procedure TProDMEscandallo.PosicionaEscandallo(Escandallo: integer);
begin
  OptimizaBusqueda(True);
  try
     Refrescar(QMProEscandallo, 'ESCANDALLO', Escandallo);
  finally
     OptimizaBusqueda(False);
  end;
end;

procedure TProDMEscandallo.OptimizaBusqueda(Optimizar: boolean);
begin
  /// Establece variable Posicionando que evita que se ejecuta AfterScroll
  /// Cuando se quita la optimización hay que forzar la ejecución para refrescar algunos datos.

  Posicionando := Optimizar;
  if not Posicionando then
     QMProEscandalloAfterScroll(QMProEscandallo);
end;

procedure TProDMEscandallo.InsertaMaterial(Articulo, Titulo, Familia, Subfamilia, CodigoProveedor: string; Unidades, Precio: double; Proveedor: integer; PCoste: double; NoCrearEscandallo: array of string);
var
  Inserta : boolean;
  IdEscandallo, IdMaterial : integer;
  Accion : string;
  i : integer;
  CrearEscandallo : boolean;
begin
  Inserta := True;

  // Miramos si existe el articulo
  if (DameIdArticulo(Articulo) = 0) then
  begin
     if (MessageDlg(Format(_('El artículo %s - %s no existe.' + #13#10 + '¿Desea crear el artículo?'), [Articulo, Titulo]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE INSERTA_ARTICULO_A_IMPORTAR(?EMPRESA, ?EJERCICIO, ?CANAL, ?ARTICULO, ?TITULO, ?ENTRADA, ?FAMILIA, ?SUBFAMILIA, ?PROVEEDOR, ?CODIGO_PROVEEDOR) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['TITULO'].AsString := Titulo;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['FAMILIA'].AsString := Familia;
              Params.ByName['SUBFAMILIA'].AsString := Subfamilia;
              Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
              Params.ByName['CODIGO_PROVEEDOR'].AsString := CodigoProveedor;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Verificar si es un escandallo y preguntar si quiere crearlo
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ID_ESC FROM PRO_ESCANDALLO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' COMPUESTO = :COMPUESTO AND ');
              SQL.Add(' TIPO = :TIPO ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['COMPUESTO'].AsString := Articulo;
              Params.ByName['TIPO'].AsString := 'EPR';
              ExecQuery;
              IdEscandallo := FieldByName['ID_ESC'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (IdEscandallo = 0) then
        begin
           CrearEscandallo := True;
           for i := 0 to 4 do
           begin
              if (Pos(NoCrearEscandallo[i], Articulo) > 0) then
                 CrearEscandallo := False;
           end;

           if (CrearEscandallo and (MessageDlg(Format(_('El artículo %s - %s no tiene escandallo.' + #13#10 + '¿Desea crear el escandallo?'), [Articulo, Titulo]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO PRO_ESCANDALLO ( ');
                    SQL.Add(' EMPRESA, COMPUESTO, TIPO, DESCRIPCION, UNIDADES, UNIDAD, ENTRADA, CLIENTE) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :EMPRESA, :COMPUESTO, :TIPO, :DESCRIPCION, :UNIDADES, :UNIDAD, :ENTRADA, :CLIENTE) ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['COMPUESTO'].AsString := Articulo;
                    Params.ByName['TIPO'].AsString := 'EPR';
                    Params.ByName['DESCRIPCION'].AsString := Titulo;
                    Params.ByName['UNIDADES'].AsFloat := 1;
                    Params.ByName['UNIDAD'].AsString := '-';
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['CLIENTE'].AsInteger := -1;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end
     else
        Inserta := False;
  end;

  if (Inserta) then
  begin
     // Se inserta el registro
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT ID_MATERIAL FROM PRO_MAT_ESC ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ESCANDALLO = :ESCANDALLO AND ');
           SQL.Add(' LINEA_FASE = :LINEA_FASE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' COMPONENTE = :COMPONENTE ');
           Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
           Params.ByName['ESCANDALLO'].AsInteger := QMProEscandalloESCANDALLO.AsInteger;
           Params.ByName['TIPO'].AsString := QMProEscandalloTIPO.AsString;
           Params.ByName['LINEA_FASE'].AsInteger := QMProFasesEscLINEA_FASE.AsInteger;
           Params.ByName['COMPONENTE'].AsString := Articulo;
           ExecQuery;
           IdMaterial := FieldByName['ID_MATERIAL'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Accion := 'C';
     if (IdMaterial <> 0) then
     begin
        Accion := 'A';
        if not InputQuery(_('Accion'), _('El componente ' + Articulo + ' ya existe.' + #13#10 + '*C*rear nueva linea' + #13#10 + '*A*gregar unidades a linea' + #13#10 + '*I*gnorar'), Accion) then
           Accion := 'I';
     end;

     if (Accion = 'C') then
     begin
        QMProMatEsc.Insert;
        QMProMatEscCOMPONENTE.AsString := Articulo;
        QMProMatEscUNIDADES.AsFloat := Unidades;
        if (Precio >= 0) then
           QMProMatEscPRE_COS_UNI.AsFloat := Precio;
        QMProMatEsc.Post;
     end;

     if (Accion = 'A') then
     begin
        Posicionar(QMProMatEsc, 'COMPONENTE', Articulo);
        QMProMatEsc.Edit;
        QMProMatEscUNIDADES.AsFloat := QMProMatEscUNIDADES.AsFloat + Unidades;
        QMProMatEsc.Post;
     end;
  end;
end;

procedure TProDMEscandallo.QMProTareaEscAfterOpen(DataSet: TDataSet);
begin
  xTareaEscNotas.Open;
end;

procedure TProDMEscandallo.QMProTareaEscBeforeClose(DataSet: TDataSet);
begin
  xTareaEscNotas.Close;
end;

procedure TProDMEscandallo.CopiaNotasAModelo;
var
  Articulo : string;
begin
  if (Application.MessageBox(PChar(string(_('¿Desea copiar las notas al resto de escandallos del mismo modelo?'))),
     PChar(string(_('Confirmación'))),
     mb_iconstop + mb_yesno) = id_yes) then
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
              SelectSQL.Add(' SELECT ART.ARTICULO ');
              SelectSQL.Add(' FROM ART_ARTICULOS ART ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' -- ID_A_M ES EL MODELO DEL ARTICULO ');
              SelectSQL.Add(' AMC.ID_A_M = (SELECT AMC.ID_A_M ');
              SelectSQL.Add('               FROM ART_ARTICULOS ART ');
              SelectSQL.Add('               JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A_M_C_T ');
              SelectSQL.Add('               JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C ');
              SelectSQL.Add('               WHERE ');
              SelectSQL.Add('               ART.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add('               ART.ARTICULO = :ARTICULO) ');
              Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
              Params.ByName['ARTICULO'].AsString := QMProEscandalloCOMPUESTO.AsString;
              Open;
              while not EOF do
              begin
                 Articulo := FieldByName('ARTICULO').AsString;

                 // Borro el codigo que haya para el proveedor y pongo el nuevo
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE PRO_ESCANDALLO ');
                       SQL.Add(' SET ');
                       SQL.Add(' NOTAS = :NOTAS ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' COMPUESTO = :COMPUESTO AND ');
                       SQL.Add(' TIPO = ''EPR'' ');
                       Params.ByName['EMPRESA'].AsInteger := QMProEscandalloEMPRESA.AsInteger;
                       Params.ByName['COMPUESTO'].AsString := Articulo;
                       Params.ByName['NOTAS'].AsString := QMProEscandalloNOTAS.AsString;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
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
  end;

  Refrescar(QMProEscandallo, 'ID_ESC', QMProEscandalloID_ESC.AsInteger);
end;

procedure TProDMEscandallo.DuplicarTarea(Empresa, Escandallo, Linea_fase, Linea_tarea: integer; Tipo: string);
begin
  if ConfirmaMensaje(_('¿Desea duplicar la tarea del escandallo?')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_DUPLICAR_TAREA_ESCANDALLO (:EMPRESA, :ESCANDALLO, :LINEA_FASE, :LINEA_TAREA, :TIPO) ');

           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
           Params.ByName['LINEA_FASE'].AsInteger := Linea_fase;
           Params.ByName['LINEA_TAREA'].AsInteger := Linea_tarea;
           Params.ByName['TIPO'].AsString := Tipo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMProTareaEsc, 'LINEA_TAREA', QMProTareaEscLINEA_TAREA.AsInteger);
  end;
end;

procedure TProDMEscandallo.DuplicarMaterial(Empresa, Escandallo, Linea_comp: integer; Tipo: string);
begin
  if ConfirmaMensaje(_('¿Desea duplicar el material del escandallo?')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_DUPLICAR_MAT_ESCANDALLO (:EMPRESA, :ESCANDALLO, :LINEA_COMP, :TIPO) ');

           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
           Params.ByName['LINEA_COMP'].AsInteger := Linea_comp;
           Params.ByName['TIPO'].AsString := Tipo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMProMatEsc, 'ID_MATERIAL', QMProMatEscID_MATERIAL.AsInteger);
  end;
end;

procedure TProDMEscandallo.QMTmpCostesEscandallosNewRecord(DataSet: TDataSet);
begin
  QMTmpCostesEscandallosID_ESC.AsInteger := QMProEscandalloID_ESC.AsInteger;
end;

procedure TProDMEscandallo.RecalcularCostesPorUnidades;
begin
  with QMTmpCostesEscandallos do
  begin
     First;
     while not EOF do
     begin
        Edit;
        Post;
        Next;
     end;
  end;
end;

procedure TProDMEscandallo.CambiarEstadoFiltrados(Estado: integer);
var
  id_escandallo : integer;
begin
  id_escandallo := QMProEscandalloID_ESC.AsInteger;

  with QMProEscandallo do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           // Parametro 0 = Cambia el estado del escandallo actual, sin refrescar los datos
           CambiarEstado(Estado, 0);
           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  Refrescar(QMProEscandallo, 'ID_ESC', id_escandallo, False, True);
end;

procedure TProDMEscandallo.DameDatosTroquel(Troquel: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ANCHO, SH_ANCHO, FIGURAS_ANCHO, AVANCE, SV_AVANCE, FIGURAS_AVANCE FROM EMP_TROQUELES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TROQUEL = :TROQUEL ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TROQUEL'].AsInteger := Troquel;
        ExecQuery;

        QMCalculoMetrosANCHO.AsFloat := FieldByName['ANCHO'].AsFloat;
        QMCalculoMetrosSH_ANCHO_TROQUEL.AsFloat := FieldByName['SH_ANCHO'].AsFloat;
        QMCalculoMetrosFIGURAS_ANCHO_TROQUEL.AsFloat := FieldByName['FIGURAS_ANCHO'].AsFloat;
        QMCalculoMetrosLARGO.AsFloat := FieldByName['AVANCE'].AsFloat;
        QMCalculoMetrosSV_AVANCE_TROQUEL.AsFloat := FieldByName['SV_AVANCE'].AsFloat;
        QMCalculoMetrosFIGURAS_AVANCE_TROQUEL.AsFloat := FieldByName['FIGURAS_AVANCE'].AsFloat;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMEscandallo.QMCalculoMetrosNewRecord(DataSet: TDataSet);
begin
  QMCalculoMetrosEMPRESA.AsInteger := QMProEscandalloEMPRESA.AsInteger;
  QMCalculoMetrosESCANDALLO.AsInteger := QMProEscandalloESCANDALLO.AsInteger;
  QMCalculoMetrosTIPO.AsString := QMProEscandalloTIPO.AsString;
end;

procedure TProDMEscandallo.CrearDesarrolloEscandallo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DESARROLLO_ESCANDALLO_ETI (:EMPRESA, :ESCANDALLO, :TIPO, :ENTRADA) ');

        Params.ByName['EMPRESA'].AsInteger := QMCalculoMetrosEMPRESA.AsInteger;
        Params.ByName['ESCANDALLO'].AsInteger := QMCalculoMetrosESCANDALLO.AsInteger;
        Params.ByName['TIPO'].AsString := QMCalculoMetrosTIPO.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;

        FreeHandle;
     finally
        Free;
     end;

     // Refrescamos calculos costes de escandallo
     QMTmpCostesEscandallos.Close;
     QMTmpCostesEscandallos.Open;
  end;
end;

procedure TProDMEscandallo.QMCalculoMetrosTROQUELChange(Sender: TField);
begin
  // Recuperamos datos del troquel
  DameDatosTroquel(QMCalculoMetrosTROQUEL.AsInteger);
end;

procedure TProDMEscandallo.QMProMatEscCalcFields(DataSet: TDataSet);
begin
  QMProMatEscPRECIOMAT.AsFloat := QMProMatEscP_COSTE.AsFloat;
end;

procedure TProDMEscandallo.QMProMatEscSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, False), QMProMatEscSTOCK.AsFloat);
end;

procedure TProDMEscandallo.QMProMatEscSTOCK_ALM_LANGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(CalculaMascara(QMProMatEscDECIMALES_UNIDAD_FAB.AsInteger, False), QMProMatEscSTOCK_ALM_LAN.AsFloat);
end;

end.
