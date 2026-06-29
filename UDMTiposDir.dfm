object DMTiposDir: TDMTiposDir
  OldCreateOrder = False
  OnCreate = DMTiposDirCreate
  Left = 646
  Top = 360
  Height = 181
  Width = 194
  object QMTiposDir: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_DIRECCION'
      '  (TITULO,TIPO)'
      'VALUES'
      '  (?TITULO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_DIRECCION'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_DIRECCION'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  TIPO=?TIPO ')
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_DIRECCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 72
    object QMTiposDirTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMTiposDirTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMTiposDir: TDataSource
    DataSet = QMTiposDir
    Left = 96
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 24
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 104
    Top = 8
  end
end
