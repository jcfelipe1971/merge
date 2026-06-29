unit UCrmDMContactos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, StdCtrls, ExtDlgs,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, ExtCtrls,
  FIBTableDataSetRO;

type
  TCrmDMContactos = class(TDataModule)
     TLocal: THYTransaction;
     QMContactos: TFIBTableSet;
     QMContactosID_CONTACTO: TIntegerField;
     QMContactosNUM_CONTACTO: TIntegerField;
     QMContactosFECHA_ALTA: TDateTimeField;
     QMContactosTERCERO: TIntegerField;
     QMContactosNOMBRE_R_SOCIAL: TFIBStringField;
     QMContactosNOMBRE_COMERCIAL: TFIBStringField;
     QMContactosNOMBRE_CORTO: TFIBStringField;
     QMContactosTIPO_RAZON: TFIBStringField;
     QMContactosNIF: TFIBStringField;
     QMContactosTELEFONO01: TFIBStringField;
     QMContactosTELEFONO02: TFIBStringField;
     QMContactosTELEFAX: TFIBStringField;
     QMContactosDIR_NOMBRE: TFIBStringField;
     QMContactosDIR_LOCALIDAD: TFIBStringField;
     QMContactosID_LOCAL: TIntegerField;
     QMContactosEMAIL: TFIBStringField;
     QMContactosWEB: TFIBStringField;
     QMContactosNOTAS: TBlobField;
     DSQMContactos: TDataSource;
     QMPersonas: TFIBTableSet;
     QMPersonasID_CONTACTO: TIntegerField;
     QMPersonasNUM_PERSONA: TIntegerField;
     QMPersonasNOMBRE: TFIBStringField;
     QMPersonasAPELLIDOS: TFIBStringField;
     QMPersonasTELEFONO: TFIBStringField;
     QMPersonasMOVIL: TFIBStringField;
     QMPersonasFAX: TFIBStringField;
     QMPersonasEXTENSION: TFIBStringField;
     QMPersonasEMAIL: TFIBStringField;
     QMPersonasNOTAS: TBlobField;
     DSQMPersonas: TDataSource;
     xAgrupSon: TFIBDataSetRO;
     xAgrupDisp: TFIBDataSetRO;
     DSxAgrupDisp: TDataSource;
     DSxAgrupSon: TDataSource;
     QMAcciones: TFIBTableSet;
     DSQMAcciones: TDataSource;
     QMAccionesID_CONTACTO: TIntegerField;
     QMAccionesLINEA: TIntegerField;
     QMAccionesEMPRESA_AGENTE: TIntegerField;
     QMAccionesAGENTE: TIntegerField;
     QMAccionesFECHA_ACCION: TDateTimeField;
     QMAccionesTIPO_ACCION: TFIBStringField;
     QMAccionesDESCRIPCION_ACCION: TFIBStringField;
     QMAccionesNOTAS: TBlobField;
     QMAccionesFIN_ACCION: TIntegerField;
     QMAccionesFECHA_PROX_ACCION: TDateTimeField;
     QMAccionesTIPO_PROX_ACCION: TFIBStringField;
     QMAccionesDESCRIPCION_PROX_ACCION: TFIBStringField;
     xLocalidad: TFIBDataSetRO;
     DSxLocalidad: TDataSource;
     xLocalidadLOCALIDAD: TFIBStringField;
     xLocalidadTITULO: TFIBStringField;
     xLocalidadCODPOSTAL: TFIBStringField;
     xLocalidadPROVINCIA: TFIBStringField;
     xLocalidadINE: TFIBStringField;
     xLocalidadPAIS: TFIBStringField;
     xLocalidadC_PAIS: TFIBStringField;
     xLocalidadIDIOMA: TFIBStringField;
     xLocalidadID_LOCAL: TIntegerField;
     xRazones: TFIBDataSetRO;
     DSxRazones: TDataSource;
     xRazonesTITULO: TFIBStringField;
     xAgenteAccion: TFIBDataSetRO;
     xAgenteAccionAGENTE: TIntegerField;
     xAgenteAccionTITULO: TFIBStringField;
     DSxAgenteAccion: TDataSource;
     QMContactosCOMENTARIO: TMemoField;
     QMContactosCLIENTE: TIntegerField;
     QMAccionesHORA_PROX_ACCION: TFIBStringField;
     QMAccionesDet: TFIBTableSet;
     DSQMAccionesDet: TDataSource;
     QMAccionesDetID_ACCION_DET: TIntegerField;
     QMAccionesDetID_ACCION: TIntegerField;
     QMAccionesDetORDEN: TIntegerField;
     QMAccionesDetFECHA: TDateTimeField;
     QMAccionesDetHORA_ACCION: TFIBStringField;
     QMAccionesID_ACCION: TIntegerField;
     QMAccionesDetNOTAS: TBlobField;
     QMAccionesDetID_CONTACTO: TIntegerField;
     QMAccionesDetLINEA_CAB: TIntegerField;
     QMAccionesDetFIN_SEG: TIntegerField;
     QMContactosRUTA_IMAGEN: TFIBStringField;
     QMContactosORIGEN_CONTACTO: TFIBStringField;
     QMContactosLINK_GOOGLE: TFIBStringField;
     QMAccionesDetID_SEG_SIGUIENTE: TIntegerField;
     QMAccionesDetFECHA_SEG_SIGUIENTE: TDateTimeField;
     QMAccionesDetTIPO_SEG: TFIBStringField;
     QMContactosAMBITO: TIntegerField;
     QMContactosACTIVITAT_ECONOMICA: TFIBStringField;
     QMAccionesDOC_ACCION: TIntegerField;
     xDirecciones: TFIBDataSetRO;
     DSxDirecciones: TDataSource;
     xDireccionesDIR_LOCALIDAD: TFIBStringField;
     QMContactosTITULO: TFIBStringField;
     QMContactosCODPOSTAL: TFIBStringField;
     QMContactosPROVINCIA: TFIBStringField;
     QMContactosPAIS: TFIBStringField;
     QMAccionesDOC_EMPRESAS: TIntegerField;
     QMAccionesDOC_CANAL: TIntegerField;
     QMAccionesDOC_SERIES: TFIBStringField;
     QMAccionesDOC_EJERCICIO: TIntegerField;
     DSRelContactoAmbito: TDataSource;
     QMRelContactoAmbito: TFIBTableSet;
     QMRelContactoAmbitoID_CRM_CONTACTO: TIntegerField;
     QMRelContactoAmbitoID_CRM_AMBITO: TIntegerField;
     QMRelContactoAmbitoDesc_Ambito: TStringField;
     xAmbito: TFIBDataSetRO;
     DSxAmbito: TDataSource;
     xAmbitoDESCRIPCION: TFIBStringField;
     xTituloAgr: TFIBDataSetRO;
     xTituloAgrTITULO: TFIBStringField;
     DSxTituloAgr: TDataSource;
     xTituloAmb: TFIBDataSetRO;
     DSxTituloAmb: TDataSource;
     xTituloAmbDESCRIPCION: TFIBStringField;
     QMContactosAGENTE: TIntegerField;
     QMContactosFORMA_DE_PAGO_IMP: TFIBStringField;
     QMContactosCLI_PROV_IMP: TFIBStringField;
     QMContactosEMPRESA: TIntegerField;
     QMContactosDESC_AGENTE: TFIBStringField;
     QMContactosTITULO_PAIS: TFIBStringField;
     QMAccionesDetDESCRIPCION_SEGUIMIENTO: TFIBStringField;
     xVentasCRM: TFIBDataSetRO;
     DSxVentasCRM: TDataSource;
     xVentasCRMID: TIntegerField;
     xVentasCRMID_CONTACTO: TIntegerField;
     xVentasCRMID_ARTICULO: TIntegerField;
     xVentasCRMFECHA: TDateTimeField;
     xVentasCRMDESCRIPCION: TFIBStringField;
     xVentasCRMCODIGO: TFIBStringField;
     xVentasCRMCANTIDAD: TFloatField;
     QMContactosZONA: TFIBStringField;
     QMAccionesID_ACCION_CAB: TIntegerField;
     TUpdate: THYTransaction;
     QMContactosIPAD_VISIBLE: TIntegerField;
     QMContactosMARCA_CONTACTO: TFIBStringField;
     QMContactosLATITUD: TFloatField;
     QMContactosLONGITUD: TFloatField;
     QMContactosULT_MODIFICACION: TDateTimeField;
     QMContactosIMAGEN: TBlobField;
     QMContactosFORMATO: TFIBStringField;
     QMContactosORIGEN: TIntegerField;
     QMContactosENTRADA: TIntegerField;
     QMContactosCODIGO_IMAGEN: TIntegerField;
     QMContactosID_GALERIA: TIntegerField;
     DSQMSeguimientos: TDataSource;
     xSeguimientos: TFIBDataSetRO;
     xSeguimientosID_CONTACTO: TIntegerField;
     xSeguimientosLINEA_CAB: TIntegerField;
     xSeguimientosORDEN: TIntegerField;
     xSeguimientosID_ACCION_DET: TIntegerField;
     xSeguimientosID_ACCION: TIntegerField;
     xSeguimientosFECHA: TDateTimeField;
     xSeguimientosDESCRIPCION_SEGUIMIENTO: TFIBStringField;
     xSeguimientosHORA_ACCION: TFIBStringField;
     xSeguimientosTIPO_SEG: TFIBStringField;
     xSeguimientosDESCRIPCION_ACCION: TFIBStringField;
     QMContactosDIRECCION: TIntegerField;
     QMContactosDIAS_ENTRE_VISITAS: TIntegerField;
     QMContactosFECHA_ULTIMA_VISITA: TDateTimeField;
     QMContactosHORARIO_1_DESDE: TDateTimeField;
     QMContactosHORARIO_1_HASTA: TDateTimeField;
     QMContactosHORARIO_2_DESDE: TDateTimeField;
     QMContactosHORARIO_2_HASTA: TDateTimeField;
     QMContactosID_RUTA: TIntegerField;
     xAccionDetAsuntos: TFIBTableSet;
     DSxAccionDetAsuntos: TDataSource;
     xAccionDetAsuntosID_ACCION_DET: TIntegerField;
     xAccionDetAsuntosID_ASUNTO: TIntegerField;
     xAccionDetAsuntosTITULO: TFIBStringField;
     QMPersonasENVIO_EMAIL: TIntegerField;
     QMPersonasFECHA_EXPORTACION_CORREO: TDateTimeField;
     DSxVentas: TDataSource;
     xVentas: TFIBTableSetRO;
     xVentasEMPRESA: TIntegerField;
     xVentasEJERCICIO: TIntegerField;
     xVentasCANAL: TIntegerField;
     xVentasSERIE: TFIBStringField;
     xVentasTIPO: TFIBStringField;
     xVentasRIG: TIntegerField;
     xVentasALMACEN: TFIBStringField;
     xVentasMONEDA: TFIBStringField;
     xVentasFECHA: TDateTimeField;
     xVentasCLIENTE: TIntegerField;
     xVentasTERCERO: TIntegerField;
     xVentasDIRECCION: TIntegerField;
     xVentasSU_REFERENCIA: TFIBStringField;
     xVentasFORMA_PAGO: TFIBStringField;
     xVentasCAMPANYA: TIntegerField;
     xVentasNOTAS: TBlobField;
     xVentasESTADO: TIntegerField;
     xVentasBULTOS: TIntegerField;
     xVentasLINEAS: TIntegerField;
     xVentasBRUTO: TFloatField;
     xVentasI_DTO_LINEAS: TFloatField;
     xVentasS_BASES: TFloatField;
     xVentasM_BRUTO: TFloatField;
     xVentasC_TOTAL: TFloatField;
     xVentasAGENTE: TIntegerField;
     xVentasS_CUOTA_IVA: TFloatField;
     xVentasS_CUOTA_RE: TFloatField;
     xVentasB_DTO_LINEAS: TFloatField;
     xVentasDTO_PP: TFloatField;
     xVentasDTO_CIAL: TFloatField;
     xVentasB_COMISION: TFloatField;
     xVentasI_COMISION: TFloatField;
     xVentasPOR_FINANCIACION: TFloatField;
     xVentasI_FINANCIACION: TFloatField;
     xVentasLIQUIDO: TFloatField;
     xVentasENTRADA: TIntegerField;
     xVentasPROCESO_AUTO: TIntegerField;
     xVentasI_DTO_PP: TFloatField;
     xVentasI_DTO_CIAL: TFloatField;
     xVentasPORTES: TIntegerField;
     xVentasI_FINANCIACION_CANAL: TFloatField;
     xVentasS_BASES_CANAL: TFloatField;
     xVentasS_CUOTA_IVA_CANAL: TFloatField;
     xVentasS_CUOTA_RE_CANAL: TFloatField;
     xVentasLIQUIDO_CANAL: TFloatField;
     xVentasCHG_MONEDA: TIntegerField;
     xVentasTARIFA: TFIBStringField;
     xVentasID_S: TIntegerField;
     xVentasPEDIDO_CLIENTE: TFIBStringField;
     xVentasZ_OBSERVACION: TFIBStringField;
     xVentasCONTACTO: TIntegerField;
     xVentasI_PORTES: TFloatField;
     xVentasPOR_PORTES: TFloatField;
     xVentasTIPO_PORTES: TIntegerField;
     xVentasRANGO: TIntegerField;
     xVentasINDICE: TIntegerField;
     xVentasPROYECTO: TIntegerField;
     xVentasTRANSPORTISTA: TIntegerField;
     DSxVentasDetalle: TDataSource;
     xVentasDetalle: TFIBTableSetRO;
     xVentasDetalleEMPRESA: TIntegerField;
     xVentasDetalleEJERCICIO: TIntegerField;
     xVentasDetalleCANAL: TIntegerField;
     xVentasDetalleSERIE: TFIBStringField;
     xVentasDetalleTIPO: TFIBStringField;
     xVentasDetalleRIG: TIntegerField;
     xVentasDetalleALMACEN: TFIBStringField;
     xVentasDetalleMONEDA: TFIBStringField;
     xVentasDetalleFECHA: TDateTimeField;
     xVentasDetalleCLIENTE: TIntegerField;
     xVentasDetalleTERCERO: TIntegerField;
     xVentasDetalleDIRECCION: TIntegerField;
     xVentasDetalleSU_REFERENCIA: TFIBStringField;
     xVentasDetalleFORMA_PAGO: TFIBStringField;
     xVentasDetalleCAMPANYA: TIntegerField;
     xVentasDetalleESTADO: TIntegerField;
     xVentasDetalleAGENTE: TIntegerField;
     xVentasDetalleDTO_PP: TFloatField;
     xVentasDetalleDTO_CIAL: TFloatField;
     xVentasDetallePOR_FINANCIACION: TFloatField;
     xVentasDetallePORTES: TIntegerField;
     xVentasDetalleTARIFA: TFIBStringField;
     xVentasDetalleID_S: TIntegerField;
     xVentasDetalleFECHA_ENTREGA: TDateTimeField;
     xVentasDetalleIDIOMA: TFIBStringField;
     xVentasDetalleCONTACTO: TIntegerField;
     xVentasDetallePOR_PORTES: TFloatField;
     xVentasDetalleTIPO_PORTES: TIntegerField;
     xVentasDetalleRANGO: TIntegerField;
     xVentasDetalleINDICE: TIntegerField;
     xVentasDetalleCAMBIO_FIJO: TIntegerField;
     xVentasDetallePROYECTO: TIntegerField;
     xVentasDetallePEDIDO_CLIENTE: TFIBStringField;
     xVentasDetalleZ_CONTACTO: TIntegerField;
     xVentasDetalleZ_OBSERVACION: TFIBStringField;
     xVentasDetalleLINEA: TIntegerField;
     xVentasDetalleARTICULO: TFIBStringField;
     xVentasDetalleTITULO: TFIBStringField;
     xVentasDetalleUNIDADES: TFloatField;
     xVentasDetallePRECIO: TFloatField;
     xVentasDetallePIEZAS_X_BULTO: TIntegerField;
     xVentasDetalleDESCUENTO: TFloatField;
     xVentasDetalleDESCUENTO_2: TFloatField;
     xVentasDetalleDESCUENTO_3: TFloatField;
     xVentasDetalleCOMISION: TFloatField;
     xVentasDetalleP_COSTE: TFloatField;
     xVentasDetalleM_MOV_STOCK: TIntegerField;
     xVentasDetallePAIS: TFIBStringField;
     xVentasDetalleTIPO_IVA: TIntegerField;
     xVentasDetalleP_IVA: TFloatField;
     xVentasDetalleP_RECARGO: TFloatField;
     xVentasDetalleI_DESCUENTO: TFloatField;
     xVentasDetalleB_IMPONIBLE: TFloatField;
     xVentasDetalleB_DTO_LINEA: TFloatField;
     xVentasDetalleC_IVA: TFloatField;
     xVentasDetalleC_RECARGO: TFloatField;
     xVentasDetalleUNIDADES_EXT: TFloatField;
     xVentasDetalleIVA_INCLUIDO: TIntegerField;
     xVentasDetalleNSERIE: TFIBStringField;
     xVentasDetalleB_COMISION_CANAL: TFloatField;
     xVentasDetalleEJER_MOV: TIntegerField;
     xVentasDetalleUNIDADES_SEC: TFloatField;
     xVentasDetalleNO_FABRICACION_KRI: TFIBStringField;
     xVentasDetalleID_DETALLES_S: TIntegerField;
     xVentasDetalleID_D_S_GR: TIntegerField;
     xVentasDetalleID_A_M_C_T: TIntegerField;
     xVentasDetalleID_C_A: TIntegerField;
     xVentasDetalleID_A: TIntegerField;
     xVentasDetalleID_MOV_STOCKS: TIntegerField;
     xVentasDetalleTITULO_IDIOMA: TFIBStringField;
     xVentasDetalleORDEN: TIntegerField;
     xVentasDetalleTIPO_LINEA: TFIBStringField;
     xVentasDetalleORIGEN: TIntegerField;
     xVentasDetallePROC_PROMOCION: TIntegerField;
     xVentasDetalleID_P: TIntegerField;
     xVentasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xVentasDetalleCERTIFICADO: TIntegerField;
     xVentasDetalleCERT_NEGATIVO: TIntegerField;
     xVentasDetalleLINEA_RELACION: TIntegerField;
     xVentasDetalleNOTAS2: TBlobField;
     xVentasDetalleCRC_NOTAS: TFIBStringField;
     xVentasDetalleCRC_NOTAS2: TFIBStringField;
     xVentasDetallePRO_NUM_PLANO: TFIBStringField;
     xVentasDetalleCUENTA: TFIBStringField;
     xVentasDetalleLOTE_SIMPLE: TFIBStringField;
     xVentasDetalleID_DESPIECE: TIntegerField;
     xVentasDetalleCOSTE_ADICIONAL: TFloatField;
     xVentasDetalleT_COSTE: TFloatField;
     xVentasDetalleMANIPULACION: TIntegerField;
     xVentasDetalleCODIGO_CLIENTE: TFIBStringField;
     xVentasDetalleADJUNTO: TFIBStringField;
     xVentasDetalleI_PORTES: TFloatField;
     xVentasDetalleTRANSPORTISTA: TIntegerField;
     xVentasDetalleBANCO: TIntegerField;
     xVentasDetalleBULTOS: TIntegerField;
     xVentasDetalleBRUTO: TFloatField;
     xVentasDetalleB_COMISION: TFloatField;
     xVentasDetalleI_DTO_PP: TFloatField;
     xVentasDetalleI_DTO_CIAL: TFloatField;
     xVentasDetalleI_COMISION: TFloatField;
     xVentasDetalleENTRADA: TIntegerField;
     xVentasDetalleNOTAS: TMemoField;
     xVentasDetalleCOMISION_LINEAL: TFloatField;
     xVentasDetalleI_COMISION_LINEAL: TFloatField;
     xVentasDetalleMARGEN_KRI: TFloatField;
     xVentasDetalleTIPO_LINEA_KRI: TIntegerField;
     xVentasDetalleULT_MODIFICACION: TDateTimeField;
     xVentasDetalleID_REGISTRO: TIntegerField;
     xVentasDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     xVentasDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     xVentasDetalleLIQUIDO: TFloatField;
     xVentasDetalleM_BRUTO: TFloatField;
     xVentasDetallePESO: TFloatField;
     xVentasDetallePESO_TOTAL: TFloatField;
     xVentasDetallePESO_REAL: TFloatField;
     xVentasDetalleU_PENDIENTES: TFloatField;
     QMPersonasBREVO: TIntegerField;
     QMPersonasID_PERSONA: TIntegerField;
     QMPersonasCARGO: TFIBStringField;
     QMPersonasID_CONTACTO_PERSONA_BREVO: TIntegerField;
     QMAccionesPROGRESO: TIntegerField;
     QMAccionesID_FICHA_TECNICA: TIntegerField;
     QMAccionesDetPROGRESO: TIntegerField;
     QMAccionesDetHORARIO_DESDE: TDateTimeField;
     QMAccionesDetHORARIO_HASTA: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMContactosBeforePost(DataSet: TDataSet);
     procedure QMAccionesNewRecord(DataSet: TDataSet);
     procedure QMPersonasNewRecord(DataSet: TDataSet);
     procedure QMContactosAfterOpen(DataSet: TDataSet);
     procedure QMContactosNewRecord(DataSet: TDataSet);
     procedure QMContactosDIR_LOCALIDADChange(Sender: TField);
     procedure QMAccionesTIPO_ACCIONChange(Sender: TField);
     procedure QMAccionesTIPO_PROX_ACCIONChange(Sender: TField);
     procedure QMAccionesAfterOpen(DataSet: TDataSet);
     procedure QMAccionesDetNewRecord(DataSet: TDataSet);
     procedure QMAccionesDetBeforePost(DataSet: TDataSet);
     procedure QMAccionesAfterScroll(DataSet: TDataSet);
     procedure QMAccionesFIN_ACCIONChange(Sender: TField);
     procedure QMAccionesDetAfterEdit(DataSet: TDataSet);
     procedure QMContactosTERCEROChange(Sender: TField);
     procedure QMRelContactoAmbitoNewRecord(DataSet: TDataSet);
     procedure QMRelContactoAmbitoDesc_AmbitoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRelContactoAmbitoID_CRM_AMBITOChange(Sender: TField);
     procedure QMAccionesDOC_ACCIONChange(Sender: TField);
     procedure QMContactosBeforeClose(DataSet: TDataSet);
     procedure QMAccionesBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMAccionesDetBeforeEdit(DataSet: TDataSet);
     procedure QMAccionesAfterPost(DataSet: TDataSet);
     procedure QMAccionesDetAfterOpen(DataSet: TDataSet);
     procedure QMAccionesDetBeforeClose(DataSet: TDataSet);
     procedure xAccionDetAsuntosNewRecord(DataSet: TDataSet);
     procedure QMContactosCLIENTEChange(Sender: TField);
  private
     { Private declarations }
     Agente, IdRuta: integer;
     SQLFind: TStrings;
     procedure DatosAccion(Accion: string; var Descripcion: string; var FinAccion: integer);
  public
     { Public declarations }
     // procedure AbrirAcciones;
     // procedure CerrarAcciones;
     procedure AbrirAgrupacion;
     procedure CerrarAgrupacion;
     procedure AgrupacionRellena;
     procedure AgrupacionVacia;
     procedure Busca(EBusca: TEdit);
     function BusquedaCompleja: integer;
     function ImportarTerceros: integer;
     function ImportarClientes: integer;
     procedure NuevoTercero(Direccion2, TipoDir, DirNombre, DirNumero, DirBloqEsc, DirPiso, DirPuerta: string; id_contacto: integer);
     procedure FiltraSeleccion(SQL: string; Tipo: integer);
     procedure CanviEstatDetallAcc(Estado: integer);
     procedure ObrirSeguiment(Accion: char);
     function CrearTerceroMasivo: integer;
     procedure TituloFiltraAgrupacion(Agrupacion: string);
     procedure TituloFiltraAmbito(Ambito: string);
     procedure CrearCliente(Cliente, Tercero, Agente: integer; FormaPago: string);
     function CrearClienteMasivo: integer; //sfg.albert
     function ExisteCliente: boolean;
     procedure MuestraEtiquetasFiltradas(Modo: byte; SWFIL, SWENLACE: integer);
     procedure CambiarTercero(Tercero: integer; Cliente: integer = 0);
     function DameClienteDeTercero(Tercero, Empresa: integer): integer; //sfg.albert
     function ActualizarCliente(Tercero: integer): boolean; //sfg.albert
     procedure RecogerDatos(IdAccionCab: integer);
     procedure CargarImagenDeArchivo(Imagen: TImage; Archivo: string);
     procedure PosicionarSeguimiento;
     procedure FiltroAcciones(Filtro: integer);
     procedure FiltroContactos(Filtro: string);
     procedure CargarImagen(const FileName: string; Formato: string); //sfg.albert
     procedure RefrescarAcciones;
     procedure FiltraAgente(aAgente, aIdRuta: integer);
     procedure ExportarCorreos(Fichero: string);
     procedure FiltraVentas(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; Pendientes: boolean; CampoOrdenDetalleVentas: string);
     procedure CerrarVentas;
     procedure FiltraAgrupacionDisponible(Filtro: string);
     procedure CerrarDataSets;
  end;

var
  CrmDMContactos : TCrmDMContactos;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UCrmFMContactos, UFBusca,
  UCrmFFiltra_Clientes_Agr, UFormGest, UCrmFMContactosDetalleAcc,
  UCrmDMLstContactoDetallado, UParam;

{$R *.DFM}

procedure TCrmDMContactos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Agente := 0;
  IdRuta := 0;

  AsignaDisplayFormat(QMContactos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMPersonas, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMRelContactoAmbito, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAcciones, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAccionesDet, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xAccionDetAsuntos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSeguimientos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVentas, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVentasDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xAgenteAccion, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xVentasCRM, MascaraN, MascaraI, ShortDateFormat);

  SQLFind := TStringList.Create;
  SQLFind.Add(' SELECT * FROM CRM_VER_CONTACTOS ');
  SQLFind.Add(' WHERE ');
  SQLFind.Add(' ID_CONTACTO <> 0 ');

  QMContactos.SelectSQL.Assign(SQLFind);
  QMContactos.SelectSQL.Add(' ORDER BY ID_CONTACTO ');

  xAmbito.Close;
end;

procedure TCrmDMContactos.DataModuleDestroy(Sender: TObject);
begin
  SQLFind.Free;
end;

procedure TCrmDMContactos.QMContactosAfterOpen(DataSet: TDataSet);
begin
  xRazones.Open;
  xLocalidad.Open;

  QMRelContactoAmbito.Close;
  QMRelContactoAmbito.Open;

  xDirecciones.Open;

  xVentas.Close;
  xVentas.Open;

  // Por alguna razon, si se abre el formulario desde la opción CrmFMContactos.FiltroContactos se desconecta OnNewRecord
  // No es una solución elegante pero no encuentro donde se desconecta.
  QMPersonas.Open;
  QMPersonas.OnNewRecord := QMPersonasNewRecord;

  xSeguimientos.Open;
end;

procedure TCrmDMContactos.QMContactosNewRecord(DataSet: TDataSet);
begin
  QMContactosFECHA_ALTA.AsDateTime := Now;
  QMContactosTERCERO.AsInteger := -1;
  QMContactosDIRECCION.AsInteger := 0;
  QMContactosTIPO_RAZON.AsString := 'DE'; // Desconocido
  QMContactosDIR_LOCALIDAD.AsString := '99999999'; // Desconocido
  QMContactosORIGEN_CONTACTO.AsString := 'DES';
  QMContactosEMPRESA.AsInteger := REntorno.Empresa;

  QMContactosAGENTE.AsInteger := Agente;
  if (QMContactosAGENTE.AsInteger = 0) then
     QMContactosAGENTE.AsInteger := DameAgenteUsuario(REntorno.Usuario);
  if (QMContactosAGENTE.AsInteger = 0) then
     QMContactosAGENTE.AsInteger := REntorno.Agente;

  QMContactosPAIS.AsString := REntorno.Pais;
  QMContactosMARCA_CONTACTO.AsString := '0';
  // Datos de uso interno, pero que deben rellenarse por restriccion NOT NULL
  QMContactosLATITUD.AsFloat := 0;
  QMContactosLONGITUD.AsFloat := 0;
  QMContactosULT_MODIFICACION.AsDateTime := Now;
  QMContactosENTRADA.AsInteger := REntorno.Entrada;
  QMContactosID_GALERIA.AsInteger := 0;
  QMContactosCODIGO_IMAGEN.AsInteger := 0;
  QMContactosORIGEN.AsInteger := 0;
  QMContactosIPAD_VISIBLE.AsInteger := BoolToInt((LeeParametro('CRMIPAD001') = 'S'));
  QMContactosID_RUTA.AsInteger := 0;

  // Zona
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) ZONA FROM SYS_ZONAS WHERE DEFECTO = 1';
        ExecQuery;
        QMContactosZONA.AsString := FieldByName['ZONA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMContactos.QMContactosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CRM_ID_CONTACTOS', 'ID_CONTACTO');
     // Porque??? QMContactosCLIENTE.AsInteger := StrToIntDef(CrmFMContactos.DBEClienteEmp.Text, 0);
     // QMContactosNUM_CONTACTO.AsInteger := QMContactosID_CONTACTO.AsInteger;
  end;

  // sfg.albert - Si abans de fer el post el nombre_r_social és buit, es posarà el del comercial, si en té
  if (QMContactosNOMBRE_R_SOCIAL.AsString = '') then
     QMContactosNOMBRE_R_SOCIAL.AsString := QMContactosNOMBRE_COMERCIAL.AsString;

  if (QMContactosEMPRESA.AsInteger = 0) then
     QMContactosEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TCrmDMContactos.QMAccionesAfterOpen(DataSet: TDataSet);
begin
  xAgenteAccion.Close;
  xAgenteAccion.Open;

  QMAccionesDet.Close;
  QMAccionesDet.Open;
end;

procedure TCrmDMContactos.QMAccionesNewRecord(DataSet: TDataSet);
begin
  QMAccionesID_ACCION_CAB.AsInteger := 1;
  QMAccionesID_CONTACTO.AsInteger := QMContactosID_CONTACTO.AsInteger;
  QMAccionesEMPRESA_AGENTE.AsInteger := REntorno.Empresa;

  QMAccionesAGENTE.AsInteger := Agente;
  if (QMAccionesAGENTE.AsInteger = 0) then
     QMAccionesAGENTE.AsInteger := DameAgenteUsuario(REntorno.Usuario);
  if (QMAccionesAGENTE.AsInteger = 0) then
     QMAccionesAGENTE.AsInteger := REntorno.Agente;

  QMAccionesFECHA_ACCION.AsDateTime := REntorno.FechaTrab;
  // QMAccionesFECHA_ACCION.AsDateTime := QMAccionesCabFECHA_ACCION.AsDateTime;
  // QMAccionesDESCRIPCION_ACCION.AsString :=  QMAccionesCabDESCRIPCION_ACCION.AsString;
  QMAccionesFIN_ACCION.AsInteger := 0;
  QMAccionesHORA_PROX_ACCION.AsString := '';

  QMAccionesDOC_EMPRESAS.AsInteger := REntorno.Empresa;
  QMAccionesDOC_CANAL.AsInteger := REntorno.Canal;
  QMAccionesDOC_SERIES.AsString := REntorno.Serie;
  // QMAccionesDOC_EJERCICIO.AsInteger := REntorno.Ejercicio;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM CRM_CONTACTOS_ACCIONES WHERE ID_CONTACTO = :ID_CONTACTO';
        Params.ByName['ID_CONTACTO'].AsInteger := QMAccionesID_CONTACTO.AsInteger;
        ExecQuery;
        QMAccionesLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMContactos.QMPersonasNewRecord(DataSet: TDataSet);
begin
  QMPersonasID_CONTACTO.AsInteger := QMContactosID_CONTACTO.AsInteger;
  QMPersonasENVIO_EMAIL.AsInteger := 0;
  QMPersonasFECHA_EXPORTACION_CORREO.AsDateTime := EncodeDate(1900, 1, 1);
  QMPersonasBREVO.AsInteger := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(NUM_PERSONA) FROM CRM_CONTACTOS_PERSONAS WHERE ID_CONTACTO = :ID_CONTACTO';
        Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
        ExecQuery;
        QMPersonasNUM_PERSONA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMContactos.AbrirAgrupacion;
begin
  xAgrupDisp.Open;
  xAgrupSon.Open;
end;

procedure TCrmDMContactos.CerrarAgrupacion;
begin
  xAgrupDisp.Close;
  xAgrupSon.Close;
end;

procedure TCrmDMContactos.AgrupacionRellena;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO CRM_CONTACTOS_AGRUPACIONES (ID_CONTACTO, AGRUPACION) VALUES (:ID_CONTACTO, :AGRUPACION)';
        Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
        Params.ByName['AGRUPACION'].AsString := xAgrupDisp.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CerrarAgrupacion;
  AbrirAgrupacion;
end;

procedure TCrmDMContactos.AgrupacionVacia;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM CRM_CONTACTOS_AGRUPACIONES WHERE AGRUPACION = :AGRUPACION AND ID_CONTACTO = :ID_CONTACTO';
        Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
        Params.ByName['AGRUPACION'].AsString := xAgrupSon.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CerrarAgrupacion;
  AbrirAgrupacion;
end;

procedure TCrmDMContactos.Busca(EBusca: TEdit);
begin
  DMMain.Busca(EBusca.Text, QMContactos, 'ID_CONTACTO', 'NOMBRE_COMERCIAL');
end;

procedure TCrmDMContactos.QMContactosDIR_LOCALIDADChange(Sender: TField);
begin
  with xLocalidad do
  begin
     Close;
     Params.ByName['DIR_LOCALIDAD'].AsString := Sender.AsString;
     Open;
  end;
end;

function TCrmDMContactos.BusquedaCompleja: integer;
var
  Orden : string;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMContactos, '00000', False);

  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     with QMContactos do
     begin
        if (Result <> mrAll) then
        begin
           Orden := OrdenadoPor;
           Ordenar('');
           if (Agente <> 0) then
              SelectSQL.Add(' AND AGENTE = ' + IntToStr(Agente) + ' ');
           Ordenar(Orden);
        end
        else
        begin
           SelectSQL.Assign(SQLFind);
           SelectSQL.Add(' ORDER BY ID_CONTACTO ');
        end;
     end;
  end;

  QMContactos.Open;
end;

function TCrmDMContactos.ImportarTerceros: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_IMPORTA_TERCEROS(:EMPRESA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['NUM'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMContactos.Close;
  QMContactos.Open;
end;

procedure TCrmDMContactos.NuevoTercero(Direccion2, TipoDir, DirNombre, DirNumero, DirBloqEsc, DirPiso, DirPuerta: string; id_contacto: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_CREA_TERCERO(:ID_CONTACTO, :FECHA, :DIR_CLASE, :DIR_TIPO, :DIR_NOMBRE, :DIR_NOMBRE_2, :DIR_NUMERO, :DIR_BLOQUE_ESCALERA, :DIR_PISO, :DIR_PUERTA)';
        Params.ByName['ID_CONTACTO'].AsInteger := id_contacto; // QMContactosID_CONTACTO.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['DIR_CLASE'].AsInteger := 0;
        Params.ByName['DIR_TIPO'].AsString := TipoDir;
        Params.ByName['DIR_NOMBRE'].AsString := Copy(DirNombre, 1, 40);
        Params.ByName['DIR_NOMBRE_2'].AsString := Copy(Direccion2, 1, 40);
        Params.ByName['DIR_NUMERO'].AsString := Copy(DirNumero, 1, 15);
        Params.ByName['DIR_BLOQUE_ESCALERA'].AsString := Copy(DirBloqEsc, 1, 4);
        Params.ByName['DIR_PISO'].AsString := Copy(DirPiso, 1, 2);
        Params.ByName['DIR_PUERTA'].AsString := Copy(DirPuerta, 1, 6);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMContactos.DatosAccion(Accion: string; var Descripcion: string; var FinAccion: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION, FIN_ACCION FROM CRM_SYS_ACCIONES WHERE ACCION = :ACCION';
        Params.ByName['ACCION'].AsString := Accion;
        ExecQuery;
        Descripcion := FieldByName['DESCRIPCION'].AsString;
        FinAccion := FieldByName['FIN_ACCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMContactos.QMAccionesTIPO_ACCIONChange(Sender: TField);
var
  Descripcion : string;
  FinAccion : integer;
begin
  if (QMAcciones.State = dsInsert) then
  begin
     DatosAccion(QMAccionesTIPO_ACCION.AsString, Descripcion, FinAccion);
     QMAccionesDESCRIPCION_ACCION.AsString := Descripcion;
     QMAccionesFIN_ACCION.AsInteger := FinAccion;
  end;
end;

procedure TCrmDMContactos.QMAccionesTIPO_PROX_ACCIONChange(Sender: TField);
var
  Descripcion : string;
  FinAccion : integer;
begin
  DatosAccion(QMAccionesTIPO_ACCION.AsString, Descripcion, FinAccion);
  QMAccionesDESCRIPCION_PROX_ACCION.AsString := Descripcion;
end;

function TCrmDMContactos.ImportarClientes: integer;
var
  AgenteFiltro : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_IMPORTA_CLIENTES(:EMPRESA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['NUM'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMContactos.Close;

  AgenteFiltro := Agente;
  if (AgenteFiltro = 0) then
     AgenteFiltro := DameAgenteUsuario(REntorno.Usuario);
  if (AgenteFiltro = 0) then
     AgenteFiltro := REntorno.Agente;

  QMContactos.Params.ByName['AGENTE'].AsInteger := AgenteFiltro;
  QMContactos.Open;
end;

// sfg.albert - Filtre de la selecció d'agrupació o àmbits
procedure TCrmDMContactos.FiltraSeleccion(SQL: string; Tipo: integer);
var
  old_order : string;
  Tabla : TFIBTableSet;
begin
  // Tipo = 1 -> Agrupaciones
  // Tipo = 2 -> ámbitos

  if (SQL <> '') then
  begin
     CrmFMContactos.SWFIL := 1;
     // Posar cliente a la taula contactos per poder fer les següents selects
     Tabla := QMContactos;
     Tabla.Close;
     Tabla.SelectSQL.Text := 'SELECT * FROM CRM_VER_CONTACTOS WHERE ((AGENTE = ?AGENTE) OR (0 = ?AGENTE)) ORDER BY ID_CONTACTO';
     old_order := Tabla.OrdenadoPor;
     Tabla.Ordenar('');

     if (Tipo = 1) then
        Tabla.SelectSQL.Add(' AND (ID_CONTACTO IN (SELECT AGRUP.ID_CONTACTO FROM CRM_CONTACTOS_AGRUPACIONES AGRUP WHERE EMPRESA = ?EMPRESA AND ' + SQL + '))')
     else
     if (Tipo = 2) then
        Tabla.SelectSQL.Add(' AND (ID_CONTACTO IN (SELECT AMBI.ID_CRM_CONTACTO FROM CRM_AMBITOS_CONTACTO AMBI WHERE EMPRESA = ?EMPRESA AND ' + SQL + '))');

     Tabla.Ordenar(old_order);

     if (Tipo > 0) then
        Tabla.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

     Tabla.Params.ByName['AGENTE'].AsInteger := Agente;
     Tabla.Open;
  end
  else
     ShowMessage(_('Faltan datos por rellenar'));
end;

procedure TCrmDMContactos.QMAccionesDetNewRecord(DataSet: TDataSet);
begin
  QMAccionesDetID_CONTACTO.AsInteger := QMAccionesID_CONTACTO.AsInteger;
  QMAccionesDetLINEA_CAB.AsInteger := QMAccionesLINEA.AsInteger;
  QMAccionesDetID_ACCION.AsInteger := QMAccionesID_ACCION.AsInteger;
  QMAccionesDetFECHA.AsDateTime := REntorno.FechaTrabSH;
  QMAccionesDetHORA_ACCION.AsString := TimeToStr(Time);
  QMAccionesDetFIN_SEG.AsInteger := 0;

  // sfg.albert - Es busca quin és el tipus de seguiment assignat al tipus d'acció de l'acció
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SYS.TIPO_SEG ');
        SQL.Add(' FROM CRM_CONTACTOS_ACCIONES ACC ');
        SQL.Add(' LEFT JOIN CRM_SYS_ACCIONES SYS ');
        SQL.Add(' ON (SYS.ACCION = ACC.TIPO_ACCION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ACC.ID_ACCION = :ID_ACCION ');
        Params.ByName['ID_ACCION'].AsInteger := QMAccionesID_ACCION.AsInteger;
        ExecQuery;
        QMAccionesDetTIPO_SEG.AsString := FieldByName['TIPO_SEG'].AsString;
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
        SQL.Text := 'SELECT MAX(ORDEN) FROM CRM_CONTACTOS_ACCIONES_DET WHERE ID_ACCION = :ID_ACCION';
        Params.ByName['ID_ACCION'].AsInteger := QMAccionesDetID_ACCION.AsInteger;
        ExecQuery;
        QMAccionesDetORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // sfg.albert - Crea i obre el formulari de seguiment. Tracta si s'ha marcat
  // finalitzar i obrir un de nou
  (*
  ObrirSeguiment;
  *)
end;

procedure TCrmDMContactos.QMAccionesDetBeforePost(DataSet: TDataSet);
begin
  if (QMAccionesDetHORA_ACCION.AsString = '') then
     QMAccionesDetHORA_ACCION.AsString := TimeToStr(Time);
end;

procedure TCrmDMContactos.CanviEstatDetallAcc(Estado: integer);
begin
  if (Estado = 1) then
  begin
     CrmFmContactos.DBGDetallAccions.Color := clInfoBk;
     CrmFmContactos.NavAccionesDet.Enabled := False;
  end
  else
  begin
     CrmFmContactos.DBGDetallAccions.Color := clWindow;
     CrmFmContactos.NavAccionesDet.Enabled := True;
  end;
end;

procedure TCrmDMContactos.QMAccionesAfterScroll(DataSet: TDataSet);
begin
  CanviEstatDetallAcc(QMAccionesFIN_ACCION.AsInteger);
end;

procedure TCrmDMContactos.QMAccionesFIN_ACCIONChange(Sender: TField);
begin
  CanviEstatDetallAcc(QMAccionesFIN_ACCION.AsInteger);
end;

procedure TCrmDMContactos.QMAccionesDetAfterEdit(DataSet: TDataSet);
begin
  (*
  ObrirSeguiment;
  *)
end;

procedure TCrmDMContactos.ObrirSeguiment(Accion: char);
var
  old_id_accion_det, id_accion_det, id_accion_det_anterior : integer;
  CrearOtroSeguimiento : boolean;
begin
  CrearOtroSeguimiento := True;
  id_accion_det := 0;
  if (Accion = 'E') then
     id_accion_det := QMAccionesDetID_ACCION_DET.AsInteger;
  id_accion_det_anterior := QMAccionesDetID_ACCION_DET.AsInteger;

  old_id_accion_det := id_accion_det;

  while (CrearOtroSeguimiento) do
  begin
     AbreForm(TCrmFMContactosDetAcc, CrmFMContactosDetAcc);

     // Abro el seguimiento y obtengo el nuevo ID y si debo crear otro seguimiento
     CrearOtroSeguimiento := CrmFMContactosDetAcc.Mostrar('C', QMAccionesID_ACCION.AsInteger, id_accion_det);

     if ((id_accion_det <> 0) and (id_accion_det_anterior <> 0) and (id_accion_det <> id_accion_det_anterior)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE CRM_CONTACTOS_ACCIONES_DET ');
              SQL.Add(' SET ID_SEG_SIGUIENTE = ?ID_SEG_SIGUIENTE ');
              SQL.Add(' WHERE ID_ACCION_DET = ?ID_ACCION_DET ');
              Params.ByName['ID_SEG_SIGUIENTE'].AsInteger := id_accion_det;
              Params.ByName['ID_ACCION_DET'].AsInteger := id_accion_det_anterior;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if (CrearOtroSeguimiento) then
     begin
        id_accion_det_anterior := id_accion_det;
        id_accion_det := 0;
     end;

     CierraForm(CrmFMContactosDetAcc);
  end;

  if (id_accion_det = 0) then
     id_accion_det := old_id_accion_det;

  Refrescar(QMAccionesDet, 'ID_ACCION_DET', QMAccionesDetID_ACCION_DET.AsInteger);

  RefrescarAcciones;

  xSeguimientos.Close;
  xSeguimientos.Open;
end;

procedure TCrmDMContactos.QMContactosTERCEROChange(Sender: TField);
var
  Empresa : integer;
begin
  Empresa := QMContactosEMPRESA.AsInteger;
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  QMContactosCLIENTE.AsInteger := DameClienteDeTercero(QMContactosTERCERO.AsInteger, Empresa);

  QMContactosDIR_LOCALIDAD.AsString := xDireccionesDIR_LOCALIDAD.AsString;
end;

procedure TCrmDMContactos.QMRelContactoAmbitoNewRecord(DataSet: TDataSet);
begin
  QMRelContactoAmbitoID_CRM_CONTACTO.AsInteger := QMContactosID_CONTACTO.AsInteger;
end;

procedure TCrmDMContactos.QMRelContactoAmbitoDesc_AmbitoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // if (QMRelContactoAmbitoID_CRM_AMBITO.AsInteger>0) then
  // begin
  xAmbito.Close;
  xAmbito.Params.ByName['AMBITO'].AsInteger := QMRelContactoAmbitoID_CRM_AMBITO.AsInteger;
  xAmbito.Open;

  Text := xAmbitoDESCRIPCION.AsString;
  // end;
end;

procedure TCrmDMContactos.QMRelContactoAmbitoID_CRM_AMBITOChange(Sender: TField);
begin
  xAmbito.Close;
  xAmbito.Params.ByName['AMBITO'].AsInteger := QMRelContactoAmbitoID_CRM_AMBITO.AsInteger;
  xAmbito.Open;

  QMRelContactoAmbitoDesc_Ambito.AsString := xAmbitoDESCRIPCION.AsString;
end;

//sfg.albert - Procediment per crear els tercers dels contactes filtrats
function TCrmDMContactos.CrearTerceroMasivo: integer;
var
  num : integer;
begin
  QMContactos.DisableControls;
  try
     QMContactos.First;
     num := 0;
     while not (QMContactos.EOF) do
     begin
        if (QMContactosTERCERO.AsInteger = -1) then
        begin
           NuevoTercero('', 'CL', QMContactosDIR_NOMBRE.AsString, '', '', '', '', QMContactosID_CONTACTO.AsInteger);
           Inc(num);
        end;
        QMContactos.Next;
     end;

     Result := num;
     QMContactos.Close;
     QMContactos.Open;
  finally
     QMContactos.EnableControls;
  end;

  // ShowMessage(_('Proceso realizado con éxito'));
end;

procedure TCrmDMContactos.QMAccionesDOC_ACCIONChange(Sender: TField);
begin
  //sfg.albert - Es canvia l'exercici i altres segons excercici
  QMAccionesDOC_EMPRESAS.AsInteger := REntorno.Empresa;
  QMAccionesDOC_CANAL.AsInteger := REntorno.Canal;
  QMAccionesDOC_SERIES.AsString := REntorno.Serie;
end;

procedure TCrmDMContactos.TituloFiltraAgrupacion(Agrupacion: string);
begin
  with xTituloAgr do
  begin
     Close;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TCrmDMContactos.TituloFiltraAmbito(Ambito: string);
begin
  with xTituloAmb do
  begin
     Close;
     Params.ByName['AMBITO'].AsString := Ambito;
     Open;
  end;
end;

procedure TCrmDMContactos.CrearCliente(Cliente, Tercero, Agente: integer; FormaPago: string);
var
  ModoIva, Transportista : integer;
  CuentaDto, Cuenta, Semilla : string;
begin
  CuentaDto := DMMain.DameCuentaGestion(15, 1);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MODO_IVA FROM EMP_CANALES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        ModoIva := FieldByName['MODO_IVA'].AsInteger;
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
        SQL.Text := 'SELECT MIN(TRANSPORTISTA) FROM VER_TRANSPORTISTAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Transportista := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Semilla := DMMain.DameSemillaCuentaGestion(3, 1); // gestio=3 i tipus client=1
  Cuenta := ExpandirCadena(Semilla + IntToStr(cliente));

  if (FormaPago = '') then
     FormaPago := 'CON';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_CLIENTES_CUENTAS ');
        SQL.Add(' (EMPRESA, EJERCICIO, CANAL, CLIENTE, TERCERO, TARIFA, FORMA_PAGO, RIESGO_AUT, RIESGO_ACT, MODO_IVA, ');
        SQL.Add(' DIA_PAGO_1, DIA_PAGO_2, DESCUENTO_PP, DESCUENTO_CIAL, AGENTE, NOTAS, CUENTA, TITULO, PERFIL, ');
        SQL.Add(' TIPO_IRPF, PAIS, TIPO, PORTES, NOMBRE_COMERCIAL, USAR_ANTICIPOS, SU_PROVEEDOR, EVAL_FEB, EVAL_FEB_SI, ');
        SQL.Add(' MONEDA, FINANCIACION, FACTURAR_AGENTE, FACTURAR_TRANSPORTISTA, FACTURAR_REFERENCIA, ');
        SQL.Add(' FACTURAR_DIRECCION, FACTURAR_SERIE, SERIE_A_FACTURAR, FACTURAR_ALMACEN, TRANSPORTISTA, ');
        SQL.Add(' FACTURA_DIRECCION_ADMTVA, ALBARAN_DIRECCION_ENVIO, POR_FINANCIACION, NO_ALB_FAC, NO_VENTA_RIESGO, ');
        SQL.Add(' SU_REFERENCIA, RIESGO_FAC, RIESGO_ALB, RIESGO_CAR, RIESGO_REM, INTRA, INTRA_TRANS, FACTURAR_TARIFA, ');
        SQL.Add(' PAIS_C2, TIT_LOCALIDAD, CODIGO_POSTAL, CUENTA_DTOPP, DIAS_ENTREGA, APLICAR_PTO_VERDE, ');
        SQL.Add(' TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE, CODIGO_INCOTERM, ZONA) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :CLIENTE, :TERCERO, :TARIFA, :FORMA_PAGO, :RIESGO_AUT, :RIESGO_ACT, :MODO_IVA, ');
        SQL.Add(' :DIA_PAGO_1, :DIA_PAGO_2, :DESCUENTO_PP, :DESCUENTO_CIAL, :AGENTE, :NOTAS, :CUENTA, :TITULO, :PERFIL, ');
        SQL.Add(' :TIPO_IRPF, :PAIS, :TIPO, :PORTES, :NOMBRE_COMERCIAL, :USAR_ANTICIPOS, :SU_PROVEEDOR, :EVAL_FEB, :EVAL_FEB_SI, ');
        SQL.Add(' :MONEDA, :FINANCIACION, :FACTURAR_AGENTE, :FACTURAR_TRANSPORTISTA, :FACTURAR_REFERENCIA, ');
        SQL.Add(' :FACTURAR_DIRECCION, :FACTURAR_SERIE, :SERIE_A_FACTURAR, :FACTURAR_ALMACEN, :TRANSPORTISTA, ');
        SQL.Add(' :FACTURA_DIRECCION_ADMTVA, :ALBARAN_DIRECCION_ENVIO, :POR_FINANCIACION, :NO_ALB_FAC, :NO_VENTA_RIESGO, ');
        SQL.Add(' :SU_REFERENCIA, :RIESGO_FAC, :RIESGO_ALB, :RIESGO_CAR, :RIESGO_REM, :INTRA, :INTRA_TRANS, :FACTURAR_TARIFA, ');
        SQL.Add(' :PAIS_C2, :TIT_LOCALIDAD, :CODIGO_POSTAL, :CUENTA_DTOPP, :DIAS_ENTREGA, :APLICAR_PTO_VERDE, ');
        SQL.Add(' :TIPO_PORTES, :POR_PORTES, :I_PORTES, :RANGO, :INDICE, :CODIGO_INCOTERM, :ZONA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FORMA_PAGO'].AsString := FormaPago;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
        Params.ByName['MODO_IVA'].AsInteger := ModoIva;
        Params.ByName['PERFIL'].AsString := REntorno.Perfil;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['TIPO_IRPF'].AsInteger := 0;
        Params.ByName['AGENTE'].AsInteger := Agente;
        Params.ByName['TIPO'].AsInteger := 1;
        Params.ByName['Tercero'].AsInteger := Tercero;
        Params.ByName['PORTES'].AsInteger := 0;
        Params.ByName['USAR_ANTICIPOS'].AsInteger := 0;
        Params.ByName['EVAL_FEB'].AsInteger := 0;
        Params.ByName['EVAL_FEB_SI'].AsInteger := 0;
        Params.ByName['FINANCIACION'].AsInteger := 0;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['FACTURAR_DIRECCION'].AsInteger := 0;
        Params.ByName['FACTURAR_AGENTE'].AsInteger := 0;
        Params.ByName['FACTURAR_TRANSPORTISTA'].AsInteger := 0;
        Params.ByName['FACTURAR_REFERENCIA'].AsInteger := 0;
        Params.ByName['FACTURAR_ALMACEN'].AsInteger := 0;
        Params.ByName['FACTURAR_TARIFA'].AsInteger := 0;
        Params.ByName['POR_FINANCIACION'].AsFloat := 0;
        Params.ByName['APLICAR_PTO_VERDE'].AsInteger := 0;
        Params.ByName['TIPO_PORTES'].AsInteger := 0;
        Params.ByName['I_PORTES'].AsInteger := 0;
        Params.ByName['POR_PORTES'].AsInteger := 0;
        Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
        Params.ByName['INTRA'].AsInteger := 0;
        Params.ByName['INTRA_TRANS'].AsInteger := 0;
        Params.ByName['CUENTA_DTOPP'].AsString := CuentaDto;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['PAIS_C2'].AsString := DamePaisC2(REntorno.Pais);
        Params.ByName['CODIGO_INCOTERM'].AsString := 'EXW';
        Params.ByName['ZONA'].AsString := QMContactosZONA.AsString;
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
        SQL.Add(' INSERT INTO EMP_AGRUPACIONES_CLI ( ');
        SQL.Add(' EMPRESA, AGRUPACION, CLIENTE) ');
        SQL.Add(' SELECT :EMPRESA, AGRUPACION, :CLIENTE ');
        SQL.Add(' FROM CRM_CONTACTOS_AGRUPACIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONTACTO = :ID_CONTACTO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TCrmDMContactos.CrearClienteMasivo: integer;
var
  num : integer;
  Tercero : integer;
begin
  QMContactos.DisableControls;
  try
     QMContactos.First;
     num := 0;
     while not (QMContactos.EOF) do
     begin
        //sfg.albert - Si existe cliente,no lo creamos para evitar duplicidad
        if ((ExisteCliente) or (QMContactosCLI_PROV_IMP.AsString <> '')) then
        begin
           if (QMContactosTERCERO.AsInteger = -1) then
           begin
              NuevoTercero('', 'CL', QMContactosDIR_NOMBRE.AsString, '', '', '', '', QMContactosID_CONTACTO.AsInteger);
              QMContactos.Refresh;
           end;

           if (QMContactosCLI_PROV_IMP.AsInteger > 0) then
           begin
              if (QMContactosCLIENTE.AsInteger = 0) then
              begin
                 CrearCliente(QMContactosCLI_PROV_IMP.AsInteger, QMContactosTERCERO.AsInteger, QMContactosAGENTE.AsInteger, QMContactosFORMA_DE_PAGO_IMP.AsString);
                 Inc(num);
              end;

              // S'assigna aquest cliente al contacte
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE CRM_CONTACTOS SET CLIENTE = :CLIENTE, ZONA = :ZONA WHERE ID_CONTACTO = :ID_CONTACTO';
                    Params.ByName['CLIENTE'].AsInteger := StrToInt(QMContactosCLI_PROV_IMP.AsString);
                    Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
                    Params.ByName['ZONA'].AsString := '';
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end
        else  //sfg.albert - Si ya existe, updateamos con los valores de la BDD
        begin
           if ((QMContactosTERCERO.AsInteger = -1) and (QMContactosCLIENTE.AsInteger = 0)) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT FIRST (1) TERCERO ');
                    SQL.Add(' FROM VER_CLIENTES ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' CLIENTE = :CLI_PROV_IMP ');
                    SQL.Add(' ORDER BY CLIENTE DESC ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['CLI_PROV_IMP'].AsInteger := QMContactosCLI_PROV_IMP.AsInteger;
                    ExecQuery;
                    Tercero := FieldByName['TERCERO'].AsInteger;
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
                    SQL.Text := 'UPDATE CRM_CONTACTOS SET TERCERO = :TERCERO, CLIENTE = :CLIENTE WHERE ID_CONTACTO = :ID_CONTACTO';
                    Params.ByName['TERCERO'].AsInteger := Tercero;
                    Params.ByName['CLIENTE'].AsInteger := QMContactosCLI_PROV_IMP.AsInteger;
                    Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
        QMContactos.Next;
     end;

     QMContactos.Close;
     QMContactos.Open;
     QMContactos.First;
  finally
     QMContactos.EnableControls;
  end;
  QMContactos.Refresh;

  Result := num;

  //ShowMessage(_('Proceso realizado con éxito'));
end;

procedure TCrmDMContactos.QMContactosBeforeClose(DataSet: TDataSet);
begin
  xRazones.Close;
  xLocalidad.Close;

  QMRelContactoAmbito.Close;
  xDirecciones.Close;

  xVentas.Close;
  xVentasDetalle.Close;
  xVentasCRM.Close;

  QMPersonas.Close;
  xSeguimientos.Close;

  xAgrupSon.Close;
  xAgrupDisp.Close;
  QMAcciones.Close;
end;

procedure TCrmDMContactos.QMAccionesBeforeClose(DataSet: TDataSet);
begin
  xAgenteAccion.Close;
  QMAccionesDet.Close;
end;

function TCrmDMContactos.ExisteCliente: boolean;
begin
  // QMContactosCLI_PROV_IMP es tipo string, por lo que debo asegurarme de que se pueda convertir a integer
  Result := (DameIDCliente(StrToIntDef(QMContactosCLI_PROV_IMP.AsString, 0)) > 0);
end;

procedure TCrmDMContactos.MuestraEtiquetasFiltradas(Modo: byte; SWFIL, SWENLACE: integer);
var
  TempSQL, SQLFiltro : TStringList;
  // PlanTmp: string;
begin
  TempSql := TStringList.Create;
  try
     SqlFiltro := TStringList.Create;
     try
        SqlFiltro.AddStrings(QMContactos.SelectSQL);
        AbreData(TCrmDMLstContactoDetallado, CrmDMLstContactoDetallado);
        with CrmDMLstContactoDetallado do
        begin
           TempSql.AddStrings(xEtiquetas.SelectSQL);
           // PlanTmp := xEtiquetas.Plan.Text;
           // xEtiquetas.Plan.Text := QMContactos.Plan.Text;
           xEtiquetas.Close;
           xEtiquetas.SelectSQL.Assign(SqlFiltro);
           MostrarListadoEti(Modo, SWFIL, SWENLACE);
           xEtiquetas.Close;
           xEtiquetas.SelectSQL.Assign(TempSQL);
           // xEtiquetas.Plan.Text := PlanTmp;
        end;
        CierraData(CrmDMLstContactoDetallado);
     finally
        SqlFiltro.Free;
     end;
  finally
     TempSql.Free;
  end;
end;

procedure TCrmDMContactos.CambiarTercero(Tercero: integer; Cliente: integer = 0);
var
  DS : TFIBDataSet;
begin
  with QMContactos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM CRM_VER_CONTACTOS WHERE EMPRESA = :EMPRESA'); // AND ID_CONTACTO = :ID_CONTACTO'
     DMMain.FiltraTabla(QMContactos, '10000', True);
     Insert;
  end;

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        UniDirectional := True;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
           end;
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT TER.TERCERO, TER.DIRECCION, TER.NOMBRE_COMERCIAL, TER.NOMBRE_R_SOCIAL, TER.NIF, TER.PAIS_TERCERO, ');
           SelectSQL.Add('        CAST(SUBSTRING(TER.DIRECCION_LITERAL FROM 1 FOR 200) AS VARCHAR(200)) DIRECCION_LITERAL, TER.DIR_LOCALIDAD, ');
           SelectSQL.Add('        TER.TELEFONO01, TER.TELEFONO02, TER.TELEFAX, TER.EMAIL, TER.WEB, TER.TIPO_RAZON, ');
           SelectSQL.Add('        (SELECT FIRST 1 NOTAS FROM EMP_CLIENTES WHERE TERCERO = TER.TERCERO ORDER BY CLIENTE) AS NOTAS_CLIENTE ');
           SelectSQL.Add(' FROM VER_TERCEROS_EDICION TER ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' TER.TERCERO = :TERCERO ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;
           First;
           QMContactosTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
           QMContactosDIRECCION.AsInteger := FieldByName('DIRECCION').AsInteger;
           QMContactosNOMBRE_COMERCIAL.AsString := FieldByName('NOMBRE_COMERCIAL').AsString;
           QMContactosNOMBRE_R_SOCIAL.AsString := FieldByName('NOMBRE_R_SOCIAL').AsString;
           QMContactosNIF.AsString := FieldByName('NIF').AsString;
           QMContactosPAIS.AsString := FieldByName('PAIS_TERCERO').AsString;
           QMContactosDIR_NOMBRE.AsString := FieldByName('DIRECCION_LITERAL').AsString;
           QMContactosDIR_LOCALIDAD.AsString := FieldByName('DIR_LOCALIDAD').AsString;
           QMContactosTELEFONO01.AsString := FieldByName('TELEFONO01').AsString;
           QMContactosTELEFONO02.AsString := FieldByName('TELEFONO02').AsString;
           QMContactosTELEFAX.AsString := FieldByName('TELEFAX').AsString;
           QMContactosEMAIL.AsString := FieldByName('EMAIL').AsString;
           QMContactosWEB.AsString := FieldByName('WEB').AsString;
           QMContactosTIPO_RAZON.AsString := FieldByName('TIPO_RAZON').AsString;
           QMContactosNOTAS.AsString := FieldByName('NOTAS_CLIENTE').AsString;
           if Cliente <> 0 then
              QMContactosCLIENTE.AsInteger := Cliente;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     DS.Free;
  end;
end;

function TCrmDMContactos.DameClienteDeTercero(Tercero, Empresa: integer): integer;
begin
  Result := 0;
  if (Tercero <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST 1 CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND TERCERO = :TERCERO ORDER BY CLIENTE';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           Result := FieldByName['CLIENTE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TCrmDMContactos.ActualizarCliente(Tercero: integer): boolean;
var
  Empresa, Cliente : integer;
begin
  // Es busca el client
  Empresa := QMContactosEMPRESA.AsInteger;
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  Cliente := DameClienteDeTercero(Tercero, Empresa);

  // Es modifica el client i s'associa
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE CRM_CONTACTOS SET EMPRESA = :EMPRESA, CLIENTE = :CLIENTE WHERE ID_CONTACTO = :ID_CONTACTO';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['ID_CONTACTO'].AsInteger := QMContactosID_CONTACTO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Cliente <> 0) then
  begin
     QMContactos.Refresh;
     Result := True;
  end
  else
     Result := False;
end;

procedure TCrmDMContactos.RecogerDatos(IdAccionCab: integer);
begin
  if ((IdAccionCab <> 0) and (QMAcciones.State = dsInsert)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TIPO_ACCION, DESCRIPCION_ACCION FROM CRM_ACCIONES WHERE ID = :ID_ACCION_CAB';
           Params.ByName['ID_ACCION_CAB'].AsInteger := IdAccionCab;
           ExecQuery;
           QMAccionesTIPO_ACCION.AsString := FieldByName['TIPO_ACCION'].AsString;
           QMAccionesDESCRIPCION_ACCION.AsString := FieldByName['DESCRIPCION_ACCION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TCrmDMContactos.QMAccionesDetBeforeEdit(DataSet: TDataSet);
begin
  // Si la accion comercial esta finalizada, no debe permitir modificar los seguimientos
  if (QMAccionesFIN_ACCION.AsInteger = 1) then
     raise Exception.Create(_('La acción comercial está finalizada'));
end;

procedure TCrmDMContactos.CargarImagen(const FileName: string; Formato: string);
var
  m, f : TStream;
  HacerPost : boolean;
begin
  if (not (QMContactos.State in [dsInsert, dsEdit])) then
  begin
     QMContactos.Edit;
     HacerPost := True;
  end
  else
     HacerPost := False;

  QMContactosFORMATO.AsString := Formato;

  m := QMContactos.CreateBlobStream(QMContactosIMAGEN, bmWrite);
  try
     f := TFileStream.Create(FileName, fmOpenRead);
     try
        m.CopyFrom(f, f.Size);
     finally
        f.Free;
     end;
  finally
     m.Free;
  end;

  if HacerPost then
     QMContactos.Post;
end;

procedure TCrmDMContactos.CargarImagenDeArchivo(Imagen: TImage; Archivo: string);
begin
  try
     Imagen.Picture.LoadFromFile(Archivo);
  except
     on EInvalidGraphic do
     begin
        Imagen.Picture.Graphic := nil;
        MessageDlg(_('Formato de imagen no aceptado'), mtError, [mbOK], 0);
     end;
     on EFOpenError do
     begin
        Imagen.Picture.Graphic := nil;
     end;
  end;
end;

procedure TCrmDMContactos.PosicionarSeguimiento;
begin
  // Posiciono Accion y Detalle
  Posicionar(QMAcciones, 'ID_ACCION', xSeguimientosID_ACCION.AsInteger);
  Posicionar(QMAccionesDet, 'ID_ACCION_DET', xSeguimientosID_ACCION_DET.AsInteger);
end;

procedure TCrmDMContactos.FiltroAcciones(Filtro: integer);
begin
  /// Filtro 1-Todas, 2-Pendientes, 3-Finalizadas

  with QMAcciones do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM CRM_CONTACTOS_ACCIONES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONTACTO = :ID_CONTACTO ');
     SelectSQL.Add(' AND ((AGENTE = :AGENTE_USUARIO) OR (:AGENTE_USUARIO = 0)) ');
     if (Filtro = 2) then
        SelectSQL.Add(' AND FIN_ACCION = 0 ');
     if (Filtro = 3) then
        SelectSQL.Add(' AND FIN_ACCION = 1 ');
     SelectSQL.Add(' ORDER BY LINEA DESC ');
     Params.ByName['AGENTE_USUARIO'].AsInteger := Agente;
     Open;
  end;
end;

procedure TCrmDMContactos.FiltroContactos(Filtro: string);
begin
  if (Filtro <> '') then
  begin
     with QMContactos do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM CRM_VER_CONTACTOS ');
        SelectSQL.Add(' WHERE ' + Filtro);
        SelectSQL.Add(' ORDER BY ID_CONTACTO ');
        Open;
     end;
  end;
end;

procedure TCrmDMContactos.QMAccionesAfterPost(DataSet: TDataSet);
begin
  xSeguimientos.Close;
  xSeguimientos.Open;
end;

procedure TCrmDMContactos.RefrescarAcciones;
begin
  Refrescar(QMAcciones, 'ID_ACCION', QMAccionesID_ACCION.AsInteger);
end;

procedure TCrmDMContactos.FiltraAgente(aAgente, aIdRuta: integer);
var
  IdContacto : integer;
begin
  // Guarda la clave primaria del registro actual
  if QMContactos.Active and not QMContactos.IsEmpty then
     IdContacto := QMContactos.FieldByName('ID_CONTACTO').AsInteger
  else
     IdContacto := -1;

  Agente := aAgente;
  IdRuta := aIdRuta;

  with QMContactos do
  begin
     DisableControls; // Desactiva la actualización de los controles para mejorar el rendimiento
     try
        Close;
        SelectSQL.Assign(SQLFind);
        if (Agente <> 0) then
           SelectSQL.Add(' AND AGENTE = ' + IntToStr(Agente) + ' ');
        if (aIdRuta <> 0) then
           SelectSQL.Add(' AND ID_RUTA = ' + IntToStr(aIdRuta) + ' ');
        SelectSQL.Add(' ORDER BY ID_CONTACTO ');
        Open;

        // Reposiciona en el registro desde el final. (Si no lo encuentra queda en la primera posicion)
     finally
        EnableControls; // Reactiva la actualización de los controles
     end;
  end;

  Posicionar(QMContactos, 'ID_CONTACTO', IdContacto, False, True);

  with QMAcciones do
  begin
     DisableControls;
     try
        Close;
        Params.ByName['AGENTE_USUARIO'].AsInteger := Agente;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TCrmDMContactos.QMAccionesDetAfterOpen(DataSet: TDataSet);
begin
  xAccionDetAsuntos.Open;
end;

procedure TCrmDMContactos.QMAccionesDetBeforeClose(DataSet: TDataSet);
begin
  xAccionDetAsuntos.Close;
end;

procedure TCrmDMContactos.xAccionDetAsuntosNewRecord(DataSet: TDataSet);
begin
  xAccionDetAsuntosID_ACCION_DET.AsInteger := QMAccionesDetID_ACCION_DET.AsInteger;
end;

procedure TCrmDMContactos.ExportarCorreos(Fichero: string);
var
  ts : TStrings;
  IdContacto, NumPersona : integer;
begin
  /// Exporta correos de contactos (QMPersonas) de contactos filtrados
  /// Solo exporta Personas marcadas para envio de correo
  /// Solo exporta correos no exportados anteriormente

  // Guardo posicion en la tabla
  IdContacto := QMContactosID_CONTACTO.AsInteger;
  NumPersona := QMPersonasNUM_PERSONA.AsInteger;

  ts := TStringList.Create;
  try
     with QMContactos do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              with QMPersonas do
              begin
                 DisableControls;
                 try
                    // Hago Close..Open porque el DisableControls evita que funcione la actualización de registro por DdataSource 
                    // First;
                    Close;
                    Open;
                    while not EOF do
                    begin
                       // Solo exporto si están marcados y no fueron exportados anteriormente
                       if (QMPersonasENVIO_EMAIL.AsInteger = 1) and (QMPersonasFECHA_EXPORTACION_CORREO.AsDateTime <= EncodeDate(2000, 1, 1)) then
                       begin
                          ts.Add(format('"%s","%s","%s","%s"', [FieldByName('EMAIL').AsString, QMContactosNOMBRE_COMERCIAL.AsString, Trim(Trim(FieldByName('NOMBRE').AsString + ' ' + FieldByName('APELLIDOS').AsString)), FieldByName('TELEFONO').AsString]));

                          Edit;
                          QMPersonasFECHA_EXPORTACION_CORREO.AsDateTime := Date;
                          Post;
                       end;

                       Next;
                    end; //while
                 finally
                    EnableControls;
                 end;
              end;

              Next;
           end;
        finally
           EnableControls;
        end;
     end;

     ts.SaveToFile(Fichero);
  finally
     ts.Free;
  end;

  // Reposiciono
  Posicionar(QMContactos, 'ID_CONTACTO', IdContacto);
  Posicionar(QMPersonas, 'NUM_PERSONA', NumPersona);
end;

procedure TCrmDMContactos.FiltraVentas(TipoDocumento, Serie: string; FechaDesde, FechaHasta: TDateTime; Articulo, Descripcion: string; Pendientes: boolean; CampoOrdenDetalleVentas: string);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');
  if (LeeParametro('BUSASTR002') = 'S') then
     Descripcion := StringReplace(Descripcion, ' ', '%', [rfReplaceAll]);

  with xVentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND TIPO = :DOCTIPO ');
     if Pendientes and ((TipoDocumento = 'OFC') or (TipoDocumento = 'PEC') or (TipoDocumento = 'ALB')) then
        SelectSQL.Add(' AND ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY FECHA DESC, RIG ');

     Params.ByName['EMPRESA'].AsInteger := QMContactosEMPRESA.AsInteger;
     Params.ByName['CLIENTE'].AsInteger := QMContactosCLIENTE.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMContactosTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
     if (Serie <> ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     Open;
  end;

  with xVentasDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.SU_REFERENCIA, C.FORMA_PAGO, C.CAMPANYA, C.ESTADO, ');
     SelectSQL.Add('        C.POR_FINANCIACION, C.PORTES, C.TARIFA, C.FECHA_ENTREGA, C.IDIOMA, C.CONTACTO, C.ADJUNTO, C.I_PORTES, ');
     SelectSQL.Add('        C.POR_PORTES, C.TIPO_PORTES, C.RANGO, C.INDICE, C.CAMBIO_FIJO, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION, ');
     SelectSQL.Add('        C.TRANSPORTISTA, C.BANCO, D.*, CC.CODIGO_CLIENTE, ');
     SelectSQL.Add('        CASE C.TIPO ');
     SelectSQL.Add('          WHEN ''PEC'' THEN ');
     SelectSQL.Add('              DP.U_PENDIENTES ');
     SelectSQL.Add('          WHEN ''ALB'' THEN ');
     SelectSQL.Add('              DA.UNIDADES_A_FACTURAR ');
     SelectSQL.Add('          ELSE 0 ');
     SelectSQL.Add('        END AS U_PENDIENTES ');
     SelectSQL.Add(' FROM GES_CABECERAS_S C ');
     SelectSQL.Add(' JOIN GES_DETALLES_S D ');
     SelectSQL.Add(' ON C.ID_S = D.ID_S ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_CODCLI CC ');
     SelectSQL.Add(' ON C.EMPRESA = CC.EMPRESA AND D.ARTICULO = CC.ARTICULO AND C.CLIENTE = CC.CLIENTE ');
     SelectSQL.Add(' LEFT JOIN GES_DETALLES_S_PED DP ');
     SelectSQL.Add(' ON D.ID_DETALLES_S = DP.ID_DETALLES_S ');
     SelectSQL.Add(' LEFT JOIN GES_DETALLES_S_ALB DA ');
     SelectSQL.Add(' ON D.ID_DETALLES_S = DA.ID_DETALLES_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' C.TERCERO = :TERCERO /* Para utilizar indices */ ');
     SelectSQL.Add(' AND C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Serie <> ' ') then
        SelectSQL.Add(' AND C.SERIE = :SERIE ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND C.TIPO = :DOCTIPO ');
     if (Articulo <> '') then
        SelectSQL.Add(' AND D.ARTICULO = :ARTICULO ');
     if (Descripcion <> '') then
        SelectSQL.Add(' AND UPPER(D.TITULO) LIKE UPPER(:DESCRIPCION) ');
     if Pendientes and (TipoDocumento = 'PEC') then
        SelectSQL.Add(' AND C.ESTADO = 0 AND DP.SERVIDO = 0 ');
     if Pendientes and (TipoDocumento = 'ALB') then
        SelectSQL.Add(' AND C.ESTADO = 0 AND DA.UNIDADES_FACTURADAS <> D.UNIDADES ');
     if (CampoOrdenDetalleVentas = '') then
        SelectSQL.Add(' ORDER BY C.FECHA DESC, C.RIG, D.ORDEN ')
     else
     begin
        if (StrToIntDef(CampoOrdenDetalleVentas, 0) > 0) then
           SelectSQL.Add(' ORDER BY ' + CampoOrdenDetalleVentas)
        else
           SelectSQL.Add(' ORDER BY ' + IntToStr(ABS(StrToIntDef(CampoOrdenDetalleVentas, 0))) + ' DESC');
     end;

     Params.ByName['EMPRESA'].AsInteger := QMContactosEMPRESA.AsInteger;
     Params.ByName['CLIENTE'].AsInteger := QMContactosCLIENTE.AsInteger;
     Params.ByName['TERCERO'].AsInteger := QMContactosTERCERO.AsInteger;
     // Params.ByName['EJERCICIO'].AsInteger := QMClientesEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := QMClientesCANAL.AsInteger;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
     if (Serie <> ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     if (Articulo <> '') then
        Params.ByName['ARTICULO'].AsString := Articulo;
     if (Descripcion <> '') then
        Params.ByName['DESCRIPCION'].AsString := '%' + Descripcion + '%';

     Open;
  end;
end;

procedure TCrmDMContactos.CerrarVentas;
begin
  xVentas.Close;
  xVentasDetalle.Close;
end;

procedure TCrmDMContactos.FiltraAgrupacionDisponible(Filtro: string);
begin
  Filtro := Trim(Filtro);
  with xAgrupDisp do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT TITULO, AGRUPACION ');
     SelectSQL.Add(' FROM VER_AGRUPACIONES ');
     SelectSQL.Add(' WHERE ');
     if (Filtro > '') then
     begin
        SelectSQL.Add(' ((UPPER(TITULO) LIKE  UPPER(''%' + Copy(Filtro, 1, 40) + '%'')) OR ');
        SelectSQL.Add('  (UPPER(AGRUPACION) LIKE  UPPER(''%' + Copy(Filtro, 1, 3) + '%''))) AND ');
     end;
     SelectSQL.Add(' TIPO = ''C'' AND ');
     SelectSQL.Add(' AGRUPACION NOT IN (SELECT AGRUPACION ');
     SelectSQL.Add('                    FROM CRM_CONTACTOS_AGRUPACIONES ');
     SelectSQL.Add('                    WHERE ');
     SelectSQL.Add('                    ID_CONTACTO = :ID_CONTACTO) ');
     SelectSQL.Add(' ORDER BY AGRUPACION ');
     Open;
  end;
end;

procedure TCrmDMContactos.QMContactosCLIENTEChange(Sender: TField);
begin
  // Obtenemos las Notas del cliente para traspasar al contacto
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('SELECT NOTAS FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE');
           Params.ByName['EMPRESA'].AsInteger := QMContactosEMPRESA.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMContactosCLIENTE.AsInteger;
           Open;
           QMContactosNOTAS.AsString := FieldByName('NOTAS').AsString;
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

procedure TCrmDMContactos.CerrarDataSets;
begin
  CerrarVentas;
  CerrarAgrupacion;
  QMContactos.Close;
end;

end.
