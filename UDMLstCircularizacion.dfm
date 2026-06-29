object DMLstCircularizacion: TDMLstCircularizacion
  OldCreateOrder = False
  OnCreate = DMLstCircularizacionCreate
  OnDestroy = DMRCabeceraDestroy
  Left = 711
  Top = 184
  Height = 331
  Width = 481
  object frCircularizacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de cuenta por p'#225'gina'
    RebuildPrinter = False
    OnGetValue = frCircularizacionGetValue
    OnBeforePrint = frCircularizacionEnterRect
    OnEnterRect = frCircularizacionEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CUENTA = :CUENTA AND'
      'PGC = :PGC'
      'ORDER BY CUENTA')
    UniDirectional = False
    DataSource = DSxMaestro
    AfterOpen = xCuentaAfterOpen
    BeforeClose = xCuentaBeforeClose
    Left = 32
    Top = 112
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 120
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 16
  end
  object frDSxCuenta: TfrDBDataSet
    DataSource = DSxCuenta
    Left = 200
    Top = 112
  end
  object xSaldos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM C_CUENTAS_MAYOR_SALDOS(:EMPRESA, :EJERCICIO, :CANAL, :CUENT' +
        'A, :DESDE, :HASTA, :MONEDA, :ALCANCE)')
    UniDirectional = False
    DataSource = DSxCuenta
    Left = 32
    Top = 160
  end
  object DSxSaldos: TDataSource
    DataSet = xSaldos
    Left = 120
    Top = 160
  end
  object frxCircularizacion: TfrxHYReport
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
    OnBeforePrint = frxCircularizacionBeforePrint
    OnGetValue = frxCircularizacionGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 120
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 384
    Top = 16
  end
  object xMaestro: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CUENTA = :CUENTA AND'
      'PGC = :PGC'
      'ORDER BY CUENTA')
    UniDirectional = False
    AfterOpen = xMaestroAfterOpen
    BeforeClose = xMaestroBeforeClose
    Left = 32
    Top = 64
  end
  object DSxMaestro: TDataSource
    DataSet = xMaestro
    Left = 120
    Top = 64
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = DSxMaestro
    Left = 200
    Top = 64
  end
  object xDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE'
      'DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSxMaestro
    Left = 32
    Top = 208
  end
  object DSxDireccion_Cliente: TDataSource
    DataSet = xDireccion
    Left = 120
    Top = 208
  end
end
