object DMComoNosConocieron: TDMComoNosConocieron
  OldCreateOrder = False
  OnCreate = DMComoNosConocieronCreate
  Left = 494
  Top = 342
  Height = 224
  Width = 367
  object DSQMComoNosConocieron: TDataSource
    DataSet = QMComoNosConocieron
    Left = 190
    Top = 18
  end
  object QMComoNosConocieron: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_COMO_NOS_CONOCIERON'
      'WHERE'
      '  MODO=?old_MODO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_COMO_NOS_CONOCIERON'
      '  (MODO,'#13#10'TITULO)'
      'VALUES'
      '  (?MODO,'#13#10'?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_COMO_NOS_CONOCIERON'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_COMO_NOS_CONOCIERON'
      'ORDER BY MODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_COMO_NOS_CONOCIERON'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  MODO=?MODO ')
    OnNewRecord = QMComoNosConocieronNewRecord
    ClavesPrimarias.Strings = (
      'MODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_COMO_NOS_CONOCIERON'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 52
    Top = 16
    object QMComoNosConocieronMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMComoNosConocieronTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 294
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 294
    Top = 66
  end
end
