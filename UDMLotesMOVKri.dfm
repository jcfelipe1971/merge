object DMLotesMOVKri: TDMLotesMOVKri
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 408
  Top = 152
  Height = 443
  Width = 291
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
      'SELECT TITULO_LARGO AS TITULO,ABIERTO,LOTES_KRI FROM ART_ARTICULOS'
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
    object xArticuloLOTES_KRI: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES_KRI'
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
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_MOV,CANAL_MOV,SERI' +
        'E_MOV,RIG_MOV,LINEA_MOV,LOTE,CADUCIDAD'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' DEVOLUCION_VENTA = 0  AND'
      ' DEVOLUCION = 0 AND'
      ' EJERCICIO_MOV = ?EJERCICIO AND'
      ' CANAL_MOV = ?CANAL AND'
      ' SERIE_MOV = ?SERIE AND'
      ' RIG_MOV = ?RIG AND'
      ' LINEA_MOV = ?LINEA'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_MOV,CANAL_MOV,SERI' +
        'E_MOV,RIG_MOV,LINEA_MOV,LOTE'
      'HAVING '
      ' COUNT(LOTE) > 0 ')
    UniDirectional = False
    Left = 32
    Top = 128
    object xAsignadoCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object xAsignadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAsignadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xAsignadoEJERCICIO_MOV: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_MOV'
    end
    object xAsignadoCANAL_MOV: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_MOV'
    end
    object xAsignadoSERIE_MOV: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_MOV'
      Size = 10
    end
    object xAsignadoRIG_MOV: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_MOV'
    end
    object xAsignadoLINEA_MOV: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MOV'
    end
    object xAsignadoLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xAsignadoCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
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
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_ENT,CANAL_ENT,SERI' +
        'E_ENT,RIG_ENT,LINEA_ENT,LOTE,CADUCIDAD,ALMACEN_ENT,cast('#39'ENT'#39' as' +
        ' char(3))'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' CANAL_ENT = ?CANAL_MOV AND'
      ' ALMACEN_ENT=?ALMACEN_ORI_MOV AND'
      ' DEVOLUCION_VENTA = 0  AND'
      ' DEVOLUCION = 0 AND'
      ' MOVIMIENTO = 0 AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null)'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_ENT,CANAL_ENT,SERI' +
        'E_ENT,RIG_ENT,LINEA_ENT,LOTE,ALMACEN_ENT'
      'HAVING'
      ' COUNT(LOTE) > 0'
      'union'
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_MOE,CANAL_MOE,SERI' +
        'E_MOE,RIG_MOE,LINEA_MOE,LOTE,CADUCIDAD,ALMACEN_MOE,cast('#39'MOE'#39' as' +
        ' char(3))'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' CANAL_MOE = ?CANAL_MOV AND'
      ' ALMACEN_MOE =?ALMACEN_ORI_MOV AND'
      ' DEVOLUCION_VENTA = 0  AND'
      ' DEVOLUCION = 0 AND'
      ' MOVIMIENTO = 0 AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null)'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_MOE,CANAL_MOE,SERI' +
        'E_MOE,RIG_MOE,LINEA_MOE,LOTE,ALMACEN_MOE'
      'HAVING'
      ' COUNT(LOTE) > 0'
      '')
    UniDirectional = False
    Left = 32
    Top = 184
    object xDisponibleCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
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
    object xDisponibleEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ENT'
    end
    object xDisponibleCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ENT'
    end
    object xDisponibleSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ENT'
      Size = 10
    end
    object xDisponibleRIG_ENT: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_ENT'
    end
    object xDisponibleLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_ENT'
    end
    object xDisponibleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xDisponibleCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object xDisponibleALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object xDisponibleF_1: TFIBStringField
      DisplayLabel = 'F. 1'
      FieldName = 'F_1'
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
      'UPDATE NRO_SERIE_KRI'
      'SET '
      ' EJERCICIO_MOS = ?EJERCICIO , '
      ' CANAL_MOS = ?CANAL , '
      ' SERIE_MOS = ?SERIE , '
      ' RIG_MOS = ?RIG , '
      ' LINEA_MOS = ?LINEA ,  '
      ' FECHA_MOS = ?FECHA ,  '
      ' ALMACEN_MOS = ?ALMACEN '
      'WHERE'
      'ID = ?ID')
    Transaction = TCommit
    Left = 32
    Top = 248
  end
  object QSacaNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET '
      ' EJERCICIO_MOS = 0 , '
      ' CANAL_MOS = 0 , '
      ' SERIE_MOS = null , '
      ' RIG_MOS = 0, '
      ' LINEA_MOS = 0, '
      ' FECHA_MOS = null, '
      ' ALMACEN_MOS = '#39'   '#39' '
      'WHERE'
      'ID = ?ID')
    Transaction = TCommit
    Left = 120
    Top = 248
  end
  object QBorraLoteAnt: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET '
      ' EJERCICIO_MOV = 0 , '
      ' CANAL_MOV = 0 , '
      ' CANAL_DST_MOV = 0 , '
      ' SERIE_MOV = null , '
      ' RIG_MOV = 0, '
      ' LINEA_MOV = 0, '
      ' FECHA_MOV = null, '
      ' ALMACEN_ORI_MOV = '#39#39' ,'
      ' ALMACEN_DEST_MOV = '#39#39' '
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
  object QAsignados: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(LOTE)'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND '
      ' EJERCICIO_MOV = ?EJERCICIO AND'
      ' CANAL_MOV = ?CANAL  AND'
      ' SERIE_MOV = ?SERIE AND'
      ' RIG_MOV = ?RIG AND'
      ' LINEA_MOV = ?LINEA')
    Transaction = TLocal
    Left = 200
    Top = 120
  end
  object QAsignar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure a_art_mueve_lote_kri (?ID, ?EJERCICIO_MOV, '
      '?CANAL_MOV,?CANAL_DST_MOV, ?SERIE_MOV, ?RIG_MOV, '
      '?LINEA_MOV, ?ALMACEN_ORI_MOV, ?ALMACEN_DEST_MOV, '
      '?FECHA_MOV)')
    Transaction = TCommit
    Left = 32
    Top = 352
  end
  object QDesAsignar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_desmueve_lote_kri (?EMPRESA, ?ARTICULO, ' +
        '?LOTE, ?EJERCICIO_MOV,'
      
        '?CANAL_MOV, ?CANAL_DST_MOV, ?SERIE_MOV, ?RIG_MOV, ?LINEA_MOV, ?A' +
        'LMACEN_ORI_MOV,'
      '?ALMACEN_DEST_MOV, ?FECHA_MOV)'
      '')
    Transaction = TCommit
    Left = 120
    Top = 352
  end
  object QAAsignar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID FROM NRO_SERIE_KRI'
      'WHERE'
      ' '#39'ENT'#39' = ?TIPO AND'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' LOTE = ?LOTE AND'
      ' CANAL_ENT = ?CANAL AND'
      ' ALMACEN_ENT = ?ALMACEN AND'
      ' DEVOLUCION = 0 AND'
      ' DEVOLUCION_VENTA = 0 AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null) and'
      'movimiento=0'
      'union'
      'SELECT ID FROM NRO_SERIE_KRI'
      'WHERE'
      ' '#39'MOE'#39' = ?TIPO AND'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' LOTE = ?LOTE AND'
      ' CANAL_MOE = ?CANAL AND'
      ' ALMACEN_MOE = ?ALMACEN AND'
      ' DEVOLUCION = 0 AND'
      ' DEVOLUCION_VENTA = 0 AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null) and'
      'movimiento=0'
      'AND'
      ' not((EJERCICIO_MOE=?EJERCICIO) AND'
      '      (CANAL_MOE=?CANAL) AND'
      '      (SERIE_MOE=?SERIE) AND'
      '      (RIG_MOE=?RIG) AND'
      '      (LINEA_MOE=?LINEA))')
    UniDirectional = True
    Left = 32
    Top = 304
    object QAAsignarID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
end
