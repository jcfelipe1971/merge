object DMSincronizacionTienda: TDMSincronizacionTienda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 449
  Top = 102
  Height = 681
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
  object QMConfPrestaShop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP'
      
        '  (ID,'#13#10'TITULO,WEB,EMPRESA,CANAL,SERIE,ACTIVO,PREFIJO_ART,ALMACE' +
        'N,AGENTE,SOLO_CLIENTE_CON_PEDIDO,'#13#10'UTILIZA_MODULO_PAYPAL,ART_SIN' +
        '_CONTROL_STOCK,UTILIZA_REF_PRESTAHOP,VERSION_PRESTASHOP,ID_TIEND' +
        'A_ARTICULOS,WS_URL,WS_KEY,WS_VERSION,WS_DEBUG,WS_LANGUAGE,'#13#10'WS_O' +
        'RDER_STATE,TARIFA,WEB_BACKOFFICE,MANTENER_DESCRIPCIONES,MANTENER' +
        '_PRECIO,CLIENTE_BASE,CUENTA_CLIENTE,IMPORTAR_ARTICULOS_VARIOS,UT' +
        'ILIZA_MODULO_MEGAPRODUCT,DSN_MYSQL,'#13#10'FAMILIA_PACK,USUARIO_WARNIN' +
        'GS,ARTICULO_DESCUENTO)'
      'VALUES'
      
        '  (?ID,'#13#10'?TITULO,?WEB,?EMPRESA,?CANAL,?SERIE,?ACTIVO,?PREFIJO_AR' +
        'T,?ALMACEN,?AGENTE,?SOLO_CLIENTE_CON_PEDIDO,'#13#10'?UTILIZA_MODULO_PA' +
        'YPAL,?ART_SIN_CONTROL_STOCK,?UTILIZA_REF_PRESTAHOP,?VERSION_PRES' +
        'TASHOP,?ID_TIENDA_ARTICULOS,?WS_URL,?WS_KEY,?WS_VERSION,?WS_DEBU' +
        'G,?WS_LANGUAGE,'#13#10'?WS_ORDER_STATE,?TARIFA,?WEB_BACKOFFICE,?MANTEN' +
        'ER_DESCRIPCIONES,?MANTENER_PRECIO,?CLIENTE_BASE,?CUENTA_CLIENTE,' +
        '?IMPORTAR_ARTICULOS_VARIOS,?UTILIZA_MODULO_MEGAPRODUCT,?DSN_MYSQ' +
        'L,'#13#10'?FAMILIA_PACK,?USUARIO_WARNINGS,?ARTICULO_DESCUENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP'
      'SET'
      '  TITULO=?TITULO '
      '  ,WEB=?WEB '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,ACTIVO=?ACTIVO '
      '  ,PREFIJO_ART=?PREFIJO_ART '
      '  ,ALMACEN=?ALMACEN '
      '  ,AGENTE=?AGENTE '
      '  ,SOLO_CLIENTE_CON_PEDIDO=?SOLO_CLIENTE_CON_PEDIDO '
      '  ,UTILIZA_MODULO_PAYPAL=?UTILIZA_MODULO_PAYPAL '
      '  ,ART_SIN_CONTROL_STOCK=?ART_SIN_CONTROL_STOCK '
      '  ,UTILIZA_REF_PRESTAHOP=?UTILIZA_REF_PRESTAHOP '
      '  ,VERSION_PRESTASHOP=?VERSION_PRESTASHOP '
      '  ,ID_TIENDA_ARTICULOS=?ID_TIENDA_ARTICULOS '
      '  ,WS_URL=?WS_URL '
      '  ,WS_KEY=?WS_KEY '
      '  ,WS_VERSION=?WS_VERSION '
      '  ,WS_DEBUG=?WS_DEBUG '
      '  ,WS_LANGUAGE=?WS_LANGUAGE '
      '  ,WS_ORDER_STATE=?WS_ORDER_STATE '
      '  ,TARIFA=?TARIFA '
      '  ,WEB_BACKOFFICE=?WEB_BACKOFFICE '
      '  ,MANTENER_DESCRIPCIONES=?MANTENER_DESCRIPCIONES '
      '  ,MANTENER_PRECIO=?MANTENER_PRECIO '
      '  ,CLIENTE_BASE=?CLIENTE_BASE '
      '  ,CUENTA_CLIENTE=?CUENTA_CLIENTE '
      '  ,IMPORTAR_ARTICULOS_VARIOS=?IMPORTAR_ARTICULOS_VARIOS '
      '  ,UTILIZA_MODULO_MEGAPRODUCT=?UTILIZA_MODULO_MEGAPRODUCT '
      '  ,DSN_MYSQL=?DSN_MYSQL '
      '  ,FAMILIA_PACK=?FAMILIA_PACK '
      '  ,USUARIO_WARNINGS=?USUARIO_WARNINGS '
      '  ,ARTICULO_DESCUENTO=?ARTICULO_DESCUENTO '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterInsert = QMConfPrestaShopAfterInsert
    AfterOpen = QMConfPrestaShopAfterOpen
    BeforeClose = QMConfPrestaShopBeforeClose
    BeforePost = QMConfPrestaShopBeforePost
    OnNewRecord = QMConfPrestaShopNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object QMConfPrestaShopID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConfPrestaShopTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMConfPrestaShopWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 200
    end
    object QMConfPrestaShopEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfPrestaShopCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfPrestaShopSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfPrestaShopACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfPrestaShopPREFIJO_ART: TFIBStringField
      DisplayLabel = 'Prefijo Art.'
      FieldName = 'PREFIJO_ART'
      Size = 15
    end
    object QMConfPrestaShopALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfPrestaShopAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO: TIntegerField
      DisplayLabel = 'Solo Cli. con Pedidos'
      FieldName = 'SOLO_CLIENTE_CON_PEDIDO'
    end
    object QMConfPrestaShopUTILIZA_MODULO_PAYPAL: TIntegerField
      DisplayLabel = 'Utiliza Mod. PayPal'
      FieldName = 'UTILIZA_MODULO_PAYPAL'
    end
    object QMConfPrestaShopART_SIN_CONTROL_STOCK: TIntegerField
      DisplayLabel = 'Importa articulos con Control de Stock desactivado'
      FieldName = 'ART_SIN_CONTROL_STOCK'
    end
    object QMConfPrestaShopUTILIZA_REF_PRESTAHOP: TIntegerField
      DisplayLabel = 'Utiliza Ref. Prestashop'
      FieldName = 'UTILIZA_REF_PRESTAHOP'
    end
    object QMConfPrestaShopVERSION_PRESTASHOP: TFIBStringField
      DisplayLabel = 'Version Prestashop'
      FieldName = 'VERSION_PRESTASHOP'
      Size = 15
    end
    object QMConfPrestaShopID_TIENDA_ARTICULOS: TIntegerField
      DisplayLabel = 'Id Tienda Art.'
      FieldName = 'ID_TIENDA_ARTICULOS'
    end
    object QMConfPrestaShopWS_URL: TFIBStringField
      DisplayLabel = 'WS URL'
      FieldName = 'WS_URL'
      Size = 256
    end
    object QMConfPrestaShopWS_KEY: TFIBStringField
      DisplayLabel = 'WS Token'
      FieldName = 'WS_KEY'
      Size = 256
    end
    object QMConfPrestaShopWS_VERSION: TFIBStringField
      DisplayLabel = 'WS Version'
      FieldName = 'WS_VERSION'
      Size = 15
    end
    object QMConfPrestaShopWS_DEBUG: TIntegerField
      DisplayLabel = 'WS Debug'
      FieldName = 'WS_DEBUG'
    end
    object QMConfPrestaShopWS_LANGUAGE: TIntegerField
      DisplayLabel = 'WS Idioma'
      FieldName = 'WS_LANGUAGE'
    end
    object QMConfPrestaShopWS_ORDER_STATE: TIntegerField
      DisplayLabel = 'WS Estado Orden'
      FieldName = 'WS_ORDER_STATE'
    end
    object QMConfPrestaShopTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMConfPrestaShopWEB_BACKOFFICE: TFIBStringField
      DisplayLabel = 'Web BackOffice'
      FieldName = 'WEB_BACKOFFICE'
      Size = 200
    end
    object QMConfPrestaShopMANTENER_DESCRIPCIONES: TIntegerField
      DisplayLabel = 'Mantener Desc.'
      FieldName = 'MANTENER_DESCRIPCIONES'
    end
    object QMConfPrestaShopMANTENER_PRECIO: TIntegerField
      DisplayLabel = 'Mantener Precio'
      FieldName = 'MANTENER_PRECIO'
    end
    object QMConfPrestaShopCLIENTE_BASE: TIntegerField
      DisplayLabel = 'Cliente Base'
      FieldName = 'CLIENTE_BASE'
    end
    object QMConfPrestaShopCUENTA_CLIENTE: TFIBStringField
      DisplayLabel = 'Cta. Cliente'
      FieldName = 'CUENTA_CLIENTE'
      Size = 15
    end
    object QMConfPrestaShopIMPORTAR_ARTICULOS_VARIOS: TIntegerField
      DisplayLabel = 'Importar Art. Varios'
      FieldName = 'IMPORTAR_ARTICULOS_VARIOS'
    end
    object QMConfPrestaShopDSN_MYSQL: TFIBStringField
      DisplayLabel = 'DSN MySQL'
      FieldName = 'DSN_MYSQL'
      Size = 60
    end
    object QMConfPrestaShopUTILIZA_MODULO_MEGAPRODUCT: TIntegerField
      DisplayLabel = 'Modulo Megaproduct'
      FieldName = 'UTILIZA_MODULO_MEGAPRODUCT'
    end
    object QMConfPrestaShopFAMILIA_PACK: TFIBStringField
      DisplayLabel = 'Familia Packs'
      FieldName = 'FAMILIA_PACK'
      Size = 5
    end
    object QMConfPrestaShopUSUARIO_WARNINGS: TIntegerField
      DisplayLabel = 'Usuario Warnings'
      FieldName = 'USUARIO_WARNINGS'
    end
    object QMConfPrestaShopARTICULO_DESCUENTO: TFIBStringField
      DisplayLabel = 'Art. Descuento'
      FieldName = 'ARTICULO_DESCUENTO'
      Size = 15
    end
  end
  object DSQMConfPrestaShop: TDataSource
    DataSet = QMConfPrestaShop
    Left = 256
    Top = 8
  end
  object QMConfPrestaShopSinc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_SINC'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_PRESTASHOP_SINC'
      'WHERE '
      'ID_CONFIGURACION = :ID'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_SINC'
      'SET'
      '  ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,ORDEN=?ORDEN '
      '  ,ULT_REGISTRO=?ULT_REGISTRO '
      '  ,ID_CONFIGURACION=?ID_CONFIGURACION '
      '  ,ACTIVO=?ACTIVO '
      '  ,TIPO=?TIPO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterPost = QMConfPrestaShopSincAfterPost
    BeforePost = QMConfPrestaShopSincBeforePost
    OnNewRecord = QMConfPrestaShopSincNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_SINC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
    object QMConfPrestaShopSincID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConfPrestaShopSincTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConfPrestaShopSincID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfPrestaShopSincULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfPrestaShopSincULT_REGISTRO: TIntegerField
      DisplayLabel = 'Ult. Registro'
      FieldName = 'ULT_REGISTRO'
    end
    object QMConfPrestaShopSincACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfPrestaShopSincORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMConfPrestaShopSincTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMConfPrestaShopSinc: TDataSource
    DataSet = QMConfPrestaShopSinc
    Left = 256
    Top = 56
  end
  object QMConfPrestaShopCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
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
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfPrestaShopClienteNewRecord
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
    object QMConfPrestaShopClienteID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfPrestaShopClienteID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMConfPrestaShopClienteID_CUSTOMER: TIntegerField
      DisplayLabel = 'Id Customer (Prestashop)'
      FieldName = 'ID_CUSTOMER'
    end
    object QMConfPrestaShopClienteULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinctronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfPrestaShopClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMConfPrestaShopClienteCLIENTEChange
    end
    object QMConfPrestaShopClienteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMConfPrestaShopClienteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSQMConfPrestaShopCliente: TDataSource
    DataSet = QMConfPrestaShopCliente
    Left = 256
    Top = 104
  end
  object QMConfPrestaShopClienteDir: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
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
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfPrestaShopClienteDirNewRecord
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
    object QMConfPrestaShopClienteDirID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfPrestaShopClienteDirID_ADDRESS: TIntegerField
      DisplayLabel = 'Id Address (Prestashop)'
      FieldName = 'ID_ADDRESS'
    end
    object QMConfPrestaShopClienteDirULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfPrestaShopClienteDirTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMConfPrestaShopClienteDirDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      OnChange = QMConfPrestaShopClienteDirDIRECCIONChange
    end
    object QMConfPrestaShopClienteDirNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMConfPrestaShopClienteDirDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMConfPrestaShopClienteDirCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMConfPrestaShopClienteDirCLIENTEChange
    end
  end
  object DSQMConfPrestaShopClienteDir: TDataSource
    DataSet = QMConfPrestaShopClienteDir
    Left = 256
    Top = 152
  end
  object QMConfPrestaShopArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONF_PRESTASHOP_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_A=?old_ID_A AND '
      '  ID_PRODUCT=?old_ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?old_ID_PRODUCT_ATTRIBUTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONF_PRESTASHOP_ARTICULO'
      
        '  (ID_CONFIGURACION,'#13#10'ID_A,ID_PRODUCT,ID_PRODUCT_ATTRIBUTE,ID_AT' +
        'TRIBUTE,ID_ATTRIBUTES,ID_STOCK_AVAILABLE,ULT_SINCRONIZACION,ARTI' +
        'CULO,TITULO,REFERENCIA,'#13#10'DESCRIPCION_CORTA,DESCRIPCION_LARGA,PRE' +
        'CIO,STOCK,TITULO_ARTICULO,IS_PACK)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_A,?ID_PRODUCT,?ID_PRODUCT_ATTRIBUTE,?' +
        'ID_ATTRIBUTE,?ID_ATTRIBUTES,?ID_STOCK_AVAILABLE,?ULT_SINCRONIZAC' +
        'ION,?ARTICULO,?TITULO,?REFERENCIA,'#13#10'?DESCRIPCION_CORTA,?DESCRIPC' +
        'ION_LARGA,?PRECIO,?STOCK,?TITULO_ARTICULO,?IS_PACK)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONF_PRESTASHOP_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_A=?old_ID_A AND '
      '  ID_PRODUCT=?old_ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?old_ID_PRODUCT_ATTRIBUTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONF_PRESTASHOP_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONF_PRESTASHOP_ARTICULO'
      'SET'
      '  ID_A=?new_ID_A '
      '  ,ID_PRODUCT=?new_ID_PRODUCT '
      '  ,ID_PRODUCT_ATTRIBUTE=?new_ID_PRODUCT_ATTRIBUTE '
      '  ,ID_ATTRIBUTE=?new_ID_ATTRIBUTE '
      '  ,ID_ATTRIBUTES=?new_ID_ATTRIBUTES '
      '  ,ID_STOCK_AVAILABLE=?ID_STOCK_AVAILABLE '
      '  ,ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,ARTICULO=?new_ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,DESCRIPCION_CORTA=?DESCRIPCION_CORTA '
      '  ,DESCRIPCION_LARGA=?DESCRIPCION_LARGA '
      '  ,PRECIO=?PRECIO '
      '  ,STOCK=?STOCK '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,IS_PACK=?IS_PACK '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_A=?old_ID_A AND '
      '  ID_PRODUCT=?old_ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?old_ID_PRODUCT_ATTRIBUTE ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfPrestaShopArticuloNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_A '
      'ID_PRODUCT '
      'ID_PRODUCT_ATTRIBUTE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONF_PRESTASHOP_ARTICULO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
    object QMConfPrestaShopArticuloID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfPrestaShopArticuloID_A: TIntegerField
      DisplayLabel = 'Id Articulo'
      FieldName = 'ID_A'
    end
    object QMConfPrestaShopArticuloID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product (Prestashop)'
      FieldName = 'ID_PRODUCT'
    end
    object QMConfPrestaShopArticuloID_PRODUCT_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Combinacion (Prestashop)'
      FieldName = 'ID_PRODUCT_ATTRIBUTE'
    end
    object QMConfPrestaShopArticuloID_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Atributo'
      FieldName = 'ID_ATTRIBUTE'
    end
    object QMConfPrestaShopArticuloID_ATTRIBUTES: TFIBStringField
      DisplayLabel = 'Id Atributos'
      FieldName = 'ID_ATTRIBUTES'
      Size = 25
    end
    object QMConfPrestaShopArticuloULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinctronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMConfPrestaShopArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMConfPrestaShopArticuloARTICULOChange
      Size = 15
    end
    object QMConfPrestaShopArticuloTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMConfPrestaShopArticuloID_STOCK_AVAILABLE: TIntegerField
      DisplayLabel = 'Id Stock Available'
      FieldName = 'ID_STOCK_AVAILABLE'
    end
    object QMConfPrestaShopArticuloREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMConfPrestaShopArticuloDESCRIPCION_CORTA: TBlobField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCION_CORTA'
      Size = 8
    end
    object QMConfPrestaShopArticuloDESCRIPCION_LARGA: TBlobField
      DisplayLabel = 'Desc. Larga'
      FieldName = 'DESCRIPCION_LARGA'
      Size = 8
    end
    object QMConfPrestaShopArticuloSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMConfPrestaShopArticuloPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMConfPrestaShopArticuloTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 60
    end
    object QMConfPrestaShopArticuloIS_PACK: TIntegerField
      DisplayLabel = 'Pack'
      FieldName = 'IS_PACK'
    end
  end
  object DSQMConfPrestaShopArticulo: TDataSource
    DataSet = QMConfPrestaShopArticulo
    Left = 256
    Top = 200
  end
  object QMConfPrestaShopTaxRuleGroup: TFIBTableSet
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
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMConfPrestaShopTaxRuleGroupNewRecord
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
    object QMConfPrestaShopTaxRuleGroupID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMConfPrestaShopTaxRuleGroupID: TIntegerField
      DisplayLabel = 'Id Tax'
      FieldName = 'ID'
    end
    object QMConfPrestaShopTaxRuleGroupDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMConfPrestaShopTaxRuleGroupPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMConfPrestaShopTaxRuleGroupTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMConfPrestaShopTaxRuleGroupTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMConfPrestaShopTaxRuleGroupP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
  end
  object DSQMConfPrestaShopTaxRuleGroup: TDataSource
    DataSet = QMConfPrestaShopTaxRuleGroup
    Left = 256
    Top = 248
  end
  object QMProductosPS: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_CONF_PRESTASHOP_PRODUCT'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_PRODUCT=?old_ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?old_ID_PRODUCT_ATTRIBUTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_CONF_PRESTASHOP_PRODUCT'
      
        '  (ID_CONFIGURACION,'#13#10'ID_PRODUCT,ID_ATTRIBUTE,ID_ATTRIBUTES,ID_P' +
        'RODUCT_ATTRIBUTE,ID_MANUFACTURER,ID_SUPPLIER,ID_CATEGORY_DEFAULT' +
        ',REFERENCE,SUPPLIER_REFERENCE,EAN13,'#13#10'UPC,ISBN,PRODUCT_NAME,DESC' +
        'RIPCIONCORTA,DESCRIPCIONLARGA,WEIGHT,PRICE,ID_TAX_RULES_GROUP,PR' +
        'ODUCT_ACTIVE,STOCK,'#13#10'ID_STOCK_AVAILABLE,DATE_UPD,RAW_XML,IS_PACK' +
        ',ID_A,ARTICULO,TITULO_LARGO)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_PRODUCT,?ID_ATTRIBUTE,?ID_ATTRIBUTES,' +
        '?ID_PRODUCT_ATTRIBUTE,?ID_MANUFACTURER,?ID_SUPPLIER,?ID_CATEGORY' +
        '_DEFAULT,?REFERENCE,?SUPPLIER_REFERENCE,?EAN13,'#13#10'?UPC,?ISBN,?PRO' +
        'DUCT_NAME,?DESCRIPCIONCORTA,?DESCRIPCIONLARGA,?WEIGHT,?PRICE,?ID' +
        '_TAX_RULES_GROUP,?PRODUCT_ACTIVE,?STOCK,'#13#10'?ID_STOCK_AVAILABLE,?D' +
        'ATE_UPD,?RAW_XML,?IS_PACK,?ID_A,?ARTICULO,?TITULO_LARGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_PRESTASHOP_PRODUCT'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT=?ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?ID_PRODUCT_ATTRIBUTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_SYS_CONF_PRESTASHOP_PRODUCT'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      'ORDER BY ID_PRODUCT, ID_PRODUCT_ATTRIBUTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_CONF_PRESTASHOP_PRODUCT'
      'SET'
      '  ID_A=?ID_A '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT=?ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?ID_PRODUCT_ATTRIBUTE ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMProductosPSNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_PRODUCT '
      'ID_PRODUCT_ATTRIBUTE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_CONF_PRESTASHOP_PRODUCT'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 296
    object QMProductosPSID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMProductosPSID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product (Prestashop)'
      FieldName = 'ID_PRODUCT'
    end
    object QMProductosPSID_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Atributo'
      FieldName = 'ID_ATTRIBUTE'
    end
    object QMProductosPSID_ATTRIBUTES: TFIBStringField
      DisplayLabel = 'Id Atributos'
      FieldName = 'ID_ATTRIBUTES'
      Size = 25
    end
    object QMProductosPSID_PRODUCT_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Combinacion (Prestashop)'
      FieldName = 'ID_PRODUCT_ATTRIBUTE'
    end
    object QMProductosPSID_MANUFACTURER: TIntegerField
      DisplayLabel = 'Id Fabricante'
      FieldName = 'ID_MANUFACTURER'
    end
    object QMProductosPSID_SUPPLIER: TIntegerField
      DisplayLabel = 'Id Proveedor'
      FieldName = 'ID_SUPPLIER'
    end
    object QMProductosPSID_CATEGORY_DEFAULT: TIntegerField
      DisplayLabel = 'Id Categ. Principal'
      FieldName = 'ID_CATEGORY_DEFAULT'
    end
    object QMProductosPSSUPPLIER_REFERENCE: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'SUPPLIER_REFERENCE'
      Size = 256
    end
    object QMProductosPSREFERENCE: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCE'
      Size = 256
    end
    object QMProductosPSEAN13: TFIBStringField
      FieldName = 'EAN13'
      Size = 25
    end
    object QMProductosPSUPC: TFIBStringField
      FieldName = 'UPC'
      Size = 25
    end
    object QMProductosPSISBN: TFIBStringField
      FieldName = 'ISBN'
      Size = 25
    end
    object QMProductosPSPRODUCT_NAME: TFIBStringField
      DisplayLabel = 'Nombre Producto'
      FieldName = 'PRODUCT_NAME'
      Size = 256
    end
    object QMProductosPSDESCRIPCIONCORTA: TMemoField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCIONCORTA'
      BlobType = ftMemo
      Size = 8
    end
    object QMProductosPSDESCRIPCIONLARGA: TMemoField
      DisplayLabel = 'Desc. Larga'
      FieldName = 'DESCRIPCIONLARGA'
      BlobType = ftMemo
      Size = 8
    end
    object QMProductosPSWEIGHT: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'WEIGHT'
    end
    object QMProductosPSPRICE: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRICE'
    end
    object QMProductosPSID_TAX_RULES_GROUP: TIntegerField
      DisplayLabel = 'Regla Impuesto'
      FieldName = 'ID_TAX_RULES_GROUP'
    end
    object QMProductosPSPRODUCT_ACTIVE: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'PRODUCT_ACTIVE'
    end
    object QMProductosPSSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMProductosPSID_STOCK_AVAILABLE: TIntegerField
      DisplayLabel = 'Id Stock Available'
      FieldName = 'ID_STOCK_AVAILABLE'
    end
    object QMProductosPSDATE_UPD: TDateTimeField
      DisplayLabel = 'Ult. Modif.'
      FieldName = 'DATE_UPD'
    end
    object QMProductosPSRAW_XML: TMemoField
      DisplayLabel = 'XML'
      FieldName = 'RAW_XML'
      BlobType = ftMemo
      Size = 8
    end
    object QMProductosPSID_A: TIntegerField
      DisplayLabel = 'Id Articulo'
      FieldName = 'ID_A'
    end
    object QMProductosPSARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMProductosPSARTICULOChange
      Size = 15
    end
    object QMProductosPSTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMProductosPSIS_PACK: TIntegerField
      DisplayLabel = 'Pack'
      FieldName = 'IS_PACK'
    end
  end
  object DSQMProductosPS: TDataSource
    DataSet = QMProductosPS
    Left = 256
    Top = 296
  end
  object QMOrdersPS: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_CONF_PRESTASHOP_ORDER'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_ORDER=?old_ID_ORDER ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_CONF_PRESTASHOP_ORDER'
      
        '  (ID_CONFIGURACION,'#13#10'ID_ORDER,CURRENT_STATE,CURRENT_STATE_DESCR' +
        'IPCION,CURRENT_STATE_COLOR_HEX,DATE_ADD,DATE_UPD,INVOICE_NUMBER,' +
        'INVOICE_DATE,DELIVERY_NUMBER,DELIVERY_DATE,'#13#10'REFERENCE,ID_ADDRES' +
        'S_DELIVERY,ID_ADDRESS_INVOICE,ID_CUSTOMER,ID_CARRIER,MODULE,SHIP' +
        'PING_NUMBER,PAYMENT,TOTAL_DISCOUNTS,TOTAL_PAID,'#13#10'TOTAL_PAID_TAX_' +
        'INCL,TOTAL_PAID_TAX_EXCL,TOTAL_SHIPPING,CARRIER_TAX_RATE,RAW_XML' +
        ',ID_S,EMPRESA,EJERCICIO,CANAL,SERIE,'#13#10'TIPO,RIG,CLIENTE,S_BASES,S' +
        '_CUOTA_IVA,S_CUOTA_RE,ESTADO)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_ORDER,?CURRENT_STATE,?CURRENT_STATE_D' +
        'ESCRIPCION,?CURRENT_STATE_COLOR_HEX,?DATE_ADD,?DATE_UPD,?INVOICE' +
        '_NUMBER,?INVOICE_DATE,?DELIVERY_NUMBER,?DELIVERY_DATE,'#13#10'?REFEREN' +
        'CE,?ID_ADDRESS_DELIVERY,?ID_ADDRESS_INVOICE,?ID_CUSTOMER,?ID_CAR' +
        'RIER,?MODULE,?SHIPPING_NUMBER,?PAYMENT,?TOTAL_DISCOUNTS,?TOTAL_P' +
        'AID,'#13#10'?TOTAL_PAID_TAX_INCL,?TOTAL_PAID_TAX_EXCL,?TOTAL_SHIPPING,' +
        '?CARRIER_TAX_RATE,?RAW_XML,?ID_S,?EMPRESA,?EJERCICIO,?CANAL,?SER' +
        'IE,'#13#10'?TIPO,?RIG,?CLIENTE,?S_BASES,?S_CUOTA_IVA,?S_CUOTA_RE,?ESTA' +
        'DO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_PRESTASHOP_ORDER'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_ORDER=?ID_ORDER ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_SYS_CONF_PRESTASHOP_ORDER'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      'ORDER BY ID_ORDER DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_CONF_PRESTASHOP_ORDER'
      'SET'
      '  CURRENT_STATE=?CURRENT_STATE '
      '  ,CURRENT_STATE_DESCRIPCION=?CURRENT_STATE_DESCRIPCION '
      '  ,CURRENT_STATE_COLOR_HEX=?CURRENT_STATE_COLOR_HEX '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,INVOICE_NUMBER=?INVOICE_NUMBER '
      '  ,INVOICE_DATE=?INVOICE_DATE '
      '  ,DELIVERY_NUMBER=?DELIVERY_NUMBER '
      '  ,DELIVERY_DATE=?DELIVERY_DATE '
      '  ,REFERENCE=?REFERENCE '
      '  ,ID_ADDRESS_DELIVERY=?ID_ADDRESS_DELIVERY '
      '  ,ID_ADDRESS_INVOICE=?ID_ADDRESS_INVOICE '
      '  ,ID_CUSTOMER=?ID_CUSTOMER '
      '  ,ID_CARRIER=?ID_CARRIER '
      '  ,MODULE=?MODULE '
      '  ,SHIPPING_NUMBER=?SHIPPING_NUMBER '
      '  ,PAYMENT=?PAYMENT '
      '  ,TOTAL_DISCOUNTS=?TOTAL_DISCOUNTS '
      '  ,TOTAL_PAID=?TOTAL_PAID '
      '  ,TOTAL_PAID_TAX_INCL=?TOTAL_PAID_TAX_INCL '
      '  ,TOTAL_PAID_TAX_EXCL=?TOTAL_PAID_TAX_EXCL '
      '  ,TOTAL_SHIPPING=?TOTAL_SHIPPING '
      '  ,CARRIER_TAX_RATE=?CARRIER_TAX_RATE '
      '  ,RAW_XML=?RAW_XML '
      '  ,ID_S=?ID_S '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,CLIENTE=?CLIENTE '
      '  ,S_BASES=?S_BASES '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,ESTADO=?ESTADO '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_ORDER=?ID_ORDER ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnCalcFields = QMOrdersPSCalcFields
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_ORDER ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_CONF_PRESTASHOP_ORDER'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 344
    object QMOrdersPSID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMOrdersPSID_ORDER: TIntegerField
      DisplayLabel = 'Id Order'
      FieldName = 'ID_ORDER'
    end
    object QMOrdersPSCURRENT_STATE: TIntegerField
      DisplayLabel = 'Curr. State'
      FieldName = 'CURRENT_STATE'
    end
    object QMOrdersPSDATE_ADD: TDateTimeField
      DisplayLabel = 'Date Add'
      FieldName = 'DATE_ADD'
    end
    object QMOrdersPSDATE_UPD: TDateTimeField
      DisplayLabel = 'Ult. Modif.'
      FieldName = 'DATE_UPD'
    end
    object QMOrdersPSINVOICE_NUMBER: TIntegerField
      DisplayLabel = 'Invoice Number'
      FieldName = 'INVOICE_NUMBER'
    end
    object QMOrdersPSINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      FieldName = 'INVOICE_DATE'
    end
    object QMOrdersPSDELIVERY_NUMBER: TIntegerField
      DisplayLabel = 'Delivery Number'
      FieldName = 'DELIVERY_NUMBER'
    end
    object QMOrdersPSDELIVERY_DATE: TDateTimeField
      DisplayLabel = 'Delivery Date'
      FieldName = 'DELIVERY_DATE'
    end
    object QMOrdersPSREFERENCE: TFIBStringField
      DisplayLabel = 'Reference'
      FieldName = 'REFERENCE'
      Size = 40
    end
    object QMOrdersPSID_ADDRESS_DELIVERY: TIntegerField
      DisplayLabel = 'Id Addr. Delivery'
      FieldName = 'ID_ADDRESS_DELIVERY'
    end
    object QMOrdersPSID_ADDRESS_INVOICE: TIntegerField
      DisplayLabel = 'Id Addr. Invoice'
      FieldName = 'ID_ADDRESS_INVOICE'
    end
    object QMOrdersPSID_CUSTOMER: TIntegerField
      DisplayLabel = 'Id Customer'
      FieldName = 'ID_CUSTOMER'
    end
    object QMOrdersPSID_CARRIER: TIntegerField
      DisplayLabel = 'Id Carrier'
      FieldName = 'ID_CARRIER'
    end
    object QMOrdersPSMODULE: TFIBStringField
      DisplayLabel = 'Module'
      FieldName = 'MODULE'
      Size = 40
    end
    object QMOrdersPSSHIPPING_NUMBER: TFIBStringField
      DisplayLabel = 'Shipping Number'
      FieldName = 'SHIPPING_NUMBER'
      Size = 40
    end
    object QMOrdersPSPAYMENT: TFIBStringField
      DisplayLabel = 'Payment'
      FieldName = 'PAYMENT'
      Size = 256
    end
    object QMOrdersPSTOTAL_DISCOUNTS: TFloatField
      DisplayLabel = 'Total Discount'
      FieldName = 'TOTAL_DISCOUNTS'
    end
    object QMOrdersPSTOTAL_PAID: TFloatField
      DisplayLabel = 'Total Paid'
      FieldName = 'TOTAL_PAID'
    end
    object QMOrdersPSTOTAL_PAID_TAX_INCL: TFloatField
      DisplayLabel = 'Total Paid (Tax Incl.)'
      FieldName = 'TOTAL_PAID_TAX_INCL'
    end
    object QMOrdersPSTOTAL_PAID_TAX_EXCL: TFloatField
      DisplayLabel = 'Total Paid (Tax Excl.)'
      FieldName = 'TOTAL_PAID_TAX_EXCL'
    end
    object QMOrdersPSTOTAL_SHIPPING: TFloatField
      DisplayLabel = 'Total Shipping'
      FieldName = 'TOTAL_SHIPPING'
    end
    object QMOrdersPSCARRIER_TAX_RATE: TFloatField
      DisplayLabel = 'Carrier Tax Rate'
      FieldName = 'CARRIER_TAX_RATE'
    end
    object QMOrdersPSRAW_XML: TMemoField
      DisplayLabel = 'XML'
      FieldName = 'RAW_XML'
      BlobType = ftMemo
      Size = 8
    end
    object QMOrdersPSID_S: TIntegerField
      DisplayLabel = 'Id. Doc.'
      FieldName = 'ID_S'
    end
    object QMOrdersPSEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdersPSEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOrdersPSCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOrdersPSSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMOrdersPSTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMOrdersPSRIG: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'RIG'
    end
    object QMOrdersPSCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMOrdersPSS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMOrdersPSS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMOrdersPSS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. RE'
      FieldName = 'S_CUOTA_RE'
    end
    object QMOrdersPSLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMOrdersPSESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMOrdersPSTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMOrdersPSCURRENT_STATE_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Curr. State Desc.'
      FieldName = 'CURRENT_STATE_DESCRIPCION'
      Size = 100
    end
    object QMOrdersPSCURRENT_STATE_COLOR_HEX: TFIBStringField
      DisplayLabel = 'Color Estado'
      FieldName = 'CURRENT_STATE_COLOR_HEX'
      Size = 15
    end
  end
  object DSQMOrdersPS: TDataSource
    DataSet = QMOrdersPS
    Left = 256
    Top = 344
  end
  object QMOrdersStatesPS: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_O_STATE'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_O_STATE'
      
        '  (ID_CONFIGURACION,'#13#10'ID,UNREMOVABLE,DELIVERY,HIDDEN,SEND_EMAIL,' +
        'MOD_NAME,INVOICE,COLOR_HEX,LOGABLE,SHIPPED,'#13#10'PAID,PDF_DELIVERY,P' +
        'DF_INVOICE,DELETED,DESCRIPCION,SINCRONIZAR_PEC,SINCRONIZAR_FAC,S' +
        'INCRONIZAR_MOV,TRASPASAR_FAC,ACTUALIZAR_ESTADO_PS)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID,?UNREMOVABLE,?DELIVERY,?HIDDEN,?SEND_' +
        'EMAIL,?MOD_NAME,?INVOICE,?COLOR_HEX,?LOGABLE,?SHIPPED,'#13#10'?PAID,?P' +
        'DF_DELIVERY,?PDF_INVOICE,?DELETED,?DESCRIPCION,?SINCRONIZAR_PEC,' +
        '?SINCRONIZAR_FAC,?SINCRONIZAR_MOV,?TRASPASAR_FAC,?ACTUALIZAR_EST' +
        'ADO_PS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_O_STATE'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_PRESTASHOP_O_STATE'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_O_STATE'
      'SET'
      '  UNREMOVABLE=?UNREMOVABLE '
      '  ,DELIVERY=?DELIVERY '
      '  ,HIDDEN=?HIDDEN '
      '  ,SEND_EMAIL=?SEND_EMAIL '
      '  ,MOD_NAME=?MOD_NAME '
      '  ,INVOICE=?INVOICE '
      '  ,COLOR_HEX=?COLOR_HEX '
      '  ,LOGABLE=?LOGABLE '
      '  ,SHIPPED=?SHIPPED '
      '  ,PAID=?PAID '
      '  ,PDF_DELIVERY=?PDF_DELIVERY '
      '  ,PDF_INVOICE=?PDF_INVOICE '
      '  ,DELETED=?DELETED '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,SINCRONIZAR_PEC=?SINCRONIZAR_PEC '
      '  ,SINCRONIZAR_FAC=?SINCRONIZAR_FAC '
      '  ,SINCRONIZAR_MOV=?SINCRONIZAR_MOV '
      '  ,TRASPASAR_FAC=?TRASPASAR_FAC '
      '  ,ACTUALIZAR_ESTADO_PS=?ACTUALIZAR_ESTADO_PS '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID=?ID ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnCalcFields = QMOrdersPSCalcFields
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_O_STATE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 392
    object QMOrdersStatesPSID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
      ReadOnly = True
    end
    object QMOrdersStatesPSID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ReadOnly = True
    end
    object QMOrdersStatesPSUNREMOVABLE: TIntegerField
      DisplayLabel = 'Unremovable'
      FieldName = 'UNREMOVABLE'
      ReadOnly = True
    end
    object QMOrdersStatesPSDELIVERY: TIntegerField
      DisplayLabel = 'Delivery'
      FieldName = 'DELIVERY'
      ReadOnly = True
    end
    object QMOrdersStatesPSHIDDEN: TIntegerField
      DisplayLabel = 'Hidden'
      FieldName = 'HIDDEN'
      ReadOnly = True
    end
    object QMOrdersStatesPSSEND_EMAIL: TIntegerField
      DisplayLabel = 'Send Email'
      FieldName = 'SEND_EMAIL'
      ReadOnly = True
    end
    object QMOrdersStatesPSMOD_NAME: TFIBStringField
      DisplayLabel = 'Module Name'
      FieldName = 'MOD_NAME'
      ReadOnly = True
      Size = 256
    end
    object QMOrdersStatesPSINVOICE: TIntegerField
      DisplayLabel = 'Invoice'
      FieldName = 'INVOICE'
      ReadOnly = True
    end
    object QMOrdersStatesPSCOLOR_HEX: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR_HEX'
      ReadOnly = True
      Size = 15
    end
    object QMOrdersStatesPSLOGABLE: TIntegerField
      DisplayLabel = 'Logable'
      FieldName = 'LOGABLE'
      ReadOnly = True
    end
    object QMOrdersStatesPSSHIPPED: TIntegerField
      DisplayLabel = 'shipped'
      FieldName = 'SHIPPED'
      ReadOnly = True
    end
    object QMOrdersStatesPSPAID: TIntegerField
      DisplayLabel = 'Paid'
      FieldName = 'PAID'
      ReadOnly = True
    end
    object QMOrdersStatesPSPDF_DELIVERY: TIntegerField
      DisplayLabel = 'PDF Delivery'
      FieldName = 'PDF_DELIVERY'
      ReadOnly = True
    end
    object QMOrdersStatesPSPDF_INVOICE: TIntegerField
      DisplayLabel = 'PDF Invoice'
      FieldName = 'PDF_INVOICE'
      ReadOnly = True
    end
    object QMOrdersStatesPSDELETED: TIntegerField
      DisplayLabel = 'Deleted'
      FieldName = 'DELETED'
      ReadOnly = True
    end
    object QMOrdersStatesPSNAME: TFIBStringField
      DisplayLabel = 'Name'
      FieldName = 'DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object QMOrdersStatesPSSINCRONIZAR_PEC: TIntegerField
      DisplayLabel = 'Sinc. Pedido'
      FieldName = 'SINCRONIZAR_PEC'
    end
    object QMOrdersStatesPSSINCRONIZAR_FAC: TIntegerField
      DisplayLabel = 'Sinc. Factura'
      FieldName = 'SINCRONIZAR_FAC'
    end
    object QMOrdersStatesPSSINCRONIZAR_MOV: TIntegerField
      DisplayLabel = 'Sinc. Movimiento'
      FieldName = 'SINCRONIZAR_MOV'
    end
    object QMOrdersStatesPSTRASPASAR_FAC: TIntegerField
      DisplayLabel = 'Trasp. Fac.'
      FieldName = 'TRASPASAR_FAC'
    end
    object QMOrdersStatesPSACTUALIZAR_ESTADO_PS: TIntegerField
      DisplayLabel = 'Act. Estado'
      FieldName = 'ACTUALIZAR_ESTADO_PS'
    end
  end
  object DSQMOrdersStatesPS: TDataSource
    DataSet = QMOrdersStatesPS
    Left = 256
    Top = 392
  end
  object xStockAvailable: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_CONF_PS_STOCK_AV'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_STOCK_AVAILABLE=?old_ID_STOCK_AVAILABLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_CONF_PS_STOCK_AV'
      
        '  (ID_CONFIGURACION,'#13#10'ID_STOCK_AVAILABLE,ID_PRODUCT,ID_PRODUCT_A' +
        'TTRIBUTE,ID_SHOP,ID_SHOP_GROUP,QUANTITY,DEPENDS_ON_STOCK,OUT_OF_' +
        'STOCK,LOCATION,ULT_SINCRONIZACION,'#13#10')'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_STOCK_AVAILABLE,?ID_PRODUCT,?ID_PRODU' +
        'CT_ATTRIBUTE,?ID_SHOP,?ID_SHOP_GROUP,?QUANTITY,?DEPENDS_ON_STOCK' +
        ',?OUT_OF_STOCK,?LOCATION,?ULT_SINCRONIZACION,'#13#10')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_PS_STOCK_AV'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_STOCK_AVAILABLE=?ID_STOCK_AVAILABLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_SYS_CONF_PS_STOCK_AV'
      'WHERE'
      '  ID_CONFIGURACION = :ID '
      'ORDER BY ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_STOCK_AVAILABLE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_CONF_PS_STOCK_AV'
      'SET'
      '  ID_PRODUCT=?ID_PRODUCT '
      '  ,ID_PRODUCT_ATTRIBUTE=?ID_PRODUCT_ATTRIBUTE '
      '  ,ID_SHOP=?ID_SHOP '
      '  ,ID_SHOP_GROUP=?ID_SHOP_GROUP '
      '  ,QUANTITY=?QUANTITY '
      '  ,DEPENDS_ON_STOCK=?DEPENDS_ON_STOCK '
      '  ,OUT_OF_STOCK=?OUT_OF_STOCK '
      '  ,LOCATION=?LOCATION '
      '  ,ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_STOCK_AVAILABLE=?ID_STOCK_AVAILABLE ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnCalcFields = xStockAvailableCalcFields
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_STOCK_AVAILABLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_CONF_PS_STOCK_AV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 440
    object xStockAvailableID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object xStockAvailableID_STOCK_AVAILABLE: TIntegerField
      DisplayLabel = 'Id Stock Available'
      FieldName = 'ID_STOCK_AVAILABLE'
    end
    object xStockAvailableID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product (Prestashop)'
      FieldName = 'ID_PRODUCT'
    end
    object xStockAvailableID_PRODUCT_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Combinacion (Prestashop)'
      FieldName = 'ID_PRODUCT_ATTRIBUTE'
    end
    object xStockAvailableID_SHOP: TIntegerField
      DisplayLabel = 'Id Shop'
      FieldName = 'ID_SHOP'
    end
    object xStockAvailableID_SHOP_GROUP: TIntegerField
      DisplayLabel = 'Id Shop Group'
      FieldName = 'ID_SHOP_GROUP'
    end
    object xStockAvailableQUANTITY: TFloatField
      DisplayLabel = 'Quantity'
      FieldName = 'QUANTITY'
    end
    object xStockAvailableDEPENDS_ON_STOCK: TIntegerField
      DisplayLabel = 'Depends On Stock'
      FieldName = 'DEPENDS_ON_STOCK'
    end
    object xStockAvailableOUT_OF_STOCK: TIntegerField
      DisplayLabel = 'Out Of Stock'
      FieldName = 'OUT_OF_STOCK'
    end
    object xStockAvailableLOCATION: TFIBStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      Size = 256
    end
    object xStockAvailableULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinctronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object xStockAvailableREFERENCE: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCE'
      Size = 256
    end
    object xStockAvailablePRODUCT_NAME: TFIBStringField
      DisplayLabel = 'Product Name'
      FieldName = 'PRODUCT_NAME'
      Size = 256
    end
    object xStockAvailableEAN13: TFIBStringField
      FieldName = 'EAN13'
      Size = 25
    end
    object xStockAvailableARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xStockAvailableID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xStockAvailableSTOCK: TFloatField
      DisplayLabel = 'Stock Almacen'
      FieldKind = fkCalculated
      FieldName = 'STOCK'
      Calculated = True
    end
    object xStockAvailableSTOCK_REAL: TFloatField
      DisplayLabel = 'Stock Real'
      FieldKind = fkCalculated
      FieldName = 'STOCK_REAL'
      Calculated = True
    end
    object xStockAvailablePEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. Cli.'
      FieldKind = fkCalculated
      FieldName = 'PEDIDOS_D_CLI'
      Calculated = True
    end
    object xStockAvailablePRODUCT_ACTIVE: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'PRODUCT_ACTIVE'
    end
  end
  object DSxStockAvailable: TDataSource
    DataSet = xStockAvailable
    Left = 256
    Top = 440
  end
  object QMPacks: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_CONF_PRESTASHOP_PACK'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_PRODUCT_PACK=?old_ID_PRODUCT_PACK AND '
      '  ID_PRODUCT_ITEM=?old_ID_PRODUCT_ITEM AND '
      '  ID_PRODUCT_ATTRIBUTE_ITEM=?old_ID_PRODUCT_ATTRIBUTE_ITEM ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_CONF_PRESTASHOP_PACK'
      
        '  (ID_CONFIGURACION,'#13#10'ID_PRODUCT_PACK,REFERENCE_PACK,PRODUCT_NAM' +
        'E_PACK,ID_PRODUCT_ITEM,ID_PRODUCT_ATTRIBUTE_ITEM,REFERENCE_ITEM,' +
        'PRODUCT_NAME_ITEM,QUANTITY)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_PRODUCT_PACK,?REFERENCE_PACK,?PRODUCT' +
        '_NAME_PACK,?ID_PRODUCT_ITEM,?ID_PRODUCT_ATTRIBUTE_ITEM,?REFERENC' +
        'E_ITEM,?PRODUCT_NAME_ITEM,?QUANTITY)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_PRESTASHOP_PACK'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT_PACK=?ID_PRODUCT_PACK AND '
      '  ID_PRODUCT_ITEM=?ID_PRODUCT_ITEM AND '
      '  ID_PRODUCT_ATTRIBUTE_ITEM=?ID_PRODUCT_ATTRIBUTE_ITEM ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_SYS_CONF_PRESTASHOP_PACK'
      'WHERE'
      '  ID_CONFIGURACION=?ID'
      
        'ORDER BY ID_PRODUCT_PACK, ID_PRODUCT_ITEM, ID_PRODUCT_ATTRIBUTE_' +
        'ITEM')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_CONF_PRESTASHOP_PACK'
      'SET'
      '  REFERENCE_PACK=?REFERENCE_PACK '
      '  ,PRODUCT_NAME_PACK=?PRODUCT_NAME_PACK '
      '  ,REFERENCE_ITEM=?REFERENCE_ITEM '
      '  ,PRODUCT_NAME_ITEM=?PRODUCT_NAME_ITEM '
      '  ,QUANTITY=?QUANTITY '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT_PACK=?ID_PRODUCT_PACK AND '
      '  ID_PRODUCT_ITEM=?ID_PRODUCT_ITEM AND '
      '  ID_PRODUCT_ATTRIBUTE_ITEM=?ID_PRODUCT_ATTRIBUTE_ITEM ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMPacksNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_PRODUCT_PACK '
      'ID_PRODUCT_ITEM '
      'ID_PRODUCT_ATTRIBUTE_ITEM ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_CONF_PRESTASHOP_PACK'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 488
    object QMPacksID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMPacksID_PRODUCT_PACK: TIntegerField
      DisplayLabel = 'Id Prod. Pack'
      FieldName = 'ID_PRODUCT_PACK'
    end
    object QMPacksREFERENCE_PACK: TFIBStringField
      DisplayLabel = 'Referencia Pack'
      FieldName = 'REFERENCE_PACK'
      Size = 256
    end
    object QMPacksPRODUCT_NAME_PACK: TFIBStringField
      DisplayLabel = 'Pack Name'
      FieldName = 'PRODUCT_NAME_PACK'
      Size = 256
    end
    object QMPacksID_PRODUCT_ITEM: TIntegerField
      DisplayLabel = 'Product Item '
      FieldName = 'ID_PRODUCT_ITEM'
    end
    object QMPacksID_PRODUCT_ATTRIBUTE_ITEM: TIntegerField
      DisplayLabel = 'Product Item Attr.'
      FieldName = 'ID_PRODUCT_ATTRIBUTE_ITEM'
    end
    object QMPacksREFERENCE_ITEM: TFIBStringField
      DisplayLabel = 'Reference Item'
      FieldName = 'REFERENCE_ITEM'
      Size = 256
    end
    object QMPacksPRODUCT_NAME_ITEM: TFIBStringField
      DisplayLabel = 'Item Name'
      FieldName = 'PRODUCT_NAME_ITEM'
      Size = 256
    end
    object QMPacksQUANTITY: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'QUANTITY'
    end
  end
  object DSQMPacks: TDataSource
    DataSet = QMPacks
    Left = 256
    Top = 488
  end
  object xMegacart: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_MEGAPRODD'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_MEGACART=?old_ID_MEGACART ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_MEGAPRODD'
      
        '  (ID_CONFIGURACION,'#13#10'ID_MEGACART,ID_CART,ID_PRODUCT,ID_PRODUCT_' +
        'ATTRIBUTE,QUANTITY)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_MEGACART,?ID_CART,?ID_PRODUCT,?ID_PRO' +
        'DUCT_ATTRIBUTE,?QUANTITY)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_MEGAPRODD'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_MEGACART=?ID_MEGACART ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_MEGAPRODD'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_MEGACART=?ID_MEGACART ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_MEGAPRODD'
      'SET'
      '  ID_CART=?ID_CART '
      '  ,ID_PRODUCT=?ID_PRODUCT '
      '  ,ID_PRODUCT_ATTRIBUTE=?ID_PRODUCT_ATTRIBUTE '
      '  ,QUANTITY=?QUANTITY '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_MEGACART=?ID_MEGACART ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMPacksNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_MEGACART ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_MEGAPRODD'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 536
    object xMegacartID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object xMegacartID_MEGACART: TIntegerField
      DisplayLabel = 'Id Megacart'
      FieldName = 'ID_MEGACART'
    end
    object xMegacartID_CART: TIntegerField
      DisplayLabel = 'Id Cart'
      FieldName = 'ID_CART'
    end
    object xMegacartID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product'
      FieldName = 'ID_PRODUCT'
    end
    object xMegacartID_PRODUCT_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id roduct Attribute'
      FieldName = 'ID_PRODUCT_ATTRIBUTE'
    end
    object xMegacartQUANTITY: TFloatField
      DisplayLabel = 'Quantity'
      FieldName = 'QUANTITY'
    end
  end
  object QMCategory: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_CONF_PS_CATEGORY'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_CATEGORY=?old_ID_CATEGORY ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_CONF_PS_CATEGORY'
      
        '  (ID_CONFIGURACION,'#13#10'ID_CATEGORY,ID_PARENT,CATEGORY_ACTIVE,ID_S' +
        'HOP_DEFAULT,IS_ROOT_CATEGORY,CATEGORY_POSITION,DATE_ADD,DATE_UPD' +
        ',NAME,DESCRIPTION,'#13#10'ID_FAMILIA,FAMILIA,TITULO_FAMILIA,ID_SUBFAMI' +
        'LIA,SUBFAMILIA,TITULO_SUBFAMILIA)'
      'VALUES'
      
        '  (?ID_CONFIGURACION,'#13#10'?ID_CATEGORY,?ID_PARENT,?CATEGORY_ACTIVE,' +
        '?ID_SHOP_DEFAULT,?IS_ROOT_CATEGORY,?CATEGORY_POSITION,?DATE_ADD,' +
        '?DATE_UPD,?NAME,?DESCRIPTION,'#13#10'?ID_FAMILIA,?FAMILIA,?TITULO_FAMI' +
        'LIA,?ID_SUBFAMILIA,?SUBFAMILIA,?TITULO_SUBFAMILIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_PS_CATEGORY'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CATEGORY=?ID_CATEGORY ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_CONF_PS_CATEGORY'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION '
      'ORDER BY ID_CATEGORY')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_CONF_PS_CATEGORY'
      'SET'
      '  ID_PARENT=?ID_PARENT '
      '  ,CATEGORY_ACTIVE=?CATEGORY_ACTIVE '
      '  ,ID_SHOP_DEFAULT=?ID_SHOP_DEFAULT '
      '  ,IS_ROOT_CATEGORY=?IS_ROOT_CATEGORY '
      '  ,CATEGORY_POSITION=?CATEGORY_POSITION '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,NAME=?NAME '
      '  ,DESCRIPTION=?DESCRIPTION '
      '  ,ID_FAMILIA=?ID_FAMILIA '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_SUBFAMILIA=?ID_SUBFAMILIA '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,TITULO_SUBFAMILIA=?TITULO_SUBFAMILIA '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CATEGORY=?ID_CATEGORY ')
    DataSource = DSQMConfPrestaShop
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    OnNewRecord = QMProductosPSNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_CATEGORY ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_CONF_PS_CATEGORY'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 584
    object QMCategoryID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMCategoryID_CATEGORY: TIntegerField
      DisplayLabel = 'Id Categ.'
      FieldName = 'ID_CATEGORY'
    end
    object QMCategoryID_PARENT: TIntegerField
      DisplayLabel = 'Id Parent Cat.'
      FieldName = 'ID_PARENT'
    end
    object QMCategoryCATEGORY_ACTIVE: TIntegerField
      DisplayLabel = 'Active'
      FieldName = 'CATEGORY_ACTIVE'
    end
    object QMCategoryID_SHOP_DEFAULT: TIntegerField
      DisplayLabel = 'Id Shop Default'
      FieldName = 'ID_SHOP_DEFAULT'
    end
    object QMCategoryIS_ROOT_CATEGORY: TIntegerField
      DisplayLabel = 'Is Root'
      FieldName = 'IS_ROOT_CATEGORY'
    end
    object QMCategoryCATEGORY_POSITION: TIntegerField
      DisplayLabel = 'Position'
      FieldName = 'CATEGORY_POSITION'
    end
    object QMCategoryDATE_ADD: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'DATE_ADD'
    end
    object QMCategoryDATE_UPD: TDateTimeField
      DisplayLabel = 'Ult. Modif.'
      FieldName = 'DATE_UPD'
    end
    object QMCategoryNAME: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NAME'
      Size = 256
    end
    object QMCategoryDESCRIPTION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPTION'
      Size = 256
    end
    object QMCategoryID_FAMILIA: TIntegerField
      DisplayLabel = 'Id Familia'
      FieldName = 'ID_FAMILIA'
    end
    object QMCategoryFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCategoryFAMILIAChange
      Size = 5
    end
    object QMCategoryTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Fam.'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCategoryID_SUBFAMILIA: TIntegerField
      DisplayLabel = 'Id Subfamilia'
      FieldName = 'ID_SUBFAMILIA'
    end
    object QMCategorySUBFAMILIA: TFIBStringField
      DisplayLabel = 'SubFamilia'
      FieldName = 'SUBFAMILIA'
      OnChange = QMCategorySUBFAMILIAChange
      Size = 5
    end
    object QMCategoryTITULO_SUBFAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Subfam.'
      FieldName = 'TITULO_SUBFAMILIA'
      Size = 40
    end
  end
  object DSQMCategory: TDataSource
    DataSet = QMCategory
    Left = 256
    Top = 584
  end
end
