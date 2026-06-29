unit UDMRFichasArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBQuery, FIBDatabase, UFIBModificados, ExtCtrls, FIBDataSetRO,
  HYFIBQuery, frxClass, frxHYReport;

type
  TDMRFichasArticulos = class(TDataModule)
     frArticulos: TfrHYReport;
     xArt_Mov_Stock: TFIBDataSetRO;
     xArt_Articulos: TFIBDataSetRO;
     DSxArt_Mov_Stock: TDataSource;
     SPRSaldos: THYFIBQuery;
     xArt_Almacenes: TFIBDataSetRO;
     frDSxArt_Mov_Stock: TfrDBDataSet;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     TLocal: THYTransaction;
     xPeriodo_Desde: TFIBDataSetRO;
     DSxPeriodo_Desde: TDataSource;
     xPeriodo_Hasta: TFIBDataSetRO;
     DSxPeriodo_Hasta: TDataSource;
     xAlmacen_Hasta: TFIBDataSetRO;
     DSxAlmacen_Desde: TDataSource;
     DSxAlmacen_Hasta: TDataSource;
     frUserDSCodBarras: TfrUserDataset;
     xArtBarras: TFIBDataSetRO;
     DsxArtBarras: TDataSource;
     SPMovResumido: TFIBDataSetRO;
     frDBSPMovResumido: TfrDBDataSet;
     xAlmacen_Desde: TFIBDataSetRO;
     DSSPMovResumido: TDataSource;
     xCanalDesde: TFIBDataSetRO;
     DSxCanalDesde: TDataSource;
     DSxCanalHasta: TDataSource;
     xCanalHasta: TFIBDataSetRO;
     xClienteD: TFIBDataSetRO;
     DSxClienteD: TDataSource;
     xClienteH: TFIBDataSetRO;
     DSxClienteH: TDataSource;
     xNombre: TFIBDataSetRO;
     QPorcEscandallo: THYFIBQuery;
     QMovOrigen: THYFIBQuery;
     xStock: TFIBDataSetRO;
     DSxStock: TDataSource;
     xMovD: TFIBDataSetRO;
     DSxMovD: TDataSource;
     xMovH: TFIBDataSetRO;
     DSxMovH: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     xFamiliaH: TFIBDataSetRO;
     DSxFamiliaD: TDataSource;
     DSxFamiliaH: TDataSource;
     xFamiliaDTITULO: TFIBStringField;
     xFamiliaHTITULO: TFIBStringField;
     SaldoUdsAnt: THYFIBQuery;
     frxArticulos: TfrxHYReport;
     TArtMovStock: THYTransaction;
     procedure DMRArticulosDestroy(Sender: TObject);
     procedure frArticulosGetValue(const ParName: string; var ParValue: variant);
     procedure frArticulosEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRFichasArticulosCreate(Sender: TObject);
     procedure frUserDSCodBarrasCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUserDSCodBarrasFirst(Sender: TObject);
     procedure frUserDSCodBarrasNext(Sender: TObject);
     procedure CambiaClienteD(Cliente: integer);
     procedure CambiaClienteH(Cliente: integer);
     procedure frxArticulosBeforePrint(Sender: TfrxReportComponent);
     procedure frxArticulosGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     // variables para el detalle
     unid_E, unid_S: double;
     valor_E, valor_S: double;
     Saldo: double;
     Con_Stock: smallint;
     // Valores que retorna el procedimiento 'Saldo Anterior'
     Unid_Ent, Unid_Sal: double;
     Valo_Ent, Valo_Sal: double;
     // Parametros que requiere el procedimiento 'Saldo Anterior'
     VAlmacen, VArticulo: string;
     VPer_Ini: string;
     // Valores para el Código de Barras
     nBarra, TotalBarras: integer;
     imgCodBarras: TImage;
     PorPeriod: boolean;
     Periodo2: string;
     // Procedimientos Privados
     procedure SaldoAnterior;
  public
     { Public declarations }
     // Variables especiales para listado de codigos de barras
     PiezasCaja: integer;
     NumLote: string;
     Fecha: TDateTime;
     // variable de impresion de pijama
     SW: integer;
     // variables comunes para limites de impresion
     p_desde, p_hasta, a_desde: string;
     a_hasta, art_desde, art_hasta: string;
     Can_desde, Can_hasta: smallint;
     PeriodoDesde, PeriodoHasta: string;
     DesdeFecha, HastaFecha: TDateTime;
     ArticuloDesde, ArticuloHasta, AlmacenDesde, AlmacenHasta, Serie_Desde, Serie_Hasta, RangoMov, RangoSerie, RangoFam: string;
     ClienteDesde, ClienteHasta: integer;
     IncluirDireccion, FiltroSerie, FiltroMov, SoloEntradas, SoloSalidas: boolean;
     procedure Rangos;
     procedure MostrarListado(PeriodoD, PeriodoH, AlmacenD, AlmacenH, ArticuloD, ArticuloH: string; Modo, ClienteD, ClienteH: integer; FechaD, FechaH: TDateTime; PorPeriodos, PorClientes, ConStock: boolean; CanalD, CanalH: smallint; SerieD, SerieH, MovD, MovH, FamiliaD, FamiliaH, SubFamiliaD, SubFamiliaH: string);
     procedure MostrarListadoFiltrado(Modo, SWFil: integer);
     procedure MostrarListadoCodBarras(Articulo: string; ICodBarras: TImage; numBarras: integer; Modo: integer);
     procedure ListadoMovResumido(PeriodoD, PeriodoH, AlmacenD, AlmacenH, ArticuloD, ArticuloH: string; Modo: integer; FechaD, FechaH: TDateTime; PorPeriodos: boolean; CanalD, CanalH: smallint; FamiliaD, FamiliaH: string);
     procedure FiltraMov(Tipo, Modo: string);
     procedure FiltraFamilia(Familia: string; Modo: byte);
  end;

var
  DMRFichasArticulos : TDMRFichasArticulos;
//picCodBarras : TPicture;

implementation

uses UEntorno, UDMMain, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMRFichasArticulos.DMRFichasArticulosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  Con_Stock := 0;
end;

procedure TDMRFichasArticulos.DMRArticulosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRFichasArticulos.Rangos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(PERIODO), MAX(PERIODO) FROM ART_MOV_STOCKS WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        PeriodoDesde := FieldByName['MIN'].AsString;
        PeriodoHasta := FieldByName['MAX'].AsString;
        if (PeriodoDesde = '') then
           PeriodoDesde := '01';
        if (PeriodoHasta = '') then
           PeriodoHasta := '12';
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(FECHA), MAX(FECHA) FROM ART_MOV_STOCKS WHERE EMPRESA = ?EMPRESA /* AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL */';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        {dji lrk kri - Todo el periodo que tenga movimientos
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger  := REntorno.Canal;
        }
        ExecQuery;
        DesdeFecha := FieldByName['MIN'].AsDateTime;
        HastaFecha := FieldByName['MAX'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(ARTICULO), MAX(ARTICULO) FROM ART_MOV_STOCKS WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        ArticuloDesde := FieldByName['MIN'].AsString;
        ArticuloHasta := FieldByName['MAX'].AsString;
        if (ArticuloDesde = '') then
           ArticuloDesde := '.';
        if (ArticuloHasta = '') then
           ArticuloHasta := '¿?';
        FreeHandle;
     finally
        Free;
     end;
  end;

  DameMinMax('ALM', AlmacenDesde, AlmacenHasta);
  DameMinMax('CLI', ClienteDesde, ClienteHasta);

  FiltroSerie := False;
  FiltroMov := False;
  SoloEntradas := False;
  SoloSalidas := False;
end;

// Listado de Mov. de Artículos
procedure TDMRFichasArticulos.MostrarListado(PeriodoD, PeriodoH, AlmacenD, AlmacenH, ArticuloD, ArticuloH: string; Modo, ClienteD, ClienteH: integer; FechaD, FechaH: TDateTime; PorPeriodos, PorClientes, ConStock: boolean; CanalD, CanalH: smallint; SerieD, SerieH, MovD, MovH, FamiliaD, FamiliaH, SubFamiliaD, SubFamiliaH: string);
var
  WherePeriodo, WhereSerie, WhereTipoMov, WhereTipoOperacion, WhereSubfamilia, Orden : string;
  Grupo : integer;
begin
  SW := 1;
  // Normalizar parámetros Desde-Hasta
  DMListados.Normalizar_Desde_Hasta(PeriodoD, PeriodoH);
  DMListados.Normalizar_Desde_Hasta(AlmacenD, AlmacenH);
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(MovD, MovH);
  DMListados.Normalizar_Desde_Hasta(FamiliaD, FamiliaH);
  DMListados.Normalizar_Desde_Hasta(SubFamiliaD, SubFamiliaH);
  DMListados.Normalizar_Desde_Hasta(SerieD, SerieH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  p_desde := PeriodoD;
  p_hasta := PeriodoH;
  DesdeFecha := FechaD;
  HastaFecha := FechaH;
  a_desde := AlmacenD;
  a_hasta := AlmacenH;
  art_desde := ArticuloD;
  art_hasta := ArticuloH;
  PorPeriod := PorPeriodos;
  Can_desde := CanalD;
  Can_hasta := CanalH;

  Unid_Ent := 0;
  Unid_Sal := 0;
  Valo_Ent := 0;
  Valo_Sal := 0;
  unid_E := 0;
  unid_S := 0;
  valor_E := 0;
  valor_S := 0;
  saldo := 0;

  if PorPeriodos then
     {dji lrk kri - sin art.XXXXXX no funciona}
     WherePeriodo := ' AND ART.EJERCICIO=?EJERCICIO AND ART.PERIODO >= ?DESDE_PERIODO AND ART.PERIODO <= ?HASTA_PERIODO '
  else
     WherePeriodo := ' AND ART.FECHA>= ?FECHA_D AND ART.FECHA<= ?FECHA_H ';

  WhereSerie := '';
  RangoSerie := '';
  WhereTipoMov := '';
  WhereTipoOperacion := '';
  WhereSubfamilia := '';
  Orden := '';
  RangoMov := '';

  if FiltroSerie then
  begin
     if SerieD = SerieH then
        RangoSerie := Format(_('Serie: %s'), [SerieD])
     else
        RangoSerie := Format(_('Serie desde %s hasta %s'), [SerieD, SerieH]);
     WhereSerie := ' AND DOC_SERIE >= ?SERIED AND DOC_SERIE <= ?SERIEH ';
     Orden := ' ART.DOC_SERIE,';
  end;

  RangoFam := Format(_('Desde familia %s hasta familia %s'), [FamiliaD, FamiliaH]);
  if (SubFamiliaD <> '') or (SubFamiliaH <> '') then
  begin
     RangoFam := RangoFam + Format(_(' Desde subfamilia %s hasta subfamilia %s'), [SubFamiliaD, SubFamiliaH]);
     WhereSubfamilia := ' AND ARTIC.SUBFAMILIA >= ?SUBFAMILIAD AND ARTIC.SUBFAMILIA <= ?SUBFAMILIAH ';
  end;

  if FiltroMov then
  begin
     if MovD = MovH then
        RangoMov := Format(_('Tipo mov. : %s'), [MovD])
     else
        RangoMov := Format(_('Tipo mov. desde %s hasta %s'), [MovD, MovH]);
     WhereTipoMov := ' AND art.ORIGEN >= ?ORIGEND AND art.ORIGEN <= ?ORIGENH ';

     if SoloEntradas <> SoloSalidas then
     begin
        if SoloEntradas then
        begin
           WhereTipoOperacion := ' AND TIPO_OPER IN( ''E'',''D'' )';
           RangoMov := RangoMov + ', ' + _('solo entradas');
        end;

        if SoloSalidas then
        begin
           WhereTipoOperacion := ' AND TIPO_OPER IN( ''S'',''O'')';
           RangoMov := RangoMov + ', ' + _('solo salidas');
        end;
     end;
  end;

  with xArt_Mov_Stock do
  begin
     Close;
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;

     SelectSQL.Clear;
     Plan.Clear;

     if PorClientes then
     begin
        SelectSQL.Add(' SELECT ART.EMPRESA, ART.EJERCICIO, ART.CANAL, ART.N_MOV_STOCK, ART.PERIODO, ART.ALMACEN, ART.ARTICULO, ART.TIPO_OPER, ');
        SelectSQL.Add('        ART.FECHA, ART.COMENTARIO, ART.UNIDADES, ART.PRECIO, ART.ORIGEN, ART.IMPORTE, ART.DOC_NUMERO, ART.DOC_SERIE, ');
        SelectSQL.Add('        ART.ENTRADA, ART.ACTIVO, ART.UNIDADES_EXT, ART.PRECIO_SIN_DTO, EMP.CLIENTE AS CLIENTE, ');
        SelectSQL.Add('        TER.NOMBRE_R_SOCIAL AS TITULO_CLIENTE, DIR.DIR_COMPLETA_N AS DIRECCION, LOC.TITULO AS LOCALIDAD, MOV_VIRTUAL, ');
        SelectSQL.Add('        GD.B_IMPONIBLE, GD.P_COSTE, GD.T_COSTE, GD.LOTE_SIMPLE, ');
        SelectSQL.Add('        (SELECT PRECIO ');
        SelectSQL.Add('         FROM A_ART_OBTENER_PRECIO_FECHA(ART.EMPRESA, ART.CANAL, ART.ALMACEN, ART.ARTICULO, ART.FECHA, 0)) PMP ');
        SelectSQL.Add(' FROM ART_MOV_STOCKS ART ');
        SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S G ON ART.DOC_NUMERO = G.RIG AND ART.EMPRESA = G.EMPRESA AND ART.EJERCICIO = G.EJERCICIO AND ART.CANAL = G.CANAL AND ART.DOC_SERIE = G.SERIE AND ART.ORIGEN = G.TIPO ');
        SelectSQL.Add(' LEFT JOIN GES_DETALLES_S GD ON ART.EMPRESA = GD.EMPRESA AND ART.EJERCICIO = GD.EJERCICIO AND ART.CANAL = GD.CANAL AND ART.ORIGEN = GD.TIPO AND ART.DOC_SERIE = GD.SERIE AND ART.DOC_NUMERO = GD.RIG AND ART.N_MOV_STOCK = GD.M_MOV_STOCK ');
        SelectSQL.Add(' LEFT JOIN EMP_CLIENTES EMP ON EMP.EMPRESA = ART.EMPRESA AND EMP.CLIENTE = G.CLIENTE ');
        SelectSQL.Add(' LEFT JOIN SYS_TERCEROS TER ON EMP.TERCERO = TER.TERCERO ');
        SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES DIR ON DIR.TERCERO = EMP.TERCERO AND DIR.DIR_DEFECTO = 1 ');
        SelectSQL.Add(' LEFT JOIN SYS_LOCALIDADES LOC ON LOC.LOCALIDAD = DIR.DIR_LOCALIDAD ');
        SelectSQL.Add(' JOIN ART_ARTICULOS ARTIC ON ART.ID_A = ARTIC.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ART.EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' ART.CANAL >= :CANALD AND ');
        SelectSQL.Add(' ART.CANAL <= :CANALH AND ');
        SelectSQL.Add(' ART.ALMACEN >= :DESDE_ALMACEN AND ');
        SelectSQL.Add(' ART.ALMACEN <= :HASTA_ALMACEN AND ');
        SelectSQL.Add(' ART.ARTICULO >= :DESDE_ARTICULO AND ');
        SelectSQL.Add(' ART.ARTICULO <= :HASTA_ARTICULO AND ');
        SelectSQL.Add(' G.CLIENTE >= :CLIENTED AND ');
        SelectSQL.Add(' G.CLIENTE <= :CLIENTEH AND ');
        SelectSQL.Add(' ARTIC.FAMILIA >= :FAMILIAD AND ');
        SelectSQL.Add(' ARTIC.FAMILIA <= :FAMILIAH ');
        SelectSQL.Add(WherePeriodo);
        SelectSQL.Add(WhereSerie);
        SelectSQL.Add(WhereTipoMov);
        SelectSQL.Add(WhereTipoOperacion);
        SelectSQL.Add(WhereSubfamilia);
        SelectSQL.Add(' ORDER BY ');
        SelectSQL.Add(Orden);
        SelectSQL.Add(' ART.ALMACEN, ART.ARTICULO, EMP.CLIENTE, ART.FECHA, ART.N_MOV_STOCK ');
     end
     else
     begin
        SelectSQL.Add(' SELECT ART.EMPRESA, ART.EJERCICIO, ART.CANAL, ART.N_MOV_STOCK, ART.PERIODO, ART.ALMACEN, ART.ARTICULO, ART.TIPO_OPER, ');
        SelectSQL.Add('        ART.FECHA, ART.COMENTARIO, ART.UNIDADES, ART.PRECIO, ART.ORIGEN, ART.IMPORTE, ART.DOC_NUMERO, ART.DOC_SERIE, ');
        SelectSQL.Add('        ART.ENTRADA, ART.ACTIVO, ART.UNIDADES_EXT, ART.PRECIO_SIN_DTO, CAST(0 AS INTEGER) CLIENTE, ');
        SelectSQL.Add('        CAST('' '' AS VARCHAR(60)) TITULO_CLIENTE, CAST('' '' AS VARCHAR(76)) DIRECCION, CAST('' '' AS VARCHAR(40)) LOCALIDAD, ');
        SelectSQL.Add('        ART.MOV_VIRTUAL, GD.B_IMPONIBLE, GD.P_COSTE, GD.T_COSTE, GD.LOTE_SIMPLE, ');
        SelectSQL.Add('        (SELECT PRECIO ');
        SelectSQL.Add('         FROM A_ART_OBTENER_PRECIO_FECHA(ART.EMPRESA, ART.CANAL, ART.ALMACEN, ART.ARTICULO, ART.FECHA, 0)) PMP ');
        SelectSQL.Add(' FROM ART_MOV_STOCKS ART ');
        SelectSQL.Add(' LEFT JOIN GES_DETALLES_S GD ON ART.EMPRESA = GD.EMPRESA AND ART.EJERCICIO = GD.EJERCICIO AND ART.CANAL = GD.CANAL AND ART.ORIGEN = GD.TIPO AND ART.DOC_SERIE = GD.SERIE AND ART.DOC_NUMERO = GD.RIG AND ART.N_MOV_STOCK = GD.M_MOV_STOCK ');
        SelectSQL.Add(' JOIN ART_ARTICULOS ARTIC ON ART.ID_A = ARTIC.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ART.EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' ART.CANAL >= :CANALD AND ');
        SelectSQL.Add(' ART.CANAL <= :CANALH AND ');
        SelectSQL.Add(' ART.ALMACEN >= :DESDE_ALMACEN AND ');
        SelectSQL.Add(' ART.ALMACEN <= :HASTA_ALMACEN AND ');
        SelectSQL.Add(' ART.ARTICULO >= :DESDE_ARTICULO AND ');
        SelectSQL.Add(' ART.ARTICULO <= :HASTA_ARTICULO AND ');
        SelectSQL.Add(' ARTIC.FAMILIA >= :FAMILIAD AND ');
        SelectSQL.Add(' ARTIC.FAMILIA <= :FAMILIAH ');
        SelectSQL.Add(WherePeriodo);
        SelectSQL.Add(WhereSerie);
        SelectSQL.Add(WhereTipoMov);
        SelectSQL.Add(WhereTipoOperacion);
        SelectSQL.Add(WhereSubfamilia);
        SelectSQL.Add(' ORDER BY ');
        SelectSQL.Add(Orden);
        SelectSQL.Add(' ART.ALMACEN, ART.ARTICULO, ART.FECHA, ART.N_MOV_STOCK ');
     end;

     xArt_Mov_Stock.Fields.Clear;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANALD'].AsInteger := CanalD;
     Params.ByName['CANALH'].AsInteger := CanalH;
     Params.ByName['DESDE_ALMACEN'].AsString := AlmacenD;
     Params.ByName['HASTA_ALMACEN'].AsString := AlmacenH;
     Params.ByName['DESDE_ARTICULO'].AsString := ArticuloD;
     Params.ByName['HASTA_ARTICULO'].AsString := ArticuloH;
     Params.ByName['FAMILIAD'].AsString := FAMILIAD;
     Params.ByName['FAMILIAH'].AsString := FAMILIAH;
     if PorPeriodos then
     begin
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['DESDE_PERIODO'].AsString := PeriodoD;
        Params.ByName['HASTA_PERIODO'].AsString := PeriodoH;
     end
     else
     begin
        Params.ByName['FECHA_D'].AsDateTime := FechaD;
        Params.ByName['FECHA_H'].AsDateTime := FechaH;
     end;

     if PorClientes then
     begin
        Params.ByName['CLIENTED'].AsInteger := ClienteD;
        Params.ByName['CLIENTEH'].AsInteger := ClienteH;
     end;

     if FiltroSerie then
     begin
        Params.ByName['SERIED'].AsString := SerieD;
        Params.ByName['SERIEH'].AsString := SerieH;
     end;

     if FiltroMov then
     begin
        Params.ByName['ORIGEND'].AsString := MovD;
        Params.ByName['ORIGENH'].AsString := MovH;
     end;

     if (WhereSubfamilia <> '') then
     begin
        Params.ByName['SUBFAMILIAD'].AsString := SubfamiliaD;
        Params.ByName['SUBFAMILIAH'].AsString := SubfamiliaH;
     end;

     Open;
  end;

  with xArt_Articulos do
  begin
     Close;
     Open;
  end;

  with xArt_Almacenes do
  begin
     Close;
     Open;
  end;

  if ConStock then
  begin
     Con_Stock := 1;
     with xStock do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := can_desde;
        Params.ByName['CANAL_D'].AsInteger := can_desde;
        Params.ByName['CANAL_H'].AsInteger := can_hasta;
        // Params.ByName['ARTICULO'].AsString := ;
        Params.ByName['ALMACEN_D'].AsString := AlmacenD;
        Params.ByName['ALMACEN_H'].AsString := AlmacenH;
        Open;
     end;
  end
  else
     Con_Stock := 0;

  if (PorClientes) then
     Grupo := 148
  else
     Grupo := 49;

  DMListados.Imprimir(Grupo, 0, Modo, '', _('Listado de Movimiento de Artículos'), frArticulos, frxArticulos, nil, nil);

  if (xArt_Mov_Stock.Transaction.InTransaction) then
     xArt_Mov_Stock.Transaction.Commit;
end;

// Listado de Mov. Resumido
procedure TDMRFichasArticulos.ListadoMovResumido(PeriodoD, PeriodoH, AlmacenD, AlmacenH, ArticuloD, ArticuloH: string; Modo: integer; FechaD, FechaH: TDateTime; PorPeriodos: boolean; CanalD, CanalH: smallint; FamiliaD, FamiliaH: string);
begin
  SW := 1;
  // Normalizar parámetros Desde-Hasta
  DMListados.Normalizar_Desde_Hasta(PeriodoD, PeriodoH);
  DMListados.Normalizar_Desde_Hasta(AlmacenD, AlmacenH);
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(FamiliaD, FamiliaH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  p_desde := PeriodoD;
  p_hasta := PeriodoH;
  DesdeFecha := FechaD;
  HastaFecha := FechaH;
  a_desde := AlmacenD;
  a_hasta := AlmacenH;
  art_desde := ArticuloD;
  art_hasta := ArticuloH;
  PorPeriod := PorPeriodos;
  Can_desde := CanalD;
  Can_hasta := CanalH;
  RangoFam := 'Desde familia ' + FamiliaD + ' hasta familia ' + FamiliaH;

  with SPMovResumido do
  begin
     Close;
     if PorPeriodos then
     begin
        SelectSQL.Text :=
           'SELECT * FROM A_ART_MOV_RESUMIDO(?EMPRESA,?EJERCICIO,?CANALD,?CANALH,' +
           '?DESDE_PERIODO,?HASTA_PERIODO,?DESDE_ALMACEN,?HASTA_ALMACEN,?DESDE_ARTICULO,?HASTA_ARTICULO,?FAMILIAD,?FAMILIAH)';
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['DESDE_PERIODO'].AsString := PeriodoD;
        Params.ByName['HASTA_PERIODO'].AsString := PeriodoH;
        Params.ByName['FAMILIAD'].AsString := FamiliaD;
        Params.ByName['FAMILIAH'].AsString := FamiliaH;
     end
     else
     begin
        SelectSQL.Text := 'SELECT * FROM A_ART_MOV_RESUMIDO_FECHA(?EMPRESA,?CANALD,?CANALH,' +
           '?FECHA_D,?FECHA_H,?DESDE_ALMACEN,?HASTA_ALMACEN,?DESDE_ARTICULO,?HASTA_ARTICULO,?FAMILIAD,?FAMILIAH)';
        Params.ByName['FECHA_D'].AsDateTime := FechaD;
        Params.ByName['FECHA_H'].AsDateTime := FechaH;
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANALD'].AsInteger := CanalD;
     Params.ByName['CANALH'].AsInteger := CanalH;
     Params.ByName['DESDE_ALMACEN'].AsString := AlmacenD;
     Params.ByName['HASTA_ALMACEN'].AsString := AlmacenH;
     Params.ByName['DESDE_ARTICULO'].AsString := ArticuloD;
     Params.ByName['HASTA_ARTICULO'].AsString := ArticuloH;
     Params.ByName['FAMILIAD'].AsString := FamiliaD;
     Params.ByName['FAMILIAH'].AsString := FamiliaH;
     Open;
  end;

  DMListados.Imprimir(95, 0, Modo, '', _('Listado de Movimientos Resumido'), frArticulos, frxArticulos, nil, nil);
end;

procedure TDMRFichasArticulos.frArticulosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Inicializa' then
  begin
     Unid_Ent := 0;
     Unid_Sal := 0;
     Valo_Ent := 0;
     Valo_Sal := 0;
     unid_E := 0;
     unid_S := 0;
     valor_E := 0;
     valor_S := 0;
     saldo := 0;
  end;

  if ParName = 'Periodo_o_Fecha' then
     if PorPeriod then
     begin
        ParValue := Format(_('Periodo: %s %s'), [p_desde, xPeriodo_Desde.FieldByName('TITULO').AsString]);
        if (p_desde = p_hasta) then
           Periodo2 := ''
        else
           Periodo2 := p_hasta + ' ' + xPeriodo_Hasta.FieldByName('TITULO').AsString;
     end
     else
     begin
        ParValue := Format(_('Fechas: %s - %s'), [DateToStr(DesdeFecha), DateToStr(HastaFecha)]);
        Periodo2 := '';
     end;

  if ParName = 'StockAFechaInicio' then
  begin
     ParValue := DMMain.DameStockArticuloFecha(
        REntorno.Empresa,
        SPMovResumido.FieldByName('CANAL').AsInteger,
        SPMovResumido.FieldByName('ARTICULO').AsString,
        SPMovResumido.FieldByName('ALMACEN').AsString,
        DesdeFecha);
  end;

  if ParName = 'Periodo2' then
     ParValue := Periodo2;

  if ParName = 'Almacen_Desde' then
     ParValue := a_desde;
  if ParName = 'Almacen_Hasta' then
     if (a_desde = a_hasta) then
        ParValue := ''
     else
        ParValue := a_hasta;
  if ParName = 'AlmacenDTxt' then
     ParValue := xAlmacen_Desde.FieldByName('TITULO').AsString;
  if ParName = 'AlmacenHTxt' then
     if (a_desde = a_hasta) then
        ParValue := ''
     else
        ParValue := xAlmacen_Hasta.FieldByName('TITULO').AsString;

  if ParName = 'Articulo_Desde' then
     ParValue := art_desde;
  if ParName = 'Articulo_Hasta' then
     if (art_desde = art_hasta) then
        ParValue := ''
     else
        ParValue := art_hasta;
  if ParName = 'ArticuloDTxt' then
     ParValue := xArt_Desde.FieldByName('TITULO').AsString;
  if ParName = 'ArticuloHTxt' then
     if (art_desde = art_hasta) then
        ParValue := ''
     else
        ParValue := xArt_Hasta.FieldByName('TITULO').AsString;

  if ParName = 'Canal_Desde' then
     ParValue := Can_desde;
  if ParName = 'Canal_Hasta' then
     if (Can_desde = Can_hasta) then
        ParValue := ''
     else
        ParValue := Can_hasta;
  if ParName = 'CanalDTxt' then
     ParValue := xCanalDesde.FieldByName('TITULO').AsString;
  if ParName = 'CanalHTxt' then
     if (Can_desde = Can_hasta) then
        ParValue := ''
     else
        ParValue := xCanalHasta.FieldByName('TITULO').AsString;

  if ParName = 'Unidades Entrada' then
  begin
     if ((xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'E') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'A') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'D')) then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('UNIDADES').AsFloat;
        Unid_E := Unid_E + xArt_Mov_Stock.FieldByName('UNIDADES').AsFloat;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Valor Entrada' then
  begin
     if ((xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'E') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'A') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'D')) then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        Valor_E := Valor_E + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Unidades Salida' then
  begin
     if ((xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O')) then
     begin
        if xArt_Mov_Stock.FieldByName('UNIDADES').AsString = '-' then
           ParValue := 0
        else {dji lrk kri}
           ParValue := xArt_Mov_Stock.FieldByName('UNIDADES').AsFloat;
        Unid_S := Unid_S + xArt_Mov_Stock.FieldByName('UNIDADES').AsFloat;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Valor Salida' then
  begin
     if ((xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O')) then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        Valor_S := Valor_S + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
     end
     else
        ParValue := 0;
  end;

  { dji lrk kri - Para que muestre el precio de venta con los descuentos }
  if ParName = 'Valor Salida kri' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O') then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        Valor_S := Valor_S + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
     end
     else if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        Valor_S := Valor_S + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
     end
     else if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') then
     begin
        if xArt_Mov_Stock.FieldByName('MOV_VIRTUAL').AsInteger = 0 then
        begin
           if xArt_Mov_Stock.FieldByName('B_IMPONIBLE').IsNull then
           begin
              ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
              Valor_S := Valor_S + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
           end
           else
           begin
              ParValue := xArt_Mov_Stock.FieldByName('B_IMPONIBLE').AsFloat;
              Valor_S := Valor_S + xArt_Mov_Stock.FieldByName('B_IMPONIBLE').AsFloat;
           end;
        end
        else
        begin
           QMovOrigen.Close;
           QMovOrigen.Params.ByName['EMPRESA'].AsInteger :=
              xArt_Mov_Stock.FieldByName('EMPRESA').AsInteger;
           QMovOrigen.Params.ByName['EJERCICIO'].AsInteger :=
              xArt_Mov_Stock.FieldByName('EJERCICIO').AsInteger;
           QMovOrigen.Params.ByName['CANAL'].AsInteger :=
              xArt_Mov_Stock.FieldByName('CANAL').AsInteger;
           QMovOrigen.Params.ByName['N_MOV_STOCK'].AsInteger :=
              xArt_Mov_Stock.FieldByName('MOV_VIRTUAL').AsInteger;
           QMovOrigen.ExecQuery;

           QPorcEscandallo.Close;
           QPorcEscandallo.Params.ByName['EMPRESA'].AsInteger :=
              xArt_Mov_Stock.FieldByName('EMPRESA').AsInteger;
           QPorcEscandallo.Params.ByName['CANAL'].AsInteger :=
              xArt_Mov_Stock.FieldByName('CANAL').AsInteger;
           QPorcEscandallo.Params.ByName['ALMACEN'].AsString :=
              xArt_Mov_Stock.FieldByName('ALMACEN').AsString;
           QPorcEscandallo.Params.ByName['FECHA'].AsDateTime :=
              xArt_Mov_Stock.FieldByName('FECHA').AsDateTime;
           QPorcEscandallo.Params.ByName['ARTICULO'].AsString :=
              QMovOrigen.FieldByName['ARTICULO'].AsString;
           QPorcEscandallo.Params.ByName['DETALLE'].AsString :=
              xArt_Mov_Stock.FieldByName('ARTICULO').AsString;
           QPorcEscandallo.ExecQuery;

           ParValue := QMovOrigen.FieldByName['B_IMPONIBLE'].AsFloat *
              QPorcEscandallo.FieldByName['PORCENTAJE'].AsFloat / 100;
           Valor_S := Valor_S + (QMovOrigen.FieldByName['B_IMPONIBLE'].AsFloat *
              QPorcEscandallo.FieldByName['PORCENTAJE'].AsFloat / 100);
        end;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Saldo' then
  begin
     if ((xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O')) then
     begin
        saldo := saldo + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        ParValue := saldo;
     end
     else
     begin
        saldo := saldo - xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        ParValue := saldo;
     end;
  end;

  { dji lrk kri - Para que muestre el precio de venta con los descuentos }
  if ParName = 'Saldo kri' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') then
     begin
        saldo := saldo + xArt_Mov_Stock.FieldByName('B_IMPONIBLE').AsFloat;
        ParValue := saldo;
     end
     else if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O') then
     begin
        saldo := saldo + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        ParValue := saldo;
     end
     else
     begin
        saldo := saldo - xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        ParValue := saldo;
     end;
  end;

  if ParName = 'Saldo_Anterior' then
  begin
     unid_E := 0;
     unid_S := 0;
     valor_E := 0;
     valor_S := 0;
     VAlmacen := xArt_Mov_Stock.FieldByName('ALMACEN').AsString;
     VArticulo := xArt_Mov_Stock.FieldByName('ARTICULO').AsString;
     SaldoAnterior;
     Saldo := Valo_Ent - Valo_Sal;
     ParValue := Saldo;
  end;

  if ParName = 'Nombre' then
  begin
     xNombre.Close;
     if xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'E' then
     begin
        if xArt_Mov_Stock.FieldByName('ORIGEN').AsString = 'FAP' then
           xNombre.SelectSQL[1] := 'FROM Ges_Cabeceras_E_FAC C'
        else if xArt_Mov_Stock.FieldByName('ORIGEN').AsString = 'ALP' then
           xNombre.SelectSQL[1] := 'FROM Ges_Cabeceras_E_ALB C';
     end
     else
        xNombre.SelectSQL[1] := 'FROM Ges_Cabeceras_S C';

     xNombre.Open;
     ParValue := xNombre.FieldByName('Nombre_R_Social').AsString;
     xNombre.Close;
  end;

  if ParName = 'Articulo' then
     ParValue := TrimRight(xArt_Mov_Stock.FieldByName('ARTICULO').AsString);

  if ParName = 'CONSTOCK' then
     ParValue := Con_Stock;

  if ParName = 'RangoMov' then
     ParValue := RangoMov;
  if ParName = 'RangoSerie' then
     ParValue := RangoSerie;
  if ParName = 'FiltroSerie' then
     ParValue := FiltroSerie;

  if ParName = 'RangoFam' then
     ParValue := RangoFam;
  if ParName = 'SaldoUdsAnterior' then
  begin
     if (porperiod) then
     begin
        DameDesdeHastaPeriodo(p_desde, DesdeFecha, HastaFecha, xArt_Mov_Stock.FieldByName('EMPRESA').AsInteger);
     end;

     with SaldoUdsAnt do
     begin
        Close;
        SQL.Text := 'execute procedure a_art_obtener_histinfo (?empresa,?canal,?almacen,?articulo,?fecha,0,?id_a)';
        Params.ByName['EMPRESA'].AsInteger := xArt_Mov_Stock.FieldByName('EMPRESA').AsInteger;
        Params.ByName['CANAL'].AsInteger := xArt_Mov_Stock.FieldByName('CANAL').AsInteger;
        Params.ByName['ALMACEN'].AsString := xArt_Mov_Stock.FieldByName('ALMACEN').AsString;
        Params.ByName['ARTICULO'].AsString := xArt_Mov_Stock.FieldByName('ARTICULO').AsString;
        Params.ByName['FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['ID_A'].AsInteger := xArt_Articulos.FieldByName('ID_A').AsInteger;
        ExecQuery;
        ParValue := FieldByName['EXISTENCIAS'].AsFloat;
     end;
  end;

  if ((ParName = 'Z_PiezasCaja') or (ParName = 'PiezasCaja')) then
     ParValue := PiezasCaja;

  if ((ParName = 'Z_NumLote') or (ParName = 'NumLote')) then
     ParValue := NumLote;

  if ((ParName = 'Z_Fecha') or (ParName = 'Fecha')) then
     ParValue := Fecha;
end;

procedure TDMRFichasArticulos.frArticulosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     // Listado de Cód.Barras
     if (Memo[0] = '[ImgCodBarras]') then
        TfrPictureView(View).Picture.Assign(imgCodBarras.Picture);

     // Incluir la direccion para listado de movimientos de artículos por cliente
     if (Memo[0] = '[Direccion] [Localidad]') then
        if (IncluirDireccion) then
           View.Visible := True
        else
           View.Visible := False;

     {if (Memo[0] = '[Empresa]') then
      begin
        Memo.Delete(0);
        Memo.Add(Rentorno.NombreEmpresa);
      end;  }
  end;
end;

//Retorna los saldos y unidades anteriores.
procedure TDMRFichasArticulos.SaldoAnterior;
begin
  with SPRSaldos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := VAlmacen;
     Params.ByName['ARTICULO'].AsString := VArticulo;
     Params.ByName['PER_INI'].AsString := VPer_Ini;
     ExecQuery;
     Unid_Ent := FieldByName['UNID_ENT'].AsFloat;
     Valo_Ent := FieldByName['VALO_ENT'].AsFloat;
     Unid_Sal := FieldByName['UNID_SAL'].AsFloat;
     Valo_Sal := FieldByName['VALO_SAL'].AsFloat;
     FreeHandle;
  end;
end;

procedure TDMRFichasArticulos.MostrarListadoFiltrado(Modo, SWFil: integer);
begin
  SW := 1;
  Unid_Ent := 0;
  Unid_Sal := 0;
  Valo_Ent := 0;
  Valo_Sal := 0;
  unid_E := 0;
  unid_S := 0;
  valor_E := 0;
  valor_S := 0;
  saldo := 0;

  if (SWFil = 0) then
     DMMain.FiltraRO(xArt_Articulos, '11000', True);

  with xArt_Mov_Stock do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     {Params.ByName['DESDE_PERIODO'].AsString  := PeriodoD;
      Params.ByName['HASTA_PERIODO'].AsString  := PeriodoH;
      Params.ByName['DESDE_ALMACEN'].AsString  := AlmacenD;
      Params.ByName['HASTA_ALMACEN'].AsString  := AlmacenH;}
     //Params.ByName['DESDE_ARTICULO'].AsString := ArticuloD;
     //Params.ByName['HASTA_ARTICULO'].AsString := ArticuloH;
     Open;
  end;

  with xArt_Articulos do
  begin
     Close;
     Open;
  end;

  with xArt_Almacenes do
  begin
     Close;
     Open;
  end;

  DMListados.Imprimir(49, 0, Modo, '', _('Listado de Movimiento de Artículos'), frArticulos, frxArticulos, nil, nil);
end;

// ---------------   Listado de Cód. de Barras   ---------------

procedure TDMRFichasArticulos.MostrarListadoCodBarras(Articulo: string; ICodBarras: TImage; numBarras: integer; Modo: integer);
begin
  with xArtBarras do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
  TotalBarras := numBarras;
  imgCodBarras := ICodBarras;

  DMListados.Imprimir(63, 0, Modo, '', _('Listado de Codigos de Barras'), frArticulos, frxArticulos, nil, nil);
end;

procedure TDMRFichasArticulos.frUserDSCodBarrasCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := EOF or (nBarra >= TotalBarras);
end;

procedure TDMRFichasArticulos.frUserDSCodBarrasFirst(Sender: TObject);
begin
  nBarra := 0;  // Inicializar contador de números de barra
end;

procedure TDMRFichasArticulos.frUserDSCodBarrasNext(Sender: TObject);
begin
  Inc(nBarra);  // Incrementar contador
end;

procedure TDMRFichasArticulos.CambiaClienteD(Cliente: integer);
begin
  with xClienteD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMRFichasArticulos.CambiaClienteH(Cliente: integer);
begin
  with xClienteH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

// ---------------------------------------------------------

procedure TDMRFichasArticulos.FiltraMov(Tipo, Modo: string);
begin
  if Modo = 'D' then
     with xMovD do
     begin
        Close;
        Params.ByName['TIPO'].AsString := Tipo;
        Open;
     end
  else
     with xMovH do
     begin
        Close;
        Params.ByName['TIPO'].AsString := Tipo;
        Open;
     end;
end;

procedure TDMRFichasArticulos.FiltraFamilia(Familia: string; Modo: byte);
begin
  case Modo of
     0: with xFamiliaD do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['FAMILIA'].AsString := Familia;
           Open;
        end;
     1: with xFamiliaH do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['FAMILIA'].AsString := Familia;
           Open;
        end;
  end;
end;

procedure TDMRFichasArticulos.frxArticulosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
        if (Memo.Count > 0) then
        begin
           if Pos('[ImgCodBarras]', Memo[0]) > 0 then
           begin
              TfrxPictureView(Sender).Picture.Assign(imgCodBarras.Picture);
           end;
           if Pos('[Direccion] [Localidad]', Memo[0]) > 0 then
           begin
              if (IncluirDireccion) then
                 Visible := True
              else
                 Visible := False;
           end;
        end;
     end;
  end;
end;

procedure TDMRFichasArticulos.frxArticulosGetValue(const VarName: string; var Value: variant);
begin
  frArticulosGetValue(VarName, Value);
end;

end.
