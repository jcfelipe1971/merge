object DMUnidadesExtGesC: TDMUnidadesExtGesC
  OldCreateOrder = False
  OnCreate = DMUnidadesExtCreate
  Left = 959
  Top = 352
  Height = 249
  Width = 283
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 224
    Top = 16
  end
  object QMUnidadesExt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_E_UE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,UNIDADES,MEDIDA1' +
        ',MEDIDA2,MEDIDA3,MEDIDA4,PRECIO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?UNIDADES' +
        ',?MEDIDA1,?MEDIDA2,?MEDIDA3,?MEDIDA4,?PRECIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_E_UE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_E_UE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_UE'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,MEDIDA1=?MEDIDA1 '
      '  ,MEDIDA2=?MEDIDA2 '
      '  ,MEDIDA3=?MEDIDA3 '
      '  ,MEDIDA4=?MEDIDA4 '
      '  ,PRECIO=?PRECIO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterPost = QMUnidadesExtAfterPost
    OnNewRecord = QMUnidadesExtNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_E_UE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMUnidadesExtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUnidadesExtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMUnidadesExtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMUnidadesExtSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMUnidadesExtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMUnidadesExtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMUnidadesExtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMUnidadesExtUNIDADES: TIntegerField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMUnidadesExtMEDIDA1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA1'
    end
    object QMUnidadesExtMEDIDA2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA2'
    end
    object QMUnidadesExtMEDIDA3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA3'
    end
    object QMUnidadesExtMEDIDA4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA4'
    end
    object QMUnidadesExtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
  end
  object DSQMUnidadesExt: TDataSource
    DataSet = QMUnidadesExt
    Left = 128
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 64
  end
end
