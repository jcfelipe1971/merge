unit UDMCondicionesVenta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, Controls, Dialogs, FIBDataSetRO,
  FIBTableDataSetRO;

type
  TDMCondicionesVenta = class(TDataModule)
     TLocal: THYTransaction;
     DSQMCondCli: TDataSource;
     QMCondCliArt: TFIBTableSet;
     DSQMCondCliArt: TDataSource;
     DSQMCondCliFam: TDataSource;
     QMCondArt: TFIBTableSet;
     DSQMCondArt: TDataSource;
     QMCondFam: TFIBTableSet;
     DSQMCondFam: TDataSource;
     QMCondPer: TFIBTableSet;
     DSQMCondPer: TDataSource;
     QMCli: TFIBTableSetRO;
     QMCliEMPRESA: TIntegerField;
     QMCliEJERCICIO: TIntegerField;
     QMCliCANAL: TIntegerField;
     QMCliCLIENTE: TIntegerField;
     QMCliTERCERO: TIntegerField;
     QMCliTARIFA: TFIBStringField;
     QMCliFORMA_PAGO: TFIBStringField;
     QMCliRIESGO_AUT: TFloatField;
     QMCliRIESGO_ACT: TFloatField;
     QMCliMODO_IVA: TIntegerField;
     QMCliDIA_PAGO_1: TIntegerField;
     QMCliDIA_PAGO_2: TIntegerField;
     QMCliDESCUENTO_PP: TFloatField;
     QMCliDESCUENTO_CIAL: TFloatField;
     QMCliAGENTE: TIntegerField;
     QMCliNOTAS: TBlobField;
     QMCliCUENTA: TFIBStringField;
     QMCliTITULO: TFIBStringField;
     QMCliPERFIL: TFIBStringField;
     QMCliTIPO_IRPF: TIntegerField;
     QMCliPAIS: TFIBStringField;
     QMCliTIPO: TIntegerField;
     QMCliPORTES: TIntegerField;
     QMCliNOMBRE_COMERCIAL: TFIBStringField;
     QMCliUSAR_ANTICIPOS: TIntegerField;
     QMCliSU_PROVEEDOR: TFIBStringField;
     QMCliEVAL_FEB: TIntegerField;
     QMCliEVAL_FEB_SI: TIntegerField;
     QMCliMONEDA: TFIBStringField;
     QMCliFINANCIACION: TIntegerField;
     QMCliFACTURAR_AGENTE: TIntegerField;
     QMCliFACTURAR_TRANSPORTISTA: TIntegerField;
     QMCliFACTURAR_REFERENCIA: TIntegerField;
     QMCliFACTURAR_DIRECCION: TIntegerField;
     QMCliFACTURAR_SERIE: TIntegerField;
     QMCliSERIE_A_FACTURAR: TFIBStringField;
     QMCliFACTURAR_ALMACEN: TIntegerField;
     QMCliTRANSPORTISTA: TIntegerField;
     QMCliFACTURA_DIRECCION_ADMTVA: TIntegerField;
     QMCliALBARAN_DIRECCION_ENVIO: TIntegerField;
     QMCliPOR_FINANCIACION: TFloatField;
     QMCliNO_ALB_FAC: TIntegerField;
     QMCliNO_VENTA_RIESGO: TIntegerField;
     QMCliSU_REFERENCIA: TFIBStringField;
     QMCliRIESGO_FAC: TFloatField;
     QMCliRIESGO_ALB: TFloatField;
     QMCliRIESGO_CAR: TFloatField;
     QMCliRIESGO_REM: TFloatField;
     QMCliINTRA: TIntegerField;
     QMCliINTRA_TRANS: TIntegerField;
     QMCliFACTURAR_TARIFA: TIntegerField;
     QMCliPAIS_C2: TFIBStringField;
     QMPer: TFIBTableSetRO;
     DSPer: TDataSource;
     QMPerPERFIL: TFIBStringField;
     QMPerTITULO: TFIBStringField;
     QMCondPerArt: TFIBTableSet;
     DSCondPerArt: TDataSource;
     QMCondPerFam: TFIBTableSet;
     DSCondPerFam: TDataSource;
     DSAgr: TDataSource;
     QMAgr: TFIBTableSetRO;
     QMAgrAGRUPACION: TFIBStringField;
     QMAgrTITULO: TFIBStringField;
     QMAgrTIPO: TFIBStringField;
     QMAgrNOTAS: TBlobField;
     QMCondAgr: TFIBTableSet;
     DSCondAgr: TDataSource;
     QMCondAgrArt: TFIBTableSet;
     DSCondAgrArt: TDataSource;
     QMCondAgrFam: TFIBTableSet;
     DSCondAgrFam: TDataSource;
     QMCondAgrArtEMPRESA: TIntegerField;
     QMCondAgrArtEJERCICIO: TIntegerField;
     QMCondAgrArtCANAL: TIntegerField;
     QMCondAgrArtTIPO: TFIBStringField;
     QMCondAgrArtRIG: TIntegerField;
     QMCondAgrArtAGRUPACION: TFIBStringField;
     QMCondAgrArtTITULO_AGRUPACION: TFIBStringField;
     QMCondAgrArtARTICULO: TFIBStringField;
     QMCondAgrArtTITULO_ARTICULO: TFIBStringField;
     QMCondAgrArtALTA: TDateTimeField;
     QMCondAgrArtBAJA: TDateTimeField;
     QMCondAgrArtACTIVO: TIntegerField;
     QMCondAgrArtDESDE: TFloatField;
     QMCondAgrArtHASTA: TFloatField;
     QMCondAgrArtPRECIO: TFloatField;
     QMCondAgrArtDTO1: TFloatField;
     QMCondAgrArtDTO2: TFloatField;
     QMCondAgrArtDTO3: TFloatField;
     QMCondAgrArtLINEA: TIntegerField;
     QMCondAgrFamEMPRESA: TIntegerField;
     QMCondAgrFamEJERCICIO: TIntegerField;
     QMCondAgrFamCANAL: TIntegerField;
     QMCondAgrFamTIPO: TFIBStringField;
     QMCondAgrFamRIG: TIntegerField;
     QMCondAgrFamAGRUPACION: TFIBStringField;
     QMCondAgrFamTITULO_AGRUPACION: TFIBStringField;
     QMCondAgrFamFAMILIA: TFIBStringField;
     QMCondAgrFamTITULO_FAMILIA: TFIBStringField;
     QMCondAgrFamALTA: TDateTimeField;
     QMCondAgrFamBAJA: TDateTimeField;
     QMCondAgrFamACTIVO: TIntegerField;
     QMCondAgrFamDESDE: TFloatField;
     QMCondAgrFamHASTA: TFloatField;
     QMCondAgrFamPRECIO: TFloatField;
     QMCondAgrFamDTO1: TFloatField;
     QMCondAgrFamDTO2: TFloatField;
     QMCondAgrFamDTO3: TFloatField;
     QMCondAgrFamLINEA: TIntegerField;
     QMCondAgrEMPRESA: TIntegerField;
     QMCondAgrEJERCICIO: TIntegerField;
     QMCondAgrCANAL: TIntegerField;
     QMCondAgrTIPO: TFIBStringField;
     QMCondAgrRIG: TIntegerField;
     QMCondAgrAGRUPACION: TFIBStringField;
     QMCondAgrTITULO_AGRUPACION: TFIBStringField;
     QMCondAgrALTA: TDateTimeField;
     QMCondAgrBAJA: TDateTimeField;
     QMCondAgrACTIVO: TIntegerField;
     QMCondAgrDESDE: TFloatField;
     QMCondAgrHASTA: TFloatField;
     QMCondAgrPRECIO: TFloatField;
     QMCondAgrDTO1: TFloatField;
     QMCondAgrDTO2: TFloatField;
     QMCondAgrDTO3: TFloatField;
     QMCondAgrLINEA: TIntegerField;
     QMCondPerEMPRESA: TIntegerField;
     QMCondPerEJERCICIO: TIntegerField;
     QMCondPerCANAL: TIntegerField;
     QMCondPerTIPO: TFIBStringField;
     QMCondPerRIG: TIntegerField;
     QMCondPerPERFIL: TFIBStringField;
     QMCondPerTITULO_PERFIL: TFIBStringField;
     QMCondPerARTICULO: TFIBStringField;
     QMCondPerTITULO_ARTICULO: TFIBStringField;
     QMCondPerFAMILIA: TFIBStringField;
     QMCondPerTITULO_FAMILIA: TFIBStringField;
     QMCondPerALTA: TDateTimeField;
     QMCondPerBAJA: TDateTimeField;
     QMCondPerACTIVO: TIntegerField;
     QMCondPerDESDE: TFloatField;
     QMCondPerHASTA: TFloatField;
     QMCondPerPRECIO: TFloatField;
     QMCondPerDTO1: TFloatField;
     QMCondPerDTO2: TFloatField;
     QMCondPerDTO3: TFloatField;
     QMCondPerLINEA: TIntegerField;
     QMCondCliFam: TFIBTableSet;
     QMCondCliArtEMPRESA: TIntegerField;
     QMCondCliArtEJERCICIO: TIntegerField;
     QMCondCliArtCANAL: TIntegerField;
     QMCondCliArtTIPO: TFIBStringField;
     QMCondCliArtRIG: TIntegerField;
     QMCondCliArtCLIENTE: TIntegerField;
     QMCondCliArtTITULO_CLIENTE: TFIBStringField;
     QMCondCliArtARTICULO: TFIBStringField;
     QMCondCliArtTITULO_ARTICULO: TFIBStringField;
     QMCondCliArtALTA: TDateTimeField;
     QMCondCliArtBAJA: TDateTimeField;
     QMCondCliArtACTIVO: TIntegerField;
     QMCondCliArtDESDE: TFloatField;
     QMCondCliArtHASTA: TFloatField;
     QMCondCliArtPRECIO: TFloatField;
     QMCondCliArtDTO1: TFloatField;
     QMCondCliArtDTO2: TFloatField;
     QMCondCliArtDTO3: TFloatField;
     QMCondCliArtLINEA: TIntegerField;
     QMCondCliFamEMPRESA: TIntegerField;
     QMCondCliFamEJERCICIO: TIntegerField;
     QMCondCliFamCANAL: TIntegerField;
     QMCondCliFamTIPO: TFIBStringField;
     QMCondCliFamRIG: TIntegerField;
     QMCondCliFamCLIENTE: TIntegerField;
     QMCondCliFamTITULO_CLIENTE: TFIBStringField;
     QMCondCliFamFAMILIA: TFIBStringField;
     QMCondCliFamTITULO_FAMILIA: TFIBStringField;
     QMCondCliFamALTA: TDateTimeField;
     QMCondCliFamBAJA: TDateTimeField;
     QMCondCliFamACTIVO: TIntegerField;
     QMCondCliFamDESDE: TFloatField;
     QMCondCliFamHASTA: TFloatField;
     QMCondCliFamPRECIO: TFloatField;
     QMCondCliFamDTO1: TFloatField;
     QMCondCliFamDTO2: TFloatField;
     QMCondCliFamDTO3: TFloatField;
     QMCondCliFamLINEA: TIntegerField;
     QMCondArtEMPRESA: TIntegerField;
     QMCondArtEJERCICIO: TIntegerField;
     QMCondArtCANAL: TIntegerField;
     QMCondArtTIPO: TFIBStringField;
     QMCondArtRIG: TIntegerField;
     QMCondArtCLIENTE: TIntegerField;
     QMCondArtTITULO_CLIENTE: TFIBStringField;
     QMCondArtARTICULO: TFIBStringField;
     QMCondArtTITULO_ARTICULO: TFIBStringField;
     QMCondArtALTA: TDateTimeField;
     QMCondArtBAJA: TDateTimeField;
     QMCondArtACTIVO: TIntegerField;
     QMCondArtDESDE: TFloatField;
     QMCondArtHASTA: TFloatField;
     QMCondArtPRECIO: TFloatField;
     QMCondArtDTO1: TFloatField;
     QMCondArtDTO2: TFloatField;
     QMCondArtDTO3: TFloatField;
     QMCondArtLINEA: TIntegerField;
     QMCondFamEMPRESA: TIntegerField;
     QMCondFamEJERCICIO: TIntegerField;
     QMCondFamCANAL: TIntegerField;
     QMCondFamTIPO: TFIBStringField;
     QMCondFamRIG: TIntegerField;
     QMCondFamCLIENTE: TIntegerField;
     QMCondFamTITULO_CLIENTE: TFIBStringField;
     QMCondFamFAMILIA: TFIBStringField;
     QMCondFamTITULO_FAMILIA: TFIBStringField;
     QMCondFamALTA: TDateTimeField;
     QMCondFamBAJA: TDateTimeField;
     QMCondFamACTIVO: TIntegerField;
     QMCondFamDESDE: TFloatField;
     QMCondFamHASTA: TFloatField;
     QMCondFamPRECIO: TFloatField;
     QMCondFamDTO1: TFloatField;
     QMCondFamDTO2: TFloatField;
     QMCondFamDTO3: TFloatField;
     QMCondFamLINEA: TIntegerField;
     QMCondPerFamEMPRESA: TIntegerField;
     QMCondPerFamEJERCICIO: TIntegerField;
     QMCondPerFamCANAL: TIntegerField;
     QMCondPerFamTIPO: TFIBStringField;
     QMCondPerFamRIG: TIntegerField;
     QMCondPerFamPERFIL: TFIBStringField;
     QMCondPerFamTITULO_PERFIL: TFIBStringField;
     QMCondPerFamFAMILIA: TFIBStringField;
     QMCondPerFamTITULO_FAMILIA: TFIBStringField;
     QMCondPerFamALTA: TDateTimeField;
     QMCondPerFamBAJA: TDateTimeField;
     QMCondPerFamACTIVO: TIntegerField;
     QMCondPerFamDESDE: TFloatField;
     QMCondPerFamHASTA: TFloatField;
     QMCondPerFamPRECIO: TFloatField;
     QMCondPerFamDTO1: TFloatField;
     QMCondPerFamDTO2: TFloatField;
     QMCondPerFamDTO3: TFloatField;
     QMCondPerFamLINEA: TIntegerField;
     QMCondPerArtEMPRESA: TIntegerField;
     QMCondPerArtEJERCICIO: TIntegerField;
     QMCondPerArtCANAL: TIntegerField;
     QMCondPerArtTIPO: TFIBStringField;
     QMCondPerArtRIG: TIntegerField;
     QMCondPerArtPERFIL: TFIBStringField;
     QMCondPerArtTITULO_PERFIL: TFIBStringField;
     QMCondPerArtARTICULO: TFIBStringField;
     QMCondPerArtTITULO_ARTICULO: TFIBStringField;
     QMCondPerArtALTA: TDateTimeField;
     QMCondPerArtBAJA: TDateTimeField;
     QMCondPerArtACTIVO: TIntegerField;
     QMCondPerArtDESDE: TFloatField;
     QMCondPerArtHASTA: TFloatField;
     QMCondPerArtPRECIO: TFloatField;
     QMCondPerArtDTO1: TFloatField;
     QMCondPerArtDTO2: TFloatField;
     QMCondPerArtDTO3: TFloatField;
     QMCondPerArtLINEA: TIntegerField;
     TUpdate: THYTransaction;
     QMCondCliArtTRASPASAR: TIntegerField;
     QMCondCliFamTRASPASAR: TIntegerField;
     QMCondArtTRASPASAR: TIntegerField;
     QMCondFamTRASPASAR: TIntegerField;
     QMCondPerTRASPASAR: TIntegerField;
     QMCondPerArtTRASPASAR: TIntegerField;
     QMCondPerFamTRASPASAR: TIntegerField;
     QMCondAgrTRASPASAR: TIntegerField;
     QMCondAgrArtTRASPASAR: TIntegerField;
     QMCondAgrFamARTICULO: TFIBStringField;
     QMCondAgrFamTITULO_ARTICULO: TFIBStringField;
     QMCondAgrFamTRASPASAR: TIntegerField;
     QMArticulosModelo: TFIBDataSetRO;
     DSArticulosModelo: TDataSource;
     QMCondCliArtALFA_1: TFIBStringField;
     QMCondCliArtALFA_2: TFIBStringField;
     QMCondCliArtALFA_3: TFIBStringField;
     QMCondCliArtALFA_4: TFIBStringField;
     QMCondCliArtALFA_5: TFIBStringField;
     QMCondCliArtALFA_6: TFIBStringField;
     QMCondCliArtALFA_7: TFIBStringField;
     QMCondCliArtALFA_8: TFIBStringField;
     QMCondCliFamALFA_1: TFIBStringField;
     QMCondCliFamALFA_2: TFIBStringField;
     QMCondCliFamALFA_3: TFIBStringField;
     QMCondCliFamALFA_4: TFIBStringField;
     QMCondCliFamALFA_5: TFIBStringField;
     QMCondCliFamALFA_6: TFIBStringField;
     QMCondCliFamALFA_7: TFIBStringField;
     QMCondCliFamALFA_8: TFIBStringField;
     QMCondArtALFA_1: TFIBStringField;
     QMCondArtALFA_2: TFIBStringField;
     QMCondArtALFA_3: TFIBStringField;
     QMCondArtALFA_4: TFIBStringField;
     QMCondArtALFA_5: TFIBStringField;
     QMCondArtALFA_6: TFIBStringField;
     QMCondArtALFA_7: TFIBStringField;
     QMCondArtALFA_8: TFIBStringField;
     QMCondFamALFA_1: TFIBStringField;
     QMCondFamALFA_2: TFIBStringField;
     QMCondFamALFA_3: TFIBStringField;
     QMCondFamALFA_4: TFIBStringField;
     QMCondFamALFA_5: TFIBStringField;
     QMCondFamALFA_6: TFIBStringField;
     QMCondFamALFA_7: TFIBStringField;
     QMCondFamALFA_8: TFIBStringField;
     QMCondPerALFA_1: TFIBStringField;
     QMCondPerALFA_2: TFIBStringField;
     QMCondPerALFA_3: TFIBStringField;
     QMCondPerALFA_4: TFIBStringField;
     QMCondPerALFA_5: TFIBStringField;
     QMCondPerALFA_6: TFIBStringField;
     QMCondPerALFA_7: TFIBStringField;
     QMCondPerALFA_8: TFIBStringField;
     QMCondPerArtALFA_1: TFIBStringField;
     QMCondPerArtALFA_2: TFIBStringField;
     QMCondPerArtALFA_3: TFIBStringField;
     QMCondPerArtALFA_4: TFIBStringField;
     QMCondPerArtALFA_5: TFIBStringField;
     QMCondPerArtALFA_6: TFIBStringField;
     QMCondPerArtALFA_7: TFIBStringField;
     QMCondPerArtALFA_8: TFIBStringField;
     QMCondPerFamALFA_1: TFIBStringField;
     QMCondPerFamALFA_2: TFIBStringField;
     QMCondPerFamALFA_3: TFIBStringField;
     QMCondPerFamALFA_4: TFIBStringField;
     QMCondPerFamALFA_5: TFIBStringField;
     QMCondPerFamALFA_6: TFIBStringField;
     QMCondPerFamALFA_7: TFIBStringField;
     QMCondPerFamALFA_8: TFIBStringField;
     QMCondAgrALFA_1: TFIBStringField;
     QMCondAgrALFA_2: TFIBStringField;
     QMCondAgrALFA_3: TFIBStringField;
     QMCondAgrALFA_4: TFIBStringField;
     QMCondAgrALFA_5: TFIBStringField;
     QMCondAgrALFA_6: TFIBStringField;
     QMCondAgrALFA_7: TFIBStringField;
     QMCondAgrALFA_8: TFIBStringField;
     QMCondAgrArtALFA_1: TFIBStringField;
     QMCondAgrArtALFA_2: TFIBStringField;
     QMCondAgrArtALFA_3: TFIBStringField;
     QMCondAgrArtALFA_4: TFIBStringField;
     QMCondAgrArtALFA_5: TFIBStringField;
     QMCondAgrArtALFA_6: TFIBStringField;
     QMCondAgrArtALFA_7: TFIBStringField;
     QMCondAgrArtALFA_8: TFIBStringField;
     QMCondAgrFamALFA_1: TFIBStringField;
     QMCondAgrFamALFA_2: TFIBStringField;
     QMCondAgrFamALFA_3: TFIBStringField;
     QMCondAgrFamALFA_4: TFIBStringField;
     QMCondAgrFamALFA_5: TFIBStringField;
     QMCondAgrFamALFA_6: TFIBStringField;
     QMCondAgrFamALFA_7: TFIBStringField;
     QMCondAgrFamALFA_8: TFIBStringField;
     QMCondAgrArticulos: TFIBTableSet;
     DSxCondAgrArticulos: TDataSource;
     QMCondAgrArticulosEMPRESA: TIntegerField;
     QMCondAgrArticulosEJERCICIO: TIntegerField;
     QMCondAgrArticulosCANAL: TIntegerField;
     QMCondAgrArticulosTIPO: TFIBStringField;
     QMCondAgrArticulosRIG: TIntegerField;
     QMCondAgrArticulosAGRUPACION: TFIBStringField;
     QMCondAgrArticulosTITULO_AGRUPACION: TFIBStringField;
     QMCondAgrArticulosARTICULO: TFIBStringField;
     QMCondAgrArticulosTITULO_ARTICULO: TFIBStringField;
     QMCondAgrArticulosFAMILIA: TFIBStringField;
     QMCondAgrArticulosTITULO_FAMILIA: TFIBStringField;
     QMCondAgrArticulosALTA: TDateTimeField;
     QMCondAgrArticulosBAJA: TDateTimeField;
     QMCondAgrArticulosACTIVO: TIntegerField;
     QMCondAgrArticulosDESDE: TFloatField;
     QMCondAgrArticulosHASTA: TFloatField;
     QMCondAgrArticulosPRECIO: TFloatField;
     QMCondAgrArticulosDTO1: TFloatField;
     QMCondAgrArticulosDTO2: TFloatField;
     QMCondAgrArticulosDTO3: TFloatField;
     QMCondAgrArticulosLINEA: TIntegerField;
     QMCondAgrArticulosTRASPASAR: TIntegerField;
     QMCondAgrArticulosALFA_1: TFIBStringField;
     QMCondAgrArticulosALFA_2: TFIBStringField;
     QMCondAgrArticulosALFA_3: TFIBStringField;
     QMCondAgrArticulosALFA_4: TFIBStringField;
     QMCondAgrArticulosALFA_5: TFIBStringField;
     QMCondAgrArticulosALFA_6: TFIBStringField;
     QMCondAgrArticulosALFA_7: TFIBStringField;
     QMCondAgrArticulosALFA_8: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCondCliArtNewRecord(DataSet: TDataSet);
     procedure QMCondCliArtAfterPost(DataSet: TDataSet);
     procedure QMCondCliFamAfterPost(DataSet: TDataSet);
     procedure QMCondCliFamNewRecord(DataSet: TDataSet);
     procedure QMCondCliFamFAMILIAChange(Sender: TField);
     procedure QMCondCliArtARTICULOChange(Sender: TField);
     procedure QMCondArtAfterPost(DataSet: TDataSet);
     procedure QMCondArtNewRecord(DataSet: TDataSet);
     procedure QMCondArtARTICULOChange(Sender: TField);
     procedure QMCondFamFAMILIAChange(Sender: TField);
     procedure QMCondFamAfterPost(DataSet: TDataSet);
     procedure QMCondFamNewRecord(DataSet: TDataSet);
     procedure QMCondPerAfterPost(DataSet: TDataSet);
     procedure QMCondPerNewRecord(DataSet: TDataSet);
     procedure QMCondPerArtNewRecord(DataSet: TDataSet);
     procedure QMCondPerFamNewRecord(DataSet: TDataSet);
     procedure QMCondPerArtAfterPost(DataSet: TDataSet);
     procedure QMCondPerFamAfterPost(DataSet: TDataSet);
     procedure QMCondAgrAfterPost(DataSet: TDataSet);
     procedure QMCondAgrArtAfterPost(DataSet: TDataSet);
     procedure QMCondAgrFamAfterPost(DataSet: TDataSet);
     procedure QMCondAgrNewRecord(DataSet: TDataSet);
     procedure QMCondAgrArtNewRecord(DataSet: TDataSet);
     procedure QMCondAgrFamNewRecord(DataSet: TDataSet);
     procedure QMCondPerPERFILChange(Sender: TField);
     procedure QMCondPerALTAChange(Sender: TField);
     procedure QMCondPerArtARTICULOChange(Sender: TField);
     procedure QMCondAgrAGRUPACIONChange(Sender: TField);
     procedure QMCondAgrArtARTICULOChange(Sender: TField);
     procedure QMCondAgrFamFAMILIAChange(Sender: TField);
     procedure QMCondPerFamFAMILIAChange(Sender: TField);
     procedure QMCondAgrArticulosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     // SQLBase: TStrings;
     function TituloArticulo(Articulo: string): string;
     function TituloFamilia(Familia: string): string;
  public
     { Public declarations }
     // function BusquedaCompleja(tipo: integer): integer;
     function BusquedaCompleja(Tabla: TFIBTableSet; Tipo: string; NCond: integer): integer;
     procedure FiltrarCliente(Cliente: integer);
     procedure FiltrarPerfil(perfil: string);
     procedure FiltrarAgrupaciones(Agrupaciones: string);
     procedure AgregaCondicionModeloArticulos(Ref_proveedor: string; Precio, Desc1, Desc2, Desc3: double);
     procedure EliminaCondicionModeloArticulos(Cliente, Ref_proveedor: string);
     procedure AgregaCondicionArticulosDeModelo(Tabla: string; Ref_proveedor: string; Precio, Desc1, Desc2, Desc3: double);
     procedure EliminaCondicionArticulosDeModelo(Tabla: string; Ref_proveedor: string);
     procedure ActualizarPreciosTarifa(Cliente: integer = 0);
  end;

var
  DMCondicionesVenta : TDMCondicionesVenta;

implementation

uses UDMMain, UEntorno, uFBusca, DateUtils, StrUtils, UParam, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMCondicionesVenta.DataModuleCreate(Sender: TObject);
var
  i : integer;
  DescripcionAlfa : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Máscaras
  QMCondCliArtDESDE.DisplayFormat := MascaraN;
  QMCondCliArtHASTA.DisplayFormat := MascaraN;
  QMCondCliArtDTO1.DisplayFormat := MascaraP;
  QMCondCliArtDTO2.DisplayFormat := MascaraP;
  QMCondCliArtDTO3.DisplayFormat := MascaraP;
  QMCondCliArtPRECIO.DisplayFormat := MascaraL;

  QMCondCliFamDESDE.DisplayFormat := MascaraN;
  QMCondCliFamHASTA.DisplayFormat := MascaraN;
  QMCondCliFamDTO1.DisplayFormat := MascaraP;
  QMCondCliFamDTO2.DisplayFormat := MascaraP;
  QMCondCliFamDTO3.DisplayFormat := MascaraP;

  QMCondArtDESDE.DisplayFormat := MascaraN;
  QMCondArtHASTA.DisplayFormat := MascaraN;
  QMCondArtDTO1.DisplayFormat := MascaraP;
  QMCondArtDTO2.DisplayFormat := MascaraP;
  QMCondArtDTO3.DisplayFormat := MascaraP;
  QMCondArtPRECIO.DisplayFormat := MascaraL;

  QMCondFamDESDE.DisplayFormat := MascaraN;
  QMCondFamHASTA.DisplayFormat := MascaraN;
  QMCondFamDTO1.DisplayFormat := MascaraP;
  QMCondFamDTO2.DisplayFormat := MascaraP;
  QMCondFamDTO3.DisplayFormat := MascaraP;

  QMCondPerDESDE.DisplayFormat := MascaraN;
  QMCondPerHASTA.DisplayFormat := MascaraN;
  QMCondPerDTO1.DisplayFormat := MascaraP;
  QMCondPerDTO2.DisplayFormat := MascaraP;
  QMCondPerDTO3.DisplayFormat := MascaraP;

  QMCondPerArtDESDE.DisplayFormat := MascaraN;
  QMCondPerArtHASTA.DisplayFormat := MascaraN;
  QMCondPerArtDTO1.DisplayFormat := MascaraP;
  QMCondPerArtDTO2.DisplayFormat := MascaraP;
  QMCondPerArtDTO3.DisplayFormat := MascaraP;
  QMCondPerArtPRECIO.DisplayFormat := MascaraL;

  QMCondPerFamDESDE.DisplayFormat := MascaraN;
  QMCondPerFamHASTA.DisplayFormat := MascaraN;
  QMCondPerFamDTO1.DisplayFormat := MascaraP;
  QMCondPerFamDTO2.DisplayFormat := MascaraP;
  QMCondPerFamDTO3.DisplayFormat := MascaraP;

  QMCondAgrDESDE.DisplayFormat := MascaraN;
  QMCondAgrHASTA.DisplayFormat := MascaraN;
  QMCondAgrDTO1.DisplayFormat := MascaraP;
  QMCondAgrDTO2.DisplayFormat := MascaraP;
  QMCondAgrDTO3.DisplayFormat := MascaraP;

  QMCondAgrArticulosDESDE.DisplayFormat := MascaraN;
  QMCondAgrArticulosHASTA.DisplayFormat := MascaraN;
  QMCondAgrArticulosDTO1.DisplayFormat := MascaraP;
  QMCondAgrArticulosDTO2.DisplayFormat := MascaraP;
  QMCondAgrArticulosDTO3.DisplayFormat := MascaraP;
  QMCondAgrArticulosPRECIO.DisplayFormat := MascaraL;

  QMCondAgrArtDESDE.DisplayFormat := MascaraN;
  QMCondAgrArtHASTA.DisplayFormat := MascaraN;
  QMCondAgrArtDTO1.DisplayFormat := MascaraP;
  QMCondAgrArtDTO2.DisplayFormat := MascaraP;
  QMCondAgrArtDTO3.DisplayFormat := MascaraP;
  QMCondAgrArtPRECIO.DisplayFormat := MascaraL;

  QMCondAgrFamDESDE.DisplayFormat := MascaraN;
  QMCondAgrFamHASTA.DisplayFormat := MascaraN;
  QMCondAgrFamDTO1.DisplayFormat := MascaraP;
  QMCondAgrFamDTO2.DisplayFormat := MascaraP;
  QMCondAgrFamDTO3.DisplayFormat := MascaraP;

  DMMain.FiltraRO(QMCli, '11100', True);
  DMMain.FiltraTabla(QMCondCliArt, '11100', True);
  DMMain.FiltraTabla(QMCondCliFam, '11100', True);
  DMMain.FiltraTabla(QMCondArt, '11100', True);
  DMMain.FiltraTabla(QMCondFam, '11100', True);

  QMPer.Open;
  DMMain.FiltraTabla(QMCondPer, '11100', True);
  DMMain.FiltraTabla(QMCondPerArt, '11100', True);
  DMMain.FiltraTabla(QMCondPerFam, '11100', True);

  QMAgr.Open;
  DMMain.FiltraTabla(QMCondAgr, '11100', True);
  DMMain.FiltraTabla(QMCondAgrArticulos, '11100', True);
  DMMain.FiltraTabla(QMCondAGrArt, '11100', True);
  DMMain.FiltraTabla(QMCondAgrFam, '11100', True);

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
  begin
     DescripcionAlfa := LeeParametro(format('ARTDESC%3.3d', [i]));

     QMCondCliArt.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondCliFam.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondArt.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondFam.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondPer.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondPerArt.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondPerFam.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondAgr.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondAgrArticulos.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondAGrArt.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
     QMCondAgrFam.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := DescripcionAlfa;
  end;
end;

procedure TDMCondicionesVenta.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCondicionesVenta.QMCondCliArtNewRecord(DataSet: TDataSet);
begin
  if ((QMCli.State = dsInsert) or (QMCli.State = dsEdit)) then
  begin
     QMCondCliArt.Cancel;
     QMCli.Post;
     QMCli.Refresh;
     QMCondCliArt.Edit;
  end;

  QMCondCliArtEMPRESA.AsInteger := QMCliEMPRESA.AsInteger;
  QMCondCliArtEJERCICIO.AsInteger := QMCliEJERCICIO.AsInteger;
  QMCondCliArtCANAL.AsInteger := QMCliCANAL.AsInteger;
  QMCondCliArtTIPO.AsString := 'CCA';
  QMCondCliArtRIG.AsInteger := DMMain.Contador_EEC('CCA');
  QMCondCliArtCLIENTE.AsInteger := QMCliCLIENTE.AsInteger;
  QMCondCliArtALTA.AsDateTime := Date;
  QMCondCliArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondCliArtACTIVO.AsInteger := 1;
  QMCondCliArtPRECIO.AsFloat := 0;
  QMCondCliArtDTO1.AsFloat := 0;
  QMCondCliArtDTO2.AsFloat := 0;
  QMCondCliArtDTO3.AsFloat := 0;
  QMCondCliArtTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondCliFamNewRecord(DataSet: TDataSet);
begin
  if ((QMCli.State = dsInsert) or (QMCli.State = dsEdit)) then
  begin
     QMCondCliFam.Cancel;
     QMCli.Post;
     QMCli.Refresh;
     QMcondCliFam.Edit;
  end;
  QMCondCliFamEMPRESA.AsInteger := QMCliEMPRESA.AsInteger;
  QMCondCliFamEJERCICIO.AsInteger := QMCliEJERCICIO.AsInteger;
  QMCondCliFamCANAL.AsInteger := QMCliCANAL.AsInteger;
  QMCondCliFamTIPO.AsString := 'CCF';
  QMCondCliFamRIG.AsInteger := DMMain.Contador_EEC('CCF');
  QMCondCliFamCLIENTE.AsInteger := QMCliCLIENTE.AsInteger;
  QMCondCliFamALTA.AsDateTime := Date;
  QMCondCliFamBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondCliFamACTIVO.AsInteger := 1;
  QMCondCliFamPRECIO.AsFloat := 0;
  QMCondCliFamDTO1.AsFloat := 0;
  QMCondCliFamDTO2.AsFloat := 0;
  QMCondCliFamDTO3.AsFloat := 0;
  QMCondCliFamTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondArtNewRecord(DataSet: TDataSet);
begin
  QMCondArtEMPRESA.AsInteger := REntorno.Empresa;
  QMCondArtEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondArtCANAL.AsInteger := REntorno.Canal;
  QMCondArtTIPO.AsString := 'CAR';
  QMCondArtRIG.AsInteger := DMMain.Contador_EEC('CAR');
  QMCondArtALTA.AsDateTime := Date;
  QMCondArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondArtACTIVO.AsInteger := 1;
  QMCondArtPRECIO.AsFloat := 0;
  QMCondArtDTO1.AsFloat := 0;
  QMCondArtDTO2.AsFloat := 0;
  QMCondArtDTO3.AsFloat := 0;
  QMCondArtTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondFamNewRecord(DataSet: TDataSet);
begin
  QMCondFamEMPRESA.AsInteger := REntorno.Empresa;
  QMCondFamEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondFamCANAL.AsInteger := REntorno.Canal;
  QMCondFamTIPO.AsString := 'CFA';
  QMCondFamRIG.AsInteger := DMMain.Contador_EEC('CFA');
  QMCondFamALTA.AsDateTime := Date;
  QMCondFamBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondFamACTIVO.AsInteger := 1;
  QMCondFamPRECIO.AsFloat := 0;
  QMCondFamDTO1.AsFloat := 0;
  QMCondFamDTO2.AsFloat := 0;
  QMCondFamDTO3.AsFloat := 0;
  QMCondFamTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondCliArtAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondCliFamAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondArtAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondFamAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

function TDMCondicionesVenta.BusquedaCompleja(Tabla: TFIBTableSet; Tipo: string; NCond: integer): integer;
var
  SQL, Orden : string;
begin
  with Tabla do
  begin
     DisableControls;
     try
        Close;
        SQL := SelectSQL.Text;
        Orden := OrdenadoPor;
        Ordenar('');
        Result := TFBusca.Create(Self).SeleccionaBusqueda(Tabla, '11100', False);
        if (Result = mrCancel) then
           SelectSQL.Text := SQL
        else
        begin
           if Pos('WHERE', UpperCase(SelectSQL.Text)) <> 0 then
              SelectSQL.Add('AND')
           else
              SelectSQL.Add('WHERE');
           SelectSQL.Add('(TIPO=' + '''' + Tipo + ''') ');
           case NCond of
              0, 1: SelectSQL.Add(' AND CLIENTE= ' + QMCliCLIENTE.AsString);
              5, 6: SelectSQL.Add(' AND PERFIL= ' + QMPerPERFIL.AsString);
              8, 9: SelectSQL.Add(' AND AGRUPACION= ' + QMAgrAGRUPACION.AsString);
           end;
           Ordenar(Orden);
        end;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMCondicionesVenta.QMCondCliFamFAMILIAChange(Sender: TField);
begin
  QMCondCliFamTITULO_FAMILIA.AsString := TituloFamilia(QMCondCliFamFAMILIA.AsString);
end;

procedure TDMCondicionesVenta.QMCondCliArtARTICULOChange(Sender: TField);
begin
  QMCondCliArtTITULO_ARTICULO.AsString := TituloArticulo(QMCondCliArtARTICULO.AsString);
end;

procedure TDMCondicionesVenta.QMCondArtARTICULOChange(Sender: TField);
begin
  QMCondArtTITULO_ARTICULO.AsString := TituloArticulo(QMCondArtARTICULO.AsString);
end;

procedure TDMCondicionesVenta.QMCondFamFAMILIAChange(Sender: TField);
begin
  QMCondFamTITULO_FAMILIA.AsString := TituloFamilia(QMCondFamFAMILIA.AsString);
end;

function TDMCondicionesVenta.TituloFamilia(Familia: string): string;
begin
  Result := DameTituloFamilia(Familia);
end;

function TDMCondicionesVenta.TituloArticulo(Articulo: string): string;
begin
  Result := DameTituloArticulo(Articulo);
end;


procedure TDMCondicionesVenta.QMCondPerAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondPerNewRecord(DataSet: TDataSet);
begin
  QMCondPerEMPRESA.AsInteger := REntorno.Empresa;
  QMCondPerEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondPerCANAL.AsInteger := REntorno.Canal;
  QMCondPerTIPO.AsString := 'CPE';
  QMCondPerRIG.AsInteger := DMMain.Contador_EEC('CPE');
  QMCondPerALTA.AsDateTime := Date;
  QMCondPerBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondPerACTIVO.AsInteger := 1;
  QMCondPerPRECIO.AsFloat := 0;
  QMCondPerDTO1.AsFloat := 0;
  QMCondPerDTO2.AsFloat := 0;
  QMCondPerDTO3.AsFloat := 0;
  QMCondPerTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.FiltrarCliente(Cliente: integer);
begin
  with QMCli do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with QMCondCliArt do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONDICIONES_CLIENTE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' CLIENTE = ?CLIENTE AND ');
     SelectSQL.Add(' TIPO = ''CCA'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with QMCondCliFam do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONDICIONES_CLIENTE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' CLIENTE = ?CLIENTE AND ');
     SelectSQL.Add(' TIPO = ''CCF'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMCondicionesVenta.FiltrarPerfil(Perfil: string);
begin
  with QMPer do
  begin
     Close;
     Params.ByName['PERFIL'].AsString := Perfil;
     Open;
  end;

  with QMCondPerArt do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONDICIONES_PERFIL ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' PERFIL = ?PERFIL AND ');
     SelectSQL.Add(' TIPO = ''CPA'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PERFIL'].AsString := Perfil;
     Open;
  end;

  with QMCondPerFam do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONDICIONES_PERFIL ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' PERFIL = ?PERFIL AND ');
     SelectSQL.Add(' TIPO = ''CPF'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PERFIL'].AsString := Perfil;
     Open;
  end;
end;

procedure TDMCondicionesVenta.FiltrarAgrupaciones(Agrupaciones: string);
begin
  with QMAgr do
  begin
     Close;
     Params.ByName['AGRUPACION'].AsString := Agrupaciones;
     Open;
  end;

  with QMCondAgrArt do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONDICIONES_AGRUPACION ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' AGRUPACION = ?AGRUPACION AND ');
     SelectSQL.Add(' TIPO = ''CAA'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGRUPACION'].AsString := Agrupaciones;
     Open;
  end;

  with QMCondAgrFam do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONDICIONES_AGRUPACION ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA=?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO=?EJERCICIO AND ');
     SelectSQL.Add(' CANAL=?CANAL AND ');
     SelectSQL.Add(' AGRUPACION=?AGRUPACION AND ');
     SelectSQL.Add(' TIPO=''CAF'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGRUPACION'].AsString := Agrupaciones;
     Open;
  end;
end;

procedure TDMCondicionesVenta.QMCondPerArtNewRecord(DataSet: TDataSet);
begin
  if ((QMPer.State = dsInsert) or (QMPer.State = dsEdit)) then
  begin
     QMCondPerArt.Cancel;
     QMPer.Post;
     QMPer.Refresh;
     QMCondPerArt.Edit;
  end;

  QMCondPerArtEMPRESA.AsInteger := REntorno.Empresa;
  QMCondPerArtEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondPerArtCANAL.AsInteger := REntorno.Canal;
  QMCondPerArtTIPO.AsString := 'CPA';
  QMCondPerArtRIG.AsInteger := DMMain.Contador_EEC('CPA');
  QMCondPerArtPERFIL.AsString := QMPerPERFIL.AsString;
  QMCondPerArtALTA.AsDateTime := Date;
  QMCondPerArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondPerArtACTIVO.AsInteger := 1;
  QMCondPerArtPRECIO.AsFloat := 0;
  QMCondPerArtDTO1.AsFloat := 0;
  QMCondPerArtDTO2.AsFloat := 0;
  QMCondPerArtDTO3.AsFloat := 0;
  QMCondPerArtTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondPerFamNewRecord(DataSet: TDataSet);
begin
  if ((QMPer.State = dsInsert) or (QMPer.State = dsEdit)) then
  begin
     QMCondPerFam.Cancel;
     QMPer.Post;
     QMPer.Refresh;
     QMCondPerFam.Edit;
  end;

  QMCondPerFamEMPRESA.AsInteger := REntorno.Empresa;
  QMCondPerFamEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondPerFamCANAL.AsInteger := REntorno.Canal;
  QMCondPerFamTIPO.AsString := 'CPF';
  QMCondPerFamRIG.AsInteger := DMMain.Contador_EEC('CPF');
  QMCondPerFamPERFIL.AsString := QMPerPERFIL.AsString;
  QMCondPerFamALTA.AsDateTime := Date;
  QMCondPerFamBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondPerFamACTIVO.AsInteger := 1;
  QMCondPerFamPRECIO.AsFloat := 0;
  QMCondPerFamDTO1.AsFloat := 0;
  QMCondPerFamDTO2.AsFloat := 0;
  QMCondPerFamDTO3.AsFloat := 0;
  QMCondPerFamTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondPerArtAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondPerFamAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondAgrAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondAgrArtAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondAgrFamAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCondicionesVenta.QMCondAgrNewRecord(DataSet: TDataSet);
begin
  QMCondAgrEMPRESA.AsInteger := REntorno.Empresa;
  QMCondAgrEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondAgrCANAL.AsInteger := REntorno.Canal;
  QMCondAGrTIPO.AsString := 'CAG';
  QMCondAgrRIG.AsInteger := DMMain.Contador_EEC('CAG');
  QMCondAgrALTA.AsDateTime := Date;
  QMCondAgrBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondAgrACTIVO.AsInteger := 1;
  QMCondAgrPRECIO.AsFloat := 0;
  QMCondAgrDTO1.AsFloat := 0;
  QMCondAgrDTO2.AsFloat := 0;
  QMCondAgrDTO3.AsFloat := 0;
  QMCondAgrTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondAgrArtNewRecord(DataSet: TDataSet);
begin
  if ((QMAgr.State = dsInsert) or (QMAgr.State = dsEdit)) then
  begin
     QMCondAgrArt.Cancel;
     QMAgr.Post;
     QMAgr.Refresh;
     QMCondAgrArt.Edit;
  end;

  QMCondAgrArtEMPRESA.AsInteger := REntorno.Empresa;
  QMCondAgrArtEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondAgrArtCANAL.AsInteger := REntorno.Canal;
  QMCondAgrArtTIPO.AsString := 'CAA';
  QMCondAgrArtRIG.AsInteger := DMMain.Contador_EEC('CAA');
  QMCondAgrArtAGRUPACION.AsString := QMAgrAGRUPACION.AsString;
  QMCondAgrArtALTA.AsDateTime := Date;
  QMCondAgrArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondAgrArtACTIVO.AsInteger := 1;
  QMCondAgrArtPRECIO.AsFloat := 0;
  QMCondAgrArtDTO1.AsFloat := 0;
  QMCondAGrArtDTO2.AsFloat := 0;
  QMCondAgrArtDTO3.AsFloat := 0;
  QMCondAgrArtTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondAgrFamNewRecord(DataSet: TDataSet);
begin
  if ((QMAgr.State = dsInsert) or (QMAgr.State = dsEdit)) then
  begin
     QMCondAgrFam.Cancel;
     QMAgr.Post;
     QMAgr.Refresh;
     QMCondAgrFam.Edit;
  end;

  QMCondAgrFamEMPRESA.AsInteger := REntorno.Empresa;
  QMCondAgrFamEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondAgrFamCANAL.AsInteger := REntorno.Canal;
  QMCondAgrFamTIPO.AsString := 'CAF';
  QMCondAgrFamRIG.AsInteger := DMMain.Contador_EEC('CAF');
  QMCondAgrFamAGRUPACION.AsString := QMAgrAGRUPACION.AsString;
  QMCondAgrFamALTA.AsDateTime := Date;
  QMCondAgrFamBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondAgrFamACTIVO.AsInteger := 1;
  QMCondAgrFamPRECIO.AsFloat := 0;
  QMCondAgrFamDTO1.AsFloat := 0;
  QMCondAgrFamDTO2.AsFloat := 0;
  QMCondAgrFamDTO3.AsFloat := 0;
  QMCondAgrFamTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesVenta.QMCondPerPERFILChange(Sender: TField);
begin
  QMCondPerTITULO_PERFIL.AsString := DameTituloPerfilCliente(QMCondPerPERFIL.AsString);
end;

procedure TDMCondicionesVenta.QMCondPerALTAChange(Sender: TField);
begin
  QMCondPerBAJA.AsDateTime := EncodeDate(YearOf(QMCondPerALTA.AsDateTime), 12, 31);
end;

procedure TDMCondicionesVenta.QMCondPerArtARTICULOChange(Sender: TField);
begin
  QMCondPerArtTITULO_ARTICULO.AsString := TituloArticulo(QMCondPerArtARTICULO.AsString);
end;

procedure TDMCondicionesVenta.QMCondAgrAGRUPACIONChange(Sender: TField);
begin
  QMCondAgrTITULO_AGRUPACION.AsString := DameTituloAgrupacion('C', QMCondAgrAGRUPACION.AsString);
end;

procedure TDMCondicionesVenta.QMCondAgrArtARTICULOChange(Sender: TField);
begin
  QMCondAgrArtTITULO_ARTICULO.AsString := TituloArticulo(QMCondAgrArtARTICULO.AsString);
end;

procedure TDMCondicionesVenta.QMCondAgrFamFAMILIAChange(Sender: TField);
begin
  QMCondAgrFamTITULO_FAMILIA.AsString := TituloFamilia(QMCondAgrFamFAMILIA.AsString);
end;

procedure TDMCondicionesVenta.QMCondPerFamFAMILIAChange(Sender: TField);
begin
  QMCondPerFamTITULO_FAMILIA.AsString := TituloFamilia(QMCondPerFamFAMILIA.AsString);
end;

procedure TDMCondicionesVenta.AgregaCondicionModeloArticulos(Ref_proveedor: string; Precio, Desc1, Desc2, Desc3: double);
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT A.ARTICULO FROM ART_ARTICULOS A ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ON A.ID_A_M_C_T = T.ID_A_M_C_T ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR C ON T.ID_A_M_C = C.ID_A_M_C ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = C.ID_A_M ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' M.REF_PROVEEDOR = :REF_PROVEEDOR ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['REF_PROVEEDOR'].AsString := Ref_proveedor;
           Open;
           while not EOF do
           begin
              QMCondCliArt.Append;
              QMCondCliArtARTICULO.AsString := FieldByName('ARTICULO').AsString;
              QMCondCliArtDesde.AsFloat := 0;
              QMCondCliArtALTA.AsDateTime := EncodeDate(REntorno.Ejercicio, 01, 01);
              QMCondCliArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
              QMCondCliArtPRECIO.AsFloat := Precio;
              QMCondCliArtDTO1.AsFloat := Desc1;
              QMCondCliArtDTO2.AsFloat := Desc2;
              QMCondCliArtDTO3.AsFloat := Desc3;
              QMCondCliArt.Post;
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

procedure TDMCondicionesVenta.EliminaCondicionModeloArticulos(Cliente, Ref_proveedor: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        AutoTrans := True;
        SQL.Add(' DELETE FROM VER_CONDICIONES_CLIENTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' CLIENTE = :CLIENTE AND ');
        SQL.Add(' TIPO = ''CCA'' AND ');
        SQL.Add(' ARTICULO IN ( ');
        SQL.Add('              SELECT A.ARTICULO FROM ART_ARTICULOS A ');
        SQL.Add('              JOIN ART_ARTICULOS_M_C_TALLAS T ON A.ID_A_M_C_T = T.ID_A_M_C_T ');
        SQL.Add('              JOIN ART_ARTICULOS_MOD_COLOR C ON T.ID_A_M_C = C.ID_A_M_C ');
        SQL.Add('              JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = C.ID_A_M ');
        SQL.Add('              WHERE ');
        SQL.Add('              A.EMPRESA = :EMPRESA AND ');
        SQL.Add('              M.REF_PROVEEDOR = :REF_PROVEEDOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE'].AsString := Cliente;
        Params.ByName['REF_PROVEEDOR'].AsString := Ref_proveedor;
        ExecQuery;
        Close;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMCondCliArt, '', 0);
end;

procedure TDMCondicionesVenta.AgregaCondicionArticulosDeModelo(Tabla: string; Ref_proveedor: string; Precio, Desc1, Desc2, Desc3: double);
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT A.ARTICULO FROM ART_ARTICULOS A ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ON A.ID_A_M_C_T = T.ID_A_M_C_T ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR C ON T.ID_A_M_C = C.ID_A_M_C ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = C.ID_A_M ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' M.REF_PROVEEDOR = :REF_PROVEEDOR ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['REF_PROVEEDOR'].AsString := Ref_proveedor;
           Open;
           while not EOF do
           begin
              if Tabla = 'CAR' then
              begin
                 QMCondArt.Append;
                 QMCondArtARTICULO.AsString := FieldByName('ARTICULO').AsString;
                 QMCondArtDESDE.AsFloat := 0;
                 QMCondArtALTA.AsDateTime := EncodeDate(REntorno.Ejercicio, 01, 01);
                 QMCondArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
                 QMCondArtPRECIO.AsFloat := Precio;
                 QMCondArtDTO1.AsFloat := Desc1;
                 QMCondArtDTO2.AsFloat := Desc2;
                 QMCondArtDTO3.AsFloat := Desc3;
                 QMCondArt.Post;
              end
              else
              if Tabla = 'CAA' then
              begin
                 QMCondAgrArt.Append;
                 QMCondAgrArtARTICULO.AsString := FieldByName('ARTICULO').AsString;
                 QMCondAgrArtDESDE.AsFloat := 0;
                 QMCondAgrArtALTA.AsDateTime := EncodeDate(REntorno.Ejercicio, 01, 01);
                 QMCondAgrArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
                 QMCondAgrArtPRECIO.AsFloat := Precio;
                 QMCondAgrArtDTO1.AsFloat := Desc1;
                 QMCondAgrArtDTO2.AsFloat := Desc2;
                 QMCondAgrArtDTO3.AsFloat := Desc3;
                 QMCondAgrArt.Post;
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

procedure TDMCondicionesVenta.EliminaCondicionArticulosDeModelo(Tabla: string; Ref_proveedor: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        AutoTrans := True;
        if Tabla = 'CAR' then
           SQL.Add(' DELETE FROM VER_CONDICIONES_CLIENTE ')
        else
        if Tabla = 'CAA' then
           SQL.Add(' DELETE FROM VER_CONDICIONES_AGRUPACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        if Tabla = 'CAR' then
           SQL.Add(' TIPO = ''CAR'' AND ');
        if Tabla = 'CAA' then
           SQL.Add(' TIPO = ''CAA'' AND ');
        SQL.Add(' ARTICULO IN ( ');
        SQL.Add('              SELECT A.ARTICULO FROM ART_ARTICULOS A ');
        SQL.Add('              JOIN ART_ARTICULOS_M_C_TALLAS T ON A.ID_A_M_C_T = T.ID_A_M_C_T ');
        SQL.Add('              JOIN ART_ARTICULOS_MOD_COLOR C ON T.ID_A_M_C = C.ID_A_M_C ');
        SQL.Add('              JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = C.ID_A_M ');
        SQL.Add('              WHERE ');
        SQL.Add('              A.EMPRESA = :EMPRESA AND ');
        SQL.Add('              M.REF_PROVEEDOR = :REF_PROVEEDOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REF_PROVEEDOR'].AsString := Ref_proveedor;
        ExecQuery;
        Close;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Tabla = 'CAR' then
     Refrescar(QMCondArt, '', 0);
  if Tabla = 'CAA' then
     Refrescar(QMCondAgrArt, '', 0);
end;

procedure TDMCondicionesVenta.ActualizarPreciosTarifa(Cliente: integer = 0);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_COND_ACT_PRECIO_TARIFA (:EMPRESA, :EJERCICIO, :CANAL, :TIPO, :CLIENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := 'CCA';
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMCondCliArt, '', 0);
end;

procedure TDMCondicionesVenta.QMCondAgrArticulosNewRecord(DataSet: TDataSet);
begin
  if ((QMAgr.State = dsInsert) or (QMAgr.State = dsEdit)) then
  begin
     QMCondAgrArt.Cancel;
     QMAgr.Post;
     QMAgr.Refresh;
     QMCondAgrArt.Edit;
  end;

  QMCondAgrArticulosEMPRESA.AsInteger := REntorno.Empresa;
  QMCondAgrArticulosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondAgrArticulosCANAL.AsInteger := REntorno.Canal;
  QMCondAgrArticulosTIPO.AsString := 'CGA';
  QMCondAgrArticulosRIG.AsInteger := DMMain.Contador_EEC('CGA');
  QMCondAgrArticulosAGRUPACION.AsString := QMAgrAGRUPACION.AsString;
  QMCondAgrArticulosALTA.AsDateTime := Date;
  QMCondAgrArticulosBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondAgrArticulosACTIVO.AsInteger := 1;
  QMCondAgrArticulosPRECIO.AsFloat := 0;
  QMCondAgrArticulosDTO1.AsFloat := 0;
  QMCondAgrArticulosDTO2.AsFloat := 0;
  QMCondAgrArticulosDTO3.AsFloat := 0;
  QMCondAgrArticulosTRASPASAR.AsInteger := 1;
end;

end.
