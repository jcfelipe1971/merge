unit UDMFacturasAAcreedor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  UComponentesBusquedaFiltrada, FIBDatabase, UFIBModificados, Controls,
  FIBDataSetRO, HYFIBQuery, Dialogs;

type
  TDMFacturasAAcr = class(TDataModule)
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
     QMDetalleENTRADA: TIntegerField;
     EntornoDoc: TEntornoFind2000;
     QMDetalleCANAL: TIntegerField;
     xAcreedor: TFIBDataSetRO;
     DSxAcreedor: TDataSource;
     QMDetallePAIS: TFIBStringField;
     QMDetalleP_COSTE: TFloatField;
     xFormasPago: TFIBDataSetRO;
     TLocal: THYTransaction;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraACREEDOR: TIntegerField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraBULTOS: TIntegerField;
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
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraP_IRPF: TFloatField;
     QMCabeceraI_IRPF: TFloatField;
     QMCabeceraA_IRPF: TIntegerField;
     QMCabeceraTOTAL_FACTURA: TFloatField;
     QMCabeceraNUM_FACTURA: TFIBStringField;
     QMCabeceraFORMA_DE_PAGO: TFIBStringField;
     QMCabeceraTIPO_IRPF: TIntegerField;
     QMCabeceraDEVOLUCION: TIntegerField;
     QMCabeceraASIENTO: TIntegerField;
     QMCabeceraRIC_FAC: TStringField;
     QMCabeceraAPLICA_IRPF: TStringField;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaI_DTO_LINEAS: TFloatField;
     xInfoActualizadaS_BASES: TFloatField;
     xInfoActualizadaS_CUOTA_IVA: TFloatField;
     xInfoActualizadaS_CUOTA_RE: TFloatField;
     xInfoActualizadaB_DTO_LINEAS: TFloatField;
     xInfoActualizadaLIQUIDO: TFloatField;
     xInfoActualizadaI_IRPF: TFloatField;
     xInfoActualizadaTOTAL_FACTURA: TFloatField;
     QMCabeceraREGISTRO: TIntegerField;
     QMDetalleCUENTA_GASTOS: TFIBStringField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     xInfoActualizadaI_FINANCIACION: TFloatField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraFECHA_CON: TDateTimeField;
     QMDetalleNOTAS: TBlobField;
     QMDetallePRECIO: TFloatField;
     QMDetalleTITULO_CUENTA: TFIBStringField;
     QMCabeceraSIN_RECIBOS: TIntegerField;
     QMCabeceraARRENDAMIENTO: TIntegerField;
     QMDetalleSUPLIDO: TIntegerField;
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
     DSQMNIF: TDataSource;
     QMCabeceraFUERZA_VENCIMIENTOS: TIntegerField;
     QMCabeceraTOTAL_CANAL: TFloatField;
     QMCabecerasCostes: TFIBTableSet;
     QMDetallesCostes: TFIBTableSet;
     QMCabecerasCostesEMPRESA: TIntegerField;
     QMCabecerasCostesEJERCICIO: TIntegerField;
     QMCabecerasCostesCANAL: TIntegerField;
     QMCabecerasCostesSERIE: TFIBStringField;
     QMCabecerasCostesTIPO: TFIBStringField;
     QMCabecerasCostesRIG: TIntegerField;
     QMCabecerasCostesDIGITO_1: TFIBStringField;
     QMCabecerasCostesDIGITO_2: TFIBStringField;
     QMCabecerasCostesDIGITO_3: TFIBStringField;
     QMCabecerasCostesDIGITO_4: TFIBStringField;
     QMCabecerasCostesDIGITO_5: TFIBStringField;
     xCuentaArticulo: TFIBDataSetRO;
     xCuentaArticuloCENTRO_COSTE: TIntegerField;
     QMDetalleCENTRO_COSTE: TIntegerField;
     QMDetallesCostesEMPRESA: TIntegerField;
     QMDetallesCostesEJERCICIO: TIntegerField;
     QMDetallesCostesCANAL: TIntegerField;
     QMDetallesCostesSERIE: TFIBStringField;
     QMDetallesCostesTIPO: TFIBStringField;
     QMDetallesCostesRIG: TIntegerField;
     QMDetallesCostesLINEA: TIntegerField;
     QMDetallesCostesDIGITO_1: TFIBStringField;
     QMDetallesCostesDIGITO_2: TFIBStringField;
     QMDetallesCostesDIGITO_3: TFIBStringField;
     QMDetallesCostesDIGITO_4: TFIBStringField;
     QMDetallesCostesDIGITO_5: TFIBStringField;
     QMCabeceraCENTRO_COSTE: TIntegerField;
     DSxTipoIRPF: TDataSource;
     xTipoIRPF: TFIBDataSetRO;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraLEASING: TIntegerField;
     QMCabeceraGASTOS_LEASING: TFloatField;
     QMCabeceraTIPO_ASIENTO_KRI: TFIBStringField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraID_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMNIFPAIS: TFIBStringField;
     QMDetalleORDEN: TIntegerField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraPROYECTO: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMCabeceraOBLIGA_AUTOFACTURA: TIntegerField;
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
     QMCabeceraFUERZA_MODO_IVA: TIntegerField;
     QMCabeceraMODO_IVA: TIntegerField;
     QMCabeceraZ_TIPO_BIENES: TFIBStringField;
     QMCabeceraRECT: TIntegerField;
     QMCabeceraID_RECT: TIntegerField;
     QMCabeceraZ_TIPO_NCF: TIntegerField;
     QMNIFCOLONIA: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     QMCabeceraZ_PREFIJO_NCF: TFIBStringField;
     QMCabeceraZ_CONTADOR_NCF: TFIBStringField;
     xInfoActualizadaMODIFICA_DOC: TIntegerField;
     QMCabeceraRECC: TIntegerField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMCabeceraFECHA_SII: TDateTimeField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraREGISTRO_CARTERA: TIntegerField;
     QMNIFTERCERO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabeceraDESC_RECTIFICACION: TStringField;
     QMCabeceraDIRECCION: TIntegerField;
     DSxDirecciones: TDataSource;
     xDirecciones: TFIBDataSetRO;
     xAvisos: TFIBDataSetRO;
     xDireccionesTITULO: TFIBStringField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMCabeceraRECIBO_PAGADO: TIntegerField;
     QMCabeceraUSUARIO_CREACION: TIntegerField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     QMCabeceraVENCIMIENTO: TDateTimeField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     QMCabeceraOBSERVACIONES: TFIBStringField;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraALMACENChange(Sender: TField);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMCabeceraACREEDORChange(Sender: TField);
     procedure QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
     procedure QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraRICGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCabeceraREGISTROGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCUENTA_GASTOSChange(Sender: TField);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraAfterInsert(DataSet: TDataSet);
     procedure QMCabeceraTIPO_IRPFChange(Sender: TField);
     procedure QMCabeceraTIPO_ASIENTO_KRIChange(Sender: TField);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraCAMBIO_FIJOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraFUERZA_MODO_IVAChange(Sender: TField);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
     procedure QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
     procedure QMDetalleTIPO_IVAChange(Sender: TField);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraDIRECCIONChange(Sender: TField);
     procedure xAcreedorAfterOpen(DataSet: TDataSet);
     procedure xAcreedorBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraFECHAChange(Sender: TField);
  private
     { Private declarations }
     Fecha_old: TDateTime;
     SQLFind, SQLBase: string;
     ComisionAgente: double;
     Editando: boolean;
     Serie: string;
     KriConf471: boolean;
     Param_DOCREFE010: boolean;
     Param_FCRFEC0001: string;
     OldLinea: TStrings;
     ComprobarFechaContabilizacion: boolean;
     ModificandoCambioFijo: boolean;
     procedure RellenaDatosLinea(Linea: TStrings);
     {procedure CambiaMonedaFecha; No se utiliza}
     {function HayCambioFactor(var factor_ant: double): boolean; No se utiliza}
     {procedure RecalculaCambioFactor(factor_ant: double); No se utiliza}
  public
     { Public declarations }
     LocalMascaraN, LocalMascaraL: string;
     monedaold: string;
     procedure InfoActualiza;
     procedure BloqueaFactura;
     procedure DesBloqueaFactura;
     procedure Duplica;
     procedure Devuelve(SerieDestino: string);
     function BusquedaCompleja: integer;
     procedure CambiaSerie(SerieVar: string);
     function Habilitar_but_cambia_iva: boolean;
     procedure PreparaNotasDetalle;
     function ObtieneRegistroIVA: string;
     function ObtieneAsiento: string;
     function DameEstado: integer;
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     function DameDatosAcreedor: boolean;
     procedure GrabaDatosAcreedor(Estado: integer);
     procedure RefrescaTabla;
     function Dameejercicio: string;
     procedure MascarasMoneda;
     procedure CambiaMonedaDetalle;
     procedure InsertaCosteCabecera(d1, d2, d3, d4, d5: string);
     procedure ActualizaCosteCabecera(d1, d2, d3, d4, d5: string);
     procedure BorraCosteCabecera;
     procedure InsertaCosteDetalle(d1, d2, d3, d4, d5: string);
     procedure ActualizaCosteDetalle(d1, d2, d3, d4, d5: string);
     procedure BorraCosteDetalle;
     // function CostesIntroducidos: smallint;
     function HayDocumentos: boolean;
     function EstadoDocumento: integer;
     function HayDetalle: boolean;
     procedure RefrescaIRPF;
     procedure DamePorIRPF;
     procedure ControlaRestriccion;
     function CreaFacturaRectificacion(Serie: string; var d_rig: integer): boolean;
     procedure OrdenarLineas;
     procedure FiltraFact(Filtro: string);
     procedure ApunteAnalitico(Evaluar: boolean);
     procedure BuscaArticulo(Articulo: string);
     procedure AbreQMNif;
     procedure CierraQMNif;
     procedure DatosLeasing;
     procedure CambiaFinanciacion;
     procedure PedirCentroCoste;
     procedure RellenaDatosOldLinea;
     procedure DuplicarLinea;
     procedure RefrescaCabecera(Accion: integer);
     procedure FiltraDocumento(Serie, Filtro: string);
     procedure DividirLineaIVA(Porcentaje: double);
  end;

var
  DMFacturasAAcr : TDMFacturasAAcr;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, URecursos,
  UFBusca, UFParada, UFMDatosFactRectificacion, UFOrdenaLineas, UFMDigitosCoste,
  UFMImputacionCostes, UFMain, UFMDatosLeasing, UFMFinanciaManualAcr, DateUtils,
  UFParadaExt, UParam;

{$R *.DFM}

procedure TDMFacturasAAcr.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  OldLinea := TStringList.Create;
  Kriconf471 := (DMMain.EstadoKri(471) = 1);
  Param_DOCREFE010 := (LeeParametro('DOCREFE010') = 'S');

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

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
  QMCabeceraFECHA_ENTREGA.DisplayFormat := ShortDateFormat + ' hh:nn';

  // Se asignan las mascaras a los campos correspondientes...
  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleP_IVA.DisplayFormat := MascaraP;
  QMDetalleP_RECARGO.DisplayFormat := MascaraP;
  QMDetalleCUENTA_GASTOS.EditMask := REntorno.MascaraCuentas;

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
     Pgc := REntorno.Pgc;
  end;

  xTipoNCF.Open;

  //Se inicializan las variables globales
  ComisionAgente := 0;

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_FACTURA_ACR ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''FCR'' ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' AND (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) ');
  SQLBase := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  Serie := REntorno.Serie;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FECHA_CONTABILIZACION_COMPRAS FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ComprobarFechaContabilizacion := (FieldByName['FECHA_CONTABILIZACION_COMPRAS'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAAcr.Graba(DataSet: TDataSet);
begin
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  // DMMain.Graba;
  DataSet.Refresh;
  InfoActualiza;
end;

procedure TDMFacturasAAcr.QMDetalleNewRecord(DataSet: TDataSet);
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
  QMDetalleSUPLIDO.AsInteger := 0;
  {dji lrk kri - Para Fercam, que no rellene por defecto la cuenta de gastos}
  if (DMMain.EstadoKri(135) = 1) then
     QMDetalleCUENTA_GASTOS.AsString := ''
  else
     QMDetalleCUENTA_GASTOS.AsString := xAcreedor.FieldByName('CUENTA_GASTOS').AsString;
  QMDetalleCENTRO_COSTE.AsInteger := 0;
  QMDetalleID_E.AsInteger := QMCabeceraID_E.AsInteger;
  QMDetallePROYECTO.AsInteger := QMCabeceraPROYECTO.AsInteger;
  QMDetalleINVERSION_SUJETO_PASIVO.AsInteger := QMCabeceraINVERSION_SUJETO_PASIVO.AsInteger;

  // Obtenemos el numero de linea más alto en la Factura a acreedor actual
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  // Relleno los datos con lo que hay en la linea anterior
  if (KriConf471) then
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

procedure TDMFacturasAAcr.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraTIPO.AsString := 'FCR';
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_CON.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_SII.AsDateTime := Today;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  // QMCabeceraACREEDOR.AsInteger := 1;
  QMCabeceraALMACEN.AsString := REntorno.AlmacenDefecto;
  QMCabeceraDEVOLUCION.AsInteger := 0;
  QMCabeceraDTO_CIAL.AsFloat := 0;
  QMCabeceraPOR_FINANCIACION.AsFloat := 0;
  QMCabeceraSIN_RECIBOS.AsInteger := 0;
  QMCabeceraARRENDAMIENTO.AsInteger := 0;
  QMCabeceraFUERZA_VENCIMIENTOS.AsInteger := 0;
  QMCabeceraMONEDA.AsString := REntorno.Moneda;
  QMCabeceraTIPO_IRPF.AsInteger := 0;
  QMCabeceraP_IRPF.AsFloat := 0;
  QMCabeceraGASTOS_LEASING.AsFloat := 0;
  QMCabeceraLEASING.AsInteger := 0;
  QMCabeceraTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_FCR;
  QMCabeceraFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraCAMBIO_FIJO.AsInteger := 0;
  QMCabeceraOBLIGA_AUTOFACTURA.AsInteger := 0;
  QMCabeceraFUERZA_MODO_IVA.AsInteger := 0;
  QMCabeceraRECC.AsInteger := 0;
  QMCabeceraPROYECTO.AsInteger := StrToIntDef(LeeParametro('DOCCPRY001', Serie), 0);

  Editando := False;
end;

procedure TDMFacturasAAcr.QMCabeceraBeforePost(DataSet: TDataSet);
var
  Documentos : string;
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;

  if Param_DOCREFE010 and (Trim(QMCabeceraSU_REFERENCIA.AsString) <> '') then
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
              SelectSQL.Add(' JOIN GES_CABECERAS_E_FCR D ON C.ID_E = D.ID_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' C.TIPO = :TIPO AND ');
              SelectSQL.Add(' D.ACREEDOR = :ACREEDOR AND ');
              SelectSQL.Add(' C.SU_REFERENCIA = :SU_REFERENCIA AND ');
              SelectSQL.Add(' C.ID_E <> :ID_E ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
              Params.ByName['ACREEDOR'].AsInteger := QMCabeceraACREEDOR.AsInteger;
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

  DMMain.ValidaFecha(REntorno.Empresa, REntorno.Ejercicio, QMCabeceraFECHA_CON.AsDateTime);

  if (ComprobarFechaContabilizacion) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 ID_E FROM GES_CABECERAS_E_FCR ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIG < :RIG AND ');
           SQL.Add(' FECHA_CON > :FECHA_CON ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'FCR';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['FECHA_CON'].AsDateTime := Trunc(QMCabeceraFECHA_CON.AsDateTime) + 1;
           ExecQuery;
           if (FieldByName['ID_E'].AsInteger > 0) then
              ShowMessage(_('CUIDADO. La fecha de la factura es incorrecta'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (HourIntoDate(QMCabeceraFECHA_CON.AsDateTime, '00:00:00') < HourIntoDate(QMCabeceraFECHA.AsDateTime, '00:00:00')) then
     ShowMessage(_('CUIDADO. La fecha de contabilizacion a la fecha de la factura'));

  // Tipos de NCF que debemos calcular nosotros
  if ((QMCabeceraZ_TIPO_NCF.AsInteger >= 11) and (QMCabeceraZ_TIPO_NCF.AsInteger <= 13)) then
  begin
     QMCabeceraZ_PREFIJO_NCF.AsString := '00000000000';
     QMCabeceraZ_CONTADOR_NCF.AsString := '00000000';
  end;

  QMCabeceraNUM_FACTURA.AsString := Trim(QMCabeceraNUM_FACTURA.AsString);

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

procedure TDMFacturasAAcr.QMDetalleARTICULOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_IVA, TITULO, ID_A, ID_C_A FROM VER_ARTICULOS_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL= :CANAL AND ARTICULO = :ARTICULO AND FAMILIA = :FAMILIA';
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['ARTICULO'].AsString := Sender.AsString;
        Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
        ExecQuery;
        QMDetalleTIPO_IVA.AsInteger := FieldByName['TIPO_IVA'].AsInteger;
        QMDetalleTITULO.AsString := FieldByName['TITULO'].AsString;
        QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
        QMDetalleID_C_A.AsInteger := FieldByName['ID_C_A'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalleP_COSTE.AsFloat := 0;
  QMDetalleDESCUENTO.AsFloat := 0;

  // Se evita la entrada de articulos que no sean ARTIVA
  if ((QMDetalleARTICULO.AsString <> '') and (QMDetalleID_C_A.AsInteger = 0)) then
     QMDetalleARTICULO.AsString := '';
end;

procedure TDMFacturasAAcr.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     // Validadmos si existe algún documento antes de actualizar informacion
     if (QMCabeceraID_E.AsInteger > 0) then
        Open;
  end;
end;

procedure TDMFacturasAAcr.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if ((QMDetalleSUPLIDO.AsInteger = 1) and (QMDetalleP_IVA.AsFloat <> 0)) then
  begin
     ShowMessage(_('Los importes suplidos no pueden llevar IVA'));
     Abort;
  end;

  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');

  QMDetalleENTRADA.AsInteger := REntorno.Entrada;

  {Calculo el CRC de las notas para poder agrupar}
  QMDetalleCRC_NOTAS.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS));
  QMDetalleCRC_NOTAS2.AsString := CalcCRC32Str(FMain.DameTexto(QMDetalleNOTAS2));
end;

procedure TDMFacturasAAcr.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xAcreedor.Open;
  xDirecciones.Open;
  QMDetalle.Open;
  QMNIF.Open;
  RefrescaIRPF;
  QMDetallesCostes.Open; {dji lrk kri - C.Costes}

  InfoActualiza;
end;

procedure TDMFacturasAAcr.QMCabeceraALMACENChange(Sender: TField);
begin
  EntornoDoc.Almacen := Sender.AsString;
end;

procedure TDMFacturasAAcr.AntesDeEditar(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMCabecera.Post;
     QMCabecera.Refresh;
     QMDetalle.Edit;
  end;

  EntornoDoc.Almacen := QMCabeceraALMACEN.AsString;

  monedaold := QMCabeceraMONEDA.AsString;
  fecha_old := QMCabeceraFECHA.AsDateTime;
  Editando := True;
end;

procedure TDMFacturasAAcr.BloqueaFactura;
var
  DatosLeasing : integer;
  Mensaje : string;
  Cierra : boolean;
begin
  Cierra := True;

  // Control de datos correctos de LEASING
  if (QMCabeceraLEASING.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_CHEQUEA_LEASING (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_E)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
           ExecQuery;
           DatosLeasing := FieldByName['CHEQUEO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (DatosLeasing <> 0) then
     begin
        Mensaje := 'ERROR DATOS DE LEASING: ' + #13#10;
        case DatosLeasing of
           1: Mensaje := Mensaje + _('Los Gastos del Leasing no pueden ser 0');
           2: Mensaje := Mensaje +
                 _('La cuenta de iva diferido no puede ser vacia. Rellénela.');
           3: Mensaje := Mensaje +
                 _('La cuenta de gastos por intereses no puede ser vacia. Rellénela.');
           4: Mensaje := Mensaje +
                 _('La cuenta de abono de gastos no puede ser vacia. Rellénela.');
        end;
        raise Exception.Create(Mensaje);
     end;
  end;

  // Verifico que el DUA este rellenado si hay tipo de IVA de Aduana.
  // Busco una linea que *NO* tenga DUA asignado.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_DETALLES_E ');
        SQL.Add(' FROM GES_DETALLES_E D ');
        SQL.Add(' JOIN SYS_TIPO_IVA I ON D.PAIS = I.PAIS AND D.TIPO_IVA = I.TIPO ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ID_E = :ID_E AND ');
        SQL.Add(' I.REGIMEN = 1 AND ');
        SQL.Add(' NOT EXISTS(SELECT ID_E ');
        SQL.Add('            FROM GES_DETALLES_E_DUA ');
        SQL.Add('            WHERE ');
        SQL.Add('            ID_DETALLES_E = D.ID_DETALLES_E) ');
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        if (FieldByName['ID_DETALLES_E'].AsInteger <> 0) then
           Cierra := ConfirmaMensaje(_('Una linea con IVA de aduana no tiene el DUA asignado. Desea seguir?'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Cierra) then
  begin
     if (xInfoActualizadaTOTAL_FACTURA.AsFloat = 0) then
        Cierra := ConfirmaMensaje(_('Se va a cerrar un documento con total 0. Confirme por favor.'));

     if (Cierra) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_PROV_CIERRA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, ''ACR'', :FECHA, :ENTRADA, :ID_E)';
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        QMCabecera.Refresh;

        ApunteAnalitico(True);
     end;
  end;
end;

procedure TDMFacturasAAcr.DesBloqueaFActura;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ACR_ABRE(:ID_E)';
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMFacturasAAcr.QMCabeceraACREEDORChange(Sender: TField);
begin
  if (not DMMain.AcreedorBloqueado(QMCabeceraACREEDOR.AsInteger)) then
  begin
     with xAcreedor do
     begin
        Close;
        Open;
        QMCabeceraDTO_PP.AsFloat := FieldByName('DESCUENTO_PP').AsFloat;
        QMCabeceraFORMA_DE_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        // QMCabeceraDTO_CIAL.AsFloat :=
        QMCabeceraTIPO_IRPF.AsInteger := FieldByName('TIPO_IRPF').AsInteger;
        // QMCabeceraPOR_FINANCIACION.AsFloat := FieldByName('POR_FINANCIACION').AsFloat;
        QMCabeceraTITULO.AsString := FieldByName('TITULO').AsString;
        QMCabeceraMONEDA.AsString := FieldByName('MONEDA').AsString;
        QMCabeceraTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMCabeceraDIRECCION.AsInteger := DMMain.DameMinDireccion(QMCabeceraTERCERO.AsInteger);
        QMCabeceraIDIOMA.AsString := FieldByName('IDIOMA').AsString;
        QMCabeceraZ_TIPO_NCF.AsInteger := FieldByName('TIPO_NCF').AsInteger;

        if (FieldByName('TIPO').AsInteger = 8) then
           QMCabeceraARRENDAMIENTO.AsInteger := 1;
        if (QMCabeceraFUERZA_MODO_IVA.AsInteger = 0) then
           QMCabeceraMODO_IVA.AsInteger := FieldByName('MODO_IVA').AsInteger;

        if (REntorno.Ejercicio >= 2014) then
           QMCabeceraRECC.AsInteger := FieldByName('RECC').AsInteger
        else
           QMCabeceraRECC.AsInteger := 0;
     end;

     DamePorIRPF;
  end
  else
     QMCabecera.Cancel;

  DMMain.MuestraAviso('ACR', xAcreedor.FieldByName('ID_ACREEDOR').AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMFacturasAAcr.QMCabeceraFORMA_DE_PAGOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT HEREDA_FINANCIACION, SIN_RECIBOS FROM CON_CUENTAS_GES_FP ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['FORMA_PAGO'].AsString := QMCabeceraFORMA_DE_PAGO.AsString;

        ExecQuery;

        if (FieldByName['HEREDA_FINANCIACION'].AsInteger = 1) then
           QMCabeceraPOR_FINANCIACION.AsFloat := xAcreedor.FieldByName('POR_FINANCIACION').AsFloat;

        QMCabeceraSIN_RECIBOS.AsInteger := FieldByName['SIN_RECIBOS'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturasAAcr.QMCabeceraAPLICA_IRPFGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraA_IRPF.AsInteger = 0 then
     Text := _('Aplicable a la Base Imponible')
  else
     Text := _('Aplicable al Total con IVA');
end;

procedure TDMFacturasAAcr.Duplica;
var
  IdDocDestino : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_DOC_E_DUPLICA ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ''FCR'', ?RIG, ');
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

procedure TDMFacturasAAcr.Devuelve(SerieDestino: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FAC_E_DEVUELVE (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''FCR'', :RIG, :ENTRADA, :FECHA, :ID_E)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := SerieDestino;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Close;
  QMCabecera.Open;
  QMCabecera.Last;
end;

function TDMFacturasAAcr.BusquedaCompleja: integer;
begin
  DMMain.LogIni('DMFacturasAAcr.BusquedaCompleja');
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

procedure TDMFacturasAAcr.QMCabeceraRICGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraESTADO.AsInteger = 0 then
     Text := ' '
  else
     Text := IntToStr(QMCabeceraASIENTO.AsInteger);
end;

procedure TDMFacturasAAcr.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMFacturasAAcr.QMCabeceraPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMCabecera.State = dsInsert then
  begin
     QMCabeceraRIG.Clear;
  end;
end;

procedure TDMFacturasAAcr.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;

     Param_FCRFEC0001 := LeeParametro('FCRFEC0001', Serie);
     if (LeeParametro('FCRULTD001', Serie) = 'S') then
        Last;
  end;
end;

procedure TDMFacturasAAcr.QMCabeceraREGISTROGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCabeceraESTADO.AsInteger = 0 then
     Text := ' '
  else
     Text := IntToStr(QMCabeceraREGISTRO.AsInteger);
end;

function TDMFacturasAAcr.Habilitar_but_cambia_iva: boolean;
begin
  Result := not ((QMDetalle.RecordCount = 0) or (QMCabeceraESTADO.AsInteger <> 0) or (xAcreedor.Active and (xAcreedor.FieldByName('MODO_IVA').AsInteger = 0)));
end;

procedure TDMFacturasAAcr.PreparaNotasDetalle;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  if (QMCabeceraESTADO.AsInteger = 0) then
     QMDetalle.Edit;
end;

procedure TDMFacturasAAcr.QMDetalleCUENTA_GASTOSChange(Sender: TField);
var
  CuentaExpandida : string;
begin
  CuentaExpandida := ExpandirCadena(Trim(Sender.AsString), REntorno.DigitosSub);
  if (Sender.AsString <> CuentaExpandida) then
     Sender.AsString := CuentaExpandida;
  QMDetalleTITULO_CUENTA.AsString := DameTituloCuenta(CuentaExpandida);
end;

function TDMFacturasAAcr.ObtieneRegistroIVA: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIS FROM GES_CABECERAS_E_FCR WHERE ID_E = :ID_E';
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        Result := FieldByName['RIS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMFacturasAAcr.ObtieneAsiento: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIC FROM GES_CABECERAS_E_FCR WHERE ID_E = :ID_E';
        Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
        ExecQuery;
        Result := FieldByName['RIC'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMFacturasAAcr.DameEstado: integer;
begin
  Result := QMCabeceraESTADO.Value;
end;

procedure TDMFacturasAAcr.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  DMMain.LogIni('DMFacturasAAcr.FiltraCabecera');
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
  end;
  DMMain.LogFin('');
end;

function TDMFacturasAAcr.DameDatosAcreedor: boolean;
begin
  if ((QMCabeceraACREEDOR.AsInteger <= -1)) then
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

procedure TDMFacturasAAcr.GrabaDatosAcreedor(Estado: integer);
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

procedure TDMFacturasAAcr.QMNIFNewRecord(DataSet: TDataSet);
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

// Refrescar el Grid de la Pestaña TABLA
procedure TDMFacturasAAcr.RefrescaTabla;
begin
  if (QMCabecera.RecordCount > 0) then
  begin
     QMDetalle.DisableControls;
     QMCabecera.Refresh;
     QMDetalle.EnableControls;
  end;
end;

// Centros de Coste
procedure TDMFacturasAAcr.InsertaCosteCabecera(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO GES_CABECERAS_COSTES( ');
        SQL.Add(' EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,DIGITO_1,DIGITO_2,DIGITO_3,DIGITO_4,DIGITO_5) ');
        SQL.Add(' VALUES( ');
        SQL.Add(' ?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D1,?D2,?D3,?D4,?D5) ');
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     QMCabecera.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CABECERAS_FACTURA_ACR ');
        SQL.Add(' SET ');
        SQL.Add(' CENTRO_COSTE = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturasAAcr.ActualizaCosteCabecera(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_CABECERAS_COSTES ');
        SQL.Add(' SET ');
        SQL.Add(' DIGITO_1 = ?D1, ');
        SQL.Add(' DIGITO_2 = ?D2, ');
        SQL.Add(' DIGITO_3 = ?D3, ');
        SQL.Add(' DIGITO_4 = ?D4, ');
        SQL.Add(' DIGITO_5 = ?D5 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturasAAcr.BorraCosteCabecera;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM GES_CABECERAS_COSTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     QMCabecera.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CABECERAS_FACTURA_ACR ');
        SQL.Add(' SET ');
        SQL.Add(' CENTRO_COSTE = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
  QMCabecerasCostes.Close;
  QMCabecerasCostes.Open;
end;

procedure TDMFacturasAAcr.InsertaCosteDetalle(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO GES_DETALLES_COSTES( ');
        SQL.Add(' EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,DIGITO_1,DIGITO_2,DIGITO_3,DIGITO_4,DIGITO_5) ');
        SQL.Add(' VALUES( ');
        SQL.Add(' ?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?D1,?D2,?D3,?D4,?D5) ');
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_DETALLE_FACTURA_ACR ');
        SQL.Add(' SET ');
        SQL.Add(' CENTRO_COSTE = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG AND ');
        SQL.Add(' LINEA = ?LINEA ');
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturasAAcr.ActualizaCosteDetalle(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_DETALLES_COSTES ');
        SQL.Add(' SET ');
        SQL.Add(' DIGITO_1 = ?D1, ');
        SQL.Add(' DIGITO_2 = ?D2, ');
        SQL.Add(' DIGITO_3 = ?D3, ');
        SQL.Add(' DIGITO_4 = ?D4, ');
        SQL.Add(' DIGITO_5 = ?D5 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG AND ');
        SQL.Add(' LINEA = ?LINEA ');
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturasAAcr.BorraCosteDetalle;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM GES_DETALLES_COSTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG AND ');
        SQL.Add(' LINEA = ?LINEA ');
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMDetalle.State = dsInsert) or (QMDetalle.State = dsEdit)) then
     QMDetalle.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_DETALLE_FACTURA_ACR ');
        SQL.Add(' SET ');
        SQL.Add(' CENTRO_COSTE = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG AND ');
        SQL.Add(' LINEA = ?LINEA ');
        Params.ByName['empresa'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['tipo'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['linea'].AsInteger := QMDetalleLINEA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
  QMDetallesCostes.Close;
  QMDetallesCostes.Open;
end;

procedure TDMFacturasAAcr.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  // Acá tengo que ver si la cuenta tiene Centro de Costos.
  if (QMDetalleCENTRO_COSTE.AsInteger = 0) then
     PedirCentroCoste;

  QMDetallesCostes.Close;
  QMDetallesCostes.Open;

  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAAcr.PedirCentroCoste;
var
  ID : integer;
begin
  // Grabo datos antes de pedir centro de coste
  if (QMCabecera.State in [dsEdit, dsInsert]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;

  if ((QMCabeceraESTADO.AsInteger = 0) and
     ((QMDetalle.RecordCount = 0) or (xCuentaArticuloCENTRO_COSTE.AsInteger = 1))) then
  begin
     // Paso los centros de coste a una tabla temporal
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM TMP_TRASPASA_CENTRO_COSTE (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?MODO, ?ID_TMP)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['MODO'].AsInteger := 0;
           Params.ByName['ID_TMP'].AsInteger := 0;
           ExecQuery;
           id := FieldByName['ID'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     TFMDigitosCoste.Create(Self).Muestra(id, QMDetalleCUENTA_GASTOS.AsString);

     // Paso los centros de coste desde la tabla temporal
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM TMP_TRASPASA_CENTRO_COSTE (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?MODO, ?ID_TMP)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['MODO'].AsInteger := 1;
           Params.ByName['ID_TMP'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturasAAcr.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  {dji lrk kri - C.Costes}
  xCuentaArticulo.Close;
  xCuentaArticulo.Params.ByName['PGC'].AsInteger := REntorno.PGC;
  xCuentaArticulo.Open;
  QMDetallesCostes.Open;
  RellenaDatosLinea(OldLinea);
end;

{
function TDMFacturasAAcr.CostesIntroducidos: smallint;
begin
  with SPCostesIntroducidos do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['serie'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['tipo'].AsString := QMCabeceraTIPO.AsString;
     Params.ByName['rig'].AsInteger := QMCabeceraRIG.AsInteger;
     ExecQuery;
     Result := FieldByName['numero'].AsInteger;
     FreeHandle;
  end;
end;
}

procedure TDMFacturasAAcr.QMDetalleBeforeScroll(DataSet: TDataSet);
begin
  {
  // Acá tengo que ver si la cuenta tiene Centro de Costos.
  if ((QMDetalleCENTRO_COSTE.AsInteger = 0) and (QMDetalleARTICULO.AsString <> '')) then
     if (FMFacturasAAcr = nil) then
        FMFacturasAAcrKri.ACentroCosteExecute(Self)
     else
        FMFacturasAAcr.ACentroCosteExecute(Self);
}
end;

function TDMFacturasAAcr.Dameejercicio: string;
begin
  Result := IntToStr(QMCabeceraEJERCICIO.AsInteger);
end;

procedure TDMFacturasAAcr.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  QMCabeceraTOTAL_FACTURA.DisplayFormat := LocalMascaraN;

  QMDetalleC_RECARGO.DisplayFormat := LocalMascaraL;
  QMDetalleM_BRUTO.DisplayFormat := LocalMascaraL;
  QMDetalleLIQUIDO.DisplayFormat := LocalMascaraL;
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleT_COSTE.DisplayFormat := LocalMascaraL;
  QMDetalleBRUTO.DisplayFormat := LocalMascaraL;
  QMDetalleB_IMPONIBLE.DisplayFormat := LocalMascaraL;
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
  xInfoActualizadaTOTAL_FACTURA.DisplayFormat := LocalMascaraN;
  xInfoActualizadaI_IRPF.DisplayFormat := LocalMascaraN;
end;

procedure TDMFacturasAAcr.CambiaMonedaDetalle;
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
           Params.ByName['TIPO'].AsString := 'FCR';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['MONEDAOLD'].AsString := monedaold;
           Params.ByName['ID_E'].AsInteger := QMCabeceraID_E.AsInteger;
           with TFParadaExt.Create(Self) do
           begin
              try
                 repeat
                 until ExecQuery(Q, _('Atención:'), 30000);
              finally
                 Free;
              end;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMFacturasAAcr.QMCabeceraTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1),
     QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMFacturasAAcr.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);

  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     QMCabecera.Refresh;
  end;
end;

function TDMFacturasAAcr.HayDocumentos: boolean;
begin
  Result := (QMCabecera.FieldByName('RIG').AsInteger <> 0);
end;

function TDMFacturasAAcr.EstadoDocumento: integer;
begin
  Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

function TDMFacturasAAcr.HayDetalle: boolean;
begin
  // Result := (QMDetalle.FieldByName('LINEA').AsInteger <> 0);
  Result := (QMDetalle.RecordCount > 0);
end;

procedure TDMFacturasAAcr.QMCabeceraAfterInsert(DataSet: TDataSet);
begin
  monedaold := QMCabeceraMONEDA.AsString;
end;

procedure TDMFacturasAAcr.RefrescaIRPF;
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

procedure TDMFacturasAAcr.DamePorIRPF;
var
  Base : byte;
begin
  with xTipoIRPF do
  begin
     QMCabeceraP_IRPF.AsFloat := FieldByName('P_IRPF').AsFloat;
     Base := FieldByName('BASE').AsInteger;
  end;

  if (Base = 0) then
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable a la Base Imponible')
  else
     QMCabeceraAPLICA_IRPF.AsString := _('Aplicable al Total con IVA');
end;

procedure TDMFacturasAAcr.QMCabeceraTIPO_IRPFChange(Sender: TField);
begin
  RefrescaIRPF;
end;

procedure TDMFacturasAAcr.ControlaRestriccion;
begin
  ControlaBorrado(QMCabeceraID_E.AsInteger, QMCabeceraTIPO.AsString);
end;

procedure TDMFacturasAAcr.QMCabeceraTIPO_ASIENTO_KRIChange(Sender: TField);
begin
  REntorno.Asiento_FCR := Sender.AsString;
end;

procedure TDMFacturasAAcr.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  fecha_old := QMCabeceraFECHA.AsDateTime;
end;

procedure TDMFacturasAAcr.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  EntornoDoc.Almacen := QMCabeceraALMACEN.AsString;
end;

function TDMFacturasAAcr.CreaFacturaRectificacion(Serie: string; var d_rig: integer): boolean;
begin
  d_rig := 0;
  Result := False;
  if (QMCabecera.State = dsInsert) then
     QMCabecera.Cancel;

  FMDatosFactRectificacion := TFMDatosFactRectificacion.Create(Self);
  try
     FMDatosFactRectificacion.PasaTipo('FCR');
     FMDatosFactRectificacion.ShowModal;

     if (FMDatosFactRectificacion.ModalResult = mrOk) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_CREA_FACTURA_RECTIFICACION_E (:EMPRESA, :D_EJERCICIO, :D_CANAL, :D_SERIE, :D_FECHA, :O_EJERCICIO, :O_SERIE, :O_RIG, :ENTRADA, :TIPO)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['D_SERIE'].AsString := Serie;
              Params.ByName['D_FECHA'].AsDateTime := REntorno.FechaTrab;
              Params.ByName['O_EJERCICIO'].AsInteger := FMDatosFactRectificacion.Ejercicio;
              Params.ByName['O_SERIE'].AsString := FMDatosFactRectificacion.Serie;
              Params.ByName['O_RIG'].AsInteger := FMDatosFactRectificacion.Rig;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['TIPO'].AsString := 'FCR';
              ExecQuery;
              d_rig := FieldByName['D_RIG'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     FreeAndNil(FMDatosFactRectificacion);
  end;
end;

procedure TDMFacturasAAcr.OrdenarLineas;
begin
  QMDetalle.DisableControls;
  OrdenaLineas('FCR', QMCabeceraID_E.AsInteger, Self);
  QMDetalle.Close;
  QMDetalle.Open;
  QMDetalle.EnableControls;
end;

procedure TDMFacturasAAcr.QMCabeceraCAMBIO_FIJOChange(Sender: TField);
begin
  QMCabeceraVALOR_CAMB_FIJO.AsFloat := 0;
end;

procedure TDMFacturasAAcr.FiltraFact(Filtro: string);
begin
  with QMCabecera do
  begin
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA_ACR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(Filtro);
     SelectSQL.Add(' ORDER BY RIG, EJERCICIO ');
     Open;
  end;
end;

procedure TDMFacturasAAcr.ApunteAnalitico(Evaluar: boolean);
var
  RIC : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIC FROM CON_CUENTAS_ASIENTOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ASIENTO = :ASIENTO';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEmpresa.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEjercicio.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['ASIENTO'].AsInteger := QMCabeceraAsiento.AsInteger;
        ExecQuery;
        RIC := FieldByName['RIC'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMCabeceraESTADO.AsInteger = 5) and (RIC > 0)) then
     AbrirImputacionCostes(RIC, Evaluar);
end;

procedure TDMFacturasAAcr.BuscaArticulo(Articulo: string);
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

procedure TDMFacturasAAcr.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  OldLinea.Free;
end;

procedure TDMFacturasAAcr.AbreQMNif;
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

procedure TDMFacturasAAcr.CierraQMNif;
begin
  QMNif.Close;
end;

procedure TDMFacturasAAcr.QMCabeceraFUERZA_MODO_IVAChange(Sender: TField);
begin
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
     if (Sender.AsInteger = 0) then
        QMCabeceraMODO_IVA.AsInteger := xAcreedor.FieldByName('MODO_IVA').AsInteger;
end;

procedure TDMFacturasAAcr.DatosLeasing;
begin
  if (QMCabeceraLEASING.AsInteger <> 0) then
  begin
     if (QMCabeceraESTADO.AsInteger = 5) then
     begin
        MessageDlg(_('La Factura esta Cerrada. Ábrala para modificar estos datos.'),
           mtInformation, [mbOK], 0);
     end
     else
     begin
        FMDatosLeasing := TFMDatosLeasing.Create(Self);
        with FMDatosLeasing do
        begin
           FiltraQuery(QMCabeceraEMPRESA.AsInteger, QMCabeceraEJERCICIO.AsInteger, QMCabeceraCANAL.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraTIPO.AsString, QMCabeceraRIG.AsInteger, QMCabeceraMONEDA.AsString);
           ShowModal;
           Free;
        end;
     end;
  end
  else
     MessageDlg(_('Esta Factura no es de Leasing. Marque la casilla correspondiente.'),
        mtInformation, [mbOK], 0);
end;

procedure TDMFacturasAAcr.CambiaFinanciacion;
var
  FMFinanciaManualAcr : TFMFinanciaManualAcr;
begin
  FMFinanciaManualAcr := TFMFinanciaManualAcr.Create(Self);
  with FMFinanciaManualAcr do
  begin
     Muestra(QMCabeceraSERIE.AsString, QMCabeceraTIPO.AsString, QMCabeceraRIG.AsInteger);
     Free;
  end;
  QMCabecera.Refresh;
end;

procedure TDMFacturasAAcr.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAAcr.RellenaDatosOldLinea;
begin
  RellenaDatosLinea(OldLinea);
end;

procedure TDMFacturasAAcr.RellenaDatosLinea(Linea: TStrings);

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
     AddField(Linea, 'TIPO_IVA');
     AddField(Linea, 'NOTAS');
  end;
end;

procedure TDMFacturasAAcr.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMFacturasAAcr.DuplicarLinea;
var
  old_KriConf471 : boolean;
begin
  old_KriConf471 := KriConf471;
  try
     KriConf471 := True;

     // Guardo los datos con lo que hay en la linea si KriConf471 estaba deshabilidatdo
     RellenaDatosOldLinea;

     with QMDetalle do
     begin
        Insert;
        Post;
        Last;
     end;
  finally
     KriConf471 := old_KriConf471;
  end;
end;

procedure TDMFacturasAAcr.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);

  if (QMCabecera.FieldByName('RECT').AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_RECT';
           Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
           ExecQuery;
           QMCabeceraDESC_RECTIFICACION.AsString := Format(_('Rectificación de la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), IntToStr(FieldByName['RIG'].AsInteger), FieldByName['SERIE'].AsString]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  if (QMCabecera.FieldByName('ID_RECT').AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_RECT';
           Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
           ExecQuery;
           QMCabeceraDESC_RECTIFICACION.AsString := Format(_('Rectificada en la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), IntToStr(FieldByName['RIG'].AsInteger), FieldByName['SERIE'].AsString]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMCabeceraDESC_RECTIFICACION.AsString := '';
end;

procedure TDMFacturasAAcr.RefrescaCabecera(Accion: integer);
begin
  case Accion of
     1: QMCabecera.Refresh;
     2: Refrescar(QMCabecera, 'ID_E', QMCabeceraID_E.AsInteger, False, True);
  end;
end;

procedure TDMFacturasAAcr.QMCabeceraVALOR_CAMB_FIJOChange(Sender: TField);
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

procedure TDMFacturasAAcr.QMCabeceraVALOR_CAMB_FIJO_INVChange(Sender: TField);
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

procedure TDMFacturasAAcr.QMDetalleTIPO_IVAChange(Sender: TField);
begin
  QMDetalleP_IVA.AsFloat := DMMain.DamePorcentajeIva(REntorno.Pais, QMDetalleTIPO_IVA.AsInteger);
end;

procedure TDMFacturasAAcr.FiltraDocumento(Serie, Filtro: string);
begin
  DMMain.LogIni('DMFacturasAAcr.FiltraDocumento');
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

procedure TDMFacturasAAcr.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xAcreedor.Close;
  xDirecciones.Close;
  QMDetalle.Close;
  QMNIF.Close;
  QMDetallesCostes.Close;
end;

procedure TDMFacturasAAcr.QMCabeceraDIRECCIONChange(Sender: TField);
begin
  with xDirecciones do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFacturasAAcr.xAcreedorAfterOpen(DataSet: TDataSet);
begin
  xAvisos.Open;
end;

procedure TDMFacturasAAcr.xAcreedorBeforeClose(DataSet: TDataSet);
begin
  xAvisos.Close;
end;

procedure TDMFacturasAAcr.QMCabeceraTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraACREEDOR.AsInteger < 0) then
     Text := DameNombreTercerosVarios(QMCabeceraTIPO.AsString, QMCabeceraID_E.AsInteger);

  if (Text = '') then
     Text := QMCabeceraTITULO.AsString;
end;

procedure TDMFacturasAAcr.xDireccionesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCabeceraACREEDOR.AsInteger < 0) then
  begin
     Text := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DIRECCION FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :ACREEDOR, :ID_E, 1) WHERE ((NUM = :NUM) OR (:ACREEDOR < 0))';
           Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
           Params.ByName['ACREEDOR'].AsInteger := QMCabeceraACREEDOR.AsInteger;
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

procedure TDMFacturasAAcr.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMFacturasAAcr.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMFacturasAAcr.QMCabeceraFECHAChange(Sender: TField);
begin
  // Si modifica, que no cambien las fechas automaticamente
  if ((Param_FCRFEC0001 = 'S') or ((Param_FCRFEC0001 = 'I') and (QMCabecera.State = dsInsert))) then
  begin
     if ((DMMain.EstadoKRI(177) = 1) and (QMCabecera.State = dsInsert)) then
        QMCabeceraFECHA_CON.AsDateTime := REntorno.FechaTrabSH
     else
        QMCabeceraFECHA_CON.AsDateTime := QMCabeceraFECHA.AsDateTime;

     QMCabeceraFECHA_ENTREGA.AsDateTime := QMCabeceraFECHA.AsDateTime;
  end;
end;

procedure TDMFacturasAAcr.DividirLineaIVA(Porcentaje: double);
var
  Titulo, CuentaGastos : string;
  Precio, Diferencia : double;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
  Titulo := QMDetalleTITULO.AsString;
  CuentaGastos := QMDetalleCUENTA_GASTOS.AsString;
  Precio := QMDetalleLIQUIDO.AsFloat;

  QMDetalle.Edit;
  QMDetalleP_COSTE.AsFloat := QMDetalleP_COSTE.AsFloat - (QMDetalleP_COSTE.AsFloat * Porcentaje / 100);
  QMDetalle.Post;

  Diferencia := Precio - QMDetalleLIQUIDO.AsFloat;

  QMDetalle.Insert;
  QMDetalleARTICULO.AsString := 'ARTIVA0';
  QMDetalleTITULO.AsString := Titulo;
  QMDetalleCUENTA_GASTOS.AsString := CuentaGastos;
  QMDetalleP_COSTE.AsFloat := Diferencia;
  QMDetalle.Post;
end;

end.
