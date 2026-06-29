object DMCatTransporte: TDMCatTransporte
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 410
  Top = 305
  Height = 174
  Width = 246
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 174
    Top = 18
  end
  object QMCatTransporte: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_QUI_CATEGORIAS_TRANSPORTE'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_QUI_CATEGORIAS_TRANSPORTE'
      
        '  (NUMERO_UN,CODIGO,IDENTIFICACION_RIESGOS,CONSIDERACIONES_ESP,D' +
        'ESCRIPCION,VEHICULO_TANQUES,TANQUE_UN,TANQUE_PORTATIL,ENVASADO,C' +
        'ANTIDADES_LIMITADAS,PROVISIONES_ESP,ETIQUETAS,ACTIVO,PACKING_GRO' +
        'UP,CLASE,CATEGORIA_TRANSPORTE,CRITERIO_SELECCION,APARTADO,LETRA,' +
        'COD_NATURALEZA_PELIGRO,COD_MEDIDAS_PROTECCION,COD_CLASIF,COD_RES' +
        'TRICCION_TUNEL)'
      'VALUES'
      
        '  (?NUMERO_UN,?CODIGO,?IDENTIFICACION_RIESGOS,?CONSIDERACIONES_E' +
        'SP,?DESCRIPCION,?VEHICULO_TANQUES,?TANQUE_UN,?TANQUE_PORTATIL,?E' +
        'NVASADO,?CANTIDADES_LIMITADAS,?PROVISIONES_ESP,?ETIQUETAS,?ACTIV' +
        'O,?PACKING_GROUP,?CLASE,?CATEGORIA_TRANSPORTE,?CRITERIO_SELECCIO' +
        'N,?APARTADO,?LETRA,?COD_NATURALEZA_PELIGRO,?COD_MEDIDAS_PROTECCI' +
        'ON,?COD_CLASIF,?COD_RESTRICCION_TUNEL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_QUI_CATEGORIAS_TRANSPORTE'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_QUI_CATEGORIAS_TRANSPORTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_QUI_CATEGORIAS_TRANSPORTE'
      'SET'
      '  NUMERO_UN=?NUMERO_UN '
      '  ,IDENTIFICACION_RIESGOS=?IDENTIFICACION_RIESGOS '
      '  ,CONSIDERACIONES_ESP=?CONSIDERACIONES_ESP '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,VEHICULO_TANQUES=?VEHICULO_TANQUES '
      '  ,TANQUE_UN=?TANQUE_UN '
      '  ,TANQUE_PORTATIL=?TANQUE_PORTATIL '
      '  ,ENVASADO=?ENVASADO '
      '  ,CANTIDADES_LIMITADAS=?CANTIDADES_LIMITADAS '
      '  ,PROVISIONES_ESP=?PROVISIONES_ESP '
      '  ,ETIQUETAS=?ETIQUETAS '
      '  ,ACTIVO=?ACTIVO '
      '  ,PACKING_GROUP=?PACKING_GROUP '
      '  ,CLASE=?CLASE '
      '  ,CATEGORIA_TRANSPORTE=?CATEGORIA_TRANSPORTE '
      '  ,CRITERIO_SELECCION=?CRITERIO_SELECCION '
      '  ,APARTADO=?APARTADO '
      '  ,LETRA=?LETRA '
      '  ,COD_NATURALEZA_PELIGRO=?COD_NATURALEZA_PELIGRO'
      '  ,COD_MEDIDAS_PROTECCION=?COD_MEDIDAS_PROTECCION'
      '  ,COD_CLASIF=?COD_CLASIF'
      '  ,COD_RESTRICCION_TUNEL=?COD_RESTRICCION_TUNEL'
      'WHERE'
      '  CODIGO=?CODIGO ')
    BeforePost = QMCatTransporteBeforePost
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_QUI_CATEGORIAS_TRANSPORTE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 44
    Top = 16
    object QMCatTransporteCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object QMCatTransporteDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMCatTransporteACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCatTransporteNUMERO_UN: TFloatField
      DisplayLabel = 'N'#250'm. UN'
      FieldName = 'NUMERO_UN'
    end
    object QMCatTransporteCLASE: TFIBStringField
      DisplayLabel = 'Clase'
      FieldName = 'CLASE'
      Size = 15
    end
    object QMCatTransportePACKING_GROUP: TFIBStringField
      DisplayLabel = 'Pack. Group'
      FieldName = 'PACKING_GROUP'
      Size = 15
    end
    object QMCatTransporteETIQUETAS: TFIBStringField
      DisplayLabel = 'Etiquetas'
      FieldName = 'ETIQUETAS'
      Size = 40
    end
    object QMCatTransportePROVISIONES_ESP: TFIBStringField
      DisplayLabel = 'Provisiones Esp.'
      FieldName = 'PROVISIONES_ESP'
    end
    object QMCatTransporteCANTIDADES_LIMITADAS: TFIBStringField
      DisplayLabel = 'Cant. Limitadas'
      FieldName = 'CANTIDADES_LIMITADAS'
      Size = 40
    end
    object QMCatTransporteENVASADO: TFIBStringField
      DisplayLabel = 'Envasado'
      FieldName = 'ENVASADO'
      Size = 40
    end
    object QMCatTransporteVEHICULO_TANQUES: TFIBStringField
      DisplayLabel = 'Veh'#237'culo Tanques'
      FieldName = 'VEHICULO_TANQUES'
      Size = 40
    end
    object QMCatTransporteCONSIDERACIONES_ESP: TFIBStringField
      DisplayLabel = 'Consideraciones Esp.'
      FieldName = 'CONSIDERACIONES_ESP'
      Size = 100
    end
    object QMCatTransporteIDENTIFICACION_RIESGOS: TFIBStringField
      DisplayLabel = 'Ident. Riesgos'
      FieldName = 'IDENTIFICACION_RIESGOS'
      Size = 40
    end
    object QMCatTransporteCATEGORIA_TRANSPORTE: TIntegerField
      DisplayLabel = 'Cat. Transp.'
      FieldName = 'CATEGORIA_TRANSPORTE'
    end
    object QMCatTransporteCRITERIO_SELECCION: TFIBStringField
      DisplayLabel = 'Crit. Selecci'#243'n'
      FieldName = 'CRITERIO_SELECCION'
      Size = 100
    end
    object QMCatTransporteAPARTADO: TFIBStringField
      DisplayLabel = 'Apartado'
      FieldName = 'APARTADO'
      Size = 4
    end
    object QMCatTransporteLETRA: TFIBStringField
      DisplayLabel = 'Letra'
      FieldName = 'LETRA'
      Size = 4
    end
    object QMCatTransporteTANQUE_PORTATIL: TFIBStringField
      DisplayLabel = 'Tanque UN Port'#225'til'
      FieldName = 'TANQUE_PORTATIL'
      Size = 40
    end
    object QMCatTransporteTANQUE_UN: TFIBStringField
      DisplayLabel = 'Tanque ADR'
      FieldName = 'TANQUE_UN'
      Size = 40
    end
    object QMCatTransporteCOD_CLASIF: TFIBStringField
      DisplayLabel = 'Cod. Clasif.'
      FieldName = 'COD_CLASIF'
      Size = 4
    end
    object QMCatTransporteCOD_NATURALEZA_PELIGRO: TIntegerField
      DisplayLabel = 'Cod. Nat. Peligro'
      FieldName = 'COD_NATURALEZA_PELIGRO'
    end
    object QMCatTransporteCOD_MEDIDAS_PROTECCION: TIntegerField
      DisplayLabel = 'Cod. Medidas Protec.'
      FieldName = 'COD_MEDIDAS_PROTECCION'
    end
    object QMCatTransporteCOD_RESTRICCION_TUNEL: TFIBStringField
      DisplayLabel = 'Cod. Restric. Tunel'
      FieldName = 'COD_RESTRICCION_TUNEL'
      Size = 15
    end
  end
  object DSQMCatTransporte: TDataSource
    DataSet = QMCatTransporte
    Left = 44
    Top = 76
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 172
    Top = 72
  end
end
