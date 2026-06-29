object ProDMArtSerializacion: TProDMArtSerializacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 488
  Top = 309
  Height = 300
  Width = 401
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 24
  end
  object QMArtSerializacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_SERIALIZACION'
      
        '  (NOTAS,FECHA_GARANTIA_PROVEEDOR,FECHA_GARANTIA_CLIENTE,FECHA_C' +
        'ADUCIDAD,FECHA,CONTADOR,CODIGO,LINEA,RIG,SERIE,TRASPASADO,ESTADO' +
        ',SIGNO,CANAL,EJERCICIO,EMPRESA,ALMACEN,ARTICULO,NSERIE,TIPO)'
      'VALUES'
      
        '  (?NOTAS,?FECHA_GARANTIA_PROVEEDOR,?FECHA_GARANTIA_CLIENTE,?FEC' +
        'HA_CADUCIDAD,?FECHA,?CONTADOR,?CODIGO,?LINEA,?RIG,?SERIE,?TRASPA' +
        'SADO,?ESTADO,?SIGNO,?CANAL,?EJERCICIO,?EMPRESA,?ALMACEN,?ARTICUL' +
        'O,?NSERIE,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_SERIALIZACION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIG = :RIG AND'
      'LINEA = :LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_SERIALIZACION'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,FECHA_GARANTIA_PROVEEDOR=?FECHA_GARANTIA_PROVEEDOR '
      '  ,FECHA_GARANTIA_CLIENTE=?FECHA_GARANTIA_CLIENTE '
      '  ,FECHA_CADUCIDAD=?FECHA_CADUCIDAD '
      '  ,FECHA=?FECHA '
      '  ,CONTADOR=?CONTADOR '
      '  ,TRASPASADO=?TRASPASADO '
      '  ,ESTADO=?ESTADO '
      '  ,SIGNO=?SIGNO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,NSERIE=?NSERIE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO ')
    AfterDelete = Graba
    AfterOpen = QMArtSerializacionAfterOpen
    AfterPost = QMArtSerializacionAfterPost
    BeforePost = QMArtSerializacionBeforePost
    OnNewRecord = QMArtSerializacionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'TIPO'
      'RIG'
      'LINEA'
      'CODIGO')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_SERIALIZACION'
    UpdateTransaction = TLocal
    Left = 40
    Top = 24
    object QMArtSerializacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtSerializacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMArtSerializacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArtSerializacionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMArtSerializacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMArtSerializacionRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMArtSerializacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMArtSerializacionCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMArtSerializacionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMArtSerializacionSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object QMArtSerializacionNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMArtSerializacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMArtSerializacionARTICULOChange
      Size = 15
    end
    object QMArtSerializacionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      OnChange = QMArtSerializacionALMACENChange
      Size = 3
    end
    object QMArtSerializacionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMArtSerializacionFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
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
    object QMArtSerializacionCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
  end
  object DSQMArtSerializacion: TDataSource
    DataSet = QMArtSerializacion
    Left = 144
    Top = 24
  end
  object xAlmacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA = ?EMPRESA AND'
      '               ALMACEN = ?ALMACEN')
    UniDirectional = False
    DataSource = DSQMArtSerializacion
    Left = 40
    Top = 72
  end
  object DSxAlmacenes: TDataSource
    DataSet = xAlmacenes
    Left = 144
    Top = 72
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS_EF'
      'WHERE EMPRESA =?EMPRESA AND'
      '               EJERCICIO = ?EJERCICIO AND'
      '               CANAL = ?CANAL AND'
      '               ARTICULO = ?ARTICULO')
    UniDirectional = False
    DataSource = DSQMArtSerializacion
    Left = 40
    Top = 120
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 144
    Top = 120
  end
  object SPGeneraResto_: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure pro_a_art_genera_resto_serial'
      '(?empresa, ?ejercicio, ?canal, ?serie, ?tipo,'
      '?rig, ?linea, ?fecha_ent)')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 144
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
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_IMPRESION_SERIALIZACION'
    UpdateTransaction = TLocal
    Left = 40
    Top = 216
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
  object xSerieAsignada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select codigo from art_articulos_serializacion'
      '    where(( empresa = ?empresa ) and'
      '          ( canal   = ?canal   ) and'
      '          ( nserie  = ?nserie  ))')
    UniDirectional = False
    DataSource = DSQMArtSerializacion
    Left = 40
    Top = 168
    object xSerieAsignadaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
  end
end
