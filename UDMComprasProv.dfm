object DMComprasProv: TDMComprasProv
  OldCreateOrder = False
  OnCreate = DMComprasProvCreate
  Left = 393
  Top = 360
  Height = 278
  Width = 420
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 44
    Top = 14
  end
  object xComprasProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_COMPRAS_ART_PROV'
      '  where entrada=?entrada')
    UniDirectional = False
    Left = 44
    Top = 76
    object xComprasProveedorARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xComprasProveedorTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xComprasProveedorUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xComprasProveedorCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xComprasProveedorENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object DSxComprasProveedor: TDataSource
    DataSet = xComprasProveedor
    Left = 156
    Top = 76
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS' 
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 44
    Top = 134
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 138
    Top = 134
  end
  object SPTotal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select sum(coste) as total from tmp_compras_art_prov '
      'where entrada=?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 276
    Top = 32
  end
  object SPComprasProv: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure g_compras_articulos_proveedor'
      
        '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?PROVEEDOR,?BORRAR,?MODO,?ENT' +
        'RADA,?MONEDA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 276
    Top = 80
  end
end
