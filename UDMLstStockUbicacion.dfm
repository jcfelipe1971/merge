object DMLstStockUbicacion: TDMLstStockUbicacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 382
  Top = 360
  Height = 398
  Width = 476
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 360
    Top = 16
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
    Left = 40
    Top = 160
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
    Left = 40
    Top = 208
    object xArticuloHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xUbicacionD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_almacenes_ubicaciones '
      'where empresa = ?empresa and composicion = ?composicion')
    UniDirectional = False
    Left = 40
    Top = 256
    object xUbicacionDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xUbicacionH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_almacenes_ubicaciones'
      'where empresa=?empresa and composicion=?composicion')
    UniDirectional = False
    Left = 40
    Top = 304
    object xUbicacionHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSxArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 120
    Top = 160
  end
  object DSxArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 120
    Top = 208
  end
  object DSxUbicacionD: TDataSource
    DataSet = xUbicacionD
    Left = 120
    Top = 256
  end
  object DSxUbicacionH: TDataSource
    DataSet = xUbicacionH
    Left = 120
    Top = 304
  end
  object frStockUb: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Diario de Stock de Almacen'
    RebuildPrinter = False
    OnGetValue = frStockUbGetValue
    OnBeforePrint = frStockUbEnterRect
    OnEnterRect = frStockUbEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 200
    Top = 16
    ReportForm = {19000000}
  end
  object xListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_STOCK_POR_UBICACION(?ENTRADA,?EMPRESA,?CANAL,?' +
        'UBICACION_DESDE,?UBICACION_HASTA,?ARTICULO_DESDE,?ARTICULO_HASTA' +
        ')')
    UniDirectional = False
    AfterOpen = xListadoAfterOpen
    BeforeClose = xListadoBeforeClose
    Left = 40
    Top = 64
  end
  object DSxListado: TDataSource
    DataSet = xListado
    Left = 120
    Top = 64
  end
  object frDBxListado: TfrDBDataSet
    DataSource = DSxListado
    Left = 200
    Top = 64
  end
  object frxStockUb: TfrxHYReport
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
    OnBeforePrint = frxStockUbBeforePrint
    OnGetValue = frxStockUbGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 280
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
      'nowait')
    Left = 360
    Top = 64
  end
  object xLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT  LOTE, CADUCIDAD, COUNT(*) AS EXISTENCIA FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO =  ?ARTICULO AND'
      'ID_UBICACION = ?ID_UBICACION'
      'GROUP BY LOTE, CADUCIDAD')
    UniDirectional = False
    DataSource = DSxListado
    BeforeOpen = xLoteBeforeOpen
    Left = 40
    Top = 112
    object xLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xLoteCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object xLoteEXISTENCIA: TIntegerField
      DisplayLabel = 'Existencia'
      FieldName = 'EXISTENCIA'
    end
  end
  object DSxLote: TDataSource
    DataSet = xLote
    Left = 120
    Top = 112
  end
  object frDBDxLote: TfrDBDataSet
    DataSet = xLote
    Left = 200
    Top = 112
  end
end
