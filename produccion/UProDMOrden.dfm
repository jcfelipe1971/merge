object ProDMOrden: TProDMOrden
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 374
  Top = 154
  Height = 623
  Width = 763
  object QMProOrd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,ALMACEN_SAL,' +
        'ALMACEN_LAN,ALMACEN_ENT,FECHA_ORD,CLIENTE,'#13#10'COMPUESTO,TITULO,ESC' +
        'ANDALLO,TIPO_ESC,TITULO_2,ESCANDALLO_2,TIPO_ESC_2,ESTADO,PEDIDO,' +
        'LINEA_PED,'#13#10'FECHA_PED,UNI_PEDID,UNI_MANUAL,UNI_TOTAL,PRIORIDAD,M' +
        'ERMA,UNI_PRODUC,UNI_PENDIENTES,FECHA_ENTREGA,FECHA_INI,'#13#10'FECHA_F' +
        'IN,COSTE_FIJO_PRE,COSTE_VAR_PRE,COSTE_MAT_PRE,COSTE_MO_PRE,COSTE' +
        '_MAQ_PRE,COSTE_TEX_PRE,COSTE_TOT_PRE,COSTE_FIJO_REAL,COSTE_VAR_R' +
        'EAL,'#13#10'COSTE_MAT_REAL,COSTE_MO_REAL,COSTE_MAQ_REAL,COSTE_TEX_REAL' +
        ',COSTE_TOT_REAL,COSTE_UNITARIO,PRECIO_VENTA,HORAS_TOTALES,MARGEN' +
        '_UNI,MARGEN_TOTAL,'#13#10'OBSERVACIONES,VISTOBUENO1,VISTOBUENO2,VISTOB' +
        'UENO3,SITUACION,MARGEN_UNI_CIEN,ENTRADA,ID_ORDEN,TIPO_LANZAMIENT' +
        'O,ID_ORDEN_MAT,'#13#10'TIPO_RESERVA,ID_MOV_STOCK,ISO_APROBADO,ISO_VERI' +
        'FICADO,ISO_VALIDADO,ID_A,PADRE_SUBORDEN,CONT_SUBORDEN,REFERENCIA' +
        ',COSTE_COMPRAS,'#13#10'HORAS_OPERARIO,HORAS_MAQUINA,ID_DESPIECE,ID_ORD' +
        'EN_SUBORDEN,SELECCIONADA,PREVALECE_ALM_ORDEN,CERRAR_SUBORDENES,I' +
        'MPORTAR_OP,CASO_OP,RESERVA_STOCK_OP,'#13#10'MEDIDA_1,MEDIDA_2,MEDIDA_3' +
        ',MEDIDA_4,DESACTIVA_TRIGGER,RESPONSABLE,COSTE_COMPRAS_PRE,COMPUE' +
        'STOS_VIRTUALES,SEGUIR_SIN_STOCK,MARGEN_TOTAL_PRE,MARGEN_UNI_CIEN' +
        '_PRE,COSTE_UNITARIO_PRE,'#13#10'MARGEN_UNI_PRE,PRECIO_VENTA_PRE,PRECIO' +
        '_VENTA_TOT_PRE,PRECIO_VENTA_TOT_REAL,HORAS_OPERARIO_PRE,HORAS_MA' +
        'QUINA_PRE,RECUPERADO_MARCAJE,UNI_FABRICADAS,PLANIFICACION,LINEA_' +
        'PLANIFICACION,ID_PLANIFICACION,'#13#10'ID_PLANIFICACION_DET,ID_UBICACI' +
        'ON,ID_MOV_STOCK_RESERVA,UNIDAD,DECIMALES_MASCARA,COSTE_MERMA_PRE' +
        ',COSTE_MERMA_REAL,DIF_COSTE_MERMA,COPIAS_PMP,VERSION_ORDEN,'#13#10'PRO' +
        'YECTO,SERIALIZADO,LOTEABLE,URGENTE,SIN_LONA,SIN_HERRAJE,SIN_MOTO' +
        'R,SIN_ROTULACION,RETENIDO_COMERCIAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?ALMAC' +
        'EN_SAL,?ALMACEN_LAN,?ALMACEN_ENT,?FECHA_ORD,?CLIENTE,'#13#10'?COMPUEST' +
        'O,?TITULO,?ESCANDALLO,?TIPO_ESC,?TITULO_2,?ESCANDALLO_2,?TIPO_ES' +
        'C_2,?ESTADO,?PEDIDO,?LINEA_PED,'#13#10'?FECHA_PED,?UNI_PEDID,?UNI_MANU' +
        'AL,?UNI_TOTAL,?PRIORIDAD,?MERMA,?UNI_PRODUC,?UNI_PENDIENTES,?FEC' +
        'HA_ENTREGA,?FECHA_INI,'#13#10'?FECHA_FIN,?COSTE_FIJO_PRE,?COSTE_VAR_PR' +
        'E,?COSTE_MAT_PRE,?COSTE_MO_PRE,?COSTE_MAQ_PRE,?COSTE_TEX_PRE,?CO' +
        'STE_TOT_PRE,?COSTE_FIJO_REAL,?COSTE_VAR_REAL,'#13#10'?COSTE_MAT_REAL,?' +
        'COSTE_MO_REAL,?COSTE_MAQ_REAL,?COSTE_TEX_REAL,?COSTE_TOT_REAL,?C' +
        'OSTE_UNITARIO,?PRECIO_VENTA,?HORAS_TOTALES,?MARGEN_UNI,?MARGEN_T' +
        'OTAL,'#13#10'?OBSERVACIONES,?VISTOBUENO1,?VISTOBUENO2,?VISTOBUENO3,?SI' +
        'TUACION,?MARGEN_UNI_CIEN,?ENTRADA,?ID_ORDEN,?TIPO_LANZAMIENTO,?I' +
        'D_ORDEN_MAT,'#13#10'?TIPO_RESERVA,?ID_MOV_STOCK,?ISO_APROBADO,?ISO_VER' +
        'IFICADO,?ISO_VALIDADO,?ID_A,?PADRE_SUBORDEN,?CONT_SUBORDEN,?REFE' +
        'RENCIA,?COSTE_COMPRAS,'#13#10'?HORAS_OPERARIO,?HORAS_MAQUINA,?ID_DESPI' +
        'ECE,?ID_ORDEN_SUBORDEN,?SELECCIONADA,?PREVALECE_ALM_ORDEN,?CERRA' +
        'R_SUBORDENES,?IMPORTAR_OP,?CASO_OP,?RESERVA_STOCK_OP,'#13#10'?MEDIDA_1' +
        ',?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?DESACTIVA_TRIGGER,?RESPONSABLE,?' +
        'COSTE_COMPRAS_PRE,?COMPUESTOS_VIRTUALES,?SEGUIR_SIN_STOCK,?MARGE' +
        'N_TOTAL_PRE,?MARGEN_UNI_CIEN_PRE,?COSTE_UNITARIO_PRE,'#13#10'?MARGEN_U' +
        'NI_PRE,?PRECIO_VENTA_PRE,?PRECIO_VENTA_TOT_PRE,?PRECIO_VENTA_TOT' +
        '_REAL,?HORAS_OPERARIO_PRE,?HORAS_MAQUINA_PRE,?RECUPERADO_MARCAJE' +
        ',?UNI_FABRICADAS,?PLANIFICACION,?LINEA_PLANIFICACION,?ID_PLANIFI' +
        'CACION,'#13#10'?ID_PLANIFICACION_DET,?ID_UBICACION,?ID_MOV_STOCK_RESER' +
        'VA,?UNIDAD,?DECIMALES_MASCARA,?COSTE_MERMA_PRE,?COSTE_MERMA_REAL' +
        ',?DIF_COSTE_MERMA,?COPIAS_PMP,?VERSION_ORDEN,'#13#10'?PROYECTO,?SERIAL' +
        'IZADO,?LOTEABLE,?URGENTE,?SIN_LONA,?SIN_HERRAJE,?SIN_MOTOR,?SIN_' +
        'ROTULACION,?RETENIDO_COMERCIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    SelectSQL.Strings = (
      '/*se crea dinamicamente*/'
      'SELECT'
      '    EMPRESA,'
      '    EJERCICIO,'
      '    CANAL,'
      '    SERIES,'
      '    RIG_OF,'
      '    SUBORDEN,'
      '    ALMACEN_SAL,'
      '    ALMACEN_LAN,'
      '    ALMACEN_ENT,'
      '    FECHA_ORD,'
      '    CLIENTE,'
      '    COMPUESTO,'
      '    TITULO,'
      '    ESCANDALLO,'
      '    TIPO_ESC,'
      '    TITULO_2,'
      '    ESCANDALLO_2,'
      '    TIPO_ESC_2,'
      '    ESTADO,'
      '    PEDIDO,'
      '    LINEA_PED,'
      '    FECHA_PED,'
      '    UNI_PEDID,'
      '    UNI_MANUAL,'
      '    UNI_TOTAL,'
      '    PRIORIDAD,'
      '    MERMA,'
      '    UNI_PRODUC,'
      '    UNI_PENDIENTES,'
      '    FECHA_ENTREGA,'
      '    FECHA_INI,'
      '    FECHA_FIN,'
      '    COSTE_FIJO_REAL,'
      '    PRECIO_VENTA,'
      '    HORAS_TOTALES,'
      '    OBSERVACIONES,'
      '    VISTOBUENO1,'
      '    VISTOBUENO2,'
      '    VISTOBUENO3,'
      '    SITUACION,'
      '    ENTRADA,'
      '    ID_ORDEN,'
      '    TIPO_LANZAMIENTO,'
      '    ID_ORDEN_MAT,'
      '    TIPO_RESERVA,'
      '    ISO_APROBADO,'
      '    ISO_VERIFICADO,'
      '    ISO_VALIDADO,'
      '    ID_A,'
      '    PADRE_SUBORDEN,'
      '    CONT_SUBORDEN,'
      '    REFERENCIA,'
      '    COSTE_COMPRAS,'
      '    HORAS_OPERARIO,'
      '    HORAS_MAQUINA,'
      '    ID_DESPIECE,'
      '    ID_ORDEN_SUBORDEN,'
      '    SELECCIONADA,'
      '    PREVALECE_ALM_ORDEN,'
      '    CERRAR_SUBORDENES,'
      '    IMPORTAR_OP,'
      '    CASO_OP,'
      '    RESERVA_STOCK_OP,'
      '    MEDIDA_1,'
      '    MEDIDA_2,'
      '    MEDIDA_3,'
      '    MEDIDA_4,'
      '    DESACTIVA_TRIGGER,'
      '    RESPONSABLE,'
      '    COMPUESTOS_VIRTUALES,'
      '    SEGUIR_SIN_STOCK,'
      '    RECUPERADO_MARCAJE,'
      '    UNI_FABRICADAS,'
      '    PLANIFICACION,'
      '    LINEA_PLANIFICACION,'
      '    ID_PLANIFICACION,'
      '    ID_PLANIFICACION_DET,'
      '    ID_UBICACION,'
      '    ID_MOV_STOCK_RESERVA,'
      '    UNIDAD,'
      '    DIF_COSTE_MERMA,'
      '    COPIAS_PMP,'
      '    VERSION_ORDEN,'
      '    ID_LOTE,'
      '    DESC_LOTE,'
      '    ID_LOTE_RESERVA,'
      '    DESC_LOTE_RESERVA,'
      '    RESERVA,'
      '    CANT_RESERVAR,'
      '    ESTADO_RESERVA,'
      '    PROYECTO,'
      '    DECIMALES_MASCARA,'
      '    TITULO_CLIENTE, '
      '    SERIALIZADO, '
      '    LOTEABLE,'
      '    ESTADO_FIRMA_ISO_APROBADO,'
      '    ESTADO_FIRMA_ISO_VERIFICADO,'
      '    ESTADO_FIRMA_ISO_VALIDADO,'
      '    URGENTE,'
      '    SIN_LONA,'
      '    SIN_HERRAJE,'
      '    SIN_MOTOR,'
      '    SIN_ROTULACION,'
      '    RETENIDO_COMERCIAL'
      'FROM VER_PRO_ORD'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIES = :SERIE AND'
      '((EJERCICIO = :EJERCICIO) OR (EJERCICIO < :EJERCICIO))'
      'ORDER BY ID_ORDEN, FECHA_ORD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD'
      'SET'
      '  SUBORDEN=?SUBORDEN '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,FECHA_ORD=?FECHA_ORD '
      '  ,CLIENTE=?CLIENTE '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,TITULO=?TITULO '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,TIPO_ESC=?TIPO_ESC '
      '  ,TITULO_2=?TITULO_2 '
      '  ,ESCANDALLO_2=?ESCANDALLO_2 '
      '  ,TIPO_ESC_2=?TIPO_ESC_2 '
      '  ,ESTADO=?ESTADO '
      '  ,PEDIDO=?PEDIDO '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,FECHA_PED=?FECHA_PED '
      '  ,UNI_PEDID=?UNI_PEDID '
      '  ,UNI_MANUAL=?UNI_MANUAL '
      '  ,UNI_TOTAL=?UNI_TOTAL '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,MERMA=?MERMA '
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
      '  ,VISTOBUENO1=?VISTOBUENO1 '
      '  ,VISTOBUENO2=?VISTOBUENO2 '
      '  ,VISTOBUENO3=?VISTOBUENO3 '
      '  ,SITUACION=?SITUACION '
      '  ,MARGEN_UNI_CIEN=?MARGEN_UNI_CIEN '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,TIPO_LANZAMIENTO=?TIPO_LANZAMIENTO '
      '  ,ID_ORDEN_MAT=?ID_ORDEN_MAT '
      '  ,TIPO_RESERVA=?TIPO_RESERVA '
      '  ,ID_MOV_STOCK=?ID_MOV_STOCK '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,ID_A=?ID_A '
      '  ,PADRE_SUBORDEN=?PADRE_SUBORDEN '
      '  ,CONT_SUBORDEN=?CONT_SUBORDEN '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,COSTE_COMPRAS=?COSTE_COMPRAS '
      '  ,HORAS_OPERARIO=?HORAS_OPERARIO '
      '  ,HORAS_MAQUINA=?HORAS_MAQUINA '
      '  ,ID_DESPIECE=?ID_DESPIECE '
      '  ,ID_ORDEN_SUBORDEN=?ID_ORDEN_SUBORDEN '
      '  ,SELECCIONADA=?SELECCIONADA '
      '  ,PREVALECE_ALM_ORDEN=?PREVALECE_ALM_ORDEN '
      '  ,CERRAR_SUBORDENES=?CERRAR_SUBORDENES '
      '  ,IMPORTAR_OP=?IMPORTAR_OP '
      '  ,CASO_OP=?CASO_OP '
      '  ,RESERVA_STOCK_OP=?RESERVA_STOCK_OP '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,DESACTIVA_TRIGGER=?DESACTIVA_TRIGGER '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,COSTE_COMPRAS_PRE=?COSTE_COMPRAS_PRE '
      '  ,COMPUESTOS_VIRTUALES=?COMPUESTOS_VIRTUALES '
      '  ,SEGUIR_SIN_STOCK=?SEGUIR_SIN_STOCK '
      '  ,MARGEN_TOTAL_PRE=?MARGEN_TOTAL_PRE '
      '  ,MARGEN_UNI_CIEN_PRE=?MARGEN_UNI_CIEN_PRE '
      '  ,COSTE_UNITARIO_PRE=?COSTE_UNITARIO_PRE '
      '  ,MARGEN_UNI_PRE=?MARGEN_UNI_PRE '
      '  ,PRECIO_VENTA_PRE=?PRECIO_VENTA_PRE '
      '  ,PRECIO_VENTA_TOT_PRE=?PRECIO_VENTA_TOT_PRE '
      '  ,PRECIO_VENTA_TOT_REAL=?PRECIO_VENTA_TOT_REAL '
      '  ,HORAS_OPERARIO_PRE=?HORAS_OPERARIO_PRE '
      '  ,HORAS_MAQUINA_PRE=?HORAS_MAQUINA_PRE '
      '  ,RECUPERADO_MARCAJE=?RECUPERADO_MARCAJE '
      '  ,UNI_FABRICADAS=?UNI_FABRICADAS '
      '  ,PLANIFICACION=?PLANIFICACION '
      '  ,LINEA_PLANIFICACION=?LINEA_PLANIFICACION '
      '  ,ID_PLANIFICACION=?ID_PLANIFICACION '
      '  ,ID_PLANIFICACION_DET=?ID_PLANIFICACION_DET '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_MOV_STOCK_RESERVA=?ID_MOV_STOCK_RESERVA '
      '  ,UNIDAD=?UNIDAD '
      '  ,DECIMALES_MASCARA=?DECIMALES_MASCARA '
      '  ,COSTE_MERMA_PRE=?COSTE_MERMA_PRE '
      '  ,COSTE_MERMA_REAL=?COSTE_MERMA_REAL '
      '  ,DIF_COSTE_MERMA=?DIF_COSTE_MERMA '
      '  ,COPIAS_PMP=?COPIAS_PMP '
      '  ,VERSION_ORDEN=?VERSION_ORDEN '
      '  ,PROYECTO=?PROYECTO '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,LOTEABLE=?LOTEABLE '
      '  ,URGENTE=?URGENTE '
      '  ,SIN_LONA=?SIN_LONA '
      '  ,SIN_HERRAJE=?SIN_HERRAJE '
      '  ,SIN_MOTOR=?SIN_MOTOR '
      '  ,SIN_ROTULACION=?SIN_ROTULACION '
      '  ,RETENIDO_COMERCIAL=?RETENIDO_COMERCIAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    AutoCalcFields = False
    AfterCancel = QMProOrdAfterCancel
    AfterDelete = Graba
    AfterOpen = QMProOrdAfterOpen
    AfterPost = Graba
    AfterScroll = QMProOrdAfterScroll
    BeforeClose = QMProOrdBeforeClose
    BeforePost = QMProOrdBeforePost
    OnCalcFields = QMProOrdCalcFields
    OnNewRecord = QMProOrdNewRecord
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
    TableName = 'VER_PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMProOrdEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProOrdRIG_OF: TIntegerField
      DisplayLabel = 'Rig_Of'
      FieldName = 'RIG_OF'
    end
    object QMProOrdSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Salida'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProOrdALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lanz.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMProOrdALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Entrada'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMProOrdFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha Orden'
      FieldName = 'FECHA_ORD'
    end
    object QMProOrdCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMProOrdCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      OnChange = QMProOrdCOMPUESTOChange
      Size = 15
    end
    object QMProOrdESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
      OnChange = QMProOrdESCANDALLOChange
    end
    object QMProOrdESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProOrdPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMProOrdLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Pedido'
      FieldName = 'LINEA_PED'
    end
    object QMProOrdFECHA_PED: TDateTimeField
      DisplayLabel = 'Fecha Pedido'
      FieldName = 'FECHA_PED'
    end
    object QMProOrdUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Pedido'
      FieldName = 'UNI_PEDID'
    end
    object QMProOrdUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Manual'
      FieldName = 'UNI_MANUAL'
      OnChange = QMProOrdUNI_MANUALChange
    end
    object QMProOrdUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QMProOrdPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMProOrdMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMProOrdUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Producci'#243'n'
      FieldName = 'UNI_PRODUC'
    end
    object QMProOrdUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pendientes'
      FieldName = 'UNI_PENDIENTES'
    end
    object QMProOrdFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMProOrdFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INI'
    end
    object QMProOrdFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMProOrdCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMProOrdPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMProOrdOBSERVACIONES: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Operario'
      FieldName = 'VISTOBUENO1'
    end
    object QMProOrdVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Encargado'
      FieldName = 'VISTOBUENO2'
    end
    object QMProOrdVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Jefe'
      FieldName = 'VISTOBUENO3'
    end
    object QMProOrdTITULO_CLIENTE: TStringField
      DisplayLabel = 'Titulo Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMProOrdSITUACION: TIntegerField
      DisplayLabel = 'Situaci'#243'n'
      FieldName = 'SITUACION'
    end
    object QMProOrdENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMProOrdID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanzamiento'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMProOrdID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMProOrdTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object QMProOrdISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprobado'
      FieldName = 'ISO_APROBADO'
    end
    object QMProOrdISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verificado'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMProOrdISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMProOrdID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMProOrdPADRE_SUBORDEN: TIntegerField
      DisplayLabel = 'Padre Suborden'
      FieldName = 'PADRE_SUBORDEN'
    end
    object QMProOrdCONT_SUBORDEN: TIntegerField
      DisplayLabel = 'Cont. Suborden'
      FieldName = 'CONT_SUBORDEN'
    end
    object QMProOrdREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMProOrdPREVALECE_ALM_ORDEN: TIntegerField
      DisplayLabel = 'Prevalece Alm. Ord.'
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object QMProOrdCERRAR_SUBORDENES: TIntegerField
      DisplayLabel = 'Cerrar Subordenes'
      FieldName = 'CERRAR_SUBORDENES'
    end
    object QMProOrdIMPORTAR_OP: TIntegerField
      DisplayLabel = 'Importar O.P.'
      FieldName = 'IMPORTAR_OP'
    end
    object QMProOrdCASO_OP: TIntegerField
      DisplayLabel = 'Caso O.P.'
      FieldName = 'CASO_OP'
    end
    object QMProOrdRESERVA_STOCK_OP: TIntegerField
      DisplayLabel = 'Reserv. Stock O.P.'
      FieldName = 'RESERVA_STOCK_OP'
    end
    object QMProOrdID_DESPIECE: TIntegerField
      DisplayLabel = 'ID Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMProOrdID_ORDEN_SUBORDEN: TIntegerField
      DisplayLabel = 'ID Ord. Suborden'
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object QMProOrdSELECCIONADA: TIntegerField
      DisplayLabel = 'Selec.'
      FieldName = 'SELECCIONADA'
    end
    object QMProOrdMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMProOrdMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMProOrdMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMProOrdMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMProOrdRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMProOrdCOMPUESTOS_VIRTUALES: TIntegerField
      DisplayLabel = 'Comp. Virtuales'
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object QMProOrdDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMProOrdSEGUIR_SIN_STOCK: TIntegerField
      DisplayLabel = 'Seguir Sin Stock'
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object QMProOrdRECUPERADO_MARCAJE: TIntegerField
      DisplayLabel = 'Recuperado Marcaje'
      FieldName = 'RECUPERADO_MARCAJE'
    end
    object QMProOrdUNI_FABRICADAS: TFloatField
      DisplayLabel = 'Uds. Fabricadas'
      FieldName = 'UNI_FABRICADAS'
    end
    object QMProOrdPLANIFICACION: TIntegerField
      DisplayLabel = 'Planif.'
      FieldName = 'PLANIFICACION'
    end
    object QMProOrdLINEA_PLANIFICACION: TIntegerField
      DisplayLabel = 'Linea Plan.'
      FieldName = 'LINEA_PLANIFICACION'
    end
    object QMProOrdID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planificacion'
      FieldName = 'ID_PLANIFICACION'
    end
    object QMProOrdID_PLANIFICACION_DET: TIntegerField
      DisplayLabel = 'ID Planif. Det.'
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object QMProOrdID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
      OnChange = QMProOrdID_LOTEChange
    end
    object QMProOrdTITULO_LOTE: TStringField
      DisplayLabel = 'Titulo Lote'
      FieldKind = fkCalculated
      FieldName = 'TITULO_LOTE'
      Size = 60
      Calculated = True
    end
    object QMProOrdID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
      OnChange = QMProOrdID_UBICACIONChange
    end
    object QMProOrdTITULO_UBICACION: TStringField
      DisplayLabel = 'Titulo Ubicacion'
      FieldKind = fkCalculated
      FieldName = 'TITULO_UBICACION'
      Size = 60
      Calculated = True
    end
    object QMProOrdID_MOV_STOCK_RESERVA: TIntegerField
      DisplayLabel = 'ID Mov. Stock Reserva'
      FieldName = 'ID_MOV_STOCK_RESERVA'
    end
    object QMProOrdDESC_LOTE: TFIBStringField
      DisplayLabel = 'Desc. Lote'
      FieldName = 'DESC_LOTE'
    end
    object QMProOrdUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMProOrdCOPIAS_PMP: TIntegerField
      DisplayLabel = 'Copias'
      FieldName = 'COPIAS_PMP'
    end
    object QMProOrdVERSION_ORDEN: TFIBStringField
      DisplayLabel = 'Version'
      FieldName = 'VERSION_ORDEN'
      Size = 15
    end
    object QMProOrdTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 100
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 100
    end
    object QMProOrdREALIZABLE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'REALIZABLE'
      Calculated = True
    end
    object QMProOrdMASCARA_UNIDADES_COMPUESTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'MASCARA_UNIDADES_COMPUESTO'
      Calculated = True
    end
    object QMProOrdRESERVA: TIntegerField
      DisplayLabel = 'Preparacion'
      FieldName = 'RESERVA'
    end
    object QMProOrdCANT_RESERVAR: TFloatField
      DisplayLabel = 'Cant Reservar'
      FieldName = 'CANT_RESERVAR'
    end
    object QMProOrdESTADO_RESERVA: TIntegerField
      DisplayLabel = 'Estado Res.'
      FieldName = 'ESTADO_RESERVA'
    end
    object QMProOrdPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMProOrdTITULO_SITUACION: TStringField
      DisplayLabel = 'Titulo Situacion'
      FieldKind = fkCalculated
      FieldName = 'TITULO_SITUACION'
      Size = 25
      Calculated = True
    end
    object QMProOrdID_LOTE_RESERVA: TIntegerField
      DisplayLabel = 'Id Lote Res.'
      FieldName = 'ID_LOTE_RESERVA'
    end
    object QMProOrdDESC_LOTE_RESERVA: TFIBStringField
      DisplayLabel = 'Titulo Lote Res.'
      FieldName = 'DESC_LOTE_RESERVA'
    end
    object QMProOrdDECIMALES_MASCARA: TIntegerField
      FieldName = 'DECIMALES_MASCARA'
    end
    object QMProOrdCANT_ESCANDALLO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CANT_ESCANDALLO'
      Calculated = True
    end
    object QMProOrdSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object QMProOrdLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
    end
    object QMProOrdESTADO_FIRMA_ISO_APROBADO: TIntegerField
      DisplayLabel = 'Estado Firma Aprob.'
      FieldName = 'ESTADO_FIRMA_ISO_APROBADO'
    end
    object QMProOrdESTADO_FIRMA_ISO_VERIFICADO: TIntegerField
      DisplayLabel = 'Estado Firma Verif.'
      FieldName = 'ESTADO_FIRMA_ISO_VERIFICADO'
    end
    object QMProOrdESTADO_FIRMA_ISO_VALIDADO: TIntegerField
      DisplayLabel = 'Estado Firma Valid.'
      FieldName = 'ESTADO_FIRMA_ISO_VALIDADO'
    end
    object QMProOrdTITULO_2: TFIBStringField
      DisplayLabel = 'Titulo 2'
      FieldName = 'TITULO_2'
      Size = 100
    end
    object QMProOrdESCANDALLO_2: TIntegerField
      DisplayLabel = 'Escandallo 2'
      FieldName = 'ESCANDALLO_2'
    end
    object QMProOrdTIPO_ESC: TFIBStringField
      DisplayLabel = 'Tipo Esc.'
      FieldName = 'TIPO_ESC'
      Size = 3
    end
    object QMProOrdTIPO_ESC_2: TFIBStringField
      DisplayLabel = 'Tipo Esc. 2'
      FieldName = 'TIPO_ESC_2'
      Size = 3
    end
    object QMProOrdURGENTE: TIntegerField
      DisplayLabel = 'Urgente'
      FieldName = 'URGENTE'
    end
    object QMProOrdSIN_LONA: TIntegerField
      DisplayLabel = 'Sin Lona'
      FieldName = 'SIN_LONA'
    end
    object QMProOrdSIN_HERRAJE: TIntegerField
      DisplayLabel = 'Sin Herraje'
      FieldName = 'SIN_HERRAJE'
    end
    object QMProOrdSIN_MOTOR: TIntegerField
      DisplayLabel = 'Sin Motor'
      FieldName = 'SIN_MOTOR'
    end
    object QMProOrdSIN_ROTULACION: TIntegerField
      DisplayLabel = 'Sin Rotulacion'
      FieldName = 'SIN_ROTULACION'
    end
    object QMProOrdRETENIDO_COMERCIAL: TIntegerField
      DisplayLabel = 'Rentenido Comer./Cliente'
      FieldName = 'RETENIDO_COMERCIAL'
    end
  end
  object DSQMProOrd: TDataSource
    DataSet = QMProOrd
    Left = 160
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 640
    Top = 8
  end
  object QMProOrdMat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_MAT'
      'WHERE'
      '  LINEA_MAT=?old_LINEA_MAT AND '
      '  SUBORDEN=?old_SUBORDEN AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIES=?old_SERIES AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_MAT'
      '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,LINEA_MAT,'
      '  ALMACEN,LOTE,COMPONENTE,ORDEN,UNIDADES_NEC,UNIDADES_UTIL,'
      '  PORCENTAJE,LINEA_FASE,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO,'
      '  TOTAL,ENTRADA,UNIDADES_STOCK,UNIDADES_FAB,NOTAS_MAT,'
      '  UNIDADES_PREV, PRECIO_FIJO_REAL, TOTAL_VAR_REAL,TOTAL_REAL,'
      '  MEDIDAS,TIPO_PIEZA,NUM_PIEZAS,UNIDAD_ART,UNIDAD_FAB,'
      '  ID_EQUIVAL,COMPRAR,PROVEEDOR_COMPRA,MOV_STOCK_COMPRA,'
      '  ID_A, UDS_COMPRA, RESERVA_STOCK,RESULTADO_FORMULA,FORMULA,'
      '  MINI_NOTA,LINEA_TAREA,ID_DETALLES_ST,ID_LOTE,ID_UBICACION,'
      '  MERMA, ALMACEN_SAL,ID_ORDEN_MAT)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?LINEA_M' +
        'AT,'
      
        '  ?ALMACEN,?LOTE,?COMPONENTE,?ORDEN,?UNIDADES_NEC,?UNIDADES_UTIL' +
        ','
      '  ?PORCENTAJE,?LINEA_FASE,?PRE_COS_UNI,?TOTAL_VAR,?PRECIO_FIJO,'
      '  ?TOTAL,?ENTRADA,?UNIDADES_STOCK,?UNIDADES_FAB,?NOTAS_MAT,'
      '  ?UNIDADES_PREV,?PRECIO_FIJO_REAL,?TOTAL_VAR_REAL,?TOTAL_REAL,'
      '  ?MEDIDAS,?TIPO_PIEZA,?NUM_PIEZAS,?UNIDAD_ART,?UNIDAD_FAB,'
      '  ?ID_EQUIVAL,?COMPRAR,?PROVEEDOR_COMPRA,?MOV_STOCK_COMPRA,'
      
        '  ?ID_A, ?UDS_COMPRA, ?RESERVA_STOCK,?RESULTADO_FORMULA,?FORMULA' +
        ','
      
        '  ?MINI_NOTA,?LINEA_TAREA,?ID_DETALLES_ST,?ID_LOTE,?ID_UBICACION' +
        ','
      '  ?MERMA,?ALMACEN_SAL,?ID_ORDEN_MAT)')
    RefreshSQL.Strings = (
      
        'select mat.empresa, mat.ejercicio, mat.canal, mat.series, mat.ri' +
        'g_of, mat.suborden, mat.linea_mat, mat.almacen,'
      
        '       mat.componente, mat.orden, mat.unidades_nec, unidades_uti' +
        'l, mat.porcentaje, mat.linea_fase, mat.pre_cos_uni,'
      
        '       mat.total_var, mat.precio_fijo, mat.total, mat.produccion' +
        ', mat.matesc, mat.entrada, mat.id_orden, mat.id_orden_mat,'
      
        '       mat.unidades_fab, mat.unidades_stock, mat.pre_cos_uni_rea' +
        'l, mat.id_mov_stock, mat.unidades_prev,'
      
        '       mat.precio_fijo_real, mat.total_var_real, mat.total_real,' +
        ' mat.notas_mat, mat.medidas, mat.tipo_pieza, mat.num_piezas,'
      
        '       mat.id_mov_stock_b, mat.id_mov_stock_c, mat.unidad_art, m' +
        'at.unidad_fab, u.decimales descimales_unidad_fab,'
      
        '       mat.id_equival, mat.comprar, mat.proveedor_compra, t.nomb' +
        're_r_social desc_proveedor, mat.mov_stock_compra,'
      
        '       mat.id_a, mat.uds_compra, mat.reserva_stock, mat.n_mov_st' +
        'ock, mat.mini_nota, mat.resultado_formula, mat.formula,'
      
        '       mat.desactiva_trigger, mat.des_alto, mat.des_ancho, mat.d' +
        'es_grueso, mat.estado, mat.linea_tarea, mat.id_detalles_st,'
      
        '       mat.merma, mat.unidades_devolver, mat.almacen_devolver, m' +
        'at.n_mov_stock_reserva, mat.almacen_sal,'
      
        '       alm.ctrol_ubicacion, alm.titulo desc_almacen, art.ubicabl' +
        'e, art.lotes, art.control_stock, art.titulo_largo,'
      
        '       art.p_coste, mat.id_lote id_lote_mat, mat.lote lote_mat, ' +
        'mat.id_ubicacion, ubi.titulo desc_ubicacion,'
      
        '       e.componente desc_componente, st_alm_sal.stock, pep.pedid' +
        'os_a_pro, st_alm_lan.stock stock_alm_lan,'
      '       (select first 1 id_lote'
      '        from pro_ord_mat_lotes'
      '        where'
      '        id_orden_mat = mat.id_orden_mat'
      '        order by id_lote) id_lote,'
      '       (select first 1 lote'
      '        from pro_ord_mat_lotes'
      '        where'
      '        id_orden_mat = mat.id_orden_mat'
      '        order by id_lote) lote,'
      '       (select count(id_lote)'
      '        from pro_ord_mat_lotes'
      '        where'
      '        id_orden_mat = mat.id_orden_mat) cant_lote'
      'from pro_ord_mat mat'
      
        'left join art_almacenes alm on (alm.empresa = mat.empresa and al' +
        'm.almacen = mat.almacen)'
      
        'left join art_articulos art on (art.empresa = mat.empresa and ar' +
        't.articulo = mat.componente)'
      
        'left join emp_proveedores prov on mat.empresa = prov.empresa and' +
        ' mat.proveedor_compra = prov.proveedor'
      'left join sys_terceros t on prov.tercero = t.tercero'
      
        'left join art_almacenes_ubicaciones ubi on mat.id_ubicacion = ub' +
        'i.id_ubicacion'
      'left join pro_ord o on mat.id_orden = o.id_orden'
      
        'left join pro_mat_esc e on e.empresa = mat.empresa and e.escanda' +
        'llo = o.escandallo and e.linea_comp = mat.linea_mat'
      'left join sys_unidades_articulos u on mat.unidad_fab = u.tipo'
      
        'left join a_art_dame_stock3(mat.empresa, mat.canal, mat.almacen_' +
        'sal, mat.componente, '#39'NOW'#39') st_alm_sal on 1 = 1'
      
        'left join a_art_dame_stock3(mat.empresa, mat.canal, mat.almacen,' +
        ' mat.componente, '#39'NOW'#39') st_alm_lan on 1 = 1'
      
        'left join a_art_dame_pedidos_pro(mat.empresa, mat.canal, mat.alm' +
        'acen_sal, mat.componente) pep on 1 = 1'
      'where'
      'mat.id_orden_mat = :id_orden_mat')
    SelectSQL.Strings = (
      
        'select mat.empresa, mat.ejercicio, mat.canal, mat.series, mat.ri' +
        'g_of, mat.suborden, mat.linea_mat, mat.almacen,'
      
        '       mat.componente, mat.orden, mat.unidades_nec, unidades_uti' +
        'l, mat.porcentaje, mat.linea_fase, mat.pre_cos_uni,'
      
        '       mat.total_var, mat.precio_fijo, mat.total, mat.produccion' +
        ', mat.matesc, mat.entrada, mat.id_orden, mat.id_orden_mat,'
      
        '       mat.unidades_fab, mat.unidades_stock, mat.pre_cos_uni_rea' +
        'l, mat.id_mov_stock, mat.unidades_prev,'
      
        '       mat.precio_fijo_real, mat.total_var_real, mat.total_real,' +
        ' mat.notas_mat, mat.medidas, mat.tipo_pieza, mat.num_piezas,'
      
        '       mat.id_mov_stock_b, mat.id_mov_stock_c, mat.unidad_art, m' +
        'at.unidad_fab, u.decimales descimales_unidad_fab,'
      
        '       mat.id_equival, mat.comprar, mat.proveedor_compra, t.nomb' +
        're_r_social desc_proveedor, mat.mov_stock_compra,'
      
        '       mat.id_a, mat.uds_compra, mat.reserva_stock, mat.n_mov_st' +
        'ock, mat.mini_nota, mat.resultado_formula, mat.formula,'
      
        '       mat.desactiva_trigger, mat.des_alto, mat.des_ancho, mat.d' +
        'es_grueso, mat.estado, mat.linea_tarea, mat.id_detalles_st,'
      
        '       mat.merma, mat.unidades_devolver, mat.almacen_devolver, m' +
        'at.n_mov_stock_reserva, mat.almacen_sal,'
      
        '       alm.ctrol_ubicacion, alm.titulo desc_almacen, art.ubicabl' +
        'e, art.lotes, art.control_stock, art.titulo_largo,'
      
        '       art.p_coste, mat.id_lote id_lote_mat, mat.lote lote_mat, ' +
        'mat.id_ubicacion, ubi.titulo desc_ubicacion,'
      
        '       e.componente desc_componente, st_alm_sal.stock, pep.pedid' +
        'os_a_pro, st_alm_lan.stock stock_alm_lan,'
      '       (select first 1 id_lote'
      '        from pro_ord_mat_lotes'
      '        where'
      '        id_orden_mat = mat.id_orden_mat'
      '        order by id_lote) id_lote,'
      '       (select first 1 lote'
      '        from pro_ord_mat_lotes'
      '        where'
      '        id_orden_mat = mat.id_orden_mat'
      '        order by id_lote) lote,'
      '       (select count(id_lote)'
      '        from pro_ord_mat_lotes'
      '        where'
      '        id_orden_mat = mat.id_orden_mat) cant_lote'
      'from pro_ord_mat mat'
      
        'left join art_almacenes alm on (alm.empresa = mat.empresa and al' +
        'm.almacen = mat.almacen)'
      
        'left join art_articulos art on (art.empresa = mat.empresa and ar' +
        't.articulo = mat.componente)'
      
        'left join emp_proveedores prov on mat.empresa = prov.empresa and' +
        ' mat.proveedor_compra = prov.proveedor'
      'left join sys_terceros t on prov.tercero = t.tercero'
      
        'left join art_almacenes_ubicaciones ubi on mat.id_ubicacion = ub' +
        'i.id_ubicacion'
      'left join pro_ord o on mat.id_orden = o.id_orden'
      
        'left join pro_mat_esc e on e.empresa = mat.empresa and e.escanda' +
        'llo = o.escandallo and e.linea_comp = mat.linea_mat'
      'left join sys_unidades_articulos u on mat.unidad_fab = u.tipo'
      
        'left join a_art_dame_stock3(mat.empresa, mat.canal, mat.almacen_' +
        'sal, mat.componente, '#39'NOW'#39') st_alm_sal on 1 = 1'
      
        'left join a_art_dame_stock3(mat.empresa, mat.canal, mat.almacen,' +
        ' mat.componente, '#39'NOW'#39') st_alm_lan on 1 = 1'
      
        'left join a_art_dame_pedidos_pro(mat.empresa, mat.canal, mat.alm' +
        'acen_sal, mat.componente) pep on 1 = 1'
      'where'
      'mat.empresa = :empresa and'
      'mat.ejercicio = :ejercicio and'
      'mat.canal = :canal and'
      'mat.series = :series and'
      'mat.rig_of = :rig_of and'
      'mat.linea_fase = :linea_fase'
      'order by mat.orden, mat.linea_mat')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_MAT'
      'SET'
      '  ALMACEN=?ALMACEN '
      '  ,LOTE=?LOTE '
      '  ,COMPONENTE=?COMPONENTE '
      '  ,ORDEN=?ORDEN '
      '  ,UNIDADES_NEC=?UNIDADES_NEC '
      '  ,UNIDADES_UTIL=?UNIDADES_UTIL '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL=?TOTAL '
      '  ,ENTRADA=?ENTRADA'
      '  ,MATESC=?MATESC'
      '  ,UNIDADES_FAB=?UNIDADES_FAB'
      '  ,UNIDADES_STOCK=?UNIDADES_STOCK'
      '  /*,NOTAS_MAT=?NOTAS_MAT*/'
      '  ,UNIDADES_PREV=?UNIDADES_PREV'
      '  ,PRECIO_FIJO_REAL=?PRECIO_FIJO_REAL'
      '  ,TOTAL_VAR_REAL=?TOTAL_VAR_REAL'
      '  ,TOTAL_REAL=?TOTAL_REAL'
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL'
      '  ,MEDIDAS=?MEDIDAS'
      '  ,TIPO_PIEZA=?TIPO_PIEZA'
      '  ,NUM_PIEZAS=?NUM_PIEZAS'
      '  ,UNIDAD_ART=?UNIDAD_ART'
      '  ,UNIDAD_FAB=?UNIDAD_FAB'
      '  ,ID_EQUIVAL=?ID_EQUIVAL'
      '  ,COMPRAR=?COMPRAR'
      '  ,PROVEEDOR_COMPRA=?PROVEEDOR_COMPRA'
      '  ,MOV_STOCK_COMPRA=?MOV_STOCK_COMPRA'
      '  ,ID_A=?ID_A'
      '  ,UDS_COMPRA=?UDS_COMPRA'
      '  ,RESERVA_STOCK=?RESERVA_STOCK'
      '  ,RESULTADO_FORMULA=?RESULTADO_FORMULA'
      '  ,FORMULA=?FORMULA'
      '  ,MINI_NOTA=?MINI_NOTA'
      '  ,LINEA_TAREA=?LINEA_TAREA'
      '  ,ID_DETALLES_ST=?ID_DETALLES_ST'
      '  ,ID_LOTE=?ID_LOTE'
      '  ,ID_UBICACION=?ID_UBICACION'
      '  ,MERMA=?MERMA'
      '  ,DES_ANCHO=?DES_ANCHO'
      '  ,DES_GRUESO=?DES_GRUESO'
      '  ,DES_ALTO=?DES_ALTO'
      '  ,ALMACEN_SAL=?ALMACEN_SAL'
      'WHERE'
      '  ID_ORDEN_MAT = ?ID_ORDEN_MAT')
    AutoCalcFields = False
    DataSource = DSQMProOrdFases
    AfterDelete = Graba
    AfterPost = QMProOrdMatAfterPost
    BeforeDelete = QMProOrdMatBeforeDelete
    BeforeEdit = QMProOrdMatBeforeEdit
    BeforeInsert = QMProOrdMatBeforeInsert
    BeforePost = QMProOrdMatBeforePost
    OnCalcFields = QMProOrdMatCalcFields
    OnNewRecord = QMProOrdMatNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMProOrdMatEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdMatEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdMatCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdMatSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProOrdMatRIG_OF: TIntegerField
      DisplayLabel = 'Rig Of'
      FieldName = 'RIG_OF'
    end
    object QMProOrdMatSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdMatLINEA_MAT: TIntegerField
      DisplayLabel = 'Linea Mat.'
      FieldName = 'LINEA_MAT'
    end
    object QMProOrdMatALMACEN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN'
      OnChange = QMProOrdMatALMACENChange
      Size = 3
    end
    object QMProOrdMatCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMProOrdMatCOMPONENTEChange
      Size = 15
    end
    object QMProOrdMatORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProOrdMatUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Uds. a Utilizar'
      FieldName = 'UNIDADES_STOCK'
      OnGetText = QMProOrdMatUNIDADES_STOCKGetText
    end
    object QMProOrdMatUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object QMProOrdMatUNIDADES_NEC: TFloatField
      DisplayLabel = 'Uds. Necesarias'
      FieldName = 'UNIDADES_NEC'
      OnChange = QMProOrdMatUNIDADES_NECChange
      OnGetText = QMProOrdMatUNIDADES_NECGetText
    end
    object QMProOrdMatUNIDADES_UTIL: TFloatField
      DisplayLabel = 'Uds. Utilizadas'
      FieldName = 'UNIDADES_UTIL'
    end
    object QMProOrdMatUNIDADES_PREV: TFloatField
      DisplayLabel = 'Uds. Prev.'
      FieldName = 'UNIDADES_PREV'
    end
    object QMProOrdMatPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMProOrdMatLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdMatPRE_COS_UNI: TFloatField
      DisplayLabel = 'P. Coste Unit. Prev.'
      FieldName = 'PRE_COS_UNI'
      OnChange = QMProOrdMatPRE_COS_UNIChange
    end
    object QMProOrdMatTOTAL_VAR: TFloatField
      DisplayLabel = 'Precio Variable Prev.'
      FieldName = 'TOTAL_VAR'
    end
    object QMProOrdMatPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo Prev.'
      FieldName = 'PRECIO_FIJO'
      OnChange = QMProOrdMatPRECIO_FIJOChange
    end
    object QMProOrdMatTOTAL: TFloatField
      DisplayLabel = 'Total Prev.'
      FieldName = 'TOTAL'
    end
    object QMProOrdMatDescrAlmacen: TStringField
      DisplayLabel = 'Desc. Almacen Lan.'
      FieldKind = fkCalculated
      FieldName = 'DESCRALMACEN'
      Size = 60
      Calculated = True
    end
    object QMProOrdMatPrecioMat: TFloatField
      DisplayLabel = 'Precio Mat.'
      FieldKind = fkCalculated
      FieldName = 'PRECIOMAT'
      Calculated = True
    end
    object QMProOrdMatPRODUCCION: TIntegerField
      DisplayLabel = 'Produccion'
      FieldName = 'PRODUCCION'
    end
    object QMProOrdMatMATESC: TIntegerField
      DisplayLabel = 'Mat. Esc.'
      FieldName = 'MATESC'
    end
    object QMProOrdMatENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMProOrdMatID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdMatID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'Id Orden Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMProOrdMatID_MOV_STOCK: TIntegerField
      DisplayLabel = 'Id Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMProOrdMatLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldKind = fkCalculated
      FieldName = 'LOTE'
      Calculated = True
    end
    object QMProOrdMatPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'P.Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
      OnChange = QMProOrdMatPRE_COS_UNI_REALChange
    end
    object QMProOrdMatPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object QMProOrdMatTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object QMProOrdMatTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMProOrdMatNOTAS_MAT: TMemoField
      DisplayLabel = 'Notas Mat.'
      FieldName = 'NOTAS_MAT'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdMatMEDIDAS: TFIBStringField
      DisplayLabel = 'Medidas'
      FieldName = 'MEDIDAS'
      Size = 60
    end
    object QMProOrdMatTIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Tipo Pieza'
      FieldName = 'TIPO_PIEZA'
      Size = 60
    end
    object QMProOrdMatNUM_PIEZAS: TFIBStringField
      DisplayLabel = 'N'#250'm. Piezas'
      FieldName = 'NUM_PIEZAS'
      Size = 60
    end
    object QMProOrdMatUNIDAD_ART: TFIBStringField
      DisplayLabel = 'Ud. Art.'
      FieldName = 'UNIDAD_ART'
      Size = 2
    end
    object QMProOrdMatUNIDAD_FAB: TFIBStringField
      DisplayLabel = 'Ud. Fab.'
      FieldName = 'UNIDAD_FAB'
      Size = 2
    end
    object QMProOrdMatID_MOV_STOCK_B: TIntegerField
      DisplayLabel = 'Id Mov. Stock B'
      FieldName = 'ID_MOV_STOCK_B'
    end
    object QMProOrdMatID_MOV_STOCK_C: TIntegerField
      DisplayLabel = 'Id Mov. Stock C'
      FieldName = 'ID_MOV_STOCK_C'
    end
    object QMProOrdMatID_EQUIVAL: TIntegerField
      DisplayLabel = 'Id Equival.'
      FieldName = 'ID_EQUIVAL'
    end
    object QMProOrdMatCOMPRAR: TIntegerField
      DisplayLabel = 'Comprar'
      FieldName = 'COMPRAR'
      OnChange = QMProOrdMatCOMPRARChange
    end
    object QMProOrdMatPROVEEDOR_COMPRA: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR_COMPRA'
      OnChange = QMProOrdMatPROVEEDOR_COMPRAChange
    end
    object QMProOrdMatMOV_STOCK_COMPRA: TIntegerField
      DisplayLabel = 'Hacer Mov.Stock Compra'
      FieldName = 'MOV_STOCK_COMPRA'
    end
    object QMProOrdMatID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object QMProOrdMatUDS_COMPRA: TFloatField
      DisplayLabel = 'Uds. Compra'
      FieldName = 'UDS_COMPRA'
    end
    object QMProOrdMatRESERVA_STOCK: TIntegerField
      DisplayLabel = 'Reservar'
      FieldName = 'RESERVA_STOCK'
    end
    object QMProOrdMatDESCRIPPROVEEDOR: TStringField
      DisplayLabel = 'Desc. Proveedor'
      FieldKind = fkCalculated
      FieldName = 'DESCRIPPROVEEDOR'
      Size = 60
      Calculated = True
    end
    object QMProOrdMatRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Resultado F'#243'rmula'
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMProOrdMatFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
    object QMProOrdMatDES_ALTO: TFloatField
      DisplayLabel = 'Des. Alto'
      FieldName = 'DES_ALTO'
    end
    object QMProOrdMatDES_ANCHO: TFloatField
      DisplayLabel = 'Des. Ancho'
      FieldName = 'DES_ANCHO'
    end
    object QMProOrdMatDES_GRUESO: TFloatField
      DisplayLabel = 'Des. Grueso'
      FieldName = 'DES_GRUESO'
    end
    object QMProOrdMatN_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object QMProOrdMatMINI_NOTA: TFIBStringField
      DisplayLabel = 'Mini Nota'
      FieldName = 'MINI_NOTA'
      Size = 60
    end
    object QMProOrdMatDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMProOrdMatESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProOrdMatLINEA_TAREA: TIntegerField
      DisplayLabel = 'Lin. Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMProOrdMatID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMProOrdMatID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMProOrdMatID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
      OnChange = QMProOrdMatID_UBICACIONChange
    end
    object QMProOrdMatTITULO_UBICACION: TStringField
      DisplayLabel = 'Titulo Ubic.'
      FieldKind = fkCalculated
      FieldName = 'TITULO_UBICACION'
      Size = 60
      Calculated = True
    end
    object QMProOrdMatMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMProOrdMatUNIDADES_DEVOLVER: TFloatField
      DisplayLabel = 'Uds. Devolver'
      FieldName = 'UNIDADES_DEVOLVER'
    end
    object QMProOrdMatALMACEN_DEVOLVER: TFIBStringField
      DisplayLabel = 'Alm. Devolver'
      FieldName = 'ALMACEN_DEVOLVER'
      Size = 3
    end
    object QMProOrdMatDESC_COMPONENTE: TStringField
      DisplayLabel = 'Desc. Componente'
      FieldName = 'DESC_COMPONENTE'
    end
    object QMProOrdMatALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProOrdMatSTOCK: TFloatField
      DisplayLabel = 'Stock (Alm. Sal.)'
      FieldName = 'STOCK'
      ReadOnly = True
      OnGetText = QMProOrdMatSTOCKGetText
    end
    object QMProOrdMatSTOCK_ALM_LAN: TFloatField
      DisplayLabel = 'Stock (Alm. Lanz)'
      FieldName = 'STOCK_ALM_LAN'
      ReadOnly = True
      OnGetText = QMProOrdMatSTOCK_ALM_LANGetText
    end
    object QMProOrdMatPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov. (Alm. Sal.)'
      FieldName = 'PEDIDOS_A_PRO'
      OnGetText = QMProOrdMatPEDIDOS_A_PROGetText
    end
    object QMProOrdMatCTROL_UBICACION: TIntegerField
      DisplayLabel = 'Ctrol. Ubicacion Alm. Lan'
      FieldName = 'CTROL_UBICACION'
    end
    object QMProOrdMatUBICABLE: TIntegerField
      DisplayLabel = 'Ctrol. Ubicacion'
      FieldName = 'UBICABLE'
    end
    object QMProOrdMatLOTES: TIntegerField
      DisplayLabel = 'Ctrol. Lotes'
      FieldName = 'LOTES'
    end
    object QMProOrdMatCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMProOrdMatTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMProOrdMatMASCARA_UNIDADES_COMPONENTE: TStringField
      DisplayLabel = 'Masc. Unidades'
      FieldKind = fkCalculated
      FieldName = 'MASCARA_UNIDADES_COMPONENTE'
      Calculated = True
    end
    object QMProOrdMatCANT_LOTE: TIntegerField
      DisplayLabel = 'Cantidad Lotes Diferentes'
      FieldName = 'CANT_LOTE'
    end
    object QMProOrdMatDESC_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Desc. Prov.'
      FieldName = 'DESC_PROVEEDOR'
      Size = 60
    end
    object QMProOrdMatDESC_ALMACEN: TFIBStringField
      DisplayLabel = 'Desc. Alm.'
      FieldName = 'DESC_ALMACEN'
      Size = 40
    end
    object QMProOrdMatP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMProOrdMatDESC_UBICACION: TFIBStringField
      DisplayLabel = 'Desc. Ubic.'
      FieldName = 'DESC_UBICACION'
      Size = 60
    end
    object QMProOrdMatDESCIMALES_UNIDAD_FAB: TIntegerField
      FieldName = 'DESCIMALES_UNIDAD_FAB'
    end
  end
  object DSQMProOrdMat: TDataSource
    DataSet = QMProOrdMat
    Left = 160
    Top = 104
  end
  object QMProOrdFases: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD_FASES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  LINEA_FASE=?old_LINEA_FASE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD_FASES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,LINEA_FASE,FAS' +
        'E,ORDEN,TIPOFASE,NOTAS,'
      
        'DIBUJO,ESTADO,VALORCALIDAD,FECHA_FIN_FASE,ENTRADA,ID_ORDEN,ID_IM' +
        'AGEN,REBAJE,CANTIDAD_ENTRADA,CANTIDAD_TERMINADA,'
      
        'MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,MERMA_FASE_PREV,PIEZAS_HORA_' +
        'PREV,FECHA_INICIO_FASE,CODIGO_MODELO,ID_FASE_ESC)'
      'VALUES'
      '  (?EMPRESA,'
      
        '?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?LINEA_FASE,?FASE,?O' +
        'RDEN,?TIPOFASE,?NOTAS,'
      
        '?DIBUJO,?ESTADO,?VALORCALIDAD,?FECHA_FIN_FASE,?ENTRADA,?ID_ORDEN' +
        ',?ID_IMAGEN,?REBAJE,?CANTIDAD_ENTRADA,?CANTIDAD_TERMINADA,'
      
        '?MEDIDA_1,?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?MERMA_FASE_PREV,?PIEZAS' +
        '_HORA_PREV,?FECHA_INICIO_FASE,?CODIGO_MODELO,?ID_FASE_ESC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_FASES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRO_ORD_FASES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF'
      'ORDER BY ORDEN, LINEA_FASE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD_FASES'
      'SET'
      '  SUBORDEN=?SUBORDEN '
      '  ,FASE=?FASE '
      '  ,ORDEN=?ORDEN '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,NOTAS=?NOTAS '
      '  ,DIBUJO=?DIBUJO '
      '  ,ESTADO=?ESTADO '
      '  ,VALORCALIDAD=?VALORCALIDAD '
      '  ,FECHA_FIN_FASE=?FECHA_FIN_FASE '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,REBAJE=?REBAJE '
      '  ,CANTIDAD_ENTRADA=?CANTIDAD_ENTRADA '
      '  ,CANTIDAD_TERMINADA=?CANTIDAD_TERMINADA '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,MERMA_FASE_PREV=?MERMA_FASE_PREV '
      '  ,PIEZAS_HORA_PREV=?PIEZAS_HORA_PREV '
      '  ,FECHA_INICIO_FASE=?FECHA_INICIO_FASE '
      '  ,CODIGO_MODELO=?CODIGO_MODELO '
      '  ,ID_FASE_ESC=?ID_FASE_ESC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE ')
    AutoCalcFields = False
    DataSource = DSQMProOrd
    AfterDelete = Graba
    AfterOpen = QMProOrdFasesAfterOpen
    AfterPost = QMProOrdFasesAfterPost
    BeforeClose = QMProOrdFasesBeforeClose
    BeforeDelete = QMProOrdFasesBeforeDelete
    BeforeEdit = QMProOrdFasesBeforeEdit
    BeforeInsert = QMProOrdFasesBeforeInsert
    BeforePost = QMProOrdFasesBeforePost
    OnNewRecord = QMProOrdFasesNewRecord
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
    TableName = 'VER_PRO_ORD_FASES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMProOrdFasesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdFasesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdFasesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdFasesSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProOrdFasesRIG_OF: TIntegerField
      DisplayLabel = 'Rig_Of'
      FieldName = 'RIG_OF'
    end
    object QMProOrdFasesSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdFasesLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdFasesORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProOrdFasesTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      OnChange = QMProOrdFasesTIPOFASEChange
      Size = 3
    end
    object QMProOrdFasesNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdFasesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      OnChange = QMProOrdFasesESTADOChange
    end
    object QMProOrdFasesVALORCALIDAD: TIntegerField
      DisplayLabel = 'Valor Calidad'
      FieldName = 'VALORCALIDAD'
    end
    object QMProOrdFasesFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object QMProOrdFasesDIBUJO: TFIBStringField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      Size = 100
    end
    object QMProOrdFasesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProOrdFasesFECHA_FIN_FASE: TDateTimeField
      DisplayLabel = 'Fec. Fin Fase'
      FieldName = 'FECHA_FIN_FASE'
    end
    object QMProOrdFasesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdFasesID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object QMProOrdFasesREBAJE: TIntegerField
      DisplayLabel = 'Rebaje'
      FieldName = 'REBAJE'
    end
    object QMProOrdFasesCANTIDAD_ENTRADA: TFloatField
      DisplayLabel = 'Cant. Entrada'
      FieldName = 'CANTIDAD_ENTRADA'
    end
    object QMProOrdFasesCANTIDAD_TERMINADA: TFloatField
      DisplayLabel = 'Cant. Terminada'
      FieldName = 'CANTIDAD_TERMINADA'
    end
    object QMProOrdFasesMERMA_FASE_PREV: TFloatField
      DisplayLabel = '% merma prev.'
      FieldName = 'MERMA_FASE_PREV'
    end
    object QMProOrdFasesPIEZAS_HORA_PREV: TFloatField
      DisplayLabel = 'Piezas/hora prev.'
      FieldName = 'PIEZAS_HORA_PREV'
    end
    object QMProOrdFasesFECHA_INICIO_FASE: TDateTimeField
      DisplayLabel = 'Fec. Ini. Fase'
      FieldName = 'FECHA_INICIO_FASE'
    end
    object QMProOrdFasesID_FASE_ESC: TIntegerField
      DisplayLabel = 'Id Fase Esc.'
      FieldName = 'ID_FASE_ESC'
    end
    object QMProOrdFasesTIEMPO: TFloatField
      DisplayLabel = 'Tiempo Previsto'
      FieldName = 'TIEMPO'
      OnGetText = QMProOrdFasesTIEMPOGetText
    end
    object QMProOrdFasesTIEMPO_UTIL: TFloatField
      DisplayLabel = 'Tiempo Real'
      FieldName = 'TIEMPO_UTIL'
      OnGetText = QMProOrdFasesTIEMPO_UTILGetText
    end
    object QMProOrdFasesDIFERENCIA_TIEMPO: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'DIFERENCIA_TIEMPO'
      OnGetText = QMProOrdFasesDIFERENCIA_TIEMPOGetText
    end
  end
  object DSQMProOrdFases: TDataSource
    DataSet = QMProOrdFases
    Left = 160
    Top = 56
  end
  object QMProOrdTarea: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
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
        'TOTAL_REAL,FECHA_FIN_TAREA,CANTIDAD_UTIL,ID_UTILLAJE,TIEMPO,TIEM' +
        'PO_UTIL,UDS_FABRICADAS,CANTIDAD_IMPUTADA,TOTAL_IMP,PRECIO_IMP,TO' +
        'TAL,TOTAL_HORAS,RESULTADO_FORMULA,FECHA_INICIO_TAREA,SERIE,UNIDA' +
        'DES_DEFECTUOSAS,RIG_OF,SUBORDEN,IDENTIFICADOR,ENTRADA,ID_ORDEN,O' +
        'PERACIONES_NUM,OPERACIONES_TIEMPO,FORMULA,EMPRESA,EJERCICIO,CANA' +
        'L,LINEA_FASE,LINEA_TAREA,TAREA,ORDEN,ESTADO,DESC_UTILLAJE,MAQUIN' +
        'A,TIEMPO_PRODUCCION,PRODUCIENDO,ORDEN_COLA_MAQUINA,ORDEN_OF,NO_P' +
        'RODUCTIVA,TIPOTAREA,RECURSO,ARTICULO,SECCION,ID_TAREA_ESC)'
      'VALUES'
      
        '  (?COMENTARIO,?CANTIDAD,?PRE_COS_UNI_PRE,?TOTAL_VAR_PRE,?PRECIO' +
        '_FIJO_PRE,?TOTAL_PRE,?PRE_COS_UNI_REAL,?TOTAL_VAR_REAL,?PRECIO_F' +
        'IJO_REAL,?TOTAL_REAL,?FECHA_FIN_TAREA,?CANTIDAD_UTIL,?ID_UTILLAJ' +
        'E,?TIEMPO,?TIEMPO_UTIL,?UDS_FABRICADAS,?CANTIDAD_IMPUTADA,?TOTAL' +
        '_IMP,?PRECIO_IMP,?TOTAL,?TOTAL_HORAS,?RESULTADO_FORMULA,?FECHA_I' +
        'NICIO_TAREA,?SERIE,?UNIDADES_DEFECTUOSAS,?RIG_OF,?SUBORDEN,?IDEN' +
        'TIFICADOR,?ENTRADA,?ID_ORDEN,?OPERACIONES_NUM,?OPERACIONES_TIEMP' +
        'O,?FORMULA,?EMPRESA,?EJERCICIO,?CANAL,?LINEA_FASE,?LINEA_TAREA,?' +
        'TAREA,?ORDEN,?ESTADO,?DESC_UTILLAJE,?MAQUINA,?TIEMPO_PRODUCCION,' +
        '?PRODUCIENDO,?ORDEN_COLA_MAQUINA,?ORDEN_OF,?NO_PRODUCTIVA,?TIPOT' +
        'AREA,?RECURSO,?ARTICULO,?SECCION,?ID_TAREA_ESC)')
    RefreshSQL.Strings = (
      'SELECT T.*, R.TIPORECURSO'
      'FROM PRO_ORD_TAREA T'
      
        'JOIN PRO_RECURSOS R ON R.EMPRESA = T.EMPRESA AND R.RECURSO = T.R' +
        'ECURSO'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL AND'
      'T.SERIE = :SERIES AND'
      'T.RIG_OF = :RIG_OF AND'
      'T.SUBORDEN = :SUBORDEN AND'
      'T.LINEA_FASE = :LINEA_FASE AND'
      'T.LINEA_TAREA = :LINEA_TAREA')
    SelectSQL.Strings = (
      'SELECT T.*, R.TIPORECURSO'
      'FROM PRO_ORD_TAREA T'
      
        'JOIN PRO_RECURSOS R ON R.EMPRESA = T.EMPRESA AND R.RECURSO = T.R' +
        'ECURSO'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL AND'
      'T.SERIE = :SERIES AND'
      'T.RIG_OF = :RIG_OF AND'
      'T.SUBORDEN = :SUBORDEN AND'
      'T.LINEA_FASE = :LINEA_FASE'
      'ORDER BY T.ORDEN, T.LINEA_TAREA')
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
      '  ,ID_UTILLAJE=?ID_UTILLAJE '
      '  ,TIEMPO=?TIEMPO '
      '  ,TIEMPO_UTIL=?TIEMPO_UTIL '
      '  ,UDS_FABRICADAS=?UDS_FABRICADAS '
      '  ,CANTIDAD_IMPUTADA=?CANTIDAD_IMPUTADA '
      '  ,TOTAL_IMP=?TOTAL_IMP '
      '  ,PRECIO_IMP=?PRECIO_IMP '
      '  ,TOTAL=?TOTAL '
      '  ,TOTAL_HORAS=?TOTAL_HORAS '
      '  ,RESULTADO_FORMULA=?RESULTADO_FORMULA '
      '  ,FECHA_INICIO_TAREA=?FECHA_INICIO_TAREA '
      '  ,UNIDADES_DEFECTUOSAS=?UNIDADES_DEFECTUOSAS '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,IDENTIFICADOR=?IDENTIFICADOR '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM '
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO '
      '  ,FORMULA=?FORMULA '
      '  ,TAREA=?TAREA '
      '  ,ORDEN=?ORDEN '
      '  ,ESTADO=?ESTADO '
      '  ,DESC_UTILLAJE=?DESC_UTILLAJE '
      '  ,MAQUINA=?MAQUINA '
      '  ,TIEMPO_PRODUCCION=?TIEMPO_PRODUCCION '
      '  ,PRODUCIENDO=?PRODUCIENDO '
      '  ,ORDEN_COLA_MAQUINA=?ORDEN_COLA_MAQUINA '
      '  ,ORDEN_OF=?ORDEN_OF '
      '  ,NO_PRODUCTIVA=?NO_PRODUCTIVA '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,RECURSO=?RECURSO '
      '  ,ARTICULO=?ARTICULO '
      '  ,SECCION=?SECCION '
      '  ,ID_TAREA_ESC=?ID_TAREA_ESC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    AutoCalcFields = False
    DataSource = DSQMProOrdFases
    AfterDelete = Graba
    AfterOpen = QMProOrdTareaAfterOpen
    AfterPost = Graba
    AfterScroll = QMProOrdTareaAfterScroll
    BeforeClose = QMProOrdTareaBeforeClose
    BeforeDelete = QMProOrdTareaBeforeDelete
    BeforeEdit = QMProOrdTareaBeforeEdit
    BeforeInsert = QMProOrdTareaBeforeInsert
    BeforePost = QMProOrdTareaBeforePost
    OnCalcFields = QMProOrdTareaCalcFields
    OnNewRecord = QMProOrdTareaNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
    object QMProOrdTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProOrdTareaRIG_OF: TIntegerField
      DisplayLabel = 'Rig_Of'
      FieldName = 'RIG_OF'
    end
    object QMProOrdTareaSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdTareaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMProOrdTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object QMProOrdTareaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProOrdTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      OnChange = QMProOrdTareaTIPOTAREAChange
      Size = 3
    end
    object QMProOrdTareaCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMProOrdTareaRECURSOChange
      Size = 5
    end
    object QMProOrdTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad Prev'
      FieldName = 'CANTIDAD'
      OnChange = QMProOrdTareaCANTIDADChange
      DisplayFormat = '###,##0.00'
    end
    object QMProOrdTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Coste Und. Previsto'
      FieldName = 'PRE_COS_UNI_PRE'
      OnChange = QMProOrdTareaPRE_COS_UNI_PREChange
    end
    object QMProOrdTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Previsto'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object QMProOrdTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Previsto'
      FieldName = 'PRECIO_FIJO_PRE'
      OnChange = QMProOrdTareaPRECIO_FIJO_PREChange
    end
    object QMProOrdTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Previsto Horas'
      FieldName = 'TOTAL_PRE'
    end
    object QMProOrdTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Und. Horas'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object QMProOrdTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Horas'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object QMProOrdTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object QMProOrdTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMProOrdTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      OnChange = QMProOrdTareaESTADOChange
    end
    object QMProOrdTareaDescrRecurso: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescrRecurso'
      Size = 60
      Calculated = True
    end
    object QMProOrdTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object QMProOrdTareaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProOrdTareaFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object QMProOrdTareaID_UTILLAJE: TFIBStringField
      DisplayLabel = 'Id Utillaje'
      FieldName = 'ID_UTILLAJE'
      Size = 10
    end
    object QMProOrdTareaDESC_UTILLAJE: TFIBStringField
      DisplayLabel = 'Desc. Utillaje'
      FieldName = 'DESC_UTILLAJE'
      Size = 40
    end
    object QMProOrdTareaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProOrdTareaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdTareaCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cantidad Horas'
      FieldName = 'CANTIDAD_UTIL'
      OnChange = QMProOrdTareaCANTIDAD_UTILChange
      DisplayFormat = '###,##0.00'
    end
    object QMProOrdTareaTIME: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tiempo Prev.'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'TIME'
      Size = 13
      Calculated = True
    end
    object QMProOrdTareaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo Prev. (Seg)'
      FieldName = 'TIEMPO'
      OnChange = QMProOrdTareaTIEMPOChange
    end
    object QMProOrdTareaTIEMPO_UTIL: TFloatField
      DisplayLabel = 'Tiempo Real (Seg)'
      FieldName = 'TIEMPO_UTIL'
      OnChange = QMProOrdTareaTIEMPO_UTILChange
    end
    object QMProOrdTareaUDS_FABRICADAS: TFloatField
      DisplayLabel = 'Uds. Fabricadas'
      FieldName = 'UDS_FABRICADAS'
    end
    object QMProOrdTareaTIME_UTIL: TStringField
      DisplayLabel = 'Tiempo Real'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'TIME_UTIL'
      Size = 13
      Calculated = True
    end
    object QMProOrdTareaCANTIDAD_IMPUTADA: TFloatField
      DisplayLabel = 'Cantidad Imp'
      FieldName = 'CANTIDAD_IMPUTADA'
    end
    object QMProOrdTareaOPERACIONES_NUM: TIntegerField
      DisplayLabel = 'Num. Op'
      FieldName = 'OPERACIONES_NUM'
      OnChange = QMProOrdTareaOPERACIONES_NUMChange
    end
    object QMProOrdTareaOPERACIONES_TIEMPO: TIntegerField
      DisplayLabel = 'Tiempo Op.'
      FieldName = 'OPERACIONES_TIEMPO'
      OnChange = QMProOrdTareaOPERACIONES_TIEMPOChange
    end
    object QMProOrdTareaCosteOperacionPre: TFloatField
      DisplayLabel = 'Coste Op. Pre.'
      FieldKind = fkCalculated
      FieldName = 'CosteOperacionPre'
      Calculated = True
    end
    object QMProOrdTareaCosteOperacionReal: TFloatField
      DisplayLabel = 'Coste Op. Real'
      FieldKind = fkCalculated
      FieldName = 'CosteOperacionReal'
      Calculated = True
    end
    object QMProOrdTareaTOTAL_IMP: TFloatField
      DisplayLabel = 'Total Imp'
      FieldName = 'TOTAL_IMP'
    end
    object QMProOrdTareaPRECIO_IMP: TFloatField
      DisplayLabel = 'Precio Imp'
      FieldName = 'PRECIO_IMP'
    end
    object QMProOrdTareaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMProOrdTareaTOTAL_HORAS: TFloatField
      DisplayLabel = 'Total horas'
      FieldName = 'TOTAL_HORAS'
    end
    object QMProOrdTareaMAQUINA: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
    end
    object QMProOrdTareaDescMaquina: TStringField
      DisplayLabel = 'Desc. Maquina'
      FieldKind = fkCalculated
      FieldName = 'DescMaquina'
      Size = 60
      Calculated = True
    end
    object QMProOrdTareaTIEMPO_PRODUCCION: TFIBStringField
      DisplayLabel = 'Tiempo Prod.'
      FieldName = 'TIEMPO_PRODUCCION'
    end
    object QMProOrdTareaFORMULA: TIntegerField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
    end
    object QMProOrdTareaFECHA_INICIO_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Ini. Tarea'
      FieldName = 'FECHA_INICIO_TAREA'
    end
    object QMProOrdTareaSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMProOrdTareaUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Uds. Defectuosas'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMProOrdTareaORDEN_COLA_MAQUINA: TIntegerField
      DisplayLabel = 'Orden Cola Maq.'
      FieldName = 'ORDEN_COLA_MAQUINA'
    end
    object QMProOrdTareaORDEN_OF: TIntegerField
      DisplayLabel = 'Orden General'
      FieldName = 'ORDEN_OF'
    end
    object QMProOrdTareaNO_PRODUCTIVA: TIntegerField
      DisplayLabel = 'No Productiva'
      FieldName = 'NO_PRODUCTIVA'
    end
    object QMProOrdTareaTIPORECURSO: TFIBStringField
      DisplayLabel = 'Tipo Rec.'
      FieldName = 'TIPORECURSO'
      Size = 3
    end
    object QMProOrdTareaID_TAREA_ESC: TIntegerField
      DisplayLabel = 'Id Tarea Esc.'
      FieldName = 'ID_TAREA_ESC'
    end
  end
  object DSQMProOrdTarea: TDataSource
    DataSet = QMProOrdTarea
    Left = 160
    Top = 200
  end
  object DSQSubOrdenes: TDataSource
    DataSet = QSubOrdenes
    Left = 160
    Top = 296
  end
  object QSubOrdenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SUBORDEN=?old_SUBORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD'
      
        '  (OBSERVACIONES,MARGEN_TOTAL,MARGEN_UNI,HORAS_TOTALES,PRECIO_VE' +
        'NTA,COSTE_UNITARIO,COSTE_TOT_REAL,COSTE_TEX_REAL,COSTE_MAQ_REAL,' +
        'COSTE_MO_REAL,COSTE_MAT_REAL,COSTE_VAR_REAL,COSTE_FIJO_REAL,COST' +
        'E_TOT_PRE,COSTE_TEX_PRE,COSTE_MAQ_PRE,COSTE_MO_PRE,COSTE_MAT_PRE' +
        ',COSTE_VAR_PRE,COSTE_FIJO_PRE,FECHA_FIN,FECHA_INI,FECHA_ENTREGA,' +
        'UNI_PENDIENTES,UNI_PRODUC,UNI_TOTAL,UNI_MANUAL,UNI_PEDID,FECHA_P' +
        'ED,FECHA_ORD,MERMA,RIG_OF,SERIES,VISTOBUENO3,VISTOBUENO2,VISTOBU' +
        'ENO1,PRIORIDAD,LINEA_PED,PEDIDO,ESTADO,ESCANDALLO,CLIENTE,SUBORD' +
        'EN,CANAL,EJERCICIO,EMPRESA,COMPUESTO,ALMACEN_ENT,ALMACEN_LAN,ALM' +
        'ACEN_SAL,SITUACION)'
      'VALUES'
      
        '  (?OBSERVACIONES,?MARGEN_TOTAL,?MARGEN_UNI,?HORAS_TOTALES,?PREC' +
        'IO_VENTA,?COSTE_UNITARIO,?COSTE_TOT_REAL,?COSTE_TEX_REAL,?COSTE_' +
        'MAQ_REAL,?COSTE_MO_REAL,?COSTE_MAT_REAL,?COSTE_VAR_REAL,?COSTE_F' +
        'IJO_REAL,?COSTE_TOT_PRE,?COSTE_TEX_PRE,?COSTE_MAQ_PRE,?COSTE_MO_' +
        'PRE,?COSTE_MAT_PRE,?COSTE_VAR_PRE,?COSTE_FIJO_PRE,?FECHA_FIN,?FE' +
        'CHA_INI,?FECHA_ENTREGA,?UNI_PENDIENTES,?UNI_PRODUC,?UNI_TOTAL,?U' +
        'NI_MANUAL,?UNI_PEDID,?FECHA_PED,?FECHA_ORD,?MERMA,?RIG_OF,?SERIE' +
        'S,?VISTOBUENO3,?VISTOBUENO2,?VISTOBUENO1,?PRIORIDAD,?LINEA_PED,?' +
        'PEDIDO,?ESTADO,?ESCANDALLO,?CLIENTE,?SUBORDEN,?CANAL,?EJERCICIO,' +
        '?EMPRESA,?COMPUESTO,?ALMACEN_ENT,?ALMACEN_LAN,?ALMACEN_SAL,?SITU' +
        'ACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  SUBORDEN=?SUBORDEN ')
    SelectSQL.Strings = (
      'Select *'
      'From PRO_ORD'
      'Where empresa=?empresa and'
      '            ejercicio=?ejercicio and'
      '            canal=?canal and'
      '            series=?series and'
      '            SubOrden=?Rig_Of')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD'
      'SET'
      '  OBSERVACIONES=?OBSERVACIONES '
      '  ,MARGEN_TOTAL=?MARGEN_TOTAL '
      '  ,MARGEN_UNI=?MARGEN_UNI '
      '  ,HORAS_TOTALES=?HORAS_TOTALES '
      '  ,PRECIO_VENTA=?PRECIO_VENTA '
      '  ,COSTE_UNITARIO=?COSTE_UNITARIO '
      '  ,COSTE_TOT_REAL=?COSTE_TOT_REAL '
      '  ,COSTE_TEX_REAL=?COSTE_TEX_REAL '
      '  ,COSTE_MAQ_REAL=?COSTE_MAQ_REAL '
      '  ,COSTE_MO_REAL=?COSTE_MO_REAL '
      '  ,COSTE_MAT_REAL=?COSTE_MAT_REAL '
      '  ,COSTE_VAR_REAL=?COSTE_VAR_REAL '
      '  ,COSTE_FIJO_REAL=?COSTE_FIJO_REAL '
      '  ,COSTE_TOT_PRE=?COSTE_TOT_PRE '
      '  ,COSTE_TEX_PRE=?COSTE_TEX_PRE '
      '  ,COSTE_MAQ_PRE=?COSTE_MAQ_PRE '
      '  ,COSTE_MO_PRE=?COSTE_MO_PRE '
      '  ,COSTE_MAT_PRE=?COSTE_MAT_PRE '
      '  ,COSTE_VAR_PRE=?COSTE_VAR_PRE '
      '  ,COSTE_FIJO_PRE=?COSTE_FIJO_PRE '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,UNI_PENDIENTES=?UNI_PENDIENTES '
      '  ,UNI_PRODUC=?UNI_PRODUC '
      '  ,UNI_TOTAL=?UNI_TOTAL '
      '  ,UNI_MANUAL=?UNI_MANUAL '
      '  ,UNI_PEDID=?UNI_PEDID '
      '  ,FECHA_PED=?FECHA_PED '
      '  ,FECHA_ORD=?FECHA_ORD '
      '  ,MERMA=?MERMA '
      '  ,VISTOBUENO3=?VISTOBUENO3 '
      '  ,VISTOBUENO2=?VISTOBUENO2 '
      '  ,VISTOBUENO1=?VISTOBUENO1 '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,PEDIDO=?PEDIDO '
      '  ,ESTADO=?ESTADO '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,CLIENTE=?CLIENTE '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,SITUACION=?SITUACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  SUBORDEN=?SUBORDEN ')
    DataSource = DSQMProOrdG
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF '
      'SUBORDEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 296
    object QSubOrdenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QSubOrdenesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QSubOrdenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QSubOrdenesSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QSubOrdenesRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.P.'
      FieldName = 'RIG_OF'
    end
    object QSubOrdenesSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QSubOrdenesALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QSubOrdenesALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QSubOrdenesALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QSubOrdenesFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha Ord.'
      FieldName = 'FECHA_ORD'
    end
    object QSubOrdenesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QSubOrdenesCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QSubOrdenesESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QSubOrdenesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QSubOrdenesPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QSubOrdenesLINEA_PED: TIntegerField
      DisplayLabel = 'Lin. Ped.'
      FieldName = 'LINEA_PED'
    end
    object QSubOrdenesFECHA_PED: TDateTimeField
      DisplayLabel = 'Fecha Ped.'
      FieldName = 'FECHA_PED'
    end
    object QSubOrdenesUNI_PEDID: TFloatField
      DisplayLabel = 'Uni. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QSubOrdenesUNI_MANUAL: TFloatField
      DisplayLabel = 'Uni. Manual'
      FieldName = 'UNI_MANUAL'
    end
    object QSubOrdenesUNI_TOTAL: TFloatField
      DisplayLabel = 'Uni. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QSubOrdenesPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QSubOrdenesMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QSubOrdenesUNI_PRODUC: TFloatField
      DisplayLabel = 'Uni. Produc.'
      FieldName = 'UNI_PRODUC'
    end
    object QSubOrdenesUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uni. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QSubOrdenesFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QSubOrdenesFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INI'
    end
    object QSubOrdenesFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object QSubOrdenesCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QSubOrdenesCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object QSubOrdenesCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object QSubOrdenesCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre'
      FieldName = 'COSTE_MO_PRE'
    end
    object QSubOrdenesCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QSubOrdenesCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre.'
      FieldName = 'COSTE_TEX_PRE'
    end
    object QSubOrdenesCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object QSubOrdenesCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QSubOrdenesCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object QSubOrdenesCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object QSubOrdenesCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object QSubOrdenesCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QSubOrdenesCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object QSubOrdenesCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object QSubOrdenesCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'COSTE_UNITARIO'
    end
    object QSubOrdenesPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QSubOrdenesHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Tot.'
      FieldName = 'HORAS_TOTALES'
    end
    object QSubOrdenesMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Uni.'
      FieldName = 'MARGEN_UNI'
    end
    object QSubOrdenesMARGEN_TOTAL: TFloatField
      DisplayLabel = 'Margen Total'
      FieldName = 'MARGEN_TOTAL'
    end
    object QSubOrdenesOBSERVACIONES: TMemoField
      DisplayLabel = 'Observ.'
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QSubOrdenesVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Bueno 1'
      FieldName = 'VISTOBUENO1'
    end
    object QSubOrdenesVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Bueno 2'
      FieldName = 'VISTOBUENO2'
    end
    object QSubOrdenesVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Bueno 3'
      FieldName = 'VISTOBUENO3'
    end
    object QSubOrdenesSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
  end
  object xCostesTOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  PRO_ORD.CLIENTE,'
      '  SUM(PRO_ORD.COSTE_TOT_REAL)AS COSTE_TOT_REAL,'
      '  SUM(PRO_ORD.COSTE_TEX_REAL)AS COSTE_TEX_REAL,'
      '  SUM(PRO_ORD.COSTE_MAQ_REAL)AS COSTE_MAQ_REAL,'
      '  SUM(PRO_ORD.COSTE_MO_REAL)AS COSTE_MO_REAL,'
      '  SUM(PRO_ORD.COSTE_MAT_REAL)AS COSTE_MAT_REAL,'
      '  SUM(PRO_ORD.COSTE_VAR_REAL)AS COSTE_VAR_REAL,'
      '  SUM(PRO_ORD.COSTE_FIJO_REAL)AS COSTE_FIJO_REAL,'
      '  SUM(PRO_ORD.COSTE_TOT_PRE)AS COSTE_TOT_PRE,'
      '  SUM(PRO_ORD.COSTE_MO_PRE)AS COSTE_MO_PRE,'
      '  SUM(PRO_ORD.UNI_PEDID)AS UNI_PEDID,'
      '  SUM(PRO_ORD.COSTE_MAQ_PRE)AS COSTE_MAQ_PRE,'
      '  SUM(PRO_ORD.UNI_MANUAL)AS UNI_MANUAL,'
      '  SUM(PRO_ORD.UNI_TOTAL)AS UNI_TOTAL,'
      '  SUM(PRO_ORD.UNI_PRODUC)AS UNI_PRODUC,'
      '  SUM(PRO_ORD.UNI_PENDIENTES)AS UNI_PENDIENTES,'
      '  SUM(PRO_ORD.COSTE_FIJO_PRE)AS COSTE_FIJO_PRE,'
      '  SUM(PRO_ORD.COSTE_TEX_PRE)AS COSTE_TEX_PRE,'
      '  SUM(PRO_ORD.COSTE_MAT_PRE)AS COSTE_MAT_PRE,'
      '  SUM(PRO_ORD.COSTE_VAR_PRE)AS COSTE_VAR_PRE,'
      '  SUM(PRO_ORD.COSTE_COMPRAS)AS COSTE_COMPRAS,'
      '  SUM(PRO_ORD.COSTE_MERMA_PRE)AS COSTE_MERMA_PRE,'
      '  SUM(PRO_ORD.COSTE_MERMA_REAL)AS COSTE_MERMA_REAL'
      'FROM'
      '  PRO_ORD'
      'WHERE'
      '('
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIES = ?SERIES AND'
      'RIG_OF = ?RIG_OF'
      ')'
      'OR'
      '('
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIES = ?SERIES AND'
      'SUBORDEN = ?RIG_OF'
      ')'
      'GROUP BY PRO_ORD.CLIENTE')
    UniDirectional = False
    DataSource = DSQMProOrd
    Left = 280
    Top = 344
    object xCostesTOrdenCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCostesTOrdenCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object xCostesTOrdenCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object xCostesTOrdenCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object xCostesTOrdenCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object xCostesTOrdenCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object xCostesTOrdenCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object xCostesTOrdenCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object xCostesTOrdenCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object xCostesTOrdenCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre.'
      FieldName = 'COSTE_MO_PRE'
    end
    object xCostesTOrdenUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object xCostesTOrdenCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object xCostesTOrdenUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Man.'
      FieldName = 'UNI_MANUAL'
    end
    object xCostesTOrdenUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object xCostesTOrdenUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object xCostesTOrdenUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object xCostesTOrdenCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object xCostesTOrdenCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre.'
      FieldName = 'COSTE_TEX_PRE'
    end
    object xCostesTOrdenCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object xCostesTOrdenCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object xCostesTOrdenCOSTE_COMPRAS: TFloatField
      DisplayLabel = 'Coste Compras'
      FieldName = 'COSTE_COMPRAS'
    end
    object xCostesTOrdenCOSTE_MERMA_PRE: TFloatField
      DisplayLabel = 'Coste Merma Pre.'
      FieldName = 'COSTE_MERMA_PRE'
    end
    object xCostesTOrdenCOSTE_MERMA_REAL: TFloatField
      DisplayLabel = 'Coste Merma Real'
      FieldName = 'COSTE_MERMA_REAL'
    end
  end
  object DSxCostesTOrden: TDataSource
    DataSet = xCostesTOrden
    Left = 400
    Top = 344
  end
  object QMProOrdFasesG: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
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
      
        '  (FECHA_FIN_FASE,NOTAS,ENTRADA,DIBUJO,RIG_OF,SERIES,ID_ORDEN,VA' +
        'LORCALIDAD,ESTADO,ORDEN,FASE,LINEA_FASE,SUBORDEN,CANAL,EJERCICIO' +
        ',EMPRESA,TIPOFASE)'
      'VALUES'
      
        '  (?FECHA_FIN_FASE,?NOTAS,?ENTRADA,?DIBUJO,?RIG_OF,?SERIES,?ID_O' +
        'RDEN,?VALORCALIDAD,?ESTADO,?ORDEN,?FASE,?LINEA_FASE,?SUBORDEN,?C' +
        'ANAL,?EJERCICIO,?EMPRESA,?TIPOFASE)')
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
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Series=?Series and'
      '             Rig_Of=?Rig_Of and'
      '             SubOrden=?SubOrden)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_FASES'
      'SET'
      '  FECHA_FIN_FASE=?FECHA_FIN_FASE '
      '  ,NOTAS=?NOTAS '
      '  ,ENTRADA=?ENTRADA '
      '  ,DIBUJO=?DIBUJO '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,VALORCALIDAD=?VALORCALIDAD '
      '  ,ESTADO=?ESTADO '
      '  ,ORDEN=?ORDEN '
      '  ,FASE=?FASE '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,TIPOFASE=?TIPOFASE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE ')
    DataSource = DSQMProOrdG
    AfterOpen = QMProOrdFasesGAfterOpen
    BeforeClose = QMProOrdFasesGBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF '
      'LINEA_FASE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_FASES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 344
    object QMProOrdFasesGEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdFasesGEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdFasesGCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdFasesGSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProOrdFasesGRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMProOrdFasesGSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdFasesGLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdFasesGFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object QMProOrdFasesGORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProOrdFasesGTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMProOrdFasesGNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdFasesGDIBUJO: TFIBStringField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      Size = 100
    end
    object QMProOrdFasesGESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProOrdFasesGVALORCALIDAD: TIntegerField
      DisplayLabel = 'Valor Calidad'
      FieldName = 'VALORCALIDAD'
    end
    object QMProOrdFasesGFECHA_FIN_FASE: TDateTimeField
      DisplayLabel = 'Fec. Fin Fase'
      FieldName = 'FECHA_FIN_FASE'
    end
    object QMProOrdFasesGENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProOrdFasesGID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object QMProOrdMatG: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
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
      
        '  (ID_MOV_STOCK,TOTAL,PRECIO_FIJO,TOTAL_VAR,PRE_COS_UNI,UNIDADES' +
        '_UTIL,UNIDADES_NEC,ENTRADA,MATESC,LOTE,RIG_OF,SERIES,ID_ORDEN,PR' +
        'ODUCCION,LINEA_FASE,PORCENTAJE,ORDEN,LINEA_MAT,SUBORDEN,CANAL,EJ' +
        'ERCICIO,EMPRESA,COMPONENTE,ALMACEN,ID_ORDEN_MAT,UNIDADES_FAB,UNI' +
        'DADES_STOCK,PRE_COS_UNI_REAL)'
      'VALUES'
      
        '  (?ID_MOV_STOCK,?TOTAL,?PRECIO_FIJO,?TOTAL_VAR,?PRE_COS_UNI,?UN' +
        'IDADES_UTIL,?UNIDADES_NEC,?ENTRADA,?MATESC,?LOTE,?RIG_OF,?SERIES' +
        ',?ID_ORDEN,?PRODUCCION,?LINEA_FASE,?PORCENTAJE,?ORDEN,?LINEA_MAT' +
        ',?SUBORDEN,?CANAL,?EJERCICIO,?EMPRESA,?COMPONENTE,?ALMACEN,?ID_O' +
        'RDEN_MAT,?UNIDADES_FAB,?UNIDADES_STOCK,?PRE_COS_UNI_REAL)')
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
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Series=?Series and'
      '             Rig_Of=?Rig_Of and'
      '             SubOrden=?SubOrden and'
      '             Linea_Fase=?Linea_Fase)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_MAT'
      'SET'
      '  ID_MOV_STOCK=?ID_MOV_STOCK '
      '  ,TOTAL=?TOTAL '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,UNIDADES_UTIL=?UNIDADES_UTIL '
      '  ,UNIDADES_NEC=?UNIDADES_NEC '
      '  ,ENTRADA=?ENTRADA '
      '  ,MATESC=?MATESC '
      '  ,LOTE=?LOTE '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,ORDEN=?ORDEN '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,COMPONENTE=?COMPONENTE '
      '  ,ALMACEN=?ALMACEN '
      '  ,ID_ORDEN_MAT=?ID_ORDEN_MAT '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_STOCK=?UNIDADES_STOCK '
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_MAT=?LINEA_MAT ')
    DataSource = DSQMProOrdFasesG
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF '
      'LINEA_MAT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 392
    object QMProOrdMatGEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdMatGEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdMatGCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdMatGSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProOrdMatGRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMProOrdMatGSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdMatGLINEA_MAT: TIntegerField
      DisplayLabel = 'Linea Mat.'
      FieldName = 'LINEA_MAT'
    end
    object QMProOrdMatGALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMProOrdMatGCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMProOrdMatGCOMPONENTEChange
      Size = 15
    end
    object QMProOrdMatGORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProOrdMatGUNIDADES_NEC: TFloatField
      DisplayLabel = 'Uds. Necesarias'
      FieldName = 'UNIDADES_NEC'
    end
    object QMProOrdMatGUNIDADES_UTIL: TFloatField
      DisplayLabel = 'Uds. Utilizadas'
      FieldName = 'UNIDADES_UTIL'
    end
    object QMProOrdMatGPORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
    object QMProOrdMatGLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdMatGPRE_COS_UNI: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'PRE_COS_UNI'
    end
    object QMProOrdMatGTOTAL_VAR: TFloatField
      DisplayLabel = 'Precio Variable Prev'
      FieldName = 'TOTAL_VAR'
    end
    object QMProOrdMatGPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
    end
    object QMProOrdMatGTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMProOrdMatGPRODUCCION: TIntegerField
      DisplayLabel = 'Prod.'
      FieldName = 'PRODUCCION'
    end
    object QMProOrdMatGMATESC: TIntegerField
      DisplayLabel = 'Mat. Esc.'
      FieldName = 'MATESC'
    end
    object QMProOrdMatGENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProOrdMatGID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdMatGID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMProOrdMatGUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object QMProOrdMatGUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'UNIDADES_STOCK'
    end
    object QMProOrdMatGPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object QMProOrdMatGDescAlmacen: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescAlmacen'
      OnGetText = QMProOrdMatGDescAlmacenGetText
      Size = 60
      Calculated = True
    end
    object QMProOrdMatGDescArt: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMProOrdMatGDescArtGetText
      Size = 60
      Calculated = True
    end
    object QMProOrdMatGPrecioMat: TFloatField
      DisplayLabel = 'Precio Mat.'
      FieldKind = fkCalculated
      FieldName = 'PrecioMat'
      Calculated = True
    end
    object QMProOrdMatGLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMProOrdMatGID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
  end
  object QMProOrdTarG: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
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
      
        '  (FECHA_FIN_TAREA,TOTAL_REAL,PRECIO_FIJO_REAL,TOTAL_VAR_REAL,PR' +
        'E_COS_UNI_REAL,TOTAL_PRE,PRECIO_FIJO_PRE,TOTAL_VAR_PRE,PRE_COS_U' +
        'NI_PRE,CANTIDAD,COMENTARIO,ENTRADA,IDENTIFICADOR,RIG_OF,SERIE,ID' +
        '_ORDEN,ESTADO,ORDEN,TAREA,LINEA_TAREA,LINEA_FASE,SUBORDEN,CANAL,' +
        'EJERCICIO,EMPRESA,ARTICULO,RECURSO,TIPOTAREA,CANTIDAD_UTIL)'
      'VALUES'
      
        '  (?FECHA_FIN_TAREA,?TOTAL_REAL,?PRECIO_FIJO_REAL,?TOTAL_VAR_REA' +
        'L,?PRE_COS_UNI_REAL,?TOTAL_PRE,?PRECIO_FIJO_PRE,?TOTAL_VAR_PRE,?' +
        'PRE_COS_UNI_PRE,?CANTIDAD,?COMENTARIO,?ENTRADA,?IDENTIFICADOR,?R' +
        'IG_OF,?SERIE,?ID_ORDEN,?ESTADO,?ORDEN,?TAREA,?LINEA_TAREA,?LINEA' +
        '_FASE,?SUBORDEN,?CANAL,?EJERCICIO,?EMPRESA,?ARTICULO,?RECURSO,?T' +
        'IPOTAREA,?CANTIDAD_UTIL)'
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
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Serie=?Serie and'
      '             Rig_Of=?Rig_Of and'
      '             SubOrden=?SubOrden and'
      '             Linea_Fase=?Linea_Fase)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA'
      'SET'
      '  FECHA_FIN_TAREA=?FECHA_FIN_TAREA '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,PRECIO_FIJO_REAL=?PRECIO_FIJO_REAL '
      '  ,TOTAL_VAR_REAL=?TOTAL_VAR_REAL '
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL '
      '  ,TOTAL_PRE=?TOTAL_PRE '
      '  ,PRECIO_FIJO_PRE=?PRECIO_FIJO_PRE '
      '  ,TOTAL_VAR_PRE=?TOTAL_VAR_PRE '
      '  ,PRE_COS_UNI_PRE=?PRE_COS_UNI_PRE '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,ENTRADA=?ENTRADA '
      '  ,IDENTIFICADOR=?IDENTIFICADOR '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ESTADO=?ESTADO '
      '  ,ORDEN=?ORDEN '
      '  ,TAREA=?TAREA '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,RECURSO=?RECURSO '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,CANTIDAD_UTIL=?CANTIDAD_UTIL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG_OF=?RIG_OF AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    DataSource = DSQMProOrdFasesG
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
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 440
    object QMProOrdTarGEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdTarGEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdTarGCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdTarGSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProOrdTarGRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMProOrdTarGSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdTarGLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdTarGLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMProOrdTarGTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object QMProOrdTarGORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProOrdTarGTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      OnChange = QMProOrdTarGTIPOTAREAChange
      Size = 3
    end
    object QMProOrdTarGCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdTarGRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMProOrdTarGRECURSOChange
      Size = 5
    end
    object QMProOrdTarGCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMProOrdTarGARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProOrdTarGPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Previsto'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object QMProOrdTarGTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Previsto'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object QMProOrdTarGPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Previsto'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object QMProOrdTarGTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Previsto Horas'
      FieldName = 'TOTAL_PRE'
    end
    object QMProOrdTarGPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object QMProOrdTarGTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object QMProOrdTarGPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object QMProOrdTarGTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMProOrdTarGESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProOrdTarGFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object QMProOrdTarGIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object QMProOrdTarGENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProOrdTarGID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdTarGCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cant. Horas'
      FieldName = 'CANTIDAD_UTIL'
    end
    object QMProOrdTarGDescrTarea: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescrTarea'
      OnGetText = QMProOrdTarGDescrTareaGetText
      Size = 60
      Calculated = True
    end
    object QMProOrdTarGDescrRecurso: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescrRecurso'
      OnGetText = QMProOrdTarGDescrRecursoGetText
      Size = 60
      Calculated = True
    end
  end
  object DSQMProOrdFasesG: TDataSource
    DataSet = QMProOrdFasesG
    Left = 160
    Top = 344
  end
  object DSQMProOrdMatG: TDataSource
    DataSet = QMProOrdMatG
    Left = 160
    Top = 392
  end
  object DSQMProOrdTarG: TDataSource
    DataSet = QMProOrdTarG
    Left = 160
    Top = 440
  end
  object DSQMProOrdG: TDataSource
    DataSet = QMProOrdG
    Left = 160
    Top = 248
  end
  object QMProOrdG: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
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
      'SELECT * FROM PRO_ORD'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      '           and series=?serie'
      'Order by Rig_Of,SUBORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMProOrdGAfterOpen
    AfterScroll = QMProOrdGAfterScroll
    BeforeClose = QMProOrdGBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 248
    object QMProOrdGEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdGEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdGCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdGSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProOrdGRIG_OF: TIntegerField
      DisplayLabel = 'N'#186'Orden'
      FieldName = 'RIG_OF'
    end
    object QMProOrdGSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProOrdGALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProOrdGALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMProOrdGALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMProOrdGFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha Orden'
      FieldName = 'FECHA_ORD'
    end
    object QMProOrdGCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMProOrdGCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMProOrdGESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProOrdGESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProOrdGPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMProOrdGLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMProOrdGFECHA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PED'
    end
    object QMProOrdGUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QMProOrdGUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Man.'
      FieldName = 'UNI_MANUAL'
    end
    object QMProOrdGUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QMProOrdGPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMProOrdGMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMProOrdGUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object QMProOrdGUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QMProOrdGFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMProOrdGFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMProOrdGFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMProOrdGCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QMProOrdGCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object QMProOrdGCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object QMProOrdGCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre.'
      FieldName = 'COSTE_MO_PRE'
    end
    object QMProOrdGCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QMProOrdGCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre.'
      FieldName = 'COSTE_TEX_PRE'
    end
    object QMProOrdGCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object QMProOrdGCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMProOrdGCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object QMProOrdGCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object QMProOrdGCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object QMProOrdGCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QMProOrdGCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object QMProOrdGCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object QMProOrdGCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'COSTE_UNITARIO'
    end
    object QMProOrdGPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMProOrdGHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object QMProOrdGMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Uni.'
      FieldName = 'MARGEN_UNI'
    end
    object QMProOrdGMARGEN_TOTAL: TFloatField
      DisplayLabel = 'Margen Total'
      FieldName = 'MARGEN_TOTAL'
    end
    object QMProOrdGOBSERVACIONES: TMemoField
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMProOrdGVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Bueno 1'
      FieldName = 'VISTOBUENO1'
    end
    object QMProOrdGVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Bueno 2'
      FieldName = 'VISTOBUENO2'
    end
    object QMProOrdGVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Bueno 3'
      FieldName = 'VISTOBUENO3'
    end
    object QMProOrdGSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMProOrdGMARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Margen Uni/100'
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object QMProOrdGENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProOrdGID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdGTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanz.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMProOrdGID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMProOrdGTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object QMProOrdGID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMProOrdGISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QMProOrdGISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMProOrdGISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
  end
  object xCompuesto_: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      
        'SELECT ARTICULO,CONTROLA_MEDIDAS,SERIALIZADO,LOTES,MULTIPLO_1,MU' +
        'LTIPLO_2,MULTIPLO_3,MULTIPLO_4,FACTOR_ESCALA,UD_MINIMO_COMPRA,UD' +
        '_MINIMO_VENTA,UNIDADES,ID_A'
      'FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?COMPUESTO')
    UniDirectional = True
    DataSource = DSQMProOrd
    Left = 672
    Top = 528
    object xCompuesto_ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCompuesto_CONTROLA_MEDIDAS: TIntegerField
      DisplayLabel = 'Ctrol. Medidas'
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object xCompuesto_SERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object xCompuesto_LOTES: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES'
    end
    object xCompuesto_MULTIPLO_1: TFloatField
      DisplayLabel = 'Mult. 1'
      FieldName = 'MULTIPLO_1'
    end
    object xCompuesto_MULTIPLO_2: TFloatField
      DisplayLabel = 'Mult. 2'
      FieldName = 'MULTIPLO_2'
    end
    object xCompuesto_MULTIPLO_3: TFloatField
      DisplayLabel = 'Mult. 3'
      FieldName = 'MULTIPLO_3'
    end
    object xCompuesto_MULTIPLO_4: TFloatField
      DisplayLabel = 'Mult. 4'
      FieldName = 'MULTIPLO_4'
    end
    object xCompuesto_FACTOR_ESCALA: TFloatField
      DisplayLabel = 'Fact. Escala'
      FieldName = 'FACTOR_ESCALA'
    end
    object xCompuesto_UD_MINIMO_COMPRA: TFloatField
      DisplayLabel = 'Uds. Min. Compra'
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object xCompuesto_UD_MINIMO_VENTA: TFloatField
      DisplayLabel = 'Uds. Min. Venta'
      FieldName = 'UD_MINIMO_VENTA'
    end
    object xCompuesto_UNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object xCompuesto_ID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object xGrafRecursosFases: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_graf_recursos_fases(?id_orden)')
    UniDirectional = False
    DataSource = DSQMProOrd
    Left = 528
    Top = 152
    object xGrafRecursosFasesHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object xGrafRecursosFasesFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xGrafRecursosFasesHORAS_FASE: TFloatField
      DisplayLabel = 'Horas Fase'
      FieldName = 'HORAS_FASE'
    end
    object xGrafRecursosFasesPORCENTAJE_FASE: TFloatField
      DisplayLabel = '% Fase'
      FieldName = 'PORCENTAJE_FASE'
    end
  end
  object xComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      
        'SELECT ARTICULO,CONTROLA_MEDIDAS,SERIALIZADO,LOTES,MULTIPLO_1,MU' +
        'LTIPLO_2,MULTIPLO_3,MULTIPLO_4,FACTOR_ESCALA,UD_MINIMO_COMPRA,UD' +
        '_MINIMO_VENTA,UNIDADES,ID_A'
      'FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?COMPONENTE')
    UniDirectional = True
    DataSource = DSQMProOrdMat
    Left = 528
    Top = 56
    object xComponenteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xComponenteCONTROLA_MEDIDAS: TIntegerField
      DisplayLabel = 'Ctrol. Medidas'
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object xComponenteSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object xComponenteLOTES: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES'
    end
    object xComponenteMULTIPLO_1: TFloatField
      DisplayLabel = 'Mult. 1'
      FieldName = 'MULTIPLO_1'
    end
    object xComponenteMULTIPLO_2: TFloatField
      DisplayLabel = 'Mult. 2'
      FieldName = 'MULTIPLO_2'
    end
    object xComponenteMULTIPLO_3: TFloatField
      DisplayLabel = 'Mult. 3'
      FieldName = 'MULTIPLO_3'
    end
    object xComponenteMULTIPLO_4: TFloatField
      DisplayLabel = 'Mult. 4'
      FieldName = 'MULTIPLO_4'
    end
    object xComponenteFACTOR_ESCALA: TFloatField
      DisplayLabel = 'Fact. Escala'
      FieldName = 'FACTOR_ESCALA'
    end
    object xComponenteUD_MINIMO_COMPRA: TFloatField
      DisplayLabel = 'Uds. Min. Compra'
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object xComponenteUD_MINIMO_VENTA: TFloatField
      DisplayLabel = 'Uds. Min. Venta'
      FieldName = 'UD_MINIMO_VENTA'
    end
    object xComponenteUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object xComponenteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 400
    Top = 392
  end
  object xSeleccEquival: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select first(1) id_equival from pro_sys_cab_equival'
      'where empresa=?empresa and articulo=?componente'
      'order by defecto desc, id_equival')
    UniDirectional = False
    DataSource = DSQMProOrdMat
    Left = 528
    Top = 104
    object xSeleccEquivalID_EQUIVAL: TIntegerField
      DisplayLabel = 'Equivalencia'
      FieldName = 'ID_EQUIVAL'
    end
  end
  object QMProOrdMatCompra: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_MAT_COMPRA'
      'WHERE'
      '  LINEA_COMPRA=?old_LINEA_COMPRA AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_MAT_COMPRA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG_OF,LINEA_FASE,LINEA_COMPRA,' +
        'ID_ORDEN,ID_DET_COMPRA,UDS_UTILIZADAS,ALMACEN,INCR_COSTE,TIPO_CO' +
        'MPRA,LINEA_COMPRA_DEST)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?LINEA_FASE,?LINEA_' +
        'COMPRA,?ID_ORDEN,?ID_DET_COMPRA,?UDS_UTILIZADAS,?ALMACEN,?INCR_C' +
        'OSTE,?TIPO_COMPRA,?LINEA_COMPRA_DEST)')
    RefreshSQL.Strings = (
      'SELECT C.*, O.*,'
      '       (C.UDS_UTILIZADAS * O.P_COSTE) AS COSTE_MAT_COMPRA,'
      
        '       (O.P_COSTE * (1 + C.INCR_COSTE / 100) * C.UDS_UTILIZADAS)' +
        ' AS COSTE_MAT_TOTAL,'
      
        '       (O.UNIDADES - C.UDS_UTILIZADAS) AS UDS_PENDIENTES, A.TITU' +
        'LO AS TITULO_ALMACEN'
      'FROM PRO_ORD_MAT_COMPRA C'
      
        'JOIN ART_ALMACENES A ON C.EMPRESA = A.EMPRESA AND C.ALMACEN = A.' +
        'ALMACEN'
      
        'LEFT JOIN PRO_ORD_COMPRA_ORIG(C.ID_ORDEN, C.LINEA_FASE, C.LINEA_' +
        'COMPRA, 0 /*RECURSIVO*/ ) O ON 1 = 1'
      'WHERE'
      'C.ID_ORDEN = :ID_ORDEN AND'
      'C.LINEA_FASE = :LINEA_FASE AND'
      'C.LINEA_COMPRA=:LINEA_COMPRA')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT C.*, O.*,'
      '       (C.UDS_UTILIZADAS * O.P_COSTE) AS COSTE_MAT_COMPRA,'
      
        '       (O.P_COSTE * (1 + C.INCR_COSTE / 100) * C.UDS_UTILIZADAS)' +
        ' AS COSTE_MAT_TOTAL,'
      
        '       (O.UNIDADES - C.UDS_UTILIZADAS) AS UDS_PENDIENTES, A.TITU' +
        'LO AS TITULO_ALMACEN'
      'FROM PRO_ORD_MAT_COMPRA C'
      
        'JOIN ART_ALMACENES A ON C.EMPRESA = A.EMPRESA AND C.ALMACEN = A.' +
        'ALMACEN'
      
        'LEFT JOIN PRO_ORD_COMPRA_ORIG(C.ID_ORDEN, C.LINEA_FASE, C.LINEA_' +
        'COMPRA, 0 /*RECURSIVO*/ ) O ON 1 = 1'
      'WHERE'
      'C.ID_ORDEN = :ID_ORDEN AND'
      'C.LINEA_FASE = :LINEA_FASE'
      'ORDER BY C.LINEA_COMPRA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_MAT_COMPRA'
      'SET'
      '  ID_ORDEN=?ID_ORDEN '
      '  ,ID_DET_COMPRA=?ID_DET_COMPRA '
      '  ,UDS_UTILIZADAS=?UDS_UTILIZADAS '
      '  ,ALMACEN=?ALMACEN '
      '  ,INCR_COSTE=?INCR_COSTE '
      '  ,TIPO_COMPRA=?TIPO_COMPRA '
      '  ,LINEA_COMPRA_DEST=?LINEA_COMPRA_DEST '
      'WHERE'
      '  LINEA_COMPRA=?LINEA_COMPRA AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AutoCalcFields = False
    DataSource = DSQMProOrdFases
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMProOrdMatCompraBeforePost
    OnNewRecord = QMProOrdMatCompraNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT_COMPRA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMProOrdMatCompraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProOrdMatCompraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProOrdMatCompraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProOrdMatCompraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProOrdMatCompraRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMProOrdMatCompraLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProOrdMatCompraLINEA_COMPRA: TIntegerField
      DisplayLabel = 'Lin. Compra'
      FieldName = 'LINEA_COMPRA'
    end
    object QMProOrdMatCompraID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProOrdMatCompraTIPO_COMPRA: TFIBStringField
      DisplayLabel = 'Tipo Compra'
      FieldName = 'TIPO_COMPRA'
      Size = 3
    end
    object QMProOrdMatCompraID_DET_COMPRA: TIntegerField
      DisplayLabel = 'Id Det. Compra'
      FieldName = 'ID_DET_COMPRA'
    end
    object QMProOrdMatCompraUDS_UTILIZADAS: TFloatField
      DisplayLabel = 'Uds. Utilizadas'
      FieldName = 'UDS_UTILIZADAS'
    end
    object QMProOrdMatCompraALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMProOrdMatCompraINCR_COSTE: TFloatField
      DisplayLabel = 'Incr. Coste'
      FieldName = 'INCR_COSTE'
    end
    object QMProOrdMatCompraLINEA_COMPRA_DEST: TIntegerField
      DisplayLabel = 'Linea Compra Dest.'
      FieldName = 'LINEA_COMPRA_DEST'
    end
    object QMProOrdMatCompraMOV_STOCK_COMPRA: TIntegerField
      DisplayLabel = 'Mov. Stock Compra'
      FieldName = 'MOV_STOCK_COMPRA'
    end
    object QMProOrdMatCompraLINEA_COMPRA_ORIG: TIntegerField
      DisplayLabel = 'Lin. Compra Orig.'
      FieldName = 'LINEA_COMPRA_ORIG'
    end
    object QMProOrdMatCompraID_ORDEN_MAT_COMPRA: TIntegerField
      DisplayLabel = 'Id Orden Mat. Compra'
      FieldName = 'ID_ORDEN_MAT_COMPRA'
    end
    object QMProOrdMatCompraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProOrdMatCompraBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMProOrdMatCompraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMProOrdMatCompraNUM_DOC: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_DOC'
    end
    object QMProOrdMatCompraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProOrdMatCompraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProOrdMatCompraUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMProOrdMatCompraP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMProOrdMatCompraUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
    end
    object QMProOrdMatCompraHERENCIA_RIG: TIntegerField
      DisplayLabel = 'Herencia RIG'
      FieldName = 'HERENCIA_RIG'
    end
    object QMProOrdMatCompraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProOrdMatCompraTITULO_PROV: TFIBStringField
      DisplayLabel = 'Desc. Proveedor'
      FieldName = 'TITULO_PROV'
      Size = 60
    end
    object QMProOrdMatCompraEJERCICIO_DOC: TIntegerField
      DisplayLabel = 'Ejercicio Doc.'
      FieldName = 'EJERCICIO_DOC'
    end
    object QMProOrdMatCompraCOSTE_MAT_COMPRA: TFloatField
      DisplayLabel = 'Coste Mat. Compra'
      FieldName = 'COSTE_MAT_COMPRA'
    end
    object QMProOrdMatCompraCOSTE_MAT_TOTAL: TFloatField
      DisplayLabel = 'Coste Mat. Total'
      FieldName = 'COSTE_MAT_TOTAL'
    end
    object QMProOrdMatCompraUDS_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UDS_PENDIENTES'
    end
    object QMProOrdMatCompraTITULO_ALMACEN: TFIBStringField
      DisplayLabel = 'Desc. Almacen'
      FieldName = 'TITULO_ALMACEN'
      Size = 40
    end
  end
  object DSQMProOrdMatCompra: TDataSource
    DataSet = QMProOrdMatCompra
    Left = 160
    Top = 152
  end
  object xDatosCompra: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select *'
      
        '  from pro_ord_compra_orig(?id_orden, ?linea_fase, ?linea_compra' +
        ', ?recursivo)'
      ''
      '/*select articulo, titulo, unidades, p_coste from ges_detalles_e'
      'where id_detalles_e=?id_det_compra'
      '*/')
    UniDirectional = False
    DataSource = DSQMProOrdMatCompra
    Left = 280
    Top = 200
    object xDatosCompraNUM_DOC: TIntegerField
      DisplayLabel = 'N'#250'm.Doc.'
      FieldName = 'NUM_DOC'
    end
    object xDatosCompraARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDatosCompraTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDatosCompraTIPO_COMPRA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_COMPRA'
      Size = 3
    end
    object xDatosCompraUNIDADES: TFloatField
      DisplayLabel = 'Uds. Compra'
      FieldName = 'UNIDADES'
    end
    object xDatosCompraUDS_UTILIZADAS: TFloatField
      DisplayLabel = 'Uds. Utiliz.'
      FieldName = 'UDS_UTILIZADAS'
    end
    object xDatosCompraP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosCompraUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
    end
    object xDatosCompraHERENCIA_RIG: TIntegerField
      DisplayLabel = 'Herencia RIG'
      FieldName = 'HERENCIA_RIG'
    end
    object xDatosCompraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xDatosCompraTITULO_PROV: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROV'
      Size = 60
    end
    object xDatosCompraEJERCICIO_DOC: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'EJERCICIO_DOC'
    end
  end
  object DSxDatosCompra: TDataSource
    DataSet = xDatosCompra
    Left = 400
    Top = 200
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, ALMA' +
        'CEN_SAL, ALMACEN_LAN, ALMACEN_ENT, FECHA_ORD, CLIENTE,'
      
        '       COMPUESTO, TITULO, ESCANDALLO, ESTADO, PEDIDO, LINEA_PED,' +
        ' FECHA_PED, UNI_PEDID, UNI_MANUAL, UNI_TOTAL, PRIORIDAD,'
      
        '       MERMA, UNI_PRODUC, UNI_PENDIENTES, FECHA_ENTREGA, FECHA_I' +
        'NI, FECHA_FIN, COSTE_FIJO_PRE, COSTE_VAR_PRE,'
      
        '       COSTE_MAT_PRE, COSTE_MO_PRE, COSTE_MAQ_PRE, COSTE_TEX_PRE' +
        ', COSTE_TOT_PRE, COSTE_FIJO_REAL, COSTE_VAR_REAL,'
      
        '       COSTE_MAT_REAL, COSTE_MO_REAL, COSTE_MAQ_REAL, COSTE_TEX_' +
        'REAL, COSTE_TOT_REAL, COSTE_UNITARIO, PRECIO_VENTA,'
      
        '       HORAS_TOTALES, MARGEN_UNI, MARGEN_TOTAL, VISTOBUENO1, VIS' +
        'TOBUENO2, VISTOBUENO3, SITUACION,'
      
        '       MARGEN_UNI_CIEN, ENTRADA, ID_ORDEN, TIPO_LANZAMIENTO, ID_' +
        'ORDEN_MAT, TIPO_RESERVA, ID_MOV_STOCK, ISO_APROBADO,'
      
        '       ISO_VERIFICADO, ISO_VALIDADO, ID_A, PADRE_SUBORDEN, CONT_' +
        'SUBORDEN, REFERENCIA, COSTE_COMPRAS, HORAS_OPERARIO,'
      
        '       HORAS_MAQUINA, ID_DESPIECE, ID_ORDEN_SUBORDEN, SELECCIONA' +
        'DA, PREVALECE_ALM_ORDEN, CERRAR_SUBORDENES, IMPORTAR_OP,'
      
        '       CASO_OP, RESERVA_STOCK_OP, MEDIDA_1, MEDIDA_2, MEDIDA_3, ' +
        'MEDIDA_4, DESACTIVA_TRIGGER, RESPONSABLE,'
      
        '       DIF_COSTE_FIJO, DIF_COSTE_MAT, DIF_COSTE_MO, DIF_COSTE_MA' +
        'Q, DIF_COSTE_TEXT, DIF_COSTE_VAR, COSTE_COMPRAS_PRE,'
      
        '       DIF_COSTE_COMPRAS, DIF_COSTE_TOTAL, COMPUESTOS_VIRTUALES,' +
        ' SEGUIR_SIN_STOCK, MARGEN_TOTAL_PRE,'
      
        '       MARGEN_UNI_CIEN_PRE, COSTE_UNITARIO_PRE, MARGEN_UNI_PRE, ' +
        'PRECIO_VENTA_PRE, PRECIO_VENTA_TOT_PRE,'
      
        '       PRECIO_VENTA_TOT_REAL, DIF_COSTE_MARGEN_TOTAL, DIF_MARGEN' +
        '_TOTAL, DIF_MARGEN_UNI_CIEN, DIF_PRECIO_VENTA_UNI,'
      
        '       DIF_COSTE_UNI, DIF_MARGEN_UNI, DIF_PRECIO_VENTA_TOT, HORA' +
        'S_OPERARIO_PRE, HORAS_MAQUINA_PRE, DIF_HORAS_MAQUINA,'
      
        '       DIF_HORAS_OPERARIO, RECUPERADO_MARCAJE, UNI_FABRICADAS, P' +
        'LANIFICACION, LINEA_PLANIFICACION, ID_PLANIFICACION,'
      
        '       ID_PLANIFICACION_DET, ID_LOTE, ID_UBICACION, ID_MOV_STOCK' +
        '_RESERVA, DESC_LOTE, UNIDAD, COSTE_MERMA_PRE,'
      
        '       COSTE_MERMA_REAL, DIF_COSTE_MERMA, COPIAS_PMP, VERSION_OR' +
        'DEN,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = O.ID_ORDEN) UNIDADES_RESERVADAS'
      'FROM VER_PRO_ORD O'
      'WHERE'
      'O.ID_ORDEN = :ID_ORDEN')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, ALMA' +
        'CEN_SAL, ALMACEN_LAN, ALMACEN_ENT, FECHA_ORD, CLIENTE,'
      
        '       COMPUESTO, TITULO, ESCANDALLO, ESTADO, PEDIDO, LINEA_PED,' +
        ' FECHA_PED, UNI_PEDID, UNI_MANUAL, UNI_TOTAL, PRIORIDAD,'
      
        '       MERMA, UNI_PRODUC, UNI_PENDIENTES, FECHA_ENTREGA, FECHA_I' +
        'NI, FECHA_FIN, COSTE_FIJO_PRE, COSTE_VAR_PRE,'
      
        '       COSTE_MAT_PRE, COSTE_MO_PRE, COSTE_MAQ_PRE, COSTE_TEX_PRE' +
        ', COSTE_TOT_PRE, COSTE_FIJO_REAL, COSTE_VAR_REAL,'
      
        '       COSTE_MAT_REAL, COSTE_MO_REAL, COSTE_MAQ_REAL, COSTE_TEX_' +
        'REAL, COSTE_TOT_REAL, COSTE_UNITARIO, PRECIO_VENTA,'
      
        '       HORAS_TOTALES, MARGEN_UNI, MARGEN_TOTAL, VISTOBUENO1, VIS' +
        'TOBUENO2, VISTOBUENO3, SITUACION,'
      
        '       MARGEN_UNI_CIEN, ENTRADA, ID_ORDEN, TIPO_LANZAMIENTO, ID_' +
        'ORDEN_MAT, TIPO_RESERVA, ID_MOV_STOCK, ISO_APROBADO,'
      
        '       ISO_VERIFICADO, ISO_VALIDADO, ID_A, PADRE_SUBORDEN, CONT_' +
        'SUBORDEN, REFERENCIA, COSTE_COMPRAS, HORAS_OPERARIO,'
      
        '       HORAS_MAQUINA, ID_DESPIECE, ID_ORDEN_SUBORDEN, SELECCIONA' +
        'DA, PREVALECE_ALM_ORDEN, CERRAR_SUBORDENES, IMPORTAR_OP,'
      
        '       CASO_OP, RESERVA_STOCK_OP, MEDIDA_1, MEDIDA_2, MEDIDA_3, ' +
        'MEDIDA_4, DESACTIVA_TRIGGER, RESPONSABLE,'
      
        '       DIF_COSTE_FIJO, DIF_COSTE_MAT, DIF_COSTE_MO, DIF_COSTE_MA' +
        'Q, DIF_COSTE_TEXT, DIF_COSTE_VAR, COSTE_COMPRAS_PRE,'
      
        '       DIF_COSTE_COMPRAS, DIF_COSTE_TOTAL, COMPUESTOS_VIRTUALES,' +
        ' SEGUIR_SIN_STOCK, MARGEN_TOTAL_PRE,'
      
        '       MARGEN_UNI_CIEN_PRE, COSTE_UNITARIO_PRE, MARGEN_UNI_PRE, ' +
        'PRECIO_VENTA_PRE, PRECIO_VENTA_TOT_PRE,'
      
        '       PRECIO_VENTA_TOT_REAL, DIF_COSTE_MARGEN_TOTAL, DIF_MARGEN' +
        '_TOTAL, DIF_MARGEN_UNI_CIEN, DIF_PRECIO_VENTA_UNI,'
      
        '       DIF_COSTE_UNI, DIF_MARGEN_UNI, DIF_PRECIO_VENTA_TOT, HORA' +
        'S_OPERARIO_PRE, HORAS_MAQUINA_PRE, DIF_HORAS_MAQUINA,'
      
        '       DIF_HORAS_OPERARIO, RECUPERADO_MARCAJE, UNI_FABRICADAS, P' +
        'LANIFICACION, LINEA_PLANIFICACION, ID_PLANIFICACION,'
      
        '       ID_PLANIFICACION_DET, ID_LOTE, ID_UBICACION, ID_MOV_STOCK' +
        '_RESERVA, DESC_LOTE, UNIDAD, COSTE_MERMA_PRE,'
      
        '       COSTE_MERMA_REAL, DIF_COSTE_MERMA, COPIAS_PMP, VERSION_OR' +
        'DEN,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = O.ID_ORDEN) UNIDADES_RESERVADAS'
      'FROM VER_PRO_ORD O'
      'WHERE'
      'O.ID_ORDEN = :ID_ORDEN')
    UniDirectional = True
    DataSource = DSQMProOrd
    Left = 280
    Top = 392
    object xInfoActualizadaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoActualizadaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoActualizadaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoActualizadaSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object xInfoActualizadaRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xInfoActualizadaSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xInfoActualizadaALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object xInfoActualizadaALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object xInfoActualizadaALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object xInfoActualizadaFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORD'
    end
    object xInfoActualizadaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xInfoActualizadaCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xInfoActualizadaESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object xInfoActualizadaLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object xInfoActualizadaFECHA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PED'
    end
    object xInfoActualizadaUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object xInfoActualizadaUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Man.'
      FieldName = 'UNI_MANUAL'
    end
    object xInfoActualizadaUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object xInfoActualizadaPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object xInfoActualizadaMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object xInfoActualizadaUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object xInfoActualizadaUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object xInfoActualizadaFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object xInfoActualizadaFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INI'
    end
    object xInfoActualizadaFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object xInfoActualizadaCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object xInfoActualizadaCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object xInfoActualizadaCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object xInfoActualizadaCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre.'
      FieldName = 'COSTE_MO_PRE'
    end
    object xInfoActualizadaCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object xInfoActualizadaCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre.'
      FieldName = 'COSTE_TEX_PRE'
    end
    object xInfoActualizadaCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object xInfoActualizadaCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object xInfoActualizadaCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object xInfoActualizadaCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object xInfoActualizadaCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object xInfoActualizadaCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object xInfoActualizadaCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object xInfoActualizadaCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object xInfoActualizadaCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'COSTE_UNITARIO'
    end
    object xInfoActualizadaPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object xInfoActualizadaHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object xInfoActualizadaMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Uni.'
      FieldName = 'MARGEN_UNI'
    end
    object xInfoActualizadaMARGEN_TOTAL: TFloatField
      DisplayLabel = 'Margen Total'
      FieldName = 'MARGEN_TOTAL'
    end
    object xInfoActualizadaVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Bueno 1'
      FieldName = 'VISTOBUENO1'
    end
    object xInfoActualizadaVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Bueno 2'
      FieldName = 'VISTOBUENO2'
    end
    object xInfoActualizadaVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Bueno 3'
      FieldName = 'VISTOBUENO3'
    end
    object xInfoActualizadaSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object xInfoActualizadaMARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Margen Uni/100'
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object xInfoActualizadaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xInfoActualizadaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xInfoActualizadaTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanz.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object xInfoActualizadaID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object xInfoActualizadaTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object xInfoActualizadaID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object xInfoActualizadaISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object xInfoActualizadaISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object xInfoActualizadaISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object xInfoActualizadaID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xInfoActualizadaPADRE_SUBORDEN: TIntegerField
      DisplayLabel = 'Padre Suborden'
      FieldName = 'PADRE_SUBORDEN'
    end
    object xInfoActualizadaCONT_SUBORDEN: TIntegerField
      DisplayLabel = 'Cont. Suborden'
      FieldName = 'CONT_SUBORDEN'
    end
    object xInfoActualizadaREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object xInfoActualizadaCOSTE_COMPRAS: TFloatField
      DisplayLabel = 'Coste Compras'
      FieldName = 'COSTE_COMPRAS'
    end
    object xInfoActualizadaHORAS_OPERARIO: TFloatField
      DisplayLabel = 'Horas Operario'
      FieldName = 'HORAS_OPERARIO'
    end
    object xInfoActualizadaHORAS_MAQUINA: TFloatField
      DisplayLabel = 'Horas Maq.'
      FieldName = 'HORAS_MAQUINA'
    end
    object xInfoActualizadaID_DESPIECE: TIntegerField
      DisplayLabel = 'ID Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object xInfoActualizadaID_ORDEN_SUBORDEN: TIntegerField
      DisplayLabel = 'ID Orden SubOrd.'
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object xInfoActualizadaSELECCIONADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'SELECCIONADA'
    end
    object xInfoActualizadaPREVALECE_ALM_ORDEN: TIntegerField
      DisplayLabel = 'Prevalece Alm. Ord.'
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object xInfoActualizadaCERRAR_SUBORDENES: TIntegerField
      DisplayLabel = 'Cerrar Subord.'
      FieldName = 'CERRAR_SUBORDENES'
    end
    object xInfoActualizadaIMPORTAR_OP: TIntegerField
      DisplayLabel = 'Importar OP'
      FieldName = 'IMPORTAR_OP'
    end
    object xInfoActualizadaCASO_OP: TIntegerField
      DisplayLabel = 'Caso OP'
      FieldName = 'CASO_OP'
    end
    object xInfoActualizadaRESERVA_STOCK_OP: TIntegerField
      DisplayLabel = 'Reserva Stock OP'
      FieldName = 'RESERVA_STOCK_OP'
    end
    object xInfoActualizadaMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object xInfoActualizadaMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object xInfoActualizadaMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object xInfoActualizadaMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object xInfoActualizadaDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object xInfoActualizadaRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xInfoActualizadaDIF_COSTE_FIJO: TFloatField
      DisplayLabel = 'Dif. Coste Fijo'
      FieldName = 'DIF_COSTE_FIJO'
    end
    object xInfoActualizadaDIF_COSTE_MAT: TFloatField
      DisplayLabel = 'Dif. Coste Mat.'
      FieldName = 'DIF_COSTE_MAT'
    end
    object xInfoActualizadaDIF_COSTE_MAQ: TFloatField
      DisplayLabel = 'Dif. Coste Maq.'
      FieldName = 'DIF_COSTE_MAQ'
    end
    object xInfoActualizadaDIF_COSTE_TEXT: TFloatField
      DisplayLabel = 'Dif. Coste Text'
      FieldName = 'DIF_COSTE_TEXT'
    end
    object xInfoActualizadaDIF_COSTE_VAR: TFloatField
      DisplayLabel = 'Dif. Coste Var.'
      FieldName = 'DIF_COSTE_VAR'
    end
    object xInfoActualizadaDIF_COSTE_MO: TFloatField
      DisplayLabel = 'Dif. Coste MO'
      FieldName = 'DIF_COSTE_MO'
    end
    object xInfoActualizadaDIF_COSTE_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Total'
      FieldName = 'DIF_COSTE_TOTAL'
    end
    object xInfoActualizadaCOSTE_COMPRAS_PRE: TFloatField
      DisplayLabel = 'Coste Compras Pre.'
      FieldName = 'COSTE_COMPRAS_PRE'
    end
    object xInfoActualizadaDIF_COSTE_COMPRAS: TFloatField
      DisplayLabel = 'Dif. Coste Compras'
      FieldName = 'DIF_COSTE_COMPRAS'
    end
    object xInfoActualizadaCOMPUESTOS_VIRTUALES: TIntegerField
      DisplayLabel = 'Comp. Virt.'
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object xInfoActualizadaSEGUIR_SIN_STOCK: TIntegerField
      DisplayLabel = 'Seguir sin stock'
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object xInfoActualizadaMARGEN_TOTAL_PRE: TFloatField
      DisplayLabel = 'Margen Total Pre.'
      FieldName = 'MARGEN_TOTAL_PRE'
    end
    object xInfoActualizadaMARGEN_UNI_CIEN_PRE: TFloatField
      DisplayLabel = 'Margen Uni/100 Pre'
      FieldName = 'MARGEN_UNI_CIEN_PRE'
    end
    object xInfoActualizadaCOSTE_UNITARIO_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Pre.'
      FieldName = 'COSTE_UNITARIO_PRE'
    end
    object xInfoActualizadaMARGEN_UNI_PRE: TFloatField
      DisplayLabel = 'Margen Unit. Pre.'
      FieldName = 'MARGEN_UNI_PRE'
    end
    object xInfoActualizadaPRECIO_VENTA_PRE: TFloatField
      DisplayLabel = 'Precio Venta Pre.'
      FieldName = 'PRECIO_VENTA_PRE'
    end
    object xInfoActualizadaPRECIO_VENTA_TOT_PRE: TFloatField
      DisplayLabel = 'Precio Venta Tot. Pre.'
      FieldName = 'PRECIO_VENTA_TOT_PRE'
    end
    object xInfoActualizadaPRECIO_VENTA_TOT_REAL: TFloatField
      DisplayLabel = 'Precio Venta Tot. Real'
      FieldName = 'PRECIO_VENTA_TOT_REAL'
    end
    object xInfoActualizadaDIF_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif. Margen Total'
      FieldName = 'DIF_MARGEN_TOTAL'
    end
    object xInfoActualizadaDIF_MARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Dif. Margen Uni/100'
      FieldName = 'DIF_MARGEN_UNI_CIEN'
    end
    object xInfoActualizadaDIF_PRECIO_VENTA_UNI: TFloatField
      DisplayLabel = 'Dif. Precio Venta Unit.'
      FieldName = 'DIF_PRECIO_VENTA_UNI'
    end
    object xInfoActualizadaDIF_COSTE_UNI: TFloatField
      DisplayLabel = 'Dif. Coste Unit.'
      FieldName = 'DIF_COSTE_UNI'
    end
    object xInfoActualizadaDIF_MARGEN_UNI: TFloatField
      DisplayLabel = 'Dif. Margen Unit.'
      FieldName = 'DIF_MARGEN_UNI'
    end
    object xInfoActualizadaDIF_PRECIO_VENTA_TOT: TFloatField
      DisplayLabel = 'Dif. Precio Venta Tot.'
      FieldName = 'DIF_PRECIO_VENTA_TOT'
    end
    object xInfoActualizadaHORAS_OPERARIO_PRE: TFloatField
      DisplayLabel = 'Horas Operario Pre.'
      FieldName = 'HORAS_OPERARIO_PRE'
    end
    object xInfoActualizadaHORAS_MAQUINA_PRE: TFloatField
      DisplayLabel = 'Horas Maquina Pre'
      FieldName = 'HORAS_MAQUINA_PRE'
    end
    object xInfoActualizadaDIF_HORAS_MAQUINA: TFloatField
      DisplayLabel = 'Dif. Horas M'
      FieldName = 'DIF_HORAS_MAQUINA'
    end
    object xInfoActualizadaDIF_HORAS_OPERARIO: TFloatField
      DisplayLabel = 'Dif. Horas Oper.'
      FieldName = 'DIF_HORAS_OPERARIO'
    end
    object xInfoActualizadaDIF_COSTE_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Marg. Tot.'
      FieldName = 'DIF_COSTE_MARGEN_TOTAL'
    end
    object xInfoActualizadaRECUPERADO_MARCAJE: TIntegerField
      DisplayLabel = 'Recup. Marcaje'
      FieldName = 'RECUPERADO_MARCAJE'
    end
    object xInfoActualizadaUNI_FABRICADAS: TFloatField
      DisplayLabel = 'Uds. Fabric.'
      FieldName = 'UNI_FABRICADAS'
    end
    object xInfoActualizadaPLANIFICACION: TIntegerField
      DisplayLabel = 'Planif.'
      FieldName = 'PLANIFICACION'
    end
    object xInfoActualizadaLINEA_PLANIFICACION: TIntegerField
      DisplayLabel = 'Linea Plan.'
      FieldName = 'LINEA_PLANIFICACION'
    end
    object xInfoActualizadaID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planificacion'
      FieldName = 'ID_PLANIFICACION'
    end
    object xInfoActualizadaID_PLANIFICACION_DET: TIntegerField
      DisplayLabel = 'ID Planif. Det.'
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object xInfoActualizadaID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xInfoActualizadaID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object xInfoActualizadaID_MOV_STOCK_RESERVA: TIntegerField
      DisplayLabel = 'ID Mov. Stock Reserva'
      FieldName = 'ID_MOV_STOCK_RESERVA'
    end
    object xInfoActualizadaDESC_LOTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_LOTE'
    end
    object xInfoActualizadaUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object xInfoActualizadaCOSTE_MERMA_PRE: TFloatField
      DisplayLabel = 'Coste Merma Pre.'
      FieldName = 'COSTE_MERMA_PRE'
    end
    object xInfoActualizadaCOSTE_MERMA_REAL: TFloatField
      DisplayLabel = 'Coste Merma Real'
      FieldName = 'COSTE_MERMA_REAL'
    end
    object xInfoActualizadaDIF_COSTE_MERMA: TFloatField
      DisplayLabel = 'Dif. Coste Merma'
      FieldName = 'DIF_COSTE_MERMA'
    end
    object xInfoActualizadaUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reservadas'
      FieldName = 'UNIDADES_RESERVADAS'
    end
  end
  object QMTmpStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select tmp.id_orden, tmp.articulo, tmp.cantidad, tmp.stock, tmp.' +
        'rig_of, tmp.suborden, tmp.linea_mat, art.titulo,'
      '       (tmp.stock - tmp.cantidad) as total'
      'from tmp_comprobar_stocks tmp'
      'join con_cuentas_ges_art gart on (gart.articulo = tmp.articulo)'
      'join art_articulos art on (art.id_a = gart.id_a)'
      
        'join con_cuentas_ges_fam fam on (fam.empresa = gart.empresa and ' +
        'fam.ejercicio = gart.ejercicio and fam.canal = gart.canal and fa' +
        'm.familia = art.familia)'
      'where'
      'gart.empresa = :empresa and'
      'gart.ejercicio = :ejercicio and'
      'gart.canal = :canal and'
      'fam.venta = 0'
      'order by tmp.id_orden, tmp.suborden, tmp.linea_mat')
    UniDirectional = False
    DataSource = DSQMProOrd
    Left = 280
    Top = 296
    object QMTmpStockID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMTmpStockARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTmpStockCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMTmpStockSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMTmpStockRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMTmpStockSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMTmpStockLINEA_MAT: TIntegerField
      DisplayLabel = 'Linea Mat.'
      FieldName = 'LINEA_MAT'
    end
    object QMTmpStockTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMTmpStockTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSTmpStock: TDataSource
    DataSet = QMTmpStock
    Left = 400
    Top = 296
  end
  object xInfoIncMaterial: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'select det.* from pro_mat_inc_c cab'
      'left join pro_mat_inc_d det on (cab.id_inc_c=det.id_inc_c)'
      'where cab.id_orden=?id_orden and cab.linea_fase=?linea_fase')
    SelectSQL.Strings = (
      'SELECT DET.*, CAB.FASES'
      'FROM PRO_MAT_INC_C CAB'
      'LEFT JOIN PRO_MAT_INC_D DET ON (CAB.ID_INC_C = DET.ID_INC_C)'
      'WHERE'
      'CAB.ID_ORDEN = :ID_ORDEN AND'
      'CAB.LINEA_FASE = :LINEA_FASE'
      
        'ORDER BY DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SERIE, DET.R' +
        'IG_OF, DET.LINEA')
    UniDirectional = False
    DataSource = DSQMProOrdFases
    Left = 280
    Top = 248
    object xInfoIncMaterialLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xInfoIncMaterialCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object xInfoIncMaterialUNDS: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNDS'
    end
    object xInfoIncMaterialPRE_COS_UNI: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'PRE_COS_UNI'
    end
    object xInfoIncMaterialTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xInfoIncMaterialRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xInfoIncMaterialID_INC_C: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_INC_C'
    end
    object xInfoIncMaterialEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoIncMaterialEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoIncMaterialCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoIncMaterialSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xInfoIncMaterialNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xInfoIncMaterialID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object xInfoIncMaterialID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object xInfoIncMaterialN_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object xInfoIncMaterialALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xInfoIncMaterialID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xInfoIncMaterialID_INC_D: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_INC_D'
    end
    object xInfoIncMaterialID_ORDEN_MAT_COMPRA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ORDEN_MAT_COMPRA'
    end
    object xInfoIncMaterialFASES: TFIBStringField
      DisplayLabel = 'Fases'
      FieldName = 'FASES'
      Size = 3
    end
  end
  object DSxInfoIncMaterial: TDataSource
    DataSet = xInfoIncMaterial
    Left = 400
    Top = 248
  end
  object xInfoMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, LINE' +
        'A_MAT, ALMACEN, LOTE, COMPONENTE, ORDEN, UNIDADES_NEC,'
      
        '       UNIDADES_UTIL, PORCENTAJE, LINEA_FASE, PRE_COS_UNI, TOTAL' +
        '_VAR, PRECIO_FIJO, TOTAL, PRODUCCION, MATESC, ENTRADA,'
      
        '       ID_ORDEN, ID_ORDEN_MAT, UNIDADES_FAB, UNIDADES_STOCK, PRE' +
        '_COS_UNI_REAL, ID_MOV_STOCK, UNIDADES_PREV,'
      
        '       PRECIO_FIJO_REAL, TOTAL_VAR_REAL, TOTAL_REAL, MEDIDAS, TI' +
        'PO_PIEZA, NUM_PIEZAS, ID_MOV_STOCK_B, ID_MOV_STOCK_C,'
      
        '       UNIDAD_ART, UNIDAD_FAB, ID_EQUIVAL, COMPRAR, PROVEEDOR_CO' +
        'MPRA, MOV_STOCK_COMPRA, ID_A, UDS_COMPRA, RESERVA_STOCK,'
      
        '       N_MOV_STOCK, MINI_NOTA, RESULTADO_FORMULA, FORMULA, DESAC' +
        'TIVA_TRIGGER, DES_ALTO, DES_ANCHO, DES_GRUESO, ESTADO,'
      
        '       LINEA_TAREA, ID_DETALLES_ST, ID_LOTE, ID_UBICACION, MERMA' +
        ', UNIDADES_DEVOLVER, ALMACEN_DEVOLVER,'
      '       N_MOV_STOCK_RESERVA, ALMACEN_SAL'
      'FROM PRO_ORD_MAT'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIES = :SERIES AND'
      'RIG_OF = :RIG_OF AND'
      'SUBORDEN = :SUBORDEN AND'
      'LINEA_FASE = :LINEA_FASE'
      'ORDER BY ORDEN, LINEA_MAT'
      '')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, LINE' +
        'A_MAT, ALMACEN, LOTE, COMPONENTE, ORDEN, UNIDADES_NEC,'
      
        '       UNIDADES_UTIL, PORCENTAJE, LINEA_FASE, PRE_COS_UNI, TOTAL' +
        '_VAR, PRECIO_FIJO, TOTAL, PRODUCCION, MATESC, ENTRADA,'
      
        '       ID_ORDEN, ID_ORDEN_MAT, UNIDADES_FAB, UNIDADES_STOCK, PRE' +
        '_COS_UNI_REAL, ID_MOV_STOCK, UNIDADES_PREV,'
      
        '       PRECIO_FIJO_REAL, TOTAL_VAR_REAL, TOTAL_REAL, MEDIDAS, TI' +
        'PO_PIEZA, NUM_PIEZAS, ID_MOV_STOCK_B, ID_MOV_STOCK_C,'
      
        '       UNIDAD_ART, UNIDAD_FAB, ID_EQUIVAL, COMPRAR, PROVEEDOR_CO' +
        'MPRA, MOV_STOCK_COMPRA, ID_A, UDS_COMPRA, RESERVA_STOCK,'
      
        '       N_MOV_STOCK, MINI_NOTA, RESULTADO_FORMULA, FORMULA, DESAC' +
        'TIVA_TRIGGER, DES_ALTO, DES_ANCHO, DES_GRUESO, ESTADO,'
      
        '       LINEA_TAREA, ID_DETALLES_ST, ID_LOTE, ID_UBICACION, MERMA' +
        ', UNIDADES_DEVOLVER, ALMACEN_DEVOLVER,'
      '       N_MOV_STOCK_RESERVA, ALMACEN_SAL'
      'FROM PRO_ORD_MAT'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIES = :SERIES AND'
      'RIG_OF = :RIG_OF AND'
      'SUBORDEN = :SUBORDEN AND'
      'LINEA_FASE = :LINEA_FASE'
      'ORDER BY ORDEN, LINEA_MAT')
    UniDirectional = False
    DataSource = DSQMProOrdFases
    Left = 280
    Top = 152
    object xInfoMaterialesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoMaterialesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoMaterialesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoMaterialesSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object xInfoMaterialesRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.P.'
      FieldName = 'RIG_OF'
    end
    object xInfoMaterialesSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xInfoMaterialesLINEA_MAT: TIntegerField
      DisplayLabel = 'Lin. Mat.'
      FieldName = 'LINEA_MAT'
    end
    object xInfoMaterialesALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xInfoMaterialesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xInfoMaterialesCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object xInfoMaterialesORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xInfoMaterialesUNIDADES_NEC: TFloatField
      DisplayLabel = 'Uni. Nec.'
      FieldName = 'UNIDADES_NEC'
    end
    object xInfoMaterialesUNIDADES_UTIL: TFloatField
      DisplayLabel = 'Uni. Util'
      FieldName = 'UNIDADES_UTIL'
    end
    object xInfoMaterialesPORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
    object xInfoMaterialesLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object xInfoMaterialesPRE_COS_UNI: TFloatField
      DisplayLabel = 'Pre. Cos. Uni.'
      FieldName = 'PRE_COS_UNI'
    end
    object xInfoMaterialesTOTAL_VAR: TFloatField
      DisplayLabel = 'Total Var.'
      FieldName = 'TOTAL_VAR'
    end
    object xInfoMaterialesPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
    end
    object xInfoMaterialesTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xInfoMaterialesPRODUCCION: TIntegerField
      DisplayLabel = 'Producci'#243'n'
      FieldName = 'PRODUCCION'
    end
    object xInfoMaterialesMATESC: TIntegerField
      DisplayLabel = 'Matesc'
      FieldName = 'MATESC'
    end
    object xInfoMaterialesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xInfoMaterialesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xInfoMaterialesID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Orden Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object xInfoMaterialesUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uni. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object xInfoMaterialesUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Uni. Stock'
      FieldName = 'UNIDADES_STOCK'
    end
    object xInfoMaterialesPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Pre. Cos. Uni. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xInfoMaterialesID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object xInfoMaterialesUNIDADES_PREV: TFloatField
      DisplayLabel = 'Uni. Prev.'
      FieldName = 'UNIDADES_PREV'
    end
    object xInfoMaterialesPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xInfoMaterialesTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xInfoMaterialesTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xInfoMaterialesMEDIDAS: TFIBStringField
      DisplayLabel = 'Medidas'
      FieldName = 'MEDIDAS'
      Size = 60
    end
    object xInfoMaterialesTIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Tipo Pieza'
      FieldName = 'TIPO_PIEZA'
      Size = 60
    end
    object xInfoMaterialesNUM_PIEZAS: TFIBStringField
      DisplayLabel = 'Num Piezas'
      FieldName = 'NUM_PIEZAS'
      Size = 60
    end
    object xInfoMaterialesID_MOV_STOCK_B: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_MOV_STOCK_B'
    end
    object xInfoMaterialesID_MOV_STOCK_C: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_MOV_STOCK_C'
    end
    object xInfoMaterialesUNIDAD_ART: TFIBStringField
      DisplayLabel = 'Uni. Art.'
      FieldName = 'UNIDAD_ART'
      Size = 2
    end
    object xInfoMaterialesUNIDAD_FAB: TFIBStringField
      DisplayLabel = 'Uni. Fab.'
      FieldName = 'UNIDAD_FAB'
      Size = 2
    end
    object xInfoMaterialesID_EQUIVAL: TIntegerField
      DisplayLabel = 'ID Equiv.'
      FieldName = 'ID_EQUIVAL'
    end
    object xInfoMaterialesCOMPRAR: TIntegerField
      DisplayLabel = 'Comprar'
      FieldName = 'COMPRAR'
    end
    object xInfoMaterialesPROVEEDOR_COMPRA: TIntegerField
      DisplayLabel = 'Prev. Compra'
      FieldName = 'PROVEEDOR_COMPRA'
    end
    object xInfoMaterialesMOV_STOCK_COMPRA: TIntegerField
      DisplayLabel = 'Mov. Stock Compra'
      FieldName = 'MOV_STOCK_COMPRA'
    end
    object xInfoMaterialesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xInfoMaterialesUDS_COMPRA: TFloatField
      DisplayLabel = 'Uni. Compra'
      FieldName = 'UDS_COMPRA'
    end
    object xInfoMaterialesRESERVA_STOCK: TIntegerField
      DisplayLabel = 'Reserva Stock'
      FieldName = 'RESERVA_STOCK'
    end
    object xInfoMaterialesN_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object xInfoMaterialesMINI_NOTA: TFIBStringField
      DisplayLabel = 'Mini Nota'
      FieldName = 'MINI_NOTA'
      Size = 60
    end
    object xInfoMaterialesRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Result. F'#243'rmula'
      FieldName = 'RESULTADO_FORMULA'
    end
    object xInfoMaterialesFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
    object xInfoMaterialesDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object xInfoMaterialesDES_ALTO: TFloatField
      DisplayLabel = 'Des. Alto'
      FieldName = 'DES_ALTO'
    end
    object xInfoMaterialesDES_ANCHO: TFloatField
      DisplayLabel = 'Des. Ancho'
      FieldName = 'DES_ANCHO'
    end
    object xInfoMaterialesDES_GRUESO: TFloatField
      DisplayLabel = 'Des. Grueso'
      FieldName = 'DES_GRUESO'
    end
    object xInfoMaterialesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoMaterialesLINEA_TAREA: TIntegerField
      DisplayLabel = 'L'#237'nea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xInfoMaterialesID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
  end
  object DSxInfoMat: TDataSource
    DataSet = xInfoMateriales
    Left = 400
    Top = 152
  end
  object xInfoTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT TAR.*, MARCA.IMPUTACION, IMP.DESCRIPCION AS DESCRIPCION_I' +
        'MP, MARCA_CAB.FECHA AS FECHA_MARCAJE, OPE.EMPLEADO,'
      '       TER.NOMBRE_R_SOCIAL'
      'FROM PRO_ORD_TAREA TAR'
      
        'LEFT JOIN PRO_ORD_DET_MARCA MARCA ON (TAR.IDENTIFICADOR = MARCA.' +
        'IDTAREA)'
      
        'LEFT JOIN OPE_SYS_IMPUTACION IMP ON (MARCA.IMPUTACION = IMP.IMPU' +
        'TACION)'
      
        'LEFT JOIN PRO_ORD_CAB_MARCA MARCA_CAB ON (MARCA_CAB.EMPRESA = MA' +
        'RCA.EMPRESA AND MARCA_CAB.EJERCICIO = MARCA.EJERCICIO AND MARCA_' +
        'CAB.CANAL = MARCA.CANAL AND MARCA_CAB.SERIE = MARCA.SERIE AND MA' +
        'RCA_CAB.TIPO = MARCA.TIPO AND MARCA_CAB.RIG = MARCA.RIG)'
      
        'LEFT JOIN OPE_EMPLEADO OPE ON (OPE.EMPRESA = MARCA_CAB.EMPRESA A' +
        'ND OPE.EMPLEADO = MARCA_CAB.OPERARIO)'
      'LEFT JOIN SYS_TERCEROS TER ON (TER.TERCERO = OPE.TERCERO)'
      'WHERE'
      'TAR.ID_ORDEN = :ID_ORDEN AND'
      'TAR.LINEA_FASE = :LINEA_FASE AND'
      'TAR.LINEA_TAREA = :LINEA_TAREA')
    SelectSQL.Strings = (
      
        'SELECT TAR.*, MARCA.IMPUTACION, IMP.DESCRIPCION AS DESCRIPCION_I' +
        'MP, MARCA_CAB.FECHA AS FECHA_MARCAJE, OPE.EMPLEADO,'
      '       TER.NOMBRE_R_SOCIAL'
      'FROM PRO_ORD_TAREA TAR'
      
        'LEFT JOIN PRO_ORD_DET_MARCA MARCA ON (TAR.IDENTIFICADOR = MARCA.' +
        'IDTAREA)'
      
        'LEFT JOIN OPE_SYS_IMPUTACION IMP ON (MARCA.IMPUTACION = IMP.IMPU' +
        'TACION)'
      
        'LEFT JOIN PRO_ORD_CAB_MARCA MARCA_CAB ON (MARCA_CAB.EMPRESA = MA' +
        'RCA.EMPRESA AND MARCA_CAB.EJERCICIO = MARCA.EJERCICIO AND MARCA_' +
        'CAB.CANAL = MARCA.CANAL AND MARCA_CAB.SERIE = MARCA.SERIE AND MA' +
        'RCA_CAB.TIPO = MARCA.TIPO AND MARCA_CAB.RIG = MARCA.RIG)'
      
        'LEFT JOIN OPE_EMPLEADO OPE ON (OPE.EMPRESA = MARCA_CAB.EMPRESA A' +
        'ND OPE.EMPLEADO = MARCA_CAB.OPERARIO)'
      'LEFT JOIN SYS_TERCEROS TER ON (TER.TERCERO = OPE.TERCERO)'
      'WHERE'
      'TAR.ID_ORDEN = :ID_ORDEN AND'
      'TAR.LINEA_FASE = :LINEA_FASE'
      'ORDER BY TAR.ORDEN, TAR.LINEA_TAREA  ')
    UniDirectional = False
    DataSource = DSQMProOrdFases
    Left = 280
    Top = 56
    object xInfoTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xInfoTareaRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.P.'
      FieldName = 'RIG_OF'
    end
    object xInfoTareaSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xInfoTareaLINEA_FASE: TIntegerField
      DisplayLabel = 'L'#237'nea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xInfoTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'L'#237'nea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xInfoTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xInfoTareaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xInfoTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xInfoTareaCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xInfoTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xInfoTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xInfoTareaARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xInfoTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Pre. Cos. Uni. Pre.'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object xInfoTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Pre.'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object xInfoTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Pre.'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object xInfoTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Pre.'
      FieldName = 'TOTAL_PRE'
    end
    object xInfoTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Pre. Cos. Uni. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xInfoTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xInfoTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xInfoTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xInfoTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoTareaFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fecha Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object xInfoTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xInfoTareaENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xInfoTareaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xInfoTareaCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cant. Until'
      FieldName = 'CANTIDAD_UTIL'
    end
    object xInfoTareaID_UTILLAJE: TFIBStringField
      DisplayLabel = 'ID Utillaje'
      FieldName = 'ID_UTILLAJE'
      Size = 10
    end
    object xInfoTareaDESC_UTILLAJE: TFIBStringField
      DisplayLabel = 'Desc. Utillaje'
      FieldName = 'DESC_UTILLAJE'
      Size = 40
    end
    object xInfoTareaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object xInfoTareaTIEMPO_UTIL: TFloatField
      DisplayLabel = 'Tiempo Util'
      FieldName = 'TIEMPO_UTIL'
    end
    object xInfoTareaUDS_FABRICADAS: TFloatField
      DisplayLabel = 'Uni. Fab.'
      FieldName = 'UDS_FABRICADAS'
    end
    object xInfoTareaCANTIDAD_IMPUTADA: TFloatField
      DisplayLabel = 'Cant. Imputada'
      FieldName = 'CANTIDAD_IMPUTADA'
    end
    object xInfoTareaOPERACIONES_NUM: TIntegerField
      DisplayLabel = 'Operaciones Num.'
      FieldName = 'OPERACIONES_NUM'
    end
    object xInfoTareaOPERACIONES_TIEMPO: TIntegerField
      DisplayLabel = 'Operaciones Tiempo'
      FieldName = 'OPERACIONES_TIEMPO'
    end
    object xInfoTareaTOTAL_IMP: TFloatField
      DisplayLabel = 'Total Imp.'
      FieldName = 'TOTAL_IMP'
    end
    object xInfoTareaPRECIO_IMP: TFloatField
      DisplayLabel = 'Precio Imp.'
      FieldName = 'PRECIO_IMP'
    end
    object xInfoTareaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xInfoTareaTOTAL_HORAS: TFloatField
      DisplayLabel = 'Total Horas.'
      FieldName = 'TOTAL_HORAS'
    end
    object xInfoTareaIMPUTACION: TFIBStringField
      DisplayLabel = 'Impotaci'#243'n'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object xInfoTareaDESCRIPCION_IMP: TFIBStringField
      DisplayLabel = 'Descripci'#243'n Imp.'
      FieldName = 'DESCRIPCION_IMP'
      Size = 40
    end
    object xInfoTareaFECHA_MARCAJE: TDateTimeField
      DisplayLabel = 'Fecha Marcaje'
      FieldName = 'FECHA_MARCAJE'
    end
    object xInfoTareaEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xInfoTareaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxInfoTar: TDataSource
    DataSet = xInfoTarea
    Left = 400
    Top = 56
  end
  object xInfoFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, LINE' +
        'A_FASE, FASE, ORDEN, TIPOFASE, DIBUJO, ESTADO,'
      
        '       VALORCALIDAD, FECHA_FIN_FASE, ENTRADA, ID_ORDEN, ID_IMAGE' +
        'N, REBAJE, CANTIDAD_ENTRADA, CANTIDAD_TERMINADA,'
      
        '       MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4, MERMA_FASE_PREV, ' +
        'PIEZAS_HORA_PREV, FECHA_INICIO_FASE'
      'FROM PRO_ORD_FASES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIES = :SERIES AND'
      'RIG_OF = :RIG_OF AND'
      'SUBORDEN = :SUBORDEN'
      'ORDER BY ORDEN, LINEA_FASE')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, SUBORDEN, LINE' +
        'A_FASE, FASE, ORDEN, TIPOFASE, DIBUJO, ESTADO,'
      
        '       VALORCALIDAD, FECHA_FIN_FASE, ENTRADA, ID_ORDEN, ID_IMAGE' +
        'N, REBAJE, CANTIDAD_ENTRADA, CANTIDAD_TERMINADA,'
      
        '       MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4, MERMA_FASE_PREV, ' +
        'PIEZAS_HORA_PREV, FECHA_INICIO_FASE'
      'FROM PRO_ORD_FASES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIES = :SERIES AND'
      'RIG_OF = :RIG_OF AND'
      'SUBORDEN = :SUBORDEN'
      'ORDER BY ORDEN, LINEA_FASE')
    UniDirectional = False
    DataSource = DSQMProOrd
    Left = 280
    Top = 104
    object xInfoFaseEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoFaseEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoFaseCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoFaseSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object xInfoFaseRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.P.'
      FieldName = 'RIG_OF'
    end
    object xInfoFaseSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xInfoFaseLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object xInfoFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xInfoFaseORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xInfoFaseTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xInfoFaseDIBUJO: TFIBStringField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      Size = 100
    end
    object xInfoFaseESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoFaseVALORCALIDAD: TIntegerField
      DisplayLabel = 'Valor Calidad'
      FieldName = 'VALORCALIDAD'
    end
    object xInfoFaseFECHA_FIN_FASE: TDateTimeField
      DisplayLabel = 'Fecha Fin Fase'
      FieldName = 'FECHA_FIN_FASE'
    end
    object xInfoFaseENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xInfoFaseID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xInfoFaseID_IMAGEN: TIntegerField
      DisplayLabel = 'ID Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object xInfoFaseREBAJE: TIntegerField
      DisplayLabel = 'Rebaje'
      FieldName = 'REBAJE'
    end
    object xInfoFaseCANTIDAD_ENTRADA: TFloatField
      DisplayLabel = 'Cant. Entrada'
      FieldName = 'CANTIDAD_ENTRADA'
    end
    object xInfoFaseCANTIDAD_TERMINADA: TFloatField
      DisplayLabel = 'Cant. Terminada'
      FieldName = 'CANTIDAD_TERMINADA'
    end
  end
  object DSxInfoFase: TDataSource
    DataSet = xInfoFase
    Left = 400
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
    Left = 696
    Top = 8
  end
  object xProOrdMatNotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_MAT'
      'WHERE'
      '  LINEA_MAT=?old_LINEA_MAT AND '
      '  SUBORDEN=?old_SUBORDEN AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIES=?old_SERIES AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_MAT'
      '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,LINEA_MAT,'
      '  ALMACEN,LOTE,COMPONENTE,ORDEN,UNIDADES_NEC,UNIDADES_UTIL,'
      '  PORCENTAJE,LINEA_FASE,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO,'
      '  TOTAL,ENTRADA,UNIDADES_STOCK,UNIDADES_FAB,NOTAS_MAT,'
      '  UNIDADES_PREV, PRECIO_FIJO_REAL, TOTAL_VAR_REAL,TOTAL_REAL,'
      '  MEDIDAS,TIPO_PIEZA,NUM_PIEZAS,UNIDAD_ART,UNIDAD_FAB,'
      '  ID_EQUIVAL,COMPRAR,PROVEEDOR_COMPRA,MOV_STOCK_COMPRA,'
      '  ID_A, UDS_COMPRA, RESERVA_STOCK,RESULTADO_FORMULA,FORMULA,'
      '  MINI_NOTA,LINEA_TAREA,ID_DETALLES_ST,ID_LOTE,ID_UBICACION,'
      '  MERMA, ALMACEN_SAL,ID_ORDEN_MAT)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?LINEA_M' +
        'AT,'
      
        '  ?ALMACEN,?LOTE,?COMPONENTE,?ORDEN,?UNIDADES_NEC,?UNIDADES_UTIL' +
        ','
      '  ?PORCENTAJE,?LINEA_FASE,?PRE_COS_UNI,?TOTAL_VAR,?PRECIO_FIJO,'
      '  ?TOTAL,?ENTRADA,?UNIDADES_STOCK,?UNIDADES_FAB,?NOTAS_MAT,'
      '  ?UNIDADES_PREV,?PRECIO_FIJO_REAL,?TOTAL_VAR_REAL,?TOTAL_REAL,'
      '  ?MEDIDAS,?TIPO_PIEZA,?NUM_PIEZAS,?UNIDAD_ART,?UNIDAD_FAB,'
      '  ?ID_EQUIVAL,?COMPRAR,?PROVEEDOR_COMPRA,?MOV_STOCK_COMPRA,'
      
        '  ?ID_A, ?UDS_COMPRA, ?RESERVA_STOCK,?RESULTADO_FORMULA,?FORMULA' +
        ','
      
        '  ?MINI_NOTA,?LINEA_TAREA,?ID_DETALLES_ST,?ID_LOTE,?ID_UBICACION' +
        ','
      '  ?MERMA,?ALMACEN_SAL,?ID_ORDEN_MAT)')
    RefreshSQL.Strings = (
      
        'SELECT ID_ORDEN_MAT, EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, ' +
        'LINEA_FASE, LINEA_MAT, NOTAS_MAT'
      'FROM PRO_ORD_MAT'
      'WHERE'
      'ID_ORDEN_MAT = ?ID_ORDEN_MAT')
    SelectSQL.Strings = (
      
        'SELECT ID_ORDEN_MAT, EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF, ' +
        'LINEA_FASE, LINEA_MAT, NOTAS_MAT'
      'FROM PRO_ORD_MAT'
      'WHERE'
      'ID_ORDEN_MAT = ?ID_ORDEN_MAT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_MAT'
      'SET'
      '  NOTAS_MAT=?NOTAS_MAT'
      'WHERE'
      '  ID_ORDEN_MAT = ?ID_ORDEN_MAT')
    DataSource = DSQMProOrdMat
    ClavesPrimarias.Strings = (
      'ID_ORDEN_MAT'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 528
    Top = 200
  end
  object DSxProOrdMatNotas: TDataSource
    DataSet = xProOrdMatNotas
    Left = 648
    Top = 200
  end
  object xProOrdTareaNotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_TAREA'
      'WHERE'
      '  LINEA_TAREA=?old_LINEA_TAREA AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  SUBORDEN=?old_SUBORDEN AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_TAREA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG_OF,SUBORDEN,LINEA_FASE,LINE' +
        'A_TAREA,TAREA,ORDEN,TIPOTAREA,COMENTARIO,RECURSO,CANTIDAD,ARTICU' +
        'LO,PRE_COS_UNI_PRE,TOTAL_VAR_PRE,PRECIO_FIJO_PRE,TOTAL_PRE,PRE_C' +
        'OS_UNI_REAL,TOTAL_VAR_REAL,PRECIO_FIJO_REAL,TOTAL_REAL,ESTADO,EN' +
        'TRADA ,FECHA_FIN_TAREA,ID_UTILLAJE,DESC_UTILLAJE,CANTIDAD_UTIL,T' +
        'IEMPO,TIEMPO_UTIL,UDS_FABRICADAS,UNIDADES_DEFECTUOSAS,OPERACIONE' +
        'S_NUM,OPERACIONES_TIEMPO,MAQUINA,TIEMPO_PRODUCCION,FORMULA,SECCI' +
        'ON)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?SUBORDEN,?LINEA_FA' +
        'SE,?LINEA_TAREA,?TAREA,?ORDEN,?TIPOTAREA,?COMENTARIO,?RECURSO,?C' +
        'ANTIDAD,?ARTICULO,?PRE_COS_UNI_PRE,?TOTAL_VAR_PRE,?PRECIO_FIJO_P' +
        'RE,?TOTAL_PRE,?PRE_COS_UNI_REAL,?TOTAL_VAR_REAL,?PRECIO_FIJO_REA' +
        'L,?TOTAL_REAL,?ESTADO,?ENTRADA ,?FECHA_FIN_TAREA,?ID_UTILLAJE,?D' +
        'ESC_UTILLAJE,?CANTIDAD_UTIL,?TIEMPO,?TIEMPO_UTIL,?UDS_FABRICADAS' +
        ',?UNIDADES_DEFECTUOSAS,?OPERACIONES_NUM,?OPERACIONES_TIEMPO,?MAQ' +
        'UINA,?TIEMPO_PRODUCCION,?FORMULA,?SECCION)'
      ' '
      ' ')
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, RIG_OF, LINEA_FASE, LIN' +
        'EA_TAREA, COMENTARIO'
      'FROM PRO_ORD_TAREA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'RIG_OF = :RIG_OF AND'
      'LINEA_FASE = :LINEA_FASE AND '
      'LINEA_TAREA=?LINEA_TAREA ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, RIG_OF, LINEA_FASE, LIN' +
        'EA_TAREA, COMENTARIO'
      'FROM PRO_ORD_TAREA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'RIG_OF = :RIG_OF AND'
      'LINEA_FASE = :LINEA_FASE AND '
      'LINEA_TAREA=?LINEA_TAREA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'RIG_OF = :RIG_OF AND'
      'LINEA_FASE = :LINEA_FASE AND '
      'LINEA_TAREA=?LINEA_TAREA ')
    DataSource = DSQMProOrdTarea
    ClavesPrimarias.Strings = (
      'LINEA_TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 528
    Top = 248
  end
  object DSxProOrdTareaNotas: TDataSource
    DataSet = xProOrdTareaNotas
    Left = 648
    Top = 248
  end
end
