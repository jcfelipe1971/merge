object DMMultiserie: TDMMultiserie
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 662
  Top = 172
  Height = 148
  Width = 281
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 8
  end
  object DSQMSeries: TDataSource
    DataSet = QMSeries
    Left = 104
    Top = 8
  end
  object QMSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_MULTISERIE'
      'WHERE'
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_MULTISERIE'
      '  (EMPRESA,EJERCICIO,CANAL,SERIE,TITULO,MARCADO)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TITULO,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_MULTISERIE'
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA  AND'
      '  ENTRADA=?ENTRADA')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_MULTISERIE'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ENTRADA=?ENTRADA'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_MULTISERIE'
      'SET'
      '  TITULO=?TITULO '
      '  ,MARCADO=?MARCADO '
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA  AND'
      '  ENTRADA=?ENTRADA')
    AfterPost = QMSeriesAfterPost
    ClavesPrimarias.Strings = (
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_MULTISERIE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMSeriesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMSeriesMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMSeriesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 200
    Top = 56
  end
end
