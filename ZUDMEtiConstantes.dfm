object ZDMEtiConstantes: TZDMEtiConstantes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 608
  Top = 212
  Height = 311
  Width = 281
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 208
    Top = 24
  end
  object QMConstantes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ETI_CONSTANTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ETI_CONSTANTES'
      
        '  (LONGITUD_BOBINA,ML_CAMBIO_BOBINA,ID,EMPRESA,HORAS_CAMBIO_BOBI' +
        'NA,TAREA_PREPARACION,TAREA_IMPRESION,TAREA_POLIMEROS,TAREA_BOBIN' +
        'AS,PATH_DOCUMENTOS)'
      'VALUES'
      
        '  (?LONGITUD_BOBINA,?ML_CAMBIO_BOBINA,?ID,?EMPRESA,?HORAS_CAMBIO' +
        '_BOBINA,?TAREA_PREPARACION,?TAREA_IMPRESION,?TAREA_POLIMEROS,?TA' +
        'REA_BOBINAS,?PATH_DOCUMENTOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ETI_CONSTANTES'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_ETI_CONSTANTES'
      'WHERE'
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ETI_CONSTANTES'
      'SET'
      '  LONGITUD_BOBINA=?LONGITUD_BOBINA '
      '  ,ML_CAMBIO_BOBINA=?ML_CAMBIO_BOBINA '
      '  ,ID=?ID '
      '  ,HORAS_CAMBIO_BOBINA=?HORAS_CAMBIO_BOBINA'
      '  ,TAREA_PREPARACION=?TAREA_PREPARACION'
      '  ,TAREA_IMPRESION=?TAREA_IMPRESION'
      '  ,TAREA_POLIMEROS=?TAREA_POLIMEROS'
      '  ,TAREA_BOBINAS=?TAREA_BOBINAS'
      '  ,PATH_DOCUMENTOS=?PATH_DOCUMENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    AfterPost = Graba
    OnNewRecord = QMConstantesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ETI_CONSTANTES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 24
    object QMConstantesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConstantesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConstantesLONGITUD_BOBINA: TFloatField
      DisplayLabel = 'Long. Bobina'
      FieldName = 'LONGITUD_BOBINA'
    end
    object QMConstantesML_CAMBIO_BOBINA: TFloatField
      DisplayLabel = 'ML Cambio Bobina'
      FieldName = 'ML_CAMBIO_BOBINA'
    end
    object QMConstantesHORAS_CAMBIO_BOBINA: TFloatField
      DisplayLabel = 'Horas Cambio Bobina'
      FieldName = 'HORAS_CAMBIO_BOBINA'
    end
    object QMConstantesTAREA_PREPARACION: TFIBStringField
      DisplayLabel = 'Preparacion'
      FieldName = 'TAREA_PREPARACION'
      Size = 3
    end
    object QMConstantesTAREA_IMPRESION: TFIBStringField
      DisplayLabel = 'Impresion'
      FieldName = 'TAREA_IMPRESION'
      Size = 3
    end
    object QMConstantesTAREA_POLIMEROS: TFIBStringField
      DisplayLabel = 'Polieros'
      FieldName = 'TAREA_POLIMEROS'
      Size = 3
    end
    object QMConstantesTAREA_BOBINAS: TFIBStringField
      DisplayLabel = 'Bobinas'
      FieldName = 'TAREA_BOBINAS'
      Size = 3
    end
    object QMConstantesPATH_DOCUMENTOS: TFIBStringField
      DisplayLabel = 'Carpeta Docs.'
      FieldName = 'PATH_DOCUMENTOS'
      Size = 200
    end
  end
  object DSConstantes: TDataSource
    DataSet = QMConstantes
    Left = 120
    Top = 24
  end
end
