object DMRMargenProductos: TDMRMargenProductos
  OldCreateOrder = False
  OnCreate = DMRMargenProductosCreate
  OnDestroy = DMRMargenProductosDestroy
  Left = 380
  Top = 291
  Height = 294
  Width = 526
  object frMargenProductos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frMargenProductosGetValue
    OnBeforePrint = frMargenProductosEnterRect
    OnEnterRect = frMargenProductosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 46
    Top = 18
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 246
    Top = 18
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS_EF'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS_EF'
      'WHERE empresa=?empresa and articulo=?articulo'
      '')
    UniDirectional = False
    Left = 349
    Top = 23
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS_EF'
      'WHERE empresa=?empresa and articulo=?articulo'
      '')
    UniDirectional = False
    Left = 349
    Top = 75
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 429
    Top = 24
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 430
    Top = 77
  end
  object xMargenProductos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from '
      'a_art_ficha_margen_producto'
      '(?EMPRESA,?EJERCICIO,?CANAL,?ARTICULO_INI,?ARTICULO_FIN,'
      '?FECHA_INI,?FECHA_FIN,?MODO,?MONEDA,?MOSTRARCEROS,'
      '?DPROVEEDOR,?HPROVEEDOR)')
    UniDirectional = False
    Left = 42
    Top = 84
    object xMargenProductosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xMargenProductosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xMargenProductosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xMargenProductosUNI_VENDIDAS: TFloatField
      DisplayLabel = 'Uds. Vendidas'
      FieldName = 'UNI_VENDIDAS'
    end
    object xMargenProductosIMP_VENTA: TFloatField
      DisplayLabel = 'Imp. Venta'
      FieldName = 'IMP_VENTA'
    end
    object xMargenProductosPR_VENTAS: TFloatField
      DisplayLabel = 'PR Ventas'
      FieldName = 'PR_VENTAS'
    end
    object xMargenProductosUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object xMargenProductosUNI_DEPOSITO: TFloatField
      DisplayLabel = 'Uds. Deposito'
      FieldName = 'UNI_DEPOSITO'
    end
    object xMargenProductosUNI_COMPRAS: TFloatField
      DisplayLabel = 'Uds. Compras'
      FieldName = 'UNI_COMPRAS'
    end
    object xMargenProductosIMP_COMPRAS: TFloatField
      DisplayLabel = 'Imp. Compras'
      FieldName = 'IMP_COMPRAS'
    end
    object xMargenProductosPR_COMPRAS: TFloatField
      DisplayLabel = 'PR Compras'
      FieldName = 'PR_COMPRAS'
    end
    object xMargenProductosSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
  end
  object DSxMargenProductos: TDataSource
    DataSet = xMargenProductos
    Left = 141
    Top = 84
  end
  object frDBxMargenProductos: TfrDBDataSet
    DataSource = DSxMargenProductos
    Left = 251
    Top = 84
  end
  object QMinArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS_EF'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      '     CANAL=?CANAL'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 34
    Top = 182
  end
  object QMaxArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS_EF'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      '     CANAL=?CANAL')
    Transaction = TLocal
    AutoTrans = True
    Left = 98
    Top = 182
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 348
    Top = 135
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 432
    Top = 135
  end
  object frxMargenProductos: TfrxHYReport
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
    OnBeforePrint = frxMargenProductosBeforePrint
    OnGetValue = frxMargenProductosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 141
    Top = 18
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
    Left = 254
    Top = 170
  end
end
