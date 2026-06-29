object DMLstPendFueraPlazoVentas: TDMLstPendFueraPlazoVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 720
  Top = 358
  Height = 343
  Width = 418
  object frPendFueraPlazo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPendFueraPlazoGetValue
    OnBeforePrint = frPendFueraPlazoBeforePrint
    OnEnterRect = frPendFueraPlazoBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 56
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
    Left = 246
    Top = 17
  end
  object frDBDSPendFueraPlazo: TfrDBDataSet
    DataSource = DSxPendFueraPlazo
    Left = 294
    Top = 71
  end
  object DSxPendFueraPlazo: TDataSource
    DataSet = xPendFueraPlazo
    Left = 166
    Top = 71
  end
  object xPendFueraPlazo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM LST_PED_FUERA_PLAZO_S(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE,' +
        ' ?FAMILIA_DESDE, ?FAMILIA_HASTA, ?FECHAD, ?FECHAH, ?CLID, ?CLIH,' +
        ' ?SERVIDO, ?SERVIDO2, ?ENTRADA)  ')
    UniDirectional = False
    Left = 55
    Top = 72
  end
  object frxPendFueraPlazo: TfrxHYReport
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
    OnBeforePrint = frxPendFueraPlazoBeforePrint
    OnGetValue = frxPendFueraPlazoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 165
    Top = 17
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
    Left = 318
    Top = 17
  end
end
