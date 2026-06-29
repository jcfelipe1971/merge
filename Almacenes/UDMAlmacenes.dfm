object DMAlmacenes: TDMAlmacenes
  OldCreateOrder = False
  OnCreate = DMAlmacenesCreate
  OnDestroy = DataModuleDestroy
  Left = 486
  Top = 269
  Height = 558
  Width = 606
  object DSQMAlmacenes: TDataSource
    DataSet = QMAlmacenes
    Left = 176
    Top = 8
  end
  object xTipoAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_ALMACEN        '
      'WHERE TIPO=?TIPO       ')
    UniDirectional = False
    DataSource = DSQMAlmacenes
    Left = 48
    Top = 56
  end
  object DSxTipoAlmacen: TDataSource
    DataSet = xTipoAlmacen
    Left = 176
    Top = 56
  end
  object QMAlmacenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ALMACENES_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ALMACENES_CUENTAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,ALMACEN,TITULO,TIPO,TERCERO,DIRECCION' +
        ',AUTO_CONTIENE,DEPOSITO,CTROL_UBICACION,DEFECTO,ALMACEN_INTELIGE' +
        'NTE,SERIE_MOVIMIENTOS,CARPETA_IMPORTACION,CARPETA_EXPORTACION,AL' +
        'MACEN_ORIGEN,ALMACEN_DESTINO,ACTIVO,CTA_INVENTARIO,CTA_GASTOS,CT' +
        'A_INGRESOS,CTA_INVENTARIO_PGC,CTA_GASTOS_PGC,CTA_INGRESOS_PGC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?ALMACEN,?TITULO,?TIPO,?TERCERO,?D' +
        'IRECCION,?AUTO_CONTIENE,?DEPOSITO,?CTROL_UBICACION,?DEFECTO,?ALM' +
        'ACEN_INTELIGENTE,?SERIE_MOVIMIENTOS,?CARPETA_IMPORTACION,?CARPET' +
        'A_EXPORTACION,?ALMACEN_ORIGEN,?ALMACEN_DESTINO,?ACTIVO,?CTA_INVE' +
        'NTARIO,?CTA_GASTOS,?CTA_INGRESOS,?CTA_INVENTARIO_PGC,?CTA_GASTOS' +
        '_PGC,?CTA_INGRESOS_PGC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ALMACENES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ALMACENES_CUENTAS'
      
        'WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ' +
        '?CANAL'
      'ORDER BY ALMACEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ALMACENES_CUENTAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TIPO=?TIPO '
      '  ,TERCERO=?TERCERO '
      '  ,DIRECCION=?DIRECCION '
      '  ,AUTO_CONTIENE=?AUTO_CONTIENE '
      '  ,DEPOSITO=?DEPOSITO '
      '  ,CTROL_UBICACION=?CTROL_UBICACION '
      '  ,DEFECTO=?DEFECTO '
      '  ,ALMACEN_INTELIGENTE=?ALMACEN_INTELIGENTE '
      '  ,SERIE_MOVIMIENTOS=?SERIE_MOVIMIENTOS '
      '  ,CARPETA_IMPORTACION=?CARPETA_IMPORTACION '
      '  ,CARPETA_EXPORTACION=?CARPETA_EXPORTACION '
      '  ,ALMACEN_ORIGEN=?ALMACEN_ORIGEN '
      '  ,ALMACEN_DESTINO=?ALMACEN_DESTINO '
      '  ,ACTIVO=?ACTIVO '
      '  ,CTA_INVENTARIO=?CTA_INVENTARIO '
      '  ,CTA_GASTOS=?CTA_GASTOS '
      '  ,CTA_INGRESOS=?CTA_INGRESOS '
      '  ,CTA_INVENTARIO_PGC=?CTA_INVENTARIO_PGC '
      '  ,CTA_GASTOS_PGC=?CTA_GASTOS_PGC '
      '  ,CTA_INGRESOS_PGC=?CTA_INGRESOS_PGC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN ')
    AutoCalcFields = False
    AfterDelete = Graba
    AfterPost = Graba
    AfterScroll = QMAlmacenesAfterScroll
    BeforeEdit = QMAlmacenesBeforeEdit
    BeforePost = QMAlmacenesBeforePost
    OnNewRecord = QMAlmacenesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ALMACEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ALMACENES_CUENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMAlmacenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAlmacenesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMAlmacenesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMAlmacenesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMAlmacenesTIPOChange
      Size = 1
    end
    object QMAlmacenesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMAlmacenesTERCEROChange
    end
    object QMAlmacenesDIRECCION: TIntegerField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
    end
    object QMAlmacenesAUTO_CONTIENE: TIntegerField
      DisplayLabel = 'Auto contiene'
      FieldName = 'AUTO_CONTIENE'
    end
    object QMAlmacenesDEPOSITO: TIntegerField
      DisplayLabel = 'Deposito'
      FieldName = 'DEPOSITO'
    end
    object QMAlmacenesCTROL_UBICACION: TIntegerField
      DisplayLabel = 'Ctrl Ubicaci'#243'n'
      FieldName = 'CTROL_UBICACION'
    end
    object QMAlmacenesDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMAlmacenesALMACEN_INTELIGENTE: TIntegerField
      DisplayLabel = 'Almacen Inteligente'
      FieldName = 'ALMACEN_INTELIGENTE'
    end
    object QMAlmacenesCARPETA_IMPORTACION: TFIBStringField
      DisplayLabel = 'Carpeta Importacion'
      FieldName = 'CARPETA_IMPORTACION'
      Size = 200
    end
    object QMAlmacenesCARPETA_EXPORTACION: TFIBStringField
      DisplayLabel = 'Carpeta Exportacion'
      FieldName = 'CARPETA_EXPORTACION'
      Size = 200
    end
    object QMAlmacenesALMACEN_ORIGEN: TFIBStringField
      DisplayLabel = 'Alm. Origen'
      FieldName = 'ALMACEN_ORIGEN'
      Size = 3
    end
    object QMAlmacenesALMACEN_DESTINO: TFIBStringField
      DisplayLabel = 'Alm. Destino'
      FieldName = 'ALMACEN_DESTINO'
      Size = 3
    end
    object QMAlmacenesSERIE_MOVIMIENTOS: TFIBStringField
      DisplayLabel = 'Serie Mov.'
      FieldName = 'SERIE_MOVIMIENTOS'
      Size = 10
    end
    object QMAlmacenesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMAlmacenesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAlmacenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAlmacenesCTA_INVENTARIO: TFIBStringField
      DisplayLabel = 'Cta. Inventario'
      FieldName = 'CTA_INVENTARIO'
      Size = 15
    end
    object QMAlmacenesCTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CTA_GASTOS'
      Size = 15
    end
    object QMAlmacenesCTA_INGRESOS: TFIBStringField
      DisplayLabel = 'Cta. Ingresos'
      FieldName = 'CTA_INGRESOS'
      Size = 15
    end
    object QMAlmacenesCTA_INVENTARIO_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Inventario'
      FieldName = 'CTA_INVENTARIO_PGC'
    end
    object QMAlmacenesCTA_GASTOS_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Gastos'
      FieldName = 'CTA_GASTOS_PGC'
    end
    object QMAlmacenesCTA_INGRESOS_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Ingresos'
      FieldName = 'CTA_INGRESOS_PGC'
    end
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL FROM SYS_TERCEROS '
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSQMAlmacenes
    Left = 48
    Top = 104
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 176
    Top = 104
  end
  object EntornoFiltro: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 272
    Top = 8
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DIR_COMPLETA FROM SYS_TERCEROS_DIRECCIONES       '
      'WHERE TERCERO=?TERCERO AND DIRECCION=?DIRECCION')
    UniDirectional = False
    DataSource = DSQMAlmacenes
    Left = 48
    Top = 152
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 176
    Top = 152
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 272
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 104
  end
  object QMArticulosAlmacenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_ALMACENES_ART'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_ALMACENES_ART'
      
        '  (EMPRESA,CANAL,ALMACEN,ARTICULO,ID_A,STOCK_MINIMO,STOCK_MAXIMO' +
        ',ESTADO,TITULO,FAMILIA,TITULO_FAMILIA,P_COSTE)'
      'VALUES'
      
        '  (?EMPRESA,?CANAL,?ALMACEN,?ARTICULO,?ID_A,?STOCK_MINIMO,?STOCK' +
        '_MAXIMO,?ESTADO,?TITULO,?FAMILIA,?TITULO_FAMILIA,?P_COSTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_ALMACENES_ART'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ALMACENES_ART'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'ALMACEN=?ALMACEN'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_ALMACENES_ART'
      'SET'
      '  ID_A=?ID_A '
      '  ,STOCK_MINIMO=?STOCK_MINIMO '
      '  ,STOCK_MAXIMO=?STOCK_MAXIMO '
      '  ,ESTADO=?ESTADO '
      '  ,TITULO=?TITULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,P_COSTE=?P_COSTE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_ALMACENES_ART'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 200
    object QMArticulosAlmacenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object QMArticulosAlmacenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      ReadOnly = True
    end
    object QMArticulosAlmacenesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      ReadOnly = True
      Size = 3
    end
    object QMArticulosAlmacenesARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object QMArticulosAlmacenesSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock M'#237'nimo'
      FieldName = 'STOCK_MINIMO'
    end
    object QMArticulosAlmacenesSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock M'#225'ximo'
      FieldName = 'STOCK_MAXIMO'
    end
    object QMArticulosAlmacenesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
      ReadOnly = True
    end
    object QMArticulosAlmacenesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 256
    end
    object QMArticulosAlmacenesESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 1
    end
    object QMArticulosAlmacenesFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArticulosAlmacenesTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Fam.'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMArticulosAlmacenesP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMArticulosAlmacenesALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
  end
  object DSQMArticulosAlmacenes: TDataSource
    DataSet = QMArticulosAlmacenes
    Left = 176
    Top = 200
  end
  object DSxMovStockAlmacen: TDataSource
    DataSet = xMovStockAlmacen
    Left = 176
    Top = 248
  end
  object xMovStockAlmacen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_MOV_STOCKS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  N_MOV_STOCK=?old_N_MOV_STOCK ')
    InsertSQL.Strings = (
      'INSERT INTO ART_MOV_STOCKS'
      
        '  (UNIDADES_EXT,FECHA,UNIDADES,PRECIO,PRECIO_SIN_DTO,ENTRADA,N_M' +
        'OV_STOCK,DOC_NUMERO,DOC_SERIE,MOV_VIRTUAL,ID_MOV_STOCKS,ID_A,DEF' +
        'INITIVO,CANAL,ACTIVO,EJERCICIO,EMPRESA,PERIODO,COMENTARIO,ALMACE' +
        'N,ARTICULO,TIPO_OPER,ORIGEN)'
      'VALUES'
      
        '  (?UNIDADES_EXT,?FECHA,?UNIDADES,?PRECIO,?PRECIO_SIN_DTO,?ENTRA' +
        'DA,?N_MOV_STOCK,?DOC_NUMERO,?DOC_SERIE,?MOV_VIRTUAL,?ID_MOV_STOC' +
        'KS,?ID_A,?DEFINITIVO,?CANAL,?ACTIVO,?EJERCICIO,?EMPRESA,?PERIODO' +
        ',?COMENTARIO,?ALMACEN,?ARTICULO,?TIPO_OPER,?ORIGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  N_MOV_STOCK=?N_MOV_STOCK ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_MOV_STOCKS'
      'WHERE '
      'EMPRESA  = ?EMPRESA AND'
      'ALMACEN   =?ALMACEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_MOV_STOCKS'
      'SET'
      '  UNIDADES_EXT=?UNIDADES_EXT '
      '  ,FECHA=?FECHA '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,PRECIO_SIN_DTO=?PRECIO_SIN_DTO '
      '  ,ENTRADA=?ENTRADA '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,MOV_VIRTUAL=?MOV_VIRTUAL '
      '  ,ID_MOV_STOCKS=?ID_MOV_STOCKS '
      '  ,ID_A=?ID_A '
      '  ,DEFINITIVO=?DEFINITIVO '
      '  ,ACTIVO=?ACTIVO '
      '  ,PERIODO=?PERIODO '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TIPO_OPER=?TIPO_OPER '
      '  ,ORIGEN=?ORIGEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  N_MOV_STOCK=?N_MOV_STOCK ')
    DataSource = DSQMAlmacenes
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'N_MOV_STOCK ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_MOV_STOCKS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 248
    object xMovStockAlmacenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMovStockAlmacenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMovStockAlmacenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMovStockAlmacenN_MOV_STOCK: TIntegerField
      DisplayLabel = 'N Mov Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object xMovStockAlmacenPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xMovStockAlmacenALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xMovStockAlmacenARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xMovStockAlmacenTIPO_OPER: TFIBStringField
      DisplayLabel = 'Tipo Operaci'#243'n'
      FieldName = 'TIPO_OPER'
      Size = 1
    end
    object xMovStockAlmacenFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xMovStockAlmacenCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object xMovStockAlmacenUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xMovStockAlmacenPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xMovStockAlmacenORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object xMovStockAlmacenIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xMovStockAlmacenDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc N'#250'mero'
      FieldName = 'DOC_NUMERO'
    end
    object xMovStockAlmacenDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xMovStockAlmacenENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xMovStockAlmacenACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xMovStockAlmacenUNIDADES_EXT: TFloatField
      DisplayLabel = 'Unidades Extendidas'
      FieldName = 'UNIDADES_EXT'
    end
    object xMovStockAlmacenPRECIO_SIN_DTO: TFloatField
      DisplayLabel = 'Precio Sin Descuento'
      FieldName = 'PRECIO_SIN_DTO'
    end
    object xMovStockAlmacenMOV_VIRTUAL: TIntegerField
      DisplayLabel = 'Mov Virtual'
      FieldName = 'MOV_VIRTUAL'
    end
    object xMovStockAlmacenID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xMovStockAlmacenID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object xMovStockAlmacenDEFINITIVO: TIntegerField
      DisplayLabel = 'Definitivo'
      FieldName = 'DEFINITIVO'
    end
  end
  object xStockEliminadoAlmacen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_ALMACENES_ART_BOR'
      'WHERE '
      'EMPRESA  = ?EMPRESA AND'
      'CANAL = ?CANAL AND'
      'ALMACEN = ?ALMACEN ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_ALMACENES_ART_BOR'
    UpdateTransaction = TUpdate
    Left = 48
    Top = 296
    object xStockEliminadoAlmacenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xStockEliminadoAlmacenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xStockEliminadoAlmacenALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xStockEliminadoAlmacenARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xStockEliminadoAlmacenID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSxStockEliminadoAlmacen: TDataSource
    DataSet = xStockEliminadoAlmacen
    Left = 176
    Top = 296
  end
  object QMArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT A.UNIDADES, U.TITULO AS TITULO_UNIDADES '
      'FROM ART_ARTICULOS A'
      'JOIN SYS_UNIDADES_ARTICULOS U'
      'ON A.UNIDADES=U.TIPO'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'ARTICULO=?ARTICULO')
    SelectSQL.Strings = (
      'SELECT A.UNIDADES, U.TITULO AS TITULO_UNIDADES '
      'FROM ART_ARTICULOS A'
      'JOIN SYS_UNIDADES_ARTICULOS U'
      'ON A.UNIDADES=U.TIPO'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMArticulosAlmacenes
    Plan.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'ARTICULO=?ARTICULO')
    Left = 368
    Top = 296
    object QMArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object QMArticulosTITULO_UNIDADES: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_UNIDADES'
      Size = 25
    end
  end
  object xUbicaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ALMACENES_UBICACIONES'
      'WHERE EMPRESA = ?EMPRESA AND ALMACEN = ?ALMACEN'
      'ORDER BY COMPOSICION')
    UniDirectional = False
    DataSource = DSQMAlmacenes
    AfterScroll = xUbicacionesAfterScroll
    Left = 48
    Top = 344
    object xUbicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xUbicacionesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xUbicacionesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object xUbicacionesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object xUbicacionesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object xUbicacionesPOSICION: TFIBStringField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'POSICION'
      Size = 3
    end
    object xUbicacionesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xUbicacionesVOLUMEN_MAX: TFloatField
      DisplayLabel = 'Vol. Max.'
      FieldName = 'VOLUMEN_MAX'
    end
    object xUbicacionesDIAMETRO_MAX: TFloatField
      DisplayLabel = 'Diametro Max'
      FieldName = 'DIAMETRO_MAX'
    end
    object xUbicacionesPESO_MAX: TFloatField
      DisplayLabel = 'Peso Max'
      FieldName = 'PESO_MAX'
    end
    object xUbicacionesVOLUMEN_ACC: TFloatField
      DisplayLabel = 'Vol.  Acc.'
      FieldName = 'VOLUMEN_ACC'
    end
    object xUbicacionesPESO_ACC: TFloatField
      DisplayLabel = 'Peso Acc'
      FieldName = 'PESO_ACC'
    end
    object xUbicacionesDIAMETRO_ACC: TFloatField
      DisplayLabel = 'Di'#225'metro Acc'
      FieldName = 'DIAMETRO_ACC'
    end
    object xUbicacionesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicaci'#243'n'
      FieldName = 'ID_UBICACION'
    end
    object xUbicacionesCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composici'#243'n'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xUbicacionesGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object xUbicacionesUNIDADES_ACC: TFloatField
      DisplayLabel = 'Unidades Acc'
      FieldName = 'UNIDADES_ACC'
    end
    object xUbicacionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xUbicacionesSECTOR: TFIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 5
    end
    object xUbicacionesDISPONIBLE: TIntegerField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
  object DSxUbicaciones: TDataSource
    DataSet = xUbicaciones
    Left = 176
    Top = 344
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_STOCK_POR_UBICACION('
      '?ENTRADA,'
      '?EMPRESA,'
      '?CANAL,'
      '?UBICACION_DESDE,'
      '?UBICACION_HASTA,'
      '?ARTICULO_DESDE,'
      '?ARTICULO_HASTA)')
    UniDirectional = False
    AfterScroll = xArticulosAfterScroll
    Left = 48
    Top = 392
    object xArticulosENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArticulosSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object xArticulosEXISTENCIAS: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'EXISTENCIAS'
    end
    object xArticulosCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xArticulosTITULO_UBICACION: TFIBStringField
      DisplayLabel = 'Titulo Ubic.'
      FieldName = 'TITULO_UBICACION'
      Size = 60
    end
    object xArticulosTITULO_ARTIC: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO_ARTIC'
      Size = 256
    end
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
  end
  object xArticuloLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_STOCK_LOTE('
      '?EMPRESA,'
      '?ARTICULO,'
      '?CANAL,'
      '?ALMACEN,'
      '?ID_A_UBICACION)')
    UniDirectional = False
    Left = 48
    Top = 448
    object xArticuloLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticuloLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArticuloLoteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticuloLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xArticuloLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xArticuloLoteCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xArticuloLoteF_ENVASADO: TDateTimeField
      DisplayLabel = 'F. Env.'
      FieldName = 'F_ENVASADO'
    end
    object xArticuloLoteF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'F. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object xArticuloLoteF_FABRICACION: TDateTimeField
      DisplayLabel = 'F. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object xArticuloLoteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticuloLoteAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object xArticuloLoteCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xArticuloLotePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xArticuloLoteID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xArticuloLoteALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArticuloLoteSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object xArticuloLoteID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object xArticuloLoteID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art. Ubic.'
      FieldName = 'ID_A_UBICACION'
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 176
    Top = 392
  end
  object DSxArticuloLote: TDataSource
    DataSet = xArticuloLote
    Left = 176
    Top = 440
  end
  object xStocks: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT T.*, A.FABRICANTE, TER.NOMBRE_R_SOCIAL AS TITULO_FABRICAN' +
        'TE, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5,'
      '       A.ALFA_6, A.ALFA_7, A.ALFA_8, --'
      '       COALESCE((SELECT FIRST 1 B.BARRAS'
      '                 FROM ART_ARTICULOS_BARRAS B'
      '                 WHERE'
      '                 B.EMPRESA = T.EMPRESA AND'
      '                 B.ARTICULO = T.ARTICULO'
      '                 ORDER BY B.TIPO), '#39#39') AS BARRAS'
      'FROM TMP_ART_ACUMULA_STOCKS T'
      
        'JOIN ART_ARTICULOS A ON T.EMPRESA = A.EMPRESA AND T.ARTICULO = A' +
        '.ARTICULO'
      'JOIN SYS_TERCEROS TER ON A.FABRICANTE = TER.TERCERO'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.ALMACEN = :ALMACEN AND'
      'T.CANAL = :CANAL AND'
      'T.ARTICULO = :ARTICULO AND'
      'T.ENTRADA = :ENTRADA')
    SelectSQL.Strings = (
      
        'SELECT T.*, A.FABRICANTE, TER.NOMBRE_R_SOCIAL AS TITULO_FABRICAN' +
        'TE, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5,'
      '       A.ALFA_6, A.ALFA_7, A.ALFA_8, --'
      '       COALESCE((SELECT FIRST 1 B.BARRAS'
      '                 FROM ART_ARTICULOS_BARRAS B'
      '                 WHERE'
      '                 B.EMPRESA = T.EMPRESA AND'
      '                 B.ARTICULO = T.ARTICULO'
      '                 ORDER BY B.TIPO), '#39#39') AS BARRAS'
      'FROM TMP_ART_ACUMULA_STOCKS T'
      
        'JOIN ART_ARTICULOS A ON T.EMPRESA = A.EMPRESA AND T.ARTICULO = A' +
        '.ARTICULO'
      'JOIN SYS_TERCEROS TER ON A.FABRICANTE = TER.TERCERO'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.ENTRADA = :ENTRADA'
      'ORDER BY T.ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMAlmacenes
    AfterDelete = Graba
    AfterPost = Graba
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_ART_ACUMULA_STOCKS'
    UpdateTransaction = TLocal
    Left = 368
    Top = 56
    object xStocksEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xStocksALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xStocksCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xStocksARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xStocksTITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xStocksFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xStocksTITULO_FAM: TFIBStringField
      DisplayLabel = 'Titulo Familia'
      FieldName = 'TITULO_FAM'
      Size = 40
    end
    object xStocksSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object xStocksSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object xStocksEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object xStocksPEDIDOS_D_CLIENTE: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLIENTE'
    end
    object xStocksPEDIDOS_D_PROVEEDOR: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_D_PROVEEDOR'
    end
    object xStocksRESERVADAS: TFloatField
      DisplayLabel = 'Reserv.'
      FieldName = 'RESERVADAS'
    end
    object xStocksP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xStocksPMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object xStocksENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xStocksFABRICANTE: TIntegerField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
    end
    object xStocksTITULO_FABRICANTE: TFIBStringField
      DisplayLabel = 'Ttitulo Fabricante'
      FieldName = 'TITULO_FABRICANTE'
      Size = 60
    end
    object xStocksBARRAS: TFIBStringField
      DisplayLabel = 'Barras'
      FieldName = 'BARRAS'
      Size = 25
    end
    object xStocksALFA_1: TFIBStringField
      DisplayLabel = 'Campo 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xStocksALFA_2: TFIBStringField
      DisplayLabel = 'Campo 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xStocksALFA_3: TFIBStringField
      DisplayLabel = 'Campo 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xStocksALFA_4: TFIBStringField
      DisplayLabel = 'Campo 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xStocksALFA_5: TFIBStringField
      DisplayLabel = 'Campo 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xStocksALFA_6: TFIBStringField
      DisplayLabel = 'Campo 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object xStocksALFA_7: TFIBStringField
      DisplayLabel = 'Campo 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object xStocksALFA_8: TFIBStringField
      DisplayLabel = 'Campo 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSxStocks: TDataSource
    DataSet = xStocks
    Left = 456
    Top = 56
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 368
    Top = 104
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 368
    Top = 152
  end
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA <> ?FAMILIA')
    Transaction = TLocal
    AutoTrans = True
    Left = 368
    Top = 200
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA <> ?FAMILIA'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 368
    Top = 248
  end
  object frAlmStocks: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Diario de Stock de Almacen'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 368
    Top = 8
    ReportForm = {19000000}
  end
  object frxAlmStocks: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 456
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBDxStocks: TfrDBDataSet
    DataSet = xStocks
    Left = 536
    Top = 56
  end
end
