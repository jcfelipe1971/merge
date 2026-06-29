object DMPropPedidos: TDMPropPedidos
  OldCreateOrder = False
  OnCreate = DMPropPedidosCreate
  OnDestroy = DataModuleDestroy
  Left = 602
  Top = 282
  Height = 203
  Width = 301
  object QMPedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_PEDIDOS'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  MODO=?old_MODO ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_PEDIDOS'
      
        '  (EXISTENCIAS,MINIMO,MAXIMO,P_MINIMO,P_OPTIMO,PEDIR,PEDIDOS_D_C' +
        'LI,PEDIDOS_A_PRO,INCR_PEDIDO,COBERTURA,ROTURA,STOCK_VIRTUAL,EN_P' +
        'RODUCCION,UNIDADES_COBERTURA,COBERTURA_ROTURA,FECHA_COMPARACION_' +
        'DESDE,FECHA_COMPARACION_HASTA,VENTAS_PERIODO_ANTERIOR,ENTRADA,PR' +
        'OVEEDOR,Z_PRO_ID_ORDEN_MAT,ID_A,MODO,EMPRESA,EJERCICIO,CANAL,ART' +
        'ICULO_TITULO,NOMBRE_R_SOCIAL,MARCADO,Z_PRO_COMPRA,DIAS_ENTREGA,R' +
        'ECALCULAR,ALMACEN,ARTICULO,TIPO_ARTICULO)'
      'VALUES'
      
        '  (?EXISTENCIAS,?MINIMO,?MAXIMO,?P_MINIMO,?P_OPTIMO,?PEDIR,?PEDI' +
        'DOS_D_CLI,?PEDIDOS_A_PRO,?INCR_PEDIDO,?COBERTURA,?ROTURA,?STOCK_' +
        'VIRTUAL,?EN_PRODUCCION,?UNIDADES_COBERTURA,?COBERTURA_ROTURA,?FE' +
        'CHA_COMPARACION_DESDE,?FECHA_COMPARACION_HASTA,?VENTAS_PERIODO_A' +
        'NTERIOR,?ENTRADA,?PROVEEDOR,?Z_PRO_ID_ORDEN_MAT,?ID_A,?MODO,?EMP' +
        'RESA,?EJERCICIO,?CANAL,?ARTICULO_TITULO,?NOMBRE_R_SOCIAL,?MARCAD' +
        'O,?Z_PRO_COMPRA,?DIAS_ENTREGA,?RECALCULAR,?ALMACEN,?ARTICULO,?TI' +
        'PO_ARTICULO)')
    RefreshSQL.Strings = (
      
        'SELECT T.*, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.' +
        'ALFA_6, A.ALFA_7, A.ALFA_8, AM.REF_PROVEEDOR'
      'FROM TMP_PEDIDOS T'
      'JOIN ART_ARTICULOS A ON T.ID_A = A.ID_A'
      
        'JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON A.ID_A_M_C_T = AMCT.ID_A_M' +
        '_C_T'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C'
      'JOIN ART_ARTICULOS_MODELOS AM ON AMC.ID_A_M = AM.ID_A_M'
      'WHERE'
      'T.ARTICULO=?ARTICULO AND '
      'T.ALMACEN=?ALMACEN AND '
      'T.CANAL=?CANAL AND '
      'T.EMPRESA=?EMPRESA AND '
      'T.MODO=?MODO ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT T.*, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.' +
        'ALFA_6, A.ALFA_7, A.ALFA_8, AM.REF_PROVEEDOR'
      'FROM TMP_PEDIDOS T'
      'JOIN ART_ARTICULOS A ON T.ID_A = A.ID_A'
      
        'JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON A.ID_A_M_C_T = AMCT.ID_A_M' +
        '_C_T'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C'
      'JOIN ART_ARTICULOS_MODELOS AM ON AMC.ID_A_M = AM.ID_A_M'
      'WHERE'
      'T.MODO = :MODO AND'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_PEDIDOS'
      'SET'
      '  EXISTENCIAS=?EXISTENCIAS '
      '  ,MINIMO=?MINIMO '
      '  ,MAXIMO=?MAXIMO '
      '  ,P_MINIMO=?P_MINIMO '
      '  ,P_OPTIMO=?P_OPTIMO '
      '  ,PEDIR=?PEDIR '
      '  ,PEDIDOS_D_CLI=?PEDIDOS_D_CLI '
      '  ,PEDIDOS_A_PRO=?PEDIDOS_A_PRO '
      '  ,INCR_PEDIDO=?INCR_PEDIDO '
      '  ,COBERTURA=?COBERTURA '
      '  ,ROTURA=?ROTURA '
      '  ,STOCK_VIRTUAL=?STOCK_VIRTUAL '
      '  ,EN_PRODUCCION=?EN_PRODUCCION '
      '  ,UNIDADES_COBERTURA=?UNIDADES_COBERTURA '
      '  ,COBERTURA_ROTURA=?COBERTURA_ROTURA '
      '  ,FECHA_COMPARACION_DESDE=?FECHA_COMPARACION_DESDE '
      '  ,FECHA_COMPARACION_HASTA=?FECHA_COMPARACION_HASTA '
      '  ,VENTAS_PERIODO_ANTERIOR=?VENTAS_PERIODO_ANTERIOR '
      '  ,ENTRADA=?ENTRADA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,Z_PRO_ID_ORDEN_MAT=?Z_PRO_ID_ORDEN_MAT '
      '  ,ID_A=?ID_A '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,ARTICULO_TITULO=?ARTICULO_TITULO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,MARCADO=?MARCADO '
      '  ,Z_PRO_COMPRA=?Z_PRO_COMPRA '
      '  ,DIAS_ENTREGA=?DIAS_ENTREGA '
      '  ,RECALCULAR=?RECALCULAR '
      '  ,TIPO_ARTICULO=?TIPO_ARTICULO '
      '  ,NOTA_DETALLE_PEDIDO=?NOTA_DETALLE_PEDIDO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA AND '
      '  MODO=?MODO ')
    AfterClose = QMPedidosAfterClose
    AfterOpen = QMPedidosAfterOpen
    AfterPost = QMPedidosAfterPost
    OnCalcFields = QMPedidosCalcFields
    OnNewRecord = QMPedidosNewRecord
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'ALMACEN '
      'CANAL '
      'EMPRESA '
      'MODO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PEDIDOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMPedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object QMPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
      ReadOnly = True
    end
    object QMPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      ReadOnly = True
    end
    object QMPedidosALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      ReadOnly = True
      Size = 3
    end
    object QMPedidosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object QMPedidosARTICULO_TITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'ARTICULO_TITULO'
      ReadOnly = True
      Size = 256
    end
    object QMPedidosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
      ReadOnly = True
    end
    object QMPedidosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMPedidosPROVEEDORChange
    end
    object QMPedidosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Prov.'
      FieldName = 'NOMBRE_R_SOCIAL'
      ReadOnly = True
      Size = 60
    end
    object QMPedidosEXISTENCIAS: TFloatField
      DisplayLabel = 'Stock'
      DisplayWidth = 15
      FieldName = 'EXISTENCIAS'
      ReadOnly = True
    end
    object QMPedidosMINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      DisplayWidth = 15
      FieldName = 'MINIMO'
      ReadOnly = True
    end
    object QMPedidosMAXIMO: TFloatField
      DisplayLabel = 'Stock M'#225'x.'
      DisplayWidth = 15
      FieldName = 'MAXIMO'
      ReadOnly = True
    end
    object QMPedidosP_MINIMO: TFloatField
      DisplayLabel = 'Ped. M'#237'nimo'
      DisplayWidth = 15
      FieldName = 'P_MINIMO'
      ReadOnly = True
    end
    object QMPedidosP_OPTIMO: TFloatField
      DisplayLabel = 'Ped. '#211'ptimo'
      FieldName = 'P_OPTIMO'
      ReadOnly = True
    end
    object QMPedidosPEDIR: TFloatField
      DisplayLabel = 'Uds. a Pedir'
      FieldName = 'PEDIR'
      OnChange = QMPedidosPEDIRChange
    end
    object QMPedidosMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = QMPedidosMARCADOChange
    end
    object QMPedidosZ_PRO_COMPRA: TIntegerField
      DisplayLabel = 'Pro. Compra'
      FieldName = 'Z_PRO_COMPRA'
    end
    object QMPedidosZ_PRO_ID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'Id Ord. Mat.'
      FieldName = 'Z_PRO_ID_ORDEN_MAT'
    end
    object QMPedidosPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object QMPedidosPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object QMPedidosINCR_PEDIDO: TFloatField
      DisplayLabel = 'Incr. Pedido'
      FieldName = 'INCR_PEDIDO'
    end
    object QMPedidosDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Ent.'
      FieldName = 'DIAS_ENTREGA'
    end
    object QMPedidosID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object QMPedidosTIPO_ARTICULO: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO'
      Size = 3
    end
    object QMPedidosFECHA_COMPARACION_DESDE: TDateTimeField
      DisplayLabel = 'Fecha Compar. Desde'
      FieldName = 'FECHA_COMPARACION_DESDE'
    end
    object QMPedidosFECHA_COMPARACION_HASTA: TDateTimeField
      DisplayLabel = 'Fecha Compar. Hasta'
      FieldName = 'FECHA_COMPARACION_HASTA'
    end
    object QMPedidosVENTAS_PERIODO_ANTERIOR: TFloatField
      DisplayLabel = 'Prom. Ventas Ejer. Ant.'
      FieldName = 'VENTAS_PERIODO_ANTERIOR'
    end
    object QMPedidosMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMPedidosRECALCULAR: TIntegerField
      DisplayLabel = 'Recalcular'
      FieldName = 'RECALCULAR'
    end
    object QMPedidosSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock Virtual'
      FieldName = 'STOCK_VIRTUAL'
    end
    object QMPedidosEN_PRODUCCION: TFloatField
      DisplayLabel = 'En Produccion'
      FieldName = 'EN_PRODUCCION'
    end
    object QMPedidosCOBERTURA: TFloatField
      DisplayLabel = 'Cobertura'
      FieldName = 'COBERTURA'
    end
    object QMPedidosROTURA: TFloatField
      DisplayLabel = 'Rotura'
      FieldName = 'ROTURA'
    end
    object QMPedidosUNIDADES_COBERTURA: TFloatField
      DisplayLabel = 'Uds. Cobertura'
      FieldName = 'UNIDADES_COBERTURA'
    end
    object QMPedidosCOBERTURA_ROTURA: TFloatField
      DisplayLabel = 'Cobertura de Rotura'
      FieldName = 'COBERTURA_ROTURA'
    end
    object QMPedidosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMPedidosTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMPedidosALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMPedidosALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMPedidosALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMPedidosALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMPedidosALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMPedidosALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMPedidosALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMPedidosALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMPedidosSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMPedidosNOTA_DETALLE_PEDIDO: TMemoField
      DisplayLabel = 'Nota Detalle Pedido'
      FieldName = 'NOTA_DETALLE_PEDIDO'
      BlobType = ftMemo
      Size = 8
    end
    object QMPedidosREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Modelo TyC'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QMPedidosUNIDADES_PEDIDO: TFloatField
      DisplayLabel = 'Uds. Pedido'
      FieldName = 'UNIDADES_PEDIDO'
    end
    object QMPedidosUNIDADES_PRODUCCION: TFloatField
      DisplayLabel = 'Uds. Producci'#243'n'
      FieldName = 'UNIDADES_PRODUCCION'
    end
    object QMPedidosFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'F. Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMPedidosP_COSTE_ULT: TFloatField
      DisplayLabel = 'P. Coste Ult.'
      FieldName = 'P_COSTE_ULT'
    end
    object QMPedidosCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
    Top = 16
  end
  object DSQMPedidos: TDataSource
    DataSet = QMPedidos
    Left = 136
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 224
    Top = 64
  end
  object xPedidosOrigen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.RIG, D.LINEA,' +
        ' D.UNIDADES,'
      
        '  P.U_PENDIENTES, P.FECHA_ENTREGA_PREV, C.ID_S, C.CLIENTE, T.NOM' +
        'BRE_R_SOCIAL,'
      '  C.AGENTE, TA.NOMBRE_R_SOCIAL AS NOMBRE_AGENTE'
      'FROM TMP_PEDIDOS_ORIGEN O'
      'JOIN GES_DETALLES_S D ON O.ID_DETALLES_S = D.ID_DETALLES_S'
      'JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S'
      'JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      
        'JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'JOIN EMP_AGENTES AG ON C.EMPRESA = AG.EMPRESA AND C.AGENTE = AG.' +
        'AGENTE'
      'JOIN SYS_TERCEROS TA ON AG.TERCERO = TA.TERCERO'
      'WHERE'
      '  O.ID_DETALLES_S=?ID_DETALLES_S AND '
      '  O.ARTICULO=?ARTICULO AND '
      '  O.ALMACEN=?ALMACEN AND '
      '  O.CANAL=?CANAL AND '
      '  O.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.RIG, D.LINEA,' +
        ' D.UNIDADES,'
      
        '  P.U_PENDIENTES, P.FECHA_ENTREGA_PREV, C.ID_S, C.CLIENTE, T.NOM' +
        'BRE_R_SOCIAL,'
      '  C.AGENTE, TA.NOMBRE_R_SOCIAL AS NOMBRE_AGENTE, D.MANIPULACION'
      'FROM TMP_PEDIDOS_ORIGEN O'
      'JOIN GES_DETALLES_S D ON O.ID_DETALLES_S = D.ID_DETALLES_S'
      'JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S'
      'JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      
        'JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'JOIN EMP_AGENTES AG ON C.EMPRESA = AG.EMPRESA AND C.AGENTE = AG.' +
        'AGENTE'
      'JOIN SYS_TERCEROS TA ON AG.TERCERO = TA.TERCERO'
      'WHERE'
      'O.ARTICULO = :ARTICULO AND'
      'O.ALMACEN = :ALMACEN AND'
      'O.CANAL = :CANAL AND'
      'O.EMPRESA = :EMPRESA'
      'ORDER BY O.ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMPedidos
    OnNewRecord = QMPedidosNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S '
      'ARTICULO '
      'ALMACEN '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PEDIDOS_ORIGEN'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object xPedidosOrigenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidosOrigenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidosOrigenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidosOrigenSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidosOrigenRIG: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'RIG'
    end
    object xPedidosOrigenLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xPedidosOrigenUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xPedidosOrigenU_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pendientes'
      FieldName = 'U_PENDIENTES'
    end
    object xPedidosOrigenFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xPedidosOrigenID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xPedidosOrigenCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xPedidosOrigenNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xPedidosOrigenAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xPedidosOrigenNOMBRE_AGENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo agente'
      FieldName = 'NOMBRE_AGENTE'
      Size = 60
    end
    object xPedidosOrigenMANIPULACION: TIntegerField
      DisplayLabel = 'Man.'
      FieldName = 'MANIPULACION'
    end
  end
  object DSxMPedidosOrigen: TDataSource
    DataSet = xPedidosOrigen
    Left = 136
    Top = 64
  end
  object DSQMPedidosTotales: TDataSource
    DataSet = QMPedidosTotales
    Left = 136
    Top = 112
  end
  object QMPedidosTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT SUM(PEDIR) UNIDADES_PEDIDAS FROM TMP_PEDIDOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ALMACEN=?ALMACEN AND'
      'MODO = ?MODO AND'
      'MARCADO = 1')
    UniDirectional = False
    Left = 40
    Top = 112
    object QMPedidosTotalesUNIDADES_PEDIDAS: TFloatField
      DisplayLabel = 'Uds. Pedidas'
      FieldName = 'UNIDADES_PEDIDAS'
    end
  end
end
