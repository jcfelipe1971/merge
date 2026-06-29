unit UDMLstVentasCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstVentasCliente = class(TDataModule)
     TLocal: THYTransaction;
     frDBDSxVentas_Clientes_detalle: TfrDBDataSet;
     frHYVentasClientes: TfrHYReport;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xVentas_Clientes_detalle: TFIBDataSetRO;
     DSxVentas_Clientes_detalle: TDataSource;
     frDBDSxInfoLotes: TfrDBDataSet;
     xInfoLotes: TFIBDataSetRO;
     DSxInfoLotes: TDataSource;
     frxHYVentasClientes: TfrxHYReport;
     xNrosSerie: TFIBDataSetRO;
     DSxNrosSerie: TDataSource;
     frDBxNrosSerie: TfrDBDataSet;
     procedure DMVentasCliCreate(Sender: TObject);
     procedure frHYVentasClientesGetValue(const ParName: string; var ParValue: variant);
     procedure frHYVentasClientesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMVentasCliDestroy(Sender: TObject);
     procedure frxHYVentasClientesBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYVentasClientesGetValue(const VarName: string; var Value: variant);
     procedure xVentas_Clientes_detalleAfterOpen(DataSet: TDataSet);
     procedure xVentas_Clientes_detalleBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     //    Cli:Integer;
     EjercicioDesde, EjercicioHasta, CanalDesde, CanalHasta, ClienteDesde, ClienteHasta, AgenteDesde, AgenteHasta: integer;
     ArticuloDesde, ArticuloHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string;
     FechaDesde, FechaHasta: TDateTime;
     Moneda: string;
     LocalMascaraL: string;
     LocalMascaraN: string;
     LimiteFechas: string;
     MostrarInfoLotes: boolean;
     function DameValoresListado(AgruparAgentes: boolean; Str: string; Orden: integer): string;
  public
     { Public declarations }
     procedure Visualizar(Modo: smallint; Albaran, FacCerrada, FacAbierta, AgruparAgentes, MInfoLotes: boolean; aEjercicioDesde, aEjercicioHasta, aCanalDesde, aCanalHasta, aClienteDesde, aClienteHasta, aAgenteDesde, aAgenteHasta: integer; aArticuloDesde, aArticuloHasta, aFamiliaDesde, aFamiliaHasta, aSerieDesde, aSerieHasta, MonedaListado: string; aFechaDesde, aFechaHasta: TDateTime; Orden: integer);
     procedure CambiaMoneda(Moneda: string);
     procedure Rango(var ArticuloDesde, ArticuloHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string; var ClienteDesde, ClienteHasta, AgenteDesde, AgenteHasta: integer);
  end;

var
  DMLstVentasCliente : TDMLstVentasCliente;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFMListConfig, UUtiles;

{$R *.DFM}

procedure TDMLstVentasCliente.DMVentasCliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);
end;

procedure TDMLstVentasCliente.DMVentasCliDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstVentasCliente.frHYVentasClientesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'CLIENTE' then
  begin
     {
      with SPCliente do
      begin
        close;
        params.ByName['EMPRESA'].AsInteger:=REntorno.Empresa;
        params.ByName['CLIENTE'].AsInteger:=Cli;
        execquery;
        Parvalue:=FieldByName['Nombre_Comercial'].AsString;
        freehandle;
      end;
      }
  end;

  if ParName = 'EjercicioDesde' then
     ParValue := EjercicioDesde;
  if ParName = 'EjercicioHasta' then
     ParValue := EjercicioHasta;
  if ParName = 'CanalDesde' then
     ParValue := CanalDesde;
  if ParName = 'CanalHasta' then
     ParValue := CanalHasta;
  if ParName = 'ClienteDesde' then
     ParValue := ClienteDesde;
  if ParName = 'ClienteHasta' then
     ParValue := ClienteHasta;
  if ParName = 'AgenteDesde' then
     ParValue := AgenteDesde;
  if ParName = 'AgenteHasta' then
     ParValue := AgenteHasta;
  if ParName = 'ArticuloDesde' then
     ParValue := ArticuloDesde;
  if ParName = 'ArticuloHasta' then
     ParValue := ArticuloHasta;
  if ParName = 'FamiliaDesde' then
     ParValue := FamiliaDesde;
  if ParName = 'FamiliaHasta' then
     ParValue := FamiliaHasta;
  if ParName = 'SerieDesde' then
     ParValue := SerieDesde;
  if ParName = 'SerieHasta' then
     ParValue := SerieHasta;
  if ParName = 'FechaDesde' then
     ParValue := FechaDesde;
  if ParName = 'FechaHasta' then
     ParValue := FechaHasta;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;

  if ParName = 'LimiteFechas' then
     ParValue := LimiteFechas;

  if ParName = 'MostrarInfoLotes' then
  begin
     if ((xInfoLotes.RecordCount = 0) and (xNrosSerie.RecordCount = 0)) then
        ParValue := False
     else
        ParValue := MostrarInfoLotes;
  end;
end;

procedure TDMLstVentasCliente.Visualizar(Modo: smallint; Albaran, FacCerrada, FacAbierta, AgruparAgentes, MInfoLotes: boolean; aEjercicioDesde, aEjercicioHasta, aCanalDesde, aCanalHasta, aClienteDesde, aClienteHasta, aAgenteDesde, aAgenteHasta: integer; aArticuloDesde, aArticuloHasta, aFamiliaDesde, aFamiliaHasta, aSerieDesde, aSerieHasta, MonedaListado: string; aFechaDesde, aFechaHasta: TDateTime; Orden: integer);
var
  str, SentenciaSQL : string;
  Grupo : integer;
begin
  sw := 1;

  str := _('Listado de Ventas por Clientes');

  EjercicioDesde := aEjercicioDesde;
  EjercicioHasta := aEjercicioHasta;
  CanalDesde := aCanalDesde;
  CanalHasta := aCanalHasta;
  ClienteDesde := aClienteDesde;
  ClienteHasta := aClienteHasta;
  AgenteDesde := aAgenteDesde;
  AgenteHasta := aAgenteHasta;
  ArticuloDesde := aArticuloDesde;
  ArticuloHasta := aArticuloHasta;
  FamiliaDesde := aFamiliaDesde;
  FamiliaHasta := aFamiliaHasta;
  SerieDesde := aSerieDesde;
  SerieHasta := aSerieHasta;
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;

  Moneda := MonedaListado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);
  DMListados.Normalizar_Desde_Hasta(AgenteDesde, AgenteHasta);

  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');

  LimiteFechas := Format(_('Desde %s Hasta %s'), [DateToStr(FechaDesde), DateToStr(FechaHasta)]);

  MostrarInfoLotes := MInfoLotes;

  Grupo := 140;
  if (AgruparAgentes) then
     Grupo := 511;

  SentenciaSQL := DameValoresListado(AgruparAgentes, Str, Orden);

  with xVentas_Clientes_detalle do
  begin
     Close;
     SelectSQL.Text := SentenciaSQL;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIOD'].AsInteger := EjercicioDesde;
     Params.ByName['EJERCICIOH'].AsInteger := EjercicioHasta;
     Params.ByName['CANALD'].AsInteger := CanalDesde;
     Params.ByName['CANALH'].AsInteger := CanalHasta;
     Params.ByName['SERIED'].AsString := SerieDesde;
     Params.ByName['SERIEH'].AsString := SerieHasta;
     Params.ByName['CLIENTED'].AsInteger := ClienteDesde;
     Params.ByName['CLIENTEH'].AsInteger := ClienteHasta;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['FACTURAS_ABIERTAS'].AsInteger := BoolToInt(FacAbierta);
     Params.ByName['FACTURAS_CERRADAS'].AsInteger := BoolToInt(FacCerrada);
     Params.ByName['ALBARANES'].AsInteger := BoolToInt(Albaran);
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ARTICULOD'].AsString := ArticuloDesde;
     Params.ByName['ARTICULOH'].AsString := ArticuloHasta;
     Params.ByName['FAMILIAD'].AsString := FamiliaDesde;
     Params.ByName['FAMILIAH'].AsString := FamiliaHasta;
     Params.ByName['FECHAD'].AsDateTime := FechaDesde;
     Params.ByName['FECHAH'].AsDateTime := FechaHasta;
     Params.ByName['AGENTED'].AsInteger := AgenteDesde;
     Params.ByName['AGENTEH'].AsInteger := AgenteHasta;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', str, frHYVentasClientes, frxHYVentasClientes, nil);
end;

procedure TDMLstVentasCliente.frHYVentasClientesEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstVentasCliente.CambiaMoneda(Moneda: string);
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

procedure TDMLstVentasCliente.Rango(var ArticuloDesde, ArticuloHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string; var ClienteDesde, ClienteHasta, AgenteDesde, AgenteHasta: integer);
begin
  DameMinMax('CLI', ClienteDesde, ClienteHasta);
  DameMinMax('ART', ArticuloDesde, ArticuloHasta);
  DameMinMax('FAM', FamiliaDesde, FamiliaHasta);
  DameMinMax('SER', SerieDesde, SerieHasta);
  DameMinMax('AGE', AgenteDesde, AgenteHasta);
end;

function TDMLstVentasCliente.DameValoresListado(AgruparAgentes: boolean; Str: string; Orden: integer): string;
begin
  Result := 'SELECT * FROM G_VENTAS_ARTICULOS_CLIENTE_DOC (?EMPRESA, ?EJERCICIOD, ?EJERCICIOH,' +
     '?CANALD, ?CANALH, ?SERIED, ?SERIEH,' +
     '?CLIENTED, ?CLIENTEH, ?ENTRADA,' +
     '?MONEDA, ?ALBARANES, ?FACTURAS_ABIERTAS, ?FACTURAS_CERRADAS,' +
     '?ARTICULOD, ?ARTICULOH, ?FAMILIAD, ?FAMILIAH,' +
     '?FECHAD, ?FECHAH, ?AGENTED, ?AGENTEH)';
  if (AgruparAgentes) then
  begin
     case orden of
        0: Result := Result + ' ORDER BY AGENTE, FECHA, CLIENTE, DOC_CANAL, DOC_TIPO, DOC_SERIE, DOC_RIG';
        1: Result := Result + ' ORDER BY AGENTE, CLIENTE, ARTICULO, FECHA, DOC_CANAL, DOC_TIPO, DOC_SERIE, DOC_RIG';
     end;
     Str := _('Listado de Ventas Detallado por Agente');
  end
  else
  begin
     case Orden of
        0: Result := Result + ' ORDER BY CLIENTE, FECHA, DOC_CANAL, DOC_TIPO, DOC_SERIE, DOC_RIG';
        1: Result := Result + ' ORDER BY CLIENTE, ARTICULO, FECHA, DOC_CANAL, DOC_TIPO, DOC_SERIE, DOC_RIG';
     end;
     Str := _('Listado de Ventas por Clientes');
  end;
end;

procedure TDMLstVentasCliente.frxHYVentasClientesBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstVentasCliente.frxHYVentasClientesGetValue(const VarName: string; var Value: variant);
begin
  frHYVentasClientesGetValue(VarName, Value);
end;

procedure TDMLstVentasCliente.xVentas_Clientes_detalleAfterOpen(DataSet: TDataSet);
begin
  if (MostrarInfoLotes) then
  begin
     xInfoLotes.Open;
     xNrosSerie.Open;
  end;
end;

procedure TDMLstVentasCliente.xVentas_Clientes_detalleBeforeClose(DataSet: TDataSet);
begin
  xInfoLotes.Close;
  xNrosSerie.Close;
end;

end.
