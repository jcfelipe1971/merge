object DMLstOfertasCli: TDMLstOfertasCli
  OldCreateOrder = False
  OnCreate = DMLstOfertascliCreate
  OnDestroy = DMLstOfertaDestroy
  Left = 739
  Top = 243
  Height = 317
  Width = 460
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 56
  end
  object frOferta: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frOfertaGetValue
    OnBeforePrint = frOfertaEnterRect
    OnEnterRect = frOfertaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 200
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 200
    Top = 56
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'where (empresa=?empresa) and (cliente=?cliente)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_OFERTA_C'
      'where    ((empresa=?empresa) and '
      '              (canal=?canal) and (serie=?serie) and '
      '              (fecha >= ?desde) and (fecha <= ?hasta) and'
      '              (cliente>=?c_desde) and (cliente<=?c_hasta))')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 56
  end
  object frxOferta: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9720537269
    ReportOptions.LastChange = 38691.9720537269
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxOfertaBeforePrint
    OnGetValue = frxOfertaGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 288
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 288
    Top = 56
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 152
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 120
    Top = 152
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_OFERTA_C'
      'WHERE '
      'ID_S= ?ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 104
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 200
    Top = 104
  end
end
