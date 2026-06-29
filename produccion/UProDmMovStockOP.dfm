object ProDMMovStockOP: TProDMMovStockOP
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 553
  Top = 248
  Height = 373
  Width = 368
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 232
    Top = 32
  end
  object QMovStocks: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      
        'N_MOV_STOCK, PERIODO, ALMACEN, ARTICULO, TIPO_OPER, FECHA, COMEN' +
        'TARIO,'
      'UNIDADES, PRECIO, ORIGEN, (UNIDADES * PRECIO) AS IMPORTE,'
      
        'DOC_NUMERO, DOC_SERIE, ENTRADA, ACTIVO, UNIDADES_EXT, PRECIO_SIN' +
        '_DTO,'
      'MOV_VIRTUAL, ID_A, ID_MOV_STOCKS'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'DOC_SERIE = :SERIES AND'
      'DOC_NUMERO = :RIG_OF'
      'UNION'
      'SELECT'
      
        'N_MOV_STOCK, PERIODO, ALMACEN, ARTICULO, TIPO_OPER, FECHA, COMEN' +
        'TARIO,'
      'UNIDADES, PRECIO, ORIGEN, (UNIDADES * PRECIO) AS IMPORTE,'
      
        'DOC_NUMERO, DOC_SERIE, ENTRADA, ACTIVO, UNIDADES_EXT, PRECIO_SIN' +
        '_DTO,'
      'MOV_VIRTUAL, ID_A, ID_MOV_STOCKS'
      'FROM ART_MOV_STOCKS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'DOC_SERIE = :SERIES AND'
      'DOC_NUMERO IN (SELECT RIG_OF'
      '               FROM PRO_ORD'
      '               WHERE'
      '               PADRE_SUBORDEN = :RIG_OF AND'
      '               EMPRESA = :EMPRESA AND'
      '               EJERCICIO = :EJERCICIO AND'
      '               CANAL = :CANAL AND'
      '               SERIES = :SERIES AND'
      '               RIG_OF <> :RIG_OF)')
    UniDirectional = False
    DataSource = DSxOrden
    Left = 48
    Top = 80
    object QMovStocksN_MOV_STOCK: TIntegerField
      DisplayLabel = 'Num. Mov Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object QMovStocksPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMovStocksALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMovStocksARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMovStocksTIPO_OPER: TFIBStringField
      DisplayLabel = 'E/S'
      FieldName = 'TIPO_OPER'
      Size = 1
    end
    object QMovStocksFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMovStocksCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMovStocksUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMovStocksPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMovStocksORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QMovStocksIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMovStocksACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMovStocksUNIDADES_EXT: TFloatField
      DisplayLabel = 'Unidades Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMovStocksPRECIO_SIN_DTO: TFloatField
      DisplayLabel = 'Precio Sin Dto.'
      FieldName = 'PRECIO_SIN_DTO'
    end
    object QMovStocksMOV_VIRTUAL: TIntegerField
      DisplayLabel = 'Mov. Virtual'
      FieldName = 'MOV_VIRTUAL'
    end
    object QMovStocksID_A: TIntegerField
      DisplayLabel = 'Id Art'#237'culo'
      FieldName = 'ID_A'
    end
    object QMovStocksID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'Id Mov. Stocks'
      FieldName = 'ID_MOV_STOCKS'
    end
    object QMovStocksDesc_Articulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkCalculated
      FieldName = 'Desc_Articulo'
      OnGetText = QMovStocksDesc_ArticuloGetText
      Size = 60
      Calculated = True
    end
    object QMovStocksDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMovStocksDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
  end
  object DSxQMovStocks: TDataSource
    DataSet = QMovStocks
    Left = 144
    Top = 80
  end
  object xOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      'ID_ORDEN, EMPRESA, EJERCICIO, SERIES, CANAL, RIG_OF, '
      'COMPUESTO, ID_MOV_STOCK'
      'FROM PRO_ORD '
      'WHERE '
      'ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    AfterOpen = xOrdenAfterOpen
    BeforeClose = xOrdenBeforeClose
    Left = 49
    Top = 32
    object xOrdenID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xOrdenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xOrdenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xOrdenSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object xOrdenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xOrdenRIG_OF: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'RIG_OF'
    end
    object xOrdenCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xOrdenID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
  end
  object DSxOrden: TDataSource
    DataSet = xOrden
    Left = 144
    Top = 32
  end
  object QGesDetallesSt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.ORIGEN, CAB.FECHA, CAB.ALMACEN_ORI, CAB.ALMACEN_DST, ' +
        'CAB.TIPO_OPERACION,'
      'DET.*,'
      
        'LOT.ID_LOTE, LOT.LOTE, LOT.CANTIDAD, LOT.SUBLINEA, LOT.F_FABRICA' +
        'CION, LOT.F_ENVASADO, LOT.F_CADUCIDAD,'
      'A.LOTES'
      'FROM GES_CABECERAS_ST CAB'
      'LEFT JOIN GES_DETALLES_ST DET'
      'ON (CAB.ID_ST = DET.ID_ST)'
      'LEFT JOIN GES_DETALLES_ST_LOTES LOT'
      'ON (DET.ID_DETALLES_ST = LOT.ID_DETALLES_ST)'
      'JOIN ART_ARTICULOS A ON DET.ID_A = A.ID_A'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA AND'
      'CAB.SERIE = :SERIES AND'
      'CAB.ID_ORIGEN = :ID_ORDEN AND'
      
        'CAB.ORIGEN IN ('#39'PCT'#39', '#39'PCP'#39', '#39'PCD'#39', '#39'PCR'#39', '#39'PRE'#39', '#39'PIM'#39', '#39'PEN'#39', ' +
        #39'PRC'#39', '#39'PAE'#39','#39'INM'#39','#39'TEX'#39')'
      'ORDER BY CAB.FECHA, CAB.RIG, DET.LINEA')
    UniDirectional = False
    DataSource = DSxOrden
    Left = 48
    Top = 128
    object QGesDetallesStEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QGesDetallesStEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QGesDetallesStSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QGesDetallesStRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QGesDetallesStLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QGesDetallesStARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QGesDetallesStTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 256
      FieldName = 'TITULO'
      Size = 256
    end
    object QGesDetallesStUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QGesDetallesStPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QGesDetallesStVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QGesDetallesStMOV_STOCK_A: TIntegerField
      DisplayLabel = 'Mov. Stock A'
      FieldName = 'MOV_STOCK_A'
    end
    object QGesDetallesStMOV_STOCK_B: TIntegerField
      DisplayLabel = 'Mov. Stock B'
      FieldName = 'MOV_STOCK_B'
    end
    object QGesDetallesStENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QGesDetallesStUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QGesDetallesStPRECIO_VENTA: TFloatField
      DisplayLabel = 'Prec. Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QGesDetallesStORDEN_PRODUCCION: TFIBStringField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object QGesDetallesStID_MOV_STOCKS_A: TIntegerField
      DisplayLabel = 'ID Mov. Stock A'
      FieldName = 'ID_MOV_STOCKS_A'
    end
    object QGesDetallesStID_MOV_STOCKS_B: TIntegerField
      DisplayLabel = 'ID Mov. Stock B'
      FieldName = 'ID_MOV_STOCKS_B'
    end
    object QGesDetallesStID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QGesDetallesStID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Canal'
      FieldName = 'ID_C_A'
    end
    object QGesDetallesStNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QGesDetallesStID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QGesDetallesStRECIBIDAS: TFloatField
      DisplayLabel = 'Recibidas'
      FieldName = 'RECIBIDAS'
    end
    object QGesDetallesStORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QGesDetallesStFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QGesDetallesStALMACEN_ORI: TFIBStringField
      DisplayLabel = 'Alm. Orig.'
      FieldName = 'ALMACEN_ORI'
      Size = 3
    end
    object QGesDetallesStALMACEN_DST: TFIBStringField
      DisplayLabel = 'Alm. Dst.'
      FieldName = 'ALMACEN_DST'
      Size = 3
    end
    object QGesDetallesStTIPO_OPERACION: TFIBStringField
      DisplayLabel = 'Tipo Oper.'
      FieldName = 'TIPO_OPERACION'
      Size = 1
    end
    object QGesDetallesStID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QGesDetallesStLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QGesDetallesStCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QGesDetallesStSUBLINEA: TIntegerField
      DisplayLabel = 'Sublinea'
      FieldName = 'SUBLINEA'
    end
    object QGesDetallesStF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabr.'
      FieldName = 'F_FABRICACION'
    end
    object QGesDetallesStF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QGesDetallesStF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object QGesDetallesStLOTES: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES'
    end
  end
  object DSGesDetallesSt: TDataSource
    DataSet = QGesDetallesSt
    Left = 144
    Top = 128
  end
end
