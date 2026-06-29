object DMLotesVentaKri: TDMLotesVentaKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 579
  Top = 101
  Height = 450
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
      'UPDATE NRO_SERIE_KRI '
      'SET'
      ' EJERCICIO_SAL = 0, '
      ' CANAL_SAL = 0, '
      ' SERIE_SAL = '#39#39', '
      ' RIG_SAL = 0, '
      ' LINEA_SAL = 0, '
      ' CLIENTE = 0,'
      ' FECHA_SAL = null, '
      ' ALMACEN_SAL = '#39#39' '
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
  object QLotesDisponibles: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TGeneral
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_ENT,CANAL_ENT,SERI' +
        'E_ENT,RIG_ENT,LINEA_ENT,LOTE,CADUCIDAD,ALMACEN_ENT'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' (CANAL_ENT = ?CANAL) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null) AND '
      ' (RIG_MOS = 0 or RIG_MOS is null)  AND '
      ' (DEVOLUCION = 0) AND'
      ' (DEVOLUCION_VENTA = 0) AND'
      ' (MOVIMIENTO = 0)'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_ENT,CANAL_ENT,SERI' +
        'E_ENT,RIG_ENT,LINEA_ENT,LOTE,ALMACEN_ENT'
      'HAVING '
      ' COUNT(LOTE) > 0'
      'union'
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_MOE as ejercicio_e' +
        'nt,CANAL_MOE as canal_ent,SERIE_MOE as serie_ent,RIG_MOE as rig_' +
        'ent,LINEA_MOE as linea_ent,LOTE,CADUCIDAD,ALMACEN_MOE as almacen' +
        '_ent'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' (CANAL_MOE= ?CANAL) AND'
      ' (RIG_SAL = 0 or RIG_SAL is null) AND '
      ' (RIG_MOS = 0 or RIG_MOS is null)  AND '
      ' (DEVOLUCION = 0) AND'
      ' (DEVOLUCION_VENTA = 0) AND'
      ' (MOVIMIENTO = 0)'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_MOE,CANAL_MOE,SERI' +
        'E_MOE,RIG_MOE,LINEA_MOE,LOTE,ALMACEN_MOE'
      'HAVING '
      ' COUNT(LOTE) > 0'
      '')
    UniDirectional = True
    Left = 32
    Top = 208
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
    object QLotesDisponiblesEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio Ent.'
      FieldName = 'EJERCICIO_ENT'
    end
    object QLotesDisponiblesCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal E.'
      FieldName = 'CANAL_ENT'
    end
    object QLotesDisponiblesSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie E.'
      FieldName = 'SERIE_ENT'
      Size = 10
    end
    object QLotesDisponiblesRIG_ENT: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_ENT'
    end
    object QLotesDisponiblesLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea E.'
      FieldName = 'LINEA_ENT'
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
    object QLotesDisponiblesALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
  end
  object DSQLotesDisponibles: TDataSource
    DataSet = QLotesDisponibles
    Left = 136
    Top = 208
  end
  object QAsignar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI '
      'SET'
      ' EJERCICIO_SAL = ?EJERCICIO, '
      ' CANAL_SAL = ?CANAL, '
      ' SERIE_SAL = ?SERIE, '
      ' RIG_SAL = ?RIG, '
      ' LINEA_SAL = ?LINEA, '
      ' ALMACEN_SAL = ?ALMACEN, '
      ' FECHA_SAL = ?FECHA, '
      ' CLIENTE = ?CLIENTE '
      'WHERE'
      ' ID = ?ID')
    Transaction = TGeneral
    Left = 40
    Top = 368
  end
  object QDesAsignar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI '
      'SET'
      ' EJERCICIO_SAL = 0, '
      ' CANAL_SAL = 0, '
      ' SERIE_SAL = '#39#39',  '
      ' RIG_SAL = 0, '
      ' LINEA_SAL = 0, '
      ' ALMACEN_SAL = '#39#39', '
      ' FECHA_SAL = null, '
      ' CLIENTE = 0 '
      'WHERE'
      ' EMPRESA= ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' LOTE = ?LOTE AND '
      ' EJERCICIO_SAL = ?EJERCICIO AND '
      ' CANAL_SAL = ?CANAL AND '
      ' SERIE_SAL = ?SERIE AND   '
      ' RIG_SAL = ?RIG AND '
      ' LINEA_SAL = ?LINEA ')
    Transaction = TGeneral
    Left = 144
    Top = 368
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
      ' EJERCICIO_SAL = ?EJERCICIO AND'
      ' CANAL_SAL = ?CANAL  AND'
      ' SERIE_SAL = ?SERIE AND'
      ' RIG_SAL = ?RIG AND'
      ' LINEA_SAL = ?LINEA')
    Transaction = TGeneral
    Left = 136
    Top = 152
  end
  object DSQLotesAsignados: TDataSource
    DataSet = QLotesAsignados
    Left = 136
    Top = 256
  end
  object QLotesAsignados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TGeneral
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(LOTE),EMPRESA,ARTICULO,EJERCICIO_SAL,CANAL_SAL,SERI' +
        'E_SAL,RIG_SAL,LINEA_SAL,LOTE,CADUCIDAD'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO AND '
      ' EJERCICIO_SAL = ?EJERCICIO AND'
      ' CANAL_SAL = ?CANAL  AND'
      ' SERIE_SAL = ?SERIE AND'
      ' RIG_SAL = ?RIG AND'
      ' LINEA_SAL = ?LINEA'
      
        'GROUP BY CADUCIDAD,EMPRESA,ARTICULO,EJERCICIO_SAL,CANAL_SAL,SERI' +
        'E_SAL,RIG_SAL,LINEA_SAL,LOTE'
      'HAVING '
      ' COUNT(LOTE) > 0 ')
    UniDirectional = True
    Left = 32
    Top = 256
    object QLotesAsignadosCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object QLotesAsignadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QLotesAsignadosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QLotesAsignadosEJERCICIO_SAL: TIntegerField
      DisplayLabel = 'Ejercicio S.'
      FieldName = 'EJERCICIO_SAL'
    end
    object QLotesAsignadosCANAL_SAL: TIntegerField
      DisplayLabel = 'Canal S.'
      FieldName = 'CANAL_SAL'
    end
    object QLotesAsignadosSERIE_SAL: TFIBStringField
      DisplayLabel = 'Serie S.'
      FieldName = 'SERIE_SAL'
      Size = 10
    end
    object QLotesAsignadosRIG_SAL: TIntegerField
      DisplayLabel = 'Rig S.'
      FieldName = 'RIG_SAL'
    end
    object QLotesAsignadosLINEA_SAL: TIntegerField
      DisplayLabel = 'Linea S.'
      FieldName = 'LINEA_SAL'
    end
    object QLotesAsignadosLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QLotesAsignadosCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
  end
  object QAAsignar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TGeneral
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID FROM NRO_SERIE_KRI'
      'WHERE'
      ' (EMPRESA = ?EMPRESA AND'
      '  ARTICULO = ?ARTICULO AND'
      '  LOTE = ?LOTE AND'
      '  CANAL_ENT = ?CANAL AND'
      '  ALMACEN_ENT = ?ALMACEN AND'
      '  DEVOLUCION_VENTA = 0  AND'
      '  DEVOLUCION = 0 AND'
      '  MOVIMIENTO = 0 AND'
      '  (RIG_SAL = 0 or RIG_SAL is null) AND '
      '  (RIG_MOS = 0 or RIG_MOS is null)) '
      'union'
      'SELECT ID FROM NRO_SERIE_KRI'
      'WHERE'
      ' (EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' LOTE = ?LOTE AND'
      '  CANAL_MOE = ?CANAL AND'
      '  ALMACEN_MOE = ?ALMACEN AND'
      '  DEVOLUCION_VENTA = 0  AND'
      '  DEVOLUCION = 0 AND'
      '  MOVIMIENTO = 0 AND'
      ' (RIG_SAL = 0 or RIG_SAL is null) AND '
      '  (RIG_MOS = 0 or RIG_MOS is null)) '
      'ORDER BY 1')
    UniDirectional = True
    Left = 40
    Top = 320
    object QAAsignarID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
end
