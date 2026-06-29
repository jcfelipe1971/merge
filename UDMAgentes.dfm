object DMAgentes: TDMAgentes
  OldCreateOrder = False
  OnCreate = DMAgentesCreate
  OnDestroy = DMAgentesDestroy
  Left = 733
  Top = 191
  Height = 541
  Width = 586
  object QMAgentes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_AGENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_AGENTES_CUENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,AGENTE,P_COMISION,TERCERO,NOTAS,CUE' +
        'NTA,CUENTA_PAGO,CUENTA_PGC,TITULO,'#13#10'TIT_LOCALIDAD,CODIGO_POSTAL,' +
        'BAJA,FECHA_BAJA,MOTIVO_BAJA,WEB_LOGIN,WEB_PASS,ENTRADA_WEB,ENVIA' +
        'R_COPIA_OFC,ENVIAR_COPIA_ALB,'#13#10'ENVIAR_COPIA_PEC,ENVIAR_COPIA_FAC' +
        ',FECHA_ALTA,CODIGO_NTV,TITULO_REGION,TITULO_PROVINCIA,TITULO_POB' +
        'LACION,TITULO_CODIGO_POSTAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?AGENTE,?P_COMISION,?TERCERO,?NO' +
        'TAS,?CUENTA,?CUENTA_PAGO,?CUENTA_PGC,?TITULO,'#13#10'?TIT_LOCALIDAD,?C' +
        'ODIGO_POSTAL,?BAJA,?FECHA_BAJA,?MOTIVO_BAJA,?WEB_LOGIN,?WEB_PASS' +
        ',?ENTRADA_WEB,?ENVIAR_COPIA_OFC,?ENVIAR_COPIA_ALB,'#13#10'?ENVIAR_COPI' +
        'A_PEC,?ENVIAR_COPIA_FAC,?FECHA_ALTA,?CODIGO_NTV,?TITULO_REGION,?' +
        'TITULO_PROVINCIA,?TITULO_POBLACION,?TITULO_CODIGO_POSTAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_AGENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      'ORDER BY AGENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGENTES_CUENTAS'
      'SET'
      '  P_COMISION=?P_COMISION '
      '  ,TERCERO=?TERCERO '
      '  ,NOTAS=?NOTAS '
      '  ,CUENTA=?CUENTA '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      '  ,CUENTA_PGC=?CUENTA_PGC '
      '  ,TITULO=?TITULO '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,BAJA=?BAJA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,WEB_LOGIN=?WEB_LOGIN '
      '  ,WEB_PASS=?WEB_PASS '
      '  ,ENTRADA_WEB=?ENTRADA_WEB '
      '  ,ENVIAR_COPIA_OFC=?ENVIAR_COPIA_OFC '
      '  ,ENVIAR_COPIA_ALB=?ENVIAR_COPIA_ALB '
      '  ,ENVIAR_COPIA_PEC=?ENVIAR_COPIA_PEC '
      '  ,ENVIAR_COPIA_FAC=?ENVIAR_COPIA_FAC '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,CODIGO_NTV=?CODIGO_NTV '
      '  ,TITULO_REGION=?TITULO_REGION '
      '  ,TITULO_PROVINCIA=?TITULO_PROVINCIA '
      '  ,TITULO_POBLACION=?TITULO_POBLACION '
      '  ,TITULO_CODIGO_POSTAL=?TITULO_CODIGO_POSTAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE ')
    AfterOpen = QMAgentesAfterOpen
    BeforeClose = QMAgentesBeforeClose
    BeforeEdit = QMAgentesBeforeEdit
    BeforePost = QMAgentesBeforePost
    OnNewRecord = QMAgentesNewRecord
    OnPostError = QMAgentesPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AGENTES_CUENTAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_AGE'
      'EMP_AGENTES')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CUENTA'
      'EMPRESA,AGENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMAgentesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgentesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgentesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgentesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAgentesP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
    object QMAgentesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMAgentesTERCEROChange
    end
    object QMAgentesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAgentesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMAgentesCUENTA_PAGO: TFIBStringField
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMAgentesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgentesTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMAgentesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMAgentesBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMAgentesFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMAgentesMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object QMAgentesENVIAR_COPIA_OFC: TIntegerField
      DisplayLabel = 'Recibir copia Oferta'
      FieldName = 'ENVIAR_COPIA_OFC'
    end
    object QMAgentesENVIAR_COPIA_PEC: TIntegerField
      DisplayLabel = 'Recibir copia Pedido'
      FieldName = 'ENVIAR_COPIA_PEC'
    end
    object QMAgentesENVIAR_COPIA_ALB: TIntegerField
      DisplayLabel = 'Recibir copia Albaran'
      FieldName = 'ENVIAR_COPIA_ALB'
    end
    object QMAgentesENVIAR_COPIA_FAC: TIntegerField
      DisplayLabel = 'Enviar Copia Fac.'
      FieldName = 'ENVIAR_COPIA_FAC'
    end
    object QMAgentesFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMAgentesTITULO_REGION: TFIBStringField
      DisplayLabel = 'Titulo Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object QMAgentesTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Titulo Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMAgentesTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Titulo Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object QMAgentesTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Titulo Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object QMAgentesCODIGO_NTV: TFIBStringField
      DisplayLabel = 'Codigo NTV'
      FieldName = 'CODIGO_NTV'
    end
  end
  object DSQMAgentes: TDataSource
    DataSet = QMAgentes
    Left = 128
    Top = 16
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 128
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 464
    Top = 16
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL FROM VER_TERCEROS'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 32
    Top = 112
    object xTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'R'#39' and '
      
        'agrupacion not in (select agrupacion from emp_agrupaciones_agent' +
        'es where empresa=?empresa and agente =?agente)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 32
    Top = 208
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 128
    Top = 208
  end
  object DSQMAgrupSonCom: TDataSource
    DataSet = QMAgrupSonCom
    Left = 128
    Top = 304
  end
  object QMAgrupSonCom: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_AGRUPACIONES_AGE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  AGRUPACION=?old_AGRUPACION AND '
      '  AGENTE=?old_AGENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_AGRUPACIONES_AGE'
      '  (AGRUPACION,TITULO,EMPRESA,AGENTE)'
      'VALUES'
      '  (?AGRUPACION,?TITULO,?EMPRESA,?AGENTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGRUPACIONES_AGE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  AGENTE=?AGENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACIONES_AGE'
      'where empresa=?empresa and agente=?agente and tipo='#39'C'#39
      'order by agrupacion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGRUPACIONES_AGE'
      'SET'
      '  TITULO=?TITULO ,'
      '  COMISION=?COMISION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  AGENTE=?AGENTE ')
    DataSource = DSQMAgentes
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'AGRUPACION '
      'AGENTE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AGRUPACIONES_AGE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 304
    object QMAgrupSonComAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMAgrupSonComTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMAgrupSonComEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgrupSonComAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAgrupSonComCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
  end
  object xAgrupDispCom: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'C'#39' and '
      
        'agrupacion not in (select agrupacion from emp_agrupaciones_age w' +
        'here empresa=?empresa and agente =?agente)'
      'order by agrupacion'
      '')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 32
    Top = 352
  end
  object DSxAgrupDispCom: TDataSource
    DataSet = xAgrupDispCom
    Left = 128
    Top = 352
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 128
    Top = 160
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM VER_AGRUPACIONES_AGENTES'
      'where empresa=?empresa and agente=?agente'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 32
    Top = 160
  end
  object xIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_INCIDENCIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO_TERCERO=?TIPO_TERCERO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO AND '
      '  INCIDENCIA=?INCIDENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'COD_CLI_PRO =  ?AGENTE AND'
      'TIPO_TERCERO = '#39'AGE'#39
      'ORDER BY INCIDENCIA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMAgentes
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TIPO_TERCERO '
      'COD_CLI_PRO '
      'INCIDENCIA ')
    AccionesInhibidas = [Borrar, Insertar, Modificar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INCIDENCIAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 400
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_INCIDENCIA'
      Size = 60
    end
    object xIncidenciasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xIncidenciasFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recepci'#243'n'
      FieldName = 'FECHA_RECEPCION'
    end
    object xIncidenciasTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Terc.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Pro.'
      FieldName = 'COD_CLI_PRO'
    end
    object xIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Incidencia'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fecha Resp.'
      FieldName = 'FECHA_RESPUESTA'
    end
    object xIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Respuesta'
      FieldName = 'RESPUESTA_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xIncidenciasID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xIncidenciasDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xIncidenciasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_RIG'
    end
    object xIncidenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xIncidenciasDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object xIncidenciasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 76
    end
    object xIncidenciasAGENTE: TIntegerField
      DisplayLabel = 'Age.'
      FieldName = 'AGENTE'
    end
    object xIncidenciasCONTACTO: TIntegerField
      DisplayLabel = 'Cont. 1'
      FieldName = 'CONTACTO'
    end
    object xIncidenciasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Contacto 1'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xIncidenciasCONTACTO2: TIntegerField
      DisplayLabel = 'Cont. 2'
      FieldName = 'CONTACTO2'
    end
    object xIncidenciasTIT_CONTACTO2: TFIBStringField
      DisplayLabel = 'Contacto 2'
      FieldName = 'TIT_CONTACTO2'
      Size = 81
    end
    object xIncidenciasCONTACTO3: TIntegerField
      DisplayLabel = 'Cont. 3'
      FieldName = 'CONTACTO3'
    end
    object xIncidenciasTIT_CONTACTO3: TFIBStringField
      DisplayLabel = 'Contacto 3'
      FieldName = 'TIT_CONTACTO3'
      Size = 81
    end
    object xIncidenciasTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Agente'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Inc.'
      FieldName = 'TIPO_INCIDENCIA_KRI'
      Size = 3
    end
    object xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Desc. Tipo Inc.'
      FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
      Size = 40
    end
    object xIncidenciasUSUARIO: TIntegerField
      DisplayLabel = 'Usu.'
      FieldName = 'USUARIO'
    end
    object xIncidenciasNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
    object xIncidenciasHORAS: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object xIncidenciasFINALIZADO: TIntegerField
      DisplayLabel = 'Finalizado'
      FieldName = 'FINALIZADO'
    end
  end
  object DSxIncidencias: TDataSource
    DataSet = xIncidencias
    Left = 128
    Top = 400
  end
  object QMMargenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_AGENTES_COMISIONES_MARGEN'
      'WHERE'
      '  MARGEN=?old_MARGEN AND '
      '  AGENTE=?old_AGENTE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_AGENTES_COMISIONES_MARGEN'
      '  (EMPRESA,EJERCICIO,CANAL,AGENTE,PORCENTAJE,MARGEN)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?PORCENTAJE,?MARGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_AGENTES_COMISIONES_MARGEN'
      'WHERE'
      '  MARGEN=?MARGEN AND '
      '  AGENTE=?AGENTE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_AGENTES_COMISIONES_MARGEN'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)and'
      '           (agente=?agente))'
      'order by margen')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_AGENTES_COMISIONES_MARGEN'
      'SET'
      '  PORCENTAJE=?PORCENTAJE '
      'WHERE'
      '  MARGEN=?MARGEN AND '
      '  AGENTE=?AGENTE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMAgentes
    BeforeEdit = AntesDeEditarMargenes
    BeforeInsert = AntesDeEditarMargenes
    OnNewRecord = QMMargenesNewRecord
    ClavesPrimarias.Strings = (
      'MARGEN '
      'AGENTE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_AGENTES_COMISIONES_MARGEN'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 224
    Top = 16
    object QMMargenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMargenesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMargenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMargenesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMMargenesPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMMargenesMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSQMMargenes: TDataSource
    DataSet = QMMargenes
    Left = 320
    Top = 16
  end
  object QMPrevision: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_AGENTES_COMISIONES_PREV'
      'WHERE'
      '  MARGEN=?old_MARGEN AND '
      '  AGENTE=?old_AGENTE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_AGENTES_COMISIONES_PREV'
      '  (EMPRESA,EJERCICIO,CANAL,AGENTE,MARGEN,PORCENTAJE)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?MARGEN,?PORCENTAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_AGENTES_COMISIONES_PREV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  MARGEN=?MARGEN')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_AGENTES_COMISIONES_PREV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE'
      'ORDER BY MARGEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_AGENTES_COMISIONES_PREV'
      'SET'
      '  PORCENTAJE=?PORCENTAJE '
      'WHERE'
      '  MARGEN=?MARGEN AND '
      '  AGENTE=?AGENTE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMAgentes
    BeforeEdit = AntesDeEditarPrevision
    BeforeInsert = AntesDeEditarPrevision
    OnNewRecord = QMPrevisionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'MARGEN'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_AGENTES_COMISIONES_PREV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 224
    Top = 64
    object QMPrevisionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPrevisionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPrevisionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPrevisionAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMPrevisionMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMPrevisionPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMPrevision: TDataSource
    DataSet = QMPrevision
    Left = 320
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 512
    Top = 16
  end
  object xComunicaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_COMUNICACIONES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_COMUNICACIONES'
      
        '  (ID,EMPRESA,TIPO,COD_CLI_PRO,FECHA_CREACION,FECHA_MODIFICACION' +
        ',ARCHIVO,DESCRIPCION)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?TIPO,?COD_CLI_PRO,?FECHA_CREACION,?FECHA_MODIFI' +
        'CACION,?ARCHIVO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_COMUNICACIONES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COMUNICACIONES'
      'WHERE'
      ' EMPRESA=?EMPRESA AND'
      ' TIPO='#39'CLI'#39' AND'
      ' COD_CLI_PRO=?CLIENTE'
      ' ORDER BY ID desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_COMUNICACIONES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TIPO=?TIPO '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_MODIFICACION=?FECHA_MODIFICACION '
      '  ,ARCHIVO=?ARCHIVO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      ' ')
    BeforePost = xComunicacionesBeforePost
    OnNewRecord = xComunicacionesNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_COMUNICACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 256
    object xComunicacionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xComunicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xComunicacionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xComunicacionesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLI_PRO'
    end
    object xComunicacionesARCHIVO: TFIBStringField
      DisplayLabel = 'Archivo'
      FieldName = 'ARCHIVO'
      Size = 100
    end
    object xComunicacionesFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fecha Creaci'#243'n'
      FieldName = 'FECHA_CREACION'
    end
    object xComunicacionesFECHA_MODIFICACION: TDateTimeField
      DisplayLabel = 'Fecha Modificaci'#243'n'
      FieldName = 'FECHA_MODIFICACION'
    end
    object xComunicacionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
  end
  object DSxComunicaciones: TDataSource
    DataSet = xComunicaciones
    Left = 128
    Top = 256
  end
  object QMZonas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_AGENTES_ZONAS'
      'WHERE'
      '  ZONA=?old_ZONA AND '
      '  AGENTE=?old_AGENTE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_AGENTES_ZONAS'
      '  (EMPRESA,AGENTE,ZONA,P_COMISION)'
      'VALUES'
      '  (?EMPRESA,?AGENTE,?ZONA,?P_COMISION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_AGENTES_ZONAS'
      'WHERE'
      '  ZONA=?ZONA AND '
      '  AGENTE=?AGENTE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_AGENTES_ZONAS'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE'
      'ORDER BY ZONA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_AGENTES_ZONAS'
      'SET P_COMISION=?P_COMISION'
      'WHERE'
      '  ZONA=?ZONA AND '
      '  AGENTE=?AGENTE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMAgentes
    OnNewRecord = QMZonasNewRecord
    ClavesPrimarias.Strings = (
      'ZONA '
      'AGENTE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_AGENTES_ZONAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 448
    object QMZonasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMZonasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMZonasZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMZonasTITULO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMZonasTITULOGetText
      Size = 60
      Calculated = True
    end
    object QMZonasP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
  end
  object DSQMZonas: TDataSource
    DataSet = QMZonas
    Left = 128
    Top = 448
  end
  object QMCalculoComisiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_AGENTES_COMISIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_AGENTES_COMISIONES'
      
        '  (SERIE_FAC,UNIDADES,PRECIO,P_COSTE,B_IMPONIBLE,LIQUIDO,FECHA,C' +
        'OMISION,AGENTE,RIG_FAC,LINEA_FAC,ID_S,ID_DETALLES_S,DESCUENTO,DE' +
        'SCUENTO_2,DESCUENTO_3,P_COMISION_AGENTE,P_COMISION_ESCALADO,P_CO' +
        'MISION,ID_E,ID_DETALLES_E,P_COMISION_ZONA,EMPRESA,CANAL,EMPRESA_' +
        'FAC,EJERCICIO_FAC,CANAL_FAC,BLOQUEADO,TIPO_FAC,ARTICULO,ZONA,PAG' +
        'ADO,FECHA_PAGO)'
      'VALUES'
      
        '  (?SERIE_FAC,?UNIDADES,?PRECIO,?P_COSTE,?B_IMPONIBLE,?LIQUIDO,?' +
        'FECHA,?COMISION,?AGENTE,?RIG_FAC,?LINEA_FAC,?ID_S,?ID_DETALLES_S' +
        ',?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?P_COMISION_AGENTE,?P_COMI' +
        'SION_ESCALADO,?P_COMISION,?ID_E,?ID_DETALLES_E,?P_COMISION_ZONA,' +
        '?EMPRESA,?CANAL,?EMPRESA_FAC,?EJERCICIO_FAC,?CANAL_FAC,?BLOQUEAD' +
        'O,?TIPO_FAC,?ARTICULO,?ZONA,?PAGADO,?FECHA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT CLIENTE'
      '        FROM GES_CABECERAS_S '
      '        WHERE'
      '        ID_S = C.ID_S) CLIENTE,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM GES_CABECERAS_S F'
      '        JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO'
      '        WHERE'
      '        F.ID_S = C.ID_S) TITULO_CLI,'
      '       (SELECT TITULO_LARGO '
      '        FROM ART_ARTICULOS'
      '        WHERE'
      '        EMPRESA = C.EMPRESA AND'
      '        ARTICULO = C.ARTICULO) TITULO_ART'
      'FROM EMP_AGENTES_COMISIONES C'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.AGENTE = :AGENTE AND'
      'C.ID_DETALLES_S = ?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT CLIENTE'
      '        FROM GES_CABECERAS_S '
      '        WHERE'
      '        ID_S = C.ID_S) CLIENTE,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM GES_CABECERAS_S F'
      '        JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO'
      '        WHERE'
      '        F.ID_S = C.ID_S) TITULO_CLI,'
      '       (SELECT TITULO_LARGO '
      '        FROM ART_ARTICULOS'
      '        WHERE'
      '        EMPRESA = C.EMPRESA AND'
      '        ARTICULO = C.ARTICULO) TITULO_ART'
      'FROM EMP_AGENTES_COMISIONES C'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.AGENTE = :AGENTE AND'
      'C.FECHA BETWEEN :DFECHA AND :HFECHA'
      'ORDER BY C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, C.LINEA_FAC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_AGENTES_COMISIONES'
      'SET'
      '  P_COMISION_AGENTE=?P_COMISION_AGENTE '
      '  ,P_COMISION_ESCALADO=?P_COMISION_ESCALADO '
      '  ,P_COMISION_ZONA=?P_COMISION_ZONA '
      '  ,BLOQUEADO=?BLOQUEADO '
      '  ,PAGADO=?PAGADO '
      '  ,FECHA_PAGO=?FECHA_PAGO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    DataSource = DSQMAgentes
    BeforePost = QMCalculoComisionesBeforePost
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_AGENTES_COMISIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 224
    Top = 208
    object QMCalculoComisionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCalculoComisionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCalculoComisionesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCalculoComisionesEMPRESA_FAC: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA_FAC'
    end
    object QMCalculoComisionesEJERCICIO_FAC: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_FAC'
    end
    object QMCalculoComisionesCANAL_FAC: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_FAC'
    end
    object QMCalculoComisionesSERIE_FAC: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_FAC'
      Size = 10
    end
    object QMCalculoComisionesTIPO_FAC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_FAC'
      Size = 3
    end
    object QMCalculoComisionesRIG_FAC: TIntegerField
      DisplayLabel = 'Fact.'
      FieldName = 'RIG_FAC'
    end
    object QMCalculoComisionesLINEA_FAC: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_FAC'
    end
    object QMCalculoComisionesID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCalculoComisionesID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMCalculoComisionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCalculoComisionesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMCalculoComisionesPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCalculoComisionesDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMCalculoComisionesDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMCalculoComisionesDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMCalculoComisionesP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMCalculoComisionesB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'B_IMPONIBLE'
    end
    object QMCalculoComisionesLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCalculoComisionesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCalculoComisionesP_COMISION_AGENTE: TFloatField
      DisplayLabel = 'P. Com. Age.'
      FieldName = 'P_COMISION_AGENTE'
    end
    object QMCalculoComisionesP_COMISION_ESCALADO: TFloatField
      DisplayLabel = 'P. Com. Esc.'
      FieldName = 'P_COMISION_ESCALADO'
    end
    object QMCalculoComisionesP_COMISION: TFloatField
      DisplayLabel = 'P. Com.'
      FieldName = 'P_COMISION'
    end
    object QMCalculoComisionesCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMCalculoComisionesBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloq.'
      FieldName = 'BLOQUEADO'
    end
    object QMCalculoComisionesID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMCalculoComisionesID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMCalculoComisionesZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMCalculoComisionesP_COMISION_ZONA: TFloatField
      DisplayLabel = 'P. Com. Zona'
      FieldName = 'P_COMISION_ZONA'
    end
    object QMCalculoComisionesPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMCalculoComisionesFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QMCalculoComisionesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCalculoComisionesTITULO_CLI: TFIBStringField
      DisplayLabel = 'Titulo Cli.'
      FieldName = 'TITULO_CLI'
      Size = 60
    end
    object QMCalculoComisionesTITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      DisplayWidth = 256
      FieldName = 'TITULO_ART'
      Size = 256
    end
  end
  object DSCalculoComisiones: TDataSource
    DataSet = QMCalculoComisiones
    Left = 320
    Top = 208
  end
  object QMAgentesSub: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_AGENTES_SUB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  AGENTE_SUB=?old_AGENTE_SUB ')
    InsertSQL.Strings = (
      'INSERT INTO VER_AGENTES_SUB'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,AGENTE_SUB,TERCERO_SUB,TITULO,' +
        'P_COMISION)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?AGENTE_SUB,?TERCERO_SUB,?' +
        'TITULO,?P_COMISION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGENTES_SUB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGENTE_SUB=?AGENTE_SUB ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGENTES_SUB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE'
      'ORDER BY AGENTE, AGENTE_SUB')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGENTES_SUB'
      'SET'
      '  TERCERO_SUB=?TERCERO_SUB '
      '  ,TITULO=?TITULO '
      '  ,AGENTE_SUB=?AGENTE_SUB '
      '  ,P_COMISION=?P_COMISION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGENTE_SUB=?old_AGENTE_SUB ')
    DataSource = DSQMAgentes
    OnNewRecord = QMAgentesSubNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'AGENTE_SUB ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AGENTES_SUB'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_AGE'
      'EMP_AGENTES')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CUENTA'
      'EMPRESA,AGENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMAgentesSubEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgentesSubEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgentesSubCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgentesSubAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAgentesSubAGENTE_SUB: TIntegerField
      DisplayLabel = 'Agente Sub.'
      FieldName = 'AGENTE_SUB'
    end
    object QMAgentesSubTERCERO_SUB: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO_SUB'
    end
    object QMAgentesSubTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgentesSubP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
  end
  object DSQMAgentesSub: TDataSource
    DataSet = QMAgentesSub
    Left = 128
    Top = 64
  end
  object xAgrupDispComArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'T'#39' and '
      
        'agrupacion not in (select agrupacion from emp_agrupaciones_age w' +
        'here empresa=?empresa and agente =?agente)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 224
    Top = 112
  end
  object DSxAgrupDispComArt: TDataSource
    DataSet = xAgrupDispComArt
    Left = 320
    Top = 112
  end
  object QMAgrupSonComArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO VER_AGRUPACIONES_AGE'
      '  (AGRUPACION,TITULO,EMPRESA,AGENTE)'
      'VALUES'
      '  (?AGRUPACION,?TITULO,?EMPRESA,?AGENTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGRUPACIONES_AGE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  AGENTE=?AGENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACIONES_AGE'
      'where empresa=?empresa and agente=?agente and tipo='#39'T'#39
      'order by agrupacion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGRUPACIONES_AGE'
      'SET'
      '  TITULO=?TITULO ,'
      '  COMISION=?COMISION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  AGENTE=?AGENTE ')
    DataSource = DSQMAgentes
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'AGRUPACION '
      'AGENTE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AGRUPACIONES_AGE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 224
    Top = 160
    object QMAgrupSonComArtAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMAgrupSonComArtTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMAgrupSonComArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgrupSonComArtAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAgrupSonComArtCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMAgrupSonComArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object DSQMAgrupSonComArt: TDataSource
    DataSet = QMAgrupSonComArt
    Left = 320
    Top = 160
  end
  object QMCalculoComisionesAgrupado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT C.ID_S, C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, SUM(C.B_' +
        'IMPONIBLE) B_IMPONIBLE, SUM(C.LIQUIDO) LIQUIDO,'
      
        '       AVG(C.P_COMISION_AGENTE) P_COMISION_AGENTE, AVG(C.P_COMIS' +
        'ION_ESCALADO) P_COMISION_ESCALADO,'
      
        '       (SUM(C.COMISION) * 100 / SUM(C.B_IMPONIBLE)) AS P_COMISIO' +
        'N, C.ZONA, AVG(C.P_COMISION_ZONA) P_COMISION_ZONA,'
      '       SUM(C.COMISION) COMISION, C.BLOQUEADO, C.PAGADO, C.FECHA,'
      '       (SELECT CLIENTE'
      '        FROM GES_CABECERAS_S '
      '        WHERE'
      '        ID_S = C.ID_S) CLIENTE,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM GES_CABECERAS_S F'
      '        JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO'
      '        WHERE'
      '        F.ID_S = C.ID_S) TITULO_CLI'
      'FROM EMP_AGENTES_COMISIONES C'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.AGENTE = :AGENTE AND'
      'C.ID_S = :ID_S'
      
        'GROUP BY C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, C.ID_S, C.ZONA' +
        ', C.PAGADO, C.BLOQUEADO, C.FECHA')
    SelectSQL.Strings = (
      
        'SELECT C.ID_S, C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, SUM(C.B_' +
        'IMPONIBLE) B_IMPONIBLE, SUM(C.LIQUIDO) LIQUIDO,'
      
        '       AVG(C.P_COMISION_AGENTE) P_COMISION_AGENTE, AVG(C.P_COMIS' +
        'ION_ESCALADO) P_COMISION_ESCALADO,'
      '       CASE'
      '         WHEN SUM(C.B_IMPONIBLE) = 0 THEN'
      '             0'
      '         ELSE (SUM(C.COMISION) * 100 / SUM(C.B_IMPONIBLE))'
      '       END AS P_COMISION,'
      
        '       C.ZONA, AVG(C.P_COMISION_ZONA) P_COMISION_ZONA, SUM(C.COM' +
        'ISION) COMISION, C.BLOQUEADO, C.PAGADO, C.FECHA,'
      '       (SELECT CLIENTE'
      '        FROM GES_CABECERAS_S'
      '        WHERE'
      '        ID_S = C.ID_S) CLIENTE,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM GES_CABECERAS_S F'
      '        JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO'
      '        WHERE'
      '        F.ID_S = C.ID_S) TITULO_CLI'
      'FROM EMP_AGENTES_COMISIONES C'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.AGENTE = :AGENTE AND'
      'C.FECHA BETWEEN :DFECHA AND :HFECHA'
      
        'GROUP BY C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, C.ID_S, C.ZONA' +
        ', C.BLOQUEADO, C.PAGADO, C.FECHA')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 224
    Top = 256
    object QMCalculoComisionesAgrupadoID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMCalculoComisionesAgrupadoEJERCICIO_FAC: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_FAC'
    end
    object QMCalculoComisionesAgrupadoSERIE_FAC: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_FAC'
      Size = 10
    end
    object QMCalculoComisionesAgrupadoRIG_FAC: TIntegerField
      DisplayLabel = 'Fact.'
      FieldName = 'RIG_FAC'
    end
    object QMCalculoComisionesAgrupadoB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'B_IMPONIBLE'
    end
    object QMCalculoComisionesAgrupadoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCalculoComisionesAgrupadoP_COMISION_AGENTE: TFloatField
      DisplayLabel = 'P. Com. Age.'
      FieldName = 'P_COMISION_AGENTE'
    end
    object QMCalculoComisionesAgrupadoP_COMISION_ESCALADO: TFloatField
      DisplayLabel = 'P. Com. Esc.'
      FieldName = 'P_COMISION_ESCALADO'
    end
    object QMCalculoComisionesAgrupadoP_COMISION: TFloatField
      DisplayLabel = 'P. Com.'
      FieldName = 'P_COMISION'
    end
    object QMCalculoComisionesAgrupadoZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMCalculoComisionesAgrupadoP_COMISION_ZONA: TFloatField
      DisplayLabel = 'P. Com. Zona'
      FieldName = 'P_COMISION_ZONA'
    end
    object QMCalculoComisionesAgrupadoCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMCalculoComisionesAgrupadoBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloq.'
      FieldName = 'BLOQUEADO'
    end
    object QMCalculoComisionesAgrupadoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCalculoComisionesAgrupadoTITULO_CLI: TFIBStringField
      DisplayLabel = 'Titulo Cli.'
      FieldName = 'TITULO_CLI'
      Size = 60
    end
    object QMCalculoComisionesAgrupadoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object QMCalculoComisionesAgrupadoPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
  end
  object DSCalculoComisionesAgrupado: TDataSource
    DataSet = QMCalculoComisionesAgrupado
    Left = 320
    Top = 256
  end
end
