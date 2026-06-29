object DMNumerosDeSerieMOEKri: TDMNumerosDeSerieMOEKri
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 479
  Top = 103
  Height = 413
  Width = 275
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
      'SELECT ID,EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'DEVOLUCION_VENTA = 0  AND'
      'EJERCICIO_MOE = ?EJERCICIO AND'
      'CANAL_MOE = ?CANAL AND '
      'SERIE_MOE = ?SERIE AND '
      'RIG_MOE = ?RIG AND '
      'LINEA_MOE = ?LINEA')
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
      DisplayLabel = 'Nro de Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
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
  object QBorraSerieAnt: TFIBQuery
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
  object QInsertaNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '(EMPRESA,ARTICULO,NRO_SERIE,EJERCICIO_MOE,CANAL_MOE,SERIE_MOE,RI' +
        'G_MOE,LINEA_MOE,ALMACEN_MOE,FECHA_MOE)'
      'VALUES'
      
        '(?EMPRESA,?ARTICULO,?NRO_SERIE,?EJERCICIO,?CANAL,?SERIE,?RIG,?LI' +
        'NEA,?ALMACEN,?FECHA)'
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
  object QBorraNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      'ID = ?ID')
    Transaction = TCommit
    Left = 120
    Top = 192
  end
end
