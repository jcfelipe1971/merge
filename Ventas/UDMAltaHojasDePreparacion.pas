unit UDMAltaHojasDePreparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados, UEntorno,
  FIBTableDataSet, FIBQuery, HYFIBQuery, RxMemDS;

type
  TDMAltaHojasDePreparacion = class(TDataModule)
     DSQMAltaPedidos: TDataSource;
     QMAltaPedidos: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     SPMarcaEntradas: THYFIBQuery;
     SPGeneraHojasPedido: THYFIBQuery;
     QMAltaPedidosEMPRESA: TIntegerField;
     QMAltaPedidosEJERCICIO: TIntegerField;
     QMAltaPedidosCANAL: TIntegerField;
     QMAltaPedidosSERIE: TFIBStringField;
     QMAltaPedidosTIPO: TFIBStringField;
     QMAltaPedidosRIG: TIntegerField;
     QMAltaPedidosLINEA: TIntegerField;
     QMAltaPedidosESTADO: TIntegerField;
     QMAltaPedidosCLIENTE: TIntegerField;
     QMAltaPedidosMONEDA: TFIBStringField;
     QMAltaPedidosALMACEN: TFIBStringField;
     QMAltaPedidosARTICULO: TFIBStringField;
     QMAltaPedidosTITULO: TFIBStringField;
     QMAltaPedidosUNIDADES: TFloatField;
     QMAltaPedidosUNIDADES_SERVIDAS: TFloatField;
     QMAltaPedidosUNIDADES_PENDIENTES: TFloatField;
     QMAltaPedidosUNIDADES_RESERVADAS: TFloatField;
     QMAltaPedidosSERVIDO: TIntegerField;
     QMAltaPedidosPRECIO: TFloatField;
     QMAltaPedidosPIEZAS_X_BULTO: TIntegerField;
     QMAltaPedidosBULTOS: TIntegerField;
     QMAltaPedidosDESCUENTO: TFloatField;
     QMAltaPedidosDESCUENTO_2: TFloatField;
     QMAltaPedidosDESCUENTO_3: TFloatField;
     QMAltaPedidosCOMISION: TFloatField;
     QMAltaPedidosP_COSTE: TFloatField;
     QMAltaPedidosM_MOV_STOCK: TIntegerField;
     QMAltaPedidosTIPO_IVA: TIntegerField;
     QMAltaPedidosP_IVA: TFloatField;
     QMAltaPedidosP_RECARGO: TFloatField;
     QMAltaPedidosBRUTO: TFloatField;
     QMAltaPedidosB_COMISION: TFloatField;
     QMAltaPedidosI_DESCUENTO: TFloatField;
     QMAltaPedidosB_IMPONIBLE: TFloatField;
     QMAltaPedidosB_DTO_LINEA: TFloatField;
     QMAltaPedidosI_COMISION: TFloatField;
     QMAltaPedidosC_IVA: TFloatField;
     QMAltaPedidosC_RECARGO: TFloatField;
     QMAltaPedidosT_COSTE: TFloatField;
     QMAltaPedidosM_BRUTO: TFloatField;
     QMAltaPedidosLIQUIDO: TFloatField;
     QMAltaPedidosENTRADA: TIntegerField;
     QMAltaPedidosENTRADA_AGRUPACION: TIntegerField;
     QMAltaPedidosUNIDADES_EXT: TFloatField;
     QMAltaPedidosORDEN_PRODUCCION: TIntegerField;
     QMAltaPedidosUNIDADES_SEC: TFloatField;
     QMAltaPedidosDIRECCION_ENTREGA: TIntegerField;
     QMAltaPedidosID_DETALLES_S: TIntegerField;
     QMAltaPedidosID_S: TIntegerField;
     QMAltaPedidosID_A: TIntegerField;
     QMAltaPedidosID_C_A: TIntegerField;
     QMAltaPedidosCOMISION_LINEAL: TFloatField;
     QMAltaPedidosI_COMISION_LINEAL: TFloatField;
     QMAltaPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     QMAltaPedidosFECHA_REC_DET: TDateTimeField;
     QMAltaPedidosTITULO_IDIOMA: TFIBStringField;
     QMAltaPedidosMARGEN_KRI: TFloatField;
     QMAltaPedidosTIPO_LINEA_KRI: TIntegerField;
     QMAltaPedidosORDEN: TIntegerField;
     QMAltaPedidosTIPO_LINEA: TFIBStringField;
     QMAltaPedidosPROC_PROMOCION: TIntegerField;
     QMAltaPedidosORIGEN: TIntegerField;
     QMAltaPedidosID_P: TIntegerField;
     QMAltaPedidosAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMAltaPedidosPROYECTO: TIntegerField;
     QMAltaPedidosCRC_NOTAS: TFIBStringField;
     QMAltaPedidosCRC_NOTAS2: TFIBStringField;
     QMAltaPedidosPRO_NUM_PLANO: TFIBStringField;
     QMAltaPedidosSTOCK: TFloatField;
     RxStock: TRxMemoryData;
     RxStockARTICULO: TStringField;
     RxStockSTOCK: TFloatField;
     RxStockALMACEN: TStringField;
     QMAltaPedidosU_RESERVADAS: TFloatField;
     QMAltaPedidosUDS_EN_PREPARACION: TFloatField;
     RxUnidadesPreparacion: TRxMemoryData;
     RxUnidadesPreparacionU_PREPARACION: TFloatField;
     RxUnidadesPreparacionALMACEN: TStringField;
     RxUnidadesPreparacionARTICULO: TStringField;
     QMAltaPedidosU_DISP_PARA_SERVIR: TFloatField;
     QMAltaPedidosUNI_PREPARADOACTUAL: TIntegerField;
     QMAltaPedidosFECHA_RIG: TDateTimeField;
     QMAltaPedidosESTADO_REGISTRO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMAltaPedidosSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAltaPedidosU_RESERVADASChange(Sender: TField);
     procedure QMAltaPedidosUDS_EN_PREPARACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAltaPedidosU_DISP_PARA_SERVIRGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAltaPedidosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure GeneraAltaPedidos(Almacen: string);
     procedure FiltraDetalle(DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta: integer; FechaDesde, FechaHasta: TDateTime; DesdeArticulo, HastaArticulo, Almacen: string; FiltraPedidosPendientes: boolean);
     procedure MarcarTodos(DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta: integer; FechaDesde, FechaHasta: TDateTime; marca: integer; Abrir: boolean = True);
     function StockSuficiente: boolean;
     function DameStock(empresa, canal: integer; articulo, almacen: string): real;
     function DameUnidadesEnPreparacion(Articulo, Almacen: string): real;
     procedure ImprimeHojaDePreparacionGenerada;
     procedure PasaAEstadoListado;
     function DameUnidadesDisponibles(Almacen: string; id_a: integer): real;
     function StockPreparacionSuficiente: boolean;
  end;

var
  DMAltaHojasDePreparacion : TDMAltaHojasDePreparacion;

implementation

uses UDMMain, UFormGest, UDMLstHojaDePreparacion;

{$R *.dfm}

procedure TDMAltaHojasDePreparacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  SQLBase := TStringList.Create;
  SQLBase.Text := QMAltaPedidos.SelectSQL.Text;

  with RxStock do
  begin
     Close;
     EmptyTable;
     Open;
  end;

  with RxUnidadesPreparacion do
  begin
     Close;
     EmptyTable;
     Open;
  end;

  QMAltaPedidosSTOCK.DisplayFormat := MascaraN;
  QMAltaPedidosU_DISP_PARA_SERVIR.DisplayFormat := MascaraN;
end;

procedure TDMAltaHojasDePreparacion.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
  QMAltaPedidos.Close;
  with RxStock do
  begin
     Close;
     EmptyTable;
  end;

  with RxUnidadesPreparacion do
  begin
     Close;
     EmptyTable;
  end;
end;

procedure TDMAltaHojasDePreparacion.GeneraAltaPedidos(Almacen: string);
begin
  with SPGeneraHojasPedido do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['RESPONSABLE'].AsInteger := 0; // Es un id_empleado. Que tome valores por defecto
     Params.ByName['ID_UBICACION_SIMPLE'].AsInteger := 0; // Que tome valores por defecto
     ExecQuery;
     FreeHandle;
  end;

  //sfg.albert - Es buiden les taules buffer perquè es tornin a recalcular els camps
  RxStock.Close;
  RxStock.EmptyTable;
  RxStock.Open;

  RxUnidadesPreparacion.Close;
  RxUnidadesPreparacion.EmptyTable;
  RxUnidadesPreparacion.Open;
end;

procedure TDMAltaHojasDePreparacion.FiltraDetalle(DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta: integer; FechaDesde, FechaHasta: TDateTime; DesdeArticulo, HastaArticulo, Almacen: string; FiltraPedidosPendientes: boolean);
var
  Orden : string;
begin
  with QMAltaPedidos do
  begin
     DisableControls;
     try
        Orden := OrdenadoPor;
        MarcarTodos(DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta, FechaDesde, FechaHasta, 0, False);
        Close;
        SelectSQL.Assign(SQLbase);
        Ordenar('');
        // if Active then Close;

        if (FiltraPedidosPendientes) then
           SelectSQL.Add(' AND SERVIDO = 0 AND ESTADO <> 5 ');

        SelectSQL.Add(' AND CLIENTE >= ?DESDE_CLIENTE ');
        SelectSQL.Add(' AND CLIENTE <= ?HASTA_CLIENTE ');
        SelectSQL.Add(' AND RIG >= ?PEDIDO_DESDE ');
        SelectSQL.Add(' AND RIG <= ?PEDIDO_HASTA ');
        SelectSQL.Add(' AND FECHA_ENTREGA_PREV >= ?FECHA_DESDE ');
        SelectSQL.Add(' AND FECHA_ENTREGA_PREV <= ?FECHA_HASTA ');
        SelectSQL.Add(' AND ARTICULO BETWEEN ?DESDE_ARTICULO AND ?HASTA_ARTICULO ');
        if (Almacen <> 'Todos') then
           SelectSQL.Add(' AND ALMACEN=''' + Almacen + '''');

        Ordenar(Orden);

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
        Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
        Params.ByName['PEDIDO_DESDE'].AsInteger := PedidoDesde;
        Params.ByName['PEDIDO_HASTA'].AsInteger := PedidoHasta;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
        Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
        Open;

        // Establezco las unidades a servir
        MarcarTodos(DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta, FechaDesde, FechaHasta, -1);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAltaHojasDePreparacion.MarcarTodos(DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta: integer; FechaDesde, FechaHasta: TDateTime; Marca: integer; Abrir: boolean = True);
var
  id_detalles_s : integer;
  Stock : real;
begin
  if (Marca >= 0) then
  begin
     with QMAltaPedidos do
     begin
        id_detalles_s := QMAltaPedidosID_DETALLES_S.AsInteger;
        DisableControls;
        Close;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE VER_DETALLE_PREPARA_PEDIDO ');
              SQL.Add(' SET ');
              SQL.Add(' ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' TIPO = ?TIPO AND ');
              SQL.Add(' SERVIDO = 0 AND ');
              SQL.Add(' ESTADO <> 5 AND ');
              SQL.Add(' CLIENTE >= ?DESDE_CLIENTE AND ');
              SQL.Add(' CLIENTE <= ?HASTA_CLIENTE AND ');
              SQL.Add(' RIG >= ?PEDIDO_DESE AND ');
              SQL.Add(' RIG <= ?PEDIDO_HASTA AND ');
              SQL.Add(' FECHA_ENTREGA_PREV >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_ENTREGA_PREV <= ?FECHA_HASTA ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := REntorno.Serie;
              Params.ByName['TIPO'].AsString := 'PEC';
              Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
              Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
              Params.ByName['PEDIDO_DESE'].AsInteger := PedidoDesde;
              Params.ByName['PEDIDO_HASTA'].AsInteger := PedidoHasta;
              Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
              Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
              Params.ByName['ENTRADA_AGRUPACION'].AsInteger := Marca;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Abrir) then
        begin
           Open;
           while ((not EOF) and (id_detalles_s <> QMAltaPedidosID_DETALLES_S.AsInteger)) do
              Next;
        end;
        EnableControls;
     end;
  end
  else
  begin
     with QMAltaPedidos do
     begin
        id_detalles_s := QMAltaPedidosID_DETALLES_S.AsInteger;
        DisableControls;
        try
           // Recorro las lineas y marco las que tienen stock suficiente
           First;
           while (not EOF) do
           begin
              if (QMAltaPedidosESTADO.AsInteger = 0) then
              begin
                 Stock := DameStock(QMAltaPedidosEMPRESA.AsInteger, QMAltaPedidosCANAL.AsInteger, QMAltaPedidosARTICULO.AsString, QMAltaPedidosALMACEN.AsString);
                 // sfg.albert
                 if ((Stock >= QMAltaPedidosUNIDADES_PENDIENTES.AsFloat) and
                    (((QMAltaPedidosUNIDADES_SERVIDAS.AsFloat = 0) and
                    (QMAltaPedidosUni_PreparadoActual.AsFloat = 0)) or
                    (QMAltaPedidosUni_PreparadoActual.AsFloat <= QMAltaPedidosUNIDADES.AsFloat) or
                    (QMAltaPedidosUNIDADES_SERVIDAS.AsFloat <> 0))) then
                 begin
                    Edit;
                    QMAltaPedidosENTRADA_AGRUPACION.AsInteger := REntorno.Entrada;
                    // sfg.albert - S'assignen les unitats que tinc disponibles per preparar
                    QMAltaPedidosU_RESERVADAS.AsFloat :=
                       QMAltaPedidosUNIDADES.AsFloat - QMAltaPedidosUni_PreparadoActual.AsFloat - QMAltaPedidosUNIDADES_SERVIDAS.AsFloat;
                    Post;
                 end;
              end;
              Next;
           end;

           First;
           while ((not EOF) and (id_detalles_s <> QMAltaPedidosID_DETALLES_S.AsInteger)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

function TDMAltaHojasDePreparacion.DameStock(Empresa, Canal: integer; Articulo, Almacen: string): real;
begin
  // Buscar el stock
  // Utilizo RxStock para no tener que calcular en la base cada stock. (Cache de Stock)
  with RxStock do
  begin
     First;
     while ((not EOF) and ((RxStockARTICULO.AsString <> Articulo) or (RxStockALMACEN.AsString <> Almacen))) do
        Next;

     if (EOF) then
     begin
        Insert;
        RxStockARTICULO.AsString := Articulo;
        RxStockALMACEN.AsString := Almacen;
        RxStockSTOCK.AsFloat := DMMain.DameStockArticulo(Empresa, Canal, Articulo, Almacen);
        Post;
     end;

     Result := RxStockSTOCK.AsFloat;
  end;
end;

procedure TDMAltaHojasDePreparacion.QMAltaPedidosSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Esta function me devuelve el stock del artículo, pero tambien posiciona RxStock
  DameStock(QMAltaPedidosEMPRESA.AsInteger, QMAltaPedidosCANAL.AsInteger, QMAltaPedidosARTICULO.AsString, QMAltaPedidosALMACEN.AsString);
  Text := RxStockSTOCK.AsString;
end;

function TDMAltaHojasDePreparacion.StockSuficiente: boolean;
var
  Stock : real;
begin
  Stock := DameStock(QMAltaPedidosEMPRESA.AsInteger, QMAltaPedidosCANAL.AsInteger, QMAltaPedidosARTICULO.AsString, QMAltaPedidosALMACEN.AsString);

  // Solo habilito si esta abierto
  if (QMAltaPedidosESTADO.AsInteger = 0) then
     Result := (Stock >= QMAltaPedidosUNIDADES_PENDIENTES.AsFloat)
  else
     Result := False;
end;

procedure TDMAltaHojasDePreparacion.QMAltaPedidosU_RESERVADASChange(Sender: TField);
begin
  if (QMAltaPedidosESTADO.AsInteger = 0) then
     if (QMAltaPedidosU_RESERVADAS.AsFloat = 0) then
        QMAltaPedidosENTRADA_AGRUPACION.AsInteger := 0
     else
        QMAltaPedidosENTRADA_AGRUPACION.AsInteger := REntorno.Entrada;
end;

procedure TDMAltaHojasDePreparacion.QMAltaPedidosUDS_EN_PREPARACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DameUnidadesEnPreparacion(QMAltaPedidosARTICULO.AsString, QMAltaPedidosALMACEN.AsString);
  Text := RxUnidadesPreparacionU_PREPARACION.AsString;
end;

function TDMAltaHojasDePreparacion.DameUnidadesEnPreparacion(Articulo, Almacen: string): real;
var
  UPREPARACION : real;
begin
  // Buscar Unidades en preparacion
  // Utilizo RxUnidadesPreparacion para obtener Unidades de preparación
  with RxUnidadesPreparacion do
  begin
     if ((RxUnidadesPreparacionARTICULO.AsString <> Articulo) or (RxUnidadesPreparacionALMACEN.AsString <> Almacen)) then
        First;
     while ((not EOF) and ((RxUnidadesPreparacionARTICULO.AsString <> Articulo) or (RxUnidadesPreparacionALMACEN.AsString <> Almacen))) do
        Next;

     if (EOF) then
     begin
        // Calculamos unidades de Preparación
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(GD.UNIDADES) AS U_PREPARACION ');
              SQL.Add(' FROM GES_DETALLES_S_PRE GD ');
              SQL.Add(' JOIN GES_CABECERAS_S_PRE GC ON (GC.ID = GD.ID_HOJA) ');
              SQL.Add(' WHERE ');
              SQL.Add(' GD.EMPRESA = ?EMPRESA AND ');
              SQL.Add(' GD.ARTICULO = ?ARTICULO AND ');
              SQL.Add(' GC.ESTADO <= 3 AND ');
              SQL.Add(' GD.ALMACEN = ?ALMACEN ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['ALMACEN'].AsString := Almacen;
              ExecQuery;
              UPreparacion := FieldByName['U_PREPARACION'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Insertamos Unidades de Preparación
        Insert;
        RxUnidadesPreparacionARTICULO.AsString := Articulo;
        RxUnidadesPreparacionALMACEN.AsString := Almacen;
        RxUnidadesPreparacionU_PREPARACION.AsFloat := UPreparacion;
        Post;
     end;

     Result := RxUnidadesPreparacionU_PREPARACION.AsFloat;
  end;
end;

procedure TDMAltaHojasDePreparacion.QMAltaPedidosU_DISP_PARA_SERVIRGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // sfg.albert - Calculo Stock disponible fuera de la ubicación genérica
  Text := FloatToStrF(DameUnidadesDisponibles(QMAltaPedidosAlmacen.AsString, QMAltaPedidosID_A.AsInteger), ffNumber, 15, 2);
end;

procedure TDMAltaHojasDePreparacion.ImprimeHojaDePreparacionGenerada;
var
  Hoja : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(HOJA) AS HOJA FROM GES_CABECERAS_S_PRE';
        ExecQuery;
        Hoja := FieldByName['HOJA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbreData(TDMLstHojaDePreparacion, DMLstHojaDePreparacion);
  DMLstHojaDePreparacion.MuestraListado(0, REntorno.Empresa, Hoja);
  CierraData(DMLstHojaDePreparacion);
end;

procedure TDMAltaHojasDePreparacion.PasaAEstadoListado;
var
  Hoja : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(HOJA) AS HOJA FROM GES_CABECERAS_S_PRE';
        ExecQuery;
        Hoja := FieldByName['HOJA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Ponemos a estado 1 la hoja de preparacion genereada
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_S_PRE SET ESTADO = 1 WHERE HOJA = ?HOJA';
        Params.ByName['HOJA'].AsInteger := Hoja;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAltaHojasDePreparacion.DameUnidadesDisponibles(Almacen: string; id_a: integer): real;
var
  UdsDisponibles, UdsEnPreparacion : real;
begin
  // Calculo Stock disponible fuera de la ubicación genérica
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(S.EXISTENCIAS) AS UNIDADES_DISPONIBLES ');
        SQL.Add(' FROM ART_STOCKS_UBICACIONES S ');
        SQL.Add(' JOIN ART_ALMACENES_UBICACIONES U ON S.ID_UBICACION=U.ID_UBICACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' S.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' S.CANAL=?CANAL AND ');
        SQL.Add(' S.ALMACEN = ?ALMACEN AND ');
        SQL.Add(' S.ID_A = ?ID_A AND ');
        SQL.Add(' U.DISPONIBLE = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := Almacen; // QMAltaPedidosAlmacen.AsString;
        Params.ByName['ID_A'].AsInteger := id_a; // QMAltaPedidosID_A.AsInteger;
        ExecQuery;
        UdsDisponibles := FieldByName['UNIDADES_DISPONIBLES'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Tratamos como text para que funcione el OnGetText
  UdsEnPreparacion := DameUnidadesEnPreparacion(QMAltaPedidosARTICULO.AsString, QMAltaPedidosALMACEN.AsString);
  Result := UdsDisponibles - UdsEnPreparacion;
end;

// sfg.albert - Procediment que verifica l'stock de les unitats disponibles
// tenint en compte les que estan en preparació
function TDMAltaHojasDePreparacion.StockPreparacionSuficiente: boolean;
var
  Stock : real;
begin
  Stock := DameUnidadesDisponibles(QMAltaPedidosAlmacen.AsString, QMAltaPedidosID_A.AsInteger);

  // Solo habilito si esta abierto
  if (QMAltaPedidosESTADO.AsInteger = 0) then
     Result := (Stock >= QMAltaPedidosU_RESERVADAS.AsFloat) // QMAltaPedidosUNIDADES_PENDIENTES.AsSTring)
  else
     Result := False;
end;

procedure TDMAltaHojasDePreparacion.QMAltaPedidosCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(DET.UNIDADES) FROM GES_CABECERAS_S_PRE CAB ');
        SQL.Add(' LEFT JOIN GES_DETALLES_S_PRE DET ON (CAB.ID = DET.ID_HOJA) ');
        SQL.Add(' WHERE ');
        SQL.Add(' DET.ID_DETALLES_S = :ID_DETALLES_S AND ');
        SQL.Add(' CAB.ESTADO < 4 ');
        Params.ByName['ID_DETALLES_S'].AsInteger := QMAltaPedidosID_DETALLES_S.AsInteger;
        ExecQuery;
        QMAltaPedidosUNI_PREPARADOACTUAL.AsFloat := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMAltaPedidosESTADO_REGISTRO.AsInteger := 0;
  if (DMAltaHojasDePreparacion.StockPreparacionSuficiente) then
  begin
     // sfg.albert
     // 1-Todo esta pendiente. No se ha servido ni preparado nada.
     if ((DMAltaHojasDePreparacion.QMAltaPedidosUNIDADES_SERVIDAS.AsFloat = 0) and
        (DMAltaHojasDePreparacion.QMAltaPedidosUni_PreparadoActual.AsFloat = 0)) then
        QMAltaPedidosESTADO_REGISTRO.AsInteger := 1
     else
     // 3-Toda la linea del pedido esta en preparación
     if (DMAltaHojasDePreparacion.QMAltaPedidosUNIDADES.AsFloat =
        DMAltaHojasDePreparacion.QMAltaPedidosUni_PreparadoActual.AsFloat) then
        QMAltaPedidosESTADO_REGISTRO.AsInteger := 3
     else
     //2 -Pendiente una parte y resto en hoja de preparación y nada servido
     if ((DMAltaHojasDePreparacion.QMAltaPedidosUni_PreparadoActual.AsFloat <
        DMAltaHojasDePreparacion.QMAltaPedidosUNIDADES.AsFloat) and
        (DMAltaHojasDePreparacion.QMAltaPedidosUNIDADES_SERVIDAS.AsFloat = 0)) then
        QMAltaPedidosESTADO_REGISTRO.AsInteger := 2
     else
     // 4-Hay una parte albaranada y nada en preparación
     if ((DMAltaHojasDePreparacion.QMAltaPedidosUni_PreparadoActual.AsFloat = 0) and
        (DMAltaHojasDePreparacion.QMAltaPedidosUNIDADES_SERVIDAS.AsFloat <> 0)) then
        QMAltaPedidosESTADO_REGISTRO.AsInteger := 4
     else
     // 5-Una parte albaranada, una parte en preparación
     if ((DMAltaHojasDePreparacion.QMAltaPedidosUNIDADES_SERVIDAS.AsFloat <> 0) and
        (DMAltaHojasDePreparacion.QMAltaPedidosUni_PreparadoActual.AsFloat <> 0)) then
        QMAltaPedidosESTADO_REGISTRO.AsInteger := 5;
  end; // fi control stock
end;

end.
