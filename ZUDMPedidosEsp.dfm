object ZDMPedidosEsp: TZDMPedidosEsp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 506
  Top = 250
  Height = 480
  Width = 566
  object QMPedidosCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_CABECERAS_S_PED'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_CABECERAS_S_PED'
      
        '  (EMPRESA,EJERCICIO,RIG,CLIENTE,FECHA,SU_REFERENCIA,NOTAS,DIAS_' +
        'SERVIR,FECHA_ENTREGA_PREV,ESTADO_PED,EMPRESA_D,EJERCICIO_D,CANAL' +
        '_D,SERIE_D,TIPO_D,RIG_D,ID_S_D)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?RIG,?CLIENTE,?FECHA,?SU_REFERENCIA,?NOTA' +
        'S,?DIAS_SERVIR,?FECHA_ENTREGA_PREV,?ESTADO_PED,?EMPRESA_D,?EJERC' +
        'ICIO_D,?CANAL_D,?SERIE_D,?TIPO_D,?RIG_D,?ID_S_D)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_CABECERAS_S_PED'
      'WHERE'
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_GES_CABECERAS_S_PED'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'RIG = :RIG ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_CABECERAS_S_PED'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,FECHA=?FECHA '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,NOTAS=?NOTAS '
      '  ,DIAS_SERVIR=?DIAS_SERVIR '
      '  ,FECHA_ENTREGA_PREV=?FECHA_ENTREGA_PREV '
      '  ,ESTADO_PED=?ESTADO_PED '
      '  ,EMPRESA_D=?EMPRESA_D '
      '  ,EJERCICIO_D=?EJERCICIO_D '
      '  ,CANAL_D=?CANAL_D '
      '  ,SERIE_D=?SERIE_D '
      '  ,TIPO_D=?TIPO_D '
      '  ,RIG_D=?RIG_D '
      '  ,ID_S_D=?ID_S_D '
      'WHERE'
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMPedidosCabAfterOpen
    AfterPost = QMPedidosCabAfterPost
    AfterScroll = QMPedidosCabAfterScroll
    BeforeDelete = CompruebaEstado
    BeforeEdit = CompruebaEstado
    BeforePost = QMPedidosCabBeforePost
    OnNewRecord = QMPedidosCabNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_CABECERAS_S_PED'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMPedidosCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosCabRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPedidosCabCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMPedidosCabCLIENTEChange
    end
    object QMPedidosCabFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosCabSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMPedidosCabNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPedidosCabDIAS_SERVIR: TIntegerField
      DisplayLabel = 'Dias Servir'
      FieldName = 'DIAS_SERVIR'
    end
    object QMPedidosCabFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMPedidosCabESTADO_PED: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_PED'
    end
    object QMPedidosCabEMPRESA_D: TIntegerField
      DisplayLabel = 'Emp. Destino'
      FieldName = 'EMPRESA_D'
    end
    object QMPedidosCabEJERCICIO_D: TIntegerField
      DisplayLabel = 'Ejercicio D.'
      FieldName = 'EJERCICIO_D'
    end
    object QMPedidosCabCANAL_D: TIntegerField
      DisplayLabel = 'Can. Destino'
      FieldName = 'CANAL_D'
    end
    object QMPedidosCabSERIE_D: TFIBStringField
      DisplayLabel = 'Serie D.'
      FieldName = 'SERIE_D'
      Size = 10
    end
    object QMPedidosCabTIPO_D: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_D'
      Size = 3
    end
    object QMPedidosCabRIG_D: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_D'
    end
    object QMPedidosCabID_S_D: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_S_D'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 472
    Top = 16
  end
  object DSPedidosCab: TDataSource
    DataSet = QMPedidosCab
    Left = 144
    Top = 16
  end
  object DSPedidosTipo: TDataSource
    DataSet = QMPedidosTipo
    Left = 144
    Top = 64
  end
  object DSPedidosDet: TDataSource
    DataSet = QMPedidosDet
    Left = 144
    Top = 112
  end
  object QMPedidosTipo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_TIPO_PED'
      'WHERE'
      '  MODELO=?old_MODELO AND '
      '  TIPO_ARTICULO_TYC=?old_TIPO_ARTICULO_TYC AND '
      '  RIG=?old_RIG AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_TIPO_PED'
      
        '  (EMPRESA,EJERCICIO,RIG,TIPO_ARTICULO_TYC,MODELO,CONFIG_TIPO,CO' +
        'NFIG_SUBTIPO,LACADO,CANTIDAD,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?RIG,?TIPO_ARTICULO_TYC,?MODELO,?CONFIG_T' +
        'IPO,?CONFIG_SUBTIPO,?LACADO,?CANTIDAD,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_TIPO_PED'
      'WHERE'
      '  MODELO=?MODELO AND '
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC AND '
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_GES_TIPO_PED'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'RIG = :RIG'
      'ORDER BY TIPO_ARTICULO_TYC, MODELO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_TIPO_PED'
      'SET'
      '  LACADO=?LACADO '
      '  ,CANTIDAD=?CANTIDAD'
      '  ,CONFIG_TIPO =?CONFIG_TIPO'
      '  ,CONFIG_SUBTIPO =?CONFIG_SUBTIPO'
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  MODELO=?MODELO AND '
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC AND '
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSPedidosCab
    AfterOpen = QMPedidosTipoAfterOpen
    AfterScroll = QMPedidosTipoAfterScroll
    BeforeDelete = CompruebaEstado
    BeforeEdit = CompruebaEstado
    OnNewRecord = QMPedidosTipoNewRecord
    OnPostError = QMPedidosTipoPostError
    ClavesPrimarias.Strings = (
      'MODELO '
      'TIPO_ARTICULO_TYC '
      'RIG '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_TIPO_PED'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 64
    object QMPedidosTipoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosTipoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosTipoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPedidosTipoTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object QMPedidosTipoLACADO: TFIBStringField
      DisplayLabel = 'Lacado'
      FieldName = 'LACADO'
      Size = 2
    end
    object QMPedidosTipoCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMPedidosTipoCONFIG_TIPO: TIntegerField
      DisplayLabel = 'Config. Tipo'
      FieldName = 'CONFIG_TIPO'
    end
    object QMPedidosTipoCONFIG_SUBTIPO: TIntegerField
      DisplayLabel = 'Config. Subtipo'
      FieldName = 'CONFIG_SUBTIPO'
    end
    object QMPedidosTipoMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 5
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPedidosTipoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object QMPedidosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_VER_DETALLE_PEDIDO_ESP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  RIG=?old_RIG AND '
      '  TIPO_ARTICULO_TYC=?old_TIPO_ARTICULO_TYC AND '
      '  MODELO=?old_MODELO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_VER_DETALLE_PEDIDO_ESP'
      
        '  (EMPRESA,EJERCICIO,RIG,TIPO_ARTICULO_TYC,MODELO,LINEA,LINEAL,S' +
        'ALIDA,ALTURA,CANTIDAD,LACADO,LONA,BAMBALINA,RIBETE,IMG_BAMBALINA' +
        ',IMG_RIBETE,ROTULADO,ROTULADO_COMENTARIO,MANUAL_O_MOTOR,MANUAL_M' +
        'ANIVELA,MOTOR_LT,MOTOR_EMISOR,MONTAJE,COLOCACION,TEJADILLO,PORTE' +
        'RIA,PARTIDA_O_ENTERA,PARTIDA_DER_IZQ_MED,ENTERA_DER_O_IZQ,ANCHO,' +
        'ALTO_QUEDAR,ALTO_DOBLA_ABAJO,ALTO_REFUERZO_ALT,ALTO_DESDE_ARRIBA' +
        ',LARGO,CURRIAS,CARRIL,VARILLA,TIPO_CONFECCION,CONFECCION_DOBLA_A' +
        'LRED,CONFECCION_OLLAOS_PEQ,CONFECCION_OLLAOS_GRAN,ARRIBA_O_ABAJO' +
        ',VELCRO,QUEDAR,CORTE,MONTADO,TAPAJUNTAS,COMPONENTE,MOD_BAMBALINA' +
        ',NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?RIG,?TIPO_ARTICULO_TYC,?MODELO,?LINEA,?L' +
        'INEAL,?SALIDA,?ALTURA,?CANTIDAD,?LACADO,?LONA,?BAMBALINA,?RIBETE' +
        ',?IMG_BAMBALINA,?IMG_RIBETE,?ROTULADO,?ROTULADO_COMENTARIO,?MANU' +
        'AL_O_MOTOR,?MANUAL_MANIVELA,?MOTOR_LT,?MOTOR_EMISOR,?MONTAJE,?CO' +
        'LOCACION,?TEJADILLO,?PORTERIA,?PARTIDA_O_ENTERA,?PARTIDA_DER_IZQ' +
        '_MED,?ENTERA_DER_O_IZQ,?ANCHO,?ALTO_QUEDAR,?ALTO_DOBLA_ABAJO,?AL' +
        'TO_REFUERZO_ALT,?ALTO_DESDE_ARRIBA,?LARGO,?CURRIAS,?CARRIL,?VARI' +
        'LLA,?TIPO_CONFECCION,?CONFECCION_DOBLA_ALRED,?CONFECCION_OLLAOS_' +
        'PEQ,?CONFECCION_OLLAOS_GRAN,?ARRIBA_O_ABAJO,?VELCRO,?QUEDAR,?COR' +
        'TE,?MONTADO,?TAPAJUNTAS,?COMPONENTE,?MOD_BAMBALINA,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_VER_DETALLE_PEDIDO_ESP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIG=?RIG AND '
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC AND '
      '  MODELO=?MODELO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_VER_DETALLE_PEDIDO_ESP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'RIG = :RIG AND'
      'TIPO_ARTICULO_TYC = :TIPO_ARTICULO_TYC AND'
      'MODELO = :MODELO'
      'ORDER BY LINEA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_VER_DETALLE_PEDIDO_ESP'
      'SET'
      '  LINEAL=?LINEAL '
      '  ,SALIDA=?SALIDA '
      '  ,ALTURA=?ALTURA '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,LACADO=?LACADO '
      '  ,LONA=?LONA '
      '  ,BAMBALINA=?BAMBALINA '
      '  ,RIBETE=?RIBETE '
      '  ,IMG_BAMBALINA=?IMG_BAMBALINA '
      '  ,IMG_RIBETE=?IMG_RIBETE '
      '  ,ROTULADO=?ROTULADO '
      '  ,ROTULADO_COMENTARIO=?ROTULADO_COMENTARIO '
      '  ,MANUAL_O_MOTOR=?MANUAL_O_MOTOR '
      '  ,MANUAL_MANIVELA=?MANUAL_MANIVELA '
      '  ,MOTOR_LT=?MOTOR_LT '
      '  ,MOTOR_EMISOR=?MOTOR_EMISOR '
      '  ,MONTAJE=?MONTAJE '
      '  ,COLOCACION=?COLOCACION '
      '  ,TEJADILLO=?TEJADILLO '
      '  ,PORTERIA=?PORTERIA '
      '  ,PARTIDA_O_ENTERA=?PARTIDA_O_ENTERA '
      '  ,PARTIDA_DER_IZQ_MED=?PARTIDA_DER_IZQ_MED '
      '  ,ENTERA_DER_O_IZQ=?ENTERA_DER_O_IZQ '
      '  ,ANCHO=?ANCHO '
      '  ,ALTO_QUEDAR=?ALTO_QUEDAR '
      '  ,ALTO_DOBLA_ABAJO=?ALTO_DOBLA_ABAJO '
      '  ,ALTO_REFUERZO_ALT=?ALTO_REFUERZO_ALT '
      '  ,ALTO_DESDE_ARRIBA=?ALTO_DESDE_ARRIBA '
      '  ,LARGO=?LARGO '
      '  ,CURRIAS=?CURRIAS '
      '  ,CARRIL=?CARRIL '
      '  ,VARILLA=?VARILLA '
      '  ,TIPO_CONFECCION=?TIPO_CONFECCION '
      '  ,CONFECCION_DOBLA_ALRED=?CONFECCION_DOBLA_ALRED '
      '  ,CONFECCION_OLLAOS_PEQ=?CONFECCION_OLLAOS_PEQ '
      '  ,CONFECCION_OLLAOS_GRAN=?CONFECCION_OLLAOS_GRAN '
      '  ,ARRIBA_O_ABAJO=?ARRIBA_O_ABAJO '
      '  ,VELCRO=?VELCRO '
      '  ,QUEDAR=?QUEDAR '
      '  ,CORTE=?CORTE '
      '  ,MONTADO=?MONTADO '
      '  ,TAPAJUNTAS=?TAPAJUNTAS '
      '  ,COMPONENTE=?COMPONENTE'
      '  ,MOD_BAMBALINA=?MOD_BAMBALINA'
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIG=?RIG AND '
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC AND '
      '  MODELO=?MODELO AND '
      '  LINEA=?LINEA ')
    DataSource = DSPedidosTipo
    BeforeDelete = CompruebaEstado
    BeforeEdit = CompruebaEstado
    BeforeInsert = CompruebaEstado
    OnNewRecord = QMPedidosDetNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'RIG '
      'TIPO_ARTICULO_TYC '
      'MODELO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_VER_DETALLE_PEDIDO_ESP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 112
    object QMPedidosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosDetRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPedidosDetTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      DisplayWidth = 3
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object QMPedidosDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPedidosDetLINEAL: TFloatField
      DisplayLabel = 'Lineal'
      FieldName = 'LINEAL'
      OnChange = QMPedidosDetLINEALChange
    end
    object QMPedidosDetSALIDA: TFloatField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
      OnChange = QMPedidosDetSALIDAChange
    end
    object QMPedidosDetALTURA: TFloatField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
    end
    object QMPedidosDetLACADO: TFIBStringField
      DisplayLabel = 'Lacado'
      FieldName = 'LACADO'
      Size = 2
    end
    object QMPedidosDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMPedidosDetLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMPedidosDetBAMBALINA: TFIBStringField
      DisplayLabel = 'Bambalina'
      FieldName = 'BAMBALINA'
      Size = 3
    end
    object QMPedidosDetRIBETE: TFIBStringField
      DisplayLabel = 'Ribete'
      FieldName = 'RIBETE'
      Size = 3
    end
    object QMPedidosDetIMG_BAMBALINA: TBlobField
      DisplayLabel = 'Img. Bambalina'
      FieldName = 'IMG_BAMBALINA'
      Size = 8
    end
    object QMPedidosDetIMG_RIBETE: TBlobField
      DisplayLabel = 'Img. Ribete'
      FieldName = 'IMG_RIBETE'
      Size = 8
    end
    object QMPedidosDetROTULADO: TIntegerField
      DisplayLabel = 'Rotulado'
      FieldName = 'ROTULADO'
    end
    object QMPedidosDetROTULADO_COMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'ROTULADO_COMENTARIO'
      Size = 60
    end
    object QMPedidosDetMANUAL_O_MOTOR: TIntegerField
      DisplayLabel = 'Manual/Motor'
      FieldName = 'MANUAL_O_MOTOR'
      OnChange = QMPedidosDetMANUAL_O_MOTORChange
    end
    object QMPedidosDetMANUAL_MANIVELA: TFIBStringField
      DisplayLabel = 'Manual Maniv.'
      FieldName = 'MANUAL_MANIVELA'
      Size = 15
    end
    object QMPedidosDetMOTOR_LT: TFIBStringField
      DisplayLabel = 'Motor LT'
      FieldName = 'MOTOR_LT'
      Size = 3
    end
    object QMPedidosDetMOTOR_EMISOR: TFIBStringField
      DisplayLabel = 'Motor Emisor'
      FieldName = 'MOTOR_EMISOR'
      Size = 15
    end
    object QMPedidosDetMONTAJE: TFIBStringField
      DisplayLabel = 'Montaje'
      FieldName = 'MONTAJE'
      Size = 3
    end
    object QMPedidosDetCOLOCACION: TFIBStringField
      DisplayLabel = 'Colocacion'
      FieldName = 'COLOCACION'
      Size = 3
    end
    object QMPedidosDetTEJADILLO: TFIBStringField
      DisplayLabel = 'Tejadillo'
      FieldName = 'TEJADILLO'
      Size = 3
    end
    object QMPedidosDetPORTERIA: TFIBStringField
      DisplayLabel = 'Porteria'
      FieldName = 'PORTERIA'
      Size = 3
    end
    object QMPedidosDetPARTIDA_O_ENTERA: TIntegerField
      DisplayLabel = 'Partida/Entera'
      FieldName = 'PARTIDA_O_ENTERA'
    end
    object QMPedidosDetPARTIDA_DER_IZQ_MED: TFIBStringField
      DisplayLabel = 'Part. Der./Izq./Med'
      FieldName = 'PARTIDA_DER_IZQ_MED'
      Size = 3
    end
    object QMPedidosDetENTERA_DER_O_IZQ: TFIBStringField
      DisplayLabel = 'Entera DEr./Izq.'
      FieldName = 'ENTERA_DER_O_IZQ'
      Size = 3
    end
    object QMPedidosDetANCHO: TIntegerField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMPedidosDetALTO_QUEDAR: TIntegerField
      DisplayLabel = 'Alto quedar'
      FieldName = 'ALTO_QUEDAR'
    end
    object QMPedidosDetALTO_DOBLA_ABAJO: TIntegerField
      DisplayLabel = 'Alto dobla abajo'
      FieldName = 'ALTO_DOBLA_ABAJO'
    end
    object QMPedidosDetALTO_REFUERZO_ALT: TIntegerField
      DisplayLabel = 'Alto refuerzo'
      FieldName = 'ALTO_REFUERZO_ALT'
    end
    object QMPedidosDetALTO_DESDE_ARRIBA: TIntegerField
      DisplayLabel = 'Alto d/arriba'
      FieldName = 'ALTO_DESDE_ARRIBA'
    end
    object QMPedidosDetLARGO: TIntegerField
      DisplayLabel = 'Largo'
      FieldName = 'LARGO'
    end
    object QMPedidosDetCURRIAS: TFIBStringField
      DisplayLabel = 'Currias'
      FieldName = 'CURRIAS'
      Size = 3
    end
    object QMPedidosDetCARRIL: TFIBStringField
      DisplayLabel = 'Carril'
      FieldName = 'CARRIL'
      Size = 3
    end
    object QMPedidosDetVARILLA: TFIBStringField
      DisplayLabel = 'Varilla'
      FieldName = 'VARILLA'
      Size = 3
    end
    object QMPedidosDetTIPO_CONFECCION: TFIBStringField
      DisplayLabel = 'Tipo Confec.'
      FieldName = 'TIPO_CONFECCION'
      Size = 3
    end
    object QMPedidosDetCONFECCION_DOBLA_ALRED: TIntegerField
      DisplayLabel = 'Confec. Dobla'
      FieldName = 'CONFECCION_DOBLA_ALRED'
    end
    object QMPedidosDetCONFECCION_OLLAOS_PEQ: TIntegerField
      DisplayLabel = 'Confec. Ollados Peq.'
      FieldName = 'CONFECCION_OLLAOS_PEQ'
    end
    object QMPedidosDetCONFECCION_OLLAOS_GRAN: TIntegerField
      DisplayLabel = 'Confec. Ollados Gran.'
      FieldName = 'CONFECCION_OLLAOS_GRAN'
    end
    object QMPedidosDetARRIBA_O_ABAJO: TIntegerField
      DisplayLabel = 'Arriba/Abajo'
      FieldName = 'ARRIBA_O_ABAJO'
    end
    object QMPedidosDetVELCRO: TIntegerField
      DisplayLabel = 'Velcro'
      FieldName = 'VELCRO'
    end
    object QMPedidosDetQUEDAR: TIntegerField
      DisplayLabel = 'Quedar'
      FieldName = 'QUEDAR'
    end
    object QMPedidosDetCORTE: TIntegerField
      DisplayLabel = 'Corte'
      FieldName = 'CORTE'
    end
    object QMPedidosDetMONTADO: TIntegerField
      DisplayLabel = 'Montado'
      FieldName = 'MONTADO'
    end
    object QMPedidosDetTAPAJUNTAS: TFIBStringField
      DisplayLabel = 'Tapajuntas'
      FieldName = 'TAPAJUNTAS'
      Size = 15
    end
    object QMPedidosDetArticulo: TStringField
      DisplayLabel = 'Art'#237'culo'
      FieldKind = fkCalculated
      FieldName = 'Articulo'
      OnGetText = QMPedidosDetArticuloGetText
      Size = 15
      Calculated = True
    end
    object QMPedidosDetLineaPed: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldKind = fkCalculated
      FieldName = 'LineaPed'
      OnGetText = QMPedidosDetLineaPedGetText
      Calculated = True
    end
    object QMPedidosDetCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMPedidosDetMOD_BAMBALINA: TIntegerField
      DisplayLabel = 'Mod. Bambalina'
      FieldName = 'MOD_BAMBALINA'
    end
    object QMPedidosDetMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPedidosDetNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object xModelos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_SYS_MODELOS'
      'WHERE'
      'CODIGO = :MODELO ')
    UniDirectional = False
    DataSource = DSPedidosTipo
    Left = 48
    Top = 256
    object xModelosCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object xModelosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xModelosDIAS_SERVIR: TIntegerField
      DisplayLabel = 'Dias Servir'
      FieldName = 'DIAS_SERVIR'
    end
    object xModelosCONFIG_TIPO: TIntegerField
      DisplayLabel = 'Config. Tipo'
      FieldName = 'CONFIG_TIPO'
    end
    object xModelosCONFIG_SUBTIPO: TIntegerField
      DisplayLabel = 'Config. Subtipo'
      FieldName = 'CONFIG_SUBTIPO'
    end
    object xModelosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xModelosIMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'IMAGEN'
    end
  end
  object QMPedidosImg: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_IMAGENES_PED'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_IMAGENES_PED'
      '  (EMPRESA,EJERCICIO,RIG,LINEA,RUTA_IMG,DESCRIPCION_IMG)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?RIG,?LINEA,?RUTA_IMG,?DESCRIPCION_IMG)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_IMAGENES_PED'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_GES_IMAGENES_PED'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'RIG = :RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_IMAGENES_PED'
      'SET'
      '  RUTA_IMG=?RUTA_IMG '
      '  ,DESCRIPCION_IMG=?DESCRIPCION_IMG'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSPedidosCab
    AfterOpen = QMPedidosImgAfterOpen
    AfterScroll = QMPedidosImgAfterScroll
    OnNewRecord = QMPedidosImgNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_IMAGENES_PED'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 160
    object QMPedidosImgEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosImgEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosImgRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPedidosImgLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMPedidosImgRUTA_IMG: TFIBStringField
      DisplayLabel = 'Ruta de Imagen'
      FieldName = 'RUTA_IMG'
      Size = 100
    end
    object QMPedidosImgDESCRIPCION_IMG: TFIBStringField
      DisplayLabel = 'Descripci'#243'n Imagen'
      FieldName = 'DESCRIPCION_IMG'
      Size = 60
    end
  end
  object DSPedidosImg: TDataSource
    DataSet = QMPedidosImg
    Left = 144
    Top = 160
  end
  object xDatosConfig: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_SYS_TIPOS_CONFIG_DET_DATOS'
      'WHERE'
      'TIPO = :CONFIG_TIPO AND'
      'SUBTIPO = :CONFIG_SUBTIPO AND'
      'VISIBLE = 1'
      'ORDER BY ORDEN, CAMPO')
    UniDirectional = False
    DataSource = DSPedidosTipo
    Left = 48
    Top = 208
    object xDatosConfigTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xDatosConfigSUBTIPO: TIntegerField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO'
    end
    object xDatosConfigCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 31
    end
    object xDatosConfigVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xDatosConfigORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object xMotores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_VER_MOTORES_ARTICULO(:EMPRESA, :ARTICULO, :LONA,' +
        ' :TARIFA) ')
    UniDirectional = False
    Left = 48
    Top = 304
    object xMotoresART_MOTOR: TFIBStringField
      DisplayLabel = 'Art. Motor'
      FieldName = 'ART_MOTOR'
      Size = 15
    end
    object xMotoresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSxMotores: TDataSource
    DataSet = xMotores
    Left = 144
    Top = 304
  end
  object QTyCConfig: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT LISTADO_PED_ESPECIALES'
      'FROM Z_TYC_CONFIGURACION'
      'WHERE'
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSPedidosCab
    Left = 48
    Top = 352
    object QTyCConfigLISTADO_PED_ESPECIALES: TIntegerField
      DisplayLabel = 'Listado Ped. Esp.'
      FieldName = 'LISTADO_PED_ESPECIALES'
    end
  end
  object DSTycConfig: TDataSource
    DataSet = QTyCConfig
    Left = 144
    Top = 352
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 471
    Top = 64
  end
end
