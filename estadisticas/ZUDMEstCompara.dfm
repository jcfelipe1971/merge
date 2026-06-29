object ZDMEstCompara: TZDMEstCompara
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 385
  Width = 467
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 312
    Top = 24
  end
  object xDescPeriodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_periodos'
      'where periodo=?periodo')
    UniDirectional = False
    Left = 40
    Top = 296
    object xDescPeriodoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxDescPeriodo: TDataSource
    DataSet = xDescPeriodo
    Left = 160
    Top = 296
  end
  object QMEstadistica: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Select DINAMICA por c'#243'digo*/'
      
        'SELECT est.*, est.mes01 as totalperiodo1, est.mes01 as totalperi' +
        'odo2'
      'FROM EST_ESTADISTICAS_GRUPO est')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterDelete = Graba
    AfterPost = Graba
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EST_ESTADISTICAS_GRUPO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMEstadisticaCLAVE_1: TFIBStringField
      DisplayLabel = 'Clave 1'
      FieldName = 'CLAVE_1'
      Size = 25
    end
    object QMEstadisticaDESC_CLAVE_1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLAVE_1'
      Size = 100
    end
    object QMEstadisticaCLAVE_2: TFIBStringField
      DisplayLabel = 'Clave 2'
      FieldName = 'CLAVE_2'
      Size = 25
    end
    object QMEstadisticaDESC_CLAVE_2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLAVE_2'
      Size = 100
    end
    object QMEstadisticaCLAVE_3: TFIBStringField
      DisplayLabel = 'Clave 3'
      FieldName = 'CLAVE_3'
      Size = 25
    end
    object QMEstadisticaDESC_CLAVE_3: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLAVE_3'
      Size = 100
    end
    object QMEstadisticaTOTALPERIODO1: TFloatField
      DisplayLabel = 'Total 1'
      FieldName = 'TOTALPERIODO1'
    end
    object QMEstadisticaTOTALPERIODO2: TFloatField
      DisplayLabel = 'Total 2'
      FieldName = 'TOTALPERIODO2'
    end
  end
  object DSQMEstadistica: TDataSource
    DataSet = QMEstadistica
    Left = 160
    Top = 8
  end
  object xEstadistica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from est_estadisticas'
      'where grupo=?grupo and estadistica=?estadistica')
    UniDirectional = False
    Left = 40
    Top = 56
    object xEstadisticaESTADISTICA: TIntegerField
      DisplayLabel = 'Estadistica'
      FieldName = 'ESTADISTICA'
    end
    object xEstadisticaGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xEstadisticaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEstadisticaNUM_CLAVES: TIntegerField
      DisplayLabel = 'Nro. Claves'
      FieldName = 'NUM_CLAVES'
    end
    object xEstadisticaCLAVE_1: TFIBStringField
      DisplayLabel = 'Clave 1'
      FieldName = 'CLAVE_1'
      Size = 31
    end
    object xEstadisticaTITULO_1: TFIBStringField
      DisplayLabel = 'Titulo 1'
      FieldName = 'TITULO_1'
      Size = 25
    end
    object xEstadisticaDESC_CLAVE_1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLAVE_1'
      Size = 31
    end
    object xEstadisticaTITULO_DESC_1: TFIBStringField
      DisplayLabel = 'Descripcion 1'
      FieldName = 'TITULO_DESC_1'
      Size = 25
    end
    object xEstadisticaCLAVE_2: TFIBStringField
      DisplayLabel = 'Clave 2'
      FieldName = 'CLAVE_2'
      Size = 31
    end
    object xEstadisticaTITULO_2: TFIBStringField
      DisplayLabel = 'Titulo 2'
      FieldName = 'TITULO_2'
      Size = 25
    end
    object xEstadisticaDESC_CLAVE_2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLAVE_2'
      Size = 31
    end
    object xEstadisticaTITULO_DESC_2: TFIBStringField
      DisplayLabel = 'Descripcion 2'
      FieldName = 'TITULO_DESC_2'
      Size = 25
    end
    object xEstadisticaCLAVE_3: TFIBStringField
      DisplayLabel = 'Clave 3'
      FieldName = 'CLAVE_3'
      Size = 31
    end
    object xEstadisticaTITULO_3: TFIBStringField
      DisplayLabel = 'Titulo 3'
      FieldName = 'TITULO_3'
      Size = 25
    end
    object xEstadisticaDESC_CLAVE_3: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLAVE_3'
      Size = 31
    end
    object xEstadisticaTITULO_DESC_3: TFIBStringField
      DisplayLabel = 'Descripcion 3'
      FieldName = 'TITULO_DESC_3'
      Size = 25
    end
    object xEstadisticaACUMULADOS: TBlobField
      DisplayLabel = 'Acum.'
      FieldName = 'ACUMULADOS'
      Size = 8
    end
    object xEstadisticaTABLAS: TBlobField
      DisplayLabel = 'Tablas'
      FieldName = 'TABLAS'
      Size = 8
    end
    object xEstadisticaCLAVES: TBlobField
      DisplayLabel = 'Claves'
      FieldName = 'CLAVES'
      Size = 8
    end
    object xEstadisticaREGLAS: TBlobField
      DisplayLabel = 'Reglas'
      FieldName = 'REGLAS'
      Size = 8
    end
    object xEstadisticaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEstadisticaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xEstadisticaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xEstadisticaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xEstadisticaORDEN_TOTAL: TIntegerField
      DisplayLabel = 'Orden Total'
      FieldName = 'ORDEN_TOTAL'
    end
  end
  object xDescGrupo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from est_grupos'
      'where grupo=?grupo')
    UniDirectional = False
    Left = 40
    Top = 152
    object xDescGrupoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxDescGrupo: TDataSource
    DataSet = xDescGrupo
    Left = 160
    Top = 152
  end
  object xDescEst1: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from est_estadisticas '
      'where estadistica=?estadistica and grupo=?grupo')
    UniDirectional = False
    Left = 40
    Top = 200
    object xDescEst1TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxDescEst1: TDataSource
    DataSet = xDescEst1
    Left = 160
    Top = 200
  end
  object xDescEst2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from est_estadisticas '
      'where estadistica=?estadistica and grupo=?grupo')
    UniDirectional = False
    Left = 40
    Top = 248
    object xDescEst2TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxDescEst2: TDataSource
    DataSet = xDescEst2
    Left = 160
    Top = 248
  end
  object frEstadisticaComp: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 160
    Top = 104
    ReportForm = {19000000}
  end
  object frDBDSEstadistica: TfrDBDataSet
    DataSource = DSQMEstadistica
    Left = 160
    Top = 56
  end
  object xEstadisticaComp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from est_estadisticas'
      'where grupo=?grupo and estadistica=?estadistica')
    UniDirectional = False
    Left = 40
    Top = 104
    object xEstadisticaCompESTADISTICA: TIntegerField
      DisplayLabel = 'Estadistica'
      FieldName = 'ESTADISTICA'
    end
    object xEstadisticaCompGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xEstadisticaCompTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEstadisticaCompNUM_CLAVES: TIntegerField
      DisplayLabel = 'Nro. Claves'
      FieldName = 'NUM_CLAVES'
    end
    object xEstadisticaCompCLAVE_1: TFIBStringField
      DisplayLabel = 'Clave 1'
      FieldName = 'CLAVE_1'
      Size = 31
    end
    object xEstadisticaCompTITULO_1: TFIBStringField
      DisplayLabel = 'Descripcion 1'
      FieldName = 'TITULO_1'
      Size = 25
    end
    object xEstadisticaCompDESC_CLAVE_1: TFIBStringField
      DisplayLabel = 'Descrip. Clave 1'
      FieldName = 'DESC_CLAVE_1'
      Size = 31
    end
    object xEstadisticaCompTITULO_DESC_1: TFIBStringField
      DisplayLabel = 'Descripcion 1'
      FieldName = 'TITULO_DESC_1'
      Size = 25
    end
    object xEstadisticaCompCLAVE_2: TFIBStringField
      DisplayLabel = 'Clave 2'
      FieldName = 'CLAVE_2'
      Size = 31
    end
    object xEstadisticaCompTITULO_2: TFIBStringField
      DisplayLabel = 'Descripcion 2'
      FieldName = 'TITULO_2'
      Size = 25
    end
    object xEstadisticaCompDESC_CLAVE_2: TFIBStringField
      DisplayLabel = 'Descrip. Clave 2'
      FieldName = 'DESC_CLAVE_2'
      Size = 31
    end
    object xEstadisticaCompTITULO_DESC_2: TFIBStringField
      DisplayLabel = 'Descripcion 2'
      FieldName = 'TITULO_DESC_2'
      Size = 25
    end
    object xEstadisticaCompCLAVE_3: TFIBStringField
      DisplayLabel = 'Clave 3'
      FieldName = 'CLAVE_3'
      Size = 31
    end
    object xEstadisticaCompTITULO_3: TFIBStringField
      DisplayLabel = 'Descripcion 3'
      FieldName = 'TITULO_3'
      Size = 25
    end
    object xEstadisticaCompDESC_CLAVE_3: TFIBStringField
      DisplayLabel = 'Descrip. Clave 3'
      FieldName = 'DESC_CLAVE_3'
      Size = 31
    end
    object xEstadisticaCompTITULO_DESC_3: TFIBStringField
      DisplayLabel = 'Descripcion 3'
      FieldName = 'TITULO_DESC_3'
      Size = 25
    end
    object xEstadisticaCompACUMULADOS: TBlobField
      DisplayLabel = 'Acum.'
      FieldName = 'ACUMULADOS'
      Size = 8
    end
    object xEstadisticaCompTABLAS: TBlobField
      DisplayLabel = 'Tablas'
      FieldName = 'TABLAS'
      Size = 8
    end
    object xEstadisticaCompCLAVES: TBlobField
      DisplayLabel = 'Claves'
      FieldName = 'CLAVES'
      Size = 8
    end
    object xEstadisticaCompREGLAS: TBlobField
      DisplayLabel = 'Reglas'
      FieldName = 'REGLAS'
      Size = 8
    end
    object xEstadisticaCompEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEstadisticaCompEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xEstadisticaCompCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xEstadisticaCompSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xEstadisticaCompORDEN_TOTAL: TIntegerField
      DisplayLabel = 'Orden Total'
      FieldName = 'ORDEN_TOTAL'
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
    Left = 392
    Top = 24
  end
end
