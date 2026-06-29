object DMRPlanCuentas: TDMRPlanCuentas
  OldCreateOrder = False
  OnCreate = DMRPlanCuentasCreate
  OnDestroy = DMRPlanCuentasDestroy
  Left = 447
  Top = 272
  Height = 236
  Width = 652
  object frPlanCuentas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Plan Cuentas'
    RebuildPrinter = False
    OnGetValue = frPlanCuentasGetValue
    OnBeforePrint = frPlanCuentasEnterRect
    OnEnterRect = frPlanCuentasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 60
    Top = 20
    ReportForm = {19000000}
  end
  object DSQSPConCreaPlanCuentas: TDataSource
    DataSet = QSPConCreaPlanCuentas
    Left = 198
    Top = 74
  end
  object frDSQSPConCreaPlanCuentas: TfrDBDataSet
    DataSource = DSQSPConCreaPlanCuentas
    Left = 345
    Top = 74
  end
  object xCta_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM CON_CUENTAS'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and cuenta=?cuenta and pgc=?pgc'
      '')
    UniDirectional = False
    Left = 478
    Top = 48
  end
  object DSxCta_Desde: TDataSource
    DataSet = xCta_Desde
    Left = 556
    Top = 49
  end
  object xCta_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM CON_CUENTAS'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and cuenta=?cuenta and pgc=?pgc'
      '')
    UniDirectional = False
    Left = 478
    Top = 102
  end
  object DSxCta_Hasta: TDataSource
    DataSet = xCta_Hasta
    Left = 556
    Top = 100
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 279
    Top = 21
  end
  object QMinCuenta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select min(cuenta) as minimo from con_cuentas'
      'where'
      '  ((empresa=:empresa) and'
      '  (ejercicio=:ejercicio) and'
      '  (canal=:canal) and pgc =:pgc)')
    Transaction = TLocal
    AutoTrans = True
    Left = 188
    Top = 132
  end
  object QMaxCuenta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(cuenta) as maximo from con_cuentas'
      'where'
      '  ((empresa=:empresa) and'
      '  (ejercicio=:ejercicio) and'
      '  (canal=:canal) and pgc =:pgc)')
    Transaction = TLocal
    AutoTrans = True
    Left = 288
    Top = 132
  end
  object frxPlanCuentas: TfrxHYReport
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
    OnBeforePrint = frxPlanCuentasBeforePrint
    OnGetValue = frxPlanCuentasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 169
    Top = 20
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
    Left = 351
    Top = 21
  end
  object QSPConCreaPlanCuentas: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from c_crea_plan_cuentas(?EMPRESA,?EJERCICIO,?CANAL,?CU' +
        'ENTA_INF,?CUENTA_SUP,?RELLENO)'
      'order by cuenta, nivel')
    UniDirectional = False
    Left = 56
    Top = 88
    object QSPConCreaPlanCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QSPConCreaPlanCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object QSPConCreaPlanCuentasNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
  end
end
