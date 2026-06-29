unit UDMAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, DateUtils, idGlobalProtocols,
  FIBQuery, FR_DSet, FR_DBSet, frxClass, frxHYReport, FR_Class, Fr_HYReport;

type
  TDMAlmacenes = class(TDataModule)
     DSQMAlmacenes: TDataSource;
     xTipoAlmacen: TFIBDataSetRO;
     DSxTipoAlmacen: TDataSource;
     QMAlmacenes: TFIBTableSet;
     QMAlmacenesEMPRESA: TIntegerField;
     QMAlmacenesALMACEN: TFIBStringField;
     QMAlmacenesTITULO: TFIBStringField;
     QMAlmacenesTIPO: TFIBStringField;
     QMAlmacenesTERCERO: TIntegerField;
     QMAlmacenesDIRECCION: TIntegerField;
     xTerceros: TFIBDataSetRO;
     DSxTerceros: TDataSource;
     EntornoFiltro: TEntornoFind2000;
     xDirecciones: TFIBDataSetRO;
     DSxDirecciones: TDataSource;
     QMAlmacenesAUTO_CONTIENE: TIntegerField;
     TLocal: THYTransaction;
     QMAlmacenesDEPOSITO: TIntegerField;
     QMAlmacenesCTROL_UBICACION: TIntegerField;
     QMAlmacenesDEFECTO: TIntegerField;
     TUpdate: THYTransaction;
     QMArticulosAlmacenes: TFIBTableSet;
     DSQMArticulosAlmacenes: TDataSource;
     QMArticulosAlmacenesEMPRESA: TIntegerField;
     QMArticulosAlmacenesCANAL: TIntegerField;
     QMArticulosAlmacenesALMACEN: TFIBStringField;
     QMArticulosAlmacenesARTICULO: TFIBStringField;
     QMArticulosAlmacenesID_A: TIntegerField;
     QMArticulosAlmacenesSTOCK_MINIMO: TFloatField;
     QMArticulosAlmacenesSTOCK_MAXIMO: TFloatField;
     DSxMovStockAlmacen: TDataSource;
     QMArticulosAlmacenesTITULO: TFIBStringField;
     xMovStockAlmacen: TFIBTableSet;
     xMovStockAlmacenEMPRESA: TIntegerField;
     xMovStockAlmacenEJERCICIO: TIntegerField;
     xMovStockAlmacenCANAL: TIntegerField;
     xMovStockAlmacenN_MOV_STOCK: TIntegerField;
     xMovStockAlmacenPERIODO: TFIBStringField;
     xMovStockAlmacenALMACEN: TFIBStringField;
     xMovStockAlmacenARTICULO: TFIBStringField;
     xMovStockAlmacenTIPO_OPER: TFIBStringField;
     xMovStockAlmacenFECHA: TDateTimeField;
     xMovStockAlmacenCOMENTARIO: TFIBStringField;
     xMovStockAlmacenUNIDADES: TFloatField;
     xMovStockAlmacenPRECIO: TFloatField;
     xMovStockAlmacenORIGEN: TFIBStringField;
     xMovStockAlmacenIMPORTE: TFloatField;
     xMovStockAlmacenDOC_NUMERO: TIntegerField;
     xMovStockAlmacenDOC_SERIE: TFIBStringField;
     xMovStockAlmacenENTRADA: TIntegerField;
     xMovStockAlmacenACTIVO: TIntegerField;
     xMovStockAlmacenUNIDADES_EXT: TFloatField;
     xMovStockAlmacenPRECIO_SIN_DTO: TFloatField;
     xMovStockAlmacenMOV_VIRTUAL: TIntegerField;
     xMovStockAlmacenID_A: TIntegerField;
     xMovStockAlmacenID_MOV_STOCKS: TIntegerField;
     xMovStockAlmacenDEFINITIVO: TIntegerField;
     QMArticulosAlmacenesESTADO: TFIBStringField;
     xStockEliminadoAlmacen: TFIBTableSet;
     DSxStockEliminadoAlmacen: TDataSource;
     xStockEliminadoAlmacenEMPRESA: TIntegerField;
     xStockEliminadoAlmacenCANAL: TIntegerField;
     xStockEliminadoAlmacenALMACEN: TFIBStringField;
     xStockEliminadoAlmacenARTICULO: TFIBStringField;
     xStockEliminadoAlmacenID_A: TIntegerField;
     QMAlmacenesALMACEN_INTELIGENTE: TIntegerField;
     QMArticulos: TFIBDataSetRO;
     QMArticulosUNIDADES: TFIBStringField;
     QMArticulosTITULO_UNIDADES: TFIBStringField;
     QMArticulosAlmacenesFAMILIA: TFIBStringField;
     QMArticulosAlmacenesTITULO_FAMILIA: TFIBStringField;
     QMArticulosAlmacenesP_COSTE: TFloatField;
     QMAlmacenesCARPETA_IMPORTACION: TFIBStringField;
     QMAlmacenesCARPETA_EXPORTACION: TFIBStringField;
     QMAlmacenesALMACEN_ORIGEN: TFIBStringField;
     QMAlmacenesALMACEN_DESTINO: TFIBStringField;
     QMAlmacenesSERIE_MOVIMIENTOS: TFIBStringField;
     xUbicaciones: TFIBDataSetRO;
     DSxUbicaciones: TDataSource;
     xUbicacionesEMPRESA: TIntegerField;
     xUbicacionesALMACEN: TFIBStringField;
     xUbicacionesCALLE: TFIBStringField;
     xUbicacionesESTANTERIA: TFIBStringField;
     xUbicacionesREPISA: TFIBStringField;
     xUbicacionesPOSICION: TFIBStringField;
     xUbicacionesTITULO: TFIBStringField;
     xUbicacionesVOLUMEN_MAX: TFloatField;
     xUbicacionesDIAMETRO_MAX: TFloatField;
     xUbicacionesPESO_MAX: TFloatField;
     xUbicacionesVOLUMEN_ACC: TFloatField;
     xUbicacionesPESO_ACC: TFloatField;
     xUbicacionesDIAMETRO_ACC: TFloatField;
     xUbicacionesID_UBICACION: TIntegerField;
     xUbicacionesCOMPOSICION: TFIBStringField;
     xUbicacionesGENERAL: TIntegerField;
     xUbicacionesUNIDADES_ACC: TFloatField;
     xArticulos: TFIBDataSetRO;
     xArticuloLote: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     DSxArticuloLote: TDataSource;
     xUbicacionesTIPO: TFIBStringField;
     xUbicacionesSECTOR: TFIBStringField;
     xUbicacionesDISPONIBLE: TIntegerField;
     xArticulosENTRADAS: TFloatField;
     xArticulosSALIDAS: TFloatField;
     xArticulosEXISTENCIAS: TFloatField;
     xArticulosCOMPOSICION: TFIBStringField;
     xArticulosTITULO_UBICACION: TFIBStringField;
     xArticulosTITULO_ARTIC: TFIBStringField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosFAMILIA: TFIBStringField;
     xArticuloLoteEMPRESA: TIntegerField;
     xArticuloLoteCANAL: TIntegerField;
     xArticuloLoteARTICULO: TFIBStringField;
     xArticuloLoteLOTE: TFIBStringField;
     xArticuloLoteSERIE: TFIBStringField;
     xArticuloLoteCLASIFICACION: TFIBStringField;
     xArticuloLoteF_ENVASADO: TDateTimeField;
     xArticuloLoteF_CADUCIDAD: TDateTimeField;
     xArticuloLoteF_FABRICACION: TDateTimeField;
     xArticuloLoteID_A: TIntegerField;
     xArticuloLoteAUTO_REETIQUETADO: TIntegerField;
     xArticuloLoteCODIGO: TIntegerField;
     xArticuloLotePROVEEDOR: TIntegerField;
     xArticuloLoteID_LOTE: TIntegerField;
     xArticuloLoteALMACEN: TFIBStringField;
     xArticuloLoteSTOCK: TFloatField;
     xArticuloLoteID_UBICACION: TIntegerField;
     xArticuloLoteID_A_UBICACION: TIntegerField;
     xStocks: TFIBTableSet;
     DSxStocks: TDataSource;
     xStocksEMPRESA: TIntegerField;
     xStocksALMACEN: TFIBStringField;
     xStocksCANAL: TIntegerField;
     xStocksARTICULO: TFIBStringField;
     xStocksTITULO_ART: TFIBStringField;
     xStocksFAMILIA: TFIBStringField;
     xStocksTITULO_FAM: TFIBStringField;
     xStocksSTOCK_MINIMO: TFloatField;
     xStocksSTOCK_MAXIMO: TFloatField;
     xStocksEXISTENCIAS: TFloatField;
     xStocksPEDIDOS_D_CLIENTE: TFloatField;
     xStocksPEDIDOS_D_PROVEEDOR: TFloatField;
     xStocksRESERVADAS: TFloatField;
     xStocksP_COSTE: TFloatField;
     xStocksPMP: TFloatField;
     xStocksENTRADA: TIntegerField;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     QMinFamilia: THYFIBQuery;
     QMaxFamilia: THYFIBQuery;
     frAlmStocks: TfrHYReport;
     frxAlmStocks: TfrxHYReport;
     frDBDxStocks: TfrDBDataSet;
     QMAlmacenesACTIVO: TIntegerField;
     QMAlmacenesEJERCICIO: TIntegerField;
     QMAlmacenesCANAL: TIntegerField;
     QMAlmacenesCTA_INVENTARIO: TFIBStringField;
     QMAlmacenesCTA_GASTOS: TFIBStringField;
     QMAlmacenesCTA_INGRESOS: TFIBStringField;
     QMAlmacenesCTA_INVENTARIO_PGC: TIntegerField;
     QMAlmacenesCTA_GASTOS_PGC: TIntegerField;
     QMAlmacenesCTA_INGRESOS_PGC: TIntegerField;
     QMArticulosAlmacenesALFA_2: TFIBStringField;
     xStocksFABRICANTE: TIntegerField;
     xStocksTITULO_FABRICANTE: TFIBStringField;
     xStocksALFA_1: TFIBStringField;
     xStocksALFA_2: TFIBStringField;
     xStocksALFA_3: TFIBStringField;
     xStocksALFA_4: TFIBStringField;
     xStocksALFA_5: TFIBStringField;
     xStocksALFA_6: TFIBStringField;
     xStocksALFA_7: TFIBStringField;
     xStocksALFA_8: TFIBStringField;
     xStocksBARRAS: TFIBStringField;
     procedure DMAlmacenesCreate(Sender: TObject);
     procedure QMAlmacenesTERCEROChange(Sender: TField);
     procedure QMAlmacenesNewRecord(DataSet: TDataSet);
     procedure QMAlmacenesBeforeEdit(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMAlmacenesTIPOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMAlmacenesBeforePost(DataSet: TDataSet);
     procedure xUbicacionesAfterScroll(DataSet: TDataSet);
     procedure xArticulosAfterScroll(DataSet: TDataSet);
     procedure QMAlmacenesAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
     FSoloElementosConStock: boolean;
     Buscando: boolean;
     procedure SetSoloElementosConStock(const Value: boolean);
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraAlmacenes(DesdeArticulo, HastaArticulo: string; EjercicioDesde, EjercicioHasta, Canal, TipoMov: integer; FechaDesde, FechaHasta: TDateTime; Origen: integer);
     procedure AgregarQuitarFamilia(Tipo, DesdeFamilia, HastaFamilia: string);
     procedure AgregarQuitarArticulo(Tipo, DesdeArticulo, HastaArticulo: string);
     procedure AgregarQuitarAgrupacion(Tipo, DesdeAgrupacion, HastaAgrupacion: string);
     procedure GenerarMaestroProductos(empresa, ejercicio, canal: integer; almacen: string);//sfg.albert
     procedure BorrarMarcasMaestroProductos(empresa, ejercicio, canal: integer; almacen: string); //sfg.albert
     procedure AbreArticulos;
     procedure AbreFicha;
     procedure CerrarArticulos;
     procedure CerrarFicha;
     procedure CerrarMovimientos;
     procedure LeeEntradas(empresa: integer; almacen: string);//sfg.albert
     procedure LeeSalidas(empresa: integer; almacen: string); //sfg.albert
     procedure AbreUbicaciones;
     procedure CerrarUbicaciones;
     procedure PosicionaUbicacion(IdUbicacion: integer);
     procedure PosicionaArticuloUbicacion(Articulo: string);
     procedure AcumulaStocks(articulod, articuloh, familiad, familiah: string; canal: integer);
     procedure AbreStocks;
     procedure CerrarStock;
     procedure MostrarListado(Modo: smallint);
     procedure RecalcularPrecios(Automatico: boolean = False; Log: TStrings = nil);
     procedure PonderaArticulos(Automatico: boolean = False);
     procedure ActualizarPMP(Automatico: boolean = False);
  published
     property SoloElementosConStock: boolean Read FSoloElementosConStock Write SetSoloElementosConStock;
  end;

var
  DMAlmacenes : TDMAlmacenes;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UDameDato, UDMMovManStock, UFormGest, UDMListados,
  UFSendCorreo, UParam;

{$R *.DFM}

procedure TDMAlmacenes.DMAlmacenesCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xStocksP_COSTE.DisplayFormat := MascaraN;
  xStocksPMP.DisplayFormat := MascaraN;
  xStocksEXISTENCIAS.DisplayFormat := MascaraI;

  xMovStockAlmacenPRECIO.DisplayFormat := MascaraN;
  xMovStockAlmacenIMPORTE.DisplayFormat := MascaraN;
  xMovStockAlmacenPRECIO_SIN_DTO.DisplayFormat := MascaraN;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     xStocks.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  SQLBase := TStringList.Create;
  SQLBase.Text := xMovStockAlmacen.SelectSQL.Text;
  xMovStockAlmacen.Ordenar('EMPRESA,EJERCICIO,CANAL,ARTICULO,FECHA,TIPO_OPER');

  DMMain.FiltraTabla(QMAlmacenes, '11100', True);
  // xTipoAlmacen.Open;

  FSoloElementosConStock := True;
  Buscando := False;
end;

procedure TDMAlmacenes.QMAlmacenesTERCEROChange(Sender: TField);
begin
  QMAlmacenesDIRECCION.AsInteger := 1;
  EntornoFiltro.Tercero := Sender.AsInteger;
end;

procedure TDMAlmacenes.QMAlmacenesNewRecord(DataSet: TDataSet);
begin
  QMAlmacenesEMPRESA.AsInteger := REntorno.Empresa;
  QMAlmacenesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAlmacenesCANAL.AsInteger := REntorno.Canal;
  QMAlmacenesTIPO.AsString := 'N';
  QMAlmacenesTERCERO.AsInteger := 1;
  QMAlmacenesDIRECCION.AsInteger := 1;
  QMAlmacenesAUTO_CONTIENE.AsInteger := 0;
  QMAlmacenesDEPOSITO.AsInteger := 0;
  QMAlmacenesCTROL_UBICACION.AsInteger := 0;
  QMAlmacenesDEFECTO.AsInteger := 0;
  QMAlmacenesACTIVO.AsInteger := 1;
  QMAlmacenesCTA_INVENTARIO.AsString := '';
  QMAlmacenesCTA_GASTOS.AsString := '';
  QMAlmacenesCTA_INGRESOS.AsString := '';
  QMAlmacenesCTA_INVENTARIO_PGC.AsInteger := REntorno.PGC;
  QMAlmacenesCTA_GASTOS_PGC.AsInteger := REntorno.PGC;
  QMAlmacenesCTA_INGRESOS_PGC.AsInteger := REntorno.PGC;
end;

procedure TDMAlmacenes.QMAlmacenesBeforeEdit(DataSet: TDataSet);
begin
  EntornoFiltro.Tercero := DataSet.FieldByName('Tercero').AsInteger;
end;

procedure TDMAlmacenes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  if QMAlmacenesDEFECTO.AsInteger = 1 then
     REntorno.AlmacenDefecto := QMAlmacenesALMACEN.AsString;
end;

procedure TDMAlmacenes.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAlmacenes, '10000');
end;

procedure TDMAlmacenes.QMAlmacenesTIPOChange(Sender: TField);
begin
  with xTipoAlmacen do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAlmacenes.DataModuleDestroy(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ART_ACUMULA_STOCKS WHERE ENTRADA=:ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xMovStockAlmacen.Close;
  SQLBase.Free;
end;

procedure TDMAlmacenes.FiltraAlmacenes(DesdeArticulo, HastaArticulo: string; EjercicioDesde, EjercicioHasta, Canal, TipoMov: integer; FechaDesde, FechaHasta: TDateTime; Origen: integer);
var
  Orden : string;
begin
  with xMovStockAlmacen do
  begin
     Orden := OrdenadoPor;
     Close;
     SelectSQL.Assign(SQLbase);

     case TipoMov of
        1: SelectSQL.Text := SelectSQL.Text + ' AND TIPO_OPER = ''E''';
        2: SelectSQL.Text := SelectSQL.Text + ' AND TIPO_OPER = ''S''';
        3: SelectSQL.Text := SelectSQL.Text + ' AND TIPO_OPER = ''O''';
        4: SelectSQL.Text := SelectSQL.Text + ' AND TIPO_OPER = ''D''';
        5: SelectSQL.Text := SelectSQL.Text + ' AND (TIPO_OPER = ''E'' OR TIPO_OPER = ''D'')';
        6: SelectSQL.Text := SelectSQL.Text + ' AND (TIPO_OPER = ''S'' OR TIPO_OPER = ''O'')';
     end;
     if (DesdeArticulo > '') then
        SelectSQL.Text := SelectSQL.Text + ' AND ARTICULO >= ''' + DesdeArticulo + '''';
     if (HastaArticulo > '') then
        SelectSQL.Text := SelectSQL.Text + ' AND ARTICULO <= ''' + HastaArticulo + '''';
     if (EjercicioDesde > 0) then
        SelectSQL.Text := SelectSQL.Text + ' AND EJERCICIO >= ' + IntToStr(EjercicioDesde);
     if (EjercicioHasta > 0) then
        SelectSQL.Text := SelectSQL.Text + ' AND EJERCICIO <= ' + IntToStr(EjercicioHasta);
     if (Canal > 0) then
        SelectSQL.Text := SelectSQL.Text + ' AND CANAL = ' + IntToStr(Canal);

     case Origen of
        1: SelectSQL.Text := SelectSQL.Text + ' AND ORIGEN = ''ALB''';
        2: SelectSQL.Text := SelectSQL.Text + ' AND ORIGEN = ''ALP''';
        3: SelectSQL.Text := SelectSQL.Text + ' AND ORIGEN = ''FAC''';
        4: SelectSQL.Text := SelectSQL.Text + ' AND ORIGEN = ''FAP''';
        5: SelectSQL.Text := SelectSQL.Text + ' AND ORIGEN = ''MAN''';
        6: SelectSQL.Text := SelectSQL.Text + ' AND ORIGEN = ''OPR''';
     end;

     SelectSQL.Text := SelectSQL.Text + ' AND FECHA BETWEEN ?FECHA_DESDE AND ?FECHA_HASTA ';
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;

     Ordenar(Orden);
     Open;
  end;
end;

procedure TDMAlmacenes.AgregarQuitarFamilia(Tipo, DesdeFamilia, HastaFamilia: string);
begin
  // Agrega o quita articulos entre familias a ART_ARTICULOS_ARMACENES_ART
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'I') then
           SQL.Text := ' INSERT INTO ART_ARTICULOS_ALMACENES_ART (EMPRESA,CANAL,ALMACEN,ARTICULO,ID_A,STOCK_MINIMO,STOCK_MAXIMO,ESTADO)               ' +
              ' SELECT A.EMPRESA,?CANAL,?ALMACEN,A.ARTICULO,A.ID_A,0 ,0,''A'' FROM ART_ARTICULOS A LEFT JOIN ART_ARTICULOS_ALMACENES_ART AA    ' +
              ' ON A.EMPRESA=AA.EMPRESA AND A.ARTICULO=AA.ARTICULO AND AA.CANAL=?CANAL AND AA.ALMACEN=?ALMACEN                               ' +
              ' WHERE A.EMPRESA=?EMPRESA AND A.FAMILIA BETWEEN ?FAMILIA_DESDE AND ?FAMILIA_HASTA AND AA.ARTICULO IS NULL  ORDER BY A.FAMILIA '
        else
           SQL.Text := ' DELETE FROM ART_ARTICULOS_ALMACENES_ART WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND ALMACEN=?ALMACEN                   ' +
              ' AND ARTICULO IN(SELECT A.ARTICULO FROM ART_ARTICULOS A JOIN ART_ARTICULOS_ALMACENES_ART AA ON A.EMPRESA=AA.EMPRESA AND ' +
              ' A.ARTICULO=AA.ARTICULO AND AA.CANAL=?CANAL AND AA.ALMACEN=?ALMACEN WHERE A.EMPRESA=?EMPRESA AND A.FAMILIA BETWEEN      ' +
              ' ?FAMILIA_DESDE AND ?FAMILIA_HASTA)';
        Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
        Params.ByName['FAMILIA_DESDE'].AsString := DesdeFamilia;
        Params.ByName['FAMILIA_HASTA'].AsString := HastaFamilia;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMArticulosAlmacenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
     Open;
  end;
end;

procedure TDMAlmacenes.AgregarQuitarArticulo(Tipo, DesdeArticulo, HastaArticulo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'I') then
           SQL.Text := ' INSERT INTO ART_ARTICULOS_ALMACENES_ART (EMPRESA,CANAL,ALMACEN,ARTICULO,ID_A,STOCK_MINIMO,STOCK_MAXIMO,ESTADO)                          ' +
              ' SELECT A.EMPRESA,?CANAL,?ALMACEN,A.ARTICULO,A.ID_A,0 ,0,''A'' FROM ART_ARTICULOS A LEFT JOIN ART_ARTICULOS_ALMACENES_ART AA            ' +
              ' ON A.EMPRESA=AA.EMPRESA AND A.ARTICULO=AA.ARTICULO AND AA.CANAL=?CANAL AND AA.ALMACEN=?ALMACEN                                   ' +
              ' WHERE A.EMPRESA=?EMPRESA AND A.ARTICULO BETWEEN ?ARTICULO_DESDE AND ?ARTICULO_HASTA AND AA.ARTICULO IS NULL  ORDER BY A.ARTICULO '
        else
           SQL.Text := ' DELETE FROM ART_ARTICULOS_ALMACENES_ART WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND ALMACEN=?ALMACEN AND ARTICULO ' +
              ' IN(SELECT A.ARTICULO FROM ART_ARTICULOS A JOIN ART_ARTICULOS_ALMACENES_ART AA ON A.EMPRESA=AA.EMPRESA AND         ' +
              ' A.ARTICULO = AA.ARTICULO AND AA.CANAL = ?CANAL AND AA.ALMACEN = ?ALMACEN WHERE A.EMPRESA=?EMPRESA AND             ' +
              ' A.ARTICULO BETWEEN ?ARTICULO_DESDE AND ?ARTICULO_HASTA)';
        Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
        Params.ByName['ARTICULO_DESDE'].AsString := DesdeArticulo;
        Params.ByName['ARTICULO_HASTA'].AsString := HastaArticulo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMArticulosAlmacenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
     Open;
  end;
end;

procedure TDMAlmacenes.AgregarQuitarAgrupacion(Tipo, DesdeAgrupacion, HastaAgrupacion: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'I') then
           SQL.Text := ' INSERT INTO ART_ARTICULOS_ALMACENES_ART (EMPRESA,CANAL,ALMACEN,ARTICULO,ID_A,STOCK_MINIMO,STOCK_MAXIMO) ' +
              ' SELECT A.EMPRESA,?CANAL,?ALMACEN,A.ARTICULO,A.ID_A,0 ,0 FROM ART_ARTICULOS A                            ' +
              ' JOIN EMP_AGRUPACIONES_ART EAA                                                                           ' +
              ' ON A.ID_A  = EAA.ID_A                                                                                   ' +
              ' LEFT JOIN ART_ARTICULOS_ALMACENES_ART AA                                                                ' +
              ' ON A.EMPRESA=AA.EMPRESA AND A.ARTICULO=AA.ARTICULO AND AA.CANAL=?CANAL AND AA.ALMACEN=?ALMACEN          ' +
              ' WHERE A.EMPRESA=?EMPRESA  AND EAA.AGRUPACION BETWEEN ?AGRUPACION_DESDE AND ?AGRUPACION_HASTA            ' +
              ' AND AA.ARTICULO IS NULL ORDER BY EAA.AGRUPACION                                                         '
        else
           SQL.Text := ' DELETE FROM ART_ARTICULOS_ALMACENES_ART WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND ALMACEN=?ALMACEN AND ARTICULO ' +
              ' IN(SELECT A.ARTICULO FROM ART_ARTICULOS A JOIN ART_ARTICULOS_ALMACENES_ART AA ON A.EMPRESA=AA.EMPRESA AND         ' +
              ' A.ARTICULO = AA.ARTICULO AND AA.CANAL = ?CANAL AND AA.ALMACEN = ?ALMACEN JOIN EMP_AGRUPACIONES_ART EAA            ' +
              ' ON AA.ID_A  = EAA.ID_A  WHERE A.EMPRESA=?EMPRESA AND EAA.AGRUPACION BETWEEN ?AGRUPACION_DESDE AND ?AGRUPACION_HASTA)';
        Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
        Params.ByName['AGRUPACION_DESDE'].AsString := DesdeAgrupacion;
        Params.ByName['AGRUPACION_HASTA'].AsString := HastaAgrupacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMArticulosAlmacenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
     Open;
  end;
end;

procedure TDMAlmacenes.GenerarMaestroProductos(empresa, ejercicio, canal: integer; almacen: string);
var
  f : TextFile;
  sReg : string;
  i : integer;
  Q : THYFIBQuery;
begin
  i := 0;

  //sfg.albert
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CARPETA_EXPORTACION FROM ART_ALMACENES WHERE EMPRESA = ?EMPRESA AND ALMACEN = ?ALMACEN';
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['ALMACEN'].AsString := almacen;
        ExecQuery;
     end;

     AssignFile(f, Q.FieldByName['CARPETA_EXPORTACION'].AsString + 'PRO04' + FormatDateTime('yyyymmddhhnnss', Now) + '.txt');
     Rewrite(f);

     {Para refrescar cualquier cambio hecho y que se refleje en la tabla, pues se rellena por triggers}
     with xStockEliminadoAlmacen do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['ALMACEN'].AsString := almacen;
        Open;
     end;
     while not xStockEliminadoAlmacen.EOF do
     begin
        { Crear Cabecera }
        sReg := '';
        sReg := sReg + Ajusta('B', 'D', 1, ' ');                                                      // Operacion
        sReg := sReg + Ajusta(xStockEliminadoAlmacenARTICULO.AsString, 'D', 50, ' ');                 // PRODUCT_CODE - Articulo
        sReg := sReg + Ajusta(' ', 'D', 50, ' ');                                                     // NEW_PRODUCT_CODE
        sReg := sReg + Ajusta(' ', 'D', 50, ' ');                                                     // EAN_CODE
        sReg := sReg + Ajusta(' ', 'D', 12, ' ');                                                     // PRODUCT_TYPE_CODE
        sReg := sReg + Ajusta('0', 'D', 1, ' ');                                                      // CHANGE_MATERIAL_ABC
        sReg := sReg + Ajusta('A', 'D', 2, ' ');                                                      // MATERIAL_ABC_CODE
        sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // AVG_COST_PACK_TYPE
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_AVG_COST_PACK_TYPE
        sReg := sReg + Ajusta(' ', 'D', 12, ' ');                                                     // SUPPLIER_CODE
        sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // DATE_CONTROL
        sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // SERIAL_NO_CONTROL
        sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // LOT_CONTROL
        sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // MIXED_LOTS
        sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // CATCH_WEIGHT
        sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // RANDOM_WEIGHT
        sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // MOVEMENT_PACKTYPE
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_MOVEMENT_PACKTYPE
        sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // ORDER_PACKZISE
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_ORDER_PACKZISE
        sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // SHIPPING_PACKTYPE
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_SHIPPING_PACKTYPE
        sReg := sReg + Ajusta(' ', 'D', 255, ' ');                                                    // PROD_DESC
        sReg := sReg + Ajusta(' ', 'D', 255, ' ');                                                    // PROD_ALTDESC
        sReg := sReg + Ajusta(' ', 'D', 50, ' ');                                                     // PROD_SHORTDESC
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // SHELF_LIFE
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 19, '0');                             // AVG_COST
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // RECEIVE_LIFE
        sReg := sReg + Ajusta('0', 'I', 10, '0');                                                     // CONTAINER_STACK
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // PICK_WARN_MESSAGE
        sReg := sReg + Ajusta('0', 'D', 1, '0');                                                      // VERIFY_METRICS
        sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // UOM_BASE_CODE
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_UOM_BASE_CODE
        sReg := sReg + Ajusta('0', 'D', 1, '0');                                                      // ALLOW_SPLIT
        sReg := sReg + Ajusta('0', 'D', 1, '0');                                                      // ALLOW_COMMINGLE
        sReg := sReg + Ajusta(' ', 'D', 12, ' ');                                                     // HAZARD_CODE
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 100)), 'I', 5, '0');                                // OVERCASE_PERCENT
        {Solo se rellenan los que contienen algo. Si no se utilizan no se pone ni siquiera los corchetes.
         sReg := sReg + '[]';                                                                        // ATTRIBUTE1
         sReg := sReg + '[]';                                                                        // ATTRIBUTE2
         sReg := sReg + '[]';                                                                        // ATTRIBUTE3
         sReg := sReg + '[]';                                                                        // ATTRIBUTE4
         sReg := sReg + '[]';                                                                        // ATTRIBUTE5
         sReg := sReg + '[]';                                                                        // ATTRIBUTE6
         sReg := sReg + '[]';                                                                        // ATTRIBUTE7
         sReg := sReg + '[]';                                                                        // ATTRIBUTE8
         sReg := sReg + '[]';                                                                        // ATTRIBUTE9
         sReg := sReg + '[]';                                                                        // ATTRIBUTE10
         sReg := sReg + '[]';                                                                        // ATTRIBUTE11
         sReg := sReg + '[]';                                                                        // ATTRIBUTE12
         sReg := sReg + '[]';                                                                        // ATTRIBUTE13
         sReg := sReg + '[]';                                                                        // ATTRIBUTE14
         sReg := sReg + '[]';                                                                        // ATTRIBUTE15
         sReg := sReg + '[]';                                                                        // ATTRIBUTE16
         sReg := sReg + '[]';                                                                        // ATTRIBUTE17
         sReg := sReg + '[]';                                                                        // ATTRIBUTE18
         sReg := sReg + '[]';                                                                        // ATTRIBUTE19
         sReg := sReg + '[]';                                                                        // ATTRIBUTE20
   }
        sReg := sReg + Ajusta(IntToStr(1), 'I', 10, '0');                                             // NUMERO DE LINEAS
        WriteLn(f, sReg);

        {Crear presentaciones}
        sReg := '';
        sReg := sReg + Ajusta('/', 'D', 1, ' ');                                                      // INICIO DE LINEA
        sReg := sReg + Ajusta('B', 'D', 1, ' ');                                                      // Operacion
        sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // UOM_CODE
        sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // UOM_DESC
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // QUANTITY
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // PACK_WEIGHT
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // LENGTH
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // WIDTH
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // HEIGHT
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // PREP_TIME
        sReg := sReg + Ajusta(' ', 'D', 10, ' ');                                                     // CONTAINER_CODE
        sReg := sReg + Ajusta(' ', 'D', 60, ' ');                                                     // DESC_CONTAINER_CODE
        sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // QUANTITY_CONTTYPE
        sReg := sReg + Ajusta(IntToStr(0), 'I', 5, '0');                                              // TIE
        sReg := sReg + Ajusta(IntToStr(0), 'I', 5, '0');                                              // HEIGHT
        sReg := sReg + Ajusta(IntToStr(0), 'I', 3, '0');                                              // PICK_NEG_PERCENT
        sReg := sReg + Ajusta(IntToStr(0), 'I', 3, '0');                                              // PICK_COMP_PERCENT
        sReg := sReg + Ajusta(IntToStr(0), 'I', 3, '0');                                              // COMPLETE_PERCENT
        WriteLn(f, sReg);

        xStockEliminadoAlmacen.Next;
     end;
     xStockEliminadoAlmacen.Close;

     {Para refrescar cualquier cambio hecho y que se refleje en campos calculados en trigger (ESTADO)}
     with QMArticulosAlmacenes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['ALMACEN'].AsString := almacen;
        Open;
     end;

     {De aqui saco algunos datos para la exportación}
     QMArticulos.Open;

     while not QMArticulosAlmacenes.EOF do
     begin
        if ((QMArticulosAlmacenesESTADO.AsString = 'A') or (QMArticulosAlmacenesESTADO.AsString = 'M')) then
        begin
           { Crear Cabecera }
           sReg := '';
           sReg := sReg + Ajusta(QMArticulosAlmacenesESTADO.AsString, 'D', 1, ' ');                      // OPERACION
           sReg := sReg + Ajusta(QMArticulosAlmacenesArticulo.AsString, 'D', 50, ' ');                   // PRODUCT_CODE - Articulo
           sReg := sReg + Ajusta(' ', 'D', 50, ' ');                                                     // NEW_PRODUCT_CODE
           sReg := sReg + Ajusta(' ', 'D', 50, ' ');                                                     // EAN_CODE
           sReg := sReg + Ajusta('PROD', 'D', 12, ' ');                                                  // PRODUCT_TYPE_CODE
           sReg := sReg + Ajusta('0', 'D', 1, ' ');                                                      // CHANGE_MATERIAL_ABC
           sReg := sReg + Ajusta('A', 'D', 2, ' ');                                                      // MATERIAL_ABC_CODE
           sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // AVG_COST_PACK_TYPE
           sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_AVG_COST_PACK_TYPE
           sReg := sReg + Ajusta(' ', 'D', 12, ' ');                                                     // SUPPLIER_CODE
           sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // DATE_CONTROL
           sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // SERIAL_NO_CONTROL
           sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // LOT_CONTROL
           sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // MIXED_LOTS
           sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // CATCH_WEIGHT
           sReg := sReg + Ajusta(' ', 'D', 1, ' ');                                                      // RANDOM_WEIGHT
           sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // MOVEMENT_PACKTYPE
           sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_MOVEMENT_PACKTYPE
           sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // ORDER_PACKZISE
           sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_ORDER_PACKZISE
           sReg := sReg + Ajusta(' ', 'D', 4, ' ');                                                      // SHIPPING_PACKTYPE
           sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // DESC_SHIPPING_PACKTYPE
           sReg := sReg + Ajusta(QMArticulosAlmacenesTITULO.AsString, 'D', 255, ' ');                    // PROD_DESC
           sReg := sReg + Ajusta(' ', 'D', 255, ' ');                                                    // PROD_ALTDESC
           sReg := sReg + Ajusta(' ', 'D', 50, ' ');                                                     // PROD_SHORTDESC
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // SHELF_LIFE
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 19, '0');                             // AVG_COST
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // RECEIVE_LIFE
           sReg := sReg + Ajusta('0', 'I', 10, '0');                                                     // CONTAINER_STACK
           sReg := sReg + Ajusta(' ', 'D', 30, ' ');                                                     // PICK_WARN_MESSAGE
           sReg := sReg + Ajusta('0', 'D', 1, '0');                                                      // VERIFY_METRICS
           if (QMArticulosUNIDADES.AsString = '-') then                                                  // UOM_BASE_CODE
              sReg := sReg + Ajusta('UN', 'D', 4, ' ')
           else
              sReg := sReg + Ajusta(QMArticulosUNIDADES.AsString, 'D', 4, ' ');
           if (QMArticulosUNIDADES.AsString = '-') then                                                  // DESC_UOM_BASE_CODE
              sReg := sReg + Ajusta('UNIT', 'D', 30, ' ')
           else
              sReg := sReg + Ajusta(QMArticulosTITULO_UNIDADES.AsString, 'D', 30, ' ');
           sReg := sReg + Ajusta('0', 'D', 1, '0');                                                      // ALLOW_SPLIT
           sReg := sReg + Ajusta('1', 'D', 1, '0');                                                      // ALLOW_COMMINGLE
           sReg := sReg + Ajusta(' ', 'D', 12, ' ');                                                     // HAZARD_CODE
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 100)), 'I', 5, '0');                                // OVERCASE_PERCENT
           {Solo se rellenan los que contienen algo. Si no se utilizan no se pone ni siquiera los corchetes.
            sReg := sReg + '[]';                                                                        // ATTRIBUTE1
            sReg := sReg + '[]';                                                                        // ATTRIBUTE2
            sReg := sReg + '[]';                                                                        // ATTRIBUTE3
            sReg := sReg + '[]';                                                                        // ATTRIBUTE4
            sReg := sReg + '[]';                                                                        // ATTRIBUTE5
            sReg := sReg + '[]';                                                                        // ATTRIBUTE6
            sReg := sReg + '[]';                                                                        // ATTRIBUTE7
            sReg := sReg + '[]';                                                                        // ATTRIBUTE8
            sReg := sReg + '[]';                                                                        // ATTRIBUTE9
            sReg := sReg + '[]';                                                                        // ATTRIBUTE10
            sReg := sReg + '[]';                                                                        // ATTRIBUTE11
            sReg := sReg + '[]';                                                                        // ATTRIBUTE12
            sReg := sReg + '[]';                                                                        // ATTRIBUTE13
            sReg := sReg + '[]';                                                                        // ATTRIBUTE14
            sReg := sReg + '[]';                                                                        // ATTRIBUTE15
            sReg := sReg + '[]';                                                                        // ATTRIBUTE16
            sReg := sReg + '[]';                                                                        // ATTRIBUTE17
            sReg := sReg + '[]';                                                                        // ATTRIBUTE18
            sReg := sReg + '[]';                                                                        // ATTRIBUTE19
            sReg := sReg + '[]';                                                                        // ATTRIBUTE20
   }
           sReg := sReg + Ajusta(IntToStr(1), 'I', 10, '0');                                             // NUMERO DE LINEAS
           WriteLn(f, sReg);

           {Crear presentaciones}
           sReg := '';
           sReg := sReg + Ajusta('/', 'D', 1, ' ');                                                      // INICIO DE LINEA
           sReg := sReg + Ajusta(QMArticulosAlmacenesESTADO.AsString, 'D', 1, ' ');                      // OPERACION
           if (QMArticulosUNIDADES.AsString = '-') then                                                  // UOM_CODE
              sReg := sReg + Ajusta('UN', 'D', 4, ' ')
           else
              sReg := sReg + Ajusta(QMArticulosUNIDADES.AsString, 'D', 4, ' ');
           if (QMArticulosUNIDADES.AsString = '-') then                                                  // UOM_DESC
              sReg := sReg + Ajusta('UNIT', 'D', 30, ' ')
           else
              sReg := sReg + Ajusta(QMArticulosTITULO_UNIDADES.AsString, 'D', 30, ' ');
           sReg := sReg + Ajusta(IntToStr(Trunc(1 * 10000)), 'I', 12, '0');                             // QUANTITY
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // PACK_WEIGHT
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // LENGTH
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // WIDTH
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // HEIGHT
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // PREP_TIME
           sReg := sReg + Ajusta(' ', 'D', 10, ' ');                                                     // CONTAINER_CODE
           sReg := sReg + Ajusta(' ', 'D', 60, ' ');                                                     // DESC_CONTAINER_CODE
           sReg := sReg + Ajusta(IntToStr(Trunc(0 * 10000)), 'I', 12, '0');                             // QUANTITY_CONTTYPE
           sReg := sReg + Ajusta(IntToStr(0), 'I', 5, '0');                                              // TIE
           sReg := sReg + Ajusta(IntToStr(0), 'I', 5, '0');                                              // HEIGHT
           sReg := sReg + Ajusta(IntToStr(0), 'I', 3, '0');                                              // PICK_NEG_PERCENT
           sReg := sReg + Ajusta(IntToStr(0), 'I', 3, '0');                                              // PICK_COMP_PERCENT
           sReg := sReg + Ajusta(IntToStr(0), 'I', 3, '0');                                              // COMPLETE_PERCENT
           WriteLn(f, sReg);
        end;
        QMArticulosAlmacenes.Next;

        Inc(i);
        if (i = 10) then
        begin
           Application.ProcessMessages;
           i := 0;
        end;
     end;

     QMArticulos.Close;
     Q.FreeHandle;
  finally
     FreeAndNil(Q);
  end;

  CloseFile(f);
end;

procedure TDMAlmacenes.LeeEntradas(empresa: integer; almacen: string);
var
  Registro : string;
  Datos : TextFile;
  LineaDetalle, LineaSubDetalle, NUM_LINEAS, NUM_DETALLES, CaracteresIgnorar : integer;
  sr : TSearchRec;
  PrimeraLinea : boolean;
  Fecha : TDateTime;
  Q : THYFIBQuery;
begin
  {Utilizo DMMovManStock para no tener que crear datasets y toda su logica}
  {Una entrada es un traspaso desde el almacen_origen al almacen actual}

  AbreData(TDMMovManStock, DMMovManStock);

  //sfg.albert
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM ART_ALMACENES WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN';
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['ALMACEN'].AsString := almacen;
        ExecQuery;
     end;

     if FindFirst(Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'CRP01*.txt', 0, sr) = 0 then
     begin
        repeat
           PrimeraLinea := True;
           AssignFile(Datos, Q.FieldByName['CARPETA_IMPORTACION'].AsString + Sr.Name);
           Reset(Datos);
           CaracteresIgnorar := 0;
           try
              while not EOF(Datos) do
              begin
                 ReadLn(Datos, Registro);
                 {En la primera linea debo ver si es un archivo UTF y ver cuantos caracteres debo ignorar}
                 if (PrimeraLinea) then
                 begin
                    if (Ord(Registro[1]) = $EF) and (Ord(Registro[2]) = $BB) and (Ord(Registro[3]) = $BF) then {Posiblemente UTF8}
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $FE) and (Ord(Registro[2]) = $FF) then {Posiblemente UTF16-BE}
                       CaracteresIgnorar := 2;
                    if (Ord(Registro[1]) = $FF) and (Ord(Registro[2]) = $FE) then {Posiblemente UTF-16 (LE)}
                       CaracteresIgnorar := 2;
                    if (Ord(Registro[1]) = $FF) and (Ord(Registro[2]) = $FE) and (Ord(Registro[3]) = $00) and (Ord(Registro[4]) = $00) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $00) and (Ord(Registro[2]) = $00) and (Ord(Registro[3]) = $FE) and (Ord(Registro[4]) = $FF) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $2B) and (Ord(Registro[2]) = $2F) and (Ord(Registro[3]) = $76) and
                       ((Ord(Registro[4]) = $38) or (Ord(Registro[4]) = $39) or (Ord(Registro[4]) = $2B) or (Ord(Registro[4]) = $2F)) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $F7) and (Ord(Registro[2]) = $64) and (Ord(Registro[3]) = $4C) then
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $DD) and (Ord(Registro[2]) = $73) and (Ord(Registro[3]) = $66) and (Ord(Registro[4]) = $73) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $0E) and (Ord(Registro[2]) = $FE) and (Ord(Registro[3]) = $FF) then
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $FB) and (Ord(Registro[2]) = $EE) and (Ord(Registro[3]) = $28) then
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $84) and (Ord(Registro[2]) = $31) and (Ord(Registro[3]) = $95) and (Ord(Registro[4]) = $33) then
                       CaracteresIgnorar := 4;
                    PrimeraLinea := False;
                 end
                 else
                    CaracteresIgnorar := 0;
                 if registro <> '' then
                 begin
                    { LEYENDO CABECERA }
                    {RECEPTION_CODE   := copy(Registro,1+CaracteresIgnorar,30 );
                     REC_ORDER_CODE   := copy(Registro,31+CaracteresIgnorar,30 );
                     ESTADO           := copy(Registro,61+CaracteresIgnorar,30);
                     FECHA            := copy(Registro,91+CaracteresIgnorar, 14);
                     NUM_CONTENEDORES := copy(Registro+CaracteresIgnorar,105, 10);}
                    NUM_LINEAS := StrToInt(Copy(Registro, 115 + CaracteresIgnorar, 10));

                    {Creo la cabecera del movimiento}
                    with DMMovManStock do
                    begin
                       Fecha := EncodeDateTime({AYear} StrToInt(Copy(Registro, 91 + CaracteresIgnorar, 4)),
                          {AMonth} StrToInt(Copy(Registro, 95 + CaracteresIgnorar, 2)),
                          {ADay}   StrToInt(Copy(Registro, 97 + CaracteresIgnorar, 2)),
                          {AHour}  StrToInt(Copy(Registro, 99 + CaracteresIgnorar, 2)),
                          {AMinute}StrToInt(Copy(Registro, 101 + CaracteresIgnorar, 2)),
                          {ASecond}StrToInt(Copy(Registro, 103 + CaracteresIgnorar, 2)),
                          {AMilliSecond} 0);
                       QMCabecera.Insert;
                       QMCabeceraTIPO_OPERACION.AsString := 'T';
                       QMCabeceraFECHA.AsDateTime := Fecha;
                       QMCabeceraALMACEN_ORI.AsString := Q.FieldByName['ALMACEN_ORIGEN'].AsString;
                       QMCabeceraALMACEN_DST.AsString := almacen;
                       QMCabeceraCANAL_ORI.AsInteger := REntorno.Canal;
                       QMCabeceraCANAL_DST.AsInteger := REntorno.Canal;
                       QMCabeceraSERIE.AsString := Q.FieldByName['SERIE_MOVIMIENTOS'].AsString;
                       QMCabeceraCOMENTARIO.AsString := Copy('ALM. INT. (' +
                          Trim(Copy(Registro, 1 + CaracteresIgnorar, 30)) + '-' +
                          Trim(Copy(Registro, 31 + CaracteresIgnorar, 30)) + ')', 1, 40);
                       QMCabecera.Post;
                    end;

                    { LEYENDO DETALLE }
                    LineaDetalle := 1;
                    while LineaDetalle <= NUM_LINEAS do
                    begin
                       ReadLn(Datos, Registro);
                       {PRDUCT_CODE   := copy(Registro,1,50 );
                        QUANTITY      := copy(Registro,51,12 );
                        UOM_CODE      := copy(Registro,63,4);
                        LOTE          := copy(Registro,67,50);
                        EXP_DATE      := copy(Registro,117,14);
                        SERIAL        := copy(Registro,131,50);
                        CANT_RECIBIDA := copy(Registro,181,12);}
                       NUM_DETALLES := StrToInt(Copy(Registro, 193, 10));

                       {Creo el detalle del movimiento}
                       with DMMovManStock do
                       begin
                          QMDetalle.Insert;
                          QMDetalleARTICULO.AsString := Trim(Copy(Registro, 1, 50));
                          //QMDetalleUNIDADES.AsInteger := StrToIntDef(copy(Registro,181,12),0); SFG_XGM Solo los 8 primeros, el resto son decimales
                          //QMDetalleUNIDADES.AsInteger := StrToIntDef(copy(Registro,181,8),0);
                          QMDetalleUNIDADES.AsFloat := StrToIntDef(Copy(Registro, 181, 8), 0) + StrToIntDef(Copy(Registro, 189, 4), 0) / 10000;
                          QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);
                          QMDetalle.Post;
                       end;

                       { LEYENDO SUB-DETALLE }
                       LineaSubDetalle := 1;
                       while LineaSubDetalle <= NUM_DETALLES do
                       begin
                          ReadLn(Datos, Registro);
                          {PRDUCT_CODE   := copy(Registro,1,50 );
                           QUANTITY      := copy(Registro,51,12 );
                           UOM_CODE      := copy(Registro,63,12);
                           UOM_CODE      := copy(Registro,75,14);}
                          LineaSubDetalle := LineaSubDetalle + 1;
                       end;
                       LineaDetalle := LineaDetalle + 1;
                    end;
                 end;
              end;
           finally
              CloseFile(Datos);
           end;

           {Muevo el archivo importado a la carpeta Archivo}
           {Verifico que exista la carpeta}
           if (not DirectoryExists(Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'Archivo')) then
              CreateDir(Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'Archivo');
           {Muevo el archivo}
           CopyFileTo(Q.FieldByName['CARPETA_IMPORTACION'].AsString + Sr.Name, Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'Archivo\' + Sr.Name);
           DeleteFile(Q.FieldByName['CARPETA_IMPORTACION'].AsString + Sr.Name);
        until FindNext(sr) <> 0;
        FindClose(sr);
     end;
     Q.FreeHandle;
  finally
     FreeAndNil(Q);
  end;
  CierraData(DMMovManStock);
end;

procedure TDMAlmacenes.LeeSalidas(empresa: integer; almacen: string);
var
  Registro : string;
  Datos : TextFile;
  LineaDetalle, LineaSubDetalle, NUM_LINEAS, NUM_DETALLES, CaracteresIgnorar : integer;
  sr : TSearchRec;
  PrimeraLinea : boolean;
  Fecha : TDateTime;
  Q : THYFIBQuery;
begin
  {Utilizo DMMovManStock para no tener que crear datasets y toda su logica}
  {Una salida es un traspaso desde el almacen actual al almacen_destino}

  AbreData(TDMMovManStock, DMMovManStock);
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM ART_ALMACENES WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN';
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['ALMACEN'].AsString := almacen;
        ExecQuery;
     end;

     if FindFirst(Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'CSO04*.txt', 0, sr) = 0 then
     begin
        repeat
           PrimeraLinea := True;
           AssignFile(Datos, Q.FieldByName['CARPETA_IMPORTACION'].AsString + Sr.Name);
           Reset(Datos);
           CaracteresIgnorar := 0;
           try
              while not EOF(Datos) do
              begin
                 ReadLn(Datos, Registro);
                 {En la primera linea debo ver si es un archivo UTF y ver cuantos caracteres debo ignorar}
                 if (PrimeraLinea) then
                 begin
                    if (Ord(Registro[1]) = $EF) and (Ord(Registro[2]) = $BB) and (Ord(Registro[3]) = $BF) then {Posiblemente UTF8}
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $FE) and (Ord(Registro[2]) = $FF) then {Posiblemente UTF16-BE}
                       CaracteresIgnorar := 2;
                    if (Ord(Registro[1]) = $FF) and (Ord(Registro[2]) = $FE) then {Posiblemente UTF-16 (LE)}
                       CaracteresIgnorar := 2;
                    if (Ord(Registro[1]) = $FF) and (Ord(Registro[2]) = $FE) and (Ord(Registro[3]) = $00) and (Ord(Registro[4]) = $00) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $00) and (Ord(Registro[2]) = $00) and (Ord(Registro[3]) = $FE) and (Ord(Registro[4]) = $FF) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $2B) and (Ord(Registro[2]) = $2F) and (Ord(Registro[3]) = $76) and
                       ((Ord(Registro[4]) = $38) or (Ord(Registro[4]) = $39) or (Ord(Registro[4]) = $2B) or (Ord(Registro[4]) = $2F)) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $F7) and (Ord(Registro[2]) = $64) and (Ord(Registro[3]) = $4C) then
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $DD) and (Ord(Registro[2]) = $73) and (Ord(Registro[3]) = $66) and (Ord(Registro[4]) = $73) then
                       CaracteresIgnorar := 4;
                    if (Ord(Registro[1]) = $0E) and (Ord(Registro[2]) = $FE) and (Ord(Registro[3]) = $FF) then
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $FB) and (Ord(Registro[2]) = $EE) and (Ord(Registro[3]) = $28) then
                       CaracteresIgnorar := 3;
                    if (Ord(Registro[1]) = $84) and (Ord(Registro[2]) = $31) and (Ord(Registro[3]) = $95) and (Ord(Registro[4]) = $33) then
                       CaracteresIgnorar := 4;
                    PrimeraLinea := False;
                 end
                 else
                    CaracteresIgnorar := 0;

                 if registro <> '' then
                 begin
                    { LEYENDO CABECERA }
                    {SORDER_CODE     := copy(Registro,1 + CaracteresIgnorar,50 );
                     ESTADO           := copy(Registro,51 + CaracteresIgnorar,30);
                     FECHA            := copy(Registro,81 + CaracteresIgnorar,14);
                     NUM_CONTENEDORES := copy(Registro,95 + CaracteresIgnorar,10);}
                    NUM_LINEAS := StrToInt(Copy(Registro, 105 + CaracteresIgnorar, 10));

                    {Creo la cabecera del movimiento}
                    with DMMovManStock do
                    begin
                       Fecha := EncodeDateTime({AYear} StrToInt(Copy(Registro, 81 + CaracteresIgnorar, 4)),
                          {AMonth} StrToInt(Copy(Registro, 85 + CaracteresIgnorar, 2)),
                          {ADay}   StrToInt(Copy(Registro, 87 + CaracteresIgnorar, 2)),
                          {AHour}  StrToInt(Copy(Registro, 89 + CaracteresIgnorar, 2)),
                          {AMinute}StrToInt(Copy(Registro, 91 + CaracteresIgnorar, 2)),
                          {ASecond}StrToInt(Copy(Registro, 93 + CaracteresIgnorar, 2)),
                          {AMilliSecond} 0);
                       QMCabecera.Insert;
                       QMCabeceraTIPO_OPERACION.AsString := 'T';
                       QMCabeceraFECHA.AsDateTime := Fecha;
                       QMCabeceraALMACEN_ORI.AsString := almacen;
                       QMCabeceraALMACEN_DST.AsString := Q.FieldByName['ALMACEN_DESTINO'].AsString;
                       QMCabeceraCANAL_ORI.AsInteger := REntorno.Canal;
                       QMCabeceraCANAL_DST.AsInteger := REntorno.Canal;
                       QMCabeceraSERIE.AsString := Q.FieldByName['SERIE_MOVIMIENTOS'].AsString;
                       QMCabeceraCOMENTARIO.AsString := Copy('ALM. INT. (' +
                          Trim(Copy(Registro, 1 + CaracteresIgnorar, 50)) + ')', 1, 40);
                       QMCabecera.Post;
                    end;

                    { LEYENDO DETALLE }
                    LineaDetalle := 1;
                    while (LineaDetalle <= NUM_LINEAS) do
                    begin
                       ReadLn(Datos, Registro);
                       {LINE_NUMBER    := copy(Registro,1,10 );
                        PRODUCT_CODE    := copy(Registro,11,50 );
                        LOT_CODE        := copy(Registro,61,50);
                        QUANTITY        := copy(Registro,111,12);
                        SERIAL_NO       := copy(Registro,123,20);
                        EXPIRATION_DATE := copy(Registro,143,14);
                        UOM_CODE        := copy(Registro,157,4);
                        CANTIDADSERV    := copy(Registro,161,12);
                        PESO            := copy(Registro,173,12);
                        FECHA           := copy(Registro,185,14);}
                       NUM_DETALLES := StrToInt(Copy(Registro, 199, 10));

                       {Creo el detalle del movimiento}
                       with DMMovManStock do
                       begin
                          QMDetalle.Insert;
                          QMDetalleARTICULO.AsString := Trim(Copy(Registro, 11, 50));
                          //QMDetalleUNIDADES.AsInteger := StrToIntDef(copy(Registro,161,12),0); SFG_XGM Solo los 8 primeros, el resto son decimales
                          //QMDetalleUNIDADES.AsInteger := StrToIntDef(copy(Registro,161,8),0);
                          QMDetalleUNIDADES.AsFloat := StrToIntDef(Copy(Registro, 161, 8), 0) + StrToIntDef(Copy(Registro, 169, 4), 0) / 10000;
                          QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);
                          QMDetalle.Post;
                       end;

                       { LEYENDO SUB-DETALLE }
                       LineaSubDetalle := 1;
                       while (LineaSubDetalle <= NUM_DETALLES) do
                       begin
                          ReadLn(Datos, Registro);
                          {NUM_CONT_CLIENTE := copy(Registro,1,50 );
                           NUM_CONT_ORIGEN   := copy(Registro,51,50 );
                           CANT_EXTRAIDA     := copy(Registro,101,12);
                           PESO_EXTRAIDO     := copy(Registro,113,12);
                           FECHA             := copy(Registro,125,14 );
                           LOT_CODE          := copy(Registro,139,50);
                           SERIAL_NO         := copy(Registro,189,50);
                           EXPIRATION_DATE   := copy(Registro,239,14);}
                          LineaSubDetalle := LineaSubDetalle + 1;
                       end;
                       LineaDetalle := LineaDetalle + 1;
                    end;
                 end
                 else
                    ReadLn(Datos, Registro);
              end;
           finally
              CloseFile(Datos);
           end;

           {Muevo el archivo importado a la carpeta Archivo}
           {Verifico que exista la carpeta}
           if (not DirectoryExists(Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'Archivo')) then
              CreateDir(Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'Archivo');
           {Muevo el archivo}
           CopyFileTo(Q.FieldByName['CARPETA_IMPORTACION'].AsString + Sr.Name, Q.FieldByName['CARPETA_IMPORTACION'].AsString + 'Archivo\' + Sr.Name);
           DeleteFile(Q.FieldByName['CARPETA_IMPORTACION'].AsString + Sr.Name);
        until FindNext(sr) <> 0;
        FindClose(sr);
     end;
     Q.FreeHandle;
  finally
     FreeAndNil(Q);
  end;
  CierraData(DMMovManStock);
end;

procedure TDMAlmacenes.BorrarMarcasMaestroProductos(empresa, ejercicio, canal: integer; almacen: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_ARTICULOS_ALMACENES_ART SET ESTADO=''X'' WHERE ' +
           'EMPRESA=?EMPRESA AND CANAL=?CANAL AND ALMACEN=?ALMACEN AND (ESTADO=''A'' OR ESTADO=''M'')';
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['ALMACEN'].AsString := almacen;
        ExecQuery;
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
        SQL.Text := 'DELETE FROM ART_ARTICULOS_ALMACENES_ART_BOR WHERE ' +
           'EMPRESA=?EMPRESA AND CANAL=?CANAL AND ALMACEN=?ALMACEN ';
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['ALMACEN'].AsString := almacen;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAlmacenes.QMAlmacenesBeforePost(DataSet: TDataSet);
begin
  QMAlmacenesCARPETA_IMPORTACION.AsString := IncludeTrailingPathDelimiter(QMAlmacenesCARPETA_IMPORTACION.AsString);
  QMAlmacenesCARPETA_EXPORTACION.AsString := IncludeTrailingPathDelimiter(QMAlmacenesCARPETA_EXPORTACION.AsString);
end;

procedure TDMAlmacenes.CerrarFicha;
begin
  xTipoAlmacen.Close;
  xTerceros.Close;
  xDirecciones.Close;
end;

procedure TDMAlmacenes.CerrarArticulos;
begin
  QMArticulosAlmacenes.Close;
  xStockEliminadoAlmacen.Close;
end;

procedure TDMAlmacenes.CerrarMovimientos;
begin
  xMovStockAlmacen.Close;
end;

procedure TDMAlmacenes.AbreUbicaciones;
begin
  xUbicaciones.Open;
end;

procedure TDMAlmacenes.CerrarUbicaciones;
begin
  xUbicaciones.Close;
end;

procedure TDMAlmacenes.AbreFicha;
begin
  xTipoAlmacen.Open;
  xTerceros.Open;
  xDirecciones.Open;
end;

procedure TDMAlmacenes.AbreArticulos;
begin
  with QMArticulosAlmacenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
     Open;
  end;

  with xStockEliminadoAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
     Open;
  end;
end;

procedure TDMAlmacenes.PosicionaUbicacion(IdUbicacion: integer);
begin
  if (IdUbicacion <> 0) then
  begin
     Buscando := True;
     Posicionar(xUbicaciones, 'ID_UBICACION', IdUbicacion);
     Buscando := False;

     xUbicacionesAfterScroll(xUbicaciones);
  end;
end;

procedure TDMAlmacenes.PosicionaArticuloUbicacion(Articulo: string);
begin
  if (Trim(Articulo) <> '') then
  begin
     Buscando := True;
     Posicionar(xArticulos, 'ARTICULO', Articulo);
     Buscando := False;

     xArticulosAfterScroll(xArticulos);
  end;
end;

procedure TDMAlmacenes.xUbicacionesAfterScroll(DataSet: TDataSet);
begin
  if (not Buscando) then
  begin
     with xArticulos do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM LST_STOCK_POR_UBICACION(?ENTRADA,?EMPRESA,?CANAL,?UBICACION_DESDE,?UBICACION_HASTA,?ARTICULO_DESDE,?ARTICULO_HASTA)');
        if (FSoloElementosConStock) then
           SelectSQL.Add('WHERE EXISTENCIAS <> 0');
        SelectSQL.Add('ORDER BY COMPOSICION');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := xUbicacionesEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['UBICACION_DESDE'].AsString := xUbicacionesCOMPOSICION.AsString;
        Params.ByName['UBICACION_HASTA'].AsString := xUbicacionesCOMPOSICION.AsString;
        Params.ByName['ARTICULO_DESDE'].AsString := '.';
        Params.ByName['ARTICULO_HASTA'].AsString := '¿?';
        Open;
     end;
  end;
end;

procedure TDMAlmacenes.xArticulosAfterScroll(DataSet: TDataSet);
var
  ID_A, ID_A_UBICACION : integer;
begin
  if (not Buscando) then
  begin
     ID_A := DameIDArticulo(xArticulosARTICULO.AsString);
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID_A_UBICACION FROM ART_ARTICULOS_UBICACIONES WHERE ID_A=?ID_A AND ID_UBICACION=?ID_UBICACION';
           Params.ByName['ID_A'].AsInteger := ID_A;
           Params.ByName['ID_UBICACION'].AsInteger := xUbicacionesID_UBICACION.AsInteger;
           ExecQuery;
           ID_A_UBICACION := FieldByName['ID_A_UBICACION'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with xArticuloLote do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM A_ART_STOCK_LOTE(?EMPRESA,?ARTICULO,?CANAL,?ALMACEN,?ID_A_UBICACION)');
        if (FSoloElementosConStock) then
           SelectSQL.Add('WHERE STOCK <> 0');
        SelectSQL.Add('ORDER BY LOTE');
        Params.ByName['EMPRESA'].AsInteger := xUbicacionesEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := xUbicacionesALMACEN.AsString;
        Params.ByName['ID_A_UBICACION'].AsInteger := ID_A_UBICACION;
        Open;
     end;
  end;
end;

procedure TDMAlmacenes.SetSoloElementosConStock(const Value: boolean);
var
  Articulo : string;
begin
  FSoloElementosConStock := Value;
  Articulo := xArticulosARTICULO.AsString;
  {Reabre las tablas de stock de ubicacion y lote}
  xUbicacionesAfterScroll(xUbicaciones);
  PosicionaArticuloUbicacion(Articulo);
end;

procedure TDMAlmacenes.AcumulaStocks(articulod, articuloh, familiad, familiah: string; canal: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ACUMULA_STOCKS(:EMPRESA, :ALMACEN, :CANAL, :ARTICULOD, :ARTICULOH, :FAMILIAD, :FAMILIAH, :ENTRADA);';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['ARTICULOD'].AsString := articulod;
        Params.ByName['ARTICULOH'].AsString := articuloh;
        Params.ByName['FAMILIAD'].AsString := familiad;
        Params.ByName['FAMILIAH'].AsString := familiah;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xStocks do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAlmacenes.AbreStocks;
begin
  with xStocks do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMAlmacenes.CerrarStock;
begin
  xStocks.Close;
end;

procedure TDMAlmacenes.MostrarListado(Modo: smallint);
begin
  AbreData(TDMListados, DMListados);

  try
     with xStocks do
     begin
        // Para que no se mueva el grid mientras genera el listado
        DisableControls;
        Close;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
     end;

     DMListados.Imprimir(5126, 0, Modo, '', '', frAlmStocks, frxAlmStocks, nil, nil);
  finally
     xStocks.EnableControls;
  end;

  CierraData(DMListados);
end;

procedure TDMAlmacenes.QMAlmacenesAfterScroll(DataSet: TDataSet);
begin
  // Si la tabla de articulos por almacen esta abierta, la refresco.
  if (QMArticulosAlmacenes.Active) then
     AbreArticulos;
end;

procedure TDMAlmacenes.RecalcularPrecios(Automatico: boolean = False; Log: TStrings = nil);
var
  Articulo : string;
  Registro, Registros : integer;
begin
  try
     if not Automatico then
        FSendCorreo := TFSendCorreo.Create(Self);

     try
        FSendCorreo.Titulo(_('Recalculando precios'));
        FSendCorreo.Show;
        FSendCorreo.Texto(_('Calculando cantidad de registro a procesar'));
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT COUNT(DISTINCT ARTICULO) FROM ART_MOV_STOCKS_PRECIO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' ALMACEN = :ALMACEN AND ');
              SQL.Add(' INVALIDO = 1 ');
              Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAlmacenesCANAL.AsInteger;
              Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
              ExecQuery;
              Registros := FieldByName['COUNT'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        FSendCorreo.Texto(Format(_('Registros a procesar: %d'), [Registros]));
        Registro := 0;
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT DISTINCT ARTICULO FROM ART_MOV_STOCKS_PRECIO ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
                 SelectSQL.Add(' CANAL = :CANAL AND ');
                 SelectSQL.Add(' ALMACEN = :ALMACEN AND ');
                 SelectSQL.Add(' INVALIDO = 1 ');
                 Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMAlmacenesCANAL.AsInteger;
                 Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
                 Open;
                 while not EOF do
                 begin
                    Articulo := FieldByName('ARTICULO').AsString;
                    Inc(Registro);
                    FSendCorreo.Texto(Format(_('Recalculando precios.' + #13#10 + 'Registro %d de %d - Articulo: %s'), [Registro, Registros, Articulo]));

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'EXECUTE PROCEDURE A_ART_DAME_STOCK2(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, ''01/01/3000'')';
                          Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
                          Params.ByName['CANAL'].AsInteger := QMAlmacenesCANAL.AsInteger;
                          Params.ByName['ALMACEN'].AsString := QMAlmacenesALMACEN.AsString;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
        FSendCorreo.Texto(_('Proceso finalizado'));
        if not Automatico then
           FSendCorreo.BitBtnOk.Visible := True;
     finally
        if not Automatico then
           FreeAndNil(FSendCorreo);
     end;
  except
     on E: Exception do
     begin
        if Automatico then
           Log.Add(_('ERROR') + #13#10 + E.Message);
     end;
  end;
end;

procedure TDMAlmacenes.PonderaArticulos(Automatico: boolean = False);
var
  Id_a : integer;
  Articulo : string;
  Registro, Registros, Errores : integer;
  Log : TStrings;
begin
  Log := TStringList.Create;
  try
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        Log.Add(DateTimeToStr(Now) + ' - ' + _('Inicio Ponderado de Precios de Coste'));
        FSendCorreo.Titulo(_('Ponderando Precios de Coste'));
        FSendCorreo.Show;

        Log.Add(DateTimeToStr(Now) + ' - ' + _('Calculando cantidad de registro a procesar'));
        FSendCorreo.Texto(_('Calculando cantidad de registro a procesar'));
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT COUNT(ARTICULO) FROM ART_ARTICULOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA  ');
              Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
              ExecQuery;
              Registros := FieldByName['COUNT'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Log.Add(Format(_('Registros a procesar: %d'), [Registros]));
        FSendCorreo.Texto(Format(_('Registros a procesar: %d'), [Registros]));
        Registro := 0;
        Errores := 0;
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT ID_A, ARTICULO FROM ART_ARTICULOS ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' EMPRESA = :EMPRESA ');
                 SelectSQL.Add(' ORDER BY ARTICULO ');
                 Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
                 Open;
                 while not EOF do
                 begin
                    Id_A := FieldByName('ID_A').AsInteger;
                    Articulo := FieldByName('ARTICULO').AsString;
                    Inc(Registro);
                    FSendCorreo.Texto(Format(_('Ponderando Precios de Coste') + #13#10 + _('Registro %d de %d - Articulo: %s') + #13#10 + 'Errores %d', [Registro, Registros, Articulo, Errores]));

                    try
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'EXECUTE PROCEDURE A_ART_RECALCULA_PONDERA_DOC (:EMPRESA, :ARTICULO, :ID_A)';
                             Params.ByName['EMPRESA'].AsInteger := QMAlmacenesEMPRESA.AsInteger;
                             Params.ByName['ARTICULO'].AsString := Articulo;
                             Params.ByName['ID_A'].AsInteger := Id_A;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    except
                       on E: Exception do
                       begin
                          Inc(Errores);
                          Log.Add(Format(_('ERROR') + ' ' + _('Ponderando Precios de Coste') + #13#10 + _('Registro %d de %d - Articulo: %s'), [Registro, Registros, Articulo]) + #13#10 + E.Message);
                          FSendCorreo.Texto(Format(_('ERROR') + ' ' + _('Ponderando Precios de Coste') + #13#10 + _('Registro %d de %d - Articulo: %s'), [Registro, Registros, Articulo]) + #13#10 + E.Message);
                       end;
                    end;

                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
        Log.Add(DateTimeToStr(Now) + ' - ' + ('Proceso finalizado'));
        FSendCorreo.Texto(_('Proceso finalizado'));
        if not Automatico then
           FSendCorreo.BitBtnOk.Visible := True;
     finally
        FreeAndNil(FSendCorreo);
     end;
  except
     on E: Exception do
     begin
        if Automatico then
           Log.Add(_('ERROR') + #13#10 + E.Message);
     end;
  end;

  if Automatico then
  begin
     try
        DMMain.EnviaMensajeUsuario(REntorno.Usuario, Log.Text);
     except
     end;
  end;

  Log.Free;
end;

procedure TDMAlmacenes.ActualizarPMP(Automatico: boolean);
var
  {
  Id_a : integer;
  Articulo : string;
  Registro, Registros, Errores : integer;
  }
  Log : TStrings;
begin
  DMMain.EnviaMensajeUsuario(REntorno.Usuario, _('INI ActualizarPMP'));
  Log := TStringList.Create;
  try
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        DMMain.EnviaMensajeUsuario(REntorno.Usuario, _('Actualizado PMP'));
        FSendCorreo.Titulo(_('Actualizado PMP'));
        Log.Add(DateTimeToStr(Now) + ' - ' + _('Inicio Actualizacion de PMP'));
        FSendCorreo.Show;
        // Filtro todos los almacenes de todos los canales
        with QMAlmacenes do
        begin
           Close;
           SelectSQL.Text := 'SELECT * FROM VER_ALMACENES_CUENTAS WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO ORDER BY ALMACEN, CANAL';
           DMMain.FiltraTabla(QMAlmacenes, '11000', True);
           First;
           while not EOF do
           begin
              DMMain.EnviaMensajeUsuario(REntorno.Usuario, format(_('Actualizando PMP almacen %s'), [QMAlmacenesALMACEN.AsString]));
              FSendCorreo.Texto(format(_('Actualizando PMP almacen %s'), [QMAlmacenesALMACEN.AsString]));
              Log.Add(DateTimeToStr(Now) + ' - ' + format(_('Actualizando PMP almacen %s - Canal %d'), [QMAlmacenesALMACEN.AsString, QMAlmacenesCANAL.AsInteger]));

              RecalcularPrecios(Automatico, Log);

              Next;
           end;
           DMMain.EnviaMensajeUsuario(REntorno.Usuario, _('Proceso finalizado'));
           FSendCorreo.Texto(_('Proceso finalizado'));
           Log.Add(DateTimeToStr(Now) + ' - ' + ('Proceso finalizado'));
           if not Automatico then
              FSendCorreo.BitBtnOk.Visible := True;
        end;
     finally
        FreeAndNil(FSendCorreo);
     end;
  except
     on E: Exception do
     begin
        DMMain.EnviaMensajeUsuario(REntorno.Usuario, _('ERROR') + #13#10 + E.Message);
        if Automatico then
           Log.Add(_('ERROR') + #13#10 + E.Message);
     end;
  end;

  if Automatico then
  begin
     try
        DMMain.EnviaMensajeUsuario(REntorno.Usuario, Log.Text);
     except
     end;
  end;

  Log.Free;
  DMMain.EnviaMensajeUsuario(REntorno.Usuario, 'FIN ActualizarPMP');
end;

end.
