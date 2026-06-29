object DMExtraccionDatos: TDMExtraccionDatos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 103
  Height = 150
  Width = 409
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 328
    Top = 8
  end
  object QMExtraccion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_EXTRACCION_DATOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_EXTRACCION_DATOS'
      '  (SENTENCIA,ULT_MODIFICACION,ID,TITULO,TRANSACCION_READONLY)'
      'VALUES'
      
        '  (?SENTENCIA,?ULT_MODIFICACION,?ID,?TITULO,?TRANSACCION_READONL' +
        'Y)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EXTRACCION_DATOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EXTRACCION_DATOS'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_EXTRACCION_DATOS'
      'SET'
      '  SENTENCIA=?SENTENCIA '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,TITULO=?TITULO '
      '  ,TRANSACCION_READONLY=?TRANSACCION_READONLY '
      'WHERE'
      '  ID=?ID ')
    BeforeDelete = QMExtraccionBeforeDelete
    BeforePost = QMExtraccionBeforePost
    OnNewRecord = QMExtraccionNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EXTRACCION_DATOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMExtraccionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMExtraccionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMExtraccionSENTENCIA: TBlobField
      DisplayLabel = 'Sentencia'
      FieldName = 'SENTENCIA'
      Size = 8
    end
    object QMExtraccionTRANSACCION_READONLY: TIntegerField
      DisplayLabel = 'Solo Lectura'
      FieldName = 'TRANSACCION_READONLY'
    end
  end
  object DSQMExtraccion: TDataSource
    DataSet = QMExtraccion
    Left = 160
    Top = 8
  end
  object xResultado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TResultado
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AutoCalcFields = False
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TResultado
    AutoCommit = True
    Left = 40
    Top = 56
  end
  object DSxResultado: TDataSource
    DataSet = xResultado
    Left = 160
    Top = 56
  end
  object TResultado: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 56
  end
end
