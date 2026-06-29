unit UProDMLSTOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBQuery,
  HYFIBQuery, ExtCtrls, FIBTableDataSetRO, DateUtils, frxClass, frxHYReport;

type
  TProDMLstOrden = class(TDataModule)
     xOrden: TFIBDataSetRO;
     xFaseD: TFIBDataSetRO;
     xFaseH: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSOrden: TDataSource;
     DSFaseD: TDataSource;
     DSFaseH: TDataSource;
     xOrdenCOMPUESTO: TFIBStringField;
     xFaseDFASE: TFIBStringField;
     xFaseHFASE: TFIBStringField;
     xCompuesto: TFIBDataSetRO;
     DSCompuesto: TDataSource;
     QMLstOrden: TFIBDataSetRO;
     QMLstFases: TFIBDataSetRO;
     QMLstMateriales: TFIBDataSetRO;
     QMLstTareas: TFIBDataSetRO;
     DSLstOrden: TDataSource;
     DSLstFases: TDataSource;
     DSLstMateriales: TDataSource;
     DSLstTareas: TDataSource;
     frListadoO: TfrHYReport;
     frDBListadoO: TfrDBDataSet;
     frDBListadoFase: TfrDBDataSet;
     frDBListadoMate: TfrDBDataSet;
     frDBListadoTareas: TfrDBDataSet;
     frDBLstMarcajes: TfrDBDataSet;
     xFaseDID_ORDEN: TIntegerField;
     xFaseHID_ORDEN: TIntegerField;
     xOrdenID_ORDEN: TIntegerField;
     xMinMaxFase: TFIBDataSetRO;
     xMinMaxFaseMIN: TIntegerField;
     xMinMaxFaseMAX: TIntegerField;
     QMLstMarcajes: TFIBTableSetRO;
     DSLstMarcajes: TDataSource;
     QMLstCompras: TFIBDataSetRO;
     DSLstCompras: TDataSource;
     frDBListadoCompras: TfrDBDataSet;
     QMLstTareasAgru: TFIBDataSetRO;
     DSLstTareasAgru: TDataSource;
     frDBListadoTarAgru: TfrDBDataSet;
     QMLstMarcajesAgru: TFIBTableSetRO;
     DSLstMarcajesAgru: TDataSource;
     frDBlstMarcajesAgru: TfrDBDataSet;
     QMLstIncidencias: TFIBDataSetRO;
     DSLstIncidencias: TDataSource;
     frDBListadoInc: TfrDBDataSet;
     QMLstSeries: TFIBDataSetRO;
     DSLstSeries: TDataSource;
     frDBSeries: TfrDBDataSet;
     QMLstLotes: TFIBDataSetRO;
     DSLstLotes: TDataSource;
     frDBLotes: TfrDBDataSet;
     xTituloLote: TFIBDataSetRO;
     DSxTituloLote: TDataSource;
     xTituloMaquina: TFIBDataSetRO;
     DSxTituloMaquina: TDataSource;
     QMLstFichaTecnica: TFIBDataSetRO;
     DSLstFichaTecnica: TDataSource;
     frDBFichaTecnica: TfrDBDataSet;
     QMLstFichaTecnicaDet: TFIBDataSetRO;
     DSLstFichaTecnicaDet: TDataSource;
     frDBFichaTecnicaDet: TfrDBDataSet;
     QMLstEtiquetas: TFIBDataSetRO;
     DSLstEtiquetas: TDataSource;
     frDBLstEtiquetas: TfrDBDataSet;
     QMLstEtiDibujo: TFIBDataSetRO;
     DSLstEtiDibujo: TDataSource;
     frDBLstEtidibujo: TfrDBDataSet;
     QMLstPedido: TFIBDataSetRO;
     DSLstPedido: TDataSource;
     frDBLstPedido: TfrDBDataSet;
     QMLstMaterialesLotes: TFIBDataSetRO;
     DSQMLstMaterialesLotes: TDataSource;
     frDBLstMaterialesLotes: TfrDBDataSet;
     xUtillajes: TFIBDataSetRO;
     DSxUtillajes: TDataSource;
     frDBDxUtillajes: TfrDBDataSet;
     xComponente: TFIBDataSetRO;
     SDxComponente: TDataSource;
     xArticuloCodigoCliente: TFIBDataSetRO;
     QMLstPedidoDet: TFIBDataSetRO;
     DSLstPedidoDet: TDataSource;
     frDBLstPedidoDet: TfrDBDataSet;
     xCompuestoCodigoCliente: TFIBDataSetRO;
     frxListadoO: TfrxHYReport;
     xEscandallo: TFIBDataSetRO;
     DSxEscandallo: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xEmpleado: TFIBDataSetRO;
     DSxEmpleado: TDataSource;
     xDireccionPedido: TFIBDataSetRO;
     DSxDireccionPedido: TDataSource;
     xLstTareaEsc: TFIBDataSetRO;
     DSxLstTareaEsc: TDataSource;
     procedure frListadoOGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frListadoOEnterRect(Memo: TStringList; View: TfrView);
     procedure QMLstEtiquetasAfterOpen(DataSet: TDataSet);
     procedure QMLstFasesAfterOpen(DataSet: TDataSet);
     procedure QMLstFasesBeforeClose(DataSet: TDataSet);
     procedure QMLstOrdenAfterOpen(DataSet: TDataSet);
     procedure QMLstOrdenBeforeClose(DataSet: TDataSet);
     procedure QMLstEtiquetasBeforeClose(DataSet: TDataSet);
     procedure QMLstFichaTecnicaAfterOpen(DataSet: TDataSet);
     procedure QMLstFichaTecnicaBeforeClose(DataSet: TDataSet);
     procedure QMLstTareasAgruAfterOpen(DataSet: TDataSet);
     procedure QMLstTareasAgruBeforeClose(DataSet: TDataSet);
     procedure QMLstTareasAfterOpen(DataSet: TDataSet);
     procedure QMLstTareasBeforeClose(DataSet: TDataSet);
     procedure QMLstMaterialesAfterOpen(DataSet: TDataSet);
     procedure QMLstMaterialesBeforeClose(DataSet: TDataSet);
     procedure xOrdenAfterOpen(DataSet: TDataSet);
     procedure xOrdenBeforeClose(DataSet: TDataSet);
     procedure QMLstPedidoDetAfterOpen(DataSet: TDataSet);
     procedure QMLstPedidoDetBeforeClose(DataSet: TDataSet);
     procedure frxListadoOGetValue(const VarName: string; var Value: variant);
     procedure frxListadoOBeforePrint(Sender: TfrxReportComponent);
     procedure QMLstPedidoAfterOpen(DataSet: TDataSet);
     procedure QMLstPedidoBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Agrupar: boolean;
     TipoListado: integer;
     MostrarNrosSerie, MostrarLote: boolean;
     DesdeFecha, HastaFecha: TDateTime;
     procedure ListarOrdenes(DesdeFecha, HastaFecha: TDateTime);
  public
     { Public declarations }
     Capsalera: integer;
     TFiltro: string;
     FiltraFechaImputacion: boolean;
     procedure CambiaOrden(IdOrden: integer);
     procedure CambiaFaseD(IdOrden, LineaFase: integer);
     procedure CambiaFaseH(IdOrden, LineaFase: integer);
     procedure MostrarListado(Modo, IdOrden, FaseDesde, FaseHasta, TipoServido: integer; Comentario: string; FechaListado: TDateTime; AAgrupar: boolean; ATipoListado, Grupo: integer; AMostrarNrosSerie, AMostrarLote: boolean; aDesdeFecha, aHastaFecha: TDateTime);
     procedure MostrarListadoMontaje(Modo, Grupo, IdOrden, FaseDesde, FaseHasta, TipoServido: integer; Comentario: string; FechaListado, aDesdeFecha, aHastaFecha: TDateTime);
     procedure ObrirTaules(IdOrden, FaseDesde, FaseHasta: integer; DesdeFecha, HastaFecha: TDateTime);
  end;

var
  ProDMLstOrden : TProDMLstOrden;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDMAdjunto, UDameDato;

{$R *.dfm}

procedure TProDMLstOrden.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  Capsalera := 1;
  FiltraFechaImputacion := False;
end;

procedure TProDMLstOrden.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLSTOrden.CambiaOrden(IdOrden: integer);
begin
  with xOrden do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;
end;

procedure TProDMLSTOrden.CambiaFaseD(IdOrden, LineaFase: integer);
begin
  with xFaseD do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Params.ByName['LINEA_FASE'].AsInteger := LineaFase;
     Open;
  end;
end;

procedure TProDMLSTOrden.CambiaFaseH(IdOrden, LineaFase: integer);
begin
  with xFaseH do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Params.ByName['LINEA_FASE'].AsInteger := LineaFase;
     Open;
  end;
end;

procedure TProDMLSTOrden.MostrarListado(Modo, IdOrden, FaseDesde, FaseHasta, TipoServido: integer; Comentario: string; FechaListado: TDateTime; AAgrupar: boolean; ATipoListado, Grupo: integer; AMostrarNrosSerie, AMostrarLote: boolean; aDesdeFecha, aHastaFecha: TDateTime);
var
  //IdAdjunto : integer;
  Fichero, DescripcionAdjunto : string;
begin
  DMMain.LogIni(Format('ProDMLSTOrden.MostrarListado (Grupo: %d)', [Grupo]));
  Agrupar := AAgrupar;
  TipoListado := ATipoListado;
  MostrarNrosSerie := AMostrarNrosSerie;
  MostrarLote := AMostrarLote;
  DesdeFecha := aDesdeFecha;
  HastaFecha := aHastaFecha;
  if (Grupo = 8009) then
  begin
     Fichero := _('LstOrdProd-Previsto') + '_' + IntToStr(IdOrden) + '.pdf';
     DescripcionAdjunto := _('Listado Orden Produccion - Previsto');
  end
  else
  begin
     Fichero := _('LstOrdProd-Real') + '_' + IntToStr(IdOrden) + '.pdf';
     DescripcionAdjunto := _('Listado Orden Produccion - Real');
  end;

  if (FaseDesde = 0) or (FaseHasta = 0) then
  begin // Si no informem alguna de les fases, busquem el minim i el maxim
     CambiaOrden(IdOrden);

     FaseDesde := xMinMaxFaseMIN.AsInteger;
     FaseHasta := xMinMaxFaseMAX.AsInteger;
  end
  else
     DMListados.Normalizar_Desde_Hasta(FaseDesde, FaseHasta);

  DMListados.DatosInforme(FechaListado, Comentario);
  ObrirTaules(IdOrden, FaseDesde, FaseHasta, DesdeFecha, HastaFecha);
  DMListados.Imprimir(Grupo, 0, Modo, '', '', frListadoO, frxListadoO, nil, nil, Fichero);

  // Borro la version anterior si existe
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM VER_ADJUNTOS WHERE ID = :ID_ORDEN AND TIPO = :TIPO AND TITULO_ADJUNTO = :TITULO_ADJUNTO';
        Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
        Params.ByName['TIPO'].AsString := 'OPR';
        Params.ByName['TITULO_ADJUNTO'].AsString := DescripcionAdjunto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbreData(TDMAdjunto, DMAdjunto);
  //IdAdjunto := DMAdjunto.CreaAdjunto('OPR', IdOrden, DameTempPath + Fichero, DescripcionAdjunto);
  DMAdjunto.CreaAdjunto('OPR', IdOrden, DameTempPath + Fichero, DescripcionAdjunto);
  CierraData(DMAdjunto);

  DMMain.LogFin(Format('ProDMLSTOrden.MostrarListado (Grupo: %d)', [Grupo]));
end;

// Aquesta procedure es farà servir per llistar el full de muntatge
procedure TProDMLSTOrden.MostrarListadoMontaje(Modo, Grupo, IdOrden, FaseDesde, FaseHasta, TipoServido: integer; Comentario: string; FechaListado, aDesdeFecha, aHastaFecha: TDateTime);
begin
  DesdeFecha := aDesdeFecha;
  HastaFecha := aHastaFecha;

  if (FaseDesde = 0) or (FaseHasta = 0) then
  begin // Si no informem alguna de les fases, busquem el minim i el maxim
     CambiaOrden(IdOrden);

     FaseDesde := xMinMaxFaseMIN.AsInteger;
     FaseHasta := xMinMaxFaseMAX.AsInteger;
  end
  else
     DMListados.Normalizar_Desde_Hasta(FaseDesde, FaseHasta);

  DMListados.DatosInforme(FechaListado, Comentario);
  ObrirTaules(IdOrden, FaseDesde, FaseHasta, DesdeFecha, HastaFecha);

  // Listado de la hoja de montaje
  DMListados.Imprimir(Grupo, 0, Modo, '', '', frListadoO, frxListadoO, nil, nil);
end;

procedure TProDMLstOrden.ObrirTaules(IdOrden, FaseDesde, FaseHasta: integer; DesdeFecha, HastaFecha: TDateTime);
begin
  DMMain.LogIni('ProDMLSTOrden.ObrirTaules');
  with QMLstOrden do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;

  with QMLstFases do
  begin
     Close;
     Params.ByName['FASED'].AsInteger := FaseDesde;
     Params.ByName['FASEH'].AsInteger := FaseHasta;
     Open;
  end;

  // Si han marcat les series, s'obra la font de dades
  if (MostrarNrosSerie) then
  begin
     with QMLstSeries do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMLstOrden.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMLstOrden.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMLstOrden.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIES'].AsString := QMLstOrden.FieldByName('SERIES').AsString;
        Params.ByName['RIG_OF'].AsInteger := QMLstOrden.FieldByName('RIG_OF').AsInteger;
        Open;
     end;
  end;

  // Si han marcat els lotes, s'obra la font de dades
  if (MostrarLote) then
  begin
     with QMLstLotes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMLstOrden.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMLstOrden.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMLstOrden.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMLstOrden.FieldByName('SERIES').AsString;
        Params.ByName['TIPO'].AsString := 'COM';
        Params.ByName['RIG'].AsInteger := QMLstOrden.FieldByName('RIG_OF').AsInteger;
        Open;
     end;
  end;

  ListarOrdenes(DesdeFecha, HastaFecha);
  DMMain.LogFin('ProDMLSTOrden.ObrirTaules');
end;

procedure TProDMLstOrden.frListadoOGetValue(const ParName: string; var ParValue: variant);
var
  DS : TFIBDataSet;

  function DameSumaMaterial(Campo: string): double;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(' + Campo + ') FROM PRO_ORD_MAT WHERE ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINEA_FASE';
           Params.ByName['ID_ORDEN'].AsInteger := QMLstOrden.FieldByName('ID_ORDEN').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFases.FieldByName('LINEA_FASE').AsInteger;
           ExecQuery;
           Result := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameSumaTarea(Campo: string): double;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(' + Campo + ') FROM PRO_ORD_TAREA WHERE ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINEA_FASE';
           Params.ByName['ID_ORDEN'].AsInteger := QMLstOrden.FieldByName('ID_ORDEN').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFases.FieldByName('LINEA_FASE').AsInteger;
           ExecQuery;
           Result := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameSumaMarca(Campo: string): double;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(' + Campo + ') FROM PRO_ORD_DET_MARCA WHERE ID_ORDEN = :ID_ORDEN';
           Params.ByName['ID_ORDEN'].AsInteger := QMLstOrden.FieldByName('ID_ORDEN').AsInteger;
           ExecQuery;
           Result := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameSumaCompras(Campo: string): double;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(' + Campo + ') FROM PRO_ORD_LST_ORDEN_COMPRAS(:ID_ORDEN, :LINEA_FASE) ');
           SQL.Add(' WHERE ');
           SQL.Add(' V_TIPO <> ''FAP'' ');
           if (FiltraFechaImputacion) then
           begin
              SQL.Add(' AND V_FECHA_IMPUTACION >= :DESDE ');
              SQL.Add(' AND V_FECHA_IMPUTACION <= :HASTA ');
              Params.ByName['DESDE'].AsDateTime := RecodeTime(DesdeFecha, 0, 0, 0, 0);
              Params.ByName['HASTA'].AsDateTime := RecodeTime(HastaFecha, 23, 59, 59, 999);
           end;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFases.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['ID_ORDEN'].AsInteger := QMLstFases.FieldByName('ID_ORDEN').AsInteger;
           ExecQuery;
           Result := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  DMMain.LogIni(Format('ProDMLstOrden.frListadoOGetValue(%s,...)', [ParName]));
  DMListados.GetValue(ParName, ParValue);

  // CABECERA LISTADO
  if (ParName = 'Agrupat') then
     ParValue := BoolToInt(Agrupar);

  if Trim(ParName) = 'TFiltro' then
     ParValue := TFiltro;

  if Trim(ParName) = 'Capsalera' then
     ParValue := Capsalera;

  if Trim(ParName) = 'Articulo' then
     ParValue := xCompuesto.FieldByName('TITULO').AsString;

  // SUMATORIO DE LAS UNIDADES Y COSTES DE MATERIALES Y TAREAS
  if Trim(ParName) = 'TotalMatCan' then
  begin
     ParValue := DameSumaMaterial('UNIDADES_NEC');
  end;
  if Trim(ParName) = 'TotalMatVar' then
  begin
     if (TipoListado = 0) then
        ParValue := DameSumaMaterial('TOTAL_VAR')
     else
        ParValue := DameSumaMaterial('TOTAL_VAR_REAL');
  end;
  if Trim(ParName) = 'TotalMatFijo' then
  begin
     if (TipoListado = 0) then
        ParValue := DameSumaMaterial('PRECIO_FIJO')
     else
        ParValue := DameSumaMaterial('PRECIO_FIJO_REAL');
  end;

  if Trim(ParName) = 'TotalMatTotal' then
  begin
     if (TipoListado = 0) then
        ParValue := DameSumaMaterial('TOTAL')
     else
        ParValue := DameSumaMaterial('TOTAL_REAL');
  end;

  if Trim(ParName) = 'TotalTarCan' then
     ParValue := DameSumaTarea('CANTIDAD');

  if Trim(ParName) = 'TotalTarCanReal' then
     ParValue := DameSumaTarea('CANTIDAD_UTIL');

  if Trim(ParName) = 'TotalTarVar' then
     ParValue := DameSumaTarea('TOTAL_VAR_PRE');

  if Trim(ParName) = 'TotalTarVarReal' then
     ParValue := DameSumaTarea('TOTAL_VAR_REAL');

  if Trim(ParName) = 'TotalTarFijo' then
     ParValue := DameSumaTarea('PRECIO_FIJO_PRE');

  if Trim(ParName) = 'TotalTarFijoReal' then
     ParValue := DameSumaTarea('PRECIO_FIJO_REAL');

  if Trim(ParName) = 'TotalTarTotal' then
     ParValue := DameSumaTarea('TOTAL_PRE');

  if Trim(ParName) = 'TotalTarTotalReal' then
     ParValue := DameSumaTarea('TOTAL_REAL');

  if (ParName = 'TotalHorasOF') then
     ParValue := DameSumaTarea('TIEMPO_DEC');

  if (ParName = 'TotalRecursoOF') then
     ParValue := DameSumaTarea('TOTAL_RECURSO');

  if (Copy(ParName, 1, 13) = 'TotalCompras_') then
     ParValue := DameSumaCompras(Copy(ParName, 14, Length(ParName)));

  // Variables del llistat d'ordres - fases-
  if (ParName = 'Tipo_Fase_Preimpresion') then
     ParValue := '10';

  if (ParName = 'Tipo_Fase_Planificacion') then
     ParValue := '20';

  if (ParName = 'Tipo_Fase_Impresion') then
     ParValue := '30';

  if (ParName = 'Tipo_Fase_Verificacion') then
     ParValue := '40';

  if (ParName = 'Fase_Preimpresion') then
     ParValue := DameTituloFase('10');

  if (ParName = 'Fase_Planificacion') then
     ParValue := DameTituloFase('20');

  if (ParName = 'Fase_Impresion') then
     ParValue := DameTituloFase('30');

  if (ParName = 'Fase_Verificacion') then
     ParValue := DameTituloFase('40');

  if (ParName = 'StockComponente') then
  begin
     ParValue := '';
     if (QMLstMateriales.Active) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT EXISTENCIAS ');
              SQL.Add(' FROM A_ART_DAME_STOCK_ARTICULO(:EMPRESA, :CANAL, :ARTICULO, :SOLO_STOCK) ');
              SQL.Add(' WHERE ');
              SQL.Add(' ALMACEN = :ALMACEN ');
              Params.ByName['EMPRESA'].AsInteger := QMLstMateriales.FieldByName('EMPRESA').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMLstMateriales.FieldByName('CANAL').AsInteger;
              Params.ByName['ARTICULO'].AsString := QMLstMateriales.FieldByName('COMPONENTE').AsString;
              Params.ByName['ALMACEN'].AsString := QMLstMateriales.FieldByName('ALMACEN_SAL').AsString;
              Params.ByName['SOLO_STOCK'].AsInteger := 1;
              ExecQuery;
              ParValue := FieldByName['EXISTENCIAS'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if (ParName = 'StockUtillaje') then
  begin
     ParValue := '';
     if (xUtillajes.Active) then
     begin
        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add(' SELECT ARTICULO, ALMACEN, EXISTENCIAS ');
                 SelectSQL.Add(' FROM A_ART_DAME_STOCK_ARTICULO(:EMPRESA, :CANAL, :ARTICULO, :SOLO_STOCK) ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' EXISTENCIAS <> 0 ');
                 Params.ByName['EMPRESA'].AsInteger := xUtillajes.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMLstOrden.FieldByName('CANAL').AsInteger;
                 Params.ByName['ARTICULO'].AsString := xUtillajes.FieldByName('ARTICULO').AsString;
                 Params.ByName['SOLO_STOCK'].AsInteger := 1;
                 Open;
                 ParValue := FieldByName('ALMACEN').AsString + ' x ' + DMMain.DameUnidadesConFormato(FieldByName('ARTICULO').AsString, FieldByName('EXISTENCIAS').AsFloat);
                 Next;
                 while not EOF do
                 begin
                    ParValue := ParValue + #13#10 + FieldByName('ALMACEN').AsString + ' x ' + DMMain.DameUnidadesConFormato(FieldByName('ARTICULO').AsString, FieldByName('EXISTENCIAS').AsFloat);
                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           end;
        finally
           FreeAndNil(DS);
        end;
     end;
  end;
  DMMain.LogFin(Format('ProDMLstOrden.frListadoOGetValue(%s,...)', [ParName]));
end;

procedure TProDMLstOrden.frListadoOEnterRect(Memo: TStringList; View: TfrView);
var
  i : integer;
begin
  DMListados.BeforePrint(Memo, View);

  if (frListadoO.Pages.Count >= 2) then
  begin
     if (MostrarNrosSerie) then
        frListadoO.Pages[1].Visible := False
     else
        frListadoO.Pages[1].Visible := True;
  end;

  if (frListadoO.Pages.Count >= 3) then
  begin
     if (MostrarLote) then
        frListadoO.Pages[2].Visible := False
     else
        frListadoO.Pages[2].Visible := True;
  end;

  if (Memo.Count > 0) and (View is TfrPictureView) then
  begin
     if (Memo[0] = '[ImgArticulo]') then
        DMListados.MostrarImagen(xCompuesto.FieldByName('IMAGEN').AsInteger, View)
     else
     if (Memo[0] = '[ImgComponente]') then
        DMListados.MostrarImagen(xComponente.FieldByName('IMAGEN').AsInteger, View)
     else
     if ((Memo[0] = '[ImatgeUtillatge]') or (Memo[0] = '[ImgUtillaje]')) then
     begin
        if (QMLstTareas.Active) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT IMAGEN FROM PRO_SYS_UTILLAJES WHERE EMPRESA = :EMPRESA AND CODIGO = :CODIGO';
                 Params.ByName['EMPRESA'].AsString := IntToStr(REntorno.Empresa);
                 Params.ByName['CODIGO'].AsString := QMLstTareas.FieldByName('CODIGOUTILLAJE').AsString;
                 ExecQuery;
                 DMListados.MostrarImagen(Fields[0].AsInteger, View);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end
     else
     if (Copy(Memo[0], 1, 11) = '[Pictograma') then
     begin
        i := StrToIntDef(Copy(Memo[0], 12, 1), 0);
        if (i > 0) and (QMLstMateriales.Active) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT FIRST 1 SKIP ' + IntToStr(i - 1) + ' IMAGEN ');
                 SQL.Add(' FROM ART_ARTICULOS_PICTOGRAMA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' ARTICULO = :ARTICULO ');
                 SQL.Add(' ORDER BY PICTOGRAMA ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['ARTICULO'].AsString := QMLstMateriales.FieldByName('COMPONENTE').AsString;
                 ExecQuery;
                 DMListados.MostrarImagen(Fields[0].AsInteger, View);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end
     else
     if ((Memo[0] = '[ImatgeCompost]') or (Memo[0] = '[ImgCompuesto]')) then
        DMListados.MostrarImagen(QMLstOrden.FieldByName('IMAGEN').AsInteger, View)
     else
     if ((Memo[0] = '[ImatgeFullTreball]') or (Memo[0] = '[ImgHojaTrabajo]')) then
        DMListados.MostrarImagen(QMLstFases.FieldByName('ID_IMAGEN').AsInteger, View);
  end;
end;

procedure TProDMLstOrden.ListarOrdenes(DesdeFecha, HastaFecha: TDateTime);
begin
  DMMain.LogIni('ProDMLSTOrden.ListarOrdenes');
  with QMLstCompras do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_ORD_LST_ORDEN_COMPRAS(:ID_ORDEN, :LINEA_FASE) ');
     SelectSQL.Add(' WHERE V_TIPO <> ''FAP'' ');

     if (FiltraFechaImputacion) then
     begin
        SelectSQL.Add(' AND V_FECHA_IMPUTACION >= :DESDE ');
        SelectSQL.Add(' AND V_FECHA_IMPUTACION <= :HASTA ');
        Params.ByName['DESDE'].AsDateTime := RecodeTime(DesdeFecha, 0, 0, 0, 0);
        Params.ByName['HASTA'].AsDateTime := RecodeTime(HastaFecha, 23, 59, 59, 999);
     end;

     SelectSQL.Add(' ORDER BY V_LINEA_COMPRA ');

     Open;
  end;

  with QMLstIncidencias do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DET.* FROM PRO_MAT_INC_C CAB ');
     SelectSQL.Add(' LEFT JOIN PRO_MAT_INC_D DET ON (CAB.ID_INC_C = DET.ID_INC_C) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' CAB.ID_ORDEN = :ID_ORDEN AND ');
     SelectSQL.Add(' CAB.LINEA_FASE = :LINEA_FASE ');

     if (FiltraFechaImputacion) then
     begin
        SelectSQL.Add(' AND CAB.FECHA >= :DESDE ');
        SelectSQL.Add(' AND CAB.FECHA <= :HASTA ');
        Params.ByName['DESDE'].AsDateTime := RecodeTime(DesdeFecha, 0, 0, 0, 0);
        Params.ByName['HASTA'].AsDateTime := RecodeTime(HastaFecha, 23, 59, 59, 999);
     end;

     SelectSQL.Add(' ORDER BY DET.LINEA ');

     Open;
  end;

  with QMLstTareas do
  begin
     Close;
     SelectSQL.Clear;

     if (FiltraFechaImputacion) then
     begin
        // Saldra una tarea por cada marcaje
        SelectSQL.Add(' SELECT TAR.*, REC.TITULO AS NOMBRERECURSO, UTI.CODIGO AS CODIGOUTILLAJE, UTI.DESCRIPCION AS NOMBREUTILLAJE, ');
        SelectSQL.Add(' REC.RECURSO, U.TITULO TITULO_UNIDAD_RECURSO, ');
        SelectSQL.Add(' MARCA.IMPUTACION, IMP.DESCRIPCION AS DESCRIPCION_IMP, ');
        SelectSQL.Add(' MARCA_CAB.FECHA AS FECHA_MARCAJE, OPE.EMPLEADO, TER.NOMBRE_R_SOCIAL ');
        SelectSQL.Add(' FROM PRO_ORD_TAREA TAR ');
        SelectSQL.Add(' LEFT JOIN PRO_RECURSOS REC ON (TAR.EMPRESA = REC.EMPRESA AND TAR.RECURSO = REC.RECURSO) ');
        SelectSQL.Add(' LEFT JOIN SYS_UNIDADES_ARTICULOS U ON REC.UNIDAD = U.TIPO ');
        SelectSQL.Add(' LEFT JOIN PRO_SYS_UTILLAJES UTI ON (UTI.EMPRESA = TAR.EMPRESA AND UTI.CODIGO = TAR.ID_UTILLAJE) ');
        SelectSQL.Add(' LEFT JOIN PRO_ORD_DET_MARCA MARCA ON (TAR.IDENTIFICADOR = MARCA.IDTAREA) ');
        SelectSQL.Add(' LEFT JOIN OPE_SYS_IMPUTACION IMP ON (MARCA.IMPUTACION = IMP.IMPUTACION) ');
        SelectSQL.Add(' LEFT JOIN PRO_ORD_CAB_MARCA MARCA_CAB ON (MARCA_CAB.EMPRESA = MARCA.EMPRESA AND MARCA_CAB.EJERCICIO = MARCA.EJERCICIO AND MARCA_CAB.CANAL = MARCA.CANAL AND MARCA_CAB.SERIE = MARCA.SERIE AND MARCA_CAB.TIPO = MARCA.TIPO AND MARCA_CAB.RIG = MARCA.RIG) ');
        SelectSQL.Add(' LEFT JOIN OPE_EMPLEADO OPE ON (MARCA_CAB.EMPRESA = OPE.EMPRESA AND OPE.EMPLEADO = MARCA_CAB.OPERARIO) ');
        SelectSQL.Add(' LEFT JOIN SYS_TERCEROS TER ON (TER.TERCERO = OPE.TERCERO) ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' TAR.ID_ORDEN = :ID_ORDEN AND ');
        SelectSQL.Add(' TAR.LINEA_FASE = :LINEA_FASE ');
        SelectSQL.Add(' AND ((TAR.FECHA_INICIO_TAREA >= :DESDE AND TAR.FECHA_INICIO_TAREA <= :HASTA) OR TAR.FECHA_INICIO_TAREA IS NULL) ');
        Params.ByName['DESDE'].AsDateTime := RecodeTime(DesdeFecha, 0, 0, 0, 0);
        Params.ByName['HASTA'].AsDateTime := RecodeTime(HastaFecha, 23, 59, 59, 999);
     end
     else
     begin
        // Saldra una tarea con los datos del primer marcaje
        SelectSQL.Add(' SELECT TAR.*, REC.TITULO AS NOMBRERECURSO, UTI.CODIGO AS CODIGOUTILLAJE, UTI.DESCRIPCION AS NOMBREUTILLAJE, ');
        SelectSQL.Add('        REC.RECURSO, U.TITULO TITULO_UNIDAD_RECURSO, ');
        SelectSQL.Add('        (SELECT FIRST 1 IMPUTACION ');
        SelectSQL.Add('         FROM PRO_ORD_DET_MARCA ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         IDTAREA = TAR.IDENTIFICADOR ');
        SelectSQL.Add('         ORDER BY LINEA) IMPUTACION, ');
        SelectSQL.Add('        (SELECT FIRST 1 I.DESCRIPCION ');
        SelectSQL.Add('         FROM PRO_ORD_DET_MARCA M ');
        SelectSQL.Add('         JOIN OPE_SYS_IMPUTACION I ON M.IMPUTACION = I.IMPUTACION ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         M.IDTAREA = TAR.IDENTIFICADOR ');
        SelectSQL.Add('         ORDER BY M.LINEA) DESCRIPCION_IMP, ');
        SelectSQL.Add('        (SELECT FIRST 1 C.FECHA ');
        SelectSQL.Add('         FROM PRO_ORD_CAB_MARCA C ');
        SelectSQL.Add('         JOIN PRO_ORD_DET_MARCA D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         D.IDTAREA = TAR.IDENTIFICADOR ');
        SelectSQL.Add('         ORDER BY D.LINEA) FECHA_MARCAJE, ');
        SelectSQL.Add('        (SELECT FIRST 1 O.EMPLEADO ');
        SelectSQL.Add('         FROM PRO_ORD_CAB_MARCA C ');
        SelectSQL.Add('         JOIN PRO_ORD_DET_MARCA D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG ');
        SelectSQL.Add('         JOIN OPE_EMPLEADO O ON C.EMPRESA = O.EMPRESA AND O.EMPLEADO = C.OPERARIO ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         D.IDTAREA = TAR.IDENTIFICADOR ');
        SelectSQL.Add('         ORDER BY D.LINEA) EMPLEADO, ');
        SelectSQL.Add('        (SELECT FIRST 1 T.NOMBRE_R_SOCIAL ');
        SelectSQL.Add('         FROM PRO_ORD_CAB_MARCA C ');
        SelectSQL.Add('         JOIN PRO_ORD_DET_MARCA D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG ');
        SelectSQL.Add('         JOIN OPE_EMPLEADO O ON C.EMPRESA = O.EMPRESA AND O.EMPLEADO = C.OPERARIO ');
        SelectSQL.Add('         JOIN SYS_TERCEROS T ON T.TERCERO = O.TERCERO ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         D.IDTAREA = TAR.IDENTIFICADOR ');
        SelectSQL.Add('         ORDER BY D.LINEA) NOMBRE_R_SOCIAL ');
        SelectSQL.Add(' FROM PRO_ORD_TAREA TAR ');
        SelectSQL.Add(' LEFT JOIN PRO_RECURSOS REC ON (TAR.EMPRESA = REC.EMPRESA AND TAR.RECURSO = REC.RECURSO) ');
        SelectSQL.Add(' LEFT JOIN SYS_UNIDADES_ARTICULOS U ON REC.UNIDAD = U.TIPO ');
        SelectSQL.Add(' LEFT JOIN PRO_SYS_UTILLAJES UTI ON (UTI.EMPRESA = TAR.EMPRESA AND UTI.CODIGO = TAR.ID_UTILLAJE) ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' TAR.ID_ORDEN = :ID_ORDEN AND ');
        SelectSQL.Add(' TAR.LINEA_FASE = :LINEA_FASE ');
     end;

     SelectSQL.Add(' ORDER BY TAR.ORDEN, TAR.LINEA_TAREA ');

     Open;
  end;

  DMMain.LogFin('ProDMLSTOrden.ListarOrdenes');
end;

procedure TProDMLstOrden.QMLstEtiquetasAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstEtiquetasAfterOpen');
  QMLstEtiDibujo.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstEtiquetasAfterOpen');
end;

procedure TProDMLstOrden.QMLstFasesAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstFasesAfterOpen');
  QMLstMateriales.Open;
  // Tanco la font de dades quan s'agrupa per tareas
  if (Agrupar) then
  begin
     QMLstTareasAgru.Open;
     if (TipoListado = 1) then
        QMLstMarcajesAgru.Open;
  end
  else
     QMLstTareas.Open;

  QMLstCompras.Open;
  QMLstIncidencias.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstFasesAfterOpen');
end;

procedure TProDMLstOrden.QMLstFasesBeforeClose(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstFasesBeforeClose');
  QMLstMateriales.Close;
  // Tanco la font de dades quan s'agrupa per tareas
  if (Agrupar) then
  begin
     QMLstTareasAgru.Close;
     if (TipoListado = 1) then
        QMLstMarcajesAgru.Close;
  end
  else
     QMLstTareas.Close;

  QMLstCompras.Close;
  QMLstIncidencias.Close;
  DMMain.LogFin('ProDMLSTOrden.QMLstFasesBeforeClose');
end;

procedure TProDMLstOrden.QMLstOrdenAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstOrdenAfterOpen');
  xTituloLote.Open;
  QMLstPedido.Open;
  QMLstPedidoDet.Open;
  QMLstEtiquetas.Open;
  QMLstFichaTecnica.Open;
  xCompuesto.Open;
  xCompuestoCodigoCliente.Open;
  xEscandallo.Open;
  xCliente.Open;
  xEmpleado.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstOrdenAfterOpen');
end;

procedure TProDMLstOrden.QMLstOrdenBeforeClose(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstOrdenBeforeClose');
  xTituloLote.Close;
  QMLstPedido.Close;
  QMLstPedidoDet.Close;
  QMLstEtiquetas.Close;
  QMLstFichaTecnica.Close;
  xCompuesto.Close;
  xCompuestoCodigoCliente.Close;
  xEscandallo.Close;
  xCliente.Close;
  xEmpleado.Close;
  DMMain.LogFin('ProDMLSTOrden.QMLstOrdenBeforeClose');
end;

procedure TProDMLstOrden.QMLstEtiquetasBeforeClose(DataSet: TDataSet);
begin
  QMLstEtiDibujo.Close;
end;

procedure TProDMLstOrden.QMLstFichaTecnicaAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstFichaTecnicaAfterOpen');
  QMLstFichaTecnicaDet.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstFichaTecnicaAfterOpen');
end;

procedure TProDMLstOrden.QMLstFichaTecnicaBeforeClose(DataSet: TDataSet);
begin
  QMLstFichaTecnicaDet.Close;
end;

procedure TProDMLstOrden.QMLstTareasAgruAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstTareasAgruAfterOpen');
  QMLstMarcajesAgru.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstTareasAgruAfterOpen');
end;

procedure TProDMLstOrden.QMLstTareasAgruBeforeClose(DataSet: TDataSet);
begin
  QMLstMarcajesAgru.Close;
end;

procedure TProDMLstOrden.QMLstTareasAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstTareasAfterOpen');
  if (TipoListado = 1) then
     QMLstMarcajes.Open;
  xTituloMaquina.Open;
  xUtillajes.Open;
  xLstTareaEsc.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstTareasAfterOpen');
end;

procedure TProDMLstOrden.QMLstTareasBeforeClose(DataSet: TDataSet);
begin
  if (TipoListado = 1) then
     QMLstMarcajes.Close;
  xTituloMaquina.Close;
  xUtillajes.Close;
  xLstTareaEsc.Close;
end;

procedure TProDMLstOrden.QMLstMaterialesAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('ProDMLSTOrden.QMLstMaterialesAfterOpen');
  QMLstMaterialesLotes.Open;
  xComponente.Open;
  DMMain.LogFin('ProDMLSTOrden.QMLstMaterialesAfterOpen');
end;

procedure TProDMLstOrden.QMLstMaterialesBeforeClose(DataSet: TDataSet);
begin
  QMLstMaterialesLotes.Close;
  xComponente.Close;
end;

procedure TProDMLstOrden.xOrdenAfterOpen(DataSet: TDataSet);
begin
  xMinMaxFase.Open;
end;

procedure TProDMLstOrden.xOrdenBeforeClose(DataSet: TDataSet);
begin
  xMinMaxFase.Close;
end;

procedure TProDMLstOrden.QMLstPedidoDetAfterOpen(DataSet: TDataSet);
begin
  with xArticuloCodigoCliente do
  begin
     Close;
     Params.ByName['CLIENTE'].AsInteger := QMLstPedido.FieldByName('CLIENTE').AsInteger;
     Open;
  end;
end;

procedure TProDMLstOrden.QMLstPedidoDetBeforeClose(DataSet: TDataSet);
begin
  xArticuloCodigoCliente.Close;
end;

procedure TProDMLstOrden.frxListadoOGetValue(const VarName: string; var Value: variant);
begin
  frListadoOGetValue(VarName, Value);
end;

procedure TProDMLstOrden.frxListadoOBeforePrint(Sender: TfrxReportComponent);
var
  i : integer;
begin
  DMListados.BeforePrint(Sender);

  // Tratamiento de las Imagenes
  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = '[ImgArticulo]') then
     begin
        DMListados.MostrarImagen(xCompuesto.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := (xCompuesto.FieldByName('IMAGEN').AsInteger <> 0);
     end
     else
     if (TfrxPictureView(Sender).TagStr = '[ImgComponente]') then
     begin
        DMListados.MostrarImagen(xCompuesto.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := (xComponente.FieldByName('IMAGEN').AsInteger <> 0);
     end
     else
     if ((TfrxPictureView(Sender).TagStr = '[ImatgeUtillatge]') or (TfrxPictureView(Sender).TagStr = '[ImgUtillaje]')) then
     begin
        if (QMLstTareas.Active) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT IMAGEN FROM PRO_SYS_UTILLAJES WHERE EMPRESA = :EMPRESA AND CODIGO = :CODIGO';
                 Params.ByName['EMPRESA'].AsString := IntToStr(REntorno.Empresa);
                 Params.ByName['CODIGO'].AsString := QMLstTareas.FieldByName('CODIGOUTILLAJE').AsString;
                 ExecQuery;
                 DMListados.MostrarImagen(Fields[0].AsInteger, TfrxPictureView(Sender));
                 TfrxPictureView(Sender).Visible := (Fields[0].AsInteger <> 0);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end
     else
     if (Copy(TfrxPictureView(Sender).TagStr, 1, 11) = '[Pictograma') then
     begin
        i := StrToIntDef(Copy(TfrxPictureView(Sender).TagStr, 12, 1), 0);
        if (i > 0) and (QMLstMateriales.Active) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT FIRST 1 SKIP ' + IntToStr(i - 1) + ' IMAGEN ');
                 SQL.Add(' FROM ART_ARTICULOS_PICTOGRAMA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' ARTICULO = :ARTICULO ');
                 SQL.Add(' ORDER BY PICTOGRAMA ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['ARTICULO'].AsString := QMLstMateriales.FieldByName('COMPONENTE').AsString;
                 ExecQuery;
                 DMListados.MostrarImagen(Fields[0].AsInteger, TfrxPictureView(Sender));
                 TfrxPictureView(Sender).Visible := (Fields[0].AsInteger <> 0);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end
     else
     if ((TfrxPictureView(Sender).TagStr = '[ImatgeCompost]') or (TfrxPictureView(Sender).TagStr = '[ImgCompuesto]')) then
     begin
        DMListados.MostrarImagen(QMLstOrden.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := (QMLstOrden.FieldByName('IMAGEN').AsInteger <> 0);
     end
     else
     if ((TfrxPictureView(Sender).TagStr = '[ImatgeFullTreball]') or (TfrxPictureView(Sender).TagStr = '[ImgHojaTrabajo]')) then
     begin
        DMListados.MostrarImagen(QMLstFases.FieldByName('ID_IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := (QMLstFases.FieldByName('ID_IMAGEN').AsInteger <> 0);
     end;
  end;
end;

procedure TProDMLstOrden.QMLstPedidoAfterOpen(DataSet: TDataSet);
begin
  xDireccionPedido.Open;
end;

procedure TProDMLstOrden.QMLstPedidoBeforeClose(DataSet: TDataSet);
begin
  xDireccionPedido.Close;
end;

end.
