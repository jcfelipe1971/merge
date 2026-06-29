object DMAsignaLotes: TDMAsignaLotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 503
  Top = 365
  Height = 238
  Width = 302
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 224
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
    Top = 8
  end
  object xDocumento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ESTADO, '
      
        'C.FECHA, P.PROVEEDOR AS COD_CLI_PRO, D.LINEA, D.ALMACEN, D.ARTIC' +
        'ULO, D.TITULO, D.ID_A, D.UNIDADES, '
      
        '(SELECT SUM(CANTIDAD) FROM GES_DETALLES_E_LOTES WHERE ID_DETALLE' +
        'S_E = D.ID_DETALLES_E) UNIDADES_ASIGNADAS'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_ALB P ON C.ID_E = P.ID_E'
      'JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E'
      'WHERE'
      'D.ID_DETALLES_E = :ID_DETALLES')
    UniDirectional = False
    AfterScroll = xDocumentoAfterScroll
    Left = 40
    Top = 8
  end
  object DSxDocumento: TDataSource
    DataSet = xDocumento
    Left = 132
    Top = 8
  end
  object xLoteAsignado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, LOTE,' +
        ' N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO,'
      
        '       F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN, ID_DETALLES_E A' +
        'S ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, ID_A_UBICACION, SUBLINE' +
        'A'
      'FROM GES_DETALLES_E_LOTES'
      'WHERE'
      'ID_DETALLES_E = :ID_DETALLES'
      'ORDER BY SUBLINEA')
    UniDirectional = False
    DataSource = DSxDocumento
    Left = 40
    Top = 56
    object xLoteAsignadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLoteAsignadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xLoteAsignadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLoteAsignadoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLoteAsignadoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xLoteAsignadoRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xLoteAsignadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLoteAsignadoLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLoteAsignadoN_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object xLoteAsignadoCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xLoteAsignadoF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabricacion'
      FieldName = 'F_FABRICACION'
    end
    object xLoteAsignadoF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envasado'
      FieldName = 'F_ENVASADO'
    end
    object xLoteAsignadoF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'F_CADUCIDAD'
    end
    object xLoteAsignadoCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xLoteAsignadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLoteAsignadoALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLoteAsignadoID_A: TIntegerField
      DisplayLabel = 'Id. Art.'
      FieldName = 'ID_A'
    end
    object xLoteAsignadoPROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object xLoteAsignadoID_LOTE: TIntegerField
      DisplayLabel = 'Id. Lote'
      FieldName = 'ID_LOTE'
    end
    object xLoteAsignadoID_A_UBICACION: TIntegerField
      DisplayLabel = 'Id Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object xLoteAsignadoSUBLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'SUBLINEA'
    end
    object xLoteAsignadoID_DETALLES: TIntegerField
      FieldName = 'ID_DETALLES'
    end
  end
  object DSxLoteAsignado: TDataSource
    DataSet = xLoteAsignado
    Left = 132
    Top = 56
  end
  object xLoteDisponible: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      
        'SELECT ARTICULO, PROVEEDOR, ID_LOTE, LOTE, STOCK, ID_UBICACION, ' +
        'MEDIDA1, MEDIDA2, MEDIDA3, MEDIDA4, F_ENVASADO,'
      'F_CADUCIDAD, F_FABRICACION, CLASIFICACION, ALMACEN, CANAL'
      
        'FROM A_ART_STOCK_LOTE(:EMPRESA, :ARTICULO, :CANAL, :ALMACEN, :ID' +
        '_A_UBICACION)'
      'ORDER BY F_CADUCIDAD desc,  ID_LOTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 40
    Top = 104
    object xLoteDisponibleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLoteDisponiblePROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object xLoteDisponibleID_LOTE: TIntegerField
      DisplayLabel = 'Id. Lote'
      FieldName = 'ID_LOTE'
    end
    object xLoteDisponibleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLoteDisponibleSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object xLoteDisponibleSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Disponible'
      FieldName = 'STOCK_VIRTUAL'
    end
    object xLoteDisponibleID_UBICACION: TIntegerField
      DisplayLabel = 'Id. Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object xLoteDisponibleMEDIDA1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA1'
    end
    object xLoteDisponibleMEDIDA2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA2'
    end
    object xLoteDisponibleMEDIDA3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA3'
    end
    object xLoteDisponibleMEDIDA4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA4'
    end
    object xLoteDisponibleF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envasado'
      FieldName = 'F_ENVASADO'
    end
    object xLoteDisponibleF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'F_CADUCIDAD'
    end
    object xLoteDisponibleF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabricacion'
      FieldName = 'F_FABRICACION'
    end
    object xLoteDisponibleCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xLoteDisponibleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLoteDisponibleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSxLoteDisponible: TDataSource
    DataSet = xLoteDisponible
    Left = 132
    Top = 104
  end
end
