unit UDMAlbaranesAProveedor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  UComponentesBusquedaFiltrada, FIBDatabase, UFIBModificados, Controls,
  SysUtils, FIBDataSetRO, HYFIBQuery, Dialogs, XMLIntf, XMLDoc;

type
  TDMAlbaranesAProveedor = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
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
     xAlmacenes: TFIBDataSetRO;
     DSxAlmacenes: TDataSource;
     QMCabeceraPROVEEDOR: TIntegerField;
     xProveedor: TFIBDataSetRO;
     DSxProveedor: TDataSource;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraBULTOS: TIntegerField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleP_COSTE: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     xInfoActualizadaLIQUIDO: TFloatField;
     QMCabeceraNUM_ALBARAN: TFIBStringField;
     TLocal: THYTransaction;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     xInfoActualizadaPOR_FINANCIACION: TFloatField;
     xInfoActualizadaI_FINANCIACION: TFloatField;
     QMDetalleUNIDADES_EXT: TFloatField;
     xArticulos: TFIBDataSetRO;
     QMCabeceraFORMA_DE_PAGO: TFIBStringField;
     xFormasPago: TFIBDataSetRO;
     DSxFormasPago: TDataSource;
     QBorraLineaExt: THYFIBQuery;
     QUnidadesExt: THYFIBQuery;
     QUptUnidadesExt: THYFIBQuery;
     QMDetalleNOTAS: TBlobField;
     QMDetalleUNIDADES_PENDIENTES: TFloatField;
     SPTraspasarAFacturaMul: THYFIBQuery;
     QMCabeceraTOTAL_CANAL: TFloatField;
     QMCabeceraENTRADA_FACTURACION: TIntegerField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMDetallePRECIO: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraID_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMCabeceraP_IRPF: TFloatField;
     QMCabeceraI_IRPF: TFloatField;
     QMCabeceraA_IRPF: TIntegerField;
     QMCabeceraTIPO_IRPF: TIntegerField;
     QMCabeceraBASE_IRPF: TFloatField;
     QMCabeceraTOTAL_ALBARAN: TFloatField;
     QMDetalleSUPLIDO: TIntegerField;
     xTipoIRPF: TFIBDataSetRO;
     DSxTipoIRPF: TDataSource;
     QMCabeceraAPLICA_IRPF: TStringField;
     xInfoActualizadaI_IRPF: TFloatField;
     xInfoActualizadaTOTAL_ALBARAN: TFloatField;
     QMDetalleNSERIE: TFIBStringField;
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
     QSPProcedencia: TFIBDataSetRO;
     DSQSPProcedencia: TDataSource;
     QMDetalleBULTOS: TFloatField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     xInfoActualizadaI_PORTES: TFloatField;
     QMDetalleORDEN: TIntegerField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMCabeceraPROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetallePROYECTO: TIntegerField;
     TUpdate: THYTransaction;
     QMNIFID_E: TIntegerField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetalleID_UBICACION: TIntegerField;
     QMDetalleCOMPOSICION: TFIBStringField;
     QMDetalleID_A_UBICACION: TIntegerField;
     QMDetalleUNIDADES_UB: TFloatField;
     QMDetalleALMACEN_UB: TFIBStringField;
     QMDetalleCALLE: TFIBStringField;
     QMDetalleESTANTERIA: TFIBStringField;
     QMDetalleREPISA: TFIBStringField;
     QMDetallePOSICION: TFIBStringField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMDetalleUNIDADES_LOT: TFloatField;
     QMCabeceraID_ORDEN: TIntegerField;
     xInfoActualizadaSUM_UNIDADES: TFloatField;
     QMNIFCOLONIA: TFIBStringField;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraALBARAN_VALORADO: TIntegerField;
     QMDetalleLOTEABLE: TIntegerField;
     QMDetalleCANT_LOTE: TFloatField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMCabeceraDEVOLUCION: TIntegerField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMNIFTERCERO: TIntegerField;
     QMDetalleTOTAL_UNIDADES_EXT: TFloatField;
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
     QMDetalleCOSTE_ADICIONAL: TFloatField;
     xAvisos: TFIBDataSetRO;
     xDireccionesTITULO: TFIBStringField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMCabeceraCOD_MOTIVO_ABONO: TIntegerField;
     QMCabeceraENTREGA_DIRECTA: TIntegerField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     QMCabeceraFECHA_ALBARAN: TDateTimeField;
     QMDetalleSTOCK_ALM: TFloatField;
     QMDetalleSTOCK_ALM2: TFloatField;
     QMDetalleSTOCK_ALM3: TFloatField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMCabeceraOBSERVACIONES: TFIBStringField;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     QMDetalleCONTROL_STOCK: TIntegerField;
     xInfoActualizadaSUM_UNIDADES_SEC: TFloatField;
     xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField;
     xInfoActualizadaSUM_PESO: TFloatField;
     xInfoActualizadaCOUNT_LINEA: TIntegerField;
     procedure DMDocsAlbaranAProvCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaDetalle(DataSet: TDataSet);
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
     procedure QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
     procedure DMAlbaranesAProveedorDestroy(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraTIPO_IRPFChange(Sender: TField);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure QMCabeceraCAMBIO_FIJOChange(Sender: TField);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraPROYECTOChange(Sender: TField);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMCabeceraID_ORDENGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
     procedure DameSqlImpresionEtiquetas(SQL: TStrings);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMDetalleTIPO_IVAChange(Sender: TField);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraDIRECCIONChange(Sender: TField);
     procedure QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALChange(Sender: TField);
     procedure QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_PENDIENTESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_UBGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_LOTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTOTAL_UNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xProveedorAfterOpen(DataSet: TDataSet);
     procedure xProveedorBeforeClose(DataSet: TDataSet);
     procedure xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraFECHAChange(Sender: TField);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     fecha_old: TDateTime;
     ComisionAgente, unidades_old: double;
     SQLFind, SQLBase: string;
     // NSerie: string;
     {RecalculaPrecios,} editando: boolean;
     NumSerie: boolean;
     EstadoQMDetalleEnInsert: boolean;  // Andalplast
     FlagModificandoUnidades: boolean;
     Param_SYSCONF005: integer;
     Param_DOCREFE008: boolean;
     Param_VENULKG001: boolean;
     Param_COMARTU001: boolean;
     Param_COMPREC001: boolean;
     Param_ALPFECH001: string;
     Param_MOVSTKC001: integer;
     Param_ALBETIQ001: integer;
     Param_ALBETIQ002: boolean;
     KriConf469: boolean;
     OldLinea: TStrings;
     ModificandoCambioFijo: boolean;
     AlmacenStock, AlmacenStock2, AlmacenStock3: string;
     StockAlm, StockAlm2, StockAlm3: TStrings;
     {procedure InfoActualiza; dji lrk kri - public - TyC}
     procedure LimpiaProcAuto;
     function Traspasado: boolean;
     procedure RefrescaIRPF;
     procedure DamePorIRPF;
     procedure UbicaArticulo(Peso, Volumen, Diametro: double);
     {procedure CambiaMonedaFecha;}
     {procedure AbreDocumentos(id_e_d : integer; tipo_destino, serie : string);}
     procedure RefrescaCabeceraManteniendoPosicionDetalle(DataSet: TDataSet);
     {function DameEstado: Integer; dji lrk kri - public - TyC}
     {procedure AbreSerializadoAuto; dji lrk kri - public - TyC}
     procedure UbicaDefecto;
     procedure RellenaDatosLinea(Linea: TStrings);
     procedure CambiaEstadoDocumento(Estado: integer);
     function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
     function InsertaDetalleAlbaran(IdDocumento: integer; Titulo, Notas: string; Unidades, Precio, Descuento: double; TipoIva: integer): integer;
  public
     { Public declarations }
     monedaold: string;
     LocalMascaraN, LocalMascaraL: string;
     Medida1, Medida2, Medida3, Medida4, GPrecio: double;
     // Recuperación de updates en u.ext
     Filtrado, NotasLote: boolean; // Controla si se editan las notas del lote
     GUnidades: integer; // Idem
     Ubicable: boolean;// Controla si en el artículo se especifica su ubicacion en el alm.
     procedure TraspasarAFactura;
     procedure Duplica;
     function BusquedaCompleja: integer;
     procedure CambiaSerie(SerieVar: string);
     procedure ActualizaCondicionesProv(CrearCondicionModelo: boolean);
     procedure CambiaUnidadesExt(Articulo: TField; modo: boolean);
     procedure BorraLineaExt;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
     procedure DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
     procedure PreparaNotasDetalle;
     procedure BuscaNumSerie(NroSerie: string; Filtro: boolean);
     function Inhabilitar: boolean;
     function Serializado: boolean;
     procedure RecepcionPedidos(Serie: string; Contador: integer);
     procedure RefrescaTabla;
     procedure Historico;
     procedure CambiaPreciosTarifa;
     procedure AnulaDocumento;
     procedure CambiaMonedaDetalle;
     procedure MascarasMoneda; virtual; {TyC}
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     function HayDocumentos: boolean;
     function HayDetalle: boolean;
     function EstadoDocumento: integer;
     procedure InfoLotes;
     procedure InfoActualiza; {TyC}
     function DameEstado: integer; {TyC}
     procedure AbreSerializadoAuto; {TyC}
     procedure PreparaSerializacion;
     procedure ControlaRestriccion;
     procedure BusquedaArticulo(Descripcion: string);
     procedure VaciaNumSerie;
     procedure DistribuyeArticulo;
     procedure MuestraUbicacion;
     function DameDatosProveedor: boolean;
     procedure GrabaDatosProveedor(Estado: integer);
     procedure Procedencia;
     procedure OrdenarLineas;
     procedure RefrescaCabecera(Accion: integer);
     procedure ListarCodBarras;
     procedure FiltraPendiente(Filtro: string);
     procedure BuscaArticulo(Articulo: string);
     procedure FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
     procedure AbreQMNif;
     procedure CierraQMNif;
     function ObtieneRIC: integer;
     procedure CierraAbreDet;
     procedure RellenaDatosOldLinea;
     procedure DuplicarLinea;
     function Habilitar_but_cambia_iva: boolean;
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
     procedure AbreDocumento;
     procedure CierraDocumento;
     procedure FiltraDocumento(Serie, Filtro: string);
     procedure ImportaXML(Archivo: string; Log: TStrings);
     procedure InsertaDetalleAReparacion(IdReparacion: integer);
     procedure ReiniciaStock(Articulo: string = '');
  end;

var
  DMAlbaranesAProveedor : TDMAlbaranesAProveedor;
  Serie : string;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato{, UFRAlbaran}, UFMAlbaranesAProveedor, URecursos,
  UFBusca, UFMUnidadesExtGesC, UFInfoHistorico, UFMPreciosArticuloDoc,
  {UFMIntroduceLotes,} UFParada, UFMDistribuyeArticulos,
  UFMNumerosDeSerieKriCompra, UFMLotesCompraKri,
  UFMFacturasAProveedor, UFCProcedencia, UFMArtSerializacion, UFOrdenaLineas,
  UDMLstEtiquetas, UFPregCodBarras, UFMain, UFormGest, UFMAlbaranesAProveedorTallas, UFMAsignaLotes, UParam, DateUtils;

{$R *.DFM}

procedure TDMAlbaranesAProveedor.DMDocsAlbaranAProvCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  StockAlm := TStringList.Create;
  StockAlm2 := TStringList.Create;
  StockAlm3 := TStringList.Create;

  OldLinea := TStringList.Create;
  Kriconf469 := (DMMain.EstadoKri(469) = 1);
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005'), 0);
  Param_DOCREFE008 := (LeeParametro('DOCREFE008') = 'S');
  Param_ALBETIQ001 := StrToIntDef(LeeParametro('ALBETIQ001'), 0);
  Param_ALBETIQ002 := (LeeParametro('ALBETIQ002') = 'S');

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
  QMCabeceraP_IRPF.DisplayFormat := MascaraP;
  QMCabeceraPOR_PORTES.DisplayFormat := MascaraP;
  QMCabeceraI_PORTES.DisplayFormat := MascaraN;

  xInfoActualizadaI_PORTES.DisplayFormat := MascaraN;
  // Se asignan las mascaras a los campos correspondientes...
  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_EXT.DisplayFormat := MascaraI;
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

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_ALBARAN_PROV ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''ALP'' ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' AND (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) ');
  SQLBase := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

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

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  Serie := REntorno.Serie;

  Filtrado := False;

  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;

  // Se inicializan las variables globales
  ComisionAgente := 0;

  NotasLote := False;
  NumSerie := False;
  EstadoQMDetalleEnInsert := False;

  if (DMMain.EstadoKri(47) = 1) then
  begin
     QMDetalleUNIDADES_LOGISTICAS.DisplayLabel := _('Bultos');
     QMDetalleUNIDADES.DisplayLabel := _('Kilos');
  end;

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  Param_ALPFECH001 := Trim(LeeParametro('ALPFECH001'));
end;

procedure TDMAlbaranesAProveedor.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMAlbaranesAProveedor.QMDetalleNewRecord(DataSet: TDataSet);
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
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleTIPO.AsString := QMCabeceraTIPO.AsString;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMDetalleID_E.AsInteger := QMCabeceraID_E.AsInteger;
  QMDetalleALMACEN.AsString := QMCabeceraALMACEN.AsString;
  QMDetallePAIS.AsString := REntorno.Pais;
  QMDetalleTITULO.AsString := '';
  QMDetalleUNIDADES.AsInteger := 1;
  QMDetalleENTRADA.AsInteger := REntorno.ENTRADA;
  QMDetalleUNIDADES_EXT.AsInteger := 0;
  Unidades_Old := 0;
  QMDetalleSUPLIDO.AsInteger := 0;
  QMDetalleNSERIE.AsString := '';
  QMDetalleBULTOS.AsFloat := 0;
  QMDetalleUNIDADES_SEC.AsInteger := 0;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  // Obtenemos el numero de linea más alto en el Albaran a proveedor actual
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  NumSerie := False;

  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf469) then
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

procedure TDMAlbaranesAProveedor.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'ALP';
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  if (Param_ALPFECH001 <> '') then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_ALPFECH001, 1, 2), 0), StrToIntDef(Copy(Param_ALPFECH001, 4, 2), 0), StrToIntDef(Copy(Param_ALPFECH001, 7, 2), 0), 0);
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraALMACEN.AsString := DMMain.DameAlmacenDocumento('ALP', Serie);
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraTIPO_IRPF.AsInteger := 0;
  QMCabeceraP_IRPF.AsFloat := 0;
  QMCabeceraTIPO_PORTES.AsInteger := 0;
  QMCabeceraPOR_PORTES.AsFloat := 0;
  QMCabeceraI_PORTES.AsFloat := 0;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraDEVOLUCION.AsInteger := 0;
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCCPRY001', Serie), 0);
  QMCabeceraCOD_MOTIVO_ABONO.AsInteger := 0;
  QMCabeceraENTREGA_DIRECTA.AsInteger := 0;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  if Param_DOCREFE008 and (Trim(QMCabeceraSU_REFERENCIA.AsString) <> '') then
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
              SelectSQL.Add(' JOIN GES_CABECERAS_E_ALB D ON C.ID_E = D.ID_E ');
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

  QMCabeceraNUM_ALBARAN.AsString := Trim(QMCabeceraNUM_ALBARAN.AsString);
  if ((QMCabeceraNUM_ALBARAN.AsString <> '') and (QMCabeceraNUM_ALBARAN.AsString <> 'NO ESPECIFICADO')) then
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
              SelectSQL.Add(' JOIN GES_CABECERAS_E_ALB D ON C.ID_E = D.ID_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' C.TIPO = :TIPO AND ');
              SelectSQL.Add(' D.PROVEEDOR = :PROVEEDOR AND ');
              SelectSQL.Add(' D.NUM_ALBARAN = :NUM_ALBARAN AND ');
              SelectSQL.Add(' C.ID_E <> :ID_E ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['PROVEEDOR'].AsInteger := QMCabeceraPROVEEDOR.AsInteger;
              Params.ByName['NUM_ALBARAN'].AsString := QMCabeceraNUM_ALBARAN.AsString;
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
           ShowMessage(format('Hay otro/s documento/s con el mismo nro. de albaran para este proveedor.'#13#10 + '%s', [Documentos]));
     end;
  end;

  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_E', 'ID_E');

  {
  dji lrk kri - No recalculo precios si cambia la moneda o la fecha

  RecalculaPrecios := False;
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

procedure TDMAlbaranesAProveedor.QMDetalleARTICULOChange(Sender: TField);
var
  Baja : boolean;
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  if (not DMMain.ArticuloBloqueado(Sender.AsString, 'ALP')) then
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

procedure TDMAlbaranesAProveedor.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_E.AsInteger > 0) then
        Open;
  end;
end;

procedure TDMAlbaranesAProveedor.QMDetalleBeforePost(DataSet: TDataSet);
var
  NSerie : TFMNumerosDeSerieKriCompra;
  {Lotes : TFMLotesCompraKri;}
  {Lotes_kri,} Serializado_kri : boolean;
begin
  EstadoQMDetalleEnInsert := False;

  if ((QMDetalleSUPLIDO.AsInteger = 1) and (QMDetalleP_IVA.AsFloat <> 0)) then
  begin
     ShowMessage(_('Los importes suplidos no pueden llevar IVA'));
     Abort;
  end;

  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');
     EstadoQMDetalleEnInsert := True;
  end;

  QMDetalleENTRADA.AsInteger := REntorno.Entrada;

  {lotes_kri := True;}
  serializado_kri := True;
  if DMMain.EstadoKri(161) = 1 then
  begin
     {if ((xArticulos.FieldByName('LOTES_KRI').AsInteger = 0) and (xArticulos.FieldByName('ABIERTO').AsInteger = 0)) then
        lotes_kri := False;}
     if ((xArticulos.FieldByName('SERIALIZADO_KRI').AsInteger = 0) and (xArticulos.FieldByName('ABIERTO').AsInteger = 0)) then
        serializado_kri := False;
  end;
  {if lotes_kri then
  begin
    Lotes := TFMLotesCompraKri.Create(Self);
    Lotes.Muestra(REntorno.Empresa,
      REntorno.Ejercicio,
      REntorno.Canal,
      QMDetalleSERIE.AsString,
      QMDetalleRIG.AsInteger,
      QMDetalleLINEA.AsInteger,
      QMCabeceraFECHA.AsDateTime,
      QMDetalleARTICULO.AsString,
      QMCabeceraALMACEN.AsString,
      QMCabeceraPROVEEDOR.AsInteger,
      QMDetalleUNIDADES.AsInteger,
      false,  -Escandallo-
      false);
    -FORZAR ENTRADA (si ya estan los nros no muestra el form para ingresarlos)-
    Lotes.Release;
  end;}

  if serializado_kri then
  begin
     NSerie := TFMNumerosDeSerieKriCompra.Create(Self);
     NSerie.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        REntorno.Canal,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN.AsString,
        QMCabeceraPROVEEDOR.AsInteger,
        QMDetalleUNIDADES.AsInteger,
        0  {ESCANDALLO});
     NSerie.Release;
  end;

  {Calculo el CRC de las notas para poder agrupar}
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
              ShowMessage(_('ATENCION! Las Unidades Logísticas no coinciden exactamente con las unidades del artículo'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Open;
  xDirecciones.Open;
  QMDetalle.Open;
  xAlmacenes.Open;
  xFormasPago.Open;
  QMNif.Open;
  RefrescaIRPF;
  xProyectos.Open;
  UbicaDefecto;

  InfoActualiza;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraALMACENChange(Sender: TField);
begin
  EntornoDoc.Almacen := Sender.AsString;
  with xAlmacenes do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAlbaranesAProveedor.AntesDeEditar(DataSet: TDataSet);
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

  monedaold := QMCabeceraMONEDA.AsString;
  unidades_old := QMDetalleUNIDADES.AsFloat;
  fecha_old := QMCabeceraFECHA.AsDateTime;
  Editando := True;
end;

procedure TDMAlbaranesAProveedor.TraspasarAFactura;
var
  id_e_d : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_ALBARAN_PROV_MUL ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?D_TIPO, ?ENTRADA, ');
        SQL.Add(' ?FECHA, ?D_EJERCICIO, ?D_CANAL, ?D_SERIE, ?ID_E, 0, 0, 0, 0, 0) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['D_TIPO'].AsString := 'FAP';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
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

  if (REntorno.Ejercicio >= QMCabeceraEJERCICIO.AsInteger) then
  begin
     QMCabecera.Refresh;
     TraspasoFacturaProv(QMCabeceraSERIE.AsString, id_e_d);
  end
  else
  begin
     QMCabecera.Close;
     QMCabecera.Open;
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraPROVEEDORChange(Sender: TField);
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
        QMCabeceraTIPO_IRPF.AsInteger := FieldByName('TIPO_IRPF').AsInteger;
        QMCabeceraPOR_FINANCIACION.AsFloat := FieldByName('POR_FINANCIACION').AsFloat;
        QMCabeceraTITULO.AsString := FieldByName('TITULO').AsString;
        QMCabeceraMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMCabeceraTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMCabeceraDIRECCION.AsInteger := DMMain.DameMinDireccion(QMCabeceraTERCERO.AsInteger);
        QMCabeceraIDIOMA.AsString := FieldByName('IDIOMA').AsString;
        QMCabeceraALBARAN_VALORADO.AsInteger := FieldByName('ALBARAN_VALORADO').AsInteger;

        QMCabeceraTIPO_PORTES.AsInteger := FieldByName('TIPO_PORTES').AsInteger;
        case FieldByName('TIPO_PORTES').AsInteger of
           3: QMCabeceraPOR_PORTES.AsFloat := FieldByName('POR_PORTES').AsFloat;
           4: QMCabeceraI_PORTES.AsFloat := FieldByName('I_PORTES').AsFloat;
           // Para los tipo de portes rateados 5,6 se calculan en los triggers dependiendo
           // el valor del importes o del peso
        end;
     end;

     RefrescaIRPF;
  end
  else
     QMCabecera.Cancel;

  DMMain.MuestraAviso('PRO', xProveedor.FieldByName('ID_PROVEEDOR').AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMAlbaranesAProveedor.Duplica;
var
  IdDocDestino : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_DOC_E_DUPLICA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''ALP'', :RIG, :ENTRADA, :D_EJERCICIO, :FECHA, :ID_E, :RELACIONA)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        Params.ByName['RELACIONA'].AsInteger := 0;
        ExecQuery;
        IdDocDestino := FieldByName['ID_E_D'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Close;
  QMCabecera.SelectSQL.Text := SQLBase;
  QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
  DMMain.FiltraTabla(QMCabecera, '11100', False);
  CambiaSerie(Serie);
  Refrescar(QMCabecera, 'ID_E', IdDocDestino);
end;

function TDMAlbaranesAProveedor.BusquedaCompleja: integer;
begin
  DMMain.LogIni('DMAlbaranesAProveedor.BusquedaCompleja');
  Filtrado := True;

  with QMCabecera do
  begin
     Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10110', False, serie);

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

procedure TDMAlbaranesAProveedor.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  {
  if (DMMain.TContador.InTransaction) then
    DMMain.TContador.Commit;
}
  {
dji lrk kri - No recalculo precios si cambia la moneda o la fecha

  if (monedaold <> QMCabeceraMONEDA.AsString) then
    CambiaMonedaDetalle;
  if RecalculaPrecios then
    CambiaMonedaFecha;
}
  UbicaDefecto;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
     // DMMain.TContador.RollBack;
  end;
end;

procedure TDMAlbaranesAProveedor.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;

  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
  Param_COMARTU001 := (LeeParametro('COMARTU001', Serie) = 'S');
  Param_COMPREC001 := (LeeParametro('COMPREC001', Serie) = 'S');
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', Serie), 0);


  AlmacenStock := LeeParametro('ALPSTKA001', Serie);
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  AlmacenStock2 := LeeParametro('ALPSTKA002', Serie);
  if (AlmacenStock2 = '') then
     AlmacenStock2 := 'NOCALC';
  if (AlmacenStock2 <> 'NOCALC') then
     AlmacenStock2 := Copy(AlmacenStock2, 1, 3);

  AlmacenStock3 := LeeParametro('ALPSTKA003', Serie);
  if (AlmacenStock3 = '') then
     AlmacenStock3 := 'NOCALC';
  if (AlmacenStock3 <> 'NOCALC') then
     AlmacenStock3 := Copy(AlmacenStock3, 1, 3);

  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;

     if (LeeParametro('ALPULTD001', Serie) = 'S') then
        Last;
  end;
end;

procedure TDMAlbaranesAProveedor.ActualizaCondicionesProv(CrearCondicionModelo: boolean);
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

procedure TDMAlbaranesAProveedor.CambiaUnidadesExt(Articulo: TField; modo: boolean);
var
  Estado, Proveedor : integer;
  Unidades, Precio : double;
  Articulo_Old : string;
begin
  Estado := 2;
  if ((QMCabeceraESTADO.AsInteger <> 5) and (not Traspasado)) then
     if not (QMDetalle.State in [dsEdit, dsInsert]) and modo then
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
              estado := 1;
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
                 Medida1 := FieldByName['MEDIDA1'].AsFloat;
                 Medida2 := FieldByName['MEDIDA2'].AsFloat;
                 Medida3 := FieldByName['MEDIDA3'].AsFloat;
                 Medida4 := FieldByName['MEDIDA4'].AsFloat;
                 GPrecio := FieldByName['PRECIO'].AsFloat;
                 GUnidades := FieldByName['UNIDADES'].AsInteger;
                 FreeHandle;
              end;
           end;
        end;
        Unidades := DevuelveValor(xArticulos, Self, QMDetalleEMPRESA.AsInteger, QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString, QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger,
           QMDetalleARTICULO.AsString, Estado, Precio, Proveedor, QMCabeceraMONEDA.AsString, QMCabeceraVALOR_CAMB_FIJO.AsFloat);

        if (Estado <> 2) then
           QMDetalleUNIDADES_EXT.AsFloat := unidades;
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
        Params.ByName['UNIDADES_OLD'].AsFloat := 0;
        Params.ByName['FACTOR'].AsFloat := QMCabeceraVALOR_CAMB_FIJO.AsFloat;
        ExecQuery;
        QMDetalleTITULO.AsString := FieldByName['TITULO'].AsString;
        QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
        QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
        QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
        QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.CambiaPreciosTarifa;
var
  bueno : boolean;
begin
  DevuelvePrecio(0, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString, bueno,
     QMCabeceraMONEDA.AsString, QMCabeceraFECHA.AsDateTime,
     QMDetalleID_A.AsInteger);
end;

procedure TDMAlbaranesAProveedor.QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Open;
  end;
  if xFormasPago.FieldByName('HEREDA_FINANCIACION').AsInteger = 1 then
     QMCabeceraPOR_FINANCIACION.AsFloat := xProveedor.FieldByName('POR_FINANCIACION').AsFloat;
end;

procedure TDMAlbaranesAProveedor.BorraLineaExt;
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

procedure TDMAlbaranesAProveedor.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
end;

procedure TDMAlbaranesAProveedor.DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
begin
  Rig := QMCabeceraRIG.AsInteger;
  Tipo := QMCabeceraTIPO.AsString;
  Num_Factura := '';
  Serie := QMCabeceraSERIE.AsString;
  Titulo := xProveedor.FieldByName('TITULO').AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
end;

procedure TDMAlbaranesAProveedor.DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea, Devolucion: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
begin
  Serie := QMCabeceraSERIE.AsString;
  Tipo := QMCabeceraTIPO.AsString;
  Rig := QMCabeceraRIG.AsInteger;
  Linea := QMDetalleLINEA.AsInteger;
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
  Fecha := QMCabeceraFECHA.AsDateTime;
  Unidades := QMDetalleUNIDADES.AsFloat;
  Estado := QMCabeceraESTADO.AsInteger;
  Ejercicio := QMCabeceraEjercicio.AsInteger;
  Devolucion := integer(QMDetalleUNIDADES.AsFloat < 0);
end;

procedure TDMAlbaranesAProveedor.PreparaNotasDetalle;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

procedure TDMAlbaranesAProveedor.BuscaNumSerie(NroSerie: string; Filtro: boolean);
begin
  // NSerie := NroSerie;
  if Filtro then
  begin
     QMCabecera.Close;
     QMCabecera.SelectSQL.Text := '';
  end;

  ModificaSelect(QMCabecera, ' SELECT * FROM VER_CABECERAS_ALBARAN_PROV  WHERE EMPRESA=?EMPRESA' +
     ' AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=''ALP''' +
     ' AND RIG IN (SELECT RIG FROM VER_DETALLE_SERIALIZACION ' +
     ' WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
     REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr +
     ' AND TIPO=''ALP'' AND SERIE=''' + Serie + ''' AND NSERIE=?NSERIE)', Filtro);

  if (not Filtrado) then
     DMMain.FiltraTabla(QMCabecera, '11100', False);
  QMCabecera.Params.ByName['SERIE'].AsString := Serie;
  if (Pos('NSERIE', QMCabecera.SelectSQL.Text) > 0) then
     QMCabecera.Params.ByName['NSERIE'].AsString := NroSerie;
  QMCabecera.Open;

  if ((QMCabecera.RecordCount = 0) and Filtro) then
  begin
     Application.MessageBox(PChar(string(Format(_('No se han encontrado documentos con el numero de serie %s'), [NroSerie]))),
        PChar(string(_('ATENCION!'))), MB_OK + mb_IconStop);
     with QMCabecera do
     begin
        Close;
        SelectSQL.Text := SQLFind;
        DMMain.FiltraTabla(QMCabecera, '11100', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
        Last;
     end;
  end;
end;

function TDMAlbaranesAProveedor.Inhabilitar: boolean;
begin
  Result := ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit));
end;

function TDMAlbaranesAProveedor.Serializado: boolean;
begin
  // Primero miro si el articulo es serializado
  Result := (xArticulos.FieldByName('SERIALIZADO').AsInteger = 1);

  // Si no lo es, miro el detalle de su escandallo
  if not Result then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 D.SERIALIZADO FROM ART_ARTICULOS_ESCANDALLO E ');
           SQL.Add(' JOIN ART_ARTICULOS D ON E.EMPRESA = D.EMPRESA AND E.DETALLE = D.ARTICULO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' E.ARTICULO = :ARTICULO AND ');
           SQL.Add(' D.SERIALIZADO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           Result := (FieldByName['SERIALIZADO'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.LimpiaProcAuto;
begin
  // Borramos los registros correspondientes de la tabla temporal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PROCESOS_AUTO WHERE ENTRADA = :ENTRADA AND TIPO = :TIPO';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := 'ALP';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.DMAlbaranesAProveedorDestroy(Sender: TObject);
begin
  LimpiaProcAuto;
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  StockAlm.Free;
  StockAlm2.Free;
  StockAlm3.Free;
  OldLinea.Free;
end;

procedure TDMAlbaranesAProveedor.RecepcionPedidos(Serie: string; Contador: integer);
var
  PlanTemp : string;
begin
  with QMCabecera do
  begin
     Close;
     PlanTemp := Plan.Text;
     Plan.Text := '';
     SelectSQL.Text := 'SELECT VER.* FROM VER_CABECERAS_ALBARAN_PROV VER' +
        ' JOIN TMP_PROCESOS_AUTO TMP ON ' +
        ' VER.EMPRESA=TMP.EMPRESA AND VER.EJERCICIO=TMP.EJERCICIO AND' +
        ' VER.CANAL=TMP.CANAL AND VER.SERIE=TMP.SERIE AND' +
        ' VER.TIPO=TMP.TIPO AND VER.RIG=TMP.RIG' +
        ' WHERE VER.EMPRESA=?EMPRESA AND VER.EJERCICIO=?EJERCICIO AND' +
        ' VER.CANAL=?CANAL AND VER.SERIE=?SERIE AND' +
        ' VER.TIPO=''ALP'' AND TMP.CONTADOR=' + IntToStr(Contador) +
        ' ORDER BY VER.RIG';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
     // Plan.Text := PlanTemp;
  end;
end;

procedure TDMAlbaranesAProveedor.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
  RellenaDatosLinea(OldLinea);
end;

function TDMAlbaranesAProveedor.Traspasado: boolean;
var
  Q : THYFIBQuery;
begin
  // Miramos si la línea tiene algún documento origen
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
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
     end;
  finally
     FreeAndNil(Q);
  end;
end;

// Refrescar el Grid de la Pestaña TABLA
procedure TDMAlbaranesAProveedor.RefrescaTabla;
begin
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     try
        QMCabecera.Refresh;
     finally
        QMDetalle.EnableControls;
     end;
  end;
end;

// Histórico de Stocks
procedure TDMAlbaranesAProveedor.Historico;
begin
  if QMDetalleArticulo.AsString <> '' then
  begin
     FInfoHistorico := TFInfoHistorico.Create(Self);
     FInfoHistorico.Mostrar(QMCabeceraSERIE.AsString,
        QMDetalleARTICULO.AsString, QMCabeceraPROVEEDOR.AsInteger, 1);
     FInfoHistorico.Free;
  end;
end;

procedure TDMAlbaranesAProveedor.AnulaDocumento;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_ANULA_DOCUMENTO_E(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_E)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMAlbaranesAProveedor.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  QMCabeceraLIQUIDO.DisplayFormat := LocalMascaraN;

  QMDetalleC_RECARGO.DisplayFormat := LocalMascaraN;
  QMDetalleM_BRUTO.DisplayFormat := LocalMascaraN;
  QMDetalleLIQUIDO.DisplayFormat := LocalMascaraN;
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleT_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleBRUTO.DisplayFormat := LocalMascaraL;
  QMDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraN;
  QMDetalleC_IVA.DisplayFormat := LocalMascaraL;
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
  xInfoActualizadaTOTAL_ALBARAN.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_IRPF.DisplayFormat := LocalMascaraN;
  xInfoActualizadaSUM_UNIDADES.DisplayFormat := LocalMascaraN;
end;

procedure TDMAlbaranesAProveedor.CambiaMonedaDetalle;
var
  Q : THYFIBQuery;
begin
  if ((QMCabecera.RecordCount <> 0) and (QMDetalle.RecordCount <> 0)) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE UT_REFRESCA_DETALLE_E_MONEDA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :MONEDAOLD, :ID_E)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['MONEDAOLD'].AsString := monedaold;
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1),
     QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMAlbaranesAProveedor.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMMain.LogIni('DMAlbaranesAProveedor.FiltraCabecera');
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := SQLFind;
     SelectSQL.Add(' AND EJERCICIO = ?EJERCICIO ');
     SelectSQL.Add(' AND RIG = ?RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
  end;
  DMMain.LogFin('');
end;

function TDMAlbaranesAProveedor.HayDocumentos: boolean;
begin
  Result := (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMAlbaranesAProveedor.HayDetalle: boolean;
begin
  Result := (QMDetalle.RecordCount > 0);
end;

procedure TDMAlbaranesAProveedor.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  monedaold := QMCabeceraMONEDA.AsString;
end;

procedure TDMAlbaranesAProveedor.InfoLotes;
var
  AsignaLotes : TFMAsignaLotes;
  (*
  IntroduceLotes : TFMIntroduceLotes;
  aIdLote : integer;
  *)
begin
  if ((QMDetalle.State = dsBrowse) {and (ArticuloLoteable(QMDetalleARTICULO.AsString))}) then
  begin
     AsignaLotes := TFMAsignaLotes.Create(Self);
     try
        with AsignaLotes do
        begin
           AsignaDocumento(QMDetalleTIPO.AsString, QMDetalleID_DETALLES_E.AsInteger, (QMCabeceraESTADO.AsInteger = 0));
        end;
     finally
        AsignaLotes.Free;
     end;

     (*
     if (QMDetalle.State = dsBrowse) then
        QMDetalle.Edit;
     IntroduceLotes := TFMIntroduceLotes.Create(Self);
     try
        with IntroduceLotes do
        begin
           aIdLote := AsignaArticulo(QMDetalleTIPO.AsString,
              QMDetalleSERIE.AsString,
              QMDetalleARTICULO.AsString, QMDetalleEJERCICIO.AsInteger,
              QMDetalleRIG.AsInteger,
              QMDetalleLINEA.AsInteger, QMDetalleUNIDADES.AsFloat,
              QMCabeceraALMACEN.AsString,
              QMDetalleALMACEN.AsString, QMDetalleCANAL.AsInteger,
              QMDetalleCANAL.AsInteger,
              (QMCabeceraESTADO.AsInteger = 0), QMDetalleID_A.AsInteger,
              QMDetalleID_DETALLES_E.AsInteger, QMCabeceraPROVEEDOR.AsInteger, True);

           if (aIdLote <> 0) then
              QMDetalleID_LOTE.AsInteger := aIdLote;

           // Informo la ubicacion seleccionada en la seleccion de lote
           if (ArticuloUbicable(QMDetalleARTICULO.AsString)) then
              QMDetalleID_UBICACION.AsInteger := IDUbicacion;
        end;
     finally
        IntroduceLotes.Free;
     end;
     *)

     CierraAbreDet;
  end;
end;

procedure TDMAlbaranesAProveedor.GrabaDetalle(DataSet: TDataSet);
begin
  // DMMain.Graba;
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  InfoActualiza;

  if (QMDetalleID_LOTE.AsInteger = 0) then
     InfoLotes;
  {
  NotasLote := False;
  DistribuyeArticulo;
}
  if ((Serializado) and (SerializadoAuto) and not (NumSerie)) then
     AbreSerializadoAuto;
  RefrescaCabeceraManteniendoPosicionDetalle(DataSet);

  // Andalplast
  if ((xAlmacenes.FieldByName('CTROL_UBICACION').AsInteger = 1) and
     (EstadoQMDetalleEnInsert)) then
     MuestraUbicacion;

  ReiniciaStock(QMDetalleARTICULO.AsString);

  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADESChange(Sender: TField);
begin
  // CambiaUnidadesExt (QMDetalleARTICULO, false);
  if ((Trim(QMDetalleARTICULO.AsString) > '') and (xArticulos.FieldByName('CONTROLA_MEDIDAS').AsInteger = 0)) then
  begin
     if ((QMDetalle.State = dsInsert) or (DMMain.EstadoKri(45) = 0)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
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
                 if (FieldByName['PRECIO_ANT'].AsInteger = 0) then
                 begin
                    QMDetalleP_COSTE.AsFloat := FieldByName['PRECIO'].AsFloat;
                    QMDetalleDESCUENTO.AsFloat := FieldByName['DESCUENTO_1'].AsFloat;
                    QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
                    QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
                 end;
              end;
              FreeHandle;
           finally
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

procedure TDMAlbaranesAProveedor.PreparaSerializacion;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
end;

procedure TDMAlbaranesAProveedor.ControlaRestriccion;
begin
  ControlaBorrado(QMCabeceraID_E.AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMAlbaranesAProveedor.RefrescaIRPF;
begin
  with xTipoIRPF do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IRPF'].AsFloat := QMCabeceraTIPO_IRPF.AsFloat;
     Open;
  end;

  DamePorIRPF;
end;

procedure TDMAlbaranesAProveedor.DamePorIRPF;
var
  base : byte;
begin
  with xTipoIRPF do
  begin
     QMCabeceraP_IRPF.AsFloat := FieldByName('P_IRPF').AsFloat;
     base := FieldByName('BASE').AsInteger;
  end;

  if (base = 0) then
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable a la Base Imponible')
  else
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable al Total con IVA');
end;

procedure TDMAlbaranesAProveedor.QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraA_IRPF.AsInteger = 0 then
     Text := _('Aplicable a la Base Imponible')
  else
     Text := _('Aplicable al Total con IVA');
end;

procedure TDMAlbaranesAProveedor.QMCabeceraTIPO_IRPFChange(Sender: TField);
begin
  RefrescaIRPF;
end;

procedure TDMAlbaranesAProveedor.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMDetalleArticulo.OnChange;
  try
     QMDetalleArticulo.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN.AsString, 0, QMDetalleNSERIE);
     NumSerie := True;
  finally
     QMDetalleArticulo.OnChange := evt;
  end;
end;

procedure TDMAlbaranesAProveedor.VaciaNumSerie;
begin
  QMDetalleNSERIE.AsString := '';
end;

procedure TDMAlbaranesAProveedor.DistribuyeArticulo;
var
  peso, volumen, diametro : double;
begin
  if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     UbicaArticulo(Peso, Volumen, Diametro);
end;

procedure TDMAlbaranesAProveedor.MuestraUbicacion;
var
  peso, volumen, diametro : double;
begin
  if ((CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) or
     (ArticuloLoteable(QMDetalleID_A.AsInteger)) or
     (ArticuloSerializado(QMDetalleID_A.AsInteger))) then
  begin
     TFMDistribuyeArticulos.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
        QMDetalleEJERCICIO.AsInteger, QMDetalleCANAL.AsInteger,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMDetalleID_DETALLES_E.AsInteger,
        QMDetalleID_A.AsInteger, QMDetalleSERIE.AsString, QMDetalleTIPO.AsString,
        QMDetalleUNIDADES.AsFloat);

     QMDetalle.Refresh;
  end
  else
     ShowMessage(_('El artículo no es ubicable'));
end;

procedure TDMAlbaranesAProveedor.UbicaArticulo(Peso, Volumen, Diametro: double);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Add(' EXECUTE PROCEDURE A_ART_DISTRIBUYE_ARTICULOS( ');
     SQL.Add(' ?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ');
     SQL.Add(' ?ID_DETALLES_E, ?ID_A, ?UNIDADES, ?PESO, ?VOLUMEN, ?DIAMETRO, ');
     SQL.Add(' 99999, ?ARTICULO) ');
     Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
     Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
     Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
     Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
     Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
     Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
     Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsInteger;
     Params.ByName['PESO'].AsFloat := Peso;
     Params.ByName['VOLUMEN'].AsFloat := Volumen;
     Params.ByName['DIAMETRO'].AsFloat := Diametro;
     Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

{No se utiliza
procedure TDMAlbaranesAProveedor.CambiaMonedaFecha;
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
procedure TDMAlbaranesAProveedor.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  fecha_old := QMCabeceraFECHA.AsDateTime;
  // TODO: Verificar si esto se utiliza
  {if (LeeParametro('MODREST017') = 'S') then
     FMAlbaranesAProveedorTallas.Notas
  else
     FMAlbaranesAProveedor.Notas;}
  UbicaDefecto;
end;

{No se utiliza
procedure TDMAlbaranesAProveedor.AbreDocumentos(id_e_d : integer; tipo_destino, serie : string);
begin
  if (tipo_destino = 'FAP') then
     TraspasoFacturaProv(serie, id_e_d);
end;
}

function TDMAlbaranesAProveedor.DameDatosProveedor: boolean;
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

procedure TDMAlbaranesAProveedor.GrabaDatosProveedor(Estado: integer);
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

function TDMAlbaranesAProveedor.DameEstado: integer;
begin
  Result := QMCabeceraESTADO.Value;
end;

procedure TDMAlbaranesAProveedor.QMNIFNewRecord(DataSet: TDataSet);
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

procedure TDMAlbaranesAProveedor.Procedencia;
begin
  QSPProcedencia.Close;
  QSPProcedencia.Open;

  Application.CreateForm(TFCProcedencia, FCProcedencia);
  FCProcedencia.DBGProcedencia.DataSource := DMAlbaranesAProveedor.DSQSPProcedencia;
  FCProcedencia.ShowModal;

  QSPProcedencia.Close;
end;

procedure TDMAlbaranesAProveedor.AbreSerializadoAuto;
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado, Devolucion : integer;
  Ejercicio : smallint;
  Fecha : TDateTime;
  Unidades : double;
begin
  PreparaSerializacion;
  DMAlbaranesAProveedor.DatosSerializacion(Ejercicio, Serie, Tipo, Almacen,
     Articulo, Rig, Linea, Devolucion, Fecha, Unidades, Estado);
  MuestraSerializacion(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig, Linea,
     Devolucion, Fecha, Unidades, Estado, Self);
end;

procedure TDMAlbaranesAProveedor.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Pais := REntorno.Pais;
  end;
end;

procedure TDMAlbaranesAProveedor.OrdenarLineas;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        OrdenaLineas('ALP', QMCabeceraID_E.AsInteger, Self);
        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.RefrescaCabecera(Accion: integer);
var
  Marca : TBookmark;
begin
  with QMCabecera do
  begin
     case Accion of
        1: Refresh;
        2:
        begin
           Marca := GetBookmark;
           try
              // QMCabecera.Transaction.CommitRetaining;
              Close;
              Open;
              GotoBookmark(Marca);
           finally
              FreeBookmark(Marca);
           end;
        end;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraCAMBIO_FIJOChange(Sender: TField);
begin
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
end;

procedure TDMAlbaranesAProveedor.ListarCodBarras;
var
  modo, {Tipo,} numBarras, numespacios, ori, valorado, UsarBultos : integer;
  tarifa : string;
  form : TFPregCodBarras;
  dm : TDMLstEtiquetas;
  Texto1, Texto2, Texto3, Idioma : string;
begin
  ori := 3;
  form := TFPregCodBarras.Create(Self);
  form.Muestrate(modo, numBarras, numespacios, ori, valorado, UsarBultos, tarifa, Texto1, Texto2, Texto3, Idioma);
  if (modo < 2) then
  begin
     dm := nil;
     AbreData(TDMLstEtiquetas, dm);

     dm.Texto1 := Texto1;
     dm.Texto2 := Texto2;
     dm.Texto3 := Texto3;
     dm.Idioma := Idioma;

     dm.MostrarListadoCodBarras(QMCabeceraEjercicio.AsInteger, QMCabeceraCanal.AsInteger,
        QMcabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, '.', numBarras, numespacios, modo, ori,
        tarifa, QMCabeceraID_E.AsInteger, Valorado, '', UsarBultos);
     CierraData(dm);
  end;
end;

procedure TDMAlbaranesAProveedor.FiltraPendiente(Filtro: string);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_ALBARAN_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(Filtro);
     SelectSQL.Add(' AND SERIE = ''' + FMAlbaranesAProveedor.EFSerie.Text + '''');
     SelectSQL.Add('ORDER BY EJERCICIO, RIG ');
     Open;
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraPROYECTOChange(Sender: TField);
var
  TituloAnt, Titulo : string;
begin
  with xProyectos do
  begin
     TituloAnt := FieldByName('TITULO').AsString;
     Close;
     Open;
     Titulo := FieldByName('TITULO').AsString;
  end;

  if ((QMCabeceraSU_REFERENCIA.AsString = TituloAnt) or (QMCabeceraSU_REFERENCIA.AsString = '')) then
  begin
     if (QMCabeceraPROYECTO.AsInteger = 0) then
        QMCabeceraSU_REFERENCIA.AsString := ''
     else
        QMCabeceraSU_REFERENCIA.AsString := Titulo;
  end;
end;

procedure TDMAlbaranesAProveedor.BuscaArticulo(Articulo: string);
begin
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
end;

procedure TDMAlbaranesAProveedor.FiltraProveedorKri(Ejercicio: integer; Serie: string; Proveedor, Estado: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_ALBARAN_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0))) AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''ALP'' AND ');
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

procedure TDMAlbaranesAProveedor.AbreQMNif;
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

procedure TDMAlbaranesAProveedor.CierraQMNif;
begin
  QMNif.Close;
end;

function TDMAlbaranesAProveedor.EstadoDocumento: integer;
begin
  Result := QMCabeceraESTADO.AsInteger;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraPROVEEDOR.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;
end;

procedure TDMAlbaranesAProveedor.RefrescaCabeceraManteniendoPosicionDetalle(DataSet: TDataSet);
var
  id_detalles_e : integer;
begin
  if (DataSet.State = dsInsert) then
     id_detalles_e := -1
  else
     id_detalles_e := DataSet.FieldByName('ID_DETALLES_E').AsInteger;

  Refrescar(DataSet, 'ID_DETALLES_E', id_detalles_e);
end;

procedure TDMAlbaranesAProveedor.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
  RefrescaCabeceraManteniendoPosicionDetalle(DataSet);
end;

procedure TDMAlbaranesAProveedor.QMCabeceraID_ORDENGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT P.ID_ORDEN FROM G_RELACIONES_ORIGENES_E(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) SP ');
        SQL.Add(' JOIN GES_CABECERAS_E_PED P ');
        SQL.Add(' ON SP.REMPRESA=P.EMPRESA AND ');
        SQL.Add(' SP.REJERCICIO=P.EJERCICIO AND ');
        SQL.Add(' SP.RCANAL=P.CANAL AND ');
        SQL.Add(' SP.RSERIE=P.SERIE AND ');
        SQL.Add(' SP.RTIPO=P.TIPO AND ');
        SQL.Add(' SP.RRIG=P.RIG ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        Text := FieldByName['ID_ORDEN'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.UbicaDefecto;
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SERIE, DET.TIPO, DET.RIG, DET.LINEA, ');
           SQL.Add(' DET.ID_S, DET.ID_DETALLES_S, DET.ID_A, DET.UNIDADES ');
           SQL.Add(' FROM GES_DETALLES_S DET ');
           SQL.Add(' JOIN ART_ARTICULOS ART ');
           SQL.Add(' ON (DET.ID_A = ART.ID_A) ');
           SQL.Add(' JOIN GES_DETALLES_S_UBICACIONES UBI ');
           SQL.Add(' ON (UBI.ID_DETALLES_S = DET.ID_DETALLES_S) ');
           SQL.Add(' WHERE ');
           SQL.Add(' DET.EMPRESA = ?EMPRESA AND ');
           SQL.Add(' DET.EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' DET.CANAL = ?CANAL AND ');
           SQL.Add(' DET.SERIE = ?SERIE AND ');
           SQL.Add(' DET.TIPO = ?TIPO AND ');
           SQL.Add(' DET.RIG = ?RIG AND ');
           SQL.Add(' DET.ALMACEN = ''000'' AND ');
           SQL.Add(' ART.UBICABLE = 1 AND ');
           SQL.Add(' ((UBI.ID_UBICACION = 1) OR (UBI.ID_UBICACION IS NULL)) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'ALP';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           ExecQuery;
           FreeHandle;
           Close;
           ExecQuery;
           if (not EOF) then
              ShowMessage(_('ATENCIÓN: Hay artículos sin ubicar.'));
           while not EOF do
           begin
              TFMDistribuyeArticulos.Create(Self).MuestraUbiArtic(FieldByName['EMPRESA'].AsInteger,
                 FieldByName['EJERCICIO'].AsInteger, FieldByName['CANAL'].AsInteger,
                 FieldByName['RIG'].AsInteger, FieldByName['LINEA'].AsInteger,
                 FieldByName['ID_DETALLES_S'].AsInteger, FieldByName['ID_A'].AsInteger,
                 FieldByName['SERIE'].AsString, FieldByName['TIPO'].AsString,
                 FieldByName['UNIDADES'].AsFloat);
              Next;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMAlbaranesAProveedor.ObtieneRIC: integer;
var
  Q : THYFIBQuery;
begin
  if (QMCabeceraID_E.AsString > '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIC FROM GES_CABECERAS_E_ALB WHERE ID_E = ' + QMCabeceraID_E.AsString;
        ExecQuery;
        Result := FieldByName['RIC'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end
  else
     Result := 0;
end;

procedure TDMAlbaranesAProveedor.CierraAbreDet;
begin
  Refrescar(QMDetalle, 'ID_DETALLES_E', QMDetalle.FieldByName('ID_DETALLES_E').AsInteger, False, True);
end;

procedure TDMAlbaranesAProveedor.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranesAProveedor.RellenaDatosOldLinea;
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMAlbaranesAProveedor.RellenaDatosLinea(Linea: TStrings);

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

procedure TDMAlbaranesAProveedor.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMAlbaranesAProveedor.DuplicarLinea;
var
  old_KriConf469 : boolean;
begin
  old_KriConf469 := KriConf469;
  try
     KriConf469 := True;

     // Guardo los datos con lo que hay en la linea si KriConf469 estaba deshabilidatdo
     RellenaDatosOldLinea;

     with QMDetalle do
     begin
        Insert;
        Post;
        Last;
     end;
  finally
     KriConf469 := old_KriConf469;
  end;
end;

procedure TDMAlbaranesAProveedor.QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
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

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
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

procedure TDMAlbaranesAProveedor.DameSqlImpresionEtiquetas(SQL: TStrings);
begin
  /// Genera SQL para rellenar ART_IMPRESION_CB_DETALLE con los articulos filtrados.
  /// Contiene el parametro NUMERO que sera utilizado dentro de UDMImprimircodBarras.

  with SQL do
  begin
     Clear;
     Add(' INSERT INTO ART_IMPRESION_CB_DETALLE ');
     Add(' (EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO, ID_DETALLE_DOC, COD_BARRAS, TIPO, NUM_COPIAS, FECHA, ALFA_6, ID_LOTE, UNIDADES) ');
     Add(' SELECT ' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', ');
     Add(' :NUMERO, 0, DET.ARTICULO, DET.ID_DETALLES_E, ');
     Add(' COALESCE((SELECT FIRST 1 BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = DET.EMPRESA AND ARTICULO = DET.ARTICULO ORDER BY TIPO DESC), ''''),');
     Add(' COALESCE((SELECT FIRST 1 TIPO FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = DET.EMPRESA AND ARTICULO = DET.ARTICULO ORDER BY TIPO DESC), 0), ');
     // Obtenemos la cantidad de etiquetas a imprimir
     if (Param_ALBETIQ001 <> 0) then
        Add(format(' %d, ', [Param_ALBETIQ001]))
     else
        Add(' COALESCE(LOT.CANTIDAD, DET.UNIDADES), ');
     Add(' CAB.FECHA, A.ALFA_6, COALESCE(LOT.ID_LOTE, 0), ');
     if (Param_ALBETIQ002) then
        Add(' DET.BULTOS ')
     else
        Add(' DET.UNIDADES ');
     Add(' FROM GES_DETALLES_E DET ');
     Add(' LEFT JOIN GES_DETALLES_E_LOTES LOT ON (DET.ID_DETALLES_E = LOT.ID_DETALLES_E) ');
     Add(' JOIN GES_CABECERAS_E CAB ON (CAB.ID_E = DET.ID_E) ');
     Add(' JOIN ART_ARTICULOS A ON (A.EMPRESA = DET.EMPRESA AND A.ARTICULO = DET.ARTICULO) ');
     Add(' WHERE DET.ID_E = ' + IntToStr(QMCabeceraID_E.AsInteger));
     Add(' ORDER BY DET.LINEA, LOT.SUBLINEA ');
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);
end;

function TDMAlbaranesAProveedor.Habilitar_but_cambia_iva: boolean;
begin
  if ((QMDetalle.RecordCount = 0) or (QMCabeceraESTADO.AsInteger <> 0) or
     (xProveedor.Active and (xProveedor.FieldByName('MODO_IVA').AsInteger = 0))) then
     Result := False
  else
     Result := True;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
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

procedure TDMAlbaranesAProveedor.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
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

procedure TDMAlbaranesAProveedor.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
var
  IdLote : integer;
  Composicion : string;
begin
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

  if (IdLote <> 0) then
     QMDetalleID_LOTE.AsInteger := IdLote;
  if (IdUbicacion <> 0) then // Si es 0 se deja en blanco y el trigger se encgargara
     QMDetalleID_UBICACION.AsInteger := IdUbicacion;

  QMDetalle.Post;
end;

procedure TDMAlbaranesAProveedor.AbreDocumento;
begin
  CambiaEstadoDocumento(0);
end;

procedure TDMAlbaranesAProveedor.CierraDocumento;
begin
  CambiaEstadoDocumento(5);
end;

procedure TDMAlbaranesAProveedor.CambiaEstadoDocumento(Estado: integer);
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

procedure TDMAlbaranesAProveedor.QMDetalleTIPO_IVAChange(Sender: TField);
begin
  QMDetalleP_IVA.AsFloat := DMMain.DamePorcentajeIva(REntorno.Pais, QMDetalleTIPO_IVA.AsInteger);
end;

procedure TDMAlbaranesAProveedor.FiltraDocumento(Serie, Filtro: string);
begin
  DMMain.LogIni('DMAlbaranesAProveedor.FiltraDocumento');
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

procedure TDMAlbaranesAProveedor.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProveedor.Close;
  xDirecciones.Close;
  QMDetalle.Close;
  xAlmacenes.Close;
  xFormasPago.Close;
  QMNif.Close;
  xProyectos.Close;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  with xDirecciones do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAlbaranesAProveedor.QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_TOTAL.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_REAL.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetallePESO_REALChange(Sender: TField);
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

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_EXT.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADES_PENDIENTESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_PENDIENTES.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_SEC.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADES_UBGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_UB.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetalleUNIDADES_LOTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_LOT.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetalleCANT_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleCANT_LOTE.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.QMDetalleTOTAL_UNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleTOTAL_UNIDADES_EXT.AsFloat]);
end;

procedure TDMAlbaranesAProveedor.xProveedorAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMAlbaranesAProveedor.xProveedorBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMAlbaranesAProveedor.xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
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

procedure TDMAlbaranesAProveedor.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMAlbaranesAProveedor.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMAlbaranesAProveedor.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMAlbaranesAProveedor.ImportaXML(Archivo: string; Log: TStrings);
var
  RutEmisor, RutReceptor, TituloProveedor, Folio, TipoDTE, RznSoc, DirOrigen, TpoDocRef, FolioRef, RazonRef : string;
  TerceroEmisor, ProveedorEmisor : integer;
  MntNeto, MntTotal, MontoIVA, TasaIVA, MntExe, MontoItem, MontoImp : double;
  Documento : TXMLDocument;
  i, IdDocumento, IdDocumentoDetalle, MntBruto : integer;
  Nodo, NodoDetalle, NodoPadre : IXMLNode;
  Seguir : boolean;
  s, NmbItem, DscItem, TpoMov, TpoValor, FmaPago, CmnaOrigen : string;
  QtyItem, PrcItem, DescuentoPct, DescuentoMonto, ValorDR, ValorDRPctDesc, ValorDRPctRec : double;
  FchEmis, FchVenc, FchRef : TDateTime;
  PorcentajeIVA : double;
  TipoIVA, IndExe, NroLinRef, CodRef : integer;
  Pais, Provincia, Poblacion, Region : string;
begin
  //IndExe := -1;
  Seguir := True;
  ProveedorEmisor := 0;
  MntNeto := 0;
  MntTotal := 0;
  //MontoIVA := 0;
  //QtyItem := 0;
  //PrcItem := 0;
  //DescuentoPct := 0;
  DescuentoMonto := 0;
  ValorDRPctDesc := 0;
  ValorDRPctRec := 0;
  MntBruto := 0;
  TpoMov := '';
  TpoValor := '';
  ValorDR := 0;
  FmaPago := 'CON';
  Pais := 'CHL';
  Provincia := '';
  Poblacion := '';
  Region := '';

  Documento := TXMLDocument.Create(Self);
  with Documento do
  begin
     XML.LoadFromFile(Archivo);

     DMMain.Log('Documento.Active := True');
     // Se activa para poder utilizar el componente
     Active := True;

     DMMain.Log('Documento.Encoding = utf-8');
     // Codigifacion UTF-8
     Encoding := 'utf-8';

     DMMain.Log('Documento.NodeIndentStr = #8');
     // Caracter para indentar el fichero XML
     NodeIndentStr := #8;

     DMMain.Log('Obtener nodos');
     // Verificamos RUT del emisor
     NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'Caratula', 'RutEmisor']);
     if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RutEmisor')) then
        RutEmisor := NodoPadre.Text
     else
     begin
        Seguir := False;
        Log.Add(_('No se encontro el RUT del Emisor en el XML'));
     end;

     // Verificamos si el tercero y proveedor del emisor existe
     if Seguir then
     begin
        TerceroEmisor := DMMain.DameTerceroNIF(RutEmisor);
        if (TerceroEmisor <= 0) then
        begin
           // Si no existe el tercero lo creamos

           // Obtenemos la Razon Social del Xml
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor', 'RznSoc']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RznSoc') and (NodoPadre.Text > '')) then
              RznSoc := NodoPadre.Text
           else
           begin
              Seguir := False;
              Log.Add(_('Imposible crear el tercero, no se encontro el nombre de la Razon social'));
           end;

           if Seguir then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'EXECUTE PROCEDURE INSERTA_TERCERO(0, :PAIS_TERCERO, :NIF, :NOMBRE_R_SOCIAL, :FECHA_ALTA, :TELEFONO01, :TELEFONO02, :TELEFAX, :EMAIL, :WEB, :DIRECCION)';
                    Params.ByName['PAIS_TERCERO'].AsString := REntorno.Pais;
                    Params.ByName['NIF'].AsString := RutEmisor;
                    Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(RznSoc, 1, 60);
                    Params.ByName['FECHA_ALTA'].AsDateTime := Now;
                    Params.ByName['TELEFONO01'].AsString := '';
                    Params.ByName['TELEFONO02'].AsString := '';
                    Params.ByName['TELEFAX'].AsString := '';
                    Params.ByName['EMAIL'].AsString := '';
                    Params.ByName['WEB'].AsString := '';
                    Params.ByName['DIRECCION'].AsInteger := 1;
                    ExecQuery;
                    TerceroEmisor := FieldByName['TERCERO'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if (TerceroEmisor > 0) then
              begin
                 // Si tiene datos de direccion lo asignamos
                 // Obtenemos la direccion del emisor en Xml
                 DirOrigen := '';
                 NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor', 'DirOrigen']);
                 if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'DirOrigen') and (NodoPadre.Text > '')) then
                    DirOrigen := NodoPadre.Text;

                 // Obtenemos comuna desde el titulo
                 CmnaOrigen := '';
                 NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor', 'CmnaOrigen']);
                 if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'CmnaOrigen') and (NodoPadre.Text > '')) then
                    CmnaOrigen := NodoPadre.Text;

                 if (CmnaOrigen > '') then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('SELECT FIRST 1 PAIS, PROVINCIA, POBLACION, ');
                          SQL.Add('     (SELECT FIRST 1 REGION ');
                          SQL.Add('     FROM SYS_PROVINCIAS ');
                          SQL.Add('     WHERE ');
                          SQL.Add('     PAIS = P.PAIS AND ');
                          SQL.Add('     PROVINCIA = P.PROVINCIA) REGION ');
                          SQL.Add('FROM SYS_POBLACION P ');
                          SQL.Add('WHERE ');
                          SQL.Add('UPPER(P.TITULO) = UPPER(:TITULO) ');

                          Params.ByName['TITULO'].AsString := CmnaOrigen;
                          ExecQuery;
                          Pais := FieldByName['PAIS'].AsString;
                          Provincia := FieldByName['PROVINCIA'].AsString;
                          Poblacion := FieldByName['POBLACION'].AsString;
                          Region := FieldByName['REGION'].AsString;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 // Asignamos datos a la direccion
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add('UPDATE SYS_TERCEROS_DIRECCIONES ');
                       SQL.Add('SET ');
                       SQL.Add('DIR_NOMBRE = :DIR_NOMBRE, ');
                       SQL.Add('PAIS_DIRECCION = :PAIS, ');
                       SQL.Add('REGION = :REGION, ');
                       SQL.Add('PROVINCIA = :PROVINCIA, ');
                       SQL.Add('POBLACION = :POBLACION ');
                       SQL.Add('WHERE ');
                       SQL.Add('TERCERO = :TERCERO AND ');
                       SQL.Add('DIRECCION = 1  ');

                       Params.ByName['DIR_NOMBRE'].AsString := DirOrigen;
                       Params.ByName['PAIS'].AsString := Pais;
                       Params.ByName['REGION'].AsString := Region;
                       Params.ByName['PROVINCIA'].AsString := Provincia;
                       Params.ByName['POBLACION'].AsString := Poblacion;
                       Params.ByName['TERCERO'].AsInteger := TerceroEmisor;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end
              else
              begin
                 Seguir := False;
                 Log.Add(_('No se ha podido crear el tercero'));
              end;
           end;
        end;
     end;

     if Seguir then
     begin
        // Verificamos si el tercero tiene un Proveedor
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT PROVEEDOR FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA AND TERCERO = :TERCERO';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TERCERO'].AsInteger := TerceroEmisor;
              ExecQuery;
              ProveedorEmisor := FieldByName['PROVEEDOR'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (ProveedorEmisor > 0) then
        begin
           TituloProveedor := DameTituloProveedor(ProveedorEmisor, 0, 0, 0);
        end
        else
        begin
           // Si no existe el proveedor lo creamos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE INSERTA_PROVEEDOR (:EMPRESA, :CANAL, 0, :TERCERO, 0, NULL, '''' )';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TERCERO'].AsInteger := TerceroEmisor;
                 ExecQuery;
                 ProveedorEmisor := FieldByName['PROVEEDOR'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (ProveedorEmisor > 0) then
              TituloProveedor := DameTituloProveedor(ProveedorEmisor, 0, 0, 0);
        end;

        if (ProveedorEmisor <= 0) then
        begin
           Seguir := False;
           Log.Add(_('No se ha podido crear el Proveedor'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos RUT del Receptor
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'Caratula', 'RutReceptor']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'RutReceptor')) then
           RutReceptor := NodoPadre.Text
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el RUT del Receptor en el XML'));
        end;

        if Seguir and (RutReceptor <> REntorno.CifEmpresa) then
           Seguir := ConfirmaMensaje(format(_('El RUT del Receptor es diferente al de la empresa.' + #13#10 + 'RUT Receptor: %s' + #13#10 + 'Desea continuar de todos modos?'), [RutReceptor]));
     end;

     if (Seguir) then
     begin
        Log.Add(format(_('Datos de la factura a importar' + #13#10 + #13#10 + 'Tercero: %d - RUT: %s'), [TerceroEmisor, RutEmisor]));
        Log.Add(format(_('Proveedor: %d  - %s'), [ProveedorEmisor, TituloProveedor]));
     end;

     if (Seguir) then
     begin
        // Verificamos Folio
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'Folio']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'Folio')) then
        begin
           Folio := NodoPadre.Text;
           Log.Add(format(_('Folio: %s'), [Folio]));
        end
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el Folio en el XML'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos TipoDTE
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'TipoDTE']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TipoDTE')) then
        begin
           TipoDTE := NodoPadre.Text;
           Log.Add(format(_('TipoDTE: %s'), [TipoDTE]));
        end
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el TipoDTE en el XML'));
        end;
     end;

     // Verificar si el documento ya existe para ese proveedor
     if DMMain.ExisteDocumentoFolio(RutEmisor, Folio, TipoDTE) then
     begin
        Seguir := False;
        Log.Add(format(_('El documento con RUT %s y Folio %s - %s ya existe!'), [RutEmisor, TipoDTE, Folio]));
     end;

     if (Seguir) then
     begin
        // Verificamos Fecha de emisión
        Seguir := False;

        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc', 'FchEmis']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'FchEmis')) then
        begin
           s := NodoPadre.Text;
           // Convertimos a formato fecha (si es posible)
           // 1234567890
           // yyyy-mm-dd
           Seguir := TryEncodeDate(StrToIntDef(Copy(s, 1, 4), 0), StrToIntDef(Copy(s, 6, 2), 0), StrToIntDef(Copy(s, 9, 2), 0), FchEmis);
        end;

        if (Seguir) then
           Log.Add(format(_('Fecha Emision: %s (%s)'), [DateToStr(FchEmis), s]))
        else
           ShowMessage(_('No se pudo obtener la fecha de emision del XML'));
     end;

     if (Seguir) then
     begin
        // Verificamos que el monto neto
        MntNeto := 0;
        if (TipoDTE <> '34') then
        begin
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntNeto']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntNeto')) then
           begin
              MntNeto := StrToFloatDec(NodoPadre.Text, '.');
              Log.Add(format(_('Monto Neto: %s'), [FloatToStr(MntNeto)]));
           end
           else
           begin
              Seguir := False;
              Log.Add(_('No se encontro el Monto neto en el XML'));
           end;
        end;
     end;

     // Verificamos si tiene monto Exento
     NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntExe']);
     if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntExe')) then
     begin
        MntExe := StrToFloatDec(NodoPadre.Text, '.');
        Log.Add(format(_('Monto Exento: %s'), [FloatToStr(MntNeto)]));
     end;

     if ((Seguir) and (TipoDTE = '34') and (MntExe > 0)) then
        MntNeto := MntExe;

     if (Seguir) then
     begin
        // Verificamos la Tasa IVA
        TasaIVA := 0;
        if (TipoDTE <> '34') then
        begin
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'TasaIVA']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TasaIVA')) then
           begin
              TasaIVA := StrToFloatDec(NodoPadre.Text, '.');
              Log.Add(format(_('Tasa IVA: %s'), [FloatToStr(TasaIVA)]));
           end;
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos el monto de IVA
        MontoIVA := 0;
        if (TipoDTE <> '34') then
        begin
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'IVA']);
           if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'IVA')) then
           begin
              MontoIVA := StrToFloatDec(NodoPadre.Text, '.');
              Log.Add(format(_('Monto IVA: %s'), [FloatToStr(MontoIVA)]));
           end
           else
           begin
              Seguir := False;
              Log.Add(_('No se encontro el Monto IVA en el XML'));
           end;
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos importe a impuesto adicional
        MontoImp := 0;
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'ImptoReten', 'MontoImp']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MontoImp')) then
        begin
           MontoImp := StrToFloatDec(NodoPadre.Text, '.');
           Log.Add(format(_('Monto impuesto adicional: %s'), [FloatToStr(MontoImp)]));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos el monto total
        MntTotal := 0;
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales', 'MntTotal']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'MntTotal')) then
        begin
           MntTotal := StrToFloatDec(NodoPadre.Text, '.');
           Log.Add(format(_('Monto Total: %s'), [FloatToStr(MntTotal)]));
        end
        else
        begin
           Seguir := False;
           Log.Add(_('No se encontro el Monto total en el XML'));
        end;
     end;

     if (Seguir) then
     begin
        // Verificamos si tiene descuento/incremento total
        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'DscRcgGlobal', 'TpoMov']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TpoMov')) then
           TpoMov := NodoPadre.Text;

        if (TpoMov = 'D') then
           s := _('Descuento Global')
        else
        if (TpoMov = 'R') then
           s := _('Recargo Global');

        { TODO : MARCELO: Asegurar que estos son todos los valores posibles para estos campos }

        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'DscRcgGlobal', 'TpoValor']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'TpoValor')) then
           TpoValor := NodoPadre.Text;

        if (TpoValor = '%') then
           s := _('Porcentaje') + ' ' + s
        else
        if (TpoValor = '$') then
           s := _('Importe') + ' ' + s;

        { TODO : MARCELO: Asegurar que estos son todos los valores posibles para estos campos }

        NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento', 'DscRcgGlobal', 'ValorDR']);
        if (Assigned(NodoPadre) and (NodoPadre.NodeName = 'ValorDR')) then
           ValorDR := StrToFloatDec(NodoPadre.Text, '.');

        if (ValorDR <> 0) then
           Log.Add(format(s + ': %s', [FloatToStr(ValorDR)]));

        if (TpoValor = '%') then
        begin
           if (TpoMov = 'R') then
              // UPDATE a cabecera con porcentaje de financiacion
              ValorDRPctRec := ValorDR;

           if (TpoMov = 'D') then
              // UPDATE a cabecera con porcentaje de descuento
              ValorDRPctDesc := ValorDR;

           ValorDR := 0;
        end;
     end;

     if (Seguir) then
     begin
        // Creamos cabecera de factura
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE INS_CABECERA_COMPRA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :PROVEEDOR, :REFERENCIA, :ALMACEN, :FECHA_DOC, :ENTRADA, :NUM_ALBARAN_FACTURA)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := REntorno.Serie;
              Params.ByName['TIPO'].AsString := 'ALP';
              Params.ByName['PROVEEDOR'].AsInteger := ProveedorEmisor;
              Params.ByName['REFERENCIA'].AsString := 'Importacion desde XML';
              Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
              Params.ByName['FECHA_DOC'].AsDateTime := FchEmis;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['NUM_ALBARAN_FACTURA'].AsString := Folio;
              try
                 ExecQuery;
              except
                 on E: Exception do
                    Log.Add(E.Message);
              end;

              IdDocumento := FieldByName['ID_E'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (IdDocumento <= 0) then
           Seguir := False;

        if (Seguir) then
        begin
           // Creamos el detalle del documento
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes[i];
                 if Assigned(Nodo) then
                 begin
                    if (Nodo.NodeName = 'Detalle') then
                    begin
                       NodoDetalle := DameNodo(Nodo, ['NmbItem']);
                       if Assigned(NodoDetalle) then
                          NmbItem := NodoDetalle.Text
                       else
                          NmbItem := '';

                       NodoDetalle := DameNodo(Nodo, ['DscItem']);
                       if Assigned(NodoDetalle) then
                          DscItem := NodoDetalle.Text
                       else
                          DscItem := '';

                       NodoDetalle := DameNodo(Nodo, ['QtyItem']);
                       if Assigned(NodoDetalle) then
                          QtyItem := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          QtyItem := 0;

                       NodoDetalle := DameNodo(Nodo, ['PrcItem']);
                       if Assigned(NodoDetalle) then
                          PrcItem := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          PrcItem := 0;

                       NodoDetalle := DameNodo(Nodo, ['MontoItem']);
                       if Assigned(NodoDetalle) then
                          MontoItem := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          MontoItem := 0;

                       NodoDetalle := DameNodo(Nodo, ['DescuentoPct']);
                       if Assigned(NodoDetalle) then
                          DescuentoPct := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          DescuentoPct := 0;

                       NodoDetalle := DameNodo(Nodo, ['DescuentoMonto']);
                       if Assigned(NodoDetalle) then
                          DescuentoMonto := StrToFloatDec(NodoDetalle.Text, '.')
                       else
                          DescuentoMonto := 0;

                       NodoDetalle := DameNodo(Nodo, ['IndExe']);
                       if Assigned(NodoDetalle) then
                          IndExe := StrToInt(NodoDetalle.Text)
                       else
                          IndExe := -1;

                       if (IndExe = 0) then
                          TipoIVA := 1
                       else if (IndExe = 1) then
                          TipoIVA := 0;


                       if (TipoDTE = '34') then
                          TipoIVA := 0
                       else
                          TipoIVA := DameTipoIva(TasaIVA);

                       if ((TipoDTE = '33') and (IndExe = 1)) then
                          TipoIVA := 0
                       else
                          TipoIVA := DameTipoIva(TasaIVA);

                       if ((MontoItem >= 0) and (QtyItem = 0)) then
                       begin
                          QtyItem := 1;
                          PrcItem := MontoItem;
                       end;

                       if ((MontoItem >= 0) and ((DescuentoPct > 0) or (DescuentoMonto <> 0))) then
                       begin
                          NmbItem := NmbItem + ' x ' + FloatToStr(QtyItem);
                          DescuentoPct := 0;
                          QtyItem := 1;
                          PrcItem := MontoItem;
                       end;

                       if (PrcItem = 0) then
                          TipoIVA := 0;

                       // MntBruto - Indica si las líneas de detalle, descuentos y recargos se expresan en montos brutos.
                       //            (Sólo para documentos sin impuestos adicionales) .
                       if ((MntBruto = 1) and (PrcItem > 0)) then
                       begin
                          PorcentajeIVA := DMMain.DamePorcentajeIva(REntorno.Pais, TipoIVA);
                          PrcItem := PrcItem / (1 + PorcentajeIVA / 100);
                       end;

                       IdDocumentoDetalle := InsertaDetalleAlbaran(IdDocumento, NmbItem, DscItem, QtyItem, PrcItem, DescuentoPct, TipoIVA);

                       if (IdDocumentoDetalle <= 0) then
                       begin
                          Log.Add(format(_('No se ha insertado la linea %s'), [NmbItem]));
                          Seguir := False;
                       end;
                    end;
                 end;
              end;
           end;
        end;

        // Agregamos linea de descuento o recargo general si tuviese
        if (ValorDR <> 0) then
        begin
           if (MntBruto = 1) then
           begin
              //MntBruto - Indica si las líneas de detalle, descuentos y recargos se expresan en montos brutos.
              //           (Sólo para documentos sin impuestos adicionales) .
              // Obtenemos el Tipo de Iva para hacer los calculo
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;

                    SQL.Add(' SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' ARTICULO = :ARTICULO ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                    ExecQuery;
                    TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              PorcentajeIVA := DMMain.DamePorcentajeIva(REntorno.Pais, TipoIVA);
              ValorDR := ValorDR / (1 + PorcentajeIVA / 100);
           end;

           if ((TpoMov = 'D') and (TpoValor = '$')) then
           begin
              // Si el descuento es monetario agregamos una linea de detalle como descuento

              { TODO : MARCELO: Mira este comentario y revisa la documentacion sobre este tema }

              // Esto insertará una línea con el artículo '.'.
              // Esta línea tomará el IVA que tenga asignado el artículo.
              // No creo que haya que sumarle MontoIVA ya que esto es el total de IVA de la factura (No tiene ningún sentido)
              // Como mucho podría ser que el descuento fuera IVA exento, pero no lo creo ya que tiene poco sentido.

              IdDocumentoDetalle := InsertaDetalleAlbaran(IdDocumento, 'DESCUENTO', '', -1, ValorDR, 0, TipoIVA);
           end
           else
           if ((TpoMov = 'R') and (TpoValor = '$')) then
           begin
              // Si el descuento es monetario agregamos una linea de detalle como descuento
              IdDocumentoDetalle := InsertaDetalleAlbaran(IdDocumento, 'RECARGO', '', 1, ValorDR, 0, TipoIVA);
           end
           else
           begin
              Log.Add(format(_('No se ha insertado la linea %s'#13#10 + 'Tipo de Descuento/Recargo no valido (TipoMov=%s TipoValor=%s)'), [NmbItem, TpoMov, TpoValor]));
              Seguir := False;
           end;
        end;

        if (Seguir) then
        begin
           if (TipoDTE = '') then
              TipoDTE := 'DES';

           // Asignamos datos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_CABECERAS_E_ALB ');
                 SQL.Add(' SET ');
                 SQL.Add(' FOLIO = :FOLIO, ');
                 SQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E ');
                 Params.ByName['FOLIO'].AsString := Folio;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDTE;
                 Params.ByName['ID_E'].AsInteger := IdDocumento;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        if (Seguir) then
        begin
           // Asignamos datos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_CABECERAS_E ');
                 SQL.Add(' SET ');
                 SQL.Add(' SU_REFERENCIA = :SU_REFERENCIA, ');
                 SQL.Add(' DTO_CIAL = :DTO_CIAL, ');
                 SQL.Add(' POR_FINANCIACION = :POR_FINANCIACION ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E');

                 Params.ByName['POR_FINANCIACION'].AsFloat := ValorDRPctRec;
                 Params.ByName['DTO_CIAL'].AsFloat := ValorDRPctDesc;
                 Params.ByName['SU_REFERENCIA'].AsString := format(_('VENC. %s'), [DateToStr(FchVenc)]);
                 Params.ByName['ID_E'].AsInteger := IdDocumento;

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Asignamos las referencias
        if (Seguir) then
        begin
           // Creamos el detalle del documento
           NodoPadre := DameNodo(DocumentElement, ['SetDTE', 'DTE', 'Documento']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes[i];
                 if Assigned(Nodo) then
                 begin
                    if (Nodo.NodeName = 'Referencia') then
                    begin
                       NodoDetalle := DameNodo(Nodo, ['NroLinRef']);
                       if Assigned(NodoDetalle) then
                          NroLinRef := StrToInt(NodoDetalle.Text)
                       else
                          NroLinRef := 0;

                       NodoDetalle := DameNodo(Nodo, ['TpoDocRef']);
                       if Assigned(NodoDetalle) then
                          TpoDocRef := NodoDetalle.Text
                       else
                          TpoDocRef := '';

                       NodoDetalle := DameNodo(Nodo, ['FolioRef']);
                       if Assigned(NodoDetalle) then
                          FolioRef := NodoDetalle.Text
                       else
                          FolioRef := '';

                       NodoDetalle := DameNodo(Nodo, ['FchRef']);
                       if Assigned(NodoDetalle) then
                       begin
                          s := NodoDetalle.Text;
                          Seguir := TryEncodeDate(StrToIntDef(Copy(s, 1, 4), 0), StrToIntDef(Copy(s, 6, 2), 0), StrToIntDef(Copy(s, 9, 2), 0), FchRef);
                       end;

                       NodoDetalle := DameNodo(Nodo, ['CodRef']);
                       if Assigned(NodoDetalle) then
                          CodRef := StrToInt(NodoDetalle.Text)
                       else
                          CodRef := 0;

                       NodoDetalle := DameNodo(Nodo, ['RazonRef']);
                       if Assigned(NodoDetalle) then
                          RazonRef := NodoDetalle.Text
                       else
                          RazonRef := '';

                       // Insertamos la referencia
                       if ((Seguir) and (NroLinRef > 0)) then
                       begin
                          // Asignamos datos
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO SII_DTE_REFERENCIA_COMPRAS ( ');
                                SQL.Add(' ID_E, NROLINREF, TPODOCREF, FOLIOREF, FCHREF, CODREF, RAZONREF) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :ID_E, :NROLINREF, :TPODOCREF, :FOLIOREF, :FCHREF, :CODREF, :RAZONREF) ');
                                Params.ByName['ID_E'].AsInteger := IdDocumento;
                                Params.ByName['NROLINREF'].AsInteger := NroLinRef;
                                Params.ByName['TPODOCREF'].AsString := TpoDocRef;
                                Params.ByName['FOLIOREF'].AsString := FolioRef;
                                Params.ByName['FCHREF'].AsDateTime := FchRef;
                                Params.ByName['CODREF'].AsInteger := CodRef;
                                Params.ByName['RAZONREF'].AsString := RazonRef;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;
                 end;
              end;
           end;
        end;

        // Posicionamos sobre la Guia de despacho recien creada
        if (Seguir) then

           Refrescar(QMCabecera, 'ID_E', IdDocumento, False, False);


        if (Seguir) then
        begin
           if (xInfoActualizadaS_BASES.AsFloat <> MntNeto) then
           begin
              Log.Add(format(_('Existe una diferencia en el monto neto total de la Guia %s <> %s'), [FloatToStr(xInfoActualizadaS_BASES.AsFloat), FloatToStr(MntNeto)]));
              Seguir := False;
           end
           else if (xInfoActualizadaTOTAL_ALBARAN.AsFloat <> MntTotal) then
           begin
              Log.Add(format(_('Existe una diferencia en el monto total de la Guia %s <> %s'), [FloatToStr(xInfoActualizadaTOTAL_ALBARAN.AsFloat), FloatToStr(MntTotal)]));
              Seguir := False;
           end;
        end;

        if (Seguir) then
           Log.Add(_('La factura se ha creado con exito.'))
        else
           Log.Add(_('No se ha podido crear la factura o se ha creado con errores.'));
     end;
  end;
  Log.Add('==================================================================');
end;

function TDMAlbaranesAProveedor.DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
var
  i : integer;
begin
  Result := nil;
  i := 0;
  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  Result := Nodo;
end;

function TDMAlbaranesAProveedor.InsertaDetalleAlbaran(IdDocumento: integer; Titulo, Notas: string; Unidades, Precio, Descuento: double; TipoIva: integer): integer;
begin
  // InsertamosDetalle
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        SQL.Text := 'EXECUTE PROCEDURE WEB_INS_DETALLE_COMPRA_3(:ID_E, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO, :TIPO_UNIDAD_LOGISTICA, :UNIDADES_LOGISTICAS, :TIPO_IVA)';
        Params.ByName['ID_E'].AsInteger := IdDocumento;
        Params.ByName['ID_A'].AsInteger := DameIDArticulo(REntorno.ArtTextoLibre, REntorno.Empresa);
        Params.ByName['TITULO'].AsString := Titulo;
        Params.ByName['UNIDADES'].AsFloat := Unidades;
        Params.ByName['NOTAS'].AsString := Notas;
        Params.ByName['PRECIO'].AsFloat := Precio;
        Params.ByName['DESCUENTO'].AsFloat := Descuento;
        Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := 'GRNL';
        Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := Unidades;
        Params.ByName['TIPO_IVA'].AsInteger := TipoIva;

        ExecQuery;
        Result := FieldByName['ID_DETALLES_E'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.InsertaDetalleAReparacion(IdReparacion: integer);
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           // Obtenemos datos de reparacion
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO REPAR_DET_REPARACIONES ');
                 SQL.Add(' (EMPRESA, EJERCICIO, CANAL, IDCABREPARAR, ARTICULO, TITULO_ART, UNIDADES, PRECIO, PRECIO_VENTA, TIPO_IVA, ID_DETALLES_E_ORIGEN) ');
                 SQL.Add(' VALUES ');
                 SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :IDCABREPARAR, :ARTICULO, :TITULO_ART, :UNIDADES, :PRECIO, :PRECIO_VENTA, :TIPO_IVA, :ID_DETALLES_E_ORIGEN) ');
                 Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                 Params.ByName['IDCABREPARAR'].AsInteger := IdReparacion;
                 Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                 Params.ByName['TITULO_ART'].AsString := QMDetalleTITULO.AsString;
                 Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;

                 { TODO : Parametrizar si otro cliente utiliza esta opción}
                 Params.ByName['PRECIO'].AsFloat := 0;
                 Params.ByName['PRECIO_VENTA'].AsFloat := QMDetalleP_COSTE.AsFloat; // VCVAuto quiere el precio de coste sin descuentos como precio de venta.

                 Params.ByName['TIPO_IVA'].AsInteger := QMDetalleTIPO_IVA.AsInteger;
                 Params.ByName['ID_DETALLES_E_ORIGEN'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
           Next;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAlbaranesAProveedor.QMCabeceraFECHAChange(Sender: TField);
begin
  if (QMCabecera.State = dsInsert) then
     QMCabeceraFECHA_ALBARAN.AsDateTime := QMCabeceraFECHA.AsDateTime;
end;

procedure TDMAlbaranesAProveedor.QMDetalleCalcFields(DataSet: TDataSet);
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
  end
  else
  begin
     QMDetalleSTOCK_ALM.AsFloat := 0;
     QMDetalleSTOCK_ALM2.AsFloat := 0;
     QMDetalleSTOCK_ALM3.AsFloat := 0;
  end;
end;

procedure TDMAlbaranesAProveedor.ReiniciaStock(Articulo: string);
var
  i : integer;
begin
  // DMMain.Log('TDMAlbaranesAProveedor.ReiniciaStock');
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
  end
  else
  begin
     StockAlm.Clear;
     StockAlm2.Clear;
     StockAlm3.Clear;
  end;
end;

end.
