unit UDMPedidosAProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, UFormGest;

type
  TDMPedidosAProveedor = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSDetalle: TDataSource;
     QMCabecera: TFIBTableSet;
     DSCabecera: TDataSource;
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
     QMDetalleM_MOV_STOCK: TIntegerField;
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
     QMDetalleUNIDADES_ORIGINALES: TFloatField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleP_COSTE: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     xInfoActualizadaLIQUIDO: TFloatField;
     TLocal: THYTransaction;
     QMDetalleUNIDADES_POR_SERVIR: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     xArticulosTarifa: TFIBDataSetRO;
     DSxArticulosTarifa: TDataSource;
     xtarifasProveedor: TFIBDataSetRO;
     DSxtarifasProveedor: TDataSource;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     xInfoActualizadaI_FINANCIACION: TFloatField;
     xArticulos: TFIBDataSetRO;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMCabeceraFORMA_DE_PAGO: TFIBStringField;
     xFormasPago: TFIBDataSetRO;
     DSxFormasPago: TDataSource;
     QBorraLineaExt: THYFIBQuery;
     QUnidadesExt: THYFIBQuery;
     QUptUnidadesExt: THYFIBQuery;
     QMDetalleNOTAS: TBlobField;
     QAnulaDocumento: THYFIBQuery;
     SPCambiaMoneda: THYFIBQuery;
     QMCabeceraTOTAL_CANAL: TFloatField;
     QMDetalleUNIDADES_SERVIDAS: TFloatField;
     QMDetalleLINEA_SERVIDA: TIntegerField;
     QMDetallePRECIO: TFloatField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraID_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMCabeceraFECHA_PRE_CAB: TDateTimeField;
     QMCabeceraFECHA_REC_CAB: TDateTimeField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMNIF: TFIBTableSet;
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
     QMNIFPAIS: TFIBStringField;
     DSQMNIF: TDataSource;
     QMDetalleORDEN: TIntegerField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMDetalleCODIGO_PROVEEDOR: TFIBStringField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMCabeceraTRANSPORTISTA: TIntegerField;
     QMCabeceraFECHA_CONFIRMADA_KRI: TDateTimeField;
     QMCabeceraPLAZO_INICIAL_KRI: TDateTimeField;
     QMCabeceraPLAZO_CONFIRM_KRI: TDateTimeField;
     QMCabeceraPROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetallePROYECTO: TIntegerField;
     TUpdate: THYTransaction;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetalleCLIENTE_ORIGEN_KRI: TStringField;
     QMCabeceraNO_AGREGAR_LINEAS_KRI: TIntegerField;
     QMDetalleFECHA_CONF_KRI: TDateTimeField;
     QMCabeceraPERMITIR_SUPERAR_IMPORTE_KRI: TIntegerField;
     QMDetallePLAZO_CONFIRM_KRI: TDateTimeField;
     QMNIFID_E: TIntegerField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     QMCabeceraID_ORDEN: TIntegerField;
     QMCabeceraLINEA_FASE: TIntegerField;
     QMCabeceraRIG_ORDEN: TIntegerField;
     QMCabeceraDESC_FASE: TStringField;
     QMNIFCOLONIA: TFIBStringField;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     QMDetalleTITULO_ART_PROV: TFIBStringField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMDetallePROVEEDOR: TIntegerField;
     QMDetalleID_DETALLES_E_REGALO: TIntegerField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraPEDIDO_VALORADO: TIntegerField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMNIFTERCERO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMCabeceraIMPORTE_MINIMO_PORTE: TFloatField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     xInfoActualizadaIMPORTE_ICE_TOTAL: TFloatField;
     xInfoActualizadaS_CUOTA_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraDIR_ENTREGA_MANUAL: TMemoField;
     QMCabeceraDIRECCION: TIntegerField;
     DSxDirecciones: TDataSource;
     xDirecciones: TFIBDataSetRO;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     QMDetalleBULTOS: TFloatField;
     xAvisos: TFIBDataSetRO;
     xDireccionesTITULO: TFIBStringField;
     QMCabeceraACEPTA_ENTREGA_PARCIAL: TSmallintField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMDetalleSTOCK_ALM: TFloatField;
     QMDetalleSTOCK_ALM2: TFloatField;
     QMDetalleSTOCK_ALM3: TFloatField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMCabeceraPEDIDO_RECIBIDO: TIntegerField;
     QMCabeceraOBSERVACIONES: TFIBStringField;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     QMDetallePEDIDOS_A_PROV: TFloatField;
     QMDetalleCONTROL_STOCK: TIntegerField;
     xInfoActualizadaSUM_UNIDADES: TFloatField;
     xInfoActualizadaSUM_UNIDADES_SEC: TFloatField;
     xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField;
     xInfoActualizadaSUM_PESO: TFloatField;
     xInfoActualizadaCOUNT_LINEA: TIntegerField;
     procedure DMDocsPedidoAProvCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraALMACENChange(Sender: TField);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMCabeceraPROVEEDORChange(Sender: TField);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure xArticulosTarifaAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMCabeceraFECHAChange(Sender: TField);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraCAMBIO_FIJOChange(Sender: TField);
     procedure QMCabeceraPROYECTOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleCLIENTE_ORIGEN_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMDetalleP_COSTEChange(Sender: TField);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraID_ORDENChange(Sender: TField);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMCabeceraTRANSPORTISTAChange(Sender: TField);
     procedure QMCabeceraNO_AGREGAR_LINEAS_KRIChange(Sender: TField);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraDIRECCIONChange(Sender: TField);
     procedure QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALChange(Sender: TField);
     procedure QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_ORIGINALESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_POR_SERVIRGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SERVIDASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xProveedorAfterOpen(DataSet: TDataSet);
     procedure xProveedorBeforeClose(DataSet: TDataSet);
     procedure xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     fecha_old: TDateTime;
     SQLFind, SQLBase: string;
     ComisionAgente, unidades_old: double;
     RecalculaPrecios, Editando: boolean;
     ImporteMaximoPEP: double;
     UltimoID_EAlertado: integer;
     UnidadesRegalo: double;
     CalculaPCoste: boolean;
     Serie: string;
     FlagModificandoUnidades: boolean;
     Param_SYSCONF005: integer;
     Param_MODREST017: boolean;
     Param_DOCREFE007: boolean;
     Param_VENULKG001: boolean;
     Param_COMARTU001: boolean;
     Param_COMPREC001: boolean;
     Param_PEPUPEP001: boolean;
     Param_MOVSTKC001: integer;
     AlmacenStock, AlmacenStock2, AlmacenStock3: string;
     StockAlm, StockAlm2, StockAlm3: TStrings;
     PedidosAProv: TStrings;
     KriConf468: boolean;
     OldLinea: TStrings;
     ModificandoCambioFijo: boolean;
     {procedure InfoActualiza; dji lrk kri - TyC}
     function Traspasado: boolean;
     {procedure CambiaMonedaFecha; No se utiliza}
     {function DameEstado : integer; No se utiliza}
     procedure AbreDocumentos(id_e_d: integer; tipo_destino, serie: string);
     procedure RefrescaCabeceraManteniendoPosicionDetalle(DataSet: TDataSet);
     procedure CambiaEstadoPedido(Estado: integer);
     procedure RellenaDatosLinea(Linea: TStrings);
     procedure CambiaEstadoDocumento(Estado: integer);
  public
     LocalMascaraN, LocalMascaraL: string;
     medida1, medida2, medida3, medida4, gprecio: double;
     // Recuperación de updates en u.ext
     gunidades: integer; // Idem
     Articulo: string;
     MonedaOld: string;
     procedure InsertaArticulo(Articulo: string);
     procedure BloqueaPedido;
     procedure DesBloqueaPedido;
     procedure Duplica(Relaciona: integer);
     procedure CambiaSerie(SerieVar: string);
     function BusquedaCompleja: integer;
     procedure ActualizaCondicionesProv(CrearCondicionModelo: boolean);
     procedure CambiaTarifa(Tarifa: string);
     procedure CambiaUnidadesExt(Articulo: TField; Modo: boolean);
     procedure BorraLineaExt;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
     procedure PreparaNotasDetalle;
     procedure RefrescaTabla;
     procedure Historico;
     procedure CambiaPreciosTarifa;
     procedure AnulaDocumento;
     procedure CambiaMonedaDetalle;
     procedure MascarasMoneda; virtual;
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     function HayDocumentos: boolean;
     function EstadoDocumento: integer;
     function HayDetalle: boolean;
     procedure InfoActualiza; {TyC}
     procedure CambiaEstadoAListado;
     procedure ControlaRestriccion;
     function DameDatosProveedor: boolean;
     procedure GrabaDatosProveedor(Estado: integer);
     procedure DesServir;
     procedure OrdenarLineas;
     procedure TraspasodeDocumentos(id_e: integer);
     procedure RefrescaCabecera(Accion: integer);
     procedure FiltraPendiente(Filtro: string);
     procedure BuscaArticulo(Articulo: string);
     function Inhabilitar: boolean;
     procedure FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
     procedure AsignaTransportistaRapido(Rapido: boolean);
     procedure AbreQMNif;
     procedure CierraQMNif;
     procedure TraspasarPedidoActual(tipo_destino: string);
     procedure BusquedaArticulo(Descripcion: string);
     procedure RellenaDatosOldLinea;
     procedure DuplicarLinea;
     procedure TraspasarPedidoAFacIVA;
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
     procedure AbreDocumento;
     procedure CierraDocumento;
     function DameHintFechaEntregaPrevista: string;
     procedure FiltraDocumento(Serie, Filtro: string);
     procedure ReiniciaStock(Articulo: string = '');
  end;

var
  DMPedidosAProveedor : TDMPedidosAProveedor;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato{, UFRPedido}, UFMPedidosAProveedor, URecursos,
  UFBusca, UFMUnidadesExtGesC, UFInfoHistorico, UFMPreciosArticuloDoc, UFParada,
  UFOrdenaLineas, UFMAlbaranesAProveedor, UFMFacturasAProveedor,
  UFMPedidosAProveedorTallas, UFMain, Math, UParam, DateUtils;

{$R *.DFM}

procedure TDMPedidosAProveedor.DMDocsPedidoAProvCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  StockAlm := TStringList.Create;
  StockAlm2 := TStringList.Create;
  StockAlm3 := TStringList.Create;
  PedidosAProv := TStringList.Create;

  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');
  OldLinea := TStringList.Create;
  Kriconf468 := (DMMain.EstadoKri(468) = 1);
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005'), 0);
  Param_DOCREFE007 := (LeeParametro('DOCREFE007') = 'S');

  // Para que al abrir, antes de establecer la serie el parámetro tenga un valor.
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', REntorno.Serie), 0);

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
  QMCabeceraPOR_PORTES.DisplayFormat := MascaraP;
  QMCabeceraI_PORTES.DisplayFormat := MascaraN;
  QMCabeceraFECHA_ENTREGA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_PRE_CAB.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraFECHA_REC_CAB.DisplayFormat := ShortDateFormat + ' hh:nn';

  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_EXT.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_POR_SERVIR.DisplayFormat := MascaraI;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetalleP_IVA.DisplayFormat := MascaraP;
  QMDetalleP_RECARGO.DisplayFormat := MascaraP;
  QMDetalleUNIDADES_SEC.DisplayFormat := MascaraI;
  QMDetalleP_IMPUESTO_ADICIONAL.DisplayFormat := MascaraP;
  QMDetalleUNIDADES_LOGISTICAS.DisplayFormat := MascaraI;
  QMDetalleFECHA_PRE_DET.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMDetalleFECHA_REC_DET.DisplayFormat := ShortDateFormat + ' hh:nn';

  //Se inicializan las variables globales
  ComisionAgente := 0;

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''PEP'' ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' AND (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) ');
  SQLBase := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  Serie := REntorno.Serie;

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

  {dji lrk kri - Iberfluid - Alerta si se ha superado el importe maximo permitido para PEP}
  ImporteMaximoPEP := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT IMPORTE_MAX_PEP FROM SYS_EMPRESAS WHERE EMPRESA=' + REntorno.EmpresaStr;
        ExecQuery;
        ImporteMaximoPEP := FieldByName['IMPORTE_MAX_PEP'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  UltimoID_EAlertado := 0;
  UnidadesRegalo := 0;
  CalculaPCoste := False;

  if (DMMain.EstadoKri(47) = 1) then
  begin
     QMDetalleUNIDADES_LOGISTICAS.DisplayLabel := _('Bultos');
     QMDetalleUNIDADES.DisplayLabel := _('Kilos');
  end;

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMPedidosAProveedor.Graba(DataSet: TDataSet);
begin
  //TFIBTableSet(DataSet).Transaction.CommitRetaining;
  //DMMain.Graba;
  DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMPedidosAProveedor.QMDetalleNewRecord(DataSet: TDataSet);
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
  QMDetalleUNIDADES_EXT.AsInteger := 0;
  QMDetalleID_E.AsInteger := QMCabeceraID_E.AsInteger;
  Unidades_Old := 0;
  CalculaPCoste := True;
  QMDetalleBULTOS.AsFloat := 0;
  QMDetalleUNIDADES_SEC.AsInteger := 0;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  {/***** insercion dentro del detalle de pedidos ****/}
  QMDetalleFECHA_PRE_DET.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime;
  // QMDetalleFECHA_REC_DET.AsDateTime  := QMCabeceraFECHA_REC_CAB.AsDateTime;

  // Obtenemos el numero de linea más alto en el Pedido a proveedor actual
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf468) then
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

procedure TDMPedidosAProveedor.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'PEP';
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  if (DMMain.EstadoKri(171) = 1) then
     QMCabeceraFECHA_ENTREGA.AsDateTime := EncodeDate(1899, 01, 01)
  else
     QMCabeceraFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraALMACEN.AsString := DMMain.DameAlmacenDocumento('PEP', Serie);
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCCPRY001', Serie), 0);

  QMCabeceraNO_AGREGAR_LINEAS_KRI.AsInteger := 0;
  if (LeeParametro('PEPNALI001', Serie) = 'S') then
     QMCabeceraNO_AGREGAR_LINEAS_KRI.AsInteger := 1;

  QMCabeceraTIPO_PORTES.AsInteger := 0;
  QMCabeceraPOR_PORTES.AsInteger := 0;
  QMCabeceraI_PORTES.AsInteger := 0;
  QMCabeceraPERMITIR_SUPERAR_IMPORTE_KRI.AsInteger := BoolToInt(not (DMMain.EstadoKri(208) = 1));
  QMCabeceraACEPTA_ENTREGA_PARCIAL.AsInteger := BoolToInt(LeeParametro('DOCCAEP001', Serie) = 'S');
  QMCabeceraPEDIDO_RECIBIDO.AsInteger := 0;

  Editando := False;
end;

procedure TDMPedidosAProveedor.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  if Param_DOCREFE007 and (Trim(QMCabeceraSU_REFERENCIA.AsString) <> '') then
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
              SelectSQL.Add(' JOIN GES_CABECERAS_E_PED D ON C.ID_E = D.ID_E ');
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

  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_E', 'ID_E');

  RecalculaPrecios := False;
  {
dji lrk kri - No recalculo precios si cambia la moneda o la fecha

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

procedure TDMPedidosAProveedor.QMDetalleARTICULOChange(Sender: TField);
var
  Baja : boolean;
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  if (not DMMain.ArticuloBloqueado(Sender.AsString, 'PEP')) then
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
           SQL.Add(' SELECT TIPO_IVA, ID_A, ID_C_A, DISPONIBILIDAD, TIPO_IMPUESTO_ADICIONAL FROM CON_CUENTAS_GES_ART ');
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
           QMDetalleTIPO_IVA.AsString := FieldByName['TIPO_IVA'].AsString;
           QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
           QMDetalleID_C_A.AsInteger := FieldByName['ID_C_A'].AsInteger;
           QMDetalleTIPO_IMPUESTO_ADICIONAL.AsInteger := FieldByName['TIPO_IMPUESTO_ADICIONAL'].AsInteger;

           if REntorno.VerSoloArticulosDisponibles then
              if (not (FieldByName['DISPONIBILIDAD'].AsInteger in [0, 1])) then
                 QMDetalle.Cancel;

           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger = 1) and REntorno.PVP_Ud_Sec) then
        QMDetalleAPLICA_UNIDADES_SECUNDARIAS.AsInteger := 1;

     // Pedido Minimo/Optimo
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT PEDIDO_MINIMO, PEDIDO_OPTIMO, INCR_PEDIDO, DIAS_ENTREGA ');
           SQL.Add(' FROM ART_ARTICULOS_PROVEEDORES ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO = :ARTICULO AND ');
           SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
           SQL.Add(' ACTIVO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           Params.ByName['PROVEEDOR'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
           ExecQuery;
           if (FieldByName['PEDIDO_MINIMO'].AsFloat > 0) then
              QMDetalleUNIDADES.AsFloat := FieldByName['PEDIDO_MINIMO'].AsFloat;

           QMDetalleFECHA_PRE_DET.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName['DIAS_ENTREGA'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

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

procedure TDMPedidosAProveedor.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_E.AsInteger > 0) then
        Open;
  end;
end;

procedure TDMPedidosAProveedor.QMDetalleBeforePost(DataSet: TDataSet);
var
  Division : double;
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');

  QMDetalleENTRADA.AsInteger := REntorno.Entrada;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PRIORIDAD, ACTIVO, PEDIDO_MINIMO, PEDIDO_OPTIMO, INCR_PEDIDO ');
        SQL.Add(' FROM ART_ARTICULOS_PROVEEDORES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' ACTIVO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        Params.ByName['PROVEEDOR'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
        ExecQuery;
        if (DMMain.EstadoKri(117) = 1) then
        begin
           if (FieldByName['PRIORIDAD'].AsInteger <> 1) then
              MessageDlg(_('El proveedor para este artículo no es el prioritario'), mtWarning, [mbOK], 0);
           if (FieldByName['ACTIVO'].AsInteger <> 1) then
              MessageDlg(_('El proveedor para este artículo no está activo'), mtWarning, [mbOK], 0);
        end;

        if ((FieldByName['PEDIDO_MINIMO'].AsFloat > 0) and (FieldByName['PEDIDO_MINIMO'].AsFloat > QMDetalleUNIDADES.AsFloat)) then
           MessageDlg(Format(_('Las unidades mínimas para este artículo/proveedor es de %n'), [FieldByName['PEDIDO_MINIMO'].AsFloat]), mtWarning, [mbOK], 0);

        if (FieldByName['INCR_PEDIDO'].AsFloat > 0) then
        begin
           Division := Round(QMDetalleUNIDADES.AsFloat / FieldByName['INCR_PEDIDO'].AsFloat);

           if (RoundTo((Division * FieldByName['INCR_PEDIDO'].AsFloat), -2) <> RoundTo(QMDetalleUNIDADES.AsFloat, -2)) then
              MessageDlg(Format(_('El incremento de pedido para este artículo/proveedor es de %n'), [FieldByName['INCR_PEDIDO'].AsFloat]), mtWarning, [mbOK], 0);
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Avisa si se superara el stock maximo con esta linea
  if (DMMain.EstadoKri(118) = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select STOCK,STOCK_MAXIMO from a_art_dame_stock (?empresa, ?canal, ?almacen, ?articulo,''01/01/3000'', 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, ''01/01/1900'')';
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           if (FieldByName['STOCK'].AsFloat + QMDetalleUNIDADES.AsFloat >
              FieldByName['STOCK_MAXIMO'].AsFloat) then
              MessageDlg(_('El pedido de este artículo supera el stock máximo'),
                 mtWarning, [mbOK], 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Calculo el CRC de las notas para poder agrupar
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
              ShowMessage(_('¡ATENCION! Las Unidades Logísticas no coinciden exactamente con las unidades del artículo'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPedidosAProveedor.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Open;
  xDirecciones.Open;
  QMDetalle.Open;
  xFormasPago.Open;
  QMNif.Open;
  xProyectos.Open;

  InfoActualiza;
end;

procedure TDMPedidosAProveedor.QMCabeceraALMACENChange(Sender: TField);
begin
  EntornoDoc.Almacen := Sender.AsString;
end;

procedure TDMPedidosAProveedor.AntesDeEditar(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
     Almacen := QMCabeceraALMACEN.AsString;
  end;

  MonedaOld := QMCabeceraMONEDA.AsString;
  unidades_old := QMDetalleUNIDADES.AsFloat;
  fecha_old := QMCabeceraFECHA.AsDateTime;
  Editando := True;
end;

procedure TDMPedidosAProveedor.CambiaEstadoPedido(Estado: integer);
begin
  /// Cambio el estado del pedido
  /// Si bloqueo el pedido, le asigno la fecha de recepcion de la fecha de trabajo, si no está puesta

  if ((Estado = 5) and (QMCabeceraFECHA_REC_CAB.AsDateTime < EncodeDate(1900, 1, 1))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_CABECERAS_E_PED SET FECHA_REC_CAB = ?FECHA_REC_CAB WHERE ID_E = ?ID_E ';
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
           Params.ByName['FECHA_REC_CAB'].AsDateTime := REntorno.FechaTrabSH;
           ExecQuery;
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
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_E SET ESTADO = ?ESTADO WHERE ID_E = ?ID_E ';
        Params.ByName['ESTADO'].AsInteger := Estado;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPedidosAProveedor.BloqueaPedido;
begin
  CambiaEstadoPedido(5);
  QMCabecera.Refresh;
end;

procedure TDMPedidosAProveedor.DesBloqueaPedido;
begin
  CambiaEstadoPedido(0);
  QMCabecera.Refresh;
end;

procedure TDMPedidosAProveedor.QMCabeceraPROVEEDORChange(Sender: TField);
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
        QMCabeceraPOR_FINANCIACION.AsFloat := FieldByName('POR_FINANCIACION').AsFloat;
        // Ponemos el transportista normal de ese proveedor
        AsignaTransportistaRapido(False);
        // Calculamos fecha prevista de entrega
        QMCabeceraFECHA_PRE_CAB.AsDateTime := (FieldByName('DIAS_ENTREGA').AsInteger) + Trunc(QMCabeceraFECHA.AsDateTime);
        if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA_RAPIDO').AsInteger) then
           QMCabeceraFECHA_PRE_CAB.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName('DIAS_TRANSPORTE_RAPIDO').AsInteger
        else
        if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA').AsInteger) then
           QMCabeceraFECHA_PRE_CAB.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName('DIAS_TRANSPORTE').AsInteger;

        QMCabeceraTITULO.AsString := FieldByName('TITULO').AsString;
        QMCabeceraMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMCabeceraTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMCabeceraDIRECCION.AsInteger := DMMain.DameMinDireccion(QMCabeceraTERCERO.AsInteger);
        QMCabeceraIDIOMA.AsString := FieldByName('IDIOMA').AsString;
        QMCabeceraPEDIDO_VALORADO.AsInteger := FieldByName('PEDIDO_VALORADO').AsInteger;

        QMCabeceraTIPO_PORTES.AsInteger := FieldByName('TIPO_PORTES').AsInteger;
        case FieldByName('TIPO_PORTES').AsInteger of
           3: QMCabeceraPOR_PORTES.AsFloat := FieldByName('POR_PORTES').AsFloat;
           4: QMCabeceraI_PORTES.AsFloat := FieldByName('I_PORTES').AsFloat;
           // Para los tipo de portes rateados 5,6 se calculan en los triggers dependiendo
           // el valor del importes o del peso
        end;
     end;
  end
  else
     QMCabecera.Cancel;

  DMMain.MuestraAviso('PRO', xProveedor.FieldByName('ID_PROVEEDOR').AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMPedidosAProveedor.Duplica(Relaciona: integer);
var
  IdDocDestino : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOC_E_DUPLICA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''PEP'', :RIG, ');
        SQL.Add(' :ENTRADA, :D_EJERCICIO, :FECHA, :ID_E, :RELACIONA) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        // Obtenemos el ejercicio desde la fecha
        Params.ByName['D_EJERCICIO'].AsInteger := DameEjercicio(QMCabeceraEMPRESA.AsInteger, REntorno.FechaTrab);
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        Params.ByName['RELACIONA'].AsInteger := Relaciona;
        ExecQuery;
        IdDocDestino := FieldByName['ID_E_D'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Relaciona = 1) then
     CierraDocumento;

  QMCabecera.Close;
  QMCabecera.SelectSQL.Text := SQLBase;
  QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
  DMMain.FiltraTabla(QMCabecera, '11100', False);
  CambiaSerie(Serie);
  Refrescar(QMCabecera, 'ID_E', IdDocDestino);
end;

function TDMPedidosAProveedor.BusquedaCompleja: integer;
begin
  DMMain.LogIni('DMPedidosAProveedor.BusquedaCompleja');
  with QMCabecera do
  begin
     Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10110', False, Serie);

     if (Result = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase;
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

procedure TDMPedidosAProveedor.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMPedidosAProveedor.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
     //DMMain.TContador.Rollback;
  end;
end;

procedure TDMPedidosAProveedor.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;

  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
  Param_COMARTU001 := (LeeParametro('COMARTU001', Serie) = 'S');
  Param_COMPREC001 := (LeeParametro('COMPREC001', Serie) = 'S');
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', Serie), 0);
  Param_PEPUPEP001 := (LeeParametro('PEPUPEP001', Serie) = 'S');

  AlmacenStock := LeeParametro('PEPSTKA001', Serie);
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  AlmacenStock2 := LeeParametro('PEPSTKA002', Serie);
  if (AlmacenStock2 = '') then
     AlmacenStock2 := 'NOCALC';
  if (AlmacenStock2 <> 'NOCALC') then
     AlmacenStock2 := Copy(AlmacenStock2, 1, 3);

  AlmacenStock3 := LeeParametro('PEPSTKA003', Serie);
  if (AlmacenStock3 = '') then
     AlmacenStock3 := 'NOCALC';
  if (AlmacenStock3 <> 'NOCALC') then
     AlmacenStock3 := Copy(AlmacenStock3, 1, 3);

  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;

     if (LeeParametro('PEPULTD001', Serie) = 'S') then
        Last;
  end;
end;

procedure TDMPedidosAProveedor.ActualizaCondicionesProv(CrearCondicionModelo: boolean);
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

procedure TDMPedidosAProveedor.CambiaTarifa(Tarifa: string);
begin
  with xArticulosTarifa do
  begin
     Close;
     Params.ByName['EMP'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJE'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CAN'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['PROV'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
     Params.ByName['TAR'].AsString := Tarifa;
     Params.ByName['ALM'].AsString := QMCabeceraALMACEN.AsString;
     Open;
  end;
end;

procedure TDMPedidosAProveedor.InsertaArticulo(Articulo: string);
begin
  if (Param_MODREST017) then
     FMPedidosAProveedor.DBGFDetalle.SetFocus
  else
     FMPedidosAProveedorTallas.DBGFDetalle.SetFocus;
  QMDetalle.Append;
  QMDetalleARTICULO.AsString := Articulo;
end;

procedure TDMPedidosAProveedor.xArticulosTarifaAfterOpen(DataSet: TDataSet);
begin
  xTarifasProveedor.Open;
end;

procedure TDMPedidosAProveedor.CambiaUnidadesExt(Articulo: TField; Modo: boolean);
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
           QMDetalleUNIDADES_EXT.AsFloat := Unidades;
        if QMDetalleUNIDADES_EXT.AsFloat = 0 then
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
        CalculaPCoste := False;
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
        // if (FieldByName['PRECIO_ANT'].AsInteger = 0) then
        // begin
        QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
        QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
        QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
        QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
        UnidadesRegalo := FieldByName['UNIDADES_REGALO'].AsFloat;
        // end;
        FreeHandle;
     finally
        CalculaPCoste := True;
        Free;
     end;
  end;
  CalculaPCoste := True;
end;

procedure TDMPedidosAProveedor.CambiaPreciosTarifa;
var
  bueno : boolean;
begin
  DevuelvePrecio(0, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString, bueno,
     QMCabeceraMONEDA.AsString, QMCabeceraFECHA.AsDateTime,
     QMDetalleID_A.AsInteger);
end;

procedure TDMPedidosAProveedor.QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Open;
  end;
  if xFormasPago.FieldByName('HEREDA_FINANCIACION').AsInteger = 1 then
     QMCabeceraPOR_FINANCIACION.AsFloat := xProveedor.FieldByName('POR_FINANCIACION').AsFloat;
end;

procedure TDMPedidosAProveedor.BorraLineaExt;
begin
  if QMDetalle.State = dsInsert then
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

procedure TDMPedidosAProveedor.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
end;

procedure TDMPedidosAProveedor.DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
begin
  Rig := QMCabeceraRIG.AsInteger;
  Tipo := QMCabeceraTIPO.AsString;
  Num_Factura := '';
  Serie := QMCabeceraSERIE.AsString;
  Titulo := xProveedor.FieldByName('TITULO').AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
end;

procedure TDMPedidosAProveedor.PreparaNotasDetalle;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

function TDMPedidosAProveedor.Traspasado: boolean;
begin
  // Miramos si la línea tiene algún documento origen
  with THYFIBQuery.Create(nil) do
  begin
     try
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
     finally
        Free;
     end;
  end;
end;

// Refrescar el Grid de la Pestaña TABLA
procedure TDMPedidosAProveedor.RefrescaTabla;
begin
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     QMCabecera.Refresh;
     QMDetalle.EnableControls;
  end;
end;

// Histórico de Stocks
procedure TDMPedidosAProveedor.Historico;
begin
  if QMDetalleArticulo.AsString <> '' then
  begin
     FInfoHistorico := TFInfoHistorico.Create(Self);
     FInfoHistorico.Mostrar(QMCabeceraSERIE.AsString,
        QMDetalleARTICULO.AsString, QMCabeceraPROVEEDOR.AsInteger, 1);
     FInfoHistorico.Free;
  end;
end;

procedure TDMPedidosAProveedor.AnulaDocumento;
begin
  with QAnulaDocumento do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
     ExecQuery;
  end;
  QMCabecera.Refresh;
end;

procedure TDMPedidosAProveedor.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  QMCabeceraLIQUIDO.DisplayFormat := LocalMascaraN;

  QMDetalleC_RECARGO.DisplayFormat := LocalMascaraN;
  QMDetalleM_BRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleLIQUIDO.DisplayFormat := LocalMascaraN;
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleT_COSTE.DisplayFormat := LocalMascaraN;
  QMDetalleBRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraN;
  QMDetalleC_IVA.DisplayFormat := LocalMascaraN;
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
end;

procedure TDMPedidosAProveedor.CambiaMonedaDetalle;
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
        Params.ByName['MONEDAOLD'].AsString := MonedaOld;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        TFParada.Create(Self).ExecQuery(SPCambiaMoneda);
        FreeHandle;
     end;
     QMCabecera.Refresh;
  end;
end;

procedure TDMPedidosAProveedor.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1),
     QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMPedidosAProveedor.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMMain.LogIni('DMPedidosAProveedor.FiltraCabecera');
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

     if (Param_MODREST017) then
        FMPedidosAProveedorTallas.EFSerie.Text := Serie
     else
        FMPedidosAProveedor.EFSerie.Text := Serie;
  end;
  DMMain.LogFin('');
end;

function TDMPedidosAProveedor.HayDocumentos: boolean;
begin
  Result := QMCabecera.Active and (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMPedidosAProveedor.EstadoDocumento: integer;
begin
  Result := -1;
  if QMCabecera.Active then
     Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

function TDMPedidosAProveedor.HayDetalle: boolean;
begin
  // Result := (QMDetalle.FieldByName('LINEA').AsInteger <> 0);
  Result := QMDetalle.Active and (QMDetalle.RecordCount > 0);
end;

procedure TDMPedidosAProveedor.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  MonedaOld := QMCabeceraMONEDA.AsString;
end;

procedure TDMPedidosAProveedor.CambiaEstadoAListado;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_E SET ESTADO = :ESTADO WHERE ID_E = :ID_E';
        Params.ByName['ESTADO'].AsInteger := 1;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPedidosAProveedor.QMCabeceraFECHAChange(Sender: TField);
begin
  with xProveedor do
  begin
     Close;
     Open;

     QMCabeceraFECHA_PRE_CAB.AsDateTime := (FieldByName('DIAS_ENTREGA').AsInteger) + Trunc(QMCabeceraFECHA.AsDateTime);
     if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA_RAPIDO').AsInteger) then
        QMCabeceraFECHA_PRE_CAB.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName('DIAS_TRANSPORTE_RAPIDO').AsInteger
     else
     if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA').AsInteger) then
        QMCabeceraFECHA_PRE_CAB.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName('DIAS_TRANSPORTE').AsInteger;
  end;
end;

procedure TDMPedidosAProveedor.QMDetalleUNIDADESChange(Sender: TField);
begin
  // CambiaUnidadesExt (QMDetalleARTICULO, false);
  if ((Trim(QMDetalleARTICULO.AsString) > '') and (xArticulos.FieldByName('CONTROLA_MEDIDAS').AsInteger = 0)) then
  begin
     if ((QMDetalle.State = dsInsert) or (DMMain.EstadoKri(45) = 0)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              CalculaPCoste := False;
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
                 // if (FieldByName['PRECIO_ANT'].AsInteger = 0) then
                 // begin
                 QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
                 QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
                 QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
                 QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
                 UnidadesRegalo := FieldByName['UNIDADES_REGALO'].AsFloat;
                 // end;
              end;
              FreeHandle;
           finally
              CalculaPCoste := True;
              Free;
           end;
        end;
     end;
  end;

  // Se calcula las unidades_sec en funcion del pvp de unidades_sec en la pestaña de articulos
  QMDetalleUNIDADES_SEC.AsFloat := xArticulos.FieldByName('DEFECTO_UD_SECUNDARIA').AsFloat * QMDetalleUNIDADES.AsFloat;

  // QMDetalleBULTOS.AsFloat := 1; {dji lrk kri QMDetalleUNIDADES.AsFloat}

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

procedure TDMPedidosAProveedor.ControlaRestriccion;
begin
  ControlaBorrado(QMCabeceraID_E.AsInteger, QMCabeceraTIPO.AsString);
end;

{No se utiliza
procedure TDMPedidosAProveedor.CambiaMonedaFecha;
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
end;
}
procedure TDMPedidosAProveedor.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  Fecha_old := QMCabeceraFECHA.AsDateTime;
end;

procedure TDMPedidosAProveedor.QMNIFNewRecord(DataSet: TDataSet);
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

function TDMPedidosAProveedor.DameDatosProveedor: boolean;
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

procedure TDMPedidosAProveedor.GrabaDatosProveedor(Estado: integer);
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

{No se utiliza
function TDMPedidosAProveedor.DameEstado : integer;
begin
  Result := QMCabeceraESTADO.Value;
end;
}
procedure TDMPedidosAProveedor.DesServir;
begin
  if QMDetalleUNIDADES.AsFloat = QMDetalleUNIDADES_SERVIDAS.AsFloat then
     raise Exception.Create(_('La línea esta totalmente servida'));

  if ((QMDetalle.RecordCount > 0) and (QMDetalleLINEA_SERVIDA.AsInteger = 1)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_DETALLES_E_PED SET LINEA_SERVIDA = 0 WHERE ID_DETALLES_E = ?ID';
           Params.ByName['ID'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  QMDetalle.Refresh;
end;

procedure TDMPedidosAProveedor.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;
end;

procedure TDMPedidosAProveedor.OrdenarLineas;
begin
  QMDetalle.DisableControls;
  OrdenaLineas('PEP', QMCabeceraID_E.AsInteger, Self);
  QMDetalle.Close;
  QMDetalle.Open;
  QMDetalle.EnableControls;
end;

procedure TDMPedidosAProveedor.RefrescaCabecera(Accion: integer);
var
  Marca : TBookmark;
begin
  case Accion of
     1: QMCabecera.Refresh;
     2:
     begin
        Marca := QMCabecera.GetBookmark;
        try
           //QMCabecera.Transaction.CommitRetaining ;
           QMCabecera.Close;
           QMCabecera.Open;
           QMCabecera.GotoBookmark(Marca);
        finally
           QMCabecera.FreeBookmark(Marca);
        end;
     end;
  end;
end;

procedure TDMPedidosAProveedor.TraspasodeDocumentos(id_e: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_E = ?ID_E ');
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;
end;

procedure TDMPedidosAProveedor.QMCabeceraCAMBIO_FIJOChange(Sender: TField);
begin
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
end;

procedure TDMPedidosAProveedor.FiltraPendiente(Filtro: string);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(Filtro);
     SelectSQL.Add(' AND SERIE = ''' + FMPedidosAProveedor.EFSerie.Text + '''');
     SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
     Open;
  end;
end;

procedure TDMPedidosAProveedor.QMCabeceraPROYECTOChange(Sender: TField);
var
  titulo_ant, titulo : string;
begin
  with xProyectos do
  begin
     titulo_ant := FieldByName('TITULO').AsString;
     Close;
     Open;
     titulo := FieldByName('TITULO').AsString;
  end;

  if ((QMCabeceraSU_REFERENCIA.AsString = titulo_ant) or (QMCabeceraSU_REFERENCIA.AsString = '')) then
  begin
     if (QMCabeceraPROYECTO.AsInteger = 0) then
        QMCabeceraSU_REFERENCIA.AsString := ''
     else
        QMCabeceraSU_REFERENCIA.AsString := titulo;
  end;
end;

procedure TDMPedidosAProveedor.BuscaArticulo(Articulo: string);
begin
  DMMain.LogIni('DMPedidosAProveedor.BuscaArticulo');
  { TODO -cOptimizacion : Ver si se puede optimizar filtrando GES_DETALLES_E por EECS y TIPO. }
  with QMCabecera do
  begin
     Close;
     if (Articulo <> '') then
        ModificaSelect(QMCabecera, ' AND ID_E IN (SELECT ID_E FROM GES_DETALLES_E WHERE ID_A = ' + IntToStr(DameIDArticulo(Articulo)) + ')', (Articulo <> ''))
     else
     begin
        SelectSQL.Text := SQLBase;
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
     end;

     if ExisteParametro(QMCabecera, 'EMPRESA') then
     begin
        DMMain.FiltraTabla(QMCabecera, '11100', False);
     end;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
  DMMain.LogFin('');
end;

function TDMPedidosAProveedor.Inhabilitar: boolean;
begin
  Result := ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit));
end;

procedure TDMPedidosAProveedor.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  OldLinea.Free;
  StockAlm.Free;
  StockAlm2.Free;
  StockAlm3.Free;
  PedidosAProv.Free;
end;

procedure TDMPedidosAProveedor.FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
begin
  with QMCabecera do
  begin
     Close;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''PEP'' AND ');
     SelectSQL.Add(' PROVEEDOR = ?PROVEEDOR ');
     case Estado of
        // 0: Todas
        // Activas
        1: SelectSQL.Add(' AND ESTADO = 0 ');
        // Cerradas
        2: SelectSQL.Add(' AND ESTADO = 5 ');
     end;
     SelectSQL.Add('ORDER BY EJERCICIO, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMPedidosAProveedor.AsignaTransportistaRapido(Rapido: boolean);
begin
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit) and (xProveedor.Active)) then
  begin
     if (Rapido) then
        QMCabeceraTRANSPORTISTA.AsInteger := xProveedor.FieldByName('TRANSPORTISTA_RAPIDO').AsInteger
     else
        QMCabeceraTRANSPORTISTA.AsInteger := xProveedor.FieldByName('TRANSPORTISTA').AsInteger;
  end;
end;

procedure TDMPedidosAProveedor.AbreQMNif;
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

procedure TDMPedidosAProveedor.CierraQMNif;
begin
  QMNif.Close;
end;


procedure TDMPedidosAProveedor.QMDetalleCLIENTE_ORIGEN_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := '';
  if (QMDetalleLINEA.AsInteger > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
           SQL.Text :=
              'select c.cliente,t.nombre_r_social from ges_detalles_e_relaciones r ' +
              ' join ges_detalles_s d ' +
              ' on ' +
              ' r.o_empresa=d.empresa and ' +
              ' r.o_ejercicio=d.ejercicio and ' +
              ' r.o_canal=d.canal and ' +
              ' r.o_serie=d.serie and ' +
              ' r.o_tipo=d.tipo and ' +
              ' r.o_rig=d.rig and ' +
              ' r.o_linea=d.linea ' +
              ' join ges_cabeceras_s c ' +
              ' on d.id_s=c.id_s ' +
              ' join sys_terceros t ' +
              ' on c.tercero=t.tercero ' +
              ' where ' +
              ' r.d_empresa=' + QMDetalleEMPRESA.AsString + ' and ' +
              ' r.d_ejercicio=' + QMDetalleEJERCICIO.AsString + ' and ' +
              ' r.d_canal=' + QMDetalleCANAL.AsString + ' and ' +
              ' r.d_serie=''' + QMDetalleSERIE.AsString + ''' and ' +
              ' r.d_tipo=''' + QMDetalleTIPO.AsString + ''' and ' +
              ' r.d_rig=' + QMDetalleRIG.AsString + ' and ' +
              ' r.d_linea=' + QMDetalleLINEA.AsString + ' and ' +
              ' (r.o_tipo=''OFC'' or r.o_tipo=''PEC'')';
           ExecQuery;
           if (FieldByName['CLIENTE'].AsInteger > 0) then
              Text := Copy(FieldByName['CLIENTE'].AsString + ' - ' + FieldByName['NOMBRE_R_SOCIAL'].AsString, 1, 60);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPedidosAProveedor.AbreDocumentos(id_e_d: integer; tipo_destino, serie: string);
begin
  if (tipo_destino = 'FAP') then
     TraspasoFacturaProv(serie, id_e_d);
  if (tipo_destino = 'ALP') then
     TraspasoAlbaranProv(serie, id_e_d);
end;

procedure TDMPedidosAProveedor.TraspasarPedidoActual(tipo_destino: string);
var
  id_e_d : integer;
  Fecha : TDateTime;
  Param_ALPFECH001 : string;
begin
  Fecha := REntorno.FechaTrab;
  Param_ALPFECH001 := Trim(LeeParametro('ALPFECH001'));
  if (Param_ALPFECH001 <> '') then
     Fecha := RecodeTime(Fecha, StrToIntDef(Copy(Param_ALPFECH001, 1, 2), 0), StrToIntDef(Copy(Param_ALPFECH001, 4, 2), 0), StrToIntDef(Copy(Param_ALPFECH001, 7, 2), 0), 0);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_PEDIDO_PROV_MUL ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?D_TIPO, ');
        SQL.Add(' ?ENTRADA, ?FECHA, ?D_EJERCICIO, ?D_CANAL, ?D_SERIE, ?ID_E, 0, 0, 0) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := 'PEP';
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['D_TIPO'].AsString := tipo_destino;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['D_CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['D_SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        id_e_d := FieldByName['ID_E_D'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ReiniciaStock;

  if REntorno.Ejercicio >= QMCabeceraEJERCICIO.AsInteger then
  begin
     QMCabecera.Refresh;
     AbreDocumentos(id_e_d, tipo_destino, QMCabeceraSERIE.AsString);
  end
  else
  begin
     QMCabecera.Close;
     QMCabecera.Open;
  end;
end;

procedure TDMPedidosAProveedor.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraPROVEEDOR.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;
end;

procedure TDMPedidosAProveedor.QMDetalleAfterPost(DataSet: TDataSet);
var
  HayUnidadesRegalo : boolean;
  Linea : integer;
begin
  // dji lrk kri - Iberfluid - Avisa que se ha superado el importe maximo para PEP y debe pedir autorización
  Graba(DataSet);
  if ((xInfoActualizadaLIQUIDO.AsFloat > ImporteMaximoPEP) and // si se supera el importe
     (QMCabeceraID_E.AsInteger <> UltimoID_EAlertado) and      // y no se lo ha alertado ya
     (ImporteMaximoPEP > 0) and                                // y el imp. max no es 0
     (DMMain.EstadoKri(209) = 1)) then                         // y kriconf 209 = 1
  begin
     ShowMessage(_('Ha superado el importe máximo para Pedidos a Proveedor.' + #13#10 + 'Debe pedir autorización.'));
     UltimoID_EAlertado := QMCabeceraID_E.AsInteger;
  end;

  if (UnidadesRegalo > 0) then
  begin
     // Borro las que no correspondan, por ser de otro articulo (si cambia articulo)
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := ' DELETE FROM GES_DETALLES_E WHERE ID_DETALLES_E_REGALO=' + IntToStr(QMDetalleID_DETALLES_E.AsInteger) +
              ' AND ARTICULO <> ''' + QMDetalleARTICULO.AsString + '''';
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Verifico si ya había unidades regalo
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_E WHERE ID_DETALLES_E_REGALO=' + IntToStr(QMDetalleID_DETALLES_E.AsInteger);
           ExecQuery;
           HayUnidadesRegalo := FieldByName['COUNT'].AsInteger = 1;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (HayUnidadesRegalo) then
     begin
        // Modifico unidades regalo si las ubiera
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := ' UPDATE GES_DETALLES_E SET UNIDADES = ' + IntToStr(Trunc(QMDetalleUNIDADES.AsFloat * UnidadesRegalo / 100)) +
                 ' WHERE ID_DETALLES_E_REGALO=' + IntToStr(QMDetalleID_DETALLES_E.AsInteger);
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        // Agrego las que correspondan
        if (Trunc(QMDetalleUNIDADES.AsFloat * UnidadesRegalo / 100) > 0) then
        begin
           Linea := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'INSERT INTO VER_DETALLE_PEDIDO_PROV (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_E,ID_DETALLES_E,ID_DETALLES_E_REGALO,ARTICULO,UNIDADES,P_COSTE,ENTRADA,PAIS,TIPO_IVA) ' +
                    'VALUES (:EMPRESA,:EJERCICIO,:CANAL,:SERIE,:TIPO,:RIG,:LINEA,:ID_E,:ID_DETALLES_E,:ID_DETALLES_E_REGALO,:ARTICULO,:UNIDADES,:P_COSTE,:ENTRADA,:PAIS,:TIPO_IVA)';
                 Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                 Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
                 Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                 Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
                 Params.ByName['LINEA'].AsInteger := Linea;
                 Params.ByName['ID_E'].AsInteger := QMDetalleID_E.AsInteger;
                 Params.ByName['ID_DETALLES_E'].AsInteger := 0;
                 Params.ByName['ID_DETALLES_E_REGALO'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                 Params.ByName['UNIDADES'].AsFloat := Trunc(QMDetalleUNIDADES.AsFloat * UnidadesRegalo / 100);
                 Params.ByName['P_COSTE'].AsFloat := 0;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['PAIS'].AsString := QMDetallePAIS.AsString;
                 Params.ByName['TIPO_IVA'].AsInteger := QMDetalleTIPO_IVA.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Luego de insertar debo poner precio = 0 y quitar notas
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := ' UPDATE VER_DETALLE_PEDIDO_PROV SET P_COSTE=0, DESCUENTO=0, DESCUENTO_2=0, DESCUENTO_3=0, NOTAS=null ' +
                    ' WHERE ID_DETALLES_E_REGALO=' + IntToStr(QMDetalleID_DETALLES_E.AsInteger);
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end; // Si la cantida de unidades de regalo > 0
     end;
  end;

  RefrescaCabeceraManteniendoPosicionDetalle(DataSet);

  RellenaDatosLinea(OldLinea);
end;

procedure TDMPedidosAProveedor.RefrescaCabeceraManteniendoPosicionDetalle(DataSet: TDataSet);
var
  id_detalles_e : integer;
begin
  with DataSet do
  begin
     if (State = dsInsert) then
        id_detalles_e := -1
     else
        id_detalles_e := FieldByName('ID_DETALLES_E').AsInteger;

     DisableControls;
     try
        QMCabecera.Refresh;
        if (id_detalles_e = -1) then
           Last
        else
           Posicionar(DataSet, 'ID_DETALLES_E', id_detalles_e);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMPedidosAProveedor.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
  RefrescaCabeceraManteniendoPosicionDetalle(DataSet);
end;

procedure TDMPedidosAProveedor.QMDetalleP_COSTEChange(Sender: TField);
begin
  if (CalculaPCoste) then
  begin
     if ((xArticulos.FieldByName('CONTROLA_MEDIDAS').AsInteger = 0) and (Trim(QMDetalleARTICULO.AsString) > '')) then
     begin
        if ((DMMain.EstadoKri(408) <> 1) and (QMDetalleP_COSTE.AsFloat = 0)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 CalculaPCoste := False;
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' EXECUTE PROCEDURE G_PRECIO_COMPRA_MONEDA ');
                 SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :ARTICULO, :FECHA, ');
                 SQL.Add(' :UNIDADES, :UNIDADES_EXT, :PRECIOP, :MONEDA, :UNIDADES_OLD, :FACTOR) ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['PROVEEDOR'].AsInteger := EntornoDoc.Cliente;
                 Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                 Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
                 Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
                 Params.ByName['UNIDADES_EXT'].AsFloat := QMDetalleUNIDADES_EXT.AsFloat;
                 Params.ByName['PRECIOP'].AsFloat := QMDetalleP_COSTE.AsFloat;
                 Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
                 Params.ByName['UNIDADES_OLD'].AsFloat := Unidades_Old;
                 Params.ByName['FACTOR'].AsFloat := QMCabeceraVALOR_CAMB_FIJO.AsFloat;
                 ExecQuery;
                 if (FieldByName['PRECIO_ANT'].AsInteger = 0) then
                 begin
                    QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
                    QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
                    QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
                    QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
                    UnidadesRegalo := FieldByName['UNIDADES_REGALO'].AsFloat;
                 end;
                 FreeHandle;
              finally
                 CalculaPCoste := True;
                 Free;
              end;
           end;
        end;
     end;
  end; {calclua PCoste}
end;

procedure TDMPedidosAProveedor.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);

  if (QMCabeceraLINEA_FASE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FASE FROM PRO_ORD_FASES WHERE ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINEA_FASE';
           Params.ByName['ID_ORDEN'].AsInteger := QMCabeceraID_ORDEN.AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMCabeceraLINEA_FASE.AsInteger;
           ExecQuery;
           QMCabeceraDESC_FASE.AsString := FieldByName['FASE'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMCabeceraDESC_FASE.AsString := _('Sin Fase');
end;

procedure TDMPedidosAProveedor.QMCabeceraID_ORDENChange(Sender: TField);
begin
  if ((QMCabecera.State in [dsInsert, dsEdit])) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select rig_of from pro_ord where id_orden=?id_orden';
           Params.ByName['ID_ORDEN'].AsInteger := QMCabeceraID_ORDEN.AsInteger;
           ExecQuery;
           QMCabeceraRIG_ORDEN.AsInteger := FieldByName['RIG_OF'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPedidosAProveedor.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES.AsFloat]);
end;

procedure TDMPedidosAProveedor.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMDetalleArticulo.OnChange;
  try
     QMDetalleArticulo.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN.AsString);
  finally
     QMDetalleArticulo.OnChange := evt;
  end;
end;

procedure TDMPedidosAProveedor.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
  RellenaDatosLinea(OldLinea);
end;

procedure TDMPedidosAProveedor.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMPedidosAProveedor.RellenaDatosOldLinea;
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMPedidosAProveedor.RellenaDatosLinea(Linea: TStrings);

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

procedure TDMPedidosAProveedor.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMPedidosAProveedor.DuplicarLinea;
var
  old_KriConf468 : boolean;
  // Q : THYFIBQuery;
  // IdDetallesE, i, NuevaLinea : integer;
begin
  old_KriConf468 := KriConf468;
  try
     KriConf468 := True;
     // IdDetallesE := QMDetalleID_DETALLES_E.AsInteger;

     // Guardo los datos con lo que hay en la linea si KriConf468 estaba deshabilidatdo
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
     KriConf468 := old_KriConf468;
  end;
end;

procedure TDMPedidosAProveedor.QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
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

procedure TDMPedidosAProveedor.QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
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

procedure TDMPedidosAProveedor.TraspasarPedidoAFacIVA();
var
  id_e_d : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_PEP_A_FAP_IVA ');
        SQL.Add(' (?ID_E, ?ENTRADA, ?FECHA, ?D_EJERCICIO, ?D_CANAL, ?D_SERIE) ');
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['D_CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['D_SERIE'].AsString := QMCabeceraSERIE.AsString;
        ExecQuery;
        id_e_d := FieldByName['ID_E_D'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (REntorno.Ejercicio >= QMCabeceraEJERCICIO.AsInteger) then
  begin
     QMCabecera.Refresh;
     AbreDocumentos(id_e_d, 'FAP', QMCabeceraSERIE.AsString);
  end
  else
  begin
     QMCabecera.Close;
     QMCabecera.Open;
  end;
end;


procedure TDMPedidosAProveedor.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
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

procedure TDMPedidosAProveedor.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
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

procedure TDMPedidosAProveedor.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
{ No aplica en este tipo de documento
var
  IdLote : integer;
  Composicion : string;
}
begin
  { No aplica en este tipo de documento
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
  }

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

  { No aplica en este tipo de documento
  if (IdLote <> 0) then
     QMDetalleID_LOTE.AsInteger := IdLote;
  if (IdUbicacion <> 0) then // Si es 0 se deja en blanco y el trigger se encgargara
     QMDetalleID_UBICACION.AsInteger := IdUbicacion;
  }
  QMDetalle.Post;
end;

procedure TDMPedidosAProveedor.AbreDocumento;
begin
  CambiaEstadoDocumento(0);
end;

procedure TDMPedidosAProveedor.CierraDocumento;
begin
  CambiaEstadoDocumento(5);
end;

procedure TDMPedidosAProveedor.CambiaEstadoDocumento(Estado: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_E SET ESTADO = :ESTADO WHERE ID_E = :ID_E';
        Params.ByName['ESTADO'].AsInteger := Estado;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPedidosAProveedor.QMCabeceraTRANSPORTISTAChange(Sender: TField);
begin
  with xProveedor do
  begin
     if (Active) then
     begin
        // Calculamos fecha prevista de entrega
        QMCabeceraFECHA_PRE_CAB.AsDateTime := (FieldByName('DIAS_ENTREGA').AsInteger) + Trunc(QMCabeceraFECHA.AsDateTime);
        if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA_RAPIDO').AsInteger) then
           QMCabeceraFECHA_PRE_CAB.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName('DIAS_TRANSPORTE_RAPIDO').AsInteger
        else
        if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA').AsInteger) then
           QMCabeceraFECHA_PRE_CAB.AsDateTime := QMCabeceraFECHA_PRE_CAB.AsDateTime + FieldByName('DIAS_TRANSPORTE').AsInteger;
     end;
  end;
end;

function TDMPedidosAProveedor.DameHintFechaEntregaPrevista: string;
begin
  Result := '';
  with xProveedor do
  begin
     if (Active) then
     begin
        Result := Format(_('Dias Entrega: %d'), [FieldByName('DIAS_ENTREGA').AsInteger]);
        if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA_RAPIDO').AsInteger) then
           Result := Result + Format(_(' + Dias Transporte: %d'), [FieldByName('DIAS_TRANSPORTE_RAPIDO').AsInteger])
        else
        if (QMCabeceraTRANSPORTISTA.AsInteger = FieldByName('TRANSPORTISTA').AsInteger) then
           Result := Result + Format(_(' + Dias Transporte: %d'), [FieldByName('DIAS_TRANSPORTE').AsInteger]);
     end;
  end;
end;

procedure TDMPedidosAProveedor.QMCabeceraNO_AGREGAR_LINEAS_KRIChange(Sender: TField);
begin
  if ((QMCabeceraNO_AGREGAR_LINEAS_KRI.AsInteger = 1) and (RecodeTime(QMCabeceraFECHA.AsDateTime, 0, 0, 0, 0) <> Today)) then
     if ConfirmaMensajeCaption(_('¿Desea modificar la fecha del pedido a fecha actual?'), _('Cambiar fecha')) then
        DMPedidosAProveedor.QMCabeceraFECHA.AsDateTime := Now;
end;

procedure TDMPedidosAProveedor.FiltraDocumento(Serie, Filtro: string);
begin
  DMMain.LogIni('DMPedidosAProveedor.FiltraDocumento');
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := SQLBase;
     if (Trim(Filtro) > '') then
        SelectSQL.Add(' AND (' + Filtro + ')');
     SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
     DMMain.FiltraTabla(QMCabecera, '11100', False);
     Params.ByName['SERIE'].AsString := Serie;
     CambiaSerie(Serie);
  end;
  DMMain.LogFin('');
end;

procedure TDMPedidosAProveedor.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProveedor.Close;
  xDirecciones.Close;
  QMDetalle.Close;
  xFormasPago.Close;
  QMNif.Close;
  xProyectos.Close;
end;

procedure TDMPedidosAProveedor.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  with xDirecciones do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPedidosAProveedor.QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_TOTAL.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_REAL.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetallePESO_REALChange(Sender: TField);
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

procedure TDMPedidosAProveedor.QMDetalleUNIDADES_ORIGINALESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_ORIGINALES.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetalleUNIDADES_POR_SERVIRGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_POR_SERVIR.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_EXT.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetalleUNIDADES_SERVIDASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_SERVIDAS.AsFloat]);
end;

procedure TDMPedidosAProveedor.QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_SEC.AsFloat]);
end;

procedure TDMPedidosAProveedor.xProveedorAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMPedidosAProveedor.xProveedorBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMPedidosAProveedor.xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
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

procedure TDMPedidosAProveedor.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosAProveedor.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosAProveedor.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosAProveedor.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
  Canal : integer;
begin
  Articulo := QMDetalleARTICULO.AsString;
  if (QMDetalleCONTROL_STOCK.AsInteger = 1) then
  begin
     Canal := Param_MOVSTKC001;
     if (Canal = 0) then
        Canal := REntorno.Canal;

     Stock := 0;
     if (AlmacenStock <> 'NOCALC') then
     begin
        with StockAlm do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock2 <> 'NOCALC') then
     begin
        with StockAlm2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock2);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock3 <> 'NOCALC') then
     begin
        with StockAlm3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock3);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM3.AsFloat := Stock;

     // Pedidos a Proveedor
     Stock := 0;
     if Param_PEPUPEP001 then
     begin
        with PedidosAProv do
        begin
           i := IndexOfName(QMDetalleALMACEN.AsString + Articulo);
           if (i < 0) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT PEDIDOS_A_PRO FROM A_ART_DAME_PEDIDOS_PRO(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO)';
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['CANAL'].AsInteger := Canal;
                    Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
                    Params.ByName['ARTICULO'].AsString := Articulo;
                    ExecQuery;
                    Stock := FieldByName['PEDIDOS_A_PRO'].AsFloat;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Values[QMDetalleALMACEN.AsString + Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[QMDetalleALMACEN.AsString + Articulo]);
           end;
        end;
     end;
     QMDetallePEDIDOS_A_PROV.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK_ALM.AsFloat := 0;
     QMDetalleSTOCK_ALM2.AsFloat := 0;
     QMDetalleSTOCK_ALM3.AsFloat := 0;
  end;
end;

procedure TDMPedidosAProveedor.ReiniciaStock(Articulo: string);
var
  i : integer;
begin
  // DMMain.Log('TDMPedidosAProveedor.ReiniciaStock');
  if (Articulo <> '') then
  begin
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlm2 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlm3 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with PedidosAProv do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;
  end
  else
  begin
     StockAlm.Clear;
     StockAlm2.Clear;
     StockAlm3.Clear;
     PedidosAProv.Clear;
  end;
end;

end.
