unit UObrDMObras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, jpeg, GIFImage, Graphics, ExtCtrls, FIBQuery, HYFIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, Dialogs, UFIBModificados;

type
  TObrDMObras = class(TDataModule)
     TLocal: TFIBTransaction;
     QMCabObras: TFIBTableSet;
     DSCabObras: TDataSource;
     QMCabObrasEMPRESA: TIntegerField;
     QMCabObrasCODIGO: TIntegerField;
     QMCabObrasDESCRIPCION_OBRA: TFIBStringField;
     QMCabObrasCLIENTE: TIntegerField;
     QMCabObrasDIRECCION: TIntegerField;
     QMCabObrasFECHA_INICIO: TDateTimeField;
     QMCabObrasFECHA_PREVISTA_CIERRE: TDateTimeField;
     QMCabObrasFECHA_CIERRE: TDateTimeField;
     QMCabObrasESTADO: TIntegerField;
     QMCabObrasFECHA_ULTIMA_IMPUTACION: TDateTimeField;
     QMCabObrasCONTROL_ALMACEN: TIntegerField;
     QMCabObrasALMACEN: TFIBStringField;
     QMCabObrasCONTROL_PARTIDAS: TIntegerField;
     QMCabObrasNOTAS: TMemoField;
     QMCabObrasIMAGEN: TIntegerField;
     QMCabObrasTERCERO: TIntegerField;
     QMCabObrasTOTAL_OFERTA_PRES_PED: TFloatField;
     QMCabObrasCOSTE_PREV: TFloatField;
     QMCabObrasMARGEN_PREV: TFloatField;
     QMCabObrasTOTAL_FACTURADO: TFloatField;
     QMCabObrasTOTAL_PDTE_FACTURAR: TFloatField;
     QMCabObrasTOTAL_COSTES_ALB: TFloatField;
     QMCabObrasTOTAL_COSTES_FAB: TFloatField;
     QMCabObrasTOTAL_COSTES_MAT: TFloatField;
     QMCabObrasTOTAL_COSTES_HORAS: TFloatField;
     QMCabObrasTOTAL_COSTES_TAREAS: TFloatField;
     QMCabObrasTOTAL_COSTES_ALB_PROV: TFloatField;
     QMCabObrasTOTAL_COSTES: TFloatField;
     QMCabObrasMARGEN_BENEFICIO: TFloatField;
     DSDetObras: TDataSource;
     DSDetCostAlbCli: TDataSource;
     DSDetCostProd: TDataSource;
     DSDetCostVar: TDataSource;
     DSDetIngr: TDataSource;
     DSDetostAlbProv: TDataSource;
     QMDetCostAlbCli: TFIBTableSet;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     xClientesTERCERO: TIntegerField;
     QMImagenObras: TFIBTableSet;
     DSImagenObras: TDataSource;
     QMImagenObrasEMPRESA: TIntegerField;
     QMImagenObrasCODIGO: TIntegerField;
     QMImagenObrasLINEA: TIntegerField;
     QMImagenObrasID_IMAGEN: TIntegerField;
     QMImagenObrasNombre: TStringField;
     QLineaDetObras: THYFIBQuery;
     QMDetCostAlbCliEMPRESA: TIntegerField;
     QMDetCostAlbCliCODIGO: TIntegerField;
     QMDetCostAlbCliLINEA: TIntegerField;
     QMDetCostAlbCliLINEA_DET: TIntegerField;
     QMDetCostAlbCliSERIE: TFIBStringField;
     QMDetCostAlbCliRIG: TIntegerField;
     QMDetCostAlbCliFECHA: TDateTimeField;
     QMDetCostAlbCliIMPORTE_IMPUTADO: TFloatField;
     QMDetCostAlbCliCANAL_ALB: TIntegerField;
     QLineaCostAlbCli: THYFIBQuery;
     QMDetCostAlbCliID_S_ALB: TIntegerField;
     QMDetCostAlbCliEJERCICIO_ALB: TIntegerField;
     xAlbaranesCli: TFIBDataSetRO;
     DSxAlbaranesCli: TDataSource;
     xAlbaranesCliEMPRESA: TIntegerField;
     xAlbaranesCliEJERCICIO: TIntegerField;
     xAlbaranesCliCANAL: TIntegerField;
     xAlbaranesCliSERIE: TFIBStringField;
     xAlbaranesCliTIPO: TFIBStringField;
     xAlbaranesCliRIG: TIntegerField;
     xAlbaranesCliALMACEN: TFIBStringField;
     xAlbaranesCliMONEDA: TFIBStringField;
     xAlbaranesCliFECHA: TDateTimeField;
     xAlbaranesCliTERCERO: TIntegerField;
     xAlbaranesCliTITULO: TFIBStringField;
     xAlbaranesCliDIRECCION: TIntegerField;
     xAlbaranesCliCLIENTE: TIntegerField;
     xAlbaranesCliSU_REFERENCIA: TFIBStringField;
     xAlbaranesCliFORMA_PAGO: TFIBStringField;
     xAlbaranesCliCAMPANYA: TIntegerField;
     xAlbaranesCliNOTAS: TBlobField;
     xAlbaranesCliESTADO: TIntegerField;
     xAlbaranesCliBULTOS: TIntegerField;
     xAlbaranesCliLINEAS: TIntegerField;
     xAlbaranesCliBRUTO: TFloatField;
     xAlbaranesCliI_DTO_LINEAS: TFloatField;
     xAlbaranesCliS_BASES: TFloatField;
     xAlbaranesCliM_BRUTO: TFloatField;
     xAlbaranesCliC_TOTAL: TFloatField;
     xAlbaranesCliAGENTE: TIntegerField;
     xAlbaranesCliS_CUOTA_IVA: TFloatField;
     xAlbaranesCliS_CUOTA_RE: TFloatField;
     xAlbaranesCliB_DTO_LINEAS: TFloatField;
     xAlbaranesCliDTO_PP: TFloatField;
     xAlbaranesCliDTO_CIAL: TFloatField;
     xAlbaranesCliI_DTO_CIAL: TFloatField;
     xAlbaranesCliI_DTO_PP: TFloatField;
     xAlbaranesCliB_COMISION: TFloatField;
     xAlbaranesCliI_COMISION: TFloatField;
     xAlbaranesCliPOR_FINANCIACION: TFloatField;
     xAlbaranesCliI_FINANCIACION: TFloatField;
     xAlbaranesCliLIQUIDO: TFloatField;
     xAlbaranesCliENTRADA: TIntegerField;
     xAlbaranesCliTRANSPORTISTA: TIntegerField;
     xAlbaranesCliI_BASE_RETENCION: TFloatField;
     xAlbaranesCliP_RETENCION: TFloatField;
     xAlbaranesCliI_RETENCION: TFloatField;
     xAlbaranesCliTIPO_IRPF: TIntegerField;
     xAlbaranesCliA_IRPF: TIntegerField;
     xAlbaranesCliTOTAL_A_COBRAR: TFloatField;
     xAlbaranesCliNOMBRE_COMERCIAL: TFIBStringField;
     xAlbaranesCliPORTES: TIntegerField;
     xAlbaranesCliTARIFA: TFIBStringField;
     xAlbaranesCliID_S: TIntegerField;
     xAlbaranesCliALMACEN_DEPOSITO: TFIBStringField;
     xAlbaranesCliNUM_MOV_DEPOSITO: TIntegerField;
     xAlbaranesCliDEPOSITO: TIntegerField;
     xAlbaranesCliDEVOLUCION_DEPOSITO: TIntegerField;
     xAlbaranesCliIDIOMA: TFIBStringField;
     xAlbaranesCliTIPO_PORTES: TIntegerField;
     xAlbaranesCliPOR_PORTES: TFloatField;
     xAlbaranesCliI_PORTES: TFloatField;
     xAlbaranesCliI_PORTES_CANAL: TFloatField;
     xAlbaranesCliRANGO: TIntegerField;
     xAlbaranesCliINDICE: TIntegerField;
     xAlbaranesCliCAMBIO_FIJO: TIntegerField;
     xAlbaranesCliVALOR_CAMB_FIJO: TFloatField;
     QLineaCostProd: THYFIBQuery;
     xOrdenesFab: TFIBDataSetRO;
     DSxOrdenesFab: TDataSource;
     xOrdenesFabID_ORDEN: TIntegerField;
     xOrdenesFabFECHA_ORD: TDateTimeField;
     xOrdenesFabCOSTE_FIJO_REAL: TFloatField;
     xOrdenesFabCOSTE_VAR_REAL: TFloatField;
     xOrdenesFabCOSTE_MAT_REAL: TFloatField;
     xOrdenesFabCOSTE_MO_REAL: TFloatField;
     xOrdenesFabCOSTE_MAQ_REAL: TFloatField;
     xOrdenesFabCOSTE_TEX_REAL: TFloatField;
     xOrdenesFabCOSTE_TOT_REAL: TFloatField;
     QMCabObrasENTRADA: TIntegerField;
     QMDetCostProd: TFIBTableSet;
     QMDetCostProdEMPRESA: TIntegerField;
     QMDetCostProdCODIGO: TIntegerField;
     QMDetCostProdLINEA: TIntegerField;
     QMDetCostProdLINEA_DET: TIntegerField;
     QMDetCostProdRIG: TIntegerField;
     QMDetCostProdFECHA: TDateTimeField;
     QMDetCostProdID_ORDEN: TIntegerField;
     QMDetCostProdEJERCICIO_OF: TIntegerField;
     QMDetCostProdCANAL_OF: TIntegerField;
     QMDetCostProdSERIE_OF: TFIBStringField;
     QMDetCostProdIMPORTE_MAT_IMPUTADO: TFloatField;
     QMDetCostProdIMPORTE_FIJO_IMPUTADO: TFloatField;
     QMDetCostProdIMPORTE_VARIOS_IMPUTADO: TFloatField;
     QMDetCostProdIMPORTE_MAQ_IMPUTADO: TFloatField;
     QMDetCostProdIMPORTE_TEXT_IMPUTADO: TFloatField;
     QMDetCostProdIMPORTE_MO_IMPUTADO: TFloatField;
     QMDetObras: TFIBTableSet;
     QMDetObrasEMPRESA: TIntegerField;
     QMDetObrasCODIGO: TIntegerField;
     QMDetObrasLINEA: TIntegerField;
     QMDetObrasDESCRIPCION: TFIBStringField;
     QMDetObrasCOMENTARIO: TMemoField;
     QMDetObrasORDEN: TIntegerField;
     QMDetObrasTOTAL_OFERTA_PRES_PED: TFloatField;
     QMDetObrasCOSTE_PREV: TFloatField;
     QMDetObrasMARGEN_PREV: TFloatField;
     QMDetObrasTOTAL_FACTURADO: TFloatField;
     QMDetObrasTOTAL_PDTE_FACTURAR: TFloatField;
     QMDetObrasTOTAL_COSTE_ALB: TFloatField;
     QMDetObrasTOTAL_COSTE_FAB: TFloatField;
     QMDetObrasTOTAL_COSTE_ALB_PROV: TFloatField;
     QMDetObrasTOTAL_COSTE_VARIOS: TFloatField;
     QMDetObrasTOTAL_COSTES: TFloatField;
     QMDetObrasMARGEN_BENEFICIO: TFloatField;
     QMDetObrasTOTAL_COSTE_FIJO_OF: TFloatField;
     QMDetObrasTOTAL_COSTE_VARIOS_OF: TFloatField;
     QMDetObrasTOTAL_COSTE_MAQ_OF: TFloatField;
     QMDetObrasTOTAL_COSTE_TEXT_OF: TFloatField;
     QMDetObrasTOTAL_COSTE_MO_OF: TFloatField;
     QMDetObrasTOTAL_COSTE_MAT_OF: TFloatField;
     QMDetCostVar: TFIBTableSet;
     QMDetCostVarEMPRESA: TIntegerField;
     QMDetCostVarCODIGO: TIntegerField;
     QMDetCostVarLINEA: TIntegerField;
     QMDetCostVarLINEA_DET: TIntegerField;
     QMDetCostVarIMPORTE_IMPUTADO: TFloatField;
     QMDetCostVarCOMENTARIO: TFIBStringField;
     QLineaCostVar: THYFIBQuery;
     QLineaCostProv: THYFIBQuery;
     xAlbaranesProv: TFIBDataSetRO;
     DSxAlbaranesProv: TDataSource;
     xAlbaranesProvEMPRESA: TIntegerField;
     xAlbaranesProvEJERCICIO: TIntegerField;
     xAlbaranesProvCANAL: TIntegerField;
     xAlbaranesProvSERIE: TFIBStringField;
     xAlbaranesProvTIPO: TFIBStringField;
     xAlbaranesProvRIG: TIntegerField;
     xAlbaranesProvLINEA: TIntegerField;
     xAlbaranesProvALMACEN: TFIBStringField;
     xAlbaranesProvARTICULO: TFIBStringField;
     xAlbaranesProvTITULO: TFIBStringField;
     xAlbaranesProvUNIDADES: TFloatField;
     xAlbaranesProvUNIDADES_PENDIENTES: TFloatField;
     xAlbaranesProvPRECIO: TFloatField;
     xAlbaranesProvDESCUENTO: TFloatField;
     xAlbaranesProvDESCUENTO_2: TFloatField;
     xAlbaranesProvDESCUENTO_3: TFloatField;
     xAlbaranesProvP_COSTE: TFloatField;
     xAlbaranesProvPAIS: TFIBStringField;
     xAlbaranesProvTIPO_IVA: TIntegerField;
     xAlbaranesProvP_IVA: TFloatField;
     xAlbaranesProvP_RECARGO: TFloatField;
     xAlbaranesProvBRUTO: TFloatField;
     xAlbaranesProvI_DESCUENTO: TFloatField;
     xAlbaranesProvB_IMPONIBLE: TFloatField;
     xAlbaranesProvB_DTO_LINEA: TFloatField;
     xAlbaranesProvC_IVA: TFloatField;
     xAlbaranesProvC_RECARGO: TFloatField;
     xAlbaranesProvT_COSTE: TFloatField;
     xAlbaranesProvM_BRUTO: TFloatField;
     xAlbaranesProvLIQUIDO: TFloatField;
     xAlbaranesProvENTRADA: TIntegerField;
     xAlbaranesProvM_MOV_STOCK: TIntegerField;
     xAlbaranesProvUNIDADES_EXT: TFloatField;
     xAlbaranesProvNOTAS: TBlobField;
     xAlbaranesProvID_A: TIntegerField;
     xAlbaranesProvID_C_A: TIntegerField;
     xAlbaranesProvID_E: TIntegerField;
     xAlbaranesProvID_DETALLES_E: TIntegerField;
     xAlbaranesProvFECHA_PRE_DET: TDateTimeField;
     xAlbaranesProvFECHA_REC_DET: TDateTimeField;
     xAlbaranesProvSUPLIDO: TIntegerField;
     xAlbaranesProvNSERIE: TFIBStringField;
     xAlbaranesProvORDEN: TIntegerField;
     QMDetCostAlbProv: TFIBTableSet;
     QMDetCostAlbProvEMPRESA: TIntegerField;
     QMDetCostAlbProvCODIGO: TIntegerField;
     QMDetCostAlbProvLINEA: TIntegerField;
     QMDetCostAlbProvLINEA_DET: TIntegerField;
     QMDetCostAlbProvSERIE: TFIBStringField;
     QMDetCostAlbProvRIG: TIntegerField;
     QMDetCostAlbProvFECHA: TDateTimeField;
     QMDetCostAlbProvLINEA_COSTE_IMPUTADO: TIntegerField;
     QMDetCostAlbProvARTICULO: TFIBStringField;
     QMDetCostAlbProvIMPORTE_IMPUTADO: TFloatField;
     QMDetCostAlbProvID_E_ALB: TIntegerField;
     QMDetCostAlbProvID_E_DETALLES_ALB: TIntegerField;
     QMDetCostAlbProvCANAL_ALB: TIntegerField;
     QMDetCostAlbProvEJERCICIO_ALB: TIntegerField;
     xAlbaranesProvFECHA: TDateTimeField;
     QLineaIngresos: THYFIBQuery;
     QMDetIngr: TFIBTableSet;
     QMDetIngrEMPRESA: TIntegerField;
     QMDetIngrCODIGO: TIntegerField;
     QMDetIngrLINEA: TIntegerField;
     QMDetIngrLINEA_DET: TIntegerField;
     QMDetIngrSERIE: TFIBStringField;
     QMDetIngrRIG: TIntegerField;
     QMDetIngrFECHA: TDateTimeField;
     QMDetIngrIMPORTE_FAC: TFloatField;
     QMDetIngrCANAL_FAC: TIntegerField;
     QMDetIngrID_S_FAC: TIntegerField;
     QMDetIngrEJERCICIO_FAC: TIntegerField;
     xFacturasCli: TFIBDataSetRO;
     DSxFacturasCli: TDataSource;
     xFacturasCliEMPRESA: TIntegerField;
     xFacturasCliEJERCICIO: TIntegerField;
     xFacturasCliCANAL: TIntegerField;
     xFacturasCliSERIE: TFIBStringField;
     xFacturasCliTIPO: TFIBStringField;
     xFacturasCliRIG: TIntegerField;
     xFacturasCliALMACEN: TFIBStringField;
     xFacturasCliMONEDA: TFIBStringField;
     xFacturasCliFECHA: TDateTimeField;
     xFacturasCliTERCERO: TIntegerField;
     xFacturasCliTITULO: TFIBStringField;
     xFacturasCliDIRECCION: TIntegerField;
     xFacturasCliCLIENTE: TIntegerField;
     xFacturasCliSU_REFERENCIA: TFIBStringField;
     xFacturasCliFORMA_PAGO: TFIBStringField;
     xFacturasCliCAMPANYA: TIntegerField;
     xFacturasCliNOTAS: TBlobField;
     xFacturasCliESTADO: TIntegerField;
     xFacturasCliBULTOS: TIntegerField;
     xFacturasCliLINEAS: TIntegerField;
     xFacturasCliBRUTO: TFloatField;
     xFacturasCliI_DTO_LINEAS: TFloatField;
     xFacturasCliS_BASES: TFloatField;
     xFacturasCliM_BRUTO: TFloatField;
     xFacturasCliC_TOTAL: TFloatField;
     xFacturasCliAGENTE: TIntegerField;
     xFacturasCliS_CUOTA_IVA: TFloatField;
     xFacturasCliS_CUOTA_RE: TFloatField;
     xFacturasCliB_DTO_LINEAS: TFloatField;
     xFacturasCliDTO_PP: TFloatField;
     xFacturasCliDTO_CIAL: TFloatField;
     xFacturasCliI_DTO_CIAL: TFloatField;
     xFacturasCliI_DTO_PP: TFloatField;
     xFacturasCliB_COMISION: TFloatField;
     xFacturasCliI_COMISION: TFloatField;
     xFacturasCliPOR_FINANCIACION: TFloatField;
     xFacturasCliI_FINANCIACION: TFloatField;
     xFacturasCliLIQUIDO: TFloatField;
     xFacturasCliENTRADA: TIntegerField;
     xFacturasCliTRANSPORTISTA: TIntegerField;
     xFacturasCliI_BASE_RETENCION: TFloatField;
     xFacturasCliP_RETENCION: TFloatField;
     xFacturasCliI_RETENCION: TFloatField;
     xFacturasCliFUERZA_VENCIMIENTOS: TIntegerField;
     xFacturasCliRIC: TIntegerField;
     xFacturasCliTIPO_IRPF: TIntegerField;
     xFacturasCliA_IRPF: TIntegerField;
     xFacturasCliTOTAL_A_COBRAR: TFloatField;
     xFacturasCliDEVOLUCION: TIntegerField;
     xFacturasCliSIN_DETALLE: TIntegerField;
     xFacturasCliASIENTO: TIntegerField;
     xFacturasCliNOMBRE_COMERCIAL: TFIBStringField;
     xFacturasCliREGISTRO: TIntegerField;
     xFacturasCliPORTES: TIntegerField;
     xFacturasCliI_FINANCIACION_CANAL: TFloatField;
     xFacturasCliTARIFA: TFIBStringField;
     xFacturasCliID_S: TIntegerField;
     xFacturasCliPROCESO_AUTO: TIntegerField;
     xFacturasCliFECHA_ENTREGA: TDateTimeField;
     xFacturasCliIDIOMA: TFIBStringField;
     xFacturasCliRECT: TIntegerField;
     xFacturasCliID_RECT: TIntegerField;
     xFacturasCliTIPO_PORTES: TIntegerField;
     xFacturasCliPOR_PORTES: TFloatField;
     xFacturasCliI_PORTES: TFloatField;
     xFacturasCliI_PORTES_CANAL: TFloatField;
     xFacturasCliRANGO: TIntegerField;
     xFacturasCliINDICE: TIntegerField;
     xFacturasCliCAMBIO_FIJO: TIntegerField;
     xFacturasCliVALOR_CAMB_FIJO: TFloatField;
     QMCabObrasMARGEN_BENEFICIO_PREV_100: TFloatField;
     frLstObras: TfrHYReport;
     frDBLstObras: TfrDBDataSet;
     xLstObras: TFIBDataSetRO;
     DSxLstObras: TDataSource;
     frDBLstDetObras: TfrDBDataSet;
     xLstDetObras: TFIBDataSetRO;
     DSxLstDetObras: TDataSource;
     frDBLstDetCostesAlbCli: TfrDBDataSet;
     xLstDetCostesAlbCli: TFIBDataSetRO;
     DSxLstDetCostesAlbCli: TDataSource;
     frDBLstDetCostesAlbProv: TfrDBDataSet;
     xLstDetCostesAlbProv: TFIBDataSetRO;
     DSxLstDetCostesAlbProv: TDataSource;
     frDBLstDetCostesProd: TfrDBDataSet;
     xLstDetCostesProd: TFIBDataSetRO;
     DSXLstDetCostesProd: TDataSource;
     frDBLstDetCostesVar: TfrDBDataSet;
     xLstDetCostesVar: TFIBDataSetRO;
     DSxLstDetCostesVar: TDataSource;
     frDBLstDetCostesIngr: TfrDBDataSet;
     xLstDetCostesIngr: TFIBDataSetRO;
     DSLstDetCostesOngr: TDataSource;
     QMDetObrasPARTIDA: TFIBStringField;
     xPartida: TFIBDataSetRO;
     DSxPartida: TDataSource;
     xPartidaDESCRIPCION: TFIBStringField;
     QMDetCostVarFECHA: TDateTimeField;
     xAlbaranesCliDet: TFIBDataSetRO;
     DSxAlbaranesCliDet: TDataSource;
     xAlbaranesCliDetT_COSTE: TFloatField;
     QMDetCostAlbProvDESCRIPCION: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabObrasAfterOpen(DataSet: TDataSet);
     procedure QMCabObrasNewRecord(DataSet: TDataSet);
     procedure QMCabObrasBeforePost(DataSet: TDataSet);
     procedure QMCabObrasAfterPost(DataSet: TDataSet);
     procedure QMCabObrasCLIENTEChange(Sender: TField);
     procedure QMImagenObrasNewRecord(DataSet: TDataSet);
     procedure QMImagenObrasAfterScroll(DataSet: TDataSet);
     procedure QMCabObrasAfterScroll(DataSet: TDataSet);
     procedure GrabaImagen(DataSet: TDataSet);
     procedure QMImagenObrasID_IMAGENChange(Sender: TField);
     procedure QMImagenObrasNombreGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetObrasNewRecord(DataSet: TDataSet);
     procedure QMDetObrasAfterOpen(DataSet: TDataSet);
     procedure QMDetCostAlbCliNewRecord(DataSet: TDataSet);
     procedure QMDetCostAlbCliRIGChange(Sender: TField);
     procedure QMDetCostAlbCliAfterPost(DataSet: TDataSet);
     procedure QMDetCostProdNewRecord(DataSet: TDataSet);
     procedure QMDetCostProdRIGChange(Sender: TField);
     procedure QMDetCostVarNewRecord(DataSet: TDataSet);
     procedure QMDetCostAlbProvNewRecord(DataSet: TDataSet);
     procedure QMDetCostAlbProvLINEA_COSTE_IMPUTADOChange(Sender: TField);
     procedure QMDetIngrNewRecord(DataSet: TDataSet);
     procedure QMDetIngrRIGChange(Sender: TField);
     procedure xLstObrasAfterOpen(DataSet: TDataSet);
     procedure xLstDetObrasAfterOpen(DataSet: TDataSet);
     procedure frLstObrasGetValue(const ParName: string; var ParValue: variant);
     procedure QMDetObrasPARTIDAChange(Sender: TField);
     procedure xLstDetCostesVarAfterOpen(DataSet: TDataSet);
     procedure xLstDetObrasBeforeClose(DataSet: TDataSet);
     procedure xLstObrasBeforeClose(DataSet: TDataSet);
     procedure QMDetObrasBeforeClose(DataSet: TDataSet);
     procedure QMCabObrasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ObrDMObras : TObrDMObras;

implementation

uses UDMMain, UEntorno, UObrFMObras, UDMListados, UFBusca, UDameDato, UImagenes;

{$R *.dfm}

procedure TObrDMObras.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCabObras, '10000');
end;

procedure TObrDMObras.QMCabObrasAfterOpen(DataSet: TDataSet);
begin
  QMDetObras.Open;
  QMImagenObras.Open;
end;

procedure TObrDMObras.QMCabObrasBeforeClose(DataSet: TDataSet);
begin
  QMDetObras.Close;
  QMImagenObras.Close;
end;

procedure TObrDMObras.QMCabObrasNewRecord(DataSet: TDataSet);
begin
  QMCabObrasEMPRESA.AsInteger := REntorno.Empresa;
  QMCabObrasCONTROL_ALMACEN.AsInteger := 0;
  QMCabObrasALMACEN.AsString := REntorno.AlmacenDefecto;
  QMCabObrasENTRADA.AsInteger := REntorno.Entrada;
  QMCabObrasFECHA_INICIO.AsDateTime := Date;
  ObrFMObras.DBCBControlPartidas.Enabled := True;
end;

procedure TObrDMObras.QMCabObrasBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMCabObrasCODIGO.AsInteger := DMMain.Contador_E('OBR');
end;

procedure TObrDMObras.QMCabObrasAfterPost(DataSet: TDataSet);
begin
  ObrFMObras.DBCBControlPartidas.Enabled := False;
end;

procedure TObrDMObras.QMCabObrasCLIENTEChange(Sender: TField);
begin
  // Asignamos el tercero a la Factura
  xClientes.Open;
  QMCabObrasTERCERO.AsInteger := xClientesTERCERO.AsInteger;
  xClientes.Close;
end;

procedure TObrDMObras.QMImagenObrasNewRecord(DataSet: TDataSet);
begin
  QMImagenObrasEMPRESA.AsInteger := REntorno.Empresa;
  QMImagenObrasCODIGO.AsInteger := QMCabObrasCODIGO.AsInteger;
end;

procedure TObrDMObras.QMImagenObrasAfterScroll(DataSet: TDataSet);
begin
  RefrescarImagen(ObrFMObras.Imagen, QMImagenObrasID_IMAGEN.AsInteger);
end;

procedure TObrDMObras.QMCabObrasAfterScroll(DataSet: TDataSet);
begin
  // Borro la imatge en pantalla
  ObrFMObras.Imagen.Picture.Bitmap := nil;
  if (QMImagenObras.RecordCount <> 0) then
  begin
     QMImagenObras.First;
     RefrescarImagen(ObrFMObras.Imagen, QMImagenObrasID_IMAGEN.AsInteger);
  end;

  {
  if (QMCabObrasCONTROL_ALMACEN.AsInteger = 1) then
     ObrFMObras.LFDBAlmacen.Enabled := True
  else
     ObrFMObras.LFDBAlmacen.Enabled := False;
  }
end;

procedure TObrDMObras.GrabaImagen(DataSet: TDataSet);
begin
  RefrescarImagen(ObrFMObras.Imagen, QMImagenObrasID_IMAGEN.AsInteger);
end;

procedure TObrDMObras.QMImagenObrasID_IMAGENChange(Sender: TField);
begin
  QMImagenObrasNombre.Text := DameTituloImagen(QMImagenObrasID_IMAGEN.AsInteger);
end;

procedure TObrDMObras.QMImagenObrasNombreGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloImagen(QMImagenObrasID_IMAGEN.AsInteger);
end;

procedure TObrDMObras.QMDetObrasNewRecord(DataSet: TDataSet);
begin
  QMDetObrasEMPRESA.AsInteger := REntorno.Empresa;
  QMDetObrasCODIGO.AsInteger := QMCabObrasCODIGO.AsInteger;

  // Núm. Línea
  QLineaDetObras.Close;
  QLineaDetObras.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QLineaDetObras.Params.ByName['Codigo'].AsInteger := QMCabObrasCODIGO.AsInteger;
  QLineaDetObras.ExecQuery;
  QMDetObrasLINEA.AsInteger := QLineaDetObras.FieldByName['NLinea'].AsInteger + 1;
  QMDetObrasORDEN.AsInteger := QLineaDetObras.FieldByName['NLinea'].AsInteger + 1;
end;

procedure TObrDMObras.QMDetObrasAfterOpen(DataSet: TDataSet);
begin
  QMDetCostAlbCli.Open;
  QMDetCostProd.Open;
  QMDetCostVar.Open;
  QMDetIngr.Open;
  QMDetCostAlbProv.Open;
end;

procedure TObrDMObras.QMDetObrasBeforeClose(DataSet: TDataSet);
begin
  QMDetCostAlbCli.Close;
  QMDetCostProd.Close;
  QMDetCostVar.Close;
  QMDetIngr.Close;
  QMDetCostAlbProv.Close;
end;

procedure TObrDMObras.QMDetCostAlbCliNewRecord(DataSet: TDataSet);
begin
  // PK
  QMDetCostAlbCliEMPRESA.AsInteger := REntorno.Empresa;
  QMDetCostAlbCliCODIGO.AsInteger := QMDetObrasCODIGO.AsInteger;
  QMDetCostAlbCliLINEA.AsInteger := QMDetObrasLINEA.AsInteger;

  QMDetCostAlbCliEJERCICIO_ALB.AsInteger := REntorno.Ejercicio;
  QMDetCostAlbCliCANAL_ALB.AsInteger := REntorno.Canal;

  // Núm. Línea
  QLineaCostAlbCli.Close;
  QLineaCostAlbCli.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QLineaCostAlbCli.Params.ByName['Codigo'].AsInteger := QMDetObrasCODIGO.AsInteger;
  QLineaCostAlbCli.Params.ByName['Linea'].AsInteger := QMDetObrasLINEA.AsInteger;
  QLineaCostAlbCli.ExecQuery;
  QMDetCostAlbCliLINEA_DET.AsInteger := QLineaCostAlbCli.FieldByName['NLineaDet'].AsInteger + 1;
end;

procedure TObrDMObras.QMDetCostAlbCliRIGChange(Sender: TField);
begin
  xAlbaranesCli.Close;
  xAlbaranesCli.Open;
  xAlbaranesCliDet.Close;
  xAlbaranesCliDet.Open;

  QMDetCostAlbCliFECHA.AsDateTime := xAlbaranesCliFECHA.AsDateTime;
  QMDetCostAlbCliID_S_ALB.AsInteger := xAlbaranesCliID_S.AsInteger;
  // QMDetCostAlbCliIMPORTE_IMPUTADO.AsFloat := xAlbaranesCliS_BASES.AsFloat;
  QMDetCostAlbCliIMPORTE_IMPUTADO.AsFloat := xAlbaranesCliDetT_COSTE.AsFloat;
end;

procedure TObrDMObras.QMDetCostAlbCliAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TObrDMObras.QMDetCostProdNewRecord(DataSet: TDataSet);
begin
  // PK
  QMDetCostProdEMPRESA.AsInteger := REntorno.Empresa;
  QMDetCostProdCODIGO.AsInteger := QMDetObrasCODIGO.AsInteger;
  QMDetCostProdLINEA.AsInteger := QMDetObrasLINEA.AsInteger;

  QMDetCostProdEJERCICIO_OF.AsInteger := REntorno.Ejercicio;
  QMDetCostProdCANAL_OF.AsInteger := REntorno.Canal;
  QMDetCostProdSERIE_OF.AsString := REntorno.Serie;

  // Núm. Línea
  QLineaCostProd.Close;
  QLineaCostProd.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QLineaCostProd.Params.ByName['Codigo'].AsInteger := QMDetObrasCODIGO.AsInteger;
  QLineaCostProd.Params.ByName['Linea'].AsInteger := QMDetObrasLINEA.AsInteger;
  QLineaCostProd.ExecQuery;
  QMDetCostProdLINEA_DET.AsInteger := QLineaCostProd.FieldByName['NLineaDet'].AsInteger + 1;
end;

procedure TObrDMObras.QMDetCostProdRIGChange(Sender: TField);
begin
  xOrdenesFab.Close;
  xOrdenesFab.Open;

  QMDetCostProdID_ORDEN.AsInteger := xOrdenesFabID_ORDEN.AsInteger;
  QMDetCostProdFECHA.AsDateTime := xOrdenesFabFECHA_ORD.AsDateTime;
  QMDetCostProdIMPORTE_MAT_IMPUTADO.AsFloat := xOrdenesFabCOSTE_MAT_REAL.AsFloat;
  QMDetCostProdIMPORTE_MO_IMPUTADO.AsFloat := xOrdenesFabCOSTE_MO_REAL.AsFloat;
  QMDetCostProdIMPORTE_FIJO_IMPUTADO.AsFloat := xOrdenesFabCOSTE_FIJO_REAL.AsFloat;
  QMDetCostProdIMPORTE_VARIOS_IMPUTADO.AsFloat := xOrdenesFabCOSTE_VAR_REAL.AsFloat;
  QMDetCostProdIMPORTE_MAQ_IMPUTADO.AsFloat := xOrdenesFabCOSTE_MAQ_REAL.AsFloat;
  QMDetCostProdIMPORTE_TEXT_IMPUTADO.AsFloat := xOrdenesFabCOSTE_TEX_REAL.AsFloat;
end;

procedure TObrDMObras.QMDetCostVarNewRecord(DataSet: TDataSet);
begin
  // PK
  QMDetCostVarEMPRESA.AsInteger := REntorno.Empresa;
  QMDetCostVarCODIGO.AsInteger := QMDetObrasCODIGO.AsInteger;
  QMDetCostVarLINEA.AsInteger := QMDetObrasLINEA.AsInteger;

  QMDetCostVarFECHA.AsDateTime := Date;

  // Núm. Línea
  QLineaCostVar.Close;
  QLineaCostVar.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QLineaCostVar.Params.ByName['Codigo'].AsInteger := QMDetObrasCODIGO.AsInteger;
  QLineaCostVar.Params.ByName['Linea'].AsInteger := QMDetObrasLINEA.AsInteger;
  QLineaCostVar.ExecQuery;
  QMDetCostVarLINEA_DET.AsInteger := QLineaCostVar.FieldByName['NLineaDet'].AsInteger + 1;
end;

procedure TObrDMObras.QMDetCostAlbProvNewRecord(DataSet: TDataSet);
begin
  // PK
  QMDetCostAlbProvEMPRESA.AsInteger := REntorno.Empresa;
  QMDetCostAlbProvCODIGO.AsInteger := QMDetObrasCODIGO.AsInteger;
  QMDetCostAlbProvLINEA.AsInteger := QMDetObrasLINEA.AsInteger;

  QMDetCostAlbProvEJERCICIO_ALB.AsInteger := REntorno.Ejercicio;
  QMDetCostAlbProvCANAL_ALB.AsInteger := REntorno.Canal;

  // Núm. Línea
  QLineaCostProv.Close;
  QLineaCostProv.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QLineaCostProv.Params.ByName['Codigo'].AsInteger := QMDetObrasCODIGO.AsInteger;
  QLineaCostProv.Params.ByName['Linea'].AsInteger := QMDetObrasLINEA.AsInteger;
  QLineaCostProv.ExecQuery;
  QMDetCostAlbProvLINEA_DET.AsInteger := QLineaCostProv.FieldByName['NLineaDet'].AsInteger + 1;
end;

procedure TObrDMObras.QMDetCostAlbProvLINEA_COSTE_IMPUTADOChange(Sender: TField);
begin
  xAlbaranesProv.Close;
  xAlbaranesProv.Open;

  QMDetCostAlbProvFECHA.AsDateTime := xAlbaranesProvFECHA.AsDateTime;
  QMDetCostAlbProvID_E_DETALLES_ALB.AsInteger := xAlbaranesProvID_DETALLES_E.AsInteger;
  QMDetCostAlbProvID_E_ALB.AsInteger := xAlbaranesProvID_E.AsInteger;
  QMDetCostAlbProvIMPORTE_IMPUTADO.AsFloat := xAlbaranesProvBRUTO.AsFloat;
  QMDetCostAlbProvARTICULO.AsString := xAlbaranesProvARTICULO.AsString;
  QMDetCostAlbProvDESCRIPCION.AsString := xAlbaranesProvTITULO.AsString;
end;

procedure TObrDMObras.QMDetIngrNewRecord(DataSet: TDataSet);
begin
  // PK
  QMDetIngrEMPRESA.AsInteger := REntorno.Empresa;
  QMDetIngrCODIGO.AsInteger := QMDetObrasCODIGO.AsInteger;
  QMDetIngrLINEA.AsInteger := QMDetObrasLINEA.AsInteger;

  QMDetIngrEJERCICIO_FAC.AsInteger := REntorno.Ejercicio;
  QMDetIngrCANAL_FAC.AsInteger := REntorno.Canal;

  // Núm. Línea
  QLineaIngresos.Close;
  QLineaIngresos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QLineaIngresos.Params.ByName['Codigo'].AsInteger := QMDetObrasCODIGO.AsInteger;
  QLineaIngresos.Params.ByName['Linea'].AsInteger := QMDetObrasLINEA.AsInteger;
  QLineaIngresos.ExecQuery;
  QMDetIngrLINEA_DET.AsInteger := QLineaIngresos.FieldByName['NLineaDet'].AsInteger + 1;
end;

procedure TObrDMObras.QMDetIngrRIGChange(Sender: TField);
begin
  xFacturasCli.Close;
  xFacturasCli.Open;

  QMDetIngrFECHA.AsDateTime := xFacturasCliFECHA.AsDateTime;
  QMDetIngrID_S_FAC.AsInteger := xFacturasCliID_S.AsInteger;
  QMDetIngrIMPORTE_FAC.AsFloat := xFacturasCliBRUTO.AsFloat;
end;

procedure TObrDMObras.xLstObrasAfterOpen(DataSet: TDataSet);
begin
  xLstDetObras.Open;
end;

procedure TObrDMObras.xLstObrasBeforeClose(DataSet: TDataSet);
begin
  xLstDetObras.Close;
end;

procedure TObrDMObras.xLstDetObrasAfterOpen(DataSet: TDataSet);
begin
  xLstDetCostesAlbCli.Open;
  xLstDetCostesAlbProv.Open;
  xLstDetCostesProd.Open;
  xLstDetCostesVar.Open;
end;

procedure TObrDMObras.xLstDetObrasBeforeClose(DataSet: TDataSet);
begin
  xLstDetCostesAlbCli.Close;
  xLstDetCostesAlbProv.Close;
  xLstDetCostesProd.Close;
  xLstDetCostesVar.Close;
end;

procedure TObrDMObras.frLstObrasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TObrDMObras.QMDetObrasPARTIDAChange(Sender: TField);
begin
  // Asignamos el tercero a la Factura
  xPartida.Open;
  if (QMDetObras.State in [dsInsert]) then
     QMDetObrasDESCRIPCION.AsString := xPartidaDESCRIPCION.AsString;
  xPartida.Close;
end;

procedure TObrDMObras.xLstDetCostesVarAfterOpen(DataSet: TDataSet);
begin
  xLstDetCostesIngr.Close;
  xLstDetCostesIngr.Open;
end;

procedure TObrDMObras.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabObras, '10000');
end;

end.
