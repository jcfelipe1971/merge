object DMFormasPagoTpv: TDMFormasPagoTpv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 400
  Top = 243
  Height = 198
  Width = 262
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 128
    Top = 32
  end
  object QMFormasPagoTpv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_FP'
      'WHERE'
      '  FORMA_PAGO=?old_FORMA_PAGO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_FP'
      '  (EMPRESA,EJERCICIO,CANAL,SERIE,CAJA,FORMA_PAGO,CUENTA_PAGO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CAJA,?FORMA_PAGO,?CUENTA_P' +
        'AGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_FP'
      'WHERE'
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_FP'
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA   ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_FP'
      'SET'
      '  CUENTA_PAGO=?CUENTA_PAGO '
      'WHERE'
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMFormasPagoTpvNewRecord
    ClavesPrimarias.Strings = (
      'FORMA_PAGO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_FP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 32
    object QMFormasPagoTpvEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMFormasPagoTpvEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMFormasPagoTpvCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMFormasPagoTpvSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFormasPagoTpvFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFormasPagoTpvCUENTA_PAGO: TFIBStringField
      FieldName = 'CUENTA_PAGO'
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
    Left = 128
    Top = 88
  end
end
