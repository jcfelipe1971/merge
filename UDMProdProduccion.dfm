object DMProdProduccion: TDMProdProduccion
  OldCreateOrder = False
  OnCreate = DMProdProduccionCreate
  Left = 534
  Top = 367
  Height = 202
  Width = 328
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 22
  end
  object QMProcesos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROCESOS_PRODUCCION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROCESO=?old_PROCESO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROCESOS_PRODUCCION'
      '  (EMPRESA,PROCESO,TITULO,DURACION,NOTAS,PRECIO)'
      'VALUES'
      '  (?EMPRESA,?PROCESO,?TITULO,?DURACION,?NOTAS,?PRECIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROCESOS_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROCESO=?PROCESO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROCESOS_PRODUCCION'
      '  where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROCESOS_PRODUCCION'
      'SET'
      '  TITULO=?TITULO '
      '  ,DURACION=?DURACION '
      '  ,NOTAS=?NOTAS'
      '  ,PRECIO=?PRECIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROCESO=?PROCESO ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMProcesosBeforePost
    OnNewRecord = QMProcesosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROCESO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROCESOS_PRODUCCION'
    Left = 56
    Top = 22
    object QMProcesosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProcesosPROCESO: TIntegerField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
    end
    object QMProcesosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProcesosDURACION: TFloatField
      DisplayLabel = 'Duracion'
      FieldName = 'DURACION'
    end
    object QMProcesosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMProcesosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
  end
  object DSQMProcesos: TDataSource
    DataSet = QMProcesos
    Left = 150
    Top = 24
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 150
    Top = 92
  end
end
