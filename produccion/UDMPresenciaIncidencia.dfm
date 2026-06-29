object DMPresenciaIncidencia: TDMPresenciaIncidencia
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 774
  Top = 181
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
  object QMIncPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPO_INCIDENCIA'
      'WHERE'
      '  ID_INCIDENCIA=?old_ID_INCIDENCIA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPO_INCIDENCIA'
      
        '  (ID_INCIDENCIA,'#13#10'TIPO,DESCRIPCION,REMUNERACION,BOLSA_HORAS,DEF' +
        'ECTO,IDENTIFICADOR_INCIDENCIA)'
      'VALUES'
      
        '  (?ID_INCIDENCIA,'#13#10'?TIPO,?DESCRIPCION,?REMUNERACION,?BOLSA_HORA' +
        'S,?DEFECTO,?IDENTIFICADOR_INCIDENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPO_INCIDENCIA'
      'WHERE'
      '  ID_INCIDENCIA=?ID_INCIDENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPO_INCIDENCIA'
      'ORDER BY ID_INCIDENCIA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPO_INCIDENCIA'
      'SET'
      '  TIPO=?TIPO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,REMUNERACION=?REMUNERACION '
      '  ,BOLSA_HORAS=?BOLSA_HORAS '
      '  ,DEFECTO=?DEFECTO '
      '  ,IDENTIFICADOR_INCIDENCIA=?IDENTIFICADOR_INCIDENCIA '
      'WHERE'
      '  ID_INCIDENCIA=?ID_INCIDENCIA ')
    AfterPost = QMIncPreAfterPost
    BeforePost = QMIncPreBeforePost
    OnNewRecord = QMIncPreNewRecord
    ClavesPrimarias.Strings = (
      'ID_INCIDENCIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPO_INCIDENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMIncPreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMIncPreDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMIncPreID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_INCIDENCIA'
    end
    object QMIncPreIDENTIFICADOR_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Marcaje'
      DisplayWidth = 25
      FieldName = 'IDENTIFICADOR_INCIDENCIA'
      Size = 25
    end
    object QMIncPreREMUNERACION: TIntegerField
      DisplayLabel = 'Remuneracion'
      FieldName = 'REMUNERACION'
    end
    object QMIncPreBOLSA_HORAS: TIntegerField
      DisplayLabel = 'Bolsa Horas'
      FieldName = 'BOLSA_HORAS'
    end
    object QMIncPreDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSQMIncPre: TDataSource
    DataSet = QMIncPre
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
