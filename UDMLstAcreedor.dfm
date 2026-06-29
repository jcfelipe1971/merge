object DMLSTAcreedor: TDMLSTAcreedor
  OldCreateOrder = False
  OnCreate = DMLSTAcreedorCreate
  OnDestroy = DMLSTAcreedorDestroy
  Left = 485
  Top = 200
  Height = 604
  Width = 943
  object frAcreedor: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Carga de Transportista'
    RebuildPrinter = False
    OnGetValue = frAcreedorGetValue
    OnBeforePrint = frAcreedorEnterRect
    OnEnterRect = frAcreedorEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object frDSQMAcreedor: TfrDBDataSet
    DataSource = DSQMAcreedor
    Left = 264
    Top = 56
  end
  object QMAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'ACREEDOR <= ?MAXIMO AND'
      'ACREEDOR >= ?MINIMO')
    UniDirectional = False
    AfterOpen = QMAcreedorAfterOpen
    BeforeClose = QMAcreedorBeforeClose
    Left = 40
    Top = 56
  end
  object DSQMAcreedor: TDataSource
    DataSet = QMAcreedor
    Left = 144
    Top = 56
  end
  object QMTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE '
      'TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 104
  end
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 144
    Top = 104
  end
  object frDSQMTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 264
    Top = 104
  end
  object frDSQMJustifica: TfrDBDataSet
    DataSource = DSQMJustifica
    Left = 264
    Top = 392
  end
  object DSQMJustifica: TDataSource
    DataSet = QMJustifica
    Left = 144
    Top = 392
  end
  object QMJustifica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 392
  end
  object QMFormasdePago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FP'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'FORMA_PAGO = ?FORMA_PAGO'
      '')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 200
  end
  object DSFormasdePago: TDataSource
    DataSet = QMFormasdePago
    Left = 144
    Top = 200
  end
  object frDSQMFormasdePago: TfrDBDataSet
    DataSource = DSFormasdePago
    Left = 264
    Top = 200
  end
  object frDSQMIvaModos: TfrDBDataSet
    DataSource = DSIvaModos
    Left = 264
    Top = 248
  end
  object DSIvaModos: TDataSource
    DataSet = QMIvaModos
    Left = 144
    Top = 248
  end
  object QMIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      'WHERE '
      'MODO = ?MODO_IVA')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 248
  end
  object QMIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IRPF'
      'WHERE '
      'TIPO = ?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 296
  end
  object DSIRPF: TDataSource
    DataSet = QMIRPF
    Left = 144
    Top = 296
  end
  object frDSQMIRPF: TfrDBDataSet
    DataSource = DSIRPF
    Left = 264
    Top = 296
  end
  object frDSQMTipoTerceros: TfrDBDataSet
    DataSource = DSTipoTerceros
    Left = 264
    Top = 344
  end
  object DSTipoTerceros: TDataSource
    DataSet = QMTipoTercero
    Left = 144
    Top = 344
  end
  object QMTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_TERCERO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 344
  end
  object QMTipodeProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ACREEDOR'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_ACREEDOR'
      'WHERE '
      'TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 152
  end
  object DSQMlstTipodeProv: TDataSource
    DataSet = QMTipodeProv
    Left = 144
    Top = 152
  end
  object frQMDSQMlstTipodeProv: TfrDBDataSet
    DataSource = DSQMlstTipodeProv
    Left = 264
    Top = 152
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 264
    Top = 8
  end
  object xCarga: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM lst_transportista_carga(?Empresa,?Ejercicio,?Canal' +
        ',?Serie,?transportistaD,?transportistaH,?FechaD,?FechaH,?Cliente' +
        'D,?ClienteH,?Facturados)'
      'ORDER BY TRANSPORTISTA, ARTICULO, CLIENTE')
    UniDirectional = False
    Left = 40
    Top = 440
  end
  object DSxCarga: TDataSource
    DataSet = xCarga
    Left = 144
    Top = 440
  end
  object frDBxCarga: TfrDBDataSet
    DataSource = DSxCarga
    Left = 264
    Top = 440
  end
  object xFacturasMensual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 416
    Top = 56
  end
  object DSxFacturasMensual: TDataSource
    DataSet = xFacturasMensual
    Left = 560
    Top = 56
  end
  object DSxFacturasMensualCompara: TDataSource
    DataSet = xFacturasMensualCompara
    Left = 560
    Top = 104
  end
  object xFacturasMensualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 104
  end
  object xFacturasAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 152
  end
  object DSxFacturasAnual: TDataSource
    DataSet = xFacturasAnual
    Left = 560
    Top = 152
  end
  object DSxFacturasAnualCompara: TDataSource
    DataSet = xFacturasAnualCompara
    Left = 560
    Top = 200
  end
  object xFacturasAnualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 200
  end
  object xPrevisionMensual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_acr'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?POR' +
        'CENTAJE_VENTAS,  ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 248
  end
  object DSxPrevisionMensual: TDataSource
    DataSet = xPrevisionMensual
    Left = 560
    Top = 248
  end
  object DSxPrevisionAnual: TDataSource
    DataSet = xPrevisionAnual
    Left = 560
    Top = 296
  end
  object xPrevisionAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_acr'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?POR' +
        'CENTAJE_VENTAS, ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 296
  end
  object xFacturasAnualC_1: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 344
  end
  object DSxFacturasAnualC_1: TDataSource
    DataSet = xFacturasAnualC_1
    Left = 560
    Top = 344
  end
  object DSxFacturasAnualC_2: TDataSource
    DataSet = xFacturasAnualC_2
    Left = 560
    Top = 392
  end
  object xFacturasAnualC_2: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 392
  end
  object xFacturasAnualC_3: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 440
  end
  object DSxFacturasAnualC_3: TDataSource
    DataSet = xFacturasAnualC_3
    Left = 560
    Top = 440
  end
  object frxAcreedor: TfrxHYReport
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
    OnBeforePrint = frxAcreedorBeforePrint
    OnGetValue = frxAcreedorGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xTituloAcreedores: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT ACREEDOR, TITULO FROM VER_ACREEDORES'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ACREEDOR = ?ACREEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 416
    Top = 488
  end
  object DSxTituloAcreedores: TDataSource
    DataSet = xTituloAcreedores
    Left = 560
    Top = 488
  end
end
