object ProDMArticulosAlmacenes: TProDMArticulosAlmacenes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 669
  Top = 384
  Height = 392
  Width = 407
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 187
    Top = 14
  end
  object QMArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE EMPRESA=?EMPRESA'
      'AND TARIFA=?TARIFA'
      'AND FAMILIA <> ?FAMILIA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMArticulosAfterOpen
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_TARIFAS_PRECIOS'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 36
    Top = 16
    object QMArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo '
      FieldName = 'TITULO_ARTICULO'
      Size = 60
    end
    object QMArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArticulosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMArticulosCALCULO: TIntegerField
      DisplayLabel = 'C'#225'lculo'
      FieldName = 'CALCULO'
    end
    object QMArticulosTITULO_CALCULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo C'#225'lculo'
      FieldName = 'TITULO_CALCULO'
      Size = 60
    end
    object QMArticulosUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMArticulosUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMArticulosPRECIO_BASE: TFloatField
      DisplayLabel = 'Precio Base'
      FieldName = 'PRECIO_BASE'
    end
    object QMArticulosPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMArticulosMARGEN_PC: TFloatField
      DisplayLabel = 'Margen PC'
      FieldName = 'MARGEN_PC'
    end
    object QMArticulosMARGEN_PV: TFloatField
      DisplayLabel = 'Margen PV'
      FieldName = 'MARGEN_PV'
    end
    object QMArticulosCOMISION: TFloatField
      DisplayLabel = 'Comisi'#243'n'
      FieldName = 'COMISION'
    end
    object QMArticulosBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueado'
      FieldName = 'BLOQUEADO'
    end
    object QMArticulosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMArticulosACTIVA: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVA'
    end
    object QMArticulosMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSQMArticulos: TDataSource
    DataSet = QMArticulos
    Left = 104
    Top = 17
  end
  object QMDetStocks: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT empresa,almacen,articulo,sum(entradas)as entradas,sum(sal' +
        'idas) as'
      
        'salidas, sum(existencias) as existencias, sum(pedidos_d_cli) as ' +
        'pedidos_d_cli,'
      
        'sum(reservadas) as reservadas, sum(stock_minimo) as stock_minimo' +
        ','
      
        'sum(stock_maximo) as stock_maximo, sum(pedidos_a_pro) as pedidos' +
        '_a_pro,'
      'sum(en_proceso_prod) as en_proceso_prod'
      
        'FROM a_art_dame_stock_articulo_tot(?EMPRESA,0,?ARTICULO,1,1,1,1,' +
        '0,1,1,'#39'01-01-1900'#39')'
      'GROUP BY empresa, almacen,articulo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArticulos
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 36
    Top = 72
    object QMDetStocksEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetStocksALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetStocksENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMDetStocksSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMDetStocksEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object QMDetStocksPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Pedidos de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object QMDetStocksRESERVADAS: TFloatField
      DisplayLabel = 'Reservadas'
      FieldName = 'RESERVADAS'
    end
    object QMDetStocksSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object QMDetStocksSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object QMDetStocksPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Pedidos a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object QMDetStocksEN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En Proc. Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object QMDetStocksARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSQMDetStocks: TDataSource
    DataSet = QMDetStocks
    Left = 118
    Top = 73
  end
  object QSPBusquedaArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE DAME_ARTICULO(?articulo,?empresa)')
    Transaction = TLocal
    AutoTrans = True
    Left = 229
    Top = 90
  end
  object DSxTarifas: TDataSource
    DataSet = xTarifas
    Left = 110
    Top = 144
  end
  object xTarifas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_TARIFAS_C'
      'WHERE EMPRESA = ?EMPRESA AND'
      'TARIFA = ?TARIFA')
    UniDirectional = False
    Left = 38
    Top = 140
    object xTarifasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
end
