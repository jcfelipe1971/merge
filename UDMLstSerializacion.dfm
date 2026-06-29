object DMLstSerializacion: TDMLstSerializacion
  OldCreateOrder = False
  OnCreate = DMLstSerializacionCreate
  OnDestroy = DMLstSerializacionDestroy
  Left = 301
  Top = 246
  Height = 366
  Width = 632
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 112
    Top = 15
  end
  object frNumSerie: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frNumSerieGetValue
    OnBeforePrint = frNumSerieEnterRect
    OnEnterRect = frNumSerieEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 29
    Top = 12
    ReportForm = {19000000}
  end
  object frUDNumSerie: TfrUserDataset
    RangeEnd = reCount
    Left = 304
    Top = 72
  end
  object frDBImpSerie: TfrDBDataSet
    DataSource = DSQMImpresion
    OnFirst = frDBImpSerieFirst
    OnNext = frDBImpSerieNext
    Left = 200
    Top = 70
  end
  object DSQMImpresion: TDataSource
    DataSet = QMImpresion
    Left = 112
    Top = 68
  end
  object QMImpresion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_IMPRESION_SERIALIZACION'
      'WHERE'
      '  NUM_SERIE=?old_NUM_SERIE AND '
      '  USUARIO=?old_USUARIO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_IMPRESION_SERIALIZACION'
      '  (USUARIO,ARTICULO,NUM_SERIE,DESCRIPCION)'
      'VALUES'
      '  (?USUARIO,?ARTICULO,?NUM_SERIE,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_IMPRESION_SERIALIZACION'
      'WHERE'
      '  NUM_SERIE=?NUM_SERIE AND '
      '  USUARIO=?USUARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_IMPRESION_SERIALIZACION'
      'WHERE USUARIO=?USUARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_IMPRESION_SERIALIZACION'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,NUM_SERIE=?NUM_SERIE'
      'WHERE'
      '  NUM_SERIE=?old_NUM_SERIE AND '
      '  USUARIO=?USUARIO ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforeOpen = QMImpresionBeforeOpen
    OnNewRecord = QMImpresionNewRecord
    ClavesPrimarias.Strings = (
      'NUM_SERIE '
      'USUARIO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_IMPRESION_SERIALIZACION'
    UpdateTransaction = TLocal
    Left = 28
    Top = 68
    object QMImpresionUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMImpresionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMImpresionNUM_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NUM_SERIE'
      OnChange = QMImpresionNUM_SERIEChange
      Size = 25
    end
    object QMImpresionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT articulo, titulo FROM VER_ARTICULOS_SERIALIZACION'
      'WHERE EMPRESA = ?EMPRESA AND CANAL=?CANAL AND'
      'NSERIE=?NUM_SERIE')
    UniDirectional = False
    DataSource = DSQMImpresion
    Left = 112
    Top = 136
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xArtDesde: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_ARTICULOS'
    Left = 22
    Top = 208
    object xArtDesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSxArtDesde: TDataSource
    DataSet = xArtDesde
    Left = 92
    Top = 208
  end
  object xArtHasta: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_ARTICULOS'
    Left = 22
    Top = 257
    object xArtHastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSxArtHasta: TDataSource
    DataSet = xArtHasta
    Left = 94
    Top = 258
  end
  object xSerieDesde: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT first(1) nserie FROM ART_ARTICULOS_SERIALIZACION'
      
        'where empresa=?empresa and canal=?canal and almacen=?almacen and' +
        ' '
      'nserie=?serie /*and articulo=?articulo*/')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CODIGO '
      'ALMACEN ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'ART_ARTICULOS_SERIALIZACION'
    Left = 182
    Top = 196
    object xSerieDesdeNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
  end
  object DSxSerieDesde: TDataSource
    DataSet = xSerieDesde
    Left = 272
    Top = 200
  end
  object DSxSerieHasta: TDataSource
    DataSet = xSerieHasta
    Left = 274
    Top = 254
  end
  object xSerieHasta: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT first(1) nserie FROM ART_ARTICULOS_SERIALIZACION'
      
        'where empresa=?empresa and canal=?canal and almacen=?almacen and' +
        ' '
      'nserie=?serie /*and articulo=?articulo*/')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CODIGO '
      'ALMACEN ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'ART_ARTICULOS_SERIALIZACION'
    Left = 182
    Top = 248
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
  end
  object frSerializacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Serializaci'#243'n'
    RebuildPrinter = False
    OnGetValue = frSerializacionGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 348
    Top = 260
    ReportForm = {19000000}
  end
  object frDBSerializacion: TfrDBDataSet
    DataSource = DSSerializacion
    Left = 376
    Top = 128
  end
  object QMLstSerializacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_SERIALIZACION'
      'where EMPRESA=?empresa AND CANAL = ?canal'
      'AND ARTICULO between ?artdesde  and ?arthasta'
      'AND ALMACEN =?almacen'
      'AND ACTIVO = 1'
      'AND NSERIE between ?nseriedesde and ?nseriehasta')
    UniDirectional = False
    AfterOpen = QMLstSerializacionAfterOpen
    Left = 452
    Top = 128
    object QMLstSerializacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLstSerializacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLstSerializacionCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMLstSerializacionNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMLstSerializacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLstSerializacionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLstSerializacionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMLstSerializacionFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object QMLstSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Gar. Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object QMLstSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Gar. Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object QMLstSerializacionNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMLstSerializacionDEVUELTO_PROV: TIntegerField
      DisplayLabel = 'Dev. Prov.'
      FieldName = 'DEVUELTO_PROV'
    end
    object QMLstSerializacionCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMLstSerializacionACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSSerializacion: TDataSource
    DataSet = QMLstSerializacion
    Left = 552
    Top = 120
  end
  object xOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*select * from ges_detalles_serializacion'
      'where empresa=?empresa and canal=?canal and codigo=?codigo*/'
      ''
      
        'select * from filtra_serializacion_orig_dest(?empresa,?canal,?codi' +
        'go,'#39'origen'#39')')
    UniDirectional = False
    DataSource = DSSerializacion
    Left = 464
    Top = 24
    object xOrigenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xOrigenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xOrigenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xOrigenSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 2
    end
    object xOrigenRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xOrigenLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xOrigenTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xOrigenID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xOrigenFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxOrigen: TDataSource
    DataSet = xOrigen
    Left = 516
    Top = 24
  end
  object DSxDestino: TDataSource
    DataSet = xDestino
    Left = 516
    Top = 72
  end
  object xDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*select * from ges_detalles_serializacion'
      'where empresa=?empresa and canal=?canal and codigo=?codigo*/'
      ''
      
        'select * from filtra_serializacion_orig_dest(?empresa,?canal,?codi' +
        'go,'#39'destino'#39')')
    UniDirectional = False
    DataSource = DSSerializacion
    Left = 464
    Top = 72
    object xDestinoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDestinoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDestinoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDestinoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 2
    end
    object xDestinoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDestinoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDestinoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDestinoID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xDestinoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object frDBxOrigen: TfrDBDataSet
    DataSource = DSxOrigen
    Left = 392
    Top = 20
  end
  object frDBxDestino: TfrDBDataSet
    DataSource = DSxDestino
    Left = 392
    Top = 76
  end
  object QEmpresa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from sys_empresas'
      'where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 432
    Top = 260
  end
  object xMostrarStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_series_disponibles'
      'where empresa=?empresa and canal=?canal and almacen=?almacen'
      'and articulo=?articulo and nserie=?nserie')
    UniDirectional = False
    DataSource = DSSerializacion
    Left = 472
    Top = 188
    object xMostrarStockEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMostrarStockCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMostrarStockCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xMostrarStockALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xMostrarStockNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xMostrarStockARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xMostrarStockEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMostrarStockGES_CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'GES_CANAL'
    end
    object xMostrarStockGES_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'GES_SERIE'
      Size = 10
    end
    object xMostrarStockGES_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'GES_TIPO'
      Size = 3
    end
    object xMostrarStockGES_RIG: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'GES_RIG'
    end
    object xMostrarStockGES_LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'GES_LINEA'
    end
    object xMostrarStockPRO_TIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'PRO_TIPO'
    end
    object xMostrarStockPRO_ID_ORDEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'PRO_ID_ORDEN'
    end
    object xMostrarStockPRO_LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'PRO_LINEA'
    end
  end
  object frDBMostrarStock: TfrDBDataSet
    DataSource = DSxMostrarStock
    Left = 380
    Top = 184
  end
  object DSxMostrarStock: TDataSource
    DataSet = xMostrarStock
    Left = 548
    Top = 176
  end
end
