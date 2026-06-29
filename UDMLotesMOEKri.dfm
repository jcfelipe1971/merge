object DMLotesMOEKri: TDMLotesMOEKri
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 208
  Top = 103
  Height = 403
  Width = 281
  object DSAsignado: TDataSource
    DataSet = xAsignado
    Left = 120
    Top = 128
  end
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
  object xAsignado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_MOE,CANAL_MOE,SERI' +
        'E_MOE,RIG_MOE,LINEA_MOE,LOTE,CADUCIDAD'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' DEVOLUCION_VENTA = 0  AND'
      ' EJERCICIO_MOE = ?EJERCICIO AND'
      ' CANAL_MOE = ?CANAL AND'
      ' SERIE_MOE = ?SERIE AND'
      ' RIG_MOE = ?RIG AND'
      ' LINEA_MOE = ?LINEA'
      
        'GROUP BY EMPRESA,ARTICULO,EJERCICIO_MOE,CANAL_MOE,SERIE_MOE,RIG_' +
        'MOe,LINEA_MOE,LOTE,CADUCIDAD'
      'HAVING'
      ' COUNT(LOTE) > 0'
      '')
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
    object xAsignadoEJERCICIO_MOE: TIntegerField
      DisplayLabel = 'Ejercicio ME'
      FieldName = 'EJERCICIO_MOE'
    end
    object xAsignadoCANAL_MOE: TIntegerField
      DisplayLabel = 'Canal ME'
      FieldName = 'CANAL_MOE'
    end
    object xAsignadoSERIE_MOE: TFIBStringField
      DisplayLabel = 'Serie ME'
      FieldName = 'SERIE_MOE'
      Size = 10
    end
    object xAsignadoRIG_MOE: TIntegerField
      DisplayLabel = 'Rig ME'
      FieldName = 'RIG_MOE'
    end
    object xAsignadoLINEA_MOE: TIntegerField
      DisplayLabel = 'Linea ME'
      FieldName = 'LINEA_MOE'
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
  object QBorraLoteAnt: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO_MOE = ?EJERCICIO AND'
      ' CANAL_MOE = ?CANAL  AND'
      ' SERIE_MOE = ?SERIE AND'
      ' RIG_MOE = ?RIG AND'
      ' LINEA_MOE = ?LINEA')
    Transaction = TLocal
    Left = 32
    Top = 192
  end
  object QInsertaLote: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '(EMPRESA,ARTICULO,LOTE,CADUCIDAD,EJERCICIO_MOE,CANAL_MOE,SERIE_M' +
        'OE,RIG_MOE,LINEA_MOE,ALMACEN_MOE,FECHA_MOE)'
      'VALUES'
      
        '(?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?EJERCICIO,?CANAL,?SERIE,?R' +
        'IG,?LINEA,?ALMACEN,?FECHA)'
      ''
      '')
    Transaction = TCommit
    Left = 208
    Top = 192
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
  object QBorraLote: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI '
      'WHERE '
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' LOTE = ?LOTE '
      '')
    Transaction = TCommit
    Left = 120
    Top = 192
  end
  object QAsignados: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(LOTE)'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' EJERCICIO_MOE = ?EJERCICIO AND'
      ' CANAL_MOE = ?CANAL  AND'
      ' SERIE_MOE = ?SERIE AND'
      ' RIG_MOE = ?RIG AND'
      ' LINEA_MOE = ?LINEA')
    Transaction = TLocal
    Left = 32
    Top = 240
  end
end
