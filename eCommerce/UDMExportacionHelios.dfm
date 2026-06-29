object DMExportacionHelios: TDMExportacionHelios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 203
  Height = 281
  Width = 528
  object SPStockAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM A_ART_EXPORTACION_HELIOS(:ENTRADA, :EMPRESA, :EJERCICIO, :C' +
        'ANAL, :ALMACEN, :ART_INI, :ART_FIN, :FECHA, :PROVEEDOR)')
    UniDirectional = False
    Left = 40
    Top = 64
    object SPStockAlmacenID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object SPStockAlmacenARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object SPStockAlmacenCODIGO_AS400: TFIBStringField
      DisplayLabel = 'Cod. AS400'
      FieldName = 'CODIGO_AS400'
      Size = 40
    end
    object SPStockAlmacenCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Prov.'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object SPStockAlmacenTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object SPStockAlmacenEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object SPStockAlmacenUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 5
    end
    object SPStockAlmacenID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object SPStockAlmacenLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object SPStockAlmacenCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object SPStockAlmacenFECHA_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabricacion'
      FieldName = 'FECHA_FABRICACION'
    end
    object SPStockAlmacenFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
  end
  object DSSPStockAlmacen: TDataSource
    DataSet = SPStockAlmacen
    Left = 136
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
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
    Left = 136
    Top = 16
  end
end
