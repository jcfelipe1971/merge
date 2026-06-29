object DMLstOrdenesDePago: TDMLstOrdenesDePago
  OldCreateOrder = False
  OnCreate = DMLstOrdenesDePagoCreate
  OnDestroy = DMLstOrdenesDePagoDestroy
  Left = 396
  Top = 306
  Height = 300
  Width = 435
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 298
    Top = 18
  end
  object frOrdenesDePago: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Ordenes de Pago'
    RebuildPrinter = False
    OnGetValue = frOrdenesDePagoGetValue
    OnBeforePrint = frOrdenesDePagoEnterRect
    OnEnterRect = frOrdenesDePagoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 44
    Top = 18
    ReportForm = {19000000}
  end
  object frDBOrdenesDePago: TfrDBDataSet
    DataSource = DSxOrdenesDePago
    Left = 251
    Top = 70
  end
  object DSxOrdenesDePago: TDataSource
    DataSet = xOrdenesDePago
    Left = 144
    Top = 69
  end
  object xOrdenesDePago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  NUM_CONFIRMING=?NUM_CONFIRMING ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_ORD_PAGO'
      'WHERE '
      '  EMPRESA = :EMPRESA AND'
      '  EJERCICIO = :EJERCICIO AND'
      '  CANAL = :CANAL AND'
      '  SIGNO='#39'P'#39' AND'
      '  NUM_ORDEN = :NUM_ORDEN')
    UniDirectional = False
    AfterOpen = xOrdenesDePagoAfterOpen
    BeforeClose = xOrdenesDePagoBeforeClose
    Left = 41
    Top = 68
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 251
    Top = 119
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 144
    Top = 120
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CARTERA_ORD_PAGO'
      'WHERE EMPRESA = :EMPRESA AND'
      '      EJERCICIO_ORD_PAGO = :EJERCICIO AND'
      '      CANAL = :CANAL AND'
      '      SIGNO = '#39'P'#39' AND'
      '      ORD_PAGO = :NUM_ORDEN'
      'ORDER BY VENCIMIENTO')
    UniDirectional = False
    DataSource = DSxOrdenesDePago
    Left = 42
    Top = 119
  end
  object frxOrdenesDePago: TfrxHYReport
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
    OnBeforePrint = frxOrdenesDePagoBeforePrint
    OnGetValue = frxOrdenesDePagoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 145
    Top = 18
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
      'nowait')
    Left = 362
    Top = 18
  end
end
