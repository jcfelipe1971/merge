unit UDMPropuestas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TDMPropuestas = class(TDataModule)
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
     TLocal: THYTransaction;
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
     DSxMonedas: TDataSource;
     xMonedas: TFIBDataSetRO;
     SPCambiaMoneda: THYFIBQuery;
     xMonedasTITULO: TFIBStringField;
     QMCabeceraTOTAL_CANAL: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraID_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosCONTROLA_MEDIDAS: TIntegerField;
     xArticulosSERIALIZADO: TIntegerField;
     xArticulosLOTES: TIntegerField;
     xArticulosMULTIPLO_1: TFloatField;
     xArticulosMULTIPLO_2: TFloatField;
     xArticulosMULTIPLO_3: TFloatField;
     xArticulosMULTIPLO_4: TFloatField;
     xArticulosFACTOR_ESCALA: TFloatField;
     xArticulosUD_MINIMO_COMPRA: TFloatField;
     xArticulosUD_MINIMO_VENTA: TFloatField;
     xArticulosUNIDADES: TFIBStringField;
     xArticulosID_A: TIntegerField;
     QMDetalleORDEN: TIntegerField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     SPTraspasarA: THYFIBQuery;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xArticulosPVP_POR_UD_SECUNDARIA: TIntegerField;
     xArticulosDEFECTO_UD_SECUNDARIA: TFloatField;
     QMCabeceraPROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetallePROYECTO: TIntegerField;
     TUpdate: THYTransaction;
     QMCabeceraFECHA_PRE_CAB: TDateTimeField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMCabeceraPLAZO_ENTREGA: TIntegerField;
     QMDetallePLAZO_ENTREGA_DET: TIntegerField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMCabeceraIMPORTE_MINIMO_PORTE: TFloatField;
     QMCabeceraIMPORTE_ICE_TOTAL: TFloatField;
     QMCabeceraS_CUOTA_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraS_CUOTA_IMP_ADICIONAL_CANAL: TFloatField;
     xInfoActualizadaIMPORTE_ICE_TOTAL: TFloatField;
     xInfoActualizadaS_CUOTA_IMPUESTO_ADICIONAL: TFloatField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMCabeceraDIR_ENTREGA_MANUAL: TMemoField;
     QMCabeceraDIRECCION: TIntegerField;
     DSxDirecciones: TDataSource;
     xDirecciones: TFIBDataSetRO;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     xAvisos: TFIBDataSetRO;
     QMCabeceraACEPTA_ENTREGA_PARCIAL: TSmallintField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMCabeceraOBSERVACIONES: TFIBStringField;
     xInfoActualizadaSUM_UNIDADES: TFloatField;
     xInfoActualizadaSUM_UNIDADES_SEC: TFloatField;
     xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField;
     xInfoActualizadaSUM_PESO: TFloatField;
     xInfoActualizadaCOUNT_LINEA: TIntegerField;
     procedure DMDocsPropProvCreate(Sender: TObject);
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
     procedure QMCabeceraMONEDAChange(Sender: TField);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMCabeceraFECHAChange(Sender: TField);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraCAMBIO_FIJOChange(Sender: TField);
     procedure QMCabeceraPROYECTOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraDIRECCIONChange(Sender: TField);
     procedure QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetallePESO_REALChange(Sender: TField);
     procedure QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xProveedorAfterOpen(DataSet: TDataSet);
     procedure xProveedorBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     fecha_old: TDateTime;
     SQLFind, SQLBase: string;
     ComisionAgente, unidades_old: double;
     RecalculaPrecios, Editando: boolean;
     FlagModificandoUnidades: boolean;
     Param_SYSCONF005: integer;
     Param_DOCREFE005: boolean;
     Param_VENULKG001: boolean;
     Param_COMARTU001: boolean;
     Param_COMPREC001: boolean;
     KriConf466: boolean;
     OldLinea: TStrings;
     ModificandoCambioFijo: boolean;
     IgnorarMensajes: boolean;
     function Traspasado: boolean;
     procedure CambiaMonedaFecha;
     procedure AbreDocumentos(id_e_d: integer; tipo_destino: string);
     procedure RellenaDatosLinea(Linea: TStrings);
     procedure CambiaEstadoDocumento(Estado: integer);
  public
     LocalMascaraN, LocalMascaraL: string;
     medida1, medida2, medida3, medida4, gprecio: double;
     // Recuperación de updates en u.ext
     gunidades: integer; // Idem
     Articulo: string;
     MonedaOld: string;
     (*
     procedure Inserta;
     *)
     procedure Duplica;
     procedure CambiaSerie(SerieVar: string);
     function BusquedaCompleja: integer;
     procedure ActualizaCondicionesProv(CrearCondicionModelo: boolean);
     procedure CambiaTarifa(Tarifa: string);
     procedure CambiaUnidadesExt(Articulo: TField; modo: boolean);
     procedure BorraLineaExt;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
     procedure PreparaNotasDetalle;
     procedure RefrescaTabla;
     procedure Historico;
     procedure CambiaPreciosTarifa;
     procedure AnulaDocumento;
     procedure CambiaMonedaDetalle;
     procedure MascarasMoneda;
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     function HayDocumentos: boolean;
     function EstadoDocumento: integer;
     function HayDetalle: boolean;
     procedure ControlaRestriccion;
     procedure OrdenarLineas;
     procedure TraspasarA(Tipo_Destino: string);
     procedure RefrescaCabecera(Accion: integer);
     procedure BuscaArticulo(Articulo: string);
     function Inhabilitar: boolean;
     procedure InfoActualiza;
     procedure BusquedaArticulo(Descripcion: string);
     procedure AbrirCerrar(Estado: integer);
     procedure RellenaDatosOldLinea;
     procedure DuplicarLinea;
     procedure FiltraProcesoAutomatico(Serie: string; Contador: integer);
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
     procedure AbreDocumento;
     procedure CierraDocumento;
     procedure FiltraDocumento(Serie, Filtro: string);
     procedure RecalcularPrecios;
  end;

var
  DMPropuestas : TDMPropuestas;
  Serie : string;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFMPropuestas, URecursos,
  UFBusca, UFMUnidadesExtGesC, UFInfoHistorico, UFMPreciosArticuloDoc, UFParada,
  UFMPedidosAProveedor, UFMPropuestasConfirm, UFOrdenaLineas, UFMain, Math, UParam;

{$R *.DFM}

procedure TDMPropuestas.DMDocsPropProvCreate(Sender: TObject);
//var
//i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  OldLinea := TStringList.Create;
  Kriconf466 := (DMMain.EstadoKri(466) = 1);
  Param_SYSCONF005 := StrToIntDef(LeeParametro('SYSCONF005'), 0);
  Param_DOCREFE005 := (LeeParametro('DOCREFE005') = 'S');

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FlagModificandoUnidades := False;
  ModificandoCambioFijo := False;
  IgnorarMensajes := False;

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
  QMCabeceraFECHA_PRE_CAB.DisplayFormat := ShortDateFormat + ' hh:nn';

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

  //Se inicializan las variables globales
  ComisionAgente := 0;
  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_OFP ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''OFP'' ');
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

  if (DMMain.EstadoKri(47) = 1) then
  begin
     QMDetalleUNIDADES_LOGISTICAS.DisplayLabel := _('Bultos');
     QMDetalleUNIDADES.DisplayLabel := _('Kilos');
  end;

  // Asigno nombre a campos ALFA
  QMDetalleALFA_1.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [1]));
  QMDetalleALFA_2.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [2]));
  QMDetalleALFA_3.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [3]));
  QMDetalleALFA_4.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [4]));
  QMDetalleALFA_5.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [5]));
  QMDetalleALFA_6.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [6]));
  QMDetalleALFA_7.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [7]));
  QMDetalleALFA_8.DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [8]));
end;

procedure TDMPropuestas.Graba(DataSet: TDataSet);
begin
  //TFIBTableSet(DataSet).Transaction.CommitRetaining;
  //DMMain.Graba;
  DataSet.Refresh;
  InfoActualiza;

  RellenaDatosLinea(OldLinea);
end;

procedure TDMPropuestas.QMDetalleNewRecord(DataSet: TDataSet);
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
  QMDetalleUNIDADES_SEC.AsInteger := 0;
  Unidades_Old := 0;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  QMDetallePLAZO_ENTREGA_DET.AsInteger := 0;
  QMDetalleTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  // Obtenemos el numero de linea más alto
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf466) then
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

procedure TDMPropuestas.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'OFP';
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraALMACEN.AsString := DMMain.DameAlmacenDocumento('OFP', Serie);
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCCPRY001', Serie), 0);
  QMCabeceraACEPTA_ENTREGA_PARCIAL.AsInteger := BoolToInt(LeeParametro('DOCCAEP001', Serie) = 'S');

  Editando := False;
end;

procedure TDMPropuestas.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  if Param_DOCREFE005 and (Trim(QMCabeceraSU_REFERENCIA.AsString) <> '') then
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
              SelectSQL.Add(' JOIN GES_CABECERAS_E_OFP D ON C.ID_E = D.ID_E ');
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
  if (Editando) then
     if (QMCabeceraMONEDA.AsString <> REntorno.MonedaEmpresa) then
        if (fecha_old <> QMCabeceraFECHA.AsDateTime) then
           if (Application.MessageBox(PChar(string(_('ATENCION! Se recalcularán los precios en función del cambio de moneda.'))),
              PChar(string(_('Confirmación'))), MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
              RecalculaPrecios := True
           else
              QMCabeceraFECHA.AsDateTime := Fecha_Old;
end;

procedure TDMPropuestas.QMDetalleARTICULOChange(Sender: TField);
var
  Baja : boolean;
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  if (not DMMain.ArticuloBloqueado(Sender.AsString, 'OFP')) then
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

procedure TDMPropuestas.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_E.AsInteger > 0) then
        Open;
  end;
end;

procedure TDMPropuestas.QMDetalleBeforePost(DataSet: TDataSet);
var
  Division : double;
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');

  QMDetalleENTRADA.AsInteger := REntorno.Entrada;

  // Calculo el CRC de las notas para poder agrupar
  QMDetalleCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS));
  QMDetalleCRC_NOTAS2.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS2));

  if (not IgnorarMensajes) then
  begin
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
end;

procedure TDMPropuestas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Open;
  xDirecciones.Open;
  QMDetalle.Open;
  xAlmacenes.Open;
  xFormasPago.Open;
  xMonedas.Open;
  xProyectos.Open;

  InfoActualiza;
end;

procedure TDMPropuestas.QMCabeceraALMACENChange(Sender: TField);
begin
  EntornoDoc.Almacen := Sender.AsString;
  with xAlmacenes do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPropuestas.AntesDeEditar(DataSet: TDataSet);
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

procedure TDMPropuestas.QMCabeceraPROVEEDORChange(Sender: TField);
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
        QMCabeceraMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMCabeceraFECHA_PRE_CAB.AsDateTime := (FieldByName('DIAS_ENTREGA').AsInteger) + Trunc(QMCabeceraFECHA.AsDateTime);
        QMCabeceraTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMCabeceraDIRECCION.AsInteger := DMMain.DameMinDireccion(QMCabeceraTERCERO.AsInteger);
        QMCabeceraIDIOMA.AsString := FieldByName('IDIOMA').AsString;
     end;
  end
  else
     QMCabecera.Cancel;

  DMMain.MuestraAviso('PRO', xProveedor.FieldByName('ID_PROVEEDOR').AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMPropuestas.Duplica;
var
  IdDocDestino : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOC_E_DUPLICA ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ''OFP'', ?RIG, ');
        SQL.Add(' ?ENTRADA, ?D_EJERCICIO, ?FECHA, ?ID_E, ?RELACIONA) ');
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

function TDMPropuestas.BusquedaCompleja: integer;
begin
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
end;

procedure TDMPropuestas.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  {
  if (DMMain.TContador.InTransaction) then
    DMMain.TContador.Commit;
}
  if (MonedaOld <> QMCabeceraMONEDA.AsString) then
     CambiaMonedaDetalle;
  if RecalculaPrecios then
     CambiaMonedaFecha;
end;

procedure TDMPropuestas.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
     // DMMain.TContador.Rollback;
  end;
end;

procedure TDMPropuestas.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;

     if (LeeParametro('OFPULTD001', Serie) = 'S') then
        Last;
  end;

  Param_VENULKG001 := (LeeParametro('VENULKG001', Serie) = 'S');
  Param_COMARTU001 := (LeeParametro('COMARTU001', Serie) = 'S');
  Param_COMPREC001 := (LeeParametro('COMPREC001', Serie) = 'S');
end;

procedure TDMPropuestas.ActualizaCondicionesProv(CrearCondicionModelo: boolean);
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

procedure TDMPropuestas.CambiaTarifa(Tarifa: string);
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

(*
procedure TDMPropuestas.Inserta;
begin
  FMPropuestas.DBGFDetalle.SetFocus;
  QMDetalle.Append;
  QMDetalleARTICULO.AsString := xArticulosTarifa.FieldByName('ARTICULO').AsString;
end;
*)

procedure TDMPropuestas.xArticulosTarifaAfterOpen(DataSet: TDataSet);
begin
  xtarifasProveedor.Open;
end;

procedure TDMPropuestas.CambiaUnidadesExt(Articulo: TField; Modo: boolean);
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

procedure TDMPropuestas.CambiaPreciosTarifa;
var
  bueno : boolean;
begin
  DevuelvePrecio(0, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString, bueno,
     QMCabeceraMONEDA.AsString, QMCabeceraFECHA.AsDateTime,
     QMDetalleID_A.AsInteger);
end;

procedure TDMPropuestas.QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Open;
  end;
  if xFormasPago.FieldByName('HEREDA_FINANCIACION').AsInteger = 1 then
     QMCabeceraPOR_FINANCIACION.AsFloat := xProveedor.FieldByName('POR_FINANCIACION').AsFloat;
end;

procedure TDMPropuestas.BorraLineaExt;
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

procedure TDMPropuestas.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
end;

procedure TDMPropuestas.DatosHerencia(var rig, ejercicio: integer; var tipo, num_factura, titulo, serie: string);
begin
  Rig := QMCabeceraRIG.AsInteger;
  Tipo := QMCabeceraTIPO.AsString;
  Num_Factura := '';
  Serie := QMCabeceraSERIE.AsString;
  Titulo := xProveedor.FieldByName('TITULO').AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
end;

procedure TDMPropuestas.PreparaNotasDetalle;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

function TDMPropuestas.Traspasado: boolean;
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
procedure TDMPropuestas.RefrescaTabla;
begin
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     QMCabecera.Refresh;
     QMDetalle.EnableControls;
  end;
end;

// Histórico de Stocks
procedure TDMPropuestas.Historico;
begin
  if QMDetalleArticulo.AsString <> '' then
  begin
     FInfoHistorico := TFInfoHistorico.Create(Self);
     FInfoHistorico.Mostrar(QMCabeceraSERIE.AsString,
        QMDetalleARTICULO.AsString, QMCabeceraPROVEEDOR.AsInteger, 1);
     FInfoHistorico.Free;
  end;
end;

procedure TDMPropuestas.AnulaDocumento;
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

procedure TDMPropuestas.MascarasMoneda;
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

procedure TDMPropuestas.CambiaMonedaDetalle;
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

procedure TDMPropuestas.QMCabeceraMONEDAChange(Sender: TField);
begin
  xMonedas.Close;
  xMonedas.Open;
end;

procedure TDMPropuestas.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1),
     QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMPropuestas.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMMain.LogIni('DMPropuestas.FiltraCabecera');
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
     FMPropuestas.EFSerie.Text := Serie;
  end;
  DMMain.LogFin('');
end;

function TDMPropuestas.HayDocumentos: boolean;
begin
  Result := QMCabecera.Active and (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMPropuestas.EstadoDocumento: integer;
begin
  Result := -1;
  if (QMCabecera.Active) then
     Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

function TDMPropuestas.HayDetalle: boolean;
begin
  //Result := (QMDetalle.FieldByName('LINEA').AsInteger <> 0);
  Result := QMDetalle.Active and (QMDetalle.RecordCount > 0);
end;

procedure TDMPropuestas.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  MonedaOld := QMCabeceraMONEDA.AsString;
end;

procedure TDMPropuestas.QMCabeceraFECHAChange(Sender: TField);
begin
  with xProveedor do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPropuestas.QMDetalleUNIDADESChange(Sender: TField);
begin
  //  CambiaUnidadesExt (QMDetalleARTICULO, false);
  if (xArticulos.FieldByName('CONTROLA_MEDIDAS').AsInteger = 0) then
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

  //se calcula las unidades_sec en funcion del pvp de unidades_sec en la pestaña de articulos
  QMDetalleUNIDADES_SEC.AsFloat := xArticulos.FieldByName('DEFECTO_UD_SECUNDARIA').AsFloat * QMDetalleUNIDADES.AsFloat;

  {Unidad Logistica}
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

procedure TDMPropuestas.ControlaRestriccion;
begin
  ControlaBorrado(QMCabeceraID_E.AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMPropuestas.CambiaMonedaFecha;
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

procedure TDMPropuestas.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  Fecha_old := QMCabeceraFECHA.AsDateTime;
end;

procedure TDMPropuestas.OrdenarLineas;
begin
  QMDetalle.DisableControls;
  OrdenaLineas('OFP', QMCabeceraID_E.AsInteger, Self);
  QMDetalle.Close;
  QMDetalle.Open;
  QMDetalle.EnableControls;
end;

procedure TDMPropuestas.TraspasarA(Tipo_Destino: string);
var
  id_e_d : integer;
begin
  with SPTraspasarA do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['D_TIPO'].AsString := Tipo_Destino;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['D_SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
     ExecQuery;
     id_e_d := FieldByName['ID_E_D'].AsInteger;
     FreeHandle;
     if REntorno.Ejercicio >= QMCabeceraEJERCICIO.AsInteger then
     begin
        QMCabecera.Refresh;
        AbreDocumentos(id_e_d, Tipo_Destino);
     end
     else
     begin
        QMCabecera.Close;
        QMCabecera.Open;
     end;
  end;
end;

procedure TDMPropuestas.AbreDocumentos(id_e_d: integer; tipo_destino: string);
begin
  if (tipo_destino = 'OCP') then
     TraspasoPropConfProv(id_e_d);

  if (tipo_destino = 'PEP') then
     TraspasoPedidoProv(id_e_d);
end;

procedure TDMPropuestas.RefrescaCabecera(Accion: integer);
var
  Marca : TBookmark;
begin
  case Accion of
     1: QMCabecera.Refresh;
     2:
     begin
        Marca := QMCabecera.GetBookmark;
        try
           // QMCabecera.Transaction.CommitRetaining;
           QMCabecera.Close;
           QMCabecera.Open;
           QMCabecera.GotoBookmark(Marca);
        finally
           QMCabecera.FreeBookmark(Marca);
        end;
     end;
  end;
end;

procedure TDMPropuestas.QMCabeceraCAMBIO_FIJOChange(Sender: TField);
begin
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
end;

procedure TDMPropuestas.QMCabeceraPROYECTOChange(Sender: TField);
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

procedure TDMPropuestas.BuscaArticulo(Articulo: string);
begin
  DMMain.LogIni('DMPropuestas.BuscaArticulo');
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

function TDMPropuestas.Inhabilitar: boolean;
begin
  Result := ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit));
end;

procedure TDMPropuestas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  OldLinea.Free;
end;

procedure TDMPropuestas.BusquedaArticulo(Descripcion: string);
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

procedure TDMPropuestas.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMPropuestas.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMPropuestas.RellenaDatosOldLinea;
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMPropuestas.RellenaDatosLinea(Linea: TStrings);

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

procedure TDMPropuestas.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMPropuestas.DuplicarLinea;
var
  old_KriConf466 : boolean;
  // Q : THYFIBQuery;
  // IdDetallesE, i, NuevaLinea : integer;
begin
  old_KriConf466 := KriConf466;
  try
     KriConf466 := True;
     // IdDetallesE := QMDetalleID_DETALLES_E.AsInteger;

     // Guardo los datos con lo que hay en la linea si KriConf466 estaba deshabilidatdo
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
     KriConf466 := old_KriConf466;
  end;
end;

procedure TDMPropuestas.QMDetalleTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
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

procedure TDMPropuestas.QMDetalleUNIDADES_LOGISTICASChange(Sender: TField);
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

procedure TDMPropuestas.FiltraProcesoAutomatico(Serie: string; Contador: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_OFP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''OFP'' AND ');
     SelectSQL.Add(' PROCESO_AUTO = ' + IntToStr(Contador));
     SelectSQL.Add(' ORDER BY RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
  end;
end;

procedure TDMPropuestas.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);
end;

procedure TDMPropuestas.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
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

procedure TDMPropuestas.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
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

procedure TDMPropuestas.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste, Descuento1, Descuento2, Descuento3: double; FechaPrevista: TDateTime);
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

procedure TDMPropuestas.AbrirCerrar(Estado: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_CABECERAS_OFP SET ESTADO = ?ESTADO WHERE ID_E = ?ID_E';
        if (Estado = 0) then
           Params.ByName['ESTADO'].AsInteger := 5
        else
           Params.ByName['ESTADO'].AsInteger := 0;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPropuestas.CambiaEstadoDocumento(Estado: integer);
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

procedure TDMPropuestas.AbreDocumento;
begin
  CambiaEstadoDocumento(0);
end;

procedure TDMPropuestas.CierraDocumento;
begin
  CambiaEstadoDocumento(5);
end;

procedure TDMPropuestas.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES.AsFloat]);
end;

procedure TDMPropuestas.FiltraDocumento(Serie, Filtro: string);
begin
  DMMain.LogIni('DMPropuestas.FiltraDocumento');
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

procedure TDMPropuestas.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProveedor.Close;
  xDirecciones.Close;
  QMDetalle.Close;
  xAlmacenes.Close;
  xFormasPago.Close;
  xMonedas.Close;
  xProyectos.Close;
end;

procedure TDMPropuestas.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  with xDirecciones do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPropuestas.QMDetallePESOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO.AsFloat]);
end;

procedure TDMPropuestas.QMDetallePESO_TOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_TOTAL.AsFloat]);
end;

procedure TDMPropuestas.QMDetallePESO_REALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetallePESO_REAL.AsFloat]);
end;

procedure TDMPropuestas.QMDetallePESO_REALChange(Sender: TField);
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

procedure TDMPropuestas.QMDetalleUNIDADES_EXTGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_EXT.AsFloat]);
end;

procedure TDMPropuestas.QMDetalleUNIDADES_SECGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Format('%.*f', [QMDetalleDECIMALES_UNIDADES.AsInteger, QMDetalleUNIDADES_SEC.AsFloat]);
end;

procedure TDMPropuestas.xProveedorAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMPropuestas.xProveedorBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMPropuestas.RecalcularPrecios;
var
  Unidades : double;
  // i : integer;
begin
  with QMDetalle do
  begin
     First;
     // i := 0;
     IgnorarMensajes := True;
     try
        while not EOF do
        begin
           // inc(i);
           Unidades := QMDetalleUNIDADES.AsFloat;

           Edit;
           QMDetalleUNIDADES.AsFloat := 1;
           QMDetalleUNIDADES.AsFloat := Unidades;
           Post;

           Next;

              {
              // Refresco datos
              if (i mod 10 = 0) then
              begin
              end;
              }
        end;
     finally
        IgnorarMensajes := False;
     end;
  end;
end;

procedure TDMPropuestas.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPropuestas.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPropuestas.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPropuestas.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraPROVEEDOR.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;
end;

end.
