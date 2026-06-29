unit UDMLstVentasAgente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstVentasAgente = class(TDataModule)
     TLocal: THYTransaction;
     frDBDSxVentas_Agente_detalle: TfrDBDataSet;
     frHYVentasAgentes: TfrHYReport;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xVentas_Agente_detalle: TFIBDataSetRO;
     DSxVentas_Agente_detalle: TDataSource;
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
     xAgenteD: TFIBDataSetRO;
     xAgenteH: TFIBDataSetRO;
     DSxAgenteD: TDataSource;
     DSxAgenteH: TDataSource;
     frDBDSxVentas_Agente_detalle_PREV: TfrDBDataSet;
     xVentas_Agente_detalle_PREV: TFIBDataSetRO;
     DSxVentas_Agente_detalle_PREV: TDataSource;
     frDBDSxInfoLotes: TfrDBDataSet;
     xInfoLotes: TFIBDataSetRO;
     DSxInfoLotes: TDataSource;
     frxHYVentasAgentes: TfrxHYReport;
     procedure DMVentasAgeCreate(Sender: TObject);
     procedure frHYVentasAgenteGetValue(const ParName: string; var ParValue: variant);
     procedure frHYVentasAgentesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMVentasAgeDestroy(Sender: TObject);
     procedure xVentas_Agente_detalleAfterScroll(DataSet: TDataSet);
     procedure frxHYVentasAgentesBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYVentasAgentesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     // Cli:Integer;
     Moneda: string;
     LocalMascaraL: string;
     LimiteFechas: string;
     MostrarInfoLotes: boolean;
     // function DameValoresListado(AgruparAgentes: smallint; var Grupo: integer; Str: string): string;
  public
     { Public declarations }
     LocalMascaraN: string;
     procedure Visualizar(Modo, Albaran, FacCerrada, FacAbierta: smallint; MInfoLotes: boolean; EjerD, EjerH, CanalD, CanalH, CliD, CliH, AgenteD, AgenteH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; FechaD, FechaH: TDateTime);
     procedure VisualizarPREVISION(Modo, Albaran, FacCerrada, FacAbierta: smallint; MInfoLotes: boolean; EjerD, EjerH, CanalD, CanalH, CliD, CliH, AgenteD, AgenteH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; FechaD, FechaH: TDateTime);
     procedure VisualizarResumen(Modo, Albaran, FacCerrada, FacAbierta: smallint; MInfoLotes: boolean; EjerD, EjerH, CanalD, CanalH, CliD, CliH, AgenteD, AgenteH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; FechaD, FechaH: TDateTime);
     procedure CambiaMoneda(Moneda: string);
     procedure Rango1(var ClienteD, ClienteH, AgenteD, AgenteH: integer; var ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH: string);
     procedure DameTituloAgente(Modo: byte; Agente: string);
  end;

var
  DMLstVentasAgente : TDMLstVentasAgente;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMLstVentasAgente.DMVentasAgeCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);
end;

procedure TDMLstVentasAgente.DMVentasAgeDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstVentasAgente.frHYVentasAgenteGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  {if ParName = 'CLIENTE' then
  begin
     {with SPCliente do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cli;
        ExecQuery;
        ParValue := FieldByName['Nombre_Comercial'].AsString;
        FreeHandle;
     end;
  end;}

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
     if (xInfoLotes.RecordCount = 0) then
        ParValue := False
     else
        ParValue := MostrarInfoLotes;
  end;
end;

procedure TDMLstVentasAgente.Visualizar(Modo, Albaran, FacCerrada, FacAbierta: smallint; MInfoLotes: boolean; EjerD, EjerH, CanalD, CanalH, CliD, CliH, AgenteD, AgenteH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; FechaD, FechaH: TDateTime);
var
  Serie, Titulo : string;
  Grupo : integer;
begin
  sw := 1;
  Serie := '';
  Titulo := _('Listado de Ventas por Clientes');

  Moneda := Moneda_listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  DMListados.Normalizar_Desde_Hasta(AgenteD, AgenteH);

  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  LimiteFechas := Format(_('Desde %s Hasta %s'), [DateToStr(FechaD), DateToStr(FechaH)]);

  MostrarInfoLotes := MInfoLotes;

  Grupo := 163;

  with xVentas_Agente_detalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM G_VENTAS_ARTICULOS_AGENTE_DOC (?EMPRESA, ?EJERCICIOD, ?EJERCICIOH, ');
     SelectSQL.Add(' ?CANALD, ?CANALH, ?SERIED, ?SERIEH, ');
     SelectSQL.Add(' ?CLIENTED, ?CLIENTEH, ?ENTRADA, ');
     SelectSQL.Add(' ?MONEDA, ?ALBARANES, ?FACTURAS_ABIERTAS, ?FACTURAS_CERRADAS, ');
     SelectSQL.Add(' ?ARTICULOD, ?ARTICULOH, ?FAMILIAD, ?FAMILIAH, ');
     SelectSQL.Add(' ?FECHAD, ?FECHAH, ?AGENTED, ?AGENTEH) ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIOD'].AsInteger := EjerD;
     Params.ByName['EJERCICIOH'].AsInteger := EjerH;
     Params.ByName['CANALD'].AsInteger := CanalD;
     Params.ByName['CANALH'].AsInteger := CanalH;
     Params.ByName['SERIED'].AsString := SerieD;
     Params.ByName['SERIEH'].AsString := SerieH;
     Params.ByName['CLIENTED'].AsInteger := CliD;
     Params.ByName['CLIENTEH'].AsInteger := CliH;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALBARANES'].AsInteger := albaran;
     Params.ByName['FACTURAS_ABIERTAS'].AsInteger := facabierta;
     Params.ByName['FACTURAS_CERRADAS'].AsInteger := faccerrada;
     Params.ByName['ARTICULOD'].AsString := ArtD;
     Params.ByName['ARTICULOH'].AsString := ArtH;
     Params.ByName['FAMILIAD'].AsString := FamD;
     Params.ByName['FAMILIAH'].AsString := FamH;
     Params.ByName['FECHAD'].AsDateTime := FechaD;
     Params.ByName['FECHAH'].AsDateTime := FechaH;
     Params.ByName['AGENTED'].AsInteger := AgenteD;
     Params.ByName['AGENTEH'].AsInteger := AgenteH;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, Serie, Titulo, frHYVentasAgentes, frxHYVentasAgentes, nil);
end;

procedure TDMLstVentasAgente.VisualizarPREVISION(Modo, Albaran, FacCerrada, FacAbierta: smallint; MInfoLotes: boolean; EjerD, EjerH, CanalD, CanalH, CliD, CliH, AgenteD, AgenteH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; FechaD, FechaH: TDateTime);
var
  Serie, Titulo : string;
  Grupo : integer;
begin
  sw := 1;
  Serie := '';
  Titulo := _('Listado de Ventas por Clientes');

  Moneda := Moneda_listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  DMListados.Normalizar_Desde_Hasta(AgenteD, AgenteH);

  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  LimiteFechas := Format(_('Desde %s Hasta %s'), [DateToStr(FechaD), DateToStr(FechaH)]);

  MostrarInfoLotes := MInfoLotes;

  Grupo := 164;
  //SentenciaSQL := DameValoresListado(AgruparAgentes, Grupo, Str);

  with xVentas_Agente_detalle_PREV do
  begin
     Close;
     //SelectSQL.Text := SentenciaSQL;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIOD'].AsInteger := EjerD;
     Params.ByName['EJERCICIOH'].AsInteger := EjerH;
     Params.ByName['CANALD'].AsInteger := CanalD;
     Params.ByName['CANALH'].AsInteger := CanalH;
     Params.ByName['SERIED'].AsString := SerieD;
     Params.ByName['SERIEH'].AsString := SerieH;
     Params.ByName['CLIENTED'].AsInteger := CliD;
     Params.ByName['CLIENTEH'].AsInteger := CliH;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALBARANES'].AsInteger := albaran;
     Params.ByName['FACTURAS_ABIERTAS'].AsInteger := facabierta;
     Params.ByName['FACTURAS_CERRADAS'].AsInteger := faccerrada;
     Params.ByName['ARTICULOD'].AsString := ArtD;
     Params.ByName['ARTICULOH'].AsString := ArtH;
     Params.ByName['FAMILIAD'].AsString := FamD;
     Params.ByName['FAMILIAH'].AsString := FamH;
     Params.ByName['FECHAD'].AsDateTime := FechaD;
     Params.ByName['FECHAH'].AsDateTime := FechaH;
     Params.ByName['AGENTED'].AsInteger := AgenteD;
     Params.ByName['AGENTEH'].AsInteger := AgenteH;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, Serie, Titulo, frHYVentasAgentes, frxHYVentasAgentes, nil);
end;

procedure TDMLstVentasAgente.VisualizarResumen(Modo, Albaran, FacCerrada, FacAbierta: smallint; MInfoLotes: boolean; EjerD, EjerH, CanalD, CanalH, CliD, CliH, AgenteD, AgenteH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; FechaD, FechaH: TDateTime);
var
  Serie, Titulo : string;
  Grupo : integer;
begin
  sw := 1;
  Serie := '';
  Titulo := _('Listado de Resumen de Comisiones de Agente');

  Moneda := Moneda_listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  DMListados.Normalizar_Desde_Hasta(AgenteD, AgenteH);

  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  LimiteFechas := Format(_('Desde %s Hasta %s'), [DateToStr(FechaD), DateToStr(FechaH)]);

  MostrarInfoLotes := MInfoLotes;

  Grupo := 165;

  // Se ordena por COMISION_POR para poder agruparlas (ABSHOT)
  with xVentas_Agente_detalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM G_VENTAS_ARTICULOS_AGENTE_DOC (?EMPRESA, ?EJERCICIOD, ?EJERCICIOH, ');
     SelectSQL.Add(' ?CANALD, ?CANALH, ?SERIED, ?SERIEH, ');
     SelectSQL.Add(' ?CLIENTED, ?CLIENTEH, ?ENTRADA, ');
     SelectSQL.Add(' ?MONEDA, ?ALBARANES, ?FACTURAS_ABIERTAS, ?FACTURAS_CERRADAS, ');
     SelectSQL.Add(' ?ARTICULOD, ?ARTICULOH, ?FAMILIAD, ?FAMILIAH, ');
     SelectSQL.Add(' ?FECHAD, ?FECHAH, ?AGENTED, ?AGENTEH) ');
     SelectSQL.Add(' ORDER BY DOC_EMPRESA, AGENTE, DOC_EJERCICIO, DOC_CANAL, DOC_SERIE, DOC_RIG, COMISION_POR, DOC_LINEA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIOD'].AsInteger := EjerD;
     Params.ByName['EJERCICIOH'].AsInteger := EjerH;
     Params.ByName['CANALD'].AsInteger := CanalD;
     Params.ByName['CANALH'].AsInteger := CanalH;
     Params.ByName['SERIED'].AsString := SerieD;
     Params.ByName['SERIEH'].AsString := SerieH;
     Params.ByName['CLIENTED'].AsInteger := CliD;
     Params.ByName['CLIENTEH'].AsInteger := CliH;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALBARANES'].AsInteger := albaran;
     Params.ByName['FACTURAS_ABIERTAS'].AsInteger := facabierta;
     Params.ByName['FACTURAS_CERRADAS'].AsInteger := faccerrada;
     Params.ByName['ARTICULOD'].AsString := ArtD;
     Params.ByName['ARTICULOH'].AsString := ArtH;
     Params.ByName['FAMILIAD'].AsString := FamD;
     Params.ByName['FAMILIAH'].AsString := FamH;
     Params.ByName['FECHAD'].AsDateTime := FechaD;
     Params.ByName['FECHAH'].AsDateTime := FechaH;
     Params.ByName['AGENTED'].AsInteger := AgenteD;
     Params.ByName['AGENTEH'].AsInteger := AgenteH;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, Serie, Titulo, frHYVentasAgentes, frxHYVentasAgentes, nil);
end;

procedure TDMLstVentasAgente.frHYVentasAgentesEnterRect(Memo: TStringList; View: TfrView);
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
     if (Pos('[MascaraP]', Memo[0]) > 0) then
        View.FormatStr := MascaraP;
  end;
end;

procedure TDMLstVentasAgente.CambiaMoneda(Moneda: string);
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

procedure TDMLstVentasAgente.Rango1(var ClienteD, ClienteH, AgenteD, AgenteH: integer; var ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH: string);
begin
  DameMinMax('CLI', ClienteD, ClienteH);
  DameMinMax('ART', ArticuloD, ArticuloH);
  DameMinMax('FAM', FamiliaD, FamiliaH);
  DameMinMax('SER', SerieD, SerieH);
  DameMinMax('AGE', AgenteD, AgenteH);
end;

procedure TDMLstVentasAgente.xVentas_Agente_detalleAfterScroll(DataSet: TDataSet);
begin
  if (MostrarInfoLotes) then
  begin
     xInfoLotes.Close;
     xInfoLotes.Open;
  end;
end;

procedure TDMLstVentasAgente.DameTituloAgente(Modo: byte; Agente: string);
begin
  case Modo of
     0: with xAgenteD do
        begin
           Close;
           Params.ByName['EMPRESA'].AsString := REntorno.EmpresaStr;
           Params.ByName['AGENTE'].AsInteger := StrToInt(Agente);
           Open;
        end;
     1: with xAgenteH do
        begin
           Close;
           Params.ByName['EMPRESA'].AsString := REntorno.EmpresaStr;
           Params.ByName['AGENTE'].AsInteger := StrToInt(Agente);
           Open;
        end;
  end;
end;

(*
function TDMLstVentasAgente.DameValoresListado(AgruparAgentes: smallint; var Grupo: integer; Str: string): string;
begin
  {case AgruparAgentes of
    0:
      begin
        grupo  := 140;
        Result := 'SELECT * FROM g_ventas_articulos_agente_doc (?empresa,?ejercicioD,?ejercicioH,' +
          '?canalD,?canalH,?serieD,?serieH,' +
          '?clienteD,?clienteh, ?entrada,' +
          '?moneda, ?Albaranes, ?facturas_abiertas, ?facturas_cerradas,' +
          '?articuloD, ?articuloH, ?familiaD,?familiaH,' +
          '?fechaD, ?fechaH,?AgenteD,?AgenteH)' +
          'order by cliente,fecha,doc_canal,doc_tipo,doc_serie,doc_rig';
        Str    := 'Listado de Comisiones Detalladas por Agente';
      end;
    1:
      begin
        //grupo  := 511;
        grupo := 140;
        Result := 'SELECT * FROM g_ventas_articulos_agente_doc (?empresa,?ejercicioD,?ejercicioH,' +
          '?canalD,?canalH,?serieD,?serieH,' +
          '?clienteD,?clienteh, ?entrada,' +
          '?moneda, ?Albaranes, ?facturas_abiertas, ?facturas_cerradas,' +
          '?articuloD, ?articuloH, ?familiaD,?familiaH,' +
          '?fechaD, ?fechaH,?AgenteD,?AgenteH)' +
          'order by agente,fecha,cliente,doc_canal,doc_tipo,doc_serie,doc_rig';
        Str    := 'Listado de Comisiones Detalladas por Agente';
      end;
  end;}
end;
*)

procedure TDMLstVentasAgente.frxHYVentasAgentesBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraI]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraI;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstVentasAgente.frxHYVentasAgentesGetValue(const VarName: string; var Value: variant);
begin
  frHYVentasAgenteGetValue(VarName, Value);
end;

end.
