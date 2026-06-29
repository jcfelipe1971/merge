unit UDMLstHojaDePreparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, frxClass, frxHYReport, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBDataSetRO, FR_DSet,
  FR_DBSet;

type
  TDMLstHojaDePreparacion = class(TDataModule)
     TLocal: THYTransaction;
     frHojaDePreparacion: TfrHYReport;
     frxHojaDePreparacion: TfrxHYReport;
     frDSQMCabecera: TfrDBDataSet;
     QMCabecera: TFIBDataSetRO;
     DSQMCabecera: TDataSource;
     frDSQMDetalle: TfrDBDataSet;
     QMDetalle: TFIBDataSetRO;
     DSQMDetalle: TDataSource;
     frDSQMDetalleUbicacion: TfrDBDataSet;
     QMDetalleUbicacion: TFIBDataSetRO;
     DSQMDetalleUbicacion: TDataSource;
     frDSxCliente: TfrDBDataSet;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     frDSxArticulo: TfrDBDataSet;
     xArticulo: TFIBDataSetRO;
     DSxArticulo: TDataSource;
     frDSxTipoUnidLogisticas: TfrDBDataSet;
     xTipoUnidLogisticas: TFIBDataSetRO;
     DSxTipoUnidLogisticas: TDataSource;
     xTipoUnidLogisticasTIPO: TFIBStringField;
     xTipoUnidLogisticasTITULO: TFIBStringField;
     xTipoUnidLogisticasUNIDADES: TFloatField;
     frDSxCabPedido: TfrDBDataSet;
     xCabPedido: TFIBDataSetRO;
     DSxCabPedido: TDataSource;
     frDSxDetPedido: TfrDBDataSet;
     xDetPedido: TFIBDataSetRO;
     DSxDetPedido: TDataSource;
     xCabPedidoEMPRESA: TIntegerField;
     xCabPedidoEJERCICIO: TIntegerField;
     xCabPedidoCANAL: TIntegerField;
     xCabPedidoSERIE: TFIBStringField;
     xCabPedidoTIPO: TFIBStringField;
     xCabPedidoRIG: TIntegerField;
     xCabPedidoALMACEN: TFIBStringField;
     xCabPedidoMONEDA: TFIBStringField;
     xCabPedidoFECHA: TDateTimeField;
     xCabPedidoTERCERO: TIntegerField;
     xCabPedidoTITULO: TFIBStringField;
     xCabPedidoDIRECCION: TIntegerField;
     xCabPedidoCLIENTE: TIntegerField;
     xCabPedidoCONTACTO: TIntegerField;
     xCabPedidoSU_REFERENCIA: TFIBStringField;
     xCabPedidoFORMA_PAGO: TFIBStringField;
     xCabPedidoCAMPANYA: TIntegerField;
     xCabPedidoNOTAS: TBlobField;
     xCabPedidoESTADO: TIntegerField;
     xCabPedidoBULTOS: TIntegerField;
     xCabPedidoLINEAS: TIntegerField;
     xCabPedidoBRUTO: TFloatField;
     xCabPedidoI_DTO_LINEAS: TFloatField;
     xCabPedidoS_BASES: TFloatField;
     xCabPedidoM_BRUTO: TFloatField;
     xCabPedidoC_TOTAL: TFloatField;
     xCabPedidoAGENTE: TIntegerField;
     xCabPedidoS_CUOTA_IVA: TFloatField;
     xCabPedidoS_CUOTA_RE: TFloatField;
     xCabPedidoB_DTO_LINEAS: TFloatField;
     xCabPedidoDTO_PP: TFloatField;
     xCabPedidoDTO_CIAL: TFloatField;
     xCabPedidoI_DTO_CIAL: TFloatField;
     xCabPedidoI_DTO_PP: TFloatField;
     xCabPedidoB_COMISION: TFloatField;
     xCabPedidoI_COMISION: TFloatField;
     xCabPedidoPOR_FINANCIACION: TFloatField;
     xCabPedidoI_FINANCIACION: TFloatField;
     xCabPedidoLIQUIDO: TFloatField;
     xCabPedidoENTRADA: TIntegerField;
     xCabPedidoFECHA_ENTREGA_PREV: TDateTimeField;
     xCabPedidoFECHA_REC_CAB: TDateTimeField;
     xCabPedidoSERVIDO: TIntegerField;
     xCabPedidoNOMBRE_COMERCIAL: TFIBStringField;
     xCabPedidoPORTES: TIntegerField;
     xCabPedidoTARIFA: TFIBStringField;
     xCabPedidoAGRUPACION_KRI: TIntegerField;
     xCabPedidoID_S: TIntegerField;
     xCabPedidoIDIOMA: TFIBStringField;
     xCabPedidoUSUARIO: TIntegerField;
     xCabPedidoMARGEN_KRI: TFloatField;
     xCabPedidoTIPO_PORTES: TIntegerField;
     xCabPedidoPOR_PORTES: TFloatField;
     xCabPedidoI_PORTES: TFloatField;
     xCabPedidoI_PORTES_CANAL: TFloatField;
     xCabPedidoCAMBIO_FIJO: TIntegerField;
     xCabPedidoVALOR_CAMB_FIJO: TFloatField;
     xCabPedidoPROYECTO: TIntegerField;
     xCabPedidoNOTAS_INTERNAS_KRI: TBlobField;
     xCabPedidoTIPO_LINEA_KRI: TIntegerField;
     xCabPedidoFECHA_CLIENTE: TDateTimeField;
     xCabPedidoTIT_CONTACTO: TFIBStringField;
     xCabPedidoFECHA_CREACION_KRI: TDateTimeField;
     xCabPedidoPEDIDO_CLIENTE: TFIBStringField;
     xDetPedidoEMPRESA: TIntegerField;
     xDetPedidoEJERCICIO: TIntegerField;
     xDetPedidoCANAL: TIntegerField;
     xDetPedidoSERIE: TFIBStringField;
     xDetPedidoTIPO: TFIBStringField;
     xDetPedidoRIG: TIntegerField;
     xDetPedidoLINEA: TIntegerField;
     xDetPedidoESTADO: TIntegerField;
     xDetPedidoCLIENTE: TIntegerField;
     xDetPedidoMONEDA: TFIBStringField;
     xDetPedidoALMACEN: TFIBStringField;
     xDetPedidoARTICULO: TFIBStringField;
     xDetPedidoTITULO: TFIBStringField;
     xDetPedidoUNIDADES: TFloatField;
     xDetPedidoUNIDADES_SERVIDAS: TFloatField;
     xDetPedidoUNIDADES_PENDIENTES: TFloatField;
     xDetPedidoUNIDADES_RESERVADAS: TFloatField;
     xDetPedidoSERVIDO: TIntegerField;
     xDetPedidoPRECIO: TFloatField;
     xDetPedidoPIEZAS_X_BULTO: TIntegerField;
     xDetPedidoBULTOS: TIntegerField;
     xDetPedidoDESCUENTO: TFloatField;
     xDetPedidoDESCUENTO_2: TFloatField;
     xDetPedidoDESCUENTO_3: TFloatField;
     xDetPedidoCOMISION: TFloatField;
     xDetPedidoP_COSTE: TFloatField;
     xDetPedidoM_MOV_STOCK: TIntegerField;
     xDetPedidoTIPO_IVA: TIntegerField;
     xDetPedidoP_IVA: TFloatField;
     xDetPedidoP_RECARGO: TFloatField;
     xDetPedidoBRUTO: TFloatField;
     xDetPedidoB_COMISION: TFloatField;
     xDetPedidoI_DESCUENTO: TFloatField;
     xDetPedidoB_IMPONIBLE: TFloatField;
     xDetPedidoB_DTO_LINEA: TFloatField;
     xDetPedidoI_COMISION: TFloatField;
     xDetPedidoC_IVA: TFloatField;
     xDetPedidoC_RECARGO: TFloatField;
     xDetPedidoT_COSTE: TFloatField;
     xDetPedidoM_BRUTO: TFloatField;
     xDetPedidoLIQUIDO: TFloatField;
     xDetPedidoENTRADA: TIntegerField;
     xDetPedidoENTRADA_AGRUPACION: TIntegerField;
     xDetPedidoNOTAS: TBlobField;
     xDetPedidoUNIDADES_EXT: TFloatField;
     xDetPedidoORDEN_PRODUCCION: TIntegerField;
     xDetPedidoUNIDADES_SEC: TFloatField;
     xDetPedidoDIRECCION_ENTREGA: TIntegerField;
     xDetPedidoID_DETALLES_S: TIntegerField;
     xDetPedidoID_S: TIntegerField;
     xDetPedidoID_A: TIntegerField;
     xDetPedidoID_C_A: TIntegerField;
     xDetPedidoCOMISION_LINEAL: TFloatField;
     xDetPedidoI_COMISION_LINEAL: TFloatField;
     xDetPedidoFECHA_ENTREGA_PREV: TDateTimeField;
     xDetPedidoFECHA_REC_DET: TDateTimeField;
     xDetPedidoTITULO_IDIOMA: TFIBStringField;
     xDetPedidoMARGEN_KRI: TFloatField;
     xDetPedidoTIPO_LINEA_KRI: TIntegerField;
     xDetPedidoORDEN: TIntegerField;
     xDetPedidoTIPO_LINEA: TFIBStringField;
     xDetPedidoPROC_PROMOCION: TIntegerField;
     xDetPedidoORIGEN: TIntegerField;
     xDetPedidoID_P: TIntegerField;
     xDetPedidoAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xDetPedidoPROYECTO: TIntegerField;
     xDetPedidoNOTAS2: TBlobField;
     xDetPedidoCRC_NOTAS: TFIBStringField;
     xDetPedidoCRC_NOTAS2: TFIBStringField;
     xDetPedidoPRO_NUM_PLANO: TFIBStringField;
     xDetPedidoTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     xDetPedidoTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     xDetPedidoUNIDADES_LOGISTICAS: TFloatField;
     frDSQMResponsable: TfrDBDataSet;
     QMResponsable: TFIBDataSetRO;
     DSQMResponsable: TDataSource;
     QMResponsableEMPRESA: TIntegerField;
     QMResponsableEMPLEADO: TIntegerField;
     QMResponsableTERCERO: TIntegerField;
     QMResponsableTITULO: TFIBStringField;
     QMResponsableNIF: TFIBStringField;
     QMCabeceraID: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraHOJA: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField;
     QMCabeceraRESPONSABLE: TIntegerField;
     QMCabeceraTITUTLO_RESPONSABLE: TFIBStringField;
     QMCabeceraFECHA_INICIO: TDateTimeField;
     QMCabeceraFECHA_FIN: TDateTimeField;
     QMCabeceraCOMENTARIO: TFIBStringField;
     QMCabeceraTOTAL_UNIDADES: TFloatField;
     QMCabeceraTOTAL_UNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraDIR_COMPLETA_N: TFIBStringField;
     QMCabeceraID_EMPLEADO: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMDetalleUbicacionEMPRESA: TIntegerField;
     QMDetalleUbicacionHOJA: TIntegerField;
     QMDetalleUbicacionLINEA: TIntegerField;
     QMDetalleUbicacionLINEA_UBICACION: TIntegerField;
     QMDetalleUbicacionUNIDADES: TFloatField;
     QMDetalleUbicacionALMACEN: TFIBStringField;
     QMDetalleUbicacionCALLE: TFIBStringField;
     QMDetalleUbicacionESTANTERIA: TFIBStringField;
     QMDetalleUbicacionREPISA: TFIBStringField;
     QMDetalleUbicacionPOSICION: TFIBStringField;
     QMDetalleUbicacionVOLUMEN: TFloatField;
     QMDetalleUbicacionPESO: TFloatField;
     QMDetalleUbicacionDIAMETRO: TFloatField;
     QMDetalleUbicacionID: TIntegerField;
     QMDetalleUbicacionID_HOJA: TIntegerField;
     QMDetalleUbicacionID_HOJA_DET: TIntegerField;
     QMDetalleUbicacionID_A: TIntegerField;
     QMDetalleUbicacionID_DETALLES_S: TIntegerField;
     QMDetalleUbicacionID_UBICACION: TIntegerField;
     QMDetalleUbicacionID_A_UBICACION: TIntegerField;
     QMDetalleUbicacionID_D_S_UBICACION: TIntegerField;
     QMDetalleUbicacionLOTE: TFIBStringField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleHOJA: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA_PED: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleUNIDADES_PED: TFloatField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePICO: TFloatField;
     QMDetallePUNTOS: TFloatField;
     QMDetallePESO: TFloatField;
     QMDetallePREPARACION: TIntegerField;
     QMDetalleID: TIntegerField;
     QMDetalleID_HOJA: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMCabeceraTOTAL_PUNTOS: TFloatField;
     QMCabeceraGENERAR_ALBARAN: TIntegerField;
     QMCabeceraCP: TFIBStringField;
     QMCabeceraLOCALIDAD: TFIBStringField;
     QMCabeceraPROVINCIA: TFIBStringField;
     QMCabeceraPAIS: TFIBStringField;
     QMDetalleUbicacionID_LOTE: TIntegerField;
     QMDetalleUbicacionTITULO_UBI: TFIBStringField;
     QMDetalleUNIDADES_A_SERVIR: TFloatField;
     QMDetalleCAJAS: TIntegerField;
     frDSQMDetalleUbicacionSimple: TfrDBDataSet;
     DSQMDetalleUbicacionSimple: TDataSource;
     QMDetalleUbicacionSimple: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraListado(modo, empresa, hoja: integer);
  end;

var
  DMLstHojaDePreparacion : TDMLstHojaDePreparacion;

implementation

uses UDMListados, UEntorno, UFormGest;

{$R *.dfm}

procedure TDMLstHojaDePreparacion.MuestraListado(modo, empresa, hoja: integer);
var
  str : string;
begin
  with QMCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['HOJA'].AsInteger := Hoja;
     Open;
  end;

  DMListados.Cargar(5106, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frHojaDePreparacion.LoadFromFIB(REntorno.Formato, str);
     frHojaDePreparacion.PrepareReport;
     case Modo of
        0, 2: frHojaDePreparacion.ShowPreparedReport;
        1, 3: frHojaDePreparacion.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxHojaDePreparacion.LoadFromFIB(REntorno.Formato, str);
     frxHojaDePreparacion.PrepareReport;
     case Modo of
        0, 2: frxHojaDePreparacion.ShowPreparedReport;
        1, 3: frxHojaDePreparacion.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstHojaDePreparacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstHojaDePreparacion.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstHojaDePreparacion.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  QMResponsable.Close;
end;

procedure TDMLstHojaDePreparacion.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xCliente.Open;
  QMResponsable.Open;
end;

procedure TDMLstHojaDePreparacion.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMDetalleUbicacion.Close;
  xArticulo.Close;
  xTipoUnidLogisticas.Close;
  xCabPedido.Close;
  xDetPedido.Close;
end;

procedure TDMLstHojaDePreparacion.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QMDetalleUbicacion.Open;
  xArticulo.Open;
  xTipoUnidLogisticas.Open;
  xCabPedido.Open;
  xDetPedido.Open;
end;

end.
