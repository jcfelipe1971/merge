object DMRDiarioStock: TDMRDiarioStock
  OldCreateOrder = False
  OnCreate = DMRDiarioStockCreate
  OnDestroy = DMRDiarioStockDestroy
  Left = 537
  Top = 288
  Height = 357
  Width = 614
  object DSArt_Mov_Stock: TDataSource
    DataSet = QMArt_Mov_Stock
    Left = 135
    Top = 68
  end
  object QMArt_Mov_Stock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_MOV_STOCKS '
      
        '      where ((empresa=?empresa)and(ejercicio=?ejercicio)and(cana' +
        'l=?canal)and'
      
        '                 (fecha >= ?desde_fecha)and(fecha <= ?hasta_fech' +
        'a)and'
      
        '                 (periodo >= ?desde_periodo)and(periodo <= ?hast' +
        'a_periodo))'
      '      order by fecha  ')
    UniDirectional = False
    Left = 38
    Top = 70
  end
  object frDiarioStock: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Diario de Stock de Almacen'
    RebuildPrinter = False
    OnGetValue = frDiarioStockGetValue
    OnBeforePrint = frDiarioStockEnterRect
    OnEnterRect = frDiarioStockEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 38
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDSArt_Mov_Stock: TfrDBDataSet
    DataSource = DSArt_Mov_Stock
    Left = 242
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 241
    Top = 16
  end
  object xPeriodo_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_PERIODOS'
      'WHERE periodo=?periodo')
    UniDirectional = False
    Left = 358
    Top = 8
  end
  object xPeriodo_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_PERIODOS'
      'WHERE periodo=?periodo'
      ''
      '')
    UniDirectional = False
    Left = 358
    Top = 62
  end
  object DSxPeriodo_Desde: TDataSource
    DataSet = xPeriodo_Desde
    Left = 458
    Top = 8
  end
  object DSxPeriodo_Hasta: TDataSource
    DataSet = xPeriodo_Hasta
    Left = 458
    Top = 64
  end
  object QMinFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT min(fecha) as minimo'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      '    ((empresa=?empresa) and'
      '     (ejercicio=?ejercicio)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 345
    Top = 201
  end
  object QMaxFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(fecha) as maximo'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      '    ((empresa=?empresa) and'
      '     (ejercicio=?ejercicio)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 410
    Top = 201
  end
  object QMinPeriodo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT min(periodo) as minimo'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      '    ((empresa=?empresa) and'
      '     (ejercicio=?ejercicio)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 342
    Top = 139
  end
  object QMaxPeriodo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(periodo) as maximo'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      '    ((empresa=?empresa) and'
      '     (ejercicio=?ejercicio)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 412
    Top = 139
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 512
    Top = 200
  end
  object QInfoPeriodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure DAME_INFO_PERIODOS(?empresa,?ejercicio,?period' +
        'o)')
    Transaction = TLocal
    AutoTrans = True
    Left = 343
    Top = 261
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 415
    Top = 261
  end
  object frxDiarioStock: TfrxHYReport
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
    OnBeforePrint = frxDiarioStockBeforePrint
    OnGetValue = frxDiarioStockGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 135
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
    Left = 41
    Top = 128
  end
end
