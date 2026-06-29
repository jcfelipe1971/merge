object DMLstIncidencias: TDMLstIncidencias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 380
  Top = 268
  Height = 365
  Width = 600
  object xIncidencias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      '  WHERE EMPRESA = ?EMPRESA AND'
      '                 COD_CLI_PRO >=  ?COD_INI AND'
      '                 COD_CLI_PRO <=  ?COD_FIN AND'
      '                 TIPO_TERCERO = ?TIPO AND'
      '                 FECHA >= ?FECHA_INI AND'
      '                 FECHA<=  ?FECHA_FIN'
      '    ORDER BY COD_CLI_PRO,INCIDENCIA')
    UniDirectional = False
    Left = 36
    Top = 66
  end
  object DSxIncidencias: TDataSource
    DataSet = xIncidencias
    Left = 116
    Top = 67
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 116
    Top = 16
  end
  object xMaestroD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 132
    Top = 122
  end
  object DSxMaestroD: TDataSource
    DataSet = xMaestroD
    Left = 212
    Top = 123
  end
  object DSxMaestroH: TDataSource
    DataSet = xMaestroH
    Left = 212
    Top = 179
  end
  object xMaestroH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 132
    Top = 178
  end
  object xTipoMov: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_MOVIMIENTO'
      '  WHERE TIPO = ?DOC_TIPO')
    UniDirectional = False
    DataSource = DSxIncidencias
    Left = 137
    Top = 225
  end
  object DSxTipoMov: TDataSource
    DataSet = xTipoMov
    Left = 215
    Top = 225
  end
  object QRango: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 305
    Top = 130
  end
  object frxIncidencias: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.971597338
    ReportOptions.LastChange = 38691.971597338
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxIncidenciasBeforePrint
    OnGetValue = frxIncidenciasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 416
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBxIncidencias: TfrxDBDataset
    UserName = 'frxDBxIncidencias'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = DSxIncidencias
    Left = 504
    Top = 16
  end
  object frIncidencias: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frIncidenciasGetValue
    OnBeforePrint = frIncidenciasEnterRect
    OnEnterRect = frIncidenciasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 35
    Top = 16
    ReportForm = {19000000}
  end
  object frDSQMIncidencias: TfrDBDataSet
    DataSource = DSxIncidencias
    Left = 208
    Top = 65
  end
  object xTipoIncidencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO FROM SYS_TIPO_INCIDENCIA_KRI'
      'ORDER BY TIPO')
    UniDirectional = False
    Left = 137
    Top = 281
  end
  object DSxTipoIncidencia: TDataSource
    DataSet = xTipoIncidencia
    Left = 215
    Top = 281
  end
end
