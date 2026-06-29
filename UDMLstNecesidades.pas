unit UDMLstNecesidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSetRO, HYFIBQuery;

type
  TDMLstNecesidades = class(TDataModule)
     TLocal: THYTransaction;
     xArticulos: TFIBDataSetRO;
     frNecesidades: TfrHYReport;
     frDBNecesidades: TfrDBDataSet;
     DSxNecesidades: TDataSource;
     xOrdenes: TFIBDataSetRO;
     DSxArt: TDataSource;
     xNecesidades: TFIBDataSetRO;
     xArt: TFIBDataSetRO;
     xArtARTICULO: TFIBStringField;
     xArtTITULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xNecesidadesHIJO: TFIBStringField;
     xNecesidadesCANTIDAD: TFloatField;
     xNecesidadesNIVEL_HIJO: TIntegerField;
     xArticulosSIGNO: TFIBStringField;
     xArticulosTITULO_CORTO: TFIBStringField;
     xArticulosNOTAS: TBlobField;
     xNotas: TFIBDataSetRO;
     xNotasTITULO_CORTO: TFIBStringField;
     xNotasNOTAS: TBlobField;
     DSxNotas: TDataSource;
     frDBxNotas: TfrDBDataSet;
     SPPrecio: THYFIBQuery;
     DSxEscandalloDet: TDataSource;
     frDBxEscandalloDet: TfrDBDataSet;
     xEscandallo: TFIBDataSetRO;
     xEscandalloEMPRESA: TIntegerField;
     xEscandalloARTICULO: TFIBStringField;
     xEscandalloNUMERO: TIntegerField;
     xEscandalloUNIDADES: TFloatField;
     xEscandalloFECHA_DESDE: TDateTimeField;
     xEscandalloFECHA_HASTA: TDateTimeField;
     xEscandalloACTIVO: TIntegerField;
     xEscandalloCOSTE: TFloatField;
     xEscandalloDetHIJO: TFIBStringField;
     xEscandalloDetTITULO: TFIBStringField;
     xEscandalloDetCANTIDAD: TFloatField;
     xEscandalloDetNIVEL_HIJO: TIntegerField;
     xEscandalloDetP_COSTE: TFloatField;
     xEscandalloDetCOSTE: TFloatField;
     xEscandalloDetCOSTE_TOTAL: TFloatField;
     xEscandalloTITULO: TFIBStringField;
     xEscandalloP_COSTE: TFloatField;
     xListOrdenes: TFIBDataSetRO;
     DSxListOrdenes: TDataSource;
     frDBxListOrdenes: TfrDBDataSet;
     xListOrdenesEMPRESA: TIntegerField;
     xListOrdenesEJERCICIO: TIntegerField;
     xListOrdenesCANAL: TIntegerField;
     xListOrdenesNORDEN: TIntegerField;
     xListOrdenesESTADO: TIntegerField;
     xListOrdenesSERIE: TFIBStringField;
     xListOrdenesPEDIDO: TIntegerField;
     xListOrdenesLINEA: TIntegerField;
     xListOrdenesARTICULO: TFIBStringField;
     xListOrdenesUNIDADES: TFloatField;
     xListOrdenesALMACEN: TFIBStringField;
     xListOrdenesESCANDALLO: TIntegerField;
     xListOrdenesPRIORIDAD: TIntegerField;
     xListOrdenesP_MERMA: TFloatField;
     xListOrdenesCANT_ORDENADA: TFloatField;
     xListOrdenesCANT_ESPERADA: TFloatField;
     xListOrdenesCANT_FINAL: TFloatField;
     xListOrdenesFECHA_ENTREGA: TDateTimeField;
     xListOrdenesFECHA_INICIO: TDateTimeField;
     xListOrdenesFECHA_INICIO_PROD: TDateTimeField;
     xListOrdenesMATERIAL: TIntegerField;
     xListOrdenesFECHA_ORDEN: TDateTimeField;
     xListOrdenesTITULO: TFIBStringField;
     QGeneral: THYFIBQuery;
     xEscandalloOrd: TFIBDataSetRO;
     DSxEscandalloOrd: TDataSource;
     frDBxEscandalloOrd: TfrDBDataSet;
     DSxEscandallo: TDataSource;
     frDBxEscandallo: TfrDBDataSet;
     xPedido: TFIBDataSetRO;
     xPedidoTITULO: TFIBStringField;
     xoperario: TFIBDataSetRO;
     DSxOrd: TDataSource;
     xListOperario: TFIBDataSetRO;
     xListOrdenesTERCERO_OPERARIO: TIntegerField;
     xListOperarioTERCERO: TIntegerField;
     xListOperarioNOMBRE_R_SOCIAL: TFIBStringField;
     xListOperarioNOMBRE_COMERCIAL: TFIBStringField;
     xListOperarioTIPO_RAZON: TFIBStringField;
     xListOperarioNIF: TFIBStringField;
     xListOperarioFECHA_ALTA: TDateTimeField;
     xListOperarioNOTAS: TBlobField;
     xListOperarioTELEFONO01: TFIBStringField;
     xListOperarioTELEFONO02: TFIBStringField;
     xListOperarioTELEFAX: TFIBStringField;
     xListOperarioEMAIL: TFIBStringField;
     xListOperarioWEB: TFIBStringField;
     xProcesos: TFIBDataSetRO;
     DSxProcesos: TDataSource;
     frDBxProcesos: TfrDBDataSet;
     xOperarioProceso: TFIBDataSetRO;
     xArticuloKri: TFIBDataSetRO;
     DSxArticuloKri: TDataSource;
     xListOrdenesNOTAS: TBlobField;
     frDBOrdenProdKri: TfrDBDataSet;
     xEscandalloDetALFA_1: TFIBStringField;
     xEscandalloDetALFA_2: TFIBStringField;
     xEscandalloDetALFA_3: TFIBStringField;
     xEscandalloDetALFA_4: TFIBStringField;
     xEscandalloDetALFA_5: TFIBStringField;
     xEscandalloDet: TFIBDataSetRO;
     xEscandalloFAMILIA: TFIBStringField;
     xEscandalloALFA_1: TFIBStringField;
     xEscandalloALFA_2: TFIBStringField;
     xEscandalloALFA_3: TFIBStringField;
     xEscandalloALFA_4: TFIBStringField;
     xEscandalloALFA_5: TFIBStringField;
     xEscandalloDetFAMILIA: TFIBStringField;
     xEscandalloDetNOTAS: TBlobField;
     procedure DataModule1Create(Sender: TObject);
     procedure DMLstNecesidadesDestroy(Sender: TObject);
     procedure xArticulosBeforeOpen(DataSet: TDataSet);
     procedure frNecesidadesEnterRect(Memo: TStringList; View: TfrView);
     procedure frNecesidadesGetValue(const ParName: string; var ParValue: variant);
     procedure xEscandalloAfterScroll(DataSet: TDataSet);
     procedure xOrdenesAfterScroll(DataSet: TDataSet);
     procedure xListOrdenesAfterOpen(DataSet: TDataSet);
     procedure xOrdenesAfterOpen(DataSet: TDataSet);
     procedure xProcesosAfterOpen(DataSet: TDataSet);
     procedure xEscandalloOrdAfterScroll(DataSet: TDataSet);
     procedure xListOrdenesAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     SW, NORDEN: integer;
     Serie_Orden: string;
     CantidadEsc: double;
     ValoradoEsc, ExplosionEsc: smallint;
  public
     { Public declarations }
     procedure PreparaListado(Serie: string; Orden: integer; Articulo: string; Cantidad: real; Explosion: boolean; Modo: integer);
     procedure PreparaListadoEsc(escandallo: integer; articulo: string; cantidad: double; Explosion, Valorado, Todos, Modo: integer; Orden: byte);
     procedure PreparaListadoOrd(orden, fecha, almacen, articulo, escandallo, pedido: smallint; ordend, ordenh: string; fechad, fechaH: TDateTime; almacend, almacenh, articuloD, articuloH: string; escandallod, escandalloh, pedidod, pedidoh: integer; modo: smallint; cantidad: integer);
     procedure PreparaListadoCodBarras(orden, fecha, almacen, articulo, escandallo, pedido: smallint; ordend, ordenh: string; fechad, fechaH: TDateTime; almacend, almacenh, articuloD, articuloH: string; escandallod, escandalloh, pedidod, pedidoh: integer; modo: smallint; cantidad: integer);
     procedure PreparaListadoOrdEsc(Serie: string; Orden: integer; Explosion, Valorado, Modo: integer);
     procedure CambiaTituloArt(Articulo: string);
     procedure DameDatosOrden(Serie: string; Orden: integer; var Articulo: string; var Cantidad: real);
  end;

var
  DMLstNecesidades : TDMLstNecesidades;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMLstNecesidades.DataModule1Create(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstNecesidades.PreparaListado(Serie: string; Orden: integer; Articulo: string; Cantidad: real; Explosion: boolean; Modo: integer);
begin
  Norden := orden;
  Serie_Orden := Serie;

  with xNecesidades do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie_Orden;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Params.ByName['PADRE'].AsString := Articulo;
     Params.ByName['NIVEL'].AsInteger := 1;
     Params.ByName['UNIDADES'].AsFloat := Cantidad;
     Params.ByName['EXPLOSION'].AsInteger := BoolToInt(Explosion);
     Open;
  end;

  with xNotas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;

  xArticulos.Close;
  xArticulos.Open;

  SW := 1;
  DMListados.Imprimir(85, 0, Modo, Serie, '', frNecesidades, nil, nil, nil);
end;

procedure TDMLstNecesidades.PreparaListadoOrd(orden, fecha, almacen, articulo, escandallo, pedido: smallint; ordend, ordenh: string; fechad, fechaH: TDateTime; almacend, almacenh, articuloD, articuloH: string; escandallod, escandalloh, pedidod, pedidoh: integer; modo: smallint; cantidad: integer);
begin
  CantidadEsc := cantidad;
  xEscandallo.Close;
  xEscandallo.DataSource := nil;

  with xListOrdenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Params.ByName['FECHA'].AsInteger := Fecha;
     Params.ByName['ALMACEN'].AsInteger := almacen;
     Params.ByName['ARTICULO'].AsInteger := articulo;
     Params.ByName['ESCANDALLO'].AsInteger := escandallo;
     Params.ByName['PEDIDO'].AsInteger := pedido;
     Params.ByName['ORDEND'].AsInteger := StrToInt(ordend);
     Params.ByName['ORDENh'].AsInteger := StrToInt(ordenh);
     Params.ByName['FECHAD'].AsDateTime := FechaD;
     Params.ByName['FECHAH'].AsDateTime := FechaH + 1;
     Params.ByName['ALMACEND'].AsString := almacenD;
     Params.ByName['ALMACENH'].AsString := almacenH;
     Params.ByName['ARTICULOD'].AsString := articuloD;
     Params.ByName['ARTICULOH'].AsString := articuloH;
     Params.ByName['ESCANDALLOD'].AsInteger := escandalloD;
     Params.ByName['ESCANDALLOH'].AsInteger := escandalloH;
     Params.ByName['PEDIDOD'].AsInteger := pedidoD;
     Params.ByName['PEDIDOH'].AsInteger := pedidoH;
     Open;
  end;

  SW := 1;
  DMListados.Imprimir(105, 0, Modo, '', '', frNecesidades, nil, nil, nil);

  xEscandallo.DataSource := nil;
end;

procedure TDMLstNecesidades.PreparaListadoCodBarras(orden, fecha, almacen, articulo, escandallo, pedido: smallint; ordend, ordenh: string; fechad, fechaH: TDateTime; almacend, almacenh, articuloD, articuloH: string; escandallod, escandalloh, pedidod, pedidoh: integer; modo: smallint; cantidad: integer);
begin
  xEscandallo.Close;
  xEscandallo.DataSource := DSxListOrdenes;

  with xListOrdenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Params.ByName['FECHA'].AsInteger := Fecha;
     Params.ByName['ALMACEN'].AsInteger := almacen;
     Params.ByName['ARTICULO'].AsInteger := articulo;
     Params.ByName['ESCANDALLO'].AsInteger := escandallo;
     Params.ByName['PEDIDO'].AsInteger := pedido;
     Params.ByName['ORDEND'].AsInteger := StrToInt(ordend);
     Params.ByName['ORDENh'].AsInteger := StrToInt(ordenh);
     Params.ByName['FECHAD'].AsDateTime := FechaD;
     Params.ByName['FECHAH'].AsDateTime := FechaH + 1;
     Params.ByName['ALMACEND'].AsString := almacenD;
     Params.ByName['ALMACENH'].AsString := almacenH;
     Params.ByName['ARTICULOD'].AsString := articuloD;
     Params.ByName['ARTICULOH'].AsString := articuloH;
     Params.ByName['ESCANDALLOD'].AsInteger := escandalloD;
     Params.ByName['ESCANDALLOH'].AsInteger := escandalloH;
     Params.ByName['PEDIDOD'].AsInteger := pedidoD;
     Params.ByName['PEDIDOH'].AsInteger := pedidoH;
     Open;
  end;

  SW := 1;
  DMListados.Imprimir(5103, 0, Modo, '', '', frNecesidades, nil, nil, nil);

  xEscandallo.DataSource := nil;
end;

procedure TDMLstNecesidades.PreparaListadoEsc(escandallo: integer; articulo: string; cantidad: double; Explosion, Valorado, Todos, Modo: integer; Orden: byte);
var
  tmp : string;
begin
  CantidadEsc := Cantidad;
  ValoradoEsc := Valorado;
  ExplosionEsc := Explosion;

  xEscandallo.Close;
  xEscandallo.DataSource := nil;

  with xEscandalloDet do
  begin
     Close;

     tmp := SelectSQL.Text;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT SP.HIJO, SP.TITULO, SP.CANTIDAD, SP.NIVEL_HIJO, SP.P_COSTE, SP.COSTE, SP.COSTE_TOTAL, ');
     SelectSQL.Add(' ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ART.ALFA_4, ART.ALFA_5, ART.FAMILIA, ART.NOTAS ');
     SelectSQL.Add(' FROM A_ART_NECESIDADES_ESC(?EMPRESA, ?EJERCICIO, ?CANAL, ?PADRE, ?NIVEL, ?UNIDADES, ?EXPLOSION) SP ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ');
     SelectSQL.Add(' ON ART.EMPRESA = ?EMPRESA1 AND ART.ARTICULO = SP.HIJO ');

     if (orden = 0) then
        SelectSQL.Add(' ORDER BY SP.LINEA ');
     if (orden = 1) then
        SelectSQL.Add(' ORDER BY SP.HIJO ');
     if (orden = 2) then
        SelectSQL.Add(' ORDER BY ART.ALFA_4, SP.HIJO ');
  end;
  try
     with xEscandallo do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NUMERO'].AsInteger := Escandallo;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['TODOS'].AsInteger := Todos;
        Open;
     end;

     SW := 1;
     DMListados.Imprimir(104, 0, Modo, '', '', frNecesidades, nil, nil, nil);
  finally
     xEscandalloDet.Close;
     xEscandalloDet.SelectSQL.Text := tmp;
  end;
end;

procedure TDMLstNecesidades.PreparaListadoOrdEsc(Serie: string; Orden: integer; Explosion, Valorado, Modo: integer);
begin
  ValoradoEsc := Valorado;

  with xOrdenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Open;
  end;

  with xEscandalloOrd do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Params.ByName['PADRE'].AsString := xOrdenes.FieldByName('ARTICULO').AsString;
     Params.ByName['NIVEL'].AsInteger := 0;
     Params.ByName['UNIDADES'].AsFloat := xOrdenes.FieldByName('UNIDADES').AsFloat;
     Params.ByName['EXPLOSION'].AsInteger := Explosion;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;

  SW := 1;
  DMListados.Imprimir(106, 0, Modo, Serie, '', frNecesidades, nil, nil, nil);
end;

procedure TDMLstNecesidades.DMLstNecesidadesDestroy(Sender: TObject);
begin
  // ??? CierraData(DMLstNecesidades);
  CierraData(DMListados);
end;

procedure TDMLstNecesidades.CambiaTituloArt(Articulo: string);
begin
  with xArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstNecesidades.DameDatosOrden(Serie: string; Orden: integer; var Articulo: string; var Cantidad: real);
begin
  with xOrdenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Open;
     Articulo := FieldByName('ARTICULO').AsString;
     Cantidad := FieldByName('CANT_ORDENADA').AsFloat;
  end;
end;

procedure TDMLstNecesidades.xArticulosBeforeOpen(DataSet: TDataSet);
begin
  xArticulos.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

procedure TDMLstNecesidades.frNecesidadesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstNecesidades.frNecesidadesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Cantidad' then
     ParValue := CantidadEsc;

  if ParName = 'Valorado' then
     ParValue := ValoradoEsc;

  if ParName = 'Stock' then
  begin
     with xOrdenes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie_Orden;
        Params.ByName['ORDEN'].AsInteger := NOrden;
        Open;
     end;

     ParValue := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, xNecesidadesHIJO.AsString, xOrdenes.FieldByName('ALMACEN').AsString);
  end;

  if ParName = 'Proveedor' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT PROVEEDOR FROM ART_ARTICULOS_PROVEEDORES P  ');
           SQL.Add(' WHERE ');
           SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
           SQL.Add(' P.ARTICULO = ?ARTICULO AND  ');
           SQL.Add(' PRIORIDAD = (SELECT MIN(PRIORIDAD) FROM ART_ARTICULOS_PROVEEDORES P2  ');
           SQL.Add('              WHERE ');
           SQL.Add('              P2.EMPRESA = ?EMPRESA AND ');
           SQL.Add('              P.ARTICULO = ?ARTICULO AND ');
           SQL.Add('              ACTIVO = 1) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['articulo'].AsString := xNecesidadesHIJO.AsString;
           ExecQuery;
           ParValue := FieldByName['proveedor'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Precio' then
  begin
     with SPPrecio do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Articulo'].AsString := xNecesidadesHIJO.AsString;
        ExecQuery;
        ParValue := FieldByName['COSTE'].AsFloat;
        FreeHandle;
     end;
  end;

  if ParName = 'NotasArtOrden' then
     with xNotas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := xOrdenes.FieldByName('ARTICULO').AsString;
        Open;
     end;

  if ParName = 'Pedido' then
     with xPedido do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xOrdenes.FieldByName('SERIE').AsString;
        Params.ByName['PEDIDO'].AsInteger := xOrdenes.FieldByName('PEDIDO').AsInteger;
        Open;
     end;

  if ParName = 'DuracionHoras' then
  begin
     ParValue := (xOrdenes.FieldByName('FECHA_ENTREGA').AsDateTime - xOrdenes.FieldByName('FECHA_INICIO').AsDateTime) * 24;
  end;

  if ParName = 'TituloArticuloOrdenKri' then
  begin
     ParValue := DameTituloArticulo(xOrdenes.FieldByName('ARTICULO').AsString);
  end;

  if ParName = 'Barras' then
  begin
     ParValue := DameCodigoBarras(xListOrdenesARTICULO.AsString);
  end;
end;

procedure TDMLstNecesidades.xEscandalloAfterScroll(DataSet: TDataSet);
begin
  with xEscandalloDet do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EMPRESA1'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PADRE'].AsString := xEscandalloARTICULO.AsString;
     Params.ByName['NIVEL'].AsInteger := 1;
     Params.ByName['UNIDADES'].AsFloat := CantidadEsc;
     Params.ByName['EXPLOSION'].AsInteger := ExplosionEsc;
     Open;
  end;
end;

procedure TDMLstNecesidades.xOrdenesAfterScroll(DataSet: TDataSet);
begin
  xoperario.Close;
  xoperario.Open;
  xprocesos.Close;
  xprocesos.Open;
end;

procedure TDMLstNecesidades.xListOrdenesAfterOpen(DataSet: TDataSet);
begin
  xListOperario.Open;

  xprocesos.Close;
  xprocesos.DataSource := DSxListOrdenes;
  xprocesos.Open;
end;

procedure TDMLstNecesidades.xOrdenesAfterOpen(DataSet: TDataSet);
begin
  xprocesos.Close;
  xprocesos.DataSource := DSxOrd;
  xprocesos.Open;
end;

procedure TDMLstNecesidades.xProcesosAfterOpen(DataSet: TDataSet);
begin
  xOperarioProceso.Close;
  xOperarioProceso.Open;
end;

procedure TDMLstNecesidades.xEscandalloOrdAfterScroll(DataSet: TDataSet);
begin
  with xArticuloKri do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xOrdenes.FieldByName('EMPRESA').AsInteger;
     Params.ByName['ARTICULO'].AsString := xEscandalloOrd.FieldByName('HIJO').AsString;
     Open;
  end;
end;

procedure TDMLstNecesidades.xListOrdenesAfterScroll(DataSet: TDataSet);
begin
  with xEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xListOrdenesEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := xListOrdenesARTICULO.AsString;
     Params.ByName['NUMERO'].AsInteger := xListOrdenesESCANDALLO.AsInteger;
     Params.ByName['TODOS'].AsInteger := 0;
     Open;
  end;
end;

end.
