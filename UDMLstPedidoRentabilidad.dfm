object DMLstPedidoRentabilidad: TDMLstPedidoRentabilidad
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 383
  Top = 142
  Height = 577
  Width = 564
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 48
    Top = 8
  end
  object xClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select  titulo from ver_clientes_ef'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and cliente=?cliente')
    UniDirectional = False
    Left = 48
    Top = 56
    object xClienteDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select  titulo from ver_clientes_ef'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and cliente=?cliente')
    UniDirectional = False
    Left = 48
    Top = 104
    object xClienteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxClienteD: TDataSource
    DataSet = xClienteD
    Left = 176
    Top = 56
  end
  object DSxClienteH: TDataSource
    DataSet = xClienteH
    Left = 176
    Top = 104
  end
  object frPedidoRentabilidad: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Pedido Rentabilidad'
    RebuildPrinter = False
    OnGetValue = frPedidoRentabilidadGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 296
    Top = 8
    ReportForm = {19000000}
  end
  object QMCabPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      'WHERE ID_S>= ?ID_SD and ID_S<=?ID_SH and empresa=?empresa '
      
        'and ejercicio=?ejercicio and canal=?canal and (cliente>=?cliente' +
        'd and cliente<=?clienteh)'
      'order by rig')
    UniDirectional = False
    Left = 48
    Top = 152
  end
  object QMDetPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO'
      'WHERE ID_S = ?ID_S AND TIPO_LINEA<>'#39'PRM'#39
      'order by orden'
      ''
      ''
      '/*select * from ver_detalle_pedido ped'
      
        'left join pro_ord on (empresa=?empresa and ejercicio=?ejercicio ' +
        'and canal=?canal and serie=?serie'
      '                      and pedido=?rig and (linea_ped=?linea)'
      
        ' aixo o bucle i per cada linia mirar si hi ha ordre, com fa a z_' +
        'damerorden de dmlpedidos*/')
    UniDirectional = False
    DataSource = DSCabPedido
    AfterScroll = QMDetPedidoAfterScroll
    Left = 48
    Top = 200
  end
  object DSCabPedido: TDataSource
    DataSet = QMCabPedido
    Left = 176
    Top = 152
  end
  object DSDetPedido: TDataSource
    DataSet = QMDetPedido
    Left = 176
    Top = 200
  end
  object DSQMProOrd: TDataSource
    DataSet = QMProOrd
    Left = 176
    Top = 248
  end
  object QMProOrd: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_pro_ord'
      'where id_orden=?id_orden')
    UniDirectional = False
    AfterOpen = QMProOrdAfterOpen
    Left = 48
    Top = 248
  end
  object QDameID: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select id_s from ver_cabeceras_pedido'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'and serie=?serie and tipo='#39'PEC'#39' and rig=?rig')
    Transaction = TLocal
    AutoTrans = True
    Left = 432
    Top = 8
  end
  object Z_xBuscaOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_orden from pro_ord'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and '
      
        'series=?serie and pedido=?rig and (linea_ped=?linea or linea_ped' +
        '=0)')
    UniDirectional = False
    DataSource = DSDetPedido
    Left = 432
    Top = 56
  end
  object frDBPedidoCab: TfrDBDataSet
    DataSource = DSCabPedido
    Left = 296
    Top = 152
  end
  object frDBPedidoDet: TfrDBDataSet
    DataSource = DSDetPedido
    Left = 296
    Top = 200
  end
  object frDBProOrd: TfrDBDataSet
    DataSource = DSQMProOrd
    Left = 296
    Top = 248
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
      '   MINI_NOTA,LINEA_TAREA)'
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
      '  ?MINI_NOTA,?LINEA_TAREA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_MAT'
      'WHERE'
      '  LINEA_MAT=?LINEA_MAT AND '
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_MAT'
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Series=?Series and'
      '             Rig_Of=?Rig_Of)'
      'order by orden, linea_mat'
      ''
      '/* and'
      '             SubOrden=?SubOrden and'
      '             Linea_Fase=?Linea_Fase*/')
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
      '  ,NOTAS_MAT=?NOTAS_MAT'
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
      'WHERE'
      '  LINEA_MAT=?LINEA_MAT AND '
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProOrdFases
    ClavesPrimarias.Strings = (
      'LINEA_MAT '
      'SUBORDEN '
      'RIG_OF '
      'SERIES '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT'
    BloqOpt = True
    UpdateTransaction = TLocal
    Left = 48
    Top = 344
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
      'SELECT'
      '  *'
      'FROM PRO_ORD_MAT_COMPRA'
      'WHERE'
      '  LINEA_COMPRA=?LINEA_COMPRA AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_MAT_COMPRA'
      
        'where id_orden=?id_orden /*and linea_fase=?linea_fase and linea_' +
        'compra_dest=0*/'
      'order by linea_compra')
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
    DataSource = DSQMProOrdFases
    ClavesPrimarias.Strings = (
      'LINEA_COMPRA '
      'LINEA_FASE '
      'RIG_OF '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_MAT_COMPRA'
    BloqOpt = True
    UpdateTransaction = TLocal
    Left = 48
    Top = 392
  end
  object DSQMProOrdMat: TDataSource
    DataSet = QMProOrdMat
    Left = 176
    Top = 344
  end
  object DSQMProOrdMatCompra: TDataSource
    DataSet = QMProOrdMatCompra
    Left = 176
    Top = 392
  end
  object DSQMProOrdTarea: TDataSource
    DataSet = QMProOrdTarea
    Left = 176
    Top = 440
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
        'IEMPO,TIEMPO_UTIL,UDS_FABRICADAS,OPERACIONES_NUM,OPERACIONES_TIE' +
        'MPO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?SUBORDEN,?LINEA_FA' +
        'SE,?LINEA_TAREA,?TAREA,?ORDEN,?TIPOTAREA,?COMENTARIO,?RECURSO,?C' +
        'ANTIDAD,?ARTICULO,?PRE_COS_UNI_PRE,?TOTAL_VAR_PRE,?PRECIO_FIJO_P' +
        'RE,?TOTAL_PRE,?PRE_COS_UNI_REAL,?TOTAL_VAR_REAL,?PRECIO_FIJO_REA' +
        'L,?TOTAL_REAL,?ESTADO,?ENTRADA ,?FECHA_FIN_TAREA,?ID_UTILLAJE,?D' +
        'ESC_UTILLAJE,?CANTIDAD_UTIL,?TIEMPO,?TIEMPO_UTIL,?UDS_FABRICADAS' +
        ',?OPERACIONES_NUM,?OPERACIONES_TIEMPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_TAREA'
      'WHERE'
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT TAR.*, MARCA.IMPUTACION, IMP.DESCRIPCION AS DESCRIPCION_I' +
        'MP, MARCA_CAB.FECHA AS FECHA_MARCAJE, OPE.EMPLEADO,'
      '       OPE.TITULO'
      'FROM PRO_ORD_TAREA TAR'
      
        'LEFT JOIN PRO_ORD_DET_MARCA MARCA ON (TAR.IDENTIFICADOR = MARCA.' +
        'IDTAREA)'
      
        'LEFT JOIN OPE_SYS_IMPUTACION IMP ON (MARCA.IMPUTACION = IMP.IMPU' +
        'TACION)'
      
        'LEFT JOIN PRO_ORD_CAB_MARCA MARCA_CAB ON (MARCA_CAB.EMPRESA = MA' +
        'RCA.EMPRESA AND MARCA_CAB.EJERCICIO = MARCA.EJERCICIO AND MARCA_' +
        'CAB.CANAL = MARCA.CANAL AND MARCA_CAB.SERIE = MARCA.SERIE AND MA' +
        'RCA_CAB.TIPO = MARCA.TIPO AND MARCA_CAB.RIG = MARCA.RIG)'
      
        'LEFT JOIN VER_EMPLEADOS_EF OPE ON (OPE.EMPRESA = MARCA.EMPRESA ' +
        'AND OPE.EMPLEADO = MARCA_CAB.OPERARIO)'
      'WHERE'
      'TAR.EMPRESA = :EMPRESA AND'
      'TAR.EJERCICIO = :EJERCICIO AND'
      'TAR.CANAL = :CANAL AND'
      'TAR.SERIE = :SERIES AND'
      'TAR.RIG_OF = :RIG_OF'
      'ORDER BY TAR.ORDEN, TAR.LINEA_TAREA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA'
      'SET'
      '  TAREA=?TAREA '
      '  ,ORDEN=?ORDEN '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,RECURSO=?RECURSO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,ARTICULO=?ARTICULO '
      '  ,PRE_COS_UNI_PRE=?PRE_COS_UNI_PRE '
      '  ,TOTAL_VAR_PRE=?TOTAL_VAR_PRE '
      '  ,PRECIO_FIJO_PRE=?PRECIO_FIJO_PRE '
      '  ,TOTAL_PRE=?TOTAL_PRE '
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL '
      '  ,TOTAL_VAR_REAL=?TOTAL_VAR_REAL '
      '  ,PRECIO_FIJO_REAL=?PRECIO_FIJO_REAL '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,ESTADO=?ESTADO '
      '  ,ENTRADA=?ENTRADA'
      '  ,FECHA_FIN_TAREA=?FECHA_FIN_TAREA'
      '  ,ID_UTILLAJE=?ID_UTILLAJE'
      '  ,DESC_UTILLAJE=?DESC_UTILLAJE'
      '  ,CANTIDAD_UTIL=?CANTIDAD_UTIL'
      '  ,TIEMPO=?TIEMPO'
      '  ,TIEMPO_UTIL=?TIEMPO_UTIL'
      '  ,UDS_FABRICADAS=?UDS_FABRICADAS'
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM'
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO'
      'WHERE'
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProOrd
    ClavesPrimarias.Strings = (
      'LINEA_TAREA '
      'LINEA_FASE '
      'SUBORDEN '
      'RIG_OF '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA'
    BloqOpt = True
    UpdateTransaction = TLocal
    Left = 48
    Top = 440
  end
  object QMProOrdFases: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_FASES'
      'WHERE'
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  SUBORDEN=?old_SUBORDEN AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIES=?old_SERIES AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_FASES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIES,RIG_OF,SUBORDEN,LINEA_FASE,FAS' +
        'E,ORDEN,TIPOFASE,NOTAS,DIBUJO,ESTADO,VALORCALIDAD,ENTRADA,FECHA_' +
        'FIN_FASE,ID_IMAGEN)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIES,?RIG_OF,?SUBORDEN,?LINEA_F' +
        'ASE,?FASE,?ORDEN,?TIPOFASE,?NOTAS,?DIBUJO,?ESTADO,?VALORCALIDAD,' +
        '?ENTRADA,?FECHA_FIN_FASE,?ID_IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_FASES'
      'WHERE'
      '  LINEA_FASE=?LINEA_FASE AND '
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_FASES'
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Series=?Series and'
      '             Rig_Of=?Rig_Of and'
      '             SubOrden=?SubOrden)'
      'order by orden, linea_fase')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_FASES'
      'SET'
      '  FASE=?FASE '
      '  ,ORDEN=?ORDEN '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,NOTAS=?NOTAS '
      '  ,DIBUJO=?DIBUJO '
      '  ,ESTADO=?ESTADO '
      '  ,VALORCALIDAD=?VALORCALIDAD '
      '  ,ENTRADA=?ENTRADA'
      ' ,FECHA_FIN_FASE=?FECHA_FIN_FASE'
      ' ,ID_IMAGEN=?ID_IMAGEN'
      'WHERE'
      '  LINEA_FASE=?LINEA_FASE AND '
      '  SUBORDEN=?SUBORDEN AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIES=?SERIES AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProOrd
    AfterOpen = QMProOrdFasesAfterOpen
    ClavesPrimarias.Strings = (
      'LINEA_FASE '
      'SUBORDEN '
      'RIG_OF '
      'SERIES '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_FASES'
    BloqOpt = True
    UpdateTransaction = TLocal
    Left = 48
    Top = 296
  end
  object DSQMProOrdFases: TDataSource
    DataSet = QMProOrdFases
    Left = 176
    Top = 296
  end
  object frDBFases: TfrDBDataSet
    DataSource = DSQMProOrdFases
    Left = 296
    Top = 296
  end
  object frDBMaterial: TfrDBDataSet
    DataSource = DSQMProOrdMat
    Left = 296
    Top = 344
  end
  object frDBCompra: TfrDBDataSet
    DataSource = DSQMProOrdMatCompra
    Left = 296
    Top = 392
  end
  object frDBTarea: TfrDBDataSet
    DataSource = DSQMProOrdTarea
    Left = 296
    Top = 440
  end
  object QueryTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 432
    Top = 104
  end
end
