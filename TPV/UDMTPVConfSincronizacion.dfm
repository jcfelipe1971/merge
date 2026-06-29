object DMTPVConfSincronizacion: TDMTPVConfSincronizacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 435
  Top = 218
  Height = 284
  Width = 304
  object QMPartametrosSerie: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TPV_SERVIDOR_SINC'
      'WHERE'
      '  SERIE=?old_SERIE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TPV_SERVIDOR_SINC'
      '  (SERIE,RUTA)'
      'VALUES'
      '  (?SERIE,?RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TPV_SERVIDOR_SINC'
      'WHERE'
      '  SERIE=?SERIE ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TPV_SERVIDOR_SINC'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TPV_SERVIDOR_SINC'
      'SET'
      '  RUTA=?RUTA '
      'WHERE'
      '  SERIE=?SERIE ')
    ClavesPrimarias.Strings = (
      'SERIE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TPV_SERVIDOR_SINC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 48
    object QMPartametrosSerieSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPartametrosSerieRUTA: TFIBStringField
      FieldName = 'RUTA'
      Size = 200
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
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
    Left = 248
    Top = 72
  end
  object DSQMPartametrosSerie: TDataSource
    DataSet = QMPartametrosSerie
    Left = 152
    Top = 48
  end
end
