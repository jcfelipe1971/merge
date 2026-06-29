object ZDMEstadisticas: TZDMEstadisticas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 277
  Top = 144
  Height = 342
  Width = 456
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 384
    Top = 8
  end
  object QMGrupo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EST_GRUPOS'
      'WHERE'
      '  GRUPO=?old_GRUPO ')
    InsertSQL.Strings = (
      'INSERT INTO EST_GRUPOS'
      '  (TITULO,GRUPO)'
      'VALUES'
      '  (?TITULO,?GRUPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EST_GRUPOS'
      'WHERE'
      '  GRUPO=?GRUPO ')
    SelectSQL.Strings = (
      'SELECT * FROM EST_GRUPOS'
      'order by grupo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EST_GRUPOS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  GRUPO=?GRUPO ')
    AfterDelete = Graba
    AfterOpen = QMGrupoAfterOpen
    AfterPost = Graba
    AfterScroll = QMGrupoAfterScroll
    BeforePost = QMGrupoBeforePost
    ClavesPrimarias.Strings = (
      'GRUPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EST_GRUPOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMGrupoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMGrupoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMGrupo: TDataSource
    DataSet = QMGrupo
    Left = 136
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EST_ESTADISTICAS'
      'WHERE'
      '  ESTADISTICA=?old_ESTADISTICA ')
    InsertSQL.Strings = (
      'INSERT INTO EST_ESTADISTICAS'
      
        '  (REGLAS,CLAVES,TABLAS,ACUMULADOS,SERIE,NUM_CLAVES,ORDEN_TOTAL,' +
        'CANAL,EJERCICIO,EMPRESA,TITULO,GRUPO,ESTADISTICA,TITULO_DESC_3,D' +
        'ESC_CLAVE_3,TITULO_3,CLAVE_3,TITULO_DESC_2,DESC_CLAVE_2,TITULO_2' +
        ',CLAVE_2,TITULO_DESC_1,DESC_CLAVE_1,TITULO_1,CLAVE_1,CAMPO_AUX_1' +
        ',TIT_CAMPO_AUX_1,CAMPO_AUX_2,TIT_CAMPO_AUX_2,CAMPO_AUX_3,TIT_CAM' +
        'PO_AUX_3,CAMPO_AUX_4,TIT_CAMPO_AUX_4,CAMPO_AUX_5,TIT_CAMPO_AUX_5' +
        ')'
      'VALUES'
      
        '  (?REGLAS,?CLAVES,?TABLAS,?ACUMULADOS,?SERIE,?NUM_CLAVES,?ORDEN' +
        '_TOTAL,?CANAL,?EJERCICIO,?EMPRESA,?TITULO,?GRUPO,?ESTADISTICA,?T' +
        'ITULO_DESC_3,?DESC_CLAVE_3,?TITULO_3,?CLAVE_3,?TITULO_DESC_2,?DE' +
        'SC_CLAVE_2,?TITULO_2,?CLAVE_2,?TITULO_DESC_1,?DESC_CLAVE_1,?TITU' +
        'LO_1,?CLAVE_1,?CAMPO_AUX_1,?TIT_CAMPO_AUX_1,?CAMPO_AUX_2,?TIT_CA' +
        'MPO_AUX_2,?CAMPO_AUX_3,?TIT_CAMPO_AUX_3,?CAMPO_AUX_4,?TIT_CAMPO_' +
        'AUX_4,?CAMPO_AUX_5,?TIT_CAMPO_AUX_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EST_ESTADISTICAS'
      'WHERE'
      '  ESTADISTICA=?ESTADISTICA ')
    SelectSQL.Strings = (
      'SELECT * FROM EST_ESTADISTICAS'
      'where grupo=?grupo'
      'order by estadistica')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EST_ESTADISTICAS'
      'SET'
      '  REGLAS=?REGLAS '
      '  ,CLAVES=?CLAVES '
      '  ,TABLAS=?TABLAS '
      '  ,ACUMULADOS=?ACUMULADOS '
      '  ,SERIE=?SERIE '
      '  ,NUM_CLAVES=?NUM_CLAVES '
      '  ,ORDEN_TOTAL=?ORDEN_TOTAL '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      '  ,GRUPO=?GRUPO '
      '  ,TITULO_DESC_3=?TITULO_DESC_3 '
      '  ,DESC_CLAVE_3=?DESC_CLAVE_3 '
      '  ,TITULO_3=?TITULO_3 '
      '  ,CLAVE_3=?CLAVE_3 '
      '  ,TITULO_DESC_2=?TITULO_DESC_2 '
      '  ,DESC_CLAVE_2=?DESC_CLAVE_2 '
      '  ,TITULO_2=?TITULO_2 '
      '  ,CLAVE_2=?CLAVE_2 '
      '  ,TITULO_DESC_1=?TITULO_DESC_1 '
      '  ,DESC_CLAVE_1=?DESC_CLAVE_1 '
      '  ,TITULO_1=?TITULO_1 '
      '  ,CLAVE_1=?CLAVE_1 '
      '  ,CAMPO_AUX_1=?CAMPO_AUX_1 '
      '  ,TIT_CAMPO_AUX_1=?TIT_CAMPO_AUX_1 '
      '  ,CAMPO_AUX_2=?CAMPO_AUX_2 '
      '  ,TIT_CAMPO_AUX_2=?TIT_CAMPO_AUX_2 '
      '  ,CAMPO_AUX_3=?CAMPO_AUX_3 '
      '  ,TIT_CAMPO_AUX_3=?TIT_CAMPO_AUX_3 '
      '  ,CAMPO_AUX_4=?CAMPO_AUX_4 '
      '  ,TIT_CAMPO_AUX_4=?TIT_CAMPO_AUX_4 '
      '  ,CAMPO_AUX_5=?CAMPO_AUX_5 '
      '  ,TIT_CAMPO_AUX_5=?TIT_CAMPO_AUX_5 '
      'WHERE'
      '  ESTADISTICA=?ESTADISTICA ')
    DataSource = DSQMGrupo
    AfterCancel = DesactivaEstadistica
    AfterDelete = DesactivaEstadistica
    AfterOpen = QMDetalleAfterOpen
    AfterPost = DesactivaEstadistica
    AfterScroll = QMDetalleAfterScroll
    BeforeEdit = ActivaEstadistica
    BeforeInsert = ActivaEstadistica
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ESTADISTICA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EST_ESTADISTICAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMDetalleESTADISTICA: TIntegerField
      DisplayLabel = 'Estadistica'
      FieldName = 'ESTADISTICA'
    end
    object QMDetalleGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMDetalleNUM_CLAVES: TIntegerField
      DisplayLabel = 'Num. Claves'
      FieldName = 'NUM_CLAVES'
    end
    object QMDetalleCLAVE_1: TFIBStringField
      DisplayLabel = 'Clave 1'
      FieldName = 'CLAVE_1'
      Size = 31
    end
    object QMDetalleTITULO_1: TFIBStringField
      DisplayLabel = 'Titulo 1'
      FieldName = 'TITULO_1'
      Size = 25
    end
    object QMDetalleDESC_CLAVE_1: TFIBStringField
      DisplayLabel = 'Desc. Clave 1'
      FieldName = 'DESC_CLAVE_1'
      Size = 31
    end
    object QMDetalleTITULO_DESC_1: TFIBStringField
      DisplayLabel = 'Titulo Desc. 1'
      FieldName = 'TITULO_DESC_1'
      Size = 25
    end
    object QMDetalleCLAVE_2: TFIBStringField
      DisplayLabel = 'Clave 2'
      FieldName = 'CLAVE_2'
      Size = 31
    end
    object QMDetalleTITULO_2: TFIBStringField
      DisplayLabel = 'Titulo 2'
      FieldName = 'TITULO_2'
      Size = 25
    end
    object QMDetalleDESC_CLAVE_2: TFIBStringField
      DisplayLabel = 'Desc. Clave 2'
      FieldName = 'DESC_CLAVE_2'
      Size = 31
    end
    object QMDetalleTITULO_DESC_2: TFIBStringField
      DisplayLabel = 'Titulo Desc. 2'
      FieldName = 'TITULO_DESC_2'
      Size = 25
    end
    object QMDetalleCLAVE_3: TFIBStringField
      DisplayLabel = 'Clave 3'
      FieldName = 'CLAVE_3'
      Size = 31
    end
    object QMDetalleTITULO_3: TFIBStringField
      DisplayLabel = 'Titulo 3'
      FieldName = 'TITULO_3'
      Size = 25
    end
    object QMDetalleDESC_CLAVE_3: TFIBStringField
      DisplayLabel = 'Desc. Clave 3'
      FieldName = 'DESC_CLAVE_3'
      Size = 31
    end
    object QMDetalleTITULO_DESC_3: TFIBStringField
      DisplayLabel = 'Titulo Desc. 3'
      FieldName = 'TITULO_DESC_3'
      Size = 25
    end
    object QMDetalleCAMPO_AUX_1: TFIBStringField
      DisplayLabel = 'Campo Aux. 1'
      FieldName = 'CAMPO_AUX_1'
      Size = 31
    end
    object QMDetalleTIT_CAMPO_AUX_1: TFIBStringField
      DisplayLabel = 'Titulo Campo Aux. 1'
      FieldName = 'TIT_CAMPO_AUX_1'
      Size = 25
    end
    object QMDetalleCAMPO_AUX_2: TFIBStringField
      DisplayLabel = 'Campo Aux. 2'
      FieldName = 'CAMPO_AUX_2'
      Size = 31
    end
    object QMDetalleTIT_CAMPO_AUX_2: TFIBStringField
      DisplayLabel = 'Titulo Campo Aux. 2'
      FieldName = 'TIT_CAMPO_AUX_2'
      Size = 25
    end
    object QMDetalleCAMPO_AUX_3: TFIBStringField
      DisplayLabel = 'Campo Aux. 3'
      FieldName = 'CAMPO_AUX_3'
      Size = 31
    end
    object QMDetalleTIT_CAMPO_AUX_3: TFIBStringField
      DisplayLabel = 'Titulo Campo Aux. 3'
      FieldName = 'TIT_CAMPO_AUX_3'
      Size = 25
    end
    object QMDetalleCAMPO_AUX_4: TFIBStringField
      DisplayLabel = 'Campo Aux. 4'
      FieldName = 'CAMPO_AUX_4'
      Size = 31
    end
    object QMDetalleTIT_CAMPO_AUX_4: TFIBStringField
      DisplayLabel = 'Titulo Campo Aux. 4'
      FieldName = 'TIT_CAMPO_AUX_4'
      Size = 25
    end
    object QMDetalleCAMPO_AUX_5: TFIBStringField
      DisplayLabel = 'Campo Aux. 5'
      FieldName = 'CAMPO_AUX_5'
      Size = 31
    end
    object QMDetalleTIT_CAMPO_AUX_5: TFIBStringField
      DisplayLabel = 'Titulo Campo Aux. 5'
      FieldName = 'TIT_CAMPO_AUX_5'
      Size = 25
    end
    object QMDetalleACUMULADOS: TBlobField
      DisplayLabel = 'Acumulados'
      FieldName = 'ACUMULADOS'
      Size = 8
    end
    object QMDetalleTABLAS: TBlobField
      DisplayLabel = 'Tablas'
      FieldName = 'TABLAS'
      Size = 8
    end
    object QMDetalleCLAVES: TBlobField
      DisplayLabel = 'claves'
      FieldName = 'CLAVES'
      Size = 8
    end
    object QMDetalleREGLAS: TBlobField
      DisplayLabel = 'Reglas'
      FieldName = 'REGLAS'
      Size = 8
    end
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleORDEN_TOTAL: TIntegerField
      DisplayLabel = 'Orden Total'
      FieldName = 'ORDEN_TOTAL'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 136
    Top = 56
  end
  object QDuplicaEst: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure est_duplica_estadistica (?grupo, ?estadistica)' +
        ';')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 104
  end
  object xEmpresas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select empresa, titulo from sys_empresas'
      'order by empresa')
    UniDirectional = False
    Left = 48
    Top = 104
    object xEmpresasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEmpresasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
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
    Top = 152
    object xEjerciciosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select canal from emp_canales '
      '  where empresa=?empresa and ejercicio=?ejercicio and activo=1'
      '  order by canal')
    UniDirectional = False
    Left = 48
    Top = 200
    object xCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select distinct serie '
      'from emp_series'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and '
      'activo=1'
      'order by serie')
    UniDirectional = False
    Left = 48
    Top = 248
    object xSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object DSxEmpresas: TDataSource
    DataSet = xEmpresas
    Left = 136
    Top = 104
  end
  object DSxEjercicios: TDataSource
    DataSet = xEjercicios
    Left = 136
    Top = 152
  end
  object DSxCanales: TDataSource
    DataSet = xCanales
    Left = 136
    Top = 200
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 136
    Top = 248
  end
  object SPMaxGrupo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(grupo) from est_grupos')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 8
  end
  object SPMaxEstadistica: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(estadistica) from est_estadisticas')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 56
  end
end
