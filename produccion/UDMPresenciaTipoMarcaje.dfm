object DMPresenciaTipoMarcaje: TDMPresenciaTipoMarcaje
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 774
  Top = 181
  Height = 224
  Width = 339
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 24
  end
  object QMTipoPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPO_PRESENCIA'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPO_PRESENCIA'
      '  (TIPO,'#13#10'DESCRIPCION,IDENTIFICADOR_TIPO_MARCAJE)'
      'VALUES'
      '  (?TIPO,'#13#10'?DESCRIPCION,?IDENTIFICADOR_TIPO_MARCAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPO_PRESENCIA'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPO_PRESENCIA'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPO_PRESENCIA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IDENTIFICADOR_TIPO_MARCAJE=?IDENTIFICADOR_TIPO_MARCAJE '
      'WHERE'
      '  TIPO=?TIPO ')
    ClavesPrimarias.Strings = (
      'TIPO')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPO_PRESENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMTipoPreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMTipoPreDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMTipoPreIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Identifiador Marcaje'
      FieldName = 'IDENTIFICADOR_TIPO_MARCAJE'
      Size = 25
    end
  end
  object DSQMTipoPre: TDataSource
    DataSet = QMTipoPre
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
