unit UDMParteMovimiento;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBQuery, FIBDataSetRW, UUtiles, RxMemDS, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport;

type
  TDMParteMovimiento = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xDatos: TFIBDataSetRO;
     xListado: TRxMemoryData;
     xListadoCOLUMNA_INICIAL: TIntegerField;
     xListadoARTICULO: TStringField;
     xListadoTITULO: TStringField;
     xListadoSTOCK_INICIAL: TFloatField;
     xListadoDOCUMENTO_01: TStringField;
     xListadoFECHA_01: TDateField;
     xListadoUNIDADES_01: TFloatField;
     xListadoDOCUMENTO_02: TStringField;
     xListadoFECHA_02: TDateField;
     xListadoUNIDADES_02: TFloatField;
     xListadoDOCUMENTO_03: TStringField;
     xListadoFECHA_03: TDateField;
     xListadoUNIDADES_03: TFloatField;
     xListadoDOCUMENTO_04: TStringField;
     xListadoFECHA_04: TDateField;
     xListadoUNIDADES_04: TFloatField;
     xListadoDOCUMENTO_05: TStringField;
     xListadoFECHA_05: TDateField;
     xListadoUNIDADES_05: TFloatField;
     xListadoDOCUMENTO_06: TStringField;
     xListadoFECHA_06: TDateField;
     xListadoUNIDADES_06: TFloatField;
     xListadoDOCUMENTO_07: TStringField;
     xListadoFECHA_07: TDateField;
     xListadoUNIDADES_07: TFloatField;
     xListadoDOCUMENTO_08: TStringField;
     xListadoFECHA_08: TDateField;
     xListadoUNIDADES_08: TFloatField;
     xListadoDOCUMENTO_09: TStringField;
     xListadoFECHA_09: TDateField;
     xListadoUNIDADES_09: TFloatField;
     xListadoDOCUMENTO_10: TStringField;
     xListadoFECHA_10: TDateField;
     xListadoUNIDADES_10: TFloatField;
     frListado: TfrHYReport;
     frDBxListado: TfrDBDataSet;
     xListadoCODIGO_PROVEEDOR: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     Serie, SerieReposicion: string;
     DesdeFecha, HastaFecha: TDateTime;
     DesdeArticulo, HastaArticulo: string;
     Proveedor: integer;
  public
     { Public declarations }
     procedure RefrescaArticulos(Proveedor: integer; ArtD, ArtH: string);
     procedure RefrescaAlbaranCompra(Proveedor: integer; Serie, Articulo: string; DesdeFecha, HastaFecha: TDateTime);
     procedure RefrescaAlbaranVenta(Proveedor: integer; Serie, SerieReposicion, Articulo: string; DesdeFecha, HastaFecha: TDateTime);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameAlmacenCompras(Serie: string): string;
     function DameAlmacenVentas(Serie: string): string;
     procedure Imprimir(aSerie, aSerieReposicion: string; aDesdeFecha, aHastaFecha: TDateTime; aDesdeArticulo, aHastaArticulo: string; aProveedor: integer);
     function DameStockInicialArticulo(Proveedor: integer; Serie, SerieReposicion, Articulo: string; DesdeFecha, HastaFecha: TDateTime; Almacen: string): double;
  end;

var
  DMParteMovimiento : TDMParteMovimiento;

implementation

uses UDMMain, UEntorno, HYFIBQuery, UDMListados, UFormGest;

{$R *.dfm}

{ TDMParteMovimiento }

procedure TDMParteMovimiento.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMParteMovimiento.RefrescaArticulos(Proveedor: integer; ArtD, ArtH: string);
begin
  with xDatos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT P.ARTICULO, A.TITULO_LARGO AS TITULO, A.ALFA_4, C.CODIGO_PROVEEDOR ');
     SelectSQL.Add(' FROM ART_ARTICULOS_PROVEEDORES P ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON P.ID_A = A.ID_A ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_CODPROV C ON P.EMPRESA = C.EMPRESA AND P.PROVEEDOR = C.PROVEEDOR AND P.ARTICULO = C.ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' P.PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' P.ARTICULO <> :ARTICULO_PUNTO AND ');
     SelectSQL.Add(' P.ARTICULO >= :ARTD AND ');
     SelectSQL.Add(' P.ARTICULO <= :ARTH AND ');
     SelectSQL.Add(' P.ACTIVO = 1 ');
     SelectSQL.Add(' ORDER BY A.ALFA_4, P.ARTICULO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['ARTICULO_PUNTO'].AsString := REntorno.ArtTextoLibre;
     Params.ByName['ARTD'].AsString := ArtD;
     Params.ByName['ARTH'].AsString := ArtH;
     Open;
     Last;
     First;
  end;
end;

procedure TDMParteMovimiento.RefrescaAlbaranCompra(Proveedor: integer; Serie, Articulo: string; DesdeFecha, HastaFecha: TDateTime);
begin
  with xDatos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.FECHA, D.TIPO, D.RIG, SUM(D.UNIDADES) AS UNIDADES, A.NUM_ALBARAN ');
     SelectSQL.Add(' FROM GES_CABECERAS_E C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_ALB A ON C.ID_E = A.ID_E ');
     SelectSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' D.TIPO = ''ALP'' AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' D.ALMACEN = :ALMACEN_ALP AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND ');
     SelectSQL.Add(' A.PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' C.ESTADO <> 2 ');
     SelectSQL.Add(' GROUP BY C.FECHA, D.TIPO, D.RIG, A.NUM_ALBARAN ');
     SelectSQL.Add(' UNION ');
     SelectSQL.Add(' SELECT C.FECHA, D.TIPO, D.RIG, SUM(D.UNIDADES) AS UNIDADES, A.NUM_ALBARAN ');
     SelectSQL.Add(' FROM GES_CABECERAS_E C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_ALB A ON C.ID_E = A.ID_E ');
     SelectSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' D.TIPO = ''FAP'' AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' D.ALMACEN = :ALMACEN_FAP AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND ');
     SelectSQL.Add(' A.PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' C.ESTADO <> 2 AND ');
     SelectSQL.Add(' (NOT EXISTS(SELECT C.ID_E ');
     SelectSQL.Add('             FROM GES_CABECERAS_E C ');
     SelectSQL.Add('             JOIN GES_CABECERAS_E_RELACIONES R ON C.EMPRESA = R.D_EMPRESA AND C.EJERCICIO = R.D_EJERCICIO AND C.CANAL = R.D_CANAL AND C.SERIE = R.D_SERIE AND C.TIPO = R.D_TIPO AND C.RIG = R.D_RIG ');
     SelectSQL.Add('             WHERE ');
     SelectSQL.Add('             C.ID_E = C.ID_E AND ');
     SelectSQL.Add('             R.O_TIPO = ''ALP'')) ');
     SelectSQL.Add(' GROUP BY C.FECHA, D.TIPO, D.RIG, A.NUM_ALBARAN ');
     {     SelectSQL.Add(' UNION ');
     SelectSQL.Add(' SELECT C.FECHA, ''MO'' || C.TIPO_OPERACION, D.RIG, D.UNIDADES ');
     SelectSQL.Add(' FROM GES_CABECERAS_ST C ');
     SelectSQL.Add(' JOIN GES_DETALLES_ST D ON C.ID_ST = D.ID_ST ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' ((C.TIPO_OPERACION = ''E'') OR (C.TIPO_OPERACION = ''T'')) AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' C.ALMACEN_DST = :ALMACEN AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
}
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN_ALP'].AsString := DMMain.DameAlmacenDocumento('ALP', Serie);
     Params.ByName['ALMACEN_FAP'].AsString := DMMain.DameAlmacenDocumento('FAP', Serie);
     Params.ByName['DESDE_FECHA'].AsDateTime := HourIntoDate(DesdeFecha, '00:00:00');
     Params.ByName['HASTA_FECHA'].AsDateTime := HourIntoDate(HastaFecha, '23:59:59');
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
     Last;
     First;
  end;
end;

procedure TDMParteMovimiento.RefrescaAlbaranVenta(Proveedor: integer; Serie, SerieReposicion, Articulo: string; DesdeFecha, HastaFecha: TDateTime);
begin
  {Solo albaranes facturados}
  with xDatos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.FECHA, D.TIPO, D.RIG, SUM(D.UNIDADES) AS UNIDADES ');
     SelectSQL.Add(' FROM GES_CABECERAS_S C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S_ALB A ON C.ID_S = A.ID_S ');
     SelectSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
     {     SelectSQL.Add(' JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.O_ID_S ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S C2 ON R.d_id_s = C2.ID_S ');}
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' D.TIPO = ''ALB'' AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' D.ALMACEN = :ALMACEN AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND ');
     SelectSQL.Add(' C.ESTADO = 5 ');
     SelectSQL.Add(' GROUP BY C.FECHA, D.TIPO, D.RIG ');
     {
     SelectSQL.Add(' UNION ');
     SelectSQL.Add(' SELECT C.FECHA, D.TIPO, D.RIG, D.UNIDADES ');
     SelectSQL.Add(' FROM GES_CABECERAS_S C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S_ALB A ON C.ID_S = A.ID_S ');
     SelectSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' D.TIPO = ''ALB'' AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' D.ALMACEN = :ALMACEN AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND ');
     SelectSQL.Add(' (NOT EXISTS(SELECT C.ID_S ');
     SelectSQL.Add('             FROM GES_CABECERAS_S C ');
     SelectSQL.Add('             JOIN GES_CABECERAS_RELACIONES R ON C.EMPRESA = R.D_EMPRESA AND C.EJERCICIO = R.D_EJERCICIO AND C.CANAL = R.D_CANAL AND C.SERIE = R.D_SERIE AND C.TIPO = R.D_TIPO AND C.RIG = R.D_RIG ');
     SelectSQL.Add('             WHERE ');
     SelectSQL.Add('             C.ID_S = C.ID_S AND ');
     SelectSQL.Add('             R.O_TIPO = ''ALB'')) ');
     SelectSQL.Add(' UNION ');
     SelectSQL.Add(' SELECT C.FECHA, ''MO'' || C.TIPO_OPERACION, D.RIG, D.UNIDADES ');
     SelectSQL.Add(' FROM GES_CABECERAS_ST C ');
     SelectSQL.Add(' JOIN GES_DETALLES_ST D ON C.ID_ST = D.ID_ST ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE AND ');
     SelectSQL.Add(' ((C.TIPO_OPERACION = ''S'') OR (C.TIPO_OPERACION = ''T'')) AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' C.ALMACEN_ORI = :ALMACEN AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
}

     // Agregar union con GES_CABECERAS_E WHERE TPO = 'PEP' AND SERIE  = 'REP', que son las reposiciones
     SelectSQL.Add(' UNION ');
     SelectSQL.Add(' SELECT C.FECHA, D.TIPO, D.RIG, SUM(D.UNIDADES) AS UNIDADES ');
     SelectSQL.Add(' FROM GES_CABECERAS_E C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_PED A ON C.ID_E = A.ID_E ');
     SelectSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.SERIE = :SERIE_REPOSICION AND ');
     SelectSQL.Add(' D.TIPO = ''PEP'' AND ');
     SelectSQL.Add(' D.ARTICULO = :ARTICULO AND ');
     SelectSQL.Add(' D.ALMACEN = :ALMACEN AND ');
     SelectSQL.Add(' C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND ');
     SelectSQL.Add(' A.PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' C.ESTADO <> 2 ');
     SelectSQL.Add(' GROUP BY C.FECHA, D.TIPO, D.RIG ');
     SelectSQL.Add(' ORDER BY 1, 2, 3 ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['SERIE_REPOSICION'].AsString := SerieReposicion;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN'].AsString := DMMain.DameAlmacenDocumento('ALB', Serie);
     Params.ByName['DESDE_FECHA'].AsDateTime := HourIntoDate(DesdeFecha, '00:00:00');
     Params.ByName['HASTA_FECHA'].AsDateTime := HourIntoDate(HastaFecha, '23:59:59');
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
     Last;
     First;
  end;
end;

function TDMParteMovimiento.DameArticuloMin: string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT MIN(ARTICULO) FROM ART_ARTICULOS ');
        SQL.Add('WHERE EMPRESA = :EMPRESA AND');
        SQL.Add('ARTICULO <> :ARTICULO_PUNTO AND ');
        SQL.Add('FAMILIA <> :FAMILIA_SISTEMA ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO_PUNTO'].AsString := REntorno.ArtTextoLibre;
        Params.ByName['FAMILIA_SISTEMA'].AsString := REntorno.FamSistema;

        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMParteMovimiento.DameArticuloMax: string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT MAX(ARTICULO) FROM ART_ARTICULOS ');
        SQL.Add('WHERE EMPRESA=:EMPRESA AND');
        SQL.Add('ARTICULO <> :ARTICULO_PUNTO AND ');
        SQL.Add('FAMILIA <> :FAMILIA_SISTEMA ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO_PUNTO'].AsString := REntorno.ArtTextoLibre;
        Params.ByName['FAMILIA_SISTEMA'].AsString := REntorno.FamSistema;
        ExecQuery;
        Result := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMParteMovimiento.DameAlmacenCompras(Serie: string): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN_COMPRAS FROM GEN_SERIES WHERE EMPRESA=:EMPRESA AND SERIE=:SERIE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := FieldByName['ALMACEN_COMPRAS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMParteMovimiento.DameAlmacenVentas(Serie: string): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN_VENTAS FROM GEN_SERIES WHERE EMPRESA=:EMPRESA AND SERIE=:SERIE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := FieldByName['ALMACEN_VENTAS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMParteMovimiento.Imprimir(aSerie, aSerieReposicion: string; aDesdeFecha, aHastaFecha: TDateTime; aDesdeArticulo, aHastaArticulo: string; aProveedor: integer);
var
  SerieListado, Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  xListado.SortOnFields('COLUMNA_INICIAL;CODIGO_PROVEEDOR;ARTICULO');

  Serie := aSerie;
  SerieReposicion := aSerieReposicion;
  DesdeFecha := aDesdeFecha;
  HastaFecha := aHastaFecha;
  DesdeArticulo := aDesdeArticulo;
  HastaArticulo := aHastaArticulo;
  Proveedor := aProveedor;

  AbreData(TDMListados, DMListados);
  SerieListado := '';
  Titulo := _('Parte de Movimientos');
  Grupo := 639;
  Listado := 0;
  DMListados.Imprimir(Grupo, Listado, 0 {Modo}, SerieListado, Titulo, frListado, nil, nil);
  CierraData(DMListados);
end;

procedure TDMParteMovimiento.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Serie') then
     ParValue := Serie;
  if (ParName = 'SerieReposicion') then
     ParValue := SerieReposicion;
  if (ParName = 'DesdeFecha') then
     ParValue := DesdeFecha;
  if (ParName = 'HastaFecha') then
     ParValue := HastaFecha;
  if (ParName = 'DesdeArticulo') then
     ParValue := DesdeArticulo;
  if (ParName = 'HastaArticulo') then
     ParValue := HastaArticulo;
  if (ParName = 'Proveedor') then
     ParValue := Proveedor;
end;

function TDMParteMovimiento.DameStockInicialArticulo(Proveedor: integer; Serie, SerieReposicion, Articulo: string; DesdeFecha, HastaFecha: TDateTime; Almacen: string): double;
begin
  // Stock a 01/01/Ejercicio
  Result := DMMain.DameStockArticuloFecha(REntorno.Empresa, 0 {REntorno.Canal}, Articulo, Almacen, EncodeDate(REntorno.Ejercicio, 1, 1));

  // Sumo compras
  RefrescaAlbaranCompra(Proveedor, Serie, Articulo, EncodeDate(REntorno.Ejercicio, 1, 1), DesdeFecha - 1);
  while (not xDatos.EOF) do
  begin
     Result := Result + xDatos.FieldByName('UNIDADES').AsFloat;
     xDatos.Next;
  end;

  // Resto ventas
  RefrescaAlbaranVenta(Proveedor, Serie, SerieReposicion, Articulo, EncodeDate(REntorno.Ejercicio, 1, 1), DesdeFecha - 1);
  while (not xDatos.EOF) do
  begin
     Result := Result - xDatos.FieldByName('UNIDADES').AsFloat;
     xDatos.Next;
  end;
end;

end.
