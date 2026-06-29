object DMLstLotes: TDMLstLotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 365
  Top = 256
  Height = 441
  Width = 662
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
  object DSxMovimientosLote: TDataSource
    DataSet = xMovimientosLote
    Left = 176
    Top = 64
  end
  object frLotes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Lotes'
    RebuildPrinter = False
    OnGetValue = frLotesGetValue
    OnBeforePrint = frLotesEnterRect
    OnEnterRect = frLotesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 288
    Top = 16
    ReportForm = {19000000}
  end
  object frDBxMovimientosLote: TfrDBDataSet
    DataSource = DSxMovimientosLote
    Left = 288
    Top = 64
  end
  object FREti1Col: TfrUserDataset
    RangeEnd = reCount
    Left = 480
    Top = 16
  end
  object FREti2Col: TfrUserDataset
    RangeEnd = reCount
    Left = 480
    Top = 64
  end
  object FREti3Col: TfrUserDataset
    RangeEnd = reCount
    Left = 480
    Top = 112
  end
  object frxLotes: TfrxHYReport
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
    OnBeforePrint = frxLotesBeforePrint
    OnGetValue = frxLotesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 384
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object FRxEti1Col: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'FRxEti1Col'
    Left = 576
    Top = 16
  end
  object FRxEti2Col: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'FRxEti2Col'
    Left = 576
    Top = 64
  end
  object FRxEti3Col: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'FRxEti3Col'
    Left = 576
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 176
    Top = 16
  end
  object xMovimientosLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_LOTES_MOVIMIENTOS(:EMPRESA, :EJERCICIO, :CANAL' +
        ', :ALMD, :ALMH,'
      
        ':AGRD, :AGRH, :FAMD, :FAMH, :ARTD, :ARTH, :LOTED, :LOTEH, :FABRI' +
        'CADOD, :FABRICADOH,'
      
        ':ENVASADOD, :ENVASADOH, :CADUCIDADD, :CADUCIDADH, :FCOMPRAD, :FC' +
        'OMPRAH,'
      
        ':FVENTAD, :FVENTAH, :ALMACENX, :AGRUPACIONX, :FAMILIAX, :ARTICUL' +
        'OX,:LOTEX,'
      
        ':FABRICACIONX, :ENVASADOX, :CADUCIDADX, :UBICACIONX, :COMPRAX, :' +
        'VENTAX, 0)')
    UniDirectional = False
    AfterOpen = xMovimientosLoteAfterOpen
    Left = 48
    Top = 64
  end
  object DSQMSof_ARticulosLotes: TDataSource
    DataSet = xStockLotes
    Left = 176
    Top = 112
  end
  object xStockLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SOF_ARTICULOS_LOTES(:EMPRESA, :ARTICULO, :CANAL)'
      'ORDER BY LOTE')
    UniDirectional = False
    Left = 48
    Top = 112
  end
  object frDBSofArtLotes: TfrDBDataSet
    DataSource = DSQMSof_ARticulosLotes
    Left = 288
    Top = 112
  end
  object DSxLote: TDataSource
    DataSet = xLote
    Left = 176
    Top = 160
  end
  object xLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_LOTES'
      'WHERE'
      'ID_LOTE = :ID_LOTE')
    UniDirectional = False
    AfterOpen = xLoteAfterOpen
    Left = 48
    Top = 160
  end
  object frDBxLote: TfrDBDataSet
    DataSource = DSxLote
    Left = 288
    Top = 160
  end
  object xArticuloIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'FROM ART_ARTICULOS_IDIOMAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND '
      'ARTICULO = ?ARTICULO AND'
      'IDIOMA = ?IDIOMA')
    UniDirectional = False
    DataSource = DSxLote
    Left = 48
    Top = 208
  end
  object DSDSxArticuloIdioma: TDataSource
    DataSet = xArticuloIdioma
    Left = 176
    Top = 208
  end
  object QMPastada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT P.REPETICION AS PASTADA, E.REPETICION AS ETIQUETA'
      'FROM LST_REPETIR_REGISTRO(:PASTADAS) P'
      'JOIN LST_REPETIR_REGISTRO(:ETIQUETAS) E ON 1 = 1')
    UniDirectional = False
    DataSource = DSxLote
    Left = 48
    Top = 256
  end
  object DSPastada: TDataSource
    DataSet = QMPastada
    Left = 176
    Top = 256
  end
  object frDBPastada: TfrDBDataSet
    DataSource = DSPastada
    Left = 288
    Top = 256
  end
end
