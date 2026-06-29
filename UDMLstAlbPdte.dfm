object DMLstAlbPdte: TDMLstAlbPdte
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 462
  Top = 262
  Height = 347
  Width = 557
  object DSListado: TDataSource
    DataSet = QMListado
    Left = 120
    Top = 64
  end
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM LST_ALBARANES_PDTE_SERVIR'
      '(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO_FILTRO, '
      ':FECHAD, :FECHAH, :FAMILIAD, :FAMILIAH, '
      ':CLIENTED, :CLIENTEH, :ARTICULOD, :ARTICULOH, '
      ':SERVIDO, :AGENTED, :AGENTEH)'
      'ORDER BY V_CODCLIENTE, V_RIGALB')
    UniDirectional = False
    Left = 48
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 192
    Top = 16
  end
  object frAlbPdte: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de pedidos'
    RebuildPrinter = False
    OnGetValue = frAlbPdteGetValue
    OnBeforePrint = frAlbPdteBeforePrint
    OnEnterRect = frAlbPdteBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object FrDBAlbPdte: TfrDBDataSet
    DataSource = DSListado
    Left = 192
    Top = 64
  end
  object frxAlbPdte: TfrxHYReport
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
    OnBeforePrint = frxAlbPdteBeforePrint
    OnGetValue = frxAlbPdteGetValue
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
end
