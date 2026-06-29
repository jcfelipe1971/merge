object DMFacturacionAlbCliDet: TDMFacturacionAlbCliDet
  OldCreateOrder = False
  OnCreate = DMFacturacionAlbaranesCreate
  Left = 586
  Top = 223
  Height = 269
  Width = 402
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_ALBARAN_CLI'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ALBARAN_CLI'
      
        '  (SERIE,UNIDADES,PRECIO,P_COSTE,BRUTO,B_COMISION,I_DESCUENTO,B_' +
        'IMPONIBLE,I_COMISION,NOTAS,UNIDADES_EXT,UNIDADES_SEC,UNIDADES_FA' +
        'CTURADAS,UNIDADES_A_FACTURAR,RIG,LINEA,DESCUENTO,DESCUENTO_2,DES' +
        'CUENTO_3,COMISION,M_MOV_STOCK,P_IVA,P_RECARGO,ENTRADA,ID_DETALLE' +
        'S_S,ID_S,ENTRADA_FACTURACION,CLIENTE,TERCERO,EMPRESA,EJERCICIO,C' +
        'ANAL,TITULO,PIEZAS_X_BULTO,BULTOS,TIPO_IVA,LINEA_SERVIDA,ESTADO,' +
        'FACTURABLE,TIPO,ALMACEN,ARTICULO,NSERIE,MONEDA,SERIALIZADO,LOTEA' +
        'DO)'
      'VALUES'
      
        '  (?SERIE,?UNIDADES,?PRECIO,?P_COSTE,?BRUTO,?B_COMISION,?I_DESCU' +
        'ENTO,?B_IMPONIBLE,?I_COMISION,?NOTAS,?UNIDADES_EXT,?UNIDADES_SEC' +
        ',?UNIDADES_FACTURADAS,?UNIDADES_A_FACTURAR,?RIG,?LINEA,?DESCUENT' +
        'O,?DESCUENTO_2,?DESCUENTO_3,?COMISION,?M_MOV_STOCK,?P_IVA,?P_REC' +
        'ARGO,?ENTRADA,?ID_DETALLES_S,?ID_S,?ENTRADA_FACTURACION,?CLIENTE' +
        ',?TERCERO,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?PIEZAS_X_BULTO,?BU' +
        'LTOS,?TIPO_IVA,?LINEA_SERVIDA,?ESTADO,?FACTURABLE,?TIPO,?ALMACEN' +
        ',?ARTICULO,?NSERIE,?MONEDA,?SERIALIZADO,?LOTEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ALBARAN_CLI'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_CLI'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  CLIENTE=?CLIENTE AND'
      '  LINEA_SERVIDA=0 AND'
      '  ESTADO = 0'
      'ORDER BY EJERCICIO,RIG,LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ALBARAN_CLI'
      'SET '
      '  ENTRADA_FACTURACION=?ENTRADA_FACTURACION '
      '  ,UNIDADES_A_FACTURAR=?UNIDADES_A_FACTURAR '
      '  ,ENTRADA=?ENTRADA'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    BeforeClose = QMDetalleBeforeClose
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S '
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_ALBARAN_CLI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
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
      DisplayLabel = 'Alb.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Entregadas'
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
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
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
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
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
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Com.'
      FieldName = 'I_COMISION'
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
      DisplayLabel = 'M Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
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
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID S.'
      FieldName = 'ID_S'
    end
    object QMDetalleENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMDetalleUNIDADES_FACTURADAS: TFloatField
      DisplayLabel = 'Facturadas'
      FieldName = 'UNIDADES_FACTURADAS'
    end
    object QMDetalleUNIDADES_A_FACTURAR: TFloatField
      DisplayLabel = 'A Facturar'
      FieldName = 'UNIDADES_A_FACTURAR'
      OnChange = QMDetalleUNIDADES_A_FACTURARChange
    end
    object QMDetalleLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'Lin. Serv.'
      FieldName = 'LINEA_SERVIDA'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMDetalleFACTURABLE: TIntegerField
      DisplayLabel = 'Facturable'
      FieldName = 'FACTURABLE'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object QMDetalleLOTEADO: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEADO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 24
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
    Left = 120
    Top = 16
  end
  object xSerializacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_SERIALIZACION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIG = :RIG AND'
      'LINEA = :LINEA'
      'ORDER BY ARTICULO, NSERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_SERIALIZACION'
      'SET'
      '  ENTRADA_FACTURACION=?ENTRADA_FACTURACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    DataSource = DSQMDetalle
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA '
      'CODIGO '
      'ALMACEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_SERIALIZACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 112
    object xSerializacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSerializacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSerializacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSerializacionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSerializacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xSerializacionRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xSerializacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xSerializacionCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xSerializacionCONTADOR: TIntegerField
      DisplayLabel = 'Cont.'
      FieldName = 'CONTADOR'
    end
    object xSerializacionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xSerializacionSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object xSerializacionNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xSerializacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xSerializacionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xSerializacionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xSerializacionFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object xSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Garantia Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object xSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Garantia Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object xSerializacionNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xSerializacionTRASPASADO: TIntegerField
      DisplayLabel = 'Traspasado'
      FieldName = 'TRASPASADO'
    end
    object xSerializacionID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xSerializacionENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_FACTURACION'
    end
  end
  object DSxSerializacion: TDataSource
    DataSet = xSerializacion
    Left = 120
    Top = 112
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
      '              TIPO_DOCUMENTO IN ('#39'FAC'#39')'
      '              ORDER BY TIPO_DOCUMENTO)) AVISOS'
      '       --'
      'FROM EMP_CLIENTES C'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 24
    Top = 160
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
    Left = 120
    Top = 160
  end
end
