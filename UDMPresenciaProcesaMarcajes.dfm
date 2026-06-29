object DMPresenciaProcesaMarcajes: TDMPresenciaProcesaMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 829
  Top = 317
  Height = 440
  Width = 467
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 16
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
    Top = 16
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 19
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_OPE_PRESENCIA_MARCAJE'
      'WHERE'
      '  ID_OPE_PRESENCIA_MARCAJE=?old_ID_OPE_PRESENCIA_MARCAJE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_OPE_PRESENCIA_MARCAJE'
      
        '  (ID_OPE_PRESENCIA_MARCAJE,'#13#10'FECHA_MARCAJE,IDENTIFICADOR_EMPLEA' +
        'DO,IDENTIFICADOR_DISPOSITIVO,IDENTIFICADOR_TIPO_MARCAJE,IDENTIFI' +
        'CADOR_INCIDENCIA,LATITUD,LONGITUD,ID_EMPLEADO,ID_DISPOSITIVO,'#13#10'T' +
        'ITULO_DISPOSITIVO,TIPO_MARCAJE,TITULO_TIPO_MARCAJE,ID_INCIDENCIA' +
        ',ESTADO,TITULO_ESTADO,ERROR_AL_PROCESAR,ID_CAB_PRESENCIA,ID_DET_' +
        'PRESENCIA,'#13#10'ENTRADA_AGRUPACION,USUARIO_CREACION,USUARIO_MODIFICA' +
        'CION,FECHA_CREACION,FECHA_MODIFICACION,MOTIVO_MODIFICACION,VALOR' +
        'ES_ORIGINALES)'
      'VALUES'
      
        '  (?ID_OPE_PRESENCIA_MARCAJE,'#13#10'?FECHA_MARCAJE,?IDENTIFICADOR_EMP' +
        'LEADO,?IDENTIFICADOR_DISPOSITIVO,?IDENTIFICADOR_TIPO_MARCAJE,?ID' +
        'ENTIFICADOR_INCIDENCIA,?LATITUD,?LONGITUD,?ID_EMPLEADO,?ID_DISPO' +
        'SITIVO,'#13#10'?TITULO_DISPOSITIVO,?TIPO_MARCAJE,?TITULO_TIPO_MARCAJE,' +
        '?ID_INCIDENCIA,?ESTADO,?TITULO_ESTADO,?ERROR_AL_PROCESAR,?ID_CAB' +
        '_PRESENCIA,?ID_DET_PRESENCIA,'#13#10'?ENTRADA_AGRUPACION,?USUARIO_CREA' +
        'CION,?USUARIO_MODIFICACION,?FECHA_CREACION,?FECHA_MODIFICACION,?' +
        'MOTIVO_MODIFICACION,?VALORES_ORIGINALES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_OPE_PRESENCIA_MARCAJE'
      'WHERE'
      '  ID_OPE_PRESENCIA_MARCAJE=?ID_OPE_PRESENCIA_MARCAJE ')
    SelectSQL.Strings = (
      'SELECT '
      '    ID_OPE_PRESENCIA_MARCAJE,'
      '    FECHA_MARCAJE,'
      '    IDENTIFICADOR_EMPLEADO,'
      '    IDENTIFICADOR_DISPOSITIVO,'
      '    IDENTIFICADOR_TIPO_MARCAJE,'
      '    IDENTIFICADOR_INCIDENCIA,'
      '    LATITUD,'
      '    LONGITUD,'
      '    ID_EMPLEADO,'
      '    TITULO_EMPLEADO,'
      '    ID_DISPOSITIVO,'
      '    TITULO_DISPOSITIVO,'
      '    TIPO_MARCAJE,'
      '    TITULO_TIPO_MARCAJE,'
      '    ID_INCIDENCIA,'
      '    TITULO_INCIDENCIA,'
      '    ESTADO,'
      '    TITULO_ESTADO,'
      '    ERROR_AL_PROCESAR,'
      '    ID_CAB_PRESENCIA,'
      '    ID_DET_PRESENCIA,'
      '    ENTRADA_AGRUPACION,'
      '    USUARIO_CREACION,'
      '    USUARIO_MODIFICACION,'
      '    FECHA_CREACION,'
      '    FECHA_MODIFICACION,'
      '    MOTIVO_MODIFICACION'
      'FROM VER_OPE_PRESENCIA_MARCAJE'
      'WHERE'
      'ESTADO = 0'
      'ORDER BY FECHA_MARCAJE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_OPE_PRESENCIA_MARCAJE'
      'SET'
      '  FECHA_MARCAJE=?FECHA_MARCAJE '
      '  ,IDENTIFICADOR_EMPLEADO=?IDENTIFICADOR_EMPLEADO '
      '  ,IDENTIFICADOR_DISPOSITIVO=?IDENTIFICADOR_DISPOSITIVO '
      '  ,IDENTIFICADOR_TIPO_MARCAJE=?IDENTIFICADOR_TIPO_MARCAJE '
      '  ,IDENTIFICADOR_INCIDENCIA=?IDENTIFICADOR_INCIDENCIA '
      '  ,LATITUD=?LATITUD '
      '  ,LONGITUD=?LONGITUD '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,ID_DISPOSITIVO=?ID_DISPOSITIVO '
      '  ,TITULO_DISPOSITIVO=?TITULO_DISPOSITIVO '
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE '
      '  ,TITULO_TIPO_MARCAJE=?TITULO_TIPO_MARCAJE '
      '  ,ID_INCIDENCIA=?ID_INCIDENCIA '
      '  ,ESTADO=?ESTADO '
      '  ,TITULO_ESTADO=?TITULO_ESTADO '
      '  ,ERROR_AL_PROCESAR=?ERROR_AL_PROCESAR '
      '  ,ID_CAB_PRESENCIA=?ID_CAB_PRESENCIA '
      '  ,ID_DET_PRESENCIA=?ID_DET_PRESENCIA '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      '  ,USUARIO_CREACION=?USUARIO_CREACION '
      '  ,USUARIO_MODIFICACION=?USUARIO_MODIFICACION '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_MODIFICACION=?FECHA_MODIFICACION '
      '  ,MOTIVO_MODIFICACION=?MOTIVO_MODIFICACION '
      '  ,VALORES_ORIGINALES=?VALORES_ORIGINALES '
      'WHERE'
      '  ID_OPE_PRESENCIA_MARCAJE=?ID_OPE_PRESENCIA_MARCAJE ')
    AfterPost = QMDetalleAfterPost
    ClavesPrimarias.Strings = (
      'ID_OPE_PRESENCIA_MARCAJE ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_OPE_PRESENCIA_MARCAJE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 19
    object QMDetalleID_OPE_PRESENCIA_MARCAJE: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_OPE_PRESENCIA_MARCAJE'
      ReadOnly = True
    end
    object QMDetalleFECHA_MARCAJE: TDateTimeField
      DisplayLabel = 'Fec. Marcaje'
      FieldName = 'FECHA_MARCAJE'
      ReadOnly = True
    end
    object QMDetalleIDENTIFICADOR_EMPLEADO: TFIBStringField
      DisplayLabel = 'Ident. Empleado'
      FieldName = 'IDENTIFICADOR_EMPLEADO'
      ReadOnly = True
      Size = 25
    end
    object QMDetalleIDENTIFICADOR_DISPOSITIVO: TFIBStringField
      DisplayLabel = 'Ident. Dispositivo'
      FieldName = 'IDENTIFICADOR_DISPOSITIVO'
      ReadOnly = True
      Size = 25
    end
    object QMDetalleIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Ident. Tipo Marcaje'
      FieldName = 'IDENTIFICADOR_TIPO_MARCAJE'
      ReadOnly = True
      Size = 25
    end
    object QMDetalleIDENTIFICADOR_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Ident. Incidencia'
      FieldName = 'IDENTIFICADOR_INCIDENCIA'
      ReadOnly = True
      Size = 25
    end
    object QMDetalleLATITUD: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'LATITUD'
      ReadOnly = True
    end
    object QMDetalleLONGITUD: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
      ReadOnly = True
    end
    object QMDetalleID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empl.'
      FieldName = 'ID_EMPLEADO'
      ReadOnly = True
    end
    object QMDetalleID_DISPOSITIVO: TIntegerField
      DisplayLabel = 'Id Disp.'
      FieldName = 'ID_DISPOSITIVO'
      ReadOnly = True
    end
    object QMDetalleTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPO_MARCAJE'
      ReadOnly = True
      Size = 3
    end
    object QMDetalleID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Id Incidencia'
      FieldName = 'ID_INCIDENCIA'
      OnChange = QMDetalleID_INCIDENCIAChange
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      ReadOnly = True
    end
    object QMDetalleERROR_AL_PROCESAR: TFIBStringField
      DisplayLabel = 'Error al procesar'
      FieldName = 'ERROR_AL_PROCESAR'
      ReadOnly = True
      Size = 100
    end
    object QMDetalleID_CAB_PRESENCIA: TIntegerField
      DisplayLabel = 'Id Cab. Presencia'
      FieldName = 'ID_CAB_PRESENCIA'
      ReadOnly = True
    end
    object QMDetalleID_DET_PRESENCIA: TIntegerField
      DisplayLabel = 'Id Det. Presencia'
      FieldName = 'ID_DET_PRESENCIA'
      ReadOnly = True
    end
    object QMDetalleENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Selec.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMDetalleTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Inicidencia'
      FieldName = 'TITULO_INCIDENCIA'
      ReadOnly = True
      Size = 60
    end
    object QMDetalleTITULO_EMPLEADO: TFIBStringField
      DisplayLabel = 'Empleado'
      FieldName = 'TITULO_EMPLEADO'
      ReadOnly = True
      Size = 60
    end
    object QMDetalleTITULO_DISPOSITIVO: TFIBStringField
      DisplayLabel = 'Dispositivo'
      FieldName = 'TITULO_DISPOSITIVO'
      ReadOnly = True
      Size = 60
    end
    object QMDetalleTITULO_TIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Desc. Tipo Marcaje'
      FieldName = 'TITULO_TIPO_MARCAJE'
      ReadOnly = True
      Size = 60
    end
    object QMDetalleTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Desc. Estado'
      FieldName = 'TITULO_ESTADO'
      ReadOnly = True
      Size = 40
    end
    object QMDetalleUSUARIO_CREACION: TIntegerField
      DisplayLabel = 'Usu. Creacion'
      FieldName = 'USUARIO_CREACION'
      ReadOnly = True
    end
    object QMDetalleUSUARIO_MODIFICACION: TIntegerField
      DisplayLabel = 'Usu. Modif.'
      FieldName = 'USUARIO_MODIFICACION'
      ReadOnly = True
    end
    object QMDetalleFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
      ReadOnly = True
    end
    object QMDetalleFECHA_MODIFICACION: TDateTimeField
      DisplayLabel = 'Fec. Modif.'
      FieldName = 'FECHA_MODIFICACION'
      ReadOnly = True
    end
    object QMDetalleMOTIVO_MODIFICACION: TFIBStringField
      DisplayLabel = 'Motivo Modif.'
      FieldName = 'MOTIVO_MODIFICACION'
      ReadOnly = True
      Size = 60
    end
  end
end
