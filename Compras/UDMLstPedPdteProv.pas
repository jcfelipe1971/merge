unit UDMLstPedPdteProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, DB, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBDataSet, FR_DSet, FR_Class, Fr_HYReport, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLSTPedPdteProv = class(TDataModule)
     xProveedorD: TFIBDataSetRO;
     DSProveedorD: TDataSource;
     DSListado: TDataSource;
     QMListado: TFIBDataSetRO;
     xProveedorH: TFIBDataSetRO;
     DSProveedorH: TDataSource;
     TLocal: THYTransaction;
     frPedPdteProv: TfrHYReport;
     FrDBPedPdteProv: TfrDBDataSet;
     QGeneral: THYFIBQuery;
     xArticuloD: TFIBDataSetRO;
     xArticuloH: TFIBDataSetRO;
     DSArticuloD: TDataSource;
     DSArticuloH: TDataSource;
     xArticuloDTITULO: TFIBStringField;
     xArticuloHTITULO: TFIBStringField;
     xProveedorHTITULO: TFIBStringField;
     QMultiSerie: THYFIBQuery;
     frxPedPdteProv: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedPdteProvGetValue(const ParName: string; var ParValue: variant);
     procedure frPedPdteProvBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxPedPdteProvBeforePrint(Sender: TfrxReportComponent);
     procedure frxPedPdteProvGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     TipoFiltro, DesdeC, HastaC, Servido: integer;
     DesdeA, HastaA: string;
     DesdeF, HastaF: TDateTime;
  public
     { Public declarations }
     ProvMin, ProvMax, FamMin, FamMax, ArtMin, ArtMax: string;
     procedure CambiaProveedorD(proveedor: integer);
     procedure CambiaProveedorH(proveedor: integer);
     procedure CambiaarticuloD(articulo: string);
     procedure CambiaarticuloH(articulo: string);
     procedure MostrarListado(modo: integer; min_fecha, max_fecha: TDateTime; min_proveedor, max_proveedor: integer; min_fam, max_fam, min_art, max_art: string; TipoServido, ATipoFiltro: integer; FechaListado: TDateTime; Comentario: string; DesdeTemporada, HastaTemporada: string; IdMarca: integer);
     procedure RecargarDatos(const Resultado: string; Tipo: integer);
     procedure Recargar;
     // procedure LlenarMultiserie;
     procedure CrearSQL(Ficha: char; AgrupadoPorModelo: boolean; SentenciaWhere: string; Orden: integer);
  end;

var
  DMLSTPedPdteProv : TDMLSTPedPdteProv;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, StdCtrls, UFPregPedPdteProv, DateUtils;

{$R *.dfm}

procedure TDMLSTPedPdteProv.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTPedPdteProv.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLSTPedPdteProv.CambiaProveedorD(proveedor: integer);
begin
  with xProveedorD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Proveedor'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMLSTPedPdteProv.CambiaProveedorH(Proveedor: integer);
begin
  with xProveedorH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Proveedor'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMLSTPedPdteProv.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLSTPedPdteProv.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLSTPedPdteProv.MostrarListado(Modo: integer; min_fecha, max_fecha: TDateTime; min_proveedor, max_proveedor: integer; min_fam, max_fam, min_art, max_art: string; TipoServido, ATipoFiltro: integer; FechaListado: TDateTime; Comentario: string; DesdeTemporada, HastaTemporada: string; IdMarca: integer);
var
  Grupo : integer;
begin
  TipoFiltro := ATipoFiltro;
  DesdeC := min_proveedor;
  HastaC := max_proveedor;
  DesdeA := min_art;
  HastaA := max_art;
  DesdeF := min_fecha;
  HastaF := max_fecha;
  Servido := TipoServido;
  min_fecha := RecodeTime(min_fecha, 0, 0, 0, 0);
  max_fecha := RecodeTime(max_fecha, 23, 59, 59, 999);
  DMListados.DatosInforme(FechaListado, Comentario);

  DMListados.Normalizar_Desde_Hasta(min_fecha, max_fecha);
  DMListados.Normalizar_Desde_Hasta(min_proveedor, max_proveedor);

  with QMListado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO_FILTRO'].AsInteger := TipoFiltro; // Tipo de filtro
     Params.ByName['FECHAD'].AsDateTime := min_fecha;
     Params.ByName['FECHAH'].AsDateTime := max_fecha;
     Params.ByName['FAMILIAD'].AsString := min_fam;
     Params.ByName['FAMILIAH'].AsString := max_fam;
     Params.ByName['PROVEEDORD'].AsInteger := min_proveedor;
     Params.ByName['PROVEEDORH'].AsInteger := max_proveedor;
     Params.ByName['ARTICULOD'].AsString := min_art;
     Params.ByName['ARTICULOH'].AsString := max_art;
     Params.ByName['RECIBIDO'].AsInteger := TipoServido;
     Params.ByName['CODIGO_TEMPORADA_D'].AsString := DesdeTemporada;
     Params.ByName['CODIGO_TEMPORADA_H'].AsString := HastaTemporada;
     Params.ByName['ID_MARCA'].AsInteger := IdMarca;
     Open;
  end;

  Grupo := 145;
  // Escojo el grupo dependiendo del listado que estoy haciendo
  case TipoFiltro of
     1: Grupo := 145;
     2: Grupo := 146;
     // 3: Grupo := 147;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frPedPdteProv, frxPedPdteProv, nil);
end;

procedure TDMLSTPedPdteProv.Recargar;
begin
  // Min cliente
  RecargarDatos('MIN(PROVEEDOR) AS MIN_PROVEEDOR', 1);
  QGeneral.ExecQuery;
  ProvMin := QGeneral.FieldByName['MIN_PROVEEDOR'].AsString;

  // Max cliente
  RecargarDatos('MAX(PROVEEDOR) AS MAX_PROVEEDOR', 1);
  QGeneral.ExecQuery;
  ProvMax := QGeneral.FieldByName['MAX_PROVEEDOR'].AsString;

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
end;

procedure TDMLSTPedPdteProv.RecargarDatos(const Resultado: string; Tipo: integer);
begin
  with QGeneral do
  begin
     Close;
     case Tipo of
        1:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_PROVEEDORES ' +
              'WHERE EMPRESA=?EMPRESA';
        end;

        2:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM ART_FAMILIAS ' +
              'WHERE EMPRESA=?EMPRESA';
        end;
        3:
        begin
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM ART_ARTICULOS ' +
              'WHERE EMPRESA=?EMPRESA';
        end;
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  end;
end;

procedure TDMLSTPedPdteProv.frPedPdteProvGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if Trim(ParName) = 'Orden' then
     ParValue := FPregPedPdteProv.CBOrden.Items[FPregPedPdteProv.CBOrden.ItemIndex];

  if (Servido = 0) then // PDTE. RECIBIDOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Pdte. de Recibir');
  if (Servido = 1) then // RECIBIDOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Recibidos');
  if (Servido = 10) then // TODOS
     if Trim(ParName) = 'Estado' then
        ParValue := _('Todos');

  if (TipoFiltro = 1) then // Por Proveedor
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Proveedor: %d Hasta Proveedor: %d Desde Fecha: %s Hasta Fecha: %s'), [DesdeC, HastaC, DateToStr(DesdeF), DateToStr(HastaF)]);
  end;

  if (TipoFiltro = 2) then //Por Artículo
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Artículo: %s Hasta Artículo: %s Desde Fecha: %s Hasta Fecha: %s'), [DesdeA, HastaA, DateToStr(DesdeF), DateToStr(HastaF)]);
  end;

  if (TipoFiltro = 3) then //Por Fecha
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Fecha: %s Hasta Fecha: %s'), [DateToStr(DesdeF), DateToStr(HastaF)]);
  end;
end;

procedure TDMLSTPedPdteProv.frPedPdteProvBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLSTPedPdteProv.frxPedPdteProvBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLSTPedPdteProv.frxPedPdteProvGetValue(const VarName: string; var Value: variant);
begin
  frPedPdteProvGetValue(VarName, Value);
end;

procedure TDMLSTPedPdteProv.CrearSQL(Ficha: char; AgrupadoPorModelo: boolean; SentenciaWhere: string; Orden: integer);
begin
  QMListado.Close;
  with QMListado.SelectSQL do
  begin
     Clear;
     // Elijo el procedimiento segun se agrupe o no por Modelo de Tallas y Colores
     if (AgrupadoPorModelo) then
        Add('SELECT * FROM LST_PEDIDOS_PDTE_RECIBIR_TYC ')
     else
        Add('SELECT * FROM LST_PEDIDOS_PDTE_RECIBIR ');

     // Parametros son iguales en los dos procedimientos
     Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO_FILTRO, ?FECHAD, ');
     Add(' ?FECHAH, ?FAMILIAD, ?FAMILIAH, ?PROVEEDORD, ?PROVEEDORH, ');
     Add(' ?ARTICULOD, ?ARTICULOH, ?RECIBIDO, ?ID_MARCA, ?CODIGO_TEMPORADA_D, ?CODIGO_TEMPORADA_H) ');

     // Agrego Filtro
     Add(' WHERE V_SERIE IN ' + SentenciaWhere);

     // Agrego Orden
     if (Ficha = 'P') then
     begin
        if (Orden = 0) then //Orden por cliente y num. pedido
           Add(' ORDER BY V_CODPROVEEDOR, V_RIGPEP ');
        if (Orden = 1) then //Orden por fecha del pedido
           Add(' ORDER BY V_FECHAPEP ');
        if (Orden = 2) then //Orden por número de pedido
           Add(' ORDER BY V_RIGPEP ');
     end;

     if (Ficha = 'A') then
     begin
        if (Orden = 0) then //Orden por artículo y fecha de pedido
           Add(' ORDER BY V_ARTICULO, V_FECHAPEP ');
        if (Orden = 1) then //Orden por fecha
           Add(' ORDER BY V_FECHAPEP ');
     end;
  end;
end;

end.
