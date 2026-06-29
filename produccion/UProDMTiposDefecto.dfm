object ProDMTiposDefecto: TProDMTiposDefecto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 747
  Top = 218
  Height = 224
  Width = 339
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 24
  end
  object QMDefecto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPO_DEFECTO'
      'WHERE'
      '  CODIGO_DEFECTO=?old_CODIGO_DEFECTO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPO_DEFECTO'
      '  (CODIGO_DEFECTO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO_DEFECTO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPO_DEFECTO'
      'WHERE'
      '  CODIGO_DEFECTO=?CODIGO_DEFECTO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPO_DEFECTO'
      'ORDER BY CODIGO_DEFECTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPO_DEFECTO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO_DEFECTO=?CODIGO_DEFECTO ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'CODIGO_DEFECTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPO_DEFECTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMDefectoCODIGO_DEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'CODIGO_DEFECTO'
    end
    object QMDefectoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSQMDefecto: TDataSource
    DataSet = QMDefecto
    Left = 120
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 24
  end
end
