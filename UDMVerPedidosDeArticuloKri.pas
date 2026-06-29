unit UDMVerPedidosDeArticuloKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMVerPedidosDeArticuloKri = class(TDataModule)
     TLocal: THYTransaction;
     xVerPedidos: TFIBDataSetRO;
     xVerPedidosEMPRESA: TIntegerField;
     xVerPedidosEJERCICIO: TIntegerField;
     xVerPedidosCANAL: TIntegerField;
     xVerPedidosSERIE: TFIBStringField;
     xVerPedidosTIPO: TFIBStringField;
     xVerPedidosRIG: TIntegerField;
     xVerPedidosLINEA: TIntegerField;
     xVerPedidosALMACEN: TFIBStringField;
     xVerPedidosALMACEN_TITULO: TFIBStringField;
     xVerPedidosPROVEEDOR: TIntegerField;
     xVerPedidosPROVEEDOR_TITULO: TFIBStringField;
     xVerPedidosARTICULO: TFIBStringField;
     xVerPedidosTITULO: TFIBStringField;
     xVerPedidosUNIDADES: TFloatField;
     xVerPedidosUNIDADES_ORIGINALES: TFloatField;
     xVerPedidosUNIDADES_SERVIDAS: TFloatField;
     xVerPedidosUNIDADES_POR_SERVIR: TFloatField;
     xVerPedidosLINEA_SERVIDA: TIntegerField;
     xVerPedidosPRECIO: TFloatField;
     xVerPedidosDESCUENTO: TFloatField;
     xVerPedidosDESCUENTO_2: TFloatField;
     xVerPedidosDESCUENTO_3: TFloatField;
     xVerPedidosP_COSTE: TFloatField;
     xVerPedidosESTADO: TIntegerField;
     DSxVerPedidos: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Almacen: string; Articulo: string; TodosAlmacenes: boolean);
  end;

var
  DMVerPedidosDeArticuloKri : TDMVerPedidosDeArticuloKri;

implementation

uses UEntorno;

{$R *.dfm}

procedure TDMVerPedidosDeArticuloKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  xVerPedidosPRECIO.DisplayFormat := MascaraN;
  xVerPedidosDESCUENTO.DisplayFormat := MascaraP;
  xVerPedidosDESCUENTO_2.DisplayFormat := MascaraP;
  xVerPedidosDESCUENTO_3.DisplayFormat := MascaraP;
  xVerPedidosUNIDADES.DisplayFormat := MascaraI;
  xVerPedidosP_COSTE.DisplayFormat := MascaraN;
  xVerPedidosUNIDADES_ORIGINALES.DisplayFormat := MascaraI;
  xVerPedidosUNIDADES_SERVIDAS.DisplayFormat := MascaraI;
  xVerPedidosUNIDADES_POR_SERVIR.DisplayFormat := MascaraI;
end;

procedure TDMVerPedidosDeArticuloKri.Inicializa(Almacen: string; Articulo: string; TodosAlmacenes: boolean);
begin
  with xVerPedidos do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_PEDIDOS_POR_PROVEEDOR_KRI ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('(EMPRESA=' + REntorno.EmpresaStr + ') AND ');
     SelectSQL.Add('((EJERCICIO = ' + REntorno.EjercicioStr + ') OR (EJERCICIO = ' +
        IntToStr(REntorno.Ejercicio - 1) + ')) AND ');
     SelectSQL.Add('(CANAL = ' + REntorno.CanalStr + ') AND ');
     SelectSQL.Add('(ARTICULO = ''' + Articulo + ''') ');
     if (not TodosAlmacenes) then
        SelectSQL.Add('AND (ALMACEN = ''' + Almacen + ''') ');
     SelectSQL.Add('ORDER BY ALMACEN,SERIE,RIG');
     Open;
  end;
end;

end.
