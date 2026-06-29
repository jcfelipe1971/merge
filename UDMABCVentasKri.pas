unit UDMABCVentasKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FR_Chart, FIBDataSetRO,
  HYFIBQuery;

type
  TDMABCVentasKri = class(TDataModule)
     TLocal: THYTransaction;
     xCanales: TFIBQuery;
     xAlmacenes: TFIBQuery;
     xAgente: TFIBDataSetRO;
     DSxAgente: TDataSource;
     SPAcumula: THYFIBQuery;
     xTmp_Abc_Agentes: TFIBDataSetRO;
     DSxTmp_Abc_Agentes: TDataSource;
     QDameFecha: THYFIBQuery;
     frAbc: TfrHYReport;
     frDBxTmp_Abc_Agentes: TfrDBDataSet;
     xAgenteH: TFIBDataSetRO;
     DSxAgenteH: TDataSource;
     QMaxAgente: THYFIBQuery;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xClienteH: TFIBDataSetRO;
     DSxClienteH: TDataSource;
     QMaxCliente: THYFIBQuery;
     xAgrupacionCli: TFIBDataSetRO;
     DSxAgrupacionCli: TDataSource;
     QMinAgrupacion: THYFIBQuery;
     SPAcumulaCli: THYFIBQuery;
     xTmp_Abc_Clientes: TFIBDataSetRO;
     DSxTmp_Abc_Clientes: TDataSource;
     frDBxTmp_Abc_Clientes: TfrDBDataSet;
     xTmp_Abc_Articulos: TFIBDataSetRO;
     DSxTmp_Abc_Articulos: TDataSource;
     frDBxTmp_Abc_Articulos: TfrDBDataSet;
     xArticuloD: TFIBDataSetRO;
     DSxArticuloD: TDataSource;
     DSxArticuloH: TDataSource;
     xArticuloH: TFIBDataSetRO;
     xFamiliaH: TFIBDataSetRO;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     SPAcumulaArt: THYFIBQuery;
     frChartObject1: TfrChartObject;
     SPAcumulaArtFam: THYFIBQuery;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     QMinFamilia: THYFIBQuery;
     QMaxFamilia: THYFIBQuery;
     QTitulo_Almacenes: THYFIBQuery;
     xAgrupacionCliH: TFIBDataSetRO;
     DSxAgrupacionCliH: TDataSource;
     QMaxAgrupacion: THYFIBQuery;
     xAgrupaciones: TFIBQuery;
     QTitulo_Agente: THYFIBQuery;
     xTipos_volumenes: TFIBDataSetRO;
     QTitulo_fam: TFIBQuery;
     QTipo_cli: TFIBQuery;
     QRutas: TFIBQuery;
     QtituloCli: THYFIBQuery;
     SPAcumulaArtAlm: THYFIBQuery;
     XFamiliaD2: TFIBDataSetRO;
     DSXFamiliaD2: TDataSource;
     xFamiliaH2: TFIBDataSetRO;
     DSxFamiliaH2: TDataSource;
     xTmp_Abc_Clientes_Fam: TFIBDataSetRO;
     DSxTmp_Abc_Clientes_Fam: TDataSource;
     frDBxTmp_Abc_Clientes_Fam: TfrDBDataSet;
     procedure Graba(DataSet: TDataSet);
     procedure DMABCVentasCreate(Sender: TObject);
     procedure DMABCVentasDestroy(Sender: TObject);
     procedure frAbcGetValue(const ParName: string; var ParValue: variant);
     procedure frAbcEnterRect(Memo: TStringList; View: TfrView);
     procedure xTmp_Abc_ClientesAfterOpen(DataSet: TDataSet);
  private

     Fecha_Desde, Fecha_Hasta: TDateTime;
     clas: integer;
     Almacen_Todos: smallint;
     RangoABCAge, RangoABCCli, RangoABCArt, RangoABCAgr, RangoABCFam: string;
  public
     grupo, Ejercicio2, VerCoste, linea, i, Nivel: integer;
     Almacen1, Almacen2, Almacen3, Almacen4, Almacen5, Almacen6, Almacen7, Almacen8, Volumen_Cli, Moneda, Tipo_Cliente: string;
     procedure RellenaCanales(Lista: TStrings);
     procedure RellenaAlmacenes(Lista: TStrings);
     procedure CambiaAgente(agente: integer);
     procedure CambiaAgenteh(agente: integer);
     procedure Acumula(canal: integer; Almacen, Volumen, Agrupa_desde, Agrupa_hasta, Fam_desde, Fam_Hasta: string; ejercicioB, Todos_Almacenes, Todos_Canales, comparar: smallint; Agente, AgenteH, Ruta_desde, Ruta_hasta, modo, borrar: integer; FechaD, FechaH: TDateTime);
     procedure AcumulaCli(canal: integer; almacen, Agrupa_desde, Agrupa_hasta, Fam_desde, Fam_Hasta: string; Todos_canales, Todos_Almacenes, comparar, EjercicioB, modo, borrar: smallint; Cliente, ClienteH, AgenteDesde, AgenteHasta: integer; FechaD, FechaH: TDateTime);
     procedure AcumulaArt(canal: integer; almacen, ArticuloD, ArticuloH, FamiliaDesde, FamiliaHasta: string; Todos_canales, Todos_Almacenes, comparar, EjercicioB, modo, borrar: smallint; FechaD, FechaH: TDateTime);
     function FechaEjercicio: TDateTime;
     procedure Muestra(Modo, clase, orden: smallint; fecha1, fecha2: TDateTime);
     function DameAgente(agente: integer): string;
     function DameAgenteh: integer;
     function DameClienteh: integer;
     procedure Cambiaclienteh(cliente: integer);
     procedure Cambiacliente(cliente: integer);
     procedure CambiaAgrupacionCli(Agrupacion: string);
     procedure CambiaAgrupacionCliH(Agrupacion: string);
     function DameAgrupacion: string;
     function DameAgrupacionH: string;
     function DameAgrupacionTitulo(Agrupacion: string): string;
     procedure CambiaFamiliaD(Familia: string);
     procedure CambiaFamiliaH(Familia: string);
     procedure CambiaFamiliaD2(Familia: string);
     procedure CambiaFamiliaH2(Familia: string);
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameFamiliaMin: string;
     function DameFamiliaMax: string;
     function DameFamiliaTitulo(familia: string): string;
     function damedescripcion(Almacen: string): string;
     function DameTituloCliente(cliente: integer): string;
  end;

var
  DMABCVentasKri : TDMABCVentasKri;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UFParada, UDameDato;

{$R *.DFM}

procedure TDMABCVentasKri.DMABCVentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);

  // Inicializar Rangos de los Listados
  RangoABCAge := '';
  RangoABCCli := '';
  RangoABCArt := '';
end;

procedure TDMABCVentasKri.DMABCVentasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMABCVentasKri.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMABCVentasKri.RellenaCanales(Lista: TStrings);
var
  Canal : integer;
begin
  {dji lrk kri - Memory Leak}
  Lista.AddObject('Todos los Canales', Pointer(0));
  with xCanales do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        Canal := FieldByName['canal'].AsInteger;
        Lista.AddObject('Canal ' + IntToStr(Canal), Pointer(Canal));
        Next;
     end;
     Close;
  end;
end;

function TDMABCVentasKri.FechaEjercicio: TDateTime;
var
  duracion : smallint;
  fecha : TDateTime;
begin
  with QDameFecha do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     duracion := FieldByName['DURACION'].AsInteger;
     fecha := FieldByName['APERTURA'].AsDateTime;

     if (duracion = 2) then
        Result := fecha
     else
        Result := EncodeDate(REntorno.Ejercicio, 01, 01);
  end;
end;

function TDMABCVentasKri.DameAgenteH: integer;
begin
  with QMaxAgente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

function TDMABCVentasKri.DameAgrupacion: string;
begin
  with QMinAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCVentasKri.DameAgrupacionH: string;
begin
  with QMaxAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

function TDMABCVentasKri.DameAgrupacionTitulo(Agrupacion: string): string;
begin
  with xAgrupaciones do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

function TDMABCVentasKri.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCVentasKri.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMABCVentasKri.DameFamiliaTitulo(familia: string): string;
begin
  with QTitulo_Fam do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := familia;
     ExecQuery;
     Result := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

function TDMABCVentasKri.DameFamiliaMin: string;
begin
  with QMinFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCVentasKri.DameFamiliaMax: string;
begin
  with QMaxFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMABCVentasKri.DameClienteH: integer;
begin
  with QMaxCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

function TDMABCVentasKri.DameTituloCliente(cliente: integer): string;
begin
  with QTituloCli do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := cliente;
     ExecQuery;
     Result := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMABCVentasKri.RellenaAlmacenes(Lista: TStrings);
var
  Almacen : string;
begin
  {dji lrk kri - Memory Leak}
  if (REntorno.AlmacenRestringido = '') then
     Lista.AddObject('Todos los Almacenes', Pointer(0));
  with xAlmacenes do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ExecQuery;
     while not EOF do
     begin
        Almacen := FieldByName['almacen'].AsString + ' ' + FieldByName['titulo'].AsString;
        if ((REntorno.AlmacenRestringido = '') or
           (REntorno.AlmacenRestringido = FieldByName['almacen'].AsString)) then
           Lista.AddObject(Almacen, Pointer(Almacen));
        Next;
     end;
     Close;
  end;
end;

procedure TDMABCVentasKri.CambiaAgente(agente: integer);
begin
  with xAgente do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := agente;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaAgenteh(agente: integer);
begin
  with xAgenteh do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := agente;
     Open;
  end;
end;

procedure TDMABCVentasKri.Cambiacliente(cliente: integer);
begin
  with xcliente do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['cliente'].AsInteger := cliente;
     Open;
  end;
end;

procedure TDMABCVentasKri.Cambiaclienteh(cliente: integer);
begin
  with xclienteh do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['cliente'].AsInteger := cliente;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaAgrupacionCli(Agrupacion: string);
begin
  with xAgrupacionCli do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaAgrupacionCliH(Agrupacion: string);
begin
  with xAgrupacionCliH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentasKri.Acumula(canal: integer; Almacen, Volumen, Agrupa_desde, Agrupa_hasta, Fam_desde, Fam_Hasta: string; ejercicioB, Todos_Almacenes, Todos_Canales, comparar: smallint; Agente, AgenteH, Ruta_desde, Ruta_hasta, modo, borrar: integer; FechaD, FechaH: TDateTime);
begin
  DMListados.Normalizar_Desde_Hasta(Agente, AgenteH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');
  Almacen1 := Almacen;
  Almacen_Todos := Todos_Almacenes;//Lo utilizaremos luego en el (OnGetValue) del listado
  Ejercicio2 := EjercicioB;
  Volumen_Cli := Volumen;
  // Actualizar el Rango del Listado
  RangoABCAge := 'Del Agente ' + IntToStr(Agente) + ' al Agente ' + IntToStr(AgenteH);
  RangoABCAgr := 'Desde Agrupación ' + Agrupa_desde + ' hasta Agrupación ' +
     Agrupa_Hasta;
  if ((grupo = 5028) or (grupo = 5029)) then
     with SPAcumula do
     begin
        Close;
        SQL.Text := 'Execute procedure g_abc_ventas_agente(?EMPRESA, ?ENTRADA, ?BORRADO,' +
           '?COMPARADO, ?FECHA_INI, ?FECHA_FIN, ?AGENTE_INI, ?AGENTE_FIN,' +
           '?EJERCICIO, ?EJERCICIOB, ?CANAL, ?TODOS_CANALES, ?ALMACEN,' +
           ' ?TODOS_ALMACENES, ?MONEDA_ACTUAL)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  if ((grupo = 5030) or (grupo = 5031)) then
  begin
     with SPAcumula do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_AGENTE_AGR(?EMPRESA, ?ENTRADA, ?BORRADO,' +
           '?COMPARADO, ?FECHA_INI, ?FECHA_FIN, ?AGENTE_INI, ?AGENTE_FIN, ' +
           '?AGRUPA_INI,?AGRUPA_FIN, ?EJERCICIO, ?EJERCICIOB, ?CANAL, ' +
           '?TODOS_CANALES, ?ALMACEN, ?TODOS_ALMACENES, ?MONEDA_ACTUAL)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Agrupa_ini'].AsString := Agrupa_Desde;
        Params.ByName['Agrupa_fin'].AsString := Agrupa_Hasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  end;
  if ((grupo = 5032) or (grupo = 5033)) then
  begin
     with SPAcumula do
     begin
        SQL.Text := 'EXECUTE PROCEDURE G_ABC_VENTAS_AGENTE_VOL(?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?AGENTE_INI,?AGENTE_FIN,' +
           ' ?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN,?TODOS_ALMACENES,' +
           ' ?MONEDA_ACTUAL)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  end;
  if ((grupo = 5034) or (grupo = 5035)) then
  begin
     with SPAcumula do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_AGENTE_FAM(?EMPRESA,?ENTRADA,?BORRADO,' +
           '?COMPARADO,?FECHA_INI,?FECHA_FIN,?AGENTE_INI,?AGENTE_FIN,' +
           '?FAMILIA_INI,?FAMILIA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,' +
           '?TODOS_CANALES,?ALMACEN,?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Familia_ini'].AsString := Fam_Desde;
        Params.ByName['Familia_fin'].AsString := Fam_Hasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  end;
  if (grupo = 5050) then
  begin
     with SPAcumula do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_AGENTE_TIP_CLI(?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?AGENTE_INI,?AGENTE_FIN,?AGRUPA_INI,' +
           ' ?AGRUPA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN,' +
           ' ?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Agrupa_ini'].AsString := '';
        Params.ByName['Agrupa_fin'].AsString := 'ZZZZZZZZZZZ';
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  end;
  if (grupo = 5049) then
  begin
     with SPAcumula do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_AGENTE_RUTAS(?EMPRESA,?ENTRADA,?BORRADO,' +
           '?COMPARADO,?FECHA_INI,?FECHA_FIN,?AGENTE_INI,?AGENTE_FIN,' +
           '?RUTA_INI,?RUTA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,' +
           '?ALMACEN,?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Ruta_ini'].AsInteger := Ruta_Desde;
        Params.ByName['Ruta_fin'].AsInteger := Ruta_Hasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  end;
  if (grupo = 5054) then
  begin
     with SPAcumula do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_AGENTE_FAM_D(?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?AGENTE_INI,?AGENTE_FIN,?FAM_INI,' +
           ' ?FAM_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN,' +
           ' ?TODOS_ALMACENES,?MONEDA_ACTUAL, ?RUTA_INI , ?RUTA_FIN)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Agente_ini'].AsInteger := Agente;
        Params.ByName['Agente_fin'].AsInteger := Agenteh;
        Params.ByName['Fam_ini'].AsString := '';
        Params.ByName['Fam_fin'].AsString := 'ZZZZZ';
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        Params.ByName['RUTA_INI'].AsInteger := Ruta_Desde;
        Params.ByName['RUTA_FIN'].AsInteger := Ruta_Hasta;

        TFparada.Create(Self).ExecQuery(SPAcumula);
        FreeHandle;
     end;
  end;
end;

procedure TDMABCVentasKri.AcumulaCli(canal: integer; almacen, Agrupa_desde, Agrupa_hasta, Fam_desde, Fam_Hasta: string; Todos_canales, Todos_Almacenes, comparar, EjercicioB, modo, borrar: smallint; Cliente, ClienteH, AgenteDesde, AgenteHasta: integer; FechaD, FechaH: TDateTime);
begin
  DMListados.Normalizar_Desde_Hasta(Cliente, ClienteH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');
  Ejercicio2 := EjercicioB;
  Almacen_Todos := Todos_Almacenes;
  Almacen1 := Almacen;
  // Actualizar el Rango del Listado
  RangoABCCli := 'Del Cliente ' + IntToStr(Cliente) + ' Al Cliente ' +
     IntToStr(ClienteH);
  RangoABCAgr := 'Desde Agrupación ' + Agrupa_desde + ' hasta Agrupación ' +
     Agrupa_Hasta;
  RangoABCFam := 'Desde Familia ' + Fam_Desde + ' hasta Familia ' + Fam_hasta;
  RangoABCAge := 'Del Agente ' + IntToStr(AgenteDesde) + ' Al Agente ' +
     IntToStr(AgenteHasta);

  if ((grupo = 5036) or (grupo = 5037) or (grupo = 5038) or (grupo = 5039)) then
  begin
     with SPAcumulaCli do
     begin
        SQL.Text := 'EXECUTE PROCEDURE G_ABC_VENTAS_CLIENTE (?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?CLIENTE_INI,?CLIENTE_FIN,' +
           ' ?AGENTE_INI,?AGENTE_FIN,' +
           ' ?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN,?TODOS_ALMACENES,' +
           ' ?MONEDA_ACTUAL)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Cliente_ini'].AsInteger := Cliente;
        Params.ByName['Cliente_fin'].AsInteger := Clienteh;
        Params.ByName['Agente_ini'].AsInteger := AgenteDesde;
        Params.ByName['Agente_fin'].AsInteger := AgenteHasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumulaCli);
        FreeHandle;
     end;
  end;
  if ((grupo = 5040) or (grupo = 5041) or (grupo = 5042)) then
  begin
     with SPAcumulaCli do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_CLIENTE_FAM (?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?CLIENTE_INI,?CLIENTE_FIN,' +
           ' ?AGENTE_INI,?AGENTE_FIN,' +
           ' ?FAMILIA_INI,?FAMILIA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,' +
           ' ?ALMACEN,?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Cliente_ini'].AsInteger := Cliente;
        Params.ByName['Cliente_fin'].AsInteger := Clienteh;
        Params.ByName['Agente_ini'].AsInteger := AgenteDesde;
        Params.ByName['Agente_fin'].AsInteger := AgenteHasta;
        Params.ByName['Familia_ini'].AsString := Fam_Desde;
        Params.ByName['Familia_fin'].AsString := Fam_Hasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumulaCli);
        FreeHandle;
     end;
  end;
  if (grupo = 5055) then
  begin
     with SPAcumulaCli do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_CLIENTE_FAM_SEL (?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?CLIENTE_INI,?CLIENTE_FIN,' +
           ' ?AGENTE_INI,?AGENTE_FIN,' +
           ' ?FAMILIA_INI,?FAMILIA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,' +
           ' ?ALMACEN,?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Cliente_ini'].AsInteger := Cliente;
        Params.ByName['Cliente_fin'].AsInteger := Clienteh;
        Params.ByName['Agente_ini'].AsInteger := AgenteDesde;
        Params.ByName['Agente_fin'].AsInteger := AgenteHasta;
        Params.ByName['Familia_ini'].AsString := Fam_Desde;
        Params.ByName['Familia_fin'].AsString := Fam_Hasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumulaCli);
        FreeHandle;
     end;
  end;
  if ((grupo = 5043) or (grupo = 5044) or (grupo = 5045) or (grupo = 5046)) then
  begin
     with SPAcumulaCli do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_CLIENTE_AGR (?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?CLIENTE_INI,?CLIENTE_FIN,' +
           ' ?AGENTE_INI,?AGENTE_FIN,?AGRUPA_INI,' +
           ' ?AGRUPA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN,' +
           ' ?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Cliente_ini'].AsInteger := Cliente;
        Params.ByName['Cliente_fin'].AsInteger := Clienteh;
        Params.ByName['Agente_ini'].AsInteger := AgenteDesde;
        Params.ByName['Agente_fin'].AsInteger := AgenteHasta;
        Params.ByName['Agrupa_ini'].AsString := Agrupa_Desde;
        Params.ByName['Agrupa_fin'].AsString := Agrupa_Hasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumulaCli);
        FreeHandle;
     end;
  end;
  if ((grupo = 5045) or (grupo = 5046)) then
  begin
     with SPAcumulaCli do
     begin
        SQL.Text := 'EXECUTE PROCEDURE G_ABC_VENTAS_CLIENTE_AGR_AGR (?EMPRESA,?ENTRADA,' +
           '?EJERCICIO,?EJERCICIOB,?CANAL)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        TFparada.Create(Self).ExecQuery(SPAcumulaCli);
        FreeHandle;
     end;
  end;
end;

procedure TDMABCVentasKri.AcumulaArt(canal: integer; almacen, ArticuloD, ArticuloH, FamiliaDesde, FamiliaHasta: string; Todos_canales, Todos_Almacenes, comparar, EjercicioB, modo, borrar: smallint; FechaD, FechaH: TDateTime);
begin

  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');
  Almacen_Todos := Todos_Almacenes;
  Almacen1 := Almacen;
  Ejercicio2 := EjercicioB;
  // Por Artículos
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);

  // Actualizar el Rango del Listado
  RangoABCArt := 'Del Artículo ' + ArticuloD + ' Al Artículo ' + ArticuloH;

  if ((Grupo = 5047) or (grupo = 5048)) then
  begin
     with SPAcumulaArt do
     begin
        SQL.Text := 'EXECUTE PROCEDURE G_ABC_VENTAS_ARTICULO(?EMPRESA,?ENTRADA,?BORRADO,' +
           ' ?COMPARADO,?FECHA_INI,?FECHA_FIN,?ARTICULO_INI,?ARTICULO_FIN,?EJERCICIO,' +
           ' ?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN,?TODOS_ALMACENES,?MONEDA_ACTUAL)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Articulo_ini'].AsString := ArticuloD;
        Params.ByName['Articulo_fin'].AsString := ArticuloH;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        TFparada.Create(Self).ExecQuery(SPAcumulaArt);
        FreeHandle;
     end;
  end;
  // Por Familias
  DMListados.Normalizar_Desde_Hasta(Familiadesde, FamiliaHasta);

  // Actualizar el Rango del Listado
  RangoABCFam := 'Desde Familia ' + FamiliaDesde + ' hasta Familia ' + FamiliaHasta;

  if ((grupo = 5051) or (grupo = 5052)) then
  begin
     with SPAcumulaArt do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_ARTICULOS_ALMACEN(?EMPRESA,?ENTRADA,?BORRADO' +
           ',?COMPARADO,?FECHA_INI,?FECHA_FIN,?ARTICULO_INI,?ARTICULO_FIN,?EJERCICIO' +
           ',?EJERCICIOB,?CANAL,?TODOS_CANALES,?ALMACEN0,?TODOS_ALMACENES,?MONEDA_ACTUAL' +
           ',?FAMILIA_INI,?FAMILIA_FIN)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Articulo_ini'].AsString := ArticuloD;
        Params.ByName['Articulo_fin'].AsString := ArticuloH;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen0'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        Params.ByName['Familia_ini'].AsString := FamiliaDesde;
        Params.ByName['Familia_fin'].AsString := FamiliaHasta;
        TFparada.Create(Self).ExecQuery(SPAcumulaArt);
        Almacen1 := FieldByName['Almacen1'].AsString;
        Almacen2 := FieldByName['Almacen2'].AsString;
        Almacen3 := FieldByName['Almacen3'].AsString;
        Almacen4 := FieldByName['Almacen4'].AsString;
        Almacen5 := FieldByName['Almacen5'].AsString;
        Almacen6 := FieldByName['Almacen6'].AsString;
        Almacen7 := FieldByName['Almacen7'].AsString;
        Almacen8 := FieldByName['Almacen8'].AsString;
        FreeHandle;
     end;
  end;
  if (grupo = 5053) then
  begin
     with SPAcumulaArt do
     begin
        SQL.Text :=
           'EXECUTE PROCEDURE G_ABC_VENTAS_ARTICULOS_FAM(?EMPRESA,?ENTRADA,?BORRADO' +
           ',?COMPARADO,?FAMILIA_INI,?FAMILIA_FIN,?EJERCICIO,?EJERCICIOB,?CANAL' +
           ',?TODOS_CANALES,?ALMACEN,?TODOS_ALMACENES,?MONEDA_ACTUAL,?FECHA_INI,?FECHA_FIN)';
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Familia_ini'].AsString := FamiliaDesde;
        Params.ByName['Familia_fin'].AsString := FamiliaHasta;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_canales;
        Params.ByName['Almacen'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['Moneda_Actual'].AsString := moneda;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        TFparada.Create(Self).ExecQuery(SPAcumulaArt);
        FreeHandle;
     end;
  end;
end;

procedure TDMABCVentasKri.Muestra(Modo, clase, orden: smallint; fecha1, fecha2: TDateTime);
var
  str : string;
begin
  sw := 1;
  clas := Clase;
  fecha_desde := fecha1;
  fecha_hasta := fecha2;
  case clase of
     0:
     begin
        case orden of
           0: str := 'AGENTE';
           1: str := 'AGENTE DESC';
           2: str := 'MARGEN';
           3: str := 'MARGEN DESC';
           4: str := 'VENTAS';
           5: str := 'VENTAS DESC';
           6: str := 'NOMBRE';
           7: str := 'NOMBRE DESC';
        end;
        with xTmp_Abc_Agentes do
        begin
           Close;
           if ((grupo = 5028) or (grupo = 5029)) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY ' + Str;
           if ((grupo = 5030) or (grupo = 5031)) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_AGR ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY AGENTE,AGRUPACION,CLIENTE';
           if ((grupo = 5032) or (grupo = 5033)) then
           begin
              if Volumen_Cli <> 'T' then
                 SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_AGR ' +
                    'WHERE EMPRESA=' + REntorno.EmpresaStr +
                    ' AND ENTRADA= ' + REntorno.EntradaStr +
                    ' AND AGRUPACION= ''' + Volumen_CLi + '''' +
                    ' ORDER BY AGENTE,AGRUPACION'
              else
                 SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_AGR ' +
                    'WHERE EMPRESA=' + REntorno.EmpresaStr +
                    ' AND ENTRADA= ' + REntorno.EntradaStr +
                    ' ORDER BY AGENTE,AGRUPACION';
           end;

           if ((grupo = 5034) or (grupo = 5035)) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_FAM ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' AND NIVEL<=' + IntToStr(Nivel) +
                 ' ORDER BY ' + Str + ',FAMILIA';
           if (grupo = 5049) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_RUTA ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY AGENTE,RUTA,anual DESC,CLIENTE';
           if (grupo = 5050) then
           begin
              if (Tipo_cliente = 'TODOS') then
                 SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_TIPO ' +
                    'WHERE EMPRESA=' + REntorno.EmpresaStr +
                    ' AND ENTRADA= ' + REntorno.EntradaStr +
                    ' ORDER BY AGENTE,TIPO,CLIENTE'
              else
                 SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_TIPO ' +
                    'WHERE EMPRESA=' + REntorno.EmpresaStr +
                    ' AND ENTRADA= ' + REntorno.EntradaStr +
                    ' AND TIPO= ' + Tipo_cliente +
                    ' ORDER BY AGENTE,TIPO,CLIENTE';
           end;
           if (grupo = 5054) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_AGENTE_FAM_D ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY AGENTE,RUTA';
           Open;
        end;
     end;
     1:
     begin
        case orden of
           0: str := 'CLIENTE';
           1: str := 'CLIENTE DESC';
           2: str := 'MARGEN';
           3: str := 'MARGEN DESC';
           4: str := 'VENTAS';
           5: str := 'VENTAS DESC';
           6: str := 'NOMBRE';
           7: str := 'NOMBRE DESC';
        end;
        with xTmp_Abc_Clientes do
        begin
           Close;
           xTmp_Abc_Clientes_Fam.SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE_FAM_SEL ' +
              'WHERE EMPRESA=' + REntorno.EmpresaStr +
              ' AND ENTRADA= ' + REntorno.EntradaStr +
              ' ORDER BY RUTA, CLIENTE';
           if ((grupo = 5036) or (grupo = 5037) or (grupo = 5038) or (grupo = 5039)) then
           begin
              {dji lrk kri}
              if (orden = 6) then
                 str := 'TITULO';
              if ((orden = 2) or (orden = 3)) then
                 str := 'CLIENTE';
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY ' + Str;
              xTmp_Abc_Clientes_Fam.SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE_FAM_SEL ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY RUTA, CLIENTE';
           end;
           if ((grupo = 5040) or (grupo = 5041) or (grupo = 5042) or (grupo = 5055)) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE_FAM ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' AND NIVEL<=' + IntToStr(Nivel) +
                 ' ORDER BY ' + Str + ',FAMILIA';
           if ((grupo = 5040) or (grupo = 5041) or (grupo = 5042) or (grupo = 5055)) then
              xTmp_Abc_Clientes_Fam.SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE_FAM_SEL ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY RUTA,CLIENTE';
           if (grupo = 5043) or (grupo = 5044) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE_AGR ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY AGRUPACION,CLIENTE';
           if (grupo = 5045) or (grupo = 5046) then
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_CLIENTE_AGR ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY ALMACEN,AGRUPACION';
           Open;
        end;
     end;
     2:
     begin
        with xTmp_Abc_ARTICULOS do
        begin
           Close;
           if ((grupo = 5047) or (grupo = 5048)) then
           begin
              case orden of
                 0: str := 'ARTICULO';
                 1: str := 'ARTICULO DESC';
                 2: str := 'DESVIACION';
                 3: str := 'DESVIACION DESC';
                 4: str := 'VENTAS';
                 5: str := 'VENTAS DESC';
                 6: str := 'TITULO';
                 7: str := 'TITULO DESC';
              end;
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_ARTICULO ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY ' + str;
              Open;
           end;
           if ((grupo = 5051) or (grupo = 5052)) then
           begin
              case orden of
                 0: str := 'ARTICULO';
                 1: str := 'ARTICULO DESC';
                 2: str := 'TOTAL_MARGEN';
                 3: str := 'TOTAL_MARGEN DESC';
                 4: str := 'TOTAL_PTAS';
                 5: str := 'TOTAL_PTAS DESC';
                 6: str := 'TITULO';
                 7: str := 'TITULO DESC';
              end;
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_ARTICULO_ALMACEN ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' ORDER BY ' + str;
              Open;
           end;
           if (grupo = 5053) then
           begin
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_VENTAS_ARTICULO_FAM ' +
                 'WHERE EMPRESA=' + REntorno.EmpresaStr +
                 ' AND ENTRADA= ' + REntorno.EntradaStr +
                 ' AND NIVEL<=' + IntToStr(nivel) +
                 ' ORDER BY FAMILIA';
              Open;
           end;
        end;
     end;
  end;
  DMListados.Cargar(grupo, '');
  frAbc.LoadFromFIB(REntorno.Formato, str);
  frAbc.PrepareReport;
  case Modo of
     0: frAbc.ShowPreparedReport;
     1: frAbc.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMABCVentasKri.frAbcGetValue(const ParName: string; var ParValue: variant);
var
  auxs : string;
  auxi : integer;
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA1' then
     ParValue := Fecha_desde;
  if ParName = 'FECHA2' then
     ParValue := Fecha_Hasta;
  if ParName = 'TITULO' then
     ParValue := '';
  if ParName = 'ano1' then
     ParValue := REntorno.EjercicioStr;
  if ParName = 'ano2' then
     ParValue := Ejercicio2;
  if ParName = 'RangoABCAge' then
     ParValue := RangoABCAge;
  if ParName = 'RangoABCCli' then
     ParValue := RangoABCCli;
  if ParName = 'RangoABCArt' then
     ParValue := RangoABCArt;
  if ParName = 'RangoABCAgr' then
     ParValue := RangoABCAgr;
  if ParName = 'RangoABCFam' then
     ParValue := RangoABCFam;
  if ParName = 'Almacen1' then
     ParValue := Almacen1 + ' ' + damedescripcion(Almacen1);
  if ParName = 'Almacen1' then
  begin
     if (Almacen_Todos = 1) and (grupo <> 5052) then
        ParValue := 'Todos los Almacenes';
  end;
  if (ParName = 'AlmacenTitulo') then
     ParValue := damedescripcion(xTmp_Abc_Clientes.FieldByName('Almacen').AsString);
  if (ParName = 'CosteVentas') then
  begin
     if (VerCoste = 1) then
        ParValue := 'Coste Ventas Periodo'
     else
        ParValue := '';
  end;
  if (ParName = 'Almacen2') then
     ParValue := damedescripcion(Almacen2);
  if (ParName = 'Almacen3') then
     ParValue := damedescripcion(Almacen3);
  if (ParName = 'Almacen4') then
     ParValue := damedescripcion(Almacen4);
  if (ParName = 'Almacen5') then
     ParValue := damedescripcion(Almacen5);
  if (ParName = 'Almacen6') then
     ParValue := damedescripcion(Almacen6);
  if (ParName = 'Almacen7') then
     ParValue := damedescripcion(Almacen7);
  if (ParName = 'Almacen8') then
     ParValue := damedescripcion(Almacen8);
  if ParName = 'TotalPeriodo' then
     ParValue := 'Total ' + Moneda + ' Periodo';
  if ParName = 'PtasPeriodo' then
     ParValue := Moneda + ' Ventas';
  if ParName = 'PtasAno' then
     ParValue := 'Total ' + Moneda + ' Ventas Año ' + IntToStr(Ejercicio2);
  if ParName = 'PtasAnoN' then
     ParValue := Moneda + ' Ventas Año ' + REntorno.EjercicioStr;
  if ParName = 'PtasAnoN-1' then
     ParValue := Moneda + ' Ventas Año ' + IntToStr(Ejercicio2);
  if ParName = 'MargenN' then
     ParValue := '% Margen período año ' + REntorno.EjercicioStr;
  if ParName = 'MargenN-1' then
     ParValue := '% Margen período año' + IntToStr(Ejercicio2);
  if ParName = 'Desviacion' then
     ParValue := 'Desviación' + Moneda + ' entre Períodos ' + REntorno.EjercicioStr +
        '-' + IntToStr(Ejercicio2);
  if ParName = 'Riesgo_AN' then
     ParValue := 'Riesgo Autorizado Año' + REntorno.EjercicioStr;
  if ParName = 'Riesgo_DN' then
     ParValue := 'Riesgo Disponible Año' + REntorno.EjercicioStr;
  if ParName = 'Riesgo_AN-1' then
     ParValue := 'Riesgo Autorizado Año' + IntToStr(Ejercicio2);
  if ParName = 'Riesgo_DN-1' then
     ParValue := 'Riesgo Disponible Año' + IntToStr(Ejercicio2);
  if ParName = 'visible' then
     ParValue := Vercoste;
  if ParName = 'CosteN' then
     ParValue := 'Coste Periodo Año ' + REntorno.EjercicioStr;
  if ParName = 'CosteN-1' then
     ParValue := 'Coste Periodo Año ' + IntToStr(Ejercicio2);
  if ParName = 'titulocli' then
     ParValue := UDameDato.DameTituloCliente(xTmp_Abc_Clientes.FieldByName('cliente').AsInteger);
  if ParName = 'tituloclifam' then
     ParValue := UDameDato.DameTituloCliente(xTmp_Abc_Clientes_Fam.FieldByName('cliente').AsInteger);
  if ParName = 'NFamilia' then
     ParValue := DameFamiliaTitulo(xTmp_Abc_Agentes.FieldByName('familia').AsString);
  if ParName = 'NFamiliaCli' then
     ParValue := DameFamiliaTitulo(xTmp_Abc_Clientes.FieldByName('familia').AsString);
  if ParName = 'NAgrupacion' then
     ParValue := DameAgrupacionTitulo(xTmp_Abc_Agentes.FieldByName(
        'Agrupacion').AsString);
  if ParName = 'NAgrupacionCli' then
     ParValue := DameAgrupacionTitulo(xTmp_Abc_Clientes.FieldByName(
        'Agrupacion').AsString);
  if ParName = 'NAgente' then
     ParValue := DameAgente(xTmp_Abc_Agentes.FieldByName('Agente').AsInteger);
  if ParName = 'TotUniN-1' then
     ParValue := 'Total Unidades Vendidas Año' + IntToStr(Ejercicio2);
  if ParName = 'UnidadesN' then
     ParValue := 'Unidades ' + REntorno.EjercicioStr;
  if ParName = 'UnidadesN-1' then
     ParValue := 'Unidades ' + IntToStr(Ejercicio2);
  if ParName = 'PeriodoAnoN' then
     ParValue := 'PERIODO AÑO ' + REntorno.EjercicioStr;
  if ParName = 'AcumuladoAnoN-1' then
     ParValue := 'ACUMULADO AÑO ' + IntToStr(Ejercicio2);
  if ParName = 'NTipo' then
  begin
     if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'T') then
        ParValue := 'Todos'
     else
     begin
        ParValue := '';
        xTipos_volumenes.DisableControls;
        xTipos_volumenes.Open;
        xTipos_volumenes.First;
        while (not xTipos_volumenes.EOF) do
        begin
           if (xTipos_volumenes.FieldByName('Agrupacion').AsString =
              xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString) then
              ParValue := xTipos_volumenes.FieldByName('titulo').AsString;
           xTipos_volumenes.Next;
        end;
        xTipos_volumenes.Close;
        xTipos_volumenes.EnableControls;
     end;
     {
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'A') then
      ParValue := '>10.000.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'A1') then
      ParValue := '>5.000.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'B') then
      ParValue := '>4.000.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'C') then
      ParValue := '>3.000.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'D') then
      ParValue := '>2.000.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'E') then
      ParValue := '>1.000.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'F') then
      ParValue := '>300.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'F1') then
      ParValue := '<300.000';
    if (xTmp_Abc_Agentes.FieldByName('Agrupacion').AsString = 'G') then
      ParValue := 'Venta 0';
}
  end;
  if ParName = 'nivel' then
     ParValue := nivel;
  if ParName = 'PrevisionCompra' then
  begin
     ParValue := 0;
     try
        auxs := xTmp_Abc_Clientes.FieldByName('cliente').AsString
     except
        try
           auxs := xTmp_Abc_Agentes.FieldByName('cliente').AsString
        except
           try
              auxs := xTmp_Abc_Articulos.FieldByName('cliente').AsString
           except
              auxs := '0';
           end;
        end;
     end;
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT POTENCIAL_DE_COMPRA FROM EMP_CLIENTES WHERE EMPRESA=' +
              REntorno.EmpresaStr + ' AND CLIENTE=' + xTmp_Abc_Agentes.FieldByName(
              'cliente').AsString;
           ExecQuery;
           ParValue := FieldByName['POTENCIAL_DE_COMPRA'].AsFloat;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
     {
     with DMMain.QGeneralKri do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        SQL.Text := 'SELECT POTENCIAL_DE_COMPRA FROM EMP_CLIENTES WHERE EMPRESA=' +
           REntorno.EmpresaStr + ' AND CLIENTE=' + xTmp_Abc_Agentes.FieldByName(
           'cliente').AsString;
        ExecQuery;
        ParValue := FieldByName['POTENCIAL_DE_COMPRA'].AsFloat;
        Transaction.Commit;
     end;
}
  end;
  if ParName = 'ConsumoMateriales' then
  begin
     ParValue := 0;
     try
        auxs := xTmp_Abc_Clientes.FieldByName('cliente').AsString
     except
        try
           auxs := xTmp_Abc_Agentes.FieldByName('cliente').AsString
        except
           try
              auxs := xTmp_Abc_Articulos.FieldByName('cliente').AsString
           except
              auxs := '0';
           end;
        end;
     end;
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CONSUMO_MATERIAL FROM EMP_CLIENTES WHERE EMPRESA=' +
              REntorno.EmpresaStr + ' AND CLIENTE=' + xTmp_Abc_Agentes.FieldByName('cliente').AsString;
           ExecQuery;
           ParValue := FieldByName['CONSUMO_MATERIAL'].AsFloat;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
     {
     with DMMain.QGeneralKri do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        SQL.Text := 'SELECT CONSUMO_MATERIAL FROM EMP_CLIENTES WHERE EMPRESA=' +
           REntorno.EmpresaStr + ' AND CLIENTE=' + xTmp_Abc_Agentes.FieldByName('cliente').AsString;
        ExecQuery;
        ParValue := FieldByName['CONSUMO_MATERIAL'].AsFloat;
        Transaction.Commit;
     end;
     }
  end;
  if ((ParName > 'FAM00') and (ParName < 'FAM99')) then
  begin
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT FAMILIA FROM TMP_ABC_SEL_FAM WHERE ' +
                 'EMPRESA=' + REntorno.EmpresaStr + ' AND ENTRADA=' + REntorno.EntradaStr + ' ORDER BY FAMILIA';
              Open;
              for auxi := 2 to StrToIntDef(Copy(ParName, 4, 2), 0) do
                 Next;
              if (not EOF) then
                 ParValue := FieldByName('FAMILIA').AsString
              else
                 ParValue := '';
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
     {
     with DMMain.QGeneralKri do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        SQL.Text := 'SELECT FAMILIA FROM TMP_ABC_SEL_FAM WHERE ' +
           'EMPRESA=' + REntorno.EmpresaStr + ' AND ENTRADA=' + REntorno.EntradaStr + ' ORDER BY FAMILIA';
        ExecQuery;
        for auxi := 2 to StrToIntDef(copy(ParName, 4, 2), 0) do
           Next;
        if (not EOF) then
           ParValue := FieldByName['FAMILIA'].AsString
        else
           ParValue := '';
        Transaction.Commit;
     end;
     }
  end;
end;

procedure TDMABCVentasKri.frAbcEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     {    if (Memo[0] = '[L]') then
    begin
      if (SW = 0) and (REntorno.Pijama = 1) then
      begin
        SW := 1;
        View.Visible := true;
      end
      else
      begin
        SW := 0;
        View.Visible := false;
      end
    end;

    if (pos('[MascaraN]', Memo[0]) > 0) then
      View.FormatStr := Dmmain.MascaraMoneda(moneda, 1);
    if (pos('[MascaraL]', Memo[0]) > 0) then
      View.FormatStr := Dmmain.MascaraMoneda(moneda, 1);
    if (pos('[MascaraI]', Memo[0]) > 0) then
      View.FormatStr := Dmmain.MascaraMoneda(moneda, 1);
    if (pos('[MascaraP]', Memo[0]) > 0) then
      View.FormatStr := MascaraP;

    if (Memo[0] = '[Imagen]') and (View is TfrPictureView) then
    begin
      TfrPictureView(View).Picture.Assign(REntorno.ImagenEmpresa);
      View.Visible := true;
    end;

    if (pos('[C]', Memo[0]) > 0) then
      View.Visible := false;
}
  end;
end;

procedure TDMABCVentasKri.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaFamiliaD(Familia: string);
begin
  with xFamiliaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaFamiliaH(Familia: string);
//Sirven para hacer los DBEdits independientes
begin
  // de los del RGArticulos y así no cambian
  with xFamiliaH do
     //los dos a la vez al tener el mismo DataSet.
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaFamiliaD2(Familia: string);
begin
  with xFamiliaD2 do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMABCVentasKri.CambiaFamiliaH2(Familia: string);
begin
  with xFamiliaH2 do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

function TDMABCVentasKri.damedescripcion(Almacen: string): string;
begin
  with QTitulo_Almacenes do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Almacen'].AsString := Almacen;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

function TDMABCVentasKri.DameAgente(agente: integer): string;
begin
  with QTitulo_Agente do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := agente;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

procedure TDMABCVentasKri.xTmp_Abc_ClientesAfterOpen(DataSet: TDataSet);
begin
  xTmp_Abc_Clientes_Fam.Close;
  xTmp_Abc_Clientes_Fam.Open;
end;

end.
