object DMGasConstantes: TDMGasConstantes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 471
  Top = 172
  Height = 277
  Width = 317
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 240
    Top = 24
  end
  object QMGasConstantes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GAS_CONSTANTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GAS_CONSTANTES'
      '  (ID,EMPRESA,ARTICULO)'
      'VALUES'
      '  (?ID,?EMPRESA,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GAS_CONSTANTE_SERIE'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GAS_CONSTANTES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GAS_CONSTANTES'
      'SET'
      '  ID=?ID '
      '  ,ARTICULO=?ARTICULO '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMGasConstantesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GAS_CONSTANTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMGasConstantesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMGasConstantesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGasConstantesARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSGasConstantes: TDataSource
    DataSet = QMGasConstantes
    Left = 152
    Top = 24
  end
  object DSGasCuentaSeries: TDataSource
    DataSet = QMGasCuentaSeries
    Left = 152
    Top = 72
  end
  object QMGasCuentaSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GAS_CONSTANTE_SERIE'
      'WHERE'
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GAS_CONSTANTE_SERIE'
      
        '  (ID,EMPRESA,EJERCICIO,CANAL,SERIE,CUENTA_VENTA,CUENTA_CAJA,CUE' +
        'NTA_FALTANTE,CUENTA_SOBRANTE,CUENTA_DISTRIBUCION, CUENTA_COSTO_S' +
        'UCURSAL)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CUENTA_VENTA,?CUENTA_C' +
        'AJA,?CUENTA_FALTANTE,?CUENTA_SOBRANTE,?CUENTA_DISTRIBUCION, ?CUE' +
        'NTA_COSTO_SUCURSAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GAS_CONSTANTE_SERIE'
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GAS_CONSTANTE_SERIE'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GAS_CONSTANTE_SERIE'
      'SET'
      '  ID=?ID '
      '  ,CUENTA_VENTA=?CUENTA_VENTA '
      '  ,CUENTA_CAJA=?CUENTA_CAJA '
      '  ,CUENTA_FALTANTE=?CUENTA_FALTANTE '
      '  ,CUENTA_SOBRANTE=?CUENTA_SOBRANTE '
      '  ,CUENTA_DISTRIBUCION=?CUENTA_DISTRIBUCION'
      '  ,CUENTA_COSTO_SUCURSAL=?CUENTA_COSTO_SUCURSAL'
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMGasCuentaSeriesNewRecord
    ClavesPrimarias.Strings = (
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GAS_CONSTANTE_SERIE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 72
    object QMGasCuentaSeriesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMGasCuentaSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGasCuentaSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMGasCuentaSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMGasCuentaSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMGasCuentaSeriesCUENTA_VENTA: TFIBStringField
      DisplayLabel = 'Cta. Venta'
      FieldName = 'CUENTA_VENTA'
      Size = 15
    end
    object QMGasCuentaSeriesCUENTA_CAJA: TFIBStringField
      DisplayLabel = 'Cta. Caja'
      FieldName = 'CUENTA_CAJA'
      Size = 15
    end
    object QMGasCuentaSeriesCUENTA_FALTANTE: TFIBStringField
      DisplayLabel = 'Cta. Faltante'
      FieldName = 'CUENTA_FALTANTE'
      Size = 15
    end
    object QMGasCuentaSeriesCUENTA_SOBRANTE: TFIBStringField
      DisplayLabel = 'Cta. Sobrante'
      FieldName = 'CUENTA_SOBRANTE'
      Size = 15
    end
    object QMGasCuentaSeriesCUENTA_DISTRIBUCION: TFIBStringField
      DisplayLabel = 'Cta. Distribucion'
      FieldName = 'CUENTA_DISTRIBUCION'
      Size = 15
    end
    object QMGasCuentaSeriesCUENTA_COSTO_SUCURSAL: TFIBStringField
      DisplayLabel = 'Cta. Costo Suc.'
      FieldName = 'CUENTA_COSTO_SUCURSAL'
      Size = 15
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
    Left = 240
    Top = 72
  end
end
