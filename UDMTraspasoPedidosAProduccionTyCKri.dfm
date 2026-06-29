object DMTraspasoPedidosAProduccionTyCKri: TDMTraspasoPedidosAProduccionTyCKri
  OldCreateOrder = False
  Left = 208
  Top = 103
  Height = 249
  Width = 355
  object xStocksAlmacenesModeloColor: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM XGET_STOCK_AMC_ALM(:EMPRESA, :CANAL, :ID_A_M_C, '#39'NOW'#39', :MOD' +
        'O, 0, '#39#39')')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 72
    Top = 8
    object xStocksAlmacenesModeloColorALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xStocksAlmacenesModeloColorUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xStocksAlmacenesModeloColorVALOR_UNIDADES: TFloatField
      DisplayLabel = 'Valor Uds.'
      FieldName = 'VALOR_UNIDADES'
    end
    object xStocksAlmacenesModeloColorHORMA: TIntegerField
      DisplayLabel = 'Horma'
      FieldName = 'HORMA'
    end
    object xStocksAlmacenesModeloColorS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object xStocksAlmacenesModeloColorID_A_C: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_C'
    end
    object xStocksAlmacenesModeloColorT01: TFloatField
      FieldName = 'T01'
    end
    object xStocksAlmacenesModeloColorT02: TFloatField
      FieldName = 'T02'
    end
    object xStocksAlmacenesModeloColorT03: TFloatField
      FieldName = 'T03'
    end
    object xStocksAlmacenesModeloColorT04: TFloatField
      FieldName = 'T04'
    end
    object xStocksAlmacenesModeloColorT05: TFloatField
      FieldName = 'T05'
    end
    object xStocksAlmacenesModeloColorT06: TFloatField
      FieldName = 'T06'
    end
    object xStocksAlmacenesModeloColorT07: TFloatField
      FieldName = 'T07'
    end
    object xStocksAlmacenesModeloColorT08: TFloatField
      FieldName = 'T08'
    end
    object xStocksAlmacenesModeloColorT09: TFloatField
      FieldName = 'T09'
    end
    object xStocksAlmacenesModeloColorT10: TFloatField
      FieldName = 'T10'
    end
    object xStocksAlmacenesModeloColorT11: TFloatField
      FieldName = 'T11'
    end
    object xStocksAlmacenesModeloColorT12: TFloatField
      FieldName = 'T12'
    end
    object xStocksAlmacenesModeloColorT13: TFloatField
      FieldName = 'T13'
    end
    object xStocksAlmacenesModeloColorT14: TFloatField
      FieldName = 'T14'
    end
    object xStocksAlmacenesModeloColorT15: TFloatField
      FieldName = 'T15'
    end
    object xStocksAlmacenesModeloColorT16: TFloatField
      FieldName = 'T16'
    end
    object xStocksAlmacenesModeloColorT17: TFloatField
      FieldName = 'T17'
    end
    object xStocksAlmacenesModeloColorT18: TFloatField
      FieldName = 'T18'
    end
    object xStocksAlmacenesModeloColorT19: TFloatField
      FieldName = 'T19'
    end
    object xStocksAlmacenesModeloColorT20: TFloatField
      FieldName = 'T20'
    end
    object xStocksAlmacenesModeloColorT21: TFloatField
      FieldName = 'T21'
    end
    object xStocksAlmacenesModeloColorT22: TFloatField
      FieldName = 'T22'
    end
    object xStocksAlmacenesModeloColorID_A_M: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M'
    end
    object xStocksAlmacenesModeloColorID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
  end
  object xStocksAlmacenesModelo: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM XGET_STOCK_AM_ALM(:EMPRESA, :CANAL, :ID_A_M, '#39'NOW'#39', :MODO, ' +
        '0, '#39#39')'
      'ORDER BY S_COLOR, ALMACEN')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 72
    Top = 56
    object xStocksAlmacenesModeloUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xStocksAlmacenesModeloVALOR_UNIDADES: TFloatField
      DisplayLabel = 'Valor Uds.'
      FieldName = 'VALOR_UNIDADES'
    end
    object xStocksAlmacenesModeloALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xStocksAlmacenesModeloPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xStocksAlmacenesModeloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xStocksAlmacenesModeloAGNO: TFIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'AGNO'
      Size = 2
    end
    object xStocksAlmacenesModeloTEMPORADA: TIntegerField
      DisplayLabel = 'Temporada'
      FieldName = 'TEMPORADA'
    end
    object xStocksAlmacenesModeloSECCION: TIntegerField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
    end
    object xStocksAlmacenesModeloP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object xStocksAlmacenesModeloP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xStocksAlmacenesModeloHORMA: TIntegerField
      DisplayLabel = 'Horma'
      FieldName = 'HORMA'
    end
    object xStocksAlmacenesModeloS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object xStocksAlmacenesModeloID_A_C: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_C'
    end
    object xStocksAlmacenesModeloT01: TFloatField
      FieldName = 'T01'
    end
    object xStocksAlmacenesModeloT02: TFloatField
      FieldName = 'T02'
    end
    object xStocksAlmacenesModeloT03: TFloatField
      FieldName = 'T03'
    end
    object xStocksAlmacenesModeloT04: TFloatField
      FieldName = 'T04'
    end
    object xStocksAlmacenesModeloT05: TFloatField
      FieldName = 'T05'
    end
    object xStocksAlmacenesModeloT06: TFloatField
      FieldName = 'T06'
    end
    object xStocksAlmacenesModeloT07: TFloatField
      FieldName = 'T07'
    end
    object xStocksAlmacenesModeloT08: TFloatField
      FieldName = 'T08'
    end
    object xStocksAlmacenesModeloT09: TFloatField
      FieldName = 'T09'
    end
    object xStocksAlmacenesModeloT10: TFloatField
      FieldName = 'T10'
    end
    object xStocksAlmacenesModeloT11: TFloatField
      FieldName = 'T11'
    end
    object xStocksAlmacenesModeloT12: TFloatField
      FieldName = 'T12'
    end
    object xStocksAlmacenesModeloT13: TFloatField
      FieldName = 'T13'
    end
    object xStocksAlmacenesModeloT14: TFloatField
      FieldName = 'T14'
    end
    object xStocksAlmacenesModeloT15: TFloatField
      FieldName = 'T15'
    end
    object xStocksAlmacenesModeloT16: TFloatField
      FieldName = 'T16'
    end
    object xStocksAlmacenesModeloT17: TFloatField
      FieldName = 'T17'
    end
    object xStocksAlmacenesModeloT18: TFloatField
      FieldName = 'T18'
    end
    object xStocksAlmacenesModeloT19: TFloatField
      FieldName = 'T19'
    end
    object xStocksAlmacenesModeloT20: TFloatField
      FieldName = 'T20'
    end
    object xStocksAlmacenesModeloT21: TFloatField
      FieldName = 'T21'
    end
    object xStocksAlmacenesModeloT22: TFloatField
      FieldName = 'T22'
    end
    object xStocksAlmacenesModeloID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
  end
  object DSxStocksAlmacenesModeloColor: TDataSource
    DataSet = xStocksAlmacenesModeloColor
    Left = 240
    Top = 8
  end
  object xget_tallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from xget_tallas')
    UniDirectional = False
    Left = 72
    Top = 104
    object xget_tallasNVISIBLE: TIntegerField
      DisplayLabel = 'Nro. Visible'
      FieldName = 'NVISIBLE'
    end
    object xget_tallasGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 3
    end
    object xget_tallasT01: TFIBStringField
      FieldName = 'T01'
      Size = 8
    end
    object xget_tallasT02: TFIBStringField
      FieldName = 'T02'
      Size = 8
    end
    object xget_tallasT03: TFIBStringField
      FieldName = 'T03'
      Size = 8
    end
    object xget_tallasT04: TFIBStringField
      FieldName = 'T04'
      Size = 8
    end
    object xget_tallasT05: TFIBStringField
      FieldName = 'T05'
      Size = 8
    end
    object xget_tallasT06: TFIBStringField
      FieldName = 'T06'
      Size = 8
    end
    object xget_tallasT07: TFIBStringField
      FieldName = 'T07'
      Size = 8
    end
    object xget_tallasT08: TFIBStringField
      FieldName = 'T08'
      Size = 8
    end
    object xget_tallasT09: TFIBStringField
      FieldName = 'T09'
      Size = 8
    end
    object xget_tallasT10: TFIBStringField
      FieldName = 'T10'
      Size = 8
    end
    object xget_tallasT11: TFIBStringField
      FieldName = 'T11'
      Size = 8
    end
    object xget_tallasT12: TFIBStringField
      FieldName = 'T12'
      Size = 8
    end
    object xget_tallasT13: TFIBStringField
      FieldName = 'T13'
      Size = 8
    end
    object xget_tallasT14: TFIBStringField
      FieldName = 'T14'
      Size = 8
    end
    object xget_tallasT15: TFIBStringField
      FieldName = 'T15'
      Size = 8
    end
    object xget_tallasT16: TFIBStringField
      FieldName = 'T16'
      Size = 8
    end
    object xget_tallasT17: TFIBStringField
      FieldName = 'T17'
      Size = 8
    end
    object xget_tallasT18: TFIBStringField
      FieldName = 'T18'
      Size = 8
    end
    object xget_tallasT19: TFIBStringField
      FieldName = 'T19'
      Size = 8
    end
    object xget_tallasT20: TFIBStringField
      FieldName = 'T20'
      Size = 8
    end
    object xget_tallasT21: TFIBStringField
      FieldName = 'T21'
      Size = 8
    end
    object xget_tallasT22: TFIBStringField
      FieldName = 'T22'
      Size = 8
    end
    object xget_tallasID_G_T: TIntegerField
      DisplayLabel = 'Id Grupo Tallas'
      FieldName = 'ID_G_T'
    end
  end
end
