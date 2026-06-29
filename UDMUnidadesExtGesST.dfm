object DMUnidadesExtGesST: TDMUnidadesExtGesST
  OldCreateOrder = False
  OnCreate = DMUnidadesExtCreate
  Left = 559
  Top = 193
  Height = 248
  Width = 283
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 16
  end
  object QMUnidadesExt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_ST_UE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_ST_UE'
      
        '  (SERIE,MEDIDA1,MEDIDA2,MEDIDA3,MEDIDA4,PRECIO,RIG,LINEA,UNIDAD' +
        'ES,EMPRESA,EJERCICIO)'
      'VALUES'
      
        '  (?SERIE,?MEDIDA1,?MEDIDA2,?MEDIDA3,?MEDIDA4,?PRECIO,?RIG,?LINE' +
        'A,?UNIDADES,?EMPRESA,?EJERCICIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_ST_UE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_ST_UE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_ST_UE'
      'SET'
      '  MEDIDA1=?MEDIDA1 '
      '  ,MEDIDA2=?MEDIDA2 '
      '  ,MEDIDA3=?MEDIDA3 '
      '  ,MEDIDA4=?MEDIDA4 '
      '  ,PRECIO=?PRECIO '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterPost = QMUnidadesExtAfterPost
    OnNewRecord = QMUnidadesExtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'SERIE '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_ST_UE'
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
    object QMUnidadesExtSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
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
    Left = 216
    Top = 64
  end
end
