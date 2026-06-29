unit UDMLstVentasCliAge;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstVentasCliAge = class(TDataModule)
     TLocal: THYTransaction;
     frDBDSxVentas_Clientes_agentes_detalle: TfrDBDataSet;
     frHYVentasClientesAgentes: TfrHYReport;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xVentas_Clientes_agentes_detalle: TFIBDataSetRO;
     DSxVentas_Clientes_agentes_detalle: TDataSource;
     xArt_Desde: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     xArt_Hasta: TFIBDataSetRO;
     xFam_Desde: TFIBDataSetRO;
     DSxFam_Desde: TDataSource;
     DSxFam_Hasta: TDataSource;
     xFam_Hasta: TFIBDataSetRO;
     xCli_Desde: TFIBDataSetRO;
     DSxCli_Desde: TDataSource;
     DSxCli_Hasta: TDataSource;
     xCli_Hasta: TFIBDataSetRO;
     DSxSerie_Desde: TDataSource;
     xSerie_Desde: TFIBDataSetRO;
     xSerie_Hasta: TFIBDataSetRO;
     DSxSerie_Hasta: TDataSource;
     xAgente_Hasta: TFIBDataSetRO;
     xAgente_Desde: TFIBDataSetRO;
     DSxAgente_Desde: TDataSource;
     DSxAgente_Hasta: TDataSource;
     xVentas_Clientes_agentes_detalleCLIENTE: TIntegerField;
     xVentas_Clientes_agentes_detalleAGENTE: TIntegerField;
     xVentas_Clientes_agentes_detalleTITULO_CLIENTE: TFIBStringField;
     xVentas_Clientes_agentes_detalleTITULO_AGENTE: TFIBStringField;
     xVentas_Clientes_agentes_detalleENERO: TFloatField;
     xVentas_Clientes_agentes_detalleFEBRERO: TFloatField;
     xVentas_Clientes_agentes_detalleMARZO: TFloatField;
     xVentas_Clientes_agentes_detalleABRIL: TFloatField;
     xVentas_Clientes_agentes_detalleMAYO: TFloatField;
     xVentas_Clientes_agentes_detalleJUNIO: TFloatField;
     xVentas_Clientes_agentes_detalleJULIO: TFloatField;
     xVentas_Clientes_agentes_detalleAGOSTO: TFloatField;
     xVentas_Clientes_agentes_detalleSEPTIEMBRE: TFloatField;
     xVentas_Clientes_agentes_detalleOCTUBRE: TFloatField;
     xVentas_Clientes_agentes_detalleNOVIEMBRE: TFloatField;
     xVentas_Clientes_agentes_detalleDICIEMBRE: TFloatField;
     xVentas_Clientes_agentes_detalleUENERO: TFloatField;
     xVentas_Clientes_agentes_detalleUFEBRERO: TFloatField;
     xVentas_Clientes_agentes_detalleUMARZO: TFloatField;
     xVentas_Clientes_agentes_detalleUABRIL: TFloatField;
     xVentas_Clientes_agentes_detalleUMAYO: TFloatField;
     xVentas_Clientes_agentes_detalleUJUNIO: TFloatField;
     xVentas_Clientes_agentes_detalleUJULIO: TFloatField;
     xVentas_Clientes_agentes_detalleUAGOSTO: TFloatField;
     xVentas_Clientes_agentes_detalleUSEPTIEMBRE: TFloatField;
     xVentas_Clientes_agentes_detalleUOCTUBRE: TFloatField;
     xVentas_Clientes_agentes_detalleUNOVIEMBRE: TFloatField;
     xVentas_Clientes_agentes_detalleUDICIEMBRE: TFloatField;
     frxHYVentasClientesAgentes: TfrxHYReport;
     procedure DMVentasCliCreate(Sender: TObject);
     procedure frHYVentasClientesAgentesGetValue(const ParName: string; var ParValue: variant);
     procedure frHYVentasClientesAgentesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMVentasCliDestroy(Sender: TObject);
     procedure frxHYVentasClientesAgentesBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYVentasClientesAgentesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     MonedaListado: string;
     LocalMascaraL: string;
     LocalMascaraN: string;
     Facturas: smallint;
  public
     { Public declarations }
     procedure Visualizar(Modo, UnificaClientes, UnificaAgentes, aFacturas: smallint; EjercicioD, CanalD, CanalH, ClienteD, ClienteH, AgenteD, AgenteH: integer; ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH, aMonedaListado: string);
     procedure CambiaMoneda(Moneda: string);
     procedure Rango1(var ArticuloD, ArticuloH: string; var ClienteD, ClienteH, AgenteD, AgenteH: integer; var FamiliaD, FamiliaH, SerieD, SerieH: string);
  end;

var
  DMLstVentasCliAge : TDMLstVentasCliAge;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFMListConfig, UUtiles;

{$R *.DFM}

procedure TDMLstVentasCliAge.DMVentasCliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);
end;

procedure TDMLstVentasCliAge.frHYVentasClientesAgentesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Fact' then
     ParValue := Facturas;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := MonedaListado;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMLstVentasCliAge.Visualizar(Modo, UnificaClientes, UnificaAgentes, aFacturas: smallint; EjercicioD, CanalD, CanalH, ClienteD, ClienteH, AgenteD, AgenteH: integer; ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH, aMonedaListado: string);
begin
  sw := 1;
  Facturas := aFacturas;

  MonedaListado := aMonedaListado;
  LocalMascaraN := DMMain.MascaraMoneda(MonedaListado, 1);
  LocalMascaraL := DMMain.MascaraMoneda(MonedaListado, 0);

  with xVentas_Clientes_agentes_detalle do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioD;
     Params.ByName['CANALD'].AsInteger := CanalD;
     Params.ByName['CANALH'].AsInteger := CanalH;
     Params.ByName['SERIED'].AsString := SerieD;
     Params.ByName['SERIEH'].AsString := SerieH;
     Params.ByName['ARTICULOD'].AsString := ArticuloD;
     Params.ByName['ARTICULOH'].AsString := ArticuloH;
     Params.ByName['FAMILIAD'].AsString := FamiliaD;
     Params.ByName['FAMILIAH'].AsString := FamiliaH;
     Params.ByName['CLIENTED'].AsInteger := ClienteD;
     Params.ByName['CLIENTEH'].AsInteger := ClienteH;
     Params.ByName['AGENTED'].AsInteger := AgenteD;
     Params.ByName['AGENTEH'].AsInteger := AgenteH;
     Params.ByName['UNIFICAR_CLIENTES'].AsInteger := UnificaClientes;
     Params.ByName['UNIFICAR_AGENTES'].AsInteger := UnificaAgentes;
     Params.ByName['FACTURAS'].AsInteger := Facturas;
     Params.ByName['MONEDA'].AsString := MonedaListado;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Imprimir(159, 0, Modo, '', _('Listado de Ventas por Agentes-Clientes-Meses'), frHYVentasClientesAgentes, frxHYVentasClientesAgentes, nil, nil);
end;

procedure TDMLstVentasCliAge.frHYVentasClientesAgentesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMLstVentasCliAge.DMVentasCliDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstVentasCliAge.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);
end;

procedure TDMLstVentasCliAge.Rango1(var ArticuloD, ArticuloH: string; var ClienteD, ClienteH, AgenteD, AgenteH: integer; var FamiliaD, FamiliaH, SerieD, SerieH: string);
begin
  DameMinMax('CLI', ClienteD, ClienteH);
  DameMinMax('AGE', AgenteD, AgenteH);
  DameMinMax('ART', ArticuloD, ArticuloH);
  DameMinMax('FAM', FamiliaD, FamiliaH);
  DameMinMax('SER', SerieD, SerieH);
end;

procedure TDMLstVentasCliAge.frxHYVentasClientesAgentesBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstVentasCliAge.frxHYVentasClientesAgentesGetValue(const VarName: string; var Value: variant);
begin
  frHYVentasClientesAgentesGetValue(VarName, Value);
end;

end.
