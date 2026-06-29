object ZDMOrdenesProd: TZDMOrdenesProd
  OldCreateOrder = False
  OnCreate = ZDMOrdenesProdCreate
  Left = 446
  Top = 122
  Height = 402
  Width = 525
  object QMOrdProd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_ORDPROD_C'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_ORDPROD_C'
      '  (PEDIDO,'
      '   LINEA,'
      '   TIPODOC,'
      '   EMPRESA,'
      '   EJERCICIO,'
      '   CANAL,'
      '   SERIE,'
      '   TIPO,'
      '   RIG,'
      '   CLIENTE,'
      '   TERCERO,'
      '   DIREC_ENTR,'
      '   S_REFERENCIA,'
      '   ARTICULO,'
      '   TITULO,'
      '   FECHA_EMISION,'
      '   FECHA_ENTREGA,'
      '   FECHA_FABRICA,'
      '   ESTADO,'
      '   CANTIDAD_GAST_ESPECIALES,'
      '   LINEA_GTOS_INI,'
      '   PUBLICAR_WEB,'
      '   ARTICULO_GTOS_INI,'
      '   TITULO_GTOS_INI,'
      '   PRECIO_GTOS_INI,'
      '   CANTIDAD,'
      '   PRECIO,'
      '   GTOS_INICIALES,'
      '   DESC_GTOS_INI,'
      '   MAQUINA,'
      '   NOTAS,'
      '   FECHA_ENVIO,'
      '   Z_NUM_EXPED,'
      '   ENTRADA)'
      'VALUES'
      '  (?PEDIDO,'
      '  ?LINEA,'
      '  ?TIPODOC,'
      '  ?EMPRESA,'
      '  ?EJERCICIO,'
      '  ?CANAL,'
      '  ?SERIE,'
      '  ?TIPO,'
      '  ?RIG,'
      '  ?CLIENTE,'
      '  ?TERCERO,'
      '  ?DIREC_ENTR,'
      '  ?S_REFERENCIA,'
      '  ?ARTICULO,'
      '  ?TITULO,'
      '  ?FECHA_EMISION,'
      '  ?FECHA_ENTREGA,'
      '  ?FECHA_FABRICA,'
      '  ?ESTADO,'
      '  ?CANTIDAD_GAST_ESPECIALES,'
      '  ?LINEA_GTOS_INI,'
      '  ?PUBLICAR_WEB,'
      '  ?ARTICULO_GTOS_INI,'
      '  ?TITULO_GTOS_INI,'
      '  ?PRECIO_GTOS_INI,'
      '  ?CANTIDAD,'
      '  ?PRECIO,'
      '  ?GTOS_INICIALES,'
      '  ?DESC_GTOS_INI,'
      '  ?MAQUINA,'
      '  ?NOTAS,'
      '  ?FECHA_ENVIO,'
      '  ?Z_NUM_EXPED,'
      '  ?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_ORDPROD_C'
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_GES_ORDPROD_C'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               SERIE=?SERIE AND'
      '               TIPO='#39'ZOF'#39
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_ORDPROD_C'
      'SET'
      '  PEDIDO=?PEDIDO '
      '  ,LINEA=?LINEA '
      '  ,TIPODOC=?TIPODOC '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,DIREC_ENTR=?DIREC_ENTR '
      '  ,S_REFERENCIA=?S_REFERENCIA '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,FECHA_EMISION=?FECHA_EMISION '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,FECHA_FABRICA=?FECHA_FABRICA '
      '  ,ESTADO=?ESTADO '
      '  ,CANTIDAD_GAST_ESPECIALES=?CANTIDAD_GAST_ESPECIALES '
      '  ,LINEA_GTOS_INI=?LINEA_GTOS_INI '
      '  ,PUBLICAR_WEB=?PUBLICAR_WEB '
      '  ,ARTICULO_GTOS_INI=?ARTICULO_GTOS_INI '
      '  ,TITULO_GTOS_INI=?TITULO_GTOS_INI '
      '  ,PRECIO_GTOS_INI=?PRECIO_GTOS_INI '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRECIO=?PRECIO '
      '  ,GTOS_INICIALES=?GTOS_INICIALES '
      '  ,DESC_GTOS_INI=?DESC_GTOS_INI '
      '  ,MAQUINA=?MAQUINA '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA_ENVIO=?FECHA_ENVIO '
      '  ,Z_NUM_EXPED=?Z_NUM_EXPED '
      '  ,ENTRADA=?ENTRADA'
      'WHERE'
      '  RIG=?RIG AND'
      '  TIPO=?TIPO AND'
      '  SERIE=?SERIE AND'
      '  CANAL=?CANAL AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  EMPRESA=?EMPRESA')
    AfterDelete = Graba
    AfterOpen = QMOrdProdAfterOpen
    AfterPost = QMOrdProdAfterPost
    BeforeClose = QMOrdProdBeforeClose
    BeforePost = QMOrdProdBeforePost
    OnNewRecord = QMOrdProdNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_ORDPROD_C'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMOrdProdEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdProdEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOrdProdCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOrdProdSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMOrdProdTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMOrdProdRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMOrdProdCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMOrdProdCLIENTEChange
    end
    object QMOrdProdTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMOrdProdDIREC_ENTR: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIREC_ENTR'
      OnChange = QMOrdProdDIREC_ENTRChange
    end
    object QMOrdProdS_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'S_REFERENCIA'
    end
    object QMOrdProdARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMOrdProdARTICULOChange
      Size = 15
    end
    object QMOrdProdTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMOrdProdFECHA_EMISION: TDateTimeField
      DisplayLabel = 'Fec. Emision'
      FieldName = 'FECHA_EMISION'
    end
    object QMOrdProdFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMOrdProdFECHA_FABRICA: TDateTimeField
      DisplayLabel = 'Fec. Fabricacion'
      FieldName = 'FECHA_FABRICA'
    end
    object QMOrdProdESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      OnChange = QMOrdProdESTADOChange
      Size = 2
    end
    object QMOrdProdCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMOrdProdPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMOrdProdGTOS_INICIALES: TFloatField
      DisplayLabel = 'Gastos iniciales'
      FieldName = 'GTOS_INICIALES'
    end
    object QMOrdProdDESC_GTOS_INI: TBlobField
      DisplayLabel = 'Desc. gastos ini.'
      FieldName = 'DESC_GTOS_INI'
      Size = 8
    end
    object QMOrdProdMAQUINA: TFIBStringField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
      OnChange = QMOrdProdMAQUINAChange
      Size = 4
    end
    object QMOrdProdNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMOrdProdENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMOrdProdFECHA_ENVIO: TDateTimeField
      DisplayLabel = 'Fec. Env'#237'o'
      FieldName = 'FECHA_ENVIO'
    end
    object QMOrdProdZ_NUM_EXPED: TFIBStringField
      DisplayLabel = 'N'#250'm. Expedici'#243'n'
      FieldName = 'Z_NUM_EXPED'
      Size = 15
    end
    object QMOrdProdTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
      OnChange = QMOrdProdTRANSPORTISTAChange
    end
    object QMOrdProdDescCliente: TStringField
      DisplayLabel = 'Desc. Cliente'
      FieldKind = fkCalculated
      FieldName = 'DescCliente'
      OnGetText = QMOrdProdDescClienteGetText
      Calculated = True
    end
    object QMOrdProdDescDireccionCliente: TStringField
      DisplayLabel = 'Direccion Cliente'
      FieldKind = fkCalculated
      FieldName = 'DescDireccionCliente'
      OnGetText = QMOrdProdDescDireccionClienteGetText
      Calculated = True
    end
    object QMOrdProdDescEstado: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkCalculated
      FieldName = 'DescEstado'
      OnGetText = QMOrdProdDescEstadoGetText
      Calculated = True
    end
    object QMOrdProdDescMaquina: TStringField
      DisplayLabel = 'Desc. Maquina'
      FieldKind = fkCalculated
      FieldName = 'DescMaquina'
      OnGetText = QMOrdProdDescMaquinaGetText
      Calculated = True
    end
    object QMOrdProdDescTransportista: TStringField
      DisplayLabel = 'Desc. Transportista'
      FieldKind = fkCalculated
      FieldName = 'DescTransportista'
      OnGetText = QMOrdProdDescTransportistaGetText
      Calculated = True
    end
    object QMOrdProdz_codigo_cliente: TStringField
      DisplayLabel = 'Cod. Cliente'
      FieldKind = fkCalculated
      FieldName = 'z_codigo_cliente'
      OnGetText = QMOrdProdz_codigo_clienteGetText
      Calculated = True
    end
    object QMOrdProdPUBLICAR_WEB: TIntegerField
      DisplayLabel = 'Publicar Web'
      FieldName = 'PUBLICAR_WEB'
    end
    object QMOrdProdCANTIDAD_GAST_ESPECIALES: TFloatField
      DisplayLabel = 'Cant. Gast. Esp.'
      FieldName = 'CANTIDAD_GAST_ESPECIALES'
    end
    object QMOrdProdPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      OnChange = QMOrdProdPEDIDOChange
    end
    object QMOrdProdLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
      OnChange = QMOrdProdLINEAChange
    end
    object QMOrdProdTIPODOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPODOC'
      Size = 3
    end
    object QMOrdProdLINEA_GTOS_INI: TIntegerField
      DisplayLabel = 'Linea Gestos Ini.'
      FieldName = 'LINEA_GTOS_INI'
      OnChange = QMOrdProdLINEA_GTOS_INIChange
    end
    object QMOrdProdARTICULO_GTOS_INI: TFIBStringField
      DisplayLabel = 'Art. Gastos Ini.'
      FieldName = 'ARTICULO_GTOS_INI'
      Size = 15
    end
    object QMOrdProdTITULO_GTOS_INI: TFIBStringField
      DisplayLabel = 'Titulo Gastos Ini.'
      FieldName = 'TITULO_GTOS_INI'
      Size = 256
    end
    object QMOrdProdPRECIO_GTOS_INI: TFloatField
      DisplayLabel = 'Precio Gastos Ini.'
      FieldName = 'PRECIO_GTOS_INI'
    end
  end
  object DSQMOrdProd: TDataSource
    DataSet = QMOrdProd
    Left = 152
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 400
    Top = 16
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select tercero, titulo from ver_clientes'
      'where '
      'empresa=?empresa and '
      'ejercicio=?ejercicio and '
      'canal=?canal and '
      'cliente=?cliente')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 48
    Top = 112
  end
  object xDirClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_direcciones'
      'where '
      'tercero=?tercero and '
      'direccion=?direc_entr')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 48
    Top = 160
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO_LARGO AS TITULO from  art_articulos'
      'where '
      'empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 48
    Top = 208
  end
  object xEstado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from z_sys_estado_ordf'
      'where estado=?estado')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 48
    Top = 304
  end
  object xMaquinas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from z_emp_maquinas'
      'where empresa=?empresa and maquina=?maquina')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 248
    Top = 16
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 152
    Top = 112
  end
  object DSxDirClientes: TDataSource
    DataSet = xDirClientes
    Left = 152
    Top = 160
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 152
    Top = 208
  end
  object DSxEstado: TDataSource
    DataSet = xEstado
    Left = 152
    Top = 304
  end
  object DSxMaquinas: TDataSource
    DataSet = xMaquinas
    Left = 336
    Top = 16
  end
  object DSxTransportistas: TDataSource
    DataSet = xTransportistas
    Left = 336
    Top = 64
  end
  object xTransportistas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_TRANSPORTISTAS             '
      'where empresa=?empresa and transportista=?transportista')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 248
    Top = 64
    object xTransportistasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_CANALES_SERIES'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and serie=?serie'
      ''
      '')
    UniDirectional = False
    Left = 48
    Top = 64
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 152
    Top = 64
  end
  object xArticulos_codigocli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT Z_CODIGO_CLIENTE FROM Z_ART_ARTICULOS_FICHA_TECNICA'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 48
    Top = 256
    object xArticulos_codigocliZ_CODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Cli.'
      FieldName = 'Z_CODIGO_CLIENTE'
      Size = 25
    end
  end
  object DSxArticulos_codigocli: TDataSource
    DataSet = xArticulos_codigocli
    Left = 152
    Top = 256
  end
  object EFFiltro: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 464
    Top = 16
  end
  object xPedido_C: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT empresa,ejercicio,canal,serie,tipo,rig,cliente,titulo,dir' +
        'eccion,'
      'su_referencia,fecha_entrega_prev'
      'FROM VER_CABECERAS_PEDIDO '
      
        'WHERE empresa=?Empresa AND ejercicio=?ejercicio AND canal=?canal' +
        ' AND'
      '             serie=?serie AND rig=?pedido')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 248
    Top = 112
    object xPedido_CEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedido_CEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedido_CCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedido_CSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedido_CTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedido_CRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPedido_CCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xPedido_CTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPedido_CDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xPedido_CSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xPedido_CFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
  end
  object xPedido_D: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from VER_DETALLE_PEDIDO '
      
        '  where empresa=?Empresa and ejercicio=?ejercicio and canal=?can' +
        'al and '
      '             serie=?serie and rig=?pedido and linea=?linea')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 248
    Top = 160
    object xPedido_DEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedido_DEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedido_DCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedido_DSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedido_DTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedido_DRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPedido_DLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xPedido_DARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPedido_DTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xPedido_DUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xPedido_DPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
  end
  object xPedido_D_gtos_ini: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from VER_DETALLE_PEDIDO '
      
        '  where empresa=?Empresa and ejercicio=?ejercicio and canal=?can' +
        'al and '
      
        '             serie=?serie and rig=?pedido and linea=?linea_gtos_' +
        'ini')
    UniDirectional = False
    DataSource = DSQMOrdProd
    Left = 248
    Top = 208
    object xPedido_D_gtos_iniEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedido_D_gtos_iniEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedido_D_gtos_iniCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedido_D_gtos_iniSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedido_D_gtos_iniTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedido_D_gtos_iniRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPedido_D_gtos_iniLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xPedido_D_gtos_iniARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPedido_D_gtos_iniTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xPedido_D_gtos_iniUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xPedido_D_gtos_iniPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
  end
  object QAjustaCont: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update emp_contadores_eecs set contador=?contador'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and tipo=?tipo')
    Transaction = TLocal
    AutoTrans = True
    Left = 400
    Top = 152
  end
  object QSetTransportista: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update z_ges_ordprod_c'
      '  set transportista=:transportista'
      '  WHERE'
      '    EMPRESA=:EMPRESA and'
      '    EJERCICIO=:EJERCICIO AND'
      '    CANAL=:CANAL AND'
      '    SERIE=:SERIE AND'
      '    TIPO=:TIPO AND'
      '    RIG=:RIG')
    Transaction = TLocal
    AutoTrans = True
    Left = 400
    Top = 200
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 400
    Top = 64
  end
end
