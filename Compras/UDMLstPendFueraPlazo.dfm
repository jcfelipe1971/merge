object DMLstPendFueraPlazo: TDMLstPendFueraPlazo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 444
  Top = 242
  Height = 347
  Width = 375
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
    Left = 32
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
    Left = 222
    Top = 19
  end
  object frDBDSLstPendFueraPlazo: TfrDBDataSet
    DataSource = DSxLstPendFueraPlazo
    Left = 270
    Top = 74
  end
  object xLstPendFueraPlazo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from  lst_ped_fuera_plazo(?EMPRESA,?EJERCICIO,?CANAL,?S' +
        'ERIE,?FAMILIA_DESDE,?FAMILIA_HASTA,?FECHAD,?FECHAH,?PROVD,?PROVH' +
        ',?SERVIDO,?SERVIDO2,?ENTRADA)')
    UniDirectional = False
    Left = 36
    Top = 74
  end
  object DSxLstPendFueraPlazo: TDataSource
    DataSet = xLstPendFueraPlazo
    Left = 142
    Top = 74
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
    Left = 135
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
    Left = 294
    Top = 19
  end
end
