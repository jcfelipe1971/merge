unit UDMRelacionPedidosVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMRelacionPedidosVenta = class(TDataModule)
     DSQMPedidos: TDataSource;
     QMPedidos: TFIBTableSetRO;
     QMPedidosEMPRESA: TIntegerField;
     QMPedidosEJERCICIO: TIntegerField;
     QMPedidosCANAL: TIntegerField;
     QMPedidosSERIE: TFIBStringField;
     QMPedidosTIPO: TFIBStringField;
     QMPedidosRIG: TIntegerField;
     QMPedidosALMACEN: TFIBStringField;
     QMPedidosMONEDA: TFIBStringField;
     QMPedidosFECHA: TDateTimeField;
     QMPedidosTERCERO: TIntegerField;
     QMPedidosTITULO: TFIBStringField;
     QMPedidosDIRECCION: TIntegerField;
     QMPedidosCLIENTE: TIntegerField;
     QMPedidosCONTACTO: TIntegerField;
     QMPedidosSU_REFERENCIA: TFIBStringField;
     QMPedidosFORMA_PAGO: TFIBStringField;
     QMPedidosCAMPANYA: TIntegerField;
     QMPedidosNOTAS: TBlobField;
     QMPedidosESTADO: TIntegerField;
     QMPedidosBULTOS: TIntegerField;
     QMPedidosLINEAS: TIntegerField;
     QMPedidosBRUTO: TFloatField;
     QMPedidosI_DTO_LINEAS: TFloatField;
     QMPedidosS_BASES: TFloatField;
     QMPedidosM_BRUTO: TFloatField;
     QMPedidosC_TOTAL: TFloatField;
     QMPedidosAGENTE: TIntegerField;
     QMPedidosS_CUOTA_IVA: TFloatField;
     QMPedidosS_CUOTA_RE: TFloatField;
     QMPedidosB_DTO_LINEAS: TFloatField;
     QMPedidosDTO_PP: TFloatField;
     QMPedidosDTO_CIAL: TFloatField;
     QMPedidosI_DTO_CIAL: TFloatField;
     QMPedidosI_DTO_PP: TFloatField;
     QMPedidosB_COMISION: TFloatField;
     QMPedidosI_COMISION: TFloatField;
     QMPedidosPOR_FINANCIACION: TFloatField;
     QMPedidosI_FINANCIACION: TFloatField;
     QMPedidosLIQUIDO: TFloatField;
     QMPedidosENTRADA: TIntegerField;
     QMPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosFECHA_REC_CAB: TDateTimeField;
     QMPedidosSERVIDO: TIntegerField;
     QMPedidosNOMBRE_COMERCIAL: TFIBStringField;
     QMPedidosPORTES: TIntegerField;
     QMPedidosTARIFA: TFIBStringField;
     QMPedidosAGRUPACION_KRI: TIntegerField;
     QMPedidosID_S: TIntegerField;
     QMPedidosIDIOMA: TFIBStringField;
     QMPedidosUSUARIO: TIntegerField;
     QMPedidosMARGEN_KRI: TFloatField;
     QMPedidosTIPO_PORTES: TIntegerField;
     QMPedidosPOR_PORTES: TFloatField;
     QMPedidosI_PORTES: TFloatField;
     QMPedidosI_PORTES_CANAL: TFloatField;
     QMPedidosCAMBIO_FIJO: TIntegerField;
     QMPedidosVALOR_CAMB_FIJO: TFloatField;
     QMPedidosPROYECTO: TIntegerField;
     QMPedidosNOTAS_INTERNAS_KRI: TBlobField;
     QMPedidosTIPO_LINEA_KRI: TIntegerField;
     QMPedidosFECHA_CLIENTE: TDateTimeField;
     QMPedidosTIT_CONTACTO: TFIBStringField;
     QMPedidosFECHA_CREACION_KRI: TDateTimeField;
     QMPedidosPEDIDO_CLIENTE: TFIBStringField;
     QMPedidosRANGO: TIntegerField;
     QMPedidosINDICE: TIntegerField;
     QMPedidosTRANSPORTISTA: TIntegerField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar(Serie: string; DesdeCliente, HastaCliente, DesdePedido, HastaPedido, Estado: integer);
  end;

var
  DMRelacionPedidosVenta : TDMRelacionPedidosVenta;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMRelacionPedidosVenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMPedidosFECHA.DisplayFormat := ShortDateFormat;
  QMPedidosFECHA_ENTREGA_PREV.DisplayFormat := ShortDateFormat;
  QMPedidosFECHA_REC_CAB.DisplayFormat := ShortDateFormat;
  QMPedidosLIQUIDO.DisplayFormat := MascaraN;

  DMMain.FiltraRO(QMPedidos, '10100', True);
end;

procedure TDMRelacionPedidosVenta.Filtrar(Serie: string; DesdeCliente, HastaCliente, DesdePedido, HastaPedido, Estado: integer);
begin
  with QMPedidos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' TIPO = ''PEC'' ');
     if (Serie <> '') then
        SelectSQL.Add(' AND SERIE = ?SERIE ');
     if (Estado = 1) then
        SelectSQL.Add(' AND ESTADO = 0 ');
     if (Estado = 2) then
        SelectSQL.Add(' AND ESTADO = 5 ');

     if (HastaCliente <> 0) then
        SelectSQL.Add(' AND CLIENTE BETWEEN ?DESDE_CLIENTE AND ?HASTA_CLIENTE ')
     else
     if (DesdeCliente <> 0) then
        SelectSQL.Add(' AND CLIENTE = ?CLIENTE ');

     if (HastaPedido <> 0) then
        SelectSQL.Add(' AND RIG BETWEEN ?DESDE_RIG AND ?HASTA_RIG ')
     else
     if (DesdePedido <> 0) then
        SelectSQL.Add(' AND RIG = ?RIG ');

     SelectSQL.Add(' ORDER BY EJERCICIO, SERIE, RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;

     if (HastaCliente <> 0) then
     begin
        Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
        Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     end
     else
     if (DesdeCliente <> 0) then
        Params.ByName['CLIENTE'].AsInteger := DesdeCliente;

     if (HastaPedido <> 0) then
     begin
        Params.ByName['DESDE_RIG'].AsInteger := DesdePedido;
        Params.ByName['HASTA_RIG'].AsInteger := HastaPedido;
     end
     else
     if (DesdePedido <> 0) then
        Params.ByName['RIG'].AsInteger := DesdePedido;

     Open;
  end;
end;

end.
