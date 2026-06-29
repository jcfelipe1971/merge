object DMLstArtEscandallo: TDMLstArtEscandallo
  OldCreateOrder = False
  OnCreate = DMLstArtEscandalloCreate
  OnDestroy = DMLstArtEscandalloDestroy
  Left = 501
  Top = 374
  Height = 249
  Width = 522
  object QMArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO >= :ARTICULO_DESDE AND'
      'ARTICULO <= :ARTICULO_HASTA'
      'ORDER BY ARTICULO')
    UniDirectional = False
    Left = 32
    Top = 64
  end
  object DSQMArticulos: TDataSource
    DataSet = QMArticulos
    Left = 112
    Top = 64
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO'
      'ORDER BY ARTICULO, DETALLE')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 32
    Top = 112
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDetalleDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object xDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDetalleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xDetalleUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 112
    Top = 112
  end
  object frDBQMArticulos: TfrDBDataSet
    DataSource = DSQMArticulos
    Left = 192
    Top = 64
  end
  object frDBxDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 192
    Top = 112
  end
  object frEscandallo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frEscandalloGetValue
    OnBeforePrint = frEscandalloEnterRect
    OnEnterRect = frEscandalloEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
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
    Left = 192
    Top = 16
  end
  object frxEscandallo: TfrxHYReport
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
    OnBeforePrint = frxEscandalloBeforePrint
    OnGetValue = frxEscandalloGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 112
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
