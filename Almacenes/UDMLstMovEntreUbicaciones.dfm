object DMLstMovEntreUbicaciones: TDMLstMovEntreUbicaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 424
  Top = 194
  Height = 337
  Width = 549
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
    Top = 38
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo_largo as titulo from art_articulos'
      'where empresa = ?empresa and articulo = ?articulo')
    UniDirectional = False
    Left = 360
    Top = 24
    object xArticuloDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo_largo as titulo from art_articulos'
      'where empresa = ?empresa and articulo =?articulo')
    UniDirectional = False
    Left = 360
    Top = 80
    object xArticuloHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSxArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 440
    Top = 24
  end
  object DSxArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 440
    Top = 80
  end
  object frMovEntreUbic: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Mov. entre Ubicaciones'
    RebuildPrinter = False
    OnGetValue = frMovEntreUbicGetValue
    OnBeforePrint = frMovEntreUbicEnterRect
    OnEnterRect = frMovEntreUbicEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 27
    Top = 38
    ReportForm = {19000000}
  end
  object xMovEntreUbic: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from lst_mov_entre_ubicaciones(?empresa, ?ejercicio, ?c' +
        'anal, '
      ' ?artd, ?arth, ?fechad, ?fechah)')
    UniDirectional = False
    Left = 24
    Top = 96
    object xMovEntreUbicTITULO_O: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_O'
      Size = 60
    end
    object xMovEntreUbicCOMPOSICION_O: TFIBStringField
      DisplayLabel = 'Composicion O.'
      FieldName = 'COMPOSICION_O'
      Size = 15
    end
    object xMovEntreUbicFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xMovEntreUbicUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xMovEntreUbicENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xMovEntreUbicTITULO_D: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_D'
      Size = 60
    end
    object xMovEntreUbicCOMPOSICION_D: TFIBStringField
      DisplayLabel = 'Composicion D.'
      FieldName = 'COMPOSICION_D'
      Size = 15
    end
    object xMovEntreUbicARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xMovEntreUbicTITULO_ART: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xMovEntreUbicMOVIMIENTO: TIntegerField
      DisplayLabel = 'Mov. Stock'
      FieldName = 'MOVIMIENTO'
    end
  end
  object DSxMovEntreUbic: TDataSource
    DataSet = xMovEntreUbic
    Left = 112
    Top = 96
  end
  object frDBxMovEntreUbic: TfrDBDataSet
    DataSource = DSxMovEntreUbic
    Left = 224
    Top = 96
  end
  object frxMovEntreUbic: TfrxHYReport
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
    OnBeforePrint = frxMovEntreUbicBeforePrint
    OnGetValue = frxMovEntreUbicGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 111
    Top = 38
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
      'nowait')
    Left = 288
    Top = 30
  end
end
