unit ZUDMVerEstadoPedCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSet;

type
  TZDMVerEstadoPedCli = class(TDataModule)
     TLocal: THYTransaction;
     DSQMVerPedidos: TDataSource;
     QMVerPedidos: TFIBTableSet;
     QMVerPedidosNUM_PEDIDO: TIntegerField;
     QMVerPedidosREF_PEDIDO: TFIBStringField;
     QMVerPedidosFECHA_PEDIDO: TDateTimeField;
     QMVerPedidosZ_CB_PEDIDO: TIntegerField;
     QMVerPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     QMVerPedidosFECHA_CORTE: TDateTimeField;
     QMVerPedidosOPERARIO_CORTE: TIntegerField;
     QMVerPedidosFECHA_UNION: TDateTimeField;
     QMVerPedidosOPERARIO_UNION: TIntegerField;
     QMVerPedidosFECHA_MACARRON: TDateTimeField;
     QMVerPedidosOPERARIO_MACARRON: TIntegerField;
     QMVerPedidosFECHA_MONTAJE: TDateTimeField;
     QMVerPedidosOPERARIO_MONTAJE: TIntegerField;
     QMVerPedidosFECHA_TERMINADO: TDateTimeField;
     QMVerPedidosOPERARIO_TERMINADO: TIntegerField;
     QMVerPedidosSERIE: TFIBStringField;
     QMVerPedidosFECHA_PREPARADO: TDateTimeField;
     QMVerPedidosOPERARIO_PREPARADO: TIntegerField;
     QMVerPedidosESTADO_PEP: TIntegerField;
     QMVerPedidosEJERCICIO: TIntegerField;
     QMVerPedidosID_S: TIntegerField;
     QMVerPedidosCLIENTE: TIntegerField;
     QMVerPedidosTITULO: TStringField;
     QMVerPedidosID_S_ALB: TIntegerField;
     QMVerPedidosFECHA_ALB: TDateTimeField;
     QMVerPedidosID_RUTA: TIntegerField;
     QMVerPedidosFECHA_RUTA: TDateTimeField;
     QMVerPedidosCANAL: TIntegerField;
     QMVerPedidosLINEA_PED: TIntegerField;
     QMVerPedidosFECHA_MOTOR: TDateTimeField;
     QMVerPedidosOPERARIO_MOTOR: TIntegerField;
     QMVerPedidosZONA: TFIBStringField;
     TUpdate: THYTransaction;
     DSxPedidosCompra: TDataSource;
     xPedidosCompra: TFIBDataSetRO;
     xPedidosCompraEMPRESA: TIntegerField;
     xPedidosCompraEJERCICIO: TIntegerField;
     xPedidosCompraCANAL: TIntegerField;
     xPedidosCompraSERIE: TFIBStringField;
     xPedidosCompraTIPO: TFIBStringField;
     xPedidosCompraRIG: TIntegerField;
     xPedidosCompraLINEA: TIntegerField;
     xPedidosCompraALMACEN: TFIBStringField;
     xPedidosCompraARTICULO: TFIBStringField;
     xPedidosCompraTITULO: TFIBStringField;
     xPedidosCompraUNIDADES: TFloatField;
     xPedidosCompraPRECIO: TFloatField;
     xPedidosCompraDESCUENTO: TFloatField;
     xPedidosCompraDESCUENTO_2: TFloatField;
     xPedidosCompraDESCUENTO_3: TFloatField;
     xPedidosCompraP_COSTE: TFloatField;
     xPedidosCompraPAIS: TFIBStringField;
     xPedidosCompraTIPO_IVA: TIntegerField;
     xPedidosCompraP_IVA: TFloatField;
     xPedidosCompraP_RECARGO: TFloatField;
     xPedidosCompraBRUTO: TFloatField;
     xPedidosCompraI_DESCUENTO: TFloatField;
     xPedidosCompraB_IMPONIBLE: TFloatField;
     xPedidosCompraENTRADA: TIntegerField;
     xPedidosCompraDTO_PP: TFloatField;
     xPedidosCompraM_MOV_STOCK: TIntegerField;
     xPedidosCompraENTRADA_RECEPCION: TIntegerField;
     xPedidosCompraUNIDADES_EXT: TFloatField;
     xPedidosCompraNOTAS: TMemoField;
     xPedidosCompraB_IMPONIBLE_CANAL: TFloatField;
     xPedidosCompraBASE_IMPORTACION: TFloatField;
     xPedidosCompraID_DETALLES_E: TIntegerField;
     xPedidosCompraID_E: TIntegerField;
     xPedidosCompraID_D_E_GR: TIntegerField;
     xPedidosCompraID_A_M_C_T: TIntegerField;
     xPedidosCompraID_C_A: TIntegerField;
     xPedidosCompraID_A: TIntegerField;
     xPedidosCompraID_MOV_STOCKS: TIntegerField;
     xPedidosCompraI_DTO_CIAL: TFloatField;
     xPedidosCompraNSERIE: TFIBStringField;
     xPedidosCompraBULTOS: TFloatField;
     xPedidosCompraORDEN: TIntegerField;
     xPedidosCompraUNIDADES_SEC: TFloatField;
     xPedidosCompraAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xPedidosCompraPROYECTO: TIntegerField;
     xPedidosCompraNOTAS2: TMemoField;
     xPedidosCompraCRC_NOTAS: TFIBStringField;
     xPedidosCompraCRC_NOTAS2: TFIBStringField;
     xPedidosCompraID_DETALLES_E_REGALO: TIntegerField;
     xPedidosCompraCUENTA: TFIBStringField;
     xPedidosCompraIMPORTE_ICE: TFloatField;
     xPedidosCompraINVERSION_SUJETO_PASIVO: TIntegerField;
     xPedidosCompraB_DTO_LINEA: TFloatField;
     xPedidosCompraC_IVA: TFloatField;
     xPedidosCompraC_RECARGO: TFloatField;
     xPedidosCompraT_COSTE: TFloatField;
     xPedidosCompraM_BRUTO: TFloatField;
     xPedidosCompraLIQUIDO: TFloatField;
     xPedidosCompraTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     xPedidosCompraP_IMPUESTO_ADICIONAL: TFloatField;
     xPedidosCompraI_IMPUESTO_ADICIONAL: TFloatField;
     xPedidosCompraI_IMPUESTO_ADICIONAL_CANAL: TFloatField;
     xPedidosCompraUNIDADES_ORIGINALES: TFloatField;
     xPedidosCompraUNIDADES_SERVIDAS: TFloatField;
     xPedidosCompraUNIDADES_POR_SERVIR: TFloatField;
     xPedidosCompraFECHA_PRE_DET: TDateTimeField;
     xPedidosCompraFECHA_REC_DET: TDateTimeField;
     xPedidosCompraFECHA_CONF_KRI: TDateTimeField;
     xPedidosCompraPLAZO_CONFIRM_KRI: TDateTimeField;
     xPedidosCompraTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     xPedidosCompraUNIDADES_LOGISTICAS: TFloatField;
     xPedidosCompraPROVEEDOR: TIntegerField;
     xPedidosCompraNOMBRE_R_SOCIAL: TFIBStringField;
     xPedidosCompraSU_REFERENCIA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMVerPedidosFECHA_ENTREGA_PREVGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMVerPedidosFECHA_ALBGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMVerPedidosFECHA_RUTAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMVerPedidosAfterOpen(DataSet: TDataSet);
     procedure QMVerPedidosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     procedure BorraSeleccion;
  public
     { Public declarations }
     procedure AbreDatos(Cliente, Modo: integer);
  end;

var
  ZDMVerEstadoPedCli : TZDMVerEstadoPedCli;

implementation

uses UDMMain, UEntorno, HYFIBQuery, DateUtils, UUtiles;

{$R *.dfm}

procedure TZDMVerEstadoPedCli.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMVerPedidos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPedidosCompra, MascaraN, MascaraI, ShortDateFormat);

  BorraSeleccion;
end;

procedure TZDMVerEstadoPedCli.DataModuleDestroy(Sender: TObject);
begin
  BorraSeleccion;
end;

procedure TZDMVerEstadoPedCli.BorraSeleccion;
begin
  // Inicializo el filtro por agrupaciones
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_AGRUPACIONES WHERE ENTRADA = :ENTRADA ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Inicializo el filtro por zonas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ZONAS WHERE ENTRADA = :ENTRADA ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMVerEstadoPedCli.AbreDatos(Cliente, Modo: integer);
begin
  with QMVerPedidos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO_CALCULO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL_CALCULO'].AsInteger := 0; // REntorno.Canal; 0 Para todos los canales
     Params.ByName['CLIENTE_CALCULO'].AsInteger := Cliente;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MODO'].AsInteger := Modo;
     Open;
  end;
end;

procedure TZDMVerEstadoPedCli.QMVerPedidosFECHA_ENTREGA_PREVGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Muestro la fecha previsita de entrega y los dias que faltan desde la fecha actual.
  Text := Format('%s (%d)', [FormatDateTime(ShortDateFormat, QMVerPedidosFECHA_ENTREGA_PREV.AsDateTime), Trunc(QMVerPedidosFECHA_ENTREGA_PREV.AsDateTime - Today)]);
end;

procedure TZDMVerEstadoPedCli.QMVerPedidosFECHA_ALBGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Evito mostar fecha si es nula
  if (TDateTimeField(Sender).AsDateTime < 1) then
     Text := ''
  else
     // Muestro la fecha del albaran y los dias que faltan desde la fecha actual.
     Text := Format('%s (%d)', [FormatDateTime(ShortDateFormat, TDateTimeField(Sender).AsDateTime), Trunc(TDateTimeField(Sender).AsDateTime - Today)]);
end;

procedure TZDMVerEstadoPedCli.QMVerPedidosFECHA_RUTAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Evito mostar fecha si es nula
  if (TDateTimeField(Sender).AsDateTime < 1) then
     Text := ''
  else
     // Muestro la fecha de ruta y los dias que faltan desde la fecha actual.
     Text := Format('%s (%d)', [FormatDateTime(ShortDateFormat, TDateTimeField(Sender).AsDateTime), Trunc(TDateTimeField(Sender).AsDateTime - Today)]);
end;

procedure TZDMVerEstadoPedCli.QMVerPedidosAfterOpen(DataSet: TDataSet);
begin
  xPedidosCompra.Open;
end;

procedure TZDMVerEstadoPedCli.QMVerPedidosBeforeClose(DataSet: TDataSet);
begin
  xPedidosCompra.Close;
end;

end.
