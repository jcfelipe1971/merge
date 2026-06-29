object DMArtSerializacion: TDMArtSerializacion
  OldCreateOrder = False
  OnCreate = DMArtSerializacionCreate
  Left = 439
  Top = 138
  Height = 434
  Width = 445
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 368
    Top = 8
  end
  object QMArtSerializacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  CODIGO=?old_CODIGO AND '
      '  ALMACEN=?old_ALMACEN ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_SERIALIZACION'
      
        '  (FECHA_CADUCIDAD,FECHA_GARANTIA_CLIENTE,FECHA_GARANTIA_PROVEED' +
        'OR,NOTAS,CONTADOR,CODIGO,DEVUELTO_PROV,EMPRESA,CANAL,ESTADO,ACTI' +
        'VO,NSERIE,ARTICULO,ALMACEN,CLIENTE_REPARACION)'
      'VALUES'
      
        '  (?FECHA_CADUCIDAD,?FECHA_GARANTIA_CLIENTE,?FECHA_GARANTIA_PROV' +
        'EEDOR,?NOTAS,?CONTADOR,?CODIGO,?DEVUELTO_PROV,?EMPRESA,?CANAL,?E' +
        'STADO,?ACTIVO,?NSERIE,?ARTICULO,?ALMACEN,?CLIENTE_REPARACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL'
      'ORDER BY EMPRESA, CANAL, CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_SERIALIZACION'
      'SET'
      '  FECHA_CADUCIDAD=?FECHA_CADUCIDAD '
      '  ,FECHA_GARANTIA_CLIENTE=?FECHA_GARANTIA_CLIENTE '
      '  ,FECHA_GARANTIA_PROVEEDOR=?FECHA_GARANTIA_PROVEEDOR '
      '  ,NOTAS=?NOTAS '
      '  ,CONTADOR=?CONTADOR '
      '  ,DEVUELTO_PROV=?DEVUELTO_PROV '
      '  ,ESTADO=?ESTADO '
      '  ,ACTIVO=?ACTIVO '
      '  ,NSERIE=?NSERIE '
      '  ,ARTICULO=?ARTICULO '
      '  ,CLIENTE_REPARACION=?CLIENTE_REPARACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    AfterOpen = QMArtSerializacionAfterOpen
    AfterPost = QMArtSerializacionAfterPost
    AfterScroll = QMArtSerializacionAfterScroll
    BeforePost = QMArtSerializacionBeforePost
    OnNewRecord = QMArtSerializacionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CODIGO '
      'ALMACEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_SERIALIZACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMArtSerializacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtSerializacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArtSerializacionCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMArtSerializacionNSERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMArtSerializacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArtSerializacionALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMArtSerializacionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMArtSerializacionFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object QMArtSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Gar. Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object QMArtSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Gar. Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object QMArtSerializacionNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMArtSerializacionDEVUELTO_PROV: TIntegerField
      DisplayLabel = 'Dev. Prov.'
      FieldName = 'DEVUELTO_PROV'
    end
    object QMArtSerializacionCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMArtSerializacionACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMArtSerializacionCLIENTE_REPARACION: TIntegerField
      DisplayLabel = 'Cli. Reparac.'
      FieldName = 'CLIENTE_REPARACION'
    end
    object QMArtSerializacionNombreCliente: TStringField
      DisplayLabel = 'Nombre'
      FieldKind = fkCalculated
      FieldName = 'NombreCliente'
      Size = 60
      Calculated = True
    end
  end
  object DSQMArtSerializacion: TDataSource
    DataSet = QMArtSerializacion
    Left = 152
    Top = 8
  end
  object SPGeneraCodigo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure a_art_genera_serializacion'
      '(?empresa, ?canal, ?longitud)')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 8
  end
  object SPGeneraResto: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure a_art_genera_resto_serial'
      '(?empresa, ?ejercicio, ?canal, ?serie, ?tipo,'
      '?rig, ?linea, ?fecha_ent)')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 56
  end
  object SPGeneraRestoE: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE A_ART_GENERA_RESTO_SERIAL_E'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA,'
      '?FECHA_ENT)')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 104
  end
  object QMImpresion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_IMPRESION_SERIALIZACION'
      'WHERE'
      '  NUM_SERIE=?old_NUM_SERIE AND '
      '  USUARIO=?old_USUARIO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_IMPRESION_SERIALIZACION'
      '  (USUARIO,ARTICULO,NUM_SERIE,DESCRIPCION)'
      'VALUES'
      '  (?USUARIO,?ARTICULO,?NUM_SERIE,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_IMPRESION_SERIALIZACION'
      'WHERE'
      '  NUM_SERIE=?NUM_SERIE AND '
      '  USUARIO=?USUARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_IMPRESION_SERIALIZACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_IMPRESION_SERIALIZACION'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  NUM_SERIE=?NUM_SERIE AND '
      '  USUARIO=?USUARIO ')
    OnNewRecord = QMImpresionNewRecord
    ClavesPrimarias.Strings = (
      'NUM_SERIE '
      'USUARIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_IMPRESION_SERIALIZACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object QMImpresionUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMImpresionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMImpresionNUM_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NUM_SERIE'
      Size = 25
    end
    object QMImpresionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xOrigen: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM FILTRA_SERIALIZACION_ORIG_DEST(?EMPRESA, ?CANAL, ?' +
        'CODIGO_SER, '#39'origen'#39')')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 48
    Top = 56
    object xOrigenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xOrigenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xOrigenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xOrigenSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 2
    end
    object xOrigenRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xOrigenLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xOrigenTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xOrigenID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xOrigenFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xOrigenSIGNO: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'SIGNO'
    end
  end
  object DSxOrigen: TDataSource
    DataSet = xOrigen
    Left = 152
    Top = 56
  end
  object xDestino: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM FILTRA_SERIALIZACION_ORIG_DEST(?EMPRESA, ?CANAL, ?' +
        'CODIGO_SER, '#39'destino'#39')')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 48
    Top = 104
    object xDestinoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDestinoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDestinoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDestinoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 2
    end
    object xDestinoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDestinoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDestinoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDestinoID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xDestinoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xDestinoSIGNO: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'SIGNO'
    end
  end
  object DSxDestino: TDataSource
    DataSet = xDestino
    Left = 152
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 368
    Top = 56
  end
end
