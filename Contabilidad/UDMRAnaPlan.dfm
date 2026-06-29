object DMRAnaPlan: TDMRAnaPlan
  OldCreateOrder = False
  OnCreate = DMRPlanCuentasCreate
  OnDestroy = DMRPlanCuentasDestroy
  Left = 366
  Top = 299
  Height = 282
  Width = 469
  object xAnaPlan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select centro_coste,titulo,nivel from ana_centros_coste'
      '  where((empresa       = ?empresa      ) and'
      '        (ejercicio     = ?ejercicio    ) and'
      '        (canal         = ?canal        ) and'
      '        (plan_contable = ?plan_contable) and'
      '        (centro_coste >= ?centro_coste_ini) and'
      '        (centro_coste <= ?centro_coste_fin) and'
      '        (nivel        >= ?nivel_ini       ) and'
      '        (nivel        <= ?nivel_fin       ))'
      'order by centro_coste, nivel')
    UniDirectional = False
    Left = 28
    Top = 74
    object xAnaPlanCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xAnaPlanTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAnaPlanNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
  end
  object frAnaPlan: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Plan Cuentas'
    RebuildPrinter = False
    OnGetValue = frAnaPlanGetValue
    OnBeforePrint = frAnaPlanEnterRect
    OnEnterRect = frAnaPlanEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 28
    Top = 20
    ReportForm = {19000000}
  end
  object DSxAnaPlan: TDataSource
    DataSet = xAnaPlan
    Left = 106
    Top = 74
  end
  object frDSAnaPlan: TfrDBDataSet
    DataSource = DSxAnaPlan
    Left = 193
    Top = 74
  end
  object xCc_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ana_centros_coste'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and plan_contable=?plan_contable and centro_coste=?centro_coste'
      '')
    UniDirectional = False
    Left = 318
    Top = 16
  end
  object DSxCc_Desde: TDataSource
    DataSet = xCc_Desde
    Left = 396
    Top = 17
  end
  object xCc_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo FROM ana_centros_coste'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and plan_contable=?plan_contable and centro_coste=?centro_coste'
      '')
    UniDirectional = False
    Left = 318
    Top = 70
  end
  object DSxCc_Hasta: TDataSource
    DataSet = xCc_Hasta
    Left = 396
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 21
  end
  object frxAnaPlan: TfrxHYReport
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
    OnBeforePrint = frxAnaPlanBeforePrint
    OnGetValue = frxAnaPlanGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 110
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
    Left = 200
    Top = 149
  end
end
