object DMLotesCompraKri: TDMLotesCompraKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 485
  Top = 100
  Height = 409
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
      Size = 60
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
      'DELETE FROM NRO_SERIE_KRI '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' EJERCICIO_ENT = ?EJERCICIO AND'
      ' CANAL_ENT = ?CANAL  AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG AND'
      ' LINEA_ENT = ?LINEA')
    Transaction = TGeneral
    Left = 32
    Top = 104
  end
  object QArticuloAnterior: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ARTICULO,UNIDADES FROM GES_DETALLES_E '
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
    Top = 152
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
  object QLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TGeneral
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_ENT,CANAL_ENT,SERI' +
        'E_ENT,RIG_ENT,LINEA_ENT,LOTE,CADUCIDAD '
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND '
      ' EJERCICIO_ENT = ?EJERCICIO AND'
      ' CANAL_ENT = ?CANAL  AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG AND'
      ' LINEA_ENT = ?LINEA AND'
      ' DEVOLUCION_VENTA = 0'
      
        'GROUP BY EMPRESA,ARTICULO,EJERCICIO_ENT,CANAL_ENT,SERIE_ENT,RIG_' +
        'ENT,LINEA_ENT,LOTE,CADUCIDAD'
      'HAVING '
      ' COUNT(LOTE) > 0 ')
    UniDirectional = True
    Left = 32
    Top = 200
    object QLotesCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
      ReadOnly = True
    end
    object QLotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object QLotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QLotesEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio Ent.'
      FieldName = 'EJERCICIO_ENT'
      ReadOnly = True
    end
    object QLotesCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal E.'
      FieldName = 'CANAL_ENT'
      ReadOnly = True
    end
    object QLotesSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie E.'
      FieldName = 'SERIE_ENT'
      ReadOnly = True
      Size = 10
    end
    object QLotesRIG_ENT: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_ENT'
      ReadOnly = True
    end
    object QLotesLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea E.'
      FieldName = 'LINEA_ENT'
      ReadOnly = True
    end
    object QLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ReadOnly = True
      Size = 15
    end
    object QLotesCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object DSQLotes: TDataSource
    DataSet = QLotes
    Left = 104
    Top = 200
  end
  object QInsertaLote: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI '
      
        ' (EMPRESA,ARTICULO,LOTE,CADUCIDAD,EJERCICIO_ENT,CANAL_ENT,SERIE_' +
        'ENT,RIG_ENT,LINEA_ENT,ALMACEN_ENT,FECHA_ENT,PROVEEDOR)'
      'VALUES '
      
        ' (?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?EJERCICIO,?CANAL,?SERIE,?' +
        'RIG,?LINEA,?ALMACEN,?FECHA,?PROVEEDOR) '
      '')
    Transaction = TGeneral
    Left = 32
    Top = 248
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
    Transaction = TGeneral
    Left = 104
    Top = 248
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
      ' EJERCICIO_ENT = ?EJERCICIO AND'
      ' CANAL_ENT = ?CANAL  AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG AND'
      ' LINEA_ENT = ?LINEA AND'
      ' DEVOLUCION_VENTA = 0')
    Transaction = TGeneral
    Left = 32
    Top = 296
  end
end
