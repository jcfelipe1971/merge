object ZDMArticulos: TZDMArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 688
  Top = 154
  Height = 267
  Width = 281
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 211
    Top = 22
  end
  object QMArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_EF'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_EF'
      
        '  (PRECIO_VENTA,TIPO_IVA,TITULO,CANAL,EJERCICIO,EMPRESA,TIPO_ART' +
        'ICULO_TYC,FAMILIA,ARTICULO)'
      'VALUES'
      
        '  (?PRECIO_VENTA,?TIPO_IVA,?TITULO,?CANAL,?EJERCICIO,?EMPRESA,?T' +
        'IPO_ARTICULO_TYC,?FAMILIA,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_EF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_EF'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'order by articulo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_EF'
      'SET'
      '  PRECIO_VENTA=?PRECIO_VENTA '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,TITULO=?TITULO '
      '  ,TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC '
      '  ,FAMILIA=?FAMILIA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO ')
    AfterOpen = QMArticulosAfterOpen
    AfterScroll = QMArticulosAfterScroll
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_EF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArticulosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo Iva'
      FieldName = 'TIPO_IVA'
    end
    object QMArticulosTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object QMArticulosPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMArticulosStockAlm: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'StockAlm'
      Calculated = True
    end
  end
  object DSQMArticulos: TDataSource
    DataSet = QMArticulos
    Left = 120
    Top = 17
  end
  object QMDetStocks: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_STOCKS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_STOCKS'
      
        '  (RESERVADAS,PEDIDOS_D_CLI,PEDIDOS_A_PRO,STOCK_MAXIMO,VALOR_SAL' +
        'IDAS,VALOR_ENTRADAS,SALIDAS,ENTRADAS,STOCK_MINIMO,PEDIDOS_A_TMP,' +
        'PRECIO_PONDERADO,UNIDADES_EXT,EN_PROCESO_PROD,ID_A,ID_STOCKS,CAN' +
        'AL,EMPRESA,ARTICULO,ALMACEN)'
      'VALUES'
      
        '  (?RESERVADAS,?PEDIDOS_D_CLI,?PEDIDOS_A_PRO,?STOCK_MAXIMO,?VALO' +
        'R_SALIDAS,?VALOR_ENTRADAS,?SALIDAS,?ENTRADAS,?STOCK_MINIMO,?PEDI' +
        'DOS_A_TMP,?PRECIO_PONDERADO,?UNIDADES_EXT,?EN_PROCESO_PROD,?ID_A' +
        ',?ID_STOCKS,?CANAL,?EMPRESA,?ARTICULO,?ALMACEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_STOCKS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT ALMACEN , SALIDAS ,'
      '       ENTRADAS_EXT , SALIDAS_EXT , VALOR_ENTRADAS ,'
      '       VALOR_SALIDAS , STOCK , STOCK_EXT,'
      '       STOCK_MINIMO , STOCK_MAXIMO , PEDIDOS_A_PRO ,'
      '       PEDIDOS_D_CLI , PEDIDOS_A_TMP , STOCK_VIRTUAL ,'
      '       RESERVADAS , DISPONIBLES , EN_PROCESO_PROD,'
      
        '       PEDIDOS_D_CLI+RESERVADAS AS  PARA_SERVIR,STOCK-(PEDIDOS_D' +
        '_CLI+RESERVADAS) AS DISPONIBLE '
      
        'FROM Z_A_ART_DAME_STOCK_ALMACEN('#39'000'#39','#39'ZZZ'#39',:articulo,:empresa,:' +
        'canal)'
      
        '/* sfg_rsl - volen tots els magatzems- and (almacen='#39'000'#39' or alm' +
        'acen='#39'002'#39') */')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_STOCKS'
      'SET'
      '  RESERVADAS=?RESERVADAS '
      '  ,PEDIDOS_D_CLI=?PEDIDOS_D_CLI '
      '  ,PEDIDOS_A_PRO=?PEDIDOS_A_PRO '
      '  ,STOCK_MAXIMO=?STOCK_MAXIMO '
      '  ,VALOR_SALIDAS=?VALOR_SALIDAS '
      '  ,VALOR_ENTRADAS=?VALOR_ENTRADAS '
      '  ,SALIDAS=?SALIDAS '
      '  ,ENTRADAS=?ENTRADAS '
      '  ,STOCK_MINIMO=?STOCK_MINIMO '
      '  ,PEDIDOS_A_TMP=?PEDIDOS_A_TMP '
      '  ,PRECIO_PONDERADO=?PRECIO_PONDERADO '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,EN_PROCESO_PROD=?EN_PROCESO_PROD '
      '  ,ID_A=?ID_A '
      '  ,ID_STOCKS=?ID_STOCKS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO ')
    DataSource = DSQMArticulos
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_STOCKS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 28
    Top = 72
    object QMDetStocksALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetStocksSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMDetStocksENTRADAS_EXT: TFloatField
      DisplayLabel = 'Entradas Ext.'
      FieldName = 'ENTRADAS_EXT'
    end
    object QMDetStocksSALIDAS_EXT: TFloatField
      DisplayLabel = 'Salidas Ext.'
      FieldName = 'SALIDAS_EXT'
    end
    object QMDetStocksVALOR_ENTRADAS: TFloatField
      DisplayLabel = 'Valor Entradas'
      FieldName = 'VALOR_ENTRADAS'
    end
    object QMDetStocksVALOR_SALIDAS: TFloatField
      DisplayLabel = 'Valor Salidas'
      FieldName = 'VALOR_SALIDAS'
    end
    object QMDetStocksSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMDetStocksSTOCK_EXT: TFloatField
      DisplayLabel = 'Stock Ext.'
      FieldName = 'STOCK_EXT'
    end
    object QMDetStocksSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock min.'
      FieldName = 'STOCK_MINIMO'
    end
    object QMDetStocksSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object QMDetStocksPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object QMDetStocksPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Pedidos cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object QMDetStocksPEDIDOS_A_TMP: TFloatField
      DisplayLabel = 'Ped. a Tmp.'
      FieldName = 'PEDIDOS_A_TMP'
    end
    object QMDetStocksSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock virtual'
      FieldName = 'STOCK_VIRTUAL'
    end
    object QMDetStocksRESERVADAS: TFloatField
      DisplayLabel = 'En Fabricaci'#243'n'
      FieldName = 'RESERVADAS'
    end
    object QMDetStocksDISPONIBLES: TFloatField
      DisplayLabel = 'Disponibles'
      FieldName = 'DISPONIBLES'
    end
    object QMDetStocksEN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object QMDetStocksPARA_SERVIR: TFloatField
      DisplayLabel = 'Para Servir'
      FieldName = 'PARA_SERVIR'
    end
    object QMDetStocksDISPONIBLE: TFloatField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
  object DSQMDetStocks: TDataSource
    DataSet = QMDetStocks
    Left = 118
    Top = 73
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 211
    Top = 70
  end
end
