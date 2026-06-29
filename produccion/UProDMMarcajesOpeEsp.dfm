object ProDMMarcajesOpeEsp: TProDMMarcajesOpeEsp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 821
  Top = 245
  Height = 548
  Width = 370
  object QMProCabMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD_CAB_MARCA'
      '  (EMPRESA,'
      
        'EJERCICIO,CANAL,SERIE,TIPO,RIG,OPERARIO,MAQUINA,PROVEEDOR,VARIOS' +
        ',FECHA,'
      
        'TIEMPO_TOT,RIG_OFF,ID_ORDEN,TIPOFASE,NOMBRE_R_SOCIAL,TIPOIMPUTAC' +
        'ION,DESCRIPCION_MAQ)'
      'VALUES'
      '  (?EMPRESA,'
      
        '?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?OPERARIO,?MAQUINA,?PROVEEDO' +
        'R,?VARIOS,?FECHA,'
      
        '?TIEMPO_TOT,?RIG_OFF,?ID_ORDEN,?TIPOFASE,?NOMBRE_R_SOCIAL,?TIPOI' +
        'MPUTACION,?DESCRIPCION_MAQ)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_CAB_MARCA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO'
      'ORDER BY FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD_CAB_MARCA'
      'SET'
      '  OPERARIO=?OPERARIO '
      '  ,MAQUINA=?MAQUINA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,VARIOS=?VARIOS '
      '  ,FECHA=?FECHA '
      '  ,TIEMPO_TOT=?TIEMPO_TOT '
      '  ,RIG_OFF=?RIG_OFF '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,TIPOIMPUTACION=?TIPOIMPUTACION '
      '  ,DESCRIPCION_MAQ=?DESCRIPCION_MAQ '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    Plan.Strings = (
      ' ')
    AfterOpen = QMProCabMarcaAfterOpen
    BeforeClose = QMProCabMarcaBeforeClose
    OnNewRecord = QMProCabMarcaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'TIPO'
      'RIG')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRO_ORD_CAB_MARCA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
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
    object QMProCabMarcaVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 3
    end
    object QMProCabMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProCabMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMProCabMarcaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Empl.'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProCabMarcaTIPOIMPUTACION: TIntegerField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPOIMPUTACION'
    end
    object QMProCabMarcaDESCRIPCION_MAQ: TFIBStringField
      DisplayLabel = 'Desc. Maquina'
      FieldName = 'DESCRIPCION_MAQ'
      Size = 100
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 288
    Top = 8
  end
  object DSQMProCabMarca: TDataSource
    DataSet = QMProCabMarca
    Left = 152
    Top = 8
  end
  object QMProDetMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1025
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
        'ACION,ENTRADA,NUEVA_TAREA, TIPOFASE, TIPOTAREA,CANTIDAD,TIPO_MAR' +
        'CAJE,ID_ORDEN)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?RIG_OF,?' +
        'SUBORDEN,?LINEA_FASE,?LINEA_TAREA,?FECHA_PREV,?FECHA_REAL,?NUM_R' +
        'EF_SAL,?HORA_INICIO,?HORA_FIN,?TIEMPO,?RECURSO,?PRECIO_RECURSO,?' +
        'TIPO_RECURSO,?UNIDADES_FAB,?UNIDADES_DEFECTUOSAS,?ESTADO,?NOTAS,' +
        '?IDTAREA,?TIEMPO_DEC,?IMPUTACION,?ENTRADA,?NUEVA_TAREA, ?TIPOFAS' +
        'E, ?TIPOTAREA,?CANTIDAD,?TIPO_MARCAJE,?ID_ORDEN)')
    RefreshSQL.Strings = (
      
        'SELECT D.*, F.TITULO TITULO_FASE, T.TITULO TITULO_TAREA, R.TITUL' +
        'O TITULO_RECURSO, P.DESCRIPCION TITULO_IMPUTACION,'
      '       P.IMPORTE, I.TIPO_IMPUTACION, TI.HORAS'
      'FROM PRO_ORD_DET_MARCA D'
      'LEFT JOIN PRO_SYS_FASES F ON D.TIPOFASE = F.FASE'
      
        'LEFT JOIN PRO_SYS_TAREAS T ON D.EMPRESA = T.EMPRESA AND D.TIPOTA' +
        'REA = T.TAREA'
      
        'LEFT JOIN PRO_RECURSOS R ON D.EMPRESA = R.EMPRESA AND D.RECURSO ' +
        '= R.RECURSO'
      
        'LEFT JOIN PRO_ORD_CAB_MARCA C ON D.EMPRESA = C.EMPRESA AND D.EJE' +
        'RCICIO = C.EJERCICIO AND D.CANAL = C.CANAL AND D.SERIE = C.SERIE' +
        ' AND D.TIPO = C.TIPO AND D.RIG = C.RIG'
      
        'LEFT JOIN OPE_EMPLEADO_PRE P ON P.EMPRESA = D.EMPRESA AND P.EMPL' +
        'EADO = D.OPERARIO AND P.IMPUTACION = D.IMPUTACION'
      'LEFT JOIN OPE_SYS_IMPUTACION I ON D.IMPUTACION = I.IMPUTACION'
      
        'LEFT JOIN OPE_SYS_TIPOS_IMPUTACION TI ON I.TIPO_IMPUTACION = TI.' +
        'TIPO_IMPUTACION'
      'WHERE'
      'D.EMPRESA = ?EMPRESA AND'
      'D.EJERCICIO = ?EJERCICIO AND'
      'D.CANAL = ?CANAL AND'
      'D.SERIE = ?SERIE AND'
      'D.TIPO = ?TIPO AND'
      'D.RIG = ?RIG AND'
      'D.LINEA = ?LINEA')
    SelectSQL.Strings = (
      
        'SELECT D.*, F.TITULO TITULO_FASE, T.TITULO TITULO_TAREA, R.TITUL' +
        'O TITULO_RECURSO, P.DESCRIPCION TITULO_IMPUTACION,'
      '       P.IMPORTE, I.TIPO_IMPUTACION, TI.HORAS'
      'FROM PRO_ORD_DET_MARCA D'
      'LEFT JOIN PRO_SYS_FASES F ON D.TIPOFASE = F.FASE'
      
        'LEFT JOIN PRO_SYS_TAREAS T ON D.EMPRESA = T.EMPRESA AND D.TIPOTA' +
        'REA = T.TAREA'
      
        'LEFT JOIN PRO_RECURSOS R ON D.EMPRESA = R.EMPRESA AND D.RECURSO ' +
        '= R.RECURSO'
      
        'LEFT JOIN PRO_ORD_CAB_MARCA C ON D.EMPRESA = C.EMPRESA AND D.EJE' +
        'RCICIO = C.EJERCICIO AND D.CANAL = C.CANAL AND D.SERIE = C.SERIE' +
        ' AND D.TIPO = C.TIPO AND D.RIG = C.RIG'
      
        'LEFT JOIN OPE_EMPLEADO_PRE P ON P.EMPRESA = D.EMPRESA AND P.EMPL' +
        'EADO = D.OPERARIO AND P.IMPUTACION = D.IMPUTACION'
      'LEFT JOIN OPE_SYS_IMPUTACION I ON D.IMPUTACION = I.IMPUTACION'
      
        'LEFT JOIN OPE_SYS_TIPOS_IMPUTACION TI ON I.TIPO_IMPUTACION = TI.' +
        'TIPO_IMPUTACION'
      'WHERE'
      'D.EMPRESA = ?EMPRESA AND'
      'D.EJERCICIO = ?EJERCICIO AND'
      'D.CANAL = ?CANAL AND'
      'D.SERIE = ?SERIE AND'
      'D.TIPO = ?TIPO AND'
      'D.RIG = ?RIG'
      'ORDER BY D.LINEA'
      '')
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
      '  ,ENTRADA=?ENTRADA'
      '  ,NUEVA_TAREA=?NUEVA_TAREA'
      '  ,TIPOFASE=?TIPOFASE'
      '  ,TIPOTAREA=?TIPOTAREA'
      '  ,CANTIDAD=?CANTIDAD'
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE'
      '  ,ID_ORDEN=?ID_ORDEN'
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
    AfterPost = QMProDetMarcaAfterPost
    OnNewRecord = QMProDetMarcaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_MARCA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
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
      DisplayLabel = 'Id.'
      FieldName = 'IDTAREA'
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
    object QMProDetMarcaNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object QMProDetMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      OnChange = QMProDetMarcaTIPOFASEChange
      Size = 3
    end
    object QMProDetMarcaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      OnChange = QMProDetMarcaTIPOTAREAChange
      Size = 3
    end
    object QMProDetMarcaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProDetMarcaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      OnChange = QMProDetMarcaCANTIDADChange
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
    object QMProDetMarcaTITULO_FASE: TFIBStringField
      DisplayLabel = 'Titulo Fase'
      FieldName = 'TITULO_FASE'
      Size = 40
    end
    object QMProDetMarcaTITULO_TAREA: TFIBStringField
      DisplayLabel = 'Titulo Fase'
      FieldName = 'TITULO_TAREA'
      Size = 40
    end
    object QMProDetMarcaTITULO_RECURSO: TFIBStringField
      DisplayLabel = 'Titulo Recurso'
      FieldName = 'TITULO_RECURSO'
      Size = 40
    end
    object QMProDetMarcaTITULO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Titulo Imputacion'
      FieldName = 'TITULO_IMPUTACION'
      Size = 40
    end
    object QMProDetMarcaTIPO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPO_IMPUTACION'
      Size = 3
    end
    object QMProDetMarcaHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 152
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 288
    Top = 56
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT TIEMPO_TOT FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG '
      '')
    SelectSQL.Strings = (
      'SELECT TIEMPO_TOT FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    UniDirectional = False
    DataSource = DSQMProCabMarca
    Left = 48
    Top = 104
    object xInfoActualizadaTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 152
    Top = 104
  end
end
