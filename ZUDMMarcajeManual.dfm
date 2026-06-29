object ZDMMarcajeManual: TZDMMarcajeManual
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 495
  Top = 376
  Height = 236
  Width = 318
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 224
    Top = 10
  end
  object QMMarcajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_VER_MARCAJES_MANUALES'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_VER_MARCAJES_MANUALES'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and tipo="PEC"'
      'order by rig')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_VER_MARCAJES_MANUALES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,TERCERO=?TERCERO '
      '  ,CLIENTE=?CLIENTE '
      '  ,DESC_CLIENTE=?DESC_CLIENTE '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,FECHA_CORTE=?FECHA_CORTE '
      '  ,OPERARIO_CORTE=?OPERARIO_CORTE '
      '  ,FECHA_UNION=?FECHA_UNION '
      '  ,OPERARIO_UNION=?OPERARIO_UNION '
      '  ,FECHA_MACARRON=?FECHA_MACARRON '
      '  ,OPERARIO_MACARRON=?OPERARIO_MACARRON '
      '  ,FECHA_MONTAJE=?FECHA_MONTAJE '
      '  ,OPERARIO_MONTAJE=?OPERARIO_MONTAJE '
      '  ,FECHA_TERMINADO=?FECHA_TERMINADO '
      '  ,OPERARIO_TERMINADO=?OPERARIO_TERMINADO '
      '  ,FECHA_PREPARADO=?FECHA_PREPARADO'
      '  ,OPERARIO_PREPARADO=?OPERARIO_PREPARADO'
      '  ,FECHA_MOTOR=?FECHA_MOTOR'
      '  ,OPERARIO_MOTOR=?OPERARIO_MOTOR'
      'WHERE'
      '  ID_S=?ID_S ')
    AfterOpen = QMMarcajesAfterOpen
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_VER_MARCAJES_MANUALES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 11
    object QMMarcajesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMarcajesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMarcajesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMarcajesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMMarcajesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMMarcajesRIG: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'RIG'
    end
    object QMMarcajesID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMMarcajesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMMarcajesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMMarcajesDESC_CLIENTE: TFIBStringField
      DisplayLabel = 'Nombre Cliente'
      FieldName = 'DESC_CLIENTE'
      Size = 60
    end
    object QMMarcajesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMMarcajesFECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fecha Corte'
      FieldName = 'FECHA_CORTE'
    end
    object QMMarcajesOPERARIO_CORTE: TIntegerField
      DisplayLabel = 'Ope. Corte'
      FieldName = 'OPERARIO_CORTE'
    end
    object QMMarcajesFECHA_UNION: TDateTimeField
      DisplayLabel = 'Fecha Uni'#243'n'
      FieldName = 'FECHA_UNION'
    end
    object QMMarcajesOPERARIO_UNION: TIntegerField
      DisplayLabel = 'Ope. Uni'#243'n'
      FieldName = 'OPERARIO_UNION'
    end
    object QMMarcajesFECHA_MACARRON: TDateTimeField
      DisplayLabel = 'Fecha Macarr'#243'n'
      FieldName = 'FECHA_MACARRON'
    end
    object QMMarcajesOPERARIO_MACARRON: TIntegerField
      DisplayLabel = 'Ope. Macarr'#243'n'
      FieldName = 'OPERARIO_MACARRON'
    end
    object QMMarcajesFECHA_MONTAJE: TDateTimeField
      DisplayLabel = 'Fecha Montaje'
      FieldName = 'FECHA_MONTAJE'
    end
    object QMMarcajesOPERARIO_MONTAJE: TIntegerField
      DisplayLabel = 'Ope. Montaje'
      FieldName = 'OPERARIO_MONTAJE'
    end
    object QMMarcajesFECHA_TERMINADO: TDateTimeField
      DisplayLabel = 'Fecha Terminado'
      FieldName = 'FECHA_TERMINADO'
    end
    object QMMarcajesOPERARIO_TERMINADO: TIntegerField
      DisplayLabel = 'Ope. Terminado'
      FieldName = 'OPERARIO_TERMINADO'
    end
    object QMMarcajesFECHA_PREPARADO: TDateTimeField
      DisplayLabel = 'Fec. Preparado'
      FieldName = 'FECHA_PREPARADO'
    end
    object QMMarcajesOPERARIO_PREPARADO: TIntegerField
      DisplayLabel = 'Ope. Preparado'
      FieldName = 'OPERARIO_PREPARADO'
    end
    object QMMarcajesCOD_BARRAS: TIntegerField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'COD_BARRAS'
    end
    object QMMarcajesFECHA_MOTOR: TDateTimeField
      DisplayLabel = 'Fec. Motor'
      FieldName = 'FECHA_MOTOR'
    end
    object QMMarcajesOPERARIO_MOTOR: TIntegerField
      DisplayLabel = 'Ope. Motor'
      FieldName = 'OPERARIO_MOTOR'
    end
  end
  object DSMMarcajes: TDataSource
    DataSet = QMMarcajes
    Left = 120
    Top = 8
  end
  object QMDetMarcajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_DETALLE_MARCAJES_OF'
      'WHERE'
      '  ID_DETALLE=?old_ID_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_DETALLE_MARCAJES_OF'
      
        '  (ID_S,ID_DETALLE,FECHA_CORTE,OPERARIO_CORTE,FECHA_UNION,OPERAR' +
        'IO_UNION,FECHA_MACARRON,OPERARIO_MACARRON,FECHA_MONTAJE,OPERARIO' +
        '_MONTAJE,FECHA_TERMINADO,OPERARIO_TERMINADO,FECHA_PREPARADO,OPER' +
        'ARIO_PREPARADO,MAIL_ENVIADO,LINEA_PED,ID_ORDEN,FECHA_MOTOR,OPERA' +
        'RIO_MOTOR)'
      'VALUES'
      
        '  (?ID_S,?ID_DETALLE,?FECHA_CORTE,?OPERARIO_CORTE,?FECHA_UNION,?' +
        'OPERARIO_UNION,?FECHA_MACARRON,?OPERARIO_MACARRON,?FECHA_MONTAJE' +
        ',?OPERARIO_MONTAJE,?FECHA_TERMINADO,?OPERARIO_TERMINADO,?FECHA_P' +
        'REPARADO,?OPERARIO_PREPARADO,?MAIL_ENVIADO,?LINEA_PED,?ID_ORDEN,' +
        '?FECHA_MOTOR,?OPERARIO_MOTOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_DETALLE_MARCAJES_OF'
      'WHERE'
      '  ID_DETALLE=?ID_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_GES_DETALLE_MARCAJES_OF'
      'where id_s=?id_s'
      'order by linea_ped')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_DETALLE_MARCAJES_OF'
      'SET'
      '  ID_S=?ID_S '
      '  ,FECHA_CORTE=?FECHA_CORTE '
      '  ,OPERARIO_CORTE=?OPERARIO_CORTE '
      '  ,FECHA_UNION=?FECHA_UNION '
      '  ,OPERARIO_UNION=?OPERARIO_UNION '
      '  ,FECHA_MACARRON=?FECHA_MACARRON '
      '  ,OPERARIO_MACARRON=?OPERARIO_MACARRON '
      '  ,FECHA_MONTAJE=?FECHA_MONTAJE '
      '  ,OPERARIO_MONTAJE=?OPERARIO_MONTAJE '
      '  ,FECHA_TERMINADO=?FECHA_TERMINADO '
      '  ,OPERARIO_TERMINADO=?OPERARIO_TERMINADO '
      '  ,FECHA_PREPARADO=?FECHA_PREPARADO '
      '  ,OPERARIO_PREPARADO=?OPERARIO_PREPARADO '
      '  ,MAIL_ENVIADO=?MAIL_ENVIADO '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,ID_ORDEN=?ID_ORDEN '
      'WHERE'
      '  ID_DETALLE=?ID_DETALLE ')
    DataSource = DSMMarcajes
    ClavesPrimarias.Strings = (
      'ID_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_DETALLE_MARCAJES_OF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 32
    Top = 80
    object QMDetMarcajesID_DETALLE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLE'
    end
    object QMDetMarcajesID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetMarcajesLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMDetMarcajesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetMarcajesFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object QMDetMarcajesFECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. Corte'
      FieldName = 'FECHA_CORTE'
    end
    object QMDetMarcajesOPERARIO_CORTE: TIntegerField
      DisplayLabel = 'Ope. Corte'
      FieldName = 'OPERARIO_CORTE'
    end
    object QMDetMarcajesFECHA_UNION: TDateTimeField
      DisplayLabel = 'Fec. Union'
      FieldName = 'FECHA_UNION'
    end
    object QMDetMarcajesOPERARIO_UNION: TIntegerField
      DisplayLabel = 'Ope. Union'
      FieldName = 'OPERARIO_UNION'
    end
    object QMDetMarcajesFECHA_MACARRON: TDateTimeField
      DisplayLabel = 'Fec. Macarron'
      FieldName = 'FECHA_MACARRON'
    end
    object QMDetMarcajesOPERARIO_MACARRON: TIntegerField
      DisplayLabel = 'Ope. Macarron'
      FieldName = 'OPERARIO_MACARRON'
    end
    object QMDetMarcajesFECHA_MONTAJE: TDateTimeField
      DisplayLabel = 'Fec. Montaje'
      FieldName = 'FECHA_MONTAJE'
    end
    object QMDetMarcajesOPERARIO_MONTAJE: TIntegerField
      DisplayLabel = 'Ope. Montaje'
      FieldName = 'OPERARIO_MONTAJE'
    end
    object QMDetMarcajesFECHA_TERMINADO: TDateTimeField
      DisplayLabel = 'Fec. Terminado'
      FieldName = 'FECHA_TERMINADO'
    end
    object QMDetMarcajesOPERARIO_TERMINADO: TIntegerField
      DisplayLabel = 'Ope. Terminado'
      FieldName = 'OPERARIO_TERMINADO'
    end
    object QMDetMarcajesFECHA_PREPARADO: TDateTimeField
      DisplayLabel = 'Fec. Preparado'
      FieldName = 'FECHA_PREPARADO'
    end
    object QMDetMarcajesOPERARIO_PREPARADO: TIntegerField
      DisplayLabel = 'Ope. Preparado'
      FieldName = 'OPERARIO_PREPARADO'
    end
    object QMDetMarcajesMAIL_ENVIADO: TIntegerField
      DisplayLabel = 'Enviado'
      FieldName = 'MAIL_ENVIADO'
    end
    object QMDetMarcajesFECHA_MOTOR: TDateTimeField
      DisplayLabel = 'Fec. Motor'
      FieldName = 'FECHA_MOTOR'
    end
    object QMDetMarcajesOPERARIO_MOTOR: TIntegerField
      DisplayLabel = 'Ope. Motor'
      FieldName = 'OPERARIO_MOTOR'
    end
  end
  object DSDetMarcajes: TDataSource
    DataSet = QMDetMarcajes
    Left = 124
    Top = 80
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 224
    Top = 74
  end
end
