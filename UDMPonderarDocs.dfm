object DMPonderarDocs: TDMPonderarDocs
  OldCreateOrder = False
  OnCreate = DMPonderarDocsCreate
  Left = 468
  Top = 380
  Height = 265
  Width = 399
  object xAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN')
    UniDirectional = False
    Left = 40
    Top = 8
  end
  object DSxAlmacen: TDataSource
    DataSet = xAlmacen
    Left = 136
    Top = 8
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS_EF'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 40
    Top = 104
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 136
    Top = 104
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS_EF'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 40
    Top = 152
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 136
    Top = 152
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 256
    Top = 8
  end
  object xSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE,TITULO FROM VER_SERIES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND SERIE=?SERIE')
    UniDirectional = False
    Left = 40
    Top = 56
    object xSerieSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSerieTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSerie: TDataSource
    DataSet = xSerie
    Left = 136
    Top = 56
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 256
    Top = 56
  end
end
