object DMRTesoreria: TDMRTesoreria
  OldCreateOrder = False
  OnCreate = DMRTesoreriaCreate
  OnDestroy = DMRTesoreriaDestroy
  Left = 521
  Top = 266
  Height = 235
  Width = 431
  object frDBTesoreria: TfrDBDataSet
    DataSource = DSAsientos
    Left = 205
    Top = 68
  end
  object frHYTesoreria: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frHYTesoreriaGetValue
    OnBeforePrint = frHYTesoreriaEnterRect
    OnEnterRect = frHYTesoreriaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 13
    ReportForm = {19000000}
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS')
    UniDirectional = False
    Left = 276
    Top = 13
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
    object xMonedasSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object xMonedasDEC_VER: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
    object xMonedasDEC_CALCULOS: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object xMonedasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 360
    Top = 14
  end
  object QMinFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select min(vencimiento) as minimo'
      'from EMP_CARTERA_DETALLE'
      'where'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal) and'
      '  (pagado=?pagado))')
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 144
  end
  object DSAsientos: TDataSource
    DataSet = QMAsientos
    Left = 120
    Top = 68
  end
  object QMAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM C_CREA_LISTADO_TESORERIA('
      ':EMPRESA, :EJERCICIO, :CANAL, :DESDE, :HASTA, :MONEDA, :FECHA,'
      ':COMP, :COMC, :COM_NUMDOC, :COM_TITCUE)')
    UniDirectional = False
    Left = 32
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 12
  end
  object QMaxFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(vencimiento) as maximo'
      'from EMP_CARTERA_DETALLE'
      'where'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal) and'
      '  (pagado=?pagado)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 104
    Top = 144
  end
  object frxHYTesoreria: TfrxHYReport
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
    OnBeforePrint = frxHYTesoreriaBeforePrint
    OnGetValue = frxHYTesoreriaGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 119
    Top = 13
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
    Left = 208
    Top = 148
  end
end
