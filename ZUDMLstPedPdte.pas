unit ZUDMLstPedPdte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, DB, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBDataSet, FR_DSet, FR_Class, Fr_HYReport, FR_DBSet;

type
  TZDMLstPedPdte = class(TDataModule)
     xClienteD: TFIBDataSetRO;
     DSClienteD: TDataSource;
     DSListado: TDataSource;
     QMListado: TFIBDataSetRO;
     xClienteH: TFIBDataSetRO;
     DSclienteH: TDataSource;
     xClienteDTITULO: TFIBStringField;
     xClienteHTITULO: TFIBStringField;
     TLocal: THYTransaction;
     frPedPdte: TfrHYReport;
     FrDBPedPdte: TfrDBDataSet;
     QGeneral: THYFIBQuery;
     QMListadoV_ARTICULO: TFIBStringField;
     QMListadoV_NOMBREARTICULO: TFIBStringField;
     QMListadoV_UNIDADES: TFloatField;
     QMListadoV_PRECIO: TFloatField;
     QMListadoV_RIGPEC: TIntegerField;
     QMListadoV_NOMBRECLIENTE: TFIBStringField;
     QMListadoV_CODCLIENTE: TIntegerField;
     QMListadoV_FECHAPED: TDateTimeField;
     QMListadoV_FAMILIA: TFIBStringField;
     xArticuloD: TFIBDataSetRO;
     xArticuloH: TFIBDataSetRO;
     DSArticuloD: TDataSource;
     DSArticuloH: TDataSource;
     xArticuloDTITULO: TFIBStringField;
     xArticuloHTITULO: TFIBStringField;
     QMListadoV_SERVIDO: TIntegerField;
     QMListadoV_UNI_SERV: TFloatField;
     QMListadoV_UNI_PDTE: TFloatField;
     QMListadoV_TOTAL: TFloatField;
     QMListadoV_TOTAL_SERV: TFloatField;
     xAgenteD: TFIBDataSetRO;
     xAgenteH: TFIBDataSetRO;
     DSAgenteD: TDataSource;
     DSAgenteH: TDataSource;
     xAgenteDTITULO: TFIBStringField;
     xAgenteHTITULO: TFIBStringField;
     QMListadoV_CODAGENTE: TIntegerField;
     QMListadoV_NOMBREAGENTE: TFIBStringField;
     QMListadoV_NOTAS: TBlobField;
     QMultiSerie: THYFIBQuery;
     QMListadoV_SERIE: TFIBStringField;
     xFamiliaH: TFIBDataSetRO;
     xFamiliaHFAMILIA: TFIBStringField;
     xFamiliaHTITULO: TFIBStringField;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     xFamiliaDFAMILIA: TFIBStringField;
     xFamiliaDTITULO: TFIBStringField;
     QMListadoV_DTO_PP: TFloatField;
     QMListadoV_DTO_CIAL: TFloatField;
     QMListadoV_DTO: TFloatField;
     QMListadoV_DTO2: TFloatField;
     QMListadoV_DTO3: TFloatField;
     QTemp: THYFIBQuery;
     xCanalDesde: TFIBDataSetRO;
     xCanalDesdeTITULO: TFIBStringField;
     xCanalDesdeCANAL: TIntegerField;
     DSxCanalDesde: TDataSource;
     DSxCanalHasta: TDataSource;
     xCanalHasta: TFIBDataSetRO;
     xCanalHastaTITULO: TFIBStringField;
     xCanalHastaCANAL: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedPdteGetValue(const ParName: string; var ParValue: variant);
     procedure frPedPdteBeforePrint(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     TFiltro, DesdeC, HastaC, Servido, Canal_Desde, Canal_Hasta: integer;
     DesdeA, HastaA, DesdeAg, HastaAg, DesdeFam, HastaFam: string;
     DesdeF, HastaF: TDateTime;
  public
     { Public declarations }
     CliMin, CliMax, FamMin, FamMax, ArtMin, ArtMax, AgenteMin, AgenteMax, CanalMax, CanalMin: string;
     Comentario: string;
     procedure CambiaclienteD(cliente: integer);
     procedure CambiaclienteH(cliente: integer);
     procedure CambiaarticuloD(articulo: string);
     procedure CambiaarticuloH(articulo: string);
     procedure CambiaagenteD(agented: integer);
     procedure CambiaagenteH(agenteh: integer);
     procedure MostrarListado(modo: integer; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente: integer; min_fam, max_fam, min_art, max_art: string; TipoServido, TipoFiltro: integer; ordenado: string; fecha_listado: TDateTime; min_agente, max_agente, canal_ini, canal_fin: integer);
     procedure RecargarDatos(const Resultado: string; Tipo: integer);
     procedure Recargar;
  end;

var
  ZDMLstPedPdte : TZDMLstPedPdte;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, StdCtrls,
  ZUFPregPedPdte, UUtiles;

{$R *.dfm}

procedure TZDMLstPedPdte.CambiaClienteD(Cliente: integer);
begin
  with xClienteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TZDMLstPedPdte.CambiaClienteH(Cliente: integer);
begin
  with xClienteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TZDMLstPedPdte.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TZDMLstPedPdte.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TZDMLstPedPdte.CambiaAgenteD(AgenteD: integer);
begin
  with xAgenteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := AgenteD;
     Open;
  end;
end;

procedure TZDMLstPedPdte.CambiaAgenteH(AgenteH: integer);
begin
  with xAgenteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := AgenteH;
     Open;
  end;
end;

procedure TZDMLstPedPdte.MostrarListado(modo: integer; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente: integer; min_fam, max_fam, min_art, max_art: string; TipoServido, TipoFiltro: integer; ordenado: string; fecha_listado: TDateTime; min_agente, max_agente, canal_ini, canal_fin: integer);
var
  str : string;
begin
  TFiltro := TipoFiltro;
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
  Min_fecha := HourIntoDate(Min_fecha, '00:00:00');
  Max_fecha := HourIntoDate(Max_fecha, '23:59:59');
  canal_desde := canal_ini;
  canal_hasta := canal_fin;

  DMListados.Normalizar_Desde_Hasta(Min_fecha, Max_fecha);
  DMListados.Normalizar_Desde_Hasta(min_cliente, max_cliente);

  // sfg_rsl - begin- Leer fichero de tabla temporal y no directamente de sentencia
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'execute PROCEDURE  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,' +
        '?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,' +
        '?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,' +
        '?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH,?ENTRADA,?CANAL_INI,?CANAL_FIN)';

     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     // Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tipo_Filtro'].AsInteger := TipoFiltro;
     Params.ByName['FechaD'].AsDateTime := min_fecha;
     Params.ByName['FechaH'].AsDateTime := max_fecha;
     Params.ByName['FamiliaD'].AsString := min_fam;
     Params.ByName['FamiliaH'].AsString := max_fam;
     Params.ByName['ClienteD'].AsInteger := min_cliente;
     Params.ByName['ClienteH'].AsInteger := max_cliente;
     Params.ByName['ArticuloD'].AsString := min_art;
     Params.ByName['ArticuloH'].AsString := max_art;
     Params.ByName['Servido'].AsInteger := TipoServido;
     Params.ByName['AgenteD'].AsInteger := min_agente;
     Params.ByName['AgenteH'].AsInteger := max_agente;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     Params.ByName['Canal_Ini'].AsInteger := canal_ini;
     Params.ByName['Canal_Fin'].AsInteger := canal_fin;
     ExecQuery;
     FreeHandle;
  end;

  with QMListado do
  begin
     Close;
     SelectSQL.Text := 'select * from z_tmp_lst_ped_pdte_servir where entrada=?entrada';
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     Open;
  end;
  // sfg_rsl - end- Leer fichero de tabla temporal y no directamente de sentencia

  // Escojo el grupo dependiendo del listado que estoy haciendo
  case tipofiltro of
     1: DMListados.Cargar(141, '');
     2: DMListados.Cargar(142, '');
     3: DMListados.Cargar(143, '');
     4: DMListados.Cargar(144, '');
  end;
  frPedPdte.LoadFromFIB(REntorno.Formato, str);
  frPedPdte.PrepareReport;
  // frPedPdte.DesignReport;
  case modo of
     0: frPedPdte.ShowPreparedReport;
     1: frPedPdte.PrintPreparedReport(' ', REntorno.Copias);
  end;

  // sfg_rsl -begin- Borrar tabla  temporal
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'delete from z_tmp_lst_ped_pdte_servir where entrada=?entrada';
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;

     ExecQuery;
     FreeHandle;
  end;
  // sfg_rsl -end- Borrar tabla  temporal

  DMListados.LimpiaEntorno;
end;

procedure TZDMLstPedPdte.Recargar;
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

  // Max Canal sfg.albert
  RecargarDatos('MIN(CANAL) AS MIN_CANAL', 5);
  QGeneral.ExecQuery;
  CanalMin := QGeneral.FieldByName['MIN_CANAL'].AsString;

  // Max Canal sfg.albert
  RecargarDatos('MAX(CANAL) AS MAX_CANAL', 5);
  QGeneral.ExecQuery;
  CanalMax := QGeneral.FieldByName['MAX_CANAL'].AsString;
end;

procedure TZDMLstPedPdte.RecargarDatos(const Resultado: string; tipo: integer);
begin
  case tipo of
     1:
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_CLIENTES ' +
              'WHERE EMPRESA=?EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        end;
     end;
     2:
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM ART_FAMILIAS ' +
              'WHERE EMPRESA=?EMPRESA ' +
              'AND FAMILIA <> ''' + REntorno.FamSistema + '''';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        end;
     end;
     3:
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM ART_ARTICULOS ' +
              'WHERE EMPRESA=?EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        end;
     end;
     4:
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_AGENTES ' +
              'WHERE EMPRESA=?EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        end;
     end;
     5: // sfg.albert
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM VER_CANALES_ACTIVOS ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND PAIS=?PAIS';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['PAIS'].AsString := REntorno.Pais;
        end;
     end;
  end;
end;

procedure TZDMLstPedPdte.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstPedPdte.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstPedPdte.frPedPdteGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;
  if Trim(ParName) = 'FechaListado' then
     ParValue := ZFPregPedPdte.TDPFechaListado.Date;
  if Trim(ParName) = 'Orden' then
     ParValue := ZFPregPedPdte.CBOrden.Items[ZFPregPedPdte.CBOrden.ItemIndex];

  if (Servido = 0) then // PDTE. SERVIDOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Pdte. de Servir');
  if (Servido = 1) then // SERVIDOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Servidos');
  if (Servido = 10) then // TODOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Todos');

  if (TFiltro = 1) then // Por Cliente
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Cliente: %d Hasta Cliente: %d Desde Fecha: %s Hasta Fecha: %s Desde Canal: %d Hasta Canal: %d'), [DesdeC, HastaC, DateToStr(DesdeF), DateToStr(HastaF), Canal_Desde, Canal_Hasta]);
  end;
  if (TFiltro = 2) then // Por Artículo
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Familia: %s Hasta Familia: %s Desde Artículo: %s Hasta Artículo: %s Desde Fecha: %s Hasta Fecha: %s Desde Canal: %d Hasta Canal: %d'), [DesdeFam, HastaFam, DesdeA, HastaA, DateToStr(DesdeF), DateToStr(HastaF), Canal_Desde, Canal_Hasta]);
  end;
  if (TFiltro = 3) then // Por Fecha
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Fecha: %s Hasta Fecha: %s Desde Canal: %d Hasta Canal: %d'), [DateToStr(DesdeF), DateToStr(HastaF), Canal_Desde, Canal_Hasta]);
  end;
  if (TFiltro = 4) then // Por Agente
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Agente: %d Hasta Cliente: %d Desde Fecha: %s Hasta Fecha: %s Desde Canal: %d Hasta Canal: %d'), [DesdeAg, HastaAg, DateToStr(DesdeF), DateToStr(HastaF), Canal_Desde, Canal_Hasta]);
  end;

end;

procedure TZDMLstPedPdte.frPedPdteBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

end.
