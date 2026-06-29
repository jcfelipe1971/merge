object DMMonedaCuenta: TDMMonedaCuenta
  OldCreateOrder = False
  OnCreate = DMMonedaCuentaCreate
  Left = 670
  Top = 387
  Height = 398
  Width = 398
  object DSQMMonedas: TDataSource
    DataSet = QMMonedas
    Left = 120
    Top = 16
  end
  object QMMonedas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CUENTAS_MONEDA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  MONEDA=?old_MONEDA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CUENTAS_MONEDA'
      
        '  (EMPRESA,EJERCICIO,CANAL,MONEDA,TITULO,CUENTA_NEGATIVO,CUENTA_' +
        'POSITIVO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?MONEDA,?TITULO,?CUENTA_NEGATIVO,?' +
        'CUENTA_POSITIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CUENTAS_MONEDA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  MONEDA=?MONEDA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_MONEDA'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL'
      'ORDER BY MONEDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CUENTAS_MONEDA'
      'SET'
      '  TITULO=?TITULO '
      '  ,CUENTA_NEGATIVO=?CUENTA_NEGATIVO '
      '  ,CUENTA_POSITIVO=?CUENTA_POSITIVO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  MONEDA=?MONEDA ')
    AfterDelete = Graba
    AfterPost = QMMonedasAfterPost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'MONEDA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CUENTAS_MONEDA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMMonedasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMonedasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMonedasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMMonedasCUENTA_NEGATIVO: TFIBStringField
      DisplayLabel = 'Cta. Negativo'
      FieldName = 'CUENTA_NEGATIVO'
      Size = 15
    end
    object QMMonedasCUENTA_POSITIVO: TFIBStringField
      DisplayLabel = 'Cta. Positivo'
      FieldName = 'CUENTA_POSITIVO'
      Size = 15
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 296
    Top = 16
  end
end
