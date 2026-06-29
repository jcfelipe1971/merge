object ProDMMarcajesOpe: TProDMMarcajesOpe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 507
  Top = 103
  Height = 548
  Width = 370
  object QMProCabMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CAB_MARCA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,OPERARIO,MAQUINA,PROVE' +
        'EDOR,VARIOS,FECHA,TIEMPO_TOT)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?OPERARIO,?MAQUI' +
        'NA,?PROVEEDOR,?VARIOS,?FECHA,?TIEMPO_TOT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO'
      'ORDER BY FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CAB_MARCA'
      'SET'
      '  OPERARIO=?OPERARIO '
      '  ,MAQUINA=?MAQUINA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,VARIOS=?VARIOS '
      '  ,FECHA=?FECHA '
      '  ,TIEMPO_TOT=?TIEMPO_TOT '
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterOpen = QMProCabMarcaAfterOpen
    AfterPost = Graba
    AfterScroll = QMProCabMarcaAfterScroll
    OnNewRecord = QMProCabMarcaNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CAB_MARCA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 8
    object QMProCabMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCabMarcaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCabMarcaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCabMarcaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProCabMarcaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProCabMarcaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMProCabMarcaOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
      OnChange = QMProCabMarcaOPERARIOChange
    end
    object QMProCabMarcaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMProCabMarcaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProCabMarcaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProCabMarcaTIEMPO_TOT: TFloatField
      DisplayLabel = 'T.Tiempo'
      FieldName = 'TIEMPO_TOT'
    end
    object QMProCabMarcaRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
    object QMProCabMarcaDescripOpe: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripOpe'
      OnGetText = QMProCabMarcaDescripOpeGetText
      Size = 60
      Calculated = True
    end
    object QMProCabMarcaVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 3
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 264
    Top = 8
  end
  object DSQMProCabMarca: TDataSource
    DataSet = QMProCabMarca
    Left = 136
    Top = 8
  end
  object QMProDetMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_DET_MARCA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,RIG_OF,SUBORDEN,' +
        'LINEA_FASE,LINEA_TAREA,FECHA_PREV,FECHA_REAL,NUM_REF_SAL,HORA_IN' +
        'ICIO,HORA_FIN,TIEMPO,RECURSO,PRECIO_RECURSO,TIPO_RECURSO,UNIDADE' +
        'S_FAB,UNIDADES_DEFECTUOSAS,ESTADO,NOTAS,IDTAREA,TIEMPO_DEC,IMPUT' +
        'ACION,CANTIDAD,TIPO_MARCAJE,id_orden, MOTIVO, NO_PRODUCTIVA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?RIG_OF,?' +
        'SUBORDEN,?LINEA_FASE,?LINEA_TAREA,?FECHA_PREV,?FECHA_REAL,?NUM_R' +
        'EF_SAL,?HORA_INICIO,?HORA_FIN,?TIEMPO,?RECURSO,?PRECIO_RECURSO,?' +
        'TIPO_RECURSO,?UNIDADES_FAB,?UNIDADES_DEFECTUOSAS,?ESTADO,?NOTAS,' +
        '?IDTAREA,?TIEMPO_DEC,?IMPUTACION,?CANTIDAD,?TIPO_MARCAJE, ?id_or' +
        'den, ?MOTIVO, ?NO_PRODUCTIVA)')
    RefreshSQL.Strings = (
      
        'select m.*, p.descripcion descripcion_imp, r.titulo descripcion_' +
        'rec, t.tarea descripcion_tarea, f.fase descripcion_fase'
      'from pro_ord_det_marca m'
      
        'left join ope_empleado_pre p on m.empresa = p.empresa and m.oper' +
        'ario = p.empleado and m.imputacion = p.imputacion'
      
        'left join pro_recursos r on m.empresa = r.empresa and m.recurso ' +
        '= r.recurso'
      
        'left join pro_ord_tarea t on t.empresa = m.empresa and t.ejercic' +
        'io = m.ejercicio and t.canal = m.canal and t.serie = m.serie and' +
        ' t.rig_of = m.rig_of and t.linea_fase = m.linea_fase and t.linea' +
        '_tarea = m.linea_tarea'
      
        'left join pro_ord_fases f on f.empresa = m.empresa and f.ejercic' +
        'io = m.ejercicio and f.canal = m.canal and f.series = m.serie an' +
        'd f.rig_of = m.rig_of and f.linea_fase = m.linea_fase'
      'where'
      'm.empresa = :empresa and'
      'm.ejercicio = :ejercicio and'
      'm.canal = :canal and'
      'm.serie = :serie and'
      'm.tipo = :tipo and'
      'm.rig = :rig and'
      'm.linea = :linea')
    SelectSQL.Strings = (
      
        'select m.*, p.descripcion descripcion_imp, r.titulo descripcion_' +
        'rec, t.tarea descripcion_tarea, f.fase descripcion_fase'
      'from pro_ord_det_marca m'
      
        'left join ope_empleado_pre p on m.empresa = p.empresa and m.oper' +
        'ario = p.empleado and m.imputacion = p.imputacion'
      
        'left join pro_recursos r on m.empresa = r.empresa and m.recurso ' +
        '= r.recurso'
      
        'left join pro_ord_tarea t on t.empresa = m.empresa and t.ejercic' +
        'io = m.ejercicio and t.canal = m.canal and t.serie = m.serie and' +
        ' t.rig_of = m.rig_of and t.linea_fase = m.linea_fase and t.linea' +
        '_tarea = m.linea_tarea'
      
        'left join pro_ord_fases f on f.empresa = m.empresa and f.ejercic' +
        'io = m.ejercicio and f.canal = m.canal and f.series = m.serie an' +
        'd f.rig_of = m.rig_of and f.linea_fase = m.linea_fase'
      'where'
      'm.empresa = :empresa and'
      'm.ejercicio = :ejercicio and'
      'm.canal = :canal and'
      'm.serie = :serie and'
      'm.tipo = :tipo and'
      'm.rig = :rig'
      'order by m.linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_DET_MARCA'
      'SET'
      '  RIG_OF=?RIG_OF '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,FECHA_PREV=?FECHA_PREV '
      '  ,FECHA_REAL=?FECHA_REAL '
      '  ,NUM_REF_SAL=?NUM_REF_SAL '
      '  ,HORA_INICIO=?HORA_INICIO '
      '  ,HORA_FIN=?HORA_FIN '
      '  ,TIEMPO=?TIEMPO '
      '  ,RECURSO=?RECURSO '
      '  ,PRECIO_RECURSO=?PRECIO_RECURSO '
      '  ,TIPO_RECURSO=?TIPO_RECURSO '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_DEFECTUOSAS=?UNIDADES_DEFECTUOSAS '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS'
      '  ,IDTAREA=?IDTAREA '
      '  ,TIEMPO_DEC=?TIEMPO_DEC'
      '  ,IMPUTACION=?IMPUTACION'
      '  ,CANTIDAD=?CANTIDAD'
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE'
      '  ,ID_ORDEN = ?ID_ORDEN'
      '  ,MOTIVO = ?MOTIVO'
      '  ,NO_PRODUCTIVA = ?NO_PRODUCTIVA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProCabMarca
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMProDetMarcaNewRecord
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_MARCA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 56
    object QMProDetMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetMarcaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProDetMarcaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProDetMarcaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProDetMarcaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProDetMarcaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMProDetMarcaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetMarcaRIG_OF: TIntegerField
      DisplayLabel = 'Rig_of'
      FieldName = 'RIG_OF'
    end
    object QMProDetMarcaSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProDetMarcaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
      OnChange = QMProDetMarcaLINEA_FASEChange
    end
    object QMProDetMarcaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
      OnChange = QMProDetMarcaLINEA_TAREAChange
    end
    object QMProDetMarcaFECHA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Prevista'
      FieldName = 'FECHA_PREV'
    end
    object QMProDetMarcaFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fecha Real'
      FieldName = 'FECHA_REAL'
    end
    object QMProDetMarcaNUM_REF_SAL: TIntegerField
      DisplayLabel = 'Ref. Salida'
      FieldName = 'NUM_REF_SAL'
    end
    object QMProDetMarcaHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Inicio'
      FieldName = 'HORA_INICIO'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMProDetMarcaRECURSOChange
      Size = 5
    end
    object QMProDetMarcaPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object QMProDetMarcaTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object QMProDetMarcaUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fabricadas'
      FieldName = 'UNIDADES_FAB'
    end
    object QMProDetMarcaUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Unid. Defectuosas'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMProDetMarcaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProDetMarcaNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProDetMarcaTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Recurso'
      FieldName = 'TOTAL_RECURSO'
    end
    object QMProDetMarcaIDTAREA: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDTAREA'
      OnChange = QMProDetMarcaIDTAREAChange
    end
    object QMProDetMarcaTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
      OnChange = QMProDetMarcaTIEMPO_DECChange
    end
    object QMProDetMarcaIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      OnChange = QMProDetMarcaIMPUTACIONChange
      Size = 3
    end
    object QMProDetMarcaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      OnChange = QMProDetMarcaCANTIDADChange
    end
    object QMProDetMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMProDetMarcaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMProDetMarcaNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object QMProDetMarcaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProDetMarcaTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object QMProDetMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
      OnChange = QMProDetMarcaID_ORDENChange
    end
    object QMProDetMarcaMOTIVO: TFIBStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Size = 35
    end
    object QMProDetMarcaNO_PRODUCTIVA: TIntegerField
      DisplayLabel = 'No productiva'
      FieldName = 'NO_PRODUCTIVA'
    end
    object QMProDetMarcaDESCRIPCION_IMP: TFIBStringField
      DisplayLabel = 'Descrip. Imp.'
      FieldName = 'DESCRIPCION_IMP'
      Size = 40
    end
    object QMProDetMarcaDESCRIPCION_REC: TFIBStringField
      DisplayLabel = 'Descrip. Recurso'
      FieldName = 'DESCRIPCION_REC'
      Size = 40
    end
    object QMProDetMarcaDESCRIPCION_TAREA: TFIBStringField
      DisplayLabel = 'Descrip. Tarea'
      FieldName = 'DESCRIPCION_TAREA'
      Size = 60
    end
    object QMProDetMarcaDESCRIPCION_FASE: TFIBStringField
      DisplayLabel = 'Descrip. Fase'
      FieldName = 'DESCRIPCION_FASE'
      Size = 60
    end
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 136
    Top = 56
  end
  object DSxRecurso: TDataSource
    DataSet = xRecurso
    Left = 136
    Top = 200
  end
  object xRecurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Titulo'
      'From Pro_Recursos'
      'Where Empresa=?Empresa and Recurso=?Recurso')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 200
    object xRecursoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xTituloFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Fase'
      'From Pro_Ord_Fases'
      'Where ((Linea_Fase=?Linea_Fase) and'
      '             (Rig_Of=?Rig_Of))')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 104
    object xTituloFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
  end
  object DSxTituloFase: TDataSource
    DataSet = xTituloFase
    Left = 136
    Top = 104
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Tarea'
      'From Pro_Ord_Tarea'
      'Where ((Linea_Tarea=?Linea_Tarea) and'
      '             (Rig_Of=?Rig_Of))')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 152
    object xTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 136
    Top = 152
  end
  object xOperario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select st.nombre_r_social'
      'from OPE_EMPLEADO te , sys_terceros st '
      'where (te.Empleado=?Operario) and'
      ' (te.tercero=st.tercero)'
      '')
    UniDirectional = False
    DataSource = DSQMProCabMarca
    Left = 32
    Top = 296
    object xOperarioNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxOperario: TDataSource
    DataSet = xOperario
    Left = 136
    Top = 296
  end
  object xSubOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select SubOrden From Pro_Ord'
      'Where Empresa=:Empresa and'
      '           Ejercicio=:Ejercicio and'
      '           Canal=:Canal and'
      '           Series=:Serie and'
      '           Rig_Of=:RIG_OF')
    UniDirectional = False
    Left = 32
    Top = 344
    object xSubOrdenSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
  end
  object DSxSubOrden: TDataSource
    DataSet = xSubOrden
    Left = 136
    Top = 344
  end
  object xDatosTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_TAREA '
      'WHERE '
      'IDENTIFICADOR = :IDENTIFICADOR')
    UniDirectional = False
    Left = 32
    Top = 248
    object xDatosTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDatosTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDatosTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDatosTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDatosTareaRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xDatosTareaSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xDatosTareaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xDatosTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xDatosTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xDatosTareaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xDatosTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xDatosTareaCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xDatosTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object xDatosTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDatosTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Previsto'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object xDatosTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Previsto'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object xDatosTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Previsto'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object xDatosTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Previsto Horas'
      FieldName = 'TOTAL_PRE'
    end
    object xDatosTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xDatosTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xDatosTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xDatosTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xDatosTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDatosTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xDatosTareaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSxDatosTarea: TDataSource
    DataSet = xDatosTarea
    Left = 136
    Top = 248
  end
  object xTipoImputacionH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select impu.tipo_imputacion,timputa.horas from ope_sys_imputacio' +
        'n impu'
      
        'join ope_sys_tipos_imputacion timputa on (impu.tipo_imputacion=t' +
        'imputa.tipo_imputacion) '
      'where imputacion=?imputacion')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 440
    object xTipoImputacionHTIPO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPO_IMPUTACION'
      Size = 3
    end
    object xTipoImputacionHHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
  end
end
