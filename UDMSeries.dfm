object DMSeries: TDMSeries
  OldCreateOrder = False
  OnCreate = DMSeriesCreate
  Left = 802
  Top = 124
  Height = 205
  Width = 243
  object QMSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_SERIES'
      'WHERE'
      '  SERIE=?old_SERIE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_SERIES'
      '  (TITULO,SERIE)'
      'VALUES'
      '  (?TITULO,?SERIE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_SERIES'
      'WHERE'
      '  SERIE=?old_SERIE ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_SERIES'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_SERIES'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  SERIE=?old_SERIE')
    ClavesPrimarias.Strings = (
      'SERIE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_SERIES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 64
    object QMSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMSeriesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSSeries: TDataSource
    DataSet = QMSeries
    Left = 96
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 24
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
    Left = 96
    Top = 16
  end
end
