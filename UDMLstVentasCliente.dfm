object DMLstVentasCliente: TDMLstVentasCliente
  OldCreateOrder = False
  OnCreate = DMVentasCliCreate
  OnDestroy = DMVentasCliDestroy
  Left = 617
  Top = 223
  Height = 561
  Width = 706
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 352
    Top = 16
  end
  object frDBDSxVentas_Clientes_detalle: TfrDBDataSet
    DataSource = DSxVentas_Clientes_detalle
    Left = 352
    Top = 64
  end
  object frHYVentasClientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Ventas por Cliente Uds. Secundarias'
    RebuildPrinter = False
    OnGetValue = frHYVentasClientesGetValue
    OnBeforePrint = frHYVentasClientesEnterRect
    OnEnterRect = frHYVentasClientesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 56
    Top = 16
    ReportForm = {19000000}
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 56
    Top = 208
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 192
    Top = 208
  end
  object xVentas_Clientes_detalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM G_VENTAS_ARTICULOS_CLIENTE_DOC(:EMPRESA, :EJERCICI' +
        'OD, :EJERCICIOH,'
      
        ':CANALD, :CANALH, :SERIED, :SERIEH, :CLIENTED, :CLIENTEH, :ENTRA' +
        'DA, :MONEDA,'
      
        ':ALBARANES, :FACTURAS_ABIERTAS, :FACTURAS_CERRADAS, :ARTICULOD, ' +
        ':ARTICULOH,'
      ':FAMILIAD, :FAMILIAH, :FECHAD, :FECHAH, :AGENTED, :AGENTEH)')
    UniDirectional = False
    AfterOpen = xVentas_Clientes_detalleAfterOpen
    BeforeClose = xVentas_Clientes_detalleBeforeClose
    Left = 56
    Top = 64
  end
  object DSxVentas_Clientes_detalle: TDataSource
    DataSet = xVentas_Clientes_detalle
    Left = 192
    Top = 64
  end
  object frDBDSxInfoLotes: TfrDBDataSet
    DataSource = DSxInfoLotes
    Left = 352
    Top = 112
  end
  object xInfoLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_DETALLES_S_LOTES'
      'WHERE'
      'EMPRESA = :DOC_EMPRESA AND'
      'EJERCICIO = :DOC_EJERCICIO AND'
      'CANAL = :DOC_CANAL AND'
      'SERIE = :DOC_SERIE AND'
      'TIPO = :DOC_TIPO AND'
      'RIG = :DOC_RIG AND'
      'LINEA = :DOC_LINEA')
    UniDirectional = False
    DataSource = DSxVentas_Clientes_detalle
    Left = 56
    Top = 112
  end
  object DSxInfoLotes: TDataSource
    DataSet = xInfoLotes
    Left = 192
    Top = 112
  end
  object frxHYVentasClientes: TfrxHYReport
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
    OnBeforePrint = frxHYVentasClientesBeforePrint
    OnGetValue = frxHYVentasClientesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 192
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xNrosSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT LIST(A.NSERIE, '#39', '#39') LISTA, COUNT(*) CANTIDAD'
      'FROM GES_DETALLES_SERIALIZACION S'
      
        'JOIN ART_ARTICULOS_SERIALIZACION A ON S.EMPRESA = A.EMPRESA AND ' +
        'S.CANAL = A.CANAL AND S.CODIGO = A.CODIGO AND S.ALMACEN = A.ALMA' +
        'CEN'
      'WHERE'
      'S.EMPRESA = :DOC_EMPRESA AND'
      'S.EJERCICIO = :DOC_EJERCICIO AND'
      'S.CANAL = :DOC_CANAL AND'
      'S.SERIE = :DOC_SERIE AND'
      'S.TIPO = :DOC_TIPO AND'
      'S.RIG = :DOC_RIG AND'
      'S.LINEA = :DOC_LINEA'
      'HAVING COUNT(*) > 0')
    UniDirectional = False
    DataSource = DSxVentas_Clientes_detalle
    Left = 56
    Top = 160
  end
  object DSxNrosSerie: TDataSource
    DataSet = xNrosSerie
    Left = 192
    Top = 160
  end
  object frDBxNrosSerie: TfrDBDataSet
    DataSource = DSxNrosSerie
    Left = 352
    Top = 160
  end
end
