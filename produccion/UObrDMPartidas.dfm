object ObrDMPartidas: TObrDMPartidas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 467
  Top = 155
  Height = 321
  Width = 527
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 312
    Top = 16
  end
  object DSObrPartidas: TDataSource
    DataSet = QMObrPartidas
    Left = 152
    Top = 32
  end
  object QMObrPartidas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_SYS_PARTIDA'
      'WHERE'
      '  PARTIDA=?old_PARTIDA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_SYS_PARTIDA'
      '  (DESCRIPCION,PARTIDA)'
      'VALUES'
      '  (?DESCRIPCION,?PARTIDA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_SYS_PARTIDA'
      'WHERE'
      '  PARTIDA=?PARTIDA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_SYS_PARTIDA'
      'order by partida')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_SYS_PARTIDA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  PARTIDA=?PARTIDA ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'PARTIDA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_SYS_PARTIDA'
    UpdateTransaction = TLocal
    Left = 48
    Top = 32
    object QMObrPartidasPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      Size = 3
    end
    object QMObrPartidasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
end
