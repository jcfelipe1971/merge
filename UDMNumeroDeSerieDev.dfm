object DMNumeroDeSerieDev: TDMNumeroDeSerieDev
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 503
  Top = 205
  Height = 391
  Width = 262
  object DSDevuelto: TDataSource
    DataSet = xDevuelto
    Left = 120
    Top = 112
  end
  object DSAsignado: TDataSource
    DataSet = xAsignado
    Left = 120
    Top = 160
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
  object xDevuelto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'DEVOLUCION_VENTA = 1 AND'
      'EJERCICIO_DEV = ?EJERCICIO_DEV AND'
      'CANAL_DEV = ?CANAL_DEV AND'
      'SERIE_DEV = ?SERIE_DEV AND'
      'RIG_DEV = ?RIG_DEV AND'
      'LINEA_DEV = ?LINEA_DEV')
    UniDirectional = False
    Left = 32
    Top = 112
    object xDevueltoID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xDevueltoNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
  end
  object xAsignado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ID,EMPRESA,ARTICULO,NRO_SERIE,EJERCICIO_SAL,CANAL_SAL,SER' +
        'IE_SAL,RIG_SAL,LINEA_SAL,FECHA_SAL FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'CLIENTE = ?CLIENTE AND'
      'DEVOLUCION_VENTA = 0 '
      'ORDER BY FECHA_SAL DESC')
    UniDirectional = False
    Left = 32
    Top = 160
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
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xAsignadoNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object xAsignadoEJERCICIO_SAL: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_SAL'
    end
    object xAsignadoCANAL_SAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_SAL'
    end
    object xAsignadoSERIE_SAL: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_SAL'
      Size = 10
    end
    object xAsignadoRIG_SAL: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG_SAL'
    end
    object xAsignadoLINEA_SAL: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_SAL'
    end
    object xAsignadoFECHA_SAL: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_SAL'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object SPDevuelve: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_devuelve_nro_serie_kri (?ID , ?EJERCICIO' +
        '_DEV ,'
      
        ' ?CANAL_DEV , ?SERIE_DEV , ?RIG_DEV , ?LINEA_DEV , ?ALMACEN_DEV ' +
        ','
      ' ?FECHA_DEV )')
    Transaction = TDevolucion
    Left = 32
    Top = 208
  end
  object TDevolucion: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 120
    Top = 232
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
  object SPDesDevuelve: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_desdevuelve_nro_serie_kri (?ID , ?EJERCI' +
        'CIO_DEV ,'
      
        ' ?CANAL_DEV , ?SERIE_DEV , ?RIG_DEV , ?LINEA_DEV , ?ALMACEN_DEV ' +
        ','
      ' ?FECHA_DEV )')
    Transaction = TDevolucion
    Left = 32
    Top = 256
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
  object QCantidadDevueltos: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(NRO_SERIE)'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND '
      ' EJERCICIO_DEV = ?EJERCICIO_DEV AND'
      ' CANAL_DEV = ?CANAL_DEV  AND'
      ' SERIE_DEV = ?SERIE_DEV AND'
      ' RIG_DEV = ?RIG_DEV AND'
      ' LINEA_DEV = ?LINEA_DEV')
    Transaction = TLocal
    Left = 184
    Top = 128
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
  object ID_a_Borrar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'DEVOLUCION_VENTA = 1 AND'
      'EJERCICIO_DEV = ?EJERCICIO_DEV AND'
      'CANAL_DEV = ?CANAL_DEV AND'
      'SERIE_DEV = ?SERIE_DEV AND'
      'RIG_DEV = ?RIG_DEV AND'
      'LINEA_DEV = ?LINEA_DEV')
    UniDirectional = True
    Left = 120
    Top = 64
    object ID_a_BorrarID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
end
