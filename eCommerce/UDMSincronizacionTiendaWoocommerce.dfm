object DMSincronizacionTiendaWoocommerce: TDMSincronizacionTiendaWoocommerce
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 380
  Top = 259
  Height = 429
  Width = 545
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 8
  end
  object QMConfWoocommerce: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_WOOCOMMERCE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_WOOCOMMERCE ('
      
        'WS_ORDER_STATE, UTILIZA_REF_WOOCOMMERCE, ART_SIN_CONTROL_STOCK, ' +
        'VERSION_WORDPRESS, WS_VERSION, WS_CONSUMER_KEY,'
      
        ' WS_CONSUMER_SECRET, ID, TITULO, WEB, EMPRESA, CANAL, SERIE, ACT' +
        'IVO, PREFIJO_ART, ALMACEN, AGENTE, ID_TIENDA_ARTICULOS,'
      
        ' WS_URL, TARIFA, WEB_BACKOFFICE, WS_API_GET, WS_API_CALC,CLIENTE' +
        '_BASE)'
      'VALUES ('
      
        '?WS_ORDER_STATE, ?UTILIZA_REF_WOOCOMMERCE, ?ART_SIN_CONTROL_STOC' +
        'K, ?VERSION_WORDPRESS, ?WS_VERSION,'
      
        ' ?WS_CONSUMER_KEY, ?WS_CONSUMER_SECRET, ?ID, ?TITULO, ?WEB, ?EMP' +
        'RESA, ?CANAL, ?SERIE, ?ACTIVO, ?PREFIJO_ART,'
      
        ' ?ALMACEN, ?AGENTE, ?ID_TIENDA_ARTICULOS, ?WS_URL, ?TARIFA, ?WEB' +
        '_BACKOFFICE, ?WS_API_GET, ?WS_API_CALC, ?CLIENTE_BASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_WOOCOMMERCE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_WOOCOMMERCE'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_WOOCOMMERCE'
      'SET'
      '  WS_ORDER_STATE=?WS_ORDER_STATE '
      '  ,UTILIZA_REF_WOOCOMMERCE=?UTILIZA_REF_WOOCOMMERCE '
      '  ,ART_SIN_CONTROL_STOCK=?ART_SIN_CONTROL_STOCK '
      '  ,VERSION_WORDPRESS=?VERSION_WORDPRESS '
      '  ,WS_VERSION=?WS_VERSION '
      '  ,WS_CONSUMER_KEY=?WS_CONSUMER_KEY '
      '  ,WS_CONSUMER_SECRET=?WS_CONSUMER_SECRET '
      '  ,TITULO=?TITULO '
      '  ,WEB=?WEB '
      '  ,WEB_BACKOFFICE=?WEB_BACKOFFICE'
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,ACTIVO=?ACTIVO '
      '  ,PREFIJO_ART=?PREFIJO_ART '
      '  ,ALMACEN=?ALMACEN '
      '  ,AGENTE=?AGENTE '
      '  ,ID_TIENDA_ARTICULOS=?ID_TIENDA_ARTICULOS '
      '  ,WS_URL=?WS_URL '
      '  ,TARIFA=?TARIFA '
      '  ,WS_API_GET=?WS_API_GET'
      '  ,WS_API_CALC=?WS_API_CALC'
      '  ,CLIENTE_BASE=?CLIENTE_BASE'
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterInsert = QMConfWoocommerceAfterInsert
    AfterOpen = QMConfWoocommerceAfterOpen
    BeforeClose = QMConfWoocommerceBeforeClose
    BeforePost = QMConfWoocommerceBeforePost
    OnNewRecord = QMConfWoocommerceNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_WOOCOMMERCE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object QMConfWoocommerceID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConfWoocommerceTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMConfWoocommerceWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 200
    end
    object QMConfWoocommerceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfWoocommerceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfWoocommerceSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfWoocommerceACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfWoocommercePREFIJO_ART: TFIBStringField
      DisplayLabel = 'Prefijo Art.'
      FieldName = 'PREFIJO_ART'
      Size = 15
    end
    object QMConfWoocommerceALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfWoocommerceAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMConfWoocommerceWS_URL: TFIBStringField
      DisplayLabel = 'WS URL'
      FieldName = 'WS_URL'
      Size = 256
    end
    object QMConfWoocommerceID_TIENDA_ARTICULOS: TIntegerField
      DisplayLabel = 'Id Tienda Art.'
      FieldName = 'ID_TIENDA_ARTICULOS'
    end
    object QMConfWoocommerceTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMConfWoocommerceWS_ORDER_STATE: TIntegerField
      DisplayLabel = 'WS Order State'
      FieldName = 'WS_ORDER_STATE'
    end
    object QMConfWoocommerceUTILIZA_REF_WOOCOMMERCE: TIntegerField
      DisplayLabel = 'Utiliza Ref. Woocommerce'
      FieldName = 'UTILIZA_REF_WOOCOMMERCE'
    end
    object QMConfWoocommerceART_SIN_CONTROL_STOCK: TIntegerField
      DisplayLabel = 'Art. sin Control Stock'
      FieldName = 'ART_SIN_CONTROL_STOCK'
    end
    object QMConfWoocommerceVERSION_WORDPRESS: TFIBStringField
      DisplayLabel = 'Version Wordpress'
      FieldName = 'VERSION_WORDPRESS'
      Size = 15
    end
    object QMConfWoocommerceWS_VERSION: TFIBStringField
      DisplayLabel = 'WS Version'
      FieldName = 'WS_VERSION'
      Size = 35
    end
    object QMConfWoocommerceWS_CONSUMER_KEY: TFIBStringField
      DisplayLabel = 'WS Consumer Key'
      FieldName = 'WS_CONSUMER_KEY'
      Size = 256
    end
    object QMConfWoocommerceWS_CONSUMER_SECRET: TFIBStringField
      DisplayLabel = 'WS Consumer Secret'
      FieldName = 'WS_CONSUMER_SECRET'
      Size = 256
    end
    object QMConfWoocommerceWEB_BACKOFFICE: TFIBStringField
      DisplayLabel = 'Web Backoffice'
      FieldName = 'WEB_BACKOFFICE'
      Size = 200
    end
    object QMConfWoocommerceWS_API_GET: TFIBStringField
      FieldName = 'WS_API_GET'
    end
    object QMConfWoocommerceWS_API_CALC: TFIBStringField
      FieldName = 'WS_API_CALC'
    end
    object QMConfWoocommerceCLIENTE_BASE: TIntegerField
      FieldName = 'CLIENTE_BASE'
    end
  end
  object DSQMConfWoocommerce: TDataSource
    DataSet = QMConfWoocommerce
    Left = 280
    Top = 8
  end
  object QMConfWoocommerceSinc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_WOOCOMMERCE_SINC'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_WOOCOMMERCE_SINC'
      'WHERE'
      'ID_CONFIGURACION = :ID'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_WOOCOMMERCE_SINC'
      'SET'
      '  TIPO=?TIPO '
      '  ,ID_CONFIGURACION=?ID_CONFIGURACION '
      '  ,ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,ULT_REGISTRO=?ULT_REGISTRO '
      '  ,ACTIVO=?ACTIVO '
      '  ,ORDEN=?ORDEN '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMConfWoocommerce
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    BeforePost = QMConfWoocommerceSincBeforePost
    OnNewRecord = QMConfWoocommerceSincNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_WOOCOMMERCE_SINC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
    object QMConfWoocommerceSincID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConfWoocommerceSincTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConfWoocommerceSincID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Conf.'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfWoocommerceSincULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfWoocommerceSincULT_REGISTRO: TIntegerField
      DisplayLabel = 'Ult. Registro'
      FieldName = 'ULT_REGISTRO'
    end
    object QMConfWoocommerceSincACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfWoocommerceSincORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMConfWoocommerceSincTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMConfWoocommerceSinc: TDataSource
    DataSet = QMConfWoocommerceSinc
    Left = 280
    Top = 56
  end
  object QMConfWoocommerceCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONF_PRESTASHOP_CLIENTE'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_CLIENTE=?old_ID_CLIENTE AND '
      '  ID_CUSTOMER=?old_ID_CUSTOMER ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONF_PRESTASHOP_CLIENTE'
      
        '  (ID_CONFIGURACION,ID_CLIENTE,ID_CUSTOMER,ULT_SINCRONIZACION,CL' +
        'IENTE,TERCERO,NOMBRE_R_SOCIAL)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,?ID_CLIENTE,?ID_CUSTOMER,?ULT_SINCRONIZACIO' +
        'N,?CLIENTE,?TERCERO,?NOMBRE_R_SOCIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONF_PRESTASHOP_CLIENTE'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CLIENTE=?old_ID_CLIENTE AND '
      '  ID_CUSTOMER=?old_ID_CUSTOMER ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONF_PRESTASHOP_CLIENTE'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      'ORDER BY ID_CUSTOMER')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONF_PRESTASHOP_CLIENTE'
      'SET'
      '  ID_CLIENTE=?new_ID_CLIENTE  '
      '  ,ID_CUSTOMER=?new_ID_CUSTOMER '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CLIENTE=?old_ID_CLIENTE AND '
      '  ID_CUSTOMER=?old_ID_CUSTOMER ')
    DataSource = DSQMConfWoocommerce
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfWoocommerceSincNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_CLIENTE '
      'ID_CUSTOMER ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONF_PRESTASHOP_CLIENTE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 104
    object QMConfWoocommerceClienteID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfWoocommerceClienteID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMConfWoocommerceClienteID_CUSTOMER: TIntegerField
      DisplayLabel = 'Id Customer (Prestashop)'
      FieldName = 'ID_CUSTOMER'
    end
    object QMConfWoocommerceClienteULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinctronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfWoocommerceClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMConfWoocommerceClienteCLIENTEChange
    end
    object QMConfWoocommerceClienteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMConfWoocommerceClienteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSQMConfWoocommerceCliente: TDataSource
    DataSet = QMConfWoocommerceCliente
    Left = 280
    Top = 104
  end
  object QMConfWoocommerceClienteDir: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONF_PRESTASHOP_CLIENTE_DIR'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_ADDRESS=?old_ID_ADDRESS ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONF_PRESTASHOP_CLIENTE_DIR'
      
        '  (ID_CONFIGURACION,ID_ADDRESS,ULT_SINCRONIZACION,TERCERO,DIRECC' +
        'ION,NOMBRE_R_SOCIAL,DIR_COMPLETA_N,CLIENTE)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,?ID_ADDRESS,?ULT_SINCRONIZACION,?TERCERO,?D' +
        'IRECCION,?NOMBRE_R_SOCIAL,?DIR_COMPLETA_N,?CLIENTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONF_PRESTASHOP_CLIENTE_DIR'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_ADDRESS=?old_ID_ADDRESS ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONF_PRESTASHOP_CLIENTE_DIR'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      'ORDER BY ID_ADDRESS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONF_PRESTASHOP_CLIENTE_DIR'
      'SET'
      '  TERCERO=?new_TERCERO '
      '  ,DIRECCION=?new_DIRECCION '
      '  ,ID_ADDRESS=?new_ID_ADDRESS '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_ADDRESS=?old_ID_ADDRESS AND '
      '  TERCERO=?old_TERCERO AND '
      '  DIRECCION=?old_DIRECCION'
      '')
    DataSource = DSQMConfWoocommerce
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfWoocommerceSincNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_ADDRESS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONF_PRESTASHOP_CLIENTE_DIR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 152
    object QMConfWoocommerceClienteDirID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfWoocommerceClienteDirID_ADDRESS: TIntegerField
      DisplayLabel = 'Id Address (Prestashop)'
      FieldName = 'ID_ADDRESS'
    end
    object QMConfWoocommerceClienteDirULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfWoocommerceClienteDirTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMConfWoocommerceClienteDirDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      OnChange = QMConfWoocommerceClienteDirDIRECCIONChange
    end
    object QMConfWoocommerceClienteDirNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMConfWoocommerceClienteDirDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMConfWoocommerceClienteDirCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMConfWoocommerceClienteDirCLIENTEChange
    end
  end
  object DSQMConfWoocommerceClienteDir: TDataSource
    DataSet = QMConfWoocommerceClienteDir
    Left = 280
    Top = 152
  end
  object QMConfWoocommerceArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONF_WOOCOMMERCE_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_A=?old_ID_A ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONF_WOOCOMMERCE_ARTICULO'
      
        '  (ULT_SINCRONIZACION,DESCRIPCION_CORTA,DESCRIPCION_LARGA,PRECIO' +
        ',STOCK,ID_CONFIGURACION,ID_A,ID_PRODUCT,TITULO,REFERENCIA,TITULO' +
        '_ARTICULO,ARTICULO,PRODUCT_TYPE,ID_VARIATION)'
      'VALUES'
      
        '  (?ULT_SINCRONIZACION,?DESCRIPCION_CORTA,?DESCRIPCION_LARGA,?PR' +
        'ECIO,?STOCK,?ID_CONFIGURACION,?ID_A,?ID_PRODUCT,?TITULO,?REFEREN' +
        'CIA,?TITULO_ARTICULO,?ARTICULO,?PRODUCT_TYPE,?ID_VARIATION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONF_WOOCOMMERCE_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_A=?ID_A ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONF_WOOCOMMERCE_ARTICULO'
      'WHERE'
      ' ID_CONFIGURACION=?ID'
      'ORDER BY ID_PRODUCT, ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONF_WOOCOMMERCE_ARTICULO'
      'SET'
      '  ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,DESCRIPCION_CORTA=?DESCRIPCION_CORTA '
      '  ,DESCRIPCION_LARGA=?DESCRIPCION_LARGA '
      '  ,PRECIO=?PRECIO '
      '  ,STOCK=?STOCK '
      '  ,ID_PRODUCT=?ID_PRODUCT '
      '  ,TITULO=?TITULO '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ARTICULO=?ARTICULO '
      '  ,PRODUCT_TYPE=?PRODUCT_TYPE '
      '  ,ID_VARIATION=?ID_VARIATION '
      '  ,ID_A=?new_ID_A '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_A=?old_ID_A ')
    DataSource = DSQMConfWoocommerce
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfWoocommerceSincNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_A ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONF_WOOCOMMERCE_ARTICULO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
    object QMConfWoocommerceArticuloID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfWoocommerceArticuloID_A: TIntegerField
      DisplayLabel = 'Id Articulo'
      FieldName = 'ID_A'
    end
    object QMConfWoocommerceArticuloID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product (Woocommerce)'
      FieldName = 'ID_PRODUCT'
    end
    object QMConfWoocommerceArticuloID_VARIATION: TIntegerField
      DisplayLabel = 'Id Variation (Woocommerce)'
      FieldName = 'ID_VARIATION'
    end
    object QMConfWoocommerceArticuloULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinctronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfWoocommerceArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMConfWoocommerceArticuloARTICULOChange
      Size = 15
    end
    object QMConfWoocommerceArticuloTITULO: TFIBStringField
      DisplayLabel = 'Titulo (Woocommerce)'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMConfWoocommerceArticuloREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMConfWoocommerceArticuloDESCRIPCION_CORTA: TBlobField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCION_CORTA'
      Size = 8
    end
    object QMConfWoocommerceArticuloDESCRIPCION_LARGA: TBlobField
      DisplayLabel = 'Desc. Larga'
      FieldName = 'DESCRIPCION_LARGA'
      Size = 8
    end
    object QMConfWoocommerceArticuloPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMConfWoocommerceArticuloTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      DisplayWidth = 256
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMConfWoocommerceArticuloPRODUCT_TYPE: TFIBStringField
      DisplayLabel = 'Tipo Articulo'
      FieldName = 'PRODUCT_TYPE'
      Size = 40
    end
    object QMConfWoocommerceArticuloSTOCK: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
  end
  object DSQMConfWoocommerceArticulo: TDataSource
    DataSet = QMConfWoocommerceArticulo
    Left = 280
    Top = 200
  end
  object QMConfWoocommerceTaxRuleGroup: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_TAX_RULE_GR'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_TAX_RULE_GR'
      '  (ID_CONFIGURACION,ID,DESCRIPCION,PAIS,TIPO)'
      'VALUES'
      '  (?ID_CONFIGURACION,?ID,?DESCRIPCION,?PAIS,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT T.*, I.TITULO, I.P_IVA'
      'FROM SYS_CONF_PRESTASHOP_TAX_RULE_GR T'
      'LEFT JOIN SYS_TIPO_IVA I ON T.PAIS = I.PAIS AND T.TIPO = I.TIPO'
      'WHERE'
      'T.ID_CONFIGURACION = :ID_CONFIGURACION AND'
      'T.ID = :ID')
    SelectSQL.Strings = (
      'SELECT T.*, I.TITULO, I.P_IVA'
      'FROM SYS_CONF_PRESTASHOP_TAX_RULE_GR T'
      'LEFT JOIN SYS_TIPO_IVA I ON T.PAIS = I.PAIS AND T.TIPO = I.TIPO'
      'WHERE'
      'T.ID_CONFIGURACION = :ID'
      'ORDER BY T.ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_TAX_RULE_GR'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,PAIS=?PAIS '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID=?ID ')
    DataSource = DSQMConfWoocommerce
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfWoocommerceSincNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_TAX_RULE_GR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 248
    object QMConfWoocommerceTaxRuleGroupID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfWoocommerceTaxRuleGroupID: TIntegerField
      DisplayLabel = 'Id Tax'
      FieldName = 'ID'
    end
    object QMConfWoocommerceTaxRuleGroupDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMConfWoocommerceTaxRuleGroupPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMConfWoocommerceTaxRuleGroupTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMConfWoocommerceTaxRuleGroupTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMConfWoocommerceTaxRuleGroupP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
  end
  object DSQMConfWoocommerceTaxRuleGroup: TDataSource
    DataSet = QMConfWoocommerceTaxRuleGroup
    Left = 280
    Top = 248
  end
  object QMProductosWC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_CONF_WOOCOMMERCE_PROD'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_PRODUCT=?old_ID_PRODUCT AND '
      '  ID_VARIATION=?old_ID_VARIATION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_CONF_WOOCOMMERCE_PROD'
      
        '  (ID_CONFIGURACION,'#13#10'ID_PRODUCT,ID_VARIATION,TITLE,PRODUCT_TYPE' +
        ',SKU,PRICE,STOCK_QUANTITY,CATALOG_VISIBILITY,PRODUCT_WEIGHT,PROD' +
        'UCT_LENGTH,'#13#10'PRODUCT_WIDTH,PRODUCT_HEIGHT,PRODUCT_UNIT,DESCRIPTI' +
        'ON,SHORT_DESCRIPTION,PARENT_ID,DATE_MODIFIED,ID_A,ARTICULO,TITUL' +
        'O_LARGO,'#13#10'RAW_JSON)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_PRODUCT,?ID_VARIATION,?TITLE,?PRODUCT' +
        '_TYPE,?SKU,?PRICE,?STOCK_QUANTITY,?CATALOG_VISIBILITY,?PRODUCT_W' +
        'EIGHT,?PRODUCT_LENGTH,'#13#10'?PRODUCT_WIDTH,?PRODUCT_HEIGHT,?PRODUCT_' +
        'UNIT,?DESCRIPTION,?SHORT_DESCRIPTION,?PARENT_ID,?DATE_MODIFIED,?' +
        'ID_A,?ARTICULO,?TITULO_LARGO,'#13#10'?RAW_JSON)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_WOOCOMMERCE_PROD'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT=?ID_PRODUCT AND '
      '  ID_VARIATION=?ID_VARIATION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_SYS_CONF_WOOCOMMERCE_PROD'
      'WHERE'
      ' ID_CONFIGURACION=?ID'
      'ORDER BY ID_PRODUCT, ID_VARIATION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_CONF_WOOCOMMERCE_PROD'
      'SET'
      '  ID_A=?ID_A '
      '  ,ARTICULO=?ARTICULO '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT=?ID_PRODUCT AND '
      '  ID_VARIATION=?ID_VARIATION ')
    DataSource = DSQMConfWoocommerce
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_PRODUCT '
      'ID_VARIATION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_CONF_WOOCOMMERCE_PROD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 296
    object QMProductosWCID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMProductosWCID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product'
      FieldName = 'ID_PRODUCT'
    end
    object QMProductosWCID_VARIATION: TIntegerField
      DisplayLabel = 'Id Variation'
      FieldName = 'ID_VARIATION'
    end
    object QMProductosWCTITLE: TFIBStringField
      DisplayLabel = 'Titule'
      FieldName = 'TITLE'
      Size = 256
    end
    object QMProductosWCPRODUCT_TYPE: TFIBStringField
      DisplayLabel = 'Product Type'
      FieldName = 'PRODUCT_TYPE'
      Size = 40
    end
    object QMProductosWCSKU: TFIBStringField
      FieldName = 'SKU'
      Size = 40
    end
    object QMProductosWCPRICE: TFloatField
      DisplayLabel = 'Price'
      FieldName = 'PRICE'
    end
    object QMProductosWCSTOCK_QUANTITY: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK_QUANTITY'
    end
    object QMProductosWCCATALOG_VISIBILITY: TFIBStringField
      DisplayLabel = 'Catalog Visibility'
      FieldName = 'CATALOG_VISIBILITY'
      Size = 40
    end
    object QMProductosWCPRODUCT_WEIGHT: TFloatField
      DisplayLabel = 'Weight'
      FieldName = 'PRODUCT_WEIGHT'
    end
    object QMProductosWCPRODUCT_LENGTH: TFloatField
      DisplayLabel = 'Length'
      FieldName = 'PRODUCT_LENGTH'
    end
    object QMProductosWCPRODUCT_WIDTH: TFloatField
      DisplayLabel = 'Width'
      FieldName = 'PRODUCT_WIDTH'
    end
    object QMProductosWCPRODUCT_HEIGHT: TFloatField
      DisplayLabel = 'Height'
      FieldName = 'PRODUCT_HEIGHT'
    end
    object QMProductosWCPRODUCT_UNIT: TFIBStringField
      DisplayLabel = 'Unit'
      FieldName = 'PRODUCT_UNIT'
      Size = 40
    end
    object QMProductosWCDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object QMProductosWCSHORT_DESCRIPTION: TMemoField
      DisplayLabel = 'Short Description'
      FieldName = 'SHORT_DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object QMProductosWCPARENT_ID: TIntegerField
      DisplayLabel = 'Parent Id'
      FieldName = 'PARENT_ID'
    end
    object QMProductosWCDATE_MODIFIED: TDateTimeField
      DisplayLabel = 'Date Modif.'
      FieldName = 'DATE_MODIFIED'
    end
    object QMProductosWCID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object QMProductosWCARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMProductosWCARTICULOChange
      Size = 15
    end
    object QMProductosWCTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMProductosWCRAW_JSON: TMemoField
      DisplayLabel = 'Raw JSON'
      FieldName = 'RAW_JSON'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQMProductosWC: TDataSource
    DataSet = QMProductosWC
    Left = 280
    Top = 296
  end
end
