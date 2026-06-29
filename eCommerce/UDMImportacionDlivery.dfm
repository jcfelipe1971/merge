object DMImportacionDlivery: TDMImportacionDlivery
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 312
  Top = 229
  Height = 344
  Width = 354
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 288
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 288
    Top = 64
  end
  object QMPedidosDlivery: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM IMP_DLIVERY'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO IMP_DLIVERY'
      
        '  (ID,ID_ORIGEN,FECHA,NOMBRE_CLIENTE,DIRECCION_RECOGIDA,COMUNA_R' +
        'ECOGIDA,FECHA_RETIRO,PERSONA_ENTREGA,TELEFONO_ENTREGA,DIRECCION_' +
        'ENTREGA,COMUNA_ENTREGA,COMENTARIO,MOVIL,ESTADO,FECHA_ENTREGA,COM' +
        'ENTARIO_ENTREGA,EMPRESA,CLIENTE,DIRECCION,AGENTE,ARTICULO,ID_DET' +
        'ALLES_S,ENTRADA_AGRUPACION)'
      'VALUES'
      
        '  (?ID,?ID_ORIGEN,?FECHA,?NOMBRE_CLIENTE,?DIRECCION_RECOGIDA,?CO' +
        'MUNA_RECOGIDA,?FECHA_RETIRO,?PERSONA_ENTREGA,?TELEFONO_ENTREGA,?' +
        'DIRECCION_ENTREGA,?COMUNA_ENTREGA,?COMENTARIO,?MOVIL,?ESTADO,?FE' +
        'CHA_ENTREGA,?COMENTARIO_ENTREGA,?EMPRESA,?CLIENTE,?DIRECCION,?AG' +
        'ENTE,?ARTICULO,?ID_DETALLES_S,?ENTRADA_AGRUPACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM IMP_DLIVERY'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM IMP_DLIVERY'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'ID_DETALLES_S = 0'
      'ORDER BY ID_ORIGEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE IMP_DLIVERY'
      'SET'
      '  ID_ORIGEN=?ID_ORIGEN '
      '  ,FECHA=?FECHA '
      '  ,NOMBRE_CLIENTE=?NOMBRE_CLIENTE '
      '  ,DIRECCION_RECOGIDA=?DIRECCION_RECOGIDA '
      '  ,COMUNA_RECOGIDA=?COMUNA_RECOGIDA '
      '  ,FECHA_RETIRO=?FECHA_RETIRO '
      '  ,PERSONA_ENTREGA=?PERSONA_ENTREGA '
      '  ,TELEFONO_ENTREGA=?TELEFONO_ENTREGA '
      '  ,DIRECCION_ENTREGA=?DIRECCION_ENTREGA '
      '  ,COMUNA_ENTREGA=?COMUNA_ENTREGA '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,MOVIL=?MOVIL '
      '  ,ESTADO=?ESTADO '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,COMENTARIO_ENTREGA=?COMENTARIO_ENTREGA '
      '  ,EMPRESA=?EMPRESA '
      '  ,CLIENTE=?CLIENTE '
      '  ,DIRECCION=?DIRECCION '
      '  ,AGENTE=?AGENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMPedidosDliveryBeforePost
    OnNewRecord = QMPedidosDliveryNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'IMP_DLIVERY'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMPedidosDliveryID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMPedidosDliveryID_ORIGEN: TIntegerField
      DisplayLabel = 'Id Origen'
      FieldName = 'ID_ORIGEN'
    end
    object QMPedidosDliveryFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosDliveryNOMBRE_CLIENTE: TFIBStringField
      DisplayLabel = 'Nombre Cliente'
      FieldName = 'NOMBRE_CLIENTE'
      Size = 256
    end
    object QMPedidosDliveryDIRECCION_RECOGIDA: TFIBStringField
      DisplayLabel = 'Dir. Regogida'
      FieldName = 'DIRECCION_RECOGIDA'
      Size = 256
    end
    object QMPedidosDliveryCOMUNA_RECOGIDA: TFIBStringField
      DisplayLabel = 'Comuna Recogida'
      FieldName = 'COMUNA_RECOGIDA'
      Size = 256
    end
    object QMPedidosDliveryPERSONA_ENTREGA: TFIBStringField
      DisplayLabel = 'Persona Entrega'
      FieldName = 'PERSONA_ENTREGA'
      Size = 256
    end
    object QMPedidosDliveryTELEFONO_ENTREGA: TFIBStringField
      DisplayLabel = 'Tel. Entrega'
      FieldName = 'TELEFONO_ENTREGA'
    end
    object QMPedidosDliveryDIRECCION_ENTREGA: TFIBStringField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
      Size = 256
    end
    object QMPedidosDliveryCOMUNA_ENTREGA: TFIBStringField
      DisplayLabel = 'Comuna Entrega'
      FieldName = 'COMUNA_ENTREGA'
      Size = 256
    end
    object QMPedidosDliveryMOVIL: TFIBStringField
      DisplayLabel = 'Movil'
      DisplayWidth = 256
      FieldName = 'MOVIL'
      Size = 256
    end
    object QMPedidosDliveryESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 256
    end
    object QMPedidosDliveryFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMPedidosDliveryEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosDliveryCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMPedidosDliveryDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMPedidosDliveryAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMPedidosDliveryARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPedidosDliveryFECHA_RETIRO: TDateTimeField
      DisplayLabel = 'Fecha Retiro'
      FieldName = 'FECHA_RETIRO'
    end
    object QMPedidosDliveryID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Documento'
      FieldName = 'ID_DETALLES_S'
    end
    object QMPedidosDliveryENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMPedidosDliveryCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 256
    end
    object QMPedidosDliveryCOMENTARIO_ENTREGA: TFIBStringField
      DisplayLabel = 'Comentario entrega'
      FieldName = 'COMENTARIO_ENTREGA'
      Size = 256
    end
  end
  object DSQMPedidosDlivery: TDataSource
    DataSet = QMPedidosDlivery
    Left = 144
    Top = 8
  end
end
