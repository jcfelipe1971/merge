object ZDMEstDatos: TZDMEstDatos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 370
  Top = 169
  Height = 494
  Width = 571
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 472
    Top = 8
  end
  object QMEstadistica: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Select DINAMICA por c'#243'digo*/'
      'SELECT est.*, mes01 as totalperiodo'
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
    Left = 48
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
    object QMEstadisticaMES01: TFloatField
      DisplayLabel = 'Mes 1'
      FieldName = 'MES01'
    end
    object QMEstadisticaMES02: TFloatField
      DisplayLabel = 'Mes 2'
      FieldName = 'MES02'
    end
    object QMEstadisticaMES03: TFloatField
      DisplayLabel = 'Mes 3'
      FieldName = 'MES03'
    end
    object QMEstadisticaMES04: TFloatField
      DisplayLabel = 'Mes 4'
      FieldName = 'MES04'
    end
    object QMEstadisticaMES05: TFloatField
      DisplayLabel = 'Mes 5'
      FieldName = 'MES05'
    end
    object QMEstadisticaMES06: TFloatField
      DisplayLabel = 'Mes 6'
      FieldName = 'MES06'
    end
    object QMEstadisticaMES07: TFloatField
      DisplayLabel = 'Mes 7'
      FieldName = 'MES07'
    end
    object QMEstadisticaMES08: TFloatField
      DisplayLabel = 'Mes 8'
      FieldName = 'MES08'
    end
    object QMEstadisticaMES09: TFloatField
      DisplayLabel = 'Mes 9'
      FieldName = 'MES09'
    end
    object QMEstadisticaMES10: TFloatField
      DisplayLabel = 'Mes 10'
      FieldName = 'MES10'
    end
    object QMEstadisticaMES11: TFloatField
      DisplayLabel = 'Mes 11'
      FieldName = 'MES11'
    end
    object QMEstadisticaMES12: TFloatField
      DisplayLabel = 'Mes 12'
      FieldName = 'MES12'
    end
    object QMEstadisticaTOTALPERIODO: TFloatField
      DisplayLabel = 'Tot. Periodo'
      FieldName = 'TOTALPERIODO'
    end
    object QMEstadisticaCAMPO_AUX_1: TFIBStringField
      DisplayLabel = 'Campo Aux. 1'
      FieldName = 'CAMPO_AUX_1'
      Size = 100
    end
    object QMEstadisticaCAMPO_AUX_2: TFIBStringField
      DisplayLabel = 'Campo Aux. 2'
      FieldName = 'CAMPO_AUX_2'
      Size = 100
    end
    object QMEstadisticaCAMPO_AUX_3: TFIBStringField
      DisplayLabel = 'Campo Aux. 3'
      FieldName = 'CAMPO_AUX_3'
      Size = 100
    end
    object QMEstadisticaCAMPO_AUX_4: TFIBStringField
      DisplayLabel = 'Campo Aux. 4'
      FieldName = 'CAMPO_AUX_4'
      Size = 100
    end
    object QMEstadisticaCAMPO_AUX_5: TFIBStringField
      DisplayLabel = 'Campo Aux. 5'
      FieldName = 'CAMPO_AUX_5'
      Size = 100
    end
  end
  object DSQMEstadistica: TDataSource
    DataSet = QMEstadistica
    Left = 152
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
    AfterOpen = xEstadisticaAfterOpen
    Left = 48
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
    object xEstadisticaCAMPO_AUX_1: TFIBStringField
      DisplayLabel = 'Campo Aux. 1'
      FieldName = 'CAMPO_AUX_1'
      Size = 31
    end
    object xEstadisticaTIT_CAMPO_AUX_1: TFIBStringField
      DisplayLabel = 'Desc. Campo Aux. 1 '
      FieldName = 'TIT_CAMPO_AUX_1'
      Size = 25
    end
    object xEstadisticaCAMPO_AUX_2: TFIBStringField
      DisplayLabel = 'Campo Aux. 2'
      FieldName = 'CAMPO_AUX_2'
      Size = 31
    end
    object xEstadisticaTIT_CAMPO_AUX_2: TFIBStringField
      DisplayLabel = 'Desc. Campo Aux. 2'
      FieldName = 'TIT_CAMPO_AUX_2'
      Size = 25
    end
    object xEstadisticaCAMPO_AUX_3: TFIBStringField
      DisplayLabel = 'Campo Aux. 3'
      FieldName = 'CAMPO_AUX_3'
      Size = 31
    end
    object xEstadisticaTIT_CAMPO_AUX_3: TFIBStringField
      DisplayLabel = 'Desc. Campo Aux. 3'
      FieldName = 'TIT_CAMPO_AUX_3'
      Size = 25
    end
    object xEstadisticaCAMPO_AUX_4: TFIBStringField
      DisplayLabel = 'Campo Aux. 4'
      FieldName = 'CAMPO_AUX_4'
      Size = 31
    end
    object xEstadisticaTIT_CAMPO_AUX_4: TFIBStringField
      DisplayLabel = 'Desc. Campo Aux. 4'
      FieldName = 'TIT_CAMPO_AUX_4'
      Size = 25
    end
    object xEstadisticaCAMPO_AUX_5: TFIBStringField
      DisplayLabel = 'Campo Aux. 5'
      FieldName = 'CAMPO_AUX_5'
      Size = 31
    end
    object xEstadisticaTIT_CAMPO_AUX_5: TFIBStringField
      DisplayLabel = 'Desc. Campo Aux. 5'
      FieldName = 'TIT_CAMPO_AUX_5'
      Size = 25
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
    DataSource = DSxEstadistica
    Left = 48
    Top = 104
    object xDescGrupoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xDescEstadistica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from est_estadisticas '
      'where estadistica=?estadistica and grupo=?grupo')
    UniDirectional = False
    DataSource = DSxEstadistica
    Left = 48
    Top = 152
    object xDescEstadisticaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
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
    Left = 48
    Top = 200
    object xDescPeriodoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxDescGrupo: TDataSource
    DataSet = xDescGrupo
    Left = 152
    Top = 104
  end
  object DSxEstadistica: TDataSource
    DataSet = xEstadistica
    Left = 152
    Top = 56
  end
  object DSxDescEstadistica: TDataSource
    DataSet = xDescEstadistica
    Left = 152
    Top = 152
  end
  object DSxDescPeriodo: TDataSource
    DataSet = xDescPeriodo
    Left = 152
    Top = 200
  end
  object xSelectMes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*CONSULTA DINAMICA*/'
      'select det.articulo AS clave_1, sum(det.unidades)  AS calc'
      '    from ges_cabeceras_s cab'
      
        '    join ges_detalles_s det on (cab.empresa   = det.empresa   an' +
        'd'
      
        '                                cab.ejercicio = det.ejercicio an' +
        'd'
      
        '                                cab.canal     = det.canal     an' +
        'd'
      
        '                                cab.serie     = det.serie     an' +
        'd'
      
        '                                cab.tipo      = det.tipo      an' +
        'd'
      '                                cab.rig       = det.rig) '
      
        '    where cab.empresa=:empresa and cab.ejercicio=:ejercicio and ' +
        'det.articulo=:art '
      
        '      and cab.cliente=:cli and cab.fecha>=:fecha_d and cab.fecha' +
        '<:fecha_h'
      '    group by det.articulo, cab.cliente, det.liquido')
    UniDirectional = False
    Left = 48
    Top = 344
  end
  object frEstadistica: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frEstadisticaGetValue
    OnBeforePrint = frEstadisticaBeforePrint
    OnEnterRect = frEstadisticaBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 360
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDSEstadistica: TfrDBDataSet
    DataSource = DSQMEstadistica
    Left = 264
    Top = 8
  end
  object xEjercicios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ejercicio from emp_ejercicios'
      'where empresa=?empresa and activo=1'
      'order by ejercicio')
    UniDirectional = False
    Left = 48
    Top = 296
    object xEjerciciosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
  end
  object xDescMeses: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_meses'
      'where mes=?mes and idioma=?idioma')
    UniDirectional = False
    Left = 48
    Top = 248
    object xDescMesesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
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
    Left = 472
    Top = 56
  end
end
