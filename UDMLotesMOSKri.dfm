object DMLotesMOSKri: TDMLotesMOSKri
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 207
  Top = 102
  Height = 481
  Width = 280
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
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_SAL,CANAL_SAL,SERI' +
        'E_SAL,RIG_SAL,LINEA_SAL,LOTE,CADUCIDAD'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' DEVOLUCION_VENTA = 0  AND'
      ' EJERCICIO_MOS = ?EJERCICIO AND'
      ' CANAL_MOS = ?CANAL AND'
      ' SERIE_MOS = ?SERIE AND'
      ' RIG_MOS = ?RIG AND'
      ' LINEA_MOS = ?LINEA'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_SAL,CANAL_SAL,SERI' +
        'E_SAL,RIG_SAL,LINEA_SAL,LOTE'
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
    object xAsignadoEJERCICIO_SAL: TIntegerField
      DisplayLabel = 'Ejercicio S.'
      FieldName = 'EJERCICIO_SAL'
    end
    object xAsignadoCANAL_SAL: TIntegerField
      DisplayLabel = 'Canal S.'
      FieldName = 'CANAL_SAL'
    end
    object xAsignadoSERIE_SAL: TFIBStringField
      DisplayLabel = 'Serie S.'
      FieldName = 'SERIE_SAL'
      Size = 10
    end
    object xAsignadoRIG_SAL: TIntegerField
      DisplayLabel = 'Rig S.'
      FieldName = 'RIG_SAL'
    end
    object xAsignadoLINEA_SAL: TIntegerField
      DisplayLabel = 'Linea S.'
      FieldName = 'LINEA_SAL'
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
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_MOS,CANAL_MOS,SERI' +
        'E_MOS,RIG_MOS,LINEA_MOS,LOTE,CADUCIDAD,ALMACEN_ENT'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' DEVOLUCION_VENTA = 0  AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null)'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_MOS,CANAL_MOS,SERI' +
        'E_MOS,RIG_MOS,LINEA_MOS,LOTE,ALMACEN_ENT'
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
    object xDisponibleEJERCICIO_MOS: TIntegerField
      DisplayLabel = 'Ejercicio MS'
      FieldName = 'EJERCICIO_MOS'
    end
    object xDisponibleCANAL_MOS: TIntegerField
      DisplayLabel = 'Canal MS'
      FieldName = 'CANAL_MOS'
    end
    object xDisponibleSERIE_MOS: TFIBStringField
      DisplayLabel = 'Serie MS'
      FieldName = 'SERIE_MOS'
      Size = 10
    end
    object xDisponibleRIG_MOS: TIntegerField
      DisplayLabel = 'Rig MS'
      FieldName = 'RIG_MOS'
    end
    object xDisponibleLINEA_MOS: TIntegerField
      DisplayLabel = 'Linea MS'
      FieldName = 'LINEA_MOS'
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
      ' EJERCICIO_MOS = 0 , '
      ' CANAL_MOS = 0 , '
      ' SERIE_MOS = null , '
      ' RIG_MOS = 0, '
      ' LINEA_MOS = 0, '
      ' FECHA_MOS = null, '
      ' ALMACEN_MOS = '#39'   '#39' '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO_MOS = ?EJERCICIO AND'
      ' CANAL_MOS = ?CANAL  AND'
      ' SERIE_MOS = ?SERIE AND'
      ' RIG_MOS = ?RIG AND'
      ' LINEA_MOS = ?LINEA')
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
      ' EJERCICIO_MOS = ?EJERCICIO AND'
      ' CANAL_MOS = ?CANAL  AND'
      ' SERIE_MOS = ?SERIE AND'
      ' RIG_MOS = ?RIG AND'
      ' LINEA_MOS = ?LINEA')
    Transaction = TLocal
    Left = 200
    Top = 120
  end
  object QAsignar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI '
      'SET'
      ' EJERCICIO_MOS = ?EJERCICIO, '
      ' CANAL_MOS = ?CANAL, '
      ' SERIE_MOS = ?SERIE, '
      ' RIG_MOS = ?RIG, '
      ' LINEA_MOS = ?LINEA, '
      ' ALMACEN_MOS = ?ALMACEN, '
      ' FECHA_MOS = ?FECHA '
      'WHERE'
      ' ID = ?ID')
    Transaction = TCommit
    Left = 32
    Top = 352
  end
  object QDesAsignar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI '
      'SET'
      ' EJERCICIO_MOS = 0, '
      ' CANAL_MOS = 0, '
      ' SERIE_MOS = '#39#39',  '
      ' RIG_MOS = 0, '
      ' LINEA_MOS = 0, '
      ' ALMACEN_MOS = '#39'   '#39', '
      ' FECHA_MOS = null '
      'WHERE'
      ' EMPRESA= ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' LOTE = ?LOTE AND '
      ' EJERCICIO_MOS = ?EJERCICIO AND '
      ' CANAL_MOS = ?CANAL AND '
      ' SERIE_MOS = ?SERIE AND '
      ' RIG_MOS = ?RIG AND '
      ' LINEA_MOS = ?LINEA '
      ''
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
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' LOTE = ?LOTE AND'
      ' (RIG_MOS = 0 or RIG_MOS is null) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null)'
      'ORDER BY ID')
    UniDirectional = True
    Left = 32
    Top = 304
    object QAAsignarID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
end
