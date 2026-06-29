object DMRLibroDiarioConta: TDMRLibroDiarioConta
  OldCreateOrder = False
  OnCreate = DMRLibroDiarioCreate
  OnDestroy = DMRLibroDiarioDestroy
  Left = 359
  Top = 208
  Height = 562
  Width = 682
  object QSPCreaLibroDiario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM C_CREA_LIBRO_DIARIO_S(?empresa,?ejercicio,?canal,?' +
        'fecha_desde,?fecha_hasta,?asiento_desde,?asiento_hasta,?moneda,?' +
        'tipo)'
      'ORDER BY ASIENTO,LINEA')
    UniDirectional = True
    Left = 48
    Top = 64
  end
  object DSLibroDiario: TDataSource
    DataSet = QSPCreaLibroDiario
    Left = 152
    Top = 64
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO FROM SYS_MONEDAS'
      'ORDER BY DEFECTO DESC, MONEDA')
    UniDirectional = False
    Left = 48
    Top = 208
    object xMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 152
    Top = 208
  end
  object frLibroDiario: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Libro Diario Vertical'
    RebuildPrinter = False
    OnGetValue = frLibroDiarioGetValue
    OnBeforePrint = frLibroDiarioEnterRect
    OnEnterRect = frLibroDiarioEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object frDSLibroDiario: TfrDBDataSet
    DataSource = DSLibroDiario
    Left = 264
    Top = 64
  end
  object SPLibroDiarioMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_LIBRO_DIARIO_MONEDA(?empresa,'
      '?ejercicio,?canal,?ric,?moneda)')
    UniDirectional = True
    Left = 48
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 552
    Top = 24
  end
  object xTipoAsiento: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TIPO,TITULO'
      'FROM SYS_TIPO_ASIENTO'
      'WHERE TIPO<>'#39'ANA'#39
      'ORDER BY TIPO')
    Transaction = TLocal
    Left = 264
    Top = 304
  end
  object QMinFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT min(fecha) as minimo '
      'FROM con_cuentas_asientos'
      'WHERE'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 304
  end
  object QMaxFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(fecha) as maximo '
      'FROM con_cuentas_asientos'
      'WHERE'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 152
    Top = 304
  end
  object QMaxAsiento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(asiento) as maximo '
      'FROM con_cuentas_asientos'
      'WHERE'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 256
  end
  object QTotalDigitos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TOTAL_DIGITOS FROM CON_CUENTAS_NIVELES'
      '     WHERE EMPRESA = ?EMPRESA AND'
      '                    EJERCICIO = ?EJERCICIO AND'
      '                    CANAL = ?CANAL '
      '                    AND NIVEL = ?NIVEL')
    Transaction = TLocal
    AutoTrans = True
    Left = 152
    Top = 256
  end
  object DSLibroDiarioResum: TDataSource
    DataSet = SPLibroDiarioResum
    Left = 152
    Top = 112
  end
  object frDBDSLibDiarioResum: TfrDBDataSet
    DataSource = DSLibroDiarioResum
    Left = 264
    Top = 112
  end
  object SPLibroDiarioResum: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM c_crea_libro_diario_resumido(?EMPRESA,?EJERCICIO'
      '              ,?CANAL,?NIVEL,?PERIODO_INI,?PERIODO_FIN,?APE,?REG'
      '              ,?CIE,?MONEDA_NUEVA,?FECHA)')
    UniDirectional = True
    Left = 48
    Top = 112
  end
  object QMinPeriodo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select min(periodo) as minimo'
      '    from emp_periodos'
      '     where empresa = ?empresa'
      '        and ejercicio = ?ejercicio'
      
        '            and titulo not in ('#39'APERTURA'#39','#39'REGULARIZACI'#211'N'#39','#39'CIER' +
        'RE'#39');')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 256
  end
  object ExcelApplication: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 552
    Top = 120
  end
  object ExcelWorkbook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 552
    Top = 168
  end
  object frxLibroDiario: TfrxHYReport
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
    OnBeforePrint = frxLibroDiarioBeforePrint
    OnGetValue = frxLibroDiarioGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 152
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
    Left = 552
    Top = 72
  end
end
