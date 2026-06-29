object DMUbicaciones: TDMUbicaciones
  OldCreateOrder = False
  OnCreate = DMUbicacionesCreate
  Left = 577
  Top = 371
  Height = 186
  Width = 277
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 85
  end
  object QMUbicaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_UBICACIONES                '
      'WHERE'
      '  UBICACION=?old_UBICACION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_UBICACIONES                '
      '  (SISTEMA,UBICACION,DESCRIPCION,LOGIN,MAQUINA)'
      'VALUES'
      '  (?SISTEMA,?UBICACION,?DESCRIPCION,?LOGIN,?MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  SISTEMA,UBICACION,DESCRIPCION,LOGIN,MAQUINA'
      'FROM SYS_UBICACIONES                '
      'WHERE'
      '  UBICACION=?UBICACION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_UBICACIONES                ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_UBICACIONES                '
      'SET'
      '  SISTEMA=?SISTEMA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LOGIN=?LOGIN '
      '  ,MAQUINA=?MAQUINA '
      'WHERE'
      '  UBICACION=?UBICACION ')
    ClavesPrimarias.Strings = (
      'UBICACION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_UBICACIONES                '
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 29
  end
  object DSQMUbicaciones: TDataSource
    DataSet = QMUbicaciones
    Left = 123
    Top = 29
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
    Top = 93
  end
end
