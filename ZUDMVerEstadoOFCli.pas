unit ZUDMVerEstadoOFCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO;

type
  TZDMVerEstadoOFCli = class(TDataModule)
     TLocal: THYTransaction;
     xVerPedidos: TFIBDataSetRO;
     xVerPedidosNUM_PEDIDO: TIntegerField;
     xVerPedidosREF_PEDIDO: TFIBStringField;
     xVerPedidosLINEA_PEDIDO: TIntegerField;
     xVerPedidosARTICULO: TFIBStringField;
     xVerPedidosNUM_OF: TIntegerField;
     xVerPedidosLINEA_FASE: TIntegerField;
     xVerPedidosFASE: TFIBStringField;
     xVerPedidosLINEA_TAREA: TIntegerField;
     xVerPedidosTAREA: TFIBStringField;
     xVerPedidosESTADO: TIntegerField;
     xVerPedidosFECHA: TDateTimeField;
     xVerPedidosTIPOFASE: TFIBStringField;
     xVerPedidosTIPOTAREA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreDatos(Cliente: integer);
  end;

var
  ZDMVerEstadoOFCli : TZDMVerEstadoOFCli;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMVerEstadoOFCli.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMVerEstadoOFCli.AbreDatos(Cliente: integer);
begin
  with xVerPedidos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

end.
