object DMRazones: TDMRazones
  OldCreateOrder = False
  OnCreate = DMSeriesCreate
  Left = 1037
  Top = 480
  Height = 215
  Width = 243
  object QMRazones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TERCEROS_RAZONES'
      'WHERE'
      '  RAZON=?old_RAZON ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TERCEROS_RAZONES'
      '  (RAZON,TITULO,Z_TIPO)'
      'VALUES'
      '  (?RAZON,?TITULO,?Z_TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_RAZONES'
      'WHERE'
      '  RAZON=?RAZON ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_RAZONES'
      'ORDER BY RAZON')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TERCEROS_RAZONES'
      'SET'
      '  TITULO=?TITULO,'
      '  Z_TIPO=?Z_TIPO'
      'WHERE'
      '  RAZON=?RAZON ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'RAZON ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TERCEROS_RAZONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 64
    object QMRazonesRAZON: TFIBStringField
      DisplayLabel = 'Razon'
      FieldName = 'RAZON'
      Size = 4
    end
    object QMRazonesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMRazonesZ_TIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'Z_TIPO'
    end
  end
  object DSRazones: TDataSource
    DataSet = QMRazones
    Left = 120
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
    Left = 120
    Top = 16
  end
end
