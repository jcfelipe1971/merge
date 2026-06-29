object DMRecepcionAlbaranes: TDMRecepcionAlbaranes
  OldCreateOrder = False
  OnCreate = DMRecepcionPedidosCreate
  Left = 958
  Top = 241
  Height = 289
  Width = 343
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VERWEB_TMP_RECEPCION_ART'
      'WHERE'
      '  ID_RECEPCION_LINEA=?old_ID_RECEPCION_LINEA AND '
      '  ID_DETALLES_E=?old_ID_DETALLES_E ')
    InsertSQL.Strings = (
      'INSERT INTO VERWEB_TMP_RECEPCION_ART'
      
        '  (ID_RECEPCION_LINEA,ARTICULO,TITULO_ART,CANTIDAD,ID_A,EMPRESA,' +
        'EJERCICIO,CANAL,SERIE,RECEPCION,ALBARAN,FECHA,ID_RECEPCION,ID_PR' +
        'OVEEDOR,ID_E,ID_DETALLES_E,CANTIDAD_DISTRIBUIDA,EMPRESA_E,EJERCI' +
        'CIO_E,CANAL_E,SERIE_E,TIPO_E,RIG_E,LINEA_E,CANTIDAD_E)'
      'VALUES'
      
        '  (?ID_RECEPCION_LINEA,?ARTICULO,?TITULO_ART,?CANTIDAD,?ID_A,?EM' +
        'PRESA,?EJERCICIO,?CANAL,?SERIE,?RECEPCION,?ALBARAN,?FECHA,?ID_RE' +
        'CEPCION,?ID_PROVEEDOR,?ID_E,?ID_DETALLES_E,?CANTIDAD_DISTRIBUIDA' +
        ',?EMPRESA_E,?EJERCICIO_E,?CANAL_E,?SERIE_E,?TIPO_E,?RIG_E,?LINEA' +
        '_E,?CANTIDAD_E)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VERWEB_TMP_RECEPCION_ART'
      'WHERE'
      '  ID_RECEPCION_LINEA=?ID_RECEPCION_LINEA AND '
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VERWEB_TMP_RECEPCION_ART'
      'WHERE ID_RECEPCION = ?ID_RECEPCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VERWEB_TMP_RECEPCION_ART'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,TITULO_ART=?TITULO_ART '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,ID_A=?ID_A '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,RECEPCION=?RECEPCION '
      '  ,ALBARAN=?ALBARAN '
      '  ,FECHA=?FECHA '
      '  ,ID_RECEPCION=?ID_RECEPCION '
      '  ,ID_PROVEEDOR=?ID_PROVEEDOR '
      '  ,ID_E=?ID_E '
      '  ,CANTIDAD_DISTRIBUIDA=?CANTIDAD_DISTRIBUIDA '
      '  ,EMPRESA_E=?EMPRESA_E '
      '  ,EJERCICIO_E=?EJERCICIO_E '
      '  ,CANAL_E=?CANAL_E '
      '  ,SERIE_E=?SERIE_E '
      '  ,TIPO_E=?TIPO_E '
      '  ,RIG_E=?RIG_E '
      '  ,LINEA_E=?LINEA_E '
      '  ,CANTIDAD_E=?CANTIDAD_E '
      'WHERE'
      '  ID_RECEPCION_LINEA=?ID_RECEPCION_LINEA AND '
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    DataSource = DSQMCabecera
    BeforeDelete = QMDetalleBeforeDelete
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_RECEPCION_LINEA '
      'ID_DETALLES_E ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VERWEB_TMP_RECEPCION_ART'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 56
    object QMDetalleID_RECEPCION_LINEA: TIntegerField
      DisplayLabel = 'ID Recepci'#243'n L'#237'nea'
      FieldName = 'ID_RECEPCION_LINEA'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO_ART: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object QMDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleRECEPCION: TIntegerField
      DisplayLabel = 'Recepci'#243'n'
      FieldName = 'RECEPCION'
    end
    object QMDetalleALBARAN: TFIBStringField
      DisplayLabel = 'Albar'#225'n'
      FieldName = 'ALBARAN'
      Size = 40
    end
    object QMDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetalleID_RECEPCION: TIntegerField
      DisplayLabel = 'ID Recepci'#243'n'
      FieldName = 'ID_RECEPCION'
    end
    object QMDetalleID_PROVEEDOR: TIntegerField
      DisplayLabel = 'ID Prov.'
      FieldName = 'ID_PROVEEDOR'
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'ID E.'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det. E.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleCANTIDAD_DISTRIBUIDA: TFloatField
      DisplayLabel = 'Cant. Distribuida'
      FieldName = 'CANTIDAD_DISTRIBUIDA'
    end
    object QMDetalleEMPRESA_E: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA_E'
    end
    object QMDetalleEJERCICIO_E: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_E'
    end
    object QMDetalleCANAL_E: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_E'
    end
    object QMDetalleSERIE_E: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_E'
      Size = 10
    end
    object QMDetalleTIPO_E: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_E'
      Size = 3
    end
    object QMDetalleRIG_E: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'RIG_E'
    end
    object QMDetalleLINEA_E: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA_E'
    end
    object QMDetalleCANTIDAD_E: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD_E'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 8
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      'FROM GES_CABECERAS_E C'
      
        'JOIN TMP_PROCESOS_AUTO T ON C.EMPRESA = T.EMPRESA AND C.EJERCICI' +
        'O = T.EJERCICIO AND C.CANAL = T.CANAL AND C.SERIE = T.SERIE AND ' +
        'C.TIPO = T.TIPO AND C.RIG = T.RIG'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.TIPO = :TIPO AND'
      'T.CONTADOR = :CONTADOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG')
    UniDirectional = False
    Left = 24
    Top = 104
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 104
    Top = 104
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_WEB_RECEPCION'
      'WHERE  ID_RECEPCION=?old_ID_RECEPCION')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_WEB_RECEPCION'
      'WHERE  ID_RECEPCION=?ID_RECEPCION')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_WEB_RECEPCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_WEB_RECEPCION'
      'SET'
      '  RECEPCIONAR=?RECEPCIONAR '
      'WHERE'
      '  ID_RECEPCION=?ID_RECEPCION')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_RECEPCION'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_WEB_RECEPCION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 8
    object QMCabeceraID_RECEPCION: TIntegerField
      DisplayLabel = 'ID Recepci'#243'n'
      FieldName = 'ID_RECEPCION'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraRECEPCION: TIntegerField
      DisplayLabel = 'Recepci'#243'n'
      FieldName = 'RECEPCION'
    end
    object QMCabeceraALBARAN: TFIBStringField
      DisplayLabel = 'Albar'#225'n'
      FieldName = 'ALBARAN'
      Size = 40
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraRECEPCIONAR: TIntegerField
      DisplayLabel = 'Recepcionar'
      FieldName = 'RECEPCIONAR'
    end
    object QMCabeceraID_PROVEEDOR: TIntegerField
      DisplayLabel = 'ID Prov.'
      FieldName = 'ID_PROVEEDOR'
    end
    object QMCabeceraCODIGO_PROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
    end
    object QMCabeceraTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCabeceraUSUARIO_ID: TFIBStringField
      DisplayLabel = 'ID Usuario'
      FieldName = 'USUARIO_ID'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 104
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 288
    Top = 8
  end
end
