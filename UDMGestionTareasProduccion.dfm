object DMGestionTareasProduccion: TDMGestionTareasProduccion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 271
  Top = 198
  Height = 293
  Width = 408
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 344
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 344
    Top = 56
  end
  object DSQMTarea: TDataSource
    DataSet = QMTarea
    Left = 120
    Top = 8
  end
  object QMTarea: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_TAREA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  LINEA_TAREA=?old_LINEA_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_TAREA'
      
        '  (COMENTARIO,CANTIDAD,PRE_COS_UNI_PRE,TOTAL_VAR_PRE,PRECIO_FIJO' +
        '_PRE,TOTAL_PRE,PRE_COS_UNI_REAL,TOTAL_VAR_REAL,PRECIO_FIJO_REAL,' +
        'TOTAL_REAL,FECHA_FIN_TAREA,CANTIDAD_UTIL,TIEMPO,TIEMPO_UTIL,UDS_' +
        'FABRICADAS,CANTIDAD_IMPUTADA,TOTAL_IMP,PRECIO_IMP,TOTAL,TOTAL_HO' +
        'RAS,RESULTADO_FORMULA,SERIE,RIG_OF,SUBORDEN,IDENTIFICADOR,ENTRAD' +
        'A,ID_ORDEN,ID_UTILLAJE,OPERACIONES_NUM,OPERACIONES_TIEMPO,FORMUL' +
        'A,EMPRESA,EJERCICIO,CANAL,LINEA_FASE,LINEA_TAREA,TAREA,ORDEN,EST' +
        'ADO,DESC_UTILLAJE,MAQUINA,TIEMPO_PRODUCCION,TIPOTAREA,RECURSO,AR' +
        'TICULO,FECHA_INICIO_TAREA)'
      'VALUES'
      
        '  (?COMENTARIO,?CANTIDAD,?PRE_COS_UNI_PRE,?TOTAL_VAR_PRE,?PRECIO' +
        '_FIJO_PRE,?TOTAL_PRE,?PRE_COS_UNI_REAL,?TOTAL_VAR_REAL,?PRECIO_F' +
        'IJO_REAL,?TOTAL_REAL,?FECHA_FIN_TAREA,?CANTIDAD_UTIL,?TIEMPO,?TI' +
        'EMPO_UTIL,?UDS_FABRICADAS,?CANTIDAD_IMPUTADA,?TOTAL_IMP,?PRECIO_' +
        'IMP,?TOTAL,?TOTAL_HORAS,?RESULTADO_FORMULA,?SERIE,?RIG_OF,?SUBOR' +
        'DEN,?IDENTIFICADOR,?ENTRADA,?ID_ORDEN,?ID_UTILLAJE,?OPERACIONES_' +
        'NUM,?OPERACIONES_TIEMPO,?FORMULA,?EMPRESA,?EJERCICIO,?CANAL,?LIN' +
        'EA_FASE,?LINEA_TAREA,?TAREA,?ORDEN,?ESTADO,?DESC_UTILLAJE,?MAQUI' +
        'NA,?TIEMPO_PRODUCCION,?TIPOTAREA,?RECURSO,?ARTICULO,?FECHA_INICI' +
        'O_TAREA)'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_TAREA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_TAREA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY SERIE, RIG_OF, LINEA_FASE, LINEA_TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRE_COS_UNI_PRE=?PRE_COS_UNI_PRE '
      '  ,TOTAL_VAR_PRE=?TOTAL_VAR_PRE '
      '  ,PRECIO_FIJO_PRE=?PRECIO_FIJO_PRE '
      '  ,TOTAL_PRE=?TOTAL_PRE '
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL '
      '  ,TOTAL_VAR_REAL=?TOTAL_VAR_REAL '
      '  ,PRECIO_FIJO_REAL=?PRECIO_FIJO_REAL '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,FECHA_FIN_TAREA=?FECHA_FIN_TAREA '
      '  ,CANTIDAD_UTIL=?CANTIDAD_UTIL '
      '  ,TIEMPO=?TIEMPO '
      '  ,TIEMPO_UTIL=?TIEMPO_UTIL '
      '  ,UDS_FABRICADAS=?UDS_FABRICADAS '
      '  ,CANTIDAD_IMPUTADA=?CANTIDAD_IMPUTADA '
      '  ,TOTAL_IMP=?TOTAL_IMP '
      '  ,PRECIO_IMP=?PRECIO_IMP '
      '  ,TOTAL=?TOTAL '
      '  ,TOTAL_HORAS=?TOTAL_HORAS '
      '  ,RESULTADO_FORMULA=?RESULTADO_FORMULA '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,IDENTIFICADOR=?IDENTIFICADOR '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_UTILLAJE=?ID_UTILLAJE '
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM '
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO '
      '  ,FORMULA=?FORMULA '
      '  ,TAREA=?TAREA '
      '  ,ORDEN=?ORDEN '
      '  ,ESTADO=?ESTADO '
      '  ,DESC_UTILLAJE=?DESC_UTILLAJE '
      '  ,MAQUINA=?MAQUINA '
      '  ,TIEMPO_PRODUCCION=?TIEMPO_PRODUCCION '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,RECURSO=?RECURSO '
      '  ,ARTICULO=?ARTICULO '
      '  ,FECHA_INICIO_TAREA=?FECHA_INICIO_TAREA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterOpen = QMTareaAfterOpen
    BeforeClose = QMTareaBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG_OF '
      'LINEA_FASE '
      'LINEA_TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 8
    object QMTareaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMTareaEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMTareaCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTareaRIG_OF: TIntegerField
      FieldName = 'RIG_OF'
    end
    object QMTareaSUBORDEN: TIntegerField
      FieldName = 'SUBORDEN'
    end
    object QMTareaLINEA_FASE: TIntegerField
      FieldName = 'LINEA_FASE'
    end
    object QMTareaLINEA_TAREA: TIntegerField
      FieldName = 'LINEA_TAREA'
    end
    object QMTareaTAREA: TFIBStringField
      FieldName = 'TAREA'
      Size = 60
    end
    object QMTareaORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object QMTareaTIPOTAREA: TFIBStringField
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMTareaCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMTareaRECURSO: TFIBStringField
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMTareaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object QMTareaARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTareaPRE_COS_UNI_PRE: TFloatField
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object QMTareaTOTAL_VAR_PRE: TFloatField
      FieldName = 'TOTAL_VAR_PRE'
    end
    object QMTareaPRECIO_FIJO_PRE: TFloatField
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object QMTareaTOTAL_PRE: TFloatField
      FieldName = 'TOTAL_PRE'
    end
    object QMTareaPRE_COS_UNI_REAL: TFloatField
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object QMTareaTOTAL_VAR_REAL: TFloatField
      FieldName = 'TOTAL_VAR_REAL'
    end
    object QMTareaPRECIO_FIJO_REAL: TFloatField
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object QMTareaTOTAL_REAL: TFloatField
      FieldName = 'TOTAL_REAL'
    end
    object QMTareaESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object QMTareaFECHA_FIN_TAREA: TDateTimeField
      FieldName = 'FECHA_FIN_TAREA'
    end
    object QMTareaIDENTIFICADOR: TIntegerField
      FieldName = 'IDENTIFICADOR'
    end
    object QMTareaENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object QMTareaID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
    end
    object QMTareaCANTIDAD_UTIL: TFloatField
      FieldName = 'CANTIDAD_UTIL'
    end
    object QMTareaID_UTILLAJE: TFIBStringField
      FieldName = 'ID_UTILLAJE'
      Size = 10
    end
    object QMTareaDESC_UTILLAJE: TFIBStringField
      FieldName = 'DESC_UTILLAJE'
      Size = 40
    end
    object QMTareaTIEMPO: TFloatField
      FieldName = 'TIEMPO'
    end
    object QMTareaTIEMPO_UTIL: TFloatField
      FieldName = 'TIEMPO_UTIL'
    end
    object QMTareaUDS_FABRICADAS: TFloatField
      FieldName = 'UDS_FABRICADAS'
    end
    object QMTareaCANTIDAD_IMPUTADA: TFloatField
      FieldName = 'CANTIDAD_IMPUTADA'
    end
    object QMTareaOPERACIONES_NUM: TIntegerField
      FieldName = 'OPERACIONES_NUM'
    end
    object QMTareaOPERACIONES_TIEMPO: TIntegerField
      FieldName = 'OPERACIONES_TIEMPO'
    end
    object QMTareaTOTAL_IMP: TFloatField
      FieldName = 'TOTAL_IMP'
    end
    object QMTareaPRECIO_IMP: TFloatField
      FieldName = 'PRECIO_IMP'
    end
    object QMTareaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QMTareaTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object QMTareaMAQUINA: TIntegerField
      FieldName = 'MAQUINA'
    end
    object QMTareaTIEMPO_PRODUCCION: TFIBStringField
      FieldName = 'TIEMPO_PRODUCCION'
    end
    object QMTareaFORMULA: TIntegerField
      FieldName = 'FORMULA'
    end
    object QMTareaRESULTADO_FORMULA: TFloatField
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMTareaFECHA_INICIO_TAREA: TDateTimeField
      FieldName = 'FECHA_INICIO_TAREA'
    end
  end
  object DSQMOrden: TDataSource
    DataSet = QMOrden
    Left = 120
    Top = 56
  end
  object QMOrden: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD'
      
        '  (FECHA_ORD,FECHA_PED,UNI_PEDID,UNI_MANUAL,UNI_TOTAL,UNI_PRODUC' +
        ',UNI_PENDIENTES,FECHA_ENTREGA,FECHA_INI,FECHA_FIN,COSTE_FIJO_PRE' +
        ',COSTE_VAR_PRE,COSTE_MAT_PRE,COSTE_MO_PRE,COSTE_MAQ_PRE,COSTE_TE' +
        'X_PRE,COSTE_TOT_PRE,COSTE_FIJO_REAL,COSTE_VAR_REAL,COSTE_MAT_REA' +
        'L,COSTE_MO_REAL,COSTE_MAQ_REAL,COSTE_TEX_REAL,COSTE_TOT_REAL,COS' +
        'TE_UNITARIO,PRECIO_VENTA,HORAS_TOTALES,MARGEN_UNI,MARGEN_TOTAL,O' +
        'BSERVACIONES,MARGEN_UNI_CIEN,COSTE_COMPRAS,HORAS_OPERARIO,HORAS_' +
        'MAQUINA,MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,COSTE_COMPRAS_PRE,MA' +
        'RGEN_TOTAL_PRE,MARGEN_UNI_CIEN_PRE,COSTE_UNITARIO_PRE,MARGEN_UNI' +
        '_PRE,PRECIO_VENTA_PRE,PRECIO_VENTA_TOT_PRE,PRECIO_VENTA_TOT_REAL' +
        ',HORAS_OPERARIO_PRE,HORAS_MAQUINA_PRE,UNI_FABRICADAS,DIF_COSTE_M' +
        'ERMA,COSTE_MERMA_REAL,COSTE_MERMA_PRE,ID_UBICACION,ID_LOTE,SERIE' +
        'S,RIG_OF,SUBORDEN,CLIENTE,ESCANDALLO,PEDIDO,MERMA,ENTRADA,ID_ORD' +
        'EN,ID_ORDEN_MAT,ID_MOV_STOCK,ISO_APROBADO,ISO_VERIFICADO,ISO_VAL' +
        'IDADO,ID_DESPIECE,ID_A,ID_ORDEN_SUBORDEN,PADRE_SUBORDEN,CONT_SUB' +
        'ORDEN,RESPONSABLE,PLANIFICACION,LINEA_PLANIFICACION,ID_PLANIFICA' +
        'CION,ID_PLANIFICACION_DET,UNIDAD,ID_MOV_STOCK_RESERVA,COPIAS_PMP' +
        ',SEGUIR_SIN_STOCK,COMPUESTOS_VIRTUALES,EMPRESA,EJERCICIO,CANAL,E' +
        'STADO,LINEA_PED,PRIORIDAD,VISTOBUENO1,VISTOBUENO2,VISTOBUENO3,SI' +
        'TUACION,TIPO_LANZAMIENTO,TIPO_RESERVA,CERRAR_SUBORDENES,IMPORTAR' +
        '_OP,CASO_OP,RESERVA_STOCK_OP,REFERENCIA,SELECCIONADA,PREVALECE_A' +
        'LM_ORDEN,RECUPERADO_MARCAJE,DESACTIVA_TRIGGER,DESC_LOTE,ALMACEN_' +
        'SAL,ALMACEN_LAN,ALMACEN_ENT,COMPUESTO,VERSION_ORDEN)'
      'VALUES'
      
        '  (?FECHA_ORD,?FECHA_PED,?UNI_PEDID,?UNI_MANUAL,?UNI_TOTAL,?UNI_' +
        'PRODUC,?UNI_PENDIENTES,?FECHA_ENTREGA,?FECHA_INI,?FECHA_FIN,?COS' +
        'TE_FIJO_PRE,?COSTE_VAR_PRE,?COSTE_MAT_PRE,?COSTE_MO_PRE,?COSTE_M' +
        'AQ_PRE,?COSTE_TEX_PRE,?COSTE_TOT_PRE,?COSTE_FIJO_REAL,?COSTE_VAR' +
        '_REAL,?COSTE_MAT_REAL,?COSTE_MO_REAL,?COSTE_MAQ_REAL,?COSTE_TEX_' +
        'REAL,?COSTE_TOT_REAL,?COSTE_UNITARIO,?PRECIO_VENTA,?HORAS_TOTALE' +
        'S,?MARGEN_UNI,?MARGEN_TOTAL,?OBSERVACIONES,?MARGEN_UNI_CIEN,?COS' +
        'TE_COMPRAS,?HORAS_OPERARIO,?HORAS_MAQUINA,?MEDIDA_1,?MEDIDA_2,?M' +
        'EDIDA_3,?MEDIDA_4,?COSTE_COMPRAS_PRE,?MARGEN_TOTAL_PRE,?MARGEN_U' +
        'NI_CIEN_PRE,?COSTE_UNITARIO_PRE,?MARGEN_UNI_PRE,?PRECIO_VENTA_PR' +
        'E,?PRECIO_VENTA_TOT_PRE,?PRECIO_VENTA_TOT_REAL,?HORAS_OPERARIO_P' +
        'RE,?HORAS_MAQUINA_PRE,?UNI_FABRICADAS,?DIF_COSTE_MERMA,?COSTE_ME' +
        'RMA_REAL,?COSTE_MERMA_PRE,?ID_UBICACION,?ID_LOTE,?SERIES,?RIG_OF' +
        ',?SUBORDEN,?CLIENTE,?ESCANDALLO,?PEDIDO,?MERMA,?ENTRADA,?ID_ORDE' +
        'N,?ID_ORDEN_MAT,?ID_MOV_STOCK,?ISO_APROBADO,?ISO_VERIFICADO,?ISO' +
        '_VALIDADO,?ID_DESPIECE,?ID_A,?ID_ORDEN_SUBORDEN,?PADRE_SUBORDEN,' +
        '?CONT_SUBORDEN,?RESPONSABLE,?PLANIFICACION,?LINEA_PLANIFICACION,' +
        '?ID_PLANIFICACION,?ID_PLANIFICACION_DET,?UNIDAD,?ID_MOV_STOCK_RE' +
        'SERVA,?COPIAS_PMP,?SEGUIR_SIN_STOCK,?COMPUESTOS_VIRTUALES,?EMPRE' +
        'SA,?EJERCICIO,?CANAL,?ESTADO,?LINEA_PED,?PRIORIDAD,?VISTOBUENO1,' +
        '?VISTOBUENO2,?VISTOBUENO3,?SITUACION,?TIPO_LANZAMIENTO,?TIPO_RES' +
        'ERVA,?CERRAR_SUBORDENES,?IMPORTAR_OP,?CASO_OP,?RESERVA_STOCK_OP,' +
        '?REFERENCIA,?SELECCIONADA,?PREVALECE_ALM_ORDEN,?RECUPERADO_MARCA' +
        'JE,?DESACTIVA_TRIGGER,?DESC_LOTE,?ALMACEN_SAL,?ALMACEN_LAN,?ALMA' +
        'CEN_ENT,?COMPUESTO,?VERSION_ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRO_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD'
      'SET'
      '  FECHA_ORD=?FECHA_ORD '
      '  ,FECHA_PED=?FECHA_PED '
      '  ,UNI_PEDID=?UNI_PEDID '
      '  ,UNI_MANUAL=?UNI_MANUAL '
      '  ,UNI_TOTAL=?UNI_TOTAL '
      '  ,UNI_PRODUC=?UNI_PRODUC '
      '  ,UNI_PENDIENTES=?UNI_PENDIENTES '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,COSTE_FIJO_PRE=?COSTE_FIJO_PRE '
      '  ,COSTE_VAR_PRE=?COSTE_VAR_PRE '
      '  ,COSTE_MAT_PRE=?COSTE_MAT_PRE '
      '  ,COSTE_MO_PRE=?COSTE_MO_PRE '
      '  ,COSTE_MAQ_PRE=?COSTE_MAQ_PRE '
      '  ,COSTE_TEX_PRE=?COSTE_TEX_PRE '
      '  ,COSTE_TOT_PRE=?COSTE_TOT_PRE '
      '  ,COSTE_FIJO_REAL=?COSTE_FIJO_REAL '
      '  ,COSTE_VAR_REAL=?COSTE_VAR_REAL '
      '  ,COSTE_MAT_REAL=?COSTE_MAT_REAL '
      '  ,COSTE_MO_REAL=?COSTE_MO_REAL '
      '  ,COSTE_MAQ_REAL=?COSTE_MAQ_REAL '
      '  ,COSTE_TEX_REAL=?COSTE_TEX_REAL '
      '  ,COSTE_TOT_REAL=?COSTE_TOT_REAL '
      '  ,COSTE_UNITARIO=?COSTE_UNITARIO '
      '  ,PRECIO_VENTA=?PRECIO_VENTA '
      '  ,HORAS_TOTALES=?HORAS_TOTALES '
      '  ,MARGEN_UNI=?MARGEN_UNI '
      '  ,MARGEN_TOTAL=?MARGEN_TOTAL '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,MARGEN_UNI_CIEN=?MARGEN_UNI_CIEN '
      '  ,COSTE_COMPRAS=?COSTE_COMPRAS '
      '  ,HORAS_OPERARIO=?HORAS_OPERARIO '
      '  ,HORAS_MAQUINA=?HORAS_MAQUINA '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,COSTE_COMPRAS_PRE=?COSTE_COMPRAS_PRE '
      '  ,MARGEN_TOTAL_PRE=?MARGEN_TOTAL_PRE '
      '  ,MARGEN_UNI_CIEN_PRE=?MARGEN_UNI_CIEN_PRE '
      '  ,COSTE_UNITARIO_PRE=?COSTE_UNITARIO_PRE '
      '  ,MARGEN_UNI_PRE=?MARGEN_UNI_PRE '
      '  ,PRECIO_VENTA_PRE=?PRECIO_VENTA_PRE '
      '  ,PRECIO_VENTA_TOT_PRE=?PRECIO_VENTA_TOT_PRE '
      '  ,PRECIO_VENTA_TOT_REAL=?PRECIO_VENTA_TOT_REAL '
      '  ,HORAS_OPERARIO_PRE=?HORAS_OPERARIO_PRE '
      '  ,HORAS_MAQUINA_PRE=?HORAS_MAQUINA_PRE '
      '  ,UNI_FABRICADAS=?UNI_FABRICADAS '
      '  ,DIF_COSTE_MERMA=?DIF_COSTE_MERMA '
      '  ,COSTE_MERMA_REAL=?COSTE_MERMA_REAL '
      '  ,COSTE_MERMA_PRE=?COSTE_MERMA_PRE '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,CLIENTE=?CLIENTE '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,PEDIDO=?PEDIDO '
      '  ,MERMA=?MERMA '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_ORDEN_MAT=?ID_ORDEN_MAT '
      '  ,ID_MOV_STOCK=?ID_MOV_STOCK '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,ID_DESPIECE=?ID_DESPIECE '
      '  ,ID_A=?ID_A '
      '  ,ID_ORDEN_SUBORDEN=?ID_ORDEN_SUBORDEN '
      '  ,PADRE_SUBORDEN=?PADRE_SUBORDEN '
      '  ,CONT_SUBORDEN=?CONT_SUBORDEN '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,PLANIFICACION=?PLANIFICACION '
      '  ,LINEA_PLANIFICACION=?LINEA_PLANIFICACION '
      '  ,ID_PLANIFICACION=?ID_PLANIFICACION '
      '  ,ID_PLANIFICACION_DET=?ID_PLANIFICACION_DET '
      '  ,UNIDAD=?UNIDAD '
      '  ,ID_MOV_STOCK_RESERVA=?ID_MOV_STOCK_RESERVA '
      '  ,COPIAS_PMP=?COPIAS_PMP '
      '  ,SEGUIR_SIN_STOCK=?SEGUIR_SIN_STOCK '
      '  ,COMPUESTOS_VIRTUALES=?COMPUESTOS_VIRTUALES '
      '  ,ESTADO=?ESTADO '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,VISTOBUENO1=?VISTOBUENO1 '
      '  ,VISTOBUENO2=?VISTOBUENO2 '
      '  ,VISTOBUENO3=?VISTOBUENO3 '
      '  ,SITUACION=?SITUACION '
      '  ,TIPO_LANZAMIENTO=?TIPO_LANZAMIENTO '
      '  ,TIPO_RESERVA=?TIPO_RESERVA '
      '  ,CERRAR_SUBORDENES=?CERRAR_SUBORDENES '
      '  ,IMPORTAR_OP=?IMPORTAR_OP '
      '  ,CASO_OP=?CASO_OP '
      '  ,RESERVA_STOCK_OP=?RESERVA_STOCK_OP '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,SELECCIONADA=?SELECCIONADA '
      '  ,PREVALECE_ALM_ORDEN=?PREVALECE_ALM_ORDEN '
      '  ,RECUPERADO_MARCAJE=?RECUPERADO_MARCAJE '
      '  ,DESACTIVA_TRIGGER=?DESACTIVA_TRIGGER '
      '  ,DESC_LOTE=?DESC_LOTE '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,VERSION_ORDEN=?VERSION_ORDEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    DataSource = DSQMTarea
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 56
    object QMOrdenEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMOrdenEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMOrdenCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMOrdenSERIES: TFIBStringField
      FieldName = 'SERIES'
      Size = 10
    end
    object QMOrdenRIG_OF: TIntegerField
      FieldName = 'RIG_OF'
    end
    object QMOrdenSUBORDEN: TIntegerField
      FieldName = 'SUBORDEN'
    end
    object QMOrdenALMACEN_SAL: TFIBStringField
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMOrdenALMACEN_LAN: TFIBStringField
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMOrdenALMACEN_ENT: TFIBStringField
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMOrdenFECHA_ORD: TDateTimeField
      FieldName = 'FECHA_ORD'
    end
    object QMOrdenCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QMOrdenCOMPUESTO: TFIBStringField
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMOrdenESCANDALLO: TIntegerField
      FieldName = 'ESCANDALLO'
    end
    object QMOrdenESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object QMOrdenPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object QMOrdenLINEA_PED: TIntegerField
      FieldName = 'LINEA_PED'
    end
    object QMOrdenFECHA_PED: TDateTimeField
      FieldName = 'FECHA_PED'
    end
    object QMOrdenUNI_PEDID: TFloatField
      FieldName = 'UNI_PEDID'
    end
    object QMOrdenUNI_MANUAL: TFloatField
      FieldName = 'UNI_MANUAL'
    end
    object QMOrdenUNI_TOTAL: TFloatField
      FieldName = 'UNI_TOTAL'
    end
    object QMOrdenPRIORIDAD: TIntegerField
      FieldName = 'PRIORIDAD'
    end
    object QMOrdenMERMA: TFloatField
      FieldName = 'MERMA'
    end
    object QMOrdenUNI_PRODUC: TFloatField
      FieldName = 'UNI_PRODUC'
    end
    object QMOrdenUNI_PENDIENTES: TFloatField
      FieldName = 'UNI_PENDIENTES'
    end
    object QMOrdenFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
    end
    object QMOrdenFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
    end
    object QMOrdenFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object QMOrdenCOSTE_FIJO_PRE: TFloatField
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QMOrdenCOSTE_VAR_PRE: TFloatField
      FieldName = 'COSTE_VAR_PRE'
    end
    object QMOrdenCOSTE_MAT_PRE: TFloatField
      FieldName = 'COSTE_MAT_PRE'
    end
    object QMOrdenCOSTE_MO_PRE: TFloatField
      FieldName = 'COSTE_MO_PRE'
    end
    object QMOrdenCOSTE_MAQ_PRE: TFloatField
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QMOrdenCOSTE_TEX_PRE: TFloatField
      FieldName = 'COSTE_TEX_PRE'
    end
    object QMOrdenCOSTE_TOT_PRE: TFloatField
      FieldName = 'COSTE_TOT_PRE'
    end
    object QMOrdenCOSTE_FIJO_REAL: TFloatField
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMOrdenCOSTE_VAR_REAL: TFloatField
      FieldName = 'COSTE_VAR_REAL'
    end
    object QMOrdenCOSTE_MAT_REAL: TFloatField
      FieldName = 'COSTE_MAT_REAL'
    end
    object QMOrdenCOSTE_MO_REAL: TFloatField
      FieldName = 'COSTE_MO_REAL'
    end
    object QMOrdenCOSTE_MAQ_REAL: TFloatField
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QMOrdenCOSTE_TEX_REAL: TFloatField
      FieldName = 'COSTE_TEX_REAL'
    end
    object QMOrdenCOSTE_TOT_REAL: TFloatField
      FieldName = 'COSTE_TOT_REAL'
    end
    object QMOrdenCOSTE_UNITARIO: TFloatField
      FieldName = 'COSTE_UNITARIO'
    end
    object QMOrdenPRECIO_VENTA: TFloatField
      FieldName = 'PRECIO_VENTA'
    end
    object QMOrdenHORAS_TOTALES: TFloatField
      FieldName = 'HORAS_TOTALES'
    end
    object QMOrdenMARGEN_UNI: TFloatField
      FieldName = 'MARGEN_UNI'
    end
    object QMOrdenMARGEN_TOTAL: TFloatField
      FieldName = 'MARGEN_TOTAL'
    end
    object QMOrdenOBSERVACIONES: TMemoField
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMOrdenVISTOBUENO1: TIntegerField
      FieldName = 'VISTOBUENO1'
    end
    object QMOrdenVISTOBUENO2: TIntegerField
      FieldName = 'VISTOBUENO2'
    end
    object QMOrdenVISTOBUENO3: TIntegerField
      FieldName = 'VISTOBUENO3'
    end
    object QMOrdenSITUACION: TIntegerField
      FieldName = 'SITUACION'
    end
    object QMOrdenMARGEN_UNI_CIEN: TFloatField
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object QMOrdenENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object QMOrdenID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
    end
    object QMOrdenTIPO_LANZAMIENTO: TIntegerField
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMOrdenID_ORDEN_MAT: TIntegerField
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMOrdenTIPO_RESERVA: TIntegerField
      FieldName = 'TIPO_RESERVA'
    end
    object QMOrdenID_MOV_STOCK: TIntegerField
      FieldName = 'ID_MOV_STOCK'
    end
    object QMOrdenISO_APROBADO: TIntegerField
      FieldName = 'ISO_APROBADO'
    end
    object QMOrdenISO_VERIFICADO: TIntegerField
      FieldName = 'ISO_VERIFICADO'
    end
    object QMOrdenISO_VALIDADO: TIntegerField
      FieldName = 'ISO_VALIDADO'
    end
    object QMOrdenID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object QMOrdenPADRE_SUBORDEN: TIntegerField
      FieldName = 'PADRE_SUBORDEN'
    end
    object QMOrdenCONT_SUBORDEN: TIntegerField
      FieldName = 'CONT_SUBORDEN'
    end
    object QMOrdenREFERENCIA: TFIBStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMOrdenCOSTE_COMPRAS: TFloatField
      FieldName = 'COSTE_COMPRAS'
    end
    object QMOrdenHORAS_OPERARIO: TFloatField
      FieldName = 'HORAS_OPERARIO'
    end
    object QMOrdenHORAS_MAQUINA: TFloatField
      FieldName = 'HORAS_MAQUINA'
    end
    object QMOrdenID_DESPIECE: TIntegerField
      FieldName = 'ID_DESPIECE'
    end
    object QMOrdenID_ORDEN_SUBORDEN: TIntegerField
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object QMOrdenSELECCIONADA: TIntegerField
      FieldName = 'SELECCIONADA'
    end
    object QMOrdenPREVALECE_ALM_ORDEN: TIntegerField
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object QMOrdenCERRAR_SUBORDENES: TIntegerField
      FieldName = 'CERRAR_SUBORDENES'
    end
    object QMOrdenIMPORTAR_OP: TIntegerField
      FieldName = 'IMPORTAR_OP'
    end
    object QMOrdenCASO_OP: TIntegerField
      FieldName = 'CASO_OP'
    end
    object QMOrdenRESERVA_STOCK_OP: TIntegerField
      FieldName = 'RESERVA_STOCK_OP'
    end
    object QMOrdenMEDIDA_1: TFloatField
      FieldName = 'MEDIDA_1'
    end
    object QMOrdenMEDIDA_2: TFloatField
      FieldName = 'MEDIDA_2'
    end
    object QMOrdenMEDIDA_3: TFloatField
      FieldName = 'MEDIDA_3'
    end
    object QMOrdenMEDIDA_4: TFloatField
      FieldName = 'MEDIDA_4'
    end
    object QMOrdenDESACTIVA_TRIGGER: TIntegerField
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMOrdenRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
    end
    object QMOrdenDIF_COSTE_FIJO: TFloatField
      FieldName = 'DIF_COSTE_FIJO'
    end
    object QMOrdenDIF_COSTE_MAT: TFloatField
      FieldName = 'DIF_COSTE_MAT'
    end
    object QMOrdenDIF_COSTE_MO: TFloatField
      FieldName = 'DIF_COSTE_MO'
    end
    object QMOrdenDIF_COSTE_MAQ: TFloatField
      FieldName = 'DIF_COSTE_MAQ'
    end
    object QMOrdenDIF_COSTE_TEXT: TFloatField
      FieldName = 'DIF_COSTE_TEXT'
    end
    object QMOrdenDIF_COSTE_VAR: TFloatField
      FieldName = 'DIF_COSTE_VAR'
    end
    object QMOrdenCOSTE_COMPRAS_PRE: TFloatField
      FieldName = 'COSTE_COMPRAS_PRE'
    end
    object QMOrdenDIF_COSTE_COMPRAS: TFloatField
      FieldName = 'DIF_COSTE_COMPRAS'
    end
    object QMOrdenDIF_COSTE_TOTAL: TFloatField
      FieldName = 'DIF_COSTE_TOTAL'
    end
    object QMOrdenCOMPUESTOS_VIRTUALES: TIntegerField
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object QMOrdenSEGUIR_SIN_STOCK: TIntegerField
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object QMOrdenMARGEN_TOTAL_PRE: TFloatField
      FieldName = 'MARGEN_TOTAL_PRE'
    end
    object QMOrdenMARGEN_UNI_CIEN_PRE: TFloatField
      FieldName = 'MARGEN_UNI_CIEN_PRE'
    end
    object QMOrdenCOSTE_UNITARIO_PRE: TFloatField
      FieldName = 'COSTE_UNITARIO_PRE'
    end
    object QMOrdenMARGEN_UNI_PRE: TFloatField
      FieldName = 'MARGEN_UNI_PRE'
    end
    object QMOrdenPRECIO_VENTA_PRE: TFloatField
      FieldName = 'PRECIO_VENTA_PRE'
    end
    object QMOrdenPRECIO_VENTA_TOT_PRE: TFloatField
      FieldName = 'PRECIO_VENTA_TOT_PRE'
    end
    object QMOrdenPRECIO_VENTA_TOT_REAL: TFloatField
      FieldName = 'PRECIO_VENTA_TOT_REAL'
    end
    object QMOrdenDIF_COSTE_MARGEN_TOTAL: TFloatField
      FieldName = 'DIF_COSTE_MARGEN_TOTAL'
    end
    object QMOrdenDIF_MARGEN_TOTAL: TFloatField
      FieldName = 'DIF_MARGEN_TOTAL'
    end
    object QMOrdenDIF_MARGEN_UNI_CIEN: TFloatField
      FieldName = 'DIF_MARGEN_UNI_CIEN'
    end
    object QMOrdenDIF_PRECIO_VENTA_UNI: TFloatField
      FieldName = 'DIF_PRECIO_VENTA_UNI'
    end
    object QMOrdenDIF_COSTE_UNI: TFloatField
      FieldName = 'DIF_COSTE_UNI'
    end
    object QMOrdenDIF_MARGEN_UNI: TFloatField
      FieldName = 'DIF_MARGEN_UNI'
    end
    object QMOrdenDIF_PRECIO_VENTA_TOT: TFloatField
      FieldName = 'DIF_PRECIO_VENTA_TOT'
    end
    object QMOrdenHORAS_OPERARIO_PRE: TFloatField
      FieldName = 'HORAS_OPERARIO_PRE'
    end
    object QMOrdenHORAS_MAQUINA_PRE: TFloatField
      FieldName = 'HORAS_MAQUINA_PRE'
    end
    object QMOrdenDIF_HORAS_MAQUINA: TFloatField
      FieldName = 'DIF_HORAS_MAQUINA'
    end
    object QMOrdenDIF_HORAS_OPERARIO: TFloatField
      FieldName = 'DIF_HORAS_OPERARIO'
    end
    object QMOrdenRECUPERADO_MARCAJE: TIntegerField
      FieldName = 'RECUPERADO_MARCAJE'
    end
    object QMOrdenUNI_FABRICADAS: TFloatField
      FieldName = 'UNI_FABRICADAS'
    end
    object QMOrdenPLANIFICACION: TIntegerField
      FieldName = 'PLANIFICACION'
    end
    object QMOrdenLINEA_PLANIFICACION: TIntegerField
      FieldName = 'LINEA_PLANIFICACION'
    end
    object QMOrdenID_PLANIFICACION: TIntegerField
      FieldName = 'ID_PLANIFICACION'
    end
    object QMOrdenID_PLANIFICACION_DET: TIntegerField
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object QMOrdenID_UBICACION: TIntegerField
      FieldName = 'ID_UBICACION'
    end
    object QMOrdenID_MOV_STOCK_RESERVA: TIntegerField
      FieldName = 'ID_MOV_STOCK_RESERVA'
    end
    object QMOrdenUNIDAD: TFIBStringField
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMOrdenCOSTE_MERMA_PRE: TFloatField
      FieldName = 'COSTE_MERMA_PRE'
    end
    object QMOrdenCOSTE_MERMA_REAL: TFloatField
      FieldName = 'COSTE_MERMA_REAL'
    end
    object QMOrdenDIF_COSTE_MERMA: TFloatField
      FieldName = 'DIF_COSTE_MERMA'
    end
    object QMOrdenCOPIAS_PMP: TIntegerField
      FieldName = 'COPIAS_PMP'
    end
    object QMOrdenVERSION_ORDEN: TFIBStringField
      FieldName = 'VERSION_ORDEN'
      Size = 15
    end
  end
  object DSQMFase: TDataSource
    DataSet = QMFase
    Left = 120
    Top = 104
  end
  object QMFase: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_FASES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  LINEA_FASE=?old_LINEA_FASE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_FASES'
      
        '  (NOTAS,FECHA_FIN_FASE,CANTIDAD_TERMINADA,CANTIDAD_ENTRADA,MEDI' +
        'DA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,PIEZAS_HORA_PREV,MERMA_FASE_PREV' +
        ',SERIES,RIG_OF,SUBORDEN,DIBUJO,ENTRADA,ID_ORDEN,ID_IMAGEN,EMPRES' +
        'A,EJERCICIO,CANAL,LINEA_FASE,FASE,ORDEN,ESTADO,VALORCALIDAD,REBA' +
        'JE,TIPOFASE,FECHA_INICIO_FASE)'
      'VALUES'
      
        '  (?NOTAS,?FECHA_FIN_FASE,?CANTIDAD_TERMINADA,?CANTIDAD_ENTRADA,' +
        '?MEDIDA_1,?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?PIEZAS_HORA_PREV,?MERMA' +
        '_FASE_PREV,?SERIES,?RIG_OF,?SUBORDEN,?DIBUJO,?ENTRADA,?ID_ORDEN,' +
        '?ID_IMAGEN,?EMPRESA,?EJERCICIO,?CANAL,?LINEA_FASE,?FASE,?ORDEN,?' +
        'ESTADO,?VALORCALIDAD,?REBAJE,?TIPOFASE,?FECHA_INICIO_FASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_FASES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_FASES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE '
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_FASES'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,FECHA_FIN_FASE=?FECHA_FIN_FASE '
      '  ,CANTIDAD_TERMINADA=?CANTIDAD_TERMINADA '
      '  ,CANTIDAD_ENTRADA=?CANTIDAD_ENTRADA '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,PIEZAS_HORA_PREV=?PIEZAS_HORA_PREV '
      '  ,MERMA_FASE_PREV=?MERMA_FASE_PREV '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,DIBUJO=?DIBUJO '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,FASE=?FASE '
      '  ,ORDEN=?ORDEN '
      '  ,ESTADO=?ESTADO '
      '  ,VALORCALIDAD=?VALORCALIDAD '
      '  ,REBAJE=?REBAJE '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,FECHA_INICIO_FASE=?FECHA_INICIO_FASE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE ')
    DataSource = DSQMTarea
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterOpen = QMFaseAfterOpen
    BeforeClose = QMFaseBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF '
      'LINEA_FASE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_FASES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 104
    object QMFaseEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMFaseEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMFaseCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMFaseSERIES: TFIBStringField
      FieldName = 'SERIES'
      Size = 10
    end
    object QMFaseRIG_OF: TIntegerField
      FieldName = 'RIG_OF'
    end
    object QMFaseSUBORDEN: TIntegerField
      FieldName = 'SUBORDEN'
    end
    object QMFaseLINEA_FASE: TIntegerField
      FieldName = 'LINEA_FASE'
    end
    object QMFaseFASE: TFIBStringField
      FieldName = 'FASE'
      Size = 60
    end
    object QMFaseORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object QMFaseTIPOFASE: TFIBStringField
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMFaseNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMFaseDIBUJO: TFIBStringField
      FieldName = 'DIBUJO'
      Size = 100
    end
    object QMFaseESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object QMFaseVALORCALIDAD: TIntegerField
      FieldName = 'VALORCALIDAD'
    end
    object QMFaseFECHA_FIN_FASE: TDateTimeField
      FieldName = 'FECHA_FIN_FASE'
    end
    object QMFaseENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object QMFaseID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
    end
    object QMFaseID_IMAGEN: TIntegerField
      FieldName = 'ID_IMAGEN'
    end
    object QMFaseREBAJE: TIntegerField
      FieldName = 'REBAJE'
    end
    object QMFaseCANTIDAD_ENTRADA: TFloatField
      FieldName = 'CANTIDAD_ENTRADA'
    end
    object QMFaseCANTIDAD_TERMINADA: TFloatField
      FieldName = 'CANTIDAD_TERMINADA'
    end
    object QMFaseMEDIDA_1: TFloatField
      FieldName = 'MEDIDA_1'
    end
    object QMFaseMEDIDA_2: TFloatField
      FieldName = 'MEDIDA_2'
    end
    object QMFaseMEDIDA_3: TFloatField
      FieldName = 'MEDIDA_3'
    end
    object QMFaseMEDIDA_4: TFloatField
      FieldName = 'MEDIDA_4'
    end
    object QMFaseMERMA_FASE_PREV: TFloatField
      FieldName = 'MERMA_FASE_PREV'
    end
    object QMFasePIEZAS_HORA_PREV: TFloatField
      FieldName = 'PIEZAS_HORA_PREV'
    end
    object QMFaseFECHA_INICIO_FASE: TDateTimeField
      FieldName = 'FECHA_INICIO_FASE'
    end
  end
  object DSQMMaterial: TDataSource
    DataSet = QMMaterial
    Left = 120
    Top = 152
  end
  object QMMaterial: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_MAT'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  LINEA_MAT=?old_LINEA_MAT ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_MAT'
      
        '  (UNIDADES_NEC,UNIDADES_UTIL,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO,' +
        'TOTAL,UNIDADES_FAB,UNIDADES_STOCK,PRE_COS_UNI_REAL,UNIDADES_PREV' +
        ',PRECIO_FIJO_REAL,TOTAL_VAR_REAL,TOTAL_REAL,NOTAS_MAT,UDS_COMPRA' +
        ',DES_ALTO,DES_ANCHO,DES_GRUESO,RESULTADO_FORMULA,UNIDADES_DEVOLV' +
        'ER,ID_UBICACION,ID_LOTE,SERIES,RIG_OF,SUBORDEN,MATESC,ENTRADA,ID' +
        '_ORDEN,ID_ORDEN_MAT,ID_MOV_STOCK,ID_MOV_STOCK_B,ID_MOV_STOCK_C,U' +
        'NIDAD_ART,UNIDAD_FAB,ID_EQUIVAL,PROVEEDOR_COMPRA,ID_A,N_MOV_STOC' +
        'K,FORMULA,ID_DETALLES_ST,LINEA_TAREA,ESTADO,EMPRESA,EJERCICIO,CA' +
        'NAL,LINEA_MAT,LOTE,ORDEN,PORCENTAJE,LINEA_FASE,PRODUCCION,MEDIDA' +
        'S,TIPO_PIEZA,NUM_PIEZAS,COMPRAR,MOV_STOCK_COMPRA,RESERVA_STOCK,M' +
        'INI_NOTA,DESACTIVA_TRIGGER,MERMA,ALMACEN,COMPONENTE,ALMACEN_DEVO' +
        'LVER,N_MOV_STOCK_RESERVA)'
      'VALUES'
      
        '  (?UNIDADES_NEC,?UNIDADES_UTIL,?PRE_COS_UNI,?TOTAL_VAR,?PRECIO_' +
        'FIJO,?TOTAL,?UNIDADES_FAB,?UNIDADES_STOCK,?PRE_COS_UNI_REAL,?UNI' +
        'DADES_PREV,?PRECIO_FIJO_REAL,?TOTAL_VAR_REAL,?TOTAL_REAL,?NOTAS_' +
        'MAT,?UDS_COMPRA,?DES_ALTO,?DES_ANCHO,?DES_GRUESO,?RESULTADO_FORM' +
        'ULA,?UNIDADES_DEVOLVER,?ID_UBICACION,?ID_LOTE,?SERIES,?RIG_OF,?S' +
        'UBORDEN,?MATESC,?ENTRADA,?ID_ORDEN,?ID_ORDEN_MAT,?ID_MOV_STOCK,?' +
        'ID_MOV_STOCK_B,?ID_MOV_STOCK_C,?UNIDAD_ART,?UNIDAD_FAB,?ID_EQUIV' +
        'AL,?PROVEEDOR_COMPRA,?ID_A,?N_MOV_STOCK,?FORMULA,?ID_DETALLES_ST' +
        ',?LINEA_TAREA,?ESTADO,?EMPRESA,?EJERCICIO,?CANAL,?LINEA_MAT,?LOT' +
        'E,?ORDEN,?PORCENTAJE,?LINEA_FASE,?PRODUCCION,?MEDIDAS,?TIPO_PIEZ' +
        'A,?NUM_PIEZAS,?COMPRAR,?MOV_STOCK_COMPRA,?RESERVA_STOCK,?MINI_NO' +
        'TA,?DESACTIVA_TRIGGER,?MERMA,?ALMACEN,?COMPONENTE,?ALMACEN_DEVOL' +
        'VER,?N_MOV_STOCK_RESERVA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_MAT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_MAT=?LINEA_MAT ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_MAT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND'
      '  LINEA_FASE=?LINEA_FASE '
      'ORDER BY LINEA_MAT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_MAT'
      'SET'
      '  UNIDADES_NEC=?UNIDADES_NEC '
      '  ,UNIDADES_UTIL=?UNIDADES_UTIL '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL=?TOTAL '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_STOCK=?UNIDADES_STOCK '
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL '
      '  ,UNIDADES_PREV=?UNIDADES_PREV '
      '  ,PRECIO_FIJO_REAL=?PRECIO_FIJO_REAL '
      '  ,TOTAL_VAR_REAL=?TOTAL_VAR_REAL '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,NOTAS_MAT=?NOTAS_MAT '
      '  ,UDS_COMPRA=?UDS_COMPRA '
      '  ,DES_ALTO=?DES_ALTO '
      '  ,DES_ANCHO=?DES_ANCHO '
      '  ,DES_GRUESO=?DES_GRUESO '
      '  ,RESULTADO_FORMULA=?RESULTADO_FORMULA '
      '  ,UNIDADES_DEVOLVER=?UNIDADES_DEVOLVER '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,MATESC=?MATESC '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_ORDEN_MAT=?ID_ORDEN_MAT '
      '  ,ID_MOV_STOCK=?ID_MOV_STOCK '
      '  ,ID_MOV_STOCK_B=?ID_MOV_STOCK_B '
      '  ,ID_MOV_STOCK_C=?ID_MOV_STOCK_C '
      '  ,UNIDAD_ART=?UNIDAD_ART '
      '  ,UNIDAD_FAB=?UNIDAD_FAB '
      '  ,ID_EQUIVAL=?ID_EQUIVAL '
      '  ,PROVEEDOR_COMPRA=?PROVEEDOR_COMPRA '
      '  ,ID_A=?ID_A '
      '  ,N_MOV_STOCK=?N_MOV_STOCK '
      '  ,FORMULA=?FORMULA '
      '  ,ID_DETALLES_ST=?ID_DETALLES_ST '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,ESTADO=?ESTADO '
      '  ,LOTE=?LOTE '
      '  ,ORDEN=?ORDEN '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,MEDIDAS=?MEDIDAS '
      '  ,TIPO_PIEZA=?TIPO_PIEZA '
      '  ,NUM_PIEZAS=?NUM_PIEZAS '
      '  ,COMPRAR=?COMPRAR '
      '  ,MOV_STOCK_COMPRA=?MOV_STOCK_COMPRA '
      '  ,RESERVA_STOCK=?RESERVA_STOCK '
      '  ,MINI_NOTA=?MINI_NOTA '
      '  ,DESACTIVA_TRIGGER=?DESACTIVA_TRIGGER '
      '  ,MERMA=?MERMA '
      '  ,ALMACEN=?ALMACEN '
      '  ,COMPONENTE=?COMPONENTE '
      '  ,ALMACEN_DEVOLVER=?ALMACEN_DEVOLVER '
      '  ,N_MOV_STOCK_RESERVA=?N_MOV_STOCK_RESERVA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_MAT=?LINEA_MAT ')
    DataSource = DSQMFase
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF '
      'LINEA_MAT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 152
    object QMMaterialEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMMaterialEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMMaterialCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMMaterialSERIES: TFIBStringField
      FieldName = 'SERIES'
      Size = 10
    end
    object QMMaterialRIG_OF: TIntegerField
      FieldName = 'RIG_OF'
    end
    object QMMaterialSUBORDEN: TIntegerField
      FieldName = 'SUBORDEN'
    end
    object QMMaterialLINEA_MAT: TIntegerField
      FieldName = 'LINEA_MAT'
    end
    object QMMaterialALMACEN: TFIBStringField
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMMaterialLOTE: TFIBStringField
      FieldName = 'LOTE'
    end
    object QMMaterialCOMPONENTE: TFIBStringField
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMMaterialORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object QMMaterialUNIDADES_NEC: TFloatField
      FieldName = 'UNIDADES_NEC'
    end
    object QMMaterialUNIDADES_UTIL: TFloatField
      FieldName = 'UNIDADES_UTIL'
    end
    object QMMaterialPORCENTAJE: TFloatField
      FieldName = 'PORCENTAJE'
    end
    object QMMaterialLINEA_FASE: TIntegerField
      FieldName = 'LINEA_FASE'
    end
    object QMMaterialPRE_COS_UNI: TFloatField
      FieldName = 'PRE_COS_UNI'
    end
    object QMMaterialTOTAL_VAR: TFloatField
      FieldName = 'TOTAL_VAR'
    end
    object QMMaterialPRECIO_FIJO: TFloatField
      FieldName = 'PRECIO_FIJO'
    end
    object QMMaterialTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QMMaterialPRODUCCION: TIntegerField
      FieldName = 'PRODUCCION'
    end
    object QMMaterialMATESC: TIntegerField
      FieldName = 'MATESC'
    end
    object QMMaterialENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object QMMaterialID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
    end
    object QMMaterialID_ORDEN_MAT: TIntegerField
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMMaterialUNIDADES_FAB: TFloatField
      FieldName = 'UNIDADES_FAB'
    end
    object QMMaterialUNIDADES_STOCK: TFloatField
      FieldName = 'UNIDADES_STOCK'
    end
    object QMMaterialPRE_COS_UNI_REAL: TFloatField
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object QMMaterialID_MOV_STOCK: TIntegerField
      FieldName = 'ID_MOV_STOCK'
    end
    object QMMaterialUNIDADES_PREV: TFloatField
      FieldName = 'UNIDADES_PREV'
    end
    object QMMaterialPRECIO_FIJO_REAL: TFloatField
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object QMMaterialTOTAL_VAR_REAL: TFloatField
      FieldName = 'TOTAL_VAR_REAL'
    end
    object QMMaterialTOTAL_REAL: TFloatField
      FieldName = 'TOTAL_REAL'
    end
    object QMMaterialNOTAS_MAT: TMemoField
      FieldName = 'NOTAS_MAT'
      BlobType = ftMemo
      Size = 8
    end
    object QMMaterialMEDIDAS: TFIBStringField
      FieldName = 'MEDIDAS'
      Size = 60
    end
    object QMMaterialTIPO_PIEZA: TFIBStringField
      FieldName = 'TIPO_PIEZA'
      Size = 60
    end
    object QMMaterialNUM_PIEZAS: TFIBStringField
      FieldName = 'NUM_PIEZAS'
      Size = 60
    end
    object QMMaterialID_MOV_STOCK_B: TIntegerField
      FieldName = 'ID_MOV_STOCK_B'
    end
    object QMMaterialID_MOV_STOCK_C: TIntegerField
      FieldName = 'ID_MOV_STOCK_C'
    end
    object QMMaterialUNIDAD_ART: TFIBStringField
      FieldName = 'UNIDAD_ART'
      Size = 2
    end
    object QMMaterialUNIDAD_FAB: TFIBStringField
      FieldName = 'UNIDAD_FAB'
      Size = 2
    end
    object QMMaterialID_EQUIVAL: TIntegerField
      FieldName = 'ID_EQUIVAL'
    end
    object QMMaterialCOMPRAR: TIntegerField
      FieldName = 'COMPRAR'
    end
    object QMMaterialPROVEEDOR_COMPRA: TIntegerField
      FieldName = 'PROVEEDOR_COMPRA'
    end
    object QMMaterialMOV_STOCK_COMPRA: TIntegerField
      FieldName = 'MOV_STOCK_COMPRA'
    end
    object QMMaterialID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object QMMaterialUDS_COMPRA: TFloatField
      FieldName = 'UDS_COMPRA'
    end
    object QMMaterialRESERVA_STOCK: TIntegerField
      FieldName = 'RESERVA_STOCK'
    end
    object QMMaterialN_MOV_STOCK: TIntegerField
      FieldName = 'N_MOV_STOCK'
    end
    object QMMaterialMINI_NOTA: TFIBStringField
      FieldName = 'MINI_NOTA'
      Size = 100
    end
    object QMMaterialRESULTADO_FORMULA: TFloatField
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMMaterialFORMULA: TIntegerField
      FieldName = 'FORMULA'
    end
    object QMMaterialDESACTIVA_TRIGGER: TIntegerField
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMMaterialDES_ALTO: TFloatField
      FieldName = 'DES_ALTO'
    end
    object QMMaterialDES_ANCHO: TFloatField
      FieldName = 'DES_ANCHO'
    end
    object QMMaterialDES_GRUESO: TFloatField
      FieldName = 'DES_GRUESO'
    end
    object QMMaterialESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object QMMaterialLINEA_TAREA: TIntegerField
      FieldName = 'LINEA_TAREA'
    end
    object QMMaterialID_DETALLES_ST: TIntegerField
      FieldName = 'ID_DETALLES_ST'
    end
    object QMMaterialID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object QMMaterialID_UBICACION: TIntegerField
      FieldName = 'ID_UBICACION'
    end
    object QMMaterialMERMA: TFloatField
      FieldName = 'MERMA'
    end
    object QMMaterialUNIDADES_DEVOLVER: TFloatField
      FieldName = 'UNIDADES_DEVOLVER'
    end
    object QMMaterialALMACEN_DEVOLVER: TFIBStringField
      FieldName = 'ALMACEN_DEVOLVER'
      Size = 3
    end
    object QMMaterialN_MOV_STOCK_RESERVA: TIntegerField
      FieldName = 'N_MOV_STOCK_RESERVA'
    end
  end
  object DSQMMarcajes: TDataSource
    DataSet = QMMarcajes
    Left = 120
    Top = 200
  end
  object QMMarcajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MARCAJES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MARCAJES'
      
        '  (FECHA_LECTURA,FECHA_PROCESADO,ID,HORA_PROCESADO,ID_TAREA,ID_G' +
        'RUPO,SERIE,CADENA,PROCESADO,EMPRESA,EJERCICIO,CANAL,BORRAR_DETAL' +
        'LE)'
      'VALUES'
      
        '  (?FECHA_LECTURA,?FECHA_PROCESADO,?ID,?HORA_PROCESADO,?ID_TAREA' +
        ',?ID_GRUPO,?SERIE,?CADENA,?PROCESADO,?EMPRESA,?EJERCICIO,?CANAL,' +
        '?BORRAR_DETALLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MARCAJES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MARCAJES'
      'WHERE'
      '  ID_TAREA=?IDENTIFICADOR '
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MARCAJES'
      'SET'
      '  FECHA_LECTURA=?FECHA_LECTURA '
      '  ,FECHA_PROCESADO=?FECHA_PROCESADO '
      '  ,HORA_PROCESADO=?HORA_PROCESADO '
      '  ,ID_TAREA=?ID_TAREA '
      '  ,ID_GRUPO=?ID_GRUPO '
      '  ,SERIE=?SERIE '
      '  ,CADENA=?CADENA '
      '  ,PROCESADO=?PROCESADO '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,BORRAR_DETALLE=?BORRAR_DETALLE '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMTarea
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MARCAJES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 200
    object QMMarcajesID: TIntegerField
      FieldName = 'ID'
    end
    object QMMarcajesCADENA: TFIBStringField
      FieldName = 'CADENA'
      Size = 40
    end
    object QMMarcajesPROCESADO: TIntegerField
      FieldName = 'PROCESADO'
    end
    object QMMarcajesFECHA_LECTURA: TDateTimeField
      FieldName = 'FECHA_LECTURA'
    end
    object QMMarcajesFECHA_PROCESADO: TDateTimeField
      FieldName = 'FECHA_PROCESADO'
    end
    object QMMarcajesID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object QMMarcajesEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMMarcajesEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMMarcajesCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMMarcajesSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMMarcajesBORRAR_DETALLE: TIntegerField
      FieldName = 'BORRAR_DETALLE'
    end
    object QMMarcajesHORA_PROCESADO: TFloatField
      FieldName = 'HORA_PROCESADO'
    end
    object QMMarcajesID_TAREA: TIntegerField
      FieldName = 'ID_TAREA'
    end
  end
end
