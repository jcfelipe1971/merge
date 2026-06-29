unit UDMLstPedPdte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, DB, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBDataSet, FR_DSet, FR_Class, Fr_HYReport, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstPedPdte = class(TDataModule)
     DSListado: TDataSource;
     QMListado: TFIBDataSetRO;
     TLocal: THYTransaction;
     frPedPdte: TfrHYReport;
     FrDBPedPdte: TfrDBDataSet;
     QGeneral: THYFIBQuery;
     xArticuloD: TFIBDataSetRO;
     xArticuloH: TFIBDataSetRO;
     DSArticuloD: TDataSource;
     DSArticuloH: TDataSource;
     xArticuloDTITULO: TFIBStringField;
     xArticuloHTITULO: TFIBStringField;
     xAgenteD: TFIBDataSetRO;
     xAgenteH: TFIBDataSetRO;
     DSAgenteD: TDataSource;
     DSAgenteH: TDataSource;
     xAgenteDTITULO: TFIBStringField;
     xAgenteHTITULO: TFIBStringField;
     xFamiliaH: TFIBDataSetRO;
     xFamiliaHFAMILIA: TFIBStringField;
     xFamiliaHTITULO: TFIBStringField;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     xFamiliaDFAMILIA: TFIBStringField;
     xFamiliaDTITULO: TFIBStringField;
     frxPedPdte: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedPdteGetValue(const ParName: string; var ParValue: variant);
     procedure frPedPdteBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxPedPdteBeforePrint(Sender: TfrxReportComponent);
     procedure frxPedPdteGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     TipoFiltro, DesdeC, HastaC, Servido: integer;
     DesdeA, HastaA, DesdeAg, HastaAg, DesdeFam, HastaFam, OrdenStr: string;
     DesdeF, HastaF: TDateTime;
  public
     { Public declarations }
     CliMin, CliMax, FamMin, FamMax, ArtMin, ArtMax, AgenteMin, AgenteMax: string;
     procedure CambiaarticuloD(articulo: string);
     procedure CambiaarticuloH(articulo: string);
     procedure CambiaagenteD(agented: integer);
     procedure CambiaagenteH(agenteh: integer);
     procedure MostrarListado(Modo: integer; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente: integer; min_fam, max_fam, min_art, max_art: string; TipoServido, ATipoFiltro: integer; aOrdenStr: string; FechaListado: TDateTime; Comentario: string; min_agente, max_agente: integer; DesdeTemporada, HastaTemporada: string; IdMarca: integer);
     procedure RecargarDatos(const Resultado: string; Tipo: integer);
     procedure Recargar;
     procedure CrearSQL(Ficha: char; AgrupadoPorModelo: boolean; SentenciaWhere: string; Orden: integer);
  end;

var
  DMLstPedPdte : TDMLstPedPdte;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, StdCtrls, DateUtils;

{$R *.dfm}

procedure TDMLstPedPdte.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstPedPdte.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstPedPdte.CambiaAgenteD(AgenteD: integer);
begin
  with xAgenteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := AgenteD;
     Open;
  end;
end;

procedure TDMLstPedPdte.CambiaAgenteH(AgenteH: integer);
begin
  with xAgenteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := AgenteH;
     Open;
  end;
end;

procedure TDMLstPedPdte.MostrarListado(Modo: integer; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente: integer; min_fam, max_fam, min_art, max_art: string; TipoServido, ATipoFiltro: integer; aOrdenStr: string; FechaListado: TDateTime; Comentario: string; min_agente, max_agente: integer; DesdeTemporada, HastaTemporada: string; IdMarca: integer);
var
  Grupo : integer;
begin
  TipoFiltro := ATipoFiltro;
  DesdeC := min_cliente;
  HastaC := max_cliente;
  DesdeA := min_art;
  HastaA := max_art;
  DesdeF := min_fecha;
  HastaF := max_fecha;
  DesdeFam := min_fam;
  HastaFam := max_fam;
  Servido := TipoServido;
  DesdeAg := IntToStr(min_agente);
  HastaAg := IntToStr(max_agente);
  min_fecha := RecodeTime(min_fecha, 0, 0, 0, 0);
  max_fecha := RecodeTime(max_fecha, 23, 59, 59, 999);
  OrdenStr := aOrdenStr;
  DMListados.DatosInforme(FechaListado, Comentario);

  DMListados.Normalizar_Desde_Hasta(min_fecha, max_fecha);
  DMListados.Normalizar_Desde_Hasta(min_cliente, max_cliente);

  with QMListado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO_FILTRO'].AsInteger := TipoFiltro;
     Params.ByName['FECHAD'].AsDateTime := min_fecha;
     Params.ByName['FECHAH'].AsDateTime := max_fecha;
     Params.ByName['FAMILIAD'].AsString := min_fam;
     Params.ByName['FAMILIAH'].AsString := max_fam;
     Params.ByName['CLIENTED'].AsInteger := min_cliente;
     Params.ByName['CLIENTEH'].AsInteger := max_cliente;
     Params.ByName['ARTICULOD'].AsString := min_art;
     Params.ByName['ARTICULOH'].AsString := max_art;
     Params.ByName['SERVIDO'].AsInteger := TipoServido;
     Params.ByName['AGENTED'].AsInteger := min_agente;
     Params.ByName['AGENTEH'].AsInteger := max_agente;
     Params.ByName['CODIGO_TEMPORADA_D'].AsString := DesdeTemporada;
     Params.ByName['CODIGO_TEMPORADA_H'].AsString := HastaTemporada;
     Params.ByName['ID_MARCA'].AsInteger := IdMarca;
     Open;
  end;

  // Escojo el grupo dependiendo del listado que estoy haciendo
  Grupo := 0;
  case TipoFiltro of
     1: Grupo := 141;
     2: Grupo := 142;
     3: Grupo := 143;
     4: Grupo := 144;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frPedPdte, frxPedPdte, nil);
end;

procedure TDMLstPedPdte.Recargar;
begin
  // Min cliente
  RecargarDatos('MIN(CLIENTE) AS MIN_CLIENTE', 1);
  QGeneral.ExecQuery;
  CliMin := QGeneral.FieldByName['MIN_CLIENTE'].AsString;

  // Max cliente
  RecargarDatos('MAX(CLIENTE) AS MAX_CLIENTE', 1);
  QGeneral.ExecQuery;
  CliMax := QGeneral.FieldByName['MAX_CLIENTE'].AsString;

  // Min familia
  RecargarDatos('MIN(FAMILIA) AS MIN_FAMILIA', 2);
  QGeneral.ExecQuery;
  FamMin := QGeneral.FieldByName['MIN_FAMILIA'].AsString;

  // Max familia
  RecargarDatos('MAX(FAMILIA) AS MAX_FAMILIA', 2);
  QGeneral.ExecQuery;
  FamMax := QGeneral.FieldByName['MAX_FAMILIA'].AsString;

  // Min articulo
  RecargarDatos('MIN(ARTICULO) AS MIN_ARTICULO', 3);
  QGeneral.ExecQuery;
  ArtMin := QGeneral.FieldByName['MIN_ARTICULO'].AsString;

  // Max articulo
  RecargarDatos('MAX(ARTICULO) AS MAX_ARTICULO', 3);
  QGeneral.ExecQuery;
  ArtMax := QGeneral.FieldByName['MAX_ARTICULO'].AsString;

  // Min agente
  RecargarDatos('MIN(AGENTE) AS MIN_AGENTE', 4);
  QGeneral.ExecQuery;
  AgenteMin := QGeneral.FieldByName['MIN_AGENTE'].AsString;

  // Max agente
  RecargarDatos('MAX(AGENTE) AS MAX_AGENTE', 4);
  QGeneral.ExecQuery;
  AgenteMax := QGeneral.FieldByName['MAX_AGENTE'].AsString;
end;

procedure TDMLstPedPdte.RecargarDatos(const Resultado: string; Tipo: integer);
begin
  with QGeneral do
  begin
     Close;
     case Tipo of
        1:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_CLIENTES ' +
              'WHERE EMPRESA=?EMPRESA';
        end;

        2:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM ART_FAMILIAS ' +
              'WHERE EMPRESA=?EMPRESA ' +
              'AND FAMILIA <> ''' + REntorno.FamSistema + '''';
        end;

        3:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM ART_ARTICULOS ' +
              'WHERE EMPRESA=?EMPRESA';
        end;

        4:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_AGENTES ' +
              'WHERE EMPRESA=?EMPRESA';
        end;
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  end;
end;

procedure TDMLstPedPdte.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstPedPdte.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPedPdte.frPedPdteGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if Trim(ParName) = 'Orden' then
     ParValue := OrdenStr;

  if (Servido = 0) then // PDTE. SERVIDOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Pdte. de Servir');
  if (Servido = 1) then // SERVIDOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Servidos');
  if (Servido = 10) then // TODOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Todos');

  if (TipoFiltro = 1) then //Por Cliente
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Cliente: %s Hasta Cliente: %s Desde Fecha: %s  Hasta Fecha: %s'), [IntToStr(DesdeC), IntToStr(HastaC), DateToStr(DesdeF), DateToStr(HastaF)]);
  end;
  if (TipoFiltro = 2) then //Por Artículo
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Familia: %s Hasta Familia: %s Desde Articulo: %s Hasta Articulo: %s' + #13#10 + 'Desde Fecha: %s  Hasta Fecha: %s'), [DesdeFam, HastaFam, DesdeA, HastaA, DateToStr(DesdeF), DateToStr(HastaF)]);
  end;
  if (TipoFiltro = 3) then //Por Fecha
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Fecha: %s  Hasta Fecha: %s'), [DateToStr(DesdeF), DateToStr(HastaF)]);
  end;
  if (TipoFiltro = 4) then //Por Agente
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Agente: %s Hasta Agente: %s Desde Fecha: %s  Hasta Fecha: %s'), [DesdeAg, HastaAg, DateToStr(DesdeF), DateToStr(HastaF)]);
  end;
end;

procedure TDMLstPedPdte.frPedPdteBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstPedPdte.frxPedPdteBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstPedPdte.frxPedPdteGetValue(const VarName: string; var Value: variant);
begin
  frPedPdteGetValue(VarName, Value);
end;

procedure TDMLstPedPdte.CrearSQL(Ficha: char; AgrupadoPorModelo: boolean; SentenciaWhere: string; Orden: integer);
begin
  QMListado.Close;
  with QMListado.SelectSQL do
  begin
     Clear;
     // Elijo el procedimiento segun se agrupe o no por Modelo de Tallas y Colores
     if (AgrupadoPorModelo) then
        Add(' SELECT * FROM LST_PEDIDOS_PDTE_SERVIR_TYC ')
     else
        Add(' SELECT * FROM LST_PEDIDOS_PDTE_SERVIR ');

     // Parametros son iguales en los dos procedimientos
     Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO_FILTRO, ?FECHAD, ');
     Add(' ?FECHAH, ?FAMILIAD, ?FAMILIAH, ?CLIENTED, ?CLIENTEH, ?ARTICULOD, ');
     Add(' ?ARTICULOH, ?SERVIDO, ?AGENTED, ?AGENTEH, ?ID_MARCA, ?CODIGO_TEMPORADA_D, ?CODIGO_TEMPORADA_H) ');

     // Agrego Filtro
     if (Trim(SentenciaWhere) <> '') then
        Add(' WHERE V_SERIE IN ' + SentenciaWhere);

     // Agrego Orden
     if (Ficha = 'C') then
     begin
        if (Orden = 0) then // Orden por cliente y num. pedido
           Add(' ORDER BY V_CODCLIENTE, V_RIGPEC, V_ARTICULO ');
        if (Orden = 1) then // Orden por fecha del pedido
           Add(' ORDER BY V_FECHAPED, V_ARTICULO, V_RIGPEC ');
        if (Orden = 2) then // Orden por número de pedido
           Add(' ORDER BY V_RIGPEC, V_ARTICULO ');
     end;

     if (Ficha = 'A') then
     begin
        if (Orden = 0) then // Orden por artículo y fecha de pedido
           Add('ORDER BY V_ARTICULO, V_FECHAPED, V_RIGPEC');
        if (Orden = 1) then // Orden por fecha
           Add('ORDER BY V_FECHAPED, V_RIGPEC');
     end;

     if (Ficha = 'F') then
     begin
        Add('ORDER BY CAST(EXTRACT(DAY FROM V_FECHA_ENTREGA_PED)||''.''|| EXTRACT(MONTH FROM V_FECHA_ENTREGA_PED)||''.''|| EXTRACT(YEAR FROM V_FECHA_ENTREGA_PED) AS DATE), V_CODCLIENTE, V_RIGPEC');
     end;

     if (Ficha = 'G') then
     begin
        if (Orden = 0) then // Orden por agente y num. pedido
           Add('ORDER BY V_CODAGENTE, V_RIGPEC');
        if (Orden = 1) then // Orden por fecha del pedido
           Add('ORDER BY V_FECHAPED, V_RIGPEC');
        if (Orden = 2) then // Orden por número de pedido
           Add('ORDER BY V_RIGPEC');
     end;
  end;
end;

end.
