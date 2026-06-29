object ProDMMarcajesMaqEspTurno: TProDMMarcajesMaqEspTurno
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 882
  Top = 263
  Height = 583
  Width = 578
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
        'EDOR,VARIOS,FECHA,TIEMPO_TOT,ID_ORDEN,TIPOFASE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?OPERARIO,?MAQUI' +
        'NA,?PROVEEDOR,?VARIOS,?FECHA,?TIEMPO_TOT,?ID_ORDEN,?TIPOFASE)')
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
      '  ,ID_ORDEN=?ID_ORDEN'
      '  ,TIPOFASE=?TIPOFASE'
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      ' ')
    AfterCancel = QMProCabMarcaAfterOpen
    AfterOpen = QMProCabMarcaAfterOpen
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
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CAB_MARCA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
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
      DisplayLabel = 'Desc. Maq.'
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
    object QMProCabMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Ord.'
      FieldName = 'ID_ORDEN'
      OnChange = QMProCabMarcaID_ORDENChange
    end
    object QMProCabMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMProCabMarcaDescripFase: TStringField
      DisplayLabel = 'Desc. Fase'
      FieldKind = fkCalculated
      FieldName = 'DescripFase'
      OnGetText = QMProCabMarcaDescripFaseGetText
      Calculated = True
    end
    object QMProCabMarcaCompuesto: TStringField
      FieldKind = fkCalculated
      FieldName = 'Compuesto'
      OnGetText = QMProCabMarcaCompuestoGetText
      Size = 15
      Calculated = True
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 16
  end
  object DSQMProCabMarca: TDataSource
    DataSet = QMProCabMarca
    Left = 168
    Top = 16
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
        'S_FAB,UNIDADES_DEFECTUOSAS,ESTADO,NOTAS,IDTAREA,TIEMPO_DEC,ENTRA' +
        'DA,NUEVA_TAREA, TIPOFASE, TIPOTAREA,TIPO_MARCAJE,ID_ORDEN,FECHA_' +
        'DET,MOTIVO,NO_PRODUCTIVA,TURNO,CANTIDAD_RECHAZADA,CAUSA,TIPO_DEF' +
        'ECTO,HORAS_NO_PRODUCTIVAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?RIG_OF,?' +
        'SUBORDEN,?LINEA_FASE,?LINEA_TAREA,?FECHA_PREV,?FECHA_REAL,?NUM_R' +
        'EF_SAL,?HORA_INICIO,?HORA_FIN,?TIEMPO,?RECURSO,?PRECIO_RECURSO,?' +
        'TIPO_RECURSO,?UNIDADES_FAB,?UNIDADES_DEFECTUOSAS,?ESTADO,?NOTAS,' +
        '?IDTAREA,?TIEMPO_DEC,?ENTRADA,?NUEVA_TAREA, ?TIPOFASE, ?TIPOTARE' +
        'A,?TIPO_MARCAJE,?ID_ORDEN,?FECHA_DET,?MOTIVO,?NO_PRODUCTIVA,?TUR' +
        'NO,?CANTIDAD_RECHAZADA,?CAUSA,?TIPO_DEFECTO,?HORAS_NO_PRODUCTIVA' +
        'S)')
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
      '  ,NOTAS=?NOTAS'
      '  ,IDTAREA=?IDTAREA'
      '  ,TIEMPO_DEC=?TIEMPO_DEC'
      '  ,ENTRADA=?ENTRADA'
      '  ,NUEVA_TAREA=?NUEVA_TAREA'
      '  ,TIPOFASE=?TIPOFASE'
      '  ,TIPOTAREA=?TIPOTAREA'
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE'
      '  ,ID_ORDEN=?ID_ORDEN'
      '  ,FECHA_DET=?FECHA_DET'
      '  ,MOTIVO=?MOTIVO'
      '  ,NO_PRODUCTIVA=?NO_PRODUCTIVA'
      '  ,TURNO=?TURNO'
      '  ,CANTIDAD_RECHAZADA=?CANTIDAD_RECHAZADA'
      '  ,CAUSA=?CAUSA'
      '  ,TIPO_DEFECTO=?TIPO_DEFECTO'
      '  ,HORAS_NO_PRODUCTIVAS=?HORAS_NO_PRODUCTIVAS'
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
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_MARCA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
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
      DisplayLabel = 'Desc. Fase'
      FieldKind = fkCalculated
      FieldName = 'DescripFase'
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripTarea: TStringField
      DisplayLabel = 'Desc.Tarea'
      FieldKind = fkCalculated
      FieldName = 'DescripTarea'
      OnGetText = QMProDetMarcaDescripTareaGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripRec: TStringField
      DisplayLabel = 'Desc. Rec'
      FieldKind = fkCalculated
      FieldName = 'DescripRec'
      OnGetText = QMProDetMarcaDescripRecGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaIDTAREA: TIntegerField
      DisplayLabel = 'ID Tarea'
      FieldName = 'IDTAREA'
    end
    object QMProDetMarcaIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputaci'#243'n'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object QMProDetMarcaTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
      OnChange = QMProDetMarcaTIEMPO_DECChange
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
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMProDetMarcaTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object QMProDetMarcaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMProDetMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
      OnChange = QMProDetMarcaID_ORDENChange
    end
    object QMProDetMarcaMARCAJE_DIRECTO_BD: TIntegerField
      DisplayLabel = 'Marcaje Directo'
      FieldName = 'MARCAJE_DIRECTO_BD'
    end
    object QMProDetMarcaMOTIVO: TFIBStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Size = 35
    end
    object QMProDetMarcaTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object QMProDetMarcaCANTIDAD_RECHAZADA: TFloatField
      DisplayLabel = 'Cant. Rechazada'
      FieldName = 'CANTIDAD_RECHAZADA'
    end
    object QMProDetMarcaFECHA_DET: TDateTimeField
      DisplayLabel = 'Fecha Det.'
      FieldName = 'FECHA_DET'
    end
    object QMProDetMarcaNO_PRODUCTIVA: TIntegerField
      DisplayLabel = 'No Productiva'
      FieldName = 'NO_PRODUCTIVA'
    end
    object QMProDetMarcaCAUSA: TFIBStringField
      DisplayLabel = 'Causa'
      FieldName = 'CAUSA'
      Size = 3
    end
    object QMProDetMarcaDescCausa: TStringField
      DisplayLabel = 'Desc. Causa'
      FieldKind = fkCalculated
      FieldName = 'DescCausa'
      OnGetText = QMProDetMarcaDescCausaGetText
      Calculated = True
    end
    object QMProDetMarcaDescTurno: TStringField
      DisplayLabel = 'Desc. Turno'
      FieldKind = fkCalculated
      FieldName = 'DescTurno'
      OnGetText = QMProDetMarcaDescTurnoGetText
      Calculated = True
    end
    object QMProDetMarcaTIPO_DEFECTO: TIntegerField
      DisplayLabel = 'Tipo Defecto'
      FieldName = 'TIPO_DEFECTO'
    end
    object QMProDetMarcaDescDefecto: TStringField
      DisplayLabel = 'Desc. Defecto'
      FieldKind = fkCalculated
      FieldName = 'DescDefecto'
      OnGetText = QMProDetMarcaDescDefectoGetText
      Calculated = True
    end
    object QMProDetMarcaHORAS_NO_PRODUCTIVAS: TFloatField
      DisplayLabel = 'Horas No Prod.'
      FieldName = 'HORAS_NO_PRODUCTIVAS'
    end
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 168
    Top = 64
  end
  object Pro_Precio_Recurso: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure Pro_Precio_Recurso'
      '  (?EMPRESA,?RECURSO,?FECHA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 112
  end
  object QVarios: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select Max(LINEA_COMP)As NLinea'
      'From PRO_MAT_ESC'
      'Where ((EMPRESA=?EMPRESA) and (ESCANDALLO=?Escandallo))')
    Transaction = TLocal
    AutoTrans = False
    Left = 304
    Top = 256
  end
  object xDatosTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '')
    UniDirectional = False
    Left = 40
    Top = 112
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
    object xDatosTareaSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
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
  end
  object DSxDatosTarea: TDataSource
    DataSet = xDatosTarea
    Left = 168
    Top = 112
  end
  object Pro_Precio_Recurso2: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure Pro_Precio_Recurso2'
      '  (?EMPRESA,?RECURSO,?TIPO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 160
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 208
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
    Left = 40
    Top = 160
    object xInfoActualizadaTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 168
    Top = 160
  end
  object xCausa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select descripcion'
      'From Pro_causas'
      'Where (empresa=?empresa and causa=?causa)'
      '')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 40
    Top = 208
    object xCausaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxCausa: TDataSource
    DataSet = xCausa
    Left = 168
    Top = 208
  end
  object xTurno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select descripcion'
      'From Pro_turnos'
      'Where (empresa=?empresa and turno=?turno)'
      '')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 40
    Top = 256
    object xTurnoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxTurno: TDataSource
    DataSet = xTurno
    Left = 168
    Top = 256
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 64
  end
  object xCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select compuesto from pro_ord where id_orden=?id_orden')
    UniDirectional = False
    DataSource = DSQMProCabMarca
    Left = 40
    Top = 304
    object xCompuestoCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
  end
  object DSxCompuesto: TDataSource
    DataSet = xCompuesto
    Left = 168
    Top = 304
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select titulo'
      'From Pro_sys_tareas'
      'Where (tarea=?TipoTarea)')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 40
    Top = 400
    object xTareaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 168
    Top = 400
  end
  object xRecurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select TITULO'
      'From PRO_RECURSOS'
      'Where recurso=?recurso')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 40
    Top = 451
    object xRecursoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxRecurso: TDataSource
    DataSet = xRecurso
    Left = 168
    Top = 444
  end
  object xDefecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select descripcion'
      'From Pro_sys_tipo_defecto'
      'Where (codigo_defecto=?tipo_defecto)')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 40
    Top = 352
    object xDefectoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxDefecto: TDataSource
    DataSet = xDefecto
    Left = 168
    Top = 352
  end
end
