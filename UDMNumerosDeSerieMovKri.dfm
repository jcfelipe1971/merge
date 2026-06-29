object DMNumerosDeSerieMovKri: TDMNumerosDeSerieMovKri
  OldCreateOrder = False
  OnDestroy = DMNumerosDeSerieMovKriDestroy
  Left = 487
  Top = 315
  Height = 376
  Width = 306
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 16
  end
  object TCommit: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 64
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO,ABIERTO,SERIALIZADO_KRI FROM ART_ARTICULOS'
      'WHERE '
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO')
    UniDirectional = False
    AfterOpen = xArticuloAfterOpen
    Left = 32
    Top = 16
    object xArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xArticuloABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
    object xArticuloSERIALIZADO_KRI: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO_KRI'
    end
  end
  object QArticuloAnterior: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ARTICULO,UNIDADES FROM GES_DETALLES_ST '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO = ?EJERCICIO AND'
      ' SERIE = ?SERIE AND'
      ' RIG = ?RIG AND'
      ' LINEA = ?LINEA')
    UniDirectional = False
    Left = 32
    Top = 64
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
    Left = 120
    Top = 16
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
  object xAsignado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ID,EMPRESA,ARTICULO,NRO_SERIE,ALMACEN_DEST_MOV as almacen' +
        ' FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOV = ?EJERCICIO AND'
      'CANAL_MOV = ?CANAL AND '
      'SERIE_MOV = ?SERIE AND '
      'RIG_MOV = ?RIG AND '
      'LINEA_MOV = ?LINEA AND '
      'DEVOLUCION_VENTA = 0  AND'
      'DEVOLUCION = 0')
    UniDirectional = False
    Left = 32
    Top = 128
    object xAsignadoID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xAsignadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAsignadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      DefaultExpression = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xAsignadoNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. de Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object xAsignadoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object DSAsignado: TDataSource
    DataSet = xAsignado
    Left = 120
    Top = 128
  end
  object xDisponible: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ID,EMPRESA,ARTICULO,NRO_SERIE, ALMACEN_ENT as almacen FRO' +
        'M NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'CANAL_ENT = ?CANAL_MOV AND'
      'ALMACEN_ENT=?ALMACEN_ORI_MOV AND'
      'DEVOLUCION_VENTA = 0  AND'
      'DEVOLUCION = 0 AND'
      'MOVIMIENTO = 0 AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0  or RIG_SAL is null)'
      'union'
      
        'SELECT ID,EMPRESA,ARTICULO,NRO_SERIE, ALMACEN_MOE as almacen FRO' +
        'M NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'CANAL_MOE = ?CANAL_MOV AND'
      'ALMACEN_MOE =?ALMACEN_ORI_MOV AND'
      'DEVOLUCION_VENTA = 0  AND'
      'DEVOLUCION = 0 AND'
      'MOVIMIENTO = 0 AND '
      ' (RIG_MOS = 0 or RIG_MOS is null) AND '
      ' (RIG_SAL = 0  or RIG_SAL is null) ')
    UniDirectional = False
    Left = 32
    Top = 184
    object xDisponibleID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xDisponibleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDisponibleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDisponibleNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. de Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object xDisponibleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object DSDisponible: TDataSource
    DataSet = xDisponible
    Left = 120
    Top = 184
  end
  object QAsignaNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_mueve_nro_serie_kri (?ID, ?EJERCICIO, ?C' +
        'ANAL,'
      
        ' ?CANAL_DST, ?SERIE, ?RIG, ?LINEA, ?ALMACEN_ORI_MOV, ?ALMACEN_DE' +
        'ST_MOV, ?FECHA)'
      '')
    Transaction = TCommit
    Left = 32
    Top = 248
  end
  object QSacaNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_desmueve_nro_serie_kri (?ID, ?EJERCICIO,' +
        ' ?CANAL, ?CANAL_DST,'
      
        ' ?SERIE, ?RIG, ?LINEA, ?ALMACEN_ORI_MOV, ?ALMACEN_DEST_MOV, ?FEC' +
        'HA)'
      '')
    Transaction = TCommit
    Left = 120
    Top = 248
  end
  object QBorraSerieAnt: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET '
      ' EJERCICIO_MOV = 0 ,'
      ' CANAL_MOV = 0 ,'
      ' SERIE_MOV = null ,'
      ' RIG_MOV = 0,'
      ' LINEA_MOV = 0,'
      ' FECHA_MOV = null,'
      ' ALMACEN_ORI_MOV = '#39#39','
      ' ALMACEN_DEST_MOV = '#39#39','
      ' CANAL_DST_MOV = 0'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO_MOV = ?EJERCICIO AND'
      ' CANAL_MOV = ?CANAL  AND'
      ' SERIE_MOV = ?SERIE AND'
      ' RIG_MOV = ?RIG AND'
      ' LINEA_MOV = ?LINEA')
    Transaction = TLocal
    Left = 208
    Top = 248
  end
end
