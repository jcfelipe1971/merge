object DMEnvio: TDMEnvio
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 362
  Top = 225
  Height = 310
  Width = 527
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
    Top = 8
  end
  object QMEnvio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ENVIO'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ESTADO,FECHA_RIG,ENV' +
        'IO,CLIENTE,TERCERO,'#13#10'TITULO_CLI,DIRECCION,TITULO_DIR,LOCALIDAD,C' +
        'ODIGO_POSTAL,PAIS,ID_S,TRANSPORTISTA,NOMBRE_TRANSPORTISTA,'#13#10'TRAN' +
        'SP_INSTAL,VEHICULO_ESPECIAL,TIPO_VEHICULO,CONTACTO,TELEFONO,EMAI' +
        'L,TIPO_SERVICIO,SU_REFERENCIA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ESTADO,?FECHA' +
        '_RIG,?ENVIO,?CLIENTE,?TERCERO,'#13#10'?TITULO_CLI,?DIRECCION,?TITULO_D' +
        'IR,?LOCALIDAD,?CODIGO_POSTAL,?PAIS,?ID_S,?TRANSPORTISTA,?NOMBRE_' +
        'TRANSPORTISTA,'#13#10'?TRANSP_INSTAL,?VEHICULO_ESPECIAL,?TIPO_VEHICULO' +
        ',?CONTACTO,?TELEFONO,?EMAIL,?TIPO_SERVICIO,?SU_REFERENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ENVIO'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ENVIO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ENVIO=?ENVIO'
      'ORDER BY FECHA_RIG DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ENVIO'
      'SET'
      '  ENVIO=?ENVIO'
      '  ,TRANSP_INSTAL=?TRANSP_INSTAL '
      '  ,VEHICULO_ESPECIAL=?VEHICULO_ESPECIAL '
      '  ,TIPO_VEHICULO=?TIPO_VEHICULO '
      '  ,CONTACTO=?CONTACTO '
      '  ,TELEFONO=?TELEFONO '
      '  ,EMAIL=?EMAIL '
      '  ,TIPO_SERVICIO=?TIPO_SERVICIO '
      'WHERE'
      '  ID_S=?ID_S ')
    DataSource = DSQMCabeceraEnvio
    BeforeEdit = QMEnvioBeforeEdit
    OnNewRecord = QMEnvioNewRecord
    OnPostError = QMEnvioPostError
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_ENVIO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMEnvioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEnvioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEnvioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEnvioSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMEnvioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMEnvioRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMEnvioFECHA_RIG: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'FECHA_RIG'
    end
    object QMEnvioENVIO: TIntegerField
      DisplayLabel = 'Envio'
      FieldName = 'ENVIO'
    end
    object QMEnvioCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMEnvioTITULO_CLI: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLI'
      Size = 60
    end
    object QMEnvioTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMEnvioESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMEnvioID_S: TIntegerField
      DisplayLabel = 'ID S'
      FieldName = 'ID_S'
    end
    object QMEnvioTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEnvioDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMEnvioTITULO_DIR: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_DIR'
      Size = 40
    end
    object QMEnvioTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMEnvioNOMBRE_TRANSPORTISTA: TFIBStringField
      DisplayLabel = 'Titulo Transp.'
      FieldName = 'NOMBRE_TRANSPORTISTA'
      Size = 60
    end
    object QMEnvioTRANSP_INSTAL: TFIBStringField
      DisplayLabel = 'Transp. / Instal.'
      FieldName = 'TRANSP_INSTAL'
      Size = 60
    end
    object QMEnvioVEHICULO_ESPECIAL: TIntegerField
      DisplayLabel = 'Vehiculo Esp.'
      FieldName = 'VEHICULO_ESPECIAL'
    end
    object QMEnvioTIPO_VEHICULO: TFIBStringField
      DisplayLabel = 'Tipo Vehiculo'
      FieldName = 'TIPO_VEHICULO'
      Size = 60
    end
    object QMEnvioCONTACTO: TFIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      Size = 60
    end
    object QMEnvioTELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Size = 60
    end
    object QMEnvioEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMEnvioTIPO_SERVICIO: TFIBStringField
      DisplayLabel = 'Tipo Servicio'
      FieldName = 'TIPO_SERVICIO'
      Size = 60
    end
    object QMEnvioLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMEnvioCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMEnvioPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object QMEnvioSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMEnvioPALETS: TFloatField
      DisplayLabel = 'Palets'
      FieldName = 'PALETS'
    end
    object QMEnvioBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMEnvioPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMEnvioVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMEnvioCODIGO_EXPEDICION: TFIBStringField
      DisplayLabel = 'Cod. Expedicion'
      FieldName = 'CODIGO_EXPEDICION'
      Size = 40
    end
  end
  object DSQMEnvio: TDataSource
    DataSet = QMEnvio
    Left = 168
    Top = 56
  end
  object DSxZona: TDataSource
    DataSet = xZona
    Left = 168
    Top = 104
  end
  object xZona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * '
      'FROM SYS_ZONAS'
      'WHERE ZONA=?ZONA')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_ZONAS'
      'WHERE ZONA=?ZONA')
    UniDirectional = False
    DataSource = DSQMCabeceraEnvio
    Left = 48
    Top = 104
    object xZonaZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object xZonaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xZonaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMinCliente: TDataSource
    DataSet = xMinCliente
    Left = 440
    Top = 56
  end
  object xMinCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MIN(CLIENTE) FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    Left = 328
    Top = 56
    object IntegerField3: TIntegerField
      DisplayLabel = 'Min.'
      FieldName = 'MIN'
    end
  end
  object DSxMaxCliente: TDataSource
    DataSet = xMaxCliente
    Left = 440
    Top = 104
  end
  object xMaxCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MAX(CLIENTE) FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    Left = 328
    Top = 104
    object IntegerField4: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object QMCabeceraEnvio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_ENVIO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ENVIO=?old_ENVIO ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_ENVIO'
      
        '  (FECHA_ENV,NOTAS,PORTES,MEDIDAS,ENVIO,EMPRESA,MATRICULA,SERVID' +
        'O,BULTOS,TITULO,RUTA,ZONA)'
      'VALUES'
      
        '  (?FECHA_ENV,?NOTAS,?PORTES,?MEDIDAS,?ENVIO,?EMPRESA,?MATRICULA' +
        ',?SERVIDO,?BULTOS,?TITULO,?RUTA,?ZONA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_ENVIO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ENVIO=?ENVIO ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_ENVIO'
      'WHERE '
      'EMPRESA=?EMPRESA'
      'ORDER BY ENVIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_ENVIO'
      'SET'
      '  FECHA_ENV=?FECHA_ENV '
      '  ,NOTAS=?NOTAS '
      '  ,PORTES=?PORTES '
      '  ,MEDIDAS=?MEDIDAS '
      '  ,MATRICULA=?MATRICULA '
      '  ,SERVIDO=?SERVIDO '
      '  ,BULTOS=?BULTOS '
      '  ,TITULO=?TITULO '
      '  ,RUTA=?RUTA '
      '  ,ZONA=?ZONA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ENVIO=?ENVIO ')
    AfterDelete = Graba
    AfterOpen = QMCabeceraEnvioAfterOpen
    AfterPost = Graba
    AfterScroll = QMCabeceraEnvioAfterScroll
    BeforeClose = QMCabeceraEnvioBeforeClose
    BeforeEdit = QMCabeceraEnvioBeforeEdit
    BeforePost = QMCabeceraEnvioBeforePost
    OnCalcFields = QMCabeceraEnvioCalcFields
    OnNewRecord = QMCabeceraEnvioNewRecord
    OnPostError = QMCabeceraEnvioPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ENVIO ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_ENVIO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMCabeceraEnvioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEnvioENVIO: TIntegerField
      DisplayLabel = 'Envio'
      FieldName = 'ENVIO'
    end
    object QMCabeceraEnvioTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMCabeceraEnvioFECHA_ENV: TDateTimeField
      DisplayLabel = 'Fecha Env.'
      FieldName = 'FECHA_ENV'
    end
    object QMCabeceraEnvioRUTA: TFIBStringField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      OnChange = QMCabeceraEnvioRUTAChange
      Size = 3
    end
    object QMCabeceraEnvioNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraEnvioSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMCabeceraEnvioMATRICULA: TFIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRICULA'
      Size = 40
    end
    object QMCabeceraEnvioBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCabeceraEnvioPORTES: TFloatField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCabeceraEnvioMEDIDAS: TMemoField
      DisplayLabel = 'Medidas'
      FieldName = 'MEDIDAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraEnvioTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMCabeceraEnvioZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      OnChange = QMCabeceraEnvioZONAChange
      Size = 15
    end
  end
  object DSQMCabeceraEnvio: TDataSource
    DataSet = QMCabeceraEnvio
    Left = 168
    Top = 8
  end
  object xMinMax: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MIN(SERIE) FROM EMP_SERIES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    DataSource = DSQMCabeceraEnvio
    Left = 328
    Top = 152
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Min.'
      FieldName = 'MIN'
      Size = 10
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 440
    Top = 8
  end
end
