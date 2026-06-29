object DMServirPedidosVenta: TDMServirPedidosVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 360
  Top = 112
  Height = 255
  Width = 455
  object QMPedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      
        'SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA, P.FECHA_ENTREGA_PREV, C.ESTADO,'
      
        '       C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, P.CANAL' +
        '_DST_PEC, P.SERIE_DST_PEC, P.TIPO_DST_PEC,'
      
        '       P.ENTRADA_AGRUPACION, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, P' +
        '.LISTO_PARA_PREPARAR, C.SU_REFERENCIA,'
      '       TRIM(TC.NOMBRE || '#39' '#39' || TC.APELLIDOS) NOM_CONTACTO,'
      '       --'
      
        '       CAST(SUBSTRING((SELECT LIST(D_EJERCICIO || '#39' '#39' || D_SERIE' +
        ' || '#39'/'#39' || D_RIG, '#39', '#39')'
      '                       FROM GES_CABECERAS_RELACIONES'
      '                       WHERE'
      '                       O_ID_S = C.ID_S AND'
      
        '                       O_TIPO = C.TIPO) FROM 1 FOR 60) AS VARCHA' +
        'R(60)) DOCUMENTO_DESTINO,'
      '       (SELECT FIRST 1 ID_S'
      '        FROM GES_CABECERAS_RELACIONES'
      '        WHERE'
      '        O_ID_S = C.ID_S AND'
      '        O_TIPO = C.TIPO'
      '        ORDER BY ID_S) ID_S_DESTINO,'
      '       --'
      '       (SELECT SUM(D.UNIDADES * A.PESO)'
      '        FROM GES_DETALLES_S D'
      '        JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      '        WHERE'
      '        D.ID_S = C.ID_S) PESO_TOTAL,'
      '       --'
      
        '       R.RUTA, R.RUTA_ORDEN, C.LIQUIDO, COALESCE(PSO.TOTAL_PAID,' +
        ' C.LIQUIDO, 0) TOTAL_PRESTASHOP, C.TRANSPORTISTA,'
      '       TA.NOMBRE_R_SOCIAL TITULO_TRANSPORTISTA'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = C' +
        'C.CLIENTE'
      'JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO'
      
        'JOIN EMP_ACREEDORES A ON C.EMPRESA = A.EMPRESA AND C.TRANSPORTIS' +
        'TA = A.ACREEDOR'
      'JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_CONTACTOS TC ON C.TERCERO = TC.TERCERO AN' +
        'D C.CONTACTO = TC.CONTACTO'
      'LEFT JOIN GES_CABECERAS_S_RUTA R ON C.ID_S = R.ID_S'
      'LEFT JOIN SYS_CONF_PRESTASHOP_PEC PSP ON C.ID_S = PSP.ID_S'
      
        'LEFT JOIN SYS_CONF_PRESTASHOP_ORDER PSO ON PSP.ID_CONFIGURACION ' +
        '= PSO.ID_CONFIGURACION AND PSP.ID_ORDER = PSO.ID_ORDER'
      'WHERE'
      'C.ID_S = :ID_S')
    InsertSQL.Strings = (
      
        'SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA, P.FECHA_ENTREGA_PREV, C.ESTADO,'
      
        '       C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, P.CANAL' +
        '_DST_PEC, P.SERIE_DST_PEC, P.TIPO_DST_PEC,'
      
        '       P.ENTRADA_AGRUPACION, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, P' +
        '.LISTO_PARA_PREPARAR, C.SU_REFERENCIA,'
      '       TRIM(TC.NOMBRE || '#39' '#39' || TC.APELLIDOS) NOM_CONTACTO,'
      '       --'
      
        '       CAST(SUBSTRING((SELECT LIST(D_EJERCICIO || '#39' '#39' || D_SERIE' +
        ' || '#39'/'#39' || D_RIG, '#39', '#39')'
      '                       FROM GES_CABECERAS_RELACIONES'
      '                       WHERE'
      '                       O_ID_S = C.ID_S AND'
      
        '                       O_TIPO = C.TIPO) FROM 1 FOR 60) AS VARCHA' +
        'R(60)) DOCUMENTO_DESTINO,'
      '       (SELECT FIRST 1 ID_S'
      '        FROM GES_CABECERAS_RELACIONES'
      '        WHERE'
      '        O_ID_S = C.ID_S AND'
      '        O_TIPO = C.TIPO'
      '        ORDER BY ID_S) ID_S_DESTINO,'
      '       --'
      '       (SELECT SUM(D.UNIDADES * A.PESO)'
      '        FROM GES_DETALLES_S D'
      '        JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      '        WHERE'
      '        D.ID_S = C.ID_S) PESO_TOTAL,'
      '       --'
      
        '       R.RUTA, R.RUTA_ORDEN, C.LIQUIDO, COALESCE(PSO.TOTAL_PAID,' +
        ' C.LIQUIDO, 0) TOTAL_PRESTASHOP, C.TRANSPORTISTA,'
      '       TA.NOMBRE_R_SOCIAL TITULO_TRANSPORTISTA'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = C' +
        'C.CLIENTE'
      'JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO'
      
        'JOIN EMP_ACREEDORES A ON C.EMPRESA = A.EMPRESA AND C.TRANSPORTIS' +
        'TA = A.ACREEDOR'
      'JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_CONTACTOS TC ON C.TERCERO = TC.TERCERO AN' +
        'D C.CONTACTO = TC.CONTACTO'
      'LEFT JOIN GES_CABECERAS_S_RUTA R ON C.ID_S = R.ID_S'
      'LEFT JOIN SYS_CONF_PRESTASHOP_PEC PSP ON C.ID_S = PSP.ID_S'
      
        'LEFT JOIN SYS_CONF_PRESTASHOP_ORDER PSO ON PSP.ID_CONFIGURACION ' +
        '= PSO.ID_CONFIGURACION AND PSP.ID_ORDER = PSO.ID_ORDER'
      'WHERE'
      'C.ID_S = :ID_S')
    RefreshSQL.Strings = (
      
        'SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA, P.FECHA_ENTREGA_PREV, C.ESTADO,'
      
        '       C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, P.CANAL' +
        '_DST_PEC, P.SERIE_DST_PEC, P.TIPO_DST_PEC,'
      
        '       P.ENTRADA_AGRUPACION, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, P' +
        '.LISTO_PARA_PREPARAR, C.SU_REFERENCIA,'
      
        '       TRIM(TC.NOMBRE || '#39' '#39' || TC.APELLIDOS) NOM_CONTACTO, C.MO' +
        'NEDA,'
      '       --'
      
        '       CAST(SUBSTRING((SELECT LIST(D_EJERCICIO || '#39' '#39' || D_SERIE' +
        ' || '#39'/'#39' || D_RIG, '#39', '#39')'
      '                       FROM GES_CABECERAS_RELACIONES'
      '                       WHERE'
      '                       O_ID_S = C.ID_S AND'
      
        '                       O_TIPO = C.TIPO) FROM 1 FOR 60) AS VARCHA' +
        'R(60)) DOCUMENTO_DESTINO,'
      '       (SELECT FIRST 1 ID_S'
      '        FROM GES_CABECERAS_RELACIONES'
      '        WHERE'
      '        O_ID_S = C.ID_S AND'
      '        O_TIPO = C.TIPO'
      '        ORDER BY ID_S) ID_S_DESTINO,'
      '       --'
      '       (SELECT SUM(D.UNIDADES * A.PESO)'
      '        FROM GES_DETALLES_S D'
      '        JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      '        WHERE'
      '        D.ID_S = C.ID_S) PESO_TOTAL,'
      '       --'
      
        '       R.RUTA, R.RUTA_ORDEN, C.LIQUIDO, COALESCE(PSO.TOTAL_PAID,' +
        ' C.LIQUIDO, 0) TOTAL_PRESTASHOP, C.TRANSPORTISTA,'
      
        '       TA.NOMBRE_R_SOCIAL TITULO_TRANSPORTISTA, C.ORIGEN_DOCUMEN' +
        'TO, C.TARIFA, C.S_BASES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = C' +
        'C.CLIENTE'
      'JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO'
      
        'JOIN EMP_ACREEDORES A ON C.EMPRESA = A.EMPRESA AND C.TRANSPORTIS' +
        'TA = A.ACREEDOR'
      'JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_CONTACTOS TC ON C.TERCERO = TC.TERCERO AN' +
        'D C.CONTACTO = TC.CONTACTO'
      'LEFT JOIN GES_CABECERAS_S_RUTA R ON C.ID_S = R.ID_S'
      'LEFT JOIN SYS_CONF_PRESTASHOP_PEC PSP ON C.ID_S = PSP.ID_S'
      
        'LEFT JOIN SYS_CONF_PRESTASHOP_ORDER PSO ON PSP.ID_CONFIGURACION ' +
        '= PSO.ID_CONFIGURACION AND PSP.ID_ORDER = PSO.ID_ORDER'
      'WHERE'
      'C.ID_S=:ID_S')
    SelectSQL.Strings = (
      
        'SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA, P.FECHA_ENTREGA_PREV, C.ESTADO,'
      
        '       C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, P.CANAL' +
        '_DST_PEC, P.SERIE_DST_PEC, P.TIPO_DST_PEC,'
      
        '       P.ENTRADA_AGRUPACION, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, P' +
        '.LISTO_PARA_PREPARAR, C.SU_REFERENCIA,'
      
        '       TRIM(TC.NOMBRE || '#39' '#39' || TC.APELLIDOS) NOM_CONTACTO, C.MO' +
        'NEDA,'
      '       --'
      
        '       CAST(SUBSTRING((SELECT LIST(D_EJERCICIO || '#39' '#39' || D_SERIE' +
        ' || '#39'/'#39' || D_RIG, '#39', '#39')'
      '                       FROM GES_CABECERAS_RELACIONES'
      '                       WHERE'
      '                       O_ID_S = C.ID_S AND'
      
        '                       O_TIPO = C.TIPO) FROM 1 FOR 60) AS VARCHA' +
        'R(60)) DOCUMENTO_DESTINO,'
      '       (SELECT FIRST 1 ID_S'
      '        FROM GES_CABECERAS_RELACIONES'
      '        WHERE'
      '        O_ID_S = C.ID_S AND'
      '        O_TIPO = C.TIPO'
      '        ORDER BY ID_S) ID_S_DESTINO,'
      '       --'
      '       (SELECT SUM(D.UNIDADES * A.PESO)'
      '        FROM GES_DETALLES_S D'
      '        JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      '        WHERE'
      '        D.ID_S = C.ID_S) PESO_TOTAL,'
      '       --'
      
        '       R.RUTA, R.RUTA_ORDEN, C.LIQUIDO, COALESCE(PSO.TOTAL_PAID,' +
        ' C.LIQUIDO, 0) TOTAL_PRESTASHOP, C.TRANSPORTISTA,'
      
        '       TA.NOMBRE_R_SOCIAL TITULO_TRANSPORTISTA, C.ORIGEN_DOCUMEN' +
        'TO, C.TARIFA, C.S_BASES, C.BRUTO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = C' +
        'C.CLIENTE'
      'JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO'
      
        'JOIN EMP_ACREEDORES A ON C.EMPRESA = A.EMPRESA AND C.TRANSPORTIS' +
        'TA = A.ACREEDOR'
      'JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_CONTACTOS TC ON C.TERCERO = TC.TERCERO AN' +
        'D C.CONTACTO = TC.CONTACTO'
      'LEFT JOIN GES_CABECERAS_S_RUTA R ON C.ID_S = R.ID_S'
      'LEFT JOIN SYS_CONF_PRESTASHOP_PEC PSP ON C.ID_S = PSP.ID_S'
      
        'LEFT JOIN SYS_CONF_PRESTASHOP_ORDER PSO ON PSP.ID_CONFIGURACION ' +
        '= PSO.ID_CONFIGURACION AND PSP.ID_ORDER = PSO.ID_ORDER'
      'WHERE'
      'P.EMPRESA = :EMPRESA AND'
      'P.EJERCICIO <= :EJERCICIO AND'
      'P.CANAL = :CANAL AND'
      'P.TIPO = '#39'PEC'#39' AND'
      'P.ENTRADA_AGRUPACION IN (0, :ENTRADA_AGRUPACION) AND'
      'C.ESTADO = 0 AND'
      'P.FECHA_ENTREGA_PREV BETWEEN :DESDE_FECHA AND :HASTA_FECHA'
      'ORDER BY P.EMPRESA, P.EJERCICIO, P.CANAL, P.SERIE, P.TIPO, P.RIG'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_PED'
      'SET '
      'ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION,'
      'CANAL_DST_PEC = :CANAL_DST_PEC,'
      'SERIE_DST_PEC = :SERIE_DST_PEC,'
      'TIPO_DST_PEC = :TIPO_DST_PEC'
      'WHERE'
      'ID_S = :ID_S')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    AfterOpen = QMPedidosAfterOpen
    AfterPost = QMPedidosAfterPost
    BeforeClose = QMPedidosBeforeClose
    BeforeEdit = QMPedidosBeforeEdit
    BeforePost = QMPedidosBeforePost
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_PEDIDO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMPedidosID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
      ReadOnly = True
    end
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
    object QMPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      ReadOnly = True
      Size = 10
    end
    object QMPedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 3
    end
    object QMPedidosRIG: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'RIG'
      ReadOnly = True
    end
    object QMPedidosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      ReadOnly = True
    end
    object QMPedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      ReadOnly = True
    end
    object QMPedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object QMPedidosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      ReadOnly = True
      Size = 60
    end
    object QMPedidosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      ReadOnly = True
      Size = 60
    end
    object QMPedidosCANAL_DST_PEC: TIntegerField
      DisplayLabel = 'Canal Dest.'
      FieldName = 'CANAL_DST_PEC'
    end
    object QMPedidosSERIE_DST_PEC: TFIBStringField
      DisplayLabel = 'Serie Dest.'
      FieldName = 'SERIE_DST_PEC'
      Size = 10
    end
    object QMPedidosTIPO_DST_PEC: TFIBStringField
      DisplayLabel = 'Tipo Doc. Dest.'
      FieldName = 'TIPO_DST_PEC'
      Size = 3
    end
    object QMPedidosENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMPedidosID_S_DESTINO: TIntegerField
      DisplayLabel = 'Id Doc. Destino'
      FieldName = 'ID_S_DESTINO'
      ReadOnly = True
    end
    object QMPedidosRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
    object QMPedidosDOCUMENTO_DESTINO: TFIBStringField
      DisplayLabel = 'Doc. Destino'
      FieldName = 'DOCUMENTO_DESTINO'
      ReadOnly = True
      Size = 60
    end
    object QMPedidosFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
      ReadOnly = True
    end
    object QMPedidosPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
      ReadOnly = True
    end
    object QMPedidosZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      ReadOnly = True
      Size = 256
    end
    object QMPedidosLISTO_PARA_PREPARAR: TIntegerField
      DisplayLabel = 'Listo Preparacion'
      FieldName = 'LISTO_PARA_PREPARAR'
      ReadOnly = True
    end
    object QMPedidosRUTA_ORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'RUTA_ORDEN'
    end
    object QMPedidosTOTAL_PRESTASHOP: TFloatField
      DisplayLabel = 'Total PS'
      FieldName = 'TOTAL_PRESTASHOP'
    end
    object QMPedidosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMPedidosPESO_TOTAL: TFloatField
      DisplayLabel = 'PesoTotal'
      FieldName = 'PESO_TOTAL'
    end
    object QMPedidosSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Rererencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMPedidosNOM_CONTACTO: TFIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'NOM_CONTACTO'
      Size = 81
    end
    object QMPedidosTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Trasportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMPedidosTITULO_TRANSPORTISTA: TFIBStringField
      DisplayLabel = 'Desc. Transportista'
      FieldName = 'TITULO_TRANSPORTISTA'
      Size = 60
    end
    object QMPedidosORIGEN_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Orig. Documento'
      FieldName = 'ORIGEN_DOCUMENTO'
      Size = 3
    end
    object QMPedidosMONEDA: TStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMPedidosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPedidosS_BASES: TFloatField
      DisplayLabel = 'Suma Bases'
      FieldName = 'S_BASES'
    end
    object QMPedidosBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
  end
  object DSQMPedidos: TDataSource
    DataSet = QMPedidos
    Left = 112
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
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
    Left = 368
    Top = 16
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT C.ID_CLIENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL'
      '       --'
      '       ,'
      
        '       (SELECT LIST('#39'---'#39' || TIPO_DOCUMENTO || '#39'---'#39' || ASCII_CH' +
        'AR(13) || MENSAJE, ASCII_CHAR(13))'
      '        FROM (SELECT TIPO_DOCUMENTO, MENSAJE'
      '              FROM EMP_AVISOS'
      '              WHERE'
      '              TIPO_OBJETO = '#39'CLI'#39' AND'
      '              ID_OBJETO = C.ID_CLIENTE AND'
      '              TIPO_DOCUMENTO IN ('#39'ALB'#39', '#39'FAC'#39')'
      '              ORDER BY TIPO_DOCUMENTO)) AVISOS'
      '       --'
      'FROM EMP_CLIENTES C'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSQMPedidos
    Left = 32
    Top = 112
    object xClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object xClientesCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xClientesNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xClientesAVISOS: TMemoField
      FieldName = 'AVISOS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 112
    Top = 112
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_PEDIDO'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ESTADO,CLIENTE' +
        ',MONEDA,ALMACEN,'#13#10'ARTICULO,TITULO,UNIDADES,UNIDADES_SERVIDAS,UNI' +
        'DADES_PENDIENTES,UNIDADES_RESERVADAS,UNIDADES_PREPARADAS,SERVIDO' +
        ',PRECIO,PIEZAS_X_BULTO,'#13#10'BULTOS,DESCUENTO,DESCUENTO_2,DESCUENTO_' +
        '3,COMISION,P_COSTE,M_MOV_STOCK,TIPO_IVA,P_IVA,P_RECARGO,'#13#10'BRUTO,' +
        'B_COMISION,I_DESCUENTO,B_IMPONIBLE,I_COMISION,ENTRADA,ENTRADA_AG' +
        'RUPACION,NOTAS,UNIDADES_EXT,ORDEN_PRODUCCION,UNIDADES_SEC,DIRECC' +
        'ION_ENTREGA,PAIS,'#13#10'ID_DETALLES_S,ID_S,ID_A,ID_C_A,COMISION_LINEA' +
        'L,I_COMISION_LINEAL,FECHA_ENTREGA_PREV,FECHA_REC_DET,TITULO_IDIO' +
        'MA,MARGEN_KRI,'#13#10'TIPO_LINEA_KRI,ORDEN,TIPO_LINEA,PROC_PROMOCION,O' +
        'RIGEN,ID_P,APLICA_UNIDADES_SECUNDARIAS,PROYECTO,NOTAS2,CRC_NOTAS' +
        ','#13#10'CRC_NOTAS2,PRO_NUM_PLANO,TIPO_UNIDAD_LOGISTICA,TITULO_UNIDAD_' +
        'LOGISTICA,U_POR_U_LOGISTICA,RELACIONAR_U_LOGISTICA,UNIDADES_LOGI' +
        'STICAS,U_LOGISTICAS_RESERVADAS,LOTE_SIMPLE,ID_DESPIECE,'#13#10'FECHA_C' +
        'AB,FECHA_CONF_DET,COSTE_ADICIONAL,ID_IMAGEN,PEDIR,MANIPULACION,A' +
        'LFA_1,ALFA_2,'#13#10'ALFA_3,ALFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,SU_REFE' +
        'RENCIA,ASEGURADO,PACIENTE,AUTORIZACION,'#13#10'POLIZA,FEC_REC_IH,INVER' +
        'SION_SUJETO_PASIVO,DECIMALES_UNIDADES,SIGNO_UNIDADES,TIPO_IMPUES' +
        'TO_ADICIONAL,P_IMPUESTO_ADICIONAL,ID_ESC,ID_ESC_2,ID_MEDIDA,'#13#10'ID' +
        '_ORDEN,AGENTE,PESO,PESO_TOTAL,PESO_REAL,DIRECCION_ALM_LOGISTICO,' +
        'LISTO_PARA_PREPARAR,ECOTASA,REQUIERE_LOTE_SIMPLE)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ESTADO' +
        ',?CLIENTE,?MONEDA,?ALMACEN,'#13#10'?ARTICULO,?TITULO,?UNIDADES,?UNIDAD' +
        'ES_SERVIDAS,?UNIDADES_PENDIENTES,?UNIDADES_RESERVADAS,?UNIDADES_' +
        'PREPARADAS,?SERVIDO,?PRECIO,?PIEZAS_X_BULTO,'#13#10'?BULTOS,?DESCUENTO' +
        ',?DESCUENTO_2,?DESCUENTO_3,?COMISION,?P_COSTE,?M_MOV_STOCK,?TIPO' +
        '_IVA,?P_IVA,?P_RECARGO,'#13#10'?BRUTO,?B_COMISION,?I_DESCUENTO,?B_IMPO' +
        'NIBLE,?I_COMISION,?ENTRADA,?ENTRADA_AGRUPACION,?NOTAS,?UNIDADES_' +
        'EXT,?ORDEN_PRODUCCION,?UNIDADES_SEC,?DIRECCION_ENTREGA,?PAIS,'#13#10'?' +
        'ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?COMISION_LINEAL,?I_COMISION_L' +
        'INEAL,?FECHA_ENTREGA_PREV,?FECHA_REC_DET,?TITULO_IDIOMA,?MARGEN_' +
        'KRI,'#13#10'?TIPO_LINEA_KRI,?ORDEN,?TIPO_LINEA,?PROC_PROMOCION,?ORIGEN' +
        ',?ID_P,?APLICA_UNIDADES_SECUNDARIAS,?PROYECTO,?NOTAS2,?CRC_NOTAS' +
        ','#13#10'?CRC_NOTAS2,?PRO_NUM_PLANO,?TIPO_UNIDAD_LOGISTICA,?TITULO_UNI' +
        'DAD_LOGISTICA,?U_POR_U_LOGISTICA,?RELACIONAR_U_LOGISTICA,?UNIDAD' +
        'ES_LOGISTICAS,?U_LOGISTICAS_RESERVADAS,?LOTE_SIMPLE,?ID_DESPIECE' +
        ','#13#10'?FECHA_CAB,?FECHA_CONF_DET,?COSTE_ADICIONAL,?ID_IMAGEN,?PEDIR' +
        ',?MANIPULACION,?ALFA_1,?ALFA_2,'#13#10'?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6' +
        ',?ALFA_7,?ALFA_8,?SU_REFERENCIA,?ASEGURADO,?PACIENTE,?AUTORIZACI' +
        'ON,'#13#10'?POLIZA,?FEC_REC_IH,?INVERSION_SUJETO_PASIVO,?DECIMALES_UNI' +
        'DADES,?SIGNO_UNIDADES,?TIPO_IMPUESTO_ADICIONAL,?P_IMPUESTO_ADICI' +
        'ONAL,?ID_ESC,?ID_ESC_2,?ID_MEDIDA,'#13#10'?ID_ORDEN,?AGENTE,?PESO,?PES' +
        'O_TOTAL,?PESO_REAL,?DIRECCION_ALM_LOGISTICO,?LISTO_PARA_PREPARAR' +
        ',?ECOTASA,?REQUIERE_LOTE_SIMPLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO '
      'WHERE'
      'ID_S = ?ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_PEDIDO'
      'SET'
      '  LOTE_SIMPLE=?LOTE_SIMPLE '
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    AutoCalcFields = False
    DataSource = DSQMPedidos
    Plan.Strings = (
      'PLAN (VER_DETALLE_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      '           VER_DETALLE_PEDIDO DET INDEX (GES_DETALLES_S_CAB_ID),'
      '           VER_DETALLE_PEDIDO PED INDEX (GES_DETALLES_S_PED_ID))')
    OnCalcFields = QMDetalleCalcFields
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S '
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_PEDIDO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_PED')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      EditMask = '>ccccccccccccccc;0;_'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object QMDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleCOMISION: TFloatField
      DisplayLabel = 'Comisi'#243'n'
      FieldName = 'COMISION'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Recargo'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comisi'#243'n'
      FieldName = 'B_COMISION'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Dto.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comisi'#243'n'
      FieldName = 'I_COMISION'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Recargo'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
      ReadOnly = True
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMDetalleSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_S'
      ReadOnly = True
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID Cab'
      FieldName = 'ID_S'
      ReadOnly = True
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
      ReadOnly = True
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Cta.'
      FieldName = 'ID_C_A'
      ReadOnly = True
    end
    object QMDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMDetalleDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fecha Rec. Det.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Desc. Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 256
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object QMDetalleORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetalleID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetalleMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas 2'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object QMDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Nro. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.Log.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Titulo Ud. Log.'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object QMDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Nro. Serie / Lote'
      FieldName = 'LOTE_SIMPLE'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
      ReadOnly = True
    end
    object QMDetalleUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reservadas'
      FieldName = 'UNIDADES_RESERVADAS'
    end
    object QMDetalleENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Seleccionado'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMDetalleORDEN_PRODUCCION: TIntegerField
      DisplayLabel = 'Ord. Producccion'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleID_DESPIECE: TIntegerField
      DisplayLabel = 'Id. Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMDetalleFECHA_CONF_DET: TDateTimeField
      DisplayLabel = 'Fecha Conf. Det.'
      FieldName = 'FECHA_CONF_DET'
    end
    object QMDetalleCODIGO_CLIENTE: TStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object QMDetalleTITULO_CLIENTE: TStringField
      DisplayLabel = 'Titulo Segun Cli.'
      FieldName = 'TITULO_CLIENTE'
      Size = 256
    end
    object QMDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object QMDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'Id. Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetalleID_ESC: TIntegerField
      DisplayLabel = 'Id. Esc.'
      FieldName = 'ID_ESC'
    end
    object QMDetalleID_MEDIDA: TIntegerField
      DisplayLabel = 'Id. Medida'
      FieldName = 'ID_MEDIDA'
    end
    object QMDetalleTOTAL_UNIDADES_EXT: TFloatField
      DisplayLabel = 'Tot. Uds. Ext.'
      FieldName = 'TOTAL_UNIDADES_EXT'
    end
    object QMDetalleMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldKind = fkCalculated
      FieldName = 'MARGEN'
      Calculated = True
    end
    object QMDetalleMANIPULACION: TIntegerField
      DisplayLabel = 'Man.'
      FieldName = 'MANIPULACION'
    end
    object QMDetalleALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMDetalleALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMDetalleALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMDetalleALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMDetalleALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMDetalleALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMDetalleALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMDetalleALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMDetalleSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMDetalleUNIDADES_PREPARADAS: TFloatField
      DisplayLabel = 'U. Prep.'
      FieldName = 'UNIDADES_PREPARADAS'
    end
    object QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'ISP'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMDetalleDECIMALES_UNIDADES: TIntegerField
      DisplayLabel = 'Decimales Uds.'
      FieldName = 'DECIMALES_UNIDADES'
    end
    object QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMDetalleP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = '% Imp. Adicional'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object QMDetalleAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
    end
    object QMDetallePESO_REAL: TFloatField
      DisplayLabel = 'Peso Real'
      FieldName = 'PESO_REAL'
    end
    object QMDetalleSIGNO_UNIDADES: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'SIGNO_UNIDADES'
      Size = 3
    end
    object QMDetalleDIRECCION_ALM_LOGISTICO: TIntegerField
      DisplayLabel = 'Dir. Alm. Logistico'
      FieldName = 'DIRECCION_ALM_LOGISTICO'
    end
    object QMDetalleID_ESC_2: TIntegerField
      DisplayLabel = 'Id Esc. 2'
      FieldName = 'ID_ESC_2'
    end
    object QMDetalleU_POR_U_LOGISTICA: TFloatField
      DisplayLabel = 'Uds./U.Log.'
      FieldName = 'U_POR_U_LOGISTICA'
    end
    object QMDetalleRELACIONAR_U_LOGISTICA: TIntegerField
      DisplayLabel = 'Rel. U. Log.'
      FieldName = 'RELACIONAR_U_LOGISTICA'
    end
    object QMDetallePEDIR: TIntegerField
      DisplayLabel = 'Pedir'
      FieldName = 'PEDIR'
    end
    object QMDetalleTIPO_IVA_ART: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TIPO_IVA_ART'
      Calculated = True
    end
    object QMDetalleECOTASA: TFloatField
      DisplayLabel = 'Ecotasa'
      FieldName = 'ECOTASA'
    end
    object QMDetalleREQUIERE_LOTE_SIMPLE: TIntegerField
      DisplayLabel = 'Req. Lote Simple'
      FieldName = 'REQUIERE_LOTE_SIMPLE'
    end
    object QMDetalleCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrl. Stock.'
      FieldName = 'CONTROL_STOCK'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 64
  end
  object QMDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT C.TERCERO, C.DIRECCION, D.DIR_NOMBRE, D.DIR_NOMBRE_2, D.D' +
        'IR_NOMBRE_3, D.DIR_COMPLETA_N, L.TITULO AS LOCALIDAD,'
      
        '       L.CODIGO_POSTAL, PR.TITULO AS PROVINCIA, PA.PAIS, PA.TITU' +
        'LO AS PAIS_NOMBRE, PA.PERTENECE_CEE, C.ID_S, P.ENTRADA_AGRUPACIO' +
        'N'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND C.D' +
        'IRECCION = D.DIRECCION'
      'JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL'
      
        'JOIN SYS_PROVINCIAS PR ON L.PAIS = PR.PAIS AND L.PROVINCIA = PR.' +
        'PROVINCIA'
      'JOIN SYS_PAISES PA ON L.PAIS = PA.PAIS'
      'WHERE'
      '(P.ID_S = :ID_S) OR'
      
        '((P.ENTRADA_AGRUPACION = :ENTRADA) AND (P.ENTRADA_AGRUPACION <> ' +
        '0))'
      'ORDER BY P.ENTRADA_AGRUPACION DESC, C.ID_S')
    UniDirectional = False
    DataSource = DSQMPedidos
    Left = 32
    Top = 160
    object QMDireccionTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMDireccionDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMDireccionDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir. Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMDireccionDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. Nombre 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMDireccionDIR_NOMBRE_3: TFIBStringField
      DisplayLabel = 'Dir. Nombre 3'
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object QMDireccionDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Dir. Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMDireccionLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMDireccionCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMDireccionPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMDireccionPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDireccionPAIS_NOMBRE: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS_NOMBRE'
      Size = 60
    end
    object QMDireccionPERTENECE_CEE: TIntegerField
      DisplayLabel = 'Pertenece C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
    object QMDireccionID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMDireccionENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Seleccionado'
      FieldName = 'ENTRADA_AGRUPACION'
    end
  end
  object DSQMDireccion: TDataSource
    DataSet = QMDireccion
    Left = 112
    Top = 160
  end
end
