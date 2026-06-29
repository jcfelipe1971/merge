object DMNumerosDeSerieKriCompraDev: TDMNumerosDeSerieKriCompraDev
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 323
  Top = 149
  Height = 395
  Width = 289
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
      'DEVOLUCION = 1 AND'
      'EJERCICIO_DEC = ?EJERCICIO_DEC AND'
      'CANAL_DEC = ?CANAL_DEC AND'
      'SERIE_DEC = ?SERIE_DEC AND'
      'RIG_DEC = ?RIG_DEC AND'
      'LINEA_DEC = ?LINEA_DEC')
    UniDirectional = False
    Left = 32
    Top = 112
    object xDevueltoID: TIntegerField
      DisplayLabel = 'Id'
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
      
        'SELECT ID,EMPRESA,ARTICULO,NRO_SERIE,EJERCICIO_ENT,CANAL_ENT,SER' +
        'IE_ENT,RIG_ENT,LINEA_ENT,FECHA_ENT, ALMACEN_ENT FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'PROVEEDOR = ?PROVEEDOR AND'
      'DEVOLUCION = 0 AND '
      'DEVOLUCION_VENTA = 0 AND '
      'MOVIMIENTO = 0 AND'
      'RIG_SAL = 0 AND'
      'RIG_MOS = 0'
      'ORDER BY ALMACEN_ENT,FECHA_ENT DESC')
    UniDirectional = False
    Left = 32
    Top = 160
    object xAsignadoID: TIntegerField
      DisplayLabel = 'id'
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
    object xAsignadoEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ENT'
    end
    object xAsignadoCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ENT'
    end
    object xAsignadoSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ENT'
      Size = 10
    end
    object xAsignadoRIG_ENT: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_ENT'
    end
    object xAsignadoLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_ENT'
    end
    object xAsignadoFECHA_ENT: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ENT'
    end
    object xAsignadoALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
  end
  object SPDevuelve: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_dev_nro_serie_comp_kri (?ID , ?EJERCICIO' +
        '_DEC ,'
      
        ' ?CANAL_DEC , ?SERIE_DEC , ?RIG_DEC , ?LINEA_DEC , ?ALMACEN_DEC ' +
        ','
      ' ?FECHA_DEC )')
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
      '  update nro_serie_kri'
      '     set devolucion = 0,'
      '         ejercicio_dec = 0,'
      '         canal_dec = 0,'
      '         serie_dec = '#39#39','
      '         rig_dec = 0,'
      '         linea_dec = 0,'
      '         almacen_dec = '#39#39','
      '         fecha_dec = null'
      '  where'
      '         id = ?id')
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
      ' EJERCICIO_DEC = ?EJERCICIO_DEC AND'
      ' CANAL_DEC = ?CANAL_DEC  AND'
      ' SERIE_DEC = ?SERIE_DEC AND'
      ' RIG_DEC = ?RIG_DEC AND'
      ' LINEA_DEC = ?LINEA_DEC')
    Transaction = TLocal
    Left = 192
    Top = 128
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
      'DEVOLUCION = 1 AND'
      'EJERCICIO_DEC = ?EJERCICIO_DEC AND'
      'CANAL_DEC = ?CANAL_DEC AND'
      'SERIE_DEC = ?SERIE_DEC AND'
      'RIG_DEC = ?RIG_DEC AND'
      'LINEA_DEC = ?LINEA_DEC')
    UniDirectional = True
    Left = 120
    Top = 64
    object ID_a_BorrarID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
end
