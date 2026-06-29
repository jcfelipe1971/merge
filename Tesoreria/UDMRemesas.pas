unit UDMRemesas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  CVBNorma19CSB, Math, CVBNorma32CSB, CVBNorma58CSB, FIBDataSetRO,
  HYFIBQuery, UFParada;

type
  TDMRemesas = class(TDataModule)
     QMRemesas: TFIBTableSet;
     QMRemesasEMPRESA: TIntegerField;
     QMRemesasEJERCICIO: TIntegerField;
     QMRemesasCANAL: TIntegerField;
     QMRemesasREMESA: TIntegerField;
     QMRemesasSIGNO: TFIBStringField;
     QMRemesasBANCO: TIntegerField;
     QMRemesasIMPORTE_REMESA: TFloatField;
     QMRemesasRIESGO_REMESA: TFloatField;
     QMRemesasFECHA: TDateTimeField;
     QMRemesasLINEAS: TIntegerField;
     xInfoActualizada: TFIBDataSetRO;
     DSQMRemesas: TDataSource;
     xBancos: TFIBDataSetRO;
     DSxBancos: TDataSource;
     DSxInfoActualizada: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xInfoActualizadaEMPRESA: TIntegerField;
     xInfoActualizadaEJERCICIO: TIntegerField;
     xInfoActualizadaCANAL: TIntegerField;
     xInfoActualizadaREMESA: TIntegerField;
     xInfoActualizadaSIGNO: TFIBStringField;
     xInfoActualizadaBANCO: TIntegerField;
     xInfoActualizadaIMPORTE_REMESA: TFloatField;
     xInfoActualizadaRIESGO_REMESA: TFloatField;
     xInfoActualizadaFECHA: TDateTimeField;
     xInfoActualizadaLINEAS: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSIGNO: TFIBStringField;
     QMDetalleREGISTRO: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCTA_PAGO: TFIBStringField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetallePAGADO: TIntegerField;
     QMDetalleTIPO_EFECTO: TFIBStringField;
     QMDetalleREMESAR: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleREMESA: TIntegerField;
     QMDetalleDOC_NUMERO: TIntegerField;
     QMDetalleDOC_SERIE: TFIBStringField;
     QMDetalleDOC_FECHA: TDateTimeField;
     QMDetalleRIC: TIntegerField;
     QMDetalleRIVA: TIntegerField;
     QMRemesasTITULO: TFIBStringField;
     QMRemesasCERRADA: TIntegerField;
     xEmpresa: TFIBDataSetRO;
     xTerceroEmpresa: TFIBDataSetRO;
     DSxEmpresa: TDataSource;
     QMRemesasRIC: TIntegerField;
     QMRemesasVENCIDA: TIntegerField;
     QMRemesasABONADA: TIntegerField;
     QMRemesasRIC_ABONO: TIntegerField;
     QMRemesasGASTOS: TFloatField;
     QMRemesasIMPORTE_CA: TFloatField;
     QMDetalleCOD_CLI_PRO: TIntegerField;
     QMDetalleIMPAGADO: TIntegerField;
     QMRemesasFECHA_ABONO: TDateTimeField;
     DSxTerceroEmpresa: TDataSource;
     xLocalidadEmpresa: TFIBDataSetRO;
     xBancoRemesa: TFIBDataSetRO;
     QMClienteRecibo: TFIBTableSet;
     QMClienteReciboEMPRESA: TIntegerField;
     QMClienteReciboEJERCICIO: TIntegerField;
     QMClienteReciboCANAL: TIntegerField;
     QMClienteReciboCLIENTE: TIntegerField;
     QMClienteReciboTERCERO: TIntegerField;
     QMClienteReciboTARIFA: TFIBStringField;
     QMClienteReciboFORMA_PAGO: TFIBStringField;
     QMClienteReciboRIESGO_AUT: TFloatField;
     QMClienteReciboRIESGO_ACT: TFloatField;
     QMClienteReciboMODO_IVA: TIntegerField;
     QMClienteReciboDIA_PAGO_1: TIntegerField;
     QMClienteReciboDIA_PAGO_2: TIntegerField;
     QMClienteReciboDESCUENTO_PP: TFloatField;
     QMClienteReciboAGENTE: TIntegerField;
     QMClienteReciboNOTAS: TBlobField;
     QMClienteReciboCUENTA: TFIBStringField;
     QMClienteReciboTITULO: TFIBStringField;
     QMClienteReciboPERFIL: TFIBStringField;
     QMClienteReciboTIPO_IRPF: TIntegerField;
     QMClienteReciboPAIS: TFIBStringField;
     QMClienteReciboTIPO: TIntegerField;
     xTipoEfecto: TFIBTableSet;
     xTipoEfectoTIPO: TFIBStringField;
     xTipoEfectoTITULO: TFIBStringField;
     TLocal: THYTransaction;
     CVBNorma19CSB1: TCVBNorma19CSB;
     xCuentaClientes: TFIBTableSet;
     xCuentaClientesCOD_CLI_PRO: TIntegerField;
     DSxCuentaClientes: TDataSource;
     xClientesBancos: TFIBDataSetRO;
     xFacturas: TFIBDataSetRO;
     xCuentaClientesLINEA: TIntegerField;
     xDireccionCliente: TFIBDataSetRO;
     DSxClientes: TDataSource;
     xClientes: TFIBDataSetRO;
     QMRemesasTIPO_REMESA: TIntegerField;
     xOrdenantes: TFIBDataSetRO;
     QMDetalleVENCIMIENTO: TDateTimeField;
     xCuentaClientesREGISTRO: TIntegerField;
     xDescripcionRecibo: TFIBTableSet;
     DSxDescripcionRecibo: TDataSource;
     xDescripcionReciboUNIDADES: TFloatField;
     xDescripcionReciboUNIDAD: TFIBStringField;
     xDescripcionReciboTITULO: TFIBStringField;
     xDescripcionReciboLIQUIDO: TFloatField;
     xCodigoPostal: TFIBDataSetRO;
     DSxCodPostal: TDataSource;
     DSxDireccionCliente: TDataSource;
     Norma32: TCVBNorma32CSB;
     Norma58: TCVBNorma58CSB;
     xCuentasClientes58: TFIBTableSet;
     xCuentasClientes58REGISTRO: TIntegerField;
     xCuentasClientes58LINEA: TIntegerField;
     xCuentasClientes58COD_CLI_PRO: TIntegerField;
     xCuentasClientes58ENTIDAD: TFIBStringField;
     xCuentasClientes58SUCURSAL: TFIBStringField;
     xCuentasClientes58CONTROL: TFIBStringField;
     xCuentasClientes58CUENTA: TFIBStringField;
     xCuentasClientes58TERCERO: TIntegerField;
     xCuentasClientes58TITULO: TFIBStringField;
     QMDetalleFORMA_PAGO: TFIBStringField;
     QMDetalleACEPTADO: TIntegerField;
     QMDetalleDOC_TIPO: TFIBStringField;
     QMDetalleFECHA_CIERRE: TDateTimeField;
     QMDetalleESTADO_RECIBO: TFIBStringField;
     QMDetalleRECIBIDO: TIntegerField;
     xInfoActualizadaCERRADA: TIntegerField;
     xInfoActualizadaABONADA: TIntegerField;
     xInfoActualizadaVENCIDA: TIntegerField;
     DSXFacturas: TDataSource;
     xTextoRecibo: TFIBDataSetRO;
     QMDetalleFECHA_REGISTRO: TDateTimeField;
     QMDetalleEJERCICIO_CARTERA: TIntegerField;
     xCuentaClientesEJERCICIO_CARTERA: TIntegerField;
     xCuentasClientes58EJERCICIO_CARTERA: TIntegerField;
     xTextoReciboEMPRESA: TIntegerField;
     xTextoReciboEJERCICIO: TIntegerField;
     xTextoReciboCANAL: TIntegerField;
     xTextoReciboSIGNO: TFIBStringField;
     xTextoReciboREGISTRO: TIntegerField;
     xTextoReciboTEXTO: TFIBStringField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleLIQUIDO_CANAL: TFloatField;
     QMRemesasTIPO_ASIENTO: TFIBStringField;
     xDescripcionReciboMONEDA: TFIBStringField;
     QMDetalleFECHA_VALOR: TDateTimeField;
     QMRemesasTIPO_ASIENTO_KRI: TFIBStringField;
     QMDetalleABONO: TIntegerField;
     QMDetalleEJERCICIO_ABONO: TIntegerField;
     QMDetalleORIGEN_IMPAGADO: TIntegerField; {dji lrk kri diarios}
     QMRemesasRIC_VTO: TIntegerField;
     QMRemesasRIC_ABONO_2: TIntegerField;
     QMRemesasRIS_ABONO: TIntegerField;
     QMRemesasGASTOS_IVA: TFloatField;
     QMRemesasGASTOS_SIN_IVA: TFloatField;
     QMRemesasGASTOS_DESCUENTO: TFloatField;
     QMRemesasTIPO_REMESA_PAG: TIntegerField;
     QMDetalleMONEDA_CANAL: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleNOMBRE_COMERCIAL: TFIBStringField;
     QMDetalleNOMBRE_R_SOCIAL: TFIBStringField;
     QMDetalleTERCERO: TIntegerField;
     xCuentaClientesNOMBRE_COMERCIAL: TFIBStringField;
     xCuentaTerceros: TFIBDataSetRO;
     DSxCuentaTerceros: TDataSource;
     xCuentaTercerosENTIDAD: TFIBStringField;
     xCuentaTercerosSUCURSAL: TFIBStringField;
     xCuentaTercerosCONTROL: TFIBStringField;
     xInfoActualizadaTITULO: TFIBStringField;
     xInfoActualizadaRIC: TIntegerField;
     xInfoActualizadaRIC_VTO: TIntegerField;
     xInfoActualizadaRIC_ABONO: TIntegerField;
     xInfoActualizadaRIC_ABONO_2: TIntegerField;
     xInfoActualizadaRIS_ABONO: TIntegerField;
     xInfoActualizadaGASTOS: TFloatField;
     xInfoActualizadaGASTOS_IVA: TFloatField;
     xInfoActualizadaGASTOS_SIN_IVA: TFloatField;
     xInfoActualizadaGASTOS_DESCUENTO: TFloatField;
     xInfoActualizadaIMPORTE_CA: TFloatField;
     xInfoActualizadaFECHA_ABONO: TDateTimeField;
     xInfoActualizadaTIPO_REMESA: TIntegerField;
     xInfoActualizadaTIPO_REMESA_PAG: TIntegerField;
     xBancosRIESGO_UTI: TFloatField;
     xBancosRIESGO_CON: TFloatField;
     xBancosENTIDAD: TFIBStringField;
     xBancosSUCURSAL: TFIBStringField;
     xBancosTITULO: TFIBStringField;
     xEmpresaTERCERO: TIntegerField;
     xEmpresaTITULO: TFIBStringField;
     xLocalidadEmpresaCODPOSTAL: TFIBStringField;
     xLocalidadEmpresaTITULO: TFIBStringField;
     xBancoRemesaEMPRESA: TIntegerField;
     xBancoRemesaEJERCICIO: TIntegerField;
     xBancoRemesaCANAL: TIntegerField;
     xBancoRemesaBANCO: TIntegerField;
     xBancoRemesaTITULO: TFIBStringField;
     xBancoRemesaTERCERO: TIntegerField;
     xBancoRemesaENTIDAD: TFIBStringField;
     xBancoRemesaSUCURSAL: TFIBStringField;
     xBancoRemesaCONTROL: TFIBStringField;
     xBancoRemesaRIESGO_CON: TFloatField;
     xBancoRemesaRIESGO_UTI: TFloatField;
     xBancoRemesaRIESGO_DES: TFloatField;
     xBancoRemesaRIESGO_CFM: TFloatField;
     xBancoRemesaACTIVO: TIntegerField;
     xBancoRemesaCUENTA_CONTABLE: TFIBStringField;
     xBancoRemesaCUENTA_CC: TFIBStringField;
     xBancoRemesaCUENTA_AHORRO: TFIBStringField;
     xBancoRemesaCUENTA_CONFIRMING: TFIBStringField;
     xBancoRemesaCUENTA_DTO: TFIBStringField;
     xBancoRemesaSEPARA_APUNTES: TIntegerField;
     xBancoRemesaCUENTA_GASTOS: TFIBStringField;
     xBancoRemesaCUENTA_GASTOS_DESCUENTO: TFIBStringField;
     xBancoRemesaDIA_VALOR: TIntegerField;
     xBancoRemesaCUENTA_PAGARES: TFIBStringField;
     xBancoRemesaCUENTAS_GASTOS_PAGARES: TFIBStringField;
     xBancoRemesaCUENTA_INTERESES: TFIBStringField;
     xBancoRemesaRIESGO_DES_PAG: TFloatField;
     xOrdenantesVENCIMIENTO: TDateTimeField;
     xClientesBancosEMPRESA: TIntegerField;
     xClientesBancosEJERCICIO: TIntegerField;
     xClientesBancosCANAL: TIntegerField;
     xClientesBancosCLIENTE: TIntegerField;
     xClientesBancosTERCERO: TIntegerField;
     xClientesBancosTITULO: TFIBStringField;
     xClientesBancosNIF: TFIBStringField;
     xClientesBancosRIESGO_AUT: TFloatField;
     xClientesBancosRIESGO_ACT: TFloatField;
     xClientesBancosAGENTE: TIntegerField;
     xClientesBancosTARIFA: TFIBStringField;
     xClientesBancosDESCUENTO_PP: TFloatField;
     xClientesBancosFORMA_PAGO: TFIBStringField;
     xClientesBancosMODO_IVA: TIntegerField;
     xClientesBancosBANCO: TIntegerField;
     xClientesBancosTITULAR: TFIBStringField;
     xClientesBancosENTIDAD: TFIBStringField;
     xClientesBancosSUCURSAL: TFIBStringField;
     xClientesBancosCONTROL: TFIBStringField;
     xClientesBancosORDEN: TIntegerField;
     xFacturasDOC_NUMERO: TIntegerField;
     xFacturasDOC_SERIE: TFIBStringField;
     xFacturasDOC_FECHA: TDateTimeField;
     xFacturasREGISTRO: TIntegerField;
     xFacturasLINEA: TIntegerField;
     xFacturasLIQUIDO: TFloatField;
     xFacturasLIQUIDO_CANAL: TFloatField;
     xFacturasVENCIMIENTO: TDateTimeField;
     xFacturasTIPO_EFECTO: TFIBStringField;
     xFacturasDOC_FECHA1: TDateTimeField;
     xFacturasMONEDA: TFIBStringField;
     xFacturasMONEDA_CANAL: TFIBStringField;
     xFacturasDOC_TIPO: TFIBStringField;
     xClientesTERCERO: TIntegerField;
     xClientesTITULO: TFIBStringField;
     xDireccionClienteTERCERO: TIntegerField;
     xDireccionClienteNOMBRE_R_SOCIAL: TFIBStringField;
     xDireccionClienteNIF: TFIBStringField;
     xDireccionClienteDIR_COMPLETA: TFIBStringField;
     xDireccionClienteLOCALIDAD: TFIBStringField;
     xDireccionClienteTITULO_LOCALIDAD: TFIBStringField;
     xDireccionClienteDIR_TELEFONO01: TFIBStringField;
     xDireccionClienteDIR_TELEFONO02: TFIBStringField;
     xDireccionClienteDIR_TELEFAX: TFIBStringField;
     QMClienteReciboDESCUENTO_CIAL: TFloatField;
     QMClienteReciboPORTES: TIntegerField;
     QMClienteReciboNOMBRE_COMERCIAL: TFIBStringField;
     QMClienteReciboUSAR_ANTICIPOS: TIntegerField;
     QMClienteReciboSU_PROVEEDOR: TFIBStringField;
     QMClienteReciboEVAL_FEB: TIntegerField;
     QMClienteReciboEVAL_FEB_SI: TIntegerField;
     QMClienteReciboMONEDA: TFIBStringField;
     QMClienteReciboFINANCIACION: TIntegerField;
     QMClienteReciboFACTURAR_AGENTE: TIntegerField;
     QMClienteReciboFACTURAR_TRANSPORTISTA: TIntegerField;
     QMClienteReciboFACTURAR_REFERENCIA: TIntegerField;
     QMClienteReciboFACTURAR_DIRECCION: TIntegerField;
     QMClienteReciboFACTURAR_SERIE: TIntegerField;
     QMClienteReciboSERIE_A_FACTURAR: TFIBStringField;
     QMClienteReciboFACTURAR_ALMACEN: TIntegerField;
     QMClienteReciboTRANSPORTISTA: TIntegerField;
     QMClienteReciboFACTURA_DIRECCION_ADMTVA: TIntegerField;
     QMClienteReciboALBARAN_DIRECCION_ENVIO: TIntegerField;
     QMClienteReciboPOR_FINANCIACION: TFloatField;
     QMClienteReciboNO_ALB_FAC: TIntegerField;
     QMClienteReciboNO_VENTA_RIESGO: TIntegerField;
     QMClienteReciboSU_REFERENCIA: TFIBStringField;
     QMClienteReciboRIESGO_FAC: TFloatField;
     QMClienteReciboRIESGO_ALB: TFloatField;
     QMClienteReciboRIESGO_CAR: TFloatField;
     QMClienteReciboRIESGO_REM: TFloatField;
     QMClienteReciboINTRA: TIntegerField;
     QMClienteReciboINTRA_TRANS: TIntegerField;
     QMClienteReciboFACTURAR_TARIFA: TIntegerField;
     QMClienteReciboPAIS_C2: TFIBStringField;
     QMRemesasID_REMESAS: TIntegerField;
     QMDetalleID_CARTERA: TIntegerField;
     QMDetalleID_CARTERA_DETALLE: TIntegerField;
     QMDetalleID_DOC: TIntegerField;
     QMDetalleID_REMESAS: TIntegerField;
     xCuentaClientesID_CARTERA_DETALLE: TIntegerField;
     xFacturasID_CARTERA: TIntegerField;
     xFacturasID_DOC: TIntegerField;
     xCuentasClientes58ID_DOC: TIntegerField;
     xCuentasClientes58ID_CARTERA_DETALLE: TIntegerField;
     xCuentasClientes58ID_CARTERA: TIntegerField;
     QMDetalleBANCO_KRI: TIntegerField;
     xCuentaTercerosCUENTA: TFIBStringField;
     xBancoRemesaCUENTA_CORRIENTE: TFIBStringField;
     xBancoRemesaIBAN: TFIBStringField;
     xBancoRemesaBIC: TFIBStringField;
     xClientesBancosCUENTA: TFIBStringField;
     TUpdate: THYTransaction;
     QMDetalleAGRUP_COD_CLI_PRO_KRI: TIntegerField;
     xCuentasClientes58IBAN: TFIBStringField;
     xCuentasClientes58BIC: TFIBStringField;
     xCuentasClientes58BANCO: TIntegerField;
     xBancoNorma: TFIBDataSetRO;
     xLocalidadEmpresaC_PAIS: TFIBStringField;
     xCuentaTercerosIBAN: TFIBStringField;
     xCuentaTercerosBIC: TFIBStringField;
     xCuentaTercerosTIPO_ADEUDO_SEPA: TFIBStringField;
     xCuentaTercerosFIRMA: TFIBStringField;
     xCuentaTercerosTIPO_CONTRATO_SEPA: TFIBStringField;
     xBancosCODIGO_ORDENANTE: TFIBStringField;
     xBancosALFANUMERO: TFIBStringField;
     QMDetalleBANCO_CLIPRO: TIntegerField;
     xCuentaTercerosTITULO: TFIBStringField;
     QMRemesasFUERZA_VENCIMIENTO: TIntegerField;
     QMRemesasFECHA_VENCIMIENTO: TDateTimeField;
     QMDetalleENTIDAD: TFIBStringField;
     xBancosACTIVO: TIntegerField;
     procedure QMRemesasAfterOpen(DataSet: TDataSet);
     procedure DMRemesasCreate(Sender: TObject);
     procedure QMRemesasAfterScroll(DataSet: TDataSet);
     procedure QMRemesasNewRecord(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMRemesasBANCOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure xEmpresaAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure xTerceroEmpresaAfterOpen(DataSet: TDataSet);
     procedure CVBNorma19CSB1EnCasoError(Sender: TObject);
     procedure QMDetallePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMRemesasBeforePost(DataSet: TDataSet);
     procedure QMRemesasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure xTerceroEmpresaAfterScroll(DataSet: TDataSet);
     procedure DMRemesasDestroy(Sender: TObject);
     procedure xDireccionClienteAfterScroll(DataSet: TDataSet);
     procedure xDireccionClienteAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleLIQUIDO_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRemesasTIPO_ASIENTOChange(Sender: TField);
     procedure QMRemesasBeforeScroll(DataSet: TDataSet);
     procedure QMRemesasAfterPost(DataSet: TDataSet);
     procedure QMRemesasTIPO_ASIENTO_KRIChange(Sender: TField);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMRemesasFUERZA_VENCIMIENTOChange(Sender: TField);
  private
     { Private declarations }
     IdCed: string;
     FecSop: string;
     TotNumEfec: string;
     TotSumImp: string;
     NumEfec: string;
     IdEfTrunc: string;
     UltimoVto: string;
     verifica_riesgo_kri: boolean; {dji lrk kri}
     function Ajusta(sCampo, sOrientacion: string; iLongitud: integer; sRelleno: char): string;
     procedure ImprimirRemesa32;
     procedure ImpNorma58(Ordenante, NomCliOrd, Importe: string);
     procedure RefrescaDetalle;
     function DameReferenciaDocumento(id_s: integer): string;
  public
     { Public declarations }
     EsRemesa: boolean;
     Abono: integer;
     EjercicioVto: integer;
     Posicionando: boolean;
     procedure MostrarRecibosDisponibles;
     procedure MostrarPagaresDisponibles;
     function DameRemesa: integer;
     procedure BusquedaComplejaDetalle;
     procedure SeleccionarRecibosDetalle;
     procedure DeseleccionarRecibosDetalle;
     procedure DesAbonaRemesa;
     procedure AbonaRemesa(Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA: double; FechaAbono, FechaGastos: TDateTime; d1, d2, d3, d4, d5: string);
     procedure AbreRemesa;
     procedure CierraRemesa;
     procedure DesVenceRemesa;
     procedure PagaImpago(Fecha_pago: TDateTime; d1, d2, d3, d4, d5: string);
     procedure GeneraImpagado(Fecha: TDateTime; Gastos, GastosIVA, GastosSinIVA: double; d1, d2, d3, d4, d5: string; GastosEmpresa: boolean);
     procedure DesGeneraImpagado;
     procedure disco(cod: string; procedimiento, ref: smallint);
     procedure DesPagaImpagado;
     procedure disco32(cod, idcedente: string; truncados: boolean; entrecep, sucrecep: string; ref, detalle: smallint);
     procedure disco58(cod: string; entrecep, sucrecep, alfanumero: string; ref, detalle: smallint);
     procedure SEPA(cod, entrecep, sucrecep, alfanumero: string; ref, detalle: smallint);
     procedure Damesucursal(var entidad, sucursal: string);
     procedure DameDatosCSB(var cod, alfanumero: string);
     procedure GrabaCabecera;
     procedure GrabaDetalle;
     procedure BusquedaCompleja;
     procedure VenceRemesas(FechaValor: TDateTime; Forzar: boolean);
     procedure VenceRemesaActual(FechaValor: TDateTime; Forzar: boolean);
     procedure VenceReciboActual(FechaValor: TDateTime; Forzar: boolean);
     procedure DesVenceRecibo;
     function ReciboDescontado: boolean;
     procedure MarcaRecibosConAbono;
     function ObtenerAbono: integer;
     procedure MuestraAbonados;
     procedure MuestraPorAbonar;
     procedure DesAbonaAbono;
     function RemesaAbiertaCerrada: integer;
     procedure FiltraMaestro(Tipo: smallint);
     procedure AbonaTodo;
     procedure CalculaRIC_ABONO;
     function HayAbonosMarcados: boolean;
     function DameAsientoVto: integer;
     procedure FiltraPorRIC(ric: integer);
     function EsAgrupado: boolean;
     function PerteneceAgrupacion: boolean;
     procedure GeneraOrdenesDePago;
  end;

procedure ImpNorma19(Norma: TCVBNorma19CSB; Ordenante, NomCliOrd, Importe: string);
procedure Imp32Cabecera(C: TCVBNorma32CSB; FecSoporte: TDateTime; FTotNumEfectos: string; FTotSumImportes: string);
procedure Imp32Remesa(C: TCVBNorma32CSB; IdCedente, NumEfectos: string; SumaImportes: string; IdEfTruncado: string; FUltimoVto: TDateTime);
procedure Imp58Cabecera(C: TCVBNorma58CSB; FecSoporte: TDateTime);

var
  DMRemesas : TDMRemesas;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFMRemesas, uFBusca, UFPregFechasClientes,
  (*UDMListados,*) UFormGest, UFMain, SEPA, DateUtils, UParam;

{$R *.DFM}

procedure TDMRemesas.QMRemesasAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  xBancos.Open;
  // QMDetalle.Open;
  if QMRemesas.RecordCount = 0 then
     QMDetalle.Close;
end;

procedure TDMRemesas.DMRemesasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // No abrimos la tabla en el create pues se abrira al asignar el signo
  // en el formulario FMRemesas.
  xInfoActualizadaRIESGO_REMESA.DisplayFormat := MascaraN;
  xInfoActualizadaIMPORTE_REMESA.DisplayFormat := MascaraN;
  QMRemesasIMPORTE_REMESA.DisplayFormat := MascaraN;
  QMRemesasRIESGO_REMESA.DisplayFormat := MascaraN;
  QMDetalleLIQUIDO.DisplayFormat := MascaraN;
  xDescripcionReciboLIQUIDO.DisplayFormat := MascaraN;

  Posicionando := False;
  (*AbreData(TDMListados, DMListados);*)
  Abono := 0;
  verifica_riesgo_kri := True;

  DMMain.FiltraTabla(QMRemesas, '11100', False);
end;

procedure TDMRemesas.QMRemesasAfterScroll(DataSet: TDataSet);
begin
  if ((QMRemesas.State <> dsInsert) and (QMRemesas.State <> dsEdit) and (not Posicionando)) then
  begin
     FMRemesas.AjustarDetalle;
     if ((QMRemesasCERRADA.AsInteger = 1) and (QMRemesasABONADA.AsInteger = 0) and
        (Abono = 0)) then
        Abono := ObtenerAbono;
     FMRemesas.AjustaCheckRemesa(QMRemesasREMESA.FieldName, QMRemesasREMESA.AsInteger);
     FMRemesas.TCDetalleChange(DMRemesas);
  end;
end;

procedure TDMRemesas.QMRemesasNewRecord(DataSet: TDataSet);
begin
  QMDetalle.Close;

  // QMRemesasREMESA.AsInteger := DMMain.Contador_EEC('REM');
  QMRemesasEMPRESA.AsInteger := REntorno.Empresa;
  QMRemesasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMRemesasCANAL.AsInteger := REntorno.Canal;
  QMRemesasSIGNO.AsString := 'C';
  QMRemesasFECHA.AsDateTime := REntorno.FechaTrab;
  QMRemesasBANCO.AsInteger := DameBancoDefecto;
  QMRemesasTIPO_REMESA.AsInteger := 0;
  if ((EsRemesa) and (LeeParametro('REMTIPO001') = 'S')) then
     QMRemesasTIPO_REMESA.AsInteger := 1;
  QMRemesasTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_REM;
  QMRemesasTIPO_REMESA_PAG.AsInteger := BoolToInt(not EsRemesa);
  QMRemesasCERRADA.AsInteger := 0;
  QMRemesasABONADA.AsInteger := 0;
  QMRemesasFUERZA_VENCIMIENTO.AsInteger := 0;

  // Se informa al grid del detalle del formulario
  FMRemesas.AjustaCheckRemesa(QMRemesasREMESA.FieldName, QMRemesasREMESA.AsInteger);
end;

procedure TDMRemesas.AbreRemesa;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE E_CARTERA_ABRE_REMESA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?REMESA, ?ENTRADA, ?ID_REMESAS)');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := 'C';
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDetalle;
  QMRemesas.Refresh;
end;

procedure TDMRemesas.BusquedaComplejaDetalle;
var
  Orden : string;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        Orden := OrdenadoPor;
        Ordenar('');
        TFBusca.Create(Self).SeleccionaBusqueda(QMDetalle, '10100', False);
        if Active then
           Close;
        SelectSQL.Add(' AND SIGNO = ''C'' AND ((REMESA = 0 AND REMESAR = 1) OR (ID_REMESAS = ?ID_REMESAS)) ');
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Ordenar(Orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMRemesas.MostrarRecibosDisponibles;
var
  Orden : string;
begin
  FMRemesas.AjustaCheckRemesa(QMRemesasREMESA.FieldName, QMRemesasREMESA.AsInteger);
  with QMDetalle do
  begin
     DisableControls;
     Close;
     Orden := OrdenadoPor;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_REMESA WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' AND ((EJERCICIO = 0) OR (EJERCICIO = ?EJERCICIO)) ');
     SelectSQL.Add(' AND CANAL = ?CANAL ');
     SelectSQL.Add(' AND SIGNO = ''C'' ');
     SelectSQL.Add(' AND ((REMESA = 0 AND REMESAR = 1) OR (REMESA = ?REMESA)) ');
     SelectSQL.Add(' AND PAGADO = 0 ');
     SelectSQL.Add(' AND ((ACEPTADO = 0) OR (ACEPTADO = 1 AND RECIBIDO = 1)) ');
     if (DMMain.EstadoKri(475) = 0) then
        SelectSQL.Add(' AND LIQUIDO > 0 ');
     // acá tiene que venir un control para que lo haga solo en TB dji lrk kri
     if (DMMain.EstadoKri(2) = 1) then
        SelectSQL.Add(' AND BANCO_KRI = ' + QMRemesasBANCO.AsString + ' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
     Ordenar(Orden);
     Open;
     EnableControls;
  end;
end;

procedure TDMRemesas.MostrarPagaresDisponibles;
var
  orden : string;
begin
  FMRemesas.AjustaCheckRemesa(QMRemesasREMESA.FieldName, QMRemesasREMESA.AsInteger);
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        orden := OrdenadoPor;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_REMESA WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA ');
        SelectSQL.Add(' AND ((EJERCICIO = 0) OR (EJERCICIO = ?EJERCICIO)) ');
        SelectSQL.Add(' AND CANAL = ?CANAL ');
        SelectSQL.Add(' AND SIGNO = ''C'' ');
        SelectSQL.Add(' AND TIPO_EFECTO = ''PAG'' ');
        SelectSQL.Add(' AND ((REMESA = 0) OR (REMESA = ?REMESA)) ');
        SelectSQL.Add(' AND PAGADO = 0 ');
        SelectSQL.Add(' AND RECIBIDO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        Ordenar(orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMRemesas.QMDetalleAfterPost(DataSet: TDataSet);
var
  RiesgoUti, RiesgoCon, Liquido : double;
  pot10 : extended;
begin
  if (verifica_riesgo_kri) then
  begin
     xInfoActualizada.Refresh;

     with xBancos do
     begin
        Refresh;
        RiesgoUti := FieldByName('RIESGO_UTI').AsFloat;
        RiesgoCon := FieldByName('RIESGO_CON').AsFloat;
     end;

     Liquido := QMDetalle.FieldByName('LIQUIDO').AsFloat;
     pot10 := Power(10, REntorno.DecimalesCalculo);
     RiesgoCon := (Trunc(RiesgoCon * pot10)) / pot10;

     if (RiesgoCon > 0) then
        if (RiesgoCon < (RiesgoUti + Liquido)) then
           ShowMessage(_('El Riesgo Autorizado del Banco se ha superado'));
  end;
end;

procedure TDMRemesas.QMRemesasBANCOChange(Sender: TField);
begin
  with xBancos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMRemesas.SeleccionarRecibosDetalle;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CARTERA_REMESA ');
        SQL.Add(' SET ');
        SQL.Add(' REMESA = ' + QMRemesasREMESA.AsString);
        SQL.Add(' ,EJERCICIO = ' + QMRemesasEJERCICIO.AsString);
        SQL.Add(' ,ID_REMESAS =' + QMRemesasID_REMESAS.AsString);
        SQL.Add(' WHERE ');
        QMDetalle.DameFiltroSelect(SQL);
        if (DMMain.EstadoKri(2) = 1) then
           SQL.Add(' AND BANCO_KRI = ' + QMRemesasBANCO.AsString);

        if Params.ByName['ID_REMESAS'] = nil then
        begin
           if Params.ByName['EMPRESA'] <> nil then
           begin
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           end;
           Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        end
        else
           Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  verifica_riesgo_kri := False;
  with QMDetalle do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           Edit;
           QMDetalleREMESA.Value := QMRemesasREMESA.Value;
           QMDetalleEJERCICIO.Value := QMRemesasEJERCICIO.Value;
           Post;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
  verifica_riesgo_kri := True;
  QMDetalleAfterPost(QMDetalle);

  RefrescaDetalle;
end;

procedure TDMRemesas.DeseleccionarRecibosDetalle;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CARTERA_REMESA ');
        SQL.Add(' SET ');
        SQL.Add(' REMESA = 0, ');
        SQL.Add(' EJERCICIO = 0 ');
        SQL.Add(' WHERE ');
        QMDetalle.DameFiltroSelect(SQL);
        // dji lrk kri
        if (DMMain.EstadoKri(2) = 1) then
           SQL.Add(' AND BANCO_KRI = ' + QMRemesasBANCO.AsString);

        if Params.ByName['ID_REMESAS'] = nil then
        begin
           if Params.ByName['EMPRESA'] <> nil then
           begin
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           end;
           Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        end
        else
           Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMRemesas.Refresh;
  // Depende del estado de combo
  if EsRemesa then
     MostrarRecibosDisponibles
  else
     MostrarPagaresDisponibles;
end;

procedure TDMRemesas.RefrescaDetalle;
begin
  // Se refresca el detalle
  xInfoActualizada.Close;
  xInfoActualizada.Open;
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMRemesas.AbonaRemesa(Gastos, GastosIva, GastosSinIva, GastosDto, ImporteCA: double; FechaAbono, FechaGastos: TDateTime; d1, d2, d3, d4, d5: string);
var
  Q : THYFIBQuery;
begin
  // if QMRemesasAbono.State = dsEdit then
  //    QMRemesasAbono.Post;

  if (Abono = 0) then
     Abono := ObtenerAbono;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE E_CARTERA_ABONA_REMESA( ');
        SQL.Add(' ?EMPRESA, ?EJERCICIO, ?CANAL, ''C'', ?REMESA, ');
        SQL.Add(' ?ENTRADA, ?ABONO, ');
        SQL.Add(' ?GASTOS, ?GASTOSIVA, ?GASTOSSINIVA, ?GASTOS_DESCUENTO, ');
        SQL.Add(' ?IMPORTE_CA, ?FECHA_ABONO, ?FECHA_GASTOS, ?ID_REMESAS, ');
        SQL.Add(' ?D1, ?D2, ?D3, ?D4, ?D5) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ABONO'].AsInteger := Abono;
        Params.ByName['GASTOS'].AsDouble := Gastos;
        Params.ByName['GASTOSIVA'].AsDouble := GastosIva;
        Params.ByName['GASTOSSINIVA'].AsDouble := GastosSinIva;
        Params.ByName['GASTOS_DESCUENTO'].AsDouble := GastosDto;
        Params.ByName['IMPORTE_CA'].AsDouble := ImporteCA;
        Params.ByName['FECHA_ABONO'].AsDateTime := FechaAbono;
        Params.ByName['FECHA_GASTOS'].AsDateTime := FechaGastos;
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Params.ByName['D1'].AsString := d1;
        Params.ByName['D2'].AsString := d2;
        Params.ByName['D3'].AsString := d3;
        Params.ByName['D4'].AsString := d4;
        Params.ByName['D5'].AsString := d5;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  RefrescaDetalle;

  Abono := ObtenerAbono;
  QMRemesasAfterScroll(QMRemesas);

  QMRemesas.Refresh;
end;

procedure TDMRemesas.CierraRemesa;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE E_CARTERA_CIERRA_REMESA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?REMESA, ?FECHA, ?ENTRADA, ?ESTADO, ?ID_REMESAS)');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := 'C';
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        Params.ByName['FECHA'].AsDateTime := QMRemesasFECHA.AsDateTime;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ESTADO'].AsInteger := BoolToInt(not EsRemesa);
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDetalle;
  QMRemesas.Refresh;

  Abono := ObtenerAbono;
  FMRemesas.AjustaCheckRemesa('ABONO', Abono);
  QMRemesasAfterScroll(QMRemesas);
end;

procedure TDMRemesas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMRemesas.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  {if ((QMRemesasCERRADA.AsInteger=1) and (QMRemesasTIPO_REMESA.AsInteger = 0)) then
    begin
      ShowMessage('La Remesa está cerrada y no puede ser modificada');
    end
  else }
  if ((QMRemesas.State = dsInsert) or (QMRemesas.State = dsEdit)) then
  begin
     QMRemesas.Post;
     QMDetalle.Edit;
  end;
end;

procedure TDMRemesas.DesAbonaRemesa;
var
  Q : THYFIBQuery;
begin
  // Solo si esta abonada claro

  if (QMRemesasABONADA.AsInteger <> 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add('EXECUTE PROCEDURE E_CARTERA_DESABONA_REMESA(' +
              REntorno.EmpresaStr + ',' + QMRemesasEJERCICIO.AsString + ',' +
              REntorno.CanalStr + ',''C'',' + QMRemesasREMESA.AsString + ',' +
              REntorno.EntradaStr + ',' + QMRemesasID_REMESAS.AsString + ')');
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     RefrescaDetalle;
     QMRemesas.Refresh;
     if (Abono = 0) then
        Abono := ObtenerAbono;
     FMRemesas.AjustarDetalle;
  end
  else
     raise Exception.Create(_('La remesa no está abonada. Imposible DesAbonar.'));
end;

procedure TDMRemesas.DesGeneraImpagado;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE E_CARTERA_BORRA_IMPAGADO(' +
           REntorno.EmpresaStr + ',' + QMDetalleEJERCICIO_CARTERA.AsString +
           ',' + QMDetalleCANAL.AsString + ',''C'',' + QMDetalleREGISTRO.AsString +
           ',' + QMDetalleLINEA.AsString + ',' + QMDetalleID_CARTERA_DETALLE.AsString + ')');
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMDetalle.Refresh;
end;

procedure TDMRemesas.DesVenceRemesa;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE E_CARTERA_DESVENCE_REMESA(' +
           REntorno.EmpresaStr + ',' + REntorno.EjercicioStr + ',' + REntorno.CanalStr +
           ',''C'',' + QMRemesasREMESA.AsString + ',' + REntorno.EntradaStr + ')');
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

procedure TDMRemesas.PagaImpago(Fecha_pago: TDateTime; d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE E_CARTERA_PAGA_IMPAGADO( ');
        SQL.Add(' ?EMPRESA, ?EJERCICIO, ?CANAL, ''C'', ?REGISTRO, ?LINEA, ');
        SQL.Add(' ?FECHA_PAGO, ?FECHA_DIA, ?ENTRADA, ?ID_CARTERA_DET, ');
        SQL.Add(' ?D1, ?D2, ?D3, ?D4, ?D5) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO_CARTERA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REGISTRO'].AsInteger := QMDetalleREGISTRO.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['FECHA_PAGO'].AsDateTime := fecha_pago;
        Params.ByName['FECHA_DIA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_CARTERA_DET'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        {dji lrk kri - Centro Coste}
        Params.ByName['D1'].AsString := d1;
        Params.ByName['D2'].AsString := d2;
        Params.ByName['D3'].AsString := d3;
        Params.ByName['D4'].AsString := d4;
        Params.ByName['D5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRemesas.GeneraImpagado(Fecha: TDateTime; Gastos, GastosIVA, GastosSinIVA: double; d1, d2, d3, d4, d5: string; GastosEmpresa: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE E_CARTERA_GENERA_IMPAGADO( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, ''C'', :REGISTRO, :LINEA, ');
        SQL.Add(' :GASTOS, :GASTOS_IVA, :GASTOS_SIN_IVA, :FECHA_IMPAGADO, ');
        SQL.Add(' :FECHA_DIA, :ENTRADA, :ID_CARTERA_DET, :D1, :D2, :D3, :D4, :D5, :GASTOS_EMPRESA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO_CARTERA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REGISTRO'].AsInteger := QMDetalleREGISTRO.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['GASTOS'].AsDouble := Gastos;
        Params.ByName['GASTOS_IVA'].AsDouble := GastosIVA;
        Params.ByName['GASTOS_SIN_IVA'].AsDouble := GastosSinIVA;
        Params.ByName['FECHA_IMPAGADO'].AsDateTime := Fecha;
        Params.ByName['FECHA_DIA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_CARTERA_DET'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        {dji lrk kri - Centro de Coste}
        Params.ByName['D1'].AsString := d1;
        Params.ByName['D2'].AsString := d2;
        Params.ByName['D3'].AsString := d3;
        Params.ByName['D4'].AsString := d4;
        Params.ByName['D5'].AsString := d5;
        Params.ByName['GASTOS_EMPRESA'].AsInteger := BoolToInt(GastosEmpresa);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMDetalle.Refresh;
end;

procedure TDMRemesas.xEmpresaAfterOpen(DataSet: TDataSet);
begin
  xTerceroEmpresa.Close;
  xTerceroEmpresa.Open;
end;

procedure TDMRemesas.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QMClienteRecibo.Open;
  xTipoEfecto.Open;

  xCuentaTerceros.Open;
  if QMRemesas.RecordCount = 0 then
     QMDetalle.Close;
end;

procedure TDMRemesas.xTerceroEmpresaAfterOpen(DataSet: TDataSet);
begin
  xLocalidadEmpresa.Close;
  xLocalidadEmpresa.Open;
end;

procedure TDMRemesas.disco(cod: string; procedimiento, ref: smallint);
var
  Archivo : string;
  Ntitular, ncliente : string;
  bandera : integer;
begin
  bandera := 0;
  if (REntorno.Moneda = 'PTS') then
     CVBNorma19CSB1.Euros := False
  else if (REntorno.Moneda = 'EUR') then
     CVBNorma19CSB1.Euros := True
  else
     raise Exception.Create(_('La Norma 19 no está definida para esta moneda'));

  Archivo := Format(_('Remesa-%d-%.3d.txt'), [QMRemesasEJERCICIO.AsInteger, QMRemesasREMESA.AsInteger]); // Nombre de fichero Remesa-EJER-NNN
  if MySaveDialog(Archivo, 'TXT', '', 'DMRemesas') then
  begin
     CVBNorma19CSB1.NomFichero := Archivo;
     CVBNorma19CSB1.Impresion19 := @ImpNorma19;
     // Presentador
     with xEmpresa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     {Se abre por DataSource DSxEmpresa
     with xTerceroEmpresa do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := xEmpresa.FieldByName('TERCERO').AsInteger;
        Open;
     end;}
     with xBancoRemesa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMRemesasBANCO.AsInteger;
        Open;
     end;
     CVBNorma19CSB1.Presentador := Copy(xTerceroEmpresa.FieldByName('NIF').AsString, 1, 9);
     CVBNorma19CSB1.SufijoPres := cod;
     if (CVBNorma19CSB1.Presentador = '') then
        raise Exception.Create(_('Se debe asignar el NIF del presentador'));
     CVBNorma19CSB1.FecSoporte := Date;
     CVBNorma19CSB1.NomCliPres := xEmpresa.FieldByName('TITULO').AsString;
     CVBNorma19CSB1.EntRecepPres := xBancoREmesa.FieldByName('ENTIDAD').AsString;
     CVBNorma19CSB1.OfiRecepPres := xBancoREmesa.FieldByName('SUCURSAL').AsString;
     if ((CVBNorma19CSB1.EntRecepPres = '') or (CVBNorma19CSB1.OfiRecepPres = '')) then
        raise Exception.Create(_('Se debe asignar el banco del presentador'));

     CVBNorma19CSB1.Abrir;
     CVBNorma19CSB1.CompCabecera;

     with xOrdenantes do
     begin
        Close;
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Open;
     end;

     // Ordenante
     CVBNorma19CSB1.IniOrdenan;

     CVBNorma19CSB1.Ordenante := Copy(xTerceroEmpresa.FieldByName('NIF').AsString, 1, 9);
     if (CVBNorma19CSB1.Presentador = '') then
        raise Exception.Create(_('Se debe asignar el NIF del presentador'));

     CVBNorma19CSB1.FecCargo := xOrdenantes.FieldByName('VENCIMIENTO').AsDateTime;
     if (CVBNorma19CSB1.FecCargo < CVBNorma19CSB1.FecSoporte) then
        CVBNorma19CSB1.FecCargo := CVBNorma19CSB1.FecSoporte;
     CVBNorma19CSB1.SufijoOrd := cod;
     CVBNorma19CSB1.NomCliOrd := xEmpresa.FieldByName('TITULO').AsString;
     CVBNorma19CSB1.EntOrde := xBancoREmesa.FieldByName('ENTIDAD').AsString;
     CVBNorma19CSB1.OfiOrde := xBancoREmesa.FieldByName('SUCURSAL').AsString;
     CVBNorma19CSB1.DcOrde := xBancoREmesa.FieldByName('CONTROL').AsString;
     CVBNorma19CSB1.CcOrde := xBancoREmesa.FieldByName('CUENTA_CORRIENTE').AsString;
     if ((CVBNorma19CSB1.NomCliOrd = '') or (CVBNorma19CSB1.OfiOrde = '') or
        (CVBNorma19CSB1.CcOrde = '')) then
        raise Exception.Create(_('Se debe asignar el banco del presentador'));

     if procedimiento = 1 then
        CVBNorma19CSB1.Procedimiento := prPrimero
     else
        CVBNorma19CSB1.Procedimiento := prSegundo;

     CVBNorma19CSB1.CompOrdenante;

     // el que paga
     with xCuentaClientes do
     begin
        Close;
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Open;
        First;
     end;
     while not xCuentaClientes.EOF do
     begin
        ntitular := xCuentaClientesNOMBRE_COMERCIAL.AsString;
        ncliente := xCuentaClientesCOD_CLI_PRO.AsString;

        with xClientesBancos do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger :=
              xCuentaClientesEJERCICIO_CARTERA.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CLIENTE'].AsInteger := xCuentaClientesCOD_CLI_PRO.AsInteger;
           Open;
        end;
        CVBNorma19CSB1.NomTitDom := xClientesBancos.FieldByName('TITULO').AsString;
        CVBNorma19CSB1.EntTitDom := xClientesBancos.FieldByName('ENTIDAD').AsString;
        CVBNorma19CSB1.OfiTitDom := xClientesBancos.FieldByName('SUCURSAL').AsString;
        CVBNorma19CSB1.DcTitDom := xClientesBancos.FieldByName('CONTROL').AsString;
        CVBNorma19CSB1.CcTitDom := xClientesBancos.FieldByName('CUENTA').AsString;
        CVBNorma19CSB1.NomTitCta := xClientesBancos.FieldByName('TITULAR').AsString;
        if ((CVBNorma19CSB1.EntTitDom = '') or (CVBNorma19CSB1.DcTitDom = '') or
           (CVBNorma19CSB1.DcTitDom = '') or (CVBNorma19CSB1.CcTitDom = '')) then
        begin
           ShowMessage(Format(_('El cliente cod. %s %s no tiene cuenta asignada'), [ncliente, Trim(Ntitular)]));
           bandera := 1;
        end;
        if (bandera = 0) then
        begin
           with xFacturas do
           begin
              Close;
              Params.ByName['COD_CLI_PRO'].AsInteger :=
                 xCuentaClientesCOD_CLI_PRO.AsInteger;
              Params.ByName['ID_CARTERA_DETALLE'].AsInteger :=
                 xCuentaClientesID_CARTERA_DETALLE.AsInteger;
              Open;
           end;

           if (not CVBNorma19CSB1.Euros) then
           begin
              if xFacturas.FieldByName('MONEDA').AsString = 'PTS' then
                 CVBNorma19CSB1.ImportePts := xFacturas.FieldByName('LIQUIDO').AsInteger
              else
              begin
                 if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'PTS' then
                    CVBNorma19CSB1.ImportePts :=
                       xFacturas.FieldByName('LIQUIDO_CANAL').AsInteger
                 else
                    CVBNorma19CSB1.ImportePts := Trunc(DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'PTS', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat));
              end;
           end
           else
           begin
              if xFacturas.FieldByName('MONEDA').AsString = 'EUR' then
                 CVBNorma19CSB1.ImporteEU := xFacturas.FieldByName('LIQUIDO').AsFloat
              else
              begin
                 if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'EUR' then
                    CVBNorma19CSB1.ImporteEU := xFacturas.FieldByName('LIQUIDO_CANAL').AsFloat
                 else
                    CVBNorma19CSB1.ImportePts := Trunc(DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'EUR', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat));
              end;
           end;

           //CVBNorma19CSB1.Referencia := (inttostr (REntorno.Ejercicio)+inttostr (REntorno.Canal)+
           //  inttostr(xFacturas.FieldByName('DOC_NUMERO').AsInteger)+xFacturas.FieldByName('DOC_SERIE').AsString);

           // La referencia ahora identificará al deudor no a la deuda
           CVBNorma19CSB1.Referencia := xCuentaClientesCOD_CLI_PRO.AsString;

           // Información del Recibo

           if (xFacturas.FieldByName('DOC_NUMERO').AsInteger = 0) or
              (xFacturas.FieldByName('DOC_TIPO').AsString = 'AFC') then
           begin
              with xTextoRecibo do
              begin
                 Close;
                 Params.ByName['ID_CARTERA'].AsInteger :=
                    xFacturas.FieldByName('ID_CARTERA').AsInteger;
                 Open;
              end;
              CVBNorma19CSB1.CampConc1 := xTextoRecibo.FieldByName('TEXTO').AsString;
              CVBNorma19CSB1.CampConc := xTextoRecibo.FieldByName('TEXTO').AsString;
           end
           else
           begin
              if ref = 0 then
              begin
                 CVBNorma19CSB1.CampConc1 := 'Fact. ' +
                    IntToStr(xFacturas.FieldByName('DOC_NUMERO').AsInteger) +
                    '/' + xFacturas.FieldByName('DOC_SERIE').AsString +
                    ' del ' + DateToStr(xFacturas.FieldByName('DOC_FECHA').AsDateTime) +
                    '. Recibo ' + IntToStr(xFacturas.FieldByName('REGISTRO').AsInteger) +
                    '.' + IntToStr(xFacturas.FieldByName('LINEA').AsInteger);
                 CVBNorma19CSB1.CampConc := 'Factura ' +
                    IntToStr(xFacturas.FieldByName('DOC_NUMERO').AsInteger) +
                    '/' + xFacturas.FieldByName('DOC_SERIE').AsString;
              end
              else
              begin
                 CVBNorma19CSB1.CampConc1 := DameReferenciaDocumento(xFacturas.FieldByName('ID_DOC').AsInteger);
                 CVBNorma19CSB1.CampConc := CVBNorma19CSB1.CampConc1;
              end;

              // Información Detallada del Recibo

              with xDescripcionRecibo do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger :=
                    xCuentaClientesEJERCICIO_CARTERA.AsInteger;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SERIE'].AsString :=
                    xFacturas.FieldByName('DOC_SERIE').AsString;
                 Params.ByName['RIG'].AsInteger :=
                    xFacturas.FieldByName('DOC_NUMERO').AsInteger;
                 Open;
                 First;
              end;
              CVBNorma19CSB1.CampConc3 := ajusta(xDescripcionReciboUNIDADES.AsString, 'I',
                 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                 'D', 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              CVBNorma19CSB1.CampConc4 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;

              if not xDescripcionRecibo.EOF then
              begin
                 CVBNorma19CSB1.CampConc5 :=
                    ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                    ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                    'D', 3, ' ') +
                    Copy(xDescripcionReciboTITULO.AsString, 1, 29);

                 CVBNorma19CSB1.CampConc6 :=
                    Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                    Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                    1),
                    xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
                 xDescripcionRecibo.Next;
              end;
              if not xDescripcionRecibo.EOF then
              begin
                 CVBNorma19CSB1.CampConc7 :=
                    ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                    ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                    'D', 3, ' ') +
                    Copy(xDescripcionReciboTITULO.AsString, 1, 29);

                 CVBNorma19CSB1.CampConc8 :=
                    Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                    Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                    1),
                    xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
                 xDescripcionRecibo.Next;
              end;
              if not xDescripcionRecibo.EOF then
              begin
                 CVBNorma19CSB1.CampConc9 :=
                    ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                    ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                    'D', 3, ' ') +
                    Copy(xDescripcionReciboTITULO.AsString, 1, 29);

                 CVBNorma19CSB1.CampConc10 :=
                    Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                    Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                    1),
                    xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
                 xDescripcionRecibo.Next;
              end;
              if not xDescripcionRecibo.EOF then
              begin
                 CVBNorma19CSB1.CampConc11 :=
                    ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                    ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                    'D', 3, ' ') +
                    Copy(xDescripcionReciboTITULO.AsString, 1, 29);

                 CVBNorma19CSB1.CampConc12 :=
                    Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                    Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                    1),
                    xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
                 xDescripcionRecibo.Next;
              end;
              if not xDescripcionRecibo.EOF then
              begin
                 CVBNorma19CSB1.CampConc13 :=
                    ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                    ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                    'D', 3, ' ') +
                    Copy(xDescripcionReciboTITULO.AsString, 1, 29);

                 CVBNorma19CSB1.CampConc14 :=
                    Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                    Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                    1),
                    xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
                 xDescripcionRecibo.Next;
              end;
              if not xDescripcionRecibo.EOF then
              begin
                 CVBNorma19CSB1.CampConc15 :=
                    ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                    ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                    'D', 3, ' ') +
                    Copy(xDescripcionReciboTITULO.AsString, 1, 29);

                 CVBNorma19CSB1.CampConc16 :=
                    Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                    Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                    1),
                    xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
                 xDescripcionRecibo.Next;
              end;
           end;
           with xDireccionCliente do
           begin
              Close;
              Params.ByName['TERCERO'].AsInteger :=
                 xClientesBancos.FieldByName('TERCERO').AsInteger;
              Open;
           end;
           CVBNorma19CSB1.DomTitCta := xDireccionCliente.FieldByName('DIR_COMPLETA').AsString;
           CVBNorma19CSB1.PlzTitCta := xDireccionCliente.FieldByName('TITULO_LOCALIDAD').AsString;
           CVBNorma19CSB1.CPtTitCta := xCodigoPostal.FieldByName('CODPOSTAL').AsString;

           CVBNorma19CSB1.CompRegistro;
        end;
        bandera := 0;
        xCuentaClientes.Next;
     end;
     CVBNorma19CSB1.FinOrdenan;

     CVBNorma19CSB1.Cerrar;
     // CVBNorma19CSB1.Free;
  end;
end;

procedure ImpNorma19(Norma: TCVBNorma19CSB; Ordenante, NomCliOrd, Importe: string);
begin
  ShowMessage(Format(_('Doc.Ordenante: %s' + #13#10 +
     'Nombre       : %s' + #13#10 +
     'Importe      : %s'), [Ordenante, NomCliOrd, Importe]));
end;

procedure TDMRemesas.CVBNorma19CSB1EnCasoError(Sender: TObject);
begin
  MessageDlg('Error :' + IntToStr(CVBNorma19CSB1.NrError), mtConfirmation,
     [mbYes, mbNo], 0);
end;

procedure TDMRemesas.QMDetallePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if DataSet.State = dsEdit then
     DataSet.Cancel;
end;

procedure TDMRemesas.QMRemesasBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and
     ((QMRemesasREMESA.AsInteger = 0) or (QMRemesasREMESA.IsNull))) then
  begin
     QMRemesasREMESA.AsInteger := DMMain.Contador_EEC('REM');
     DMMain.Contador_Gen(DataSet, 'ID_CARTERA_REMESAS', 'ID_REMESAS');

     if (Trim(QMRemesasTITULO.AsString) = '') then
        QMRemesasTITULO.AsString := format(_('REMESA-%d-%.3d'), [QMRemesasEJERCICIO.AsInteger, QMRemesasREMESA.AsInteger]);
  end;
end;

procedure TDMRemesas.QMRemesasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMRemesas.State = dsInsert then
     QMRemesasREMESA.Clear;
end;

procedure TDMRemesas.xTerceroEmpresaAfterScroll(DataSet: TDataSet);
begin
  xLocalidadEmpresa.Close;
  xLocalidadEmpresa.Open;
end;

procedure TDMRemesas.DMRemesasDestroy(Sender: TObject);
begin
  (*CierraData(DMListados);*)
end;

procedure TDMRemesas.DesPagaImpagado;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_BORRA_PAGO (?EMPRESA, ?EJERCICIO, ?CANAL, ''C'', ?REGISTRO, ?LINEA, ?ID_CARTERA_DET)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO_CARTERA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REGISTRO'].AsInteger := QMDetalleREGISTRO.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ID_CARTERA_DET'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRemesas.Ajusta(sCampo, sOrientacion: string; iLongitud: integer; sRelleno: char): string;
begin
  sCampo := Trim(sCampo);
  if Length(sCampo) > iLongitud then
     sCampo := Copy(sCampo, 1, iLongitud);
  if UpperCase(sOrientacion) = 'I' then
     Result := StringOfChar(sRelleno, iLongitud - Length(sCampo)) + sCampo
  else
     Result := sCampo + StringOfChar(sRelleno, iLongitud - Length(sCampo));
end;

procedure TDMRemesas.xDireccionClienteAfterScroll(DataSet: TDataSet);
begin
  xCodigoPostal.Close;
  xCodigoPostal.Open;
end;

procedure TDMRemesas.xDireccionClienteAfterOpen(DataSet: TDataSet);
begin
  xCodigoPostal.Close;
  xCodigoPostal.Open;
end;

function TDMRemesas.DameReferenciaDocumento(id_s: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SU_REFERENCIA FROM GES_CABECERAS_S WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := xFacturas.FieldByName('ID_DOC').AsInteger;
        ExecQuery;
        Result := FieldByName['SU_REFERENCIA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRemesas.disco32(cod, idcedente: string; truncados: boolean; entrecep, sucrecep: string; ref, detalle: smallint);
var
  Archivo : string;
begin
  if (REntorno.Moneda = 'PTS') then
     Norma32.Euros := False
  else if (REntorno.Moneda = 'EUR') then
     Norma32.Euros := True
  else
     raise Exception.Create(_('La Norma 32 no está definida para esta moneda'));

  Archivo := Format(_('Remesa-%d-%.3d.txt'), [QMRemesasEJERCICIO.AsInteger, QMRemesasREMESA.AsInteger]); // Nombre de fichero Remesa-EJER-NNN
  if MySaveDialog(Archivo, 'TXT', '', 'DMRemesas') then
  begin
     Norma32.NomFichero := Archivo;
     Norma32.Impresion32Cabecera := @Imp32Cabecera;
     Norma32.Impresion32Remesa := @Imp32Remesa;
     norma32.Abrir;
     // Datos de la empresa
     with xEmpresa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;

     // Cabecera General del Soporte

     Norma32.NOrdSoporte := cod;
     Norma32.FecSoporte := QMRemesasFECHA.Value;
     Norma32.EntRecep := entrecep;
     Norma32.SucRecep := sucrecep;
     if ((Norma32.EntRecep = '') or (Norma32.SucRecep = '')) then
        raise Exception.Create(_('Se debe asignar la sucursal receptora'));
     Norma32.CompCabecera;
     // Inicialización de las variables del registro fin de remesa
     Norma32.IniFinRemesa;
     // Cabecera de Remesa
     Norma32.IniRemesa;
     Norma32.NumRemesa := cod;
     Norma32.IdCedente := idcedente;
     if truncados then
        Norma32.IdEfTruncado := '0'
     else
        Norma32.IdEfTruncado := '1';
     with xBancoRemesa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMRemesasBANCO.AsInteger;
        Open;
     end;
     Norma32.AbonoCodEntidad := xBancoREmesa.FieldByName('ENTIDAD').AsString;
     Norma32.AbonoCodSucursal := xBancoREmesa.FieldByName('SUCURSAL').AsString;
     Norma32.AbonoClaveControl := xBancoREmesa.FieldByName('CONTROL').AsString;
     Norma32.AbonoNumCuenta := xBancoRemesa.FieldByName('CUENTA_CORRIENTE').AsString;
     Norma32.AdeudoCodEntidad := xBancoREmesa.FieldByName('ENTIDAD').AsString;
     Norma32.AdeudoCodSucursal := xBancoREmesa.FieldByName('SUCURSAL').AsString;
     Norma32.AdeudoClaveControl := xBancoREmesa.FieldByName('CONTROL').AsString;
     Norma32.AdeudoNumCuenta := xBancoRemesa.FieldByName('CUENTA_CORRIENTE').AsString;
     Norma32.ImpagCodEntidad := xBancoREmesa.FieldByName('ENTIDAD').AsString;
     Norma32.ImpagCodSucursal := xBancoREmesa.FieldByName('SUCURSAL').AsString;
     Norma32.ImpagClaveControl := xBancoREmesa.FieldByName('CONTROL').AsString;
     Norma32.ImpagNumCuenta := xBancoRemesa.FieldByName('CUENTA_CORRIENTE').AsString;
     Norma32.CompRemesa;

     // Registros Individuales

     with xCuentaClientes do
     begin
        Close;
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Open;
        First;
     end;
     while not xCuentaClientes.EOF do
     begin
        Norma32.IniRegistro;

        // Registro de tipo I

        // Norma32.CodINELibramiento -> Es opcional y no lo tenemos
        Norma32.NProvLibramiento := Copy(xLocalidadEmpresa.FieldByName('CODPOSTAL').AsString,
           1, 2);
        Norma32.PlazaLibramiento := xLocalidadEmpresa.FieldByName('TITULO').AsString;

        with xFacturas do
        begin
           Close;
           Params.ByName['COD_CLI_PRO'].AsInteger :=
              xCuentaClientesCOD_CLI_PRO.AsInteger;
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger :=
              xCuentaClientesID_CARTERA_DETALLE.AsInteger;
           Open;
        end;
        // norma32.NumDocumento := (copy(REntorno.EjercicioStr, 3, 2) + '.' + xFacturasDOC_SERIE.AsString + '.' +
        //   FormatFloat('00000', xFacturasDOC_NUMERO.Asinteger) + '/' + xCuentaClientesLINEA.AsString);
        if ref = 0 then
        begin
           norma32.NumDocumento := xCuentaClientesEJERCICIO_CARTERA.AsString +
              '/' + xFacturas.FieldByName('DOC_SERIE').AsString + '-' +
              FormatFloat('0', xCuentaClientesLINEA.AsInteger) + ' ' +
              FormatFloat('00000', xFacturas.FieldByName('DOC_NUMERO').AsInteger);
        end
        else
        begin
           norma32.NumDocumento := DameReferenciaDocumento(xFacturas.FieldByName('ID_DOC').AsInteger);
        end;

        Norma32.VtoEfecto := xFacturas.FieldByName('VENCIMIENTO').AsDateTime;

        if (not norma32.Euros) then
        begin
           if xFacturas.FieldByName('MONEDA').AsString = 'PTS' then
              Norma32.ImpEfecto := xFacturas.FieldByName('LIQUIDO').AsInteger
           else
           begin
              if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'PTS' then
                 Norma32.ImpEfecto := xFacturas.FieldByName('LIQUIDO_CANAL').AsInteger
              else
                 Norma32.ImpEfecto := DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'PTS', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat);
           end;
        end
        else
        begin
           if xFacturas.FieldByName('MONEDA').AsString = 'EUR' then
              Norma32.ImpEfecto := xFacturas.FieldByName('LIQUIDO').AsFloat
           else
           begin
              if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'EUR' then
                 Norma32.ImpEfecto := xFacturas.FieldByName('LIQUIDO_CANAL').AsFloat
              else
                 Norma32.ImpEfecto := DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'EUR', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat);
           end;
        end;

        // Registro de tipo II
        with xClientesBancos do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger :=
              xCuentaClientesEJERCICIO_CARTERA.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CLIENTE'].AsInteger := xCuentaClientesCOD_CLI_PRO.AsInteger;
           Open;
        end;

        norma32.CCCCodEntidad := xClientesBancos.FieldByName('ENTIDAD').AsString;
        norma32.CCCCodSucursal := xClientesBancos.FieldByName('SUCURSAL').AsString;
        norma32.CCCClaveControl := xClientesBancos.FieldByName('CONTROL').AsString;
        norma32.CCCNumCuenta := xClientesBancos.FieldByName('CUENTA').AsString;
        if ((norma32.CCCCodEntidad = '') and (norma32.CCCCodSucursal = '') and
           (norma32.CCCClaveControl = '') and (norma32.CCCNumCuenta = '')) then
        begin
           norma32.CCCCodEntidad := '0000';
           norma32.CCCCodSucursal := '0000';
           norma32.CCCClaveControl := '00';
           norma32.CCCNumCuenta := '0000000000';
        end
        else if ((norma32.CCCCodEntidad = '0000') or
           (norma32.CCCCodSucursal = '0000') or
           (norma32.CCCClaveControl = '**') or (norma32.CCCNumCuenta = '!')) then
           raise Exception.Create(Format(_('La cuenta bancaria del recibo %s no es válida'), [Norma32.NumDocumento]));

        // Definimos si el recibo es aceptado o no, y si lleva gastos.

        norma32.ClausulaGastos := '0';
        norma32.CodAcepto := '2';

        // Sólo se permiten pagarés y recibos, no Letras, ya que en G2K falta
        //   la información referente a la aceptación y los gastos de las mismas.

        if xFacturas.FieldByName('TIPO_EFECTO').AsString = 'PAG' then
           norma32.Tipodocumento := '3'
        else if xFacturas.FieldByName('TIPO_EFECTO').AsString = 'REC' then
           norma32.Tipodocumento := '2'
        else
           raise Exception.Create(_('La versión actual del CSB32 no permite este tipo de efectos'));
        if norma32.Tipodocumento = '3' then
           norma32.FEchaLibramiento := xFacturas.FieldByName('DOC_FECHA').AsDateTime;

        norma32.NomLibrador := xEmpresa.FieldByName('TITULO').AsString;
        // El que cobra
        norma32.NomLibrado := xClientesBancos.FieldByName('TITULAR').AsString;
        // El que paga
        if (xFacturas.FieldByName('DOC_NUMERO').AsInteger = 0) or
           (xFacturas.FieldByName('DOC_TIPO').AsString = 'AFC') then
        begin
           with xTextoRecibo do
           begin
              Close;
              Params.ByName['ID_CARTERA'].AsInteger :=
                 xFacturas.FieldByName('ID_CARTERA').AsInteger;
              Open;
           end;
           norma32.InfoAdicional := xTextoRecibo.FieldByName('TEXTO').AsString;
        end
        else
        begin
           if ref = 0 then
              norma32.InfoAdicional := 'Fra. ' +
                 xFacturas.FieldByName('DOC_NUMERO').AsString + '/' +
                 xFacturas.FieldByName('DOC_SERIE').AsString +
                 '. Recibo ' + xFacturas.FieldByName('LINEA').AsString +
                 '/' + xFacturas.FieldByName('REGISTRO').AsString
           else
              norma32.InfoAdicional := norma32.NumDocumento;
        end;
        // Registro de Tipo III

        with xDireccionCliente do
        begin
           Close;
           Params.ByName['TERCERO'].AsInteger :=
              xClientesBancos.FieldByName('TERCERO').AsInteger;
           Open;
        end;

        norma32.NumProvPlazaLibrada :=
           Copy(xCodigoPostal.FieldByName('CODPOSTAL').AsString, 1, 2);
        norma32.NomPlazaLibrada := xDireccionCliente.FieldByName('TITULO_LOCALIDAD').AsString;
        norma32.CodPostDomLibrado := xCodigoPostal.FieldByName('CODPOSTAL').AsString;
        norma32.DomLibrado := xDireccionCliente.FieldByName('DIR_COMPLETA').AsString;

        norma32.DomLibrado := xDireccionCliente.FieldByName('DIR_COMPLETA').AsString;
        norma32.NomPlazaLibrada := xDireccionCliente.FieldByName('TITULO_LOCALIDAD').AsString;
        norma32.CodPostDomLibrado := xCodigoPostal.FieldByName('CODPOSTAL').AsString;

        Norma32.CompRegistro;
        xCuentaClientes.Next;
     end;
     Norma32.FinRemesa;
     Norma32.Cerrar;
     ImprimirRemesa32;
     Norma32.Impresion32Cabecera := nil;
     Norma32.Impresion32Remesa := nil;
  end;
end;

procedure TDMRemesas.Damesucursal(var entidad, sucursal: string);
begin
  entidad := xBancos.FieldByName('ENTIDAD').AsString;
  sucursal := xBancos.FieldByName('SUCURSAL').AsString;
end;

procedure TDMRemesas.DameDatosCSB(var cod, alfanumero: string);
begin
  cod := xBancos.FieldByName('CODIGO_ORDENANTE').AsString;
  alfanumero := xBancos.FieldByName('ALFANUMERO').AsString;
end;

procedure Imp32Cabecera(C: TCVBNorma32CSB; FecSoporte: TDateTime; FTotNumEfectos: string; FTotSumImportes: string);
begin
  DMRemesas.FecSop := DateToStr(FecSoporte);
  DMRemesas.TotNumEfec := FTotnumefectos;
  DmRemesas.TotSumImp := FTotSumImportes;
end;

procedure Imp32Remesa(C: TCVBNorma32CSB; IdCedente, NumEfectos: string; SumaImportes: string; IdEfTruncado: string; FUltimoVto: TDateTime);
begin
  DMRemesas.IdCed := IdCedente;
  DMRemesas.NumEfec := NumEfectos;
  DMRemesas.IdEfTrunc := IdEfTruncado;
  DmRemesas.UltimoVto := DateToStr(FUltimoVto);
end;

procedure TDMRemesas.ImprimirRemesa32;
begin
  Application.MessageBox(
     PChar(string(Format(_('Cedente: %s; Num. Efectos: %s ;Importe Total: %s'), [IdCed, TotNumEfec, TotSumImp]))),
     PChar(string(_('Datos para la carátula del Diskette'))), MB_OK + MB_ICONINFORMATION);
  //  FrRCSB32.ShowReport ;
end;

procedure Imp58Cabecera(C: TCVBNorma58CSB; FecSoporte: TDateTime);
begin
  DMRemesas.FecSop := DateToStr(FecSoporte);
end;

procedure TDMRemesas.disco58(cod: string; entrecep, sucrecep, alfanumero: string; ref, detalle: smallint);
var
  Archivo : string;
  SumaOrd : double;
begin
  if (REntorno.Moneda = 'PTS') then
     Norma58.Euros := False
  else if (REntorno.Moneda = 'EUR') then
     Norma58.Euros := True
  else
     raise Exception.Create(_('La Norma 58 no está definida para esta moneda'));

  Archivo := Format(_('Remesa-%d-%.3d.txt'), [QMRemesasEJERCICIO.AsInteger, QMRemesasREMESA.AsInteger]); // Nombre de fichero Remesa-EJER-NNN
  if MySaveDialog(Archivo, 'TXT', '', 'DMRemesas') then
  begin
     Norma58.NomFichero := Archivo;

     // Asignación de parámetros
     Norma58.Impresion58Cabecera := @Imp58Cabecera;

     norma58.Abrir;

     // Cabecera Presentador

     Norma58.FecSoporte := QMRemesasFECHA.Value;
     Norma58.EntRecepSoporte := entrecep;
     Norma58.OfiRecepSoporte := sucrecep;

     if ((Norma58.EntRecepSoporte = '') or (Norma58.OfiRecepSoporte = '')) then
        raise Exception.Create(_('Se debe asignar la sucursal receptora'));

     with xEmpresa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     {Se abre por DataSource DSxEmpresa
     with xTerceroEmpresa do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := xEmpresa.FieldByName('TERCERO').AsInteger;
        Open;
     end;}

     if (Length(xTerceroEmpresa.FieldByName('NIF').AsString) = 9) then
        Norma58.NifPresentador := xTerceroEmpresa.FieldByName('NIF').AsString
     else
     if ((Length(xTerceroEmpresa.FieldByName('NIF').AsString) = 11) and (Copy(xTerceroEmpresa.FieldByName('NIF').AsString, 1, 2) = 'ES')) then
        Norma58.NifPresentador := Copy(xTerceroEmpresa.FieldByName('NIF').AsString, 3, 9);

     Norma58.SufPresentador := Cod;
     Norma58.NombrePresentador := xTerceroEmpresa.FieldByName('NOMBRE_R_SOCIAL').AsString;
     Norma58.Alfanumero := alfanumero;
     Norma58.CompPresentador;

     // Cabecera del Ordenante
     Norma58.IniOrdenante;
     SumaOrd := 0;

     if (Length(xTerceroEmpresa.FieldByName('NIF').AsString) = 9) then
        Norma58.NifOrdenante := xTerceroEmpresa.FieldByName('NIF').AsString
     else
     if ((Length(xTerceroEmpresa.FieldByName('NIF').AsString) = 11) and (Copy(xTerceroEmpresa.FieldByName('NIF').AsString, 1, 2) = 'ES')) then
        Norma58.NifOrdenante := Copy(xTerceroEmpresa.FieldByName('NIF').AsString, 3, 9);

     Norma58.SufOrdenante := Cod;
     Norma58.NombreOrdenante := xTerceroEmpresa.FieldByName('NOMBRE_R_SOCIAL').AsString;
     with xBancoRemesa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMRemesasBANCO.AsInteger;
        Open;
     end;
     Norma58.EntOrdenante := xBancoRemesa.FieldByName('ENTIDAD').AsString;
     Norma58.OfiOrdenante := xBancoRemesa.FieldByName('SUCURSAL').AsString;
     Norma58.DCOrdenante := xBancoRemesa.FieldByName('CONTROL').AsString;
     Norma58.CCOrdenante := xBancoRemesa.FieldByName('CUENTA_CORRIENTE').AsString;
     with xDireccionCliente do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := REntorno.Tercero;
        Open;
     end;
     Norma58.Cod_INE := xCodigoPostal.FieldByName('INE').AsString;
     Norma58.CompOrdenante;

     // Registros Individuales

     with xCuentasClientes58 do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT ');
        SelectSQL.Add(' CAR.EJERCICIO_CARTERA, CAR.REGISTRO, CAR.LINEA, CAR.COD_CLI_PRO, ');
        SelectSQL.Add(' CAR.ID_DOC, CAR.ID_CARTERA_DETALLE, CAR.ID_CARTERA, CAR.VENCIMIENTO, ');
        SelectSQL.Add(' BAN.ENTIDAD, BAN.SUCURSAL, BAN.CONTROL, BAN.CUENTA, CAR.TERCERO, ');
        SelectSQL.Add(' BAN.BANCO, BAN.IBAN, BAN.BIC, ');
        SelectSQL.Add(' ST.NOMBRE_R_SOCIAL AS TITULO ');
        SelectSQL.Add(' FROM VER_CARTERA_REMESA CAR ');
        SelectSQL.Add(' LEFT JOIN SYS_TERCEROS ST ');
        SelectSQL.Add(' ON (CAR.TERCERO=ST.TERCERO) ');
        SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS BAN ');
        SelectSQL.Add(' ON (CAR.TERCERO=BAN.TERCERO) AND ');
        SelectSQL.Add('    (BAN.ORDEN= (SELECT MIN(ORDEN) FROM SYS_TERCEROS_BANCOS BB ');
        SelectSQL.Add('                 WHERE (BAN.TERCERO=BB.TERCERO)AND(BB.ACTIVA=1)AND ');
        SelectSQL.Add('                       (BB.MODO = 0 OR BB.MODO = 2))) ');
        SelectSQL.Add(' WHERE CAR.ID_REMESAS = ?ID_REMESAS ');
        SelectSQL.Add(' ORDER BY BAN.ENTIDAD, BAN.SUCURSAL, BAN.CONTROL, BAN.CUENTA ');
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Open;
        First;
     end;

     while not xCuentasClientes58.EOF do
     begin
        Norma58.IniRegistro;

        // Registro de tipo I
        with xClientes do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger :=
              xCuentasClientes58EJERCICIO_CARTERA.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CLIENTE'].AsInteger :=
              xCuentasClientes58Cod_cli_pro.AsInteger;
           Open;
        end;

        Norma58.NombreDomiciliado := xClientes.FieldByName('TITULO').AsString;
        Norma58.EntDomiciliado := xCuentasClientes58ENTIDAD.AsString;
        Norma58.OfiDomiciliado := xCuentasClientes58SUCURSAL.AsString;
        Norma58.DCDomiciliado := xCuentasClientes58CONTROL.AsString;
        Norma58.CCDomiciliado := xCuentasClientes58CUENTA.AsString;

        with xFacturas do
        begin
           Close;
           Params.ByName['COD_CLI_PRO'].AsInteger :=
              xCuentasClientes58COD_CLI_PRO.AsInteger;
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger :=
              xCuentasClientes58ID_CARTERA_DETALLE.AsInteger;
           Open;
        end;

        if (not norma58.Euros) then
        begin
           if xFacturas.FieldByName('MONEDA').AsString = 'PTS' then
              Norma58.ImpEfecto := xFacturas.FieldByName('LIQUIDO').AsInteger
           else
           begin
              if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'PTS' then
                 Norma58.ImpEfecto := xFacturas.FieldByName('LIQUIDO_CANAL').AsInteger
              else
                 Norma58.ImpEfecto := DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'PTS', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat);
           end;
        end
        else
        begin
           if xFacturas.FieldByName('MONEDA').AsString = 'EUR' then
              Norma58.ImpEfecto := xFacturas.FieldByName('LIQUIDO').AsFloat
           else
           begin
              if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'EUR' then
                 Norma58.ImpEfecto := xFacturas.FieldByName('LIQUIDO_CANAL').AsFloat
              else
                 Norma58.ImpEfecto := DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'EUR', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat);
           end;
        end;

        SumaOrd := SumaOrd + Norma58.ImpEfecto;

        Norma58.VtoEfecto := xFacturas.FieldByName('VENCIMIENTO').AsDateTime;

        Norma58.Referencia := xCuentasClientes58EJERCICIO_CARTERA.AsString + '/' +
           xCuentasClientes58REGISTRO.AsString + '.' + xCuentasClientes58LINEA.AsString;
        //(inttostr (REntorno.Ejercicio)+inttostr (REntorno.Canal)+
        //inttostr(xFacturasDOC_NUMERO.Asinteger)+xFacturasDOC_SERIE.AsString);

        // Información del Recibo
        if (xFacturas.FieldByName('DOC_NUMERO').AsInteger = 0) or
           (xFacturas.FieldByName('DOC_TIPO').AsString = 'AFC') then
        begin
           with xTextoRecibo do
           begin
              Close;
              Params.ByName['ID_CARTERA'].AsInteger :=
                 xFacturas.FieldByName('ID_CARTERA').AsInteger;
              Open;
           end;
           Norma58.Concepto1 := xTextoRecibo.FieldByName('TEXTO').AsString;
        end
        else
        begin
           if ref = 0 then
              Norma58.Concepto1 := 'Factura nº ' +
                 IntToStr(xFacturas.FieldByName('DOC_NUMERO').AsInteger) +
                 '/' + xFacturas.FieldByName('DOC_SERIE').AsString +
                 '. Recibo ' + IntToStr(xFacturas.FieldByName('REGISTRO').AsInteger) +
                 '.' + IntToStr(xFacturas.FieldByName('LINEA').AsInteger)
           else
           begin
              Norma58.Concepto1 := DameReferenciaDocumento(xFacturas.FieldByName('ID_DOC').AsInteger);
           end;

           with xDescripcionRecibo do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger :=
                 xCuentasClientes58EJERCICIO_CARTERA.AsInteger;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString :=
                 xFacturas.FieldByName('DOC_SERIE').AsString;
              Params.ByName['RIG'].AsInteger :=
                 xFacturas.FieldByName('DOC_NUMERO').AsInteger;
              Open;
              First;
           end;
           if detalle = 1 then
              Norma58.Concepto3 :=
                 ajusta(xDescripcionReciboUNIDADES.AsString, 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString,
                 'D', 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

           if detalle = 1 then
              Norma58.Concepto4 :=
                 Copy(xDescripcionReciboTITULO.AsString, 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString, 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
           xDescripcionRecibo.Next;

           if ((not xDescripcionRecibo.EOF) and (detalle = 1)) then
           begin
              Norma58.Concepto5 := ajusta(xDescripcionReciboUNIDADES.AsString,
                 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString, 'D',
                 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              Norma58.Concepto6 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;
           end;
           if ((not xDescripcionRecibo.EOF) and (detalle = 1)) then
           begin
              Norma58.Concepto7 := ajusta(xDescripcionReciboUNIDADES.AsString,
                 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString, 'D',
                 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              Norma58.Concepto8 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;
           end;
           if ((not xDescripcionRecibo.EOF) and (detalle = 1)) then
           begin
              Norma58.Concepto9 := ajusta(xDescripcionReciboUNIDADES.AsString,
                 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString, 'D',
                 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              Norma58.Concepto10 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;
           end;
           if ((not xDescripcionRecibo.EOF) and (detalle = 1)) then
           begin
              Norma58.Concepto11 := ajusta(xDescripcionReciboUNIDADES.AsString,
                 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString, 'D',
                 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              Norma58.Concepto12 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;
           end;
           if ((not xDescripcionRecibo.EOF) and (detalle = 1)) then
           begin
              Norma58.Concepto13 := ajusta(xDescripcionReciboUNIDADES.AsString,
                 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString, 'D',
                 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              Norma58.Concepto14 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;
           end;
           if ((not xDescripcionRecibo.EOF) and (detalle = 1)) then
           begin
              Norma58.Concepto15 := ajusta(xDescripcionReciboUNIDADES.AsString,
                 'I', 6, ' ') +
                 ' ' + ajusta(xDescripcionReciboUNIDAD.AsString, 'D',
                 3, ' ') +
                 Copy(xDescripcionReciboTITULO.AsString, 1, 29);

              Norma58.Concepto16 := Copy(xDescripcionReciboTITULO.AsString,
                 30, 31) + ' ' +
                 Ajusta(FormatFloat(DMMain.MascaraMoneda(xDescripcionReciboMONEDA.AsString,
                 1),
                 xDescripcionReciboLIQUIDO.Value), 'D', 9, ' ');
              xDescripcionRecibo.Next;
           end;
        end;
        if detalle = 0 then
        begin
           Norma58.Concepto3 := '';
           Norma58.Concepto4 := '';
           Norma58.Concepto5 := '';
           Norma58.Concepto6 := '';
           Norma58.Concepto7 := '';
           Norma58.Concepto8 := '';
           Norma58.Concepto9 := '';
           Norma58.Concepto10 := '';
           Norma58.Concepto11 := '';
           Norma58.Concepto12 := '';
           Norma58.Concepto13 := '';
           Norma58.Concepto14 := '';
           Norma58.Concepto15 := '';
           Norma58.Concepto16 := '';
        end;

        with xDireccionCliente do
        begin
           Close;
           Params.ByName['TERCERO'].AsInteger :=
              xClientes.FieldByName('TERCERO').AsInteger;
           Open;
        end;
        Norma58.DomicilioDeudor := xDireccionCliente.FieldByName('DIR_COMPLETA').AsString;
        Norma58.plazadeudor := xDireccionCliente.FieldByName('TITULO_LOCALIDAD').AsString;
        Norma58.CodPostalDeudor := xCodigoPostal.FieldByName('CODPOSTAL').AsString;

        with xDireccionCliente do
        begin
           Close;
           Params.ByName['TERCERO'].AsInteger := REntorno.Tercero;
           Open;
        end;
        Norma58.LocalidadOrdenante :=
           xDireccionCliente.FieldByName('TITULO_LOCALIDAD').AsString;
        Norma58.Provincia := Copy(xCodigoPostal.FieldByName('CODPOSTAL').AsString, 1, 2);

        Norma58.FechaLibramiento := xFacturas.FieldByName('DOC_FECHA').AsDateTime;

        Norma58.CompRegistro;
        xCuentasClientes58.Next;
     end;
     ImpNorma58(Cod, xTerceroEmpresa.FieldByName('NOMBRE_R_SOCIAL').AsString,
        FloatToStr(SumaOrd));
     Norma58.CierraOrdenante;
     Norma58.Cerrar;
     Norma58.Impresion58Cabecera := nil;
  end;
end;

procedure TDMRemesas.SEPA(cod: string; entrecep, sucrecep, alfanumero: string; ref, detalle: smallint);
var
  x : TSEPA;
  Importe : double;
  Concepto : string;
  NIFEmpresa : string;
  OrderId : string;
  Pais : string;
  EsEmpresa : boolean;
  ALaVista : string;
  Archivo : string;
  Vencimiento : TDateTime;
begin
  if (REntorno.Moneda <> 'EUR') then
     raise Exception.Create(_('La Norma no está definida para esta moneda'));

  Archivo := Format(_('Remesa-%d-%.3d.xml'), [QMRemesasEJERCICIO.AsInteger, QMRemesasREMESA.AsInteger]); // Nombre de fichero Remesa-EJER-NNN
  if MySaveDialog(Archivo, 'XML', '', 'DMRemesas') then
  begin
     // Presentador
     with xEmpresa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;

     with xBancoRemesa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMRemesasBANCO.AsInteger;
        Open;
     end;

     x := TSEPA.Create(Self);
     try
        with x do
        begin
           Fichero := ChangeFileExt(Archivo, '.xml');

           Pais := DamePaisC2(xLocalidadEmpresaC_PAIS.AsString);

           // Limpio NIF empresa (Mayusculas, Sin espacios, 9 digitos)
           NIFEmpresa := LimpiaNIF(xTerceroEmpresa.FieldByName('PAIS_TERCERO').AsString, xTerceroEmpresa.FieldByName('NIF').AsString);
           if ((Length(NIFEmpresa) = 11) and (Copy(NIFEmpresa, 1, 2) = 'ES')) then
              NIFEmpresa := Copy(NIFEmpresa, 3, 9);

           // Pais(2) + CC(2) + Cedente (3) + NIF(limpio 8-16?)
           OrderId := Pais + Format('%.2d', [98 - Modulo97(ChangeAlpha(NIFEmpresa + Pais + '00'))]) + cod + NIFEmpresa;

           EsEmpresa := (xTerceroEmpresa.FieldByName('TIPO_RAZON').AsString <> 'PF');

           // Se comienza el codigo MsgId con 'FSDD' en el caso de remesas SEPA al descuento (Norma 58) para que el banco pueda identificarla.
           ALaVista := '';
           if (QMRemesasTIPO_REMESA.AsInteger = 0) then
              ALaVista := 'FSDD';

           {
           Inicia(Tipo, Nombre, IBAN, BIC, OrderId, MsgId: string; IsOrg : boolean);
           }
           Inicia
           ('DD',
              REntorno.NombreEmpresa,
              xBancoRemesaIBAN.AsString,
              xBancoRemesaBIC.AsString,
              OrderId,
              Format('%s%s%.4d%.2d%.5d', [ALaVista, NIFEmpresa, QMRemesasEJERCICIO.AsInteger, QMRemesasCANAL.AsInteger, QMRemesasREMESA.AsInteger]),
              EsEmpresa);

           with xCuentasClientes58 do
           begin
              Close;
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT BAN.TIPO_CONTRATO_SEPA, BAN.TIPO_ADEUDO_SEPA, CAR.VENCIMIENTO, CAR.EJERCICIO_CARTERA, CAR.REGISTRO, CAR.LINEA, CAR.COD_CLI_PRO, CAR.ID_DOC, CAR.ID_CARTERA_DETALLE, ');
              SelectSQL.Add('        CAR.ID_CARTERA, CAR.VENCIMIENTO, BAN.ENTIDAD, BAN.SUCURSAL, BAN.CONTROL, BAN.CUENTA, CAR.TERCERO, BAN.BANCO, ');
              SelectSQL.Add('        BAN.IBAN, BAN.BIC, ST.NOMBRE_R_SOCIAL AS TITULO ');
              SelectSQL.Add(' FROM VER_CARTERA_REMESA CAR ');
              SelectSQL.Add(' LEFT JOIN SYS_TERCEROS ST ON CAR.TERCERO = ST.TERCERO ');
              SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS BAN ON CAR.TERCERO = BAN.TERCERO AND ');
              SelectSQL.Add('                                      (BAN.BANCO = (SELECT FIRST 1 BANCO ');
              SelectSQL.Add('                                                    FROM SYS_TERCEROS_BANCOS BB ');
              SelectSQL.Add('                                                    WHERE ');
              SelectSQL.Add('                                                    BAN.TERCERO = BB.TERCERO AND ');
              SelectSQL.Add('                                                    ((BB.BANCO = CAR.BANCO_CLIPRO) OR (CAR.BANCO_CLIPRO = 0)) AND ');
              SelectSQL.Add('                                                    BB.ACTIVA = 1 AND ');
              SelectSQL.Add('                                                    BB.MODO IN (0, 2) ');
              SelectSQL.Add('                                                    ORDER BY BB.ORDEN)) ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' CAR.ID_REMESAS = :ID_REMESAS ');
              SelectSQL.Add(' ORDER BY BAN.TIPO_CONTRATO_SEPA, BAN.TIPO_ADEUDO_SEPA, CAR.VENCIMIENTO, CAR.REGISTRO, CAR.LINEA ');
              Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
              Open;
              First;
           end;

           while not xCuentasClientes58.EOF do
           begin
              with xClientes do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := xCuentasClientes58EJERCICIO_CARTERA.AsInteger;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['CLIENTE'].AsInteger := xCuentasClientes58Cod_cli_pro.AsInteger;
                 Open;
              end;

              with xDireccionCliente do
              begin
                 Close;
                 Params.ByName['TERCERO'].AsInteger := xClientes.FieldByName('TERCERO').AsInteger;
                 Open;
              end;

              with xBancoNorma do
              begin
                 Close;
                 Params.ByName['TERCERO'].AsInteger := xClientes.FieldByName('TERCERO').AsInteger;
                 Params.ByName['BANCO'].AsInteger := xCuentasClientes58BANCO.AsInteger;
                 Open;
              end;

              // Aviso de posibles errores
              if (xCuentasClientes58BANCO.AsInteger < 1) then
                 MessageDlg(Format(_('Error: No se ha encontrado ningún banco para el tercero %d %s'), [xClientes.FieldByName('TERCERO').AsInteger, xClientes.FieldByName('TITULO').AsString]), mtError, [mbOK], 0)
              else
              begin
                 with xBancoNorma do
                 begin
                    if (Trim(FieldByName('IBAN').AsString) <= '') then
                       MessageDlg(Format(_('Error: IBAN no encontrado para el tercero %d %s'), [xClientes.FieldByName('TERCERO').AsInteger, xClientes.FieldByName('TITULO').AsString]), mtError, [mbOK], 0);

                    if (Trim(FieldByName('FIRMA').AsString) <= '') then
                       MessageDlg(Format(_('Error: Firma del mandato no encontrada para el tercero %d %s'), [xClientes.FieldByName('TERCERO').AsInteger, xClientes.FieldByName('TITULO').AsString]), mtError, [mbOK], 0);

                    if ((FieldByName('TIPO_ADEUDO_SEPA').AsString <= '') or (FieldByName('TIPO_ADEUDO_SEPA').AsString = 'NONE')) then
                       MessageDlg(Format(_('Error: Tipo de Adeudo SEPA no encontrado para el tercero %d %s'), [xClientes.FieldByName('TERCERO').AsInteger, xClientes.FieldByName('TITULO').AsString]), mtError, [mbOK], 0);

                    if ((Trim(FieldByName('TIPO_CONTRATO_SEPA').AsString) <= '') or (FieldByName('TIPO_CONTRATO_SEPA').AsString = 'NONE')) then
                       MessageDlg(Format(_('Error: Tipo de Contrato SEPA no encontrado para el tercero %d %s'), [xClientes.FieldByName('TERCERO').AsInteger, xClientes.FieldByName('TITULO').AsString]), mtError, [mbOK], 0);
                 end;
              end;

              with xFacturas do
              begin
                 Close;
                 Params.ByName['COD_CLI_PRO'].AsInteger := xCuentasClientes58COD_CLI_PRO.AsInteger;
                 Params.ByName['ID_CARTERA_DETALLE'].AsInteger := xCuentasClientes58ID_CARTERA_DETALLE.AsInteger;
                 Open;
              end;

              // Importe del Recibo
              if xFacturas.FieldByName('MONEDA').AsString = 'EUR' then
                 Importe := xFacturas.FieldByName('LIQUIDO').AsFloat
              else
              begin
                 if xFacturas.FieldByName('MONEDA_CANAL').AsString = 'EUR' then
                    Importe := xFacturas.FieldByName('LIQUIDO_CANAL').AsFloat
                 else
                    Importe := DMMain.DameCambio(True, xFacturas.FieldByName('MONEDA').AsString, 'EUR', xFacturas.FieldByName('DOC_FECHA').AsDateTime, xFacturas.FieldByName('LIQUIDO').AsFloat);
              end;

              // Información del Recibo
              Concepto := '';
              if (detalle = 1) then
              begin
                 if (xFacturas.FieldByName('DOC_NUMERO').AsInteger = 0) or
                    (xFacturas.FieldByName('DOC_TIPO').AsString = 'AFC') then
                 begin
                    with xTextoRecibo do
                    begin
                       Close;
                       Params.ByName['ID_CARTERA'].AsInteger := xFacturas.FieldByName('ID_CARTERA').AsInteger;
                       Open;
                    end;
                    Concepto := xTextoRecibo.FieldByName('TEXTO').AsString;
                 end
                 else
                 begin
                    if ref = 0 then
                       Concepto := Format(_('Factura %s/%d'), [xFacturas.FieldByName('DOC_SERIE').AsString, xFacturas.FieldByName('DOC_NUMERO').AsInteger]) + ' ' +
                          Format(_('Recibo %d.%d'), [xFacturas.FieldByName('REGISTRO').AsInteger, xFacturas.FieldByName('LINEA').AsInteger])
                    else
                    begin
                       Concepto := DameReferenciaDocumento(xFacturas.FieldByName('ID_DOC').AsInteger);
                    end;
                 end;
              end;

              Vencimiento := xFacturas.FieldByName('VENCIMIENTO').AsDateTime;
              if (QMRemesasFUERZA_VENCIMIENTO.AsInteger = 1) then
                 Vencimiento := QMRemesasFECHA_VENCIMIENTO.AsDateTime;

              {
              AddPmtInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, ChrgBr: string);
              }
              AddPmtInf(xBancoNorma.FieldByName('TIPO_CONTRATO_SEPA').AsString, xBancoNorma.FieldByName('TIPO_ADEUDO_SEPA').AsString, True, Vencimiento, '', 'SLEV');

              {
              AddTxInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, Id: string; InstdAmt: double; Nombre, IBAN, BIC, RmtInf, MndtId: string; MndtSgntr: TDateTime; BBAN, Country, AdrLine1, AdrLine2: string);
              }
              AddTxInf(
                 xBancoNorma.FieldByName('TIPO_CONTRATO_SEPA').AsString,
                 xBancoNorma.FieldByName('TIPO_ADEUDO_SEPA').AsString,
                 True,
                 Vencimiento,
                 '',
                 '',
                 Importe,
                 xClientes.FieldByName('TITULO').AsString,
                 xBancoNorma.FieldByName('IBAN').AsString,
                 xBancoNorma.FieldByName('BIC').AsString,
                 Concepto,
                 // Aqui debe ir el mandato SYS_TERCEROS_BANCOS.FIRMA
                 // xCuentasClientes58EJERCICIO_CARTERA.AsString + '-' + xCuentasClientes58REGISTRO.AsString + '-' + xCuentasClientes58LINEA.AsString,
                 xBancoNorma.FieldByName('FIRMA').AsString,
                 xBancoNorma.FieldByName('FECHA_FIRMA').AsDateTime,
                 xBancoNorma.FieldByName('ENTIDAD').AsString + xBancoNorma.FieldByName('SUCURSAL').AsString + xBancoNorma.FieldByName('CONTROL').AsString + xBancoNorma.FieldByName('CUENTA').AsString,
                 DamePaisC2(xCodigoPostal.FieldByName('C_PAIS').AsString),
                 xDireccionCliente.FieldByName('DIR_COMPLETA').AsString,
                 xCodigoPostal.FieldByName('CODPOSTAL').AsString + ' ' + xDireccionCliente.FieldByName('TITULO_LOCALIDAD').AsString);

              // Si es de tipo primero, pongo en RCUR para los siguientes.
              if (xBancoNorma.FieldByName('TIPO_ADEUDO_SEPA').AsString = 'FRST') then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE SYS_TERCEROS_BANCOS SET TIPO_ADEUDO_SEPA = ''RCUR'' WHERE TERCERO = ?TERCERO AND BANCO = ?BANCO';
                       Params.ByName['TERCERO'].AsInteger := xCuentasClientes58TERCERO.AsInteger;
                       Params.ByName['BANCO'].AsInteger := xCuentasClientes58BANCO.AsInteger;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              // Si es de tipo Ultimo o de un solo uso, elimino la firma
              if ((xBancoNorma.FieldByName('TIPO_ADEUDO_SEPA').AsString = 'FNAL') or (xBancoNorma.FieldByName('TIPO_ADEUDO_SEPA').AsString = 'OOFF')) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE SYS_TERCEROS_BANCOS SET TIPO_ADEUDO_SEPA = ''NONE'' WHERE TERCERO = ?TERCERO AND BANCO = ?BANCO';
                       Params.ByName['TERCERO'].AsInteger := xCuentasClientes58TERCERO.AsInteger;
                       Params.ByName['BANCO'].AsInteger := xCuentasClientes58BANCO.AsInteger;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              xCuentasClientes58.Next;
           end;

           Finaliza;
        end;
     finally
        x.Free;
     end;
  end;
end;

procedure TDMRemesas.ImpNorma58(Ordenante, NomCliOrd, Importe: string);
begin
  ShowMessage(Format(_('Cod.Ordenante: %s' + #13#10 + 'Nombre       : %s' + #13#10 + 'Importe      : %s'), [Ordenante, NomCliOrd, Importe]));
end;

function TDMRemesas.DameRemesa: integer;
begin
  Result := QMRemesasREMESA.AsInteger;
end;

procedure TDMRemesas.GrabaCabecera;
begin
  if ((QMRemesas.State = dsInsert) or (QMRemesas.State = dsEdit)) then
     QMRemesas.Post;
end;

procedure TDMRemesas.GrabaDetalle;
begin
  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;
end;

procedure TDMRemesas.BusquedaCompleja;
var
  Orden : string;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRemesas, '10100', False);
  Orden := QMRemesas.OrdenadoPor;
  QMRemesas.Ordenar('');
  QMRemesas.SelectSQL.Add(' AND (TIPO_REMESA_PAG = ?TIPO_REMESA_PAG) ');
  QMRemesas.Ordenar(Orden);
  FiltraMaestro(BoolToInt(not EsRemesa));
end;

procedure TDMRemesas.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsEdit) then
  begin
     if (QMDetalleREMESA.Value > 0) then
     begin
        QMDetalleEJERCICIO.Value := QMRemesasEJERCICIO.AsInteger;
        QMDetalleID_REMESAS.AsInteger := QMRemesasID_REMESAS.AsInteger;
     end
     else
        QMDetalleEJERCICIO.Value := 0;
  end;
end;

procedure TDMRemesas.VenceRemesas(FechaValor: TDateTime; Forzar: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_VENCE_REMESA (?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?ENTRADA, ?FORZAR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := FechaValor;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FORZAR'].AsInteger := BoolToInt(Forzar);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

procedure TDMRemesas.VenceRemesaActual(FechaValor: TDateTime; Forzar: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_VENCE_REMESA_ACT (?EMPRESA, ?EJERCICIO, ?CANAL, ?REMESA, ?ENTRADA, ?FECHA, ?FORZAR)';
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['REMESA'].AsInteger := QMDetalleREMESA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := FechaValor;
        Params.ByName['FORZAR'].AsInteger := BoolToInt(Forzar);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

procedure TDMRemesas.VenceReciboActual(FechaValor: TDateTime; Forzar: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_VENCE_RECIBO_ACT (?EMPRESA, ?EJERCICIO, ?CANAL, ?REGISTRO, ?LINEA, ?ID_CARTERA_DET, ?ENTRADA, ?FECHA, ?FORZAR)';
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['REGISTRO'].AsInteger := QMDetalleREGISTRO.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ID_CARTERA_DET'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := FechaValor;
        Params.ByName['FORZAR'].AsInteger := BoolToInt(Forzar);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

procedure TDMRemesas.DesVenceRecibo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESVENCE_REMESA (?EMPRESA, ?EJERCICIO, ?CANAL, ?REGISTRO, ?LINEA, ?ID_CARTERA_DET)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO_CARTERA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REGISTRO'].AsInteger := QMDetalleREGISTRO.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ID_CARTERA_DET'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Refresh;
end;

procedure TDMRemesas.QMDetalleLIQUIDO_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 1),
     QMDetalleLIQUIDO.AsFloat);
end;

function TDMRemesas.ReciboDescontado: boolean;
begin
  Result := False;
  if (QMRemesasTIPO_REMESA.AsInteger = 1) then
     Result := True
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DESCONTADO FROM EMP_CARTERA_DET_DESCONTADO WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE';
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
           ExecQuery;
           if (FieldByName['DESCONTADO'].AsInteger = 1) then
              Result := True;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRemesas.MarcaRecibosConAbono;
begin
  if (Abono = 0) then
     Abono := ObtenerAbono;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CARTERA_REMESA ');
        SQL.Add(' SET ABONO = ?ABONO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SIGNO = ?SIGNO AND ');
        SQL.Add(' REMESA = ?REMESA ');
        Params.ByName['ABONO'].AsInteger := Abono;
        Params.ByName['EMPRESA'].AsInteger := QMRemesasEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMRemesasCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := QMRemesasSIGNO.AsString;
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRemesas.ObtenerAbono: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_OBTENER_ABONO';
        ExecQuery;
        Result := FieldByName['ABONO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRemesas.QMRemesasBeforeScroll(DataSet: TDataSet);
begin
  if ((QMRemesas.State <> dsInsert) and (QMRemesas.State <> dsEdit)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE VER_CARTERA_REMESA ');
           SQL.Add(' SET ABONO = 0 ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SIGNO = ?SIGNO AND ');
           SQL.Add(' REMESA = ?REMESA AND ');
           SQL.Add(' PAGADO = 0 AND ');
           SQL.Add(' ((ACEPTADO = 0) OR ((ACEPTADO = 1) AND (RECIBIDO = 1))) ');
           Params.ByName['EMPRESA'].AsInteger := QMRemesasEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMRemesasCANAL.AsInteger;
           Params.ByName['SIGNO'].AsString := QMRemesasSIGNO.AsString;
           Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRemesas.MuestraAbonados;
begin
  if ((QMRemesas.State <> dsInsert) and (QMRemesas.State <> dsEdit)) then
  begin
     FMRemesas.AjustaCheckRemesa(QMRemesasREMESA.FieldName, QMRemesasREMESA.AsInteger);
     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_REMESA WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA ');
        SelectSQL.Add(' AND ((EJERCICIO = ?EJERCICIO) OR (EJERCICIO = 0)) ');
        SelectSQL.Add(' AND CANAL = ?CANAL ');
        SelectSQL.Add(' AND SIGNO = ''C'' ');
        SelectSQL.Add(' AND REMESA = ?REMESA ');
        SelectSQL.Add(' AND PAGADO = 1 ');
        // if (DMMain.EstadoKri(2) = 1) then
        //    SelectSQL.Add(' AND (BANCO_KRI=' + QMRemesasBANCO.AsString + ')');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        Open;
     end;
     xCuentaClientes.Close;
     xCuentaClientes.Open;
     xClientesBancos.Close;
     xClientesBancos.Open;
     xFacturas.Close;
     xFacturas.Open;
     xBancos.Close;
     xBancos.Open;
  end;
end;

procedure TDMRemesas.MuestraPorAbonar;
begin
  if ((QMRemesas.State <> dsInsert) and (QMRemesas.State <> dsEdit)) then
  begin
     if Abono > 0 then
        FMRemesas.AjustaCheckRemesa('ABONO', Abono);
     FMRemesas.AjustaCheckRemesa(QMRemesasREMESA.FieldName, QMRemesasREMESA.AsInteger);
     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_REMESA WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA ');
        SelectSQL.Add(' AND ((EJERCICIO = ?EJERCICIO) OR (EJERCICIO = 0)) ');
        SelectSQL.Add(' AND CANAL = ?CANAL ');
        SelectSQL.Add(' AND SIGNO = ''C'' ');
        SelectSQL.Add(' AND REMESA = ?REMESA ');
        SelectSQL.Add(' AND PAGADO = 0 ');
        // if (DMMain.EstadoKri(2) = 1) then
        //    SelectSQL.Add(' AND (BANCO_KRI=' + QMRemesasBANCO.AsString + ')');}
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
        Open;
     end;
     xCuentaClientes.Close;
     xCuentaClientes.Open;
     xClientesBancos.Close;
     xClientesBancos.Open;
     xFacturas.Close;
     xFacturas.Open;
     xBancos.Close;
     xBancos.Open;
  end;
end;

procedure TDMRemesas.DesAbonaAbono;
var
  Q : THYFIBQuery;
begin
  if ((QMRemesasCERRADA.AsInteger = 1) and (QMDetallePAGADO.AsInteger = 1) and
     (QMDetalleABONO.AsInteger > 0) and (QMDetalleEJERCICIO_ABONO.AsInteger > 0)) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESABONA_ABONO(?EMPRESA, ?EJERCICIO, ?CANAL, ?ABONO, ?EJERCICIO_REMESA, ?SIGNO, ?REMESA, ?BANCO, ?FECHA, ?ID_REMESAS)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO_ABONO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ABONO'].AsInteger := QMDetalleABONO.AsInteger;
           Params.ByName['EJERCICIO_REMESA'].AsInteger := QMRemesasEJERCICIO.AsInteger;
           Params.ByName['SIGNO'].AsString := 'C';
           Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
           Params.ByName['BANCO'].AsInteger := QMRemesasBANCO.AsInteger;
           Params.ByName['FECHA'].AsDateTime := QMRemesasFECHA.AsDateTime;
           Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
     RefrescaDetalle;
     QMRemesas.Refresh;
     if Abono = 0 then
     begin
        Abono := ObtenerAbono;
        FMRemesas.AjustaCheckRemesa('ABONO', Abono);
     end;
  end
  else
     ShowMessage(_('Debe seleccionar un recibo del abono que desee deshacer'));
end;

procedure TDMRemesas.QMRemesasAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMRemesasAfterScroll(QMRemesas);
end;

procedure TDMRemesas.QMRemesasTIPO_ASIENTOChange(Sender: TField);
begin
  REntorno.Asiento_REM := Sender.AsString;
end;

procedure TDMRemesas.QMRemesasTIPO_ASIENTO_KRIChange(Sender: TField);
begin
  REntorno.Asiento_REM := Sender.AsString;
end;

function TDMRemesas.RemesaAbiertaCerrada: integer;
begin
  Result := QMRemesas.FieldByName('CERRADA').AsInteger;
end;

procedure TDMRemesas.FiltraMaestro(Tipo: smallint);
begin
  EsRemesa := (Tipo = 0);

  with QMRemesas do
  begin
     Close;
     Params.ByName['TIPO_REMESA_PAG'].AsInteger := BoolToInt(not EsRemesa);
     Open;
  end;
end;

procedure TDMRemesas.AbonaTodo;
var
  Q : THYFIBQuery;
begin
  // Comprobar si esta cerrada
  if (QMRemesasCERRADA.AsInteger <> 0) then
  begin
     Abono := ObtenerAbono;

     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_ABONA_TODO(?EMPRESA, ?EJERCICIO, ?CANAL, ?REMESA, ?ABONO, ?ID_REMESAS)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['REMESA'].AsInteger := QMRemesasREMESA.AsInteger;
           Params.ByName['ABONO'].AsInteger := Abono;
           Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // FMRemesas.GastosDelAbono;
     QMRemesas.Refresh;
  end
  else
     raise Exception.Create(_('La Remesa no está cerrada. Imposible Abonar'));
end;

procedure TDMRemesas.CalculaRIC_ABONO;
var
  ABONO_R : integer;
  RIC_ABONO : string;
  RIC_GASTOS : string;
  Existe : boolean;
begin
  ABONO_R := DMRemesas.QMDetalleABONO.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT RIC, RIC2 FROM EMP_CARTERA_REMESAS_ABONOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ABONO = ?ABONO_R ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO_ABONO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ABONO_R'].AsInteger := ABONO_R;
        ExecQuery;
        Existe := HayDatos;
        RIC_ABONO := IntToStr(FieldByName['RIC'].AsInteger);
        RIC_GASTOS := IntToStr(FieldByName['RIC2'].AsInteger);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Existe) then
     if (RIC_ABONO = RIC_GASTOS) then
        FMain.MuestraMovConta(' RIC= ' + RIC_ABONO +
           ' and ejercicio=' + DMRemesas.QMDetalleEJERCICIO_ABONO.AsString)
     else
        FMain.MuestraMovConta(' ((RIC = ' + RIC_ABONO + ') or (RIC = ' + RIC_GASTOS +
           ')) and ejercicio=' + DMRemesas.QMDetalleEJERCICIO_ABONO.AsString)
  else
     ShowMessage(_('La linea no esta abonada'));
end;

function TDMRemesas.HayAbonosMarcados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM EMP_CARTERA_DETALLE WHERE ID_REMESAS = ?ID_REMESAS AND ABONO = ?ABONO';
        Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
        Params.ByName['ABONO'].AsInteger := Abono;
        ExecQuery;
        Result := not (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRemesas.DameAsientoVto: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DES.RIC_DESCUENTO, DES.EJERCICIO_RIC_DESCUENTO ');
        SQL.Add(' FROM EMP_CARTERA_DETALLE DET ');
        SQL.Add(' JOIN EMP_CARTERA_DET_DESCONTADO DES ');
        SQL.Add(' ON (DET.ID_CARTERA_DETALLE = DES.ID_CARTERA_DETALLE) ');
        SQL.Add(' WHERE DET.ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE ');
        Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        ExecQuery;
        Result := FieldByName['RIC_DESCUENTO'].AsInteger;
        EjercicioVto := FieldByName['EJERCICIO_RIC_DESCUENTO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRemesas.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMClienteRecibo.Close;
  xTipoEfecto.Close;
  xCuentaTerceros.Close;
end;

procedure TDMRemesas.FiltraPorRIC(ric: integer);
begin
  with QMRemesas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM EMP_CARTERA_REMESAS WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' AND EJERCICIO in (?EJERCICIO, ?EJERCICIO - 1, 0) ');
     SelectSQL.Add(' AND CANAL = ?CANAL ');
     SelectSQL.Add(' AND SIGNO = ''C'' ');
     SelectSQL.Add(' AND ((RIC = ?RIC) OR (RIC_ABONO = ?RIC_ABONO) OR (RIC_ABONO_2 = ?RIC_ABONO_2)) ');
     SelectSQL.Add(' ORDER BY EJERCICIO,REMESA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['RIC'].AsInteger := ric;
     Params.ByName['RIC_ABONO'].AsInteger := ric;
     Params.ByName['RIC_ABONO_2'].AsInteger := ric;
     Open;
  end;
end;

function TDMRemesas.EsAgrupado: boolean;
begin
  if ((QMDetalleDOC_TIPO.AsString = 'AGC') or (QMDetalleDOC_TIPO.AsString = 'AGP') or
     (QMDetalleDOC_TIPO.AsString = 'AGA')) then
     Result := True
  else
     Result := False;
end;

function TDMRemesas.PerteneceAgrupacion: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(1) RDB$DB_KEY FROM EMP_CARTERA_DOCUMENTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO_REC = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SIGNO = ?SIGNO AND ');
        SQL.Add(' REGISTRO_REC = ?REGISTRO ');
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := QMDetalleSIGNO.AsString;
        Params.ByName['REGISTRO'].AsInteger := QMDetalleREGISTRO.AsInteger;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRemesas.GeneraOrdenesDePago;
var
  DS : TFIBDataSet;
  OrdenDePago : integer;
  IdCartera : integer;

  function DameCtaBancoZona(Zona: string): string;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CUENTA_CC FROM SYS_ZONAS Z ');
           SQL.Add(' JOIN CON_CUENTAS_GES_BAN B ');
           SQL.Add(' ON Z.BANCO = B.BANCO ');
           SQL.Add(' WHERE B.EMPRESA = ?EMPRESA AND B.EJERCICIO = ?EJERCICIO AND B.CANAL = ?CANAL AND Z.ZONA = ?ZONA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ZONA'].AsString := Zona;
           ExecQuery;
           Result := FieldByName['CUENTA_CC'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  /// Reparticion Esquerra Republicana
  /// - Creo cabecera de Orden de Pago
  /// - Creo recibos con ZONA para cada repartición a acreedor 1
  /// - Asocio recibo a Orden de Pago
  /// - Abro Ordenes de Pago

  OrdenDePago := DMMain.Contador_EEC('CON');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO EMP_CARTERA_ORD_PAGO ');
        SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SIGNO, NUM_ORDEN, FECHA, FECHA_VTO, IMPORTE, BANCO, TITULO, CERRADO, GASTOS, DETALLE_CARGOS) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?NUM_ORDEN, ?FECHA, ?FECHA_VTO, ?IMPORTE, ?BANCO, ?TITULO, ?CERRADO, ?GASTOS, ?DETALLE_CARGOS) ');
        Params.ByName['EMPRESA'].AsInteger := QMRemesasEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMRemesasCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := 'P';
        Params.ByName['NUM_ORDEN'].AsInteger := OrdenDePago;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['FECHA_VTO'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['IMPORTE'].AsFloat := 0;
        Params.ByName['BANCO'].AsInteger := 1; // Banco de la empresa ???
        Params.ByName['TITULO'].AsString := Format(_('Repartición de la remesa %s'), [QMRemesasREMESA.AsString]);
        Params.ByName['CERRADO'].AsInteger := 0;
        Params.ByName['GASTOS'].AsInteger := 0;
        Params.ByName['DETALLE_CARGOS'].AsInteger := 0;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

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
           // Reparticion a 1, 2 y 3 digitos
           SelectSQL.Add(' SELECT SUBSTRING(CL.ZONA FROM 1 FOR 1) AS ZONA, MIN(Z.TITULO) AS TITULO, (SUM(D.LIQUIDO_CANAL) * 20 / 100) AS IMPORTE FROM EMP_CARTERA_DETALLE D ');
           SelectSQL.Add(' JOIN EMP_CARTERA C ON ');
           SelectSQL.Add(' (D.ID_CARTERA = C.ID_CARTERA) ');
           SelectSQL.Add(' JOIN EMP_CLIENTES CL ');
           SelectSQL.Add(' ON C.EMPRESA=CL.EMPRESA AND C.COD_CLI_PRO=CL.CLIENTE ');
           SelectSQL.Add(' JOIN SYS_ZONAS Z ');
           SelectSQL.Add(' ON Z.ZONA=SUBSTRING(CL.ZONA FROM 1 FOR 1) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' D.ID_REMESAS = ?ID_REMESAS AND IMPAGADO = 0 ');
           SelectSQL.Add(' GROUP BY SUBSTRING(CL.ZONA FROM 1 FOR 1) ');
           SelectSQL.Add(' UNION ');
           SelectSQL.Add(' SELECT SUBSTRING(CL.ZONA FROM 1 FOR 2) AS ZONA, MIN(Z.TITULO) AS TITULO, (SUM(D.LIQUIDO_CANAL) * 10 / 100) AS IMPORTE FROM EMP_CARTERA_DETALLE D ');
           SelectSQL.Add(' JOIN EMP_CARTERA C ON ');
           SelectSQL.Add(' (D.ID_CARTERA = C.ID_CARTERA) ');
           SelectSQL.Add(' JOIN EMP_CLIENTES CL ');
           SelectSQL.Add(' ON C.EMPRESA=CL.EMPRESA AND C.COD_CLI_PRO=CL.CLIENTE ');
           SelectSQL.Add(' JOIN SYS_ZONAS Z ');
           SelectSQL.Add(' ON Z.ZONA=SUBSTRING(CL.ZONA FROM 1 FOR 2) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' D.ID_REMESAS = ?ID_REMESAS AND IMPAGADO = 0 ');
           SelectSQL.Add(' GROUP BY SUBSTRING(CL.ZONA FROM 1 FOR 2) ');
           SelectSQL.Add(' UNION ');
           SelectSQL.Add(' SELECT CL.ZONA AS ZONA, MIN(Z.TITULO) AS TITULO, (SUM(D.LIQUIDO_CANAL) * 50 / 100) AS IMPORTE FROM EMP_CARTERA_DETALLE D ');
           SelectSQL.Add(' JOIN EMP_CARTERA C ON ');
           SelectSQL.Add(' (D.ID_CARTERA = C.ID_CARTERA) ');
           SelectSQL.Add(' JOIN EMP_CLIENTES CL ');
           SelectSQL.Add(' ON C.EMPRESA=CL.EMPRESA AND C.COD_CLI_PRO=CL.CLIENTE ');
           SelectSQL.Add(' JOIN SYS_ZONAS Z ');
           SelectSQL.Add(' ON Z.ZONA=CL.ZONA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' D.ID_REMESAS = ?ID_REMESAS AND IMPAGADO = 0 ');
           SelectSQL.Add(' GROUP BY CL.ZONA ');
           Params.ByName['ID_REMESAS'].AsInteger := QMRemesasID_REMESAS.AsInteger;
           Open;
           // Recorro los resultados y genero recibos
           while not EOF do
           begin
              // Creo recibo
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' EXECUTE PROCEDURE E_CARTERA_RECIBO_NUEVO( ');
                    SQL.Add(' ?EMPRESA, ?EJERCICIO, ?CANAL, ?COD_CLI_PRO, ?TIPO_DOC, ');
                    SQL.Add(' ?FORMA_PAGO, ?FECHA, ?TEXTO, ?LIQUIDO, ?ENTRADA, ?CTA_PAGO, ');
                    SQL.Add(' ?MONEDA, ?DOC_FECHA, ?SERIE) ');
                    Params.ByName['EMPRESA'].AsInteger := QMRemesasEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMRemesasCANAL.AsInteger;
                    Params.ByName['COD_CLI_PRO'].AsInteger := 1;
                    Params.ByName['TIPO_DOC'].AsString := 'NRA';
                    Params.ByName['FORMA_PAGO'].AsString := 'CON';
                    Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
                    Params.ByName['TEXTO'].AsString := Format(_('Repartición de la remesa %s a zona %s'), [QMRemesasREMESA.AsString, DS.FieldByName('ZONA').AsString]);
                    Params.ByName['LIQUIDO'].AsFloat := DS.FieldByName('IMPORTE').AsFloat;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['CTA_PAGO'].AsString := DameCtaBancoZona(DS.FieldByName('ZONA').AsString);
                    Params.ByName['MONEDA'].AsString := REntorno.Moneda;
                    Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
                    Params.ByName['SERIE'].AsString := '';
                    ExecQuery;
                    IdCartera := FieldByName['ID_CARTERA'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              // Asigno Zona y Orden de Pago
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
                    SQL.Add(' SET ');
                    SQL.Add(' ZONA = ?ZONA, ');
                    SQL.Add(' ORD_PAGO = ?ORD_PAGO, ');
                    SQL.Add(' EJERCICIO_ORD_PAGO = ?EJERCICIO_ORD_PAGO ');
                    SQL.Add(' WHERE ID_CARTERA = ?ID_CARTERA ');
                    Params.ByName['ID_CARTERA'].AsInteger := IdCartera;
                    Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                    Params.ByName['ORD_PAGO'].AsInteger := OrdenDePago;
                    Params.ByName['EJERCICIO_ORD_PAGO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              // Refresco datos de Orden de Pago
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE EMP_CARTERA_ORD_PAGO P ');
                    SQL.Add(' SET ');
                    SQL.Add(' IMPORTE = (SELECT SUM(LIQUIDO_CANAL) FROM EMP_CARTERA_DETALLE WHERE EMPRESA=P.EMPRESA AND EJERCICIO_ORD_PAGO=P.EJERCICIO AND CANAL=P.CANAL AND SIGNO=P.SIGNO AND ORD_PAGO=P.NUM_ORDEN) ');
                    SQL.Add(' ,LINEAS = (SELECT COUNT(*) FROM EMP_CARTERA_DETALLE WHERE EMPRESA=P.EMPRESA AND EJERCICIO_ORD_PAGO=P.EJERCICIO AND CANAL=P.CANAL AND SIGNO=P.SIGNO AND ORD_PAGO=P.NUM_ORDEN) ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' SIGNO = :SIGNO AND ');
                    SQL.Add(' NUM_ORDEN = :ORD_PAGO ');
                    Params.ByName['EMPRESA'].AsInteger := QMRemesasEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMRemesasEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMRemesasCANAL.AsInteger;
                    Params.ByName['SIGNO'].AsString := 'P';
                    Params.ByName['ORD_PAGO'].AsInteger := OrdenDePago;
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
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TDMRemesas.QMRemesasFUERZA_VENCIMIENTOChange(Sender: TField);
begin
  if (QMRemesasFUERZA_VENCIMIENTO.AsInteger = 0) then
     QMRemesasFECHA_VENCIMIENTO.Clear;
end;

end.
