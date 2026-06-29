unit UOpeDMEmpleados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, ExtDlgs,
  jpeg, ImgList, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBQuery,
  FIBDataSetRO, ExtCtrls, GIFImage, HYFIBQuery, frxClass, frxHYReport;

type
  TOpeDMEmpleados = class(TDataModule)
     TLocal: THYTransaction;
     QMEmpleados: TFIBTableSet;
     DSQMEmpleados: TDataSource;
     QMEmpleadosEMPRESA: TIntegerField;
     QMEmpleadosEJERCICIO: TIntegerField;
     QMEmpleadosCANAL: TIntegerField;
     QMEmpleadosEMPLEADO: TIntegerField;
     QMEmpleadosTERCERO: TIntegerField;
     QMEmpleadosCATEGORIA: TFIBStringField;
     QMEmpleadosCENTRO: TFIBStringField;
     QMEmpleadosDEPARTAMENTO: TFIBStringField;
     QMEmpleadosSECCION: TFIBStringField;
     QMEmpleadosCALENDARIO: TIntegerField;
     QMEmpleadosN_SEGURIDAD_SOCIAL: TFIBStringField;
     QMEmpleadosTIPO_CONTRATO: TFIBStringField;
     QMEmpleadosINI_CONTRATO: TDateTimeField;
     QMEmpleadosFIN_CONTRATO: TDateTimeField;
     QMEmpleadosFECHA_NACIMIENTO: TDateTimeField;
     QMEmpleadosESTADO_CIVIL: TFIBStringField;
     QMEmpleadosNOTAS: TBlobField;
     QMEmpleadosIMAGEN: TMemoField;
     QMEmpleadosCODIGO_TARJETA: TFIBStringField;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEMPLEADO: TIntegerField;
     QMDetalleIMPUTACION: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleDESCRIPCION: TFIBStringField;
     QMDetalleIMPORTE: TFloatField;
     QMDetalleFECHA_INI: TDateTimeField;
     QMDetalleFECHA_FIN: TDateTimeField;
     QMDetalleACTIVO: TIntegerField;
     frEmpleados: TfrHYReport;
     frDBQMDetalle: TfrDBDataSet;
     QMEmpleadosUSUARIO: TIntegerField;
     xRecurso: TFIBTableSet;
     xRecursoEMPRESA: TIntegerField;
     xRecursoRECURSO: TFIBStringField;
     xRecursoTITULO: TFIBStringField;
     xRecursoUNIDAD: TFIBStringField;
     xRecursoTIPORECURSO: TFIBStringField;
     xRecursoIMPORTE: TFloatField;
     QMEmpleadosIMPUTACION: TIntegerField;
     xImputacion: TFIBDataSetRO;
     xImputacionDESCRIPCION: TFIBStringField;
     QMEmpleadosTIPOIMPUTACION: TIntegerField;
     QMEmpleadosHORARIO: TFIBStringField;
     QMEmpleadosRECURSO: TFIBStringField;
     QMEmpleadosID_IMAGEN: TIntegerField;
     QMEmpleadosDescTercero: TStringField;
     QMEmpleadosTIPOTAREA: TFIBStringField;
     QMTipoImputacion: TFIBDataSetRO;
     QMTipoImputacionDESCRIPCION: TFIBStringField;
     DSQMTImputacion: TDataSource;
     QMDetalleHoras: TIntegerField;
     xTipoImputacionH: TFIBDataSetRO;
     xImputacionIMPUTACION: TFIBStringField;
     DSxImputacion: TDataSource;
     xTipoImputacionHTIPO_IMPUTACION: TFIBStringField;
     xTipoImputacionHHORAS: TIntegerField;
     QMEmpleadosFORMACION_INI: TBlobField;
     QMEmpleadosEXPERIENCIA_PROF: TBlobField;
     QMFormacion: TFIBTableSet;
     DSFormacion: TDataSource;
     QMFormacionEMPRESA: TIntegerField;
     QMFormacionEMPLEADO: TIntegerField;
     QMFormacionLINEA: TIntegerField;
     QMFormacionFECHA: TDateTimeField;
     QMFormacionCURSO: TIntegerField;
     QMFormacionEVALUACION: TIntegerField;
     QMFormacionCOSTE: TFloatField;
     QMFormacionISO_APROBADO: TIntegerField;
     QMFormacionISO_VERIFICADO: TIntegerField;
     QMFormacionISO_VALIDADO: TIntegerField;
     QMFormacionLUGAR: TFIBStringField;
     QMFormacionDescCurso: TStringField;
     xDescCurso: TFIBDataSetRO;
     DSDescCurso: TDataSource;
     xDescCursoDESCRIPCION: TFIBStringField;
     frFormacion: TfrHYReport;
     frDBQMFormacion: TfrDBDataSet;
     xDireccionEmp: TFIBDataSetRO;
     xDireccionEmpTERCERO: TIntegerField;
     xDireccionEmpNOMBRE_R_SOCIAL: TFIBStringField;
     xDireccionEmpNOMBRE_COMERCIAL: TFIBStringField;
     xDireccionEmpTIPO_RAZON: TFIBStringField;
     xDireccionEmpNIF: TFIBStringField;
     xDireccionEmpFECHA_ALTA: TDateTimeField;
     xDireccionEmpNOTAS: TBlobField;
     xDireccionEmpTELEFONO01: TFIBStringField;
     xDireccionEmpTELEFONO02: TFIBStringField;
     xDireccionEmpTELEFAX: TFIBStringField;
     xDireccionEmpEMAIL: TFIBStringField;
     xDireccionEmpWEB: TFIBStringField;
     xDireccionEmpIMAGEN: TIntegerField;
     xDireccionEmpTERCERO1: TIntegerField;
     xDireccionEmpDIRECCION: TIntegerField;
     xDireccionEmpDIR_TIPO: TFIBStringField;
     xDireccionEmpDIR_NOMBRE: TFIBStringField;
     xDireccionEmpDIR_NOMBRE_2: TFIBStringField;
     xDireccionEmpDIR_NUMERO: TFIBStringField;
     xDireccionEmpDIR_BLOQUE_ESCALERA: TFIBStringField;
     xDireccionEmpDIR_PISO: TFIBStringField;
     xDireccionEmpDIR_PUERTA: TFIBStringField;
     xDireccionEmpDIR_COMPLETA: TFIBStringField;
     xDireccionEmpDIR_LOCALIDAD: TFIBStringField;
     xDireccionEmpDIR_COMPLETA_N: TFIBStringField;
     xDireccionEmpDIR_CLASE: TIntegerField;
     xDireccionEmpDIR_TELEFONO01: TFIBStringField;
     xDireccionEmpDIR_TELEFONO02: TFIBStringField;
     xDireccionEmpDIR_TELEFAX: TFIBStringField;
     xDireccionEmpDIR_DEFECTO: TIntegerField;
     xDireccionEmpID_LOCAL: TIntegerField;
     xDireccionEmpLOCALIDAD: TFIBStringField;
     xDireccionEmpTITULO: TFIBStringField;
     xDireccionEmpCODIGO_POSTAL: TFIBStringField;
     xDireccionEmpPAIS: TFIBStringField;
     xDireccionEmpPROVINCIA: TFIBStringField;
     xDireccionEmpID_LOCAL1: TIntegerField;
     DSxDireccionEmp: TDataSource;
     QMEmpleadosID_EMPLEADO: TIntegerField;
     QMEmpleadosFORMACIONESPHAB: TBlobField;
     frLstResumenEmpl: TfrHYReport;
     frDBLstResumenEmpl: TfrDBDataSet;
     xVerCursoEmpl: TFIBDataSetRO;
     DSxVerCursoEmpl: TDataSource;
     xVerCursoEmplEMPRESA: TIntegerField;
     xVerCursoEmplEJERCICIO: TIntegerField;
     xVerCursoEmplID_CURSO: TIntegerField;
     xVerCursoEmplID_EMPLEADO: TIntegerField;
     xVerCursoEmplTITULO_EMPL: TFIBStringField;
     xVerCursoEmplDESC_CURSO: TFIBStringField;
     xVerCursoEmplRESULTADO: TIntegerField;
     xVerCursoEmplDESC_RESULTADO: TFIBStringField;
     xVerCursoEmplFECHA_INICIO: TDateTimeField;
     xVerCursoEmplFECHA_FIN: TDateTimeField;
     frDBVerCursos: TfrDBDataSet;
     QMEmpleadosCTA_DEVENGO: TFIBStringField;
     QMEmpleadosCTA_RETENCION: TFIBStringField;
     QMEmpleadosCTA_REMUNERACION: TFIBStringField;
     QMEmpleadosCTA_SEG_SOCIAL: TFIBStringField;
     QMEmpleadosCTA_DEVENGO_PGC: TIntegerField;
     QMEmpleadosCTA_RETENCION_PGC: TIntegerField;
     QMEmpleadosCTA_REMUNERACION_PGC: TIntegerField;
     QMEmpleadosCTA_SEG_SOCIAL_PGC: TIntegerField;
     QMEmpleadosCTA_ANTICIPO: TFIBStringField;
     QMEmpleadosCTA_ANTICIPO_PGC: TIntegerField;
     QMEmpleadosTITULO: TFIBStringField;
     QMEmpleadosCTA_SEG_SOCIAL_EMPRESA: TFIBStringField;
     QMEmpleadosCTA_SEG_SOCIAL_EMPRESA_PGC: TIntegerField;
     TUpdate: THYTransaction;
     QMEmpleadosNIF: TFIBStringField;
     QMEmpleadosTELEFONO01: TFIBStringField;
     QMEmpleadosTELEFONO02: TFIBStringField;
     xSecciones: TFIBTableSet;
     DSSecciones: TDataSource;
     xSeccionesEMPRESA: TIntegerField;
     xSeccionesEMPLEADO: TIntegerField;
     xSeccionesSECCION: TFIBStringField;
     xSeccionesID_EMPLEADO: TIntegerField;
     xSeccionesDESCRIPCION: TFIBStringField;
     QMEmpleadosCODIGO_GESTORIA: TFIBStringField;
     QMEmpleadosCTA_COBROS_ESPECIE_SOCIO: TFIBStringField;
     QMEmpleadosCTA_ING_SERVICIOS_SOCIALES: TFIBStringField;
     QMEmpleadosCTA_CE_RETA: TFIBStringField;
     QMEmpleadosCTA_ICECES: TFIBStringField;
     QMEmpleadosCTA_COBROS_ESPECIE_SOCIO_PGC: TIntegerField;
     QMEmpleadosCTA_ING_SERVICIOS_SOCIALES_PGC: TIntegerField;
     QMEmpleadosCTA_CE_RETA_PGC: TIntegerField;
     QMEmpleadosCTA_ICECES_PGC: TIntegerField;
     QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO: TFIBStringField;
     QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO_PGC: TIntegerField;
     xHorasCompensar: TFIBTableSet;
     DSxHorasCompensar: TDataSource;
     xHorasCompensarID: TIntegerField;
     xHorasCompensarEMPRESA: TIntegerField;
     xHorasCompensarEMPLEADO: TIntegerField;
     xHorasCompensarID_EMPLEADO: TIntegerField;
     xHorasCompensarFECHA: TDateTimeField;
     xHorasCompensarHORAS: TFloatField;
     xHorasCompensarTIPO: TFIBStringField;
     xHorasCompensarSALDO_HORAS: TFloatField;
     xHorasCompensarID_MARCAJE_PRESENCIA: TIntegerField;
     xHorasCompensarCOMENTARIO: TFIBStringField;
     QMEmpleadosMINUSVALIA: TIntegerField;
     QMEmpleadosAPTO: TIntegerField;
     QMEmpleadosCLIENTE: TIntegerField;
     QMEmpleadosTERCERO_CLIENTE: TIntegerField;
     QMEmpleadosDIRECCION_CLIENTE: TIntegerField;
     QMEmpleadosPAIS_TERCERO: TFIBStringField;
     QMEmpleadosTIPO_DOC_IDENT: TFIBStringField;
     QMEmpleadosDIRECCION: TIntegerField;
     QMEmpleadosDIR_NOMBRE: TFIBStringField;
     QMEmpleadosDIR_NOMBRE_2: TFIBStringField;
     QMEmpleadosDIR_NOMBRE_3: TFIBStringField;
     QMEmpleadosDIR_NUMERO: TFIBStringField;
     QMEmpleadosDIR_BLOQUE_ESCALERA: TFIBStringField;
     QMEmpleadosDIR_PISO: TFIBStringField;
     QMEmpleadosDIR_PUERTA: TFIBStringField;
     QMEmpleadosDIR_LOCALIDAD: TFIBStringField;
     QMEmpleadosTITULO_LOCALIDAD: TFIBStringField;
     QMEmpleadosCODIGO_POSTAL: TFIBStringField;
     QMEmpleadosPROVINCIA: TFIBStringField;
     QMEmpleadosPAIS: TFIBStringField;
     QMEmpleadosDIR_TIPO: TFIBStringField;
     QMEmpleadosBANCO: TIntegerField;
     QMEmpleadosENTIDAD: TFIBStringField;
     QMEmpleadosSUCURSAL: TFIBStringField;
     QMEmpleadosCONTROL: TFIBStringField;
     QMEmpleadosCUENTA: TFIBStringField;
     QMEmpleadosIBAN: TFIBStringField;
     QMEmpleadosBIC: TFIBStringField;
     QMEmpleadosCTA_EMBARGO: TFIBStringField;
     QMEmpleadosCTA_EMBARGO_PGC: TIntegerField;
     QMEmpleadosGENERO: TFIBStringField;
     QMEmpleadosCONTACTO_NOMBRE: TFIBStringField;
     QMEmpleadosCONTACTO_PARENTESCO: TFIBStringField;
     QMEmpleadosCONTACTO_TELEFONO: TFIBStringField;
     QMEmpleadosEMAIL: TFIBStringField;
     xContratos: TFIBTableSet;
     DSxContratos: TDataSource;
     xContratosEMPRESA: TIntegerField;
     xContratosEMPLEADO: TIntegerField;
     xContratosCONTRATO: TIntegerField;
     xContratosID_EMPLEADO: TIntegerField;
     xContratosNUM_CONTRATO: TFIBStringField;
     xContratosFECHA_INICIO_CONTRATO: TDateTimeField;
     xContratosFECHA_FIN_CONTRATO: TDateTimeField;
     xContratosFECHA_AVISO_FIN: TDateTimeField;
     xContratosACTIVO: TIntegerField;
     xContratosTIPO_CONTRATO: TFIBStringField;
     xContratosCOMENTARIO: TMemoField;
     xContratosDIAS_CONTRATO: TFloatField;
     QMEmpleadosFEC_ULTIMA_LLAMADA: TDateTimeField;
     QMEmpleadosACTIVO: TIntegerField;
     xIncapacidadTransitoria: TFIBTableSet;
     DSxIncapacidadTransitoria: TDataSource;
     xIncapacidadTransitoriaEMPRESA: TIntegerField;
     xIncapacidadTransitoriaEMPLEADO: TIntegerField;
     xIncapacidadTransitoriaID_EMPLEADO: TIntegerField;
     xIncapacidadTransitoriaLINEA: TIntegerField;
     xIncapacidadTransitoriaFECHA_INICIO: TDateTimeField;
     xIncapacidadTransitoriaFECHA_FIN: TDateTimeField;
     xIncapacidadTransitoriaTIPO: TFIBStringField;
     xIncapacidadTransitoriaTITULO: TFIBStringField;
     xIncapacidadTransitoriaCOMENTARIO: TFIBStringField;
     xIncapacidadTransitoriaNOMBRE_R_SOCIAL: TFIBStringField;
     xContratosFECHA_SUSPENCION_CONTRATO: TDateTimeField;
     xContratosSUSPENDIDO: TIntegerField;
     QMEmpleadosSUSPENCION_CONTRATO: TDateTimeField;
     QMEmpleadosCONTRATO_SUSPENDIDO: TIntegerField;
     QMEmpleadosPAIS_DIRECCION: TFIBStringField;
     QMEmpleadosREGION_DIRECCION: TFIBStringField;
     QMEmpleadosPOBLACION_DIRECCION: TFIBStringField;
     QMEmpleadosCODIGO_POSTAL_DIRECCION: TFIBStringField;
     QMEmpleadosPROVINCIA_DIRECCION: TFIBStringField;
     QMEmpleadosSUELDO_BASE: TFloatField;
     QMEmpleadosGRATIFICACION: TFloatField;
     QMEmpleadosNACIONALIDAD: TFIBStringField;
     QMEmpleadosAFP: TFIBStringField;
     QMEmpleadosISAPRE: TFIBStringField;
     QMEmpleadosPLAN_ISAPRE: TFloatField;
     QMEmpleadosFONASA: TFloatField;
     QMEmpleadosFECHA_INGRESO: TDateTimeField;
     QMEmpleadosCAJA_COMPENSACION: TFIBStringField;
     QMEmpleadosCOLACION: TFloatField;
     QMEmpleadosMOVILIZACION: TFloatField;
     QMConCuenHab: TFIBTableSet;
     DSQMConCuenHab: TDataSource;
     QMConCuenDes: TFIBTableSet;
     DSQMConCuenDes: TDataSource;
     QMConCuenPar: TFIBTableSet;
     DSQMConCuenPar: TDataSource;
     QMConCuenHabEMPRESA: TIntegerField;
     QMConCuenHabEJERCICIO: TIntegerField;
     QMConCuenHabCANAL: TIntegerField;
     QMConCuenHabEMPLEADO: TIntegerField;
     QMConCuenHabPERIODO: TFIBStringField;
     QMConCuenHabCODIGO: TFIBStringField;
     QMConCuenHabIMPORTE: TFloatField;
     QMConCuenHabGLOSA: TFIBStringField;
     QMConCuenParEMPRESA: TIntegerField;
     QMConCuenParEJERCICIO: TIntegerField;
     QMConCuenParCANAL: TIntegerField;
     QMConCuenParEMPLEADO: TIntegerField;
     QMConCuenParPERIODO: TFIBStringField;
     QMConCuenParCODIGO: TFIBStringField;
     QMConCuenParIMPORTE: TFloatField;
     QMConCuenParDATO_TEXTO: TFIBStringField;
     QMConCuenParDATO_FECHA: TDateTimeField;
     QMConCuenParGLOSA: TFIBStringField;
     QMConCuenParTIPO_DATO: TFIBStringField;
     QMConCuenDesEMPRESA: TIntegerField;
     QMConCuenDesEJERCICIO: TIntegerField;
     QMConCuenDesCANAL: TIntegerField;
     QMConCuenDesEMPLEADO: TIntegerField;
     QMConCuenDesPERIODO: TFIBStringField;
     QMConCuenDesCODIGO: TFIBStringField;
     QMConCuenDesIMPORTE: TFloatField;
     QMConCuenDesGLOSA: TFIBStringField;
     QMConCuenHabCUENTA: TFIBStringField;
     QMConCuenDesCUENTA: TFIBStringField;
     QMConCuenHabSIGNO: TFIBStringField;
     QMConCuenDesSIGNO: TFIBStringField;
     xContratosMOTIVO_FINALIZACION: TFIBStringField;
     xContratosCODIGO_FINALIZACION_CHL: TIntegerField;
     QMEmpleadosGENERA_GRATIFICACION: TIntegerField;
     QMIncapacidad: TFIBTableSet;
     DSQMIncapacidad: TDataSource;
     QMIncapacidadTIPO: TFIBStringField;
     QMIncapacidadTITULO: TFIBStringField;
     QMEmpleadosAPELLIDO_PATERNO: TFIBStringField;
     QMEmpleadosAPELLIDO_MATERNO: TFIBStringField;
     QMEmpleadosNOMBRE: TFIBStringField;
     QMEmpleadosJORNADA: TIntegerField;
     QMEmpleadosTIPO_JORNADA: TIntegerField;
     QMEmpleadosHORAS: TIntegerField;
     QMEmpleadosAREA: TIntegerField;
     QMEmpleadosCENTRO_DE_COSTO: TIntegerField;
     QMEmpleadosVENCIMIENTO_PLAZO_FIJO: TDateTimeField;
     QMEmpleadosMEDIO_DE_PAGO: TFIBStringField;
     QMEmpleadosTIPO_CUENTA: TIntegerField;
     QMNomCab: TFIBTableSet;
     QMNomCabID: TIntegerField;
     QMNomCabEMPRESA: TIntegerField;
     QMNomCabEJERCICIO: TIntegerField;
     QMNomCabCANAL: TIntegerField;
     QMNomCabEMPLEADO: TIntegerField;
     QMNomCabPERIODO: TFIBStringField;
     QMNomCabCERRADO: TIntegerField;
     QMNomCabEJERCICIO_CIERRE: TIntegerField;
     QMNomCabENTRADA: TIntegerField;
     QMNomCabFECHA_INI_PERIODO: TDateTimeField;
     QMNomCabESTADO: TIntegerField;
     QMNomCabFECHA: TDateTimeField;
     QMNomCabFECHA_FIN_PERIODO: TDateTimeField;
     QMNomCabFECHA_COBRO: TDateTimeField;
     QMNomCabTDEVENGO: TFloatField;
     QMNomCabTDEDUCCION: TFloatField;
     QMNomCabPERCIBIR: TFloatField;
     QMNomCabNOMBRE_R_SOCIAL: TFIBStringField;
     QMNomCabNIF: TFIBStringField;
     QMNomCabCATEGORIA: TFIBStringField;
     QMNomCabTERCERO: TIntegerField;
     QMNomCabDEPARTAMENTO: TFIBStringField;
     QMNomCabSECCION: TFIBStringField;
     QMNomCabN_SEGURIDAD_SOCIAL: TFIBStringField;
     QMNomCabINI_CONTRATO: TDateTimeField;
     QMNomCabTITULO_PERIODO: TFIBStringField;
     QMNomCabID_EMPLEADO: TIntegerField;
     QMNomCabLISTADO: TIntegerField;
     QMNomCabPAGADO: TIntegerField;
     QMNomCabRIC_CIERRE: TIntegerField;
     QMNomCabEJERCICIO_PAGO: TIntegerField;
     QMNomCabRIC_PAGO: TIntegerField;
     QMNomCabIMP_PAGADO: TFloatField;
     QMNomCabIMP_ANTICIPO: TFloatField;
     QMNomCabCUENTA_PAGO: TFIBStringField;
     QMNomCabFECHA_PAGO: TDateTimeField;
     DSQMNomCab: TDataSource;
     QMIncapacidadPARAMETRO_AUS: TFIBStringField;
     QMNomCabTOTAL_LIQUIDO: TFloatField;
     QMNomCabTOTAL_HABERES: TFloatField;
     QMNomCabTOTAL_DESCUENTOS: TFloatField;
     QMEmpleadosCTA_CUENTA_CHL: TFIBStringField;
     QMEmpleadosCTA_PRESTAMO_CHL: TFIBStringField;
     QMEmpleadosCTA_LEYES_SOCIALES_CHL: TFIBStringField;
     QMEmpleadosCTA_FONASA_CHL: TFIBStringField;
     QMEmpleadosCTA_CUENTA_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_PRESTAMO_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_LEYES_SOCIALES_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_FONASA_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_IMPUESTO_UNICO_CHL: TFIBStringField;
     QMEmpleadosCTA_MUTUAL_CHL: TFIBStringField;
     QMEmpleadosCTA_IMPUESTO_UNICO_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_MUTUAL_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_GASTO_REMUNERACION_CHL: TFIBStringField;
     QMEmpleadosCTA_MUTUAL_EMPRESA_CHL: TFIBStringField;
     QMEmpleadosCTA_SEGURO_CESANTIA_CHL: TFIBStringField;
     QMEmpleadosCTA_DESCUADRE_CHL: TFIBStringField;
     QMEmpleadosCTA_GASTO_REMUNERACION_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_MUTUAL_EMPRESA_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_SEGURO_CESANTIA_CHL_PGC: TIntegerField;
     QMEmpleadosCTA_DESCUADRE_CHL_PGC: TIntegerField;
     QMEmpleadosPAIS_BANCO: TFIBStringField;
     QMEmpleadosPROYECTO: TIntegerField;
     QMEmpleadosLRE: TFIBStringField;
     frxEmpleados: TfrxHYReport;
     frxFormacion: TfrxHYReport;
     frxLstResumenEmpl: TfrxHYReport;
     xContratosDESC_TIPO_CONTRATO: TFIBStringField;
     xContratosDESC_MOTIVO_FINALIZACION: TFIBStringField;
     QMEmpleadosREPAR_EMPRESA_DST: TIntegerField;
     QMEmpleadosREPAR_SERIE_DST: TFIBStringField;
     xIncapacidadTransitoriaNUM_SECUENCIA_FIE: TFIBStringField;
     procedure OpeDMEmpleadosCreate(Sender: TObject);
     procedure QMEmpleadosAfterOpen(DataSet: TDataSet);
     procedure QMEmpleadosNewRecord(DataSet: TDataSet);
     procedure QMEmpleadosBeforePost(DataSet: TDataSet);
     procedure QMEmpleadosAfterDelete(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleIMPUTACIONChange(Sender: TField);
     procedure frEmpleadosGetValue(const ParName: string; var ParValue: variant);
     procedure frEmpleadosEnterRect(Memo: TStringList; View: TfrView);
     procedure QMEmpleadosRECURSOChange(Sender: TField);
     procedure QMEmpleadosIMPUTACIONChange(Sender: TField);
     procedure QMEmpleadosDescTerceroGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMFormacionNewRecord(DataSet: TDataSet);
     procedure QMFormacionDescCursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFormacionCURSOChange(Sender: TField);
     procedure frFormacionGetValue(const ParName: string; var ParValue: variant);
     procedure frLstResumenEmplGetValue(const ParName: string; var ParValue: variant);
     procedure QMEmpleadosBeforeClose(DataSet: TDataSet);
     procedure xSeccionesNewRecord(DataSet: TDataSet);
     procedure xSeccionesSECCIONChange(Sender: TField);
     procedure xHorasCompensarNewRecord(DataSet: TDataSet);
     procedure xHorasCompensarBeforePost(DataSet: TDataSet);
     procedure xHorasCompensarAfterPost(DataSet: TDataSet);
     procedure QMEmpleadosCLIENTEChange(Sender: TField);
     procedure QMEmpleadosDIR_LOCALIDADChange(Sender: TField);
     procedure QMEmpleadosTERCEROChange(Sender: TField);
     procedure xContratosNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xIncapacidadTransitoriaNewRecord(DataSet: TDataSet);
     procedure xContratosAfterPost(DataSet: TDataSet);
     procedure QMEmpleadosEMPLEADOChange(Sender: TField);
     procedure xIncapacidadTransitoriaAfterPost(DataSet: TDataSet);
     procedure QMIncapacidadNewRecord(DataSet: TDataSet);
     procedure QMEmpleadosPLAN_ISAPREGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMEmpleadosPOBLACION_DIRECCIONChange(Sender: TField);
  private
     { Private declarations }
     HorasCompensarFechaIni: TDateTime;
     SQLBase: TStrings;
     FiltroActivo: integer;
     {function ExistePeriodo(Modo, Empleado: integer; Periodo: string): boolean;}
     function DameTipoContingencia(Contingencia: string): string;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraEmpleadoActivo(Filtro: integer);
     procedure FiltraEmpleado(Filtro: string);
     procedure CambiarTercero(Tercero: integer);
     procedure SetHorasCompensarFechaIni(Fecha: TDateTime);
     procedure RefrescaConceptoNomina(Periodo: string);
     procedure RegenerarConceptosNomina(Empleado: integer; Periodo: string);
     procedure RellenaConceptoPeriodoAnterior(Empleado: integer; Periodo: string);
     procedure EliminarConceptosNomina(Empleado: integer; Periodo: string);
     function DameTituloTipoContrato(Tipo: string): string;
     function DameDescripcionJornada(Codigo: integer): string;
     function DameDescripcionTipoJornada(Codigo: integer): string;
     function DameDescripcionArea(Codigo: integer): string;
     function DameDescripcionCentroCosto(Codigo: integer): string;
     procedure UpdateValor(IdNomina: integer; Concepto: string; Importe: integer);
     procedure RellenaCuentasDefecto;
     procedure ImportaAusenciasFIE;
  end;

var
  OpeDMEmpleados : TOpeDMEmpleados;

implementation

uses UDMMain, UFBusca, UEntorno, UFormGest, Mask, UUtiles, UDameDato, DateUtils,
  UOpeFMEmpleados, UDMListados, UHojaCalc, UFInformacionEnvioDte;

{$R *.DFM}

procedure TOpeDMEmpleados.OpeDMEmpleadosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMEmpleados, MascaraN, MascaraI, ShortDateFormat);
  QMEmpleadosSUELDO_BASE.DisplayFormat := MascaraE;
  QMEmpleadosGRATIFICACION.DisplayFormat := MascaraE;
  QMEmpleadosCOLACION.DisplayFormat := MascaraE;
  QMEmpleadosMOVILIZACION.DisplayFormat := MascaraE;
  QMEmpleadosPLAN_ISAPRE.DisplayFormat := MascaraE;
  QMEmpleadosFONASA.DisplayFormat := MascaraE;

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVerCursoEmpl, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSecciones, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMNomCab, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xHorasCompensar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xContratos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMIncapacidad, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xIncapacidadTransitoria, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xHorasCompensar, MascaraN, MascaraI, ShortDateFormat);

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_EMPLEADOS_CUENTAS ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = :EMPRESA AND ');
  SQLBase.Add(' EJERCICIO = :EJERCICIO AND ');
  SQLBase.Add(' CANAL = :CANAL ');

  QMEmpleados.SelectSQL.Text := SQLBase.Text;
  QMEmpleados.SelectSQL.Add(' ORDER BY EMPLEADO ');
  DMMain.FiltraTabla(QMEmpleados, '11100'{, REntorno.DatosAbiertos});
end;

procedure TOpeDMEmpleados.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TOpeDMEmpleados.BusquedaCompleja;
var
  Resultado : integer;
  Orden : string;
begin
  Resultado := TFBusca.Create(Self).SeleccionaBusqueda(QMEmpleados, '11100', False);

  Orden := QMEmpleados.OrdenadoPor;
  QMEmpleados.Ordenar('');
  if (Resultado = mrAll) then
     QMEmpleados.SelectSQL.Text := SQLBase.Text;

  if (FiltroActivo = 1) then
     QMEmpleados.SelectSQL.Add(' AND (ACTIVO = 0) ');
  if (FiltroActivo = 2) then
     QMEmpleados.SelectSQL.Add(' AND (ACTIVO = 1) ');

  QMEmpleados.Ordenar(Orden);

  if (Resultado = mrAll) then
     DMMain.FiltraTabla(QMEmpleados, '11100')
  else
     QMEmpleados.Open;
end;

procedure TOpeDMEmpleados.QMEmpleadosAfterOpen(DataSet: TDataSet);
begin
  xRecurso.Open;
  xImputacion.Open;
  QMDetalle.Open;
  QMTipoImputacion.Open;
  QMFormacion.Open;
  xDireccionEmp.Open;
  xSecciones.Open;
  xContratos.Open;

  xHorasCompensar.Close;
  xHorasCompensar.Params.ByName['FECHA_INI'].AsDateTime := HorasCompensarFechaIni;
  xHorasCompensar.Open;

  xVerCursoEmpl.Open;

  xIncapacidadTransitoria.Open;
  QMIncapacidad.Open;

  QMNomCab.Open;
end;

procedure TOpeDMEmpleados.QMEmpleadosBeforeClose(DataSet: TDataSet);
begin
  xRecurso.Close;
  xImputacion.Close;
  QMDetalle.Close;
  QMTipoImputacion.Close;
  QMFormacion.Close;
  xDireccionEmp.Close;
  xSecciones.Close;
  xVerCursoEmpl.Close;
  xHorasCompensar.Close;
  xContratos.Close;
  xIncapacidadTransitoria.Close;
  QMIncapacidad.Close;
end;

procedure TOpeDMEmpleados.QMEmpleadosNewRecord(DataSet: TDataSet);
begin
  QMEmpleadosEMPRESA.AsInteger := REntorno.Empresa;
  QMEmpleadosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEmpleadosCANAL.AsInteger := REntorno.Canal;
  // ver
  QMEmpleadosID_EMPLEADO.AsInteger := 0;
  QMEmpleadosACTIVO.AsInteger := 1;

  QMEmpleadosPAIS_TERCERO.AsString := REntorno.Pais;
  QMEmpleadosFECHA_NACIMIENTO.AsDateTime := REntorno.FechaTrab;
  QMEmpleadosINI_CONTRATO.AsDateTime := REntorno.FechaTrab;
  QMEmpleadosFIN_CONTRATO.AsDateTime := REntorno.FechaTrab;
  QMEmpleadosUSUARIO.AsInteger := REntorno.Usuario;
  QMEmpleadosTIPOIMPUTACION.AsInteger := 1; //Tipo Recurso
  QMEmpleadosID_IMAGEN.AsInteger := 0;
  QMEmpleadosCTA_DEVENGO.AsString := '';
  QMEmpleadosCTA_RETENCION.AsString := '';
  QMEmpleadosCTA_REMUNERACION.AsString := '';
  QMEmpleadosCTA_SEG_SOCIAL.AsString := '';
  QMEmpleadosCTA_ANTICIPO.AsString := '';
  QMEmpleadosCTA_SEG_SOCIAL_EMPRESA.AsString := '';
  QMEmpleadosCTA_COBROS_ESPECIE_SOCIO.AsString := '';
  QMEmpleadosCTA_ING_SERVICIOS_SOCIALES.AsString := '';
  QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO.AsString := '';
  QMEmpleadosCTA_ICECES.AsString := '';
  QMEmpleadosCTA_CE_RETA.AsString := '';
  QMEmpleadosCTA_EMBARGO.AsString := '';

  // Cuentas Chile
  QMEmpleadosCTA_CUENTA_CHL.AsString := '';
  QMEmpleadosCTA_PRESTAMO_CHL.AsString := '';
  QMEmpleadosCTA_LEYES_SOCIALES_CHL.AsString := '';
  QMEmpleadosCTA_FONASA_CHL.AsString := '';

  RellenaCuentasDefecto;

  QMEmpleadosCTA_DEVENGO_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_RETENCION_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_REMUNERACION_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_SEG_SOCIAL_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_ANTICIPO_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_SEG_SOCIAL_EMPRESA_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_COBROS_ESPECIE_SOCIO_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_ING_SERVICIOS_SOCIALES_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_ICECES_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_CE_RETA_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_EMBARGO_PGC.AsInteger := REntorno.PGC;

  // Cuentas Chile
  QMEmpleadosCTA_CUENTA_CHL_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_PRESTAMO_CHL_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_LEYES_SOCIALES_CHL_PGC.AsInteger := REntorno.PGC;
  QMEmpleadosCTA_FONASA_CHL_PGC.AsInteger := REntorno.PGC;

  if (REntorno.Pais = 'CHL') then
     QMEmpleadosDIR_LOCALIDAD.AsString := '99999999';

  QMEmpleadosPAIS_DIRECCION.AsString := REntorno.Pais;
  QMEmpleadosCATEGORIA.AsString := 'DES';
  QMEmpleadosCENTRO.AsString := 'DES';
  QMEmpleadosDEPARTAMENTO.AsString := 'DES';
  QMEmpleadosSECCION.AsString := 'DES';
  QMEmpleadosCALENDARIO.AsInteger := 1;
  QMEmpleadosTIPO_CONTRATO.AsString := 'DES';
  QMEmpleadosHORARIO.AsString := 'DES';
  QMEmpleadosRECURSO.AsString := 'MO';
  QMEmpleadosMINUSVALIA.AsInteger := 0;
  QMEmpleadosAPTO.AsInteger := 1;
  QMEmpleadosGENERO.AsString := ' ';
  QMEmpleadosDIR_TIPO.AsString := 'CL';
  QMEmpleadosCONTRATO_SUSPENDIDO.AsInteger := 0;
  QMEmpleadosPROYECTO.AsInteger := 0;
  QMEmpleadosPOBLACION_DIRECCION.AsString := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT C.CLIENTE, C.TERCERO, D.DIRECCION ');
        SQL.Add(' FROM SYS_EMPRESAS E ');
        SQL.Add(' JOIN EMP_CLIENTES C ON C.EMPRESA = E.EMPRESA AND C.TERCERO = E.TERCERO ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON E.TERCERO = D.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.EMPRESA = :EMPRESA AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        SQL.Add(' ORDER BY C.CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        QMEmpleadosCLIENTE.AsInteger := FieldByName['CLIENTE'].AsInteger;
        QMEmpleadosTERCERO_CLIENTE.AsInteger := FieldByName['TERCERO'].AsInteger;
        QMEmpleadosDIRECCION_CLIENTE.AsInteger := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMEmpleadosEMPLEADO.AsInteger := DMMain.Contador_Libre('ZEM', QMEmpleadosEMPLEADO.AsInteger);
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosAfterDelete(DataSet: TDataSet);
begin
  QMEmpleadosIMAGEN.Clear;
end;

procedure TOpeDMEmpleados.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if (QMEmpleados.State in [dsInsert, dsEdit]) then
  begin
     QMEmpleados.Post;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMEmpleadosEMPRESA.AsInteger;
  QMDetalleEMPLEADO.AsInteger := QMEmpleadosEMPLEADO.AsInteger;
  QMDetalleFECHA_INI.AsDateTime := REntorno.FechaTrabSH;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM OPE_EMPLEADO_PRE WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := QMEmpleadosEMPRESA.AsInteger;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadosEMPLEADO.AsInteger;
        ExecQuery;
        QMDetalleLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.QMDetalleIMPUTACIONChange(Sender: TField);
begin
  xImputacion.Close;
  xImputacion.Open;
  QMDetalleDESCRIPCION.AsString := xImputacionDESCRIPCION.AsString;

  xTipoImputacionH.Close;
  xTipoImputacionH.Params.ByName['IMPUTACION'].AsString := xImputacionIMPUTACION.AsString;
  xTipoImputacionH.Open;
  QMDetalleHoras.AsInteger := xTipoImputacionHHORAS.AsInteger;
end;

procedure TOpeDMEmpleados.frEmpleadosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'Activo' then
     if QMDetalleACTIVO.AsInteger = 1 then
        ParValue := 'S'
     else
        ParValue := 'N';

  if (ParName = 'TImputacion') then
  begin
     if (QMEmpleadosTIPOIMPUTACION.AsInteger = 1) then //Recurso
        ParValue := _('Recurso') + ': ' + QMEmpleadosRECURSO.AsString + ' ' + xRecursoTITULO.AsString
     else
        ParValue := _('Imputación') + ': ' + QMEmpleadosIMPUTACION.AsString + ' ' + xImputacionDESCRIPCION.AsString;
  end;

  if (ParName = 'Tercero') then
     ParValue := DameTituloTercero(QMEmpleadosTERCERO.AsInteger);

  if (ParName = 'Categoria') then
     ParValue := OpeFMEmpleados.DescCategoria.Text;

  if (ParName = 'Centro') then
     ParValue := OpeFMEmpleados.DescCentro.Text;

  if (ParName = 'Departamento') then
     ParValue := OpeFMEmpleados.DescDepartamento.Text;

  if (ParName = 'Seccion') then
     ParValue := OpeFMEmpleados.DescSeccion.Text;

  if (ParName = 'TipoContrato') then
     ParValue := OpeFMEmpleados.DescTipoContrato.Text;

  if (ParName = 'Calendario') then
     ParValue := OpeFMEmpleados.DescCalendario.Text;
end;

procedure TOpeDMEmpleados.frEmpleadosEnterRect(Memo: TStringList; View: TfrView);
begin
  if Memo.Count > 0 then
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := MascaraN;
end;

procedure TOpeDMEmpleados.QMEmpleadosRECURSOChange(Sender: TField);
begin
  with xRecurso do
  begin
     Close;
     Params.ByName['RECURSO'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosIMPUTACIONChange(Sender: TField);
begin
  QMTipoImputacion.Close;
  QMTipoImputacion.Open;
end;

procedure TOpeDMEmpleados.QMEmpleadosDescTerceroGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTercero(QMEmpleadosTERCERO.AsInteger);
end;

procedure TOpeDMEmpleados.QMDetalleCalcFields(DataSet: TDataSet);
begin
  xTipoImputacionH.Close;
  xTipoImputacionH.Params.ByName['IMPUTACION'].AsString := QMDetalleIMPUTACION.AsString;
  xTipoImputacionH.Open;
  QMDetalleHoras.AsInteger := xTipoImputacionHHORAS.AsInteger;
end;

procedure TOpeDMEmpleados.QMFormacionNewRecord(DataSet: TDataSet);
begin
  QMFormacionEMPRESA.AsInteger := REntorno.Empresa;
  QMFormacionEMPLEADO.AsInteger := QMEmpleadosEMPLEADO.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM OPE_EMPLEADO_FORMACION WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := QMEmpleadosEMPRESA.AsInteger;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadosEMPLEADO.AsInteger;
        ExecQuery;
        QMFormacionLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.QMFormacionDescCursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescCurso.Close;
  xDescCurso.Open;

  Text := xDescCursoDESCRIPCION.AsString;
end;

procedure TOpeDMEmpleados.QMFormacionCURSOChange(Sender: TField);
begin
  xDescCurso.Close;
  xDescCurso.Open;

  QMFormacionDescCurso.AsString := xDescCursoDESCRIPCION.AsString;
end;

procedure TOpeDMEmpleados.frFormacionGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if (ParName = 'Tercero') then
     ParValue := OpeFMEmpleados.DescTercero.Text;
end;

procedure TOpeDMEmpleados.frLstResumenEmplGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TOpeDMEmpleados.FiltraEmpleadoActivo(Filtro: integer);
begin
  FiltroActivo := Filtro;

  with QMEmpleados do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (FiltroActivo = 1) then
        SelectSQL.Add(' AND (ACTIVO = 0) ');
     if (FiltroActivo = 2) then
        SelectSQL.Add(' AND (ACTIVO = 1) ');
     SelectSQL.Add('ORDER BY EMPLEADO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TOpeDMEmpleados.CambiarTercero(Tercero: integer);
begin
  with QMEmpleados do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := SQLBase.Text;
     SelectSQL.Add(' AND EMPLEADO = 0 ');
     SelectSQL.Add(' ORDER BY EMPLEADO ');
     DMMain.FiltraTabla(QMEmpleados, '11100', True);
     Insert;
     FieldByName('TERCERO').AsInteger := Tercero;
  end;
end;

procedure TOpeDMEmpleados.xSeccionesNewRecord(DataSet: TDataSet);
begin
  xSeccionesEMPRESA.AsInteger := QMEmpleadosEMPRESA.AsInteger;
  xSeccionesEMPLEADO.AsInteger := QMEmpleadosEMPLEADO.AsInteger;
end;

procedure TOpeDMEmpleados.xSeccionesSECCIONChange(Sender: TField);
begin
  xSeccionesDESCRIPCION.AsString := DameTituloSeccion(xSeccionesSECCION.AsString);
end;

procedure TOpeDMEmpleados.xHorasCompensarNewRecord(DataSet: TDataSet);
begin
  xHorasCompensarEMPRESA.AsInteger := REntorno.Empresa;
  xHorasCompensarEMPLEADO.AsInteger := QMEmpleadosEMPLEADO.AsInteger;
  xHorasCompensarFECHA.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TOpeDMEmpleados.xHorasCompensarBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(xHorasCompensar, 'ID_EMPLEADO_HORAS_COMPENSAR', 'ID');
end;

procedure TOpeDMEmpleados.xHorasCompensarAfterPost(DataSet: TDataSet);
begin
  Refrescar(xHorasCompensar, 'ID', xHorasCompensarID.AsInteger);
end;

procedure TOpeDMEmpleados.SetHorasCompensarFechaIni(Fecha: TDateTime);
begin
  HorasCompensarFechaIni := Fecha;

  xHorasCompensar.Close;
  xHorasCompensar.Params.ByName['FECHA_INI'].AsDateTime := HorasCompensarFechaIni;
  xHorasCompensar.Open;

  Refrescar(xHorasCompensar, 'ID', xHorasCompensarID.AsInteger, True, True);
end;

procedure TOpeDMEmpleados.QMEmpleadosCLIENTEChange(Sender: TField);
begin
  QMEmpleadosTERCERO_CLIENTE.AsInteger := DameTercero('CLI', QMEmpleadosCLIENTE.AsInteger);
  QMEmpleadosDIRECCION_CLIENTE.AsInteger := DMMain.DameMinDireccion(QMEmpleadosTERCERO_CLIENTE.AsInteger);
end;

procedure TOpeDMEmpleados.QMEmpleadosDIR_LOCALIDADChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT L.TITULO, L.CODIGO_POSTAL, L.PAIS, P.TITULO AS PROVINCIA');
        SQL.Add(' FROM SYS_LOCALIDADES L ');
        SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' LOCALIDAD = :DIR_LOCALIDAD ');
        Params.ByName['DIR_LOCALIDAD'].AsString := QMEmpleadosDIR_LOCALIDAD.AsString;
        ExecQuery;
        QMEmpleadosTITULO_LOCALIDAD.AsString := FieldByName['TITULO'].AsString;
        QMEmpleadosCODIGO_POSTAL.AsString := FieldByName['CODIGO_POSTAL'].AsString;
        QMEmpleadosPAIS.AsString := FieldByName['PAIS'].AsString;
        QMEmpleadosPROVINCIA.AsString := FieldByName['PROVINCIA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosTERCEROChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT D.DIRECCION, D.DIR_TIPO, D.DIR_NOMBRE, D.DIR_NOMBRE_2, D.DIR_NOMBRE_3, D.DIR_NUMERO, D.DIR_BLOQUE_ESCALERA, ');
        SQL.Add('        D.DIR_PISO, D.DIR_PUERTA, D.DIR_LOCALIDAD, L.TITULO, L.CODIGO_POSTAL, P.TITULO, L.PAIS, B.BANCO, B.ENTIDAD, ');
        SQL.Add('        B.SUCURSAL, B.CONTROL, B.CUENTA, B.IBAN, B.BIC, B.PAIS AS PAIS_BANCO, T.PAIS_TERCERO, T.TIPO_DOC_IDENT, T.NIF, ');
        SQL.Add('        T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.TELEFONO02, T.EMAIL ');
        SQL.Add(' FROM SYS_TERCEROS T ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON D.DIR_LOCALIDAD = L.LOCALIDAD ');
        SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        SQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS B ON T.TERCERO = B.TERCERO AND B.BANCO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.TERCERO = :TERCERO ');
        SQL.Add(' ORDER BY D.DIR_DEFECTO DESC, D.DIRECCION ');
        Params.ByName['TERCERO'].AsInteger := QMEmpleadosTERCERO.AsInteger;
        ExecQuery;
        QMEmpleadosPAIS_TERCERO.AsString := FieldByName['PAIS_TERCERO'].AsString;
        QMEmpleadosTIPO_DOC_IDENT.AsString := FieldByName['TIPO_DOC_IDENT'].AsString;
        QMEmpleadosNIF.AsString := FieldByName['NIF'].AsString;
        QMEmpleadosAPELLIDO_MATERNO.AsString := '';
        QMEmpleadosAPELLIDO_PATERNO.AsString := '';
        QMEmpleadosNOMBRE.AsString := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        QMEmpleadosDIR_TIPO.AsString := FieldByName['DIR_TIPO'].AsString;
        QMEmpleadosDIR_NOMBRE.AsString := FieldByName['DIR_NOMBRE'].AsString;
        QMEmpleadosDIR_NOMBRE_2.AsString := FieldByName['DIR_NOMBRE_2'].AsString;
        QMEmpleadosDIR_NOMBRE_3.AsString := FieldByName['DIR_NOMBRE_3'].AsString;
        QMEmpleadosDIR_NUMERO.AsString := FieldByName['DIR_NUMERO'].AsString;
        QMEmpleadosDIR_BLOQUE_ESCALERA.AsString := FieldByName['DIR_BLOQUE_ESCALERA'].AsString;
        QMEmpleadosDIR_PISO.AsString := FieldByName['DIR_PISO'].AsString;
        QMEmpleadosDIR_PUERTA.AsString := FieldByName['DIR_PUERTA'].AsString;
        QMEmpleadosDIR_LOCALIDAD.AsString := FieldByName['DIR_LOCALIDAD'].AsString;
        QMEmpleadosPAIS_BANCO.AsString := FieldByName['PAIS_BANCO'].AsString;
        QMEmpleadosENTIDAD.AsString := FieldByName['ENTIDAD'].AsString;
        QMEmpleadosSUCURSAL.AsString := FieldByName['SUCURSAL'].AsString;
        QMEmpleadosCONTROL.AsString := FieldByName['CONTROL'].AsString;
        QMEmpleadosCUENTA.AsString := FieldByName['CUENTA'].AsString;
        QMEmpleadosIBAN.AsString := FieldByName['IBAN'].AsString;
        QMEmpleadosBIC.AsString := FieldByName['BIC'].AsString;
        QMEmpleadosTELEFONO01.AsString := FieldByName['TELEFONO01'].AsString;
        QMEmpleadosTELEFONO02.AsString := FieldByName['TELEFONO02'].AsString;
        QMEmpleadosEMAIL.AsString := FieldByName['EMAIL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.xContratosNewRecord(DataSet: TDataSet);
begin
  xContratosEMPRESA.AsInteger := REntorno.Empresa;
  xContratosEMPLEADO.AsInteger := QMEmpleadosEMPLEADO.AsInteger;
  xContratosID_EMPLEADO.AsInteger := QMEmpleadosID_EMPLEADO.AsInteger;
  xContratosACTIVO.AsInteger := 1;
  xContratosFECHA_INICIO_CONTRATO.AsDateTime := REntorno.FechaTrabSH;
  xContratosTIPO_CONTRATO.AsString := QMEmpleadosTIPO_CONTRATO.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(CONTRATO) FROM OPE_EMPLEADOS_CONTRATOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO ');
        Params.ByName['EMPRESA'].AsInteger := QMEmpleadosEMPRESA.AsInteger;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadosEMPLEADO.AsInteger;
        ExecQuery;
        xContratosCONTRATO.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.xIncapacidadTransitoriaNewRecord(DataSet: TDataSet);
begin
  if (QMEmpleados.State in [dsInsert, dsEdit]) then
     QMEmpleados.Post;

  xIncapacidadTransitoriaEMPRESA.AsInteger := QMEmpleadosEMPRESA.AsInteger;
  xIncapacidadTransitoriaEMPLEADO.AsInteger := QMEmpleadosEMPLEADO.AsInteger;
  xIncapacidadTransitoriaID_EMPLEADO.AsInteger := QMEmpleadosID_EMPLEADO.AsInteger;
  xIncapacidadTransitoriaFECHA_INICIO.AsDateTime := REntorno.FechaTrabSH;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM OPE_EMPLEADO_INCAP_TRANS WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := QMEmpleadosEMPRESA.AsInteger;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadosEMPLEADO.AsInteger;
        ExecQuery;
        xIncapacidadTransitoriaLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.FiltraEmpleado(Filtro: string);
begin
  with QMEmpleados do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (Filtro <> '') then
        SelectSQL.Add(' AND (' + Filtro + ') ');
     SelectSQL.Add('ORDER BY EMPLEADO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TOpeDMEmpleados.xContratosAfterPost(DataSet: TDataSet);
var
  Contrato : integer;
begin
  Contrato := xContratosCONTRATO.AsInteger;
  QMEmpleados.Refresh;
  Posicionar(xContratos, 'CONTRATO', Contrato);
end;

function TOpeDMEmpleados.DameTituloTipoContrato(Tipo: string): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION ');
        SQL.Add(' FROM OPE_SYS_TIPOS_CONTRATOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' TIPO = :TIPO ');
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TOpeDMEmpleados.DameDescripcionJornada(Codigo: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION ');
        SQL.Add(' FROM OPE_JORNADA ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TOpeDMEmpleados.DameDescripcionCentroCosto(Codigo: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION ');
        SQL.Add(' FROM OPE_CENTRO_DE_COSTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TOpeDMEmpleados.DameDescripcionArea(Codigo: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION ');
        SQL.Add(' FROM OPE_AREAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TOpeDMEmpleados.DameDescripcionTipoJornada(Codigo: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION ');
        SQL.Add(' FROM OPE_TIPO_JORNADA ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosEMPLEADOChange(Sender: TField);
begin
  // Traigo los datos del empleado si ya existe.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TERCERO, ID_EMPLEADO FROM OPE_EMPLEADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadosEMPLEADO.AsInteger;
        ExecQuery;
        if (QMEmpleadosID_EMPLEADO.AsInteger <> 0) then
        begin
           QMEmpleadosID_EMPLEADO.AsInteger := FieldByName['ID_EMPLEADO'].AsInteger;
           QMEmpleadosTERCERO.AsInteger := FieldByName['TERCERO'].AsInteger;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.RefrescaConceptoNomina(Periodo: string);
begin
  QMConCuenHab.Close;
  QMConCuenHab.Params.ByName['PERIODO'].AsString := Periodo;
  QMConCuenHab.Open;

  QMConCuenDes.Close;
  QMConCuenDes.Params.ByName['PERIODO'].AsString := Periodo;
  QMConCuenDes.Open;

  QMConCuenPar.Close;
  QMConCuenPar.Params.ByName['PERIODO'].AsString := Periodo;
  QMConCuenPar.Open;
end;

procedure TOpeDMEmpleados.EliminarConceptosNomina(Empleado: integer; Periodo: string);
begin
  /// Elimina los conceptos del periodo

  if (Periodo <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' DELETE FROM CON_CUENTAS_GES_EMP_H ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           if Empleado <> 0 then
              SQL.Add(' EMPLEADO = :EMPLEADO AND ');
           SQL.Add(' PERIODO = :PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           if Empleado <> 0 then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;

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
           SQL.Add(' DELETE FROM CON_CUENTAS_GES_EMP_D ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           if Empleado <> 0 then
              SQL.Add(' EMPLEADO = :EMPLEADO AND ');
           SQL.Add(' PERIODO = :PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           if Empleado <> 0 then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;

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
           SQL.Add(' DELETE FROM CON_CUENTAS_GES_EMP_P ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           if Empleado <> 0 then
              SQL.Add(' EMPLEADO = :EMPLEADO AND ');
           SQL.Add(' PERIODO = :PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           if Empleado <> 0 then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;

           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;


procedure TOpeDMEmpleados.RegenerarConceptosNomina(Empleado: integer; Periodo: string);
begin
  /// Inserta los conceptos que falten para el ejercicio
  /// Si EMPLEADO = 0 lo hace para todos los empleados

  if (Periodo <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO CON_CUENTAS_GES_EMP_H ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, CODIGO) ');
           SQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.EMPLEADO, :PERIODO, H.CODIGO ');
           SQL.Add(' FROM VER_EMPLEADOS_CUENTAS C ');
           SQL.Add(' INNER JOIN EMP_CONCEPTO_HABERES H ON C.EMPRESA = H.EMPRESA AND C.EJERCICIO = H.EJERCICIO AND C.CANAL = H.CANAL ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' H.CALCULABLE = 0 AND ');
           SQL.Add(' H.VISIBLE_EN_EMPLEADO = 1 AND ');
           SQL.Add(' C.ACTIVO = 1 AND ');
           SQL.Add(' NOT EXISTS(SELECT EMPLEADO ');
           SQL.Add('            FROM CON_CUENTAS_GES_EMP_H ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = C.EMPRESA AND ');
           SQL.Add('            EJERCICIO = C.EJERCICIO AND ');
           SQL.Add('            CANAL = C.CANAL AND ');
           SQL.Add('            EMPLEADO = C.EMPLEADO AND ');
           SQL.Add('            PERIODO = :PERIODO AND ');
           SQL.Add('            CODIGO = H.CODIGO) ');
           if (Empleado <> 0) then
              SQL.Add(' AND C.EMPLEADO = :EMPLEADO ');
           SQL.Add(' ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.EMPLEADO, H.CODIGO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           if (Empleado <> 0) then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;
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
           SQL.Add(' INSERT INTO CON_CUENTAS_GES_EMP_D ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, CODIGO) ');
           SQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.EMPLEADO, :PERIODO, D.CODIGO ');
           SQL.Add(' FROM VER_EMPLEADOS_CUENTAS C ');
           SQL.Add(' INNER JOIN EMP_CONCEPTO_DESCUENTOS D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' D.CALCULABLE = 0 AND ');
           SQL.Add(' D.VISIBLE_EN_EMPLEADO = 1 AND ');
           SQL.Add(' C.ACTIVO = 1 AND ');
           SQL.Add(' NOT EXISTS(SELECT EMPLEADO ');
           SQL.Add('            FROM CON_CUENTAS_GES_EMP_D ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = C.EMPRESA AND ');
           SQL.Add('            EJERCICIO = C.EJERCICIO AND ');
           SQL.Add('            CANAL = C.CANAL AND ');
           SQL.Add('            EMPLEADO = C.EMPLEADO AND ');
           SQL.Add('            PERIODO = :PERIODO AND ');
           SQL.Add('            CODIGO = D.CODIGO) ');
           if (Empleado <> 0) then
              SQL.Add(' AND C.EMPLEADO = :EMPLEADO ');
           SQL.Add(' ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.EMPLEADO, D.CODIGO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           if (Empleado <> 0) then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;
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
           SQL.Add(' INSERT INTO CON_CUENTAS_GES_EMP_P ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, CODIGO) ');
           SQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.EMPLEADO, :PERIODO, P.CODIGO ');
           SQL.Add(' FROM VER_EMPLEADOS_CUENTAS C ');
           SQL.Add(' INNER JOIN EMP_CONCEPTO_PARAMETROS P ON C.EMPRESA = P.EMPRESA AND C.EJERCICIO = P.EJERCICIO AND C.CANAL = P.CANAL ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' P.CALCULABLE = 0 AND ');
           SQL.Add(' P.VISIBLE_EN_EMPLEADO = 1 AND ');
           SQL.Add(' C.ACTIVO = 1 AND ');
           SQL.Add(' NOT EXISTS(SELECT EMPLEADO ');
           SQL.Add('            FROM CON_CUENTAS_GES_EMP_P ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = C.EMPRESA AND ');
           SQL.Add('            EJERCICIO = C.EJERCICIO AND ');
           SQL.Add('            CANAL = C.CANAL AND ');
           SQL.Add('            EMPLEADO = C.EMPLEADO AND ');
           SQL.Add('            PERIODO = :PERIODO AND ');
           SQL.Add('            CODIGO = P.CODIGO) ');
           if (Empleado <> 0) then
              SQL.Add(' AND C.EMPLEADO = :EMPLEADO ');
           SQL.Add(' ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.EMPLEADO, P.CODIGO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           if (Empleado <> 0) then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TOpeDMEmpleados.RellenaConceptoPeriodoAnterior(Empleado: integer; Periodo: string);
var
  PeriodoAnt : string;
  EjercicioAnt : integer;
begin
  /// Copia los datos de los conceptos de la nomina anteior
  /// Si EMPLEADO = 0 lo hace para todos los empleados

  if (Periodo <> '') then
  begin
     // Obtengo el periodo anterior
     if (Periodo = '01') then
     begin
        PeriodoAnt := '12';
        EjercicioAnt := REntorno.Ejercicio - 1;
     end
     else
     begin
        PeriodoAnt := format('%.2d', [StrToInt(Periodo) - 1]);
        EjercicioAnt := REntorno.Ejercicio;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE CON_CUENTAS_GES_EMP_H D ');
           SQL.Add(' SET ');
           SQL.Add(' D.IMPORTE = COALESCE((SELECT IMPORTE ');
           SQL.Add('                       FROM CON_CUENTAS_GES_EMP_H ');
           SQL.Add('                       WHERE ');
           SQL.Add('                       EMPRESA = D.EMPRESA AND ');
           SQL.Add('                       EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                       CANAL = D.CANAL AND ');
           SQL.Add('                       EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                       PERIODO = :O_PERIODO AND ');
           SQL.Add('                       CODIGO = D.CODIGO), 0), ');
           SQL.Add(' D.CUENTA = COALESCE((SELECT CUENTA ');
           SQL.Add('                      FROM CON_CUENTAS_GES_EMP_H ');
           SQL.Add('                      WHERE ');
           SQL.Add('                      EMPRESA = D.EMPRESA AND ');
           SQL.Add('                      EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                      CANAL = D.CANAL AND ');
           SQL.Add('                      EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                      PERIODO = :O_PERIODO AND ');
           SQL.Add('                      CODIGO = D.CODIGO), 0), ');
           SQL.Add(' D.SIGNO = COALESCE((SELECT SIGNO ');
           SQL.Add('                     FROM CON_CUENTAS_GES_EMP_H ');
           SQL.Add('                     WHERE ');
           SQL.Add('                     EMPRESA = D.EMPRESA AND ');
           SQL.Add('                     EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                     CANAL = D.CANAL AND ');
           SQL.Add('                     EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                     PERIODO = :O_PERIODO AND ');
           SQL.Add('                     CODIGO = D.CODIGO), 0) ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.PERIODO = :PERIODO ');
           if (Empleado = 0) then
              SQL.Add(' AND D.EMPLEADO = :EMPLEADO ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Params.ByName['O_EJERCICIO'].AsInteger := EjercicioAnt;
           Params.ByName['O_PERIODO'].AsString := PeriodoAnt;
           if (Empleado = 0) then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;

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
           SQL.Add(' UPDATE CON_CUENTAS_GES_EMP_D D ');
           SQL.Add(' SET ');
           SQL.Add(' D.IMPORTE = COALESCE((SELECT IMPORTE ');
           SQL.Add('                       FROM CON_CUENTAS_GES_EMP_D ');
           SQL.Add('                       WHERE ');
           SQL.Add('                       EMPRESA = D.EMPRESA AND ');
           SQL.Add('                       EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                       CANAL = D.CANAL AND ');
           SQL.Add('                       EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                       PERIODO = :O_PERIODO AND ');
           SQL.Add('                       CODIGO = D.CODIGO), 0), ');
           SQL.Add(' D.CUENTA = COALESCE((SELECT CUENTA ');
           SQL.Add('                       FROM CON_CUENTAS_GES_EMP_D ');
           SQL.Add('                       WHERE ');
           SQL.Add('                       EMPRESA = D.EMPRESA AND ');
           SQL.Add('                       EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                       CANAL = D.CANAL AND ');
           SQL.Add('                       EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                       PERIODO = :O_PERIODO AND ');
           SQL.Add('                       CODIGO = D.CODIGO), 0), ');
           SQL.Add(' D.SIGNO = COALESCE((SELECT SIGNO ');
           SQL.Add('                       FROM CON_CUENTAS_GES_EMP_D ');
           SQL.Add('                       WHERE ');
           SQL.Add('                       EMPRESA = D.EMPRESA AND ');
           SQL.Add('                       EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                       CANAL = D.CANAL AND ');
           SQL.Add('                       EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                       PERIODO = :O_PERIODO AND ');
           SQL.Add('                       CODIGO = D.CODIGO), 0) ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.PERIODO = :PERIODO ');
           if (Empleado = 0) then
              SQL.Add(' AND D.EMPLEADO = :EMPLEADO ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Params.ByName['O_EJERCICIO'].AsInteger := EjercicioAnt;
           Params.ByName['O_PERIODO'].AsString := PeriodoAnt;
           if (Empleado = 0) then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;

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
           SQL.Add(' UPDATE CON_CUENTAS_GES_EMP_P D ');
           SQL.Add(' SET ');
           SQL.Add(' D.IMPORTE = COALESCE((SELECT IMPORTE ');
           SQL.Add('                       FROM CON_CUENTAS_GES_EMP_P ');
           SQL.Add('                       WHERE ');
           SQL.Add('                       EMPRESA = D.EMPRESA AND ');
           SQL.Add('                       EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                       CANAL = D.CANAL AND ');
           SQL.Add('                       EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                       PERIODO = :O_PERIODO AND ');
           SQL.Add('                       CODIGO = D.CODIGO), 0), ');
           SQL.Add(' D.DATO_TEXTO = COALESCE((SELECT DATO_TEXTO ');
           SQL.Add('                          FROM CON_CUENTAS_GES_EMP_P ');
           SQL.Add('                          WHERE ');
           SQL.Add('                          EMPRESA = D.EMPRESA AND ');
           SQL.Add('                          EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                          CANAL = D.CANAL AND ');
           SQL.Add('                          EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                          PERIODO = :O_PERIODO AND ');
           SQL.Add('                          CODIGO = D.CODIGO), ''''), ');
           SQL.Add(' D.DATO_FECHA = COALESCE((SELECT DATO_FECHA ');
           SQL.Add('                          FROM CON_CUENTAS_GES_EMP_P ');
           SQL.Add('                          WHERE ');
           SQL.Add('                          EMPRESA = D.EMPRESA AND ');
           SQL.Add('                          EJERCICIO = :O_EJERCICIO AND ');
           SQL.Add('                          CANAL = D.CANAL AND ');
           SQL.Add('                          EMPLEADO = D.EMPLEADO AND ');
           SQL.Add('                          PERIODO = :O_PERIODO AND ');
           SQL.Add('                          CODIGO = D.CODIGO), ''NOW'') ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.PERIODO = :PERIODO ');
           if (Empleado = 0) then
              SQL.Add(' AND D.EMPLEADO = :EMPLEADO ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Params.ByName['O_EJERCICIO'].AsInteger := EjercicioAnt;
           Params.ByName['O_PERIODO'].AsString := PeriodoAnt;
           if (Empleado = 0) then
              Params.ByName['EMPLEADO'].AsInteger := Empleado;

           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

{function TOpeDMEmpleados.ExistePeriodo(Modo, Empleado: integer; Periodo: string): boolean;
begin
  Result := False;
  if (Periodo <> '') then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
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
              case Modo of
                 1:
                 begin
                    SelectSQL.Add(' SELECT * FROM  VER_CON_CUENTAS_GES_EMP_H ');
                 end;
                 2:
                 begin
                    SelectSQL.Add(' SELECT * FROM  VER_CON_CUENTAS_GES_EMP_D ');
                 end;
                 3:
                 begin
                    SelectSQL.Add(' SELECT * FROM  VER_CON_CUENTAS_GES_EMP_P ');
                 end;
              end;
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SelectSQL.Add(' CANAL = ?CANAL AND ');
              SelectSQL.Add(' PERIODO = ?PERIODO AND');
              SelectSQL.Add(' EMPLEADO = ?EMPLEADO ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['PERIODO'].AsString := Periodo;
              Params.ByName['EMPLEADO'].AsInteger := Empleado;
              Open;

              Result := RecordCount > 0
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;
end;}

procedure TOpeDMEmpleados.xIncapacidadTransitoriaAfterPost(DataSet: TDataSet);
var
  IdNomina, EstadoNomina, AusenciasP001, AusenciasP002, Ausencias : integer;
  Dia, Mes, Anio : word;
  Tipo, Periodo : string;
begin
  // Procedimiento para calcular las ausencias, segun el rando de fechas y actualizar los parámetros P001 y P002
  // Segun Tipo ausencia de "SYS_TIPO_INCAP_TRANSITORIA"

  // 001 Contratacion Plazo Indefinido     Afecta a Ausencia   P001   Dias de falta
  // 002 Subsidio por Incapacidad Laboral  Afecta a Licencia   P002   Dias de Licencia
  // 003 Permiso Sin Goce de Sueldo        Afecta a Ausencia   P001   Dias de falta
  // 004 Contratación Plazo Fijo           Afecta a Ausencia   P001   Dias de falta
  // 005 Accidente del trabajo             Afecta a Licencia   P002   Dias de Licencia
  // 006 Otros Movimientos (ausentismos)   Afecta a Ausencia   P001   Dias de falta
  // 007 Cesación de los Servicios         Afecta a Ausencia   P001   Dias de falta

  if xIncapacidadTransitoria.RecordCount > 0 then
  begin
     AusenciasP001 := 0;
     AusenciasP002 := 0;

     DecodeDate(xIncapacidadTransitoriaFECHA_INICIO.AsDateTime, Anio, Mes, Dia);
     Periodo := Format('%.2d', [Mes]);
     //Busco la cabecera y el estado para ese empleado en el periodo de la fecha
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT ID, ESTADO ');
           SQL.Add(' FROM VER_EMP_NOMINAS_CABECERA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' PERIODO = :PERIODO AND ');
           SQL.Add(' EMPLEADO = :EMPLEADO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Params.ByName['EMPLEADO'].AsInteger := xIncapacidadTransitoriaEMPLEADO.AsInteger;
           ExecQuery;
           IdNomina := FieldByName['ID'].AsInteger;
           EstadoNomina := FieldByName['ESTADO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (IdNomina = 0) then
        ShowMessage(format(_('No existe nomina para el empleado %d en el periodo %s.'), [xIncapacidadTransitoriaEMPLEADO.AsInteger, Periodo]))
     else
     if (EstadoNomina <> 0) then
        ShowMessage(format(_('La nomina para el empleado %d en el periodo %s esta cerrada y no puede modificarse.'), [xIncapacidadTransitoriaEMPLEADO.AsInteger, Periodo]))
     else
     begin
        //Recorro la tabla de ausencias para luego Hacer el Update
        // con la suma de los dias en "VER_EMP_NOMINAS_DET_PARAMETROS" segun corresponda en  "P001"  o "P002"
        with xIncapacidadTransitoria do
        begin
           First;
           while not EOF do
           begin
              Tipo := xIncapacidadTransitoriaTIPO.AsString;
              //if xIncapacidadTransitoriaFECHA_INICIO.isnull then
              Ausencias := DaysBetween(xIncapacidadTransitoriaFECHA_INICIO.AsDateTime, xIncapacidadTransitoriaFECHA_FIN.AsDateTime) + 1;//cantidad de dias de ausencia
              if (Tipo = '002') or (Tipo = '005') then
                 AusenciasP002 := AusenciasP002 + Ausencias
              else
                 AusenciasP001 := AusenciasP001 + Ausencias;
              Next;
           end;
        end;

        UpdateValor(IdNomina, 'P001', AusenciasP001);
        UpdateValor(IdNomina, 'P002', AusenciasP002);
     end;
  end;
end;

procedure TOpeDMEmpleados.UpdateValor(IdNomina: integer; Concepto: string; Importe: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_DET_PARAMETROS ');
        SQL.Add(' SET ');
        SQL.Add(' IMPORTE = :IMPORTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['ID_CABECERA'].AsInteger := IdNomina;
        Params.ByName['CODIGO'].AsString := Concepto;
        Params.ByName['IMPORTE'].AsFloat := Importe;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMEmpleados.QMIncapacidadNewRecord(DataSet: TDataSet);
begin
  QMIncapacidadPARAMETRO_AUS.AsString := '';
  QMIncapacidadTITULO.AsString := '';
end;

procedure TOpeDMEmpleados.RellenaCuentasDefecto;
begin
  if (REntorno.Pais = 'ESP') then
  begin
     QMEmpleadosCTA_DEVENGO.AsString := ajusta('6400', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_RETENCION.AsString := ajusta('4751', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_REMUNERACION.AsString := ajusta('4650', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_SEG_SOCIAL.AsString := ajusta('4760', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_ANTICIPO.AsString := ajusta('4600', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_SEG_SOCIAL_EMPRESA.AsString := ajusta('6420', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_COBROS_ESPECIE_SOCIO.AsString := ajusta('6400', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_ING_SERVICIOS_SOCIALES.AsString := ajusta('7750', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO.AsString := ajusta('6400', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_ICECES.AsString := ajusta('4760', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_CE_RETA.AsString := ajusta('4751', 'D', REntorno.DigitosSub, '0');
     QMEmpleadosCTA_EMBARGO.AsString := ajusta('4650', 'D', REntorno.DigitosSub, '0');
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosPLAN_ISAPREGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  SeparadorDecimal, SeparadorMiles : char;
begin
  if Sender.AsString <> '' then
  begin
     SeparadorDecimal := DecimalSeparator;
     SeparadorMiles := ThousandSeparator;
     DecimalSeparator := '.';
     ThousandSeparator := ',';

     Text := FormatFloat('#,###.###', Sender.AsFloat);

     DecimalSeparator := SeparadorDecimal;
     ThousandSeparator := SeparadorMiles;
  end;
end;

procedure TOpeDMEmpleados.QMEmpleadosPOBLACION_DIRECCIONChange(Sender: TField);
begin
  QMEmpleadosLRE.AsString := DMMain.DameLREComuna(QMEmpleadosPOBLACION_DIRECCION.AsString);
end;

procedure TOpeDMEmpleados.ImportaAusenciasFIE;
var
  HCalc : THojaCalc;
  i : integer;
  Archivo : string;
  HayError : boolean;
  SeparadorDecimal, s, NumSecuenciaFIE : string;
  FechaBaja : TDateTime;
  FechaAlta : TDateTime;
  NifEmpleado : string;
  Empleado : integer;
  //LineaMemo : integer;
  WndList : Pointer;
  Log : TStrings;
  ArchivoLog : string;
  CantTerceros, CantNumSecuencia : integer;
  TipoPrestacion : string;
  Contingencia : string;
  TipoContingencia : string;
begin
  inherited;
  Log := TStringList.Create;
  FInformacionEnvioDte := TFInformacionEnvioDte.Create(Self);
  WndList := DisableTaskWindows(FInformacionEnvioDte.Handle);
  with FInformacionEnvioDte do
  begin
     LBLGeneral.Caption := _('Inicializando lectura...');
     MLog.Lines.Clear;
     Show;
  end;

  try
     FInformacionEnvioDte.MLog.Lines.Add(_('Inicializando lectura...'));
     SeparadorDecimal := ' ';
     Archivo := '';
     if MyOpenDialog(Archivo, 'XLS,ODS,TXT', '', _('Importacion Ausencias FIE')) then
     begin
        try
           FInformacionEnvioDte.MLog.Lines.Add(_('Leyendo fichero') + ' ' + Archivo);
           //LineaMemo := 0;
           Log.Clear;

           HCalc := THojaCalc.Create(Archivo, False);
           try
              HCalc.ActivateSheetByIndex(1);

              // La primera fila son los titulos, importamos a partir de la fila 2
              for i := 2 to HCalc.LastRow + 1 do
              begin
                 //HayError := False;
                 NIFEmpleado := '';
                 FechaBaja := EncodeDate(1900, 1, 1);
                 FechaAlta := EncodeDate(1900, 1, 1);
                 //CantTerceros := 0;
                 NumSecuenciaFIE := '';
                 TipoPrestacion := '';
                 Contingencia := '';
                 //CantNumSecuencia := 0;

                 try
                    s := LimpiaCeldaExcel(HCalc.CellText[i, 1]);
                    NIFEmpleado := Copy(s, 1, 20);

                    HayError := (NIFEmpleado = '');
                    if (HayError) then
                       Log.Add(format(_('Linea %d - No hay NIF de empleado'), [i]));
                 except
                    HayError := True;
                 end;

                 if (NIFEmpleado <> '') then
                 begin
                    // Obtenemos Numero de Secuencia FIE
                    try
                       s := LimpiaCeldaExcel(HCalc.CellText[i, 23]);
                       NumSecuenciaFIE := Copy(s, 1, 20);

                       HayError := (NumSecuenciaFIE = '');
                       if (HayError) then
                          Log.Add(format(_('Linea %d - No hay Num. Secuencia FIE'), [i]));
                    except
                       HayError := True;
                    end;

                    if (not HayError) then
                    begin
                       FInformacionEnvioDte.MLog.Lines.Add(format(_('NIF del Empleado = %s'), [NIFEmpleado]));
                       DMMain.Log(format(_('NIF del Empleado = %s'), [NIFEmpleado]));
                       try
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' SELECT COUNT(TERCERO) FROM SYS_TERCEROS ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' NIF = :NIF ');
                                Params.ByName['NIF'].AsString := NIFEmpleado;
                                ExecQuery;
                                CantTerceros := (FieldByName['COUNT'].AsInteger);
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          if (CantTerceros = 0) then
                          begin
                             HayError := True;
                             FInformacionEnvioDte.MLog.Lines.Add(format(_('No existe un tercero con el NIF: %s'), [NIFEmpleado]));
                             Log.Add(format(_('No existe un tercero con el NIF: %s'), [NIFEmpleado]));
                          end
                          else
                          if (CantTerceros > 1) then
                          begin
                             HayError := True;
                             FInformacionEnvioDte.MLog.Lines.Add(format(_('Existe mas de un tercero con el NIF: %s'), [NIFEmpleado]));
                             Log.Add(format(_('Existe mas de un tercero con el NIF: %s'), [NIFEmpleado]));
                          end
                          else
                          if (CantTerceros = 1) then
                          begin
                             Log.Add(format(_('NIF del Empleado = %s'), [NIFEmpleado]));
                             FInformacionEnvioDte.MLog.Lines.Add(format(_('NIF del Empleado = %s'), [NIFEmpleado]));
                          end;
                       except
                          Log.Add(format(_('Linea %d - Error validando si existe NIF %s'), [i, NIFEmpleado]));
                          HayError := True;
                       end;
                    end;

                    if (not HayError) then
                    begin
                       // Obtenemos el empleado
                       Empleado := DameEmpleadoTercero(DMMain.DameTerceroNIF(NIFEmpleado));
                       if (Empleado <= 1) then
                       begin
                          HayError := True;
                          FInformacionEnvioDte.MLog.Lines.Add(format(_('No existe un empleado con el NIF: %s'), [NIFEmpleado]));
                          Log.Add(format(_('Linea %d - No existe un empleado con el NIF: %s'), [i, NIFEmpleado]));
                       end;
                    end;

                    if (NumSecuenciaFIE > '') then
                    begin
                       // Buscamos si ya existe la secuencia
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' SELECT COUNT(NUM_SECUENCIA_FIE) ');
                             SQL.Add(' FROM OPE_EMPLEADO_INCAP_TRANS ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' EMPRESA = :EMPRESA AND ');
                             SQL.Add(' EMPLEADO = :EMPLEADO AND ');
                             SQL.Add(' NUM_SECUENCIA_FIE = :NUM_SECUENCIA_FIE ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EMPLEADO'].AsInteger := Empleado;
                             Params.ByName['NUM_SECUENCIA_FIE'].AsString := NumSecuenciaFIE;
                             ExecQuery;
                             CantNumSecuencia := (FieldByName['COUNT'].AsInteger);
                             FreeHandle;
                             if (CantNumSecuencia >= 1) then
                             begin
                                FInformacionEnvioDte.MLog.Lines.Add(format(_('Ya existe el numero de secuencia %s'), [NumSecuenciaFIE]));
                                Log.Add(format(_('Linea %d - Ya existe el numero de secuencia %s para el empleado.'), [i, NumSecuenciaFIE]));
                                HayError := True;
                             end;
                          finally
                             Free;
                          end;
                       end;
                    end
                    else
                       HayError := True;

                    if (not HayError) then
                    begin
                       // Obtenemos fecha de baja
                       s := '';
                       try
                          s := LimpiaCeldaExcel(HCalc.CellText[i, 10]);
                          FechaBaja := StrToDate(s);
                       except
                          HayError := True;
                          Log.Add(format(_('Linea %d - Error obteniendo Fecha Baja (%s)'), [i, s]));
                       end;
                       DMMain.Log(format(_('Fecha Fecha baja = %s'), [DateToStr(FechaBaja)]));
                    end;

                    if (not HayError) then
                    begin
                       // Obtenemos fecha de Alta
                       s := '';
                       try
                          s := LimpiaCeldaExcel(HCalc.CellText[i, 11]);
                          FechaAlta := StrToDate(s);
                       except
                          HayError := True;
                          Log.Add(format(_('Linea %d - Error obteniendo Fecha Alta (%s)'), [i, s]));
                       end;
                       DMMain.Log(format(_('Fecha Fecha alta = %s'), [DateToStr(FechaAlta)]));
                    end;

                    if (not HayError) then
                    begin
                       // Obtenemos Tipo prestación
                       s := '';
                       try
                          s := LimpiaCeldaExcel(HCalc.CellText[i, 7]);
                          TipoPrestacion := s;
                       except
                          HayError := True;
                          Log.Add(format(_('Linea %d - Error obteniendo Tipo Prestacion (%s)'), [i, s]));
                       end;
                       DMMain.Log(format(_('Tipo Prestacion = %s'), [TipoPrestacion]));
                    end;

                    if (not HayError) then
                    begin
                       // Obtenemos Contingencia
                       s := '';
                       try
                          s := LimpiaCeldaExcel(HCalc.CellText[i, 8]);
                          Contingencia := Copy(s, 1, 60);
                       except
                          HayError := True;
                          Log.Add(format(_('Linea %d - Error obteniendo Contingencia (%s)'), [i, s]));
                       end;
                    end;
                    DMMain.Log(format(_('Contingencia = %s'), [Contingencia]));

                    // Insertamos datos FIE
                    if (not HayError) then
                    begin
                       try
                          TipoContingencia := DameTipoContingencia(QuitarAcentosTexto(Contingencia));
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO OPE_EMPLEADO_INCAP_TRANS ( ');
                                SQL.Add(' EMPRESA, EMPLEADO, FECHA_INICIO, FECHA_FIN, COMENTARIO, NUM_SECUENCIA_FIE, TIPO) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :EMPRESA, :EMPLEADO, :FECHA_INICIO, :FECHA_FIN, :COMENTARIO, :NUM_SECUENCIA_FIE, :TIPO) ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EMPLEADO'].AsInteger := Empleado;
                                Params.ByName['FECHA_INICIO'].AsDateTime := FechaBaja;
                                Params.ByName['FECHA_FIN'].AsDateTime := FechaAlta;
                                Params.ByName['COMENTARIO'].AsString := Copy(TipoPrestacion + ' - ' + Contingencia, 1, 60);
                                Params.ByName['NUM_SECUENCIA_FIE'].AsString := NumSecuenciaFIE;
                                Params.ByName['TIPO'].AsString := TipoContingencia;

                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       except
                          HayError := True;
                          Log.Add(format(_('Linea %d - No se pudo insertar la secuencia %s'), [i, NumSecuenciaFIE]));
                       end;
                    end;
                 end;
              end; {for}
           finally
              Sleep(1000);
              HCalc.Free;
           end;
        except
           on E: Exception do
              Log.Add(_('Fallo en la importacion - ' + E.message));
        end;
        Screen.Cursor := crDefault;
        EnableTaskWindows(WndList);
        FInformacionEnvioDte.Close;

        if (Log.Count > 0) then
        begin
           ArchivoLog := DameTempPath + format('ImportaAusenciasFIE-%s.txt', [FormatDateTime('yyyymmdd_hhnnss', Now)]);
           Log.SaveToFile(ArchivoLog);
           DMMain.AbrirArchivo(ArchivoLog);
        end;
     end;
  finally
     Log.Free;
  end;
end;

function TOpeDMEmpleados.DameTipoContingencia(Contingencia: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TIPO ');
        SQL.Add(' FROM SYS_TIPO_INCAP_TRANSITORIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' UPPER(TRIM(TITULO)) = UPPER(TRIM(:TITULO)) ');
        Params.ByName['TITULO'].AsString := Contingencia;
        ExecQuery;
        if (FieldByName['TIPO'].AsString > '') then
           Result := FieldByName['TIPO'].AsString
        else
           Result := '001';

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
