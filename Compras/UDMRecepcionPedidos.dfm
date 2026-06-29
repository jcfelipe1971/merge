object DMRecepcionPedidos: TDMRecepcionPedidos
  OldCreateOrder = False
  OnCreate = DMRecepcionPedidosCreate
  OnDestroy = DataModuleDestroy
  Left = 325
  Top = 214
  Height = 280
  Width = 441
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_PEDIDO_RECEP'
      'WHERE'
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_PEDIDO_RECEP'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ALMACEN,ARTICULO' +
        ',TITULO,UNIDADES,UNIDADES_ORIGINALES,UNIDADES_SERVIDAS,UNIDADES_' +
        'POR_SERVIR,LINEA_SERVIDA,PRECIO,DESCUENTO,P_COSTE,M_MOV_STOCK,PA' +
        'IS,TIPO_IVA,P_IVA,P_RECARGO,BRUTO,I_DESCUENTO,B_IMPONIBLE,B_DTO_' +
        'LINEA,C_IVA,C_RECARGO,T_COSTE,M_BRUTO,LIQUIDO,ENTRADA,'
      '   FECHA_PRE_DET,FECHA_REC_DET)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ALMACEN,' +
        '?ARTICULO,?TITULO,?UNIDADES,?UNIDADES_ORIGINALES,?UNIDADES_SERVI' +
        'DAS,?UNIDADES_POR_SERVIR,?LINEA_SERVIDA,?PRECIO,?DESCUENTO,?P_CO' +
        'STE,?M_MOV_STOCK,?PAIS,?TIPO_IVA,?P_IVA,?P_RECARGO,?BRUTO,?I_DES' +
        'CUENTO,?B_IMPONIBLE,?B_DTO_LINEA,?C_IVA,?C_RECARGO,?T_COSTE,?M_B' +
        'RUTO,?LIQUIDO,?ENTRADA,'
      '    ?FECHA_PRE_DET,?FECHA_REC_DET)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_PEDIDO_RECEP'
      'WHERE'
      '  ID_E = ?ID_E AND /*dji lrk kri*/'
      '  ID_DETALLES_E =  ?ID_DETALLES_E')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO_RECEP'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO='#39'PEP'#39' AND'
      '  PROVEEDOR=?PROVEEDOR AND'
      '  LINEA_SERVIDA=0'
      'ORDER BY EJERCICIO, RIG, ORDEN, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_PEDIDO_RECEP'
      'SET'
      '  UNIDADES_SERVIDAS=?UNIDADES_SERVIDAS '
      '  ,LINEA_SERVIDA=?LINEA_SERVIDA '
      '  ,PRECIO=?PRECIO '
      '  ,P_COSTE=?P_COSTE'
      '  ,DESCUENTO=?DESCUENTO'
      '  ,DESCUENTO_2=?DESCUENTO_2'
      '  ,DESCUENTO_3=?DESCUENTO_3'
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDADES_RECEPCION=?UNIDADES_RECEPCION'
      '  ,ENTRADA_RECEPCION=?ENTRADA_RECEPCION'
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET'
      '  ,FECHA_REC_DET=?FECHA_REC_DET'
      '  ,SERVIR_LINEA=?SERVIR_LINEA'
      '  ,ALFA_6=?ALFA_6'
      'WHERE'
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO ')
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_E '
      'ID_DETALLES_E'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_PEDIDO_RECEP'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
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
      DisplayLabel = 'Pedido'
      FieldName = 'RIG'
      ReadOnly = True
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object QMDetalleBARRAS: TFIBStringField
      DisplayLabel = 'Barras'
      FieldName = 'BARRAS'
      ReadOnly = True
      Size = 25
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      ReadOnly = True
    end
    object QMDetalleUNIDADES_ORIGINALES: TFloatField
      DisplayLabel = 'Pedidas'
      FieldName = 'UNIDADES_ORIGINALES'
    end
    object QMDetalleUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object QMDetalleUNIDADES_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds. x Serv.'
      FieldName = 'UNIDADES_POR_SERVIR'
    end
    object QMDetalleLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'L'#237'n. Serv.'
      FieldName = 'LINEA_SERVIDA'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
      OnGetText = QMDetalleP_COSTEGetText
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
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
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. L'#237'nea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
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
    object QMDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetalleUNIDADES_RECEPCION: TFloatField
      DisplayLabel = 'Recibir'
      FieldName = 'UNIDADES_RECEPCION'
      OnChange = QMDetalleUNIDADES_RECEPCIONChange
    end
    object QMDetalleENTRADA_RECEPCION: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_RECEPCION'
      OnChange = QMDetalleENTRADA_RECEPCIONChange
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      ReadOnly = True
      Size = 40
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'ID E.'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det. E.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fecha Prev. Det.'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fecha Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'C'#243'd. Prov.'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object QMDetalleSERVIR_LINEA: TIntegerField
      DisplayLabel = 'Servir'
      FieldName = 'SERVIR_LINEA'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 60
    end
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
    end
    object QMDetalleREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
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
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetallePEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. Cli.'
      FieldKind = fkCalculated
      FieldName = 'PEDIDOS_D_CLI'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 8
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      'FROM GES_CABECERAS_E C'
      
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
    Left = 32
    Top = 200
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 112
    Top = 200
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 112
    Top = 8
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE '
      'ID_A = :ID_A')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE '
      'ID_A = :ID_A')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 32
    Top = 152
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 112
    Top = 152
  end
  object xDetalleNota: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_E'
      'WHERE'
      'ID_E = ?ID_E')
    SelectSQL.Strings = (
      'SELECT NOTAS'
      'FROM GES_DETALLES_E'
      'WHERE'
      'ID_DETALLES_E = ?ID_DETALLES_E')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 32
    Top = 104
    object xDetalleNotaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSDetalleNota: TDataSource
    DataSet = xDetalleNota
    Left = 112
    Top = 104
  end
  object DSxRelacion: TDataSource
    DataSet = xRelacion
    Left = 288
    Top = 56
  end
  object xRelacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT D.ID_DETALLES_S, C.ID_S, C.EJERCICIO, C.CANAL, C.SERIE, C' +
        '.TIPO, C.RIG, D.LINEA, D.ARTICULO, D.TITULO, D.UNIDADES,'
      
        '       P.FECHA_ENTREGA_PREV, P.U_PENDIENTES, P.DIRECCION_ENTREGA' +
        ', C.ALMACEN, C.CLIENTE, C.SU_REFERENCIA, C.FECHA,'
      
        '       T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, C.DIRECCION, C.AGE' +
        'NTE, TA.NOMBRE_R_SOCIAL TITULO_AGENTE, D.MANIPULACION,'
      '       P.U_PREPARADAS'
      'FROM GES_DETALLES_S D'
      'JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S'
      'JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      
        'JOIN EMP_AGENTES A ON C.EMPRESA = A.EMPRESA AND C.AGENTE = A.AGE' +
        'NTE'
      'JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO'
      'WHERE'
      'D.ID_DETALLES_S = :ID_DETALLES_S')
    SelectSQL.Strings = (
      
        'SELECT D.ID_DETALLES_S, C.ID_S, C.EJERCICIO, C.CANAL, C.SERIE, C' +
        '.TIPO, C.RIG, D.LINEA, D.ARTICULO, D.TITULO, D.UNIDADES,'
      
        '       P.FECHA_ENTREGA_PREV, P.U_PENDIENTES, P.DIRECCION_ENTREGA' +
        ', C.ALMACEN, C.CLIENTE, C.SU_REFERENCIA, C.FECHA,'
      
        '       T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, C.DIRECCION, C.AGE' +
        'NTE, TA.NOMBRE_R_SOCIAL TITULO_AGENTE, D.MANIPULACION, '
      '       P.U_PREPARADAS'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_DETALLES_S D ON R.O_EMPRESA = D.EMPRESA AND R.O_EJERCIC' +
        'IO = D.EJERCICIO AND R.O_CANAL = D.CANAL AND R.O_SERIE = D.SERIE' +
        ' AND R.O_TIPO = D.TIPO AND R.O_RIG = D.RIG AND R.O_LINEA = D.LIN' +
        'EA'
      'JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S'
      'JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      
        'JOIN EMP_AGENTES A ON C.EMPRESA = A.EMPRESA AND C.AGENTE = A.AGE' +
        'NTE'
      'JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO'
      'WHERE'
      'R.D_EMPRESA = :EMPRESA AND'
      'R.D_EJERCICIO = :EJERCICIO AND'
      'R.D_CANAL = :CANAL AND'
      'R.D_SERIE = :SERIE AND'
      'R.D_TIPO = :TIPO AND'
      'R.D_RIG = :RIG AND'
      'R.D_LINEA = :LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PED'
      'SET'
      '  U_PREPARADAS=?U_PREPARADAS'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S')
    DataSource = DSQMDetalle
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 208
    Top = 56
    object xRelacionID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xRelacionID_S: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_S'
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
    object xRelacionUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xRelacionFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xRelacionU_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'U_PENDIENTES'
    end
    object xRelacionDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object xRelacionALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xRelacionCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xRelacionSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xRelacionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xRelacionDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xRelacionNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xRelacionNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
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
      DisplayLabel = 'Pedido'
      FieldName = 'RIG'
    end
    object xRelacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRelacionAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xRelacionTITULO_AGENTE: TFIBStringField
      DisplayLabel = 'Titulo Agente'
      FieldName = 'TITULO_AGENTE'
      Size = 60
    end
    object xRelacionMANIPULACION: TIntegerField
      DisplayLabel = 'Manipulacion'
      FieldName = 'MANIPULACION'
    end
    object xRelacionU_PREPARADAS: TFloatField
      DisplayLabel = 'Uds. Preparadas'
      FieldName = 'U_PREPARADAS'
    end
  end
end
