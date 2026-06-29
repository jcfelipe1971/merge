object OpeDMSecciones: TOpeDMSecciones
  OldCreateOrder = False
  OnCreate = OpeDMSeccionesCreate
  Left = 431
  Top = 204
  Height = 488
  Width = 474
  object QMSecciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SECCIONES'
      'WHERE'
      '  SECCION=?old_SECCION AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SECCIONES'
      
        '  (EMPRESA,SECCION,DESCRIPCION,NTAREAS,NPERSONAS,TOTAL_REAL,TOTA' +
        'L_POSIBLE,ESTADO_MARCAJE_PEDIDO,MOSTRAR_EN_MAQUINAS,CRITERIO_ORD' +
        'EN,SECUENCIA,HOJA_SIEMPRE_VISIBLE)'
      'VALUES'
      
        '  (?EMPRESA,?SECCION,?DESCRIPCION,?NTAREAS,?NPERSONAS,?TOTAL_REA' +
        'L,?TOTAL_POSIBLE,?ESTADO_MARCAJE_PEDIDO,?MOSTRAR_EN_MAQUINAS,?CR' +
        'ITERIO_ORDEN,?SECUENCIA,?HOJA_SIEMPRE_VISIBLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SECCIONES'
      'WHERE'
      '  SECCION=?SECCION AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SECCIONES '
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY SECCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SECCIONES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,NTAREAS=?NTAREAS '
      '  ,NPERSONAS=?NPERSONAS '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,TOTAL_POSIBLE=?TOTAL_POSIBLE '
      '  ,ESTADO_MARCAJE_PEDIDO=?ESTADO_MARCAJE_PEDIDO'
      '  ,MOSTRAR_EN_MAQUINAS=?MOSTRAR_EN_MAQUINAS'
      '  ,CRITERIO_ORDEN=?CRITERIO_ORDEN'
      '  ,SECUENCIA=?SECUENCIA'
      '  ,HOJA_SIEMPRE_VISIBLE=?HOJA_SIEMPRE_VISIBLE'
      'WHERE'
      '  SECCION=?SECCION AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMSeccionesAfterOpen
    AfterPost = QMSeccionesAfterPost
    BeforeClose = QMSeccionesBeforeClose
    BeforePost = QMSeccionesBeforePost
    OnNewRecord = QMSeccionesNewRecord
    ClavesPrimarias.Strings = (
      'SECCION '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SECCIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMSeccionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeccionesSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMSeccionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMSeccionesNTAREAS: TIntegerField
      DisplayLabel = 'N'#186' Tareas'
      FieldName = 'NTAREAS'
    end
    object QMSeccionesNPERSONAS: TIntegerField
      DisplayLabel = 'N'#186' Personas'
      FieldName = 'NPERSONAS'
    end
    object QMSeccionesTOTAL_REAL: TIntegerField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMSeccionesTOTAL_POSIBLE: TIntegerField
      DisplayLabel = 'Total Posible'
      FieldName = 'TOTAL_POSIBLE'
    end
    object QMSeccionesMOSTRAR_EN_MAQUINAS: TIntegerField
      DisplayLabel = 'Mostrar en Maquinas'
      FieldName = 'MOSTRAR_EN_MAQUINAS'
    end
    object QMSeccionesCAPACITACION: TIntegerField
      DisplayLabel = 'Capacitaci'#243'n'
      FieldName = 'CAPACITACION'
    end
    object QMSeccionesTAREA: TIntegerField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
    end
    object QMSeccionesCRITERIO_ORDEN: TMemoField
      DisplayLabel = 'Cri. Orden'
      FieldName = 'CRITERIO_ORDEN'
      BlobType = ftMemo
      Size = 8
    end
    object QMSeccionesESTADO_MARCAJE_PEDIDO: TIntegerField
      DisplayLabel = 'Estado Marcaje Pedido'
      FieldName = 'ESTADO_MARCAJE_PEDIDO'
    end
    object QMSeccionesSECUENCIA: TIntegerField
      DisplayLabel = 'Secuencia'
      FieldName = 'SECUENCIA'
    end
    object QMSeccionesHOJA_SIEMPRE_VISIBLE: TIntegerField
      DisplayLabel = 'Siempre visible'
      FieldName = 'HOJA_SIEMPRE_VISIBLE'
    end
  end
  object DSQMSecciones: TDataSource
    DataSet = QMSecciones
    Left = 144
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 352
    Top = 8
  end
  object QMSeccionesD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SECCIONES_D'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SECCIONES_D'
      
        '  (SECCION,EMPRESA,LINEA,DESCRIPCION,TOTAL_REAL,TOTAL_POSIBLE,PO' +
        'LIVALENCIA)'
      'VALUES'
      
        '  (?SECCION,?EMPRESA,?LINEA,?DESCRIPCION,?TOTAL_REAL,?TOTAL_POSI' +
        'BLE,?POLIVALENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SECCIONES_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SECCIONES_D'
      'where empresa=?empresa and seccion=?seccion'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SECCIONES_D'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,TOTAL_POSIBLE=?TOTAL_POSIBLE '
      '  ,POLIVALENCIA=?POLIVALENCIA '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    DataSource = DSQMSecciones
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMSeccionesDNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'EMPRESA '
      'SECCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SECCIONES_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMSeccionesDSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMSeccionesDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeccionesDLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMSeccionesDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMSeccionesDTOTAL_REAL: TIntegerField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMSeccionesDTOTAL_POSIBLE: TIntegerField
      DisplayLabel = 'Total Posible'
      FieldName = 'TOTAL_POSIBLE'
    end
    object QMSeccionesDPOLIVALENCIA: TFloatField
      DisplayLabel = 'Polivalencia'
      FieldName = 'POLIVALENCIA'
    end
  end
  object DSQMSeccionesD: TDataSource
    DataSet = QMSeccionesD
    Left = 144
    Top = 56
  end
  object QMTareasD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CAPACITACION_D'
      'WHERE'
      '  TAREA=?old_TAREA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CAPACITACION_D'
      '  (CAPACITACION,TAREA,EMPRESA,SECCION,EMPLEADO)'
      'VALUES'
      '  (?CAPACITACION,?TAREA,?EMPRESA,?SECCION,?EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CAPACITACION_D'
      'WHERE'
      '  TAREA=?TAREA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    SelectSQL.Strings = (
      'SELECT DISTINCT empresa, seccion, empleado '
      'FROM ISO_CAPACITACION_D'
      'where empresa=?empresa and seccion=?seccion /*and tarea=?tarea*/'
      'order by empleado')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CAPACITACION_D'
      'SET'
      '  CAPACITACION=?CAPACITACION '
      'WHERE'
      '  TAREA=?TAREA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMSeccionesDNewRecord
    ClavesPrimarias.Strings = (
      'TAREA '
      'EMPLEADO '
      'EMPRESA '
      'SECCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CAPACITACION_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMTareasDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTareasDSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMTareasDEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
  end
  object DSQMTareasD: TDataSource
    DataSet = QMTareasD
    Left = 144
    Top = 104
  end
  object xVerTareaD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CAPACITACION_D'
      'WHERE'
      '  TAREA=?old_TAREA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CAPACITACION_D'
      '  (CAPACITACION,TAREA,EMPRESA,SECCION,EMPLEADO)'
      'VALUES'
      '  (?CAPACITACION,?TAREA,?EMPRESA,?SECCION,?EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CAPACITACION_D'
      'WHERE'
      '  TAREA=?TAREA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CAPACITACION_D'
      
        'where empresa=?empresa and seccion=?seccion and tarea=?tarea and' +
        ' empleado=?empleado')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CAPACITACION_D'
      'SET'
      '  CAPACITACION=?CAPACITACION '
      'WHERE'
      '  TAREA=?TAREA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    AfterDelete = Graba
    AfterOpen = xVerTareaDAfterOpen
    AfterPost = Graba
    BeforeClose = xVerTareaDBeforeClose
    OnNewRecord = QMSeccionesDNewRecord
    ClavesPrimarias.Strings = (
      'TAREA '
      'EMPLEADO '
      'EMPRESA '
      'SECCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CAPACITACION_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object xVerTareaDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerTareaDEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xVerTareaDSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xVerTareaDTAREA: TIntegerField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
    end
    object xVerTareaDCAPACITACION: TIntegerField
      DisplayLabel = 'Capacitacion'
      FieldName = 'CAPACITACION'
    end
  end
  object xVerEmpleado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?empleado')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMTareasD
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMPLEADOS_EF'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 200
    object xVerEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xVerEmpleadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVerEmpleadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVerEmpleadoNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSxVerTareaD: TDataSource
    DataSet = xVerTareaD
    Left = 144
    Top = 152
  end
  object QMCapacitacionTotales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CAPACITACION_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION AND '
      '  EMPLEADO=?old_EMPLEADO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CAPACITACION_C'
      
        '  (EMPLEADO,SECCION,CAPACITACION,TOTAL_REAL,TOTAL_POSIBLE,EMPRES' +
        'A)'
      'VALUES'
      
        '  (?EMPLEADO,?SECCION,?CAPACITACION,?TOTAL_REAL,?TOTAL_POSIBLE,?' +
        'EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CAPACITACION_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION AND '
      '  EMPLEADO=?EMPLEADO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CAPACITACION_C'
      
        'where empresa=?empresa and seccion=?seccion and empleado=?emplea' +
        'do')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CAPACITACION_C'
      'SET'
      '  CAPACITACION=?CAPACITACION '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,TOTAL_POSIBLE=?TOTAL_POSIBLE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION AND '
      '  EMPLEADO=?EMPLEADO ')
    DataSource = DSQMTareasD
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'SECCION '
      'EMPLEADO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CAPACITACION_C'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 248
    object QMCapacitacionTotalesEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMCapacitacionTotalesSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMCapacitacionTotalesCAPACITACION: TFloatField
      DisplayLabel = 'Capacitacion'
      FieldName = 'CAPACITACION'
    end
    object QMCapacitacionTotalesTOTAL_REAL: TIntegerField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMCapacitacionTotalesTOTAL_POSIBLE: TIntegerField
      DisplayLabel = 'Total Posible'
      FieldName = 'TOTAL_POSIBLE'
    end
    object QMCapacitacionTotalesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object frIsoSeccCapaci: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Capacitacion/Polivalencia'
    RebuildPrinter = False
    OnGetValue = frIsoSeccCapaciGetValue
    OnBeforePrint = frIsoSeccCapaciEnterRect
    OnEnterRect = frIsoSeccCapaciEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 352
    Top = 56
    ReportForm = {19000000}
  end
  object frDBSecciones: TfrDBDataSet
    DataSet = QMSecciones
    Left = 248
    Top = 8
  end
  object frDBSeccionesD: TfrDBDataSet
    DataSet = QMSeccionesD
    Left = 248
    Top = 56
  end
  object frDBTareasD: TfrDBDataSet
    DataSet = QMTareasD
    Left = 248
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 408
    Top = 8
  end
end
