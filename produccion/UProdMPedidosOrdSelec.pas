unit UProDMPedidosOrdSelec;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs;

type
  TProDMPedidosOrdSelec = class(TDataModule)
     DSQMSelec: TDataSource;
     QAlmacen: TFIBDataSetRO;
     TLocal: THYTransaction;
     QStock: TFIBDataSetRO;
     DSQStock: TDataSource;
     QVarios: THYFIBQuery;
     QModificarEstado: THYFIBQuery;
     QMarcadosPedidos: TFIBDataSetRO;
     DSMarcados: TDataSource;
     QMarcadosPedidosEMPRESA: TIntegerField;
     QMarcadosPedidosEJERCICIO: TIntegerField;
     QMarcadosPedidosCANAL: TIntegerField;
     QMarcadosPedidosTIPO: TFIBStringField;
     QMarcadosPedidosRIG: TIntegerField;
     QMarcadosPedidosLINEA: TIntegerField;
     QMarcadosPedidosARTICULO: TFIBStringField;
     QMarcadosPedidosTITULO: TFIBStringField;
     QMarcadosPedidosUNIDADES: TFloatField;
     QMarcadosPedidosPRECIO: TFloatField;
     QMarcadosPedidosB_IMPONIBLE: TFloatField;
     QMarcadosPedidosNOTAS: TMemoField;
     QMarcadosPedidosMARCA: TIntegerField;
     QMarcadosPedidosESTADO: TIntegerField;
     QMarcadosPedidosCLIENTE: TIntegerField;
     QMarcadosPedidosALMACEN: TFIBStringField;
     QMarcadosPedidosFECHA_PEDIDO: TDateTimeField;
     QMarcadosPedidosESCANDALLO: TIntegerField;
     QMarcadosPedidosENTRADA: TIntegerField;
     QInsertPedidosOrd: THYFIBQuery;
     QMarcadosPedidosSERIE: TFIBStringField;
     QMarcadosPedidosPRO_UNIDADES: TFloatField;
     QMarcadosPedidosPRO_B_IMPONIBLE: TFloatField;
     QMarcadosPedidosUDS_PRODUCIDAS: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InsertarPedidosOrd(Unidades, Notas, Manual: string);
  end;

var
  ProDMPedidosOrdSelec : TProDMPedidosOrdSelec;

implementation

uses UDMMain, UProDMPedidosOrd, UEntorno;

{$R *.dfm}

procedure TProDMPedidosOrdSelec.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TProDMPedidosOrdSelec.InsertarPedidosOrd(Unidades, Notas, Manual: string);
begin
  // Inserccion en PRO_DET_PEDIDOS_ORD
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO PRO_DET_PEDIDOS_ORD (EMPRESA, EJERCICIO, CANAL, RIG, LINEA, ARTICULO, TITULO, UNIDADES, NOTAS, CLIENTE, ALMACEN, FECHA_PEDIDO, ESCANDALLO, ENTRADA, SERIE) ');
        SQL.Add(' VALUES (?EMPRESA, ?EJERCICIO, ?CANAL, ?RIG, ?LINEA, ?ARTICULO, ?TITULO, ?UNIDADES, ?NOTAS, ?CLIENTE, ?ALMACEN, ?FECHA_PEDIDO, ?ESCANDALLO, ?ENTRADA, ?SERIE) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RIG'].AsInteger := QMarcadosPedidosRig.Value;
        Params.ByName['LINEA'].AsInteger := QMarcadosPedidosLinea.Value;
        Params.ByName['ARTICULO'].AsString := QMarcadosPedidosArticulo.Value;
        Params.ByName['TITULO'].AsString := QMarcadosPedidosTitulo.Value;
        Params.ByName['UNIDADES'].AsFloat := StrToInt(Unidades);
        Params.ByName['NOTAS'].AsString := Notas;
        Params.ByName['CLIENTE'].AsInteger := QMarcadosPedidosCliente.Value;
        Params.ByName['ALMACEN'].AsString := QMarcadosPedidosAlmacen.Value;
        Params.ByName['FECHA_PEDIDO'].AsDateTime := QMarcadosPedidosFECHA_PEDIDO.Value;
        Params.ByName['ESCANDALLO'].AsInteger := QMarcadosPedidosESCANDALLO.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Inserto la generació parcial o total del pedido
  with QInsertPedidosOrd do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['RIG'].AsInteger := QMarcadosPedidosRig.Value;
     Params.ByName['LINEA'].AsInteger := QMarcadosPedidosLinea.Value;
     Params.ByName['RIG_OF'].AsInteger := 0;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Params.ByName['UNIDADES'].AsFloat := StrToInt(Unidades);
     Params.ByName['NOTAS'].AsString := Notas;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['MARCA'].AsInteger := 0;
     Params.ByName['CLIENTE'].AsInteger := QMarcadosPedidosCliente.Value;
     Params.ByName['ALMACEN_LAN'].AsString := QMarcadosPedidosAlmacen.Value;
     Params.ByName['ALMACEN_SAL'].AsString := QMarcadosPedidosAlmacen.Value;
     Params.ByName['ALMACEN_ENT'].AsString := QMarcadosPedidosAlmacen.Value;
     Params.ByName['ARTICULO'].AsString := QMarcadosPedidosArticulo.Value;
     Params.ByName['TITULO'].AsString := QMarcadosPedidosTitulo.Value;
     Params.ByName['FECHA_PEDIDO'].AsDateTime := QMarcadosPedidosFECHA_PEDIDO.Value;
     Params.ByName['ESCANDALLO'].AsInteger := QMarcadosPedidosESCANDALLO.AsInteger;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     if (Manual <> '') then
        Params.ByName['UDS_MANUAL'].AsFloat := StrToInt(Manual)
     else
        Params.ByName['UDS_MANUAL'].AsFloat := 0;
     ExecQuery;
     FreeHandle;
  end;
end;

end.
