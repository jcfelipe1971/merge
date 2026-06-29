unit ZUDMVentasPedidosLineal;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSet, FIBQuery,
  HYFIBQuery, FIBTableDataSet, ExtCtrls, jpeg;

type
  TZDMVentasPedidosLineal = class(TDataModule)
     TLocal: THYTransaction;
     frDBPedidosLineal: TfrDBDataSet;
     frPedidosLineal: TfrHYReport;
     DSxListado: TDataSource;
     xListado: TFIBDataSetRO;
     xListadoZ_ARM_LINEA: TFloatField;
     xListadoSUM: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frPedidosLinealGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     fecha_desde_listado: TDateTime;
     fecha_hasta_listado: TDateTime;
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(fecha_desde, fecha_hasta: TDateTime; tipo, grupo: integer);
  end;

var
  ZDMVentasPedidosLineal : TZDMVentasPedidosLineal;

implementation

uses UDMMain, UEntorno, UFBusca, UDMListados, UFormGest, Mask;

{$R *.dfm}

procedure TZDMVentasPedidosLineal.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMVentasPedidosLineal.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMVentasPedidosLineal.MostrarListado(fecha_desde, fecha_hasta: TDateTime; tipo, grupo: integer);
var
  str : string;
begin
  fecha_desde_listado := fecha_desde;
  fecha_hasta_listado := fecha_hasta;
  with xListado do
  begin
     Close;
     Params.ByName['FECHA_DESDE'].AsDateTime := fecha_desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := fecha_hasta;
     Open;
  end;

  DMListados.Imprimir(grupo, tipo, '', str, frPedidosLineal, nil);
end;

procedure TZDMVentasPedidosLineal.frPedidosLinealGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'Empresa') then
     ParValue := REntorno.Empresa;

  if (ParName = 'FechaListado') then
     ParValue := DateToStr(Date);

  if (ParName = 'FechaDesde') then
     ParValue := DateToStr(fecha_desde_listado);

  if (ParName = 'FechaHasta') then
     ParValue := DateToStr(fecha_hasta_listado);
end;

end.
