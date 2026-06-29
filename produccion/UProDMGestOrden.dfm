object ProDMGestOrden: TProDMGestOrden
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 560
  Top = 194
  Height = 394
  Width = 562
  object QMProOrd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD'
      'WHERE'
      '  SUBORDEN=?old_SUBORDEN AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIES=?old_SERIES AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,ALMACEN_SAL,AL' +
        'MACEN_LAN,ALMACEN_ENT,FECHA_ORD,CLIENTE,COMPUESTO,ESCANDALLO,EST' +
        'ADO,PEDIDO,LINEA_PED,FECHA_PED,UNI_PEDID,UNI_MANUAL,UNI_TOTAL,PR' +
        'IORIDAD,MERMA,UNI_PRODUC,UNI_PENDIENTES,FECHA_ENTREGA,FECHA_INI,' +
        'FECHA_FIN,COSTE_FIJO_PRE,COSTE_VAR_PRE,COSTE_MAT_PRE,COSTE_MO_PR' +
        'E,COSTE_MAQ_PRE,COSTE_TEX_PRE,COSTE_TOT_PRE,COSTE_FIJO_REAL,COST' +
        'E_VAR_REAL,COSTE_MAT_REAL,COSTE_MO_REAL,COSTE_MAQ_REAL,COSTE_TEX' +
        '_REAL,COSTE_TOT_REAL,COSTE_UNITARIO,PRECIO_VENTA,HORAS_TOTALES,M' +
        'ARGEN_UNI,MARGEN_TOTAL,OBSERVACIONES,VISTOBUENO1,VISTOBUENO2,VIS' +
        'TOBUENO3,SITUACION,MARGEN_UNI_CIEN,SELECCIONADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?ALMACEN' +
        '_SAL,?ALMACEN_LAN,?ALMACEN_ENT,?FECHA_ORD,?CLIENTE,?COMPUESTO,?E' +
        'SCANDALLO,?ESTADO,?PEDIDO,?LINEA_PED,?FECHA_PED,?UNI_PEDID,?UNI_' +
        'MANUAL,?UNI_TOTAL,?PRIORIDAD,?MERMA,?UNI_PRODUC,?UNI_PENDIENTES,' +
        '?FECHA_ENTREGA,?FECHA_INI,?FECHA_FIN,?COSTE_FIJO_PRE,?COSTE_VAR_' +
        'PRE,?COSTE_MAT_PRE,?COSTE_MO_PRE,?COSTE_MAQ_PRE,?COSTE_TEX_PRE,?' +
        'COSTE_TOT_PRE,?COSTE_FIJO_REAL,?COSTE_VAR_REAL,?COSTE_MAT_REAL,?' +
        'COSTE_MO_REAL,?COSTE_MAQ_REAL,?COSTE_TEX_REAL,?COSTE_TOT_REAL,?C' +
        'OSTE_UNITARIO,?PRECIO_VENTA,?HORAS_TOTALES,?MARGEN_UNI,?MARGEN_T' +
        'OTAL,?OBSERVACIONES,?VISTOBUENO1,?VISTOBUENO2,?VISTOBUENO3,?SITU' +
        'ACION,?MARGEN_UNI_CIEN,?SELECCIONADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD'
      'WHERE'
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIES=?SERIES AND'
      '((SITUACION=?SITUACION) OR (?SITUACION = -1))'
      'ORDER BY RIG_OF, SUBORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD'
      'SET'
      '  ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,FECHA_ORD=?FECHA_ORD '
      '  ,CLIENTE=?CLIENTE '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,ESCANDALLO=?ESCANDALLO '
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
      '  ,SELECCIONADA=?SELECCIONADA'
      'WHERE'
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      '')
    AfterDelete = Graba
    AfterOpen = QMProOrdAfterOpen
    AfterPost = Graba
    BeforeClose = QMProOrdBeforeClose
    OnCalcFields = QMProOrdCalcFields
    ClavesPrimarias.Strings = (
      'SUBORDEN '
      'RIG_OF '
      'SERIES '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
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
      DisplayLabel = 'Almac'#233'n Salida'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProOrdALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Almac'#233'n Lanz.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMProOrdALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almac'#233'n Entrada'
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
      Size = 15
    end
    object QMProOrdESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
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
    object QMProOrdCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Previsto'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QMProOrdCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Varios Previsto'
      FieldName = 'COSTE_VAR_PRE'
    end
    object QMProOrdCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Material Previsto'
      FieldName = 'COSTE_MAT_PRE'
    end
    object QMProOrdCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste MO Previsto'
      FieldName = 'COSTE_MO_PRE'
    end
    object QMProOrdCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste M'#225'q. Previsto'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QMProOrdCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Text. Previsto'
      FieldName = 'COSTE_TEX_PRE'
    end
    object QMProOrdCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Total Previsto'
      FieldName = 'COSTE_TOT_PRE'
    end
    object QMProOrdCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMProOrdCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Varios Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object QMProOrdCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Cotes Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object QMProOrdCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste MO Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object QMProOrdCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste M'#225'q. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QMProOrdCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Text. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object QMProOrdCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Total Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object QMProOrdCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Und.'
      FieldName = 'COSTE_UNITARIO'
    end
    object QMProOrdPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMProOrdHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object QMProOrdMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Und.'
      FieldName = 'MARGEN_UNI'
    end
    object QMProOrdMARGEN_TOTAL: TFloatField
      DisplayLabel = 'Margen Total'
      FieldName = 'MARGEN_TOTAL'
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
    object QMProOrdTituloCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'TituloCliente'
      Size = 60
      Calculated = True
    end
    object QMProOrdSitu: TStringField
      FieldKind = fkCalculated
      FieldName = 'Situ'
      Size = 30
      Calculated = True
    end
    object QMProOrdSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
      OnChange = QMProOrdSITUACIONChange
    end
    object QMProOrdTituloCompuesto: TStringField
      DisplayLabel = 'Titulo Compuesto'
      FieldKind = fkCalculated
      FieldName = 'TituloCompuesto'
      Size = 60
      Calculated = True
    end
    object QMProOrdSELECCIONADA: TIntegerField
      DisplayLabel = 'S/N'
      FieldName = 'SELECCIONADA'
    end
    object QMProOrdID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSQMProOrd: TDataSource
    DataSet = QMProOrd
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 256
    Top = 16
  end
  object QMProCierres: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CIERRES'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  SERIES=?old_SERIES AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CIERRES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG,RIG_OF,SUBORDEN,FECHA,UNDS' +
        ',NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIES,?RIG,?RIG_OF,?SUBORDEN,?FE' +
        'CHA,?UNDS,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CIERRES'
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_CIERRES'
      'Where empresa=?empresa and ejercicio=?Ejercicio and'
      'Canal=?Canal and Series=?Series and Rig_Of=?Rig_Of'
      'ORDER BY fecha, rig_of')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CIERRES'
      'SET'
      '  RIG_OF=?RIG_OF '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,FECHA=?FECHA '
      '  ,UNDS=?UNDS '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProOrd
    AfterDelete = Graba
    AfterPost = Graba
    BeforeInsert = QMProCierresBeforeInsert
    BeforePost = QMProCierresBeforePost
    OnNewRecord = QMProCierresNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'SERIES '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CIERRES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMProCierresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCierresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCierresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCierresSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProCierresRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMProCierresRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMProCierresSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMProCierresFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProCierresUNDS: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNDS'
    end
    object QMProCierresNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQMProCierres: TDataSource
    DataSet = QMProCierres
    Left = 136
    Top = 64
  end
  object QLanzarCerrar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure pro_lanzar_cerrar_ordenes')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 160
  end
  object QMNecesidades: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD'
      'WHERE'
      '  SUBORDEN=?old_SUBORDEN AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIES=?old_SERIES AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,ALMACEN_SAL,AL' +
        'MACEN_LAN,ALMACEN_ENT,FECHA_ORD,CLIENTE,COMPUESTO,ESCANDALLO,EST' +
        'ADO,PEDIDO,LINEA_PED,FECHA_PED,UNI_PEDID,UNI_MANUAL,UNI_TOTAL,PR' +
        'IORIDAD,MERMA,UNI_PRODUC,UNI_PENDIENTES,FECHA_ENTREGA,FECHA_INI,' +
        'FECHA_FIN,COSTE_FIJO_PRE,COSTE_VAR_PRE,COSTE_MAT_PRE,COSTE_MO_PR' +
        'E,COSTE_MAQ_PRE,COSTE_TEX_PRE,COSTE_TOT_PRE,COSTE_FIJO_REAL,COST' +
        'E_VAR_REAL,COSTE_MAT_REAL,COSTE_MO_REAL,COSTE_MAQ_REAL,COSTE_TEX' +
        '_REAL,COSTE_TOT_REAL,COSTE_UNITARIO,PRECIO_VENTA,HORAS_TOTALES,M' +
        'ARGEN_UNI,MARGEN_TOTAL,OBSERVACIONES,VISTOBUENO1,VISTOBUENO2,VIS' +
        'TOBUENO3,SITUACION,MARGEN_UNI_CIEN,SELECCIONADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?ALMACEN' +
        '_SAL,?ALMACEN_LAN,?ALMACEN_ENT,?FECHA_ORD,?CLIENTE,?COMPUESTO,?E' +
        'SCANDALLO,?ESTADO,?PEDIDO,?LINEA_PED,?FECHA_PED,?UNI_PEDID,?UNI_' +
        'MANUAL,?UNI_TOTAL,?PRIORIDAD,?MERMA,?UNI_PRODUC,?UNI_PENDIENTES,' +
        '?FECHA_ENTREGA,?FECHA_INI,?FECHA_FIN,?COSTE_FIJO_PRE,?COSTE_VAR_' +
        'PRE,?COSTE_MAT_PRE,?COSTE_MO_PRE,?COSTE_MAQ_PRE,?COSTE_TEX_PRE,?' +
        'COSTE_TOT_PRE,?COSTE_FIJO_REAL,?COSTE_VAR_REAL,?COSTE_MAT_REAL,?' +
        'COSTE_MO_REAL,?COSTE_MAQ_REAL,?COSTE_TEX_REAL,?COSTE_TOT_REAL,?C' +
        'OSTE_UNITARIO,?PRECIO_VENTA,?HORAS_TOTALES,?MARGEN_UNI,?MARGEN_T' +
        'OTAL,?OBSERVACIONES,?VISTOBUENO1,?VISTOBUENO2,?VISTOBUENO3,?SITU' +
        'ACION,?MARGEN_UNI_CIEN,?SELECCIONADA)')
    RefreshSQL.Strings = (
      'select articulo,stock,cantidad,sum(stock-cantidad) as total'
      'from tmp_comprobar_stocks'
      'group by articulo,stock,cantidad'
      'order by articulo')
    SelectSQL.Strings = (
      
        'select articulo,stock,sum(cantidad) as cantidad,sum(stock-cantid' +
        'ad) as total'
      'from tmp_comprobar_stocks'
      'group by articulo,stock'
      'order by articulo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      '')
    AfterDelete = Graba
    AfterPost = Graba
    OnCalcFields = QMProOrdCalcFields
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMNecesidadesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNecesidadesSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMNecesidadesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMNecesidadesTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object DSQMNecesidades: TDataSource
    DataSet = QMNecesidades
    Left = 136
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 256
    Top = 64
  end
end
