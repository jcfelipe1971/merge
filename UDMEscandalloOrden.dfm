object DMEscandalloOrden: TDMEscandalloOrden
  OldCreateOrder = False
  OnCreate = DMEscandalloOrdenCreate
  Left = 464
  Top = 333
  Height = 317
  Width = 429
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 360
    Top = 8
  end
  object QMEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_ESC_ORDEN'
      'WHERE'
      '  ORDEN=?old_ORDEN AND '
      '  SERIE=?old_SERIE AND'
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_ESC_ORDEN'
      
        '  (EMPRESA,ARTICULO,NUMERO,UNIDADES,FECHA_DESDE,FECHA_HASTA,ACTI' +
        'VO,ORDEN,EJERCICIO,CANAL,COSTE,SERIE)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?NUMERO,?UNIDADES,?FECHA_DESDE,?FECHA_HAST' +
        'A,?ACTIVO,?ORDEN,?EJERCICIO,?CANAL,?COSTE,?SERIE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_ORDEN'
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  SERIE=?SERIE AND'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_ESC_ORDEN'
      'WHERE'
      'EMPRESA =?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE = ?SERIE AND'
      'ORDEN=?ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_ORDEN'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,NUMERO=?NUMERO '
      '  ,UNIDADES=?UNIDADES '
      '  ,FECHA_DESDE=?FECHA_DESDE '
      '  ,FECHA_HASTA=?FECHA_HASTA '
      '  ,ACTIVO=?ACTIVO '
      '  ,COSTE=?COSTE'
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  SERIE =?SERIE AND'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMEscandalloAfterOpen
    AfterPost = QMEscandalloAfterPost
    ClavesPrimarias.Strings = (
      'ORDEN '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_ESC_ORDEN'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEscandalloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEscandalloORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMEscandalloARTICULOChange
      Size = 15
    end
    object QMEscandalloNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEscandalloUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMEscandalloFECHA_DESDE: TDateTimeField
      DisplayLabel = 'Fecha Desde'
      FieldName = 'FECHA_DESDE'
    end
    object QMEscandalloFECHA_HASTA: TDateTimeField
      DisplayLabel = 'Fecha Hasta'
      FieldName = 'FECHA_HASTA'
    end
    object QMEscandalloACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEscandalloCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMEscandalloSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object DSQMEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 144
    Top = 8
  end
  object DSQMEscandalloDet: TDataSource
    DataSet = QMEscandalloDet
    Left = 144
    Top = 56
  end
  object QMEscandalloDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_ESCAND_ORDEN_KRI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE =?old_SERIE AND'
      '  ORDEN=?old_ORDEN AND '
      '  DETALLE=?old_DETALLE  AND'
      '  LINEA=?old_LINEA')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_ESCAND_ORDEN_KRI'
      
        '  (ARTICULO,NUMERO,DETALLE,CANTIDAD,TITULO,FAMILIA,P_COSTE,EMPRE' +
        'SA,EJERCICIO,CANAL,ORDEN,COSTE,CANTFIN,SERIE,LINEA,CANTIDAD_INIC' +
        'IAL,COSTE_INICIAL,'
      'LINEAL_PORCENTUAL)'
      'VALUES'
      
        '  (?ARTICULO,?NUMERO,?DETALLE,?CANTIDAD,?TITULO,?FAMILIA,?P_COST' +
        'E,?EMPRESA,?EJERCICIO,?CANAL,?ORDEN,?COSTE,?CANTFIN,?SERIE,0,?CA' +
        'NTIDAD_INICIAL,?COSTE_INICIAL,'
      '?LINEAL_PORCENTUAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_ESCAND_ORDEN_KRI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND'
      '  ORDEN=?ORDEN AND '
      '  LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_ESCAND_ORDEN_KRI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'ORDEN = :ORDEN'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_ESCAND_ORDEN_KRI'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,NUMERO=?NUMERO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,TITULO=?TITULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,P_COSTE=?P_COSTE'
      '  ,COSTE=?COSTE '
      ' ,CANTFIN=?CANTFIN'
      ' ,DETALLE=?DETALLE'
      '  ,CANTIDAD_INICIAL=?CANTIDAD_INICIAL'
      '  ,COSTE_INICIAL=?COSTE_INICIAL'
      '  ,LINEAL_PORCENTUAL=?LINEAL_PORCENTUAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND'
      '  ORDEN=?ORDEN AND '
      '  LINEA=?LINEA')
    DataSource = DSQMEscandallo
    BeforePost = QMEscandalloDetBeforePost
    OnNewRecord = QMEscandalloDetNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'ORDEN '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_ESCAND_ORDEN_KRI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMEscandalloDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEscandalloDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEscandalloDetORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMEscandalloDetARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMEscandalloDetNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEscandalloDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      OnChange = QMEscandalloDetDETALLEChange
      Size = 15
    end
    object QMEscandalloDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMEscandalloDetTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMEscandalloDetP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMEscandalloDetCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMEscandalloDetCANTFIN: TFloatField
      DisplayLabel = 'Cant. Fin'
      FieldName = 'CANTFIN'
    end
    object QMEscandalloDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMEscandalloDetFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEscandalloDetSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMEscandalloDetCANTIDAD_INICIAL: TFloatField
      DisplayLabel = 'Cant. Inicial'
      FieldName = 'CANTIDAD_INICIAL'
    end
    object QMEscandalloDetCOSTE_INICIAL: TFloatField
      DisplayLabel = 'Coste Inicial'
      FieldName = 'COSTE_INICIAL'
    end
    object QMEscandalloDetLINEAL_PORCENTUAL: TIntegerField
      DisplayLabel = 'Porcentual'
      FieldName = 'LINEAL_PORCENTUAL'
    end
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO '
      ' FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMEscandallo
    Left = 40
    Top = 104
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 144
    Top = 104
  end
  object QMLotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_ESC_ORDEN_D_LOTES'
      'WHERE'
      '  LOTE=?old_LOTE AND '
      '  LINEA=?old_LINEA AND '
      '  DETALLE=?old_DETALLE AND '
      '  ORDEN=?old_ORDEN AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_ESC_ORDEN_D_LOTES'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,ORDEN,SERIE,ARTICULO,NUMERO,DETALLE' +
        ',LINEA,LOTE,N_SERIE,'#13#10'CLASIFICACION,F_FABRICACION,F_ENVASADO,F_C' +
        'ADUCIDAD,CANTIDAD,ALMACEN,ID_A,PROVEEDOR,ID_LOTE,POR_CANTIDAD,'#13#10 +
        'PRIORIDAD)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?ORDEN,?SERIE,?ARTICULO,?NUMERO,' +
        '?DETALLE,?LINEA,?LOTE,?N_SERIE,'#13#10'?CLASIFICACION,?F_FABRICACION,?' +
        'F_ENVASADO,?F_CADUCIDAD,?CANTIDAD,?ALMACEN,?ID_A,?PROVEEDOR,?ID_' +
        'LOTE,?POR_CANTIDAD,'#13#10'?PRIORIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_ORDEN_D_LOTES'
      'WHERE'
      '  LOTE=?LOTE AND '
      '  LINEA=?LINEA AND '
      '  DETALLE=?DETALLE AND '
      '  ORDEN=?ORDEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_ESC_ORDEN_D_LOTES'
      'WHERE '
      'EMPRESA =?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'SERIE = ?SERIE AND'
      'ORDEN=?ORDEN AND '
      'DETALLE=?DETALLE AND'
      'LINEA=?LINEA'
      'ORDER BY PRIORIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_ORDEN_D_LOTES'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,NUMERO=?NUMERO '
      '  ,N_SERIE=?N_SERIE '
      '  ,CLASIFICACION=?CLASIFICACION '
      '  ,F_FABRICACION=?F_FABRICACION '
      '  ,F_ENVASADO=?F_ENVASADO '
      '  ,F_CADUCIDAD=?F_CADUCIDAD '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,ALMACEN=?ALMACEN '
      '  ,ID_A=?ID_A '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,ID_LOTE=?ID_LOTE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  ORDEN=?ORDEN AND '
      '  DETALLE=?DETALLE AND '
      '  LINEA=?LINEA AND '
      '  ALMACEN=?ALMACEN AND '
      '  LOTE=?LOTE ')
    DataSource = DSQMEscandalloDet
    AfterDelete = QMLotesAfterDelete
    AfterPost = QMLotesAfterPost
    OnNewRecord = QMLotesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'ORDEN'
      'DETALLE'
      'LINEA'
      'ALMACEN'
      'LOTE'
      'N_SERIE'
      'PROVEEDOR')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_ESC_ORDEN_D_LOTES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMLotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLotesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLotesORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMLotesARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLotesNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMLotesDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QMLotesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnChange = QMLotesLOTEChange
    end
    object QMLotesN_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMLotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMLotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabric.'
      FieldName = 'F_FABRICACION'
    end
    object QMLotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMLotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMLotesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLotesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLotesID_A: TIntegerField
      DisplayLabel = 'ID A'
      FieldName = 'ID_A'
    end
    object QMLotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMLotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMLotesPOR_CANTIDAD: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'POR_CANTIDAD'
    end
    object QMLotesPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
  end
  object DSQMLotes: TDataSource
    DataSet = QMLotes
    Left = 144
    Top = 152
  end
  object xOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ALMACEN'
      ' FROM ART_ORDENES_PRODUCCION'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND NORDEN=?ORDEN')
    UniDirectional = False
    DataSource = DSQMEscandallo
    Left = 256
    Top = 8
    object xOrdenALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
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
    Left = 360
    Top = 56
  end
end
