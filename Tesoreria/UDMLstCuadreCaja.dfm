object DMLstCuadreCaja: TDMLstCuadreCaja
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 399
  Top = 113
  Height = 680
  Width = 589
  object DSQMCabeceraFacturas: TDataSource
    DataSet = QMCabeceraFacturas
    Left = 176
    Top = 96
  end
  object DSQMCabeceraRecibos: TDataSource
    DataSet = QMCabeceraRecibos
    Left = 176
    Top = 288
  end
  object QMCabeceraFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT MIN(RIG) AS DOC_DESDE, MAX(RIG) AS DOC_HASTA, SUM(TOTAL_A' +
        '_COBRAR) AS TOTAL'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA')
    UniDirectional = False
    Left = 48
    Top = 96
  end
  object QMCabeceraRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT MIN(ID) AS DOC_DESDE, MAX(ID) AS DOC_HASTA, SUM(MONTO_REC' +
        'IBO) AS MONTO_RECIBO,'
      
        '       SUM(MONTO_TARJETA) AS MONTO_TARJETA, SUM(MONTO_EFECTIVO) ' +
        'AS MONTO_EFECTIVO, SUM(MONTO_CHEQUE) AS MONTO_CHEQUE'
      'FROM Z_RECIBOS_CAB'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA')
    UniDirectional = False
    Left = 48
    Top = 288
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 48
    Top = 48
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado cierre de caja'
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    OnBeforePrint = frListadoEnterRect
    OnEnterRect = frListadoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 312
    Top = 48
    ReportForm = {19000000}
  end
  object frDBCabeceraFacturas: TfrDBDataSet
    DataSource = DSQMCabeceraFacturas
    Left = 312
    Top = 96
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 44209.7555947569
    ReportOptions.LastChange = 44209.7555947569
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxListadoBeforePrint
    OnGetValue = frxListadoGetValue
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 424
    Top = 48
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frXDBFacturas: TfrxDBDataset
    UserName = 'frXDBFacturas'
    CloseDataSource = False
    DataSource = DSQMCabeceraFacturas
    Left = 424
    Top = 96
  end
  object QMDetalleFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAST(EXTRACT(YEAR FROM FECHA) || '#39'.'#39' || EXTRACT(MONTH FRO' +
        'M FECHA) || '#39'.'#39' || EXTRACT(DAY FROM FECHA) AS DATE) AS FECHA,'
      
        '       MIN(RIG) AS DOC_DESDE, MAX(RIG) AS DOC_HASTA, SUM(TOTAL_A' +
        '_COBRAR) AS TOTAL'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA'
      
        'GROUP BY CAST(EXTRACT(YEAR FROM FECHA) || '#39'.'#39' || EXTRACT(MONTH F' +
        'ROM FECHA) || '#39'.'#39' || EXTRACT(DAY FROM FECHA) AS DATE)')
    UniDirectional = False
    Left = 48
    Top = 144
  end
  object QMDetalleRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAST(EXTRACT(YEAR FROM FECHA) || '#39'.'#39' || EXTRACT(MONTH FRO' +
        'M FECHA) || '#39'.'#39' || EXTRACT(DAY FROM FECHA) AS DATE) AS FECHA,'
      
        '       MIN(ID) AS DOC_DESDE, MAX(ID) AS DOC_HASTA, SUM(MONTO_REC' +
        'IBO) AS MONTO_RECIBO,'
      
        '       SUM(MONTO_TARJETA) AS MONTO_TARJETA, SUM(MONTO_EFECTIVO) ' +
        'AS MONTO_EFECTIVO, SUM(MONTO_CHEQUE) AS MONTO_CHEQUE'
      'FROM Z_RECIBOS_CAB'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA'
      
        'GROUP BY CAST(EXTRACT(YEAR FROM FECHA) || '#39'.'#39' || EXTRACT(MONTH F' +
        'ROM FECHA) || '#39'.'#39' || EXTRACT(DAY FROM FECHA) AS DATE)')
    UniDirectional = False
    Left = 48
    Top = 336
  end
  object DSQMDetalleFacturas: TDataSource
    DataSet = QMDetalleFacturas
    Left = 176
    Top = 144
  end
  object DSQMDetalleRecibos: TDataSource
    DataSet = QMDetalleRecibos
    Left = 176
    Top = 336
  end
  object frDBDetalleFacturas: TfrDBDataSet
    DataSource = DSQMDetalleFacturas
    Left = 312
    Top = 144
  end
  object QMCabeceraAlbaranes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT MIN(RIG) AS DOC_DESDE, MAX(RIG) AS DOC_HASTA, SUM(TOTAL_A' +
        '_COBRAR) AS TOTAL'
      'FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA')
    UniDirectional = False
    Left = 48
    Top = 192
  end
  object QMDetalleAlbaranes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAST(EXTRACT(YEAR FROM FECHA) || '#39'.'#39' || EXTRACT(MONTH FRO' +
        'M FECHA) || '#39'.'#39' || EXTRACT(DAY FROM FECHA) AS DATE) AS FECHA,'
      
        '       MIN(RIG) AS DOC_DESDE, MAX(RIG) AS DOC_HASTA, SUM(TOTAL_A' +
        '_COBRAR) AS TOTAL'
      'FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA'
      
        'GROUP BY CAST(EXTRACT(YEAR FROM FECHA) || '#39'.'#39' || EXTRACT(MONTH F' +
        'ROM FECHA) || '#39'.'#39' || EXTRACT(DAY FROM FECHA) AS DATE)')
    UniDirectional = False
    Left = 48
    Top = 240
  end
  object DSQMCabeceraAlbaranes: TDataSource
    DataSet = QMCabeceraAlbaranes
    Left = 176
    Top = 192
  end
  object DSQMDetalleAlbaranes: TDataSource
    DataSet = QMDetalleAlbaranes
    Left = 176
    Top = 240
  end
  object frDBCabeceraAlbaranes: TfrDBDataSet
    DataSource = DSQMCabeceraAlbaranes
    Left = 312
    Top = 192
  end
  object frDBDetalleAlbaranes: TfrDBDataSet
    DataSource = DSQMDetalleAlbaranes
    Left = 312
    Top = 240
  end
  object frDBQMCabeceraRecibos: TfrDBDataSet
    DataSource = DSQMCabeceraRecibos
    Left = 312
    Top = 288
  end
  object frDBQMDetalleRecibos: TfrDBDataSet
    DataSource = DSQMDetalleRecibos
    Left = 312
    Top = 336
  end
end
