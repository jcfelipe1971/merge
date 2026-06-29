object DMOrdenProduccion: TDMOrdenProduccion
  OldCreateOrder = False
  OnCreate = DMOrdenProduccionCreate
  OnDestroy = DMOrdenProduccionDestroy
  Left = 351
  Top = 265
  Height = 474
  Width = 479
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 392
    Top = 8
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 160
    Top = 56
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 160
    Top = 104
  end
  object QMOrdenProd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NORDEN=?old_NORDEN AND'
      '  SERIE=?old_SERIE')
    InsertSQL.Strings = (
      'INSERT INTO ART_ORDENES_PRODUCCION'
      
        '  (UNIDADES,CANT_ORDENADA,CANT_ESPERADA,CANT_FINAL,FECHA_ENTREGA' +
        ',FECHA_INICIO,FECHA_INICIO_PROD,NORDEN,SERIE,PEDIDO,EMPRESA,EJER' +
        'CICIO,CANAL,ESTADO,LINEA,ESCANDALLO,PRIORIDAD,P_MERMA,MATERIAL,A' +
        'RTICULO,ALMACEN,FECHA_ORDEN,TERCERO_OPERARIO,FECHA_CIERRE)'
      'VALUES'
      
        '  (?UNIDADES,?CANT_ORDENADA,?CANT_ESPERADA,?CANT_FINAL,?FECHA_EN' +
        'TREGA,?FECHA_INICIO,?FECHA_INICIO_PROD,?NORDEN,?SERIE,?PEDIDO,?E' +
        'MPRESA,?EJERCICIO,?CANAL,?ESTADO,?LINEA,?ESCANDALLO,?PRIORIDAD,?' +
        'P_MERMA,?MATERIAL,?ARTICULO,?ALMACEN,?FECHA_ORDEN,?TERCERO_OPERA' +
        'RIO,?FECHA_CIERRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN AND '
      '  SERIE=?SERIE')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ORDENES_PRODUCCION'
      
        'WHERE EMPRESA=?EMPRESA AND ((EJERCICIO=?EJERCICIO) or (EJERCICIO' +
        '=?EJERCICIO-1)) AND'
      'CANAL=?CANAL AND SERIE=?SERIE'
      'ORDER BY EJERCICIO,SERIE,NORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ORDENES_PRODUCCION'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,CANT_ORDENADA=?CANT_ORDENADA '
      '  ,CANT_ESPERADA=?CANT_ESPERADA '
      '  ,CANT_FINAL=?CANT_FINAL '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_INICIO_PROD=?FECHA_INICIO_PROD '
      '  ,PEDIDO=?PEDIDO '
      '  ,ESTADO=?ESTADO '
      '  ,LINEA=?LINEA '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,P_MERMA=?P_MERMA '
      '  ,MATERIAL=?MATERIAL '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN=?ALMACEN '
      '  ,FECHA_ORDEN=?FECHA_ORDEN '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,TERCERO_OPERARIO=?TERCERO_OPERARIO'
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN AND '
      '  SERIE=?SERIE ')
    AfterOpen = QMOrdenProdAfterOpen
    BeforePost = QMOrdenProdBeforePost
    OnNewRecord = QMOrdenProdNewRecord
    OnPostError = QMOrdenProdPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NORDEN '
      'SERIE'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ORDENES_PRODUCCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMOrdenProdEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdenProdEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOrdenProdCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOrdenProdNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object QMOrdenProdESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      OnChange = QMOrdenProdESTADOChange
    end
    object QMOrdenProdSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      OnChange = QMOrdenProdSERIEChange
      Size = 10
    end
    object QMOrdenProdPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMOrdenProdLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
      OnChange = QMOrdenProdLINEAChange
    end
    object QMOrdenProdARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMOrdenProdARTICULOChange
      Size = 15
    end
    object QMOrdenProdUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMOrdenProdUNIDADESChange
    end
    object QMOrdenProdALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      OnChange = QMOrdenProdALMACENChange
      Size = 3
    end
    object QMOrdenProdESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMOrdenProdPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMOrdenProdP_MERMA: TFloatField
      DisplayLabel = '% Merma'
      FieldName = 'P_MERMA'
    end
    object QMOrdenProdCANT_ORDENADA: TFloatField
      DisplayLabel = 'Cant. Ordenada'
      FieldName = 'CANT_ORDENADA'
    end
    object QMOrdenProdCANT_ESPERADA: TFloatField
      DisplayLabel = 'Cant. Esperada'
      FieldName = 'CANT_ESPERADA'
    end
    object QMOrdenProdCANT_FINAL: TFloatField
      DisplayLabel = 'Cant. Final'
      FieldName = 'CANT_FINAL'
    end
    object QMOrdenProdFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
      OnChange = QMOrdenProdFECHA_ENTREGAChange
    end
    object QMOrdenProdFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
      OnChange = QMOrdenProdFECHA_INICIOChange
    end
    object QMOrdenProdFECHA_INICIO_PROD: TDateTimeField
      DisplayLabel = 'Fec. Ini. Prod.'
      FieldName = 'FECHA_INICIO_PROD'
      OnChange = QMOrdenProdFECHA_INICIO_PRODChange
    end
    object QMOrdenProdMATERIAL: TIntegerField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
      OnChange = QMOrdenProdMATERIALChange
    end
    object QMOrdenProdFECHA_ORDEN: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORDEN'
    end
    object QMOrdenProdFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMOrdenProdTERCERO_OPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'TERCERO_OPERARIO'
      OnChange = QMProcesosOPERARIOChange
    end
    object QMOrdenProdNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMOrdenProd: TDataSource
    DataSet = QMOrdenProd
    Left = 160
    Top = 8
  end
  object DSxMaterial: TDataSource
    DataSet = xMaterial
    Left = 160
    Top = 152
  end
  object DSxEstados: TDataSource
    DataSet = xEstados
    Left = 160
    Top = 248
  end
  object DSxAlmacenes: TDataSource
    DataSet = xAlmacenes
    Left = 160
    Top = 296
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE,TITULO FROM GEN_SERIES'
      'WHERE EMPRESA=?EMPRESA AND SERIE=?SERIE')
    UniDirectional = False
    DataSource = DSQMOrdenProd
    Left = 48
    Top = 56
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMOrdenProd
    Left = 48
    Top = 104
  end
  object xMaterial: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO FROM SYS_TIPO_MATERIAL'
      'WHERE TIPO=?MATERIAL')
    UniDirectional = False
    DataSource = DSQMOrdenProd
    Left = 48
    Top = 152
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_ESTADO_PRODUCCION'
      'WHERE ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSQMOrdenProd
    Left = 48
    Top = 248
  end
  object xAlmacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ALMACEN,TITULO,EMPRESA FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN')
    UniDirectional = False
    DataSource = DSQMOrdenProd
    Left = 48
    Top = 296
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMOrdenProd
    Left = 288
    Top = 8
  end
  object QMOrdenProd_lotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ORDENES_PRODUCCION_LOTES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  NORDEN=?old_NORDEN AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ORDENES_PRODUCCION_LOTES'
      
        '  (LINEA,CANTIDAD,F_CADUCIDAD,F_ENVASADO,F_FABRICACION,N_SERIE,L' +
        'OTE,NORDEN,CLASIFICACION,CANAL,EJERCICIO,EMPRESA,ALMACEN,ARTICUL' +
        'O,TIPO)'
      'VALUES'
      
        '  (?LINEA,?CANTIDAD,?F_CADUCIDAD,?F_ENVASADO,?F_FABRICACION,?N_S' +
        'ERIE,?LOTE,?NORDEN,?CLASIFICACION,?CANAL,?EJERCICIO,?EMPRESA,?AL' +
        'MACEN,?ARTICULO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION_LOTES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  NORDEN=?NORDEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ORDENES_PRODUCCION_LOTES'
      'WHERE (EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               NORDEN=?NORDEN)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ORDENES_PRODUCCION_LOTES'
      'SET'
      '  CANTIDAD=?CANTIDAD '
      '  ,F_CADUCIDAD=?F_CADUCIDAD '
      '  ,F_ENVASADO=?F_ENVASADO '
      '  ,F_FABRICACION=?F_FABRICACION '
      '  ,N_SERIE=?N_SERIE '
      '  ,LOTE=?LOTE '
      '  ,CLASIFICACION=?CLASIFICACION '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  NORDEN=?NORDEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMOrdenProd_lotesAfterOpen
    ClavesPrimarias.Strings = (
      'LINEA '
      'NORDEN '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ORDENES_PRODUCCION_LOTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 344
    object QMOrdenProd_lotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdenProd_lotesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOrdenProd_lotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOrdenProd_lotesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMOrdenProd_lotesNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object QMOrdenProd_lotesN_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMOrdenProd_lotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMOrdenProd_lotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMOrdenProd_lotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object QMOrdenProd_lotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMOrdenProd_lotesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMOrdenProd_lotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMOrdenProd_lotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMOrdenProd_lotesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMOrdenProd_lotesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMOrdenProd_lotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMOrdenProd_lotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMOrdenProd_lotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
  end
  object DSQMOrdenProd_lotes: TDataSource
    DataSet = QMOrdenProd_lotes
    Left = 160
    Top = 344
  end
  object QMProcesos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ORDENES_PROD_PROCESOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NORDEN=?old_NORDEN AND '
      '  ORDEN=?old_ORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ORDENES_PROD_PROCESOS'
      
        '  (EMPRESA,EJERCICIO,CANAL,NORDEN,ORDEN,PROCESO,TITULO,OPERARIO,' +
        'TITULO_OPERARIO,DURACION,PRECIO,DURACION_INICIAL,PRECIO_INICIAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?NORDEN,?ORDEN,?PROCESO,?TITULO,?O' +
        'PERARIO,?TITULO_OPERARIO,?DURACION,?PRECIO,?DURACION_INICIAL,?PR' +
        'ECIO_INICIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ORDENES_PROD_PROCESOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN AND '
      '  ORDEN=?ORDEN ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ORDENES_PROD_PROCESOS'
      
        '  where empresa=?empresa and ejercicio=?ejercicio and canal=?can' +
        'al and norden=?norden'
      '  order by orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ORDENES_PROD_PROCESOS'
      'SET'
      '  PROCESO=?PROCESO '
      '  ,TITULO=?TITULO '
      '  ,OPERARIO=?OPERARIO '
      '  ,TITULO_OPERARIO=?TITULO_OPERARIO '
      '  ,DURACION=?DURACION '
      '  ,PRECIO=?PRECIO'
      '  ,PRECIO_INICIAL=?PRECIO_INICIAL'
      '  ,DURACION_INICIAL=?DURACION_INICIAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN AND '
      '  ORDEN=?ORDEN ')
    DataSource = DSQMOrdenProd
    BeforePost = QMProcesosBeforePost
    OnNewRecord = QMProcesosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NORDEN '
      'ORDEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ORDENES_PROD_PROCESOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 200
    object QMProcesosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProcesosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProcesosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProcesosNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object QMProcesosPROCESO: TIntegerField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
      OnChange = QMProcesosPROCESOChange
    end
    object QMProcesosOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
      OnChange = QMProcesosOPERARIOChange
    end
    object QMProcesosDURACION: TFloatField
      DisplayLabel = 'Duraci'#243'n'
      FieldName = 'DURACION'
    end
    object QMProcesosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProcesosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProcesosTITULO_OPERARIO: TFIBStringField
      DisplayLabel = 'T'#237'tulo Oper.'
      FieldName = 'TITULO_OPERARIO'
      Size = 60
    end
    object QMProcesosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMProcesosDURACION_INICIAL: TIntegerField
      DisplayLabel = 'Duraci'#243'n Ini.'
      FieldName = 'DURACION_INICIAL'
    end
    object QMProcesosPRECIO_INICIAL: TIntegerField
      DisplayLabel = 'Precio Ini.'
      FieldName = 'PRECIO_INICIAL'
    end
  end
  object DSProcesos: TDataSource
    DataSet = QMProcesos
    Left = 160
    Top = 200
  end
  object xOrdenProdLotesMat: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select m.lote,m.serie,m.articulo,m.almacen,l.clasificacion,l.f_f' +
        'abricacion,'
      'l.f_envasado,l.f_caducidad,l.cantidad'
      'from art_ordenes_prod_lotes_mat m'
      'join art_articulos_esc_orden_d_lotes l'
      'on (l.id_lote = m.id_lote)'
      'where m.empresa=?empresa and'
      '      m.ejercicio=?ejercicio and'
      '      m.canal=?canal and'
      '      m.norden=?norden and'
      '      m.linea=?linea'
      '')
    UniDirectional = False
    DataSource = DSQMOrdenProd_lotes
    Left = 48
    Top = 392
    object xOrdenProdLotesMatLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xOrdenProdLotesMatSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xOrdenProdLotesMatARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xOrdenProdLotesMatALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xOrdenProdLotesMatCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xOrdenProdLotesMatF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object xOrdenProdLotesMatF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object xOrdenProdLotesMatF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xOrdenProdLotesMatCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSxOrdenProdLotesMat: TDataSource
    DataSet = xOrdenProdLotesMat
    Left = 160
    Top = 392
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 392
    Top = 56
  end
end
