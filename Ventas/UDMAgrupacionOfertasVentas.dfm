object DMAgrupacionOfertasVentas: TDMAgrupacionOfertasVentas
  OldCreateOrder = False
  OnCreate = DMAgrupacionOfertasVentasCreate
  OnDestroy = DataModuleDestroy
  Left = 768
  Top = 172
  Height = 587
  Width = 637
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_PEDIDO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,CLIENTE,ALMACEN,' +
        'ARTICULO,TITULO,UNIDADES,UNIDADES_SERVIDAS,UNIDADES_PENDIENTES,U' +
        'NIDADES_RESERVADAS,SERVIDO,PRECIO,PIEZAS_X_BULTO,BULTOS,DESCUENT' +
        'O,COMISION,P_COSTE,M_MOV_STOCK,TIPO_IVA,P_IVA,P_RECARGO,BRUTO,B_' +
        'COMISION,I_DESCUENTO,B_IMPONIBLE,B_DTO_LINEA,I_COMISION,C_IVA,C_' +
        'RECARGO,T_COSTE,M_BRUTO,LIQUIDO,ENTRADA,ENTRADA_AGRUPACION)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?CLIENTE,' +
        '?ALMACEN,?ARTICULO,?TITULO,?UNIDADES,?UNIDADES_SERVIDAS,?UNIDADE' +
        'S_PENDIENTES,?UNIDADES_RESERVADAS,?SERVIDO,?PRECIO,?PIEZAS_X_BUL' +
        'TO,?BULTOS,?DESCUENTO,?COMISION,?P_COSTE,?M_MOV_STOCK,?TIPO_IVA,' +
        '?P_IVA,?P_RECARGO,?BRUTO,?B_COMISION,?I_DESCUENTO,?B_IMPONIBLE,?' +
        'B_DTO_LINEA,?I_COMISION,?C_IVA,?C_RECARGO,?T_COSTE,?M_BRUTO,?LIQ' +
        'UIDO,?ENTRADA,?ENTRADA_AGRUPACION)')
    RefreshSQL.Strings = (
      
        'SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, ' +
        'D.LINEA, D.CLIENTE, D.UNIDADES, D.UNIDADES_SERVIDAS,'
      
        '       D.PAIS, D.UNIDADES_RESERVADAS, D.UNIDADES_PREPARADAS, D.S' +
        'ERVIDO, D.P_COSTE, D.ENTRADA_AGRUPACION, D.ARTICULO,'
      
        '       D.TITULO, D.ALMACEN, D.ENTRADA, D.MONEDA, D.FECHA_REC_DET' +
        ', D.ID_A, D.ID_DETALLES_S, D.TIPO_LINEA, D.ID_S,'
      
        '       D.ORIGEN, D.UNIDADES_PENDIENTES, D.FECHA_ENTREGA_PREV, D.' +
        'DIRECCION_ENTREGA, D.TIPO_UNIDAD_LOGISTICA,'
      
        '       D.TITULO_UNIDAD_LOGISTICA, D.UNIDADES_LOGISTICAS, D.U_LOG' +
        'ISTICAS_RESERVADAS,'
      
        '       D.ORDEN, D.SU_REFERENCIA, C.DOCUMENTO_MUESTRAS, D.LISTO_P' +
        'ARA_PREPARAR, D.LOTE_SIMPLE,'
      '       (SELECT UNIDADES'
      '        FROM SYS_TIPO_UNIDAD_LOGISTICA'
      '        WHERE'
      '        TIPO = D.TIPO_UNIDAD_LOGISTICA) UNIDADES_POR_UL,'
      '       (SELECT RELACIONAR_CON_UNIDADES'
      '        FROM SYS_TIPO_UNIDAD_LOGISTICA'
      '        WHERE'
      '        TIPO = D.TIPO) RELACIONAR_CON_UNIDADES,'
      '       /*'
      '       (SELECT SUM(EXISTENCIAS)'
      
        '        FROM A_ART_DAME_STOCK_ART_ED(D.EMPRESA, D.CANAL, D.ARTIC' +
        'ULO, D.ALMACEN, 1, 0, 0, 0, 0, 0, 0, NULL)'
      '        WHERE'
      '        CANAL = D.CANAL) STOCK,'
      '       */'
      '       (SELECT FIRST (1) ID_LOTE'
      '        FROM GES_DETALLES_S_LOTES'
      '        WHERE'
      '        ID_DETALLES_S = D.ID_DETALLES_S'
      '        ORDER BY SUBLINEA) ID_LOTE,'
      '       (SELECT FIRST (1) LOTE'
      '        FROM GES_DETALLES_S_LOTES'
      '        WHERE'
      '        ID_DETALLES_S = D.ID_DETALLES_S'
      '        ORDER BY SUBLINEA) LOTE,'
      '       (SELECT COUNT(ID_LOTE)'
      '        FROM GES_DETALLES_S_LOTES'
      '        WHERE'
      '        ID_DETALLES_S = D.ID_DETALLES_S) CANT_LOTE,'
      '       (SELECT STOCK_MINIMO'
      '        FROM ART_ARTICULOS_ALMACENES_ART'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CANAL = D.CANAL AND'
      '        ALMACEN = D.ALMACEN AND'
      
        '        ARTICULO = D.ARTICULO) STOCK_MINIMO, D.PRECIO, D.ASEGURA' +
        'DO, D.PACIENTE, D.AUTORIZACION, D.POLIZA, D.FEC_REC_IH,'
      
        '       D.DECIMALES_UNIDADES, D.ALFA_1, D.ALFA_2, D.ALFA_3, D.ALF' +
        'A_4, D.ALFA_5, D.ALFA_6, D.ALFA_7, D.ALFA_8,'
      '       AM.REF_PROVEEDOR, ART.LOTES, D.U_LOGISTICAS_RESERVADAS'
      'FROM VER_DETALLE_PEDIDO D'
      'JOIN GES_CABECERAS_S_PED C ON D.ID_S = C.ID_S'
      'JOIN ART_ARTICULOS ART ON (D.ID_A = ART.ID_A)'
      
        'JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A' +
        '_M_C_T'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C'
      'JOIN ART_ARTICULOS_MODELOS AM ON AMC.ID_A_M = AM.ID_A_M'
      'WHERE'
      'D.ID_S = :OLD_ID_S AND'
      'D.ID_DETALLES_S = :OLD_ID_DETALLES_S'
      ' ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, ' +
        'D.LINEA, D.CLIENTE, D.UNIDADES, D.UNIDADES_SERVIDAS, D.PAIS,'
      
        '       D.UNIDADES_RESERVADAS, D.UNIDADES_PREPARADAS, D.SERVIDO, ' +
        'D.P_COSTE, D.ENTRADA_AGRUPACION, D.ARTICULO, D.TITULO, D.ALMACEN' +
        ', D.ENTRADA, D.MONEDA,'
      
        '       D.FECHA_REC_DET, D.ID_A, D.ID_DETALLES_S, D.TIPO_LINEA, D' +
        '.ID_S, D.ORIGEN, D.UNIDADES_PENDIENTES, D.FECHA_ENTREGA_PREV,'
      
        '       D.DIRECCION_ENTREGA, D.TIPO_UNIDAD_LOGISTICA, D.TITULO_UN' +
        'IDAD_LOGISTICA, D.UNIDADES_LOGISTICAS,'
      
        '       D.U_LOGISTICAS_RESERVADAS, D.ORDEN, D.SU_REFERENCIA, CP.D' +
        'OCUMENTO_MUESTRAS, D.LISTO_PARA_PREPARAR, D.LOTE_SIMPLE, '
      '       (SELECT UNIDADES'
      '        FROM SYS_TIPO_UNIDAD_LOGISTICA'
      '        WHERE'
      '        TIPO = D.TIPO_UNIDAD_LOGISTICA) UNIDADES_POR_UL,'
      '       (SELECT RELACIONAR_CON_UNIDADES'
      '        FROM SYS_TIPO_UNIDAD_LOGISTICA'
      '        WHERE'
      '        TIPO = D.TIPO) RELACIONAR_CON_UNIDADES,'
      '       /*'
      '       (SELECT SUM(EXISTENCIAS)'
      
        '        FROM A_ART_DAME_STOCK_ART_ED(D.EMPRESA, D.CANAL, D.ARTIC' +
        'ULO, D.ALMACEN, 1, 0, 0, 0, 0, 0, 0, NULL)'
      '        WHERE'
      '        CANAL = D.CANAL) STOCK,'
      '       */ '
      '       (SELECT FIRST (1) ID_LOTE'
      '        FROM GES_DETALLES_S_LOTES'
      '        WHERE'
      '        ID_DETALLES_S = D.ID_DETALLES_S'
      '        ORDER BY SUBLINEA) ID_LOTE,'
      '       (SELECT FIRST (1) LOTE'
      '        FROM GES_DETALLES_S_LOTES'
      '        WHERE'
      '        ID_DETALLES_S = D.ID_DETALLES_S'
      '        ORDER BY SUBLINEA) LOTE,'
      '       (SELECT COUNT(ID_LOTE)'
      '        FROM GES_DETALLES_S_LOTES'
      '        WHERE'
      '        ID_DETALLES_S = D.ID_DETALLES_S) CANT_LOTE,'
      '       (SELECT STOCK_MINIMO'
      '        FROM ART_ARTICULOS_ALMACENES_ART'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CANAL = D.CANAL AND'
      '        ALMACEN = D.ALMACEN AND'
      '        ARTICULO = D.ARTICULO) STOCK_MINIMO,'
      
        '        D.PRECIO, D.ASEGURADO, D.PACIENTE, D.AUTORIZACION, D.POL' +
        'IZA, D.FEC_REC_IH,'
      
        '        D.DECIMALES_UNIDADES, D.ALFA_1, D.ALFA_2, D.ALFA_3, D.AL' +
        'FA_4, D.ALFA_5, D.ALFA_6, D.ALFA_7, D.ALFA_8,'
      '       AM.REF_PROVEEDOR, ART.LOTES, C.PEDIDO_CLIENTE'
      'FROM VER_DETALLE_PEDIDO D'
      'JOIN GES_CABECERAS_S_PED CP ON D.ID_S = CP.ID_S'
      'JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      'JOIN ART_ARTICULOS ART ON D.ID_A = ART.ID_A'
      
        'JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON ART.ID_A_M_C_T = AMCT.ID_A' +
        '_M_C_T'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AMCT.ID_A_M_C = AMC.ID_A_M_C'
      'JOIN ART_ARTICULOS_MODELOS AM ON AMC.ID_A_M = AM.ID_A_M'
      'WHERE'
      '(D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO <= :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.SERIE = :SERIE AND'
      'D.TIPO = '#39'PEC'#39' AND'
      'D.CLIENTE = :CLIENTE AND'
      'D.ESTADO = 0'
      '/* Agregamos los filtros que correspondan'
      'IF (PEDIDODESDE > 0) THEN'
      '    AND D.RIG >= :PEDIDODESDE'
      '    AND D.RIG <= :PEDIDOHASTA;'
      'IF (PAIS > '#39') THEN'
      '    AND D.PAIS = :PAIS'
      'IF (ARTICULO > '#39') THEN'
      '    AND D.ARTICULO STARTING WITH :ARTICULO'
      'IF (DIR > 0) THEN'
      '    AND D.DIRECCION_ENTREGA = :DIR;'
      'IF (SERVIDO = 0) THEN'
      '    AND D.SERVIDO = 0'
      '*/'
      
        '-- Esto es para poder seguir viendo lo marcado a pesar de que es' +
        'te servido, si lo he marcado con mi entrada'
      ') OR (EMPRESA = :EMPRESA AND'
      'D.EJERCICIO <= :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.SERIE = :SERIE AND'
      'D.TIPO = '#39'PEC'#39' AND'
      'D.CLIENTE = :CLIENTE AND'
      'D.ESTADO = 0 AND'
      'D.ENTRADA_AGRUPACION = :ENTRADA)'
      
        '/* dji lrk kri - mirko lo quiere ordenado por direccion de entre' +
        'ga'
      'IF (DMMAIN.ESTADOKRI(205) = 1) THEN'
      '    ORDER BY DIRECCION_ENTREGA, EJERCICIO, RIG, ORDEN'#39')'
      'ELSE'
      '*/'
      'ORDER BY D.EJERCICIO, D.RIG, D.ORDEN'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_PEDIDO'
      'SET'
      '  UNIDADES_RESERVADAS=?UNIDADES_RESERVADAS'
      '  ,U_LOGISTICAS_RESERVADAS=?U_LOGISTICAS_RESERVADAS'
      '  ,UNIDADES_PREPARADAS=?UNIDADES_PREPARADAS'
      '  ,SERVIDO=?SERVIDO '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE'
      'WHERE'
      'ID_S = ?old_ID_S AND'
      'ID_DETALLES_S = ?old_ID_DETALLES_S')
    AutoCalcFields = False
    DataSource = DSxClientes
    AfterPost = QMDetalleAfterPost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_PEDIDO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Can.'
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
      DisplayLabel = 'Ped.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Pedidas'
      FieldName = 'UNIDADES'
      OnGetText = QMDetalleUNIDADESGetText
    end
    object QMDetalleUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
      OnGetText = QMDetalleUNIDADES_SERVIDASGetText
    end
    object QMDetalleUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Enviadas'
      FieldName = 'UNIDADES_RESERVADAS'
      OnChange = QMDetalleUNIDADES_RESERVADASChange
      OnGetText = QMDetalleUNIDADES_RESERVADASGetText
    end
    object QMDetalleSERVIDO: TIntegerField
      DisplayLabel = 'Serv.'
      FieldName = 'SERVIDO'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_AGRUPACION'
      OnChange = QMDetalleENTRADA_AGRUPACIONChange
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
      OnGetText = QMDetalleUNIDADES_PENDIENTESGetText
    end
    object QMDetalleFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Doc. Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fecha Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_S'
    end
    object QMDetalleORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetalleBARRAS: TStringField
      DisplayLabel = 'Cod. Barras'
      FieldKind = fkCalculated
      FieldName = 'BARRAS'
      OnGetText = QMDetalleBARRASGetText
      Size = 15
      Calculated = True
    end
    object QMDetalleDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMDetallePAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
    end
    object QMDetalleSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK'
      OnGetText = QMDetalleSTOCKGetText
      Calculated = True
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo Ud. Log.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Unidad. Log.'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetalleUNIDADES_POR_UL: TFloatField
      DisplayLabel = 'Uds x U.L.'
      FieldName = 'UNIDADES_POR_UL'
    end
    object QMDetalleRELACIONAR_CON_UNIDADES: TIntegerField
      DisplayLabel = 'Rel. U.L.'
      FieldName = 'RELACIONAR_CON_UNIDADES'
    end
    object QMDetalleU_LOGISTICAS_RESERVADAS: TFloatField
      DisplayLabel = 'Env. U.L.'
      FieldName = 'U_LOGISTICAS_RESERVADAS'
      ProviderFlags = []
      OnChange = QMDetalleU_LOGISTICAS_RESERVADASChange
      OnGetText = QMDetalleU_LOGISTICAS_RESERVADASGetText
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnGetText = QMDetalleLOTEGetText
    end
    object QMDetalleCANT_LOTE: TIntegerField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
      OnGetText = QMDetalleCANT_LOTEGetText
    end
    object QMDetalleSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
      OnGetText = QMDetalleSTOCK_MINIMOGetText
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleUNIDADES_PREPARADAS: TFloatField
      DisplayLabel = 'Preparadas'
      FieldName = 'UNIDADES_PREPARADAS'
      OnGetText = QMDetalleUNIDADES_PREPARADASGetText
    end
    object QMDetalleSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMDetalleASEGURADO: TFIBStringField
      DisplayLabel = 'Asegurado'
      FieldName = 'ASEGURADO'
      Size = 25
    end
    object QMDetallePACIENTE: TFIBStringField
      DisplayLabel = 'Paciente'
      FieldName = 'PACIENTE'
      Size = 25
    end
    object QMDetalleAUTORIZACION: TFIBStringField
      DisplayLabel = 'Autorizaci'#243'n'
      FieldName = 'AUTORIZACION'
    end
    object QMDetallePOLIZA: TFIBStringField
      DisplayLabel = 'Poliza'
      FieldName = 'POLIZA'
    end
    object QMDetalleFEC_REC_IH: TDateTimeField
      DisplayLabel = 'Fec. Rec. IH'
      FieldName = 'FEC_REC_IH'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleDOCUMENTO_MUESTRAS: TIntegerField
      DisplayLabel = 'Muestras'
      FieldName = 'DOCUMENTO_MUESTRAS'
    end
    object QMDetalleDECIMALES_UNIDADES: TIntegerField
      DisplayLabel = 'Decimales Uds.'
      FieldName = 'DECIMALES_UNIDADES'
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
    object QMDetalleREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QMDetalleLOTES: TIntegerField
      DisplayLabel = 'Control Lote'
      FieldName = 'LOTES'
    end
    object QMDetalleLISTO_PARA_PREPARAR: TIntegerField
      DisplayLabel = 'Listo p/Preparacion'
      FieldName = 'LISTO_PARA_PREPARAR'
    end
    object QMDetallePEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido Cli.'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote Simple'
      FieldName = 'LOTE_SIMPLE'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 104
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
    AfterOpen = xClientesAfterOpen
    Left = 40
    Top = 56
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
    Left = 128
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object EBusca: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 472
    Top = 16
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 40
    Top = 200
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT EJERCICIODEV AS EJERCICIO, CANALDEV AS CANAL,'
      'SERIEDEV AS SERIE, RIG, ID_S, DIRECCION'
      'FROM G_TRASPASO_PED_CLI_RECORRE'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ENTRADA)')
    UniDirectional = True
    Left = 40
    Top = 248
  end
  object xProcesar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM TMP_FACTURA_PEDIDOS'
      'WHERE ENTRADA = ?ENTRADA')
    UniDirectional = True
    Left = 128
    Top = 248
  end
  object xPortes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from con_cuentas_ges_portes'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and tipo=?tipo')
    UniDirectional = False
    Left = 40
    Top = 392
    object xPortesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxPortes: TDataSource
    DataSet = xPortes
    Left = 128
    Top = 392
  end
  object xRangos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos '
      'where empresa=?empresa and rango=?rango')
    UniDirectional = False
    Left = 40
    Top = 296
    object xRangosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRangos: TDataSource
    DataSet = xRangos
    Left = 128
    Top = 296
  end
  object xIndices: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos_indices'
      'where empresa=?empresa and rango=?rango and'
      'indice=?indice')
    UniDirectional = False
    Left = 40
    Top = 344
    object xIndicesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxIndices: TDataSource
    DataSet = xIndices
    Left = 128
    Top = 344
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_canales_activos'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    Left = 40
    Top = 440
    object xCanalesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCanales: TDataSource
    DataSet = xCanales
    Left = 128
    Top = 440
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      'FROM GES_CABECERAS_S C'
      
        'JOIN TMP_PROCESOS_AUTO T ON C.EMPRESA = T.EMPRESA AND C.EJERCICI' +
        'O = T.EJERCICIO AND C.CANAL = T.CANAL AND C.SERIE = T.SERIE AND ' +
        'C.TIPO = T.TIPO AND C.RIG = T.RIG'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.TIPO = :TIPO AND'
      'T.CONTADOR = :CONTADOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG')
    UniDirectional = False
    Left = 40
    Top = 152
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 128
    Top = 152
  end
  object xFacturados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT DISTINCT(ARTICULO) FROM GES_DETALLES_S D '
      'JOIN GES_CABECERAS_S C ON (D.ID_S = C.ID_S)'
      'WHERE '
      'C.EMPRESA = ?EMPRESA AND '
      'C.EJERCICIO = ?EJERCICIO AND '
      'C.PROCESO_AUTO = ?PROCESO_AUTO')
    UniDirectional = True
    Left = 128
    Top = 200
    object xFacturadosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
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
    Left = 128
    Top = 8
  end
  object DSQMCabeceraPre: TDataSource
    DataSet = QMCabeceraPre
    Left = 344
    Top = 152
  end
  object DSQMDetallePre: TDataSource
    DataSet = QMDetallePre
    Left = 344
    Top = 200
  end
  object QMCabeceraPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_PRE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_PRE'
      
        '  (ESTADO,RESPONSABLE,ID_EMPLEADO,EMPRESA,HOJA,CLIENTE,FECHA_INI' +
        'CIO,FECHA_FIN,COMENTARIO,TOTAL_UNIDADES_LOGISTICAS,TOTAL_UNIDADE' +
        'S,DIRECCION,ID,GENERAR_ALBARAN)'
      'VALUES'
      
        '  (?ESTADO,?RESPONSABLE,?ID_EMPLEADO,?EMPRESA,?HOJA,?CLIENTE,?FE' +
        'CHA_INICIO,?FECHA_FIN,?COMENTARIO,?TOTAL_UNIDADES_LOGISTICAS,?TO' +
        'TAL_UNIDADES,?DIRECCION,?ID,?GENERAR_ALBARAN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_PRE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_PRE'
      'WHERE '
      'EMPRESA = ?EMPRESA  AND'
      'CLIENTE   =  ?CLIENTE AND'
      'ESTADO = 3'
      'ORDER BY HOJA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_PRE'
      'SET'
      '  GENERAR_ALBARAN=?GENERAR_ALBARAN, '
      '  ESTADO=?ESTADO'
      'WHERE'
      '  ID=?ID ')
    AfterOpen = QMCabeceraPreAfterOpen
    BeforeClose = QMCabeceraPreBeforeClose
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_PRE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 232
    Top = 152
    object QMCabeceraPreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraPreHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMCabeceraPreCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraPreFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMCabeceraPreFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMCabeceraPreCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMCabeceraPreTOTAL_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Tot. Uds. Log.'
      FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
    end
    object QMCabeceraPreTOTAL_UNIDADES: TFloatField
      DisplayLabel = 'Tot. Uds.'
      FieldName = 'TOTAL_UNIDADES'
    end
    object QMCabeceraPreDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraPreID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCabeceraPreESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraPreRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCabeceraPreID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMCabeceraPreGENERAR_ALBARAN: TIntegerField
      DisplayLabel = 'Genera Alb.'
      FieldName = 'GENERAR_ALBARAN'
    end
  end
  object QMDetallePre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_PRE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_PRE'
      
        '  (EMPRESA,HOJA,LINEA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA_PED,A' +
        'LMACEN,ARTICULO,UNIDADES_PED,TIPO_UNIDAD_LOGISTICA,UNIDADES_LOGI' +
        'STICAS,UNIDADES,PICO,PUNTOS,PESO,PREPARACION,ID,ID_HOJA,ID_S,ID_' +
        'DETALLES_S,ID_A)'
      'VALUES'
      
        '  (?EMPRESA,?HOJA,?LINEA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LI' +
        'NEA_PED,?ALMACEN,?ARTICULO,?UNIDADES_PED,?TIPO_UNIDAD_LOGISTICA,' +
        '?UNIDADES_LOGISTICAS,?UNIDADES,?PICO,?PUNTOS,?PESO,?PREPARACION,' +
        '?ID,?ID_HOJA,?ID_S,?ID_DETALLES_S,?ID_A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S_PRE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_PRE'
      'WHERE ID_HOJA=?ID'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PRE'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,LINEA=?LINEA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,UNIDADES_PED=?UNIDADES_PED '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,UNIDADES=?UNIDADES '
      '  ,PICO=?PICO '
      '  ,PUNTOS=?PUNTOS '
      '  ,PESO=?PESO '
      '  ,PREPARACION=?PREPARACION '
      '  ,ID_HOJA=?ID_HOJA '
      '  ,ID_S=?ID_S '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_A=?ID_A '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabeceraPre
    AfterOpen = QMDetallePreAfterOpen
    BeforeClose = QMDetallePreBeforeClose
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_PRE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 232
    Top = 200
    object QMDetallePreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallePreHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetallePreLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallePreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDetallePreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetallePreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallePreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallePreLINEA_PED: TIntegerField
      DisplayLabel = 'Lin. Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMDetallePreALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetallePreARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetallePreUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNIDADES_PED'
    end
    object QMDetallePreTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.L.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetallePreUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetallePreUNIDADES: TFloatField
      DisplayLabel = 'Uds'
      FieldName = 'UNIDADES'
    end
    object QMDetallePrePICO: TFloatField
      DisplayLabel = 'Pico'
      FieldName = 'PICO'
    end
    object QMDetallePrePUNTOS: TFloatField
      DisplayLabel = 'Puntos'
      FieldName = 'PUNTOS'
    end
    object QMDetallePrePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePrePREPARACION: TIntegerField
      DisplayLabel = 'Preparacion'
      FieldName = 'PREPARACION'
    end
    object QMDetallePreID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetallePreID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetallePreID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetallePreID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetallePreID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetallePreUNIDADES_A_SERVIR: TFloatField
      DisplayLabel = 'Uds. a Servir'
      FieldName = 'UNIDADES_A_SERVIR'
    end
  end
  object QMCabeceraAlbaran: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT C.*'
      'FROM GES_CABECERAS_S C'
      
        'JOIN TMP_PROCESOS_AUTO T ON C.EMPRESA = T.EMPRESA AND C.EJERCICI' +
        'O = T.EJERCICIO AND C.CANAL = T.CANAL AND C.SERIE = T.SERIE AND ' +
        'C.TIPO = T.TIPO AND C.RIG = T.RIG'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      '-- C.SERIE = :SERIE AND'
      'C.TIPO = '#39'ALB'#39' AND'
      'T.CONTADOR = :PROC_AUTO'
      'ORDER BY C.SERIE, C.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMCabeceraAlbaranAfterOpen
    BeforeClose = QMCabeceraAlbaranBeforeClose
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_ALBARAN'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 232
    Top = 296
    object QMCabeceraAlbaranEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraAlbaranEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraAlbaranCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraAlbaranSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraAlbaranTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraAlbaranRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraAlbaranALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabeceraAlbaranMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCabeceraAlbaranFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraAlbaranCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraAlbaranTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraAlbaranDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraAlbaranSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabeceraAlbaranFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabeceraAlbaranCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMCabeceraAlbaranNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraAlbaranESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraAlbaranBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCabeceraAlbaranLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMCabeceraAlbaranBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMCabeceraAlbaranI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabeceraAlbaranS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMCabeceraAlbaranM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMCabeceraAlbaranC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object QMCabeceraAlbaranAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCabeceraAlbaranS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabeceraAlbaranS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraAlbaranDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object QMCabeceraAlbaranDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraAlbaranB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMCabeceraAlbaranI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMCabeceraAlbaranPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraAlbaranI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraAlbaranLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraAlbaranENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraAlbaranPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Autom.'
      FieldName = 'PROCESO_AUTO'
    end
    object QMCabeceraAlbaranI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraAlbaranI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabeceraAlbaranPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCabeceraAlbaranI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Can.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object QMCabeceraAlbaranS_BASES_CANAL: TFloatField
      DisplayLabel = 'S. Bases Can.'
      FieldName = 'S_BASES_CANAL'
    end
    object QMCabeceraAlbaranS_CUOTA_IVA_CANAL: TFloatField
      DisplayLabel = 'S. Cuota IVA Can.'
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object QMCabeceraAlbaranS_CUOTA_RE_CANAL: TFloatField
      DisplayLabel = 'S. Cuota Ret. Can.'
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object QMCabeceraAlbaranLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMCabeceraAlbaranCHG_MONEDA: TIntegerField
      DisplayLabel = 'Chg. Mon.'
      FieldName = 'CHG_MONEDA'
    end
    object QMCabeceraAlbaranTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMCabeceraAlbaranB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraAlbaranID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCabeceraAlbaranCLIENTE_EDI: TFIBStringField
      DisplayLabel = 'Cliente EDI'
      FieldName = 'CLIENTE_EDI'
      Size = 17
    end
    object QMCabeceraAlbaranCOMPRADOR: TFIBStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Size = 17
    end
    object QMCabeceraAlbaranVENDEDOR: TFIBStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Size = 17
    end
    object QMCabeceraAlbaranDPTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DPTO'
      Size = 17
    end
    object QMCabeceraAlbaranRECEPTOR: TFIBStringField
      DisplayLabel = 'Receptor'
      FieldName = 'RECEPTOR'
      Size = 17
    end
    object QMCabeceraAlbaranMUELLE: TFIBStringField
      DisplayLabel = 'Muelle'
      FieldName = 'MUELLE'
      Size = 17
    end
    object QMCabeceraAlbaranPAGADOR: TFIBStringField
      DisplayLabel = 'Pagador'
      FieldName = 'PAGADOR'
      Size = 17
    end
    object QMCabeceraAlbaranRECOGIDA: TFIBStringField
      DisplayLabel = 'Recogida'
      FieldName = 'RECOGIDA'
      Size = 17
    end
    object QMCabeceraAlbaranDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 17
    end
    object QMCabeceraAlbaranMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Modif. Doc.'
      FieldName = 'MODIFICA_DOC'
    end
    object QMCabeceraAlbaranCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Comision Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMCabeceraAlbaranI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMCabeceraAlbaranFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMCabeceraAlbaranIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraAlbaranENVIO: TIntegerField
      DisplayLabel = 'Envio'
      FieldName = 'ENVIO'
    end
    object QMCabeceraAlbaranUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMCabeceraAlbaranCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object QMCabeceraAlbaranMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMCabeceraAlbaranADJUNTO: TFIBStringField
      DisplayLabel = 'Adjunto'
      FieldName = 'ADJUNTO'
      Size = 200
    end
    object QMCabeceraAlbaranNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Internas'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMCabeceraAlbaranTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMCabeceraAlbaranI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object QMCabeceraAlbaranPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMCabeceraAlbaranTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object QMCabeceraAlbaranI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMCabeceraAlbaranRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object QMCabeceraAlbaranINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
    end
    object QMCabeceraAlbaranCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object QMCabeceraAlbaranVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object QMCabeceraAlbaranPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMCabeceraAlbaranFECHA_CREACION_KRI: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION_KRI'
    end
    object QMCabeceraAlbaranPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cli.'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMCabeceraAlbaranZ_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'Z_CONTACTO'
    end
    object QMCabeceraAlbaranZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMCabeceraAlbaranCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMCabeceraAlbaranENTRADA1: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA1'
    end
    object QMCabeceraAlbaranEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object QMCabeceraAlbaranEJERCICIO1: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO1'
    end
    object QMCabeceraAlbaranCANAL1: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL1'
    end
    object QMCabeceraAlbaranSERIE1: TFIBStringField
      DisplayLabel = 'Serie 1'
      FieldName = 'SERIE1'
      Size = 10
    end
    object QMCabeceraAlbaranTIPO1: TFIBStringField
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO1'
      Size = 3
    end
    object QMCabeceraAlbaranRIG1: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG1'
    end
  end
  object DSQMCabeceraAlbaran: TDataSource
    DataSet = QMCabeceraAlbaran
    Left = 344
    Top = 296
  end
  object QMDetalleAlbaran: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S'
      
        '  (NOTAS2,I_COMISION_LINEAL,COMISION_LINEAL,UNIDADES_SEC,UNIDADE' +
        'S_EXT,I_DTO_CIAL,I_DTO_PP,NOTAS,B_IMPONIBLE,I_DESCUENTO,B_COMISI' +
        'ON,BRUTO,P_COSTE,PRECIO,UNIDADES,I_COMISION,B_COMISION_CANAL,TIP' +
        'O_LINEA_KRI,PROYECTO,ID_P,ORIGEN,ORDEN,ID_A,ID_C_A,ID_MOV_STOCKS' +
        ',ID_DETALLES_S,ID_S,ENTRADA,M_MOV_STOCK,RIG,SERIE,ID_D_S_GR,ID_A' +
        '_M_C_T,LINEA,LINEA_RELACION,CERT_NEGATIVO,CERTIFICADO,PROC_PROMO' +
        'CION,APLICA_UNIDADES_SECUNDARIAS,EJER_MOV,DTO_CIAL,DTO_PP,CANAL,' +
        'P_RECARGO,P_IVA,TIPO_IVA,COMISION,DESCUENTO,BULTOS,PIEZAS_X_BULT' +
        'O,TITULO,EJERCICIO,EMPRESA,IVA_INCLUIDO,DESCUENTO_2,DESCUENTO_3,' +
        'TITULO_IDIOMA,MARGEN_KRI,PRO_NUM_PLANO,TIPO_LINEA,NO_FABRICACION' +
        '_KRI,PAIS,ARTICULO,ALMACEN,TIPO,NSERIE,CRC_NOTAS2,CRC_NOTAS)'
      'VALUES'
      
        '  (?NOTAS2,?I_COMISION_LINEAL,?COMISION_LINEAL,?UNIDADES_SEC,?UN' +
        'IDADES_EXT,?I_DTO_CIAL,?I_DTO_PP,?NOTAS,?B_IMPONIBLE,?I_DESCUENT' +
        'O,?B_COMISION,?BRUTO,?P_COSTE,?PRECIO,?UNIDADES,?I_COMISION,?B_C' +
        'OMISION_CANAL,?TIPO_LINEA_KRI,?PROYECTO,?ID_P,?ORIGEN,?ORDEN,?ID' +
        '_A,?ID_C_A,?ID_MOV_STOCKS,?ID_DETALLES_S,?ID_S,?ENTRADA,?M_MOV_S' +
        'TOCK,?RIG,?SERIE,?ID_D_S_GR,?ID_A_M_C_T,?LINEA,?LINEA_RELACION,?' +
        'CERT_NEGATIVO,?CERTIFICADO,?PROC_PROMOCION,?APLICA_UNIDADES_SECU' +
        'NDARIAS,?EJER_MOV,?DTO_CIAL,?DTO_PP,?CANAL,?P_RECARGO,?P_IVA,?TI' +
        'PO_IVA,?COMISION,?DESCUENTO,?BULTOS,?PIEZAS_X_BULTO,?TITULO,?EJE' +
        'RCICIO,?EMPRESA,?IVA_INCLUIDO,?DESCUENTO_2,?DESCUENTO_3,?TITULO_' +
        'IDIOMA,?MARGEN_KRI,?PRO_NUM_PLANO,?TIPO_LINEA,?NO_FABRICACION_KR' +
        'I,?PAIS,?ARTICULO,?ALMACEN,?TIPO,?NSERIE,?CRC_NOTAS2,?CRC_NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S'
      'SET'
      '  NOTAS2=?NOTAS2 '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,NOTAS=?NOTAS '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_COMISION=?B_COMISION '
      '  ,BRUTO=?BRUTO '
      '  ,P_COSTE=?P_COSTE '
      '  ,PRECIO=?PRECIO '
      '  ,UNIDADES=?UNIDADES '
      '  ,I_COMISION=?I_COMISION '
      '  ,B_COMISION_CANAL=?B_COMISION_CANAL '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,PROYECTO=?PROYECTO '
      '  ,ID_P=?ID_P '
      '  ,ORIGEN=?ORIGEN '
      '  ,ORDEN=?ORDEN '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_MOV_STOCKS=?ID_MOV_STOCKS '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_S=?ID_S '
      '  ,ENTRADA=?ENTRADA '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,ID_D_S_GR=?ID_D_S_GR '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,CERT_NEGATIVO=?CERT_NEGATIVO '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,EJER_MOV=?EJER_MOV '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,DTO_PP=?DTO_PP '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,P_IVA=?P_IVA '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,COMISION=?COMISION '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,BULTOS=?BULTOS '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,TITULO=?TITULO '
      '  ,IVA_INCLUIDO=?IVA_INCLUIDO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,PAIS=?PAIS '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN=?ALMACEN '
      '  ,NSERIE=?NSERIE '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMCabeceraAlbaran
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 232
    Top = 344
    object QMDetalleAlbaranEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleAlbaranEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleAlbaranCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleAlbaranSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleAlbaranTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleAlbaranRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleAlbaranLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleAlbaranALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleAlbaranARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleAlbaranTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleAlbaranUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetalleAlbaranPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleAlbaranPIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object QMDetalleAlbaranBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMDetalleAlbaranDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleAlbaranDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleAlbaranDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleAlbaranCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMDetalleAlbaranP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleAlbaranM_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetalleAlbaranPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleAlbaranTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetalleAlbaranP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleAlbaranP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleAlbaranBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleAlbaranB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMDetalleAlbaranDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object QMDetalleAlbaranDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMDetalleAlbaranI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMDetalleAlbaranI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMDetalleAlbaranI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Descuento'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleAlbaranB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleAlbaranB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleAlbaranI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMDetalleAlbaranC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleAlbaranC_RECARGO: TFloatField
      DisplayLabel = 'Cuota Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleAlbaranT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleAlbaranM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleAlbaranLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleAlbaranENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDetalleAlbaranNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleAlbaranUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMDetalleAlbaranIVA_INCLUIDO: TIntegerField
      DisplayLabel = 'IVA Inc.'
      FieldName = 'IVA_INCLUIDO'
    end
    object QMDetalleAlbaranNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleAlbaranB_COMISION_CANAL: TFloatField
      DisplayLabel = 'B. Com. Can.'
      FieldName = 'B_COMISION_CANAL'
    end
    object QMDetalleAlbaranEJER_MOV: TIntegerField
      DisplayLabel = 'Ejer. Mov.'
      FieldName = 'EJER_MOV'
    end
    object QMDetalleAlbaranUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMDetalleAlbaranNO_FABRICACION_KRI: TFIBStringField
      DisplayLabel = 'Nro. Fab.'
      FieldName = 'NO_FABRICACION_KRI'
      Size = 15
    end
    object QMDetalleAlbaranID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetalleAlbaranID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleAlbaranID_D_S_GR: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_GR'
    end
    object QMDetalleAlbaranID_A_M_C_T: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C_T'
    end
    object QMDetalleAlbaranID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleAlbaranID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleAlbaranID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object QMDetalleAlbaranCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Comision Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleAlbaranI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleAlbaranTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_IDIOMA'
      Size = 256
    end
    object QMDetalleAlbaranMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMDetalleAlbaranTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMDetalleAlbaranORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleAlbaranTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetalleAlbaranORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetalleAlbaranPROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object QMDetalleAlbaranID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMDetalleAlbaranAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetalleAlbaranPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleAlbaranCERTIFICADO: TIntegerField
      DisplayLabel = 'Num. Certificado'
      FieldName = 'CERTIFICADO'
    end
    object QMDetalleAlbaranCERT_NEGATIVO: TIntegerField
      DisplayLabel = 'Cert. Neg.'
      FieldName = 'CERT_NEGATIVO'
    end
    object QMDetalleAlbaranLINEA_RELACION: TIntegerField
      DisplayLabel = 'Linea Rel.'
      FieldName = 'LINEA_RELACION'
    end
    object QMDetalleAlbaranNOTAS2: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleAlbaranCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleAlbaranCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object QMDetalleAlbaranPRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Nro. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
  end
  object DSQMDetalleAlbaran: TDataSource
    DataSet = QMDetalleAlbaran
    Left = 344
    Top = 344
  end
  object DSQMDetallePreUbicaciones: TDataSource
    DataSet = QMDetallePreUbicaciones
    Left = 344
    Top = 248
  end
  object QMDetallePreUbicaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_PRE_UBICACIONES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_PRE_UBICACIONES'
      
        '  (EMPRESA,HOJA,LINEA,LINEA_UBICACION,UNIDADES,ALMACEN,CALLE,EST' +
        'ANTERIA,REPISA,POSICION,VOLUMEN,PESO,DIAMETRO,ID,ID_HOJA,ID_HOJA' +
        '_DET,ID_A,ID_DETALLES_S,ID_UBICACION,ID_A_UBICACION,ID_D_S_UBICA' +
        'CION,LOTE)'
      'VALUES'
      
        '  (?EMPRESA,?HOJA,?LINEA,?LINEA_UBICACION,?UNIDADES,?ALMACEN,?CA' +
        'LLE,?ESTANTERIA,?REPISA,?POSICION,?VOLUMEN,?PESO,?DIAMETRO,?ID,?' +
        'ID_HOJA,?ID_HOJA_DET,?ID_A,?ID_DETALLES_S,?ID_UBICACION,?ID_A_UB' +
        'ICACION,?ID_D_S_UBICACION,?LOTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S_PRE_UBICACIONES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_PRE_UBICACIONES'
      'WHERE'
      'ID_HOJA_DET=?ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PRE_UBICACIONES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,LINEA=?LINEA '
      '  ,LINEA_UBICACION=?LINEA_UBICACION '
      '  ,UNIDADES=?UNIDADES '
      '  ,ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,PESO=?PESO '
      '  ,DIAMETRO=?DIAMETRO '
      '  ,ID_HOJA=?ID_HOJA '
      '  ,ID_HOJA_DET=?ID_HOJA_DET '
      '  ,ID_A=?ID_A '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_A_UBICACION=?ID_A_UBICACION '
      '  ,ID_D_S_UBICACION=?ID_D_S_UBICACION '
      '  ,LOTE=?LOTE '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMDetallePre
    AfterOpen = QMDetallePreUbicacionesAfterOpen
    BeforeClose = QMDetallePreUbicacionesBeforeClose
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_PRE_UBICACIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 232
    Top = 248
    object QMDetallePreUbicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallePreUbicacionesHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetallePreUbicacionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallePreUbicacionesLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDetallePreUbicacionesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetallePreUbicacionesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetallePreUbicacionesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetallePreUbicacionesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetallePreUbicacionesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetallePreUbicacionesPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetallePreUbicacionesVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDetallePreUbicacionesPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePreUbicacionesDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDetallePreUbicacionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetallePreUbicacionesID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetallePreUbicacionesID_HOJA_DET: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA_DET'
    end
    object QMDetallePreUbicacionesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetallePreUbicacionesID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetallePreUbicacionesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMDetallePreUbicacionesID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetallePreUbicacionesID_D_S_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_UBICACION'
    end
    object QMDetallePreUbicacionesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMDetallePreUbicacionesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
  end
  object xRecorreCabHojas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_PRE'
      'WHERE '
      'EMPRESA = ?EMPRESA  AND'
      'CLIENTE   =  ?CLIENTE AND'
      'ESTADO = 3 and generar_albaran=1'
      'ORDER BY HOJA'
      ''
      
        '/*select cab.generar_albaran,pre.*, ped.servido from ges_cabecer' +
        'as_s_pre cab'
      'left join ges_detalles_s_pre pre on (cab.id=pre.id_hoja)'
      
        'left join ges_detalles_s_ped ped on (pre.id_detalles_s=ped.id_de' +
        'talles_s)'
      
        'where cab.empresa=?empresa and cab.cliente=?cliente and cab.esta' +
        'do=3 and cab.generar_albaran=1'
      'order by cab.hoja'
      '*/')
    UniDirectional = True
    DataSource = DSQMCabeceraPre
    AfterOpen = xRecorreCabHojasAfterOpen
    Left = 232
    Top = 56
    object xRecorreCabHojasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecorreCabHojasHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object xRecorreCabHojasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xRecorreCabHojasFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xRecorreCabHojasFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object xRecorreCabHojasCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object xRecorreCabHojasTOTAL_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Total Uds. Log.'
      FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
    end
    object xRecorreCabHojasTOTAL_UNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'TOTAL_UNIDADES'
    end
    object xRecorreCabHojasDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xRecorreCabHojasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xRecorreCabHojasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xRecorreCabHojasRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xRecorreCabHojasID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xRecorreCabHojasGENERAR_ALBARAN: TIntegerField
      DisplayLabel = 'Generar Alb.'
      FieldName = 'GENERAR_ALBARAN'
    end
  end
  object DsxRecorreCabHojas: TDataSource
    DataSet = xRecorreCabHojas
    Left = 344
    Top = 56
  end
  object xRecorreDetHoja: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT pre.*, ped.servido FROM GES_DETALLES_S_PRE pre'
      
        'left join ges_detalles_s_ped ped on (pre.id_detalles_s=ped.id_de' +
        'talles_s)'
      'WHERE pre.ID_HOJA=?ID'
      'ORDER BY pre.LINEA'
      ''
      '/*select pre.*, ped.servido from ges_detalles_s_pre pre'
      
        'left join ges_detalles_s_ped ped on (pre.id_detalles_s=ped.id_de' +
        'talles_s)'
      'where pre.id=?id_det'
      '*/')
    UniDirectional = True
    DataSource = DsxRecorreCabHojas
    Left = 232
    Top = 104
    object xRecorreDetHojaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecorreDetHojaHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object xRecorreDetHojaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRecorreDetHojaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecorreDetHojaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecorreDetHojaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xRecorreDetHojaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRecorreDetHojaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xRecorreDetHojaLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object xRecorreDetHojaALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xRecorreDetHojaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xRecorreDetHojaUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNIDADES_PED'
    end
    object xRecorreDetHojaTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object xRecorreDetHojaUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object xRecorreDetHojaUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xRecorreDetHojaPICO: TFloatField
      DisplayLabel = 'Pico'
      FieldName = 'PICO'
    end
    object xRecorreDetHojaPUNTOS: TFloatField
      DisplayLabel = 'Puntos'
      FieldName = 'PUNTOS'
    end
    object xRecorreDetHojaPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xRecorreDetHojaPREPARACION: TIntegerField
      DisplayLabel = 'Preparacion'
      FieldName = 'PREPARACION'
    end
    object xRecorreDetHojaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xRecorreDetHojaID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object xRecorreDetHojaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xRecorreDetHojaID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xRecorreDetHojaID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xRecorreDetHojaUNIDADES_A_SERVIR: TFloatField
      DisplayLabel = 'Uds. a Servir'
      FieldName = 'UNIDADES_A_SERVIR'
    end
    object xRecorreDetHojaSERVIDO: TIntegerField
      DisplayLabel = 'Serv.'
      FieldName = 'SERVIDO'
    end
  end
  object DSxRecorreDetHojas: TDataSource
    DataSet = xRecorreDetHoja
    Left = 344
    Top = 104
  end
  object xLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_LOTES'
      'WHERE '
      'ID_LOTE=?ID_LOTE')
    UniDirectional = False
    DataSource = DSQMDetallePreUbicaciones
    Left = 232
    Top = 392
    object xLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLoteALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLoteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLoteCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xLoteF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object xLoteF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xLoteF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object xLoteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xLoteAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object xLoteCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xLotePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xLoteID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xLoteNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object xUnidadesMarcadas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      'sum(UNIDADES) as UNIDADES, '
      'sum(UNIDADES_SERVIDAS) as UNIDADES_SERVIDAS, '
      'sum(UNIDADES_RESERVADAS) as UNIDADES_RESERVADAS, '
      'sum(UNIDADES_PENDIENTES) as UNIDADES_PENDIENTES'
      'FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '('
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO<=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'SERIE=?SERIE AND '
      'TIPO='#39'PEC'#39' AND '
      '/*CLIENTE=?CLIENTE AND*/ '
      'ESTADO <> 5 AND '
      'ENTRADA_AGRUPACION = ?ENTRADA'
      ')')
    UniDirectional = False
    Left = 40
    Top = 488
    object xUnidadesMarcadasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xUnidadesMarcadasUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object xUnidadesMarcadasUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reservadas'
      FieldName = 'UNIDADES_RESERVADAS'
    end
    object xUnidadesMarcadasUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pendientes'
      FieldName = 'UNIDADES_PENDIENTES'
    end
  end
  object DSxUnidadesMarcadas: TDataSource
    DataSet = xUnidadesMarcadas
    Left = 128
    Top = 488
  end
end
