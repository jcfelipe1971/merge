object DMPedidosPendientesProv: TDMPedidosPendientesProv
  OldCreateOrder = False
  OnCreate = DMPedidosPendientesProvCreate
  OnDestroy = DataModuleDestroy
  Left = 565
  Top = 332
  Height = 384
  Width = 470
  object QMPedidosPendientesProv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, DET2.TITULO AS ' +
        'TITULO_LINEA, CAB2.RIG, CAB2.PROVEEDOR, TER.NOMBRE_R_SOCIAL, DET' +
        '2.UNIDADES, DET2.ALMACEN,'
      
        '       DET.UNIDADES_ORIGINALES, DET.UNIDADES_SERVIDAS, DET.UNIDA' +
        'DES_POR_SERVIR, DET.LINEA_SERVIDA, DET.P_COSTE,'
      
        '       DET2.DESCUENTO, DET.UNIDADES_RECEPCION, DET.FECHA_PRE_DET' +
        ', DET.FECHA_REC_DET, DET.SERVIR_LINEA,'
      
        '       DET.FECHA_CONF_KRI, DET.PLAZO_CONFIRM_KRI, DET.ENTRADA_RE' +
        'CEPCION, DET.ID_DETALLES_E, DET.ID_E, CAB2.ID_ORDEN,'
      
        '       ORD.ESTADO AS ESTADO_ORDEN, EST.TITULO AS TITULO_ESTADO, ' +
        'TER.EMAIL CORREO, CAB.MODIFICA_DOC, CAB.FECHA,'
      
        '       DET2.EMPRESA, DET2.EJERCICIO, DET2.CANAL, DET2.SERIE, DET' +
        '2.TIPO, DET2.LINEA,'
      
        '       COALESCE(APR.INCR_PEDIDO, 0) AS INCR_PEDIDO, ART.CONTROL_' +
        'STOCK, ART.FAMILIA, ART.ALFA_1, ART.ALFA_2, ART.ALFA_3,'
      
        '       ART.ALFA_4, ART.ALFA_5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_' +
        '8,'
      '       (SELECT FIRST 1 P.FECHA_ENTREGA_PREV'
      '        FROM GES_DETALLES_RELACIONES R'
      
        '        JOIN GES_CABECERAS_S C ON R.O_EMPRESA = C.EMPRESA AND R.' +
        'O_EJERCICIO = C.EJERCICIO AND R.O_CANAL = C.CANAL AND R.O_SERIE ' +
        '= C.SERIE AND R.O_TIPO = C.TIPO AND R.O_RIG = C.RIG'
      '        LEFT JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      '        WHERE'
      '        R.D_ID_DETALLES_S = DET.ID_DETALLES_E'
      '        ORDER BY P.FECHA_ENTREGA_PREV) FECHA_ENTREGA_PREV_CLI,'
      '       (COALESCE((SELECT SUM(P.UNIDADES_POR_SERVIR)'
      '                  FROM GES_DETALLES_E_PED P'
      
        '                  JOIN GES_DETALLES_E D ON (P.ID_DETALLES_E = D.' +
        'ID_DETALLES_E)'
      '                  JOIN GES_CABECERAS_E G ON (P.ID_E = G.ID_E)'
      '                  WHERE'
      '                  D.EMPRESA = DET.EMPRESA AND'
      '                  D.CANAL = DET.CANAL AND'
      '                  D.ARTICULO = DET2.ARTICULO AND'
      '                  P.LINEA_SERVIDA = 0 AND'
      '                  G.ESTADO = 0), 0)) PEDIDOS_A_PROV'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      
        'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.A' +
        'RTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E)'
      'JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO)'
      
        'LEFT JOIN ART_ARTICULOS_PROVEEDORES APR ON (ART.EMPRESA = APR.EM' +
        'PRESA AND ART.ARTICULO = APR.ARTICULO AND CAB2.PROVEEDOR = APR.P' +
        'ROVEEDOR AND APR.ACTIVO = 1)'
      'LEFT JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = CAB2.ID_ORDEN)'
      'LEFT JOIN PRO_SYS_ESTADO EST ON (ORD.ESTADO = EST.ESTADO)'
      'WHERE'
      'DET.ID_DETALLES_E = :ID_DETALLES_E')
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      
        'SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, DET2.TITULO AS ' +
        'TITULO_LINEA, CAB2.RIG, CAB2.PROVEEDOR,'
      
        '       TER.NOMBRE_R_SOCIAL, TER.NOMBRE_COMERCIAL, DET2.UNIDADES,' +
        ' DET2.ALMACEN,'
      
        '       DET.UNIDADES_ORIGINALES, DET.UNIDADES_SERVIDAS, DET.UNIDA' +
        'DES_POR_SERVIR, DET.LINEA_SERVIDA, DET.P_COSTE,'
      
        '       DET2.DESCUENTO, DET.UNIDADES_RECEPCION, DET.FECHA_PRE_DET' +
        ', DET.FECHA_REC_DET, DET.SERVIR_LINEA,'
      
        '       DET.FECHA_CONF_KRI, DET.PLAZO_CONFIRM_KRI, DET.ENTRADA_RE' +
        'CEPCION, DET.ID_DETALLES_E, DET.ID_E, CAB2.ID_ORDEN,'
      
        '       ORD.ESTADO AS ESTADO_ORDEN, EST.TITULO AS TITULO_ESTADO, ' +
        'TER.EMAIL CORREO, CAB.MODIFICA_DOC, CAB.FECHA,'
      
        '       DET2.EMPRESA, DET2.EJERCICIO, DET2.CANAL, DET2.SERIE, DET' +
        '2.TIPO, DET2.LINEA,'
      
        '       COALESCE(APR.INCR_PEDIDO, 0) AS INCR_PEDIDO, ART.CONTROL_' +
        'STOCK, ART.FAMILIA, ART.ALFA_1, ART.ALFA_2, ART.ALFA_3,'
      
        '       ART.ALFA_4, ART.ALFA_5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_' +
        '8,'
      '       (SELECT FIRST 1 P.FECHA_ENTREGA_PREV'
      '        FROM GES_DETALLES_RELACIONES R'
      '        JOIN GES_CABECERAS_S C ON R.O_EMPRESA = C.EMPRESA AND'
      '              R.O_EJERCICIO = C.EJERCICIO AND'
      '              R.O_CANAL = C.CANAL AND'
      '              R.O_SERIE = C.SERIE AND'
      '              R.O_TIPO = C.TIPO AND'
      '              R.O_RIG = C.RIG'
      '        LEFT JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      '        WHERE'
      '        R.D_ID_DETALLES_S = DET.ID_DETALLES_E'
      '        ORDER BY P.FECHA_ENTREGA_PREV) FECHA_ENTREGA_PREV_CLI,'
      '       (COALESCE((SELECT SUM(P.UNIDADES_POR_SERVIR)'
      '                  FROM GES_DETALLES_E_PED P'
      
        '                  JOIN GES_DETALLES_E D ON (P.ID_DETALLES_E = D.' +
        'ID_DETALLES_E)'
      '                  JOIN GES_CABECERAS_E G ON (P.ID_E = G.ID_E)'
      '                  WHERE'
      '                  D.EMPRESA = DET.EMPRESA AND'
      '                  D.CANAL = DET.CANAL AND'
      '                  D.ARTICULO = DET2.ARTICULO AND'
      '                  P.LINEA_SERVIDA = 0 AND'
      '                  G.ESTADO = 0), 0)) PEDIDOS_A_PROV'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND'
      '      DET2.ARTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E)'
      'JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO)'
      
        'LEFT JOIN ART_ARTICULOS_PROVEEDORES APR ON (ART.EMPRESA = APR.EM' +
        'PRESA AND'
      '      ART.ARTICULO = APR.ARTICULO AND'
      '      CAB2.PROVEEDOR = APR.PROVEEDOR AND'
      '      APR.ACTIVO = 1)'
      'LEFT JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = CAB2.ID_ORDEN)'
      'LEFT JOIN PRO_SYS_ESTADO EST ON (ORD.ESTADO = EST.ESTADO)'
      'WHERE'
      'DET.EMPRESA = :EMPRESA AND'
      'DET.EJERCICIO <= :EJERCICIO AND'
      'DET.CANAL = :CANAL AND'
      'DET.TIPO = :TIPO AND'
      'CAB.ESTADO = 0 AND'
      'DET.UNIDADES_SERVIDAS < DET2.UNIDADES AND'
      'DET.LINEA_SERVIDA = 0'
      'ORDER BY DET.ID_DETALLES_E'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_PED'
      'SET ENTRADA_RECEPCION = :ENTRADA_RECEPCION'
      'WHERE ID_DETALLES_E = :ID_DETALLES_E')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    AfterClose = QMPedidosPendientesProvAfterClose
    AfterOpen = QMPedidosPendientesProvAfterOpen
    OnCalcFields = QMPedidosPendientesProvCalcFields
    OnNewRecord = QMLineasPedidosProveedorNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMPedidosPendientesProvARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPedidosPendientesProvTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMPedidosPendientesProvUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMPedidosPendientesProvUNIDADES_ORIGINALES: TFloatField
      DisplayLabel = 'Uds. Originales'
      FieldName = 'UNIDADES_ORIGINALES'
    end
    object QMPedidosPendientesProvUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object QMPedidosPendientesProvUNIDADES_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds. por servir'
      FieldName = 'UNIDADES_POR_SERVIR'
    end
    object QMPedidosPendientesProvLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'Linea Serv.'
      FieldName = 'LINEA_SERVIDA'
    end
    object QMPedidosPendientesProvP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMPedidosPendientesProvDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMPedidosPendientesProvUNIDADES_RECEPCION: TFloatField
      DisplayLabel = 'Uds. Recepcion'
      FieldName = 'UNIDADES_RECEPCION'
    end
    object QMPedidosPendientesProvFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prevista'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMPedidosPendientesProvFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Rec. Det.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMPedidosPendientesProvSERVIR_LINEA: TIntegerField
      DisplayLabel = 'Servir Linea'
      FieldName = 'SERVIR_LINEA'
    end
    object QMPedidosPendientesProvFECHA_CONF_KRI: TDateTimeField
      DisplayLabel = 'Fec. Confirmacion'
      FieldName = 'FECHA_CONF_KRI'
    end
    object QMPedidosPendientesProvPLAZO_CONFIRM_KRI: TDateTimeField
      DisplayLabel = 'Plazo Confirmacion'
      FieldName = 'PLAZO_CONFIRM_KRI'
    end
    object QMPedidosPendientesProvID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMPedidosPendientesProvRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMPedidosPendientesProvPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMPedidosPendientesProvALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPedidosPendientesProvID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMPedidosPendientesProvENTRADA_RECEPCION: TIntegerField
      DisplayLabel = 'Enviar'
      FieldName = 'ENTRADA_RECEPCION'
    end
    object QMPedidosPendientesProvCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 100
    end
    object QMPedidosPendientesProvID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object QMPedidosPendientesProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosPendientesProvEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosPendientesProvCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPedidosPendientesProvSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPedidosPendientesProvTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPedidosPendientesProvLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPedidosPendientesProvMODIFICA_DOC: TIntegerField
      DisplayLabel = 'List.'
      FieldName = 'MODIFICA_DOC'
    end
    object QMPedidosPendientesProvFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosPendientesProvINCR_PEDIDO: TFloatField
      DisplayLabel = 'Incr. Ped.'
      FieldName = 'INCR_PEDIDO'
    end
    object QMPedidosPendientesProvSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      OnGetText = QMPedidosPendientesProvSTOCK_ALMGetText
      Calculated = True
    end
    object QMPedidosPendientesProvSTOCK_ALM_2: TFloatField
      DisplayLabel = 'Stock2'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM_2'
      OnGetText = QMPedidosPendientesProvSTOCK_ALM_2GetText
      Calculated = True
    end
    object QMPedidosPendientesProvCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMPedidosPendientesProvSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock M'#237'n.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_MINIMO'
      OnGetText = QMPedidosPendientesProvSTOCK_MINIMOGetText
      Calculated = True
    end
    object QMPedidosPendientesProvFECHA_ENTREGA_PREV_CLI: TDateTimeField
      DisplayLabel = 'Fec. Entr. Cliente'
      FieldName = 'FECHA_ENTREGA_PREV_CLI'
    end
    object QMPedidosPendientesProvPEDIDOS_A_PROV: TFloatField
      DisplayLabel = 'Total Ped. Prov.'
      FieldName = 'PEDIDOS_A_PROV'
    end
    object QMPedidosPendientesProvFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMPedidosPendientesProvALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMPedidosPendientesProvALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMPedidosPendientesProvESTADO_ORDEN: TIntegerField
      DisplayLabel = 'Estado Ord.'
      FieldName = 'ESTADO_ORDEN'
    end
    object QMPedidosPendientesProvTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Estado Ord.'
      FieldName = 'TITULO_ESTADO'
      Size = 25
    end
    object QMPedidosPendientesProvTITULO_LINEA: TFIBStringField
      FieldName = 'TITULO_LINEA'
      Size = 256
    end
    object QMPedidosPendientesProvNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMPedidosPendientesProvNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMPedidosPendientesProvPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. Cli.'
      FieldKind = fkCalculated
      FieldName = 'PEDIDOS_D_CLI'
      Calculated = True
    end
  end
  object DSPedidosPendientesProv: TDataSource
    DataSet = QMPedidosPendientesProv
    Left = 200
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 56
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
    Left = 200
    Top = 8
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, CAB2.RIG, CAB2.' +
        'PROVEEDOR, TER.NOMBRE_R_SOCIAL, DET2.UNIDADES, DET2.ALMACEN,'
      
        '       DET.UNIDADES_ORIGINALES, DET.UNIDADES_SERVIDAS, DET.UNIDA' +
        'DES_POR_SERVIR, DET.LINEA_SERVIDA, DET.P_COSTE,'
      
        '       DET2.DESCUENTO, DET.UNIDADES_RECEPCION, DET.FECHA_PRE_DET' +
        ', DET.FECHA_REC_DET, DET.SERVIR_LINEA,'
      
        '       DET.FECHA_CONF_KRI, DET.PLAZO_CONFIRM_KRI, DET.ENTRADA_RE' +
        'CEPCION, DET.ID_DETALLES_E, CAB2.ID_ORDEN,'
      '      TER.EMAIL CORREO'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      
        'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.A' +
        'RTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E)'
      'JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO)'
      'WHERE'
      'DET.ID_DETALLES_E = :ID_DETALLES_E')
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      'SELECT *'
      'FROM VER_CABECERAS_PEDIDO_PROV'
      'WHERE'
      'ID_E IN '
      '('
      'SELECT distinct CAB.ID_E'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'WHERE '
      'DET.EMPRESA = :EMPRESA AND '
      'DET.EJERCICIO <= :EJERCICIO AND '
      'DET.CANAL = :CANAL AND '
      '/* DET.SERIE = SERIE AND */'
      'DET.TIPO = :TIPO AND '
      'CAB.ESTADO = 0 AND '
      'DET.LINEA_SERVIDA = 0 AND'
      'DET.ENTRADA_RECEPCION = :ENTRADA_RECEPCION)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_PED'
      'SET ENTRADA_RECEPCION = :ENTRADA_RECEPCION'
      'WHERE ID_DETALLES_E = :ID_DETALLES_E')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    OnNewRecord = QMLineasPedidosProveedorNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 152
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 200
    Top = 152
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, CAB2.RIG, CAB2.' +
        'PROVEEDOR, TER.NOMBRE_R_SOCIAL, DET2.UNIDADES, DET2.ALMACEN,'
      
        '       DET.UNIDADES_ORIGINALES, DET.UNIDADES_SERVIDAS, DET.UNIDA' +
        'DES_POR_SERVIR, DET.LINEA_SERVIDA, DET.P_COSTE,'
      
        '       DET2.DESCUENTO, DET.UNIDADES_RECEPCION, DET.FECHA_PRE_DET' +
        ', DET.FECHA_REC_DET, DET.SERVIR_LINEA,'
      
        '       DET.FECHA_CONF_KRI, DET.PLAZO_CONFIRM_KRI, DET.ENTRADA_RE' +
        'CEPCION, DET.ID_DETALLES_E, CAB2.ID_ORDEN,'
      '      TER.EMAIL CORREO'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      
        'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.A' +
        'RTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E)'
      'JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO)'
      'WHERE'
      'DET.ID_DETALLES_E = :ID_DETALLES_E')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO_PROV'
      'where ID_E = :ID_E'
      'order by orden'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_PED'
      'SET ENTRADA_RECEPCION = :ENTRADA_RECEPCION'
      'WHERE ID_DETALLES_E = :ID_DETALLES_E')
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    OnNewRecord = QMLineasPedidosProveedorNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 200
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 200
    Top = 200
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    OnBeforePrint = frListadoBeforePrint
    OnEnterRect = frListadoBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 304
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 304
    Top = 152
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9723134954
    ReportOptions.LastChange = 38691.9723134954
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxListadoBeforePrint
    OnGetValue = frxListadoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 360
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 304
    Top = 200
  end
  object xProvConPedidosPend: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, CAB2.RIG, CAB2.' +
        'PROVEEDOR, TER.NOMBRE_R_SOCIAL, DET2.UNIDADES, DET2.ALMACEN,'
      
        '       DET.UNIDADES_ORIGINALES, DET.UNIDADES_SERVIDAS, DET.UNIDA' +
        'DES_POR_SERVIR, DET.LINEA_SERVIDA, DET.P_COSTE,'
      
        '       DET2.DESCUENTO, DET.UNIDADES_RECEPCION, DET.FECHA_PRE_DET' +
        ', DET.FECHA_REC_DET, DET.SERVIR_LINEA,'
      
        '       DET.FECHA_CONF_KRI, DET.PLAZO_CONFIRM_KRI, DET.ENTRADA_RE' +
        'CEPCION, DET.ID_DETALLES_E, CAB2.ID_ORDEN,'
      '      TER.EMAIL CORREO'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      
        'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.A' +
        'RTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E)'
      'JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO)'
      'WHERE'
      'DET.ID_DETALLES_E = :ID_DETALLES_E')
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      'SELECT distinct CAB2.EMPRESA, CAB2.TERCERO, CAB2.PROVEEDOR'
      'FROM GES_DETALLES_E_PED DET'
      
        'JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLE' +
        'S_E)'
      
        'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.A' +
        'RTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E)'
      'JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E)'
      'JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO)'
      'WHERE '
      'DET.EMPRESA = :EMPRESA AND '
      'DET.EJERCICIO <= :EJERCICIO AND '
      'DET.CANAL = :CANAL AND '
      '/* DET.SERIE = SERIE AND */'
      'DET.TIPO = :TIPO AND '
      'CAB.ESTADO = 0 AND '
      'DET.LINEA_SERVIDA = 0 AND'
      'DET.ENTRADA_RECEPCION = :ENTRADA_RECEPCION'
      'ORDER BY DET.ID_DETALLES_E')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_PED'
      'SET ENTRADA_RECEPCION = :ENTRADA_RECEPCION'
      'WHERE ID_DETALLES_E = :ID_DETALLES_E')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    OnNewRecord = QMLineasPedidosProveedorNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
  end
  object DSProvConPedidosPen: TDataSource
    DataSet = xProvConPedidosPend
    Left = 200
    Top = 104
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from dame_datos_proveedor(?EMPRESA,?EJERCICIO,?PROVEEDO' +
        'R,?CANAL,?ID_E)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 56
    Top = 248
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 200
    Top = 248
  end
  object xDireccionProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT FIRST (1) * FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :PROV' +
        'EEDOR, :ID_E, 1)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 56
    Top = 296
  end
  object DSxDireccion_Proveedores: TDataSource
    DataSet = xDireccionProveedores
    Left = 200
    Top = 296
  end
  object xRelacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA , C.SU_REFERENCIA, C.CLIENTE, T.NOMBRE_R_SOCIAL,' +
        ' P.FECHA_ENTREGA_PREV, D.LINEA, D.ARTICULO, D.TITULO, D.ID_DETAL' +
        'LES_S'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_CABECERAS_S C ON R.O_EMPRESA = C.EMPRESA AND R.O_EJERCI' +
        'CIO = C.EJERCICIO AND R.O_CANAL = C.CANAL AND R.O_SERIE = C.SERI' +
        'E AND R.O_TIPO = C.TIPO AND R.O_RIG = C.RIG'
      'LEFT JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN GES_DETALLES_S D ON R.O_EMPRESA = D.EMPRESA AND R.O_EJERCIC' +
        'IO = D.EJERCICIO AND R.O_CANAL = D.CANAL AND R.O_SERIE = D.SERIE' +
        ' AND R.O_TIPO = D.TIPO AND R.O_RIG = D.RIG AND R.O_LINEA = D.LIN' +
        'EA'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'WHERE'
      'R.D_EMPRESA = :EMPRESA AND'
      'R.D_EJERCICIO = :EJERCICIO AND'
      'R.D_CANAL = :CANAL AND'
      'R.D_SERIE = :SERIE AND'
      'R.D_TIPO = :TIPO AND'
      'R.D_RIG = :RIG AND'
      'R.D_LINEA = :LINEA AND'
      'C.ID_S = :ID_S')
    SelectSQL.Strings = (
      
        'SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA , C.SU_REFERENCIA, C.CLIENTE, T.NOMBRE_R_SOCIAL,' +
        ' P.FECHA_ENTREGA_PREV, D.LINEA, D.ARTICULO, D.TITULO, D.ID_DETAL' +
        'LES_S'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_CABECERAS_S C ON R.O_EMPRESA = C.EMPRESA AND R.O_EJERCI' +
        'CIO = C.EJERCICIO AND R.O_CANAL = C.CANAL AND R.O_SERIE = C.SERI' +
        'E AND R.O_TIPO = C.TIPO AND R.O_RIG = C.RIG'
      'LEFT JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S'
      
        'JOIN GES_DETALLES_S D ON R.O_EMPRESA = D.EMPRESA AND R.O_EJERCIC' +
        'IO = D.EJERCICIO AND R.O_CANAL = D.CANAL AND R.O_SERIE = D.SERIE' +
        ' AND R.O_TIPO = D.TIPO AND R.O_RIG = D.RIG AND R.O_LINEA = D.LIN' +
        'EA'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'WHERE'
      'R.D_EMPRESA = :EMPRESA AND'
      'R.D_EJERCICIO = :EJERCICIO AND'
      'R.D_CANAL = :CANAL AND'
      'R.D_SERIE = :SERIE AND'
      'R.D_TIPO = :TIPO AND'
      'R.D_RIG = :RIG AND'
      'R.D_LINEA = :LINEA AND'
      'R.TITULO NOT LIKE '#39'%[SM]%'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSPedidosPendientesProv
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 304
    Top = 56
    object xRelacionID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xRelacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRelacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRelacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRelacionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xRelacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRelacionRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object xRelacionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xRelacionSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xRelacionCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xRelacionNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xRelacionFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xRelacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRelacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xRelacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xRelacionID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Detalle'
      FieldName = 'ID_DETALLES_S'
    end
  end
  object DSxRelacion: TDataSource
    DataSet = xRelacion
    Left = 360
    Top = 56
  end
end
