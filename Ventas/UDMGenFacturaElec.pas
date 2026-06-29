unit UDMGenFacturaElec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMGenFacturaElec = class(TDataModule)
     QMFacturas: TFIBTableSet;
     QMFacturasEMPRESA: TIntegerField;
     QMFacturasEJERCICIO: TIntegerField;
     QMFacturasCANAL: TIntegerField;
     QMFacturasSERIE: TFIBStringField;
     QMFacturasRIG: TIntegerField;
     QMFacturasFECHA: TDateTimeField;
     QMFacturasTITULO: TFIBStringField;
     QMFacturasCLIENTE: TIntegerField;
     QMFacturasSU_REFERENCIA: TFIBStringField;
     QMFacturasFORMA_PAGO: TFIBStringField;
     QMFacturasTOTAL_A_COBRAR: TFloatField;
     QMFacturasMONEDA: TFIBStringField;
     QMFacturasID_S: TIntegerField;
     QMFacturasTIPO: TFIBStringField;
     QMFacturasPROCESO_AUTO: TIntegerField;
     QMFacturasEMAIL: TStringField;
     QMFacturasTERCERO: TIntegerField;
     QMFacturasAGENTE: TIntegerField;
     QMFacturasESTADO: TIntegerField;
     QMFacturasFECHA_ENTREGA_REPARTO: TDateTimeField;
     QMFacturasZ_OBSERVACION: TFIBStringField;
     QMFacturasTITULO_ESTADO: TStringField;
     QMFacturasFECHA_CON: TDateTimeField;
     QMFacturasPEDIDO_CLIENTE: TFIBStringField;
     TLocal: THYTransaction;
     DSQMFacturas: TDataSource;
     QMNIF: TFIBTableSet;
     QMNIFEMPRESA: TIntegerField;
     QMNIFEJERCICIO: TIntegerField;
     QMNIFCANAL: TIntegerField;
     QMNIFSERIE: TFIBStringField;
     QMNIFTIPO: TFIBStringField;
     QMNIFRIG: TIntegerField;
     QMNIFNIF: TFIBStringField;
     QMNIFDIRECCION: TFIBStringField;
     QMNIFC_POSTAL: TFIBStringField;
     QMNIFPROVINCIA: TFIBStringField;
     QMNIFNOMBRE: TFIBStringField;
     QMNIFPAIS: TFIBStringField;
     QMNIFID_S: TIntegerField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMNIFCOLONIA: TFIBStringField;
     QMNIFTERCERO: TIntegerField;
     QMNIFCARNET_APLICADOR: TFIBStringField;
     DSQMNIF: TDataSource;
     QMFacturasDIRECCION: TIntegerField;
     QMFacturasPERIODO_FACTURACION_INI: TDateTimeField;
     QMFacturasPERIODO_FACTURACION_FIN: TDateTimeField;
     QMDetalle: TFIBTableSet;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetallePIEZAS_X_BULTO: TIntegerField;
     QMDetalleBULTOS: TIntegerField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleCOMISION: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_COMISION: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleI_COMISION: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleNSERIE: TFIBStringField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleCENTRO_COSTE: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMDetalleCOMISION_LINEAL: TFloatField;
     QMDetalleI_COMISION_LINEAL: TFloatField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMDetalleTITULO_IDIOMA: TFIBStringField;
     QMDetalleORDEN: TIntegerField;
     QMDetalleTIPO_LINEA: TFIBStringField;
     QMDetallePROC_PROMOCION: TIntegerField;
     QMDetalleORIGEN: TIntegerField;
     QMDetalleID_P: TIntegerField;
     QMDetalleFECHA_ANTICIPO: TDateTimeField;
     QMDetalleCTA_PAGO_ANTICIPO: TFIBStringField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMDetalleLINEA_RELACION: TIntegerField;
     QMDetalleTIPO_LINEA_KRI: TIntegerField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMDetalleCERTIFICADO2: TIntegerField;
     QMDetalleCERT_NEGATIVO: TIntegerField;
     QMDetalleCUENTA: TFIBStringField;
     QMDetalleLOTE_SIMPLE: TFIBStringField;
     QMDetalleDIRECCION_ENTREGA: TIntegerField;
     QMDetalleCOSTE_ADICIONAL: TFloatField;
     QMDetalleCODIGO_CLIENTE: TStringField;
     QMDetalleTITULO_CLIENTE: TStringField;
     QMDetalleTOTAL_UNIDADES_EXT: TFloatField;
     QMDetalleMARGEN: TFloatField;
     QMDetalleMANIPULACION: TIntegerField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMDetalleID_IMAGEN: TIntegerField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMDetalleLOTEABLE: TIntegerField;
     QMDetalleCANT_LOTE: TFloatField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     QMDetalleSIGNO_UNIDADES: TFIBStringField;
     QMDetalleUNIDAD_FOMENTO: TFloatField;
     DSQMDetalle: TDataSource;
     QSPProcedencia: TFIBTableSet;
     DSQSPProcedencia: TDataSource;
     QMFacturasI_PORTES: TFloatField;
     QMFacturasTIPO_PORTES: TIntegerField;
     QMFacturasBANCO: TIntegerField;
     QMFacturasRECC: TIntegerField;
     QMFacturasS_BASES: TFloatField;
     QMFacturasS_CUOTA_IVA: TFloatField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     QMNIFCOMO_NOS_CONOCIERON: TIntegerField;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMFacturasAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar(DesdeDocumento, HastaDocumento, Cliente: integer; Serie: string);
     procedure GeneraFacturaElectronicaES(Certificado: string);
  end;

var
  DMGenFacturaElec : TDMGenFacturaElec;

implementation

uses UEntorno, UFBusca, UFormGest, UDMMain, UUtiles, UParam, HYFIBQuery, DateUtils, Dialogs, Controls, Windows, UDMFacturas;

{$R *.dfm}

procedure TDMGenFacturaElec.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMGenFacturaElec.Filtrar(DesdeDocumento, HastaDocumento, Cliente: integer; Serie: string);
begin
  with QMFacturas do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM  VER_CABECERAS_FACTURA ');
        Add(' WHERE  ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' TIPO = ''FAC'' AND ');
        Add(' ESTADO >= ?ESTADOD AND ');
        Add(' ESTADO <= ?ESTADOH ');
        if (Serie <> '') then
           Add(' AND SERIE = :SERIE ');
        if (DesdeDocumento <> 0) then
           Add(' AND RIG >= ' + IntToStr(DesdeDocumento));
        if (HastaDocumento <> 0) then
           Add(' AND RIG <= ' + IntToStr(HastaDocumento));
        if (Cliente <> 0) then
           Add(' AND CLIENTE = ' + IntToStr(Cliente));
        Add(' ORDER BY SERIE, RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;

     // FACIMPR002=S no muestra las abiertas
     if (LeeParametro('FACIMPR002', Serie) = 'S') then
        Params.ByName['ESTADOD'].AsInteger := 0
     else
        Params.ByName['ESTADOD'].AsInteger := 5;

     // FACIMPR003=S no muestra las autofacturas
     if (LeeParametro('FACIMPR003', Serie) = 'S') then
        Params.ByName['ESTADOH'].AsInteger := 6
     else
        Params.ByName['ESTADOH'].AsInteger := 5;

     Open;
  end;
end;

procedure TDMGenFacturaElec.GeneraFacturaElectronicaES(Certificado: string);
var
  DM : TDMFacturas;
begin
  AbreDataVarias(TDMFacturas, DM, nil);
  try
     DM.FiltraCabecera(QMFacturasEJERCICIO.AsInteger, QMFacturasSERIE.AsString, QMFacturasRIG.AsInteger);
     DM.GeneraFacturaElectronicaES(Certificado);
  finally
     CierraData(DM);
  end;
end;

procedure TDMGenFacturaElec.QMFacturasAfterOpen(DataSet: TDataSet);
begin
  QMNif.Open;
  QMDetalle.Open;
end;

end.
