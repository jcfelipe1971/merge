object DMLotesCompraDevKri: TDMLotesCompraDevKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 616
  Top = 311
  Height = 454
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 8
  end
  object TGeneral: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 64
  end
  object QArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO,LOTES_KRI,ABIERTO '
      'FROM ART_ARTICULOS '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO')
    UniDirectional = False
    AfterOpen = QArticuloAfterOpen
    Left = 32
    Top = 8
    object QArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QArticuloLOTES_KRI: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES_KRI'
    end
    object QArticuloABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
  end
  object QEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DETALLE,CANTIDAD FROM ART_ARTICULOS_ESCANDALLO '
      'WHERE '
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO')
    UniDirectional = False
    Left = 32
    Top = 56
    object QEscandalloDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QEscandalloCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object QBorraLoteAnt: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI '
      'SET'
      ' DEVOLUCION = 0,'
      ' EJERCICIO_DEC = 0, '
      ' CANAL_DEC = 0, '
      ' SERIE_DEC = '#39#39', '
      ' RIG_DEC = 0, '
      ' LINEA_DEC = 0 '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO_DEC = ?EJERCICIO AND'
      ' CANAL_DEC = ?CANAL  AND'
      ' SERIE_DEC = ?SERIE AND'
      ' RIG_DEC = ?RIG AND'
      ' LINEA_DEC = ?LINEA')
    Transaction = TGeneral
    Left = 32
    Top = 152
  end
  object QArticuloAnterior: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ARTICULO,UNIDADES FROM GES_DETALLES_E'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO = ?EJERCICIO AND'
      ' CANAL = ?CANAL  AND'
      ' SERIE = ?SERIE AND'
      ' TIPO = '#39'ALP'#39' AND'
      ' RIG = ?RIG AND'
      ' LINEA = ?LINEA')
    UniDirectional = False
    Left = 32
    Top = 104
    object QArticuloAnteriorARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QArticuloAnteriorUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
  end
  object QLotesDevueltos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TGeneral
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_DEC,CANAL_DEC,SERI' +
        'E_DEC,RIG_DEC,LINEA_DEC,LOTE,CADUCIDAD,ALMACEN_DEC'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'DEVOLUCION = 1 AND'
      'EJERCICIO_DEC = ?EJERCICIO AND'
      'CANAL_DEC = ?CANAL AND'
      'SERIE_DEC = ?SERIE AND'
      'RIG_DEC = ?RIG AND'
      'LINEA_DEC = ?LINEA'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_DEC,CANAL_DEC,SERI' +
        'E_DEC,RIG_DEC,LINEA_DEC,LOTE,ALMACEN_DEC'
      'HAVING'
      ' COUNT(LOTE) > 0'
      ' ')
    UniDirectional = True
    Left = 32
    Top = 208
    object QLotesDevueltosCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object QLotesDevueltosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QLotesDevueltosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QLotesDevueltosEJERCICIO_DEC: TIntegerField
      DisplayLabel = 'Ejercicio DC'
      FieldName = 'EJERCICIO_DEC'
    end
    object QLotesDevueltosCANAL_DEC: TIntegerField
      DisplayLabel = 'Canal DC'
      FieldName = 'CANAL_DEC'
    end
    object QLotesDevueltosSERIE_DEC: TFIBStringField
      DisplayLabel = 'Serie DC'
      FieldName = 'SERIE_DEC'
      Size = 10
    end
    object QLotesDevueltosRIG_DEC: TIntegerField
      DisplayLabel = 'Rig DC'
      FieldName = 'RIG_DEC'
    end
    object QLotesDevueltosLINEA_DEC: TIntegerField
      DisplayLabel = 'Linea Dec.'
      FieldName = 'LINEA_DEC'
    end
    object QLotesDevueltosLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QLotesDevueltosCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QLotesDevueltosALMACEN_DEC: TFIBStringField
      DisplayLabel = 'Almacen DC'
      FieldName = 'ALMACEN_DEC'
      Size = 3
    end
  end
  object DSQLotesDevueltos: TDataSource
    DataSet = QLotesDevueltos
    Left = 136
    Top = 208
  end
  object QAsignados: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(LOTE)'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND '
      ' EJERCICIO_DEC = ?EJERCICIO AND'
      ' CANAL_DEC = ?CANAL  AND'
      ' SERIE_DEC = ?SERIE AND'
      ' RIG_DEC = ?RIG AND'
      ' LINEA_DEC = ?LINEA')
    Transaction = TGeneral
    Left = 136
    Top = 152
  end
  object DSQLotesDisponibles: TDataSource
    DataSet = QLotesDisponibles
    Left = 136
    Top = 256
  end
  object QLotesDisponibles: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TGeneral
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_DEC,CANAL_DEC,SERI' +
        'E_DEC,RIG_DEC,LINEA_DEC,LOTE,CADUCIDAD'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'PROVEEDOR = ?PROVEEDOR AND'
      '(RIG_SAL = 0 or RIG_SAL is null) AND'
      '(RIG_MOS = 0 or RIG_MOS is null) AND'
      'DEVOLUCION_VENTA = 0 AND'
      'DEVOLUCION = 0 AND'
      'MOVIMIENTO = 0'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_DEC,CANAL_DEC,SERI' +
        'E_DEC,RIG_DEC,LINEA_DEC,LOTE'
      'HAVING'
      ' COUNT(LOTE) > 0')
    UniDirectional = True
    Left = 32
    Top = 256
    object QLotesDisponiblesCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object QLotesDisponiblesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QLotesDisponiblesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QLotesDisponiblesEJERCICIO_DEC: TIntegerField
      DisplayLabel = 'Ejercicio DC'
      FieldName = 'EJERCICIO_DEC'
    end
    object QLotesDisponiblesCANAL_DEC: TIntegerField
      DisplayLabel = 'Canal DC'
      FieldName = 'CANAL_DEC'
    end
    object QLotesDisponiblesSERIE_DEC: TFIBStringField
      DisplayLabel = 'Serie DC'
      FieldName = 'SERIE_DEC'
      Size = 10
    end
    object QLotesDisponiblesRIG_DEC: TIntegerField
      DisplayLabel = 'Rig DC'
      FieldName = 'RIG_DEC'
    end
    object QLotesDisponiblesLINEA_DEC: TIntegerField
      DisplayLabel = 'Linea Dec.'
      FieldName = 'LINEA_DEC'
    end
    object QLotesDisponiblesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QLotesDisponiblesCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
  end
  object SPDevuelve: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_dev_lote_compra_kri (?EMPRESA, ?ARTICULO' +
        ', '
      '?LOTE, ?PROVEEDOR, ?CANTIDAD, ?EJERCICIO_DEC , ?CANAL_DEC , '
      '?SERIE_DEC , ?RIG_DEC , ?LINEA_DEC, ?ALMACEN_DEC,  '
      '?FECHA_DEC)'
      '')
    Transaction = TDevolucion
    Left = 32
    Top = 312
  end
  object TDevolucion: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 120
    Top = 336
  end
  object SPDesDevuelve: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure a_art_desdev_lote_compra_kri'
      
        '(?EMPRESA,?ARTICULO,?LOTE,?EJERCICIO,?CANAL,?SERIE,?RIG,?LINEA,?' +
        'CANTIDAD)'
      '')
    Transaction = TDevolucion
    Left = 32
    Top = 360
  end
end
