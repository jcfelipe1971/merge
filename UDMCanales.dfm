object DMCanales: TDMCanales
  OldCreateOrder = False
  OnCreate = DMCanalesCreate
  Left = 806
  Top = 240
  Height = 184
  Width = 243
  object QMCanales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CANALES'
      'WHERE'
      '  CANAL=?old_CANAL ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CANALES'
      '  (TITULO,CANAL)'
      'VALUES'
      '  (?TITULO,?CANAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CANALES'
      'WHERE'
      '  CANAL=?old_CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CANALES'
      'ORDER BY CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CANALES'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  CANAL=?old_CANAL ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMCanalesBeforePost
    ClavesPrimarias.Strings = (
      'CANAL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CANALES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 92
    object QMCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCanalesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMCanales: TDataSource
    DataSet = QMCanales
    Left = 96
    Top = 90
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 38
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
    Left = 110
    Top = 18
  end
end
