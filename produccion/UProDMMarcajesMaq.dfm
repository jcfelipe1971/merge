object ProDMMarcajesMaq: TProDMMarcajesMaq
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 371
  Top = 252
  Height = 481
  Width = 408
  object QMProCabMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
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
    BeforeClose = QMProCabMarcaBeforeClose
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
    end
    object QMProCabMarcaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      OnChange = QMProCabMarcaMAQUINAChange
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
      EditFormat = '!90:00;1;_'
    end
    object QMProCabMarcaRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
    object QMProCabMarcaDescripMaq: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripMaq'
      OnGetText = QMProCabMarcaDescripMaqGetText
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
    Left = 256
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
    UsaNulls = False
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
        'S_FAB,UNIDADES_DEFECTUOSAS,ESTADO,NOTAS,IDTAREA,TIEMPO_DEC,TIPO_' +
        'MARCAJE,ID_ORDEN,TIPO_INCIDENCIA_MAQ, OPERARIO, EFICIENCIA, MOTI' +
        'VO, NO_PRODUCTIVA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?RIG_OF,?' +
        'SUBORDEN,?LINEA_FASE,?LINEA_TAREA,?FECHA_PREV,?FECHA_REAL,?NUM_R' +
        'EF_SAL,?HORA_INICIO,?HORA_FIN,?TIEMPO,?RECURSO,?PRECIO_RECURSO,?' +
        'TIPO_RECURSO,?UNIDADES_FAB,?UNIDADES_DEFECTUOSAS,?ESTADO,?NOTAS,' +
        '?IDTAREA,?TIEMPO_DEC,?TIPO_MARCAJE,?ID_ORDEN,?TIPO_INCIDENCIA_MA' +
        'Q,?OPERARIO,?EFICIENCIA, ?MOTIVO, ?NO_PRODUCTIVA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA'
      'Where empresa=?empresa and'
      '            ejercicio=?ejercicio and'
      '            canal=?canal and'
      '            serie=?serie and'
      '            tipo=?tipo and'
      '            rig=?rig'
      'order by linea')
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
      '  ,NOTAS=?NOTAS '
      '  ,IDTAREA=?IDTAREA '
      '  ,TIEMPO_DEC=?TIEMPO_DEC '
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE '
      '  ,ID_ORDEN = ?ID_ORDEN '
      '  ,TIPO_INCIDENCIA_MAQ = ?TIPO_INCIDENCIA_MAQ '
      '  ,OPERARIO = ?OPERARIO '
      '  ,EFICIENCIA = ?EFICIENCIA'
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
    AfterOpen = QMProDetMarcaAfterOpen
    AfterPost = Graba
    BeforeClose = QMProDetMarcaBeforeClose
    OnCalcFields = QMProDetMarcaCalcFields
    OnNewRecord = QMProDetMarcaNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
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
      DisplayLabel = 'RIG OF'
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
      DisplayFormat = '!00:00;1;_'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
      DisplayFormat = '!00:00;1;_'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
      DisplayFormat = '!00:00;1;_'
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
      OnChange = QMProDetMarcaPRECIO_RECURSOChange
    end
    object QMProDetMarcaTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Rec.'
      FieldName = 'TIPO_RECURSO'
      Size = 3
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
    object QMProDetMarcaDescripFase: TStringField
      DisplayLabel = 'Descripcion Fase'
      FieldKind = fkCalculated
      FieldName = 'DescripFase'
      OnGetText = QMProDetMarcaDescripFaseGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripTarea: TStringField
      DisplayLabel = 'Descripcion Tarea'
      FieldKind = fkCalculated
      FieldName = 'DescripTarea'
      OnGetText = QMProDetMarcaDescripTareaGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripRec: TStringField
      DisplayLabel = 'Descripcion rec.'
      FieldKind = fkCalculated
      FieldName = 'DescripRec'
      OnGetText = QMProDetMarcaDescripRecGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaIDTAREA: TIntegerField
      DisplayLabel = 'ID Tarea'
      FieldName = 'IDTAREA'
      OnChange = QMProDetMarcaIDTAREAChange
    end
    object QMProDetMarcaIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object QMProDetMarcaTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec'
      FieldName = 'TIEMPO_DEC'
      OnChange = QMProDetMarcaTIEMPO_DECChange
    end
    object QMProDetMarcaTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object QMProDetMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
      OnChange = QMProDetMarcaID_ORDENChange
    end
    object QMProDetMarcacOMPUESTO: TStringField
      DisplayLabel = 'Compuesto'
      FieldKind = fkCalculated
      FieldName = 'COMPUESTO'
      OnGetText = QMProDetMarcacOMPUESTOGetText
      Size = 15
      Calculated = True
    end
    object QMProDetMarcaDescCompuesto: TStringField
      DisplayLabel = 'Descripcion Comp.'
      FieldKind = fkCalculated
      FieldName = 'DescCompuesto'
      OnGetText = QMProDetMarcaDescCompuestoGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaTIPO_INCIDENCIA_MAQ: TFIBStringField
      DisplayLabel = 'Incid.'
      FieldName = 'TIPO_INCIDENCIA_MAQ'
      Size = 3
    end
    object QMProDetMarcaDescIncidencia: TStringField
      DisplayLabel = 'Desc. Incidencia'
      FieldKind = fkCalculated
      FieldName = 'DescIncidencia'
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMProDetMarcaTitOperario: TStringField
      DisplayLabel = 'Tit. Operario'
      FieldKind = fkCalculated
      FieldName = 'TitOperario'
      Calculated = True
    end
    object QMProDetMarcaEFICIENCIA: TFloatField
      DisplayLabel = 'Eficiencia'
      FieldName = 'EFICIENCIA'
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
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 136
    Top = 56
  end
  object xTituloFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT FASE'
      'FROM PRO_ORD_FASES'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_FASE = :LINEA_FASE')
    SelectSQL.Strings = (
      'SELECT FASE'
      'FROM PRO_ORD_FASES'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_FASE = :LINEA_FASE')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 200
    object xTituloFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT TAREA'
      'FROM PRO_ORD_TAREA'
      'WHERE '
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_TAREA = :LINEA_TAREA')
    SelectSQL.Strings = (
      'SELECT TAREA'
      'FROM PRO_ORD_TAREA'
      'WHERE '
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_TAREA = :LINEA_TAREA')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 248
    object xTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT tiempo_tot FROM PRO_ORD_CAB_MARCA'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      '           and serie=?serie and tipo=?tipo and rig=?rig')
    SelectSQL.Strings = (
      'SELECT tiempo_tot FROM PRO_ORD_CAB_MARCA'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      '           and serie=?serie and tipo=?tipo and rig=?rig'
      '')
    UniDirectional = False
    DataSource = DSQMProCabMarca
    Left = 32
    Top = 104
    object xInfoActualizadaTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 136
    Top = 104
  end
  object xCompuestoOP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select op.compuesto,art.titulo from pro_ord op'
      
        'join art_articulos art on(art.empresa=op.empresa and art.articul' +
        'o=op.compuesto)'
      'where op.id_orden=?id_orden')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 152
    object xCompuestoOPCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xCompuestoOPTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSCompuestoOP: TDataSource
    DataSet = xCompuestoOP
    Left = 136
    Top = 152
  end
  object QMProCabMarcaI: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'D.LINEA, M.CODMAQ, M.DESCRIPCION AS DESCRIPCION_MAQUINA,'
      
        '       D.FECHA_DET, I.TIPO, I.DESCRIPCION AS DESCRIPCION_TIPO, D' +
        '.HORA_INICIO, D.HORA_FIN, D.TIEMPO'
      'FROM PRO_ORD_CAB_MARCA C'
      
        'JOIN PRO_ORD_DET_MARCA D ON (C.EMPRESA = D.EMPRESA AND C.EJERCIC' +
        'IO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND' +
        ' C.TIPO = D.TIPO AND C.RIG = D.RIG)'
      
        'JOIN SYS_TIPO_INCIDENCIAS_MAQ I ON (I.TIPO = D.TIPO_INCIDENCIA_M' +
        'AQ)'
      'JOIN PRO_MAQUINAS_C M ON (M.CODMAQ = C.MAQUINA)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.TIPO = :TIPO AND'
      'C.RIG = :RIG AND'
      'D.LINEA = :LINEA')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'D.LINEA, M.CODMAQ, M.DESCRIPCION AS DESCRIPCION_MAQUINA,'
      
        '       D.FECHA_DET, I.TIPO TIPO_INCIDENCIA, I.DESCRIPCION AS DES' +
        'CRIPCION_TIPO, D.HORA_INICIO, D.HORA_FIN, D.TIEMPO'
      'FROM PRO_ORD_CAB_MARCA C'
      
        'JOIN PRO_ORD_DET_MARCA D ON (C.EMPRESA = D.EMPRESA AND C.EJERCIC' +
        'IO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND' +
        ' C.TIPO = D.TIPO AND C.RIG = D.RIG)'
      
        'JOIN SYS_TIPO_INCIDENCIAS_MAQ I ON (I.TIPO = D.TIPO_INCIDENCIA_M' +
        'AQ)'
      'JOIN PRO_MAQUINAS_C M ON (M.CODMAQ = C.MAQUINA)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'HM'#39' AND'
      'D.TIPO_INCIDENCIA_MAQ <> '#39#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      '')
    Plan.Strings = (
      ' ')
    BeforeDelete = QMProCabMarcaIBeforeDelete
    BeforeEdit = QMProCabMarcaIBeforeEdit
    BeforeInsert = QMProCabMarcaIBeforeInsert
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CAB_MARCA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 304
    object QMProCabMarcaIEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCabMarcaIEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCabMarcaICANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCabMarcaISERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProCabMarcaITIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProCabMarcaIRIG: TIntegerField
      FieldName = 'RIG'
    end
    object QMProCabMarcaILINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProCabMarcaICODMAQ: TIntegerField
      DisplayLabel = 'Cos. Maq.'
      FieldName = 'CODMAQ'
    end
    object QMProCabMarcaIDESCRIPCION_MAQUINA: TFIBStringField
      DisplayLabel = 'Titulo Maq.'
      FieldName = 'DESCRIPCION_MAQUINA'
      Size = 100
    end
    object QMProCabMarcaIFECHA_DET: TDateTimeField
      DisplayLabel = 'Fecha Det.'
      FieldName = 'FECHA_DET'
    end
    object QMProCabMarcaITIPO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Tipo Incid.'
      FieldName = 'TIPO_INCIDENCIA'
      Size = 3
    end
    object QMProCabMarcaIDESCRIPCION_TIPO: TFIBStringField
      DisplayLabel = 'Descripcion Incid.'
      FieldName = 'DESCRIPCION_TIPO'
      Size = 60
    end
    object QMProCabMarcaIHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
      DisplayFormat = '00:00;1;_'
      EditFormat = '00:00;1;_'
    end
    object QMProCabMarcaIHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin.'
      FieldName = 'HORA_FIN'
      DisplayFormat = '00:00;1;_'
      EditFormat = '00:00;1;_'
    end
    object QMProCabMarcaITIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
      DisplayFormat = '00:00;1;_'
      EditFormat = '00:00;1;_'
    end
  end
  object DSQMProCabMarcaI: TDataSource
    DataSet = QMProCabMarcaI
    Left = 128
    Top = 304
  end
end
