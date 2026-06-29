object DMPresenciaDispositivo: TDMPresenciaDispositivo
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
  object QMDisPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_DISP_PRESENCIA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_DISP_PRESENCIA'
      '  (ID,'#13#10'DESCRIPCION,IDENTIFICADOR_DISPOSITIVO,LATITUD,LONGITUD)'
      'VALUES'
      
        '  (?ID,'#13#10'?DESCRIPCION,?IDENTIFICADOR_DISPOSITIVO,?LATITUD,?LONGI' +
        'TUD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_DISP_PRESENCIA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_DISP_PRESENCIA'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_DISP_PRESENCIA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IDENTIFICADOR_DISPOSITIVO=?IDENTIFICADOR_DISPOSITIVO '
      '  ,LATITUD=?LATITUD '
      '  ,LONGITUD=?LONGITUD '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMDisPreBeforePost
    OnNewRecord = QMDisPreNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_DISP_PRESENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMDisPreID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDisPreDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMDisPreIDENTIFICADOR_DISPOSITIVO: TFIBStringField
      DisplayLabel = 'Identificador Dispositivo'
      FieldName = 'IDENTIFICADOR_DISPOSITIVO'
      Size = 25
    end
    object QMDisPreLATITUD: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'LATITUD'
    end
    object QMDisPreLONGITUD: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
  end
  object DSQMDisPre: TDataSource
    DataSet = QMDisPre
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
