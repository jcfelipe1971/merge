object DMRStockMinimo: TDMRStockMinimo
  OldCreateOrder = False
  OnCreate = DMRStockMinimoCreate
  OnDestroy = DMRStockMinimoDestroy
  Left = 426
  Top = 300
  Height = 311
  Width = 612
  object frStockMinimo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Stock M'#237'nimo Multi-Canal'
    RebuildPrinter = False
    OnGetValue = frStockMinimoGetValue
    OnBeforePrint = frStockMinimoEnterRect
    OnEnterRect = frStockMinimoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDSQSPStock_Minimo: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQSPStock_Minimo
    Left = 264
    Top = 64
  end
  object DSQSPStock_Minimo: TDataSource
    DataSet = QSPStock_Minimo
    Left = 144
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 16
  end
  object QSPStock_Minimo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * '
      
        'FROM a_art_stock_minimo(?entrada,?empresa,?ejercicio,?canal,?alm' +
        'acen,?art_ini,?art_fin,?fam_ini,?fam_fin,?calculo_virtual)')
    UniDirectional = False
    Left = 40
    Top = 64
  end
  object frxStockMinimo: TfrxHYReport
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
    OnBeforePrint = frxStockMinimoBeforePrint
    OnGetValue = frxStockMinimoGetValue
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
    Top = 16
  end
end
