object DMRInventarioStocks: TDMRInventarioStocks
  OldCreateOrder = False
  OnCreate = DMRInventarioStocksCreate
  OnDestroy = DMRInventario_StocksDestroy
  Left = 373
  Top = 177
  Height = 378
  Width = 771
  object QSPInventarioStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM a_art_inventario_stocks(?ENTRADA,?EMPRESA, ?EJERCI' +
        'CIO, '
      '   ?CANAL, ?PERIODO, ?ALMACEN, ?ART_INI, ?ART_FIN, ?FAM_INI, '
      '   ?FAM_FIN, ?TIPO_CALCULO, ?TIPO_ACUMULADO, '
      '   ?LST_ART_SIN_STOC,?MONEDA)')
    UniDirectional = False
    AfterOpen = QSPInventarioStockAfterOpen
    Left = 40
    Top = 56
    object QSPInventarioStockARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QSPInventarioStockDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object QSPInventarioStockUNI_ENT_PER: TFloatField
      DisplayLabel = 'Uds. Entr. Per.'
      FieldName = 'UNI_ENT_PER'
    end
    object QSPInventarioStockUNI_ENT_ACU: TFloatField
      DisplayLabel = 'Uds. en Acu.'
      FieldName = 'UNI_ENT_ACU'
    end
    object QSPInventarioStockUNI_SAL_PER: TFloatField
      DisplayLabel = 'Uds. Sal. Ped.'
      FieldName = 'UNI_SAL_PER'
    end
    object QSPInventarioStockUNI_SAL_ACU: TFloatField
      DisplayLabel = 'Uds. Sal. Acu.'
      FieldName = 'UNI_SAL_ACU'
    end
    object QSPInventarioStockUNI_SALD_ACU: TFloatField
      DisplayLabel = 'Uds. Sal. Acu.'
      FieldName = 'UNI_SALD_ACU'
    end
    object QSPInventarioStockPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QSPInventarioStockV_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'V_EMPRESA'
    end
    object QSPInventarioStockV_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'V_EJERCICIO'
    end
    object QSPInventarioStockV_CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'V_CANAL'
    end
    object QSPInventarioStockV_ALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'V_ALMACEN'
      Size = 3
    end
  end
  object DSInventarioStock: TDataSource
    DataSet = QSPInventarioStock
    Left = 144
    Top = 56
  end
  object frDSInventarioStock: TfrDBDataSet
    DataSource = DSInventarioStock
    Left = 248
    Top = 56
  end
  object frInventario_Stock: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de inventario de Stock de Almac'#233
    RebuildPrinter = False
    OnGetValue = frInventario_StockGetValue
    OnBeforePrint = frInventario_StockEnterRect
    OnEnterRect = frInventario_StockEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 568
    Top = 8
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 360
    Top = 8
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 360
    Top = 56
  end
  object xFamilia_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_FAMILIAS'
      'WHERE empresa=?empresa AND familia=?familia'
      '')
    UniDirectional = False
    Left = 360
    Top = 104
  end
  object xFamilia_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_FAMILIAS'
      'WHERE empresa=?empresa AND familia=?familia'
      '')
    UniDirectional = False
    Left = 360
    Top = 152
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 464
    Top = 8
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 464
    Top = 56
  end
  object DSxFamilia_Desde: TDataSource
    DataSet = xFamilia_Desde
    Left = 464
    Top = 104
  end
  object DSxFamilia_Hasta: TDataSource
    DataSet = xFamilia_Hasta
    Left = 464
    Top = 152
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
    Left = 360
    Top = 296
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 464
    Top = 296
  end
  object xNumSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE EMPRESA = ?V_EMPRESA AND'
      '               CANAL = ?V_CANAL AND'
      '               ALMACEN = ?V_ALMACEN AND'
      '               ARTICULO = ?ARTICULO AND'
      '               ESTADO = 1'
      '')
    UniDirectional = False
    DataSource = DSInventarioStock
    Left = 40
    Top = 104
    object xNumSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xNumSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xNumSeriesCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xNumSeriesNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xNumSeriesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xNumSeriesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xNumSeriesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xNumSeriesFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object xNumSeriesFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Gar. Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object xNumSeriesFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Gar. Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object xNumSeriesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xNumSeriesDEVUELTO_PROV: TIntegerField
      DisplayLabel = 'Dev. Prov.'
      FieldName = 'DEVUELTO_PROV'
    end
    object xNumSeriesCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xNumSeriesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSxNumSeries: TDataSource
    DataSet = xNumSeries
    Left = 144
    Top = 104
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SOF_ARTICULOS_LOTES(?V_EMPRESA,?ARTICULO,?V_CANAL)'
      'WHERE EMPRESA = ?V_EMPRESA AND'
      '               CANAL = ?V_CANAL AND'
      '      ALMACEN = ?V_ALMACEN'
      '      AND ARTICULO=?ARTICULO'
      '')
    UniDirectional = False
    DataSource = DSInventarioStock
    Left = 40
    Top = 152
    object xLotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xLotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object xLotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xLotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object xLotesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 144
    Top = 152
  end
  object frDSxNumSeries: TfrDBDataSet
    DataSource = DSxNumSeries
    Left = 248
    Top = 104
  end
  object frDSxLotes: TfrDBDataSet
    DataSource = DSxLotes
    Left = 248
    Top = 152
  end
  object frxInventario_Stock: TfrxHYReport
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
    OnBeforePrint = frxInventario_StockBeforePrint
    OnGetValue = frxInventario_StockGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
    Top = 8
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
    Left = 648
    Top = 8
  end
end
