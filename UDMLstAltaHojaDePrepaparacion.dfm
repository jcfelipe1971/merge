object DMLstAltaHojaDePrepaparacion: TDMLstAltaHojaDePrepaparacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 479
  Top = 203
  Height = 286
  Width = 444
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 16
  end
  object QMAltaPedidos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PREPARA_PEDIDO'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO=?TIPO AND'
      '  SERVIDO=0 AND'
      '  ESTADO<>5'
      'ORDER BY RIG,LINEA')
    UniDirectional = False
    Left = 32
    Top = 64
  end
  object DSQMAltaPedidos: TDataSource
    DataSet = QMAltaPedFiltro
    Left = 136
    Top = 64
  end
  object frxQMAltaPedidos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 40275.6431423495
    ReportOptions.LastChange = 40275.6431423495
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxQMAltaPedidosGetValue
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 232
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frQMAltaPedidos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frQMAltaPedidosGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 136
    Top = 16
    ReportForm = {19000000}
  end
  object frDSQMAltaPedidos: TfrDBDataSet
    DataSource = DSQMAltaPedidos
    Left = 232
    Top = 64
  end
  object QMAltaPedFiltro: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PREPARA_PEDIDO'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO=?TIPO AND'
      '  SERVIDO=0 AND'
      '  ESTADO<>5 AND '
      '  CLIENTE >= ?DESDE_CLIENTE AND '
      '  CLIENTE <= ?HASTA_CLIENTE AND '
      '  RIG >= ?PEDIDO_DESDE AND '
      '  RIG <= ?PEDIDO_HASTA AND '
      '  FECHA_ENTREGA_PREV >= ?FECHA_DESDE AND '
      '  FECHA_ENTREGA_PREV <= ?FECHA_HASTA AND '
      '  ARTICULO BETWEEN ?DESDE_ARTICULO AND ?HASTA_ARTICULO AND'
      ' ALMACEN =?ALMACEN'
      'ORDER BY RIG,LINEA')
    UniDirectional = False
    Left = 32
    Top = 112
  end
  object DSQMAltaPedFiltro: TDataSource
    DataSet = QMAltaPedFiltro
    Left = 136
    Top = 112
  end
  object frDBAltaPedFiltro: TfrDBDataSet
    DataSource = DSQMAltaPedidos
    Left = 232
    Top = 112
  end
end
