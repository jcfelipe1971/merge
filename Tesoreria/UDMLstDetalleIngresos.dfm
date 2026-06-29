object DMLstDetalleIngresos: TDMLstDetalleIngresos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 314
  Top = 222
  Height = 312
  Width = 472
  object frIngresos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de ingresos'
    RebuildPrinter = False
    OnGetValue = frIngresosGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 256
    Top = 16
    ReportForm = {19000000}
  end
  object frxDBIngresos: TfrxDBDataset
    UserName = 'frxDBIngresos'
    CloseDataSource = False
    DataSource = DSIngresos
    Left = 368
    Top = 64
  end
  object frDBIngresos: TfrDBDataSet
    DataSource = DSIngresos
    Left = 256
    Top = 64
  end
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 48
    Top = 16
  end
  object QMIngresos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT * FROM PRO_LISTADO_INGRESOS(:EMPRESA, :SERIE, :FECHA_INI,' +
        ' :FECHA_FIN)'
      'ORDER BY 1, 2')
    SelectSQL.Strings = (
      
        'SELECT * FROM PRO_LISTADO_INGRESOS(:EMPRESA, :CANAL, :SERIE, :FE' +
        'CHA_INI, :FECHA_FIN, :USUARIO)'
      'ORDER BY REGISTRO, FECHA_REGISTRO')
    UniDirectional = False
    Left = 48
    Top = 64
  end
  object DSIngresos: TDataSource
    DataSet = QMIngresos
    Left = 152
    Top = 64
  end
  object frxIngresos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 42921.7273881713
    ReportOptions.LastChange = 42921.7273881713
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxIngresosGetValue
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 368
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMTotalesIngresos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT SUM(LIQUIDO) AS LIQUIDO, TIPO_EFECTO, COUNT(*) AS CANT_DO' +
        'C'
      
        'FROM PRO_LISTADO_INGRESOS(:EMPRESA, :SERIE, :FECHA_INI, :FECHA_F' +
        'IN)'
      'GROUP BY TIPO_EFECTO')
    SelectSQL.Strings = (
      
        'SELECT SUM(LIQUIDO) AS LIQUIDO, TIPO_EFECTO, DOC_TIPO, COUNT(*) ' +
        'AS CANT_DOC'
      
        'FROM PRO_LISTADO_INGRESOS(:EMPRESA, :CANAL, :SERIE, :FECHA_INI, ' +
        ':FECHA_FIN,:USUARIO)'
      'GROUP BY TIPO_EFECTO, DOC_TIPO')
    UniDirectional = False
    Left = 48
    Top = 112
  end
  object DSTotalesIngresos: TDataSource
    DataSet = QMTotalesIngresos
    Left = 152
    Top = 112
  end
  object frDBTotalesIngresos: TfrDBDataSet
    DataSource = DSTotalesIngresos
    Left = 256
    Top = 112
  end
end
