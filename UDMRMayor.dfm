object DMRMayor: TDMRMayor
  OldCreateOrder = False
  OnCreate = DMRMayorCreate
  OnDestroy = DMRCabeceraDestroy
  Left = 711
  Top = 184
  Height = 331
  Width = 481
  object frMayor: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de cuenta por p'#225'gina'
    RebuildPrinter = False
    OnGetValue = frMayorGetValue
    OnBeforePrint = frMayorEnterRect
    OnEnterRect = frMayorEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 24
    Top = 16
    ReportForm = {19000000}
  end
  object frDSxListaMayor: TfrDBDataSet
    DataSource = DSxListaMayor
    Left = 184
    Top = 112
  end
  object DSxListaMayor: TDataSource
    DataSet = xListaMayor
    Left = 104
    Top = 112
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CUENTA >= :CUENTA_DESDE AND'
      'CUENTA <= :CUENTA_HASTA AND'
      'PGC = :PGC AND'
      'NIVEL = :NIVEL'
      'ORDER BY CUENTA')
    UniDirectional = False
    Left = 24
    Top = 64
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 104
    Top = 64
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
  object xListaMayor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM C_CUENTAS_MAYOR(:EMPRESA, :EJERCICIO, :CANAL, :CUENTA, :DES' +
        'DE, :HASTA, :MONEDA, :ALCANCE, :D1, :D2, :D3, :D4, :D5)'
      'WHERE'
      'FECHA >= :DESDE')
    UniDirectional = False
    DataSource = DSxCuentas
    Left = 24
    Top = 112
  end
  object frDSxCuentas: TfrDBDataSet
    DataSource = DSxCuentas
    Left = 184
    Top = 64
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
    DataSource = DSxCuentas
    Left = 24
    Top = 160
  end
  object DSxSaldos: TDataSource
    DataSet = xSaldos
    Left = 104
    Top = 160
  end
  object frxMayor: TfrxHYReport
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
    OnBeforePrint = frxMayorBeforePrint
    OnGetValue = frxMayorGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 104
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
end
