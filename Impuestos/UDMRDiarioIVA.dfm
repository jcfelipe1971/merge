object DMRDiarioIVA: TDMRDiarioIVA
  OldCreateOrder = False
  OnCreate = DMRDiarioIVACreate
  OnDestroy = DMRDiarioIVADestroy
  Left = 660
  Top = 269
  Height = 374
  Width = 462
  object DSQSPDiarioIVA: TDataSource
    DataSet = QSPDiarioIVA
    Left = 184
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 48
    Top = 16
  end
  object frDiarioIVA: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDiarioIVAGetValue
    OnBeforePrint = frDiarioIVAEnterRect
    OnEnterRect = frDiarioIVAEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 296
    Top = 16
    ReportForm = {19000000}
  end
  object frDBQSPDiarioIVA: TfrDBDataSet
    DataSource = DSQSPDiarioIVA
    Left = 296
    Top = 64
  end
  object DSQMTotales: TDataSource
    DataSet = QMTotales
    Left = 184
    Top = 112
  end
  object frDSQMTotales: TfrDBDataSet
    DataSource = DSQMTotales
    Left = 296
    Top = 112
  end
  object frxDiarioIVA: TfrxHYReport
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
    OnBeforePrint = frxDiarioIVABeforePrint
    OnGetValue = frxDiarioIVAGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 376
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
      'read_committed'
      'rec_version'
      'nowait')
    Left = 184
    Top = 16
  end
  object QSPDiarioIVA: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM C_CREA_DIARIO_IVA'
      '(:EMPRESA, :EJERCICIO, :CANAL, :PAIS, :SIGNO, '
      ':TIPO, :SERIE, :FECHA_DESDE, :FECHA_HASTA, '
      ':NUM_DESDE, :NUM_HASTA, :MODO)')
    UniDirectional = True
    Left = 48
    Top = 64
  end
  object QMTotales: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_CREA_DIARIO_IVA_TOTALES'
      '(:EMPRESA, :EJERCICIO, :CANAL, :PAIS, :SIGNO, '
      ':TIPO, :SERIE, :FECHA_DESDE, :FECHA_HASTA, '
      ':NUM_DESDE, :NUM_HASTA, :MODO)')
    UniDirectional = False
    Left = 48
    Top = 112
  end
end
