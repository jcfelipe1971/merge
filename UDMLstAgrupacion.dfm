object DMLSTAgrupaciones: TDMLSTAgrupaciones
  OldCreateOrder = False
  OnCreate = DMLSTAgrupacionesCreate
  OnDestroy = DMLSTAgrupacionesDestroy
  Left = 461
  Top = 283
  Height = 428
  Width = 478
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACIONES_CLI'
      'WHERE '
      'AGRUPACION = ?AGRUPACION'
      'AND EMPRESA = ?EMPRESA'
      'order by cliente')
    UniDirectional = False
    AfterOpen = xAgrupacionAfterOpen
    AfterScroll = xAgrupacionAfterScroll
    Left = 26
    Top = 93
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO >= ?EJERINI AND'
      'EJERCICIO <= ?EJERFIN AND'
      'CANAL = ?CANAL AND'
      'CLIENTE = ?CLIENTE')
    UniDirectional = False
    Left = 28
    Top = 151
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 19
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 112
    Top = 93
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 112
    Top = 151
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSxClientes
    AfterScroll = xTercerosAfterScroll
    Left = 28
    Top = 273
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 112
    Top = 273
  end
  object DSxCartera: TDataSource
    DataSet = xCartera
    Left = 112
    Top = 213
  end
  object xCartera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_REMESA '
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO_CARTERA >= ?EJERINI AND'
      '  EJERCICIO_CARTERA <= ?EJERFIN AND'
      '  CANAL = ?CANAL AND'
      '  SIGNO = '#39'C'#39' AND'
      '  COD_CLI_PRO = ?CLIENTE AND'
      '  VENCIMIENTO>=?INICIO AND'
      '  VENCIMIENTO<=?FIN AND'
      '  ')
    UniDirectional = False
    Left = 28
    Top = 215
  end
  object frCarteraAgrupacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Recibos por agrupacion'
    RebuildPrinter = False
    OnGetValue = frCarteraAgrupacionGetValue
    OnBeforePrint = frCarteraAgrupacionEnterRect
    OnEnterRect = frCarteraAgrupacionEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 38
    Top = 19
    ReportForm = {19000000}
  end
  object frDBxAgrupacion: TfrDBDataSet
    DataSource = DSxAgrupacion
    Left = 200
    Top = 93
  end
  object frDBxClientes: TfrDBDataSet
    DataSource = DSxClientes
    Left = 200
    Top = 151
  end
  object frDBxTerceros: TfrDBDataSet
    DataSource = DSxTerceros
    Left = 200
    Top = 273
  end
  object frDBxCartera: TfrDBDataSet
    DataSource = DSxCartera
    Left = 200
    Top = 213
  end
  object xLocalidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad=?dir_localidad')
    UniDirectional = False
    DataSource = DSxTerceros
    Left = 288
    Top = 213
  end
  object DSxLocalidad: TDataSource
    DataSet = xLocalidad
    Left = 379
    Top = 213
  end
  object xAgrupacionTit: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    AfterOpen = xAgrupacionAfterOpen
    Left = 288
    Top = 273
  end
  object DSxAgrupacionTit: TDataSource
    DataSet = xAgrupacionTit
    Left = 382
    Top = 273
  end
  object SPCarga: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(vencimiento) as maximo,min(vencimiento) as minimo '
      'FROM VER_CARTERA_REMESA '
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO_CARTERA = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SIGNO = '#39'C'#39)
    Transaction = TLocal
    AutoTrans = True
    Left = 300
    Top = 96
  end
  object QAgrupacionDef: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT AGRUPACION FROM VER_AGRUPACIONES')
    Transaction = TLocal
    AutoTrans = True
    Left = 382
    Top = 96
  end
  object QDameEjercicio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select ejercicio from e_pronostica_ejercicio(?empresa,?fecha)')
    Transaction = TLocal
    AutoTrans = True
    Left = 300
    Top = 150
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 290
    Top = 327
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 382
    Top = 329
  end
  object frxCarteraAgrupacion: TfrxHYReport
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
    OnBeforePrint = frxCarteraAgrupacionBeforePrint
    OnGetValue = frxCarteraAgrupacionGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 149
    Top = 19
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 312
    Top = 19
  end
end
