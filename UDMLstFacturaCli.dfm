object DMLstFacturaCli: TDMLstFacturaCli
  OldCreateOrder = False
  OnCreate = DMLstFacturaCliCreate
  OnDestroy = DMLstFacturaDestroy
  Left = 861
  Top = 260
  Height = 334
  Width = 431
  object frFactura: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frFacturaGetValue
    OnBeforePrint = frFacturaEnterRect
    OnEnterRect = frFacturaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 192
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    OpenDataSource = False
    Left = 192
    Top = 56
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 8
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA'
      'where     empresa=?empresa  and canal=?canal and'
      
        '              serie=?serie and (fecha >= ?desde) and (fecha <= ?' +
        'hasta) and'
      '              (cliente>=?c_desde) and (cliente<=?c_hasta)'
      'order by rig')
    UniDirectional = True
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 200
  end
  object frxFactura: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9709437732
    ReportOptions.LastChange = 38691.9709437732
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxFacturaBeforePrint
    OnGetValue = frxFacturaGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 272
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 272
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
    Left = 32
    Top = 152
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 112
    Top = 152
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA'
      'WHERE '
      'ID_S= ?ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 104
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 192
    Top = 104
  end
end
