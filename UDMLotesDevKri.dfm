object DMLotesDevKri: TDMLotesDevKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 835
  Top = 310
  Height = 460
  Width = 223
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
      ' EJERCICIO_SAL = 0, '
      ' CANAL_SAL = 0, '
      ' SERIE_SAL = '#39#39', '
      ' RIG_SAL = 0, '
      ' LINEA_SAL = 0 '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO_SAL = ?EJERCICIO AND'
      ' CANAL_SAL = ?CANAL  AND'
      ' SERIE_SAL = ?SERIE AND'
      ' RIG_SAL = ?RIG AND'
      ' LINEA_SAL = ?LINEA')
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
      'SELECT ARTICULO,UNIDADES FROM GES_DETALLES_S '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO = ?EJERCICIO AND'
      ' CANAL = ?CANAL  AND'
      ' SERIE = ?SERIE AND'
      ' TIPO = '#39'ALB'#39' AND'
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
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_DEV,CANAL_DEV,SERI' +
        'E_DEV,RIG_DEV,LINEA_DEV,LOTE,CADUCIDAD,ALMACEN_DEV'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'DEVOLUCION_VENTA = 1 AND'
      'EJERCICIO_DEV = ?EJERCICIO AND'
      'CANAL_DEV = ?CANAL AND'
      'SERIE_DEV = ?SERIE AND'
      'RIG_DEV = ?RIG AND'
      'LINEA_DEV = ?LINEA'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_DEV,CANAL_DEV,SERI' +
        'E_DEV,RIG_DEV,LINEA_DEV,LOTE,ALMACEN_DEV'
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
    object QLotesDevueltosEJERCICIO_DEV: TIntegerField
      DisplayLabel = 'Ejercicio Dev.'
      FieldName = 'EJERCICIO_DEV'
    end
    object QLotesDevueltosCANAL_DEV: TIntegerField
      DisplayLabel = 'Canal Dev.'
      FieldName = 'CANAL_DEV'
    end
    object QLotesDevueltosSERIE_DEV: TFIBStringField
      DisplayLabel = 'Serie Dev.'
      FieldName = 'SERIE_DEV'
      Size = 10
    end
    object QLotesDevueltosRIG_DEV: TIntegerField
      DisplayLabel = 'Rig Dev.'
      FieldName = 'RIG_DEV'
    end
    object QLotesDevueltosLINEA_DEV: TIntegerField
      DisplayLabel = 'Linea Dev.'
      FieldName = 'LINEA_DEV'
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
    object QLotesDevueltosALMACEN_DEV: TFIBStringField
      DisplayLabel = 'Almacen Dev.'
      FieldName = 'ALMACEN_DEV'
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
      ' EJERCICIO_DEV = ?EJERCICIO AND'
      ' CANAL_DEV = ?CANAL  AND'
      ' SERIE_DEV = ?SERIE AND'
      ' RIG_DEV = ?RIG AND'
      ' LINEA_DEV = ?LINEA')
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
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_DEV,CANAL_DEV,SERI' +
        'E_DEV,RIG_DEV,LINEA_DEV,LOTE,CADUCIDAD'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'CLIENTE = ?CLIENTE AND'
      'DEVOLUCION_VENTA = 0 AND'
      'DEVOLUCION = 0'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_DEV,CANAL_DEV,SERI' +
        'E_DEV,RIG_DEV,LINEA_DEV,LOTE'
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
    object QLotesDisponiblesEJERCICIO_DEV: TIntegerField
      DisplayLabel = 'Ejercicio Dev.'
      FieldName = 'EJERCICIO_DEV'
    end
    object QLotesDisponiblesCANAL_DEV: TIntegerField
      DisplayLabel = 'Canal Dev.'
      FieldName = 'CANAL_DEV'
    end
    object QLotesDisponiblesSERIE_DEV: TFIBStringField
      DisplayLabel = 'Serie Dev.'
      FieldName = 'SERIE_DEV'
      Size = 10
    end
    object QLotesDisponiblesRIG_DEV: TIntegerField
      DisplayLabel = 'Rig Dev.'
      FieldName = 'RIG_DEV'
    end
    object QLotesDisponiblesLINEA_DEV: TIntegerField
      DisplayLabel = 'Linea Dev.'
      FieldName = 'LINEA_DEV'
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
      'execute procedure a_art_devuelve_lote_kri (?EMPRESA, ?ARTICULO, '
      '?LOTE, ?CLIENTE, ?CANTIDAD, ?EJERCICIO_DEV , ?CANAL_DEV , '
      '?SERIE_DEV , ?RIG_DEV , ?LINEA_DEV, ?ALMACEN_DEV, '
      '?FECHA_DEV)'
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
      'execute procedure a_art_desdevuelve_lote_kri'
      
        '(?EMPRESA,?ARTICULO,?LOTE,?EJERCICIO,?CANAL,?SERIE,?RIG,?LINEA,?' +
        'CANTIDAD)'
      '')
    Transaction = TDevolucion
    Left = 32
    Top = 360
  end
end
