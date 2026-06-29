object DMAsistenteImpStockMinMax: TDMAsistenteImpStockMinMax
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 252
  Top = 160
  Height = 321
  Width = 404
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 248
    Top = 8
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 320
    Top = 56
  end
  object QMStocksImp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_IMPORTAR_STOCKS_MINMAX'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_IMPORTAR_STOCKS_MINMAX'
      
        '  (ENTRADA,EMPRESA,CANAL,ARTICULO,STOCK_MINIMO,STOCK_MAXIMO,IMPO' +
        'RTAR)'
      'VALUES'
      
        '  (?ENTRADA,?EMPRESA,?CANAL,?ARTICULO,?STOCK_MINIMO,?STOCK_MAXIM' +
        'O,?IMPORTAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_IMPORTAR_STOCKS_MINMAX'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_IMPORTAR_STOCKS_MINMAX'
      'WHERE'
      'ENTRADA = :ENTRADA AND'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL   '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_IMPORTAR_STOCKS_MINMAX'
      'SET'
      '  STOCK_MINIMO=?STOCK_MINIMO '
      '  ,STOCK_MAXIMO=?STOCK_MAXIMO '
      '  ,IMPORTAR=?IMPORTAR '
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = QMStocksImpAfterPost
    OnNewRecord = QMStocksImpNewRecord
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'CANAL '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_IMPORTAR_STOCKS_MINMAX'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMStocksImpENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMStocksImpEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object QMStocksImpCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      ReadOnly = True
    end
    object QMStocksImpARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object QMStocksImpSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock M'#237'nimo'
      FieldName = 'STOCK_MINIMO'
    end
    object QMStocksImpSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock M'#225'ximo'
      FieldName = 'STOCK_MAXIMO'
    end
    object QMStocksImpIMPORTAR: TIntegerField
      DisplayLabel = 'Importar'
      FieldName = 'IMPORTAR'
    end
  end
  object DSQMStocksImp: TDataSource
    DataSet = QMStocksImp
    Left = 136
    Top = 8
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_IMPORTAR_STOCKS_MINMAX'
      'WHERE'
      'ENTRADA = :ENTRADA AND'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'IMPORTAR = 1     '
      'ORDER BY ARTICULO')
    UniDirectional = False
    Left = 40
    Top = 72
    object xRecorreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object xRecorreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      ReadOnly = True
    end
    object xRecorreARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object xRecorreSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock M'#237'nimo'
      FieldName = 'STOCK_MINIMO'
    end
    object xRecorreSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock M'#225'ximo'
      FieldName = 'STOCK_MAXIMO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 8
  end
  object QActualizaStocks: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 136
  end
end
