object DMCorreo: TDMCorreo
  OldCreateOrder = False
  OnCreate = DMCorreoCreate
  Left = 361
  Top = 234
  Height = 562
  Width = 543
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 16
  end
  object QMCorreo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CORREO'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  USUARIO=?old_USUARIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CORREO'
      '  (EMPRESA,RIG,USUARIO,ASUNTO,MENSAJE)'
      'VALUES'
      '  (?EMPRESA,?RIG,?USUARIO,?ASUNTO,?MENSAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CORREO'
      'WHERE'
      '  RIG=?RIG AND '
      '  USUARIO=?USUARIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CORREO'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' USUARIO = ?USUARIO'
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CORREO'
      'SET'
      '   ASUNTO=?ASUNTO'
      '  ,MENSAJE=?MENSAJE'
      'WHERE'
      '  RIG=?RIG AND'
      '  USUARIO=?USUARIO AND'
      '  EMPRESA=?EMPRESA')
    AfterDelete = Graba
    AfterOpen = QMCorreoAfterOpen
    AfterPost = Graba
    BeforeClose = QMCorreoBeforeClose
    BeforePost = QMCorreoBeforePost
    OnNewRecord = QMCorreoNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'USUARIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CORREO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMCorreoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCorreoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCorreoUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMCorreoASUNTO: TFIBStringField
      DisplayLabel = 'Asunto'
      FieldName = 'ASUNTO'
      Size = 100
    end
    object QMCorreoMENSAJE: TBlobField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 8
    end
  end
  object DSQMCorreo: TDataSource
    DataSet = QMCorreo
    Left = 144
    Top = 64
  end
  object xUsuarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE,NOMBRE_CORREO,DIR_CORREO FROM'
      'SYS_USUARIOS'
      'WHERE USUARIO=?USUARIO')
    UniDirectional = False
    Left = 40
    Top = 304
    object xUsuariosNOMBRE_CORREO: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_CORREO'
      Size = 60
    end
    object xUsuariosDIR_CORREO: TFIBStringField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIR_CORREO'
      Size = 100
    end
    object xUsuariosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
  end
  object DSxUsuarios: TDataSource
    DataSet = xUsuarios
    Left = 144
    Top = 304
  end
  object QMCorreoDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CORREO_DETALLE'
      'WHERE'
      '  DIR=?old_DIR AND '
      '  RIG=?old_RIG AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CORREO_DETALLE'
      
        '  (AGRUPACION,CLIENTE,EMPRESA,RIG,DIR,TIPO,DESTINO_ADRESS,TERCER' +
        'O)'
      'VALUES'
      
        '  (?AGRUPACION,?CLIENTE,?EMPRESA,?RIG,?DIR,?TIPO,?DESTINO_ADRESS' +
        ',?TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CORREO_DETALLE'
      'WHERE'
      '  DIR=?DIR AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CORREO_DETALLE'
      'WHERE EMPRESA = ?EMPRESA AND'
      'RIG = ?RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CORREO_DETALLE'
      'SET'
      '  AGRUPACION=?AGRUPACION '
      '  ,CLIENTE=?CLIENTE '
      '  ,TIPO=?TIPO '
      '  ,DESTINO_ADRESS=?DESTINO_ADRESS '
      '  ,TERCERO=?TERCERO '
      'WHERE'
      '  DIR=?DIR AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCorreo
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCorreoDetalleNewRecord
    ClavesPrimarias.Strings = (
      'DIR '
      'RIG '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CORREO_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMCorreoDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCorreoDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCorreoDetalleDIR: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR'
    end
    object QMCorreoDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 15
    end
    object QMCorreoDetalleDESTINO_ADRESS: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO_ADRESS'
      Size = 100
    end
    object QMCorreoDetalleAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCorreoDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCorreoDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSQMCorreoDetalle: TDataSource
    DataSet = QMCorreoDetalle
    Left = 144
    Top = 112
  end
  object xTiposDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_DESTINO')
    UniDirectional = False
    Left = 40
    Top = 208
    object xTiposDestinoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 15
    end
    object xTiposDestinoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTiposDestino: TDataSource
    DataSet = xTiposDestino
    Left = 144
    Top = 208
  end
  object xListas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESTINO_ADRESS'
      'FROM EMP_CORREO_DETALLE'
      'WHERE EMPRESA = ?EMPRESA'
      'AND RIG = ?RIG'
      'AND TIPO =?TIPO')
    UniDirectional = False
    Left = 40
    Top = 256
    object xListasDESTINO_ADRESS: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO_ADRESS'
      Size = 100
    end
  end
  object DSxListas: TDataSource
    DataSet = xListas
    Left = 144
    Top = 256
  end
  object QMCorreoAdjuntos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CORREO_ADJUNTOS'
      'WHERE'
      '  DIR=?old_DIR AND '
      '  RIG=?old_RIG AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CORREO_ADJUNTOS'
      '  (EMPRESA,RIG,FICHERO,TAMANYO,DIR)'
      'VALUES'
      '  (?EMPRESA,?RIG,?FICHERO,?TAMANYO,?DIR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CORREO_ADJUNTOS'
      'WHERE'
      '  DIR=?DIR AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CORREO_ADJUNTOS'
      'WHERE'
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CORREO_ADJUNTOS'
      'SET'
      '  FICHERO=?FICHERO '
      '  ,TAMANYO=?TAMANYO '
      'WHERE'
      '  DIR=?DIR AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCorreo
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCorreoAdjuntosNewRecord
    ClavesPrimarias.Strings = (
      'DIR '
      'RIG '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CORREO_ADJUNTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 160
    object QMCorreoAdjuntosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCorreoAdjuntosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCorreoAdjuntosDIR: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR'
    end
    object QMCorreoAdjuntosFICHERO: TFIBStringField
      DisplayLabel = 'Fichero'
      FieldName = 'FICHERO'
      Size = 200
    end
    object QMCorreoAdjuntosTAMANYO: TFloatField
      DisplayLabel = 'Tama'#241'o'
      FieldName = 'TAMANYO'
    end
  end
  object DSQMCorreoAdjuntos: TDataSource
    DataSet = QMCorreoAdjuntos
    Left = 144
    Top = 160
  end
  object xListaAttach: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CORREO_ADJUNTOS'
      'WHERE'
      '  DIR=?DIR AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT FICHERO FROM EMP_CORREO_ADJUNTOS'
      'WHERE EMPRESA =?EMPRESA AND'
      'RIG = ?RIG')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'DIR '
      'RIG '
      'EMPRESA ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'EMP_CORREO_ADJUNTOS'
    Left = 40
    Top = 352
    object xListaAttachFICHERO: TFIBStringField
      DisplayLabel = 'Fichero'
      FieldName = 'FICHERO'
      Size = 200
    end
  end
  object DSxListaAttach: TDataSource
    DataSet = xListaAttach
    Left = 144
    Top = 352
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 16
  end
end
