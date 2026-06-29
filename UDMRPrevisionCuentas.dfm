object DMRPrevisionCuentas: TDMRPrevisionCuentas
  OldCreateOrder = False
  OnCreate = DMRTotalCuentasCreate
  OnDestroy = DMRTotalCuentasDestroy
  Left = 434
  Top = 286
  Height = 300
  Width = 447
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 112
  end
  object frHYImportesCuentas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frHYImportesCuentasGetValue
    OnBeforePrint = frHYImportesCuentasEnterRect
    OnEnterRect = frHYImportesCuentasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 344
    Top = 16
  end
  object SPPrevisionCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_PREVISION_CUENTAS(?EMPRESA,?EJERCICIO,'
      '?CANAL,?DESDE,?HASTA,?SIGNO,?MONEDA,?FECHA)')
    UniDirectional = False
    Left = 40
    Top = 64
  end
  object DSPrevisionCuentas: TDataSource
    DataSet = SPPrevisionCuentas
    Left = 144
    Top = 64
  end
  object frDBPrevCuentas: TfrDBDataSet
    DataSource = DSPrevisionCuentas
    Left = 248
    Top = 64
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS'
      'ORDER BY DEFECTO DESC, MONEDA')
    UniDirectional = False
    Left = 40
    Top = 112
  end
  object frxHYImportesCuentas: TfrxHYReport
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
    OnBeforePrint = frxHYImportesCuentasBeforePrint
    OnGetValue = frxHYImportesCuentasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
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
    Left = 344
    Top = 64
  end
end
