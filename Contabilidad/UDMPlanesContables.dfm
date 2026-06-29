object DMPlanesContables: TDMPlanesContables
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 279
  Top = 166
  Height = 304
  Width = 460
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object QMPlanesContables: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANA_PLAN_CONTABLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE ')
    InsertSQL.Strings = (
      'INSERT INTO ANA_PLAN_CONTABLE'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,TITULO,ID_P,PREGUNTAR_I' +
        'MPUTACION,PROYECTO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?TITULO,?ID_P,?PREG' +
        'UNTAR_IMPUTACION,?PROYECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_PLAN_CONTABLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_PLAN_CONTABLE'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ANA_PLAN_CONTABLE'
      'SET'
      '  TITULO=?TITULO '
      '  ,ID_P=?ID_P '
      '  ,PREGUNTAR_IMPUTACION=?PREGUNTAR_IMPUTACION '
      '  ,PROYECTO=?PROYECTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE ')
    AfterDelete = Graba
    AfterOpen = QMPlanesContablesAfterOpen
    AfterPost = Graba
    BeforePost = QMPlanesContablesBeforePost
    OnNewRecord = QMPlanesContablesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_PLAN_CONTABLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 72
    object QMPlanesContablesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPlanesContablesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPlanesContablesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPlanesContablesPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMPlanesContablesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPlanesContablesID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMPlanesContablesPREGUNTAR_IMPUTACION: TIntegerField
      DisplayLabel = 'Preg. Imputacion'
      FieldName = 'PREGUNTAR_IMPUTACION'
    end
    object QMPlanesContablesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMPlanesContablesPROYECTOChange
    end
  end
  object DSQMPlanesContables: TDataSource
    DataSet = QMPlanesContables
    Left = 160
    Top = 72
  end
  object xEmpresa: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_empresas where empresa=?empresa')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 48
    Top = 144
    object xEmpresaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEmpresaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxEmpresa: TDataSource
    DataSet = xEmpresa
    Left = 160
    Top = 144
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_PROYECTOS'
      'WHERE '
      '  EMPRESA  = ?EMPRESA AND'
      '  PROYECTO= ?PROYECTO'
      ' ')
    UniDirectional = True
    DataSource = DSQMPlanesContables
    Left = 280
    Top = 70
    object xProyectosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 388
    Top = 70
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 112
    Top = 8
  end
end
