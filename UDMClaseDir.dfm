object DMClaseDir: TDMClaseDir
  OldCreateOrder = False
  OnCreate = DMClaseDirCreate
  Left = 282
  Top = 183
  Height = 191
  Width = 171
  object QMClaseDir: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CLASE_DIRECCION'
      'WHERE'
      '  CLASE=?old_CLASE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CLASE_DIRECCION'
      '  (TITULO,CLASE)'
      'VALUES'
      '  (?TITULO,?CLASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CLASE_DIRECCION'
      'WHERE'
      '  CLASE=?CLASE ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CLASE_DIRECCION'
      'ORDER BY CLASE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CLASE_DIRECCION'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  CLASE=?CLASE ')
    ClavesPrimarias.Strings = (
      'CLASE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CLASE_DIRECCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 92
    object QMClaseDirCLASE: TIntegerField
      DisplayLabel = 'Clase'
      FieldName = 'CLASE'
    end
    object QMClaseDirTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMClaseDir: TDataSource
    DataSet = QMClaseDir
    Left = 96
    Top = 92
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 22
    Top = 26
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 102
    Top = 26
  end
end
