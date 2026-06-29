object DMLstStockResTallas: TDMLstStockResTallas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 439
  Top = 216
  Height = 394
  Width = 537
  object xMod_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ARTICULOS_MODELOS'
      'WHERE empresa=?empresa AND ref_proveedor=?modelo'
      '')
    UniDirectional = False
    Left = 336
    Top = 16
  end
  object DSxMod_Desde: TDataSource
    DataSet = xMod_Desde
    Left = 432
    Top = 16
  end
  object xMod_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ARTICULOS_MODELOS'
      'WHERE empresa=?empresa AND ref_proveedor=?modelo'
      '')
    UniDirectional = False
    Left = 336
    Top = 64
  end
  object DSxMod_Hasta: TDataSource
    DataSet = xMod_Hasta
    Left = 432
    Top = 64
  end
  object frStockResTallas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de inventario de Stock por Tallas'
    RebuildPrinter = False
    OnGetValue = frStockResTallasGetValue
    OnBeforePrint = frStockResTallasEnterRect
    OnEnterRect = frStockResTallasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 248
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
    Left = 40
    Top = 16
  end
  object xGrupo_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_GRUPOS_TALLAS'
      'WHERE  grupo=?grupo'
      '')
    UniDirectional = False
    Left = 336
    Top = 112
  end
  object DSxGrupo_Desde: TDataSource
    DataSet = xGrupo_Desde
    Left = 432
    Top = 112
  end
  object xGrupo_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_GRUPOS_TALLAS'
      'WHERE  grupo=?grupo')
    UniDirectional = False
    Left = 336
    Top = 160
  end
  object DSxGrupo_Hasta: TDataSource
    DataSet = xGrupo_Hasta
    Left = 432
    Top = 160
  end
  object SPStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_STOCK_RESUMIDO_TALLAS'
      '(?EMPRESA, ?EJERCICIO, ?CANAL,'
      '?MOD_DESDE, ?MOD_HASTA,'
      '?GRUPO_DESDE, ?GRUPO_HASTA,'
      '?TIPO_STOCK, ?ALMACEN, ?ENTRADA, ?FECHA)'
      'ORDER BY GRUPO_TALLA, MODELO, COLOR, TALLA')
    UniDirectional = False
    Left = 40
    Top = 64
  end
  object DSPStock: TDataSource
    DataSet = SPStock
    Left = 144
    Top = 64
  end
  object frDSStock: TfrDBDataSet
    DataSource = DSPStock
    Left = 248
    Top = 64
  end
  object SPStockStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT STOCK, TALLA FROM A_ART_STOCK_RESUMIDO_TALLAS'
      '(?EMPRESA, ?EJERCICIO, ?CANAL,'
      '?MOD_DESDE, ?MOD_HASTA,'
      '?GRUPO_DESDE, ?GRUPO_HASTA,'
      '?TIPO_STOCK, ?ALMACEN, ?ENTRADA, ?FECHA)'
      'WHERE'
      'GRUPO_TALLA = ?GRUPO_TALLA AND'
      'MODELO = ?MODELO AND'
      'COLOR = ?COLOR')
    UniDirectional = False
    Left = 40
    Top = 112
  end
  object DSSPStockStock: TDataSource
    DataSet = SPStockStock
    Left = 144
    Top = 112
  end
end
